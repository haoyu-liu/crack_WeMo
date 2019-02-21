/*
    setup_name.js

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
var TAG = "setup_name.js ";

$(document).bind('pageinit', function() {
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
    setupName.initialize();
});


var setupName = {

    initialize: function() {
        console.log(TAG + "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    onDeviceReady: function() {
        console.log(TAG + "device ready");
        setupName.bindEvents();
        console.log("old friendly name: " + window.sessionStorage.getItem("device_friendly_name"));
        $('#setup_friendly_name').val(window.sessionStorage.getItem("device_friendly_name"));

        $('#setup_friendly_name').focus();

        $('#set_name_done_btn').on('pointerdown', function() {
            var friendlyName = $("#setup_friendly_name").val();

            if ($.trim(friendlyName) == "") {
                $("#invalidNamePopup").popup('open');
            } else {
                if (($('#setup_friendly_name').val()) === window.sessionStorage.getItem("device_friendly_name")) {
                    console.log("name not changed");
                    navigator.app.backHistory();
                } else {
                    /* WEMO-23997 - don't allow special characters, except trademark */
                    var desired = friendlyName.match(/[^\w.\s-\/\<\>]/gi, '');
                    if (!desired || (desired.length === 1 && desired[0] === '®')) {
                        //Fix for WEMO-20322 KitKat with maxlength=30
                        var device_name = $('#setup_friendly_name').val();
                        if (device_name.length <= 30) {
                            console.log("new friendly name: " + $('#setup_friendly_name').val());
                            setupPlugin.execute(function(result) {
                                    console.log("set friendly name: " + result.ChangeFriendlyName);


                                }, null,
                                ACTION_SET_FRIENDLY_NAME, [$('#setup_friendly_name').val()]);

                            window.sessionStorage.setItem("device_friendly_name", $('#setup_friendly_name').val());
                            window.sessionStorage.setItem("IsFriendlyName", 1);
                            navigator.app.backHistory();
                        } else {
                            $("#tooLongRuleNamePopup").popup('open');
                        }
                    } else {
                        $("#invalidNamePopup").popup('open');
                    }
                }
            }
        });

        $('#set_name_cancel_btn').on('pointerdown', function() {
            navigator.app.backHistory();
        });

        $("#setup_friendly_name").bind("keypress", function(event) {
            if (event.charCode != 0) {
                var regex = new RegExp("[A-Za-z0-9. _-]+");
                var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
                if (!regex.test(key) && event.which != 13) {
                    $("#invalidNamePopup").popup('open');
                    event.preventDefault();
                    return false;
                }
            }
        });

        $("#invalidNamePopupOK").on('click', function() {
            $("#invalidNamePopup").popup('close');
        });

        $("#tooLongRuleNamePopupOK").on('click', function() {
            $("#tooLongRuleNamePopup").popup('close');
        });
    },

    bindEvents: function() {
        console.log(TAG + "bind events");
        document.addEventListener('offline', setupName.onOffline, false);
        document.addEventListener('online', setupName.onOnline, false);
        document.addEventListener("backbutton", setupName.onBackPress, false);
        document.addEventListener("resume", setupName.onResume, false);

    },

    onBackPress: function() {
        console.log(TAG + "back button pressed");
        navigator.app.backHistory();
    },

    onResume: function() {
        console.log(TAG + "resumed");
    },

    onOffline: function() {
        console.log(TAG + "offLine");
    },

    onOnline: function() {
        console.log(TAG + "onLine");
    },

    reportError: function() {
        console.log(TAG + "Error!!!!");
    }



};