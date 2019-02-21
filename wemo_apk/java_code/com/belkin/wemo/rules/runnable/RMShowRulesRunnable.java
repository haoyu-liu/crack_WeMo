package com.belkin.wemo.rules.runnable;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.error.WeMoError;
import com.belkin.wemo.rules.callback.RMShowRulesErrorCallback;
import com.belkin.wemo.rules.callback.RMShowRulesSuccessCallback;
import com.belkin.wemo.rules.data.RMLocationInfo;
import com.belkin.wemo.rules.data.RMRule;
import com.belkin.wemo.rules.data.RMUserLocation;
import com.belkin.wemo.rules.data.RMUserRules;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.fetch.RMFetchRulesManager;
import com.belkin.wemo.rules.fetch.callback.RMFetchRulesErrorCallback;
import com.belkin.wemo.rules.fetch.callback.RMFetchRulesSuccessCallback;
import com.belkin.wemo.rules.location.RMLocationInfoManager;
import com.belkin.wemo.rules.location.callback.RMReadLocationErrorCallback;
import com.belkin.wemo.rules.location.callback.RMReadLocationSuccessCallback;
import com.belkin.wemo.rules.read.RMParseRulesManager;
import com.belkin.wemo.rules.read.callback.RMParseRulesErrorCallback;
import com.belkin.wemo.rules.read.callback.RMParseRulesSuccessCallback;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.util.List;

public class RMShowRulesRunnable
  extends WeMoRunnable
{
  private static final String TAG = RMShowRulesRunnable.class.getSimpleName();
  protected List<DeviceInformation> activeDeviceList;
  protected RMShowRulesErrorCallback errorCallback;
  protected RMShowRulesSuccessCallback successCallback;
  
  public RMShowRulesRunnable(RMShowRulesSuccessCallback paramRMShowRulesSuccessCallback, RMShowRulesErrorCallback paramRMShowRulesErrorCallback, List<DeviceInformation> paramList)
  {
    this.successCallback = paramRMShowRulesSuccessCallback;
    this.errorCallback = paramRMShowRulesErrorCallback;
    this.activeDeviceList = paramList;
  }
  
  public void run()
  {
    SDKLogUtils.infoLog(TAG, "Fetch Rules: fetching rules from all uPnP devices.");
    FetchRulesFromDevicesCallback localFetchRulesFromDevicesCallback = new FetchRulesFromDevicesCallback(this.successCallback, this.errorCallback);
    RMFetchRulesManager.INSTANCE.fetchAndSyncRules(localFetchRulesFromDevicesCallback, localFetchRulesFromDevicesCallback, this.activeDeviceList);
  }
  
  private abstract class FetchRulesCallback
  {
    protected RMShowRulesErrorCallback errorCallback;
    protected RMShowRulesSuccessCallback successCallback;
    
    public FetchRulesCallback(RMShowRulesSuccessCallback paramRMShowRulesSuccessCallback, RMShowRulesErrorCallback paramRMShowRulesErrorCallback)
    {
      this.successCallback = paramRMShowRulesSuccessCallback;
      this.errorCallback = paramRMShowRulesErrorCallback;
    }
  }
  
  protected class FetchRulesFromDevicesCallback
    extends RMShowRulesRunnable.FetchRulesCallback
    implements RMFetchRulesErrorCallback, RMFetchRulesSuccessCallback
  {
    public FetchRulesFromDevicesCallback(RMShowRulesSuccessCallback paramRMShowRulesSuccessCallback, RMShowRulesErrorCallback paramRMShowRulesErrorCallback)
    {
      super(paramRMShowRulesSuccessCallback, paramRMShowRulesErrorCallback);
    }
    
    public void onRulesFetchFailed(RMRulesError paramRMRulesError)
    {
      int i = paramRMRulesError.getErrorCode();
      String str = paramRMRulesError.getErrorMessage();
      SDKLogUtils.errorLog(RMShowRulesRunnable.TAG, "Fetch Rules: Rules fetching ERROR. errorCode: " + i + "; errorMesssage: " + str);
      if (this.errorCallback != null) {
        this.errorCallback.onError(new RMRulesError(i, str));
      }
    }
    
    public void onRulesFetched()
    {
      SDKLogUtils.infoLog(RMShowRulesRunnable.TAG, "Fetch Rules: Rules FETCHED successfully. Parsing rules.");
      RMShowRulesRunnable.ParseRulesCallback localParseRulesCallback = new RMShowRulesRunnable.ParseRulesCallback(RMShowRulesRunnable.this, this.successCallback, this.errorCallback);
      SDKLogUtils.infoLog(RMShowRulesRunnable.TAG, "Fetch Rules: Parsing Location Info.");
      RMLocationInfoManager.INSTANCE.read(localParseRulesCallback, localParseRulesCallback);
      SDKLogUtils.infoLog(RMShowRulesRunnable.TAG, "Fetch Rules: Parsing Rules.");
      RMParseRulesManager.INSTANCE.parseRules(localParseRulesCallback, localParseRulesCallback);
    }
  }
  
  private class ParseRulesCallback
    extends RMShowRulesRunnable.FetchRulesCallback
    implements RMParseRulesErrorCallback, RMParseRulesSuccessCallback, RMReadLocationErrorCallback, RMReadLocationSuccessCallback
  {
    private boolean areRulesParsed;
    private boolean isLocationInfoCallbackRec;
    private boolean noCallbackErrorYet = true;
    private List<RMRule> rulesList;
    
    public ParseRulesCallback(RMShowRulesSuccessCallback paramRMShowRulesSuccessCallback, RMShowRulesErrorCallback paramRMShowRulesErrorCallback)
    {
      super(paramRMShowRulesSuccessCallback, paramRMShowRulesErrorCallback);
    }
    
    private void sendError(int paramInt, String paramString)
    {
      if (this.errorCallback != null) {
        this.errorCallback.onError(new RMRulesError(paramInt, paramString));
      }
    }
    
    private void sendSuccess()
    {
      if (this.successCallback != null) {
        this.successCallback.onSuccess(this.rulesList);
      }
    }
    
    public void onLocationRead(RMLocationInfo paramRMLocationInfo)
    {
      try
      {
        if (this.noCallbackErrorYet)
        {
          this.isLocationInfoCallbackRec = true;
          RMUserLocation.getInstance().setLocationInfo(paramRMLocationInfo);
          if (this.areRulesParsed) {
            sendSuccess();
          }
        }
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public void onLocationReadFailed(RMRulesError paramRMRulesError)
    {
      try
      {
        if (this.noCallbackErrorYet)
        {
          this.noCallbackErrorYet = false;
          int i = paramRMRulesError.getErrorCode();
          String str = paramRMRulesError.getErrorMessage();
          SDKLogUtils.errorLog(RMShowRulesRunnable.TAG, "Fetch Rules: Location Info parsing failed. errorCode: " + i + "; errorMesssage: " + str);
          sendError(i, str);
        }
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public void onNoInfoLocationFound()
    {
      try
      {
        if (this.noCallbackErrorYet)
        {
          SDKLogUtils.debugLog(RMShowRulesRunnable.TAG, "Fetch Rules: No Location Info found in LOCATIONINFO table");
          this.isLocationInfoCallbackRec = true;
          if (this.areRulesParsed) {
            sendSuccess();
          }
        }
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public void onRulesParsed(List<RMRule> paramList)
    {
      try
      {
        if (this.noCallbackErrorYet)
        {
          this.areRulesParsed = true;
          SDKLogUtils.infoLog(RMShowRulesRunnable.TAG, "Fetch Rules: Rules parsed successfully. Adding rules to UserRules. rules count: " + paramList.size());
          RMUserRules.INSTANCE.setRulesList(paramList);
          this.rulesList = paramList;
          if (this.isLocationInfoCallbackRec) {
            sendSuccess();
          }
        }
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public void onRulesParsingFailed(WeMoError paramWeMoError)
    {
      try
      {
        if (this.noCallbackErrorYet)
        {
          this.noCallbackErrorYet = false;
          int i = paramWeMoError.getErrorCode();
          String str = paramWeMoError.getErrorMessage();
          SDKLogUtils.errorLog(RMShowRulesRunnable.TAG, "Fetch Rules: Rules parsing FAILED. errorCode: " + i + "; errorMesssage: " + str);
          sendError(i, str);
        }
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/runnable/RMShowRulesRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */