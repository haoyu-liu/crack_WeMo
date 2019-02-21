/*
    what_happens.js

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

var TAG = "what_happens.js: ";

$(document).bind('pageinit', function() {
	what_happens.initialize();
});

var what_happens = {

		initialize : function() {
			console.log(TAG + "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

		onDeviceReady : function() {
			console.log(TAG + "onDeviceReady");
			what_happens.bindEvents();
			//All initialization script goes here
			
			$("#what_happens_cancel_btn").on('pointerdown', function(){
				wemoUtil.loadPreviousUrl();
			});
            var x=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.SIMPLE_FALL_BACK,x);
            var cd = window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE);
            
            console.log("x val "+x+" cd val "+cd);
            console.log("x val11 "+JSON.stringify(x));

            var iconURL = '';
            nativeUtilPlugin.execute(
                function(base64String){
                    console.log('got image from DB success');
                    iconURL = "data:image/png;base64, " + base64String;
                },
                what_happens.reportError,
                actions.GET_BASE64_IMAGE_FROM_DB,
                [cd]
            );

            if(iconURL === null || iconURL == '') {
                if(cd.indexOf('Lightswitch') != -1){
                    $('#what_happens img.what_happen_device_icon').attr('src','../img/belkin_light_switch_small.png');
                }
                if(cd.indexOf('Socket') != -1){
                    $('#what_happens img.what_happen_device_icon').attr('src','../img/belkin_switch_big.png');
                }
            }

            $('#what_happens img.what_happen_device_icon').attr('src',iconURL);

            $('#device_name').html(window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE_NAME));
            
            console.log("value of devices "+x.Devices+" arr "+x.Devices[cd]);
            
            if(x.Devices[cd]){
                $("input[type='radio']").each(function(){
                 	console.log("redio button "+$(this).val()+" device val "+x.Devices[cd].StartAction);
                 	
                 	$(this).attr("checked",false).checkboxradio("refresh");
                 	
                    if($(this).val() == x.Devices[cd].StartAction){
                    	console.log("redio button1 "+$(this).val()+" device val1 "+x.Devices[cd].StartAction);
                        $(this).attr("checked",true).checkboxradio("refresh");
                    }
                });
            }
            else{
            	
            	$("input[type='radio']").each(function(){
            		 console.log("entering loop radio");
            		 
            		 
            		 if($(this).val() == "2")
            		 {
            			  console.log("entering if cond "+$(this).val());
            			  $(this).attr("checked",true).checkboxradio("refresh");
            		 }
            		 else
            		 {
            			  $(this).attr("checked",false).checkboxradio("refresh");
            		 }
            	});            	
          
            }
			
			//To return back to home page: device list tab
			$(".wemo_logo").on("tap", function(e) {
				if ( e.target.nodeName!= "IMG" ) {				
					wemoUtil.loadUrl(filePath.DEVICE_LIST);
				}
			});


            $("#what_happens_save_btn").on('pointerdown', function(){
				  $("input[type='radio']").each(function(){
						var select_days = $("input[type='radio']").is(":checked");
						$("[name='select_day']").checkboxradio("refresh");
						if($(this).is(':checked')){
                           if($(this).val()==2){
                                x.Devices[cd]={};
                                delete x.Devices[cd];
                            }
                            else{
                            //	alert(parseInt($(this).val()));
                            	if(x.DeviceList == undefined){
                            		x.DeviceList = "";
                            	}
                            //	alert("Device "+x.Devices[cd].StartAction);
                            	x.DeviceList += cd;
                                x.Devices[cd]={};
                                x.Devices[cd].StartAction=parseInt($(this).val());
                                x.Devices[cd].EndAction=(x.Devices[cd].StartAction)=="1"?"0":"1";
                           //     alert("Device "+x.Devices[cd].EndAction);
                                x.Devices[cd].SensorDuration='-1';
                                x.Devices[cd].FName=window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE_NAME);

                            }

                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,x);

                        }
				   });
				  var wemo_rule_type=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_TYPE);
	              
                  console.log("sessionStore.RULE_TYPE = " + sessionStore.RULE_TYPE);
                    
					if (wemo_rule_type=='simple_rule'){
						wemoUtil.loadUrl(filePath.NEW_RULE);
					}else if (wemo_rule_type=='timer_rule'){
						wemoUtil.loadUrl(filePath.TIMER_RULE);	
					}else if (wemo_rule_type=='sensor_rule'){
						wemoUtil.loadUrl(filePath.SENSORS_RULE);
					}else if (wemo_rule_type=='edit_simple_rule'){
						wemoUtil.loadUrl(filePath.EDIT_SIMPLE_RULE);
					}else if (wemo_rule_type=='edit_timer_rule'){
						wemoUtil.loadUrl(filePath.EDIT_TIMER_RULE);
					}else if (wemo_rule_type=='edit_sensor_rule'){
						wemoUtil.loadUrl(filePath.EDIT_SENSORS_RULE);
                    }else if (wemo_rule_type=='edit_notify_rule'){
                        wemoUtil.loadUrl(filePath.EDIT_NOTIFY_RULE);
					}
					
					
				  //Need to redirect to the previous rule page [Simgle, Timer, Sensor];
			});

		},

		bindEvents : function() {
			console.log(TAG + "bindEvents");
			document.addEventListener('online', what_happens.onOnline, false);
			document.addEventListener('offline', what_happens.onOffline, false);
			document.addEventListener("backbutton", what_happens.onBackPress, false);
			document.addEventListener("pause", what_happens.onPause, false);
			document.addEventListener("resume", what_happens.onResume, false);
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
