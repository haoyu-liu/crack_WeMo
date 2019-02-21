/*
 config_problem.js

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

function ConfigProblem() {
    var TAG = "config_problem.js",
        pageType = window.sessionStorage.getItem("dimmer_page_type");

    var obj = {
        init: function () {
            wemoUtil.infoLog(TAG, "initialize");
            document.addEventListener('deviceready', this.onDeviceReady, false);
        },
        onDeviceReady : function() {
            if (pageType === "mix_bulb_type") {
                $(".descriptionTitle").html(wemo.items["multiBulbTypeHeader"]);
                $(".descriptionContent .mixBulb").show();
                $(".descriptionContent .configFail").hide();
                $(".buttonGroup").hide();

                $(".multi_bulb_back_btn").click(function(){
                     wemoUtil.loadUrl(filePath.SELECT_BULB_TYPE);
                });

                $(".defaultBtn_learnMore").on("click", function(){
                    var link = $(this).data("link");
                    wemoUtil.loadExternalUrl(wemo.items[link]);
                 });

            } else if (pageType === "config_fail") {
                $(".descriptionTitle").html(wemo.items["incompatibleBulb"]);
                $(".descriptionContent .mixBulb").hide();
                $(".descriptionContent .configFail").show();

                $(".skipConfig").click(function(){
                    obj.configureDimmingRange();
                });

                $(".tryAgain").click(function(){
                    obj.loadBulbConfig();
                });

                $(".bulbComapatibility_Fail").on("click", function(){
                   var link = $(this).data("link");
                   wemoUtil.loadExternalUrl(wemo.items[link]);
                 });
            }

             $(".dimmerSetupContainer").show();
             obj.bindEvents();
        },
        loadBulbConfig: function() {
            wemoUtil.loadUrl(filePath.SELECT_BULB_TYPE);
        },
        loadIndexPage: function() {
            wemoUtil.loadUrl(filePath.INDEX);
        },
        loadEmailOptIn: function() {
            wemoUtil.loadUrl(filePath.EMAIL_OPT_IN);
        },
        configureDimmingRange: function() {
            nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);

            var udn = window.sessionStorage.getItem("device_udn");
            var information = {
                "udn" : udn,
                "bulbType" : "CFL"
            };

            SmartDevicePlugin.execute(
                function(presetVal){
                    nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                    DEBUG && console.log("Bulb Preset : turnOnLevel : " +  presetVal.turnOnLevel + " : maxLevel : " + presetVal.maxLevel + " : minLevel : " +  presetVal.minLevel);
                    //level range 1-255
                    window.sessionStorage.setItem("dimmer_turnOnLevel", presetVal.turnOnLevel);
                    window.sessionStorage.setItem("dimmer_maxLevel", presetVal.maxLevel);
                    window.sessionStorage.setItem("dimmer_minLevel", presetVal.minLevel);
                    obj.loadDimmerSetupPage();
                },
                obj.reportError,
                actions.SET_BULB_TYPE, [information]
            );
        },
        loadDimmerSetupPage: function() {
            var storedEmail = window.sessionStorage.getItem('storedEmail');
            if(storedEmail !== ""){
                wemoUtil.infoLog(TAG, "Loading index");
                obj.loadIndexPage();
            } else {
                wemoUtil.infoLog(TAG, "Loading E-Mail Opt-In");
                obj.loadEmailOptIn();
            }
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
            if (pageType === "mix_bulb_type") {
                wemoUtil.loadUrl(filePath.SELECT_BULB_TYPE);
            } else {
                window.sessionStorage.clear();
                setupPlugin.execute(null, null, actions.STOP_UPNP_SERVICE, []);
                navigator.app.exitApp();
            }
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
    var configProblemPage = new ConfigProblem();
    configProblemPage.init();
});