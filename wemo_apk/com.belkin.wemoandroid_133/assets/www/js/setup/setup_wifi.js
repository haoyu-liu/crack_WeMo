/*
 setup_wifi.js

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

$(document).bind('pageinit', function () {
    wemoUtil.infoLog(setupWifi.TAG, 'pageinit');
    var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));
    setupWifi.initialize();
});

var setupWifi = {
    //Variables
    TAG: "setup_wifi.js: ",
    wifi_ap_list: $("#wifi_ap_list"),

    //Methods
    initialize: function () {
        wemoUtil.infoLog(setupWifi.TAG, 'initialize');
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    topControllers: {
        types: {
            MORE_MENU: 'moremenu',
            BUTTON_BAR: 'buttonbar'
        },
        listeners: {
            hiddenNetwork: function (e) {
                wemoUtil.loadUrl(filePath.CONNECT_TO_HIDDEN_NETWORK);
            },
            help: function (e) {
                wemoUtil.loadUrl(filePath.CONNECT_TO_HELP_PAGE);
            }
        },
        containers: {
            moreMenu: null,
            buttonBar: null
        },
        initiate: function (type) {
            var $parent = setupWifi.topControllers;
            switch (type) {
            case $parent.types.MORE_MENU:
                isSetupWorkflow = true;
                console.log($parent.containers.moreMenu.shell.html());
                $parent.containers.moreMenu.shell.show();
                $parent.containers.buttonBar.shell.hide();
                $parent.containers.moreMenu.itemsToHide.addClass('none');
                $parent.containers.moreMenu.itemsToShow.removeClass('none');
                $parent.containers.moreMenu.hiddenNetwork.on('tap', $parent.listeners.hiddenNetwork);
                break;
            case $parent.types.BUTTON_BAR:
                isSetupWorkflow = false;
                $parent.containers.moreMenu.shell.hide();
                $parent.containers.buttonBar.shell.show();
                $parent.containers.buttonBar.hiddenNetwork.on('tap', $parent.listeners.hiddenNetwork);
                $parent.containers.buttonBar.help.on('tap', $parent.listeners.help);
                break;
            }
        }
    },

    onDeviceReady: function () {
        wemoUtil.infoLog(setupWifi.TAG, 'onDeviceReady');

        setupWifi.topControllers.containers.moreMenu = {
            shell: $('header.main_header > span.more_tab_icon'),
            hiddenNetwork: $('#dropdown_hidden_network'),
            itemsToHide: $('#more_new_firmware,#more_setup_another_device,#more_remote_access,#more_connect_to_IFTTT,#more_settings_and_about,#more_tell_us_what_you_think,#more_help_center,#find_and_pair_Newdevice,#more_WeMoCommunity,#more_SupportArticles'),
            itemsToShow: $('#dropdown_hidden_network,#dropdown_help,#setup_help'),
        };
        setupWifi.topControllers.containers.buttonBar = {
            shell: $('header.main_header > span.headerBtns'),
            hiddenNetwork: $('#pairing_hidden_network'),
            help: $('#pairing_help_link')
        };
        setupWifi.topControllers.initiate(setupWifi.topControllers.types.MORE_MENU);

        setupWifi.bindEvents();
        window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Help_WeMo_SetUp_Url']);
        $('#setup_sub_header').html(wemo.items['SelectHomenetwork']);

        var APList = window.sessionStorage.getItem(sessionStore.AP_LIST);

        APList = JSON.parse(APList);
        setupWifi.buildAPList(APList);
        setupWifi.setupListeners();
        setupWifi.getWiFiList();

        var deviceType = window.sessionStorage.getItem('device_SSID');
        var searchType1 = deviceType.search("Bridge");
        var searchType2 = deviceType.search("Link");

        $(".backbutton").on("tap", setupWifi.onBackPress);

        console.log("entering in plugindetails " + deviceType + "---" + searchType1 + "--" + searchType2);

        if (searchType1 != -1 || searchType1 == true || searchType2 != -1 || searchType2 == true) {
            setupWifi.getBridgeInfo();
        }

        $('#multiple_bridge_cancel_btn').on('click', function () {
            $("#multiple_bridge_popup").popup("close");
            setupWifi.closeAccessPoint();
        });

        $('#multiple_bridge_no_btn').on('click', function () {
            $("#multiple_bridge_popup").popup("close");
            setupWifi.closeAccessPoint();
        });

        $('#multiple_bridge_yes_btn').on('click', function () {
            $("#multiple_bridge_popup").popup("close");
            window.sessionStorage.setItem(sessionStore.LED_MULTIPLE_BRIDGE_INFO, true);
        });

        nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);


    },

    bindEvents: function () {
        wemoUtil.infoLog(setupWifi.TAG, "bindEvents");
        document.addEventListener('online', setupWifi.onOnline, false);
        document.addEventListener('offline', setupWifi.onOffline, false);
        document.addEventListener("backbutton", setupWifi.onBackPress, false);
        document.addEventListener("pause", setupWifi.onPause, false);
        document.addEventListener("resume", setupWifi.onResume, false);
    },

    onOffline: function () {
        wemoUtil.infoLog(setupWifi.TAG, "offLine");
    },

    onOnline: function () {
        wemoUtil.infoLog(setupWifi.TAG, "onLine");
    },

    onBackPress: function () {
        if ($(".more_tab").is(":visible")) {
            $(".more_tab").hide();
            $('body').find('.modalWindow').transition({
                opacity: 0
            }, 400, function () {
                $(this).removeClass('isOpen');
            });
        } else {
            wemoUtil.infoLog(setupWifi.TAG, "onBackPress");
            wemoUtil.exitApp();
        }
    },

    onPause: function () {
        wemoUtil.infoLog(setupWifi.TAG, "onPause");
        wemoUtil.exitApp();
    },

    onResume: function () {
        wemoUtil.infoLog(setupWifi.TAG, "onResume");
    },

    reportError: function (e) {
        wemoUtil.infoLog(setupWifi.TAG, "Plugin Error!!!!   " + e);
    },

    setupListeners: function () {

        $('#wifi_ap_list').on('click', '> li', function () {
            var item = $(this);
            //alert("setupListeners-Before:  "+item.attr('SSID')+"  ::  "+item.attr('hiddenSSID'));
            /*    if(item.attr('hiddenSSID') != ''){
                	item.attr('SSID',item.attr('hiddenSSID'));
                	//alert("SSID:  "+item.attr('SSID'));
                }*/
            //item.attr('SSID') = wemoUtil.handelSingleDobuleQuotes(item.attr('SSID'));
            var decodedSSID = decodeURIComponent(item.attr('SSID'));
            window.sessionStorage.setItem("sec_ssid", decodedSSID);
            //alert("setupListeners-After:  "+item.attr('SSID'));

            window.sessionStorage.setItem("sec_signalStrength", item.attr('SignalStrength'));
            window.sessionStorage.setItem("sec_securitystrength", item.attr('SecurityStrength'));
            window.sessionStorage.setItem("sec_channel", item.attr('Channel'));
            if (item.attr('SecurityStrength') != "OPEN/NONE") {
                wemoUtil.loadUrl(filePath.DEVICE_PASSWORD);
            } else {
                window.sessionStorage.setItem("sec_password", '');
                window.sessionStorage.setItem(sessionStore.STARTUP_MODE, startupMode.MANUAL_CONNECT);
                wemoUtil.loadUrl(filePath.INDEX);
            }
        });
    },

    buildAPList: function (APList) {
        var li_list = '';
        wemoUtil.infoLog(setupWifi.TAG, "APList length: " + APList.length + JSON.stringify(APList));
        for (var i = 0; i < APList.length; i++) {
            var open = false;
            //alert("APList length: " + APList.length + JSON.stringify(APList));
            if (APList[i][key.DEVICE_SECURITY_STRENGTH] == "OPEN/NONE") {
                open = true;
                secrityText = "";
                //		            ap_password_popup = '';
            } else {
                open = false;
                secrityText = "Secured with " + APList[i][key.DEVICE_SECURITY_STRENGTH];
                wemoUtil.infoLog(setupWifi.TAG, 'aaaa' + secrityText);
                //		                  ap_password_popup='#ap_password_popup';
            }
            var image_class = (open) ? '' : 'net_work_lock ';
            
            if (APList[i][key.DEVICE_SECURITY_SIGNALSTRENGTH] > 75) {
                image_class += "wifi_signal_full";
            } else if (APList[i][key.DEVICE_SECURITY_SIGNALSTRENGTH] > 50) {
                image_class += "wifi_signal_2";
            } else if (APList[i][key.DEVICE_SECURITY_SIGNALSTRENGTH] > 25) {
                image_class += "wifi_signal_1";
            } else if (APList[i][key.DEVICE_SECURITY_SIGNALSTRENGTH] > 0) {
                image_class += "wifi_signal_0";
            } else {
                image_class += "wifi_signal_empty";
            }

            wemoUtil.infoLog(setupWifi.TAG, "ClassName:" + image_class);

            wemoUtil.infoLog(setupWifi.TAG, "channel:" + APList[i][key.DEVICE_SECURITY_CHANNEL]);

            //	If SSID is haveing Single/Double Quotes, here code is replacing it with HTML Number &#39;/&#34;
            //	Via method wemoUtil.handelSingleDobuleQuotes(<string>);
            // var hiddenSSID = '';
            /*  if (APList[i][key.DEVICE_SECURITY_SSID].indexOf('\'') >= 0 || APList[i][key.DEVICE_SECURITY_SSID].indexOf('"') >= 0) {
              	hiddenSSID = wemoUtil.handelSingleDobuleQuotes(APList[i][key.DEVICE_SECURITY_SSID]);
              }*/
            if (APList[i][key.DEVICE_SECURITY_SSID].indexOf('<') >= 0 || APList[i][key.DEVICE_SECURITY_SSID].indexOf('>') >= 0) {
                actualSSID = wemoUtil.handleSpecialChars(APList[i][key.DEVICE_SECURITY_SSID]);
            } else {
                actualSSID = APList[i][key.DEVICE_SECURITY_SSID];
            }
            var encodedSSID = encodeURIComponent(APList[i][key.DEVICE_SECURITY_SSID]);
            li_list += '<li  id="wifi_ap_' + i + '" SSID="' + encodedSSID + '" SignalStrength="' + APList[i][key.DEVICE_SECURITY_SIGNALSTRENGTH] + '" SecurityStrength="' + APList[i][key.DEVICE_SECURITY_STRENGTH] + '" Channel="' + APList[i][key.DEVICE_SECURITY_CHANNEL] + '" class="' + image_class + '">' +
                actualSSID +
                '</li>';
            //		        console.log("AP details: " + APList[i].ssid);
            //		        console.log("AP details: " + APList[i].SignalStrength);
            //		        console.log("AP details: " + APList[i].SecurityStrength);
            //		        console.log("AP details: " + APList[i].Channel);
        }
        wemoUtil.infoLog(setupWifi.TAG, 'UL: ' + li_list);
        setTimeout(
            function () {
                $("#loader").removeClass().cssLoader({
                    show: false
                });
            },
            2000
        );

        $('#wifi_ap_list').html(li_list);

        /*$('#wifi_ap_list li').on('click',function(){

            sessionStorage.setItem("sec_ssid", $(this).attr('SSID'));
            sessionStorage.setItem("sec_signalStrength", $(this).attr('SignalStrength'));
            sessionStorage.setItem("sec_securitystrength", $(this).attr('SecurityStrength'));
            wemoUtil.infoLog(setupWifi.TAG,"channel: " + $(this).attr('Channel'));
            sessionStorage.setItem("sec_channel", $(this).attr('Channel'));

            if( $(this).attr('SecurityStrength') != "OPEN/NONE"){
                wemoUtil.loadUrl(filePath.DEVICE_PASSWORD);
            }
        });*/
    },

    getWiFiList: function () {
        setInterval(function () {
            $("#loader").cssLoader();
            wemoUtil.infoLog(setupWifi.TAG, 'started');
            setTimeout(
                function () {
                    setupPlugin.execute(
                        function (aplist) {
                            window.sessionStorage.setItem(sessionStore.AP_LIST, JSON.stringify(aplist));
                            setupWifi.buildAPList(aplist);
                        },
                        setupWifi.reportError,
                        ACTION_GET_WIFI_AP_LIST, []
                    );
                },
                timeout.LONG
            );
        }, timeout.WIFI_REFRESH)
    },

    getBridgeInfo: function () {

        nativeUtilPlugin.execute(
            function (result) {

                var deviceType = window.sessionStorage.getItem('device_SSID');

                console.log("entering in getBridgeInfo" + deviceType + "---" + result + "===" + JSON.stringify(result) + "---" + result.length);

                if (result == "" || result == null || result == undefined || result.length == 0) {
                    console.log("entering in getBridgeInfo if");
                    //setupWifi.setBridgeInfo(deviceType);
                    window.sessionStorage.setItem(sessionStore.LED_MULTIPLE_BRIDGE_UDN, deviceType);
                } else {
                    if (deviceType != $.trim(result) && deviceType != null) {
                        console.log("entering in getBridgeInfo else");
                        setTimeout(function () {
                            $("#multiple_bridge_header").html(wemo.items['AnotherWeMoLink_heading']);
                            $("#multiple_bridge_body").html(wemo.items['AnotherWeMoLink_description']);
                            $("#multiple_bridge_popup").popup();
                            $("#multiple_bridge_popup").popup('open');
                        }, 500);
                    } else
                        window.sessionStorage.setItem(sessionStore.LED_MULTIPLE_BRIDGE_UDN, deviceType);

                }

            },
            setupWifi.reportError,
            ACTION_GET_BRIDGE_DATA, []
        );

    },

    closeAccessPoint: function () {

        setupPlugin.execute(
            function (result) {
                console.log("Close AP success callback");
                setTimeout(function () {
                    setTimeout(function () {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                    }, 500);

                    setTimeout(function () {
                        setupWifi.getNetworkType();
                    }, 4000);

                }, timeout.AP_CLOSE);
            },
            setupWifi.accesspointError,
            ACTION_CLOSE_ACCESS_POINT, []
        );
    },

    getNetworkType: function () {
        nativeUtilPlugin.execute(
            setupWifi.processNetworkType,
            setupWifi.reportError,
            actions.GET_NETWORK_TYPE_NEW, []
        );
    },

    processNetworkType: function (type) {
        console.log(TAG + "processNetworkType: " + type);
        switch (type) {
        case networkType.HOME_NETWORK:
            window.sessionStorage.setItem(sessionStore.REMOTE_MODE, false);
            devicePlugin.execute(null, setupWifi.reportError, actions.INITIALIZE_UPNP, []);
            setupWifi.loadDeviceListPage();
            break;
        case networkType.REMOTE_WIFI:
            window.sessionStorage.setItem(sessionStore.REMOTE_MODE, true);
            setupWifi.loadDeviceListPage();
            break;
        case networkType.REMOTE_MOBILE:
            console.log("REMOTE_MOBILE:  " + networkType.REMOTE_MOBILE);
            nativeUtilPlugin.execute(
                function (enabled) {
                    console.log("Remote enabled: " + enabled);
                    if (enabled) {
                        console.log("Load Device List Page");
                        window.sessionStorage.setItem(sessionStore.REMOTE_MODE, true);
                        nativeUtilPlugin.execute(null, setupWifi.reportError, actions.PREF_SET_GET_STARTED_NEEDED, [false]);
                        setupWifi.loadDeviceListPage();
                    } else {
                        console.log("Load Remote Not Available Page");
                        setupWifi.loadRemoteNotAvailablePage();
                    }
                },
                setupWifi.reportError,
                actions.PREF_IS_REMOTE_ENABLED, []
            );
            break;
        case networkType.WEMO:
            setupWifi.loadIndexPage();
            break;

        case networkType.NO_NETWORK:
            console.log("No Network");
            setTimeout(function () {
                console.log("Get Network Type again");
                setupWifi.getNetworkType();
            }, timeout.NETWORK_RETRY);

            break;

        default:
            console.log("Not supported ");
            return;
            break;
        }
    },

    loadDeviceListPage: function () {
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        setTimeout(function () {
            wemoUtil.loadUrl(filePath.DEVICE_LIST);
        }, timeout.CONTROL_POINT_DELAY);

    },

    accesspointError: function (e) {
        console.log(TAG + "Plugin Failure Call back accesspoint!!!!   " + e);
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        setupWifi.loadDeviceListPage();
    },

    loadRemoteNotAvailablePage: function () {
        wemoUtil.infoLog(index.TAG, 'loadRemoteNotAvailablePage');
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        wemoUtil.loadUrl(filePath.REMOTE_NOT_AVAILABLE);
    }

};
