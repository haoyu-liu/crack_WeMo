/*
 reset_device.js

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

var TAG = "reset_device.js: ";
var pluginIDToDelete = '';
var ruleIDToDelet = '';
var deletRuleFromBothTables = '';
var deletRuleFromBothTablesForMaker = '';
var needToDisableRules = '';
var failureCallbackGB;
var successCallbackGB;
var isEraseAllContentClicked = false;

var push_DB_Callback = {
    successCB: function(){
        wemoUtil.infoLog(TAG, "push DB success Callback. success in storing rules.!" );
    },
    errorCB: function(err){
        wemoUtil.infoLog(TAG, "push DB error Callback. Error in storing rules.!!!!   " + err);
        resetDevice.loadDeviceListPage();
    }
}

$(document).bind('pageinit', function () {
    var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));

    resetDevice.initialize();
});

var resetDevice = {

    TAG: 'reset_device.js',

    initialize: function () {
        wemoUtil.infoLog(resetDevice.TAG, "initialize");
        $(".reset_remote_disabled").hide();
        $(".reset_usage").hide();
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    onDeviceReady: function () {
        $.getScript('../../../android_asset/www/js/classes/deviceObject.js', function() {
            resetDevice.mainMethod();
        });
    },

    mainMethod: function(){
        wemoUtil.infoLog(resetDevice.TAG, "onDeviceReady");
        resetDevice.bindEvents();
        wemoUtil.storeRemoteValue();
        //All initialization script goes here
      var  firmwareVersion = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_FIRMWARE);

       	var firmWareNumber = firmwareVersion.split(".");
  	wemoUtil.infoLog(resetDevice.TAG, "Firmwarre "+firmWareNumber[2]); 
        wemoUtil.infoLog(resetDevice.TAG, window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN));


        //To return back to home page: device list tab
        $(".wemo_logo").on("tap", function (e) {
            if (e.target.nodeName != "IMG") {
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }
        });

        //Clear Usage Popup Open
        $("#clear_usage_button").on("click", function () {
            $("#clear_usage").popup("open");
        });

        var devType = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_TYPE);
        wemoUtil.infoLog(resetDevice.TAG, devType);

        //Show usage statistics reset for Insight
        if (devType == wemoInsight.TYPE || devType == wemoInsight.REMOTE_TYPE) {
            $('.reset_usage').show();
        }
        else {
            $('.reset_usage').hide();
        }

        //Save Button on Click Clear Usage Save - Gray Button
        $("#clear_usage_save_btn").on("click", function () {
            $("#clear_usage").popup("close");
            nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
            setTimeout(function () {
                if (isRemoteEnabled) {
                    var mac = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_MAC);
                    var pluginid = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_PLUGIN_ID);
                    var deviceType = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_TYPE);
                    var xmlRequestString = resetDevice.buildXMLRequest(buildXML.CLEAR_USAGE_DATA, pluginid, mac, null, deviceType);

                    cordova.exec(
                        function (params) {
                            wemoUtil.infoLog(resetDevice.TAG, "success call back");
                            var authCode = params[0];
                            wemoUtil.infoLog(resetDevice.TAG, "authCode" + authCode);
                            $.ajax({
                                url: cloudAPI.DEVICE_MESSAGE,
                                type: "POST",
                                data: xmlRequestString,
                                beforeSend: function (xhr) {
                                    xhr.setRequestHeader('Content-Type', 'application/xml');
                                    xhr.setRequestHeader('Authorization', authCode);
                                },
                                error: function (xhr, textstatus) {
                                    nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                    wemoUtil.infoLog(resetDevice.TAG, "Clear usage data Remote Mode - failed: status  "+xhr.status + "staus Text ::" + xhr.statusText);
                                },
                                success: function (data) {
                                    wemoUtil.infoLog(resetDevice.TAG, "Clear usage data response cloud...");
                                    var responseXML = (new XMLSerializer()).serializeToString(data);
                                    wemoUtil.log(resetDevice.TAG, 'Clear usage data status: ' + responseXML);
                                    nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                    wemoUtil.loadUrl(filePath.DEVICE_LIST);
                                }
                            });
                        },
                        function (err) {
                            wemoUtil.infoLog(resetDevice.TAG, "failure call back");
                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                        }, "WebServicePlugin", "getAuthCode", []
                    );
                }
                else {
                    devicePlugin.execute(
                        function (status) {
                            wemoUtil.infoLog(resetDevice.TAG, "Clear Usage success callback: " + status);
                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                            if (status == true) {
                                wemoUtil.loadUrl(filePath.DEVICE_LIST);
                            } else {
                            	wemoUtil.infoLog(resetDevice.TAG, "Clear usage data Local Mode - failed: status" + status);
                            }
                        },
                        resetDevice.reportError,
                        actions.CLEAR_USAGE_DATA,
                        [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN)]
                    );
                }
            }, timeout.LONG);
        });

        //Cancel Button on click Clear Name Icon Rules Popup Close
        $("#clear_usage_cancel_btn").on("click", function () {
            $("#clear_usage").popup('close');
        });

        //Clear Name Icon Rules Popup Open
        $("#clear_name_icon_button").on("click", function () {
            wemoUtil.infoLog(resetDevice.TAG, "Clear Name Icon Button [Reset Name Icon and Rules] - clicked first button");
            $("#clear_name_icon_rules").popup("open");
        });

        
        //Save Button on Click Clear Name Icon Rules Save - Gray Button
        $("#clear_name_icon_rules_save_btn").on("click", function () {
            $("#clear_name_icon_rules").popup("close");
            
            nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
            setTimeout(function () {
                if (isRemoteEnabled) {
                	window.sessionStorage.setItem("DeviceList","1");
                    var appliance = new Appliance();
                    var udn = appliance.getUDN();
                    var friendlyName = appliance.getDefaultFriendlyName();
                    var mac = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_MAC);
                    var pluginid = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_PLUGIN_ID);
                    var deviceType = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_TYPE);
                    var icon = wemoUtil.getDefaultIconPathRemote(deviceType);
                    var customFriendlyName = {};
                    var xmlRequestResetName = resetDevice.buildXMLRequest(buildXML.CHANGE_FRIENDLY_NAME, pluginid, mac, friendlyName,deviceType);
                    var xmlRequestString = resetDevice.buildXMLRequest(buildXML.CLEAR_NAME_ICONS_RULES, pluginid, mac, null,deviceType);

                    customFriendlyName[udn] = friendlyName;
                    window.sessionStorage.setItem("JardenUdnList",JSON.stringify(customFriendlyName));
                    wemoUtil.infoLog(resetDevice.TAG, 'Clear Name Icon Rules Remote Mode - '+xmlRequestString);
                    
                   //Reset Icon-Rules-Name - Generic method
                    deviceTabPlugin.execute(
                    		function() {
                    			cordova.exec(
                                        function (params) {
                                            wemoUtil.infoLog(resetDevice.TAG, "success call back");
                                            var authCode = params[0];
                                            wemoUtil.infoLog(resetDevice.TAG, "authCode" + authCode);
                                            $.ajax({
                                                url: cloudAPI.INSIGHT_PARAMS,

                                                type: "POST",
                                                data: xmlRequestString,
                                                beforeSend: function (xhr) {
                                                    xhr.setRequestHeader('Content-Type', 'application/xml');

                                                    xhr.setRequestHeader('Authorization', authCode);
                                                },
                                                error: function (error) {
                                                    nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                                    wemoUtil.infoLog(resetDevice.TAG, 'Clear Name Icon Rules Remote Mode - failed:  '+error);
                                                    wemoUtil.infoLog(resetDevice.TAG, 'Clear Name Icon Rules Remote Mode - failed: status  '+error.status);
                                                    wemoUtil.infoLog(resetDevice.TAG, 'Clear Name Icon Rules Remote Mode - failed: Text '+error.statusText);
                                                },
                                                success: function (data) {
                	                                wemoUtil.infoLog(resetDevice.TAG, "Clear name, icon, rules data response cloud...");
                	                                var responseXML = (new XMLSerializer()).serializeToString(data);
                	                                wemoUtil.log(resetDevice.TAG, 'Clear  name, icon, rules data status: ' + responseXML);
                	                                //Reset Name - Generic method
                	                                cordova.exec(
                	                                        function(params) {
                	                                            wemoUtil.infoLog(resetDevice.TAG, "success call back");
                	                                            var authCode = params[0];
                	                                            wemoUtil.infoLog(resetDevice.TAG, "authCode" + authCode);
                	                                            $.ajax({
                	                                                url: cloudAPI.DEVICE_MESSAGE,
                	                                                type: "POST",
                	                                                data: xmlRequestResetName,
                	                                                beforeSend: function(xhr) {
                	                                                    xhr.setRequestHeader('Content-Type', 'application/xml');
                	                                                    xhr.setRequestHeader('Authorization', authCode);
                	                                                },
                	                                                success: function(data) {
                	                                                    wemoUtil.infoLog(resetDevice.TAG, "Sucess change friendly name response cloud....");
                	                                                    //var responseXML = (new XMLSerializer()).serializeToString(data);
                	                                                    resetDevice.clearDBRecordAndExit(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN));
                	                                                }
                	                                            });
                	                                        },
                	                                        function(err) {
                	                                            wemoUtil.infoLog(resetDevice.TAG, "failure call back");
                	                                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                	                                        }, "WebServicePlugin", "getAuthCode", []
                	                                );
                                                    
                                                }
                                            });
                                        },
                                        function (err) {
                                            wemoUtil.infoLog(resetDevice.TAG, "failure call back");
                                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                        }, "WebServicePlugin", "getAuthCode", []
                                    );
                    		},
                    		function(err) {
                				wemoUtil.infoLog(resetDevice.TAG, err);
                    		},
                    		actions.UPLOAD_ICON_TO_CLOUD, 
                    		[icon, mac]
                    );                
                    
                }
                else {
                	
                	//Fetch rules to sync all DBs is handled for Local Model
                    //Remote flow is not required to be handled as this use-case is valid only for Local Mode
                	devicePlugin.execute(
                            function (status) {
                            	
                            	//Get default name to set after reset rules action.
                                var appliance = new Appliance();
                                var udn = appliance.getUDN();
                            	var friendlyn = appliance.getDefaultFriendlyName(),
                                    iconPath = appliance.getDefaultIcon();
                            	
                                devicePlugin.execute(
                                    function (status) {
                                        wemoUtil.infoLog(resetDevice.TAG, "Reset Name Icon Rules success callback: " + status);
                                        if (status == true) {
                                            resetDevice.clearDBRecordAndExit(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN));
                                        } else {
                                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                            wemoUtil.infoLog(resetDevice.TAG, "Reset Name Icon Rules Local Mode :: Failed.");
                                        }
                                    },
                                    resetDevice.reportError,
                                    actions.CLEAR_NAME_ICON_RULE,
                                    [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN)]
                                );
                                //Set default name
                                if(friendlyn !== ''){
                                	devicePlugin.execute(
                                            function(status) {
                                                wemoUtil.infoLog(resetDevice.TAG, 'friendly name success callback: ' + status);
                                            },
                                            resetDevice.reportError,
                                            actions.DEVICE_TAB_SET_FRIENDLY_NAME, [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN), friendlyn]
                                        );
                                	// Set Default Icon
                                	devicePlugin.execute(
            	                            function(status) {
            	                                wemoUtil.infoLog(resetDevice.TAG, 'Reset icon success callback: ' + status);
            	                            },
            	                            resetDevice.reportError,
            	                            actions.DEVICE_TAB_SET_DEVICE_IMAGE, [iconPath,window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN)]
            	                    );
                                }
                            	
                            },
                            resetDevice.reportError,
                            actions.READ_DB_FROM_PLUGIN,
                            []
                        );
                	
                }
            }, timeout.LONG);
        });

        //Cancel Button on click Clear Name Icon Rules Popup Close
        $("#clear_name_icon_rules_cancel_btn").on("click", function () {
            $("#clear_name_icon_rules").popup('close');
        });

        if (isRemoteEnabled) {
            $(".reset_remote_disabled").hide();
        }
        else {
            $(".reset_remote_disabled").show();

            if(firmWareNumber[2] == 2176 || firmWareNumber[2] == 2725)
            	{
            	 $("#clear_wifi_button").hide();
            	}
            else
            	{
            	 $("#clear_wifi_button").show();
            	}
            //Clear WiFi Settings Popup Open
            $("#clear_wifi_button").on("click", function () {
                wemoUtil.infoLog(resetDevice.TAG, "Clear wifi Button [Reset Wi-Fi Settings] - clicked second button");
                $("#clear_wifi").popup("open");
            });

            //Save Button on Click Clear Usage Save - Gray Button
            $("#clear_wifi_save_btn").on("click", function () {
                $("#clear_wifi").popup("close");
                nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
                setTimeout(function () {
                    devicePlugin.execute(
                        function (status) {
                            wemoUtil.infoLog(resetDevice.TAG, "Reset WiFi Settings success callback: " + status);
                            if (status == true) {
                                resetDevice.stopControlPoint(function () {
                                isEraseAllContentClicked = true;
                                resetDevice.WifiResetPage(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN));
                                
                                    resetDevice.loadDeviceListPage(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN));
                                });
                            } else {
                                nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                wemoUtil.infoLog(resetDevice.TAG, "Reset WiFi Settings failed.");
                            }
                        },
                        resetDevice.reportError,
                        actions.RESET_WIFI_SETTINGS,
                        [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN)]
                    );
                }, timeout.LONG);
            });

            //Cancel Button on click Clear Name Icon Rules Popup Close
            $("#clear_wifi_cancel_btn").on("click", function () {
                $("#clear_wifi").popup('close');
            });

            //Reset to Factory Defaults popup Open
            $("#reset_button").on("click", function () {
                wemoUtil.infoLog(resetDevice.TAG, "Reset Button [Erase All Content and Settings] - clicked Third button");
                $("#reset_factory_defaults").popup("open");
            });

            //On click Reset Button Reset to Factory Defaults - Red Button
            $("#reset_factory_defaults_reset_btn").on("click", function () {
                $("#reset_factory_defaults").popup("close");
                window.sessionStorage.setItem("firmware_shown", '');
                
                nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
                
            	//Fetch rules to sync all DBs is handled for Local Model
                //Remote flow is not required to be handled as this use-case is valid only for Local Mode
            	devicePlugin.execute(
                        function (status) {
                            wemoUtil.infoLog(resetDevice.TAG, "Reset settings:  fetch rules success callback received.");
                                
                        	//start the reset process for the device
                            wemoUtil.infoLog(resetDevice.TAG, "Reset settings:  "+sessionStore.DEVICE_EDIT_WEMO_UDN);
                            wemoUtil.infoLog(resetDevice.TAG, "Reset settings:  "+window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN));
                            setTimeout(function () {
                                devicePlugin.execute(
                                    function (status) {
                                        wemoUtil.infoLog(resetDevice.TAG, "Reset settings:  reset factory settings success callback: " + status);
                                        if (status == true) {
                                            isEraseAllContentClicked = true;
                                            wemoUtil.infoLog(resetDevice.TAG, "isEraseAllContentClicked: set "+isEraseAllContentClicked);
                                            resetDevice.clearDBRecordAndExit(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN));
                                        } else {
                                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                            wemoUtil.infoLog(resetDevice.TAG, "Reset Failed.");
                                        }
                                    },
                                    resetDevice.reportError,
                                    actions.RESET_TO_FACTORY_DEFAULT,
                                    [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN)]
                                );
                            }, timeout.LONG);
                            	
                        },
                        resetDevice.reportError,
                        actions.READ_DB_FROM_PLUGIN,
                        []
                    );
            });

            //Cancel Button on click Reset to Factory Defaults Popup Close
            $("#reset_factory_defaults_cancel_btn").on("click", function () {
                $("#reset_factory_defaults").popup('close');
            });
        }
    },

    buildXMLRequest: function (type, pluginId, macAddress, data1, deviceType) {
        xmlString = "<plugins><plugin>" +
            "  <recipientId>" + pluginId + "</recipientId>" +
            "  <macAddress>" + macAddress + "</macAddress>" +
            "  <modelCode>" + deviceType + "</modelCode> ";


        switch (type) {
            case(buildXML.CLEAR_USAGE_DATA):
                xmlString += "<content>" +
                    "<![CDATA[<setClearDataUsage><plugin><macAddress>" + macAddress + "</macAddress></plugin></setClearDataUsage>]]>" +
                    "</content>";
                break;
                
            case (buildXML.CHANGE_FRIENDLY_NAME):
                xmlString += "  <content><![CDATA[<changeFriendlyName>" +
                    "  <plugin>" +
                    "  <pluginId>" + pluginId + "</pluginId>" +
                    "  <macAddress>" + macAddress + "</macAddress>" +
                    "  <friendlyName>" + data1 + "</friendlyName>" +
                    "  </plugin>" +
                    "</changeFriendlyName>]]></content>";
                break;

            case(buildXML.CLEAR_NAME_ICONS_RULES):
                xmlString += "<content>" +
                    "<![CDATA[<resetNameRulesData><plugin><macAddress>" + macAddress + "</macAddress><resetType>1</resetType></plugin></resetNameRulesData>]]>" +
                    "</content>";
                break;
        }

        xmlString += "</plugin></plugins>";

        return xmlString;
    },

    bindEvents: function () {
        wemoUtil.infoLog(resetDevice.TAG, "bindEvents");
        document.addEventListener('online', resetDevice.onOnline, false);
        document.addEventListener('offline', resetDevice.onOffline, false);
        document.addEventListener("backbutton", resetDevice.onBackPress, false);
        document.addEventListener("pause", resetDevice.onPause, false);
        document.addEventListener("resume", resetDevice.onResume, false);
    },

    onOffline: function () {
        wemoUtil.infoLog(resetDevice.TAG, "offLine");
    },

    onOnline: function () {
        wemoUtil.infoLog(resetDevice.TAG, "onLine");
    },

    onBackPress: function () {
        if ($(".more_tab").is(":visible")) {
            $(".more_tab").hide();
            $('body').find('.modalWindow').transition({opacity: 0}, 400, function () {
                $(this).removeClass('isOpen');
            });
        }
        else {
            wemoUtil.infoLog(resetDevice.TAG, "onBackPress");
            if (typeof (navigator.app) !== 'undefined') {
                navigator.app.backHistory();
            } else {
                window.history.back();
            }
        }
    },

    onPause: function () {
        wemoUtil.infoLog(resetDevice.TAG, "onPause");
    },

    onResume: function () {
        wemoUtil.infoLog(resetDevice.TAG, "onResume");
    },

    reportError: function (e) {
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        wemoUtil.infoLog(resetDevice.TAG, "Plugin Error!!!!   " + e);
        
        if(e === ruleErrorMsgs.ERROR_MSG_DB_NOT_IN_SYNC){
    		wemoUtil.hideModal();
    		wemoUtil.showRuleNotSavedErrorPopup();
    	}
    },

    deleteRecordsForSpecificDevice: function (udn, successCallback, failureCallback) {
        failureCallbackGB = failureCallback;
        successCallbackGB = successCallback;
        wemoUtil.infoLog(resetDevice.TAG, "deleteRecordsForSpecificDevice:  " + udn);

        var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
        var isDeletFromBothTable = false;
        var ruleID;
        db.transaction(getMax, errorInTransactionCB, transactionSuccessCB);
        function getMax(tx) {
        	if(wemoUtil.isMakerDevice(udn)){
        		tx.executeSql('SELECT A.RuleID, A.Name, A.Type,  B.DeviceID FROM RULES A INNER JOIN RULEDEVICES B ON A.RuleID = B.RuleID WHERE A.Type in (SELECT Ac.Type FROM RULES Ac INNER JOIN RULEDEVICES Bd ON Ac.RuleID = Bd.RuleID WHERE Ac.Type = "Maker Sensor Rule" and Bd.DeviceID = "' + wemoUtil.getMakerSensorUDN(udn) + '");', [], executeMakerSensorQuerySuccess, errorInSelectQueryCB);
        	}else{
                tx.executeSql('SELECT A.RuleID, A.Name, A.Type,  B.DeviceID FROM RULES A INNER JOIN RULEDEVICES B ON A.RuleID = B.RuleID WHERE A.Type in (SELECT Ac.Type FROM RULES Ac INNER JOIN RULEDEVICES Bd ON Ac.RuleID = Bd.RuleID WHERE Ac.Type = "Motion Controlled" and Bd.DeviceID = "' + udn + '");', [], executeSqlQuerySuccess, errorInSelectQueryCB);
        	}
        }

        function errorInTransactionCB() {
            wemoUtil.infoLog(resetDevice.TAG, "errorInTransactionCB - Error in query");

        }

        function transactionSuccessCB() {
            wemoUtil.infoLog(resetDevice.TAG, 'isDeletFromBothTable::  ' + isDeletFromBothTable);
            

            db.transaction(DisableRulesBasedOnSelectedPlugIn, errorInTransactionCB, function () {
            	if (deletRuleFromBothTables != '' || deletRuleFromBothTablesForMaker != '') {
            		wemoUtil.infoLog(resetDevice.TAG, "Deleting Rule From Both Tables::  " + deletRuleFromBothTables);
            		wemoUtil.infoLog(resetDevice.TAG, "Deleting Rule From Both Tables for maker devices::  " + deletRuleFromBothTablesForMaker);
            		db.transaction(deleteRecordsFromRULEDEVICESBasedOnRuleID, errorInTransactionCB, function () {
            			wemoUtil.infoLog(resetDevice.TAG, "Deleting Rule From RULEDEVICES");
            			db.transaction(deleteRecordsFromRULEDEVICES, errorInTransactionCB, function () {
            				wemoUtil.infoLog(resetDevice.TAG, "Deleting from Rules Table, if Rule is not available in RULEDEVICES Table");
            				db.transaction(deleteRecordsFromRULES, errorInTransactionCB, function () {
            					wemoUtil.infoLog(resetDevice.TAG, "Deleting from SENSORNOTIFICATION Table, if Rule is not available in RULEDEVICES Table");
            					db.transaction(deleteRecordsFromSENSORNOTIFICATION, errorInTransactionCB, function () {
            						wemoUtil.infoLog(resetDevice.TAG, "Deleting from RULESNOTIFYMESSAGE Table, if Rule is not available in RULEDEVICES Table");
            						db.transaction(deleteRecordsFromRULESNOTIFYMESSAGE, errorInTransactionCB, function () {
            							wemoUtil.infoLog(resetDevice.TAG, "Deleting rows from DEVICECOMBINATION Table, if Plug-In is not available in RULEDEVICES Table");
            							db.transaction(deleteRecordsFromDEVICECOMBINATION, errorInTransactionCB, transactionDeleteSuccessCB);
            						});
            					});
            				});
            			});
            		});
            	} else {
                    /*
                     - Delet all the records/rows where UDN is available
                     - DELETE FROM RULEDEVICES WHERE DeviceID=udn;
                     AND on success of delete query, delete the related records/rows from RULES Table.
                     - delete from RULES where RuleID not in (select RuleID from RULEDEVICES group by RuleID);
                     AND on success of delete query, delete the related records/rows from DEVICECOMBINATION Table, based on UDN.
                     - delete from DEVICECOMBINATION where DeviceID = udn;
                     */
                    wemoUtil.infoLog(resetDevice.TAG, "Deleting Rule From RULEDEVICES");
                    db.transaction(deleteRecordsFromRULEDEVICES, errorInTransactionCB, function () {
                    	wemoUtil.infoLog(resetDevice.TAG, "Deleting from Rules Table, if Rule is not available in RULEDEVICES Table");
                    	db.transaction(deleteRecordsFromRULES, errorInTransactionCB, function () {
                    		wemoUtil.infoLog(resetDevice.TAG, "Deleting from SENSORNOTIFICATION Table, if Rule is not available in RULEDEVICES Table");
                    		db.transaction(deleteRecordsFromSENSORNOTIFICATION, errorInTransactionCB, function () {
                    			wemoUtil.infoLog(resetDevice.TAG, "Deleting from RULESNOTIFYMESSAGE Table, if Rule is not available in RULEDEVICES Table");
                    			db.transaction(deleteRecordsFromRULESNOTIFYMESSAGE, errorInTransactionCB, function () {
                    				wemoUtil.infoLog(resetDevice.TAG, "Deleting rows from DEVICECOMBINATION Table, if Plug-In is not available in RULEDEVICES Table");
                    				db.transaction(deleteRecordsFromDEVICECOMBINATION, errorInTransactionCB, transactionDeleteSuccessCB);
                    			});
                    		});
                    	});
                    });
                }
                });

        }

        function transactionDeleteSuccessCB() {
            // END POINT
            wemoUtil.infoLog(resetDevice.TAG, "transactionDeleteSuccessCB");

            return successCallback();
        }

        function executeSqlQuerySuccess(tx, results) {
        	var len = results.rows.length;
        	wemoUtil.infoLog(resetDevice.TAG, "len::  " + len);

        	var prevMotionRule = '';
        	var motionRuleCounter = 0;
        	var motionRulePluginCounter = 0;
        	var arrMotionRuleObje = [];
        	var socketPlugins = '';
        	var sensorPlugins = '';
        	var makerPlugins = '';

        	pluginIDToDelete = '';
        	ruleIDToDelet = '';
        	deletRuleFromBothTables = '';


        	if (len > 0) {
        		tx.executeSql('SELECT count(DISTINCT B.DeviceID) count, B.RuleID  from RULEDEVICES B INNER JOIN RULES A ON B.RuleID = A.RuleID WHERE A.Type = "Motion Controlled"  AND B.RuleID in (select RuleID from RULEDEVICES WHERE DeviceID = "' + udn + '")'+' group by  B.RuleID;', [], function (tx, result) {
        			var length = result.rows.length;
        			wemoUtil.infoLog(resetDevice.TAG, " motion rules length::  " + length + "udn is :: " + udn);
        			for (var j= 0; j < length; j++){
        				wemoUtil.infoLog(resetDevice.TAG, "result.rows.item(" + j + ") - count:  " + result.rows.item(j).count + "  ::  RuleID: " + result.rows.item(j)['RuleID']);
        				if (result.rows.item(j).count == 2 && udn.match(/Sensor/)){
        					deletRuleFromBothTables += result.rows.item(j).RuleID + ',';
        				}
        			}
        		}, function () {
        			return failureCallback();
        		});
        	} else {
        		deletRuleFromBothTables = '';
        	}

        }
        
        function executeMakerSensorQuerySuccess(tx, results) {
            var len = results.rows.length;
            wemoUtil.infoLog(resetDevice.TAG, "executeMakerSensorQuerySuccess len::  " + len);
            var prevMotionRule = '';
            var motionRuleCounter = 0;
            var motionRulePluginCounter = 0;
            var arrMotionRuleObje = [];
            var socketPlugins = '';
            var makerPlugins = '';
            pluginIDToDelete = '';
            ruleIDToDelet = '';
            deletRuleFromBothTablesForMaker = '';
            if (len > 0) {
                for (var i = 0; i < len; i++) {
                    wemoUtil.infoLog(resetDevice.TAG, "results.rows.item(" + i + ") - Type:  " + results.rows.item(i)['Type'] + "  ::  RuleID: " + results.rows.item(i)['RuleID'] + "  ::  DeviceID:  " + results.rows.item(i)['DeviceID']);
                    if (results.rows.item(i).Type === 'Maker Sensor Rule') {
                        wemoUtil.infoLog(resetDevice.TAG, "[" + i + "] Rule ID [" + results.rows.item(i).RuleID + "]----" + results.rows.item(i).DeviceID);
                        if (prevMotionRule != results.rows.item(i).RuleID) {
                            wemoUtil.infoLog(resetDevice.TAG, "New Rule!");
                            wemoUtil.infoLog(resetDevice.TAG, prevMotionRule + "  ::  " + socketPlugins + "  ::  " + makerPlugins);
                            arrMotionRuleObje[motionRuleCounter] = {'RuleID': prevMotionRule, 'Makers': makerPlugins, 'Socket': socketPlugins};
                            prevMotionRule = results.rows.item(i).RuleID;
                            if (i != 0) {
                                socketPlugins = '';
                                makerPlugins = '';
                            }
                            motionRuleCounter++;
                        }
                        if (i == len) {
                            wemoUtil.infoLog(resetDevice.TAG, "New Rule!");
                            wemoUtil.infoLog(resetDevice.TAG, prevMotionRule + "  ::  " + socketPlugins + "  ::  " + makerPlugins);
                            arrMotionRuleObje[motionRuleCounter] = {'RuleID': prevMotionRule, 'Makers': makerPlugins, 'Socket': socketPlugins};
                            prevMotionRule = results.rows.item(i).RuleID;
                        }
                        plugin = results.rows.item(i).DeviceID;
                        if (plugin.match(/Socket/)) {
                            //var socketIsThereInList = new RegExp(results.rows.item(i).DeviceID, 'g');
                            //if(!socketPlugins.match(socketIsThereInList)){
                            socketPlugins += results.rows.item(i).DeviceID + ",";
                            //}
                            wemoUtil.infoLog(resetDevice.TAG, "____________1______1_______" + i);
                        } else if (plugin.match(/Maker/)) {
                        	var deviceID = results.rows.item(i).DeviceID;
                        	var ar = deviceID.split(":");
                        	if(ar[2] == "sensor"){
                        		makerPlugins += results.rows.item(i).DeviceID + ",";
                        	}
                        	else{
                        		socketPlugins += results.rows.item(i).DeviceID + ",";
                        	}
                            wemoUtil.infoLog(resetDevice.TAG, "____________1______2_______" + i);
                        }
                    }
                }
                if (socketPlugins != '' || makerPlugins != '') {
                    wemoUtil.infoLog(resetDevice.TAG, "New Rule!");
                    wemoUtil.infoLog(resetDevice.TAG, prevMotionRule + "  ::  " + socketPlugins + "  ::  " + makerPlugins);
                    arrMotionRuleObje[motionRuleCounter] = {'RuleID': prevMotionRule, 'Makers': makerPlugins, 'Socket': socketPlugins};
                    prevMotionRule = results.rows.item(motionRuleCounter).RuleID;
                    socketPlugins = '';
                    makerPlugins = '';
                    motionRuleCounter = '';
                }
                if (arrMotionRuleObje.length > 0) {
                    for (var k = 0; k < arrMotionRuleObje.length; k++) {
                        wemoUtil.infoLog(resetDevice.TAG, "c" + k + "]:  " + arrMotionRuleObje[k]);
                        arrMotionRuleObje[k].Socket = arrMotionRuleObje[k].Socket.substr(0, (arrMotionRuleObje[k].Socket.length - 1));
                        arrMotionRuleObje[k].Makers = arrMotionRuleObje[k].Makers.substr(0, (arrMotionRuleObje[k].Makers.length - 1));
                        wemoUtil.infoLog(resetDevice.TAG, "Motion Rule - RuleID:  " + arrMotionRuleObje[k].RuleID);
                        wemoUtil.infoLog(resetDevice.TAG, "Motion Rule - Socket:  " + arrMotionRuleObje[k].Socket);
                        wemoUtil.infoLog(resetDevice.TAG, "Motion Rule - Makers:  " + arrMotionRuleObje[k].Makers);
                        if (udn.match(/Maker/)) {
                            wemoUtil.infoLog(resetDevice.TAG, "Selected Plug-In is - :----------Sensor---------" + arrMotionRuleObje.length);
                            if (arrMotionRuleObje[k].Makers != '') {
                                var sensorsInRull = arrMotionRuleObje[k].Makers.split(',');
                                wemoUtil.infoLog(resetDevice.TAG, "sensors In RullID[" + arrMotionRuleObje[k].RuleID + "]:  " + sensorsInRull.length + "  ::  " + sensorsInRull);
                                if (sensorsInRull.length == 1) {
                                    wemoUtil.infoLog(resetDevice.TAG, "NEED TO DELETE RULE ID FROM BOTH THE TABLES [" + arrMotionRuleObje[k].RuleID + "]");
                                    deletRuleFromBothTablesForMaker += arrMotionRuleObje[k].RuleID + ',';
                                } else if (sensorsInRull.length > 1) {
                                    var isOnlyOneSensor = false;
                                    var isOnlyOneSocket = false;
                                    var rgUDN = new RegExp(wemoUtil.getMakerSensorUDN(udn), 'g');
                                    var numOfSameSensorsInString = arrMotionRuleObje[k].Makers.match(rgUDN);
                                    wemoUtil.infoLog(resetDevice.TAG, "****numOfSameSensorsInString:  " + numOfSameSensorsInString.length + "  ::  " + numOfSameSensorsInString);
                                    if (sensorsInRull.length == numOfSameSensorsInString.length) {
                                        wemoUtil.infoLog(resetDevice.TAG, "SEEMS, NEED TO DELETE RULE ID FROM BOTH THE TABLES [" + arrMotionRuleObje[k].RuleID + "]");
                                        deletRuleFromBothTablesForMaker += arrMotionRuleObje[k].RuleID + ',';
                                    }
                                }
                            }
                        }
                        wemoUtil.infoLog(resetDevice.TAG, "----------------------------------------------------------------");
                    }
                    deletRuleFromBothTablesForMaker = deletRuleFromBothTablesForMaker.substr(0, (deletRuleFromBothTablesForMaker.length - 1));
                    wemoUtil.infoLog(resetDevice.TAG, "Motion Rule - :-------------------" + arrMotionRuleObje.length);
                    wemoUtil.infoLog(resetDevice.TAG, "GOING TO DELET THESE RULES [" + deletRuleFromBothTablesForMaker + "] DATA FROM BOTH TABLES!");
                }
            } else {
                /*
                 - Delet all the records/rows where UDN is available
                 - DELETE FROM RULEDEVICES WHERE DeviceID=udn;
                 AND on success of delete query, delete the related records/rows from RULES Table.
                 - delete from RULES where RuleID not in (select RuleID from RULEDEVICES group by RuleID);
                 AND on success of delete query, delete the related records/rows from DEVICECOMBINATION Table, based on UDN.
                 - delete from DEVICECOMBINATION where DeviceID = udn;
                 */
            	deletRuleFromBothTablesForMaker = '';
                //alert("Plug-In is not used in Motion Controlled Rules - So, Delete Plug-In from RULEDEVICES, RULES, DEVICECOMBINATION");
            }
            //-------------- Before Soft Reset, updating Schedule String for the Rules related to UDN which has selected START-------------
            
            tx.executeSql('SELECT A.RuleID, A.Name, A.Type,  B.DeviceID FROM RULES A INNER JOIN RULEDEVICES B ON A.RuleID = B.RuleID WHERE A.Type in (SELECT Ac.Type FROM RULES Ac INNER JOIN RULEDEVICES Bd ON Ac.RuleID = Bd.RuleID WHERE Ac.Type = "Motion Controlled" and Bd.DeviceID = "' + wemoUtil.getOriginalMakerUDN(udn) + '");', [], executeSqlQuerySuccess, errorInSelectQueryCB);
            
        }

        function errorInSelectQueryCB() {
            wemoUtil.infoLog(resetDevice.TAG, "errorInSelectQueryCB - Error in query");
        }

        function DisableRulesBasedOnSelectedPlugIn(tx) {
            wemoUtil.infoLog(resetDevice.TAG, 'UPDATE RULES SET State="0" WHERE RuleID in (' + needToDisableRules + ')');
            //tx.executeSql('UPDATE RULES SET State="0" WHERE RuleID in (' + needToDisableRules + ')', [], executeSqlDeleteQuerySuccess, errorInDeleteQueryCB);
        }

       

        function rollBackDisableRulesBasedOnSelectedPlugIn(tx, err) {
            var rollBackDB = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
            rollBackDB.transaction(function (tx) {
                wemoUtil.infoLog(resetDevice.TAG, "rollBackDisableRulesBasedOnSelectedPlugIn:  " + needToDisableRules);
                tx.executeSql('UPDATE RULES SET State="1" WHERE RuleID in (' + needToDisableRules + ')', [], function () {
                }, function () {

                });
                return failureCallback();
            }, function () {
            }, function () {
            });

        }

        function deleteRecordsFromRULEDEVICES(tx) {
            //alert("Deleting from RuleDevices Table:  "+udn);
            wemoUtil.infoLog(resetDevice.TAG, "Deleting from RuleDevices Table:  " + udn);
            if(wemoUtil.isMakerDevice(udn)){
            	tx.executeSql('DELETE FROM RULEDEVICES WHERE DeviceID="' + wemoUtil.getMakerSwithUDN(udn) + '";', [], executeSqlDeleteQuerySuccess, errorInDeleteQueryCB);
            	tx.executeSql('DELETE FROM RULEDEVICES WHERE DeviceID="' + wemoUtil.getMakerSensorUDN(udn) + '";', [], executeSqlDeleteQuerySuccess, errorInDeleteQueryCB);
            	tx.executeSql('DELETE FROM RULEDEVICES WHERE DeviceID="' + wemoUtil.getOriginalMakerUDN(udn) + '";', [], executeSqlDeleteQuerySuccess, errorInDeleteQueryCB);
            }
            else{
            tx.executeSql('DELETE FROM RULEDEVICES WHERE DeviceID="' + udn + '";', [], executeSqlDeleteQuerySuccess, errorInDeleteQueryCB);
            }
        }

        function deleteRecordsFromRULEDEVICESBasedOnRuleID(tx) {
        	wemoUtil.infoLog(resetDevice.TAG, "Deleting from RULES AND RULEDEVICES Tables:  " + deletRuleFromBothTables);
        	wemoUtil.infoLog(resetDevice.TAG, "Deleting from RULES AND RULEDEVICES Tables for maker:  " + deletRuleFromBothTablesForMaker);
        	//tx.executeSql('delete from RULEDEVICES where RuleID in ('+deletRuleFromBothTables+');',[], executeSqlDeleteQuerySuccess, errorInDeleteQueryCB);
        	var arrRuleID = '';
        	if(deletRuleFromBothTables != ''){
        		arrRuleID = deletRuleFromBothTables.split(',');
        		if(deletRuleFromBothTablesForMaker != ''){
        			var arrMakerSpecificRuleId = deletRuleFromBothTablesForMaker.split(',');
        			arrRuleID = arrRuleID.concat(arrMakerSpecificRuleId);
        		}
        	} else if(deletRuleFromBothTablesForMaker != ''){ 
        		arrRuleID = deletRuleFromBothTablesForMaker.split(',');
        	}
        	
        	wemoUtil.infoLog(resetDevice.TAG, "arrRuleID:  " + arrRuleID.length + "  ::  " + arrRuleID);        	
        	for (var i = 0; i < arrRuleID.length; i++) {
        		wemoUtil.infoLog(resetDevice.TAG, "Deleting:  " + arrRuleID[i]);
        		tx.executeSql('delete from RULEDEVICES where RuleID = ' + arrRuleID[i] + ';', [], executeSqlDeleteQuerySuccess, errorInDeleteQueryCB);
        	}
        }

        function deleteRecordsFromRULES(tx) {
            //alert("Deleting from Rules Table, if Rule is not available in RULEDEVICES Table");
            wemoUtil.infoLog(resetDevice.TAG, "Deleting from Rules Table, if Rule is not available in RULEDEVICES Table");
            tx.executeSql('DELETE FROM RULES WHERE RuleID NOT IN (SELECT RuleID FROM RULEDEVICES GROUP BY RuleID);', [], executeSqlDeleteQuerySuccess, errorInDeleteQueryCB);
        }

        function deleteRecordsFromDEVICECOMBINATION(tx) {
            //alert("Deleting rows from DEVICECOMBINATION Table, if Plug-In is not available in RULEDEVICES Table");
            wemoUtil.infoLog(resetDevice.TAG, "Deleting rows from DEVICECOMBINATION Table, if Plug-In is not available in RULEDEVICES Table");
            tx.executeSql('DELETE FROM DEVICECOMBINATION WHERE DeviceID NOT IN (SELECT DeviceID FROM RULEDEVICES GROUP BY DeviceID);', [], executeSqlDeleteQuerySuccess, errorInDeleteQueryCB);
        }
        
        function deleteRecordsFromRULESNOTIFYMESSAGE(tx) {
            wemoUtil.infoLog(resetDevice.TAG, "Deleting rows from RULESNOTIFYMESSAGE Table, if Rule is not available in RULEDEVICES Table");
            tx.executeSql('DELETE FROM RULESNOTIFYMESSAGE WHERE RuleID NOT IN (SELECT RuleID FROM RULEDEVICES GROUP BY RuleID);', [], executeSqlDeleteQuerySuccess, errorInDeleteQueryCB);
        }
        
        function deleteRecordsFromSENSORNOTIFICATION(tx) {
            wemoUtil.infoLog(resetDevice.TAG, "Deleting rows from SENSORNOTIFICATION Table, if Rule is not available in RULEDEVICES Table");
            tx.executeSql('DELETE FROM SENSORNOTIFICATION WHERE RuleID NOT IN (SELECT RuleID FROM RULEDEVICES GROUP BY RuleID);', [], executeSqlDeleteQuerySuccess, errorInDeleteQueryCB);
        }


        function executeSqlDeleteQuerySuccess(tx, results) {
            // this will be empty since no rows were inserted.
            //wemoUtil.infoLog(resetDevice.TAG, "Insert ID = " + results.insertId);
            // this will be 0 since it is a select statement
            //wemoUtil.infoLog(resetDevice.TAG, "Rows Affected = " + results.rowAffected);
            // the number of rows returned by the select statement
            //wemoUtil.infoLog(resetDevice.TAG, "Insert ID = " + results.rows.length);
        }

        function errorInDeleteQueryCB() {
            wemoUtil.infoLog(resetDevice.TAG, "errorInDeleteQueryCB - Error in query");
        }
    },

    clearDBRecordAndExit: function (udn) {
        wemoUtil.infoLog(resetDevice.TAG, 'CLEAR DB RECORD AND EXIT.');
        // There is a bug in Insight device. It returns old name for if it's
        // queried from the device list quickly after name/icon/rules reset.
        // Remove this timeout once the bug is fixed.
        setTimeout(
            function () {
                wemoUtil.infoLog(resetDevice.TAG, 'clearDBRecordAndExit: setTimeout');
                resetDevice.deleteRecordsForSpecificDevice(
                    udn,
                    function () {
                        wemoUtil.infoLog(resetDevice.TAG, 'clearDBRecordAndExit: success');

                        resetDevice.updateScheduleStr(function () {
                        //success removing DB entry. push DB and exit
                               
                        	window.sessionStorage.setItem("flagReset", "true");

                                if (isRemoteEnabled) {
                                    setTimeout(function () {
                                    	window.sessionStorage.removeItem("initFromResetDevice");
                                        wemoUtil.loadUrl(filePath.DEVICE_LIST);
                                    }, 5000);
                                } else {
                                    deviceTabPlugin.execute(
                                            function (deviceList) {
                                            	wemoUtil.infoLog(resetDevice.TAG, "GET_WEMO_DEVICE_LIST response: device list JSON Object: " + JSON.stringify(deviceList._deviceList));
                                                for (key in deviceList) {
                                                    if (key == udn) {
                                                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME, deviceList[key].friendlyName);
                                                        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                                        wemoUtil.infoLog(resetDevice.TAG, "isEraseAllContentClicked:: check "+isEraseAllContentClicked);
                                                        if(isEraseAllContentClicked == true){
                                                            WeMoDeviceList.removeDevice(udn);
                                                            
                                                            wemoUtil.infoLog(resetDevice.TAG, "WeMoDeviceList.removeDevice(udn) has completed.");
                                                            isEraseAllContentClicked = false;
                                                        }
                                                        setTimeout(function () {
                                                        	window.sessionStorage.removeItem("initFromResetDevice");
                                                            wemoUtil.loadUrl(filePath.DEVICE_LIST);
                                                        }, 300);
                                                    }
                                                }
                                                nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                                if(isEraseAllContentClicked == true){
                                                    WeMoDeviceList.removeDevice(udn);
                                                    isEraseAllContentClicked = false;
                                                }
                                                setTimeout(function () {
                                                	window.sessionStorage.removeItem("initFromResetDevice");
                                                    wemoUtil.loadUrl(filePath.DEVICE_LIST);
                                                }, 300);
                                            },
                                            wemoUtil.infoLog(resetDevice.TAG, "error device list"),
                                            actions.GET_WEMO_DEVICE_LIST,
                                            []
                                    );
                                }
                    });
                    },
                    function () {
                        wemoUtil.infoLog(resetDevice.TAG, 'clearDBRecordAndExit: failure');
                        //failure removing DB entry. dont push DB but exit
                        resetDevice.loadDeviceListPage();
                    }
                )
            },
            2 * timeout.ONE_SECOND
        );
    },

    updateScheduleStr: function (successCallback) {
        var sensors = [];
        var switches = [];
        var makers=[];

    	window.sessionStorage.setItem("initFromResetDevice", "YES");

    	if(isRemoteEnabled)
    	{
    		sensors = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SENSOR_DATA);
    		switches = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
            if (switches != null) switches = switches.concat(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA));
            else switches =wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA);

            wemoUtil.infoLog(resetDevice.TAG, "sensors "+ JSON.stringify(sensors));
            wemoUtil.infoLog(resetDevice.TAG, "switches "+ JSON.stringify(switches));

    		makers = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA);

    		wemoUtil.infoLog(resetDevice.TAG, 'sensors.length: '+sensors.length);
    		
    		resetDevice.pushScheduleToSwitch(switches, function(){
    				
    			resetDevice.pushScheduleToSensor(sensors, function(){
    				
    				resetDevice.pushScheduleToMaker(makers, function(){
        				
        					successCallback();
        	    		
    					}, PUSH_DB_REQUIRED);
    	    		
    				}, PUSH_DB_REQUIRED);
    		
    			}, PUSH_DB_REQUIRED);
    		
    	}


    	else{

    		wemoUtil.getDevicesWithCallback(actions.SELECT_SWITCHES, function(switches){
    			wemoUtil.infoLog(resetDevice.TAG, "switches" + switches.length);
    			
    			wemoUtil.getDevicesWithCallback(actions.SELECT_INSIGHTS, function(insights){
    				wemoUtil.infoLog(resetDevice.TAG, "insights" + insights.length);
    				if ( insights != null && insights.length > 0)
					{
						switches = switches.concat(insights);
					}

    				wemoUtil.getDevicesWithCallback(actions.SELECT_MAKER, function(makers){
    					if ( makers != null && makers.length > 0)
    					{
    						switches = switches.concat(makers);
    					}

						wemoUtil.getDevicesWithCallback(actions.SELECT_SENSORS, function(sensors){
						wemoUtil.infoLog(resetDevice.TAG, "sensor" + sensors.length);
						
						resetDevice.pushScheduleToSwitch(switches, function(){
		    				
			    			resetDevice.pushScheduleToSensor(sensors, function(){
			    				
			    					successCallback();
			    				
			    				}, PUSH_DB_REQUIRED);
			    		
			    			}, PUSH_DB_REQUIRED);
    					});
    				});
    			});
    		});
    	}
    },
    
    //Switch
    pushScheduleToSwitch : function (switches, callback, isBlocking, nonBlockingCallback) {
    	wemoUtil.infoLog(resetDevice.TAG, "Push schedule Switches - START");
    	if ( switches != null && switches.length > 0)
		{
            wemoUtil.infoLog(resetDevice.TAG, "switches != null");
            var udnArray = '';
			$.each(switches,function(inx)
					{
					udnArray = udnArray + switches[inx].udn + DELIMITER_COMMA;
				
					});
			wemoUtil.pushScheduleSwitch(udnArray, 0, switches.length, isBlocking, nonBlockingCallback, function(){
				wemoUtil.infoLog(resetDevice.TAG, "Push schedule Switches - DONE");
				if (typeof callback == TYPE_OF.FUNCTION) {
	            	//send a response back
	            	callback();
	            }
				
			});		
		}else{
			wemoUtil.infoLog(resetDevice.TAG, "switches == null");
			if (typeof callback == TYPE_OF.FUNCTION) {
            	//send a response back
            	callback();
            }
		}
    },
    
    //Maker
    pushScheduleToMaker : function (makers, callback, isBlocking, nonBlockingCallback) {
    	wemoUtil.infoLog(resetDevice.TAG, "Push schedule makers - START");
    	
    	if ( makers != null && makers.length > 0)
		{
            wemoUtil.infoLog(resetDevice.TAG, "makers != null");
            var udnArray = '';
			$.each(makers,function(inx)
					{
					udnArray = udnArray + wemoUtil.getOriginalMakerUDN(makers[inx].udn) + DELIMITER_COMMA;
					});
			
			wemoUtil.pushScheduleSwitch(udnArray, 0, makers.length, isBlocking, nonBlockingCallback, function(){
				wemoUtil.infoLog(resetDevice.TAG, "Push schedule makers - DONE");
				if (typeof callback == TYPE_OF.FUNCTION) {
	            	//send a response back
	            	callback();
	            }
			
			});	
			
		}else{
			wemoUtil.infoLog(resetDevice.TAG, "makers == null");
			if (typeof callback == TYPE_OF.FUNCTION) {
            	//send a response back
            	callback();
            }
		}
    },
    
    
    //Sensor
    pushScheduleToSensor : function (sensors, callback, isBlocking) {
    	wemoUtil.infoLog(resetDevice.TAG, "Push schedule sensor - START");
    	
    	if ( sensors != null && sensors.length > 0)
		{
            wemoUtil.infoLog(resetDevice.TAG, "sensors != null. Starting to create array of sensor UDNs.");
            var sensorsArray = '';
            for(var i=0,len=sensors.length; i<len; i++ ){
            	sensorsArray = sensorsArray + sensors[i].udn + DELIMITER_COMMA;
				wemoUtil.infoLog(resetDevice.TAG, TAG, "sensorsArray of UDNs: " + sensorsArray);
            }
            wemoUtil.pushScheduleSensor(sensorsArray , 0, sensors.length, function(){
    			wemoUtil.infoLog(resetDevice.TAG, "Push schedule sensors - DONE");
    			if (typeof callback == TYPE_OF.FUNCTION) {
                	//send a response back
                	callback();
                }
    			
    		});	
		}else{
			wemoUtil.infoLog(resetDevice.TAG, "sensors == null");
			if (typeof callback == TYPE_OF.FUNCTION) {
            	//send a response back
            	callback();
            }
		}
    },
    
    pushDB: function (successCallback) {
    	wemoUtil.infoLog(resetDevice.TAG, 'pushDB');
    	setTimeout(function () {
    		devicePlugin.execute(
    				successCallback,
    				resetDevice.reportError,
    				actions.PUSH_DB_TO_PLUGIN,
    				[]
    		);
    	}, 2 * timeout.ONE_SECOND);
    },

    stopControlPoint: function (successCallback) {

        wemoUtil.infoLog(resetDevice.TAG, 'stopControlPoint');
        devicePlugin.execute(
            successCallback,
            resetDevice.reportError,
            actions.STOP_CONTROL_POINT,
            []
        );
    },
    WifiResetPage: function (udn) {
       deviceTabPlugin.execute(
       function (deviceList) {
                  for (key in deviceList) {
                                  if (key == udn) {
      window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME, deviceList[key].friendlyName);
                                                        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                                        wemoUtil.infoLog(resetDevice.TAG, "isEraseAllContentClicked:: check "+isEraseAllContentClicked);
                                                        if(isEraseAllContentClicked == true){
                                                            WeMoDeviceList.removeDevice(udn);
                                                            isEraseAllContentClicked = false;
                                                        }
                                                        setTimeout(function () {
                                                            wemoUtil.loadUrl(filePath.DEVICE_LIST);
                                                        }, 300);
                                                    }
                                                }
                                                nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                               
                                            },
                                            wemoUtil.infoLog(resetDevice.TAG, "error device list"),
                                            actions.GET_WEMO_DEVICE_LIST,
                                            []
                                    );
                                    
    },
    
    loadDeviceListPage: function (udn) {
        wemoUtil.infoLog(resetDevice.TAG, 'loadDeviceListPage');
        window.sessionStorage.setItem("initFromResetDevice", "");
        WeMoDeviceList.removeDevice(udn);
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        setTimeout(function () {
            wemoUtil.loadUrl(filePath.DEVICE_LIST);
        }, 300);
    }
};
