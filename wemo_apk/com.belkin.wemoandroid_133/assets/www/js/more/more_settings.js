/*
 more_settings.js

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

var TAG = "more_settings.js: ";
var commitResp;
var networkEnv;

$(document).bind('pageinit', function() {
    moreSettings.initialize();
});
window._json = function (data) {
	commitResp = data.commit_code;
	if(firmwareCloud == firmwareCloudEnvironment.STAGING){
		networkEnv =  sessionStore.STAG_ENVIRONMENT;
	}else if(firmwareCloud == firmwareCloudEnvironment.QA){
		networkEnv =  sessionStore.QA_ENVIRONMENT;
	}else if(firmwareCloud == firmwareCloudEnvironment.CI){
		networkEnv =  sessionStore.CI_ENVIRONMENT;
	}else if(firmwareCloud == firmwareCloudEnvironment.JARDEN){
		networkEnv =  sessionStore.JARDEN_ENVIRONMENT;
	}else if(firmwareCloud == firmwareCloudEnvironment.PRODUCTION){
		networkEnv =  "";
		commitResp = "";
	}        
};

var moreSettings = {

    TAG : "settings_and_about.js:",

    isRemoteMode : false,

    initialize : function() {
        console.log(TAG + "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    
    setInitialTempScale:function(){
    	var tempUnit = window.localStorage.getItem('tempUnit'),
    		hasHeater = window.sessionStorage.getItem('HEATER_EXISTS') === "true",
			$fahrenheitOption = $('[data-temp-scale="1"]'),
			$celsiusOption = $('[data-temp-scale="0"]'),
			$tempContainer = $('#temperature_container');

    	if (hasHeater) {
    		$tempContainer.show();
            if(tempUnit === "1" || !tempUnit){
				$fahrenheitOption.addClass('activeTemp');
            } else {
				$celsiusOption.addClass('activeTemp');
			}
    	}
    },
	toggleTempScale:function(e){
		e.preventDefault();
		var $currentTarget = $(this).find('.temp_radio_button'),
			tempScale = parseInt($currentTarget.attr('data-temp-scale'));

		$('.activeTemp').removeClass('activeTemp');
		$currentTarget.addClass('activeTemp');

		window.localStorage.setItem("tempUnit", tempScale);
	},

    onDeviceReady : function() {
        console.log(TAG + "onDeviceReady");

		moreSettings.setInitialTempScale();

        if (window.sessionStorage.getItem("led_device_length") == "1"){
        	$("#find_and_pair_Newdevice").show();
        }else $("#find_and_pair_Newdevice").hide();
        
        $('#more_settings_and_about').addClass('none');
        if(!window.sessionStorage.getItem(sessionStore.FIRMWARE_AVAILABLE))
		{
    			console.log(" #more_new_firmware display none");
    			$('#more_new_firmware').addClass('none');
		}
        $("#more_setting_location").text(wemo.items['Optional']).addClass('more_setting_location');
        moreSettings.isRemoteMode = (window.sessionStorage.getItem(sessionStore.REMOTE_MODE) == "true") ? true : false;
        wemoUtil.infoLog(moreSettings.TAG, " isRemoteMode: " + moreSettings.isRemoteMode);

        moreSettings.bindEvents();

        moreSettings.getAppVersion();

        moreSettings.getRememberConfig();

		wemoUtil.infoLog(moreSettings.TAG, " loadMoreMenu: " + window.sessionStorage.getItem("loadMoreMenu"));

        if(window.sessionStorage.getItem("loadMoreMenu") === "true") {
			wemoUtil.infoLog(moreSettings.TAG, " DBInitializeSettingAboutIsCalled");
        wemoUtil.DBInitializeSettingAbout(sessionStore.MORE_LOCATION_SETTINGS, function(){
			wemoUtil.infoLog(moreSettings.TAG, " loadMoreMenuCallbackIsCalled");
        		moreSettings.getCurrentLocation();
        		window.sessionStorage.setItem("loadMoreMenu", false);
        		});
        } else {
			wemoUtil.infoLog(moreSettings.TAG, " getCurrentLocationIsCalled");
        moreSettings.getCurrentLocation();
        }



        var disableMoreSettingLocationClick = false;

        

		
		//To return back to home page: device list tab
		$(".main_header").on("tap", function(e) {
			moreSettings.onBackPress();
		});       
        
        $("#location_container").on("click", function(event){
			wemoUtil.loadUrl(filePath.MORE_SETTING_LOCATION);
        });

		$('.temp_button_container').on("click", moreSettings.toggleTempScale);

        $("#location_selection_popup_ok").on('click', function(){
        	$("#location_selection_popup").popup("close");
        });

		$(".app_info_tab").on("click", function(){
			wemoUtil.loadUrl(filePath.APP_INFO);
		});
        
        /**firmware_versions html **/
        $(".hardware_info_tab").on("click", function(){
            wemoUtil.loadUrl(filePath.HARDWARE_INFO);
        });

        /** legal html **/
        $(".setting_legal").on("click", function(){
            wemoUtil.loadUrl(filePath.MORE_SETTING_LEGAL);
        });

        $('#more_remember_wifi').on('change',function(){
        	var state = $(this).is(':checked') ? true : false;
        	wemoUtil.infoLog(moreSettings.TAG, " Checked: " + state);
        	moreSettings.setRememberConfig(state);
        });
    },

    bindEvents : function() {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', moreSettings.onOnline, false);
        document.addEventListener('offline', moreSettings.onOffline, false);
        document.addEventListener("backbutton", moreSettings.onBackPress, false);
        document.addEventListener("pause", moreSettings.onPause, false);
        document.addEventListener("resume", moreSettings.onResume, false);
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
            wemoUtil.loadUrl(filePath.MORE_MENU);
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

    getAppVersion : function(){
        nativeUtilPlugin.execute(
            function(version){
                $('#app_version').html(version +  commitResp + networkEnv);
            },
            moreSettings.reportError,
            actions.GET_APP_VERSION,
            []
        );
    },

    setRememberConfig : function(state){
        wemoUtil.infoLog(moreSettings.TAG, "setRememberConfig");
        nativeUtilPlugin.execute(
            function(){
                wemoUtil.infoLog(moreSettings.TAG, "PREF_SET_CONFIG_STATUS success call back");
            },
            moreSettings.reportError,
            actions.PREF_SET_CONFIG_STATUS,
            [state]
        );
    },

    getRememberConfig : function(){
        wemoUtil.infoLog(moreSettings.TAG, "getRememberConfig");
        nativeUtilPlugin.execute(
            function(state){
                wemoUtil.infoLog(moreSettings.TAG, " PREF_GET_CONFIG_STATUS success callback state: " + state);
                if(moreSettings.isRemoteMode){
                    $('#more_remember_wifi').attr('disabled','disabled');
                }else{
                    $('#more_remember_wifi').attr('checked', state).checkboxradio("refresh").trigger('change');
                }

            },
            moreSettings.reportError,
            actions.PREF_GET_CONFIG_STATUS, []
        );
    },

    getCurrentLocation:function(){
    	//Get Current Location from LOCATIONINFO Table
        var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
        db.transaction(getCurrentLocationFromDB, errorCB, successCB);
        
	    // Insert Into LOCATIONINFOR Tabel
		function getCurrentLocationFromDB(tx){
			var currentCityCountryCode = "";
			errorTracker = "insertIntoLocationInfo()";
			tx.executeSql('SELECT * FROM LOCATIONINFO;',[], function(tx, results){
				var len = results.rows.length;
				console.log("FROM LOCATIONINFO; CallBack!!!  "+len);
				if(len > 0){
					console.log("results.rows.length:  "+len);
		            var locationObject = {};
					for(var i=0;i<len;i++){
						console.log("More_Location.js - LOCATIONINFO - Records    "
								+results.rows.item(i).cityName+"  ::  "
								+results.rows.item(i).countryName+"  ::  "
								+results.rows.item(i).latitude+"  ::  "
								+results.rows.item(i).longitude+"  ::  "
								+results.rows.item(i).countryCode+"  ::  "
								+results.rows.item(i).region+"  ::  "
						);
						
						/*locationObject.cityName = results.rows.item(i).cityName;
						locationObject.countryName = results.rows.item(i).countryName;
						locationObject.latitude = results.rows.item(i).latitude;
						locationObject.longitude = results.rows.item(i).longitude;
						locationObject.countryCode = results.rows.item(i).countryCode;
						locationObject.region = results.rows.item(i).region;*/
						locationObject[key.LOCATION_ID] = "";
						locationObject[key.COUNTRY] = results.rows.item(i).countryName;
						locationObject[key.REGION] = results.rows.item(i).region;
						locationObject[key.CITY] = results.rows.item(i).cityName;
						locationObject[key.LATITUDE] = results.rows.item(i).latitude;
						locationObject[key.LONGITUDE] = results.rows.item(i).longitude;
	                }
					
					var strCity = new String(locationObject[key.CITY]);
					var strCountry = new String(locationObject[key.COUNTRY]);
					
					if (strCity.trim()==='' || strCity.trim()===null || strCountry.trim()==='' || strCountry.trim()===null){
						   moreSettings.disableMoreSettingLocationClick = true;
						   currentCityCountryCode='';
					}else{
						var displayUSRegion=locationObject[key.COUNTRY]
						if (displayUSRegion=='US'){
							currentCityCountryCode = locationObject[key.CITY]+", "+locationObject[key.REGION];
						}else{
							currentCityCountryCode = locationObject[key.CITY]+", "+displayUSRegion;
						}
						
					}
						
					
					if(currentCityCountryCode===''||currentCityCountryCode===null){
					   $("#more_setting_location").text(wemo.items['Optional']).addClass('more_email_optional');
					   moreSettings.disableMoreSettingLocationClick = true;
					}else{
					   $("#more_setting_location").html(currentCityCountryCode).removeClass('more_email_optional'); 
					}
					wemoUtil.setJSONObjectToSessionStorage(sessionStore.CURRENT_LOCATION, locationObject);
			    }else{
					   moreSettings.disableMoreSettingLocationClick = true;
			    }
		    }, errorCB);
	    }
	    function successCB(tx, success){
	    	 console.log('Successfully - Get Current Location - LOCATIONINFO '+tx);
	    }
	    function errorCB(error){
	    	console.log("Error - "+errorTracker+"  ::  "+error);
	        console.log("Error - "+errorTracker+"  ::  "+error.message);
	        $("#more_setting_location").text(wemo.items['Optional']).addClass('more_email_optional');
	    }
    }

};
