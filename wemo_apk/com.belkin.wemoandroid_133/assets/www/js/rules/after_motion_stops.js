/*
    after_motion_stops.js

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

var TAG = "after_motion_stops.js: ";

$(document).bind('pageinit', function() {
	after_motion_stops.initialize();
});

var after_motion_stops = {

		initialize : function() {
			console.log(TAG + "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

		onDeviceReady : function() {
			console.log(TAG + "onDeviceReady");
			after_motion_stops.bindEvents();
			
			/****************Open Rule JSON Object ******************/
			var rulesObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
			
			window.sessionStorage.setItem(sessionStore.AFTER_MOTION_STOPS,JSON.stringify("AFTER_MOTION_STOPS"));
            var cd = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE);
            
            /**************** onload  Sensor End Action ******************/
            
			if (rulesObj.Devices[cd].StartAction!=undefined){
				$("input[name=switch_action]").each(function() {
					if($(this).val() == rulesObj.Devices[cd].StartAction && $(this).val()!='2'){
						var selectAction=$(this).attr('id');
						$("#"+selectAction).parent().hide();
					}
					if($(this).val() == rulesObj.Devices[cd].EndAction){
                        $(this).attr("checked",true).checkboxradio("refresh");
                        if($(this).val()==="2"){
    						$("#after_motion_minute").hide();
    					}else{
    						$("#after_motion_minute").show();
    					}
                    }
					
			    });
			}
			
			/**************** onload select Sensor Durations ******************/
			
			if (rulesObj.Devices[cd].SensorDuration!=undefined){
				$("input[name=after_motion_minute]").each(function() {
					if(wemoUtil.convertTimeToMilliseconds($(this).val()) == rulesObj.Devices[cd].SensorDuration){
                        $(this).attr("checked",true).checkboxradio("refresh");
                        rulesObj.Devices[cd].SensorDuration = wemoUtil.convertTimeToMilliseconds($(this).val());
                    }
				});
			}
			
			//rulesObj.Devices[cd].FName = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE_NAME);
			wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rulesObj);
			
			//To return back to home page: device list tab
			$(".wemo_logo").on("tap", function(e) {
				if ( e.target.nodeName!= "IMG" ) {				
					wemoUtil.loadUrl(filePath.DEVICE_LIST);
				}
			});
			
            
			/**************** Change Sensor end action and  Sensor Durations ******************/
			
            $("input[type='radio']").on('click', function(){
				$("input[name=switch_action]:checked").each(function() {
			        if($(this).val() === '1'){
			        	   $("#after_motion_minute").show();
			        	   rulesObj.Devices[cd].EndAction='1';
					   }else if($(this).val() === '0'){
						   rulesObj.Devices[cd].EndAction='0';
						   $("#after_motion_minute").show();
					   }else if($(this).val() ==='2'){
						   rulesObj.Devices[cd].EndAction='2';
						   $("#after_motion_minute").hide();
					   }
			    });
				
				/**************** Change Sensor Durations ******************/
				
				$("input[name=after_motion_minute]:checked").each(function() {
					$("input[name='after_motion_minute']").checkboxradio("refresh");
					rulesObj.Devices[cd].SensorDuration = wemoUtil.convertTimeToMilliseconds($(this).val());
				});
				
				wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rulesObj);
			});
            

            /**************** Save Motion End Action and Sensor Durations ******************/
            
            $("#after_motion_stops_save_btn").on('pointerdown', function(){
            	window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE,cd);
            	if (rulesObj.Devices[cd].StartAction=='2' && rulesObj.Devices[cd].EndAction=='2'){
            		rulesObj.Devices[cd]={};
                    delete rulesObj.Devices[cd];
                    window.sessionStorage.setItem(sessionStore.AFTER_MOTION_STOPS,JSON.stringify("no object"));
            	}
            	wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rulesObj);
            	var wemo_rule_type=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_TYPE);
				if (wemo_rule_type=='edit_sensor_rule'){
					wemoUtil.loadUrl(filePath.EDIT_SENSORS_RULE);
				}else if (wemo_rule_type=='sensor_rule'){
					wemoUtil.loadUrl(filePath.SENSORS_RULE);
				}
            });
            
			 
			//Cancel button Click
			$("#after_motion_stops_cancel_btn").on("tap", function(){
				wemoUtil.loadPreviousUrl();
			});

		},

		bindEvents : function() {
			console.log(TAG + "bindEvents");
			document.addEventListener('online', after_motion_stops.onOnline, false);
			document.addEventListener('offline', after_motion_stops.onOffline, false);
			document.addEventListener("backbutton", after_motion_stops.onBackPress, false);
			document.addEventListener("pause", after_motion_stops.onPause, false);
			document.addEventListener("resume", after_motion_stops.onResume, false);
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
