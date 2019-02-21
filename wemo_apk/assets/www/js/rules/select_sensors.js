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

			
			var av_switches=[],av_sensors=[];
	        var networktype = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_NETWORKTYPE);
	        var remoteEnable = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_ENABLE);
			
			
	        if ( networktype==networkType.HOME_NETWORK || networktype==null){
                console.log("Local Mode...");

                deviceTabPlugin.execute(
                        function(params){
                            if(params.length>0){
                                $.each(params,function(inx){
                                    av_switches[params[inx].udn]=params[inx].friendlyName;
                                });
                        //    rule_details.deviceListBorder();
                            }
                            else alert("No switches detected");

                        },
                        function(err){alert("Error detecting Switches");},
                        actions.SELECT_SWITCHES,[]
                    );


                    deviceTabPlugin.execute(
                        function(params){
                            if(params.length>0){
                                $.each(params,function(inx){
                                    av_sensors[params[inx].udn]=params[inx].friendlyName;
                                });

                        //    rule_details.deviceListBorder();
                            }
                            else alert("No Sensors detected");

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
                            av_switches[arraySwitchObjects[inx][key.DEVICE_UDN]]=arraySwitchObjects[inx][key.DEVICE_FRIENDLY_NAME];
                        });
                //    rule_details.deviceListBorder();
                    }
                    else alert("No switches detected");

                    if(arraySensorObjects.length>0){
                        $.each(arraySensorObjects,function(inx){
                            av_sensors[arraySensorObjects[inx][key.DEVICE_UDN]]=arraySensorObjects[inx][key.DEVICE_FRIENDLY_NAME];
                        });

                 //   rule_details.deviceListBorder();
                    }
                    else alert("No Sensors detected");

			    }else{
		    		navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {loadUrlTimeoutValue : 60000});
			    }
			}
			
			
			//All initialization script goes here
			var ruleObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
			//alert(JSON.stringify(ruleObj));
			var selectedSensors = "";
			//var arrAvailableSensors = [];
			var arrSelectedSensors = [];
			
			if (ruleObj.SelectedSensorsValue == undefined)
			{
				var sensorStrength = wemo.items['High'];
				$("#sensors_sensitivity .sensorSensitivity").text(sensorStrength);
			}else{
				
				var sensorStrength = wemoUtil.returnSensorStrength(ruleObj.SelectedSensorsValue);
                
                if(sensorStrength == "Very High"){sensorStrength = wemo.items['VeryHigh'];}
           	 	else if(sensorStrength == "High"){sensorStrength = wemo.items['High'];}
           	 	else if(sensorStrength == "Medium"){sensorStrength = wemo.items['Medium'];} 
           	 	else if(sensorStrength == "Low"){sensorStrength = wemo.items['Low'];} 
                
				$("#sensors_sensitivity .sensorSensitivity").text(sensorStrength);
			}
			

            if(ruleObj.SelectedSensorsValue == undefined || ruleObj.SelectedSensorsValue == ''){
                ruleObj.SelectedSensorsValue = "100";
            }
            if(ruleObj.SelectedSensorsValue == "75"){
            	var sensorStrength = wemo.items['High'];
                $('.more_li_text_right').html(sensorStrength);
            }
            else if(ruleObj.SelectedSensorsValue == "50"){
            	var sensorStrength = wemo.items['Medium'];
                $('.more_li_text_right').html(sensorStrength);
            }
            else if(ruleObj.SelectedSensorsValue == "25"){
            	var sensorStrength = wemo.items['Low'];
                $('.more_li_text_right').html(sensorStrength);
            }
            else{
            	var sensorStrength = wemo.items['VeryHigh'];
                $('.more_li_text_right').html(sensorStrength);
            }

            select_sensors.selectSensor(networktype,remoteEnable);

			console.log("****** Selected Sensors ****** "+ruleObj.SelectedSensors);
			
			if(ruleObj.SelectedSensors != undefined && ruleObj.SelectedSensors != ''){
				arrSelectedSensors = ruleObj.SelectedSensors.split(",");
				for(var i=0; i<arrSelectedSensors.length; i++){
					if (av_sensors[arrSelectedSensors[i]]!=undefined){
						console.log("arrSelectedSensors["+i+"] ::  "+arrSelectedSensors[i]);
						$("[name='select_sensors_list']").each(function(){
							console.log("arrSelectedSensors["+i+"] ::  "+arrSelectedSensors[i]+" === "+$(this).val());
							if($(this).val() === arrSelectedSensors[i]){
								console.log("arrSelectedSensors Match Found:  "+$(this).val()+" === "+arrSelectedSensors[i]);
								$(this).attr("checked","checked");
								$("[name='select_sensors_list']").checkboxradio("refresh");
							}
						});
					}
				}
			}
			
			//To return back to home page: device list tab
			$(".wemo_logo").on("tap", function(e) {
				if ( e.target.nodeName!= "IMG" ) {				
					wemoUtil.loadUrl(filePath.DEVICE_LIST);
				}
			});
			
			$("#sensors_sensitivity").on("tap", function(){
				$("[name='select_sensors_list']").each(function(){
					if($(this).is(':checked')){
						console.log("Selected Sensor:   "+$(this).val());
					    selectedSensors += $(this).val()+",";
					}
				});
				if(selectedSensors != ""){
					selectedSensors = selectedSensors.substr(0, selectedSensors.lastIndexOf(","));
	            	ruleObj.SelectedSensors = selectedSensors;
	            	wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,ruleObj);
					wemoUtil.loadUrl(filePath.EDIT_SENSITIVITY);
				}else{
					alert("Please select Sensor");
				}
			});

            //Save Button on Click
            $("#sensors_save_btn").on("tap", function(){
                $("[name='select_sensors_list']").each(function(){
                    if($(this).is(':checked')){
                        console.log("Selected Sensor:   "+$(this).val());
                        selectedSensors += $(this).val()+",";
                       // alert($(this).attr("data-fname"));
                        var sensorFname=$(this).attr("data-fname");
                        window.sessionStorage.setItem(sessionStore.CURRENT_SENSOR_NAME,sensorFname);
                    	ruleObj.SelectedSensorName=window.sessionStorage.getItem(sessionStore.CURRENT_SENSOR_NAME);
                    }
                });
                
              //  alert("selectedSensors :: "+selectedSensors+' :: '+selectedSensors.length);
                
                if(selectedSensors != ""){
                    selectedSensors = selectedSensors.substr(0, selectedSensors.lastIndexOf(","));
                    ruleObj.SelectedSensors = selectedSensors;
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,ruleObj);
                    var wemo_rule_type=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_TYPE);
                    if (wemo_rule_type=='edit_sensor_rule'){
    					wemoUtil.loadUrl(filePath.EDIT_SENSORS_RULE);
    				}else if (wemo_rule_type=='sensor_rule'){
    					wemoUtil.loadUrl(filePath.SENSORS_RULE);
    				}
                }else{
                    alert("Please select Sensor");
                }

            });

            //Cancel Button on Click
            $("#sensors_cancel_btn").on("tap", function(){
                wemoUtil.loadPreviousUrl();
            });
        },

    selectSensor : function(networktype,remoteEnable) {
        console.log("success creating the table structures");
        if ( networktype==networkType.HOME_NETWORK || networktype==null){
            console.log("Local Mode...");
            deviceTabPlugin.execute(
                function(params){
                    if(params.length>0){
                        var list="";
                        $('#sensors_list').html("");
                        $.each(params,function(inx){
                        	console.log("UDN value = "+params[inx].udn+"    "+params[inx].friendlyName);
                        	/*
                        	 * Show Friendly name for NetCam without the user id coming along with.
                        	 * Start
                        	 * */
                        	if(params[inx].udn.match(/NetCam/)){
                        		list=list+'<div><input class="select_sensors" type="checkbox" name="select_sensors_list" id="'+inx+'" data-fname="'+(wemoUtil.extractNetCamName(params[inx].friendlyName))+'" value="'+params[inx].udn+'"/><label for="'+inx+'"><span>'+(wemoUtil.extractNetCamName(params[inx].friendlyName))+'</span></label></div>';
                        		/*End*/
                        	}else{
                        		list=list+'<div><input class="select_sensors" type="checkbox" name="select_sensors_list" id="'+inx+'" data-fname="'+params[inx].friendlyName+'" value="'+params[inx].udn+'"/><label for="'+inx+'"><span>'+params[inx].friendlyName+'</span></label></div>';
                        	}
                        });
                        $('#sensors_list').html(list);
                        $('#sensors_list').trigger('create');
                    }
                    else alert("No sensors detected");
                },
                function(err){alert("No sensors detected");},
                actions.SELECT_SENSORS,
                []);
		}else if (networktype==networkType.REMOTE_WIFI || networktype == networkType.REMOTE_MOBILE){
		    if(remoteEnable){
                var arraySensorObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SENSOR_DATA);

                if(arraySensorObjects.length>0){
                    var list="";
                    $('#sensors_list').html("");
                    $.each(arraySensorObjects,function(inx){
                        //	alert("UDN : "+arraySwitchObjects[inx][key.DEVICE_UDN]);
                    	/*
                    	 * Show Friendly name for NetCam without the user id coming along with.
                    	 * Start
                    	 * */
                    	if(arraySensorObjects[inx][key.DEVICE_UDN].match(/NetCam/)){
                    		list=list+'<div><input class="select_sensors" type="checkbox" name="select_sensors_list" id="'+inx+'" data-fname="'+(arraySensorObjects[inx][key.DEVICE_FRIENDLY_NAME].substr(0, arraySensorObjects[inx][key.DEVICE_FRIENDLY_NAME].indexOf(',')))+'" value="'+arraySensorObjects[inx][key.DEVICE_UDN]+'"/><label for="'+inx+'"><span>'+(arraySensorObjects[inx][key.DEVICE_FRIENDLY_NAME].substr(0, arraySensorObjects[inx][key.DEVICE_FRIENDLY_NAME].indexOf(',')))+'</span></label></div>';
                    		/*End*/
                    	}else{
                    		list=list+'<div><input class="select_sensors" type="checkbox" name="select_sensors_list" id="'+inx+'" data-fname="'+arraySensorObjects[inx][key.DEVICE_FRIENDLY_NAME]+'" value="'+arraySensorObjects[inx][key.DEVICE_UDN]+'"/><label for="'+inx+'"><span>'+arraySensorObjects[inx][key.DEVICE_FRIENDLY_NAME]+'</span></label></div>';
                    	}
                    });
                    $('#sensors_list').html(list);
                    $('#sensors_list').trigger('create');
                }
                else alert("No sensors detected");

		    }else{
	    		navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {loadUrlTimeoutValue : 60000});
		    }
		}
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
