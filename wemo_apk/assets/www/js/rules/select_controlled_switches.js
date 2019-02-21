/*
    select_switches.js

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

var TAG = "select_switches.js: ";

$(document).bind('pageinit', function() {
    select_switches.initialize();
});

var select_switches = {

    initialize: function() {
        console.log(TAG + "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    onDeviceReady: function() {
        var self = this;
        $.when(wemoUtil.getDevices(actions.SELECT_SWITCHES), wemoUtil.getDevices(actions.SELECT_INSIGHTS), wemoUtil.getDevices(actions.SELECT_MAKER), wemoUtil.getDevices(actions.SELECT_LED_DEVICES))
            .then(function() {

                select_switches.afterOnDeviceReady();

            }).fail(function() {
                throw ('ERROR');
            });

    },
    afterOnDeviceReady: function() {
        console.log(TAG + "onDeviceReady");
        select_switches.bindEvents();
        //All initialization script goes here
        var networktype = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_NETWORKTYPE);
        var remoteEnable = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_ENABLE);
        var ruleObj = JSON.parse(window.sessionStorage.getItem(sessionStore.RULE_NEW));

        select_switches.selectSwitch(networktype, remoteEnable);

        //To return back to home page: device list tab
        $(".wemo_logo").on("tap", function(e) {
            if (e.target.nodeName != "IMG") {
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }
        });

        $("#rules_container #select_").find('.select_switches_list').on("tap", function() {
            //var tempRule=JSON.parse(window.sessionStorage.getItem(sessionStore.RULE_NEW));
            window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE, $(this).attr("data-udn"));
            window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE_NAME, $(this).text());
            window.sessionStorage.setItem(sessionStore.RULE_NEW, JSON.stringify(ruleObj));
            if (ruleObj.RuleType === "Motion Controlled") {
                wemoUtil.loadUrl(filePath.SENSORS_WHAT_HAPPENS);
            } else {
                wemoUtil.loadUrl(filePath.WHAT_HAPPENS);
            }
        });
    },

    bindEvents: function() {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', select_switches.onOnline, false);
        document.addEventListener('offline', select_switches.onOffline, false);
        document.addEventListener("backbutton", select_switches.onBackPress, false);
        document.addEventListener("pause", select_switches.onPause, false);
        document.addEventListener("resume", select_switches.onResume, false);
    },

    onOffline: function() {
        console.log(TAG + "offLine");
    },

    onOnline: function() {
        console.log(TAG + "onLine");
    },

    onBackPress: function() {
        if ($(".more_tab").is(":visible")) {
            $(".more_tab").hide();
            $('body').find('.modalWindow').transition({
                opacity: 0
            }, 400, function() {
                $(this).removeClass('isOpen');
            });
        } else {
            console.log(TAG + "onBackPress");
            wemoUtil.loadPreviousUrl();
        }
        /*ruleObj.Devices[cd]={};
            delete ruleObj.Devices[cd];*/

    },

    onPause: function() {
        console.log(TAG + "onPause");
    },

    onResume: function() {
        console.log(TAG + "onResume");
    },

    reportError: function(e) {
        console.log(TAG + "Plugin Error!!!!   " + e);
    },
    deviceListBorder: function() {
        var switch_list = $("#select_").find(".select_switches_list").length;
        if (switch_list === 1) {
            $(".select_switches_list").addClass("more_li_clone");
        } else if (switch_list === 2) {
            $(".select_switches_list:first-child").addClass('more_li_clone more_li_clone_top');
            $(".select_switches_list:last-child").addClass('more_li_clone more_li_clone_bottom');
        } else if (switch_list >= 3) {
            $(".select_switches_list:first-child").addClass('more_li_clone more_li_clone_top');
            $(".select_switches_list:last-child").addClass('more_li_clone more_li_clone_bottom');
            $(".select_switches_list").not(".select_switches_list:first-child, .select_switches_list:last-child").addClass('more_li_clone more_li_clone_no_radius');
        }
    },

    showDevices: function(action_device_type) {
        var params = wemoUtil.getDevices(action_device_type);

        if (params != null && params.length > 0) {
            var html = "";
            $.each(params, function(inx) {
                html = html + '<div class="select_switches_list" data-udn="' + params[inx].udn + '"><span class="more_li_text_div text_strong">' + params[inx].friendlyName + '</span></div>';
            });

            $('#rules_container #select_').append($(html));

            select_switches.deviceListBorder();
            return params.length;
        } else {
            return 0;
        }
    },
    selectSwitch: function(networktype, remoteEnable) {
        console.log("success creating the table structures");
        if (networktype == networkType.HOME_NETWORK || networktype == null) {
            var numSwitches;
            console.log("Local Mode...");

            $('#rules_container #select_').html("");
            numSwitches = this.showDevices(actions.SELECT_SWITCHES);

            trace("numSwitches = ", numSwitches);
            if (numSwitches == 0) {
                alert("No devices detected");
            }
        } else if (networktype == networkType.REMOTE_WIFI || networktype == networkType.REMOTE_MOBILE) {
            if (remoteEnable) {

                var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);

                if (arraySwitchObjects.length > 0) {
                    var html = "";
                    $('#rules_container #select_').html("");
                    $.each(arraySwitchObjects, function(inx) {
                        //alert("UDN : "+arraySwitchObjects[inx][key.DEVICE_UDN]+" "+arraySwitchObjects[inx][key.DEVICE_FRIENDLY_NAME]);
                        html = html + '<div class="select_switches_list" data-udn="' + arraySwitchObjects[inx][key.DEVICE_UDN] + '"><span class="more_li_text_div text_strong">' + arraySwitchObjects[inx][key.DEVICE_FRIENDLY_NAME] + '</span></div>';
                    });

                    $('#rules_container #select_').html(html);
                    select_switches.deviceListBorder();
                } else alert("No devices detected");

            } else {
                navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {
                    loadUrlTimeoutValue: 60000
                });
            }
        }

    },


};