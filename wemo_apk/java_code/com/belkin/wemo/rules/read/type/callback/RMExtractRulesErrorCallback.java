package com.belkin.wemo.rules.read.type.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesErrorCallback;
import com.belkin.wemo.rules.read.type.error.RMParseRuleError;

public abstract interface RMExtractRulesErrorCallback
  extends RMWeMoRulesErrorCallback
{
  public abstract void onInvalidRuleFound(RMParseRuleError paramRMParseRuleError);
  
  public abstract void onRulesParsingFailed(RMParseRuleError paramRMParseRuleError);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/callback/RMExtractRulesErrorCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */