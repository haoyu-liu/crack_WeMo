/*
    rules_my_stuff.js

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

var TAG = "rules_my_stuff: ";

$(document).bind('pageinit', function() {
	enabled_rules.initialize();
});

var enabled_rules = {

		initialize : function() {
			console.log(TAG + "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

		onDeviceReady : function() {
			console.log(TAG + "onDeviceReady enabled rules");
			enabled_rules.bindEvents();
			//All initialization script
			//Based on the device set the height for container div
		     var screenHeight = $(window).height();
	         var screenWidth = $(window).width();
	         var headerHeight = $("header").height();
	         var footerHeight = $("footer").height();
	         var elemHeight = $(".rules_page").height();
	         var totalHeight = headerHeight + footerHeight;
	         var setHeight = screenHeight - totalHeight;
	         $(".vertical_center").css({'height': (setHeight -25 ) / 3 + 'px'});
			 
			//To return back to home page: device list tab
			$(".wemo_logo").on("tap", function(e) {
				if ( e.target.nodeName!= "IMG" ) {				
					wemoUtil.loadUrl(filePath.DEVICE_LIST);
				}
			});
		},

		bindEvents : function() {
			console.log(TAG + "bindEvents");
			document.addEventListener('online', enabled_rules.onOnline, false);
			document.addEventListener('offline', enabled_rules.onOffline, false);
			document.addEventListener("backbutton", enabled_rules.onBackPress, false);
			document.addEventListener("pause", enabled_rules.onPause, false);
			document.addEventListener("resume", enabled_rules.onResume, false);
		},

		onOffline : function() {
			console.log(TAG + "offLine");
		},

		onOnline : function() {
			console.log(TAG + "onLine");
		},

		onBackPress : function() {
			console.log(TAG + "onBackPress");
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
