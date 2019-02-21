/*
    devices_tune_up.js

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

var TAG = "devices_tune_up.js: ";

$(document).bind('pageinit', function() {
	devices_tune_up.initialize();
});

var devices_tune_up = {

		initialize : function() {
			console.log(TAG + "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

		onDeviceReady : function() {
			console.log(TAG + "onDeviceReady");
			devices_tune_up.bindEvents();
			
	       //On tap update Now button
			 $("#device_tune_up_update_now").on("tap", function(){
                var updateInprogress =  false;
                cordova.exec(function(updateInprogress){
                    if (updateInprogress === "true") {
                        wemoUtil.loadUrl(filePath.DEVICE_LIST + '#page/wemo_devices/showFirmwareUpdateInProgress');
                    } else {
                        wemoUtil.loadUrl(filePath.DEVICE_LIST + '#page/wemo_devices/showFirmwareUpdate');
                    }
                }, function(){
                    wemoUtil.loadUrl(filePath.DEVICE_LIST + '#page/wemo_devices/showFirmwareUpdate');
                }, 'FirmwareUpdatePlugin', 'isFWUpdateInProgress', []);
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
			document.addEventListener('online', devices_tune_up.onOnline, false);
			document.addEventListener('offline', devices_tune_up.onOffline, false);
			document.addEventListener("backbutton", devices_tune_up.onBackPress, false);
			document.addEventListener("pause", devices_tune_up.onPause, false);
			document.addEventListener("resume", devices_tune_up.onResume, false);
		},

		onOffline : function() {
			console.log(TAG + "offLine");
		},

		onOnline : function() {
			console.log(TAG + "onLine");
		},

		onBackPress : function() {
			console.log(TAG + "onBackPress");
            wemoUtil.loadPreviousUrl();
		},

		onPause : function() {
			console.log(TAG + "onPause");
		},

		onResume : function() {
			console.log(TAG + "onResume");
		},

		reportError : function(e) {
			console.log(TAG + "Plugin Error!!!!   " + e);
		}

};
