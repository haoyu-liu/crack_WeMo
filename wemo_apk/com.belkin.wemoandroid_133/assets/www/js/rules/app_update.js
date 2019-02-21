/*
    app_update.js

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

var TAG = "app_update.js: ";

$(document).bind('pageinit', function() {
	app_update.initialize();
});

var app_update = {

	TAG: "app_update.js: ",

		initialize : function() {
			console.log(TAG + "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
			
		},

		onDeviceReady : function() {
//		navigator.notification.activityStop();
		nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);
			console.log(TAG + "onDeviceReady");
			app_update.bindEvents();
			
			
			//Update Now Button On Click
			
			$("#app_update_btn").on('click', function(){
				app_update.rateWeMOapplication();;
			});
			
			//To return back to home page: device list tab
			$(".wemo_logo").on("tap", function(e) {
				if ( e.target.nodeName!= "IMG" ) {				
					wemoUtil.loadUrl(filePath.DEVICE_LIST);
				}
			});		
			
		},

		bindEvents : function() {
			console.log(TAG + "bindEvents");
			document.addEventListener('online', app_update.onOnline, false);
			document.addEventListener('offline', app_update.onOffline, false);
			document.addEventListener("backbutton", app_update.onBackPress, false);
			document.addEventListener("pause", app_update.onPause, false);
			document.addEventListener("resume", app_update.onResume, false);
		},

		onOffline : function() {
			console.log(TAG + "offLine");
		},

		onOnline : function() {
			console.log(TAG + "onLine");
		},

		onBackPress : function() {
			console.log(TAG + "onBackPress");
            wemoUtil.loadUrl(filePath.DEVICE_LIST);
		},

		onPause : function() {
			console.log(TAG + "onPause");
		},

		onResume : function() {
			wemoUtil.infoLog(app_update.TAG, "onResume");
			wemoUtil.loadUrl(filePath.DEVICE_LIST);
		},

		reportError : function(e) {
			console.log(TAG + "Plugin Error!!!!   " + e);
		},

	    rateWeMOapplication: function(){
        wemoUtil.infoLog(app_update.TAG, "rateWeMOapplication");
        nativeUtilPlugin.execute(
            function (callbackResponse) {
                wemoUtil.infoLog(app_update.TAG, "Open Play store: " + callbackResponse);
            },
            app_update.reportError,
            actions.GET_PLAY_STORE_URL,
            []
        );
    },
};
