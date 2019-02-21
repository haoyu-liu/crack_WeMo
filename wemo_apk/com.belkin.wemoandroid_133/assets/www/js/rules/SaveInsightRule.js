/**
 SaveNewRule.js

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

var isSensorNotificaton = false;
var isMakerSensorNotificaton = false;
var isKeychainPresenceNotification = false;
var isDWNotficationRule = false;
if (window.sessionStorage.getItem(sessionStore.GCM_SENSOR) == "1") {
    isSensorNotificaton = true;
} else if (window.sessionStorage.getItem(sessionStore.GCM_MAKER_SENSOR) == "1") {
    isMakerSensorNotificaton = true;
} else if (window.sessionStorage.getItem(sessionStore.GCM_KEYCHAIN_PRESENCE) == "1") {
	isKeychainPresenceNotification = true;
} else if (window.sessionStorage.getItem(sessionStore.GCM_DOOR_WINDOW) == stringBoolean.TRUE) {
	isDWNotficationRule = true;
}

$(window).unload(function () {
    window.sessionStorage.setItem(sessionStore.GCM_SENSOR, "0");
    window.sessionStorage.setItem(sessionStore.GCM_MAKER_SENSOR, "0");
    window.sessionStorage.setItem(sessionStore.GCM_KEYCHAIN_PRESENCE, "0");
});

function deCodeDays(arg) {
    console.log("Inside De-Code Days:  " + arg);
    switch (arg) {
        case "Daily" :
            return 0;
            break;
        case "Sun" :
            return 1;
            break;
        case "Mon" :
            return 2;
            break;
        case "Tue" :
            return 3;
            break;
        case "Wed" :
            return 4;
            break;
        case "Thu" :
            return 5;
            break;
        case "Fri" :
            return 6;
            break;
        case "Sat" :
            return 7;
            break;
        case "Weekdays" :
            return 8;
            break;
        case "Weekends" :
            return 9;
            break;
        case "Mon-Tue-Wed-Thu-Fri" :
            return 8;
            break;
        case "Sat-Sun" :
            return 9;
            break;
        case "Mon-Tue-Wed-Thu-Fri-Sat-Sun" :
            return 0;
            break;
        default :
            console.log("Inside default");
            break;
    }
    return "";
}

function saveNewRule_RULES_RULEDEVICES(arg, ruleObj) {
    var av_switches = [], av_sensors = [], av_makers = [];
    deviceTabPlugin.execute(
        function (params) {
            if (params.length > 0) {
                $.each(params, function (inx) {
                    av_sensors[params[inx].udn] = params[inx].friendlyName;
                });
            }
            else console.log("No Sensors detected");

        },
        function (err) {
            console.log("Error detecting Sensors");
        },
        actions.SELECT_SENSORS, []
    );

    deviceTabPlugin.execute(
        function (params) {
            if (params.length > 0) {
                $.each(params, function (inx) {
                    av_switches[params[inx].udn] = params[inx].friendlyName;
                });
            } else console.log("No Switches detected");
        },
        function (err) {
            console.log("Error detecting Switches");
        },

        actions.SELECT_SWITCHES, []
    );
    deviceTabPlugin.execute(
        function (params) {
            if (params.length > 0) {
                $.each(params, function (inx) {
                    av_makers[params[inx].udn] = params[inx].friendlyName;
                });
            } else console.log("No Maker is detected");
        },
        function (err) {
            console.log("Error detecting Makers");
        },
        actions.SELECT_MAKER, []
    );
    console.log("Inserting for - " + arg);
    var rule = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
    
    if (rule.When.OnModeOffset == undefined) rule.When.OnModeOffset = 0;
    if (rule.When.OffModeOffset == undefined) rule.When.OffModeOffset = 0;
    
    if(isKeychainPresenceNotification){
    	rule.RuleType = sessionStore.NOTIFY_ME;
    	ruleObj.RuleType = sessionStore.NOTIFY_ME;
    	window.sessionStorage.setItem(sessionStore.RULE_NEW, JSON.stringify(ruleObj));
        window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify(sessionStore.NOTIFY_ME));
    }
    else if(isDWNotficationRule){
    	rule.RuleType = sessionStore.NOTIFY_ME;
    	ruleObj.RuleType = sessionStore.NOTIFY_ME;
    	window.sessionStorage.setItem(sessionStore.RULE_NEW, JSON.stringify(ruleObj));
        window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify(sessionStore.NOTIFY_ME));
    }

    console.log("OnModeOffset " + rule.When.OnModeOffset);
    console.log("OffModeOffset " + rule.When.OffModeOffset);

    if (rule.When.RuleDuration == undefined) {
        if (rule.When.StartTime > rule.When.EndTime) {
            var tmpDur = timestamp.MAX_HOUR - rule.When.StartTime;
            tmpDur += rule.When.EndTime;
            rule.When.RuleDuration = tmpDur;
        }
        else {
            rule.When.RuleDuration = rule.When.EndTime - rule.When.StartTime;
        }
    }

    trace("JSON RULE===> " + JSON.stringify(rule));

    var isError = false;
    var saved = false;
    if (Object.keys(rule.Devices).length <= 0) {
        if (isSensorNotificaton) {
            alert("Please select sensor");
        } else if (isMakerSensorNotificaton) {
            alert("Please select  maker sensor");
        }
        else {
            alert("Please select insight");
        }
        return;
    }

    var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
    db.transaction(getMax, errorCB, successCB);
    db.transaction(getRules, errorCB, successfullySaved);

    function getMax(tx) {

        tx.executeSql('SELECT RuleID  FROM RULES ORDER BY CAST(RuleID AS INT) DESC', [], querySuccess, errorCB);

        function querySuccess(tx, res) {
            if (parseInt(res.rows.length) > 0) {
                var len = parseInt(res.rows.item(0).RuleID) + 1;
            }
            else {
                len = 1;
            }
            trace("RuleID " + len);


            //Sometimes initialized DB is overwritten by WeMo, need to repair it
            //wemoUtil.DBCreate();

            trace("ruleObj.id===> " + ruleObj.id);

            if (ruleObj.id > 0) {
                if (isSensorNotificaton || isMakerSensorNotificaton || isKeychainPresenceNotification || isDWNotficationRule) {
                    executeQuery = 'SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.DeviceID, b.StartTime, b.RuleDuration, b.StartAction, b.EndAction, b.Level, b.DayID, b.Value, b.SensorDuration, c.NotificationDuration, c.NotifyRuleID, c.NotificationMessage   from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID inner join SENSORNOTIFICATION as c on c.RuleID=a.RuleID where b.RuleID == ' + ruleObj.id + ' order by a.Name COLLATE NOCASE';
                }
                else {
                    executeQuery = 'SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.DeviceID, b.StartTime, b.RuleDuration, b.StartAction, b.EndAction, b.Level, b.DayID, b.Value, b.SensorDuration, c.Frequency, c.Message   from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID inner join RULESNOTIFYMESSAGE as c on c.RuleID=a.RuleID where b.RuleID <> ' + ruleObj.id + ' order by a.Name COLLATE NOCASE';
                }
            } else {
                if (isSensorNotificaton || isMakerSensorNotificaton || isKeychainPresenceNotification || isDWNotficationRule) {
                    executeQuery = 'SELECT distinct a.RuleID, a.Name, a.Type, b.DeviceID, a.State, b.StartTime, b.RuleDuration, b.StartAction, b.EndAction, b.Level, b.DayID, b.Value, b.SensorDuration, c.NotificationDuration, c.NotificationMessage   from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID inner join SENSORNOTIFICATION as c on c.RuleID=a.RuleID order by a.Name COLLATE NOCASE';
                }
                else {
                    executeQuery = 'SELECT distinct a.RuleID, a.Name, a.Type, b.DeviceID, a.State, b.StartTime, b.RuleDuration, b.StartAction, b.EndAction, b.Level, b.DayID, b.Value, b.SensorDuration, c.Frequency, c.Message   from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID inner join RULESNOTIFYMESSAGE as c on c.RuleID=a.RuleID order by a.Name COLLATE NOCASE';
                }
            }

            tx.executeSql(executeQuery, [],
                function (tx, results) {
                    var rulen = results.rows.length;
                    var strDays = rule.SelectedDayOrRange;
                    var ruleName = rule.RuleName.replace(/\"/g, '&quot;');
                    console.log("SaveInsightRule_ruleName" + ruleName);
                    var arrDays = strDays.split("-");
                    var NotifyRuleID = parseInt((new Date().getTime() - (11323 * timestamp.MAX_HOUR * 1000)) / 1000, 10);
                    if (Object.keys(rule.Devices).length > 0) {
                        for (device in rule.Devices) {
                            if (rule.Devices[device].SensorDuration > 0) {
                                NotifyRuleID = rule.Devices[device].SensorDuration;
                            }
                            else if (rule.Devices[device].SensorDuration == "-1") {
                                for (var i = 0; i < rulen; i++) {
                                    if (results.rows.item(i).NotifyRuleID != undefined) {
                                        NotifyRuleID = results.rows.item(i).NotifyRuleID;
                                    }
                                }
                            }
                        }
                    }

                    trace("rulen= " + rulen + " strDays=" + strDays);


                    if (verifyRuleDuplicatesAndConflicts(rule, results.rows)) {
                        return false;
                    }

                    console.log("SaveInsightRule ruleObj.When.isFirmWareSupported" + ruleObj.When.isFirmWareSupported);
                    // if ((rule.When.StartSRSS != undefined && rule.When.EndSRSS == undefined) || (rule.When.StartSRSS == undefined && rule.When.EndSRSS != undefined) || (rule.When.StartSRSS != undefined && rule.When.EndSRSS != undefined)) {
                    if (ruleObj.When.isFirmWareSupported != undefined && ruleObj.When.isFirmWareSupported === "false") {
                    	console.log("SaveInsightRule isFirmWareSupported");
                        rule.State = 0;
                    }
                    // }

                    if (ruleObj.id > 0) {
                        tx.executeSql("DELETE FROM RULEDEVICES WHERE RuleID='" + ruleObj.id + "'", [], function () {
                            console.log("RuleDevice with ID : " + ruleObj.id + " is deleted");
                        }, errorCB);

                        if (isSensorNotificaton || isMakerSensorNotificaton || isKeychainPresenceNotification || isDWNotficationRule) {
                            tx.executeSql("DELETE FROM SENSORNOTIFICATION WHERE RuleID='" + ruleObj.id + "'", [], function () {
                                console.log("RuleNotifyMessage with ID : " + ruleObj.id + " is deleted");
                            }, errorCB);
                        }
                        else {
                            tx.executeSql("DELETE FROM RULESNOTIFYMESSAGE WHERE RuleID='" + ruleObj.id + "'", [], function () {
                                console.log("RuleNotifyMessage with ID : " + ruleObj.id + " is deleted");
                            }, errorCB);
                        }

                        tx.executeSql("DELETE FROM DEVICECOMBINATION WHERE RuleID='" + ruleObj.id + "'", [], function () {
                            console.log("DEVICECOMBINATION with ID : " + ruleObj.id + " is deleted");
                        }, errorCB);

                        rule.id = ruleObj.id;
                        //Update rule
                        tx.executeSql('UPDATE RULES SET Name = "' + ruleName + '" WHERE RuleID="' + ruleObj.id + '"');
                    }
                    else {
                        rule.id = len;
                        
                        //Insert new rule
                        tx.executeSql('INSERT INTO RULES (RuleID, Name, Type, RuleOrder, StartDate, EndDate,State, Sync) VALUES ("' + rule.id + '","' + ruleName + '", "' + rule.RuleType + '", "2", "12201982", "07301982","' + rule.State + '", "NOSYNC")');
                    }

                    rule.NotifyRuleID = NotifyRuleID;

                    var message = "";
                    if(typeof rule.NotifyMessage != "undefined" && rule.NotifyMessage != null){
                        message = rule.NotifyMessage;
                        message = message.replace(/'/g, "\'\'");
                        message = message.replace(/"/g, "\"\"");
                    }
                    
                    //Insert new notify message associated with new rule

                    console.log("NotifyRuleID is :: " + NotifyRuleID);
                    var notificationDuration = -1;
                    if(isKeychainPresenceNotification || isDWNotficationRule){
                    	message = "";
                    }
                    else if(isSensorNotificaton || isMakerSensorNotificaton){
                    	notificationDuration = parseInt(rule.NotificationDuration, 10);
                    }
                    if (isSensorNotificaton || isMakerSensorNotificaton || isKeychainPresenceNotification || isDWNotficationRule) {
                        tx.executeSql('INSERT INTO SENSORNOTIFICATION (RuleID, NotifyRuleID, NotificationMessage, NotificationDuration) VALUES ("' + rule.id + '", "' + NotifyRuleID + '","' + message + '", "' + notificationDuration + '")');
                    }
                    else {
                        tx.executeSql('INSERT INTO RULESNOTIFYMESSAGE (RuleID, NotifyRuleID, Message, Frequency) VALUES ("' + rule.id + '", "' + NotifyRuleID + '","' + message + '", "' + parseInt(rule.Frequency, 10) + '")');
                    }

                    //Create new rule schedule
                    var Days = getDays(arrDays);

                    var StartTime = "";
                    var RuleDuration = "";
                    if (Object.keys(rule.Devices).length > 0) {
                        for (var device in rule.Devices) {
                            if (!isMakerSensorNotificaton) {
                                if (rule.Devices[device].Level == 1 || rule.Devices[device].Level == 0) {
                                    var type = codeType.E_STATE;
                                    var value = codeValue.E_EQUAL;
                                } else {
                                    var type = codeType.E_ON_DURATION;
                                    var value = codeValue.E_LARGER;
                                }

                                for (var daysCount1 = 0; daysCount1 < arrDays.length; daysCount1++) {
                                    if ( rule.When.StartSRSS != undefined ) {
                                        if (rule.When.StartSRSS === "Sunrise") StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSR"];
                                        else StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSS"];
                                        RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                    }  else
                                    if ( rule.When.EndSRSS != undefined ) {
                                        StartTime = rule.When.StartTime;
                                        RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                    } else {
                                        StartTime = rule.When.StartTime;
                                        RuleDuration = rule.When.RuleDuration;
                                    }
                                    if ( StartTime == undefined ) StartTime = rule.When.StartTime;
                                    if ( RuleDuration == undefined ) RuleDuration = rule.When.RuleDuration;

                                    var productName = "";

                                    console.log("before Push First :: " + '(' + rule.id + ',"' + device + '", "0", ' + deCodeDays(arrDays[daysCount1]) + ', "' + StartTime + '","' + RuleDuration + '", ' + rule.Devices[device].StartAction + ', ' + rule.Devices[device].EndAction + ', "' + NotifyRuleID + '","-1","-1","-1")');
                                    if (isSensorNotificaton || isKeychainPresenceNotification || isDWNotficationRule) {
                                        if(!rule.Devices[device].Level){rule.Devices[device].Level = 1}
                                        tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime, EndTime) VALUES ("' + rule.id + '","' + device + '", 0, "' + deCodeDays(arrDays[daysCount1]) + '", "' + StartTime + '","' + RuleDuration + '", "' + rule.Devices[device].StartAction + '", "' + rule.Devices[device].EndAction + '", -1,0,-1,' + rule.Devices[device].Level +',"","",' + rule.When.OnModeOffset + ',' + rule.When.OffModeOffset + ',-1,' + rule.When.EndTime +')');
                                    }
                                    else {
                                        tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime, EndTime) VALUES ("' + rule.id + '","' + device + '", 0, "' + deCodeDays(arrDays[daysCount1]) + '", "' + StartTime + '","' + RuleDuration + '", "' + rule.Devices[device].StartAction + '", "' + rule.Devices[device].EndAction + '", "' + NotifyRuleID + '",-1,-1,-1,"","",' + rule.When.OnModeOffset + ',' + rule.When.OffModeOffset + ',-1,' + rule.When.EndTime +')');
                                    }
                                }
                                if (!isSensorNotificaton && !isKeychainPresenceNotification && !isDWNotficationRule)
                                    tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime, EndTime) VALUES ("' + rule.id + '","' + device + '", 1, -1, -1,-1, "-1.0", "-1.0", -1,' + type + ',' + value + ',' + rule.Devices[device].Level + ',"","",' + rule.When.OnModeOffset + ',' + rule.When.OffModeOffset + ',-1,' + rule.When.EndTime +')');
                                tx.executeSql('INSERT INTO DEVICECOMBINATION (RuleID, SensorID, SensorGroupID, DeviceID, DeviceGroupID) VALUES ("' + rule.id + '","' + device + '", "1", "' + device + '", "0")');
                            }
                            else {
                                var newUdn;
                                if (device.indexOf("uuid:Maker") != -1) {
                                    newUdn = wemoUtil.getMakerSensorUDN(device);
                                }
                                for (var daysCount1 = 0; daysCount1 < arrDays.length; daysCount1++) {
                                    if ( rule.When.StartSRSS != undefined ) {
                                        if (rule.When.StartSRSS === "Sunrise") StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSR"];
                                        else StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSS"];
                                        RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                    }  else
                                    if ( rule.When.EndSRSS != undefined ) {
                                        StartTime = rule.When.StartTime;
                                        RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                    } else {
                                        StartTime = rule.When.StartTime;
                                        RuleDuration = rule.When.RuleDuration;
                                    }
                                    if ( StartTime == undefined ) StartTime = rule.When.StartTime;
                                    if ( RuleDuration == undefined ) RuleDuration = rule.When.RuleDuration;

                                    console.log("before Push First :: " + '(' + rule.id + ',"' + newUdn + '", "0", ' + deCodeDays(arrDays[daysCount1]) + ', "' + StartTime + '","' + RuleDuration + '", ' + rule.Devices[device].StartAction + ', ' + rule.Devices[device].EndAction + ', "' + NotifyRuleID + '","-1","-1","-1")');
                                    tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime, EndTime) VALUES ("' + rule.id + '","' + newUdn + '", 0, "' + deCodeDays(arrDays[daysCount1]) + '", "' + StartTime + '","' + RuleDuration + '", "' + rule.Devices[device].Level + '", "-1", -1,-1,"' + rule.Devices[device].Level + '",-1,"","",' + rule.When.OnModeOffset + ',' + rule.When.OffModeOffset + ',-1,' + rule.When.EndTime +')');
                                }
//                    			tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level) VALUES ("' + rule.id  + '","' + newUdn + '", 1, -1, -1,-1, "' + rule.Devices[device].Level + '", "-1.0", -1,-1,-1,-1)');
//                    			tx.executeSql('INSERT INTO DEVICECOMBINATION (RuleID, SensorID, SensorGroupID, DeviceID, DeviceGroupID) VALUES ("' + rule.id  + '","'+newUdn+'", "1", "'+newUdn+'", "0")');
                            }
                        }
                    }

                    saved = true;

                }, errorCB);

        }

    }

    //Rule Duplicate Popup
    $("#rule_duplicate_learn_more_btn").on("click", function () {
        //alert("Learn More");
        if (!isRemoteEnabled) {
            deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
        }
       window.open(wemo.items['Help_Rules_Alert_Url'], "_system");
        $("#rule_duplicate").popup("close");


    });

    $("#rule_duplicate_ok_btn").on("click", function () {
        //alert("Rule Duplicate");
        $("#rule_duplicate").popup("close");
        $("RuleDuplicateText").html("");
        //return;
        //return false;
    });

    function showConflictDuplicateMessage(ruleName, msgType, device, ruleStart, ruleEnd) {
        var RuleconflictHeader = wemo.items['RuleConflict'];
        var RuleduplicateHeader = wemo.items['RuleDuplicate'];

        if (msgType == "duplicate_name" || msgType == "duplicate_rule") {
            var ruleConflictLocalizedmsg = wemo.items['RuleDuplicateText'];
            var temparr = ruleConflictLocalizedmsg.split("%@");
            var msgText = temparr[0] + " " + ruleName + " " + temparr[1];


            $("#ruleInfoHeader").text(RuleduplicateHeader);
            $("#RuleDuplicateText").text(msgText);
            $("#rule_duplicate").popup("open");
        }

        if (msgType == "conflict_day_rule") {
            var ruleConflictLocalizedmsg = wemo.items['RuleConflictNotifyRuleAllDay'];
            var temparr = ruleConflictLocalizedmsg.split("%@");
            var msgText = temparr[0] + " " + ruleName + " " + temparr[1];

            $("#ruleInfoHeader").text(RuleconflictHeader);
            $("#RuleDuplicateText").text(msgText);
            $("#rule_duplicate").popup("open");
        }

        if (msgType == "conflict_rule") {
            var ruleConflictLocalizedmsg = wemo.items['RuleConflictNotifyRule'];
            var temparr = ruleConflictLocalizedmsg.split("%@");
            var msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " + ruleStart + " " + temparr[2] + " " + ruleEnd + " " + temparr[3];

            $("#ruleInfoHeader").text(RuleconflictHeader);
            $("#RuleDuplicateText").text(msgText);
            $("#rule_duplicate").popup("open");
        }

    }

    function getDays(arrDays) {
        var Days = [];
        trace("arrDays.length " + arrDays.length);
        if (arrDays.length == 1) {
            var deCodeDaysValue = deCodeDays(arrDays[0]);
            switch (deCodeDaysValue) {
                case 0:
                    Days = [1, 2, 3, 4, 5, 6, 7];
                    break;
                case 8:
                    Days = [2, 3, 4, 5, 6];
                    break;
                case 9:
                    Days = [7, 1];
                    break;
                default:
                    Days = [ deCodeDaysValue ]; //one day
            }
        } else {
            for (var daysCount1 = 0; daysCount1 < arrDays.length; daysCount1++) {
                Days.push(deCodeDays(arrDays[daysCount1]));
            }
        }

        return Days;
    }

    //Function to check if device is used by rule
    function deviceUsed(rule, devid) {
        if (Object.keys(rule.Devices).length > 0) {
            for (device in rule.Devices) {
                console.log("deviceUsed() :: device--> " + device + "  && devid--> " + devid);
                if (wemoUtil.isMakerDevice(device))
                    device = wemoUtil.getMakerSensorUDN(device);
                if (device == devid) {
                    return true;
                }
            }
        }

        return false;
    }

    //Function to compare two rules
    function rulesEquals(rule1, rule2, ruleRowDevicesLev) {
        console.log("rulesEquals()--> rule1--> " + JSON.stringify(rule1));
        console.log("rulesEquals()--> rule2--> " + JSON.stringify(rule2));

        if (!deviceUsed(rule1, rule2.DeviceID)) {
            return false;
        }
        var devID = rule2.DeviceID;
        console.log("devID "+devID);

    	if(!wemoUtil.isMakerDevice(devID)){
            if(devID.indexOf("uuid:Sensor")!=-1 || isSensorNotificaton)
    			{
    		    if ((rule1.When.StartTime == rule2.StartTime) &&
    				(rule1.When.RuleDuration == rule2.RuleDuration) &&
        			(rule1.State == rule2.State)
        		) {
        			if (rule1.SelectedDayOrRange == "Daily" || rule1.SelectedDayOrRange == sessionStore.DAILY_VAL) {
        				console.log("rulesEquals --> Motion daily");
        				return true;
        			}
        			else {
        				if (checkDayOverlap(rule1, rule2)) {
        					console.log("rulesEquals --> Motion Overlap Condition");
        					return true;
        				}
        			}
        		}
    		}
    		else if ((rule1.When.StartTime == rule2.StartTime) &&
                (rule1.When.RuleDuration == rule2.RuleDuration) &&
                (rule1.Devices[devID].Level == ruleRowDevicesLev[devID].Level) &&
                (rule1.NotifyMessage == (rule2.Message ? rule2.Message : rule2.NotificationMessage)) &&
                (rule1.State == rule2.State)
            ) {
                if (rule1.SelectedDayOrRange == "Daily" || rule1.SelectedDayOrRange == sessionStore.DAILY_VAL) {
                    return true;
                }
                else {
                    if (checkDayOverlap(rule1, rule2)) {
                        return true;
                    }
                }
            }
        }
        else {
            var changedUdn = wemoUtil.getOriginalMakerUDN(devID);
            var level;
            if(rule1.Devices[devID] != undefined){
            	level = rule1.Devices[devID].Level;
            }
            else if(rule1.Devices[changedUdn] != undefined){
            	level = rule1.Devices[changedUdn].Level;
            }
            if ((rule1.When.StartTime == rule2.StartTime) &&
                (rule1.When.RuleDuration == rule2.RuleDuration) &&
                (level == rule2.StartAction) &&
                (rule1.NotifyMessage == (rule2.Message ? rule2.Message : rule2.NotificationMessage)) &&
                (rule1.State == rule2.State)
            ) {
                console.log("rulesEquals --> 111");
                if (rule1.SelectedDayOrRange == "Daily" || rule1.SelectedDayOrRange == sessionStore.DAILY_VAL) {
                    console.log("rulesEquals --> 222");
                    return true;
                }
                else {
                    if (checkDayOverlap(rule1, rule2)) {
                        console.log("rulesEquals --> 333");
                        return true;
                    }
                }
            }
        }

        return false;
    }

    function checkDayOverlap(rule1, rule2) {
        var arrDays = rule1.SelectedDayOrRange.split("-");
        var Days = getDays(arrDays);
        for (var i = 0; i < Days.length; i++) {
            if (Days[i] == rule2.DayID) {
                return true;
            }
        }

        return false;
    }

    function isWholeDay(rule) {
        return rule.StartTime == 0 && rule.RuleDuration == timestamp.MAX_HOUR;
    }

    function ruleConflicts(rule2, rule1, ruleRowDevicesLev) {
        if (!deviceUsed(rule2, rule1.DeviceID)) {
            return false;
        }

        if (checkDayOverlap(rule2, rule1) && rule2.State == rule1.State) {
            //We don't check next day overlap to be consistent with iOS code
            //See RuleUtility.m:1771

            var rule1End = parseInt(rule1.StartTime) + parseInt(rule1.RuleDuration);
            var devID = rule1.DeviceID;
            //Case 1
            //New rule interval is inside existing interval
            if (rule1.StartTime < rule2.When.StartTime && rule1End > rule2.When.EndTime) {
                return true;
            }

            //Case 2
            //New rule interval partialy overlaps with existing
            if (rule2.When.StartTime < rule1.StartTime && (rule2.When.EndTime < rule1End && rule2.When.EndTime > rule1.StartTime)) {
                return true;
            }
            if (rule2.When.EndTime > rule1.EndTime && (rule2.When.StartTime > rule1.StartTime && rule2.When.StartTime < rule1End)) {
                return true;
            }

            //Case 3
            //Existing rule interval is inside new rule interval
            if (rule2.When.StartTime < rule1.StartTime && rule2.When.StartTime > rule1End) {
                return true;
            }

            if (!wemoUtil.isMakerDevice(devID)) {
                if ((rule2.When.StartTime == rule1.StartTime) &&
                    (rule2.When.RuleDuration == rule1.RuleDuration) &&
                    (rule2.Devices[devID].Level == ruleRowDevicesLev[devID].Level)
                ) {
                    return true;
                }
            }
            else {
                var changedUdn = wemoUtil.getOriginalMakerUDN(devID);
                var level;
                if(rule2.Devices[devID] != undefined){
                	level = rule2.Devices[devID].Level;
                }
                else if(rule2.Devices[changedUdn] != undefined){
                	level = rule2.Devices[changedUdn].Level;
                }
                if ((rule2.When.StartTime == rule1.StartTime) &&
                    (rule2.When.RuleDuration == rule1.RuleDuration) &&
                    (level == rule1.StartAction)
                ) {
                    return true;
                }
            }
        }

        return false;
    }

    function verifyRuleDuplicatesAndConflicts(rule, ruleRow) {
        //Check rule for duplication
        console.log("Check for rule for dupilacation...");
        console.log("New rule name: " + rule.RuleName);
        console.log(JSON.stringify(rule));
        console.log(JSON.stringify(ruleRow));

        var ruleRowDevicesLev = {};
        var devID;

        for (var i = 0; i < ruleRow.length; i++) {
            if (ruleRow.item(i) != undefined) {
                if ("" + ruleRow.item(i).StartTime == "-1") {
                    devID = ruleRow.item(i).DeviceID;
                    ruleRowDevicesLev[devID] = {};
                    ruleRowDevicesLev[devID].Level = ruleRow.item(i).Level;
                }
            }
        }

        for (var i = 0; i < ruleRow.length; i++) {
            var tmpRule = ruleRow.item(i);
            if (tmpRule != undefined) {
                if (wemoUtil.getRuleClass(rule.RuleType) == wemoUtil.getRuleClass(tmpRule.Type)) {
                	if(rule.id == tmpRule.RuleID){
                		return false;
                	}
                	console.log("tmpRule Type::"+tmpRule.Type);
            if(tmpRule.Type == "Insight Rule" || tmpRule.Type == sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE || tmpRule.Type == "Notify Me") {
                        var tmpRuleName = tmpRule.RuleName;
                        if (rulesEquals(rule, tmpRule, ruleRowDevicesLev)) {
                            console.log(JSON.stringify(tmpRule));
                            console.log("Found new rule duplication with: " + tmpRuleName);
                            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                            showConflictDuplicateMessage(tmpRule.Name, "duplicate_rule", tmpRule.DeviceID, null, null);
                            return true;
                        }

                        if (ruleConflicts(rule, tmpRule, ruleRowDevicesLev)) {
                            if (isWholeDay(rule)) {
                                console.log(JSON.stringify(tmpRule));
                                console.log("Found new rule whole-day conflict with: " + tmpRuleName);
                                nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                showConflictDuplicateMessage(tmpRule.Name, "conflict_day__rule", tmpRule.DeviceID, null, null);
                                return true;
                            }
                            else {
                                console.log(JSON.stringify(tmpRule));
                                console.log("Found new rule conflict with: " + tmpRuleName);
                                nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                showConflictDuplicateMessage(tmpRule.Name, "conflict_rule", tmpRule.DeviceID, wemoUtil.convertMillisecondsToAMPM(tmpRule.StartTime), wemoUtil.convertMillisecondsToAMPM(parseInt(tmpRule.StartTime) + parseInt(tmpRule.RuleDuration)));
                                return true;
                            }
                        }
                    }
                }
            }
        }

        return false;
    }

    function errorCB() {
        console.log("Error inserting rule");
    }

    function successCB() {
        console.log('Successfully updated DB');
    }

    function successfullySaved() {
        console.log('Saved all the rules to Session');

        if (saved) {
            //navigator.notification.activityStart("Please Wait", "Updating");
            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
            nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", wemo.items['RULE_STATUS_SENDING_DB']]);
            console.log('Started pushing to plugins');
            //wemoUtil.loadUrl(filePath.ENABLED_RULES);
            setTimeout(function () {
                updateDevice();
            }, 1000);
        }
    }

    function checkDbValues(rule) {
        trace("Inside checkDbValues...");
        var strDays = rule.SelectedDayOrRange;
        var arrDays = strDays.split("-");

        if (Object.keys(rule.Devices).length > 0) {
            for (var device in rule.Devices) {
                console.log("first LOOP");
                for (var daysCount1 = 0; daysCount1 < arrDays.length; daysCount1++) {
                    console.log("Rules device : " + device + " Days : " + (arrDays[daysCount1]) + " start time : " + rule.When.StartTime + " End time : " + rule.When.RuleDuration + "  Start Action :: " + rule.Devices[device].StartAction + "  End Action :: " + rule.Devices[device].EndAction + "  Sensor Duration :: " + rule.Devices[device].SensorDuration + "  Selected sensor Value   :: " + rule.SelectedSensorsValue);

                    var rulesArray = [];
                    rulesArray.push(device);
                    rulesArray.push(deCodeDays(arrDays[daysCount1]));
                    rulesArray.push(rule.When.StartTime);
                    rulesArray.push(rule.When.RuleDuration);
                    rulesArray.push(rule.Devices[device].StartAction);
                    rulesArray.push(rule.Devices[device].EndAction);
                    rulesArray.push(rule.Devices[device].SensorDuration);
                    rulesArray.push(rule.SelectedSensorsValue);


                    var goAhead = checkValues(rulesArray);
                    if (goAhead == false) {
                        return false;
                    }

                }
            }
        }

        return true;
    }

    function checkValues(rulesArray) {
        for (var i = 0; i < rulesArray.length; i++) {
            var val = rulesArray[i];
            console.log("Rules value : " + val);

            if (val == undefined) {
                return false;
            }

        }
        return true;
    }

    function updateDevice() {
        console.log("success creating the table structures");

        var params = [];

        if (isRemoteEnabled) {
            if (isSensorNotificaton) {
                params = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SENSOR_DATA);
                params = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.PIR_DATA).concat(params);
            }
            else if(isKeychainPresenceNotification){
            	params = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.FOB_DATA)
            }
            else if(isDWNotficationRule){
            	params = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DWSENSOR_DATA)
            }
            else {
                params = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA);
            }
            pushScheduleInisghtNotifyCallback(params);
        }
        else {
        	if (isSensorNotificaton) {
        		deviceTabPlugin.execute(
        				function(params) {
        						pushScheduleInisghtNotifyCallback(params);
        				},
        				function(err) {
        					dfd.reject(err);
        				},
        				actions.SELECT_SENSORS, []); 
        	}
            //if (isSensorNotificaton) {
            //    deviceTabPlugin.execute(
            //        function(params) {
            //            wemoUtil.getDevicesWithCallback(actions.SELECT_PIR_SENSORS, function(pirSensors)
            //            {
            //                wemoUtil.infoLog(TAG,"SaveInsightRule: pirSensors received for device plugin: " + pirSensors);
            //                params = params.concat(pirSensors);
            //                wemoUtil.infoLog(TAG, "SaveInsightRule: Afer concat: total params received for device plugin: " + params);
            //                pushScheduleInisghtNotifyCallback(params);
            //            });
            //        },
            //        function(err) {
            //            dfd.reject(err);
            //        },
            //        actions.SELECT_SENSORS, []);
            //}
            //if (isKeychainPresenceNotification) {
            //	deviceTabPlugin.execute(
            //        function(params) {
            //        	pushScheduleInisghtNotifyCallback(params);
            //        },
            //        function(err) {
            //        	dfd.reject(err);
            //        },
            //        actions.SELECT_FOB_SENSOR_DEVICES, []);
            //}
            //else if(isDWNotficationRule){
            //	deviceTabPlugin.execute(
            //            function(params) {
            //            	pushScheduleInisghtNotifyCallback(params);
            //            },
            //            function(err) {
            //            	dfd.reject(err);
            //            },
            //            actions.SELECT_DOOR_WINDOW_SENSORS, []);
            //}
            else {
            	deviceTabPlugin.execute(
                    function(params) {
                    	pushScheduleInisghtNotifyCallback(params);
                    },
                    function(err) {
                    	dfd.reject(err);
                    },
                    actions.SELECT_INSIGHTS, []);
            }
        }

        function pushScheduleInisghtNotifyCallback(params){
        	var ruleDevices ='';
        if (isMakerSensorNotificaton) {
            for (var dev1 = 0; dev1 < Object.keys(rule.Devices).length; dev1++) {
            	ruleDevices = ruleDevices + wemoUtil.getMakerSensorUDN(Object.keys(rule.Devices)[dev1]) + ',';
                
            }
            console.log("SaveInsightRule: ruleDevices: " + ruleDevices);
            wemoUtil.pushScheduleInisghtNotify(ruleDevices, 0, Object.keys(rule.Devices).length, rule);
        }
        else if (isSensorNotificaton || isKeychainPresenceNotification || isDWNotficationRule) {
            if (params != null && params.length > 0) {
                $.each(params, function (inx) {
                    ruleDevices = ruleDevices + params[inx].udn + ',';
                });
                console.log("SaveInsightRule: ruleDevices: " + ruleDevices);
                wemoUtil.pushScheduleInisghtNotify(ruleDevices, 0, params.length, rule);
            }
        }
        else {
            if (params != null && params.length > 0) {
                $.each(params, function (inx) {
                	ruleDevices = ruleDevices + params[inx].udn + ',';
                    
                });
                console.log("SaveInsightRule: ruleDevices: " + ruleDevices);
                wemoUtil.pushScheduleInisghtNotify(ruleDevices, 0, params.length, rule);
            }
        }
        
    }
    }


    function getRules(tx) {
        console.log('Completed getting Rules');
        tx.executeSql('SELECT DISTINCT a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.RuleDuration, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.Level, b.ZBCapabilityStart, b.ZBCapabilityEnd FROM RULES a INNER JOIN RULEDEVICES b ON a.RuleID=b.RuleID ORDER BY a.Name COLLATE NOCASE', [],
            function (tx, results) {
                var len = results.rows.length;
                var ruleRows = [];
                if (len > 0) {
                    for (var i = 0; i < len; i++) {
                        ruleRows[i] = results.rows.item(i);
                        console.log("Print DB values = " + ruleRows[i].RuleID + " :: " +
                        ruleRows[i].Name + " :: " +
                        ruleRows[i].StartTime + " :: " +
                        ruleRows[i].RuleDuration + " :: " +
                        ruleRows[i].Value + " :: " +
                        ruleRows[i].DayID + " :: " +
                        ruleRows[i].ZBCapabilityStart + " :: " +
                        ruleRows[i].ZBCapabilityEnd);
                    }
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULES_DATA, ruleRows);

                }
            }, errorCB);
    }

}
