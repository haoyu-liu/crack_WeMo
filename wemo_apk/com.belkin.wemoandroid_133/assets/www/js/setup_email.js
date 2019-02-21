/*
    setup_email.js

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
var TAG = "setup_email.js ";

$(document).bind('pageinit', function() {
	$('.ui-header').css({'border-bottom': '1px solid #888 !important'});
    $('.sub_header').css({'z-index':3,'border-top': '1px solid #73D44C !important'});
	var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));
	setupEmail.initialize();
});


var setupEmail = {

		initialize: function() {
			console.log(TAG + "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

		onDeviceReady: function() {
			console.log(TAG + "device ready");
			setupEmail.bindEvents();
			var type = window.sessionStorage.getItem("type");
			var emailid = window.sessionStorage.getItem("stored_email_address");
			$("#setup_email").attr("placeholder", wemo.items['Optional']);
			if(emailid != null) {
                $('#setup_email').val(emailid);
            }
		    $('#setup_email').focus();
			
			$('#set_email_done_btn').on('pointerdown',function() {
                var newEmail = $('#setup_email').val();
				if(newEmail === window.sessionStorage.getItem("stored_email_address") || (window.sessionStorage.getItem("stored_email_address") !="" && newEmail == "")){
					wemoUtil.infoLog("email not changed");
					navigator.app.backHistory();
				} else {

                    wemoUtil.infoLog("new email address: " + newEmail);
                    if(newEmail !='')
                    {
                        if (event.charCode!=0) {
                            var pattern = new RegExp(regexpPattern.insensitive.email, regexpModifier.insensitive);
                            if (!pattern.test(newEmail) || newEmail.length > Setup.Email.LIMIT) {
                            	wemoUtil.replaceParameters($("[_key='InvalidEmailMessage']"), [newEmail]);
                                $("#setup_email_validation_popup").popup("open");
                                event.preventDefault();
                                return false;
                            }
                        }
                    }

					window.sessionStorage.setItem("stored_email_address", $('#setup_email').val());
					navigator.app.backHistory();
				}
				
			});

			$('#set_email_cancel_btn').on('pointerdown',function() {
				navigator.app.backHistory();

			});
			
			$("#setup_email_validation_ok_btn").on("pointerdown", function(){
	        	$("#setup_email_validation_popup").popup("close");
	        });
		},
		
		bindEvents: function() {
			console.log(TAG + "bind events");
			document.addEventListener('offline', setupEmail.onOffline, false);
			document.addEventListener('online', setupEmail.onOnline, false);
			document.addEventListener("backbutton", setupEmail.onBackPress, false);
			document.addEventListener("resume", setupEmail.onResume, false);
			
		},

		onBackPress: function() {
			console.log(TAG + "back button pressed");
			navigator.app.backHistory();
		},
		
		onResume: function() {
			console.log(TAG + "no network resumed");
		},

		onOffline: function() {
			console.log(TAG + "offLine");
		},

		onOnline: function() {
			console.log(TAG + "onLine");
		},
		
		reportError: function() {
			console.log(TAG + "Error!!!!");
		},
};
