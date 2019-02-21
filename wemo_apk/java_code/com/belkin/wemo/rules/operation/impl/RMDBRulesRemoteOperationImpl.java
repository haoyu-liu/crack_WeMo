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
import com.belkin.wemo.rules.operation.handler.RMStoreDBRulesRemoteResponseHandler;
import com.belkin.wemo.rules.operation.handler.RMSyncDBRulesRemoteResponseHandler;
import com.belkin.wemo.rules.operation.runnable.RMStoreDBRulesNoStoreRemoteRunnable;
import com.belkin.wemo.rules.operation.runnable.RMStoreDBRulesWithStoreRemoteRunnable;
import com.belkin.wemo.rules.operation.runnable.RMSyncDBRulesNoStoreRemoteRunnable;
import com.belkin.wemo.rules.operation.runnable.RMSyncDBRulesWithStoreRemoteRunnable;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class RMDBRulesRemoteOperationImpl
  implements RMIRulesOperation<RMDBRule>
{
  private RMIRulesUtils rulesUtils;
  
  public RMDBRulesRemoteOperationImpl(RMIRulesUtils paramRMIRulesUtils)
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
        localRMFetchDBRulesResponseHandler.onSuccess(localDeviceInformation.getRulesDBVersion(), "No path required for remote", localDeviceInformation.getUDN());
      }
    }
  }
  
  public void storeRules(List<DeviceInformation> paramList, RMDBRule paramRMDBRule, HashMap<String, Object> paramHashMap, RMStoreRulesTypeSuccessCallback paramRMStoreRulesTypeSuccessCallback, RMStoreRulesTypeErrorCallback paramRMStoreRulesTypeErrorCallback)
  {
    if ((paramList == null) || (paramList.isEmpty())) {
      if (paramRMStoreRulesTypeErrorCallback != null) {
        paramRMStoreRulesTypeErrorCallback.onSingleTypeRulesStoreError(new RMRulesTypeError(300, "No device is online.", 2));
      }
    }
    ArrayList localArrayList2;
    RMStoreDBRulesRemoteResponseHandler localRMStoreDBRulesRemoteResponseHandler;
    do
    {
      return;
      ArrayList localArrayList1 = new ArrayList();
      localArrayList2 = new ArrayList();
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
        if (this.rulesUtils.isFetchStoreRulesSupportedInRemoteDev(localDeviceInformation)) {
          localArrayList1.add(localDeviceInformation);
        } else {
          localArrayList2.add(localDeviceInformation);
        }
      }
      localRMStoreDBRulesRemoteResponseHandler = new RMStoreDBRulesRemoteResponseHandler(paramRMStoreRulesTypeErrorCallback, paramRMStoreRulesTypeSuccessCallback, paramRMDBRule.getRuleDeviceSet(), paramRMDBRule);
      if (!localArrayList1.isEmpty())
      {
        localRMStoreDBRulesRemoteResponseHandler.incrementFWTypeCount();
        SDKLogUtils.infoLog(" RMDBRulesRemoteOperationImpl", "if (!storeSupportDeviceList.isEmpty())");
        WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMStoreDBRulesWithStoreRemoteRunnable(localRMStoreDBRulesRemoteResponseHandler, localRMStoreDBRulesRemoteResponseHandler, localArrayList1, paramRMDBRule, paramHashMap, this.rulesUtils));
      }
    } while (localArrayList2.isEmpty());
    localRMStoreDBRulesRemoteResponseHandler.incrementFWTypeCount();
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMStoreDBRulesNoStoreRemoteRunnable(localRMStoreDBRulesRemoteResponseHandler, localRMStoreDBRulesRemoteResponseHandler, localArrayList2, paramRMDBRule, paramHashMap, this.rulesUtils));
  }
  
  public void syncRules(List<DeviceInformation> paramList, HashMap<String, Object> paramHashMap, RMSyncRulesTypeSuccessCallback paramRMSyncRulesTypeSuccessCallback, RMSyncRulesTypeErrorCallback paramRMSyncRulesTypeErrorCallback)
  {
    if ((paramList == null) || (paramList.isEmpty())) {
      if (paramRMSyncRulesTypeErrorCallback != null) {
        paramRMSyncRulesTypeErrorCallback.onError(new RMRulesTypeError(300, "No device is online.", 2));
      }
    }
    ArrayList localArrayList2;
    RMSyncDBRulesRemoteResponseHandler localRMSyncDBRulesRemoteResponseHandler;
    do
    {
      return;
      ArrayList localArrayList1 = new ArrayList();
      localArrayList2 = new ArrayList();
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
        if (this.rulesUtils.isFetchStoreRulesSupportedInRemoteDev(localDeviceInformation)) {
          localArrayList1.add(localDeviceInformation);
        } else {
          localArrayList2.add(localDeviceInformation);
        }
      }
      localRMSyncDBRulesRemoteResponseHandler = new RMSyncDBRulesRemoteResponseHandler(paramRMSyncRulesTypeErrorCallback, paramRMSyncRulesTypeSuccessCallback);
      if (!localArrayList1.isEmpty())
      {
        localRMSyncDBRulesRemoteResponseHandler.incrementFWCount();
        SDKLogUtils.infoLog(" RMDBRulesRemoteOperationImpl", "if (!storeSupportDeviceList.isEmpty())");
        WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMSyncDBRulesWithStoreRemoteRunnable(localRMSyncDBRulesRemoteResponseHandler, localRMSyncDBRulesRemoteResponseHandler, paramList, null, paramHashMap, this.rulesUtils));
      }
    } while (localArrayList2.isEmpty());
    localRMSyncDBRulesRemoteResponseHandler.incrementFWCount();
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMSyncDBRulesNoStoreRemoteRunnable(localRMSyncDBRulesRemoteResponseHandler, localRMSyncDBRulesRemoteResponseHandler, paramList, paramHashMap, this.rulesUtils));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/impl/RMDBRulesRemoteOperationImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */