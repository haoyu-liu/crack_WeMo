/**
 SaveMakerMotionRule.js

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
    db.transaction(saveMakerMotionRule, errorCB, successCB);
    db.transaction(getRules, errorCB, successfullySaved);

    function saveMakerMotionRule(tx) {
    	var ruleName = ruleObj.RuleName.replace(/\"/g,'&quot;');
    	console.log("SaveMakerMotionRule_ruleName" + ruleName);
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

    			if ((ruleObj.When.isFirmWareSupported != undefined && ruleObj.When.isFirmWareSupported === "false") || 
    					(ruleObj.When.isMakerFirmWareSupported != undefined && ruleObj.When.isMakerFirmWareSupported === "false")) {
    				ruleObj.State = 0;
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
    			var selectedSensors = "";

    			var StartTime = "";

    			if(Object.keys(ruleObj.Sensors).length > 0){
    				for (sensor in ruleObj.Sensors) {
    					if(selectedSensors != ""){
    						selectedSensors+= ",";
    					}
    					var newSensorUdn= wemoUtil.getMakerSensorUDN(sensor);
    					selectedSensors+= newSensorUdn;
    				}
    			}

//  			var sensorState;
//  			for (sensor in ruleObj.Sensors) {

//  			sensorState =ruleObj.Sensors[sensor]['state'];

//  			}

    			if (Object.keys(ruleObj.Devices).length > 0) {

    				console.log("Selected Sensors String: "+ selectedSensors);
    				ruleObj.SelectedSensors = selectedSensors;

    				for (device in ruleObj.Devices) {
    					console.log("first LOOP");
    					var isLedDevice = false;
                		var bridgeUDN;
    					var isMakerDevice = false;
    					var newUdn;
    					if(device.indexOf("uuid") == -1){
                			isLedDevice = true
                			bridgeUDN =window.sessionStorage.getItem(sessionStore.LED_BRIDGE_UDN_ID)+":"+device;
                		}
    					else if(device.indexOf("uuid:Maker")!=-1){
    						newUdn = wemoUtil.getMakerSwithUDN(device);
    						isMakerDevice = true;
    					}
    					for (var daysCount1 = 0; daysCount1 < arrDays.length; daysCount1++) {
    						if ( ruleObj.When.StartSRSS != undefined ) {
    							if (ruleObj.When.StartSRSS === "Sunrise") StartTime = ruleObj[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSR"];
    							else StartTime = ruleObj[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSS"];									
    						} else {
    							StartTime = ruleObj.When.StartTime;
    						}
    						if ( StartTime == undefined ) StartTime = ruleObj.When.StartTime; 

    						if(isMakerDevice){
    							console.log("before Push First :: " + '(' + ruleObj.id + ',"' + newUdn + '", "0", ' + deCodeDays(arrDays[daysCount1]) + ', "' + ruleObj.When.StartTime + '","' + ruleObj.When.RuleDuration + '", ' + ruleObj.Devices[device].StartAction + ', '+ " endaction: " + ruleObj.Devices[device].EndAction + ', "' + ruleObj.Devices[device].SensorDuration + '","-1","' + selectedSensors + '","-1")');
    							tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES (' + ruleObj.id + ',"' + newUdn + '", "0", "' + deCodeDays(arrDays[daysCount1]) + '", "' + StartTime + '","' + ruleObj.When.RuleDuration + '", ' + ruleObj.Devices[device].StartAction + ', ' + ruleObj.Devices[device].EndAction + ', "' + ruleObj.Devices[device].SensorDuration + '","-1","-1","-1","","",'+ruleObj.When.OnModeOffset+','+ruleObj.When.OffModeOffset+',-1,'+ruleObj.When.EndTime+')');
    						}
    						else{
    							console.log("before Push First :: " + '(' + ruleObj.id + ',"' + device + '", "0", ' + deCodeDays(arrDays[daysCount1]) + ', "' + StartTime + '","' + ruleObj.When.RuleDuration + '", ' + ruleObj.Devices[device].StartAction + ', ' + ruleObj.Devices[device].EndAction + ', "' + ruleObj.Devices[device].SensorDuration + '","-1","' + selectedSensors + '","-1")');
    							if(isLedDevice)
    								tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES (' + ruleObj.id + ',"' + bridgeUDN + '", "0", "' + deCodeDays(arrDays[daysCount1]) + '", "' + StartTime + '","' + ruleObj.When.RuleDuration + '", ' + ruleObj.Devices[device].StartAction + ', ' + ruleObj.Devices[device].EndAction + ' , "' + ruleObj.Devices[device].SensorDuration + '","-1","-1","-1","","",'+ruleObj.When.OnModeOffset+','+ruleObj.When.OffModeOffset+',-1,'+ruleObj.When.EndTime+')');
    							else
    								tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart , ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES (' + ruleObj.id + ',"' + device + '", "0", "' + deCodeDays(arrDays[daysCount1]) + '", "' + StartTime + '","' + ruleObj.When.RuleDuration + '", ' + ruleObj.Devices[device].StartAction + ', ' + ruleObj.Devices[device].EndAction + ', "' + ruleObj.Devices[device].SensorDuration + '","-1","-1","-1","","",'+ruleObj.When.OnModeOffset+','+ruleObj.When.OffModeOffset+',-1,'+ruleObj.When.EndTime+')');
    						}
    					}
    				}
    			}

    			if (Object.keys(ruleObj.Sensors).length > 0) {
    				for (sensor in ruleObj.Sensors) {
    					console.log("Sensor Id"+ sensor+"Sensor state: "+ ruleObj.Sensors[sensor]['state']+ "  <<<>>>> RuleObj --->>  "+ JSON.stringify(ruleObj));
    					var newSensorUdn= wemoUtil.getMakerSensorUDN(sensor);

    					console.log("before Push Second :: " + '(' + ruleObj.id + ',"' + sensor + '", "0", ' + '-1' + ', "' + ruleObj.When.StartTime + '","' + ruleObj.When.RuleDuration + '", ' + '-1' + ', ' + '-1' + ', "' + "-1" + '","0","' + ruleObj.Sensors + '","2")');
    					tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES (' + ruleObj.id + ',"' + newSensorUdn + '", "0", "-1", "' + ruleObj.When.StartTime + '","' + ruleObj.When.RuleDuration + '", "' + ruleObj.Sensors[sensor]['state'] + '", "-1", "-1","0","' + ruleObj.Sensors[sensor]['state'] + '","2","","",'+ruleObj.When.OnModeOffset+','+ruleObj.When.OffModeOffset+',-1,'+ruleObj.When.EndTime+')');
    					for (var device = 0; device < Object.keys(ruleObj.Devices).length; device++) {
    						var udn = Object.keys(ruleObj.Devices)[device];
    						var makerUdn;
                			
                			if(udn.indexOf("uuid") == -1){
                    			var bridgeUDN =window.sessionStorage.getItem(sessionStore.LED_BRIDGE_UDN_ID)+":"+udn;
                    			tx.executeSql('INSERT INTO DEVICECOMBINATION (RuleID, SensorID, SensorGroupID, DeviceID, DeviceGroupID) VALUES (' + ruleObj.id + ',"' + newSensorUdn + '", "0", "' + bridgeUDN + '", "0")');
                    		}
        					else if(udn.indexOf("uuid:Maker")!=-1){
    							makerUdn = wemoUtil.getMakerSwithUDN(udn);
    							tx.executeSql('INSERT INTO DEVICECOMBINATION (RuleID, SensorID, SensorGroupID, DeviceID, DeviceGroupID) VALUES (' + ruleObj.id + ',"' + newSensorUdn + '", "0", "' + makerUdn + '", "0")');
    						}
    						else{
    							tx.executeSql('INSERT INTO DEVICECOMBINATION (RuleID, SensorID, SensorGroupID, DeviceID, DeviceGroupID) VALUES (' + ruleObj.id + ',"' + newSensorUdn + '", "0", "' + udn + '", "0")');
    						}
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
            params = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA);
            pushScheduleMaker(params, rule);
        }
        else
        {
         deviceTabPlugin.execute(
                    function(params) {
                     pushScheduleMaker(params, rule);
                    },
                    function(err) {
                    },
                    actions.SELECT_MAKER, []);
        }
    }
    
    function pushScheduleMaker(params, rule){

     var devicesLength = Object.keys(rule.Sensors).length;
     var ruleDevices ='';
     for (var inx = 0; inx < devicesLength ; inx++) {
      var udn = Object.keys(rule.Sensors)[inx];
      for (var j =0; j < params.length ; j++){
    	  if(udn && udn!=null && params[j] && params[j]!=null && params[j].udn && params[j].udn!=null){
    		  console.log("SaveMakerMotionRule: " + udn + ", params_udn: " + params[j].udn);
    	       if(udn == wemoUtil.getMakerSensorUDN(params[j].udn)){
    	        ruleDevices = ruleDevices + wemoUtil.getMakerSensorUDN(udn) + ',';
    	       }else if (udn == params[j].udn){
    	    	   ruleDevices = ruleDevices + udn + ',';
    	       }
    	  }
       
      }
     }
     
     ruleDevices = ruleDevices.substring(0, ruleDevices.length - 1);
        wemoUtil.pushScheduleSensor( ruleDevices, 0, devicesLength);
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
    			console.log("deviceUsed() :: device--> "+ device + "  && devid--> "+ devid);
    			if(wemoUtil.isMakerDevice(device)){
    				device = wemoUtil.getOriginalMakerUDN(device);
    				if(wemoUtil.isMakerDevice(devid))
    					devid = wemoUtil.getOriginalMakerUDN(devid);
    			}
    			if (device == devid) {
    				return true;
    			}
    		}
    	}
    	return false;
    }
    //Function to compare two rules
    function rulesEquals(rule1, rule2) {
        if (!deviceUsed(rule1, rule2.DeviceID)) {
            return false;
        }
        var StartAction ='';
        
      console.log("rulesEquals():: rule1--> "+ JSON.stringify(rule1));
      console.log("rulesEquals():: rule2--> "+ JSON.stringify(rule2));
      
      if(wemoUtil.isMakerDevice(rule2.DeviceID)){
    	  var tempUdn = wemoUtil.getOriginalMakerUDN(rule2.DeviceID);
    	  if(rule1.Devices[tempUdn] != undefined){
    		  StartAction = rule1.Devices[tempUdn].StartAction;
    	  }
      }
        if ((rule1.When.StartTime == rule2.StartTime) &&
            (rule1.When.RuleDuration == rule2.RuleDuration) &&
            (rule1.State == rule2.State) &&
            (StartAction == rule2.StartAction)
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
      console.log("ruleConflicts():: rule1--> "+ JSON.stringify(rule1));
      console.log("ruleConflicts():: rule2--> "+ JSON.stringify(rule2));
        if (!deviceUsed(rule2, rule1.DeviceID)) {
            return false;
        }
        if (checkDayOverlap(rule2, rule1)) {
            //We don't check next day overlap to be consistent with iOS code
            //See RuleUtility.m:1771
            var rule1End = parseInt(rule1.StartTime) + parseInt(rule1.RuleDuration);
            var tempUdn;
            //Case for Simple Timer Rule
            if(wemoUtil.isMakerDevice(rule1.DeviceID)){
            	tempUdn = wemoUtil.getOriginalMakerUDN(rule1.DeviceID);
            }
            else{
            	tempUdn = rule1.DeviceID; 
            }
            
//            alert("rule2.Devices[rule1.DeviceID].StartAction--> "+ rule2.Devices[tempUdn]+" :: "+ rule2.Devices[tempUdn].StartAction);
            if (rule1.StartTime == rule2.When.StartTime && rule1.StartAction != rule2.Devices[tempUdn].StartAction) {
                return true;
            }
            //Case 1
            //New rule interval is inside existing interval
            if (rule1.StartTime < rule2.When.StartTime && rule1End > rule2.When.EndTime) {
                return true;
            }
            else if(rule1.StartTime < rule2.When.StartTime && rule2.When.StartTime < rule1End){
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
    
    //Rule Conflicit Popup
    $("#rule_conflict_learn_more_btn").on("click", function () {
        if (!isRemoteEnabled) {
            deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
        }
        window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Help_Rules_Alert_Url']);
        window.open(wemo.items['ruleHelpCenter'], "_system");
        $("#rule_conflict").popup("close");
    });
    $("#rule_conflict_ok_btn").on("click", function () {
        $("#rule_conflict").popup("close");
        $("RuleConflictSimpleAndTimer").html("");
    });
    
    function showConflictDuplicateMessage(ruleName, msgType, device, ruleStart, ruleEnd, ruleType, ruleStartAct) {
//    	alert("msgType-> "+ ruleName +" : "+ msgType+" : "+ device+" : "+ ruleStart+" : "+ ruleEnd+" : "+ ruleType+" : "+ ruleStartAct);
        var RuleconflictHeader = wemo.items['RuleConflict'];
        if (msgType == "duplicate_name" || msgType == "duplicate_rule") {
            var ruleConflictLocalizedmsg = wemo.items['RuleDuplicateText'];
            var temparr = ruleConflictLocalizedmsg.split("%@");
            var msgText = temparr[0] + " " + ruleName + " " + temparr[1];
            setTimeout(
                function () {
                    $("#ruleInfoHeader").text(RuleconflictHeader);
                    $("#RuleDuplicateText").text(msgText);
                    $("#rule_duplicate").popup("open");
                },
                timeout.POPUP_DISPLAY_DELAY
            );
        }
        if (msgType == "conflict_rule" || msgType == "conflict_day__rule") {
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
                case sessionStore.MAKER_MOTION_CONTROLLED:
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
    function verifyRuleDuplicatesAndConflicts(rule, ruleRow) {
        //Check rule for duplication
        console.log("Check for rule for dupilacation...");
        console.log("New rule name: " + rule.RuleName);
        console.log("verifyRuleDuplicatesAndConflicts() rule--> "+JSON.stringify(rule));
        console.log("verifyRuleDuplicatesAndConflicts() ruleRow--> "+JSON.stringify(ruleRow) + "  "+ ruleRow);
        var makerSensorRulesInfo ={};
        // checking for maker sensor udn
        for(var index = 0; index < ruleRow.length; index++){
        	var tmpRuleRow = ruleRow.item(index);
        	if(tmpRuleRow.DayID == -1){
        		if (Object.keys(rule.Sensors).length > 0) {
        			for (makerSensor in rule.Sensors) {
        				if(wemoUtil.getRuleClass(rule.RuleType) == wemoUtil.getRuleClass(tmpRuleRow.Type) && tmpRuleRow.DeviceID == wemoUtil.getMakerSensorUDN(makerSensor)){
        					if(tmpRuleRow.StartAction == rule.Sensors[makerSensor].state){
        						makerSensorRulesInfo[tmpRuleRow.RuleID] = true ;
        					}
        				}
        			}
        		}
        	}
        }
        for (var i = 0; i < ruleRow.length; i++) {
            var tmpRule = ruleRow.item(i);
            console.log("verifyRuleDuplicatesAndConflicts() tmpRule--> "+JSON.stringify(tmpRule));
            if (tmpRule != undefined) {
                if (wemoUtil.getRuleClass(rule.RuleType) == wemoUtil.getRuleClass(tmpRule.Type)) {
                        var tmpRuleName = tmpRule.RuleName;
                        var udn = tmpRule.DeviceID, fname = '';
                        if(wemoUtil.isMakerDevice(udn)){
                        	if(rule.Devices[tmpRule.DeviceID] != undefined){
                        		fname = rule.Devices[tmpRule.DeviceID].FName;
                        	}
                        	else if(rule.Devices[wemoUtil.getOriginalMakerUDN(tmpRule.DeviceID)] != undefined){
                        		fname = rule.Devices[wemoUtil.getOriginalMakerUDN(tmpRule.DeviceID)].FName;
                        	}
                        }
                        else{
                        	fname = rule.Devices[tmpRule.DeviceID].FName;
                        }
                        if (rulesEquals(rule, tmpRule) && makerSensorRulesInfo[tmpRule.RuleID] == true) {
                        	nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        	console.log(JSON.stringify(tmpRule));
                        	console.log("Found new rule duplication with: " + tmpRuleName);
                        	showConflictDuplicateMessage(tmpRule.Name, "duplicate_rule", fname, null, null, null, null);
                        	return true;
                        }
                        if (ruleConflicts(rule, tmpRule) && makerSensorRulesInfo[tmpRule.RuleID] == true) {
                        	if (isWholeDay(rule)) {
                        		nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        		console.log(JSON.stringify(tmpRule));
                        		console.log("Found new rule whole-day conflict with: " + tmpRuleName);
                        		showConflictDuplicateMessage(tmpRule.Name, "conflict_day__rule", fname, null, null, null, null);
                        		return true;
                        	}
                        	else {
                        		console.log(JSON.stringify(tmpRule));
                        		console.log("Found new rule conflict with: " + tmpRuleName);
                        		var ruleStartAct = tmpRule.StartAction == 1 ? wemo.items["RuleDetailsSwitchTurnsOn"] : wemo.items["RuleDetailsSwitchTurnsOff"];
                        		nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        		showConflictDuplicateMessage(tmpRule.Name, "conflict_rule", fname, wemoUtil.convertMillisecondsToAMPM(tmpRule.StartTime), wemoUtil.convertMillisecondsToAMPM(parseInt(tmpRule.StartTime) + parseInt(tmpRule.RuleDuration)), tmpRule.Type, ruleStartAct);
                        		return true;
                        	}
                        }
                }
            }
        }
        return false;
    }
}