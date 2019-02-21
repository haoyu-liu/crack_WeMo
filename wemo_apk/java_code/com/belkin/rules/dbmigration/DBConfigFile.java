package com.belkin.rules.dbmigration;

public abstract interface DBConfigFile
{
  public static final int RULE_SET_EVERYDAY = 0;
  public static final int RULE_SET_FRIDAY = 6;
  public static final int RULE_SET_MONDAY = 2;
  public static final int RULE_SET_SATURDAY = 7;
  public static final int RULE_SET_SUNDAY = 1;
  public static final int RULE_SET_THUSDAY = 5;
  public static final int RULE_SET_TUESDAY = 3;
  public static final int RULE_SET_UNKNOWN = -1;
  public static final int RULE_SET_WEDNESDAY = 4;
  public static final int RULE_SET_WEEKDAY = 8;
  public static final int RULE_SET_WEEKEND = 9;
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/rules/dbmigration/DBConfigFile.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */