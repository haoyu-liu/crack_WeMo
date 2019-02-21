/*
 long_press_rule.js

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

var TAG = "long_press_rule.js: ";

$(document).bind('pageinit', function() {
    long_press_rule.initialize();
});

var SFW_DEVICE_LIST = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SFW_DEVICE_LIST),
    isEditLongPress = (window.sessionStorage.getItem(sessionStore.isEdit) === "edit_long_press_rule"),
    editRuleObj = {},
    editDeviceID;

var long_press_rule = {
    deviceList: {},
    ruleObj: {},
    lsDevicesObj: {},
    initialize: function() {

        wemoUtil.infoLog(TAG, "initialize");

        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    onDeviceReady: function() {
        var str;
        if (!isEditLongPress) {
            str = wemo.items['NewLongPressRulePageTitle'];
        } else {
            str = wemo.items['EditLongPressRulePageTitle'];
        }

        $(".headerTitle").html(str);

        $(".helpIcon").on("click", function(){
            var LONGPRESS_SLIDES = "file:///android_asset/www/more/learn_about_wemo.html?fromsfw=long_press_rule_tutorial";
            window.location.href = LONGPRESS_SLIDES;
        });

        rulesPlugin.execute(null, null, actions.RULES_EXTRACT_FROM_DB, []);

        if (!isRemoteEnabled) {
            $.when(wemoUtil.getDevices(actions.SELECT_DIMMERS),
               wemoUtil.getDevices(actions.GET_LONG_PRESS_LIGHT_SWICTHES),
               wemoUtil.getDevices(actions.SELECT_SWITCHES),
               wemoUtil.getDevices(actions.SELECT_INSIGHTS))
            .then(function() {
                long_press_rule.methodMain();
            }).fail(function() {
                throw ('ERROR');
            });
        }else {
            $.when(wemoUtil.getDevices(actions.GET_LONG_PRESS_LIGHT_SWICTHES))
            .then(function() {
                long_press_rule.methodMain();
            }).fail(function() {
                throw ('ERROR');
            });
        }
    },

    buildLightSwitchList : function() {
        wemoUtil.infoLog(TAG, "Build selectable lightswitch list");

        var devices = [];

        if (isRemoteEnabled) {
            devices = wemoUtil.getDevices(actions.GET_LONG_PRESS_LIGHT_SWICTHES);
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DIMMER_DATA).concat(devices);

        } else {
            devices = wemoUtil.getDevices(actions.SELECT_DIMMERS);
            devices = wemoUtil.getDevices(actions.GET_LONG_PRESS_LIGHT_SWICTHES).concat(devices);
        }
        var savedRules = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULES_DATA),
            savedRulesArr = [];

        if (isEditLongPress) {
            editRuleObj  = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_OBJ_BEFORE_EDIT);
            long_press_rule.ruleObj.LightSwitch = {};
            long_press_rule.ruleObj.Devices = {};
        }

        if (savedRules && savedRules.length > 0) {
             $.each(savedRules, function(index) {
               if (savedRules[index].Type === sessionStore.LONG_PRESS) {
                 if (isEditLongPress) {
                    if (parseInt(savedRules[index].RuleID) !==  parseInt(editRuleObj.id)) {
                        savedRulesArr.push(savedRules[index].DeviceID);
                    } else {
                       editDeviceID = savedRules[index].DeviceID;
                    }
                 } else {
                    savedRulesArr.push(savedRules[index].DeviceID);
                 }
                }
             });
        }

        if (devices && devices.length > 0) {
            $.each(devices, function(index) {
               if (savedRulesArr.indexOf(devices[index].udn) === -1) {
                    var deviceIcon;
                    if (SFW_DEVICE_LIST[devices[index].udn].icon && SFW_DEVICE_LIST[devices[index].udn].icon !== "") {
                        deviceIcon = SFW_DEVICE_LIST[devices[index].udn].icon;
                    } else {
                        if (devices[index].udn.match(/dimmer/gi)) {
                            deviceIcon = "../img/new_icons/WeMo_Dimmer_@3x.png";
                        } else {
                            deviceIcon = "../img/new_icons/WeMo_LightSwitch_@3x.png";
                        }
                    }

                   long_press_rule.lsDevicesObj[devices[index].udn] = {
                       name: devices[index].friendlyName,
                       iconURL: deviceIcon
                   };
               }
            });

       }

        if (isEditLongPress) {
            for (var i=0; i < editRuleObj.Devices.length; i++) {
                var udn = editRuleObj.Devices[i];
                if (!long_press_rule.lsDevicesObj[udn]) {
                    if (udn.match(/dimmer/gi)) {
                        deviceIcon = "../img/new_icons/WeMo_Dimmer_@3x.png";
                        defaultName = wemo.items['DefaultName_WeMoDimmerShort'];
                    } else {
                        deviceIcon = "../img/new_icons/WeMo_LightSwitch_@3x.png";
                        defaultName = wemo.items['DefaultName_WeMoLightSwitch'];
                    }

                   long_press_rule.lsDevicesObj[udn] = {
                       name: defaultName + " - " + wemo.items['NotFound'],
                       iconURL: deviceIcon
                   };
                }
            }
        }

        if (long_press_rule.lsDevicesObj) {
            long_press_rule.renderLSList(long_press_rule.lsDevicesObj);
        }

        $('#light_switch_list li').click(function(e){
               $('#light_switch_list li .radioBtn').removeClass("selected");
               $(this).find(".radioBtn").addClass("selected");

               var udn = $(this).attr("id");
               long_press_rule.ruleObj.LightSwitch = {}
               long_press_rule.ruleObj.LightSwitch[udn] = long_press_rule.lsDevicesObj[udn];
               long_press_rule.ruleObj.RuleName =  long_press_rule.ruleObj.LightSwitch[udn].name + " " + sessionStore.LONG_PRESS_RULE;
        });

    },

    renderLSList: function(lsDevicesObj) {
        $.each(lsDevicesObj, function(index) {
            var html = '<li id='+ index +'><span class="deviceIcon" style="background-image: url('+lsDevicesObj[index].iconURL +');"></span>' +
                            '<span class="deviceName">'+ lsDevicesObj[index].name +'</span>' +
                             '<span class="radioBtn"></span></li>';

            $('#light_switch_list').append(html);
        });

        if (isEditLongPress) {
            var udn = editDeviceID;
            $('#light_switch_list').find($("li[id='"+udn+"'] .radioBtn")).addClass("selected");
        } else {
            $('#light_switch_list li .radioBtn').first().addClass("selected");
            var udn = $('#light_switch_list li .radioBtn').first().parent().attr("id");
        }

        long_press_rule.ruleObj.LightSwitch[udn] = lsDevicesObj[udn];

        if (lsDevicesObj[udn] && lsDevicesObj[udn].name) {
            long_press_rule.ruleObj.RuleName = lsDevicesObj[udn].name + " " + sessionStore.LONG_PRESS_RULE;
        }
    },

    buildSelectableDevicesList: function() {
        wemoUtil.infoLog(TAG, "Build selectable device list");

        var devices = [];
        if (isRemoteEnabled) {
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DIMMER_DATA).concat(devices);
            devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA).concat(devices);
        } else {
            devices = wemoUtil.getDevices(actions.SELECT_SWITCHES);
            devices = wemoUtil.getDevices(actions.SELECT_DIMMERS).concat(devices);
            devices = wemoUtil.getDevices(actions.SELECT_INSIGHTS).concat(devices);
        }

        if (devices && devices.length > 0) {
            $.each(devices, function(index) {
                var deviceIcon;
                if (SFW_DEVICE_LIST[devices[index].udn].icon && SFW_DEVICE_LIST[devices[index].udn].icon !== "") {
                    deviceIcon = SFW_DEVICE_LIST[devices[index].udn].icon;
                } else {
                    if (devices[index].udn.match(/socket/gi)) {
                        deviceIcon = "../img/new_icons/WeMo_Switch_Old_@3x.png";
                    } else if (devices[index].udn.match(/insight/gi)) {
                        deviceIcon = "../img/new_icons/WeMo_Insight_Switch_@3x.png";
                    } else if (devices[index].udn.match(/lightswitch/gi)) {
                        deviceIcon = "../img/new_icons/WeMo_LightSwitch_@3x.png";
                    } else if (devices[index].udn.match(/dimmer/gi)) {
                        deviceIcon = "../img/new_icons/WeMo_Dimmer_@3x.png";
                    }
                }

                long_press_rule.deviceList[devices[index].udn] = {
                    name: devices[index].friendlyName,
                    iconURL: deviceIcon
                };

            });
        }

        if (isEditLongPress) {
            for (var i=0; i < editRuleObj.SelectedDevices.length; i++) {
                var udn = editRuleObj.SelectedDevices[i];
                if (!long_press_rule.deviceList[udn]) {
                     if (udn.match(/socket/gi)) {
                        deviceIcon = "../img/new_icons/WeMo_Switch_Old_@3x.png";
                        defaultName = wemo.items['DefaultName_WeMoSwitch'];
                    } else if (udn.match(/insight/gi)) {
                        deviceIcon = "../img/new_icons/WeMo_Insight_Switch_@3x.png";
                        defaultName = wemo.items['DefaultName_WeMoInsight'];
                    } else if (udn.match(/lightswitch/gi)) {
                        deviceIcon = "../img/new_icons/WeMo_LightSwitch_@3x.png";
                        defaultName = wemo.items['DefaultName_WeMoLightSwitch'];
                    } else if (udn.match(/dimmer/gi)) {
                        deviceIcon = "../img/new_icons/WeMo_Dimmer_@3x.png";
                        defaultName = wemo.items['DefaultName_WeMoDimmerShort'];
                    }

                   long_press_rule.deviceList[udn] = {
                       name: defaultName + " - " + wemo.items['NotFound'],
                       iconURL: deviceIcon
                   };
                }
            }
        }


        long_press_rule.renderDeviceList(long_press_rule.deviceList);

        $('#selectable_devices li').click(function(e){
           $(this).find(".multiChoiceBtn").toggleClass("selected");
           var udn = $(this).attr("id");
           if ($(this).find(".multiChoiceBtn").hasClass("selected")) {
                long_press_rule.ruleObj.Devices[udn] = long_press_rule.deviceList[udn];
           } else {
                delete long_press_rule.ruleObj.Devices[udn];
           }

           if (Object.keys(long_press_rule.ruleObj.Devices).length === 0) {
                $("#long_press_rule_save_btn").addClass("disabled");
           }else {
                $("#long_press_rule_save_btn").removeClass("disabled");
           }
        });
    },

    renderDeviceList: function(deviceList) {
        $.each(deviceList, function(index) {
            var html = '<li id='+ index +'><span class="deviceIcon" style="background-image: url('+deviceList[index].iconURL +');"></span>' +
                            '<span class="deviceName">'+ deviceList[index].name +'</span>' +
                            '<span class="multiChoiceBtn"></span></li>';

            $('#selectable_devices').append(html);

            if (!isEditLongPress) {
                long_press_rule.ruleObj.Devices[index] = deviceList[index];
                $('#selectable_devices').find($("li[id='"+index+"'] .multiChoiceBtn")).addClass("selected");
            }
        });

        if (isEditLongPress) {
            for (var i=0;  i < editRuleObj.SelectedDevices.length; i++) {
                var udn = editRuleObj.SelectedDevices[i];
                $('#selectable_devices').find($("li[id='"+udn+"'] .multiChoiceBtn")).addClass("selected");
                long_press_rule.ruleObj.Devices[udn] = deviceList[udn];
            }
        }
    },

    renderRuleModeSelection: function() {
        if (isEditLongPress) {
            wemoUtil.infoLog(TAG, 'long press rule startAction :: ' + editRuleObj.StartAction);

            var startAction = parseInt(editRuleObj.StartAction);

            $('#rules_options li .radioBtn').removeClass("selected");
            $('#rules_options li .radioBtn[data-startAction="'+ startAction +'"]').addClass("selected");
            long_press_rule.ruleObj.StartAction = startAction;

            if ((Object.keys(long_press_rule.deviceList).length === 1) && (Object.keys(long_press_rule.lsDevicesObj).length === 1)) {
                $("#rules_options li").addClass("notClickable");
                $("#rules_options li.awayRule").removeClass("notClickable");
            }
        } else {
            if ((Object.keys(long_press_rule.deviceList).length === 1) && (Object.keys(long_press_rule.lsDevicesObj).length === 1)) {
                long_press_rule.ruleObj.StartAction = 3;
                $("#rules_options li").addClass("notClickable");
                $("#rules_options li.awayRule").removeClass("notClickable");
                $("#rules_options .radioBtn").removeClass("selected");
                $("#rules_options .awayRule .radioBtn").addClass("selected");
            } else {
                long_press_rule.ruleObj.StartAction = 2;
            }
        }

        $('#rules_options li').click(function(e){
           $('#rules_options li .radioBtn').removeClass("selected");
           $(this).find(".radioBtn").addClass("selected");
           long_press_rule.ruleObj.StartAction =  $(this).find(".radioBtn").attr("data-startAction");
        });
    },

    methodMain: function() {

        console.log(TAG + "onDeviceReady");

        long_press_rule.bindEvents();

        long_press_rule.ruleObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);

        long_press_rule.buildLightSwitchList();
        long_press_rule.buildSelectableDevicesList();
        long_press_rule.renderRuleModeSelection();

        long_press_rule.controlPopups();

       if (Object.keys(long_press_rule.ruleObj.Devices).length === 0) {
            $("#long_press_rule_save_btn").addClass("disabled");
       } else {
            $("#long_press_rule_save_btn").removeClass("disabled");
       }

        //long_press_rule Click on the Save Button
        $("#long_press_rule_save_btn").on('tap', function(e) {
            long_press_rule.ruleObj.triggerDevice = [];
            long_press_rule.ruleObj.targetDevices = [];

            if (isEditLongPress) {
                ruleState = editRuleObj.State;
            } else {
                ruleState = "1";
            }

            if (!long_press_rule.ruleObj.RuleName) {
                long_press_rule.ruleObj.RuleName = sessionStore.LONG_PRESS_RULE;
            }

             $.each(long_press_rule.ruleObj.LightSwitch,function(key, val) {
                var lsObj = {
                    "UDN": key,
                    "START_ACTION": long_press_rule.ruleObj.StartAction
                };
                long_press_rule.ruleObj.triggerDevice.push(lsObj);
             });


             var deviceIndex = 0;
             $.each(long_press_rule.ruleObj.Devices,function(key, val) {
                var deviceInfo = {
                    "DEVICE_ID": key,
                    "DEVICE_INDEX": deviceIndex
                };
                long_press_rule.ruleObj.targetDevices.push(deviceInfo);
                deviceIndex++;
              });

            window.sessionStorage.removeItem(sessionStore.isEdit);


            if ((long_press_rule.ruleObj.targetDevices.length === 1) && (long_press_rule.ruleObj.triggerDevice[0].UDN === long_press_rule.ruleObj.targetDevices[0].DEVICE_ID) && (parseInt(long_press_rule.ruleObj.StartAction) !== 3)){
                  $("#dimmer_as_only_device" ).popup("open");
            } else {
                 nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", wemo.items['RULE_STATUS_SENDING_DB']]);
                if (!isEditLongPress) {
                    var obj = {
                        "DB_RULE_TYPE":"Long Press",
                        "STATE": 1,
                        "DISPLAY_NAME": long_press_rule.ruleObj.RuleName,
                        "DAY_ID_ARR":[-1],
                        "WIFI_DEV_ARR": long_press_rule.ruleObj.triggerDevice,
                        "TARGET_DEV_ARR": long_press_rule.ruleObj.targetDevices,
                        "RULE_TYPE":2
                    };

                    rulesPlugin.execute(
                        function(RuleID) {
                           long_press_rule.ruleObj.id =  RuleID;
                            var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
                            db.transaction(getRules, errorCB, successfullySaved);
                        },
                        long_press_rule.saveRulesFailed,
                        actions.SAVE_RULES, [obj]
                    );

                } else {
                    var obj = {
                        "DB_RULE_TYPE":"Long Press",
                        "STATE": ruleState,
                        "RULE_ID": editRuleObj.id,
                        "DISPLAY_NAME": long_press_rule.ruleObj.RuleName,
                        "DAY_ID_ARR":[-1],
                        "WIFI_DEV_ARR": long_press_rule.ruleObj.triggerDevice,
                        "TARGET_DEV_ARR": long_press_rule.ruleObj.targetDevices,
                        "RULE_TYPE":2
                    };

                    rulesPlugin.execute(
                        function() {
                            var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
                            db.transaction(getRules, errorCB, successfullySaved);
                        },
                        long_press_rule.saveRulesFailed,
                        actions.EDIT_RULES, [obj]
                    );
                }
            }

        });


        $('.long_press_rule_back_btn').on("click", function() {
            window.sessionStorage.removeItem(sessionStore.isEdit);
            if (parseInt(JSON.parse(window.sessionStorage.getItem(sessionStore.RULES_DATA)).length) > 0) {
                wemoUtil.loadUrl(filePath.ENABLED_RULES);
            } else {
                wemoUtil.loadUrl(filePath.CREATE_RULE);
            }
        });

        function successfullySaved() {
            wemoUtil.infoLog(TAG, 'Saved all the rules to Session');

            nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", wemo.items['RULE_STATUS_SENDING_DB']]);
            wemoUtil.infoLog(TAG, 'Started pushing to plugins');
            updateDeviceDrawer();

         }

        function updateDeviceDrawer() {
             var ruledata = JSON.parse(window.sessionStorage.getItem(sessionStore.RULES_DATA));

            if (isEditLongPress) {
                var information = {
                    udn : Object.keys(long_press_rule.ruleObj.LightSwitch)[0],
                    ruleId : editRuleObj.id
                };

            } else {
                var information = {
                    udn : Object.keys(long_press_rule.ruleObj.LightSwitch)[0],
                    ruleId : long_press_rule.ruleObj.id
                };
            }

            cordova.exec(null, null, plugins.SMART_DEVICE_PLUGIN,
                         actions.REFRESH_LONG_PRESS_RULE_DETAILS, [information]);

            nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);


                wemoUtil.infoLog(wemoUtil.TAG, "PUSH DB Success. Rules Data" + ruledata);
                if (ruledata && (ruledata.length === 0)) {
                    wemoUtil.loadUrl(filePath.CREATE_RULE);
                } else {
                    wemoUtil.loadUrl(filePath.ENABLED_RULES);
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

       function errorCB(err) {
            wemoUtil.infoLog(TAG, "Error inserting rule: " + JSON.stringify(err));
        }

        function successCB() {
            wemoUtil.infoLog(TAG, 'Successfully updated DB');
        }

        //close popups

        //FW Compatibility based upgrade
         $("#fw_outdated_cancel_btn").on("click", function(){
             $("#fw_outdated" ).popup( "close" );
         });

         $("#fw_outdated_ok_btn").on("click", function(){
             wemoUtil.loadUrl(filePath.MORE_NEW_FIRMWARE);
         });

          $("#rule_conflict_ok_btn").on("click", function(){
              $("#rule_conflict" ).popup( "close" );
              long_press_rule.hideConflictDevice();
          });

          $("#rule_can_not_save_ok_btn").on("click", function(){
               $("#rule_can_not_save" ).popup( "close" );
          });

          $("#dimmer_as_only_device_ok_btn").on("click", function(){
                $("#dimmer_as_only_device" ).popup( "close" );
          });
    },
    hideConflictDevice: function() {
        if (Object.keys(long_press_rule.lsDevicesObj).length === 1) {
            wemoUtil.loadUrl(filePath.ENABLED_RULES);
        } else if(Object.keys(long_press_rule.lsDevicesObj).length > 1) {
          var udn =  long_press_rule.ruleObj.triggerDevice[0].UDN;
          $("#light_switch_list").find("li[id='" + udn+ "']").remove();
          $("#light_switch_list li").first().find(".radioBtn").addClass("selected");
          long_press_rule.ruleObj.triggerDevice[0].UDN = $("#light_switch_list li").first().attr("id");
        }
    },
    saveRulesFailed: function(err) {
        nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
        if (err) {
            if (err.ERROR_CODE === 900) {
                //Conflict with Existing Rule
                $("#rule_conflict").popup("open");

            } else if (err.ERROR_CODE === -402) {
                //Rule Cannot Be Enabled/Disabled/Deleted/Saved
                $("#rule_can_not_save").popup("open");

            } else if (err.ERROR_CODE === 901) {
                //Outdated FW
                $("#fw_outdated").popup("open");
            }
        }
    },

    bindEvents: function() {
        wemoUtil.infoLog(TAG, "bindEvents");
        document.addEventListener('online', long_press_rule.onOnline, false);
        document.addEventListener('offline', long_press_rule.onOffline, false);
        document.addEventListener("backbutton", long_press_rule.onBackPress, false);
        document.addEventListener("pause", long_press_rule.onPause, false);
        document.addEventListener("resume", long_press_rule.onResume, false);
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
    },

    controlPopups: function() {
        //Rules Can not be saved Popup
        $("#rule_can_not_save_ok").on("tap", function() {
            $("#rule_can_not_save").popup("close");
        });

    }


};
