/*
 keychain_button_rule.js

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

var TAG = "keychain_button_rule.js: ";
var cur_drawer;
var UP_TF_IS24 = false; //UP-user preferences, TF-time format
var isInitialRule = false;

$(document).bind('pageinit', function() {
    sensors_rule.initialize();
});


var sensors_rule = {
    deviceList: {},
    ruleObj: {},
    sensorDevicesObj: {},

    initialize: function() {
        wemoUtil.infoLog(TAG , "initialize");
        var isEdit = window.sessionStorage.getItem(sessionStore.isEdit);
        if (isEdit == sessionStore.RULE_NEW) {
            $('.sub_header > span').html(wemo.items['KeychainButtonRule']);
        } else {
            $('.sub_header > span').html(wemo.items['EditKeychainButtonRule']);
        }
        if (window.sessionStorage.getItem(sessionStore.INITIAL_RULE_TAPPED) === "true") {
        	isInitialRule = true;
        }
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    onDeviceReady: function() {
        var self = this;
        UP_TF_IS24 = wemoUtil.userPreferences.getTimeFormat();
        
        if (!isRemoteEnabled) {
        $.when(wemoUtil.getDevices(actions.SELECT_SWITCHES), wemoUtil.getDevices(actions.SELECT_INSIGHTS), wemoUtil.getDevices(actions.SELECT_MAKER), wemoUtil.getDevices(actions.SELECT_LED_DEVICES))
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
        wemoUtil.infoLog(TAG, "loadDevices: RuleObj--> "+ JSON.stringify(sensors_rule.ruleObj));
        var devices = [];
        var bridgeUDN = '';

        if (isRemoteEnabled) {
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA).concat(devices);
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA).concat(devices);
            var ledDevices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_DATA);
            devices = ledDevices.concat(devices);
            if (ledDevices.length > 0) {
                var wemoBridgeObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_BRIDGE_UDN);
                wemoUtil.infoLog(TAG, "led Device bridgeDetails: " + JSON.stringify(wemoBridgeObj));
                var len = wemoBridgeObj.length;
                for (var i = 0; i < len; i++) {
                    bridgeUDN = wemoBridgeObj[i].udn;
                }
            }
        } else {
            var tempDevices = '';
            devices = wemoUtil.getDevices(actions.SELECT_SWITCHES);
            devices = wemoUtil.getDevices(actions.SELECT_INSIGHTS).concat(devices);
            devices = wemoUtil.getDevices(actions.SELECT_MAKER).concat(devices);
            tempDevices = wemoUtil.getDevices(actions.SELECT_LED_DEVICES);
            if (tempDevices != '0') {
                devices = tempDevices.concat(devices);
            }
        }
        
        devices = wemoUtil.sortJSONArray(devices, key.DEVICE_FRIENDLY_NAME);

        if (devices != null && devices.length > 0) {
            $.each(devices, function(inx) {
                if (wemoUtil.isMakerDevice(devices[inx].udn)) {
                    deviceList.addMakerDevice(devices[inx].udn, devices[inx].friendlyName, devices[inx].SwitchMode);
                } else {
                    if ((devices[inx].udn).indexOf(key.UUID_VALUE) == -1) {
                        if (devices[inx].udn == '') {
                            devices[inx].udn = devices[inx].macAddress;
                            deviceList.addLedDevice(devices[inx].macAddress, devices[inx].friendlyName, bridgeUDN);
                        } else
                            deviceList.addLedDevice(devices[inx].udn, devices[inx].friendlyName, devices[inx].bridgeudn);
                    } else {
                        deviceList.addDevice(devices[inx].udn, devices[inx].friendlyName);
                    }
                }

                wemoUtil.infoLog(TAG, JSON.stringify(sensors_rule.ruleObj.Devices));
                for (var dev in sensors_rule.ruleObj.Devices) {
                	if (wemoUtil.isMakerDevice(dev)) {
                		if (wemoUtil.getMakerSwithUDN(dev) == wemoUtil.getMakerSwithUDN(devices[inx].udn)) {
                			if (sensors_rule.ruleObj.Devices[dev].StartAction == switchToggleState.TOGGLE) {
                				deviceList.setActive(devices[inx].udn, ruleDrawerVal.ON);
                			}
                		}
                	} else {
                		wemoUtil.infoLog(TAG, sensors_rule.ruleObj.Devices[dev]);
                		if (dev == devices[inx].udn) {
                			if (sensors_rule.ruleObj.Devices[dev].StartAction == switchToggleState.TOGGLE) {
                				deviceList.setActive(devices[inx].udn, ruleDrawerVal.ON);
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

            if (udn.indexOf(key.UUID_VALUE) == -1) {
                window.sessionStorage.setItem(sessionStore.LED_BRIDGE_UDN_ID, deviceList.getDevice(udn).bridgeudn);
            }
            if (deviceList.getDevice(udn).state != undefined) {
            	if (deviceList.getDevice(udn).state == ruleDrawerVal.ON) {
            		state = wemo.items['SwitchToggleSelected']
            	} 
            }


            html = '<div class="select_switches_list more_li_clone more_li_clone_top" data-udn="' + udn + '"><div class="display_table"><span class="display_cell padding_left_16px"><span class="fname">' + deviceList.getDevice(udn).name + '</span><span class="action_subHeader">' + state + '</span></span></div><span class="check_mark"></span></div></div>';

            $('#sensors_container #device_list').append($(html));

            if (state != '') {
            	$('div [data-udn="' + udn + '"] ').find('.check_mark').show();
            	if (deviceList.getDevice(udn).state == ruleDrawerVal.ON) {
            		$('div [id="' + udn + '"]').find('.on span').empty().html(wemo.items['SwitchToggleSelected']);
            	} 
            }
            
            if(isInitialRule){
            	sensors_rule.selectDevice(ruleDrawerVal.ON, udn);
            	sensors_rule.updateRuleDevices();
            	isInitialRule = false;
            }
        }


//        $("#device_list").find('.check_mark').on('tap', function() {
//            var udn = $(this).closest('.select_switches_list').attr('data-udn');
//            var drawer = $('div [id="' + udn + '"]');
//            if (drawer.is(":visible")) drawer.slideToggle("slow");
//            sensors_rule.deselectDevice(udn);
//            sensors_rule.updateRuleDevices();
//        });

    },

    deselectDevice: function(udn) {
    	$('div [data-udn="' + udn + '"]').find('.check_mark').hide();
    	$('div [data-udn="' + udn + '"]').find('.action_subHeader').empty();
    	deviceList.unsetActive(udn);
    },

    selectDevice: function(type, udn) {
    	$('div [data-udn="' + udn + '"] ').find('.check_mark').show();
    	$('div [data-udn="' + udn + '"]').find('.action_subHeader').html(wemo.items['SwitchToggleSelected']);
    	deviceList.setActive(udn, type);
    },

    methodMain: function() {
        var networktype = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_NETWORKTYPE);
        wemoUtil.infoLog(TAG , 'methodMain');
        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
        wemoUtil.setTimeFormat();
        sensors_rule.bindEvents();
        nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);

        sensors_rule.ruleObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
        sensors_rule.ruleObj.RuleType = sessionStore.KEYCHAIN_PRESENCE_RULE;
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

            $("#sensors_rule_when .select_time").text(wemoUtil.convertMillisecondsToTF(sensors_rule.ruleObj.When.StartTime, UP_TF_IS24) + " - " + wemoUtil.convertMillisecondsToTF(sensors_rule.ruleObj.When.EndTime, UP_TF_IS24));
            $("#sensors_rule_when .select_day").html(tempDisSelectday);
        } else {
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

        $("#sensors_rule_when .select_day").html(tempSelectedDayOrRange);

        if (typeof(sensors_rule.ruleObj.RuleName) == "undefined") {
            sensors_rule.ruleObj.RuleName = wemo.items['KeychainButtonRule'];
        }
        $("#rule_name .rule_name_container").html(sensors_rule.ruleObj.RuleName);

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


        $("#sensors_rule_if #sensor_list").on("tap", '.select_sensors_list', function(event) {
            event.stopPropagation();
            
            var id_drawer = $.trim($(this).closest(".select_sensors_list").attr('data-udn'));
            var check_mark = $("#sensors_rule_if #sensor_list").children('div [data-udn="' + id_drawer + '"] ').find('.check_mark');

//            $("#sensors_rule_if #sensor_list").children('div [data-udn="' + params[inx].udn + '"] ').find('.check_mark').show();
            if (!check_mark.is(":visible")) {
            	check_mark.show();
            	sensors_rule.selectSensor(ruleDrawerVal.ON, id_drawer);
            }
            else{
            	check_mark.hide();
            	sensors_rule.deselectSensor(id_drawer);
            	sensors_rule.updateRuleDevices();
            }
            event.preventDefault();
        });


        $("#sensors_container #device_list").find('.select_switches_list').on("click", function(event) {
            event.stopPropagation();

            var id_drawer = $.trim($(this).closest(".select_switches_list").attr('data-udn'));
            var check_mark = $("#sensors_container #device_list").children('div [data-udn="' + id_drawer + '"] ').find('.check_mark');

            if (!check_mark.is(":visible")) {
            	check_mark.show();
            	sensors_rule.selectDevice(ruleDrawerVal.ON, id_drawer);
            	sensors_rule.updateRuleDevices();
            }
            else{
            	check_mark.hide();
            	sensors_rule.deselectDevice(id_drawer);
            	sensors_rule.updateRuleDevices();
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
                return;
            }
            len = Object.keys(sensors_rule.ruleObj.Sensors).length;
            if (len == 0) {
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
                StartTimeAM = (wemoUtil.convertMillisecondsToAMPM(sensors_rule.ruleObj.When.StartTime).lastIndexOf("AM") != -1) ? 'true' : 'false';
                EndTimeAM = (wemoUtil.convertMillisecondsToAMPM(sensors_rule.ruleObj.When.EndTime).lastIndexOf("AM") != -1) ? 'true' : 'false';
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
                        wemoUtils.infoLog(TAG, "SRSS - UDN Firmware Version - " + key + "  ::  " + sensors_rule.ruleObj.Devices[key]);
                        sensors_rule.ruleObj.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                    }
                }
            }
            //-------------------SRSS--------------------

            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, sensors_rule.ruleObj);
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
        wemoUtil.infoLog(TAG, "Updating rule devices...")
        wemoUtil.infoLog(TAG, JSON.stringify(sensors_rule.ruleObj));

        sensors_rule.ruleObj.Devices = {};

        for (var udn in deviceList.getArray()) {
            wemoUtil.infoLog(TAG, JSON.stringify(deviceList.getDevice(udn)));
            if (deviceList.getDevice(udn) != undefined && deviceList.getDevice(udn) != '') {
                if (deviceList.getDevice(udn).state != undefined && deviceList.getDevice(udn).state != '') {
                    sensors_rule.ruleObj.Devices[udn] = {};

                    if (deviceList.getDevice(udn).state == ruleDrawerVal.ON) {
                        sensors_rule.ruleObj.Devices[udn].StartAction = switchToggleState.TOGGLE;
                        deviceList.setActive(udn, ruleDrawerVal.ON);
                        sensors_rule.ruleObj.Devices[udn].EndAction = "0";
                    }

                    sensors_rule.ruleObj.Devices[udn].FName = deviceList.getDevice(udn).name;
                    wemoUtil.infoLog(TAG, udn + ': ' + JSON.stringify(sensors_rule.ruleObj.Devices[udn]));
                }
            }
        }

        wemoUtil.infoLog(TAG, JSON.stringify(sensors_rule.ruleObj));
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

    selectSensor: function(type, udn) {
    	var sensorRow = $("#sensors_rule_if #sensor_list").children('div [data-udn="' + udn + '"] ');
    	sensorRow.find('.check_mark').show();
    	sensorRow.find('.action_subHeader').html(wemo.items['KeychainButtonSelected']);
    	sensors_rule.updateSelectedSensor(udn, keyChainRuleActionValues.BUTTON_PRESS, true);
    },
    
    
    updateSelectedSensor: function(udn, state, isSelected) {
        if (isSelected) {
            sensors_rule.ruleObj.Sensors[udn] = {};
            sensors_rule.ruleObj.Sensors[udn]['state'] = state;
            sensors_rule.ruleObj.Sensors[udn]['ProductName'] = sensors_rule.sensorDevicesObj[udn].ProductName;
            wemoUtil.infoLog(TAG, "updateSelectedSensor:: " + "Rule Obj -->>>" + JSON
                .stringify(sensors_rule.ruleObj));
        } else {
            delete sensors_rule.ruleObj.Sensors[udn];
            wemoUtil.infoLog(TAG, "updateSelectedSensor:: " + "Rule Obj -->>>" + JSON
                .stringify(sensors_rule.ruleObj));
        }

    },

    deselectSensor: function(udn) {
        var drawerItem = $("#sensors_rule_if #sensor_list").children('div [id="' + udn + '"]');
        var sensorRow = $("#sensors_rule_if #sensor_list").children('div [data-udn="' + udn + '"] ');
        sensorRow.find('.check_mark').hide();
        sensorRow.find('.action_subHeader').empty();
        sensors_rule.updateSelectedSensor(udn, "", false);
    },

    bindEvents: function() {
        wemoUtil.infoLog(TAG , "bindEvents");
        document.addEventListener('online', sensors_rule.onOnline, false);
        document.addEventListener('offline', sensors_rule.onOffline, false);
        document.addEventListener("backbutton", sensors_rule.onBackPress, false);
        document.addEventListener("pause", sensors_rule.onPause, false);
        document.addEventListener("resume", sensors_rule.onResume, false);
    },

    onOffline: function() {
        wemoUtil.infoLog(TAG , "offLine");
    },

    onOnline: function() {
        wemoUtil.infoLog(TAG , "onLine");
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
        window.sessionStorage.setItem(sessionStore.INITIAL_RULE_TAPPED, false);
        if ($(".more_tab").is(":visible")) {
            $(".more_tab").hide();
            $('body').find('.modalWindow').transition({
                opacity: 0
            }, 400, function() {
                $(this).removeClass('isOpen');
            });
        } else {

            wemoUtil.infoLog(TAG , "onBackPress");
            wemoUtil.loadPreviousUrl();
        }
    },

    onPause: function() {
        wemoUtil.infoLog(TAG , "onPause");
    },

    onResume: function() {
        wemoUtil.infoLog(TAG , "onResume");
    },

    reportError: function(e) {
        wemoUtil.infoLog(TAG , "Plugin Error!!!!   " + e);
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
        //sunrise firmware upgrade Popup
        $("#sunrise_firmware_upgrade_later").on("tap", function() {
            $("#sunrise_firmware_upgrade").popup("close");
        });

        $("#sunrise_firmware_upgrade_updatenow").on("tap", function() {
            $("#sunrise_firmware_upgrade").popup("close");
        });

    },


    buildSensorList: function() {
        wemoUtil.infoLog(TAG, "Build sensors list");

        var htmlList = "";

        if (isRemoteEnabled) {
        	var params = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.FOB_DATA);
        	if (params.length > 0) {
        		params = wemoUtil.sortJSONArray(params , key.DEVICE_FRIENDLY_NAME);
        		$.each(params,function(inx) {
        			sensors_rule.sensorDevicesObj[params[inx].udn] ={ProductName: params[inx].ProductName};

        			if (window.sessionStorage.getItem(sessionStore.INITIAL_RULE_TAPPED) === "true") {
        				isInitialRule = true;
        				window.sessionStorage.setItem(sessionStore.INITIAL_RULE_TAPPED, false);
        			}


                    var state ='';
                    for (var dev in sensors_rule.ruleObj.Sensors) {
                    	if (dev == params[inx].udn) {
                            if (sensors_rule.ruleObj.Sensors[dev]['state'] == keyChainRuleActionValues.BUTTON_PRESS) {
                                state = wemo.items['KeychainButtonSelected'];
                            } 
                    	}
                    }
                    
                    // Drawer Implementation
                    htmlList = '<div class="select_sensors_list more_li_clone more_li_clone_top" data-udn="' + params[inx].udn + '">' + '<div class="display_table">' + '<span class="display_cell padding_left_16px">' + '<span class="fname">' + params[inx].friendlyName + '</span>' + '<span class="action_subHeader">' + state + '</span></span></div><span class="check_mark"></span></div> </div>' /*+ '<div class="drawer" id="' + params[inx].udn + '">' + '<div class="drawer_li arrive"><span>' + wemo.items['FobSensorArrives'] + '</span></div>' + '<div class="drawer_li leave"><span>' + wemo.items['FobSensorLeaves'] + '</span></div>' + '</div>'*/;
                    $('#sensor_list').append($(htmlList));
                    if (state != '') {
                        $("#sensors_rule_if #sensor_list").children('div [data-udn="' + params[inx].udn + '"] ').find('.check_mark').show();
                    }
                    
                    if(isInitialRule){
                    	sensors_rule.selectSensor(ruleDrawerVal.ON, params[inx].udn);
                    	isInitialRule = false;
                    }

        		});
        	}


        } else {
            deviceTabPlugin.execute(
                function(params) {
                    if (params.length > 0) {
                    	params = wemoUtil.sortJSONArray(params , key.DEVICE_FRIENDLY_NAME);
                        $.each(params, function(inx) {
                        	
                        	sensors_rule.sensorDevicesObj[params[inx].udn] ={ProductName: params[inx].ProductName};

                            if (window.sessionStorage.getItem(sessionStore.INITIAL_RULE_TAPPED) === "true") {
                            	isInitialRule = true;
                            	window.sessionStorage.setItem(sessionStore.INITIAL_RULE_TAPPED, false);
                            }
                            var state ='';
                            for (var dev in sensors_rule.ruleObj.Sensors) {
                            	if (dev == params[inx].udn) {
                                    if (sensors_rule.ruleObj.Sensors[dev]['state'] == keyChainRuleActionValues.BUTTON_PRESS) {
                                        state = wemo.items['KeychainButtonSelected'];
                                    } 
                            	}
                            }
                            
                            // Drawer Implementation
                            htmlList = '<div class="select_sensors_list more_li_clone more_li_clone_top" data-udn="' + params[inx].udn + '">' + '<div class="display_table">' + '<span class="display_cell padding_left_16px">' + '<span class="fname">' + params[inx].friendlyName + '</span>' + '<span class="action_subHeader">' + state + '</span></span></div><span class="check_mark"></span></div> </div>' /*+ '<div class="drawer" id="' + params[inx].udn + '">' + '<div class="drawer_li arrive"><span>' + wemo.items['FobSensorArrives'] + '</span></div>' + '<div class="drawer_li leave"><span>' + wemo.items['FobSensorLeaves'] + '</span></div>' + '</div>'*/;
                            $('#sensor_list').append($(htmlList));
                            if (state != '') {
                                $("#sensors_rule_if #sensor_list").children('div [data-udn="' + params[inx].udn + '"] ').find('.check_mark').show();
                            }
                            
                            if(isInitialRule){
                            	sensors_rule.selectSensor(ruleDrawerVal.ON, params[inx].udn);
                            	isInitialRule = false;
                            }
                        });
                    }
                },
                function(err) {
                	$("#noSensorsDetectedHeader").html(wemo.items['noSensorsDetectedHeader']);
    				$("#noSensorsDetectedText").html(wemo.items['noSensorsDetectedText']);
    				$("#noSensorsDetected").popup("open");
                },
                actions.SELECT_FOB_SENSOR_DEVICES, []);
        }
        
    }

};
