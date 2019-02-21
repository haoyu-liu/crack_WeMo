//Registered Plugin Name in config.xml to be used.
var SETUP_PLUGIN = "SetupPlugin";
var TAG = "setup_plugin.js: ";

//Plugin Actions
var ACTION_IS_NETWORK_CONNECTED = "isNetworkConnected";
var ACTION_IS_PLUGIN_CONNECTED = "isPluginConnected";
var ACTION_SETUP_DEVICE_DETAILS = "setupDeviceDetails";
var ACTION_SETUP_RECREATE_CONTROL_POINT = "recreateControlPoint";
var ACTION_OPEN_WIFI_SETTINGS = "openWifiSettings";
var ACTION_STOP_UPNP_SERVICE = "stopUpNpService";
var ACTION_GET_WIFI_AP_LIST = "getWiFiAPList";
var ACTION_POST_AP_PASSWORD_DATA = "postAPPasswordData";
var ACTION_GET_CONFIG_STATUS = "getConfigStatus";
var ACTION_CONNECT_TO_DEFAULT_ROUTER = "connectToDeafultRouter";
var ACTION_SET_FRIENDLY_NAME = "setFriendlyName";
//var ACTION_GET_EMAIL_PREF_STATUS = "getEmailPrefStatus";
//var ACTION_SET_EMAIL_PREF_STATUS = "setEmailPrefStatus";
var ACTION_GET_NETWORK_STATUS = "getNetworkStatus";
var ACTION_CLOSE_ACCESS_POINT = "closeAccessPoint";
var ACTION_CONNECT_WIFI_ROUTER = "connectWiFiRouter";
var ACTION_SET_CONFIG_STATUS = "setConfigStatus";
var ACTION_SET_DEVICE_IMAGE = "setDeviceImage";
var ACTION_GET_DEFAULT_ROUTER_SSID = "getDefaultRouterSSID";
var ACTION_ENABLE_REMOTE_ACCESS = "enableRemoteAccess";
var ACTION_START_SETUP_LISTENERS = "startSetupListeners";
var ACTION_STOP_SETUP_LISTENERS = "stopSetupListeners";
var ACTION_SET_BLOB_STORAGE = "setBlobStorage";
var ACTION_GET_BLOB_STORAGE = "getBlobStorage";
var ACTION_SET_ATTRIBUTES = "setAttributes";
var ACTION_GET_ATTRIBUTES = "getAttributes";
var ACTION_OPEN_NETWORK_SETUP= "openNetwork";
var ACTION_GET_END_DEVICE_SETUP= "getEndDevices";
var ACTION_GET_END_DEVICE_WARM= "getEndDevicesNew";
var ACTION_CLOSE_NETWORK_SETUP= "closeNetwork";
var ACTION_ADD_DEVICE_SETUP = "addDevice";
var ACTION_GET_END_LIST_RESPONSE = "getenddeviceresponse";
var ACTION_FIND_BULB_SETUP = "ledfindbulb";
var ACTION_SET_LED_FRIENDLY_NAME_SETUP = "setledfriendlyname";
var ACTION_SET_LED_STATUS_SETUP = "setledstatus";
var ACTION_START_GETEND_LISTENERS = "startgetendListeners";
var ACTION_STOP_GETEND_LISTENERS = "stopgetendListeners";
var ACTION_SET_CUSTOM_STATE= "setCustomizedState";
var ACTION_GET_CUSTOM_STATE= "getCustomizedState";
var ACTION_GET_FIRMWARE_VERSION = "getFirmwareVersion";

//LED 

var ACTION_OPEN_NETWORK= "2060";
var ACTION_GET_END_DEVICE ="2061";
var ACTION_GET_DEVICEIDS_FOR_CAPABILITY = "2062";
var ACTION_ADD_DEVICE = "2063";
var ACTION_REMOVE_DEVICE = "2064";
var ACTION_CLOSE_NETWORK = "2065";
var ACTION_SET_LED_STATUS = "2066";
var ACTION_GET_LED_STATUS = "2067";
var ACTION_CREATE_GROUP = "2068";
var ACTION_DELETE_GROUP = "2069";
var ACTION_GET_LED_IMAGE_FROM_DB = "8021";
var ACTION_INSERT_LED_IMAGE_TO_DB = "8022";
var ACTION_RESET_LED_IMAGE_IN_DB = "8023";
var ACTION_FIND_BULB = "2072";
var ACTION_ICON_CONVERTION_TO_BYTE = "2074";
var ACTION_ICON_UPLOAD_TO_CLOUD = "5023";
var ACTION_SET_SHAREDPREF_FADER_TIME= "2075";
var ACTION_GET_SHAREDPREF_FADER_TIME= "2076";
var ACTION_GET_LED_GRP_STATUS = "2081";
var ACTION_SET_BRIDGE_DATA = "8025";
var ACTION_GET_BRIDGE_DATA = "8026";
var ACTION_UPDATE_ZIGBEE_IN_CACHEDB="updateZigbeeInCacheDB";
var ACTION_INIT_CONTROL_POINT="initControlPoint";
	
var DEVICE_TYPE_SENSOR = "urn:Belkin:device:sensor:1";
var DEVICE_TYPE_DIMMER = "urn:Belkin:device:dimmer:1";
var DEVICE_TYPE_SWITCH = "urn:Belkin:device:controllee:1";
var DEVICE_TYPE_INSIGHT = "urn:Belkin:device:insight:1";
var DEVICE_TYPE_MAKER = "urn:Belkin:device:Maker:1";
var DEVICE_TYPE_BRIDGE = "urn:Belkin:device:bridge:1";
var DEVICE_TYPE_SLOWCOOKER = "urn:Belkin:device:crockpot:1";
var DEVICE_TYPE_COFFEEMAKER = "urn:Belkin:device:CoffeeMaker:1";
var DEVICE_TYPE_HEATERA = "urn:Belkin:device:HeaterA:1";
var DEVICE_TYPE_HEATERB = "urn:Belkin:device:HeaterB:1";
var DEVICE_TYPE_AIRPURIFIER = "urn:Belkin:device:AirPurifier:1";
var DEVICE_TYPE_HUMIDIFIER = "urn:Belkin:device:Humidifier:1";
var DEVICE_TYPE_HUMIDIFIERB = "urn:Belkin:device:HumidifierB:1";

var DEVICE_SENSOR = "WeMo Motion";
var DEVICE_SWITCH = "WeMo Switch";
var DEVICE_INSIGHT = "WeMo Insight";
var DEVICE_MAKER = "WeMo Maker";
var DEVICE_BRIDGE = "WeMo LED";
var ACTION_EDIT_ICON_IN_SETUP = "editIconInSetup";
	
var SENSOR_IMG_URL = "img/new_icons/WeMo_Motion_@3x.png";
var SWITCH_IMG_URL = "img/new_icons/WeMo_Switch_Old_@3x.png";
var MINI_IMG_URL = "img/new_icons/switchv2.png";
var INSIGHT_IMG_URL = "img/new_icons/WeMo_Insight_Switch_@3x.png";
var MAKER_IMG_URL = "img/new_icons/WeMo_Maker_@3x.png";
var LED_IMG_URL = "img/new_icons/WeMo_LightBulb_@3x.png";
var SENSOR_THUMB_URL = "file:///android_asset/www/img/new_icons/WeMo_Motion_@3x.png";
var SWITCH_THUMB_URL = "file:///android_asset/www/img/new_icons/WeMo_Switch_Old_@3x.png";
var INSIGHT_THUMB_URL = "file:///android_asset/www/img/new_icons/WeMo_Insight_Switch_@3x.png";
var LED_THUMB_URL = "file:///android_asset/www/img/new_icons/WeMo_LightBulb_@3x.png";
var MAKER_THUMB_URL = "file:///android_asset/www/img/new_icons/WeMo_Maker_@3x.png";

var CONNECT_TO_DEFAULT_ROUTER = "connectToDefaultRouter";

function library( module ) {

    $( function() {
        if ( module.init ) {
            module.init();
        }
    });

    return module;
}

/*var setupPlugin = library(function ($) {

    return {

        init: function () {

        },

        execute:function(success_callback, error_callback, action, args)
        {
            console.log("setup_plugin.js: execute Action: " + action)

            return cordova.exec(

                success_callback,

                error_callback,

                SETUP_PLUGIN,

                action,

                args

            );

        }

    };
}(jQuery));*/
