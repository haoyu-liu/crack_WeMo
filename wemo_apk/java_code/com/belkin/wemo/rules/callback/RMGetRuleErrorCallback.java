package com.belkin.wemo.rules.callback;

import com.belkin.wemo.rules.error.RMRulesError;

public abstract interface RMGetRuleErrorCallback
  extends RMWeMoRulesErrorCallback
{
  public abstract void onError(RMRulesError paramRMRulesError);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/callback/RMGetRuleErrorCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */