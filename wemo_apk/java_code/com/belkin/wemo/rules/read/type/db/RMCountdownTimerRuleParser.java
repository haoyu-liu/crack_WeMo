package com.belkin.wemo.rules.read.type.db;

import com.belkin.wemo.rules.data.RMCountdownTimerRule;
import com.belkin.wemo.rules.data.RMDBRuleType;

public class RMCountdownTimerRuleParser
  extends RMBaseDBRuleParser<RMCountdownTimerRule>
{
  protected RMCountdownTimerRule createRuleObject()
  {
    return new RMCountdownTimerRule();
  }
  
  protected boolean extractRuleSpecificTables()
  {
    return true;
  }
  
  protected RMDBRuleType getDBRuleType()
  {
    return RMDBRuleType.COUNTDOWN_RULE;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/db/RMCountdownTimerRuleParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */