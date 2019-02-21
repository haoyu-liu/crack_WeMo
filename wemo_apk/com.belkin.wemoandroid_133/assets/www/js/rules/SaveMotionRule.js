/**
 SaveMotionRule.js

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

var TAG ='SaveMotionRule.js: ';
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
}

function saveNewRule_RULES_RULEDEVICES(arg, ruleObj) {
    var saved = false;

    var isEdit = window.sessionStorage.getItem(sessionStore.isEdit);

    if (Object.keys(ruleObj.Devices).length <= 0) {
        alert(wemo.items['PleaseSelectDevices']);
        return;
    }
	
	if ( ruleObj.When.OnModeOffset == undefined ) ruleObj.When.OnModeOffset = 0;
	if ( ruleObj.When.OffModeOffset == undefined ) ruleObj.When.OffModeOffset = 0;

    var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
    db.transaction(saveMotionRule, errorCB, successCB);
    db.transaction(getRules, errorCB, successfullySaved);

    function saveMotionRule(tx) {
    	var ruleName = ruleObj.RuleName.replace(/\"/g,'&quot;');
    	console.log("SaveMotionRule_ruleName : " + ruleName);
    	tx.executeSql('SELECT RuleID  FROM RULES ORDER BY CAST(RuleID AS INT) DESC', [], querySuccess, errorCB);

        function querySuccess(tx, res) {
            if (parseInt(res.rows.length) > 0) {
                var len = parseInt(res.rows.item(0).RuleID) + 1;
            }
            else {
                len = 1;
            }

            if (ruleObj.id > 0) {
                executeQuery = 'SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.DeviceID, b.StartTime, b.RuleDuration, b.StartAction, b.EndAction, b.DayID, b.Value, b.SensorDuration from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID where b.RuleID <> ' + ruleObj.id + ' order by a.Name COLLATE NOCASE';
            } else {
                executeQuery = 'SELECT distinct a.RuleID, a.Name, a.Type, b.DeviceID, a.State, b.StartTime, b.RuleDuration, b.StartAction, b.EndAction, b.DayID, b.Value, b.SensorDuration from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID order by a.Name COLLATE NOCASE';
            }

            tx.executeSql(executeQuery, [],
                function (tx, results) {
                    var rulen = results.rows.length;

                    trace("rulen= " + rulen + " strDays=" + strDays);

                    if (verifyRuleDuplicatesAndConflicts(ruleObj, results.rows)) {
                        return false;
                    }

                    if (ruleObj.id > 0) {
                        //Delete rules and related stuff with the same RuleID
                        tx.executeSql("DELETE FROM RULEDEVICES WHERE RuleID=" + ruleObj.id, [], function () {
                            console.log("RuleDevice with ID : " + ruleObj.id + " is deleted");
                        }, errorCB);

                        tx.executeSql("DELETE FROM DEVICECOMBINATION WHERE RuleID=" + ruleObj.id, [], function () {
                            console.log("RuleCombination with ID : " + ruleObj.id + " is deleted");
                        }, errorCB);

                        //Update rule
                        tx.executeSql('UPDATE RULES SET Name = "' + ruleName + '" WHERE RuleID="' + ruleObj.id + '"');
                    }
                    else
                    {
                        ruleObj.id = len;
                        tx.executeSql('INSERT INTO RULES (RuleID, Name, Type, RuleOrder, StartDate, EndDate,State, Sync) VALUES ("' + ruleObj.id + '","' + ruleName + '", "' + ruleObj.RuleType + '", "2", "12201983", "12201983", "' + ruleObj.State + '", "NOSYNC")');
                    }

                    var strDays = ruleObj.SelectedDayOrRange;
                    var arrDays = strDays.split("-");

                    var StartTime = "";
                    var RuleDuration = "";
                    if (Object.keys(ruleObj.Devices).length > 0) {
                    	for (device in ruleObj.Devices) {
                    		console.log("first LOOP");
                    		var isLedDevice = false;
                    		var bridgeUDN;
                    		if(device.indexOf("uuid") == -1){
                    			isLedDevice = true
                    			bridgeUDN =window.sessionStorage.getItem(sessionStore.LED_BRIDGE_UDN_ID)+":"+device;
                    		}
                    		for (var daysCount1 = 0; daysCount1 < arrDays.length; daysCount1++) {
                    			if ( ruleObj.When.StartSRSS != undefined ) {
                    				if (ruleObj.When.StartSRSS === "Sunrise") StartTime = ruleObj[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSR"];
                    				else StartTime = ruleObj[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSS"];
                                    RuleDuration = ruleObj[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                    			}  else
                                if ( ruleObj.When.EndSRSS != undefined ) {
                                    StartTime = ruleObj.When.StartTime;
                                    RuleDuration = ruleObj[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                } else {
                                    StartTime = ruleObj.When.StartTime;
                                    RuleDuration = ruleObj.When.RuleDuration;
                                }

                                if ( StartTime == undefined ) StartTime = ruleObj.When.StartTime;
                                if ( RuleDuration == undefined ) RuleDuration = ruleObj.When.RuleDuration;
                                
                                var productName = "";

                    			console.log("before Push First :: " + '(' + ruleObj.id + ',"' + device + '", "0", ' + deCodeDays(arrDays[daysCount1]) + ', "' + StartTime + '","' + RuleDuration + '", ' + ruleObj.Devices[device].StartAction + ', ' + ruleObj.Devices[device].EndAction + ', "' + ruleObj.Devices[device].SensorDuration + '","-1","' + ruleObj.SelectedSensors + '","-1")');
                    			if(isLedDevice)
                    				tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES (' + ruleObj.id + ',"' + bridgeUDN + '", "0", "' + deCodeDays(arrDays[daysCount1]) + '", "' + StartTime + '","' + RuleDuration + '", ' + ruleObj.Devices[device].StartAction + ', ' + ruleObj.Devices[device].EndAction + ', "' + ruleObj.Devices[device].SensorDuration + '","-1","-1","-1","","",'+ruleObj.When.OnModeOffset+','+ruleObj.When.OffModeOffset+',-1,'+ruleObj.When.EndTime+')');
                    			else
                    				tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES (' + ruleObj.id + ',"' + device + '", "0", "' + deCodeDays(arrDays[daysCount1]) + '", "' + StartTime + '","' + RuleDuration + '", ' + ruleObj.Devices[device].StartAction + ', ' + ruleObj.Devices[device].EndAction + ', "' + ruleObj.Devices[device].SensorDuration + '","-1","-1","-1","","",'+ruleObj.When.OnModeOffset+','+ruleObj.When.OffModeOffset+',-1,'+ruleObj.When.EndTime+')');
                    		}
                    	}
                    }

                    if (Object.keys(ruleObj.Sensors).length > 0) {
//                    	var arrSensors = ruleObj.SelectedSensors.split(",");
                    	for (var sensor in ruleObj.Sensors) {
                    		
                    		var productName = "";
                            wemoUtil.infoLog(TAG,"before Push Second :: " + '(' + ruleObj.id + ',"' + sensor + '", "0", ' + '-1' + ', "' + ruleObj.When.StartTime + '","' + ruleObj.When.RuleDuration + '", ' + '-1' + ', ' + '-1' + ', "' + "-1" + '","0","' + ruleObj.SelectedSensors + '","2")');
                    		tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES (' + ruleObj.id + ',"' + sensor + '", "0", "-1", "' + ruleObj.When.StartTime + '","' + ruleObj.When.RuleDuration + '", "1", "-1", "-1","0","0","1","","",'+ruleObj.When.OnModeOffset+','+ruleObj.When.OffModeOffset+',-1,'+ruleObj.When.EndTime+')');
                    		for (var device = 0; device < Object.keys(ruleObj.Devices).length; device++) {
                    			var udn = Object.keys(ruleObj.Devices)[device];
                    			var isLedDevice = false;
                    			var bridgeUDN;
                    			if(udn.indexOf("uuid") == -1){
                    				isLedDevice = true
                    				bridgeUDN =window.sessionStorage.getItem(sessionStore.LED_BRIDGE_UDN_ID)+":"+udn;
                    			}
                    			if(isLedDevice)
                    				tx.executeSql('INSERT INTO DEVICECOMBINATION (RuleID, SensorID, SensorGroupID, DeviceID, DeviceGroupID) VALUES (' + ruleObj.id + ',"' + sensor + '", "0", "' + bridgeUDN + '", "0")');
                    			else
                    				tx.executeSql('INSERT INTO DEVICECOMBINATION (RuleID, SensorID, SensorGroupID, DeviceID, DeviceGroupID) VALUES (' + ruleObj.id + ',"' + sensor + '", "0", "' + udn + '", "0")');
                    		}

                    	}
                    }

                    saved = true;

                }, errorCB);
        }
    }

    function errorCB(err) {
        console.log("Error inserting rule: " + JSON.stringify(err));
    }

    function successCB() {
        console.log('Successfully updated DB');
    }

    function successfullySaved() {
        console.log('Saved all the rules to Session');

        if (saved) {
            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
            nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", wemo.items['RULE_STATUS_SENDING_DB']]);
            console.log('Started pushing to plugins');
            setTimeout(function () {
                updateDevice(ruleObj);
            }, 1000);
        }
    }

    function updateDevice(rule) {
        console.log("success creating the table structures");

        var params = [];

        if(isRemoteEnabled)
        {
            params = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SENSOR_DATA);
            params = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.PIR_DATA).concat(params);
            pushScheduleSensor(params, rule);
        }
        else
        {
        	deviceTabPlugin.execute(
        			function(params) {
        					pushScheduleSensor(params, rule);
        			},
                    function(err) {
                    	$("#noSensorsDetectedHeader").html(wemo.items['noSensorsDetectedHeader']);
        				$("#noSensorsDetectedText").html(wemo.items['noSensorsDetectedText']);
        				$("#noSensorsDetected").popup("open");
                    },
                    actions.SELECT_SENSORS, []);

            //deviceTabPlugin.execute(
            //    function(params) {
            //        wemoUtil.getDevicesWithCallback(actions.SELECT_PIR_SENSORS, function(pirSensors)
            //        {
            //            wemoUtil.infoLog(TAG,"SaveMotionRule: pirSensors received for device plugin: " + pirSensors);
            //            params = params.concat(pirSensors);
            //            wemoUtil.infoLog(TAG, "SaveMotionRule: Afer concat: total params received for device plugin: " + params);
            //            pushScheduleSensor(params, rule);
            //        });
            //    },
            //    function(err) {
            //        $("#noSensorsDetectedHeader").html(wemo.items['noSensorsDetectedHeader']);
            //        $("#noSensorsDetectedText").html(wemo.items['noSensorsDetectedText']);
            //        $("#noSensorsDetected").popup("open");
            //    },
            //    actions.SELECT_SENSORS, []);
        }  
    }
     
    function pushScheduleSensor(params, rule) {
    	if ( params != null && params.length > 0)
        {
//            var arrSensCurRule = rule.SelectedSensors.split(",");
    		var sensorArrayObj = Object.keys(rule.Sensors);
    		var devicesLength = sensorArrayObj.length;
            var ruleDevices = '';
            for (var inx = 0; inx < devicesLength ; inx++) {
                var udn = sensorArrayObj[inx];
                
                for (var j =0; j < params.length ; j++){
                	if(udn && udn!=null && params[j] && params[j]!=null && params[j].udn && params[j].udn!=null){
                		console.log("SaveMotionRule: " + udn + ", params_udn: " + params[j].udn);
                        if(udn == params[j].udn){
                         console.log("SaveMotionRule: " + udn + ", params_udn: " + params[j].udn);
                         ruleDevices = ruleDevices + udn + ',';
                        }
                	}
                 
                   }
               }
               
              ruleDevices = ruleDevices.substring(0, ruleDevices.length - 1);
              wemoUtil.pushScheduleSensor( ruleDevices, inx, devicesLength);

        }
    	
    }
    function getRules(tx) {
        console.log('Completed getting Rules');
        tx.executeSql('SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.RuleDuration, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.Level from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID order by a.Name COLLATE NOCASE', [],
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
                            ruleRows[i].DayID);
                    }
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULES_DATA, ruleRows);

                }
            }, errorCB);
    }

    //Function to check if device is used by rule
    function deviceUsed(rule, devid) {
        if (Object.keys(rule.Devices).length > 0) {
            for (device in rule.Devices) {
                if (device == devid) {
                    return true;
                }
            }
        }

        return false;
    }

    //Function to compare two rules
    function rulesEquals(rule1, rule2) {
        console.log(JSON.stringify(rule1));
        console.log(JSON.stringify(rule2));

        var targetDeviceID = rule2.DeviceID; 

        //for link/bridge devices
        if(targetDeviceID.toLowerCase().indexOf(sessionStore.BRIDGE) != -1){
            var arrDeviceID = targetDeviceID.split(":");
            // targetDeviceID will be at the end of rule2.DeviceID
            targetDeviceID = arrDeviceID[arrDeviceID.length-1];
        }else{
            if(targetDeviceID.indexOf(sessionStore.UUID) == -1){
                targetDeviceID = sessionStore.UUID+':'+targetDeviceID;
            }
        }
        
        if (!deviceUsed(rule1, targetDeviceID)) {
            return false;
        }

        if ((rule1.When.StartTime == rule2.StartTime) &&
            (rule1.When.RuleDuration == rule2.RuleDuration) &&
            (rule1.State == rule2.State) &&
            (rule1.Devices[targetDeviceID].StartAction == rule2.StartAction)
            ) {
            if (rule1.SelectedDayOrRange == "Daily") {
                return true;
            }
            else {
                if (checkDayOverlap(rule1, rule2)) {
                    return true;
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

    function ruleConflicts(rule2, rule1) {
        var targetDeviceID = rule1.DeviceID;

        //for link/bridge devices 
        if(targetDeviceID.toLowerCase().indexOf(sessionStore.BRIDGE) != -1){
            wemoUtil.infoLog(wemoUtil.TAG, 'target device is link device');
            var arrDeviceID = targetDeviceID.split(":");
            // targetDeviceID will be at the end of rule2.DeviceID
            targetDeviceID = arrDeviceID[arrDeviceID.length-1];
        }else{
            if(targetDeviceID.indexOf(sessionStore.UUID) == -1){
                targetDeviceID = sessionStore.UUID+':'+targetDeviceID;
            }
        }
        
        if (!deviceUsed(rule2, targetDeviceID)) {
            return false;
        }

        if (checkDayOverlap(rule2, rule1)) {
            //We don't check next day overlap to be consistent with iOS code
            //See RuleUtility.m:1771

            var rule1End = parseInt(rule1.StartTime) + parseInt(rule1.RuleDuration);

            //Case for Simple Timer Rule
            if (rule1.StartTime == rule2.When.StartTime && rule1.StartAction != rule2.Devices[targetDeviceID].StartAction) {
                return true;
            }

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

        }

        return false;
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

    
    $("#learn_more_btn").on("click", function () {
        //alert("Learn More");
        if (!isRemoteEnabled) {
            deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
        }

        window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Help_Rules_Alert_Url']);
        window.open(wemo.items['ruleHelpCenter'], "_system");
        $("#rule_conflict").popup("close");


    });

    $("#ok_btn").on("click", function () {
        //alert("Rule Duplicate");
        $("#rule_conflict").popup("close");
        $("RuleConflictSimpleAndTimer").html("");
        //return;
        //return false;
    }); 
    
    
    function showConflictDuplicateMessage(ruleName, msgType, device, ruleStart, ruleEnd, ruleType, ruleStartAct) {
        var RuleconflictHeader = wemo.items['RuleConflict'];
        

        if (msgType == "duplicate_name" || msgType == "duplicate_rule") {
            var ruleConflictLocalizedmsg = wemo.items['RuleDuplicateText'];
            var temparr = ruleConflictLocalizedmsg.split("%@");
            var msgText = temparr[0] + " " + ruleName + temparr[1];

            setTimeout(
                function () {
                    $("#ruleInfoHeader").text(RuleconflictHeader);
                    $("#RuleDuplicateText").text(msgText);
                    $("#rule_duplicate").popup("open");
                },
                timeout.POPUP_DISPLAY_DELAY
            );
        }

        if (msgType == "conflict_rule") {
            var ruleConflictLocalizedmsg = wemo.items['RuleConflictSimpleAndTimer'];
            var temparr = ruleConflictLocalizedmsg.split("%@");

            switch ( ruleType ) {
                case sessionStore.SIMPLE_SWITCH:
                    var msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " + ruleStartAct + " " + device + " " + temparr[3] + " " + ruleStart  + temparr[4];
                    break;
                case sessionStore.TIME_INTERVAL:
                    var msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " + wemo.items["RuleDetailsSwitchTurnsOn"] + " " + device + " " + temparr[3] + " " + ruleStart  + wemo.items["And"] + wemo.items["RuleDetailsSwitchTurnsOff"] + temparr[3] + " " + ruleEnd + temparr[4];
                    break;
                case sessionStore.AWAY_MODE:
                    var msgText = wemo.items["AwayModeConflict"];
                    break;
                case sessionStore.MOTION_CONTROLLED:
                    ruleConflictLocalizedmsg = wemo.items['RuleConflictSensorRuleWithMotionON'];
                    temparr = ruleConflictLocalizedmsg.split("%@");
                    var msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " +ruleStartAct  + " " +  device + " " + temparr[2] + temparr[3] + ruleStart  +  temparr[4] + ruleEnd + temparr[5];
                    break;
            }

            setTimeout(
                function () {
                    $("#ruleInfoHeader").text(RuleconflictHeader);
                    $("#RuleConflictSimpleAndTimer").text(msgText);
                    $("#rule_conflict").popup("open");
                },
                timeout.POPUP_DISPLAY_DELAY
            );
        }

    }

    function getDays(arrDays) {
        var Days = [];
        trace("arrDays.length " + arrDays.length);
        if (arrDays.length == 1) {
            var deCodeDaysValue = deCodeDays(arrDays[0]);
            switch ( deCodeDaysValue ) {
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

    function sensorUsed(arrSensRow, arrSensCurRule) {
        for (var i = 0; i < arrSensCurRule.length; i++) {
            if (arrSensRow.indexOf(arrSensCurRule[i]) != -1) return true;
        }
        console.log("Sensor devices sre not used in another existing rule");
        return false;
    }

    function verifyRuleDuplicatesAndConflicts(rule, ruleRow) {
        //Check rule for duplication
        console.log("Check for rule for dupilacation...");
        console.log("New rule name: " + rule.RuleName);
        console.log(JSON.stringify(rule));
        console.log(JSON.stringify(ruleRow));

        var arrSensRow = [];
//        var arrSensCurRule = ruleObj.SelectedSensors.split(",");
        var arrSensCurRule = [];
		if (Object.keys(rule.Sensors).length > 0) {
			for (sensor in rule.Sensors) {
				arrSensCurRule.push(sensor);
			}
		}
        for (var i = 0; i < ruleRow.length; i++) {
            var tmpRule = ruleRow.item(i);
            if (tmpRule != undefined) {
                if (tmpRule.Type == sessionStore.MOTION_CONTROLLED && (tmpRule.DayID).toString() == "-1") {
                    if (!arrSensRow[tmpRule.RuleID]) arrSensRow[tmpRule.RuleID] = [];
                    arrSensRow[tmpRule.RuleID].push(tmpRule.DeviceID);
                }
            }
        }

        for (var i = 0; i < ruleRow.length; i++) {
            var tmpRule = ruleRow.item(i);
            
            var targetDeviceID = tmpRule.DeviceID; 

            //for link/bridge devices
            if(targetDeviceID.toLowerCase().indexOf(sessionStore.BRIDGE) != -1){
                var arrDeviceID = targetDeviceID.split(":");
                // targetDeviceID will be at the end of rule2.DeviceID
                targetDeviceID = arrDeviceID[arrDeviceID.length-1];
            }else{
                if(targetDeviceID.indexOf(sessionStore.UUID) == -1){
                    targetDeviceID = sessionStore.UUID+':'+targetDeviceID;
                }
            }
            
            console.log(JSON.stringify(tmpRule));
            if (tmpRule != undefined) {
                if (wemoUtil.getRuleClass(rule.RuleType) == wemoUtil.getRuleClass(tmpRule.Type)) {
                   // if (tmpRule.Type == "Insight Rule") {
                        if (sensorUsed(arrSensRow[tmpRule.RuleID], arrSensCurRule )) {
                            console.log("Sensor devices are used in another existing rule");
                            var tmpRuleName = tmpRule.RuleName;
                            if (tmpRule.State == '1' && rulesEquals(rule, tmpRule)) {
                                nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                console.log(JSON.stringify(tmpRule));
                                console.log("Found new rule duplication with: " + tmpRuleName);
                                showConflictDuplicateMessage(tmpRule.Name, "duplicate_rule", targetDeviceID, null, null, null, null);
                                return true;
                            }

                            if (tmpRule.State == '1' && ruleConflicts(rule, tmpRule)) {
                                if (isWholeDay(rule)) {
                                    nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                    console.log(JSON.stringify(tmpRule));
                                    console.log("Found new rule whole-day conflict with: " + tmpRuleName);
                                    showConflictDuplicateMessage(tmpRule.Name, "conflict_day__rule", targetDeviceID, null, null, null, null);
                                    return true;
                                }
                                else {
                                    console.log("Found new rule tmpRule with: " +JSON.stringify(tmpRule));
                                    console.log("Found new rule conflict with: " + tmpRuleName);
                                   
                                    var ruleStartAct = tmpRule.StartAction == 1 ? wemo.items["RuleDetailsSwitchTurnsOn"] : wemo.items["RuleDetailsSwitchTurnsOff"];
                                    switch (tmpRule.Type) {
                                        case sessionStore.SIMPLE_SWITCH:
                                            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                            showConflictDuplicateMessage(tmpRule.Name, "conflict_rule", tmpRule.DeviceID, wemoUtil.convertMillisecondsToAMPM(tmpRule.StartTime), null, tmpRule.Type, ruleStartAct);
                                            break;
                                        case sessionStore.TIME_INTERVAL:
                                            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                            showConflictDuplicateMessage(tmpRule.Name, "conflict_rule", tmpRule.DeviceID, wemoUtil.convertMillisecondsToAMPM(tmpRule.StartTime), wemoUtil.convertMillisecondsToAMPM(parseInt(tmpRule.StartTime) + parseInt(tmpRule.RuleDuration)), tmpRule.Type, null);
                                            break;
                                        case sessionStore.MOTION_CONTROLLED:
                                            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                            showConflictDuplicateMessage(tmpRule.Name, "conflict_rule", rule.Devices[targetDeviceID].FName, wemoUtil.convertMillisecondsToAMPM(tmpRule.StartTime), wemoUtil.convertMillisecondsToAMPM(parseInt(tmpRule.StartTime) + parseInt(tmpRule.RuleDuration)), tmpRule.Type, ruleStartAct);
                                            break;
                                    }
                                    return true;
                                }
                            }
                        }
                    //}
                }
            }
        }

        return false;
    }
}
