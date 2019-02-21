/*
 sensors_rule.js

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

var TAG = "sensors_rule.js: ";
var cur_drawer;
var UP_TF_IS24 = false; //UP-user preferences, TF-time format

$(document).bind('pageinit', function() {
    sensors_rule.initialize();
});


var sensors_rule = {
    deviceList: {},
    ruleObj: {},
    sensorDevicesObj: {},

    initialize: function() {
        console.log(TAG + "initialize");
        var isEdit = window.sessionStorage.getItem(sessionStore.isEdit);
        if (isEdit == sessionStore.RULE_NEW) {
            $('.sub_header > span').html(wemo.items['NewRuleSensorRuleTitle']);
        } else {
            $('.sub_header > span').html(wemo.items['EditRuleSensorRuleTitle']);
        }
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    onDeviceReady: function() {
        var self = this;
        UP_TF_IS24 = wemoUtil.userPreferences.getTimeFormat();
        
        if (!isRemoteEnabled) {
            $.when(wemoUtil.getDevices(actions.SELECT_SENSORS),
                wemoUtil.getDevices(actions.SELECT_DIMMERS),
                wemoUtil.getDevices(actions.SELECT_SWITCHES),
                wemoUtil.getDevices(actions.SELECT_INSIGHTS),
                wemoUtil.getDevices(actions.SELECT_MAKER),
                wemoUtil.getDevices(actions.SELECT_LED_DEVICES))
            .then(function() {

                sensors_rule.afterOnDeviceReady();

            }).fail(function() {
                throw ('ERROR');
            });
        }else{
        	sensors_rule.afterOnDeviceReady();
        }
    },
    afterOnDeviceReady: function() {
        $.getScript('../js/classes/deviceList.js', function() {
            $.getScript('../js/vendor/date.js', function() {
                sensors_rule.methodMain();
            });
        });
    },

    loadDevices: function() {
        console.log(JSON.stringify(sensors_rule.ruleObj));
        var devices = [];
        var bridgeUDN = '';

        if (isRemoteEnabled) {
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DIMMER_DATA).concat(devices);
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA).concat(devices);
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA).concat(devices);
            var ledDevices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_DATA);
            devices = ledDevices.concat(devices);
            if (ledDevices.length > 0) {
                var wemoBridgeObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_BRIDGE_UDN);
                console.log("led Device bridgeDetails: " + JSON.stringify(wemoBridgeObj));
                var len = wemoBridgeObj.length;
                for (var i = 0; i < len; i++) {
                    bridgeUDN = wemoBridgeObj[i].udn;
                }
            }
        } else {
            var tempDevices = '';
            devices = wemoUtil.getDevices(actions.SELECT_SWITCHES);
            devices = wemoUtil.getDevices(actions.SELECT_DIMMERS).concat(devices);
            devices = wemoUtil.getDevices(actions.SELECT_INSIGHTS).concat(devices);
            devices = wemoUtil.getDevices(actions.SELECT_MAKER).concat(devices);
            tempDevices = wemoUtil.getDevices(actions.SELECT_LED_DEVICES);
            if (tempDevices != '0') {
                devices = tempDevices.concat(devices);
            }
        }

        if (devices != null && devices.length > 0) {
            $.each(devices, function(inx) {
                if (wemoUtil.isMakerDevice(devices[inx].udn)) {
//                    deviceList.addMakerDevice(devices[inx].udn, devices[inx].friendlyName, devices[inx].SwitchMode);
                    deviceList.addMakerDevice(devices[inx].udn, devices[inx].friendlyName, devices[inx].SwitchMode, devices[inx].ProductName);
                } else {
                    if ((devices[inx].udn).indexOf("uuid") == -1) {
                        if (devices[inx].udn == '') {
                            devices[inx].udn = devices[inx].macAddress;
                            deviceList.addLedDevice(devices[inx].macAddress, devices[inx].friendlyName, bridgeUDN,devices[inx].ProductName);
                        } else
                            deviceList.addLedDevice(devices[inx].udn, devices[inx].friendlyName, devices[inx].bridgeudn,devices[inx].ProductName);
                    } else {
                        deviceList.addDevice(devices[inx].udn, devices[inx].friendlyName,devices[inx].ProductName);
                    }
                }

                console.log(JSON.stringify(sensors_rule.ruleObj.Devices));
                for (var dev in sensors_rule.ruleObj.Devices) {
                    if (wemoUtil.isMakerDevice(dev)) {
                        if (wemoUtil.getMakerSwithUDN(dev) == wemoUtil.getMakerSwithUDN(devices[inx].udn)) {
                            if (sensors_rule.ruleObj.Devices[dev].StartAction == 0) {
                                deviceList.setActive(devices[inx].udn, 'off');
                            } else if (sensors_rule.ruleObj.Devices[dev].StartAction == 1) {
                                if ((sensors_rule.ruleObj.Devices[dev].SensorDuration != 0) && (sensors_rule.ruleObj.Devices[dev].SensorDuration != 1)) {
                                    var time = (new Date).clearTime()
                                        .addSeconds(sensors_rule.ruleObj.Devices[dev].SensorDuration)
                                        .toString('HH:mm');
                                    deviceList.setActive(devices[inx].udn, 'on', time);
                                } else {
                                    deviceList.setActive(devices[inx].udn, 'on', sensors_rule.ruleObj.Devices[dev].SensorDuration);
                                }
                            }
                        }
                    } else {
                        console.log(sensors_rule.ruleObj.Devices[dev]);
                        if (dev == devices[inx].udn) {
                            if (sensors_rule.ruleObj.Devices[dev].StartAction == 0) {
                                deviceList.setActive(devices[inx].udn, 'off');
                            } else if (sensors_rule.ruleObj.Devices[dev].StartAction == 1) {
                                if ((sensors_rule.ruleObj.Devices[dev].SensorDuration != 0) && (sensors_rule.ruleObj.Devices[dev].SensorDuration != 1)) {
                                    var time = (new Date).clearTime()
                                        .addSeconds(sensors_rule.ruleObj.Devices[dev].SensorDuration)
                                        .toString('HH:mm');
                                    deviceList.setActive(devices[inx].udn, 'on', time);
                                } else {
                                    deviceList.setActive(devices[inx].udn, 'on', sensors_rule.ruleObj.Devices[dev].SensorDuration);
                                }
                            }
                        }
                    }
                }
            });
        }


    },

    formatOnWithMotionStr: function(duration) {
        console.log('Duration: ' + duration);
        switch (duration.toString()) {
            case "0":
                {
                    return wemo.items['OnDontTurnOff'];
                }
            case "1":
                {
                    return wemo.items['OnOffImmediately'];
                }
            default:
                {
                    var hour = parseInt(duration.substr(0, 2));
                    var minute = parseInt(duration.substr(3, 2));
                    var tmpDur = '';

                    if (hour > 0) {
                        tmpDur = hour.toString() + ' ' + wemo.items['hour'];
                    }

                    if (minute == 1) {
                        tmpDur += ' ' + minute.toString() + ' ' + wemo.items['minute'];
                    } else if (minute > 1) {
                        tmpDur += minute.toString() + ' ' + wemo.items['minutes'];
                    }

                    return wemo.items['OnWithMotion'] + ' + ' + tmpDur;
                }
        }
    },


    renderDeviceList: function() {
        for (var udn in deviceList.getArray()) {
            var state = '',
                html = '',
                isMomentarySwitch = false;

            if (udn.indexOf("uuid") == -1) {
                window.sessionStorage.setItem(sessionStore.LED_BRIDGE_UDN_ID, deviceList.getDevice(udn).bridgeudn);
            }
            if (wemoUtil.isMakerDevice(udn)) {
                if (deviceList.getDevice(udn).switchMode == "1") {
                    isMomentarySwitch = true;
                }
            }
            if (deviceList.getDevice(udn).state != undefined) {
                if (deviceList.getDevice(udn).state == 'on') {
                    var duration = 0;
                    if (deviceList.getDevice(udn).duration != undefined) {
                        duration = deviceList.getDevice(udn).duration;
                    }
                    if (isMomentarySwitch)
                        state = 'on';
                    else
                        state = sensors_rule.formatOnWithMotionStr(deviceList.getDevice(udn).duration);
                } else if (deviceList.getDevice(udn).state == "off") {
                    state = wemo.items['off'];
                }
            }

            if (isMomentarySwitch) {

                html = '<div class="select_switches_list more_li_clone more_li_clone_top" data-udn="' + udn + '"><div class="display_table"><span class="display_cell padding_left_16px"><span class="fname">' + deviceList.getDevice(udn).name + '</span><span class="action_subHeader">' + state + '</span></span></div><span class="check_mark"></span></div></div>';

            } else {

                html = '<div class="select_switches_list more_li_clone more_li_clone_top" data-udn="' + udn + '"><div class="display_table"><span class="display_cell padding_left_16px"><span class="fname">' + deviceList.getDevice(udn).name + '</span><span class="action_subHeader">' + state + '</span></span></div><span class="check_mark"></span></div><div class="drawer" id="' + udn + '"><div class="drawer_li on_then"><span>' + wemo.items['OnThen'] + '</span></div><div class="drawer_li off"><span>' + wemo.items['off'] + '</span></div></div>';

            }

            console.log("Sensor " + html);
            $('#sensors_container #device_list').append($(html));

            if (state != '') {
                $('div [data-udn="' + udn + '"] ').find('.check_mark').show();
                if (deviceList.getDevice(udn).state == 'on') {
                    $('div [id="' + udn + '"]').find('.on_then span').empty().html(sensors_rule.formatOnWithMotionStr(deviceList.getDevice(udn).duration));
                    $('div [id="' + udn + '"]').find('.on_then').addClass('div_bg_green');
                } else if (deviceList.getDevice(udn).state == "off") {
                    $('div [id="' + udn + '"]').find('.off span').empty().html(wemo.items['off']);
                    $('div [id="' + udn + '"]').find('.off').addClass('div_bg_green');
                }
            }
        }

        $('div .on_then').on('tap', function(e) {
            var cur_drawer = $(this).parent();
            var udn = cur_drawer.attr('id');

            if ($(this).hasClass('div_bg_green')) {
                sensors_rule.deselectDevice(udn);
                cur_drawer.slideUp();
                sensors_rule.updateRuleDevices();
            } else {
                $('.overlay').attr('style', 'display: table;');
                $('.picker_container').attr('style', 'display: table-cell;');

                $('.picker').attr("data-udn", udn);
                console.log("data-udn at picker " + $('.picker').attr("data-udn"));

                $("#cnl_after_picker_btn").on("tap", function(event) {
                    event.stopPropagation();
                    $('.picker').attr("data-udn", "");

                    $('.overlay').hide();
                    $('.picker_container').hide();
                    event.preventDefault();
                });

                $("#set_after_picker_btn").on("tap", function(event) {
                    event.stopPropagation();
                    var val = $('input[name=rad_after_motion]:checked').val();
                    sensors_rule.selectDevice('on', val, $('.picker').attr("data-udn"));

                    $('.overlay').hide();
                    $('.picker_container').hide();

                    cur_drawer.slideUp();
                    sensors_rule.updateRuleDevices();
                    event.preventDefault();
                });
            }

            e.preventDefault();
        });

        $('div .off').on('tap', function(e) {
            var udn = $(this).parent().attr('id');
            if ($(this).hasClass('div_bg_green')) {
                sensors_rule.deselectDevice(udn);
            } else {
                sensors_rule.selectDevice('off', 0, udn);
            }

            $(this).parent().slideToggle('fast');
            sensors_rule.updateRuleDevices();
            e.preventDefault();
        });

        $("#device_list").find('.check_mark').on('tap', function() {
            var udn = $(this).closest('.select_switches_list').attr('data-udn');
            var drawer = $('div [id="' + udn + '"]');
            if (drawer.is(":visible")) drawer.slideToggle("slow");
            sensors_rule.deselectDevice(udn);
            sensors_rule.updateRuleDevices();
        });

        $("#sensor_list").find('.check_mark').on('tap', function() {
            var udn = $(this).closest('.select_switches_list').attr('data-udn');
            sensors_rule.deselectDevice(udn);
        });
    },

    deselectDevice: function(udn) {
        deviceIsSensor = udn.indexOf("Sensor") == -1 ? false : true;

        if (deviceIsSensor) {
            $('div [data-udn="' + udn + '"]').find('.check_mark').hide();
            $('div [data-udn="' + udn + '"]').find('.action_subHeader').empty();
        } else {
            $('div [id="' + udn + '"]').find('.on_then').removeClass('div_bg_green');
            $('div [id="' + udn + '"]').find('.off').removeClass('div_bg_green');
            $('div [data-udn="' + udn + '"]').find('.check_mark').hide();
            $('div [data-udn="' + udn + '"]').find('.action_subHeader').empty();
            $('div [id="' + udn + '"]').find('.on_then span').html(wemo.items['OnThen']);

            deviceList.unsetActive(udn);
        }
    },

    selectDevice: function(type, duration, udn) {

        $('div [id="' + udn + '"]').find('.on_then').removeClass('div_bg_green');
        $('div [id="' + udn + '"]').find('.off').removeClass('div_bg_green');

        $('div [data-udn="' + udn + '"] ').find('.check_mark').show();

        if (type == 'on') {
            $('div [id="' + udn + '"]').find('.on_then').addClass('div_bg_green');
            if (wemoUtil.isMakerDevice(udn) && deviceList.getDevice(udn).switchMode == "1") {
                $('div [data-udn="' + udn + '"]').find('.action_subHeader').html('on');
            } else {
                $('div [data-udn="' + udn + '"]').find('.action_subHeader').html(sensors_rule.formatOnWithMotionStr(duration));
            }

        } else if (type == 'off') {
            $('div [id="' + udn + '"]').find('.off').addClass('div_bg_green');
            $('div [data-udn="' + udn + '"]').find('.action_subHeader').html(wemo.items['off']);
        }

        deviceList.setActive(udn, type, duration);
    },

    methodMain: function() {
        var networktype = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_NETWORKTYPE);
        console.log(TAG + "onDeviceReady");
        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
        wemoUtil.setTimeFormat();
        sensors_rule.bindEvents();

        sensors_rule.ruleObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
        sensors_rule.ruleObj.RuleType = sessionStore.MOTION_CONTROLLED;
        sensors_rule.loadDevices();
        sensors_rule.renderDeviceList();
        sensors_rule.buildSensorList();

        $("#device_not_selected_ok").on("tap", function(e) {
            $("#device_not_selected").popup('close');
            $('body').off('touchmove');
            e.preventDefault();
        });

        $("#sensor_not_selected_ok").on("tap", function(e) {
            $("#sensor_not_selected").popup('close');
            $('body').off('touchmove');
            e.preventDefault();
        });
      //No Sensors Detected
        $("#noSensorsDetectedOkBtn").on("tap", function() {
            $("#noSensorsDetected").popup("close");
            $("#noSensorsDetectedHeader").html("");
            $("#noSensorsDetectedText").html("");
        });
        
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);

        //To return back to home page: device list tab
        $(".wemo_logo").on("tap", function(e) {
            if (e.target.nodeName != "IMG") {
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }
        });
        if (sensors_rule.ruleObj.When.EndTime == 0) sensors_rule.ruleObj.When.EndTime = timestamp.MIDNIGHT_END_TIME;
        else if (sensors_rule.ruleObj.When.EndTime == undefined)
            sensors_rule.ruleObj.When.EndTime = parseInt(sensors_rule.ruleObj.When.StartTime, 10) + parseInt(sensors_rule.ruleObj.When.RuleDuration, 10);
        // **********  display time values
        if ((sensors_rule.ruleObj.When.StartTime == undefined || sensors_rule.ruleObj.When.EndTime == undefined)) {
            sensors_rule.ruleObj.When.StartTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestHalfHour());
            sensors_rule.ruleObj.When.EndTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestOneAndHalfHour());
            var tempDisSelectday = wemo.items['Daily'];

            //alert("sensors_rule.ruleObj.When.EndTime "+sensors_rule.ruleObj.When.EndTime);
            $("#sensors_rule_when .select_time").text(wemoUtil.convertMillisecondsToTF(sensors_rule.ruleObj.When.StartTime, UP_TF_IS24) + " - " + wemoUtil.convertMillisecondsToTF(sensors_rule.ruleObj.When.EndTime, UP_TF_IS24));
            $("#sensors_rule_when .select_day").html(tempDisSelectday);
            //sensors_rule.ruleObj.SelectedDayOrRange = "Daily";
        } else {
            //var EndTime=parseInt(sensors_rule.ruleObj.When.EndTime)
            if (sensors_rule.ruleObj.When.StartSRSS != undefined && sensors_rule.ruleObj.When.EndSRSS != undefined) {

                if (sensors_rule.ruleObj.When.onSRSS_Title != undefined) {
                    var tempStartSRSS = sensors_rule.ruleObj.When.onSRSS_Title;
                } else {
                    if (sensors_rule.ruleObj.When.StartSRSS == "Sunrise") {
                        var tempStartSRSS = wemo.items['SunRise'];
                    } else if (sensors_rule.ruleObj.When.StartSRSS == "Sunset") {
                        var tempStartSRSS = wemo.items['SunSet'];
                    } else {
                        var tempStartSRSS = sensors_rule.ruleObj.When.StartSRSS;
                    }
                }

                if (sensors_rule.ruleObj.When.offSRSS_Title != undefined) {
                    var tempEndSRSS = sensors_rule.ruleObj.When.offSRSS_Title;
                } else {
                    if (sensors_rule.ruleObj.When.EndSRSS == "Sunrise") {
                        var tempEndSRSS = wemo.items['SunRise'];
                    } else if (sensors_rule.ruleObj.When.EndSRSS == "Sunset") {
                        var tempEndSRSS = wemo.items['SunSet'];
                    } else {
                        var tempEndSRSS = sensors_rule.ruleObj.When.EndSRSS;
                    }
                }

                $("#sensors_rule_when .select_time").text(tempStartSRSS + " - " + tempEndSRSS);

            } else if (sensors_rule.ruleObj.When.StartSRSS == undefined && sensors_rule.ruleObj.When.EndSRSS != undefined) {

                if (sensors_rule.ruleObj.When.offSRSS_Title != undefined) {
                    var tempEndSRSS = sensors_rule.ruleObj.When.offSRSS_Title;
                } else {
                    if (sensors_rule.ruleObj.When.EndSRSS == "Sunrise") {
                        var tempEndSRSS = wemo.items['SunRise'];
                    } else if (sensors_rule.ruleObj.When.EndSRSS == "Sunset") {
                        var tempEndSRSS = wemo.items['SunSet'];
                    } else {
                        var tempEndSRSS = sensors_rule.ruleObj.When.EndSRSS;
                    }
                }

                $("#sensors_rule_when .select_time").text(wemoUtil.convertMillisecondsToTF(sensors_rule.ruleObj.When.StartTime, UP_TF_IS24) + " - " + tempEndSRSS);

            } else if (sensors_rule.ruleObj.When.StartSRSS != undefined && sensors_rule.ruleObj.When.EndSRSS == undefined) {

                if (sensors_rule.ruleObj.When.onSRSS_Title != undefined) {
                    var tempStartSRSS = sensors_rule.ruleObj.When.onSRSS_Title;
                } else {
                    if (sensors_rule.ruleObj.When.StartSRSS == "Sunrise") {
                        var tempStartSRSS = wemo.items['SunRise'];
                    } else if (sensors_rule.ruleObj.When.StartSRSS == "Sunset") {
                        var tempStartSRSS = wemo.items['SunSet'];
                    } else {
                        var tempStartSRSS = sensors_rule.ruleObj.When.StartSRSS;
                    }
                }

                $("#sensors_rule_when .select_time").text(tempStartSRSS + " - " + wemoUtil.convertMillisecondsToTF(sensors_rule.ruleObj.When.EndTime, UP_TF_IS24));

            } else if (sensors_rule.ruleObj.When.StartSRSS == undefined && sensors_rule.ruleObj.When.EndSRSS == undefined) {
                if (sensors_rule.ruleObj.When.StartTime == sessionStore.ALLDAY_STARTTIME && sensors_rule.ruleObj.When.EndTime == sessionStore.ALLDAY_ENDTIME) {
                    $("#sensors_rule_when .select_time").text(sessionStore.SENSOR_ALLDAY);
                } else {
                    $("#sensors_rule_when .select_time").text(wemoUtil.convertMillisecondsToTF(sensors_rule.ruleObj.When.StartTime, UP_TF_IS24) + " - " + wemoUtil.convertMillisecondsToTF(sensors_rule.ruleObj.When.EndTime, UP_TF_IS24));
                }
            }

        }

        var tempSelectedDayOrRange = "";
        tempSelectedDayOrRange = wemoUtil.convertSelectedDayOrRangeToString(sensors_rule.ruleObj);
        wemoUtil.infoLog(TAG, JSON.stringify(sensors_rule.ruleObj));

        if (sensors_rule.ruleObj.SelectedDayOrRange && sensors_rule.ruleObj.SelectedDayOrRange.split("-").length === 7) {
            tempSelectedDayOrRange = wemo.items['Daily'];
        }


        $("#sensors_rule_when .select_day").html(tempSelectedDayOrRange);
        //console.log("Times Home :: "+"Start :: "+sensors_rule.ruleObj.When.StartTime+" END  ::"+sensors_rule.ruleObj.When.EndTime+" Duration :: "+sensors_rule.ruleObj.When.RuleDuration);

        if (typeof(sensors_rule.ruleObj.RuleName) == "undefined") {
            sensors_rule.ruleObj.RuleName = wemo.items['NewMotionRule'];
        }
        //$("#sensors_rule_rule_name #rule_name").html(sensors_rule.ruleObj.RuleName);
        $("#rule_name .rule_name_container").html(sensors_rule.ruleObj.RuleName);

        // wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,sensors_rule.ruleObj);
        //sensors_rule Page Start
        $("#sensors_rule_what_happens").on("tap", function() {
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("sensor_rule"));
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, sensors_rule.ruleObj);
            wemoUtil.loadUrl(filePath.SELECT_SWITCHES);
        });

        $("#sensors_rule_selected_device").find("li").on("tap", function() {

            window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE, $(this).attr("data-udn"));
            window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE_NAME, $(this).attr("data-fName"));
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("sensor_rule"));
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, sensors_rule.ruleObj);
            wemoUtil.loadUrl(filePath.SENSORS_WHAT_HAPPENS);
        });


        $("#sensors_rule_if").on("tap",'.more_li_clone', function(e) {
        	var udn = $.trim($(this).closest(
            ".select_sensors_list").attr('id'));
        	
        	var isSelected = false 
        	
            if ($(this).find('.check_mark').css('display') == 'none' || $(this).find('.check_mark').css('display') == undefined) {
                $(this).find('.check_mark').show();
                $(this).find('.more_li_subHeader').show();
                $(this).find('.more_li_text_div').addClass("selected")
                isSelected = true ;
            } else {
                $(this).find('.check_mark').hide();
                $(this).find('.more_li_subHeader').hide();
                $(this).find('.more_li_text_div').removeClass("selected")
            }
            sensors_rule.updateSelectedSensor(udn, 1, isSelected);

            e.preventDefault();
        });


        $("#sensors_container #device_list").find('.select_switches_list .fname').on("click", function(event) {
            event.stopPropagation();

            var id_drawer = $.trim($(this).closest(".select_switches_list").attr('data-udn'));
            var drawer = $('div [id="' + id_drawer + '"]');

            if (drawer.length != 0) {

                if ((drawer.is(":visible")) && (drawer.find("div").hasClass("div_bg_green"))) {
                    var tmp = drawer.find('.div_bg_green span').html();
                    console.log("tmp " + tmp);
                }

                drawer.slideToggle("fast", function() {
                    if (drawer.find("div").hasClass("div_bg_green")) {
                        sensors_rule.updateRuleDevices();
                    }
                    if (drawer.is(":visible")) {
                        $('#device_list .drawer:visible').each(function(i, elem) {
                            if ($(this).attr("id") != id_drawer) {
                                $(this).slideToggle("fast");
                                console.log("hide drawer id=" + $(this).attr("id"));
                            }
                        });
                    };
                });
            } else {
                var check_mark = $("#sensors_container #device_list").children('div [data-udn="' + id_drawer + '"] ').find('.check_mark');

                if (!check_mark.is(":visible")) {
                    check_mark.show();
                    sensors_rule.selectDevice('on', 0, id_drawer);
                    sensors_rule.updateRuleDevices();
                }

            }

            event.preventDefault();
        });


        $("#sensors_rule_when").on("tap", function() {
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("sensor_rule"));
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, sensors_rule.ruleObj);
            nativeUtilPlugin.execute(null, null, actions.SHOW_SPLASH_ON_LOADING, []);
            wemoUtil.loadUrl(filePath.SENSORS_RULE_WHEN);
        });

        $("#rule_name").on("tap", function() {
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("sensor_rule"));
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, sensors_rule.ruleObj);
            nativeUtilPlugin.execute(null, null, actions.SHOW_SPLASH_ON_LOADING, []);
            wemoUtil.loadUrl(filePath.RULE_NAME);
        });

        //sensors_rule Click on the Save Button
        $("#sensors_rule_save_btn").on('tap', function() {
            // alert(JSON.stringify(sensors_rule.ruleObj));
            var len = Object.keys(sensors_rule.ruleObj.Devices).length;
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
            if (Object.keys(sensors_rule.ruleObj.Sensors).length == 0) {
                $('body').on('touchmove', function(e) {
                    e.preventDefault();
                });
                setTimeout(
                    function() {
                        $('#sensor_not_selected').popup("open");
                    },
                    timeout.POPUP_DISPLAY_DELAY
                );
                return;
            }
            nativeUtilPlugin.execute(null, null, actions.SHOW_SPLASH_ON_LOADING, []);
            if (sensors_rule.ruleObj.When.StartSRSS != undefined || sensors_rule.ruleObj.When.EndSRSS != undefined) {
                for (key in sensors_rule.ruleObj.Devices) {

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
                            actions.GET_FIRMWARE_VERSION_SRSS_OFFSET, [key]
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

                                            if (firmwareVer >= configValue.SO_FW_SUPPORT) {
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

            }

            if (issupported === "false") {
                return;
            }

            if (sensors_rule.ruleObj.When.RuleDuration == undefined) {
                var StartTimeAM = 'false';
                var EndTimeAM = 'false';
                StartTimeAM = (wemoUtil.convertMillisecondsToAMPM(sensors_rule.ruleObj.When.StartTime).lastIndexOf("am") != -1) ? 'true' : 'false';
                EndTimeAM = (wemoUtil.convertMillisecondsToAMPM(sensors_rule.ruleObj.When.EndTime).lastIndexOf("am") != -1) ? 'true' : 'false';
                if (sensors_rule.ruleObj.When.EndTime < sensors_rule.ruleObj.When.StartTime) {
                    if (StartTimeAM == EndTimeAM) {
                        sensors_rule.ruleObj.When.RuleDuration = timestamp.MAX_HOUR - (parseInt(sensors_rule.ruleObj.When.StartTime) - parseInt(sensors_rule.ruleObj.When.EndTime));
                    } else {
                        sensors_rule.ruleObj.When.RuleDuration = (timestamp.MAX_HOUR - (parseInt(sensors_rule.ruleObj.When.StartTime))) + parseInt(sensors_rule.ruleObj.When.EndTime);
                    }
                } else {
                    sensors_rule.ruleObj.When.RuleDuration = sensors_rule.ruleObj.When.EndTime - sensors_rule.ruleObj.When.StartTime;
                }
            }

            //-------------------SRSS--------------------
            //Plug-in Call To Get Firmware Version SRSS
            if (sensors_rule.ruleObj.When.StartSRSS != undefined || sensors_rule.ruleObj.When.EndSRSS != undefined) {
                if (Object.keys(sensors_rule.ruleObj.Devices).length > 0) {
                    for (key in sensors_rule.ruleObj.Devices) {
                        console.log("SRSS - UDN Firmware Version - " + key + "  ::  " + sensors_rule.ruleObj.Devices[key]);
                        sensors_rule.ruleObj.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                        //alert("Save - isFirmWareSupported: 1 "+sensors_rule.ruleObj.When.isFirmWareSupported);
                    }
                    //alert("Save - isFirmWareSupported: 2 "+sensors_rule.ruleObj.When.isFirmWareSupported);
                }
            }
            //-------------------SRSS--------------------

            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, sensors_rule.ruleObj);
            console.log("Saveing Sensor Rule");
            if (sensors_rule.ruleObj.When.isFirmWareSupported != undefined && sensors_rule.ruleObj.When.isFirmWareSupported === "false") {
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
                saveNewRule_RULES_RULEDEVICES(sensors_rule.ruleObj.RuleType, sensors_rule.ruleObj);
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
            wemoUtil.loadUrl(filePath.ENABLED_RULES);
        });

        $("#identicalOnOffTimeOkBtn").on("tap", function() {
            $("#identicalOnOffTime").popup("close");
        });

        $('#sensors_rule_cancel_btn').on("pointerdown", function() {
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
            sensors_rule.ruleObj.RuleType = sessionStore.MOTION_CONTROLLED;
            if (Object.keys(sensors_rule.ruleObj.Devices).length > 0) {
                for (key in sensors_rule.ruleObj.Devices) {
                    sensors_rule.ruleObj.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, sensors_rule.ruleObj);
                }
            }
            var selectedDevice = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE);
            if (selectedDevice != null) {
                window.sessionStorage.removeItem(sessionStore.CURRENT_DEVICE);
            }
            saveNewRule_RULES_RULEDEVICES(sensors_rule.ruleObj.RuleType, sensors_rule.ruleObj);
        });

        $('#sunrise_firmware_upgrade_later').on('click', function() {
            //alert("Save Rule");
            $("#sunrise_firmware_upgrade").popup('close');
            sensors_rule.ruleObj.RuleType = sessionStore.MOTION_CONTROLLED;
            if (Object.keys(sensors_rule.ruleObj.Devices).length > 0) {
                for (key in sensors_rule.ruleObj.Devices) {
                    sensors_rule.ruleObj.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, sensors_rule.ruleObj);
                }
            }
            var selectedDevice = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE);
            if (selectedDevice != null) {
                window.sessionStorage.removeItem(sessionStore.CURRENT_DEVICE);
            }
            saveNewRule_RULES_RULEDEVICES(sensors_rule.ruleObj.RuleType, sensors_rule.ruleObj);
        });
    },


    updateRuleDevices: function() {
        console.log("Updating rule devices...")
        console.log(JSON.stringify(sensors_rule.ruleObj));

        sensors_rule.ruleObj.Devices = {};

        for (var udn in deviceList.getArray()) {
            console.log(JSON.stringify(deviceList.getDevice(udn)));
            if (deviceList.getDevice(udn) != undefined && deviceList.getDevice(udn) != '') {
                if (deviceList.getDevice(udn).state != undefined && deviceList.getDevice(udn).state != '') {
                    sensors_rule.ruleObj.Devices[udn] = {};

                    if (deviceList.getDevice(udn).state == 'on') {
                        sensors_rule.ruleObj.Devices[udn].StartAction = 1;
                        deviceList.setActive(udn, 'on', deviceList.getDevice(udn).duration);
                        if (deviceList.getDevice(udn).duration != '0' && deviceList.getDevice(udn).duration != '1') {
                            sensors_rule.ruleObj.Devices[udn].SensorDuration = wemoUtil.convertTimeToMilliseconds(deviceList.getDevice(udn).duration);
                        } else {
                            sensors_rule.ruleObj.Devices[udn].SensorDuration = deviceList.getDevice(udn).duration;
                        }
                        sensors_rule.ruleObj.Devices[udn].EndAction = "0";
                    } else if (deviceList.getDevice(udn).state == 'off') {
                        sensors_rule.ruleObj.Devices[udn].SensorDuration = 0;
                        sensors_rule.ruleObj.Devices[udn].StartAction = 0;
                        sensors_rule.ruleObj.Devices[udn].EndAction = "0";
                        deviceList.setActive(udn, 'off');
                    }
                    

                    sensors_rule.ruleObj.Devices[udn].FName = deviceList.getDevice(udn).name;
                    sensors_rule.ruleObj.Devices[udn].ProductName = deviceList.getDevice(udn).productName;
                    console.log(udn + ': ' + JSON.stringify(sensors_rule.ruleObj.Devices[udn]));
                }
            }
        }

        console.log(JSON.stringify(sensors_rule.ruleObj));
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

    updateRuleSelectedSensors: function() {
        var selectedSensors = '';
        $('#sensor_list > .more_li_clone').each(function(index) {
            if ($(this).find('.check_mark').css('display') != 'none') {
                console.log(index + ": " + $(this).attr('id'));
                if (selectedSensors != '') selectedSensors += ',';
                selectedSensors += $(this).attr('id');
            }
        });
        console.log('Selected sensors: ' + selectedSensors);
        sensors_rule.ruleObj.SelectedSensors = selectedSensors;
    },
    
    updateSelectedSensor: function(udn, state, isSelected) {
        if (isSelected) {
            sensors_rule.ruleObj.Sensors[udn] = {};
            sensors_rule.ruleObj.Sensors[udn]['state'] = state;
            if(sensors_rule.sensorDevicesObj[udn].ProductName != undefined)
            	sensors_rule.ruleObj.Sensors[udn]['ProductName'] = sensors_rule.sensorDevicesObj[udn].ProductName;
            wemoUtil.infoLog(TAG, "updateSelectedSensor:: " + "Rule Obj -->>>" + JSON
                .stringify(sensors_rule.ruleObj));
        } else {
            delete sensors_rule.ruleObj.Sensors[udn];
            wemoUtil.infoLog(TAG, "updateSelectedSensor:: " + "Rule Obj -->>>" + JSON
                .stringify(sensors_rule.ruleObj));
        }

    },

    enableWhatHappens: function(networktype, remoteEnable) {
        console.log("success creating the table structures");
        if (networktype == networkType.HOME_NETWORK || networktype == null) {
            console.log("Local Mode...");

            deviceTabPlugin.execute(
                function(params) {
                    if (params.length == Object.keys(sensors_rule.ruleObj.Devices).length) {
                        $('#sensors_rule_what_happens .what_happens_select_switches').hide();
                    }
                },
                function(err) {
                    console.log("Error getting sensors list")
                },
                actions.SELECT_SWITCHES, []);

        } else if (networktype == networkType.REMOTE_WIFI || networktype == networkType.REMOTE_MOBILE) {
            if (remoteEnable) {
                var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
                //alert("Switch count : "+arraySensorObjects.length);

                if (arraySwitchObjects.length == Object.keys(sensors_rule.ruleObj.Devices).length) {
                    $('#sensors_rule_what_happens .what_happens_select_switches').hide();
                }

            } else {
                navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {
                    loadUrlTimeoutValue: 60000
                });
            }
        }
    },

    bindEvents: function() {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', sensors_rule.onOnline, false);
        document.addEventListener('offline', sensors_rule.onOffline, false);
        document.addEventListener("backbutton", sensors_rule.onBackPress, false);
        document.addEventListener("pause", sensors_rule.onPause, false);
        document.addEventListener("resume", sensors_rule.onResume, false);
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
        var selectedSensor = window.sessionStorage.getItem(sessionStore.CURRENT_SENSOR_NAME);
        if (selectedSensor != null) {
            window.sessionStorage.removeItem(sessionStore.CURRENT_SENSOR_NAME);
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

    loaderStateCheck: function() {
        var msg;
        flag = false;
        var state = "success";
        if (state === "working") {
            msg = wemo.items['RULE_STATUS_REFRESHING_DB'];
        } else if (state === "something") {
            msg = wemo.items['AppStatusWaiting'];
        } else if (state === "something") {
            msg = wemo.items['AppStatusWorking'];
        } else if (state === "successnot") {
            msg = wemo.items['RULE_STATUS_CHECKING_CONFLICTS'];
        } else if (state === "something") {
            msg = wemo.items['RULE_STATUS_SENDING_DB'];
        } else if (state === "success") {
            msg = ' ';
            flag = true;

            var elem = $(".ui-loader-verbose").find("h1");

            $(".ui-loader").css({
                background: "url('../img/Actions-dialog-ok-apply-icon.png') no-repeat scroll 119px center #000000",
                height: "44px"
            });

        }
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
            window.open(wemo.items['Help_Rules_Alert_Url'], "_system");
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

    },


    buildSensorList: function() {
        console.log("Build sensors list");

        var htmlList = "", sensorDevices = [];
        

        if (isRemoteEnabled) {
            var arraySensorObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SENSOR_DATA);
            arraySensorObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.PIR_DATA).concat(arraySensorObjects);
            if (arraySensorObjects.length > 0) {
                $.each(arraySensorObjects, function(inx) {
                    sensors_rule.sensorDevicesObj[arraySensorObjects[inx].udn] ={ProductName: arraySensorObjects[inx].ProductName};
                    var sensorUdn = arraySensorObjects[inx].udn;
                    var sensorName = arraySensorObjects[inx][key.DEVICE_FRIENDLY_NAME];
                    if (sensorUdn.indexOf('NetCam') != -1) {
                        arraySensorObjects[inx][key.DEVICE_FRIENDLY_NAME] = wemoUtil.extractNetCamName(sensorName);
                    }

                    console.log("Sensor UDN: " + arraySensorObjects[inx].udn + ", name: " + arraySensorObjects[inx].friendlyName);

                    htmlList += '<div class="select_sensors_list more_li_clone" id="' + arraySensorObjects[inx].udn + '">' +
                        '<div class="more_li_content"><span class="more_li_text_div">' + arraySensorObjects[inx].friendlyName + '</span>'+
                        '<span class="more_li_subHeader">' + wemo.items['Motion'] + '</span></div>' +
                        '<span class="check_mark"></span></div>';

                    var selected = false;

                    for (var dev in sensors_rule.ruleObj.Sensors) {
                    	if (dev == arraySensorObjects[inx].udn) {
                    		selected = true;
                    	}
                    }

                    $('#sensor_list').html(htmlList);

                    if (selected) {
                        $("#sensor_list .check_mark").show();
                        $("#sensor_list .more_li_subHeader").show();
                    } else {
                        $("#sensor_list .check_mark").hide();
                        $("#sensor_list .more_li_subHeader").hide();
                    }


                });
            }
        } else {
        	var params =[], pirSensors = [];
        	params = wemoUtil.getDevices(actions.SELECT_SENSORS);

            //Commenting this code as it's corrupting the sensors array and PIR sensors are not supported anymore.
        	//params = wemoUtil.getDevices(actions.SELECT_PIR_SENSORS).concat(params);
        	
                    if (params.length > 0) {
                        $.each(params, function(inx) {
                        	sensors_rule.sensorDevicesObj[params[inx].udn] ={ProductName: params[inx].ProductName};
                        	
                            if (params[inx].udn.indexOf('NetCam') != -1) {
                                params[inx].friendlyName = wemoUtil.extractNetCamName(params[inx].friendlyName);
                            }
                            console.log("Sensor UDN: " + params[inx].udn + ", name: " + params[inx].friendlyName);

                            htmlList += '<div class="select_sensors_list more_li_clone" id="' + params[inx].udn + '">' +
                                '<div class="more_li_content"><span class="more_li_text_div">' + params[inx].friendlyName + '</span>'+
                                '<span class="more_li_subHeader">' + wemo.items['Motion'] + '</span></div>' +
                                '<span class="check_mark"></span></div>';

                            var selected = false;

                            for (var dev in sensors_rule.ruleObj.Sensors) {
                            	if (dev == params[inx].udn) {
                            		selected = true;
                            	}
                            }
                            $('#sensor_list').html(htmlList);
                            if (selected) {
                                $("#sensor_list .check_mark").show();
                                $("#sensor_list .more_li_subHeader").show();
                            } else {
                                $("#sensor_list .check_mark").hide();
                                $("#sensor_list .more_li_subHeader").hide();
                            }

                        });
                    }
        }

        
    }

};
