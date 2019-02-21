/*
 edit_device.js

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

$(document).bind('pageinit', function() {
    editDevice.setStyleCss();
    editDevice.initialize();
});
var switchType;
var prevSwitchType;
var sensorType;
var prevSensorType;
var selectedSwitchType = 0;
var selectedSensorType = 0;
var pictureSource;
var destinationType;
var type;
var lightswitchbacklighttapped = false;
var attributeListJson;
var allRulesRows = [];
var makerSwitchRuleIDs = [];
var makerSensorRuleIDs = [];
var isSwitchStateChanged = -1; // 1 for switch state & 0 for sensor
var arrCurrency = {
    "0": "$", //default value
    "1": "$",
    "4": "&euro;",
    "3": "&pound;",
    "10": "&yen;",
    "13": "&#8361;",
    "15": "&#3647;",
    "7": "&#8369;"
};



var editDevice = {

    TAG: 'edit_device.js: ',

    imageChanged: false,

    initialize: function() {
        wemoUtil.infoLog(editDevice.TAG, 'initialize');
        document.addEventListener('deviceready', this.onDeviceReady, false);
        $('.insight_type_option').hide();
        $('.reset_options').hide();
        $('.ResetDevice_Label').hide();
    },

    onDeviceReady: function() {
        wemoUtil.infoLog(editDevice.TAG, 'onDeviceReady');
        editDevice.bindEvents();
        //All initialization script goes here

        $.getScript('../../../android_asset/www/js/classes/deviceObject.js', function() {
            $.getScript('../../../android_asset/www/js/classes/remoteAccess.js', function() {
                if (isRemoteEnabled) {
                    $.getScript('../../../android_asset/www/js/classes/cloudServices.js', function() {
                        editDevice.mainMethod();
                    });

                } else {
                    editDevice.mainMethod();
                }
            });
        });

    },

    mainMethod: function() {

        pictureSource = navigator.camera.PictureSourceType;
        destinationType = navigator.camera.DestinationType;

        wemoUtil.infoLog(editDevice.TAG, window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME));
        wemoUtil.infoLog(editDevice.TAG, window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL));
        wemoUtil.infoLog(editDevice.TAG, window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN));

        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URI, editDevice.getDfaultURI());
        var ssid = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_SSID);
        if (!isRemoteEnabled) {
            $('.display_deivce_id').show();
            $('#device_ssid').html(ssid);
            $('#displayDeviceId').empty().append(ssid);
        }

        wemoUtil.infoLog(editDevice.TAG, ssid);
        var udn = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN);
        if (wemoUtil.isMakerDevice(udn)) {
            editDevice.getSwitchRuleId(wemoUtil.getMakerSwithUDN(udn));
            editDevice.getSensorRuleId(wemoUtil.getMakerSensorUDN(udn));
            $("#rules_switch_disable_dlg").popup();
            $("#rules_sensor_disable_dlg").popup();
        }

        $("#settings_not_saved").popup();
        $('#edit_device_icon').attr('src', window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL));
        $('#device_edit_friendly_name').val(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME));


        type = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_TYPE);

        if (type == wemoInsight.TYPE || type == wemoInsight.REMOTE_TYPE) {
            $('.insight_type_option').show();
            $('.reset_options').show();
            $('.ResetDevice_Label').show();

            if (isRemoteEnabled) {
                var mac = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_MAC);
                var pluginid = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_PLUGIN_ID);
                var request = editDevice.buildXMLRequest(buildXML.GET_DEV_STAT, pluginid, mac, null);
                wemoUtil.infoLog(editDevice.TAG,request);

                //TODO load data from cloud, then call device_list.fillInsightDeviceStatistic()
                cordova.exec(
                    function(params) {
                        wemoUtil.infoLog(editDevice.TAG, "success call back" + params[1] + " : " + params[0]);
                        var homeId = params[1];
                        var authCode = params[0];

                        wemoUtil.infoLog(editDevice.TAG, "*request " + request);
                        wemoUtil.infoLog(editDevice.TAG, "success call back home id: " + homeId);
                        wemoUtil.infoLog(editDevice.TAG, "success call back authCode: " + authCode);

                        $.ajax({
                            url: cloudAPI.INSIGHT_PARAMS,
                            data: request,
                            type: "POST",
                            beforeSend: function(xhr) {
                                xhr.setRequestHeader('Content-Type', 'application/xml');
                                xhr.setRequestHeader('Authorization', authCode);
                            },
                            success: function(data) {
                                wemoUtil.infoLog(editDevice.TAG, "**success callback from cloud");

                                var responseXML = (new XMLSerializer()).serializeToString(data);
                                var splitLength = 4000;
                                var length = responseXML.length;
                                var ittr = Math.floor(length / splitLength) + 1;
                                for (var i = 0; i < ittr; i++) {
                                    var end = ((i + 1) * splitLength);
                                    if (end > length) {
                                        end = length;
                                    }
                                    wemoUtil.log(editDevice.TAG, responseXML.substring(splitLength * i, end));
                                }

                                $(data).find('applianceConsumption').each(function(i) {
                                    wemoUtil.infoLog(editDevice.TAG, "Plugin:: " + i);
                                    var session_threshold = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_POWER_THRESHOLD);
                                    if (!session_threshold) {
                                        var powerThreshold = parseInt($(this).find("powerThreshold").text());
                                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_POWER_THRESHOLD, powerThreshold);
                                        powerThreshold = Math.round(parseInt(powerThreshold, 10) / 1000) + " " + wemo.items['Power_Unit'];
                                        editDevice.fillCurrentValue('.power_threshold_current_value', powerThreshold);
                                    } else {
                                        var powerThreshold = Math.round(parseInt(session_threshold, 10) / 1000) + " " + wemo.items['Power_Unit'];
                                        editDevice.fillCurrentValue('.power_threshold_current_value', powerThreshold);
                                    }

                                    state = $(this).find("status").text();
                                    window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_POWER_STATE, state);
                                    powerNow = parseFloat($(this).find("instantaneousPower").text());
                                    window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_POWER_NOW, powerNow);

                                });

                                var session_cost_per = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_COST_PER_KWH);
                                var currency = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY);
                                var currency_sym = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY_SYMBOL);

                                if (!session_cost_per) {
                                    $(data).find('homeSettings').each(function(i) {
                                        var energyPerUnitCost = (parseInt($(this).find("energyPerUnitCost").text())).toString();
                                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_COST_PER_KWH, energyPerUnitCost);
                                        if (!currency) {
                                            currency = $(this).find("currency").text();
                                            currency_sym = arrCurrency[$(this).find("currency").text()];
                                            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY, currency);
                                            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY_SYMBOL, currency_sym);
                                        }
                                        wemoUtil.infoLog("currency-->", window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY));
                                        editDevice.fillCurrentValue('.cost_per_kwh_current_value', currency_sym + editDevice.formatCost(energyPerUnitCost));
                                    });
                                } else {
                                    editDevice.fillCurrentValue('.cost_per_kwh_current_value', currency_sym + editDevice.formatCost(session_cost_per));
                                }

                            },
                            error: function(xhr) {
                                wemoUtil.infoLog(editDevice.TAG, '*status: ' + xhr.status);
                                wemoUtil.infoLog(editDevice.TAG, '*status text: ' + xhr.statusText);
                            }
                        });

                    },
                    function(err) {
                        wemoUtil.infoLog(editDevice.TAG, "failure call back");
                    },
                    "WebServicePlugin",
                    "getAuthCode", []
                );
            } else {
                var udn = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN);
                var session_threshold = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_POWER_THRESHOLD);
                if (!session_threshold) {
                    devicePlugin.execute(function(cur_value) {
                            cur_value = Math.round(parseInt(cur_value, 10) / 1000) + " " + wemo.items['Power_Unit'];
                            editDevice.fillCurrentValue('.power_threshold_current_value', cur_value);
                        },
                        edit_device.reportError,
                        actions.GET_POWER_THRESHOLD, [udn]
                    );
                } else {
                    session_threshold = Math.round(parseInt(session_threshold, 10) / 1000) + " " + wemo.items['Power_Unit'];
                    editDevice.fillCurrentValue('.power_threshold_current_value', session_threshold);
                }

                var session_cost_per = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_COST_PER_KWH);
                var currency = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY);
                var currency_sym = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY_SYMBOL);
                if (!session_cost_per) {
                    setTimeout(function() {
                        devicePlugin.execute(function(cur_value) {
                                wemoUtil.infoLog(editDevice.TAG, "cur_value['EnergyPerUnitCost'] " + cur_value['EnergyPerUnitCost']);
                                if (!currency) {
                                    currency = cur_value['Currency'];
                                    currency_sym = arrCurrency[currency];
                                    window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY, currency);
                                    window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY_SYMBOL, currency_sym);
                                }
                                wemoUtil.infoLog("currency-->", window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY));
                                wemoUtil.infoLog("currency_sym-->", window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY_SYMBOL));
                                wemoUtil.infoLog("type of currency_sym-->", typeof(currency_sym));
                                editDevice.fillCurrentValue('.cost_per_kwh_current_value', currency_sym + editDevice.formatCost(cur_value['EnergyPerUnitCost']));
                            },
                            edit_device.reportError,
                            actions.GET_ENERGY_PER_UNIT_COST, [udn]
                        );
                    }, timeout.MEDIUM);
                } else {
                    editDevice.fillCurrentValue('.cost_per_kwh_current_value', currency_sym + editDevice.formatCost(session_cost_per));
                }
            }
        } else {
            $('.insight_type_option').hide();
            $('.ResetDevice_Label').show();
            $('.reset_options').show();
        }
        type = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_TYPE);
        if (type == wemoMaker.TYPE || type == wemoMaker.REMOTE_TYPE || type == "WeMo Maker") {
            var udn = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN);
            $('#switchtypebackground').show();
            $('#sensorbackground').show();
            $('#makerline').show();
            $('#switchline').show();
            $('#sensorline').show();
            attributeListJson = JSON.parse(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ATTRIBUTE_LIST));
            switchType = attributeListJson.SwitchMode.value;
            selectedSwitchType = switchType;
            prevSwitchType = switchType;
            $('.switchbackground_li').removeClass('div_bg_green');
            if (switchType == 0) {
                $('#switchstatusselected').html(wemo.items['SwitchToggle']);
                $("#togglediv").addClass('div_bg_green');
            }
            if (switchType == 1) {
                $('#switchstatusselected').html(wemo.items['SwitchMomentary']);
                $("#momentarydiv").addClass('div_bg_green');
            }
            sensorType = attributeListJson.SensorPresent.value;
            prevSensorType = sensorType;
            selectedSensorType = sensorType;
            $('.sensorbackground_li').removeClass('div_bg_green');
            if (sensorType == 1) {
                $('#sensorstatusselected').html(wemo.items['SensorPresent']);
                $("#sensoryesdiv").addClass('div_bg_green');
            }
            if (sensorType == 0) {
                $('#sensorstatusselected').html(wemo.items['SensorNotPresentMaker']);
                $("#sensornodiv").addClass('div_bg_green');
            }
            $("#switchtypebackground").on('tap', function() {
                if (lightswitchbacklighttapped) {
                    $('#switchslection').hide();
                    lightswitchbacklighttapped = false;
                } else {
                    $('#switchslection').show();
                    $('#switchslection > div#togglediv > span').html(wemo.items['SwitchToggle']);
                    $('#switchslection > div#momentarydiv > span').html(wemo.items['SwitchMomentary']);
                    lightswitchbacklighttapped = true;
                }
            });
            $("#sensorbackground").on('tap', function() {
                if (lightswitchbacklighttapped) {
                    $('#sensorslection').hide();
                    lightswitchbacklighttapped = false;
                } else {
                    $('#sensorslection').show();
                    lightswitchbacklighttapped = true;
                }
            });
            $(".switchbackground_li").on("click", function(e) {
                e.stopPropagation();
                editDevice.switchTypeChanged = true;
                var selectValue = $(this).find("span").html();
                if (selectValue == wemo.items['SwitchToggle']) {
                    switchType = 0;
                    if (selectedSwitchType != switchType) {
                        udn = wemoUtil.getMakerSwithUDN(udn);
                        var isRulePresent = editDevice.checkForRule(true);
                        if (isRulePresent) {
                            $("#rules_switch_disable_dlg").popup('open');
                            setTimeout(function() {
                                $(".wemo_ed").scrollTop(0);
                                $('body').bind('touchmove', function(e) {
                                    e.preventDefault()
                                })
                            }, timeout.MEDIUM);
                        } else {
                            editDevice.updateSwitchType();
                        }
                    } else {
                        editDevice.updateSwitchType();
                    }
                }
                if (selectValue == wemo.items['SwitchMomentary']) {
                    switchType = 1;
                    if (selectedSwitchType != switchType) {
                        udn = wemoUtil.getMakerSwithUDN(udn);
                        var isRulePresent = editDevice.checkForRule(true);
                        if (isRulePresent) {
                            $("#rules_switch_disable_dlg").popup('open');
                            setTimeout(function() {
                                $(".wemo_ed").scrollTop(0);
                                $('body').bind('touchmove', function(e) {
                                    e.preventDefault()
                                })
                            }, timeout.MEDIUM);
                        } else {
                            editDevice.updateSwitchType();
                        }
                    } else {
                        editDevice.updateSwitchType();
                    }
                }
            });
            $(".sensorbackground_li").on("click", function(e) {
                e.stopPropagation();
                sensorType = $(this).find("span").html();
                if (sensorType == wemo.items['SensorPresent']) {
                    sensorType = 1;
                    editDevice.updateSensorType();
                }
                if (sensorType == wemo.items['SensorNotPresentMaker']) {
                    sensorType = 0;
                    if (selectedSensorType != sensorType) {
                        udn = wemoUtil.getMakerSwithUDN(udn);
                        var isRulePresent = editDevice.checkForRule(false);
                        if (isRulePresent) {
                            $("#rules_sensor_disable_dlg").popup('open');
                            setTimeout(function() {
                                $(".wemo_ed").scrollTop(0);
                                $('body').bind('touchmove', function(e) {
                                    e.preventDefault()
                                })
                            }, timeout.MEDIUM);
                        } else {
                            editDevice.updateSensorType();
                        }
                    } else {
                        editDevice.updateSensorType();
                    }
                }
            });
            $("#rules_switch_disable_cancel_button").on("click", function(e) {
                $('body').unbind('touchmove');
                switchType = prevSwitchType;
                editDevice.updateSwitchType();
                $("#rules_switch_disable_dlg").popup('close');
                e.preventDefault();
            });
            $("#rules_switch_disable_change_button").on("click", function(e) {
                editDevice.updateSwitchType();
                $("#rules_switch_disable_dlg").popup('close');
                isSwitchStateChanged = 1;
                editDevice.saveEdit();
                e.preventDefault();
            });
            $("#rules_sensor_disable_cancel_button").on("click", function(e) {
                $('body').unbind('touchmove');
                sensorType = prevSensorType;
                editDevice.updateSensorType();
                $("#rules_sensor_disable_dlg").popup('close');
                e.preventDefault();
            });
            $("#rules_sensor_disable_change_button").on("click", function(e) {
                editDevice.updateSensorType();
                $("#rules_sensor_disable_dlg").popup('close');
                isSwitchStateChanged = 0;
                editDevice.saveEdit();
                e.preventDefault();
            });
            
        }
        editDevice.setupDOMListeners();
        
        $("#ok_btn_save_fail").on("click", function() {
            $("#settings_not_saved").popup("close");
            $("pop_up_msg").html("");
        });

        var deviceType = '';
        deviceType = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_TYPE);
        var lsDimingEnabled = false; //WEMO-20022 - Disabled LS Dimming
        if (lsDimingEnabled && (deviceType == wemoLightSwitch.TYPE || deviceType == wemoLightSwitch.REMOTE_TYPE)) {
            $('#backlightbrightness').show();
            var udn = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN);
            if (isRemoteEnabled) {
                var mac = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_MAC);
                var pluginid = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_PLUGIN_ID);
                var friendlyName = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME);

                var device = [pluginid, mac, friendlyName];


                cloudServices.getNightLightStatus(device, lightSwitch.GET, -1, editDevice.getNightLightStatus);
            } else {
                devicePlugin.execute(
                    function(status) {
                        wemoUtil.infoLog(editDevice.TAG, 'Night Light Get Value: ' + status);
                        editDevice.setLightStatus(status);
                    },
                    editDevice.reportError,
                    actions.GET_NIGHT_LIGHT_STATUS, [udn]
                );
            }
        }
        //NetCam Start Edit_Device_List.js
        if (deviceType.indexOf('NetCam') != -1 || deviceType.indexOf('LinksysWNC') != -1) {
            /*
             * Show Friendly name for NetCam without the user id coming along with.
             * Start
             * */
            var netCamFName = $('#device_edit_friendly_name').val();

            netCamFName = wemoUtil.extractNetCamName(netCamFName);
            $('#netcam_friendlyname_text').html(netCamFName);

            /*End*/
            $('#device_edit_friendly_name').hide();
            $("#netcam_friendlyname_text").attr("disabled", "true");
            $("#device_edit_icon_text").attr("disabled", "true");
            $("#reset_options").attr("disabled", "true");
            $("div[data-role='fieldcontain']").find('.ui-icon').first().addClass('netCamDisable');
            $('.netCamDisable').removeClass('netCamDisable');

            $("#advanceOptions").on("click", function() {
                //alert('Advance Options');
                /*
                 * Plug-In Call to - actions.CHECK_NET_CAM
                 * 1. Check WeMo NetCam Application is installed on the device
                 * 2. True - Command to java to launch the WeMo NetCam Application
                 * 3. False - Redirect to 'netCam/get_it_now.html'
                 * */

                deviceTabPlugin.execute(
                    function(value) {
                        wemoUtil.infoLog(editDevice.TAG, "actions.CHECK_NET_CAM:  " + value);
                        if (value) {
                            wemoUtil.infoLog(editDevice.TAG, "NET_CAM - True - ");
                            wemoUtil.infoLog(editDevice.TAG, "Plug-In Call to - actions.LAUNCH_NET_CAM_APP");
                            var netCamObj = JSON.parse(window.sessionStorage.getItem(sessionStore.NET_CAM_OBJ_FROM_DEVICE_LIST));
                            wemoUtil.infoLog(editDevice.TAG, "clicked item:NetCamObj:  " + netCamObj);
                            wemoUtil.infoLog(editDevice.TAG, "clicked item:ID:  " + netCamObj.ID);
                            wemoUtil.infoLog(editDevice.TAG, "clicked item:Type:  " + netCamObj.Type);
                            wemoUtil.infoLog(editDevice.TAG, "clicked item:Name:  " + netCamObj.Name);
                            wemoUtil.infoLog(editDevice.TAG, "clicked item:UserName:  " + netCamObj.UserName);
                            wemoUtil.infoLog(editDevice.TAG, "clicked item:MacAdd:  " + netCamObj.MacAdd);
                            wemoUtil.infoLog(editDevice.TAG, "clicked item:isRemoteEnabled:  " + netCamObj.isRemoteEnabled);
                            deviceTabPlugin.execute(
                                function(value) {
                                    /*
                                     * Plug-In Call to - actions.LAUNCH_NET_CAM_APP
                                     * Command to java to launch the WeMo NetCam Application.
                                     * No need to handle anything here.
                                     */
                                },
                                editDevice.reportError,
                                actions.LAUNCH_NET_CAM_APP, [netCamObj.UserName, ((isRemoteEnabled) ? netCamObj.MacAdd : netCamObj.ID), 2]
                            ); //netCamObj.ID
                        } else {
                            wemoUtil.infoLog(editDevice.TAG, "NET_CAM - False - ");
                            wemoUtil.infoLog(editDevice.TAG, "Redirect to - " + filePath.NET_CAM_GET_IT_NOW);
                            //window.sessionStorage.removeItem(sessionStore.NET_CAM_OBJ_FROM_DEVICE_LIST);
                            //window.sessionStorage.setItem(sessionStore.NET_CAM_OBJ_FROM_DEVICE_LIST, JSON.stringify(netCamObj));
                            wemoUtil.loadUrl(filePath.NET_CAM_GET_IT_NOW);
                        }
                    },
                    editDevice.reportError,
                    actions.CHECK_NET_CAM, []
                );
            });
        }
        //NetCam End Edit_Device_List.js
    },
    updateSwitchType: function() {
        attributeListJson.SwitchMode.value = switchType;
        $('.switchbackground_li').removeClass('div_bg_green');
        if (switchType == "0") {
            $('div [id="togglediv"]').addClass('div_bg_green');
            $('#switchstatusselected').html(wemo.items['SwitchToggle']);
        } else {
            $('div [id="momentarydiv"] ').addClass('div_bg_green');
            $('#switchstatusselected').html(wemo.items['SwitchMomentary']);
        }
        $('#switchslection').hide();
        lightswitchbacklighttapped = false;
        selectedSwitchType = switchType;
        $(document).scrollTop(0);
    },
    updateSensorType: function() {
        attributeListJson.SensorPresent.value = sensorType;
        $('.sensorbackground_li').removeClass('div_bg_green');
        if (sensorType == "0") {
            $('div [id="sensornodiv"] ').addClass('div_bg_green');
            $('#sensorstatusselected').html(wemo.items['SensorNotPresentMaker']);
        } else {
            $('div [id="sensoryesdiv"] ').addClass('div_bg_green');
            $('#sensorstatusselected').html(wemo.items['SensorPresent']);
        }
        $('#sensorslection').hide();
        lightswitchbacklighttapped = false;
        selectedSensorType = sensorType;
        $(document).scrollTop(0);
    },

    setLightStatus: function(status) {
        $(".lightbackground_li").removeClass("div_bg_green");
        if (status == 0) {
            $(".dim_high").addClass("div_bg_green");
            $("#lightstatusselected").html("High");
        } else if (status == 1) {
            $(".dim_low").addClass("div_bg_green");
            $("#lightstatusselected").html("Low");
        } else if (status == 2) {
            $(".dim_off").addClass("div_bg_green");
            $("#lightstatusselected").html("Off");
        }
        // default case : if something goes wrong in getting the response
        else {
            $(".dim_high").addClass("div_bg_green");
            $("#lightstatusselected").html("High");
        }
    },

    getNightLightStatus: function(data) {
        var responseXML = (new XMLSerializer()).serializeToString(data);
        $(data).find('plugin').each(function() {
            var lightStatus = $(this).find("status").text();
            wemoUtil.infoLog(editDevice.TAG, "getNightLightStatus lightStatus: " + lightStatus);
            editDevice.setLightStatus(lightStatus);
        });
    },
    updateNightLightStatus: function(data) {
        var responseXML = (new XMLSerializer()).serializeToString(data);
        $(data).find('plugin').each(function() {
            var lightStatus = $(this).find("status").text();
            wemoUtil.infoLog(editDevice.TAG, "updateNightLightStatus from cloud lightStatus: " + lightStatus);
        });
        var dimValue = window.sessionStorage.getItem(sessionStore.DIM_VALUE);
        wemoUtil.infoLog(editDevice.TAG, "updateNightLightStatus setting from session dimValue: " + dimValue);
        editDevice.setLightStatus(dimValue);
    },
    bindEvents: function() {
        wemoUtil.infoLog(editDevice.TAG, 'bindEvents');
        document.addEventListener('online', editDevice.onOnline, false);
        document.addEventListener('offline', editDevice.onOffline, false);
        document.addEventListener('backbutton', editDevice.onBackPress, false);
        document.addEventListener('pause', editDevice.onPause, false);
        document.addEventListener('resume', editDevice.onResume, false);
    },

    onOffline: function() {
        wemoUtil.infoLog(editDevice.TAG, 'offLine');
    },

    onOnline: function() {
        wemoUtil.infoLog(editDevice.TAG, 'onLine');
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
            wemoUtil.infoLog(editDevice.TAG, 'onBackPress');
            editDevice.cancelEdit();
        }
    },

    onPause: function() {
        wemoUtil.infoLog(editDevice.TAG, 'onPause');
    },

    onResume: function() {
        wemoUtil.infoLog(editDevice.TAG, 'onResume');
    },

    reportError: function(e) {
        wemoUtil.infoLog(editDevice.TAG, 'Plugin Failure Call back!!!!   ' + e);
    },

    setupDOMListeners: function() {
        $('#confirmdimlight').popup();
        var udn = "";
        wemoUtil.infoLog(editDevice.TAG, 'setupDOMListeners');

        $("#lightswitchbacklight").on('tap', function() {
            if (lightswitchbacklighttapped) {
                $('#brightnesslevel').hide();
                lightswitchbacklighttapped = false;
            } else {
                $('#brightnesslevel').show();
                lightswitchbacklighttapped = true;
            }
        });

        $("#confirmdimlightCancel").on('click', function(e) {
            e.stopPropagation();
            $('#brightnesslevel').hide();
            lightswitchbacklighttapped = false;
            $("#confirmdimlight").popup('close');
        });

        $("#confirmdimlightYes").on('click', function(e) {
            e.stopPropagation();
            $('#brightnesslevel').hide();
            lightswitchbacklighttapped = false;
            $("#confirmdimlight").popup('close');
            wemoUtil.infoLog(editDevice.TAG, "confirmdimlightYes isRemoteEnabled " + isRemoteEnabled + ' udn ' + udn);
            if (isRemoteEnabled) {
                var mac = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_MAC);
                var pluginid = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_PLUGIN_ID);
                var friendlyName = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME);

                var device = [pluginid, mac, friendlyName];
                window.sessionStorage.setItem(sessionStore.DIM_VALUE, 1);
                cloudServices.getNightLightStatus(device, lightSwitch.SET, 1, editDevice.updateNightLightStatus);
            } else {
                udn = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN);
                devicePlugin.execute(
                    function(status) {
                        wemoUtil.infoLog(editDevice.TAG, 'Night Light Set Value: ' + status + ' udn ' + udn);
                        editDevice.setLightStatus(1);
                    },
                    editDevice.reportError,
                    actions.SET_NIGHT_LIGHT_STATUS, [udn, 1]
                );
            }
        });

        $(".lightbackground_li").on("click", function(e) {
            e.stopPropagation();

            // call upnp action here.
            var dimValue = $(this).find("span").html();
            wemoUtil.infoLog(editDevice.TAG, "lightbackground_li Clicked " + dimValue);
            var dimActualValue = 0;

            if (dimValues.High == $(this).find("span").html()) {
                dimActualValue = 0;
            } else if (dimValues.Low == $(this).find("span").html()) {
                dimActualValue = 1;
            } else if (dimValues.Off == $(this).find("span").html()) {
                dimActualValue = 2;
            }
            wemoUtil.infoLog(editDevice.TAG, "lightbackground_li Clicked dimValue " + dimValue + " dimActualValue " + dimActualValue);



            if (dimActualValue == 1) {
                $("#confirmdimlight").popup('open');
            } else {
                if (isRemoteEnabled) {
                    var mac = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_MAC);
                    var pluginid = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_PLUGIN_ID);
                    var friendlyName = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME);

                    var device = [pluginid, mac, friendlyName];
                    window.sessionStorage.setItem(sessionStore.DIM_VALUE, dimActualValue);
                    cloudServices.getNightLightStatus(device, lightSwitch.SET, dimActualValue, editDevice.updateNightLightStatus);
                } else {
                    udn = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN);
                    devicePlugin.execute(
                        function(status) {
                            wemoUtil.infoLog(editDevice.TAG, 'Night Light Set Value:  ' + status + ' udn ' + udn);
                        },
                        editDevice.reportError,
                        actions.SET_NIGHT_LIGHT_STATUS, [udn, dimActualValue]
                    );
                }
                $('.lightbackground_li').removeClass('div_bg_green');
                $(this).addClass('div_bg_green');
                $('#lightstatusselected').html(($(this).html()));
                $('#brightnesslevel').hide();
                lightswitchbacklighttapped = false;
            }
        });


        //To return back to home page: device list tab
        $(".wemo_logo").on("tap", function(e) {
            if (e.target.nodeName != "IMG") {
                editDevice.openDeviceListPage();
            }
        });

        $('#device_edit_friendly_name').on('change', function() {
            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME, $('#device_edit_friendly_name').val());
        });

        $('#edit_device_icon').on('click', function(event) {
            var deviceType = '';
            deviceType = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_TYPE);

            if (deviceType.indexOf('NetCamSensor') != -1 || deviceType.indexOf('NetCamSensor') != -1) {
                event.preventDefault();
            } else {
                // Disabling customize icon due to WEMO-19055 for 1.1.2.
                //$("#select_photo_popup").popup('open');
                $("#gosh_message").popup('open');
            }

        });

        $('#photo_pick_option').on('click', '> li', function() {
            $('#select_photo_popup').attr('data-go-forward', 'true');

            var selected_id = $(this).attr('id');
            wemoUtil.infoLog(editDevice.TAG, "Photo selection option: " + selected_id);
            if (selected_id === 'take_photo') {
                editDevice.getCameraPicker();
            } else if (selected_id === 'select_from_gallery') {
                editDevice.getGalleryPicker();
            } else if (selected_id === 'remove_photo') {
                editDevice.removePhoto();
            }
            $("#select_photo_popup").popup("close");
        });

        $('#data_export').on('click', function() {
            wemoUtil.infoLog(editDevice.TAG, 'data export clicked');
            editDevice.openDataExportPage();
        });

        $('#reset_options').on('click', function(event) {
            var deviceType = '',
                friendlyName = window.sessionStorage.getItem('JardenUdnList');
            if (friendlyName) {
                window.sessionStorage.removeItem('JardenUdnList');
            }
            deviceType = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_TYPE);

            if (deviceType.indexOf('NetCamSensor') != -1 || deviceType.indexOf('NetCamSensor') != -1) {
                event.preventDefault();
            } else {
                wemoUtil.infoLog(editDevice.TAG, 'reset options clicked');
                editDevice.openResetOptionsPage();
            }

        });

        $('#power_threshold').on('click', function() {
            wemoUtil.infoLog(editDevice.TAG, 'power threshold clicked');
            editDevice.openPowerThresholdSettingPage();
        });

        $('#cost_per_kwh').on('click', function() {
            wemoUtil.infoLog(editDevice.TAG, 'cost per kwh clicked');
            editDevice.openCostPerKwhEditPage();
        });

        $('#edit_device_save_btn').on('click', function() {
            wemoUtil.infoLog(editDevice.TAG, 'save clicked');
            var device_name = $('#device_edit_friendly_name').val();


            /* WEMO-23997 - don't allow special characters, except trademark */
            var desired = device_name.match(/[^\w.\s-]/gi);

            if (!desired || (desired.length === 1 && desired[0] === '®')) {
                if (device_name.length <= 30) {
                    editDevice.saveEdit();
                } else {
                    $("#tooLongRuleNamePopup").popup('open');
                }
            } else {
                $("#invalidNamePopup").popup('open');
            }

        });

        $('#edit_device_cancel_btn').on('click', function() {

            wemoUtil.infoLog(editDevice.TAG, 'cancel clicked');
            editDevice.cancelEdit();
        });

        $("#gosh_message_ok_btn").on('click', function() {
            $("#gosh_message").popup('close');
        });

        $("#invalidNamePopupOK").on('click', function() {
            $("#invalidNamePopup").popup('close');
        });

        $("#tooLongRuleNamePopupOK").on('click', function() {
            $("#tooLongRuleNamePopup").popup('close');
        });
    },

    buildXMLRequest: function(type, pluginId, macAddress, data, currency) {
        xmlString = "<plugins><plugin>" +
            "  <recipientId>" + pluginId + "</recipientId>" +
            "  <macAddress>" + macAddress + "</macAddress>";


        switch (type) {
            case (buildXML.CHANGE_FRIENDLY_NAME):
                xmlString += "  <content><![CDATA[<changeFriendlyName>" +
                    "  <plugin>" +
                    "  <pluginId>" + pluginId + "</pluginId>" +
                    "  <macAddress>" + macAddress + "</macAddress>" +
                    "  <friendlyName>" + data + "</friendlyName>" +
                    "  </plugin>" +
                    "</changeFriendlyName>]]></content>";
                break;

            case (buildXML.SET_POWER_THRESHOLD):
                xmlString += "  <content><![CDATA[<setPowerThreshold>" +
                    "  <plugin>" +
                    "  <pluginId>" + pluginId + "</pluginId>" +
                    "  <macAddress>" + macAddress + "</macAddress>" +
                    "  <defaultPowerThreshold>" + data + "</defaultPowerThreshold>" +
                    "  <powerThreshold>" + data + "</powerThreshold>" +
                    "  </plugin>" +
                    "</setPowerThreshold>]]></content>";
                break;

            case (buildXML.SET_HOME_SETTINGS):
                xmlString += "  <content><![CDATA[<setInsightHomeSettings>" +
                    "  <plugin>" +
                    "  <macAddress>" + macAddress + "</macAddress>" +
                    "  <energyPerUnitCost>" + data + "</energyPerUnitCost>" +
                    "  <currency>" + currency + "</currency>" + //We support US Dollar only
                "  </plugin>" +
                    "</setInsightHomeSettings>]]></content>";
                break;

            case (buildXML.GET_DEV_STAT):
                xmlString += "<content>" +
                    "<![CDATA[<getPluginDetails><plugin><macAddress>" + macAddress + "</macAddress></plugin></getPluginDetails>]]>" +
                    "</content>";
                break;

            case (buildXML.GET_POWER_THRESHOLD):
                //Cloud answers none for such request, using another way to get data
                break;
        }

        xmlString += "</plugin></plugins>";

        return xmlString;
    },

    saveEdit: function() {
        wemoUtil.infoLog(editDevice.TAG, 'saveEdit');
        var udn = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN),
            customFriendlyName = {};
        wemoUtil.infoLog(editDevice.TAG, 'UDN to change friendly name: ' + udn);
        var friendly_name = $('#device_edit_friendly_name').val();
        var updated_threshold = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_POWER_THRESHOLD);
        var update_cost_per = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_COST_PER_KWH);
        var currency = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY);
        var isAttributeChanged = false;



        window.sessionStorage.setItem('DEVICE_EDIT_CROCKPOT', udn + '&&' + friendly_name);

        customFriendlyName[udn] = friendly_name;
        window.sessionStorage.setItem("JardenUdnList", JSON.stringify(customFriendlyName));

        wemoUtil.infoLog('editDevice.TAG currency: ' + currency);
        setTimeout(function() {
            nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);

            var uri = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URI);
            var url = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL);
            wemoUtil.infoLog(editDevice.TAG, 'uri: ' + uri);
            wemoUtil.infoLog(editDevice.TAG, 'url: ' + url);

            var autoSetThreshold = window.sessionStorage.getItem(sessionStore.THRESHOLD_IS_AUTO_SET);
            var resetThreshold = window.sessionStorage.getItem(sessionStore.THRESHOLD_RESET);
            var mac = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_MAC);
            var pluginid = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_PLUGIN_ID);
            var xmlRequestString = "";

            if ((updated_threshold != null) && (autoSetThreshold == null) && (resetThreshold == null)) {
                if (isRemoteEnabled) {

                    xmlRequestString = editDevice.buildXMLRequest(buildXML.SET_POWER_THRESHOLD, pluginid, mac, updated_threshold);

                    cordova.exec(
                        function(params) {
                            wemoUtil.infoLog(editDevice.TAG, "success call back");
                            var authCode = params[0];
                            wemoUtil.infoLog(editDevice.TAG, "authCode" + authCode);
                            $.ajax({
                                url: cloudAPI.DEVICE_MESSAGE,
                                type: "POST",
                                data: xmlRequestString,
                                beforeSend: function(xhr) {
                                    xhr.setRequestHeader('Content-Type', 'application/xml');
                                    xhr.setRequestHeader('Authorization', authCode);
                                },
                                success: function(data) {
                                    wemoUtil.infoLog(editDevice.TAG, "Sucess save power threshold response cloud...");
                                    nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                    var responseXML = (new XMLSerializer()).serializeToString(data);
                                    wemoUtil.log(editDevice.TAG, 'Save power threshold status: ' + responseXML);
                                }
                            });
                        },
                        function(err) {
                            wemoUtil.infoLog(editDevice.TAG, "failure call back");
                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                            editDevice.openDeviceListPage();
                        }, "WebServicePlugin", "getAuthCode", []
                    );
                } else {
                    devicePlugin.execute(
                        function(status) {
                            wemoUtil.infoLog(editDevice.TAG, 'threshold callback: ' + status);
                        },
                        editDevice.reportError,
                        actions.SET_POWER_THRESHOLD, [udn, updated_threshold]
                    );
                }
            } else {
                wemoUtil.infoLog(editDevice.TAG, 'threshold not changed');
            }
            if (type == wemoMaker.TYPE || type == wemoMaker.REMOTE_TYPE || type == "WeMo Maker") {
                var remoteSwitchState = "null";
                var remoteSensorState = "null";
                var attributeList = '{"Switch":"null","Sensor":"null","SwitchMode":"null","SensorPresent":"null"}';
                var attributeJson = JSON.parse(attributeList);
                if (prevSwitchType != switchType) {
                    attributeJson['SwitchMode'] = switchType;
                    remoteSwitchState = switchType;
                    isAttributeChanged = true;
                }
                if (prevSensorType != sensorType) {
                    attributeJson['SensorPresent'] = sensorType;
                    remoteSensorState = sensorType;
                    isAttributeChanged = true;
                }
                if (isAttributeChanged) {
                    if (isRemoteEnabled) {
                        var attributeListXML = '';
                        attributeListXML = "<attribute><name>Switch</name>";
                        attributeListXML = attributeListXML + "<value>null</value></attribute>";
                        attributeListXML = attributeListXML + "<attribute><name>Sensor</name>";
                        attributeListXML = attributeListXML + "<value>null</value></attribute>";
                        attributeListXML = attributeListXML + "<attribute><name>SwitchMode</name>";
                        attributeListXML = attributeListXML + "<value>" + remoteSwitchState + "</value></attribute>";
                        attributeListXML = attributeListXML + "<attribute><name>SensorPresent</name>";
                        attributeListXML = attributeListXML + "<value>" + remoteSensorState + "</value></attribute>";
                        var request = cloudServices.buildXMLForStateChangeForMaker(pluginid, mac, 0, attributeListXML, friendly_name);
                        cordova.exec(function(params) {
                            wemoUtil.infoLog(editDevice.TAG, "success call back");
                            var authCode = params[0];
                            wemoUtil.infoLog(editDevice.TAG, "authCode" + authCode);

                            $.ajax({
                                url: cloudAPI.STATE_CHANGE,
                                type: "POST",
                                data: request,
                                beforeSend: function(xhr) {
                                    xhr.setRequestHeader('Content-Type', 'application/xml');
                                    xhr.setRequestHeader('Authorization', authCode);
                                },
                                success: function(data) {
                                    wemoUtil.infoLog(editDevice.TAG, "Sucess change attribute response cloud....");
                                    var responseXML = (new XMLSerializer()).serializeToString(data);
                                    wemoUtil.log(editDevice.TAG, 'Change attribute status: ' + responseXML);
                                    //							nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                    //							editDevice.openDeviceListPage();
                                    
                                    var responseStatus = $(responseXML).find('status').text();
                                    
                                    if(responseStatus != deviceStatus.INACTIVE){
                                    	editDevice.setFriendlyNameOnCloud(pluginid, mac, friendly_name);
                                    }
                                    else{
                                    	nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                    	$("#pop_up_msg").text(wemo.items['SettingsNotSavedOnCloud']);
                                    	$("#settings_not_saved").popup("open");
                                    }
                                },
                                error: function(xhr, textstatus) {
                                   wemoUtil.infoLog(editDevice.TAG,  'status: ' + xhr.status);
                                   wemoUtil.infoLog(editDevice.TAG,  'status text: ' + xhr.statusText);
                                    if(xhr.status == "503"){
                						wemoUtil.loadUrl(filePath.CLOUD_AVAILABILITY);
                					}
                                    else{
                                    	nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                    	$("#pop_up_msg").text(wemo.items['SettingsNotSavedOnCloud']);
                                    	$("#settings_not_saved").popup("open");
                                    }
                                }
                            });
                        }, function(err) {
                            wemoUtil.infoLog(editDevice.TAG, "failure call back");
                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                            editDevice.openDeviceListPage();
                        }, "WebServicePlugin", "getAuthCode", []);
                    } else {
                        devicePlugin.execute(
                            function(status) {
                                wemoUtil.infoLog(editDevice.TAG, 'set switch type success callback: ' + status);
                            },
                            editDevice.reportError,
                            actions.SET_ATTRIBUTE_MAKER, [udn, attributeJson]
                        );
                    }
                }
            }
            if (editDevice.imageChanged === true) {
                if (isRemoteEnabled) {
                    wemoUtil.infoLog(editDevice.TAG, "Remote upload of image...");

                    deviceTabPlugin.execute(function() {
                            wemoUtil.infoLog(editDevice.TAG, "Success!");
                        },
                        function(err) {
                            wemoUtil.infoLog(editDevice.TAG, err);
                        },
                        actions.UPLOAD_ICON_TO_CLOUD, [uri, mac]);
                } else {
                    devicePlugin.execute(
                        function(status) {
                            wemoUtil.infoLog(editDevice.TAG, 'set image success callback: ' + status);
                        },
                        editDevice.reportError,
                        actions.DEVICE_TAB_SET_DEVICE_IMAGE, [uri, udn]
                    );
                }
            } else {
                wemoUtil.infoLog(editDevice.TAG, 'image not changed');
            }

            if (!isRemoteEnabled) {
                if (autoSetThreshold == "true") {
                    devicePlugin.execute(
                        function() {},
                        edit_device.reportError,
                        actions.SET_AUTO_THRESHOLD, [udn]
                    );
                }

                if (resetThreshold == "true") {
                    devicePlugin.execute(
                        function(newVal) {},
                        edit_device.reportError,
                        actions.RESET_THRESHOLD, [udn]
                    );
                }
            }

            if (update_cost_per != null || currency != null) {
                wemoUtil.infoLog(editDevice.TAG, "Save unit per cost");
                if (isRemoteEnabled) {
                    wemoUtil.infoLog(editDevice.TAG, "Save unit per cost in remote mode");

                    xmlRequestString = editDevice.buildXMLRequest(buildXML.SET_HOME_SETTINGS, pluginid, mac, update_cost_per, currency);

                    cordova.exec(
                        function(params) {
                            wemoUtil.infoLog(editDevice.TAG, "success call back");
                            var authCode = params[0];
                            wemoUtil.infoLog(editDevice.TAG, "authCode" + authCode);
                            $.ajax({
                                url: cloudAPI.DEVICE_MESSAGE,
                                type: "POST",
                                data: xmlRequestString,
                                beforeSend: function(xhr) {
                                    xhr.setRequestHeader('Content-Type', 'application/xml');
                                    xhr.setRequestHeader('Authorization', authCode);
                                },
                                success: function(data) {
                                    wemoUtil.infoLog(editDevice.TAG, "Success change unit per cost response cloud...");
                                    var responseXML = (new XMLSerializer()).serializeToString(data);
                                    wemoUtil.log(editDevice.TAG, 'Change unit per cost status: ' + responseXML);
                                }
                            });
                        },
                        function(err) {
                            wemoUtil.infoLog(editDevice.TAG, "failure call back");
                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                            editDevice.openDeviceListPage();
                        }, "WebServicePlugin", "getAuthCode", []
                    );
                } else {
                    if (!update_cost_per) {
                        update_cost_per = editDevice.removeCurrencySignAndPeriod($(".cost_per_kwh_current_value").html());
                    }
                    wemoUtil.infoLog(editDevice.TAG, "update_cost_per " + update_cost_per);
                    devicePlugin.execute(function(status) {
                            wemoUtil.infoLog(editDevice.TAG, 'set new cost per kWh success callback: ' + status);
                            wemoUtil.infoLog(editDevice.TAG, 'currency-----> ' + currency);
                        },
                        edit_device.reportError,
                        actions.SET_ENERGY_PER_UNIT_COST, [udn, update_cost_per, currency]
                    );
                }
            } else {
                wemoUtil.infoLog(editDevice.TAG, "Not save unit per cost");
            }

            if (isRemoteEnabled) {
            	if(!isAttributeChanged)
            		editDevice.setFriendlyNameOnCloud(pluginid, mac, friendly_name);
            } else {
                devicePlugin.execute(
                    function(status) {
                        wemoUtil.infoLog(editDevice.TAG, 'friendly name success callback: ' + status);
                        //                        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                        if (status == true) {
                            //rule disable code
                            if (isSwitchStateChanged != -1) {
                                wemoUtil.infoLog(editDevice.TAG, 'isStateChanged' + isSwitchStateChanged);
                                editDevice.disableRule();
                            } else {
                                wemoUtil.infoLog(editDevice.TAG, 'isStateChanged' + isSwitchStateChanged);
                                nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                //                            devicePlugin.execute(null, null, actions.STOP_CONTROL_POINT, []);
                                editDevice.openDeviceListPage();
                            }
                        } else {
                            $("#pop_up_msg").text(wemo.items['pleaseEnterDeviceName']);
                            $("#settings_not_saved").popup("open");
                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                        }
                    },
                    editDevice.reportError,
                    actions.DEVICE_TAB_SET_FRIENDLY_NAME, [udn, friendly_name]
                );
            }
        }, timeout.LONG);
    },

    cancelEdit: function() {
        editDevice.openDeviceListPage();
    },
    
    setFriendlyNameOnCloud: function(pluginid, mac, friendly_name){
    	wemoUtil.infoLog(editDevice.TAG, "Save friendly name in remote mode " + pluginid +" "+ mac+" " + friendly_name);

        xmlRequestString = editDevice.buildXMLRequest(buildXML.CHANGE_FRIENDLY_NAME, pluginid, mac, friendly_name);

        cordova.exec(
            function(params) {
            	wemoUtil.infoLog(editDevice.TAG, "success call back");
                var authCode = params[0];
                wemoUtil.infoLog(editDevice.TAG, "authCode" + authCode);
                $.ajax({
                    url: cloudAPI.DEVICE_MESSAGE,
                    type: "POST",
                    data: xmlRequestString,
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function(data) {
                    	wemoUtil.infoLog(editDevice.TAG, "Sucess change friendly name response cloud....");
                        var responseXML = (new XMLSerializer()).serializeToString(data);
                        wemoUtil.infoLog(editDevice.TAG, 'Change friendly name status: ' + responseXML);
                        //rule disable code
                        if (isSwitchStateChanged != -1) {
                            wemoUtil.infoLog(editDevice.TAG, 'Rule Disabling:: isStateChanged' + isSwitchStateChanged);
                            editDevice.disableRule();
                        } else {
                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                            editDevice.openDeviceListPage();
                        }
                    }
                });
            },
            function(err) {
            	wemoUtil.infoLog(editDevice.TAG, "failure call back");
                nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                editDevice.openDeviceListPage();
            }, "WebServicePlugin", "getAuthCode", []
        );
    },

    openDeviceListPage: function() {
        window.sessionStorage.removeItem(sessionStore.DEVICE_EDIT_WEMO_POWER_THRESHOLD);
        window.sessionStorage.removeItem(sessionStore.THRESHOLD_IS_AUTO_SET);
        window.sessionStorage.removeItem(sessionStore.THRESHOLD_RESET);

        window.sessionStorage.removeItem(sessionStore.DEVICE_EDIT_WEMO_COST_PER_KWH);
        window.sessionStorage.removeItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY);
        window.sessionStorage.removeItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY_SYMBOL);
        window.sessionStorage.removeItem("flagReset");
        wemoUtil.loadUrl(filePath.DEVICE_LIST);
    },

    getSwitchRuleId: function(udn) {
        var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
        var ids = '"' + udn + '", "' + wemoUtil.getOriginalMakerUDN(udn) + '"';
        db.transaction(getData, getDataErrorCB, getDataSuccessCB);

        function getData(tx) {
            tx.executeSql('SELECT distinct A.RuleID FROM RULES A INNER JOIN RULEDEVICES B ON A.RuleID = B.RuleID Where A.State != 0 AND B.DeviceID IN  (' + ids + ')', [],
                function(tx, results) {
                    var len = results.rows.length;
                    wemoUtil.infoLog(editDevice.TAG, editDevice.TAG + "Result rows length: " + len);
                    if (len > 0) {
                        for (var i = 0; i < len; i++) {
                            makerSwitchRuleIDs[i] = results.rows.item(i).RuleID;
                        }
                    }
                }, getDataSuccessCB);
        }

        function getDataErrorCB() {
            wemoUtil.infoLog(editDevice.TAG, editDevice.TAG + "Error Selecting records");
        }

        function getDataSuccessCB() {
            wemoUtil.infoLog(editDevice.TAG, editDevice.TAG + 'Successfully retrived DB');
        }
    },

    getSensorRuleId: function(udn) {
        var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
        db.transaction(getData, getDataErrorCB, getDataSuccessCB);

        function getData(tx) {
            tx.executeSql('SELECT distinct A.RuleID FROM RULES A INNER JOIN RULEDEVICES B ON A.RuleID = B.RuleID Where A.State != 0 AND B.DeviceID IN  ("' + udn + '")', [],
                function(tx, results) {
                    var len = results.rows.length;
                    wemoUtil.infoLog(editDevice.TAG, editDevice.TAG + "Result rows length: " + len);
                    if (len > 0) {
                        for (var i = 0; i < len; i++) {
                            makerSensorRuleIDs[i] = results.rows.item(i).RuleID;
                        }
                    }
                }, getDataSuccessCB);
        }

        function getDataErrorCB() {
            wemoUtil.infoLog(editDevice.TAG, editDevice.TAG + "Error Selecting records");
        }

        function getDataSuccessCB() {
            wemoUtil.infoLog(editDevice.TAG, editDevice.TAG + 'Successfully retrived DB');
        }
    },

    checkForRule: function(isMakerSwitch) {
        if (isMakerSwitch) {
            if (makerSwitchRuleIDs.length > 0) {
                return true;
            }
        } else {
            if (makerSensorRuleIDs.length > 0) {
                return true;
            }
        }
        return false;
    },

    disableRule: function() {
        var enabledRuleID = [],
            state = '0';
        wemoUtil.infoLog(editDevice.TAG, 'disableRule()');
        if (isSwitchStateChanged == 1) {
            enabledRuleID = makerSwitchRuleIDs;
        } else if (isSwitchStateChanged == 0) {
            enabledRuleID = makerSensorRuleIDs;
        }
        wemoUtil.infoLog(editDevice.TAG, "enabledRuleID--> " + enabledRuleID);

        var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
        db.transaction(updateData, errorCB, successCB);

        function updateData(tx) {
            wemoUtil.infoLog(editDevice.TAG, 'updateData(tx)');
            for (var id = 0; id < enabledRuleID.length; id++) {
                var ruleID = enabledRuleID[id];
                tx.executeSql('UPDATE RULES SET State=? WHERE RuleID in ("' + ruleID + '")', [state], getAllRules, errorCB);
            }
        }

        function getAllRules(tx) {
            wemoUtil.infoLog(editDevice.TAG, "getAllRules");
            tx.executeSql('SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.Level from RULES a inner join RULEDEVICES b on a.RuleID=CAST(b.RuleID AS CHAR) order by a.Name', [], querySuccess, errorCB);
        }

        function querySuccess(tx, results) {
            wemoUtil.infoLog(editDevice.TAG, 'querySuccess');
            var len = results.rows.length;
            var ruleRows = [];
            if (len > 0) {
                for (var i = 0; i < len; i++) {
                    ruleRows[i] = results.rows.item(i);
                    wemoUtil.infoLog(editDevice.TAG, 'querySuccess--> State: ' + results.rows.item(i).State + ' Type: ' + results.rows.item(i).Type + ' UDN: ' + results.rows.item(i).DeviceID);
                }
            }
            window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));
        }

        function errorCB() {
            wemoUtil.infoLog(editDevice.TAG, "Error!");
        }

        function successCB() {
            wemoUtil.infoLog(editDevice.TAG, "success");
            editDevice.updateSchedule();
        }
    },

    updateSchedule: function() {

        var params = [];
        var len = "";

        wemoUtil.setJSONObjectToSessionStorage(sessionStore.EDIT_DEVICE_TYPE_CHANGED, true);
        if (isRemoteEnabled) {
            params = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
            params = params.concat(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA));
            params = params.concat(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA));
            params = params.concat(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SENSOR_DATA));
            makePush(params);
        } else {
            wemoUtil.getDevicesWithCallback(actions.SELECT_SWITCHES, function(params) {
                wemoUtil.getDevicesWithCallback(actions.SELECT_INSIGHTS, function(insights) {
                    params = params.concat(insights);
                    wemoUtil.getDevicesWithCallback(actions.SELECT_MAKER, function(makers) {
                        params = params.concat(makers);
                        wemoUtil.getDevicesWithCallback(actions.SELECT_SENSORS, function(sensors) {
                            params = params.concat(sensors);

                            makePush(params);
                        });

                    });

                });
            });
        }

        function makePush(params) {
        
        //TODO: add check here to create schedule string only for rule devices
            if (params != null && params.length > 0) {
                len = params.length;

                wemoUtil.infoLog(editDevice.TAG, "length " + len);
                
				var ruleDevicesUDNArray = '';
                $.each(params, function(inx) {
                    var deviceUDN = params[inx].udn;
                    ruleDevicesUDNArray = ruleDevicesUDNArray + deviceUDN + DELIMITER_COMMA;
                });
                
                wemoUtil.pushScheduleSwitch(ruleDevicesUDNArray, 0, len);
            }
        }
    },

    openResetOptionsPage: function() {
        wemoUtil.loadUrl(filePath.DEVICE_RESET_OPTIONS);
    },

    openDataExportPage: function() {
        wemoUtil.loadUrl(filePath.DEVICE_DATA_EXPORT);
    },

    openPowerThresholdSettingPage: function() {
        wemoUtil.loadUrl(filePath.INSIGHT_POWER_THRESHOLD_SETTINGS);
    },

    openCostPerKwhEditPage: function() {
        wemoUtil.loadUrl(filePath.EDIT_COST_PER_KWH);
    },

    getCameraPicker: function() {
        navigator.camera.getPicture(
            editDevice.onPhotoURISuccess,
            editDevice.reportError, {
                quality: 80,
                targetWidth: 150,
                targetHeight: 150,
                allowEdit: true,
                correctOrientation: true,
                destinationType: destinationType.FILE_URI
            }
        );
    },

    getGalleryPicker: function() {
        navigator.camera.getPicture(
            editDevice.onPhotoURISuccess,
            editDevice.reportError, {
                quality: 50,
                destinationType: destinationType.FILE_URI,
                correctOrientation: true,
                sourceType: pictureSource.SAVEDPHOTOALBUM
            }
        );
    },

    removePhoto: function() {
        editDevice.onPhotoURISuccess(editDevice.getDfaultURI());
    },

    getDfaultURI: function() {
        return wemoUtil.getDefaultIconPath(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_TYPE));
    },

    onPhotoURISuccess: function(imageURI) {
        wemoUtil.infoLog(editDevice.TAG, "Image URI: " + imageURI);
        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URI, imageURI);
        editDevice.imageChanged = true;
        $('#edit_device_icon').attr('src', imageURI);

    },

    fillCurrentValue: function(value_class, cur_value) {
        cur_value_item = $(value_class);
        cur_value_item.find('.cur_value_loading').hide();
        cur_value_item.html(cur_value);
    },

    formatCost: function(obj_value) {
        return editDevice.decodeValue(obj_value);
    },

    decodeValue: function(encodedValue) {
        var CAPACITY = 4;
        var digits = ("" + encodedValue).split('');
        digits.splice(digits.length - CAPACITY + 1, 0, '.');
        return digits.join('');
    },

    removeCurrencySignAndPeriod: function(str) {
        return str.substr(1).replace('.', '');
    },

    setStyleCss: function() {
        var w = wemoUtil.getScreenWidth();
        $('.wemo_logo').css('background-size', 0.3 * w);
    }
};