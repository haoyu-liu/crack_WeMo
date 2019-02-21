/*
 no_wifi.js

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
var TAG = "no_wifi.js ";

$(document).bind('pageinit', function() {
	var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));
    noWiFi.initialize();
});


var noWiFi = {

    initialize: function() {
        console.log(TAG + "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    onDeviceReady: function() {
        console.log(TAG + "device ready");
        disableNetworkWatchdog = false;
        noWiFi.bindEvents();
        nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
         $('#try_again_btn').on('pointerdown',function(){
            console.log("Try again");
             wemoUtil.loadUrl(filePath.INDEX);
         });

        noWiFi.showNetworkStatus();
    },

    bindEvents: function() {
        console.log(TAG + "bind events");
        document.addEventListener('offline', noWiFi.onOffline, false);
        document.addEventListener('online', noWiFi.onOnline, false);
        document.addEventListener("backbutton", noWiFi.onBackPress, false);
        document.addEventListener("resume", noWiFi.onResume, false);
    },

    showNetworkStatus: function() {
        var noWifiPageMsg =  window.sessionStorage.getItem("noWifiPageMsg");
        if (noWifiPageMsg) {
            $(".no_wifi_text").html(noWifiPageMsg);
        }
    },

    onBackPress: function() {
        console.log(TAG + "back button pressed");
        //navigator.app.clearHistory();
        navigator.app.exitApp();
    },

    onResume: function() {
        console.log(TAG + "resumed");
    },

    onOffline: function() {
        console.log(TAG + "offLine");
    },

    onOnline: function() {
        console.log(TAG + "onLine");
    },

    reportError: function() {
        console.log(TAG + "Error!!!!");
    }



};
