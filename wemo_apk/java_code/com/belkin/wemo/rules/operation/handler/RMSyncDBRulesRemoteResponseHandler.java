package com.belkin.wemo.rules.operation.handler;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesRemoteErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesRemoteSuccessCallback;
import com.belkin.wemo.rules.operation.callback.RMSyncRulesTypeErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMSyncRulesTypeSuccessCallback;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class RMSyncDBRulesRemoteResponseHandler
  implements RMStoreRulesRemoteSuccessCallback, RMStoreRulesRemoteErrorCallback
{
  private static final String TAG = RMSyncDBRulesRemoteResponseHandler.class.getSimpleName();
  private int callbacksReceivedCount;
  private RMSyncRulesTypeErrorCallback errorCallback;
  private int fwVersionFailedCount;
  private int fwVersionsCount;
  private RMSyncRulesTypeSuccessCallback successCallback;
  private List<String> syncFailedDeviceList;
  
  public RMSyncDBRulesRemoteResponseHandler(RMSyncRulesTypeErrorCallback paramRMSyncRulesTypeErrorCallback, RMSyncRulesTypeSuccessCallback paramRMSyncRulesTypeSuccessCallback)
  {
    this.errorCallback = paramRMSyncRulesTypeErrorCallback;
    this.successCallback = paramRMSyncRulesTypeSuccessCallback;
    this.syncFailedDeviceList = new ArrayList();
  }
  
  private void onAllDeviceCallbacksReceived()
  {
    SDKLogUtils.debugLog(TAG, "Store Rules: All Sync Rules Callbacks received. FW version failed count = " + this.fwVersionFailedCount + "; fw version count = " + this.fwVersionsCount);
    if (this.fwVersionFailedCount == this.fwVersionsCount) {
      if (this.errorCallback != null) {
        this.errorCallback.onSingleTypeRulesSyncError(2, this.syncFailedDeviceList);
      }
    }
    while (this.successCallback == null) {
      return;
    }
    this.successCallback.onSingleTypeRulesSynced(2);
  }
  
  public void incrementFWCount()
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
    this.fwVersionFailedCount = (1 + this.fwVersionFailedCount);
    SDKLogUtils.errorLog(TAG, "Store Rules (Remote): sync ERROR for devices with version support Code: " + paramInt);
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
      this.syncFailedDeviceList.add(localDeviceInformation.getUDN());
    }
    if (this.callbacksReceivedCount >= this.fwVersionsCount) {
      onAllDeviceCallbacksReceived();
    }
  }
  
  public void onSuccess(List<DeviceInformation> paramList, int paramInt)
  {
    this.callbacksReceivedCount = (1 + this.callbacksReceivedCount);
    SDKLogUtils.debugLog(TAG, "Store Rules (Remote): sync SUCCESS for devices with version support Code: " + paramInt);
    if (this.callbacksReceivedCount >= this.fwVersionsCount) {
      onAllDeviceCallbacksReceived();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/handler/RMSyncDBRulesRemoteResponseHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */