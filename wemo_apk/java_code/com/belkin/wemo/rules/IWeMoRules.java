package com.belkin.wemo.rules;

import android.content.Context;
import com.belkin.wemo.rules.callback.FetchRulesAndSyncErrorCallback;
import com.belkin.wemo.rules.callback.FetchRulesAndSyncSuccessCallback;
import com.belkin.wemo.rules.callback.FetchRulesErrorCallback;
import com.belkin.wemo.rules.callback.FetchRulesSuccessCallback;
import com.belkin.wemo.rules.callback.StoreRulesErrorCallback;
import com.belkin.wemo.rules.callback.StoreRulesSuccessCallback;
import java.util.HashMap;

public abstract interface IWeMoRules
{
  public abstract void fetchRules(Context paramContext, FetchRulesSuccessCallback paramFetchRulesSuccessCallback, FetchRulesErrorCallback paramFetchRulesErrorCallback);
  
  public abstract void fetchRulesAndSyncDevices(Context paramContext, FetchRulesAndSyncSuccessCallback paramFetchRulesAndSyncSuccessCallback, FetchRulesAndSyncErrorCallback paramFetchRulesAndSyncErrorCallback);
  
  public abstract void storeRules(Context paramContext, HashMap<String, String[]> paramHashMap, StoreRulesSuccessCallback paramStoreRulesSuccessCallback, StoreRulesErrorCallback paramStoreRulesErrorCallback);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/IWeMoRules.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */