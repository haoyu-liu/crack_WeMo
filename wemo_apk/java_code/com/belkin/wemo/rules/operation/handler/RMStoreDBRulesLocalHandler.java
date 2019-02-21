package com.belkin.wemo.rules.operation.handler;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import com.belkin.wemo.rules.device.callback.RMStoreDeviceRulesErrorCallback;
import com.belkin.wemo.rules.device.callback.RMStoreDeviceRulesSuccesCallback;
import com.belkin.wemo.rules.device.error.RMRuleDeviceError;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesTypeErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesTypeSuccessCallback;
import com.belkin.wemo.rules.operation.runnable.RMStoreDevDBRulesLocalRunnable;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class RMStoreDBRulesLocalHandler
{
  private static final String TAG = RMStoreDBRulesLocalHandler.class.getSimpleName();
  private RMStoreRulesTypeErrorCallback errorCallback;
  private List<DeviceInformation> nonRuleDeviceList;
  private HashMap<String, Object> params;
  private RMDBRule rule;
  private List<DeviceInformation> ruleDeviceList;
  private RMStoreRulesTypeSuccessCallback successCallback;
  
  public RMStoreDBRulesLocalHandler(RMStoreRulesTypeErrorCallback paramRMStoreRulesTypeErrorCallback, RMStoreRulesTypeSuccessCallback paramRMStoreRulesTypeSuccessCallback, RMDBRule paramRMDBRule, HashMap<String, Object> paramHashMap)
  {
    this.errorCallback = paramRMStoreRulesTypeErrorCallback;
    this.successCallback = paramRMStoreRulesTypeSuccessCallback;
    this.rule = paramRMDBRule;
    this.params = paramHashMap;
    this.ruleDeviceList = new ArrayList();
    this.nonRuleDeviceList = new ArrayList();
  }
  
  private void extractRuleAndNonRuleDeviceList(List<DeviceInformation> paramList)
  {
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
      if (isRuleDevice(localDeviceInformation.getUDN())) {
        this.ruleDeviceList.add(localDeviceInformation);
      } else {
        this.nonRuleDeviceList.add(localDeviceInformation);
      }
    }
    SDKLogUtils.debugLog(TAG, "STORE RULES: Online Rule Devices Count: " + this.ruleDeviceList.size() + "; NON Rule devices count: " + this.nonRuleDeviceList.size() + "; Total Rule Devices Count: " + this.rule.getRuleDeviceSet().size());
  }
  
  private boolean isRuleDevice(String paramString)
  {
    boolean bool = false;
    Iterator localIterator = this.rule.getRuleDeviceSet().iterator();
    while (localIterator.hasNext()) {
      if (((RMDBRuleDevice)localIterator.next()).getUiUdn().equals(paramString)) {
        bool = true;
      }
    }
    SDKLogUtils.debugLog(TAG, "Store Rules - UDN: " + paramString + "; Is RULE DEVICE: " + bool);
    return bool;
  }
  
  public void process(List<DeviceInformation> paramList)
  {
    extractRuleAndNonRuleDeviceList(paramList);
    if (!this.rule.isDelete)
    {
      if (this.ruleDeviceList.size() > 0)
      {
        RuleDevicesStoreDeviceRulesCallback localRuleDevicesStoreDeviceRulesCallback2 = new RuleDevicesStoreDeviceRulesCallback(this.ruleDeviceList.size(), null);
        Iterator localIterator2 = this.ruleDeviceList.iterator();
        while (localIterator2.hasNext())
        {
          DeviceInformation localDeviceInformation2 = (DeviceInformation)localIterator2.next();
          WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMStoreDevDBRulesLocalRunnable(this.rule, localDeviceInformation2, this.params, localRuleDevicesStoreDeviceRulesCallback2, localRuleDevicesStoreDeviceRulesCallback2));
        }
      }
      SDKLogUtils.errorLog(TAG, "NO Rule Device is ONLINE. Thus rule cannot be saved.");
      if (this.errorCallback != null) {
        this.errorCallback.onSingleTypeStoreFailed(2, new ArrayList());
      }
    }
    for (;;)
    {
      return;
      RuleDevicesStoreDeviceRulesCallback localRuleDevicesStoreDeviceRulesCallback1 = new RuleDevicesStoreDeviceRulesCallback(paramList.size(), null);
      Iterator localIterator1 = paramList.iterator();
      while (localIterator1.hasNext())
      {
        DeviceInformation localDeviceInformation1 = (DeviceInformation)localIterator1.next();
        WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMStoreDevDBRulesLocalRunnable(this.rule, localDeviceInformation1, this.params, localRuleDevicesStoreDeviceRulesCallback1, localRuleDevicesStoreDeviceRulesCallback1));
        SDKLogUtils.debugLog(TAG, "Rule Deleted");
      }
    }
  }
  
  private class NonRuleDevicesStoreRulesCallback
    extends RMStoreDBRulesLocalHandler.RuleDevicesStoreDeviceRulesCallback
  {
    public NonRuleDevicesStoreRulesCallback(int paramInt)
    {
      super(paramInt, null);
    }
    
    public void onError(RMRuleDeviceError paramRMRuleDeviceError)
    {
      try
      {
        this.devicesStoreRulesCallbackCount = (1 + this.devicesStoreRulesCallbackCount);
        SDKLogUtils.errorLog(RMStoreDBRulesLocalHandler.TAG, "STORE Rules for NON RULE Devices: ERROR: " + paramRMRuleDeviceError.getDeviceUdn() + "; Device fetched count yet: " + this.devicesStoreRulesCallbackCount + "; Total NON rule devices count: " + this.devicesCount + "; ERROR CODE: " + paramRMRuleDeviceError.getErrorCode() + "; MESSAGE: " + paramRMRuleDeviceError.getErrorMessage());
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public void onSuccess(String paramString)
    {
      try
      {
        this.devicesStoreRulesCallbackCount = (1 + this.devicesStoreRulesCallbackCount);
        SDKLogUtils.debugLog(RMStoreDBRulesLocalHandler.TAG, "STORE Rules for NON Rule Devices: storeRules SUCCESS for device: " + paramString + "; Device callbacks received: " + this.devicesStoreRulesCallbackCount + "; NON Rule devices count: " + this.devicesCount);
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
  }
  
  private class RuleDevicesStoreDeviceRulesCallback
    implements RMStoreDeviceRulesErrorCallback, RMStoreDeviceRulesSuccesCallback
  {
    protected int devicesCount;
    protected int devicesStoreRulesCallbackCount;
    private int ruleDeviceErrorCount;
    private List<String> storeErrorUDNList;
    
    private RuleDevicesStoreDeviceRulesCallback(int paramInt)
    {
      this.devicesCount = paramInt;
      this.storeErrorUDNList = new ArrayList();
    }
    
    private void onRulesSyncAttemptsComplete()
    {
      SDKLogUtils.infoLog(RMStoreDBRulesLocalHandler.TAG, "Store Rules: All RULE devices callbacks received.");
      if (this.ruleDeviceErrorCount == this.devicesCount)
      {
        SDKLogUtils.errorLog(RMStoreDBRulesLocalHandler.TAG, "Store Rules: Store rule on ALL RULE DEVICES FAILED. Rule devices count: " + this.devicesCount);
        if (RMStoreDBRulesLocalHandler.this.errorCallback != null) {
          RMStoreDBRulesLocalHandler.this.errorCallback.onSingleTypeStoreFailed(2, this.storeErrorUDNList);
        }
      }
      do
      {
        return;
        int i = RMStoreDBRulesLocalHandler.this.nonRuleDeviceList.size();
        if (i > 0)
        {
          RMStoreDBRulesLocalHandler.NonRuleDevicesStoreRulesCallback localNonRuleDevicesStoreRulesCallback = new RMStoreDBRulesLocalHandler.NonRuleDevicesStoreRulesCallback(RMStoreDBRulesLocalHandler.this, i);
          Iterator localIterator = RMStoreDBRulesLocalHandler.this.nonRuleDeviceList.iterator();
          while (localIterator.hasNext())
          {
            DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
            WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMStoreDevDBRulesLocalRunnable(RMStoreDBRulesLocalHandler.this.rule, localDeviceInformation, RMStoreDBRulesLocalHandler.this.params, localNonRuleDevicesStoreRulesCallback, localNonRuleDevicesStoreRulesCallback));
          }
        }
      } while (RMStoreDBRulesLocalHandler.this.successCallback == null);
      RMStoreDBRulesLocalHandler.this.successCallback.onSingleTypeStoreSuccess(2, this.storeErrorUDNList);
    }
    
    public void onError(RMRuleDeviceError paramRMRuleDeviceError)
    {
      try
      {
        this.devicesStoreRulesCallbackCount = (1 + this.devicesStoreRulesCallbackCount);
        this.ruleDeviceErrorCount = (1 + this.ruleDeviceErrorCount);
        String str = paramRMRuleDeviceError.getDeviceUdn();
        this.storeErrorUDNList.add(str);
        SDKLogUtils.errorLog(RMStoreDBRulesLocalHandler.TAG, "STORE Rules for RULE DEVICES: ERROR for device: " + str + "; RULE Device fetched count yet: " + this.devicesStoreRulesCallbackCount + "; Total RULE devices count: " + this.devicesCount + "; ERROR CODE: " + paramRMRuleDeviceError.getErrorCode() + "; MESSAGE: " + paramRMRuleDeviceError.getErrorMessage());
        if (this.devicesStoreRulesCallbackCount == this.devicesCount) {
          onRulesSyncAttemptsComplete();
        }
        return;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public void onSuccess(String paramString)
    {
      try
      {
        this.devicesStoreRulesCallbackCount = (1 + this.devicesStoreRulesCallbackCount);
        SDKLogUtils.infoLog(RMStoreDBRulesLocalHandler.TAG, "STORE Rules for RULE DEVICES: SUCCESS for device: " + paramString + "; RULE Device fetched count yet: " + this.devicesStoreRulesCallbackCount + "; Total RULE devices count: " + this.devicesCount);
        if (this.devicesStoreRulesCallbackCount == this.devicesCount) {
          onRulesSyncAttemptsComplete();
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */