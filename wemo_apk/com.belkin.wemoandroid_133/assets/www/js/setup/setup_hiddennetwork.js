/*
    setup_hiddennetwork.js

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
var TAG = "setup_hiddennetwork.js: "; //	connect_to_ifttt

$(document).bind('pageinit', function () {
    $('.ui-header').css({
        'border-bottom': '1px solid #888 !important'
    });
    $('.sub_header').css({
        'z-index': 3,
        'border-top': '1px solid #73D44C !important'
    });
    var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));
    setupWifiHiddenNetwork.initialize();
});

var setupWifiHiddenNetwork = {

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
            var $parent = setupWifiHiddenNetwork.topControllers;
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

        setupWifiHiddenNetwork.topControllers.containers.moreMenu = {
            shell: $('header.main_header > span.more_tab_icon'),
            itemsToHide: $('#more_new_firmware,#more_setup_another_device,#more_remote_access,#more_connect_to_IFTTT,#more_settings_and_about,#more_tell_us_what_you_think,#more_help_center,#find_and_pair_Newdevice,#more_WeMoCommunity,#more_SupportArticles,#dropdown_hidden_network'),
            itemsToShow: $('#dropdown_help,#setup_help'),
        };
        setupWifiHiddenNetwork.topControllers.containers.buttonBar = {
            shell: $('header.main_header > span.headerBtns'),
            help: $('#pairing_help_link')
        };
        setupWifiHiddenNetwork.topControllers.initiate(setupWifiHiddenNetwork.topControllers.types.MORE_MENU);

        setupWifiHiddenNetwork.bindEvents();
        //start

        $('#setup_sub_header').html(wemo.items[window.sessionStorage.getItem("SETUP_TITLE")]);

        $('#ap_hidden_network_text_input').focus();
        nativeUtilPlugin.execute(null, setupWifiHiddenNetwork.reportError, actions.OPEN_SOFT_KEYBOARD, []);

        $('#security_option').on("change", function () {
            if ($('#security_option>option:selected').val() == 'Open') {
                $('#ap_hidden_network_password_container').addClass('none');
            } else {
                $('#ap_hidden_network_password_container').removeClass('none');
            }
        });

        $('input[name="ap_show_password"]').on('click', function () {
            if ($(this).is(':checked')) {
                $('input[name="ap_show_password_input"]').prop('type', 'text');
            } else {
                $('input[name="ap_show_password_input"]').prop('type', 'password');
            }
        });

        $("#ap_hideNetwork_cancel_btn").on('tap', function () {
            wemoUtil.loadPreviousUrl();
        });

        $("#ap_hideNetwork_save_btn").on('tap', function () {
            console.log($('#ap_hidden_network_text_input').val());
            console.log($('#ap_hidden_network_password_input').val());
            console.log($('#security_option').val());
            var auth;
            var encrypt;
            switch ($('#security_option').val()) {
            case networkSecurity.OPEN:
                auth = networkSecurity.AUTH_OPEN;
                encrypt = networkSecurity.ENCRYPT_OPEN;
                break;
            case networkSecurity.WEP:
                auth = networkSecurity.AUTH_WEP;
                encrypt = networkSecurity.ENCRYPT_WEP;
                break;
            case networkSecurity.WPA:
                auth = networkSecurity.AUTH_WPA;
                encrypt = networkSecurity.ENCRYPT_WPA;
                break;
            case networkSecurity.WPA2:
                auth = networkSecurity.AUTH_WPA2;
                encrypt = networkSecurity.ENCRYPT_WPA2;
                break;
            }

            window.sessionStorage.setItem("sec_ssid", $('#ap_hidden_network_text_input').val());
            window.sessionStorage.setItem("sec_password", $('#ap_hidden_network_password_input').val());
            window.sessionStorage.setItem("sec_securitystrength", auth + "/" + encrypt);
            window.sessionStorage.setItem("sec_channel", networkSecurity.CHANNEL);
            window.sessionStorage.setItem(sessionStore.STARTUP_MODE, startupMode.MANUAL_CONNECT);
            wemoUtil.loadUrl(filePath.INDEX);

        });
        //end

    },

    bindEvents: function () {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', setupWifiHiddenNetwork.onOnline, false);
        document.addEventListener('offline', setupWifiHiddenNetwork.onOffline, false);
        document.addEventListener("backbutton", setupWifiHiddenNetwork.onBackPress, false);
        document.addEventListener("pause", setupWifiHiddenNetwork.onPause, false);
        document.addEventListener("resume", setupWifiHiddenNetwork.onResume, false);
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
