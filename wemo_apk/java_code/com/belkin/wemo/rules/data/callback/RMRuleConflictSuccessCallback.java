package com.belkin.wemo.rules.data.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesSuccessCallback;

public abstract interface RMRuleConflictSuccessCallback
  extends RMWeMoRulesSuccessCallback
{
  public abstract void onNoConflictFound();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/callback/RMRuleConflictSuccessCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */