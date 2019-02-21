package com.belkin.wemo.rules.data.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesErrorCallback;
import com.belkin.wemo.rules.data.error.RMRuleConflictError;

public abstract interface RMRuleConflictErrorCallback
  extends RMWeMoRulesErrorCallback
{
  public abstract void onConflictFound(RMRuleConflictError paramRMRuleConflictError);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/callback/RMRuleConflictErrorCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */