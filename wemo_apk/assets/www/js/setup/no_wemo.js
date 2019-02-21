/*

 no_wemo.js

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

var noWemo = {

    TAG : 'no_wemo.js: ',

    tryAgain : {},

    initialize : function() {
        wemoUtil.infoLog(noWemo.TAG,  "initialize");
		var w = wemoUtil.getScreenWidth();
		$('.wemo_logo').css('background-size', 0.3 * w);
        $('.wemo_logo').css('width', Math.round(0.35 * w));
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    onDeviceReady : function() {
        wemoUtil.infoLog(noWemo.TAG,  "onDeviceReady");
        noWemo.bindEvents();
        //All initialization script goes here
        noWemo.initializeDOMElements();

        (noWemo.tryAgain).on('click', function(){
            wemoUtil.loadUrl(filePath.INDEX);
        });
    },

    bindEvents : function() {
        wemoUtil.infoLog(noWemo.TAG,  "bindEvents");
        document.addEventListener('online', noWemo.onOnline, false);
        document.addEventListener('offline', noWemo.onOffline, false);
        document.addEventListener("backbutton", noWemo.onBackPress, false);
        document.addEventListener("pause", noWemo.onPause, false);
        document.addEventListener("resume", noWemo.onResume, false);
    },

    onOffline : function() {
        wemoUtil.infoLog(noWemo.TAG, "offLine");
    },

    onOnline : function() {
        wemoUtil.infoLog(noWemo.TAG, "onLine");
    },

    onBackPress : function() {
        wemoUtil.infoLog(noWemo.TAG, "onBackPress");
        wemoUtil.exitApp();
    },

    onPause : function() {
        wemoUtil.infoLog(noWemo.TAG,  "onPause");
    },

    onResume : function() {
        wemoUtil.infoLog(noWemo.TAG, "onResume");
    },

    reportError : function(e) {
        wemoUtil.infoLog(noWemo.TAG, "Plugin Error!!!!   " + e);
    },

    initializeDOMElements : function(){
        noWemo.tryAgain = $("#try_again_btn");
    }
};


$(document).bind('pageinit', function() {
    noWemo.initialize();
});
