/*
 rule_name.js

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

var TAG = "rule_name.js: ";

$(document).bind('pageinit', function () {
    rule_name.initialize();
});

$(window).unload(function(){
		if(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW).RuleType == 'Notify Me')
		window.sessionStorage.setItem(sessionStore.GCM_SENSOR, "1");
		else if(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW).RuleType == sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE){
			window.sessionStorage.setItem(sessionStore.GCM_MAKER_SENSOR, "1");
		}
		else if(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW).RuleType == sessionStore.NOTIFY_KEYCHAIN_PRESENCE_RULE){
			window.sessionStorage.setItem(sessionStore.GCM_KEYCHAIN_PRESENCE, "1");
		}
});
var rule_name = {

    initialize: function () {
        console.log(TAG + "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    onDeviceReady: function () {
        console.log(TAG + "onDeviceReady");
        rule_name.bindEvents();
        //All initialization script goes here
        var rulObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);

        $('#message').focus();
        nativeUtilPlugin.execute(null, rule_name.reportError, actions.OPEN_SOFT_KEYBOARD, []);
        $("#message").text(rulObj.NotifyMessage);
		
        //To return back to home page: device list tab
        $(".wemo_logo").on("tap", function (e) {
            if (e.target.nodeName != "IMG") {
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }
        });

        $("#invalidRuleMessagePopupOK").on('click', function () {
            $("#invalidRuleMessagePopup").popup('close');
        });

        $("#rule_name_save_btn").on('tap', function () {
        	nativeUtilPlugin.execute(null,null,actions.CLOSE_SOFT_KEYBOARD,[]);
			var messageValidate = $.trim($("#message").val());
           // var messagePattern = /[A-Za-z0-9._-\s]{1,30}/g;
            if (messageValidate == "") {
                $("#invalidRuleMessagePopup .popup_content span").empty().html(wemo.items['EmptyMessage_AlertMessage']);
                $("#invalidRuleMessagePopup").popup('open');
            } else if (messageValidate.length <= 150) {

               // var res_validate = messageValidate.match(messagePattern);
                var res = messageValidate;
                for (var key in messageValidate) {
                    res = res.replace(messageValidate[key], "");
                    
                    if(messageValidate[key] == "<")
                    {
                     messageValidate[key] = messageValidate[key].replace(messageValidate[key], "&lt");
                    }
                    else if(messageValidate[key] == ">")
                    {
                     messageValidate[key] = messageValidate[key].replace(messageValidate[key], "&gt");
                    }
                }

                console.log("message validate: "+messageValidate);
                if (res == "") {
                    rulObj.NotifyMessage = messageValidate;
					rulObj.Message = rulObj.NotifyMessage;
					Object.keys(rulObj.Devices).length == 1 ? (rulObj.NM_FlagOne = true, rulObj.NM_FlagMult = false) : (rulObj.NM_FlagMult = true, rulObj.NM_FlagOne = false);
					wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, rulObj);
					var wemo_rule_type = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_TYPE);

					if (wemo_rule_type == 'edit_notify_rule') {
						wemoUtil.loadUrl(filePath.EDIT_NOTIFY_RULE);
					}
					else {
						if(wemo_rule_type == 'Notify Me')
						window.sessionStorage.setItem(sessionStore.GCM_SENSOR, "1");
						else if(wemo_rule_type == sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE){
							window.sessionStorage.setItem(sessionStore.GCM_MAKER_SENSOR, "1");
						}
						else if(wemo_rule_type == sessionStore.NOTIFY_KEYCHAIN_PRESENCE_RULE){
							window.sessionStorage.setItem(sessionStore.GCM_KEYCHAIN_PRESENCE, "1");
						}
						wemoUtil.loadUrl(filePath.NOTIFY_RULE);
					}
                } else {
                    alert(wemo.items['InvalidMessage_AlertMessage']);
                }
            } else {
				alert(wemo.items['InvalidMessage_Alert']);
			}
        });

        $("#rule_name_cancel_btn").on('tap', function () {
            nativeUtilPlugin.execute(null,null,actions.CLOSE_SOFT_KEYBOARD,[]);
            wemoUtil.loadPreviousUrl();
        });

    },

    bindEvents: function () {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', rule_name.onOnline, false);
        document.addEventListener('offline', rule_name.onOffline, false);
        document.addEventListener("backbutton", rule_name.onBackPress, false);
        document.addEventListener("pause", rule_name.onPause, false);
        document.addEventListener("resume", rule_name.onResume, false);
    },

    onOffline: function () {
        console.log(TAG + "offLine");
    },

    onOnline: function () {
        console.log(TAG + "onLine");
    },

    onBackPress: function () {
        if ($(".more_tab").is(":visible")) {
            $(".more_tab").hide();
            $('body').find('.modalWindow').transition({opacity: 0}, 400, function () {
                $(this).removeClass('isOpen');
            });
        }
        else {
            console.log(TAG + "onBackPress");
            wemoUtil.loadPreviousUrl();
        }
        if(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW).RuleType == sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE){
        	window.sessionStorage.setItem(sessionStore.GCM_MAKER_SENSOR, "1");
        } 
        else if(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW).RuleType == sessionStore.NOTIFY_KEYCHAIN_PRESENCE_RULE){
        	window.sessionStorage.setItem(sessionStore.GCM_KEYCHAIN_PRESENCE, "1");
        }
    },

    onPause: function () {
        console.log(TAG + "onPause");
        nativeUtilPlugin.execute(null,null,actions.CLOSE_SOFT_KEYBOARD,[]);
    },

    onResume: function () {
        console.log(TAG + "onResume");
    },

    reportError: function (e) {
        console.log(TAG + "Plugin Error!!!!   " + e);
    }

};
