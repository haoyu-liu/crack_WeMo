package com.belkin.wemo.rules.callback;

import com.belkin.wemo.rules.data.RMRule;

public abstract interface RMEditRuleSuccessCallback
  extends RMWeMoRulesSuccessCallback
{
  public abstract void onSuccess(RMRule paramRMRule1, RMRule paramRMRule2);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/callback/RMEditRuleSuccessCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */