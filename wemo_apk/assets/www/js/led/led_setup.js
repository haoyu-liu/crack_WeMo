/*
 led_setup.js

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
var TAG = "led_setup.js";
var cloudDeviceListAutoRefreshTimeout;
var redirectGlobalPage = "";
var scanningDevicesTimeout;
var scanningLedTimeout;
var timeoutId;
var getOpenNetworkCnt = 0;
var count = 0;
var currentTime = "";
var after2Mins = "";
var addClickevent = 0;
var scannedDevices = [];
var cancelBtn = false;
var homeSenseGrp = false;
var _ledDeviceCache = [];
var homeSenseModelcodes = [];
var ledmodelcodes = [];
var ledmanufacturercodes = [];
var countMessage = 0;
var messageInterval;
var homeSenseCapIdVal = {};

$(document).bind('pageinit', function() {
    console.log("entering in JS");
    setupBridge.initialize();
});

$(document).ready(function() {
    var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));
});

var setupBridge = {
		
	TAG : "led_setup.js",
	
    initialize: function() {
    	wemoUtil.infoLog(setupBridge.TAG, "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    onDeviceReady: function() {
    	wemoUtil.infoLog(setupBridge.TAG, "device ready");

        setupBridge.bindEvents();
        setupBridge.setMessage();
        
        var PairedDeviceList = window.sessionStorage.getItem(sessionStore.PAIRED_DEVICES);
        var twentyMinutesLater = new Date();
        currentTime = twentyMinutesLater.getTime();
        $("#leddevices").html('');
        
        $.each(homeSenseModelCodes, function(i, val) {
            homeSenseModelcodes.push(val.toLowerCase());
        });
        
        $.each(ledModelcode, function(i, val) {
        	ledmodelcodes.push(val.toLowerCase());
        });
        
        $.each(ledManufacturerName, function(i, val) {
        	ledmanufacturercodes.push(val);
        });

        if (PairedDeviceList == "alreadypaired") {
            setupBridge.registerDeviceListeners();
            setupBridge.getDeviceCount(ledDeviceConstants.LEDDEVICESTYPE);
            
            $("#setuptitle").html(wemo.items['LedSetup_Add_New_Device_Title']);
            setTimeout(function() {
                setupBridge.openNetwork();
            }, 1200);

            sharedPreferences.get(sharedPreferencesConstants.WEMO_NAMESPACE, sharedPreferencesConstants.WEMO_LED_DEVICE_CACHE, '', function(value) {
                if (value != null && value.length > 0) {
                    arrCache = JSON.parse(value);
                    _ledDeviceCache = arrCache;
                }

            });
            
        } else {
            setupBridge.registerLedSetupListeners();

            var smart = window.sessionStorage.getItem(sessionStore.SMART_SETUP);
            var smartOngoing = window.sessionStorage.getItem(sessionStore.SMART_SETUP_ONGOING);

            $("#remote_setup_failure_footer,#remote_setup_success_footer").hide();


            if (smart != "1" || smartOngoing != "1" || smart == undefined || smartOngoing == 0) {
                var remoteFlag = window.sessionStorage.getItem(sessionStore.SETUP_REMOTE_STATUS);

                if (remoteFlag != "" && remoteFlag != null && remoteFlag != undefined)
                    remoteFlag = remoteFlag.toUpperCase();

                if (remoteFlag === 'S') {
                    $("#remote_setup_success_footer").show();
                    $('#remote_status_header').html(wemo.items['EnableRemoteSuccessTitle']);
                    $('#remote_status_body').html(wemo.items['EnableRemoteSuccessContent']);
                } else {
                    $("#remote_setup_failure_footer").show();
                    $('#remote_status_header').html("Remote Access Failed");
                    $('#remote_status_body').html(wemo.items['errorRemoteAccessFailed']);
                }

                if (window.sessionStorage.getItem("show_remote_alert") == "true") {
                    setTimeout(function() {
                        $("#remote_status_popup").popup("open");
                    }, 1000);
                    window.sessionStorage.setItem("show_remote_alert", "false");
                }

                $('#remote_status_ok_btn, #remote_status_ok_btn_failure').on('click', function() {
                    $("#remote_status_popup").popup("close");
                });

                $('#remote_status_try_again_btn').on('pointerdown', function() {
                    window.sessionStorage.setItem(sessionStore.STARTUP_MODE, startupMode.RETRY_REMOTE_ENABLE);
                    wemoUtil.loadUrl(filePath.INDEX);
                });
            } else {
                setupBridge.getBridgeInfo();
            }

            setTimeout(function() {
                setupBridge.openNetwork();
            }, 1200);
        }

        $("#leddevices").on('click', ".led_option", function() {
            $(this).toggleClass('unchecked');

            var Devcount = $('ul.setup_ul li').length;
            var checkedCnt = 0;

            $('ul.setup_ul li span.led_option').each(function(i, v) {
                if ($(this).hasClass('unchecked')) {
                    checkedCnt++;
                }
            });

            if (Devcount == checkedCnt)
                $("#setup_add_btn").addClass('disabled_text');
            else
                $("#setup_add_btn").removeClass('disabled_text');

            wemoUtil.infoLog(setupBridge.TAG, "check/uncheck" + $("#leddevices").html());
            var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
            var scanDeviceid = $(this).attr('wemo-device-id');
            var scanDeviceFriendlyname = $(this).attr('wemo-device-friendlyname');
            var scanDeviceState = $(this).attr('wemo-device-state');
            var PairedDeviceList = window.sessionStorage.getItem(sessionStore.PAIRED_DEVICES);
            var state = "";
            var CurrentVal = "";

            if (scanDeviceState == 1) {
                state = 0;
                CurrentVal = AllowedVal + ":0," + state;
            } else if (scanDeviceState == 0) {
                state = 1;
                CurrentVal = AllowedVal + ":0," + state;
            } else {
                state = 0;
                CurrentVal = AllowedVal + ":0," + state;
            }


            var devlist = [scanDeviceid];
            var capabilities = ledCapabilities.DIMMING + "," + ledCapabilities.ONOFF;

            //var inputArr = [CurrentVal, "10008,10006", "NO"];
            var inputArr = [CurrentVal, capabilities, "NO"];

            wemoUtil.infoLog(setupBridge.TAG, "checked/unchecked" + scanDeviceid + "--" + scanDeviceFriendlyname + "--" + scanDeviceState + "---" + $("#leddevices").html());
            
            if (PairedDeviceList == "alreadypaired") {
                $(this).attr('wemo-device-state', state);
                devicePlugin.execute(function(responceStatus) {
                		wemoUtil.infoLog(setupBridge.TAG, "devices status responceStatus -----" + JSON.stringify(responceStatus) + "---" + responceStatus);

                    },
                    setupBridge.reportError,
                    ACTION_SET_LED_STATUS, [inputArr, devlist]
                );
            } else {
                $(this).attr('wemo-device-state', state);
                setupPlugin.execute(function(responceStatus) {
                		wemoUtil.infoLog(setupBridge.TAG, "devices status responceStatus -----" + JSON.stringify(responceStatus) + "---" + responceStatus);

                    },
                    setupBridge.reportError,
                    ACTION_SET_LED_STATUS_SETUP, [inputArr, devlist]
                );

            }


        });

        $('#scanningAgain').on('tap', function(e) {
        	setupBridge.setMessage();
        	
            addClickevent = 0;
            $("#loadingimg").attr('style', 'visibility: visible;');
            $("#loadingMsg").show();
            $("#scanningLink").hide();
            $("#unableDetect").hide();
            $("#devicenotfound").hide();
            $("#devicefound").show();
            $("#loadingimg").removeClass();
            $("#loadingimg").addClass('spinner');

            var twentyMinutesLater = new Date();
            currentTime = twentyMinutesLater.getTime();
            after2Mins = twentyMinutesLater.setMinutes(twentyMinutesLater.getMinutes() + 2);
            var PairedDeviceList = window.sessionStorage.getItem(sessionStore.PAIRED_DEVICES);

            wemoUtil.infoLog(setupBridge.TAG, "currentTime  " + currentTime + "---" + after2Mins + "--" + addClickevent + "---" + count);

            if (addClickevent == 0) {
                timeoutId = setTimeout(function() {
                    setTimeout(setupBridge.scaningDevices("autorefresh"), 1000);
                }, 800);
            }

            e.preventDefault();
        });

        $('#setup_scan_btn').on('tap', function(e) {
            addClickevent = 0;
            $("#loadingimg").attr('style', 'visibility: visible;');
            $("#loadingMsg").show();
            $("#scanningLink").hide();
            $("#unableDetect").hide();
            $("#devicenotfound").hide();
            $("#devicefound").show();
            $("#loadingimg").removeClass();
            $("#loadingimg").addClass('spinner');
            setupBridge.setMessage();

            var twentyMinutesLater = new Date();
            currentTime = twentyMinutesLater.getTime();
            after2Mins = twentyMinutesLater.setMinutes(twentyMinutesLater.getMinutes() + 2);
            var PairedDeviceList = window.sessionStorage.getItem(sessionStore.PAIRED_DEVICES);

            wemoUtil.infoLog(setupBridge.TAG, "currentTime  " + currentTime + "---" + after2Mins + "--" + addClickevent + "---" + count);

            if (addClickevent == 0) {
            	wemoUtil.infoLog(setupBridge.TAG, "currentTime " + currentTime + "---" + after2Mins);

                timeoutId = setTimeout(function() {
                    setTimeout(setupBridge.scaningDevices("autorefresh"), 1000);
                }, 800);
            }

            e.preventDefault();

        });

        $('.footer_cancel').on('tap', function(e) {
        	nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
            addClickevent++;
            cancelBtn = true;
            clearTimeout(timeoutId);
            clearTimeout(scanningDevicesTimeout);
            clearTimeout(scanningLedTimeout);
            scanningDevicesTimeout = null;
            scanningLedTimeout = null;

            if (PairedDeviceList == "alreadypaired") {
                setupBridge.closeNetwork();
                setupBridge.loadDeviceListPage();
            } else {
                setupBridge.closeNetwork();

                /******Smart Setup changes**********/

                var smart = window.sessionStorage.getItem(sessionStore.SMART_SETUP);
                var smartOngoing = window.sessionStorage.getItem(sessionStore.SMART_SETUP_ONGOING);

                if (smart == "1" || smartOngoing == "1") {
                    window.sessionStorage.setItem(sessionStore.BRIDE_SETUP_SUCCESS, "devicelist");
                    window.sessionStorage.setItem(sessionStore.EDIT_DETAILS_DONE, stringBoolean.TRUE);
                    setupBridge.loadIndexPage();
                } else
                    setupBridge.closeAccessPoint("devicelist");

            }
            e.preventDefault();

        });

        $('#setup_add_btn').on('click', function(e) {

            if (!$('#setup_add_btn').hasClass('disabled_text')) {

                addClickevent++;
                clearTimeout(timeoutId);
                wemoUtil.infoLog(setupBridge.TAG, "entering in ADD button");
                var arrChecked = [];
                var i = 0;
                var friendlyname = [];
                var currentState = [];
                var deviceImg = [];
                var deviceModelcode = [];
                var homeSensedeviceCapabilities = [];
                var homeSenseDeviceCurrentState = [];
                var homeSenseDeviceIDs = [];


                clearTimeout(scanningDevicesTimeout);
                clearTimeout(scanningLedTimeout);
                scanningDevicesTimeout = null;
                scanningLedTimeout = null;

                var PairedDeviceList = window.sessionStorage.getItem(sessionStore.PAIRED_DEVICES);
                nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);

                $('ul.setup_ul li span.led_option').each(function(i, v) {
                    if (!$(this).hasClass('unchecked')) { 
                        arrChecked[i] = $(this).attr('wemo-device-id');
                        friendlyname[i] = $(this).attr('wemo-device-friendlyname');
                        currentState[i] = $(this).attr('wemo-device-state');
                        deviceImg[i] = $(this).attr('wemo-device-image');
                        deviceModelcode[i] = $(this).attr('wemo-device-modelcode');
                          
                        var currval = $(this).attr('wemo-device-state');
                        
                        if(currval != ""){
                        	currval = currval;
                        }else{
                        	currval = statusCode.ON;
                        }
                        
                        homeSenseCapIdVal[$(this).attr('wemo-device-id')] = {'capabilitieid':$(this).attr('wemo-device-capabilities'), 'capabilitieval':currval};
                        
                        if ($.trim(deviceModelcode[i]) == $.trim(homeSenseModelCodes.DOORWINDOWS).toLowerCase()) {
                            homeSensedeviceCapabilities[i] = $(this).attr('wemo-device-capabilities');
                            homeSenseDeviceCurrentState[i] = currval;
                            homeSenseDeviceIDs[i] = $(this).attr('wemo-device-id');
                            homeSenseGrp = true;
                        }

                    }
                });
                
                arrChecked = setupBridge.cleanArray(arrChecked);
                friendlyname = setupBridge.cleanArray(friendlyname);
                currentState = setupBridge.cleanArray(currentState);
                deviceModelcode = setupBridge.cleanArray(deviceModelcode);
                deviceImg = setupBridge.cleanArray(deviceImg);
                deviceModelcode = jQuery.unique(deviceModelcode);
                window.sessionStorage.setItem(sessionStore.HOMESENSE_CAPABILITY_ID_VALUES, JSON.stringify(homeSenseCapIdVal));

                if (PairedDeviceList == "alreadypaired") {
                    devicePlugin.execute(
                        function(responce) {

                            /***************Home Sense Doors Windows Group creation **********************/

                            if (homeSenseGrp == true) {
                                homeSenseDeviceCurrentState = setupBridge.cleanArray(homeSenseDeviceCurrentState);
                                homeSensedeviceCapabilities = setupBridge.cleanArray(homeSensedeviceCapabilities);
                                homeSenseDeviceIDs = setupBridge.cleanArray(homeSenseDeviceIDs);

                                var ID = homeSenseDeviceIDs;
                                var Friendlyname = friendlyname;
                                homeSensedeviceCapabilities = jQuery.unique(homeSensedeviceCapabilities);
                                window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME, Friendlyname);
                                window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ID, ID);
                                window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS, ID);
                                window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CURRENTVAL, homeSenseDeviceCurrentState);
                                window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES, homeSensedeviceCapabilities);
                                setupBridge.createHomeSenseGroup("alreadypaired");
                            }

                            /*****************Home Sense End*********************/

                            if (responce != null && responce != undefined && responce != "") {

                                var len = arrChecked.length;
                                var status = responce[0].GetAddLedDeviceStatus;


                                if (len == 1 && status === true && deviceModelcode.length == 1) {
                                    var pagename = "editpage";

                                     if ($.inArray($.trim(deviceModelcode[0]), ledmodelcodes) != -1){
                                        pagename = "editpage";
                                        var Friendlyname = friendlyname;
                                        var ID = arrChecked;

                                        if (deviceImg.length > 0)
                                            var image_url = ledDefalutImg.Dynamic + deviceImg[0];
                                        else
                                            var image_url = window.sessionStorage.getItem("device_thumb_url");

                                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME, Friendlyname);
                                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL, image_url);
                                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ID, ID);
                                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO, "single");
                                        window.sessionStorage.setItem(sessionStore.DEVICE_SUCCESS, "sucesspage");
                                        setupBridge.closeNetwork();
                                        setupBridge.loadEditDevicePage();
                                    } else if ($.inArray($.trim(deviceModelcode[0]), homeSenseModelcodes) != -1) {
                                        pagename = "homesensesuccessscreen";
                                        var Friendlyname = friendlyname;
                                        var ID = arrChecked;

                                        if (deviceImg.length > 0)
                                            var image_url = ledDefalutImg.Dynamic + deviceImg[0];
                                        else
                                            var image_url = window.sessionStorage.getItem("device_thumb_url");

                                        if ($.trim(deviceModelcode[0]) != $.trim(homeSenseModelCodes.DOORWINDOWS).toLowerCase())
                                            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME, Friendlyname);

                                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ID, ID);
                                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL, image_url);
                                        window.sessionStorage.setItem(sessionStore.DEVICE_SUCCESS, "sucesspage");
                                        window.sessionStorage.setItem(sessionStore.HOME_SENSE_DEVICE_TYPE, $.trim(deviceModelcode[0]));
                                        setupBridge.closeNetwork();
                                        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                        setupBridge.loadHomeSenseSuccessPage();
                                    }

                                } else if (status === true && deviceModelcode.length == 1) {
                                    var pagename = 'devicelist';

                                    if ($.trim(deviceModelcode[0]) == $.trim(homeSenseModelCodes.DOORWINDOWS).toLowerCase()) {
                                        pagename = "homesensesuccessscreen";
                                        var Friendlyname = friendlyname;
                                        var ID = arrChecked;

                                        if (deviceImg.length > 0)
                                            var image_url = ledDefalutImg.Dynamic + deviceImg[0];
                                        else
                                            var image_url = window.sessionStorage.getItem("device_thumb_url");

                                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ID, ID);
                                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL, image_url);
                                        window.sessionStorage.setItem(sessionStore.DEVICE_SUCCESS, "sucesspage");
                                        window.sessionStorage.setItem(sessionStore.HOME_SENSE_DEVICE_TYPE, $.trim(deviceModelcode[0]));
                                        setupBridge.closeNetwork();
                                        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                        setupBridge.loadHomeSenseSuccessPage();

                                    } else {
                                        setupBridge.closeNetwork();
                                        setupBridge.loadDeviceListPage();
                                    }

                                } else if (status === true) {
                                    setupBridge.closeNetwork();
                                    setupBridge.loadDeviceListPage();
                                } else {
                                    nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                    setupBridge.scaningDevices("loaddevices");
                                }
                            } else {
                                setupBridge.closeNetwork();
                                setupBridge.loadDeviceListPage();
                            }


                        },
                        setupBridge.reportError,
                        ACTION_ADD_DEVICE, [arrChecked, friendlyname, currentState]
                    );
                } else {
                    setupPlugin.execute(
                        function(responce) {

                            /***************Home Sense Doors Windows Group creation**********************/

                            if (homeSenseGrp == true) {
                                homeSenseDeviceCurrentState = setupBridge.cleanArray(homeSenseDeviceCurrentState);
                                homeSensedeviceCapabilities = setupBridge.cleanArray(homeSensedeviceCapabilities);
                                homeSenseDeviceIDs = setupBridge.cleanArray(homeSenseDeviceIDs);
                                var ID = homeSenseDeviceIDs;
                                var Friendlyname = friendlyname;
                                homeSensedeviceCapabilities = jQuery.unique(homeSensedeviceCapabilities);
                                window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME, Friendlyname);
                                window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ID, ID);
                                window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS, ID);
                                window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CURRENTVAL, homeSenseDeviceCurrentState);
                                window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES, homeSensedeviceCapabilities);
                                setupBridge.createHomeSenseGroup("initial");
                            }

                            /*****************Home Sense End*********************/

                            if (responce != null && responce != undefined && responce != "") {

                            	var len = arrChecked.length;
                            	var status = responce[0].GetAddLedDeviceStatus;
                            	var bridgeUDN=responce[0].bridgeUDN;
                            	wemoUtil.infoLog(setupBridge.TAG, "status-----" + status + "===" + len + "---" + JSON.stringify(responce));
                            	wemoUtil.infoLog(setupBridge.TAG, "bridgeUDN-----" + bridgeUDN);

                            	setupPlugin.execute(
                            			function (result){
                            				//if(len == 1 && status === true)
                            				if (len == 1 && status === true && deviceModelcode.length == 1) {
                            					var pagename = "editpage";

                            					if ($.inArray($.trim(deviceModelcode[0]), ledmodelcodes) != -1){
                            						pagename = "editpage";
                            						var Friendlyname = friendlyname;
                            						var ID = arrChecked;

                            						if (deviceImg.length > 0)
                            							var image_url = ledDefalutImg.Dynamic + deviceImg[0];
                            						else
                            							var image_url = window.sessionStorage.getItem("device_thumb_url");

                            						window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME, Friendlyname);
                            						window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL, image_url);
                            						window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ID, ID);
                            						window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO, "single");
                            						window.sessionStorage.setItem(sessionStore.DEVICE_SUCCESS, "sucesspage");
                            						window.sessionStorage.setItem(sessionStore.REFRESH_CONTROL_POINT, "true");
                            						setupBridge.closeNetwork();

                            					} else if ($.inArray($.trim(deviceModelcode[0]), homeSenseModelcodes) != -1) {
                            						pagename = "homesensesuccessscreen";
                            						var Friendlyname = friendlyname;
                            						var ID = arrChecked;

                            						if (deviceImg.length > 0)
                            							var image_url = ledDefalutImg.Dynamic + deviceImg[0];
                            						else
                            							var image_url = window.sessionStorage.getItem("device_thumb_url");

                            						window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME, Friendlyname);
                            						window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL, image_url);
                            						window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ID, ID);
                            						window.sessionStorage.setItem(sessionStore.DEVICE_SUCCESS, "sucesspage");
                            						window.sessionStorage.setItem(sessionStore.HOME_SENSE_DEVICE_TYPE, $.trim(deviceModelcode[0]));
                            						window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL, image_url);
                            						setupBridge.closeNetwork();

                            					}

                            					/******Smart Setup changes**********/

                            					var smart = window.sessionStorage.getItem(sessionStore.SMART_SETUP);
                            					var smartOngoing = window.sessionStorage.getItem(sessionStore.SMART_SETUP_ONGOING);

                            					if (smart == "1" || smartOngoing == "1") {
                            						window.sessionStorage.setItem(sessionStore.BRIDE_SETUP_SUCCESS, pagename);
                            						window.sessionStorage.setItem(sessionStore.EDIT_DETAILS_DONE, stringBoolean.TRUE);
                            						setupBridge.loadIndexPage();
                            					} else {
                            						setupBridge.closeAccessPoint(pagename);
                            					}

                            				} else if (status === true && deviceModelcode.length == 1) {
                            					var pagename = 'devicelist';

                            					if ($.trim(deviceModelcode[0]) == $.trim(homeSenseModelCodes.DOORWINDOWS).toLowerCase()) {
                            						pagename = "homesensesuccessscreen";
                            						var Friendlyname = friendlyname;
                            						var ID = arrChecked;

                            						if (deviceImg.length > 0)
                            							var image_url = ledDefalutImg.Dynamic + deviceImg[0];
                            						else
                            							var image_url = window.sessionStorage.getItem("device_thumb_url");

                            						window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME, Friendlyname);
                            						window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ID, ID);
                            						window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL, image_url);
                            						window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS, ID);
                            						window.sessionStorage.setItem(sessionStore.DEVICE_SUCCESS, "sucesspage");
                            						window.sessionStorage.setItem(sessionStore.HOME_SENSE_DEVICE_TYPE, $.trim(deviceModelcode[0]));
                            						window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL, image_url);
                            						setupBridge.closeNetwork();
                            					}

                            					/******Smart Setup changes**********/

                            					var smart = window.sessionStorage.getItem(sessionStore.SMART_SETUP);
                            					var smartOngoing = window.sessionStorage.getItem(sessionStore.SMART_SETUP_ONGOING);

                            					if (smart == "1" || smartOngoing == "1") {
                            						window.sessionStorage.setItem(sessionStore.BRIDE_SETUP_SUCCESS, pagename);
                            						window.sessionStorage.setItem(sessionStore.EDIT_DETAILS_DONE, stringBoolean.TRUE);
                            						setupBridge.loadIndexPage();
                            					} else {
                            						setupBridge.closeAccessPoint(pagename);
                            					}

                            				} else if (status === true) {
                            					window.sessionStorage.setItem(sessionStore.REFRESH_CONTROL_POINT, "true");
                            					setupBridge.closeNetwork();

                            					/******Smart Setup changes**********/

                            					var smart = window.sessionStorage.getItem(sessionStore.SMART_SETUP);
                            					var smartOngoing = window.sessionStorage.getItem(sessionStore.SMART_SETUP_ONGOING);

                            					if (smart == "1" || smartOngoing == "1") {
                            						window.sessionStorage.setItem(sessionStore.BRIDE_SETUP_SUCCESS, "devicelist");
                            						window.sessionStorage.setItem(sessionStore.EDIT_DETAILS_DONE, stringBoolean.TRUE);
                            						setupBridge.loadIndexPage();
                            					} else {
                            						setupBridge.closeAccessPoint("devicelist");
                            					}

                            				} else {
                            					//setupBridge.openNetwork();
                            					wemoUtil.infoLog(setupBridge.TAG, "hiding the progress14");
                            					nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                            					setupBridge.scaningDevices("loaddevices");
                            				}

                            			}, setupBridge.reportError,
                            			ACTION_UPDATE_ZIGBEE_IN_CACHEDB, [bridgeUDN]
                            	);
                            } else {
		                                window.sessionStorage.setItem(sessionStore.REFRESH_CONTROL_POINT, "true");
		                                setupBridge.closeNetwork();
		
		                                /******Smart Setup changes**********/
		
		                                if (smart == "1" || smartOngoing == "1") {
		                                    window.sessionStorage.setItem(sessionStore.BRIDE_SETUP_SUCCESS, "devicelist");
		                                    window.sessionStorage.setItem(sessionStore.EDIT_DETAILS_DONE, stringBoolean.TRUE);
		                                    setupBridge.loadIndexPage();
		                                } else {
		                                    setupBridge.closeAccessPoint("devicelist");
		                                }
		
		                            }
                        },
                        setupBridge.reportError,
                        ACTION_ADD_DEVICE_SETUP, [arrChecked, friendlyname, currentState]
                    );

                }
                e.preventDefault();

            }

        });

        $('#multiple_bridge_cancel_btn').on('click', function() {
            $("#multiple_bridge_popup").popup("close");
            setupBridge.closeAccessPoint("devicelist");
        });

        $('#multiple_bridge_no_btn').on('click', function() {
            $("#multiple_bridge_popup").popup("close");
            setupBridge.closeAccessPoint("devicelist");
        });

        $('#multiple_bridge_yes_btn').on('click', function() {
            $("#multiple_bridge_popup").popup("close");
            window.sessionStorage.setItem(sessionStore.LED_MULTIPLE_BRIDGE_INFO, true);
        });
 
    },
    setMessage: function(){
        var $linkMsg = $(".wemo_link_avaliable");
        $linkMsg.show();
    	messageInterval = setInterval(function() {
            $linkMsg.fadeOut(500);
            setTimeout(function(){
                $linkMsg.html(wemo.items['scanMessage'+countMessage]);
            }, 500);
            $linkMsg.fadeIn(500);
            countMessage++;
            countMessage = countMessage>=3?0:countMessage;
        }, timeout.LED_SETUP_MESSAGE);
    },
    
    removeMessage: function(){
    	clearInterval(messageInterval);
    	$(".wemo_link_avaliable").html(wemo.items['scanMessage0']);
        $(".wemo_link_avaliable").hide();
        countMessage = 0;
    },
    
    openNetwork: function() {
    	wemoUtil.infoLog(setupBridge.TAG, "entering in OPN Network");
        //nativeUtilPlugin.execute(null,null,actions.SHOW_PROGRESS,[]);
        devicePlugin.execute(
            function(result) {

                var twentyMinutesLater = new Date();
                currentTime = twentyMinutesLater.getTime();
                after2Mins = twentyMinutesLater.setMinutes(twentyMinutesLater.getMinutes() + 2);

                if (result != undefined && result != "") {
                    var status = result[0].OpenNetwork;

                    if (status === true)
                        setTimeout(scanningLedTimeout = setupBridge.scaningDevices("autorefresh"), 1000);
                    else {
                        getOpenNetworkCnt++;

                        if (getOpenNetworkCnt < 5) {
                            setupBridge.openNetwork();
                        } else {
                        	wemoUtil.infoLog(setupBridge.TAG, "Open Network failed");
                            window.sessionStorage.setItem(sessionStore.REFRESH_CONTROL_POINT, "true");
                            setupBridge.closeNetwork();
                            setupBridge.closeAccessPoint("devicelist");
                        }
                    }
                } else {
                    getOpenNetworkCnt++;

                    if (getOpenNetworkCnt < 5)
                        setupBridge.openNetwork();
                    else {
                    	wemoUtil.infoLog(setupBridge.TAG, "Open Network failed");
                        window.sessionStorage.setItem(sessionStore.REFRESH_CONTROL_POINT, "true");
                        setupBridge.closeNetwork();
                        setupBridge.closeAccessPoint("devicelist");
                    }
                }
            },
            setupBridge.reportError,
            ACTION_OPEN_NETWORK, []
        );

    },

    closeNetwork: function() {
        devicePlugin.execute(
            function() {},
            setupBridge.reportError,
            ACTION_CLOSE_NETWORK, []
        );

    },

    getEndDevicesResponse: function(getendresponse) {

    	wemoUtil.infoLog(setupBridge.TAG, "getEndDevice Response " + JSON.stringify(getendresponse));

        var PairedDeviceList = window.sessionStorage.getItem(sessionStore.PAIRED_DEVICES);

        if (getendresponse == "0") {
        	wemoUtil.infoLog(setupBridge.TAG, "getEndDevicesResponse():: if block");
            var twentyMinutesLater = new Date();
            currentTime = twentyMinutesLater.getTime();

            if (addClickevent == 0) {
                $('.scanNumber').text("0");
                $("#scanningLink").hide();
                wemoUtil.infoLog(setupBridge.TAG, "calling getEnd devices");

                if (PairedDeviceList == "alreadypaired")
                    setupBridge.getEndDevicesCall("moretab");
                else
                    setupBridge.getEndDevicesCall("setup");

            } else {
                if (cancelBtn == false) {
                    $("#unableDetect").show();
                    setupBridge.removeMessage();
                    $("#devicefound").hide();
                    $("#devicenotfound").show();
                    $("#loadingimg").attr('style', 'visibility: hidden;');
                    $("#loadingMsg").hide();
                    $('.scanNumber').text("0");
                    $("#scanningLink").hide();
                    $("#loadingimg").attr('style', 'visibility: visible;');
                    $("#loadingimg").removeClass();
                    $("#loadingimg").addClass('unabletodetect');
                }

            }
        } else
            setupBridge.getEndResult(getendresponse);

    },

    getEndResult: function(leddevices) {

    	wemoUtil.infoLog(setupBridge.TAG, "leddevices array getEnd result" + JSON.stringify(leddevices));
        var len = leddevices.length;

        var listDevices = "";
        var PairedDeviceList = window.sessionStorage.getItem(sessionStore.PAIRED_DEVICES);

        if (len == 0 || leddevices == "" || leddevices == null)
            $('.scanNumber').text(len);
        else {


            for (var i = 0; i < len; i++) {

            	wemoUtil.infoLog(setupBridge.TAG, "enterinjg in for");
                var deviceIdAvailablity = leddevices[i].Availability;
                var ID = leddevices[i].DeviceID;
                var GroupId = leddevices[i].GroupID;
                var deviceImg = ledDefalutImg.Defalut;
                var url = ledDefalutImg.Defalut_Setup_URL;
                var Friendlyname = leddevices[i].FriendlyName;
                wemoUtil.infoLog(setupBridge.TAG, "looping " + ID + "---" + i + "---" + scannedDevices);
                if (jQuery.inArray(ID, scannedDevices) == -1 && ID != undefined) {

                	wemoUtil.infoLog(setupBridge.TAG, "deviceIdAvailablity " + deviceIdAvailablity);

                    if (deviceIdAvailablity != ledDeviceConstants.NO && (GroupId == undefined || GroupId == "") && Friendlyname.indexOf('Unknown') == -1 && leddevices[i].ModelCode != "" && leddevices[i].ModelCode != undefined) {
                        var ID = leddevices[i].DeviceID;
                        var DevIndex = leddevices[i].DeviceIndex;
                        var deviceListType = leddevices[i].DeviceListType;
                        var deviceManufacture = "";
                        var modelcode = "";
                        var statusClass = "";
                        var deviceCapabilities = "";

                        if (leddevices[i].ManufacturerName != undefined)
                            deviceManufacture = leddevices[i].ManufacturerName;

                        if (leddevices[i].ModelCode != undefined)
                            modelcode = leddevices[i].ModelCode;

                        if (deviceManufacture != "" && modelcode != "") {
                            var replaceSpaceManufacturer = deviceManufacture.replace(/ /g, '_');
                            replaceSpaceManufacturer = replaceSpaceManufacturer.toLowerCase();
                            var replaceSpaceModelcode = modelcode.replace(/ /g, '_');
                            replaceSpaceModelcode = replaceSpaceModelcode.toLowerCase();
                            modelcode = modelcode.toLowerCase();
                            
                            
                            if(($.inArray($.trim(modelcode), ledmodelcodes) != -1 || $.inArray($.trim(modelcode), homeSenseModelcodes) != -1) && 
                            	$.inArray($.trim(deviceManufacture), ledmanufacturercodes) != -1){
                            	deviceImg = "bulb_" + replaceSpaceManufacturer + "_" + replaceSpaceModelcode + ".png";
                            }
    
                            if ((leddevices[i].ModelCode).indexOf(homeSenseModelCodes.DOORWINDOWS) != -1)
                                deviceCapabilities = leddevices[i].CapabilityIDs;

                            
                            url = "../../img/" + deviceImg;
                        }
                        else if(modelcode != ""){
                        	var replaceSpaceModelcode = modelcode.replace(/ /g, '_');
                        	replaceSpaceModelcode = modelcode.toLowerCase();
                        	modelcode = modelcode.toLowerCase();
                        	
                        	if($.inArray($.trim(modelcode), ledmodelcodes) != -1 || $.inArray($.trim(modelcode), homeSenseModelcodes) != -1){
                        		 deviceImg = "bulb_" + replaceSpaceModelcode + ".png";
                            }

                            if ((leddevices[i].ModelCode).indexOf(homeSenseModelCodes.DOORWINDOWS) != -1)
                                deviceCapabilities = leddevices[i].CapabilityIDs;
                            
                            
                            url = "../../img/" + deviceImg;
                        }

                        if (leddevices[i].CurrentState != undefined && leddevices[i].CurrentState != null && leddevices[i].CurrentState != "") {
                            var currentStateresp = leddevices[i].CurrentState;
                            var currentStateSplit = currentStateresp.split(",");
                            var CurrentState = currentStateresp[0];

                            if (CurrentState == 0 && $.inArray(modelcode, homeSenseModelcodes) == -1)
                                statusClass = "unchecked";
                            else if (CurrentState == ",")
                                CurrentState = "1";
                        } else
                            var CurrentState = "1";


                        if (deviceListType == "Unpaired") {
                            count++;

                            if (count > 0 && count < 10)
                                var name = Friendlyname + " 0" + count;
                            else
                                var name = Friendlyname + " " + count;

                            listDevices += "<li id='checkbox-" + DevIndex + "'><span class='led_icon' style='background-image:url(" + url + ")'></span><span class='led_name'>" + name + "</span><span class='led_option " + statusClass + "' wemo-device-friendlyname='" + name + "' wemo-device-state='" + CurrentState + "' wemo-device-id='" + ID + "' wemo-device-image='" + deviceImg + "' wemo-device-modelcode='" + modelcode + "' wemo-device-capabilities='" + deviceCapabilities + "'></span></li>";
                            scannedDevices.push(leddevices[i].DeviceID);
                            wemoUtil.infoLog(setupBridge.TAG, "looping enter " + ID + "---" + i + "---" + scannedDevices+ "----" +listDevices);
                        }

                    }

                }

            }

            if (cancelBtn == false) {
                if (scannedDevices.length > 0) {
                	wemoUtil.infoLog(setupBridge.TAG, "showing add button" + scannedDevices.length);
                    var totalCnt = parseInt(scannedDevices.length);
                    $('.scanNumber').text(totalCnt);
                    $("#devicenotfound").hide();
                    $("#devicefound").show();

                    var Devcount = $('ul.setup_ul li').length;
                    var checkedCnt = 0;

                    $('ul.setup_ul li span.led_option').each(function(i, v) {
                        if ($(this).hasClass('unchecked')) {
                            checkedCnt++;
                        }
                    });

                    if (Devcount == checkedCnt)
                        $("#setup_add_btn").addClass('disabled_text');
                    else {
                        $("#setup_add_btn").removeClass('ui-disabled');
                        $("#setup_add_btn").removeClass('disabled_text');
                    }

                    $("#leddevices").append(listDevices);
                } else
                    $("#leddevices").append(listDevices);

            }

        }

        var twentyMinutesLater = new Date();
        currentTime = twentyMinutesLater.getTime();
        wemoUtil.infoLog(setupBridge.TAG, "currentTime  " + currentTime + "---" + after2Mins + "--" + addClickevent + "---" + scannedDevices);


        if (addClickevent == 0) {
            if (PairedDeviceList == "alreadypaired") {
            	wemoUtil.infoLog(setupBridge.TAG, "calling getEnd devices moretab");
                setupBridge.getEndDevicesCall("moretab");
            } else {
            	wemoUtil.infoLog(setupBridge.TAG, "calling getEnd devices setup");
                setupBridge.getEndDevicesCall("setup");
            }

        } else {

            if (cancelBtn == false) {
            	wemoUtil.infoLog(setupBridge.TAG, "cancelBtn " + cancelBtn);

                if (scannedDevices.length == 0 && addClickevent == 0) {
                	
                  $("#loadingimg").attr('style', 'visibility: hidden;');
                  $("#loadingMsg").hide();

                	wemoUtil.infoLog(setupBridge.TAG, "entering in else");
                    $("#unableDetect").show();
                    $("#loadingimg").attr('style', 'visibility: visible;');
                    $("#loadingimg").removeClass();
                    $("#loadingimg").addClass('unabletodetect');
                    $("#devicenotfound").show();
                    $("#devicefound").hide();
                    setupBridge.removeMessage();
                    

                } else if(addClickevent == 0) {
                    $("#loadingimg").attr('style', 'visibility: hidden;');
                    $("#loadingMsg").hide();
                    $("#scanningLink").show();
                    setupBridge.removeMessage();
                    $("#loadingimg").attr('style', 'visibility: visible;');
                    $("#loadingimg").removeClass();
                    $("#loadingimg").addClass('scanlinkImg');
                }

            }

        }

    },

    scaningDevices: function(inputFrom) {
        wemoUtil.infoLog(setupBridge.TAG, "entering in Scanning devices");

        $("#loadingimg").attr('style', 'visibility: visible;');
        $("#loadingMsg").show();
        $("#scanningLink").hide();

        devicePlugin.execute(
            function(leddevices) {

                /*************Cancel Button code********/
            	
            	wemoUtil.infoLog(setupBridge.TAG, "leddevices array"+ JSON.stringify(leddevices));
                //setupBridge.getEndDevicesResponse("setup");

                /*************Cancel Button code********/

                if (inputFrom == "autorefresh") {
                    setTimeout(function() {
                        var twentyMinutesLater = new Date();
                        currentTime = twentyMinutesLater.getTime();

                        if (addClickevent == 0) {
                            setupBridge.scaningDevices("autorefresh");
                        } else {
                            if (cancelBtn == false) {
                                

                                if (scannedDevices.length == 0) {
                                	$("#loadingimg").attr('style', 'visibility: hidden;');
                                    $("#loadingMsg").hide();
                                    $("#unableDetect").show();
                                    setupBridge.removeMessage();
                                    $("#loadingimg").attr('style', 'visibility: visible;');
                                    $("#loadingimg").removeClass();
                                    $("#loadingimg").addClass('unabletodetect');
                                    $("#devicenotfound").show();
                                    $("#devicefound").hide();
                                } else if(addClickevent == 0){
                                	$("#loadingimg").attr('style', 'visibility: hidden;');
                                    $("#loadingMsg").hide();
                                    $("#scanningLink").show();
                                    setupBridge.removeMessage();
                                    $("#loadingimg").attr('style', 'visibility: visible;');
                                    $("#loadingimg").removeClass();
                                    $("#loadingimg").addClass('scanlinkImg');
                                }

                            }


                        }
                    }, 2500);
                }

            },
            setupBridge.reportError,
            ACTION_GET_END_DEVICE, ["getendlist"]
        );
    },

    bindEvents: function() {
    	wemoUtil.infoLog(setupBridge.TAG, "bind events");
        document.addEventListener('offline', setupBridge.onOffline, false);
        document.addEventListener('online', setupBridge.onOnline, false);
        document.addEventListener("backbutton", setupBridge.onBackPress, false);
        document.addEventListener("resume", setupBridge.onResume, false);

    },

    onBackPress: function() {
    	wemoUtil.infoLog(setupBridge.TAG, "back button pressed");
        if ($('#select_photo_popup').is(':visible')) {
        	wemoUtil.infoLog(setupBridge.TAG, "Dialog box is open");
            $("#select_photo_popup").popup("close");
            $("#select_photo_popup").hide()
        } else if (PairedDeviceList == "alreadypaired") {
            var previousUrl = wemoUtil.getPreviousUrl();
            if (previousUrl.match(filePath.DEVICE_LIST)) {
                wemoUtil.loadUrl(filePath.MORE_MENU);
            } else {
                wemoUtil.loadPreviousUrl();
            }
        } else {
            clearTimeout(timeoutId);
            clearTimeout(scanningDevicesTimeout);
            clearTimeout(scanningLedTimeout);
            scanningDevicesTimeout = null;
            scanningLedTimeout = null;
            window.sessionStorage.clear();
            navigator.app.clearHistory();
            setupPlugin.execute(null, null, ACTION_STOP_UPNP_SERVICE, []);
            navigator.app.exitApp();
        }
    },

    onResume: function() {
        clearTimeout(timeoutId);
        clearTimeout(scanningDevicesTimeout);
        clearTimeout(scanningLedTimeout);
        scanningDevicesTimeout = null;
        scanningLedTimeout = null;
        wemoUtil.infoLog(setupBridge.TAG, "resumed");
    },

    onOffline: function() {
    	wemoUtil.infoLog(setupBridge.TAG, "offLine");
    },

    onOnline: function() {
    	wemoUtil.infoLog(setupBridge.TAG, "onLine");
    },

    reportError: function(e) {
    	wemoUtil.infoLog(setupBridge.TAG, "Plugin Failure Call back!!!!   " + e);
    },

    accesspointError: function(e) {
    	wemoUtil.infoLog(setupBridge.TAG, "Plugin Failure Call back accesspoint!!!!   " + e);
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        setupBridge.loadDeviceListPage();
    },

    closeAccessPoint: function(redirectpage) {
        nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
        redirectGlobalPage = redirectpage;
        wemoUtil.infoLog(setupBridge.TAG, "redirectGlobalPage111***" + redirectGlobalPage);
        window.sessionStorage.setItem(sessionStore.REDIRECT_LED_SETUP_GLOBAL_PAGE, redirectGlobalPage);
        
        setupPlugin.execute(
            function(result) {
            	wemoUtil.infoLog(setupBridge.TAG, "Close AP success callback");
            	setTimeout(function() {
                    setTimeout(function() {
                        setupPlugin.execute(null, null, ACTION_STOP_GETEND_LISTENERS, []);
                    }, 500);
                    setTimeout(function() {
                        setupPlugin.execute(null, null, ACTION_INIT_CONTROL_POINT, []);
                    }, 700);
                    setTimeout(function() {
                    	nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                        setupBridge.getNetworkType();
                    }, 4000);

                }, timeout.AP_CLOSE);
            },
            setupBridge.accesspointError,
            ACTION_CLOSE_ACCESS_POINT, []
        );
    },
    
    redirectPage: function(Redirectparam) {

        if (Redirectparam == "devicelist")
            setupBridge.loadDeviceListPage();
        else if (Redirectparam == "editpage")
            setupBridge.loadEditDevicePage();
        else if (Redirectparam == "homesensesuccessscreen")
            setupBridge.loadHomeSenseSuccessPage();
        else
            setupBridge.loadDeviceListPage();
    },

    getNetworkType: function() {
    	wemoUtil.infoLog(setupBridge.TAG, "getNetworkType led_setup: ");
        nativeUtilPlugin.execute(
            setupBridge.processNetworkType,
            setupBridge.reportError,
            actions.GET_NETWORK_TYPE_NEW, []
        );
    },

    processNetworkType: function(type) {
    	wemoUtil.infoLog(setupBridge.TAG, "processNetworkType led_setup: " + type);
        switch (type) {
            case networkType.HOME_NETWORK:
                window.sessionStorage.setItem(sessionStore.REMOTE_MODE, false);
                devicePlugin.execute(null, setupBridge.reportError, actions.INITIALIZE_UPNP, []);

                if (redirectGlobalPage == "devicelist") {
                    setupBridge.loadDeviceListPage();
                    break;
                } else if (redirectGlobalPage == "editpage") {
                    setupBridge.loadEditDevicePage();
                    break;
                } else if (redirectGlobalPage == "homesensesuccessscreen") {
                    setupBridge.loadHomeSenseSuccessPage();
                    break;
                } else {
                    setupBridge.loadDeviceListPage();
                    break;
                }
            case networkType.REMOTE_WIFI:
                window.sessionStorage.setItem(sessionStore.REMOTE_MODE, true);
                setupBridge.loadDeviceListPage();
                break;
            case networkType.REMOTE_MOBILE:
            	wemoUtil.infoLog(setupBridge.TAG, "REMOTE_MOBILE:  " + networkType.REMOTE_MOBILE);
                nativeUtilPlugin.execute(
                    function(enabled) {
                    	wemoUtil.infoLog(setupBridge.TAG, "Remote enabled: " + enabled);
                        if (enabled) {
                        	wemoUtil.infoLog(setupBridge.TAG, "Load Device List Page");
                            window.sessionStorage.setItem(sessionStore.REMOTE_MODE, true);
                            nativeUtilPlugin.execute(null, setupBridge.reportError, actions.PREF_SET_GET_STARTED_NEEDED, [false]);
                            setupBridge.loadDeviceListPage();
                        } else {
                            cwemoUtil.infoLog(setupBridge.TAG, "Load Remote Not Available Page");
                            setupBridge.loadRemoteNotAvailablePage();
                        }
                    },
                    setupBridge.reportError,
                    actions.PREF_IS_REMOTE_ENABLED, []
                );
                break;
            case networkType.WEMO:
                setupBridge.loadIndexPage();
                break;

            case networkType.NO_NETWORK:
            	wemoUtil.infoLog(setupBridge.TAG, "No Network");
                setTimeout(function() {
                	wemoUtil.infoLog(setupBridge.TAG, "Get Network Type again");
                    setupBridge.getNetworkType();
                }, timeout.NETWORK_RETRY);

                break;

            default:
            	wemoUtil.infoLog(setupBridge.TAG, "Not supported ");
                return;
                break;
        }
    },

    loadDeviceListPage: function() {
        setTimeout(function() {
            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
            wemoUtil.loadUrl(filePath.DEVICE_LIST);
        }, timeout.CONTROL_POINT_DELAY);

    },

    loadEditDevicePage: function() {
        setTimeout(function() {
            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
            wemoUtil.loadUrl(filePath.LED_DEVICE_LIST_EDIT);
            //wemoUtil.loadUrl(filePath.LED_DEVICE_BULB_EDIT);
        }, timeout.CONTROL_POINT_DELAY);

    },

    loadHomeSenseSuccessPage: function() {
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        setTimeout(function() {
            wemoUtil.loadUrl(filePath.HOME_SENSE_SETUP_SCREEN);
        }, timeout.CONTROL_POINT_DELAY);

    },

    loadRemoteNotAvailablePage: function() {
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        wemoUtil.loadUrl(filePath.REMOTE_NOT_AVAILABLE);
    },

    loadIndexPage: function() {
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        wemoUtil.loadUrl(filePath.INDEX);
    },

    loadNoNetworkPage: function() {
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        wemoUtil.loadUrl(filePath.NO_NETWORK);
    },

    getEndDevicesCall: function(reqtype) {

        var twentyMinutesLater = new Date();
        currentTime = twentyMinutesLater.getTime();

        if (addClickevent == 0) {
            //getDeviceCounter = 0;
        } else {
            if (scannedDevices.length > 0) {
            	wemoUtil.infoLog(setupBridge.TAG, "showing add button");
                var totalCnt = parseInt(scannedDevices.length);
                $('.scanNumber').text(totalCnt);
                $("#devicenotfound").hide();
                $("#devicefound").show();

                var Devcount = $('ul.setup_ul li').length;
                var checkedCnt = 0;

                $('ul.setup_ul li span.led_option').each(function(i, v) {
                    if ($(this).hasClass('unchecked')) {
                        checkedCnt++;
                    }
                });

                if (Devcount == checkedCnt)
                    $("#setup_add_btn").addClass('disabled_text');
                else {
                    $("#setup_add_btn").removeClass('ui-disabled');
                    $("#setup_add_btn").removeClass('disabled_text');
                }

                $("#loadingMsg").hide();
                $("#scanningLink").show();
                setupBridge.removeMessage();
                $("#loadingimg").attr('style', 'visibility: visible;');
                $("#loadingimg").removeClass();
                $("#loadingimg").addClass('scanlinkImg');

            } else {
                if (cancelBtn == false) {
                    $("#devicefound").hide();
                    $("#devicenotfound").show();
                    $("#loadingimg").attr('style', 'visibility: hidden;');
                    $("#loadingMsg").hide();
                    $('.scanNumber').text("0");
                    $("#scanningLink").hide();
                    $("#unableDetect").show();
                    setupBridge.removeMessage();
                    $("#loadingimg").attr('style', 'visibility: visible;');
                    $("#loadingimg").removeClass();
                    $("#loadingimg").addClass('unabletodetect');

                }

            }

        }

    },

    registerDeviceListeners: function() {
    	wemoUtil.infoLog(setupBridge.TAG, "START_LED_DEVICE_LISTENERS in Scanning Page");
        setTimeout(function() {
            deviceTabPlugin.execute(
                function(message) {
                	wemoUtil.infoLog(setupBridge.TAG, "device callback in scanning screen" + JSON.stringify(message));
                    if (message.listen == "get_end_device_list") {
                        setupBridge.getEndDevicesResponse(message.getLedList);
                    }
                },
                setupBridge.reportError,
                actions.START_LED_DEVICE_LISTENERS, []
            );
        }, 100);
    },

    registerLedSetupListeners: function() {
        //setupPlugin.execute(null, null, ACTION_STOP_SETUP_LISTENERS, []);
    	wemoUtil.infoLog(setupBridge.TAG, "START_LED_SETUP_LISTENERS");
        setTimeout(function() {
            devicePlugin.execute(
                function(message) {
                	wemoUtil.infoLog(setupBridge.TAG, "Setup Callback Message: " + JSON.stringify(message));

                    if (message) {
                        if (message.listen == "get_end_device_list") {
                            setupBridge.getEndDevicesResponse(message.getLedList);
                        }
                    }

                },
                setupBridge.reportError,
                actions.START_LED_DEVICE_LISTENERS, []
            );
        }, 100);
    },

    getBridgeInfo: function() {

        nativeUtilPlugin.execute(
            function(result) {

                var deviceType = window.sessionStorage.getItem('device_SSID');

                wemoUtil.infoLog(setupBridge.TAG, "entering in getBridgeInfo" + deviceType + "---" + result + "===" + JSON.stringify(result) + "---" + result.length);

                if (result == "" || result == null || result == undefined || result.length == 0)
                    window.sessionStorage.setItem(sessionStore.LED_MULTIPLE_BRIDGE_UDN, deviceType);
                else {
                    if (deviceType != $.trim(result) && deviceType != null) {
                    	wemoUtil.infoLog(setupBridge.TAG, "entering in getBridgeInfo else");
                        $("#multiple_bridge_header").html(wemo.items['AnotherWeMoLink_heading']);
                        $("#multiple_bridge_body").html(wemo.items['AnotherWeMoLink_description']);

                        setTimeout(function() {
                            $("#multiple_bridge_popup").popup();
                            $("#multiple_bridge_popup").popup('open');
                        }, 800);

                    } else
                        window.sessionStorage.setItem(sessionStore.LED_MULTIPLE_BRIDGE_UDN, deviceType);

                }

            },
            setupBridge.reportError,
            ACTION_GET_BRIDGE_DATA, []
        );

    },

    loadRemoteNotAvailablePage: function() {
        wemoUtil.infoLog(index.TAG, 'loadRemoteNotAvailablePage');
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        wemoUtil.loadUrl(filePath.REMOTE_NOT_AVAILABLE);
    },

    createHomeSenseGroup: function(inp) {

        if (inp == "alreadypaired") {
            var grpObject = setupBridge.checkForGrpLed();

            if (grpObject != undefined && grpObject.length > 0) {
                var selectedIds = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS);
                var selectedFriendlyName = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME);
                var deviceId = [];

                if (selectedIds != undefined && selectedIds != "") {
                    selectedIds = selectedIds.split(",");
                    window.sessionStorage.setItem(sessionStore.DEVICE_GROUP_SELECTED_IDS, selectedIds);
                }


                if (selectedFriendlyName != undefined && selectedFriendlyName != "")
                    selectedFriendlyName = selectedFriendlyName.split(",");

                for (var i = 0; i < grpObject.length; i++) {
                    var groupid = [grpObject[i].groupid];
                    var groupName = [grpObject[i].friendlyname];
                    var inputArr2 = [grpObject[i].DeviceCapabilities];
                    var inputArr3 = [grpObject[i].DeviceCapabilitiesValues];
                    var deviceFriendlyname = [grpObject[i].DeviceFriendlyNames];
                    deviceId.push(grpObject[i].deviceid);
                }

                var grpIndiviStatus = window.sessionStorage.getItem(sessionStore.LED_HOMESENSE_GROUP_INDIVI_STATUS);
                if(grpIndiviStatus != "" && grpIndiviStatus != undefined){
                    grpIndiviStatus = grpIndiviStatus.replace(/,\s*$/, "");
                    var grpIndiviStatusArr = grpIndiviStatus.split(",");
                    
                    for (var j = 0; j < grpIndiviStatusArr.length; j++) {
                        var val = grpIndiviStatusArr[j];
                        var valArr = val.split(":");
                        homeSenseCapIdVal[valArr[0]] = {'capabilitieid':homeSenseCapabilities.ONOFF, 'capabilitieval':valArr[1]};
                    }
                    
                }
                
                var inputArr1 = $.merge(selectedIds, deviceId);
                inputArr1 = jQuery.unique(inputArr1);
                var friendlynameArr = $.merge(selectedFriendlyName, deviceFriendlyname);
                window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS, inputArr1);
                window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME, friendlynameArr);
                window.sessionStorage.setItem(sessionStore.HOME_SENSE_GROUP_ID, groupid);
                window.sessionStorage.setItem(sessionStore.HOME_SENSE_GROUP_NAME, groupName);
                window.sessionStorage.setItem(sessionStore.HOMESENSE_CAPABILITY_ID_VALUES, JSON.stringify(homeSenseCapIdVal));
                
            } else {
                var friendlyname = wemo.items['HomeSenseGrpTitle'];
                var groupName = [friendlyname];
                var groupid = ["0"];
                var inputArr1 = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS)];
                var inputArr2 = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES)];
                var inputArr3 = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CURRENTVAL)];
                window.sessionStorage.setItem(sessionStore.HOME_SENSE_GROUP_NAME, groupName);
            }
        } else {
            var friendlyname = wemo.items['HomeSenseGrpTitle'];
            var groupName = [friendlyname];
            var groupid = ["0"];
            var inputArr1 = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS)];
            var inputArr2 = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES)];
            var inputArr3 = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CURRENTVAL)];
            window.sessionStorage.setItem(sessionStore.HOME_SENSE_GROUP_NAME, groupName);
        }

        devicePlugin.execute(
            function(response) {

            	wemoUtil.infoLog(setupBridge.TAG, "response**" + JSON.stringify(response));

                if (response == null || response == undefined || response == "") {
                    wemoUtil.infoLog(setupBridge.TAG, "LED Group creation failed");
                    nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                } else {
                    var status = response[0].GetCreateGroupResponse;

                    if (window.sessionStorage.getItem(sessionStore.HOME_SENSE_GROUP_ID) == undefined) {
                        if (status != 2 && status != 0)
                            window.sessionStorage.setItem(sessionStore.HOME_SENSE_GROUP_ID, status);
                    }


                    nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                }

            },
            setupBridge.reportError,
            ACTION_CREATE_GROUP, [inputArr1, inputArr2, inputArr3, groupName, groupid]
        );

    },

    cleanArray: function(arr) {
        var cleanArr = [];

        for (var j = 0; j < arr.length; j++) {
            if (arr[j] != "," && arr[j] != " " && arr[j] != undefined)
                cleanArr.push(arr[j]);
        }
        return cleanArr;
    },

    checkForGrpLed: function() {
        var grpObject = [];

        for (var j = 0; j < _ledDeviceCache.length; j++) {
            if (_ledDeviceCache[j].GroupID != undefined || _ledDeviceCache[j].GroupID != null) {
                var groupIdsArr = _ledDeviceCache[j].GroupIDS;

                for (var k = 0; k < groupIdsArr.length; k++) {
                    groupinfo = {};
                    if ($.trim(groupIdsArr[k].ModelCode).toLowerCase() == $.trim(homeSenseModelCodes.DOORWINDOWS).toLowerCase()) {
                        groupinfo[key.GROUPID] = _ledDeviceCache[j].GroupID;
                        groupinfo[key.DEVICEID] = groupIdsArr[k].DeviceID;
                        groupinfo[key.FRIENDLYNAME] = _ledDeviceCache[j].GroupName;
                        groupinfo[key.DEVICE_CAPABILITIES] = _ledDeviceCache[j].GroupCapabilityIDs;
                        groupinfo[key.DEVICE_CAPABILITIES_VALUES] = _ledDeviceCache[j].GroupCapabilityValues;
                        groupinfo[key.DEVICE_FRIENDLY_NAMES] = groupIdsArr[k].FriendlyName;
                    }

                    grpObject.push(groupinfo);
                }

            }
        }

        return grpObject;
    },
    
    getDeviceCount: function(devicetype){
    	wemoUtil.infoLog(setupBridge.TAG, "entering in getDeviceCount");
    	smartDevicePlugin.execute(
                function(response) {
                	wemoUtil.infoLog(setupBridge.TAG, "entering in getDeviceCount response ::"+response);
                	if(response != null && response != undefined){
                		count = response;
                	}
                },
                setupBridge.reportError,
                actions.GET_SUBDEVICES_COUNT, [devicetype]
            );
    }

};
