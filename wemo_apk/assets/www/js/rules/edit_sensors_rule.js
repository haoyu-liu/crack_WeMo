/*
    edit_sensors_rule.js
    
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

var TAG = "edit_sensors_rule.js: ";

$(document).bind('pageinit', function() {
	edit_sensors_rule.initialize();
});

var edit_sensors_rule = {

		initialize : function() {
			console.log(TAG + "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

		onDeviceReady : function() {
			console.log(TAG + "onDeviceReady");
			edit_sensors_rule.bindEvents();
			
			//To return back to home page: device list tab
			$(".wemo_logo").on("tap", function(e) {
				if ( e.target.nodeName!= "IMG" ) {				
					wemoUtil.loadUrl(filePath.DEVICE_LIST);
				}
			});
			
			//For Rules Support Link
			$("#support_link").on('click', function(){
				   if (!isRemoteEnabled) {
			            deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
			        }
			        window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Help_Rules_Creation_Url']);
			        wemoUtil.loadUrl(filePath.HELP_CENTER);
			});
			
			var av_switches={},av_sensors={};
            var networktype = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_NETWORKTYPE);
            var remoteEnable = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_ENABLE);
			
            if ( networktype==networkType.HOME_NETWORK || networktype==null){
                console.log("Local Mode sensor...");

                deviceTabPlugin.execute(
                        function(params){
                            if(params.length>0){
                                $.each(params,function(inx){
                                    av_switches['"'+params[inx].udn+'"']=params[inx].friendlyName;
                                });
                             //   edit_sensors_rule.deviceListBorder();
                            }
                          //  else alert("No switches detected");

                        },
                        function(err){alert("Error detecting Switches");},
                        actions.SELECT_SWITCHES,[]
                 );

                deviceTabPlugin.execute(
                    function(params){
                        if(params.length>0){
                            $.each(params,function(inx){
                                av_switches['"'+params[inx].udn+'"']=params[inx].friendlyName;
                            });
                            //   edit_sensors_rule.deviceListBorder();
                        }
                        //  else alert("No switches detected");

                    },
                    function(err){alert("Error detecting Switches");},
                    actions.SELECT_INSIGHTS,[]
                );

                 deviceTabPlugin.execute(
                        function(params){
                            if(params.length>0){
                                $.each(params,function(inx){
                                    av_sensors['"'+params[inx].udn+'"']=params[inx].friendlyName;
                                });

                           //     edit_sensors_rule.deviceListBorder();
                            }
                          //  else alert("No Sensors detected");

                        },
                        function(err){alert("Error detecting Sensors");},
                        actions.SELECT_SENSORS,[]
                 );

    		}else if (networktype==networkType.REMOTE_WIFI || networktype == networkType.REMOTE_MOBILE){
    		    if(remoteEnable){
                    var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
                    var arraySensorObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SENSOR_DATA);
                	console.log("Switch count :: "+arraySwitchObjects.length);
                	console.log("Sensor count :: "+arraySensorObjects.length);
                    
                    if(arraySwitchObjects.length>0){
                        $.each(arraySwitchObjects,function(inx){
                            av_switches['"'+arraySwitchObjects[inx][key.DEVICE_UDN]+'"']=arraySwitchObjects[inx][key.DEVICE_FRIENDLY_NAME];
                        });
                    //    edit_sensors_rule.deviceListBorder();
                    }
                  //  else alert("No switches detected");

                    if(arraySensorObjects.length>0){
                        $.each(arraySensorObjects,function(inx){
                            av_sensors['"'+arraySensorObjects[inx][key.DEVICE_UDN]+'"']=arraySensorObjects[inx][key.DEVICE_FRIENDLY_NAME];
                        });

                   //     edit_sensors_rule.deviceListBorder();
                    }
                  //  else alert("No Sensors detected");

    		    }else{
		    		navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {loadUrlTimeoutValue : 60000});
    		    }
    		}

            edit_sensors_rule.populate(av_switches,av_sensors,networktype,remoteEnable);
		
        },
        
        
	hideWhatHappen : function(networktype,remoteEnable,rulesObj) {
	    console.log("success creating the table structures");
        if ( networktype==networkType.HOME_NETWORK || networktype==null){
            console.log("Local Mode...");

            // ******* Validate available and selected switches list ******* //       
    		deviceTabPlugin.execute(
                function(params){
                    if(params.length == Object.keys(rulesObj.Devices).length){
                        $('#sensors_rule_what_happens .what_happens_select_switches').hide();
                    }
                },
                function(err){console.log("Error getting sensors list")},
                actions.SELECT_SWITCHES,
                []);
	
		}else if (networktype==networkType.REMOTE_WIFI || networktype == networkType.REMOTE_MOBILE){
		    if(remoteEnable){
                var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);

                if(arraySwitchObjects.length== Object.keys(rulesObj.Devices).length){
                    $('#sensors_rule_what_happens .what_happens_select_switches').hide();
                }

		    }else{
	    		navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {loadUrlTimeoutValue : 60000});
		    }
		}
	    
	},
        
    populate:function(av_switches,av_sensors,networktype,remoteEnable){
		var rulesObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);	
		//alert(JSON.stringify(rulesObj));
		
		/**************** Fallback object of RULE_NEW ::  Edit Mode ******************/
		wemoUtil.setJSONObjectToSessionStorage(sessionStore.FALL_BACK,rulesObj);
		
		window.sessionStorage.setItem(sessionStore.RULE_TYPE,JSON.stringify("edit_sensor_rule")); // Added for What Happens, After Motion Stops, Edit Sensitivity and Rule Name page redirection 
		
		/**************** Display RuleName, Day and Time/SRSS ::  Edit Mode ******************/
		
		var displayDate = "";
   	 
   	 	rulesObj.When.EndTime=parseInt(rulesObj.When.StartTime)+parseInt(rulesObj.When.RuleDuration);
   	 	rulesObj.When.EndTime=(Math.ceil((rulesObj.When.EndTime/10)))*10;
	 	if (rulesObj.When.StartSRSS==undefined && rulesObj.When.EndSRSS==undefined){
	 		 if (rulesObj.When.StartTime==sessionStore.ALLDAY_STARTTIME && rulesObj.When.EndTime==sessionStore.ALLDAY_ENDTIME){
	 			displayDate=sessionStore.SENSOR_ALLDAY+", "
	    	 }else{
	    		 displayDate= wemoUtil.returnTime(rulesObj.When.StartTime, (Math.ceil((rulesObj.When.RuleDuration/10)))*10);
	    	 }
	   	}else if (rulesObj.When.StartSRSS==undefined && rulesObj.When.EndSRSS!=undefined) {
	   		
	   		if(rulesObj.When.EndSRSS == "Sunrise")
        	{
        		var tempEndSRSS = wemo.items['SunRise'];
        	}
        	else if(rulesObj.When.EndSRSS == "Sunset")
        	{
        		var tempEndSRSS = wemo.items['SunSet'];
        	}
        	else{var tempEndSRSS = rulesObj.When.EndSRSS;}
	   		
	   		displayDate=(wemoUtil.convertMillisecondsToAMPM(rulesObj.When.StartTime)+" - "+tempEndSRSS)+" ,";
	   	}else if (rulesObj.When.StartSRSS!=undefined && rulesObj.When.EndSRSS==undefined) {
	   		
	   		if(rulesObj.When.StartSRSS == "Sunrise")
        	{
        		var tempStartSRSS = wemo.items['SunRise'];
        	}
        	else if(rulesObj.When.StartSRSS == "Sunset")
        	{
        		var tempStartSRSS = wemo.items['SunSet'];
        	}
        	else{var tempStartSRSS = rulesObj.When.StartSRSS;}
	   		
	   		displayDate=(tempStartSRSS+" - "+wemoUtil.convertMillisecondsToAMPM(rulesObj.When.EndTime))+" ,";
	   	}else if (rulesObj.When.StartSRSS!=undefined && rulesObj.When.EndSRSS!=undefined) {
	   		
	   		if(rulesObj.When.StartSRSS == "Sunrise")
        	{
        		var tempStartSRSS = wemo.items['SunRise'];
        	}
        	else if(rulesObj.When.StartSRSS == "Sunset")
        	{
        		var tempStartSRSS = wemo.items['SunSet'];
        	}
        	else{var tempStartSRSS = rulesObj.When.StartSRSS;}
	   		
	   		if(rulesObj.When.EndSRSS == "Sunrise")
        	{
        		var tempEndSRSS = wemo.items['SunRise'];
        	}
        	else if(rulesObj.When.EndSRSS == "Sunset")
        	{
        		var tempEndSRSS = wemo.items['SunSet'];
        	}
        	else{var tempEndSRSS = rulesObj.When.EndSRSS;}
	   		
	   		displayDate=(tempStartSRSS+" - "+tempEndSRSS)+" ,";
	   	}
			 	
		$("#sensors_rule_when .select_time").text(displayDate);
		
		if(rulesObj.SelectedDayOrRange == "Weekday" || rulesObj.SelectedDayOrRange == "Weekend" || rulesObj.SelectedDayOrRange == "Daily")
		{
			var tempSelectedDayOrRange = rulesObj.SelectedDayOrRange;
			if(tempSelectedDayOrRange == "Weekday"){ tempSelectedDayOrRange = wemo.items['WeekdaysNoDetails'];}
			else if(tempSelectedDayOrRange == "Weekend"){ tempSelectedDayOrRange = wemo.items['WeekendsNoDetails'];}
			else{ tempSelectedDayOrRange = wemo.items[tempSelectedDayOrRange];}						
		}
		else if(rulesObj.SelectedDayOrRange == "Weekdays" || rulesObj.SelectedDayOrRange == "Weekends" || rulesObj.SelectedDayOrRange == "Daily")
		{
			var tempSelectedDayOrRange = rulesObj.SelectedDayOrRange;
			if(tempSelectedDayOrRange == "Weekdays"){ tempSelectedDayOrRange = wemo.items['WeekdaysNoDetails'];}
			else if(tempSelectedDayOrRange == "Weekends"){ tempSelectedDayOrRange = wemo.items['WeekendsNoDetails'];}
			else{ tempSelectedDayOrRange = wemo.items[tempSelectedDayOrRange];}						
		}
		else
		{
			var strDays = rulesObj.SelectedDayOrRange;
            var arrDays = strDays.split("-");
            var displaySelectedVal = [];
            var tempSelectedDayOrRange = "";
            
            if(arrDays.length > 0)
            {
            	for(var i=0; i < arrDays.length; i++){                	 
                	
                	var temp = arrDays[i];
                	console.log("temp val "+temp);
                	
					if(temp == "Mon"){displaySelectedVal[i] = wemo.items['MondayShort'];}
					if(temp == "Tue"){displaySelectedVal[i] = wemo.items['TuesdayShort'];}
					if(temp == "Wed"){displaySelectedVal[i] = wemo.items['WednesdayShort'];}
					if(temp == "Thu"){displaySelectedVal[i] = wemo.items['ThursdayShort'];}
					if(temp == "Fri"){displaySelectedVal[i] = wemo.items['FridayShort'];}
					if(temp == "Sat"){displaySelectedVal[i] = wemo.items['SaturdayShort'];}
					if(temp == "Sun"){displaySelectedVal[i] = wemo.items['SundayShort'];}
					console.log("transforming value "+displaySelectedVal[i]);	
                }
            	
            	if(arrDays.length == 1)
            	{
            		tempSelectedDayOrRange = displaySelectedVal;
            	}
            	else
            	{
            		tempSelectedDayOrRange = displaySelectedVal.join("-");
            	}
            	
            	
            }
		}
		
	    $("#sensors_rule_when .select_day").html(tempSelectedDayOrRange);
	    
	     //display Rule Name
		
	     var rulenameObj = rulesObj.RuleName;
		 var searchRule = rulenameObj.search("Rule");
		 var tempDisRulename ="";
		 
		 if(searchRule != -1 || searchRule == false)
		 {
			 var rulenamepart1 = wemo.items['Rule'];			 
			 tempDisRulename = rulenameObj.replace("Rule", rulenamepart1);
		 }
		 else
		 {
			 tempDisRulename= rulenameObj;
		 }
		 
	    $('#rule_name').html(tempDisRulename);
	    
		
	    /**************** Display Selected Device List ::  Edit Mode ******************/
	    var html="";
	    var devicefriendlyname="";
	    if(Object.keys(rulesObj.Devices).length>0){
	        
	        
	        for(key in rulesObj.Devices){
	        	console.log("Devices Object :: "+key+"      "+rulesObj.Devices[key]);
	        	//var state="Do Nothing";
	        	var state=wemo.items['AfterMotionNothing'];
	            if(rulesObj.Devices[key].StartAction == "1"){
	                //state="Turns on";
	            	state=wemo.items['AfterMotionOn'];
	            }
	            else if(rulesObj.Devices[key].StartAction == "0"){
	                //state="Turns off";
	            	state=wemo.items['AfterMotionOff'];
	            }
	           
	            if (av_switches['"'+key+'"']==undefined) /*devicefriendlyname="Switch is not present";*/ devicefriendlyname = wemo.items['SwitchNotFound'];
	            else
	            	devicefriendlyname=av_switches['"'+key+'"'];
	            
				window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE,key);
				window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE_NAME,devicefriendlyname);
	            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rulesObj);
	            console.log("For Net Cam:  "+key);
	            if(key.match(/NetCam/)){
	            	html+='<li data-udn="'+key+'" data-fName="'+wemoUtil.extractNetCamName(devicefriendlyname)+'" class="selected_device_list"><div><span class="more_li_text_div text_strong" localString="true" _key="WhatHappens">'+wemoUtil.extractNetCamName(devicefriendlyname)+'</span><span class="more_li_text_right" localString="true" _key="SelectSwitches">'+state+'</span></div></li>';
	            }else{
	            	html+='<li data-udn="'+key+'" data-fName="'+devicefriendlyname+'" class="selected_device_list"><div><span class="more_li_text_div text_strong" localString="true" _key="WhatHappens">'+devicefriendlyname+'</span><span class="more_li_text_right" localString="true" _key="SelectSwitches">'+state+'</span></div></li>';
	            }
	        }
	        $('#sensors_rule_selected_device').html(html);
	    }
	    
	    edit_sensors_rule.hideWhatHappen(networktype,remoteEnable,rulesObj);
	    
	    /**************** Display Selected Sensors List ::  Edit Mode ******************/
		
		var availableSensors=[];
		 if(rulesObj.SelectedSensors != undefined){
				arrSelectedSensors = rulesObj.SelectedSensors.split(",");
				//arrSelectedSensors.pop();
				for(var i=0; i<arrSelectedSensors.length; i++){
					if (av_sensors[arrSelectedSensors[i]]!=undefined){
						availableSensors.push(arrSelectedSensors[i]);
					 }
				}
				var availableSensorsList=availableSensors.length+" ";
				
				//alert("availableSensors :: "+av_sensors[availableSensors]);
				
				if (availableSensors.length>1){
					var strTemp = availableSensorsList.length+" ";
                	strTemp += availableSensorsList.length>=2 ? "Sensors" : "Sensor";
                	$('#sensors_rule_if .sensorCount').html(strTemp);
				}else{
					console.log("arrSelectedSensors:  "+arrSelectedSensors+"  ::  arrSelectedSensors[0]::  "+arrSelectedSensors[0]+"  ::  av_sensors[availableSensors]::  "+av_sensors[availableSensors]);
					if(arrSelectedSensors.length == 1){
						if(arrSelectedSensors[0].match(/NetCam/)){
							$('#sensors_rule_if .sensorCount').html(wemoUtil.extractNetCamName(devicefriendlyname));

						}else{
							$('#sensors_rule_if .sensorCount').html(av_sensors[availableSensors]);
						}
					}
				}
				
					//availableSensorsList += (availableSensors.length >=2) ? "Sensors" : "Sensor";
		 }
	
		// $('#sensors_rule_if .more_li_text_right').html(availableSensorsList);
		 
		 /**************** Check SWITCH/SENSORS availability ::  Edit Mode ******************/
		  
		 if (Object.keys(rulesObj.Devices).length<=0){
			  $("#sensors_rule_save_btn").button("disable");
 		  }else{
     		$("#sensors_rule_save_btn").button("enable");
     	  }
	
		 /**************** Save Motion Controlled Rule ::  Edit Mode ******************/
	    
	     $("#sensors_rule_save_btn").on('click', function(){
	    	console.log("Saveing Sensor Rule");
	    	selectedRuleID=rulesObj.id;
			 
	    	if(Object.keys(rulesObj.Devices).length==0){
				 alert("Please select Device.");
				 return;
			 }else{
				 for(key in rulesObj.Devices){
					 if (av_switches['"'+key+'"']==undefined) 
					 {
						 var msg = wemo.items['RuleCantBeSaved'];
						 alert(msg);
						 //alert("Having trouble saving this rule now. Please check the status of all your WeMo devices.");
						 return;
					 }
				 }
			 }
			 
			 if(rulesObj.SelectedSensors === undefined){
				 alert("Please select Sensor.");
				 return;
			 }else{
				 
				 if(rulesObj.SelectedSensors != undefined){
						arrSelectedSensors = rulesObj.SelectedSensors.split(",");
						for(var i=0; i<arrSelectedSensors.length; i++){
							if (av_sensors[arrSelectedSensors[i]]==undefined) 
							 {
								 alert("Please check wemo sensors.");
								 return;
							 }
						}
				 }
			 }
			 
			 /**************** If RuleDuration is not defined ******************/
			 
			 if (rulesObj.When.RuleDuration==undefined){
				 var StartTimeAM='false';
				 var EndTimeAM='false';
				 StartTimeAM=(wemoUtil.convertMillisecondsToAMPM(rulesObj.When.StartTime).lastIndexOf("AM")!=-1) ? 'true' : 'false';
				 EndTimeAM=(wemoUtil.convertMillisecondsToAMPM(rulesObj.When.EndTime).lastIndexOf("AM")!=-1) ? 'true' : 'false';				 
				 if (rulesObj.When.EndTime<rulesObj.When.StartTime){
					if (StartTimeAM==EndTimeAM) {
						rulesObj.When.RuleDuration=86400-(parseInt(rulesObj.When.StartTime)-parseInt(rulesObj.When.EndTime)); 
					}else{
						rulesObj.When.RuleDuration=(86400-(parseInt(rulesObj.When.StartTime)))+parseInt(rulesObj.When.EndTime);
					}
				 }else{
					 rulesObj.When.RuleDuration=rulesObj.When.EndTime-rulesObj.When.StartTime;
				 }
			 }
			 
			//-------------------SRSS--------------------
         	//Plug-in Call To Get Firmware Version SRSS
				if(rulesObj.When.StartSRSS != undefined || rulesObj.When.EndSRSS != undefined){
	        		if(Object.keys(rulesObj.Devices).length>0){
	                    for(key in rulesObj.Devices){
	                    	console.log("SRSS - UDN Firmware Version - "+key+"  ::  "+rulesObj.Devices[key]);
	                    	rulesObj.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
	                		//alert("Save - isFirmWareSupported: 1 "+rulesObj.When.isFirmWareSupported);
	                    }
	                  //alert("Save - isFirmWareSupported: 2 "+rulesObj.When.isFirmWareSupported);
	        		}
				}
         	//-------------------SRSS--------------------
				 
				window.sessionStorage.setItem(sessionStore.RULE_TYPE,JSON.stringify("edit_sensor_rule"));
				rulesObj.RuleType = sessionStore.MOTION_CONTROLLED;
				wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rulesObj);
				console.log("Saveing Sensor Rule")
				
				if(rulesObj.When.isFirmWareSupported != undefined && rulesObj.When.isFirmWareSupported === "false"){
					$("#sunrise_firmware_upgrade" ).popup( "open" );
				}else{
					saveNewRule_RULES_RULEDEVICES(rulesObj.RuleType, rulesObj);
				}
			 
	    });	
	     
	     $("#sunrise_firmware_upgrade_updatenow").on("click", function(){
	    	 
	    	 	var pendingFirmware = "pendingFirmware";			    		
		    	wemoUtil.setJSONObjectToSessionStorage(sessionStore.PENDING_FIRMWARE,pendingFirmware);
		    	
				$("#sunrise_firmware_upgrade" ).popup( "close" );
				rulesObj.RuleType = sessionStore.MOTION_CONTROLLED;
				if(Object.keys(rulesObj.Devices).length>0){
		             for(key in rulesObj.Devices){
		             	rulesObj.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
		             	wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rulesObj);
		             }
				}
				saveNewRule_RULES_RULEDEVICES(rulesObj.RuleType, rulesObj);
				
				//wemoUtil.loadUrl(filePath.MORE_NEW_FIRMWARE);
		 });
		 
		 $('#sunrise_firmware_upgrade_later').on('click',function(){
			//alert("Save Rule");
			$("#sunrise_firmware_upgrade").popup('close');
			rulesObj.RuleType = sessionStore.MOTION_CONTROLLED;
			if(Object.keys(rulesObj.Devices).length>0){
	             for(key in rulesObj.Devices){
	             	rulesObj.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
	             	wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rulesObj);
	             }
			}
			saveNewRule_RULES_RULEDEVICES(rulesObj.RuleType, rulesObj);
		 });
		
		//Edit selected switches
		$("#sensors_rule_what_happens").on("tap", function(){
			window.sessionStorage.setItem(sessionStore.RULE_TYPE,JSON.stringify("edit_sensor_rule"));
			wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rulesObj);
			wemoUtil.loadUrl(filePath.SELECT_SWITCHES);
	    });
		
		//Edit selected devices
	    $("#sensors_rule_selected_device").find("li").on("tap", function(){
	    	window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE,$(this).attr("data-udn"));
			window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE_NAME,$(this).attr("data-fName"));
			window.sessionStorage.setItem(sessionStore.RULE_TYPE,JSON.stringify("edit_sensor_rule"));
	    	wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rulesObj);
	        wemoUtil.loadUrl(filePath.SENSORS_WHAT_HAPPENS);
	    });
		 
	    //Edit sensors
	    $("#sensors_rule_if").on("tap", function(){
	    	window.sessionStorage.setItem(sessionStore.RULE_TYPE,JSON.stringify("edit_sensor_rule"));
	    	wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rulesObj);
	        wemoUtil.loadUrl(filePath.SELECT_SENSORS);
	    });
		 
	    //Edit Timers
	    $("#sensors_rule_when").on("tap", function(){
	    	window.sessionStorage.setItem(sessionStore.RULE_TYPE,JSON.stringify("edit_sensor_rule"));
	    	wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rulesObj);
	        wemoUtil.loadUrl(filePath.SENSORS_RULE_WHEN);
	    });
	    
	    //Edit Rule Name
	    $("#sensors_rule_rule_name").on("tap", function(){
	    	window.sessionStorage.setItem(sessionStore.RULE_TYPE,JSON.stringify("edit_sensor_rule"));
	    	wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rulesObj);
	        wemoUtil.loadUrl(filePath.RULE_NAME);
	    });
	    
		//Cancel
		$('#sensors_rule_cancel_btn').on('pointerdown',function(){
			 if (parseInt(JSON.parse(window.sessionStorage.getItem(sessionStore.RULES_DATA)).length)>0){
				 wemoUtil.loadUrl(filePath.ENABLED_RULES);
			 }else{
				 wemoUtil.loadUrl(filePath.CREATE_RULE);
			 }
		});

    },
	
    bindEvents : function() {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', edit_sensors_rule.onOnline, false);
        document.addEventListener('offline', edit_sensors_rule.onOffline, false);
        document.addEventListener("backbutton", edit_sensors_rule.onBackPress, false);
        document.addEventListener("pause", edit_sensors_rule.onPause, false);
        document.addEventListener("resume", edit_sensors_rule.onResume, false);
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
    },
		
    showModal: function (msg) {
        $("body").append('<div id="mask" class="modalWindow"/>');
	        
        $.mobile.showPageLoadingMsg("a", msg);
    },
	    
    loaderStateCheck:function(){
        var msg;
        flag=false;
        var state = "success";
        if(state==="working"){
            msg = wemo.items['RULE_STATUS_REFRESHING_DB'];
        }else if(state==="something"){
            msg = wemo.items['AppStatusWaiting'];
        }else if(state==="something"){
            msg = wemo.items['AppStatusWorking'];
        }else if(state==="successnot"){
            msg = wemo.items['RULE_STATUS_CHECKING_CONFLICTS'];
        }else if(state==="something"){
            msg = wemo.items['RULE_STATUS_SENDING_DB'];
        }else if(state==="success"){
            msg = ' ';
            flag=true;
			   
            var elem = $(".ui-loader-verbose").find("h1");
			   
            $(".ui-loader").css({
                background : "url('../img/Actions-dialog-ok-apply-icon.png') no-repeat scroll 119px center #000000",
                height: "44px"
            });
			   
        }
    },
	    
    showPopup:function(){
        //Rule conflict Popup
       /* $("#rule_conflict_learn_more_btn").on("tap", function(){
            alert("Your Data has Saved");
            $("#rule_conflict" ).popup( "close" );
        });
		    
        $("#rule_conflict_ok_btn").on("tap", function(){
            alert("Your Data has Saved");
            $("#rule_conflict" ).popup( "close" );
        });*/
		    
        //Rules Can not be saved Popup
        $("#rule_can_not_save_ok").on("tap", function(){
            alert("Rules Can't be saved");
            $("#rule_can_not_save" ).popup( "close" );
        });
		    
        //Rule Duplicate Popup
        /*$("#rule_duplicate_learn_more_btn").on("tap", function(){
            alert("Learn More");
            $("#rule_duplicate" ).popup( "close" );
        });
		    
        $("#rule_duplicate_ok_btn").on("tap", function(){
            alert("Rule Duplicate");
            $("#rule_duplicate" ).popup( "close" );
        });*/
		    
        //sunrise firmware upgrade Popup
        $("#sunrise_firmware_upgrade_later").on("tap", function(){
            alert("Learn More");
            $("#sunrise_firmware_upgrade" ).popup( "close" );
        });
		    
        $("#sunrise_firmware_upgrade_updatenow").on("tap", function(){
            alert("Rule Duplicate");
            $("#sunrise_firmware_upgrade" ).popup( "close" );
        });
		    
    }

};
