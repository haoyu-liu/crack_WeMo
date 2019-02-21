/*
    setup_password.js

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
var TAG = "setup_password.js: "; //	connect_to_ifttt

$(document).bind('pageinit', function () {
    wemoUtil.infoLog(setupWifiPassword.TAG, 'pageinit');
    setupWifiPassword.initialize();
});

var setupWifiPassword = {

    TAG: "setup_password.js",
    password_desired: false,

    initialize: function () {
        console.log(TAG + "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    topControllers: {
        types: {
            MORE_MENU: 'moremenu',
            BUTTON_BAR: 'buttonbar'
        },
        listeners: {
            help: function (e) {
                wemoUtil.loadUrl(filePath.CONNECT_TO_HELP_PAGE);
            }
        },
        containers: {
            moreMenu: null,
            buttonBar: null
        },
        initiate: function (type) {
            var $parent = setupWifiPassword.topControllers;
            switch (type) {
            case $parent.types.MORE_MENU:
                isSetupWorkflow = true;
                console.log($parent.containers.moreMenu.shell.html());
                $parent.containers.moreMenu.shell.show();
                $parent.containers.buttonBar.shell.hide();
                $parent.containers.moreMenu.itemsToHide.addClass('none');
                $parent.containers.moreMenu.itemsToShow.removeClass('none');
                break;
            case $parent.types.BUTTON_BAR:
                isSetupWorkflow = false;
                $parent.containers.moreMenu.shell.hide();
                $parent.containers.buttonBar.shell.show();
                $parent.containers.buttonBar.help.on('pointerdown', $parent.listeners.help);
                break;
            }
        },
    },

    onDeviceReady: function () {
        console.log(TAG + "onDeviceReady");

        setupWifiPassword.topControllers.containers.moreMenu = {
            shell: $('header.main_header > span.more_tab_icon'),
            itemsToHide: $('#more_new_firmware,#more_setup_another_device,#more_remote_access,#more_connect_to_IFTTT,#more_settings_and_about,#more_tell_us_what_you_think,#more_help_center,#find_and_pair_Newdevice,#more_WeMoCommunity,#more_SupportArticles,#dropdown_hidden_network'),
            itemsToShow: $('#dropdown_help,#setup_help'),
        };
        setupWifiPassword.topControllers.containers.buttonBar = {
            shell: $('header.main_header > span.headerBtns'),
            help: $('#pairing_help_link')
        };
        setupWifiPassword.topControllers.initiate(setupWifiPassword.topControllers.types.MORE_MENU);

        setupWifiPassword.bindEvents();

        //start
        var ssid = window.sessionStorage.getItem("sec_ssid");
        if (ssid.indexOf('<') >= 0 || ssid.indexOf('>') >= 0) {
            actualSSID = wemoUtil.handleSpecialChars(ssid);
        } else {
            actualSSID = ssid;
        }
        $('#selectedWifiNetworkSsid').html(actualSSID);
        
        $('header.main_header span').html(window.sessionStorage.getItem('device_friendly_name') + ' ' + wemo.items['Setup'])

        $('#ap_password_input').focus();
        nativeUtilPlugin.execute(null, setupWifiPassword.reportError, actions.OPEN_SOFT_KEYBOARD, []);

        $('input[name="ap_show_password"]').on('click', function () {
            if ($(this).is(':checked')) {
                $('input[name="ap_show_password_input"]').prop('type', 'text');
            } else {
                $('input[name="ap_show_password_input"]').prop('type', 'password');
            }
            setTimeout(function () {
                $('#ap_password_input').focus();
                nativeUtilPlugin.execute(null, setupWifiPassword.reportError, actions.OPEN_SOFT_KEYBOARD, []);
            }, 300);

            console.log(document.getElementById("ap_password_show") + "  ::  " + $('input[name="ap_show_password_input"]'));
        });

        $("#ap_password_cancel_btn").on('pointerdown', function () {
            wemoUtil.loadPreviousUrl();
        });

        //Functionality to enable the Save button only when the password has minimum 1 character
        $('#ap_password_input').on('keyup', function() {
            if ($(this).val().length > 0) {
        	$('#ap_password_save_btn').css('color', '#73d44c');
        	password_desired = true;
            } else {
        	$('#ap_password_save_btn').css('color', '#999');
        	password_desired = false;
            }
        });

        $("#ap_password_save_btn").on('tap', function () {
            if (password_desired) {
        	nativeUtilPlugin.execute(null, null, actions.CLOSE_SOFT_KEYBOARD, []);
        	var password = $('#ap_password_input').val();
        	var desired = password.match(/[\s,`]/gi, '');
        	if (desired) {
        	    setupPlugin.execute(function (firmware) {
        		console.log("the firmware version is ::" + firmware);
        		if (firmware.indexOf("2176") > 0 || firmware.indexOf("2725") > 0) {
        		    setTimeout(function () {
        			$("#password_unsupported_char_popup").popup("open");
        		    }, 300);
        		} else {
        		    window.sessionStorage.setItem("sec_password", $('#ap_password_input').val());
        		    $('#ap_password_input').blur();
        		    window.sessionStorage.setItem(sessionStore.STARTUP_MODE, startupMode.MANUAL_CONNECT);
        		    wemoUtil.loadUrl(filePath.INDEX);
        		}
        	    }, null, ACTION_GET_FIRMWARE_VERSION, []);
        	} else {
        	    window.sessionStorage.setItem("sec_password", $('#ap_password_input').val());
        	    $('#ap_password_input').blur();
        	    window.sessionStorage.setItem(sessionStore.STARTUP_MODE, startupMode.MANUAL_CONNECT);
        	    wemoUtil.loadUrl(filePath.INDEX);
        	}
            }
        });

        $(".backbutton").on("tap", setupWifiPassword.onBackPress);

        $("#password_unsupported_ok_button").on("tap", function (e) {
            $("#password_unsupported_char_popup").popup('close');
            e.preventDefault();
        });
        //end

    },

    bindEvents: function () {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', setupWifiPassword.onOnline, false);
        document.addEventListener('offline', setupWifiPassword.onOffline, false);
        document.addEventListener("backbutton", setupWifiPassword.onBackPress, false);
        document.addEventListener("pause", setupWifiPassword.onPause, false);
        document.addEventListener("resume", setupWifiPassword.onResume, false);
    },

    onOffline: function () {
        console.log(TAG + "offLine");
    },

    onOnline: function () {
        console.log(TAG + "onLine");
    },

    onBackPress: function () {
        console.log(TAG + "onBackPress");
        wemoUtil.loadPreviousUrl();
    },

    onPause: function () {
        console.log(TAG + "onPause");
    },

    onResume: function () {
        console.log(TAG + "onResume");
    },

    reportError: function (e) {
        console.log(TAG + "Plugin Error!!!!   " + e);
    }

};
