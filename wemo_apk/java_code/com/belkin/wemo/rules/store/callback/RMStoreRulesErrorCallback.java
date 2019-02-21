package com.belkin.wemo.rules.store.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesErrorCallback;
import com.belkin.wemo.rules.error.RMRulesError;

public abstract interface RMStoreRulesErrorCallback
  extends RMWeMoRulesErrorCallback
{
  public abstract void onStoreRulesFailed(RMRulesError paramRMRulesError);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */