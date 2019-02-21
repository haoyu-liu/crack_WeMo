/*
 notify_rule_details.js

 Created by Belkin International, Software Engineering on 10/04/2013.
 Copyright (c) 2012-2013 Belkin International, Inc. and/or its affiliates. All rights reserved.

 Belkin International, Inc. retains all right, title and interest (including all
 intellectual property rights) in and to this computer program, which is
 protected by applicable intellectual property laws.  Unless you have obtained
 a separate written license from Belkin International, Inc., you are not authorized
 to utilize all or a part of this computer program for any purpose (including
 reproduction, distribution, modification, and compilation into object code),
 and you must immediately destroy or return to Belkin International, Inc. all copies
 of this computer program.  If you areNotifyMessage licensed by Belkin International, Inc., your
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

var TAG = "notify_rule_details.js: ";
var isSensorNotificaton = false;
var isMakerSensorNotificaton = false;
var isKeyChainPresenceNotification = false;
var isDWNotificationRule = false;
var hasRulePIRSensors = false;
var showTroubleAlert = false;
var isEditMode = false;
var isFWSupported;
var allSensorImage = [];
var UP_TF_IS24 = false; //UP-user preferences, TF-time format


$(document).bind('pageinit', function() {
    rule_details.initialize();
});
$(window).unload(function() {
    if (!isEditMode) {
        window.sessionStorage.setItem(sessionStore.GCM_MAKER_SENSOR, "0");
        window.sessionStorage.setItem(sessionStore.GCM_SENSOR, "0");
        window.sessionStorage.setItem(sessionStore.GCM_KEYCHAIN_PRESENCE, "0");
    }
});

Date.prototype.weekDays = [
    "SundayShort", "MondayShort", "TuesdayShort",
    "WednesdayShort", "ThursdayShort", "FridayShort",
    "SaturdayShort"
];
Date.prototype.ampm = [
    "DateTime_AM", "DateTime_PM"
];


Date.prototype.getMonthName = function() {
    return "DateTime_month" + this.getMonth();
};
Date.prototype.getWeekDay = function() {
    return this.weekDays[this.getDay()];
};

//Get friendly names for devices(switches and sensors)
var av_switches = {},
    av_sensors = {},
    av_makers = {},
    homesense_sensors ={},
    devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SFW_DEVICE_LIST);

var rule_details = {

    initialize: function() {
        console.log(TAG + "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
        if (window.sessionStorage.getItem(sessionStore.GCM_SENSOR) == "1") {
            isSensorNotificaton = true;
        } else if (window.sessionStorage.getItem(sessionStore.GCM_MAKER_SENSOR) == "1") {
            isMakerSensorNotificaton = true;
        }
        
    },
    reportError: function(e) {
        console.log(TAG + "Plugin Failure Call back!!!!   " + e);
        alert(TAG + "Plugin Failure Call back!!!!   " + e);
    },
    onDeviceReady: function() {
        var self = this;
        UP_TF_IS24 = wemoUtil.userPreferences.getTimeFormat();
        
        if (!isRemoteEnabled) {
        $.when(wemoUtil.getDevices(actions.SELECT_SWITCHES), wemoUtil.getDevices(actions.SELECT_INSIGHTS), wemoUtil.getDevices(actions.SELECT_MAKER), wemoUtil.getDevices(actions.SELECT_LED_DEVICES))
            .then(function() {

                rule_details.afterOnDeviceReady();

            }).fail(function() {
                throw ('ERROR');
            });
        }else{
        	rule_details.afterOnDeviceReady();
        }

    },
    afterOnDeviceReady: function() {
        console.log(TAG + "onDeviceReady my rule");
        if (window.sessionStorage.getItem("led_device_length") == "1") {
            $("#find_and_pair_Newdevice").show();
        } else $("#find_and_pair_Newdevice").hide();
        wemoUtil.setTimeFormat();
        rule_details.bindEvents();

        if (!window.sessionStorage.getItem(sessionStore.FIRMWARE_AVAILABLE)) {
            console.log(" #more_new_firmware display none");
            $('#more_new_firmware').addClass('none');
        }

        //To return back to home page: device list tab
        $(".back_btn").on("tap", function(e) {
           wemoUtil.loadUrl(filePath.ENABLED_RULES);
        });


        //Rule Duplicate Popup
        $("#rule_duplicate_learn_more_btn").on("click", function () {
            if (!isRemoteEnabled) {
                deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
            }
            window.open(wemo.items['Help_Rules_Alert_Url'], "_system");
            $("#rule_duplicate").popup("close");
        });
        $("#rule_duplicate_ok_btn").on("click", function () {
            $("#rule_duplicate").popup("close");
            $("#RuleDuplicateText").html("");
        });
    
        //Rule Conflicit Popup
        $("#learn_more_btn").on("click", function () {
            if (!isRemoteEnabled) {
                deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
            }
            window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Help_Rules_Alert_Url']);
            wemoUtil.loadUrl(filePath.HELP_CENTER);
            $("#rule_conflict").popup("close");
        });
        $("#ok_btn").on("click", function () {
            $("#rule_conflict").popup("close");
            $("#RuleConflictSimpleAndTimer").html("");
        });

        //For Rules Support Link
        $("#support_link").on('click', function() {

            if (!isRemoteEnabled) {
                deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
            }
            window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Help_Rules_Creation_Url']);
            window.open(wemo.items['ruleHelpCenter'], "_system");
        });

        var networktype = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_NETWORKTYPE);
        var remoteEnable = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_ENABLE);

        //    alert("networktype : "+networktype+ " remoteEnable : "+remoteEnable);
        if (networktype == networkType.HOME_NETWORK || networktype == null) {
            console.log("Local Mode...");
            var devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SFW_DEVICE_LIST);
            $.each(devices, function(udn) {
                wemoUtil.infoLog(TAG, "udn: " + udn + " friendly name " + devices[udn].friendlyName);
                var uuid = udn;
                var fname = devices[udn].friendlyName;
                if (uuid.indexOf("uuid:Socket") != -1 || uuid.indexOf("uuid:Insight") != -1 || uuid.indexOf("uuid:Lightswitch") != -1) av_switches['"' + uuid + '"'] = fname;
                if (uuid.indexOf("uuid:NetCam") != -1 || uuid.indexOf("uuid:Sensor") != -1) {
                    av_sensors['"' + uuid + '"'] = fname;

                    deviceTabPlugin.execute(function(iconURL) {
                        console.log('allSensorImg >>>>> ' + iconURL);
                        allSensorImage['"' + uuid + '"'] = iconURL;
                    }, null, actions.DEFAULT_ICON_URL, [udn]);


                }
            });
            /*var params = wemoUtil.getDevices(actions.SELECT_SWITCHES);
            $.each(params, function (inx) {
                av_switches['"'+params[inx].udn+'"'] = params[inx].friendlyName;
            });

            params = wemoUtil.getDevices(actions.SELECT_INSIGHTS);
            $.each(params, function (inx) {
                av_switches['"'+params[inx].udn+'"'] = params[inx].friendlyName;
            });

            params = wemoUtil.getDevices(actions.SELECT_SENSORS);
            $.each(params, function (inx) {
                av_switches['"'+params[inx].udn+'"'] = params[inx].friendlyName;
            });*/
            params = wemoUtil.getDevices(actions.SELECT_MAKER);
            $.each(params, function(inx) {
                av_makers['"' + params[inx].udn + '"'] = {
                    name: params[inx].friendlyName,
                    SensorPresent: params[inx].SensorPresent
                };
            });
            
        } else if (networktype == networkType.REMOTE_WIFI || networktype == networkType.REMOTE_MOBILE) {
            if (remoteEnable) {
                var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
                var arrayInisghtObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA);
                var arraySensorObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SENSOR_DATA);
                var arrayMakerObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA);

                if (arraySwitchObjects.length > 0) {
                    $.each(arraySwitchObjects, function(inx) {
                        console.log(TAG + "Remote av_switches: " + arraySwitchObjects[inx][key.DEVICE_UDN] + " " + arraySwitchObjects[inx][key.DEVICE_FRIENDLY_NAME]);
                        av_switches['"' + arraySwitchObjects[inx][key.DEVICE_UDN] + '"'] = arraySwitchObjects[inx][key.DEVICE_FRIENDLY_NAME];
                    });
                } else console.log("No switches detected");

                if (arrayInisghtObjects.length > 0) {
                    $.each(arrayInisghtObjects, function(inx) {
                        console.log(TAG + "Remote av_switches: " + arrayInisghtObjects[inx][key.DEVICE_UDN] + " " + arrayInisghtObjects[inx][key.DEVICE_FRIENDLY_NAME]);
                        av_switches['"' + arrayInisghtObjects[inx][key.DEVICE_UDN] + '"'] = arrayInisghtObjects[inx][key.DEVICE_FRIENDLY_NAME];
                    });
                } else console.log("No insights detected");

                if (arraySwitchObjects.length > 0 || arrayInisghtObjects.length > 0) {
                    rule_details.deviceListBorder();
                }

                if (arraySensorObjects.length > 0) {
                    $.each(arraySensorObjects, function(inx) {


                        console.log('allSensorImg >>>>> ' + JSON.stringify(arraySensorObjects));

                        if (arraySensorObjects[inx].type == "NetCamHDv2" || arraySensorObjects[inx].type == "NetCamHDv1") {
                            allSensorImage['"' + arraySensorObjects[inx].udn + '"'] = "../img/ic_netcam_HD.png";
                        } else {
                            allSensorImage['"' + arraySensorObjects[inx].udn + '"'] = "../img/ic_netcam_nobg@2x.png";
                        }


                        console.log(TAG + "Remote av_sensors: " + arraySensorObjects[inx][key.DEVICE_UDN] + " " + arraySensorObjects[inx][key.DEVICE_FRIENDLY_NAME]);
                        if (arraySensorObjects[inx][key.DEVICE_UDN].match(/NetCam/)) {
                            av_sensors['"' + arraySensorObjects[inx][key.DEVICE_UDN] + '"'] = wemoUtil.extractNetCamName(arraySensorObjects[inx][key.DEVICE_FRIENDLY_NAME]);
                        } else {
                            av_sensors['"' + arraySensorObjects[inx][key.DEVICE_UDN] + '"'] = arraySensorObjects[inx][key.DEVICE_FRIENDLY_NAME];
                        }
                    });

                    rule_details.deviceListBorder();
                } else console.log("No Sensors detected");
                if (arrayMakerObjects.length > 0) {
                    $.each(arrayMakerObjects, function(inx) {
                        console.log(TAG + "Remote av_makers: " + arrayMakerObjects[inx][key.DEVICE_UDN] + " " + arrayMakerObjects[inx][key.DEVICE_FRIENDLY_NAME]);
                        if (arrayMakerObjects[inx][key.DEVICE_UDN].match(/NetCam/)) {
                            av_makers['"' + arrayMakerObjects[inx][key.DEVICE_UDN] + '"'] = wemoUtil.extractNetCamName(arrayMakerObjects[inx][key.DEVICE_FRIENDLY_NAME]);
                        } else {
                            av_makers['"' + arrayMakerObjects[inx][key.DEVICE_UDN] + '"'] = {
                                name: arrayMakerObjects[inx][key.DEVICE_FRIENDLY_NAME],
                                SensorPresent: arrayMakerObjects[inx][key.MAKER_SENSORPRESENT]
                            };
                        }
                    });
                    rule_details.deviceListBorder();
                } else console.log("No Maker sensor is  detected");
            } else {
                navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {
                    loadUrlTimeoutValue: 60000
                });
            }
        }

        //Object Initialization
        var rule = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
        rule.SelectedSensors = '';
        rule.SelectedDayOrRange = '';
        var state = rule.State;
        var selectedRuleID = rule.id;
        var notificationRuleId = 0;
        //            alert(typeof selectedRuleID);

        var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);

        //Get all rows from DB for a specific rule
        db.transaction(getData, getDataErrorCB, getDataSuccessCB);
        trace("rule.id==>" + rule.id);

        function getData(tx) {
            if (isSensorNotificaton || isMakerSensorNotificaton)
                tx.executeSql('SELECT DISTINCT a.*, b.NotifyRuleID, b.NotificationMessage, b.NotificationDuration FROM RULEDEVICES a INNER JOIN SENSORNOTIFICATION b ON b.RuleID = a.RuleID WHERE a.RuleID=?', [selectedRuleID], querySuccess, getDataSuccessCB);
            else
                tx.executeSql('SELECT DISTINCT a.*, b.Message, b.Frequency FROM RULEDEVICES a INNER JOIN RULESNOTIFYMESSAGE b ON b.RuleID = a.RuleID WHERE a.RuleID=?', [selectedRuleID], querySuccess, getDataSuccessCB);

            function querySuccess(tx, results) {
                var sensors = [],
                    switches = [],
                    levels = [],
                    makerSwitch = [],
                    makerSensors = [];
                var len = results.rows.length;
                trace("results.rows.length==>" + len);
                if (len > 0) {
                    for (var i = 0; i < len; i++) {
                        var deviceUdn = results.rows.item(i).DeviceID;
                        var isBridgeUDN = deviceUdn.search(WeMoDevicesUdns.Bridge);
                        
                        if (wemoUtil.isMakerDevice(deviceUdn)) {
                            if (wemoUtil.isMakerSwitch(deviceUdn)) {
                                makerSwitch.push(results.rows.item(i));
                            } else {
                                makerSensors.push(results.rows.item(i));
                            }
                        } else if(isBridgeUDN != -1){
                        	if(results.rows.item(i).ProductName == productName.PIR_SENSORS){
                        		hasRulePIRSensors = true;
                        		sensors.push(results.rows.item(i));
                        	}
                        	else if(results.rows.item(i).ProductName == productName.FOB_SENSORS){
                        		isKeyChainPresenceNotification = true;
                        		sensors.push(results.rows.item(i));
                        	}
                        	else if(results.rows.item(i).ProductName == productName.DW_SENSORS){
                        		isDWNotificationRule = true;
                        		sensors.push(results.rows.item(i));
                        	}
                        } else {
                            if (results.rows.item(i).Type == '0') sensors.push(results.rows.item(i));
                            else if (results.rows.item(i).Type == '-1') switches.push(results.rows.item(i));
                        }
                    }
                    for (var i = 0; i < len; i++) {
                        if (results.rows.item(i).GroupID == "1") levels.push(results.rows.item(i));
                    }

                    trace("switches.length==>" + switches.length);
                    trace("levels.length==>" + levels.length);
                    //Populate rules Object for further editing

                    function trimDays(totDays) {
                        var uniqueDays = [];

                        $.each(totDays, function(i, el) {
                            if ($.inArray(el, uniqueDays) === -1) {
                                uniqueDays.push(el);
                            }

                        });
                        return uniqueDays;

                    }

                    if (makerSwitch.length > 0) {
                        makerLoop();
                    }
                    if (makerSensors.length > 0) {
                        makerSensorLoop();
                    }
                    if (sensors.length > 0) {
                        for (var se = 0; se < sensors.length; se++) {
                            sensorLoop();
                            console.log("sensors - se] - .DeviceID:  " + sensors[se].DeviceID);
                            rule.SelectedSensors += sensors[se].DeviceID + ",";
                            rule.SelectedSensorsValue = sensors[se].Value;
                            console.log("Value : " + rule.SelectedSensorsValue + "\n");

                        }
                        var sens = rule.SelectedSensors;
                        var arrSensors = sens.split(",");
                        console.log("sensors - se] - .DeviceID:  " + arrSensors);
                        arrSensors.pop();
                        rule.SelectedSensors = arrSensors.join(',');
                        var totDays = rule.SelectedDayOrRange.split('-');
                        totDays.pop();
                        rule.SelectedDayOrRange = trimDays(totDays).join('-');
                        console.log("sensors - se] - .DeviceID:rule.SelectedSensors  " + rule.SelectedSensors + "  ::arrSensors  " + arrSensors);

                    } else if (switches.length > 0) {
                        switchLoop();
                    }
                    if (switches.length > 0 || makerSensors.length > 0) {
                        var totDays = rule.SelectedDayOrRange.split('-');
                        totDays.pop();
                        rule.SelectedDayOrRange = trimDays(totDays).join('-');
                        trace("switches.length>0");
                        trace("totDays==>" + totDays.length);
                        trace("rule.SelectedDayOrRange==>" + rule.SelectedDayOrRange);
                    }

                    function switchLoop() {
                        for (var sw = 0; sw < switches.length; sw++) {
                            var day = wemoUtil.returnDay(switches[sw].DayID);
                            var level;
                            for (var j = 0; j < levels.length; j++) {
                                if (levels[j].DeviceID == switches[sw].DeviceID) level = levels[j].Level;
                            }

                            rule.Devices[switches[sw].DeviceID] = {};
                            rule.Devices[switches[sw].DeviceID].StartAction = switches[sw].StartAction;
                            rule.Devices[switches[sw].DeviceID].EndAction = switches[sw].EndAction;
                            rule.Devices[switches[sw].DeviceID].SensorDuration = switches[sw].SensorDuration;
                            rule.Devices[switches[sw].DeviceID].SelectedSensorsValue = switches[sw].Value;
                            rule.Devices[switches[sw].DeviceID].Level = level;
                            rule.Devices[switches[sw].DeviceID].FName = "";

                            rule.When.StartTime = switches[sw].StartTime;
                            rule.When.RuleDuration = switches[sw].RuleDuration;
                            rule.When.OnModeOffset = switches[sw].OnModeOffset;
                            rule.When.OffModeOffset = switches[sw].OffModeOffset;
                            if (isSensorNotificaton || isMakerSensorNotificaton) {
                                rule.NotificationMessage = switches[sw].NotificationMessage;
                                rule.NotifyMessage = switches[sw].NotificationMessage;
                                rule.NotificationDuration = switches[sw].NotificationDuration;
                            } else {
                                rule.Message = switches[sw].Message;
                                rule.NotifyMessage = switches[sw].Message;
                                rule.Frequency = switches[sw].Frequency;
                            }
                            rule.SensorDuration = switches[sw].SensorDuration;
                            notificationRuleId = switches[sw].SensorDuration;
                            console.log("notificationRuleId " + notificationRuleId);
                            rule.SelectedDayOrRange += day + '-';

                            console.log("RuleID : " + rule.id + "\n" +
                                "DeviceID : " + switches[sw].DeviceID + "\n" +
                                "StartAction : " + rule.Devices[switches[sw].DeviceID].StartAction + "\n" +
                                "EndAction : " + rule.Devices[switches[sw].DeviceID].EndAction + "\n" +
                                "SensorDuration :" + rule.Devices[switches[sw].DeviceID].SensorDuration + "\n" +
                                "OnModeOffset :" + rule.When.OnModeOffset + "\n" +
                                "OffModeOffset :" + rule.When.OffModeOffset + "\n" +
                                "Message: " + rule.Message + "\n" +
                                "Frequency: " + rule.Frequency + "\n" +
                                "StartTime : " + rule.When.StartTime);
                        }
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, rule);
                    }

                    function sensorLoop() {
                        for (var sw = 0; sw < sensors.length; sw++) {
                            var day = wemoUtil.returnDay(sensors[sw].DayID);
                            var level;
                            for (var j = 0; j < levels.length; j++) {
                                if (levels[j].DeviceID == sensors[sw].DeviceID) level = levels[j].Level;
                            }

                            rule.Devices[sensors[sw].DeviceID] = {};
                            rule.Devices[sensors[sw].DeviceID].StartAction = sensors[sw].StartAction;
                            rule.Devices[sensors[sw].DeviceID].EndAction = sensors[sw].EndAction;
                            rule.Devices[sensors[sw].DeviceID].SensorDuration = sensors[sw].SensorDuration;
                            rule.Devices[sensors[sw].DeviceID].SelectedSensorsValue = sensors[sw].Value;
                            rule.Devices[sensors[sw].DeviceID].Level = level;
                            rule.Devices[sensors[sw].DeviceID].FName = "";


                            if(av_sensors[sensors[sw].DeviceID] !== undefined){
                                rule.Devices[sensors[sw].DeviceID].information = devices[sensors[sw].DeviceID].information;
                            }




                            if(sensors[sw].ProductName != undefined){
                            	rule.Devices[sensors[sw].DeviceID].ProductName = sensors[sw].ProductName;
                            	rule.Devices[sensors[sw].DeviceID].Level = sensors[sw].Level;
                            }
                            rule.When.StartTime = sensors[sw].StartTime;
                            rule.When.RuleDuration = sensors[sw].RuleDuration;
                            rule.When.OnModeOffset = sensors[sw].OnModeOffset;
                            rule.When.OffModeOffset = sensors[sw].OffModeOffset;
                            rule.NotificationMessage = sensors[sw].NotificationMessage;
                            rule.NotifyMessage = sensors[sw].NotificationMessage;
                            rule.NotificationDuration = sensors[sw].NotificationDuration;
                            rule.SensorDuration = sensors[sw].SensorDuration;
                            notificationRuleId = sensors[sw].NotifyRuleID;
                            console.log("notificationRuleId " + notificationRuleId);
                            rule.SelectedDayOrRange += day + '-';

                            console.log("RuleID : " + rule.id + "\n" +
                                "DeviceID : " + sensors[sw].DeviceID + "\n" +
                                "StartAction : " + rule.Devices[sensors[sw].DeviceID].StartAction + "\n" +
                                "EndAction : " + rule.Devices[sensors[sw].DeviceID].EndAction + "\n" +
                                "SensorDuration :" + rule.Devices[sensors[sw].DeviceID].SensorDuration + "\n" +
                                "OnModeOffset :" + rule.When.OnModeOffset + "\n" +
                                "OffModeOffset :" + rule.When.OffModeOffset + "\n" +
                                "NotifyMessage: " + rule.NotifyMessage + "\n" +
                                "NotificationDuration: " + rule.NotificationDuration + "\n" +
                                "StartTime : " + rule.When.StartTime);
                        }
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, rule);
                    }

                    function makerLoop() {
                        for (var index = 0; index < makerSwitch.length; index++) {
                            //                  			alert(switches[sw]);
                            var day = wemoUtil.returnDay(makerSwitch[index].DayID);
                            var level;
                            for (var j = 0; j < levels.length; j++) {
                                if (levels[j].DeviceID == makerSwitch[index].DeviceID) level = levels[j].Level;
                            }
                            rule.Devices[makerSwitch[index].DeviceID] = {};
                            rule.Devices[makerSwitch[index].DeviceID].StartAction = makerSwitch[index].StartAction;
                            rule.Devices[makerSwitch[index].DeviceID].EndAction = makerSwitch[index].EndAction;
                            rule.Devices[makerSwitch[index].DeviceID].SensorDuration = makerSwitch[index].SensorDuration;
                            rule.Devices[makerSwitch[index].DeviceID].SelectedSensorsValue = makerSwitch[index].Value;
                            rule.Devices[makerSwitch[index].DeviceID].Level = level;
                            rule.Devices[makerSwitch[index].DeviceID].FName = "";

                            rule.When.StartTime = makerSwitch[index].StartTime;
                            rule.When.RuleDuration = makerSwitch[index].RuleDuration;
                            rule.When.OnModeOffset = makerSwitch[index].OnModeOffset;
                            rule.When.OffModeOffset = makerSwitch[index].OffModeOffset;
                            rule.NotificationMessage = makerSwitch[index].NotificationMessage;
                            //                    			rule.NotifyMessage = makerSwitch[index].NotificationMessage;
                            rule.NotificationDuration = makerSwitch[index].NotificationDuration;
                            rule.SensorDuration = makerSwitch[index].SensorDuration;
                            notificationRuleId = makerSwitch[index].SensorDuration;
                            console.log("notificationRuleId " + notificationRuleId);
                            rule.SelectedDayOrRange += day + '-';
                            console.log("RuleID : " + rule.id + "\n" +
                                "DeviceID : " + makerSwitch[index].DeviceID + "\n" +
                                "StartAction : " + rule.Devices[makerSwitch[index].DeviceID].StartAction + "\n" +
                                "EndAction : " + rule.Devices[makerSwitch[index].DeviceID].EndAction + "\n" +
                                "SensorDuration :" + rule.Devices[makerSwitch[index].DeviceID].SensorDuration + "\n" +
                                "NotificationMessage: " + rule.NotificationMessage + "\n" +
                                "NotificationDuration: " + rule.NotificationDuration + "\n" +
                                "Message: " + rule.Message + "\n" +
                                "Frequency: " + rule.Frequency + "\n" +
                                "StartTime : " + rule.When.StartTime);
                        }
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, rule);
                    }

                    function makerSensorLoop() {
                        for (var index = 0; index < makerSensors.length; index++) {
                            //                  			alert(switches[sw]);
                            var day = wemoUtil.returnDay(makerSensors[index].DayID);
                            var level;
                            for (var j = 0; j < levels.length; j++) {
                                if (levels[j].DeviceID == makerSensors[index].DeviceID) level = levels[j].Level;
                            }
                            rule.Devices[makerSensors[index].DeviceID] = {};
                            rule.Devices[makerSensors[index].DeviceID].StartAction = makerSensors[index].StartAction;
                            rule.Devices[makerSensors[index].DeviceID].EndAction = makerSensors[index].EndAction;
                            rule.Devices[makerSensors[index].DeviceID].SensorDuration = makerSensors[index].SensorDuration;
                            rule.Devices[makerSensors[index].DeviceID].SelectedSensorsValue = makerSensors[index].Value;
                            rule.Devices[makerSensors[index].DeviceID].Level = makerSensors[index].StartAction;
                            rule.Devices[makerSensors[index].DeviceID].FName = "";


                            rule.When.StartTime = makerSensors[index].StartTime;
                            rule.When.RuleDuration = makerSensors[index].RuleDuration;
                            rule.When.OnModeOffset = makerSensors[index].OnModeOffset;
                            rule.When.OffModeOffset = makerSensors[index].OffModeOffset;
                            rule.NotificationMessage = makerSensors[index].NotificationMessage;
                            rule.NotifyMessage = makerSensors[index].NotificationMessage;
                            rule.NotificationDuration = makerSensors[index].NotificationDuration;
                            rule.SensorDuration = makerSensors[index].SensorDuration;
                            notificationRuleId = makerSensors[index].NotifyRuleID;
                            console.log("notificationRuleId " + notificationRuleId);
                            rule.SelectedDayOrRange += day + '-';
                            console.log("RuleID : " + rule.id + "\n" +
                                "DeviceID : " + makerSensors[index].DeviceID + "\n" +
                                "StartAction : " + rule.Devices[makerSensors[index].DeviceID].StartAction + "\n" +
                                "EndAction : " + rule.Devices[makerSensors[index].DeviceID].EndAction + "\n" +
                                "SensorDuration :" + rule.Devices[makerSensors[index].DeviceID].SensorDuration + "\n" +
                                "NotificationMessage: " + rule.NotificationMessage + "\n" +
                                "NotificationDuration: " + rule.NotificationDuration + "\n" +
                                "Message: " + rule.NotifyMessage + "\n" +
                                "Frequency: " + rule.NotificationDuration + "\n" +
                                "StartTime : " + rule.When.StartTime);
                        }
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, rule);
                    }
                    

                    //Adding the LocationInfo to RulesNew Object

                    tx.executeSql('SELECT * FROM LOCATIONINFO', [],
                        function(tx, results) {
                            var len = results.rows.length;
                            if (len > 0) {
                                var locationInfo = {};

                                console.log("LOCATIONINFO - Records Len -   " + len);
                                for (var i = 0; i < len; i++) {

                                    locationInfo.cityName = results.rows.item(0).cityName;
                                    locationInfo.countryName = results.rows.item(0).countryName;
                                    locationInfo.latitude = results.rows.item(0).latitude;
                                    locationInfo.longitude = results.rows.item(0).longitude;
                                    locationInfo.countryCode = results.rows.item(0).countryCode;
                                    locationInfo.region = results.rows.item(0).region;
                                    console.log("LOCATIONINFO - Records    " + locationInfo.cityName + "  ::  " + locationInfo.countryName + "  ::  " + locationInfo.latitude + "  ::  " + locationInfo.longitude + "  ::  " + locationInfo.countryCode + "  ::  " + locationInfo.region + "  ::  ");
                                }
                                rule[sessionStore.LOCATION_INFO] = locationInfo;
                                wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, rule);
                            }
                        },
                        errorCB);

                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, rule);
                    	rule_details.populateContent(switches, sensors, db, rule, av_switches, av_sensors, av_makers,homesense_sensors, levels);
                    	rule_details.ruleEventsOnCloud(notificationRuleId);
                }

            }
        }

        function getDataErrorCB() {
            console.log("Error Selecting records");
        }

        function getDataSuccessCB() {
            console.log('Successfully retrived DB');
        }

        $("#modify_rule").on("tap", function() {
            if (rule.RuleType == sessionStore.INSIGHT_RULE || rule.RuleType == sessionStore.NOTIFY_ME || rule.RuleType == sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE) {
            	if (rule.RuleType == "Notify Me") {
            		isEditMode = true;
            		if(isKeyChainPresenceNotification){
            			 window.sessionStorage.setItem(sessionStore.GCM_SENSOR, "0");
            			rule.RuleType = sessionStore.NOTIFY_KEYCHAIN_PRESENCE_RULE;
            			window.sessionStorage.setItem(sessionStore.GCM_KEYCHAIN_PRESENCE, "1");
            			window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify(sessionStore.NOTIFY_KEYCHAIN_PRESENCE_RULE));
            			wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, rule);
            		}
            		else if(isDWNotificationRule){
            			 window.sessionStorage.setItem(sessionStore.GCM_SENSOR, "0");
            			rule.RuleType = sessionStore.NOTIFY_DOOR_WINDOW_RULE;
            			window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify(sessionStore.NOTIFY_DOOR_WINDOW_RULE));
            			window.sessionStorage.setItem(sessionStore.GCM_DOOR_WINDOW, true);
            			wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, rule);
            		}	
            		else
            			window.sessionStorage.setItem(sessionStore.GCM_SENSOR, "1");
            	} else if (rule.RuleType == sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE) {
                    isEditMode = true;
                    window.sessionStorage.setItem(sessionStore.GCM_MAKER_SENSOR, "1");
                }
                window.sessionStorage.setItem(sessionStore.isEditNotificationRule, "edit_notification_rule");
                wemoUtil.loadUrl(filePath.NOTIFY_RULE);
            }

        });

        $("#rule_delete").on("tap", function() {
            db.transaction(deleteData, errorCB, successCB);
        });

        function deleteData(tx) {
            tx.executeSql("SELECT RuleID FROM RULES", [], querySuccessful, errorCB);
            tx.executeSql("DELETE FROM RULES WHERE RuleID='" + selectedRuleID + "'", [], function() {
               wemoUtil.infoLog(TAG, "DELETE FROM RULES table RuleID=" + selectedRuleID);
            }, errorCB);
            tx.executeSql("DELETE FROM RULEDEVICES WHERE RuleID=" + parseInt(selectedRuleID), [], function() {
                wemoUtil.infoLog(TAG, "DELETE FROM RULEDEVICES table RuleID=" + selectedRuleID);
            }, errorCB);
            tx.executeSql("DELETE FROM DEVICECOMBINATION WHERE RuleID=" + parseInt(selectedRuleID), [], function() {
                wemoUtil.infoLog(TAG, "DELETE FROM DEVICECOMBINATION table RuleID=" + selectedRuleID);
            }, errorCB);
            if (isSensorNotificaton || isMakerSensorNotificaton) {
                tx.executeSql("DELETE FROM SENSORNOTIFICATION WHERE RuleID=" + parseInt(selectedRuleID), [], getAllRules, errorCB);
            } else {
                tx.executeSql("DELETE FROM RULESNOTIFYMESSAGE WHERE RuleID=" + parseInt(selectedRuleID), [], getAllRules, errorCB);
            }

            if (Object.keys(rule.Devices).length > 0) {
                for (var dev = 0; dev < Object.keys(rule.Devices).length; dev++) {
                    console.log(JSON.stringify(rule.Devices));
                    var msgStr = [rule.Devices[Object.keys(rule.Devices)[dev]].SensorDuration, Object.keys(rule.Devices)[dev]];

                    deviceTabPlugin.execute(
                        function(e) {
                            console.log(e);
                        },
                        wemoUtil.reportError,
                        actions.DELETE_NOTIFY_RULE,
                        msgStr);
                }
            }
        }

        function querySuccessful(tx, results) {
            if (results.rows.length == 1) {
                window.sessionStorage.setItem(sessionStore.LAST_ENTRY, "1");
                window.sessionStorage.setItem("create_rule", "1");
            }
        }

        function updateData(tx) {
            tx.executeSql("UPDATE RULES SET State=? WHERE RuleID=?", [state, selectedRuleID], getAllRules, errorCB);

        }

        function getAllRules(tx) {
            tx.executeSql("SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.Level, b.ZBCapabilityStart, b.ZBCapabilityEnd from RULES a inner join RULEDEVICES b on a.RuleID=CAST(b.RuleID AS CHAR) order by a.Name COLLATE NOCASE", [], querySuccess, errorCB);
        }

        function querySuccess(tx, results) {
            var len = results.rows.length;
            var ruleRows = [];
            if (len > 0) {
                for (var i = 0; i < len; i++) {
                    ruleRows[i] = results.rows.item(i);

                     wemoUtil.infoLog(TAG,"Print DB values = " + ruleRows[i].RuleID + " :: " +
                        ruleRows[i].Name + " :: " +
                        ruleRows[i].DayID);
                }

            }


            window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));

        }

        function errorCB() {
            console.log("Error!");
        }

        function successCB() {
            var text = wemo.items['RULE_STATUS_DELETING_RULE'];
            var string = $('<p>' + text + '</p>').text();
            nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", string]);

            for (var dev1 = 0; dev1 < Object.keys(rule.Devices).length; dev1++) {
                var udn = Object.keys(rule.Devices)[dev1];
                if (wemoUtil.isMakerDevice(udn)) {
                    wemoUtil.pushScheduleSwitch(wemoUtil.getMakerSensorUDN(udn), dev1, Object.keys(rule.Devices).length);
                } else {
                    wemoUtil.pushScheduleSwitch(Object.keys(rule.Devices)[dev1], dev1, Object.keys(rule.Devices).length);
                }
            }
            window.sessionStorage.setItem(sessionStore.LAST_ENTRY, "0");
        }

    },

    populateContent: function(switches, sensors, db, rule, av_switches, av_sensors, av_makers,homesense_sensors, levels) {
        var days = "";
        var selectedRuleID = rule.id;
        console.log("selected range " + rule.SelectedDayOrRange);
        trace("levels.length " + levels.length);
        if (rule.SelectedDayOrRange == "Weekday" || rule.SelectedDayOrRange == "Weekend" || rule.SelectedDayOrRange == "Daily") {
            if (rule.SelectedDayOrRange == "Weekday") {
                days = wemo.items['WeekdaysNoDetails'];
            } else if (rule.SelectedDayOrRange == "Weekend") {
                days = wemo.items['WeekendsNoDetails'];
            } else {
                days = wemo.items[rule.SelectedDayOrRange];
            }
        } else if (rule.SelectedDayOrRange == "Weekdays" || rule.SelectedDayOrRange == "Weekends" || rule.SelectedDayOrRange == "Daily") {
            if (rule.SelectedDayOrRange == "Weekdays") {
                days = wemo.items['WeekdaysNoDetails'];
            } else if (rule.SelectedDayOrRange == "Weekends") {
                days = wemo.items['WeekendsNoDetails'];
            } else {
                days = wemo.items[rule.SelectedDayOrRange];
            }
        } else if (rule.SelectedDayOrRange == wemo.items['WeekdaysDetails']) {
            days = wemo.items['WeekdaysNoDetails'];
        } else if (rule.SelectedDayOrRange == wemo.items['WeekendsDetails']) {
            days = wemo.items['WeekendsNoDetails'];
        } else if (rule.SelectedDayOrRange == wemo.items['DailyDetails']) {
            days = wemo.items['Daily'];
        } else {
            var strDays = rule.SelectedDayOrRange;
            var arrDays = strDays.split("-");
            var displaySelectedVal = [];
            var tempSelectedDayOrRange = "";

            if (arrDays.length > 0) {
                for (var i = 0; i < arrDays.length; i++) {

                    var temp = arrDays[i];
                    console.log("temp val " + temp);

                    if (temp == "Mon") {
                        displaySelectedVal[i] = wemo.items['MondayShort'];
                    }
                    if (temp == "Tue") {
                        displaySelectedVal[i] = wemo.items['TuesdayShort'];
                    }
                    if (temp == "Wed") {
                        displaySelectedVal[i] = wemo.items['WednesdayShort'];
                    }
                    if (temp == "Thu") {
                        displaySelectedVal[i] = wemo.items['ThursdayShort'];
                    }
                    if (temp == "Fri") {
                        displaySelectedVal[i] = wemo.items['FridayShort'];
                    }
                    if (temp == "Sat") {
                        displaySelectedVal[i] = wemo.items['SaturdayShort'];
                    }
                    if (temp == "Sun") {
                        displaySelectedVal[i] = wemo.items['SundayShort'];
                    }
                    console.log("transforming value " + displaySelectedVal[i]);
                }

                if (arrDays.length == 1) {
                    tempSelectedDayOrRange = displaySelectedVal;
                } else if (arrDays.length == 7) {
                    tempSelectedDayOrRange = wemo.items['Daily'];
                } else {
                    tempSelectedDayOrRange = displaySelectedVal.join(",");
                }

            }
            days = tempSelectedDayOrRange;
            trace("days==>" + days);
        }

        var heading;
        var switchDetails = $("<ul id='rule_details_list' class='rule_details_list'></ul>");
        var switchList = '',
            sensorList = '';

        var friendlyName = '',
            sensorfriendlyName = '';

        if (rule.RuleType == sessionStore.SIMPLE_SWITCH) {

            var displayDate = "";
            var tempStartTime = "" + rule.When.StartTime;
            console.log(rule.RuleType + "  SRSS:  " + rule.When.StartSRSS + "  ::  " + tempStartTime.substr(tempStartTime.length - 1, tempStartTime.length));
            if (tempStartTime.substr(tempStartTime.length - 1, tempStartTime.length) == 1) {
                rule.When.StartSRSS = "Sunrise";
            } else if (tempStartTime.substr(tempStartTime.length - 1, tempStartTime.length) == 2) {
                rule.When.StartSRSS = "Sunset";
            }

            window.sessionStorage.setItem(sessionStore.SR_SS, JSON.stringify(rule.When.StartSRSS));

            if (rule.When.StartSRSS == "Sunrise" || rule.When.StartSRSS == "Sunset") {

                if (rule.When.StartSRSS == "Sunrise") {
                    displayDate = "<span class='capitalize'>" + wemo.items['SunRise'] + "</span>";
                } else if (rule.When.StartSRSS == "Sunset") {
                    displayDate = "<span class='capitalize'>" + wemo.items['SunSet'] + "</span>";
                }

            } else {
                displayDate = wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24);
            }

            /*Temp display Localization values */

            var rulenameObj = rule.RuleName;
            var tempDisRulename = "";

            if (rulenameObj.indexOf("Rule") != -1) {
                tempDisRulename = rulenameObj.replace("Rule", wemo.items["Rule"]);
            } else {
                tempDisRulename = rulenameObj;
            }
            trace("rulenameObj==>" + rulenameObj);

//            heading = "<div class='rule'>" +
//                "<p class='rule_heading'>" + tempDisRulename + "</p>" +
//                "<p class='rule_details'><span class='rule_time'>" + displayDate + ", " + "</span><span class='rule_day'>" + days + "</span></p>" +
//                "</div>";

            $(".ruleTitle").html(tempDisRulename);
            trace("heading==>" + heading);
            if (Object.keys(rule.Devices).length > 0) {

                for (key in rule.Devices) {

                    if (av_switches['"' + key + '"'] == undefined)
                        friendlyName = wemo.items['SwitchNotFound'];
                    else
                        friendlyName = av_switches['"' + key + '"'];

                    var iconURL = '';

                    if (iconURL === null || iconURL == '') {

                        if (key.indexOf('Lightswitch') != -1) {
                            iconURL = "../img/new_icons/WeMo_LightSwitch_@3x.png";
                        }
                        if (key.indexOf('Socket') != -1) {
                            iconURL = "../img/new_icons/WeMo_Switch_Old_@3x.png";
                        }
                    }

                    if (rule.When.StartSRSS == "Sunrise" || rule.When.StartSRSS == "Sunset") {
                        var state = wemoUtil.returnSwitchStatus(rule.Devices[key].StartAction);

                        if (state == "Turns On") {
                            state = wemo.items['SwitchActionTurnOn'];
                        } else if (state == "Turns Off") {
                            state = wemo.items['SwitchActionTurnOff'];
                        } else if (state == "Does Nothing") {
                            state = wemo.items['SwitchActionNothing'];
                        }


                        switchList += "<li><div class='rule_img'><img src='" + iconURL + "'></div>" +
                            "<div class='rule_details_device'>" +
                            "<div class='rule_details_device_name'>" + friendlyName + "</div>" +
                            "<div class='rule_details_state'> <span class='state'>" + state + "</span> at <span class='time'>" + displayDate + "</span></div>" +
                            "</div></li>";
                    } else {

                        var state = wemoUtil.returnSwitchStatus(rule.Devices[key].StartAction);
                        if (state == "Turns On") {
                            state = wemo.items['SwitchActionTurnOn'];
                        } else if (state == "Turns Off") {
                            state = wemo.items['SwitchActionTurnOff'];
                        } else if (state == "Does Nothing") {
                            state = wemo.items['SwitchActionNothing'];
                        }

                        var n = state.split(" ");
                        var stateClass = '';
                        state = "<span class='first'>" + n[0] + "</span>";
                        if (n[1] != undefined) {
                            state += "<span class='second'>" + " " + n[1] + "</span>";
                        }

                        if (rule.Devices[key].StartAction == 1) {
                            stateClass = ' green';
                        } else {
                            stateClass = ' black';
                        }

                        switchList += "<li><div class='rule_img'><img src='" + iconURL + "'></div>" +
                            "<div class='rule_details_device'>" +
                            "<div class='rule_details_device_name'>" + friendlyName + "</div>" +
                            "<div class='rule_details_state" + stateClass + "'> <span class='state'>" + state + "</span> at <span class='time'>" + wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24) + "</span></div>" +
                            "</div></li>";
                    }
                }

            }


        } else if (rule.RuleType == sessionStore.TIME_INTERVAL) {
            var displayDate = "";

            var tempStartTime = "" + rule.When.StartTime;
            if (tempStartTime.slice(-1) == "1") {
                rule.When.StartSRSS = "Sunrise";
            } else if (tempStartTime.slice(-1) == "2") {
                rule.When.StartSRSS = "Sunset";
            }
            var tempEndTime = "" + parseInt(parseInt(rule.When.RuleDuration) + parseInt(rule.When.StartTime));
            // alert()
            console.log(rule.RuleType + "  SRSS:  " + tempEndTime + "  :: Rule Duration  " + parseInt(rule.When.RuleDuration) + "  STIME ::  " + parseInt(rule.When.StartTime));
            if (tempEndTime.slice(-1) == "1") {
                rule.When.EndSRSS = "Sunrise";
            } else if (tempEndTime.slice(-1) == "2") {
                rule.When.EndSRSS = "Sunset";
            }


            rule.When.EndTime = parseInt(rule.When.StartTime) + parseInt(rule.When.RuleDuration);
            if (parseInt(rule.When.EndTime) > 86400) {
                rule.When.EndTime = parseInt(rule.When.EndTime - 86400);
            }
            if (rule.When.EndTime != timestamp.MIDNIGHT_END_TIME) rule.When.EndTime = (Math.ceil((rule.When.EndTime / 10))) * 10;
            console.log("tempStartTime :: " + tempStartTime + "  tempEndTime :: " + tempEndTime + "  ST SRSS :: " + rule.When.StartSRSS + '    End SRSS :: ' + rule.When.EndSRSS + '  End Time ' + rule.When.EndTime);
            if (rule.When.StartSRSS == undefined && rule.When.EndSRSS == undefined) {
                if (rule.When.EndTime != timestamp.MIDNIGHT_END_TIME) displayDate = wemoUtil.returnTime(rule.When.StartTime, (Math.ceil((rule.When.RuleDuration / 10))) * 10);
                else displayDate = wemoUtil.returnTime(rule.When.StartTime, rule.When.RuleDuration);
            } else if (rule.When.StartSRSS == undefined && rule.When.EndSRSS != undefined) {

                if (rule.When.EndSRSS == "Sunrise") {
                    var tempEndSRSS = wemo.items['SunRise'];
                } else if (rule.When.EndSRSS == "Sunset") {
                    var tempEndSRSS = wemo.items['SunSet'];
                } else {
                    var tempEndSRSS = rule.When.EndSRSS;
                }

                //displayDate=(wemoUtil.convertMillisecondsToAMPM(rule.When.StartTime)+" - "+tempEndSRSS)+" ,";
                displayDate = (wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24) + " - <span class='capitalize'>" + tempEndSRSS) + "</span> ,";
            } else if (rule.When.StartSRSS != undefined && rule.When.EndSRSS == undefined) {

                if (rule.When.StartSRSS == "Sunrise") {
                    var tempStartSRSS = wemo.items['SunRise'];
                } else if (rule.When.StartSRSS == "Sunset") {
                    var tempStartSRSS = wemo.items['SunSet'];
                } else {
                    var tempStartSRSS = rule.When.StartSRSS;
                }

                displayDate = "<span class='capitalize'>" + (tempStartSRSS + "</span> - " + wemoUtil.convertMillisecondsToTF(rule.When.EndTime, UP_TF_IS24)) + " ,";
            } else if (rule.When.StartSRSS != undefined && rule.When.EndSRSS != undefined) {

                if (rule.When.StartSRSS == "Sunrise") {
                    var tempStartSRSS = wemo.items['SunRise'];
                } else if (rule.When.StartSRSS == "Sunset") {
                    var tempStartSRSS = wemo.items['SunSet'];
                } else {
                    var tempStartSRSS = rule.When.StartSRSS;
                }

                if (rule.When.EndSRSS == "Sunrise") {
                    var tempEndSRSS = wemo.items['SunRise'];
                } else if (rule.When.EndSRSS == "Sunset") {
                    var tempEndSRSS = wemo.items['SunSet'];
                } else {
                    var tempEndSRSS = rule.When.EndSRSS;
                }

                displayDate = "<span class='capitalize'>" + (tempStartSRSS + " - " + tempEndSRSS) + "</span> ,";
            }

            //alert('displayDate'+displayDate);
            /*Temp display Localization values */

            var rulenameObj = rule.RuleName;
            var tempDisRulename = "";

            if (rulenameObj.indexOf("Rule") != -1) {
                tempDisRulename = rulenameObj.replace("Rule", wemo.items["Rule"]);
            } else {
                tempDisRulename = rulenameObj;
            }
            var currentlyActive = wemo.items['RuleStateActive'];
//            heading = "<div class='rule'>" +
//                "<p class='rule_heading'>" + tempDisRulename + "</p>" +
//                "<p class='rule_details'><span class='rule_time'>" + displayDate + "</span><span class='rule_day'>" + days + "</span></p>" +
//                "<p class='enabled_rules_active ruleDisable'>" + currentlyActive + "</p></div>";

            $(".ruleTitle").html(tempDisRulename);
            if (Object.keys(rule.Devices).length > 0) {

                var displayStartDate, displayEndDate;
                for (key in rule.Devices) {

                    if (av_switches['"' + key + '"'] == undefined)
                        friendlyName = wemo.items['SwitchNotFound'];
                    else
                        friendlyName = av_switches['"' + key + '"'];

                    rule.When.EndTime = parseInt(rule.When.StartTime) + parseInt(rule.When.RuleDuration);
                    if (rule.When.EndTime != timestamp.MIDNIGHT_END_TIME) rule.When.EndTime = (Math.ceil((rule.When.EndTime / 10))) * 10;
                    if (rule.When.EndTime > timestamp.MAX_HOUR) {
                        rule.When.EndTime = rule.When.EndTime - timestamp.MAX_HOUR;
                    }

                    if (rule.When.StartSRSS == "" || rule.When.StartSRSS == undefined) {
                        displayStartDate = wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24);
                    } else if (rule.When.StartSRSS != "" || rule.When.StartSRSS != undefined) {

                        if (rule.When.StartSRSS == "Sunrise" || rule.When.StartSRSS == "Sunset") {

                            if (rule.When.StartSRSS == "Sunrise") {
                                displayStartDate = "<span class='capitalize'>" + wemo.items['SunRise'] + "</span>";
                            } else if (rule.When.StartSRSS == "Sunset") {
                                displayStartDate = "<span class='capitalize'>" + wemo.items['SunSet'] + "</span>";
                            }

                        } else {
                            displayStartDate = rule.When.StartSRSS;
                        }

                    }

                    if (rule.When.EndSRSS == "" || rule.When.EndSRSS == undefined) {
                        displayEndDate = wemoUtil.convertMillisecondsToTF(rule.When.EndTime, UP_TF_IS24);
                    } else if (rule.When.EndSRSS != "" || rule.When.EndSRSS != undefined) {

                        if (rule.When.EndSRSS == "Sunrise" || rule.When.EndSRSS == "Sunset") {

                            if (rule.When.EndSRSS == "Sunrise") {
                                displayEndDate = "<span class='capitalize'>" + wemo.items['SunRise'] + "</span>";
                            } else if (rule.When.EndSRSS == "Sunset") {
                                displayEndDate = "<span class='capitalize'>" + wemo.items['SunSet'] + "</span>";
                            }

                        } else {
                            displayEndDate = rule.When.EndSRSS;
                        }

                    }

                    var iconURL = '';
//                    nativeUtilPlugin.execute(
//                        function(base64String) {
//                            console.log('got image from DB success');
//                            iconURL = "data:image/png;base64, " + base64String;
//                        },
//                        rule_details.reportError,
//                        actions.GET_BASE64_IMAGE_FROM_DB, [key]
//                    );

                    if (iconURL === null || iconURL == '') {
                        if (key.indexOf('Lightswitch') != -1) {
                            iconURL = "../img/new_icons/WeMo_LightSwitch_@3x.png";
                        }
                        if (key.indexOf('Socket') != -1) {
                            iconURL = "../img/new_icons/WeMo_Switch_Old_@3x.png";
                        }
                    }

                    var Startstate = wemoUtil.returnSwitchStatus(rule.Devices[key].StartAction);
                    var Endstate = wemoUtil.returnSwitchStatus(rule.Devices[key].EndAction);
                    var stateClass = '';
                    var n = Startstate.split(" ");
                    Startstate = "<span class='first'>" + n[0] + "</span>";
                    if (n[1] != undefined) {
                        Startstate += "<span class='second'>" + " " + n[1] + "</span>";
                    }
                    var n = Endstate.split(" ");
                    Endstate = "<span class='third'>" + n[0] + "</span>";
                    if (n[1] != undefined) {
                        Endstate += "<span class='four'>" + " " + n[1] + "</span>";
                    }
                    if (rule.Devices[key].StartAction == 1) {
                        stateClass = ' green';
                    } else {
                        stateClass = ' black';
                    }

                    /* if(Startstate == "Turns On"){ Startstate = wemo.items['SwitchActionTurnOn'];}
                     else if(Startstate == "Turns Off"){Startstate = wemo.items['SwitchActionTurnOff'];}
                     else if(Startstate == "Does Nothing"){Startstate = wemo.items['SwitchActionNothing'];}

                     if(Endstate == "Turns On"){ Endstate = wemo.items['SwitchActionTurnOn'];}
                     else if(Endstate == "Turns Off"){Endstate = wemo.items['SwitchActionTurnOff'];}
                     else if(Endstate == "Does Nothing"){Endstate = wemo.items['SwitchActionNothing'];}*/

                    switchList += "<li><div class='rule_img'><img src='" + iconURL + "'></div>" +
                        "<div class='rule_details_device'>" +
                        "<div class='rule_details_device_name'>" + friendlyName + "</div>" +
                        "<div class='rule_details_state" + stateClass + "'> <span class='state'>" + Startstate + "</span> at <span class='time'>" + displayStartDate + "</span></div>" +
                        "<div>and <span class='state'>" + Endstate + "</span> at <span class='time'>" + displayEndDate + "</span></div>" +
                        "</div></li>";
                    //alert('switchList'+switchList);
                }

            }

        } else if (rule.RuleType == sessionStore.MOTION_CONTROLLED) {

            //----------------------Disable SRSS Link in More Meneu -------------------------------//
            var displayDate = "";

            var tempStartTime = "" + rule.When.StartTime;
            if (tempStartTime.slice(-1) == "1") {
                rule.When.StartSRSS = "Sunrise";
            } else if (tempStartTime.slice(-1) == "2") {
                rule.When.StartSRSS = "Sunset";
            }


            var tempEndTime = "" + parseInt(parseInt(rule.When.RuleDuration) + parseInt(rule.When.StartTime));
            // alert()
            console.log(rule.RuleType + "  SRSS:  " + tempEndTime + "  :: Rule Duration  " + parseInt(rule.When.RuleDuration) + "  STIME ::  " + parseInt(rule.When.StartTime));
            if (tempEndTime.slice(-1) == "1") {
                rule.When.EndSRSS = "Sunrise";
            } else if (tempEndTime.slice(-1) == "2") {
                rule.When.EndSRSS = "Sunset";
            }


            rule.When.EndTime = parseInt(rule.When.StartTime) + parseInt(rule.When.RuleDuration);
            if (parseInt(rule.When.EndTime) > 86400) {
                rule.When.EndTime = parseInt(rule.When.EndTime - 86400);
            }
            if (rule.When.EndTime != timestamp.MIDNIGHT_END_TIME) rule.When.EndTime = (Math.ceil((rule.When.EndTime / 10))) * 10;
            console.log("tempStartTime :: " + tempStartTime + "  tempEndTime :: " + tempEndTime + "  ST SRSS :: " + rule.When.StartSRSS + '    End SRSS :: ' + rule.When.EndSRSS + '  End Time ' + rule.When.EndTime);
            if (rule.When.StartSRSS == undefined && rule.When.EndSRSS == undefined) {
                if (rule.When.StartTime == sessionStore.ALLDAY_STARTTIME && rule.When.EndTime == sessionStore.ALLDAY_ENDTIME) {
                    displayDate = sessionStore.SENSOR_ALLDAY + ", "
                } else {
                    if (rule.When.EndTime != timestamp.MIDNIGHT_END_TIME) displayDate = wemoUtil.returnTime(rule.When.StartTime, (Math.ceil((rule.When.RuleDuration / 10))) * 10);
                    else displayDate = wemoUtil.returnTime(rule.When.StartTime, rule.When.RuleDuration);
                }
            } else if (rule.When.StartSRSS == undefined && rule.When.EndSRSS != undefined) {

                if (rule.When.EndSRSS == "Sunrise") {
                    var tempEndSRSS = wemo.items['SunRise'];
                } else if (rule.When.EndSRSS == "Sunset") {
                    var tempEndSRSS = wemo.items['SunSet'];
                } else {
                    var tempEndSRSS = rule.When.EndSRSS;
                }

                displayDate = (wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24) + " - <span class='capitalize'>" + tempEndSRSS) + "</span> ,";
            } else if (rule.When.StartSRSS != undefined && rule.When.EndSRSS == undefined) {

                if (rule.When.StartSRSS == "Sunrise") {
                    var tempStartSRSS = wemo.items['SunRise'];
                } else if (rule.When.StartSRSS == "Sunset") {
                    var tempStartSRSS = wemo.items['SunSet'];
                } else {
                    var tempStartSRSS = rule.When.StartSRSS;
                }

                displayDate = "<span class='capitalize'>" + (tempStartSRSS + "</span> - " + wemoUtil.convertMillisecondsToTF(rule.When.EndTime, UP_TF_IS24)) + " ,";
            } else if (rule.When.StartSRSS != undefined && rule.When.EndSRSS != undefined) {

                if (rule.When.StartSRSS == "Sunrise") {
                    var tempStartSRSS = wemo.items['SunRise'];
                } else if (rule.When.StartSRSS == "Sunset") {
                    var tempStartSRSS = wemo.items['SunSet'];
                } else {
                    var tempStartSRSS = rule.When.StartSRSS;
                }

                if (rule.When.EndSRSS == "Sunrise") {
                    var tempEndSRSS = wemo.items['SunRise'];
                } else if (rule.When.EndSRSS == "Sunset") {
                    var tempEndSRSS = wemo.items['SunSet'];
                } else {
                    var tempEndSRSS = rule.When.EndSRSS;
                }

                displayDate = "<span class='capitalize'>" + (tempStartSRSS + " - " + tempEndSRSS) + "</span> ,";
            }


            //----------------------Disable SRSS Link in More Meneu -------------------------------//

            /*var ruleTime="";
             rule.When.EndTime=parseInt(rule.When.StartTime)+parseInt(rule.When.RuleDuration)*/

            /*Temp display Localization values */

            var rulenameObj = rule.RuleName;
            var tempDisRulename = "";

            if (rulenameObj.indexOf("Rule") != -1) {
                tempDisRulename = rulenameObj.replace("Rule", wemo.items["Rule"]);
            } else {
                tempDisRulename = rulenameObj;
            }
            var currentlyActive = wemo.items['RuleStateActive'];


//            heading = "<div class='rule'>" +
//                "<p class='rule_heading'>" + tempDisRulename + "</p>" +
//                "<p class='rule_details'><span class='rule_time'>" + displayDate + "</span><span class='rule_day'>" + days + "</span></p>" +
//                "<p class='enabled_rules_active ruleDisable'>" + currentlyActive + "</p></div></div>";

            $(".ruleTitle").html(tempDisRulename);
            if (Object.keys(rule.Devices).length > 0) {

                for (key in rule.Devices) {

                    var iconURL = '';
//                    nativeUtilPlugin.execute(
//                        function(base64String) {
//                            console.log('got image from DB success');
//                            iconURL = "data:image/png;base64, " + base64String;
//                        },
//                        rule_details.reportError,
//                        actions.GET_BASE64_IMAGE_FROM_DB, [key]
//                    );

                    if (iconURL === null || iconURL == '') {
                        if (key.indexOf('Lightswitch') != -1) {
                            iconURL = "../img/new_icons/WeMo_LightSwitch_@3x.png";
                        }
                        if (key.indexOf('Socket') != -1) {
                            iconURL = "../img/new_icons/WeMo_Switch_Old_@3x.png";
                        }
                    }

                    if (av_switches['"' + key + '"'] == undefined)
                        friendlyName = wemo.items['SwitchNotFound'];
                    else
                        friendlyName = av_switches['"' + key + '"'];
                    if (rule.Devices[key].StartAction == '2') {

                        var Startstate = wemoUtil.returnSwitchStatus(rule.Devices[key].StartAction);
                        var Endstate = wemoUtil.returnSwitchVal(rule.Devices[key].EndAction);
                        var stateClass = '';
                        var n = Startstate.split(" ");
                        Startstate = "<span class='first'>" + n[0] + "</span>";
                        if (n[1] != undefined) {
                            Startstate += "<span class='second'>" + " " + n[1] + "</span>";
                        }
                        var n = Endstate.split(" ");
                        Endstate = "<span class='third'>" + n[0] + "</span>";
                        if (n[1] != undefined) {
                            Endstate += "<span class='four'>" + " " + n[1] + "</span>";
                        }
                        if (rule.Devices[key].StartAction == 1) {
                            stateClass = ' green';
                        } else {
                            stateClass = ' black';
                        }

                        var n = wemoUtil.formatMins(rule.Devices[key].SensorDuration).split(" ");
                        if (n[0] != undefined) {
                            n = n[0];
                        }
                        var string = n + " " + wemo.items['minutes'];

                        var afterMotionStop = wemo.items['AfterMotionStops'];
                        switchList += "<li><div class='rule_img'><img src='" + iconURL + "'></div>" +
                            "<div class='rule_details_device'>" +
                            "<div class='rule_details_device_name'>" + friendlyName + "</div>" +
                            "<div class='rule_details_state " + stateClass + "'><span class='state'>" + Startstate + "</span></div>" +
                            "<div>" + Endstate + " for <span class='state'>" + string + "<br><span class='lowerCase'>" + afterMotionStop + "</span></span></div>" +
                            "</div></li>";
                    } else if (rule.Devices[key].StartAction != '2' && rule.Devices[key].EndAction == '2') {

                        var Startstate = wemoUtil.returnSwitchStatus(rule.Devices[key].StartAction);
                        var Endstate = wemoUtil.returnSwitchVal(rule.Devices[key].StartAction);
                        var stateClass = '';
                        var n = Startstate.split(" ");
                        Startstate = "<span class='first'>" + n[0] + "</span>";
                        if (n[1] != undefined) {
                            Startstate += "<span class='second'>" + " " + n[1] + "</span>";
                        }
                        var n = Endstate.split(" ");
                        Endstate = "<span class='third'>" + n[0] + "</span>";
                        if (n[1] != undefined) {
                            Endstate += "<span class='four'>" + " " + n[1] + "</span>";
                        }
                        if (rule.Devices[key].StartAction == 1) {
                            stateClass = ' green';
                        } else {
                            stateClass = ' black';
                        }

                        var afterMotionStop = wemo.items['AfterMotionStops'];
                        switchList += "<li><div class='rule_img'><img src='" + iconURL + "'></div>" +
                            "<div class='rule_details_device'>" +
                            "<div class='rule_details_device_name'>" + friendlyName + "</div>" +
                            "<div class='rule_details_state " + stateClass + "'><span class='state'>" + Startstate + "</span></div>" +
                            "<div>" + Endstate + "<br><span class='lowerCase'>" + afterMotionStop + "</span></span></div>" +
                            "</div></li>";
                    } else {

                        var Startstate = wemoUtil.returnSwitchStatus(rule.Devices[key].StartAction);
                        var Endstate = wemoUtil.returnSwitchVal(rule.Devices[key].StartAction);
                        var stateClass = '';
                        var n = Startstate.split(" ");
                        Startstate = "<span class='first'>" + n[0] + "</span>";
                        if (n[1] != undefined) {
                            Startstate += "<span class='second'>" + " " + n[1] + "</span>";
                        }
                        var n = Endstate.split(" ");
                        Endstate = "<span class='third'>" + n[0] + "</span>";
                        if (n[1] != undefined) {
                            Endstate += "<span class='four'>" + " " + n[1] + "</span>";
                        }
                        if (rule.Devices[key].StartAction == 1) {
                            stateClass = ' green';
                        } else {
                            stateClass = ' black';
                        }
                        var afterMotionStop = wemo.items['AfterMotionStops'];

                        var n = wemoUtil.formatMins(rule.Devices[key].SensorDuration).split(" ");
                        if (n[0] != undefined) {
                            n = n[0];
                        }
                        if (n == 0) {
                            n = 15;
                        }
                        var string = n + " " + wemo.items['minutes'];


                        switchList += "<li><div class='rule_img'><img src='" + iconURL + "'></div>" +
                            "<div class='rule_details_device'>" +
                            "<div class='rule_details_device_name'>" + friendlyName + "</div>" +
                            "<div class='rule_details_state " + stateClass + "'><span class='state'>" + Startstate + "</span></div>" +
                            "<div>" + Endstate + " for <span class='state'>" + string + "<br><span class='lowerCase'>" + afterMotionStop + "</span></span></div>" +
                            "</div></li>";
                    }


                }
                var sens = rule.SelectedSensors;
                var sensorImg = '';

//                nativeUtilPlugin.execute(
//                    function(base64String) {
//                        console.log('got image from DB success');
//                        sensorImg = "data:image/png;base64, " + base64String;
//                    },
//                    rule_details.reportError,
//                    actions.GET_BASE64_IMAGE_FROM_DB, [sens]
//                );
                if (rule.SelectedSensors != '') var arrSensors = sens.split(",");


                if (rule.SelectedSensors != '') var arrSensors = sens.split(",");
                console.log("sensors - se] -3 .arrSensors  " + arrSensors + "  ::sens  " + sens);
                console.log('sens::' + sens);
                console.log('arrSensors::' + arrSensors);
                for (var sen = 0; sen < arrSensors.length; sen++) {
                    if (av_sensors['"' + arrSensors[sen] + '"'] == undefined)
                        sensorfriendlyName = wemo.items['SensorNotPresent'];
                    else
                        sensorfriendlyName = av_sensors['"' + arrSensors[sen] + '"'];
                    var sensorImg = '';
                    var uuid = arrSensors[sen];

                     if (devices[uuid]) {
                        sensorImg = devices[uuid].icon;
                     }

//                    nativeUtilPlugin.execute(
//                        function(base64String) {
//                            console.log('got image from DB success');
//                            sensorImg = "data:image/png;base64, " + base64String;
//                        },
//                        rule_details.reportError,
//                        actions.GET_BASE64_IMAGE_FROM_DB, [uuid]
//                    );

                    if (uuid.indexOf('NetCamSensor') != -1) {
                        sensorfriendlyName = wemoUtil.extractNetCamName(sensorfriendlyName);
                    }

                    if (sensorImg === null || sensorImg == '') {

                        if (uuid.indexOf('NetCamSensor') != -1) {

                            console.log("every img >>>>   " + allSensorImage['"' + arrSensors[sen] + '"'] + "           udn" + arrSensors[sen]);

                            if (allSensorImage['"' + arrSensors[sen] + '"']) {
                                sensorImg = allSensorImage['"' + arrSensors[sen] + '"'];
                            } else {
                                if(av_sensors[sen] !== undefined) {
//                                    if (rule.Devices[uuid].information.ssid.indexOf('HD') > -1) {
                                        sensorImg = "../img/ic_netcam_HD.png";
//                                    } else {
//                                        sensorImg = "../img/ic_netcam_nobg@2x.png";
//                                    }
                                } else {
                                    sensorImg = "../img/ic_netcam_HD.png";
                                }

                            }


                        }
                        if (uuid.indexOf('Sensor') != -1) {
                            sensorImg = "../img/new_icons/WeMo_Motion_@3x.png";
                        }
                    }

                    var sensorStrength = wemoUtil.returnSensorStrength(rule.SelectedSensorsValue);
                    var triggerredBy = wemo.items['TriggerredBy'];

                    if (sensorStrength == "Very High") {
                        sensorStrength = wemo.items['VeryHigh'];
                    } else if (sensorStrength == "High") {
                        sensorStrength = wemo.items['High'];
                    } else if (sensorStrength == "Medium") {
                        sensorStrength = wemo.items['Medium'];
                    } else if (sensorStrength == "Low") {
                        sensorStrength = wemo.items['Low'];
                    } else if (sensorStrength == undefined) {
                        sensorStrength = '';
                    }


                    sensorList += "<li><div class='rule_img'><img src='" + sensorImg + "'></div>" +
                        "<div class='rule_details_device'>" +
                        "<div>" + triggerredBy + "</div>" +
                        "<div class='bold'>" + sensorfriendlyName + "</div>" +
                        "<div>" + sensorStrength + "</div>" +
                        "</div></li>";

                }
            }
        } else if (rule.RuleType == sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE) {
            //******TIME INTERVAL start******//
            var displayDate = "";
            var tempStartTime = rule.When.StartTime;
            var tempEndTime = parseInt(rule.When.RuleDuration) + parseInt(rule.When.StartTime);
            var endTimeFlag = false;
            if (tempStartTime % 10 == 1) {
                rule.When.StartSRSS = "Sunrise";
            } else if (tempStartTime % 10 == 2) {
                rule.When.StartSRSS = "Sunset";
            }
            if (rule.When.RuleDuration > 0) {
                endTimeFlag = true;
                if (tempEndTime % 10 == 1) {
                    rule.When.EndSRSS = "Sunrise";
                } else if (tempEndTime % 10 == 2) {
                    rule.When.EndSRSS = "Sunset";
                }
            }
            var EndTime = parseInt(rule.When.StartTime) + parseInt(rule.When.RuleDuration);
            if (EndTime > 86400) {
                EndTime = EndTime - 86400;
            }
            if (rule.When.StartSRSS != undefined && rule.When.EndSRSS != undefined) {
                var offsetOn = rule_details.convertDBOffsetToString(rule.When.OnModeOffset) + " ";
                var offsetOff = rule_details.convertDBOffsetToString(rule.When.OffModeOffset) + " ";
                if (offsetOn == undefined) offsetOn = "";
                if (offsetOff == undefined) offsetOff = "";
                if (rule.When.StartSRSS == "Sunrise") {
                    var tempStartSRSS = wemo.items['SunRise'];
                } else if (rule.When.StartSRSS == "Sunset") {
                    var tempStartSRSS = wemo.items['SunSet'];
                } else {
                    var tempStartSRSS = rule.When.StartSRSS;
                }
                if (rule.When.EndSRSS == "Sunrise") {
                    var tempEndSRSS = wemo.items['SunRise'];
                } else if (rule.When.EndSRSS == "Sunset") {
                    var tempEndSRSS = wemo.items['SunSet'];
                } else {
                    var tempEndSRSS = rule.When.EndSRSS;
                }
                displayDate = "<span class='capitalize'>" + (offsetOn + tempStartSRSS + " - " + offsetOff + tempEndSRSS) + "</span>, ";
            } else if (rule.When.StartSRSS == undefined && rule.When.EndSRSS != undefined) {
                if (rule.When.EndSRSS == "Sunrise") {
                    var tempEndSRSS = wemo.items['SunRise'];
                } else if (rule.When.EndSRSS == "Sunset") {
                    var tempEndSRSS = wemo.items['SunSet'];
                } else {
                    var tempEndSRSS = rule.When.EndSRSS;
                }
                var offsetOff = rule_details.convertDBOffsetToString(rule.When.OffModeOffset) + " ";
                if (offsetOff == undefined) offsetOff = "";
                rule.When.offSRSS_Title = offsetOff + tempEndSRSS;
                displayDate = wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24) + " - " + "<span class='capitalize'>" + offsetOff + tempEndSRSS + "</span>, ";
            } else if (rule.When.StartSRSS != undefined && rule.When.EndSRSS == undefined) {
                if (rule.When.StartSRSS == "Sunrise") {
                    var tempStartSRSS = wemo.items['SunRise'];
                } else if (rule.When.StartSRSS == "Sunset") {
                    var tempStartSRSS = wemo.items['SunSet'];
                } else {
                    var tempStartSRSS = rule.When.StartSRSS;
                }
                var offsetOn = rule_details.convertDBOffsetToString(rule.When.OnModeOffset) + " ";
                if (offsetOn == undefined) offsetOn = "";
                rule.When.onSRSS_Title = offsetOn + tempStartSRSS;
                if (rule.When.RuleDuration <= 0) {
                    displayDate = "<span class='capitalize'>" + tempStartSRSS + "</span>, ";
                } else {
                    displayDate = "<span class='capitalize'>" + offsetOn + tempStartSRSS + "</span> - " + wemoUtil.convertMillisecondsToTF(EndTime, UP_TF_IS24) + ", ";
                }
            } else if (rule.When.StartSRSS == undefined && rule.When.EndSRSS == undefined) {
                if (rule.When.RuleDuration <= 0) {
                    displayDate = wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24) + ", ";
                } else {
                    if (rule.When.StartTime == sessionStore.ALLDAY_STARTTIME && EndTime == sessionStore.ALLDAY_ENDTIME) {
                        displayDate = sessionStore.SENSOR_ALLDAY + ", ";
                    } else {
                        displayDate = wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24) + " - " + wemoUtil.convertMillisecondsToTF(EndTime, UP_TF_IS24) + ", ";
                    }
                }
            }
            //******TIME INTERVAL end******//
            console.log("Rule stringify <<<<>>>> " + JSON.stringify(rule));
            var rulenameObj = rule.RuleName;
            var tempDisRulename = "";
            if (rulenameObj.indexOf("Rule") != -1) {
                tempDisRulename = rulenameObj.replace("Rule", wemo.items["Rule"]);
            } else {
                tempDisRulename = rulenameObj;
            }
            trace("rulenameObj==>" + rulenameObj);

//            heading = "<label><span class='label'>Rule name</span></label><hr class='divider'>" +
//            "<div class='rule'>" +
//            "<div class='rule_heading rule_heading_withBtn'>" + tempDisRulename + "</div>" +
//
//        "<div class='rule_btn_DisableOrEnable'>" +
//            "<a id='rule_disable' data-theme='b' data-role='button'><span>"+ wemo.items['RuleDisable'] +"</span></a>" +
//            "<a id='rule_enable' data-theme='b' data-role='button'><span>"+ wemo.items['RuleEnable'] +"</span></a>" +
//            "</div>" +
//            "<div class='ifLabel'>"+ wemo.items['If']+"</div>" +
//            "</div>";

            $(".ruleTitle").html(tempDisRulename);
            trace("heading " + heading);
            if (Object.keys(rule.Devices).length > 0) {
                for (key in rule.Devices) {
                    var changedUDN = wemoUtil.getOriginalMakerUDN(key);
                    if (av_makers['"' + changedUDN + '"'] == undefined) {
                        changedUDN = wemoUtil.getFaultyMakerUDN(key);
                        if (av_makers['"' + changedUDN + '"'] == undefined)
                            friendlyName = wemo.items['MakerNotFound'];
                        else {
                            friendlyName = av_makers['"' + changedUDN + '"'].name;
                            if (av_makers['"' + changedUDN + '"'].SensorPresent == "0") {
                                showTroubleAlert = true;
                            }
                        }
                    } else {
                        friendlyName = av_makers['"' + changedUDN + '"'].name;
                        if (av_makers['"' + changedUDN + '"'].SensorPresent == "0") {
                            showTroubleAlert = true;
                        }
                    }
                    var level, stat;
                    level = rule.Devices[key].Level;
                    if (level == "1") {
                        stat = wemo.items['SensorOpen'];
                    } else if (level == "0") {
                        stat = wemo.items['SensorClosed'];
                    } else {
                        stat = "Unknown State";
                    }
                    trace("stat==>" + stat + " level " + level);
                    var iconURL = '';
                        var udn = wemoUtil.isMakerDevice(key)? wemoUtil.getOriginalMakerUDN(key) : key;
                        if (devices[udn]) {
                            sensorImg = devices[udn].icon;
                        }

//                    nativeUtilPlugin.execute(
//                        function(base64String) {
//                            console.log('got image from DB success');
//                            iconURL = "data:image/png;base64, " + base64String;
//                        },
//                        rule_details.reportError,
//                        actions.GET_BASE64_IMAGE_FROM_DB, [key]
//                    );
                    if (iconURL === null || iconURL == '') {
                        if (key.indexOf('Maker') != -1) {
                            iconURL = "../img/new_icons/WeMo_Maker_@3x.png";
                        }
                    }
                    //        			var state = wemoUtil.returnSwitchStatus(rule.Devices[key].StartAction);
                    //        			if (state == "Turns On") {
                    //        				state = wemo.items['SwitchActionTurnOn'];
                    //        			}
                    //        			else if (state == "Turns Off") {
                    //        				state = wemo.items['SwitchActionTurnOff'];
                    //        			}
                    //        			else if (state == "Does Nothing") {
                    //        				state = wemo.items['SwitchActionNothing'];
                    //        			}
                    //        			else {
                    //        				state = wemo.items['SwitchActionNothing'];
                    //        			}
                    //        			var n = state.split(" ");
                    //        			var stateClass = '';
                    //        			state = "<span class='first'>" + n[0] + "</span>";
                    //        			if (n[1] != undefined) {
                    //        				state += "<span class='second'>" + " " + n[1] + "</span>";
                    //        			}
                    //        			if (rule.Devices[key].StartAction == 1) {
                    //        				stateClass = ' green';
                    //        			} else {
                    //        				stateClass = ' black';
                    //        			}
                    switchList += "<li><div class='rule_img'><img src='" + iconURL + "'></div>" +
                        "<div class='rule_details_device'>" +
                        "<div class='rule_details_device_name'>" + friendlyName + "</div>" +
                        "<div class='gray_text'> <span class='state'>" + stat + "</span></div>" +
                        "</div></li>";
                }
            }
            var how_often;
            if (parseInt(rule.NotificationDuration, 10) == 1) {
                how_often = "notify every time";
            } else {
                if (parseInt(rule.NotificationDuration, 10) == 86400) {
                    how_often = "day";
                } else {
                    how_often = wemoUtil.convertSecondsToHoursMins(parseInt(rule.NotificationDuration, 10));
                }
            }
            var notify = "<div class='rule_details_device_name'>" + rule.NotificationMessage + "</div>" +
                "<div class='rule_details_how_often'> <span class='state'>How Often: " + how_often + "</span></div>";
            if (rule.Time == undefined) {
                rule.Time = wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24) + " - " + wemoUtil.convertMillisecondsToTF(rule.When.StartTime + rule.When.RuleDuration, UP_TF_IS24)
            }
            console.log("rule.Time " + rule.Time);
            var timeAt = "<span class='rule_time'>" + displayDate + "</span>" +
                "<span class='rule_day'>" + days + "</span>" ;
        } else if ((rule.RuleType == sessionStore.INSIGHT_RULE || rule.RuleType == sessionStore.NOTIFY_ME) && !isKeyChainPresenceNotification && !isDWNotificationRule) {
            //******TIME INTERVAL start******//
            var displayDate = "";
            var tempStartTime = rule.When.StartTime;
            var tempEndTime = parseInt(rule.When.RuleDuration) + parseInt(rule.When.StartTime);
            var endTimeFlag = false;
            if (tempStartTime % 10 == 1) {
                rule.When.StartSRSS = "Sunrise";
            } else if (tempStartTime % 10 == 2) {
                rule.When.StartSRSS = "Sunset";
            }

            if (rule.When.RuleDuration > 0) {
                endTimeFlag = true;
                if (tempEndTime % 10 == 1) {
                    rule.When.EndSRSS = "Sunrise";
                } else if (tempEndTime % 10 == 2) {
                    rule.When.EndSRSS = "Sunset";
                }
            }
            var EndTime = parseInt(rule.When.StartTime) + parseInt(rule.When.RuleDuration);
            if (EndTime > 86400) {
                EndTime = EndTime - 86400;
            }

            if (rule.When.StartSRSS != undefined && rule.When.EndSRSS != undefined) {

                var offsetOn = rule_details.convertDBOffsetToString(rule.When.OnModeOffset) + " ";
                var offsetOff = rule_details.convertDBOffsetToString(rule.When.OffModeOffset) + " ";
                if (offsetOn == undefined) offsetOn = "";
                if (offsetOff == undefined) offsetOff = "";

                if (rule.When.StartSRSS == "Sunrise") {
                    var tempStartSRSS = wemo.items['SunRise'];
                } else if (rule.When.StartSRSS == "Sunset") {
                    var tempStartSRSS = wemo.items['SunSet'];
                } else {
                    var tempStartSRSS = rule.When.StartSRSS;
                }

                if (rule.When.EndSRSS == "Sunrise") {
                    var tempEndSRSS = wemo.items['SunRise'];
                } else if (rule.When.EndSRSS == "Sunset") {
                    var tempEndSRSS = wemo.items['SunSet'];
                } else {
                    var tempEndSRSS = rule.When.EndSRSS;
                }

                displayDate = "<span class='capitalize'>" + (offsetOn + tempStartSRSS + " - " + offsetOff + tempEndSRSS) + "</span>, ";
            } else if (rule.When.StartSRSS == undefined && rule.When.EndSRSS != undefined) {

                if (rule.When.EndSRSS == "Sunrise") {
                    var tempEndSRSS = wemo.items['SunRise'];
                } else if (rule.When.EndSRSS == "Sunset") {
                    var tempEndSRSS = wemo.items['SunSet'];
                } else {
                    var tempEndSRSS = rule.When.EndSRSS;
                }

                var offsetOff = rule_details.convertDBOffsetToString(rule.When.OffModeOffset) + " ";
                if (offsetOff == undefined) offsetOff = "";
                rule.When.offSRSS_Title = offsetOff + tempEndSRSS;

                displayDate = wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24) + " - " + "<span class='capitalize'>" + offsetOff + tempEndSRSS + "</span>, ";
            } else if (rule.When.StartSRSS != undefined && rule.When.EndSRSS == undefined) {

                if (rule.When.StartSRSS == "Sunrise") {
                    var tempStartSRSS = wemo.items['SunRise'];
                } else if (rule.When.StartSRSS == "Sunset") {
                    var tempStartSRSS = wemo.items['SunSet'];
                } else {
                    var tempStartSRSS = rule.When.StartSRSS;
                }

                var offsetOn = rule_details.convertDBOffsetToString(rule.When.OnModeOffset) + " ";
                if (offsetOn == undefined) offsetOn = "";
                rule.When.onSRSS_Title = offsetOn + tempStartSRSS;

                if (rule.When.RuleDuration <= 0) {
                    displayDate = "<span class='capitalize'>" + tempStartSRSS + "</span>, ";
                } else {
                    displayDate = "<span class='capitalize'>" + offsetOn + tempStartSRSS + "</span> - " + wemoUtil.convertMillisecondsToTF(EndTime, UP_TF_IS24) + ", ";
                }

            } else if (rule.When.StartSRSS == undefined && rule.When.EndSRSS == undefined) {
                if (rule.When.RuleDuration <= 0) {
                    displayDate = wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24) + ", ";
                } else {
                    if (rule.When.StartTime == sessionStore.ALLDAY_STARTTIME && EndTime == sessionStore.ALLDAY_ENDTIME) {
                        displayDate = sessionStore.SENSOR_ALLDAY + ", ";
                    } else {
                        displayDate = wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24) + " - " + wemoUtil.convertMillisecondsToTF(EndTime, UP_TF_IS24) + ", ";
                    }
                }
            }
            //******TIME INTERVAL end******//

            var rulenameObj = rule.RuleName;
            var tempDisRulename = "";

            if (rulenameObj.indexOf("Rule") != -1) {
                tempDisRulename = rulenameObj.replace("Rule", wemo.items["Rule"]);
            } else {
                tempDisRulename = rulenameObj;
            }
            trace("rulenameObj==>" + rulenameObj);

//            heading = "<label><span class='label'>Rule name</span></label><hr class='divider'>" +
//            "<div class='rule'>" +
//            "<div class='rule_heading rule_heading_withBtn'>" + tempDisRulename + "</div>" +
//
//            "<div class='rule_btn_DisableOrEnable'>" +
//                "<a id='rule_disable' data-theme='b' data-role='button'><span>"+ wemo.items['RuleDisable'] +"</span></a>" +
//                "<a id='rule_enable' data-theme='b' data-role='button'><span>"+ wemo.items['RuleEnable'] +"</span></a>" +
//                "</div>" +
//                "<div class='ifLabel'>"+ wemo.items['If']+"</div>" +
//            "</div>";
            $(".ruleTitle").html(tempDisRulename);
            trace("heading " + heading);
            if (Object.keys(rule.Devices).length > 0) {

                for (key in rule.Devices) {

                    if (av_switches['"' + key + '"'] == undefined && av_sensors['"' + key + '"'] == undefined && homesense_sensors[key] == undefined) {
                        if (isSensorNotificaton) {
                            friendlyName = wemo.items['SensorNotPresent'];
                        } else {
                            friendlyName = wemo.items['InsightNotPresent'];
                        }
                    } else {
                        if (av_switches['"' + key + '"'] != undefined) friendlyName = av_switches['"' + key + '"'];
                        else if(av_sensors['"' + key + '"'] != undefined) friendlyName = av_sensors['"' + key + '"'];
                        else if(homesense_sensors[key] != undefined) friendlyName = homesense_sensors[key].fName;
                    }

                    if (key.indexOf('NetCamSensor') != -1) {
                        friendlyName = wemoUtil.extractNetCamName(friendlyName);
                    }

                    if (isSensorNotificaton) {
                        stat = "Motion";
                    } else {
                        var level, stat;
                        for (var j = 0; j < levels.length; j++) {
                            if (levels[j].DeviceID == key) level = levels[j].Level;
                            trace("levels[j].DeviceID  " + levels[j].DeviceID + " levels[j].Level " + levels[j].Level);
                        }
                        if (level == "0") {
                            stat = "Power Off";
                        } else if (level == "1") {
                            stat = "Power On";
                        } else {
                            stat = "Power is on for " + wemoUtil.convertSecondsToHoursMins(level);
                        }
                    }
                    trace("stat==>" + stat + " level " + level);

                    var iconURL = '';
//                    var udn = wemoUtil.isMakerDevice(key)? wemoUtil.getOriginalMakerUDN(key) : key;
//                    if (devices[udn]) {
//                        sensorImg = devices[udn].icon;
//                    }
                     if (devices[key]) {
                        iconURL = devices[key].icon;
                     }

//                    nativeUtilPlugin.execute(
//                        function(base64String) {
//                            console.log('got image from DB success');
//                            iconURL = "data:image/png;base64, " + base64String;
//                        },
//                        rule_details.reportError,
//                        actions.GET_BASE64_IMAGE_FROM_DB, [key]
//                    );

                    if (iconURL === null || iconURL == '') {
                        if (isSensorNotificaton) {
                        	
                            if (key.indexOf('NetCamSensor') != -1) {

                                //console.log("every img >>>>   "+allSensorImage['"'+arrSensors[sen]+'"']+"           udn"+arrSensors[sen]);

                                if (allSensorImage['"' + [key] + '"']) {
                                    iconURL = allSensorImage['"' + [key] + '"'];
                                } else {
//                                    if(rule.Devices[key].information.ssid.indexOf('HD') > -1){
                                        iconURL = "../img/ic_netcam_HD.png";
//                                    } else {
//                                        iconURL = "../img/ic_netcam_nobg@2x.png";
//                                    }
                                }


                            } else if (key.indexOf('Sensor') != -1) {
                                iconURL = "../img/new_icons/WeMo_Motion_@3x.png";
                            }
                        } else {
                            if (key.indexOf('Insight') != -1) {
                                iconURL = "../img/new_icons/WeMo_Insight_Switch_@3x.png";
                            }
                        }
                    }

                    console.log(JSON.stringify(rule.Devices[key]));
                    if(!isKeyChainPresenceNotification && !isDWNotificationRule){
                    var state = wemoUtil.returnSwitchStatus(rule.Devices[key].StartAction);
                    if (state == "Turns On") {
                        state = wemo.items['SwitchActionTurnOn'];
                    } else if (state == "Turns Off") {
                        state = wemo.items['SwitchActionTurnOff'];
                    } else if (state == "Does Nothing") {
                        state = wemo.items['SwitchActionNothing'];
                    } else {
                        state = wemo.items['SwitchActionNothing'];
                    }

                    var n = state.split(" ");
                    var stateClass = '';
                    state = "<span class='first'>" + n[0] + "</span>";
                    if (n[1] != undefined) {
                        state += "<span class='second'>" + " " + n[1] + "</span>";
                    }

                    if (rule.Devices[key].StartAction == 1) {
                        stateClass = ' green';
                    } else {
                        stateClass = ' black';
                    }
                    //					setTimeout(function(){
                    switchList += "<li><div class='rule_img'><img src='" + iconURL + "'></div>" +
                        "<div class='rule_details_device'>" +
                        "<div class='rule_details_device_name'>" + friendlyName + "</div>" +
                        "<div class='rule_details_state'> <span class='state'>" + stat + "</span></div>" +
                        "</div></li>";
                    //					}, 300);
                }
            }

            var how_often;
            if (isSensorNotificaton) {
                if (parseInt(rule.NotificationDuration, 10) == 1) {
                    how_often = "notify every time";
                } else
                if (parseInt(rule.NotificationDuration, 10) == 86400) {
                    how_often = "day";
                } else {
                    how_often = wemoUtil.convertSecondsToHoursMins(parseInt(rule.NotificationDuration, 10));
                }
                var notify = "<div class='rule_details_device_name'>" + rule.NotificationMessage + "</div>" +
                    "<div class='rule_details_how_often'> <span class='state'>How Often: " + how_often + "</span></div>";
            } else {
                if (parseInt(rule.Frequency, 10) == 1) {
                    how_often = "notify every time";
                } else
                if (parseInt(rule.Frequency, 10) == 86400) {
                    how_often = "day";
                } else {
                    how_often = wemoUtil.convertSecondsToHoursMins(parseInt(rule.Frequency, 10));
                }

                var notify = "<div class='rule_details_device_name'>" + rule.Message + "</div>" +
                    "<div class='rule_details_how_often'> <span class='state'>How Often: " + how_often + "</span></div>";
            }
        }
            if (rule.Time == undefined) {
                rule.Time = wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24) + " - " + wemoUtil.convertMillisecondsToTF(rule.When.StartTime + rule.When.RuleDuration, UP_TF_IS24)
            }
            console.log("rule.Time " + rule.Time);
            var timeAt = "<span class='rule_time'>" + displayDate + "</span>" +
                "<span class='rule_day'>" + days + "</span>";

        } else if (isKeyChainPresenceNotification || isDWNotificationRule) {
            //******TIME INTERVAL start******//
            var displayDate = "";
            var tempStartTime = rule.When.StartTime;
            var tempEndTime = parseInt(rule.When.RuleDuration) + parseInt(rule.When.StartTime);
            var endTimeFlag = false;
            if (tempStartTime % 10 == 1) {
                rule.When.StartSRSS = "Sunrise";
            } else if (tempStartTime % 10 == 2) {
                rule.When.StartSRSS = "Sunset";
            }

            if (rule.When.RuleDuration > 0) {
                endTimeFlag = true;
                if (tempEndTime % 10 == 1) {
                    rule.When.EndSRSS = "Sunrise";
                } else if (tempEndTime % 10 == 2) {
                    rule.When.EndSRSS = "Sunset";
                }
            }
            var EndTime = parseInt(rule.When.StartTime) + parseInt(rule.When.RuleDuration);
            if (EndTime > 86400) {
                EndTime = EndTime - 86400;
            }

            if (rule.When.StartSRSS != undefined && rule.When.EndSRSS != undefined) {

                var offsetOn = rule_details.convertDBOffsetToString(rule.When.OnModeOffset) + " ";
                var offsetOff = rule_details.convertDBOffsetToString(rule.When.OffModeOffset) + " ";
                if (offsetOn == undefined) offsetOn = "";
                if (offsetOff == undefined) offsetOff = "";

                if (rule.When.StartSRSS == "Sunrise") {
                    var tempStartSRSS = wemo.items['SunRise'];
                } else if (rule.When.StartSRSS == "Sunset") {
                    var tempStartSRSS = wemo.items['SunSet'];
                } else {
                    var tempStartSRSS = rule.When.StartSRSS;
                }

                if (rule.When.EndSRSS == "Sunrise") {
                    var tempEndSRSS = wemo.items['SunRise'];
                } else if (rule.When.EndSRSS == "Sunset") {
                    var tempEndSRSS = wemo.items['SunSet'];
                } else {
                    var tempEndSRSS = rule.When.EndSRSS;
                }

                displayDate = "<span class='capitalize'>" + (offsetOn + tempStartSRSS + " - " + offsetOff + tempEndSRSS) + "</span>, ";
            } else if (rule.When.StartSRSS == undefined && rule.When.EndSRSS != undefined) {

                if (rule.When.EndSRSS == "Sunrise") {
                    var tempEndSRSS = wemo.items['SunRise'];
                } else if (rule.When.EndSRSS == "Sunset") {
                    var tempEndSRSS = wemo.items['SunSet'];
                } else {
                    var tempEndSRSS = rule.When.EndSRSS;
                }

                var offsetOff = rule_details.convertDBOffsetToString(rule.When.OffModeOffset) + " ";
                if (offsetOff == undefined) offsetOff = "";
                rule.When.offSRSS_Title = offsetOff + tempEndSRSS;

                displayDate = wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24) + " - " + "<span class='capitalize'>" + offsetOff + tempEndSRSS + "</span>, ";
            } else if (rule.When.StartSRSS != undefined && rule.When.EndSRSS == undefined) {

                if (rule.When.StartSRSS == "Sunrise") {
                    var tempStartSRSS = wemo.items['SunRise'];
                } else if (rule.When.StartSRSS == "Sunset") {
                    var tempStartSRSS = wemo.items['SunSet'];
                } else {
                    var tempStartSRSS = rule.When.StartSRSS;
                }

                var offsetOn = rule_details.convertDBOffsetToString(rule.When.OnModeOffset) + " ";
                if (offsetOn == undefined) offsetOn = "";
                rule.When.onSRSS_Title = offsetOn + tempStartSRSS;

                if (rule.When.RuleDuration <= 0) {
                    displayDate = "<span class='capitalize'>" + tempStartSRSS + "</span>, ";
                } else {
                    displayDate = "<span class='capitalize'>" + offsetOn + tempStartSRSS + "</span> - " + wemoUtil.convertMillisecondsToTF(EndTime, UP_TF_IS24) + ", ";
                }

            } else if (rule.When.StartSRSS == undefined && rule.When.EndSRSS == undefined) {
                if (rule.When.RuleDuration <= 0) {
                    displayDate = wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24) + ", ";
                } else {
                    if (rule.When.StartTime == sessionStore.ALLDAY_STARTTIME && EndTime == sessionStore.ALLDAY_ENDTIME) {
                        displayDate = sessionStore.SENSOR_ALLDAY + ", ";
                    } else {
                        displayDate = wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24) + " - " + wemoUtil.convertMillisecondsToTF(EndTime, UP_TF_IS24) + ", ";
                    }
                }
            }
            //******TIME INTERVAL end******//

            var rulenameObj = rule.RuleName;
            var tempDisRulename = "";

            if (rulenameObj.indexOf("Rule") != -1) {
                tempDisRulename = rulenameObj.replace("Rule", wemo.items["Rule"]);
            } else {
                tempDisRulename = rulenameObj;
            }

//            heading = "<label><span class='label'>Rule name</span></label><hr class='divider'>" +
//            "<div class='rule'>" +
//            "<div class='rule_heading rule_heading_withBtn'>" + tempDisRulename + "</div>" +
//
//            "<div class='rule_btn_DisableOrEnable'>" +
//                "<a id='rule_disable' data-theme='b' data-role='button'><span>"+ wemo.items['RuleDisable'] +"</span></a>" +
//                "<a id='rule_enable' data-theme='b' data-role='button'><span>"+ wemo.items['RuleEnable'] +"</span></a>" +
//                "</div>" +
//                "<div class='ifLabel'>"+ wemo.items['If']+"</div>" +
//            "</div>";
            $(".ruleTitle").html(tempDisRulename);
            if (Object.keys(rule.Devices).length > 0) {

                for (key in rule.Devices) {

                    if (homesense_sensors[key] == undefined) {
                            friendlyName = wemo.items['SensorNotPresent'];
                    } else {
                         friendlyName = homesense_sensors[key].fName;
                    }

                        var level, stat;
                        level = rule.Devices[key].Level;
                        if(isKeyChainPresenceNotification){
                            if (level == keyChainRuleActionValues.ARRIVESORLEAVES) {
                                stat = wemo.items['FobSensorArrivesorLeaves'];
                            } else if (level == keyChainRuleActionValues.ARRIVES) {
                                stat = wemo.items['FobSensorArrives'];
                            } else {
                                stat = wemo.items['FobSensorLeaves'];
                            }
                        }
                        else{
                            if (level == doorWindowActionValues.OPENSORCLOSES) {
                                stat = wemo.items['DoorWindowOpensorCloses'];
                            } else if (level == doorWindowActionValues.OPENS) {
                                stat = wemo.items['DoorWindowOpens'];
                            } else {
                                stat = wemo.items['DoorWindowCloses'];
                            }
                        }
 

                    var iconURL = '';
//                    nativeUtilPlugin.execute(
//                        function(base64String) {
//                            console.log('got image from DB success');
//                            iconURL = "data:image/png;base64, " + base64String;
//                        },
//                        rule_details.reportError,
//                        actions.GET_BASE64_IMAGE_FROM_DB, [key]
//                    );

                    switchList += "<li><div class='rule_img'><img src='" + iconURL + "'></div>" +
                        "<div class='rule_details_device'>" +
                        "<div class='rule_details_device_name'>" + friendlyName + "</div>" +
                        "<div > <span >" + stat + "</span></div>" +
                        "</div></li>";
                }
            }

            if (rule.Time == undefined) {
                rule.Time = wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24) + " - " + wemoUtil.convertMillisecondsToTF(rule.When.StartTime + rule.When.RuleDuration, UP_TF_IS24)
            }
            var timeAt = "<span class='rule_time'>" + displayDate + "</span>" +
                "<span class='rule_day'>" + days + "</span>";
        }


        $("#rule_devices_list").append(switchList + sensorList);
        $("#timeAt").html(timeAt);
        $("#notifyMe").html(notify);


        $("#notify_rule_details_page .rule_detail_container").show();
        var StartTime = parseInt(rule.When.StartTime);


        $("#change_rule_state").on("tap", function() {

            $("#change_rule_state").toggleClass("disable");

            var rule = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
            var selectedRuleState = $("#change_rule_state").hasClass("disable") ? 0: 1;

            if (selectedRuleState === 1) {
                //enable
                var disabled_ruleId = rule.id;
                var ruleId_disable = window.sessionStorage.getItem("rule_id_disable");
                $("#FirmwareVerCheckText").html(wemo.items['FirmwareVerCheckText']);
                if (disabled_ruleId === ruleId_disable) {
                    setTimeout(function() {
                            $("#fw_ver_check").popup("open");
                        },
                        300
                    );
                    window.sessionStorage.removetItem("disabled_rule_id");
                }
                if (isFWSupported != "false") {
                    if (rule.RuleType == sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE && showTroubleAlert == true) {
                        $("#rule_cannot_save_dlg").popup('open');
                    } else {
                        rule_details.bindDisableEnableRule(db, rule, '0', selectedRuleID);
                    }
                }
            } else {
                // disable
                rule_details.bindDisableEnableRule(db, rule, '1', selectedRuleID);
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

        if (rule.State == '0') {
            rule_details.checkIfFirmwareSupported(rule);
            $("#change_rule_state").addClass("disable");
        }

        if (rule.State == '1') {
            var strDays = rule.SelectedDayOrRange;
            var StartTime = rule.startingTime;
            var EndTime = rule.endingTime;

            rule_details.ruleStatus(StartTime, EndTime, strDays);
        }


        $("#rule_cannot_save_dlg").popup();
        $("#rule_cannot_save_ok_button").on("click", function(e) {
            $("#rule_cannot_save_dlg").popup('close');
            e.preventDefault();
        });

        //        }/*,500);*/

    },

    bindEvents: function() {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', rule_details.onOnline, false);
        document.addEventListener('offline', rule_details.onOffline, false);
        document.addEventListener("backbutton", rule_details.onBackPress, false);
        document.addEventListener("pause", rule_details.onPause, false);
        document.addEventListener("resume", rule_details.onResume, false);
    },

    onOffline: function() {
        console.log(TAG + "offLine");
    },

    onOnline: function() {
        console.log(TAG + "onLine");
    },

    onBackPress: function() {
        if ($("#more_tab").is(":visible")) {
            $("#more_tab").hide();
            $('body').find('.modalWindow').transition({
                opacity: 0
            }, 400, function() {
                $(this).removeClass('isOpen');
            });
        } else {
            console.log(TAG + "onBackPress");
            wemoUtil.loadUrl(filePath.ENABLED_RULES);
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

    deviceListBorder: function() {
        var switch_list = $("#select_").find(".select_switches_list").length;
        trace("switch_list==>" + switch_list);
        if (switch_list === 1) {
            $(".select_switches_list").addClass("more_li_clone");
        } else if (switch_list === 2) {
            $(".select_switches_list:first-child").addClass('more_li_clone more_li_clone_top');
            $(".select_switches_list:last-child").addClass('more_li_clone more_li_clone_bottom');
        } else if (switch_list >= 3) {
            $(".select_switches_list:first-child").addClass('more_li_clone more_li_clone_top');
            $(".select_switches_list:last-child").addClass('more_li_clone more_li_clone_bottom');
            $(".select_switches_list").not(".select_switches_list:first-child, .select_switches_list:last-child").addClass('more_li_clone more_li_clone_no_radius');
        }
    },
    ruleStatus: function(StartTime, EndTime, strDays) {
        var ruleStartTime = StartTime;
        var ruleEndTime = EndTime;
        var days = strDays;
        //alert('days'+days);
        var d = new Date();
        var today = d.getDay();
        var ruleActiveDay = '';
        var dayValue = days;
        var currTimeInMilli = rule_details.convertTimeToMilliseconds();

        if (dayValue.indexOf('Weekends') != -1) {
            console.log('saturday and sunday::Weekends');
            if (today == 0 || today == 6) {
                ruleActiveDay = true;
                console.log('saturday and sunday::active');
                //alert('saturday and sunday::active');
            } else {
                console.log('saturday and sunday::inactive');
                //alert('saturday and sunday::inactive');
                ruleActiveDay = false;
            }
        } else if (dayValue.indexOf('Weekday') != -1) {
            console.log('Monday to Friday::Weekdays');
            if ((today > 0) && (today < 6)) {
                console.log('Monday to Friday::active');
                //alert('Monday to Friday::active');
                ruleActiveDay = true;
            } else {
                console.log('Monday to Friday::in active');
                //alert('Monday to Friday::in active');
                ruleActiveDay = false;
            }
        } else if (dayValue.indexOf('Daily') != -1) {
            console.log('Mon-Tue-Wed-Thu-Fri-Sat-Sun::All days');
            ruleActiveDay = true;
            //alert('Mon-Tue-Wed-Thu-Fri-Sat-Sun::All days');
        } else if (dayValue.indexOf(wemoUtil.returnDay(today - 1)) != -1) {
            //alert('wemoUtil.returnDay(today)'+wemoUtil.returnDay(today));
            console.log('day list');
            ruleActiveDay = true;
            //alert('day list');
        } else {
            console.log('do nothing');
            //alert('do nothing');
            ruleActiveDay = false;
        }

        if (ruleActiveDay == true) {
            //alert('inside trigger');
            if ((currTimeInMilli <= ruleStartTime)) {
                var diff = ruleStartTime - currTimeInMilli;
                console.log('diff' + diff);

                setTimeout(function() {
                    // alert(''+ruleID);

                    $('.enabled_rules_active').show();

                }, diff * 1000);
            }

            if ((currTimeInMilli > ruleStartTime) && (currTimeInMilli < ruleEndTime)) {
                console.log("Currently Active State");

                $('.enabled_rules_active').show();
            }


            if (currTimeInMilli <= ruleEndTime) {
                var diffEnd = ruleEndTime - currTimeInMilli;
                setTimeout(function() {
                    //alert('in ruleID'+ruleID);
                    $('.enabled_rules_active').hide();

                }, diffEnd * 1000);
            }

            if (parseInt(ruleEndTime) < parseInt(ruleStartTime)) {
                // alert('End time is less then Start time');
                console.log('End time is less then Start time');
                if ((currTimeInMilli >= ruleStartTime)) {
                    console.log("Currently Active State");
                    $('.enabled_rules_active').show();
                }
                if ((currTimeInMilli <= ruleStartTime)) {
                    var diff = ruleStartTime - currTimeInMilli;
                    console.log('diff' + diff);

                    setTimeout(function() {
                        $('.enabled_rules_active').show();

                    }, diff * 1000);
                }


            }

            if (parseInt(ruleEndTime) == parseInt(ruleStartTime)) {
                // alert('End time is equal to Start');
                if ((currTimeInMilli >= ruleStartTime)) {
                    console.log("Currently Active State");
                    $('.enabled_rules_active').show();
                }

                if ((currTimeInMilli <= ruleStartTime)) {
                    var diff = ruleStartTime - currTimeInMilli;
                    console.log('diff' + diff);

                    setTimeout(function() {
                        $('.enabled_rules_active').show();

                    }, diff * 1000);
                }

            }
        }


    },
    convertTimeToMilliseconds: function() {

        var d = new Date();
        var hh = d.getHours();
        var m = d.getMinutes();
        var s = d.getSeconds();
        return (hh * 3600) + (m * 60) + s;


    },

    showModal: function() {
        nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);

    },

    hideModal: function() {
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
    },


    buildCloudListItem: function(ruleEvents) {
        wemoUtil.infoLog(TAG, "ruleEvents : " + ruleEvents);
        for (var i = 0; i < ruleEvents.length; i++) {
            if (i > 0 && ruleEvents[i][0] != '') {
                var eventSep = rule_details.bluildRuleEventSep();
                $(eventSep).hide().appendTo('#device_list_container').slideDown("slow");
            }
            var listItem = rule_details.bluildRuleEvent(ruleEvents[i]);
            $(listItem).hide().appendTo('#device_list_container').slideDown("slow");
            $('select').slider();
        }
    },

    getRuleEventTime: function(epochTime) {
        if (isNaN(epochTime)) {
            wemoUtil.infoLog(TAG, "Not a number");
            return;
        }

        var dateObj = new Date(epochTime * 1000);
        var dayDesc = wemo.items[dateObj.getWeekDay()];
        var dateDesc = wemo.items[dateObj.getMonthName()] + " " + dateObj.getDate() + ", " + dateObj.getFullYear();

        var minutes = dateObj.getMinutes();
        var hours = dateObj.getHours();
        var ampm = hours >= 12 ? 1 : 0;
        var hours = hours % 12;
        hours = hours ? hours : 12; // the hour '0' should be '12'
        hours = hours < 10 ? '0' + hours : hours;
        minutes = minutes < 10 ? '0' + minutes : minutes;
        var timeDesc = hours + ':' + minutes + ' ' + wemo.items[dateObj.ampm[ampm]];
        var eventStr = "";

        var ruleEventObj = [dayDesc, dateDesc, eventStr, timeDesc];
        return ruleEventObj;

    },

    bluildRuleEvent: function(ruleEventDesc) {
        var listItem = "<tr class='rule_event_tr'><td>" + ruleEventDesc[0] + "</td><td>" + ruleEventDesc[1] + "</td><td>" + ruleEventDesc[2] + "</td><td align='right'>" + ruleEventDesc[3] + "</td></tr>";
        return listItem;
    },

    bluildRuleEventSep: function() {
        var listItem = "<tr class='rule_event_tr'><td colspan='4' ><hr class='rule_event_sep' /></td></tr>";
        return listItem;
    },

    bluildRuleEvents: function(data) {
        try {
            $('#device_list_container').empty();
            var clearData = false;
            var count = 0;
            var dayStartCount = 0;
            var dayDesc = '',
                eventCountStr = '',
                eventCount = 0;

            var ruleEvents = [];
            $(data).find('ruleExecutionTS').each(function() {
                eventCount = eventCount + 1;
                var rule_ts = $(this).text();

                wemoUtil.infoLog(TAG, "Data ruleExecutionTs : " + count + " :  " + dayStartCount + " :  " + eventCount + " :  " + rule_ts);

                var tmpArr = rule_details.getRuleEventTime(parseInt(rule_ts));

                if (eventCount === 1) {
                    eventCountStr = eventCount + " event";
                } else if (eventCount > 1)  {
                    eventCountStr = eventCount + " events";
                }
                tmpArr[2] = eventCountStr;

                if (dayDesc == tmpArr[0]) {
                    wemoUtil.infoLog(TAG, "Rule Event Same Day: " + dayDesc + " ," + tmpArr);
                    tmpArr[0] = "";
                    tmpArr[1] = "";
                    tmpArr[2] = "";

                    ruleEvents[dayStartCount][2] = eventCountStr;
                } else {
                    wemoUtil.infoLog(TAG, "Rule Event New Day: " + dayDesc + " ," + tmpArr);
                    dayDesc = tmpArr[0];
                    if (count > 10) return false;
                    dayStartCount = count;
                    eventCount = 1;
                }
                ruleEvents[count] = tmpArr;
                count = count + 1;

            });

            rule_details.buildCloudListItem(ruleEvents);
        } catch (err) {
            rule_details.hideModal();
            console.log(err);
            wemoUtil.infoLog(TAG, "Exception: " + err.message);
        }
    },

    ruleEventsOnCloud: function(ruleId) {
        try {
            wemoUtil.infoLog(TAG, "ruleEventsOnCloud ruleId : " + ruleId);
            cordova.exec(function(params) {
                wemoUtil.infoLog(TAG, "success call back");
                var authCode = params[0];
                var homeId = params[1];
                wemoUtil.infoLog(TAG, "authCode" + authCode + "homeId" + homeId);

                $.ajax({
                    url: cloudAPI.GET_RULE_EVENTS + ruleId + "?homeId=" + homeId,
                    type: "GET",
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function(data) {
                        wemoUtil.infoLog(TAG, "Sucess from cloud..." + data);
                        rule_details.bluildRuleEvents(data)
                        rule_details.hideModal();

                    },
                    error: function(xhr, textstatus) {
                        rule_details.hideModal();
                        wemoUtil.infoLog(TAG, 'ruleEventsOnCloud status: ' + xhr.status);
                        wemoUtil.infoLog(TAG, 'ruleEventsOnCloud status text: ' + xhr.statusText);

                    },
                    statusCode: {
                        500: function() {
                            wemoUtil.infoLog(TAG, "Server Error");
                        }
                    }

                });

            }, function(err) {
                wemoUtil.infoLog(TAG, "failure call back");
            }, "WebServicePlugin", "getAuthCode", []);

        } catch (err) {
            rule_details.hideModal();
            console.log(err);
            wemoUtil.infoLog(TAG, "Exception: " + err.message);
        }
    },

    convertDBOffsetToString: function(offset) {
        if (offset == undefined || offset == 0 || offset == "0") {
            return "";
        } else {
            offset = offset.toString();
            //console.log("---offset "+offset);
            var sign = offset.substr(0, 1) == "-" ? wemo.items["Before"] : wemo.items["After"];
            if (sign == wemo.items["Before"]) offset = offset.substr(1);
            var time = wemoUtil.convertSecondsToHoursMins(parseInt(offset, 10));
            var index = time.indexOf("ins");
            time = time.substr(0, index);
            //console.log("time "+time+" sign "+sign)
            return time + " " + sign;
        }
    },

    bindDisableEnableRule: function(db, rule, state, selectedRuleID) {
        // in case of rule going disable to enable, first check for the rule conflict or duplication with other enabled rules
        if(state == '0'){
            db.transaction(verifyRuleConflictAndDuplication, errorInVerifyingRule, successInVerifyingRule);
        }else{
            disableEnableRule();
        }

        function disableEnableRule(){
            state == '1' ? state = '0' : state = '1';
            db.transaction(updateData, errorCB, successCB);

            function updateData(tx) {
                tx.executeSql("UPDATE RULES SET State=? WHERE RuleID=?", [state, selectedRuleID], getAllRules, errorCB);
            }

            function getAllRules(tx) {
                tx.executeSql('SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.Level, b.ZBCapabilityStart, b.ZBCapabilityEnd from RULES a inner join RULEDEVICES b on a.RuleID=CAST(b.RuleID AS CHAR) order by a.Name COLLATE NOCASE', [], querySuccess, errorCB);
            }

            function updateNotification() {
                var notificationTimeout;
                var selectedRuleState = parseInt(state);
                if (selectedRuleState === 1) {
                    $(".notification").html(wemo.items["RuleEnabled"]).fadeIn();
                } else if (selectedRuleState === 0) {
                     $(".notification").html(wemo.items["RuleDisabled"]).fadeIn();
                }
                clearTimeout(notificationTimeout);
                notificationTimeout = setTimeout(function(){
                    $(".notification").fadeOut();
                }, 4000);

                nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);
            }

            function querySuccess(tx, results) {
                var len = results.rows.length;
                var ruleRows = [];
                if (len > 0) {
                    for (var i = 0; i < len; i++) {
                        ruleRows[i] = results.rows.item(i);
                    }
                }
                window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));
            }

            function errorCB() {
                console.log("Error!");
            }

            function successCB() {
                var text = wemo.items['RULE_STATUS_SENDING_DB'];
                var string = $('<p>' + text + '</p>').text();
                nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", string]);

                for (var dev1 = 0; dev1 < Object.keys(rule.Devices).length; dev1++) {
                    var udn = Object.keys(rule.Devices)[dev1];
                    if (wemoUtil.isMakerDevice(udn)) {
                        wemoUtil.pushScheduleSwitch(wemoUtil.getMakerSensorUDN(udn), dev1, Object.keys(rule.Devices).length, null, null, updateNotification);
                    } else {
                        wemoUtil.pushScheduleSwitch(Object.keys(rule.Devices)[dev1], dev1, Object.keys(rule.Devices).length, null, null, updateNotification);
                    }
                }
                window.sessionStorage.setItem(sessionStore.LAST_ENTRY, "0");
            }
        }

        function verifyRuleConflictAndDuplication(tx){
            function sortDev( arrDBdev , ruleDevices ) {
                wemoUtil.infoLog(TAG, "array of the devices from DB:");
                for (var i=0; i<arrDBdev.length ; i++) {
                    wemoUtil.infoLog(TAG, arrDBdev[i]);
                }
                wemoUtil.infoLog(TAG, "array of the devices from new rule:");
                for (var i=0; i<ruleDevices.length ; i++) {
                    wemoUtil.infoLog(TAG, ruleDevices[i]);
                }
                wemoUtil.infoLog(TAG, "sorting...");
                var tmpArr = [];
                for (var i=0; i<arrDBdev.length ; i++) {
                    var ind = $.inArray(arrDBdev[i], ruleDevices);
                    if ( ind != -1 ) {
                        tmpArr.push(ruleDevices[ind]);
                        ruleDevices.splice(ind,1);
                    }
                }
                var arr = $.merge(tmpArr,ruleDevices);
                wemoUtil.infoLog(TAG, "array 'ruleDevices' after sorting:");
                for (var i=0; i<arr.length ; i++) {
                    wemoUtil.infoLog(TAG, arr[i]);
                }
                return arr;
            }

            function sortDays ( arrDays ) {
                var tmpArr = [];
                if (  arrDays[0].toString() == "1" ) {
                    tmpArr = arrDays.splice(1);
                    tmpArr.push(1);
                    return tmpArr;
                } else {
                    return  arrDays;
                }
            }

            var getActiveRuleQuery = "SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.DeviceID, b.StartTime, b.RuleDuration, b.StartAction, b.EndAction, b.DayID, b.Value, b.SensorDuration from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID where a.State = '1' order by b.RuleID";

            tx.executeSql(getActiveRuleQuery, [],
                function (tx, results) {
                    var rulen = results.rows.length;
                    var ruleObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
                    var isConflicting = false;
                    var ruleConflictObj, ruleConflictObj_timer;
                    var str_rule_type;

                    switch (ruleObj.RuleType) {
                        case sessionStore.TIME_INTERVAL:
                        case sessionStore.SIMPLE_SWITCH:
                        case sessionStore.AWAY_MODE:
                        case sessionStore.LED_TIMER_RULE:
                            str_rule_type = ruleType.TIME_INTERVAL;
                            break;

                        case sessionStore.COUNTDOWN_TIMER:
                            str_rule_type = ruleType.COUNTDOWN_TIMER;
                            break;

                        case sessionStore.MOTION_CONTROLLED:
                            str_rule_type = ruleType.MOTION_CONTROLLED;
                            break;
                            
                        case sessionStore.MAKER_MOTION_CONTROLLED:
                            str_rule_type = ruleType.MAKER_MOTION_CONTROLLED;
                            break;
                      
                        case sessionStore.NOTIFY_ME:
                            str_rule_type = ruleType.NOTIFY_ME;
                            break;
                        
                        // in case of rules other than above cases
                        // we are allowing user to enable a conflicting/duplicate rule,
                        // need to add a case for another type of rule    
                        default:
                            disableEnableRule();
                            return false;
                            break;
                    }


                    if(rulen>0){
                        ruleConflictObj = verify_rule.ruleConflict[str_rule_type];

                        if(str_rule_type == ruleType.TIME_INTERVAL){

                            if(!isRemoteEnabled) {
                                deviceTabPlugin.execute(
                                    function(params){
                                        if(params.length>0){
                                            $.each(params,function(inx){
                                                av_sensors[params[inx].udn]=params[inx].friendlyName;
                                            });
                                        }
                                        else wemoUtil.infoLog(TAG, "No Sensors detected");

                                    },
                                    function(err){wemoUtil.infoLog(TAG, "Error detecting Sensors");},
                                    actions.SELECT_SENSORS,[]
                                );

                                deviceTabPlugin.execute(
                                    function(params){
                                        if(params.length>0){
                                            $.each(params,function(inx){
                                                av_switches[params[inx].udn]=params[inx].friendlyName;
                                            });
                                        } else wemoUtil.infoLog(TAG, "No Switches detected");
                                    },
                                    function(err){wemoUtil.infoLog(TAG, "Error detecting Switches");},

                                    actions.SELECT_SWITCHES,[]
                                );
                                
                                deviceTabPlugin.execute(
                                        function(params){
                                            if(params.length>0){
                                                $.each(params,function(inx){
                                                    av_switches[params[inx].udn]=params[inx].friendlyName;
                                                });
                                            } else wemoUtil.infoLog(TAG, "No insights detected");
                                        },
                                        function(err){wemoUtil.infoLog(TAG, "Error detecting insights");},

                                        actions.SELECT_INSIGHTS,[]
                                    );


                                //LED Array :
                                deviceTabPlugin.execute(
                                    function(params){
                                        if(params.length>0){
                                            $.each(params,function(inx){
                                                av_leddevices[params[inx].udn]=params[inx].friendlyName;
                                            });
                                        } else wemoUtil.infoLog(TAG, "No Leds detected");
                                    },
                                    function(err){wemoUtil.infoLog(TAG, "Error detecting Leds");},

                                    actions.SELECT_LED_DEVICES,[]
                                );
                                deviceTabPlugin.execute(
                                    function (params) {
                                        if (params.length > 0) {
                                            $.each(params, function (inx) {
                                                av_makers[params[inx].udn]=params[inx].friendlyName;
                                            });
                                        } else wemoUtil.infoLog(TAG, "No Maker is detected");
                                    },
                                    function (err) {
                                        wemoUtil.infoLog(TAG, "Error detecting Maker");
                                    },
                                    actions.SELECT_MAKER,[]
                                );
                            }
                            else
                            {
                                var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
                                var arrayInsightObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA);
                                var arraySensorObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SENSOR_DATA);
                                var arrayMakerObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA);
                                var arrayLedDeviceObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_DATA);

                                if(arraySwitchObjects.length>0){
                                    $.each(arraySwitchObjects,function(inx){
                                        av_switches[arraySwitchObjects[inx].udn]=arraySwitchObjects[inx].friendlyName;
                                    });
                                }

                                if(arraySensorObjects.length>0){
                                    $.each(arraySensorObjects,function(inx){
                                        av_sensors[arraySensorObjects[inx].udn]=arraySensorObjects[inx].friendlyName;
                                    });
                                }
                                
                                if (arrayInsightObjects.length > 0) {
                                    $.each(arrayInsightObjects, function (inx) {
                                        av_switches[arrayInsightObjects[inx].udn] = arrayInsightObjects[inx].friendlyName;
                                    });
                                }
                                
                                if(arrayMakerObjects.length>0){
                                    $.each(arrayMakerObjects,function(inx){
                                        av_sensors[arrayMakerObjects[inx].udn]=arrayMakerObjects[inx].friendlyName;
                                    });
                                }
                                //LED code
                                if(arrayLedDeviceObjects.length>0){
                                    $.each(arrayLedDeviceObjects,function(inx){
                                        av_leddevices[arrayLedDeviceObjects[inx].pluginId]=arrayLedDeviceObjects[inx].friendlyName;
                                    });
                                }
                            }

                            var grouped = {};
                            for (var i = 0; results.rows.length > i; i++) {
                                var record = results.rows.item(i);
                                if(!(record.RuleID in grouped)) {
                                    grouped[record.RuleID] = [];
                                }
                                grouped[record.RuleID].push({
                                    rowDayID: record.DayID,
                                    rowDeviceID: record.DeviceID,
                                    rowRuleName: record.Name,
                                    rowRuleValue: record.Value,
                                    rowRuleName: record.Name,
                                    rowSDuration: record.SensorDuration,
                                    rowType: record.Type,
                                    rowStartTime: record.StartTime,
                                    rowRuleDuration: record.RuleDuration,
                                    rowStartAction: record.StartAction,
                                    rowEndAction: record.EndAction,
                                    rowState: record.State,
                                    rowRuleID: record.RuleID
                                });
                            }

                            var rowDays = [];
                            var arrDev = [];//Maria: array of devices from DB grouped by RuleID
                            $.each(grouped, function(RuleID, records) {
                                rowDays[RuleID] = [];
                                arrDev[RuleID] = [];
                                $.each(records, function(ix, record) {
                                    if ( $.inArray( record.rowDayID, rowDays[RuleID] ) == -1 ) { rowDays[RuleID].push(record.rowDayID);}
                                    if ( $.inArray( record.rowDeviceID, arrDev[RuleID] ) == -1 ) {arrDev[RuleID].push(record.rowDeviceID);}
                                });
                            });
                            window.sessionStorage.removeItem("away_conflict");
                            var ruleDevices = [];//Maria: copying the devices from obj rule.Devices into array
                            for(var device in rule.Devices){
                                ruleDevices.push(device);
                            }
                            $.each(grouped, function(RuleID, records) {
                                ruleDevices = sortDev( arrDev[RuleID] , ruleDevices);
                            });

                            $.each(grouped, function(RuleID, records) {
                                var days = sortDays( rowDays[RuleID] ).join("-");
                                var sensorName="";
                                var rowSensorValue="-1";
                                $.each(records, function(ix, record) {
                                    var ruleDevice=record.rowDeviceID;
                                    sensorName=av_sensors[record.rowDeviceID];
                                    rowSensorValue=record.rowRuleValue;
                                });

                                if(Object.keys(rule.Devices).length>0){

                                    for ( var iDev=0; iDev < ruleDevices.length ; iDev++ ) {
                                    //for (device in rule.Devices) {
                                         device = ruleDevices[iDev];
                                         var selectedDev = $.trim(rule.Devices[device].SelectedLedValue);
                                         
                                        var deviceFriendname = "";

                                        if(selectedDev == 1)
                                        {
                                            if(av_leddevices[device] == "" || av_leddevices[device] == undefined)
                                            {
                                                deviceFriendname = wemo.items['dimmableLight'];
                                            }
                                            else
                                            {
                                                deviceFriendname = av_leddevices[device];
                                            }

                                        }
                                        else
                                        {
                                            deviceFriendname = av_switches[device];
                                        }

                                        if(wemoUtil.isMakerDevice(device)){
                                            deviceFriendname = av_makers[wemoUtil.getOriginalMakerUDN(device)];
        
                                        }

                                        if(rule_details.isSimpleWhen(ruleObj)){
                                            ruleConflictObj_timer = ruleConflictObj["SIMPLE"]
                                        }else{
                                            ruleConflictObj_timer = ruleConflictObj["INTERVAL"]
                                        }
                                        
                                        isConflicting = ruleConflictObj_timer.verifyConflictsDuplicates(device, records, rule, days, rowSensorValue, deviceFriendname, sensorName);
                                        
                                        if (isConflicting) {
                                            return false;
                                        }
                                    }
                                }
                            });
                        
                        }else{
                            isConflicting = ruleConflictObj.verifyRuleDuplicatesAndConflicts(ruleObj, results.rows);
                        }

                        if (isConflicting) {
                            wemoUtil.infoLog("Conflicting/Duplicate",  "Duplicate Rule found. Require changes.");
                            return false;
                        }else{
                            wemoUtil.infoLog("No Conflict/Duplicate",  "Not a conflict or duplicae rule. continue enabling..");
                            disableEnableRule();
                        }
                    }else{
                        disableEnableRule();
                    }
                },
            function(){
                wemoUtil.infoLog("Error!", "error In query");
            });
        }

        function errorInVerifyingRule(){
            wemoUtil.infoLog("Error!", "errorInVerifyingRule");
        }

        function successInVerifyingRule(){
            wemoUtil.infoLog("Success!", "successInVerifyingRule");
        }
    },

    checkIfFirmwareSupported: function(rule) {
        var networktype = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_NETWORKTYPE);
        if (((rule.When.OnModeOffset != undefined && rule.When.OnModeOffset != 0) || (rule.When.OffModeOffset != undefined && rule.When.OffModeOffset != 0)) || rule.RuleType == sessionStore.AWAY_MODE) {
            for (key in rule.Devices) {
                if (networktype == null || networktype == networkType.HOME_NETWORK) {
                    devicePlugin.execute(
                        function(params) {
                            isFWSupported = params;
                        },
                        wemoUtil.reportError,
                        actions.GET_FIRMWARE_VERSION_SO, [key]
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
                                            isFWSupported = "true";
                                        } else {
                                            wemoUtil.infoLog(wemoUtil.TAG, 'firmware is supported SO_RULE');
                                            isFWSupported = "false";
                                        }
                                    }
                                }
                            } else {
                                wemoUtil.loadUrl(filePath.REMOTE_NOT_AVAILABLE);
                            }
                        },
                        wemoUtil.reportError,
                        actions.IS_REMOTE_ENABLED, []
                    );
                }
            }
            if (isFWSupported == "false")
                return;
        }
        if ((rule.When.StartSRSS != undefined && rule.When.EndSRSS == undefined) || (rule.When.StartSRSS == undefined && rule.When.EndSRSS != undefined) || (rule.When.StartSRSS != undefined && rule.When.EndSRSS != undefined)) {
            if (Object.keys(rule.Devices).length > 0) {
                for (key in rule.Devices) {
                    console.log("SRSS - UDN Firmware Version - " + key + "  ::  " + rule.Devices[key]);
                    isFWSupported = wemoUtil.getFirmwareVersionSRSS(key);

                }
            }
            if (isFWSupported == "false")
                return;
        }
        console.log(" isFWSupported :: " + isFWSupported);
    }

};
