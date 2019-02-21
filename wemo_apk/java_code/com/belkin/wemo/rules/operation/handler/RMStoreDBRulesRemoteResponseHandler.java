package com.belkin.wemo.rules.operation.handler;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.data.device.RMDBRuleDevice;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.error.RMRulesTypeError;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesRemoteErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesRemoteSuccessCallback;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesTypeErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesTypeSuccessCallback;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class RMStoreDBRulesRemoteResponseHandler
  implements RMStoreRulesRemoteSuccessCallback, RMStoreRulesRemoteErrorCallback
{
  private static final String TAG = RMStoreDBRulesRemoteResponseHandler.class.getSimpleName();
  private boolean anyRuleDeviceCallFailed;
  private int callbacksReceivedCount;
  private RMStoreRulesTypeErrorCallback errorCallback;
  private int fwVersionsCount;
  private List<DeviceInformation> nonRuleDeviceList;
  private RMDBRule rule;
  private List<DeviceInformation> ruleDeviceList;
  private Set<RMDBRuleDevice> ruleDeviceSet;
  private RMStoreRulesTypeSuccessCallback successCallback;
  
  public RMStoreDBRulesRemoteResponseHandler(RMStoreRulesTypeErrorCallback paramRMStoreRulesTypeErrorCallback, RMStoreRulesTypeSuccessCallback paramRMStoreRulesTypeSuccessCallback, Set<RMDBRuleDevice> paramSet, RMDBRule paramRMDBRule)
  {
    this.errorCallback = paramRMStoreRulesTypeErrorCallback;
    this.successCallback = paramRMStoreRulesTypeSuccessCallback;
    this.ruleDeviceSet = paramSet;
    this.ruleDeviceList = new ArrayList();
    this.nonRuleDeviceList = new ArrayList();
    this.rule = paramRMDBRule;
  }
  
  private boolean containsRuleDevice(List<DeviceInformation> paramList)
  {
    String str;
    Iterator localIterator2;
    do
    {
      Iterator localIterator1 = paramList.iterator();
      while (!localIterator2.hasNext())
      {
        if (!localIterator1.hasNext()) {
          break;
        }
        str = ((DeviceInformation)localIterator1.next()).getUDN();
        localIterator2 = this.ruleDeviceSet.iterator();
      }
    } while (!str.equals(((RMDBRuleDevice)localIterator2.next()).getUiUdn()));
    SDKLogUtils.errorLog(TAG, "Store Rules (Remote): Rule device contained in Failed Cloud Call. UDN: " + str);
    return true;
    return false;
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
    if ((this.ruleDeviceSet != null) && (this.nonRuleDeviceList != null) && (this.rule.getRuleDeviceSet() != null)) {
      SDKLogUtils.debugLog(TAG, "STORE RULES: Online Rule Devices Count: " + this.ruleDeviceSet.size() + "; NON Rule devices count: " + this.nonRuleDeviceList.size() + "; Total Rule Devices Count: " + this.rule.getRuleDeviceSet().size());
    }
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
  
  private void onAllDeviceCallbacksReceived()
  {
    if (this.anyRuleDeviceCallFailed) {
      if (this.errorCallback != null) {
        this.errorCallback.onSingleTypeRulesStoreError(new RMRulesTypeError(-1, "Error while processing Rules!", 2));
      }
    }
    while (this.successCallback == null) {
      return;
    }
    this.successCallback.onSingleTypeStoreSuccess(2, null);
  }
  
  public void incrementFWTypeCount()
  {
    try
    {
      this.fwVersionsCount = (1 + this.fwVersionsCount);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void onError(RMRulesError paramRMRulesError, List<DeviceInformation> paramList, int paramInt)
  {
    this.callbacksReceivedCount = (1 + this.callbacksReceivedCount);
    SDKLogUtils.errorLog(TAG, "Store Rules (Remote): sync ERROR for devices with version support Code: " + paramInt);
    if (containsRuleDevice(paramList)) {
      this.anyRuleDeviceCallFailed = true;
    }
    if (this.callbacksReceivedCount >= this.fwVersionsCount) {
      onAllDeviceCallbacksReceived();
    }
  }
  
  public void onSuccess(List<DeviceInformation> paramList, int paramInt)
  {
    extractRuleAndNonRuleDeviceList(paramList);
    if (!this.rule.isDelete) {
      if (this.ruleDeviceList.size() > 0)
      {
        this.callbacksReceivedCount = (1 + this.callbacksReceivedCount);
        SDKLogUtils.debugLog(TAG, "Store Rules (Remote): sync SUCESS for devices with version support Code: " + paramInt);
        if ((this.callbacksReceivedCount >= this.fwVersionsCount) && (this.successCallback != null)) {
          onAllDeviceCallbacksReceived();
        }
      }
    }
    do
    {
      do
      {
        return;
        SDKLogUtils.errorLog(TAG, "NO Rule Device is ONLINE. Thus rule cannot be saved.");
      } while (this.errorCallback == null);
      this.errorCallback.onSingleTypeStoreFailed(2, new ArrayList());
      return;
      this.callbacksReceivedCount = (1 + this.callbacksReceivedCount);
      SDKLogUtils.debugLog(TAG, "Store Rules (Remote): sync SUCESS for devices with version support Code: " + paramInt);
    } while ((this.callbacksReceivedCount < this.fwVersionsCount) || (this.successCallback == null));
    onAllDeviceCallbacksReceived();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */