/*
 remote_access.js

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

var TAG = "remote_access.js: ";
var remoteAccess = "";
var homeId = "";
var isHomeNetwork;
var isTransacting;
var deviceUniqueIdentifier = "";

$(document).bind('pageinit', function() {
    var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));
    remote_access.initialize();
});

var remote_access = {
    TAG: 'remote_access.js: ',

    log: function(string) {
        console.log(remote_access.TAG + string);
    },

    infoLog: function(string) {
        if (true) {
            remote_access.log(string);
        }
    },

    initialize: function() {
        console.log(TAG + "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    onDeviceReady: function() {
        console.log(TAG + "onDeviceReady");
        $('#more_remote_access').addClass('none');
        remote_access.bindEvents();
        //All initialization script goes here
        //get localization content

        if(window.sessionStorage.getItem('isRemote') === "true"){
            $('.remote-devices-list').hide();
        }

        $(document).ready(function() {
            $('#remoteAccessStatusText').hide();
            remote_access.getRemoteDetails(sessionStore.REMOTE_SETTING_DISPLAY);
        });

        //To return back to home page: device list tab
        $(".backbutton").on("tap", remote_access.onBackPress);

        $("#enable_remote_access_popup_ok").on("tap", function() {
            $("#enable_remote_access_popup").popup("close");
            document.ontouchmove = function(e) {
                return true;
            }
        });


        $("#remote_access_fail_popup_ok").on("tap", function() {
            $("#remote_access_fail_popup").popup("close");
            document.ontouchmove = function(e) {
                return true;
            }
        });


        //Clear Name Icon Rules Popup Open
        $("#clear_name_icon_button").on("click", function() {
            $("#clear_name_icon_rules").popup("open");
            document.ontouchmove = function(e) {
                e.preventDefault();
            }
        });

        //Save Button on Click Clear Name Icon Rules Save
        $("#clear_name_icon_rules_save_btn").on("click", function() {

        });

        //Cancel Button on click Clear Name Icon Rules Popup Close
        $("#clear_name_icon_rules_cancel_btn").on("tap", function() {
            $("#clear_name_icon_rules").popup('close');
            document.ontouchmove = function(e) {
                return true;
            }
        });

        //Reset to Factory Defaults popup Open
        $("#reset_button").on("tap", function() {
            $("#reset_factory_defaults").popup("open");
            document.ontouchmove = function(e) {
                e.preventDefault();
            }
        });

        //On click Reset Button Reset to Factory Defaults
        $("#reset_factory_defaults_reset_btn").on("click", function() {

        });

        //Cancel Button on click Reset to Factory Defaults Popup Close
        $("#reset_factory_defaults_cancel_btn").on("click", function() {
            $("#reset_factory_defaults").popup('close');
            document.ontouchmove = function(e) {
                return true;
            }
        });

        $('#enable_remote_access').on('click', function() {
            remote_access.checkDevicesFromUpNp();
            window.sessionStorage.setItem('remoteChanged', true);
            return;
        });

        $('#reset_button').on('pointerdown', function() {
            if(window.sessionStorage.getItem('hasNest') === 'true'){
                $('#remote_access_disable_nest_popup').popup('open');
            } else {
                remote_access.forgetDisableOnCloud();
                window.sessionStorage.setItem('remoteChanged', true);
            }
        });

        $('#remote_access_disable_nest_popup_disable').on('tap', function(){
            $('#remote_access_disable_nest_popup').popup('close');
            remote_access.forgetDisableOnCloud();
            window.sessionStorage.setItem('remoteChanged', true);
        });

        $('#remote_access_disable_nest_popup_cancel').on('tap', function(){
            $('#remote_access_disable_nest_popup').popup('close');
        });

    },

    checkDevicesFromUpNp: function() {
        remote_access.showModal();

        devicePlugin.execute(function(type) {
                if (type != networkType.NO_NETWORK) {
                    remote_access.remoteEnableFromUpNp();
                    return;
                } else {
                    remote_access.hideModal();
                    $('#remote_access_fail_popup').popup('open');
                    return;
                }
            },
            function(err) {
                remote_access.hideModal();
                remote_access.reportError(err);
            }
            , actions.GET_NETWORK_TYPE, []);
    },

    remoteEnableFromUpNp: function() {
        var enableRemoteAccessManually = "true";
        devicePlugin.execute(
            function(responseAry) {
                remote_access.hideModal();
                if (responseAry[0]) {
                    remote_access.showEnabledElements();
                    $("#remote_access_status_text").text(responseAry[1]);
                    remote_access.getRemoteDetails(sessionStore.REMOTE_SETTING_ENABLE);
                } else {
                    remote_access.showDisabledElements();
                }
            },
            function(err) {
                remote_access.hideModal();
                $('#remote_access_fail_popup').popup('open');
                document.ontouchmove = function(e) {
                    e.preventDefault();
                }
            },
            actions.SET_REMOTE_ACCESS, [enableRemoteAccessManually]
        );
    },


    showEnabledElements: function() {
        window.sessionStorage.setItem(sessionStore.REMOTE_LOCAL, true);
        window.sessionStorage.setItem("isRemoteEnabled", true);
        $("#before_remote_enable").hide();
        $(".after_remote_enable").show();
        $('#reset_button').show();
        $('#enable_remote_access').hide();
        $(".bottom_single_button").css("border-top", "1px solid #999999");
    },

    showDisabledElements: function() {
        window.sessionStorage.setItem(sessionStore.REMOTE_LOCAL, false);
        var isRemoteMode = window.sessionStorage.getItem(sessionStore.REMOTE_MODE);
        window.sessionStorage.setItem("disableRemoteInRemoteMode", isRemoteMode);
        window.sessionStorage.setItem("isRemoteEnabled", false);
        $("#before_remote_enable").show();
        $(".after_remote_enable").hide();
        $('#reset_button').hide();
        $('#enable_remote_access').show();
        $(".bottom_single_button").css("border-top", "1px solid #999999");
    },

    getRemoteDetails: function(remoteParam) {
        console.log("getRemoteDetails remoteParam : " + remoteParam);

        setTimeout(function() {
            devicePlugin.execute(
                function(responseAry) {
                    console.log("responseAry " + responseAry);

                    deviceUniqueIdentifier = responseAry[0];
                    remoteAccess = responseAry[1];
                    homeId = responseAry[3];
                    isHomeNetwork = responseAry[4];
                    isRemoteEnableGoing = responseAry[5];
                    if(isRemoteEnableGoing==true)
                    {
                    	setTimeout(function() {
                    		remote_access.getRemoteDetails(sessionStore.REMOTE_SETTING_ENABLE);
                    	}, timeout.ENABLE_REMOTE_ACCESS_DELAY);
                    }
                    else
                    {
                    	if (remoteAccess == false) {
                    		remote_access.showDisabledElements();
                    		remote_access.hideModal();
                    	} else {
                    		if (responseAry[1] && homeId != null) {
                    			$("#remote_access_status_text").html(wemo.items['RemoteAccessConnectedTo'] + ': <div class="text_strong">' + responseAry[2] + '</div>');
                    			if (isHomeNetwork) {
                                    remote_access.showModal();
                    				devicePlugin.execute(
                    						function(uuid) {
                    							remote_access.smartDevicesOnCloud(remoteParam, uuid);
                    							remote_access.infoLog("SMART_DEVICE_UUID success callback: " + status);
                    						},
                    						remote_access.reportError,
                    						actions.SMART_DEVICE_UUID, []
                    				);
                    			} else {
                    				remote_access.showEnabledElements();
                    				remote_access.hideModal();
                    			}
                    		} else {
                    			remote_access.showDisabledElements();
                    			remote_access.hideModal();
                    		}
                    		remote_access.infoLog("Remote access status success callback: " + status);
                    	}
                    }
                },
                remote_access.reportError,
                actions.GET_REMOTE_ACCESS, []
            );
        }, 200);

    },

    updateSmartDeviceOnCloud: function(uuid, status) {
        cordova.exec(function(params) {
            console.log("success call back");
            var authCode = params[0];
            console.log("authCode: " + authCode);
            $.ajax({
                url: cloudAPI.SMARTDEVICE_DISABLE + uuid + "/" + status,
                type: "POST",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('Content-Type', 'application/xml');
                    xhr.setRequestHeader('Authorization', authCode);
                },
                success: function(data) {
                    console.log(" updateSmartDeviceOnCloud Sucess from smart device cloud..." + data);
                    remote_access.hideModal();
                },
                error: function(xhr, textstatus) {
                    console.log(" updateSmartDeviceOnCloud Error call back string status : " + xhr.status + 'status text: ' + xhr.statusText);
                    remote_access.hideModal();
                },
                statusCode: {
                    500: function() {
                        console.log(" updateSmartDeviceOnCloud page not found");
                    }
                }
            });

        }, function(err) {
            console.log("failure call back");
        }, "WebServicePlugin", "getAuthCode", []);

    },


    forgetDisableOnCloud: function() {

        cordova.exec(function(params) {
        	 wemoUtil.infoLog(TAG,"success call back forgetDisableOnCloud");
            var authCode = params[0];
            console.log("forgetDisableOnCloud: " + deviceUniqueIdentifier);
            $.ajax({
                url: cloudAPI.SMARTDEVICE_DISABLE + deviceUniqueIdentifier + "/0",
                type: "POST",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('Content-Type', 'application/xml');
                    xhr.setRequestHeader('Authorization', authCode);
                },
                success: function(data) {
                	wemoUtil.infoLog(TAG,"Sucess from cloud..." + data);
                	window.sessionStorage.setItem(sessionStore.REMOTE_MODE, false);
                	smartDevicePlugin.execute(function(params) {
                		wemoUtil.infoLog(TAG, "cache cleared ");
                	},
                	function(err) {
                		wemoUtil.infoLog(TAG, "ACTION RESET Error");
                	},actions.ACTION_RESET_HOME_NETWORK,[]);
                	remote_access.showDisabledElements();

                	/* $(data).find('smartDevice').each(function() {
                        var remote_access_status = $(this).find("status").text();
                        if (remote_access_status == '0') {
                            nativeUtilPlugin.execute(
                                function() {
                                    WeMoDeviceList.clear();
                                    WeMoDeviceList.updateCache();
                                    window.sessionStorage.setItem(sessionStore.REMOTE_MODE, false);
                                    console.log("Disable remote access sucessfully..., cleared cache");
                                    devicePlugin.execute(null,null,actions.INITIALIZE_UPNP,[]);
                                },
                                remote_access.reportError,
                                actions.PREF_SET_REMOTE_ENABLED, [false]
                            );

                        }
                    });*/
                },
                error: function(xhr, textstatus) {

                    wemoUtil.infoLog(TAG,"forgetDisableOnCloud Error call back status : " + xhr.status + 'status text: ' + xhr.statusText);
                },
                statusCode: {
                    500: function() {
                    	 wemoUtil.infoLog(TAG,"forgetDisableOnCloud page not found");
                    }
                }

            });

        }, function(err) {
            console.log("forgetDisableOnCloud failure call back");
        }, "WebServicePlugin", "getAuthCode", []);

    },

    smartDevicesOnCloud: function(remoteParam, uuid) {
    	wemoUtil.infoLog(TAG, "smartDevicesOnCloud remoteParam : " + remoteParam);
        var appdata = "";
        /* Collect app Data
         *
         */
        nativeUtilPlugin.execute(
            function(params) {
                appdata = params;
                wemoUtil.infoLog(TAG, "smartDevicesOnCloud appdata: " + appdata);
            },
            function(err) {
                alert("ANALYTICS_DATA not found.");
            }, actions.ANALYTICS_DATA, []
        );

        cordova.exec(function(params) {
        	wemoUtil.infoLog(TAG, "smartDevicesOnCloud success call back, calling cloudAPI.SMARTDEVICE_LIST");
            var authCode = params[0];
            var urlStr = cloudAPI.SMARTDEVICE_LIST + homeId + "?smartUniqueId=" + uuid + "&appData=" + escape(appdata);
            console.log("authCode: " + authCode + " urlStr: " + urlStr);
            $.ajax({
                url: urlStr,
                type: "GET",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('Content-Type', 'application/xml');
                    xhr.setRequestHeader('Authorization', authCode);
                },
                timeout: timeout.URL_TIMEOUT_SMARTDEVICE_LIST,
                success: function(data) {
                	wemoUtil.infoLog(TAG, "smartDevicesOnCloud Success from cloud..." + data + "  ::  " + $(data).find('smartDevice') + "  ::  " + $(data).find('smartDevice').length);
                    $('#device_list_container').empty();

                    var clearData = false;

                    $(data).find('smartDevice').each(function() {
                        var device_id = $(this).find("smartDeviceId").text();
                        var device_desc = $(this).find("description").text();
                        var device_uniqueid = $(this).find("uniqueId").text();
                        var device_status = $(this).find("status").text();

                        wemoUtil.infoLog(TAG, "Device Status " + device_status + " Smart Device Details : " + uuid + "device_uniqueid : " + device_uniqueid + " device_id : " + device_id);

                        var smartDeviceObject = new Object();
                        smartDeviceObject[smartKey.SMART_DEVICE_ID] = device_id;
                        smartDeviceObject[smartKey.SMART_DEVICE_DESC] = device_desc;
                        smartDeviceObject[smartKey.SMART_DEVICE_UNIQUEID] = device_uniqueid;
                        smartDeviceObject[smartKey.SMART_DEVICE_STATUS] = device_status;

                        if (uuid == device_uniqueid) {
                            console.log(JSON.stringify(smartDeviceObject));
                            if (device_status == "0") {

                                devicePlugin.execute(
                                    function() {
                                        remote_access.bindFlip();
                                        remote_access.hideModal();
                                        if (remoteParam == sessionStore.REMOTE_SETTING_ENABLE) {
                                            $('#enable_remote_access_popup').popup('open');
                                            document.ontouchmove = function(e) {
                                                e.preventDefault();
                                            }
                                        }
                                        wemoUtil.infoLog(TAG, "SMART_DEVICE_CLEAR_DATA success callback: " + status);

                                        remote_access.showDisabledElements();

                                    },
                                    remote_access.reportError,
                                    actions.SMART_DEVICE_CLEAR_DATA, []
                                );

                            } else {
                                remote_access.showEnabledElements();

                            }
                        } else {
                        	wemoUtil.infoLog(TAG, "Smart Device object: " + JSON.stringify(smartDeviceObject));
                            remote_access.buildCloudListItem(smartDeviceObject);

                        }
                        //						    remote_access.buildCloudListItem(smartDeviceObject);

                    });
                    
                	remote_access.bindFlip();
                    remote_access.hideModal();
                    wemoUtil.infoLog(TAG, "remoteParam else : " + remoteParam);
                	if (remoteParam == sessionStore.REMOTE_SETTING_ENABLE) {
                        $('#enable_remote_access_popup').popup('open');
                        document.ontouchmove = function(e) {
                            e.preventDefault();
                        }
                    }
                    


                },
                error: function(xhr, textStatus, errorThrown) {
                	wemoUtil.infoLog(TAG, "smartDevicesOnCloud Error textStatus: " + textStatus + " errorThrown: " + errorThrown + "xhr status : " + xhr.status);
                    remote_access.hideModal();
                    // This pop up is not required because remote is enabled , error occurs in getting the smart device list from cloud 
                    // so showing the remote enable state
                    remote_access.showEnabledElements();
                    /* $('#remote_access_fail_popup').popup('open');
                    document.ontouchmove = function (e) {
                        e.preventDefault();
                    }*/

                },
                statusCode: {
                    500: function() {
                    	wemoUtil.infoLog(TAG, "smartDevicesOnCloud error code 500");
                    }
                }

            });

        }, function(err) {
            remote_access.hideModal();
            console.log("smartDevicesOnCloud failure call back");
        }, "WebServicePlugin", "getAuthCode", []);

    },

    buildCloudListItem: function(device) {
        console.log("device json: " + JSON.stringify(device));

        var deviceDesc = wemoUtil.utf2html( device[smartKey.SMART_DEVICE_DESC] );
        console.log("Device Desc : " + deviceDesc);
        var curval = 'off';

        if (device[smartKey.SMART_DEVICE_STATUS] == "1") { //SwitchOnAccessibilityLabel
            curval = 'on';
        }

        var listItem = '<li name="switch_li" id= "' + device[smartKey.SMART_DEVICE_UNIQUEID] + '" class="remote_access_tr">' +
            '<div name="name_device_desc" class="remote_access_cell"><span style="display: block; overflow: hidden !important; width: ' + (wemoUtil.getScreenWidth() / 2).toString() + 'px !important;">' + deviceDesc +
            '</span></div>' +
            '<div id="toggle_on_off_' + wemoUtil.md5(device[smartKey.SMART_DEVICE_UNIQUEID]) + '" class="toggle_control">' +
            '</div>' +
            '</li>';

        $(listItem).hide().prependTo('#device_list_container').slideDown("slow");

        $('select').slider();

        if(curval === 'off'){
            $('#toggle_on_off_' + wemoUtil.md5(device[smartKey.SMART_DEVICE_UNIQUEID])).addClass('off');
        }
        $('#toggle_on_off_' + wemoUtil.md5(device[smartKey.SMART_DEVICE_UNIQUEID])).on("tap", function(e) {
            $(e.currentTarget).toggleClass('off');
            remote_access.updateSmartDeviceOnCloud(device[smartKey.SMART_DEVICE_UNIQUEID], ($(e.currentTarget).hasClass('off')) ? 0 : 1);
        });

        $('select').slider();
    },

    showModal: function() {
        nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
    },

    hideModal: function() {
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
    },


    bindEvents: function() {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', remote_access.onOnline, false);
        document.addEventListener('offline', remote_access.onOffline, false);
        document.addEventListener("backbutton", remote_access.onBackPress, false);
        document.addEventListener("pause", remote_access.onPause, false);
        document.addEventListener("resume", remote_access.onResume, false);
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
            wemoUtil.loadUrl(filePath.MORE_MENU);
        }
    },

    onPause: function() {
        console.log(TAG + "onPause");
    },

    onResume: function() {
        console.log(TAG + "onResume");
        remote_access.getNetworkTypeOnResume();
    },

    reportError: function(e) {
        console.log(TAG + "Plugin Error!!!!   " + e);
        remote_access.hideModal();
    },

    bindFlip: function() {

        $('#device_list_container').find("li").find("select").on('change', function() {

            var uuidVal = $(this).attr('id');
            var statusVal = "";
            if ($(this).val() == "on") {
                statusVal = "1";
            } else {
                statusVal = "0";
            }
            remote_access.updateSmartDeviceOnCloud(uuidVal, statusVal);
        });
    },
    /* get network type when app goes to background/foreground */
    getNetworkTypeOnResume: function() {
        nativeUtilPlugin.execute(
            remote_access.processNetworkTypeOnResume,
            remote_access.reportError,
            actions.GET_NETWORK_TYPE_NEW, []
        );
    },

    /* Process network change when app goes to background/foreground */
    processNetworkTypeOnResume: function(type) {
        switch (type) {
            case networkType.REMOTE_WIFI:
            case networkType.REMOTE_MOBILE:
                console.log(TAG + "processNetworkTypeOnResume:remote");
                window.sessionStorage.setItem(sessionStore.REMOTE_MODE, true);
                break;
        }
    }


};
