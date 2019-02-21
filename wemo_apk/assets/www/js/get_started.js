/*
    get_started.js

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

var TAG = "get_started.js: ";

$(document).bind('pageinit', function() {
	get_started.initialize();
});

var get_started = {

		initialize : function() {
			console.log(TAG + "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

		onDeviceReady : function() {
			console.log(TAG + "onDeviceReady");
			get_started.bindEvents();
			//All initialization script goes here

			var page= 'light';
			$("[name=get_started]").addClass("get_started_light");

			$("#welcome_getstarted_btn").on('pointerdown', function(){
				 wemoUtil.loadUrl(filePath.SETUP_DEVICE_DEMO);
			});
			
			$("#welcome_learnmore_btn").on('pointerdown', function(){
                window.open(wemo.items['WeMo_Url'], "_system");
			});
			
			
			$("#get_started").show();
            wemoUtil.setPreviousUrl(window.location.href);
		},

		bindEvents : function() {
			console.log(TAG + "bindEvents");
			document.addEventListener('online', get_started.onOnline, false);
			document.addEventListener('offline', get_started.onOffline, false);
			document.addEventListener("backbutton", get_started.onBackPress, false);
			document.addEventListener("pause", get_started.onPause, false);
			document.addEventListener("resume", get_started.onResume, false);
		},

		onOffline : function() {
			console.log(TAG + "offLine");
		},

		onOnline : function() {
			console.log(TAG + "onLine");
		},

		onBackPress : function() {
			console.log(TAG + "onBackPress");
            if(window.sessionStorage.getItem(sessionStore.REMOTE_MODE) !== 'true'){
                devicePlugin.execute(null, null, actions.STOP_CONTROL_POINT, []);
            }
			//navigator.app.clearHistory();
			navigator.app.exitApp();
		},

		onPause : function() {
			console.log(TAG + "onPause");
            if(window.sessionStorage.getItem(sessionStore.REMOTE_MODE) !== 'true'){
                devicePlugin.execute(null, null, actions.STOP_CONTROL_POINT, []);
            }
		},

		onResume : function() {
			console.log(TAG + "onResume");
		},

		reportError : function(e) {
			console.log(TAG + "Plugin Error!!!!   " + e);
		}

};
