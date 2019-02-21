package com.belkin.wemo.rules.read.type.db;

import com.belkin.wemo.rules.data.RMDBRuleType;
import com.belkin.wemo.rules.data.RMSimpleSwitchRule;

public class RMMakerNotifyRuleParser
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
    return RMDBRuleType.MAKER_NOTIFY_RULE;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/db/RMMakerNotifyRuleParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */