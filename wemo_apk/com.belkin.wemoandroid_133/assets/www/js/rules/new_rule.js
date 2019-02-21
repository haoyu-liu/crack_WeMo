/*
    new_rule.js

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

var TAG = "new_rule.js: ";

$(document).bind('pageinit', function() {
    new_rule.initialize();
});

var new_rule = {

    initialize: function() {
        console.log(TAG + "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    onDeviceReady: function() {
        var self = this;
        if (!isRemoteEnabled) {
        $.when(wemoUtil.getDevices(actions.SELECT_SWITCHES), wemoUtil.getDevices(actions.SELECT_INSIGHTS), wemoUtil.getDevices(actions.SELECT_MAKER), wemoUtil.getDevices(actions.SELECT_LED_DEVICES))
            .then(function() {

                new_rule.afterOnDeviceReady();

            }).fail(function() {
                throw ('ERROR');
            });
        }else{
        	new_rule.afterOnDeviceReady();
        }
    },
    afterOnDeviceReady: function() {


        console.log(TAG + "onDeviceReady");
        new_rule.bindEvents();
        window.sessionStorage.removeItem(sessionStore.isEdit);

        if (isRemoteEnabled) {
            $("#find_and_pair_Newdevice").hide();
        }
        //For Rules Support Link
        $("#support_link").on('click', function() {
            if (!isRemoteEnabled) {
                deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
            }
            window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Help_Rules_Creation_Url']);
            wemoUtil.loadUrl(filePath.HELP_CENTER);
        });

        var x = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
        var networktype = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_NETWORKTYPE);
        var remoteEnable = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_ENABLE);
        new_rule.selectDevices(networktype, remoteEnable);

        console.log("Rule = " + JSON.stringify(x));

        new_rule.enableSwitch(x);

        $("#rules_container #select_").find('.select_switches_list .more_li_text_div').on("tap", function() {
            var id_drawer = $.trim($(this).parent().attr('data-udn'));
            var drawer = $('div [id="' + id_drawer + '"]');
            $('div [data-udn="' + id_drawer + '"]').find('.more_li_subHeader').hide();
            drawer.slideToggle("slow");

            setTimeout(function() {
                if (drawer.is(":visible")) {
                    $('div [data-udn="' + id_drawer + '"]').find('.more_li_subHeader').hide();
                } else {
                    $('div [data-udn="' + id_drawer + '"]').find('.more_li_subHeader').show();
                }
            }, 700);
        });

        $("#rules_container #select_").find('.drawer_li').on("tap", function() {
            $(this).parent().find('.drawer_li').removeClass('div_bg_green');
            $(this).addClass('div_bg_green');

            var data_udn = $.trim($(this).parent().attr('id'));
            $('div [data-udn="' + data_udn + '"]').find('.more_li_subHeader').empty().html($(this).find('span').html()).hide();

            $('div [data-udn="' + data_udn + '"] ').find('.check_mark').attr('display', 'block').show();
        });

        $("#rules_container #select_").find('.select_switches_list .check_mark').on("tap", function(e) {
            var data_udn = $.trim($(this).parent().attr('data-udn'));
            var drawer = $('div [id="' + data_udn + '"]');
            drawer.children().removeClass('div_bg_green');
            $('div [data-udn="' + data_udn + '"]').find('.more_li_subHeader').empty();
            $('div [data-udn="' + data_udn + '"] ').find('.check_mark').hide();
            e.preventdefault();
        });

        if ((x.When.StartTime != undefined || x.When.StartTime != null) && x.SelectedDayOrRange != undefined) {

            var tempSelectedDayOrRange = "";

            if (x.SelectedDayOrRange == "Weekday" || x.SelectedDayOrRange == "Weekend" || x.SelectedDayOrRange == "Daily") {
                var tempSelectedDayOrRange = x.SelectedDayOrRange;
                if (tempSelectedDayOrRange == "Weekday") {
                    tempSelectedDayOrRange = wemo.items['WeekdaysNoDetails'];
                } else if (tempSelectedDayOrRange == "Weekend") {
                    tempSelectedDayOrRange = wemo.items['WeekendsNoDetails'];
                } else {
                    tempSelectedDayOrRange = wemo.items[tempSelectedDayOrRange];
                }
            } else if (x.SelectedDayOrRange == "Weekdays" || x.SelectedDayOrRange == "Weekends" || x.SelectedDayOrRange == "Daily") {
                var tempSelectedDayOrRange = x.SelectedDayOrRange;
                if (tempSelectedDayOrRange == "Weekdays") {
                    tempSelectedDayOrRange = wemo.items['WeekdaysNoDetails'];
                } else if (tempSelectedDayOrRange == "Weekends") {
                    tempSelectedDayOrRange = wemo.items['WeekendsNoDetails'];
                } else {
                    tempSelectedDayOrRange = wemo.items[tempSelectedDayOrRange];
                }
            } else {
                console.log("entering if returning " + x.SelectedDayOrRange);
                var strDays = x.SelectedDayOrRange;
                var arrDays = strDays.split("-");
                var displaySelectedVal = [];

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


            console.log("last slected range value " + tempSelectedDayOrRange);

            //-------------------SRSS--------------------
            if (x.When.StartSRSS != undefined && (x.When.StartSRSS === "Sunrise" || x.When.StartSRSS === "Sunset")) {

                if (x.When.StartSRSS === "Sunrise") {
                    var startSRSSVal = 'SunRise';
                }
                if (x.When.StartSRSS === "Sunset") {
                    var startSRSSVal = 'SunSet';
                }

                $("#simple_rule_when .more_li_text_right").html(wemo.items[startSRSSVal] + "<br>" + tempSelectedDayOrRange);

                //Plug-in Call To Get Firmware Version SRSS
                if (Object.keys(x.Devices).length > 0) {
                    for (key in x.Devices) {
                        console.log("SRSS - UDN Firmware Version - " + key + "  ::  " + x.Devices[key]);
                        if (x.When.isFirmWareSupported != undefined && x.When.isFirmWareSupported === "false") {
                            x.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                        }
                    }
                }
            } //-------------------SRSS--------------------
            else {
                $("#simple_rule_when .more_li_text_right").html(wemoUtil.convertMillisecondsToAMPM(x.When.StartTime) + "<br>" + tempSelectedDayOrRange);
            }
        } else {
            var nearestHr = wemoUtil.getTimeRoundedToNearestHalfHour();
            //$("#simple_rule_when .more_li_text_right").html(nearestHr+"<br>Daily");
            $("#simple_rule_when .more_li_text_right").html(nearestHr + "<br>" + wemo.items['Weekdays']);
            x.When.StartTime = wemoUtil.convertTimeToMilliseconds(nearestHr);
            x.When.EndTime = "0";
            x.SelectedDayOrRange = "Mon-Tue-Wed-Thu-Fri";
        }
        x.When.RuleDuration = "0";
        wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);

        if (Object.keys(x.Devices).length > 0) {
            var html = "";
            for (key in x.Devices) {
                //var state="Do Nothing";
                var state = wemo.items['AfterMotionNothing'];
                if (x.Devices[key].StartAction == 1) {
                    //state="Turns ON";
                    state = wemo.items['AfterMotionOn'];
                    x.Devices[key].EndAction = 2;
                } else if (x.Devices[key].StartAction == 0) {
                    //state="Turns OFF";
                    state = wemo.items['AfterMotionOff'];
                    x.Devices[key].EndAction = 2;
                }

                window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE, key);
                window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE_NAME, x.Devices[key].FName);
                wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
                html += '<li data-udn="' + key + '" data-fName="' + x.Devices[key].FName + '" class="selected_device_list"><div><span class="more_li_text_div" localString="true" _key="WhatHappens">' + x.Devices[key].FName + '</span><span class="more_li_text_right" localString="true" _key="SelectSwitches">' + state + '</span></div></li>';
            }
            $('#simple_rule_selected_device').html(html);
        }

        //              new_rule.deviceListBorder();

        //To return back to home page: device list tab
        $(".wemo_logo").on("tap", function(e) {
            if (e.target.nodeName != "IMG") {
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }
        });

        //Simple Rule Page Start
        $("#simple_rule_what_happens").find("li").on("tap", function() {
            wemoUtil.loadUrl(filePath.SELECT_SWITCHES);
        });

        $("#simple_rule_when").on("tap", function() {
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
            wemoUtil.loadUrl(filePath.WHEN);
        });

        $("#simple_rule_rule_name").on("tap", function() {
            wemoUtil.loadUrl(filePath.RULE_NAME);
        });
        $('#simple_rule_selected_device').find('li').on("pointerdown", function() {
            window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE, $(this).attr("data-udn"));
            window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE_NAME, $(this).attr("data-fName"));
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("simple_rule"));
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
            wemoUtil.loadUrl(filePath.WHAT_HAPPENS);
        });

        // alert(Object.keys(x.Devices).length+'   '+x.When.StartSRSS);
        /*
			  if (Object.keys(x.Devices).length<=0){
				  $("#simple_rule_save_btn").button("disable");
      		  }else{
      			if(x.When.StartSRSS != undefined && (x.When.StartSRSS === "Sunrise" || x.When.StartSRSS === "Sunset")){
      				if (x.locationInfo!=undefined && x.locationInfo.cityName!=undefined){
      					
      					console.log("after returning "+x.When.StartSRSS);
      					$("#simple_rule_save_btn").button("enable");
      				 }else{
      					$("#simple_rule_save_btn").button("disable"); 
      				 }
      				
      			}else{
      				$("#simple_rule_save_btn").button("enable");
      			}
          	  }
			  */


        //Simple Rule Click on the Save Button
        $("#simple_rule_save_btn").on('tap', function() {
            //-------------------SRSS--------------------
            //Plug-in Call To Get Firmware Version SRSS
            //var x=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
            // alert("city name = "+x.locationInfo.cityName);
            console.log("Rule stringify ****** : " + JSON.stringify(x));

            if (x.When.StartSRSS != undefined && (x.When.StartSRSS === "Sunrise" || x.When.StartSRSS === "Sunset")) {
                if (Object.keys(x.Devices).length > 0) {
                    for (key in x.Devices) {
                        console.log("SRSS - UDN Firmware Version - " + key + "  ::  " + x.Devices[key]);
                        x.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                    }
                }
            }
            //-------------------SRSS--------------------
            x.RuleType = "Simple Switch";
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);

            if (x.When.isFirmWareSupported != undefined && x.When.isFirmWareSupported === "false") {
                $("#sunrise_firmware_upgrade").popup("open");
            } else {
                console.log("redirecting to save rule");
                saveNewRule_RULES_RULEDEVICES(x.RuleType, x);
            }
        });

        //SRSS firmware upgrade

        $("#sunrise_firmware_upgrade_updatenow").on("click", function() {
            var pendingFirmware = "pendingFirmware";
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.PENDING_FIRMWARE, pendingFirmware);

            var x = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
            $("#sunrise_firmware_upgrade").popup('close');
            if (Object.keys(x.Devices).length > 0) {
                for (key in x.Devices) {
                    x.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
                }
            }
            saveNewRule_RULES_RULEDEVICES(x.RuleType, x);

            //$("#sunrise_firmware_upgrade" ).popup( "close" );
            //wemoUtil.loadUrl(filePath.MORE_NEW_FIRMWARE);
        });

        $('#sunrise_firmware_upgrade_later').on('click', function() {
            var x = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
            $("#sunrise_firmware_upgrade").popup('close');
            if (Object.keys(x.Devices).length > 0) {
                for (key in x.Devices) {
                    x.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
                }
            }
            saveNewRule_RULES_RULEDEVICES(x.RuleType, x);
        });

        $('#simple_rule_cancel_btn').on('tap', function() {
            if (parseInt(JSON.parse(window.sessionStorage.getItem(sessionStore.RULES_DATA)).length) > 0) {
                wemoUtil.loadUrl(filePath.ENABLED_RULES);
            } else {
                wemoUtil.loadUrl(filePath.CREATE_RULE);
            }
        });

        if (typeof(x.RuleName) == "undefined") {
            x.RuleName = "Rule " + x.ruleTaleRowLen;
            var ruletempname = wemo.items['Rule'] + " " + x.ruleTaleRowLen;
            //x.RuleName = wemo.items['Rule']+" "+x.ruleTaleRowLen;
        } else {
            var rulenameObj = x.RuleName;
            var searchRule = rulenameObj.search("Rule");
            var ruletempname = "";

            if (searchRule != -1 || searchRule == false) {
                var rulenamepart1 = wemo.items['Rule'];
                ruletempname = rulenameObj.replace("Rule", rulenamepart1);
            } else {
                ruletempname = rulenameObj;
            }
        }


        $("#simple_rule_rule_name .more_li_text_right").html(ruletempname);
        wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
    },

    enableSwitch: function(x) {
        console.log("success creating the table structures");
        deviceTabPlugin.execute(
            function(data) {
                if (data == networkType.HOME_NETWORK) {
                    console.log("Local Mode...Enable Switch");
                    var count_devices = wemoUtil.getNumOfDevices(actions.SELECT_SWITCHES) +
                        wemoUtil.getNumOfDevices(actions.SELECT_INSIGHTS);
                    console.log("count devices " + count_devices);
                    if (count_devices == Object.keys(x.Devices).length) {
                        $('#simple_rule_what_happens').hide();
                    }
                } else if (data == networkType.REMOTE_WIFI || data == networkType.REMOTE_MOBILE) {
                    deviceTabPlugin.execute(
                        function(enabled) {
                            console.log(TAG + "Remote enabled: " + enabled);
                            if (enabled) {

                                var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
                                var arrayInsightObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA);

                                if ((arraySwitchObjects.length + arrayInsightObjects.length) == Object.keys(x.Devices).length) {
                                    $('#simple_rule_what_happens').hide();
                                }

                            } else {
                                navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {
                                    loadUrlTimeoutValue: 60000
                                });
                            }
                        },
                        new_rule.reportError,
                        actions.IS_REMOTE_ENABLED, []
                    );
                }
            },
            function(err) {
                console.log("Error getting sensors list")
            },
            actions.GET_NETWORK_TYPE, []);
    },

    bindEvents: function() {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', new_rule.onOnline, false);
        document.addEventListener('offline', new_rule.onOffline, false);
        document.addEventListener("backbutton", new_rule.onBackPress, false);
        document.addEventListener("pause", new_rule.onPause, false);
        document.addEventListener("resume", new_rule.onResume, false);
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
    /*
		deviceListBorder: function(){
			     var switch_list = $("#simple_rule_what_happens").find(".what_happens_select_switches").length;
	            if(switch_list===1){
	            	$(".what_happens_select_switches").addClass("select_switches_full");
	            }else if(switch_list === 2){
					$(".what_happens_select_switches:first-child").addClass('select_switches_clone_top');
					$(".what_happens_select_switches:last-child").addClass('select_switches_clone_bottom');
				}else if(switch_list >= 3){
					$(".what_happens_select_switches:first-child").addClass('select_switches_clone_top');
					$(".what_happens_select_switches:last-child").addClass('select_switches_clone_bottom');
					$(".what_happens_select_switches").not(".what_happens_select_switches:first-child, .what_happens_select_switches:last-child").addClass('select_switches_middle');
				}
		},*/

    deviceListBorder: function() {
        console.log("entering in deviceListBorder");
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

        console.log("entering in Show Devices**" + JSON.stringify(params))
        if (params != null && params.length > 0) {
            var html = "";
            //var expanded_drawer;
            $.each(params, function(inx) {
                html = html + '<div class="select_switches_list" data-udn="' + params[inx].udn + '"><span class="more_li_text_div">' + params[inx].friendlyName + '</span><span class="more_li_subHeader"></span><span class="check_mark"><img src="../img/Actions-dialog-ok-apply-icon.png"/></span></div><div class="drawer" id="' + params[inx].udn + '"><div class="drawer_li until"><span>on until time</span></div><div class="drawer_li on"><span>on</span></div><div class="drawer_li off"><span>off</span></div></div>';
                //$('.drawer').hide();
                /*expanded_drawer = '<div class="more_li_clone">on</div>';
					$(expanded_drawer).hide().insertAfter($('[data-udn="'+params[inx].udn+'"]'));*/
            });

            $('#rules_container #select_').append($(html));

            new_rule.deviceListBorder();
            return params.length;
        } else {
            return 0;
        }
    },

    selectDevices: function(networktype, remoteEnable) {
        console.log("success creating the table structures");
        if (networktype == networkType.HOME_NETWORK || networktype == null) {
            var numSwitches, numInsights;
            console.log("Local Mode... slect Devices");

            $('#rules_container #select_').html("");
            numSwitches = this.showDevices(actions.SELECT_SWITCHES);
            numInsights = this.showDevices(actions.SELECT_INSIGHTS);
            var code = $('#rules_container').html();
            console.log("HTML==>" + code);

            trace("numSwitches = ", numSwitches, "numInsights = ", numInsights);
            if (numSwitches + numInsights == 0) {
                //alert("No devices detected");
                var msg = wemo.items['DeviceNotFound'];
                alert(msg);
            }
        } else if (networktype == networkType.REMOTE_WIFI || networktype == networkType.REMOTE_MOBILE) {
            if (remoteEnable) {

                var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
                var arrayInsightObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA);
                var arrayMakerObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA);

                if ((arraySwitchObjects.length + arrayInsightObjects.length + arrayMakerObjects) > 0) {
                    var html = "";
                    $('#rules_container #select_').html("");
                    $.each(arraySwitchObjects, function(inx) {
                        //alert("UDN : "+arraySwitchObjects[inx][key.DEVICE_UDN]+" "+arraySwitchObjects[inx][key.DEVICE_FRIENDLY_NAME]);
                        html = html + '<div class="select_switches_list" data-udn="' + arraySwitchObjects[inx][key.DEVICE_UDN] + '"><span class="more_li_text_div">' + arraySwitchObjects[inx][key.DEVICE_FRIENDLY_NAME] + '</span></div>';
                    });
                    $.each(arrayInsightObjects, function(inx) {
                        html = html + '<div class="select_switches_list" data-udn="' + arrayInsightObjects[inx][key.DEVICE_UDN] + '"><span class="more_li_text_div">' + arrayInsightObjects[inx][key.DEVICE_FRIENDLY_NAME] + '</span></div>';
                    });

                    $('#rules_container #select_').html(html);
                    new_rule.deviceListBorder();
                } else {
                    //alert("No devices detected");
                    var msg = wemo.items['DeviceNotFound'];
                    alert(msg);
                }

            } else {
                navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {
                    loadUrlTimeoutValue: 60000
                });
            }
        }
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
		    	//alert("Your Data has Saved");
		    	$("#rule_conflict" ).popup( "close" );
		    });
		    
		    $("#rule_conflict_ok_btn").on("tap", function(){
		    	//alert("Your Data has Saved");
		    	$("#rule_conflict" ).popup( "close" );
		    });
		    */

        //Rules Can not be saved Popup
        $("#rule_can_not_save_ok").on("tap", function() {
            //alert("Rules Can't be saved");
            $("#rule_can_not_save").popup("close");
        });


        //Rule Duplicate Popup
        /*$("#rule_duplicate_learn_more_btn").on("tap", function(){
		    	//alert("Learn More");
		    	$("#rule_duplicate" ).popup( "close" );
		    });
		    
		    $("#rule_duplicate_ok_btn").on("tap", function(){
		    	//alert("Rule Duplicate");
		    	$("#rule_duplicate" ).popup( "close" );
		    });*/

        //sunrise firmware upgrade Popup
        /* $("#sunrise_firmware_upgrade_later").on("tap", function(){
		    	//alert("Learn More");
		    	$("#sunrise_firmware_upgrade" ).popup( "close" );
		    });
		    
		    $("#sunrise_firmware_upgrade_updatenow").on("tap", function(){
		    	//alert("Rule Duplicate");
		    	$("#sunrise_firmware_upgrade" ).popup( "close" );
		    });*/

    }

};