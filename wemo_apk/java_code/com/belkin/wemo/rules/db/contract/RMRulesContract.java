package com.belkin.wemo.rules.db.contract;

import android.provider.BaseColumns;
import java.util.Arrays;
import java.util.List;

public final class RMRulesContract
{
  public static final String DATABASE_NAME = "pluginrules2.db";
  public static final int DATABASE_VERSION = 9;
  public static final int DATABASE_VERSION_DIMMER = 9;
  public static final int DATABASE_VERSION_FIVE = 5;
  public static final int DATABASE_VERSION_FOUR = 4;
  public static final int DATABASE_VERSION_INTREPID = 7;
  public static final int DATABASE_VERSION_NEST = 8;
  public static final int DATABASE_VERSION_SIX = 6;
  public static final String WHERE = "=?";
  
  public static abstract class BlockedRules
    implements BaseColumns
  {
    public static final String COLUMN_NAME_PRIMARY_KEY = "Primarykey";
    public static final String COLUMN_NAME_RULE_ID = "ruleId";
    public static final String CREATE_TABLE = "CREATE TABLE IF NOT EXISTS BLOCKEDRULES(Primarykey INTEGER PRIMARY KEY AUTOINCREMENT, ruleId TEXT )";
    public static final String DROP_TABLE = "DROP TABLE IF EXISTS BLOCKEDRULES";
    public static final String TABLE_NAME = "BLOCKEDRULES";
  }
  
  public static abstract class DeviceCombination
    implements BaseColumns
  {
    public static final String COLUMN_NAME_DEVICE_COMBINATION_PK = "DeviceCombinationPK";
    public static final String COLUMN_NAME_DEVICE_GROUP_ID = "DeviceGroupID";
    public static final String COLUMN_NAME_DEVICE_ID = "DeviceID";
    public static final String COLUMN_NAME_RULE_ID = "RuleID";
    public static final String COLUMN_NAME_SENSOR_GROUP_ID = "SensorGroupID";
    public static final String COLUMN_NAME_SENSOR_ID = "SensorID";
    public static final String CREATE_TABLE = "CREATE TABLE IF NOT EXISTS DEVICECOMBINATION(DeviceCombinationPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , SensorID TEXT , SensorGroupID INTEGER , DeviceID TEXT , DeviceGroupID INTEGER )";
    public static final String DROP_TABLE = "DROP TABLE IF EXISTS DEVICECOMBINATION";
    public static final String TABLE_NAME = "DEVICECOMBINATION";
  }
  
  public static abstract class GroupDevices
    implements BaseColumns
  {
    public static final String COLUMN_NAME_DEVICE_ID = "DeviceID";
    public static final String COLUMN_NAME_GROUP_DEVICE_PK = "GroupDevicePK";
    public static final String COLUMN_NAME_GROUP_ID = "GroupID";
    public static final String CREATE_TABLE = "CREATE TABLE IF NOT EXISTS GROUPDEVICES(GroupDevicePK INTEGER PRIMARY KEY AUTOINCREMENT, GroupID INTEGER , DeviceID TEXT )";
    public static final String DROP_TABLE = "DROP TABLE IF EXISTS GROUPDEVICES";
    public static final String TABLE_NAME = "GROUPDEVICES";
  }
  
  public static abstract class LocationInfo
    implements BaseColumns
  {
    public static final String[] COLUMNS = { "cityName", "countryName", "latitude", "longitude", "countryCode", "region" };
    public static final List<String> COLUMNS_LIST = Arrays.asList(COLUMNS);
    public static final String COLUMN_NAME_CITY_NAME = "cityName";
    public static final String COLUMN_NAME_COUNTRY_CODE = "countryCode";
    public static final String COLUMN_NAME_COUNTRY_NAME = "countryName";
    public static final String COLUMN_NAME_LATITUDE = "latitude";
    public static final String COLUMN_NAME_LOCATION_PK = "LocationPk";
    public static final String COLUMN_NAME_LONGITUDE = "longitude";
    public static final String COLUMN_NAME_REGION = "region";
    public static final String CREATE_TABLE = "CREATE TABLE IF NOT EXISTS LOCATIONINFO(LocationPk INTEGER PRIMARY KEY AUTOINCREMENT, cityName TEXT, countryName TEXT, latitude TEXT, longitude TEXT, countryCode TEXT, region TEXT )";
    public static final String DROP_TABLE = "DROP TABLE IF EXISTS LOCATIONINFO";
    public static final String SELECTION_BY_LOCATION_PK = "LocationPk=?";
    public static final String TABLE_NAME = "LOCATIONINFO";
  }
  
  public static abstract class RuleDevices
    implements BaseColumns
  {
    public static final String ADD_COLUMN_COUNTDOWN_TIME = "ALTER TABLE RULEDEVICES ADD COLUMN CountdownTime INTEGER";
    public static final String ADD_COLUMN_OFF_MODE_OFFSET = "ALTER TABLE RULEDEVICES ADD COLUMN OffModeOffset INTEGER";
    public static final String ADD_COLUMN_ON_MODE_OFFSET = "ALTER TABLE RULEDEVICES ADD COLUMN OnModeOffset INTEGER";
    public static final String ADD_COLUMN_ZB_CAPABILITY_END = "ALTER TABLE RULEDEVICES ADD COLUMN ZBCapabilityEnd TEXT";
    public static final String ADD_COLUMN_ZB_CAPABILITY_START = "ALTER TABLE RULEDEVICES ADD COLUMN ZBCapabilityStart TEXT";
    public static final String[] COLUMNS = { "RuleID", "DeviceID", "GroupID", "DayID", "StartTime", "RuleDuration", "StartAction", "EndAction", "SensorDuration", "Type", "Value", "Level", "ZBCapabilityStart", "ZBCapabilityEnd", "OnModeOffset", "OffModeOffset", "CountdownTime", "EndTime" };
    public static final List<String> COLUMNS_LIST = Arrays.asList(COLUMNS);
    public static final String COLUMN_NAME_COUNTDOWN_TIME = "CountdownTime";
    public static final String COLUMN_NAME_DAY_ID = "DayID";
    public static final String COLUMN_NAME_DEVICE_ID = "DeviceID";
    public static final String COLUMN_NAME_END_ACTION = "EndAction";
    public static final String COLUMN_NAME_END_TIME = "EndTime";
    public static final String COLUMN_NAME_GROUP_ID = "GroupID";
    public static final String COLUMN_NAME_LEVEL = "Level";
    public static final String COLUMN_NAME_OFF_MODE_OFFSET = "OffModeOffset";
    public static final String COLUMN_NAME_ON_MODE_OFFSET = "OnModeOffset";
    public static final String COLUMN_NAME_RULE_DEVICE_PK = "RuleDevicePK";
    public static final String COLUMN_NAME_RULE_DURATION = "RuleDuration";
    public static final String COLUMN_NAME_RULE_ID = "RuleID";
    public static final String COLUMN_NAME_SENSOR_DURATION = "SensorDuration";
    public static final String COLUMN_NAME_START_ACTION = "StartAction";
    public static final String COLUMN_NAME_START_TIME = "StartTime";
    public static final String COLUMN_NAME_TYPE = "Type";
    public static final String COLUMN_NAME_VALUE = "Value";
    public static final String COLUMN_NAME_ZB_CAPABILITY_END = "ZBCapabilityEnd";
    public static final String COLUMN_NAME_ZB_CAPABILITY_START = "ZBCapabilityStart";
    public static final String CREATE_TABLE = "CREATE TABLE IF NOT EXISTS RULEDEVICES(RuleDevicePK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , DeviceID TEXT , GroupID INTEGER , DayID INTEGER , StartTime INTEGER, RuleDuration INTEGER , StartAction REAL, EndAction REAL, SensorDuration INTEGER , Type INTEGER , Value INTEGER , Level INTEGER, ZBCapabilityStart TEXT, ZBCapabilityEnd TEXT,OnModeOffset INTEGER, OffModeOffset INTEGER, CountdownTime INTEGER, EndTime INTEGER)";
    public static final String DROP_COLUMN_PRODUCT_NAME = "ALTER TABLE RULEDEVICES DROP COLUMN ProductName";
    public static final String DROP_TABLE = "DROP TABLE IF EXISTS RULEDEVICES";
    public static final String ORDER_BY = "RuleID";
    public static final String SELECTION_BY_DEVICE_ID = "DeviceID=?";
    public static final String SELECTION_BY_RULE_ID = "RuleID=?";
    public static final String TABLE_NAME = "RULEDEVICES";
  }
  
  public static abstract class Rules
    implements BaseColumns
  {
    public static final String[] COLUMNS = { "RuleID", "Name", "Type", "State" };
    public static final List<String> COLUMNS_LIST = Arrays.asList(COLUMNS);
    public static final String COLUMN_NAME_END_DATE = "EndDate";
    public static final String COLUMN_NAME_NAME = "Name";
    public static final String COLUMN_NAME_RULE_ID = "RuleID";
    public static final String COLUMN_NAME_RULE_ORDER = "RuleOrder";
    public static final String COLUMN_NAME_START_DATE = "StartDate";
    public static final String COLUMN_NAME_STATE = "State";
    public static final String COLUMN_NAME_SYNC = "Sync";
    public static final String COLUMN_NAME_TYPE = "Type";
    public static final String CREATE_TABLE = "CREATE TABLE IF NOT EXISTS RULES ( RuleID PRIMARY KEY, Name TEXT NOT NULL, Type TEXT NOT NULL, RuleOrder INTEGER, StartDate TEXT, EndDate TEXT, State TEXT, Sync INTEGER)";
    public static final String DROP_TABLE = "DROP TABLE IF EXISTS RULES";
    public static final String ORDER_BY = "RuleID";
    public static final String SELECTION_BY_RULE_ID = "RuleID=?";
    public static final String TABLE_NAME = "RULES";
  }
  
  public static abstract class RulesNotifyMessage
    implements BaseColumns
  {
    public static final String COLUMN_NAME_FREQUENCY = "Frequency";
    public static final String COLUMN_NAME_MESSAGE = "Message";
    public static final String COLUMN_NAME_NOTIFY_RULE_ID = "NotifyRuleID";
    public static final String COLUMN_NAME_RULE_ID = "RuleID";
    public static final String CREATE_TABLE = "CREATE TABLE IF NOT EXISTS RULESNOTIFYMESSAGE(RuleID INTEGER PRIMARY KEY AUTOINCREMENT, NotifyRuleID INTEGER , Message TEXT , Frequency INTEGER )";
    public static final String DROP_TABLE = "DROP TABLE IF EXISTS RULESNOTIFYMESSAGE";
    public static final String TABLE_NAME = "RULESNOTIFYMESSAGE";
  }
  
  public static abstract class SensorNotification
    implements BaseColumns
  {
    public static final String[] COLUMNS = { "RuleID", "NotifyRuleID", "NotificationMessage", "NotificationDuration" };
    public static final List<String> COLUMNS_LIST = Arrays.asList(COLUMNS);
    public static final String COLUMN_NAME_NOTIFICATION_DURATION = "NotificationDuration";
    public static final String COLUMN_NAME_NOTIFICATION_MESSAGE = "NotificationMessage";
    public static final String COLUMN_NAME_NOTIFY_RULE_ID = "NotifyRuleID";
    public static final String COLUMN_NAME_RULE_ID = "RuleID";
    public static final String COLUMN_NAME_SENSOR_NOTIFICATION_PK = "SensorNotificationPK";
    public static final String CREATE_TABLE = "CREATE TABLE IF NOT EXISTS SENSORNOTIFICATION(SensorNotificationPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER , NotifyRuleID INTEGER , NotificationMessage TEXT , NotificationDuration INTEGER )";
    public static final String DROP_TABLE = "DROP TABLE IF EXISTS SENSORNOTIFICATION";
    public static final String SELECTION_BY_RULE_ID = "RuleID=?";
    public static final String TABLE_NAME = "SENSORNOTIFICATION";
  }
  
  public static abstract class TargetDevices
    implements BaseColumns
  {
    public static final String[] COLUMNS = { "RuleID", "DeviceID", "DeviceIndex" };
    public static final List<String> COLUMNS_LIST = Arrays.asList(COLUMNS);
    public static final String COLUMN_NAME_DEVICE_ID = "DeviceID";
    public static final String COLUMN_NAME_DEVICE_INDEX = "DeviceIndex";
    public static final String COLUMN_NAME_RULE_ID = "RuleID";
    public static final String COLUMN_NAME_TARGET_DEVICES_PK = "TargetDevicesPK";
    public static final String CREATE_TABLE = "CREATE TABLE IF NOT EXISTS TARGETDEVICES(TargetDevicesPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER, DeviceID TEXT, DeviceIndex INTEGER )";
    public static final String DROP_TABLE = "DROP TABLE IF EXISTS TARGETDEVICES";
    public static final String ORDER_BY = "RuleID";
    public static final String SELECTION_BY_RULE_ID = "RuleID=?";
    public static final String TABLE_NAME = "TARGETDEVICES";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/db/contract/RMRulesContract.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */