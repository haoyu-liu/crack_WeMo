package com.belkin.wemo.rules.callback;

import com.belkin.wemo.rules.data.RMRule;

public abstract interface RMToggleRuleSuccessCallback
  extends RMWeMoRulesSuccessCallback
{
  public abstract void onRuleToggled(RMRule paramRMRule);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */