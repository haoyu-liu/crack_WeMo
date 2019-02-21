/*
    sensors_what_happens.js

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

var TAG = "sensors_what_happens.js: ";

$(document).bind('pageinit', function() {
	sensors_what_happens.initialize();
});

var sensors_what_happens = {

		initialize : function() {
			console.log(TAG + "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

		onDeviceReady : function() {
			console.log(TAG + "onDeviceReady");
			sensors_what_happens.bindEvents();
			//All initialization script goes here
			
			var rulesObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
            var cd = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE);
			var actionText = "", sDuration=""; //Turn On | Turn Off | Do Nothing
			var switchAction = "";
			//rulesObj.DeviceList += cd;
			var visitFrom=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.AFTER_MOTION_STOPS);
			//alert(JSON.stringify(rulesObj));
			
			/**************** Onload select sensor start action ******************/
			
			if (rulesObj.Devices[cd]){
				/**************** Onload/Edit/revist select sensor start action ******************/
				$("input[name=switch_action]").each(function() {
					if($(this).val() == rulesObj.Devices[cd].StartAction){
                        $(this).attr("checked",true).checkboxradio("refresh");
                        if($(this).val() === '1'){
			        		if (rulesObj.Devices[cd].EndAction=='0'){
					    		$('.after_motion_stops_text').show();
					    		sDuration=wemoUtil.formatMins(rulesObj.Devices[cd].SensorDuration);
							    actionText = wemo.items['AfterMotionOff'];
					    	}else if (rulesObj.Devices[cd].EndAction=='2'){
					    		$('.after_motion_stops_text').hide();
							    actionText=sessionStore.AFTER_MOTION_STOPS_STATUS;
							    sDuration = wemo.items['AfterMotionNothing'];
					    	}
					    }else if($(this).val() === '0'){
						    if (rulesObj.Devices[cd].EndAction=='1'){
					    		$('.after_motion_stops_text').show();
					    		sDuration=wemoUtil.formatMins(rulesObj.Devices[cd].SensorDuration);
							    actionText = wemo.items['AfterMotionOn'];
					    	}else if (rulesObj.Devices[cd].EndAction=='2'){
					    		$('.after_motion_stops_text').hide();
							    actionText=sessionStore.AFTER_MOTION_STOPS_STATUS;
							    sDuration = wemo.items['AfterMotionNothing'];
					    	}
					    }else if($(this).val() ==='2'){
					    	if (rulesObj.Devices[cd].EndAction=='0'){
					    		$('.after_motion_stops_text').show();
					    		sDuration=wemoUtil.formatMins(rulesObj.Devices[cd].SensorDuration);
							    actionText = wemo.items['AfterMotionOff'];
					    	}else if (rulesObj.Devices[cd].EndAction=='1'){
					    		$('.after_motion_stops_text').show();
					    		sDuration=wemoUtil.formatMins(rulesObj.Devices[cd].SensorDuration);
							    actionText = wemo.items['AfterMotionOn'];
					    	}else{
					    		$('.after_motion_stops_text').hide();
							    actionText=sessionStore.AFTER_MOTION_STOPS_STATUS;
							    sDuration = wemo.items['AfterMotionNothing'];
					    	}
					    }
                    }
			    });
				$('#after_motion_stops .switchAction').text(actionText);
				$('#after_motion_stops .actionDuration').text(sDuration);
				wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rulesObj);
				
			}else{
				/**************** Onload/1st Time select sensor start action ******************/
				rulesObj.Devices[cd] = {};
				if(rulesObj.Devices[cd]!=undefined && rulesObj.Devices[cd].SensorDuration == undefined){
					rulesObj.Devices[cd].SensorDuration = wemoUtil.convertTimeToMilliseconds("00:15");
					sDuration=wemoUtil.formatMins(rulesObj.Devices[cd].SensorDuration);
					$('#switch_action_nothing').attr("checked",true).checkboxradio("refresh");
					rulesObj.Devices[cd].StartAction = parseInt($('#switch_action_nothing').val());
					if (rulesObj.Devices[cd].EndAction == undefined){
						rulesObj.Devices[cd].EndAction = 2;
						actionText=sessionStore.AFTER_MOTION_STOPS_STATUS;
					}
				    rulesObj.Devices[cd].FName = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE_NAME);
				    
				    $('.after_motion_stops_text').hide();
				    $('#after_motion_stops .switchAction').text(actionText);
					$('#after_motion_stops .actionDuration').text(wemo.items['AfterMotionNothing']);
					wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rulesObj);
				}
			}
			
			//To return back to home page: device list tab
			$(".wemo_logo").on("tap", function(e) {
				if ( e.target.nodeName!= "IMG" ) {				
					wemoUtil.loadUrl(filePath.DEVICE_LIST);
				}
			});
	
			/**************** Change Sensor start action ******************/
			
			$("input[type='radio']").on('click', function(){
				$("input[name=switch_action]:checked").each(function() {
			        if($(this).val() === '1'){
			        		$('.after_motion_stops_text').show();
						   actionText = wemo.items['AfterMotionOff'];
						   sDuration=wemoUtil.formatMins(rulesObj.Devices[cd].SensorDuration);
						   rulesObj.Devices[cd].StartAction = parseInt($(this).val());
						   rulesObj.Devices[cd].EndAction='0';
					   }else if($(this).val() === '0'){
						   $('.after_motion_stops_text').show();
						   actionText = wemo.items['AfterMotionOn'];
						   sDuration=wemoUtil.formatMins(rulesObj.Devices[cd].SensorDuration);
						   rulesObj.Devices[cd].StartAction = parseInt($(this).val());
						   rulesObj.Devices[cd].EndAction='1';
					   }else if($(this).val() ==='2'){
						   rulesObj.Devices[cd].StartAction='2';
						   rulesObj.Devices[cd].EndAction = '2';
						   $('.after_motion_stops_text').hide();
						   actionText=sessionStore.AFTER_MOTION_STOPS_STATUS;
						   sDuration = wemo.items['AfterMotionNothing'];
					   }
			        
					rulesObj.Devices[cd].FName = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE_NAME);
			    });
				
				// Display Start action and Sensor Duration
				
				$('#after_motion_stops .switchAction').text(actionText);
				$('#after_motion_stops .actionDuration').text(sDuration);
				wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rulesObj);
				
			});
			
			//After Motion Stop on Click
			$("#after_motion_stops").on("tap", function(){
				wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rulesObj);
				wemoUtil.loadUrl(filePath.AFTER_MOTION_STOPS);
			});
			
			/**************** Save Motion Start Action, End Action and Duration ******************/
			$("#what_happens_save_btn").on("tap", function(){
				
				if (rulesObj.Devices[cd].EndAction=='2' && rulesObj.Devices[cd].StartAction=='2'){
					rulesObj.Devices[cd]={};
	                    delete rulesObj.Devices[cd];
				 }
				wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rulesObj);
				
				 var wemo_rule_type=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_TYPE);
                 if (wemo_rule_type=='edit_sensor_rule'){
 					wemoUtil.loadUrl(filePath.EDIT_SENSORS_RULE);
 				}else if (wemo_rule_type=='sensor_rule'){
 					wemoUtil.loadUrl(filePath.SENSORS_RULE);
 				}
			});
			
            $("#what_happens_cancel_btn").on("tap", function(){
            	// rulesObj.Devices[cd]={};
                // delete rulesObj.Devices[cd];
                 window.sessionStorage.setItem(sessionStore.RULE_NEW,JSON.stringify(rulesObj));
            	 wemoUtil.loadPreviousUrl();
			});

		},

		bindEvents : function() {
			console.log(TAG + "bindEvents");
			document.addEventListener('online', sensors_what_happens.onOnline, false);
			document.addEventListener('offline', sensors_what_happens.onOffline, false);
			document.addEventListener("backbutton", sensors_what_happens.onBackPress, false);
			document.addEventListener("pause", sensors_what_happens.onPause, false);
			document.addEventListener("resume", sensors_what_happens.onResume, false);
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
	    		var rulesObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
				if(Object.keys(rulesObj.Devices).length>0){
					rulesObj.Devices[window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE)]={};
		            delete rulesObj.Devices[window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE)];
				}
				
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
