/*
 nest_rule.js

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

var TAG = "nest_rule.js: ";
var cur_drawer;
var UP_TF_IS24 = false; //UP-user preferences, TF-time format

$(document).bind('pageinit', function () {
    var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));
    nest_rule.initialize();
});


var nest_rule = {
    deviceList: {},
    ruleObj: {},
    nestDevicesObj: {},

    initialize: function () {
        console.log(TAG + "initialize");
        var isEdit = window.sessionStorage.getItem(sessionStore.isEdit);
        if (isEdit == sessionStore.RULE_NEW) {
            $('.sub_header > h3').html(wemo.items['NewRulenestRuleTitle']);
        } else {
            $('.sub_header > h3').html(wemo.items['EditRulenestRuleTitle']);
        }
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    onDeviceReady: function () {
        var self = this;
        UP_TF_IS24 = wemoUtil.userPreferences.getTimeFormat();

        if (!isRemoteEnabled) {
            $.when(wemoUtil.getDevices(actions.SELECT_NEST_DEVICES),
                wemoUtil.getDevices(actions.SELECT_SWITCHES),
                wemoUtil.getDevices(actions.SELECT_INSIGHTS),
                wemoUtil.getDevices(actions.SELECT_DIMMERS),
                wemoUtil.getDevices(actions.SELECT_MAKER))
                .then(function () {

                    nest_rule.afterOnDeviceReady();

                }).fail(function () {
                    throw ('ERROR');
                });
        } else {
            nest_rule.afterOnDeviceReady();
        }
    },
    afterOnDeviceReady: function () {
        $.getScript('../js/classes/deviceList.js', function () {
            $.getScript('../js/vendor/date.js', function () {
                nest_rule.methodMain();
            });
        });
    },

    loadDevices: function () {
        console.log(JSON.stringify(nest_rule.ruleObj));
        var devices = [];


        if (isRemoteEnabled) {
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA).concat(devices);
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DIMMER_DATA).concat(devices);
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA).concat(devices);

        } else {

            devices = wemoUtil.getDevices(actions.SELECT_SWITCHES);
            devices = wemoUtil.getDevices(actions.SELECT_INSIGHTS).concat(devices);
            devices = wemoUtil.getDevices(actions.SELECT_DIMMERS).concat(devices);
            devices = wemoUtil.getDevices(actions.SELECT_MAKER).concat(devices);

        }

        if (devices != null && devices.length > 0) {
            $.each(devices, function (inx) {
                if (wemoUtil.isMakerDevice(devices[inx].udn)) {
                    deviceList.addMakerDevice(devices[inx].udn, devices[inx].friendlyName, devices[inx].SwitchMode, devices[inx].ProductName);
                } else {
                    deviceList.addDevice(devices[inx].udn, devices[inx].friendlyName, devices[inx].ProductName);
                }

                console.log(JSON.stringify(nest_rule.ruleObj.Devices));
                for (var dev in nest_rule.ruleObj.Devices) {
                    if (wemoUtil.isMakerDevice(dev)) {
                        if (wemoUtil.getMakerSwithUDN(dev) == wemoUtil.getMakerSwithUDN(devices[inx].udn)) {
                            if (nest_rule.ruleObj.Devices[dev].StartAction == 0) {
                                deviceList.setActive(devices[inx].udn, 'off');
                            } else if (nest_rule.ruleObj.Devices[dev].StartAction == 1) {
                                if ((nest_rule.ruleObj.Devices[dev].SensorDuration != 0) && (nest_rule.ruleObj.Devices[dev].SensorDuration != 1)) {
                                    var time = (new Date).clearTime()
                                        .addSeconds(nest_rule.ruleObj.Devices[dev].SensorDuration)
                                        .toString('HH:mm');
                                    deviceList.setActive(devices[inx].udn, 'on', time);
                                } else {
                                    deviceList.setActive(devices[inx].udn, 'on', nest_rule.ruleObj.Devices[dev].SensorDuration);
                                }
                            }
                        }
                    } else {
                        console.log(nest_rule.ruleObj.Devices[dev]);
                        if (dev == devices[inx].udn) {
                            if (nest_rule.ruleObj.Devices[dev].StartAction == 0) {
                                deviceList.setActive(devices[inx].udn, 'off');
                            } else if (nest_rule.ruleObj.Devices[dev].StartAction == 1) {
                                if ((nest_rule.ruleObj.Devices[dev].SensorDuration != 0) && (nest_rule.ruleObj.Devices[dev].SensorDuration != 1)) {
                                    var time = (new Date).clearTime()
                                        .addSeconds(nest_rule.ruleObj.Devices[dev].SensorDuration)
                                        .toString('HH:mm');
                                    deviceList.setActive(devices[inx].udn, 'on', time);
                                } else {
                                    deviceList.setActive(devices[inx].udn, 'on', nest_rule.ruleObj.Devices[dev].SensorDuration);
                                }
                            }
                        }
                    }
                }
            });
        }


    },

    formatOnWithMotionStr: function (duration) {
        console.log('Duration: ' + duration);
        switch (duration.toString()) {
            case "0":
            {
                return wemo.items['On'];
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


    renderDeviceList: function () {
        for (var udn in deviceList.getArray()) {
            var state = '',
                html = '',
                isMomentarySwitch = false;

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
                        state = nest_rule.formatOnWithMotionStr(deviceList.getDevice(udn).duration);
                } else if (deviceList.getDevice(udn).state == "off") {
                    state = wemo.items['Off'];
                }
            }

            html = '<div class="select_switches_list more_li_clone more_li_clone_top" data-udn="' + udn + '"><div class="display_table"><span class="display_cell padding_left_16px"><span class="fname">' + deviceList.getDevice(udn).name + '</span><span class="action_subHeader">' + state + '</span></span></div><span class="check_mark"></span></div><div class="drawer" id="' + udn + '"><div class="drawer_li on"><span>' + wemo.items['On'] + '</span></div><div class="drawer_li off"><span>' + wemo.items['Off'] + '</span></div></div>';

            console.log("nest " + html);
            $('#nest_container #device_list').append($(html));

            if (state != '') {
                $('div [data-udn="' + udn + '"] ').find('.check_mark').show();
                if (deviceList.getDevice(udn).state == 'on') {
                    $('div [id="' + udn + '"]').find('.on span').empty().html(nest_rule.formatOnWithMotionStr(deviceList.getDevice(udn).duration));
                    $('div [id="' + udn + '"]').find('.on').addClass('div_bg_green');
                } else if (deviceList.getDevice(udn).state == "off") {
                    $('div [id="' + udn + '"]').find('.off span').empty().html(wemo.items['Off']);
                    $('div [id="' + udn + '"]').find('.off').addClass('div_bg_green');
                }
            }
        }

        $('div .on').on('tap', function (e) {
            var cur_drawer = $(this).parent();
            var udn = cur_drawer.attr('id');

            if ($(this).hasClass('div_bg_green')) {
                nest_rule.deselectDevice(udn);
                cur_drawer.slideUp();
                nest_rule.updateRuleDevices();
            } else {
                nest_rule.selectDevice('on', 0, udn);
                cur_drawer.slideUp();
                nest_rule.updateRuleDevices();
                //$('.overlay').attr('style', 'display: table;');
                //$('.picker_container').attr('style', 'display: table-cell;');
                //
                //$('.picker').attr("data-udn", udn);
                //console.log("data-udn at picker " + $('.picker').attr("data-udn"));
                //
                //$("#cnl_after_picker_btn").on("tap", function(event) {
                //    event.stopPropagation();
                //    $('.picker').attr("data-udn", "");
                //
                //    $('.overlay').hide();
                //    $('.picker_container').hide();
                //    event.preventDefault();
                //});
                //
                //$("#set_after_picker_btn").on("tap", function(event) {
                //    event.stopPropagation();
                //    var val = $('input[name=rad_after_motion]:checked').val();
                //    nest_rule.selectDevice('on', val, $('.picker').attr("data-udn"));
                //
                //    $('.overlay').hide();
                //    $('.picker_container').hide();
                //
                //    cur_drawer.slideUp();
                //    nest_rule.updateRuleDevices();
                //    event.preventDefault();
                //});
            }

            e.preventDefault();
        });

        $('div .off').on('tap', function (e) {
            var udn = $(this).parent().attr('id');
            if ($(this).hasClass('div_bg_green')) {
                nest_rule.deselectDevice(udn);
            } else {
                nest_rule.selectDevice('off', 0, udn);
            }

            $(this).parent().slideToggle('fast');
            nest_rule.updateRuleDevices();
            e.preventDefault();
        });

        $("#device_list").find('.check_mark').on('tap', function () {
            var udn = $(this).closest('.select_switches_list').attr('data-udn');
            var drawer = $('div [id="' + udn + '"]');
            if (drawer.is(":visible")) drawer.slideToggle("slow");
            nest_rule.deselectDevice(udn);
            nest_rule.updateRuleDevices();
        });
    },

    deselectDevice: function (udn) {
        deviceIsnest = udn.indexOf("nest") == -1 ? false : true;

        if (deviceIsnest) {
            $('div [data-udn="' + udn + '"]').find('.check_mark').hide();
            $('div [data-udn="' + udn + '"]').find('.action_subHeader').empty();
        } else {
            $('div [id="' + udn + '"]').find('.on').removeClass('div_bg_green');
            $('div [id="' + udn + '"]').find('.off').removeClass('div_bg_green');
            $('div [data-udn="' + udn + '"]').find('.check_mark').hide();
            $('div [data-udn="' + udn + '"]').find('.action_subHeader').empty();
            $('div [id="' + udn + '"]').find('.on span').html(wemo.items['On']);

            deviceList.unsetActive(udn);
        }
    },

    selectDevice: function (type, duration, udn) {

        $('div [id="' + udn + '"]').find('.on').removeClass('div_bg_green');
        $('div [id="' + udn + '"]').find('.off').removeClass('div_bg_green');

        $('div [data-udn="' + udn + '"] ').find('.check_mark').show();

        if (type == 'on') {
            $('div [id="' + udn + '"]').find('.on').addClass('div_bg_green');
            $('div [data-udn="' + udn + '"]').find('.action_subHeader').html(wemo.items['On']);
        } else if (type == 'off') {
            $('div [id="' + udn + '"]').find('.off').addClass('div_bg_green');
            $('div [data-udn="' + udn + '"]').find('.action_subHeader').html(wemo.items['Off']);
        }

        deviceList.setActive(udn, type, duration);
    },

    methodMain: function () {
        var networktype = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_NETWORKTYPE);
        console.log(TAG + "onDeviceReady");
        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
        wemoUtil.setTimeFormat();
        nest_rule.bindEvents();
        //nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);

        nest_rule.ruleObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
        nest_rule.ruleObj.RuleType = sessionStore.EVENT_CONTROLLED;
        nest_rule.loadDevices();
        nest_rule.renderDeviceList();
        nest_rule.buildnestList();

        $("#device_not_selected_ok").on("tap", function (e) {
            $("#device_not_selected").popup('close');
            $('body').off('touchmove');
            e.preventDefault();
        });

        $("#nest_not_selected_ok").on("tap", function (e) {
            $("#nest_not_selected").popup('close');
            $('body').off('touchmove');
            e.preventDefault();
        });
        //No nests Detected
        $("#nonestsDetectedOkBtn").on("tap", function () {
            $("#nonestsDetected").popup("close");
            $("#nonestsDetectedHeader").html("");
            $("#nonestsDetectedText").html("");
        });

        //nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);

        //To return back to home page: device list tab
        $(".wemo_logo").on("tap", function (e) {
            if (e.target.nodeName != "IMG") {
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }
        });
        if (nest_rule.ruleObj.When.EndTime == 0) nest_rule.ruleObj.When.EndTime = timestamp.MIDNIGHT_END_TIME;
        else if (nest_rule.ruleObj.When.EndTime == undefined)
            nest_rule.ruleObj.When.EndTime = parseInt(nest_rule.ruleObj.When.StartTime, 10) + parseInt(nest_rule.ruleObj.When.RuleDuration, 10);
        // **********  display time values
        if ((nest_rule.ruleObj.When.StartTime == undefined || nest_rule.ruleObj.When.EndTime == undefined)) {
            nest_rule.ruleObj.When.StartTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestHalfHour());
            nest_rule.ruleObj.When.EndTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestOneAndHalfHour());
            var tempDisSelectday = wemo.items['Daily'];

            //alert("nest_rule.ruleObj.When.EndTime "+nest_rule.ruleObj.When.EndTime);
            $("#nest_rule_when .select_time").text(wemoUtil.convertMillisecondsToTF(nest_rule.ruleObj.When.StartTime, UP_TF_IS24) + " - " + wemoUtil.convertMillisecondsToTF(nest_rule.ruleObj.When.EndTime, UP_TF_IS24));
            $("#nest_rule_when .select_day").html(tempDisSelectday);
            //nest_rule.ruleObj.SelectedDayOrRange = "Daily";
        } else {
            //var EndTime=parseInt(nest_rule.ruleObj.When.EndTime)
            if (nest_rule.ruleObj.When.StartSRSS != undefined && nest_rule.ruleObj.When.EndSRSS != undefined) {

                if (nest_rule.ruleObj.When.onSRSS_Title != undefined) {
                    var tempStartSRSS = nest_rule.ruleObj.When.onSRSS_Title;
                } else {
                    if (nest_rule.ruleObj.When.StartSRSS == "Sunrise") {
                        var tempStartSRSS = wemo.items['SunRise'];
                    } else if (nest_rule.ruleObj.When.StartSRSS == "Sunset") {
                        var tempStartSRSS = wemo.items['SunSet'];
                    } else {
                        var tempStartSRSS = nest_rule.ruleObj.When.StartSRSS;
                    }
                }

                if (nest_rule.ruleObj.When.offSRSS_Title != undefined) {
                    var tempEndSRSS = nest_rule.ruleObj.When.offSRSS_Title;
                } else {
                    if (nest_rule.ruleObj.When.EndSRSS == "Sunrise") {
                        var tempEndSRSS = wemo.items['SunRise'];
                    } else if (nest_rule.ruleObj.When.EndSRSS == "Sunset") {
                        var tempEndSRSS = wemo.items['SunSet'];
                    } else {
                        var tempEndSRSS = nest_rule.ruleObj.When.EndSRSS;
                    }
                }

                $("#nest_rule_when .select_time").text(tempStartSRSS + " - " + tempEndSRSS);

            } else if (nest_rule.ruleObj.When.StartSRSS == undefined && nest_rule.ruleObj.When.EndSRSS != undefined) {

                if (nest_rule.ruleObj.When.offSRSS_Title != undefined) {
                    var tempEndSRSS = nest_rule.ruleObj.When.offSRSS_Title;
                } else {
                    if (nest_rule.ruleObj.When.EndSRSS == "Sunrise") {
                        var tempEndSRSS = wemo.items['SunRise'];
                    } else if (nest_rule.ruleObj.When.EndSRSS == "Sunset") {
                        var tempEndSRSS = wemo.items['SunSet'];
                    } else {
                        var tempEndSRSS = nest_rule.ruleObj.When.EndSRSS;
                    }
                }

                $("#nest_rule_when .select_time").text(wemoUtil.convertMillisecondsToTF(nest_rule.ruleObj.When.StartTime, UP_TF_IS24) + " - " + tempEndSRSS);

            } else if (nest_rule.ruleObj.When.StartSRSS != undefined && nest_rule.ruleObj.When.EndSRSS == undefined) {

                if (nest_rule.ruleObj.When.onSRSS_Title != undefined) {
                    var tempStartSRSS = nest_rule.ruleObj.When.onSRSS_Title;
                } else {
                    if (nest_rule.ruleObj.When.StartSRSS == "Sunrise") {
                        var tempStartSRSS = wemo.items['SunRise'];
                    } else if (nest_rule.ruleObj.When.StartSRSS == "Sunset") {
                        var tempStartSRSS = wemo.items['SunSet'];
                    } else {
                        var tempStartSRSS = nest_rule.ruleObj.When.StartSRSS;
                    }
                }

                $("#nest_rule_when .select_time").text(tempStartSRSS + " - " + wemoUtil.convertMillisecondsToTF(nest_rule.ruleObj.When.EndTime, UP_TF_IS24));

            } else if (nest_rule.ruleObj.When.StartSRSS == undefined && nest_rule.ruleObj.When.EndSRSS == undefined) {
                if (nest_rule.ruleObj.When.StartTime == sessionStore.ALLDAY_STARTTIME && nest_rule.ruleObj.When.EndTime == sessionStore.ALLDAY_ENDTIME) {
                    $("#nest_rule_when .select_time").text(sessionStore.nest_ALLDAY);
                } else {
                    $("#nest_rule_when .select_time").text(wemoUtil.convertMillisecondsToTF(nest_rule.ruleObj.When.StartTime, UP_TF_IS24) + " - " + wemoUtil.convertMillisecondsToTF(nest_rule.ruleObj.When.EndTime, UP_TF_IS24));
                }
            }

        }

        var tempSelectedDayOrRange = "";
        tempSelectedDayOrRange = wemoUtil.convertSelectedDayOrRangeToString(nest_rule.ruleObj);

        $("#nest_rule_when .select_day").html(tempSelectedDayOrRange);
        //console.log("Times Home :: "+"Start :: "+nest_rule.ruleObj.When.StartTime+" END  ::"+nest_rule.ruleObj.When.EndTime+" Duration :: "+nest_rule.ruleObj.When.RuleDuration);

        if (typeof(nest_rule.ruleObj.RuleName) == "undefined") {
            nest_rule.ruleObj.RuleName = wemo.items['NewNestAwayRule'];
        }
        //$("#nest_rule_rule_name #rule_name").html(nest_rule.ruleObj.RuleName);
        $("#rule_name .rule_name_container").html(nest_rule.ruleObj.RuleName);

        // wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,nest_rule.ruleObj);
        //nest_rule Page Start
        $("#nest_rule_what_happens").on("tap", function () {
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("nest_rule"));
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, nest_rule.ruleObj);
            wemoUtil.loadUrl(filePath.SELECT_SWITCHES);
        });

        $("#nest_rule_selected_device").find("li").on("tap", function () {

            window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE, $(this).attr("data-udn"));
            window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE_NAME, $(this).attr("data-fName"));
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("nest_rule"));
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, nest_rule.ruleObj);
            wemoUtil.loadUrl(filePath.SENSORS_WHAT_HAPPENS);
        });


        $("#nest_rule_if").on("tap", '.more_li_clone', function (e) {
            e.preventDefault();

            var self = this,
                udn = $(this).attr('data-udn'),
                drawer = $('div [id="' + udn + '"]'),
                drawerOption = drawer.find(".drawer_li");

            $("#nest_rule_if .action_subHeader").text("");

            if ($(this).find('.check_mark').css('display') == 'none' || $(this).find('.check_mark').css('display') == undefined) {
                $("#nest_rule_if .check_mark").hide();
                $("#nest_rule_if .drawer").hide();
                drawer.slideDown("fast");

                drawerOption.on('tap', function(){
                    $(self).find('.check_mark').show();
                    if($(this).hasClass("away")){
                        nest_rule.updateSelectednest(udn, 1, true, "away");
                        $(self).find(".action_subHeader").text("Away");
                    } else {
                        nest_rule.updateSelectednest(udn, 1, true, "home");
                        $(self).find(".action_subHeader").text("Home");
                    }
                    drawer.slideUp("fast");
                });
            } else {
                $(this).find('.check_mark').hide();
                drawer.slideUp("fast");
                nest_rule.updateSelectednest(udn, 1, false, "");
            }
        });


        $("#nest_container #device_list").find('.select_switches_list .fname').on("click", function (event) {
            event.stopPropagation();

            var id_drawer = $.trim($(this).closest(".select_switches_list").attr('data-udn'));
            var drawer = $('div [id="' + id_drawer + '"]');

            if (drawer.length != 0) {

                if ((drawer.is(":visible")) && (drawer.find("div").hasClass("div_bg_green"))) {
                    var tmp = drawer.find('.div_bg_green span').html();
                    console.log("tmp " + tmp);
                }

                drawer.slideToggle("fast", function () {
                    if (drawer.find("div").hasClass("div_bg_green")) {
                        nest_rule.updateRuleDevices();
                    }
                    if (drawer.is(":visible")) {
                        $('#device_list .drawer:visible').each(function (i, elem) {
                            if ($(this).attr("id") != id_drawer) {
                                $(this).slideToggle("fast");
                                console.log("hide drawer id=" + $(this).attr("id"));
                            }
                        });
                    }
                    ;
                });
            } else {
                var check_mark = $("#nest_container #device_list").children('div [data-udn="' + id_drawer + '"] ').find('.check_mark');

                if (!check_mark.is(":visible")) {
                    check_mark.show();
                    nest_rule.selectDevice('on', 0, id_drawer);
                    nest_rule.updateRuleDevices();
                }

            }

            event.preventDefault();
        });

        //$(".select_nest_list").on("click", function(event) {
        //    event.stopPropagation();
        //
        //    var id_drawer = $(this).attr('data-udn');
        //    var drawer = $('div [id="' + id_drawer + '"]');
        //
        //    console.log("id_drawer");
        //    console.log(id_drawer);
        //    console.log("drawer");
        //    console.log(drawer);
        //
        //    if (drawer.length != 0) {
        //
        //        if ((drawer.is(":visible")) && (drawer.find("div").hasClass("div_bg_green"))) {
        //            var tmp = drawer.find('.div_bg_green span').html();
        //            console.log("tmp " + tmp);
        //        }
        //
        //        drawer.slideToggle("fast", function() {
        //            if (drawer.find("div").hasClass("div_bg_green")) {
        //                nest_rule.updateRuleDevices();
        //            }
        //            if (drawer.is(":visible")) {
        //                $('#device_list .drawer:visible').each(function(i, elem) {
        //                    if ($(this).attr("id") != id_drawer) {
        //                        $(this).slideToggle("fast");
        //                        console.log("hide drawer id=" + $(this).attr("id"));
        //                    }
        //                });
        //            };
        //        });
        //    } else {
        //        var check_mark = $("#nest_container #device_list").children('div [data-udn="' + id_drawer + '"] ').find('.check_mark');
        //
        //        if (!check_mark.is(":visible")) {
        //            check_mark.show();
        //            nest_rule.selectDevice('on', 0, id_drawer);
        //            nest_rule.updateRuleDevices();
        //        }
        //
        //    }
        //
        //    event.preventDefault();
        //});


        $("#nest_rule_when").on("tap", function () {
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("nest_rule"));
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, nest_rule.ruleObj);
            nativeUtilPlugin.execute(null, null, actions.SHOW_SPLASH_ON_LOADING, []);
            wemoUtil.loadUrl(filePath.SENSORS_RULE_WHEN);
        });

        $("#rule_name").on("tap", function () {
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("nest_rule"));
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, nest_rule.ruleObj);
            nativeUtilPlugin.execute(null, null, actions.SHOW_SPLASH_ON_LOADING, []);
            wemoUtil.loadUrl(filePath.RULE_NAME);
        });

        //nest_rule Click on the Save Button
        $("#nest_rule_save_btn").on('tap', function () {
            // alert(JSON.stringify(nest_rule.ruleObj));
            var deviceslen = Object.keys(nest_rule.ruleObj.Devices).length;
            var nestslen = Object.keys(nest_rule.ruleObj.nests).length;
            var issupported = "";
            if (deviceslen == 0) {
                $('body').on('touchmove', function (e) {
                    e.preventDefault();
                });
                setTimeout(
                    function () {
                        $('#device_not_selected').popup("open");
                    },
                    timeout.POPUP_DISPLAY_DELAY
                );
                console.log("save disable");
                return;
            } else if(nestslen == 0){
                $('body').on('touchmove', function (e) {
                    e.preventDefault();
                });
                setTimeout(
                    function () {
                        $('#nest_not_selected').popup("open");
                    },
                    timeout.POPUP_DISPLAY_DELAY
                );
                console.log("save disable");
                return;
            }
            if (Object.keys(nest_rule.ruleObj.nests).length == 0) {
                $('body').on('touchmove', function (e) {
                    e.preventDefault();
                });
                setTimeout(
                    function () {
                        $('#nest_not_selected').popup("open");
                    },
                    timeout.POPUP_DISPLAY_DELAY
                );
                return;
            }
            nativeUtilPlugin.execute(null, null, actions.SHOW_SPLASH_ON_LOADING, []);
            if (nest_rule.ruleObj.When.StartSRSS != undefined || nest_rule.ruleObj.When.EndSRSS != undefined) {
                for (key in nest_rule.ruleObj.Devices) {

                    if (networktype == null || networktype == networkType.HOME_NETWORK) {
                        devicePlugin.execute(
                            function (params) {
                                if (params === "true") {
                                    issupported = params;
                                } else {
                                    nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                    issupported = params;
                                    var ruleConflictLocalizedmsg = wemo.items['FirmwareVerCheckText_OFFSET'];
                                    $("#FirmwareVerCheckText").html(ruleConflictLocalizedmsg);
                                    setTimeout(function () {
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
                            function (enabled) {
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
                                                setTimeout(function () {
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

            if (nest_rule.ruleObj.When.RuleDuration == undefined) {
                var StartTimeAM = 'false';
                var EndTimeAM = 'false';
                StartTimeAM = (wemoUtil.convertMillisecondsToAMPM(nest_rule.ruleObj.When.StartTime).lastIndexOf("AM") != -1) ? 'true' : 'false';
                EndTimeAM = (wemoUtil.convertMillisecondsToAMPM(nest_rule.ruleObj.When.EndTime).lastIndexOf("AM") != -1) ? 'true' : 'false';
                if (nest_rule.ruleObj.When.EndTime < nest_rule.ruleObj.When.StartTime) {
                    if (StartTimeAM == EndTimeAM) {
                        nest_rule.ruleObj.When.RuleDuration = timestamp.MAX_HOUR - (parseInt(nest_rule.ruleObj.When.StartTime) - parseInt(nest_rule.ruleObj.When.EndTime));
                    } else {
                        nest_rule.ruleObj.When.RuleDuration = (timestamp.MAX_HOUR - (parseInt(nest_rule.ruleObj.When.StartTime))) + parseInt(nest_rule.ruleObj.When.EndTime);
                    }
                } else {
                    nest_rule.ruleObj.When.RuleDuration = nest_rule.ruleObj.When.EndTime - nest_rule.ruleObj.When.StartTime;
                }
            }

            //-------------------SRSS--------------------
            //Plug-in Call To Get Firmware Version SRSS
            if (nest_rule.ruleObj.When.StartSRSS != undefined || nest_rule.ruleObj.When.EndSRSS != undefined) {
                if (Object.keys(nest_rule.ruleObj.Devices).length > 0) {
                    for (key in nest_rule.ruleObj.Devices) {
                        console.log("SRSS - UDN Firmware Version - " + key + "  ::  " + nest_rule.ruleObj.Devices[key]);
                        nest_rule.ruleObj.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                        //alert("Save - isFirmWareSupported: 1 "+nest_rule.ruleObj.When.isFirmWareSupported);
                    }
                    //alert("Save - isFirmWareSupported: 2 "+nest_rule.ruleObj.When.isFirmWareSupported);
                }
            }
            //-------------------SRSS--------------------

            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, nest_rule.ruleObj);
            console.log("Saveing nest Rule");
            if (nest_rule.ruleObj.When.isFirmWareSupported != undefined && nest_rule.ruleObj.When.isFirmWareSupported === "false") {
                nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                setTimeout(
                    function () {
                        $("#sunrise_firmware_upgrade").popup("open");
                    },
                    timeout.POPUP_DISPLAY_DELAY
                );
            } else {
                var selectedDevice = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE);
                if (selectedDevice != null) {
                    window.sessionStorage.removeItem(sessionStore.CURRENT_DEVICE);
                }
                saveNewRule_RULES_RULEDEVICES(nest_rule.ruleObj.RuleType, nest_rule.ruleObj);
            }
        });

        //FW Compatibility based upgrade
        $("#update_nw_btn").on("click", function () {
            if (!isRemoteEnabled)
                deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
            wemoUtil.loadUrl(filePath.MORE_NEW_FIRMWARE);
            $("#fw_ver_check").popup("close");
        });

        $("#later_btn").on("click", function () {
            $("#fw_ver_check").popup("close");
            wemoUtil.loadUrl(filePath.ENABLED_RULES);
        });

        $("#identicalOnOffTimeOkBtn").on("tap", function () {
            $("#identicalOnOffTime").popup("close");
        });

        $('#nest_rule_cancel_btn').on("pointerdown", function () {
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

        $("#sunrise_firmware_upgrade_updatenow").on("click", function () {
            var pendingFirmware = "pendingFirmware";
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.PENDING_FIRMWARE, pendingFirmware);

            $("#sunrise_firmware_upgrade").popup("close");
            nest_rule.ruleObj.RuleType = sessionStore.MOTION_CONTROLLED;
            if (Object.keys(nest_rule.ruleObj.Devices).length > 0) {
                for (key in nest_rule.ruleObj.Devices) {
                    nest_rule.ruleObj.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, nest_rule.ruleObj);
                }
            }
            var selectedDevice = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE);
            if (selectedDevice != null) {
                window.sessionStorage.removeItem(sessionStore.CURRENT_DEVICE);
            }
            saveNewRule_RULES_RULEDEVICES(nest_rule.ruleObj.RuleType, nest_rule.ruleObj);
        });

        $('#sunrise_firmware_upgrade_later').on('click', function () {
            //alert("Save Rule");
            $("#sunrise_firmware_upgrade").popup('close');
            nest_rule.ruleObj.RuleType = sessionStore.MOTION_CONTROLLED;
            if (Object.keys(nest_rule.ruleObj.Devices).length > 0) {
                for (key in nest_rule.ruleObj.Devices) {
                    nest_rule.ruleObj.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, nest_rule.ruleObj);
                }
            }
            var selectedDevice = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE);
            if (selectedDevice != null) {
                window.sessionStorage.removeItem(sessionStore.CURRENT_DEVICE);
            }
            saveNewRule_RULES_RULEDEVICES(nest_rule.ruleObj.RuleType, nest_rule.ruleObj);
        });
    },


    updateRuleDevices: function () {
        console.log("Updating rule devices...")
        console.log(JSON.stringify(nest_rule.ruleObj));

        nest_rule.ruleObj.Devices = {};

        for (var udn in deviceList.getArray()) {
            console.log(JSON.stringify(deviceList.getDevice(udn)));
            if (deviceList.getDevice(udn) != undefined && deviceList.getDevice(udn) != '') {
                if (deviceList.getDevice(udn).state != undefined && deviceList.getDevice(udn).state != '') {
                    nest_rule.ruleObj.Devices[udn] = {};

                    if (deviceList.getDevice(udn).state == 'on') {
                        nest_rule.ruleObj.Devices[udn].StartAction = 1;
                        deviceList.setActive(udn, 'on', deviceList.getDevice(udn).duration);
                        if (deviceList.getDevice(udn).duration != '0' && deviceList.getDevice(udn).duration != '1') {
                            nest_rule.ruleObj.Devices[udn].SensorDuration = wemoUtil.convertTimeToMilliseconds(deviceList.getDevice(udn).duration);
                        } else {
                            nest_rule.ruleObj.Devices[udn].SensorDuration = deviceList.getDevice(udn).duration;
                        }
                        nest_rule.ruleObj.Devices[udn].EndAction = "0";
                    } else if (deviceList.getDevice(udn).state == 'off') {
                        nest_rule.ruleObj.Devices[udn].SensorDuration = 0;
                        nest_rule.ruleObj.Devices[udn].StartAction = 0;
                        nest_rule.ruleObj.Devices[udn].EndAction = "0";
                        deviceList.setActive(udn, 'off');
                    }


                    nest_rule.ruleObj.Devices[udn].FName = deviceList.getDevice(udn).name;
                    nest_rule.ruleObj.Devices[udn].ProductName = deviceList.getDevice(udn).productName;
                    console.log(udn + ': ' + JSON.stringify(nest_rule.ruleObj.Devices[udn]));
                }
            }
        }

        console.log(JSON.stringify(nest_rule.ruleObj));
    },

    ST_ET_areSAME: function (ruleObj) {
        if ((ruleObj.When.StartSRSS != undefined && ruleObj.When.EndSRSS != undefined) && (ruleObj.When.StartSRSS == ruleObj.When.EndSRSS)) {
            if (parseInt(ruleObj.When.OnModeOffset) == parseInt(ruleObj.When.OffModeOffset)) {
                return true;
            }
        } else if (parseInt(ruleObj.When.StartTime) == (parseInt(ruleObj.When.EndTime) == timestamp.MIDNIGHT_END_TIME ? 0 : parseInt(ruleObj.When.EndTime))) {
            return true;
        } else return false;
    },

    updateRuleSelectednests: function () {
        var selectednests = '';
        $('#nest_list > .more_li_clone').each(function (index) {
            if ($(this).find('.check_mark').css('display') != 'none') {
                console.log(index + ": " + $(this).attr('id'));
                if (selectednests != '') selectednests += ',';
                selectednests += $(this).attr('id');
            }
        });
        console.log('Selected nests: ' + selectednests);
        nest_rule.ruleObj.Selectednests = selectednests;
    },

    updateSelectednest: function (udn, state, isSelected, awayState) {
        console.log("awayState");
        console.log(awayState);
        if (isSelected) {
            nest_rule.ruleObj.nests = {};
            nest_rule.ruleObj.nests[udn] = {};
            nest_rule.ruleObj.nests[udn]['state'] = state;
            nest_rule.ruleObj.nests[udn]["awayState"] = awayState;
            if (nest_rule.nestDevicesObj[udn].ProductName != undefined)
                nest_rule.ruleObj.nests[udn]['ProductName'] = nest_rule.nestDevicesObj[udn].ProductName;
            wemoUtil.infoLog(TAG, "updateSelectednest:: " + "Rule Obj -->>>" + JSON
                    .stringify(nest_rule.ruleObj));
        } else {
            delete nest_rule.ruleObj.nests[udn];
            wemoUtil.infoLog(TAG, "updateSelectednest:: " + "Rule Obj -->>>" + JSON
                    .stringify(nest_rule.ruleObj));
        }

    },

    enableWhatHappens: function (networktype, remoteEnable) {
        console.log("success creating the table structures");
        if (networktype == networkType.HOME_NETWORK || networktype == null) {
            console.log("Local Mode...");

            deviceTabPlugin.execute(
                function (params) {
                    if (params.length == Object.keys(nest_rule.ruleObj.Devices).length) {
                        $('#nest_rule_what_happens .what_happens_select_switches').hide();
                    }
                },
                function (err) {
                    console.log("Error getting nests list")
                },
                actions.SELECT_SWITCHES, []);

        } else if (networktype == networkType.REMOTE_WIFI || networktype == networkType.REMOTE_MOBILE) {
            if (remoteEnable) {
                var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
                //alert("Switch count : "+arraynestObjects.length);

                if (arraySwitchObjects.length == Object.keys(nest_rule.ruleObj.Devices).length) {
                    $('#nest_rule_what_happens .what_happens_select_switches').hide();
                }

            } else {
                navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {
                    loadUrlTimeoutValue: 60000
                });
            }
        }
    },

    bindEvents: function () {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', nest_rule.onOnline, false);
        document.addEventListener('offline', nest_rule.onOffline, false);
        document.addEventListener("backbutton", nest_rule.onBackPress, false);
        document.addEventListener("pause", nest_rule.onPause, false);
        document.addEventListener("resume", nest_rule.onResume, false);
    },

    onOffline: function () {
        console.log(TAG + "offLine");
    },

    onOnline: function () {
        console.log(TAG + "onLine");
    },

    onBackPress: function () {
        var selectedDevice = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE);
        if (selectedDevice != null) {
            window.sessionStorage.removeItem(sessionStore.CURRENT_DEVICE);
        }
        var selectednest = window.sessionStorage.getItem(sessionStore.CURRENT_nest_NAME);
        if (selectednest != null) {
            window.sessionStorage.removeItem(sessionStore.CURRENT_nest_NAME);
        }
        if ($(".more_tab").is(":visible")) {
            $(".more_tab").hide();
            $('body').find('.modalWindow').transition({
                opacity: 0
            }, 400, function () {
                $(this).removeClass('isOpen');
            });
        } else {

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
    },

    showModal: function (msg) {
        $("body").append('<div id="mask" class="modalWindow"/>');

        $.mobile.showPageLoadingMsg("a", msg);
    },

    loaderStateCheck: function () {
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

    showPopup: function () {
        //Rule conflict Popup
        $("#rule_conflict_learn_more_btn").on("tap", function () {
            alert("Your Data has Saved");
            $("#rule_conflict").popup("close");
        });

        $("#rule_conflict_ok_btn").on("tap", function () {
            alert("Your Data has Saved");
            $("#rule_conflict").popup("close");
        });

        //Rules Can not be saved Popup
        $("#rule_can_not_save_ok").on("tap", function () {
            alert("Rules Can't be saved");
            $("#rule_can_not_save").popup("close");
        });

        $("#rule_duplicate_ok_btn").on("tap", function () {
            alert("Rule Duplicate");
            $("#rule_duplicate").popup("close");
        });

        //sunrise firmware upgrade Popup
        $("#sunrise_firmware_upgrade_later").on("tap", function () {
            $("#sunrise_firmware_upgrade").popup("close");
        });

        $("#sunrise_firmware_upgrade_updatenow").on("tap", function () {
            $("#sunrise_firmware_upgrade").popup("close");
        });

    },


    buildnestList: function () {
        console.log("Build nests list");

        var htmlList = "",
            params;

        if(isRemoteEnabled){
            params = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.NEST_DATA);

        } else {
            params = wemoUtil.getDevices(actions.SELECT_NEST_DEVICES);
        }


        if (params.length > 0) {
            $.each(params, function (inx) {
                nest_rule.nestDevicesObj[params[inx].udn] = {ProductName: params[inx].ProductName};

                console.log("nest UDN: " + params[inx].udn + ", name: " + params[inx].friendlyName);

                htmlList += '<div class="select_nest_list more_li_clone more_li_clone_top" data-udn="' + params[inx].udn + '"><div class="display_table"><span class="display_cell padding_left_16px"><span class="fname">' + params[inx].friendlyName + '(' + params[inx].parentName + ')' + '</span><span class="action_subHeader"></span></span></div><span class="check_mark"></span></div><div class="drawer" id="' + params[inx].udn + '"><div class="drawer_li home"><span>Home</span></div><div class="drawer_li away"><span>Away</span></div></div>';


                $('#nest_list').html(htmlList);
            });

            for (var dev in nest_rule.ruleObj.nests) {
                var selectedNestEl = $(".select_nest_list[data-udn='" + dev + "']");
                var nestRulestate = nest_rule.ruleObj.nests[dev].awayState;

                selectedNestEl.find(".action_subHeader").text(wemo.items[nestRulestate]);
                selectedNestEl.find(".check_mark").show();
            }
        }
    }

};
