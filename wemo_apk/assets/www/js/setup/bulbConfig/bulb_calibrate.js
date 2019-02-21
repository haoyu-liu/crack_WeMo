/*
 bulb_calibrate.js

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

function BulbCalibrate() {
    var TAG = "bulb_calibrate.js",
        pageType = window.sessionStorage.getItem("dimmer_page_type");

    var updateColor = "#73d44c",
        startColor = "#9B9B9B",
        start = 0,
        turnOnLevel,
        maxLevel,
        minLevel;

    var obj = {
        init: function () {
            wemoUtil.infoLog(TAG, "initialize");
            document.addEventListener('deviceready', this.onDeviceReady, false);
        },
        onDeviceReady: function(){

            if (pageType === "config_turn_on_level") {
                $(".descriptionTitle").html(wemo.items["configOnHeader"]);
                $(".descriptionSubTitle").html(wemo.items["configOnIntro"]);
                obj.renderCircle(start, 0, startColor, updateColor);
                obj.testBrightness(0);

                turnOnLevel = 0;
                $(".minusBtn").hide();

                $(".plusBtn").click(function(){
                    obj.increaseBrightness();
                });

                $(".refreshBtn").click(function(){
                    obj.refreshBrightness();
                });

                $(".testBtn").click(function(){
                    window.sessionStorage.setItem("dimmer_page_type", "start_test_turn_on");
                    window.sessionStorage.setItem("dimmer_turnOnLevel", turnOnLevel);
                    obj.loadTestSummaryPage();
                });

            } else if (pageType === "config_max_level") {
                $(".descriptionTitle").html(wemo.items["configCeilingHeader"]);
                $(".descriptionSubTitle").html(wemo.items["configCeilingIntro"]);
                $(".descriptionSubTitle2").html(wemo.items["configCeilingIntro2"]);

                maxLevel = parseInt(window.sessionStorage.getItem("dimmer_turnOnLevel"));
                start = Math.ceil(maxLevel/4);
                updateColor = "#F5A623";

                $(".refreshBtn").hide();
                $(".dialCircle").addClass("updateDimming");

                obj.renderCircle(start, start-1, startColor, updateColor);
                obj.testBrightness(maxLevel);

                $(".plusBtn").click(function(){
                    obj.increaseBrightness();
                });

                $(".minusBtn").click(function(){
                    obj.reduceBrightness();
                });

                $(".testBtn").click(function(){
                    obj.loadMinConfigPage();
                });


            } else if (pageType === "config_min_level") {
                $(".descriptionTitle").html(wemo.items["configFloorHeader"]);
                $(".descriptionSubTitle").html(wemo.items["configFloorIntro"]);
                $(".dialCircle").addClass("updateDimming");
                $(".plusBtn").hide();

                updateColor = "#4A90E2";
                minLevel = parseInt(window.sessionStorage.getItem("dimmer_turnOnLevel"));
                start =  Math.floor(parseInt(minLevel)/4);

                obj.renderCircle(start, start, startColor, updateColor);
                obj.testBrightness(minLevel);

                $(".minusBtn").click(function(){
                    obj.reduceBrightness();
                });

                $(".refreshBtn").click(function(){
                    obj.refreshBrightness();
                });

                $(".testBtn").click(function(){
                     window.sessionStorage.setItem("dimmer_page_type", "start_test_dimming");
                     window.sessionStorage.setItem("dimmer_minLevel", minLevel+4);
                     obj.loadTestSummaryPage();
                });

            }

            $(".plusBtn").on("touchstart", function(e){
                obj.fastIncrease(e);
            });

            $(".plusBtn").on("touchend", function(e){
                obj.fastIncrease(e);
            });

            $(".minusBtn").on("touchstart", function(e){
                obj.fastDecrease(e);
            });

            $(".minusBtn").on("touchend", function(e){
                obj.fastDecrease(e);
            });


            $(".dimmerSetupContainer").show();
            obj.bindEvents();

        },
        renderCircle: function(start, update, startColor, updateColor) {
            var stage = document.querySelector('.dialCircle'),
                plots = 73,
                increase = Math.PI * 2 / 73,
                angle = 90,
                x = 0,
                y = 0;

            for( var i = 0; i < plots; i++ ) {
                var p = new Plot( stage );

                p.setDimensions( 4, 16);
                x = 100 * Math.cos( angle ) + 100;
                y = 100 * Math.sin( angle ) + 100;
                p.rotate(Math.atan2( y - 100, x - 100 ) * 180 / Math.PI + 90 + 'deg');
                if ( i > 63) {
                    p.hide();
                } else {
                    p.position( x, y );
                }

                if (pageType === "config_min_level") {
                    if (i < 64 && i > start - 1) {
                        p.setBackground( startColor);
                    } else if (i < start + 1 && i > update - 1) {
                        p.setBackground(updateColor);
                    } else {
                        p.setBackground("#e1e1e1");
                    }
                } else {
                    if (i < start) {
                        p.setBackground( startColor);
                    } else if (i > start - 1 && i < update) {
                        p.setBackground(updateColor);
                    } else {
                        p.setBackground("#e1e1e1");
                    }
                }

                angle += increase;
            }

        },
        increaseBrightness: function() {
            $(".dialCircle").html("");

            if (pageType === "config_turn_on_level") {

                turnOnLevel = turnOnLevel + 4;
                turnOnLevel = (turnOnLevel > 255 ) ? 255 : turnOnLevel;

                obj.renderCircle(start, Math.ceil(turnOnLevel / 4), startColor, updateColor);
                obj.testBrightness(turnOnLevel);

            } else if (pageType === "config_max_level") {
                maxLevel = maxLevel + 4;
                maxLevel = (maxLevel > 255 ) ? 255 : maxLevel;

                obj.renderCircle(start, Math.ceil(maxLevel / 4), startColor, updateColor);
                obj.testBrightness(maxLevel);

            }
        },
        reduceBrightness: function() {

            if (pageType === "config_max_level") {
                var minMaxLevel = parseInt(window.sessionStorage.getItem("dimmer_turnOnLevel"));
                if (maxLevel > minMaxLevel) {
                    maxLevel = maxLevel - 4;
                    maxLevel = (maxLevel > 0 ) ? maxLevel : 0;
                    $(".dialCircle").html("");
                    obj.renderCircle(start, Math.ceil(maxLevel / 4), startColor, updateColor);
                    obj.testBrightness(maxLevel);
                }
            } else if (pageType === "config_min_level") {
                var maxMinLevel = parseInt(window.sessionStorage.getItem("dimmer_turnOnLevel"));
                if (minLevel < maxMinLevel+1) {
                    minLevel =  minLevel - 4;
                    minLevel = (minLevel > 0 ) ? minLevel : 0;

                    obj.renderCircle(start, Math.floor(minLevel / 4), startColor, updateColor);
                    obj.testBrightness(minLevel);
                }
            }
        },
        fastIncrease: function(e) {
            if (e.type === "touchstart") {
                clearInterval(obj.setDialInterval);
                obj.setDialInterval =  setInterval(function () {
                    obj.increaseBrightness();
                }, 600);
            } else if (e.type === "touchend") {
                clearInterval(obj.setDialInterval);
            }
        },
        fastDecrease: function(e) {
            if (e.type === "touchstart") {
                clearInterval(obj.setDialInterval);
                obj.setDialInterval =  setInterval(function () {
                    obj.reduceBrightness();
                }, 600);
            } else if (e.type === "touchend") {
                clearInterval(obj.setDialInterval);
            }
        },
        refreshBrightness: function() {
            $(".dialCircle").html("");

            if (pageType === "config_turn_on_level") {
                turnOnLevel =  0;
                obj.renderCircle(0, 0, "#777", "#73d44c");
                obj.testBrightness(turnOnLevel);

            } else if (pageType === "config_min_level") {
                minLevel = parseInt(window.sessionStorage.getItem("dimmer_turnOnLevel"));
                obj.renderCircle(Math.floor(minLevel/4), Math.floor(minLevel/4), "#9B9B9B", "#4A90E2");
                obj.testBrightness(minLevel);
            }

            clearInterval(obj.setDialInterval);
        },
        testBrightness: function(turnOnLevel) {
            var udn = window.sessionStorage.getItem("device_udn");
            var information = {
                "udn" : udn,
                "level" : turnOnLevel
            };

           SmartDevicePlugin.execute(
                function(){
                },
                obj.reportError,
                actions.CALIBRATE_BULB, [information]
            );
        },
        loadMinConfigPage : function() {
            window.sessionStorage.setItem("dimmer_page_type", "config_min_level");
            window.sessionStorage.setItem("dimmer_maxLevel", maxLevel);
            wemoUtil.loadUrl(filePath.BULB_CALIBRATE);
        },
        loadTestSummaryPage: function() {
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
    var bulbCalibratePage = new BulbCalibrate();
    bulbCalibratePage.init();
});