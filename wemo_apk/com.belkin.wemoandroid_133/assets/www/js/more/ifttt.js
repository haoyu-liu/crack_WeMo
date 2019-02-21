/*
    ifttt.js

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

var TAG = "ifttt.js: ";
var homeId;
var activationCode;
var currentFirmware;

$(document).bind('pageinit', function () {
    $('.ui-header').css({
        'border-bottom': '1px solid #888 !important'
    });
    $('.sub_header').css({
        'z-index': 3,
        'border-top': '1px solid #73D44C !important'
    });

    var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));
    ifttt.initialize();
});

var ifttt = {

    initialize: function () {
        wemoUtil.infoLog(TAG + "initialize");
        $("#find_and_pair_Newdevice").hide();
        window.sessionStorage.setItem(sessionStore.IS_BRIDGE_PRESENT, false);
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    setCurrentTimeForPinGeneration: function () {

        var currentdatetime = $.format.date(new Date(), formats.DateTimeFormat);
        $('#currentdatatimeifttt').html(currentdatetime);
        window.sessionStorage.setItem(sessionStore.IFTTT_KEY_ACTIVATION_TIME, currentdatetime);
    },

    onDeviceReady: function () {

        ifttt.getCurrentFirmware();
        if (window.sessionStorage.getItem("led_device_length") == "1") {
            $("#find_and_pair_Newdevice").show();
            window.sessionStorage.setItem(sessionStore.IS_BRIDGE_PRESENT, true);
        } else {
        	$("#find_and_pair_Newdevice").hide();
        	window.sessionStorage.setItem(sessionStore.IS_BRIDGE_PRESENT, false);
        }
        //			ifttt.getIftttId();
        
        /*if(window.sessionStorage.getItem("LEDpresent") == "yes")
        {
        	$('.bottom_single_button_next').show();
        }*/
        if(window.sessionStorage.getItem("iftttFlag") == 0)
        {
        	//$('.bottom_single_button_next').css('bottom','54%');
        	$('#contentInner').hide();
        	$('#connect_btn').hide();
        	
        }else
        {
        
        
        //All initialization script goes here

        var keyActivationTime = window.sessionStorage.getItem(sessionStore.IFTTT_KEY_ACTIVATION_TIME);

        if (keyActivationTime != null && keyActivationTime != undefined) {
            $('#currentdatatimeifttt').html(keyActivationTime);
        } else {
            ifttt.setCurrentTimeForPinGeneration();
        }

        

        $("#generate_new_pin").on('tap', function () {
            ifttt.getCurrentFirmware();
            ifttt.setCurrentTimeForPinGeneration();
        });
            $(".activation_pin").on('tap', function(){
               this.select();
            });

        $('#More_Info_Link_Ifttt').on('click', function () {
            // wemoUtil.infoLog("Ashish  " + isRemoteEnabled);
            if (!isRemoteEnabled) {
                deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
            }
            navigator.app.loadUrl(wemo.items['MoreInfoLinkIftt'], {
                openExternal: true
            });
        });
        $("#MoreInformationOnIFTTT").on("tap", function () {
            if (!isRemoteEnabled) {
                deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
            }

            window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['IFTTT_Info_Url']);
            wemoUtil.loadUrl(filePath.HELP_CENTER);
        });

        $("#connect_btn").on("tap", function () {

            if (activationCode == null || activationCode == "") {
                $('#ifttt_remote_activation_failure_popup').popup('open');
            } else {
                var url = wemoUtil.get_ifttt_url(window.sessionStorage.getItem("activationCode"));
                window.name = "wemo";
                /*navigator.app.loadUrl(url, {
                    openExternal: true
                });*/
                //wemoUtil.loadUrl(filePath.CONNECT_TO_IFTTT);
                var iabRef = null;

                window.notifier = {
                    flag: false,
                    start: function() {
                        if(!window.notifier.flag) {
                            window.notifier.flag = true;
                            //navigator.notification.activityStart('Loading!', 'Please wait ...');
                            nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ['', wemo.items['AppStatusWaitingDot']]);
                        }
                    },
                    stop: function() {
                        window.notifier.flag = false;
                        //navigator.notification.activityStop();
                        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                    }
                }

                function iabLoadStart(event) {
                    wemoUtil.infoLog('IFTTT -> iabLoadStart: ' + event.type + ' - ' + event.url);
                    window.notifier.start();
                }

                function iabLoadStop(event) {
                    wemoUtil.infoLog('IFTTT -> iabLoadStop: ' + event.type + ' - ' + event.url);
                    window.notifier.stop();
                    var curl = event.url;
                    if (curl.toLowerCase().indexOf('wemoauth') >= 0) {
                        cordova.exec(function (params) {
                            wemoUtil.infoLog('IFTTT -> Success, params: ' + params);
                            try {
                                var authCode = params[0];
                                var homeId = params[1];
                                var trimkey = 'SDU ';
                                var uuid = authCode.substring(trimkey.length, authCode.indexOf(':'));
                                iabRef.executeScript({
                                    code: wemoUtil.templator.fitIn('window.WeMoAppMobileData = {uniqueId:"[0]", homeId:"[1]", signature:"[2]"}; document.getElementById("WeMoAppMobileData").innerHTML = JSON.stringify(window.WeMoAppMobileData);', [
                                            uuid,
                                            homeId,
                                            authCode
                                        ])
                                });
                            } catch(e) {
                                wemoUtil.infoLog("IFTTT -> TryCatch, msg: " + e);
                            }
                        }, function (err) {
                            wemoUtil.infoLog("IFTTT -> Failure, error: " + err);
                        }, "WebServicePlugin", "getAuthCode", []);
                    } else if (curl.toLowerCase().indexOf('wemo://status=0') >= 0
                               && curl.toLowerCase().indexOf('wemo://status=0') < 10) {
                        iabRef.close();
                        $('.more_tab_icon').show();

                    }

                }

                function iabLoadError(event) {
                    wemoUtil.infoLog('IFTTT -> iabLoadError: ' + event.type + ' - ' + event.message);
                    window.notifier.stop();
                    $('.more_tab_icon').show();
                }

                function iabClose(event) {
                    wemoUtil.infoLog('IFTTT -> iabClose: ' + event.type);
                    window.notifier.stop();
                    $('.more_tab_icon').show();
                    iabRef.removeEventListener('loadstart', iabLoadStart);
                    iabRef.removeEventListener('loadstop', iabLoadStop);
                    iabRef.removeEventListener('loaderror', iabLoadError);
                    iabRef.removeEventListener('exit', iabClose);
                }


                function init(iUrl) {
                    var headerHeight = $('header.main_header').height();
                    wemoUtil.infoLog('IFTTT -> init: ' + headerHeight);
                    nativeUtilPlugin.execute(null, null, actions.IAB_WEMOHEADERHEIGHT, [headerHeight]);
                    iabRef = cordova.InAppBrowser.open(iUrl, '_blank', 'location=no,toolbar=no,hidden=no');
                    iabRef.addEventListener('loadstart', iabLoadStart);
                    iabRef.addEventListener('loadstop', iabLoadStop);
                    iabRef.addEventListener('loaderror', iabLoadError);
                    iabRef.addEventListener('exit', iabClose);
                    $('.more_tab_icon').hide();
                    $('.wemo_logo').on('click', iabClose);
                }
                setTimeout(function(){
                   init(url);
                },100);

            }
        });

       
        
        }
        
         $("#ifttt_remote_activation_failure_popup_btn").on("tap", function () {
            $('#ifttt_remote_activation_failure_popup').popup('close');
             wemoUtil.loadUrl(filePath.MORE_MENU);
        });

        $("#Unable_To_Generate_Pin_btn").on("tap", function () {
            $('#Unable_To_Generate_Pin_popup').popup('close');
        });

        $("#ifttt_network_btn").on("tap", function () {
            $('#ifttt_network_popup').popup('close');
        });
        

        wemoUtil.infoLog(TAG + "onDeviceReady");
        $('#more_connect_to_IFTTT').addClass('none');
        ifttt.bindEvents();
        
        //To return back to home page: device list tab
        $(".backbutton").on("tap", ifttt.onBackPress);
        
        

    },

    bindEvents: function () {
        wemoUtil.infoLog(TAG + "bindEvents");
        document.addEventListener('online', ifttt.onOnline, false);
        document.addEventListener('offline', ifttt.onOffline, false);
        document.addEventListener("backbutton", ifttt.onBackPress, false);
        document.addEventListener("pause", ifttt.onPause, false);
        document.addEventListener("resume", ifttt.onResume, false);
    },

    onOffline: function () {
        wemoUtil.infoLog(TAG + "offLine");
    },

    onOnline: function () {
        wemoUtil.infoLog(TAG + "onLine");
    },

    onBackPress: function () {
        if ($(".more_tab").is(":visible")) {
            $(".more_tab").hide();
            $('body').find('.modalWindow').transition({
                opacity: 0
            }, 400, function () {
                $(this).removeClass('isOpen');
            });
        } else {
            wemoUtil.infoLog(TAG + "onBackPress");
            wemoUtil.loadUrl(filePath.MORE_MENU);
        }
    },

    onPause: function () {
        wemoUtil.infoLog(TAG + "onPause");
    },

    onResume: function () {
        wemoUtil.infoLog(TAG + "onResume");
    },

    reportError: function (e) {
        wemoUtil.infoLog(TAG + "Plugin Error!!!!   " + e);
    },

    showModal: function () {
        nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
    },

    hideModal: function () {
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
    },

    getIftttId: function () {

        ifttt.showModal();

        setTimeout(function () {
            deviceTabPlugin.execute(
                function (responseAry) {
                    wemoUtil.infoLog("res array " + responseAry + " res arr1 " + responseAry[0] + " res arr2 " + responseAry[1] + " res arr3 " + responseAry[2] + " res arr4 " + responseAry[3]);
                    remoteAccess = responseAry[0];
                    homeId = responseAry[3];
                    wemoUtil.infoLog("success call back getIftttId - homeId : " + homeId);

                    if (responseAry[1] && homeId != "" && homeId != null) {
                        wemoUtil.infoLog("calling generateIfftt");
                        wemoUtil.infoLog("isREmote enable :: " + isRemoteEnabled);
                        if (isRemoteEnabled) {
                            if (window.sessionStorage.getItem("device_length") == 0) {
                                $('#Unable_To_Generate_Pin_popup').popup('open');
                            } else {
                                ifttt.generateIftttIdOnCloud();
                                ifttt.hideModal();
                            }
                        } else {
                            deviceTabPlugin.execute(function (deviceList) {
                                if (Object.keys(deviceList).length == 0) {
                                    $('#Unable_To_Generate_Pin_popup').popup('open');
                                } else {
                                    ifttt.generateIftttIdOnCloud();
                                    ifttt.hideModal();
                                }
                                wemoUtil.infoLog("Socket & Sensor & Sort - JSON DATA: " + JSON.stringify(deviceList) + "length " + Object.keys(deviceList).length);
                            }, ifttt.reportError, actions.GET_WEMO_DEVICE_LIST, []);
                        }

                    } else {
                        wemoUtil.infoLog("entering else ifftid");
                        ifttt.hideModal();
                        $('#ifttt_remote_activation_failure_popup').popup('open');
                    }
                    ifttt.hideModal();
                },
                ifttt.reportError,
                actions.GET_REMOTE_ACCESS, []
            );
        }, 100);

    },

    getCurrentFirmware: function () {
        ifttt.showModal();
        setTimeout(function () {
            deviceTabPlugin.execute(
                function (responseAry) {
                    var checkFirmware = true;
                    for (i in responseAry) {
                        var firmwareVar = responseAry[i][key.DEVICE_FIRMWARE];
                        wemoUtil.infoLog("success call back getIftttId - currentFirmware : " + firmwareVar);

                        var firmwareVersion;
                        var splitty = firmwareVar.split('.');

                        if (splitty.length > 2) {
                            firmwareVersion = parseInt(splitty[splitty.length - 2]);
                            wemoUtil.infoLog("success call back getIftttId - Firmware Version : " + firmwareVersion);
                            if (firmwareVersion <= minimumFirmware) {
                                checkFirmware = false;
                                $('#ifttt_network_popup').popup('open');
                                break;
                            }
                        }

                    }

                    if (checkFirmware) {
                        ifttt.getIftttId();
                    }

                    ifttt.hideModal();
                },
                ifttt.reportError,
                actions.GET_CURRENT_FIRMWARE, []
            );
        }, 100);

    },

    generateIftttIdOnCloud: function () {
        cordova.exec(function (params) {
            wemoUtil.infoLog("success call back generateIftttIdOnCloud : ");
            wemoUtil.infoLog("success call URL : " + cloudAPI.GENERATE_IFTTT_PIN + homeId + "/IFTTT");
            var authCode = params[0];
            wemoUtil.infoLog("authCode" + authCode);
            wemoUtil.infoLog("homeId" + homeId);

            ifttt.showModal();

            $.ajax({
                url: cloudAPI.GENERATE_IFTTT_PIN + homeId + "/IFTTT",
                type: "GET",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader('Content-Type', 'application/xml');
                    xhr.setRequestHeader('Authorization', authCode);
                },
                success: function (data) {
                    wemoUtil.infoLog("Sucess from cloud..IFTTT data : " + data);

                    $(data).find('accountActivation').each(function () {
                        activationCode = $(this).find("activationCode").text();
                        window.sessionStorage.setItem("activationCode", activationCode);
                        ifttt.setCurrentTimeForPinGeneration();
                        $(".activation_pin").val(activationCode);
                        wemoUtil.infoLog("IFTTT activation_code : " + activationCode);
                    });

                    ifttt.hideModal();
                },
                error: function (xhr, textstatus) {
                    $('#Unable_To_Generate_Pin_popup').popup('open');
						ifttt.hideModal();
                    wemoUtil.infoLog("Error call back string... ");

                    for (var p in xhr) {
                        wemoUtil.infoLog("Error call back string : " + p + ': ' + xhr[p]);
                    }
                },
                statusCode: {
                    500: function () {
                        alert("page not found");
                    }
                }
            });

        }, function (err) {
            wemoUtil.infoLog("failure call back- getAuthCode...");
        }, "WebServicePlugin", "getAuthCode", []);

    }


};
