/**
 SaveCountdownRule.js

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

var isConflicting = false;
function saveNewRule_RULES_RULEDEVICES(arg, ruleObj) {
    var saved = false;

    if (Object.keys(ruleObj.Devices).length <= 0) {
        alert(wemo.items['PleaseSelectDevices']);
        return;
    }
	
	if ( ruleObj.When.OnModeOffset == undefined ) ruleObj.When.OnModeOffset = 0;
	if ( ruleObj.When.OffModeOffset == undefined ) ruleObj.When.OffModeOffset = 0;
	if ( ruleObj.When.CountdownTime == undefined ) ruleObj.When.CountdownTime = 60;

    var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
    db.transaction(SaveCountdownRule, errorCB, successCB);
    db.transaction(getRules, errorCB, successfullySaved);

    function SaveCountdownRule(tx) {
    	var ruleName = ruleObj.RuleName.replace(/\"/g,'&quot;');
    	console.log("SaveCountdownRule_ruleName :: " + ruleName);
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
                    if (!isConflicting && verifyRuleDuplicatesAndConflicts(ruleObj, results.rows)) {
                        wemoUtil.infoLog("Conflicting/Duplicate",  "Duplicate Rule found. Require changes.");
                        return false;
                    }

                    if (ruleObj.id > 0) {
                        //Delete rules and related stuff with the same RuleID
                        tx.executeSql("DELETE FROM RULEDEVICES WHERE RuleID=" + ruleObj.id, [], function () {
                            console.log("RuleDevice with ID : " + ruleObj.id + " is deleted");
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
                    var EndTime = 0;
                    var RuleDuration = "";
                    if (Object.keys(ruleObj.Devices).length > 0) {
                    	for (device in ruleObj.Devices) {
                    		console.log("first LOOP");
                    		var isLedDevice = false;
                    		var bridgeUDN;
                    		if(device.indexOf("uuid") == -1){
                    			isLedDevice = true;
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

                                EndTime = parseInt(StartTime) + parseInt(RuleDuration);
                                if(EndTime > timestamp.MAX_HOUR){
                                    EndTime = EndTime % timestamp.MAX_HOUR;
                                }


                    			console.log("before Push First :: " + '(' + ruleObj.id + ',"' + device + '", "0", ' + deCodeDays(arrDays[daysCount1]) + ', "' + StartTime + '","' + RuleDuration + '", ' + ruleObj.Devices[device].StartAction + ', ' + ruleObj.Devices[device].EndAction + ', "' + ruleObj.Devices[device].SensorDuration + '","-1","' + ruleObj.When.CountdownTime + '","-1")');
                    			tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime, EndTime) VALUES (' + ruleObj.id + ',"' + device + '", "0", "' + deCodeDays(arrDays[daysCount1]) + '", "' + StartTime + '","' + RuleDuration + '", ' + ruleObj.Devices[device].StartAction + ', ' + ruleObj.Devices[device].EndAction + ', "' + ruleObj.Devices[device].SensorDuration + '","-1","-1","-1","","",'+ruleObj.When.OnModeOffset+','+ruleObj.When.OffModeOffset+','+ruleObj.When.CountdownTime+', "' + EndTime + '")');
                    		}
                    	}
                    }

                    // for edit mode only
                    // adds removed devices from edited rule to the ruleObj.devices
                    // so that the rules can be updated on those devices also
                    var isEdit = window.sessionStorage.getItem(sessionStore.isEdit);
                    if (isEdit != sessionStore.RULE_NEW) {
                    	var oldRuleObj = window.sessionStorage.getItem(sessionStore.RULE_OBJ_BEFORE_EDIT);
                    	oldRuleObj = JSON.parse(oldRuleObj);
                    	wemoUtil.infoLog("ruleObj::"+JSON.stringify(ruleObj));
                    	
                    	for (var oldDevice in oldRuleObj.Devices) {
                    		if(typeof ruleObj.Devices[oldDevice] == "undefined"){
                    			ruleObj.Devices[oldDevice] = oldRuleObj.Devices[oldDevice];
                    		}
                    	}
                    	
                    	wemoUtil.infoLog("modified newRuleObj::"+JSON.stringify(ruleObj));
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
        var ledsparams = [];
        var len = "";
        var ledparamlength = 0;
        var snsparamlength = 0;
        var j=0;
        var ledarr = [];

        $.each(rule.Devices, function(udn, obj1) {
            console.log("UDN:  "+udn+" =1= "+obj1.SelectedLedValue);
            var val = $.trim(obj1.SelectedLedValue);
            ledarr[j] = obj1;

            if(val == 1)
                ledparamlength++;
            else if(val == 0)
                snsparamlength++;
            j++;
        });

        console.log("rule.Devices "+JSON.stringify(rule.Devices)+"----"+ledparamlength+"---"+snsparamlength);

        if(isRemoteEnabled)
        {
            params = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
            params = params.concat(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA));
            params = params.concat(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DIMMER_DATA));
            params = params.concat(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA));
            makePush(params);
        }
        else
        {
        	wemoUtil.getDevicesWithCallback(actions.SELECT_SWITCHES, function(params) {
                wemoUtil.getDevicesWithCallback(actions.SELECT_DIMMERS, function(dimmers) {
                    params = params.concat(dimmers);
                    wemoUtil.getDevicesWithCallback(actions.SELECT_INSIGHTS, function(insights) {
                        params = params.concat(insights);
                        wemoUtil.getDevicesWithCallback(actions.SELECT_MAKER, function(makers) {
                            params = params.concat(makers);

                            makePush(params);
                        });

                    });
                });
              });
        }

        function makePush(params)
        {
            if ( params != null && params.length > 0)
            {
                if(ledparamlength != null && ledparamlength > 0)
                    len = (params.length)+(ledparamlength);
                else
                    len = params.length;
                
                var isLEDInRule = 0;
                if(ledparamlength > 0)
                {
                	var ledCount = 0;
                    for (var dev1 = 0; dev1 < Object.keys(rule.Devices).length; dev1++) {
                        var slectedval = ledarr[dev1];
                        var selectedLedVar = $.trim(ledarr[dev1].SelectedLedValue);

                        if(selectedLedVar == 1)
                        {
                           isLEDInRule = 1;
                           break;
                        }

                    }
                }

                console.log("SaveCountdownRule: " + JSON.stringify(rule.Devices));
                
                console.log("SaveCountdownRule: " + JSON.stringify(params));
                
                var devicesLength = Object.keys(rule.Devices).length;
                var ruleDevices ='';
                for (var inx = 0; inx < devicesLength ; inx++) {
                 var udn = Object.keys(rule.Devices)[inx];
                 
                 for (var j =0; j < params.length ; j++){
                  console.log("SaveCountdownRule: " + udn + ", params_udn: " + params[j].udn);
                     if(wemoUtil.isMakerDevice(udn) && wemoUtil.getOriginalMakerUDN(udn) == params[j].udn ){
                      console.log("SaveCountdownRule: " + udn + ", params_udn: " + params[j].udn);
                      ruleDevices = ruleDevices + udn + ',';
//                      wemoUtil.pushScheduleSwitch( udn, inx, devicesLength);
                     } else if(udn == params[j].udn){
                      console.log("SaveCountdownRule: " + udn + ", params_udn: " + params[j].udn);
//                      wemoUtil.pushScheduleSwitch( udn, inx, devicesLength);
                      ruleDevices = ruleDevices + udn + ',';
                     }
                    }
                }
                
                ruleDevices = ruleDevices.substring(0, ruleDevices.length - 1);
                wemoUtil.pushScheduleSwitch( ruleDevices, inx, devicesLength, isLEDInRule);    
            }
        }
        
        if(ledparamlength > 0)
        {
        	var ledCount = 0;
            for (var dev1 = 0; dev1 < Object.keys(rule.Devices).length; dev1++) {
                var slectedval = ledarr[dev1];
                var selectedLedVar = $.trim(ledarr[dev1].SelectedLedValue);

                if(selectedLedVar == 1)
                {
                    var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
                    console.log("entering in push");
                    wemoUtil.pushScheduleLedDevices(Object.keys(rule.Devices)[dev1],db,rule,ledCount,ledparamlength);
                    ledCount++;
                }

            }
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

        if (!deviceUsed(rule1, rule2.DeviceID)) {
            return false;
        }

        if ((rule1.When.StartTime == rule2.StartTime) &&
            (rule1.When.RuleDuration == rule2.RuleDuration) &&
            (rule1.State == rule2.State) &&
            (rule1.Devices[rule2.DeviceID].StartAction == rule2.StartAction)
        ) {
            if (rule1.SelectedDayOrRange == "Mon-Tue-Wed-Thu-Fri-Sat-Sun") {
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
        if (!deviceUsed(rule2, rule1.DeviceID)) {
            return false;
        }

        if (checkDayOverlap(rule2, rule1)) {
            //We don't check next day overlap to be consistent with iOS code
            //See RuleUtility.m:1771

            var rule1End = parseInt(rule1.StartTime) + parseInt(rule1.RuleDuration);

            //Case for Simple Timer Rule
            if (rule1.StartTime == rule2.When.StartTime && rule1.StartAction != rule2.Devices[rule1.DeviceID].StartAction) {
                return true;
            }

            //Case 1
            //New rule interval is inside existing interval
            if (rule1.StartTime < rule2.When.StartTime && rule1End > rule2.When.EndTime) {
                return true;
            }

            //Case 2
            //New rule interval partialy overlaps with existing
            if (rule2.When.StartTime <= rule1.StartTime && (rule2.When.EndTime <= rule1End && rule2.When.EndTime >= rule1.StartTime)) {
                return true;
            }
            if (rule2.When.EndTime >= rule1.EndTime && (rule2.When.StartTime >= rule1.StartTime && rule2.When.StartTime <= rule1End)) {
                return true;
            }

            //Case 3
            //Existing rule interval is inside new rule interval
            if (rule2.When.StartTime < rule1.StartTime && rule2.When.EndTime > rule1End) {
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
    
    $("#ok_btn_other").on("click", function() {
        $("#rule_conflict_other").popup("close");
        $("RuleConflictSimpleAndTimerOther").html("");
        isConflicting = true;
        var ruleObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
        ruleObj.State = 0;
        saveNewRule_RULES_RULEDEVICES(ruleObj.RuleType , ruleObj);
        
    });
    
    function showConflictDuplicateMessage(ruleName, msgType) {
        var RuleconflictHeader = wemo.items['RuleConflict'];

        if (msgType == "duplicate_rule") {
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

        if (msgType == "conflict_day_rule") {
            var ruleConflictLocalizedmsg = wemo.items['RuleConflictSimpleAndTimer'];
            var temparr = ruleConflictLocalizedmsg.split("%@");
            var msgText = temparr[0] + " " + ruleName + temparr[4];

            setTimeout(
                function () {
                    $("#ruleInfoHeader").text(RuleconflictHeader);
                    $("#RuleConflictSimpleAndTimer").text(msgText);
                    $("#rule_conflict").popup("open");
                },
                timeout.POPUP_DISPLAY_DELAY
            );
        }
        
        if (msgType == "conflict_rule_other") {
            setTimeout(
                function() {
                    $("#ruleInfoHeader").text(RuleconflictHeader);
                    $("#RuleConflictSimpleAndTimerOther").text(wemo.items['SaveConflictRuleDisabled']);
                    $("#rule_conflict_other").popup("open");
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

    //Check for duplicate and conflicting rules.
    function verifyRuleDuplicatesAndConflicts(rule, ruleRow) {
        console.log("New rule name: " + rule.RuleName);
        console.log("verifyRuleDuplicatesAndConflicts() rule--> " + JSON.stringify(rule));
        var countDownRulesInfo = {};
        for (var i = 0; i < ruleRow.length; i++) {
            var tmpRule = ruleRow.item(i);
            console.log("verifyRuleDuplicatesAndConflicts() tmpRule--> " + JSON.stringify(tmpRule));
            if (tmpRule != undefined) {
                if (wemoUtil.getRuleClass(rule.RuleType) == wemoUtil.getRuleClass(tmpRule.Type)) {
                    var tmpRuleName = tmpRule.Name;
                    if (tmpRule.State == '1' && rulesEquals(rule, tmpRule)) {
                    	nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        console.log("Found new rule duplication with: " + tmpRuleName);
                        showConflictDuplicateMessage(tmpRule.Name, "duplicate_rule");
                        return true;
                    }
                    if (tmpRule.State == '1' && ruleConflicts(rule, tmpRule)) {
                            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                            console.log("Found new rule whole-day conflict with: " + tmpRuleName);
                            showConflictDuplicateMessage(tmpRule.Name, "conflict_day_rule");
                            return true;
                    }
                } else if(tmpRule.Type == sessionStore.TIME_INTERVAL){
                    var tmpRuleName = tmpRule.Name;
                    if (ruleConflicts(rule, tmpRule)) {
                            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                            showConflictDuplicateMessage(tmpRule.Name, "conflict_rule_other");
                             return true;
                }
            }
        }
        }
        return false;
    }
}