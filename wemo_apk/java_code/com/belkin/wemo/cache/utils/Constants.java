package com.belkin.wemo.cache.utils;

public class Constants
{
  public static final String AIRPURIFIER_STATUS = "AirPurifierFlag";
  public static final String ALARM_SENSOR_MODEL_CODE = "F7C040";
  public static final String ALARM_SENSOR_PRODUCT_NAME = "AlarmSensor";
  public static final String AMAZON_ALEXA_PACKAGE_INFO = "com.amazon.dee.app";
  public static final String AMAZON_DEVICE = "Amazon";
  public static int ARPMAC_RETRIES = 0;
  public static int ARPMAC_RETRIES_INTERVAL = 0;
  public static final String ATTRIBUTES = "Attributes";
  public static final String ATTRIBUTE_BRIGHTNESS = "brightness";
  public static final String ATTRIBUTE_DELETERESPONSE_GCGRP = "ResponseStatus";
  public static final String ATTRIBUTE_END_TIME = "endTime";
  public static final String ATTRIBUTE_FADER = "fader";
  public static final String ATTRIBUTE_FRIENDLYNAME_GCGRP = "Status";
  public static final String ATTRIBUTE_GCGRP = "RespCreateGroup";
  public static final String ATTRIBUTE_HUSH_MODE = "hushMode";
  public static final String ATTRIBUTE_LEVEL = "level";
  public static final String ATTRIBUTE_NIGHT_MODE = "nightMode";
  public static final String ATTRIBUTE_NIGHT_MODE_BRIGHTNESS = "nightModeBrightness";
  public static final String ATTRIBUTE_POWER_NOW = "powerNow";
  public static final String ATTRIBUTE_POWER_THRESHOLD = "powerThreshold";
  public static final String ATTRIBUTE_START_TIME = "startTime";
  public static final String ATTR_LONG_PRESS_RULE_ACTION = "longPressRuleAction";
  public static final String ATTR_LONG_PRESS_RULE_DEVICE_COUNT = "longPressRuleDeviceCnt";
  public static final String ATTR_LONG_PRESS_RULE_DEVICE_UDN = "longPressRuleDeviceUdn";
  public static final String ATTR_LONG_PRESS_RULE_STATE = "longPressRuleState";
  public static final String ATTR_OVER_TEMP = "overTemp";
  public static final String ATTR_REMOTE_DISABLED = "remote_disabled";
  public static final String ATTR_RESET_REMOTE = "reset_remote";
  public static final String ATTR_VALUE_STUB = "value";
  public static final int AUTO_ENABLE_REMOTE_ACCESS_DELAY = 10000;
  public static final int AUTO_RESET_POWER_THRESHOLD = 2000;
  public static final String AVG = "Avg:";
  public static final String BLOB_STORAGE_PARSING_TAG = "attributeList";
  public static final String BRIDGE_STATUS = "Bridge";
  public static final String BRIDGE_UDN_STUB = "bridge";
  public static final String BULB_PRODUCT_NAME = "Lighting";
  public static final String BULB_STATUS = "Bulb";
  public static final String CACHE_CONTROL = "CACHE-CONTROL: max-age=86400";
  public static final String CACHE_HIT = "Cache Hit %";
  public static final String CAPABILITY_ID_KEY = "capabilityId";
  public static final String CDATA_END_STUB = "]]>";
  public static final String CDATA_START_STUB = "<![CDATA[";
  public static final String CELLULAR_DATA = "Cellular";
  public static final String CHARSET_UTF_8 = "UTF-8";
  public static final String CHECKING_STATUS = "Checking Status...";
  public static final String CLONE_DB_NAME = "pluginrules2Copy.db";
  public static final String CLOUD = "https://api.xbcs.net:8443";
  public static final String CLOUD_GET_API = "(GetAPI)";
  public static final String CLOUD_MESSAGE_URL = "/apis/http/plugin/message/";
  public static final String CLOUD_UPDATE_API = "(UpdateAPI)";
  public static final String CLOUD_URL_DELETE_PRESET = "/apis/http/device/presets/preset/delete/";
  public static final String CLOUD_URL_FWUPGRADE_INFO = "/apis/http/firmware/upgrades";
  public static final String CLOUD_URL_GET_PRESET = "/apis/http/device/presets/";
  public static final String CLOUD_URL_SET_PRESET = "/apis/http/device/presets/preset/";
  public static final String COFFEEMAKER_STATUS = "CoffeeMakerFlag";
  public static final String COLON = ":";
  public static final String COL_ID = "_id";
  public static final String COMMA = ",";
  public static final int CONTROL_POINT_START_INTERVAL = 100;
  public static final int COUNTDOWN_RULE_SUPPORT = 7473;
  public static final String CREE_BULB_MODEL_CODE = "Connected A-19 60W Equivalent";
  public static final String CURRENT_VALUE_KEY = "currentValue";
  public static final String DATABASES_DIR_STUB = "databases";
  public static final int DAYLIGHT_DISABLED = 0;
  public static final int DAYLIGHT_ENABLED = 1;
  public static final String[] DAYS_OF_THE_WEEK;
  public static final String DB_CMD_VACUUM = "VACUUM";
  public static final int DB_URL_TIMEOUT = 60000;
  public static final String DEFAULT_CLONE_RULES_DB_PATH_INDEX = "1";
  public static final String DEFAULT_DB_VERSION = "0";
  public static final int DEFAULT_DB_VERSION_INT = 0;
  public static final String DEFAULT_ICON_VERSION = "0";
  public static String DEFAULT_MAC;
  public static final int DEFAULT_PREVIOUS_VERSION_CODE = 60;
  public static final String DEFAULT_RULES_DB_PATH_INDEX = "0";
  public static String[] DELETE_RULE_ID;
  public static final String DELIMITER_COLON = ":";
  public static final String DELIMITER_COMMA = ",";
  public static final String DELIMITER_DOT = ".";
  public static final String DELIMITER_DOUBLE_COLON = "::";
  public static final String DELIMITER_EQUAL = "=";
  public static final String DELIMITER_FORWARD_SLASH = "/";
  public static final String DELIMITER_HASH = "#";
  public static final String DELIMITER_NEW_LINE = "\n";
  public static final String DELIMITER_NEW_LINE_CARRIAGE = "\n\r";
  public static final String DELIMITER_NEW_LINE_SLASH = "\\n";
  public static final String DELIMITER_PIPE = "\\|";
  public static final String DELIMITER_SPACE = " ";
  public static final String DELIMITER_UNDERSCORE = "_";
  public static final String DEV = "https://wemoci.lswf.net:9069";
  public static final String DEVICETYPE_AIRPURIFIER = "AirPurifier";
  public static final String DEVICETYPE_COFFEEMAKER = "CoffeeMaker";
  public static final String DEVICETYPE_HEATERA = "HeaterA";
  public static final String DEVICETYPE_HEATERB = "HeaterB";
  public static final String DEVICETYPE_HUMIDIFIER = "Humidifier";
  public static final String DEVICETYPE_HUMIDIFIERB = "HumidifierB";
  public static final String DEVICETYPE_SLOWCOOKER = "SlowCooker";
  public static final String DEVICE_ID_AVAILABLE_VALUE = "DeviceID available=";
  public static final String DEVICE_ID_KEY = "deviceId";
  public static final String DEVICE_NAME = "friendlyname";
  public static final String DEVICE_STATUS = "status";
  public static final int DEVICE_STATUS_UNAVAILABLE = 3;
  public static final String DEVICE_TYPE = "device_type";
  public static final String DEVICE_UDN = "deviceudn";
  public static final String DISCOVERING = "Discovering...";
  public static final String DISCOVERY_IN_PROGRESS = "Discovery in progress";
  public static final String DISCOVERY_LOADED_FROM_CACHE = "Loaded from cache";
  public static final String DISCOVERY_LOADED_FROM_CLOUD = "Loaded from cloud";
  public static final String DISCOVERY_RETRY = "Discovery ReTry";
  public static final String DISCOVERY_SUCCESS = "Discovery Success";
  public static final String DISCOVERY_TIMEOUT = "Discovery TimeOut";
  public static final String DOLLAR = "\\$";
  public static final String DOOR_WINDOW_SENSOR_MODEL_CODE = "F7C038";
  public static final String DOOR_WINDOW_SENSOR_PRODUCT_NAME = "DWSensor";
  public static final String DOUBLE_COLON_DELIMITTER = "::";
  public static final String DOUBLE_QUOTS = "&quot;";
  public static final int DRAWER_IS_OPEN = 1;
  public static final String EMERGENCY_NUMBER = "Number";
  public static final String EMPTY_STRING = "";
  public static final String ERROR = "app_error";
  public static final int ERROR_CODE_DB_DOWNLOAD_FAILURE = -400;
  public static final int ERROR_CODE_DB_NOT_IN_SYNC = -2;
  public static final int ERROR_CODE_DUPLICATE_LONG_PRESS = 900;
  public static final int ERROR_CODE_DUPLICATE_RULE = 505;
  public static final int ERROR_CODE_GENERIC = -900;
  public static final int ERROR_CODE_INVALID_ARG = 600;
  public static final int ERROR_CODE_INVALID_DB_PATH = -401;
  public static final int ERROR_CODE_INVALID_RULE_SPECIFIC_DATA = 506;
  public static final int ERROR_CODE_LONG_PRESS_AWAY_MODE_DEV_OLD = 901;
  public static final int ERROR_CODE_NO_DEVICE_ONLINE = 300;
  public static final int ERROR_CODE_NO_ROW_RULE_DEVICES = 503;
  public static final int ERROR_CODE_NO_RULE_FOUND = 502;
  public static final int ERROR_CODE_POST_ACTION_ERROR_RESPONSE = 507;
  public static final int ERROR_CODE_REQUEST_NOT_AUTHORIZED = -405;
  public static final int ERROR_CODE_RULE_CONFLICT = 504;
  public static final int ERROR_CODE_RULE_FAILED_ON_ALL_RULE_DEVICE = -402;
  public static final int ERROR_CODE_RULE_NOT_SAVED = -3;
  public static final String ERROR_CODE_TAG = "ErrorCode";
  public static final int ERROR_CODE_UPNP_CONNECTION_FAILED = -200;
  public static final int ERROR_CODE_WEMO_PUSH_GENERIC = -100;
  public static final int ERROR_CODE_WEMO_RULES_GENERIC = -1;
  public static final int ERROR_CODE_ZIGBEE_FETCH_FAILED = 501;
  public static final String ERROR_DEVICE_IDS_TAG = "ErrorDeviceIDs";
  public static final String ERROR_EMPTY_RESULT = "empty result";
  public static final String ERROR_MSG_DB_NOT_IN_SYNC = "Rule could not be saved. Please refresh the Rules Screen!";
  public static final String ERROR_MSG_DOWNLOAD_DB_FAILURE = "DB Download failed";
  public static final String ERROR_MSG_DUPLICATE_LONG_PRESS = "Duplicate Rule: A Long Press rule already exists on the device!";
  public static final String ERROR_MSG_GROUP_DELETE_ERROR = "Group could not be deleted.";
  public static final String ERROR_MSG_INVALID_DB_PATH = "Invalid Device DB Path";
  public static final String ERROR_MSG_INVALID_RULE_SPECIFIC_DATA = "Rule specific entries NOT found for this rule ID";
  public static final String ERROR_MSG_LONG_PRESS_AWAY_MODE_DEV_OLD = "Long Press Away Mode rule cannot created on target devices with old FWs!";
  public static final String ERROR_MSG_NO_DEVICE_ONLINE = "No device is online for rules processing.";
  public static final String ERROR_MSG_NO_ROW_RULE_DEVICES = "No entry found in RULEDEVICES table for this rule ID";
  public static final String ERROR_MSG_NO_RULE_FOUND = "No rule was found for rule ID provided";
  public static final String ERROR_MSG_POST_ACTION_ERROR_RESPONSE = "ERROR (or empty) response received for Post Control Action!";
  public static final String ERROR_MSG_RULE_CONFLICT = "Rule is conflicting with an already existing rule.";
  public static final String ERROR_MSG_RULE_DUPLICATE = "Rule is duplicate of an existing rule.";
  public static final String ERROR_MSG_RULE_FAILED_ON_ALL_RULE_DEVICE = "Rule could not be saved on ANY RULE device!";
  public static final String ERROR_MSG_RULE_NOT_SAVED = "Rule could not be saved on even a single rule device.";
  public static final String ERROR_MSG_WEMO_PUSH_GENERIC = "Error during register/unregister Push Notification!";
  public static final String ERROR_MSG_WEMO_RULES_GENERIC = "Error while processing Rules!";
  public static final String ERROR_MSG_ZIGBEE_FETCH_FAILED = "ZigBee Devices could not be fetched.";
  public static final String EVENT = "Event";
  public static final String EVENT_ADD_DEVICE = "add_device";
  public static final String EVENT_NOTIFICATION_TYPE_KEY = "eventNotificationType";
  public static final String EVENT_NOTITFY_TYPE_KEY = "eventNotificationType";
  public static final String EVENT_REFRESH_LIST = "refresh";
  public static final long EXPIRATION_DURATION = 200L;
  public static final String FETCH_SIZE = "25";
  public static final String FIRST_TIME_DISCOVERED = "First time discovered";
  public static final String FLEXLED_STATUS = "FlexRGBWFlag";
  public static final String FOB_SENSOR_MODEL_CODE = "F7C039";
  public static final String FOB_SENSOR_PRODUCT_NAME = "Fob";
  public static final String FORWARD_SLASH = "/";
  public static final String FOUND = "Found:";
  public static final int FW_INDEX_SUNDAY = 0;
  public static final String FW_STATUS_DOWNLOAD_COMPLETED = "1";
  public static final String FW_STATUS_DOWNLOAD_FAILED = "2";
  public static final String FW_STATUS_DOWNLOAD_STARTED = "0";
  public static final String FW_STATUS_UPGRADE_COMPLETE = "4";
  public static final String FW_STATUS_UPGRADE_FAILED = "5";
  public static final String FW_STATUS_UPGRADING = "3";
  public static final int FW_VER_FETCH_STORE_SUPPORT = 8725;
  public static final String GARDENSPOT_STATUS = "GardenspotRGBFlag";
  public static final String GCM_SENDER_ID = "1055303863585";
  public static final String GET_BLOB_STORAGE = "getBlobStorage";
  public static final String GET_STARTED_PAGE = "file:///android_asset/www/get_started.html";
  public static final String GREATER_THAN_SYMBOL = "&gt;";
  public static final String HEATERA_STATUS = "HeaterAFlag";
  public static final String HEATERB_STATUS = "HeaterBFlag";
  public static final String HOMESENSE_DEVICES_ARG = "Homesense";
  public static final String HOME_DISC = "Home Disc:";
  public static final String HOME_NETWORK = "Home";
  public static final String HTML_STR_AMPERSAND = "&amp;";
  public static final String HTML_STR_APOSTROPHE = "&apos;";
  public static final String HTML_STR_DOUBLE_QUOTES = "&quot;";
  public static final String HTML_STR_GREATER_THAN = "&gt;";
  public static final String HTML_STR_LESS_THAN = "&lt;";
  public static final int HTTP_HEADER_EXPIRATION_IN_SEC = 200;
  public static final String HTTP_HEADER_KEY_ACCEPT = "accept";
  public static final String HTTP_HEADER_KEY_AUTHORIZATION = "Authorization";
  public static final String HTTP_HEADER_KEY_CONTENT_TYPE = "Content-Type";
  public static final String HTTP_HEADER_KEY_X_TRANS_ID = "X-TransId";
  public static final String HTTP_HEADER_VALUE_APPLICATION_JSON = "application/json";
  public static final String HTTP_HEADER_VALUE_PNAPP = "PNApp";
  public static final String HTTP_URL_STUB = "http://";
  public static final String HUMIDIFIERB_STATUS = "HumidifierBFlag";
  public static final String HUMIDIFIER_STATUS = "HumidifierFlag";
  public static final String ICON_HUMIDIFIERB = "www/img/belkin_humidifierb.png";
  public static final String ICON_LOCATION = "file:///android_asset/";
  public static final int ICON_URL_TIMEOUT = 15000;
  public static final String IFFT_ACCESS_ID = "iftt60ae3d701a40e8f";
  public static long IFFT_EXPIRE = 0L;
  public static final String IFFT_SECRET_KEY = "iftt6df1947957473f4050d0ca1c37d2";
  public static final String IMAGE_COL = "image_raw";
  public static final int INDEX_LINK_UDN = 0;
  public static final int INDEX_NON_LINK_UDN = 7;
  public static final int INDEX_SUNDAY = 6;
  public static final String INSIGHT_STATUS = "insight";
  public static final String INSIGHT_V2_STATUS = "insightV2";
  public static final String INTENT_MSG_ACTION = "com.belkin.android.adm.ON_MESSAGE";
  public static final String INTENT_MSG_CATEGORY = "com.belkin.android.adm.MSG_CATEGORY";
  public static final String INVALID_ACTION = "ACTION is invalid!";
  public static final String INVALID_ACTION_ARGS = "Action arguments are invalid!";
  public static final String INVALID_API_KEY = "Invalid WEMO SDK API key.";
  public static final String INVALID_CONTEXT = "Context in NULL!";
  public static final String INVALID_DOWNLOAD_AGRUMENTS = "Input data for downloading DB is not valid.";
  public static final String INVALID_REGISTER_WITH_PUSH_CLOUD_LISTENER = "RegisterWithPushCloudListener instance is invalid";
  public static final String INVALID_REGISTRATION_ID = "Registration Id is invalid!";
  public static final String INVALID_UNREGISTER_FROM_PUSH_CLOUD_LISTENER = "UnregisterFromPushCloudListener instance is invalid";
  public static final String INVALID_WEMO_RUNNABLE = "Runnable task for WeMoThreadPoolHandler is invalid!";
  public static final String IP_IS_NULL = "IPAddress is null";
  public static boolean IS_CERT_VALIDATE_REQUIRED = false;
  public static boolean IS_DEMOAPP = false;
  public static boolean IS_MULTIHOME = false;
  public static final boolean IS_OPENWRT_ENABLED = false;
  public static final String JARDEN = "https://api.test.jardon.xbcs.net:8443";
  public static final String JSON_DATA_CONS_KEY = "collapse_key";
  public static final String JSON_DATA_MSG_KEY = "message";
  public static final String JSON_DATA_TIME_KEY = "timeStamp";
  public static final String JSON_ERROR_KEY = "error";
  public static final String JSON_VAL_DEVICE_PROPS_MISSING = "device or props missing";
  public static final String JSON_VAL_EXCEPTION_SET_DEVICE_PROPERTIES = "exception setDeviceProperties- check log";
  public static final String KEY_APPLIANCE_CONSUMPTION = "applianceConsumption";
  public static final String KEY_ARPMAC = "arpMac";
  public static final String KEY_BINARY_STATE = "binaryState";
  public static final String KEY_BRIDGE = "Bridge";
  public static final String KEY_CREATE_RULE = "CREATE_RULE";
  public static final String KEY_EMERGENCY_CONTACT = "EmergencyContacts";
  public static final String KEY_EVENT_CODE = "eventCode";
  public static String KEY_FILE_MCLOUD_PASSWD;
  public static String KEY_FILE_MINICLOUD;
  public static String KEY_FILE_PRODUCTION;
  public static String KEY_FILE_PRODUCTION_PASSWD;
  public static String KEY_FILE_STAGING;
  public static String KEY_FILE_STAGING_PASSWD;
  public static final String[] KEY_GET_DEVICE_PRESET_DATA = { "version", "isGroupID", "id" };
  public static final String[] KEY_GET_PRESET_DATA = { "type", "value", "name" };
  public static final String KEY_GET_RULES_DB_VERSION = "RulesDBVersion";
  public static final String KEY_GROUP_ARPMAC = "groupArpMacs";
  public static final String KEY_GROUP_SSID = "groupSSIDs";
  public static final String KEY_HOME_SETTINGS = "homeSettings";
  public static final String[] KEY_INSIGHT_REMOTE_DATA;
  public static final String KEY_MAC_ADDRESS = "macAddress";
  public static final String KEY_OVERTEMPON = "overtempon";
  public static final String KEY_OVERTEMPON2 = "overtempon2";
  public static final String KEY_PLUGIN_TAG = "plugin";
  public static final String KEY_SSID = "ssid";
  public static final String KEY_STATUS_TAG = "status";
  public static String KEY_STORE_TYPE;
  public static final String LED_CLOUD_ID = "led_cloudid";
  public static final String LED_COL_ID = "_ledid";
  public static final String LED_DEVICES_ARG = "LED";
  public static final String LED_DEVICE_ID = "led_deviceid";
  public static final String LED_IMAGE_COL = "led_image_raw";
  public static final String LESSER_THAN_SYMBOL = "&lt;";
  public static final String LIGHTING_PRODUCT_TYPE = "Lighting";
  public static final String LINKCAM_ACTIVITY_INFO = "com.seedonk.android.androidlinksyscam.AndroidSeedonkActivity";
  public static final String LINKCAM_PACKAGE_INFO = "com.seedonk.android.androidlinksyscam";
  public static final String LOAD_GET_STARTED_PAGE = "Load_get_started_page";
  public static final String LOAD_PAGE = "LoadPage";
  public static final String LOAD_REMOTE_NOT_AVAILABLE_PAGE = "Load_remote_not_available_page";
  public static final String LOCATION = "LOCATION";
  public static final int LONG_PRESS_RULE_SUPPORTED_LS = 10487;
  public static final String LS_STATUS = "light";
  public static final String MAC_ADDRESS_KEY = "macAddress";
  public static final int MAKER_SENSOR_RULE_SUPPORT = 6658;
  public static final String MAKER_STATUS = "Maker";
  public static final int MAX_DB_VERSION = 9;
  public static final int MAX_DEVICE_ICON_SIZE = 100;
  public static final int MAX_PHOTO_SIZE_FOR_CROP = 240;
  public static final String MINICLOUD = "https://api.test.jardon.xbcs.net:8443";
  public static final int MINUTES_IN_HOUR = 60;
  public static final String MOBILE = "Mobile";
  public static final String MOBILE_NUMBER = "";
  public static final String MODE = "mode";
  public static final String MODEL_CODE_KEY = "modelCode";
  public static final String MONOLITHIC = "https://devtest-1373897041.us-east-1.elb.amazonaws.com:8443";
  public static final int MOTION_NOTIFY_FW_SUPPORT = 3949;
  public static final int MSEARCH_DURATION = 6000;
  public static final String MSG_GOOGLE_PLAY_SERVICES_ERROR = "Google Play Services Error!";
  public static final String MULTICAST = "(Multicast)";
  public static final String NESTDEV = "https://iftttnest.xwemo.com:8443";
  public static final String NEST_AWAY_STATE = "AwayState";
  public static final String NEST_CONTROL_URL = "/apis/http/plugin/message/";
  public static final String NEST_DEAUTH = "REST_REMOVE";
  public static final String NEST_FRIENDLY_NAME = "Name";
  public static final String NEST_PARENT_NAME = "StructureName";
  public static final String NEST_SILENT_PUSH_PAYLOAD_AVAILABLE = "v10001";
  public static final String NEST_SILENT_PUSH_PAYLOAD_NOT_AVAILABLE = "v10002";
  public static final String NEST_STATUS_MESSAGE_KEY = "statusMessage";
  public static final int NEST_SUPPORTED_FIRMWARE_VERSION = 10135;
  public static final String NEST_THERMOSTAT = "NestThermostat";
  public static final String NEST_UDN_PREFIX = "WEMO00";
  public static final String NETCAM_ACTIVITY_INFO = "com.belkin.android.androidbelkinnetcam.AndroidSeedonkActivity";
  public static final String NETCAM_PACKAGE_INFO = "com.belkin.android.androidbelkinnetcam";
  public static final String NETWORK_TYPE = "Network_Type";
  public static final String NET_CAM = "net_cam";
  public static final String NET_CAM_CHECK = "NetCam";
  public static final int NOTIFICATION_TYPE = 1;
  public static final String NOT_APPLICABLE = "--";
  public static final String NOT_AVAILABLE_CLOUD = "file:///android_asset/www/more/cloud_not_avaliable.html";
  public static final String NOT_CONNECTED = "Not Connected";
  public static final String NO_DATA = "No Data";
  public static final String NO_DEVICE_ONLINE_EXCEPTION = "No device is online.";
  public static final String NO_NETWORK = "No_Network";
  public static final String NULL_STRING = "(null)";
  public static final int OFF_STATE = 0;
  public static final int OPEN_BRIDGE_NETWORK_MAX_ATTEMPTS = 7;
  public static final int OPEN_NETWORK_CALL_INTERVAL = 250000;
  public static final String OWRTTRANS_AIRPURIFIER_STATUS = "openWRTTransAirPurifier";
  public static final String OWRTTRANS_COFFEEMAKER_STATUS = "openWRTTransCoffeeMaker";
  public static final String OWRTTRANS_HEATERA_STATUS = "openWRTTransHeaterA";
  public static final String OWRTTRANS_HEATERB_STATUS = "openWRTTransHeaterB";
  public static final String OWRTTRANS_HUMIDIFIERB_STATUS = "openWRTTransHumidifierB";
  public static final String OWRTTRANS_HUMIDIFIER_STATUS = "openWRTTransHumidifier";
  public static final String OWRTTRANS_INSIGHT_STATUS = "openWRTTransinsight";
  public static final String OWRTTRANS_LS_STATUS = "openWRTTranslight";
  public static final String OWRTTRANS_MAKER_STATUS = "openWRTTransMaker";
  public static final String OWRTTRANS_SLOWCOOKER_STATUS = "openWRTTransSlowCooker";
  public static final String OWRTTRANS_SMART_STATUS = "openWRTTranscrockpot";
  public static final String OWRTTRANS_SNS_STATUS = "openWRTTransSNS";
  public static final String OWRT_AIRPURIFIER_STATUS = "openWRTAirPurifier";
  public static final String OWRT_COFFEEMAKER_STATUS = "openWRTCoffeeMaker";
  public static final String OWRT_HEATERA_STATUS = "openWRTHeaterA";
  public static final String OWRT_HEATERB_STATUS = "openWRTHeaterB";
  public static final String OWRT_HUMIDIFIERB_STATUS = "openWRTHumidifierB";
  public static final String OWRT_HUMIDIFIER_STATUS = "openWRTHumidifier";
  public static final String OWRT_INSIGHT_STATUS = "openWRTinsight";
  public static final String OWRT_LS_STATUS = "openWRTlight";
  public static final String OWRT_MAKER_STATUS = "openWRTMaker";
  public static final String OWRT_SLOWCOOKER_STATUS = "openWRTSlowCooker";
  public static final String OWRT_SMART_STATUS = "openWRTTranssmart";
  public static final String OWRT_SNS_STATUS = "openWRTSNS";
  public static final String OWRT_TAG = "OWRT";
  public static final String PIPE = "\\|";
  public static final String PIR_SENSOR_MODEL_CODE = "F7C041";
  public static final String PIR_SENSOR_PRODUCT_NAME = "PIR";
  public static final int PLUGIN_NETWORK_STATE_SUCCESS = 1;
  public static final String PN_APP = "PNAPP";
  public static final String POSTFIX_SEND_JS_TO_DEV_LIST = "} else { console.log('device_list == undefined'); }";
  public static final String POSTFIX_SEND_JS_TO_SENSOR_CHANGE_EVENT = "');";
  public static final String PREFIX_SEND_JS_TO_DEV_LIST = "if ( device_list != undefined ) { console.log('device_list != undefined');  ";
  public static final String PREFIX_SEND_JS_TO_SENSOR_CHANGE_EVENT = "sensorEvents.sensorChangeEvent('";
  public static final String PRODUCTION = "https://api.xbcs.net:8443";
  public static final String PRODUCT_NAME_KEY = "productName";
  public static final String PROTOCOL = "HTTP/1.1 200 OK";
  public static final String PUSH_NOTIFICATION_ATTR_EVENT_CODE = "eventCode";
  public static final String PUSH_NOTIFICATION_ATTR_EVENT_MSG = "eventMessage";
  public static final String QA = "https://wemoqa.lswf.net:9069";
  public static final String RAP_FIELD_CASE_NOTE = "caseNotes";
  public static final String RAP_FIELD_CASE_SUBJECT = "caseSubject";
  public static final String RAP_FIELD_EMAIL = "email";
  public static final String RAP_FIELD_FIRST_NAME = "firstName";
  public static final String RAP_FIELD_LAST_NAME = "lastName";
  public static final String RAP_FIELD_PHONE = "phone";
  public static final String RAP_FIELD_PROBLEM_CODE = "problemCode";
  public static final String RAP_FIELD_PRODUCT = "product";
  public static final String REMOTE_DISC = "Remote Disc:";
  public static final String REMOTE_MOBILE = "Remote_Mobile";
  public static final String REMOTE_NOT_AVAILABLE_PAGE = "file:///android_asset/www/device/remote_disabled.html";
  public static final String REMOTE_WIFI = "Remote_WiFi";
  public static final String REPORT_A_PROBLEM_URL = "/apis/http/analytic/support/reportAProblem";
  public static final String RESET_FNIR_LOCAL = "1";
  public static final String RESET_POWER_THRESHOLD = "8000";
  public static final String RESET_TYPE_ALL = "all";
  public static final String RESET_TYPE_AUTO_THRESHOLD = "resetAutoThreshold";
  public static final String RESET_TYPE_FN_ICON_RULES = "fnIconRules";
  public static final String RESET_TYPE_THRESHOLD = "resetThreshold";
  public static final String RESET_TYPE_USAGE_DATA = "resetUsageData";
  public static final String RESET_TYPE_WIFI = "wifi";
  public static final String RESET_USAGE_DATA_PLUGIN_KEY = "4";
  public static final String RESET_WIFI_PLUGIN_KEY = "5";
  public static final int REV_NUM_TARGET_DEVICES_TABLE_SUPPORT = 10600;
  public static final String RULES_DB_CLOUD_NAME = "rules.db";
  public static final String RULES_DB_DIR_PATH = "";
  public static final String RULES_DB_NAME = "temppluginRules.db";
  public static final String RULES_DB_ZIPPED_NAME = "rulesDBZip.db";
  public static final String RULES_DB_ZIPPED_NAME_TEMP = "rulesDBZippedTemp";
  public static final String RULES_KEY_RULE_DB_DATA = "ruleDbData";
  public static final int RULES_TIMEOUT = 12500;
  public static final int RULE_DB_SIZE_FOR_VACUUM = 102400;
  public static final String SDU_STUB = "SDU";
  public static final int SECONDS_IN_MINUTE = 60;
  public static final String SEMI_COLON = ";";
  public static final String SENSOR_ALARM_TRIGGERED_STATE = "1";
  public static final String SENSOR_CHANGE_KEY = "SensorChange";
  public static final String SENSOR_DETAIL = "detail";
  public static final String SENSOR_EVENT_AT = "eventAt";
  public static final String SENSOR_EVENT_DATA = "eventData";
  public static final String SENSOR_EVENT_HISTORY_URL = "/blink-event-webservice/wemoevent/eventSearchFilter";
  public static final String SENSOR_EVENT_ID = "eventId";
  public static final String SENSOR_EVENT_LIST = "eventList";
  public static final String SENSOR_KEY_PRESS_CAPABILITY_ID = "20502";
  public static final String SENSOR_PRODUCT = "product";
  public static final String SENSOR_SOURCE_TYPE = "sourceType";
  public static final String SENSOR_STATE_CAPABILITY_ID = "10500";
  public static final String SENSOR_TYPE_KEY = "sensorType";
  public static final String SETUP_DEVICE = "SetUpDevice";
  public static final String SETUP_XML_STUB = "/setup.xml";
  public static final String SET_BLOB_STORAGE = "setBlobStorage";
  public static String[] SET_DB_VER_ARGS = { "RulesDBVersion" };
  public static String[] SET_EDIT_WEEKLY_CALENDER_ARGS = { "action" };
  public static String[] SET_RULE_ID;
  public static String[] SET_UPDATE_WEEKLY_CALENDER_ARGS = { "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat", "Sun" };
  public static String[] SET_UPDATE_WEEKLY_CALENDER_LED_ARGS = { "CalendarList" };
  public static final String SIGNED_INSIGHT_STATUS = "signedInsight";
  public static final String SIGNED_LS_STATUS = "signedlight";
  public static final String SIGNED_SNS_EU_STATUS = "EU_SIGNED";
  public static final String SIGNED_SNS_US_STATUS = "US_SIGNED";
  public static final String SILENT_NOTIFICATION_KEY = "isSilentNotify";
  public static final int SINGLE_WEEKLY_CALENDAR_ARR_LEN = 8;
  public static final String SLOWCOOKER_STATUS = "slowCookerFlag";
  public static final long SMART_SETUP_MAX_RETRY_TIME = 60000L;
  public static final long SMART_SETUP_SEARCH_INTERVAL_ATTEMPTS = 8L;
  public static final long SMART_SETUP_SLEEP_INTERVAL = 10000L;
  public static final String SMART_STATUS = "wemoSmartFlag";
  public static final String SNS_EU_STATUS = "EU";
  public static final String SNS_US_STATUS = "US";
  public static final int SO_FW_SUPPORT = 4003;
  public static final String SPACE = " ";
  public static final int SRSS_FW_SUPPORT = 3609;
  public static final String ST = "ST";
  public static final String STAGING = "https://bcsstag.lswf.net:8443";
  public static final String STANDARD_ERROR = "-1";
  public static final String STATUS = "Status:";
  public static final int STATUS_WEMO_CLOUD_REQUEST_PARTIAL_CONTENT = 206;
  public static final int STATUS_WEMO_CLOUD_REQUEST_SUCCESS = 200;
  public static final String STORE_RULES_KEY_RULE_DB_BODY = "ruleDbBody";
  public static final String STORE_RULES_KEY_RULE_DB_VERSION = "ruleDbVersion";
  public static final String STORE_RULES_KEY_RULE_PROCESS_DB = "processDb";
  public static final String STORE_RULES_SUCCESS_FW_MSG = "Storing of rules DB Successful!";
  public static final String STR_AMPERSAND = "&";
  public static final String STR_APOSTROPHE = "'";
  public static final String STR_DOUBLE_QUOTES = "\"";
  public static final String STR_GREATER_THAN = ">";
  public static final String STR_HMAC_SHA1 = "HmacSHA1";
  public static final String STR_LESS_THAN = "<";
  public static final String SUCCESS = "success";
  public static final String SUCCESS_CODE = "0";
  public static final String SUCCESS_SET_DATA_STORE_MSG = "Success in setting emergency contacts";
  public static final String[] SUPPORTED_LED_MODELCODE_ARRAY;
  public static String TAG_CALENDAR_LIST = "CalendarList";
  public static final String TAG_DEVICE_PRESET = "devicePreset";
  public static final String TAG_RESULT_CODE = "resultCode";
  public static final String TEMPTUNABLE_STATUS = "ClassicA60TWFlag";
  public static final String TIMED_OUT = "Timed out";
  public static final int TIMEOUT_CONNECT_UPNP = 4000;
  public static final int TIMEOUT_LIMIT_REGISTER_PUSH_ON_WEMO_CLOUD = 30000;
  public static final int TIMEOUT_REGISTER_PUSH_ON_WEMO_CLOUD = 15000;
  public static final int TIMEOUT_SO_UPNP = 15000;
  public static final int TIMEOUT_UPLOAD_ZIP_TO_DEVICE = 10000;
  public static final int TO_DISK = 1;
  public static final int TO_HOME = 0;
  public static final String TRIES = "Tries:";
  public static final String UNICAST = "(Unicast)";
  public static final String UNZIPPED_DIR_STUB = "unzipped";
  public static final String UPDATED = "Updated:";
  public static final String UPDATE_DEVICES_STATE_VALUE = "updateDevicesState";
  public static final String UPNP_CONNECTION_ERROR = "Socket connection error while trying to post uPnP Action.";
  public static final String UPNP_CONTROL_ACTION_SUCCESS_CODE = "0";
  public static final String URL_GET_PRESET_DEVICE_TAG = "device/";
  public static final String URL_GET_PRESET_GROUP_TAG = "group/";
  public static final String USN = "USN";
  public static final String UUID_MAKER_STUB = "uuid:Maker";
  public static final String UUID_SENSOR_STUB = ":sensor";
  public static final String UUID_SENSOR_SWITCH_STUB = ":sensor:switch";
  public static final String UUID_STUB = "uuid";
  public static final String VALUE_TAG = "Value";
  public static final String VERIFIED = "Verified:";
  public static final int WEEKDAYS_COUNT = 7;
  public static final String WEMO = "WEMO";
  public static final String WEMO_AIR_PURIFIER_FIRMWARE = "WeMoWW_AirPurifier";
  public static final String WEMO_APP = "WeMo";
  public static final String WEMO_CHECK = "wemo.";
  public static final String WEMO_CLOUD_SILENT_NOTIFICATION_TAG = "silentNotifications";
  public static final String WEMO_CLOUD_VERSION_TAG = "version";
  public static final String WEMO_COFEE_MAKER_FIRMWARE = "WeMoWW_CoffeeMaker";
  public static final String WEMO_EU = "WeMo_EU";
  public static final String WEMO_HEATER_A_FIRMWARE = "WeMoWW_HeaterA";
  public static final String WEMO_HEATER_B_FIRMWARE = "WeMoWW_HeaterB";
  public static final String WEMO_HEATER_FIRMWARE = "WeMoWW_Heater";
  public static final String WEMO_HUMIDIFIER_B_FIRMWARE = "WeMoWW_HumidifierB";
  public static final String WEMO_HUMIDIFIER_FIRMWARE = "WeMoWW_Humidifier";
  public static final String WEMO_HWVERSION_V1 = "v1";
  public static final String WEMO_HWVERSION_V2 = "v2";
  public static final String WEMO_INSIGHT_FIRMWARE = "WeMoInsight";
  public static final String WEMO_LIGHTSWITCH_FIRMWARE = "WeMoLightSwitch";
  public static final String WEMO_MAKER_FIRMWARE = "WeMoWW_Maker";
  public static final String WEMO_OPENWRTTRANS_AIRPURIFIER_FIRMWARE = "WeMoOpenWRTTransAirPurifier";
  public static final String WEMO_OPENWRTTRANS_COFFEEMAKER_FIRMWARE = "WeMoOpenWRTTransCoffeeMaker";
  public static final String WEMO_OPENWRTTRANS_HEATERA_FIRMWARE = "WeMoOpenWRTTransHeaterA";
  public static final String WEMO_OPENWRTTRANS_HEATERB_FIRMWARE = "WeMoOpenWRTTransHeaterB";
  public static final String WEMO_OPENWRTTRANS_HUMIDIFIERB_FIRMWARE = "WeMoOpenWRTTransHumidifierB";
  public static final String WEMO_OPENWRTTRANS_HUMIDIFIER_FIRMWARE = "WeMoOpenWRTTransHumidifier";
  public static final String WEMO_OPENWRTTRANS_INSIGHT_FIRMWARE = "WeMoOpenWRTTransInsight";
  public static final String WEMO_OPENWRTTRANS_LS_FIRMWARE = "WeMoOpenWRTTransLightSwitch";
  public static final String WEMO_OPENWRTTRANS_MAKER_FIRMWARE = "WeMoOpenWRTTransMaker";
  public static final String WEMO_OPENWRTTRANS_SLOWCOOKER_FIRMWARE = "WeMoOpenWRTTransCROCKPOT";
  public static final String WEMO_OPENWRTTRANS_SNS_FIRMWARE = "WeMoOpenWRTTransSNS";
  public static final String WEMO_OPENWRT_AIRPURIFIER_FIRMWARE = "WeMoOpenWRTAirPurifier";
  public static final String WEMO_OPENWRT_COFFEEMAKER_FIRMWARE = "WeMoOpenWRTCoffeeMaker";
  public static final String WEMO_OPENWRT_HEATERA_FIRMWARE = "WeMoOpenWRTHeaterA";
  public static final String WEMO_OPENWRT_HEATERB_FIRMWARE = "WeMoOpenWRTHeaterB";
  public static final String WEMO_OPENWRT_HUMIDIFIERB_FIRMWARE = "WeMoOpenWRTHumidifierB";
  public static final String WEMO_OPENWRT_HUMIDIFIER_FIRMWARE = "WeMoOpenWRTHumidifier";
  public static final String WEMO_OPENWRT_INSIGHT_FIRMWARE = "WeMoOpenWRTInsight";
  public static final String WEMO_OPENWRT_INSIGHT_V2_FIRMWARE = "WeMoOpenWRTInsight_v2";
  public static final String WEMO_OPENWRT_LS_FIRMWARE = "WeMoOpenWRTLightSwitch";
  public static final String WEMO_OPENWRT_MAKER_FIRMWARE = "WeMoOpenWRTMaker";
  public static final String WEMO_OPENWRT_SLOWCOOKER_FIRMWARE = "WeMoOpenWRTCROCKPOT";
  public static final String WEMO_OPENWRT_SNS_FIRMWARE = "WeMoOpenWRTSNS";
  public static final String WEMO_OSRAM_FLEXLED = "WeMoWW_OsramFlexLED";
  public static final String WEMO_OSRAM_GARDENSPOT = "WeMoWW_OsramGardenSpotLED";
  public static final String WEMO_OSRAM_TEMPTUNABLE = "WeMoWW_OsramTWBulb";
  public static final String WEMO_RULES_SUCCESS_GENERIC = "Rules processing successful!";
  public static final String WEMO_SIGNED_EU_FIRMWARE = "WeMoSignedEU";
  public static final String WEMO_SIGNED_INSIGHT_FIRMWARE = "WeMoSignedInsight";
  public static final String WEMO_SIGNED_LIGHTSWITCH_FIRMWARE = "WeMoSignedLightSwitch";
  public static final String WEMO_SIGNED_US_FIRMWARE = "WeMoSignedUS";
  public static final String WEMO_US = "WeMo_US";
  public static final String WEMO_WW = "WeMo_WW";
  public static final String WEMO_WW_1 = "WeMo_WW_1.0";
  public static final String WEMO_WW_2 = "WeMo_WW_2.0";
  public static final String WEMO_WW_BULB = "WeMoWW_Bulb";
  public static final String cordovaDBName = "pluginrules2.db";
  public static final String cordovaDBNameKitKat = "1";
  public static final String devDBName = "plugin.db";
  public static final String ruleDBNameZip = "pluginrulesCompressed.zip";
  public static final String rulesDb = "rules.db";
  public static final String tempDevDBName = "tempplugin.db";
  public static final String tempRuleDBName = "temppluginRules.db";
  public static final String wemoBridgeFirmware = "WeMoWW_BRIDGE";
  public static final String wemoEUFirmware = "WeMoEU";
  public static final String wemoPlugInFirmware = "Plug-in";
  public static final String wemoSLOWCOOKERFirmware = "WeMoWW_CROCKPOT";
  public static final String wemoUSFirmware = "WeMoUS";
  
  static
  {
    SET_RULE_ID = new String[] { "RuleID", "RuleMsg", "RuleFreq" };
    DELETE_RULE_ID = new String[] { "RuleID" };
    KEY_INSIGHT_REMOTE_DATA = new String[] { "status", "stateChangeTS", "lastONFor", "todayTotalTimeOn", "past14TotalTime", "timeConnected", "avgPowerON", "instantaneousPower", "todayTotalKWH", "past14DaysKWH", "powerThreshold" };
    DAYS_OF_THE_WEEK = new String[] { "", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" };
    IFFT_EXPIRE = 120L;
    KEY_STORE_TYPE = "BKS";
    KEY_FILE_PRODUCTION = "bcsCloudKeystore_PROD.bks";
    KEY_FILE_STAGING = "bcsCloudKeystore_STAG.bks";
    KEY_FILE_MINICLOUD = "bcsCloudKeystore_MCLOUD.bks";
    KEY_FILE_PRODUCTION_PASSWD = "belkin123";
    KEY_FILE_STAGING_PASSWD = "belkin123";
    KEY_FILE_MCLOUD_PASSWD = "belkin123";
    IS_CERT_VALIDATE_REQUIRED = true;
    IS_MULTIHOME = false;
    IS_DEMOAPP = false;
    DEFAULT_MAC = "000000000000";
    ARPMAC_RETRIES = 6;
    ARPMAC_RETRIES_INTERVAL = 500;
    SUPPORTED_LED_MODELCODE_ARRAY = new String[] { "MZ100", "iQBR30", "LIGHTIFY A19 Tunable White", "LIGHTIFY Flex RGBW", "LIGHTIFY Gardenspot RGB", "Classic A60 TW", "Flex RGBW", "Gardenspot RGB", "F7C038", "F7C039", "F7C040", "F7C041", "Connected A-19 60W Equivalent" };
  }
  
  public static boolean isStaging()
  {
    return !"https://api.xbcs.net:8443".equals("https://api.xbcs.net:8443");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/utils/Constants.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */