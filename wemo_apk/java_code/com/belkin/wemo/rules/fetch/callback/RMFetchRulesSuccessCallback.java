package com.belkin.wemo.rules.fetch.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesSuccessCallback;

public abstract interface RMFetchRulesSuccessCallback
  extends RMWeMoRulesSuccessCallback
{
  public abstract void onRulesFetched();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */