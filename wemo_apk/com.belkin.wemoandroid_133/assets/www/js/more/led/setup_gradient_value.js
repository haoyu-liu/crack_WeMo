/*
    setup_password.js

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
var TAG = "setup_gradient_value.js: ";//	connect_to_ifttt

$(document).bind('pageinit', function() {
    wemoUtil.infoLog(setupGradientValue.TAG, 'pageinit');
	$('.ui-header').css({'border-bottom': '1px solid #888 !important'});
    $('.sub_header').css({'z-index':3,'border-top': '1px solid #73D44C !important'});
	setupGradientValue.initialize();
});

var setupGradientValue = {

    TAG : "setup_gradient_value.js",

		initialize : function() {
			console.log(TAG + "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

		onDeviceReady : function() {
			console.log(TAG + "onDeviceReady");
			setupGradientValue.bindEvents();
            $('#setup_sub_header').html(wemo.items[window.sessionStorage.getItem("SETUP_TITLE")]);
            
            $('#ap_password_input').focus();
 	          nativeUtilPlugin.execute(null, setupGradientValue.reportError,actions.OPEN_SOFT_KEYBOARD,[]);

 	          
			$('#more_new_firmware,#more_setup_another_device,#more_remote_access,#more_connect_to_IFTTT,#more_settings_and_about,#more_tell_us_what_you_think,#more_help_center').addClass('none');
			    //$('#dropdown_hidden_network,#dropdown_help').removeClass('none');

			$("#ap_gradient_cancel_btn").on('pointerdown', function(){
		    	wemoUtil.loadPreviousUrl();
		    });

            $("#ap_gradient_save_btn").on('pointerdown', function(){
            	
            	var inputVal = $('#ap_password_input').val();
            	
            	if($.isNumeric(inputVal))
            	{            		
            		if(inputVal < 0.001 || inputVal > 0.999)
            		{
            			alert("please enter the values between 0.001 - 0.999");
            			return false;
            		}
            		else
            		{
            		    window.sessionStorage.setItem(sessionStore.LED_GRADIENT_VAL, $('#ap_password_input').val());
            		    wemoUtil.loadPreviousUrl();
            		}
            	}
            	else
            	{
            		alert("please enter the numeric value");
            		return false;
            	}
               
                //window.sessionStorage.setItem(sessionStore.STARTUP_MODE, startupMode.MANUAL_CONNECT);
                //wemoUtil.loadUrl(filePath.INDEX);
               
 	 
	 	   });
			//end
			
		},

		bindEvents : function() {
			console.log(TAG + "bindEvents");
			document.addEventListener('online', setupGradientValue.onOnline, false);
			document.addEventListener('offline', setupGradientValue.onOffline, false);
			document.addEventListener("backbutton", setupGradientValue.onBackPress, false);
			document.addEventListener("pause", setupGradientValue.onPause, false);
			document.addEventListener("resume", setupGradientValue.onResume, false);
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
//			wemoUtil.loadUrl(filePath.DEVICE_LIST);
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