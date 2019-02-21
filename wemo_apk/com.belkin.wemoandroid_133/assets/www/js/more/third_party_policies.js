/*
    third_party_policies.js

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

var TAG = "third_party_policies.js: ";


$(document).bind('pageinit', function() {
	$('.ui-header').css({'border-bottom': '1px solid #888 !important'});
	$('.sub_header').css({'z-index':3,'border-top': '1px solid #73D44C !important'});
	
	var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
	$('.wemo_logo').css('width', Math.round(0.35 * w));
    third_party_policies.initialize();
});

var third_party_policies = {

		initialize : function() {
			console.log(TAG + "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

		onDeviceReady : function() {
			console.log(TAG + "onDeviceReady");
			third_party_policies.bindEvents();

			
			//To return back to home page: device list tab
			$(".wemo_logo").on("tap", function(e) {
				if ( e.target.nodeName!= "IMG" ) {				
					wemoUtil.loadUrl(filePath.DEVICE_LIST);
				}
			});
			
			//third_party_policies Page Link
			  $('#Crock_Pot_info_link').on('click', function() {
			       // console.log("Ashish  " + isRemoteEnabled);
			        if (!isRemoteEnabled) {
			            deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
			        }
			       window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Crock_Pot_info_link']);
			        wemoUtil.loadUrl(filePath.HELP_CENTER);
//			        navigator.app.loadUrl(wemo.items['Crock_Pot_info_link'], { openExternal:true });
			  });
		
			 $('#MrCoffee_info_Link').on('click', function() {
			       // console.log("Ashish  " + isRemoteEnabled);
			        if (!isRemoteEnabled) {
			            deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
			        }
			       window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['MrCoffee_info_Link']);
			        wemoUtil.loadUrl(filePath.HELP_CENTER);
			  });
			
			 $('#Holmes_info_Link').on('click', function() {
			       // console.log("Ashish  " + isRemoteEnabled);
			        if (!isRemoteEnabled) {
			            deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
			        }
			       window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Holmes_info_Link']);
			        wemoUtil.loadUrl(filePath.HELP_CENTER);
			  });
			 $('#Bionaire_Sunbeam_info_Link').on('click', function() {
			       // console.log("Ashish  " + isRemoteEnabled);
			        if (!isRemoteEnabled) {
			            deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
			        }
			       window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Bionaire_Sunbeam_info_Link']);
			        wemoUtil.loadUrl(filePath.HELP_CENTER);
			  });
			 $('#Oster_info_Link').on('click', function() {
			       // console.log("Ashish  " + isRemoteEnabled);
			        if (!isRemoteEnabled) {
			            deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
			        }
			       window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Oster_info_Link']);
			        wemoUtil.loadUrl(filePath.HELP_CENTER);
			  });
			
		},

		bindEvents : function() {
			console.log(TAG + "bindEvents");
			document.addEventListener('online', third_party_policies.onOnline, false);
			document.addEventListener('offline', third_party_policies.onOffline, false);
			document.addEventListener("backbutton", third_party_policies.onBackPress, false);
			document.addEventListener("pause", third_party_policies.onPause, false);
			document.addEventListener("resume", third_party_policies.onResume, false);
		},

		onOffline : function() {
			console.log(TAG + "offLine");
		},

		onOnline : function() {
			console.log(TAG + "onLine");
		},

		onBackPress : function() {
			if ($(".more_tab").is(":visible")) {
	    		$(".more_tab").hide();
	    		$('body').find('.modalWindow').transition({opacity:0},400, function(){
	                $(this).removeClass('isOpen');
	            });
	    	}
	    	else {
	    		console.log(TAG + "onBackPress");
				wemoUtil.loadPreviousUrl();
	    	}
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
