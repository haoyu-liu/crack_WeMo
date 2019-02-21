/*
 test_summary.js

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

function TestSummary() {
    var TAG = "test_summary.js",
        pageType = window.sessionStorage.getItem("dimmer_page_type");

    var obj = {
        init: function () {
            wemoUtil.infoLog(TAG, "initialize");
            document.addEventListener('deviceready', this.onDeviceReady, false);
        },
        onDeviceReady : function() {
            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
            if (pageType === "start_test_turn_on") {
                obj.turnOffBulb();

                $(".descriptionTitle").html(wemo.items["testOnHeader"]);
                $(".descriptionSubTitle").html(wemo.items["testOnPrompt"]);

                var pageLoad = parseInt(window.sessionStorage.getItem("turn_on_test_load")) + 1;
                window.sessionStorage.setItem("turn_on_test_load", pageLoad);

                $(".nextBtn").click(function(){
                    window.sessionStorage.setItem("dimmer_page_type", "test_turn_on");
                    obj.loadTestingBulbPage();
                });

            } else if (pageType === "start_test_dimming") {
                obj.turnOffBulb();

                $(".descriptionTitle").html(wemo.items["testDimmingHeader"]);
                $(".descriptionSubTitle").html(wemo.items["testDimmingPrompt"]);
                $(".bulbSetupIcon").removeClass("testingTurnOnIcon").addClass("testingDimIcon");

                var pageLoad = parseInt(window.sessionStorage.getItem("dimming_test_load")) + 1;
                window.sessionStorage.setItem("dimming_test_load", pageLoad);

                $(".nextBtn").click(function(){
                    window.sessionStorage.setItem("dimmer_page_type", "test_dimming");
                    obj.loadTestingBulbPage();
                });

             } else if (pageType === "bulb_config_complete") {
                $(".descriptionTitle").html(wemo.items["setupSuccessHeader"]);
                $(".descriptionSubTitle").hide();
                $(".nextBtn").html(wemo.items["Done"]);
                $(".sub").show();
                var bulbType = window.sessionStorage.getItem("dimmer_bulb_type").toLowerCase();
                $(".bulbSetupIcon").removeClass("testingTurnOnIcon").addClass("testCompleteIcon")
                                   .addClass(bulbType);

                $(".nextBtn").click(function(){
                    obj.configureDimmingRange();
                });
            }

            $(".dimmerSetupContainer").show();
            obj.bindEvents();
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
                    nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                },
                obj.reportError,
                actions.CALIBRATE_BULB, [information]
            );

        },
        configureDimmingRange: function() {
            nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);

            var udn = window.sessionStorage.getItem("device_udn"),
                turnOnLevel = window.sessionStorage.getItem("dimmer_turnOnLevel"),
                maxLevel = window.sessionStorage.getItem("dimmer_maxLevel"),
                minLevel = window.sessionStorage.getItem("dimmer_minLevel");

            var information = {
                "udn" : udn,
                "turnOnLevel" : turnOnLevel,
                "maxLevel" : maxLevel,
                "minLevel" : minLevel
            };

            SmartDevicePlugin.execute(
                null,
                obj.reportError,
                actions.CONFIGURE_DIMMING_RANGE, [information]
            );

            var storedEmail = window.sessionStorage.getItem('storedEmail');
            if(storedEmail !== ""){
                wemoUtil.infoLog(TAG, "Loading index");
                obj.loadIndexPage();
            } else {
                wemoUtil.infoLog(TAG, "Loading E-Mail Opt-In");
                obj.loadEmailOptIn();
            }
        },
        loadTestingBulbPage : function() {
            wemoUtil.loadUrl(filePath.TESTING_BULB);
        },
        loadIndexPage: function() {
            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
            wemoUtil.loadUrl(filePath.INDEX);
        },
        loadEmailOptIn: function(){
            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
            wemoUtil.loadUrl(filePath.EMAIL_OPT_IN);
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
             nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        }
     }
    return obj;
};


$(document).bind('pageinit', function () {
    var testSummaryPage = new TestSummary();
    testSummaryPage.init();
});