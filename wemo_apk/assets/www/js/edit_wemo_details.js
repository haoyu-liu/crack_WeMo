/*
 edit_wemo_details.js

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
var TAG = "edit_wemo_details.js ";
var lightswitchbacklighttapped = false;
var lightsensorbacklighttapped = false;
var sensorType;
var switchType;
var attributeListJson;
var appliance = {};
var storedEmail = "";
var emailJSON;

$(document).bind('pageinit', function() {
    editWemoDetails.initialize();
});

var editWemoDetails = {

    initialize: function() {
        wemoUtil.infoLog(TAG, "initialize");
        document.addEventListener('deviceready', this.preDeviceReady, false);
    },
    getDeviceAttributes: function() {
        var dfd = $.Deferred();
        setupPlugin.execute(
            function(attributeList) {
                if (attributeList != null) {
                    attributeListJson = JSON.stringify(attributeList);
                    window.sessionStorage.setItem("device_attribute_list", attributeListJson);
                    dfd.resolve();
                } else {
                    wemoUtil.infoLog(TAG, "Edit Wemo Details Get attributeList error :::");
                    switchType = 0;
                    sensorType = 0;
                    dfd.reject();
                }
            },
            editWemoDetails.reportError,
            ACTION_GET_ATTRIBUTES, []
        );
        return dfd.promise();
    },
    preDeviceReady: function() {
        appliance.type = wemo.items[window.sessionStorage.getItem("device_type")];
        if (appliance.type == wemoMaker.TYPE || appliance.type == wemoMaker.REMOTE_TYPE || appliance.type == wemoHeaterA.TYPE || appliance.type == wemoHeaterB.TYPE || appliance.type == wemoCoffeeMaker.TYPE || appliance.type == wemoHumidifier.TYPE || appliance.type == wemoHumidifierB.TYPE || appliance.type == wemoAirPurifier.TYPE || appliance.type == wemoDeviceNames.MAKER) {
            editWemoDetails.getDeviceAttributes().then(function() {
                editWemoDetails.onDeviceReady();
            }).fail(function() {
                editWemoDetails.onDeviceReady();
            });
        } else {
            editWemoDetails.onDeviceReady();
        }
    },
    onDeviceReady: function() {
        wemoUtil.infoLog(TAG, "device ready");
        editWemoDetails.bindEvents();

        nativeUtilPlugin.execute(function(data){
            if(data !== ""){
                emailJSON = JSON.parse(data);
                storedEmail = emailJSON.email;
            }
        }, function(err){
            wemoUtil.infoLog(TAG, "Error getting emails from shared pref");
        }, actions.GET_EMAIL, []);

        disableNetworkWatchdog = true;
        nativeUtilPlugin.execute(null, editWemoDetails.reportError, actions.PREF_SET_GET_STARTED_NEEDED, [false]);

        appliance.brandname = window.sessionStorage.getItem("device_brand_name");
        appliance.urn = window.sessionStorage.getItem("type");
        appliance.ssid = window.sessionStorage.getItem("device_SSID");
        appliance.friendlyname = window.sessionStorage.getItem("device_friendly_name");
        appliance.thumburl = window.sessionStorage.getItem("device_thumb_url");
        appliance.custom_icon_url = window.sessionStorage.getItem("custom_icon_url");

        var imageUrl =  (appliance.custom_icon_url !=="") ?  appliance.custom_icon_url : appliance.thumburl;

        $('#device_ssid').text(appliance.ssid);
        $('#setup_success_message').html(wemo.items[window.sessionStorage.getItem("SETUP_SUCCESS_MESSAGE")]);
        $("#remote_setup_failure_footer,#remote_setup_success_footer").hide();
        $("#device_thumb").css("background-image", 'url(' + imageUrl + ')');

        var type = editWemoDetails.getFilteredDeviceType(appliance.urn);
        
        appliance.label = editWemoDetails.getBrandName(type, appliance.brandname);
        $('#brand_nameph').html(appliance.label);
        $('#device_type').html(appliance.label);
        
        
        if (appliance.type == wemoMaker.TYPE || appliance.type == wemoMaker.REMOTE_TYPE || appliance.type == wemoDeviceNames.MAKER) {
            $('#maker_switch_type').show();
            $('#maker_sensor').show();

            if (appliance.friendlyname == wemoMaker.REMOTE_TYPE) {
                appliance.friendlyname = appliance.label;
            }

            attributeListJson = window.sessionStorage.getItem("device_attribute_list");
            attributeListJson = JSON.parse(attributeListJson);
            wemoUtil.infoLog(TAG, "attributeListJson" + attributeListJson);
            switchType = parseInt(attributeListJson.SwitchMode.value);
            sensorType = parseInt(attributeListJson.SensorPresent.value);

            $("#maker_switch_select .radioBtn").removeClass("selected");
            if (switchType === 0) {
                $('#maker_switch_select .maker_switch_toggle .radioBtn').addClass("selected");
            } else if (switchType === 1) {
                $('#maker_switch_select .maker_switch_momentary .radioBtn').addClass("selected");
            }

            if (sensorType === 1) {
                $('#maker_sensor_toggle').removeClass("off");
            } else if (sensorType === 0) {
                $('#maker_sensor_toggle').addClass("off");
            }

            $("#maker_sensor_toggle").on('click', function() {
                $("#maker_sensor_toggle").toggleClass("off");
                if ($("#maker_sensor_toggle").hasClass("off")) {
                    sensorType = 0;
                } else {
                    sensorType = 1;
                }
                attributeListJson.SensorPresent.value = sensorType;
                window.sessionStorage.setItem("device_attribute_list", JSON.stringify(attributeListJson));
            });

            $("#maker_switch_select .radioBtn").on("click", function(e) {
                e.stopPropagation();
                $("#maker_switch_select .radioBtn").removeClass("selected");
                $(this).addClass("selected");

                if ($(this).parent().hasClass("maker_switch_toggle")) {
                    switchType = 0;
                } else {
                    switchType = 1;
                }

                attributeListJson.SwitchMode.value = switchType;
                window.sessionStorage.setItem("device_attribute_list", JSON.stringify(attributeListJson));

            });
        }

        //scroll page when click input field
        editWemoDetails.scrollForInput()

//        $('#friendly_name').attr('placeholder', appliance.label + ' (' + wemo.items['SetupInstructions_DefaultName'] + ')');

//        $('#friendly_name').attr('placeholder', appliance.label);


         $('#friendly_name').val(appliance.label);
        if (!!appliance.friendlyname && appliance.friendlyname !== "" && appliance.friendlyname.toLowerCase() !== appliance.label.toLowerCase()) {
            $('#friendly_name').val(appliance.friendlyname);
        } else {
            window.sessionStorage.setItem("device_friendly_name", appliance.label);
        }

        if(!!appliance.label && appliance.label !== ""){ 
            $('#get_started_device_name').text(appliance.label);
        }else{
            $('#get_started_device_name').text(wemo.items['SetupInstructions_DefaultDeviceName']);
        }


        $('.card div').on('click',function(e) {
            if (!$(this).hasClass("save_setup") && (!$(this).hasClass("friendly_name") && !$(this).children().hasClass("friendly_name"))) {
                var friendlyName = $('#friendly_name').val();
                if(friendlyName === "") {
                    $('#friendly_name').val(appliance.label + ' (' + wemo.items['SetupInstructions_DefaultName'] + ')');
                }
            }
            return false;
        });

        $('#friendly_name').on('focus focusin', function(e){
            var friendlyName = $('#friendly_name').val();
            if(friendlyName.indexOf("(" + wemo.items['SetupInstructions_DefaultName']) !== -1) {
                $('#friendly_name').val("");
            }
        });

        //show Camera popup
        $('.change_photo_button').on('click', function() {
            $("#select_photo_popup").popup('open');
        });

        $('#photo_pick_option').on('click', '> li', function() {
            $('#select_photo_popup').attr('data-go-forward', 'true');

            var selected_id = $(this).attr('id');
            wemoUtil.infoLog(TAG, "Photo selection option: " + selected_id);
            if (selected_id === 'take_photo') {
                editWemoDetails.getCameraPicker();
            } else if (selected_id === 'select_from_gallery') {
                editWemoDetails.getGalleryPicker();
            } else if (selected_id === 'remove_photo') {
                editWemoDetails.removePhoto();
            }
            $("#select_photo_popup").popup("close");

        });

        $('.save_setup').on('click', function() {
            //save Maker attribute
            if (appliance.type == wemoMaker.TYPE || appliance.type == wemoMaker.REMOTE_TYPE || appliance.type == wemoHeaterA.TYPE || appliance.type == wemoHeaterB.TYPE || appliance.type == wemoCoffeeMaker.TYPE || appliance.type == wemoHumidifier.TYPE || appliance.type == wemoHumidifierB.TYPE || appliance.type == wemoAirPurifier.TYPE || appliance.type == wemoDeviceNames.MAKER) {
                //Add action for set Attributes
                setupPlugin.execute(function(status) {
                    wemoUtil.infoLog(TAG, "Swtich type Set Successfully ");
                }, editWemoDetails.reportError, ACTION_SET_ATTRIBUTES, [attributeListJson]);
            }

            //FriendlyName validation
            var friendlyName = $("#friendly_name").val();
            if(friendlyName.indexOf("(" + wemo.items['SetupInstructions_DefaultName']) !== -1) friendlyName = appliance.friendlyname;

            if ($.trim(friendlyName) === "") {
                $("#invalidNamePopup").popup('open');
            } else {
                /* WEMO-23997 - don't allow special characters, except trademark */
                var desired = friendlyName.match(/[^\w.\s-\/\<\>]/gi, '');
                if (!desired || (desired.length === 1 && desired[0] === '®')) {
                    //Fix for WEMO-20322 KitKat with maxlength=30
                    if (friendlyName.length <= 30) {
                        // Save Friendly Name
                        var isFriendlyName = window.sessionStorage.getItem("IsFriendlyName");
                        if (!isFriendlyName) {
                            setupPlugin.execute(function(result) {
                                    wemoUtil.infoLog(TAG, "set friendly name: " + result.ChangeFriendlyName);
                                }, null,
                                ACTION_SET_FRIENDLY_NAME, [friendlyName]);

                            window.sessionStorage.setItem("device_friendly_name", friendlyName);
                        } else {
                            window.sessionStorage.removeItem("IsFriendlyName");
                        }

                            var isConnected = "false";
                            setupPlugin.execute(function(status) {
                                    isConnected = status;
                                    wemoUtil.infoLog(TAG, "execute isConnected: " + isConnected);
                                    editWemoDetails.saveSetup(isConnected);
                                }, editWemoDetails.reportError,
                                ACTION_IS_NETWORK_CONNECTED, []);

                            wemoUtil.infoLog(TAG, "isConnected: " + isConnected);

                    } else {
                        $("#tooLongRuleNamePopup").popup('open');
                    }
                } else {
                    $("#invalidNamePopup").popup('open');
                }
            }
        });

        // Custom icons are not currently supported popup Starts
        $("#gosh_message_ok_btn").on('click', function() {
            $("#gosh_message").popup('close');
        });
        // Custom icons are not currently supported popup Ends

        $("#invalidNamePopupOK").on('click', function() {
            $("#invalidNamePopup").popup('close');
        });

        $("#tooLongRuleNamePopupOK").on('click', function() {
            $("#tooLongRuleNamePopup").popup('close');
        });

        $("#remember_wifi").on("click", function(){
            $("#remember_wifi").toggleClass("off");
        });
    },
    scrollForInput: function() {
        //scroll page when click input field
        $("#friendlyname_row").on('click', function(){
            $('.ui-mobile-viewport').animate({
                scrollTop: 230
            }, 500);
            return false;
        });

        $("#friendly_name").on('focusin focus', function(e){
            e.preventDefault();
        });
    },
    getNetworkType: function () {
        nativeUtilPlugin.execute(
            editWemoDetails.processNetworkType,
            editWemoDetails.reportError,
            actions.GET_NETWORK_TYPE_NEW, []
        );
    },

    processNetworkType: function(type) {
        switch (type) {
            case networkType.WEMO:
//                editWemoDetails.loadIndexPage();
                break;

            case networkType.NO_NETWORK:
                wemoUtil.infoLog(TAG, "No Network");
                setTimeout(function () {
                    wemoUtil.infoLog(TAG, "Get Network Type again");
                    editWemoDetails.getNetworkType();
                }, timeout.NETWORK_RETRY);

                break;

            default:
                wemoUtil.infoLog(TAG, "Not supported ");
                return;
                break;

        }
    },

    bindEvents: function() {
        wemoUtil.infoLog(TAG, "bind events");
        document.addEventListener('offline', editWemoDetails.onOffline, false);
        document.addEventListener('online', editWemoDetails.onOnline, false);
        document.addEventListener("backbutton", editWemoDetails.onBackPress, false);
        document.addEventListener("resume", editWemoDetails.onResume, false);

    },

    onBackPress: function() {
        wemoUtil.infoLog(TAG, "back button pressed");
        if ($('#select_photo_popup').is(':visible')) {
            wemoUtil.infoLog(TAG, "Dialog box is open");
            $("#select_photo_popup").popup("close");
            $("#select_photo_popup").hide()
        } else {
            window.sessionStorage.clear();
            //navigator.app.clearHistory();
            setupPlugin.execute(null, null, ACTION_STOP_UPNP_SERVICE, []);
            navigator.app.exitApp();
        }
    },

    onResume: function() {
        wemoUtil.infoLog(TAG, "resumed");
        editWemoDetails.getNetworkType();
    },

    onOffline: function() {
        wemoUtil.infoLog(TAG, "offLine");
    },

    onOnline: function() {
        wemoUtil.infoLog(TAG, "onLine");
    },

    getCameraPicker: function() {
        var information = {
            "udn" : "",
            "ssid" : appliance.ssid
        }
        smartDevicePlugin.execute(
            editWemoDetails.onPhotoURISuccess,
            editWemoDetails.reportError,
            actions.TAKE_PICTURE, [information]
        );
    },

    getGalleryPicker: function() {
        var information = {
             "udn" : "",
             "ssid" : appliance.ssid
        }

    	smartDevicePlugin.execute(
            editWemoDetails.onPhotoURISuccess,
            editWemoDetails.reportError,
            actions.CHOOSE_PHOTO, [information]
        );
    },

    onPhotoURISuccess: function(imageUri) {
        wemoUtil.infoLog(TAG, "Image URI: " + imageUri);
        window.sessionStorage.setItem("custom_icon_url", imageUri);
        $("#device_thumb").css("background-image", 'url(' + imageUri + ')');
    },

    removePhoto: function() {
        var imageUri = window.sessionStorage.getItem("device_thumb_default_url");
        window.sessionStorage.setItem("custom_icon_url", imageUri);
        $("#device_thumb").css("background-image", 'url(' + imageUri + ')');
    },

    reportError: function(e) {
        wemoUtil.infoLog(TAG, "Plugin Failure Call back!!!!   " + e);
        nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
    },

    saveSetup: function(isConnected) {
        if (isConnected == "true") {
            wemoUtil.infoLog(TAG, "if isConnected: " + isConnected);
            nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);

            var toRememberWiFiSetting = !($('#remember_wifi').hasClass('off'));
            window.localStorage.setItem(localStorageKeys.REMEMBER_WIFI_SETTINGS, toRememberWiFiSetting);
            var deviceURL = window.sessionStorage.getItem("custom_icon_url");

            deviceURL = deviceURL ? deviceURL : window.sessionStorage.getItem("device_thumb_url");

            var information = {
                "icon" : deviceURL
            }

            //setTimeout(function() {
                wemoUtil.infoLog(TAG, "Send img: " + window.sessionStorage.getItem("custom_icon_url"));

                setupPlugin.execute(function() {
                        wemoUtil.infoLog(TAG, "Save custom image done ");
                        window.sessionStorage.setItem(sessionStore.EDIT_DETAILS_DONE, stringBoolean.TRUE);
                        editWemoDetails.finishSetUp();
                }, editWemoDetails.legacySetUp, ACTION_EDIT_ICON_IN_SETUP, [information]);
            //}, timeout.LONG);
            // Save WiFi Status

        } else {
            wemoUtil.infoLog(TAG, "else isConnected: " + isConnected);
            editWemoDetails.loadNoNetworkPage();
        }
    },

    legacySetUp: function() {
        wemoUtil.infoLog(TAG, "Save custom image not successful - going the legacy way for default icon");
        wemoUtil.infoLog(TAG, "img: " + window.sessionStorage.getItem("device_thumb_url"));
        setupPlugin.execute(function() {
            editWemoDetails.finishSetUp();
            return;
        }, editWemoDetails.reportError, ACTION_SET_DEVICE_IMAGE, [window.sessionStorage.getItem("device_thumb_url")]);
    },

    finishSetUp: function() {
        //The following things need to happen regardless of edit image was successful or not.
        wemoUtil.infoLog(TAG, "Finishing setup");
        window.sessionStorage.setItem('send_email', true);

        var type = editWemoDetails.getFilteredDeviceType(window.sessionStorage.getItem('type')),
            typeObj = {
                deviceType: type
            };
        nativeUtilPlugin.execute(null, null, actions.SET_EMAIL_DEVICE_TYPE, [typeObj]);

        wemoUtil.infoLog(TAG, "Finished Setup doing page re-direct now");

        window.sessionStorage.setItem('storedEmail', storedEmail);

        if(type.match(/dimmer/gi)) {
            editWemoDetails.loadBulbConfig();
        } else {
            if(storedEmail !== ""){
                wemoUtil.infoLog(TAG, "Loading index");
                editWemoDetails.loadIndexPage();
            } else {
                wemoUtil.infoLog(TAG, "Loading E-Mail Opt-In");
                editWemoDetails.loadEmailOptIn();
            }
        }

    },

    loadNoNetworkPage: function() {
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        wemoUtil.loadUrl(filePath.NO_NETWORK);
    },

    loadIndexPage: function() {
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        wemoUtil.loadUrl(filePath.INDEX);
    },
    loadEmailOptIn: function(){
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        wemoUtil.loadUrl(filePath.EMAIL_OPT_IN);
    },
    loadBulbConfig: function() {
        wemoUtil.log(TAG, "Go to bulb configuration page");
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        wemoUtil.loadUrl(filePath.SELECT_BULB_TYPE);
    },
    getFilteredDeviceType: function(type) {
        wemoUtil.infoLog(TAG, "getFilteredDeviceType type: " + type);
        if (type.indexOf("sensor") != -1) {
            type = "Sensor";
        } else if (type.indexOf("dimmer") != -1) {
            type = "Dimmer";
        } else if (type.indexOf("controllee") != -1) {
            type = "Switch";
        } else if (type.indexOf("insight") != -1) {
            type = "Insight";
        } else if (type.indexOf("bridge") != -1) {
            type = "Bridge";
        } else if (type.indexOf("lightswitch") != -1) {
            type = "Lightswitch";
        } else if (type.indexOf("coffeeMaker") != -1 || type.indexOf("CoffeeMaker") != -1) {
            type = "coffeeMaker";
        } else if (type.indexOf("Maker") != -1) {
            type = "Maker";
        } else if (type.indexOf("crockpot") != -1 || type.indexOf("Crockpot") != -1) {
            type = "crockpot";
        } else if (type.indexOf("heaterA") != -1 || type.indexOf("HeaterA") != -1) {
            type = "heaterA";
        } else if (type.indexOf("heaterB") != -1 || type.indexOf("HeaterB") != -1) {
            type = "heaterB";
        } else if (type.indexOf("humidifier") != -1 || type.indexOf("Humidifier") != -1) {
            type = "humidifier";
        } else if (type.indexOf(deviceType.HUMIDIFIERB) != -1 || type.indexOf(wemoHumidifierB.REMOTE_TYPE) != -1) {
            type = deviceType.HUMIDIFIERB;
        } else if (type.indexOf("airPurifier") != -1 || type.indexOf("AirPurifier") != -1) {
            type = "airPurifier";
        }
        return type;
    },
    getBrandName: function(type, brand) {
        wemoUtil.infoLog(TAG, "getBrandName type: " + type + ', brand:' + brand);
        var lang = window.localStorage.getItem("DEVICE_LANG");
        
        var deviceName;
        if (SmartAppliances.hasOwnProperty(type.toUpperCase())) {
            switch(type.toLowerCase()){
                case SmartAppliances.CROCKPOT.key:
                    deviceName = wemo.items['CrockPot'];
                    break;
                case SmartAppliances.COFFEEMAKER.key:
                    deviceName = wemo.items['MrCoffee'];
                    break;
                case SmartAppliances.HEATERA.key:
                case SmartAppliances.HEATERB.key:
                case SmartAppliances.HUMIDIFIER.key:
                case SmartAppliances.HUMIDIFIERB.key:
                case SmartAppliances.AIRPURIFIER.key:
                	deviceName = (!wemoUtil.isEmpty(brand)) ? wemo.items['' + brand + ''] : wemo.items['Holmes'];
                    break;
                default:
                    deviceName = "";
                	break;
            }
            if(['fr_FR', 'fr_CA'].indexOf(lang) > -1) {
                deviceName = wemo.items[SmartAppliances[type.toUpperCase()].locale] + deviceName;
        	} else {
            	deviceName += wemo.items[SmartAppliances[type.toUpperCase()].locale + ""];
            }
        } else {
            deviceName = wemo.items['DefaultName_wemoDevice'];
        }
        
        return deviceName;
    }
};