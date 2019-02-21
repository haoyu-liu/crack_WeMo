package com.belkin.wemo.rules.read.type.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesErrorCallback;
import com.belkin.wemo.rules.read.type.error.RMParseRuleError;

public abstract interface RMReadRulesTypeErrorCallback
  extends RMWeMoRulesErrorCallback
{
  public abstract void onRulesExtractionFailed(RMParseRuleError paramRMParseRuleError);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/callback/RMReadRulesTypeErrorCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */