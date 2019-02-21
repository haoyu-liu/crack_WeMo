/*
 rule_details.js

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

var TAG = "long_press_rule_details.js: ";

$(document).bind('pageinit', function() {
    long_press_rule_details.initialize();
});

var SFW_DEVICE_LIST = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SFW_DEVICE_LIST);
var selectedRule = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
var selectedRuleID = selectedRule.id;
var selectedRuleState = selectedRule.State;
var triggerDevice;

var long_press_rule_details = {
    deviceList: {},
    ruleObj: {},
    lsDevicesObj: {},
    initialize : function() {
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    onDeviceReady : function() {
        rulesPlugin.execute(null, null, actions.RULES_EXTRACT_FROM_DB, []);

        if (!isRemoteEnabled) {
            $.when(wemoUtil.getDevices(actions.SELECT_DIMMERS),
               wemoUtil.getDevices(actions.GET_LONG_PRESS_LIGHT_SWICTHES),
               wemoUtil.getDevices(actions.SELECT_SWITCHES),
               wemoUtil.getDevices(actions.SELECT_INSIGHTS))
            .then(function() {
                long_press_rule_details.mainMethod();
            }).fail(function() {
                throw ('ERROR');
            });
        }else {
            $.when(wemoUtil.getDevices(actions.GET_LONG_PRESS_LIGHT_SWICTHES))
            .then(function() {
                long_press_rule_details.mainMethod();
            }).fail(function() {
                throw ('ERROR');
            });
        }
    },

    mainMethod: function() {
        long_press_rule_details.loadDeviceList();
        selectedRule["SelectedDevices"] = [];
        selectedRule["Devices"] = [];

        if (parseInt(selectedRuleState) === 0) {
            $("#change_rule_state").addClass("disable");
        }

        $("#change_rule_state").on("click", function(){
            $("#change_rule_state").toggleClass("disable");

            selectedRuleState = $("#change_rule_state").hasClass("disable") ? 0: 1;

            var obj = {
                RULE_ID : selectedRuleID,
                STATE : selectedRuleState
            };

            nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", wemo.items['RULE_STATUS_SENDING_DB']]);
            rulesPlugin.execute(
                function() {
                    var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
                    db.transaction(changeRuleState, errorCB, successChangeStatusCB);
                },
                function(err) {
                      nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                    long_press_rule_details.saveRulesFailed(err, selectedRuleState, 0);
                },
                actions.CHANGE_RULES_STATUS, [obj]
            );

            function changeRuleState(tx){
                tx.executeSql("UPDATE RULES SET State=? WHERE RuleID=?", [selectedRuleState ,selectedRuleID], getAllRules, errorCB);
            }

            function updateNotification() {
                var notificationTimeout;

                if (selectedRuleState === 1) {
                    $(".notification").html(wemo.items["RuleEnabled"]).fadeIn();
                } else if (selectedRuleState === 0) {
                     $(".notification").html(wemo.items["RuleDisabled"]).fadeIn();
                }
                clearTimeout(notificationTimeout);
                notificationTimeout = setTimeout(function(){
                    $(".notification").fadeOut();
                }, 4000);

                var information = {
                    udn : triggerDevice,
                    ruleId : selectedRuleID
                };
                cordova.exec(null, null, plugins.SMART_DEVICE_PLUGIN, actions.REFRESH_LONG_PRESS_RULE_DETAILS, [information]);
                nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
            }

            function successChangeStatusCB(){
                updateNotification();
                window.sessionStorage.setItem(sessionStore.LAST_ENTRY, "0");
            }

            function getAllRules(tx){
                tx.executeSql('SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.Level, b.ZBCapabilityStart, b.ZBCapabilityEnd from RULES a inner join RULEDEVICES b on a.RuleID=CAST(b.RuleID AS CHAR) order by a.Name COLLATE NOCASE', [], querySuccess, errorCB);
            }
        });

        $("#long_press_rule_delete_btn").on("click", function(){

             nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", wemo.items['RULE_STATUS_DELETING_RULE']]);
            var obj = {
                RULE_ID : selectedRuleID
            };

            rulesPlugin.execute(
                function() {
                    var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
                    db.transaction(getAllRulesAfterDelete, errorCB, successDeleteCB);
                },
                function(err) {
                     nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                    long_press_rule_details.saveRulesFailed(err, -1, 1);
                },
                actions.DELETE_RULES, [obj]
            );

            function updateDeviceDrawer() {
                var information = {
                    udn : triggerDevice,
                    ruleId : selectedRuleID
                };
                cordova.exec(null, null, plugins.SMART_DEVICE_PLUGIN,actions.REFRESH_LONG_PRESS_RULE_DETAILS, [information]);
                nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);

                var ruledata = JSON.parse(window.sessionStorage.getItem(sessionStore.RULES_DATA));
                    wemoUtil.infoLog(wemoUtil.TAG, "PUSH DB Success. Rules Data" + ruledata);

                    if (ruledata && (ruledata.length === 0)) {
                        wemoUtil.loadUrl(filePath.CREATE_RULE);
                    } else {
                        wemoUtil.loadUrl(filePath.ENABLED_RULES);
                    }
            }

            function successDeleteCB(){
                updateDeviceDrawer();
                window.sessionStorage.setItem(sessionStore.LAST_ENTRY, "0");
            }

            function getAllRulesAfterDelete(tx){
                tx.executeSql('SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.Level, b.ZBCapabilityStart, b.ZBCapabilityEnd from RULES a inner join RULEDEVICES b on a.RuleID=CAST(b.RuleID AS CHAR) order by a.Name COLLATE NOCASE', [], querySuccess, errorCB);
                tx.executeSql("SELECT distinct RuleID FROM RULES", [], querySuccessful, errorCB);
            }

        });

        function querySuccessful(tx,results){
            console.log("querySuccessful()--> results rows length: " + results.rows.length);
            if(results.rows.length==1){
                window.sessionStorage.setItem(sessionStore.LAST_ENTRY, "1");
                window.sessionStorage.setItem("create_rule", "1");
            }
        }


        function querySuccess(tx,results){
            console.log("querySuccess()");
            var len = results.rows.length;
            var ruleRows=[];
            if(len>0) {
                for(var i=0;i<len;i++){
                    ruleRows[i]=results.rows.item(i);
                }

            }
            window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));
        }

        function errorCB(){
            console.log("Error!");

        }

        //To return back to home page: device list tab
        $(".back_btn").on("tap", function(e) {
           wemoUtil.loadUrl(filePath.ENABLED_RULES);
        });

       $("#modify_rule").on("click", function(){
            window.sessionStorage.setItem(sessionStore.isEdit, "edit_long_press_rule");
            window.sessionStorage.setItem(sessionStore.RULE_STATE_EDIT_MODE, selectedRuleState);
            selectedRule["State"] = selectedRuleState;
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_OBJ_BEFORE_EDIT, selectedRule);
            wemoUtil.loadUrl(filePath.LONG_PRESS_RULE);
        });

       long_press_rule_details.bindEvents();


      $("#rule_can_not_save_ok_btn").on("click", function(){
           $("#rule_can_not_save" ).popup( "close" );
      });
    },

    saveRulesFailed : function(err,state, deleteAction) {
        if (err) {
             if (err.ERROR_CODE === -402) {
                //Rule Cannot Be Enabled/Disabled/Deleted/Saved
                var cannotSavedTitle = "";
                if (state === -1 && deleteAction === 1) {
                    cannotSavedTitle = wemo.items["longPressRuleCannotDeletedTitle"];
                } else if (state === 1 && deleteAction === 0) {
                    cannotSavedTitle = wemo.items["longPressRuleCannotEnabledTitle"];
                    $("#change_rule_state").addClass("disable");
                } else if (state === 0 && deleteAction === 0) {
                    cannotSavedTitle = wemo.items["longPressRuleCannotDisabledTitle"];
                    $("#change_rule_state").removeClass("disable");
                }

                $("#rule_can_not_save #longPressRuleCannotSaveTitle").html(cannotSavedTitle);
                $("#rule_can_not_save").popup("open");
            }
        }
         nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
    },


    loadDeviceList: function() {
        var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
       //Get all rows from DB for a specific rule
        db.transaction(getData, getDataErrorCB, getDataSuccessCB);
        function getData(tx){
            tx.executeSql('SELECT * from RULEDEVICES where RuleID=?',[selectedRuleID],
                function (tx,results){
                    var len = results.rows.length;
                     var ruleRows = [];
                    if (len> 0) {
                        ruleRows[0] = results.rows.item(0);
                        long_press_rule_details.renderLSList(ruleRows[0]);

                        db.transaction(getSelectedDeviceData, getDataErrorCB, getDataSuccessCB);

                        function getSelectedDeviceData (tx2) {
                            tx2.executeSql('SELECT * from TARGETDEVICES where RuleID=?',[selectedRuleID],
                            function (tx2,results){
                                var len2 = results.rows.length;
                                var ruleRows2 = [];
                                if (len2 > 0) {
                                    for (var i = 0; i < len2 ; i++) {
                                        ruleRows2[i] = results.rows.item(i);

                                        if (parseInt(ruleRows2[i].DeviceIndex) !== -1) {
                                            long_press_rule_details.renderSelectedDevicesList(ruleRows2[i]);
                                        }
                                    }
                                }

                            }, getDataErrorCB);
                        }
                    }

                }, getDataErrorCB);
        }


        function getDataErrorCB(){
            wemoUtil.infoLog(TAG, "Error Selecting records");
        }
        function getDataSuccessCB(){
            wemoUtil.infoLog(TAG, 'Successfully retrived DB');

        }


    },

    renderSelectedDevicesList: function(selectedDevice) {
       var deviceIcon, defaultName;
        if (SFW_DEVICE_LIST[selectedDevice.DeviceID] && SFW_DEVICE_LIST[selectedDevice.DeviceID].icon && SFW_DEVICE_LIST[selectedDevice.DeviceID].icon !== "") {
            deviceIcon = SFW_DEVICE_LIST[selectedDevice.DeviceID].icon;
        } else {
            if (selectedDevice.DeviceID.match(/socket/gi)) {
                deviceIcon = "../img/new_icons/WeMo_Switch_Old_@3x.png";
                defaultName = wemo.items['DefaultName_WeMoSwitch'];
            } else if (selectedDevice.DeviceID.match(/insight/gi)) {
                deviceIcon = "../img/new_icons/WeMo_Insight_Switch_@3x.png";
                defaultName = wemo.items['DefaultName_WeMoInsight'];
            } else if (selectedDevice.DeviceID.match(/lightswitch/gi)) {
                deviceIcon = "../img/new_icons/WeMo_LightSwitch_@3x.png";
                defaultName = wemo.items['DefaultName_WeMoLightSwitch'];
            } else if (selectedDevice.DeviceID.match(/dimmer/gi)) {
                deviceIcon = "../img/new_icons/WeMo_Dimmer_@3x.png";
                defaultName = wemo.items['DefaultName_WeMoDimmerShort'];
            }
        }

        selectedRule["SelectedDevices"].push(selectedDevice.DeviceID);

        var friendlyName = "";
        if (SFW_DEVICE_LIST[selectedDevice.DeviceID] && SFW_DEVICE_LIST[selectedDevice.DeviceID].isDiscovered) {
            friendlyName = SFW_DEVICE_LIST[selectedDevice.DeviceID].friendlyName;
        } else {
            if ( SFW_DEVICE_LIST[selectedDevice.DeviceID] &&  SFW_DEVICE_LIST[selectedDevice.DeviceID].friendlyName) {
                friendlyName = SFW_DEVICE_LIST[selectedDevice.DeviceID].friendlyName + " - " + wemo.items['NotFound'];
            } else {
                friendlyName = defaultName + " - " + wemo.items['NotFound'];
            }
        }

        var html = '<li><span class="deviceIcon" style="background-image: url('+ deviceIcon +');"></span>' +
                        '<span class="deviceName">'+ friendlyName +'</span>';

        $('#turnDeviceList').append(html);

    },

    renderLSList: function(lightSwitch) {
         var deviceIcon, defaultName;
         triggerDevice = lightSwitch.DeviceID;
        if (SFW_DEVICE_LIST[lightSwitch.DeviceID] && SFW_DEVICE_LIST[lightSwitch.DeviceID].icon && SFW_DEVICE_LIST[lightSwitch.DeviceID].icon !== "") {
            deviceIcon = SFW_DEVICE_LIST[lightSwitch.DeviceID].icon;
        } else {
            if (lightSwitch.DeviceID.match(/dimmer/gi)) {
                deviceIcon = "../img/new_icons/WeMo_Dimmer_@3x.png";
                defaultName = wemo.items['DefaultName_WeMoDimmerShort'];
            } else {
                deviceIcon = "../img/new_icons/WeMo_LightSwitch_@3x.png";
                defaultName = wemo.items['DefaultName_WeMoLightSwitch'];
            }
        }

        selectedRule["Devices"].push(triggerDevice);
        var friendlyName = "";
        if (SFW_DEVICE_LIST[lightSwitch.DeviceID] && SFW_DEVICE_LIST[lightSwitch.DeviceID].isDiscovered) {
            friendlyName = SFW_DEVICE_LIST[lightSwitch.DeviceID].friendlyName;
        } else {

            if ( SFW_DEVICE_LIST[lightSwitch.DeviceID] &&  SFW_DEVICE_LIST[lightSwitch.DeviceID].friendlyName) {
                friendlyName = SFW_DEVICE_LIST[lightSwitch.DeviceID].friendlyName + " - " + wemo.items['NotFound'];
            } else {
                friendlyName = defaultName + " - " + wemo.items['NotFound'];
            }
        }


        var html = '<li><span class="deviceIcon" style="background-image: url('+ deviceIcon +');"></span>' +
                        '<span class="deviceName">'+ friendlyName +'</span>';

        $('#lightSwitchList').append(html);
        selectedRule["StartAction"] = lightSwitch.StartAction;
        $(".turnDevices").html(wemo.items["TurnTheseState" + lightSwitch.StartAction]);
    },
    bindEvents: function() {
        wemoUtil.infoLog(TAG, "bindEvents");
        document.addEventListener('online', long_press_rule_details.onOnline, false);
        document.addEventListener('offline', long_press_rule_details.onOffline, false);
        document.addEventListener("backbutton", long_press_rule_details.onBackPress, false);
        document.addEventListener("pause", long_press_rule_details.onPause, false);
        document.addEventListener("resume", long_press_rule_details.onResume, false);
    },

    onOffline: function() {
         wemoUtil.infoLog(TAG, "offLine");
    },

    onOnline: function() {
         wemoUtil.infoLog(TAG, "onLine");
    },

    onBackPress: function() {
        var selectedDevice = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE);
        if (selectedDevice != null) {
            window.sessionStorage.removeItem(sessionStore.CURRENT_DEVICE);
        }

        wemoUtil.infoLog(TAG, "onBackPress");
        wemoUtil.loadPreviousUrl();

    },

    onPause: function() {
        wemoUtil.infoLog(TAG, "onPause");
    },

    onResume: function() {
         wemoUtil.infoLog(TAG, "onResume");
    },

    reportError: function(e) {
         wemoUtil.infoLog(TAG, "Plugin Error!!!!   " + e);
    }
};