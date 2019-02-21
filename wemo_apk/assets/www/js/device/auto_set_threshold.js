$(document).bind('pageinit', function () {
	var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));
    auto_set_threshold.initialize();   
});
var udn = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN);
var auto_set_threshold = {

    TAG: 'auto_set_threshold.js: ',

    initialize: function () {
        wemoUtil.infoLog(auto_set_threshold.TAG, "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    onDeviceReady: function () {
        wemoUtil.infoLog(auto_set_threshold.TAG, "onDeviceReady");
        auto_set_threshold.bindEvents();
        wemoUtil.infoLog(auto_set_threshold.TAG, window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN));
        auto_set_threshold.setupDOMListeners();
    },

    bindEvents: function () {
        wemoUtil.infoLog(auto_set_threshold.TAG, "bindEvents");
        document.addEventListener('online', auto_set_threshold.onOnline, false);
        document.addEventListener('offline', auto_set_threshold.onOffline, false);
        document.addEventListener('backbutton', auto_set_threshold.onBackPress, false);
        document.addEventListener('pause', auto_set_threshold.onPause, false);
        document.addEventListener('resume', auto_set_threshold.onResume, false);
    },

    onOffline: function () {
        wemoUtil.infoLog(auto_set_threshold.TAG, "offLine");
    },

    onOnline: function () {
        wemoUtil.infoLog(auto_set_threshold.TAG, "onLine");
    },

    onBackPress: function () {   
		wemoUtil.loadUrl(filePath.INSIGHT_POWER_THRESHOLD_SETTINGS);
    },

    onPause: function () {
        wemoUtil.infoLog(auto_set_threshold.TAG, "onPause");
    },

    onResume: function () {
        wemoUtil.infoLog(auto_set_threshold.TAG, "onResume");
    },

    setupDOMListeners: function () {
        wemoUtil.infoLog(auto_set_threshold.TAG, 'setupDOMListeners');
        $("#detect_power").on("tap", function (e) { 
			auto_set_threshold.autoSetOkBtnHandler();                
        });
    },
	
	autoSetOkBtnHandler: function () {
		wemoUtil.infoLog(auto_set_threshold.TAG, 'autoSetOkBtnHandler');
        if (isRemoteEnabled) {
            var update_threshold =  parseFloat(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_POWER_NOW)) + 2000;
            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_POWER_THRESHOLD, update_threshold);           
            window.sessionStorage.setItem(sessionStore.THRESHOLD_IS_AUTO_SET, true);
            window.sessionStorage.removeItem(sessionStore.THRESHOLD_RESET);
			wemoUtil.infoLog(auto_set_threshold.TAG, update_threshold);
			wemoUtil.loadUrl(filePath.INSIGHT_POWER_THRESHOLD_SETTINGS);    
        }
        else {	
            deviceTabPlugin.execute(function (data) {
                    var update_threshold = parseFloat(data.powerNow) + 2000;
                    window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_POWER_THRESHOLD, update_threshold);
                    window.sessionStorage.setItem(sessionStore.THRESHOLD_IS_AUTO_SET, true);
                    window.sessionStorage.removeItem(sessionStore.THRESHOLD_RESET);
					wemoUtil.infoLog(auto_set_threshold.TAG, update_threshold);	
					wemoUtil.loadUrl(filePath.INSIGHT_POWER_THRESHOLD_SETTINGS);    
                },
                function (e) {                    
					wemoUtil.infoLog(editDevice.TAG, 'Plugin Failure Call back!!!!   ' + e);
                },
                actions.GET_INSIGHT_PARAMS,
                [udn]
            );
        }		  					
    }
};
