/*
 maker_rule.js

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

var TAG = "maker_rule.js: ";
var cur_drawer;
var UP_TF_IS24 = false; //UP-user preferences, TF-time format
var makerDevices;

$(document).bind('pageinit', function() {
    maker_rule.initialize();
});

var maker_rule = {
    deviceList: {},
    ruleObj: {},

    initialize: function() {
        console.log(TAG + "initialize");
        var isEdit = window.sessionStorage.getItem(sessionStore.isEdit);
        if (isEdit == sessionStore.RULE_NEW) {
            $('.sub_header > span').html(wemo.items['NewRuleMakerRuleTitle']);
        } else {
            $('.sub_header > span').html(wemo.items['EditRuleMakerRuleTitle']);
        }
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    onDeviceReady: function() {
        var self = this;
        UP_TF_IS24 = wemoUtil.userPreferences.getTimeFormat();
        
        if (!isRemoteEnabled) {
        $.when(wemoUtil.getDevices(actions.SELECT_SWITCHES), wemoUtil.getDevices(actions.SELECT_INSIGHTS), wemoUtil.getDevices(actions.SELECT_MAKER), wemoUtil.getDevices(actions.SELECT_LED_DEVICES))
            .then(function() {

                maker_rule.afterOnDeviceReady();

            }).fail(function() {
                throw ('ERROR');
            });
        }else{
        	 maker_rule.afterOnDeviceReady();
        }

    },
    afterOnDeviceReady: function() {
        $.getScript('../js/classes/deviceList.js', function() {
            $.getScript('../js/vendor/date.js', function() {
                maker_rule.methodMain();
            });
        });
    },

    loadDevices: function() {

        console.log(JSON.stringify(maker_rule.ruleObj));
        var devices = [];
        var bridgeUDN = '';

        if (isRemoteEnabled) {
            devices = wemoUtil
                .getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
            devices = wemoUtil.getJSONObjectFromSessionStorage(
                sessionStore.INSIGHT_DATA).concat(devices);
            devices = wemoUtil.getJSONObjectFromSessionStorage(
                sessionStore.MAKER_DATA).concat(devices);
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
            devices = wemoUtil.getDevices(actions.SELECT_INSIGHTS).concat(
                devices);
            makerDevices = wemoUtil.getDevices(actions.SELECT_MAKER);
            devices = makerDevices.concat(devices);
            tempDevices = wemoUtil.getDevices(actions.SELECT_LED_DEVICES);
            if (tempDevices != '0') {
                devices = tempDevices.concat(devices);
            }
        }

        if (devices != null && devices.length > 0) {
            $
                .each(
                    devices,
                    function(inx) {
                        if (wemoUtil.isMakerDevice(devices[inx].udn)) {
                            deviceList.addMakerDevice(devices[inx].udn, devices[inx].friendlyName, devices[inx].SwitchMode);
                        } else {
                            if ((devices[inx].udn).indexOf("uuid") == -1) {
                                if (devices[inx].udn == '') {
                                    devices[inx].udn = devices[inx].macAddress;
                                    deviceList.addLedDevice(devices[inx].macAddress, devices[inx].friendlyName, bridgeUDN);
                                } else
                                    deviceList.addLedDevice(devices[inx].udn, devices[inx].friendlyName, devices[inx].bridgeudn);
                            } else {
                                deviceList.addDevice(devices[inx].udn, devices[inx].friendlyName);
                            }
                        }

                        for (var dev in maker_rule.ruleObj.Devices) {
                            console
                                .log(maker_rule.ruleObj.Devices[dev]);
                            if (wemoUtil.isMakerDevice(dev)) {
                                if (wemoUtil.getMakerSwithUDN(dev) == wemoUtil.getMakerSwithUDN(devices[inx].udn)) {
                                    if (maker_rule.ruleObj.Devices[dev].StartAction == 0) {
                                        deviceList.setActive(
                                            devices[inx].udn, 'off');
                                    } else if (maker_rule.ruleObj.Devices[dev].StartAction == 1) {
                                        if ((maker_rule.ruleObj.Devices[dev].SensorDuration != 0) && (maker_rule.ruleObj.Devices[dev].SensorDuration != 1)) {
                                            var time = (new Date)
                                                .clearTime()
                                                .addSeconds(
                                                    maker_rule.ruleObj.Devices[dev].SensorDuration)
                                                .toString('HH:mm');
                                            deviceList.setActive(
                                                devices[inx].udn, 'on',
                                                time);
                                        } else {
                                            deviceList
                                                .setActive(
                                                    devices[inx].udn,
                                                    'on',
                                                    maker_rule.ruleObj.Devices[dev].SensorDuration);
                                        }
                                    }
                                }
                            } else {
                                if (dev == devices[inx].udn) {
                                    if (maker_rule.ruleObj.Devices[dev].StartAction == 0) {
                                        deviceList.setActive(
                                            devices[inx].udn, 'off');
                                    } else if (maker_rule.ruleObj.Devices[dev].StartAction == 1) {
                                        if ((maker_rule.ruleObj.Devices[dev].SensorDuration != 0) && (maker_rule.ruleObj.Devices[dev].SensorDuration != 1)) {
                                            var time = (new Date)
                                                .clearTime()
                                                .addSeconds(
                                                    maker_rule.ruleObj.Devices[dev].SensorDuration)
                                                .toString('HH:mm');
                                            deviceList.setActive(
                                                devices[inx].udn, 'on',
                                                time);
                                        } else {
                                            deviceList
                                                .setActive(
                                                    devices[inx].udn,
                                                    'on',
                                                    maker_rule.ruleObj.Devices[dev].SensorDuration);
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
                        state = maker_rule.formatOnWithMotionStr(deviceList.getDevice(udn).duration);
                } else if (deviceList.getDevice(udn).state == "off") {
                    state = wemo.items['off'];
                }
            }

            if (isMomentarySwitch) {

                html = '<div class="select_switches_list notify_rule_item" data-udn="' + udn + '"><div class="display_table"><span class="display_cell padding_left_16px"><span class="fname">' + deviceList.getDevice(udn).name + '</span><span class="action_subHeader">' + state + '</span></span></div><span class="check_mark"></span></div></div>';
                //				<div class="drawer" id="'
                //				+ udn
                //				+ '"><div class="drawer_li on"><span>'
                //				+ wemo.items['on']
                //				+ '</span></div><div class="drawer_li off"><span>'
                //				+ wemo.items['off'] + '</span></div></div>';
            } else {

                html = '<div class="select_switches_list notify_rule_item" data-udn="' + udn + '"><div class="display_table"><span class="display_cell padding_left_16px"><span class="fname">' + deviceList.getDevice(udn).name + '</span><span class="action_subHeader">' + state + '</span></span></div><span class="check_mark"></span></div><div class="drawer" id="' + udn + '"><div class="drawer_li on_then"><span>' + wemo.items['OnThen'] + '</span></div><div class="drawer_li off"><span>' + wemo.items['off'] + '</span></div></div>';
            }
            $('#sensors_container #device_list').append($(html));

            if (state != '') {
                $('div [data-udn="' + udn + '"] ').find('.check_mark').show();
                if (deviceList.getDevice(udn).state == 'on') {
                    $('div [id="' + udn + '"]').find('.on_then span').empty().html(maker_rule.formatOnWithMotionStr(deviceList.getDevice(udn).duration));
                    $('div [id="' + udn + '"]').find('.on_then').addClass(
                        'div_bg_green');
                } else if (deviceList.getDevice(udn).state == "off") {
                    $('div [id="' + udn + '"]').find('.off span').empty().html(
                        wemo.items['off']);
                    $('div [id="' + udn + '"]').find('.off').addClass(
                        'div_bg_green');
                }
            }
        }

        //		$('div .on')
        //				.on(
        //						'tap',
        //						function(e) {
        //
        //							var udn = $(this).parent().attr('id');
        //							if ($(this).hasClass('div_bg_green')) {
        //								maker_rule.deselectDevice(udn);
        //							}
        //							
        //							else {
        //								maker_rule.selectDevice('on', 0, udn);
        //							}
        //
        //							$(this).parent().slideToggle('fast');
        //							maker_rule.updateRuleDevices();
        //							e.preventDefault();
        //						});

        $('div .on_then').on('tap', function(e) {
            var cur_drawer = $(this).parent();
            var udn = cur_drawer.attr('id');

            if ($(this).hasClass('div_bg_green')) {
                maker_rule.deselectDevice(udn);
                cur_drawer.slideUp();
                maker_rule.updateRuleDevices();
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
                    maker_rule.selectDevice('on', val, $('.picker').attr("data-udn"));

                    $('.overlay').hide();
                    $('.picker_container').hide();

                    cur_drawer.slideUp();
                    maker_rule.updateRuleDevices();
                    event.preventDefault();
                });
            }

            e.preventDefault();
        });

        $('div .off').on('tap', function(e) {
            var udn = $(this).parent().attr('id');
            if ($(this).hasClass('div_bg_green')) {
                maker_rule.deselectDevice(udn);
            } else {
                maker_rule.selectDevice('off', 0, udn);
            }

            $(this).parent().slideToggle('fast');
            maker_rule.updateRuleDevices();
            e.preventDefault();
        });

        $("#device_list").find('.check_mark').on('tap', function() {
            var udn = $(this).closest('.select_switches_list').attr('data-udn');
            var drawer = $('div [id="' + udn + '"]');
            if (drawer.is(":visible")) drawer.slideToggle("slow");
            maker_rule.deselectDevice(udn);
            maker_rule.updateRuleDevices();
        });

    },

    deselectDevice: function(udn) {
        var drawerItem = $("#sensors_container #device_list").children('div [id="' + udn + '"]');
        var deviceRow = $("#sensors_container #device_list").children('div [data-udn="' + udn + '"] ');
        drawerItem.find('.on_then')
            .removeClass('div_bg_green');
        drawerItem.find('.off').removeClass('div_bg_green');
        deviceRow.find('.check_mark').hide();
        deviceRow.find('.action_subHeader').empty();
        drawerItem.find('.on_then span').html(
            wemo.items['OnThen']);

        deviceList.unsetActive(udn);
    },

    selectDevice: function(type, duration, udn) {
        var drawerItem = $("#sensors_container #device_list").children('div [id="' + udn + '"]');
        var deviceRow = $("#sensors_container #device_list").children('div [data-udn="' + udn + '"] ');
        drawerItem.find('.on_then')
            .removeClass('div_bg_green');
        drawerItem.find('.off').removeClass('div_bg_green');

        deviceRow.find('.check_mark').show();

        if (type == 'on') {
            drawerItem.find('.on_then').addClass('div_bg_green');

            if (wemoUtil.isMakerDevice(udn) && deviceList.getDevice(udn).switchMode == "1") {
                deviceRow.find('.action_subHeader').html('on');
            } else {
                deviceRow.find('.action_subHeader').html(maker_rule.formatOnWithMotionStr(duration));
            }
        } else if (type == 'off') {
            drawerItem.find('.off').addClass('div_bg_green');
            deviceRow.find('.action_subHeader').html(wemo.items['off']);
        }

        deviceList.setActive(udn, type, duration);
    },

    selectSensor: function(type, udn) {
        var drawerItem = $("#sensors_rule_if #sensor_list").children('div [id="' + udn + '"]');
        var sensorRow = $("#sensors_rule_if #sensor_list").children('div [data-udn="' + udn + '"] ');

        sensorRow.find('.check_mark').show();
        if (type == 'on') {

            drawerItem.find('.close').removeClass('div_bg_green');
            drawerItem.find('.open').addClass('div_bg_green');
            sensorRow.find('.action_subHeader').html(wemo.items['SensorOpen']);
            maker_rule.updateSelectedSensor(udn, "1", true);

        } else if (type == 'off') {

            drawerItem.find('.open').removeClass('div_bg_green');
            drawerItem.find('.close').addClass('div_bg_green');
            sensorRow.find('.action_subHeader').html(wemo.items['SensorClosed']);
            maker_rule.updateSelectedSensor(udn, "0", true);
        }
    },

    updateSelectedSensor: function(udn, state, isSelected) {
        if (isSelected) {
            maker_rule.ruleObj.Sensors[udn] = {};
            maker_rule.ruleObj.Sensors[udn]['state'] = state;
            console.log("updateSelectedSensor:: " + "Rule Obj -->>>" + JSON
                .stringify(maker_rule.ruleObj));
        } else {
            delete maker_rule.ruleObj.Sensors[udn];
            console.log("updateSelectedSensor:: " + "Rule Obj -->>>" + JSON
                .stringify(maker_rule.ruleObj));
        }

    },

    deselectSensor: function(udn) {
        var drawerItem = $("#sensors_rule_if #sensor_list").children('div [id="' + udn + '"]');
        var sensorRow = $("#sensors_rule_if #sensor_list").children('div [data-udn="' + udn + '"] ');

        drawerItem.find('.open')
            .removeClass('div_bg_green');
        drawerItem.find('.close').removeClass('div_bg_green');
        sensorRow.find('.check_mark').hide();
        sensorRow.find('.action_subHeader').empty();

        maker_rule.updateSelectedSensor(udn, "", false);

    },

    methodMain: function() {
        var networktype = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_NETWORKTYPE);
        wemoUtil.setTimeFormat();
        maker_rule.bindEvents();

        maker_rule.ruleObj = wemoUtil
            .getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
        maker_rule.ruleObj.RuleType = sessionStore.MAKER_MOTION_CONTROLLED;
        maker_rule.loadDevices();
        maker_rule.renderDeviceList();
        maker_rule.buildSensorList();

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

        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);

        // To return back to home page: device list tab
        $(".wemo_logo").on("tap", function(e) {
            if (e.target.nodeName != "IMG") {
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }
        });
        if (maker_rule.ruleObj.When.EndTime == undefined)
            maker_rule.ruleObj.When.EndTime = parseInt(
                maker_rule.ruleObj.When.StartTime, 10) + parseInt(maker_rule.ruleObj.When.RuleDuration, 10);
        // ********** display time values
        if ((!maker_rule.ruleObj.When.StartTime || !maker_rule.ruleObj.When.EndTime)) {

            maker_rule.ruleObj.When.StartTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestHalfHour());
            maker_rule.ruleObj.When.EndTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestOneAndHalfHour());
wemoUtil.infoLog(TAG, "convertMillisecondsToAMPM startTime :: " +  maker_rule.ruleObj.When.StartTime + " :: endtime :: " +  maker_rule.ruleObj.When.EndTime);
            var tempDisSelectday = wemo.items['Daily'];

            // alert("sensors_rule.ruleObj.When.EndTime
            // "+sensors_rule.ruleObj.When.EndTime);
            $("#maker_rule_when .select_time")
                .text(wemoUtil.convertMillisecondsToTF(maker_rule.ruleObj.When.StartTime, UP_TF_IS24) + " - " + wemoUtil.convertMillisecondsToTF(maker_rule.ruleObj.When.EndTime, UP_TF_IS24));
            $("#maker_rule_when .select_day").html(tempDisSelectday);
            // sensors_rule.ruleObj.SelectedDayOrRange = "Daily";
        } else {
            // var EndTime=parseInt(sensors_rule.ruleObj.When.EndTime)
            if (maker_rule.ruleObj.When.StartSRSS != undefined && maker_rule.ruleObj.When.EndSRSS != undefined) {

                if (maker_rule.ruleObj.When.onSRSS_Title != undefined) {
                    var tempStartSRSS = maker_rule.ruleObj.When.onSRSS_Title;
                } else {

                    if (maker_rule.ruleObj.When.StartSRSS == "Sunrise") {
                        var tempStartSRSS = wemo.items['SunRise'];
                    } else if (maker_rule.ruleObj.When.StartSRSS == "Sunset") {
                        var tempStartSRSS = wemo.items['SunSet'];
                    } else {
                        var tempStartSRSS = maker_rule.ruleObj.When.StartSRSS;
                    }
                }

                if (maker_rule.ruleObj.When.offSRSS_Title != undefined) {
                    var tempEndSRSS = maker_rule.ruleObj.When.offSRSS_Title;
                } else {
                    if (maker_rule.ruleObj.When.EndSRSS == "Sunrise") {
                        var tempEndSRSS = wemo.items['SunRise'];
                    } else if (maker_rule.ruleObj.When.EndSRSS == "Sunset") {
                        var tempEndSRSS = wemo.items['SunSet'];
                    } else {
                        var tempEndSRSS = maker_rule.ruleObj.When.EndSRSS;
                    }
                }

                $("#maker_rule_when .select_time").text(
                    tempStartSRSS + " - " + tempEndSRSS);

            } else if (maker_rule.ruleObj.When.StartSRSS == undefined && maker_rule.ruleObj.When.EndSRSS != undefined) {

                if (maker_rule.ruleObj.When.offSRSS_Title != undefined) {
                    var tempEndSRSS = maker_rule.ruleObj.When.offSRSS_Title;
                } else {

                    if (maker_rule.ruleObj.When.EndSRSS == "Sunrise") {
                        var tempEndSRSS = wemo.items['SunRise'];
                    } else if (maker_rule.ruleObj.When.EndSRSS == "Sunset") {
                        var tempEndSRSS = wemo.items['SunSet'];
                    } else {
                        var tempEndSRSS = maker_rule.ruleObj.When.EndSRSS;
                    }
                }

                $("#maker_rule_when .select_time")
                    .text(wemoUtil.convertMillisecondsToTF(maker_rule.ruleObj.When.StartTime, UP_TF_IS24) + " - " + tempEndSRSS);

            } else if (maker_rule.ruleObj.When.StartSRSS != undefined && maker_rule.ruleObj.When.EndSRSS == undefined) {

                if (maker_rule.ruleObj.When.onSRSS_Title != undefined) {
                    var tempStartSRSS = maker_rule.ruleObj.When.onSRSS_Title;
                } else {
                    if (maker_rule.ruleObj.When.StartSRSS == "Sunrise") {
                        var tempStartSRSS = wemo.items['SunRise'];
                    } else if (maker_rule.ruleObj.When.StartSRSS == "Sunset") {
                        var tempStartSRSS = wemo.items['SunSet'];
                    } else {
                        var tempStartSRSS = maker_rule.ruleObj.When.StartSRSS;
                    }
                }

                $("#maker_rule_when .select_time")
                    .text(tempStartSRSS + " - " + wemoUtil.convertMillisecondsToTF(maker_rule.ruleObj.When.EndTime, UP_TF_IS24));

            } else if (maker_rule.ruleObj.When.StartSRSS == undefined && maker_rule.ruleObj.When.EndSRSS == undefined) {
                if (maker_rule.ruleObj.When.StartTime == sessionStore.ALLDAY_STARTTIME && maker_rule.ruleObj.When.EndTime == sessionStore.ALLDAY_ENDTIME) {
                    $("#maker_rule_when .select_time").text(
                        sessionStore.SENSOR_ALLDAY);
                } else {
                    $("#maker_rule_when .select_time")
                        .text(wemoUtil.convertMillisecondsToTF(maker_rule.ruleObj.When.StartTime, UP_TF_IS24) + " - " + wemoUtil.convertMillisecondsToTF(maker_rule.ruleObj.When.EndTime, UP_TF_IS24));
                }
            }

        }

        var tempSelectedDayOrRange = "";
        tempSelectedDayOrRange = wemoUtil
            .convertSelectedDayOrRangeToString(maker_rule.ruleObj);

        $("#maker_rule_when .select_day").html(tempSelectedDayOrRange);

        // console.log("Times Home :: "+"Start ::
        // "+maker_rule.ruleObj.When.StartTime+" END
        // ::"+maker_rule.ruleObj.When.EndTime+" Duration ::
        // "+maker_rule.ruleObj.When.RuleDuration);

        if (typeof(maker_rule.ruleObj.RuleName) == "undefined") {
            maker_rule.ruleObj.RuleName = wemo.items['NewMakerSensorRule'];
        }
        $("#maker_rule_rule_name #rule_name").html(maker_rule.ruleObj.RuleName);

        // wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,maker_rule.ruleObj);
        // maker_rule Page Start
        $("#maker_rule_what_happens").on(
            "tap",
            function() {
                window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON
                    .stringify(sessionStore.MAKER_MOTION_CONTROLLED));
                wemoUtil.setJSONObjectToSessionStorage(
                    sessionStore.RULE_NEW, maker_rule.ruleObj);
                wemoUtil.loadUrl(filePath.SELECT_SWITCHES);
            });

        $("#maker_rule_selected_device").find("li").on(
            "tap",
            function() {

                window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE,
                    $(this).attr("data-udn"));
                window.sessionStorage.setItem(
                    sessionStore.CURRENT_DEVICE_NAME, $(this).attr(
                        "data-fName"));
                window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON
                    .stringify(sessionStore.MAKER_MOTION_CONTROLLED));
                wemoUtil.setJSONObjectToSessionStorage(
                    sessionStore.RULE_NEW, maker_rule.ruleObj);
                wemoUtil.loadUrl(filePath.SENSORS_WHAT_HAPPENS);
            });


        $("#sensors_container #device_list").find(
            '.select_switches_list .fname').on(
            "click",
            function(event) {
                event.stopPropagation();

                var id_drawer = $.trim($(this).closest(
                    ".select_switches_list").attr('data-udn'));
                var drawer = $("#sensors_container #device_list").children('div [id="' + id_drawer + '"]');

                if (drawer.length != 0) {
                    if ((drawer.is(":visible")) && (drawer.find("div").hasClass("div_bg_green"))) {
                        var tmp = drawer.find('.div_bg_green span').html();
                        console.log("tmp " + tmp);
                    }

                    drawer.slideToggle("fast", function() {
                        if (drawer.find("div").hasClass("div_bg_green")) {
                            maker_rule.updateRuleDevices();
                        }
                        if (drawer.is(":visible")) {
                            $('#sensors_container #device_list .drawer:visible').each(function(i, elem) {
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
                        maker_rule.selectDevice('on', 0, id_drawer);
                        maker_rule.updateRuleDevices();
                    }

                }
                event.preventDefault();
            });

        $("#sensors_rule_if #sensor_list").on("tap", '.select_sensors_list .fname', function(event) {
                    event.stopPropagation();

                    var id_drawer = $.trim($(this).closest(
                        ".select_sensors_list").attr('data-udn'));
                    var drawer = $("#sensors_rule_if #sensor_list").children('div [id="' + id_drawer + '"]');

                    if ((drawer.is(":visible")) && (drawer.find("div")
                        .hasClass("div_bg_green"))) {
                        var tmp = drawer.find('.div_bg_green span')
                            .html();
                        console.log("tmp " + tmp);
                    }

                    drawer.slideToggle("fast",
                        function() {
                            if (drawer.find("div").hasClass(
                                "div_bg_green")) {
                                maker_rule.updateRuleDevices();
                            }
                            if (drawer.is(":visible")) {
                                $('#sensors_rule_if #sensor_list .drawer:visible').each(function(i, elem) {
                                    if ($(this).attr("id") != id_drawer) {
                                        $(this).slideToggle("fast");
                                        console.log("hide drawer id=" + $(this).attr("id"));
                                    }
                                });
                            };
                        });

                    event.preventDefault();

                });

        //Check mark handler Start
        $("#sensors_container #device_list").find('.select_switches_list .check_mark').on("tap", function(e) {
            var data_udn = $.trim($(this).parent().attr('data-udn'));
            maker_rule.deselectDevice(data_udn);
            maker_rule.updateRuleDevices();
            e.preventDefault();
        });
       
        //Check mark handler End

        $("#maker_rule_when").on(
            "tap",
            function() {
                window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON
                    .stringify(sessionStore.MAKER_MOTION_CONTROLLED));
                wemoUtil.setJSONObjectToSessionStorage(
                    sessionStore.RULE_NEW, maker_rule.ruleObj);
                wemoUtil.loadUrl(filePath.SENSORS_RULE_WHEN);
            });

        $("#maker_rule_rule_name").on(
            "tap",
            function() {
                window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON
                    .stringify(sessionStore.MAKER_MOTION_CONTROLLED));
                wemoUtil.setJSONObjectToSessionStorage(
                    sessionStore.RULE_NEW, maker_rule.ruleObj);
                wemoUtil.loadUrl(filePath.RULE_NAME);
            });

        // maker_rule Click on the Save Button
        $("#maker_rule_save_btn").on('tap', function() {
                    // alert(JSON.stringify(maker_rule.ruleObj));

                    var len = Object.keys(maker_rule.ruleObj.Devices).length;
                    var issupported = "";
                    if (len == 0) {
                        $('body').on('touchmove', function(e) {
                            e.preventDefault();
                        });
                        $('#device_not_selected').popup("open");
                        console.log("save disable");
                        return;
                    }
                    if (maker_rule.ruleObj.When.StartSRSS != undefined || maker_rule.ruleObj.When.EndSRSS != undefined) {
                        for (key in maker_rule.ruleObj.Devices) {

                            if (networktype == null || networktype == networkType.HOME_NETWORK) {
                                devicePlugin.execute(
                                    function(params) {
                                        if (params === "true") {
                                            issupported = params;
                                        } else {
                                            issupported = params;
                                            var ruleConflictLocalizedmsg = wemo.items['FirmwareVerCheckText_OFFSET'];
                                            $("#FirmwareVerCheckText").html(ruleConflictLocalizedmsg);
                                            setTimeout(function() {
                                                    $("#fw_ver_check").popup("open");
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

                                                    if (firmwareVer >= sessionStore.SO_FW_SUPPORT) {
                                                        wemoUtil.infoLog(wemoUtil.TAG, 'firmware is not supported ');
                                                        issupported = "true";
                                                    } else {
                                                        var ruleConflictLocalizedmsg = wemo.items['FirmwareVerCheckText_OFFSET'];
                                                        $("#FirmwareVerCheckText").html(ruleConflictLocalizedmsg);
                                                        setTimeout(function() {
                                                                $("#fw_ver_check").popup("open");
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

                    if (maker_rule.ruleObj.When.RuleDuration == undefined) {
                        var StartTimeAM = 'false';
                        var EndTimeAM = 'false';

                        wemoUtil.infoLog(TAG, "convertMillisecondsToAMPM startTime :: " +  maker_rule.ruleObj.When.StartTime + " :: endtime :: " +  maker_rule.ruleObj.When.EndTime);

                        StartTimeAM = (wemoUtil
                            .convertMillisecondsToAMPM(
                                maker_rule.ruleObj.When.StartTime)
                            .lastIndexOf("am") != -1) ? 'true' : 'false';
                        EndTimeAM = (wemoUtil
                            .convertMillisecondsToAMPM(
                                maker_rule.ruleObj.When.EndTime)
                            .lastIndexOf("am") != -1) ? 'true' : 'false';
                        if (maker_rule.ruleObj.When.EndTime < maker_rule.ruleObj.When.StartTime) {
                            if (StartTimeAM == EndTimeAM) {
                                maker_rule.ruleObj.When.RuleDuration = timestamp.MAX_HOUR - (parseInt(maker_rule.ruleObj.When.StartTime) - parseInt(maker_rule.ruleObj.When.EndTime));
                            } else {
                                maker_rule.ruleObj.When.RuleDuration = (timestamp.MAX_HOUR - (parseInt(maker_rule.ruleObj.When.StartTime))) + parseInt(maker_rule.ruleObj.When.EndTime);
                            }
                        } else {
                            maker_rule.ruleObj.When.RuleDuration = maker_rule.ruleObj.When.EndTime - maker_rule.ruleObj.When.StartTime;
                        }
                    }

                    if (Object.keys(maker_rule.ruleObj.Devices).length == 0) {
                        $('body').on('touchmove', function(e) {
                            e.preventDefault();
                        });
                        $('#device_not_selected').popup("open");
                        return;
                    }
                    if (Object.keys(maker_rule.ruleObj.Sensors).length == 0) {
                        $('body').on('touchmove', function(e) {
                            e.preventDefault();
                        });
                        $('#sensor_not_selected').popup("open");
                        return;
                    } else {
                        console.log('maker sensor devices length is not zero');
                        for (key in maker_rule.ruleObj.Sensors) {
                            console.log("Maker Sensor - UDN Firmware Version - " + key + "  ::  " + maker_rule.ruleObj.Sensors[key]);
                            maker_rule.ruleObj.When.isMakerFirmWareSupported = wemoUtil.getMakerFirmwareVersion(wemoUtil.getOriginalMakerUDN(key), makerDevices);
                            console.log("Maker Sensor - isMakerFirmWareSupported::  " + maker_rule.ruleObj.When.isMakerFirmWareSupported);
                            if (maker_rule.ruleObj.When.isMakerFirmWareSupported == "false")
                                break;

                        }
                    }


                    // -------------------SRSS--------------------
                    // Plug-in Call To Get Firmware Version SRSS
                    if (maker_rule.ruleObj.When.StartSRSS != undefined || maker_rule.ruleObj.When.EndSRSS != undefined) {
                        if (Object.keys(maker_rule.ruleObj.Devices).length > 0) {
                            for (key in maker_rule.ruleObj.Devices) {
                                console
                                    .log("SRSS - UDN Firmware Version - " + key + "  ::  " + maker_rule.ruleObj.Devices[key]);
                                maker_rule.ruleObj.When.isFirmWareSupported = wemoUtil
                                    .getFirmwareVersionSRSS(key);
                                // alert("Save - isFirmWareSupported: 1
                                // "+maker_rule.ruleObj.When.isFirmWareSupported);
                            }
                            // alert("Save - isFirmWareSupported: 2
                            // "+maker_rule.ruleObj.When.isFirmWareSupported);
                        }
                    }
                    // -------------------SRSS--------------------

                    wemoUtil.setJSONObjectToSessionStorage(
                        sessionStore.RULE_NEW, maker_rule.ruleObj);
                    console.log("Saving Maker Sensor Rule");
                    if (maker_rule.ruleObj.When.isFirmWareSupported != undefined && maker_rule.ruleObj.When.isFirmWareSupported === "false") {
                        $("#sunrise_firmware_upgrade").popup("open");
                    } else if (maker_rule.ruleObj.When.isMakerFirmWareSupported != undefined && maker_rule.ruleObj.When.isMakerFirmWareSupported == "false") {
                        $("#maker_sensor_firmware_upgrade").popup("open");
                    } else {
                        var selectedDevice = window.sessionStorage
                            .getItem(sessionStore.CURRENT_DEVICE);
                        if (selectedDevice != null) {
                            window.sessionStorage
                                .removeItem(sessionStore.CURRENT_DEVICE);
                        }
                        saveNewRule_RULES_RULEDEVICES(maker_rule.ruleObj.RuleType,maker_rule.ruleObj);
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
        });

        $('#maker_rule_cancel_btn').on(
            "pointerdown",
            function() {
                var selectedDevice = window.sessionStorage
                    .getItem(sessionStore.CURRENT_DEVICE);
                if (selectedDevice != null) {
                    window.sessionStorage
                        .removeItem(sessionStore.CURRENT_DEVICE);
                    window.sessionStorage.removeItem(sessionStore.isEdit);
                }
                if (parseInt(JSON.parse(window.sessionStorage
                    .getItem(sessionStore.RULES_DATA)).length) > 0) {
                    wemoUtil.loadUrl(filePath.ENABLED_RULES);
                } else {
                    wemoUtil.loadUrl(filePath.CREATE_RULE);
                }
            });

        $("#identicalOnOffTimeOkBtn").on("tap", function() {
            $("#identicalOnOffTime").popup("close");
        });

        $("#sunrise_firmware_upgrade_updatenow")
            .on(
                "click",
                function() {
                    var pendingFirmware = "pendingFirmware";
                    wemoUtil.setJSONObjectToSessionStorage(
                        sessionStore.PENDING_FIRMWARE,
                        pendingFirmware);

                    $("#sunrise_firmware_upgrade").popup("close");
                    maker_rule.ruleObj.RuleType = sessionStore.MAKER_MOTION_CONTROLLED;
                    if (Object.keys(maker_rule.ruleObj.Devices).length > 0) {
                        for (key in maker_rule.ruleObj.Devices) {
                            maker_rule.ruleObj.When.isFirmWareSupported = wemoUtil
                                .getFirmwareVersionSRSS(key);
                            wemoUtil.setJSONObjectToSessionStorage(
                                sessionStore.RULE_NEW,
                                maker_rule.ruleObj);
                        }
                    }
                    var selectedDevice = window.sessionStorage
                        .getItem(sessionStore.CURRENT_DEVICE);
                    if (selectedDevice != null) {
                        window.sessionStorage
                            .removeItem(sessionStore.CURRENT_DEVICE);
                    }
                    saveNewRule_RULES_RULEDEVICES(
                        maker_rule.ruleObj.RuleType,
                        maker_rule.ruleObj);
                });

        $('#sunrise_firmware_upgrade_later')
            .on(
                'click',
                function() {
                    // alert("Save Rule");
                    $("#sunrise_firmware_upgrade").popup('close');
                    maker_rule.ruleObj.RuleType = sessionStore.MAKER_MOTION_CONTROLLED;
                    if (Object.keys(maker_rule.ruleObj.Devices).length > 0) {
                        for (key in maker_rule.ruleObj.Devices) {
                            maker_rule.ruleObj.When.isFirmWareSupported = wemoUtil
                                .getFirmwareVersionSRSS(key);
                            wemoUtil.setJSONObjectToSessionStorage(
                                sessionStore.RULE_NEW,
                                maker_rule.ruleObj);
                        }
                    }
                    var selectedDevice = window.sessionStorage
                        .getItem(sessionStore.CURRENT_DEVICE);
                    if (selectedDevice != null) {
                        window.sessionStorage
                            .removeItem(sessionStore.CURRENT_DEVICE);
                    }
                    saveNewRule_RULES_RULEDEVICES(
                        maker_rule.ruleObj.RuleType,
                        maker_rule.ruleObj);
                });

        $("#maker_sensor_firmware_upgrade_updatenow")
            .on("click", function() {
                var pendingFirmware = "pendingFirmware";
                wemoUtil.setJSONObjectToSessionStorage(
                    sessionStore.PENDING_FIRMWARE,
                    pendingFirmware);

                $("#maker_sensor_firmware_upgrade").popup("close");
                maker_rule.ruleObj.RuleType = sessionStore.MAKER_MOTION_CONTROLLED;
                var selectedDevice = window.sessionStorage
                    .getItem(sessionStore.CURRENT_DEVICE);
                if (selectedDevice != null) {
                    window.sessionStorage
                        .removeItem(sessionStore.CURRENT_DEVICE);
                }
                saveNewRule_RULES_RULEDEVICES(
                    maker_rule.ruleObj.RuleType,
                    maker_rule.ruleObj);
            });

        $('#maker_sensor_firmware_upgrade_later')
            .on(
                'click',
                function() {
                    // alert("Save Rule");
                    $("#maker_sensor_firmware_upgrade").popup('close');
                    var selectedDevice = window.sessionStorage
                        .getItem(sessionStore.CURRENT_DEVICE);
                    if (selectedDevice != null) {
                        window.sessionStorage
                            .removeItem(sessionStore.CURRENT_DEVICE);
                    }
                    saveNewRule_RULES_RULEDEVICES(
                        maker_rule.ruleObj.RuleType,
                        maker_rule.ruleObj);
                });
    },

    updateRuleDevices: function() {
        console.log("Updating rule devices...");
        console.log(JSON.stringify(maker_rule.ruleObj));

        maker_rule.ruleObj.Devices = {};

        for (var udn in deviceList.getArray()) {
            console.log(JSON.stringify(deviceList.getDevice(udn)));
            if (deviceList.getDevice(udn) != undefined && deviceList.getDevice(udn) != '') {
                if (deviceList.getDevice(udn).state != undefined && deviceList.getDevice(udn).state != '') {
                    maker_rule.ruleObj.Devices[udn] = {};

                    if (deviceList.getDevice(udn).state == 'on') {
                        maker_rule.ruleObj.Devices[udn].StartAction = 1;
                        deviceList.setActive(udn, 'on', deviceList
                            .getDevice(udn).duration);
                        if (wemoUtil.isMakerDevice(udn) && deviceList.getDevice(udn).switchMode == "1") {
                            maker_rule.ruleObj.Devices[udn].EndAction = -1;
                        }
                        if (deviceList.getDevice(udn).duration != '0' && deviceList.getDevice(udn).duration != '1') {
                            maker_rule.ruleObj.Devices[udn].SensorDuration = wemoUtil
                                .convertTimeToMilliseconds(deviceList
                                    .getDevice(udn).duration);
                            maker_rule.ruleObj.Devices[udn].EndAction = 0;
                        } else if (deviceList.getDevice(udn).duration == '1') {
                            maker_rule.ruleObj.Devices[udn].SensorDuration = deviceList.getDevice(udn).duration;
                            maker_rule.ruleObj.Devices[udn].EndAction = 0;
                        } else {
                            maker_rule.ruleObj.Devices[udn].SensorDuration = deviceList.getDevice(udn).duration;
                            maker_rule.ruleObj.Devices[udn].EndAction = -1;
                        }
                    } else if (deviceList.getDevice(udn).state == 'off') {
                        maker_rule.ruleObj.Devices[udn].SensorDuration = 0;
                        maker_rule.ruleObj.Devices[udn].StartAction = 0;
                        maker_rule.ruleObj.Devices[udn].EndAction = -1;
                        deviceList.setActive(udn, 'off');
                    }

                    maker_rule.ruleObj.Devices[udn].FName = deviceList
                        .getDevice(udn).name;
                    console.log(udn + ': ' + JSON.stringify(maker_rule.ruleObj.Devices[udn]));
                }
            }
        }

        console.log(JSON.stringify(maker_rule.ruleObj));
    },

    enableWhatHappens: function(networktype, remoteEnable) {
        console.log("success creating the table structures");
        if (networktype == networkType.HOME_NETWORK || networktype == null) {
            console.log("Local Mode...");

            deviceTabPlugin
                .execute(
                    function(params) {
                        if (params.length == Object
                            .keys(maker_rule.ruleObj.Devices).length) {
                            $(
                                '#maker_rule_what_happens .what_happens_select_switches')
                                .hide();
                        }
                    }, function(err) {
                        console.log("Error getting maker sensors list")
                    },
                    // TODO:
                    actions.SELECT_SWITCHES, []);

        } else if (networktype == networkType.REMOTE_WIFI || networktype == networkType.REMOTE_MOBILE) {
            if (remoteEnable) {
                // TODO: SWITCH_DATA
                var arraySwitchObjects = wemoUtil
                    .getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);

                // alert("Switch count : "+arraySensorObjects.length);

                if (arraySwitchObjects.length == Object
                    .keys(maker_rule.ruleObj.Devices).length) {
                    $('#maker_rule_what_happens .what_happens_select_switches')
                        .hide();
                }

            } else {
                navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {
                    loadUrlTimeoutValue: 60000
                });
            }
        }
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
        document.addEventListener('online', maker_rule.onOnline, false);
        document.addEventListener('offline', maker_rule.onOffline, false);
        document.addEventListener("backbutton", maker_rule.onBackPress, false);
        document.addEventListener("pause", maker_rule.onPause, false);
        document.addEventListener("resume", maker_rule.onResume, false);
    },

    onOffline: function() {
        console.log(TAG + "offLine");
    },

    onOnline: function() {
        console.log(TAG + "onLine");
    },

    onBackPress: function() {
        var selectedDevice = window.sessionStorage
            .getItem(sessionStore.CURRENT_DEVICE);
        if (selectedDevice != null) {
            window.sessionStorage.removeItem(sessionStore.CURRENT_DEVICE);
        }
        var selectedSensor = window.sessionStorage
            .getItem(sessionStore.CURRENT_SENSOR_NAME);
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

            $(".ui-loader")
                .css({
                    background: "url('../img/Actions-dialog-ok-apply-icon.png') no-repeat scroll 119px center #000000",
                    height: "44px"
                });

        }
    },

    showPopup: function() {
        // Rule conflict Popup
        $("#rule_conflict_learn_more_btn").on("tap", function() {
            alert("Your Data has Saved");
            $("#rule_conflict").popup("close");
        });

        $("#rule_conflict_ok_btn").on("tap", function() {
            alert("Your Data has Saved");
            $("#rule_conflict").popup("close");
        });

        // Rules Can not be saved Popup
        $("#rule_can_not_save_ok").on("tap", function() {
            alert("Rules Can't be saved");
            $("#rule_can_not_save").popup("close");
        });

        // Rule Duplicate Popup
        $("#rule_duplicate_learn_more_btn").on("tap", function() {
            window.open(wemo.items['Help_Rules_Alert_Url'], "_system");
            $("#rule_duplicate").popup("close");
        });

        $("#rule_duplicate_ok_btn").on("tap", function() {
            alert("Rule Duplicate");
            $("#rule_duplicate").popup("close");
        });

        // sunrise firmware upgrade Popup
        $("#sunrise_firmware_upgrade_later").on("tap", function() {
            $("#sunrise_firmware_upgrade").popup("close");
        });

        $("#sunrise_firmware_upgrade_updatenow").on("tap", function() {
            $("#sunrise_firmware_upgrade").popup("close");
        });

    },

    buildSensorList: function() {
        console.log("Build maker sensors list");


        var htmlList = "";


        if (isRemoteEnabled) {
            var params = wemoUtil
                .getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA);
            if (params.length > 0) {
                $
                    .each(
                        params,
                        function(inx) {
                            console
                                .log("Sensor UDN: " + params[inx].udn + ", name: " + params[inx].friendlyName + " ,state: " + params[inx].state);

                            if (params[inx].SensorPresent == "1") {
                                var isSensorStateOpen = false,
                                    state = '';

                                for (var dev in maker_rule.ruleObj.Sensors) {
                                    if (wemoUtil.getMakerSensorUDN(dev) == wemoUtil.getMakerSensorUDN(params[inx].udn)) {
                                        if (maker_rule.ruleObj.Sensors[dev]['state'] == "1") {
                                            state = wemo.items['SensorOpen'];
                                            isSensorStateOpen = true;
                                        } else {
                                            state = wemo.items['SensorClosed'];
                                        }
                                    }
                                }
                                // Drawer Implementation
                                htmlList = '<div class="select_sensors_list notify_rule_item" data-udn="' + params[inx].udn + '">' + '<div class="display_table">' + '<span class="display_cell padding_left_16px">' + '<span class="fname">' + params[inx].friendlyName + '</span>' + '<span class="action_subHeader">' + state + '</span></span></div><span class="check_mark"></span></div>' + '<div class="drawer" id="' + params[inx].udn + '">' + '<div class="drawer_li open"><span>' + wemo.items['SensorOpen'] + '</span></div>' + '<div class="drawer_li close"><span>' + wemo.items['SensorClosed'] + '</span></div>' + '</div>';
                                $('#sensor_list').append($(htmlList));
                                if (state != '') {
                                    $("#sensors_rule_if #sensor_list").children('div [data-udn="' + params[inx].udn + '"] ').find('.check_mark').show();
                                    if (isSensorStateOpen) {
                                        $('div [id="' + params[inx].udn + '"]').find('.open').addClass('div_bg_green');
                                    } else {
                                        $('div [id="' + params[inx].udn + '"]').find('.close').addClass('div_bg_green');
                                    }
                                }
                            }

                        });
            }
        } else {

            deviceTabPlugin
                .execute(
                    function(params) {

                        if (params.length > 0) {
                            $
                                .each(
                                    params,
                                    function(inx) {
                                        console
                                            .log("Sensor UDN: " + params[inx].udn + ", name: " + params[inx].friendlyName + " ,state: " + params[inx].state);

                                        if (params[inx].SensorPresent == "1") {
                                            var isSensorStateOpen = false,
                                                state = '';

                                            for (var dev in maker_rule.ruleObj.Sensors) {
                                                if (wemoUtil.getMakerSensorUDN(dev) == wemoUtil.getMakerSensorUDN(params[inx].udn)) {
                                                    if (maker_rule.ruleObj.Sensors[dev]['state'] == "1") {
                                                        state = wemo.items['SensorOpen'];
                                                        isSensorStateOpen = true;
                                                    } else {
                                                        state = wemo.items['SensorClosed'];
                                                    }
                                                }
                                            }
                                            // Drawer Implementation
                                            htmlList = '<div class="select_sensors_list notify_rule_item" data-udn="' + params[inx].udn + '">' + '<div class="display_table">' + '<span class="display_cell padding_left_16px">' + '<span class="fname">' + params[inx].friendlyName + '</span>' + '<span class="action_subHeader">' + state + '</span></span></div><span class="check_mark"></span></div>' + '<div class="drawer" id="' + params[inx].udn + '">' + '<div class="drawer_li open"><span>' + wemo.items['SensorOpen'] + '</span></div>' + '<div class="drawer_li close"><span>' + wemo.items['SensorClosed'] + '</span></div>' + '</div>';
                                            $('#sensor_list').append($(htmlList));
                                            if (state != '') {
                                                $("#sensors_rule_if #sensor_list").children('div [data-udn="' + params[inx].udn + '"] ').find('.check_mark').show();
                                                if (isSensorStateOpen) {
                                                    $('div [id="' + params[inx].udn + '"]').find('.open').addClass('div_bg_green');
                                                } else {
                                                    $('div [id="' + params[inx].udn + '"]').find('.close').addClass('div_bg_green');
                                                }
                                            }
                                        }

                                    });

                        }
                    }, function(err) {
                        alert("No Maker sensors detected");
                    },
                    actions.SELECT_MAKER, []);
        }
        
        $("#sensors_rule_if #sensor_list").on("tap", '.select_sensors_list .check_mark', function(e) {
            var data_udn = $.trim($(this).parent().attr('data-udn'));
            maker_rule.deselectSensor(data_udn);
            maker_rule.updateRuleDevices();
            e.preventDefault();
        });

        
        $('#sensor_list').on('tap', '.open', function(e) {

            var udn = $(this).parent().attr('id');
            if ($(this).hasClass('div_bg_green')) {
                maker_rule.deselectSensor(udn);
            } else {
                maker_rule.selectSensor('on', udn);
            }

            $(this).parent().slideToggle('fast');
            e.preventDefault();
        });

        $('#sensor_list').on('tap', '.close', function(e) {
            var udn = $(this).parent().attr('id');
            if ($(this).hasClass('div_bg_green')) {
                maker_rule.deselectSensor(udn);
            } else {
                maker_rule.selectSensor('off', udn);
            }

            $(this).parent().slideToggle('fast');
            e.preventDefault();
        });
    }

};
