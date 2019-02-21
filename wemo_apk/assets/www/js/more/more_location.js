/*
 
 more_location.js

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

$(document).bind('pageinit', function() {
    $('.ui-header').css({'border-bottom': '1px solid #888 !important'});
    $('.sub_header').css({'z-index':3,'border-top': '1px solid #73D44C !important'});
	
	var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));
    disableNetworkWatchdog = true;
    moreLocation.initialize();
});

var grouped = {};

var moreLocation = {

    TAG : 'more_location.js: ',

    statusText : {},
    suggestionList : {},
    searchField : {},

    initialize : function() {
        wemoUtil.infoLog(moreLocation.TAG,  "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    onDeviceReady : function() {
        var remote = window.sessionStorage.getItem('isRemoteEnabled');
        if(remote === "false"){
            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
           $("#remote_access_popup").popup('open');

            $('#remote_disabled_btn').on('click', function(){
                $("#remote_access_popup").popup('close');
                wemoUtil.loadUrl(filePath.MORE_SETTING_ABOUT);
            });
        }
        wemoUtil.infoLog(moreLocation.TAG,  "onDeviceReady");
        nativeUtilPlugin.execute(function(e){
        	nativeUtilPlugin.execute(null,null,actions.CLOSE_SOFT_KEYBOARD,[]);
        	$("#location_request_popup").popup('open');
		},
		function(e){
		}, actions.CHECK_LOCATION_SERVICE, []);
        
        $("#location_settings_btn").on('click', function(){
			$("#location_request_popup").popup('close');
			nativeUtilPlugin.execute(null, null, actions.ACTION_GOTO_LOCATION_SETTING, []);
		});
        
        $("#location_ignore_btn").on('click', function(){
			$("#location_request_popup").popup('close');
			nativeUtilPlugin.execute(null,null,actions.OPEN_SOFT_KEYBOARD,[]);
		});
    
        if (!viewPortHeight) {
            var viewPortHeight = $(window).height();
            var headerHeight = $('#header_id').outerHeight(true);
            var footerHeight = $('.bottom_btns').outerHeight(true);
            var $content =  $("#suggestions");
        }
        
        var contentHeight = (viewPortHeight - headerHeight - footerHeight) + 20;
        var margin = footerHeight;

        $content.css({
            height: contentHeight,
            marginBottom: margin
        });
        
	    moreLocation.bindEvents();
        //All initialization script goes here
        var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 6000000);
        var ruleObj=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
        //console.log("Rule Object Data 1 ::"+JSON.stringify(ruleObj));
      
        moreLocation.initializeDOMElements();
        moreLocation.setLocalisationStrings();
        
        if (ruleObj!=null && ruleObj.locationInfo!=undefined){
        	var locationObject = {};
        	//console.log("Rule Object Data 2 ::"+JSON.stringify(ruleObj)+" :: "+ruleObj.sunriseState);
        	if (ruleObj.sunriseState === undefined){
        		$('#searchField').focus();
        		(moreLocation.searchField).attr("placeholder", wemo.items['Optional']);
                var statusText = $("#status_text");
                (moreLocation.searchField).on("input", function(e) {
                    var text = $(this).val();
                    if(text.length === 0){
                        (moreLocation.statusText).html(wemo.items['LocationPrompt']);
                        (moreLocation.suggestionList).html('');
                    } else if(text.length >= 3) {
                    	moreLocation.validateLocation(text);
                    	//NAGA
                       // (moreLocation.statusText).html(wemo.items['ValidatingCity']);
                       // moreLocation.getLocation(text);
                    }
                });
        	}else{
        		//console.log("Rule Object Data 3 ::"+JSON.stringify(ruleObj)+" :: "+ruleObj.sunriseState);
        		$('#searchField').focus();
        		$('#searchField').val(ruleObj.locationInfo.cityName);
	        		var text = $('#searchField').val();
	    			//alert(text.length);
	                if(text.length === 0){
	                    (moreLocation.statusText).html(wemo.items['LocationPrompt']);
	                    (moreLocation.suggestionList).html('');
	                } else if(text.length >= 3) {
	                	moreLocation.validateLocation(text);
                    	//NAGA
	                    //(moreLocation.statusText).html(wemo.items['ValidatingCity']);
	                    //moreLocation.getLocation(text);
	                }
        	}
        	
        }else{
        	$('#searchField').focus();
            nativeUtilPlugin.execute(null, moreLocation.reportError,actions.OPEN_SOFT_KEYBOARD,[]);
            var locationObject = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.CURRENT_LOCATION);
            var statusText = $("#status_text");

            //get localization content
            if (locationObject!=null && locationObject!=undefined){
                var strCountry = new String(locationObject[key.COUNTRY]);
                var strCity = new String(locationObject[key.CITY]);
                var strRegion = new String(locationObject[key.REGION]);
                var strLatitude = new String(locationObject[key.LATITUDE]);
                var strLongitude = new String(locationObject[key.LONGITUDE]);

                if(strCity.length === 0){
                    statusText.html(wemo.items['LocationPrompt']);
                    (moreLocation.suggestionList).html('');
                } else if(strCity.length >= 3) {
                    nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
                    moreLocation.showCurrentLocation(strCity, strLatitude, strLongitude);
                }
            } else {
                (moreLocation.searchField).attr("placeholder", wemo.items['Optional']);
                wemoUtil.infoLog(moreLocation.TAG, "Ready to bring the awesome.");

                (moreLocation.searchField).on("input", function(e) {
                    var text = $(this).val();
                    if(text.length === 0){
                        (moreLocation.statusText).html(wemo.items['LocationPrompt']);
                        (moreLocation.suggestionList).html('');
                    } else if(text.length >= 3) {
                        moreLocation.validateLocation(text);
                        //NAGA
                        //(moreLocation.statusText).html(wemo.items['ValidatingCity']);
                        //moreLocation.getLocation(text);
                    }
                });
            }
        }
        
        (moreLocation.searchField).on("input", function(e) {
			var text = $('#searchField').val();
			//alert(text.length);
            if(text.length === 0){
                (moreLocation.statusText).html(wemo.items['LocationPrompt']);
                (moreLocation.suggestionList).html('');
            } else if(text.length >= 3) {
            	moreLocation.validateLocation(text);
            	//NAGA
               // (moreLocation.statusText).html(wemo.items['ValidatingCity']);
                //moreLocation.getLocation(text);
            }
        });
        
        // Get Current Location from Session
		var locationObject = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.CURRENT_LOCATION);
        if(locationObject != undefined){
        	//Display the Current Location from Session
        	var currentCityCountryCode = "";
        	currentCityCountryCode = locationObject[key.CITY]+", "+locationObject[key.COUNTRY];
			var locationList = locationObject;
			locationInfo = {};
			if(remote === "false"){
			 $('#searchField').val(currentCityCountryCode);
			 nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
			}
			moreLocation.buildLocationList(locationList, true);
        }
		
		//To return back to home page: device list tab
		$(".wemo_logo").on("tap", function(e) {
			if ( e.target.nodeName!= "IMG" ) {				
				wemoUtil.loadUrl(filePath.DEVICE_LIST);
			}
		});

        $('#suggestions').on('click', '> li', function () {
            var listItem = $(this);
            $("#searchField").val($(this).text());
            moreLocation.suggestionList.html("");
            (moreLocation.statusText).html(wemo.items['LocationPrompt']);
            
            var locationObject = {};
           // alert("Location id = "+listItem.attr('wemo-location-id'));
            locationObject[key.LOCATION_ID] = listItem.attr('wemo-location-id');//locationID;
            locationObject[key.COUNTRY] = listItem.attr('wemo-country');//country;
            locationObject[key.REGION] = listItem.attr('wemo-region');//region;
            locationObject[key.CITY] = listItem.attr('wemo-city');//city;
            locationObject[key.LATITUDE] = listItem.attr('wemo-latitude');//latitude;
            locationObject[key.LONGITUDE] = listItem.attr('wemo-longitude');//longitude;
            locationObject[key.REGIONNAME] = listItem.attr('wemo-regionName');//RegionName;

            wemoUtil.setJSONObjectToSessionStorage(sessionStore.CURRENT_LOCATION, locationObject);
          $("more_location,body").scrollTop(0);
        });

        // submit btn.
        $("#location_submit_btn").on('click', function(){
            var remoteMode = window.sessionStorage.getItem('isRemote');
        	if ($('#searchField').val()!=""){
                if(remoteMode === "false"){
                    deviceTabPlugin.execute(successCallBack, wemoUtil.reportError, actions.READ_DB_FROM_PLUGIN, []);
                }
                else {
                    cordova.exec(function(params) {
                        wemoUtil.infoLog(TAG, "success call back- downloadDBFromCloud " + params[1] + " : " + params[0]);
                        var homeId = params[1];
                        var authCode = params[0];

                        wemoUtil.infoLog(TAG, "success call back home id...: " + homeId + " authCode...: " + authCode);
                        $.ajax({
                            url: cloudAPI.LED_DEVICE_LIST + homeId,
                            type: "GET",
                            beforeSend: function (xhr) {
                                xhr.setRequestHeader('Content-Type', 'application/xml');
                                xhr.setRequestHeader('Authorization', authCode);
                            },
                            success: successCallBack
                        });
                    }, wemoUtil.reportError,
                        "WebServicePlugin",
                        "getAuthCode", []);
                }

        	}
        	
        	
        });

        function successCallBack (pragaVersion) {
            var locationObject = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.CURRENT_LOCATION);

            if(locationObject!=null){
                //Insert the selected City and its details into LOCATIONINFO Table

                db.transaction(insertIntoLocationInfo, errorCB, successCB);

                // Insert Into LOCATIONINFOR Tabel
                function insertIntoLocationInfo(tx){
                    errorTracker = "insertIntoLocationInfo()";
                    tx.executeSql('SELECT * FROM LOCATIONINFO;',[], function(tx, results){

                        var len = results.rows.length;
                        var locationInfo = {};
                        var ruleRows=[];
                        console.log("FROM LOCATIONINFO; CallBack!!!  "+len);
                        if(len > 0){
                            console.log("results.rows.length:  "+len);
                            for(var i=0;i<len;i++){
                                ruleRows[i]=results.rows.item(i);
                                locationInfo.cityName = ruleRows[i].cityName;
                                locationInfo.countryName = ruleRows[i].countryName;
                                locationInfo.latitude = ruleRows[i].latitude;
                                locationInfo.longitude = ruleRows[i].longitude;
                                locationInfo.countryCode = ruleRows[i].countryCode;
                                locationInfo.region = ruleRows[i].region;
                                locationInfo.regionName = ruleRows[i].regionName;
                                console.log("LOCATIONINFO - Records 1 ::   "
                                    +results.rows.item(i).cityName+"  ::  "
                                    +results.rows.item(i).countryName+"  ::  "
                                    +results.rows.item(i).latitude+"  ::  "
                                    +results.rows.item(i).longitude+"  ::  "
                                    +results.rows.item(i).countryCode+"  ::  "
                                    +results.rows.item(i).region+"  ::  "
                                );
                            }
                            //ruleObj[sessionStore.LOCATION_INFO] = locationInfo;
                            //tx.executeSql('DELETE * FROM LOCATIONINFO;',[],function(tx, results){
                            tx.executeSql('UPDATE LOCATIONINFO SET cityName="'+locationObject[key.CITY]+'", countryName="'+locationObject[key.COUNTRY]+'", latitude="'+locationObject[key.LATITUDE]+'",longitude="'+locationObject[key.LONGITUDE]+'", countryCode="'+locationObject[key.COUNTRY]+'", region="'+locationObject[key.REGION]+'";',[],
                                function(tx, results){
                                    console.log("-----------UPDATED INTO LOCATIONINFO");
                                    tx.executeSql("SELECT * FROM LOCATIONINFO",[], function(tx, results){
                                        var len = results.rows.length;
                                        var locationInfo = {};
                                        var ruleRows=[];
                                        console.log("results.rows.length:  "+len);
                                        for(var i=0;i<len;i++){
                                            ruleRows[i]=results.rows.item(i);
                                            locationInfo.cityName = ruleRows[i].cityName;
                                            locationInfo.countryName = ruleRows[i].countryName;
                                            locationInfo.latitude = ruleRows[i].latitude;
                                            locationInfo.longitude = ruleRows[i].longitude;
                                            locationInfo.countryCode = ruleRows[i].countryCode;
                                            locationInfo.region = ruleRows[i].region;
                                            locationInfo.regionName = ruleRows[i].regionName;
                                            console.log("LOCATIONINFO - Records 2 ::   "
                                                +results.rows.item(i).cityName+"  ::  "
                                                +results.rows.item(i).countryName+"  ::  "
                                                +results.rows.item(i).latitude+"  ::  "
                                                +results.rows.item(i).longitude+"  ::  "
                                                +results.rows.item(i).countryCode+"  ::  "
                                                +results.rows.item(i).region+"  ::  "
                                            );
                                        }
                                        //ruleObj[sessionStore.LOCATION_INFO] = locationInfo;
                                    }, errorCB);
                                    var currentCityCountryCode = locationObject[key.CITY]+", "+locationObject[key.COUNTRY];
                                    //alert(currentCityCountryCode);
                                    //Set current Location Info Object in Session
                                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.CURRENT_LOCATION, locationObject);
                                }, errorCB);
                        }else{
                            tx.executeSql('INSERT INTO LOCATIONINFO (cityName, countryName, latitude, longitude, countryCode, region) VALUES ("'+locationObject[key.CITY]+'","'+locationObject[key.COUNTRY]+'","'+locationObject[key.LATITUDE]+'","'+locationObject[key.LONGITUDE]+'","'+locationObject[key.COUNTRY]+'","'+locationObject[key.REGION]+'")', [],
                                function(tx, results){
                                    //alert("Insert Succefully!!else!!");

                                }, errorCB);
                        }

                    }, errorCB);
                }
                function successCB(tx, success){
                    console.log('Successfully - INSERT INTO LOCATIONINFO '+tx);
                    var ruleObj=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
                    //alert("Success CB");
                    if (ruleObj==null){
                        ruleObj={};
                    }

                    ruleObj.sunriseState="1";
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,ruleObj);


                    /*
                     * Get the updated params for Schedule String, for selected city.
                     * 1. Get the new Lat/Long and new SRSS Time.
                     * 2. Get the Rules which having SRSS times [SR-000001, SS-000002].
                     *    -Create the Schedule String and push to plug-ins
                     * */
                    //navigator.notification.activityStart("", wemo.items['loadingMessage']);
                    //wemoUtil.showModal();
                    nativeUtilPlugin.execute(null,null,actions.SHOW_RULE_PROGRESS,["", wemo.items['loadingMessage']]);
                    moreLocation.updateSRSSRulesBasedOnCurrentLoactionforLED();
                    setTimeout(function(){
                        moreLocation.updateSRSSRulesBasedOnCurrentLoaction(sessionStore.MORE_LOCATION_SETTINGS, db);
                    }, 8000);
                }
                function errorCB(error){
                    console.log("Error - "+errorTracker+"  ::  "+error);
                    console.log("Error - "+errorTracker+"  ::  "+error.message);
                    if (ruleObj!=null){
                        ruleObj.sunriseState="0";
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,ruleObj);
                    }
                }


            }else{
                //alert("Please select a valid country");
            }
        };

        // cancel btn
        $("#location_cancel_btn").on('click', function(){
        	nativeUtilPlugin.execute(null, null, actions.CLOSE_SOFT_KEYBOARD,[]);
        	 var locationObject = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.CURRENT_LOCATION);
        	 var ruleObj=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
             locationObject=null;
             if (ruleObj!=null){
            	 if (ruleObj.locationInfo!=null || ruleObj.locationInfo!=undefined){
            		 delete ruleObj.locationInfo;
            	 }
            	 if (ruleObj.When != null && ruleObj.When.StartSRSS != undefined){
            		 delete ruleObj.When.StartSRSS;
            	 }
            	 if(ruleObj.When != null && ruleObj.When.EndSRSS != undefined){
	        		 delete ruleObj.When.EndSRSS;
            	 }
             }
             wemoUtil.setJSONObjectToSessionStorage(sessionStore.CURRENT_LOCATION, locationObject);
             wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,ruleObj);
             wemoUtil.loadPreviousUrl();
        });

        deviceTabPlugin.execute(
            function(enabled){
                console.log("Remote enabled: " + enabled);
                if(enabled){

                }else{
                   // alert('no remote');
                }
            },
            moreLocation.reportError,
            actions.IS_REMOTE_ENABLED,
            []
        );


    },

    bindEvents : function() {
        wemoUtil.infoLog(moreLocation.TAG,  "bindEvents");
        document.addEventListener('online', moreLocation.onOnline, false);
        document.addEventListener('offline', moreLocation.onOffline, false);
        document.addEventListener("backbutton", moreLocation.onBackPress, false);
        document.addEventListener("pause", moreLocation.onPause, false);
        document.addEventListener("resume", moreLocation.onResume, false);
    },

    onOffline : function() {
        wemoUtil.infoLog(moreLocation.TAG, "offLine");
    },

    onOnline : function() {
        wemoUtil.infoLog(moreLocation.TAG, "onLine");
    },

    onBackPress : function() {
    	if ($(".more_tab").is(":visible")) {
    		$(".more_tab").hide();
    		$('body').find('.modalWindow').transition({opacity:0},400, function(){
                $(this).removeClass('isOpen');
            });
    	}
    	else {
	        wemoUtil.infoLog(moreLocation.TAG, "onBackPress");
	        var locationObject = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.CURRENT_LOCATION);
	        var ruleObj=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
	        locationObject=null;
	        if (ruleObj!=null && ruleObj.locationInfo!=null){
		 ruleObj.locationInfo=null;
	        }
	        wemoUtil.setJSONObjectToSessionStorage(sessionStore.CURRENT_LOCATION, locationObject);
	        wemoUtil.loadPreviousUrl();
    	}
    },

    onPause : function() {
        wemoUtil.infoLog(moreLocation.TAG,  "onPause");
    },

    onResume : function() {
        wemoUtil.infoLog(moreLocation.TAG, "onResume");
    },

    reportError : function(e) {
        wemoUtil.infoLog(moreLocation.TAG, "Plugin Error!!!!   " + e);
    },

    initializeDOMElements : function(){
        moreLocation.suggestionList = $("#suggestions");
        moreLocation.statusText = $("#status_text");
        moreLocation.searchField = $("#searchField");


    },

    setLocalisationStrings : function(){
        (moreLocation.statusText).html(wemo.items['LocationPrompt']);

    },
    
    validateLocation: function (text) {	   	

    		deviceTabPlugin.execute(
                     function(enabled){
                    	 wemoUtil.infoLog(moreLocation.TAG, "validateLocation: Remote enabled: " + enabled);
                         if(enabled){
                        	 (moreLocation.statusText).html(wemo.items['ValidatingCity']);
     	                    moreLocation.getLocation(text);	
                         }else{
                        	 wemoUtil.infoLog(moreLocation.TAG, "validateLocation: Calling get location");
                         }
                     },
                     function (err) {
                    	 wemoUtil.infoLog(moreLocation.TAG, "validateLocation:  Failure call back");
                     },
                     actions.IS_REMOTE_ENABLED,
                     []
                 );
    },

    getLocation : function(searchString){
    	//alert("getLocation")
        wemoUtil.infoLog(moreLocation.TAG, "getLocation for: " + searchString);
        cordova.exec(
            function (params) {
                console.log("success call back" + params[1] + " : " + params[0]);
                var homeId = params[1];
                var authCode = params[0];

                console.log("success call back home id: " + homeId);
                console.log("success call back authCode: " + authCode);

                $.ajax({
                    url: cloudAPI.LOCATION_SEARCH + searchString,

                    type: "GET",
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function (data) {
                        console.log("success callback from cloud");
                        var responseXML = (new XMLSerializer()).serializeToString(data);
                        var splitLength = 4000;
                        var length = responseXML.length;
                        var ittr = Math.floor(length/splitLength) + 1;
                        for(var i = 0; i < ittr ; i++){
                            var end = ((i + 1) * splitLength);
                            if(end > length){
                                end = length;
                            }
                            wemoUtil.log(moreLocation.TAG, responseXML.substring(splitLength * i, end));
                        }
                        var locationList = [];
                        $(data).find('cityLocation').each(function (i) {

                            console.log("city: " + i);

                            var locationID = $(this).find("locationId").text();
                            var country = $(this).find("country").text();
                            var region = $(this).find("region").text();
                            var city = wemoUtil.removeDiacriticChar($(this).find("city").text());
                            var latitude = $(this).find("latitude").text();
                            var longitude = $(this).find("longitude").text();
                            var regionName = $(this).find("regionName").text();

                            var locationObject = {};
                            locationObject[key.LOCATION_ID] = locationID;
                            locationObject[key.COUNTRY] = country;
                            locationObject[key.REGION] = region;
                            locationObject[key.CITY] = city;
                            locationObject[key.LATITUDE] = latitude;
                            locationObject[key.LONGITUDE] = longitude;
                            locationObject[key.REGIONNAME] = regionName;

                            console.log("device object: " + JSON.stringify(locationObject));
                            locationList.push(locationObject);

                        });
                        	//alert("Generate List");
                        moreLocation.buildLocationList(locationList, false);
                    },
                    error: function (xhr, textstatus) {
                        (moreLocation.statusText).html(wemo.items['NoCityFound']);
                        (moreLocation.suggestionList).html('');
                        wemoUtil.infoLog(moreLocation.TAG, 'status: ' + xhr.status);
                        wemoUtil.infoLog(moreLocation.TAG, 'status text: ' + xhr.statusText);
                    }
                });

            },
            function (err) {
                console.log("failure call back");
            },
            "WebServicePlugin",
            "getAuthCode",
            []
        );
    },

    buildLocationList : function(locationList, isDBValue){
    	//alert("buildLocationList")
    	console.log("buildLocationList object: " + JSON.stringify(locationList));
        var list = '';
        if(!isDBValue){
        	$.each(locationList, function(i, locationObject){
	            var region = '';
	            if(locationObject[key.COUNTRY] === 'US'){
	                region = locationObject[key.REGION];
	            }else{
	                region = locationObject[key.COUNTRY];
	            }
	            list += '<li ' +
	                'wemo-location-id = "' + locationObject[key.LOCATION_ID] + '"' +
	                'wemo-country = "' + locationObject[key.COUNTRY] + '"' +
	                'wemo-region = "' + locationObject[key.REGION] + '"' +
                    'wemo-regionName = "' + locationObject[key.REGIONNAME]  + '"' +
	                'wemo-city = "' + locationObject[key.CITY] + '"' +
	                'wemo-latitude = "' + locationObject[key.LATITUDE] + '"' +
	                'wemo-longitude = "' + locationObject[key.LONGITUDE] + '"' +
	                '>' + locationObject[key.CITY] + ', ' + locationObject[key.REGIONNAME] + "("+ region +")"+ '</li>';
	            console.log("List:  "+list);
	        });
        	
	       // alert("if :: "+((moreLocation.searchField).val()).length+" ::  "+list);
        	
	        if(((moreLocation.searchField).val()).length == 0){
	            (moreLocation.suggestionList).html('');
	        }else{
	            (moreLocation.suggestionList).html(list);
	        }
        }else{
        	var region = '';
            if(locationList[key.COUNTRY] === 'US'){
                region = locationList[key.REGION];
            }else{
                region = locationList[key.COUNTRY];
            }
            list += '<li ' +
                'wemo-location-id = "' + locationList[key.LOCATION_ID] + '"' +
                'wemo-country = "' + locationList[key.COUNTRY] + '"' +
                'wemo-region = "' + locationList[key.REGION] + '"' +
                'wemo-city = "' + locationList[key.CITY] + '"' +
                'wemo-latitude = "' + locationList[key.LATITUDE] + '"' +
                'wemo-longitude = "' + locationList[key.LONGITUDE] + '"' +
                'wemo-regionName = "' + locationList[key.REGIONNAME] + '"' +
                '>' + locationList[key.CITY] + ', ' + region + '</li>';
            console.log("List:  "+list);
        	(moreLocation.suggestionList).html(list);
        	//alert(((moreLocation.searchField).val()).length);

			if(((moreLocation.searchField).val()).length == 0){
	            (moreLocation.suggestionList).html('');
	        }else{
	            (moreLocation.suggestionList).html(list);
	        }
	        (moreLocation.suggestionList).listview("refresh");
	        (moreLocation.statusText).html(wemo.items['LocationPrompt']);
        }
    },
    
    updateSRSSRulesBasedOnCurrentLoaction : function(goBack, db) {
    	//Get all records of SRSS Rules from RULEDEVICES Table where StartTime and EndTime is ending with 1/2;
    	console.log("Get all records of SRSS Rules from RULEDEVICES Table where StartTime and EndTime is ending with 1/2;");
        db.transaction(getSRSSRecords, errorCB, successCB);
        function getSRSSRecords(tx){
        	console.log("Get SRSS Records-------------");
        	tx.executeSql('SELECT distinct a.RuleID, a.Name, a.Type, b.DeviceID, a.State, b.StartTime, b.RuleDuration, b.StartAction, b.EndAction, b.DayID, b.Value, b.SensorDuration  from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID WHERE RuleDuration LIKE "%8" OR RuleDuration LIKE "%9" OR RuleDuration LIKE "%1" OR RuleDuration LIKE "%2" OR StartTime LIKE "%1" OR StartTime LIKE "%2";', [],
			function(tx, results){
				//alert("Insert Succefully!!else!!");
        		var len = results.rows.length;
        		console.log("Get SRSS Records-------------Results  "+len);
        		if(len > 0){
	    			console.log("getSRSSRecords()   results.rows.length:  "+results.rows.length);
	    			
		    		for(var i=0;i<len;i++){
		    			console.log("More_Location.js - RULEDEVICES - Records   "
                				+results.rows.item(i).RuleID+"  ::  "
                				+results.rows.item(i).DeviceID+"  ::  "
                				+results.rows.item(i).StartTime+"  ::  "
                				+results.rows.item(i).RuleDuration
                				);
		    			 var record = results.rows.item(i);
		    			 if(!(record.RuleID in grouped)) {
                             grouped[record.RuleID] = [];
                         }

		    			 
		    			 if (record.State!=0){
		    				 grouped[record.RuleID].push({
                                 DayID: record.DayID,
                                 Devices: record.DeviceID,
                                 //rowRuleName: record.Name,
                                 RuleValue: record.Value,
                                 RuleName: record.Name,
                                 SensorDuration: record.SensorDuration,
                                 RuleType: record.Type,
                                 StartTime: record.StartTime,
                                 RuleDuration: record.RuleDuration,
                                 StartAction: record.StartAction,
                                 EndAction: record.EndAction,
                                 State: record.State,
                                 id: record.RuleID,
                                 SelectedSensorsValue: record.Value                                   
                             });
		    			 }
                           // alert(record.Value);
                            	
		    		}
                            	
		    		
        		}
			}, errorCB);
        }
	    function successCB(tx, success){
    	 console.log('Successfully - Get SRSS Records - RULEDEVICES '+tx);
    	 var locationObject = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.CURRENT_LOCATION);
		 
    	 if (goBack==sessionStore.MORE_LOCATION_SETTINGS){
    		
    		 	var rowDevice=[];
    		 	var sensorDevice=[];
    		    var recordId="";

    		    $.each(grouped, function(RuleID, records) {
	    				var deviceRule={};
	        		 	var selectedSensors="";
	        		 	deviceRule.Devices={};
	        		 	deviceRule.When={};
	        		 	deviceRule.Sensors={};
	        		 	deviceRule.locationInfo={};
	        		 	var days=[];
	    	           	$.each(records, function(ix, record) {
	    	           		//console.log("DB Rule Type :: "+record.rowType+' Device ID :: '+record.rowDeviceID+'  Start Time  :: '+record.rowStartTime+'  Rule Duration :: '+record.rowRuleDuration+'  Start Action :: '+record.rowStartAction+' Day ID :: '+record.rowDayID+'  Sensor Value :: '+record.rowRuleValue);
	    	           		var ruleDevice=record.Devices;
	    	           		//alert(record.rowDayID)
	    	           		deviceRule.id=record.id;
	    	           		deviceRule.State=record.State;
	    	           		deviceRule.RuleType=record.RuleType;
	    	           		deviceRule.RuleName=record.RuleName;
	    	           		deviceRule.SelectedDayOrRange=record.DayID;
	    	           		//console.log("Devices :: "+record.DeviceID+"  SA :: "+record.StartAction+" :: EA :: "+record.EndAction);
	    	           		deviceRule.Devices[record.Devices]={};
	    	           		deviceRule.Devices[record.Devices].StartAction=record.StartAction;
	    	           		deviceRule.Devices[record.Devices].EndAction=record.EndAction;
	    	           		deviceRule.Devices[record.Devices].SensorDuration=record.SensorDuration;
	    	           		deviceRule.SelectedSensorsValue=record.SelectedSensorsValue;
	    	           		deviceRule.When.StartTime=record.StartTime;
	    	           		deviceRule.When.RuleDuration=record.RuleDuration;
	    	           		deviceRule.locationInfo=locationObject;
	    	           		
	    	           		var ruleDay=record.DayID;
	    	           			if( $.inArray(ruleDay, days) == -1 && ruleDay != -1){
	    	           				days.push(ruleDay);
	    	           			}
	    	           		
	    	           		
	    	           		if (ruleDevice.indexOf("Socket")!=-1){
	    	           			if( $.inArray(record.DeviceID, rowDevice) == -1 ){
	    	           				rowDevice.push(record.DeviceID);
	    	           		   }
	    	           			

	    	           		}else{
	    	           			if( $.inArray(record.DeviceID, sensorDevice) == -1 ){
	    	           				sensorDevice.push(record.DeviceID);
	    	           				selectedSensors += record.DeviceID+",";
	    	           		   }
	    	           		
	    	           		}
	    	           		recordId=record.id;
	    	               });
	    	           		console.log(" :: deviceRule :: "+JSON.stringify(records)+" ************************      "+JSON.stringify(deviceRule));
	    	           		nativeUtilPlugin.execute(function(par){
			    	           	 if (deviceRule.RuleType==sessionStore.MOTION_CONTROLLED){
			    	           		for(key in deviceRule.Devices){
				    	             	if (key.indexOf("Sensor")!=-1){
				    	             		wemoUtil.pushSensorScheduleStrWithSRSS(key,db,deviceRule,locationObject,par,days);
				    	             	}
				    	             }
			    	           	 }else{
			    	           		
			    	           		var len = Object.keys(deviceRule.Devices).length;
			    	           		var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 6000000);
			    	           		
			    	           		for(var dev=0;dev<Object.keys(deviceRule.Devices).length;dev++){			    	           			
			    	           			
			    	           			console.log("deviceRule.Devices "+Object.keys(deviceRule.Devices)[dev]);
			    	           			var deviceid = Object.keys(deviceRule.Devices)[dev];
			    	           			
			    	           			if(deviceid.indexOf("uuid:Bridge")!=-1)
			    	           			{		
			    	           				//alert("etnering in "+deviceid);
			    	           				
			    	           				if(deviceid.indexOf("^")!=-1)
			    	           				{
			    	           					var splitDeviceId = deviceid.split("^");
				    	           				var DeviceID = splitDeviceId[1];      
			    	           				}
			    	           				else
			    	           				{
			    	           					var splitDeviceId = deviceid.split(":");
				    	           				var DeviceID = splitDeviceId[2];
			    	           				}    
			    	           				wemoUtil.pushScheduleLedDevices(DeviceID,db,deviceRule,dev,len);
			    	           			}
			    	           			else
			    	           			{
			    	           				wemoUtil.pushSwitchScheduleStrWithSun(Object.keys(deviceRule.Devices)[dev],db,deviceRule,dev,locationObject,par);
			    	           			}
                                        
                                    }
			    	           	 }
	    	           		},function(err){console.log("Error "+err);},actions.GET_SR_SS_TIME,[locationObject.latitude, locationObject.longitude]);
	    	           });

    		    
		    		 setTimeout(function(){
			    		 deviceTabPlugin.execute(
			 	                function(data){
			 	                    if (data==networkType.HOME_NETWORK){
			 	                        wemoUtil.pushDB(sessionStore.LOCATION_SETTINGS);
			 	                    }else if (data==networkType.REMOTE_WIFI || data == networkType.REMOTE_MOBILE){
			 	                        deviceTabPlugin.execute(
			 	                            function(enabled){
			 	                                console.log("MoreTab Remote enabled: " + enabled);
			 	                                if(enabled){
			 	                                    wemoUtil.uploadDBOnCloud(sessionStore.LOCATION_SETTINGS);
			 	                                }else{
			 	                                    navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {loadUrlTimeoutValue : 60000});
			 	                                }
			 	                            },
			 	                            wemoUtil.reportError,
			 	                            actions.IS_REMOTE_ENABLED,
			 	                            []
			 	                        );
			 	                    }
			 	                },
			 	                function(err){console.log("Error getting sensors list")},
			 	                actions.GET_NETWORK_TYPE,
			 	                []
			 		    	 );
		    		 },12000);		 
			    		 
    		 
	    	 }
	    	 
	    }
	    
	    
	    function updateSRSSDB(tx){
	    	//alert("I am here to update the rule");
	    }
	    
	    function successUpdateCB(tx){
	    	alert("successfully updated");
	    }
	    
	    
	    function errorCB(error){
	    	console.log("Error - "+errorTracker+"  ::  "+error);
	        console.log("Error - "+errorTracker+"  ::  "+error.message);
	    }
    },
    
    
    
    fnUpdateDB: function(){
       // SRSS.transaction(updateSRSSDB, errorCB, successCB);
    },
    
    updateSRSSRulesBasedOnCurrentLoactionforLED : function() {
    	 var locationObject = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.CURRENT_LOCATION);
    	 
    	 nativeUtilPlugin.execute(
					function (params) {
						
						if (params.length > 0) {
							var day = "";
							var tempData;
							var timeSR = 0;
							var timeSS = 0;
							var arrSelectedDays;
							var matchCounter = 0;
							var SRSSSelectedDays = {};
							var SRSSTiming = {};

							moreLocation.updateRulesDB(params);
							/*$.each(params, function (index) {								
								
								console.log("prop:  " + index + "  ::  value:  " + params[index]);								
								tempData = params[index];
								day = tempData.split("|")[0];
								tempData = tempData.split("|")[1];
								timeSR = tempData.split(":")[0];
								timeSS = tempData.split(":")[1];
								console.log("prop:  Day:  " + day + "  ::  timeSR:  " + timeSR + "  ::  timeSS:  " + timeSS);
								
							});*/							
							
						}
						else
							alert("Location service not found.");
					},
					function (err) {
						alert("Location service not found.");
					}, actions.GET_SR_SS_TIME, [locationObject.latitude, locationObject.longitude]
				);
    },
    
    updateRulesDB : function(params) {
    	 var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 6000000);
    	 db.transaction(getSRSSRec, errorCB, successCB);
    	 
    	 function getSRSSRec(tx){
         	console.log("Get SRSS Records for LED-------------");
         	tx.executeSql('SELECT distinct a.RuleID, a.Name, a.Type, b.DeviceID, a.State, b.StartTime, b.RuleDuration, b.StartAction, b.EndAction, b.DayID, b.Value, b.SensorDuration, b.ZBCapabilityStart, b.ZBCapabilityEnd from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID WHERE b.DeviceID LIKE "%Bridge" and RuleDuration LIKE "%8" OR RuleDuration LIKE "%9" OR RuleDuration LIKE "%1" OR RuleDuration LIKE "%2" OR StartTime LIKE "%1" OR StartTime LIKE "%2";', [],
 			
         	function(tx, results){
 				var len = results.rows.length;
         		console.log("Get SRSS Records-------------Results  "+len);
         		if(len > 0){
 	    			console.log("getSRSSRecords()   results.rows.length:  "+results.rows.length);
 	    			
 		    		for(var i=0;i<len;i++){
 		    			
 		    			$.each(params, function (index) {								
							
							console.log("prop:  " + index + "  ::  value:  " + params[index]);								
							tempData = params[index];
							day = tempData.split("|")[0];
							tempData = tempData.split("|")[1];
							timeSR = tempData.split(":")[0];
							timeSS = tempData.split(":")[1];
							console.log("prop:  Day:  " + day + "  ::  timeSR:  " + timeSR + "  ::  timeSS:  " + timeSS);
							
							console.log("wemoUtil "+wemoUtil.deCodeDays(day)+"---"+results.rows.item(i).DayID);
							if(wemoUtil.deCodeDays(day) == results.rows.item(i).DayID)
							{
								
								//ON Condition
								if(results.rows.item(i).StartAction == "1" && results.rows.item(i).EndAction == "1")
								{
									if(i % 2 != 0)
                        			{
										var tempZBCapabilityStart = results.rows.item(i).ZBCapabilityStart;
										
										if(tempZBCapabilityStart.indexOf("10008") != -1)
										{
											var fadeinArr = tempZBCapabilityStart.split("=");
										    var fadeinArrrVal = fadeinArr[1].split(":");  
										    										    
										    
										    console.log("etnering in if ON"+fadeinArrrVal+"--"+fadeinArrrVal[1]/10);
											if(results.rows.item(i).StartTime % 10 == "1" || results.rows.item(i).StartTime % 10 == "4")
											{
												console.log("etnering in if timeSR ON");
												timeSR =  parseInt(timeSR) + 1;
												
												var timeSRFadein = parseInt(timeSR) - parseInt(fadeinArrrVal[1]/10);
												var ruleID = results.rows.item(i).RuleID;
												var capability1 = "10008";
												var capability2 = "10006";
												
												console.log('UPDATE RULEDEVICES set StartTime = "'+timeSR+'" where RuleID="'+ruleID+'" and ZBCapabilityStart LIKE "%' + capability1 + '%";');
												tx.executeSql('UPDATE RULEDEVICES set StartTime = "'+timeSR+'" where RuleID="'+ruleID+'" and ZBCapabilityStart LIKE "%' + capability1 + '%";',[], errorCB);
												
												console.log('UPDATE RULEDEVICES set StartTime = "'+timeSRFadein+'" where RuleID="'+ruleID+'" and ZBCapabilityStart LIKE "%' + capability2 + '%";');
												tx.executeSql('UPDATE RULEDEVICES set StartTime = "'+timeSRFadein+'" where RuleID="'+ruleID+'" and ZBCapabilityStart LIKE "%' + capability2 + '%";',[], errorCB);
												
											}
											else if(results.rows.item(i).StartTime % 10 == "2" || results.rows.item(i).StartTime % 10 == "5")
											{
												console.log("etnering in if timeSS ON");
												timeSS =  parseInt(timeSS) + 2;
												var timeSSFadein = parseInt(timeSS) - parseInt(fadeinArrrVal[1]/10);
												
												var ruleID = results.rows.item(i).RuleID;
												console.log('UPDATE RULEDEVICES set StartTime = "'+timeSS+'" where RuleID="'+ruleID+'" and ZBCapabilityStart LIKE "%' + capability1 + '%";');
												tx.executeSql('UPDATE RULEDEVICES set StartTime = "'+timeSS+'" where RuleID="'+ruleID+'" and ZBCapabilityStart LIKE "%' + capability1 + '%";',[], errorCB);
												
												console.log('UPDATE RULEDEVICES set StartTime = "'+timeSSFadein+'" where RuleID="'+ruleID+'" and ZBCapabilityStart LIKE "%' + capability2 + '%";');
												tx.executeSql('UPDATE RULEDEVICES set StartTime = "'+timeSSFadein+'" where RuleID="'+ruleID+'" and ZBCapabilityStart LIKE "%' + capability2 + '%";',[], errorCB);
											}
										}
                        			}
								}
								
								//OFF Condition
								
								if(results.rows.item(i).StartAction == "0" && results.rows.item(i).EndAction == "0")
								{
									if(i % 2 == 0)
                        			{
										var tempZBCapabilityEnd = results.rows.item(i).ZBCapabilityEnd;  

										if(tempZBCapabilityEnd.indexOf("10008") != -1)
										{
											var fadeoutArr = tempZBCapabilityEnd.split("=");
										    var fadeoutArrVal = fadeoutArr[1].split(":");  
										    										    
										    
										    console.log("etnering in if OFF"+fadeoutArrVal);
											if(results.rows.item(i).StartTime % 10 == "1" || results.rows.item(i).StartTime % 10 == "4")
											{
												console.log("etnering in if timeSR OFF");
												timeSR =  parseInt(timeSR) + 1;
												
												var timeSRFadeout = parseInt(timeSR) + parseInt(fadeoutArrVal[1]/10);
												var ruleID = results.rows.item(i).RuleID;
												var capability1 = "10008";
												var capability2 = "10006";
												
												console.log('UPDATE RULEDEVICES set StartTime = "'+timeSR+'" where RuleID="'+ruleID+'" and ZBCapabilityEnd LIKE "%' + capability1 + '%";');
												tx.executeSql('UPDATE RULEDEVICES set StartTime = "'+timeSR+'" where RuleID="'+ruleID+'" and ZBCapabilityEnd LIKE "%' + capability1 + '%";',[], errorCB);
												
												console.log('UPDATE RULEDEVICES set StartTime = "'+timeSRFadeout+'" where RuleID="'+ruleID+'" and ZBCapabilityEnd LIKE "%' + capability2 + '%";');
												tx.executeSql('UPDATE RULEDEVICES set StartTime = "'+timeSRFadeout+'" where RuleID="'+ruleID+'" and ZBCapabilityEnd LIKE "%' + capability2 + '%";',[], errorCB);
												
											}
											else if(results.rows.item(i).StartTime % 10 == "2" || results.rows.item(i).StartTime % 10 == "5")
											{
												console.log("etnering in if timeSS OFF");
												timeSS =  parseInt(timeSS) + 2;
												var timeSSFadeout = parseInt(timeSS) + parseInt(fadeoutArrVal[1]/10);
												var capability1 = "10008";
												var capability2 = "10006";
												
												var ruleID = results.rows.item(i).RuleID;
										
												console.log('UPDATE RULEDEVICES set StartTime = "'+timeSS+'" where RuleID="'+ruleID+'" and ZBCapabilityEnd LIKE "%' + capability1 + '%";');
												tx.executeSql('UPDATE RULEDEVICES set StartTime = "'+timeSS+'" where RuleID="'+ruleID+'" and ZBCapabilityEnd LIKE "%' + capability1 + '%";',[], errorCB);
												
												console.log('UPDATE RULEDEVICES set StartTime = "'+timeSSFadeout+'" where RuleID="'+ruleID+'" and ZBCapabilityEnd LIKE "%' + capability2 + '%";');
												tx.executeSql('UPDATE RULEDEVICES set StartTime = "'+timeSSFadeout+'" where RuleID="'+ruleID+'" and ZBCapabilityEnd LIKE "%' + capability2 + '%";',[], errorCB);
												
											}
										}
                        			}
								}
								
								//UNTILL Condition
								
								if(results.rows.item(i).StartAction == "1" && results.rows.item(i).EndAction == "0")
								{
										if(results.rows.item(i).StartTime % 10 == "1" || results.rows.item(i).StartTime % 10 == "4")
										{
											console.log("etnering in if timeSR");
											timeSR =  parseInt(timeSR) + 1;
											var ruleID = results.rows.item(i).RuleID;
											
											console.log("UPDATE RULEDEVICES set StartTime = '"+timeSR+"' where RuleID='"+ruleID+"';");
											tx.executeSql("UPDATE RULEDEVICES set StartTime = '"+timeSR+"' where RuleID='"+ruleID+"';",[], errorCB);													
										}
										else if(results.rows.item(i).StartTime % 10 == "2" || results.rows.item(i).StartTime % 10 == "5")
										{
											console.log("etnering in if timeSS");
											timeSS =  parseInt(timeSS) + 2;
											var ruleID = results.rows.item(i).RuleID;
										
											console.log("UPDATE RULEDEVICES set StartTime = '"+timeSS+"' where RuleID='"+ruleID+"';");
											tx.executeSql("UPDATE RULEDEVICES set StartTime = '"+timeSS+"' where RuleID='"+ruleID+"';",[],errorCB);
										}
								}
								
							}
						});
                             	
 		    		}
                             	
 		    		
         		}
 			}, errorCB);
         }
    	 
    	function successCB(tx){
 	    	//alert("successfully updated");
 	    }
    	 function errorCB(error){
 	    	console.log("Error - "+errorTracker+"  ::  "+error);
 	        console.log("Error - "+errorTracker+"  ::  "+error.message);
 	    }
    	 
    },

    showCurrentLocation : function(strCity, strLatitude, strLongitude){
        wemoUtil.infoLog(moreLocation.TAG, "getLocation for: " + strCity);
        console.log("strCity: "+strCity);
        console.log("strLatitude: "+strLatitude);
        console.log("strLongitude: "+strLongitude);
        cordova.exec(
            function (params) {
                console.log("success call back" + params[1] + " : " + params[0]);
                var homeId = params[1];
                var authCode = params[0];

                console.log("success call back home id: " + homeId);
                console.log("success call back authCode: " + authCode);

                $.ajax({
                    url: cloudAPI.LOCATION_SEARCH + strCity,

                    type: "GET",
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function (data) {
                        console.log("success callback from cloud");
                        var responseXML = (new XMLSerializer()).serializeToString(data);
                        var splitLength = 4000;
                        var length = responseXML.length;
                        var ittr = Math.floor(length/splitLength) + 1;
                        for(var i = 0; i < ittr ; i++){
                            var end = ((i + 1) * splitLength);
                            if(end > length){
                                end = length;
                            }
                            wemoUtil.log(moreLocation.TAG, responseXML.substring(splitLength * i, end));
                        }
                        var locationList = [];
                        $(data).find('cityLocation').each(function (i) {

                            console.log("i: " + i);

                            var country = $(this).find("country").text();
                            var city = $(this).find("city").text();
                            var region = $(this).find("region").text();
                            var regionName = $(this).find("regionName").text();
                            var latitude = $(this).find("latitude").text();
                            var longitude = $(this).find("longitude").text();

                            console.log("city: " + city);
                            console.log("regionName " +regionName);
                            console.log("latitude: "+latitude);
                            console.log("longitude: "+longitude);
                            if ( city == strCity && latitude == strLatitude && longitude == strLongitude ) {
                                var regionDisplay;
                                var currentCityCountryCode;

                                if( country === 'US'){
                                    regionDisplay = region;
                                }else{
                                    regionDisplay = country;
                                }

                                currentCityCountryCode = city + ', ' + regionName + "("+ regionDisplay +")";
                                $('#searchField').val(currentCityCountryCode);
                                nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                return;
                            }
                        });
                        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                    },
                    error: function (xhr, textstatus) {
                        (moreLocation.statusText).html(wemo.items['NoCityFound']);
                        (moreLocation.suggestionList).html('');
                        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                        wemoUtil.infoLog(moreLocation.TAG, 'status: ' + xhr.status);
                        wemoUtil.infoLog(moreLocation.TAG, 'status text: ' + xhr.statusText);
                    }
                });

            },
            function (err) {
                nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                console.log("failure call back");
            },
            "WebServicePlugin",
            "getAuthCode",
            []
        );
    }

};
