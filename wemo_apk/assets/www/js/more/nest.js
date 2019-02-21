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

var TAG = "nest.js: ";
var homeId;
var activationCode;

$(document).bind('pageinit', function () {
    nest.initialize();
});

var iabRef = null;
var nestAuthStatus = -1;
var processNestAuth = 0;
var nestDeauthStatus = -1;
var processNestDeauth = 0;

var nest = {
        initialize: function () {
            nest.nests = [];
            nest.authState = false;
            nest.didDeauth = false;

            wemoUtil.infoLog(TAG + "initialize");
            document.addEventListener('deviceready', this.onDeviceReady, false);
            nest.isRemoteEnabled = window.sessionStorage.getItem("isRemoteEnabled");

            if (!window.smartDevicePlugin) {
                window.smartDevicePlugin = {};
            }
            var windowListeners = {
                onDeviceUpdated: function (str) {
                    var resp = JSON.parse(str),
                        nestDevices = JSON.parse(window.localStorage.getItem("NEST_DEVICES"));

                    if (resp.information.productType === "NestThermostat" && (nest.nests.indexOf(resp.information.udn) < 0)) {
                        $(".no-nests").hide();
                        $(".nests-available").show();
                        nest.nests.push(resp.information.udn);
                        if ((nestDevices != null)) {
                            if (nestDevices.indexOf(resp.information.udn) < 0) {
                                window.localStorage.setItem('NEST_DEVICES', JSON.stringify(nest.nests));
                                var html = "<li><div class='friendly-name'>" + resp.properties.friendlyName + "</div><div class='structure-name'>" + resp.information.parentName + "</div>";
                                $(".nest-devices__list ul").append(html);
                            }
                        } else {
                            window.localStorage.setItem('NEST_DEVICES', JSON.stringify(nest.nests));
                            $(".nest-devices__list ul").html("");
                            var html = "<li><div class='friendly-name'>" + resp.properties.friendlyName + "</div><div class='structure-name'>" + resp.information.parentName + "</div>";
                            $(".nest-devices__list ul").append(html);
                        }
                    }
                },
                onDeviceRemoved: function (resp) {
                    console.log("Device Removed:");
                    console.log(resp);
                },
                onNestDeauth: function (status) {
                    if (nest.didDeauth) {
                        nestDeauthStatus = status;
                        if (status === "200") {
                            cordova.exec(null, null, plugins.SMART_DEVICE_PLUGIN, "refreshDevices", []);
                            $(window).trigger("change:view", ['.connect-to-nest', 'deauth-success']);
                            window.sessionStorage.setItem("nest_auth", "403");
                            window.sessionStorage.removeItem("hasNest");
                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                            nest.nests = [];
                            window.localStorage.setItem('NEST_DEVICES', null);
                            $(".nest-devices__list ul").html("");
                        } else if (status === "403") {
                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                            $(window).trigger("change:view", ['.connected-to-nest', 'deauth-failed']);
                        }
                    } else {
                        $(window).trigger("change:view", ['.connect-to-nest']);
                        cordova.exec(null, null, plugins.SMART_DEVICE_PLUGIN, "refreshDevices", []);
                        $('#nest_deauth_popup').popup('open');
                    }
                },
                onCheckNestAuth: function(status){
                    nest.authState = true;
                    nestAuthStatus = status;
                    if(status === "200"){
                        cordova.exec(null, null, plugins.SMART_DEVICE_PLUGIN, actions.GET_NEST_DEVICES, []);
                        $(window).trigger("change:view", [".connected-to-nest", "connected"]);
                        setTimeout(function () {
                            if (nest.nests.length === 0) {
                                $(".no-nests").show();
                                $(".nests-available").hide();
                            }
                        }, 1000);
                        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                    }  else {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                        $(window).trigger("change:view", ['.connect-to-nest']);
                    }

                }
            };

            $(window).on("change:view", this.loadView);

            _.extend(window.smartDevicePlugin, windowListeners);
        },
        utf8_to_b64: function (str) {
            return window.btoa(str);
        },

        loadView: function (e, el, state) {
            $(".activeView").removeClass("activeView");
            $(el).addClass("activeView");
            if (state) {
                $(el).attr("data-state", state);
            }
        },

        onDeviceReady: function () {
            nest.bindEvents();

            $(".backbutton").on("tap", nest.onBackPress);
            cordova.exec(null, null, plugins.SMART_DEVICE_PLUGIN, actions.GET_NEST_AUTH_STATUS, []);
            nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);

            setTimeout(function(){
                processNestAuth = setInterval(function(){
                    if(nestAuthStatus == -1){
                        //call back didn't come back or no nest in this home
                        nativeUtilPlugin.execute(
                            function(status){
                                if(status === 200){
                                    cordova.exec(null, null, plugins.SMART_DEVICE_PLUGIN, actions.GET_NEST_DEVICES, []);
                                    $(window).trigger("change:view", [".connected-to-nest", "connected"]);
                                    setTimeout(function () {
                                        if (nest.nests.length === 0) {
                                            $(".no-nests").show();
                                            $(".nests-available").hide();
                                        }
                                    }, 1000);
                                } else {
                                    $(window).trigger("change:view", ['.connect-to-nest']);
                                }
                                nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                //Re-setting the flag to -1
                                nestAuthStatus = -1;
                                nativeUtilPlugin.execute(
                                    function(){
                                        wemoUtil.infoLog(TAG, "PREF_SET_NEST_CALLBACK_STATUS success call back");
                                    },
                                    nest.reportError,
                                    actions.PREF_SET_NEST_CALLBACK_STATUS,
                                    [-1]
                                );
                                clearInterval(processNestAuth);

                            },
                            nest.reportError,
                            actions.PREF_GET_NEST_CALLBACK_STATUS, []
                        );
                    } else {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                        //Callback reached here fine.
                        //Re-setting the flag to -1
                        nestAuthStatus = -1;
                        nativeUtilPlugin.execute(
                            function(){
                                wemoUtil.infoLog(TAG, "PREF_SET_NEST_CALLBACK_STATUS success call back");
                            },
                            nest.reportError,
                            actions.PREF_SET_NEST_CALLBACK_STATUS,
                            [-1]
                        );
                        clearInterval(processNestAuth);
                    }
                }, 2000);
            },5000);

            setTimeout(function(){
                if(!nest.authState){
                    $(window).trigger("change:view", ['.connect-to-nest']);
                }
            },2000);

            $("#deauth_btn").on("tap", function () {
                $('#nest_deauth_confirm_popup').popup('open');
            });

            $(".nest_deauth_confirm").on('tap', function () {
                window.sessionStorage.removeItem("hasNest");
                nestDeauthStatus = -1;
                cordova.exec(null, null, plugins.SMART_DEVICE_PLUGIN, actions.DEAUTHORIZE_NEST, []);
                nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
                nest.didDeauth = true;
                $('#nest_deauth_confirm_popup').popup('close');

                setTimeout(function(){
                    processNestDeauth = setInterval(function(){
                        if(nestDeauthStatus == -1){
                            //call back didn't comeback
                            if (nest.didDeauth) {
                                nativeUtilPlugin.execute(
                                    function(status){
                                        if (status === 200) {
                                            cordova.exec(null, null, plugins.SMART_DEVICE_PLUGIN, "refreshDevices", []);
                                            $(window).trigger("change:view", ['.connect-to-nest', 'deauth-success']);
                                            window.sessionStorage.setItem("nest_auth", "403");
                                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                            nest.nests = [];
                                            window.localStorage.setItem('NEST_DEVICES', null);
                                            $(".nest-devices__list ul").html("");
                                        } else if (status === 403) {
                                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                            $(window).trigger("change:view", ['.connected-to-nest', 'deauth-failed']);
                                        }
                                    },
                                    nest.reportError,
                                    actions.PREF_GET_NEST_DEAUTH_CALLBACK_STATUS, []
                                );

                            } else {
                                nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                $(window).trigger("change:view", ['.connect-to-nest']);
                                cordova.exec(null, null, plugins.SMART_DEVICE_PLUGIN, "refreshDevices", []);
                                $('#nest_deauth_popup').popup('open');
                            }
                            //Re-setting the flag to -1
                            nestDeauthStatus = -1;
                            nativeUtilPlugin.execute(
                                function(){
                                    wemoUtil.infoLog(TAG, "PREF_SET_NEST_DEAUTH_CALLBACK_STATUS success call back");
                                },
                                nest.reportError,
                                actions.PREF_SET_NEST_DEAUTH_CALLBACK_STATUS,
                                [-1]
                            );
                            clearInterval(processNestDeauth);

                        } else {
                            //Callback reached here fine.
                            //Re-setting the flag to -1
                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                            nestDeauthStatus = -1;
                            nativeUtilPlugin.execute(
                                function(){
                                    wemoUtil.infoLog(TAG, "PREF_SET_NEST_DEAUTH_CALLBACK_STATUS success call back");
                                },
                                nest.reportError,
                                actions.PREF_SET_NEST_DEAUTH_CALLBACK_STATUS,
                                [-1]
                            );
                            clearInterval(processNestDeauth);
                        }
                    }, 2000);
                },5000);
            });

            $(".nest_deauth_cancel").on('tap', function () {
                $('#nest_deauth_confirm_popup').popup('close');
            });


            $("#connect_btn").on("tap", function () {
                if (nest.isRemoteEnabled == "false") {
                    $('#nest_remote_activation_failure_popup').popup('open');
                } else {
                    $("body").scrollTop(0);
                    cordova.exec(
                        function (resp) {
                            var auth = resp[0].replace(/SDU/, "").trim(),
                                base64Auth = encodeURIComponent(nest.utf8_to_b64(auth)),
                                homeId = resp[1],
                                apiURL = cloud + "/apis/http/oauth2/v1/subscriber/authorizeExt/NestThermostat-ny/" + homeId + "?ah=" + base64Auth;
                            setTimeout(function(){
                               nest.iabInit(apiURL);
                            },100)

                        },
                        function (err) {
                            console.log("Error Getting Authorization Code: ");
                            console.log(err);
                        },
                        "WebServicePlugin", "getAuthCode", []);
                }
            });

            $(".settings").on("tap click touchstart", function () {
                    wemoUtil.loadUrl(filePath.REMOTE_ACCESS_MORE);
            });

            $(".cancel").on("tap click touchstart", function () {
                $('#nest_remote_activation_failure_popup').popup('close');
            });

            $(".nest_popup_btn").on("tap", function () {
                $('#nest_deauth_popup').popup('close');
            });

            $(".nest_transfer_confirm").on('tap', function () {
                cordova.exec(
                    function (resp) {
                        var auth = resp[0],
                            homeId = resp[1],
                            transferCode = window.sessionStorage.getItem('nest_transfer_code'),
                            apiURL = cloud + "/apis/http/oauth2/v1/subscriber/access/xfer/" + homeId + "?state=" + transferCode;


                        $("#nest_transfer_popup").popup("close");
                        $.ajax({
                            url: apiURL,
                            method:"GET",
                            statusCode: {
                                0:function(){
                                    cordova.exec(null, null, plugins.SMART_DEVICE_PLUGIN, actions.GET_NEST_DEVICES, []);
                                    $(window).trigger("change:view", [".connected-to-nest", "connected"]);
                                }
                            },
                            headers:{
                                "Content-Type": "application/xml",
                                "Authorization": auth
                            }
                        });
                    },
                    function (err) {
                        console.log("Error Getting Authorization Code: ");
                        console.log(err);
                    },
                    "WebServicePlugin", "getAuthCode", []);
            });

            $(".nest_transfer_cancel").on('tap', function () {
                $("#nest_transfer_popup").popup("close");
            });

        },

        iabLoadStart: function (event) {

            console.log('Nest -> iabLoadStart: ');
            console.log(event);
            //window.notifier.start();

            if (event.url.indexOf("wemo://status") > 0) {
                var urlArray = event.url.split("="),
                    status = urlArray[1];
                if (status === "0") {
                    iabRef.close();
                    window.sessionStorage.setItem("nest_was_authorized", status);
                    cordova.exec(null, null, plugins.SMART_DEVICE_PLUGIN, "refreshDevices", []);
                    $(window).trigger("change:view", [".connected-to-nest", "connected"]);
                } else {
                    iabRef.close();
                    $("#nest_transfer_popup").popup("open");
                    window.sessionStorage.setItem("nest_transfer_code", status);
                }
            }
        },

        /*iabLoadStop: function (event) {
            console.log('Nest -> iabLoadStop: ');
            console.log(event);
            window.notifier.stop();

        },*/

        iabLoadError: function (event) {
            console.log('Nest -> iabLoadError: ' + event.type + ' - ' + event.message);
            if (event.message !== "net::ERR_UNKNOWN_URL_SCHEME") {
                //window.notifier.stop();
                iabRef.close();
                $(window).trigger("change:view", [".connect-to-nest", "error"]);
            }

            //Forcing KITKAT or lower to not get stuck with an error message view.
            if(event.message == "net::ERR_UNKNOWN_URL_SCHEME"){
                wemoUtil.infoLog(TAG + "NEST authorization error on KITKAT OR LOWER");
                //window.notifier.stop();
                iabRef.close();
                //$(window).trigger("change:view", [".connected-to-nest", "connected"]);
            }

        },

        iabClose: function (event) {
            wemoUtil.infoLog('Nest -> iabClose: ' + event.type);
            //window.notifier.stop();
            $('.more_tab_icon').show();
            iabRef.removeEventListener('loadstart', nest.iabLoadStart);
            //iabRef.removeEventListener('loadstop', nest.iabLoadStop);
            iabRef.removeEventListener('loaderror', nest.iabLoadError);
            iabRef.removeEventListener('exit', nest.iabClose);
        },


        iabInit: function (iUrl) {
            var headerHeight = $('header.main_header').height();
            wemoUtil.infoLog('Nest -> init: ' + headerHeight);
            nativeUtilPlugin.execute(null, null, actions.IAB_WEMOHEADERHEIGHT, [headerHeight]);
            /*window.notifier = {
                flag: false,
                start: function () {
                    if (!window.notifier.flag) {
                        window.notifier.flag = true;
                        nest.showModal()
                    }
                },
                stop: function () {
                    window.notifier.flag = false;
                    nest.hideModal();
                }
            };*/
            iabRef = cordova.InAppBrowser.open(iUrl, '_blank', 'location=no,toolbar=no');
            iabRef.addEventListener('loadstart', nest.iabLoadStart);
            //iabRef.addEventListener('loadstop', nest.iabLoadStop);
            iabRef.addEventListener('loaderror', nest.iabLoadError);
            iabRef.addEventListener('exit', nest.iabClose);
            $('.more_tab_icon').hide();
            $('.main_header').addClass("closeIAB");
        },


        bindEvents: function () {
            wemoUtil.infoLog(TAG + "bindEvents");
            document.addEventListener('online', this.onOnline, false);
            document.addEventListener('offline', this.onOffline, false);
            document.addEventListener("backbutton", this.onBackPress, false);
            document.addEventListener("pause", this.onPause, false);
            document.addEventListener("resume", this.onResume, false);
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
        }

    };
