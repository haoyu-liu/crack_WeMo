/*
 setup_success.js

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
var TAG = "setup_success.js ";
var pictureSource;
var destinationType;
var lightswitchbacklighttapped = false;
var lightsensorbacklighttapped = false;
var sensorType;
var switchType;
var attributeListJson;
var deviceType;
$(document).bind('pageinit', function() {
    $('.ui-header').css({'border-bottom': '1px solid #888 !important'});
    $('.sub_header').css({'z-index':3,'border-top': '1px solid #73D44C !important'});
	var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));
    setupSuccess.initialize();
});

var setupSuccess = {

    initialize : function() {
        console.log(TAG + "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    onDeviceReady : function() {
        nativeUtilPlugin.execute(null, null, actions.CLOSE_SOFT_KEYBOARD,[]);
        console.log(TAG + "device ready");
        setupSuccess.bindEvents();
      /*  setTimeout(function(){
        	setupSuccess.setCustomState();
		},300);*/

		disableNetworkWatchdog = true;
        nativeUtilPlugin.execute(null,setupSuccess.reportError,actions.PREF_SET_GET_STARTED_NEEDED,[false]);

        deviceType = wemo.items[window.sessionStorage.getItem("device_type")] ;
		$('#device_type').html(deviceType);
        $('#device_ssid').text(window.sessionStorage.getItem("device_SSID"));
        $('#setup_success_message').html(wemo.items[window.sessionStorage.getItem("SETUP_SUCCESS_MESSAGE")]);

        $("#remote_setup_failure_footer,#remote_setup_success_footer").hide();

        if((window.sessionStorage.getItem(sessionStore.SETUP_REMOTE_STATUS)).toUpperCase() === 'S'){
            $("#remote_setup_success_footer").show();
            $('#remote_status_header').html(wemo.items['EnableRemoteSuccessTitle']);
            $('#remote_status_body').html(wemo.items['EnableRemoteSuccessContent']);
        }else{
			$("#remote_setup_failure_footer").show();
            $('#remote_status_header').html("Remote Access Failed");
            $('#remote_status_body').html(wemo.items['errorRemoteAccessFailed']);
        }

        if(window.sessionStorage.getItem("show_remote_alert") == "true"){
			setTimeout(function(){
				$( "#remote_status_popup" ).popup( "open" );
			},1000);
            window.sessionStorage.setItem("show_remote_alert", "false");
        }


        $('#remote_status_ok_btn, #remote_status_ok_btn_failure').on('click',function(){
            $( "#remote_status_popup" ).popup( "close" );
        });

        $('#remote_status_try_again_btn').on('pointerdown',function(){
            window.sessionStorage.setItem(sessionStore.STARTUP_MODE, startupMode.RETRY_REMOTE_ENABLE);
            wemoUtil.loadUrl(filePath.INDEX);
        });

        $('#friendly_name').text(window.sessionStorage.getItem("device_friendly_name"));

        $("#device_thumb").attr("src", window.sessionStorage.getItem("device_thumb_url"));
        
        var emaill = window.sessionStorage.getItem("stored_email_address");
        if(emaill != null)
        $('#email_address').text(emaill);
        var type = window.sessionStorage.getItem("type");
        type=setupSuccess.getFilteredDeviceType(type);
        setupSuccess.getBrandName(type);
        
        if (deviceType == wemoMaker.TYPE || deviceType == wemoMaker.REMOTE_TYPE || deviceType=="WeMo Maker") {
        		$('#switchbackground').show();
				$('#sensorbackground').show();
				$('#switchline').show();
				$('#sensorline').show();
        	attributeListJson = window.sessionStorage.getItem("device_attribute_list");
			if(attributeListJson == undefined) {
				setupPlugin.execute(
						function(attributeList) {
							if(attributeList != null)
							{
								console.log("Get attributeList :"+attributeList);	
								attributeListJson = JSON.stringify(attributeList);
								window.sessionStorage.setItem("device_attribute_list", attributeListJson);
							}
							else{
								console.log("Edit Wemo Details Get attributeList error :::");	
								switchType = 0;
								sensorType = 0;
							}
						},
						setupSuccess.reportError,
						ACTION_GET_ATTRIBUTES,
						[]
				  );
			}
        }
        
        if (deviceType == wemoMaker.TYPE || deviceType == wemoMaker.REMOTE_TYPE|| deviceType=="WeMo Maker") {
        	$('#switchbackground').show();
        	$('#sensorbackground').show();
        	$('#switchline').show();
        	$('#sensorline').show();

        	attributeListJson = JSON.parse(attributeListJson);
        	console.log("attributeListJson"+attributeListJson);
        	switchType = attributeListJson.SwitchMode.value;
        	sensorType = attributeListJson.SensorPresent.value;
        	$('.switchbackground_li').removeClass('div_bg_green');
        	if(switchType == 0)
        	{
        		$('#switchstatusselected').html("Toggle");
        		$("#togglediv").addClass('div_bg_green');
        	}
        	if(switchType == 1)
        	{
        		$('#switchstatusselected').html("Momentary");
        		$("#momentarydiv").addClass('div_bg_green');
        	}
        	$('.sensorbackground_li').removeClass('div_bg_green');
        	if(sensorType == 1)
        	{
        		$('#sensorstatusselected').html("Yes");
        		$("#sensoryesdiv").addClass('div_bg_green');
        	}
        	if(sensorType == 0)
        	{
        		$('#sensorstatusselected').html("No");
        		$("#sensornodiv").addClass('div_bg_green');
        	}
        	$("#switchbackground").on('tap', function(){
        		if(lightswitchbacklighttapped){
        			$('#switchslection').hide();
        			lightswitchbacklighttapped = false;
        		}
        		else{
        			$('#switchslection').show();
        			lightswitchbacklighttapped = true;
        		}	
        	});
        	$("#sensorbackground").on('tap', function(){
        		if(sensorType == 1)
        		{
        			$('#sensorstatusselected').html("Yes");
        			$('.sensorbackground_li	dim_high').addClass('div_bg_green');
        		}
        		if(sensorType == 0)
        		{
        			$('#sensorstatusselected').html("No");
        			$('.sensorbackground_li	dim_low').addClass('div_bg_green');
        		}
        		if(lightsensorbacklighttapped){
        			$('#sensorselection').hide();
        			lightsensorbacklighttapped = false;
        		}
        		else{
        			$('#sensorselection').show();
        			lightsensorbacklighttapped = true;
        		}	
        	});
        	$(".switchbackground_li").on("click", function(e)
        			{
        		e.stopPropagation(); 
        		switchType = $(this).find("span").html();
        		if(switchType ==  "Toggle")
        		{
        			switchType = 0;
        		}
        		if(switchType == "Momentary")
        		{
        			switchType=1;
        		}
        		attributeListJson.SwitchMode.value = switchType;
        		window.sessionStorage.setItem("device_attribute_list", JSON.stringify(attributeListJson));
        		$('.switchbackground_li').removeClass('div_bg_green');
        		$(this).addClass('div_bg_green');
        		$('#switchstatusselected').html(($(this).html()));
        		$('#switchslection').hide();
        		lightswitchbacklighttapped = false;
        			});
        	$(".sensorbackground_li").on("click", function(e)
        			{
        		e.stopPropagation(); 
        		sensorType = $(this).find("span").html();
        		if(sensorType == "Yes")
        		{
        			sensorType = 1;
        		}
        		if(sensorType == "No")
        		{
        			sensorType = 0;
        		}
        		attributeListJson.SensorPresent.value = sensorType;
        		window.sessionStorage.setItem("device_attribute_list",  JSON.stringify(attributeListJson));
        		$('.sensorbackground_li').removeClass('div_bg_green');
        		$(this).addClass('div_bg_green');
        		$('#sensorstatusselected').html(($(this).html()));
        		$('#sensorselection').hide();
        		lightswitchbacklighttapped = false;
        			});
        }

        
        $('#friendly_name_row').on('tap',function() {
            wemoUtil.loadUrl(filePath.SETUP_EDIT_FRIENDLY_NAME);
        });

        $('#device_icon_row').on('click', function() {
//            $('#select_photo_popup').popup();
//            $('#select_photo_popup').show();
//            $('#select_photo_popup').popup('open');

            $("#gosh_message").popup('open');
        });

        $('#email_row').on('tap',function() {
            wemoUtil.loadUrl(filePath.SETUP_EDIT_EMAIL);
        });

        $('#photo_pick_option').on('click', '> li', function() {
            $('#select_photo_popup').attr('data-go-forward', 'true');

            var selected_id = $(this).attr('id');
            console.log(TAG + "Photo selection option: " + selected_id);
            if (selected_id === 'take_photo') {
                setupSuccess.getCameraPicker();
            } else if (selected_id === 'select_from_gallery') {
                setupSuccess.getGalleryPicker();
            } else if(selected_id === 'remove_photo'){
                setupSuccess.removePhoto();
            }

            $("#select_photo_popup").popup("close");

        });

        $('#save_setup').on('tap',function() {
        	if (deviceType == wemoMaker.TYPE || deviceType == wemoMaker.REMOTE_TYPE || deviceType=="WeMo Maker") {
        		//Add action for set Attributes
        		setupPlugin.execute(function(status){
        			console.log("Swtich type Set Successfully " );	
        		}, setupSuccess.reportError,ACTION_SET_ATTRIBUTES,[attributeListJson] );
        	}
        	// Save Friendly Name
    		var isFriendlyName = window.sessionStorage.getItem("IsFriendlyName");
			if (!isFriendlyName) {
				setupPlugin.execute(function(result) {
                    console.log("set friendly name: " + result.ChangeFriendlyName);
                }, null,
                ACTION_SET_FRIENDLY_NAME, [$('#friendly_name').text()]);
				window.sessionStorage.setItem("device_friendly_name", $('#friendly_name').text());
    		}else {
    			window.sessionStorage.removeItem("IsFriendlyName");
    		}
            var isConnected = "false";

            nativeUtilPlugin.execute(null, null, actions.CLOSE_SOFT_KEYBOARD,[]);
            devicePlugin.execute(null, null, actions.STOP_CONTROL_POINT, []);

            setupPlugin.execute(function(status){
                    isConnected = status;
                    console.log("execute isConnected: " + isConnected);
                    setupSuccess.saveSetup(isConnected) ;
                }, setupSuccess.reportError,
                ACTION_IS_NETWORK_CONNECTED, []);

            console.log("isConnected: " + isConnected);


        });
        
        // Custom icons are not currently supported popup Starts

    	
    	$("#gosh_message_ok_btn").on('click', function(){
    		$("#gosh_message").popup('close');
    	});
    	
    	// Custom icons are not currently supported popup Ends

    },

    bindEvents : function() {
        console.log(TAG + "bind events");
        document.addEventListener('offline', setupSuccess.onOffline, false);
        document.addEventListener('online', setupSuccess.onOnline, false);
        document.addEventListener("backbutton", setupSuccess.onBackPress, false);
        document.addEventListener("resume", setupSuccess.onResume, false);

    },

    onBackPress : function() {
        console.log(TAG + "back button pressed");
         if($('#select_photo_popup').is(':visible')){
            console.log(TAG	+ "Dialog box is open");
            $( "#select_photo_popup" ).popup( "close" );
            $( "#select_photo_popup" ).hide()
        }else{
            window.sessionStorage.clear();
            //navigator.app.clearHistory();
            setupPlugin.execute(null, null, ACTION_STOP_UPNP_SERVICE, []);
            navigator.app.exitApp();
        }
    },

    onResume : function() {
        console.log(TAG + "resumed");
    },

    onOffline : function() {
        console.log(TAG + "offLine");
    },

    onOnline : function() {
        console.log(TAG + "onLine");
    },

    getCameraPicker : function() {
        var information = {
            "udn" : "",
            "ssid" : appliance.ssid
        };
        smartDevicePlugin.execute(
            editWemoDetails.onPhotoURISuccess,
            editWemoDetails.reportError,
            actions.TAKE_PICTURE, [information]
        );
    },

    getGalleryPicker : function() {
        var information = {
            "udn" : "",
            "ssid" : appliance.ssid
        };

        smartDevicePlugin.execute(
            editWemoDetails.onPhotoURISuccess,
            editWemoDetails.reportError,
            actions.CHOOSE_PHOTO, [information]
        );
    },

    onPhotoURISuccess : function(imageURI) {
        wemoUtil.infoLog(TAG, "Image URI: " + imageUri);
        window.sessionStorage.setItem("custom_icon_url", imageUri);
        $("#device_thumb").css("background-image", 'url(' + imageUri + ')');

    },

    removePhoto: function() {
        var imageUri = window.sessionStorage.getItem("device_thumb_default_url");
        window.sessionStorage.setItem("custom_icon_url", imageUri);
        $("#device_thumb").css("background-image", 'url(' + imageUri + ')');
    },

    reportError : function(e) {
        console.log(TAG + "Plugin Failure Call back!!!!   " + e);
    },

    saveSetup : function(isConnected){
        if(isConnected == "true"){
            console.log("if isConnected: " + isConnected);
            nativeUtilPlugin.execute(null,null,actions.SHOW_PROGRESS,[]);

            setupPlugin.execute(
                null,
                setupSuccess.reportError,
                ACTION_SET_CONFIG_STATUS,
                [ $('#remember_wifi').is(':checked') ]
            );

            setTimeout(function() {

                // Set Icon
                console.log(TAG + "Send img: " + window.sessionStorage.getItem("device_thumb_url"));
                setupPlugin.execute(null, setupSuccess.reportError,ACTION_SET_DEVICE_IMAGE, [ window.sessionStorage.getItem("device_thumb_url") ]);

                // Close AP only if its fall back on its own AP
                setupSuccess.closeAccessPoint();
            }, timeout.LONG);

            setupSuccess.emailOptIn();
            
            // Save WiFi Status

        } else{
            console.log("else isConnected: " + isConnected);
            setupSuccess.loadNoNetworkPage();
        }


    } ,

    closeAccessPoint : function(){
        setupPlugin.execute(
            function(result) {
                console.log("Close AP success callback");
                setTimeout(function(){
                    setupPlugin.execute(null, null, ACTION_STOP_UPNP_SERVICE, []);
                    setTimeout(function(){
                        setupSuccess.loadNoNetworkPage();
                    }, timeout.SETUP_EXIT);
                    setupSuccess.getNetworkType();
                }, timeout.AP_CLOSE);
            },
            setupSuccess.reportError,
            ACTION_CLOSE_ACCESS_POINT,
            []
        );
    },
    setCustomState : function(){
    	console.log("setCustomState: ");
    	setupPlugin.execute(function(status){
    		console.log("the status is::  " + status);
    	}, setupSuccess.reportError,
    	ACTION_SET_CUSTOM_STATE, []);
    },
    getNetworkType : function(){
        nativeUtilPlugin.execute(
            setupSuccess.processNetworkType,
            setupSuccess.reportError,
            actions.GET_NETWORK_TYPE_NEW,
            []
        );
    },

    processNetworkType : function(type){
        console.log(TAG + "processNetworkType: " + type);
        switch(type){
            case networkType.HOME_NETWORK:
                window.sessionStorage.setItem(sessionStore.REMOTE_MODE, false);
                devicePlugin.execute(setupSuccess.loadDeviceListPage(),setupSuccess.reportError,actions.INITIALIZE_UPNP,[]);
                break;
            case networkType.REMOTE_WIFI:
                window.sessionStorage.setItem(sessionStore.REMOTE_MODE, true);
                setupSuccess.loadDeviceListPage();
                break;
            case networkType.REMOTE_MOBILE:
            	console.log("REMOTE_MOBILE:  "+networkType.REMOTE_MOBILE);
                nativeUtilPlugin.execute(
                    function(enabled){
                        console.log("Remote enabled: " + enabled);
                        if(enabled){
                        	console.log("Load Device List Page");
                            window.sessionStorage.setItem(sessionStore.REMOTE_MODE, true);
                            setupSuccess.loadDeviceListPage();
                        }else{
                        	console.log("Load Remote Not Available Page");
                            setupSuccess.loadRemoteNotAvailablePage();
                        }
                    },
                    setupSuccess.reportError,
                    actions.PREF_IS_REMOTE_ENABLED,
                    []
                );
                break;
            case networkType.WEMO:
                setupSuccess.loadIndexPage();
                break;

            case networkType.NO_NETWORK:
            	console.log("No Network");
                setTimeout(function(){
                	console.log("Get Network Type again");
                    setupSuccess.getNetworkType();
                },timeout.NETWORK_RETRY);

                break;

            default:
                console.log("Not supported ");
                return;
                break;
        }
    },

    loadDeviceListPage : function(){
        nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
        var delay = timeout.CONTROL_POINT_DELAY;
        setTimeout(function(){
            console.log(TAG + "Loading devices");
            setupSuccess.loadIndexPage();
        }, delay);

        /*
         nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
         setTimeout(function(){
         wemoUtil.loadUrl(filePath.DEVICE_LIST);
         }, timeout.CONTROL_POINT_DELAY);
         */
    },
    
    loadRemoteNotAvailablePage : function(){
        nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
        wemoUtil.loadUrl(filePath.REMOTE_NOT_AVAILABLE);
    },

    loadIndexPage : function(){
        nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
        wemoUtil.loadUrl(filePath.INDEX);
    },

    loadNoNetworkPage : function(){
        nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
        wemoUtil.loadUrl(filePath.NO_NETWORK);
    },
    emailOptIn : function(){
    	var type = window.sessionStorage.getItem("type");
    	console.log("setupSuccess emailOptIn: "+type);
    	type=setupSuccess.getFilteredDeviceType(type);
    	console.log("emailOptIn getFilteredDeviceType type: "+type);
    	setupSuccess.saveEmailPreferences(type,0);
    	setupSuccess.saveEmailPreferences(type,1);

    },
    saveEmailPreferences: function(type, ptype){
    	 nativeUtilPlugin.execute(
         		function(emailIDs) {
         			var newEmail = window.sessionStorage.getItem("stored_email_address");
         			console.log("emailOptIn emailIDs: " + emailIDs+" new email "+newEmail+" ptype: "+ptype);
         			if(emailIDs!=null&&emailIDs!="")
         			{
         				data = JSON.parse(emailIDs);
         				var typefound=false;
         				var emailfound=false;
         				$(data.deviceTypes).each(function() {
         					if(type==this.type)
         					{      
         						typefound=true;
         						console.log("emailOptIn type: " + type+" emails are : "+this.emailAddress);
         						$(this.emailAddress).each(function(str) {
         							if(this==newEmail)
         							{
         								emailfound=true;
         							}
         						});
         						if(!emailfound)
         						{
         							this.emailAddress.push(newEmail);
         						}
         					}
         				});
         				console.log("emailOptIn emailfound: " + emailfound);
         				if(!typefound)
         				{
         					emailfound=false;
         					var deviceTypeStr = '{"type":"'+type+'","emailAddress":["'+newEmail+'"]}';
         					var deviceType = JSON.parse(deviceTypeStr);
         					data.deviceTypes.push(deviceType);
         					console.log("emailOptIn type not found data"+data);
         				}
         			}
         			else
         			{
         				emailfound=false;
         				console.log("emailOptIn type "+ type + "newEmail" + newEmail);
         				var deviceTypeStr = '{"type":"'+type+'","emailAddress":["'+newEmail+'"]}';
         				var newdata = '{"deviceTypes":['+deviceTypeStr+']}';
         				var data = JSON.parse(newdata);
         				console.log("emailOptIn new data is: " + JSON.stringify(data));
         			}

                     if(!emailfound)
                     {
                     	nativeUtilPlugin.execute(function(status){
                     		console.log("emailOptIn set email address: " + status);
                     	}, null,
                     	actions.SET_EMAIL_ADDRESS, [ptype,JSON.stringify(data)]);   
                     }

         		},
         		null,
         		actions.GET_EMAIL, [ptype]
         );
	},
    getFilteredDeviceType: function(type) {
		console.log(TAG + "getFilteredDeviceType type: "+type);
		if(type.indexOf("sensor") != -1){
			type = "Sensor";
		}
		else if(type.indexOf("controllee") != -1){
			type = "Switch";
		}
		else if(type.indexOf("insight") != -1){
			type = "Insight";
		}
		else if(type.indexOf("bridge") != -1){
			type = "Bridge";
		}
		else if(type.indexOf("lightswitch") != -1){
			type = "Lightswitch";
		}
		else if (type.indexOf("coffeeMaker") != -1||type.indexOf("CoffeeMaker") != -1){
			type = "coffeeMaker";
		}
		else if (type.indexOf("Maker") != -1){
			type = "Maker";
		}
		else if (type.indexOf("crockpot") != -1||type.indexOf("Crockpot") != -1){
			type = "crockpot";
		}
		else if (type.indexOf("heaterA") != -1||type.indexOf("HeaterA") != -1){
			type = "heaterA";
		}
		else if (type.indexOf("heaterB") != -1||type.indexOf("HeaterB") != -1){
			type = "heaterB";
		}
		else if (type.indexOf("humidifier") != -1||type.indexOf("Humidifier") != -1){
			type = "humidifer";
		}
		else if (type.indexOf("humidifierB") != -1||type.indexOf("HumidifierB") != -1){
			type = "humidiferB";
		}
		else if (type.indexOf("airPurifier") != -1||type.indexOf("AirPurifier") != -1){
			type = "airPurifier";
		}
		return type;
	},
	getBrandName: function(type){
		console.log(TAG + "getBrandName type: "+type);
		if(type === "crockpot"){
			$('#brand_nameph').html(wemo.items['CrockPotString']);
		} else if(type === "heaterA" || type === "heaterB") {
			$('#brand_nameph').html(wemo.items['HeaterString']);
		} else if(type === "humidifier") {
			$('#brand_nameph').html(wemo.items['HumidifierString']);
		} else if(type === "humidifierB") {
			$('#brand_nameph').html(wemo.items['HumidifierBString']);
		} else if(type === "airPurifier") {
			$('#brand_nameph').html(wemo.items['AirPurifierString']);
		} else if(type === "coffeeMaker") {
			$('#brand_nameph').html(wemo.items['CoffeeMakerString']);
		} else if(type === "Sensor"){
			$('#brand_nameph').html(wemo.items['DefaultName_WeMoMotion']);
		} else if(type === "Switch"){
			$('#brand_nameph').html(wemo.items['DefaultName_WeMoSwitch']);
		} else if(type === "Insight"){
			$('#brand_nameph').html(wemo.items['DefaultName_WeMoInsight']);
		} else if(type === "Bridge"){
			$('#brand_nameph').html(wemo.items['CrockPotString']);
		} else if(type === "Lightswitch"){
			$('#brand_nameph').html(wemo.items['DefaultName_WeMoLightSwitch']);
		} else if(type === "Maker"){
			$('#brand_nameph').html(wemo.items['DefaultName_WeMoMaker']);
		} else{
			$('#brand_nameph').html(wemo.items['BelKinString']);
		}
	}
};
