package com.belkin.wemo.rules.operation.handler;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.device.callback.RMStoreDeviceRulesErrorCallback;
import com.belkin.wemo.rules.device.callback.RMStoreDeviceRulesSuccesCallback;
import com.belkin.wemo.rules.device.error.RMRuleDeviceError;
import com.belkin.wemo.rules.operation.callback.RMSyncRulesTypeErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMSyncRulesTypeSuccessCallback;
import java.util.ArrayList;

public class RMSyncDBRulesLocalResponseHandler
  implements RMStoreDeviceRulesErrorCallback, RMStoreDeviceRulesSuccesCallback
{
  private static final String TAG = RMSyncDBRulesLocalResponseHandler.class.getSimpleName();
  private int callbacksReceivedCount;
  private ArrayList<String> devicesNotSynedUDNList;
  private int devicesToSyncCount;
  private RMSyncRulesTypeErrorCallback errorCallback;
  private RMSyncRulesTypeSuccessCallback successCallback;
  
  public RMSyncDBRulesLocalResponseHandler(RMSyncRulesTypeErrorCallback paramRMSyncRulesTypeErrorCallback, RMSyncRulesTypeSuccessCallback paramRMSyncRulesTypeSuccessCallback, int paramInt)
  {
    this.errorCallback = paramRMSyncRulesTypeErrorCallback;
    this.successCallback = paramRMSyncRulesTypeSuccessCallback;
    this.devicesToSyncCount = paramInt;
    this.devicesNotSynedUDNList = new ArrayList();
  }
  
  private void onAllDeviceCallbacksReceived()
  {
    int i = this.devicesNotSynedUDNList.size();
    SDKLogUtils.debugLog(TAG, "Store Rules: All Sync Rules Callbacks received. Devices Not synced count = " + i + "; Total devices count = " + this.devicesToSyncCount);
    if (i < this.devicesToSyncCount) {
      if (this.successCallback != null) {
        this.successCallback.onSingleTypeRulesSynced(2);
      }
    }
    while (this.errorCallback == null) {
      return;
    }
    this.errorCallback.onSingleTypeRulesSyncError(2, this.devicesNotSynedUDNList);
  }
  
  public void onError(RMRuleDeviceError paramRMRuleDeviceError)
  {
    try
    {
      this.callbacksReceivedCount = (1 + this.callbacksReceivedCount);
      SDKLogUtils.errorLog(TAG, "Sync Rules: sync ERROR for device: " + paramRMRuleDeviceError.getDeviceUdn() + "\n Total device synced yet count: " + this.callbacksReceivedCount);
      this.devicesNotSynedUDNList.add(paramRMRuleDeviceError.getDeviceUdn());
      if (this.callbacksReceivedCount == this.devicesToSyncCount) {
        onAllDeviceCallbacksReceived();
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
      this.callbacksReceivedCount = (1 + this.callbacksReceivedCount);
      SDKLogUtils.debugLog(TAG, "Sync Rules: sync SUCCESS for device: " + paramString + "\n Total device synced yet count: " + this.callbacksReceivedCount);
      if (this.callbacksReceivedCount == this.devicesToSyncCount) {
        onAllDeviceCallbacksReceived();
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */