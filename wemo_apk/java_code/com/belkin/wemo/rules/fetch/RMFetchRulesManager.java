package com.belkin.wemo.rules.fetch;

import com.belkin.wemo.WeMo;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.RMIRulesDependencyProvider;
import com.belkin.wemo.rules.RMRulesSDK;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.fetch.callback.RMFetchRulesErrorCallback;
import com.belkin.wemo.rules.fetch.callback.RMFetchRulesSuccessCallback;
import com.belkin.wemo.rules.fetch.handler.RMFetchAndSyncRulesResponseHandler;
import com.belkin.wemo.rules.fetch.handler.RMFetchRulesResponseHandler;
import com.belkin.wemo.rules.operation.RMIRulesOperation;
import com.belkin.wemo.rules.operation.impl.RMDBRulesOperationFactory;
import com.belkin.wemo.rules.operation.impl.RMTNGRulesOperationFactory;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public enum RMFetchRulesManager
{
  private static final String TAG = RMFetchRulesManager.class.getSimpleName();
  
  static
  {
    RMFetchRulesManager[] arrayOfRMFetchRulesManager = new RMFetchRulesManager[1];
    arrayOfRMFetchRulesManager[0] = INSTANCE;
    $VALUES = arrayOfRMFetchRulesManager;
  }
  
  private RMFetchRulesManager() {}
  
  private void fetchDBRules(RMFetchRulesSuccessCallback paramRMFetchRulesSuccessCallback, RMFetchRulesErrorCallback paramRMFetchRulesErrorCallback, List<DeviceInformation> paramList, RMRulesSDK paramRMRulesSDK)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
      if (!DeviceListManager.getInstance(WeMo.INSTANCE.getContext()).isSmart(localDeviceInformation.getUDN())) {
        localArrayList.add(localDeviceInformation);
      }
    }
    int i = localArrayList.size();
    SDKLogUtils.debugLog(TAG, "Fetch Rules: DB based online devices count: " + i);
    if (i > 0)
    {
      localRMFetchRulesResponseHandler = new RMFetchRulesResponseHandler(1, paramRMFetchRulesSuccessCallback, paramRMFetchRulesErrorCallback, paramRMRulesSDK.getDependencyProvider().provideRulesUpdateBroadcast());
      localRMIRulesOperation = RMDBRulesOperationFactory.getInstance();
      if (localRMIRulesOperation != null) {
        localRMIRulesOperation.fetchRules(localArrayList, localRMFetchRulesResponseHandler, localRMFetchRulesResponseHandler);
      }
    }
    while (paramRMFetchRulesErrorCallback == null)
    {
      RMFetchRulesResponseHandler localRMFetchRulesResponseHandler;
      RMIRulesOperation localRMIRulesOperation;
      do
      {
        return;
      } while (paramRMFetchRulesErrorCallback == null);
      paramRMFetchRulesErrorCallback.onRulesFetchFailed(new RMRulesError());
      return;
    }
    paramRMFetchRulesErrorCallback.onRulesFetchFailed(new RMRulesError(300, "No device is online."));
  }
  
  private void fetchTNGRules(RMFetchRulesSuccessCallback paramRMFetchRulesSuccessCallback, RMFetchRulesErrorCallback paramRMFetchRulesErrorCallback, List<DeviceInformation> paramList, RMRulesSDK paramRMRulesSDK)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
      if (DeviceListManager.getInstance(WeMo.INSTANCE.getContext()).isSmart(localDeviceInformation.getUDN())) {
        localArrayList.add(localDeviceInformation);
      }
    }
    int i = localArrayList.size();
    SDKLogUtils.debugLog(TAG, "Fetch Rules: TNG based online devices count: " + i);
    if (i > 0)
    {
      localRMFetchRulesResponseHandler = new RMFetchRulesResponseHandler(1, paramRMFetchRulesSuccessCallback, paramRMFetchRulesErrorCallback, paramRMRulesSDK.getDependencyProvider().provideRulesUpdateBroadcast());
      RMTNGRulesOperationFactory.getInstance().fetchRules(localArrayList, localRMFetchRulesResponseHandler, localRMFetchRulesResponseHandler);
    }
    while (paramRMFetchRulesErrorCallback == null)
    {
      RMFetchRulesResponseHandler localRMFetchRulesResponseHandler;
      return;
    }
    paramRMFetchRulesErrorCallback.onRulesFetchFailed(new RMRulesError(300, "No device is online."));
  }
  
  public void fetchAndSyncRules(RMFetchRulesSuccessCallback paramRMFetchRulesSuccessCallback, RMFetchRulesErrorCallback paramRMFetchRulesErrorCallback, List<DeviceInformation> paramList)
  {
    RMRulesSDK localRMRulesSDK = RMRulesSDK.instance();
    if (localRMRulesSDK != null)
    {
      localArrayList1 = new ArrayList();
      localArrayList2 = new ArrayList();
      localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        localDeviceInformation = (DeviceInformation)localIterator.next();
        if (localRMRulesSDK.getDependencyProvider().provideIRulesUtils().isSmartDevice(localDeviceInformation.getUDN())) {
          localArrayList1.add(localDeviceInformation);
        } else {
          localArrayList2.add(localDeviceInformation);
        }
      }
      localRMFetchAndSyncRulesResponseHandler = new RMFetchAndSyncRulesResponseHandler(0, paramRMFetchRulesSuccessCallback, paramRMFetchRulesErrorCallback, localRMRulesSDK.getDependencyProvider().provideIRulesUtils(), localRMRulesSDK.getDependencyProvider().provideRulesUpdateBroadcast());
      i = localArrayList2.size();
      SDKLogUtils.debugLog(TAG, "Fetch Rules: DB based online devices count: " + i);
      j = 0;
      if (i > 0)
      {
        j = 0 + 1;
        localRMFetchAndSyncRulesResponseHandler.setRuleTypesCount(j);
        localRMIRulesOperation = RMDBRulesOperationFactory.getInstance();
        if (localRMIRulesOperation == null) {
          break label239;
        }
        localRMIRulesOperation.fetchRules(localArrayList2, localRMFetchAndSyncRulesResponseHandler, localRMFetchAndSyncRulesResponseHandler);
      }
    }
    label239:
    while (paramRMFetchRulesErrorCallback == null)
    {
      ArrayList localArrayList1;
      ArrayList localArrayList2;
      Iterator localIterator;
      DeviceInformation localDeviceInformation;
      RMFetchAndSyncRulesResponseHandler localRMFetchAndSyncRulesResponseHandler;
      int i;
      int j;
      RMIRulesOperation localRMIRulesOperation;
      for (;;)
      {
        if ((j == 0) && (paramRMFetchRulesErrorCallback != null)) {
          paramRMFetchRulesErrorCallback.onRulesFetchFailed(new RMRulesError(300, "No device is online."));
        }
        return;
        if (paramRMFetchRulesErrorCallback != null) {
          paramRMFetchRulesErrorCallback.onRulesFetchFailed(new RMRulesError());
        }
      }
    }
    paramRMFetchRulesErrorCallback.onRulesFetchFailed(new RMRulesError());
  }
  
  public void fetchRules(RMFetchRulesSuccessCallback paramRMFetchRulesSuccessCallback, RMFetchRulesErrorCallback paramRMFetchRulesErrorCallback, int paramInt, List<DeviceInformation> paramList)
  {
    RMRulesSDK localRMRulesSDK = RMRulesSDK.instance();
    if (localRMRulesSDK != null) {
      if (paramInt == 2) {
        fetchDBRules(paramRMFetchRulesSuccessCallback, paramRMFetchRulesErrorCallback, paramList, localRMRulesSDK);
      }
    }
    while (paramRMFetchRulesErrorCallback == null)
    {
      do
      {
        return;
        if (paramInt == 1)
        {
          fetchTNGRules(paramRMFetchRulesSuccessCallback, paramRMFetchRulesErrorCallback, paramList, localRMRulesSDK);
          return;
        }
        SDKLogUtils.errorLog(TAG, "Fetch Rules: Unknown RULES TYPE");
      } while (paramRMFetchRulesErrorCallback == null);
      paramRMFetchRulesErrorCallback.onRulesFetchFailed(new RMRulesError());
      return;
    }
    paramRMFetchRulesErrorCallback.onRulesFetchFailed(new RMRulesError());
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/fetch/RMFetchRulesManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */