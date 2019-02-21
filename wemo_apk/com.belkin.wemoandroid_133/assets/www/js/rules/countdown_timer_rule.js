/*
 countdown_timer_rule.js

 Created by Belkin International, Software Engineering on 10/04/2013.
 Copyright (c) 2012-2013 Belkin International, Inc. and/or its affiliates. All rights reserved.

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

var TAG = "countdown_timer_rule.js: ";
var cur_drawer;
var UP_TF_IS24 = false; //UP-user preferences, TF-time format

$(document).bind('pageinit', function() {
    countdown_timer_rule.initialize();
});

var TimerDisector = function() {
    this.getTime = function(dayNumber) {
        var o = {};
        o.seconds = Math.floor(dayNumber % 60);
        dayNumber = dayNumber / 60;
        o.minutes = Math.floor(dayNumber % 60);
        dayNumber = dayNumber / 60;
        o.hours = Math.floor(dayNumber % 24);
        return o;
    };
}

var countdown_timer_rule = {
    deviceList: {},
    ruleObj: {},

    initialize: function() {
        console.log(TAG + "initialize");
        var isEdit = window.sessionStorage.getItem(sessionStore.isEdit);
        if (isEdit == sessionStore.RULE_NEW) {
            $('.sub_header > span').html(wemo.items['NewCountdownRuleTitle']);
        } else {
            $('.sub_header > span').html(wemo.items['EditCountdownTimerRule']);
        }
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    onDeviceReady: function() {
        var self = this;
        UP_TF_IS24 = wemoUtil.userPreferences.getTimeFormat();
        
        if (!isRemoteEnabled) {
        $.when(wemoUtil.getDevices(actions.SELECT_SWITCHES),wemoUtil.getDevices(actions.SELECT_DIMMERS), wemoUtil.getDevices(actions.SELECT_INSIGHTS), wemoUtil.getDevices(actions.SELECT_LED_DEVICES))
            .then(function() {
                countdown_timer_rule.afterOnDeviceReady();

            }).fail(function() {
                throw ('ERROR');
            });
        }else{
        	countdown_timer_rule.afterOnDeviceReady();
        }
    },
    afterOnDeviceReady: function() {
        $.getScript('../js/classes/deviceList.js', function() {
            $.getScript('../js/vendor/date.js', function() {
                countdown_timer_rule.methodMain();
            });
        });
    },

    setDefaultCountdownTime: function() {
        var timerDisector = new TimerDisector();
        if (countdown_timer_rule.ruleObj.When.CountdownTime != undefined) {
            var t = timerDisector.getTime(countdown_timer_rule.ruleObj.When.CountdownTime);
            var r = [1, 5, 10, 15, 30, 45, 60];
            if (r.indexOf(t.minutes) >= 0) {
                $("#cdtr_block .buttonImage").removeClass('buttonActive');
                $("#cdtr_block .buttonImage").each(function(e) {
                    if ($(this).data('time') == t.minutes) {
                        $(this).addClass('buttonActive');
                    }
                });
            } else if (t.minutes == 0 && t.hours == 1) {
                $("#cdtr_block .buttonImage").removeClass('buttonActive');
                $("#cdtr_block .buttonImage").each(function(e) {
                    if ($(this).data('time') == 60) {
                        $(this).addClass('buttonActive');
                    }
                });
            } else {
                $("#cdtr_block .buttonImage").removeClass('buttonActive');
                $('#customPicker').text(t.hours + ' H ' + t.minutes + ' M');
                $('#customPicker').addClass('customPickerInGreen');
            }
        }
    },

    loadDevices: function() {
        console.log(JSON.stringify(countdown_timer_rule.ruleObj));
        var devices = [];
        var bridgeUDN = '';

        if (isRemoteEnabled) {
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA).concat(devices);
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DIMMER_DATA).concat(devices);
        } else {
            var tempDevices = '';
            devices = wemoUtil.getDevices(actions.SELECT_SWITCHES);
            devices = wemoUtil.getDevices(actions.SELECT_INSIGHTS).concat(devices);
            devices = wemoUtil.getDevices(actions.SELECT_DIMMERS).concat(devices);
        }

        if (devices != null && devices.length > 0) {
            $.each(devices, function(inx) {
                if ((devices[inx].udn).indexOf("uuid") == -1) {
                    if (devices[inx].udn == '') {
                        devices[inx].udn = devices[inx].macAddress;
                        deviceList.addLedDevice(devices[inx].macAddress, devices[inx].friendlyName, bridgeUDN);
                    } else
                        deviceList.addLedDevice(devices[inx].udn, devices[inx].friendlyName, devices[inx].bridgeudn);
                } else {
                    deviceList.addDevice(devices[inx].udn, devices[inx].friendlyName);
                }

                console.log(JSON.stringify(countdown_timer_rule.ruleObj.Devices));
                for (var dev in countdown_timer_rule.ruleObj.Devices) {
                        console.log(countdown_timer_rule.ruleObj.Devices[dev]);
                        if (dev == devices[inx].udn) {
                            if (countdown_timer_rule.ruleObj.Devices[dev].StartAction == 0) {
                                deviceList.setActive(devices[inx].udn, 'off');
                            } else if (countdown_timer_rule.ruleObj.Devices[dev].StartAction == 1) {
                                if ((countdown_timer_rule.ruleObj.Devices[dev].SensorDuration != 0) && (countdown_timer_rule.ruleObj.Devices[dev].SensorDuration != 1)) {
                                    var time = (new Date).clearTime()
                                        .addSeconds(countdown_timer_rule.ruleObj.Devices[dev].SensorDuration)
                                        .toString('HH:mm');
                                    deviceList.setActive(devices[inx].udn, 'on', time);
                                } else {
                                    deviceList.setActive(devices[inx].udn, 'on', countdown_timer_rule.ruleObj.Devices[dev].SensorDuration);
                                }
                            }
                        }
                }
            });
        }


    },


    renderDeviceList: function() {
        for (var udn in deviceList.getArray()) {
            var state = '',
                html = '';

            if (udn.indexOf("uuid") == -1) {
                window.sessionStorage.setItem(sessionStore.LED_BRIDGE_UDN_ID, deviceList.getDevice(udn).bridgeudn);
            }
            if (deviceList.getDevice(udn).state != undefined) {
                if (deviceList.getDevice(udn).state == 'on') {
                    var duration = 0;
                    if (deviceList.getDevice(udn).duration != undefined) {
                        duration = deviceList.getDevice(udn).duration;
                    }
                    state = 'on';
                } else if (deviceList.getDevice(udn).state == "off") {
                    state = wemo.items['off'];
                }
            }

            html = '<div class="select_switches_list more_li_clone more_li_clone_top" data-udn="' + udn + '"><div class="display_table"><span class="display_cell"><span class="fname">' + deviceList.getDevice(udn).name + '</span></span></div><span class="check_mark"></span></div></div>';

            console.log("CountTimer Rule Device Tile " + html);
            $('#countdown_container #device_list').append($(html));

            if (state != '') {
                $('div [data-udn="' + udn + '"] ').find('.check_mark').show();
            }
        }

    },

    deselectDevice: function(udn) {
        deviceList.unsetActive(udn);
    },

    selectDevice: function(type, duration, udn) {
        deviceList.setActive(udn, type, duration);
    },

    createPicker: function() {

        $("#customPicker").mobiscroll().timespan({
            wheelOrder: 'hhii',
            theme: 'wemoModal',
            mode: 'modal',
            steps: 1,
            minTime: 60000,    //1m
            maxTime: 86340000, //23h59m
            display: 'modal',
            rows: 3,
            headerText: "Custom Timer",
            labels: ['Y', 'M', 'D', 'H', 'M', 'S'],
            buttons: [
                'cancel',
                'set'
            ],
            closeOnOverlay: false,
            onBeforeShow: function(inst) {
                inst.settings.mode = 'clickpick';
                var pickerVal = $('#customPicker').text();
                if (pickerVal.toLowerCase() == 'set') {
                    inst.setValue(['0', '15']);
                } else {
                    var porDefecto = pickerVal.split(' ');
                    if (porDefecto.length > 0) {
                        inst.setValue([porDefecto[0], porDefecto[2]]);
                    }
                }
            },
            onClose: function(value, btn) {
                if (btn === 'set') {
                    $('#customPicker').addClass('customPickerInGreen');
                    $('#customPicker').text(value);
                    var timearr = value.split(' ');
                    var epoch = timearr[0] * 3600 + timearr[2] * 60;
                    console.log('countdown_timer_rule -> custom time: ' + epoch);
                    countdown_timer_rule.ruleObj.When.CountdownTime = epoch;
                } else {
                    countdown_timer_rule.setDefaultCountdownTime();
                }
            }
        });
        $('#customPicker').mobiscroll('show');

    },

    methodMain: function() {
        var networktype = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_NETWORKTYPE);
        console.log(TAG + "onDeviceReady");
        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
        wemoUtil.setTimeFormat();
        countdown_timer_rule.bindEvents();

        countdown_timer_rule.ruleObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
        countdown_timer_rule.ruleObj.RuleType = sessionStore.COUNTDOWN_TIMER;
        countdown_timer_rule.loadDevices();
        countdown_timer_rule.renderDeviceList();

        $("#device_not_selected_ok").on("tap", function(e) {
            $("#device_not_selected").popup('close');
            $('body').off('touchmove');
            e.preventDefault();
        });

        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);

        //To return back to home page: device list tab
        $(".wemo_logo").on("tap", function(e) {
            if (e.target.nodeName != "IMG") {
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }
        });

        if (countdown_timer_rule.ruleObj.When.CountdownTime == undefined) {
            countdown_timer_rule.ruleObj.When.CountdownTime = 60;
        }
        countdown_timer_rule.setDefaultCountdownTime();

        if (countdown_timer_rule.ruleObj.When.EndTime == 0)
            countdown_timer_rule.ruleObj.When.EndTime = timestamp.MIDNIGHT_END_TIME;
        else if (countdown_timer_rule.ruleObj.When.EndTime == undefined)
            countdown_timer_rule.ruleObj.When.EndTime = parseInt(countdown_timer_rule.ruleObj.When.StartTime, 10) + parseInt(countdown_timer_rule.ruleObj.When.RuleDuration, 10);
        // **********  display time values
        if ((countdown_timer_rule.ruleObj.When.StartTime == undefined || countdown_timer_rule.ruleObj.When.EndTime == undefined)) {
            /*
            THIS SHOULD BE THE DEFAULT SETTING WHEN LOADING THIS SCREEN - ALL DAY, DAILY
            */
            countdown_timer_rule.ruleObj.When.StartTime = parseInt(sessionStore.ALLDAY_STARTTIME, 10);
            countdown_timer_rule.ruleObj.When.EndTime = parseInt(sessionStore.ALLDAY_ENDTIME, 10);

            var tempDisSelectday = wemo.items['Daily'];
            $("#countdown_when .select_time").text(sessionStore.SENSOR_ALLDAY);
            $("#countdown_when .select_day").html(tempDisSelectday);
            //countdown_timer_rule.ruleObj.SelectedDayOrRange = "Daily";
        } else {
            //var EndTime=parseInt(countdown_timer_rule.ruleObj.When.EndTime)
            if (countdown_timer_rule.ruleObj.When.StartSRSS != undefined && countdown_timer_rule.ruleObj.When.EndSRSS != undefined) {

                if (countdown_timer_rule.ruleObj.When.onSRSS_Title != undefined) {
                    var tempStartSRSS = countdown_timer_rule.ruleObj.When.onSRSS_Title;
                } else {
                    if (countdown_timer_rule.ruleObj.When.StartSRSS == "Sunrise") {
                        var tempStartSRSS = wemo.items['SunRise'];
                    } else if (countdown_timer_rule.ruleObj.When.StartSRSS == "Sunset") {
                        var tempStartSRSS = wemo.items['SunSet'];
                    } else {
                        var tempStartSRSS = countdown_timer_rule.ruleObj.When.StartSRSS;
                    }
                }

                if (countdown_timer_rule.ruleObj.When.offSRSS_Title != undefined) {
                    var tempEndSRSS = countdown_timer_rule.ruleObj.When.offSRSS_Title;
                } else {
                    if (countdown_timer_rule.ruleObj.When.EndSRSS == "Sunrise") {
                        var tempEndSRSS = wemo.items['SunRise'];
                    } else if (countdown_timer_rule.ruleObj.When.EndSRSS == "Sunset") {
                        var tempEndSRSS = wemo.items['SunSet'];
                    } else {
                        var tempEndSRSS = countdown_timer_rule.ruleObj.When.EndSRSS;
                    }
                }

                $("#countdown_when .select_time").text(tempStartSRSS + " - " + tempEndSRSS);

            } else if (countdown_timer_rule.ruleObj.When.StartSRSS == undefined && countdown_timer_rule.ruleObj.When.EndSRSS != undefined) {

                if (countdown_timer_rule.ruleObj.When.offSRSS_Title != undefined) {
                    var tempEndSRSS = countdown_timer_rule.ruleObj.When.offSRSS_Title;
                } else {
                    if (countdown_timer_rule.ruleObj.When.EndSRSS == "Sunrise") {
                        var tempEndSRSS = wemo.items['SunRise'];
                    } else if (countdown_timer_rule.ruleObj.When.EndSRSS == "Sunset") {
                        var tempEndSRSS = wemo.items['SunSet'];
                    } else {
                        var tempEndSRSS = countdown_timer_rule.ruleObj.When.EndSRSS;
                    }
                }

                $("#countdown_when .select_time").text(wemoUtil.convertMillisecondsToTF(countdown_timer_rule.ruleObj.When.StartTime, UP_TF_IS24) + " - " + tempEndSRSS);

            } else if (countdown_timer_rule.ruleObj.When.StartSRSS != undefined && countdown_timer_rule.ruleObj.When.EndSRSS == undefined) {

                if (countdown_timer_rule.ruleObj.When.onSRSS_Title != undefined) {
                    var tempStartSRSS = countdown_timer_rule.ruleObj.When.onSRSS_Title;
                } else {
                    if (countdown_timer_rule.ruleObj.When.StartSRSS == "Sunrise") {
                        var tempStartSRSS = wemo.items['SunRise'];
                    } else if (countdown_timer_rule.ruleObj.When.StartSRSS == "Sunset") {
                        var tempStartSRSS = wemo.items['SunSet'];
                    } else {
                        var tempStartSRSS = countdown_timer_rule.ruleObj.When.StartSRSS;
                    }
                }

                $("#countdown_when .select_time").text(tempStartSRSS + " - " + wemoUtil.convertMillisecondsToTF(countdown_timer_rule.ruleObj.When.EndTime, UP_TF_IS24));

            } else if (countdown_timer_rule.ruleObj.When.StartSRSS == undefined && countdown_timer_rule.ruleObj.When.EndSRSS == undefined) {
                if (countdown_timer_rule.ruleObj.When.StartTime == sessionStore.ALLDAY_STARTTIME && countdown_timer_rule.ruleObj.When.EndTime == sessionStore.ALLDAY_ENDTIME) {
                    $("#countdown_when .select_time").text(sessionStore.SENSOR_ALLDAY);
                } else {
                    $("#countdown_when .select_time").text(wemoUtil.convertMillisecondsToTF(countdown_timer_rule.ruleObj.When.StartTime, UP_TF_IS24) + " - " + wemoUtil.convertMillisecondsToTF(countdown_timer_rule.ruleObj.When.EndTime, UP_TF_IS24));
                }
            }

        }

        var tempSelectedDayOrRange = "";
        tempSelectedDayOrRange = wemoUtil.convertSelectedDayOrRangeToString(countdown_timer_rule.ruleObj);

        $("#countdown_when .select_day").html(tempSelectedDayOrRange);

        if (typeof(countdown_timer_rule.ruleObj.RuleName) == "undefined") {
            countdown_timer_rule.ruleObj.RuleName = wemo.items['NewCountdownRuleTitle'];
        }
        $("#rule_name .rule_name_container").html(countdown_timer_rule.ruleObj.RuleName);

        $("#countdown_container #device_list").find('.select_switches_list').on("click", function(event) {
            var udn = $(this).closest('.select_switches_list').attr('data-udn');
            if ($('div [data-udn="' + udn + '"] ').find('.check_mark').css('display') == 'none' || $('div [data-udn="' + udn + '"] ').find('.check_mark').css('display') == undefined) {
                $('div [data-udn="' + udn + '"] ').find('.check_mark').show();
                countdown_timer_rule.selectDevice('on', 0, udn);
            } else {
                $('div [data-udn="' + udn + '"] ').find('.check_mark').hide();
                countdown_timer_rule.deselectDevice(udn);
            }
            countdown_timer_rule.updateRuleDevices();
            event.preventDefault();
        });


        $("#countdown_when").on("tap", function() {
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, countdown_timer_rule.ruleObj);
            nativeUtilPlugin.execute(null, null, actions.SHOW_SPLASH_ON_LOADING, []);
            wemoUtil.loadUrl(filePath.WHEN_COUNTDOWN);
            return false;
        });

        $("#rule_name").on("tap", function() {
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, sessionStore.COUNTDOWN_TIMER);
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, countdown_timer_rule.ruleObj);
            nativeUtilPlugin.execute(null, null, actions.SHOW_SPLASH_ON_LOADING, []);
            wemoUtil.loadUrl(filePath.RULE_NAME);
        });


        $("#customPicker").on('tap', function(e) {
            $("#cdtr_block .buttonImage").removeClass('buttonActive');
            countdown_timer_rule.createPicker();
            e.preventDefault();
            e.stopPropagation();
        });

        $("#cdtr_block .buttonImage").on('tap', function(e) {
            $('#customPicker').removeClass('customPickerInGreen');
            $('#customPicker').text('Set');
            $("#cdtr_block .buttonImage").removeClass('buttonActive');
            $(this).addClass('buttonActive');
            console.log('countdown_timer_rule -> selected time: ' + $(this).data('time'));
            countdown_timer_rule.ruleObj.When.CountdownTime = $(this).data('time') * 60;
            e.preventDefault();
            e.stopPropagation();
        });

        //countdown_timer_rule Click on the Save Button
        $("#countdown_rule_save_btn").on('tap', function() {
            // alert(JSON.stringify(countdown_timer_rule.ruleObj));
            var len = Object.keys(countdown_timer_rule.ruleObj.Devices).length;
            var issupported = "";
            if (len == 0) {
                $('body').on('touchmove', function(e) {
                    e.preventDefault();
                });
                setTimeout(
                    function() {
                        $('#device_not_selected').popup("open");
                    },
                    timeout.POPUP_DISPLAY_DELAY
                );
                console.log("save disable");
                return;
            }
            nativeUtilPlugin.execute(null, null, actions.SHOW_SPLASH_ON_LOADING, []);
            for (key in countdown_timer_rule.ruleObj.Devices) {

                if (networktype == null || networktype == networkType.HOME_NETWORK) {
                    devicePlugin.execute(
                        function(params) {
                            if (params === "true") {
                                issupported = params;
                            } else {
                                nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                issupported = params;
                                var ruleConflictLocalizedmsg = wemo.items['FirmwareVerCheckText_OFFSET'];
                                $("#FirmwareVerCheckText").html(ruleConflictLocalizedmsg);
                                setTimeout(function() {
                                        $("#fw_ver_check").popup("open");
                                        nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, ["", wemo.items['RULE_STATUS_SENDING_DB']]);
                                    },
                                    300
                                );
                            }
                        },
                        wemoUtil.reportError,
                        actions.COUNTDOWN_FW_VER_CHECK, [key]
                    );

                } else if (networktype == networkType.REMOTE_WIFI || networktype == networkType.REMOTE_MOBILE) {

                    wemoUtil.infoLog(wemoUtil.TAG, 'Remote getFirmwareVersion');

                    devicePlugin.execute(
                        function(enabled) {
                            wemoUtil.infoLog(wemoUtil.TAG, 'Remote enabled::: ' + enabled);
                            if (enabled) {
                                var firmwareArray = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.FIRMWARE_VERSION_DATA);
                                wemoUtil.infoLog(wemoUtil.TAG, 'firmwareArray ::: ' + JSON.stringify(firmwareArray));

                                for (var i = 0; i < firmwareArray.length; i++) {

                                    wemoUtil.infoLog(wemoUtil.TAG, "UDN value : " + key + "  Array UDN value : " + firmwareArray[i]["udn"]);
                                    if (firmwareArray[i]["udn"] == key) {
                                        var firmwareVerString = firmwareArray[i]["devicefirmware"];
                                        var firmwareVerAry = firmwareVerString.split('.');
                                        var firmwareVer = parseInt(firmwareVerAry[2]);
                                        wemoUtil.infoLog(wemoUtil.TAG, 'firmware version : ' + firmwareVer);

                                        if (firmwareVer >= configValue.COUNTDOWN_FW_SUPPORT) {
                                            wemoUtil.infoLog(wemoUtil.TAG, 'firmware is not supported ');
                                            issupported = "true";
                                        } else {
                                            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                            var ruleConflictLocalizedmsg = wemo.items['FirmwareVerCheckText_OFFSET'];
                                            $("#FirmwareVerCheckText").html(ruleConflictLocalizedmsg);
                                            setTimeout(function() {
                                                    $("#fw_ver_check").popup("open");
                                                    nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, ["", wemo.items['RULE_STATUS_SENDING_DB']]);
                                                },
                                                300
                                            );
                                            issupported = "false";

                                        }

                                    }

                                }
                            }
                        },
                        wemoUtil.reportError,
                        actions.IS_REMOTE_ENABLED, []
                    );

                }

            }

            /*if (issupported === "false") {
                    return;
                }*/

            if (issupported === "false") {
                countdown_timer_rule.ruleObj.State = 0;
                return;
            }

            if (countdown_timer_rule.ruleObj.When.RuleDuration == undefined) {
                var StartTimeAM = 'false';
                var EndTimeAM = 'false';
                StartTimeAM = (wemoUtil.convertMillisecondsToAMPM(countdown_timer_rule.ruleObj.When.StartTime).lastIndexOf("AM") != -1) ? 'true' : 'false';
                EndTimeAM = (wemoUtil.convertMillisecondsToAMPM(countdown_timer_rule.ruleObj.When.EndTime).lastIndexOf("AM") != -1) ? 'true' : 'false';
                if (countdown_timer_rule.ruleObj.When.EndTime < countdown_timer_rule.ruleObj.When.StartTime) {
                    if (StartTimeAM == EndTimeAM) {
                        countdown_timer_rule.ruleObj.When.RuleDuration = timestamp.MAX_HOUR - (parseInt(countdown_timer_rule.ruleObj.When.StartTime) - parseInt(countdown_timer_rule.ruleObj.When.EndTime));
                    } else {
                        countdown_timer_rule.ruleObj.When.RuleDuration = (timestamp.MAX_HOUR - (parseInt(countdown_timer_rule.ruleObj.When.StartTime))) + parseInt(countdown_timer_rule.ruleObj.When.EndTime);
                    }
                } else {
                    countdown_timer_rule.ruleObj.When.RuleDuration = countdown_timer_rule.ruleObj.When.EndTime - countdown_timer_rule.ruleObj.When.StartTime;
                }
            }

            //-------------------SRSS--------------------
            //Plug-in Call To Get Firmware Version SRSS
            if (countdown_timer_rule.ruleObj.When.StartSRSS != undefined || countdown_timer_rule.ruleObj.When.EndSRSS != undefined) {
                if (Object.keys(countdown_timer_rule.ruleObj.Devices).length > 0) {
                    for (key in countdown_timer_rule.ruleObj.Devices) {
                        console.log("SRSS - UDN Firmware Version - " + key + "  ::  " + countdown_timer_rule.ruleObj.Devices[key]);
                        countdown_timer_rule.ruleObj.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                        //alert("Save - isFirmWareSupported: 1 "+countdown_timer_rule.ruleObj.When.isFirmWareSupported);
                    }
                    //alert("Save - isFirmWareSupported: 2 "+countdown_timer_rule.ruleObj.When.isFirmWareSupported);
                }
            }
            //-------------------SRSS--------------------

            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, countdown_timer_rule.ruleObj);
            console.log("Saving Countdown Timer Rule");
            if (countdown_timer_rule.ruleObj.When.isFirmWareSupported != undefined && countdown_timer_rule.ruleObj.When.isFirmWareSupported === "false") {
                nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                setTimeout(
                    function() {
                        $("#sunrise_firmware_upgrade").popup("open");
                    },
                    timeout.POPUP_DISPLAY_DELAY
                );
            } else {
                var selectedDevice = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE);
                if (selectedDevice != null) {
                    window.sessionStorage.removeItem(sessionStore.CURRENT_DEVICE);
                }

                saveNewRule_RULES_RULEDEVICES(countdown_timer_rule.ruleObj.RuleType, countdown_timer_rule.ruleObj);
            }
        });

        //FW Compatibility based upgrade
        $("#update_nw_btn").on("click", function() {
            if (!isRemoteEnabled)
                deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
            wemoUtil.loadUrl(filePath.MORE_NEW_FIRMWARE);
            $("#fw_ver_check").popup("close");
        });

        $("#later_btn").on("click", function() {
            $("#fw_ver_check").popup("close");
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, countdown_timer_rule.ruleObj);
            saveNewRule_RULES_RULEDEVICES(countdown_timer_rule.ruleObj.RuleType, countdown_timer_rule.ruleObj);

            //wemoUtil.loadUrl(filePath.ENABLED_RULES);
        });

        $("#identicalOnOffTimeOkBtn").on("tap", function() {
            $("#identicalOnOffTime").popup("close");
        });

        $('#countdown_rule_cancel_btn').on("pointerdown", function() {
            var selectedDevice = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE);
            if (selectedDevice != null) {
                window.sessionStorage.removeItem(sessionStore.CURRENT_DEVICE);
                window.sessionStorage.removeItem(sessionStore.isEdit);
            }
            if (parseInt(JSON.parse(window.sessionStorage.getItem(sessionStore.RULES_DATA)).length) > 0) {
                wemoUtil.loadUrl(filePath.ENABLED_RULES);
            } else {
                wemoUtil.loadUrl(filePath.CREATE_RULE);
            }
        });

        $("#sunrise_firmware_upgrade_updatenow").on("click", function() {
            var pendingFirmware = "pendingFirmware";
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.PENDING_FIRMWARE, pendingFirmware);

            $("#sunrise_firmware_upgrade").popup("close");
            countdown_timer_rule.ruleObj.RuleType = sessionStore.COUNTDOWN_TIMER;
            if (Object.keys(countdown_timer_rule.ruleObj.Devices).length > 0) {
                for (key in countdown_timer_rule.ruleObj.Devices) {
                    countdown_timer_rule.ruleObj.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, countdown_timer_rule.ruleObj);
                }
            }
            var selectedDevice = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE);
            if (selectedDevice != null) {
                window.sessionStorage.removeItem(sessionStore.CURRENT_DEVICE);
            }
            saveNewRule_RULES_RULEDEVICES(countdown_timer_rule.ruleObj.RuleType, countdown_timer_rule.ruleObj);
        });

        $('#sunrise_firmware_upgrade_later').on('click', function() {
            //alert("Save Rule");
            $("#sunrise_firmware_upgrade").popup('close');
            countdown_timer_rule.ruleObj.RuleType = sessionStore.COUNTDOWN_TIMER;
            if (Object.keys(countdown_timer_rule.ruleObj.Devices).length > 0) {
                for (key in countdown_timer_rule.ruleObj.Devices) {
                    countdown_timer_rule.ruleObj.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, countdown_timer_rule.ruleObj);
                }
            }
            var selectedDevice = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE);
            if (selectedDevice != null) {
                window.sessionStorage.removeItem(sessionStore.CURRENT_DEVICE);
            }
            saveNewRule_RULES_RULEDEVICES(countdown_timer_rule.ruleObj.RuleType, countdown_timer_rule.ruleObj);
        });
    },

    updateRuleDevices: function() {
        console.log("Updating rule devices..." + JSON.stringify(countdown_timer_rule.ruleObj));

        countdown_timer_rule.ruleObj.Devices = {};

        for (var udn in deviceList.getArray()) {
            console.log(JSON.stringify(deviceList.getDevice(udn)));
            if (deviceList.getDevice(udn) != undefined && deviceList.getDevice(udn) != '') {
                if (deviceList.getDevice(udn).state != undefined && deviceList.getDevice(udn).state != '') {
                    countdown_timer_rule.ruleObj.Devices[udn] = {};

                    if (deviceList.getDevice(udn).state == 'on') {
                        countdown_timer_rule.ruleObj.Devices[udn].StartAction = 1;
                        deviceList.setActive(udn, 'on', deviceList.getDevice(udn).duration);
                        if (deviceList.getDevice(udn).duration != '0' && deviceList.getDevice(udn).duration != '1') {
                            countdown_timer_rule.ruleObj.Devices[udn].SensorDuration = wemoUtil.convertTimeToMilliseconds(deviceList.getDevice(udn).duration);
                        } else {
                            countdown_timer_rule.ruleObj.Devices[udn].SensorDuration = deviceList.getDevice(udn).duration;
                        }
                        countdown_timer_rule.ruleObj.Devices[udn].EndAction = "0";
                    } else if (deviceList.getDevice(udn).state == 'off') {
                        countdown_timer_rule.ruleObj.Devices[udn].SensorDuration = 0;
                        countdown_timer_rule.ruleObj.Devices[udn].StartAction = 0;
                        countdown_timer_rule.ruleObj.Devices[udn].EndAction = "0";
                        deviceList.setActive(udn, 'off');
                    }

                    countdown_timer_rule.ruleObj.Devices[udn].FName = deviceList.getDevice(udn).name;
                    console.log(udn + ': ' + JSON.stringify(countdown_timer_rule.ruleObj.Devices[udn]));
                }
            }
        }

        console.log(JSON.stringify(countdown_timer_rule.ruleObj));
    },

    ST_ET_areSAME: function(ruleObj) {
        if ((ruleObj.When.StartSRSS != undefined && ruleObj.When.EndSRSS != undefined) && (ruleObj.When.StartSRSS == ruleObj.When.EndSRSS)) {
            if (parseInt(ruleObj.When.OnModeOffset) == parseInt(ruleObj.When.OffModeOffset)) {
                return true;
            }
        } else if (parseInt(ruleObj.When.StartTime) == (parseInt(ruleObj.When.EndTime) == timestamp.MIDNIGHT_END_TIME ? 0 : parseInt(ruleObj.When.EndTime))) {
            return true;
        } else return false;
    },

    bindEvents: function() {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', countdown_timer_rule.onOnline, false);
        document.addEventListener('offline', countdown_timer_rule.onOffline, false);
        document.addEventListener("backbutton", countdown_timer_rule.onBackPress, false);
        document.addEventListener("pause", countdown_timer_rule.onPause, false);
        document.addEventListener("resume", countdown_timer_rule.onResume, false);
    },

    onOffline: function() {
        console.log(TAG + "offLine");
    },

    onOnline: function() {
        console.log(TAG + "onLine");
    },

    onBackPress: function() {
        var selectedDevice = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE);
        if (selectedDevice != null) {
            window.sessionStorage.removeItem(sessionStore.CURRENT_DEVICE);
        }
        if ($(".more_tab").is(":visible")) {
            $(".more_tab").hide();
            $('body').find('.modalWindow').transition({
                opacity: 0
            }, 400, function() {
                $(this).removeClass('isOpen');
            });
        } else {
            console.log(TAG + "onBackPress");
            wemoUtil.loadPreviousUrl();
        }
    },

    onPause: function() {
        console.log(TAG + "onPause");
    },

    onResume: function() {
        console.log(TAG + "onResume");
    },

    reportError: function(e) {
        console.log(TAG + "Plugin Error!!!!   " + e);
    },

    showModal: function(msg) {
        $("body").append('<div id="mask" class="modalWindow"/>');

        $.mobile.showPageLoadingMsg("a", msg);
    },

    showPopup: function() {
        //Rule conflict Popup
        $("#rule_conflict_learn_more_btn").on("tap", function() {
            alert("Your Data has Saved");
            $("#rule_conflict").popup("close");
        });

        $("#rule_conflict_ok_btn").on("tap", function() {
            alert("Your Data has Saved");
            $("#rule_conflict").popup("close");
        });

        //Rules Can not be saved Popup
        $("#rule_can_not_save_ok").on("tap", function() {
            alert("Rules Can't be saved");
            $("#rule_can_not_save").popup("close");
        });

        //Rule Duplicate Popup
        $("#rule_duplicate_learn_more_btn").on("tap", function() {
            alert("Learn More");
            $("#rule_duplicate").popup("close");
        });

        $("#rule_duplicate_ok_btn").on("tap", function() {
            alert("Rule Duplicate");
            $("#rule_duplicate").popup("close");
        });

        //sunrise firmware upgrade Popup
        $("#sunrise_firmware_upgrade_later").on("tap", function() {
            $("#sunrise_firmware_upgrade").popup("close");
        });

        $("#sunrise_firmware_upgrade_updatenow").on("tap", function() {
            $("#sunrise_firmware_upgrade").popup("close");
        });

    }

};
