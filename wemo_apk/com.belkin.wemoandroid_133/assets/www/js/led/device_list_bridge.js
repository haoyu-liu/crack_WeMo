/*
 device_list_bridge.js

 Created by Belkin International, Software Engineering on 10/04/2013.
 Copyright (c) 2012-2013 Belkin International, Inc. and/or its affiliates. All rights reserved.

 Belkin International, Inc. retains all right, title and interest (including all
 intellectual property rights) in and to this computer program, which is
 protected by applicable intellectual property laws.  Unless you have obtained
 a separate written license from Belkin International, Inc., you are not authorized
 to utilize all or a part of this computer program for any purpose (including
 reproduction, distribution, modification, and compilation into object code),
 and you must immediately destroy or return to Belkin International, Inc. all copies
 of this computer program. If you are licensed by Belkin International, Inc., your
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
var TAGB = "device_list_bridge.js: ";
var isRemoteEnabled = false;
var isEditMode = false;
var firmwareCheckTimeout;
var cloudDeviceListTimeout;
var cloudDeviceListAutoRefreshTimeout;
var deviceStatusCounter = 0;
var animationLED;
var zindexvalue = "2";
var counterCall = 0;
var reload = false;
var statusCounter = 0;
var deviceStatusID = "";
var iconCounter = 0;
var is_led_firware = true;
var deviceAddedinGrp = false;
var isLEDDeviceAvailable = false;
var firmwareUpgradeMsg = [];
var homeSensemodelcodes = [];
var ledmanufacturercodes = [];
var ledmodelcodes = [];
var openDrawerFlag = false;
var openDrawerId = [];

//var devicelistbridge = "#device_list_container[category=bridge]";
//var devicelistbridge = "#device_list_container";
var devicelistbridge = "#device_list_bridge_container";
var devicelistbridgelistitem = devicelistbridge + " li[data-category='bridge']";
var devicelisthomesenselistitem = devicelistbridge + " li[data-category='homesensedevice']";

$(document).bind('pageinit', function() {
    $.mobile.touchOverflowEnabled = true;
});

var device_list_bridge = {};
var arrLeds = [];
var arrDevicesList = [];
var dragid = "";
var flag = 0;
var dbCloudId = [];
var fromCloud = [];
var deviceIdAndImg = [];
var isLocalRemote = false;
var gettingCloudImage = false;
var actualRes = 0;
var moretabFlag = false;
var faderTimer = '';
var _ledDeviceCache = [];
var deviceIcon = {};
var groupdeviceslist = [];
var unavailableDevicelist = [];
var LEDDeviceStatusNotification;
var arrCache = [];
var ledDeviceLoadingStatus = {
    "Devices": {}
};
var ledRemoteDeviceInfo = [];
var ledRemoteMac = [];
var ledNameFirmware = [];
var status_LedWalkthrough = {};
status_LedWalkthrough[sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_SINGLE] = false;
status_LedWalkthrough[sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_MULTIPLE] = false;
status_LedWalkthrough[sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_MULTIPLE_T2] = false;

window.CTemplator = {
    fitIn: function(template, arglist) {
        var output = template;
        for (var i = 0; i < arglist.length; i++) {
            output = output.replace(new RegExp('\\[' + i + '\\]', 'g'), arglist[i]);
        }
        return output;
    }
};

device_list_bridge = {

    TAGB: 'device_list_bridge.js: ',

    deviceBridgeListContainer: {},
    
    cctBulbInfo: {},
    
    buttonController: {
        goToSleep: {
            onTap: function(e) {
                var parentId = $(this).closest("li").attr('id');
                var activeButtonLength = $('#' + parentId + ' .buttonActive').length;

                if ($(this).hasClass('disableGoSleep')) {
                    e.preventDefault();
                } else if (activeButtonLength == 0) {
                    e.preventDefault();
                } else {
                    var time = 0;
                    var parentId = $(this).closest("li").attr('id');
                    var drawerMinuteBtn = $('#' + parentId + ' .buttonImage');
                    var deviceId = $('#' + parentId).attr('data-deviceId');
                    var panel = $('#drawer-' + deviceId);
                    var itemName = $(this).closest('li').attr('name');
                    var activeButtonLength = $('#' + parentId + ' .buttonActive').length;
                    
                    drawerMinuteBtn.each(function() {
                        if ($(this).hasClass('buttonActive')) {
                            time = $(this).attr('data-time');
                        }
                    });
                    
                    if (time != -1 && activeButtonLength > 0) {
                        if (itemName == ledDeviceConstants.GROUPLITAG) {
                            device_list_bridge.goToSleep(deviceId, time, ledDeviceConstants.GROUP);
                        } else {
                            device_list_bridge.goToSleep(deviceId, time, ledDeviceConstants.SINGLE);
                        }
                    }

                    var activeButton = -1;
                    drawerMinuteBtn.each(function(i, v) {
                        if ($(this).hasClass('buttonActive')) {
                            activeButton = i;
                        }
                    });

                    var deviceId = $(this).closest('li').attr('data-deviceId');
                    var activeButtonLength = $('#' + parentId + ' .buttonActive').length;
                    var addMinutes = (time == -1) ? -1 : (new Date().getTime()) + (time * 60000);
                    
                    $(this).attr('data-timer', addMinutes);
                    activeButton = activeButton + '&&' + addMinutes;

                    devicePlugin.execute(
                        function(param) {},
                        device_list_bridge.reportError,
                        ACTION_SET_SHAREDPREF_FADER_TIME, 
                        [deviceId, activeButton]
                    );
                }

                device_list_bridge.faderTimerEnhancement(addMinutes, deviceId);
            },
            enable: function () {
                $(devicelistbridge).on("tap", ".goSleep", device_list_bridge.buttonController.goToSleep.onTap);
            },
            disable: function () {
                $(devicelistbridge).off("tap", ".goSleep", device_list_bridge.buttonController.goToSleep.onTap);
            },
        }
    },
    
    //onDeviceReady: function () {
    deviceListBridgeInit: function() {
        modifyDeviceController.show();
        window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Help_Url']);
        window.sessionStorage.setItem(sessionStore.LED_GRADIENT_VAL, "0.220");

        if (window.sessionStorage.getItem(sessionStore.LED_MULTIPLE_BRIDGE_UDN) != "" && window.sessionStorage.getItem(sessionStore.LED_MULTIPLE_BRIDGE_UDN) != null) {
            device_list_bridge.setBridgeInfo(window.sessionStorage.getItem(sessionStore.LED_MULTIPLE_BRIDGE_UDN));
        }

        if (window.sessionStorage.getItem(sessionStore.LED_MULTIPLE_BRIDGE_INFO) === true)
            device_list_bridge.clearLedCache();

        /******** device_list.js already initializing the Dom**/
        window.sessionStorage.setItem(sessionStore.PAIRED_DEVICES, "alreadypaired");
        if (window.sessionStorage.getItem(sessionStore.CLEAR_LED_CACHE) == "1") {
            device_list_bridge.clearLedCache();
            window.sessionStorage.setItem(sessionStore.CLEAR_LED_CACHE, "0");
        }

        //Edit Icon Start
        var isLocalRemoteEnable = window.sessionStorage.getItem(sessionStore.REMOTE_LOCAL);
        if (window.sessionStorage.getItem(sessionStore.REMOTE_LOCAL) == "true") {
            isLocalRemote = true;
        }

        //Edit Icon End

        if (window.sessionStorage.getItem(sessionStore.REMOTE_MODE) == "true")
            isRemoteEnabled = true;

        if (isRemoteEnabled) {
            $("#find_and_pair_Newdevice").hide();
            window.sessionStorage.setItem(sessionStore.IS_BRIDGE_PRESENT, false);
        } else {
            modifyDeviceController.show();
        }

        $('#modify_device').on('pointerup', function(e) {
            isEditMode = true;
            moretabFlag = true;
            openDrawerFlag = false;
            openDrawerId = [];
            //clearTimeout(cloudDeviceListAutoRefreshTimeout);

            $(devicelistbridgelistitem).each(function() {
                var itemid = $(this).attr('id');
                var classname = $('#' + itemid).attr('class');
                var itemname = $(this).attr('name');

                if (classname != undefined) {

                    if (classname.search('disabled') != -1) {
                        $("#" + itemid).hide();
                    } else if (classname.search('drawerView') != -1) {

                    } else {
                        if (!isRemoteEnabled) {
                            if (animationLED != undefined) {
                                $.fn.animatePNG.stop(animationLED);
                                clearInterval(animationLED);
                            }
                            $("#" + itemid).find('.animation').remove();
                        }

                        if (itemname == ledDeviceConstants.GROUPLITAG) {
                            $(this).addClass('editListGroupLeds');
                            $(this).removeClass('led_group');
                        } else {
                            $(this).addClass('editListLeds');
                            $(this).removeClass('led_list');
                        }

                        $(".bulbStrength").hide();
                        $(".sliderValue").hide();

                        var darwer = $(this).attr('data-deviceId');
                        var panel = $('#drawer-' + darwer);
                        $(panel).removeClass().addClass('drawerView');
                        
                    }
                }
            });
            
            $(devicelisthomesenselistitem).each(function() {
                var itemid = $(this).attr('id');
                var classname = $('#' + itemid).attr('class');
                var itemname = $(this).attr('name');

                if (classname != undefined) {

                    if (classname.search('disabled') != -1) {
                        $("#" + itemid).hide();
                    } else if (classname.search('drawerView') != -1) {

                    } else {
                        if (!isRemoteEnabled) {
                            if (animationLED != undefined) {
                                $.fn.animatePNG.stop(animationLED);
                                clearInterval(animationLED);
                            }
                            $("#" + itemid).find('.animation').remove();
                        }

                        if (itemname == ledDeviceConstants.GROUPLITAG) {
                            $(this).addClass('editListGroupLeds');
                            $(this).removeClass('led_group');
                        } else {
                            $(this).addClass('editListLeds');
                            $(this).removeClass('led_list');
                        }

                        $(".bulbStrength").hide();
                        $(".sliderValue").hide();

                        var darwer = $(this).attr('data-deviceId');
                        var panel = $('#drawer-' + darwer);
                        $(panel).removeClass().addClass('drawerView');
                        
                    }
                }
            });

            $("[name='name_group_state']").removeClass().addClass('edit_device_arrow_icon');
            $("[name='name_led_device_state']").removeClass().addClass('edit_device_arrow_icon');

            device_list_bridge.initializeDrag();
            moretabFlag = false;
            e.preventDefault();

        });

        //Drawer view go to sleep action for bulbs and groups
    
        //$(devicelistbridge).on("tap", ".goSleep", device_list_bridge.buttonController.goToSleep.onTap);
        device_list_bridge.buttonController.goToSleep.enable();
        
        $("#device_container").on("tap", ".buttonImage", function(e) {

            var Id = $(this).closest("li").attr('data-deviceId');
            var parentId = $(this).closest("li").attr('id');
            
            $('#customPicker' + Id).mobiscroll().timespan({
                wheelOrder: 'i',
                theme: 'wemoModal ledTimespan',
                steps: 1,
                minTime: 60000,
                maxTime: 3600000,
                display: 'modal',
                rows: 3,
                headerText: "Custom Time",
                labels: ['Y', 'M', 'D', 'H', 'M', 'S'],
                buttons: [
                    'cancel',
                    'set'
                ],
                closeOnOverlay: false,
                onBeforeShow: function(inst) {
                    inst.settings.mode = 'clickpick';
                    var defaultMin = $('#customPicker' + Id).attr('data-time');
                    inst.setValue([defaultMin]);
                },

                onClose: function(value, btn) {
                    //var parentId = $('.overlayScrollPicker').attr('data-deviceId');
                    if (btn === 'set') {
                        var val = value.split(' ');
                        $('#customPicker' + Id).attr('data-time', val[0]);                        
                        var timerValue = val[0];
                        if(timerValue == "" || timerValue == undefined || timerValue == null) {
                            timerValue = "1";
                        }                        
                        $('#' + parentId + ' .buttonImage').each(function (i, v) {
                            if ($(this).hasClass('buttonActive')) {
                                $(this).attr('data-time', timerValue);
                            }
                        });
                        $('#' + parentId + ' .customPicker').empty().append(timerValue + " m");
                        
                        /*$('#' + parentId + ' .customPicker').css({
                            'border': '2px solid #81db50 !important',
                            'background-color': '#ace588',
                            'color': '#fff'
                        });*/
                        
                        $('#' + parentId).find('.customPicker').removeClass('customPickerEnterTxtWhite');
                        $('#' + parentId).find('.customPicker').addClass('customPickerEnterTxtGrn');
                        
                        //$('.overlayScrollPicker').attr('style', 'visibility: hidden;');
                        $('.overlayScrollPicker').attr('style', 'display: none;');
                        $('#' + parentId).find('.goSleep').removeAttr('disabled').removeClass('disableGoSleep setOpacity');
                        device_list_bridge.buttonController.goToSleep.enable();
                        
                    } else {
                    	 $('#' + parentId).find('.customPicker').removeClass('customPickerEnterTxtGrn');
                         $('#' + parentId + ' .customPicker').empty().append(wemo.items['enter']);
                         $('#' + parentId).find('.customPicker').addClass('customPickerEnterTxtWhite');
                        
                         /*$('#' + parentId + ' .customPicker').empty().append(wemo.items['enter']).css({
                            'background-color': '#fff',
                            'color': '#000'
                         });*/
                        
                        $('#' + parentId + ' .buttonImage').each(function (i, v) {
                            if ($(this).hasClass('buttonActive')) {
                                $(this).attr('data-time', '-1');
                            }
                        });
                        $('#' + parentId + ' .buttonImage').removeClass('buttonActive');
                        //$('.overlayScrollPicker').attr('style', 'visibility: hidden;');
                        $('.overlayScrollPicker').attr('style', 'display: none;');
                    }
                }
            });

            if (!$('#drawer-' + Id).hasClass('setOpacity') || $('#drawer-' + Id).hasClass('setOpacity')) {
                $('#' + parentId + ' .buttonImage').each(function() {
                    $(this).removeClass('buttonActive');
                });

                var dataTime = $(this).attr('data-time');
                $('ul li[data-deviceId=' + Id + ']').find('.timer').empty().append(wemo.items["Off"]);

                $(this).toggleClass('buttonActive');

                //$('#drawer-' + Id).find('.timer').empty();
                
                //Opening the timer popup on click of the custom
                $('#' + parentId + ' .buttonImage').each(function(i, v) {
                    if ($(this).hasClass('buttonActive')) {
                        if (i == 3) {
                            $('#customPicker' + Id).mobiscroll('show');
                        }
                    }
                });
            }

            //$('#' + parentId).find('.timer').empty();

            if ($('#' + parentId + ' .buttonActive').length > 0) {
                if (!$('#' + parentId + ' .buttonActive').hasClass('customPicker')) {
                    $('#' + parentId).find('.goSleep').removeAttr('disabled').removeClass('disableGoSleep setOpacity');
                    device_list_bridge.buttonController.goToSleep.enable();
                }
            } else {
                $('#' + parentId).find('.goSleep').attr('disabled', true).addClass('disableGoSleep setOpacity');
                device_list_bridge.buttonController.goToSleep.disable();
            }

        });

        //Closing the timer popup
        $("#cnl_colortemp_btn").on("tap", function(e) {
        	e.preventDefault();
        	window.sessionStorage.setItem(sessionStore.IS_COLOR_TEMP_PICKER, false);
            //$('.overlayScrollPicker').attr('style', 'visibility: hidden;');
            $('.overlayScrollPicker').attr('style', 'display: none;');
        });
        
      //Closing the temp picker popup
        $("#cnl_temp_btn").on("tap", function(e) {
        	e.preventDefault();
        	window.sessionStorage.setItem(sessionStore.IS_COLOR_TEMP_PICKER, false);
        	device_list_bridge.cctBulbInfo = {};
            $('.overlayScrollPickerTemp').attr('style', 'visibility: hidden;');
        });
       
        //Drawer view functionality for the tile//

        $("#device_container").on("tap", ".drawerToggle", function(e) {
        	
            if (!isEditMode) {

                var drawer = $(this).closest('li').attr('data-deviceId');
                var liClass = $(this).closest('li').attr('class');
                var modelcode = "";
                var IconStatus = $("ul li[data-deviceid=" + drawer+ "]").find('.iconType').is(":visible");
                openDrawerFlag = false;
                openDrawerId = [];
                
                if ((liClass.search(ledDeviceConstants.DISABLED) == -1 || liClass.search(ledDeviceConstants.DISABLED) == false) && IconStatus == true){

                    var panel = $('#drawer-' + drawer);
          
                       if ((!$(panel).hasClass('drawerViewShow') || $(panel).find('.sliderRow').is(':visible')) && !$(panel).find('.firstRow').is(':visible')) {
                    	    openDrawerFlag = true;
                    	    openDrawerId.push(drawer);
                            $("#device_container").find('.drawerViewShow').removeClass().addClass('drawerView');
                            $(panel).removeClass().addClass('drawerViewShow');
                            var sliderValue = $(this).closest('li').find('.sliderValue').text();
                            panel.find('.firstRow').show();
                            panel.find('.goSleep').show();
                            panel.find('.sleepFader').show();
                            panel.find('.groupFadder').show();
                            $('#drawer-' + drawer).find(".temperatureColorRow").hide();
                            $('#drawer-' + drawer).find('.colorPickerMainDiv').hide();
                            
                        	if(isRemoteEnabled){
                             	
                             	if($("#" + drawer).attr('wemo-device-modelcode') && $("#" + drawer).attr('wemo-device-modelcode').indexOf(",")){
                             		var modelcodeArr = $("#" + drawer).attr('wemo-device-modelcode').split(",");
                             		modelcode = modelcodeArr[0]
                             	}else if($("#" + drawer).attr('wemo-device-modelcode').toUpperCase()){
                             		modelcode = $("#" + drawer).attr('wemo-device-modelcode');
                             	}
                             		
                             }else{
                             	if($("#" + drawer).attr('wemo-device-modelcode'))
                                 	modelcode = $("#" + drawer).attr('wemo-device-modelcode');
                             }
                             
                        	var ledDeviceType = wemoUtil.ledBulbType(modelcode);
                            
                        	if(wemoUtil.isTemperatureBulb(ledDeviceType)){
                            	$('#drawer-' + drawer).find(".temperatureColorRow").show();
                            	var colorVal = $('#drawer-' + drawer).find(".temperatureColorRow").attr("data-ttbColor");
                            	var colorTempVal = colorVal.split(':');
                            	var kelvinTemperarture = wemoUtil.convertColorToTemperature(colorTempVal[0]);
                            	
                            	var rgbColor = wemoUtil.convertTemperatureToRGB(kelvinTemperarture);
                            	$('#drawer-' + drawer).find(".temparatureColorPicker").attr("style","background:"+rgbColor);
                            	
                        	}
                         	if(wemoUtil.isColoredandTemperaturedBulb(ledDeviceType) || wemoUtil.isColoredBulb(ledDeviceType)){
                            	$('#drawer-' + drawer).find('.colorPickerMainDiv').show();
                            	var colorVal = $('#drawer-' + drawer).find(".colorPickerMainDiv").attr("data-Color");
                            	var colorTempVal = colorVal.split(':');
                            	var rgbColor = wemoUtil.convertColorToRGB(colorTempVal[0],colorTempVal[1]);
                            	
                            	if(!rgbColor){
                            		rbgColor=sessionStore.DEFAULT_RGB_VALUE;
                            	}
                            	
                            	$('#drawer-' + drawer).find(".colorPickerBox").attr("style","background:"+rgbColor);
                            
                            	if(wemoUtil.isColoredandTemperaturedBulb(ledDeviceType)){
                            		if(colorVal == 0 || colorVal == undefined){
                            			var temperatureVal = $('#drawer-' + drawer).find(".colorPickerMainDiv").attr("data-ttbColor");
                                		var TempVal = temperatureVal.split(':');
                                    	var kelvinTemperarture = wemoUtil.convertColorToTemperature(TempVal[0]);
                                    	var rgbColor = wemoUtil.convertTemperatureToRGB(kelvinTemperarture);
                                    	$('#drawer-' + drawer).find(".colorPickerBox").attr("style","background:"+rgbColor);
                            		}
                            		
                            		$('#drawer-' + drawer).find(".colorPickerLabel").html(wemo.items['ColorTemperature']);
                            	}	
                            	else
                            		$('#drawer-' + drawer).find(".colorPickerLabel").html(wemo.items['Color']);
                        	}
                
                            var className = $('#' + drawer).attr('class');
               
                            if (className.indexOf('led_off') != -1) {
                                console.log('disable go to sleep');
                                $(panel).addClass('setOpacity');
                                $(".groupFadder").removeClass('setOpacity');
                                $(panel).find('.goSleep').attr('disabled', true).addClass('disableGoSleep');
                                device_list_bridge.buttonController.goToSleep.disable();
                               
                                $(panel).find('.customPicker').empty().append(wemo.items['enter']);
                                $(panel).find('.customPicker').removeClass('customPickerEnterTxtGrn');
                                $(panel).find('.customPicker').addClass('customPickerEnterTxtWhite');
                            } else {
                                console.log('enable go to sleep');
                                $(panel).removeClass('setOpacity');
                                $(panel).find('.goSleep').removeAttr('disabled').removeClass('disableGoSleep');
                                device_list_bridge.buttonController.goToSleep.enable();
                                
                                $(panel).find('.customPicker').empty().append(wemo.items['enter']);
                                $(panel).find('.customPicker').removeClass('customPickerEnterTxtGrn');
                                $(panel).find('.customPicker').addClass('customPickerEnterTxtWhite');
                            }

                            device_list_bridge.drawerSlider(drawer, sliderValue, 'no');
                            var addMinutes = -1;

                            $('#drawer-' + drawer + ' .buttonImage').removeClass('buttonActive');
                            $('#drawer-' + drawer + ' .buttonImage').each(function(i, v) {
                                if (i == 0) {
                                    $(this).addClass('buttonActive');
                                }
                            });

                            devicePlugin.execute(
                                function(param) {
                                    if (param != -1) {
                                        var paramValues = param.split('&&');
                                        var activeButton = paramValues[0];
                                        addMinutes = paramValues[1];
                                        
                                        var activeButtonLength = $('#drawer-' + drawer + ' .buttonActive').length;
                                        
                                        if (activeButtonLength == 0) {
                                            addMinutes = -1;
                                            $(panel).find('.goSleep').attr('disabled', true).addClass('disableGoSleep setOpacity');
                                            device_list_bridge.buttonController.goToSleep.disable();
                                        }

                                        var sleepTimer = $('ul li[data-deviceId=' + drawer + ']').find('.goSleep').attr('data-timer');
                                        device_list_bridge.faderTimerEnhancement(addMinutes, drawer);
                                    }else{
                                    	var activeButtonLength = $('#drawer-' + drawer + ' .buttonActive').length;
                                        
                                        if (activeButtonLength == 0) {
                                            addMinutes = -1;
                                            $(panel).find('.goSleep').attr('disabled', true).addClass('disableGoSleep setOpacity');
                                            device_list_bridge.buttonController.goToSleep.disable();
                                        }


                                        var sleepTimer = $('ul li[data-deviceId=' + drawer + ']').find('.goSleep').attr('data-timer');
                                        device_list_bridge.faderTimerEnhancement(addMinutes, drawer);
                                    }
                                   

                                },
                                device_list_bridge.reportError,
                                ACTION_GET_SHAREDPREF_FADER_TIME, [drawer]
                            );

                            
                            
                            $('ul li[data-deviceId=' + drawer + ']').find('.iconType').removeClass('drawer_icon_arrow_down').addClass('drawer_icon_arrow_up');


                        }else{
                        	 openDrawerFlag = false;
                    	     openDrawerId = [];
                        	 $(panel).removeClass().addClass('drawerView');
                             $('ul li[data-deviceId=' + drawer + ']').find('.iconType').removeClass('drawer_icon_arrow_up').addClass('drawer_icon_arrow_down');
                             $("ul li[data-category='bridge']").find('.iconType').removeClass('drawer_icon_arrow_up').addClass('drawer_icon_arrow_down');
                        }

	                    devicePlugin.execute(
	                        function(param) {
	                            $('#drawer-' + drawer + ' .buttonImage').each(function(i, v) {
	                                if (i == param) {
	                                    $(this).addClass('buttonActive');
	                                }
	                            });
	                            
	                            if ($('#drawer-' + drawer + ' .buttonActive').length > 0) {
	    	                        $(panel).find('.goSleep').removeAttr('disabled').removeClass('disableGoSleep setOpacity');
                                    device_list_bridge.buttonController.goToSleep.enable();
	    	                    } else {
	    	                        $(panel).find('.goSleep').attr('disabled', true).addClass('disableGoSleep setOpacity');
                                    device_list_bridge.buttonController.goToSleep.disable();
	    	                    }

	                        },
	                        device_list_bridge.reportError,
	                        ACTION_GET_SHAREDPREF_FADER_TIME, [drawer]
	                    );
	
	                   
                }

            }
            e.preventDefault();

        });

        $("#group_ok_btn").on("click", function() {
            $("#different_capability").popup("close");
            $("#groupfoHeader").html("");
            $("#groupText").html("");
        });
        
        $("#error_handling_ok_btn").on("click", function() {
            $("#errorhandlingpopup").popup("close");
        });
        
        /*************on click on LED device**************/

        //$(devicelistbridge).on('tap',".led_list",function(){
        $(devicelistbridge).on('tap', 'span[name="name_led_device_state"]', function() {
            if (isEditMode == false) {
                //var item = $(this).find('span[name="name_led_device_state"]');
                var item = $(this);
                var currID = item.attr('id');
                var className = $(this).attr('class');
                var dataCategory = $("#mainLIID"+currID).attr('data-category');

                if(className != "led_value_loading" && dataCategory != sessionStore.WEMO_LINK_SUBDEVICE_HOMESENSE_TYPE)
                {
                    setTimeout(device_list_bridge.delayExecution(item), 50);

                    var deviceId = $(this).closest("li").attr('data-deviceId');
                    var sliderValue = $(this).closest('li').find('.sliderValue').text();
                    var darwer = deviceId;
                    var panel = $('#drawer-' + darwer);

                    //Timer Condition Starts
                    //clearInterval(faderTimer);
                    $('ul li[data-deviceId=' + deviceId + ']').find('.goSleep').attr('data-timer', 'off');
                
                    var activeButton = -1;
                    var parentId = $(this).closest("li").attr('id');
             
                    $('#' + parentId + ' .buttonImage').removeClass('buttonActive');

                    $('#' + parentId + ' .buttonImage').each(function(i, v) {
                        if (i == 0) {
                            $(this).addClass('buttonActive');
                        }
                    });

                    $('#' + parentId + ' .customPicker').removeClass('customPickerEnterTxtGrn');
                    $('#' + parentId + ' .customPicker').empty().append(wemo.items['enter']).addClass('customPickerEnterTxtWhite');
          
                    var activeButtonLength = $('#drawer-' + deviceId + ' .buttonActive').attr('data-time');
                    $('ul li[data-deviceId=' + deviceId + ']').find('.timer').empty().append(wemo.items["Off"]);

                    var activeButton = activeButton + '&&' + '-1';

                    devicePlugin.execute(
                        function(param) {
                        },
                        device_list_bridge.reportError,
                        ACTION_SET_SHAREDPREF_FADER_TIME, [deviceId, activeButton]
                    );

                    //Timer Condition Ends

                    if (className === 'led_off') {
                        
                        $('#' + parentId).find('.goSleep').attr('disabled', true).addClass('disableGoSleep setOpacity');
                        device_list_bridge.buttonController.goToSleep.disable();
                        
                        if (!panel.is(":visible")) {
                            if (!$(panel).hasClass('drawerViewShow')) {
                                $(panel).removeClass().addClass('drawerViewShow');
                                $(panel).addClass('removeOpacity');
                            }
                            device_list_bridge.drawerSlider(deviceId, sliderValue, 'yes');
                        } else {
                            if (!$(panel).hasClass('drawerView') && !$(panel).hasClass('drawerViewShow')) {
                                $(panel).removeClass().addClass('drawerView');
                            }

                        }

                    }
                    
                }


            }

        });

        $(devicelistbridge).on('tap', ".edit_device_arrow_icon", function(e) {
            if (moretabFlag == false) {
                //var item = $(this).find('span[name="name_led_device_state"]');
                var item = $(this);
                var liname = $(this).attr('name');

                /******LED Single bulb edit****/

                if (liname == "name_led_device_state") {
                    var friendlyname = item.attr('wemo-device-friendly-name');
                    var deviceManufacture = item.attr('wemo-device-manufacture');
                    var deviceModelcode = item.attr('wemo-device-modelcode');
                    var imgSRC = "";

                    if (isRemoteEnabled) {
                        var currID = item.attr('wemo-device-mac-address');
                        var pluginID = item.attr('wemo-device-plugin-id');
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_PLUGIN_ID, pluginID);
                        imgSRC = $("ul li[data-deviceId=" + pluginID + "]").find('.device_list_icon_container img').attr('src');

                    } else {
                        var currID = item.attr('id');
                        imgSRC = $("ul li[data-deviceId=" + currID + "]").find('.device_list_icon_container img').attr('src');
                    }


                    if (imgSRC == "" || imgSRC == undefined) {
                        if (deviceManufacture != "" && deviceManufacture != undefined && deviceModelcode != "" && deviceModelcode != undefined) {
                        	var imageurl = wemoUtil.replaceSpaceinModelCodeandManufacturer(deviceManufacture, deviceModelcode);
                        } else if(deviceModelcode != "" && deviceModelcode != undefined){
                        	var imageurl = wemoUtil.replaceSpaceinModelCode(deviceModelcode);
                        }
                        else
                            var imageurl = defaultIcon.LED_THUMB_URI;
                    } else
                        var imageurl = imgSRC;

                    window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO, ledDeviceConstants.SINGLE);
                    //nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, []);
                    window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME, friendlyname);
                    window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL, imageurl);
                    window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ID, currID);
                    devicePlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
                    //nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                    
                    if(jQuery.inArray(deviceModelcode.toUpperCase(), homeSensemodelcodes) != -1){
                    	 var homeSenseCapIdVal = {};
                    	 var capabilityId = item.attr('wemo-device-capabilities');
                    	 var capabilityal = item.attr('wemo-device-capabilities-values');
                    	 homeSenseCapIdVal[currID] = {'capabilitieid':capabilityId, 'capabilitieval':capabilityal};
                    	 window.sessionStorage.setItem(sessionStore.HOME_SENSE_DEVICE_TYPE, deviceModelcode);
                    	 window.sessionStorage.setItem(sessionStore.HOMESENSE_CAPABILITY_ID_VALUES, JSON.stringify(homeSenseCapIdVal));
                    	wemoUtil.loadUrl(filePath.HOME_SENSE_SETUP_SCREEN);
                    }else{
                    	wemoUtil.loadUrl(filePath.LED_DEVICE_LIST_EDIT);
                    }
                }
                /********LED Group EDIT***********/
                else if (liname == "name_group_state") {
                    if (isRemoteEnabled) {
                        //var item = $(this).find('span[name="name_group_state"]');
                        var item = $(this);
                        var currID = item.attr('id');
                        var friendlyname = item.attr('wemo-device-friendly-name');
                        var imageurl = $("ul li[data-deviceId=" + currID + "]").find('.device_list_icon_container img').attr('src');
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO, ledDeviceConstants.GROUP);
                        var groupdeviceids = item.attr('wemo-device-groupids');
                        var groupcapabilities = item.attr('wemo-device-capabilities');
                        var groupstate = item.attr('wemo-device-state-code');

                        var groupcurrentVal = $('#slider-' + currID).val();

                        var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
                        groupcurrentVal = (groupcurrentVal * AllowedVal) / 100;
                        //Changed the logic for currentValue everywhere from Math.round to Math.floor to get on par with the value returned by iOS app.
                        groupcurrentVal = Math.floor(groupcurrentVal);
                        var groupStateCurrentval = groupcurrentVal + ":0," + groupstate;
                        var groupUniqueID = item.attr('wemo-device-groupunique-id');
                        var groupDeviceFriendlyname = item.attr('wemo-group-device-friendlyname');
                        var devicedropFaderVal = item.attr('wemo-device-fader-value');
                        var devicedropTempVal = item.attr('wemo-device-temperature-value');
                        var devicedropColorVal = item.attr('wemo-device-color-value');
                        var deviceMacaddressList = item.attr('wemo-group-mac-ids');
                        var capabilityIDsVal1 = item.attr('wemo-group-capability-value');
                    
                        if (imageurl == "" || imageurl == undefined || imageurl == null)
                            imageurl = defaultIcon.LED_THUMB_URI;

                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS, groupdeviceids);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES, groupcapabilities);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CURRENTVAL, groupStateCurrentval);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME, friendlyname);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL, imageurl);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ID, currID);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_UNIQUE_ID, groupUniqueID);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_FRIENDLYNAME, groupDeviceFriendlyname);
                        window.sessionStorage.setItem(sessionStore.DEVICE_WEMO_DEVICE_FADER_VAL, devicedropFaderVal);
                        window.sessionStorage.setItem(sessionStore.DEVICE_WEMO_DEVICE_TEMPERATURE_VAL, devicedropTempVal);
                        window.sessionStorage.setItem(sessionStore.DEVICE_WEMO_DEVICE_COLOR_VAL, devicedropColorVal);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_MAC_IDS, deviceMacaddressList);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES_VALUE, capabilityIDsVal1);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_STATE, groupstate);
                        
                        devicePlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
                        wemoUtil.loadUrl(filePath.LED_DEVICE_LIST_EDIT);
                    } else {
                        //var item = $(this).find('span[name="name_group_state"]');
                        var item = $(this);
                        var currID = item.attr('id');
                        var friendlyname = item.attr('wemo-device-friendly-name');
                        var imageurl = $("ul li[data-deviceId=" + currID + "]").find('.device_list_icon_container img').attr('src');
                        var deviceModelcode = item.attr('wemo-device-modelcode');
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO, ledDeviceConstants.GROUP);
                        var groupdeviceids = item.attr('wemo-device-groupids');
                        var groupcapabilities = item.attr('wemo-device-capabilities');
                        var groupstate = item.attr('wemo-device-state-code');

                        var groupcurrentVal = $('#slider-' + currID).val();
                        
                        var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
                        groupcurrentVal = (groupcurrentVal * AllowedVal) / 100;
                        groupcurrentVal = Math.floor(groupcurrentVal);
                        var groupStateCurrentval = groupcurrentVal + ":0," + groupstate;
                        var groupDeviceFriendlyname = item.attr('wemo-group-device-friendlyname');

                        if (imageurl == "" || imageurl == undefined || imageurl == null)
                            imageurl = defaultIcon.LED_THUMB_URI;

                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS, groupdeviceids);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES, groupcapabilities);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CURRENTVAL, groupStateCurrentval);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME, friendlyname);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL, imageurl);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ID, currID);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_FRIENDLYNAME, groupDeviceFriendlyname);
                        devicePlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
                        wemoUtil.loadUrl(filePath.LED_DEVICE_LIST_EDIT);
         
                        if(jQuery.inArray(deviceModelcode.toUpperCase(), homeSensemodelcodes) != -1){
	                           	 var homeSenseCapIdVal = {};
		                       	 var grpIndiviStatus = window.sessionStorage.getItem(sessionStore.LED_HOMESENSE_GROUP_INDIVI_STATUS);
		                         
		                       	 if(grpIndiviStatus != "" && grpIndiviStatus != undefined){
			                            grpIndiviStatus = grpIndiviStatus.replace(/,\s*$/, "");
			                            var grpIndiviStatusArr = grpIndiviStatus.split(",");
			                            
			                            for (var j = 0; j < grpIndiviStatusArr.length; j++) {
			                                var val = grpIndiviStatusArr[j];
			                                var valArr = val.split(":");
			                                homeSenseCapIdVal[valArr[0]] = {'capabilitieid':homeSenseCapabilities.ONOFF, 'capabilitieval':valArr[1]};
			                            }
		                            
		                          }else{
			                        	var capabilityId = item.attr('wemo-device-capabilities');
				                       	var capabilityal = item.attr('wemo-device-capabilities-values');
			                        	homeSenseCapIdVal[currID] = {'capabilitieid':capabilityId, 'capabilitieval':capabilityal};
		                          }
		                        
		                       	 
		                       	 window.sessionStorage.setItem(sessionStore.HOME_SENSE_DEVICE_TYPE, deviceModelcode.toLowerCase());
		                       	 window.sessionStorage.setItem(sessionStore.HOMESENSE_CAPABILITY_ID_VALUES, JSON.stringify(homeSenseCapIdVal));
		                         window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME, groupDeviceFriendlyname);
		                         window.sessionStorage.setItem(sessionStore.HOME_SENSE_GROUP_NAME, friendlyname);
		                         window.sessionStorage.setItem(sessionStore.HOME_SENSE_GROUP_ID, currID);
		                       	 wemoUtil.loadUrl(filePath.HOME_SENSE_SETUP_SCREEN);
	                       }else{
	                       		wemoUtil.loadUrl(filePath.LED_DEVICE_LIST_EDIT);
	                       }

                    }

                }


            }


            e.stopPropagation();
            e.preventDefault();

        });


        /*************GROUP CONTROLLING CODE***************************/

        //$("#group_list_bridge_container").on('tap',".led_group",function(){
        $(devicelistbridge).on('tap', 'span[name="name_group_state"]', function() {

            //var item = $(this).find('span[name="name_group_state"]');

            if (isEditMode == false) {
	                var item = $(this);
	                var currID = item.attr('id');
	      
	                var deviceId = $(this).closest("li").attr('data-deviceId');
	                var sliderValue = $(this).closest('li').find('.sliderValue').text();
	      
	                var panel = $('#drawer-' + deviceId);
	                var className = $(this).attr('class');
	                var dataCategory = $("#mainLIID"+deviceId).attr('data-category');
	      
	                if(className != "led_value_loading"  && dataCategory != sessionStore.WEMO_LINK_SUBDEVICE_HOMESENSE_TYPE)
	                {
	                	//Timer Condition Starts
	                    clearInterval(faderTimer);
	                    $('ul li[data-deviceId=' + deviceId + ']').find('.goSleep').attr('data-timer', 'off');
	               
	                    var activeButtonLength = $('#drawer-' + deviceId + ' .buttonActive').attr('data-time');
	                    $('ul li[data-deviceId=' + deviceId + ']').find('.timer').empty().append(wemo.items["Off"]);

	                    var activeButton = -1;
	                    var parentId = $(this).closest("li").attr('id');
	               
	                    $('#' + parentId + ' .buttonImage').removeClass('buttonActive');
	                    $('#' + parentId + ' .buttonImage').each(function(i, v) {
	                        if (i == 0) {
	                            $(this).addClass('buttonActive');
	                        }
	                    });

	                    $('#' + parentId + ' .customPicker').removeClass('customPickerEnterTxtGrn');
	                    $('#' + parentId + ' .customPicker').empty().append(wemo.items['enter']).addClass('customPickerEnterTxtWhite');
	                    
	                    /*$('#' + parentId + ' .customPicker').empty().append(wemo.items['enter']).css({
	                        'background-color': '#fff',
	                        'color': '#000'
	                    });*/

	                    var activeButton = activeButton + '&&' + '-1';

	                    devicePlugin.execute(
	                        function(param) {
	                        },
	                        device_list_bridge.reportError,
	                        ACTION_SET_SHAREDPREF_FADER_TIME, [deviceId, activeButton]
	                    );

	                    //Timer Condition Ends

	                    if (className === 'led_off') {
	                        
		                    $('#' + parentId).find('.goSleep').attr('disabled', true).addClass('disableGoSleep setOpacity');
                            device_list_bridge.buttonController.goToSleep.disable();

	                        if (!panel.is(":visible")) {
	                            if (!$(panel).hasClass('drawerViewShow')) {
	                                $(panel).removeClass().addClass('drawerViewShow');
	                                $(panel).addClass('removeOpacity');
	                            }
	                            device_list_bridge.drawerSlider(deviceId, sliderValue, 'yes');
	                        } else {
	                            if (!$(panel).hasClass('drawerView') && !$(panel).hasClass('drawerViewShow')) {
	                                $(panel).removeClass().addClass('drawerView');
	                            }

	                        }

	                    }
	                    setTimeout(device_list_bridge.delayExecutionGroup(item), 50);
	                }
                
            }


        });


        //$("#group_list_bridge_container").on('tap',".groupDeviceList",function(){
        $(devicelistbridge).on('tap', ".groupDeviceList", function(e) {
        	e.preventDefault();
            var item = $(this);
            var deviceID = item.attr('id');
            var deviceMacID = [item.attr('wemo-device-macadress')];
            var parentClass = item.attr('class');

            if (parentClass.indexOf('disabled') == -1) {
                var groupId = $(this).attr('data-groupId');
                var className = $("#" + groupId).attr('class');

                	if(className.indexOf('led_value_loading') == -1)
	                {
	     
                		var drawerGrouplist = window.sessionStorage.getItem(sessionStore.LED_DRAWER_GROUP_LIST);
	                    var grouplistArr = window.sessionStorage.getItem(sessionStore.LED_DRAWER_GROUP_LIST).split(",");
	   
	                    if (grouplistArr.length <= 2) {
	                        $('#deletegroup_status_header').html(wemo.items['breakThisGroup']);
	                        $('#deletegroup_status_body').html(wemo.items['onlyTwoDevicesInGroup']);
	                        $("#deletegroup_status_popup").popup("open");
	                        var h = wemoUtil.getScreenHeight() + 100;
	                        $('.ui-popup-screen.in').css('height', h + 'px');
	                        window.sessionStorage.setItem(sessionStore.LED_DRAWER_GROUP_ID, groupId);
	                        window.sessionStorage.setItem(sessionStore.LED_DRAWER_DEVICE_ID, deviceID);
	                    } else {
	                        $("#" + deviceID).hide();
	                        var groupCapability = $("#" + groupId).attr('wemo-device-capabilities');
	                        var groupName = [$("#" + groupId).attr('wemo-device-friendly-name')];
	                        var groupstate = $("#" + groupId).attr('wemo-device-state-code');
	                        var groupcurrentVal = $('#slider-' + groupId).val();
	                        var deviceMacaddressList = $("#" + groupId).attr('wemo-group-mac-ids');
                            var capabilityIDsVal1 = $("#" + groupId).attr('wemo-group-capability-value');
                        
	                        var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
	                        groupcurrentVal = (groupcurrentVal * AllowedVal) / 100;
	                        groupcurrentVal = Math.floor(groupcurrentVal);
	                        var groupStateCurrentval = groupcurrentVal + ":0," + groupstate;

	                        var drawerGrouplist = window.sessionStorage.getItem(sessionStore.LED_DRAWER_GROUP_LIST);
	                        var newdrawerGrouplist = drawerGrouplist.replace(deviceID, "");
	                        newdrawerGrouplist = newdrawerGrouplist.replace(/[,\s]*,[,\s]*/g, ",");
	                        newdrawerGrouplist = newdrawerGrouplist.replace(/^,*/, "");
	                        newdrawerGrouplist = newdrawerGrouplist.replace(/,*$/, "");
	                        window.sessionStorage.setItem(sessionStore.LED_DRAWER_GROUP_LIST, newdrawerGrouplist);

	                        if (isRemoteEnabled) {
	                            var text = wemo.items['RemoveDevice'];
	                            var string = $('<p>' + text + '</p>').text();
	                            nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", string]);
	                            var groupUniqueID = $("#" + groupId).attr('wemo-device-groupunique-id');
	                            var groupdeviceIDS = window.sessionStorage.getItem(sessionStore.LED_DRAWER_GROUP_LIST).split(",");
	         
	                            var capabilityIDs1 = groupCapability.split(",");
	                            var currentval = groupcurrentVal + ":0";
	                            var xmlString = "";
	                            var refrenceID = groupId;
	                            var groupname = groupName;
	                            var groupID = groupId;
	                            var splitCapabilityArr = capabilityIDs1;
	                            var splitDeviceList = groupdeviceIDS;
	                            var iconversion = "";
	                            var state1 = $("#" + groupId).attr('wemo-device-state-code');
	                            var faderval = $("#" + groupId).attr('wemo-device-fader-value');
	                            var temperatureval = $("#" + groupId).attr('wemo-device-temperature-value');
	                            var colorval = $("#" + groupId).attr('wemo-device-color-value');
	                            
	                            if(deviceMacaddressList != undefined){
	                            	var newdeviceMacList = [];
	                            	deviceMacaddressList = deviceMacaddressList.split(",");
	                            	
	                            	jQuery.grep(deviceMacaddressList, function(el) {
	                                    if (jQuery.inArray(el, deviceMacID) == -1) newdeviceMacList.push(el);
	                                });
	                            	
	                            	deviceMacaddressList = newdeviceMacList.join(",");
	                            }
	                            
	                            xmlString = wemoUtil.updateGroupXML(groupUniqueID, refrenceID, groupname, iconversion,deviceMacaddressList,groupCapability,capabilityIDsVal1,splitDeviceList,splitCapabilityArr,state1,currentval,faderval,temperatureval,colorval);
	            
	                            wemoUtil.infoLog(device_list_bridge.TAGB, "priting XML Data in Remote for group*****" + xmlString);
	                            nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
	                            device_list_bridge.createGroups(xmlString, "updategroupfader").done(function() {
	                                nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
	    	                    });
	                        } else {

	                            var text = wemo.items['RemoveDevice'];
	                            var string = $('<p>' + text + '</p>').text();
	                            nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", string]);
	                            var capabilityIDs1 = groupCapability.split(",");

	                            var revArr = [];
	                            var i = 3;

	                            for (var j = 0; j < capabilityIDs1.length; j++) {
	                                if (capabilityIDs1[j] == 10008) {
	                                    revArr[0] = 10008;
	                                } else if (capabilityIDs1[j] == 10006) {
	                                    revArr[1] = 10006;
	                                } else if (capabilityIDs1[j] == 30008) {
	                                    revArr[2] = 30008;
	                                } else {
	                                    revArr[i] = capabilityIDs1[j];
	                                    i++;
	                                }
	                            }

	                            var capabilityrev = revArr.join(",");
	                            var inputArr1 = [newdrawerGrouplist];
	                            var inputArr2 = [capabilityrev];
	                            inputArr2 = inputArr2.reverse();
	                            var inputArr3 = [groupStateCurrentval];
	                            var groupidArr = [groupId];
	             
	                            devicePlugin.execute(
	                                function(response) {

	                                    var status = response[0].GetCreateGroupResponse;

	                                    if (status == 1 || status == 2 || status == 3 || status != "") {
	                                        $("#" + groupId).attr('wemo-device-groupids', newdrawerGrouplist);
	                                        $('#removedevice_status_header').html(wemo.items['RemoveDevice']);
	                                        $('#removedevice_status_body').html(wemo.items['deviceRemovedFromGroup']);
	                                        device_list_bridge.clearLedCache();
	                                        device_list_bridge.reloadLedDevices();
	                                        $("#removedevice_status_popup").popup("open");
	                                    } else {
	                                        alert(wemo.items['deviceNotRemoved']);
	                                    }
	                                    nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
	                                },
	                                device_list_bridge.reportError,
	                                ACTION_CREATE_GROUP, [inputArr1, inputArr2, inputArr3, groupName, groupidArr]
	                            );
	                        }

	                    }
	                    
	                }
                
            }

        });

        $('#deletegroup_cancel_btn').on('click', function() {
            var deviceid = window.sessionStorage.getItem(sessionStore.LED_DRAWER_DEVICE_ID);
            $("#" + deviceid).show();
            $("#deletegroup_status_popup").popup("close");
            window.sessionStorage.removeItem(sessionStore.LED_DRAWER_GROUP_ID);
            window.sessionStorage.removeItem(sessionStore.LED_DRAWER_DEVICE_ID);
        });

        $('#deletegroup_ok_btn').on('click', function() {
            window.sessionStorage.removeItem(sessionStore.LED_DRAWER_DEVICE_ID);
            $("#deletegroup_status_popup").popup("close");
            var groupid = [window.sessionStorage.getItem(sessionStore.LED_DRAWER_GROUP_ID)];

            if (isRemoteEnabled) {
                var text = wemo.items['DeletingGroup'];
                var string = $('<p>' + text + '</p>').text();
                nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", string]);

                /*****Database check before group delete*******/
                var groupID = window.sessionStorage.getItem(sessionStore.LED_DRAWER_GROUP_ID);
                db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
                db.transaction(fetchGroupInfoRemote, errorCBRemote, successCBRemote);

                function fetchGroupInfoRemote(tx) {
                    tx.executeSql('SELECT RuleID from RULEDEVICES where DeviceID Like "%' + groupID + '"', [], queryGroupSuccessRemote, errorCBRemote);
                }

                function errorCBRemote(err) {

                    nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);

                    //Delete Group
                    var xmlString = "";
                    var cdataStart = '<![CDATA[<DeleteGroup>';
                    var cdataEnd = '</DeleteGroup>]]>';

                    xmlString += CTemplator.fitIn('<group><content>[0]<referenceId>[1]</referenceId>[2]</content></group>', [cdataStart, groupid, cdataEnd]);

                    device_list_bridge.deleteGroups(xmlString, groupid);

                }

                function successCBRemote() {
                }

                function queryGroupSuccessRemote(tx, results) {
                    var len = results.rows.length;
                    var ruleDeviceRows = [];

                    if (len > 0) {
                        for (var i = 0; i < len; i++) {
                            ruleDeviceRows[i] = results.rows.item(i);
                        }

                        db.transaction(function(tx) {
                            deleteRulesDevicesRemote(tx, ruleDeviceRows)
                        }, errorCB);
                    } else {
                        //nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                        //Delete Group
                        var xmlString = "";
                        var cdataStart = '<![CDATA[<DeleteGroup>';
                        var cdataEnd = '</DeleteGroup>]]>';

                        xmlString += CTemplator.fitIn('<group><content>[0]<referenceId>[1]</referenceId>[2]</content></group>', [cdataStart, groupid, cdataEnd]);

                        device_list_bridge.deleteGroups(xmlString, groupid);
                    }

                }


                function deleteRulesDevicesRemote(tx, ruleDeviceRows) {

                    for (var i = 0; i < ruleDeviceRows.length; i++) {
                        console.log('DELETE from RULEDEVICES where DeviceID Like "%' + groupID + '" and RuleID=' + ruleDeviceRows[i].RuleID + '"');
                        tx.executeSql('DELETE from RULEDEVICES where DeviceID Like "%' + groupID + '";', [], executeSqlDeleteQueryRemoteSuccess, errorCBRemote)
                    }

                    db.transaction(function(tx) {
                        deleteRulesRemote(tx)
                    }, errorCB);

                }

                function executeSqlDeleteQueryRemoteSuccess(tx, results) {
                }

                function deleteRulesRemote(tx) {
                    tx.executeSql('DELETE FROM RULES WHERE RuleID NOT IN (SELECT RuleID FROM RULEDEVICES GROUP BY RuleID);', [], executeSqlDeleteQueryRemoteSuccess, errorCBRemote);
                    nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);

                    //Delete Group
                    var xmlString = "";
                    var cdataStart = '<![CDATA[<DeleteGroup>';
                    var cdataEnd = '</DeleteGroup>]]>';

                    xmlString += CTemplator.fitIn('<group><content>[0]<referenceId>[1]</referenceId>[2]</content></group>', [cdataStart, groupid, cdataEnd]);

                    device_list_bridge.deleteGroups(xmlString, groupid);

                    setTimeout(function() {
                        device_list_bridge.uploadDBOnCloud();
                    }, 1500);

                }

                /*****Database check before group delete end*******/

            } else {

                var text = wemo.items['DeletingGroup'];
                var string = $('<p>' + text + '</p>').text();
                nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", string]);
                var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
                var currentval = (100 * AllowedVal) / 100;
                currentval = Math.floor(currentval);
                //var CurrentVal = "0,"+currentval+":0";
                var CurrentVal = currentval + ":0,0";
                var state = "0";
                var groupID = window.sessionStorage.getItem(sessionStore.LED_DRAWER_GROUP_ID);

                /*****Database check before group delete*******/

                db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
                db.transaction(fetchGroupInfo, errorCB, successCB);

                function fetchGroupInfo(tx) {
                    tx.executeSql('SELECT RuleID from RULEDEVICES where DeviceID Like "%' + groupID + '"', [], queryGroupSuccess, errorCB);
                }

                function errorCB(err) {
       
                    var inputArr = [CurrentVal, groupID, "10008,10006", "YES"];

                    devicePlugin.execute(
                        function() {

                            var newClass = device_list_bridge.getBinaryStateImage(state);
                            $("#" + groupID).attr('wemo-device-state-code', state);
                            $("#" + groupID).removeClass();
                            $("#" + groupID).addClass(newClass);
                            $("#" + groupID).attr('wemo-device-state', newClass);

                        },
                        device_list_bridge.reportError,
                        ACTION_SET_LED_STATUS, [inputArr]
                    );

                    setTimeout(function() {
                        devicePlugin.execute(
                            function(response) {
                                if (response == null || response == undefined || response == "") {
                                    alert(wemo.items['LEDGrpdeletionFails']);
                                    nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                                } else {
                                    var status = response[0].GetDeleteResponse;
                                    nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);

                                    if (status == 1 || status != "") {
                                        var text = wemo.items['RefreshDeviceList'];
                                        var string = $('<p>' + text + '</p>').text();
                                        nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", string]);
                                        counterCall = 0;
                                        device_list_bridge.clearLedCache();

                                        setTimeout(function() {
                                            device_list_bridge.reloadLedDevices();
                                            //device_list_bridge.loadBridgeDevicesFromUpNp("load");
                                        }, 800);

                                    }
                                }

                            },
                            device_list_bridge.reportError,
                            ACTION_DELETE_GROUP, [groupid]
                        );
                    }, 1400);

                }

                function successCB() {
                }

                function queryGroupSuccess(tx, results) {
    
                    var len = results.rows.length;
                    var ruleDeviceRows = [];

                    if (len > 0) {
                        for (var i = 0; i < len; i++) {
                            ruleDeviceRows[i] = results.rows.item(i);
                        }

                        db.transaction(function(tx) {
                            deleteRulesDevices(tx, ruleDeviceRows)
                        }, errorCB);
                    } else {
                    	
                    	var capabilities = ledCapabilities.DIMMING + "," + ledCapabilities.ONOFF;
                        var inputArr = [CurrentVal, groupID, capabilities, "YES"];

                        devicePlugin.execute(
                            function() {

                                var newClass = device_list_bridge.getBinaryStateImage(state);
                                $("#" + groupID).attr('wemo-device-state-code', state);
                                $("#" + groupID).removeClass();
                                $("#" + groupID).addClass(newClass);
                                $("#" + groupID).attr('wemo-device-state', newClass);

                            },
                            device_list_bridge.reportError,
                            ACTION_SET_LED_STATUS, [inputArr]
                        );

                        setTimeout(function() {
                            devicePlugin.execute(
                                function(response) {

                                    if (response == null || response == undefined || response == "") {
                                        alert(wemo.items['LEDGrpdeletionFails']);
                                        nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                                    } else {
                                        var status = response[0].GetDeleteResponse;
                                        nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);

                                        if (status == 1 || status != "") {
                                            var text = wemo.items['RefreshDeviceList'];
                                            var string = $('<p>' + text + '</p>').text();
                                            nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", string]);
                                            counterCall = 0;
                                            device_list_bridge.clearLedCache();

                                            setTimeout(function() {
                                                device_list_bridge.reloadLedDevices();
                                                //device_list_bridge.loadBridgeDevicesFromUpNp("load");
                                            }, 800);
                                        }
                                    }

                                },
                                device_list_bridge.reportError,
                                ACTION_DELETE_GROUP, [groupid]
                            );
                        }, 1400);

                    }

                }


                function deleteRulesDevices(tx, ruleDeviceRows) {
 
                    for (var i = 0; i < ruleDeviceRows.length; i++) {
                        console.log('DELETE from RULEDEVICES where DeviceID Like "%' + groupID + '" and RuleID=' + ruleDeviceRows[i].RuleID + '"');
                        tx.executeSql('DELETE from RULEDEVICES where DeviceID Like "%' + groupID + '";', [], executeSqlDeleteQuerySuccess, errorCB)
                    }

                    db.transaction(function(tx) {
                        deleteRules(tx)
                    }, errorCB);

                }

                function executeSqlDeleteQuerySuccess(tx, results) {
                }

                function deleteRules(tx) {
                    tx.executeSql('DELETE FROM RULES WHERE RuleID NOT IN (SELECT RuleID FROM RULEDEVICES GROUP BY RuleID);', [], executeSqlDeleteQuerySuccess, errorCB);

                    /******** Delete weekly calender************/

                    devicePlugin.execute(
                        function() {
                        },
                        device_list_bridge.reportError,
                        actions.DELETE_WEEKLY_CALENDAR, [groupID]
                    );

                    /******** Delete weekly calender end************/
                    var capabilities = ledCapabilities.DIMMING + "," + ledCapabilities.ONOFF;
                    var inputArr = [CurrentVal, groupID, capabilities, "YES"];

                    setTimeout(function() {
                        devicePlugin.execute(
                            function() {

                                var newClass = device_list_bridge.getBinaryStateImage(state);
                                $("#" + groupID).attr('wemo-device-state-code', state);
                                $("#" + groupID).removeClass();
                                $("#" + groupID).addClass(newClass);
                                $("#" + groupID).attr('wemo-device-state', newClass);

                            },
                            device_list_bridge.reportError,
                            ACTION_SET_LED_STATUS, [inputArr]
                        );
                    }, 800);

                    setTimeout(function() {
                        devicePlugin.execute(
                            function(response) {
                                if (response == null || response == undefined || response == "") {
                                    alert(wemo.items['LEDGrpdeletionFails']);
                                    nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                                } else {
                                    var status = response[0].GetDeleteResponse;
                                    nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);

                                    if (status == 1 || status != "") {
                                        var text = wemo.items['RefreshDeviceList'];
                                        var string = $('<p>' + text + '</p>').text();
                                        nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", string]);
                                        counterCall = 0;
                                        device_list_bridge.clearLedCache();

                                        setTimeout(function() {
                                            device_list_bridge.reloadLedDevices();
                                            //device_list_bridge.loadBridgeDevicesFromUpNp("load");
                                        }, 800);

                                        setTimeout(function() {
                                            device_list_bridge.pushDB();
                                        }, 1500);
                                    }
                                }

                            },
                            device_list_bridge.reportError,
                            ACTION_DELETE_GROUP, [groupid]
                        );
                    }, 1600);

                    //nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
                }

                /*****Database check before group delete end*******/

            }
            window.sessionStorage.removeItem(sessionStore.LED_DRAWER_GROUP_ID);

        });


        $('#removedevice_ok_btn').on('click', function() {
            $("#removedevice_status_popup").popup("close");
            nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);

            if (isRemoteEnabled)
                device_list.loadDevicesFromCloud("refresh");
            else {
                counterCall = 0;
                device_list_bridge.loadBridgeDevicesFromUpNp("");
            }

        });

        $('#deletegroup_cancel_btn').on('click', function() {
            $("#deletegroup_status_popup").popup("close");
        });

        $(devicelistbridge).on('tap', ".disabled", function(e) {
            var divClass = $(this).attr('class');

            if (divClass.indexOf('groupDeviceList') == -1) {
                var udn = $(this).attr('wemo-device-udn');
                device_list_bridge.hideDevice(udn);
            }

        });
        
        $(devicelistbridge).on('tap', ".colorPickerMainDiv", function(e) {
        	e.preventDefault();
        	window.sessionStorage.setItem(sessionStore.IS_COLOR_TEMP_PICKER, true);
        		device_list_bridge.cctBulbInfo = {};
        		var divID = $(this).closest("li").attr('data-deviceid');
        	    var liLedtype = $(this).closest("li").attr('name');
        	    var modelcode = $("#"+divID).attr('wemo-device-modelcode');
        	    
        	    if(isRemoteEnabled){
        	    	if(modelcode && modelcode.indexOf(",")){
                 		var modelcodeArr = modelcode.split(",");
                 		modelcode = modelcodeArr[0];
                 	}
        	    }
        	    $('.overlayScrollPicker').attr('style', 'display: block;');
        	    var ledDeviceType = wemoUtil.ledBulbType(modelcode);
                if(wemoUtil.isColoredBulb(ledDeviceType)){
		            	$(".colortemperatureTitle").html(wemo.items['ColorTitle']);
		            	$("#colortemp").find('.picker_header_ScrollPicker').css('border-bottom', '2px solid #73d44c');
        	    		$("#colortemptab").hide();
		            	$("#tempColorPickerPopup_content").hide();
		             	$("#colorpicker_content").show();
		             	$('.overlayScrollPicker').attr('data-selectedtype', sessionStore.COLOR_BULB_TYPE);
	            		var colorVal = $('#drawer-' + divID).find(".colorPickerMainDiv").attr("data-Color");
	             	    var rgbColor = sessionStore.DEFAULT_RGB_VALUE;
	             	    
	             		if(colorVal != undefined && colorVal != "" && colorVal.indexOf(":") != -1){
	             			var colorTempVal = colorVal.split(':');
	                     	rgbColor = wemoUtil.convertColorToRGB(colorTempVal[0],colorTempVal[1]);
	                     	
	                     	if(!rgbColor){
	                     		rbgColor=sessionStore.DEFAULT_RGB_VALUE;
                        	}
	        
	             		}
	            
	             		 $(".colorDisplay").css("background-color", rgbColor);
	                     $(".colorDisplay").attr('data-selectedcolor', rgbColor);
	                     $(".colorPicker .magnifiercolor").css('background-color', rgbColor);
	                     wemoUtil.colorPickerInitialization(rgbColor);

	            }else{
	             		$(".colortemperatureTitle").html(wemo.items['colortemperatureTitle']);
	             		$("#colortemp").find('.picker_header_ScrollPicker').css('border-bottom', 'none');
	            		$("#colortemptab").show();
		         
	            		$('.overlayScrollPicker').attr('data-selectedtype', sessionStore.COLOR_BULB_TYPE);
	            		var colorVal = $('#drawer-' + divID).find(".colorPickerMainDiv").attr("data-Color");
	             	    var rgbColor = sessionStore.DEFAULT_RGB_VALUE;
	             	    
	             		if(colorVal != undefined && colorVal != 0){
		             			$("#temperature").removeClass("selected");
		                    	$("#color").addClass("selected");
		                    	
		                    	if(colorVal.indexOf(":") != -1){
		                    		var colorTempVal = colorVal.split(':');
		                     		rgbColor = wemoUtil.convertColorToRGB(colorTempVal[0],colorTempVal[1]);
		                     		
		                     		if(!rgbColor){
		                     			rbgColor=sessionStore.DEFAULT_RGB_VALUE;
	                            	}

		                    	}
		                    	
		                     	$("#tempColorPickerPopup_content").hide();
			            		$(".colorDisplay").css("background-color", rgbColor);
			                    $(".colorDisplay").attr('data-selectedcolor', rgbColor);
			                    $(".colorPicker .magnifiercolor").css('background-color', rgbColor);
			                    $("#colorpicker_content").show();
			                    wemoUtil.colorPickerInitialization(rgbColor);
			            		
	             		}else{
	             			var temperatureVal = $('#drawer-' + divID).find(".colorPickerMainDiv").attr("data-ttbColor");
	             			
	             			if(temperatureVal != undefined && temperatureVal != 0)
	             			{
		             				$("#color").removeClass("selected");
			                    	$("#temperature").addClass("selected");
		             				$("#colorpicker_content").hide();
		             				$('.overlayScrollPicker').attr('data-selectedtype', sessionStore.TEMP_BULB_TYPE);
		             				var kelvinTemperarture = sessionStore.TEMPERATURE_DEFAULT_VALUE
		             					
		             				if(temperatureVal.indexOf(":") != -1){
		             					var TempVal = temperatureVal.split(':');
		             					kelvinTemperarture = wemoUtil.convertColorToTemperature(TempVal[0]);
			                     	}
		             				
		             				var rgbColor = wemoUtil.convertTemperatureToRGB(kelvinTemperarture);
		                        	$(".tempColorDisplay").css("background-color", rgbColor);
				                    $("#picker").attr('data-selectedTemperature', rgbColor);
				                    $("#picker .magnifier").css('background-color', rgbColor);
		                        	wemoUtil.temperaturePickerInitialization(kelvinTemperarture);
				              		$("#tempColorPickerPopup_content").show();
	                    	}else{
		                    		$("#temperature").removeClass("selected");
			                    	$("#color").addClass("selected");
		                    		if(colorVal.indexOf(":") != -1){
		                    			var colorTempVal = colorVal.split(':');
				                     	rgbColor = wemoUtil.convertColorToRGB(colorTempVal[0],colorTempVal[1]);
				                     	
				                     	if(!rgbColor)
				                     		rbgColor=sessionStore.DEFAULT_RGB_VALUE;
		                    		}
			                     	$("#tempColorPickerPopup_content").hide();
				            		$(".colorDisplay").css("background-color", rgbColor);
				                    $(".colorDisplay").attr('data-selectedcolor', rgbColor);
				                    $(".colorPicker .magnifiercolor").css('background-color', rgbColor);
				                    $("#colorpicker_content").show();
				             		wemoUtil.colorPickerInitialization(rgbColor);
				             		
	                    	}
                    		
	             		}
	            		
	            }
 	        	//$('.overlayScrollPicker').attr('style', 'visibility: visible;');
 	        	//$('.overlayScrollPicker').attr('style', 'display: block;');
	            $('.overlayScrollPicker').attr('data-deviceId', divID);
	            $('.overlayScrollPicker').attr('data-Led-type', liLedtype);
            
         });

        $(devicelistbridge).on('tap', ".temperatureColorRow", function(e) {
        	e.preventDefault();
        	window.sessionStorage.setItem(sessionStore.IS_COLOR_TEMP_PICKER, true);
        	var deviceId = $(this).closest("li").attr('data-deviceid');
        	var name = $(this).closest("li").attr('name');
        	var colorVal = $('#drawer-' + deviceId).find(".temperatureColorRow").attr("data-ttbColor");
        	var colorTempVal = colorVal.split(':');
        	var kelvinTemperarture = wemoUtil.convertColorToTemperature(colorTempVal[0]);
        	var Macadd="";
        	var DeviceType="";
        	device_list_bridge.cctBulbInfo.deviceId = deviceId;
        	device_list_bridge.cctBulbInfo.ledType = name;
        	device_list_bridge.cctBulbInfo.kelvinTempValue = kelvinTemperarture;
        	device_list_bridge.cctBulbInfo.isTTB = true;
		        $('#pickerTTB').farbtastic({
		            prefix: '.prefixTemps',
		            //pass kelvin temperature value to the picker
		            temperature: kelvinTemperarture
		        });
        	$('.overlayScrollPickerTemp').attr("style","visibility:visible;");
        	
               	 
         });
        
           
        $("#color").on('tap',function(e) {
        	e.preventDefault();
        	$("#temperature").removeClass("selected");
        	$("#color").addClass("selected");
        	$("#colorpicker_content").show();
           	$("#tempColorPickerPopup_content").hide();
           	$('.overlayScrollPicker').attr('data-selectedtype', sessionStore.COLOR_BULB_TYPE);
        	var divID = $('.overlayScrollPicker').attr('data-deviceId');
    	    var liLedtype = $(this).closest("li").attr('name');
    	    var colorVal = $('#drawer-' + divID).find(".colorPickerMainDiv").attr("data-Color");
    	    var rgbColor = sessionStore.DEFAULT_RGB_VALUE;
    	    
    		if(colorVal != undefined && colorVal != 0 && colorVal.indexOf(":") != -1){
    			var colorTempVal = colorVal.split(':');
            	rgbColor = wemoUtil.convertColorToRGB(colorTempVal[0],colorTempVal[1]);
            	
            	if(!rgbColor)
            		rbgColor=sessionStore.DEFAULT_RGB_VALUE;
    		}
    	
    		$(".colorDisplay").css("background-color", rgbColor);
            $(".colorDisplay").attr('data-selectedcolor', rgbColor);
            $("#colorPicker .magnifiercolor").css('background-color', rgbColor);
            
    		wemoUtil.colorPickerInitialization(rgbColor);
        	
        });
        
        $("#temperature").on('tap',function(e) {
        	e.preventDefault();
        	$("#color").removeClass("selected");
        	$("#temperature").addClass("selected");
	    
         	var deviceId = $('.overlayScrollPicker').attr('data-deviceId');
     		var colorVal = $('#drawer-' + deviceId).find(".colorPickerMainDiv").attr("data-ttbColor");
     		var kelvinTemperarture = sessionStore.TEMPERATURE_DEFAULT_VALUE;
     		
     		if(colorVal.indexOf(":") != -1)
     		{
     			var colorTempVal = colorVal.split(':');
		        kelvinTemperarture = wemoUtil.convertColorToTemperature(colorTempVal[0]);
     		}
     		
     		var rgbColor = wemoUtil.convertTemperatureToRGB(kelvinTemperarture);
     		$(".tempColorDisplay").css("background-color", rgbColor);
            $("#picker").attr('data-selectedTemperature', rgbColor);
            $("#picker .magnifier").css('background-color', rgbColor);
     		wemoUtil.temperaturePickerInitialization(kelvinTemperarture);
         
        	$("#tempColorPickerPopup_content").show();
     		$("#colorpicker_content").hide();
     		$('.overlayScrollPicker').attr('data-selectedtype', sessionStore.TEMP_BULB_TYPE);
     		
        });
      
        /*************End*********************************/ 
        device_list_bridge.loadBridgeDevicesFromCache();
    },
    
    setTemperature : function(reqtype, currID, groupID, tempValue){
    	var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
    	var dimmingvalue = sessionStore.LED_DEFAULT_BRIGHTNESS;
    	var devlist = "";
    	var inputArr = "";
    	var capabilities = ledCapabilities.ONOFF+","+ledCapabilities.DIMMING+","+ledCapabilities.FADER+","+ledCapabilities.TEMPERATURE;
    	var modelcode = "";
        var deviceID = "";
        var fadervalue = statusCode.OFF+":"+statusCode.OFF;
        
           if (reqtype == ledDeviceConstants.SINGLE) {
               devlist = [currID];
               modelcode = $("#"+currID).attr('wemo-device-modelcode');
               deviceID = currID;
               var ledDeviceType = wemoUtil.ledBulbType(modelcode);
               dimmingvalue = $("#mainLIID" + deviceID).find('.sliderValue').text();
               
               if(dimmingvalue.indexOf("%") == -1) {
          	    	dimmingvalue = $("#" + deviceID).find('.bulbStrength').text();
               }
               
               dimmingvalue = dimmingvalue.replace(/%$/, '');
               dimmingvalue = (dimmingvalue * AllowedVal) / 100;
               dimmingvalue = Math.floor(dimmingvalue);
               dimmingvalue = dimmingvalue+":"+statusCode.OFF;
               var currentVal = statusCode.ON+","+dimmingvalue+","+fadervalue+","+tempValue+":"+statusCode.OFF;
               
	           if(wemoUtil.isColoredandTemperaturedBulb(ledDeviceType)){
	        	    currentVal = statusCode.ON+","+dimmingvalue+","+fadervalue+","+statusCode.OFF+","+tempValue+":"+statusCode.OFF;
	           		capabilities = ledCapabilities.ONOFF+","+ledCapabilities.DIMMING+","+ledCapabilities.FADER+","+ledCapabilities.COLOR+","+ledCapabilities.TEMPERATURE;
	           }
        
	           inputArr = [currentVal,capabilities , "NO"];
           } else if (reqtype == ledDeviceConstants.GROUP) {
               devlist = [groupID];
               modelcode = $("#"+groupID).attr('wemo-device-modelcode');
               deviceID = groupID;
               var ledDeviceType = wemoUtil.ledBulbType(modelcode);
               dimmingvalue = $("#mainLIID" + deviceID).find('.sliderValue').text();
               
               if(dimmingvalue.indexOf("%") == -1) {
          	    	dimmingvalue = $("#" + deviceID).find('.bulbStrength').text();
               }
               
               dimmingvalue = dimmingvalue.replace(/%$/, '');
               dimmingvalue = (dimmingvalue * AllowedVal) / 100;
               dimmingvalue = Math.floor(dimmingvalue);
               dimmingvalue = dimmingvalue+":"+statusCode.OFF;
               var currentVal = statusCode.ON+","+dimmingvalue+","+fadervalue+","+tempValue+":"+statusCode.OFF;
               	
	           if(wemoUtil.isColoredandTemperaturedBulb(ledDeviceType)){
	        	   currentVal = statusCode.ON+","+dimmingvalue+","+fadervalue+","+statusCode.OFF+","+tempValue+":"+statusCode.OFF;
	           	   capabilities = ledCapabilities.ONOFF+","+ledCapabilities.DIMMING+","+ledCapabilities.FADER+","+ledCapabilities.COLOR+","+ledCapabilities.TEMPERATURE;
	           }
    
               inputArr = [currentVal,capabilities, "YES"];
           }
           
           if (!isRemoteEnabled) {
        	   devicePlugin.execute(
                       function(response) {
                    	   wemoUtil.infoLog(device_list_bridge.TAGB,"Response :: "+ JSON.stringify(response));
                    	   device_list_bridge.changeLEDStateClass(deviceID,"1");
                    	   var capabilityids = $("#"+deviceID).attr('wemo-device-capabilities');
                    	   var capabilityval = $("#"+deviceID).attr('wemo-device-capabilities-values');
                    	   var capabilitiesIDVal = wemoUtil.mappingCapabilityIDwithCurrentValue(capabilityids,capabilityval,ledCapabilities.TEMPERATURE,tempValue+":0");
                    	   $("#"+deviceID).attr('wemo-device-capabilities-values', capabilitiesIDVal);
                    	   capabilityval=capabilitiesIDVal;
                    	   var capabilitiesIDVal = wemoUtil.mappingCapabilityIDwithCurrentValue(capabilityids,capabilityval,ledCapabilities.COLOR,"0");
                    	   $("#"+deviceID).attr('wemo-device-capabilities-values', capabilitiesIDVal);
                    	   device_list_bridge.cancelSleepFader(deviceID);
                       },
                       device_list_bridge.reportError,
                       ACTION_SET_LED_STATUS, [inputArr, devlist]
                   );
        	   
           } else {
               //remote call for setting temperature change...
           }
    },
       
    setTemperatureRemote : function(pluginId, macAddress, devicetype, tempValue){
    	 var currentVal = tempValue+":0";
       	 var capabilitytype = ledDeviceConstants.CAPABILITYTEMPERATURE;
         var xml_request = device_list_bridge.buildXMLForledStateChange(pluginId, macAddress,"" , "", devicetype, "", "", "", capabilitytype, currentVal);
         device_list_bridge.ledstateChangeOnCloud(xml_request, "statusdimmingvalchange");
          
    },

    delayExecution: function(arg) {

        //var currID= arg.attr('id');
        var item = "";
        var ledObj = {};

        ledObj.isRemoteEnabled = isRemoteEnabled;
        if (!isRemoteEnabled) {

            //item = $(this).find('span[name="name_led_device_state"]');
            item = arg;
            var switchPrevState = item.attr('wemo-device-state-code');

            var currID = item.attr('id');
            var CurrentDimmingValue = $("ul li[data-deviceid=" + currID + "]").find('.sliderValue').text();

            CurrentDimmingValue = CurrentDimmingValue.replace("%", "");
            
            if(isNaN(CurrentDimmingValue) == true)
            {
            	CurrentDimmingValue = $("ul li[data-deviceid=" + currID + "]").find('.bulbStrength').text();
            	CurrentDimmingValue = CurrentDimmingValue.replace("%", "");
            }
            
            var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;

            var currentval = (CurrentDimmingValue * AllowedVal) / 100;
            currentval = Math.floor(currentval);

            var CurrentVal = currentval + ":0";
            var presentClass = item.attr('class');

            if ($.trim(presentClass) == "led_on") {
                item.removeClass(presentClass);
                item.addClass("loading_animation ledanimatedHelperOn");
            } else {
                item.removeClass(presentClass);
                item.addClass("loading_animation ledanimatedHelperOff");
            }

            animationLED = item.animatePNG("../img/power_button/animation_160@.png", 81, 81, 11, {
                horizontal: false
            });


            if (switchPrevState == "0") {
                //$("#data").listview("refresh");
                item.attr('wemo-device-state', "switch_activated");
                var state = 1;
                device_list_bridge.stateChange(state, ledDeviceConstants.SINGLE, currID, "", CurrentVal);
            } else if (switchPrevState == "1") {
                //$("#data").listview("refresh");
                item.attr('wemo-device-state', "switch_activated");
                var state = 0;
                device_list_bridge.stateChange(state, ledDeviceConstants.SINGLE, currID, "", CurrentVal);
            }

            ledObj.ID = item.attr('id');

        } else {
            item = arg;
            //item = $(this).find('span[name="name_led_device_state"]');
            ledObj.ID = item.attr('id');
            ledObj.MacAdd = item.attr('wemo-device-mac-address');
            ledObj.Type = item.attr('wemo-device-type');
            ledObj.ParentID = item.attr('wemo-device-parent-plugin-id');
            var homeID = window.sessionStorage.getItem(sessionStore.SETUP_HOME_ID);

            if (item.attr('wemo-device-type') == wemoLed.REMOTE_TYPE || wemoUtil.isSupportedLedModelCode(item.attr('wemo-device-type'))) {
             
                //item.removeClass();
                //item.addClass("switch_activated");

                setTimeout(function() {
                    var switchPrevState = item.attr('wemo-device-state-code');
                    var capabilitytype = ledDeviceConstants.CAPABILITYONOFF;

                    var presentClass = item.attr('class');

                    if ($.trim(presentClass) == "led_on") {
                        item.removeClass(presentClass);
                        //item.addClass("loading_animation ledanimatedHelperOn");
                        item.addClass("switch_activated");

                        if (switchPrevState == "" || switchPrevState == undefined)
                            switchPrevState = "1";

                    } else {
                        item.removeClass(presentClass);
                        //item.addClass("loading_animation ledanimatedHelperOff");
                        item.addClass("switch_activated");

                        if (switchPrevState == "" || switchPrevState == undefined)
                            switchPrevState = "0";
                    }
                    
                    var CurrentDimmingValue = $("ul li[data-deviceid=" + ledObj.ID + "]").find('.sliderValue').text();
                    CurrentDimmingValue = CurrentDimmingValue.replace("%", "");
                    
                    if(isNaN(CurrentDimmingValue) == true)
                    {
                    	CurrentDimmingValue = $("ul li[data-deviceid=" + ledObj.ID + "]").find('.bulbStrength').text();
                    	CurrentDimmingValue = CurrentDimmingValue.replace("%", "");
                    }
                    	
                    	
                    var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;

                    var currentval = (CurrentDimmingValue * AllowedVal) / 100;
                    currentval = Math.floor(currentval);
                    var CurrentVal = currentval + ":0";
          
                    if (switchPrevState == "0") {
                        item.attr('wemo-device-state', "switch_activated");
                        var xml_request = device_list_bridge.buildXMLForledStateChange(item.attr('wemo-device-plugin-id'), item.attr('wemo-device-mac-address'), 1, item.attr('wemo-device-friendly-name'), item.attr('wemo-device-type'), ledObj.ParentID, homeID, ledObj.ID, capabilitytype, CurrentVal);
                        device_list_bridge.ledstateChangeOnCloud(xml_request, "statusdimmingvalchange");
                    } else if (switchPrevState == "1") {
                        item.attr('wemo-device-state', "switch_activated");
                        var xml_request = device_list_bridge.buildXMLForledStateChange(item.attr('wemo-device-plugin-id'), item.attr('wemo-device-mac-address'), 0, item.attr('wemo-device-friendly-name'), item.attr('wemo-device-type'), ledObj.ParentID, homeID, ledObj.ID, capabilitytype, CurrentVal);
                        device_list_bridge.ledstateChangeOnCloud(xml_request, "statusdimmingvalchange");
                    }
                }, timeout.LONG);
            }

        }


    },

    delayExecutionGroup: function(arg) {

        var item = "";
        var ledObj = {};

        ledObj.isRemoteEnabled = isRemoteEnabled;
        if (!isRemoteEnabled) {

            //item = $(this).find('span[name="name_led_device_state"]');
            item = arg;
            var switchPrevState = item.attr('wemo-device-state-code');
            item.removeClass();
            item.addClass("switch_activated");
            var currID = item.attr('wemo-device-groupids');
            var GroupID = item.attr('id');

            var CurrentDimmingValue = $("ul li[data-deviceid=" + GroupID + "]").find('.sliderValue').text();
            CurrentDimmingValue = CurrentDimmingValue.replace("%", "");

            if (CurrentDimmingValue.indexOf("unavailable bulb(s)") != -1)
                CurrentDimmingValue = $.trim(CurrentDimmingValue.replace("unavailable bulb(s)", ""));
            
            if(isNaN(CurrentDimmingValue) == true)
            {
            	CurrentDimmingValue = $("ul li[data-deviceid=" + GroupID + "]").find('.bulbStrength').text();
            	CurrentDimmingValue = CurrentDimmingValue.replace("%", "");
            }

            var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
            var currentval = (CurrentDimmingValue * AllowedVal) / 100;
            currentval = Math.floor(currentval);

            var CurrentVal = currentval + ":0";


            if (switchPrevState == "0") {
                item.attr('wemo-device-state', "switch_activated");
                item.removeClass();
                item.addClass("switch_activated");
                var state = 1;
                device_list_bridge.stateChange(state, ledDeviceConstants.GROUP, currID, GroupID, CurrentVal);
            } else if (switchPrevState == "1") {
                item.attr('wemo-device-state', "switch_activated");
                item.removeClass();
                item.addClass("switch_activated");
                var state = 0;
                device_list_bridge.stateChange(state, ledDeviceConstants.GROUP, currID, GroupID, CurrentVal);
            }

        } else {
            var item = arg;
            var switchPrevState = item.attr('wemo-device-state-code');

            if (item.attr('wemo-device-type') == wemoLed.REMOTE_TYPE || wemoUtil.isSupportedLedModelCode(item.attr('wemo-device-type'))) {
         
                var deviceIDs = item.attr('wemo-device-groupids');
                var GroupID = item.attr('id');
                var capabilityIDS = item.attr('wemo-device-capabilities');
                var Groupname = item.attr('wemo-device-friendly-name');
                var GroupUniqueID = item.attr('wemo-device-groupunique-id');
                var homeID = window.sessionStorage.getItem(sessionStore.SETUP_HOME_ID);

                var presentClass = item.attr('class');

                if ($.trim(presentClass) == "led_on") {
                    item.removeClass(presentClass);
                    //item.addClass("loading_animation ledanimatedHelperOn");
                    item.addClass("switch_activated");
                } else {
                    item.removeClass(presentClass);
                    //item.addClass("loading_animation ledanimatedHelperOff");
                    item.addClass("switch_activated");
                }

                var CurrentDimmingValue = $("ul li[data-deviceid=" + GroupID + "]").find('.sliderValue').text();
                CurrentDimmingValue = CurrentDimmingValue.replace("%", "");
                
                if(isNaN(CurrentDimmingValue) == true)
                {
                	CurrentDimmingValue = $("ul li[data-deviceid=" + GroupID + "]").find('.bulbStrength').text();
                	CurrentDimmingValue = CurrentDimmingValue.replace("%", "");
                }
                
                var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
                var currentval = (CurrentDimmingValue * AllowedVal) / 100;
                currentval = Math.floor(currentval);

                var CurrentVal = currentval + ":0";

                if (switchPrevState == "0") {
                    item.attr('wemo-device-state', "switch_activated");
                    var state = 1;
                    var capabilitytype = ledDeviceConstants.CAPABILITYONOFF;
                    var xml_request = device_list_bridge.buildXMLForledGroupStateChange(GroupID, deviceIDs, capabilityIDS, Groupname, homeID, state, capabilitytype, "", GroupUniqueID, CurrentVal);
                    device_list_bridge.ledGroupstateChangeOnCloud(xml_request, "statusdimmingvalchange");
                } else if (switchPrevState == "1") {
                    item.attr('wemo-device-state', "switch_activated");
                    var state = 0;
                    var capabilitytype = ledDeviceConstants.CAPABILITYONOFF;
                    var xml_request = device_list_bridge.buildXMLForledGroupStateChange(GroupID, deviceIDs, capabilityIDS, Groupname, homeID, state, capabilitytype, "", GroupUniqueID, CurrentVal);
                    device_list_bridge.ledGroupstateChangeOnCloud(xml_request, "statusdimmingvalchange");
                }

            }

        }

    },

    closeAllBulbDrawerandOverlay: function() {
        $("#device_container .drawerViewShow").removeClass('drawerViewShow')
                                              .addClass('drawerView');
        $(".device_list_ul .iconType").removeClass('drawer_icon_arrow_up')
                                      .addClass('drawer_icon_arrow_down');
        $(".led_timer_popup").hide();
    },

    bindEvents: function() {
        document.addEventListener('online', device_list_bridge.onOnline, false);
        document.addEventListener('offline', device_list_bridge.onOffline, false);
        document.addEventListener("backbutton", device_list_bridge.onBackPress, false);
        document.addEventListener("pause", device_list_bridge.onPause, false);
        document.addEventListener("resume", device_list_bridge.onResume, false);
    },

    onOffline: function() {
        console.log(TAGB + "offLine");
        deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
    },

    onOnline: function() {
        console.log(TAGB + "onLine");
    },

    onResume: function() {
        console.log(TAGB + "onResume");
    },

    reportError: function(e) {
        nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
        console.log(TAGB + "Plugin Failure Call back!!!!   " + e);
    },


    reportLedRemoveError: function(e) {
        console.log(TAGB + "reportLedRemoveError Plugin Failure Call back!!!!   " + e);
    },

    initializeDOMElements: function() {
        wemoUtil.infoLog(device_list_bridge.TAGB, 'initializeDOMElements');
        device_list_bridge.deviceBridgeListContainer = $(devicelistbridge);
    },

    setupDOMListeners: function() {
        wemoUtil.infoLog(device_list_bridge.TAGB, 'setupDOMListeners');
        (device_list_bridge.deviceBridgeListContainer).bind("DOMSubtreeModified", device_list_bridge.deviceListContainerChange);

    },

    deviceListContainerChange: function() {

        if ($(devicelistbridgelistitem).length == 0) {
            wemoUtil.infoLog(device_list_bridge.TAGB, 'show looking for devices11');
        } else {
            //show device list
            wemoUtil.infoLog(device_list_bridge.TAGB, 'hide looking for devices11');
            if (isRemoteEnabled) {} else {
                modifyDeviceController.show();
            }
        }
    },

    //------------------------ LED & Sort by Name ------------------------------------
    sortByKey: function(array, key) {
        return array.sort(function(a, b) {
            var x = a[key].toLowerCase();
            var y = b[key].toLowerCase();
            return ((x < y) ? -1 : ((x > y) ? 1 : 0));
        });
    },
    loadBridgeDevicesFromCache: function() {
        sharedPreferences.get(sharedPreferencesConstants.WEMO_NAMESPACE, sharedPreferencesConstants.WEMO_LED_DEVICE_CACHE, '', function(value) {
            console.log("loadBridgeDevicesFromCloud cache get value: " + value);

            if (value != null && value.length > 0) {
                arrCache = JSON.parse(value);
                _ledDeviceCache = arrCache;
            }
        });
    },
    
    sortByLocalOrder: function(leddevices) {
        var newarrayfound = [];
        var newarraynotfound = [];
        
        for (var i = 0; i < arrCache.length; i++) {
        	var tempDeviceList;
        	for (var j = 0; j < leddevices.length; j++) {
        		tempDeviceList = leddevices[j];
        		if ((tempDeviceList[key.DEVICE_GROUP_ID] != undefined) && (tempDeviceList[key.DEVICE_GROUP_ID] != "")){
        			if(tempDeviceList[key.DEVICE_GROUP_ID] == arrCache[i].GroupID) {
        				newarrayfound.push(tempDeviceList);
        				break;
        			}
        		}
        		else if(tempDeviceList[key.DEVICE_ID] == arrCache[i].DeviceID){
        			newarrayfound.push(tempDeviceList);
        			break;
        		}
        	}
        }
        
        for (var j = 0; j < leddevices.length; j++) {
        	tempDeviceList = leddevices[j];
        	var found = false;
        	for (var i = 0; i < arrCache.length; i++) {

        		if ((tempDeviceList[key.DEVICE_GROUP_ID] != undefined) &&  (tempDeviceList[key.DEVICE_GROUP_ID] != "")){
        			if(tempDeviceList[key.DEVICE_GROUP_ID] == arrCache[i].GroupID) {
        				found = true;
        				break;
        			}
        		}
        		else if(tempDeviceList[key.DEVICE_ID] == arrCache[i].DeviceID){
        			found = true;
        			break;
        		}
        	}
        	if (!found) {
        		newarraynotfound.push(tempDeviceList)
        	}
        }
        return newarrayfound.concat(newarraynotfound);
    },
    
    checkUUIDInArray: function(deviceType, message) {
        var isNewUUID = true;
        if (deviceType === "LED" || wemoUtil.isSupportedLedModelCode(deviceType)) {
            for (var device = 0; device < arrLeds.length; device++) {
                console.log("updating array if UUID is new:  " + arrLeds[device][key.DEVICE_PLUGIN_ID] + "  ::  " + message[key.DEVICE_PLUGIN_ID]);
                if (arrLeds[device][key.DEVICE_PLUGIN_ID] === message[key.DEVICE_PLUGIN_ID]) {
                    isNewUUID = false;
                    break;
                }
            }
            if (isNewUUID) {
                arrLeds.push(message);
            }
        }
    },

    //------------------------ LED & Sort by Name ------------------------------------
    getBinaryStateImage: function(state) {
        if (state == "0") {
            console.log("make the UI to dim");
            return "led_off";
        } else {
            console.log("make the UI to glow");
            return "led_on";
        }
    },

    //loadBridgeDevicesFromCloud: function (reqtype) {
    loadBridgeDevicesFromCloud: function(data) {
        var responseXML = (new XMLSerializer()).serializeToString(data);
        var splitLength = 4000;
        var length = responseXML.length;
        var ittr = Math.floor(length / splitLength) + 1;
        for (var i = 0; i < ittr; i++) {
            var end = ((i + 1) * splitLength);
            if (end > length) {
                end = length;
            }
            wemoUtil.log(TAGB, responseXML.substring(splitLength * i, end));
        }

        $(devicelistbridge).empty();

        var oldDeviceList = [];
        var isArrayUpaded = false;
        arrDevicesList = [];
        arrLeds = [];
        var jsonArr = [];
        var groupIdArr = [];
        var oldDeviceList = [];
        var bridgeUds = [];
        var parentIds = [];
        ledRemoteDeviceInfo = [];
        var deviceManufactCnt = [];
        ledNameFirmware = {};

        $(data).find('device').each(function(i) {

            //if($(this).find("pluginId").text() != "")
            if ($(this).find("pluginId").html() != "") {
                var deviceBridgeRemObject = {};

                var device_id = $(this).find("uniqueId").text(); 
                var device_type = $(this).find("modelCode").text();
                var device_friendly_name = $(this).find("friendlyName").text();
                var device_status = $(this).find("status").text();
                var device_plugin_id = $(this).find("pluginId").text();
                var device_mac_address = $(this).find("macAddress").text();
                var device_status_timestamp = $(this).find("statusTS").text();
                var device_signal_strength = $(this).find("signalStrength").text();
                var device_parent_plugin_id = $(this).find("parentPluginId").text();
                var device_firmware_version = $(this).find("firmwareVersion").text();
                var device_firmware_status = $(this).find("fwUpgradeStatus").text();
                var device_manufacture = '';

                if ($(this).find("manufacturer"))
                    device_manufacture = $(this).find("manufacturer").text();

                //alert("device Id "+device_id+" device type "+device_type+" device friendly name "+device_friendly_name+" device sdtatus "+device_status+" device plugin "+device_plugin_id+" Mac address "+device_mac_address+" timestamp "+device_status_timestamp);
                var deviceObject = {};
                deviceObject[key.DEVICE_UDN] = device_id;
                deviceObject[key.DEVICE_TYPE] = device_type;
                deviceObject[key.DEVICE_STATE] = $.trim(device_status);
                deviceObject[key.DEVICE_FRIENDLY_NAME] = device_friendly_name;
                deviceObject[key.DEVICE_PLUGIN_ID] = device_plugin_id;
                deviceObject[key.DEVICE_MAC_ADDRESS] = device_mac_address;
                deviceObject[key.DEVICE_STATUS_TIMESTAMP] = device_status_timestamp;
                deviceObject[key.DEVICE_SIGNAL_STRENGTH] = device_signal_strength;
                deviceObject[key.DEVICE_PARENT_PLUGIN_ID] = device_parent_plugin_id;
                deviceObject[key.DEVICE_FIRMWARE_STATUS] = device_firmware_status;
                deviceObject[key.DEVICE_MANUFACTURE] = device_manufacture;
                deviceObject[key.DEVICE_ID] = device_mac_address;
                
                if (device_type != ledModelcode.LED && device_type != ledModelcode.OSRAM && device_type != "LED" && device_id != "") {
                    oldDeviceList.push(deviceObject);
                }

                if (device_type == wemoLed.REMOTE_TYPE || wemoUtil.isSupportedLedModelCode(device_type)) {
                    var device_parent_plugin_id = $(this).find("parentPluginId").text();

                    if (jQuery.inArray(device_parent_plugin_id, parentIds) == -1) {
                        parentIds.push(device_parent_plugin_id);
                    }

                    ledRemoteDeviceInfo.push(device_plugin_id + "::" + device_firmware_version);
                }

                if (device_type == "Bridge") {
                    if (jQuery.inArray(device_plugin_id, parentIds) != -1) {
                        deviceBridgeRemObject[key.DEVICE_UDN] = device_id;
                        deviceBridgeRemObject[key.DEVICE_MAC_ADDRESS] = device_mac_address;
                        deviceBridgeRemObject[key.DEVICE_PLUGIN_ID] = device_plugin_id;
                        bridgeUds.push(deviceBridgeRemObject);
                    } else {
                        deviceBridgeRemObject[key.DEVICE_UDN] = device_id;
                        deviceBridgeRemObject[key.DEVICE_MAC_ADDRESS] = device_mac_address;
                        deviceBridgeRemObject[key.DEVICE_PLUGIN_ID] = device_plugin_id;
                        bridgeUds.push(deviceBridgeRemObject);
                    }
                }

                var capability1 = "";
                var capability2 = "";
                var capability3 = "";
                var capability4 = "";
                var capability5 = "";
                var device_capabilityId_val1 = "";
                var device_capabilityId_val2 = "";
                var device_capabilityId_val3 = "";
                var device_capabilityId_val4 = "";
                var device_capabilityId_val5 = "";
                
                $(this).find('deviceCapabilityProfile').each(function(i) {

                    if ($(this).children("capabilityId").text() == ledCapabilities.ONOFF) {
                        var device_current_status_value = $(this).find("currentValue").text();
                        deviceObject[key.DEVICE_CURRENT_STATUS_VAL] = $.trim(device_current_status_value);
                        capability1 = $(this).children("capabilityId").text();
                        device_capabilityId_val1 = deviceObject[key.DEVICE_CURRENT_STATUS_VAL];
                    } else if ($(this).children("capabilityId").text() == ledCapabilities.DIMMING) {
                        var device_current_dimming_value = $(this).find("currentValue").text();
                        capability2 = $(this).children("capabilityId").text();
                        device_capabilityId_val2 = device_current_dimming_value;

                        if (device_current_dimming_value.search(":") == -1) {
                            deviceObject[key.DEVICE_CURRENT_DIMMING_VAL] = $.trim(device_current_dimming_value);
                        } else {
                            var dimmingCurValArr = device_current_dimming_value.split(":");
                            device_current_dimming_value = dimmingCurValArr[0];
                            deviceObject[key.DEVICE_CURRENT_DIMMING_VAL] = $.trim(device_current_dimming_value);
                        }
                        
                        var device_allowed_values = $(this).find("allowedValues").text();

                        if (device_allowed_values != "") {
                            var allowedValArr = device_allowed_values.split("~");
                            var allowedSubArr = allowedValArr[1].split(",");


                            if ($.isNumeric(allowedSubArr[0])) {
                                deviceObject[key.DEVICE_ALLOWED_VAL] = allowedSubArr[0];
                            } else {
                                var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
                                deviceObject[key.DEVICE_ALLOWED_VAL] = AllowedVal;
                            }

                        } else {
                            var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
                            deviceObject[key.DEVICE_ALLOWED_VAL] = AllowedVal;
                        }

                    } else if ($(this).children("capabilityId").text() == ledCapabilities.FADER) {
                        var device_fader_status = $(this).find("currentValue").text();
                        deviceObject[key.DEVICE_FADER_STATUS_VAL] = $.trim(device_fader_status);
                        capability3 = $(this).children("capabilityId").text();
                        
                        if(deviceObject[key.DEVICE_FADER_STATUS_VAL])
                        	device_capabilityId_val3 =deviceObject[key.DEVICE_FADER_STATUS_VAL];
                        else
                        	device_capabilityId_val3 =statusCode.OFF;
                        
                    } else if ($(this).children("capabilityId").text() == ledCapabilities.TEMPERATURE) {
                    	var device_temperature_status = $(this).find("currentValue").text();
                        deviceObject[key.DEVICE_TEMPERATURE_STATUS_VAL] = $.trim(device_temperature_status);
                        capability4 = $(this).children("capabilityId").text();
                        
                        if(deviceObject[key.DEVICE_TEMPERATURE_STATUS_VAL])
                        	device_capabilityId_val4 = deviceObject[key.DEVICE_TEMPERATURE_STATUS_VAL];
                        else
                        	device_capabilityId_val4 =statusCode.OFF;
                    } else if ($(this).children("capabilityId").text() == ledCapabilities.COLOR) {
                    	var device_color_status = $(this).find("currentValue").text();
                        deviceObject[key.DEVICE_COLOR_STATUS_VAL] = $.trim(device_color_status);
                        capability5 = $(this).children("capabilityId").text();
                        
                        if(deviceObject[key.DEVICE_COLOR_STATUS_VAL])
                        	device_capabilityId_val5 =deviceObject[key.DEVICE_COLOR_STATUS_VAL];
                        else
                        	device_capabilityId_val5 =statusCode.OFF;
                    }

                });

                var device_capabilityId = capability1 + "," + capability2 + "," + capability3 + "," + capability4 + "," +capability5;
                deviceObject[key.DEVICE_CAPABILITY_ID] = device_capabilityId;
                if(device_capabilityId_val1 == "")
                	device_capabilityId_val1 = sessionStore.DEFAULT_ONOFF_VALUE;
                if (device_capabilityId_val2 == "")
                	device_capabilityId_val2 = sessionStore.DEFAULT_LEVEL_VALUE;
                if (device_capabilityId_val3 == "")
                	device_capabilityId_val3 = sessionStore.DEFAULT_SLEEP_VALUE;
                var device_capabilityId_val = device_capabilityId_val1 + "," + device_capabilityId_val2 + ","+ device_capabilityId_val3 + "," + device_capabilityId_val4 + "," + device_capabilityId_val5;
                deviceObject[key.DEVICE_GROUP_CAPABILITY_VALUE] = device_capabilityId_val;
                deviceObject[key.DEVICE_GROUP_ID] = "";
                deviceObject[key.DEVICE_GROUP_NAME] = "";
                deviceObject[key.DEVICE_ALREADY_GROUP_EXIST] = "";
                deviceObject[key.DEVICE_GROUP_UNIQUE_ID] = "";

                $(this).find('groupProfile').each(function(i) {

                    var groupname = $(this).find("groupName").text();
                    var groupId = $(this).find("referenceId").text();
                    var groupuniqeId = $(this).find("id").text();

                    if (jQuery.inArray(groupId, jsonArr) == -1) {
                        jsonArr.push(groupId);
                        deviceObject[key.DEVICE_GROUP_ID] = groupId;
                        deviceObject[key.DEVICE_GROUP_NAME] = groupname;
                        deviceObject[key.DEVICE_GROUP_UNIQUE_ID] = groupuniqeId;
                        deviceObject[key.DEVICE_ALREADY_GROUP_EXIST] = "newgroup";
                    } else {
                        groupIdArr.push(groupId + ":" + device_plugin_id + ":" + device_friendly_name + ":" + device_status + ":" + device_manufacture + ":" + device_type + ":" +device_mac_address);
                        deviceObject[key.DEVICE_ALREADY_GROUP_EXIST] = "alreadygroupexist";
                        deviceObject[key.DEVICE_GROUP_ID] = "";
                        deviceObject[key.DEVICE_GROUP_NAME] = "";
                        deviceObject[key.DEVICE_GROUP_UNIQUE_ID] = "";
                    }

                });


                //------------ LED Sort by Name ------------
                if (deviceObject[key.DEVICE_TYPE] == wemoLed.REMOTE_TYPE || wemoUtil.isSupportedLedModelCode(deviceObject[key.DEVICE_TYPE])) {
                    device_list_bridge.checkUUIDInArray("LED", deviceObject);
                    ledRemoteMac.push(device_mac_address);
                    var groupId = deviceObject[key.DEVICE_GROUP_ID];
                    if (groupId !== "") {
                    	var groupName = deviceObject[key.DEVICE_GROUP_NAME];
                    	if (ledNameFirmware[groupId]) {
                    		ledNameFirmware[groupId].version = ledNameFirmware[groupId].version + device_firmware_version + ' '; 
                    	} else {
                    		ledNameFirmware[groupId] = {name:groupName, version:device_firmware_version + ' '};
                    	}
                    }else {
                    	ledNameFirmware[device_mac_address] = {name:device_friendly_name, version: device_firmware_version};
                    }
                    
                } else {
                    console.log("Socket & Sensor & Sort - Unknown device type");
                    //return;
                }

            }

            if (($(data).find("device").length) - 1 == i) {
                isArrayUpaded = true;
                //arrLeds = device_list_bridge.sortByKey(arrLeds, 'friendlyName');
                arrLeds = device_list_bridge.sortByLocalOrder(arrLeds);

                if (arrLeds.length > 0) {
                    arrLeds.reverse();
                    arrDevicesList = arrLeds;
                }

                //alert("isArrayUpaded:  "+isArrayUpaded+"  ::  "+arrSocket.length+"  ::  "+arrSensor.length+"  ::  "+arrDevicesList.length);
                for (var i = 0; i < arrDevicesList.length; i++) {
                    var tempDeviceList = arrDevicesList[i];
                    device_list_bridge.buildBridgeCloudListItem(tempDeviceList);
                }
            }

            //------------ LED Sort by Name ------------

        });

        //wemoUtil.storeRemoteValue();

        ledRemoteMac = $.unique(ledRemoteMac);
        window.sessionStorage.setItem(sessionStore.LED_MAC_ADDRESS, ledRemoteMac);

        //ledNameFirmware = $.unique(ledNameFirmware);
        window.sessionStorage.setItem(sessionStore.LED_NAME_AND_FIRMWARE, JSON.stringify(ledNameFirmware));

        if(ledRemoteDeviceInfo.length > 0 && window.sessionStorage.getItem(sessionStore.LED_FIRMWARE_CHECK) != false) {
            window.sessionStorage.setItem(sessionStore.LED_REMOTE_FIRMWARE_ARRAY, JSON.stringify(ledRemoteDeviceInfo));
        }


        if (groupIdArr != "") {
            $.each(groupIdArr, function(key, value) {
                var splitIds = value.split(":");
                var groupid = splitIds[0];
                var deviceid = splitIds[1];
                var deviceFriendlyname = splitIds[2];
                var individualStatus = splitIds[3];
                var individualManufacurerName = splitIds[4];
                var individualModelcode = splitIds[5];
                var alreadydeviceids = $("#" + groupid).attr('wemo-device-groupids');
                var newandalreadyids = alreadydeviceids + "," + deviceid;
                $("#" + groupid).attr('wemo-device-groupids', newandalreadyids);

                var alreadydeviceFriendlyname = $("#" + groupid).attr('wemo-group-device-friendlyname');
                var newandalreadyFriendlyname = alreadydeviceFriendlyname + "," + deviceFriendlyname;
                $("#" + groupid).attr('wemo-group-device-friendlyname', newandalreadyFriendlyname);

                var alreadydeviceStatus = $("#" + groupid).attr('wemo-group-device-status');
                var newandalreadyStatus = alreadydeviceStatus + "," + individualStatus;
                $("#" + groupid).attr('wemo-group-device-status', newandalreadyStatus);

                var alreadydeviceStatus = $("#" + groupid).attr('wemo-group-device-status');
                var newandalreadyStatus = alreadydeviceStatus + "," + individualStatus;
                $("#" + groupid).attr('wemo-group-device-status', newandalreadyStatus);

                var alreadydeviceManuf = $("#" + groupid).attr('wemo-device-manufacture');
                var newandalreadyManufacturer = alreadydeviceManuf + "," + individualManufacurerName;
                $("#" + groupid).attr('wemo-device-manufacture', newandalreadyManufacturer);

                var alreadydeviceModelcode = $("#" + groupid).attr('wemo-device-modelcode');
                var newandalreadyModelcode = alreadydeviceModelcode + "," + individualModelcode;
                $("#" + groupid).attr('wemo-device-modelcode', newandalreadyModelcode);
                
                var alreadydeviceMacId = $("#" + groupid).attr('wemo-group-mac-ids');
                var individualMacId = splitIds[6];
                var newandalreadyMacIds = alreadydeviceMacId + "," + individualMacId;
                $("#" + groupid).attr('wemo-group-mac-ids', newandalreadyMacIds);


                /******************Image code *****************************/

                var groupManufacurerName = $("#" + groupid).attr('wemo-device-manufacture');
                
                if(groupManufacurerName != undefined)
                	var groupManfArr = groupManufacurerName.split(",");
                
                var groupModelCode =  $("#" + groupid).attr('wemo-device-modelcode');
                
                if(groupModelCode != undefined)
                	var groupModelCodeArr = groupModelCode.split(",");
                
                if(groupManfArr != undefined && groupModelCodeArr != undefined){
                	groupManfArr = jQuery.unique(groupManfArr);
                	groupModelCodeArr = jQuery.unique(groupModelCodeArr);
                	
                    if (groupModelCodeArr.length == 1) {
                    	var grpiconURL = wemoUtil.replaceSpaceinModelCodeandManufacturer(groupManfArr[0], groupModelCodeArr[0]);
                    	var iconURL = grpiconURL;
                     	
                        $("ul li[data-deviceId=" + groupid + "]").find('.device_list_icon_container img').attr('src', grpiconURL);

                        var tempObject = device_list_bridge.getDeviceFromCache(groupid);
                        if (tempObject != undefined) {
                            tempObject.imgURL = grpiconURL;
                            device_list_bridge.updateLedCache(groupid, tempObject);
                        }

                        deviceIcon[groupid] = grpiconURL;
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.DEVICE_LED_ICON, deviceIcon);

                    }
                }
                else if(groupModelCodeArr != undefined){
                	groupModelCodeArr = jQuery.unique(groupModelCodeArr);
                	
                    if (groupModelCodeArr.length == 1) {
                    	var grpiconURL = wemoUtil.replaceSpaceinModelCode(groupModelCodeArr[0]);
                    	var iconURL = grpiconURL;
                     	
                        $("ul li[data-deviceId=" + groupid + "]").find('.device_list_icon_container img').attr('src', grpiconURL);

                        var tempObject = device_list_bridge.getDeviceFromCache(groupid);
                        if (tempObject != undefined) {
                            tempObject.imgURL = grpiconURL;
                            device_list_bridge.updateLedCache(groupid, tempObject);
                        }

                        deviceIcon[groupid] = grpiconURL;
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.DEVICE_LED_ICON, deviceIcon);

                    }
                }
                

                /******************Image code *****************************/

                var newaddedDev = $("#" + groupid).attr('wemo-device-groupids');
                var exploNewAddeArr = newaddedDev.split(",");

                var newaddedFriendlyname = $("#" + groupid).attr('wemo-group-device-friendlyname');
                var exploNewAddefriendlyArr = newaddedFriendlyname.split(",");

                var newaddedStatus = $("#" + groupid).attr('wemo-group-device-status');
                var exploNewAddeStatusArr = newaddedStatus.split(",");
                
                var newaddedMacadress = $("#" + groupid).attr('wemo-group-mac-ids');
                var exploNewddedMacadresArr = newaddedMacadress.split(",");
                
                var devicelistHTML = "";
                var actualGroupCnt = exploNewAddeArr.length;
                var incCnt = 0;

                devicelistHTML += '<div class="groupFadder"><p class="group_bulb">' + wemo.items['groupedBulbs'] + '</p>';
                for (var j = 0; j < actualGroupCnt; j++) {

                    //var name = wemo.items['dimmableLight'] + j;

                    if (exploNewAddefriendlyArr[j] != "" && exploNewAddefriendlyArr[j] != undefined)
                        var name = exploNewAddefriendlyArr[j];
                    else
                        var name = wemo.items['dimmableLight'] + j;

                    if (exploNewAddeStatusArr[j] == "3" || exploNewAddeStatusArr[j] == "4") {
                        incCnt++;

                        devicelistHTML += '<p data-groupId="' + groupid + '" id="' + exploNewAddeArr[j] + '" class="disabled drawerLIClass">' + name + ' unavailable</p>';
                        unavailableDevicelist.push(exploNewAddeArr[j]);
                        $("ul li[data-deviceid=" + groupid + "]").find('.unavailableText').text('');
                        $("ul li[data-deviceid=" + groupid + "]").find('.sliderValue').append("  <span class='unavailableText'>" + wemo.items['unavailableBulb'] + "<span>");

                    } else {
                        devicelistHTML += '<p data-groupId="' + groupid + '" id="' + exploNewAddeArr[j] + '" wemo-device-macadress="'+ exploNewddedMacadresArr[j] +'" class="groupDeviceList">' + name + '</p>';
                    }
                }

                devicelistHTML += '</div>';
                $("#drawerlist-" + groupid).html(devicelistHTML);
                window.sessionStorage.setItem(sessionStore.LED_DRAWER_GROUP_LIST, newandalreadyids);
                $("#mainLIID" + groupid).find('.devicesCount').empty().append(exploNewAddeArr.length);
                window.sessionStorage.setItem(sessionStorage.LED_DEVICE_AVAILABILITY_LIST, unavailableDevicelist);

                if (incCnt == actualGroupCnt) {
                    $("ul li[data-deviceid=" + groupid + "]").find('.group_li').removeClass('led_group');
                    $("ul li[data-deviceid=" + groupid + "]").find('.group_li').removeClass('led_list');
                    $("ul li[data-deviceid=" + groupid + "]").find('.group_li').addClass('disabled');
                    $("#mainLIID" + groupid).find('.NotDetected').text('Not Detected');
                    $("ul li[data-deviceid=" + groupid + "]").find('.unavailableText').text('');
                } else {
                    $("ul li[data-deviceid=" + groupid + "]").find('.group_li').removeClass('disabled');
                    $("ul li[data-deviceid=" + groupid + "]").find('.group_li').addClass('led_group');
                    $("#mainLIID" + groupid).find('.NotDetected').text('');
                }

            });
        }

        nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
        console.log("priting from Wemoutil bridge devicelist**" + JSON.stringify(bridgeUds));
        wemoUtil.setJSONObjectToSessionStorage(sessionStore.LED_BRIDGE_UDN, bridgeUds);
    },


    buildBridgeCloudListItem: function(device) {
        
        var friendlyName = device[key.DEVICE_FRIENDLY_NAME];
        var iconURL = "";
        var switchStateClass = "";
        var timestamp = device[key.DEVICE_STATUS_TIMESTAMP];
        var statusText = '';
        var statusTextClass = '';
        var strengthStatus = '';
        var firmwareUpgradeStatus = '';
        var overlayClass = '';
        var grouplistItem = "";
        var listItem = "";
        var sliderTextClass = "";
        var firmwareMessage = "";
        var iconTypeDis = "";
        var currentdimmingVal = "";

        if (device[key.DEVICE_TYPE] == wemoLed.REMOTE_TYPE || wemoUtil.isSupportedLedModelCode(device[key.DEVICE_TYPE])) {

        	window.sessionStorage.setItem("LEDpresent", "yes");
        	if(device[key.DEVICE_MANUFACTURE] != "" && device[key.DEVICE_TYPE] != "")
        		iconURL = wemoUtil.replaceSpaceinModelCodeandManufacturer(device[key.DEVICE_MANUFACTURE], device[key.DEVICE_TYPE]);
        	else if(device[key.DEVICE_TYPE] != "")
        		iconURL = wemoUtil.replaceSpaceinModelCode(device[key.DEVICE_TYPE]);
        	else
        		iconURL = defaultIcon.LED_THUMB_URI;

        	if (friendlyName == "") {

                if (device[key.DEVICE_MANUFACTURE] != "") {
                    var manufacturerKey = device[key.DEVICE_MANUFACTURE].replace(/ /, '');
                    friendlyName = wemo.items[manufacturerKey];
                } else
                    friendlyName = wemo.items['dimmableLight'];
            }
            if (friendlyName.indexOf(',') != -1) {
                friendlyName = friendlyName.substr(0, friendlyName.indexOf(','));
            } //DEVICE_STATE DEVICE_CURRENT_STATUS_VAL
            if (device[key.DEVICE_STATE] == '0' || device[key.DEVICE_STATE] == '1') {
                switchStateClass = device_list_bridge.getBinaryStateImage(device[key.DEVICE_CURRENT_STATUS_VAL]);
                strengthStatus = (device[key.DEVICE_CURRENT_DIMMING_VAL] * 100) / (device[key.DEVICE_ALLOWED_VAL]);
                //Changed the logic for BrightnessValue everywhere to Math.ceil to correctly update the brightness slider for the brightness value recieved by the app.
                //This counters the loss of pression while setting the brightness. 
                strengthStatus = Math.ceil(strengthStatus) + "%";
                overlayClass = "led_list";   
                currentdimmingVal = strengthStatus;
                
            } else {
                overlayClass = 'disabled';
                firmwareUpgradeStatus = wemo.items['Devices_Remote_NotDetected'];
            }

        } else {
            return;
        }

        if (device[key.DEVICE_GROUP_ID] != "" && device[key.DEVICE_GROUP_ID] != undefined && device[key.DEVICE_ALREADY_GROUP_EXIST] == "newgroup") {

            switchStateClass = device_list_bridge.getBinaryStateImage(device[key.DEVICE_CURRENT_STATUS_VAL]); //DEVICE_STATE
            var groupId = device[key.DEVICE_GROUP_ID];
            var groupName = device[key.DEVICE_GROUP_NAME];
            var mainLiID = groupName + "" + groupId;
            var statusCode = device[key.DEVICE_CURRENT_STATUS_VAL];
            var colorTemperatureValue = sessionStore.TEMPERATURE_DEFAULT_VALUE;
            var colorTemperatureFlexValue = sessionStore.DEFAULT_RGB_XY_VALUE;
            
            if (device[key.DEVICE_STATE] == '0' || device[key.DEVICE_STATE] == '1') {
                firmwareUpgradeStatus = '';

                if (isEditMode) {
                    overlayClass = "editListGroupLeds";
                    switchStateClass = "edit_device_arrow_icon";
                } else
                    overlayClass = "led_group";


                if (device[key.DEVICE_STATE] == '1')
                    sliderTextClass = 'LedBrihtnesscolorChange';

                statusCode = device[key.DEVICE_STATE];
                
                if(bridgeFirmwareFlag == true)
                {
                	firmwareMessage = bridgeFirmwareStatus;
                	strengthStatus = $.trim(firmwareMessage);
                	sliderTextClass = 'firmwareMsg';
                	iconTypeDis = 'displayNone';
                    
                	if(firmwareMessage.indexOf(wemo.items['FirmwareMsgUpgrading']) != -1)
                    	switchStateClass = "led_value_loading";
                }
                else{
                	 if(device[key.DEVICE_FIRMWARE_STATUS] != firmwareMessagingEnum.FOUR)
                     {
                		firmwareMessage = device_list.firmwareUpgradeMessageRemote(device[key.DEVICE_FIRMWARE_STATUS]);
                     	strengthStatus = firmwareMessage;
                     	sliderTextClass = 'firmwareMsg';
                     	iconTypeDis = 'displayNone';
                     	
                     	if(jQuery.inArray(device[key.DEVICE_GROUP_ID], firmwareUpgradeMsg) == -1)
                     		firmwareUpgradeMsg.push(device[key.DEVICE_GROUP_ID]);
                     	
                     	if(firmwareMessage.indexOf(wemo.items['FirmwareMsgUpgrading']) != -1)
                     		switchStateClass = "led_value_loading";
                     }
                	 else if(device[key.DEVICE_FIRMWARE_STATUS] == firmwareMessagingEnum.FOUR && jQuery.inArray(device[key.DEVICE_GROUP_ID], firmwareUpgradeMsg) != -1){
                	    firmwareMessage = device_list.firmwareUpgradeMessageRemote(device[key.DEVICE_FIRMWARE_STATUS]);
                      	strengthStatus = firmwareMessage;
                      	sliderTextClass = 'firmwareMsg';
                      	iconTypeDis = 'displayNone';
                      	var arraIndex = firmwareUpgradeMsg.indexOf(device[key.DEVICE_GROUP_ID]);
                     	firmwareUpgradeMsg.splice( arraIndex, 1);
 	           	     }
                	 
                }

            } else {
            	
            	if(bridgeFirmwareFlag == true || device[key.DEVICE_FIRMWARE_STATUS] != firmwareMessagingEnum.FOUR)
            		firmwareUpgradeStatus = wemo.items['LEDBulb_Unavailable_Messgage'];
            	else
            		firmwareUpgradeStatus = wemo.items['Devices_Remote_NotDetected'];
            	
                overlayClass = "disabled";
                switchStateClass = "";
                statusCode = device[key.DEVICE_STATE];
            }

            nativeUtilPlugin.execute(function(deviceImg) {
                    if (deviceImg.length > 0 && deviceImg != '') {
                        console.log('deviceImg length' + deviceImg[0]);
                        iconURL = deviceImg[0];
                    } else {
                        console.log('Error device Img length');
                    }

                },
                function() {
                    console.log('error');
                },
                ACTION_GET_LED_IMAGE_FROM_DB, [groupId]
            );

            deviceIcon[groupId] = iconURL;
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.DEVICE_LED_ICON, deviceIcon);
            var ledDeviceType = wemoUtil.ledBulbType(device[key.DEVICE_TYPE]);
    
            if((device[key.DEVICE_COLOR_STATUS_VAL] || device[key.DEVICE_TEMPERATURE_STATUS_VAL]) && wemoUtil.isColoredandTemperaturedBulb(ledDeviceType)){
            	colorTemperatureValue = device[key.DEVICE_TEMPERATURE_STATUS_VAL];
            	colorTemperatureFlexValue = device[key.DEVICE_COLOR_STATUS_VAL];
            }
            else if(device[key.DEVICE_TEMPERATURE_STATUS_VAL] && wemoUtil.isTemperatureBulb(ledDeviceType)){
            	colorTemperatureValue = device[key.DEVICE_TEMPERATURE_STATUS_VAL];
            }
            //TODO: Need to delete this(OSRAMCTBPILOT) comparison for pilot FW version
            else if(device[key.DEVICE_COLOR_STATUS_VAL] && wemoUtil.isColoredBulb(ledDeviceType)){
            	colorTemperatureFlexValue = device[key.DEVICE_COLOR_STATUS_VAL];
            }
            
            //Edit Icon data-device Id
            grouplistItem = CTemplator.fitIn('<li data-depurar="1" data-category="bridge" name="group_li" wemo-device-udn="[0]" data-deviceId="[0]" data-macId="[0]" class="device_li [1]" id= "mainLIID[0]" > <div class="ledDiv"> <span class="devicesCount displayBlock"> </span> <span name="name_device_icon" class="device_list_icon_container"> <img src="[2]" width="80" height="80"> </span> <span class="power_indicator_container"> <span name="name_group_state" id="[0]" wemo-device-state="[6]" class="[6]" wemo-device-state-code="[7]" wemo-device-friendly-name="[3]" wemo-device-capabilities="[8]" wemo-device-type="[9]" wemo-device-groupunique-id="[10]" wemo-device-groupids="[11]" wemo-device-fader-value="[12]" wemo-group-device-friendlyname="[13]" wemo-group-device-status="[7]" wemo-device-modelcode="[9]" wemo-device-manufacture="[24]" wemo-device-temperature-value="[26]" wemo-device-color-value="[27]" wemo-group-capability-value="[28]" wemo-group-mac-ids="[29]"> <p class="bulbStrength" id="dimmingDis[0]"> [25] </p> </span> </span> <span class="device_list_friendly_name_container drawerToggle"> <label> [3] </label> <span class="sliderValue [30]"> [4] </span><span class="click_advance" data-deviceid="[0]"> <span class="drawer_icon_arrow_down iconType [31]"> </span> </span> <label name="name_firmware_status" class="NotDetected subTitle"> [5] </label> </span> <div id="mainWrapper[0]" style="display:none;" class="mainWrap" name="mainWrapper" wemo-device-capabilities="[8]" wemo-device-groupids="[11]" wemo-device-friendly-name="[3]" wemo-device-max-allowed-val="[14]"> <div id="wrapperonoff"> <input type="text" name="currentVal" id="currentVal[0]" size="3" value="[25]" style="position:relative;top:30px;right:60px;border:none;background-color:#F3F3F3;" disabled/> <div id="innerDiv2onoff[0]" class="innerDiv2onoff"> </div> </div> </div> </div> <div class="ledDrawer drawerView" id="drawer-[0]"> <div class="sliderRow"> </div> <div class="temperatureColorRow" data-ttbColor="[32]"> <span class="temparatureColorPicker"></span> <span class="tempPickerLabel">[33]</span> <span class="goTempPicker"></span></div> <div class="colorPickerMainDiv" data-ttbColor="[32]" data-Color="[34]"><span class="colorPickerBox"></span> <span class="colorPickerLabel">[35]</span> <span class="goColorPicker"></span> </div> <div class="sleepFader"> [15] <div class="timer [36] </div> </div> <div class="firstRow"> <span class="minutesButton"> <span class="buttonTitle"> [16] </span> <span class="buttonImage" data-time="1"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [17] </span> <span class="buttonImage" data-time="10"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [18] </span> <span class="buttonImage" data-time="30"> </span> </span> <span class="minutesButton customSelector"> <span class="buttonTitle"> [19] </span> <span class="buttonImage customPicker" id="customPicker[0]" data-time="1"> [20] </span> </span> </div> <div class="secondRow"> <span class="minutesButton"> <span class="buttonTitle"> [18] </span> <span class="buttonImage" data-time="30"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [21] </span> <span class="buttonImage" data-time="45"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [22] </span> <span class="buttonImage" data-time="60"> </span> </span> </div> <div class="goSleep" data-timer="-1"> [23] </div> <div id="drawerlist-[0]" class="drawerList"> </div> </li>', [groupId, overlayClass, iconURL, groupName, strengthStatus, firmwareUpgradeStatus, switchStateClass, statusCode, device[key.DEVICE_CAPABILITY_ID], device[key.DEVICE_TYPE], device[key.DEVICE_GROUP_UNIQUE_ID], device[key.DEVICE_PLUGIN_ID], device[key.DEVICE_FADER_STATUS_VAL], device[key.DEVICE_FRIENDLY_NAME], device[key.DEVICE_ALLOWED_VAL], wemo.items.sleepFader, wemo.items.oneMin, wemo.items.tenMin, wemo.items.thirtyMin, wemo.items.custom, wemo.items.enter, wemo.items.fourtyFiveMin, wemo.items.oneHour, wemo.items.goToSleep, device[key.DEVICE_MANUFACTURE], currentdimmingVal, device[key.DEVICE_TEMPERATURE_STATUS_VAL], device[key.DEVICE_COLOR_STATUS_VAL], device[key.DEVICE_GROUP_CAPABILITY_VALUE], device[key.DEVICE_MAC_ADDRESS], sliderTextClass, iconTypeDis, colorTemperatureValue, wemo.items.TempDrawerLabel, colorTemperatureFlexValue, wemo.items.Color, wemo.items.Off]);

            if (overlayClass == "disabled") {
                if (isEditMode) {
                    var item = "mainLIID" + device[key.DEVICE_PLUGIN_ID];
                    $("#" + item).hide();
                }

            }

        } else if (device[key.DEVICE_ALREADY_GROUP_EXIST] != "alreadygroupexist" && device[key.DEVICE_ALREADY_GROUP_EXIST] == "") {
            var deviceId = device[key.DEVICE_MAC_ADDRESS];
            var colorTemperatureValue = sessionStore.TEMPERATURE_DEFAULT_VALUE;
            var colorTemperatureFlexValue = sessionStore.DEFAULT_RGB_XY_VALUE;
            
            if (device[key.DEVICE_STATE] == '0' || device[key.DEVICE_STATE] == '1') {
                switchStateClass = device_list_bridge.getBinaryStateImage(device[key.DEVICE_CURRENT_STATUS_VAL]);
                strengthStatus = (device[key.DEVICE_CURRENT_DIMMING_VAL] * 100) / (device[key.DEVICE_ALLOWED_VAL]);
                strengthStatus = Math.ceil(strengthStatus) + "%";
                currentdimmingVal = strengthStatus;

                if (isEditMode) {
                    overlayClass = "editListLeds";
                    switchStateClass = "edit_device_arrow_icon";
                } else
                    overlayClass = "led_list";

                if (device[key.DEVICE_CURRENT_STATUS_VAL] == '1')
                    sliderTextClass = 'LedBrihtnesscolorChange';
                
                console.log("bridgeFirmwareFlag "+bridgeFirmwareFlag);
               
                if(bridgeFirmwareFlag == true)
                {
                	firmwareMessage = bridgeFirmwareStatus;
                	strengthStatus = $.trim(firmwareMessage);
                	sliderTextClass = 'firmwareMsg';
                	iconTypeDis = 'displayNone';
                	
                	if(firmwareMessage.indexOf(wemo.items['FirmwareMsgUpgrading']) != -1)
                    	switchStateClass = "led_value_loading";
                }
                else{
                	
                	if(device[key.DEVICE_FIRMWARE_STATUS] != firmwareMessagingEnum.FOUR)
                    {
                    	firmwareMessage = device_list.firmwareUpgradeMessageRemote(device[key.DEVICE_FIRMWARE_STATUS]);
                    	strengthStatus = firmwareMessage;
                    	sliderTextClass = 'firmwareMsg';
                    	iconTypeDis = 'displayNone';
                    	
                    	if(jQuery.inArray(device[key.DEVICE_PLUGIN_ID], firmwareUpgradeMsg) == -1)
                    		firmwareUpgradeMsg.push(device[key.DEVICE_PLUGIN_ID]);
                        
                    	
                    	if(firmwareMessage.indexOf(wemo.items['FirmwareMsgUpgrading']) != -1)
                    		switchStateClass = "led_value_loading";
                    }
                	else if(device[key.DEVICE_FIRMWARE_STATUS] == firmwareMessagingEnum.FOUR && jQuery.inArray(device[key.DEVICE_PLUGIN_ID], firmwareUpgradeMsg) != -1){
               			firmwareMessage = device_list.firmwareUpgradeMessageRemote(device[key.DEVICE_FIRMWARE_STATUS]);
                     	strengthStatus = firmwareMessage;
                     	sliderTextClass = 'firmwareMsg';
                     	iconTypeDis = 'displayNone';
                     	var arraIndex = firmwareUpgradeMsg.indexOf(device[key.DEVICE_PLUGIN_ID]);
                     	firmwareUpgradeMsg.splice( arraIndex, 1);
	           	    }
            
                }
                

            } else {
            	
            	if(bridgeFirmwareFlag == true || device[key.DEVICE_FIRMWARE_STATUS] != firmwareMessagingEnum.FOUR)
            		firmwareUpgradeStatus = wemo.items['LEDBulb_Unavailable_Messgage'];
            	else
            		firmwareUpgradeStatus = wemo.items['Devices_Remote_NotDetected'];
            	
                overlayClass = "disabled";
                switchStateClass = "";
                statusCode = device[key.DEVICE_STATE];
            }
            nativeUtilPlugin.execute(function(deviceImg) {
                    if (deviceImg.length > 0 && deviceImg != '') {
                        iconURL = deviceImg[0];
                    } else {
                        console.log('Error device Img length');
                    }

                },
                function() {
                    console.log('error');
                },
                ACTION_GET_LED_IMAGE_FROM_DB, [deviceId]
            );
            
            var ledDeviceType = wemoUtil.ledBulbType(device[key.DEVICE_TYPE]);
            
            if((device[key.DEVICE_COLOR_STATUS_VAL] || device[key.DEVICE_TEMPERATURE_STATUS_VAL]) && wemoUtil.isColoredandTemperaturedBulb(ledDeviceType)){
            	colorTemperatureValue = device[key.DEVICE_TEMPERATURE_STATUS_VAL];
            	colorTemperatureFlexValue = device[key.DEVICE_COLOR_STATUS_VAL];
            }
            if(device[key.DEVICE_TEMPERATURE_STATUS_VAL] && wemoUtil.isTemperatureBulb(ledDeviceType)){
            	colorTemperatureValue = device[key.DEVICE_TEMPERATURE_STATUS_VAL];
            }
            if(device[key.DEVICE_COLOR_STATUS_VAL] && wemoUtil.isColoredBulb(ledDeviceType)){
            	colorTemperatureFlexValue = device[key.DEVICE_COLOR_STATUS_VAL];
            }
            
            //Edit Icon data-device Id
            deviceIcon[deviceId] = iconURL;
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.DEVICE_LED_ICON, deviceIcon);
            listItem = CTemplator.fitIn('<li data-depurar="2" data-category="bridge" name="switch_li" wemo-device-udn="[0]" data-deviceId="[1]" data-macId="[0]" class="device_li [2]" id= "mainLIID[1]"> <div class="ledDiv"> <span class="devicesCount"> </span> <span name="name_device_icon" class="device_list_icon_container"> <img src="[3]" width="75" height="75"> </span> <span class="power_indicator_container"> <span name="name_led_device_state" id="[1]" wemo-device-state="[7]" class="[7]" wemo-device-plugin-id="[1]" wemo-device-mac-address="[0]" wemo-device-state-code="[8]" wemo-device-capabilities="[9]" wemo-device-friendly-name="[4]" wemo-device-type="[10]" wemo-device-fader-value="[11]" wemo-device-parent-plugin-id="[12]" wemo-device-modelcode="[23]" wemo-device-manufacture="[24]" wemo-device-temperature-value="[26]" wemo-device-color-value="[27]"> <p class="bulbStrength" id="dimmingDis[1]"> [25] </p> </span> </span> <span class="device_list_friendly_name_container drawerToggle"> <label> [4] </label> <span class="sliderValue [28]"> [5] </span> <span class="click_advance" data-deviceid="[1]"> <span class="drawer_icon_arrow_down iconType [29]"> </span> </span> <label name="name_firmware_status" class="NotDetected subTitle"> [6] </label> </span> <div id="mainWrapper[1]" style="display:none;" class="mainWrap" name="mainWrapper" wemo-device-mac-address="[0]" wemo-device-friendly-name="[4]" wemo-device-type="[10]" wemo-device-parent-plugin-id="[12]" wemo-device-max-allowed-val="[13]" wemo-device-capabilities="[9]" wemo-device-modelcode="[23]" wemo-device-manufacture="[24]"> <div id="wrapperonoff"> <input type="text" name="currentVal" id="currentVal[1]" size="3" value="[25]" style="position:relative;top:30px;right:60px;border:none;background-color:#F3F3F3;" disabled/> <div id="innerDiv2onoff[1]" class="innerDiv2onoff"> </div> </div> </div> </div> <div class="ledDrawer drawerView" id="drawer-[1]"> <div class="sliderRow"> </div> <div class="temperatureColorRow" style="display: none;" data-ttbColor="[30]"> <span class="temparatureColorPicker"></span> <span class="tempPickerLabel">[31]</span> <span class="goTempPicker"></span></div> <div class="colorPickerMainDiv" data-ttbColor="[30]" data-Color="[32]"><span class="colorPickerBox"></span> <span class="colorPickerLabel">[33]</span> <span class="goColorPicker"></span> </div> <div class="sleepFader"> [14] <div class="timer"> [34] </div> </div> <div class="firstRow"> <span class="minutesButton"> <span class="buttonTitle"> [15] </span> <span class="buttonImage" data-time="1"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [16] </span> <span class="buttonImage" data-time="10"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [17] </span> <span class="buttonImage" data-time="30"> </span> </span> <span class="minutesButton customSelector"> <span class="buttonTitle"> [18] </span> <span class="buttonImage customPicker" id="customPicker[1]" data-time="1"> [19] </span> </span> </div> <div class="secondRow"> <span class="minutesButton"> <span class="buttonTitle"> [17] </span> <span class="buttonImage" data-time="30"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [20] </span> <span class="buttonImage" data-time="45"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [21] </span> <span class="buttonImage" data-time="60"> </span> </span> </div> <div class="goSleep" data-timer="-1"> [22] </div> </div></li>', [device[key.DEVICE_MAC_ADDRESS], device[key.DEVICE_PLUGIN_ID], overlayClass, iconURL, friendlyName, strengthStatus, firmwareUpgradeStatus, switchStateClass, device[key.DEVICE_CURRENT_STATUS_VAL], device[key.DEVICE_CAPABILITY_ID], device[key.DEVICE_TYPE], device[key.DEVICE_FADER_STATUS_VAL], device[key.DEVICE_PARENT_PLUGIN_ID], device[key.DEVICE_ALLOWED_VAL], wemo.items.sleepFader, wemo.items.oneMin, wemo.items.tenMin, wemo.items.thirtyMin, wemo.items.custom, wemo.items.enter, wemo.items.fourtyFiveMin, wemo.items.oneHour, wemo.items.goToSleep, device[key.DEVICE_TYPE], device[key.DEVICE_MANUFACTURE], currentdimmingVal, device[key.DEVICE_TEMPERATURE_STATUS_VAL], device[key.DEVICE_COLOR_STATUS_VAL], sliderTextClass, iconTypeDis, colorTemperatureValue, wemo.items.TempDrawerLabel, colorTemperatureFlexValue, wemo.items.Color, wemo.items.Off]);

            if (overlayClass == "disabled") {
                if (isEditMode) {
                    var item = "mainLIID" + device[key.DEVICE_PLUGIN_ID];
                    $("#" + item).hide();
                }

            }
            
        }

        //$(grouplistItem).hide().prependTo('#group_list_bridge_container').slideDown("slow");
        $(grouplistItem).hide().prependTo(devicelistbridge).slideDown("slow");
        $(listItem).hide().prependTo(devicelistbridge).slideDown("slow");
        var liWidth = $(devicelistbridgelistitem).width();
        var frindlyNameWidth = liWidth - 180;
        //$('#group_list_bridge_container .device_list_friendly_name_container').css('width',frindlyNameWidth);
        $(devicelistbridge + ' .device_list_friendly_name_container').css('width', frindlyNameWidth);
       
        if (($(devicelistbridgelistitem).length > 0) && (gettingCloudImage == false)) {
            gettingCloudImage = true;
            device_list_bridge.gettingCloudImage();
            //nativeUtilPlugin.execute(null,null,actions.SHOW_PROGRESS,[]);
        } else {
            $.each(deviceIdAndImg, function(index, value) {
                var arrayValue = value.split('&&');
                var url = arrayValue[1];
                var deviceId = arrayValue[0];
                $("ul li[data-deviceId=" + deviceId + "]").find('.device_list_icon_container img').attr('src', url);
                $("ul li[data-macId=" + deviceId + "]").find('.device_list_icon_container img').attr('src', url);

            });
        }

        setTimeout(function() {
            if ($(devicelistbridgelistitem).length > 0) {
                modifyDeviceController.show();
                $("#question_mark_image").hide();
                if(openDrawerFlag == true){
                	device_list_bridge.openLEDDrawer(openDrawerId[0]);
                }

            }
        }, 1000);

        /******************New List*****************************************/
    },

    buildXMLForledStateChange: function(pluginId, macAddress, status, friendly_name, devicetype, parentid, homeid, id, capabilitytype, dimmingval) {
        xmlString = "<devices>" +
            device_list_bridge.buildXMLForBridge(pluginId, macAddress, status, friendly_name, devicetype, parentid, homeid, id, capabilitytype, dimmingval, buildXML.PLUGIN_STATE) +
            "</devices>";
        return xmlString;
    },

    buildXMLForBridge: function(pluginId, macAddress, status, friendly_name, devicetype, parentid, homeid, id, capabilitytype, dimmingval, type) {

        if (capabilitytype == ledDeviceConstants.CAPABILITYONOFF) {
            var capabilityId = ledCapabilities.ONOFF;
            var currentval = status;

            var capabilityId1 = ledCapabilities.DIMMING;
            var dimminingval = dimmingval;

            if (status == 1) {
                xmlString = "  <device>" +
                    "  <pluginId>" + pluginId + "</pluginId>" +
                    "  <macAddress>" + macAddress + "</macAddress>" +
                    "  <modelCode>" + devicetype + "</modelCode>" +
                    "  <status>" + status + "</status>" +
                    "  <deviceCapabilityProfiles>" +
                    "  <deviceCapabilityProfile>" +
                    "  <capabilityId>" + capabilityId1 + "</capabilityId>" +
                    "  <currentValue>" + dimminingval + "</currentValue>" +
                    "  </deviceCapabilityProfile>" +
                    "  <deviceCapabilityProfile>" +
                    "  <capabilityId>" + capabilityId + "</capabilityId>" +
                    "  <currentValue>" + currentval + "</currentValue>" +
                    "  </deviceCapabilityProfile>" +
                    "  </deviceCapabilityProfiles>" +
                    "  </device>"
            } else {
                xmlString = "  <device>" +
                    "  <pluginId>" + pluginId + "</pluginId>" +
                    "  <macAddress>" + macAddress + "</macAddress>" +
                    "  <modelCode>" + devicetype + "</modelCode>" +
                    "  <status>" + status + "</status>" +
                    "  <deviceCapabilityProfiles>" +
                    "  <deviceCapabilityProfile>" +
                    "  <capabilityId>" + capabilityId + "</capabilityId>" +
                    "  <currentValue>" + currentval + "</currentValue>" +
                    "  </deviceCapabilityProfile>" +
                    "  </deviceCapabilityProfiles>" +
                    "  </device>"
            }

        } else if (capabilitytype == ledDeviceConstants.CAPABILITYDIMMING) {
            var percent = status;
            var capabilityId = ledCapabilities.DIMMING;
            var currentval = (percent * id) / 100;
            currentval = Math.floor(currentval);
            currentval = currentval + ":0";
            //var status = dimmingval;
            var status = 1;

            var percent = currentval;
            var fadervalue = statusCode.OFF+":"+statusCode.OFF;

            xmlString = "  <device>" +
                "  <pluginId>" + pluginId + "</pluginId>" +
                "  <macAddress>" + macAddress + "</macAddress>" +
                "  <modelCode>" + devicetype + "</modelCode>" +
                "  <status>" + status + "</status>" +
                "  <deviceCapabilityProfiles>" +
                "  <deviceCapabilityProfile>" +
                "  <capabilityId>" + capabilityId + "</capabilityId>" +
                "  <currentValue>" + currentval + "</currentValue>" +
                "  </deviceCapabilityProfile>" +
                "  <deviceCapabilityProfile>" +
                "  <capabilityId>" + ledCapabilities.FADER + "</capabilityId>" +
                "  <currentValue>" + fadervalue + "</currentValue>" +
                "  </deviceCapabilityProfile>" +
                "  </deviceCapabilityProfiles>" +
                "  </device>"
        } else if (capabilitytype == ledDeviceConstants.CAPABILITYFADER) {
            var capabilityId = ledCapabilities.FADER;
            var currentval = status;

            xmlString = "  <device>" +
                "  <pluginId>" + pluginId + "</pluginId>" +
                "  <macAddress>" + macAddress + "</macAddress>" +
                "  <modelCode>" + devicetype + "</modelCode>" +
                "  <status>" + 1 + "</status>" +
                "  <deviceCapabilityProfiles>" +
                "  <deviceCapabilityProfile>" +
                "  <capabilityId>" + capabilityId + "</capabilityId>" +
                "  <currentValue>" + currentval + "</currentValue>" +
                "  </deviceCapabilityProfile>" +
                "  </deviceCapabilityProfiles>" +
                "  </device>"
        } else if (capabilitytype == ledDeviceConstants.CAPABILITYTEMPERATURE) {
            var capabilityId = ledCapabilities.TEMPERATURE;
            var currentval = status;
            var ledDeviceType = wemoUtil.ledBulbType(devicetype);
            var CurrentDimmingValue = $("ul li[data-deviceid=" + pluginId + "]").find('.sliderValue').text();
            
            if(isNaN(CurrentDimmingValue) == true) {
            	CurrentDimmingValue = $("ul li[data-deviceid=" + pluginId + "]").find('.bulbStrength').text();
            }
            
            CurrentDimmingValue = CurrentDimmingValue.replace("%", "");
            var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
            var curdimmingvalue = (CurrentDimmingValue * AllowedVal) / 100;
            curdimmingvalue = Math.floor(curdimmingvalue);
            curdimmingvalue = curdimmingvalue + ":"+statusCode.OFF;
            var fadervalue = statusCode.OFF+":"+statusCode.OFF;
            
	            xmlString = "  <device>" +
	            "  <pluginId>" + pluginId + "</pluginId>" +
	            "  <macAddress>" + macAddress + "</macAddress>" +
	            "  <modelCode>" + devicetype + "</modelCode>" +
	            "  <status>1</status>" +
	            "  <deviceCapabilityProfiles>" +
	            "  <deviceCapabilityProfile>" +
	            "  <capabilityId>" + ledCapabilities.DIMMING + "</capabilityId>" +
                "  <currentValue>"+ curdimmingvalue + "</currentValue>" +
	            "  </deviceCapabilityProfile>" +
                "  <deviceCapabilityProfile>" +
                "  <capabilityId>" + ledCapabilities.ONOFF + "</capabilityId>" +
                "  <currentValue>1</currentValue>" +
                "  </deviceCapabilityProfile>" +
                "  <deviceCapabilityProfile>" +
                "  <capabilityId>" + ledCapabilities.FADER + "</capabilityId>" +
                "  <currentValue>" + fadervalue + "</currentValue>" +
                "  </deviceCapabilityProfile>" +
                "  <deviceCapabilityProfile>";
            
            if(wemoUtil.isColoredandTemperaturedBulb(ledDeviceType)){
            	xmlString +="  <capabilityId>" + ledCapabilities.COLOR + "</capabilityId>" +
                "  <currentValue>0</currentValue>" +
                "  </deviceCapabilityProfile>" +
                "  <deviceCapabilityProfile>" +
                "  <capabilityId>" + capabilityId + "</capabilityId>" +
                "  <currentValue>" + dimmingval + "</currentValue>";
            }else{
            	xmlString +="  <capabilityId>" + capabilityId + "</capabilityId>" +
                "  <currentValue>" + dimmingval + "</currentValue>";
            }
            
	            xmlString +="  </deviceCapabilityProfile>" +
	            "  </deviceCapabilityProfiles>" +
	            "  </device>";
            
        } else if (capabilitytype == ledDeviceConstants.CAPABILITYCOLOR) {
            var capabilityId = ledCapabilities.COLOR;
            var currentval = status;
            var ledDeviceType = wemoUtil.ledBulbType(devicetype);
            var CurrentDimmingValue = $("ul li[data-deviceid=" + pluginId + "]").find('.sliderValue').text();
            
            if(isNaN(CurrentDimmingValue) == true) {
            	CurrentDimmingValue = $("ul li[data-deviceid=" + pluginId + "]").find('.bulbStrength').text();
            }
            
            CurrentDimmingValue = CurrentDimmingValue.replace("%", "");
            var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
            var curdimmingvalue = (CurrentDimmingValue * AllowedVal) / 100;
            curdimmingvalue = Math.floor(curdimmingvalue);
            curdimmingvalue = curdimmingvalue + ":"+statusCode.OFF;
            var fadervalue = statusCode.OFF+":"+statusCode.OFF;
            
	            xmlString = "  <device>" +
	                "  <pluginId>" + pluginId + "</pluginId>" +
	                "  <macAddress>" + macAddress + "</macAddress>" +
	                "  <modelCode>" + devicetype + "</modelCode>" +
	                "  <status>" + 1 + "</status>" +
	                "  <deviceCapabilityProfiles>" +
		            "  <deviceCapabilityProfile>" +
		            "  <capabilityId>" + ledCapabilities.DIMMING + "</capabilityId>" +
	                "  <currentValue>"+ curdimmingvalue + "</currentValue>" +
		            "  </deviceCapabilityProfile>" +
	                "  <deviceCapabilityProfile>" +
	                "  <capabilityId>" + ledCapabilities.ONOFF + "</capabilityId>" +
	                "  <currentValue>1</currentValue>" +
	                "  </deviceCapabilityProfile>" +
	                "  <deviceCapabilityProfile>" +
	                "  <capabilityId>" + ledCapabilities.FADER + "</capabilityId>" +
	                "  <currentValue>" + fadervalue + "</currentValue>" +
	                "  </deviceCapabilityProfile>" +
	                "  <deviceCapabilityProfile>";
	        
	            if(wemoUtil.isColoredandTemperaturedBulb(ledDeviceType)){
	            	xmlString +="  <capabilityId>" + ledCapabilities.TEMPERATURE + "</capabilityId>" +
	                "  <currentValue>0</currentValue>" +
	                "  </deviceCapabilityProfile>" +
	                "  <deviceCapabilityProfile>" +
	                "  <capabilityId>" + capabilityId + "</capabilityId>" +
	                "  <currentValue>" + dimmingval + "</currentValue>";
	            }else{
	            	xmlString +="  <capabilityId>" + capabilityId + "</capabilityId>" +
	                "  <currentValue>" + dimmingval + "</currentValue>";
	            }
	            
	            xmlString +="  </deviceCapabilityProfile>" +
	            "  </deviceCapabilityProfiles>" +
	            "  </device>";
            
        }

        return xmlString;
    },

    ledstateChangeOnCloud: function(request, reqtype) {
        cordova.exec(function(params) {
            var authCode = params[0];
   
            $.ajax({
                url: cloudAPI.LED_STATE_CHANGE,
                type: "PUT",
                data: request,
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('Content-Type', 'application/xml');
                    xhr.setRequestHeader('Authorization', authCode);
                },
                success: function(data) {
                    var responseXML = (new XMLSerializer()).serializeToString(data);
                    wemoUtil.log(TAGB, responseXML);
                    
                    if (reqtype == "statusdimmingvalchange") {

                        $(data).find('device').each(function() {

                            var device_status = $(this).find("status").text();
                            var device_plugin_id = $(this).find("pluginId").text();
                            var device_mac_address = $(this).find("macAddress").text();
                            var device_status_timestamp = $(this).find("statusTS").text();

                            var icon = $("[wemo-device-mac-address='" + device_mac_address + "']");
                            var device_current_status_value = "";

                            $(this).find('deviceCapabilityProfile').each(function(i) {

                                if ($(this).children("capabilityId").text() == "10006") {
                                    device_current_status_value = $(this).find("currentValue").text();
                                    device_current_status_value = $.trim(device_current_status_value);
                                }

                            });

                            if (animationLED != undefined) {
                                $.fn.animatePNG.stop(animationLED);
                                clearInterval(animationLED);
                            }
                            $("#" + device_plugin_id).find('.animation').remove();

                            $("#" + device_plugin_id).attr('wemo-device-state-code', device_current_status_value);
                            var new_class = device_list_bridge.getBinaryStateImage(device_current_status_value);
                            $("#" + device_plugin_id).attr('wemo-device-state', new_class);
                            $("#" + device_plugin_id).removeClass().addClass(new_class);
                            var panel = $('#drawer-' + device_plugin_id);
                            device_list_bridge.cancelSleepFader(device_plugin_id);

                            if (new_class.indexOf('led_off') != -1) {
                                $(panel).addClass('setOpacity');
                                $(panel).find('.goSleep').attr('disabled', true).addClass('disableGoSleep');
                                device_list_bridge.buttonController.goToSleep.disable();
                                $("ul li[data-deviceId=" + device_plugin_id + "]").find('.sliderValue').removeClass('LedBrihtnesscolorChange');
                            } else {
                                $(panel).removeClass('setOpacity');
                                $(panel).find('.goSleep').removeAttr('disabled').removeClass('disableGoSleep');
                                device_list_bridge.buttonController.goToSleep.enable();
                                $("ul li[data-deviceId=" + device_plugin_id + "]").find('.sliderValue').addClass('LedBrihtnesscolorChange');
                            }
    
                        });
                    } else if (reqtype == "ondimmingstatuschange") {
                        $(data).find('device').each(function() {

                            var device_status = $(this).find("status").text();
                            var device_plugin_id = $(this).find("pluginId").text();
                            var device_mac_address = $(this).find("macAddress").text();
                            var device_status_timestamp = $(this).find("statusTS").text();
                            var new_class = device_list_bridge.getBinaryStateImage(device_status);
                            var panel = $('#drawer-' + device_plugin_id);
                            device_list_bridge.cancelSleepFader(device_plugin_id);
                            
                            if (new_class.indexOf('led_off') != -1) {
                                $(panel).addClass('setOpacity');
                                $(panel).find('.goSleep').attr('disabled', true).addClass('disableGoSleep');
                                device_list_bridge.buttonController.goToSleep.disable();
                                $("ul li[data-deviceId=" + device_plugin_id + "]").find('.sliderValue').removeClass('LedBrihtnesscolorChange');
                            } else {
                                $(panel).removeClass('setOpacity');
                                $(panel).find('.goSleep').removeAttr('disabled').removeClass('disableGoSleep');
                                device_list_bridge.buttonController.goToSleep.enable();
                                $("ul li[data-deviceId=" + device_plugin_id + "]").find('.sliderValue').addClass('LedBrihtnesscolorChange');
                            }

                        });

                    } else if (reqtype == "bedTimeSleep") {
                        $(data).find('device').each(function() {

                            var device_status = $(this).find("status").text();
                            var device_plugin_id = $(this).find("pluginId").text();
                            var device_mac_address = $(this).find("macAddress").text();
                            var device_status_timestamp = $(this).find("statusTS").text();
                            var new_class = device_list_bridge.getBinaryStateImage(device_status);
                            $("ul li[data-deviceId=" + device_plugin_id + "]").find('.sliderValue').removeClass('LedBrihtnesscolorChange');
                        });

                    }

                },
                error: function(xhr, textstatus) {
                    wemoUtil.infoLog(TAGB, 'status2222: ' + xhr.status);
                    wemoUtil.infoLog(TAGB, 'status text2222: ' + xhr.statusText);
                    if (xhr.status == "503") {
                        wemoUtil.loadUrl(filePath.CLOUD_AVAILABILITY);
                    }
                }
            });

        }, function(err) {
            console.log("failure call back");
        }, "WebServicePlugin", "getAuthCode", []);

    },

    buildXMLForledGroupStateChange: function(spanID, deviceIDs, capabilityIDS, Groupname, homeID, currentVal, capabilitytype, maxallowedval, GroupUniqueID, CurrentVal) {
        xmlString = "<groups>" +
            device_list_bridge.buildXMLForGroup(spanID, deviceIDs, capabilityIDS, Groupname, homeID, currentVal, capabilitytype, maxallowedval, GroupUniqueID, CurrentVal) +
            "</groups>";
        return xmlString;
    },

    buildXMLForGroup: function(spanID, deviceIDs, capabilityIDS, Groupname, homeID, currentVal, capabilitytype, maxallowedval, GroupUniqueID, CurrentVal) {

        if (capabilitytype == ledDeviceConstants.CAPABILITYONOFF) {
            var currentval = currentVal;
            var splitCapabilityArr = capabilityIDS.split(",");
            var splitDeviceList = deviceIDs.split(",");
            var iconversion = "";

            xmlString = "<group>" +
                "<id>" + GroupUniqueID + "</id>" +
                "<referenceId>" + spanID + "</referenceId>" +
                "<groupName>" + Groupname + "</groupName>" +
                " <iconVersion>" + iconversion + "</iconVersion>" +
                "<devices>";

            for (var j = 0; j < splitDeviceList.length; j++) {
                xmlString += "<device>" +
                    "<deviceId>" + splitDeviceList[j] + "</deviceId>" +
                    "</device>";
            }

            xmlString += "</devices>" +
                "<capabilities>";

            if (currentval == 1) {
                for (var k = 0; k < splitCapabilityArr.length; k++) {

                    var capabilityres = $.trim(splitCapabilityArr[k]);

                    if (capabilityres == ledCapabilities.ONOFF) {
                        xmlString += "<capability>" +
                            "<capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                            "<currentValue>" + currentval + "</currentValue>" +
                            "</capability>";
                    } else if (capabilityres == ledCapabilities.DIMMING) {
                        xmlString += "<capability>" +
                            "<capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                            "<currentValue>" + CurrentVal + "</currentValue>" +
                            "</capability>";
                    }

                }
            } else {
                for (var k = 0; k < splitCapabilityArr.length; k++) {

                    var capabilityres = $.trim(splitCapabilityArr[k]);

                    if (capabilityres == ledCapabilities.ONOFF) {
                        xmlString += "<capability>" +
                            "<capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                            "<currentValue>" + currentval + "</currentValue>" +
                            "</capability>";
                    }

                }
            }


            xmlString += "</capabilities>" +
                "</group>";

        } else if (capabilitytype == ledDeviceConstants.CAPABILITYDIMMING) {

            var currentval = (currentVal * maxallowedval) / 100;
            currentval = Math.floor(currentval);
            var status = 1;
            //var status = CurrentVal;
            var splitCapabilityArr = capabilityIDS.split(",");
            var splitDeviceList = deviceIDs.split(",");
            var iconversion = "";
            var fadervalue = statusCode.OFF+";"+statusCode.OFF;
            
            xmlString = "<group>" +
                "<id>" + GroupUniqueID + "</id>" +
                "<referenceId>" + spanID + "</referenceId>" +
                "<groupName>" + Groupname + "</groupName>" +
                " <iconVersion>" + iconversion + "</iconVersion>" +
                "<devices>";

            for (var j = 0; j < splitDeviceList.length; j++) {
                xmlString += "<device>" +
                    "<deviceId>" + splitDeviceList[j] + "</deviceId>" +
                    "</device>";
            }

            xmlString += "</devices>" +
                "<capabilities>";

            for (var k = 0; k < splitCapabilityArr.length; k++) {

                var capabilityres = $.trim(splitCapabilityArr[k]);
                
                if (capabilityres == ledCapabilities.ONOFF) {
                    xmlString += "<capability>" +
                        "<capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                        "<currentValue>" + status + "</currentValue>" +
                        "</capability>";
                } else if (capabilityres == ledCapabilities.DIMMING) {
                    var Curval = currentval + ":0";
                    xmlString += "<capability>" +
                        "<capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                        "<currentValue>" + Curval + "</currentValue>" +
                        "</capability>";
                } else if (capabilityres == ledCapabilities.FADER) {
                    xmlString += "<capability>" +
                    "<capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                    "<currentValue>" + fadervalue + "</currentValue>" +
                    "</capability>";
                }

            }

            xmlString += "</capabilities>" +
                "</group>";
        } else if (capabilitytype == ledDeviceConstants.CAPABILITYDRAWER) {
            var status = 1;
            var splitCapabilityArr = capabilityIDS.split(",");
            var splitDeviceList = deviceIDs.split(",");
            var iconversion = "";

            xmlString = "<group>" +
                "<id>" + GroupUniqueID + "</id>" +
                "<referenceId>" + spanID + "</referenceId>" +
                "<groupName>" + Groupname + "</groupName>" +
                " <iconVersion>" + iconversion + "</iconVersion>" +
                "<devices>";

            for (var j = 0; j < splitDeviceList.length; j++) {
                xmlString += "<device>" +
                    "<deviceId>" + splitDeviceList[j] + "</deviceId>" +
                    "</device>";
            }

            xmlString += "</devices>" +
                "<capabilities>";

            for (var k = 0; k < splitCapabilityArr.length; k++) {

                var capabilityres = $.trim(splitCapabilityArr[k]);

                if (capabilityres == ledCapabilities.FADER) {
                    var Curval = currentVal;
                    xmlString += "<capability>" +
                        "<capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                        "<currentValue>" + Curval + "</currentValue>" +
                        "</capability>";
                }

            }

            xmlString += "</capabilities>" +
                "</group>";
        } else if (capabilitytype == ledDeviceConstants.CAPABILITYTEMPERATURE) {
            var currentval = currentVal;
            var splitCapabilityArr = capabilityIDS.split(",");
            var splitDeviceList = deviceIDs.split(",");
            var iconversion = "";
            var modelcode = $("#"+spanID).attr('wemo-device-modelcode');
            var tempString = "";
            if(modelcode.indexOf(",") != -1){
            	var modelcodeArr = modelcode.split(",");
            	modelcode = modelcodeArr[0];
            }
            	
            var ledDeviceType = wemoUtil.ledBulbType(modelcode);
            var CurrentDimmingValue = $("ul li[data-deviceid=" + spanID + "]").find('.sliderValue').text();
            
            if(isNaN(CurrentDimmingValue) == true) {
            	CurrentDimmingValue = $("ul li[data-deviceid=" + spanID + "]").find('.bulbStrength').text();
            }
            
            CurrentDimmingValue = CurrentDimmingValue.replace("%", "");
            var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
            var curdimmingvalue = (CurrentDimmingValue * AllowedVal) / 100;
            curdimmingvalue = Math.floor(curdimmingvalue);
            curdimmingvalue = curdimmingvalue + ":"+statusCode.OFF;
            var fadervalue = statusCode.OFF+";"+statusCode.OFF;
            
            xmlString = "<group>" +
                "<id>" + GroupUniqueID + "</id>" +
                "<referenceId>" + spanID + "</referenceId>" +
                "<groupName>" + Groupname + "</groupName>" +
                " <iconVersion>" + iconversion + "</iconVersion>" +
                "<devices>";

            for (var j = 0; j < splitDeviceList.length; j++) {
                xmlString += "<device>" +
                    "<deviceId>" + splitDeviceList[j] + "</deviceId>" +
                    "</device>";
            }

            xmlString += "</devices>" +
                "<capabilities>";

                for (var k = 0; k < splitCapabilityArr.length; k++) {

                    var capabilityres = $.trim(splitCapabilityArr[k]);
                    if (capabilityres == ledCapabilities.ONOFF) {
                        xmlString += "<capability>" +
                            "<capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                            "<currentValue>1</currentValue>" +
                            "</capability>";
                    } 
                    if (capabilityres == ledCapabilities.DIMMING) {
                        xmlString += "<capability>" +
                            "<capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                            "<currentValue>" + curdimmingvalue + "</currentValue>" +
                            "</capability>";
                    } 
                    if (capabilityres == ledCapabilities.FADER) {
                        xmlString += "<capability>" +
                        "<capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                        "<currentValue>" + fadervalue + "</currentValue>" +
                        "</capability>";
                    }
                    if (capabilityres == ledCapabilities.COLOR && wemoUtil.isColoredandTemperaturedBulb(ledDeviceType)) {
                    	tempString += "<capability>" +
                            "<capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                            "<currentValue>0/currentValue>" +
                            "</capability>";
                    }
                    if (capabilityres == ledCapabilities.TEMPERATURE) {
                    	if(tempString != "")
                         	xmlString += tempString;
                         
                        xmlString += "<capability>" +
                            "<capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                            "<currentValue>" + currentval + "</currentValue>" +
                            "</capability>";
                    } 
                    
                }
               
                xmlString += "</capabilities>" +
                    "</group>";
                
          } else if (capabilitytype == ledDeviceConstants.CAPABILITYCOLOR) {
              var currentval = currentVal;
              var splitCapabilityArr = capabilityIDS.split(",");
              var splitDeviceList = deviceIDs.split(",");
              var iconversion = "";
              var modelcode = $("#"+spanID).attr('wemo-device-modelcode');
              var fadervalue = statusCode.OFF+";"+statusCode.OFF;
              
              if(modelcode.indexOf(",") != -1){
              	var modelcodeArr = modelcode.split(",");
              	modelcode = modelcodeArr[0];
              }
              
              var ledDeviceType = wemoUtil.ledBulbType(modelcode);
              var CurrentDimmingValue = $("ul li[data-deviceid=" + spanID + "]").find('.sliderValue').text();
              
              if(isNaN(CurrentDimmingValue) == true) {
              	CurrentDimmingValue = $("ul li[data-deviceid=" + spanID + "]").find('.bulbStrength').text();
              }
              
              CurrentDimmingValue = CurrentDimmingValue.replace("%", "");
              var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
              var curdimmingvalue = (CurrentDimmingValue * AllowedVal) / 100;
              curdimmingvalue = Math.floor(curdimmingvalue);
              curdimmingvalue = curdimmingvalue + ":"+statusCode.OFF;
              
              xmlString = "<group>" +
                  "<id>" + GroupUniqueID + "</id>" +
                  "<referenceId>" + spanID + "</referenceId>" +
                  "<groupName>" + Groupname + "</groupName>" +
                  " <iconVersion>" + iconversion + "</iconVersion>" +
                  "<devices>";

              for (var j = 0; j < splitDeviceList.length; j++) {
                  xmlString += "<device>" +
                      "<deviceId>" + splitDeviceList[j] + "</deviceId>" +
                      "</device>";
              }

              xmlString += "</devices>" +
                  "<capabilities>";

                  for (var k = 0; k < splitCapabilityArr.length; k++) {

                      var capabilityres = $.trim(splitCapabilityArr[k]);

                      if (capabilityres == ledCapabilities.ONOFF) {
                          xmlString += "<capability>" +
                              "<capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                              "<currentValue>1</currentValue>" +
                              "</capability>";
                      }
                      if (capabilityres == ledCapabilities.DIMMING) {
                          xmlString += "<capability>" +
                              "<capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                              "<currentValue>" + curdimmingvalue + "</currentValue>" +
                              "</capability>";
                      }
                      if (capabilityres == ledCapabilities.FADER) {
                          xmlString += "<capability>" +
                          "<capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                          "<currentValue>" + fadervalue + "</currentValue>" +
                          "</capability>";
                      }
                      if (capabilityres == ledCapabilities.TEMPERATURE && wemoUtil.isColoredandTemperaturedBulb(ledDeviceType)) {
                          xmlString += "<capability>" +
                              "<capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                              "<currentValue>0</currentValue>" +
                              "</capability>";
                      } 
                      if (capabilityres == ledCapabilities.COLOR) {
                          xmlString += "<capability>" +
                              "<capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                              "<currentValue>" + currentval + "</currentValue>" +
                              "</capability>";
                      } 
               
                      
                  }

                  xmlString += "</capabilities>" +
                      "</group>";
         }


        return xmlString;
    },

    ledGroupstateChangeOnCloud: function(request, reqtype) {
        cordova.exec(function(params) {
            var authCode = params[0];
          
            $.ajax({
                url: cloudAPI.LED_STATE_CHANGE_GROUP,
                type: "PUT",
                data: request,
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('Content-Type', 'application/xml');
                    xhr.setRequestHeader('Authorization', authCode);
                },
                success: function(data) {
                    var responseXML = (new XMLSerializer()).serializeToString(data);
                    wemoUtil.log(TAGB, responseXML);


                    if (reqtype == ledDeviceConstants.STATUSDIMMINGVALCHANGE || reqtype == ledDeviceConstants.STATUSFADER) {
                        $(data).find('group').each(function() {

                            var device_group_id = $(this).find("referenceId").text();
                            var device_current_status_value = "";

                            $(this).find('capabilities').each(function(i) {
                                $(this).find('capability').each(function(j) {
                                    if ($(this).find('capabilityId').text() == ledCapabilities.ONOFF) {
                                        device_current_status_value = $(this).find('currentValue').text();
                                        device_current_status_value = $.trim(device_current_status_value);
                                    }
                                });
                            });

                            if (animationLED != undefined) {
                                $.fn.animatePNG.stop(animationLED);
                                clearInterval(animationLED);
                            }
                            $("#" + device_group_id).find('.animation').remove();
                            $("#" + device_group_id).attr('wemo-device-state-code', device_current_status_value);
                            var new_class = device_list_bridge.getBinaryStateImage(device_current_status_value);
                            $("#" + device_group_id).attr('wemo-device-state', new_class);
                            $("#" + device_group_id).removeClass().addClass(new_class);
                       
                            if(reqtype == ledDeviceConstants.STATUSDIMMINGVALCHANGE){
                            	device_list_bridge.cancelSleepFader(device_group_id);
                            }
                            
                            var panel = $('#drawer-' + device_group_id);

                            if (new_class.indexOf('led_off') != -1) {
                                $(panel).addClass('setOpacity');
                                $(panel).find('.goSleep').attr('disabled', true).addClass('disableGoSleep');
                                device_list_bridge.buttonController.goToSleep.disable();
                                $("ul li[data-deviceId=" + device_group_id + "]").find('.sliderValue').removeClass('LedBrihtnesscolorChange');
                            } else {
                                $(panel).removeClass('setOpacity');
                                $(panel).find('.goSleep').removeAttr('disabled').removeClass('disableGoSleep');
                                device_list_bridge.buttonController.goToSleep.enable();
                                $("ul li[data-deviceId=" + device_group_id + "]").find('.sliderValue').addClass('LedBrihtnesscolorChange');
                            }

                        });
                    }

                },
                error: function(xhr, textstatus) {
                    wemoUtil.infoLog(TAGB, 'status2222: ' + xhr.status);
                    wemoUtil.infoLog(TAGB, 'status text2222: ' + xhr.statusText);
                }
            });

        }, function(err) {
            console.log("failure call back");
        }, "WebServicePlugin", "getAuthCode", []);

    },
    gettingCloudImage: function() {

        cordova.exec(function(params) {
            var authCode = params[0];
            var homeId = params[1];
          
            // nativeUtilPlugin.execute(null,null,actions.SHOW_PROGRESS,[]);
            $.ajax({
                url: cloudAPI.LED_GET_ICON + homeId,
                type: "GET",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('Content-Type', 'application/xml; charset=UTF-8');
                    xhr.setRequestHeader('Accept', 'application/xml');
                    xhr.setRequestHeader('Authorization', authCode);
                    xhr.setRequestHeader('HomeId', homeId);
                },
                success: function(data) {

                    var responseXML = (new XMLSerializer()).serializeToString(data);
                    var splitLength = 4000;
                    var length = responseXML.length;
                    var ittr = Math.floor(length / splitLength) + 1;
                    for (var i = 0; i < ittr; i++) {
                        var end = ((i + 1) * splitLength);
                        if (end > length) {
                            end = length;
                        }
                        wemoUtil.log(TAGB, responseXML.substring(splitLength * i, end));
                    }

                    $(data).find('upload').each(function(i, val) {
                        var deviceId = $(this).find('referenceId').text();
                        fromCloud.push(deviceId);
                    });

                    $(data).find('upload').each(function(i, val) {
                        var uploadId = $(this).find('uploadId').text();
                        var deviceId = $(this).find('referenceId').text();
       
                        if (deviceId != null) {
                            device_list_bridge.uploadedImage(deviceId, uploadId);
                        } else {
                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                        }

                    });

                },
                error: function(xhr, textstatus) {
                    // alert('xhr.status'+xhr.status);
                    // alert('xhr.statusText'+xhr.statusText);
                    nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                    wemoUtil.infoLog(TAGB, 'status: ' + xhr.status);
                    wemoUtil.infoLog(TAGB, 'status text444: ' + xhr.statusText);
                }
            });

        }, function(err) {
            nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
            console.log('err' + err);
        }, "WebServicePlugin", "getAuthCode", []);

    },

    uploadedImage: function(deviceId, cloudRefId) {

        cordova.exec(function(params) {
            var authCode = params[0];
            var homeId = params[1];
        
            $.ajax({
                url: cloudAPI.LED_EDIT_ICON + cloudRefId,
                type: "GET",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('Content-Type', 'application/xml; charset=UTF-8');
                    xhr.setRequestHeader('Accept', 'application/xml');
                    xhr.setRequestHeader('Authorization', authCode);

                },
                success: function(data) {
                    var lastElm = fromCloud[fromCloud.length - 1];

                    $(data).each(function() {
                        var firstName = $(this).find('firstName').text();
                        var url = $(this).find('url').last().text();
                        deviceIdAndImg.push(deviceId + '&&' + url);
                        deviceIcon[deviceId] = url;
                        $("ul li[data-deviceId=" + deviceId + "]").find('.device_list_icon_container img').attr('src', url);
                        $("ul li[data-macId=" + deviceId + "]").find('.device_list_icon_container img').attr('src', url);

                    });
                    if (lastElm == deviceId) {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                    }
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.DEVICE_LED_ICON, deviceIcon);
                },
                error: function(xhr, textstatus) {
                    gettingCloudImage = false;
                    nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                    wemoUtil.infoLog(TAGB, 'status uploadedImage: ' + xhr.status);
                    wemoUtil.infoLog(TAGB, 'status text uploadedImage: ' + xhr.statusText);
                }
            });

        }, function(err) {
            console.log('err' + err);
        }, "WebServicePlugin", "getAuthCode", []);

    },

    loadBridgeDevicesFromUpNp: function(inp) {

        if (counterCall == 0) {
            sharedPreferences.get(sharedPreferencesConstants.WEMO_NAMESPACE, sharedPreferencesConstants.WEMO_LED_DEVICE_CACHE, '', function(value) {
                if (value != null && value.length > 0) {
                    arrCache = JSON.parse(value);
                    _ledDeviceCache = arrCache;

                    for (var i = 0; i < arrCache.length; i++) {
                        var deviceManufacture = "";
                        var modelCode = "";

                        if (arrCache[i].ManufacturerName != undefined)
                            deviceManufacture = arrCache[i].ManufacturerName;

                        if (arrCache[i].ModelCode != undefined)
                            modelCode = arrCache[i].ModelCode;

                        if (deviceManufacture != "" && modelCode != "") 
                        	iconURL = wemoUtil.replaceSpaceinModelCodeandManufacturer(deviceManufacture, modelCode);
                        else if(modelCode != "")
                        	iconURL = wemoUtil.replaceSpaceinModelCode(modelCode);
                        else
                            iconURL = defaultIcon.LED_THUMB_URI;

                        arrCache[i].imgURL = iconURL;

                    }
                    device_list_bridge.ledDeviceRendering(arrCache, "initialCache");
                    var devicelistarr = window.sessionStorage.getItem(sessionStorage.LED_DEVICE_LIST_ARRAY);
                	wemoUtil.infoLog(TAGB, 'loadBridgeDevicesFromUpNp devicelistarr: '+devicelistarr);
                	if (devicelistarr != null && devicelistarr.length > 0) 
                	{
                		var devicearr = devicelistarr.split(",");
                		device_list_bridge.showLEDDeviceSpinner(devicearr);
                	}
                    var leddevices = JSON.stringify(_ledDeviceCache);
                    device_list_bridge.isLedFirmware(leddevices);
                }
                setTimeout(function() {
                    devicePlugin.execute(
                        function(leddevices) {
                            var len = leddevices.length;
                            //updating current state of led devices
                            if (arrCache != null && arrCache.length > 0) {
                                if (len != 0) {
                                    for (var i = 0; i < arrCache.length; i++) {

                                        var tempLedObject = '';
                                        if (arrCache[i].isRendered == false) {
                                            continue;
                                        }
                                        if (arrCache[i].GroupID == undefined || arrCache[i].GroupID == null) {
                                            var ID = arrCache[i].DeviceID;
                                            var found = false;
                                            for (var j = 0; j < len; j++) {
                                                tempLedObject = leddevices[j];
                                                var ID2 = leddevices[j].DeviceID;
                                                if (ID == ID2) {
                                                    found = true;
                                                    break;
                                                }
                                            }
                                            if (found) {
                                                arrCache[i] = tempLedObject;
                                                arrCache[i].InActive = 1;
                                            } else {
                                            	arrCache.splice(i,1);
                                            	i--;
                                                //arrCache[i].InActive = 3;
                                            }
                                        } else {
                                            var ID = arrCache[i].GroupID;
                                            var found = false;
                                            for (var j = 0; j < len; j++) {
                                                tempLedObject = leddevices[j];
                                                var ID2 = leddevices[j].GroupID;
                                                if (ID == ID2) {
                                                    found = true;
                                                    break;
                                                }
                                            }
                                            if (found) {
                                                arrCache[i] = tempLedObject;
                                                arrCache[i].InActive = 1;
                                            } else {
                                                //arrCache[i].InActive = 3;
                                            	arrCache.splice(i,1);
                                            	i--;
                                            }
                                        }
                                    }
                                } else {
                                    //no devices found in local network. Thus update state of all led cached devices as Inactive = 3
                                    for (var index = 0; index < arrCache.length; index++) {
                                        arrCache[index].InActive = 3;
                                    }
                                }
                            }
                            // adding new devices that are not cached.
                            if (arrCache != null && arrCache.length > 0) {
                                for (var i = 0; i < len; i++) {

                                    var arrayCacheLength = arrCache.length;
                                    if (leddevices[i].GroupID == undefined || leddevices[i].GroupID == null) {
                                        var ID = leddevices[i].DeviceID;
                                        var found = false;
                                        for (var j = 0; j < arrayCacheLength; j++) {
                                            if (arrCache[j].GroupID == undefined) {
                                                var ID2 = arrCache[j].DeviceID;
                                                if (ID == ID2) {
                                                    found = true;
                                                }
                                            }
                                        }
                                        if (!found) {
                                            leddevices[i].isRendered = false;
                                            leddevices[i].InActive = 3;
                                            arrCache.push(leddevices[i]);
                                        }
                                    } else {
                                        var ID = leddevices[i].GroupID;
                                        var found = false;
                                        for (var j = 0; j < arrayCacheLength; j++) {
                                            if (arrCache[j].GroupID != undefined) {
                                                var ID2 = arrCache[j].GroupID;
                                                if (ID == ID2) {
                                                    found = true;
                                                }
                                            }
                                        }
                                        if (!found) {
                                            leddevices[i].isRendered = false;
                                            leddevices[i].InActive = 3;
                                            arrCache.push(leddevices[i]);
                                        }
                                    }
                                }
                            } else {
                                for (var i = 0; i < len; i++) {

                                    var deviceManufacture = "";
                                    var modelCode = "";

                                    if (leddevices[i].ManufacturerName != undefined)
                                        deviceManufacture = leddevices[i].ManufacturerName;

                                    if (leddevices[i].ModelCode != undefined)
                                        modelCode = leddevices[i].ModelCode;


                                    if (deviceManufacture != "" && modelCode != "") 
                                    	iconURL = wemoUtil.replaceSpaceinModelCodeandManufacturer(deviceManufacture, modelCode);
                                    else if(modelCode != "")
                                    	iconURL = wemoUtil.replaceSpaceinModelCode(modelCode);
                                    else
                                        iconURL = defaultIcon.LED_THUMB_URI;
                                
                                    leddevices[i].imgURL = iconURL;
                                }

                                arrCache = leddevices;
                                if (arrCache != null && arrCache.length > 0) {
                                    for (var i = 0; i < arrCache.length; i++) {
                                        arrCache[i].isRendered = false;
                                        arrCache[i].InActive = 3;
                                    }
                                }
                            }
                            _ledDeviceCache = arrCache;
                            var cacheJSON = JSON.stringify(arrCache);
                            sharedPreferences.set(sharedPreferencesConstants.WEMO_NAMESPACE, sharedPreferencesConstants.WEMO_LED_DEVICE_CACHE, cacheJSON);
                            counterCall++;
                            device_list_bridge.ledDeviceRendering(arrCache, inp);

                            var leddevices = JSON.stringify(_ledDeviceCache);
                            device_list_bridge.isLedFirmware(leddevices);

                        }, //function close
                        device_list_bridge.reportError,
                        ACTION_GET_END_DEVICE, ["pairedlist"]
                    );
                }, 100);

            });
        }
    },

    stateChange: function(state, reqtype, currID, groupID, dimmingvalue) {
        var devlist = "";
        var inputArr = "";
        var deviceID = "";
        
        if (state == 1) {
            var CurrentVal = dimmingvalue + "," + state + "," + statusCode.OFF+":"+statusCode.OFF;
            var SliderVal = $("#mainLIID" + currID).find('.sliderValue').text();
            var capabilities = ledCapabilities.DIMMING + "," + ledCapabilities.ONOFF + "," + ledCapabilities.FADER;
            
            if(SliderVal.indexOf("%") != -1)
            	$("#mainLIID" + currID).find('.sliderValue').addClass('LedBrihtnesscolorChange');

            if (reqtype == ledDeviceConstants.SINGLE) {
                devlist = [currID];
                deviceID = currID;
                inputArr = [CurrentVal, capabilities, "NO"];
            } else if (reqtype == ledDeviceConstants.GROUP) {
                devlist = [groupID];
                deviceID = groupID;
                inputArr = [CurrentVal, capabilities, "YES"];
            }

        } else {
            var CurrentVal = state;
            var SliderVal = $("#mainLIID" + currID).find('.sliderValue').text();
            
            if(SliderVal.indexOf("%") != -1)
            	$("#mainLIID" + currID).find('.sliderValue').removeClass('LedBrihtnesscolorChange');

            if (reqtype == ledDeviceConstants.SINGLE) {
                devlist = [currID];
                deviceID = currID;
                inputArr = [CurrentVal, ledCapabilities.ONOFF, "NO"];
            } else if (reqtype == ledDeviceConstants.GROUP) {
                devlist = [groupID];
                deviceID = groupID;
                inputArr = [CurrentVal, ledCapabilities.ONOFF, "YES"];
            }
        }

        devicePlugin.execute(
            function(response) {
            	device_list_bridge.changeLEDStateClass(deviceID, state);
            	device_list_bridge.cancelSleepFader(deviceID);
            },
            device_list_bridge.reportError,
            ACTION_SET_LED_STATUS, [inputArr, devlist]
        );

    },

    dimmingValChange: function(dimmingvalue, currID, groupID, reqtype, currstate) {

        dimmingvalue = dimmingvalue.replace(/%$/, '');
        var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;

        var currentval = (dimmingvalue * AllowedVal) / 100;
        currentval = Math.floor(currentval);

        var CurrentVal = statusCode.ON+"," + currentval + ":"+statusCode.OFF+","+statusCode.OFF+":"+statusCode.OFF;
        var state = 1;
        var capabilities = ledCapabilities.ONOFF + "," + ledCapabilities.DIMMING + "," + ledCapabilities.FADER;
        var devlist = "";
        var inputArr = "";
        var deviceID = "";
        
        if (reqtype == ledDeviceConstants.SINGLE) {
            devlist = [currID];
            deviceID = currID;
            inputArr = [CurrentVal, capabilities, "NO"];
        } else if (reqtype == ledDeviceConstants.GROUP) {
            devlist = [groupID];
            deviceID = groupID;
            inputArr = [CurrentVal, capabilities, "YES"];
        }

        devicePlugin.execute(
            function() {
            	device_list_bridge.changeLEDStateClass(deviceID, state);
            	device_list_bridge.cancelSleepFader(deviceID);
            },
            device_list_bridge.reportError,
            ACTION_SET_LED_STATUS, [inputArr, devlist]
        );
    },

    createGroups: function(request, type) {
        nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, []);
        var dfd = $.Deferred();
        cordova.exec(function(params) {
            var authCode = params[0];
            var homeId = params[1];

            if (type == "updategroup" || type == "updategroupfader") {
                cloudurl = cloudAPI.LED_CREATE_GROUP + homeId + "?remoteSync=true";
                typeofcall = "PUT";
            } else if (type == "creategroup") {
                cloudurl = cloudAPI.LED_CREATE_GROUP + homeId + "?remoteSync=true";
                typeofcall = "POST";
            } else {
                cloudurl = cloudAPI.LED_CREATE_GROUP + homeId + "?remoteSync=true";
                typeofcall = "POST";
            }

            $.ajax({
                url: cloudurl,
                type: typeofcall,
                data: request,
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('Content-Type', 'application/xml');
                    xhr.setRequestHeader('Authorization', authCode);
                },
                success: function(data) {
                    //nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                    //var responseXML = (new XMLSerializer()).serializeToString(data);
                    //wemoUtil.log(TAGB, responseXML);
                    
                    $(data).find('group').each(function() {

                        device_list_bridge.clearLedCache();
                        

                        if (type == "updategroupfader") {
                            $('#removedevice_status_header').html(wemo.items['RemoveDevice']);
                            $('#removedevice_status_body').html(wemo.items['deviceRemovedFromGroup']);
                            $("#removedevice_status_popup").popup("open");
                        } else {
                            var code = $(this).find("code").text();
                            var groupID = $(this).find("referenceId").text();
                            var groupName = $(this).find("groupName").text();
                            var deviceIDS = "";
                            var CapabilityIDS = "";

                            $(this).find('device').each(function(i) {
                                deviceIDS += $(this).find("deviceId").text() + ",";
                            });

                            deviceIDS = deviceIDS.substr(0, deviceIDS.length - 1);

                            $(this).find('capability').each(function(i) {
                                CapabilityIDS += $(this).children("capabilityId").text() + ",";
                            });

                            CapabilityIDS = CapabilityIDS.substr(0, CapabilityIDS.length - 1);

                        }

                    });
                    dfd.resolve();

                },
                error: function(xhr, textstatus) {
                    nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                    wemoUtil.infoLog(TAGB, 'status4444: ' + xhr.status);
                    wemoUtil.infoLog(TAGB, 'status text444: ' + xhr.statusText);
                    $('#errorhandlingpopup_title').html(wemo.items['LedWalkthroughSlideTitle']);
                    $('#errorhandlingpopup_desc').html(wemo.items['LEDGrpcreationFails']);
                    $("#errorhandlingpopup").popup("open");
                    dfd.resolve();
                }
            });

        }, function(err) {
            nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
            console.log("failure call back");
        }, "WebServicePlugin", "getAuthCode", []);

        return dfd;
    },

    changeLedValues: function(message) {
    	
        var oooh = true;

        if (message.notifyType === notificationType.LED_CHANGE_STATE) {
            var deviceID = message.ledDeviceId;
            var capabilityID = message.capabilityId;
            var availability = message.Availability;
            var devicetype = "";

            var rgx = /[^0-9]/;

            if (deviceID.search(rgx) === -1) {
                devicetype = ledDeviceConstants.GROUP;
            } else {
                devicetype = ledDeviceConstants.SINGLE;
            }

            if (jQuery.inArray(deviceID, groupdeviceslist) == -1) {
                if (capabilityID == ledCapabilities.ONOFF) {

                    if ((message.state == "0" || message.state == "1") && (availability == "YES" || availability == "NO")) {

                        if (availability == "YES") {

                            $("#" + deviceID).attr('wemo-device-state-code', message.state);
                            var newClass = device_list_bridge.getBinaryStateImage(message.state);
                            $("#" + deviceID).find('.bulbStrength').show();
                            $("#mainLIID" + deviceID).find('.sliderValue').show();
                            $("#mainLIID" + deviceID).find('.power_indicator_container').show();
                            var panel = $('#drawer-' + deviceID);
                            var capabilityids = $("#"+deviceID).attr('wemo-device-capabilities');
                     	   	var capabilityval = $("#"+deviceID).attr('wemo-device-capabilities-values');
                     	   	var capabilitiesIDVal = wemoUtil.mappingCapabilityIDwithCurrentValue(capabilityids,capabilityval,ledCapabilities.ONOFF,message.state);
                     	    $("#"+deviceID).attr('wemo-device-capabilities-values', capabilitiesIDVal);
                     	   
                            
                            if(window.sessionStorage.getItem(sessionStore.IS_UPGRADE_INPROGRESS) != "true")
                            	 $("#mainLIID" + deviceID).find('.NotDetected').text('');

                            if (newClass.indexOf('led_off') != -1) {
                                $(panel).addClass('setOpacity');
                                $(panel).find('.goSleep').attr('disabled', true).addClass('disableGoSleep');
                                device_list_bridge.buttonController.goToSleep.disable();
                            }

                            if (!isEditMode) {
                                $("#mainLIID" + deviceID).removeClass('disabled');

                                if (devicetype == ledDeviceConstants.GROUP)
                                    $("#mainLIID" + deviceID).addClass('led_group');
                                else
                                    $("#mainLIID" + deviceID).addClass('led_list');

                                $("#" + deviceID).removeClass();
                                $("#" + deviceID).addClass(newClass);
                                $("#" + deviceID).attr('wemo-device-state', newClass);

                                if (newClass.indexOf('led_on') != -1)
                                    $("#mainLIID" + deviceID).find('.sliderValue').addClass('LedBrihtnesscolorChange');
                                else
                                    $("#mainLIID" + deviceID).find('.sliderValue').removeClass('LedBrihtnesscolorChange');
                            }
                        } else if (availability == "NO") {
                            $("#" + deviceID).attr('wemo-device-state-code', '3');
                            $("#" + deviceID).find('.bulbStrength').hide();
                            $("#mainLIID" + deviceID).find('.power_indicator_container').hide();
                            $("#mainLIID" + deviceID).find('.sliderValue').hide();
                            $("#mainLIID" + deviceID).find('.NotDetected').text('Not Detected');

                            if (!isEditMode) {

                                if (devicetype == ledDeviceConstants.GROUP)
                                    $("#mainLIID" + deviceID).removeClass('led_group');
                                else
                                    $("#mainLIID" + deviceID).removeClass('led_list');

                                $("#mainLIID" + deviceID).addClass('disabled');
                            }
                        }

                    }

                } else if (capabilityID == ledCapabilities.DIMMING) {

                    if (availability == "YES" || availability == "NO") {
                        var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
                        var currentDimmingVal = message.state;
                        $("#" + deviceID).find('.bulbStrength').show();
                        $("#mainLIID" + deviceID).find('.sliderValue').show();
                        
                        var capabilityids = $("#"+deviceID).attr('wemo-device-capabilities');
                 	   	var capabilityval = $("#"+deviceID).attr('wemo-device-capabilities-values');
                 	   	var capabilitiesIDVal = wemoUtil.mappingCapabilityIDwithCurrentValue(capabilityids,capabilityval,ledCapabilities.DIMMING,message.state);
                 	    $("#"+deviceID).attr('wemo-device-capabilities-values', capabilitiesIDVal);
                 	   	
                        if(window.sessionStorage.getItem(sessionStore.IS_UPGRADE_INPROGRESS) != "true")
                       	 	$("#mainLIID" + deviceID).find('.NotDetected').text('');

                        if (currentDimmingVal.indexOf(",") != -1) {
                            var splitDimmingVal = currentDimmingVal.split(",");
                        } else if (currentDimmingVal.indexOf(":") != -1) {
                            var splitDimmingVal = currentDimmingVal.split(":");
                        } else {
                            var splitDimmingVal = currentDimmingVal.split(",");
                        }

                        CurrentDimmingVal = (splitDimmingVal[0] * 100) / (AllowedVal);
                        strengthStatus = Math.ceil(CurrentDimmingVal) + "%";
                        $("#currentVal" + deviceID).val(CurrentDimmingVal);
                        var temp = Math.round(CurrentDimmingVal);
                        $('#slider-' + deviceID).val(temp);
                        $("ul li[data-deviceid=" + deviceID + "]").find('.sliderValue').text(strengthStatus);
                        $("#dimmingDis" + deviceID).html(strengthStatus);
                        var currstate = "1";

                        $("#" + deviceID).attr('wemo-device-state-code', currstate);
                        var newClass = device_list_bridge.getBinaryStateImage(currstate);
                        if (!isEditMode) {
                            $("#mainLIID" + deviceID).removeClass('disabled');

                            if (devicetype == ledDeviceConstants.GROUP)
                                $("#mainLIID" + deviceID).addClass('led_group');
                            else
                                $("#mainLIID" + deviceID).addClass('led_list');

                            $("#" + deviceID).removeClass();
                            $("#" + deviceID).addClass(newClass);
                            $("#" + deviceID).attr('wemo-device-state', newClass);

                            $("#mainLIID" + deviceID).find('.sliderValue').addClass('LedBrihtnesscolorChange');
                        }
                    }

                } else if(capabilityID == ledCapabilities.TEMPERATURE){
                	if(message.state != 0 && message.state != ""){
                		var colorVal = message.state;
                    	var colorTempVal = colorVal.split(':');
                    	var kelvinTemperarture = wemoUtil.convertColorToTemperature(colorTempVal[0]);
                    	var rgbColor = wemoUtil.convertTemperatureToRGB(kelvinTemperarture);
                    	var modelCode = '';
                    	var capabilityids = $("#"+deviceID).attr('wemo-device-capabilities');
                  	   	var capabilityval = $("#"+deviceID).attr('wemo-device-capabilities-values');
                  	   	var capabilitiesIDVal = wemoUtil.mappingCapabilityIDwithCurrentValue(capabilityids,capabilityval,ledCapabilities.TEMPERATURE,message.state);
                  	   	$("#"+deviceID).attr('wemo-device-capabilities-values', capabilitiesIDVal);
                  	   
                    	if (devicetype == ledDeviceConstants.GROUP){
                    		modelCode = $('#mainWrapper' + deviceID).attr('wemo-device-modelcode');
                    	}
                    	else{
                    		modelCode = $('#' + deviceID).attr('wemo-device-modelcode');	
                    	}
                    	
                    	var ledDeviceType = wemoUtil.ledBulbType(modelCode);
                    		
                    	if(modelCode != undefined && wemoUtil.isTemperatureBulb(ledDeviceType)){
                    		$('#drawer-' + deviceID).find(".temperatureColorRow").attr("data-ttbColor",message.state);
                    		$('#drawer-' + deviceID).find(".temparatureColorPicker").attr("style","background:"+rgbColor);
                    	}
                    	else{
                    		$('#drawer-' + deviceID).find(".colorPickerMainDiv").attr("data-ttbColor", message.state);
                    		$('#drawer-' + deviceID).find(".colorPickerBox").attr("style","background:"+rgbColor);
                    	}
                	}
                	else if(message.state == 0){
                		$('#drawer-' + deviceID).find(".colorPickerMainDiv").attr("data-ttbColor",message.state);
                	}
                	
                } else if(capabilityID == ledCapabilities.COLOR){
                	if(message.state != 0 && message.state != ""){
                		$('#drawer-' + deviceID).find(".colorPickerMainDiv").attr("data-Color", message.state);
                    	var colorVal = message.state;
                    	var colorTempVal = colorVal.split(':');
                    	var rgbColor = wemoUtil.convertColorToRGB(colorTempVal[0], colorTempVal[1]);
                    	var capabilityids = $("#"+deviceID).attr('wemo-device-capabilities');
                  	   	var capabilityval = $("#"+deviceID).attr('wemo-device-capabilities-values');
                  	   	var capabilitiesIDVal = wemoUtil.mappingCapabilityIDwithCurrentValue(capabilityids,capabilityval,ledCapabilities.COLOR,message.state);
                  	   	$("#"+deviceID).attr('wemo-device-capabilities-values', capabilitiesIDVal);
                  	   
                    	
                    	if(rgbColor)
                    		$('#drawer-' + deviceID).find(".colorPickerBox").attr("style","background:"+rgbColor);
                	}
                	else if(message.state == 0){
                		$('#drawer-' + deviceID).find(".colorPickerMainDiv").attr("data-Color",message.state);
                	}
                	
                }
            }


        }

    },

    goToSleep: function(deviceId, time, devicetype) {

        if (time == 0) {
            time = 1;
        }
        var timeValue = time * 60 * 10;
        var currentTime = new Date().getTime();
        var CurrentVal = timeValue + ":" + (currentTime / 1000);
        var deviceID = "";
        var inputArr = "";
        
        if (devicetype == ledDeviceConstants.GROUP) {
            deviceID = [deviceId];
            inputArr = [CurrentVal, ledCapabilities.FADER, "YES"];
        } else {
            deviceID = [deviceId];
            inputArr = [CurrentVal, ledCapabilities.FADER, "NO"];
        }

        if (isRemoteEnabled == true) {

            if (devicetype == ledDeviceConstants.GROUP) {
                var spanID = deviceId;
                var deviceIDs = $("#" + spanID).attr('wemo-device-groupids');
                var capabilityIDS = $("#" + spanID).attr('wemo-device-capabilities');
                var Groupname = $("#" + spanID).attr('wemo-device-friendly-name');
                var homeID = window.sessionStorage.getItem(sessionStore.SETUP_HOME_ID);
                var MaxallowedVal = $("#" + spanID).attr('wemo-device-max-allowed-val');
                var GroupUniqueID = $("#" + spanID).attr('wemo-device-groupunique-id');

                var capabilitytype = ledDeviceConstants.CAPABILITYDRAWER;
                var xml_request = device_list_bridge.buildXMLForledGroupStateChange(spanID, deviceIDs, capabilityIDS, Groupname, homeID, CurrentVal, capabilitytype, MaxallowedVal, GroupUniqueID, "");
                device_list_bridge.ledGroupstateChangeOnCloud(xml_request, "bedTimeSleep");
            } else {
                var spanID = deviceId;
                var Macadd = $("#mainWrapper" + spanID).attr('wemo-device-mac-address');
                var ParentID = $("#mainWrapper" + spanID).attr('wemo-device-parent-plugin-id');
                var FriendlyName = $("#mainWrapper" + spanID).attr('wemo-device-friendly-name');
                var DeviceType = $("#mainWrapper" + spanID).attr('wemo-device-type');
                var MaxallowedVal = $("#mainWrapper" + spanID).attr('wemo-device-max-allowed-val');
                var homeID = window.sessionStorage.getItem(sessionStore.SETUP_HOME_ID);
                var xml_request = device_list_bridge.buildXMLForledStateChange(spanID, Macadd, CurrentVal, FriendlyName, DeviceType, ParentID, homeID, MaxallowedVal, ledDeviceConstants.CAPABILITYFADER, "");
                device_list_bridge.ledstateChangeOnCloud(xml_request, "bedTimeSleep");
            }

        } else {
            devicePlugin.execute(
                function() {
                },
                device_list_bridge.reportError,
                ACTION_SET_LED_STATUS, [inputArr, deviceID]
            );

        }
    },

    deleteGroups: function(request, referenid) {
        nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, []);
        cordova.exec(function(params) {
            var authCode = params[0];
            var homeId = params[1];

            $.ajax({
                url: cloudAPI.LED_DELETE_GROUP + homeId + "/" + referenid + "?remoteSync=true",
                type: "POST",
                data: request,
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('Content-Type', 'application/xml');
                    xhr.setRequestHeader('Authorization', authCode);
                },
                success: function(data) {
                    //nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                    wemoUtil.infoLog(TAGB, 'status success 4444: ');
                    //var responseXML = (new XMLSerializer()).serializeToString(data);
                    //wemoUtil.log(TAGB, responseXML);
                    device_list.loadDevicesFromCloud("refresh");
                    device_list_bridge.clearLedCache();
                },
                error: function(xhr, textstatus) {
                    wemoUtil.infoLog(TAGB, 'status4444: ' + xhr.status);
                    wemoUtil.infoLog(TAGB, 'status text444: ' + xhr.statusText);
                    alert(wemo.items['deletionFalied']);
                    nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                }
            });
        }, function(err) {
            console.log("failure call back");
            nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
        }, "WebServicePlugin", "getAuthCode", []);

    },

    hideDevice: function(udn) {
        $("#hide_device").popup("open");
        $('#hide_device_hide').attr('wemo-device-udn', udn);

        $('#hide_device_cnl').off('tap');
        $('#hide_device_hide').off('tap');

        $("#hide_device_cnl").on("tap", function(e) {
            $("#hide_device").popup('close');
            e.preventDefault();
            e.stopPropagation();
        });

        $("#hide_device_hide").on("tap", function(e) {
            var udn = $(this).attr('wemo-device-udn');
            $("#hide_device").popup('close');
            if (udn.indexOf("uuid") == -1) {
            	$('.device_li[wemo-device-udn="' + udn + '"]').remove();
            	if(isRemoteEnabled){
            		cloudServices.hideDevice(udn);
            	}
            	else{
            		device_list_bridge.deleteLedFromCache(udn);
            	}
            }

            e.preventDefault();
            e.stopPropagation();
        });

    },
    drawerSlider: function(deviceId, sliderValue, miniDrawer) {
        var darwer = deviceId;
        var sliderValue = sliderValue.split('%');
        var timer;
        var change = 0;

        $('ul li[data-deviceId=' + deviceId + ']').find('.iconType').removeClass('drawer_icon_arrow_down').addClass('drawer_icon_arrow_up');

        var $slider = $('<input type="range" name="slider-' + deviceId + '" id="slider-' + deviceId + '" data-highlight="true" class="sliderDrawer" value="' + $.trim(sliderValue[0]) + '" min="1" max="100" />');
        var panel = $('#drawer-' + darwer);

        if (miniDrawer == 'yes') {

            panel.find('.firstRow').hide();
            panel.find('.goSleep').hide();
            panel.find('.sleepFader').hide();
            panel.find('.groupFadder').hide();
            panel.find('.firstRow').hide();
            panel.find('.colorPickerMainDiv').hide();
            panel.find('.temperatureColorRow').hide();
            clearInterval(timer);
            timer = setInterval(function() {
                if (!panel.hasClass('drawerView')) {

                    clearInterval(timer);

                    if (!panel.find('.firstRow').is(':visible')) {

                        if ($('#drawer-' + darwer + ' .sliderRow .ui-focus').length == 0) {

                            $('ul li[data-deviceId=' + deviceId + ']').find('.iconType').removeClass('drawer_icon_arrow_up').addClass('drawer_icon_arrow_down');
                            panel.removeClass().addClass('drawerView');
                        }

                    }


                }
            }, 5000);

        } else {

            clearInterval(timer);
            panel.find('.firstRow').show();
            panel.find('.goSleep').show();
            panel.find('.sleepFader').show();
            panel.find('.groupFadder').show();
            var modelcode = "";
            
            if(isRemoteEnabled){
            	
            	if($("#" + darwer).attr('wemo-device-modelcode') && $("#" + darwer).attr('wemo-device-modelcode').indexOf(",")){
            		var modelcodeArr = $("#" + darwer).attr('wemo-device-modelcode').split(",");
            		modelcode = modelcodeArr[0].toUpperCase();
            	}else if($("#" + darwer).attr('wemo-device-modelcode').toUpperCase()){
            		modelcode = $("#" + darwer).attr('wemo-device-modelcode').toUpperCase();
            	}
            		
            }else{
            	if($("#" + darwer).attr('wemo-device-modelcode'))
                	modelcode = $("#" + darwer).attr('wemo-device-modelcode').toUpperCase();
            }
            
            var ledDeviceType = wemoUtil.ledBulbType(modelcode);
            
        	if(wemoUtil.isColoredandTemperaturedBulb(ledDeviceType) || wemoUtil.isColoredBulb(ledDeviceType))
            	$('#drawer-' + darwer).find('.colorPickerMainDiv').show();
            else
            	$('#drawer-' + darwer).find('.colorPickerMainDiv').hide();
            
            if(wemoUtil.isTemperatureBulb(ledDeviceType))
            	$('#drawer-' + darwer).find(".temperatureColorRow").show();
            else
            	$('#drawer-' + darwer).find(".temperatureColorRow").hide();
    
        }
        panel.find('.sliderRow').empty().append($slider).trigger('create');

        $('slider-' + deviceId).slider({
            create: function(event, ui) {
                console.log('create!!');

            }
        });

        $('#slider-' + deviceId).on('slidestop', function(event) {

            var currentVal = $('#slider-' + deviceId).val();
            var spanID = deviceId;
            var deviceType = $("ul li[data-deviceId=" + deviceId + "]").attr('name');
            var deviceIDs = 0;
            change = 0;

            if (deviceType == 'switch_li') {
                deviceType = 'single';
            } else {
                deviceType = 'group';
                deviceIDs = $("#mainWrapper" + spanID).attr('wemo-device-groupids');
            }


            if (miniDrawer == 'yes') {
                clearInterval(timer);
                device_list_bridge.sliderValueUpdate(spanID, currentVal, deviceType, deviceIDs);
                timer = setInterval(function() {
                    if (!$('#drawer-' + darwer).hasClass('drawerView')) {
                        $('ul li[data-deviceId=' + deviceId + ']').find('.iconType').removeClass('drawer_icon_arrow_up').addClass('drawer_icon_arrow_down');
                        $('#drawer-' + darwer).removeClass().addClass('drawerView');
                        clearInterval(timer);
                    }
                }, 5000);
            } else {
                clearInterval(timer);
                device_list_bridge.sliderValueUpdate(spanID, currentVal, deviceType, deviceIDs);
            }

        });


        $('#slider-' + deviceId).slider("refresh");

        if (sliderValue.indexOf('100') != -1) {
            panel.find('.sliderRow').addClass('removeBorder');
        } else {
            panel.find('.sliderRow').removeClass('removeBorder');
        }

        $('#slider-' + deviceId).change(function() {

            clearInterval(timer);
            change = 1;
            var slider_value = $('#slider-' + deviceId).val();

            if (slider_value.toString() == "100") {
                panel.find('.sliderRow').addClass('removeBorder');
                $("ul li[data-deviceid=" + deviceId + "]").find('.ui-slider-track').addClass('ui-slider-border');
            } else {
                panel.find('.sliderRow').removeClass('removeBorder');
                $("ul li[data-deviceid=" + deviceId + "]").find('.ui-slider-track').removeClass('ui-slider-border');
            }

            $("ul li[data-deviceid=" + deviceId + "]").find('.sliderValue').text(slider_value + "%");

        });

    },
    sliderValueUpdate: function(spanID, currentVal, deviceType, deviceIDs) {

        var spanID = spanID; //Device Id
        var currentVal = currentVal; //Current slider value
        var deviceType = deviceType; //Device Type
        var switchPrevState = $("#" + spanID).attr('wemo-device-state-code');

        if (isEditMode == false) {

            if (isRemoteEnabled) {

                var Macadd = $("#mainWrapper" + spanID).attr('wemo-device-mac-address');
                var ParentID = $("#mainWrapper" + spanID).attr('wemo-device-parent-plugin-id');
                var FriendlyName = $("#mainWrapper" + spanID).attr('wemo-device-friendly-name');
                var DeviceType = $("#mainWrapper" + spanID).attr('wemo-device-type');
                var MaxallowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
                var homeID = window.sessionStorage.getItem(sessionStore.SETUP_HOME_ID);

                $("#mainWrapper" + spanID).hide();
                $("#" + spanID).show();
                var presentClass = $("#" + spanID).attr('class');

                if ($.trim(presentClass) == "led_on") {
                    $("#" + spanID).removeClass(presentClass);
                    // $("#" + spanID).addClass("loading_animation ledanimatedHelperOn");
                    $("#" + spanID).addClass("switch_activated");
                } else {
                    $("#" + spanID).removeClass(presentClass);
                    //$("#" + spanID).addClass("loading_animation ledanimatedHelperOff");
                    $("#" + spanID).addClass("switch_activated");
                }

                if (deviceType == ledDeviceConstants.SINGLE) {
                    var capabilitytype = ledDeviceConstants.CAPABILITYDIMMING;
                    var xml_request = device_list_bridge.buildXMLForledStateChange(spanID, Macadd, currentVal, FriendlyName, DeviceType, ParentID, homeID, MaxallowedVal, capabilitytype, switchPrevState);
                    device_list_bridge.ledstateChangeOnCloud(xml_request, "statusdimmingvalchange");
    
                } else {
                    console.log('group');
                    var GroupID = spanID;
                    var deviceIDs = $("#" + spanID).attr('wemo-device-groupids');
                    var capabilityIDS = $("#" + spanID).attr('wemo-device-capabilities');
                    var Groupname = $("#" + spanID).attr('wemo-device-friendly-name');
                    var homeID = window.sessionStorage.getItem(sessionStore.SETUP_HOME_ID);
                    var MaxallowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
                    var GroupUniqueID = $("#" + spanID).attr('wemo-device-groupunique-id');
                    var capabilitytype = ledDeviceConstants.CAPABILITYDIMMING;

                    var xml_request = device_list_bridge.buildXMLForledGroupStateChange(GroupID, deviceIDs, capabilityIDS, Groupname, homeID, currentVal, capabilitytype, MaxallowedVal, GroupUniqueID, switchPrevState);
                    device_list_bridge.ledGroupstateChangeOnCloud(xml_request, "statusdimmingvalchange");
                    
                }
            } else {

                var spanID = spanID;
                var currentVal = currentVal;
                var deviceIDs = deviceIDs;
                if (deviceType == ledDeviceConstants.SINGLE) {
                    device_list_bridge.dimmingValChange(currentVal, spanID, "", deviceType, switchPrevState);
                } else {
                    console.log('group');
                    device_list_bridge.dimmingValChange(currentVal, deviceIDs, spanID, ledDeviceConstants.GROUP, switchPrevState);
                }

            }

        }


    },

    deleteDeviceRules: function(arr) {

        db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
        db.transaction(deleteRulefromRD, errorCB, successCB);

        function deleteRulefromRD(tx) {

            for (var i = 0; i < arr.length; i++) {
                tx.executeSql("DELETE from RULEDEVICES where RuleID IN (select a.RuleID from RULES a INNER JOIN RULEDEVICES b ON a.RuleID = b.RuleID and b.DeviceID Like '%" + arr[i] + "')", [], executeSqlDeleteQuerySuccess, errorCB);
            }

            db.transaction(function(tx) {
                deleteRules(tx)
            }, errorCB);

        }

        function executeSqlDeleteQuerySuccess(tx, results) {
            console.log("entering in success");
        }

        function deleteRules(tx) {
            tx.executeSql('DELETE FROM RULES WHERE RuleID NOT IN (SELECT RuleID FROM RULEDEVICES GROUP BY RuleID);', [], executeSqlDeleteQuerySuccess, errorCB);
        }

        function successCB() {
            console.log("Success creating rules DB table structure ");

        }

        function errorCB() {
            console.log("error creating rules DB table structure ");
        }

    },

    initializeDrag: function() {
    	
        if (isEditMode) {
        	
            $(".editListLeds").draggable({
            	scroll: true,
                opacity: 0.8,
                axis: 'y',
                delay: 300,
                cursor: 'move',
                containment: 'parent',
                handle: '.edit_device_arrow_icon',

                revert: function(dropped) {
                    $(this).removeClass('dragBorder');
                    $(this).find('.devicesCount').hide();
                    var dropped = dropped && dropped[0].class == "editListLeds";
                    zindexvalue = 2;
                    $(devicelistbridge).css("z-index", zindexvalue);
                    if (!dropped) //alert("I'm reverting!");
                        return !dropped;
                },
                
                drag: function(event, ui) {
                    var item = $(this).find('span[name="name_led_device_state"]');

                    var drapOffTopArray = [];
                    var devicesCountArray = [];

                    zindexvalue = parseInt(zindexvalue) + 2;
                    $(this).css("z-index", zindexvalue);
                    $(devicelistbridge).css("z-index", zindexvalue);
                    var currID = item.attr('id');
                    dragid = currID;
                    $(this).addClass('dragBorder');
                    
                    var dragOffsetTop = $(this).offset().top;
                    var dragId = $(this).attr('id');
                    
                    var modelcode = $("#"+currID).attr('wemo-device-modelcode');
                    var ledDragDeviceType = wemoUtil.ledBulbType(modelcode);
                    
                    $(".editListLeds").each(function() {
                		if (!$(this).hasClass('dragBorder')) {
                			var item = $(this).find('span[name="name_led_device_state"]');
                    		var dropID = item.attr('id');
                        	var dropmodelcode = $("#"+dropID).attr('wemo-device-modelcode');
                        	var ledDropDeviceType = wemoUtil.ledBulbType(dropmodelcode);
                        	
                			if($.trim(ledDropDeviceType) == $.trim(ledDragDeviceType)){
                				 var drapOffTop = $(this).offset().top;
                			     drapOffTopArray[drapOffTop - 5] = 1;
                                 drapOffTopArray[drapOffTop - 4] = 1;
                                 drapOffTopArray[drapOffTop - 3] = 1;
                                 drapOffTopArray[drapOffTop - 2] = 1;
                                 drapOffTopArray[drapOffTop - 1] = 1;

                                 drapOffTopArray[drapOffTop] = 1;

                                 drapOffTopArray[drapOffTop + 1] = 1;
                                 drapOffTopArray[drapOffTop + 2] = 1;
                                 
                			}
                           
                       }

                    });

                    $(".editListGroupLeds").each(function() {
                        if (!$(this).hasClass('dragBorder')) {
                            var drapOffTop = $(this).offset().top;
                            var devicesCount = $(this).find('.devicesCount').html();
                            var item = $(this).find('span[name="name_group_state"]');
                            var dropID = item.attr('id');
                        	var dropmodelcode = $("#"+dropID).attr('wemo-device-modelcode');
                        	
                        	if(isRemoteEnabled){
                        		var modelcodeArr = $("#"+dropID).attr('wemo-device-modelcode').split(",");
                        		dropmodelcode = modelcodeArr[0];
                        	}
                        	
                        	var ledDropDeviceType = wemoUtil.ledBulbType(dropmodelcode);
                          
                        	if($.trim(ledDropDeviceType) == $.trim(ledDragDeviceType)){
                        		 drapOffTopArray[drapOffTop - 5] = 2;
                                 devicesCountArray[drapOffTop - 5] = devicesCount;
                                 drapOffTopArray[drapOffTop - 4] = 2;
                                 devicesCountArray[drapOffTop - 4] = devicesCount;
                                 drapOffTopArray[drapOffTop - 3] = 2;
                                 devicesCountArray[drapOffTop - 3] = devicesCount;
                                 drapOffTopArray[drapOffTop - 2] = 2;
                                 devicesCountArray[drapOffTop - 2] = devicesCount;
                                 drapOffTopArray[drapOffTop - 1] = 2;
                                 devicesCountArray[drapOffTop - 1] = devicesCount;

                                 drapOffTopArray[drapOffTop] = 2;
                                 devicesCountArray[drapOffTop] = devicesCount;

                                 drapOffTopArray[drapOffTop + 1] = 2;
                                 devicesCountArray[drapOffTop + 1] = devicesCount;
                                 drapOffTopArray[drapOffTop + 2] = 2;
                                 devicesCountArray[drapOffTop + 2] = devicesCount;
                        	}
                           
                        }

                    });

                    if ($(this).hasClass('dragBorder')) {
                        if (drapOffTopArray[dragOffsetTop] == 2 || drapOffTopArray[dragOffsetTop] == 1) {

                            if (drapOffTopArray[dragOffsetTop] == 2) {
                                var devicesCount = devicesCountArray[dragOffsetTop];
                                devicesCount = parseInt(devicesCount) + 1;
                                $(this).find('.devicesCount').show().empty().append(devicesCount);
                            } else {
                            	
                                $(this).find('.devicesCount').show().empty().append('2');
                            }

                        } else {
                        	//$(this).find('.devicesCount').show().empty().append('+');
                        }
                    }

                }
            });
            
            $(".editListLeds").droppable({
                out: function(event, ui) {
                    ui.draggable.mouseup(function() {
                        var top = ui.draggable.data('orgTop');
                        var left = ui.draggable.data('orgLeft');
                        ui.position = {
                            top: top,
                            left: left
                        };
                    });
                },
                over: function(event, ui) {
                	var item = $(this).find('span[name="name_led_device_state"]');
            		var dropID = item.attr('id');
            		var dropmodelcode = $("#"+dropID).attr('wemo-device-modelcode');
            		var dragmodelcode = $("#"+dragid).attr('wemo-device-modelcode');
                	
            		if(isRemoteEnabled){
                		var modeldropcodeArr = $("#"+dropID).attr('wemo-device-modelcode').split(",");
                		dropmodelcode = modeldropcodeArr[0];
                		var modeldragcodeArr = $("#"+dragid).attr('wemo-device-modelcode').split(",");
                		dragmodelcode = modeldragcodeArr[0];
                	}
            		
            		var ledDropDeviceType = wemoUtil.ledBulbType(dropmodelcode);
            		var ledDragDeviceType = wemoUtil.ledBulbType(dragmodelcode);
                    
            		if($.trim(ledDropDeviceType) == $.trim(ledDragDeviceType)){
            			$("#mainLIID"+dragid).find('.devicesCount').show().empty().append('+');
            		}
            		else
            			$("#mainLIID"+dragid).find('.devicesCount').hide().empty();
                },
                drop: function(event, ui) {
                    var item = $(this).find('span[name="name_led_device_state"]');
                    var currID = item.attr('id');
                    var state1 = item.attr('wemo-device-state-code');
                    //var dimming_val1 = $('#slider-'+currID).val();

                    var dimming_val1 = $("ul li[data-deviceid=" + currID + "]").find('.sliderValue').text();
                    dimming_val1 = dimming_val1.replace("%", "");
                    var capabilityIDs1 = item.attr('wemo-device-capabilities');
                    $(this).addClass("ui-state-highlight");
                    var modelcodedrop = "";
                    var capabilityIDsVal1 = item.attr('wemo-device-capabilities-values');
                    
                    if (!isRemoteEnabled){
                    capabilityIDs1 = wemoUtil.rearrangeCapabilityIDsValues(capabilityIDs1);
                    capabilityIDsVal1 = wemoUtil.rearrangeCapabilityIDsValues(capabilityIDsVal1);
                    
                    }
                    
                    if(item.attr('wemo-device-modelcode').toLowerCase() != (ledModelcode.OSRAM).toLowerCase() && item.attr('wemo-device-modelcode').toLowerCase() != (ledModelcode.LED).toLowerCase())
                    	modelcodedrop = item.attr('wemo-device-modelcode').toLowerCase();
            
                    var state2 = $("#" + dragid).attr('wemo-device-state-code');
                    //var dimming_val2 = $('#slider-'+dragid).val();
                    var dimming_val2 = $("ul li[data-deviceid=" + dragid + "]").find('.sliderValue').text();
                    dimming_val2 = dimming_val2.replace("%", "");
                    var capabilityIDs2 = $("#" + dragid).attr('wemo-device-capabilities');
                    var modelcodedrag = "";
                    
                    if($("#" + dragid).attr('wemo-device-modelcode').toLowerCase() != (ledModelcode.OSRAM).toLowerCase() && $("#" + dragid).attr('wemo-device-modelcode').toLowerCase() != (ledModelcode.LED).toLowerCase())
                    	modelcodedrag = $("#" + dragid).attr('wemo-device-modelcode').toLowerCase();
   
                    var strarr1 = capabilityIDs1.split(",");
                    var strarr2 = capabilityIDs2.split(",");

                    var difference1 = [];
                    var difference2 = [];
                    var difference3 = [];

                    if (strarr2.length > strarr1.length) {
                        jQuery.grep(strarr2, function(el) {
                            if (jQuery.inArray(el, strarr1) == -1) difference1.push(el);
                        });
                    } else if (strarr1.length > strarr2.length) {
                        jQuery.grep(strarr1, function(el) {
                            if (jQuery.inArray(el, strarr2) == -1) difference2.push(el);
                        });
                    } else {
                        jQuery.grep(strarr2, function(el) {
                            if (jQuery.inArray(el, strarr1) == -1) difference3.push(el);
                        });
                    }
                 
                    if (difference1 == "" && difference2 == "" && difference3 == "" && modelcodedrop == modelcodedrag) {

                        var dimmingvalue = "100";
                        var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;

                        var currentval = (dimming_val1 * AllowedVal) / 100;
                        currentval = Math.floor(currentval);
                        var inputVal3 = currentval + ":0," + state1;
                        var inputArr1 = [currID, dragid];
                        var arrRev = capabilityIDs1.split(",");
                        arrRev = arrRev.reverse();
                        //capabilityIDs1 = arrRev.join(",");
                        var inputArr2 = [capabilityIDs1];
                        var inputArr3 = [capabilityIDsVal1];
                        var groupname = ["Lighting Group"];
                        var deviceImg = defaultIcon.LED_THUMB_URI;

                        if (isRemoteEnabled) {
                            var xmlString = "";
                            var cdataStart = '<![CDATA[<CreateGroup>';
                            var cdataEnd = '</CreateGroup>]]>';
                            var refrenceID = Math.round(+new Date() / 1000);
                            var groupname = "Lighting Group";
                            var groupID = Math.floor(Math.random() * 1E16);
                            var devicedragPluginList = $("#" + dragid).attr('wemo-device-plugin-id');
                            var devicedropPluginList = $("#" + currID).attr('wemo-device-plugin-id');
                            inputArr3 = [inputVal3];
                            var devicedragMacList = $("#" + dragid).attr('wemo-device-mac-address');
                            var devicedropMacList = $("#" + currID).attr('wemo-device-mac-address');

                            var devicedragFriendlyname = $("#" + dragid).attr('wemo-device-friendly-name');
                            var devicedropFriendlyname = $("#" + currID).attr('wemo-device-friendly-name');

                            var devicedragManufacturer = $("#" + dragid).attr('wemo-device-manufacture');
                            var devicedropManufacturer = $("#" + currID).attr('wemo-device-manufacture');

                            var devicedragModelCode = $("#" + dragid).attr('wemo-device-modelcode');
                            var devicedropModelCode = $("#" + currID).attr('wemo-device-modelcode');

                            if (devicedragManufacturer != "" && devicedragModelCode != "") {
                                if (($.trim(devicedragManufacturer) == $.trim(devicedropManufacturer)) && ($.trim(devicedragModelCode) == $.trim(devicedropModelCode))) {
                                	var deviceImg = wemoUtil.replaceSpaceinModelCodeandManufacturer(devicedragManufacturer, devicedragModelCode);
                                }
                            }
                            else if(devicedragModelCode != ""){
                            	if ($.trim(devicedragModelCode) == $.trim(devicedropModelCode)) {
                                	var deviceImg = wemoUtil.replaceSpaceinModelCode(devicedragModelCode);
                                }
                            }

                            var devicedropFaderVal = $("#" + currID).attr('wemo-device-fader-value');
                            var deviceList = devicedropPluginList + "," + devicedragPluginList;
                            var deviceMacList = devicedropMacList + "," + devicedragMacList;
                            var deviceFriendlyname = devicedropFriendlyname + "," + devicedragFriendlyname;

                            var splitCapabilityArr = capabilityIDs1.split(",");
                            var splitDeviceList = deviceList.split(",");
                            var devicedropTempVal = $("#" + currID).attr('wemo-device-temperature-value');
                            var devicedropColorVal = $("#" + currID).attr('wemo-device-color-value');
                            
                            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO, "newgroup");
                            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS, deviceList);
                            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES, capabilityIDs1);
                            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CURRENTVAL, inputArr3);
                            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME, groupname);
                            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL, deviceImg);
                            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_MAC_IDS, deviceMacList);
                            window.sessionStorage.setItem(sessionStore.DEVICE_WEMO_DEVICE_FRIENDLY_NAME, deviceFriendlyname);
                            window.sessionStorage.setItem(sessionStore.DEVICE_WEMO_DEVICE_FADER_VAL, devicedropFaderVal);
                            window.sessionStorage.setItem(sessionStore.DEVICE_WEMO_DEVICE_TEMPERATURE_VAL, devicedropTempVal);
                            window.sessionStorage.setItem(sessionStore.DEVICE_WEMO_DEVICE_COLOR_VAL, devicedropColorVal);
                            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_STATE, state1);

                            wemoUtil.loadUrl(filePath.LED_DEVICE_LIST_EDIT);

                        } else {
                            var devicedragFriendlyname = $("#" + dragid).attr('wemo-device-friendly-name');
                            var devicedropFriendlyname = $("#" + currID).attr('wemo-device-friendly-name');
                            var deviceFriendlyname = devicedropFriendlyname + "," + devicedragFriendlyname;

                            var devicedragManufacturer = $("#" + dragid).attr('wemo-device-manufacture');
                            var devicedropManufacturer = $("#" + currID).attr('wemo-device-manufacture');

                            var devicedragModelCode = $("#" + dragid).attr('wemo-device-modelcode');
                            var devicedropModelCode = $("#" + currID).attr('wemo-device-modelcode');

                            if (devicedragManufacturer != "" && devicedragModelCode != "") {
                                if (($.trim(devicedragManufacturer) == $.trim(devicedropManufacturer)) && ($.trim(devicedragModelCode) == $.trim(devicedropModelCode))) {
                                	var deviceImg = wemoUtil.replaceSpaceinModelCodeandManufacturer(devicedragManufacturer, devicedragModelCode);
                                }
                            }
                            else if(devicedragModelCode != ""){
                            	if ($.trim(devicedragModelCode) == $.trim(devicedropModelCode)) {
                                	var deviceImg = wemoUtil.replaceSpaceinModelCode(devicedragModelCode);
                                }
                            }
                      
                            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO, "newgroup");
                            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS, inputArr1);
                            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES, inputArr2);
                            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CURRENTVAL, inputArr3);
                            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME, groupname);
                            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL, deviceImg);
                            window.sessionStorage.setItem(sessionStore.DEVICE_WEMO_DEVICE_FRIENDLY_NAME, deviceFriendlyname);
                            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_STATE, state1);
                            wemoUtil.loadUrl(filePath.LED_DEVICE_LIST_EDIT);
                        }

                    }

                }

            });

            $(".editListGroupLeds").droppable({
            
            	out: function(event, ui) {
                    ui.draggable.mouseup(function() {
                        var top = ui.draggable.data('orgTop');
                        var left = ui.draggable.data('orgLeft');
                        ui.position = {
                            top: top,
                            left: left
                        };
                    });
                },
                over: function(event, ui) {
                	var item = $(this).find('span[name="name_group_state"]');
            		var dropID = item.attr('id');
            		var dropmodelcode = $("#"+dropID).attr('wemo-device-modelcode');
            		var dragmodelcode = $("#"+dragid).attr('wemo-device-modelcode');
                	
            		if(isRemoteEnabled){
                		var modeldropcodeArr = $("#"+dropID).attr('wemo-device-modelcode').split(",");
                		dropmodelcode = modeldropcodeArr[0];
                		var modeldragcodeArr = $("#"+dragid).attr('wemo-device-modelcode').split(",");
                		dragmodelcode = modeldragcodeArr[0];
                	}
            		
            		var ledDropDeviceType = wemoUtil.ledBulbType(dropmodelcode);
            		var ledDragDeviceType = wemoUtil.ledBulbType(dragmodelcode);
            		
             		if($.trim(ledDropDeviceType) == $.trim(ledDragDeviceType)){
            			$("#mainLIID"+dragid).find('.devicesCount').show().empty().append('+');
            		}
            		else
            			$("#mainLIID"+dragid).find('.devicesCount').hide().empty();
                },
                drop: function(event, ui) {

                    var item = $(this).find('span[name="name_group_state"]');
                    var currID = item.attr('id');
                    var state1 = item.attr('wemo-device-state-code');
                    //var dimming_val1 = $('#slider-'+currID).val();
                    var dimming_val1 = $("ul li[data-deviceid=" + currID + "]").find('.sliderValue').text();
                    dimming_val1 = dimming_val1.replace("%", "");

                    var capabilityIDs1 = item.attr('wemo-device-capabilities');
                    var capabilityIDsVal1 = item.attr('wemo-device-capabilities-values');
                    $(this).addClass("ui-state-highlight");
                    var modelcodedrop = "";
                    capabilityIDs1 = wemoUtil.rearrangeCapabilityIDsValues(capabilityIDs1);
                    
                    if (!isRemoteEnabled)
                        capabilityIDsVal1 = wemoUtil.rearrangeCapabilityIDsValues(capabilityIDsVal1);
                    
                    modelcodedrop = item.attr('wemo-device-modelcode').toLowerCase();

                    if(modelcodedrop.indexOf(",") != -1){
                    	var modelcodedropArr = modelcodedrop.split(",");
                    	modelcodedrop = modelcodedropArr[0];
                    }
            
                    var groupdeviceids = item.attr('wemo-device-groupids');
                    var state2 = $("#" + dragid).attr('wemo-device-state-code');
                    //var dimming_val2 = $('#slider-'+dragid).val();
                    var dimming_val2 = $("ul li[data-deviceid=" + dragid + "]").find('.sliderValue').text();
                    dimming_val2 = dimming_val2.replace("%", "");

                    var capabilityIDs2 = $("#" + dragid).attr('wemo-device-capabilities');
                    var modelcodedrag = "";
                    
                    modelcodedrag = $("#" + dragid).attr('wemo-device-modelcode').toLowerCase();
   
                    var strarr1 = capabilityIDs1.split(",");
                    var strarr2 = capabilityIDs2.split(",");

                    var difference1 = [];
                    var difference2 = [];
                    var difference3 = [];

                    if (strarr2.length > strarr1.length) {
                        jQuery.grep(strarr2, function(el) {
                            if (jQuery.inArray(el, strarr1) == -1) difference1.push(el);
                        });
                    } else if (strarr1.length > strarr2.length) {
                        jQuery.grep(strarr1, function(el) {
                            if (jQuery.inArray(el, strarr2) == -1) difference2.push(el);
                        });
                    } else {
                        jQuery.grep(strarr2, function(el) {
                            if (jQuery.inArray(el, strarr1) == -1) difference3.push(el);
                        });
                    }

                    if (difference1 == "" && difference2 == "" && difference3 == "" && wemoUtil.ledBulbType(modelcodedrop) == wemoUtil.ledBulbType(modelcodedrag)) {
                        //var dimmingvalue = dimming_val1.replace(/%$/, '');
                        var dimmingvalue = dimming_val1;
                        var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
                        var currentval = (dimmingvalue * AllowedVal) / 100;
                        currentval = Math.floor(currentval);
                        var inputVal3 = currentval + ":0," + state1;
                        var inputArr1 = [groupdeviceids, dragid];
                    
                        var inputArr2 = [capabilityIDs1];
                        var inputArr3 = [capabilityIDsVal1];
                        var groupname = item.attr('wemo-device-friendly-name');
                        $("#mainLIID" + dragid).hide();
                       
                        if (isRemoteEnabled) {
                            nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
                            var xmlString = "";
                            var refrenceID = currID;
                            var groupname = item.attr('wemo-device-friendly-name');
                            var groupID = currID;
                            var groupUniqueID = item.attr('wemo-device-groupunique-id');
                            var iconversion = "";
                            var faderval = item.attr('wemo-device-fader-value');
                            var temperatureval = item.attr('wemo-device-temperature-value');
                            var colorval = item.attr('wemo-device-color-value');
                            var devicedropMacList = item.attr('wemo-group-mac-ids');
                            var capabilityIDsVal1 = item.attr('wemo-group-capability-value');
                            devicedropMacList = devicedropMacList+","+$("#" + dragid).attr('wemo-device-mac-address');
                            var devicedragPluginList = $("#" + dragid).attr('wemo-device-plugin-id');
                            
                            capabilityIDsVal1 = wemoUtil.rearrangeCapabilityIDsValues(capabilityIDsVal1);
                            
                            var deviceList = groupdeviceids + "," + devicedragPluginList;
                            var splitCapabilityArr = capabilityIDs1.split(",");
                            var splitDeviceList = deviceList.split(",");

                            
                            if (faderval == "" || faderval == undefined || faderval == null || faderval == "undefined")
                                faderval = 0;
                            if(temperatureval == "" || temperatureval == undefined || temperatureval == "0" || temperatureval == "undefined")
                            	temperatureval = sessionStore.DEFAULT_REMOTE_TEMPVALUE;
                            if(colorval == "" || colorval == undefined || colorval == "0" || colorval == "undefined")
                            	colorval = sessionStore.DEFAULT_REMOTE_COLORVALUE;

                            xmlString = wemoUtil.updateGroupXML(groupUniqueID, refrenceID, groupname, iconversion,devicedropMacList,capabilityIDs1,capabilityIDsVal1,splitDeviceList,splitCapabilityArr,state1,currentval,faderval,temperatureval,colorval);

                            device_list_bridge.deleteDeviceRules(splitDeviceList);
                            //nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);

                            var grpcnt = $("#mainLIID" + currID).find('.devicesCount').text();
                            grpcnt = parseInt(grpcnt) + 1;
                            $("#mainLIID" + currID).find('.devicesCount').empty().append(grpcnt);
                            $("#mainLIID" + currID).find('.devicesCount').attr('device-grpcnt', grpcnt);

                            device_list_bridge.createGroups(xmlString, "updategroup").done(function() {
                            	 device_list.loadDevicesFromCloud("remote").done(function(){
                            		 nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                            		 device_list_bridge.uploadDBOnCloud();
                            	 });
                            });
             
                        } else {
                            nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
                            var groupName = [groupname];
                            var groupidArr = [currID];

                            devicePlugin.execute(
                                function(response) {

                                    if (response == null || response == undefined || response == "") {
                                        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                        $('#errorhandlingpopup_title').html(wemo.items['LedWalkthroughSlideTitle']);
            	                        $('#errorhandlingpopup_desc').html(wemo.items['LEDGrpcreationFails']);
            	                        $("#errorhandlingpopup").popup("open");
                                    } else {
                                        device_list_bridge.deleteDeviceRules(inputArr1);
                                        var status = response[0].GetCreateGroupResponse;
                                        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);

                                        if (status == 1 || status == 2 || status == 3 || status != "") {
                                            //nativeUtilPlugin.execute(null,null,actions.SHOW_PROGRESS,[]);

                                            counterCall = 0;
                                            device_list_bridge.deleteLedFromCache(dragid);
                                            deviceAddedinGrp = true;

                                            var grpcnt = $("#mainLIID" + currID).find('.devicesCount').text();
                                            grpcnt = parseInt(grpcnt) + 1;
                                            $("#mainLIID" + currID).find('.devicesCount').empty().append(grpcnt);
                                            $("#mainLIID" + currID).find('.devicesCount').attr('device-grpcnt', grpcnt);
                                            var newgroupdeviceIDs = groupdeviceids + "," + dragid;
                                            item.attr('wemo-device-groupids', newgroupdeviceIDs);

                                        }
                                    }

                                },
                                device_list_bridge.reportError,
                                ACTION_CREATE_GROUP, [inputArr1, inputArr2, inputArr3, groupName, groupidArr]
                            );

                        }

                    } 
                    
                }

            });


        }

    },

    ledDeviceRendering: function(leddevices, inp) {
    	wemoUtil.infoLog(device_list_bridge.TAGB, "Response ::"+JSON.stringify(leddevices));
        
        deviceStatusCounter = 0;
        var listItem = "";
        var grouplistItem = "";
        var udnvalue = "";
        var deviceIdsList = [];
        //var deviceinfo = {};
        var groupinfo = {};
        var arrdeviceLeds = [];
        var arrgroupLeds = [];
        groupdeviceslist = [];
        device_list_bridge.homeSenseModelcodeArrConvertion(homeSenseModelCodes);
        device_list_bridge.homeSenseManufacturerArrConvertion(ledManufacturerName);
        device_list_bridge.LedModelcodeArrConvertion(ledModelcode);
        window.sessionStorage.setItem(sessionStore.PAIRED_DEVICES, "alreadypaired");

        var len = leddevices.length;
        $(devicelistbridge).empty();

        var ledWalkthroughProcedure = {
            currentLaunchCount: null,
            t1LaunchCount: null,
            mode: null,
            execute: function() {
                var sharedPreferencesListener = function(data) {
                    if (!data || data == undefined || data == null) {
                        sharedPreferences.set(sharedPreferencesConstants.WEMO_NAMESPACE, ledWalkthroughProcedure.mode, true);
                        status_LedWalkthrough[ledWalkthroughProcedure.mode] = true;
                        if (ledWalkthroughProcedure.mode == sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_MULTIPLE) {
                            ledWalkthrough.setMode(true);
                            ledWalkthrough.initialize();
                            sharedPreferences.get(sharedPreferencesConstants.WEMO_NAMESPACE,
                                sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_LAUNCHEDCOUNT, '',
                                function(data) {
                                    if (data == undefined || data == null) {
                                        sharedPreferences.set(sharedPreferencesConstants.WEMO_NAMESPACE,
                                            sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_T1LAUNCHCOUNT, data);
                                        ledWalkthroughProcedure.t1LaunchCount = Number(data);
                                    }
                                });
                        } else if (ledWalkthroughProcedure.mode == sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_SINGLE) {
                            ledWalkthrough.setMode(false);
                            ledWalkthrough.initialize();
                        } else if (ledWalkthroughProcedure.mode == sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_MULTIPLE_T2) {
                            ledWalkthrough.setMode(false);
                            ledWalkthrough.initialize();
                        }
                    }
                }
                if (!status_LedWalkthrough[ledWalkthroughProcedure.mode]) {
                    sharedPreferences.get(sharedPreferencesConstants.WEMO_NAMESPACE, ledWalkthroughProcedure.mode, '', sharedPreferencesListener);
                }
            },
            checkOccurrence: function() {
                var popupDetector = new PopupDetector();
                if (popupDetector.isDetectedOpenedPopup()) {
                    var recallAfter1sDelay = setTimeout(function() {
                        clearTimeout(recallAfter1sDelay);
                        ledWalkthroughProcedure.checkOccurrence();
                    }, 1000);
                } else {
                    var timelapsed = popupDetector.timeLapsedSinceLastPopupClosed();
                    if (timelapsed < 30000) {
                        var todelay = 30000 - timelapsed;
                        var recallAfter30sDelay = setTimeout(function() {
                            clearTimeout(recallAfter30sDelay);
                            ledWalkthroughProcedure.execute();
                        }, todelay);
                    } else {
                        var recallAfter10sDelay = setTimeout(function() {
                            clearTimeout(recallAfter10sDelay);
                            var popupDetector = new PopupDetector();
                            if (popupDetector.isDetectedOpenedPopup()) {
                                ledWalkthroughProcedure.checkOccurrence();
                            } else {
                                ledWalkthroughProcedure.execute();
                            }
                        }, 15000);
                    }
                }
            },
            initiate: function(leddevices) {
                if (leddevices.length > 0) {
                    if (leddevices.length > 0) {
     
                        if (ledWalkthroughProcedure.currentLaunchCount == null) {
                            sharedPreferences.get(sharedPreferencesConstants.WEMO_NAMESPACE,
                                sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_LAUNCHEDCOUNT, '',
                                function(data) {
                                    if (data != undefined || data != null) {
                                        ledWalkthroughProcedure.currentLaunchCount = Number(data);
                                    }
                                });
                        }

                        var splwt = {
                            _s: function() {
                                ledWalkthroughProcedure.mode = sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_SINGLE;
                                var sharedPreferencesListener_single = function(data) {
                                    if (!data || data == undefined || data == null) {
                                        ledWalkthroughProcedure.checkOccurrence();
                                    } else {
                                        status_LedWalkthrough[sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_SINGLE] = true;
                                    }
                                }
                                sharedPreferences.get(sharedPreferencesConstants.WEMO_NAMESPACE, ledWalkthroughProcedure.mode, '', sharedPreferencesListener_single);
                            },
                            _mt2: function() {
                                ledWalkthroughProcedure.mode = sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_MULTIPLE_T2;
                                var sharedPreferencesListener_multipleT2 = function(data) {
                                    if (!data || data == undefined || data == null) {
                                        if (ledWalkthroughProcedure.currentLaunchCount != null) {
                                            if (ledWalkthroughProcedure.t1LaunchCount == null) {
                                                sharedPreferences.get(sharedPreferencesConstants.WEMO_NAMESPACE,
                                                    sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_T1LAUNCHCOUNT, '',
                                                    function(data) {
                                                        if (data != undefined || data != null) {
                                                            ledWalkthroughProcedure.t1LaunchCount = Number(data);
                                                            if (ledWalkthroughProcedure.currentLaunchCount > ledWalkthroughProcedure.t1LaunchCount) {
                                                                ledWalkthroughProcedure.checkOccurrence();
                                                            }
                                                        }
                                                    });
                                            } else {
                                                if (ledWalkthroughProcedure.currentLaunchCount > ledWalkthroughProcedure.t1LaunchCount) {
                                                    ledWalkthroughProcedure.checkOccurrence();
                                                }
                                            }
                                        }
                                    } else {
                                        status_LedWalkthrough[sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_MULTIPLE_T2] = true;
                                    }
                                }
                                sharedPreferences.get(sharedPreferencesConstants.WEMO_NAMESPACE, ledWalkthroughProcedure.mode, '', sharedPreferencesListener_multipleT2);
                            },
                            _m: function() {
                                ledWalkthroughProcedure.mode = sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_MULTIPLE;
                                var sharedPreferencesListener_multiple = function(data) {
                                    if (!data || data == undefined || data == null) {
                                        ledWalkthroughProcedure.checkOccurrence();
                                    } else {
                                        status_LedWalkthrough[sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_MULTIPLE] = true;
                                        if (!status_LedWalkthrough[sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_MULTIPLE_T2]) {
                                            splwt._mt2();
                                        }
                                    }
                                }
                                sharedPreferences.get(sharedPreferencesConstants.WEMO_NAMESPACE, ledWalkthroughProcedure.mode, '', sharedPreferencesListener_multiple);
                            }
                        };

                        if (leddevices.length > 1) {
                            if (!status_LedWalkthrough[sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_MULTIPLE]) {
                                splwt._m();
                            } else if (!status_LedWalkthrough[sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_MULTIPLE_T2]) {
                                splwt._mt2();
                            }
                        } else {
                            if (!status_LedWalkthrough[sharedPreferencesConstants.WEMO_LED_WALKTHROUGH_SINGLE]) {
                                splwt._s();
                            }
                        }
                    }
                }
            }
        };

        ledWalkthroughProcedure.initiate(leddevices);

        if (len == 0 || leddevices == "" || leddevices == null) {
            listItem += "";
        } else {
            $("#question_mark_image").hide();
            window.sessionStorage.setItem("LEDpresent", "yes");

            for (var i = 0; i < len; i++) {

                var deviceIdAvailablity = leddevices[i].Availability;
                var GroupId = leddevices[i].GroupID;
      
                var isDeviceDisabled = false,
                    isDeviceRendered = true;
                if (leddevices[i].InActive == 3) {
                    isDeviceDisabled = true;
                }
                if (leddevices[i].isRendered == false) {
                    isDeviceRendered = false; 
                }

                //device list Array

                if ((deviceIdAvailablity == "YES" || deviceIdAvailablity == "" || deviceIdAvailablity == undefined) && (GroupId == undefined || GroupId == "")) {

                    var ID = leddevices[i].DeviceID;
                    var Friendlyname = leddevices[i].FriendlyName;
                    var state = $.trim(leddevices[i].CurrentState);
                    var deviceinfo = {};
                    deviceinfo[key.DEVICEID] = ID;
                    deviceinfo[key.DEVICETYPE] = wemo.items['Led_Device_Type'];
                    deviceinfo[key.FRIENDLYNAME] = Friendlyname;
                    deviceinfo[key.UNREACHABLE] = "NO";
                    arrdeviceLeds.push(deviceinfo);

                    var CurrentState = "";
                    var CurrentDimmingVal = "";

                    var searchType = state.search(",");
                    var colorTemperatureValue = sessionStore.TEMPERATURE_DEFAULT_VALUE;
                    var colorTemperatureFlexValue = sessionStore.DEFAULT_RGB_XY_VALUE;
                    var capabilitiesIDVal = wemoUtil.mappingCapabilityIDwithValue(leddevices[i].CapabilityIDs, leddevices[i].CurrentState);
                    	
                    if (searchType == -1 || searchType == false) {
                        if (state.charAt(0) == ",") {

                            CurrentState = "1";
                            CurrentDimmingVal = "255";

                        } else {
                            CurrentState = state;
                            CurrentDimmingVal = "255";
                        }

                    } else {
                        var StateArr = state.split(",");
                        CurrentState = StateArr[0];
                        var SplitDimmingArr = $.trim(StateArr[1]).split(":");
                        CurrentDimmingVal = SplitDimmingArr[0];
                        var ledDeviceType = wemoUtil.ledBulbType(leddevices[i].ModelCode);
                        
                    	if(StateArr.length >= 7 )
	                    {
                    		if(wemoUtil.isTemperatureBulb(ledDeviceType)){
                    			colorTemperatureValue = StateArr[6];
                    		}
                        	else if(wemoUtil.isColoredandTemperaturedBulb(ledDeviceType)){
                        		colorTemperatureValue = capabilitiesIDVal[ledCapabilities.TEMPERATURE];
                        		colorTemperatureFlexValue = capabilitiesIDVal[ledCapabilities.COLOR];
                        	}
                        	else if(wemoUtil.isColoredBulb(ledDeviceType)){
                        		colorTemperatureFlexValue = capabilitiesIDVal[ledCapabilities.COLOR];
                        	}
	                    }
                        else
                        {
                        	if(wemoUtil.isColoredandTemperaturedBulb(ledDeviceType)){
                        		colorTemperatureValue = capabilitiesIDVal[ledCapabilities.TEMPERATURE];
                        		colorTemperatureFlexValue = capabilitiesIDVal[ledCapabilities.COLOR];
                        	}
                        	else if(wemoUtil.isColoredBulb(ledDeviceType)){
                        		colorTemperatureFlexValue = capabilitiesIDVal[ledCapabilities.COLOR];
                        	}
                        }
                        
                    	if(colorTemperatureFlexValue == "" || colorTemperatureFlexValue == ","){
                    		colorTemperatureFlexValue =  sessionStore.DEFAULT_RGB_XY_VALUE;
                    	}
                    }


                    var DevIndex = leddevices[i].DeviceIndex;
                    var deviceListType = leddevices[i].DeviceListType;
                    //var AllowedVal = "255";
                    var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
                    var name = Friendlyname + "" + DevIndex;
                    var DeviceID = leddevices[i].DeviceID;
                    var iconURL = defaultIcon.LED_THUMB_URI;
                    var firmwareUpgradeStatus = "";
                    var DeviceType = "LED";
                    var capabilityID = "";
                    var ledDeviceImg = '';
                    var strengthStatus = '';
                    var switchStateClass = '';
                    var sliderTextClass = '';
                    var deviceManufacture = '';
                    var modelCode = '';
                    var manufacturerKey = '';
                    var overlayClass = '';
                    var statusdimmingVal = '';
                    var datacatagory = sessionStore.WEMO_LINK_SUBDEVICE_TYPE;

                    if (leddevices[i].ManufacturerName != undefined)
                        deviceManufacture = leddevices[i].ManufacturerName;

                    if (leddevices[i].ModelCode != undefined)
                        modelCode = leddevices[i].ModelCode;

                    if (deviceListType == "Paired") {

                        if (deviceManufacture != "" && modelCode != "") {
                            var replaceSpaceManufacturer = deviceManufacture.replace(/ /g, '_');
                            replaceSpaceManufacturer = replaceSpaceManufacturer.toLowerCase();
                            var replaceSpaceModelcode = modelCode.replace(/ /g, '_');
                            replaceSpaceModelcode = replaceSpaceModelcode.toLowerCase();
                            modelCode = modelCode.toLowerCase();
                            
                            if(($.inArray($.trim(leddevices[i].ModelCode), ledmodelcodes) != -1 || $.inArray($.trim(leddevices[i].ModelCode), homeSensemodelcodes) != -1) && 
                            	$.inArray($.trim(deviceManufacture), ledmanufacturercodes) != -1){
                            	var imagenameFormation = "bulb_" + replaceSpaceManufacturer + "_" + replaceSpaceModelcode + ".png";
                                var imageurlFormation = ledDefalutImg.Dynamic;
                                iconURL = imageurlFormation + imagenameFormation;
                            }
                            else
                            	iconURL = defaultIcon.LED_THUMB_URI;
                            
                        } else
                            iconURL = defaultIcon.LED_THUMB_URI;


                        var tempObject = device_list_bridge.getDeviceFromCache(GroupId);
                        if (tempObject != undefined) {
                            tempObject.imgURL = iconURL;
                            device_list_bridge.updateLedCache(DeviceID, tempObject);
                        }

                        deviceIcon[DeviceID] = iconURL;
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.DEVICE_LED_ICON, deviceIcon);

                        if (!isDeviceDisabled && (leddevices[i].CapabilityIDs == "" || leddevices[i].CapabilityIDs == undefined)) {
                            devicePlugin.execute(
                                function(responce) {

                                    if (responce == null || responce == "") {
                                        var len = responce.length;
                                        var Allowedarr = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
                                        capabilityID = sessionStore.LED_DEVICE_DEFAULT_CAPABILITY;
                                        
                                    } else {
                                        
                                        var len = responce.length;

                                        for (var i = 0; i < len; i++) {
                                            capabilityID += responce[i].capabilityId + ",";

                                            if (responce[i].capabilityId == ledCapabilities.DIMMING) {
                                                var Allowedarr = responce[i].capabilityNameValue;
                                            }
                                        }

                                        capabilityID = capabilityID.substr(0, capabilityID.length - 1);
                                        
                                    }
                                    
                                },
                                device_list_bridge.reportError,
                                ACTION_GET_DEVICEIDS_FOR_CAPABILITY, [DeviceID]
                            );


                        } else
                            capabilityID = leddevices[i].CapabilityIDs;

                        if (Friendlyname == "") {
                            Friendlyname = "LED bulb";
                        }
                        if (Friendlyname.indexOf(',') != -1) {
                            Friendlyname = Friendlyname.substr(0, friendlyName.indexOf(','));
                        } //DEVICE_STATE DEVICE_CURRENT_STATUS_VAL
                        if (CurrentState == '0' || CurrentState == '1') {
                            switchStateClass = device_list_bridge.getBinaryStateImage(CurrentState);
                            strengthStatus = (CurrentDimmingVal * 100) / (AllowedVal);
                            strengthStatus = Math.ceil(strengthStatus) + "%";
                            statusdimmingVal = strengthStatus;
                            

                            if (inp == "edit") {
                                overlayClass = "editListLeds";
                                switchStateClass = "edit_device_arrow_icon";
                                nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                            } else {
                                overlayClass = "led_list";
                            }

                            if (CurrentState == "1")
                                sliderTextClass = 'LedBrihtnesscolorChange';
                            
                            if($.trim(modelCode) == $.trim(homeSenseModelCodes.KEYFOB).toLowerCase())
                            {
                            	var homeSenseCapaval = capabilitiesIDVal[homeSenseCapabilities.ONOFF];
                            	isDeviceRendered = true;
                            	var timeinmilisecs = wemoUtil.convertTimeToMilliseconds("");
                            	var timeinAMPM =  wemoUtil.convertMillisecondsToAMPM(timeinmilisecs);
                            	
                            	if(homeSenseCapaval == 0 || homeSenseCapaval == undefined){
                            		switchStateClass = ledDeviceConstants.FOBAWAY;
                            		strengthStatus = wemo.items['FobDeviceInActiveStatus']+" "+timeinAMPM;
                            	}else{
                            		switchStateClass = ledDeviceConstants.FOBACTIVE;
                            		strengthStatus = wemo.items['FobDeviceActiveStatus']+" "+timeinAMPM;
                            	}
                            	
                            	datacatagory = sessionStore.WEMO_LINK_SUBDEVICE_HOMESENSE_TYPE;
                            	
                            }
                            else if($.trim(modelCode) == $.trim(homeSenseModelCodes.PIR).toLowerCase()){
                            	var homeSenseCapaval = capabilitiesIDVal[homeSenseCapabilities.ONOFF];
                            	var homeSenseCapaNotification = capabilitiesIDVal[homeSenseCapabilities.SENSORENABLEDISABLE];
                            	
                            	CurrentState = 0;
                            	isDeviceRendered = true;
                            	switchStateClass = ledDeviceConstants.HOMESENSEOFF;
                            	var timeinmilisecs = wemoUtil.convertTimeToMilliseconds("");
                            	var timeinAMPM =  wemoUtil.convertMillisecondsToAMPM(timeinmilisecs);
                            	
                            	if(homeSenseCapaval == 0 || homeSenseCapaval == undefined){
                            		strengthStatus = wemo.items['PirMotionSensed']+" "+timeinAMPM;
                            	}else{
                            		strengthStatus = wemo.items['Devices_Remote_MotionSensed']+" "+timeinAMPM;
                            		sliderTextClass = '';
                            	}
                            	if(homeSenseCapaNotification == 1){
                             		switchStateClass = ledDeviceConstants.HOMESENSEON;
                             		CurrentState = 1;
                            	}
                            	datacatagory = sessionStore.WEMO_LINK_SUBDEVICE_HOMESENSE_TYPE;
                            }
                            else if($.trim(modelCode) == $.trim(homeSenseModelCodes.ALARM).toLowerCase()){
                            	var homeSenseCapaval = capabilitiesIDVal[homeSenseCapabilities.ONOFF];
                            	isDeviceRendered = true;
                            	
                            	if(homeSenseCapaval == 0 || homeSenseCapaval == undefined){
                            		switchStateClass = "";
                            		strengthStatus = wemo.items['AlarmDeviceInActiveStatus'];
                            	}else{
                            		switchStateClass = "alarmDetectedIcon";
                            		strengthStatus = wemo.items['AlarmDeviceActiveStatus'];
                            		sliderTextClass = "alarmDetectedTxtColor";
                            	}
                            	datacatagory = sessionStore.WEMO_LINK_SUBDEVICE_HOMESENSE_TYPE;
                            }
                            	
                            var firmwareMessagingArr = window.sessionStorage.getItem(sessionStore.LED_FIRMWARE_MESSAGING);
                            if(firmwareMessagingArr)
                            {
                            	firmwareMessagingArr = firmwareMessagingArr.split(",");
            					for (var udnDevice in firmwareMessagingArr) {
            						var deviceIDMsgArr = firmwareMessagingArr[udnDevice].split("::");
            						
            						var deviceID = deviceIDMsgArr[0];
            						var msgFM = deviceIDMsgArr[1];
            				
            						if(DeviceID == deviceID)
            			            {
            			            	strengthStatus = msgFM;
            			            	
            			            	if($.trim(msgFM) == wemo.items['FirmwareMsgUpgrading'])
            			            	{
            			            		sliderTextClass = "firmwareMsg";
            			            		switchStateClass = "led_value_loading";
            			            	}
            			            }
            			            	
            			        }
                            }
        				 
                        } else {
                            //switchStateClass = 'led_on';
                            //overlayClass = "led_list";
                            
                            if($.trim(modelCode) == $.trim(homeSenseModelCodes.KEYFOB).toLowerCase())
                            {
                            	var homeSenseCapaval = capabilitiesIDVal[homeSenseCapabilities.ONOFF];
                            	isDeviceRendered = true;
                            	var timeinmilisecs = wemoUtil.convertTimeToMilliseconds("");
                            	var timeinAMPM =  wemoUtil.convertMillisecondsToAMPM(timeinmilisecs);
                            	
                            	if(homeSenseCapaval == 0 || homeSenseCapaval == undefined){
                            		switchStateClass = "fobAwayIcon";
                            		strengthStatus = wemo.items['FobDeviceInActiveStatus']+" "+timeinAMPM;
                            	}else{
                            		switchStateClass = "fobIcon";
                            		strengthStatus = wemo.items['FobDeviceActiveStatus']+" "+timeinAMPM;
                            	}
                            	overlayClass = '';
                            	datacatagory = sessionStore.WEMO_LINK_SUBDEVICE_HOMESENSE_TYPE;
                            }
                            else if($.trim(modelCode) == $.trim(homeSenseModelCodes.PIR).toLowerCase()){
                            	var homeSenseCapaval = capabilitiesIDVal[homeSenseCapabilities.ONOFF];
                            	var homeSenseCapaNotification = capabilitiesIDVal[homeSenseCapabilities.SENSORENABLEDISABLE];
                        
                            	CurrentState=0;
                            	isDeviceRendered = true;
                            	switchStateClass = "homesense_off";
                            	overlayClass = '';
                            	var timeinmilisecs = wemoUtil.convertTimeToMilliseconds("");
                            	var timeinAMPM =  wemoUtil.convertMillisecondsToAMPM(timeinmilisecs);
                            	
                            	if(homeSenseCapaval == 0 || homeSenseCapaval == undefined){
                            		strengthStatus = wemo.items['PirMotionSensed']+" "+timeinAMPM;
                            	}else{
                            		strengthStatus = wemo.items['Devices_Remote_MotionSensed']+" "+timeinAMPM;
                            		sliderTextClass = '';
                            	}
                          
                            	if(homeSenseCapaNotification == 1){
                             		switchStateClass = "homesense_on";
                             		CurrentState=1;
                            	}
                            	datacatagory = sessionStore.WEMO_LINK_SUBDEVICE_HOMESENSE_TYPE;
                            }
                            else if($.trim(modelCode) == $.trim(homeSenseModelCodes.ALARM).toLowerCase()){
                            	var homeSenseCapaval = capabilitiesIDVal[homeSenseCapabilities.ONOFF];
                            	isDeviceRendered = true;
                            	
                            	if(homeSenseCapaval == 0 || homeSenseCapaval == undefined){
                            		switchStateClass = "";
                            		strengthStatus = wemo.items['AlarmDeviceInActiveStatus'];
                            	}else{
                            		switchStateClass = "alarmDetectedIcon";
                            		strengthStatus = wemo.items['AlarmDeviceActiveStatus'];
                            		sliderTextClass = "alarmDetectedTxtColor";
                            	}
                            	
                            	overlayClass = '';
                            	datacatagory = sessionStore.WEMO_LINK_SUBDEVICE_HOMESENSE_TYPE;
                            }
                            else
                            	overlayClass = 'disabled';
                        }

                        if (isDeviceDisabled) {
                            overlayClass = 'disabled';
                        }

                       //if(jQuery.inArray(leddevices[i].ModelCode, homeSensemodelcodes) == -1)
                        	deviceIdsList.push(DeviceID);
                        
                        if (capabilityID == "")
                            capabilityID = sessionStore.LED_DEVICE_DEFAULT_CAPABILITY;
                        
                        //Edit Icon
                        wemoUtil.infoLog(device_list_bridge.TAGB, "colorTemperatureValue only set for TTB bulb is :: "+colorTemperatureValue+" and  Friendlyname is ::"+Friendlyname);
                        if (!isDeviceDisabled && isDeviceRendered) {
                           listItem += CTemplator.fitIn('<li data-depurar="3" data-category="[30]" name="switch_li" wemo-device-udn="[0]" data-deviceId="[0]" data-macId="[0]" class="device_li [1]" id= "mainLIID[0]"> <div class="ledDiv"> <span class="devicesCount"> </span> <span name="name_device_icon" class="device_list_icon_container"> <img src="[2]" width="75" height="75"> </span> <span class="power_indicator_container"> <span name="name_led_device_state" id="[0]" wemo-device-state="[6]" class="[6]" wemo-device-plugin-id="[0]" wemo-device-state-code="[7]" wemo-device-capabilities="[8]" wemo-device-friendly-name="[3]" wemo-device-type="[9]" wemo-device-modelcode="[20]" wemo-device-manufacture="[21]" wemo-device-capabilities-values="[23]"> <p class="bulbStrength" id="dimmingDis[0]"> [22] </p> </span> </span> <span class="device_list_friendly_name_container drawerToggle"> <label> [3] </label> <span class="sliderValue [24]"> [4] </span> <span class="click_advance" data-deviceid="[0]"> <span class="drawer_icon_arrow_down iconType"> </span> </span> <label name="name_firmware_status" class="NotDetected subTitle"> [5] </label> </span> <div id="mainWrapper[0]" style="display:none;" class="mainWrap" name="mainWrapper" wemo-device-friendly-name="[3]" wemo-device-type="[9]" wemo-device-max-allowed-val="[10]" wemo-device-capabilities="[8]" wemo-device-capabilities-values="[23]"> <div id="wrapperonoff"> <input type="text" name="currentVal" id="currentVal[0]" size="3" value="[22]" style="position:relative;top:30px;right:60px;border:none;background-color:#F3F3F3;" disabled/> <div id="innerDiv2onoff[0]" class="innerDiv2onoff"> </div> </div> </div> </div> <div class="ledDrawer drawerView" id="drawer-[0]"> <div class="sliderRow"> </div> <div class="temperatureColorRow" style="display: none;" data-ttbColor="[25]"> <span class="temparatureColorPicker"></span> <span class="tempPickerLabel">[26]</span> <span class="goTempPicker"></span></div> <div class="colorPickerMainDiv" data-ttbColor="[25]" data-Color="[27]"><span class="colorPickerBox"></span> <span class="colorPickerLabel">[28]</span> <span class="goColorPicker"></span> </div> <div class="sleepFader"> [11] <div class="timer"> [29] </div> </div> <div class="firstRow"> <span class="minutesButton"> <span class="buttonTitle"> [12] </span> <span class="buttonImage" data-time="1"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [13] </span> <span class="buttonImage" data-time="10"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [14] </span> <span class="buttonImage" data-time="30"> </span> </span> <span class="minutesButton customSelector"> <span class="buttonTitle"> [15] </span> <span class="buttonImage customPicker" data-time="1" id="customPicker[0]"> [16] </span> </span> </div> <div class="secondRow"> <span class="minutesButton"> <span class="buttonTitle"> [14] </span> <span class="buttonImage" data-time="30"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [17] </span> <span class="buttonImage" data-time="45"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [18] </span> <span class="buttonImage" data-time="60"> </span> </span> </div> <div class="goSleep" data-timer="-1"> [19] </div> </div></li>', [DeviceID, overlayClass, iconURL, Friendlyname, strengthStatus, firmwareUpgradeStatus, switchStateClass, CurrentState, capabilityID, DeviceType, AllowedVal, wemo.items.sleepFader, wemo.items.oneMin, wemo.items.tenMin, wemo.items.thirtyMin, wemo.items.custom, wemo.items.enter, wemo.items.fourtyFiveMin, wemo.items.oneHour, wemo.items.goToSleep, modelCode, deviceManufacture, statusdimmingVal, leddevices[i].CurrentState, sliderTextClass, colorTemperatureValue, wemo.items.TempDrawerLabel, colorTemperatureFlexValue, wemo.items.Color, wemo.items.Off, datacatagory]);
                        } else if (isDeviceRendered) {
                            listItem += CTemplator.fitIn('<li data-depurar="4" data-category="[25]" name="switch_li" wemo-device-udn="[0]" data-deviceId="[0]" data-macId="[0]"  class="device_li disabled" id= "mainLIID[0]"><div class="ledDiv"><span class="devicesCount"></span><span name="name_device_icon" class="device_list_icon_container"><img src="[1]" width="75" height="75"></span> <span class="power_indicator_container"> <span name="name_led_device_state" id="[0]" wemo-device-state="disabled" class="disabled" wemo-device-plugin-id="[0]" wemo-device-state-code="3" wemo-device-capabilities="[5]" wemo-device-friendly-name="[2]" wemo-device-type="[3]" wemo-device-modelcode="[16]" wemo-device-manufacture="[17]" wemo-device-capabilities-values="[19]"> <p class="bulbStrength" id="dimmingDis[0]"> [18] </p> </span> </span> <span class="device_list_friendly_name_container drawerToggle"><label>[2]</label> <span class="sliderValue bulbStrength"> [6] </span> <span class="click_advance" data-deviceid="[0]"> <span class="drawer_icon_arrow_down iconType"> </span> </span> <label name="name_firmware_status"  class="NotDetected subTitle"> Not Detected </label></span><div id="mainWrapper[0]" style="display:none;" class="mainWrap" name="mainWrapper" wemo-device-friendly-name="[2]" wemo-device-type="[3]" wemo-device-max-allowed-val="[4]" wemo-device-capabilities="[5]" wemo-device-capabilities-values="[19]"><div id="wrapperonoff"><input type="text" name="currentVal" id="currentVal[0]" size="3" value="[18]" style="position:relative;top:30px;right:60px;border:none;background-color:#F3F3F3;" disabled/><div id="innerDiv2onoff[0]" class="innerDiv2onoff"></div></div></div></div><div  class="ledDrawer drawerView" id="drawer-[0]"><div class="sliderRow"></div> <div class="temperatureColorRow" style="display: none;" data-ttbColor="[20]"> <span class="temparatureColorPicker"></span> <span class="tempPickerLabel">[21]</span> <span class="goTempPicker"></span></div> <div class="colorPickerMainDiv" data-ttbColor="[20]" data-Color="[22]"><span class="colorPickerBox"></span> <span class="colorPickerLabel">[23]</span> <span class="goColorPicker"></span> </div> <div class="sleepFader">[7]<div class="timer"> [24] </div></div><div class="firstRow"><span class="minutesButton"><span class="buttonTitle">[8]</span><span class="buttonImage" data-time="1"></span></span><span class="minutesButton"><span class="buttonTitle">[9]</span><span class="buttonImage" data-time="10"></span></span> <span class="minutesButton"><span class="buttonTitle">[10]</span><span class="buttonImage" data-time="30"></span></span><span class="minutesButton customSelector"><span class="buttonTitle">[11]</span><span class="buttonImage customPicker" data-time="1" id="customPicker[0]">[12]</span></span></div><div class="secondRow"><span class="minutesButton"><span class="buttonTitle">[10]</span><span class="buttonImage" data-time="30"></span></span><span class="minutesButton"><span class="buttonTitle">[13]</span><span class="buttonImage" data-time="45"></span></span><span class="minutesButton"><span class="buttonTitle">[14]</span><span class="buttonImage" data-time="60"></span></span></div><div class="goSleep" data-timer="-1">[15]</div></div></li>', [DeviceID, iconURL, Friendlyname, DeviceType, AllowedVal, capabilityID, strengthStatus, wemo.items.sleepFader, wemo.items.oneMin, wemo.items.tenMin, wemo.items.thirtyMin, wemo.items.custom, wemo.items.enter, wemo.items.fourtyFiveMin, wemo.items.oneHour, wemo.items.goToSleep, modelCode, deviceManufacture, statusdimmingVal, leddevices[i].CurrentState, colorTemperatureValue, wemo.items.TempDrawerLabel, colorTemperatureFlexValue, wemo.items.Color, wemo.items.Off, datacatagory]);
                        }
                        
                    }

                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.LED_DEVICE_INFO, arrdeviceLeds);

                }

                //group list
                else if (GroupId != "" && GroupId != undefined) {
                    var groupIdsArr = leddevices[i].GroupIDS;

                    if (groupIdsArr != "" && groupIdsArr != undefined) {
                        var groupCapabilities = leddevices[i].GroupCapabilityIDs;
                        var groupName = leddevices[i].GroupName;
                        var groupCapabilitiesVal = $.trim(leddevices[i].GroupCapabilityValues);
                        var searchType = groupCapabilitiesVal.search(",");
                        var groupDeviceID = "";
                        var groupDeviceAvailability = "";
                        var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
                        var mainLiID = groupName + "" + GroupId;
                        var firmwareUpgradeStatus = "";
                        var CurrentState = "";
                        var CurrentDimmingVal = "";
                        var groupDeviceFriendlyname = "";
                        var strengthStatus = '';
                        var switchStateClass = '';
                        var sliderTextClass = '';
                        var overlayClass = '';
                        var statusdimmingVal = '';
                        var colorTemperatureValue = sessionStore.TEMPERATURE_DEFAULT_VALUE;
                        var colorTemperatureFlexValue = sessionStore.DEFAULT_RGB_XY_VALUE;
                        
                        if ((searchType == -1 || searchType == false) && inp != ledLocalCache.ADD_DEVICE_AFTER_STATUS) {
                            if (groupCapabilitiesVal.charAt(0) == "," && inp != ledLocalCache.INITIAL_CACHE) {

                                devicePlugin.execute(function(responceStatus) {
        
                                        if (responceStatus[0].capabilityvalue == undefined) {
                                            CurrentState = "0";
                                            CurrentDimmingVal = "0"
                                        } else {
                                            var state = $.trim(responceStatus[0].capabilityvalue);
                                            var StateArr = state.split(",");
                                            CurrentState = StateArr[0];
                                            var SplitDimmingArr = $.trim(StateArr[1]).split(":");
                                            CurrentDimmingVal = SplitDimmingArr[0];
                                        }

                                    },
                                    device_list_bridge.reportError,
                                    ACTION_GET_LED_GRP_STATUS, [GroupId]
                                );
                            } else {
                                CurrentState = groupCapabilitiesVal;
                                CurrentDimmingVal = "0";
                            }

                        } else {
                            var StateArr = groupCapabilitiesVal.split(",");
                            CurrentState = StateArr[0];
                            var SplitDimmingArr = $.trim(StateArr[1]).split(":");
                            CurrentDimmingVal = SplitDimmingArr[0];
                            var capabilitiesIDVal = wemoUtil.mappingCapabilityIDwithValue(groupCapabilities, groupCapabilitiesVal);
                        	colorTemperatureValue = capabilitiesIDVal[ledCapabilities.TEMPERATURE];
                        	colorTemperatureFlexValue = capabilitiesIDVal[ledCapabilities.COLOR];
                        	
                        	if(colorTemperatureFlexValue == "" || colorTemperatureFlexValue == ","){
                        		colorTemperatureFlexValue =  sessionStore.DEFAULT_RGB_XY_VALUE;
                        	}
                        }

                        if (CurrentState == '0' || CurrentState == '1') {
                            switchStateClass = device_list_bridge.getBinaryStateImage(CurrentState);
                            strengthStatus = (CurrentDimmingVal * 100) / (AllowedVal);
                            strengthStatus = Math.ceil(strengthStatus) + "%";
                            statusdimmingVal = strengthStatus;

                            if (inp == "edit") {
                                overlayClass = "editListGroupLeds";
                                switchStateClass = "edit_device_arrow_icon";
                                nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                            } else {
                                overlayClass = "led_group";
                            }

                            if (CurrentState == "1")
                                sliderTextClass = 'LedBrihtnesscolorChange';
                            
                            
                            var firmwareMessagingArr = window.sessionStorage.getItem(sessionStore.LED_FIRMWARE_MESSAGING);
                            if(firmwareMessagingArr)
                            {
                            	firmwareMessagingArr = firmwareMessagingArr.split(",");
            					for (var udnDevice in firmwareMessagingArr) {
            						var deviceIDMsgArr = firmwareMessagingArr[udnDevice].split("::");
            						
            						var deviceID = deviceIDMsgArr[0];
            						var msgFM = deviceIDMsgArr[1];
            						
            			            if(GroupId == deviceID)
            			            {
            			            	strengthStatus = msgFM;
            			            	
            			            	if($.trim(msgFM) == wemo.items['FirmwareMsgUpgrading'])
            			            	{
            			            		sliderTextClass = "firmwareMsg";
            			            		switchStateClass = "led_value_loading";
            			            	}
            			            }
            			            	
            			        }
                            }

                        } else {
                            overlayClass = 'disabled';
                            //switchStateClass = 'led_on';
                            //overlayClass = "led_list";
                        }
                        
                        if(groupIdsArr[0] != undefined)
                        {
                        	if(jQuery.inArray(groupIdsArr[0].ModelCode, homeSensemodelcodes) != -1)
                        	{
                                 isDeviceRendered = true;
                        	}	
                        }
                        
                        if (isDeviceDisabled) {
                            overlayClass = 'disabled';
                        }


                        iconURL = defaultIcon.LED_THUMB_URI;
                        var ledDeviceImg = '';

                        deviceIdsList.push(GroupId);
                        var deviceManufactCnt = [];
                        var deviceModelCnt = [];
                        
                        //Edit Icon
                        if (!isDeviceDisabled && isDeviceRendered) {
                            for (var j = 0, devicelistHTML = ''; j < groupIdsArr.length; j++) {
                                groupinfo = {};
                                groupDeviceFriendlyname += groupIdsArr[j].FriendlyName + ",";
                                groupDeviceID += groupIdsArr[j].DeviceID + ",";
                                groupDeviceAvailability += groupIdsArr[j].Availability;
                                var name = wemo.items['dimmableLight'] + j;
                                groupinfo[key.GROUPID] = GroupId;
                                groupinfo[key.DEVICEID] = groupIdsArr[j].DeviceID;
                                groupinfo[key.DEVICETYPE] = wemo.items['Led_Device_Type'];
                                groupinfo[key.FRIENDLYNAME] = groupIdsArr[j].FriendlyName;
                                groupinfo[key.UNREACHABLE] = "NO";
                                groupinfo[key.AVAILABILITY] = "YES";

                                if (groupIdsArr[j].ManufacturerName != undefined)
                                	deviceManufactCnt.push(groupIdsArr[j].ManufacturerName);
                                
                                if (groupIdsArr[j].ModelCode != undefined)
                                	deviceModelCnt.push(groupIdsArr[j].ModelCode);

                                if($.trim(groupIdsArr[j].ModelCode) == $.trim(homeSenseModelCodes.DOORWINDOWS).toLowerCase())
                            	{
                                	if(j == 0)
                                	{
                                		devicelistHTML += CTemplator.fitIn('<li class="homeSenseDrawer" id="drawer-[0]"><div class="headerTitle"><span class="title">[1]</span><span class="titleImage" id="titleImage-[0]" data-deviceId="[0]"></span></div>',[groupIdsArr[j].DeviceID, wemo.items['Sensor']]);
                                	}
                                	devicelistHTML += CTemplator.fitIn('<div class="homeSenseDevice" data-sid="[0]" data-friendlyName="Front Door"><span class="device_list_icon_container"><img width="28" height="28" src="../img/Icon-4.png"></span><span class="device_list_friendly_name_container"><label>Front Door</label><span class="fobsSubtitle">Open door 10:02am</span></span><span class="fobIcon first" data-deviceId="[0]"></span></div></li>',[groupIdsArr[j].DeviceID]);  
                            	}
                                else
                                	devicelistHTML += CTemplator.fitIn('<p data-groupId="[0]" id="[1]" class="groupDeviceList">[2]</p>', [GroupId, groupIdsArr[j].DeviceID, groupIdsArr[j].FriendlyName]);
                                
                                arrgroupLeds.push(groupinfo);
                                deviceIdsList.push(groupIdsArr[j].DeviceID);
                                groupdeviceslist.push(groupIdsArr[j].DeviceID);
                            }

                            groupDeviceID = groupDeviceID.substr(0, groupDeviceID.length - 1);
                            groupDeviceFriendlyname = groupDeviceFriendlyname.substr(0, groupDeviceFriendlyname.length - 1);
                            window.sessionStorage.setItem(sessionStore.LED_DRAWER_GROUP_LIST, groupDeviceID);

                            if(deviceManufactCnt.length > 0)
                            	deviceManufactCnt = jQuery.unique(deviceManufactCnt);

                            if (deviceManufactCnt.length == 1) {
                            	deviceModelCnt = jQuery.unique(deviceModelCnt);
                            	iconURL = wemoUtil.replaceSpaceinModelCodeandManufacturer(deviceManufactCnt[0], deviceModelCnt[0]);
                              
                                var tempObject = device_list_bridge.getDeviceFromCache(GroupId);
                                if (tempObject != undefined) {
                                    tempObject.imgURL = iconURL;
                                    device_list_bridge.updateLedCache(GroupId, tempObject);
                                }
                            }

                            deviceIcon[GroupId] = iconURL;
                            wemoUtil.setJSONObjectToSessionStorage(sessionStore.DEVICE_LED_ICON, deviceIcon);
                            
                            if($.trim(deviceModelCnt[0]) == $.trim(homeSenseModelCodes.DOORWINDOWS)){
                            	switchStateClass = "homesense_on";
                        		grouplistItem += CTemplator.fitIn('<li data-depurar="5" data-category="homesensedevice" name="group_li" wemo-device-udn="[0]" data-deviceId="[0]" data-macId="[0]" class="device_li" id= "mainLIID[0]" > <div class="ledDiv"> <span class="devicesCount displayBlock" device-grpcnt="[2]"> [2] </span> <span name="name_device_icon" class="device_list_icon_container"> <img src="[3]" width="80" height="80"> </span> <span class="power_indicator_container"> <span name="name_group_state" id="[0]" wemo-device-state="[7]" class="[7]" wemo-device-state-code="[8]" wemo-device-friendly-name="[4]" wemo-device-capabilities="[9]" wemo-device-groupids="[10]" wemo-device-avalibality="[11]" wemo-group-device-friendlyname="[12]" wemo-device-capabilities-values="[24]" wemo-device-modelcode="[25]" wemo-device-manufacture="[26]" wemo-device-status-opencls="0" wemo-device-openclose-status=""> <p class="bulbStrength" id="dimmingDis[0]"> [23] </p> </span> </span> <span class="device_list_friendly_name_container drawerToggle"> <label> [4] </label> <span class="sliderValue sliderTextClass"> [5]</span> <span class="click_advance" data-deviceId="[0]"> <span class="drawer_icon_arrow_down iconType"> </span> </span> <label name="name_firmware_status" class="NotDetected subTitle"> [6] </label> </span> <div id="mainWrapper[0]" style="display:none;" class="mainWrap" name="mainWrapper" wemo-device-capabilities="[9]" wemo-device-groupids="[10]" wemo-device-friendly-name="[4]" wemo-device-avalibality="[11]" wemo-device-modelcode="[25]" wemo-device-manufacture="[26]"> <div id="wrapperonoff"> <input type="text" name="currentVal" id="currentVal[0]" size="3" value="[23]" style="position:relative;top:30px;right:60px;border:none;background-color:#F3F3F3;" disabled/> <div id="innerDiv2onoff[0]" class="innerDiv2onoff"> </div> </div> </div> </div> <div class="ledDrawer drawerView" id="drawer-[0]"> <div class="sliderRow"> </div> <div class="temperatureColorRow" style="display: none;" data-ttbColor="[27]"> <span class="temparatureColorPicker"></span> <span class="tempPickerLabel">[29]</span> <span class="goTempPicker"></span></div> <div class="colorPickerMainDiv" data-ttbColor="[27]" data-Color="[28]"><span class="colorPickerBox"></span> <span class="colorPickerLabel">[30]</span> <span class="goColorPicker"></span> </div> <div class="sleepFader"> [13] <div class="timer"> [31] </div> </div> <div class="firstRow"> <span class="minutesButton"> <span class="buttonTitle"> [14] </span> <span class="buttonImage" data-time="1"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [15] </span> <span class="buttonImage" data-time="10"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [16] </span> <span class="buttonImage" data-time="30"> </span> </span> <span class="minutesButton customSelector"> <span class="buttonTitle"> [17] </span> <span class="buttonImage customPicker" id="customPicker[0]" data-time="1"> [18] </span> </span> </div> <div class="secondRow"> <span class="minutesButton"> <span class="buttonTitle"> [16] </span> <span class="buttonImage" data-time="30"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [19] </span> <span class="buttonImage" data-time="45"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [20] </span> <span class="buttonImage" data-time="60"> </span> </span> </div> <div class="goSleep" data-timer="-1"> [21] </div> <div class="groupFadder"> <p class="group_bulb">[32] </p> [22] </div> </div></li>', [GroupId, overlayClass, groupIdsArr.length, iconURL, groupName, strengthStatus, firmwareUpgradeStatus, switchStateClass, CurrentState, groupCapabilities, groupDeviceID, groupDeviceAvailability, groupDeviceFriendlyname, wemo.items.sleepFader, wemo.items.oneMin, wemo.items.tenMin, wemo.items.thirtyMin, wemo.items.custom, wemo.items.enter, wemo.items.fourtyFiveMin, wemo.items.oneHour, wemo.items.goToSleep, devicelistHTML, statusdimmingVal, groupCapabilitiesVal, deviceModelCnt[0], deviceManufactCnt[0], colorTemperatureValue, colorTemperatureFlexValue, wemo.items.TempDrawerLabel, wemo.items.Color, wemo.items.Off, wemo.items.groupedBulbs]);
                            }
                            else
                            	grouplistItem += CTemplator.fitIn('<li data-depurar="6" data-category="bridge" name="group_li" wemo-device-udn="[0]" data-deviceId="[0]" data-macId="[0]" class="device_li [1]" id= "mainLIID[0]" > <div class="ledDiv"> <span class="devicesCount displayBlock" device-grpcnt="[2]"> [2] </span> <span name="name_device_icon" class="device_list_icon_container"> <img src="[3]" width="80" height="80"> </span> <span class="power_indicator_container"> <span name="name_group_state" id="[0]" wemo-device-state="[7]" class="[7]" wemo-device-state-code="[8]" wemo-device-friendly-name="[4]" wemo-device-capabilities="[9]" wemo-device-groupids="[10]" wemo-device-avalibality="[11]" wemo-group-device-friendlyname="[12]" wemo-device-capabilities-values="[24]" wemo-device-modelcode="[25]" wemo-device-manufacture="[26]"> <p class="bulbStrength" id="dimmingDis[0]"> [23] </p> </span> </span> <span class="device_list_friendly_name_container drawerToggle"> <label> [4] </label> <span class="sliderValue sliderTextClass"> [5]</span> <span class="click_advance" data-deviceId="[0]"> <span class="drawer_icon_arrow_down iconType"> </span> </span> <label name="name_firmware_status" class="NotDetected subTitle"> [6] </label> </span> <div id="mainWrapper[0]" style="display:none;" class="mainWrap" name="mainWrapper" wemo-device-capabilities="[9]" wemo-device-groupids="[10]" wemo-device-friendly-name="[4]" wemo-device-avalibality="[11]" wemo-device-modelcode="[25]" wemo-device-manufacture="[26]"> <div id="wrapperonoff"> <input type="text" name="currentVal" id="currentVal[0]" size="3" value="[23]" style="position:relative;top:30px;right:60px;border:none;background-color:#F3F3F3;" disabled/> <div id="innerDiv2onoff[0]" class="innerDiv2onoff"> </div> </div> </div> </div> <div class="ledDrawer drawerView" id="drawer-[0]"> <div class="sliderRow"> </div> <div class="temperatureColorRow" style="display: none;" data-ttbColor="[24]"> <span class="temparatureColorPicker"></span> <span class="tempPickerLabel">[26]</span> <span class="goTempPicker"></span></div> <div class="colorPickerMainDiv" data-ttbColor="[24]" data-Color="[25]"><span class="colorPickerBox"></span> <span class="colorPickerLabel">[27]</span> <span class="goColorPicker"></span> </div> <div class="sleepFader"> [13] <div class="timer"> [28] </div> </div> <div class="firstRow"> <span class="minutesButton"> <span class="buttonTitle"> [14] </span> <span class="buttonImage" data-time="1"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [15] </span> <span class="buttonImage" data-time="10"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [16] </span> <span class="buttonImage" data-time="30"> </span> </span> <span class="minutesButton customSelector"> <span class="buttonTitle"> [17] </span> <span class="buttonImage customPicker" id="customPicker[0]" data-time="1"> [18] </span> </span> </div> <div class="secondRow"> <span class="minutesButton"> <span class="buttonTitle"> [16] </span> <span class="buttonImage" data-time="30"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [19] </span> <span class="buttonImage" data-time="45"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [20] </span> <span class="buttonImage" data-time="60"> </span> </span> </div> <div class="goSleep" data-timer="-1"> [21] </div> <div class="groupFadder"> <p class="group_bulb">[29] </p> [22] </div> </div></li>', [GroupId, overlayClass, groupIdsArr.length, iconURL, groupName, strengthStatus, firmwareUpgradeStatus, switchStateClass, CurrentState, groupCapabilities, groupDeviceID, groupDeviceAvailability, groupDeviceFriendlyname, wemo.items.sleepFader, wemo.items.oneMin, wemo.items.tenMin, wemo.items.thirtyMin, wemo.items.custom, wemo.items.enter, wemo.items.fourtyFiveMin, wemo.items.oneHour, wemo.items.goToSleep, devicelistHTML, statusdimmingVal, groupCapabilitiesVal, deviceModelCnt[0], deviceManufactCnt[0], colorTemperatureValue, colorTemperatureFlexValue, wemo.items.TempDrawerLabel, wemo.items.Color, wemo.items.Off, wemo.items.groupedBulbs]);
                        } else if (isDeviceRendered) {
                            for (var j = 0, devicelistHTML = ''; j < groupIdsArr.length; j++) {
                            	
                            	if (groupIdsArr[j].ManufacturerName != undefined)
                                	deviceManufactCnt.push(groupIdsArr[j].ManufacturerName);
                                
                                if (groupIdsArr[j].ModelCode != undefined)
                                	deviceModelCnt.push(groupIdsArr[j].ModelCode);
                            }

                            if(deviceManufactCnt.length > 0)
                            	deviceManufactCnt = jQuery.unique(deviceManufactCnt);

                            if (deviceManufactCnt.length == 1) {
                            	
                            	deviceModelCnt = jQuery.unique(deviceModelCnt);
                               	iconURL = wemoUtil.replaceSpaceinModelCodeandManufacturer(deviceManufactCnt[0], deviceModelCnt[0]);
                          
                                var tempObject = device_list_bridge.getDeviceFromCache(GroupId);
                                if (tempObject != undefined) {
                                    tempObject.imgURL = iconURL;
                                    device_list_bridge.updateLedCache(GroupId, tempObject);
                                }

                            }

                            deviceIcon[GroupId] = iconURL;
                            wemoUtil.setJSONObjectToSessionStorage(sessionStore.DEVICE_LED_ICON, deviceIcon);
                            
                            if($.trim(deviceModelCnt[0]) == $.trim(homeSenseModelCodes.DOORWINDOWS)){
                         		grouplistItem += CTemplator.fitIn('<li data-depurar="7" data-category="homesensedevice" name="group_li" wemo-device-udn="[0]" data-deviceId="[0]" data-macId="[0]" class="device_li disabled" id= "mainLIID[0]" > <div class="ledDiv"> <span class="devicesCount displayBlock" device-grpcnt="[2]"> [2] </span> <span name="name_device_icon" class="device_list_icon_container"> <img src="[3]" width="80" height="80"> </span> <span class="power_indicator_container"> <span name="name_group_state" id="[0]" wemo-device-state="[7]" class="[7]" wemo-device-state-code="[8]" wemo-device-friendly-name="[4]" wemo-device-capabilities="[9]" wemo-device-groupids="[10]" wemo-device-avalibality="[11]" wemo-group-device-friendlyname="[12]" wemo-device-capabilities-values="[24]" wemo-device-modelcode="[25]" wemo-device-manufacture="[26]" wemo-device-status-opencls="0" wemo-device-openclose-status=""> <p class="bulbStrength" id="dimmingDis[0]"> [23] </p> </span> </span> <span class="device_list_friendly_name_container drawerToggle"> <label> [4] </label> <span class="sliderValue sliderTextClass"> [5]</span> <span class="click_advance" data-deviceId="[0]"> <span class="drawer_icon_arrow_down iconType"> </span> </span> <label name="name_firmware_status" class="NotDetected subTitle"> [6] </label> </span> <div id="mainWrapper[0]" style="display:none;" class="mainWrap" name="mainWrapper" wemo-device-capabilities="[9]" wemo-device-groupids="[10]" wemo-device-friendly-name="[4]" wemo-device-avalibality="[11]" wemo-device-modelcode="[25]" wemo-device-manufacture="[26]"> <div id="wrapperonoff"> <input type="text" name="currentVal" id="currentVal[0]" size="3" value="[23]" style="position:relative;top:30px;right:60px;border:none;background-color:#F3F3F3;" disabled/> <div id="innerDiv2onoff[0]" class="innerDiv2onoff"> </div> </div> </div> </div> <div class="ledDrawer drawerView" id="drawer-[0]"> <div class="sliderRow"> </div> <div class="temperatureColorRow" style="display: none;" data-ttbColor="[27]"> <span class="temparatureColorPicker"></span> <span class="tempPickerLabel">[29]</span> <span class="goTempPicker"></span></div> <div class="colorPickerMainDiv" data-ttbColor="[27]" data-Color="[28]"><span class="colorPickerBox"></span> <span class="colorPickerLabel">[30]</span> <span class="goColorPicker"></span> </div> <div class="sleepFader"> [13] <div class="timer"> [31] </div> </div> <div class="firstRow"> <span class="minutesButton"> <span class="buttonTitle"> [14] </span> <span class="buttonImage" data-time="1"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [15] </span> <span class="buttonImage" data-time="10"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [16] </span> <span class="buttonImage" data-time="30"> </span> </span> <span class="minutesButton customSelector"> <span class="buttonTitle"> [17] </span> <span class="buttonImage customPicker" id="customPicker[0]" data-time="1"> [18] </span> </span> </div> <div class="secondRow"> <span class="minutesButton"> <span class="buttonTitle"> [16] </span> <span class="buttonImage" data-time="30"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [19] </span> <span class="buttonImage" data-time="45"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [20] </span> <span class="buttonImage" data-time="60"> </span> </span> </div> <div class="goSleep" data-timer="-1"> [21] </div> <div class="groupFadder"> <p class="group_bulb">[32]</p> [22] </div> </div></li>', [GroupId, overlayClass, groupIdsArr.length, iconURL, groupName, strengthStatus, firmwareUpgradeStatus, switchStateClass, CurrentState, groupCapabilities, groupDeviceID, groupDeviceAvailability, groupDeviceFriendlyname, wemo.items.sleepFader, wemo.items.oneMin, wemo.items.tenMin, wemo.items.thirtyMin, wemo.items.custom, wemo.items.enter, wemo.items.fourtyFiveMin, wemo.items.oneHour, wemo.items.goToSleep, devicelistHTML, statusdimmingVal, groupCapabilitiesVal, deviceModelCnt[0], deviceManufactCnt[0], colorTemperatureValue, colorTemperatureFlexValue, wemo.items.TempDrawerLabel, wemo.items.Color, wemo.items.Off, wemo.items.groupedBulbs]);
                            }
                            else
                            	grouplistItem += CTemplator.fitIn('<li data-depurar="8" data-category="bridge" name="group_li" wemo-device-udn="[0]" data-deviceId="[0]" data-macId="[0]" class="device_li disabled" id= "mainLIID[0]" > <div class="ledDiv"> <span class="devicesCount displayBlock" device-grpcnt="[2]"> [2] </span> <span name="name_device_icon" class="device_list_icon_container"> <img src="[3]" width="80" height="80"> </span> <span class="power_indicator_container"> <span name="name_group_state" id="[0]" wemo-device-state="disabled" class="disabled" wemo-device-state-code="3" wemo-device-friendly-name="[4]" wemo-device-capabilities="[9]" wemo-device-groupids="[10]" wemo-device-avalibality="[11]" wemo-group-device-friendlyname="[12]" wemo-device-capabilities-values="[24]" wemo-device-modelcode="[25]" wemo-device-manufacture="[26]"> <p class="bulbStrength" id="dimmingDis[0]"> [23] </p> </span> </span> <span class="device_list_friendly_name_container drawerToggle"> <label> [4] </label> <span class="sliderValue"></span> <span class="click_advance" data-deviceId="[0]"> <span class="drawer_icon_arrow_down iconType"> </span> </span> <label name="name_firmware_status" class="NotDetected subTitle"> Not Detected </label> </span> <div id="mainWrapper[0]" style="display:none;" class="mainWrap" name="mainWrapper" wemo-device-capabilities="[9]" wemo-device-groupids="[10]" wemo-device-friendly-name="[4]" wemo-device-avalibality="[11]" wemo-device-modelcode="[25]" wemo-device-manufacture="[26]"> <div id="wrapperonoff"> <input type="text" name="currentVal" id="currentVal[0]" size="3" value="[23]" style="position:relative;top:30px;right:60px;border:none;background-color:#F3F3F3;" disabled/> <div id="innerDiv2onoff[0]" class="innerDiv2onoff"> </div> </div> </div> </div> <div class="ledDrawer drawerView" id="drawer-[0]"> <div class="sliderRow"> </div> <div class="temperatureColorRow" style="display: none;" data-ttbColor="[27]"> <span class="temparatureColorPicker"></span> <span class="tempPickerLabel">[29]</span> <span class="goTempPicker"></span></div> <div class="colorPickerMainDiv" data-ttbColor="[27]" data-Color="[28]"><span class="colorPickerBox"></span> <span class="colorPickerLabel">[30]</span> <span class="goColorPicker"></span> </div> <div class="sleepFader"> [13] <div class="timer">  [31] </div> </div> <div class="firstRow"> <span class="minutesButton"> <span class="buttonTitle"> [14] </span> <span class="buttonImage" data-time="1"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [15] </span> <span class="buttonImage" data-time="10"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [16] </span> <span class="buttonImage" data-time="30"> </span> </span> <span class="minutesButton customSelector"> <span class="buttonTitle"> [17] </span> <span class="buttonImage customPicker" id="customPicker[0]" data-time="1"> [18] </span> </span> </div> <div class="secondRow"> <span class="minutesButton"> <span class="buttonTitle"> [16] </span> <span class="buttonImage" data-time="30"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [19] </span> <span class="buttonImage" data-time="45"> </span> </span> <span class="minutesButton"> <span class="buttonTitle"> [20] </span> <span class="buttonImage" data-time="60"> </span> </span> </div> <div class="goSleep" data-timer="-1"> [21] </div> <div class="groupFadder"> <p class="group_bulb">[32] </p> [22] </div> </div></li>', [GroupId, overlayClass, groupIdsArr.length, iconURL, groupName, strengthStatus, firmwareUpgradeStatus, switchStateClass, CurrentState, groupCapabilities, groupDeviceID, groupDeviceAvailability, groupDeviceFriendlyname, wemo.items.sleepFader, wemo.items.oneMin, wemo.items.tenMin, wemo.items.thirtyMin, wemo.items.custom, wemo.items.enter, wemo.items.fourtyFiveMin, wemo.items.oneHour, wemo.items.goToSleep, devicelistHTML, statusdimmingVal, groupCapabilitiesVal,  deviceModelCnt[0], deviceManufactCnt[0], colorTemperatureValue, colorTemperatureFlexValue, wemo.items.TempDrawerLabel, wemo.items.Color, wemo.items.Off, wemo.items.groupedBulbs]);
                        } else {
                            for (var j = 0; j < groupIdsArr.length; j++) {
                            	deviceIdsList.push(groupIdsArr[j].DeviceID);
                                groupdeviceslist.push(groupIdsArr[j].DeviceID);
                            }
                        }

                    }

                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.LED_GROUP_INFO, arrgroupLeds);
                    window.sessionStorage.setItem(sessionStore.LED_GROUP_DEVICE_IDS, groupdeviceslist);

                }

                //group end;
            }

        }

        $(devicelistbridge).append(listItem);
        $(devicelistbridge).append(grouplistItem);

        var checkingDisableddevices = $("#device_list_bridge_container").find("li.disabled").length;
        
        if(len != checkingDisableddevices){
        	$("#bridgeunavailable").hide();
        }
        	
        var liWidth = $(devicelistbridgelistitem).width();
        var frindlyNameWidth = liWidth - 180;
        var frindlyNameHomesenseWidth =  $(devicelisthomesenselistitem).width() - 180;
        
        $("ul li[data-category='"+sessionStore.WEMO_LINK_SUBDEVICE_TYPE+"']").find(' .device_list_friendly_name_container').css('width', frindlyNameWidth);
        $("ul li[data-category='"+sessionStore.WEMO_LINK_SUBDEVICE_HOMESENSE_TYPE+"']").find(' .device_list_friendly_name_container').css('width', frindlyNameHomesenseWidth);
        $("ul li[data-category='"+sessionStore.WEMO_LINK_SUBDEVICE_HOMESENSE_TYPE+"']").find('.iconType').hide();
        //$("ul li[data-category='"+sessionStore.WEMO_LINK_SUBDEVICE_HOMESENSE_TYPE+"']").find('.sliderValue').hide();

        wemoUtil.infoLog(device_list_bridge.TAGB, "Printing HTML ::"+grouplistItem);
        //Edit Icon Start
        console.log('isLocalRemote::' + isLocalRemote);

        if (inp == "edit") {
            $(".sliderValue").hide();
            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        }
        nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);

        if (leddevices.length > 0 && inp != "edit") {
            window.sessionStorage.setItem(sessionStorage.LED_DEVICE_LIST_ARRAY, deviceIdsList);

            setTimeout(function() {
                var devicelist1 = window.sessionStorage.getItem(sessionStorage.LED_DEVICE_LIST_ARRAY);
                device_list_bridge.getDeviceIcon(devicelist1);
            }, 500);

            if (inp != "addDeviceAfterStatus") {
                if (inp != "initialCache") {
                    setTimeout(function() {
                        var devicelist2 = window.sessionStorage.getItem(sessionStorage.LED_DEVICE_LIST_ARRAY);
                
                          if(window.sessionStorage.getItem(sessionStore.IS_UPGRADE_INPROGRESS) != "true")
                        	 device_list_bridge.multipleGetDeviceStatus(devicelist2);
                        
                    }, 500);
                }

            }
        }

        /**
         * if any LED device gets added in the Device List, update the 'isDeviceAvailable = true'
         * */
        isDeviceAvailable = true;

        //Edit Icon Start
        var isLocalRemoteEnable = window.sessionStorage.getItem(sessionStore.REMOTE_LOCAL);

        if (isRemoteEnabled == false) {
            if (($(devicelistbridgelistitem).length > 0) && (gettingCloudImage == false)) {
                gettingCloudImage = true;
                device_list_bridge.gettingCloudImage();
            } else {
                $.each(deviceIdAndImg, function(index, value) {
  
                    var arrayValue = value.split('&&');
                    var url = arrayValue[1];
                    var deviceId = arrayValue[0];
                    $("ul li[data-deviceId=" + deviceId + "]").find('.device_list_icon_container img').attr('src', url);
                    $("ul li[data-macId=" + deviceId + "]").find('.device_list_icon_container img').attr('src', url);

                });
            }
        }
        
         //Edit Icon End

    },

    pushDB: function() {
        deviceTabPlugin.execute(
            function(e) {
                console.log(e);
            },
            device_list_bridge.reportError,
            actions.PUSH_DB_TO_PLUGIN, []
        );
    },

    uploadDBOnCloud: function() {

        cordova.exec(function(params) {
            var authCode = params[0];
            var homeId = params[1];
        
            setTimeout(function() {
                deviceTabPlugin.execute(
                    function(responseAry) {
                        console.log("entering in uploadDB success");
                    },
                    function() {
                        console.log("failure DB call back...");
                        //wemoUtil.hideModal();
                    },
                    actions.STORE_DB_FROM_CLOUD, [homeId]
                );
            }, 100);

        }, function(err) {
            //wemoUtil.hideModal();
            console.log("failure call back");
        }, "WebServicePlugin", "getAuthCode", []);

    },

    setBridgeInfo: function(bridgeudn) {
   
        nativeUtilPlugin.execute(
            function() {
                console.log("entering in SetBridgeUDN success");
            },
            device_list_bridge.reportError,
            ACTION_SET_BRIDGE_DATA, [bridgeudn]
        );
    },

    faderTimerEnhancement: function(addMinutes, drawer) {
        var addMinutes = addMinutes;
        var drawer = drawer;

        if (addMinutes != -1 && addMinutes != '') {

            clearInterval(faderTimer);
            faderTimer = setInterval(function() {

                // find the amount of "seconds" between now and target
                var current_date = new Date().getTime();
                var seconds_left = (addMinutes - current_date) / 1000;
                var days, hours, minutes, seconds;
                // do some time calculations
                days = parseInt(seconds_left / 86400);
                seconds_left = seconds_left % 86400;

                hours = parseInt(seconds_left / 3600);
                seconds_left = seconds_left % 3600;

                minutes = parseInt(seconds_left / 60);
                seconds = parseInt(seconds_left % 60);

                if (minutes <= 0 && seconds <= 0) {

                    var activeButtonLength = $('#drawer-' + drawer + ' .buttonActive').attr('data-time');
                    if(activeButtonLength != undefined && activeButtonLength != -1)
                    	$('ul li[data-deviceId=' + drawer + ']').find('.timer').empty().append(wemo.items["Off"]);
                }
                else if (isNaN(minutes) || isNaN(seconds)) {

                    var activeButtonLength = $('#drawer-' + drawer + ' .buttonActive').attr('data-time');
                    if (activeButtonLength != undefined && activeButtonLength != -1)
                        $('ul li[data-deviceId=' + drawer + ']').find('.timer').empty().append(wemo.items["Off"]);

                } else if ($('ul li[data-deviceId=' + drawer + ']').find('.goSleep').attr('data-timer') == 'off') {
                    $('ul li[data-deviceId=' + drawer + ']').find('.timer').empty().append(wemo.items["Off"]);
                } else if ($('#' + drawer).hasClass('led_on')) {
                	if(minutes <= 0)
                		$('ul li[data-deviceId=' + drawer + ']').find('.timer').empty().append(seconds + 's&nbsp;' + wemo.items['remaining']);
                	else{
                		minutesStr = wemoUtil.ConvertToBase10Format(minutes);
                		secondsStr = wemoUtil.ConvertToBase10Format(seconds);
                		$('ul li[data-deviceId=' + drawer + ']').find('.timer').empty().append(minutesStr + ":" + secondsStr + '&nbsp;' + wemo.items['remaining']);
                	}
                		
                } else {
                    $('ul li[data-deviceId=' + drawer + ']').find('.timer').empty().append(wemo.items["Off"]);

                    if (minutes <= 0 && seconds <= 0) {
                        //$('ul li[data-deviceId=' + drawer + ']').find('.timer').empty().append(minutes + ":" + seconds + '&nbsp;' + wemo.items['remaining']);
                    	$('ul li[data-deviceId=' + drawer + ']').find('.timer').empty().append(seconds + '&nbsp;' + wemo.items['remaining']);
                    }

                }

            }, 1000);
        }

    },
    getActiveButton: function(activeButton) {
        var activeState = activeButton;

        if (activeState == 600) {
            activeState = 0;
        } else if (activeState == 6000) {
            activeState = 1;
        } else if (activeState == 18000) {
            activeState = 2;
        } else {
            activeState = 3;
        }

        return activeState;
    },

    checkForGrpLed: function(deviceID) {
        var grpObject;
        for (var j = 0; j < _ledDeviceCache.length; j++) {
            if (_ledDeviceCache[j].GroupID != undefined || _ledDeviceCache[j].GroupID != null) {
                if (_ledDeviceCache[j].GroupID == deviceID) {
                    grpObject = _ledDeviceCache[j];
                    return grpObject;
                }
            }
        }

        return grpObject;
    },

    isGrpAvailable: function(grpObject, ledStatusResult) {
        var isAvailable = false;

        for (var i = 0; i < grpObject.length; i++) {

            var deviceID = grpObject[i].DeviceID;
        
            for (var j = 0; j < ledStatusResult.length; j++) {
                var dev = ledStatusResult[j].DeviceIDLED;
                var availability = ledStatusResult[j].Availability;
                if (deviceID == dev) {
                    if (availability == "YES") {
                        isAvailable = true;
                        return isAvailable;
                    }
                }
            }

        }

        return isAvailable;
    },

    deleteLedFromCache: function(udn) {

        for (var j = 0; j < _ledDeviceCache.length; j++) {
            if (_ledDeviceCache[j].GroupID == undefined || _ledDeviceCache[j].GroupID == null) {
                if (_ledDeviceCache[j].DeviceID == udn) {
                    _ledDeviceCache.splice(j, 1);
                    break;
                }
            } else {
                if (_ledDeviceCache[j].GroupID == udn) {
                    _ledDeviceCache.splice(j, 1);
                    break;
                }
            }
        }

        var cacheJSON = JSON.stringify(_ledDeviceCache);
        sharedPreferences.set(sharedPreferencesConstants.WEMO_NAMESPACE, sharedPreferencesConstants.WEMO_LED_DEVICE_CACHE, cacheJSON);

    },

    clearLedCache: function() {
        _ledDeviceCache = [];
        arrCache = [];
        sharedPreferences.set(sharedPreferencesConstants.WEMO_NAMESPACE, sharedPreferencesConstants.WEMO_LED_DEVICE_CACHE, "");
    },

    getDeviceIcon: function(devicelistArr) {

        var devicelist = devicelistArr.split(",");
        
        if (iconCounter < devicelist.length) {

            var DeviceID = devicelist[iconCounter];
        
            if (!isEditMode) {

                nativeUtilPlugin.execute(function(deviceImg) {
                        if (deviceImg.length > 0) {
                            ledDeviceImg = deviceImg[0];
                            dbCloudId.push(DeviceID + '-' + deviceImg[1]);
                            deviceIcon[DeviceID] = ledDeviceImg;
                            $("ul li[data-deviceId=" + DeviceID + "]").find('.device_list_icon_container img').attr('src', ledDeviceImg);
                            $("ul li[data-macId=" + DeviceID + "]").find('.device_list_icon_container img').attr('src', ledDeviceImg);
                            device_list_bridge.getDeviceIcon(devicelistArr);
                            iconCounter++;
                        } else {
                            device_list_bridge.getDeviceIcon(devicelistArr);
                            iconCounter++;
                        }
                        
                    },
                    function() {
                        console.log('error');
                        device_list_bridge.getDeviceIcon(devicelistArr);
                        iconCounter++;
                    },
                    ACTION_GET_LED_IMAGE_FROM_DB, [DeviceID]
                );

            }

        } else {
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.DEVICE_LED_ICON, deviceIcon);
        }

    },

    updateLedCache: function(deviceID, deviceObject) {
        for (var j = 0; j < _ledDeviceCache.length; j++) {
            if (_ledDeviceCache[j].GroupID == undefined || _ledDeviceCache[j].GroupID == null) {
                if (_ledDeviceCache[j].DeviceID == deviceID) {
                    _ledDeviceCache[j] = deviceObject;
                    break;
                }
            } else {
                if (_ledDeviceCache[j].GroupID == deviceID) {
                    _ledDeviceCache[j] = deviceObject;
                    break;
                }
            }
        }
        var cacheJSON = JSON.stringify(_ledDeviceCache);
        sharedPreferences.set(sharedPreferencesConstants.WEMO_NAMESPACE, sharedPreferencesConstants.WEMO_LED_DEVICE_CACHE, cacheJSON);
    },

    getDeviceFromCache: function(deviceID) {
        for (var j = 0; j < _ledDeviceCache.length; j++) {
            if (_ledDeviceCache[j].GroupID == undefined || _ledDeviceCache[j].GroupID == null) {
                if (_ledDeviceCache[j].DeviceID == deviceID) {
                    return _ledDeviceCache[j];
                }
            } else {
                if (_ledDeviceCache[j].GroupID == deviceID) {
                    return _ledDeviceCache[j];
                }
            }
        }
    },
    reloadLedDevices: function() {
    	$(devicelistbridge).empty();
    	if(!isRemoteEnabled){
    		counterCall = 0;
    		device_list_bridge.loadBridgeDevicesFromUpNp("");
    	}
    },
    loadLedDevices: function() {
        counterCall = 0;
        device_list_bridge.loadBridgeDevicesFromUpNp("");
    },
    multipleGetDeviceStatus: function(devicelistArr) {
    	/******** Get Device Status **************/

    	setTimeout(function() {
    		devicePlugin.execute(function(responceStatus) {

    		},
    		device_list_bridge.reportError,
    		ACTION_GET_LED_STATUS, [devicelistArr]
    		);
    	}, 100);

    },
    showLEDDeviceSpinner: function(devicearr) {
        for (var i = 0; i < devicearr.length; i++) {
        	if (!isEditMode) {
                var ID = devicearr[i];

                if (jQuery.inArray(ID, groupdeviceslist) == -1) {
                    var presentClass = $("#" + ID).attr("class");

                    if (ledDeviceLoadingStatus.Devices[ID] == undefined) {
                        ledDeviceLoadingStatus.Devices[ID] = {};
                    }
                    ledDeviceLoadingStatus.Devices[ID].isLoadAnimation = true;
                    if (ledDeviceLoadingStatus.Devices[ID] != undefined && ledDeviceLoadingStatus.Devices[ID].isLoadAnimation == true) {
                        
                        if ($.trim(presentClass) == "led_on") {
                            $("#" + ID).removeClass(presentClass);
                            $("#" + ID).addClass("loading_animation ledanimatedHelperOn");
                            var idObj=$("#" + ID);
                            animationLED = $("#" + ID).animatePNG("../img/power_button/animation_160@.png", 81, 81, 11, {
                                horizontal: false
                            });
                        } else if ($.trim(presentClass) == "led_off") {
                            $("#" + ID).removeClass(presentClass);
                            $("#" + ID).addClass("loading_animation ledanimatedHelperOff");
                            animationLED = $("#" + ID).animatePNG("../img/power_button/animation_160@.png", 81, 81, 11, {
                                horizontal: false
                            });
                        }
                    }

                }
            }
        }
        setTimeout(function() {
        	for (var i = 0; i < devicearr.length; i++) {
        		if (!isEditMode) {
        			var ID = devicearr[i];

        			if (jQuery.inArray(ID, groupdeviceslist) == -1) {
        				console.log("Class " + $("#" + ID).attr('class'));
        				var presentClass = "";

        				if ($("#" + ID).hasClass('ledanimatedHelperOn')) {
        					presentClass = 'led_on';
        					$("#" + ID).find('.animation').remove();
        					$("#" + ID).removeClass('loading_animation');
        					$("#" + ID).removeClass();
        					$("#" + ID).addClass(presentClass);
        				} else if ($("#" + ID).hasClass('ledanimatedHelperOff')) {
        					presentClass = 'led_off';
        					$("#" + ID).find('.animation').remove();
        					$("#" + ID).removeClass('loading_animation');
        					$("#" + ID).removeClass();
        					$("#" + ID).addClass(presentClass);
        				}

        			}

        		}
        	}
        }, timeout.LED_GET_DEVICE_STATUS);
    },
    multipleGetDeviceResponse: function(result) {
    	wemoUtil.infoLog(device_list_bridge.TAGB, "multipleGetDeviceResponse ::"+JSON.stringify(result));
    	var devicelistarr = window.sessionStorage.getItem(sessionStorage.LED_DEVICE_LIST_ARRAY);
        devicelistarr = devicelistarr.split(",");

        for (var i = 0; i < devicelistarr.length; i++) {
            if (!isEditMode) {
                var ID = devicelistarr[i];

                if (jQuery.inArray(ID, groupdeviceslist) == -1) {
                    var presentClass = "";

                    if ($("#" + ID).hasClass('ledanimatedHelperOn')) {
                        presentClass = 'led_on';
                        $("#" + ID).find('.animation').remove();
                        $("#" + ID).removeClass('loading_animation');
                        $("#" + ID).removeClass();
                        $("#" + ID).addClass(presentClass);
                    } else if ($("#" + ID).hasClass('ledanimatedHelperOff')) {
                        presentClass = 'led_off';
                        $("#" + ID).find('.animation').remove();
                        $("#" + ID).removeClass('loading_animation');
                        $("#" + ID).removeClass();
                        $("#" + ID).addClass(presentClass);
                    }

                }

            }
        }
        
        if (result != undefined) {
        	
            for (var counter = 0; counter < result.length; counter++) {
                clearInterval(LEDDeviceStatusNotification);
                var capabilityid = '';
                var Capabilityvalue = '';
                var addMinutes = '';
                var activeButton = '';
                var dev = $.trim(result[counter].DeviceIDLED);
                var availability = result[counter].Availability;
                var modelcode = "";
                if($("#" + dev).attr('wemo-device-modelcode') != undefined){
                	var modelcode = $("#" + dev).attr('wemo-device-modelcode').toUpperCase();
                }
                

                if (jQuery.inArray(dev, groupdeviceslist) == -1) {

                	if(jQuery.inArray(modelcode, homeSensemodelcodes) != -1){
                		var capabilityidhomesense = result[counter].capabilityid;
                		var CapabilityvaluehomeSense = $.trim(result[counter].capabilityvalue);
                		var capabilitiesIDVal = wemoUtil.mappingCapabilityIDwithValue(capabilityidhomesense, CapabilityvaluehomeSense);
                			
                			$("#mainLIID" + dev).removeClass('disabled');
                		 	$("#" + dev).removeClass('disabled');
                		 	$("#mainLIID" + dev).find('.NotDetected').text('');
                		 	$("#mainLIID" + dev).find('.bulbStrength').removeClass('bulbStrength');
                            $("#mainLIID" + dev).find('.sliderValue').show();
                            $("#dimmingDis" + dev).hide();
                            
                            var tempObject = device_list_bridge.getDeviceFromCache(dev);
                            if (tempObject != undefined) {
                                if (tempObject.isRendered == false) {
                                    tempObject.isRendered = true;
                                    tempObject.InActive = 1;
                                    device_list_bridge.updateLedCache(dev, tempObject);
                                    device_list_bridge.ledDeviceRendering(_ledDeviceCache, "addDeviceAfterStatus");
                                }
                            }
                             
                			if(modelcode == homeSenseModelCodes.ALARM){
                				if(capabilitiesIDVal[homeSenseCapabilities.ONOFF] % 10 == statusCode.ON){
                					$("#" + dev).addClass('alarmDetectedIcon');
                        			$("#mainLIID" + dev).find('.sliderValue').text(wemo.items['AlarmDeviceActiveStatus']);
                        			$("#mainLIID" + dev).find('.sliderValue').addClass("alarmDetectedTxtColor");
                        			$("#" + dev).attr('wemo-device-state-code', statusCode.ON);
                				}else{
                					$("#" + dev).removeClass('alarmDetectedIcon');
                        			$("#mainLIID" + dev).find('.sliderValue').val(wemo.items['AlarmDeviceInActiveStatus']);
                        			$("#mainLIID" + dev).find('.sliderValue').removeClass(".alarmDetectedTxtColor");
                        			$("#" + dev).attr('wemo-device-state-code', statusCode.OFF);
                				}
                				
                			}
                			if(modelcode == homeSenseModelCodes.KEYFOB){
                				if(capabilitiesIDVal[homeSenseCapabilities.ONOFF] % 10 == statusCode.ON){
                					if(result[counter].lastEventTimeStamp != 0 && result[counter].lastEventTimeStamp != ""){
                						var timeinmilisecs = result[counter].lastEventTimeStamp;
                						var timeinAMPM = wemoUtil.getMotionSenseTimeMsg(new Date(parseInt(timeinmilisecs) * 1000));
                						$("#mainLIID" + dev).find('.sliderValue').text(timeinAMPM);
                					}else{
                						var timeinmilisecs = wemoUtil.convertTimeToMilliseconds("");
                						var timeinAMPM =  wemoUtil.convertMillisecondsToAMPM(timeinmilisecs);
                						$("#mainLIID" + dev).find('.sliderValue').text(wemo.items['FobDeviceActiveStatus']+" "+timeinAMPM);
                					}
                		        	
                                	$("#" + dev).removeClass('fobAwayIcon');
                                	$("#" + dev).addClass('fobIcon');
                                	$("#" + dev).attr('wemo-device-state-code', statusCode.ON);
                				}else{
                					if(result[counter].lastEventTimeStamp != 0 && result[counter].lastEventTimeStamp != ""){
                						var timeinmilisecs = result[counter].lastEventTimeStamp;
                						var timeinAMPM = wemoUtil.getMotionSenseTimeMsg(new Date(parseInt(timeinmilisecs) * 1000));
                						$("#mainLIID" + dev).find('.sliderValue').text(timeinAMPM);
                					}else{
                						var timeinmilisecs = wemoUtil.convertTimeToMilliseconds("");
                						var timeinAMPM =  wemoUtil.convertMillisecondsToAMPM(timeinmilisecs);
                						$("#mainLIID" + dev).find('.sliderValue').text(wemo.items['FobDeviceInActiveStatus']+" "+timeinAMPM);
                					}
                		
                					$("#" + dev).removeClass('fobIcon');
                                	$("#" + dev).addClass('fobAwayIcon');
                                	$("#" + dev).attr('wemo-device-state-code', statusCode.OFF);
                				}
                				
                         	}
                			if(modelcode == homeSenseModelCodes.PIR){
                				if(capabilitiesIDVal[homeSenseCapabilities.ONOFF] % 10 == statusCode.ON){
                					
                					if(result[counter].lastEventTimeStamp != 0 && result[counter].lastEventTimeStamp != ""){
                						var timeinmilisecs = result[counter].lastEventTimeStamp;
                						var timeinAMPM = wemoUtil.getMotionSenseTimeMsg(new Date(parseInt(timeinmilisecs) * 1000));
                						$("#mainLIID" + dev).find('.sliderValue').text(timeinAMPM);
                					}else{
                						var timeinmilisecs = wemoUtil.convertTimeToMilliseconds("");
                						var timeinAMPM =  wemoUtil.convertMillisecondsToAMPM(timeinmilisecs);
                						$("#mainLIID" + dev).find('.sliderValue').text(wemo.items['Devices_Remote_MotionSensed']+" "+timeinAMPM);
                					}
                		        	
                                	$("#mainLIID" + dev).find('.sliderValue').addClass('LedBrihtnesscolorChange');
                				}else{
                					
                					if(result[counter].lastEventTimeStamp != 0 && result[counter].lastEventTimeStamp != ""){
                						var timeinmilisecs = result[counter].lastEventTimeStamp;
                						var timeinAMPM = wemoUtil.getMotionSenseTimeMsg(new Date(parseInt(timeinmilisecs) * 1000));
                						$("#mainLIID" + dev).find('.sliderValue').text(timeinAMPM);
                					}else{
                						var timeinmilisecs = wemoUtil.convertTimeToMilliseconds("");
                						var timeinAMPM =  wemoUtil.convertMillisecondsToAMPM(timeinmilisecs);
                						$("#mainLIID" + dev).find('.sliderValue').text(wemo.items['PirMotionSensed']+" "+timeinAMPM);
                					}
                					
                			     	$("#mainLIID" + dev).find('.sliderValue').removeClass('LedBrihtnesscolorChange');
                    			}
                				if(capabilitiesIDVal[homeSenseCapabilities.SENSORENABLEDISABLE] == statusCode.ON){
                					$("#" + dev).removeClass('homesense_off');
                			    	$("#" + dev).addClass('homesense_on');
                			    	$("#" + dev).attr('wemo-device-state-code', statusCode.ON);
                				}else{
                					$("#" + dev).removeClass('homesense_on');
                					$("#" + dev).addClass('homesense_off');
                					$("#" + dev).attr('wemo-device-state-code', statusCode.OFF);
                				}
                				
                         	}
                			if(modelcode == homeSenseModelCodes.DOORWINDOWS){
                				if(capabilitiesIDVal[homeSenseCapabilities.SENSORENABLEDISABLE] == statusCode.ON){
                					$("#" + dev).removeClass('homesense_off');
                			    	$("#" + dev).addClass('homesense_on');
                			    	$("#" + dev).attr('wemo-device-state-code', statusCode.ON);
                				}else{
                					$("#" + dev).removeClass('homesense_on');
                					$("#" + dev).addClass('homesense_off');
                					$("#" + dev).attr('wemo-device-state-code', statusCode.OFF);
                				}
                				
                         	}
                		
                	}else{
                        var grpObject = device_list_bridge.checkForGrpLed(dev);
                        if (grpObject != undefined) {
                            var grpAvailablity = device_list_bridge.isGrpAvailable(grpObject.GroupIDS, result);
                            if (grpAvailablity == false) {
                                result[counter].Availability = "NO";
                                availability = "NO";
                            }
                        }
                        if (ledDeviceLoadingStatus.Devices[dev] != undefined) {
                            ledDeviceLoadingStatus.Devices[dev].isLoadAnimation = false;
                        }
            
                        var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
                        capabilityid = result[counter].capabilityid; //Check for 30008
                        Capabilityvalue = $.trim(result[counter].capabilityvalue); //Check for timer value
                        $("#" + dev).attr('wemo-device-capabilities', capabilityid);

                        if (capabilityid != undefined) {
                            capabilityid = capabilityid.split(',');
                            Capabilityvalue = Capabilityvalue.split(',');

                            $.each(capabilityid, function(i, v) {
                                if (capabilityid[i].indexOf('30008') != -1) {
                                    var activeTime = Capabilityvalue[i].split(':');

                                    addMinutes = activeTime[1] * 1000;
                                    activeButton = activeTime[0];

                                }
                            });
                        }

                        var activeState = device_list_bridge.getActiveButton(activeButton);
                        var min = parseInt(activeButton) / parseInt(600);
                        var addMinutes = parseInt(addMinutes) + parseInt((min * 60000));

                        if (addMinutes != undefined && activeState != undefined) {

                            var activeButtons = Math.round(activeState) + '&&' + addMinutes;

                            devicePlugin.execute(
                                function(param) {
                                	wemoUtil.infoLog(device_list_bridge.TAGB, "fader value saved getdevicestatus ::"+param);
                                },
                                device_list_bridge.reportError,
                                ACTION_SET_SHAREDPREF_FADER_TIME, [dev, activeButtons]
                            );
                        }

                        if (availability == ledDeviceConstants.NO) {
                            if (!isEditMode) {
                                var tempObject = device_list_bridge.getDeviceFromCache(dev);
                                if (tempObject != undefined) {
                                    tempObject.InActive = 3;
                                    //device_list_bridge.updateLedCache(dev, tempObject);
                                    device_list_bridge.removeLed(dev);

                                }
                                console.log(" dev :: NO" + dev);
                                if (animationLED != undefined) {
                                    $.fn.animatePNG.stop(animationLED);
                                    clearInterval(animationLED);
                                }
                                $("#" + dev).find('.animation').remove();
                                $("#mainLIID" + dev).removeClass('led_list');
                                $("#mainLIID" + dev).removeClass('led_group');
                                $("#mainLIID" + dev).addClass('disabled');
                                $("#" + dev).removeClass('loading_animation');
                                $("#" + dev).removeClass();
                                $("#" + dev).attr('wemo-device-state-code', '3');
                                $("#" + dev).find('.bulbStrength').hide();
                                $("#mainLIID" + dev).find('.sliderValue').hide();
                                $("#mainLIID" + dev).find('.NotDetected').text('Not Detected');
                                $("#" + dev).attr('wemo-device-state', 'disabled');

                            	var device_led_array = window.sessionStorage.getItem(sessionStore.LED_DEVICE_FIRMWARE_ARRAY);
                            	device_led_array = JSON.parse(device_led_array);
                            	
                            	for(var i=0;i<device_led_array.length;i++)
                            	{
                                	 if(device_led_array[i].udn == dev)
    	                        		 device_led_array.splice(i,1);
    	                    	}
                 
                            	window.sessionStorage.setItem(sessionStore.LED_DEVICE_FIRMWARE_ARRAY, JSON.stringify(device_led_array));
                            	window.sessionStorage.setItem(sessionStore.LED_DEVICE_FIRMWARE_ARRAY_VERSION, JSON.stringify(device_led_array));
                            }

                        } else {
                            var tempObject = device_list_bridge.getDeviceFromCache(dev);
                            if (tempObject != undefined) {
                                if (tempObject.isRendered == false) {
                                    tempObject.isRendered = true;
                                    tempObject.InActive = 1;
                                    device_list_bridge.updateLedCache(dev, tempObject);
                                    device_list_bridge.ledDeviceRendering(_ledDeviceCache, "addDeviceAfterStatus");
                                }
                            }
                            var state = $.trim(result[counter].capabilityvalue);
                            var StateArr = state.split(",");
                            var CurrentState = StateArr[0];
                            var SplitDimmingArr = $.trim(StateArr[1]).split(":");
                            var CurrentDimmingVal = (SplitDimmingArr[0] * 100) / (AllowedVal);
                            var strengthStatus = Math.ceil(CurrentDimmingVal) + "%";
                            var temp = Math.round(CurrentDimmingVal);

                            $("#currentVal" + dev).val(CurrentDimmingVal);
                            $('#slider-' + dev).val(temp);
                            
                            if(window.sessionStorage.getItem(sessionStore.IS_UPGRADE_INPROGRESS) != "true")
                            	$("ul li[data-deviceid=" + dev + "]").find('.sliderValue').text(strengthStatus);
                            
                            
                            $("#dimmingDis" + dev).html(strengthStatus);
                            $("#" + dev).find('.bulbStrength').show();
                            $("#mainLIID" + dev).find('.sliderValue').show();

                            if (animationLED != undefined) {
                                $.fn.animatePNG.stop(animationLED);
                                clearInterval(animationLED);
                            }
                            $("#" + dev).find('.animation').remove();
                            $("#" + dev).removeClass('loading_animation');

                            if (CurrentState != "" && CurrentState != undefined) {
                                $("#mainLIID" + dev).removeClass('disabled');
                                $("#" + dev).attr('wemo-device-state-code', CurrentState);
                                var newClass = device_list_bridge.getBinaryStateImage(CurrentState);
                                
                                if(window.sessionStorage.getItem(sessionStore.IS_UPGRADE_INPROGRESS) != "true")
                                	$("#mainLIID" + dev).find('.NotDetected').hide();
                                
                                if (!isEditMode) {
                                	var currentClass = $("#" + dev).attr('class');
                                	if(currentClass.indexOf('led_value_loading') == -1)
                                	{
                                		 $("#" + dev).removeClass();
                                         $("#" + dev).addClass(newClass);
                                	}
                                   
                                }

                                $("#" + dev).attr('wemo-device-state', newClass);
                                var currentClass = $("#" + dev).attr('class');

                                if (CurrentState == "1" && currentClass.indexOf('led_value_loading') == -1)
                                    $("#mainLIID" + dev).find('.sliderValue').addClass('LedBrihtnesscolorChange');

                            } else {
                                $("#mainLIID" + dev).removeClass('led_list');
                                $("#mainLIID" + dev).removeClass('led_group');
                                $("#mainLIID" + dev).addClass('disabled');
                                $("#" + dev).removeClass('loading_animation');
                                $("#" + dev).removeClass();
                                $("#" + dev).attr('wemo-device-state-code', '3');
                                $("#" + dev).find('.bulbStrength').hide();
                                $("#mainLIID" + dev).find('.sliderValue').hide();
                                $("#mainLIID" + dev).find('.NotDetected').text('Not Detected');
                            }

                        }
                	}

                } else {
                    if (availability == ledDeviceConstants.NO) {
                    	
                    	var device_led_array = window.sessionStorage.getItem(sessionStore.LED_DEVICE_FIRMWARE_ARRAY);
                    	device_led_array = JSON.parse(device_led_array);
                    	
                    	for(var i=0;i<device_led_array.length;i++)
                    	{
                        	 if(device_led_array[i].udn == dev)
                        		 device_led_array.splice(i,1);
                    	}
         
                    	window.sessionStorage.setItem(sessionStore.LED_DEVICE_FIRMWARE_ARRAY, JSON.stringify(device_led_array));
	                	groupdeviceslist[dev] = "NO";
                        var groupDeviceInfo = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_GROUP_INFO);

                        if (groupDeviceInfo != undefined && groupDeviceInfo != "") {
                            var groupID = "";
                            var grpCnt = "";

                            for (var j = 0; j < groupDeviceInfo.length; j++) {
                                groupID = groupDeviceInfo[j].groupid;
                                grpCnt = $("#mainLIID" + groupID).find('.devicesCount').attr('device-grpcnt');

                                if (groupDeviceInfo[j].deviceid == dev) {
                                    grpCnt = parseInt(grpCnt) - 1;
                                    $("#mainLIID" + groupID).find('.devicesCount').attr('device-grpcnt', grpCnt);
                                    groupDeviceInfo[j].availability = "NO";
                                    //var parentDivexistingTxt = $("ul li[data-deviceid="+groupID+"]").find('.unavailableText').text();
                                    var childDivexistingTxt = $("#" + dev).text();
                                    $("ul li[data-deviceid=" + groupID + "]").find('.unavailableText').text('');
                                    $("ul li[data-deviceid=" + groupID + "]").find('.sliderValue').append("  <span class='unavailableText'>" + wemo.items['unavailableBulb'] + "</span>");

                                    if (childDivexistingTxt.indexOf("unavailable") == -1) {
                                        $("#" + dev).append(" unavailable");
                                        $("#" + dev).addClass('disabled');
                                        unavailableDevicelist.push(groupDeviceInfo[j].deviceid);
                                    }

                                }

                                if (grpCnt == 0) {
                                    $("#mainLIID" + groupID).removeClass('led_group');
                                    $("#mainLIID" + groupID).addClass('disabled');
                                    $("#" + groupID).attr('wemo-device-state-code', '3');
                                    $("#" + groupID).removeClass('loading_animation');
                                    $("#" + groupID).removeClass();
                                    $("#" + groupID).find('.bulbStrength').hide();
                                    $("#mainLIID" + groupID).find('.sliderValue').hide();
                                    $("#mainLIID" + groupID).find('.NotDetected').text('Not Detected');
                                }

                            }

                        }


                        window.sessionStorage.setItem(sessionStorage.LED_DEVICE_AVAILABILITY_LIST, unavailableDevicelist);
                    }
                    
                    if (availability == ledDeviceConstants.YES){
                    	var groupDeviceInfo = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_GROUP_INFO);
                    	var capabilityidhomesense = result[counter].capabilityid;
                		var CapabilityvaluehomeSense = $.trim(result[counter].capabilityvalue);
                		var capabilitiesIDVal = wemoUtil.mappingCapabilityIDwithValue(capabilityidhomesense, CapabilityvaluehomeSense);
                		var cnt = 0;
	                    	 for (var j = 0; j < groupDeviceInfo.length; j++) {
	                             groupID = groupDeviceInfo[j].groupid;
	                     	 	
	                             $("#mainLIID" + groupID).removeClass('disabled');
		                         $("#mainLIID" + groupID).addClass('led_group');
	                             
	                             if($("#"+groupID).attr('wemo-device-modelcode') != undefined){
	                            	 modelcode = $("#"+groupID).attr('wemo-device-modelcode').toUpperCase();
	                             }
	                             
	                             if(modelcode == homeSenseModelCodes.DOORWINDOWS && capabilitiesIDVal[homeSenseCapabilities.ONOFF] == statusCode.OFF){
	                            	 var devicestatus = $("#"+groupID).attr('wemo-device-status-opencls');
	                            	 var openclsstatus = $("#"+groupID).attr('wemo-device-openclose-status');
	                            	 openclsstatus+= dev+":"+statusCode.OFF+",";
	                            	 $("#"+groupID).attr('wemo-device-openclose-status', openclsstatus);
	                            	 
	                                 if (groupDeviceInfo[j].deviceid == dev) {
	                                	 cnt = parseInt(devicestatus)+1;
	                                 }
		                         }else if(modelcode == homeSenseModelCodes.DOORWINDOWS && capabilitiesIDVal[homeSenseCapabilities.ONOFF] == statusCode.ON){
		                        	 var openclsstatus = $("#"+groupID).attr('wemo-device-openclose-status');
		                        	 openclsstatus+= dev+":"+statusCode.ON+",";
	                            	 $("#"+groupID).attr('wemo-device-openclose-status', openclsstatus);
		                         }
	                             
	                         }
	                    	 
	                    	 $("#"+groupID).attr('wemo-device-status-opencls', cnt);
	                    	 if (cnt > 0) {
	                    		 $("ul li[data-deviceid=" + groupID + "]").find('.sliderValue').text(cnt+" "+wemo.items['DoorWindowsMsg']);
                             }
                		
	                    	 window.sessionStorage.setItem(sessionStore.LED_HOMESENSE_GROUP_INDIVI_STATUS, $("#"+groupID).attr('wemo-device-openclose-status'));
	                    	 
                    }

                }

            }
            
            isLEDDeviceAvailable = true;
        }
        
    },
    isLedFirmware: function(leddevices) {

        var leddevices = JSON.parse(leddevices);
        var deviceLength = leddevices.length;
        var device_led_array = new Array();
        var group_device_led_array = new Array();
        var tmpWeMoLEDDevice = {};
        var device_led_version_array = new Array();
        var group_device_led_version_array = new Array();

        for (var i = 0; i < deviceLength; i++) {
            var deviceId = leddevices[i].DeviceID;
            var groupId = leddevices[i].GroupID;
            var firmwareVersion = leddevices[i].FirmwareVersion;
            var state = $.trim(leddevices[i].CurrentState);
            tmpWeMoLEDDevice = {};
            
            var searchType = state.search(",");
            var CurrentState = "";

            if (searchType != -1 || searchType == true) {
            	var StateArr = state.split(",");
                CurrentState = StateArr[0];
                var SplitDimmingArr = $.trim(StateArr[1]).split(":");
                CurrentDimmingVal = SplitDimmingArr[0];

            }
            
            if (deviceId != undefined && deviceId != null) {
                
                if (leddevices[i].ModelCode != undefined) {
                    var modelCode = leddevices[i].ModelCode;
                    tmpWeMoLEDDevice.udn = deviceId
                    tmpWeMoLEDDevice.friendlyName = leddevices[i].FriendlyName;
                    tmpWeMoLEDDevice.devicefirmware = leddevices[i].FirmwareVersion;
                    tmpWeMoLEDDevice.type = leddevices[i].ModelCode;
                    tmpWeMoLEDDevice.macAddress = deviceId;
                    tmpWeMoLEDDevice.pluginId = "";
	            
                    if(CurrentState == 1 || CurrentState == 0){
                    	 //model code for OSRAM Sylvania as fw ota update is not supported for this product.
                    	if(modelCode.indexOf(ledModelcode.OSRAM) == -1){
                    		 device_led_array.push(tmpWeMoLEDDevice);
                    	}
                    	device_led_version_array.push(tmpWeMoLEDDevice);
                    }
                     
                } else {
                    tmpWeMoLEDDevice.udn = deviceId
                    tmpWeMoLEDDevice.friendlyName = leddevices[i].FriendlyName;
                    tmpWeMoLEDDevice.devicefirmware = leddevices[i].FirmwareVersion;
                    tmpWeMoLEDDevice.type = ledModelcode.LED;
                    tmpWeMoLEDDevice.macAddress = deviceId;
                    tmpWeMoLEDDevice.pluginId = "";
                    
                    if(CurrentState == 1 || CurrentState == 0){
                    	device_led_array.push(tmpWeMoLEDDevice);
                    	device_led_version_array.push(tmpWeMoLEDDevice);
                    }
                    	
                }

            }
            if (groupId != undefined && groupId != null) {

                var groupLength = leddevices[i].GroupIDS.length;
                var groupArray = leddevices[i].GroupIDS;
                groupedDevices = {};
                groupedDevices.groupName = leddevices[i].GroupName;
                groupedDevices.groupId = leddevices[i].GroupID;
                groupedDevices.devices = leddevices[i].GroupIDS;
                for (var j = 0; j < groupLength; j++) {
                    tmpWeMoLEDDevice = {};
                    
                    if (groupArray[j].ManufacturerName != undefined) {
                        var manufacturer = groupArray[j].ManufacturerName;
                            tmpWeMoLEDDevice.udn = groupArray[j].DeviceID;
                            tmpWeMoLEDDevice.friendlyName = groupArray[j].FriendlyName;
                            tmpWeMoLEDDevice.devicefirmware = groupArray[j].FirmwareVersion;
                            tmpWeMoLEDDevice.type = groupArray[j].ModelCode;
                            tmpWeMoLEDDevice.macAddress = groupArray[j].DeviceID;
                            tmpWeMoLEDDevice.pluginId = "";
                            
                            if(CurrentState == 1 || CurrentState == 0){

	                           	if (tmpWeMoLEDDevice.type.indexOf(ledModelcode.OSRAM) == -1) {
	                           		group_device_led_array.push(tmpWeMoLEDDevice);
	                           	}
                            }
                            	
            
                    } else {
                        tmpWeMoLEDDevice.udn = groupArray[j].DeviceID;
                        tmpWeMoLEDDevice.friendlyName = groupArray[j].FriendlyName;
                        tmpWeMoLEDDevice.devicefirmware = groupArray[j].FirmwareVersion;
                        tmpWeMoLEDDevice.type = ledModelcode.LED;
                        tmpWeMoLEDDevice.macAddress = groupArray[j].DeviceID;
                        tmpWeMoLEDDevice.pluginId = "";
                        
                        if(CurrentState == 1 || CurrentState == 0){
                        	group_device_led_array.push(tmpWeMoLEDDevice);
                        }
                        	

                    }


                }
                group_device_led_version_array.push(groupedDevices);	

            }

        }

        var device_led_array = device_led_array.concat(group_device_led_array);
        var device_led_version_array = device_led_version_array.concat(group_device_led_version_array);
        window.sessionStorage.setItem(sessionStore.LED_DEVICE_FIRMWARE_ARRAY, JSON.stringify(device_led_array));
        window.sessionStorage.setItem(sessionStore.LED_DEVICE_FIRMWARE_ARRAY_VERSION, JSON.stringify(device_led_version_array));
        //isLEDDeviceAvailable = true;

    },

    removeLed: function(udn) {
        deviceTabPlugin.execute(
            function(message) {
                console.log("removeLed()::  message: " + JSON.stringify(message)+'---'+udn);
            },
            device_list_bridge.reportLedRemoveError,
            actions.REMOVE_LED_DEVICE, [udn]
        );
    },
    
    homeSenseModelcodeArrConvertion: function(homeSenseModelCodes){
    	$.each(homeSenseModelCodes, function(i, val) {
    		homeSensemodelcodes.push(val);
        });
    },
    
    homeSenseManufacturerArrConvertion: function(ledManufacturerName){
    	$.each(ledManufacturerName, function(i, val) {
    		ledmanufacturercodes.push(val);
        });
    },
    
    LedModelcodeArrConvertion: function(ledModelcode){
    	$.each(ledModelcode, function(i, val) {
    		ledmodelcodes.push(val);
        });
    },
    
    
    setColor : function(reqtype, currID, groupID, colorValue){
    	var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
    	var dimmingvalue = sessionStore.LED_DEFAULT_BRIGHTNESS;
        var devlist = "";
        var inputArr = "";
        var capabilities = ledCapabilities.ONOFF+","+ledCapabilities.DIMMING+","+ledCapabilities.FADER+","+ledCapabilities.COLOR;
        var modelcode = "";
        var deviceID = "";
        var fadervalue = statusCode.OFF+":"+statusCode.OFF;
        
           if (reqtype == ledDeviceConstants.SINGLE) {
        	   modelcode = $("#"+currID).attr('wemo-device-modelcode');
               devlist = [currID];
               deviceID = currID;
               var ledDeviceType = wemoUtil.ledBulbType(modelcode);
               dimmingvalue = $("#mainLIID" + deviceID).find('.sliderValue').text();
               
               if(dimmingvalue.indexOf("%") == -1) {
            	    dimmingvalue = $("#" + deviceID).find('.bulbStrength').text();
               }
   
               dimmingvalue = dimmingvalue.replace(/%$/, '');
               dimmingvalue = (dimmingvalue * AllowedVal) / 100;
               dimmingvalue = Math.floor(dimmingvalue);
               dimmingvalue = dimmingvalue+":"+statusCode.OFF;
               var currentVal = statusCode.ON+","+dimmingvalue+","+fadervalue+","+colorValue+":"+statusCode.OFF;
            
               if(wemoUtil.isColoredandTemperaturedBulb(ledDeviceType)){
	        	   currentVal = statusCode.ON+","+dimmingvalue+","+fadervalue+","+statusCode.OFF+","+colorValue+":"+statusCode.OFF;
               	   capabilities = ledCapabilities.ONOFF+","+ledCapabilities.DIMMING+","+ledCapabilities.FADER+","+ledCapabilities.TEMPERATURE+","+ledCapabilities.COLOR;
	           }
               
               inputArr = [currentVal,capabilities , "NO"];
           } else if (reqtype == ledDeviceConstants.GROUP) {
        	   modelcode = $("#"+groupID).attr('wemo-device-modelcode');
               devlist = [groupID];
               deviceID = groupID;
               var ledDeviceType = wemoUtil.ledBulbType(modelcode);
               dimmingvalue = $("#mainLIID" + deviceID).find('.sliderValue').text();
               
               if(dimmingvalue.indexOf("%") == -1) {
           	    	dimmingvalue = $("#" + deviceID).find('.bulbStrength').text();
               }
               
               dimmingvalue = dimmingvalue.replace(/%$/, '');
               dimmingvalue = (dimmingvalue * AllowedVal) / 100;
               dimmingvalue = Math.floor(dimmingvalue);
               dimmingvalue = dimmingvalue+":"+statusCode.OFF;
               var currentVal = statusCode.ON+","+dimmingvalue+","+fadervalue+","+colorValue+":"+statusCode.OFF;
               
               if(wemoUtil.isColoredandTemperaturedBulb(ledDeviceType)){
            	   currentVal = statusCode.ON+","+dimmingvalue+","+fadervalue+","+statusCode.OFF+","+colorValue+":"+statusCode.OFF;
               	   capabilities = ledCapabilities.ONOFF+","+ledCapabilities.DIMMING+","+ledCapabilities.FADER+","+ledCapabilities.TEMPERATURE+","+ledCapabilities.COLOR;
	           }
               
               inputArr = [currentVal,capabilities, "YES"];
           }
           
           devicePlugin.execute(
               function(response) {
            	   wemoUtil.infoLog(device_list_bridge.TAGB,"Response :: "+ JSON.stringify(response));
            	   device_list_bridge.changeLEDStateClass(deviceID,"1");
            	   var capabilityids = $("#"+deviceID).attr('wemo-device-capabilities');
            	   var capabilityval = $("#"+deviceID).attr('wemo-device-capabilities-values');
            	   var capabilitiesIDVal = wemoUtil.mappingCapabilityIDwithCurrentValue(capabilityids,capabilityval,ledCapabilities.COLOR,colorValue+":0");
            	   $("#"+deviceID).attr('wemo-device-capabilities-values', capabilitiesIDVal);
            	   capabilityval = capabilitiesIDVal;
            	   var capabilitiesIDVal = wemoUtil.mappingCapabilityIDwithCurrentValue(capabilityids,capabilityval,ledCapabilities.TEMPERATURE,"0");
            	   $("#"+deviceID).attr('wemo-device-capabilities-values', capabilitiesIDVal);
            	   device_list_bridge.cancelSleepFader(deviceID);
               },
               device_list_bridge.reportError,
               ACTION_SET_LED_STATUS, [inputArr, devlist]
           );
     },
     
     setColorToBulb: function(){
    	 var deviceID = $('.overlayScrollPicker').attr('data-deviceId');
         var selectedType = $('.overlayScrollPicker').attr('data-selectedtype');
         var dataLedtype = $('.overlayScrollPicker').attr('data-Led-type');
        
         if(selectedType == sessionStore.COLOR_BULB_TYPE) {
             var rgb = wemoUtil.Hex2RGB($('.colorDisplay').attr('data-selectedcolor'));
             var colorXY = wemoUtil.RGBCalculationforColorBulbs(rgb);
               
               if(isRemoteEnabled){
           
             	  	  if(dataLedtype == ledDeviceConstants.GROUPLITAG)
	              	  {
	              		 var spanID = $("#mainLIID"+deviceID).attr('data-deviceId');
	                     var deviceIDs = $("#" + spanID).attr('wemo-device-groupids');
	                     var capabilityIDS = $("#" + spanID).attr('wemo-device-capabilities');
	                     var Groupname = $("#" + spanID).attr('wemo-device-friendly-name');
	                     var homeID = window.sessionStorage.getItem(sessionStore.SETUP_HOME_ID);
	                     var MaxallowedVal = $("#" + spanID).attr('wemo-device-max-allowed-val');
	                     var GroupUniqueID = $("#" + spanID).attr('wemo-device-groupunique-id');
	                     var capabilitytype = ledDeviceConstants.CAPABILITYCOLOR;
	                     $("#" + spanID).attr('wemo-device-state', ledDeviceConstants.INTERMITENTSTATE);
	                     $("#" + spanID).removeClass().addClass(ledDeviceConstants.INTERMITENTSTATE);
	                     var xml_request = device_list_bridge.buildXMLForledGroupStateChange(spanID, deviceIDs, capabilityIDS, Groupname, homeID, colorXY, capabilitytype, MaxallowedVal, GroupUniqueID, "");
	                     device_list_bridge.ledGroupstateChangeOnCloud(xml_request, ledDeviceConstants.STATUSDIMMINGVALCHANGE);
	                     wemoUtil.infoLog(device_list_bridge.TAGB, "xml_request color group:::"+xml_request);
	                     $("#" + spanID).attr('wemo-device-color-value', colorXY+":"+statusCode.OFF);
	                     $("#" + spanID).attr('wemo-device-temperature-value', statusCode.OFF);
	              	  }
	              	  else{
	              		  var pluginId = $("#mainLIID"+deviceID).attr('data-deviceId');
	                  	  var macAddress = $("#mainLIID"+deviceID).attr('data-macId');
	                  	  var devicetype = $("#"+deviceID).attr('wemo-device-type');
	                  	  var status = $("#"+deviceID).attr('wemo-device-state-code');
	                  	  var capabilitytype = ledDeviceConstants.CAPABILITYCOLOR;
	                  	  colorXY = colorXY+":0";
	                   	  $("#" + deviceID).attr('wemo-device-state', ledDeviceConstants.INTERMITENTSTATE);
	                   	  $("#" + deviceID).removeClass().addClass(ledDeviceConstants.INTERMITENTSTATE);
	                   	  var xml_request = device_list_bridge.buildXMLForledStateChange(pluginId, macAddress, status, "", devicetype, "", "", "", capabilitytype, colorXY); 
	                  	  device_list_bridge.ledstateChangeOnCloud(xml_request, ledDeviceConstants.STATUSDIMMINGVALCHANGE);
	                  	  wemoUtil.infoLog(device_list_bridge.TAGB, "xml_request color single:::"+xml_request);
	                  	  $("#" + deviceID).attr('wemo-device-color-value', colorXY);
	                  	  $("#" + deviceID).attr('wemo-device-temperature-value', statusCode.OFF);
	                  }
             	  
               }else{
             	  if(dataLedtype == ledDeviceConstants.GROUPLITAG)
                 	  device_list_bridge.setColor(ledDeviceConstants.GROUP,"",deviceID,colorXY);
                   else
                 	  device_list_bridge.setColor(ledDeviceConstants.SINGLE,deviceID,"",colorXY);
               }
               
               $('#drawer-' + deviceID).find(".colorPickerMainDiv").attr("data-Color",colorXY+":0");
               $('#drawer-' + deviceID).find(".colorPickerBox").attr("style","background:"+$('.colorDisplay').attr('data-selectedcolor'));
               
         }
     },
     
     setTemperatureToBulb: function() {
    	 var deviceID = '';
    	 var selectedType='';
    	 var dataLedtype ='';
    	 var isTTB = false;
    		 if(device_list_bridge.cctBulbInfo && device_list_bridge.cctBulbInfo.isTTB){
    			 deviceID = device_list_bridge.cctBulbInfo.deviceId;
    			 selectedType = sessionStore.TEMP_BULB_TYPE;
    			 dataLedtype = device_list_bridge.cctBulbInfo.ledType;
    			 isTTB = true;
    		 }
    		 else{
    			 deviceID = $('.overlayScrollPicker').attr('data-deviceId');
    			 selectedType = $('.overlayScrollPicker').attr('data-selectedtype');
    			 dataLedtype = $('.overlayScrollPicker').attr('data-Led-type');
    		 }
         
    	 if(selectedType == sessionStore.TEMP_BULB_TYPE) {
    		 
    		 	var temperatureVal = '';
    		 	if(isTTB){
    		 		temperatureVal = $("#pickerTTB").attr('data-selectedTemperature');
    		 	}else{
    		 		temperatureVal = $("#picker").attr('data-selectedTemperature');
    		 	}
	          	wemoUtil.infoLog(device_list_bridge.TAGB,"Slider Temperature value :::: "+temperatureVal);
	          	wemoUtil.infoLog(device_list_bridge.TAGB,"Slider Device ID ::::   "+deviceID);
	          	var tempValue = wemoUtil.convertTemperatureToColorVal(temperatureVal);
	          	
	          		if(isRemoteEnabled){
	                  
	 	              	  if(dataLedtype == ledDeviceConstants.GROUPLITAG)
	 	              	  {
	 	              		 var spanID = $("#mainLIID"+deviceID).attr('data-deviceId');
	 	                     var deviceIDs = $("#" + spanID).attr('wemo-device-groupids');
	 	                     var capabilityIDS = $("#" + spanID).attr('wemo-device-capabilities');
	 	                     var Groupname = $("#" + spanID).attr('wemo-device-friendly-name');
	 	                     var homeID = window.sessionStorage.getItem(sessionStore.SETUP_HOME_ID);
	 	                     var MaxallowedVal = $("#" + spanID).attr('wemo-device-max-allowed-val');
	 	                     var GroupUniqueID = $("#" + spanID).attr('wemo-device-groupunique-id');
	 	                     tempValue = tempValue+":0";
	 	                     var capabilitytype = ledDeviceConstants.CAPABILITYTEMPERATURE;
	 	                     $("#" + spanID).attr('wemo-device-state', ledDeviceConstants.INTERMITENTSTATE);
	 	                     $("#" + spanID).removeClass().addClass(ledDeviceConstants.INTERMITENTSTATE);
	 	                     var xml_request = device_list_bridge.buildXMLForledGroupStateChange(spanID, deviceIDs, capabilityIDS, Groupname, homeID, tempValue, capabilitytype, MaxallowedVal, GroupUniqueID, "");
	 	                     device_list_bridge.ledGroupstateChangeOnCloud(xml_request, ledDeviceConstants.STATUSDIMMINGVALCHANGE);
	 	                     wemoUtil.infoLog(device_list_bridge.TAGB, "xml_request temp group:::"+xml_request);
	 	                     $("#" + spanID).attr('wemo-device-temperature-value', tempValue);
	 	                     $("#" + spanID).attr('wemo-device-color-value', statusCode.OFF);
	 	             		 $('#drawer-' + deviceID).find(".colorPickerMainDiv").attr("data-Color",statusCode.OFF);
	 	              	  }
	 	              	  else{
	 	              		  var pluginId = $("#mainLIID"+deviceID).attr('data-deviceId');
	 	                  	  var macAddress = $("#mainLIID"+deviceID).attr('data-macId');
	 	                  	  var devicetype = $("#"+deviceID).attr('wemo-device-type');
	 	                  	  var status = $("#"+deviceID).attr('wemo-device-state-code');
	 	                  	  var capabilitytype = ledDeviceConstants.CAPABILITYTEMPERATURE;
	 	                  	  tempValue = tempValue+":0";
	 	                  	  $("#" + deviceID).attr('wemo-device-state', ledDeviceConstants.INTERMITENTSTATE);
	 	                  	  $("#" + deviceID).removeClass().addClass(ledDeviceConstants.INTERMITENTSTATE);
	 	                  	  var xml_request = device_list_bridge.buildXMLForledStateChange(pluginId, macAddress, status, "", devicetype, "", "", "", capabilitytype, tempValue); 
	 	                  	  device_list_bridge.ledstateChangeOnCloud(xml_request, ledDeviceConstants.STATUSDIMMINGVALCHANGE);
	 	                  	  wemoUtil.infoLog(device_list_bridge.TAGB, "xml_request temp single:::"+xml_request);
	 	                  	  $("#" + deviceID).attr('wemo-device-temperature-value', tempValue);
	 	                  	  $("#" + deviceID).attr('wemo-device-color-value', statusCode.OFF);
	 	              		  $('#drawer-' + deviceID).find(".colorPickerMainDiv").attr("data-Color",statusCode.OFF);
	                  	  }
	            	  
	              }else{
	              	if(dataLedtype == ledDeviceConstants.GROUPLITAG)
	              		device_list_bridge.setTemperature(ledDeviceConstants.GROUP,"",deviceID,tempValue);
	                  else
	                  	device_list_bridge.setTemperature(ledDeviceConstants.SINGLE,deviceID,"",tempValue);
	              }
	       
	          	var color_TempChange = wemoUtil.convertTemperatureToRGB(temperatureVal);
	          	if(isTTB){
	          		$('#drawer-' + deviceID).find(".temperatureColorRow").attr("data-ttbColor",tempValue+":0");
                	var rgbColor = wemoUtil.convertTemperatureToRGB(temperatureVal);
                	$('#drawer-' + deviceID).find(".temparatureColorPicker").attr("style","background:"+rgbColor);
	          		
	          	}else{
	          		$('#drawer-' + deviceID).find(".colorPickerMainDiv").attr("data-ttbColor",tempValue+":0");
	          		var rgbColor = wemoUtil.convertTemperatureToRGB(temperatureVal);
		            $('#drawer-' + deviceID).find(".colorPickerBox").attr("style","background:"+rgbColor);
	          	}
          	
          }
     },
     
     changeLEDStateClass: function(currID, state){
    
    	 var newClass = device_list_bridge.getBinaryStateImage(state);
    
    	 var panel = $('#drawer-' + currID);
         if (animationLED != undefined) {
             $.fn.animatePNG.stop(animationLED);
             clearInterval(animationLED);
         }
         $("#" + currID).find('.animation').remove();
         
         $("#" + currID).attr('wemo-device-state-code', state);
         $("#" + currID).removeClass();
         $("#" + currID).addClass(newClass);
         $("#" + currID).attr('wemo-device-state', newClass);

         if (newClass.indexOf('led_off') != -1) {
             $(panel).addClass('setOpacity');
             $("#mainLIID" + currID).find('.sliderValue').removeClass('firmwareMsg');
             $(panel).find('.goSleep').attr('disabled', true).addClass('disableGoSleep');
             device_list_bridge.buttonController.goToSleep.disable();
             $("#mainLIID" + currID).find('.sliderValue').removeClass('LedBrihtnesscolorChange');
             var SliderVal =  $("#mainLIID" + currID).find('.sliderValue').text();
             
             if(SliderVal.indexOf("%") == -1) {
             		var curval = $("#" + currID).find('.bulbStrength').text();
             		$("#mainLIID" + currID).find('.sliderValue').text(curval);
             }
         } else {
      	   $("#mainLIID" + currID).find('.sliderValue').removeClass('firmwareMsg');
             $(panel).removeClass('setOpacity');
             $(panel).find('.goSleep').removeAttr('disabled').removeClass('disableGoSleep');
             device_list_bridge.buttonController.goToSleep.enable();
             $("#mainLIID" + currID).find('.sliderValue').addClass('LedBrihtnesscolorChange');
         }
         $("#mainLIID" + currID).find('.iconType').show();
        
     },
     
     cancelSleepFader: function(deviceId){
    	 clearInterval(faderTimer);
    	 var activeButton = -1;
    	 var addMinutes = -1;
     	 $('ul li[data-deviceId=' + deviceId + ']').find('.goSleep').attr('data-timer', 'off');
         $('ul li[data-deviceId=' + deviceId + ']').find('.timer').empty().append(wemo.items["Off"]);

    	 activeButton = activeButton + '&&' + addMinutes;

    	  devicePlugin.execute(
             function(param) {},
             device_list_bridge.reportError,
             ACTION_SET_SHAREDPREF_FADER_TIME, 
             [deviceId, activeButton]
    	 );

     },

     openLEDDrawer: function(drawer){
    	 var panel = $('#drawer-' + drawer);
    	 if ((!$(panel).hasClass('drawerViewShow') || $(panel).find('.sliderRow').is(':visible')) && !$(panel).find('.firstRow').is(':visible')) {
     	     $("#device_container").find('.drawerViewShow').removeClass().addClass('drawerView');
             $(panel).removeClass().addClass('drawerViewShow');
             var sliderValue = $('ul li[data-deviceId=' + drawer + ']').find('.sliderValue').text();
             panel.find('.firstRow').show();
             panel.find('.goSleep').show();
             panel.find('.sleepFader').show();
             panel.find('.groupFadder').show();
             $('#drawer-' + drawer).find(".temperatureColorRow").hide();
             $('#drawer-' + drawer).find('.colorPickerMainDiv').hide();
             var liname = $("#"+ drawer).attr('name');
             var modelcode = "";
         
             if(isRemoteEnabled){
         		
         		if(liname == "name_group_state"){
         			modelcode = $("#" + drawer).attr('wemo-device-modelcode');
         		}else{
         			modelcode = $("#mainWrapper" + drawer).attr('wemo-device-modelcode');
         		}
         		
              	if(modelcode && modelcode.indexOf(",")){
              		var modelcodeArr = modelcode.split(",");
              		modelcode = modelcodeArr[0]
              	}else if(modelcode.toUpperCase()){
              		modelcode = modelcode;
              	}
              		
            }else{
              	if($("#mainWrapper" + drawer).attr('wemo-device-modelcode')){
              		modelcode = $("#mainWrapper" + drawer).attr('wemo-device-modelcode');
              	} 	
            }
         	
         	var ledDeviceType = wemoUtil.ledBulbType(modelcode);
             
         	if(wemoUtil.isTemperatureBulb(ledDeviceType)){
             	$('#drawer-' + drawer).find(".temperatureColorRow").show();
             	var colorVal = $('#drawer-' + drawer).find(".temperatureColorRow").attr("data-ttbColor");
             	var colorTempVal = colorVal.split(':');
             	var kelvinTemperarture = wemoUtil.convertColorToTemperature(colorTempVal[0]);
             	
             	var rgbColor = wemoUtil.convertTemperatureToRGB(kelvinTemperarture);
             	$('#drawer-' + drawer).find(".temparatureColorPicker").attr("style","background:"+rgbColor);
             	
         	}
          	if(wemoUtil.isColoredandTemperaturedBulb(ledDeviceType) || wemoUtil.isColoredBulb(ledDeviceType)){
             	$('#drawer-' + drawer).find('.colorPickerMainDiv').show();
             	var colorVal = $('#drawer-' + drawer).find(".colorPickerMainDiv").attr("data-Color");
             	var colorTempVal = colorVal.split(':');
             	var rgbColor = wemoUtil.convertColorToRGB(colorTempVal[0],colorTempVal[1]);
             	
             	if(!rgbColor){
             		rbgColor=sessionStore.DEFAULT_RGB_VALUE;
             	}
             	
             	$('#drawer-' + drawer).find(".colorPickerBox").attr("style","background:"+rgbColor);
             
             	if(wemoUtil.isColoredandTemperaturedBulb(ledDeviceType)){
             		if(colorVal == 0 || colorVal == undefined){
             			var temperatureVal = $('#drawer-' + drawer).find(".colorPickerMainDiv").attr("data-ttbColor");
                 		var TempVal = temperatureVal.split(':');
                     	var kelvinTemperarture = wemoUtil.convertColorToTemperature(TempVal[0]);
                     	var rgbColor = wemoUtil.convertTemperatureToRGB(kelvinTemperarture);
                     	$('#drawer-' + drawer).find(".colorPickerBox").attr("style","background:"+rgbColor);
             		}
             		
             		$('#drawer-' + drawer).find(".colorPickerLabel").html(wemo.items['ColorTemperature']);
             	}	
             	else
             		$('#drawer-' + drawer).find(".colorPickerLabel").html(wemo.items['Color']);
         	}
 
             var className = $('#' + drawer).attr('class');

             if (className.indexOf('led_off') != -1) {
                 console.log('disable go to sleep');
                 $(panel).addClass('setOpacity');
                 $(".groupFadder").removeClass('setOpacity');
                 $(panel).find('.goSleep').attr('disabled', true).addClass('disableGoSleep');
                 device_list_bridge.buttonController.goToSleep.disable();
                
                 $(panel).find('.customPicker').empty().append(wemo.items['enter']);
                 $(panel).find('.customPicker').removeClass('customPickerEnterTxtGrn');
                 $(panel).find('.customPicker').addClass('customPickerEnterTxtWhite');
             } else {
                 console.log('enable go to sleep');
                 $(panel).removeClass('setOpacity');
                 $(panel).find('.goSleep').removeAttr('disabled').removeClass('disableGoSleep');
                 device_list_bridge.buttonController.goToSleep.enable();
                 
                 $(panel).find('.customPicker').empty().append(wemo.items['enter']);
                 $(panel).find('.customPicker').removeClass('customPickerEnterTxtGrn');
                 $(panel).find('.customPicker').addClass('customPickerEnterTxtWhite');
             }

             device_list_bridge.drawerSlider(drawer, sliderValue, 'no');
             var addMinutes = -1;

             $('#drawer-' + drawer + ' .buttonImage').removeClass('buttonActive');
             $('#drawer-' + drawer + ' .buttonImage').each(function(i, v) {
                 if (i == 0) {
                     $(this).addClass('buttonActive');
                 }
             });

             devicePlugin.execute(
                 function(param) {
                     if (param != -1) {
                         var paramValues = param.split('&&');
                         var activeButton = paramValues[0];
                         addMinutes = paramValues[1];
                         
                         var activeButtonLength = $('#drawer-' + drawer + ' .buttonActive').length;
                         
                         if (activeButtonLength == 0) {
                             addMinutes = -1;
                             $(panel).find('.goSleep').attr('disabled', true).addClass('disableGoSleep setOpacity');
                             device_list_bridge.buttonController.goToSleep.disable();
                         }

                         var sleepTimer = $('ul li[data-deviceId=' + drawer + ']').find('.goSleep').attr('data-timer');
                         device_list_bridge.faderTimerEnhancement(addMinutes, drawer);
                     }else{
                     	var activeButtonLength = $('#drawer-' + drawer + ' .buttonActive').length;
                         
                         if (activeButtonLength == 0) {
                             addMinutes = -1;
                             $(panel).find('.goSleep').attr('disabled', true).addClass('disableGoSleep setOpacity');
                             device_list_bridge.buttonController.goToSleep.disable();
                         }


                         var sleepTimer = $('ul li[data-deviceId=' + drawer + ']').find('.goSleep').attr('data-timer');
                         device_list_bridge.faderTimerEnhancement(addMinutes, drawer);
                     }
                    

                 },
                 device_list_bridge.reportError,
                 ACTION_GET_SHAREDPREF_FADER_TIME, [drawer]
             );
             
             $('ul li[data-deviceId=' + drawer + ']').find('.iconType').removeClass('drawer_icon_arrow_down').addClass('drawer_icon_arrow_up');

         }
    	 
     },
     
     closeColorTempPopUp : function(){
    	 if($('.overlayScrollPickerTemp').is(":visible")){
    		 $('.overlayScrollPickerTemp').attr('style', 'visibility: hidden;');
    	 }
    	 else{
    		 $('.overlayScrollPicker').attr('style', 'display: none;');
    	 }
    	 window.sessionStorage.setItem(sessionStore.IS_COLOR_TEMP_PICKER, false);
     }

};

