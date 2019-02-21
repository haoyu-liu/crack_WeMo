/**
     SaveLongPressRule.js

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

var TAG ='SaveLongPressRule.js: ';

function saveNewRule_RULES_RULEDEVICES(arg, ruleObj) {
    var saved = false;

    var isEdit = window.sessionStorage.getItem(sessionStore.isEdit);

    var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
    db.transaction(saveLongPressRule, errorCB, successCB);
    db.transaction(getRules, errorCB, successfullySaved);

    function saveLongPressRule(tx) {
        var ruleName = ruleObj.RuleName.replace(/\"/g,'&quot;');
        var executeQuery = "";
        wemoUtil.infoLog(TAG, "SaveLongPressRule_ruleName" + ruleName);
        tx.executeSql('SELECT RuleID  FROM RULES ORDER BY CAST(RuleID AS INT) DESC', [], querySuccess, errorCB);

        function querySuccess(tx, res) {
            if (parseInt(res.rows.length) > 0) {
                var len = parseInt(res.rows.item(0).RuleID) + 1;
            } else {
                var len = 1;
            }

            if (ruleObj.id > 0) {
                executeQuery = 'SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.DeviceID, b.StartTime, b.RuleDuration, b.StartAction, b.EndAction, b.DayID, b.Value, b.SensorDuration from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID where b.RuleID <> ' + ruleObj.id + ' order by a.Name COLLATE NOCASE';
            } else {
                executeQuery = 'SELECT distinct a.RuleID, a.Name, a.Type, b.DeviceID, a.State, b.StartTime, b.RuleDuration, b.StartAction, b.EndAction, b.DayID, b.Value, b.SensorDuration from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID order by a.Name COLLATE NOCASE';
            }

             tx.executeSql(executeQuery, [], function (tx, results) {
                var rulen = results.rows.length;
                //insert new long press rule to RULES table
                if (ruleObj.id > 0) {
                    //Delete rules and related stuff with the same RuleID
                    tx.executeSql("DELETE FROM RULEDEVICES WHERE RuleID='"+ruleObj.id+"'", [], function () {
                        wemoUtil.infoLog(TAG, "RuleDevice with ID : " + ruleObj.id + " is deleted");
                    }, errorCB);

                    tx.executeSql("DELETE FROM TARGETDEVICES WHERE RuleID='"+ ruleObj.id+"'", [], function () {
                        wemoUtil.infoLog(TAG, "Long press rule target devices with ID : " + ruleObj.id + " is deleted");
                    }, errorCB);

                    //Update rule
                    tx.executeSql('UPDATE RULES SET Name = "' + ruleName + '" WHERE RuleID="' + ruleObj.id + '"');
                } else {
                    ruleObj.id = len;
                    tx.executeSql('INSERT INTO RULES (RuleID, Name, Type, RuleOrder, StartDate, EndDate, State, Sync) VALUES ("' + ruleObj.id + '","' + ruleName + '", "' + ruleObj.RuleType + '", "2", "12201983", "12201983", "' + ruleObj.State + '", "NOSYNC")');
                }

                //insert new long press rule to RULEDEVICES table
                if (Object.keys(ruleObj.LightSwitch).length > 0) {
                    for (lightSwitch in ruleObj.LightSwitch) {
                        tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ("' + ruleObj.id + '","' + lightSwitch + '", "0", "-1", "' + ruleObj.When.StartTime + '", "' + ruleObj.When.RuleDuration + '", "' + ruleObj.StartAction + '", "-1", "0", "-1", "-1", "-1","","","0", "0","-1","'+ruleObj.When.EndTime+'")');

                        if (!(lightSwitch in ruleObj.Devices)) {
                            tx.executeSql('INSERT INTO TARGETDEVICES (RuleID, DeviceID, DeviceIndex) VALUES ("' + ruleObj.id + '","' + lightSwitch + '", "-1")');
                        }
                    }
                }

                 if (Object.keys(ruleObj.Devices).length > 0) {
                    for (var device = 0; device < Object.keys(ruleObj.Devices).length; device++) {
                          var udn = Object.keys(ruleObj.Devices)[device];
                          tx.executeSql('INSERT INTO TARGETDEVICES (RuleID, DeviceID, DeviceIndex) VALUES ("' + ruleObj.id + '","' + udn + '", "'+ device +'")');
                    }
                 }

                 saved = true;

            }, errorCB);
        }

    }

   function errorCB(err) {
        wemoUtil.infoLog(TAG, "Error inserting rule: " + JSON.stringify(err));
    }

    function successCB() {
        wemoUtil.infoLog(TAG, 'Successfully updated DB');
    }



    function successfullySaved() {
        wemoUtil.infoLog(TAG, 'Saved all the rules to Session');

        if (saved) {
            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
            nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", wemo.items['RULE_STATUS_SENDING_DB']]);
            wemoUtil.infoLog(TAG, 'Started pushing to plugins');

            setTimeout(function () {
                updateDevice();
            }, 1000);
        } else {
            wemoUtil.infoLog(TAG, 'Not Updated');
        }
     }

    function updateDeviceDrawer() {
        var information = {
            udn : Object.keys(ruleObj.LightSwitch)[0],
            ruleId : ruleObj.id
        };
        cordova.exec(null, null, plugins.SMART_DEVICE_PLUGIN,
                     actions.REFRESH_LONG_PRESS_RULE_DETAILS, [information]);
        nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);

        var ruledata = JSON.parse(window.sessionStorage.getItem(sessionStore.RULES_DATA));
            wemoUtil.infoLog(wemoUtil.TAG, "PUSH DB Success. Rules Data" + ruledata);
            wemoUtil.hideModal();
            if (ruledata && (ruledata.length === 0)) {
                wemoUtil.loadUrl(filePath.CREATE_RULE);
            } else {
                wemoUtil.loadUrl(filePath.ENABLED_RULES);
            }
    }


    function updateDevice() {
        wemoUtil.infoLog(TAG, "success creating the table structures");
        var devices = [];
        var jsonObjectStr = {};
        //pushSchStr
        if(isRemoteEnabled){
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DIMMER_DATA).concat(devices);
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA).concat(devices);
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA).concat(devices);
        } else {
           devices = wemoUtil.getDevices(actions.SELECT_SWITCHES);
           devices = wemoUtil.getDevices(actions.SELECT_DIMMERS).concat(devices);
           devices = wemoUtil.getDevices(actions.SELECT_INSIGHTS).concat(devices);
           devices = wemoUtil.getDevices(actions.SELECT_MAKER).concat(devices);
        }

       if (devices && devices.length > 0) {
          $.each(devices, function(index) {
                jsonObjectStr[devices[index].udn] = ["","","","","","",""];
          });

          jsonObjectStr = JSON.stringify(jsonObjectStr);

          wemoUtil.pushSchStr(jsonObjectStr, 0, null, updateDeviceDrawer);
       }

    }

    function getRules(tx) {
        wemoUtil.infoLog(TAG, 'Completed getting Rules');
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

}