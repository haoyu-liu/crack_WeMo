/*
    connect_to_ifttt.js

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

var TAG = "connect_to_ifttt.js: ";

$(document).bind('pageinit', function() {
	//connect_to_ifttt;
//    alert("Activation Code : "+wemoUtil.get_ifttt_url(window.sessionStorage.getItem("activationCode")));
    window.open(wemoUtil.get_ifttt_url(window.sessionStorage.getItem("activationCode")));
//	$("#connect_to_ifttt_url").attr("src", wemoUtil.get_ifttt_url(window.sessionStorage.getItem("activationCode")));
	var h = $(window).height();
	
	$("#connect_to_ifttt_url").css({'height':h});
	connectToIfttt.initialize();
});

var connectToIfttt = {

		initialize : function() {
			console.log(TAG + "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

		onDeviceReady : function() {
			console.log(TAG + "onDeviceReady");
			connectToIfttt.bindEvents();
			//All initialization script goes here
			//get localization content
			
		},

		bindEvents : function() {
			console.log(TAG + "bindEvents");
			document.addEventListener('online', connectToIfttt.onOnline, false);
			document.addEventListener('offline', connectToIfttt.onOffline, false);
			document.addEventListener("backbutton", connectToIfttt.onBackPress, false);
			document.addEventListener("pause", connectToIfttt.onPause, false);
			document.addEventListener("resume", connectToIfttt.onResume, false);
		},

		onOffline : function() {
			console.log(TAG + "offLine");
		},

		onOnline : function() {
			console.log(TAG + "onLine");
		},

		onBackPress : function() {
			console.log(TAG + "onBackPress");
//			wemoUtil.loadPreviousUrl();
			wemoUtil.loadUrl(filePath.MORE_IFTTT);
		},

		onPause : function() {
			console.log(TAG + "onPause");
		},

		onResume : function() {
			console.log(TAG + "onResume");
			wemoUtil.loadUrl(filePath.MORE_IFTTT);
		},

		reportError : function(e) {
			console.log(TAG + "Plugin Error!!!!   " + e);
		}

};