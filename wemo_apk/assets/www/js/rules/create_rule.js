/*
 create_rule.js

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

var TAG = "create_rule.js: ";

$(document).bind('pageinit', function () {
    var w = wemoUtil.getScreenWidth();
    createRule.initialize();
});

var createRule = {

    initialize: function () {
        console.log(TAG + "initialize");
        /* Setting the session variable for new rule to show the correct message in New Rule/ Edit Rule screen*/
        window.sessionStorage.setItem(sessionStore.isEdit, sessionStore.RULE_NEW);
        document.addEventListener('wemo-frameworks-loaded', this.onDeviceReady, false);
        window.sessionStorage.removeItem(sessionStore.HOUSE_SITTER_CHECK);
        window.sessionStorage.setItem(sessionStore.RULES_REMOTE_MODE, false);
    },

    onDeviceReady: function () {
        console.log(TAG + "onDeviceReady");
        window.sessionStorage.removeItem(sessionStore.DEFAULT_SETTING);
        wemoUtil.setTimeFormat();
        nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, []);

        //Clone DB before doing anyactions to avoid pushDB fail
        wemoUtil.cloneDB();

        createRule.bindEvents();
        var rule = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
        var ruleDBLen = "";
        if (rule != undefined && rule.ruleTaleRowLen != undefined) {
            ruleDBLen = rule.ruleTaleRowLen;
        } else {
            ruleDBLen = 1;
        }

        $('#rules_btn').addClass('rules_btn_active');
        //All initialization script goes here
        /* to move to rule page */
        $('[name=bottom_nav_btn]').on('click', function () {
            //Uncomment when rules tab is implemented
            var id = $(this).attr('id');
            if (id == 'device_btn') {

                wemoUtil.loadUrl(filePath.DEVICE_LIST);

            } else if (id == 'rules_btn') {
                $(this).addClass('rules_btn_active');
                $('#device_btn').removeClass('device_btn_active');
                $('#device_container').addClass('none');
                $('#rules_container').removeClass('none');
            }
        });

        $(".wemo_logo").on("tap", function (e) {
            if (e.target.nodeName != "IMG") {
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }
        });

        $(".more_tab_icon").on("tap",function(){
            wemoUtil.loadUrl(filePath.MORE_MENU);
        });

        $(".device_btn").on("tap",function(){
            $(".footer_tab_right").removeClass("active");
            $(".footer_tab_left").addClass("active");
            setTimeout(function(){
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }, 300);
        });


        //hide footer when load create rules page from saved rules page
        var existingRules = window.sessionStorage.getItem(sessionStore.RULES_DATA);
        if (!!existingRules && JSON.parse(existingRules).length > 0) {
            $(".footerComponent").hide();
            $("#create_rule").css("padding-bottom", 0);
            $(".wemo_logo").hide();
            $(".headerBtns").hide();
            $(".backbutton").show();
            $("header .title").show();
            $(".backbutton").on("tap", createRule.onBackPress);
        }else{
            $(".backbutton").hide();
            $("header .title").hide();
        }

        //Rule Page Create New Rule
        /*  $("#simple_rule").on("tap", function () {
         var newRule = {};
         newRule.When = {};
         newRule.Devices = {};
         newRule.State = '1';
         newRule.RuleType = sessionStore.SIMPLE_SWITCH;//"Simple Switch";
         newRule.SelectedSensorsValue = "-1";
         newRule.ruleTaleRowLen = "" + ruleDBLen;
         window.sessionStorage.setItem(sessionStore.RULE_NEW, JSON.stringify(newRule));
         window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("simple_rule"));
         wemoUtil.loadUrl(filePath.NEW_RULE);

         });*/

        $("#timer_rule").on("tap", function () {
            var newRule = {};
            newRule.When = {};
            newRule.Devices = {};
            newRule.State = '1';
            newRule.RuleType = sessionStore.TIME_INTERVAL;//"Time Interval";
            newRule.SelectedSensorsValue = "-1";
            newRule.ruleTaleRowLen = "" + ruleDBLen;
            window.sessionStorage.setItem(sessionStore.RULE_NEW, JSON.stringify(newRule));
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("timer_rule"));
            wemoUtil.loadUrl(filePath.TIMER_RULE);
        });
        $("#countdown_timer_rule").on("tap", function () {
            var newRule = {};
            newRule.When = {};
            newRule.Devices = {};
            newRule.State = '1';
            newRule.RuleType = sessionStore.COUNTDOWN_TIMER;
            newRule.SelectedSensorsValue = "-1";
            newRule.ruleTaleRowLen = "" + ruleDBLen;
            window.sessionStorage.setItem(sessionStore.RULE_NEW, JSON.stringify(newRule));
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify(sessionStore.COUNTDOWN_TIMER));
            wemoUtil.loadUrl(filePath.COUNTDOWN_TIMER_RULE);
        });
        $("#so_rule").on("tap", function () {
            var newRule = {};
            newRule.When = {};
            newRule.Devices = {};
            newRule.State = '1';
            newRule.RuleType = sessionStore.TIME_INTERVAL;//"Time Interval";
            newRule.SelectedSensorsValue = "-1";
            newRule.ruleTaleRowLen = "" + ruleDBLen;
            window.sessionStorage.setItem(sessionStore.RULE_NEW, JSON.stringify(newRule));
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("timer_rule"));
            window.sessionStorage.setItem(sessionStore.HOUSE_SITTER_CHECK, "1");
            wemoUtil.loadUrl(filePath.TIMER_RULE);
        });

        $("#sensor_rule").on("tap", function () {
            window.sessionStorage.setItem("clickFrom", "sensors_rule");
            var newRule = {};
            newRule.When = {};
            newRule.Devices = {};
            newRule.Sensors = {};
            newRule.State = '1';
            newRule.RuleType = sessionStore.MOTION_CONTROLLED;//"Motion Controlled";
            newRule.ruleTaleRowLen = "" + ruleDBLen;
            window.sessionStorage.setItem(sessionStore.RULE_NEW, JSON.stringify(newRule));
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("sensor_rule"));
            wemoUtil.loadUrl(filePath.SENSORS_RULE);
        });

        $("#long_press_rule").on("tap", function () {
            window.sessionStorage.setItem("clickFrom", "long_press_rule");
            var newRule = {};
            newRule.When = {};
            newRule.Devices = {};
            newRule.LightSwitch = {};
            newRule.StartAction = "2";
            newRule.State = '1';
            newRule.RuleType = sessionStore.LONG_PRESS;
            newRule.ruleTaleRowLen = "" + ruleDBLen;
            window.sessionStorage.setItem(sessionStore.RULE_NEW, JSON.stringify(newRule));
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify(sessionStore.LONG_PRESS));
            wemoUtil.loadUrl(filePath.LONG_PRESS_RULE);
        });


        $("#maker_rule").on("tap", function () {
            window.sessionStorage.setItem("clickFrom", sessionStore.MAKER_MOTION_CONTROLLED);
            var newRule = {};
            newRule.When = {};
            newRule.Devices = {};
            newRule.Sensors = {};
            newRule.State = '1';
            newRule.RuleType = sessionStore.MAKER_MOTION_CONTROLLED;//"Maker Rule";
            newRule.ruleTaleRowLen = "" + ruleDBLen;
            window.sessionStorage.setItem(sessionStore.RULE_NEW, JSON.stringify(newRule));
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify(sessionStore.MAKER_MOTION_CONTROLLED));
            wemoUtil.loadUrl(filePath.MAKER_RULE);
        });

        $("#nest_rule").on("tap", function () {
            window.sessionStorage.setItem("clickFrom", sessionStore.EVENT_CONTROLLED);
            var newRule = {};
            newRule.When = {};
            newRule.Devices = {};
            newRule.nests = {};
            newRule.State = '1';
            newRule.RuleType = sessionStore.EVENT_CONTROLLED;//"Nest Rule";
            newRule.ruleTaleRowLen = "" + ruleDBLen;
            window.sessionStorage.setItem(sessionStore.RULE_NEW, JSON.stringify(newRule));
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify(sessionStore.NEST_CONTROLLED));
            wemoUtil.loadUrl(filePath.NEST_RULE);
        });

        $("#notify_power_sensing_rule").on("tap", function () {
            window.sessionStorage.setItem("clickFrom", "notify_power_sensing_rule");
            var newRule = {};
            newRule.When = {};
            newRule.Devices = {};
            newRule.Sensors = {};
            newRule.State = '1';
            newRule.RuleType = 'Insight Rule';
            newRule.ruleTaleRowLen = "" + ruleDBLen;
            window.sessionStorage.setItem(sessionStore.RULE_NEW, JSON.stringify(newRule));
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("notify_power_sensing_rule"));
            wemoUtil.loadUrl(filePath.NOTIFY_RULE);
        });

        $("#sensor_notification_rule").on("tap", function () {
            window.sessionStorage.setItem(sessionStore.GCM_SENSOR, "1");
            var newRule = {};
            newRule.When = {};
            newRule.Devices = {};
            newRule.Sensors = {};
            newRule.State = '1';
            newRule.RuleType = 'Notify Me';
            newRule.ruleTaleRowLen = "" + ruleDBLen;
            window.sessionStorage.setItem(sessionStore.RULE_NEW, JSON.stringify(newRule));
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("Notify Me"));
            window.sessionStorage.setItem(sessionStore.INITIAL_RULE_TAPPED, true);
            wemoUtil.loadUrl(filePath.NOTIFY_RULE);
        });
        
        $("#notify_maker_sensing_rule").on("tap", function () {
            window.sessionStorage.setItem(sessionStore.GCM_MAKER_SENSOR, "1");
            var newRule = {};
            newRule.When = {};
            newRule.Devices = {};
            newRule.Sensors = {};
            newRule.State = '1';
            newRule.RuleType = sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE;
            newRule.ruleTaleRowLen = "" + ruleDBLen;
            window.sessionStorage.setItem(sessionStore.RULE_NEW, JSON.stringify(newRule));
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify(sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE));
            wemoUtil.loadUrl(filePath.NOTIFY_RULE);
        });


        $(".rules_page").show();
        /*
         //it's useless for Android:
         window.onload = fitHeight;*/

        if (wemoUtil.debugHTML === true) {
            $('.create_rule').show();
        }
        else {
            deviceTabPlugin.execute(
                function (data) {
                     if (data == networkType.HOME_NETWORK) {
                        $.when(wemoUtil.getDevices(actions.SELECT_DIMMERS),
                           wemoUtil.getDevices(actions.GET_LONG_PRESS_LIGHT_SWICTHES))
                        .then(function() {
                            createRule.checkSwitch();
                        }).fail(function() {
                            throw ('ERROR');
                        });
                    } else if (data == networkType.REMOTE_WIFI || data == networkType.REMOTE_MOBILE) {
                        $.when(wemoUtil.getDevices(actions.GET_LONG_PRESS_LIGHT_SWICTHES))
                        .then(function() {
                            createRule.checkSwitch();
                        }).fail(function() {
                            throw ('ERROR');
                        });
                    }
                },
                createRule.reportError,
                actions.GET_NETWORK_TYPE,
                []
            );
        }
    },

    checkSwitch: function () {
        var isInsightsFound = false,
            isSwitchFound = false,
            isDimmerFound = false,
            dimmerForLongPressFound = 0,
            isLightSwitchFound = false,
            lightSwitchForLongPressFound = 0,
            isMotionSensorFound = false,
            isMakerSensorFound=false,
            isNestFound = false,
            isMakerToggleSwitchFound=false,
            isLedDeviceFound = false,
            isKeyChainSensorFound = false,
            isDoorWindowSensorFound = false,
            isPIRSensorFound = false,
            isRemoteEnable = true;


        deviceTabPlugin.execute(
            function (enabled) {
                console.log("Remote enabled: " + enabled);
                isRemoteEnable = enabled;
            },
            createRule.reportError,
            actions.IS_REMOTE_ENABLED,
           []
        );


        console.log("success creating the table structures");
        console.log(JSON.stringify(this));
        var savedRules = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULES_DATA),
            savedRulesArr = [];

        if (savedRules && savedRules.length > 0) {
             $.each(savedRules, function(index) {
                if (savedRules[index].Type === sessionStore.LONG_PRESS) {
                    savedRulesArr.push(savedRules[index].DeviceID);
                }
             });
        }


        deviceTabPlugin.execute(
            function (data) {
                if (data == networkType.HOME_NETWORK) {
            		var isMakerFound = false;
            		wemoUtil.isDeviceFound(actions.SELECT_DIMMERS, function (flag) {
                        isDimmerFound = flag;
                        if (isDimmerFound) {
                            var dimmerDevices = wemoUtil.getDevices(actions.SELECT_DIMMERS);
                            $.each(dimmerDevices, function(index) {
                                if (savedRulesArr.indexOf(dimmerDevices[index].udn) === -1) {
                                     dimmerForLongPressFound++;
                                }
                            });

                            if (dimmerForLongPressFound === 0) {
                                $("#long_press_rule .subtitle").html(wemo.items["LongPressSubtitleFull"]);
                            }

                        } else {
                            dimmerForLongPressFound = 0;
                        }
                        wemoUtil.infoLog(TAG, "isDimmerFound >>" + isDimmerFound);
                        wemoUtil.isDeviceFound(actions.SELECT_INSIGHTS, function (flag) {
                            isInsightsFound = flag;
                            console.log("isInsightsFound >>" + isInsightsFound );
                            wemoUtil.isDeviceFound(actions.SELECT_SWITCHES, function (flag) {
                                isSwitchFound= flag;
                                console.log("isSwitchFound >>" + isSwitchFound );
                                wemoUtil.isDeviceFound(actions.GET_LONG_PRESS_LIGHT_SWICTHES, function (flag) {
                                    isLightSwitchFound= flag;
                                    console.log("isLightSwitchForLongPressFound >>" + isLightSwitchFound );
                                    if (isLightSwitchFound) {
                                        var lightSwitchDevices = wemoUtil.getDevices(actions.GET_LONG_PRESS_LIGHT_SWICTHES);
                                        $.each(lightSwitchDevices, function(index) {
                                            if (savedRulesArr.indexOf(lightSwitchDevices[index].udn) === -1) {
                                                lightSwitchForLongPressFound++;
                                            }
                                        });

                                        if (lightSwitchForLongPressFound === 0) {
                                            $("#long_press_rule .subtitle").html(wemo.items["LongPressSubtitleFull"]);
                                        }
                                    } else {
                                        lightSwitchForLongPressFound = 0;
                                    }
                                    wemoUtil.isDeviceFound(actions.SELECT_SENSORS, function (flag) {
                                    isMotionSensorFound= flag;
                                    console.log("isMotionSensorFound >>" + isMotionSensorFound );

                                    wemoUtil.isDeviceFound(actions.SELECT_LED_DEVICES, function (flag) {
                                        isLedDeviceFound = flag;
                                        console.log("isLedDeviceFound >>" + isLedDeviceFound );
                                        wemoUtil.isDeviceFound(actions.SELECT_NEST_DEVICES, function (flag) {
                                            isNestFound = flag;
                                            wemoUtil.isMakerDeviceFound(actions.SELECT_MAKER, function (isLengthZero, isSensorFound, isToggleSwitchFound){
                                                console.log("isLengthZero >> " + isLengthZero + "isSensorFound >> "+ isSensorFound + "isToggleSwitchFound >> "+ isToggleSwitchFound);
                                                if(isLengthZero == true){
                                                    isMakerFound = false;
                                                    isMakerSensorFound = false;
                                                } else if(isSensorFound == true){
                                                    isMakerFound = true;
                                                    isMakerSensorFound = true;
                                                } else{
                                                    isMakerFound = true;
                                                    isMakerSensorFound = false;
                                                }
                                                isMakerToggleSwitchFound = isToggleSwitchFound;
                                                isKeyChainSensorFound = false;
                                                isDoorWindowSensorFound = false;
                                                isPIRSensorFound = false;
                                                applyStyles();

                                            });
                                         });
                                    });
                                });
                                });
                            });

                        });
                    });




                    console.log("isRemoteEnable >>" + isRemoteEnable);

                    function applyStyles() {
                    	
                    	 if(!isRemoteEnable){
                             $('#nest_rule').removeClass('rules_nest').addClass("disabled rules_nest_icon_disable").unbind('tap');
                        	 $('#notify_power_sensing_rule').removeClass("rules_power_sensing").addClass("disabled rules_power_sensing_icon_disable").unbind('tap');
                             $('#sensor_notification_rule').removeClass("rules_notify_sensor").addClass("disabled rules_notify_sensor_icon_disable").unbind('tap');
                    	 	}

                        if (isNestFound == false){
                            $('#nest_rule').removeClass('rules_nest').addClass("disabled rules_nest_icon_disable").unbind('tap');
                        }
                    	
                            if (isInsightsFound === false) {
                                $('#notify_power_sensing_rule').removeClass("rules_power_sensing").addClass("disabled rules_power_sensing_icon_disable").unbind('tap');
                            }
                           
                            if (isMotionSensorFound === false && isPIRSensorFound === false) {
                                $('#sensor_rule').removeClass("rules_sensor").addClass("disabled rules_sensor_icon_disable").unbind('tap');
                                $('#sensor_notification_rule').removeClass("rules_notify_sensor").addClass("disabled rules_notify_sensor_icon_disable").unbind('tap');
                            }

                            if (isMakerSensorFound == false){
                				$('#maker_rule').remove();
                				$('#notify_maker_sensing_rule').remove();
                			}
                            else if(!isRemoteEnable){
                            	$('#notify_maker_sensing_rule').removeClass("rules_notify_maker").addClass("disabled rules_notify_maker_icon_disable").unbind('tap');
                            }

                            if (isDimmerFound === false && isLedDeviceFound === false && isInsightsFound === false && isSwitchFound === false && isMakerFound === false) {
                                $('#timer_rule').addClass("disabled rules_timer_icon_disable").unbind('tap');
                                $("#so_rule").addClass("disabled rules_so_icon_disable").unbind('tap');
                                $('#sensor_rule').removeClass("rules_sensor").addClass("disabled rules_sensor_icon_disable").unbind('tap');
                            } else if(isDimmerFound === false && isLedDeviceFound === false && isInsightsFound === false && isSwitchFound === false && isMakerFound === true && isMakerToggleSwitchFound === false){
                                $("#so_rule").addClass("disabled rules_so_icon_disable").unbind('tap');
                            }

                            if(dimmerForLongPressFound === 0 && lightSwitchForLongPressFound === 0) {
                                $("#long_press_rule").addClass("disabled rules_longpress_disable").unbind('tap');
                            }

                            if(isInsightsFound === false && isSwitchFound === false && isMakerFound === false && isDimmerFound === false){
                            	$('#countdown_timer_rule').addClass("disabled countdown_timer_icon_disable").unbind('tap');
                            }
                            
                            if (isKeyChainSensorFound == false){
                            	$('#fob_presence_rule').removeClass("rules_fob_presence").addClass("disabled rules_fob_presence_icon_disable").unbind('tap');
                                $('#keychain_button_rule').removeClass("rules_keychain_button").addClass("disabled rules_keychain_button_disable").unbind('tap');
                                $('#fob_presence_notify_rule').removeClass("rules_fob_presence_notify").addClass("disabled rules_fob_presence_notify_icon_disable").unbind('tap');
                			}
                            else if(!isRemoteEnable){
                            	$('#fob_presence_notify_rule').removeClass("rules_fob_presence_notify").addClass("disabled rules_fob_presence_notify_icon_disable").unbind('tap');
                            }
                            
                            if (isDoorWindowSensorFound == false || !isRemoteEnable){
                                $('#door_window_notify_rule').removeClass("rules_door_window_notify").addClass("disabled rules_door_window_notify_icon_disable").unbind('tap');
                			}

                            $('.create_rule').show();
                    }
                } else if (data == networkType.REMOTE_WIFI || data == networkType.REMOTE_MOBILE) {

                    deviceTabPlugin.execute(
                        function (enabled) {
                            if (enabled) {
                                var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA),
                                    arrayLightSwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LIGHT_SWITCH_DATA),
                                    arrayDimmerObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DIMMER_DATA),
                                    arrayInsightObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA),
                                    arraySensorObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SENSOR_DATA),
                    			    arrayMakerObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA),
                                    arrayLedObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_DATA),
                                    arrayPIRSensors = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.PIR_DATA),
                                    arrayFobSensors = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.FOB_DATA),
                                    arrayDWSensors = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DWSENSOR_DATA),
                                    arrayNestSensors = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.NEST_DATA);


                                //Adding lot of null checks in this method.
                                // This will be refactored later when we completely move Rules to native.

                                if ((arraySwitchObjects && arraySwitchObjects.length === 0) && (arrayDimmerObjects && arrayDimmerObjects.length === 0) && (arrayInsightObjects && arrayInsightObjects.length === 0) && (arrayMakerObjects && arrayMakerObjects.length === 0) && (arrayLedObjects && arrayLedObjects.length === 0)) {
                                    $('.create_rule').hide();
                                    $('.can_not_create_rule').show();
                                }
                                else {
                                    if(arrayMakerObjects!=null && arrayMakerObjects.length > 0){
                                        isMakerSensorFound = createRule.isMakerSensorPresent(arrayMakerObjects);
                                        isMakerToggleSwitchFound = createRule.isMakerToggleSwitchPresent(arrayMakerObjects);
                                    }
                                    if (isMakerSensorFound === false){
                                        $('#maker_rule').remove();
                                        $('#notify_maker_sensing_rule').remove();
                                    }
                                    $('.create_rule').show();
                                    if (arraySensorObjects != null && arraySensorObjects.length == 0 && arrayPIRSensors != null && arrayPIRSensors.length == 0) {
                                        $('#sensor_rule').removeClass("rules_sensor").addClass("disabled rules_sensor_icon_disable").unbind('tap');
                                        $('#sensor_notification_rule').removeClass("rules_notify_sensor").addClass("disabled rules_notify_sensor_icon_disable").unbind('tap');
                                    }
                                    if((arraySwitchObjects && arraySwitchObjects.length === 0) && (arrayDimmerObjects && arrayDimmerObjects.length === 0) && (arrayInsightObjects && arrayInsightObjects.length === 0) && (arrayMakerObjects && arrayMakerObjects.length === 0) && (arrayLedObjects && arrayLedObjects.length === 0)) {
                                        $("#so_rule").addClass("disabled rules_so_icon_disable").unbind('tap');
                                    } else if((arraySwitchObjects != null && arraySwitchObjects.length == 0) && (arrayInsightObjects != null && arrayInsightObjects.length == 0) && (arrayMakerObjects!=null && arrayMakerObjects.length > 0) && (arrayLedObjects != null && arrayLedObjects.length == 0) && isMakerToggleSwitchFound === false){
                                    	$("#so_rule").addClass("disabled rules_so_icon_disable").unbind('tap');
                                    }

                                    if ((arrayLightSwitchObjects && arrayLightSwitchObjects.length === 0) && (arrayDimmerObjects && arrayDimmerObjects.length === 0)) {
                                        $("#long_press_rule").addClass("disabled rules_longpress_disable").unbind('tap');
                                    } else {
                                        var lightSwitchDevices = wemoUtil.getDevices(actions.GET_LONG_PRESS_LIGHT_SWICTHES);
                                        $.each(lightSwitchDevices, function(index) {
                                            if (savedRulesArr.indexOf(lightSwitchDevices[index].udn) === -1) {
                                                lightSwitchForLongPressFound++;
                                            }
                                        });

                                        $.each(arrayDimmerObjects, function(index) {
                                            if (savedRulesArr.indexOf(arrayDimmerObjects[index].udn) === -1) {
                                                dimmerForLongPressFound++;
                                            }
                                        });

                                        if (dimmerForLongPressFound === 0 && lightSwitchForLongPressFound === 0) {
                                            $("#long_press_rule").addClass("disabled rules_longpress_disable").unbind('tap');
                                            $("#long_press_rule .subtitle").html(wemo.items["LongPressSubtitleFull"]);
                                        }
                                    }

                                    if(arrayInsightObjects != null && arrayInsightObjects.length == 0){
                                    	$('#notify_power_sensing_rule').removeClass("rules_power_sensing").addClass("disabled rules_power_sensing_icon_disable").unbind('tap');
                                    }

                                    if(arrayNestSensors != null && arrayNestSensors.length == 0){
                                        $('#nest_rule').removeClass('rules_nest').addClass("disabled rules_nest_icon_disable").unbind('tap');
                                    }

                                }


                            } else {
                                navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {loadUrlTimeoutValue: 60000});
                            }
                        },
                        createRule.reportError,
                        actions.IS_REMOTE_ENABLED,
                        []
                    );
                }
            },
            function (err) {
                console.log("Error getting sensors list");
            },
            actions.GET_NETWORK_TYPE,
            []);
    },

    bindEvents: function () {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', createRule.onOnline, false);
        document.addEventListener('offline', createRule.onOffline, false);
        document.addEventListener("backbutton", createRule.onBackPress, false);
        document.addEventListener("pause", createRule.onPause, false);
        document.addEventListener("resume", createRule.onResume, false);
    },

    onOffline: function () {
        console.log(TAG + "offLine");
    },

    onOnline: function () {
        console.log(TAG + "onLine");
    },

    onBackPress: function () {
        console.log(TAG + "onBackPress =>");

        if ($("#more_tab").is(":visible")) {
            $("#more_tab").hide();
            $('body').find('.modalWindow').transition({opacity: 0}, 400, function () {
                $(this).removeClass('isOpen');
            });
        }
        else {
            console.log(TAG + "onBackPress");
            if($(".backbutton").is(":visible")){
                wemoUtil.loadPreviousUrl();
            }else{
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }

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
    
    isMakerSensorPresent: function (arrayMakerObjs) {
    	for(var inx = 0 ; inx< arrayMakerObjs.length ; inx++){
    		if(arrayMakerObjs[inx].SensorPresent == "1")
    			return true;
    	}
    	return false;
    },
    
    isMakerToggleSwitchPresent: function (arrayMakerObjs) {
    	for(var inx = 0 ; inx< arrayMakerObjs.length ; inx++){
    		if(arrayMakerObjs[inx].SwitchMode == "0")
    			return true;
    	}
    	return false;
    }

};
