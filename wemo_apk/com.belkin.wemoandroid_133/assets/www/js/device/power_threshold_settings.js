/*
 power_threshold_settings.js

 Created by Belkin International, Software Engineering on 08/19/2013.
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
	var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));
    powerThresholdSettings.initialize();
});
var udn = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN);
var powerThresholdSettings = {

    TAG: 'power_threshold_settings.js: ',

    initialize: function () {
        wemoUtil.infoLog(powerThresholdSettings.TAG, "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    onDeviceReady: function () {
        wemoUtil.infoLog(powerThresholdSettings.TAG, "onDeviceReady");
        powerThresholdSettings.bindEvents();
        wemoUtil.infoLog(powerThresholdSettings.TAG, window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN));

        //Fill current power threshold value
        var power_threshold = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_POWER_THRESHOLD);
        if (isNaN(power_threshold)) power_threshold = 0;
        if (!power_threshold) {
			if (isRemoteEnabled) {
				var mac = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_MAC);
				var pluginid = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_PLUGIN_ID);                
				var request = "<plugins><plugin>" +
									"  <recipientId>" + pluginid + "</recipientId>" +
									"  <macAddress>" + mac + "</macAddress>"+
									" <content>" +
										"<![CDATA[<getPluginDetails><plugin><macAddress>" + mac + "</macAddress></plugin></getPluginDetails>]]>" +
									" </content>"+
								"</plugin></plugins>";
				console.log(request);

				//TODO load data from cloud, then call device_list.fillInsightDeviceStatistic()
				cordova.exec(
					function (params) {
						console.log("success call back" + params[1] + " : " + params[0]);
						var homeId = params[1];
						var authCode = params[0];

						console.log("*request " + request);
						console.log("success call back home id: " + homeId);
						console.log("success call back authCode: " + authCode);
						
						$.ajax({
							url: cloudAPI.INSIGHT_PARAMS,
							data: request,
							type: "POST",
							beforeSend: function (xhr) {
								xhr.setRequestHeader('Content-Type', 'application/xml');
								xhr.setRequestHeader('Authorization', authCode);
							},
							success: function (data) {
								console.log("**success callback from cloud");

								var responseXML = (new XMLSerializer()).serializeToString(data);
								var splitLength = 4000;
								var length = responseXML.length;
								var ittr = Math.floor(length / splitLength) + 1;
								for (var i = 0; i < ittr; i++) {
									var end = ((i + 1) * splitLength);
									if (end > length) {
										end = length;
									}
									wemoUtil.log(powerThresholdSettings.TAG, responseXML.substring(splitLength * i, end));
								}

								$(data).find('applianceConsumption').each(function (i) {
									console.log("Plugin:: " + i);
									powerThreshold = parseInt($(this).find("powerThreshold").text());
									window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_POWER_THRESHOLD, powerThreshold);
									powerThreshold = Math.round(parseInt(powerThreshold, 10) / 1000);
									powerThresholdSettings.fillCurrentValue('.power_threshold_current_value', powerThreshold);
									$('#set_power_threshold').click(function () {
										$("#kwatt_selector").BelkinPicker({type: "spinner", minval: 2, maxval: 99, curval: powerThreshold}, "show", function (val) {
												window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_POWER_THRESHOLD, val*1000);
												window.sessionStorage.removeItem(sessionStore.THRESHOLD_IS_AUTO_SET);
												window.sessionStorage.removeItem(sessionStore.THRESHOLD_RESET);
												powerThresholdSettings.fillCurrentValue('.power_threshold_current_value', val);
												$("#kwatt_selector").BelkinPicker({}, "hide");
											}
										);
									});
								});
							},
							error: function (xhr) {
								wemoUtil.infoLog(powerThresholdSettings.TAG, '*status: ' + xhr.status);
								wemoUtil.infoLog(powerThresholdSettings.TAG, '*status text: ' + xhr.statusText);
							}
						});

					},
					function (err) {
						console.log("failure call back");
					},
					"WebServicePlugin",
					"getAuthCode",
					[]
				);
				
			} else {
				devicePlugin.execute(function (cur_value) {
						cur_value = Math.round(parseInt(cur_value, 10) / 1000);
						powerThresholdSettings.fillCurrentValue('.power_threshold_current_value', cur_value);
						$('#set_power_threshold').click(function () {
							$("#kwatt_selector").BelkinPicker({type: "spinner", minval: 2, maxval: 99, curval: cur_value}, "show", function (val) {
									window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_POWER_THRESHOLD, val*1000);   
									window.sessionStorage.removeItem(sessionStore.THRESHOLD_IS_AUTO_SET);
									window.sessionStorage.removeItem(sessionStore.THRESHOLD_RESET);
									powerThresholdSettings.fillCurrentValue('.power_threshold_current_value', val);
									$("#kwatt_selector").BelkinPicker({}, "hide");
								}
							);
						});
					},
					powerThresholdSettings.reportError,
					actions.GET_POWER_THRESHOLD,
					[udn]
				);
			}
        }
        else {
			power_threshold = Math.round(parseInt(power_threshold, 10) / 1000);
            $('#set_power_threshold').click(function () {
                $("#kwatt_selector").BelkinPicker({type: "spinner", minval: 2, maxval: 99, curval: power_threshold}, "show", function (val) {
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_POWER_THRESHOLD, val*1000);
						window.sessionStorage.removeItem(sessionStore.THRESHOLD_IS_AUTO_SET);
						window.sessionStorage.removeItem(sessionStore.THRESHOLD_RESET);
						powerThresholdSettings.fillCurrentValue('.power_threshold_current_value', val);
                        $("#kwatt_selector").BelkinPicker({}, "hide");
                    }
                );
            });
            powerThresholdSettings.fillCurrentValue('.power_threshold_current_value', power_threshold);
        }


        //Power now and status
        setTimeout(function () {
                powerThresholdSettings.updatePowerNow(udn);
            },
            1000);
        powerThresholdSettings.setupDOMListeners();

    },

    bindEvents: function () {
        wemoUtil.infoLog(powerThresholdSettings.TAG, "bindEvents");
        document.addEventListener('online', powerThresholdSettings.onOnline, false);
        document.addEventListener('offline', powerThresholdSettings.onOffline, false);
        document.addEventListener('backbutton', powerThresholdSettings.onBackPress, false);
        document.addEventListener('pause', powerThresholdSettings.onPause, false);
        document.addEventListener('resume', powerThresholdSettings.onResume, false);
    },


    onOffline: function () {
        wemoUtil.infoLog(powerThresholdSettings.TAG, "offLine");
    },

    onOnline: function () {
        wemoUtil.infoLog(powerThresholdSettings.TAG, "onLine");
    },

    onBackPress: function () {
        if ($(".more_tab").is(":visible")) {
            $(".more_tab").hide();
            $('body').find('.modalWindow').transition({opacity: 0}, 400, function () {
                $(this).removeClass('isOpen');
            });
        }
        else {
            wemoUtil.infoLog(powerThresholdSettings.TAG, "onBackPress");
            if (typeof (navigator.app) !== 'undefined') {
                powerThresholdSettings.openEditDevice();
            } else {
                this.openEditDevice();
            }
        }
    },

    onPause: function () {
        wemoUtil.infoLog(powerThresholdSettings.TAG, "onPause");
    },

    onResume: function () {
        wemoUtil.infoLog(powerThresholdSettings.TAG, "onResume");
    },

    reportError: function (e) {
        wemoUtil.infoLog(powerThresholdSettings.TAG, "Plugin Error!!!!   " + e);
    },

    setupDOMListeners: function () {
        wemoUtil.infoLog(powerThresholdSettings.TAG, 'setupDOMListeners');


        //To return back to home page: device list tab
        $(".wemo_logo").on("tap", function (e) {
            if (e.target.nodeName != "IMG") {
                window.sessionStorage.removeItem(sessionStore.DEVICE_EDIT_WEMO_POWER_THRESHOLD);
                window.sessionStorage.removeItem(sessionStore.THRESHOLD_IS_AUTO_SET);
                window.sessionStorage.removeItem(sessionStore.THRESHOLD_RESET);

                window.sessionStorage.removeItem(sessionStore.DEVICE_EDIT_WEMO_COST_PER_KWH);
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }
        });
		
		$('.auto_set').on('tap', function () {
             wemoUtil.loadUrl(filePath.AUTO_SET_POWER_THRESHOLD);
        });
		
		 deviceTabPlugin.execute(function (data) {
					wemoUtil.infoLog(powerThresholdSettings.TAG, 'data.powerNow');
                    var update_threshold = parseFloat(data.powerNow) + 2000;
                    var powerNow = powerThresholdSettings.formatPowerValue(update_threshold);
                    $('.power_now').text(powerNow);
                },
                function (e) {
					wemoUtil.infoLog(editDevice.TAG, 'Plugin Failure Call back!!!!   ' + e);
                },
                actions.GET_INSIGHT_PARAMS,
                [udn]
            );
		

        //Auto set
     /*   $('#auto_set').on('click', function () {
            $("#auto_set_message").popup('open');
        });
        $('#auto_set_ok_btn').on('click', function () {
            powerThresholdSettings.autoSetOkBtnHandler();
        });
        $('#auto_set_cancel_btn').on('click', function () {
            $("#auto_set_message").popup('close');
        });*/

        //Reset to default
        $('.reset_to_default').on('tap', function () {
            $("#reset_to_default_message").popup('open');
        });
        $('#reset_to_default_ok_btn').on('tap', function () {
            powerThresholdSettings.resetOkBtnHandler();
        });
        $('#reset_to_default_cancel_btn').on('tap', function () {
            $("#reset_to_default_message").popup('close');
        });
    },

    fillCurrentValue: function (value_class, cur_value) {
        cur_value_item = $(value_class);
        cur_value_item.find('.cur_value_loading').hide();
        cur_value_item.text(parseInt(cur_value));
    },

    openEditDevice: function () {
        wemoUtil.loadUrl(filePath.DEVICE_LIST_EDIT);
    },
/*
    autoSetOkBtnHandler: function () {
        if (isRemoteEnabled) {
            var update_threshold = parseFloat(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_POWER_NOW)) + 2000;
            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_POWER_THRESHOLD, update_threshold);
            cur_threshold = Math.round(update_threshold / 1000);
            powerThresholdSettings.fillCurrentValue('.power_threshold_current_value', cur_threshold);
            window.sessionStorage.setItem(sessionStore.THRESHOLD_IS_AUTO_SET, true);
            window.sessionStorage.removeItem(sessionStore.THRESHOLD_RESET);
        }
        else {
            deviceTabPlugin.execute(function (data) {
                    var update_threshold = parseFloat(data.powerNow) + 2000;
                    window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_POWER_THRESHOLD, update_threshold);
                    cur_threshold = Math.round(update_threshold / 1000);
                    powerThresholdSettings.fillCurrentValue('.power_threshold_current_value', cur_threshold);
                    window.sessionStorage.setItem(sessionStore.THRESHOLD_IS_AUTO_SET, true);
                    window.sessionStorage.removeItem(sessionStore.THRESHOLD_RESET);
                },
                function () {
                    alert("error");
                },
                actions.GET_INSIGHT_PARAMS,
                [udn]
            );
        }
        $("#auto_set_message").popup('close');
    },*/

    resetOkBtnHandler: function () {
        window.sessionStorage.setItem(sessionStore.THRESHOLD_RESET, true);
        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_POWER_THRESHOLD, 8000);
        window.sessionStorage.removeItem(sessionStore.THRESHOLD_IS_AUTO_SET);
        powerThresholdSettings.fillCurrentValue('.power_threshold_current_value', 8);
        $("#reset_to_default_message").popup('close');
    },

    formatPowerValue: function (power) {
    	var res;
    	res = '' + Math.round(power / 1000) + ' ' + wemo.items['Power_Unit'];
    	return res;
    },

    updatePowerNow: function (udn) {
        if (isRemoteEnabled) {
            var powerNow = powerThresholdSettings.formatPowerValue(parseFloat( window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_POWER_NOW) ));
            var powerState = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_POWER_STATE);

            $('.power_now').text(powerNow);
            switch (parseInt(powerState)) {
                case 0:
                    $('.power_threshold_indicator').removeClass("power_on power_off power_standby").addClass("power_off");
                    break;
                case 1:
                    $('.power_threshold_indicator').removeClass("power_on power_off power_standby").addClass("power_on");
                    break;
                case 8:
                    $('.power_threshold_indicator').removeClass("power_on power_off power_standby").addClass("power_standby");
                    break;
            }
        }
        else {
        	deviceTabPlugin.execute(function (data) {
        		var powerNow = powerThresholdSettings.formatPowerValue(parseFloat(data.powerNow));
        		$('.power_now').text(powerNow);
        		switch (parseInt(data.state)) {
        		case 0:
        			$('.power_threshold_indicator').removeClass("power_on power_off power_standby").addClass("power_off");
        			break;
        		case 1:
        			$('.power_threshold_indicator').removeClass("power_on power_off power_standby").addClass("power_on");
        			break;
        		case 8:
        			$('.power_threshold_indicator').removeClass("power_on power_off power_standby").addClass("power_standby");
        			break;
        		}
        		setTimeout(function () {
        			powerThresholdSettings.updatePowerNow(udn);
        		},
        		1000);
        	},
                function (e) {
                    wemoUtil.infoLog(editDevice.TAG, 'Plugin Failure Call back!!!!   ' + e);
                },
                actions.GET_INSIGHT_PARAMS,
                [udn]
            );
        }
    }
};
