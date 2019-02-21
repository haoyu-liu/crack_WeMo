/*
    no_network.js

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
var TAG = "no_network.js ";

$(document).bind('pageinit', function() {
	noNetwork.initialize();
});


var noNetwork = {

		initialize: function() {
			console.log(TAG + "initialize");
			this.bindEvents();
		},

		bindEvents: function() {
			console.log(TAG + "bind events");
			document.addEventListener('deviceready', this.onDeviceReady, false);
			document.addEventListener('load', this.onLoad, false);
			
		},

		onDeviceReady: function() {
			console.log(TAG + "device ready");
			document.addEventListener('offline', noNetwork.onOffline, false);
			document.addEventListener('online', noNetwork.onOnline, false);
			document.addEventListener("backbutton", noNetwork.onBackPress, false);
			document.addEventListener("resume", noNetwork.onResume, false);
			
			 nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
			$("#no_network_dialog").popup("open");
			
			$('#btn_try_again').on('pointerdown',function(){
				console.log(TAG + "Try Again");
			});
			
			$('#btn_connect_to_wifi').on('pointerdown',function(){
				$('#no_network_dialog').hide();
				noNetwork.openWiFiSettings();
			});
			
			$('#hidden_btn').on('click',function(){
				var $this = $( this ),
		        theme = $this.jqmData( "theme" ) || $.mobile.loader.prototype.options.theme,
		        msgText = $this.jqmData( "msgtext" ) || $.mobile.loader.prototype.options.text,
		        textVisible = $this.jqmData( "textvisible" ) || $.mobile.loader.prototype.options.textVisible,
		        textonly = !!$this.jqmData( "textonly" );
		        html = $this.jqmData( "html" ) || "";
		      $.mobile.loading( 'show', {
		          text: msgText,
		          textVisible: textVisible,
		          theme: 'a',
		          textonly: textonly,
		          html: html
		      });
		      
		    
		      
		      setTimeout(function(){
		    	  setupPlugin.execute(function(status){
						if(status === "true"){
							navigator.app.loadUrl("file:///android_asset/www/index.html", {loadUrlTimeoutValue: 60000});
						} else {
							$('#no_network_dialog').show();
						}
					},function(){},ACTION_IS_NETWORK_CONNECTED,[]);
		    	  $.mobile.loading( 'hide')
		      }, 10)
			});
			
		},

		openWiFiSettings: function() {
			setupPlugin.execute(noNetwork.reportSuccess,noNetwork.reportError,ACTION_OPEN_WIFI_SETTINGS,[]);
		},

		onBackPress: function() {
			console.log(TAG + "back button pressed");
			//navigator.app.clearHistory();
			setupPlugin.execute(null,null,ACTION_STOP_UPNP_SERVICE,[]);
			navigator.app.exitApp();
			
		},
		
		onResume: function() {
			console.log(TAG + "no network resumed");
			$('#hidden_btn').trigger('click');
		},

		onLoad: function() {
			console.log(TAG + "onLoad");
		},

		onOffline: function() {
			console.log(TAG + "offLine");
		},

		onOnline: function() {
			console.log(TAG + "onLine");
		},
		
		reportSuccess: function() {
			console.log(TAG + "Success!!!!");
		},
		
		reportError: function() {
			console.log(TAG + "Error!!!!");
		}



};