package com.belkin.wemo.rules.runnable;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.error.WeMoError;
import com.belkin.wemo.rules.callback.RMShowRulesErrorCallback;
import com.belkin.wemo.rules.callback.RMShowRulesSuccessCallback;
import com.belkin.wemo.rules.data.RMLocationInfo;
import com.belkin.wemo.rules.data.RMRule;
import com.belkin.wemo.rules.data.RMUserLocation;
import com.belkin.wemo.rules.data.RMUserRules;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.location.RMLocationInfoManager;
import com.belkin.wemo.rules.location.callback.RMReadLocationErrorCallback;
import com.belkin.wemo.rules.location.callback.RMReadLocationSuccessCallback;
import com.belkin.wemo.rules.read.RMParseRulesManager;
import com.belkin.wemo.rules.read.callback.RMParseRulesErrorCallback;
import com.belkin.wemo.rules.read.callback.RMParseRulesSuccessCallback;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.util.List;

public class RMGetCacheRulesListRunnable
  extends WeMoRunnable
{
  private RMShowRulesErrorCallback errorCallback;
  private RMShowRulesSuccessCallback successCallback;
  
  public RMGetCacheRulesListRunnable(RMShowRulesSuccessCallback paramRMShowRulesSuccessCallback, RMShowRulesErrorCallback paramRMShowRulesErrorCallback)
  {
    this.successCallback = paramRMShowRulesSuccessCallback;
    this.errorCallback = paramRMShowRulesErrorCallback;
  }
  
  public void run()
  {
    ParseRulesCallback localParseRulesCallback = new ParseRulesCallback(this.successCallback, this.errorCallback);
    RMParseRulesManager.INSTANCE.parseRules(localParseRulesCallback, localParseRulesCallback);
    RMLocationInfoManager.INSTANCE.read(localParseRulesCallback, localParseRulesCallback);
  }
  
  private class ParseRulesCallback
    implements RMParseRulesErrorCallback, RMParseRulesSuccessCallback, RMReadLocationErrorCallback, RMReadLocationSuccessCallback
  {
    private boolean areRulesParsed;
    protected RMShowRulesErrorCallback errorCallback;
    private boolean isLocationInfoCallbackRec;
    private boolean noCallbackErrorYet = true;
    protected RMShowRulesSuccessCallback successCallback;
    
    public ParseRulesCallback(RMShowRulesSuccessCallback paramRMShowRulesSuccessCallback, RMShowRulesErrorCallback paramRMShowRulesErrorCallback)
    {
      this.successCallback = paramRMShowRulesSuccessCallback;
      this.errorCallback = paramRMShowRulesErrorCallback;
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
        this.successCallback.onSuccess(RMUserRules.INSTANCE.getRulesList());
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
          SDKLogUtils.errorLog(RMGetCacheRulesListRunnable.this.TAG, "Fetch Rules: Location Info parsing failed. errorCode: " + i + "; errorMesssage: " + str);
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
      if (this.noCallbackErrorYet)
      {
        SDKLogUtils.debugLog(RMGetCacheRulesListRunnable.this.TAG, "Fetch Rules: No Location Info found in LOCATIONINFO table");
        this.isLocationInfoCallbackRec = true;
        if (this.areRulesParsed) {
          sendSuccess();
        }
      }
    }
    
    public void onRulesParsed(List<RMRule> paramList)
    {
      try
      {
        if (this.noCallbackErrorYet)
        {
          this.areRulesParsed = true;
          SDKLogUtils.infoLog(RMGetCacheRulesListRunnable.this.TAG, "Fetch Rules: Rules parsed successfully. Adding rules to UserRules. rules count: " + paramList.size());
          RMUserRules.INSTANCE.setRulesList(paramList);
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
          SDKLogUtils.errorLog(RMGetCacheRulesListRunnable.this.TAG, "Fetch Rules: Rules parsing FAILED. errorCode: " + i + "; errorMesssage: " + str);
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */