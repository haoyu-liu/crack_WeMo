package com.belkin.wemo.rules.data;

import android.text.TextUtils;

public enum RMDBRuleType
{
  public static final String INVALID_RULE_TYPE_STRING_EXCEPTION = "Rule type string is not recognized.";
  private final String dbRuleType;
  
  static
  {
    COUNTDOWN_RULE = new RMDBRuleType("COUNTDOWN_RULE", 1, "Countdown Rule");
    TIME_INTERVAL = new RMDBRuleType("TIME_INTERVAL", 2, "Time Interval");
    INSIGHT_RULE = new RMDBRuleType("INSIGHT_RULE", 3, "Insight Rule");
    MOTION_CONTROLLED = new RMDBRuleType("MOTION_CONTROLLED", 4, "Motion Controlled");
    AWAY_MODE = new RMDBRuleType("AWAY_MODE", 5, "Away Mode");
    MAKER_SENSOR_RULE = new RMDBRuleType("MAKER_SENSOR_RULE", 6, "Maker Sensor Rule");
    MAKER_NOTIFY_RULE = new RMDBRuleType("MAKER_NOTIFY_RULE", 7, "Maker Notify Rule");
    LONG_PRESS = new RMDBRuleType("LONG_PRESS", 8, "Long Press");
    EVENT_RULE = new RMDBRuleType("EVENT_RULE", 9, "Event Rule");
    NOTIFY_ME = new RMDBRuleType("NOTIFY_ME", 10, "Notify Me");
    RMDBRuleType[] arrayOfRMDBRuleType = new RMDBRuleType[11];
    arrayOfRMDBRuleType[0] = SIMPLE_SWITCH;
    arrayOfRMDBRuleType[1] = COUNTDOWN_RULE;
    arrayOfRMDBRuleType[2] = TIME_INTERVAL;
    arrayOfRMDBRuleType[3] = INSIGHT_RULE;
    arrayOfRMDBRuleType[4] = MOTION_CONTROLLED;
    arrayOfRMDBRuleType[5] = AWAY_MODE;
    arrayOfRMDBRuleType[6] = MAKER_SENSOR_RULE;
    arrayOfRMDBRuleType[7] = MAKER_NOTIFY_RULE;
    arrayOfRMDBRuleType[8] = LONG_PRESS;
    arrayOfRMDBRuleType[9] = EVENT_RULE;
    arrayOfRMDBRuleType[10] = NOTIFY_ME;
    $VALUES = arrayOfRMDBRuleType;
  }
  
  private RMDBRuleType(String paramString)
  {
    this.dbRuleType = paramString;
  }
  
  public static RMDBRuleType fromString(String paramString)
    throws IllegalArgumentException
  {
    if (!TextUtils.isEmpty(paramString)) {
      for (RMDBRuleType localRMDBRuleType : values()) {
        if (paramString.equalsIgnoreCase(localRMDBRuleType.toString())) {
          return localRMDBRuleType;
        }
      }
    }
    throw new IllegalArgumentException("Rule type string is not recognized.: " + paramString);
  }
  
  public String toString()
  {
    return this.dbRuleType;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/data/RMDBRuleType.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */