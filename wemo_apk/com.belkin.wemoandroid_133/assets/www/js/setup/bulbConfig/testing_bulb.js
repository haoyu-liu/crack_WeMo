/*
 testing_bulb.js

 Created by Belkin International, Software Engineering on 10/04/2013.
 Copyright (c) 2016 Belkin International, Inc. and/or its affiliates. All rights reserved.

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

function TestingBulb() {
    var TAG = "testing_bulb.js",
        pageType = window.sessionStorage.getItem("dimmer_page_type"),
        bulbOnTimeout = setTimeout(function(){}, 0),
        uiDelay = setTimeout(function(){}, 0);

    var obj = {
        init: function () {
            wemoUtil.infoLog(TAG, "initialize");
            document.addEventListener('deviceready', this.onDeviceReady, false);
        },
        onDeviceReady : function() {
            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
            var time = new Date().getTime();
            $(".flashingIcon").css("background-image", "url(../../img/bulbSetup/SpinningGears.gif?"+ time +")");
            if (pageType === "test_turn_on") {
                obj.testBulbTurnOn();

                $(".descriptionTitle").html(wemo.items["bulbTurnOnQuestion"]);

                $(".needHelpButton").click(function(){
                    window.sessionStorage.setItem("dimmer_page_type", "config_turn_on_level");
                    obj.loadCalibratePage()
                });

                $(".confirmButton").click(function(){
                    obj.loadDimTestSummaryPage();
                });

                $(".testAgain").click(function(){
                    $(".testingText").show();
                    $(".bulbConfirmBtn").css("visibility", "hidden");
                    $(".bulbConfirmHeader").css("visibility", "hidden");
                    var time = new Date().getTime();
                    $(".flashingIcon").css("background-image", "url(../../img/bulbSetup/SpinningGears.gif?"+ time +")");

                    obj.testBulbTurnOnAgain();
                });

            } else if (pageType === "test_dimming") {
                obj.testBulbDimUp();

                $(".descriptionTitle").html(wemo.items["bulbDimUpQuestion"]);

                $(".needHelpButton").click(function(){
                    window.sessionStorage.setItem("dimmer_page_type", "config_max_level");
                    obj.loadCalibratePage()
                });

                $(".confirmButton").click(function(){
                    obj.loadTestCompletedPage();
                });


                $(".testAgain").click(function(){
                    $(".testingText").show();
                    $(".bulbConfirmBtn").css("visibility", "hidden");
                    $(".bulbConfirmHeader").css("visibility", "hidden");
                    var time = new Date().getTime();
                    $(".flashingIcon").css("background-image", "url(../../img/bulbSetup/SpinningGears.gif?"+ time +")");

                    obj.testBulbDimUp();
                });
            }

            $(".dimmerSetupContainer").show();
            obj.bindEvents();
        },
        testBulbTurnOn: function(){
            var udn = window.sessionStorage.getItem("device_udn"),
                turnOnLevel = window.sessionStorage.getItem("dimmer_turnOnLevel");

            var information = {
                "udn" : udn,
                "binaryState": "1",
                "level" : turnOnLevel
            };

           SmartDevicePlugin.execute(
                function(){
                    wemoUtil.infoLog(TAG,"Bulb Turned on.");

                    clearTimeout(uiDelay);
                    uiDelay = setTimeout(function(){
                        $(".bulbConfirmHeader").css("visibility", "visible");
                        $(".bulbConfirmBtn").css("visibility", "visible");
                        $(".testingText").hide();
                    }, 2000);

                    clearTimeout(bulbOnTimeout);
                    bulbOnTimeout = setTimeout(function(){
                        obj.turnOffBulb();
                    }, 20000);
                },
                obj.reportError,
                actions.CALIBRATE_BULB, [information]
            );
        },

        turnOffBulb: function() {
            var udn = window.sessionStorage.getItem("device_udn");
            var information = {
                "udn" : udn,
                "binaryState" : "0"
            };

           SmartDevicePlugin.execute(
                function(){
                    wemoUtil.infoLog(TAG, "Bulb Turned off.");
                },
                obj.reportError,
                actions.CALIBRATE_BULB, [information]
            );
        },

        testBulbTurnOnAgain: function(){
            var udn = window.sessionStorage.getItem("device_udn");
            var information = {
                "udn" : udn,
                "binaryState" : "0"
            };

           SmartDevicePlugin.execute(
                function(){
                    wemoUtil.infoLog(TAG, "Bulb Turned off.");
                    obj.testBulbTurnOn();
                },
                obj.reportError,
                actions.CALIBRATE_BULB, [information]
            );
        },

        testBulbDimUp: function() {
            var udn = window.sessionStorage.getItem("device_udn"),
                maxLevel = window.sessionStorage.getItem("dimmer_maxLevel"),
                minLevel = window.sessionStorage.getItem("dimmer_minLevel");


            var information = {
                "udn": udn,
                "binaryState": "1",
                "level": minLevel,
                "fader": "4:"+maxLevel
            };

           SmartDevicePlugin.execute(
                function(){
                    wemoUtil.infoLog(TAG,"Bulb Dimmed Up.");

                    clearTimeout(uiDelay);
                    uiDelay = setTimeout(function(){
                        $(".bulbConfirmBtn").css("visibility", "visible");
                        $(".bulbConfirmHeader").css("visibility", "visible");
                        $(".testingText").hide();
                    }, 2000);

                    clearTimeout(bulbOnTimeout);
                    bulbOnTimeout = setTimeout(function(){
                        obj.turnOffBulb();
                    }, 20000);
                },
                obj.reportError,
                actions.CALIBRATE_BULB, [information]
            );
        },
        loadCalibratePage: function() {
            var turnOnTestLoad = parseInt(window.sessionStorage.getItem("turn_on_test_load")),
                dimmingTestLoad = parseInt(window.sessionStorage.getItem("dimming_test_load"));

              if (turnOnTestLoad < 3 && dimmingTestLoad < 3) {
                wemoUtil.loadUrl(filePath.BULB_CALIBRATE);
            } else {
               window.sessionStorage.setItem("dimmer_page_type", "config_fail");
               wemoUtil.loadUrl(filePath.CONFIG_PROBLEM);
            }
        },
        loadDimTestSummaryPage: function() {
            window.sessionStorage.setItem("dimmer_page_type", "start_test_dimming");
            wemoUtil.loadUrl(filePath.TEST_SUMMARY);
        },
        loadTestCompletedPage: function() {
            window.sessionStorage.setItem("dimmer_page_type", "bulb_config_complete");
            wemoUtil.loadUrl(filePath.TEST_SUMMARY);
        },
        bindEvents: function() {
            wemoUtil.infoLog(TAG, "bindEvents");
            document.addEventListener('online', this.onOnline, false);
            document.addEventListener('offline', this.onOffline, false);
            document.addEventListener("backbutton", this.onBackPress, false);
            document.addEventListener("pause", this.onPause, false);
            document.addEventListener("resume", this.onResume, false);
        },

        onOffline: function() {
             wemoUtil.infoLog(TAG, "offLine");
        },

        onOnline: function() {
             wemoUtil.infoLog(TAG, "onLine");
        },

        onBackPress: function() {
            wemoUtil.infoLog(TAG, "onBackPress");
            window.sessionStorage.clear();
            setupPlugin.execute(null, null, actions.STOP_UPNP_SERVICE, []);
            navigator.app.exitApp();
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
     }
    return obj;
};


$(document).bind('pageinit', function () {
    var testingBulbPage = new TestingBulb();
    testingBulbPage.init();
});