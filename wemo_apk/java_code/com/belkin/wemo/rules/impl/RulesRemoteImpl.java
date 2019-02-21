package com.belkin.wemo.rules.impl;

import android.content.Context;
import com.belkin.utils.LogUtils;
import com.belkin.utils.RuleUtility;
import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.rules.IWeMoRules;
import com.belkin.wemo.rules.callback.FetchRulesAndSyncErrorCallback;
import com.belkin.wemo.rules.callback.FetchRulesAndSyncSuccessCallback;
import com.belkin.wemo.rules.callback.FetchRulesErrorCallback;
import com.belkin.wemo.rules.callback.FetchRulesSuccessCallback;
import com.belkin.wemo.rules.callback.StoreRulesErrorCallback;
import com.belkin.wemo.rules.callback.StoreRulesSuccessCallback;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.impl.handler.RMFetchDBRulesResponseHandler;
import com.belkin.wemo.rules.operation.runnable.GetDBVersionRemoteRunnable;
import com.belkin.wemo.rules.runnable.StoreRulesRemoteRunnable;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import com.belkin.wemo.utils.WeMoUtils;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

class RulesRemoteImpl
  implements IWeMoRules
{
  private static RulesRemoteImpl instance;
  
  public static void destroyInstance()
  {
    try
    {
      if (instance != null) {
        instance = null;
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public static RulesRemoteImpl getInstance()
  {
    try
    {
      if (instance == null) {
        instance = new RulesRemoteImpl();
      }
      RulesRemoteImpl localRulesRemoteImpl = instance;
      return localRulesRemoteImpl;
    }
    finally {}
  }
  
  public void fetchRules(Context paramContext, FetchRulesSuccessCallback paramFetchRulesSuccessCallback, FetchRulesErrorCallback paramFetchRulesErrorCallback)
  {
    List localList = WeMoUtils.getWiFiDeviceList(paramContext);
    RMFetchDBRulesResponseHandler localRMFetchDBRulesResponseHandler = new RMFetchDBRulesResponseHandler(paramContext, paramFetchRulesSuccessCallback, paramFetchRulesErrorCallback, localList.size());
    Iterator localIterator = localList.iterator();
    while (localIterator.hasNext())
    {
      DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
      WeMoThreadPoolHandler.getInstance().executeViaBackground(new GetDBVersionRemoteRunnable(paramContext, localRMFetchDBRulesResponseHandler, localRMFetchDBRulesResponseHandler, localDeviceInformation, new CloudRequestManager(paramContext)));
    }
  }
  
  public void fetchRulesAndSyncDevices(Context paramContext, FetchRulesAndSyncSuccessCallback paramFetchRulesAndSyncSuccessCallback, FetchRulesAndSyncErrorCallback paramFetchRulesAndSyncErrorCallback) {}
  
  public void storeRules(Context paramContext, HashMap<String, String[]> paramHashMap, StoreRulesSuccessCallback paramStoreRulesSuccessCallback, StoreRulesErrorCallback paramStoreRulesErrorCallback)
  {
    LogUtils.infoLog("RulesRemoteImpl", "storeRules");
    List localList = WeMoUtils.getWiFiDeviceList(paramContext);
    if ((localList == null) || (localList.isEmpty()))
    {
      if (paramStoreRulesErrorCallback != null) {
        paramStoreRulesErrorCallback.onError(new RMRulesError(-1, "Error while processing Rules!"));
      }
      return;
    }
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new StoreRulesRemoteRunnable(paramContext, localList, new RuleUtility(paramContext).getDBInBase64Encoding(), paramHashMap, paramStoreRulesSuccessCallback, paramStoreRulesErrorCallback));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/impl/RulesRemoteImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */