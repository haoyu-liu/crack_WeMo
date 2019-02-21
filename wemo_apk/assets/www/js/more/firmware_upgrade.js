/*
 firmware_upgrade.js

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
var TAG = "firmware_upgrade.js: ";

var isRemoteEnabled = false;
var ledmodelcodes = [];

$(document).bind('pageinit', function() {
    $('.ui-header').css({'border-bottom': '1px solid #888 !important'});
    $('.sub_header').css({'z-index':3,'border-top': '1px solid #73D44C !important'});
	
	var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
	$('.wemo_logo').css('width', Math.round(0.35 * w));
    var scroll_div = $("#scroll_div");
    scroll_div.css({'overflow': 'scroll'});
    firmwareUpgrade.initialize();
});

var FWUpgradeTimeInterval = 0;
var updatedDevicesCount = 0;
var listedDevicesCount = 0;
var updatedLedArray = [];
var newFirmwareURL = "";
var firmwareFailCount = 0;
var bulbfirmwareURL = "";
var bulbDeviceType = "";
var bulbfirmwareVersion = "";

var firmwareUpgrade = {

    TAG : "firmware_upgrade.js",

    initialize : function() {
        console.log(TAG + "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    onDeviceReady: function () {
        	firmwareUpgrade.mainMethod();
    },

    mainMethod : function() {
        console.log(TAG + "mainMethod");
        firmwareUpgrade.bindEvents();
        $("#more_new_firmware").addClass('none');
        $("#find_and_pair_Newdevice").hide();
        window.sessionStorage.setItem(sessionStore.IS_BRIDGE_PRESENT, false);
        
        $.each(ledModelcode, function(i, val) {
        	ledmodelcodes.push(val.toLowerCase());
        });
        
        var arrayUDN = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
        console.log("window.sessionStorage.getItem(sessionStore.IS_UPGRADE_INPROGRESS) :: " + window.sessionStorage.getItem(sessionStore.IS_UPGRADE_INPROGRESS));
        if(window.sessionStorage.getItem(sessionStore.IS_UPGRADE_INPROGRESS) != "true"){
        	$("#before_upgrade_container").removeClass("none");
        	if(!$("#upgrade_progress_container").hasClass("none")) {
        		$("#upgrade_progress_container").addClass("none");
        	}
        	$('footer').show();
        	$('#border_firmware').show();
        }
        else{
        	if(!$("#before_upgrade_container").hasClass("none")){
        		$("#before_upgrade_container").addClass("none");
        	}
        	$("#upgrade_progress_container").removeClass("none");
        	$('footer').hide();
        	$('#enable_upgrade').empty();
        	$('#border_firmware').hide();
        	
        	var firmwareData = window.sessionStorage.getItem(sessionStore.FIRMWARE_UPDATE_DATA);
            firmwareUpgrade.checkFirmwareUpdated(window.sessionStorage.getItem(sessionStore.DEVICE_COUNT), JSON.parse(firmwareData));
        }
        //All initialization script goes here
        //get localization content
        if(window.sessionStorage.getItem(sessionStore.REMOTE_MODE) == "true")
            isRemoteEnabled = true;
			
		//To return back to home page: device list tab
		$(".wemo_logo").on("tap", function(e) {
				wemoUtil.loadUrl(filePath.DEVICE_LIST);
		});

        $("#refresh_icon").on("tap", function(){
            $(this).removeClass("refresh_icon").addClass('refresh_icon_loader');
        });
        $(".upgrade_message_loader").cssLoader();
        // enable upgrade
        $("#enable_upgrade").on("tap", function(){
            wemoUtil.infoLog(firmwareUpgrade.TAG, "upgrade now");
            $("#before_upgrade_container").addClass("none");
            $("#upgrade_progress_container").removeClass("none");
            $('footer').hide();
            $('#enable_upgrade').empty();
            $('#border_firmware').hide();
            window.sessionStorage.setItem(sessionStore.IS_UPGRADE_INPROGRESS, "true");
            window.sessionStorage.setItem(sessionStore.CHECK_FIRMWARE_UPGRADE_REQUIRED, "true");
            var updateList = JSON.parse($(this).attr('wemo-update-list'));
            
            console.log("updateList1"+updateList+"---"+JSON.stringify(updateList));
            var arrayUDN = [];
            for (var udn in updateList) {
            	if(typeof(updateList[udn].udn) !== 'undefined')
                  	arrayUDN.push(updateList[udn].udn);
            }
            
            console.log("updateList2"+arrayUDN+"---"+JSON.stringify(arrayUDN));
            window.sessionStorage.setItem(sessionStore.DEVICE_LIST_UPDATE,arrayUDN);
            
          if(isRemoteEnabled){
                wemoUtil.infoLog(firmwareUpgrade.TAG, 'FW <>  Remote FW upgrade');
                var firmwareUpgradeProcessList = {};
                var bulbDeviceArray=[];
                var i = 0;
                var isBridgeUpdate=false;
                for(var index in updateList){
                    var updateItem = updateList[index];
                    console.log("updateList3"+updateItem+"---"+JSON.stringify(updateItem));
                    var startTime = firmwareUpgradeProcess.Interval * Math.floor(i/2);
                    wemoUtil.infoLog(firmwareUpgrade.TAG, 'FW <>  remote Upgrade item: ' + JSON.stringify(updateItem));
                    var firmwareUpgradeObject = {};
                    firmwareUpgradeObject[key.DEVICE_FIRMWARE_COUNTDOWN] = startTime;
                    firmwareUpgradeObject[key.DEVICE_FIRMWARE_COUNTDOWN_START_TIME] = new Date().getTime();
                    firmwareUpgradeObject[key.DEVICE_FIRMWARE_UPGRADE_STARTED] = false;
                    firmwareUpgradeObject[key.DEVICE_MAC_ADDRESS] = updateItem[key.DEVICE_MAC_ADDRESS];
                    firmwareUpgradeObject[key.DEVICE_PLUGIN_ID] = updateItem[key.DEVICE_PLUGIN_ID];
                    firmwareUpgradeObject[key.DEVICE_FRIENDLY_NAME] = updateItem[key.DEVICE_FRIENDLY_NAME];
                    firmwareUpgradeObject[key.DEVICE_NEW_FIRMWARE_VERSION] = updateItem[key.DEVICE_NEW_FIRMWARE_VERSION];
                    firmwareUpgradeObject[key.DEVICE_NEW_FIRMWARE_URL] = updateItem[key.DEVICE_NEW_FIRMWARE_URL];
                    firmwareUpgradeObject[key.DEVICE_NEW_FIRMWARE_SIGNATURE] = updateItem[key.DEVICE_NEW_FIRMWARE_SIGNATURE];
                    firmwareUpgradeObject[key.DEVICE_UDN] = updateItem[key.DEVICE_UDN];
                    firmwareUpgradeObject[key.DEVICE_TYPE] = updateItem[key.DEVICE_TYPE];
                    firmwareUpgradeProcessList[updateItem[key.DEVICE_UDN]] = firmwareUpgradeObject;
                    
                    if(updateItem[key.DEVICE_TYPE]==wemoDeviceType.BRIDGE){
                    	isBridgeUpdate=true;
                    }
                    
                    if ($.inArray((updateItem[key.DEVICE_TYPE]).toLowerCase(), ledmodelcodes) != -1)
	        		{
            			bulbDeviceArray.push(updateItem);
            			wemoUtil.infoLog(firmwareUpgrade.TAG,"LED added ::"+updateItem[key.DEVICE_UDN]+"--"+updateItem[key.DEVICE_TYPE]+"---"+updateItem[key.DEVICE_NEW_FIRMWARE_VERSION]);
            		}
                    
                    i++;
                }
                if(bulbDeviceArray.length > 0){
                	if(isBridgeUpdate==true){
                		wemoUtil.infoLog(firmwareUpgrade.TAG,"Bulb+Link update");
                		//bulb+link to be updated ..start wifi update first .. link+wifi devices
                		 window.sessionStorage.setItem(sessionStore.FIRMWARE_BULB_UPDATE_DATA,JSON.stringify(bulbDeviceArray));
                		 if(updateList!=null){
                			firmwareUpgrade.cloudUpgradeDeviceFirmware(firmwareUpgradeProcessList);
 		                }
                	}else if(isBridgeUpdate==false){
                		wemoUtil.infoLog(firmwareUpgrade.TAG,"Bulb+wifi update no link");
                		//start bulb update..
                		devicePlugin.execute(
            		            function(status){
            		                wemoUtil.infoLog(firmwareUpgrade.TAG, 'LED devices added to the fw update queue: ' + bulbDeviceArray);
            		            },
            		            firmwareUpgrade.reportError,
            		            actions.ACTION_UPDATE_FW_QUEUE,
            		            [bulbDeviceArray,wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_BRIDGE_UDN)]
            		        );
                		//start wifi update... no link
                		if(updateList!=null){
    	                  firmwareUpgrade.cloudUpgradeDeviceFirmware(firmwareUpgradeProcessList);
    	                }
                	}
                }else{
                	//only wifi update
                	wemoUtil.infoLog(firmwareUpgrade.TAG,"only wifi update");
                	if(updateList!=null){
	                  firmwareUpgrade.cloudUpgradeDeviceFirmware(firmwareUpgradeProcessList);
	                }
                }
                wemoUtil.infoLog(firmwareUpgrade.TAG,"updateList3"+firmwareUpgradeProcessList+"---"+JSON.stringify(firmwareUpgradeProcessList));
                
                wemoUtil.infoLog(firmwareUpgrade.TAG, 'FW <>  firmwareUpgradeProcessList: ' + JSON.stringify(firmwareUpgradeProcessList));
                window.sessionStorage.setItem(sessionStore.FIRMWARE_UPDATE_DATA, JSON.stringify(firmwareUpgradeProcessList));
                window.sessionStorage.setItem(sessionStore.DEVICE_COUNT, i);
                window.sessionStorage.setItem(key.DEVICE_NEW_FIRMWARE_VERSION, firmwareUpgradeObject[key.DEVICE_NEW_FIRMWARE_VERSION]);
                
            	}else{
                wemoUtil.infoLog(firmwareUpgrade.TAG, 'Local FW upgrade');
                var i = 0;
                var firmwareUpgradeProcessList = {};
                
                if(updateList!=null){
                	
                	var len = arrayUDN.length;
                	var bulbDeviceArray=[];
                	
                	for (var item in updateList) {
                		
                		var deviceDetails = updateList[item];
                		
                		console.log("deviceDetails ::"+JSON.stringify(deviceDetails));
		        		len--;	
                	
                		if ($.inArray((deviceDetails[key.DEVICE_TYPE]).toLowerCase(), ledmodelcodes) != -1)
		        		{
                			updatedLedArray.push(deviceDetails[key.DEVICE_UDN]);
                			bulbfirmwareURL = deviceDetails[key.DEVICE_NEW_FIRMWARE_URL];
                			bulbDeviceType = deviceDetails[key.DEVICE_TYPE];
                			bulbfirmwareVersion =  deviceDetails[key.DEVICE_NEW_FIRMWARE_VERSION];
                			bulbDeviceArray.push(deviceDetails);
                			console.log("Update LED ::"+bulbfirmwareURL+"--"+bulbDeviceType+"---"+bulbfirmwareVersion);
                		}
                		
                		if(len == 0 && updatedLedArray.length > 0)
                		{
                			var firmwareUpgradeObject = {};
                    		firmwareUpgradeObject[key.DEVICE_FIRMWARE_COUNTDOWN] = startTime;
                    		firmwareUpgradeObject[key.DEVICE_FIRMWARE_COUNTDOWN_START_TIME] = new Date().getTime();
                    		firmwareUpgradeObject[key.DEVICE_FIRMWARE_UPGRADE_STARTED] = false;
                    		firmwareUpgradeObject[key.DEVICE_FIRMWARE_UPGRADE_DOWNLOADING] = downloading;
                    		firmwareUpgradeObject[key.DEVICE_NEW_FIRMWARE_VERSION] = bulbfirmwareVersion;
                    		firmwareUpgradeObject[key.DEVICE_TYPE] = bulbDeviceType;
                    		firmwareUpgradeProcessList[deviceDetails[key.DEVICE_UDN]] = firmwareUpgradeObject;
                    		//firmwareUpgrade.updateLedBulbFirmware(updatedLedArray,bulbfirmwareURL);
                		}
                	}
                	if(bulbDeviceArray.length>0){
                		firmwareUpgrade.updateLedBulbFirmware(bulbDeviceArray);
                	}
                	
                	for (var item in updateList) {
                		var deviceDetails = updateList[item];
                		var downloading = false;
                		if(i < 2){
                			downloading = true;
                		}
                		
                		console.log("updateList3"+deviceDetails+"---"+JSON.stringify(deviceDetails));
                		var startTime = firmwareUpgradeProcess.Interval * Math.floor(i/2);
                		wemoUtil.infoLog(firmwareUpgrade.TAG, 'Upgrade item: ' + JSON.stringify(deviceDetails));
                		var firmwareUpgradeObject = {};
                		firmwareUpgradeObject[key.DEVICE_FIRMWARE_COUNTDOWN] = startTime;
                		firmwareUpgradeObject[key.DEVICE_FIRMWARE_COUNTDOWN_START_TIME] = new Date().getTime();
                		firmwareUpgradeObject[key.DEVICE_FIRMWARE_UPGRADE_STARTED] = false;
                		firmwareUpgradeObject[key.DEVICE_FIRMWARE_UPGRADE_DOWNLOADING] = downloading;
                		firmwareUpgradeObject[key.DEVICE_NEW_FIRMWARE_VERSION] = deviceDetails[key.DEVICE_NEW_FIRMWARE_VERSION];
                		firmwareUpgradeObject[key.DEVICE_TYPE] = deviceDetails[key.DEVICE_TYPE];
                		firmwareUpgradeProcessList[deviceDetails[key.DEVICE_UDN]] = firmwareUpgradeObject;

                		if ($.inArray((deviceDetails[key.DEVICE_TYPE]).toLowerCase(), ledmodelcodes) == -1)
            			{
                			console.log("entering in update firmware other devices");
                			firmwareUpgrade.updateDeviceFirmware(
                    				deviceDetails[key.DEVICE_UDN],
                    				deviceDetails[key.DEVICE_NEW_FIRMWARE_VERSION],
                    				deviceDetails[key.DEVICE_NEW_FIRMWARE_URL],
                    				deviceDetails[key.DEVICE_NEW_FIRMWARE_SIGNATURE],
                    				startTime
                    		);

                		}

                		i++;
//              		return;
                	}
                }
                
                wemoUtil.infoLog(firmwareUpgrade.TAG, 'firmwareUpgradeProcessList: ' + JSON.stringify(firmwareUpgradeProcessList));
                window.sessionStorage.setItem(sessionStore.FIRMWARE_UPDATE_DATA, JSON.stringify(firmwareUpgradeProcessList));
                window.sessionStorage.setItem(sessionStore.DEVICE_COUNT, i);
                window.sessionStorage.setItem(key.DEVICE_NEW_FIRMWARE_VERSION, deviceDetails[key.DEVICE_NEW_FIRMWARE_VERSION]);
            }
        	
        	///////////////////////////////////////////////////
        	//$("#hooray_firmware").popup('open');           //
            //firmwareUpgrade.checkFirmwareUpdated();        //
            //var i = 10;//For testing only don't un-comment it. 
            ///////////////////////////////////////////////////
            
            /*var eachFWUpdatTime = (5 * 60)*1000;
			var timeout = (i%2 == 1)?(i+1)/2:(i/2);*/
			console.log("FW <> timeout.FIRMWARE_UPDATE_CHECK ::  "+timeout.FIRMWARE_UPDATE_CHECK_LOOP);
			setTimeout(function() { 
				console.log("FW <> :  firmwareUpgrade.checkFirmwareUpdated()");
				//$("#hooray_firmware").popup('open');
				firmwareUpgrade.checkFirmwareUpdated(i, firmwareUpgradeProcessList);
				
			}, timeout.FIRMWARE_UPDATE_CHECK_LOOP);

        });   

        //hooray_firmware
        $("#hooray_firmware_ok_btn").on('click', function(){
			$("#hooray_firmware").popup('close');
			window.sessionStorage.removeItem(sessionStore.FIRMWARE_UPDATE_DATA);
			clearInterval(FWUpgradeTimeInterval);
			console.log("redirect path****"+filePath.DEVICE_LIST);
			
			setTimeout(function() { 
				wemoUtil.loadUrl(filePath.DEVICE_LIST);
			}, 2000);
			
		});
		//hooray_firmware
        if(window.sessionStorage.getItem(sessionStore.IS_UPGRADE_INPROGRESS) != "true")
        nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);

        //hooray_firmware
        $("#hooray_firmware_ok_btn").on('click', function(){
			$("#hooray_firmware").popup('close');
			window.sessionStorage.removeItem(sessionStore.FIRMWARE_UPDATE_DATA);
			wemoUtil.loadUrl(filePath.DEVICE_LIST);
		});
		//hooray_firmware
        
        setTimeout(
            function(){
            	if(window.sessionStorage.getItem(sessionStore.IS_UPGRADE_INPROGRESS) != "true")
                firmwareUpgrade.getFirmwareFilePath();
            },
            timeout.LONG
        );
    },

    navigateToLastPage : function() {
        var previousUrl = wemoUtil.getPreviousUrl();
        if (previousUrl.match(filePath.DEVICE_LIST)) {
            wemoUtil.loadUrl(filePath.MORE_MENU);
        } else {
            wemoUtil.loadPreviousUrl();
        }
    },

    bindEvents : function() {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', firmwareUpgrade.onOnline, false);
        document.addEventListener('offline', firmwareUpgrade.onOffline, false);
        document.addEventListener("backbutton", firmwareUpgrade.onBackPress, false);
        document.addEventListener("pause", firmwareUpgrade.onPause, false);
        document.addEventListener("resume", firmwareUpgrade.onResume, false);
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
    		var fromSaveRulepage = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.FROM_SAVE_RULE_PAGE);
    		
    		if(fromSaveRulepage != null && fromSaveRulepage == "fromSaveRulepage")
    		{
    			 window.sessionStorage.removeItem(sessionStore.FROM_SAVE_RULE_PAGE);
    			 wemoUtil.loadUrl(filePath.ENABLED_RULES);
    		}
    		else
    		{
    			console.log(TAG + "onBackPress");

                firmwareUpgrade.navigateToLastPage();
    		}
    		
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

    getFirmwareFilePath : function(){
        nativeUtilPlugin.execute(
            function(params){
                wemoUtil.infoLog(firmwareUpgrade.TAG, "success call back" + params[1] + " : " + params[0]);
                var homeId = params[1];
                var authCode = params[0];

                wemoUtil.infoLog(firmwareUpgrade.TAG, "success call back home id: " + homeId);
                wemoUtil.infoLog(firmwareUpgrade.TAG, "success call back authCode: " + authCode);
                $.ajax({
                	url: cloudAPI.FIRMWARE_URL + homeId + "?options=1",

                    type: "POST",
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function (data) {
                        wemoUtil.infoLog(firmwareUpgrade.TAG, "success callback from cloud: " + JSON.stringify(data));
                        var url = data['fwUpgradeInfo']['fwUpgradeURL'];
                        wemoUtil.infoLog(firmwareUpgrade.TAG,"URL: " + url);
                        firmwareUpgrade.getDeviceUpdateList(url);

                    },
                    error: function (xhr, textstatus) {
                    	wemoUtil.infoLog(firmwareUpgrade.TAG, "AJAX Error call back");
                    	wemoUtil.infoLog(firmwareUpgrade.TAG, 'cloudUpgradeDeviceFirmwareCall status: ' + xhr.status);
                        wemoUtil.infoLog(firmwareUpgrade.TAG, 'cloudUpgradeDeviceFirmwareCall status text: ' + xhr.statusText);
                    	if(firmwareCloud == firmwareCloudEnvironment.PRODUCTION)
                    		firmwareUpgrade.getDeviceUpdateList(firmwareTextFile.PATH_PROD);
                    	else if(firmwareCloud == firmwareCloudEnvironment.STAGING)
                    		firmwareUpgrade.getDeviceUpdateList(firmwareTextFile.PATH_STAG);
						else if(firmwareCloud == firmwareCloudEnvironment.QA)
                    		firmwareUpgrade.getDeviceUpdateList(firmwareTextFile.PATH_QA);
						else if(firmwareCloud == firmwareCloudEnvironment.JARDEN)
							firmwareUpgrade.getDeviceUpdateList(firmwareTextFile.PATH_MINICLOUD);
						else if(firmwareCloud == firmwareCloudEnvironment.DEV)
							firmwareUpgrade.getDeviceUpdateList(firmwareTextFile.PATH_DEV);
                    },
                    statusCode: {
                    	500: function (){
                    		wemoUtil.infoLog(firmwareUpgrade.TAG, 'page not found');
                    	},
                    	503: function(){
                    		wemoUtil.infoLog(firmwareUpgrade.TAG, 'Cloud is down.');
                    	},
                    	403: function(){
                    		wemoUtil.infoLog(firmwareUpgrade.TAG, 'Please change the networkand try again');
                    	}
                    }

                });
            },
            function(){
            	wemoUtil.infoLog(firmwareUpgrade.TAG, 'Failure callback');
            	if(firmwareCloud == firmwareCloudEnvironment.PRODUCTION)
            		firmwareUpgrade.getDeviceUpdateList(firmwareTextFile.PATH_PROD);
            	else if(firmwareCloud == firmwareCloudEnvironment.STAGING)
            		firmwareUpgrade.getDeviceUpdateList(firmwareTextFile.PATH_STAG);
				else if(firmwareCloud == firmwareCloudEnvironment.QA)
                    		firmwareUpgrade.getDeviceUpdateList(firmwareTextFile.PATH_QA);
				else if(firmwareCloud == firmwareCloudEnvironment.JARDEN)
            		firmwareUpgrade.getDeviceUpdateList(firmwareTextFile.PATH_MINICLOUD);
            },
            actions.GENERATE_AUTH_CODE,
            []
        );
    },

    readTextFile : function(path,updateList){
        nativeUtilPlugin.execute(
            function(text){           
                wemoUtil.infoLog(firmwareUpgrade.TAG, 'read text file success callback:: ' + JSON.stringify(text) + ' :: updateList is :: ' + JSON.stringify(updateList));
                $('#firmwate_detail').append(text);
                },
            firmwareUpgrade.reportError,
            actions.READ_TEXT_FILE,
            [path]
        );

    },
    
    getDeviceUpdateList : function(path){
        wemoUtil.infoLog(firmwareUpgrade.TAG, 'getDeviceUpdateList');
        var array = JSON.parse(window.sessionStorage.getItem(sessionStore.FIRMWARE_DATA));
        wemoUtil.infoLog(firmwareUpgrade.TAG, 'old list Data: ' + JSON.stringify(array)+"---"+path);
        devicePlugin.execute(
            function(updateList){
            	wemoUtil.infoLog(firmwareUpgrade.TAG, 'new list Data Switch: ' + JSON.stringify(updateList));
                nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                if(!jQuery.isEmptyObject(updateList)){
                	console.log("entering in switch "+JSON.stringify(updateList));
                    firmwareUpgrade.readTextFile(path,updateList);                    
                }
                $('#enable_upgrade').attr('wemo-update-list', JSON.stringify(updateList));
            },
            firmwareUpgrade.reportError,
            actions.GET_FIRMWARE_UPDATE_LIST,
            [path,array]
        );
   
    },

    
    updateDeviceFirmware : function(udn, new_firmware_version, new_firmware_url, new_firmware_sign, start_time){
		console.log("---"+new_firmware_version+"---"+new_firmware_url+"----"+new_firmware_sign)
        wemoUtil.infoLog(firmwareUpgrade.TAG, 'updateDeviceFirmware');
        devicePlugin.execute(
            function(status){
                wemoUtil.infoLog(firmwareUpgrade.TAG, 'updateDeviceFirmware started for: ' + udn);
            },
            firmwareUpgrade.reportError,
            actions.UPDATE_FIRMWARE,
            [udn,new_firmware_version,new_firmware_url,new_firmware_sign,start_time]
        );
    },

    updateLedBulbFirmware : function(ledDeviceArray){
		console.log("----------"+ledDeviceArray)
        wemoUtil.infoLog(firmwareUpgrade.TAG, 'updateLedBulbFirmware');
        devicePlugin.execute(
            function(status){
                wemoUtil.infoLog(firmwareUpgrade.TAG, 'updateDeviceFirmware started for: ' + ledDeviceArray);
            },
            firmwareUpgrade.reportError,
            actions.UPDATE_LED_FIRMWARE,
            [ledDeviceArray]
        );
    },

    cloudUpgradeDeviceFirmware : function(deviceList){
        
       var requestXML = firmwareUpgrade.buildXMLForFirmwareUpgrade(deviceList);
       wemoUtil.infoLog(firmwareUpgrade.TAG,'request XML: ' + requestXML);
       if(requestXML!=''){
    	   firmwareUpgrade.cloudUpgradeDeviceFirmwareCall(requestXML);
       }
    },
    
    cloudUpgradeDeviceFirmwareCall : function(requestXML) {
    	
        var dfd = $.Deferred();
    	 
    	cordova.exec(function (params) {
            wemoUtil.infoLog(firmwareUpgrade.TAG,"success call back");
            var authCode = params[0];
            $.ajax({
                url: cloudAPI.FIRMWARE_UPGRADE,
                type: "POST",
                data: requestXML,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader('Content-Type', 'application/xml');
                    xhr.setRequestHeader('Authorization', authCode);
                },

                success: function (data) {
                	wemoUtil.infoLog(firmwareUpgrade.TAG,"Sucess from cloud..." + data);
                    $(data).find('plugin').each(function () {

                    });
                    dfd.resolve();
                },

                error: function (xhr, textstatus) {
                         wemoUtil.infoLog(firmwareUpgrade.TAG, 'cloudUpgradeDeviceFirmwareCall status: ' + xhr.status);
                         wemoUtil.infoLog(firmwareUpgrade.TAG, 'cloudUpgradeDeviceFirmwareCall status text: ' + xhr.statusText);
                         dfd.resolve();
                },

                statusCode: {
                	500: function (){
                		wemoUtil.infoLog(firmwareUpgrade.TAG, 'cloudUpgradeDeviceFirmwareCall page not found');
                	},
                	503: function(){
                		wemoUtil.infoLog(firmwareUpgrade.TAG, 'cloudUpgradeDeviceFirmwareCall Cloud is down.');
                	},
                	403: function(){
                		wemoUtil.infoLog(firmwareUpgrade.TAG, 'cloudUpgradeDeviceFirmwareCall Please change the networkand try again');
                	}
                }

            });

        }, function (err) {
            console.log("failure call back");
        }, "WebServicePlugin", "getAuthCode", []);
    	
    	return dfd;
    },
    startBulbUpdates: function(){
    	wemoUtil.infoLog(firmwareUpgrade.TAG, 'starting bulb updates');
    	var bulbDeviceArray=JSON.parse(window.sessionStorage.getItem(sessionStore.FIRMWARE_BULB_UPDATE_DATA));
    	if(bulbDeviceArray!=null){
    		devicePlugin.execute(
		            function(status){
		                wemoUtil.infoLog(firmwareUpgrade.TAG, 'LED devices added to the fw update queue: ' + bulbDeviceArray);
		            },
		            firmwareUpgrade.reportError,
		            actions.ACTION_UPDATE_FW_QUEUE,
		            [bulbDeviceArray,wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_BRIDGE_UDN)]
		        );
    	}
    },
   
    buildXMLForFirmwareUpgrade : function(oldDeviceList){
        console.log('buildXMLForFirmwareUpgrade');
        var xmlString = '';
        var SwitchCnt = 0;
       
        for(index in oldDeviceList){
            var deviceItem = oldDeviceList[index];
            var startTime = deviceItem[key.DEVICE_FIRMWARE_COUNTDOWN];
            var signature = deviceItem[key.DEVICE_NEW_FIRMWARE_SIGNATURE];
            var pluginId = deviceItem[key.DEVICE_PLUGIN_ID];
            var downloadURL = deviceItem[key.DEVICE_NEW_FIRMWARE_URL];
            var macAddress = deviceItem[key.DEVICE_MAC_ADDRESS];
            var devicetype = deviceItem[key.DEVICE_TYPE];

            if ($.inArray($.trim(devicetype.toLowerCase()), ledmodelcodes) == -1)
            {
                if(SwitchCnt==0){
                	xmlString = '<plugins>';
                }
                xmlString += firmwareUpgrade.buildXMLForPlugin(pluginId, macAddress, startTime, signature, downloadURL, devicetype);
            	SwitchCnt++;
            }
            else{
            	 console.log('LED device present'+macAddress);
            }
        }
       if(SwitchCnt > 0){
        	xmlString +=  '</plugins>';
        	return xmlString;
        }else
        	return xmlString;
    },

    buildXMLForPlugin : function(pluginId, macAddress, startTime, signature, downloadURL, devicetype) {
		var cdataStart = '<![CDATA[<upgradeFwVersion>';
		var cdataEnd = '</upgradeFwVersion>]]>';
	
	        var xmlString = "  <plugin>" +
	            "  <recipientId>" + pluginId + "</recipientId>" +
	            "  <macAddress>" + macAddress + "</macAddress>" +
	            "  <content>" + cdataStart +
	            "  <plugin>" +
	            "  <downloadStartTime>" + startTime + "</downloadStartTime>" +
	            "  <signature>" + signature + "</signature>" +
	            "  <firmwareDownloadUrl>" + downloadURL + "</firmwareDownloadUrl>" +
	            "  <macAddress>" + macAddress + "</macAddress>" +
	            "  </plugin>" +
	            cdataEnd + " </content>" +
	            "  </plugin>"
	        return xmlString;
    },
    
    buildXMLForLEDBulb : function(pluginId, macAddress, startTime, signature, downloadURL, devicetype) {
    	    var xmlLEDString = "  <plugin>" +
		        "  <downloadStartTime>" + startTime + "</downloadStartTime>" +
		        "  <macAddress>" + macAddress + "</macAddress>" +
		        "  <signature>" + signature + "</signature>" +
		        "  <firmwareDownloadUrl>" + downloadURL + "</firmwareDownloadUrl>" +
		        "  </plugin>"
		        
		    return xmlLEDString;
     },
     sendFWNotification : function(value,udn,deviceFWVersion){
    	 wemoUtil.infoLog(firmwareUpgrade.TAG, 'fwNotification: ' + value);
    	 devicePlugin.execute(
		            function(status){
		                wemoUtil.infoLog(firmwareUpgrade.TAG, 'fwNotification sent: ' + value);
		            },
		            firmwareUpgrade.reportError,
		            actions.ACTION_UPDATE_FW_NOTIFICATION,
		            [value,udn,deviceFWVersion]
		        );
     },
    checkFirmwareUpdated : function(numOfDevices, firmwareUpgradeObject){
        console.log("FW <> Check Firm Ware STARTED Successfully");
    	var firmwareUpgradeData = window.sessionStorage.getItem(sessionStore.FIRMWARE_UPDATE_DATA);
        console.log("FW <>  firmwareUpgradeData::  "+firmwareUpgradeData + " ::  numOfDevices :: " + numOfDevices +" :: updatedDevicesCount ::" + updatedDevicesCount);
    	var timerCounter = 0;
    	firmwareUpgradeData = JSON.parse(firmwareUpgradeData);
    	
    	FWUpgradeTimeInterval = setInterval(function(){
    		timerCounter++;
        		
    		if(isRemoteEnabled){  
    			cloudServices.getDeviceList(
    					function(data) {

    						console.log("FW <>  Sucess firmware response cloud..."+data);

    						var deviceFirmwareArray = [];
    						$(data).find('device').each(function () {

    							console.log('FW <>  plugin ID: ' + $(this).find("pluginId").text());
    							deviceObject = {};
    							deviceFriendlyName = '';
    							deviceUDN = '';
    							for(index in firmwareUpgradeObject){
    								var object = firmwareUpgradeObject[index];
    								if(object[key.DEVICE_PLUGIN_ID] === $(this).find("pluginId").text()){
    									deviceObject[key.DEVICE_FRIENDLY_NAME] = object[key.DEVICE_FRIENDLY_NAME];;
    	    							deviceObject[key.DEVICE_FIRMWARE] = $(this).find("firmwareVersion").text();
    	    							deviceObject[key.DEVICE_FIRMWARE_STATUS] = $(this).find("fwUpgradeStatus").text();
    	    							deviceObject[key.DEVICE_TYPE] = $(this).find("modelCode").text();
    	    							
    	    							if (deviceObject[key.DEVICE_TYPE] == wemoLed.REMOTE_TYPE || $.inArray((deviceObject[key.DEVICE_TYPE]).toLowerCase(), ledmodelcodes) != -1)
    	    								deviceObject[key.DEVICE_UDN] = $(this).find("macAddress").text();
    	    							else
    	    								deviceObject[key.DEVICE_UDN] = object[key.DEVICE_UDN];
    	    							
    									break;
    								}
    							}
    							console.log("FW <>  firmware current version object data: " + JSON.stringify(deviceObject));
    							if(JSON.stringify(deviceObject) != "{}")
    							deviceFirmwareArray.push(deviceObject);
    						});
    						console.log("FW <>  firmware current version array: " + JSON.stringify(deviceFirmwareArray));
    						console.log("FW <>  firmware current version array.length: " + deviceFirmwareArray.length);
    						if(deviceFirmwareArray.length>0){
    							$.each(firmwareUpgradeData, function(udn, obj1) {
    								console.log("FW <> udn to be upgrade is ::"+udn+" and new firmware version to upgrade is :: "+firmwareUpgradeData[udn].newFirmwareVersion);
    								for(var k in deviceFirmwareArray) {
    									console.log("FW <>  fwUpgradeStatus: " + deviceFirmwareArray[k][key.DEVICE_FIRMWARE_STATUS]);
    									console.log("FW <>  UDN:  "+udn+" and firmware version is:: "+ deviceFirmwareArray[k][key.DEVICE_FIRMWARE]);
	    									if(udn === deviceFirmwareArray[k][key.DEVICE_UDN] && deviceFirmwareArray[k][key.DEVICE_FIRMWARE_STATUS] == firmwareMessagingEnum.FOUR ){
	    										var sessionStorefirmwareVersion = firmwareUpgradeData[udn].newFirmwareVersion;
	    										console.log("FW <>  FIRMWARE:  "+deviceFirmwareArray[k][key.DEVICE_FIRMWARE]+" === "+sessionStorefirmwareVersion);
	    										var searchResult = sessionStorefirmwareVersion.search(deviceFirmwareArray[k][key.DEVICE_FIRMWARE]);
	    										console.log("searchResult is::  " + searchResult);
	    										if(searchResult >= 0 && searchResult != -1)
	    										{
	    											console.log("FW <>  firmware is Updated");
	    											var arrayUDN = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
	    											if(arrayUDN)
	    				                                arrayUDN = arrayUDN.split(",");
	    		    					            for (var udnDevice in arrayUDN) {
	    		    					            	if(udn === arrayUDN[udnDevice]){
	    		    					            		arrayUDN.splice(udnDevice,1);
	    		    					            		 if (udn.indexOf('Bridge') != -1) {
	    		    					            			 wemoUtil.infoLog(firmwareUpgrade.TAG, "FW <>  link updated");
	    	    		    									 firmwareUpgrade.startBulbUpdates();
	    	    		    								 }
	    		    					            	}
	    		    					            		
	    		    					            }
	    		    					            window.sessionStorage.setItem(sessionStore.DEVICE_LIST_UPDATE,arrayUDN);
	    											delete firmwareUpgradeData[udn];
	    		    								updatedDevicesCount++;
	    		    								firmwareUpgrade.sendFWNotification(firmwareMessagingEnum.FOUR,udn,deviceFirmwareArray[k][key.DEVICE_FIRMWARE]);
	    		    								
	    										}else{
	    											console.log("FW <>  firmware is not supported");
	    										}
	    									}
	    									else if(udn === deviceFirmwareArray[k][key.DEVICE_UDN] && deviceFirmwareArray[k][key.DEVICE_FIRMWARE_STATUS] == firmwareMessagingEnum.FIVE ){
	    										var sessionStorefirmwareVersion = firmwareUpgradeData[udn].newFirmwareVersion;
	    										console.log("FW <>  FIRMWARE:  "+deviceFirmwareArray[k][key.DEVICE_FIRMWARE]+" === "+sessionStorefirmwareVersion);
	    										var searchResult = sessionStorefirmwareVersion.search(deviceFirmwareArray[k][key.DEVICE_FIRMWARE]);
	    										console.log("searchResult is::  " + searchResult);
	    										if(searchResult >= 0 && searchResult != -1)
	    										{
	    											console.log("FW <>  firmware is Updated");
	    											var arrayUDN = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
	    											if(arrayUDN)
	    				                                arrayUDN = arrayUDN.split(",");
	    		    					            for (var udnDevice in arrayUDN) {
	    		    					            	if(udn === arrayUDN[udnDevice])
	    		    					            		arrayUDN.splice(udnDevice,1);
	    		    					            }
	    		    					            window.sessionStorage.setItem(sessionStore.DEVICE_LIST_UPDATE,arrayUDN);
	    											delete firmwareUpgradeData[udn];
	    		    								updatedDevicesCount++;
	    		    								firmwareUpgrade.sendFWNotification(firmwareMessagingEnum.FIVE,udn,deviceFirmwareArray[k][key.DEVICE_FIRMWARE]);
	    										}else{
	    											console.log("FW <>  firmware is not supported");
	    										}
	    									}
	    									else if(udn === deviceFirmwareArray[k][key.DEVICE_UDN] && deviceFirmwareArray[k][key.DEVICE_FIRMWARE_STATUS] == firmwareMessagingEnum.SIX ){
	    										var sessionStorefirmwareVersion = firmwareUpgradeData[udn].newFirmwareVersion;
	    										console.log("FW <>  FIRMWARE:  "+deviceFirmwareArray[k][key.DEVICE_FIRMWARE]+" === "+sessionStorefirmwareVersion);
	    										var searchResult = sessionStorefirmwareVersion.search(deviceFirmwareArray[k][key.DEVICE_FIRMWARE]);
	    										console.log("searchResult is::  " + searchResult);
	    										console.log("FW <>  firmware is not Updated status 6");
    											var arrayUDN = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
    											if(arrayUDN)
    				                                arrayUDN = arrayUDN.split(",");
    		    					            for (var udnDevice in arrayUDN) {
    		    					            	if(udn === arrayUDN[udnDevice])
    		    					            		arrayUDN.splice(udnDevice,1);
    		    					            }
    		    					            window.sessionStorage.setItem(sessionStore.DEVICE_LIST_UPDATE,arrayUDN);
    											delete firmwareUpgradeData[udn];
    		    								updatedDevicesCount++;
    											firmwareFailCount++;
    											firmwareUpgrade.sendFWNotification(firmwareMessagingEnum.SIX,udn,deviceFirmwareArray[k][key.DEVICE_FIRMWARE]);
	    									}
	    									
    								}
    							});
    							console.log("FW <>  :  updatedDevicesCount:  "+updatedDevicesCount+"  ::  numOfDevices:  "+numOfDevices);
    							if(updatedDevicesCount >= numOfDevices){
    								console.log("FW <>  firmwareUpgradeData after del:  "+firmwareUpgradeData+ " ---"+JSON.stringify(firmwareUpgradeData));
    								var checkCount = 0;
    								$.each(firmwareUpgradeData, function(udn, obj1) {
    									checkCount++;
    								});
    								if(checkCount == 0){
    									console.log("FW <>  is empty:  "+checkCount);
    									clearInterval( FWUpgradeTimeInterval );
    									window.sessionStorage.setItem(sessionStore.IS_UPGRADE_INPROGRESS, "false");
    									window.sessionStorage.setItem(sessionStore.CHECK_FIRMWARE_UPGRADE_REQUIRED, "flase");
    									window.sessionStorage.removeItem(sessionStore.FIRMWARE_AVAILABLE);
    									
    									if(firmwareFailCount > 0)
    									{
    										if(updatedDevicesCount == firmwareFailCount)
    										{
    											 $('#updatecompletetitle').html(wemo.items['UpdateFailedTitle']);
    					                         $('#updatecompletedata').html(wemo.items['UpdateFailedData']);
    					                         $("#hooray_firmware").popup('open');
    										}
    										else 
    										{
    											 $('#updatecompletetitle').html(wemo.items['UpdatePartiallyCompleteTitle']);
    					                         $('#updatecompletedata').html(wemo.items['UpdatePartiallyCompleteData']);
    					                         $("#hooray_firmware").popup('open');
    										}
    									}
    									else
    										$("#hooray_firmware").popup('open');
    										    										
    								}else{
    									console.log("FW <>  is not empty:  "+checkCount);
    								}
    							}
    						}
    					},

    					function(error) {
    						console.log("FW <>  failure call back" +  error);
    					}, "load"
    			);	
    		}else{
    			var isFWFound = false;
    			$.each(firmwareUpgradeData, function(udn, obj1) {
    				var sessionStorefirmwareVersion = firmwareUpgradeData[udn].newFirmwareVersion;
    				console.log("FW <> udn to be upgrade is ::"+udn+" and new firmware version to upgrade is :: "+sessionStorefirmwareVersion);
    				
    				if(udn.indexOf("uuid") != -1)
    				{
	    					devicePlugin.execute(
	        						function(params){
	        							console.log("FW <>  Get FIRMWARE version response:  "+params+" === "+sessionStorefirmwareVersion);
	        							if(params!="")
	        							var searchResult = sessionStorefirmwareVersion.search(params);
	        							console.log("searchResult is::  " + searchResult);
	        							if(searchResult >=0 && searchResult != -1)
	        							{
	        								firmwareUpgradeData = window.sessionStorage.getItem(sessionStore.FIRMWARE_UPDATE_DATA);
	        			    		        firmwareUpgradeData = JSON.parse(firmwareUpgradeData);
	        								console.log("FW <>  firmware is Updated");
	        								var arrayUDN = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
	        								if(arrayUDN)
	        	                                arrayUDN = arrayUDN.split(",");
	        					            for (var udnDevice in arrayUDN) {
	        					            	if(udn === arrayUDN[udnDevice])
	        					                  	arrayUDN.splice(udnDevice,1);
	        					            }
	        								window.sessionStorage.setItem(sessionStore.DEVICE_LIST_UPDATE,arrayUDN);
	        								delete firmwareUpgradeData[udn];
	        								isFWFound = true;
	        								updatedDevicesCount++;
	        								console.log("firmwareUpgradeData "+firmwareUpgradeData+"----"+JSON.stringify(firmwareUpgradeData));
	        								window.sessionStorage.setItem(sessionStore.FIRMWARE_UPDATE_DATA, JSON.stringify(firmwareUpgradeData));
	        								window.sessionStorage.removeItem(sessionStore.LED_DEVICE_FIRMWARE_ARRAY);
	        							}else{
	        								console.log("FW <>  firmware is not supported");
	        								isFWFound = false;
	        							}
	        						},
	        						firmwareUpgrade.reportError,
	        						actions.GET_FIRMWARE_VERSION_SRSS,
	        						[udn,"currFW"]
	        				);
    				}
    				
    			});
    			console.log("FW <>  :  updatedDevicesCount:  "+updatedDevicesCount+"  ::  numOfDevices:  "+numOfDevices);
    			if(updatedDevicesCount >= numOfDevices){
    				
    				firmwareUpgradeData = window.sessionStorage.getItem(sessionStore.FIRMWARE_UPDATE_DATA);
    		        firmwareUpgradeData = JSON.parse(firmwareUpgradeData);
    		    	
    				console.log("FW <>  firmwareUpgradeData after del:  "+firmwareUpgradeData+ " ---"+JSON.stringify(firmwareUpgradeData));
    				var checkCount = 0;
    				$.each(firmwareUpgradeData, function(udn, obj1) {
    					checkCount++;
    				});
    				if(checkCount == 0){
    					console.log("FW <>  is empty:  "+checkCount);
        			    clearInterval(FWUpgradeTimeInterval );
        			    window.sessionStorage.setItem(sessionStore.IS_UPGRADE_INPROGRESS, "false");
        			    window.sessionStorage.setItem(sessionStore.CHECK_FIRMWARE_UPGRADE_REQUIRED, "false");
        			    window.sessionStorage.removeItem(sessionStore.FIRMWARE_AVAILABLE);
        			    window.sessionStorage.removeItem(sessionStore.LED_DEVICE_FIRMWARE_ARRAY);
        			    
        			    if(firmwareFailCount > 0)
						{
							if(updatedDevicesCount == firmwareFailCount)
							{
								 $('#updatecompletetitle').html(wemo.items['UpdateFailedTitle']);
		                         $('#updatecompletedata').html(wemo.items['UpdateFailedData']);
		                         $("#hooray_firmware").popup('open');
							}
							else 
							{
								 $('#updatecompletetitle').html(wemo.items['UpdatePartiallyCompleteTitle']);
		                         $('#updatecompletedata').html(wemo.items['UpdatePartiallyCompleteData']);
		                         $("#hooray_firmware").popup('open');
							}
						}
        			    else
    						$("#hooray_firmware").popup('open');

    				}else{
    					console.log("FW <>  is not empty:  "+checkCount);
    				}
    			}
    		}
    	}, timeout.FIRMWARE_UPDATE_CHECK_LOOP);
    }
    
};
