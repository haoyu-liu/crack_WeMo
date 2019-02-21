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
	
    moreTemperature.initialize();
});

var moreTemperature = {

    TAG : 'more_temperature.js: ',

    statusText : {},
    suggestionList : {},
    searchField : {},
    /*
	 * Initialize function
	 */
    initialize : function() {
    	wemoUtil.infoLog(moreTemperature.TAG,  "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
        
    },
    
    onDeviceReady : function() {
    	/*
    	 * Redirects to device list
         * @param e {jQuery element}
    	 */
    	$(".wemo_logo").on("tap", function(e) {
			if ( e.target.nodeName!= "IMG" ) {				
				wemoUtil.loadUrl(filePath.DEVICE_LIST);
			}
		});
    	/*
    	 * Event for change the style of the selected temp unit
    	 */
    	$(".degrees").on("tap", function() {
    		$(".degrees").removeClass("currentTemp");
    		$(this).addClass("currentTemp");
    	});
    	/*
    	 * Event for Cancel button
    	 */
    	$("#temperature_cancel_btn").on('click', function(){
    		wemoUtil.loadPreviousUrl();
    	});
    	/*
    	 * Event for Cancel button
    	 */
    	$("#temperature_submit_btn").on('click', function(){
    		var data;
    		if ( $(".cUnit").hasClass("currentTemp") ) {
    			data = {temperature:{value:"C"}};
    	    }else{
    	    	data = {temperature:{value:"F"}};
    	    }
    		//Saving the selected global setting to a session storage
    		window.sessionStorage.setItem("globalsettings",JSON.stringify(data));
    		wemoUtil.loadPreviousUrl();
    		
    	});
    	
    },
   /*
    * Bindings
    */
    bindEvents : function() {
        wemoUtil.infoLog(moreTemperature.TAG,  "bindEvents");
        document.addEventListener('online', moreTemperature.onOnline, false);
        document.addEventListener('offline', moreTemperature.onOffline, false);
        document.addEventListener("backbutton", moreTemperature.onBackPress, false);
        document.addEventListener("pause", moreTemperature.onPause, false);
    },
    /*
     * Offline function
     */
    onOffline : function() {
        wemoUtil.infoLog(moreTemperature.TAG, "offLine");
    },
    /*
     * Online function
     */
    onOnline : function() {
        wemoUtil.infoLog(moreTemperature.TAG, "onLine");
    },
    /*
     * Back Function
     */
    onBackPress : function() {
        if ($(".more_tab").is(":visible")) {
            $(".more_tab").hide();
            $('body').find('.modalWindow').transition({opacity:0},400, function(){
                $(this).removeClass('isOpen');
            });
    	}
    	else {
	        
    	}
    },
    /*
     * Pause Function
     */
    onPause : function() {
        wemoUtil.infoLog(moreTemperature.TAG,  "onPause");
    },
    /*
     * Resume Function
     */
    onResume : function() {
        wemoUtil.infoLog(moreTemperature.TAG, "onResume");
    },
    /*
     * Error Function
     */
    reportError : function(e) {
        wemoUtil.infoLog(moreTemperature.TAG, "Plugin Error!!!!   " + e);
    }

};
