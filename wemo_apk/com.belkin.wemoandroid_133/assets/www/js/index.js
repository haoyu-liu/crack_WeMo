/*
 index.js

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

var TAG = 'index.js: ';

$(document).bind('pageinit', function() {

	indexAux.initialize();
});
var isRemoteEnabled = false;
var previousMessage = '';
var setupMessagesTimer = 0;
var updateSetupMessageTimer = 2000;
var upnpInit = false;
var registerListener = false;
var multipleBridgeCounter = 0;
var storePlugindetails = [];
var isLinkDevice = false;

var indexAux = {


	TAG : 'index.js',

	routerName : {},
		
    initialize: function () {
        console.log('Main -> Initialize the app');
        wemoUtil.infoLog(indexAux.TAG, 'initialize cloud: ' + cloud + " firmwareCloud: " + firmwareCloud);
        document.addEventListener('deviceready', this.onDeviceReady, false);
        disableNetworkWatchdog = true;
    },

    onDeviceReady: function () {
        wemoUtil.infoLog(indexAux.TAG, 'onDeviceReady');
        window.sessionStorage.setItem("initial_run", '1');
        console.log('Main -> onDeviceReady');
        sharedPreferences.get(sharedPreferencesConstants.WEMO_NAMESPACE,
            sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_LAUNCHEDCOUNT, '', function (data) {
                console.log('Main -> Launched count: ' + data);
                if (data != undefined || data != null) {
                    sharedPreferences.set(sharedPreferencesConstants.WEMO_NAMESPACE,
                        sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_LAUNCHEDCOUNT, Number(data)+1);
                } else {
                    sharedPreferences.set(sharedPreferencesConstants.WEMO_NAMESPACE,
                        sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_LAUNCHEDCOUNT, 0);
                }
            });


		navigator.globalization.getLocaleName(
			function (locale) {
				console.log("local info-----" + locale.value);
				window.localStorage.setItem('DEVICE_LANG', locale.value);
			},
			function () {
				console.log("local info-----else" + locale.value);
				window.localStorage.setItem('DEVICE_LANG', 'en');
			}
		);


        window.localStorage.setItem('LookingForDevices', wemo.items['Devices_LookingForDevices']);

        indexAux.bindEvents();
        indexAux.initializeDOMElements();
        indexAux.setupDOMListeners();
        indexAux.getAppVersion();

			if (wemoUtil.debugHTML === true)
			{
				//wemoUtil.loadUrl("file:///android_asset/www/debug_views.html");
				wemoUtil.loadUrl(filePath.DEBUG_VIEWS);   
			}
			else
			{
				indexAux.startApplication();
			}

			
			 $('#multiple_bridge_cancel_btn').on('click', function() {
				 multipleBridgeCounter++;
	            $("#multiple_bridge_popup").popup("close");
	            indexAux.closeAccessPoint();
			 });
			 
			 $('#multiple_bridge_no_btn').on('click', function() {
				 multipleBridgeCounter++;
	            $("#multiple_bridge_popup").popup("close");
	            indexAux.closeAccessPoint();
			 });

	         $('#multiple_bridge_yes_btn').on('click', function() {
	            $("#multiple_bridge_popup").popup("close");
	            window.sessionStorage.setItem(sessionStore.LED_MULTIPLE_BRIDGE_INFO, true);

	            //auto connect
				$('#status_holder').html(wemo.items['AppStatusLookingForHomeNetwork']);
				console.log("Messaging: #status_holder 1 - "+$('#status_holder').text());

				setTimeout(
						function(){
							console.log("storePlugindetails "+storePlugindetails+"---"+JSON.stringify(storePlugindetails));
							indexAux.autoPairing(storePlugindetails);
						},
						500
				);
				
	         });
		nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);

		},

		bindEvents : function () {
			wemoUtil.infoLog(indexAux.TAG, 'bindEvents');
			document.addEventListener('online', indexAux.onOnline, false);
			document.addEventListener('offline', indexAux.onOffline, false);
			document.addEventListener('backbutton', indexAux.onBackPress, false);
			document.addEventListener('pause', indexAux.onPause, false);
			document.addEventListener('resume', indexAux.onResume, false);
		},

		onOffline : function() {
			wemoUtil.infoLog(indexAux.TAG, 'offLine');
//			window.sessionStorage.removeItem(sessionStore.STARTUP_MODE);
//			nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
//			wemoUtil.loadUrl(filePath.NO_NETWORK);
//			$('.loading_spinner_splash').hide();
		},

		onOnline : function() {
			wemoUtil.infoLog(indexAux.TAG,  'onLine');
		},

		onBackPress : function() {
			wemoUtil.infoLog(indexAux.TAG,  'onBackPress');
			setupPlugin.execute(null, null, ACTION_STOP_UPNP_SERVICE, []);
			wemoUtil.exitApp();
		},

		onPause : function() {
			wemoUtil.infoLog(indexAux.TAG,  'onPause');
		},

		onResume : function() {
			wemoUtil.infoLog(indexAux.TAG, 'onResume');
            wemoUtil.loadUrl(filePath.INDEX);
		},

		initializeDOMElements : function(){
			wemoUtil.infoLog(indexAux.TAG, 'initializeDOMElements');
			indexAux.routerName = $("#router_name");
		},

		setupDOMListeners : function (){
			wemoUtil.infoLog(indexAux.TAG, 'setupDOMListeners');
			$('#status_holder_img').hide();

			indexAux.showConnectedTo();

			$('#setup_password_fail_ok_button').on('tap', function(){
				$('#setup_password_fail_popup').popup('close');
				indexAux.manualPairing();
			});
		},

		startApplication : function(){
			wemoUtil.infoLog(indexAux.TAG, 'startApplication');
			//nativeUtilPlugin.execute(null,null,actions.SHOW_PROGRESS,[]);
			$('.loading_spinner_splash').show();

			/*previousMessage = $('#status_holder').text();
        index.setUpMessaging();*/

			setTimeout(
					function(){
						switch(window.sessionStorage.getItem(sessionStore.STARTUP_MODE)){
						case startupMode.MANUAL_CONNECT:
							window.sessionStorage.removeItem(sessionStore.STARTUP_MODE);
							indexAux.manualConnect();
							break;
						case startupMode.RETRY_REMOTE_ENABLE:
							window.sessionStorage.removeItem(sessionStore.STARTUP_MODE);
							indexAux.processConnectionStatus('1');
							break;
						default :
							indexAux.getNetworkType();
						break;
						}
					},
					timeout.LONG
			);
		},

		getNetworkType : function(){
			wemoUtil.infoLog(indexAux.TAG, 'getNetworkType');
			nativeUtilPlugin.execute(
					indexAux.processNetworkType,
					indexAux.reportError,
					actions.GET_NETWORK_TYPE_NEW,
					[]
			);
		},
		showConnectedTo : function(){
			wemoUtil.infoLog(indexAux.TAG, 'showConnectedTo');
			nativeUtilPlugin.execute(
					indexAux.showConnectedToText,
					indexAux.reportError,
					actions.GET_NETWORK_NAME,
					[]
			);
		},
		processNetworkType : function(type){
			var smartGoing=window.sessionStorage.getItem(sessionStore.SMART_SETUP_ONGOING);
			var superSmartGoing=window.sessionStorage.getItem(sessionStore.SUPER_SMART_SETUP_ONGOING);
			wemoUtil.infoLog(indexAux.TAG, 'processNetworkType: ' + type+" smart setup : "+(window.sessionStorage.getItem(sessionStore.SMART_SETUP))+" going: "+smartGoing+" superSmartGoing: "+superSmartGoing);
			window.sessionStorage.setItem(sessionStore.NETWORK_TYPE, type);
			indexAux.showConnectedTo();
			switch(type){
			case networkType.HOME_NETWORK:
				window.sessionStorage.setItem(sessionStore.REMOTE_MODE, false);
				if (smartGoing=="1") {
					wemoUtil.infoLog(indexAux.TAG, 'Smart set up ongoing connected to home: ');

					nativeUtilPlugin.execute(
							function(enabled){
								console.log("processNetworkType Remote enabled: " + enabled);
								if(enabled) {
									isRemoteEnabled=true;
									nativeUtilPlugin.execute(
											function(reqd){
												console.log("IS_CURR_NTW_DIFF_FROM_SETUP reqd: "+reqd);
												if(reqd){
													indexAux.remoteSuccessAfterSetup();
												}else{
													indexAux.smartSetUpFlowLocalRegistration();
												}
											},
											indexAux.reportError,
											actions.IS_CURR_NTW_DIFF_FROM_SETUP,
											[]
									);
								} else {
									nativeUtilPlugin.execute(
											function(reqd){
												console.log("IS_CURR_NTW_DIFF_FROM_SETUP reqd: "+reqd);
												if(reqd){
													window.sessionStorage.setItem(sessionStore.NETWORK_TYPE, networkType.REMOTE_WIFI);
													indexAux.smartSetUpFlowRemoteRegistration();
												}else{
													indexAux.smartSetUpFlowLocalRegistration();
												}
											},
											indexAux.reportError,
											actions.IS_CURR_NTW_DIFF_FROM_SETUP,
											[]
									);
								}
							},
							indexAux.reportError,
							actions.PREF_IS_REMOTE_ENABLED,
							[]
					);
				} else {
					devicePlugin.execute(
							function(deviceCount){
								wemoUtil.infoLog(indexAux.TAG,"START_DISCOVERY function is called :: " + deviceCount);
								nativeUtilPlugin.execute(
										function(isPending){
											wemoUtil.infoLog(indexAux.TAG,"PREF_GET_GET_STARTED_NEEDED :: isPending::" + isPending);
											if(isPending){
													wemoUtil.infoLog(indexAux.TAG,"smartcache is disabled" + deviceCount);
													if(deviceCount>0){
														nativeUtilPlugin.execute(null,indexAux.reportError,actions.PREF_SET_GET_STARTED_NEEDED,[false]);
														nativeUtilPlugin.execute(
																indexAux.loadDeviceListPage,
																indexAux.reportError,
																actions.DB_UPDATE_ON_CHANGE_NETWORK,
																[]);
													}else{
														indexAux.loadGetStartedPage();
													}
											}else{
												nativeUtilPlugin.execute(
														indexAux.loadDeviceListPage,
														indexAux.reportError,
														actions.DB_UPDATE_ON_CHANGE_NETWORK,
														[]
												);
											}
										},
										indexAux.reportError,
										actions.PREF_GET_GET_STARTED_NEEDED,
										[]
								);
							},
							indexAux.reportError,
							actions.START_DISCOVERY,[]);
				}

				break;
			case networkType.REMOTE_WIFI:
				window.sessionStorage.setItem(sessionStore.REMOTE_MODE, true);
				if (smartGoing=="1"||superSmartGoing=="1") {
					nativeUtilPlugin.execute(
							function(enabled){
								console.log("processNetworkType Remote enabled: " + enabled);
								if(enabled){
									isRemoteEnabled=true;
									indexAux.remoteSuccessAfterSetup();
								}else{
									nativeUtilPlugin.execute(
											function(reqd){
												console.log("IS_CURR_NTW_DIFF_FROM_SETUP reqd: "+reqd);
												if(reqd){
													indexAux.smartSetUpFlowRemoteRegistration();
												}else{
													indexAux.smartSetUpFlowLocalRegistration();
												}
											},
											indexAux.reportError,
											actions.IS_CURR_NTW_DIFF_FROM_SETUP,
											[]
									);
								}
							},
							indexAux.reportError,
							actions.PREF_IS_REMOTE_ENABLED,
							[]
					);

				}
				else
				{
					nativeUtilPlugin.execute(null,indexAux.reportError,actions.PREF_SET_GET_STARTED_NEEDED,[false]);
					nativeUtilPlugin.execute(
							wemoUtil.cloudAvailability(),
							indexAux.reportError,
							actions.DB_UPDATE_ON_CHANGE_NETWORK,
							[]
					);
				}
				break;
			case networkType.REMOTE_MOBILE:
				if (smartGoing=="1"||superSmartGoing=="1") {
					window.sessionStorage.setItem(sessionStore.REMOTE_MODE, true);
					
					nativeUtilPlugin.execute(
							function(enabled){
								console.log("processNetworkType Remote enabled: " + enabled);
								if(enabled){
									isRemoteEnabled=true;
									indexAux.smartSetupSuccess("",wemo.items['SetupSuccessRemoteMobileContent']);
								}else{
									console.log("processNetworkType Load Remote Not Available Page");
									indexAux.remoteFailConnectedTo3G();
									//index.smartSetUpFlowRemoteRegistration();
								}
							},
							indexAux.reportError,
							actions.PREF_IS_REMOTE_ENABLED,
							[]
					);
				}
				else
				{
					nativeUtilPlugin.execute(
							function(isPending){
								if(isPending){
									window.sessionStorage.setItem(sessionStore.REMOTE_MODE, true);
									indexAux.loadGetStartedPage();
								}else{
									nativeUtilPlugin.execute(
											function(enabled){
												wemoUtil.infoLog(indexAux.TAG, 'Remote enabled: ' + enabled);
												if(enabled){
													window.sessionStorage.setItem(sessionStore.REMOTE_MODE, true);
													nativeUtilPlugin.execute(
															wemoUtil.cloudAvailability(),
															indexAux.reportError,
															actions.DB_UPDATE_ON_CHANGE_NETWORK,
															[]
													);
												}else{
													window.sessionStorage.setItem("noWifiPageMsg", wemo.items["noRemoteAccessMode"]);
													indexAux.loadNoNetworkPage();
												}
											},
											indexAux.reportError,
											actions.PREF_IS_REMOTE_ENABLED,
											[]
									);
								}

							},
							indexAux.reportError,
							actions.PREF_GET_GET_STARTED_NEEDED,
							[]
					);
				}



				break;
			case networkType.WEMO:
				wemoUtil.infoLog(indexAux.TAG, 'Connected to WeMo ');
				var personalizeFlag = window.sessionStorage.getItem(sessionStore.EDIT_DETAILS_DONE);
				if(!personalizeFlag){
				  $('#status_holder').html(wemo.items['OpenningConnection']);
				}
				indexAux.getPluginDetails();
				break;
				/*
				 * If Net Cam is selected in Wifi setting, in that case user has to redirect to.
				 * Net Cam slide show called - 'netCam/show_me_how.html'
				 * */
			case networkType.NET_CAM:
				//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
				$('.loading_spinner_splash').hide();
				wemoUtil.loadUrl(filePath.NET_CAME_DEMO);
				break;

			case networkType.NO_NETWORK:
				wemoUtil.infoLog(indexAux.TAG, 'No Network ');
				cordova.exec(null, null, plugins.NETWORK_MANAGER_PLUGIN, actions.GET_CONNECTION_STATUS, []);
				break;

			default:
				wemoUtil.infoLog(indexAux.TAG, 'Not supported ');
			return;
			break;
			}
		},

		getPluginDetails : function() {
			wemoUtil.infoLog(indexAux.TAG, 'getPluginDetails');
			setupPlugin.execute(function() {	
				setTimeout(
						setupPlugin.execute(
								indexAux.processPluginDetails,
								indexAux.reportError,
								ACTION_SETUP_DEVICE_DETAILS,
								[]
						),200
				);
				
			}, null, ACTION_SETUP_RECREATE_CONTROL_POINT, []);
			
		},

		processPluginDetails : function(plugin_details){
        	wemoUtil.infoLog(indexAux.TAG, 'processPluginDetails:  '+JSON.stringify(plugin_details));
			var sessionSSID=window.sessionStorage.getItem(sessionStore.SMART_SETUP_SSID);
			var smartGoing=window.sessionStorage.getItem(sessionStore.SMART_SETUP_ONGOING);
			var superSmartGoing=window.sessionStorage.getItem(sessionStore.SUPER_SMART_SETUP_ONGOING);
			wemoUtil.infoLog(indexAux.TAG, 'processPluginDetails sessionSSID: '+sessionSSID+' connected wemo: '+plugin_details[0]+ ' smartGoing: '+smartGoing+" superSmartGoing: "+superSmartGoing);
			if(sessionSSID == null){
				sessionSSID = plugin_details[0];
			}
			if (smartGoing=="1" && sessionSSID!=="" && sessionSSID!==plugin_details[0]) {
				//status holder message
				//alert popup
				indexAux.remoteFailConnectedToAnotherWemo();
				return;
			}
			window.sessionStorage.setItem('device_SSID', plugin_details[0]);

			wemoUtil.infoLog(indexAux.TAG, 'ssid: ' + plugin_details[0]);
			wemoUtil.infoLog(indexAux.TAG, 'device type: ' + plugin_details[1]);
            wemoUtil.infoLog(indexAux.TAG, 'Smart SetUp: ' + plugin_details[2] +"  smart setup or not ::   " + (plugin_details[2] == sessionStore.SMART_SETUP));
            wemoUtil.infoLog(indexAux.TAG, 'friendlyName: ' + plugin_details[3]);
            wemoUtil.infoLog(indexAux.TAG, 'brand name: ' + plugin_details[4]);
            wemoUtil.infoLog(indexAux.TAG, 'icon url: ' + plugin_details[5]);
            wemoUtil.infoLog(indexAux.TAG, 'device udn: ' + plugin_details[6]);

            window.sessionStorage.setItem("custom_icon_url", plugin_details[5]);
            window.sessionStorage.setItem("device_udn", plugin_details[6]);

			var friendlyName= plugin_details[3];
			var brandName = plugin_details[4];

			if(plugin_details[2]==sessionStore.SUPER_SMART_SETUP)
			{
				window.sessionStorage.setItem(sessionStore.SUPER_SMART_SETUP, "1");
				window.sessionStorage.setItem(sessionStore.SMART_SETUP_SSID, plugin_details[0]);
			}
			else if(plugin_details[2]==sessionStore.SMART_SETUP)
			{
				window.sessionStorage.setItem(sessionStore.SMART_SETUP, "1");
				window.sessionStorage.setItem(sessionStore.SMART_SETUP_SSID, plugin_details[0]);
			}
			else
			{
				window.sessionStorage.setItem(sessionStore.SMART_SETUP, "0");
				window.sessionStorage.setItem(sessionStore.SUPER_SMART_SETUP, "0");
			}
			if(plugin_details[1] === null ||  plugin_details[1] === ""){
				//redirect to static page
				//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
				$('.loading_spinner_splash').hide();
				wemoUtil.loadUrl(filePath.NO_WEMO);

			}else{
				if (plugin_details[1] === DEVICE_TYPE_DIMMER) {
					window.sessionStorage.setItem("device_type", wemoDimmer.NAME);
					window.sessionStorage.setItem("type", wemoDimmer.TYPE);
					if(friendlyName==null||friendlyName=="")
						window.sessionStorage.setItem("device_friendly_name", wemo.items[wemoDimmer.NAME]);
					else
						window.sessionStorage.setItem("device_friendly_name", friendlyName);

					window.sessionStorage.setItem("device_img_url", wemoDimmer.ICON);
					window.sessionStorage.setItem("device_thumb_url", wemoDimmer.ICON);
					window.sessionStorage.setItem("device_thumb_default_url", wemoDimmer.ICON);
					window.sessionStorage.setItem("SETUP_TITLE", wemoDimmer.SETUP_TITLE);
					window.sessionStorage.setItem("SETUP_SUCCESS_MESSAGE", wemoDimmer.SETUP_SUCCESS_MESSAGE);
				}
				else if (plugin_details[1] === DEVICE_TYPE_SENSOR) {
					window.sessionStorage.setItem("device_type", wemoSensor.NAME);
					window.sessionStorage.setItem("type", wemoSensor.TYPE);
					if(friendlyName==null||friendlyName=="")
						window.sessionStorage.setItem("device_friendly_name", wemo.items[wemoSensor.NAME]);
					else
						window.sessionStorage.setItem("device_friendly_name", friendlyName);
					
					window.sessionStorage.setItem("device_img_url", SENSOR_IMG_URL);
					window.sessionStorage.setItem("device_thumb_url", SENSOR_THUMB_URL);
					window.sessionStorage.setItem("device_thumb_default_url", wemoSensor.ICON);
					window.sessionStorage.setItem("SETUP_TITLE", wemoSensor.SETUP_TITLE);
					window.sessionStorage.setItem("SETUP_SUCCESS_MESSAGE", wemoSensor.SETUP_SUCCESS_MESSAGE);

				} else if (plugin_details[1] === DEVICE_TYPE_SWITCH) {
					window.sessionStorage.setItem("device_type", wemoSwitch.NAME);
					window.sessionStorage.setItem("type", wemoSwitch.TYPE);
					if(friendlyName==null||friendlyName=="") {
						window.sessionStorage.setItem("device_friendly_name", wemo.items[wemoSwitch.NAME]);
					}
					else {
						window.sessionStorage.setItem("device_friendly_name", friendlyName);
					}
					
					if(plugin_details[0].toLowerCase().indexOf('mini') > -1 || plugin_details[0].toLowerCase().indexOf('switchv2') > -1 ){
						window.sessionStorage.setItem("device_img_url", MINI_IMG_URL);
						window.sessionStorage.setItem("device_thumb_url", wemoMini.ICON);
						window.sessionStorage.setItem("device_thumb_default_url", wemoMini.ICON);
					} else {
						window.sessionStorage.setItem("device_img_url", SWITCH_IMG_URL);
						window.sessionStorage.setItem("device_thumb_url", wemoSwitch.ICON);
						window.sessionStorage.setItem("device_thumb_default_url", wemoSwitch.ICON);
					}
					window.sessionStorage.setItem("SETUP_TITLE", wemoSwitch.SETUP_TITLE);
					window.sessionStorage.setItem("SETUP_SUCCESS_MESSAGE", wemoSwitch.SETUP_SUCCESS_MESSAGE);
				}else if (plugin_details[1] === wemoLightSwitch.TYPE) {
					wemoUtil.infoLog(indexAux.TAG, wemoLightSwitch.NAME);
					window.sessionStorage.setItem("device_type", wemoLightSwitch.NAME);
					window.sessionStorage.setItem("type", wemoLightSwitch.TYPE);
					if(friendlyName==null||friendlyName=="")
						window.sessionStorage.setItem("device_friendly_name", wemo.items[wemoLightSwitch.NAME]);
					else
						window.sessionStorage.setItem("device_friendly_name", friendlyName);
					window.sessionStorage.setItem("device_thumb_url", wemoLightSwitch.ICON);
					window.sessionStorage.setItem("device_thumb_default_url", wemoLightSwitch.ICON);
					window.sessionStorage.setItem("SETUP_TITLE", wemoLightSwitch.SETUP_TITLE);
					window.sessionStorage.setItem("SETUP_SUCCESS_MESSAGE", wemoLightSwitch.SETUP_SUCCESS_MESSAGE);
				}else if (plugin_details[1] === DEVICE_TYPE_INSIGHT || plugin_details[1] === wemoInsight.TYPE) {
					window.sessionStorage.setItem("device_type", wemoInsight.NAME);
					window.sessionStorage.setItem("type", wemoInsight.TYPE);
					if(friendlyName==null||friendlyName=="")
						window.sessionStorage.setItem("device_friendly_name", wemo.items[wemoInsight.NAME]);
					else
						window.sessionStorage.setItem("device_friendly_name", friendlyName);
					window.sessionStorage.setItem("device_img_url", INSIGHT_IMG_URL);
					window.sessionStorage.setItem("device_thumb_url", wemoInsight.ICON);
					window.sessionStorage.setItem("device_thumb_default_url", INSIGHT_THUMB_URL);
					window.sessionStorage.setItem("SETUP_TITLE", wemoInsight.SETUP_TITLE);
					window.sessionStorage.setItem("SETUP_SUCCESS_MESSAGE", wemoInsight.SETUP_SUCCESS_MESSAGE);

            }else if(plugin_details[1].toLowerCase() === DEVICE_TYPE_SLOWCOOKER.toLowerCase()){
                wemoUtil.infoLog(indexAux.TAG, "SlowCooker:  "+DEVICE_TYPE_SLOWCOOKER);
	            window.sessionStorage.setItem("device_type", wemoSlowCooker.NAME);
	            window.sessionStorage.setItem("type", wemoSlowCooker.TYPE);
	            //window.sessionStorage.setItem("device_friendly_name", wemo.items[wemoSlowCooker.NAME]);
                //  TODO - After erasing all content and wi-fi setting, while paring success setup should show
                //         customized friendly name. Java have to send the 4th parameter as friendly name
                //         which was stored in Firmware.
	            
	            // the 4th parameter is stored in friendlyName above and if friendlyName is null then default Name can be saved
	            // as it is done for other products
	            if(friendlyName==null||friendlyName=="")
					window.sessionStorage.setItem("device_friendly_name", wemo.items[wemoSlowCooker.NAME]);
				else
					window.sessionStorage.setItem("device_friendly_name", friendlyName);
                window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME, plugin_details[3]);
	            window.sessionStorage.setItem("device_brand_name", brandName);
	            window.sessionStorage.setItem("device_thumb_url", wemoSlowCooker.ICON);
	            window.sessionStorage.setItem("device_thumb_default_url", wemoSlowCooker.ICON);
	            window.sessionStorage.setItem("SETUP_TITLE", wemoSlowCooker.SETUP_TITLE);
	            window.sessionStorage.setItem("SETUP_SUCCESS_MESSAGE", wemoSlowCooker.SETUP_SUCCESS_MESSAGE);
            }else if (plugin_details[1] === DEVICE_TYPE_MAKER) {
				window.sessionStorage.setItem("device_type", wemoMaker.NAME);
				window.sessionStorage.setItem("type", wemoMaker.TYPE);
				if(friendlyName==null||friendlyName=="")
				window.sessionStorage.setItem("device_friendly_name", wemo.items[wemoMaker.NAME]);
				else
					window.sessionStorage.setItem("device_friendly_name", friendlyName);
				window.sessionStorage.setItem("device_img_url", MAKER_IMG_URL);
				window.sessionStorage.setItem("device_thumb_url", wemoMaker.ICON);
				window.sessionStorage.setItem("device_thumb_default_url", wemoMaker.ICON);
				window.sessionStorage.setItem("SETUP_TITLE", wemoMaker.SETUP_TITLE);
				window.sessionStorage.setItem("SETUP_SUCCESS_MESSAGE", wemoMaker.SETUP_SUCCESS_MESSAGE);
				
            }else if(plugin_details[1].toLowerCase() === DEVICE_TYPE_COFFEEMAKER.toLowerCase()){
                wemoUtil.infoLog(indexAux.TAG, DEVICE_TYPE_COFFEEMAKER);
                window.sessionStorage.setItem("device_type", wemoCoffeeMaker.NAME);
                window.sessionStorage.setItem("type", wemoCoffeeMaker.TYPE);
                if(friendlyName === 'CoffeeMaker'){
                	window.sessionStorage.setItem("device_friendly_name", wemo.items[wemoCoffeeMaker.NAME]);
                }else{
                	window.sessionStorage.setItem("device_friendly_name", friendlyName);
                }                 
                window.sessionStorage.setItem("device_brand_name", brandName);
                window.sessionStorage.setItem("device_thumb_url", wemoCoffeeMaker.ICON);
                window.sessionStorage.setItem("device_thumb_default_url", wemoCoffeeMaker.ICON);
                window.sessionStorage.setItem("SETUP_TITLE", wemoCoffeeMaker.SETUP_TITLE);
                window.sessionStorage.setItem("SETUP_SUCCESS_MESSAGE", wemoCoffeeMaker.SETUP_SUCCESS_MESSAGE);

			}else if(plugin_details[1].toLowerCase() === DEVICE_TYPE_HEATERA.toLowerCase()){
                wemoUtil.infoLog(indexAux.TAG, DEVICE_TYPE_HEATERA );
                window.sessionStorage.setItem("device_type", wemoHeaterA.NAME);
                if(friendlyName === 'HeaterA'){
                	window.sessionStorage.setItem("device_friendly_name", wemo.items[wemoHeaterA.NAME]);
                }else{
                	window.sessionStorage.setItem("device_friendly_name", friendlyName);
                }                   
                window.sessionStorage.setItem("device_brand_name", brandName);
                window.sessionStorage.setItem("device_thumb_url", wemoHeaterA.ICON);
                window.sessionStorage.setItem("device_thumb_default_url", wemoHeaterA.ICON);
                window.sessionStorage.setItem("SETUP_TITLE", wemoHeaterA.SETUP_TITLE);
                window.sessionStorage.setItem("SETUP_SUCCESS_MESSAGE", wemoHeaterA.SETUP_SUCCESS_MESSAGE);
                window.sessionStorage.setItem("type", wemoHeaterA.TYPE);
                
			}else if(plugin_details[1].toLowerCase() === DEVICE_TYPE_HEATERB.toLowerCase()){
                wemoUtil.infoLog(indexAux.TAG, DEVICE_TYPE_HEATERB );
                window.sessionStorage.setItem("device_type", wemoHeaterB.NAME);
                if(friendlyName === 'HeaterB'){
                    window.sessionStorage.setItem("device_friendly_name", wemo.items[wemoHeaterB.NAME]);
                }else{
                	window.sessionStorage.setItem("device_friendly_name", friendlyName);
                }   
                window.sessionStorage.setItem("device_brand_name", brandName);
                window.sessionStorage.setItem("device_thumb_url", wemoHeaterB.ICON);
                window.sessionStorage.setItem("device_thumb_default_url", wemoHeaterB.ICON);
                window.sessionStorage.setItem("SETUP_TITLE", wemoHeaterB.SETUP_TITLE);
                window.sessionStorage.setItem("SETUP_SUCCESS_MESSAGE", wemoHeaterB.SETUP_SUCCESS_MESSAGE);
                window.sessionStorage.setItem("type", wemoHeaterB.TYPE);
              
			}else if(plugin_details[1].toLowerCase() === DEVICE_TYPE_AIRPURIFIER.toLowerCase()){
                wemoUtil.infoLog(indexAux.TAG, DEVICE_TYPE_AIRPURIFIER);
                window.sessionStorage.setItem("device_type", wemoAirPurifier.NAME);
                if(friendlyName === 'AirPurifier'){
                	window.sessionStorage.setItem("device_friendly_name", wemo.items[wemoAirPurifier.NAME]);
                }else{
                	window.sessionStorage.setItem("device_friendly_name", friendlyName);
                }   
                window.sessionStorage.setItem("device_brand_name", brandName);
                window.sessionStorage.setItem("device_thumb_url", wemoAirPurifier.ICON);
                window.sessionStorage.setItem("device_thumb_default_url", wemoAirPurifier.ICON);
                window.sessionStorage.setItem("SETUP_TITLE", wemoAirPurifier.SETUP_TITLE);
                window.sessionStorage.setItem("SETUP_SUCCESS_MESSAGE", wemoAirPurifier.SETUP_SUCCESS_MESSAGE);
                window.sessionStorage.setItem("type", wemoAirPurifier.TYPE);
                
			}else if(plugin_details[1].toLowerCase() === DEVICE_TYPE_HUMIDIFIER.toLowerCase()){
                wemoUtil.infoLog(indexAux.TAG, DEVICE_TYPE_HUMIDIFIER);
                window.sessionStorage.setItem("device_type", wemoHumidifier.NAME);
                if(friendlyName === 'Humidifier'){
                	window.sessionStorage.setItem("device_friendly_name", wemo.items[wemoHumidifier.NAME]);
                }else{
                	window.sessionStorage.setItem("device_friendly_name", friendlyName);
                }                
                window.sessionStorage.setItem("device_brand_name", brandName);
                window.sessionStorage.setItem("device_thumb_url", wemoHumidifier.ICON);
                window.sessionStorage.setItem("device_thumb_default_url", wemoHumidifier.ICON);
                window.sessionStorage.setItem("SETUP_TITLE", wemoHumidifier.SETUP_TITLE);
                window.sessionStorage.setItem("SETUP_SUCCESS_MESSAGE", wemoHumidifier.SETUP_SUCCESS_MESSAGE);
                window.sessionStorage.setItem("type", wemoHumidifier.TYPE);
                
			}else if(plugin_details[1].toLowerCase() === DEVICE_TYPE_HUMIDIFIERB.toLowerCase()){
                wemoUtil.infoLog(indexAux.TAG, DEVICE_TYPE_HUMIDIFIERB);
                window.sessionStorage.setItem("device_type", wemoHumidifierB.NAME);
                if(friendlyName === wemoHumidifierB.REMOTE_TYPE){
                	window.sessionStorage.setItem("device_friendly_name", wemo.items[wemoHumidifierB.NAME]);
                }else{
                	window.sessionStorage.setItem("device_friendly_name", friendlyName);
                }                
                window.sessionStorage.setItem("device_brand_name", brandName);
                window.sessionStorage.setItem("device_thumb_url", wemoHumidifierB.ICON);
                window.sessionStorage.setItem("device_thumb_default_url", wemoHumidifierB.ICON);
                window.sessionStorage.setItem("SETUP_TITLE", wemoHumidifierB.SETUP_TITLE);
                window.sessionStorage.setItem("SETUP_SUCCESS_MESSAGE", wemoHumidifierB.SETUP_SUCCESS_MESSAGE);
                window.sessionStorage.setItem("type", wemoHumidifierB.TYPE);
                
			}else if (plugin_details[1] === DEVICE_TYPE_BRIDGE) {
				wemoUtil.infoLog(indexAux.TAG,"entering in wemo bridge");
				wemoUtil.infoLog(indexAux.TAG,"Name******"+wemoLed.NAME);
                window.sessionStorage.setItem("device_type", wemoLed.NAME);
                window.sessionStorage.setItem("type", wemoLed.TYPE);
                window.sessionStorage.setItem("device_friendly_name", wemo.items[wemoLed.NAME]);
                window.sessionStorage.setItem("device_img_url", LED_IMG_URL);
                window.sessionStorage.setItem("device_thumb_url", LED_THUMB_URL);
                window.sessionStorage.setItem("device_thumb_default_url", LED_THUMB_URL);
                window.sessionStorage.setItem("SETUP_TITLE", wemoLed.SETUP_TITLE);
                window.sessionStorage.setItem("SETUP_SUCCESS_MESSAGE", wemoLed.SETUP_SUCCESS_MESSAGE);
            }
				// XXX Backword compatibility of smart setup with old firmware case
				
				wemoUtil.infoLog(indexAux.TAG, "EDIT_DETAILS_DONE Session Store value:" + window.sessionStorage.getItem(sessionStore.EDIT_DETAILS_DONE));
				if(window.sessionStorage.getItem(sessionStore.SUPER_SMART_SETUP)=="0"||window.sessionStorage.getItem(sessionStore.SMART_SETUP)=="0" || window.sessionStorage.getItem(sessionStore.EDIT_DETAILS_DONE)==stringBoolean.TRUE)
				{
					indexAux.getConfigStatus(plugin_details);            
				} 
				else 
				{
					var deviceType = window.sessionStorage.getItem('device_SSID');
					var searchType1 = deviceType.search("Bridge");
                    var searchType2 = deviceType.search("Link");

                    wemoUtil.infoLog(indexAux.TAG, "entering in plugindetails "+deviceType+"---"+searchType1+"--"+searchType2);
					
					if(searchType1 != -1 || searchType1 == true || searchType2 != -1 || searchType2 == true)
					{
						indexAux.loadSetupBridgePage();	
					}
					else
					{
						if ($.inArray("HeaterA", plugin_details) > -1 || $.inArray("HeaterB", plugin_details) > -1) {
							indexAux.loadEulaPage();
						} else {
							indexAux.loadEditDeviceDetailsPage();
						}
					}
				}
			}        

		},

        setConfigStatus : function () {
            var toRememberWiFiSetting = window.localStorage.getItem(localStorageKeys.REMEMBER_WIFI_SETTINGS);
            wemoUtil.infoLog(indexAux.TAG, "toRememberWiFiSetting: " + toRememberWiFiSetting);
            if(!(toRememberWiFiSetting === undefined || toRememberWiFiSetting === null || toRememberWiFiSetting.length === 0)) {
                setupPlugin.execute(null, indexAux.reportError, ACTION_SET_CONFIG_STATUS, [toRememberWiFiSetting]);
                window.localStorage.removeItem(localStorageKeys.REMEMBER_WIFI_SETTINGS);
            }
        },
    
		getConfigStatus : function(plugin_details){
			wemoUtil.infoLog(indexAux.TAG, "getting wemo config status");
			setupPlugin.execute(
					function(status){
						wemoUtil.infoLog(indexAux.TAG, "ACTION_GET_CONFIG_STATUS success callback " + status);
						window.sessionStorage.setItem(CONNECT_TO_DEFAULT_ROUTER, status);
						if(status == "true"){
							var deviceType = window.sessionStorage.getItem('device_SSID');
							var searchType1 = deviceType.search("Bridge");
		                    var searchType2 = deviceType.search("Link");
		                    
		                    if(searchType1 != -1 || searchType1 == true || searchType2 != -1 || searchType2 == true)
		                    {
		                    	indexAux.getBridgeInfo(plugin_details);
		                    	storePlugindetails = plugin_details;
		                    }
		                    else
		                    {
		                    	$('#status_holder').html(wemo.items['AppStatusLookingForHomeNetwork']);

								setTimeout(
										function(){
											indexAux.autoPairing(plugin_details);
										},
										500
								);
		                    }
	 	                	
							//auto connect
							
						}else{
							//Manual Connect
							indexAux.manualPairing(plugin_details);
						}
                        indexAux.setConfigStatus();
					},
					function(){
						//Manual Connect
						indexAux.manualPairing(plugin_details);
                        indexAux.setConfigStatus();
					},
					ACTION_GET_CONFIG_STATUS,
					[]
			);
		},

		autoPairing : function(plugin_details){
			wemoUtil.infoLog(indexAux.TAG, "autoPairing");
			$('#status_holder').text(wemo.items['AppStatusConnectingHomeNetwork']);

			previousMessage = $('#status_holder').text();
			indexAux.setUpMessaging();
			indexAux.registerSetupListeners(); 
			if(window.sessionStorage.getItem(sessionStore.SUPER_SMART_SETUP)=="1"){
				window.sessionStorage.setItem(sessionStore.SUPER_SMART_SETUP_ONGOING, "1");
			}
			else if(window.sessionStorage.getItem(sessionStore.SMART_SETUP)=="1"){
				window.sessionStorage.setItem(sessionStore.SMART_SETUP_ONGOING, "1");
			}
			setTimeout(
					function(){
						setupPlugin.execute(
								function(array){
									wemoUtil.infoLog(TAG,'auto connect array: ' + JSON.stringify(array));
									window.sessionStorage.setItem('sec_ssid', array[1]);
									setTimeout(function(){
										indexAux.processConnectionStatus(array[0]);
									}, timeout.MEDIUM);
								},
								function(){
									//Manual Connect
									console.log("Messaging:  Error - ManualParing");
									indexAux.manualPairing(plugin_details)
								},
								ACTION_CONNECT_TO_DEFAULT_ROUTER,
								[window.sessionStorage.getItem('device_SSID')]
						);
					},
					timeout.LONG
			);
		},

		manualPairing : function(plugin_details){
			wemoUtil.infoLog(indexAux.TAG, "manualPairing");
			$('#status_holder').html(wemo.items['AppStatusDiscoveringNetworks']);

			previousMessage = $('#status_holder').text();
			indexAux.setUpMessaging();
			//index.registerSetupListeners();  
			setTimeout(function(){
				setupPlugin.execute(
						indexAux.openSetupWifi,
						indexAux.reportError,
						ACTION_GET_WIFI_AP_LIST,
						[]
				);
			},
			timeout.LONG);
		},

		openSetupWifi : function(aplist){
			wemoUtil.infoLog(indexAux.TAG, "aplist length: "+ aplist.length);
			wemoUtil.infoLog(indexAux.TAG, "items: "+ JSON.stringify(aplist));

			window.sessionStorage.setItem(sessionStore.AP_LIST, JSON.stringify(aplist));
			//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
			$('.loading_spinner_splash').hide();
			wemoUtil.loadUrl(filePath.DEVICE_WIFI_LIST);

		},

		manualConnect : function(){
			wemoUtil.infoLog(indexAux.TAG, "manualConnect");

			indexAux.registerSetupListeners();  
			//following fixed half screen going blank issue, particularly 4.3 version
			setTimeout( function(){
				$('#status_holder').html(wemo.items['AppStatusConnectingHomeNetwork']);
				console.log("Messaging: #status_holder 4 - "+$('#status_holder').text());
				previousMessage = $('#status_holder').text();
				indexAux.setUpMessaging();
			}, timeout.MEDIUM);

			setTimeout( function(){
				var security = sessionStorage.getItem("sec_securitystrength");
				var values = security.split('/');

				passwordArray = [];//Password Array order should not be changed
				passwordArray.push(sessionStorage.getItem("sec_ssid"));//ssid
				passwordArray.push(values[0]);//auth
				passwordArray.push(sessionStorage.getItem("sec_password"));//password
				passwordArray.push(values[1]);//encrypt
				passwordArray.push(sessionStorage.getItem("sec_channel"));//channel
				passwordArray.push(window.sessionStorage.getItem('device_SSID'));//wemo device ssid

				if(window.sessionStorage.getItem(sessionStore.SUPER_SMART_SETUP)=="1"){
					window.sessionStorage.setItem(sessionStore.SUPER_SMART_SETUP_ONGOING, "1");
				} else if(window.sessionStorage.getItem(sessionStore.SMART_SETUP)=="1"){
					window.sessionStorage.setItem(sessionStore.SMART_SETUP_ONGOING, "1");
				}
				setupPlugin.execute(
						indexAux.processConnectionStatus,
						indexAux.reportError,
						ACTION_POST_AP_PASSWORD_DATA,
						passwordArray
				);
			}, timeout.ONE_SECOND);
		},

		processConnectionStatus : function(status){
			indexAux.showConnectedTo();
			var smart=window.sessionStorage.getItem(sessionStore.SMART_SETUP);
			var superSmart=window.sessionStorage.getItem(sessionStore.SUPER_SMART_SETUP);
			var supersmartongoing = window.sessionStorage.getItem(sessionStore.SUPER_SMART_SETUP_ONGOING);
			wemoUtil.infoLog(indexAux.TAG, "processConnectionStatus Process connection status: " + status+" smart: "+smart+" superSmart: "+superSmart + "supersmartongoing" +supersmartongoing);
			
			var deviceType = window.sessionStorage.getItem('device_SSID');
			var searchType1 = deviceType.search("Bridge");
            var searchType2 = deviceType.search("Link");
            
			console.log("entering in processconnection "+deviceType+"---"+searchType1+"---"+searchType2);
			wemoUtil.infoLog(indexAux.TAG, "Process connection status:" + status);
			var ssid = window.sessionStorage.getItem("sec_ssid");
			wemoUtil.infoLog(indexAux.TAG, "home ssid to set:" + ssid);
		
			if((status === "1" || status === "3") && (smart!=="1")){
				wemoUtil.infoLog(indexAux.TAG, "status returned is: 1, 3");
				$('#status_holder').html(wemo.items['AppStatusEnablingRemoteAccees']);
				console.log("Messaging: #status_holder 5 - "+$('#status_holder').text());
				var DefaultRouterStatus = sessionStorage.getItem(CONNECT_TO_DEFAULT_ROUTER);;
				console.log("DefaultRouterStatus********"+DefaultRouterStatus);

				if(DefaultRouterStatus === "true" && (searchType1 != -1 || searchType1 == true || searchType2 != -1 || searchType2 == true))
				{    
					indexAux.setBridgeInfo(deviceType);
						wemoUtil.infoLog(indexAux.TAG,"smartcache is disabled");
							deviceTabPlugin.execute(function (deviceList) {
			    			console.log("Socket & Sensor & Sort - JSON DATA: " + JSON.stringify(deviceList));
			    			console.log("Socket & Sensor & Sort - deviceList from java:  " + deviceList);
			    			console.log("Socket & Sensor & Sort - device list size: " + deviceList.length);  
			    			
					    			if(deviceList.length > 0)
					    			{
					    				indexAux.loadDeviceListPage();
					    			}
					    			else
					    			{
					    				console.log("checking GetEnd DEvices in Router else last");
				 	                	window.sessionStorage.removeItem(sessionStore.PAIRED_DEVICES);
				 	                	
				 	                	setupPlugin.execute(
				                                function(status){
				                                    wemoUtil.infoLog(indexAux.TAG, "remote enable success callback: " + status);
				                                    window.sessionStorage.setItem(sessionStore.SETUP_REMOTE_STATUS, status);
				                                    console.log("Messaging:  Clearing Interval!!!"+setupMessagesTimer);
				                                    clearInterval( setupMessagesTimer );	
				                                    indexAux.loadSetupBridgePage();	
				                                },
				                                indexAux.loadSetupBridgePage,
				                                ACTION_ENABLE_REMOTE_ACCESS,
				                                [ssid]
				                        );
				 	                	
					    				//index.loadSetupBridgePage();
					    			}
			    			
			    		}, indexAux.reportError, actions.GET_WEMO_DEVICE_LIST, []);
				}
				else
				{
					if(searchType1 != -1 || searchType1 == true || searchType2 != -1 || searchType2 == true){
						isLinkDevice = true;
					}
					
					setTimeout(
                        function(){
                            setupPlugin.execute(
                                function(status){
                                    wemoUtil.infoLog(indexAux.TAG, "remote enable success callback: " + status);
                                    window.sessionStorage.setItem(sessionStore.SETUP_REMOTE_STATUS, status);
                                    console.log("Messaging:  Clearing Interval!!!"+setupMessagesTimer);
                                    clearInterval( setupMessagesTimer );
                                    
                                    console.log("Device Type entering in else"+searchType1+"--"+searchType2);
                                    if(searchType1 != -1 || searchType1 == true || searchType2 != -1 || searchType2 == true)
                                    {
                                    	indexAux.setBridgeInfo(deviceType);
                                        console.log("ntering in else redirecting to bridge");
                                        window.sessionStorage.removeItem(sessionStore.PAIRED_DEVICES);
                                        indexAux.loadSetupBridgePage();
                                    }
                                    else
                                    {
                                    	indexAux.loadSetupSuccessfulPage();
                                    }
                                    
                                },
                                indexAux.errorResponse,
                                ACTION_ENABLE_REMOTE_ACCESS,
                                [ssid]
                            );
                        },
                        timeout.ENABLE_REMOTE_ACCESS_DELAY
                   );
				}

			} else if(status === "0" || status === "2" ){
				clearInterval(setupMessagesTimer);
				//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
				$('.loading_spinner_splash').hide();
				wemoUtil.infoLog(indexAux.TAG, "0, 2");
				indexAux.routerName.html(" '" + ssid + "' ");
				$("#setup_password_fail_popup").popup("open");
				//$("#router_name").text(window.sessionStorage.getItem('sec_ssid'));

			}else if(status === "4"){
				clearInterval(setupMessagesTimer);
				//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
				$('.loading_spinner_splash').hide();
				wemoUtil.infoLog(indexAux.TAG, "4");
				indexAux.routerName.html(" '" + ssid + "' ");
				$("#setup_password_fail_popup").popup("open");
				//$("#router_name").text(window.sessionStorage.getItem('sec_ssid'));
			}else if(status === "5"){
				//no wemo device
				//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
				$('.loading_spinner_splash').hide();
				wemoUtil.loadUrl(filePath.NO_WEMO);
			}
			else if (status != "5" && ((smart==="1")||(superSmart==="1"))){
				indexAux.getNetworkType();
			}
			
			//resetting the EditDetails(Personalize screen) session variable
	          window.sessionStorage.setItem(sessionStore.EDIT_DETAILS_DONE, stringBoolean.FALSE);
	          wemoUtil.infoLog(indexAux.TAG, "EDIT_DETAILS_DONE Session Store value after reset:" + window.sessionStorage.getItem(sessionStore.EDIT_DETAILS_DONE));
		},
		processConnectionStatusAfterSetup : function(status){

			wemoUtil.infoLog(indexAux.TAG, "processConnectionStatusAfterSetup Final Process connection status:" + status);
			var ssid = window.sessionStorage.getItem("sec_ssid");
			wemoUtil.infoLog(indexAux.TAG, "home ssid to set:" + ssid);
			window.sessionStorage.setItem(sessionStore.SETUP_REMOTE_STATUS, status);
			if(status === 'S')
			{
				indexAux.remoteSuccessAfterSetup();
			}
			else
			{
				indexAux.remoteFailLaterRetry();
			}
			
		},

		setUpSuccessFlow : function(){
			wemoUtil.infoLog(indexAux.TAG, 'Setup success flow');
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
				$( "#remote_status_popup" ).popup( "open" );
				window.sessionStorage.setItem("show_remote_alert", "false");
			}


			$('#remote_status_ok_btn, #remote_status_ok_btn_failure').on('click',function(){
				$( "#remote_status_popup" ).popup( "close" );
			});

			$('#remote_status_try_again_btn').on('pointerdown',function(){
				window.sessionStorage.setItem(sessionStore.STARTUP_MODE, startupMode.RETRY_REMOTE_ENABLE);
				wemoUtil.loadUrl(filePath.INDEX);
			});

			setTimeout(function() {
				// Close AP
				indexAux.closeAccessPoint();
			}, timeout.LONG);

		},
		remoteSuccessAfterSetupCheckNetwork : function(){
			nativeUtilPlugin.execute(
					function(type)
					{
						wemoUtil.infoLog(indexAux.TAG, 'remoteSuccessAfterSetupCheckNetwork before type: '+window.sessionStorage.getItem(sessionStore.NETWORK_TYPE)+' new type: '+type);
						window.sessionStorage.setItem(sessionStore.NETWORK_TYPE, type);
						indexAux.remoteSuccessAfterSetup();
					},
					indexAux.reportError,
					actions.GET_NETWORK_TYPE_NEW,
					[]
			);
		},
		remoteSuccessAfterSetup : function(){
			window.sessionStorage.setItem(sessionStore.SETUP_REMOTE_STATUS, 'S');
			window.sessionStorage.setItem(sessionStore.SMART_SETUP_ONGOING, "0");
			window.sessionStorage.setItem(sessionStore.SUPER_SMART_SETUP_ONGOING, "0");
			indexAux.hideConnectedTo();
			wemoUtil.infoLog(indexAux.TAG, 'remoteSuccessAfterSetup type: '+window.sessionStorage.getItem(sessionStore.NETWORK_TYPE));
			indexAux.smartSetupSuccess(wemo.items['EnableRemoteSuccessTitle'],wemo.items['EnableRemoteSuccessContent']);
		},
		smartSetupSuccess : function(header, message){
			wemoUtil.infoLog(indexAux.TAG, 'smartSetupSuccess header: '+header+' message: '+message);
			window.sessionStorage.setItem(sessionStore.SMART_SETUP_SSID, "");
			window.sessionStorage.setItem("initial_run", '0');
			window.sessionStorage.setItem("show_remote_alert", "false");
			//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
			$('.loading_spinner_splash').hide();
			clearInterval( setupMessagesTimer );
			$('#status_holder').html(message);
			if(header=="")
			{
				$('#status_holder_header').hide();
				$('#status_holder_img').hide();
				indexAux.processNetworkTypeAfterSetup(window.sessionStorage.getItem(sessionStore.NETWORK_TYPE));
			}
			else
			{
				indexAux.hideConnectedTo();
				window.sessionStorage.setItem("stop_ssid_msg", "0");
				$('#status_holder_img').html('<img src="img/ic_devicecheck_large.png"/>');
				$('#status_holder_img').show();
				$('#status_holder_header').html(header);
				setTimeout(function() {
					indexAux.processNetworkTypeAfterSetup(window.sessionStorage.getItem(sessionStore.NETWORK_TYPE));
				}, configValue.MESSAGE_SLEEP_INTV);
			}
			
		},
		remoteFail : function(message){
			indexAux.hideConnectedTo();
			window.sessionStorage.setItem(sessionStore.SMART_SETUP_SSID, "");
			wemoUtil.infoLog(indexAux.TAG, 'remoteFail message: '+message);
			//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
			$('.loading_spinner_splash').hide();
			if(message=="")
				message=wemo.items['errorRemoteAccessFailed'];
			$("#remote_setup_failure_footer,#remote_setup_success_footer").hide();
			$('#remote_status_header').hide();
			$('#remote_status_body').html(message);
			$( "#remote_status_popup" ).popup( "open" );
			window.sessionStorage.setItem("show_remote_alert", "false");
			clearInterval(setupMessagesTimer);
		},
		remoteFailLaterRetry : function(){
			wemoUtil.infoLog(indexAux.TAG, 'remoteFailLaterRetry');
			indexAux.remoteFail("");
			$("#remote_setup_failure_footer").show();
			$("#remote_status_header").show();
			$('#remote_status_header').html("Remote Access Enable");
			$('#remote_status_ok_btn, #remote_status_ok_btn_failure').on('click',function(){
				$( "#remote_status_popup" ).popup( "close" );
				//nativeUtilPlugin.execute(null,null,actions.SHOW_PROGRESS,[]);
				indexAux.processNetworkTypeAfterSetup(window.sessionStorage.getItem(sessionStore.NETWORK_TYPE));
			});

			$('#remote_status_try_again_btn').on('pointerdown',function(){
				if(window.sessionStorage.getItem(sessionStore.SUPER_SMART_SETUP)=="1"){
					$( "#remote_status_popup" ).popup( "close" );
					window.sessionStorage.setItem(sessionStore.SUPER_SMART_SETUP_ONGOING, "1");
					indexAux.processConnectionStatus('1');
					indexAux.setUpMessaging();
					//nativeUtilPlugin.execute(null,null,actions.SHOW_PROGRESS,[]);
					$('.loading_spinner_splash').show();
				}
				else if(window.sessionStorage.getItem(sessionStore.SMART_SETUP)=="1"){
					$( "#remote_status_popup" ).popup( "close" );
					window.sessionStorage.setItem(sessionStore.SMART_SETUP_ONGOING, "1");
					indexAux.processConnectionStatus('1');
					indexAux.setUpMessaging();
					//nativeUtilPlugin.execute(null,null,actions.SHOW_PROGRESS,[]);
					$('.loading_spinner_splash').show();
				}
				else
				{
					window.sessionStorage.setItem(sessionStore.STARTUP_MODE, startupMode.RETRY_REMOTE_ENABLE);
					wemoUtil.loadUrl(filePath.INDEX);
				}
			});
		},
		remoteFailOkAction : function(status, message){
			wemoUtil.infoLog(indexAux.TAG, 'remoteFailOkAction');
			indexAux.remoteFail(message);
			$("#remote_setup_success_footer").show();
			$('#status_holder').html(status);
			$('#remote_status_ok_btn, #remote_status_ok_btn_failure').on('click',function(){
				$( "#remote_status_popup" ).popup( "close" );
				//nativeUtilPlugin.execute(null,null,actions.SHOW_PROGRESS,[]);
				$('.loading_spinner_splash').show();
				indexAux.processNetworkTypeAfterSetup(window.sessionStorage.getItem(sessionStore.NETWORK_TYPE));
				console.log("remoteFailOkAction closing");
			});
		},
		remoteFailOkWithoutAction : function(status, message){
			wemoUtil.infoLog(indexAux.TAG, 'remoteFailOkWithoutAction');
			indexAux.remoteFail(message);
			$("#remote_setup_success_footer").show();
			$('#remote_status_ok_btn, #remote_status_ok_btn_failure').on('click',function(){
				$( "#remote_status_popup" ).popup( "close" );
				$('#status_holder').html(status);
				console.log("remoteFailOkWithoutAction closing");
			});
		},
		remoteFailNoAction : function(status, message){
			wemoUtil.infoLog(indexAux.TAG, 'remoteFailNoAction status: '+status);
			indexAux.hideConnectedTo();
			clearInterval(setupMessagesTimer);
			$('#status_holder').html(status);
			window.sessionStorage.setItem(sessionStore.SMART_SETUP_SSID, "");
			//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
			$('.loading_spinner_splash').hide();

			window.sessionStorage.setItem("show_remote_alert", "false");
		},

		encodeHTML: function(s) {
			return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&#x27;').replace(/\//g, '&#x2F;');
		},

		showConnectedToText : function(networkName){
			if(networkName === "Cellular"){
				networkName = wemo.items[networkName];
			}
			var networkNameParsed = indexAux.encodeHTML(networkName);
			wemoUtil.infoLog(indexAux.TAG, 'showConnectedToText networkName: '+ networkNameParsed);
			window.sessionStorage.setItem(sessionStore.NETWORK_NAME, networkNameParsed);
			if(networkNameParsed == "0x" || networkNameParsed == "No Network" || window.sessionStorage.getItem("stop_ssid_msg")==0)
				indexAux.hideConnectedTo();
			else{
			$('#connected_to_label').html(wemo.items['ConnectedTo']);
			$('#connected_to_value').html(networkNameParsed);
			$('#connected_to_label').show();
			$('#connected_to_value').show();
			}
		},
		hideConnectedTo : function(){
			wemoUtil.infoLog(indexAux.TAG, 'hideConnectedTo'); 
			$('#connected_to_label').hide();
			$('#connected_to_value').hide();
		},
		remoteFailInternetNotAvailable : function(){
			indexAux.remoteFailOkAction(wemo.items['SetupSuccessRemoteWifiContent'], wemo.items['errorInternetNotAvailable']);
		},
		remoteFailWemoDisconnected : function(){
			indexAux.remoteFailNoAction(wemo.items['AppStatusErrorDisconnectedFromWemo'], wemo.items['errorDisconnectedFromWemo']);
		},
		remoteFailConnectedToAnotherWemo : function(){
			indexAux.remoteFailNoAction(wemo.items['AppStatusErrorConnectedToAnotherWemo'], wemo.items['errorConnectedToAnotherWemo']);
		},
		remoteFailConnectedTo3G : function(){
			indexAux.remoteFailOkWithoutAction(wemo.items['AppStatusErrorConnectedTo3G'], wemo.items['errorConnectedTo3G']);
		},
		closeAccessPoint : function(){
			setupPlugin.execute(
					function(result) {
						console.log("Close AP success callback");
						setTimeout(function(){
							setupPlugin.execute(null, null, ACTION_STOP_UPNP_SERVICE, []);
							setTimeout(function(){
								//index.loadNoNetworkPage();
							}, timeout.SETUP_EXIT);
							indexAux.getNetworkTypeAfterSetup();
						}, timeout.AP_CLOSE);
					},
					indexAux.reportError,
					ACTION_CLOSE_ACCESS_POINT,
					[]
			);
		},

		getNetworkTypeAfterSetup : function(){
			wemoUtil.infoLog(indexAux.TAG, 'getNetworkTypeAfterSetup');
			nativeUtilPlugin.execute(
					indexAux.processNetworkTypeAfterSetup,
					indexAux.reportError,
					actions.GET_NETWORK_TYPE_NEW,
					[]
			);
		},

		processNetworkTypeAfterSetup : function(type){
			var smartSetupOngoing = window.sessionStorage.getItem(sessionStore.SUPER_SMART_SETUP_ONGOING);
			console.log("processNetworkTypeAfterSetup: " + type+" smart setup : "+(window.sessionStorage.getItem(sessionStore.SMART_SETUP))+" sgoing: "+(window.sessionStorage.getItem(sessionStore.SMART_SETUP_ONGOING))+" upnpInit: "+upnpInit+" ssgoing: "+(window.sessionStorage.getItem(sessionStore.SUPER_SMART_SETUP_ONGOING)));
			switch(type){
			case networkType.HOME_NETWORK:
				window.sessionStorage.setItem(sessionStore.REMOTE_MODE, false);
				devicePlugin.execute(null,indexAux.reportError,actions.INITIALIZE_UPNP,[]);
				
				var deviceType = window.sessionStorage.getItem('device_SSID');
				var searchType1 = deviceType.search("Bridge");
                var searchType2 = deviceType.search("Link");
				
				console.log("deviceType process "+deviceType+"--"+searchType1+"---"+searchType2);

				if(searchType1 != -1 || searchType1 == true || searchType2 != -1 || searchType2 == true)
				{
					var redirectParam = window.sessionStorage.getItem(sessionStore.BRIDE_SETUP_SUCCESS);
					redirectParam = $.trim(redirectParam);
					
					console.log("redirectParam "+redirectParam);
					
					if(redirectParam == "devicelist")
			        {
						indexAux.loadDeviceListPageAfterSetup();
			        }
			        else if(redirectParam == "editpage")
			        {
			        	indexAux.loadEditDevicePage();
			        }
			        else if(redirectParam == "homesensesuccessscreen")
			        {
			        	indexAux.loadHomeSenseSuccessPage();
			        }
			        else
			        {
			        	indexAux.loadDeviceListPageAfterSetup();
			        }
				}
				else
				{
					indexAux.loadDeviceListPageAfterSetup();
				}
				
				break;
			case networkType.REMOTE_WIFI:
				window.sessionStorage.setItem(sessionStore.REMOTE_MODE, true);
				indexAux.loadDeviceListPageAfterSetup();
				break;
			case networkType.REMOTE_MOBILE:
				console.log("REMOTE_MOBILE:  "+networkType.REMOTE_MOBILE);
				nativeUtilPlugin.execute(
						function(enabled){
							console.log("Remote enabled: " + enabled);
							if(enabled){
								console.log("Load Device List Page");
								window.sessionStorage.setItem(sessionStore.REMOTE_MODE, true);
								indexAux.loadDeviceListPageAfterSetup();
							}else{
								console.log("Load Remote Not Available Page");
								indexAux.loadRemoteNotAvailablePage();
							}
						},
						indexAux.reportError,
						actions.PREF_IS_REMOTE_ENABLED,
						[]
				);
				break;
			case networkType.WEMO:
				var deviceType = window.sessionStorage.getItem('device_SSID');
				var searchType1 = deviceType.search("Bridge");
                var searchType2 = deviceType.search("Link");
                var DefaultRouterStatus = sessionStorage.getItem(CONNECT_TO_DEFAULT_ROUTER);
                
				console.log("DefaultRouterStatus network fail********"+DefaultRouterStatus);
				console.log("deviceType process "+deviceType+"--"+searchType1+"---"+searchType2);

				if(searchType1 != -1 || searchType1 === true || searchType2 != -1 || searchType2 === true && multipleBridgeCounter > 0)
					indexAux.remoteFailConnectedToAnotherWemo();
				else
					indexAux.loadIndexPage();
				break;

			case networkType.NO_NETWORK:
				console.log("No Network");
				setTimeout(function(){
					console.log("Get Network Type again");
					indexAux.getNetworkType();
				},timeout.NETWORK_RETRY);

				break;

			default:
				console.log("Not supported ");
			return;
			break;
			}
		},

		loadSetupBridgePage : function(){
			wemoUtil.infoLog(indexAux.TAG, 'loadSetupBridgePage');
			window.sessionStorage.setItem("show_remote_alert", "true");
			//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
			$('.loading_spinner_splash').hide();
			wemoUtil.loadUrl(filePath.SETUP_BRIDGE);
		},
		loadDeviceListPageAfterSetup : function(){
            //nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);

			$('.loading_spinner_splash').hide();
			setTimeout(function(){
				wemoUtil.loadUrl(filePath.DEVICE_LIST);
			}, timeout.CONTROL_POINT_DELAY);
		},

		loadIndexPage : function(){
			//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
			$('.loading_spinner_splash').hide();
			wemoUtil.loadUrl(filePath.INDEX);
		},
		loadSetupSuccessfulPage : function(){			
			wemoUtil.infoLog(indexAux.TAG, 'loadSetupSuccessfulPage');
			window.sessionStorage.setItem("show_remote_alert", "true");
			//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
			$('.loading_spinner_splash').hide();
			wemoUtil.loadUrl(filePath.SETUP_SUCCESS);
		},
		
		loadEulaPage : function(){
			wemoUtil.infoLog(indexAux.TAG, 'loadEulaPage');
			//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
			$('.loading_spinner_splash').hide();
			wemoUtil.loadUrl(filePath.EULA);
		},

		loadEditDeviceDetailsPage : function(){
			wemoUtil.infoLog(indexAux.TAG, 'loadEditDeviceDetailsPage');
			//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
			$('.loading_spinner_splash').hide();
			wemoUtil.loadUrl(filePath.EDIT_WEMO_DETAILS);
		},
		loadNoNetworkPage : function() {
			wemoUtil.infoLog(indexAux.TAG, 'loadNoNetworkPage');
			window.sessionStorage.removeItem(sessionStore.STARTUP_MODE);
			nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);
			//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
			$('.loading_spinner_splash').hide();
			wemoUtil.loadUrl(filePath.NO_NETWORK);
		},

		loadDeviceListPage : function() {
			wemoUtil.infoLog(indexAux.TAG, 'loadDeviceListPage');
			//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
			$('.loading_spinner_splash').hide();
			clearInterval( setupMessagesTimer );
			wemoUtil.loadUrl(filePath.DEVICE_LIST);
		},

		loadGetStartedPage : function(){
			wemoUtil.infoLog(indexAux.TAG, 'loadGetStartedPage');
			//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
			$('.loading_spinner_splash').hide();
			wemoUtil.loadUrl(filePath.GET_STARTED);
		},

		loadRemoteNotAvailablePage : function(){
			wemoUtil.infoLog(indexAux.TAG, 'loadRemoteNotAvailablePage');
			//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
			$('.loading_spinner_splash').hide();
			wemoUtil.loadUrl(filePath.REMOTE_NOT_AVAILABLE);
		},
  
	    loadEditDevicePage : function(){
	    	wemoUtil.infoLog(indexAux.TAG, 'Bridge Edit Page');
			//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
			$('.loading_spinner_splash').hide();
	        setTimeout(function(){
	            wemoUtil.loadUrl(filePath.LED_DEVICE_LIST_EDIT);
	        }, timeout.CONTROL_POINT_DELAY);
		},
		
		loadHomeSenseSuccessPage : function(){
			wemoUtil.infoLog(indexAux.TAG, 'HomeSense Success Page');
			//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
			$('.loading_spinner_splash').hide();
	        setTimeout(function(){
	            wemoUtil.loadUrl(filePath.HOME_SENSE_SETUP_SCREEN);
	        }, timeout.CONTROL_POINT_DELAY);

	    },
	    
		reportError : function(e) {
			wemoUtil.infoLog(indexAux.TAG, "Plugin Failure Call back!!!!   " + e);
		},
		
		errorResponse : function (){
			wemoUtil.infoLog(indexAux.TAG, "errorResponse: " + "isLinkDevice: "+ isLinkDevice);
			if(isLinkDevice){
				window.sessionStorage.setItem(sessionStore.SHOW_REMOTE_ACCESS_POP_UP, "true");
				//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
				$('.loading_spinner_splash').hide();
				wemoUtil.loadUrl(filePath.SETUP_BRIDGE);
			}
			else{
				wemoUtil.infoLog(indexAux.TAG, "Plugin Failure Call back!!!!   " + "Error in remote access enable");
				window.sessionStorage.setItem(sessionStore.SETUP_REMOTE_STATUS, 'E');
				indexAux.loadSetupSuccessfulPage();
			}
		},

		getAppVersion : function(){
			nativeUtilPlugin.execute(
					function(version){
						$('#app_version').html(version);
						window.localStorage.setItem("appVersion", version);
					},
					indexAux.reportError,
					actions.GET_APP_VERSION,
					[]
			);
		},
		registerSetupListeners: function () {
			if(registerListener) return;
			registerListener=true;
			setupPlugin.execute(null, null, ACTION_STOP_SETUP_LISTENERS, []);
			setTimeout(function () {
				setupPlugin.execute(
						function (message) {
							console.log("Setup Callback Message: " + JSON.stringify(message));

							if (message) {
								if (message.listen == "wifi_state_changed") 
								{
									indexAux.showConnectedToText(message.smartString);
								}
								else if (message.listen == "smart_network_stablized") 
								{
									if(message.SSID != null && message.SSID.length > 0) 
										window.sessionStorage.setItem('sec_ssid',message.SSID);
									indexAux.processConnectionStatus(message.smartString);
								}
								else if (message.listen == "check_wemo_after_setup") 
								{
									indexAux.checkWemoPresentAndProceed(message.smartString);
								}
								else if (message.listen == "smart_registration") 
								{
									if(isRemoteEnabled)
										indexAux.processRegistrationStatus(message.smartString); 
									else
										indexAux.processRegistrationData(message.smartString);
								}
							}

						},
						indexAux.reportError,
						ACTION_START_SETUP_LISTENERS,
						[]
				);
			}, 100);
		},

		setUpMessaging : function(){
			console.log("Messaging:  Registering Time Interval!!!");
			var arrMessages = [wemo.items['AppStatusWaiting'], wemo.items['AppStatusWaitingDot'], wemo.items['AppStatusWorking']];
			var messageUpdateCounter = 0, 
			    self = this;
			setupMessagesTimer = setInterval(function(){
				var currMessage = $('#status_holder').text();
				console.log("Messaging:  currMSG:  "+currMessage);
				if(currMessage.indexOf(", ") != -1 || previousMessage.indexOf(", ") != -1){
					currMessage = currMessage.substr(0, currMessage.indexOf(','));
					previousMessage = previousMessage.substr(0, previousMessage.indexOf(','));
				}
				console.log("Messaging:  PreviousMSG:  "+previousMessage+"  ===  currMSG:  "+currMessage);
				if(previousMessage === currMessage){
					console.log("Messaging:    ::  curr MSG:  "+currMessage+", "+arrMessages[messageUpdateCounter]);
					$('#status_holder').html(currMessage+", "+arrMessages[messageUpdateCounter]);
				}else{
					messageUpdateCounter = -1;
					console.log("Messaging:  Reset Message Counter!!!");
				}

				previousMessage = $('#status_holder').text();
				messageUpdateCounter++;
				if(messageUpdateCounter === 3){
					messageUpdateCounter = 0;
				}
				console.log('Messaging: -------------------------------------------------------------');
				self.showConnectedTo();
			} ,updateSetupMessageTimer);
			previousMessage = $('#status_holder').text();
		},

		smartSetUpFlowLocalRegistration : function () {
			upnpInit=true;
			devicePlugin.execute(function()
            {
                var device_ssid = window.sessionStorage.getItem('device_SSID');
                wemoUtil.infoLog(indexAux.TAG, 'smartSetUpFlowLocalRegistration device_ssid: '+device_ssid);
                window.sessionStorage.setItem(sessionStore.SMART_SETUP_ONGOING, "0");
                window.sessionStorage.setItem(sessionStore.SUPER_SMART_SETUP_ONGOING, "0");
                setTimeout(function(){
                    devicePlugin.execute(null,indexAux.reportError,actions.CHECK_WEMO_PRESENT,[device_ssid]);
                }, timeout.CONTROL_POINT_DELAY);
            },indexAux.reportError,actions.INITIALIZE_UPNP,[]);
		},

		checkWemoPresentAndProceed : function(status) {        
			wemoUtil.infoLog(indexAux.TAG, 'checkWemoPresentAndProceed status: '+status);
			if(status == '1'){
				wemoUtil.infoLog(indexAux.TAG, 'checkWemoPresentAndProceed WeMo device found after disconnect isRemoteEnabled: '+isRemoteEnabled);
				if(isRemoteEnabled)
					devicePlugin.execute(null,indexAux.reportError,actions.GET_REGISTRATION_STATUS,[]); 
				else
					devicePlugin.execute(null,indexAux.reportError,actions.GET_REGISTRATION_DATA,[]);
			} else if(status == '0'){
				wemoUtil.infoLog(indexAux.TAG, 'checkWemoPresentAndProceed WeMo device not found after disconnect ');
				indexAux.remoteFailWemoDisconnected();
			}
			else if(status == '2'){
				wemoUtil.infoLog(indexAux.TAG, 'checkWemoPresentAndProceed Network not connected ');
				indexAux.remoteFailNoAction(wemo.items['AppStatusErrorRemoteInternetNotAvailable'], wemo.items['errorRemoteInternetNotAvailable']);
			}
		},

		processRegistrationData : function (status) {
			console.log("processRegistrationData Load Device List Page after smart setup status: "+status);
			indexAux.processConnectionStatusAfterSetup(status);
		} ,

		processRegistrationStatus : function (status) {
			console.log("processRegistrationStatus Load Device List Page after smart setup status: "+status);
			indexAux.processConnectionStatusAfterSetup(status);
		} ,

		smartSetUpFlowRemoteRegistration : function () {
			var reUnionKey;
			console.log("smartSetUpFlowRemoteRegistration loadDevicesFromCloud");
			//nativeUtilPlugin.execute(null,null,actions.SHOW_PROGRESS,[]);
			$('.loading_spinner_splash').show();
			window.sessionStorage.setItem(sessionStore.SMART_SETUP_ONGOING, "0");
			window.sessionStorage.setItem(sessionStore.SUPER_SMART_SETUP_ONGOING, "0");
			nativeUtilPlugin.execute(function (key) {
				reUnionKey = key;
				console.log("smartSetUpFlowRemoteRegistration loadDevicesFromCloud reUnionKey: "+reUnionKey);        
				indexAux.callCloudRegistrationData(1);
			},indexAux.reportError,actions.GET_REUNION_KEY,[]);
		},
		callCloudRegistrationData : function (retryCount) {
			wemoUtil.infoLog(indexAux.TAG, "callCloudRegistrationData loadDevicesFromCloud type: "+window.sessionStorage.getItem(sessionStore.NETWORK_TYPE)+" retryCount: "+retryCount);
			cordova.exec(
					function (params) {
						wemoUtil.infoLog(indexAux.TAG, "callCloudRegistrationData " + params[1]+" : "+params[0]+" : "+ params[2]+" request: " + cloudAPI.SMART_SETUP_REGISTRATION);
						var authCode = params[0];
						$.ajax({
							url: cloudAPI.SMART_SETUP_REGISTRATION,
							type: "GET",
							beforeSend: function (xhr) {
								xhr.setRequestHeader('Content-Type', 'application/xml');
								xhr.setRequestHeader('Authorization', authCode);
							},
			                timeout: timeout.URL_TIMEOUT_DEFAULT,
							success: function (data) {
								wemoUtil.infoLog(indexAux.TAG, "callCloudRegistrationData success callback from cloud");
								var responseXML = (new XMLSerializer()).serializeToString(data);
								var splitLength = 4000;
								var length = responseXML.length;
								var ittr = Math.floor(length / splitLength) + 1;
								for (var i = 0; i < ittr; i++) {
									var end = ((i + 1) * splitLength);
									if (end > length) {
										end = length;
									}
									wemoUtil.log(TAG, responseXML.substring(splitLength * i, end));
								}
								var clearData = false;

								$(data).find('smartDevice').each(function () {
									var device_id = $(this).find("smartDeviceId").text();
									var device_desc = $(this).find("description").text();
									var device_uniqueid = $(this).find("uniqueId").text();
									var device_privateKey = $(this).find("privateKey").text();
									var device_status = $(this).find("status").text();
									var device_homeId = $(this).find("homeId").text();
									var device_reUnionKey = $(this).find("reUnionKey").text();
									var device_reUnionKeyTS = $(this).find("reUnionKeyTS").text();
									if((device_homeId==null||device_homeId=="")&& retryCount<configValue.REG_DATA_CLOUD_MAX_RETRIES)
									{
										wemoUtil.infoLog(indexAux.TAG, "callCloudRegistrationData device_homeId is null, retryCount: "+retryCount);
										setTimeout(function() {
											indexAux.callCloudRegistrationData(++retryCount);
										}, configValue.REG_DATA_CLOUD_SLEEP_INTV);
									}
									else
									{
										wemoUtil.infoLog(indexAux.TAG, "callCloudRegistrationData Device Status " + device_status + " Smart Device Details device_uniqueid : " + 
												device_uniqueid + " device_id : " + device_id + " homeId : " + device_homeId + " reUnionKey : "
												+ device_reUnionKey + " privateKey : " + device_privateKey);

										setupPlugin.execute( indexAux.remoteSuccessAfterSetup(),indexAux.reportError,actions.SAVE_REMOTE_REGISTRATION,[device_id, device_uniqueid, device_homeId, device_privateKey, device_status]);
									}
								});

							},
							error: function (xhr, textstatus) {
								wemoUtil.infoLog(TAG, "callCloudRegistrationData status: " + xhr.status+" status text: " + xhr.statusText+" retryCount: "+retryCount);
								if((403=== xhr.status||400=== xhr.status)&& retryCount<configValue.REG_DATA_CLOUD_MAX_RETRIES)
								{
									setTimeout(function() {
										indexAux.callCloudRegistrationData(++retryCount);
									}, configValue.REG_DATA_CLOUD_SLEEP_INTV);
								}
								else 
								{
									window.sessionStorage.setItem(sessionStore.NETWORK_TYPE, networkType.HOME_NETWORK);
									indexAux.remoteFailInternetNotAvailable();
								}
							}
						});

					},
					function (err) {
						wemoUtil.infoLog(indexAux.TAG, "callCloudRegistrationData failure call back err: "+err);
					},
					"WebServicePlugin",
					"getAuthCode",
					["F"]
			); 
		},
		
		getBridgeInfo : function(plugin_details){
	    	
	    	nativeUtilPlugin.execute(
	            function(result){
	            	
	                var deviceType = window.sessionStorage.getItem('device_SSID');
	                
	                console.log("entering in getBridgeInfo"+deviceType+"---"+result+"==="+JSON.stringify(result)+"---"+result.length);
	                
	                if(result == "" || result == null || result == undefined || result.length == 0)
	                {
	                	console.log("entering in getBridgeInfo if");
	                	window.sessionStorage.setItem(sessionStore.LED_MULTIPLE_BRIDGE_UDN, deviceType);
	                	
	                	//auto connect
						$('#status_holder').html(wemo.items['AppStatusLookingForHomeNetwork']);
						console.log("Messaging: #status_holder 1 - "+$('#status_holder').text());

						setTimeout(
								function(){
									indexAux.autoPairing(plugin_details);
								},
								500
						);
						
	                }
	                else
	                {
	                	if(deviceType != $.trim(result) && deviceType != null)
	                    {
	                		//nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
							$('.loading_spinner_splash').hide();
	                    	console.log("entering in getBridgeInfo else");
	                    	setTimeout(function(){
		                        $("#multiple_bridge_header").html(wemo.items['AnotherWeMoLink_heading']);
		                        $("#multiple_bridge_body").html(wemo.items['AnotherWeMoLink_description']);
		                        $("#multiple_bridge_popup").popup();
		                        $("#multiple_bridge_popup").popup('open');
	                    	},600);
	                    }
	                    
	                    else
                    	{
	                    	//auto connect
							$('#status_holder').html(wemo.items['AppStatusLookingForHomeNetwork']);
							console.log("Messaging: #status_holder 1 - "+$('#status_holder').text());

							setTimeout(
									function(){
										indexAux.autoPairing(plugin_details);
									},
									500
							);
	                    	window.sessionStorage.setItem(sessionStore.LED_MULTIPLE_BRIDGE_UDN, deviceType);
                    	}
	                    	

	                }

	            },
	            indexAux.reportError,
	            ACTION_GET_BRIDGE_DATA,
	            []
	        );
	    	
	    },
	    
	    setBridgeInfo : function(bridgeudn){
	    	console.log("entering in SetBridgeUDN");
	    	
	    	nativeUtilPlugin.execute(
	            function(){
	            	console.log("entering in SetBridgeUDN success");
	            },
	            indexAux.reportError,
	            ACTION_SET_BRIDGE_DATA,
	            [bridgeudn]
	        );
	    }
};
