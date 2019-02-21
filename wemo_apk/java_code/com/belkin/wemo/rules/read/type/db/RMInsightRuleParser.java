package com.belkin.wemo.rules.read.type.db;

import com.belkin.wemo.rules.data.RMDBRuleType;
import com.belkin.wemo.rules.data.RMSimpleSwitchRule;

public class RMInsightRuleParser
  extends RMBaseDBRuleParser<RMSimpleSwitchRule>
{
  protected RMSimpleSwitchRule createRuleObject()
  {
    return new RMSimpleSwitchRule();
  }
  
  protected boolean extractRuleSpecificTables()
  {
    return true;
  }
  
  protected RMDBRuleType getDBRuleType()
  {
    return RMDBRuleType.INSIGHT_RULE;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/db/RMInsightRuleParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */