package com.belkin.wemo.rules.read.type.db;

import com.belkin.wemo.rules.db.model.RMTRules;
import com.belkin.wemo.rules.read.type.callback.RMExtractRuleSuccessCallback;
import com.belkin.wemo.rules.read.type.callback.RMExtractRulesErrorCallback;

public abstract interface RMIDBRuleParser
{
  public abstract void extractRule(RMTRules paramRMTRules, RMExtractRuleSuccessCallback paramRMExtractRuleSuccessCallback, RMExtractRulesErrorCallback paramRMExtractRulesErrorCallback);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/db/RMIDBRuleParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */