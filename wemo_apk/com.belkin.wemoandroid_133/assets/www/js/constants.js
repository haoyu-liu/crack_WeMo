/*
 constants.js

 Created by Belkin International, Software Engineering on 10/04/2013.
 Copyright (c) 
 -2013 Belkin International, Inc. and/or its affiliates. All rights reserved.

 Belkin International, Inc. retains all right, title and interest (including all
 intellectual property rights) in and to this computer program, which is
 protected by applicable intellectual property laws.  Unless you have obtained
 a separate written license from Belkin International, Inc., you are not authorized
 to utilize all or a part of this computer program for any purpose (including
 reproduction, distribution, modification, and compilation into object code),
 and you must immediately destroy or return to Belkin International, Inc. all copies
 of this computer program.  If you are licensed by Belkin International, Inc., your
 rights to utilize this computer program are limited by the terms of that license.

 To obtain a license, please contact Belkin International, Inc.

 This computer program contains trade secrets owned by Belkin International, Inc.
 and, unless unauthorized by Belkin International, Inc. in writing, you agree to
 maintain the confidentiality of this computer program and related information
 and to not disclose this computer program and related information to any
 other person or entity.

 THIS COMPUTER PROGRAM IS PROVIDED AS IS WITHOUT ANY WARRANTIES, AND BELKIN INTERNATIONAL, INC.
 EXPRESSLY DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING THE WARRANTIES OF
 MERCHANTIBILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE, AND NON-INFRINGEMENT.
 */

var DEBUG = true;
var DISABLE_FW_CHECK = false;
var DISABLE_OFFSET_MOTION_RULE = true;
var IS_RULE_NATIVE = false;
var MORE_MENU_PAGE = true;
var SALESFORCE_BASED_REPORT_PROBLEM = true;
var filePath = {
    INDEX: "file:///android_asset/www/index.html",
    EMAIL_OPT_IN: "file:///android_asset/www/email_opt_in.htm",
    DEVICE_LIST_OLD: "file:///android_asset/www/device/device_list.html",
    DEVICE_LIST: "file:///android_asset/www/devices.html",
    DEVICE_LIST_EDIT: "file:///android_asset/www/device/edit_device.html",
    DEVICE_DATA_EXPORT: "file:///android_asset/www/device/data_export.html",
    DATA_EXPORT_EMAIL: "file:///android_asset/www/device/export_email.html",
    DATA_EXPORT_INTERVAL: "file:///android_asset/www/device/export_interval.html",
    DEVICE_RESET_OPTIONS: "file:///android_asset/www/device/reset_device.html",
    INSIGHT_POWER_THRESHOLD_SETTINGS: "file:///android_asset/www/device/power_threshold_settings.html",
    AUTO_SET_POWER_THRESHOLD: "file:///android_asset/www/device/auto_set_threshold.html",
    EDIT_COST_PER_KWH: "file:///android_asset/www/device/edit_cost_per.html",
    GET_STARTED: "file:///android_asset/www/get_started.html",
    NET_CAM_GET_IT_NOW: "file:///android_asset/www/netCam/get_it_now.html",
    REMOTE_NOT_AVAILABLE: "file:///android_asset/www/device/remote_disabled.html",
    //*--For Rules --*
    TEMP_RULE: "file:///android_asset/www/rules/temp_rule.html",
    UPDATE_APP: "file:///android_asset/www/rules/app_update.html",
    NEW_RULE: "file:///android_asset/www/rules/new_rule.html",
    RULE_DETAILS: "file:///android_asset/www/rules/rule_details.html",
    NOTIFY_RULE_DETAILS: "file:///android_asset/www/rules/notify_rule_details.html",
    CREATE_RULE: "file:///android_asset/www/rules/create_rule.html",
    SELECT_SWITCHES: "file:///android_asset/www/rules/select_switches.html",
    SELECT_INSIGHTS: "file:///android_asset/www/rules/select_insights.html",
    SELECT_CONTROLLED_SWITCHES: "file:///android_asset/www/rules/select_controlled_switches.html",
    WHEN: "file:///android_asset/www/rules/when.html",
    WHEN_NOTIFY: "file:///android_asset/www/rules/when_notify.html",
    WHEN_COUNTDOWN: "file:///android_asset/www/rules/when_countdown.html",
    ENABLED_RULES: "file:///android_asset/www/rules/enabled_rules.html",
    RULE_NAME: "file:///android_asset/www/rules/rule_name.html",
    NOTIFY_MESSAGE: "file:///android_asset/www/rules/notify_message.html",
    SELECT_SENSORS: "file:///android_asset/www/rules/select_sensors.html",
    EDIT_SENSITIVITY: "file:///android_asset/www/rules/edit_sensitivity.html",
    WHAT_HAPPENS: "file:///android_asset/www/rules/what_happens.html",
    INSIGHT_WHAT_HAPPENS: "file:///android_asset/www/rules/insight_what_happens.html",
    EDIT_DAYS: "file:///android_asset/www/rules/edit_days.html",
    SENSORS_RULE: "file:///android_asset/www/rules/sensors_rule.html",
    TIMER_RULE: "file:///android_asset/www/rules/timer_rule.html",
    COUNTDOWN_TIMER_RULE: "file:///android_asset/www/rules/countdown_timer_rule.html",
    NOTIFY_RULE: "file:///android_asset/www/rules/notify_rule.html",
    TIMER_RULE_WHEN: "file:///android_asset/www/rules/timer_rule_when.html",
    SENSORS_RULE_WHEN: "file:///android_asset/www/rules/sensors_rule_when.html",
    SENSORS_WHAT_HAPPENS: "file:///android_asset/www/rules/sensors_what_happens.html",
    AFTER_MOTION_STOPS: "file:///android_asset/www/rules/after_motion_stops.html",
    EDIT_SENSORS_RULE: "file:///android_asset/www/rules/edit_sensors_rule.html",
    EDIT_TIMER_RULE: "file:///android_asset/www/rules/edit_timer_rule.html",
    EDIT_SIMPLE_RULE: "file:///android_asset/www/rules/edit_simple_rule.html",
    EDIT_NOTIFY_RULE: "file:///android_asset/www/rules/edit_notify_rule.html",
    DEVICE_TUNE_UP: "file:///android_asset/www/rules/devices_tune_up.html",
    RULES_HELP_CENTER: "file:///android_asset/www/rules/rule_help_center.html",
    DEBUG_VIEWS: "file:///android_asset/www/debug_views.html",
    NEST_RULE: "file:///android_asset/www/rules/nest_rule.html",

    MAKER_RULE: "file:///android_asset/www/rules/maker_rule.html",
    LONG_PRESS_RULE: "file:///android_asset/www/rules/long_press_rule.html",
    LONG_PRESS_RULE_DETAILS: "file:///android_asset/www/rules/long_press_rule_details.html",
    /** Setup Device Demo-
     Navigate to -> demo_setup_device.html*/
    SETUP_DEVICE_DEMO: "file:///android_asset/www/more/demo_setup_device.html",
    /** Start Sensor Switch Setup Demo-
     Navigate to -> sensor_switch_setup_demo.html*/
    SENSOR_SWITCH_DEMO: "file:///android_asset/www/more/sensor_switch_setup_demo.html",
    /** Start Light Switch Setup Demo-
     Navigate to -> light_switch_setup_demo.html    */
    LIGHT_SWITCH_DEMO: "file:///android_asset/www/more/light_switch_setup_demo.html",
    /** Start Net Cam Slide Show Demo
     *  Navigate to -> netCam/show_me_how.html        */
    NET_CAME_DEMO: "file:///android_asset/www/netCam/show_me_how.html",
    //*--For more --*
    
    MORE_MENU: "file:///android_asset/www/more/more_menu.html",
    
    REMOTE_ACCESS_MORE: "file:///android_asset/www/more/remote_access.html",
    MORE_SETTING_ABOUT: "file:///android_asset/www/more/more_settings.html",
    MORE_SETTING_LOCATION: "file:///android_asset/www/more/more_location.html",
    MORE_SETTING_TEMPERATURE: "file:///android_asset/www/more/more_temperature.html",
    MORE_SETTING_LEGAL: "file:///android_asset/www/more/legal.html",
    LEGAL_THIRDPARTY_POLICY: "file:///android_asset/www/more/third_party_policies.html",
    MORE_NEW_FIRMWARE: "file:///android_asset/www/devices.html#page/wemo_devices/showFirmwareUpdate",
    MORE_IFTTT: "file:///android_asset/www/more/ifttt.html",
    MORE_TELL_US: "file:///android_asset/www/more/tell_us.html",
    GET_IN_TOUCH_WITH_US: "file:///android_asset/www/more/get_in_touch_with_us.html",
    MORE_LEARN_ABOUT_WEMO: "file:///android_asset/www/more/learn_about_wemo.html",
    APP_INFO: "file:///android_asset/www/more/app_info.html",
    HARDWARE_INFO: "file:///android_asset/www/more/hardware_info.html",
    DEVICE_HARDWARE_INFO: "file:///android_asset/www/more/device_hardware_summary.html",
    HELP_CENTER: "file:///android_asset/www/more/help_center.html",
    CONNECT_TO_IFTTT: "file:///android_asset/www/more/connect_to_ifttt.html",
    CONNECT_TO_NEST: "file:///android_asset/www/more/nest.html",
    CONNECT_TO_ALEXA: "file:///android_asset/www/more/alexa.html",
    DEVICE_WIFI_LIST: "file:///android_asset/www/setup/setup_wifi.html",
    CONNECT_TO_HIDDEN_NETWORK: "file:///android_asset/www/setup/setup_hiddennetwork.html",
    DEVICE_PASSWORD: "file:///android_asset/www/setup/setup_password.html",
    SETUP_FAQ: "file:///android_asset/www/more/setup_faq.html",
    CLOUD_AVAILABILITY: "file:///android_asset/www/more/cloud_not_avaliable.html",

    //EULA
    EULA: "file:///android_asset/www/eula.htm",

    //SETUP
    EDIT_WEMO_DETAILS: "file:///android_asset/www/edit_wemo_details.htm",
    SETUP_SUCCESS: "file:///android_asset/www/setup_success.htm",
    NO_NETWORK: "file:///android_asset/www/device/no_wifi.html",
    SETUP_EDIT_EMAIL: "file:///android_asset/www/setup_email.html",
    SETUP_EDIT_FRIENDLY_NAME: "file:///android_asset/www/setup_name.html",
    NO_WEMO: "file:///android_asset/www/setup/no_wemo.html",
    SETUP_BRIDGE: "file:///android_asset/www/led/setup/led_setup.html",
    CONNECT_TO_HELP_PAGE: "file:///android_asset/www/more/setup_help.html",

    //demourl	
    VIDEO_DEMO: "file:///android_asset/www/more/video_demo.html",
    SETUP_LIGHT_SWITCH_DEMO: "file:///android_asset/www/more/light_switch_video_demo.html",

    //led
    LED_DEVICE_LIST_EDIT: "file:///android_asset/www/led/device/led_edit_device.html",
    LED_UPDATE_GRADIENT_VALUE: "file:///android_asset/www/led/setup/set_gradient_value.html",
    LED_DEVICE_RESET_OPTIONS: "file:///android_asset/www/led/device/reset_device.html",
    VIDEO_DEMO: "file:///android_asset/www/more/video_demo.html",
    SETUP_LIGHT_SWITCH_DEMO: "file:///android_asset/www/more/light_switch_video_demo.html",
    LED_DEVICE_BULB_EDIT: "file:///android_asset/www/led/device/led_edit_bulb_devices.html",
    HOME_SENSE_SETUP_SCREEN: "file:///android_asset/www/led/device/setup_success_homesense_devices.html",
    KEYCHAIN_PRESENCE_RULE: "file:///android_asset/www/rules/keychain_presence_rule.html",
    KEYCHAIN_BUTTON_RULE: "file:///android_asset/www/rules/keychain_button_rule.html",

    //bulb config
    SELECT_BULB_TYPE: "file:///android_asset/www/setup/bulbConfig/select_bulb_type.html",
    BULB_CALIBRATE: "file:///android_asset/www/setup/bulbConfig/bulb_calibrate.html",
    CONFIG_PROBLEM: "file:///android_asset/www/setup/bulbConfig/config_problem.html",
    TEST_SUMMARY: "file:///android_asset/www/setup/bulbConfig/test_summary.html",
    TESTING_BULB: "file:///android_asset/www/setup/bulbConfig/testing_bulb.html"
};

var plugins = {
    SETUP: "SetupPlugin",
    DEVICE: "DevicePlugin",
    RULES: "RulesPlugin",
    MORE_TAB: "MoreTabPlugin",
    CLOUD: "cloud",
    NATIVE_UTIL: "NativeUtilPlugin",
    RULESDB: "RulesDatabasePlugin",
    SHARED_PREF: "SharedPreferencesPlugin",
    START_APP: "StartAppPlugin",
    HTTP_PLUGIN: "CordovaHttpPlugin",
    SMART_DEVICE_PLUGIN: "SmartDevicePlugin",
    APP_PLUGIN: "AppPlugin",
    APP_SETTINGS_PLUGIN: "AppSettingsPlugin",
    NETWORK_MANAGER_PLUGIN: "NetworkStatus",
    SENSOR_EVENTS_PLUGIN: "SensorEventsPlugin",
    RULES_PLUGIN: "RulesPlugin"
};

var actions = {
    INITIALIZE_UPNP: "2000",
    IS_DEVICES_FOUND: "2001",
    GET_WEMO_DEVICE_LIST: "2002",
    STOP_CONTROL_POINT: "2003",
    SET_DEVICE_STATE: "2004",
    START_DEVICE_LISTENERS: "2005",
    STOP_DEVICE_LISTENERS: "2006",
    DEVICE_TAB_SET_FRIENDLY_NAME: "2007",
    DEVICE_TAB_SET_DEVICE_IMAGE: "2008",
    CLEAR_NAME_ICON_RULE: "2009",
    RESET_TO_FACTORY_DEFAULT: "2010",
    GET_WEMO_SSID: "2011",
    GET_NETWORK_TYPE: "2012",
    IS_REMOTE_ENABLED: "2013",
    GET_CURRENT_FIRMWARE: "2014",
    IS_FIRMWARE_AVAILABLE: "2015",
    GET_FIRMWARE_UPDATE_LIST: "2016",
    UPDATE_FIRMWARE: "2017",
    CHECK_AP_SIGNALSTRENGTH: "2018",
    GET_POWER_THRESHOLD: "2019",
    SET_POWER_THRESHOLD: "2020",
    GET_ENERGY_PER_UNIT_COST: "2021",
    SET_ENERGY_PER_UNIT_COST: "2022",
    RESET_THRESHOLD: "2023",
    CLEAR_USAGE_DATA: "2031",
    RESET_WIFI_SETTINGS: "2032",
    SCHEDULE_DATA_EXPORT: "2033",
    GET_DATA_EXPORT_INFO: "2034",
    SET_AUTO_THRESHOLD: "2035",
    GET_INSIGHT_PARAMS: "2036",
    UPDATE_WEMO_DEVICE_LIST: "2037",
    REMOVE_WEMO_DEVICE: "2038",
    GET_WEMO_DEVICE_CACHE: "2039",
    GET_INSIGHT_HOMESETTINGS_PARAMS: "2080",
    RESET_ACTIVE_DEVICELIST: "2082",
    START_DISCOVERY: "2086",

    GET_REUNION_KEY: "2050",
    SAVE_REMOTE_REGISTRATION: "2051",
    CHECK_WEMO_PRESENT: "2052",
    GET_REGISTRATION_DATA: "2053",
    IS_CURR_NTW_DIFF_FROM_SETUP: "2054",
    GET_REGISTRATION_STATUS: "2055",
    GET_CACHE_SSID: "2056",
    SET_CACHE_SSID: "2057",
    CLEAR_NAME_ICON_RULE_REMOTE: "2058",
    SET_SSID_ARPMAC: "2059",
    CHANGE_HOME_SSID: "2060",
    GET_LED_FIRMWARE_UPDATE_LIST: "2077",
    UPDATE_LED_FIRMWARE: "2078",
    LED_IS_FIRMWARE_AVAILABLE: "2079",
    REMOVE_LED_DEVICE: "2100",
    //Rules
    RULES_VERSION: "5001",
    SELECT_SWITCHES: "5002",
    SELECT_LIGHT_SWITCHES: "5051",
    SELECT_SENSORS: "5003",
    READ_DB_FROM_PLUGIN: "5004",
    PUSH_DB_TO_PLUGIN: "5005",
    PUSH_SCH_STR_TO_PLUGIN: "5006",
    PUSH_LED_SCH_STR_TO_PLUGIN: "5555",
    READ_DB_FROM_CLOUD: "5007",
    STORE_DB_FROM_CLOUD: "5008",
    COPY_DB_SKELETON: "5009",
    GET_REMOTE_DB_VERSION: "5010",
    SET_REMOTE_DB_VERSION: "5011",
    SELECT_MAKER: "5012",
    SELECT_INSIGHTS: "5014",
    SELECT_DIMMERS: "5050",
    CREATE_CLOUD_REQUEST_FOR_SCHEDULE_STRING: "5026",
    SELECT_LED_DEVICES: "2073",
    SELECT_FOB_SENSOR_DEVICES: "2083",
    SELECT_DOOR_WINDOW_SENSORS: "2084",
    SELECT_PIR_SENSORS: "2085",
    GET_LONG_PRESS_LIGHT_SWICTHES: "5053",
    IS_TARGET_DEVICES_TABLE_SUPPORTED : "5055",

    SIMULATED_META_DATA: "5090",
    GET_FIRMWARE_VERSION_SO: "5092",
    GET_FIRMWARE_VERSION_SRSS_OFFSET: "5092",
    READ_PRAGA_VERSION: "5093",
    WRITE_PRAGA_VERSION: "5094",
    MOTION_NOTIFY_FW_VER_CHECK: "5095",
    COUNTDOWN_FW_VER_CHECK: "5096",
    CLONE_DB: "5098",

    //SRSS
    GET_LOCATION_INFO: "5015",
    GET_SR_SS_TIME: "5016",
    GET_FIRMWARE_VERSION_SRSS: "5017",
    //SRSS
    DB_UPDATE_ON_CHANGE_NETWORK: "5018",
    GET_RULE_SCHEDULE_STRING: "5019",
    GET_RULE_SENSOR_SCHEDULE_STRING: "5020",
    UPLOAD_ICON_TO_CLOUD: "5021",
    GET_ICON_FROM_CLOUD: "5022",

    //Maker Sensor Rule
    GET_FIRMWARE_VERSION_MAKER_RULE: "5025",

    //More Tab
    SET_REMOTE_ACCESS: "6001",
    GET_REMOTE_ACCESS: "6002",
    SMART_DEVICE_UUID: "6004",
    SMART_DEVICE_CLEAR_DATA: "6005",
    ANALYTICS_DATA: "6006",
    ACTION_RESET_HOME_NETWORK: "onReset",
    //Native Util
    PREF_IS_REMOTE_ENABLED: "7001",
    PREF_SET_REMOTE_ENABLED: "7002",
    SEND_EMAIL: "7003",
    GET_PLAY_STORE_URL: "7004",
    GET_APP_VERSION: "7005",
    IS_HOME_NETWORK: "7006",
    GET_TELL_US_MOBILE_INFO: "7007",
    GENERATE_AUTH_CODE: "7008",
    READ_TEXT_FILE: "7009",
    PREF_SET_CONFIG_STATUS: "7010",
    PREF_GET_CONFIG_STATUS: "7011",
    PREF_SET_NEST_CALLBACK_STATUS: "7030",
    PREF_GET_NEST_CALLBACK_STATUS: "7031",
    PREF_SET_NEST_DEAUTH_CALLBACK_STATUS: "7032",
    PREF_GET_NEST_DEAUTH_CALLBACK_STATUS: "7033",
    //PREF_GET_EMAIL_STATUS: "7012",
    // PREF_SET_EMAIL_STATUS: "7013",
    PREF_GET_EMAIL: "7014",
    PREF_SET_EMAIL: "7015",
    GET_BASE64_IMAGE_FROM_DB: "7016",
    GET_NETWORK_TYPE_NEW: '7017',
    PREF_GET_CONFIG_STRING: '7018',
    PREF_SET_GET_STARTED_NEEDED: '7019',
    PREF_GET_GET_STARTED_NEEDED: '7020',
    SAVE_IMAGE_IN_DB: "7021",
    GET_NETWORK_NAME: "7022",
    USER_PREF_TIME_FORMAT_IS24: "7023",
    GET_CURRENT_ARPMAC: "7024",
    GET_CACHE_ARPMAC: "7025",
    SET_CACHE_ARPMAC: "7026",
    ACTION_GET_APP_AND_DEVICE_INFO: "7027",

    //Native rules
    SAVE_RULES: '7002',
    EDIT_RULES: '7003',
    DELETE_RULES: "7004",
    CHANGE_RULES_STATUS: "7005",
    RULES_EXTRACT_FROM_DB: "7009",


    //Nest
    NEST_TOKEN_EXIST_FOR_GIVEN_HOME_ID: "nestTokenExistForGivenHomeId",
    GET_NEST_DEVICES: "getNestDevices",
    DEAUTHORIZE_NEST: "deauthorizeNest",
    SELECT_NEST_DEVICES: "selectNestDevices",
    GET_NEST_AUTH_STATUS: "nestTokenExistForGivenHomeId",

    //Alexa
    LAUNCH_AMAZON_ALEXA_APP: "9106",
    
    //Native UI
    SHOW_PROGRESS: "9001",
    HIDE_PROGRESS: "9002",
    OPEN_SOFT_KEYBOARD: "9003",
    CLOSE_SOFT_KEYBOARD: "9009",
    SHOW_RULE_PROGRESS: "9004",
    HIDE_RULE_PROGRESS: "9005",
    SHOW_SPLASH_ON_LOADING: "9015",
    HIDE_SPLASH_ON_LOADING: "9016",

    SET_NOTIFY_MESSAGE: "9501",
    DELETE_NOTIFY_RULE: "9502",
    //Maker
    SET_ATTRIBUTE_MAKER: "1102",
    GET_ATTRIBUTE_MAKER: "1101",
    CREATE_GET_SET_ATTRIBUTE_MAKER: "1103",
    ACTION_SET_BLOBSTORAGE: "1104",
    EDIT_WEEKLY_CALENDER: "9503",

    //Sunrise Flag
    SUN_TIME: true,

    //NET CAM
    CHECK_NET_CAM: "9004",
    LAUNCH_NET_CAM_APP: "9105",
    SHOW_IN_MARKET_NET_CAM: "9006",

    //LED
    SET_LED_FRIENDLY_NAME: "2070",
    START_LED_DEVICE_LISTENERS: "2071",
    DELETE_WEEKLY_CALENDAR: "8024",
    GET_END_RESPONSE: "2077",
    GET_LED_STATUS_RESPONSE: "2078",
    GPS_LOCATION: "5024",
    CHECK_LOCATION_SERVICE: "5027",
    ACTION_GOTO_LOCATION_SETTING :"5028",
    
    //Light Switch
    SET_NIGHT_LIGHT_STATUS: "9007",
    GET_NIGHT_LIGHT_STATUS: "9008",

    GET_EMAIL: "9010",
    SET_EMAIL_ADDRESS: "9011",
    SET_EMAIL_DEVICE_TYPE: "9028",
    GET_LEGACY_EMAIL:"9027",
    DELETE_EMAIL_ADDRESS: "9012",
    DEFAULT_ICON_URL: "9013",
    TIMER_RULE: "9020",


    IAB_WEMOHEADERHEIGHT: "9021",
    ACTION_GET_DB_CONTENT: "9023",
    GET_CONTACT_LIST: "getContactList",
    ACTION_UPDATE_FW_QUEUE:"9024",
    ACTION_UPDATE_FW_NOTIFICATION:"9025",
    REPORT_A_PROBLEM: "reportAProblem",
    GET_LOCAL_EMAIL_BODY: "getLocalEmailBody",
    GET_MOBILE_NETWORK_TYPE: "getMobileNetworkType",
    SET_EMERGENCY_CONTACTS: "setEmergencyContact",
    GET_EMERGENCY_CONTACTS: "getEmergencyContact",
    GET_CONNECTION_STATUS: "getConnectionStatus",
    SET_MULTIPLE_DEVICE_NAME: "setMulitpleDeviceName",
    SET_DEVICE_PRESET: "setDevicePreset",
    GET_DEVICE_PRESET: "getDevicePreset",
    DELETE_DEVICE_PRESET: "deleteDevicePreset",
    GET_FW_VERSION: "getFWVersion",
	GET_SUBDEVICES_COUNT: "getSubDevicesCount",
	RESUME_DLM: "resumeDLM",
	CHOOSE_PHOTO: "choosePhoto",
	TAKE_PICTURE: "takePicture",
	EDIT_ICON_IN_SETUP: "editIconInSetup",
	REFRESH_LONG_PRESS_RULE_DETAILS : "refreshLongPressRuleDetails",
	SET_DEVICE_PROPERTIES : "setDeviceProperties",
	//dimming Range
    SET_BULB_TYPE: "setBulbType",
    CALIBRATE_BULB: "calibrate",
    CONFIGURE_DIMMING_RANGE: "configureDimmingRange",
    STOP_UPNP_SERVICE: "stopUpNpService"
};

var key = {
    DEVICE_FRIENDLY_NAME: "friendlyName",
    DEVICE_TYPE: "type",
    DEVICE_UDN: "udn",
    DEVICE_STATE: "state",
    DEVICE_ICON_URL: "iconUrl",
    DEVICE_PLUGIN_ID: "pluginId",
    DEVICE_MAC_ADDRESS: "macAddress",
    DEVICE_NEW_FIRMWARE_VERSION: "newFirmwareVersion",
    DEVICE_NEW_FIRMWARE_URL: "newFirmwareURL",
    DEVICE_NEW_FIRMWARE_SIGNATURE: "newFirmwareSignature",
    DEVICE_FIRMWARE: "devicefirmware",
    DEVICE_HW_VERSION:"hwVersion",
    DEVICE_FIRMWARE_COUNTDOWN: 'DEVICE_FIRMWARE_COUNTDOWN',
    DEVICE_FIRMWARE_COUNTDOWN_START_TIME: 'DEVICE_FIRMWARE_COUNTDOWN_START_TIME',
    DEVICE_FIRMWARE_UPGRADE_STARTED: "DEVICE_FIRMWARE_UPGRADE_STARTED",
    DEVICE_FIRMWARE_UPGRADE_DOWNLOADING: "DEVICE_FIRMWARE_UPGRADE_DOWNLOADING",
    DEVICE_STATUS_TIMESTAMP: "statusTimestamp",
    DEVICE_SECURITY_STRENGTH: "SecurityStrength",
    DEVICE_SECURITY_SSID: "SSID",
    DEVICE_SECURITY_SIGNALSTRENGTH: "SignalStrength",
    DEVICE_SECURITY_CHANNEL: "Channel",
    NOTIFY_TYPE: "notifyType",
    DEVICE_SIGNAL_STRENGTH: "DeviceSignalStrength",
    DEVICE_PARENT_PLUGIN_ID: "DeviceParentPluginId",
    DEVICE_CURRENT_STATUS_VAL: "DeviceCurrentStatusVal",
    DEVICE_CURRENT_DIMMING_VAL: "DeviceCurrentDimmingVal",
    DEVICE_ALLOWED_VAL: "DeviceAllowedVal",
    DEVICE_ID: "DeviceId",
    DEVICE_GROUP_ID: "DeviceGroupId",
    DEVICE_GROUP_NAME: "DeviceGroupName",
    NOTIFY_TYPE_LED: "notifyTypeLed",
    DEVICE_ALREADY_GROUP_EXIST: "groupexist",
    DEVICE_GROUP_ID_RETRIVING: "DeviceGroupIdRetriving",
    DEVICE_CAPABILITY_ID: "DeviceCapability",
    DEVICE_GROUP_UNIQUE_ID: "DeviceGroupUniqueId",
    MAKER_DEVICE_UUID: "uuid:Maker",
    DEVICE_ATTRIBUTE_LIST: "attributeList",
    MAKER_SENSORPRESENT: "SensorPresent",
    MAKER_SWITCHMODE: "SwitchMode",
    DEVICE_FIRMWARE_STATUS: "fwUpgradeStatus",
    AWAY_MODE_EDIT: "awayModeEdit",
    //setup
    SETUP_TYPE: 'SETUP_TYPE',

    //Location
    LOCATION_ID: 'locationID',
    COUNTRY: 'country',
    REGION: 'region',
    REGIONNAME: 'regionName',
    CITY: 'city',
    LATITUDE: 'latitude',
    LONGITUDE: 'longitude',
    DEVICEID: "deviceid",
    DEVICETYPE: "devicetype",
    FRIENDLYNAME: "friendlyname",
    UNREACHABLE: "unreachable",
    GROUPID: "groupid",
    DEVICE_FADER_STATUS_VAL: "DeviceFaderStatus",
    AVAILABILITY: "availability",
    LED_MAC_ADDRESS: "LED_MAC_ADDRESS",
    LED_FIRMWARE_VERSION: "LedFirmwareVersion",
    DEVICE_MANUFACTURE: "manufacturer",
    DEVICE_CAPABILITIES: "DeviceCapabilities",
    DEVICE_CAPABILITIES_VALUES: "DeviceCapabilitiesValues",
    DEVICE_FRIENDLY_NAMES: "DeviceFriendlyNames",
    DEVICE_TEMPERATURE_STATUS_VAL: "DeviceTemperatureStatus",
    DEVICE_COLOR_STATUS_VAL: "DeviceColorStatus",
    COLOR_TEMPERATURE_VALUE : "ColorTemperatureValue",
    DEVICE_GROUP_CAPABILITY_VALUE : "DeviceCapabilityValue",
    UUID_VALUE : "uuid"
};

var smartKey = {
    SMART_DEVICE_ID: "deviceId",
    SMART_DEVICE_DESC: "deviceDesc",
    SMART_DEVICE_UNIQUEID: "deviceUniqueId",
    SMART_DEVICE_STATUS: "deviceState"
};

var ruleEventsKey = {
    RULE_EVENT_ID: "ruleEventId",
    RULE_EVENT_EXEC_TS: "ruleExecTS"

};

var ruleType = {
    COUNTDOWN_TIMER: "COUNTDOWN_TIMER",
    MOTION_CONTROLLED: "MOTION_CONTROLLED",
    MAKER_MOTION_CONTROLLED: "MAKER_MOTION_CONTROLLED",
    NOTIFY_ME: "NOTIFY_ME",
    TIME_INTERVAL: "TIME_INTERVAL",
    LONG_PRESS: "LONG_PRESS",
    EVENT_RULE: "EVENT_RULE"
}


//Shared Preferences

var sharedPreferencesConstants = {
    WEMO_NAMESPACE: "BelkinWeMoApp",
    WEMO_DEVICE_CACHE: "deviceCache",
    WEMO_COLLECT_EMAIL: "collectEmail",
    WEMO_DEVICE_ORDER: "deviceOrder",
    TIMESTAMP_FOR_REMOTE: "timestampForRemote",
    KITKAT_WARNING: "warningKitKat",
    WEMO_LED_DEVICE_CACHE: "ledDeviceCache",
    WEMO_LED_WALKTHROUGH_SINGLE: "walkthroughForSingleLed",
    WEMO_LED_WALKTHROUGH_MULTIPLE: "walkthroughForMultipleLed",
    WEMO_LED_WALKTHROUGH_MULTIPLE_T2: "walkthroughForMultipleLed2ndTime",
    WEMO_LED_WALKTHROUGH_T1LAUNCHCOUNT: "walkthroughForMultipleLed1stTimeLaunchCount",
    WEMO_LED_WALKTHROUGH_LAUNCHEDCOUNT: "walkthroughForMultipleLedLaunchedCount",
    APP_RECOVERY: "appRecovery",
    APP_RECOVERY_CONSISTENT_FLAG : "appRecoveryConsitentFlag",
    APP_RECOVERY_COUNTER : "appRecoveryCounter",
    APP_RECOVERY_MAX_RETRY : "appRecoveryMaxRetry"
};

var sessionStore = {
    UUID: 'uuid',
    BRIDGE: 'bridge',
    isEdit: 'IS_EDIT',
    RULE_OBJ_BEFORE_EDIT: "RULE_OBJ_BEFORE_EDIT",
    DEVICE_COUNT: "DEVICE_COUNT",
    IS_UPGRADE_INPROGRESS: "IS_UPGRADE_INPROGRESS",
    IS_DISCOVERY_DONE: "IS_DISCOVERY_DONE",
    HEADER_EDIT_TAG: "HEADER_EDIT",
    DEVICE_EDIT_WEMO_FRIENDLY_NAME: "DEVICE_EDIT_WEMO_FRIENDLY_NAME",
    DEVICE_EDIT_WEMO_ICON_URL: "DEVICE_EDIT_WEMO_ICON_URL",
    DEVICE_EDIT_WEMO_UDN: "DEVICE_EDIT_WEMO_UDN",
    DEVICE_EDIT_WEMO_ICON_URI: "DEVICE_EDIT_WEMO_ICON_URI",
    DEVICE_EDIT_WEMO_DEVICE_TYPE: "DEVICE_EDIT_WEMO_DEVICE_TYPE",
    DEVICE_EDIT_WEMO_DEVICE_SSID: "DEVICE_EDIT_WEMO_DEVICE_SSID",
    DEVICE_EDIT_WEMO_POWER_THRESHOLD: "DEVICE_EDIT_WEMO_POWER_THRESHOLD",
    DEVICE_EDIT_WEMO_POWER_NOW: "DEVICE_EDIT_WEMO_POWER_NOW",
    DEVICE_EDIT_WEMO_POWER_STATE: "DEVICE_EDIT_WEMO_POWER_STATE",
    DEVICE_EDIT_WEMO_COST_PER_KWH: "DEVICE_EDIT_WEMO_COST_PER_KWH",
    DEVICE_EDIT_WEMO_CURRENCY: "DEVICE_EDIT_WEMO_CURRENCY",
    DEVICE_EDIT_WEMO_CURRENCY_SYMBOL: "DEVICE_EDIT_WEMO_CURRENCY_SYMBOL",
    DEVICE_EDIT_WEMO_MAC: "DEVICE_EDIT_WEMO_MAC",
    DEVICE_EDIT_WEMO_PLUGIN_ID: "DEVICE_EDIT_WEMO_PLUGIN_ID",
    DEVICE_EDIT_WEMO_DEVICE_TYPE: "DEVICE_EDIT_WEMO_DEVICE_TYPE",
    DATA_EXPORT_EMAIL_ADDRESS: "DATA_EXPORT_EMAIL_ADDRESS",
    DATA_EXPORT_SCHEDULE_MODE: "DATA_EXPORT_SCHEDULE_MODE",
    DATA_EXPORT_LAST_EMAIL: "DATA_EXPORT_LAST_EMAIL",
    THRESHOLD_IS_AUTO_SET: "THRESHOLD_IS_AUTO_SET",
    THRESHOLD_RESET: "THRESHOLD_RESET",
    COST_PER_RESET: "COST_PER_RESET",
    ORDER_DEVICE_LIST: "ORDER_DEVICE_LIST",
    DEVICE_EDIT_WEMO_SWITCH_TYPE: "DEVICE_EDIT_WEMO_SWITCH_TYPE",
    DEVICE_EDIT_WEMO_SENSOR_AVAILABLITY: "DEVICE_EDIT_WEMO_SENSOR_AVAILABLITY",
    DEVICE_EDIT_WEMO_ATTRIBUTE_LIST: "DEVICE_EDIT_WEMO_ATTRIBUTE_LIST",
    DEVICE_EDIT_WEMO_SWITCH_STATE: "DEVICE_EDIT_WEMO_SWITCH_STATE",

    REMOTE_MODE: "REMOTE_MODE",
    RULES_REMOTE_MODE: "RULES_REMOTE_MODE",
    SMART_SETUP: "SMART_SETUP",
    SUPER_SMART_SETUP: "SUPER_SMART_SETUP",
    SMART_SETUP_SSID: "SMART_SETUP_SSID",
    SMART_SETUP_ONGOING: "SMART_SETUP_ONGOING",
    SUPER_SMART_SETUP_ONGOING: "SUPER_SMART_SETUP_ONGOING",
    HOUSE_SITTER_CHECK: "HOUSE_SITTER_CHECK",
    NETWORK_TYPE: "NETWORK_TYPE",
    NETWORK_NAME: "NETWORK_NAME",
    AWAY_MODE: "Away Mode",
    LAST_ENTRY: "LAST_ENTRY",
    GCM_SENSOR: "GCM_SENSOR",

    FIRMWARE_AVAILABLE: "firmwareUpdateAvailable",
    FIRMWARE_UPDATE_INPROGRESS: "firmwareUpdateInProgress",

    RULE_NEW: "NEW_RULE",
    FALL_BACK: "FALL_BACK",
    SIMPLE_FALL_BACK: "SIMPLE_FALL_BACK",
    DELETED_SWITCH: "DELETED_SWITCH",

    SIMPLE_SWITCH: "Simple Switch",
    TIME_INTERVAL: "Time Interval",
    MOTION_CONTROLLED: "Motion Controlled",
    LONG_PRESS_RULE: "Long Press Rule",
    LONG_PRESS: "Long Press",
    MAKER_MOTION_CONTROLLED: "Maker Sensor Rule",
    EVENT_CONTROLLED: "Event Rule",
    COUNTDOWN_TIMER: "Countdown Rule",
    NOTIFY_ME: "Notify Me",
    NOTIFY_MAKER_MOTION_RULE_TYPE: "Maker Notify Rule",
    POWER_SENSING: "Power Sensing",
    INSIGHT_RULE: "Insight Rule",
    GCM_MAKER_SENSOR: "GCM MAKER SENSOR",
    COUNTDOWN_RULE_DATA: "COUNTDOWN_RULE_DATA",
    KEYCHAIN_PRESENCE_RULE: "Keychain Presence Rule",
    NOTIFY_KEYCHAIN_PRESENCE_RULE: "Keychain Presence Notify Rule",
    GCM_KEYCHAIN_PRESENCE: "GCM Keychain Presence",
    KEYCHAIN_BUTTON_RULE_TYPE: "Keychain Button Rule",
    GCM_DOOR_WINDOW: "GCM Door Window",
    NOTIFY_DOOR_WINDOW_RULE: "Door Window Notify Rule",

    RULES_DATA: "RULES_DATA",
    CURRENT_DEVICE: "CURRENT_DEVICE",
    CURRENT_DEVICE_NAME: "FRIENDLY_NAME",
    CURRENT_SENSOR_NAME: "FRIENDLY_NAME",
    
    RULES_DATA: "RULES_DATA",
    SELECTED_RULEID: "SELECTED_RULEID",
    EDIT_FLAG: "EDIT_FLAG",
    ALLDAY_STARTTIME: "60",
    ALLDAY_ENDTIME: "86340",
    ALLDAY_RULE_DURATION: "86280",
    SENSOR_ALLDAY: "All Day",
    AFTER_MOTION_STOPS_STATUS: "After Motion Stops",
    RULES_DATA_SCH_SRST: "RULES_DATA_SCH_SRST",
    VACATION_MODE_TEXT: "Away Mode turns devices on and off to give the appearance that someone is home.",
    VACATION_MODE_FOOTER: "Device will go on and off at different times but always for at least 30 minutes.",
    TOO_MANY_HOUSE_SITTER: "Too Many House Sitter",
    RULE_STATE_EDIT_MODE: "RuleState_EditMode",
    //    HOUSE_SITTER_DAY_CONFLICT: "Away Mode already active on this day. WeMo currently only allows one Away Mode rule per day.",

    //SRSS
    SR_SS: "SRSS",
    SRSS_SELECTED_DAYS: "SRSSSelectedDays",
    LOCATION_INFO: "locationInfo",
    CURRENT_LOCATION: "currentLocation",
    //SRSS

    //Setup
    SETUP_REMOTE_STATUS: "SETUP_REMOTE_STATUS",
    SETUP_HOME_ID: "SETUP_HOME_ID",
    WEEK_DAYS: "Weekdays",
    WEEK_END: "Weekends",
    DAILY: "Daily",
    WEEK_DAYS_VAL: "Mon-Tue-Wed-Thu-Fri",
    WEEK_END_VAL: "Sat-Sun",
    DAILY_VAL: "Mon-Tue-Wed-Thu-Fri-Sat-Sun",
    AP_LIST: "AP_LIST",
    STARTUP_MODE: "STARTUP_MODE",
    EDIT_DETAILS_DONE: "EDIT_DETAILS_DONE",
    // Rule Type
    RULE_TYPE: "WEMO_RULE",
    RULE_DAYS: "WEMO_RULE_DAYS",
    RULE_TIMES: "WEMO_RULE_TIMES",

    //Firmware
    FIRMWARE_DATA: "FIRMWARE_DATA",
    FIRMWARE_UPDATE_DATA: 'FIRMWARE_UPDATE_DATA',
    SWITCH_DATA: "SWITCH_DATA",
    LIGHT_SWITCH_DATA: "LIGHT_SWITCH_DATA",
    DIMMER_DATA: "DIMMER_DATA",
    SENSOR_DATA: "SENSOR_DATA",
    NEST_DATA: "NEST_DATA",
    INSIGHT_DATA: "INSIGHT_DATA",
    MAKER_DATA: "MAKER_DATA",
    REMOTE_CALL_GETDB: "GETDB",
    REMOTE_CALL_SETDB: "SETDB",
    REMOTE_CALL_ENABLE: "SET_REMOTE_ENABLE",
    REMOTE_CALL_NETWORKTYPE: "SET_REMOTE_NETWORKTYPE",
    FIRMWARE_VERSION_DATA: "FIRMWARE_VERSION",
    CHECK_FIRMWARE_UPGRADE_REQUIRED: "FIRMWARE_UPGRADE_REQUIRED",
    LED_DATA: "LED_DATA",
    PIR_DATA: "PIR_DATA",
    FOB_DATA: "FOB_DATA",
    DWSENSOR_DATA: "DWSENSOR_DATA",
    DEVICE_LIST_UPDATE: "DEVICE_LIST_UPDATE",
    PIR_SENSOR_DATA: "PIR_SENSOR_DATA",
    FIRMWARE_BULB_UPDATE_DATA:"FIRMWARE_BULB_UPDATE_DATA",

    //More
    HELP_URL: 'HELP_URL',
    MORE_LOCATION_SETTINGS: 'moreTab',
    LOCATION_SETTINGS: 'location',
    RULES_LOCATION_SETTINGS: 'rulesTab',
    RULE_DETAIL_PAGE: 'ruleDetailsPage',
    REMOTE_SETTING_DISPLAY: 'DISPLAY',
    REMOTE_SETTING_ENABLE: 'REMOTE',
    EDIT_DEVICE_SETTING: 'editDevice',

    SAVE_RULE_PENDING: 'SaveRulepending',
    PENDING_FIRMWARE: 'pendingFirmware',
    FROM_SAVE_RULE_PAGE: 'fromSaveRulepage',
    
    USER_PREF_TIME_FORMAT_IS24: 'USER_PREF_TIME_FORMAT_IS24',

    //NET CAM OBJECT
    NET_CAM_OBJ_FROM_DEVICE_LIST: 'selectedNetCamFromDeviceList',
    NET_CAM_USER_ID: 'netCamUserID',

    LOCATION_LONGITITUDE: 'longitude',
    LOCATION_LATITUDE: 'latitude',
    //LED OBJECT
    LED_OBJ_FROM_DEVICE_LIST: 'selectedLedFromDeviceList',
    LED_USER_ID: 'ledUserID',
    IS_LED_PRESENT: "LEDpresent",
    IS_BRIDGE_PRESENT : "BridgePresent",
    
    //Dimming

    LED_GRADIENT_VAL: '0.016',
    PAIRED_DEVICES: 'PairedDevices',
    DEVICE_EDIT_WEMO_ID: "DEVICE_EDIT_WEMO_ID",
    DEVICE_EDIT_WEMO_DEVICE_INFO: "DEVICE_EDIT_WEMO_DEVICE_INFO",
    DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS: "DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS",
    OPEN_NETWORK_BRIDGE_UDN: "OPEN_NETWORK_BRIDGE_UDN",
    DEVICE_EDIT_WEMO_GROUP_CAPABILITIES: "DEVICE_EDIT_WEMO_GROUP_CAPABILITIES",
    DEVICE_EDIT_WEMO_GROUP_CURRENTVAL: "DEVICE_EDIT_WEMO_GROUP_CURRENTVAL",
    DEVICE_EDIT_WEMO_GROUP_UNIQUE_ID: "DEVICE_EDIT_WEMO_GROUP_UNIQUE_ID",
    REFRESH_CONTROL_POINT: "RefreshControlPoint",
    DEVICE_SUCCESS: "Devicepage",
    DEVICE_EDIT_WEMO_GROUP_MAC_IDS: "DEVICE_EDIT_WEMO_GROUP_MAC_IDS",
    DEVICE_WEMO_DEVICE_FRIENDLY_NAME: "DEVICE_WEMO_DEVICE_FRIENDLY_NAME",
    LED_BRIDGE_UDN: "LED_BRIDGE_UDN",
    DRAWER_FLAG: "DRAWER_FLAG",
    DEVICE_DEFAULT_ALLOWED_VAL: '255',
    DEFAULT_SETTING: 'false',
    LED_DRAWER_GROUP_LIST: "LED_DRAWER_GROUP_LIST",
    LED_DRAWER_GROUP_ID: "LED_DRAWER_GROUP_ID",
    LED_DRAWER_DEVICE_ID: "LED_DRAWER_DEVICE_ID",
    LED_BRIDGE_UDN_ID: "LED_BRIDGE_UDN_ID",
    LED_TIMER_RULE: "LED Timer Rule",
    REMOTE_LOCAL: "REMOTE_LOCAL",
    LOCATION_LATITUDE_LED: "LOCATION_LATITUDE_LED",
    LOCATION_LAGITUDE_LED: "LOCATION_LAGITUDE_LED",
    BRIDE_SETUP_SUCCESS: "BRIDE_SETUP_SUCCESS",
    LED_DEVICE_INFO: "LED_DEVICE_INFO",
    LED_GROUP_INFO: "LED_GROUP_INFO",
    LED_DEVICE_LIST_ARRAY: "LED_DEVICE_LIST_ARRAY",
    LED_MULTIPLE_BRIDGE_INFO: "LED_MULTIPLE_BRIDGE_INFO",
    LED_MULTIPLE_BRIDGE_UDN: "LED_MULTIPLE_BRIDGE_UDN",
    DEVICE_EDIT_WEMO_PLUGIN_ID: "DEVICE_EDIT_WEMO_PLUGIN_ID",
    DEVICE_EDIT_WEMO_GROUP_DEVICE_FRIENDLYNAME: "DEVICE_EDIT_WEMO_GROUP_DEVICE_FRIENDLYNAME",
    CLEAR_LED_CACHE: "CLEAR_LED_CACHE",
    LOCAL_DEVICE_LIST: "LOCAL_DEVICE_LIST",
    SFW_DEVICE_LIST: "SFW_DEVICE_LIST",
    DEVICE_WEMO_DEVICE_FADER_VAL: "DEVICE_WEMO_DEVICE_FADER_VAL",
    DEVICE_LED_ICON: "DEVICE_LED_ICON",
    DEVICE_EDIT_CROCKPOT: "DEVICE_EDIT_CROCKPOT",
    EDIT_DEVICE_TYPE_CHANGED: "EDIT_DEVICE_MAKER_SWITCH_CHANGED",
    LED_DEVICE_DEFAULT_CAPABILITY: "10006,10008,10300,30008,30009,3000A,30301",
    LED_DEVICE_AVAILABILITY_LIST: "LED_DEVICE_AVAILABILITY_LIST",
    LED_DEVICE_FIRMWARE_ARRAY: "LED_DEVICE_FIRMWARE_ARRAY",
    LED_DEVICE_FIRMWARE_URL: "LED_DEVICE_FIRMWARE_URL",
    LED_FIRMWARE_CHECK: "LED_FIRMWARE_CHECK",
    LED_REMOTE_FIRMWARE_ARRAY: "LED_REMOTE_FIRMWARE_ARRAY",
    LED_MAC_ADDRESS: "LED_MAC_ADDRESS",
    LED_NAME_AND_FIRMWARE: "LED_NAME_AND_FIRMWARE",
    STAG_ENVIRONMENT: " STAG",
    QA_ENVIRONMENT: " QA",
    CI_ENVIRONMENT: " CI",
    JARDEN_ENVIRONMENT: " JARDEN",
    DEVICE_ARR: "DEVICE_ARR",
    DEVICE_EDIT_HOME_SENSE_TYPE: "DEVICE_EDIT_HOME_SENSE_TYPE",
    HOME_SENSE_ORDER_DEVICE_LIST: "HOME_SENSE_ORDER_DEVICE_LIST",
    HOME_SENSE_GROUP_ID: "HOME_SENSE_GROUP_ID",
    HOME_SENSE_GROUP_NAME: "HOME_SENSE_GROUP_NAME",
    HOME_SENSE_DEVICE_TYPE: "HOME_SENSE_DEVICE_TYPE",
    LED_FIRMWARE_MESSAGING: "LED_FIRMWARE_MESSAGING",
    DEVICE_GROUP_SELECTED_IDS: "DEVICE_GROUP_SELECTED_IDS",
    WEMO_LINK_SUBDEVICE_TYPE: "bridge",
    WEMO_LINK_SUBDEVICE_HOMESENSE_TYPE: "homesensedevice",
    COLOR_BULB_TYPE: "color",
    TEMP_BULB_TYPE: "temperature",
    DEVICE_WEMO_DEVICE_TEMPERATURE_VAL: "DEVICE_WEMO_DEVICE_TEMPERATURE_VAL",
    DEVICE_WEMO_DEVICE_COLOR_VAL: "DEVICE_WEMO_DEVICE_COLOR_VAL",
    RGB_MAX_VALUE: "255",
    COLOR_MAX_VALUE: "65536",
    TEMPERATURE_DEFAULT_VALUE: "2700",
    DEFAULT_RGB_VALUE: "#ffffff",
    REGULAR_DIMMABLE_BULBS: "Led",
    TEMPERATURE_BULBS: "Temperature",
    COLOR_BULBS: "Color",
    COLOR_TEMPERATURE_BULBS: "ColorTemperature",
    DEVICE_EDIT_WEMO_GROUP_CAPABILITIES_VALUE: "DEVICE_EDIT_WEMO_GROUP_CAPABILITIES_VALUE",
    DEVICE_EDIT_WEMO_GROUP_STATE: "DEVICE_EDIT_WEMO_GROUP_STATE",
    DEFAULT_FADEOUT_VALUE:"30",
    SHOW_REMOTE_ACCESS_POP_UP: "show_remote_alert",
    LED_DEFAULT_BRIGHTNESS: "100",
    DEFAULT_RGB_XY_VALUE: "20494:21561:0",
    LED_DEVICE_FIRMWARE_ARRAY_VERSION: "LED_DEVICE_FIRMWARE_ARRAY_VERSION",
    DEFAULT_REMOTE_TEMPVALUE: "0.000000:0.0000",
    DEFAULT_REMOTE_COLORVALUE: "0:0:0",
    DEFAULT_ONOFF_VALUE: "0",
    DEFAULT_LEVEL_VALUE: "255:0",
    DEFAULT_SLEEP_VALUE: "0",
    IS_COLOR_TEMP_PICKER:"colorTempPickerOpen",
    HOMESENSE_CAPABILITY_ID_VALUES: "HomeSenseCapabilityIdValues",
    INITIAL_RULE_TAPPED: "InitialRuleTapped",
    PERSIST_REPORT_A_PROBLEM_FORM: "persistReportAProblemForm",
    HOMESENSE_EMERGENCY_CONTACTS_STORE: "HOMESENSE_EMERGENCY_CONTACTS_STORE",
    RESET_OPTIONS_FLAG: "RESET_OPTIONS_FLAG",
    REDIRECT_LED_SETUP_GLOBAL_PAGE: "redirectLEDSetupGlobalPage",
    LED_GROUP_DEVICE_IDS: "LED_GROUP_DEVICE_IDS",
    LED_HOMESENSE_GROUP_INDIVI_STATUS: "LED_HOMESENSE_GROUP_INDIVI_STATUS"
};

var startupMode = {
    MANUAL_CONNECT: "MANUAL_CONNECT",
    HIDDEN_MANUAL_CONNECT: "HIDDEN_MANUAL_CONNECT",
    RETRY_REMOTE_ENABLE: 'RETRY_REMOTE_ENABLE'
};


var rulesClasses = {
    UNKNOWN_CLASS: 0,
    TIME_CLASS: 1,
    SENSOR_CLASS: 2,
    INSIGHT_NOTIFY_CLASS: 3,
    SENSOR_NOTIFY_CLASS: 4,
    MAKER_SENSOR_CLASS: 5,
    NOTIFY_MAKER_SENSOR_CLASS: 6,
    COUNTDOWN_TIMER_CLASS: 7
};

var wemoDeviceType = {

    SWITCH: "urn:Belkin:device:controllee:1",
    MOTION_SENSOR: "urn:Belkin:device:sensor:1",
    INSIGHT: "urn:Belkin:device:insight:1",
    MAKER: "urn:Belkin:device:Maker:1",
    BRIDGE: "urn:Belkin:device:bridge:1"
};

var defaultIcon = {
    SENSOR_THUMB_URI: "file:///android_asset/www/img/new_icons/WeMo_Motion_@3x.png",
    SWITCH_THUMB_URI: "file:///android_asset/www/img/new_icons/WeMo_LightSwitch_@3x.png",
    MAKER_THUMB_URI: "file:///android_asset/www/img/new_icons/WeMo_Maker_@3x.png",
    INSIGHT_THUMB_URI: "file:///android_asset/www/img/new_icons/WeMo_Insight_Switch_@3x.png",
    LED_THUMB_URI: "file:///android_asset/www/img/new_icons/WeMo_LightBulb_@3x.png",
    LED_THUMB_URI_OSRAM: "file:///android_asset/www/img/ic_osrambulb.png"

};

var wemoRemoteDeviceType = {
    MOTION_SENSOR: "Sensor",
    SWITCH: "Socket",
    MAKER: "Maker",
    INSIGHT: "Insight",
    BRIDGE: "Bridge"
};

var timeout = {
    SHORT: 20,
    MEDIUM: 50,
    LONG: 100,
    AUTO_REFRESH: 60000,
    //AUTO_REFRESH : 180000,
    URL_TIMEOUT: 180000,
    URL_TIMEOUT_SMARTDEVICE_LIST: 15000,
    URL_TIMEOUT_DEFAULT: 15000,
    FIRMWARE_CHECK: 10000,
    REMOTE_FIRMWARE_CHECK: 25000,
    ONE_SECOND: 1000,
    PLUGIN_DELAY: 4000,
    WIFI_REFRESH: 10000,
    CLOUD_GET_STATUS_INTV: 10000,
    SETUP_EXIT: 20000,
    AP_CLOSE: 10000,
    CONTROL_POINT_DELAY: 3000,
    NETWORK_RETRY: 1000,
    ENABLE_REMOTE_ACCESS_DELAY: 5000,
    FIRMWARE_UPDATE_CHECK_START: 300000,
    FIRMWARE_UPDATE_CHECK_LOOP: 30000,
    DEVICE_DISCOVERY_FIRST_TIMER: 3000,
    DEVICE_DISCOVERY_SECOND_TIMER: 15000,
    DEVICE_REFRESH: 20000,
    REMOTE_REFRESH_TIMEOUT: 6000,
    LOCAL_REFRESH_TIMEOUT: 3000,
    MOMENTORY_MODE_TIME: 1500,
    RESET_TIMER: 500,
    POPUP_DISPLAY_DELAY: 300,
    LED_GET_DEVICE_STATUS: 18000,
    LED_SETUP_MESSAGE: 7000
};

var timestamp = {
    ONE_MINUTE: 60000,
    MAX_HOUR: 86400,
    ONE_MINUTE: 3600,
    MIN_TIME: 10,
    MIDNIGHT_END_TIME: 86399
};

//Navigation
var navigationUrlOptions = {
    loadUrlTimeoutValue: timeout.URL_TIMEOUT
};
var name = {
    SWITCH: "WeMo Switch",
    SENSOR: "WeMo Sensor",
    INSIGHT: "WeMo Insight",
    MAKER: "WeMo Maker",
    BRIDGE: "WeMo Bridge"
};
var wemoDeviceNames = {
    SWITCH: "WeMo Switch",
    SENSOR: "WeMo Sensor",
    INSIGHT: "WeMo Insight",
    MAKER: "WeMo Maker",
    BRIDGE: "WeMo Bridge"
};
var networkType = {
    NO_NETWORK: 'No_Network',
    HOME_NETWORK: 'Home',
    REMOTE_WIFI: 'Remote_WiFi',
    REMOTE_MOBILE: 'Remote_Mobile',
    WEMO: 'WEMO',
    NET_CAM: "net_cam"
};

var networkConnect = {
    WIFI : "wifi",
    TYPE_NONE: "none",
    TYPE_AirPlaneMode: "airplaneMode",
    TYPE_NotConnected: "notConnected"
};

var cloudEnvironment = {
    /*CI: "https://173.196.160.173:8443",
    STAGING: "https://stagapi.xbcs.net:8443",
    PRODUCTION: "https://api.xbcs.net:8443",
    JARDEN: "https://api.test.jardon.xbcs.net:8443",
    QA: "https://173.196.160.163:8443",
    DEV: "https://173.196.160.173:8443"*/
		
    //adding urls with SSL certificates
    CI: "https://wemoci.lswf.net:9069",
    STAGING: "https://stagapi.xwemo.com:8443",
    PRODUCTION: "https://api.xwemo.com:8443",
    JARDEN: "https://api.test.jardon.xbcs.net:8443",
    QA: " https://wemoqa.lswf.net:9069",
    DEV: "https://wemoci.lswf.net:9069",
    MONOLITHIC: "https://devtest-1373897041.us-east-1.elb.amazonaws.com:8443"
};

/*var cloudEnvironment = {
    STAGING: "https://107.20.144.211:8443",
    PRODUCTION: "https://api.xbcs.net:8443"
};
*/

var firmwareCloudEnvironment = {
    STAGING: "http://fw.stag1.xbcs.net",
    PRODUCTION: "https://fw.xbcs.net",
    NESTDEV:"https://iftttnest.xwemo.com",
    JARDEN: "http://fw.test.jardon.xbcs.net",
    QA: "http://fw.xbcs.net",
    DEV: "http://173.196.160.173",
    CI: "http://173.196.160.173",
    MONOLITHIC: "https://fw.xbcs.net"
};

/*var firmwareCloudEnvironment = {
    STAGING: "http://75.101.183.196",
    PRODUCTION: "https://fw.xbcs.net"
};
*/

var cloud = cloudEnvironment.PRODUCTION;
var firmwareCloud = firmwareCloudEnvironment.PRODUCTION;
var isBetaApp = 0;


var minimumFirmware = "1296";

var PUSH_DB_REQUIRED = 0;
var PUSH_DB_NOT_REQUIRED = 1;

var cloudAPI = {
    DEVICE_LIST: cloud + "/apis/http/plugin/plugins/",
    SMART_SETUP_REGISTRATION: cloud + "/apis/http/plugin/registration/smartDevice",
    STATE_CHANGE: cloud + "/apis/http/plugin/message/",
    ATTRIBUTE_CHANGE: cloud + "/apis/http/device/homeDevices/",
    // REGISTER_EMAIL: cloud + "/apis/http/plugin/registerEmail/",
    COLLECT_EMAIL: cloud + "/apis/http/plugin/emailAddresses/",
    FIRMWARE_URL: cloud + "/apis/http/plugin/fwUpgradeInfo/",
    SMARTDEVICE_DISABLE: cloud + "/apis/http/plugin/updateRemoteAccess/",
    SMARTDEVICE_LIST: cloud + "/apis/http/plugin/smartDevices/",
    GENERATE_IFTTT_PIN: cloud + "/apis/http/plugin/generatePin/",
    SEND_ACK_NEW_HOME: cloud + '/apis/http/plugin/ackForHomeIdSync/',
    DEVICE_MESSAGE: cloud + '/apis/http/plugin/message/',
    FIRMWARE_UPGRADE: cloud + '/apis/http/plugin/upgradeFwVersion',
    GET_DB_FILE: cloud + '/apis/http/plugin/dbfile/',
    LOCATION_SEARCH: cloud + '/apis/http/plugin/geoInfo/cityLocations?cityName=',
    INSIGHT_PARAMS: cloud + '/apis/http/plugin/insight/message/',
    SET_DEVICE_ICON: cloud + '/apis/http/plugin/ext/deviceIcon/',
    GET_DEVICE_ICON: cloud + '/apis/http/plugin/ext/deviceIcon/',
    GET_RULE_EVENTS: cloud + '/apis/http/plugin/push/ruleEvents/',
    LED_DEVICE_LIST: cloud + '/apis/http/device/homeDevices/',
    LED_STATE_CHANGE: cloud + '/apis/http/device/homeDevices/capabilityProfile?remoteSync=true',
    LED_CREATE_GROUP: cloud + '/apis/http/device/groups/',
    LED_DELETE_GROUP: cloud + '/apis/http/device/groups/',
    LED_STATE_CHANGE_GROUP: cloud + '/apis/http/device/groups/capabilityProfile?remoteSync=true',
    LED_EDIT_ICON: cloud + '/apis/http/lswf/uploads/',
    LED_GET_ICON: cloud + '/apis/http/device/homeUploads/',
    LED_FIRMWARE_URL: cloud + '/apis/http/device/fwUpgradeInfo/',
    EMAIL_OPT_IN: 'http://www.belkin.com/signup/wemo/?email',
    HIDE_DEVICE: cloud + '/apis/http/plugin/property/[MacAddress]/visibility/0'
};

var firmwareTextFile = {
    PATH: firmwareCloud + "/wemo/NewFirmware.txt",
    PATH_PROD: firmwareCloud + "/wemo/NewFirmware.txt",
    PATH_STAG: firmwareCloud + "/wemo/version.txt",
    PATH_QA: firmwareCloud + "/wemo/NewFirmware.txt",
    PATH_MINICLOUD: firmwareCloud + "/wemo/NewFirmware.txt",
    PATH_DEV:"http://173.196.160.173/wemo/NewFirmware.txt"
};

var SQLColumns = {
    DB_NAME: "pluginrules2",
    DB_VERSION: "2",
    MAX_DB_VERSION: "9",
    //    MAX_DB_VERSION:"6",
    //DO NOT CHANGE THIS VARIABLE - this variable tracks the origin of when productName column is introduced.
    PRODUCTNAME_ADDED_IN_RULES: "7",
    RULE_DEVICE_PK: "RuleDevicePK",
    RULE_ID: "RuleID",
    DEVICE_ID: "DeviceID",
    GROUP_ID: "GroupID",
    DAY_ID: "DayID",
    START_TIME: "StartTime",
    RULE_DURATION: "RuleDuration",
    START_ACTION: "StartAction",
    END_ACTION: "EndAction",
    SENSOR_DURATION: "SensorDuration",
    TYPE: "Type",
    VALUE: "Value",
    LEVEL: "Level"
};

var networkSecurity = {

    CHANNEL: "255",

    OPEN: "Open",
    AUTH_OPEN: "OPEN",
    ENCRYPT_OPEN: "NONE",

    WEP: "WEP",
    AUTH_WEP: "WEP",
    ENCRYPT_WEP: "WEP",

    WPA: "WPA",
    AUTH_WPA: "WPA1PSKWPA2PSK",
    ENCRYPT_WPA: "AES",

    WPA2: "WPA2",
    AUTH_WPA2: "WPA1PSKWPA2PSK",
    ENCRYPT_WPA2: "AES"
};

var email = {
    help: "wemohelp@belkin.com",
    maxLength: 254
};

var firmwareUpgradeProcess = {
    Interval: 5
};

var remoteAccessEnable = {
    tries: 5
};

var ledLocalCache = {
	INITIAL_CACHE: 'initialCache',
	ADD_DEVICE_AFTER_STATUS: 'addDeviceAfterStatus'
};

var notificationType = {
    BINARY_STATE: 'BinaryState',
    FIRMWARE_STATE: 'FirmwareUpdateStatus',
    LED_CHANGE_STATE: 'StatusChange',
    HOMESENSE_CHANGE_STATE: "SensorChange"
};

var buildXML = {
    PLUGIN_STATE: 'PLUGIN_STATE',
    FIRMWARE_VERSION: 'FIRMWARE_VERSION',
    FIRMWARE_UPGRADE: 'FIRMWARE_UPGRADE',
    CHANGE_FRIENDLY_NAME: 'CHANGE_FRIENDLY_NAME',
    SET_POWER_THRESHOLD: 'SET_POWER_THRESHOLD',
    GET_DEV_STAT: 'GET_DEV_STAT',
    SET_HOME_SETTINGS: 'SET_HOME_SETTINGS',
    GET_EXPORT_SCHEDULE: 'GET_EXPORT_SCHEDULE',
    SAVE_EXPORT_SCHEDULE: 'SAVE_EXPORT_SCHEDULE',
    CLEAR_USAGE_DATA: 'CLEAR_USAGE_DATA',
    CLEAR_NAME_ICONS_RULES: 'CLEAR_NAME_ICONS_RULES',
    SET_NIGHT_LIGHT_STATUS: 'SET_NIGHT_LIGHT_STATUS',
    GET_NIGHT_LIGHT_STATUS: 'GET_NIGHT_LIGHT_STATUS',
    UPDATE_WEEKLY_CALENDER: 'UPDATE_WEEKLY_CALENDER'
};

var wemoSwitch = {
    TYPE: 'urn:Belkin:device:controllee:1',
    REMOTE_TYPE: 'Socket',
    ICON: 'file:///android_asset/www/img/new_icons/WeMo_Switch_Old_@3x.png',
    NAME: 'DefaultName_WeMoSwitch', //key from language file
    SETUP_TITLE: 'WeMoSwitchSetUp', //key from language file
    SETUP_SUCCESS_MESSAGE: 'SetupSuccessful_SwitchSetupInstructions' //key from language file
};

var wemoMini = {
    TYPE: 'urn:Belkin:device:controllee:1',
    REMOTE_TYPE: 'Socket',
    ICON: 'file:///android_asset/www/img/new_icons/switchv2.png',
    NAME: 'DefaultName_WeMoSwitch', //key from language file
    SETUP_TITLE: 'WeMoSwitchSetUp', //key from language file
    SETUP_SUCCESS_MESSAGE: 'SetupSuccessful_SwitchSetupInstructions' //key from language file
};

var wemoSensor = {
    TYPE: 'urn:Belkin:device:sensor:1',
    REMOTE_TYPE: 'Sensor',
    ICON: 'file:///android_asset/www/img/new_icons/WeMo_Motion_@3x.png',
    NAME: 'DefaultName_WeMoMotion', //key from language file
    SETUP_TITLE: 'WeMoSensorSetup', //key from language file
    SETUP_SUCCESS_MESSAGE: 'SetupSuccessful_SensorSetupInstructions' //key from language file
};

var nestThermostat = {
    //TYPE: 'urn:Belkin:device:sensor:1',
    REMOTE_TYPE: 'NestThermostat',
    //ICON: 'file:///android_asset/www/img/new_icons/WeMo_Motion_@3x.png',
    NAME: 'Nest Thermostat', //key from language file
    //SETUP_TITLE: 'WeMoSensorSetup', //key from language file
    //SETUP_SUCCESS_MESSAGE: 'SetupSuccessful_SensorSetupInstructions' //key from language file
};

var wemoLightSwitch = {
    TYPE: 'urn:Belkin:device:lightswitch:1',
    REMOTE_TYPE: 'Lightswitch',
    ICON: 'file:///android_asset/www/img/new_icons/WeMo_LightSwitch_@3x.png',
    NAME: 'DefaultName_WeMoLightSwitch', //key from language file
    SETUP_TITLE: 'WeMoLightSwitchSetup', //key from language file
    SETUP_SUCCESS_MESSAGE: 'SetupSuccessful_SwitchSetupInstructions' //key from language file
};

var wemoLinkCam = {
    TYPE: 'urn:Belkin:device:LinksysWNCSensor:1',
    REMOTE_TYPE: 'LinkCam',
    ICON: 'file:///android_asset/www/img/belkin_netcam_small.png',
    NAME: 'DefaultName_WeMoLinkCam', //key from language file
    SETUP_TITLE: 'WeMoLightSwitchSetup', //key from language file
    SETUP_SUCCESS_MESSAGE: 'SetupSuccessful_SwitchSetupInstructions' //key from language file
};

var wemoNetCam = {
    TYPE: 'urn:Belkin:device:NetCamSensor:1',
    REMOTE_TYPE: 'NetCam',
    ICON: 'file:///android_asset/www/img/belkin_netcam_small.png',
    NAME: 'DefaultName_WeMoNetCam', //key from language file
    SETUP_TITLE: 'WeMoLightSwitchSetup', //key from language file
    SETUP_SUCCESS_MESSAGE: 'SetupSuccessful_SwitchSetupInstructions' //key from language file
};

var wemoNetCamHDv1 = {
    REMOTE_TYPE: 'NetCamHDv1',
    ICON: 'file:///android_asset/www/img/belkin_netcam_HD_small.png'
};
var wemoNetCamHDv2 = {
    REMOTE_TYPE: 'NetCamHDv2',
    ICON: 'file:///android_asset/www/img/belkin_netcam_HD_small.png'
};
var wemoSlowCooker = {
    TYPE: 'urn:Belkin:device:Crockpot:1',
    REMOTE_TYPE: 'Crockpot',
    ICON: 'file:///android_asset/www/img/new_icons/CrockPot_SlowCooker_@3x.png',
    NAME: 'DefaultName_WeMoSlowCooker', //key from language file
    SETUP_TITLE: 'WeMoSlowCookerSetup', //key from language file
    SETUP_SUCCESS_MESSAGE: 'SetupSuccessful_SlowCookerSetupInstructions' //key from language file
};

var wemoHeater = {
    TYPE: 'urn:Belkin:device:Heater:1',
    REMOTE_TYPE: 'Heater',
    ICON: 'file:///android_asset/www/img/new_icons/HolmesBionaire_Heater_@3x.png',
    NAME: 'DefaultName_WeMoHeater', //key from language file
    SETUP_TITLE: 'WeMoHeaterSetup', //key from language file
    SETUP_SUCCESS_MESSAGE: 'SetupSuccessful_HeaterSetupInstructions' //key from language file
};

var wemoHeaterA = {
    TYPE: 'urn:Belkin:device:HeaterA:1',
    REMOTE_TYPE: 'HeaterA',
    ICON: 'file:///android_asset/www/img/new_icons/HolmesBionaire_Heater_@3x.png',
    NAME: 'DefaultName_WeMoHeaterA', //key from language file
    SETUP_TITLE: 'WeMoHeaterSetup', //key from language file
    SETUP_SUCCESS_MESSAGE: 'SetupSuccessful_HeaterSetupInstructions' //key from language file
};

var wemoHeaterB = {
    TYPE: 'urn:Belkin:device:HeaterB:1',
    REMOTE_TYPE: 'HeaterB',
    ICON: 'file:///android_asset/www/img/new_icons/HolmesBionaire_Heater_@3x.png',
    NAME: 'DefaultName_WeMoHeaterB', //key from language file
    SETUP_TITLE: 'WeMoHeaterSetup', //key from language file
    SETUP_SUCCESS_MESSAGE: 'SetupSuccessful_HeaterSetupInstructions' //key from language file
};

var wemoAirPurifier = {
    TYPE: 'urn:Belkin:device:AirPurifier:1',
    REMOTE_TYPE: 'AirPurifier',
    ICON: 'file:///android_asset/www/img/new_icons/HolmesBionaire_AirPurifier_@3x.png',
    NAME: 'DefaultName_WeMoAirPurifier', //key from language file
    SETUP_TITLE: 'WeMoAirPurifierSetup', //key from language file
    SETUP_SUCCESS_MESSAGE: 'SetupSuccessful_AirPurifierSetupInstructions' //key from language file
};

var wemoHumidifier = {
    TYPE: 'urn:Belkin:device:Humidifier:1',
    REMOTE_TYPE: 'Humidifier',
    ICON: 'file:///android_asset/www/img/new_icons/Holmes_Console_Humidifier_@3x.png',
    NAME: 'DefaultName_WeMoHumidifier', //key from language file
    SETUP_TITLE: 'WeMoHumidifierSetup', //key from language file
    SETUP_SUCCESS_MESSAGE: 'SetupSuccessful_HumidifierSetupInstructions' //key from language file
};

var wemoHumidifierB = {
    TYPE: 'urn:Belkin:device:HumidifierB:1',
    REMOTE_TYPE: 'HumidifierB',
    ICON: 'file:///android_asset/www/img/new_icons/Holmes_Console_Humidifierb_@3x.png',
    NAME: 'DefaultName_WeMoHumidifierB', //key from language file
    SETUP_TITLE: 'WeMoHumidifierBSetup', //key from language file
    SETUP_SUCCESS_MESSAGE: 'SetupSuccessful_HumidifierBSetupInstructions' //key from language file
};

var wemoCoffeeMaker = {
    TYPE: 'urn:Belkin:device:CoffeeMaker:1',
    REMOTE_TYPE: 'CoffeeMaker',
    ICON: 'file:///android_asset/www/img/new_icons/MrCoffee_Machine_@3x.png',
    NAME: 'DefaultName_WeMoCoffeeMaker', //key from language file
    SETUP_TITLE: 'WeMoCoffeeMakerSetup', //key from language file
    SETUP_SUCCESS_MESSAGE: 'SetupSuccessful_CoffeeMakerSetupInstructions' //key from language file
};

var wemoInsight = {
    TYPE: 'urn:Belkin:device:insight:1',
    REMOTE_TYPE: 'Insight',
    ICON: 'file:///android_asset/www/img/new_icons/WeMo_Insight_Switch_@3x.png',
    NAME: 'DefaultName_WeMoInsight', //key from language file
    SETUP_TITLE: 'WeMoInsightSetUp', //key from language file
    SETUP_SUCCESS_MESSAGE: 'SetupSuccessful_InsightSetupInstructions' //key from language file
};

var wemoMaker = {
    TYPE: 'urn:Belkin:device:Maker:1',
    REMOTE_TYPE: 'Maker',
    ICON: 'file:///android_asset/www/img/new_icons/WeMo_Maker_@3x.png',
    NAME: 'DefaultName_WeMoMaker', //key from language file
    SETUP_TITLE: 'WeMoMakerSetUp', //key from language file
    SETUP_SUCCESS_MESSAGE: 'SetupSuccessful_MakerSetupInstructions', //key from language file
};
var wemoLed = {
    TYPE: 'urn:Belkin:device:bridge:1',
    REMOTE_TYPE: 'LED',
    ICON: 'file:///android_asset/www/img/new_icons/WeMo_LightBulb_@3x.png',
    NAME: 'DefaultName_wemoLed', //key from language file
    SETUP_TITLE: 'WeMoBridgeSetup', //key from language file
    SETUP_SUCCESS_MESSAGE: 'SetupSuccessful_SwitchSetupInstructions' //key from language file
};

var wemoDimmer = {
    TYPE: 'urn:Belkin:device:dimmer:1',
    REMOTE_TYPE: 'Dimmer',
    ICON: 'file:///android_asset/www/img/new_icons/WeMo_Dimmer_@3x.png',
    NAME: 'DefaultName_WeMoDimmer', //key from language file
    SETUP_TITLE: 'WeMoDimmerSwitchSetup', //key from language file
    SETUP_SUCCESS_MESSAGE: 'SetupSuccessful_DimmerSetupInstructions' //key from language file
};

var wemoDevice = {
    SWITCH: wemoSwitch,
    SENSOR: wemoSensor,
    LIGHT_SWITCH: wemoLightSwitch,
    MAKER: wemoMaker,
    INSIGHT: wemoInsight
};

var deviceStates = {
    OFF: '0',
    ON: '1',
    STANDBY: '8',
    UNAVAILABLE: '-1'
};

/***Condition Type: ID:***/
var codeType = {
    E_COST: 0,
    E_ON_DURATION: 1,
    E_OFF_DURATION: 2,
    E_SBY_DURATION: 3,
    E_STATE: 4
};

/***Operation Code:***/
var codeValue = {
    E_EQUAL: 0,
    E_LARGER: 1,
    E_LESS: 2,
    E_EQUAL_OR_LARGER: 3,
    E_EQUAL_OR_LESS: 4
};

/***Operation Code:***/
var configValue = {
    REG_DATA_CLOUD_MAX_RETRIES: 4,
    REFRESH_RESET_MAX_RETRIES: 4,
    REG_DATA_CLOUD_SLEEP_INTV: 10000,
    MESSAGE_SLEEP_INTV: 5000,
    SO_FW_SUPPORT: 4003,
    SRSS_FW_SUPPORT: 3609,
    MOTION_NOTIFY_FW_SUPPORT: 3949,
    COUNTDOWN_FW_SUPPORT: 7473,
    MAKER_FW_SUPPORT: 6658,
    FETCHSTORE_FW_SUPPORT: 8725,
    FIRMWARE_VERSION_REQUIRED_RULES: 2095
};


var SRSSMode = {
    SUNRISE: "Sunrise",
    SUNSET: "Sunset"
};

var formats = {
    DateTimeFormat: "dd MMM yyyy, hh:mm a"
};
var dimValues = {
    High: "High",
    Low: "Low",
    Off: "Off"
};

var lightSwitch = {
    GET: "GET_NIGHT_LIGHT_STATUS",
    SET: "SET_NIGHT_LIGHT_STATUS"
};
var reloadDeviceList = {
    MAX_RELOAD_TIMER: 4,
    MAX_REFRESH_CLICKS: 3
};
var ledModelcode = {
    LED: "MZ100",
    OSRAM: "iQBR30",
	OSRAMTTBPROD: "LIGHTIFY A19 Tunable White",
    OSRAMFLEXPROD: "LIGHTIFY Flex RGBW",
    OSRAMCTBPROD: "LIGHTIFY Gardenspot RGB",
    OSRAMTTBPILOT: "Classic A60 TW",
    OSRAMFLEXPILOT: "Flex RGBW",
    OSRAMCTBPILOT: "Gardenspot RGB",
    CREE: "Connected A-19 60W Equivalent"
};
var ledManufacturerName = {
    LED: "MRVL",
    OSRAM: "OSRAM SYLVANIA",
    HOMESENSE: "Belkin",
    OSRAMCOLOR: "OSRAM",
    CREE: "CREE"
};
var ledDefalutImg = {
    Defalut_URL: "/../../img/ic_bulbimage_small.png",
    Dynamic: "file:///android_asset/www/img/",
    Defalut: "bulb_mrvl_mz100.png",
    Defalut_Setup_URL: "../../img/ic_bulbimage_small.png"
};
var ledCapabilities = {
    ONOFF: "10006",
    DIMMING: "10008",
    FADER: "30008",
    TEMPERATURE: "30301",
    COLOR: "10300"
};
var homeSenseCapabilities = {
    ONOFF: "10500",
    SENSORENABLEDISABLE: "20500",
    TESTMODE: "30501",
    KEYPRESS: "20502"
};
var homeSenseModelCodes = {
    HOMESENSE: "ZigBeeSensor",
    ALARM: "F7C040",
    KEYFOB: "F7C039",
    PIR: "F7C041",
    DOORWINDOWS: "F7C038"
};
var firmwareMessagingEnum = {
    ZERO: 0,
    ONE: 1,
    TWO: 2,
    THREE: 3,
    FOUR: 4,
    FIVE: 5,
    SIX: 6
};

var setupConstants = {
    "autoNetworkSwitchHelpDocument": "http://www.belkin.com/us/support-article?articleNum=110936"
}

var androidDeviceModels = {
    NEXUS9: "Nexus 9",
    VOLANTIS: "Volantis",
    FLOUNDER: "Flounder"
}

var deviceStatus = {
	INACTIVE: "3"
};

var ledDeviceConstants = {
    GROUPLITAG: "group_li",
    SINGLELITAG: "switch_li",
    SINGLE: "single",
    GROUP: "group",
    CAPABILITYONOFF: "onoff",
    CAPABILITYDIMMING: "dimming",
    CAPABILITYFADER: "fadder",
    CAPABILITYTEMPERATURE: "temperatureColor",
    CAPABILITYCOLOR: "flexColor",
    CAPABILITYDRAWER: "drawerview",
    DISABLED: "disabled",
    INTERMITENTSTATE: "switch_activated",
    STATUSDIMMINGVALCHANGE: "statusdimmingvalchange",
    STATUSFADER: "bedTimeSleep",
    YES: "YES",
    NO: "NO",
    FOBAWAY: "fobAwayIcon",
    FOBACTIVE: "fobIcon",
    HOMESENSEON: "homesense_on",
    HOMESENSEOFF: "homesense_off",
    LEDDEVICESTYPE: "LED",
    HOMESENSEDEVICESTYPE: "Homesense"
};	
var statusCode = {
    OFF: 0,
    ON: 1
};

var WeMoDevicesUdns = {
    Bridge: "uuid:Bridge"
};

var regexpPattern = {
		insensitive: {
			fullname: "^[a-z\\'\\.\\- ]+$",
			email: "^[_a-z0-9-\\+]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9]+)*(\\.[a-z]{2,})$",
			telephone: "^[\\+\\-\\#\\*\\(\\)\\.\\s]*([0-9][\\+\\-\\#\\*\\(\\)\\.\\s]*){7,15}$",
			alphanum: "^[\\w\\d]+$"
		}
};

var regexpModifier = {
    insensitive: 'i',
    global: 'g',
    multiline: 'm'
};

var ReportAProblem = {
    PROBLEM: {
        "Remote Access": {
            code: "1001",
            key: "ReportaProblem_Problem_RemoteAccess"
        },
        "Local Access": {
            code: "1002",
            key: "ReportaProblem_Problem_LocalAccess"
        },
        "Rules Not Working": {
            code: "1003",
            key: "ReportaProblem_Problem_RulesNotWorking"
        },
        "IFTTT Issue": {
            code: "1004",
            key: "ReportaProblem_Problem_IFTTT"
        },
        "Setup Issue": {
            code: "1005",
            key: "ReportaProblem_Problem_Setup"
        },
        "Product Question": {
            code: "1006",
            key: "ReportaProblem_Problem_ProductQuestion"
        }
    },
    PRODUCT: {
        "Switch": {
            key: "ReportaProblem_Product_Switch"
        },
        "Motion": {
            key: "ReportaProblem_Product_Motion"
        },
        "Insight": {
            key: "ReportaProblem_Product_Insight"
        },
        "Light Switch": {
            key: "ReportaProblem_Product_LightSwitch"
        },
        "LED Bulb": {
            key: "ReportaProblem_Product_LEDBulb"
        },
        "Maker": {
            key: "ReportaProblem_Product_Maker"
        },
        "Coffee Maker": {
            key: "ReportaProblem_Product_CoffeeMaker"
        },
        "Humidifier": {
            key: "ReportaProblem_Product_Humidifier"
        },
        "Heater": {
            key: "ReportaProblem_Product_Heater"
        },
        "Air Purifier": {
            key: "ReportaProblem_Product_Purifier"
        },
        "Slow Cooker": {
            key: "ReportaProblem_Product_Cooker"
        },
        "App": {
            key: "ReportaProblem_Product_App"
        },
        "Link": {
            key: "ReportaProblem_Product_Link"
        },
        "Multiple Products": {
            key: "ReportaProblem_Product_MultipleProducts"
        },
    }
};

var deviceType = {
    HUMIDIFIER: 'humidifier',
    HUMIDIFIERB: 'humidifierB',
    HEATERA: 'heaterA',
    HEATERB: 'heaterB',
    CROCKPOT: 'crockpot',
    ARIPURIFIER: 'airPurifier'
};

var SmartAppliances = {
    CROCKPOT: {
        key: 'crockpot',
        locale: 'CrockPotString',
        icon: wemoSlowCooker.ICON
    },
    HEATERA: {
        key: 'heatera',
        locale: 'HeaterString',
        icon: wemoHeaterA.ICON
    },
    HEATERB: {
        key: 'heaterb',
        locale: 'HeaterString',
        icon: wemoHeaterB.ICON
    },
    HUMIDIFIER: {
        key: 'humidifier',
        locale: 'HumidifierString',
        icon: wemoHumidifier.ICON
    },
    HUMIDIFIERB: {
        key: 'humidifierb',
        locale: 'HumidifierBString',
        icon: wemoHumidifierB.ICON
    },
    AIRPURIFIER: {
        key: 'airpurifier',
        locale: 'AirPurifierString',
        icon: wemoAirPurifier.ICON
    },
    COFFEEMAKER: {
        key: 'coffeemaker',
        locale: 'CoffeeMakerString',
        icon: wemoCoffeeMaker.ICON
    },
    SENSOR: {
        key: 'sensor',
        locale: 'DefaultName_WeMoMotion',
        icon: wemoSensor.ICON
    },
    SWITCH: {
        key: 'switch',
        locale: 'DefaultName_WeMoSwitch',
        icon: wemoSwitch.ICON
    },
    INSIGHT: {
        key: 'insight',
        locale: 'DefaultName_WeMoInsight',
        icon: wemoInsight.ICON
    },
    BRIDGE: {
        key: 'bridge',
        locale: ''
    },
    LIGHTSWITCH: {
        key: 'lightswitch',
        locale: 'DefaultName_WeMoLightSwitch',
        icon: wemoLightSwitch.ICON
    },
    MAKER: {
        key: 'maker',
        locale: 'DefaultName_WeMoMaker',
        icon: wemoMaker.ICON
    },
    DIMMER: {
        key: 'dimmer',
        locale: 'DefaultName_WeMoDimmerShort',
        icon: wemoDimmer.ICON
    }
};

var keyChainRuleActionValues = {
		ARRIVES: 1,
		LEAVES: 0,
	    ARRIVESORLEAVES: 2,
	    BUTTON_PRESS:3
};

var ruleDrawerVal = {
		ON: 'on',
		OFF: 'off',
		ON_FOR: 'on_for'
};

var wemoPageNames = {
	LED: 'led',
	MORE: 'more',
	RULES: 'rules',
    DEVICE: 'device',
	DEMOSETUP: 'demo_setup_device',
    TELLUS: 'tell_us#reportaproblem',
    DEVICEHTML: 'device_list.html',
    HOMESENSESETUP: 'setup_success_homesense_devices.html',
    HOMESENSE_SETUP: 'setup_success_homesense_devices',
    LEDSETUP : 'led_setup'
};

var appRecoveryMechanismErrorCodes = ['ERR_002#403','WEMO_415#400','WEMO_414#400'];

var reportAProblemFieldLength = {
		firstName: 40,
		lastName: 80
};

var switchToggleState ={
		OFF: 0,
		ON: 1,
		TOGGLE: 2
}

var ruleState = {
		ENABLED_RULE: '1'
}

var DELIMITER_COMMA = ",";
var DELIMITER_SINGLE_QUOTE = '\'';
var LAST_ENTRY_VALUE = "1";

var TYPE_OF = {
		STRING: 	"string",
		FUNCTION: 	"function",
		UN_DEFINED:	"undefined"
};

var makerValues = {
		SWITCHMODE: '1'	
};

var doorWindowActionValues = {
		OPENS: 0,
		CLOSES: 1,
	    OPENSORCLOSES: 2
};

var stringBoolean = {
		TRUE: "true",
		FALSE: "false"
};

var smartReachability = {
		NO_NETWORK_MODE : "noNetworkModeisON"
};

var ruleErrorMsgs = {
		ERROR_MSG_DB_NOT_IN_SYNC : 'Rule could not be saved. Please refresh the Rules Screen!'
};

var storedFileTypes = {
    DEVICE_INFO_SERVICE: 'deviceinfoservice',
    SMART_SETUP: 'smartsetup',
    MANUFACURE: 'manufacure',
    FIRMWARE_UPDATE: 'firmwareupdate',
    RULES_SERVICE: 'rulesservice',
    META_INFO_SERVICE: 'metainfoservice',
    REMOTE_ACCESS: 'remoteaccess',
    JARDEN_SERVICE: 'jardenservice',
    SETUP: 'setup',
    TIME_SYNC_SERVICE: 'timesyncservice',
    EVENT_SERVICE: 'eventservice',
    DEVICE_SERVICE: 'deviceservice'
};

var localStorageKeys = {
    APPLIANCE_BRANDS: 'appliance.brands',
    RECORDS_INDEX: 'records._index_',
    RECORDS_PREFIX_SMART_DEVICES: 'records.websql://wemoSmartDevices:',
    REMEMBER_WIFI_SETTINGS: 'rememberWiFiSetting'
};

var productName = {
		DW_SENSORS: "DWSensor",
		FOB_SENSORS: "Fob",
		ALARM_SENSORS: "AlarmSensor",
		PIR_SENSORS: "PIR"
};

var homeSensorIconUrl ={
		DWSensor: "../img/bulb_belkin_f7c038.png",
		Fob: "../img/bulb_belkin_f7c039.png",
		PIR: "../img/bulb_belkin_f7c041.png"
};

var Setup = {
    Email: {
        LIMIT: 80
    }
};

var CloneDB = {
    DEFAULT_DB_PATH: "0",
    DEFAULT_CLONED_DB_PATH: "1"
};
