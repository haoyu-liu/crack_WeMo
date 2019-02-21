/*
    get_it_now.js

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

var TAG = "get_it_now.js: ";

$(document).bind('pageinit', function() {
	get_it_now.initialize();
});

var get_it_now = {

		initialize : function() {
			console.log(TAG + "initialize");
            var w = wemoUtil.getScreenWidth();
            $('.wemo_logo').css('background-size', 0.3 * w);
            $('.wemo_logo').css('width', Math.round(0.35 * w));
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

		onDeviceReady : function() {
            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
		    get_it_now.bindEvents();
			console.log(TAG + "onDeviceReady");
			  $("#getItNow").on('pointerdown', function(){
				  //alert('Get It Now  '+sessionStore.NET_CAM_OBJ_FROM_DEVICE_LIST);
				  console.log("Plug-In Call to - actions.LAUNCH_NET_CAM_APP:  "+window.sessionStorage.getItem(sessionStore.NET_CAM_OBJ_FROM_DEVICE_LIST));
				  var netCamObj = JSON.parse(window.sessionStorage.getItem(sessionStore.NET_CAM_OBJ_FROM_DEVICE_LIST));
				  console.log("clicked item:NetCamObj:  " + netCamObj);
				  console.log("clicked item:ID:  " + netCamObj.ID);
				  console.log("clicked item:Type:  " + netCamObj.Type);
				  console.log("clicked item:Name:  " + netCamObj.Name);
				  console.log("clicked item:UserName:  " + netCamObj.UserName);
              	console.log("clicked item:MacAdd:  " + netCamObj.MacAdd);
            	console.log("clicked item:isRemoteEnabled:  " + netCamObj.isRemoteEnabled);
				  deviceTabPlugin.execute(
					function (value) {
						/*
						 * Plug-In Call to - actions.LAUNCH_NET_CAM_APP
						 * Command to java to launch the WeMo NetCam Application.
						 * No need to handle anything here.
						 */
					},
					get_it_now.reportError,
					actions.LAUNCH_NET_CAM_APP,
					[netCamObj.UserName,((netCamObj.isRemoteEnabled)?netCamObj.MacAdd:netCamObj.ID),1]
				  );//netCamObj.ID
			  });
			
			//All initialization script goes here
			
		},

		bindEvents : function() {
			console.log(TAG + "bindEvents");
			document.addEventListener('online', get_it_now.onOnline, false);
			document.addEventListener('offline', get_it_now.onOffline, false);
			document.addEventListener("backbutton", get_it_now.onBackPress, false);
			document.addEventListener("pause", get_it_now.onPause, false);
			document.addEventListener("resume", get_it_now.onResume, false);
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
			console.log(TAG + "onResume");
		},

		reportError : function(e) {
			console.log(TAG + "Plugin Error!!!!   " + e);
		}

};
