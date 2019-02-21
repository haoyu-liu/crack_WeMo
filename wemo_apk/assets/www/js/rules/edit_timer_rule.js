/*
    edit_timer_rule.js

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

var TAG = "edit_timer_rule.js: ";

$(document).bind('pageinit', function() {
    edit_timer_rule.initialize();
});

var edit_timer_rule = {
    initialize: function() { 
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    onDeviceReady: function() {
        var self = this;
        if (!isRemoteEnabled) {
        $.when(wemoUtil.getDevices(actions.SELECT_SWITCHES), wemoUtil.getDevices(actions.SELECT_INSIGHTS), wemoUtil.getDevices(actions.SELECT_MAKER), wemoUtil.getDevices(actions.SELECT_LED_DEVICES))
            .then(function() {

                edit_timer_rule.afterOnDeviceReady();

            }).fail(function() {
                throw ('ERROR');
            });
        }else{
        	edit_timer_rule.afterOnDeviceReady();
        }
    },
    afterOnDeviceReady: function() { 
        var av_switches = {},
            av_sensors = {};
        var networktype = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_NETWORKTYPE);
        var remoteEnable = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_ENABLE);
        var tempSelectedDayOrRange = "";

        //To return back to home page: device list tab
        $(".wemo_logo").on("tap", function(e) {
            if (e.target.nodeName != "IMG") {
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }
        });

        if (networktype == networkType.HOME_NETWORK || networktype == null) {
            console.log("Local Mode...");
            // ******* Validate available and selected switches list ******* //    

            var params = wemoUtil.getDevices(actions.SELECT_SWITCHES);
            $.each(params, function(inx) {
                av_switches['"' + params[inx].udn + '"'] = params[inx].friendlyName;
            });

            params = wemoUtil.getDevices(actions.SELECT_INSIGHTS);
            $.each(params, function(inx) {
                av_switches['"' + params[inx].udn + '"'] = params[inx].friendlyName;
            });

            edit_timer_rule.populate(av_switches, networktype, remoteEnable);

        } else if (networktype == networkType.REMOTE_WIFI || networktype == networkType.REMOTE_MOBILE) {
            if (remoteEnable) {
                var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
                console.log("Switch count :: " + arraySwitchObjects.length);

                if (arraySwitchObjects.length > 0) {
                    $.each(arraySwitchObjects, function(inx) {
                        av_switches['"' + arraySwitchObjects[inx][key.DEVICE_UDN] + '"'] = arraySwitchObjects[inx][key.DEVICE_FRIENDLY_NAME];
                    });

                    edit_timer_rule.populate(av_switches, networktype, remoteEnable);
                    // rule_details.deviceListBorder();
                } else {
                    console.log("No switches detected");
                    edit_timer_rule.populate(av_switches, networktype, remoteEnable);
                }

            } else {
                navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {
                    loadUrlTimeoutValue: 60000
                });
            }
        }

    },

    populate: function(av_switches, networktype, remoteEnable) {
        edit_timer_rule.bindEvents();
        var editRule = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);

        /**************** Fallback object of RULE_NEW ::  Edit Mode ******************/
        wemoUtil.setJSONObjectToSessionStorage(sessionStore.FALL_BACK, editRule);
        //alert(editRule.When.StartTime+'---'+editRule.When.EndTime);

        window.sessionStorage.setItem(sessionStore.RULE_TYPE, "edit_timer_rule");
        var deviceList = "";

        if (Object.keys(editRule.Devices).length > 0) {
            var currentSwitchList = [];
            for (key in editRule.Devices) {
                //var state="Do Nothing";
                currentSwitchList.push(key);
                var state = wemo.items['AfterMotionNothing'];
                if (editRule.Devices[key].StartAction == "1") {
                    //state="Turns ON";
                    state = wemo.items['AfterMotionOn'];
                    editRule.Devices[key].EndAction = 0;
                } else if (editRule.Devices[key].StartAction == "0") {
                    //state="Turns OFF";
                    state = wemo.items['AfterMotionOff'];
                    editRule.Devices[key].EndAction = 1;
                }
                var friendlyName = '';
                if (av_switches['"' + key + '"'] == undefined) /*friendlyName="Switch not present";*/ friendlyName = wemo.items['SwitchNotFound'];
                else friendlyName = av_switches['"' + key + '"'];

                deviceList += '<li data-udn="' + key + '" data-fname="' + friendlyName + '" class="selected_device_list select_switches_middle">' +
                    '<div><span class="more_li_text_div text_strong" localString="true">' + friendlyName + '</span>' +
                    '<span class="more_li_text_right" localString="true">' + state + '</span>' +
                    '</div></li>';

            }

        }

        edit_timer_rule.hideWhatHappen(networktype, remoteEnable, editRule);

        console.log(":Device Length:: " + Object.keys(editRule.Devices).length);


        editRule.When.EndTime = parseInt(editRule.When.StartTime) + parseInt(editRule.When.RuleDuration);
        if (editRule.When.EndTime > timestamp.MAX_HOUR) {
            editRule.When.EndTime = editRule.When.EndTime - timestamp.MAX_HOUR;
        }

        var rulenameObj = editRule.RuleName;
        var searchRule = rulenameObj.search("Rule");
        var tempDisRulename = "";

        if (searchRule != -1 || searchRule == false) {
            var rulenamepart1 = wemo.items['Rule'];
            tempDisRulename = rulenameObj.replace("Rule", rulenamepart1);
        } else {
            tempDisRulename = rulenameObj;
        }

        $("#timer_rule_rule_name .more_li_text_right").text(tempDisRulename);

        //----------------------  Sunrise or Sunset  -------------------------------//

        var tempStartTime = editRule.When.StartTime;
        if (tempStartTime % 10 == 1) {
            editRule.When.StartSRSS = "Sunrise";
        } else if (tempStartTime % 10 == 2) {
            editRule.When.StartSRSS = "Sunset";
        }

        var tempEndTime = "" + editRule.When.RuleDuration;
        if (tempEndTime % 10 == 1) {
            editRule.When.EndSRSS = "Sunrise";
        } else if (tempEndTime % 10 == 2) {
            editRule.When.EndSRSS = "Sunset";
        }
        //alert(editRule.When.StartSRSS+'---'+editRule.When.EndSRSS);

        //----------------------  Sunrise or Sunset  -------------------------------//
        editRule.When.EndTime = parseInt(editRule.When.StartTime) + parseInt(editRule.When.RuleDuration);
        if (editRule.When.EndTime > timestamp.MAX_HOUR) {
            editRule.When.EndTime = editRule.When.EndTime - timestamp.MAX_HOUR;
        }
        if ((editRule.When.StartSRSS != undefined && editRule.When.EndSRSS == undefined) || (editRule.When.StartSRSS == undefined && editRule.When.EndSRSS != undefined) || (editRule.When.StartSRSS != undefined && editRule.When.EndSRSS != undefined)) {

            if (Object.keys(editRule.Devices).length > 0) {
                for (key in editRule.Devices) {
                    editRule.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, editRule);
                }
            }
        }
        //alert(editRule.When.StartSRSS+'---'+editRule.When.EndSRSS);
        if ((editRule.When.StartSRSS == "" || editRule.When.StartSRSS == undefined) && (editRule.When.EndSRSS == "" || editRule.When.EndSRSS == undefined)) {
            $("#timer_rule_when .select_time").text(wemoUtil.convertMillisecondsToAMPM(editRule.When.StartTime) + " - " + wemoUtil.convertMillisecondsToAMPM(editRule.When.EndTime));
        } else if ((editRule.When.StartSRSS == "" || editRule.When.StartSRSS == undefined) && (editRule.When.EndSRSS != "" || editRule.When.EndSRSS != undefined)) {

            if (editRule.When.EndSRSS == "Sunrise") {
                var tempEndSRSS = wemo.items['SunRise'];
            } else if (editRule.When.EndSRSS == "Sunset") {
                var tempEndSRSS = wemo.items['SunSet'];
            } else {
                var tempEndSRSS = editRule.When.EndSRSS;
            }

            $("#timer_rule_when .select_time").text(wemoUtil.convertMillisecondsToAMPM(editRule.When.StartTime) + " - " + tempEndSRSS);
        } else if ((editRule.When.StartSRSS != "" || editRule.When.StartSRSS != undefined) && (editRule.When.EndSRSS == "" || editRule.When.EndSRSS == undefined)) {

            if (editRule.When.StartSRSS == "Sunrise") {
                var tempStartSRSS = wemo.items['SunRise'];
            } else if (editRule.When.StartSRSS == "Sunset") {
                var tempStartSRSS = wemo.items['SunSet'];
            } else {
                var tempStartSRSS = editRule.When.StartSRSS;
            }

            $("#timer_rule_when .select_time").text(tempStartSRSS + " - " + wemoUtil.convertMillisecondsToAMPM(editRule.When.EndTime));
        } else if ((editRule.When.StartSRSS != "" || editRule.When.StartSRSS != undefined) && (editRule.When.EndSRSS != "" || editRule.When.EndSRSS != undefined)) {

            if (editRule.When.EndSRSS == "Sunrise") {
                var tempEndSRSS = wemo.items['SunRise'];
            } else if (editRule.When.EndSRSS == "Sunset") {
                var tempEndSRSS = wemo.items['SunSet'];
            } else {
                var tempEndSRSS = editRule.When.EndSRSS;
            }

            if (editRule.When.StartSRSS == "Sunrise") {
                var tempStartSRSS = wemo.items['SunRise'];
            } else if (editRule.When.StartSRSS == "Sunset") {
                var tempStartSRSS = wemo.items['SunSet'];
            } else {
                var tempStartSRSS = editRule.When.StartSRSS;
            }

            $("#timer_rule_when .select_time").text(tempStartSRSS + " - " + tempEndSRSS);
        }

        if (editRule.SelectedDayOrRange == "Weekday" || editRule.SelectedDayOrRange == "Weekend" || editRule.SelectedDayOrRange == "Daily") {
            tempSelectedDayOrRange = editRule.SelectedDayOrRange;
            if (tempSelectedDayOrRange == "Weekday") {
                tempSelectedDayOrRange = wemo.items['WeekdaysNoDetails'];
            } else if (tempSelectedDayOrRange == "Weekend") {
                tempSelectedDayOrRange = wemo.items['WeekendsNoDetails'];
            } else {
                tempSelectedDayOrRange = wemo.items[tempSelectedDayOrRange];
            }
        } else if (editRule.SelectedDayOrRange == "Weekdays" || editRule.SelectedDayOrRange == "Weekends" || editRule.SelectedDayOrRange == "Daily") {
            tempSelectedDayOrRange = editRule.SelectedDayOrRange;
            if (tempSelectedDayOrRange == "Weekdays") {
                tempSelectedDayOrRange = wemo.items['WeekdaysNoDetails'];
            } else if (tempSelectedDayOrRange == "Weekends") {
                tempSelectedDayOrRange = wemo.items['WeekendsNoDetails'];
            } else {
                tempSelectedDayOrRange = wemo.items[tempSelectedDayOrRange];
            }
        } else {
            var strDays = editRule.SelectedDayOrRange;
            var arrDays = strDays.split("-");
            var displaySelectedVal = [];
            tempSelectedDayOrRange = "";

            if (arrDays.length > 0) {
                for (var i = 0; i < arrDays.length; i++) {

                    var temp = arrDays[i];
                    console.log("temp val " + temp);

                    if (temp == "Mon") {
                        displaySelectedVal[i] = wemo.items['MondayShort'];
                    }
                    if (temp == "Tue") {
                        displaySelectedVal[i] = wemo.items['TuesdayShort'];
                    }
                    if (temp == "Wed") {
                        displaySelectedVal[i] = wemo.items['WednesdayShort'];
                    }
                    if (temp == "Thu") {
                        displaySelectedVal[i] = wemo.items['ThursdayShort'];
                    }
                    if (temp == "Fri") {
                        displaySelectedVal[i] = wemo.items['FridayShort'];
                    }
                    if (temp == "Sat") {
                        displaySelectedVal[i] = wemo.items['SaturdayShort'];
                    }
                    if (temp == "Sun") {
                        displaySelectedVal[i] = wemo.items['SundayShort'];
                    }
                    console.log("transforming value " + displaySelectedVal[i]);
                }

                if (arrDays.length == 1) {
                    tempSelectedDayOrRange = displaySelectedVal;
                } else {
                    tempSelectedDayOrRange = displaySelectedVal.join("-");
                }

            }
        }

        console.log(" Timer rule " + tempSelectedDayOrRange);
        $("#timer_rule_when .select_day").html(tempSelectedDayOrRange);
        $('#timer_rule_selected_device').html(deviceList);

        window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("edit_timer_rule"));

        //Simple Rule Page Start
        $("#timer_rule_what_happens").find("li").on("tap", function() {
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("edit_timer_rule"));
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, editRule);
            wemoUtil.loadUrl(filePath.SELECT_SWITCHES);
        });

        $("#timer_rule_when").on("tap", function() {
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("edit_timer_rule"));
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, editRule);
            wemoUtil.loadUrl(filePath.TIMER_RULE_WHEN);
        });

        $("#timer_rule_rule_name").on("tap", function() {
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("edit_timer_rule"));
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, editRule);
            wemoUtil.loadUrl(filePath.RULE_NAME);
        });

        $('#timer_rule_selected_device').find('li').on("tap", function() {
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("edit_timer_rule"));
            window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE, $(this).attr('data-udn'));
            window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE_NAME, $(this).attr('data-fname'));
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, editRule);
            wemoUtil.loadUrl(filePath.WHAT_HAPPENS);
        });

        //For Rules Support Link
        $("#support_link").on('click', function() {
            if (!isRemoteEnabled) {
                deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
            }
            window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Help_Rules_Creation_Url']);
            wemoUtil.loadUrl(filePath.HELP_CENTER);
        });

        if (Object.keys(editRule.Devices).length <= 0) {
            $("#timer_rule_save_btn").button("disable");
        } else {
            $("#timer_rule_save_btn").button("enable");
        }

        //Simple Rule Click on the Save Button
        $("#timer_rule_save_btn").on('click', function() {

            var rule = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
            var fallBackObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SIMPLE_FALL_BACK);

            if (fallBackObj != undefined && fallBackObj != null) {
                var fallBackSwitches = [];
                for (key in fallBackObj.Devices) {
                    fallBackSwitches.push(key);
                    if ($.inArray(currentSwitchList, key) == -1) {}
                }

                var switchName = $.grep(fallBackSwitches, function(element) {
                    return $.inArray(element, currentSwitchList) === -1;
                });
                if (switchName != "") {
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.DELETED_SWITCH, switchName);
                }

            }
            rule.SelectedSensorsValue = "-1";

            if (Object.keys(editRule.Devices).length > 0) {
                for (key in editRule.Devices) {
                    if (av_switches['"' + key + '"'] == undefined) {
                        var msg = wemo.items['RuleCantBeSaved'];
                        alert(msg);
                        //alert('Having trouble saving this rule now. Please check the status of all your WeMo devices.');
                        return;
                    }
                }
            }

            var StartTimeAM = 'false';
            var EndTimeAM = 'false';
            StartTimeAM = (wemoUtil.convertMillisecondsToAMPM(rule.When.StartTime).lastIndexOf("AM") != -1) ? 'true' : 'false';
            EndTimeAM = (wemoUtil.convertMillisecondsToAMPM(rule.When.EndTime).lastIndexOf("AM") != -1) ? 'true' : 'false';
            if (rule.When.EndTime < rule.When.StartTime) {
                if (StartTimeAM == EndTimeAM) {
                    rule.When.RuleDuration = 86400 - (parseInt(rule.When.StartTime) - parseInt(rule.When.EndTime));
                } else {
                    rule.When.RuleDuration = (86400 - (parseInt(rule.When.StartTime))) + parseInt(rule.When.EndTime);
                }
            } else {
                rule.When.RuleDuration = rule.When.EndTime - rule.When.StartTime;
            }

            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("edit_timer_rule"));
            rule.RuleType = sessionStore.TIME_INTERVAL;
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, rule);
            if (rule.When.isFirmWareSupported != undefined && rule.When.isFirmWareSupported === "false") {
                $("#sunrise_firmware_upgrade").popup("open");
            } else {
                saveNewRule_RULES_RULEDEVICES(rule.RuleType, rule);
            }

        });

        //sunrise firmware upgrade Popup

        $("#sunrise_firmware_upgrade_updatenow").on("click", function() {

            var pendingFirmware = "pendingFirmware";
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.PENDING_FIRMWARE, pendingFirmware);

            $("#sunrise_firmware_upgrade").popup("close");
            editRule.RuleType = sessionStore.TIME_INTERVAL;
            if (Object.keys(editRule.Devices).length > 0) {
                for (key in editRule.Devices) {
                    editRule.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, editRule);
                }
            }
            saveNewRule_RULES_RULEDEVICES(editRule.RuleType, editRule);
            //wemoUtil.loadUrl(filePath.MORE_NEW_FIRMWARE);
        });

        $('#sunrise_firmware_upgrade_later').on('click', function() {
            $("#sunrise_firmware_upgrade").popup('close');
            editRule.RuleType = sessionStore.TIME_INTERVAL;
            if (Object.keys(editRule.Devices).length > 0) {
                for (key in editRule.Devices) {
                    editRule.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, editRule);
                }
            }
            saveNewRule_RULES_RULEDEVICES(editRule.RuleType, editRule);
        });

        $("#sunrise_firmware_upgrade_updatenow").on("click", function() {
            $("#sunrise_firmware_upgrade").popup("close");
        });

        $('#timer_rule_cancel_btn').on('pointerdown', function() {
            if (parseInt(JSON.parse(window.sessionStorage.getItem(sessionStore.RULES_DATA)).length) > 0) {
                wemoUtil.loadUrl(filePath.ENABLED_RULES);
            } else {
                wemoUtil.loadUrl(filePath.CREATE_RULE);
            }
        });

        var editFlag = true;
        wemoUtil.setJSONObjectToSessionStorage(sessionStore.EDIT_FLAG, editFlag);
    },

    hideWhatHappen: function(networktype, remoteEnable, editRule) {
        console.log("success creating the table structures");
        if (networktype == networkType.HOME_NETWORK || networktype == null) {
            console.log("Local Mode edit timer - hideWhatHappen ");

            deviceTabPlugin.execute(
                function(params) {
                    if (params.length == Object.keys(editRule.Devices).length) {
                        $('#timer_rule_what_happens').hide();
                    }
                },
                function(err) {
                    console.log("Error getting sensors list")
                },
                actions.SELECT_SWITCHES, []);

        } else if (networktype == networkType.REMOTE_WIFI || networktype == networkType.REMOTE_MOBILE) {
            if (remoteEnable) {
                console.log(TAG + "Remote enabled: " + remoteEnable);
                var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
                //                            alert("Switch count : "+arraySensorObjects.length);

                if (arraySwitchObjects.length == Object.keys(editRule.Devices).length) {
                    $('#timer_rule_what_happens').hide();
                }

            } else {
                navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {
                    loadUrlTimeoutValue: 60000
                });
            }
        }

    },


    bindEvents: function() {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', edit_timer_rule.onOnline, false);
        document.addEventListener('offline', edit_timer_rule.onOffline, false);
        document.addEventListener("backbutton", edit_timer_rule.onBackPress, false);
        document.addEventListener("pause", edit_timer_rule.onPause, false);
        document.addEventListener("resume", edit_timer_rule.onResume, false);
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
    showModal: function(msg) {
        $("body").append('<div id="mask" class="modalWindow"/>');

        $.mobile.showPageLoadingMsg("a", msg);
    },

    loaderStateCheck: function() {
        var msg;
        flag = false;
        var state = "success";
        if (state === "working") {
            msg = wemo.items['RULE_STATUS_REFRESHING_DB'];
        } else if (state === "something") {
            msg = wemo.items['AppStatusWaiting'];
        } else if (state === "something") {
            msg = wemo.items['AppStatusWorking'];
        } else if (state === "successnot") {
            msg = wemo.items['RULE_STATUS_CHECKING_CONFLICTS'];
        } else if (state === "something") {
            msg = wemo.items['RULE_STATUS_SENDING_DB'];
        } else if (state === "success") {
            msg = ' ';
            flag = true;

            var elem = $(".ui-loader-verbose").find("h1");

            $(".ui-loader").css({
                background: "url('../img/Actions-dialog-ok-apply-icon.png') no-repeat scroll 119px center #000000",
                height: "44px"
            });

        }
    },

    showPopup: function() {
        //Rule can not save show popup
        //$("#rule_can_not_save" ).popup( "open" );

        //Rule Conflict show popup
        //$("#rule_conflict" ).popup( "open" );

        //Rule Duplication show popup
        //$("#rule_duplicate" ).popup( "open" );

        //sunrise firmware upgrade show popup
        //$("#sunrise_firmware_upgrade" ).popup( "open" );


        //Rule conflict Popup
        /* $("#rule_conflict_learn_more_btn").on("tap", function(){
		    	alert("Your Data has Saved");
		    	$("#rule_conflict" ).popup( "close" );
		    });
		    
		    $("#rule_conflict_ok_btn").on("tap", function(){
		    	alert("Your Data has Saved");
		    	$("#rule_conflict" ).popup( "close" );
		    });*/


        //Rules Can not be saved Popup
        $("#rule_can_not_save_ok").on("tap", function() {
            alert("Rules Can't be saved");
            $("#rule_can_not_save").popup("close");
        });


        /* //Rule Duplicate Popup
		    $("#rule_duplicate_learn_more_btn").on("tap", function(){
		    	alert("Learn More");
		    	$("#rule_duplicate" ).popup( "close" );
		    });
		    
		    $("#rule_duplicate_ok_btn").on("tap", function(){
		    	alert("Rule Duplicate");
		    	$("#rule_duplicate" ).popup( "close" );
		    });*/

        //sunrise firmware upgrade Popup
        $("#sunrise_firmware_upgrade_later").on("tap", function() {
            alert("Learn More");
            $("#sunrise_firmware_upgrade").popup("close");
        });

        $("#sunrise_firmware_upgrade_updatenow").on("tap", function() {
            alert("Rule Duplicate");
            $("#sunrise_firmware_upgrade").popup("close");
        });

    }


};