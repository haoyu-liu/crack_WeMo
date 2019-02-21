var TAG = "temp_rule.js: ";
var isRemoteModeEnabled = false;

$(document).bind('pageinit', function () {
    tempRule.initialize();
});

var tempRule = {

    initialize: function () {
        document.addEventListener('wemo-frameworks-loaded', this.onDeviceReady, false);
    },

    onDeviceReady: function () {
        nativeUtilPlugin.execute(
            function(type) {
                if (type == networkType.HOME_NETWORK)
                {
                    isRemoteModeEnabled = false;
                    window.sessionStorage.setItem(sessionStore.REMOTE_MODE, false);
                } else if (type == networkType.REMOTE_WIFI || type == networkType.REMOTE_MOBILE) {
                    isRemoteModeEnabled = true;
                    window.sessionStorage.setItem(sessionStore.REMOTE_MODE, true);

                    appPlugin.execute(
                    		function(params) {
                    			wemoUtil.infoLog(TAG, "GET_FW_VERSION: " + params);
                    			wemoUtil.setJSONObjectToSessionStorage(sessionStore.FIRMWARE_VERSION_DATA, params);
                    		},
                    		function(e) {},
                    		actions.GET_FW_VERSION, []
                    );
                }

                if (!isRemoteModeEnabled) {
                    deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
                } else {
                    wemoUtil.storeRemoteValue();
                }

                $.getScript(['../../../android_asset/www/js/classes/deviceObject.js'], function() {
                    $.getScript(['../../../android_asset/www/js/classes/remoteAccess.js'], function() {
                        if (isRemoteModeEnabled) {
                            $.getScript(['../../../android_asset/www/js/classes/cloudServices.js'], function() {
                            });
                        }
                        wemoUtil.DBCreate();
                        var devices = WeMoDeviceList._deviceList;
                        $.each(devices, function(udn) {
                            if (devices[udn].inactive == true) delete devices[udn];
                        });
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.LOCAL_DEVICE_LIST, devices);
                        window.sessionStorage.setItem(sessionStore.RULES_REMOTE_MODE, true);
                        setTimeout(wemoUtil.DBInitialize(), 500);
                    });
                });
            },
            function(e) {},
            actions.GET_NETWORK_TYPE_NEW, []
        );
    }
};