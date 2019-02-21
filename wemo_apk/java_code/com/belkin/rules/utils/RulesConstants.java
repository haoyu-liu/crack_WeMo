package com.belkin.rules.utils;

public class RulesConstants
{
  public static int ACTION_OFF;
  public static int ACTION_ON;
  public static String AWAY_MODE;
  public static char COMMA;
  public static String DEVICES;
  public static String ENDTIME;
  public static String END_ACTION;
  public static int EVERYDAY;
  public static String FNAME;
  public static String FRI = "Fri";
  public static int FRIDAY;
  public static int MAX_HOUR;
  public static int MIDNIGHT_END_TIME;
  public static int MIN_TIME;
  public static String MON;
  public static int MONDAY;
  public static char OFFSET_SEP;
  public static String RULES_DATA;
  public static char RULE_ACTIVATE;
  public static char RULE_DEACTIVATE;
  public static String RULE_DURATION;
  public static String RULE_INSIGHT;
  public static String RULE_MAKER_MOTION;
  public static String RULE_MAKER_MOTION_NOTIFICATION;
  public static String RULE_MOTION;
  public static String RULE_NAME;
  public static String RULE_SENSOR_NOTIFICATION;
  public static String RULE_SIMPLE_TIMER;
  public static String RULE_TIME_INTERVAL;
  public static String RULE_TYPE;
  public static String SAT = "Sat";
  public static int SATURDAY;
  public static char SCHD_SEP = '|';
  public static String SELECTED_LED_VALUE;
  public static String SELECTED_RANGE;
  public static char SEMICOLUMN;
  public static String SENSOR_DURATION;
  public static char SHARP;
  public static String START_ACTION;
  public static String START_TIME;
  public static String STATE;
  public static String SUN = "Sun";
  public static int SUNDAY;
  public static String THRU;
  public static int THURSDAY;
  public static String TUE;
  public static int TUESDAY;
  public static String WED;
  public static int WEDNESDAY;
  public static int WEEKDAYS;
  public static int WEEKEND;
  public static String WHEN;
  
  static
  {
    COMMA = ',';
    SHARP = '#';
    OFFSET_SEP = '$';
    SEMICOLUMN = ';';
    RULE_ACTIVATE = '1';
    RULE_DEACTIVATE = '0';
    RULE_SIMPLE_TIMER = "Simple Switch";
    RULE_TIME_INTERVAL = "Time Interval";
    RULE_INSIGHT = "Insight Rule";
    RULE_MOTION = "Motion Controlled";
    AWAY_MODE = "Away Mode";
    RULE_MAKER_MOTION = "Maker Sensor Rule";
    RULE_MAKER_MOTION_NOTIFICATION = "Maker Notify Rule";
    RULE_SENSOR_NOTIFICATION = "Notify Me";
    ACTION_OFF = 0;
    ACTION_ON = 1;
    EVERYDAY = 0;
    MONDAY = 1;
    TUESDAY = 2;
    WEDNESDAY = 3;
    THURSDAY = 4;
    FRIDAY = 5;
    SATURDAY = 6;
    SUNDAY = 7;
    WEEKDAYS = 8;
    WEEKEND = 9;
    MAX_HOUR = 86400;
    MIN_TIME = 10;
    MIDNIGHT_END_TIME = 86399;
    STATE = "State";
    RULE_TYPE = "RuleType";
    RULE_NAME = "RuleName";
    SELECTED_RANGE = "SelectedDayOrRange";
    RULES_DATA = "rulesDataList";
    DEVICES = "Devices";
    FNAME = "FName";
    SENSOR_DURATION = "SensorDuration";
    START_ACTION = "StartAction";
    SELECTED_LED_VALUE = "SelectedLedValue";
    END_ACTION = "EndAction";
    WHEN = "When";
    RULE_DURATION = "RuleDuration";
    ENDTIME = "EndTime";
    START_TIME = "StartTime";
    MON = "Mon";
    TUE = "Tue";
    WED = "Wed";
    THRU = "Thu";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/rules/utils/RulesConstants.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */