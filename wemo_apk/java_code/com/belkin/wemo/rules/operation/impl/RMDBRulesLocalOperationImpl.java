package com.belkin.wemo.rules.operation.impl;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.error.RMRulesTypeError;
import com.belkin.wemo.rules.operation.RMIRulesOperation;
import com.belkin.wemo.rules.operation.callback.RMFetchRulesTypeErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMFetchRulesTypeSuccessCallback;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesTypeErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesTypeSuccessCallback;
import com.belkin.wemo.rules.operation.callback.RMSyncRulesTypeErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMSyncRulesTypeSuccessCallback;
import com.belkin.wemo.rules.operation.handler.RMFetchDBRulesResponseHandler;
import com.belkin.wemo.rules.operation.handler.RMStoreDBRulesLocalHandler;
import com.belkin.wemo.rules.operation.handler.RMSyncDBRulesLocalResponseHandler;
import com.belkin.wemo.rules.operation.runnable.RMFetchDevDBRulesLocalRunnable;
import com.belkin.wemo.rules.operation.runnable.RMSyncDevDBRulesLocalRunnable;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

class RMDBRulesLocalOperationImpl
  implements RMIRulesOperation<RMDBRule>
{
  private static final String TAG = RMDBRulesLocalOperationImpl.class.getSimpleName();
  private RMIRulesUtils rulesUtils;
  
  public RMDBRulesLocalOperationImpl(RMIRulesUtils paramRMIRulesUtils)
  {
    this.rulesUtils = paramRMIRulesUtils;
  }
  
  public void fetchRules(List<DeviceInformation> paramList, RMFetchRulesTypeSuccessCallback paramRMFetchRulesTypeSuccessCallback, RMFetchRulesTypeErrorCallback paramRMFetchRulesTypeErrorCallback)
  {
    if ((paramList == null) || (paramList.isEmpty())) {
      if (paramRMFetchRulesTypeErrorCallback != null) {
        paramRMFetchRulesTypeErrorCallback.onSingleTypeRulesFetchError(new RMRulesTypeError(300, "No device is online.", 2));
      }
    }
    for (;;)
    {
      return;
      RMFetchDBRulesResponseHandler localRMFetchDBRulesResponseHandler = new RMFetchDBRulesResponseHandler(paramRMFetchRulesTypeSuccessCallback, paramRMFetchRulesTypeErrorCallback, paramList.size(), this.rulesUtils);
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
        SDKLogUtils.debugLog(TAG, "Fetch Rules: Fetching rules (LOCAL) for device udn: " + localDeviceInformation.getUDN());
        WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMFetchDevDBRulesLocalRunnable(localDeviceInformation, localRMFetchDBRulesResponseHandler));
      }
    }
  }
  
  public void storeRules(List<DeviceInformation> paramList, RMDBRule paramRMDBRule, HashMap<String, Object> paramHashMap, RMStoreRulesTypeSuccessCallback paramRMStoreRulesTypeSuccessCallback, RMStoreRulesTypeErrorCallback paramRMStoreRulesTypeErrorCallback)
  {
    if ((paramList == null) || (paramList.isEmpty()))
    {
      if (paramRMStoreRulesTypeErrorCallback != null) {
        paramRMStoreRulesTypeErrorCallback.onSingleTypeRulesStoreError(new RMRulesTypeError(300, "No device is online.", 2));
      }
      return;
    }
    new RMStoreDBRulesLocalHandler(paramRMStoreRulesTypeErrorCallback, paramRMStoreRulesTypeSuccessCallback, paramRMDBRule, paramHashMap).process(paramList);
  }
  
  public void syncRules(List<DeviceInformation> paramList, HashMap<String, Object> paramHashMap, RMSyncRulesTypeSuccessCallback paramRMSyncRulesTypeSuccessCallback, RMSyncRulesTypeErrorCallback paramRMSyncRulesTypeErrorCallback)
  {
    if ((paramList == null) || (paramList.isEmpty())) {
      if (paramRMSyncRulesTypeErrorCallback != null) {
        paramRMSyncRulesTypeErrorCallback.onError(new RMRulesTypeError(300, "No device is online.", 2));
      }
    }
    for (;;)
    {
      return;
      RMSyncDBRulesLocalResponseHandler localRMSyncDBRulesLocalResponseHandler = new RMSyncDBRulesLocalResponseHandler(paramRMSyncRulesTypeErrorCallback, paramRMSyncRulesTypeSuccessCallback, paramList.size());
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
        WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMSyncDevDBRulesLocalRunnable(localDeviceInformation, paramHashMap, localRMSyncDBRulesLocalResponseHandler));
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/impl/RMDBRulesLocalOperationImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */