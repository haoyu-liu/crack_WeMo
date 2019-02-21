package com.belkin.wemo.localsdk;

public class UpnpConstants
{
  public static final int AP_LIST_PER_PAGE = 4;
  public static final int AP_SEARCH_COUNT = 2;
  public static final String CLOSE_SETUP = "CloseSetup";
  public static final String CONNECT_HOME_NETWORK = "ConnectHomeNetwork";
  public static String[] DATA_EXPORT_ARGS;
  public static final String DEVICETYPE_AIR_PURIFIER = "urn:Belkin:device:AirPurifier:1";
  public static final String DEVICETYPE_BRIDGE = "urn:Belkin:device:bridge:1";
  public static final String DEVICETYPE_COFFEE_MAKER = "urn:Belkin:device:CoffeeMaker:1";
  public static final String DEVICETYPE_DEFAULT = "urn:Belkin:device:socket:1";
  public static final String DEVICETYPE_HEATERA = "urn:Belkin:device:HeaterA:1";
  public static final String DEVICETYPE_HEATERB = "urn:Belkin:device:HeaterB:1";
  public static final String DEVICETYPE_HUMIDIFIER = "urn:Belkin:device:Humidifier:1";
  public static final String DEVICETYPE_INSIGHT = "urn:Belkin:device:insight:1";
  public static final String DEVICETYPE_LIGHT_SWITCH = "urn:Belkin:device:lightswitch:1";
  public static final String DEVICETYPE_LINK_CAM = "urn:Belkin:device:LinksysWNCSensor:1";
  public static final String DEVICETYPE_MAKER = "urn:Belkin:device:Maker:1";
  public static final String DEVICETYPE_NET_CAM = "urn:Belkin:device:NetCamSensor:1";
  public static final String DEVICETYPE_SENSOR = "urn:Belkin:device:sensor:1";
  public static final String DEVICETYPE_SLOW_COOKER = "urn:Belkin:device:Crockpot:1";
  public static final String DEVICETYPE_SWITCH = "urn:Belkin:device:controllee:1";
  public static final String DEVICETYPE_WEMOSMART = "urn:Belkin:device:Smart:1";
  public static final String DEVICE_ADDED = "com.controller.belkin.hybrid.DEVICE_ADDED";
  public static final String DEVICE_REMOVED = "com.controller.belkin.hybrid.DEVICE_REMOVED";
  public static final String EDIT_WEEKLY_CALENDER = "EditWeeklycalendar";
  public static String[] ENERGY_PER_UNIT_COST_DATA = { "EnergyPerUnitCost", "Currency" };
  public static String ERROR = "Error";
  public static final String FETCH_RULES = "FetchRules";
  public static final String GET_AP_LIST = "GetApList";
  public static final String GET_ATTRIBUTE = "GetAttributes";
  public static final String GET_ATTRIBUTE_LIST = "GetAttributeList";
  public static final String GET_BINARY_STATE = "GetBinaryState";
  public static final String GET_BLOB_STORAGE = "GetBlobStorage";
  public static final String[] GET_BLOB_STORAGE_DATA = { "LabelName" };
  public static final String GET_CURRENCY = "GetCurrency";
  public static final String GET_DATA_EXPORT_INFO = "GetDataExportInfo";
  public static final String GET_DEVICE_ICON = "GetDeviceIcon";
  public static final String GET_DEVICE_INFORMATION = "GetDeviceInformation";
  public static final String GET_ENERGY_PER_UNIT_COST = "GetInsightHomeSettings";
  public static String[] GET_ENERGY_PER_UNIT_COST_DATA;
  public static final String GET_FIRMWARE_VERSION = "GetFirmwareVersion";
  public static final String GET_FRIENDLY_NAME = "GetFriendlyName";
  public static final String GET_FRIENDLY_NAME_BY_INDEX = "GetFriendlyNameByIndex";
  public static final String GET_HOME_ID = "GetHomeId";
  public static final String GET_ICON = "GetIcon";
  public static final String GET_ICON_URL = "GetIconURL";
  public static final String GET_INFORMATION = "GetInformation";
  public static final String GET_INSIGHT_INFO = "GetInsightInfo";
  public static final String GET_INSIGHT_PARAMS = "GetInsightParams";
  public static final String GET_INSTANT_POWER = "GetPower";
  public static final String GET_IN_SBY_SINCE = "GetInSBYSince";
  public static final String GET_MAC_ADDRESS = "GetMacAddr";
  public static final String GET_META_INFO = "GetMetaInfo";
  public static final String GET_NETWORK_LIST = "GetNetworkList";
  public static final String GET_NETWORK_STATUS = "GetNetworkStatus";
  public static final String GET_ON_FOR = "GetONFor";
  public static final String GET_POWER_THRESHOLD = "GetPowerThreshold";
  public static final String GET_RULES_DB_PATH = "GetRulesDBPath";
  public static final String GET_RULES_DB_VER = "GetRulesDBVersion";
  public static final String GET_SIGNAL_STRENGTH = "GetSignalStrength";
  public static final String GET_TIME = "GetTime";
  public static final String GET_TODAY_ON_TIME = "GetTodayONTime";
  public static final String GET_TODAY_SBY_TIME = "GetTodaySBYTime";
  public static final String NOTIFICATION_ATTRIBUTE_STATE = "attributeList";
  public static final String NOTIFICATION_BINARY_STATE = "BinaryState";
  public static final String NOTIFICATION_BULB_UPGRADE = "SubDeviceFWUpdate";
  public static final String NOTIFICATION_COUNTDOWN_TIME = "CountdownEndTime";
  public static final String NOTIFICATION_CROCKPOT_COOKED_TIME = "cookedTime";
  public static final String NOTIFICATION_CROCKPOT_MODE = "mode";
  public static final String NOTIFICATION_CROCKPOT_TIME = "time";
  public static final String NOTIFICATION_FIRMWARE_STATUS = "FirmwareUpdateStatus";
  public static final String NOTIFICATION_LED_STATUS_CHANGE = "StatusChange";
  public static final String NOTIFICATION_PARAM_STATE = "ParamString";
  public static final String NOTIFICATION_PARAM_STRING = "ParamString";
  public static final String NOTIFICATION_TIME_SYNC = "TimeSyncRequest";
  public static final String REMOTE_ACCESS = "RemoteAccess";
  public static final String RESET_ICON_NAME_RULE = "ReSetup";
  public static final String RESET_PLUGIN = "ReSetup";
  public static final String RESET_THRESHOLD = "ResetPowerThreshold";
  public static final int RETRY_COUNT = 30;
  public static final String SCHEDULE_DATA_EXPORT = "ScheduleDataExport";
  public static String[] SCHEDULE_DATA_EXPORT_ARGS;
  public static final String SERVICETYPEGENERIC = "urn:Belkin:service:deviceevent:1";
  public static final String SET_ATTRIBUTE = "SetAttributes";
  public static String[] SET_ATTRIBUTE_KEYS;
  public static final String SET_AUTO_THRESHOLD = "SetAutoPowerThreshold";
  public static final String SET_BINARY_STATE = "SetBinaryState";
  public static String[] SET_BINARY_STATE_ARGS;
  public static final String SET_BLOB_STORAGE = "SetBlobStorage";
  public static String[] SET_BLOB_STORAGE_DATA = { "LabelName", "DataValue" };
  public static final String SET_ENERGY_PER_UNIT_COST = "SetInsightHomeSettings";
  public static final String SET_FRIENDLY_NAME = "ChangeFriendlyName";
  public static String[] SET_FRIENDLY_NAME_ARGS_KEYS;
  public static final String SET_HOME_ID = "SetHomeId";
  public static final String SET_POWER_THRESHOLD = "SetPowerThreshold";
  public static String[] SET_REMOTE_ACESS_ARGS;
  public static final String SET_RULES_DB_VER = "SetRulesDBVersion";
  public static String[] SET_TIME_SYNC_ARGS = { "UTC", "TimeZone", "dst", "DstSupported" };
  public static String[] SET_UPDATE_FIRMWARE_ARGS;
  public static final String STATE_CHANGE_INTENT = "com.controller.belkin.hybrid.STATE_CHANGED";
  public static final String STATE_OVERRIDE_NOTIFY = "com.controller.belkin.hybrid.STATE_OVERRIDE_NOTIFY";
  public static final String STATE_UPGRADE_FINISH = "com.controller.belkin.hybrid.STATE_UPGRADE_FINISH";
  public static final String TIME_SYNC = "TimeSync";
  public static final String UPDATE_FIRMWARE = "UpdateFirmware";
  public static final String UPDATE_WEEKLY_CALENDER = "UpdateWeeklyCalendar";
  public static String[] keyList;
  
  static
  {
    SET_REMOTE_ACESS_ARGS = new String[] { "DeviceId", "dst", "HomeId", "DeviceName", "pluginprivateKey", "smartprivateKey", "smartUniqueId", "DeviceAuthHeader" };
    SET_FRIENDLY_NAME_ARGS_KEYS = new String[] { "FriendlyName" };
    SET_ATTRIBUTE_KEYS = new String[] { "attributeList" };
    keyList = new String[] { "ssid", "auth", "password", "encrypt", "channel" };
    SET_BINARY_STATE_ARGS = new String[] { "BinaryState" };
    SET_UPDATE_FIRMWARE_ARGS = new String[] { "NewFirmwareVersion", "ReleaseDate", "URL", "Signature", "DownloadStartTime" };
    DATA_EXPORT_ARGS = new String[] { "LastDataExportTS", "EmailAddress", "DataExportType" };
    SCHEDULE_DATA_EXPORT_ARGS = new String[] { "EmailAddress", "DataExportType" };
    GET_ENERGY_PER_UNIT_COST_DATA = new String[] { "HomeSettingsVersion", "EnergyPerUnitCost", "Currency" };
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/localsdk/UpnpConstants.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */