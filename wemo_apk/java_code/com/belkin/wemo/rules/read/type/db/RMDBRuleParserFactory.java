package com.belkin.wemo.rules.read.type.db;

import com.belkin.wemo.rules.data.RMDBRuleType;

public enum RMDBRuleParserFactory
{
  static
  {
    RMDBRuleParserFactory[] arrayOfRMDBRuleParserFactory = new RMDBRuleParserFactory[1];
    arrayOfRMDBRuleParserFactory[0] = INSTANCE;
    $VALUES = arrayOfRMDBRuleParserFactory;
  }
  
  private RMDBRuleParserFactory() {}
  
  public RMIDBRuleParser getDBRuleParserInstance(RMDBRuleType paramRMDBRuleType)
  {
    switch (paramRMDBRuleType)
    {
    default: 
      return null;
    case ???: 
      return new RMSimpleSwitchRuleParser();
    case ???: 
      return new RMCountdownTimerRuleParser();
    case ???: 
      return new RMAwayModeRuleParser();
    case ???: 
      return new RMInsightRuleParser();
    case ???: 
      return new RMMakerNotifyRuleParser();
    case ???: 
      return new RMMakerSensorRuleParser();
    case ???: 
      return new RMMotionControlledRuleParser();
    case ???: 
      return new RMNotifyMeRuleParser();
    case ???: 
      return new RMTimeInternalRuleParser();
    case ???: 
      return new RMLongPressRuleParser();
    }
    return new RMEventRuleParser();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */