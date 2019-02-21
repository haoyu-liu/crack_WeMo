/*
 remote_disabled.js

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

$(document).bind('pageinit', function() {
	var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));
	remoteDisabled.initialize();
});

var remoteDisabled = {

    TAG : 'remote_disabled.js: ',

    log : function(string){
        console.log(remoteDisabled.TAG + string);
    },

    infoLog : function(string){
        
    },

    initialize : function() {
        remoteDisabled.log("initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    onDeviceReady : function() {
        remoteDisabled.log("onDeviceReady");
        remoteDisabled.bindEvents();
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
		//To return back to home page: device list tab
		$(".wemo_logo").on("tap", function(e) {
			if ( e.target.nodeName!= "IMG" ) {				
				wemoUtil.loadUrl(filePath.DEVICE_LIST);
			}
		});
    },

    bindEvents : function() {
        remoteDisabled.log("bindEvents");
        document.addEventListener('online', remoteDisabled.onOnline, false);
        document.addEventListener('offline', remoteDisabled.onOffline, false);
        document.addEventListener("backbutton", remoteDisabled.onBackPress, false);
        document.addEventListener("pause", remoteDisabled.onPause, false);
        document.addEventListener("resume", remoteDisabled.onResume, false);
    },

    onOffline : function() {
        remoteDisabled.log("offLine");
    },

    onOnline : function() {
        remoteDisabled.log("onLine");
    },

    onBackPress : function() {
        remoteDisabled.log("onBackPress");
        window.sessionStorage.clear();
        //navigator.app.clearHistory();
        navigator.app.exitApp();
    },

    onPause : function() {
        remoteDisabled.log("onPause");
    },

    onResume : function() {
        remoteDisabled.log("onResume");
    },

    reportError : function(e) {
        remoteDisabled.log("Plugin Error!!!!   " + e);
    }

};
