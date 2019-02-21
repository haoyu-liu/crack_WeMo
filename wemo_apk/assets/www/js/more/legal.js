/*
    legal.js

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

var TAG = "legal.js: ";


$(document).bind('pageinit', function() {
	$('.ui-header').css({'border-bottom': '1px solid #888 !important'});
	$('.sub_header').css({'z-index':3,'border-top': '1px solid #73D44C !important'});
	
	var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
	$('.wemo_logo').css('width', Math.round(0.35 * w));
	legal.initialize();
});

var legal = {

		initialize : function() {
			console.log(TAG + "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

		onDeviceReady : function() {
			console.log(TAG + "onDeviceReady");
			legal.bindEvents();
			//All initialization script goes here
			//get localization content
			
			//Warranty_Info_Link
			/*$("#warranty_info_link").on("click", function(){
				$('#legal_main_page').hide();
				$('#legal_regulatory_page').hide();
				$('#legal_gpl_page').hide();
				$('#legal_warranty_page').show();
				$("#legal_warranty_url").attr("src", wemo.items['Warranty_Info_Link']);
			});
			*/
			
			//To return back to home page: device list tab
			$(".wemo_logo").on("tap", function(e) {
				if ( e.target.nodeName!= "IMG" ) {				
					wemoUtil.loadUrl(filePath.DEVICE_LIST);
				}
			});
			
			//Legal Page Link
			  $('#warranty_info_link').on('click', function() {
			       // console.log("Ashish  " + isRemoteEnabled);
			        if (!isRemoteEnabled) {
			            deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
			        }
			      // window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Warranty_Info_Link']);
			        wemoUtil.loadExternalUrl(wemo.items['Warranty_Info_Link']);
			  });
			
			//regulatory_info_link
			/*$("#regulatory_info_link").on("click", function(){
				$('#legal_main_page').hide();
				$('#legal_warranty_page').hide();
				$('#legal_gpl_page').hide();
				$('#legal_regulatory_page').show();
				$("#legal_regulatory_url").attr("src", wemo.items['Regulatory_Info_Link']);
			});*/
			
			 $('#regulatory_info_link').on('click', function() {
			       // console.log("Ashish  " + isRemoteEnabled);
			        if (!isRemoteEnabled) {
			            deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
			        }
			       //window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Regulatory_Info_Link']);
			        wemoUtil.loadExternalUrl(wemo.items['Regulatory_Info_Link']);
			  });
			
			//regulatory_info_link
			/*$("#gpl_info_link").on("click", function(){
				$('#legal_main_page').hide();
				$('#legal_warranty_page').hide();
				$('#legal_gpl_page').show();
				$('#legal_regulatory_page').hide();
				$("#legal_gpl_url").attr("src", wemo.items['GPL_Info_Link']);
			});*/
			
			 $('#gpl_info_link').on('click', function() {
			       // console.log("Ashish  " + isRemoteEnabled);
			        if (!isRemoteEnabled) {
			            deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
			        }
			       //window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['GPL_Info_Link']);
			        wemoUtil.loadExternalUrl(wemo.items['GPL_Info_Link']);
			  });
			 $('#belkin_Privacy_Policy').on('click', function() {
			       // console.log("Ashish  " + isRemoteEnabled);
			        if (!isRemoteEnabled) {
			            deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
			        }
			       //window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Belkin_Privacy_Policy_Link']);
			       wemoUtil.loadExternalUrl(wemo.items['Belkin_Privacy_Policy_Link']);
			  });
			 $('#third_Party_Privacy_Policy').on('click', function() {
			       // console.log("Ashish  " + isRemoteEnabled);
			        if (!isRemoteEnabled) {
			            deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
			        }
//			       window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['GPL_Info_Link']);
			        wemoUtil.loadUrl(filePath.LEGAL_THIRDPARTY_POLICY);
			  });
			
		},

		bindEvents : function() {
			console.log(TAG + "bindEvents");
			document.addEventListener('online', legal.onOnline, false);
			document.addEventListener('offline', legal.onOffline, false);
			document.addEventListener("backbutton", legal.onBackPress, false);
			document.addEventListener("pause", legal.onPause, false);
			document.addEventListener("resume", legal.onResume, false);
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
