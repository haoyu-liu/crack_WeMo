/*
 edit_simple_rule.js


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
var TAG = "edit_simple_rule.js: ";

$(document).bind('pageinit', function() {
    edit_simple_rule.initialize();
});

var edit_simple_rule = {


    initialize: function() { 
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    onDeviceReady: function() {
        var self = this;
        if (!isRemoteEnabled) {
        	$.when(wemoUtil.getDevices(actions.SELECT_SWITCHES), wemoUtil.getDevices(actions.SELECT_INSIGHTS), wemoUtil.getDevices(actions.SELECT_MAKER), wemoUtil.getDevices(actions.SELECT_LED_DEVICES))
            .then(function() {

                edit_simple_rule.afterOnDeviceReady();

            }).fail(function() {
                throw ('ERROR');
            });
        }else{
        	edit_simple_rule.afterOnDeviceReady();
        }
    },
    afterOnDeviceReady: function() { 
        edit_simple_rule.bindEvents();

        //To return back to home page: device list tab
        $(".wemo_logo").on("tap", function(e) {
            if (e.target.nodeName != "IMG") {
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }
        });

        //For Rules Support Link
        $("#support_link").on('click', function() {
            if (!isRemoteEnabled) {
                deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
            }
            window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Help_Rules_Creation_Url']);
            wemoUtil.loadUrl(filePath.HELP_CENTER);
        });


        var networktype = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_NETWORKTYPE);
        var remoteEnable = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_ENABLE);
        var av_switches = {};

        console.log("success creating the table structures simple rule...");
        if (networktype == networkType.HOME_NETWORK || networktype == null) {
            console.log("Local Mode...");

            var params = wemoUtil.getDevices(actions.SELECT_SWITCHES);
            $.each(params, function(inx) {
                av_switches['"' + params[inx].udn + '"'] = params[inx].friendlyName;
            });

            params = wemoUtil.getDevices(actions.SELECT_INSIGHTS);
            $.each(params, function(inx) {
                av_switches['"' + params[inx].udn + '"'] = params[inx].friendlyName;
            });

            edit_simple_rule.populate(av_switches);

        } else if (networktype == networkType.REMOTE_WIFI || networktype == networkType.REMOTE_MOBILE) {
            if (remoteEnable) {
                var params = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
                var paramsInsight = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA);
                $.merge(params, paramsInsight);
                console.log("Devices count : " + params.length);

                if (params.length > 0) {
                    $.each(params, function(inx) {
                        console.log("Device Value : " + params[inx][key.DEVICE_UDN] + " " + params[inx][key.DEVICE_FRIENDLY_NAME]);
                        av_switches['"' + params[inx][key.DEVICE_UDN] + '"'] = params[inx][key.DEVICE_FRIENDLY_NAME];
                    });
                    edit_simple_rule.populate(av_switches);
                    rule_details.deviceListBorder();
                } else {
                    console.log("No switches, no insight detected");
                    edit_simple_rule.populate(av_switches);
                    rule_details.deviceListBorder();
                }

            } else {
                navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {
                    loadUrlTimeoutValue: 60000
                });
            }
        }

    },

    enableSwitch: function() {

        //TODO: remove this function. It does not used by code.
        console.log("enableSwitch ==> !!!");

        deviceTabPlugin.execute(
            function(data) {
                if (data == networkType.HOME_NETWORK || networktype == null) {
                    console.log("Local Mode...");


                    deviceTabPlugin.execute(
                        function(params) {
                            if (params.length > 0) {
                                $.each(params, function(inx) {
                                    if (devicename == params[inx].udn) {
                                        devicefriendlyname = params[inx].friendlyName;
                                    } else {
                                        var switchType = deviceName.split(":");
                                        if (switchType[1].indexOf("sensor") != -1) {
                                            devicefriendlyname = "Sensor is not present";
                                        } else {
                                            devicefriendlyname = "Switch is not present";
                                        }
                                    }
                                });

                                select_switches.deviceListBorder();
                            } else console.log("No devices detected");

                        },
                        function(err) {
                            console.log("No devices detected");
                        }, actions.SELECT_SWITCHES, []);

                } else if (data == networkType.REMOTE_WIFI || data == networkType.REMOTE_MOBILE) {
                    deviceTabPlugin.execute(
                        function(enabled) {
                            console.log(TAG + "Remote enabled: " + enabled);
                            if (enabled) {
                                var params = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
                                console.log("Switch count : " + arraySwitchObjects.length);

                                if (params.length > 0) {
                                    $.each(params, function(inx) {
                                        if (devicename == params[inx][key.DEVICE_UDN]) {
                                            devicefriendlyname = params[inx][key.DEVICE_FRIENDLY_NAME];
                                        } else {
                                            var switchType = deviceName.split(":");
                                            if (switchType[1].indexOf("sensor") != -1) {
                                                devicefriendlyname = "Sensor is not present";
                                            } else {
                                                devicefriendlyname = "Switch is not present";
                                            }
                                        }
                                    });

                                    select_switches.deviceListBorder();
                                } else console.log("No devices detected");

                            } else {
                                navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {
                                    loadUrlTimeoutValue: 60000
                                });
                            }
                        },
                        edit_simple_rule.reportError,
                        actions.IS_REMOTE_ENABLED, []
                    );
                }
            },
            function(err) {
                console.log("Error getting sensors list")
            },
            actions.GET_NETWORK_TYPE, []);
    },

    enableWhatHappens: function(rulesObj, devices) {
        console.log("enableWhatHappens ==>");
        deviceTabPlugin.execute(
            function(data) {
                if (data == networkType.HOME_NETWORK || networktype == null) {
                    console.log("Local Mode...");

                    var numSwitches = wemoUtil.getNumOfDevices(actions.SELECT_SWITCHES);
                    var numInsights = wemoUtil.getNumOfDevices(actions.SELECT_INSIGHTS);

                    if (numSwitches + numInsights == Object.keys(rulesObj.Devices).length) {
                        $('#simple_rule_what_happens').hide();
                    }

                } else if (data == networkType.REMOTE_WIFI || data == networkType.REMOTE_MOBILE) {
                    deviceTabPlugin.execute(
                        function(enabled) {
                            console.log(TAG + "Remote enabled: " + enabled);
                            if (enabled) {

                                var arraySensorObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SENSOR_DATA);
                                /*var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
								var arrayInsightObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA);
								if( (arraySwitchObjects.length + arrayInsightObjects.length) == Object.keys(rulesObj.Devices).length){*/
                                if (arraySensorObjects.length == Object.keys(rulesObj.Devices).length) {
                                    $('#simple_rule_what_happens').hide();
                                }

                            } else {
                                navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {
                                    loadUrlTimeoutValue: 60000
                                });
                            }
                        },
                        edit_simple_rule.reportError,
                        actions.IS_REMOTE_ENABLED, []
                    );
                }
            },
            function(err) {
                console.log("Error getting sensors list")
            },
            actions.GET_NETWORK_TYPE, []);

    },

    populate: function(av_switches) {

        var rulesObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);

        rulesObj.RuleType = sessionStore.SIMPLE_SWITCH;

        window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("edit_simple_rule"));
        //display time intervals and days

        //----------------------  Sunrise or Sunset  -------------------------------//

        var tempStartTime = "" + rulesObj.When.StartTime;
        if (tempStartTime.slice(-1) == "1") {
            rulesObj.When.StartSRSS = "Sunrise";
        } else if (tempStartTime.slice(-1) == "2") {
            rulesObj.When.StartSRSS = "Sunset";
        }

        //Plug-in Call To Get Firmware Version SRSS
        if (rulesObj.When.StartSRSS != undefined && (rulesObj.When.StartSRSS === "Sunrise" || rulesObj.When.StartSRSS === "Sunset")) {
            if (Object.keys(rulesObj.Devices).length > 0) {
                for (key in rulesObj.Devices) {
                    rulesObj.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                    //$("#simple_rule_when .select_time").text(rulesObj.When.StartSRSS);

                    if (rulesObj.When.StartSRSS == "Sunrise") {
                        var tempStartSRSS = wemo.items['SunRise'];
                        $("#simple_rule_when .select_time").text(tempStartSRSS);
                    } else if (rulesObj.When.StartSRSS == "Sunset") {
                        var tempStartSRSS = wemo.items['SunSet'];
                        $("#simple_rule_when .select_time").text(tempStartSRSS);
                    }

                }
            }
        } else {
            $("#simple_rule_when .select_time").text(wemoUtil.convertMillisecondsToAMPM(rulesObj.When.StartTime));
        }
        wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, rulesObj);
        //-------------------SRSS--------------------

        //Selected Date & Time

        if (rulesObj.SelectedDayOrRange == "Weekday" || rulesObj.SelectedDayOrRange == "Weekend" || rulesObj.SelectedDayOrRange == "Daily") {
            var tempSelectedDayOrRange = rulesObj.SelectedDayOrRange;
            if (tempSelectedDayOrRange == "Weekday") {
                tempSelectedDayOrRange = wemo.items['WeekdaysNoDetails'];
            } else if (tempSelectedDayOrRange == "Weekend") {
                tempSelectedDayOrRange = wemo.items['WeekendsNoDetails'];
            } else {
                tempSelectedDayOrRange = wemo.items[tempSelectedDayOrRange];
            }
        } else if (rulesObj.SelectedDayOrRange == "Weekdays" || rulesObj.SelectedDayOrRange == "Weekends" || rulesObj.SelectedDayOrRange == "Daily") {
            var tempSelectedDayOrRange = rulesObj.SelectedDayOrRange;
            if (tempSelectedDayOrRange == "Weekdays") {
                tempSelectedDayOrRange = wemo.items['WeekdaysNoDetails'];
            } else if (tempSelectedDayOrRange == "Weekends") {
                tempSelectedDayOrRange = wemo.items['WeekendsNoDetails'];
            } else {
                tempSelectedDayOrRange = wemo.items[tempSelectedDayOrRange];
            }
        } else {
            var strDays = rulesObj.SelectedDayOrRange;
            var arrDays = strDays.split("-");
            var displaySelectedVal = [];
            var tempSelectedDayOrRange = "";

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

        $("#simple_rule_when .select_day").html(tempSelectedDayOrRange);
        //$("#simple_rule_when .select_day").text(rulesObj.SelectedDayOrRange);


        //display Rule Name

        var rulenameObj = rulesObj.RuleName;
        var searchRule = rulenameObj.search("Rule");
        var tempDisRulename = "";

        if (searchRule != -1 || searchRule == false) {
            var rulenamepart1 = wemo.items['Rule'];
            tempDisRulename = rulenameObj.replace("Rule", rulenamepart1);
        } else {
            tempDisRulename = rulenameObj;
        }

        console.log("Temp Name " + tempDisRulename);
        $('#simple_rule_rule_name .more_li_text_right').text(tempDisRulename);

        //$('#simple_rule_rule_name .more_li_text_right').text(rulesObj.RuleName);

        var html = "";
        var devicefriendlyname = "";
        var currentSwitchList = [];
        if (Object.keys(rulesObj.Devices).length > 0) {


            for (key in rulesObj.Devices) {
                currentSwitchList.push(key);
                console.log("Devices Object :: " + key + "      " + rulesObj.Devices[key]);
                //var state="Do Nothing";
                var state = wemo.items['AfterMotionNothing'];
                if (rulesObj.Devices[key].StartAction == 1) {
                    //state="Turns on";
                    state = wemo.items['AfterMotionOn'];
                    rulesObj.Devices[key].EndAction = 2;
                } else if (rulesObj.Devices[key].StartAction == 0) {
                    //state="Turns off";
                    state = wemo.items['AfterMotionOff'];
                    rulesObj.Devices[key].EndAction = 2;
                }

                if (av_switches['"' + key + '"'] == undefined) /*devicefriendlyname="Switch is not present";*/ devicefriendlyname = wemo.items['SwitchNotFound'];
                else
                    devicefriendlyname = av_switches['"' + key + '"'];
                console.log(" State " + state);

                html += '<li data-udn="' + key + '" data-fName="' + devicefriendlyname + '" class="selected_device_list"><div><span class="more_li_text_div text_strong" localString="true" _key="WhatHappens">' + devicefriendlyname + '</span><span class="more_li_text_right" localString="true" _key="SelectSwitches">' + state + '</span></div></li>';
            }
            $('#simple_rule_selected_device').html(html);
        }

        edit_simple_rule.enableWhatHappens(rulesObj);

        $("#simple_rule_what_happens").find("li").on("tap", function() {
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, rulesObj);
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("edit_simple_rule"));

            wemoUtil.loadUrl(filePath.SELECT_SWITCHES);
        });

        $("#simple_rule_when").on("tap", function() {
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("edit_simple_rule"));
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, rulesObj);
            wemoUtil.loadUrl(filePath.WHEN);
        });

        $("#simple_rule_rule_name").on("tap", function() {
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("edit_simple_rule"));
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, rulesObj);

            wemoUtil.loadUrl(filePath.RULE_NAME);
        });
        $('#simple_rule_selected_device').find('li').on("tap", function() {
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("edit_simple_rule"));
            window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE, $(this).attr('data-udn'));
            window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE_NAME, $(this).attr("data-fName"));
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, rulesObj);
            wemoUtil.loadUrl(filePath.WHAT_HAPPENS);
        });

        if (Object.keys(rulesObj.Devices).length <= 0) {
            $("#simple_rule_save_btn").button("disable");
        } else {
            $("#simple_rule_save_btn").button("enable");
        }

        //Simple Rule Click on the Save Button
        $("#simple_rule_save_btn").on('click', function() {
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
            if (Object.keys(rulesObj.Devices).length > 0) {
                for (key in rulesObj.Devices) {

                    if (av_switches['"' + key + '"'] == undefined) {
                        var msg = wemo.items['RuleCantBeSaved'];
                        //alert('Having trouble saving this rule now. Please check the status of all your WeMo devices.');
                        alert(msg);
                        return;
                    }
                }
            }
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("edit_simple_rule"));
            rule.RuleType = sessionStore.SIMPLE_SWITCH;
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
            rulesObj.RuleType = sessionStore.SIMPLE_SWITCH;;
            if (Object.keys(rulesObj.Devices).length > 0) {
                for (key in rulesObj.Devices) {
                    rulesObj.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, rulesObj);
                }
            }

            saveNewRule_RULES_RULEDEVICES(rulesObj.RuleType, rulesObj);

            //wemoUtil.loadUrl(filePath.MORE_NEW_FIRMWARE);
        });

        $('#sunrise_firmware_upgrade_later').on('click', function() {
            $("#sunrise_firmware_upgrade").popup('close');
            rulesObj.RuleType = sessionStore.SIMPLE_SWITCH;;
            if (Object.keys(rulesObj.Devices).length > 0) {
                for (key in rulesObj.Devices) {
                    rulesObj.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, rulesObj);
                }
            }

            saveNewRule_RULES_RULEDEVICES(rulesObj.RuleType, rulesObj);
        });

        $("#sunrise_firmware_upgrade_updatenow").on("click", function() {
            $("#sunrise_firmware_upgrade").popup("close");
        });

        $('#simple_rule_cancel_btn').on('pointerdown', function() {
            if (parseInt(JSON.parse(window.sessionStorage.getItem(sessionStore.RULES_DATA)).length) > 0) {
                wemoUtil.loadUrl(filePath.ENABLED_RULES);
            } else {
                wemoUtil.loadUrl(filePath.CREATE_RULE);
            }
        });

        var editFlag = true;
        wemoUtil.setJSONObjectToSessionStorage(sessionStore.EDIT_FLAG, editFlag);

    },


    bindEvents: function() {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', edit_simple_rule.onOnline, false);
        document.addEventListener('offline', edit_simple_rule.onOffline, false);
        document.addEventListener("backbutton", edit_simple_rule.onBackPress, false);
        document.addEventListener("pause", edit_simple_rule.onPause, false);
        document.addEventListener("resume", edit_simple_rule.onResume, false);

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
        $("#rule_conflict_learn_more_btn").on("tap", function() {
            alert("Your Data has Saved");
            $("#rule_conflict").popup("close");
        });

        /* $("#rule_conflict_ok_btn").on("tap", function(){
            alert("Your Data has Saved");
            $("#rule_conflict" ).popup( "close" );
        });


        //Rules Can not be saved Popup
        $("#rule_can_not_save_ok").on("tap", function(){
            alert("Rules Can't be saved");
            $("#rule_can_not_save" ).popup( "close" );
        });
*/

        //Rule Duplicate Popup
        /* $("#rule_duplicate_learn_more_btn").on("tap", function(){
            alert("Learn More");
            $("#rule_duplicate" ).popup( "close" );
        });

        $("#rule_duplicate_ok_btn").on("tap", function(){
            alert("Rule Duplicate");
            $("#rule_duplicate" ).popup( "close" );
        });*/

        //sunrise firmware upgrade Popup
        $('#sunrise_firmware_upgrade_later').on('click', function() {
            //alert("Save Rule");
            $("#sunrise_firmware_upgrade").popup('close');
            x.RuleType = "Time Interval";
            saveNewRule_RULES_RULEDEVICES(x.RuleType, x);
        });

        $("#sunrise_firmware_upgrade_updatenow").on("click", function() {
            // alert("Rule Duplicate");
            $("#sunrise_firmware_upgrade").popup("close");
        });

    }


};