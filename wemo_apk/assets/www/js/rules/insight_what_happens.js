var TAG = "insight_what_happens.js: ";

$(document).bind('pageinit', function () {
    insight_what_happens.initialize();
});

var insight_what_happens = {

    initialize: function () {
        console.log(TAG + "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    onDeviceReady: function () {
        console.log(TAG + "onDeviceReady");
        insight_what_happens.bindEvents();
        //All initialization script goes here
        // Initiate Android type timer
        $('#TTicker .select_time').mobiscroll().time({
            theme: 'android',
            display: 'modal',
            animate: 'pop',
            mode: 'clickpick'
        });
        $("#what_happens_cancel_btn").on('pointerdown', function () {
            wemoUtil.loadPreviousUrl();
        });
        var x = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
        var cd = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE);


        var iconURL = '';
        nativeUtilPlugin.execute(
            function (base64String) {
                console.log('got image from DB success');
                iconURL = "data:image/png;base64, " + base64String;
            },
            insight_what_happens.reportError,
            actions.GET_BASE64_IMAGE_FROM_DB,
            [cd]
        );

        if (iconURL === null || iconURL == '') {
            if (cd.indexOf('Lightswitch') != -1) {
                $('#what_happens img.what_happen_device_icon').attr('src', '../img/belkin_light_switch_small.png');
            }
            if (cd.indexOf('Socket') != -1) {
                $('#what_happens img.what_happen_device_icon').attr('src', '../img/belkin_switch_big.png');
            }
        }

        $('#what_happens img.what_happen_device_icon').attr('src', iconURL);

        $('#device_name').html(window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE_NAME));
        if (x.Devices[cd]) {
            $("input[type='radio']").each(function () {
                if ($(this).val() == x.Devices[cd].StartAction) {
                    $(this).attr("checked", true).checkboxradio("refresh");
                }
            });
        }
        else {
            $('#switch_action_nothing').attr("checked", true).checkboxradio("refresh");
        }

        //To return back to home page: device list tab
        $(".wemo_logo").on("tap", function (e) {
            if (e.target.nodeName != "IMG") {
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }
        });

        $("#what_happens_save_btn").on('pointerdown', function () {
            var wemo_rule_type = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_TYPE);
            console.log("sessionStore.RULE_TYPE = " + wemo_rule_type);
            $("input[type='radio']").each(function () {
                if ($(this).is(':checked')) {
                    if ($(this).val() == 2) {
                        x.DeviceList += cd;
                        x.Devices[cd] = {};
                        x.Devices[cd].FName = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE_NAME);
                    }
                    else {
                        if (x.DeviceList == undefined) {
                            x.DeviceList = "";
                        }
                        //	alert("Device "+x.Devices[cd].StartAction);
                        x.DeviceList += cd;
                        x.Devices[cd] = {};
                        x.Devices[cd].StartAction = parseInt($(this).val());
                        x.Devices[cd].EndAction = (x.Devices[cd].StartAction) == "1" ? "0" : "1";
                        //     alert("Device "+x.Devices[cd].EndAction);
                        //x.Devices[cd].SensorDuration='-1';
                        x.Devices[cd].FName = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE_NAME);

                    }

                    //x.Devices[cd].Level = wemoUtil.convertTimeToMilliseconds($('#start_time').val());
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);

                }
            });

           if (wemo_rule_type == "notify_power_sensing_rule") {
                wemoUtil.loadUrl(filePath.NOTIFY_RULE);
            }
            else if (wemo_rule_type == sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE) {
            	window.sessionStorage.setItem(sessionStore.GCM_MAKER_SENSOR, "1");
                wemoUtil.loadUrl(filePath.NOTIFY_RULE);
            } else if (wemo_rule_type == 'edit_notify_rule') {
                wemoUtil.loadUrl(filePath.EDIT_NOTIFY_RULE);
            } else if (wemo_rule_type == sessionStore.NOTIFY_KEYCHAIN_PRESENCE_RULE) {
            	window.sessionStorage.setItem(sessionStore.GCM_KEYCHAIN_PRESENCE, "1");
                wemoUtil.loadUrl(filePath.NOTIFY_RULE);
            }
            //Need to redirect to the previous rule page [Simgle, Timer, Sensor];
        });
    },

    bindEvents: function () {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', insight_what_happens.onOnline, false);
        document.addEventListener('offline', insight_what_happens.onOffline, false);
        document.addEventListener("backbutton", insight_what_happens.onBackPress, false);
        document.addEventListener("pause", insight_what_happens.onPause, false);
        document.addEventListener("resume", insight_what_happens.onResume, false);
    },

    onOffline: function () {
        console.log(TAG + "offLine");
    },

    onOnline: function () {
        console.log(TAG + "onLine");
    },

    onBackPress: function () {
        if ($(".more_tab").is(":visible")) {
            $(".more_tab").hide();
            $('body').find('.modalWindow').transition({opacity: 0}, 400, function () {
                $(this).removeClass('isOpen');
            });
        }
        else {
            console.log(TAG + "onBackPress");
            wemoUtil.loadPreviousUrl();
        }
    },

    onPause: function () {
        console.log(TAG + "onPause");
    },

    onResume: function () {
        console.log(TAG + "onResume");
    },

    reportError: function (e) {
        console.log(TAG + "Plugin Error!!!!   " + e);
    }

};
