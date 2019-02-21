package com.belkin.wemo.rules.read.type.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesSuccessCallback;
import com.belkin.wemo.rules.data.RMRule;

public abstract interface RMExtractRuleSuccessCallback
  extends RMWeMoRulesSuccessCallback
{
  public abstract void onRuleParsed(RMRule paramRMRule);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/callback/RMExtractRuleSuccessCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */