/*
 select_bulb_type.js

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



function SelectBulbType() {
    var TAG = "select_bulb_type.js",
        bulbtype = "LED";
    var obj = {
        init: function () {
            wemoUtil.infoLog(TAG, "initialize");
            document.addEventListener('deviceready', this.onDeviceReady, false);
        },
        onDeviceReady : function() {
            $(".dimmerSetupContainer").show();
            obj.loadBulbSlides();
            obj.bindEvents();

            $(".nextButton").click(function(){
                obj.saveBulbType();
                obj.loadTestSummary();
            });

            $(".mixBulbTypesIntro").click(function(){
                obj.loadConfigProblemPage();
            });

        },
        loadBulbSlides: function() {
          $(".chooseBulb").slick({
                centerMode: true,
                centerPadding: '0px',
                slidesToShow: 3,
                infinite: false,
                initialSlide: 1
              });
        },
        saveBulbType: function() {
            nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
            var newBulbType = $(".chooseBulb .slick-current").data("bulbtype");
            if (newBulbType) {
               bulbtype = newBulbType;
            }

            wemoUtil.infoLog(TAG, "Bulb Type : " + bulbtype);
            var udn = window.sessionStorage.getItem("device_udn");
            var information = {
                "udn" : udn,
                "bulbType" : bulbtype
            };

            window.sessionStorage.setItem("dimmer_bulb_type", bulbtype);
            SmartDevicePlugin.execute(
                function(presetVal){
                    nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                    if (presetVal && presetVal.turnOnLevel) {
                        DEBUG && console.log("Bulb Preset : turnOnLevel : " +  presetVal.turnOnLevel + " : maxLevel : " + presetVal.maxLevel + " : minLevel : " +  presetVal.minLevel);
                        //level range 1-255
                        window.sessionStorage.setItem("dimmer_turnOnLevel", presetVal.turnOnLevel);
                        window.sessionStorage.setItem("dimmer_maxLevel", presetVal.maxLevel);
                        window.sessionStorage.setItem("dimmer_minLevel", presetVal.minLevel);
                    }
                    obj.loadTestSummary();
                },
                obj.reportError,
                actions.SET_BULB_TYPE, [information]
            );
        },
        loadConfigProblemPage: function() {
            window.sessionStorage.setItem("dimmer_page_type", "mix_bulb_type");
            wemoUtil.loadUrl(filePath.CONFIG_PROBLEM);
        },
        loadTestSummary : function() {
            window.sessionStorage.setItem("dimmer_page_type", "start_test_turn_on");
            window.sessionStorage.setItem("turn_on_test_load", 0);
            window.sessionStorage.setItem("dimming_test_load", 0);
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
            setupPlugin.execute(null, null, ACTION_STOP_UPNP_SERVICE, []);
            navigator.app.exitApp();
        },

        onPause: function() {
            wemoUtil.infoLog(TAG, "onPause");
        },

        onResume: function() {
             wemoUtil.infoLog(TAG, "onResume");
             wemoUtil.loadUrl(filePath.INDEX);
        },

        reportError: function(e) {
             wemoUtil.infoLog(TAG, "Plugin Error!!!!   " + e);
        }
     }
    return obj;
};


 $(document).bind('pageinit', function () {
     var selectBulbTypePage = new SelectBulbType();
     selectBulbTypePage.init();
 });
