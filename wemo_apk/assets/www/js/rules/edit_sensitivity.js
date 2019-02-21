/*
    select_sensors.js

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

var TAG = "select_sensors.js: ";

$(document).bind('pageinit', function() {
	select_sensors.initialize();
});

var select_sensors = {

		initialize : function() {
			console.log(TAG + "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

		onDeviceReady : function() {
			console.log(TAG + "onDeviceReady");
			select_sensors.bindEvents();
			
			//All initialization script goes here
			var ruleObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
			
			if (ruleObj.SelectedSensorsValue == undefined)
			{
				$("#high").prop("checked","checked");
			}else{
				$("[name='edit_sensitivity']").each(function(){
					if($(this).val() == ruleObj.SelectedSensorsValue){
						$(this).prop("checked","checked");
						$("[name='edit_sensitivity']").checkboxradio("refresh");
					}
				});
			}
			
			
			$("input[type='radio']").checkboxradio("refresh");
			
			//To return back to home page: device list tab
			$(".wemo_logo").on("tap", function(e) {
				if ( e.target.nodeName!= "IMG" ) {				
					wemoUtil.loadUrl(filePath.DEVICE_LIST);
				}
			});
			
			
			$("#edit_sensitivity_save_btn").on('pointerdown', function(){
				$("input[type='radio']").each(function(){
					var sensitivity = $("input[type='radio']").is(":checked");
					$("[name='edit_sensitivity']").checkboxradio("refresh");
					if($(this).is(':checked')){
						ruleObj.SelectedSensorsValue = $(this).val();
					}
				});
				
				wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,ruleObj);
				var wemo_rule_type=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_TYPE);
				if (wemo_rule_type=='edit_sensor_rule'){
					wemoUtil.loadUrl(filePath.EDIT_SENSORS_RULE);
				}else if (wemo_rule_type=='sensor_rule'){
					wemoUtil.loadUrl(filePath.SENSORS_RULE);
				}
			});
			 
			 $('#edit_sensitivity_cancel_btn').on('pointerdown',function(){
				 wemoUtil.loadPreviousUrl();
			 });
},

		bindEvents : function() {
			console.log(TAG + "bindEvents");
			document.addEventListener('online', select_sensors.onOnline, false);
			document.addEventListener('offline', select_sensors.onOffline, false);
			document.addEventListener("backbutton", select_sensors.onBackPress, false);
			document.addEventListener("pause", select_sensors.onPause, false);
			document.addEventListener("resume", select_sensors.onResume, false);
		},

		onOffline : function() {
			console.log(TAG + "offLine");
		},

		onOnline : function() {
			console.log(TAG + "onLine");
		},

		onBackPress : function() {
			if ($("#more_tab").is(":visible")) {
	    		$("#more_tab").hide();
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
