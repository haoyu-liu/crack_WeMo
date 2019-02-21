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
	else if(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW).RuleType == sessionStore.AWAY_MODE)
		window.sessionStorage.setItem(key.AWAY_MODE_EDIT, true);
	else if(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW).RuleType == sessionStore.NOTIFY_KEYCHAIN_PRESENCE_RULE){
		window.sessionStorage.setItem(sessionStore.GCM_KEYCHAIN_PRESENCE, "1");
	}
	else if(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW).RuleType == sessionStore.NOTIFY_DOOR_WINDOW_RULE){
		window.sessionStorage.setItem(sessionStore.GCM_DOOR_WINDOW, true);
	}
});

var rule_name = {

    initialize: function () {
        console.log(TAG + "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    onDeviceReady: function () {
        console.log(TAG + "onDeviceReady");
        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
        rule_name.bindEvents();
        //All initialization script goes here
        var rulObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);

        $('#rule_name').focus();

        //To return back to home page: device list tab
        $(".back_btn").on("tap", function () {
           rule_name.onBackPress();
        });
		
		$("#invalidRuleNamePopupOK").on('click', function () {
            $("#invalidRuleNamePopup").popup('close');
        });
		
        var tempDisRulename = rulObj.RuleName;
        var rulenamepart1 = wemo.items['Rule'];
        tempDisRulename = tempDisRulename.replace("Rule", rulenamepart1);

        tempDisRulename = htmlEscape(tempDisRulename);
        $('#rule_name').val(tempDisRulename);
        $('#rule_name').focus();
        $("#rule_name_save_btn").on('tap', function () {
            nativeUtilPlugin.execute(null,null,actions.CLOSE_SOFT_KEYBOARD,[]);
            var ruleNameValidate = $("#rule_name").val();
               var ruleNamePattern = /[A-Za-z0-9._-\s]+$/;
               var res_validate = ruleNamePattern.test(ruleNameValidate);

            if (ruleNameValidate == "" || !res_validate) {
                $("#invalidRuleNamePopup .popup_content span").html(wemo.items['InvalidName_AlertMessage']);
				$("#invalidRuleNamePopup").popup('open');
            } else if ($.trim($('#rule_name').val()) == '') {
                $("#invalidRuleNamePopup .popup_content span").html(wemo.items['InvalidName_AlertMessage']);
				$("#invalidRuleNamePopup").popup('open');
            } else if (ruleNameValidate.length <= 30) {

            //  var res_validate = ruleNameValidate.match(ruleNamePattern);
                var res = ruleNameValidate;
                for (var key in ruleNameValidate) {
                    res = res.replace(ruleNameValidate[key], "");
                }

                if (res == "") {
                    nativeUtilPlugin.execute(null, null, actions.SHOW_SPLASH_ON_LOADING, []);
                    rulObj.RuleName = $('#rule_name').val();
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, rulObj);
                    if(rulObj.RuleType == 'Notify Me')
                    window.sessionStorage.setItem(sessionStore.GCM_SENSOR, "1");
                    else if(rulObj.RuleType == sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE){
                    	window.sessionStorage.setItem(sessionStore.GCM_MAKER_SENSOR, "1");	
                    }
                    else if(rulObj.RuleType == sessionStore.NOTIFY_KEYCHAIN_PRESENCE_RULE){
                    	window.sessionStorage.setItem(sessionStore.GCM_KEYCHAIN_PRESENCE, "1");	
                    }
                    wemoUtil.loadPreviousUrl();
                } else {
                    $("#invalidRuleNamePopup .popup_content span").empty().html(wemo.items['InvalidName_AlertMessage']);
					$("#invalidRuleNamePopup").popup('open');
                }
            } else {
				$("#invalidRuleNamePopup .popup_content span").empty().html(wemo.items['TooLongRuleName_Alert']);
				$("#invalidRuleNamePopup").popup('open');
			}
        });

        $("#rule_name_cancel_btn").on('tap', function () {
            nativeUtilPlugin.execute(null,null,actions.CLOSE_SOFT_KEYBOARD,[]);
            wemoUtil.loadPreviousUrl();
        });
        
        /********html Escape charactors*********/
        
        function htmlEscape(str) {
            return String(str)
                    .replace('&', /&amp;/g )
                    .replace('"', /&quot;/g)
                    .replace("'", /&#39;/g)
                    .replace('<', /&lt;/g)
                    .replace('>', /&gt;/g);
        }
        
        /********html Escape charactors*********/
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
    },

    onResume: function () {
        console.log(TAG + "onResume");
    },

    reportError: function (e) {
        console.log(TAG + "Plugin Error!!!!   " + e);
    }

};
