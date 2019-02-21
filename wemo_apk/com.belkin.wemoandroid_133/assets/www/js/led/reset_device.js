/*
 reset_device.js

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

var TAG = "reset_device.js: ";
var pluginIDToDelete = '';
var ruleIDToDelet = '';
var deletRuleFromBothTables = '';
var needToDisableRules = '';
var failureCallbackGB;
var successCallbackGB;
var isRemoteEnabled = false;
var _ledDeviceCache = [];

$(document).bind('pageinit', function() {
    resetDevice.initialize();
});

$(document).ready(function () {
    var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));
});

var resetDevice = {

    TAG : 'reset_device.js: ',

    initialize : function() {
        wemoUtil.infoLog(resetDevice.TAG, "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    onDeviceReady : function() {
        wemoUtil.infoLog(resetDevice.TAG, "onDeviceReady");
        resetDevice.bindEvents();
        //All initialization script goes here
        
        if(window.sessionStorage.getItem(sessionStore.REMOTE_MODE) == "true")
        {
        	isRemoteEnabled = true;
        	$("#reset_button").hide();
        }
        	

        //Clear Name Icon Rules Popup Open
        $("#clear_name_icon_button").on("click", function(){
            wemoUtil.infoLog(resetDevice.TAG, "clicked");
            $( "#clear_name_icon_rules" ).popup( "open" );
        });

        wemoUtil.infoLog(resetDevice.TAG, window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID));
        
        sharedPreferences.get(sharedPreferencesConstants.WEMO_NAMESPACE, sharedPreferencesConstants.WEMO_LED_DEVICE_CACHE, '', function (value) {
			console.log("Rules Screen cache get value: "+value);
			
			if (value != null && value.length > 0) {
                arrCache = JSON.parse(value);
                _ledDeviceCache = arrCache;
                console.log("Reset Screen cache : " + JSON.stringify(arrCache));
                //device_list_bridge.ledDeviceRendering(arrCache, "initialCache");
            }
			
        });

        //Save Button on Click Clear Name Icon Rules Save - Gray Button
        
        $("#clear_name_icon_rules_save_btn").on("click", function(){
        	$("#clear_name_icon_rules").popup('close');
        	
        	var udn = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
            console.log('udn::'+udn);
            
            var cachedManufName = resetDevice.checkLedDeviceManufacturefromCache(udn);
            var friendly_name ="";
            if(cachedManufName != undefined && cachedManufName != "")
            {
            	 var splitArr = cachedManufName.split("::");
            	 //var replaceSpaceManufacturer = splitArr[0].replace(/ /, '');
            	 var replaceSpaceModelCode = splitArr[1].replace(/ /g, '');
            	 replaceSpaceModelCode = replaceSpaceModelCode.toUpperCase();
            	 friendly_name = wemo.items[replaceSpaceModelCode];
            }	
            else
            	friendly_name = wemo.items['dimmableLight'];
            

            
            nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", "Clearing Device Name"]);
            
            /**************Friendly name Clearing ********************/
            
            if(isRemoteEnabled)
            {
            	var pluginid = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_PLUGIN_ID);
            	var macadress = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
            	var bridgeDetails = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_BRIDGE_UDN);	
    			var wemoBridgeObj = bridgeDetails;
    			var len = wemoBridgeObj.length;   
    			var bridgeMacAddress = "";
    			var bridgePluginID = "";
                
                 for (var i=0; i<len; i++)
                  {
                	 var udn  =  wemoBridgeObj[i].udn;
                	 bridgeMacAddress  =  wemoBridgeObj[i].macAddress;
                	 bridgePluginID = wemoBridgeObj[i].pluginId;	
                	 window.sessionStorage.setItem(sessionStore.LED_BRIDGE_UDN_ID, udn);
                  }
                 console.log("bridgeDetails "+"--- "+JSON.stringify(bridgeDetails)+"--- Bride UDN "+window.sessionStorage.getItem(sessionStore.LED_BRIDGE_UDN_ID));
            	
            	var xmlRequestString = resetDevice.buildXMLRequest(buildXML.CLEAR_NAME_ICONS_RULES, pluginid, macadress, friendly_name,bridgeMacAddress,bridgePluginID);
                console.log("request edit XML "+xmlRequestString+"---"+pluginid+"---"+macadress);
                
                
            		cordova.exec(
                        function (params) {
                            console.log("success call back");
                            var authCode = params[0];
                            console.log("authCode" + authCode);
                            $.ajax({
                                url: cloudAPI.INSIGHT_PARAMS,
                                type: "POST",
                                data: xmlRequestString,
                                beforeSend: function (xhr) {
                                    xhr.setRequestHeader('Content-Type', 'application/xml');
                                    xhr.setRequestHeader('Authorization', authCode);
                                },
                                success: function (data) {
                                    console.log("Sucess save power threshold response cloud...");
                                    nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                    var responseXML = (new XMLSerializer()).serializeToString(data);
                                    wemoUtil.log(resetDevice.TAG, 'Save power threshold status: ' + responseXML);
                                    resetDevice.deleteRecordsForSpecificLedDevice(macadress,"custom");
                                }
                            });
                        },
                        function (err) {
                            console.log("failure call back");
                            alert("Reset Name Icon Rules Failed.");
                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                            resetDevice.loadDeviceListPage();
                        }, "WebServicePlugin", "getAuthCode", []
                    );

            }
            else
            {
	            	var restartParam = "notrestart";
	                
	                setTimeout(function () {
	    	            devicePlugin.execute(
	    	                    function(response){
	    	                        console.log("friedly response***"+JSON.stringify(response));
	    	                        var status = response[0].GetFriendlyNameResponse;
	
	                                nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
	
	    	                        if(status == 1)
	    	                        {
	    	                        	resetDevice.deleteRecordsForSpecificLedDevice(udn,"custom");	                        	
	    	                        }
	    	                        else
	    	                        {	                        	
	                                    alert("Reset Name Icon Rules Failed.");
	    	                        }
	
	    	                        
	    	                    },
	    	                    resetDevice.reportError,
	    	                    actions.SET_LED_FRIENDLY_NAME,
	    	                    [udn,friendly_name,restartParam]
	    	            );
	                }, timeout.LONG);
            }
            
            
            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
            
	        /**************Friendly name Clearing ********************/

        });

        //Cancel Button on click Clear Name Icon Rules Popup Close
        $("#clear_name_icon_rules_cancel_btn").on("click", function(){
            $("#clear_name_icon_rules").popup('close');
        });

        //Reset to Factory Defaults popup Open
        $("#reset_button").on("click", function(){
            $( "#reset_factory_defaults" ).popup( "open" );
        });

        //On click Reset Button Reset to Factory Defaults - Red Button
        $("#reset_factory_defaults_reset_btn").on("click", function(){
            $("#reset_factory_defaults" ).popup( "close" );
            
            setTimeout(function () {
            	nativeUtilPlugin.execute(null,null,actions.SHOW_PROGRESS,[]);
                var RemDev = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID)];
                console.log("Device ID*****"+RemDev);

                devicePlugin.execute(
                		function(responce){
                			
                			 if(responce == null || responce == undefined || responce == "")
                			 {
                				 alert("Reset operation failed");
                				 return false;
                			 }
                			 else
                			 {
                				 var status = responce[0].GetAddLedDeviceStatus;
                				 
                				 if(status === true)
                				 {
                					 //alert("Reset successfully");
                					 resetDevice.deleteRecordsForSpecificLedDevice(RemDev,"default");
                					 var device_led_array = window.sessionStorage.getItem(sessionStore.LED_DEVICE_FIRMWARE_ARRAY);
                					 wemoUtil.infoLog(resetDevice.TAG,"LED firmwareArray: "+device_led_array);
                					 if(device_led_array!=null){
                						 device_led_array = JSON.parse(device_led_array);

                						 for(var i=0;i<device_led_array.length;i++)
                						 {
                							 if(device_led_array[i].udn == RemDev){
                								 wemoUtil.infoLog(resetDevice.TAG,"LED firmwareArray: found UDN:"+RemDev);
                								 device_led_array.splice(i,1);
                								 break;
                							 }else{
                								 wemoUtil.infoLog(resetDevice.TAG,"LED firmwareArray: did not find UDN:"+RemDev);
                							 }
                						 }
                						 wemoUtil.infoLog(resetDevice.TAG,"LED firmwareArray: setting back: "+device_led_array);
                						 window.sessionStorage.setItem(sessionStore.LED_DEVICE_FIRMWARE_ARRAY, JSON.stringify(device_led_array));

                					 }//resetDevice.loadDeviceListPage();
                				 }
                			 }

                			 nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
                		},
                		resetDevice.reportError,
                		ACTION_REMOVE_DEVICE,
                		[RemDev]
                );            	
            }, 400);
            

        });

        //Cancel Button on click Reset to Factory Defaults Popup Close
        $("#reset_factory_defaults_cancel_btn").on("click", function(){
            $("#reset_factory_defaults").popup('close');
        });

    },

    bindEvents : function() {
        wemoUtil.infoLog(resetDevice.TAG, "bindEvents");
        document.addEventListener('online', resetDevice.onOnline, false);
        document.addEventListener('offline', resetDevice.onOffline, false);
        document.addEventListener("backbutton", resetDevice.onBackPress, false);
        document.addEventListener("pause", resetDevice.onPause, false);
        document.addEventListener("resume", resetDevice.onResume, false);
    },

    onOffline : function() {
        wemoUtil.infoLog(resetDevice.TAG, "offLine");
    },

    onOnline : function() {
        wemoUtil.infoLog(resetDevice.TAG, "onLine");
    },

    onBackPress : function() {
    	if ($(".more_tab").is(":visible")) {
    		$(".more_tab").hide();
    		$('body').find('.modalWindow').transition({opacity:0},400, function(){
                $(this).removeClass('isOpen');
            });
    	}
    	else {
	        wemoUtil.infoLog(resetDevice.TAG, "onBackPress");
	        if (typeof (navigator.app) !== 'undefined') {
	            navigator.app.backHistory();
	        } else {
	            window.history.back();
	        }
    	}
    },

    onPause : function() {
        wemoUtil.infoLog(resetDevice.TAG, "onPause");
    },

    onResume : function() {
        wemoUtil.infoLog(resetDevice.TAG, "onResume");
    },

    reportError : function(e) {
    	nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
        wemoUtil.infoLog(resetDevice.TAG, "Plugin Error!!!!   " + e);
    },
    
    clearingIcon : function(udn) {
    	console.log("entering in clearing icon"+udn);
    	
    	 nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", "Clearing Icon"]); 
    	 
    	 var ledDeviceImg = "";
	    	 /***Checking Image is exist in DB or not*******************/
	        
	     	nativeUtilPlugin.execute(function(deviceImg){
	         		console.log('success res'+JSON.stringify(deviceImg));
		         		if(deviceImg != undefined && deviceImg != "")
		         		{
		         			console.log('deviceImg length'+deviceImg.length);
		                    if(deviceImg.length > 0){
		                        console.log('deviceImg length'+deviceImg[0]);
		                        ledDeviceImg=deviceImg[0];
		                    }else{
		                        console.log('Error device Img length');
		                        resetDevice.loadDeviceListPage();
		                    }
		         		}
		         		else
		         		{
		         			console.log("entering in clearing icon else");
		         			resetDevice.loadDeviceListPage();
		         		}
	                
	         		},
	         			resetDevice.reportError,
	        			ACTION_GET_LED_IMAGE_FROM_DB,
	        			[udn]
	     	);
	     	
	     	 /***Checking Image is exist in DB or not*******************/
     	
     	
     	if(ledDeviceImg != "")
     	{
     			console.log("entering in defalut image");
         		//Upload Default Image Icon to Cloud Start
                cordova.exec(function (params) {
                    console.log("success call back");
                    var authCode = params[0];
                    var homeId = params[1];
                    var referanceId = udn; //Device Id               
                    var ledDeviceImg ='';    	
                    
                    var cachedManufName = resetDevice.checkLedDeviceManufacturefromCache(udn);
                    
                    if(cachedManufName != undefined && cachedManufName != "")
                    {
                    	 var splitArr = cachedManufName.split("::");
                    	 var replaceSpaceManufacturer = splitArr[0].replace(/ /, '_');
                    	 replaceSpaceManufacturer = replaceSpaceManufacturer.toLowerCase();
                    	 
                    	 var modelCode = splitArr[1].toLowerCase();

                         var imagenameFormation = "bulb_" + replaceSpaceManufacturer + "_" + modelCode + ".png";
                         var imageurlFormation = ledDefalutImg.Dynamic;
                         iconURL = imageurlFormation + imagenameFormation;
                         
                    	 var imageURI = iconURL;
                    }	
                    else
                    	 var imageURI = defaultIcon.LED_THUMB_URI; // Default Image URL
                    
                    console.log('imageURI'+imageURI);
                    var imageName;
                    imageName = imageURI.substr(imageURI.lastIndexOf('/') + 1);
                    var imageFormat;
                    imageFormat=imageName.split('.');
                    var imageFormatName=imageFormat[1];
                    imageName=imageFormat[0];
                    console.log('image Name::'+imageName);
                    console.log('image Format::'+imageFormatName);
                    var type='';

                    if(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO) == "single"){
                        referanceId=window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
                        type = 'WEMO_DEVICE_ICON';
                    }
                    if(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO) == "group"){
                        referanceId=window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
                        type = 'WEMO_GROUP_ICON';
                    }
                    console.log('type'+type);

                    console.log("authCode" + authCode+ "---"+homeId);
                    //alert("authCode" + authCode+ "---"+homeId);

                    devicePlugin.execute(
                        function(suc){

                            console.log('suc:::'+JSON.stringify(suc));

                            if(suc[0] === 200){
                                console.log('Image Upload Success');
                                var uploadElm = suc[1];
                                console.log('uploadElm'+uploadElm);
                                var uploadId = $(uploadElm).find('uploadId').text();
                                console.log('uploadId::'+uploadId);

	                                nativeUtilPlugin.execute(function(response){
	                                        nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);
	                                        var status = response;
                                            console.log('status'+status);
                                            console.log('Image Icon  clear'+status);
                                            if(status == -1){
                                            	alert("Clearing Icon failed");
                                            }
                                            
                                            resetDevice.loadDeviceListPage();
	                                    },
	                                    resetDevice.reportError,
	                                    ACTION_INSERT_LED_IMAGE_TO_DB,
	                                    [referanceId,imageURI,uploadId]
	                                );
                            }else{
                                nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);
                                alert('Clearing Icon failed');
                                resetDevice.loadDeviceListPage();
                            }

                        },
                        resetDevice.reportError,
                        ACTION_ICON_UPLOAD_TO_CLOUD,
                        //[homeId,imageURI,referanceId,type]);
                    	[homeId,imageURI,referanceId,type,imageName,imageFormatName]);

                },function (err) {
                	alert('Please enable the remote to reset Icon');
                	nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);
                  },"WebServicePlugin", "getAuthCode", []);

                //Upload Default Image Icon to Cloud End
     	}
     	else
     	{
     		 nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);
     	}
     	
    },
    
    deleteRecordsForSpecificLedDevice : function(udn,type) {
    		nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", "Clearing rules"]);    		
    		
    	 	db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
    	 	db.transaction(fetchGroupInfo, errorCB, successCB);

	         function fetchGroupInfo(tx) {
	         	tx.executeSql('SELECT RuleID from RULEDEVICES where DeviceID Like "%'+udn+'"', [], queryGroupSuccess, errorCB);
	         }
         
	         function errorCB(err) {
	             console.log("Error creating rules DB table structure " + err.code);             
	             nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);
	         }
         
	         function successCB() {
	             console.log("Success creating rules DB table structure ");
	         } 
         
           function queryGroupSuccess(tx, results) {
             console.log("Fetching Data rule devices in edit group =>" + results.rows.length);
				
				var len = results.rows.length;
				var ruleDeviceRows = [];
				
				 console.log("length of group***"+len);
				 
                 if (len > 0) {
                         for (var i = 0; i < len; i++) {
                         	ruleDeviceRows[i] = results.rows.item(i);                            	
                         }
                         
                         
                         db.transaction(function(tx){
                      	   deleteRulesDevices(tx, ruleDeviceRows)
                         },errorCB);          
                      
                 }
                 else
                 {
                     nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);

                     setTimeout(function() {
                         resetDevice.clearingIcon(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID));
                     }, 1500);


                     setTimeout(function() {
                         resetDevice.loadDeviceListPage();
                     }, 1500);

                 }               
                
		   }
           
           function deleteRulesDevices(tx, ruleDeviceRows)
           {
        	   console.log("entering in delte Rules");        	   
	        	   
	        	    for(var i=0;i<ruleDeviceRows.length;i++)
	   				{
	        	    	console.log('DELETE from RULEDEVICES where DeviceID Like "%'+udn+'" and RuleID='+ruleDeviceRows[i].RuleID+'"');
	        	    	//tx.executeSql("DELETE FROM RULES WHERE RuleID='"+ruleDeviceRows[i].RuleID+"'", [], function(){}, errorCB); 
	        	    	tx.executeSql('DELETE FROM RULEDEVICES WHERE DeviceID Like "%'+udn+'";', [], executeSqlDeleteQuerySuccess, errorCB);
	   				}	    
          
	        	    db.transaction(function(tx){
                   	   deleteRules(tx)
                      },errorCB);   

           }
           
           function executeSqlDeleteQuerySuccess(tx, results) {
             console.log("entering in success");
           }
           
           function deleteRules(tx)
           {
        	   console.log("entering in success delete rules");
        	   tx.executeSql('DELETE FROM RULES WHERE RuleID NOT IN (SELECT RuleID FROM RULEDEVICES GROUP BY RuleID);', [], executeSqlDeleteQuerySuccess, errorCB);
        	   
        	   /******** Delete weekly calender************/
        	   		if(type == "custom")
        	   		{	
        	   			console.log("entering in custom");
        	   			
        	   			if(isRemoteEnabled)
        	   			{
	        	   				var pluginid = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_PLUGIN_ID);
	        	            	var macadress = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
	        	            	var bridgeDetails = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_BRIDGE_UDN);	
	        	    			var wemoBridgeObj = bridgeDetails;
	        	    			var len = wemoBridgeObj.length;   
	        	    			var bridgeMacAddress = "";
	        	    			var bridgePluginID = "";
	        	                
	        	                 for (var i=0; i<len; i++)
	        	                  {
	        	                	 var udn  =  wemoBridgeObj[i].udn;
	        	                	 bridgeMacAddress  =  wemoBridgeObj[i].macAddress;
	        	                	 bridgePluginID = wemoBridgeObj[i].pluginId;	
	        	                	 window.sessionStorage.setItem(sessionStore.LED_BRIDGE_UDN_ID, udn);
	        	                  }
	        	                 console.log("bridgeDetails "+"--- "+JSON.stringify(bridgeDetails)+"--- Bride UDN "+window.sessionStorage.getItem(sessionStore.LED_BRIDGE_UDN_ID));
	        	            	
	        	            	var xmlRequestString = resetDevice.buildXMLRequest(buildXML.UPDATE_WEEKLY_CALENDER, pluginid, macadress, "",bridgeMacAddress,bridgePluginID);
	        	                console.log("request reset XML "+xmlRequestString+"---"+pluginid+"---"+macadress);
	        	                
	        	                
        	            		cordova.exec(
        	                        function (params) {
        	                            console.log("success call back");
        	                            var authCode = params[0];
        	                            console.log("authCode" + authCode);
        	                            $.ajax({
        	                                url: cloudAPI.DEVICE_MESSAGE,
        	                                type: "POST",
        	                                data: xmlRequestString,
        	                                beforeSend: function (xhr) {
        	                                    xhr.setRequestHeader('Content-Type', 'application/xml');
        	                                    xhr.setRequestHeader('Authorization', authCode);
        	                                },
        	                                success: function (data) {
        	                                    console.log("Sucess save power threshold response cloud...");
        	                                    nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        	                                    var responseXML = (new XMLSerializer()).serializeToString(data);
        	                                    wemoUtil.log(resetDevice.TAG, 'Save power threshold status: ' + responseXML);
        	                                    resetDevice.uploadDBOnCloud();
        	                                    
	        	                                  setTimeout(function () {
	        	                                    	console.log("entering in clearing timeout");
	       	 	                              		 	resetDevice.clearingIcon(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID));
	       	 	                              	  },1500);
       	
	       	                                      setTimeout(function () {
	       	 	                              	    resetDevice.loadDeviceListPage();
	       	                                      },1500);
        	                                }
        	                            });
        	                        },
        	                        function (err) {
        	                            console.log("failure call back");
        	                            alert("Reset Name Icon Rules Failed.");
        	                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        	                            resetDevice.loadDeviceListPage();
        	                        }, "WebServicePlugin", "getAuthCode", []
        	                    );
        	   			}
        	   			else
        	   			{
	        	   				setTimeout(function () {
	 			                   devicePlugin.execute(
	 	                               function(){
	 	                              	 console.log("weekly calender deleted success---");   
	 	                              	 resetDevice.pushDB();
	
	                                      nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
	 	                              	 
	 	                              	 setTimeout(function () {
	 	                              		 console.log("entering in clearing timeout");
	 	                              		 resetDevice.clearingIcon(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID));
	 	                              	 },1000);
	
	                                      setTimeout(function () {
	 	                              	    resetDevice.loadDeviceListPage();
	                                      },1000);
	 	                               },
	 	                               resetDevice.reportError,
	 	                               actions.DELETE_WEEKLY_CALENDAR,
	 	                               [udn]
	 			                   );
	        	   				},1000);
        	   			}
	        	   		 
        	   		}
        	   		else if(type == "default")
        	   		{
        	   			console.log("entering in default");
	        	   		 setTimeout(function () {
			                   devicePlugin.execute(
	                             function(){
	                            	 console.log("weekly calender deleted success---");   
	                            	 resetDevice.pushDB();

                                     nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);

                                     setTimeout(function () {
                                         console.log("entering in clearing timeout");
                                         resetDevice.clearingIcon(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID));
                                     },1000);

                                     setTimeout(function () {
                                         resetDevice.loadDeviceListPage();
                                     },1000);

	                             },
	                             resetDevice.reportError,
	                             actions.DELETE_WEEKLY_CALENDAR,
	                             [udn]
			                   );
			       	    },1000);
        	   		}
		       	   
               	
               /******** Delete weekly calender end************/    
		       	 nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);
           }
         
           /*****Database check before group delete end*******/        
        
    },
   
    pushDB: function(){
        wemoUtil.infoLog(resetDevice.TAG, 'pushDB');
        devicePlugin.execute(function (e) {
            
        	},
            resetDevice.reportError,
            actions.PUSH_DB_TO_PLUGIN,
            []
        );
    },

    stopControlPoint : function(successCallback){
        wemoUtil.infoLog(resetDevice.TAG, 'stopControlPoint');
        devicePlugin.execute(
            successCallback,
            resetDevice.reportError,
            actions.STOP_CONTROL_POINT,
            []
        );
    },

    loadDeviceListPage : function() {
        wemoUtil.infoLog(resetDevice.TAG, 'loadDeviceListPage');
        window.sessionStorage.setItem("initFromResetDevice", "");
        window.sessionStorage.setItem(sessionStore.CLEAR_LED_CACHE, "1");
        nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
        wemoUtil.loadUrl(filePath.DEVICE_LIST);
    },
    
    buildXMLRequest: function (type, pluginId, macAddress, data, bridgemac, bridgeplugin) {
    	
        switch (type) {
            case(buildXML.CLEAR_NAME_ICONS_RULES):
            	xmlString = "<plugins><plugin>" +
                "  <recipientId>" + bridgeplugin + "</recipientId>" +
                "  <macAddress>" + bridgemac + "</macAddress>" +
                "  <modelCode>Bridge</modelCode>" +
                " <content><![CDATA[<resetNameRulesData>" +
                " <plugin>" +
                " <macAddress>" + macAddress + "</macAddress>" +
                " <resetType>1</resetType>" +
                " </plugin></resetNameRulesData>]]>" +
                " </content>";
                break;    
            case(buildXML.UPDATE_WEEKLY_CALENDER):
            	xmlString = "<plugins><plugin>" +
                "  <recipientId>" + bridgeplugin + "</recipientId>" +
                "  <macAddress>" + bridgemac + "</macAddress>" +
                "  <content><![CDATA[<CalendarList>" +
                "<Calendar>" +
                "<DeviceID>" + macAddress + "</DeviceID>" +
                "<Mon></Mon>" +
                "<Tues></Tues>" +
                "<Wed></Wed>" +
                "<Thurs></Thurs>" +
                "<Fri></Fri>" +
                "<Sat></Sat>" +
                "<Sun></Sun>" +
                "</Calendar>" +
                "</CalendarList>]]>" +
                "</content>";
                break;  
        }

        xmlString += "</plugin></plugins>";

        return xmlString;
    },
    
    uploadDBOnCloud: function () {
        console.log("uploadDBOnCloud goBack :: ");

        cordova.exec(function (params) {
            var authCode = params[0];
            var homeId = params[1];
            console.log("authCode" + authCode);
            console.log("homeId" + homeId);
        
            setTimeout(function () {
                deviceTabPlugin.execute(
                    function (responseAry) {

                    },
                    function () {
                        console.log("failure DB call back...");
                        nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
                    },
                    actions.STORE_DB_FROM_CLOUD, [homeId]
                );
            }, 100);

        }, function (err) {
        	nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
            console.log("failure call back");
        }, "WebServicePlugin", "getAuthCode", []);

    },
    
    checkLedDeviceManufacturefromCache: function(deviceid){
    	for (var j = 0; j < _ledDeviceCache.length; j++) {
            if (_ledDeviceCache[j].GroupID == undefined || _ledDeviceCache[j].GroupID == null) {
                if (_ledDeviceCache[j].DeviceID == deviceid) {
                	
                	if(_ledDeviceCache[j].ManufacturerName != undefined && _ledDeviceCache[j].ModelCode != undefined)
                		return _ledDeviceCache[j].ManufacturerName+"::"+_ledDeviceCache[j].ModelCode;
                	else 
                		return false;
                }
            } else {
                if (_ledDeviceCache[j].GroupID == deviceid) {
                	
                	if(_ledDeviceCache[j].ManufacturerName != undefined && _ledDeviceCache[j].ModelCode != undefined)
                		return _ledDeviceCache[j].ManufacturerName+"::"+_ledDeviceCache[j].ModelCode;
                	else
                		return false;
                }
            }
        }
    }
    
};
