package com.belkin.wemo.rules.fetch.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesErrorCallback;
import com.belkin.wemo.rules.error.RMRulesError;

public abstract interface RMFetchRulesErrorCallback
  extends RMWeMoRulesErrorCallback
{
  public abstract void onRulesFetchFailed(RMRulesError paramRMRulesError);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */