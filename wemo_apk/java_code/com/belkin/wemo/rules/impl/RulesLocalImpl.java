package com.belkin.wemo.rules.impl;

import android.content.Context;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.rules.IWeMoRules;
import com.belkin.wemo.rules.callback.FetchRulesAndSyncErrorCallback;
import com.belkin.wemo.rules.callback.FetchRulesAndSyncSuccessCallback;
import com.belkin.wemo.rules.callback.FetchRulesErrorCallback;
import com.belkin.wemo.rules.callback.FetchRulesSuccessCallback;
import com.belkin.wemo.rules.callback.StoreRulesErrorCallback;
import com.belkin.wemo.rules.callback.StoreRulesSuccessCallback;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.runnable.FetchRulesLocalRunnable;
import com.belkin.wemo.rules.runnable.FetchRulesSyncLocalRunnable;
import com.belkin.wemo.rules.runnable.StoreRulesLocalRunnable;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import java.util.HashMap;

class RulesLocalImpl
  implements IWeMoRules
{
  public static final String RULES_LOCAL_IMPL_TAG = "RulesLocalImpl";
  private static RulesLocalImpl instance;
  
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
  
  public static RulesLocalImpl getInstance()
  {
    try
    {
      if (instance == null) {
        instance = new RulesLocalImpl();
      }
      RulesLocalImpl localRulesLocalImpl = instance;
      return localRulesLocalImpl;
    }
    finally {}
  }
  
  public void fetchRules(Context paramContext, FetchRulesSuccessCallback paramFetchRulesSuccessCallback, FetchRulesErrorCallback paramFetchRulesErrorCallback)
  {
    LogUtils.infoLog("RulesLocalImpl", "Fetching Rules only and no device DB sync...");
    WeMoThreadPoolHandler.executeInBackground(new FetchRulesLocalRunnable(paramContext, paramFetchRulesSuccessCallback, paramFetchRulesErrorCallback));
  }
  
  public void fetchRulesAndSyncDevices(Context paramContext, FetchRulesAndSyncSuccessCallback paramFetchRulesAndSyncSuccessCallback, FetchRulesAndSyncErrorCallback paramFetchRulesAndSyncErrorCallback)
  {
    LogUtils.infoLog("RulesLocalImpl", "Fetching Rules and sync devices with out dates DBs...");
    WeMoThreadPoolHandler.executeInBackground(new FetchRulesSyncLocalRunnable(paramContext, paramFetchRulesAndSyncSuccessCallback, paramFetchRulesAndSyncErrorCallback));
  }
  
  public void storeRules(Context paramContext, HashMap<String, String[]> paramHashMap, StoreRulesSuccessCallback paramStoreRulesSuccessCallback, StoreRulesErrorCallback paramStoreRulesErrorCallback)
  {
    LogUtils.infoLog("RulesLocalImpl", "Storing Rules...");
    if (paramHashMap != null) {
      WeMoThreadPoolHandler.executeInBackground(new StoreRulesLocalRunnable(paramContext, paramStoreRulesSuccessCallback, paramStoreRulesErrorCallback, paramHashMap));
    }
    while (paramStoreRulesErrorCallback == null) {
      return;
    }
    paramStoreRulesErrorCallback.onError(new RMRulesError(-1, "Error while processing Rules!"));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/impl/RulesLocalImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */