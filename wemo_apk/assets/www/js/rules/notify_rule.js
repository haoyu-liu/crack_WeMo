var TAG = "notify_rule.js: ";
var isMakerSensorNotificaton = false;
var isSensorNotificaton = false;
var isFobPresenceNotification = false;
var isDoorWindowNotification = false;
var how_often_val;
var UP_TF_IS24 = false; //UP-user preferences, TF-time format
var isInitialRule = false;

$(document).bind('pageinit', function() {
    new_rule.initialize();
});

$(window).unload(function() {
    window.sessionStorage.setItem(sessionStore.GCM_MAKER_SENSOR, "0");
    window.sessionStorage.setItem(sessionStore.GCM_SENSOR, "0");
    window.sessionStorage.setItem(sessionStore.GCM_KEYCHAIN_PRESENCE, "0");
    window.sessionStorage.setItem(sessionStore.GCM_DOOR_WINDOW, false);
});

var new_rule = {
    deviceList: {},
    ruleObj: {},

    initialize: function() {
        console.log(TAG + "initialize");
        if (window.sessionStorage.getItem(sessionStore.isEditNotificationRule) == "edit_notification_rule") {
            $(".sub_header span").html(wemo.items["EditNotificationRule"]);
        } else {
            $(".sub_header span").html(wemo.items["NewNotificationRuleTitle"]);
        }
        if (window.sessionStorage.getItem(sessionStore.GCM_SENSOR) == "1") {
            isSensorNotificaton = true;
        } else if (window.sessionStorage.getItem(sessionStore.GCM_MAKER_SENSOR) == "1") {
            isMakerSensorNotificaton = true;
        } else if (window.sessionStorage.getItem(sessionStore.GCM_KEYCHAIN_PRESENCE) == "1") {
        	isFobPresenceNotification = true;
        	$('#notify_message_div').hide();
        } else if (window.sessionStorage.getItem(sessionStore.GCM_DOOR_WINDOW) === "true") {
        	isDoorWindowNotification = true;
        	$('#notify_message_div').hide();
        }
        
        if (window.sessionStorage.getItem(sessionStore.INITIAL_RULE_TAPPED) === "true") {
        	isInitialRule = true;
        	window.sessionStorage.setItem(sessionStore.INITIAL_RULE_TAPPED, false);
        }
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    onDeviceReady: function() {
        var self = this;
        UP_TF_IS24 = wemoUtil.userPreferences.getTimeFormat();
        
        nativeUtilPlugin.execute(null, null, actions.CLOSE_SOFT_KEYBOARD,[]);
        if (!isRemoteEnabled) {
        $.when(wemoUtil.getDevices(actions.SELECT_SWITCHES), wemoUtil.getDevices(actions.SELECT_INSIGHTS), wemoUtil.getDevices(actions.SELECT_MAKER), wemoUtil.getDevices(actions.SELECT_LED_DEVICES))
            .then(function() {

                new_rule.afterOnDeviceReady();

            }).fail(function() {
                throw ('ERROR');
            });
        }else {
        	new_rule.afterOnDeviceReady();
        }

    },
    afterOnDeviceReady: function() {
        $.getScript('../js/classes/deviceList.js', function() {
            $.getScript('../js/vendor/date.js', function() {
                new_rule.methodMain();
            });
        });
    },

    loadDevices: function() {
        console.log("loadDevices JSON.stringify " + JSON.stringify(new_rule.ruleObj));
        var devices = [];

        if (isRemoteEnabled) {
            if (isSensorNotificaton) {
                devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SENSOR_DATA);
//                devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.PIR_DATA).concat(devices);
            } else if (isMakerSensorNotificaton) {
                devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA);
            } else if (isFobPresenceNotification) {
                devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.FOB_DATA);
            } else if (isDoorWindowNotification) {
                devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DWSENSOR_DATA);
            } else {
                devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA);
            }
            new_rule.deviceListCallback(devices);
        } else {
            if (isSensorNotificaton) {
            	$.Deferred(function(dfd) { 
            	deviceTabPlugin.execute(
	                function(params) {
                        new_rule.deviceListCallback(params);
	                },
	                function(err) {
	                	dfd.reject(err);
	                },
	                actions.SELECT_SENSORS, []);
            	}).promise();
            } else if (isMakerSensorNotificaton) {
            	$.Deferred(function(dfd) {
            	deviceTabPlugin.execute(
	                function(params) {
	                	new_rule.deviceListCallback(params);
	                	dfd.resolve(devices);
	                },
	                function(err) {
	                	dfd.reject(err);
	                },
	                actions.SELECT_MAKER, []);  
            }).promise();
            }
            //else if (isFobPresenceNotification) {
            //	$.Deferred(function(dfd) {
            //    	deviceTabPlugin.execute(
    	     //           function(params) {
    	     //           	new_rule.deviceListCallback(params);
    	     //           	dfd.resolve(devices);
    	     //           },
    	     //           function(err) {
    	     //           	dfd.reject(err);
    	     //           },
    	     //           actions.SELECT_FOB_SENSOR_DEVICES, []);
            //    }).promise();
            //    }
            //else if (isDoorWindowNotification) {
            //    	$.Deferred(function(dfd) {
            //        	deviceTabPlugin.execute(
        	 //               function(params) {
        	 //               	new_rule.deviceListCallback(params);
        	 //               	dfd.resolve(devices);
        	 //               },
        	 //               function(err) {
        	 //               	dfd.reject(err);
        	 //               },
        	 //               actions.SELECT_DOOR_WINDOW_SENSORS, []);
            //        }).promise();
            //        }
            else {
            	$.Deferred(function(dfd) {
            		deviceTabPlugin.execute(
	                function(params) {
	                	new_rule.deviceListCallback(params);
	                	dfd.resolve(devices);
	                },
	                function(err) {
	                	dfd.reject(err);
	                },
	                actions.SELECT_INSIGHTS, []);
            	}).promise();
            }
        } 
        
    },
    
    deviceListCallback: function (devices){
        if (devices != null && devices.length > 0) {
        	
        	devices = wemoUtil.sortJSONArray(devices, key.DEVICE_FRIENDLY_NAME);
            $.each(devices, function(inx) {

                if (isMakerSensorNotificaton) {
                    if (devices[inx].SensorPresent == "1")
                        deviceList.addDevice(devices[inx].udn, devices[inx].friendlyName);
                } else {
                    deviceList.addDevice(devices[inx].udn, devices[inx].friendlyName, devices[inx].ProductName);
                }
                
                for (var dev in new_rule.ruleObj.Devices) { 
                    if (isMakerSensorNotificaton) {
                        if (wemoUtil.getMakerSensorUDN(dev) == wemoUtil.getMakerSensorUDN(devices[inx].udn)) {
                            if (new_rule.ruleObj.Devices[dev].Level == '0') {
                                deviceList.setActive(devices[inx].udn, 'on');
                            } else {
                                deviceList.setActive(devices[inx].udn, 'off');
                            }
                        }
                    } else {
                        if (dev == devices[inx].udn) {
                            if (isSensorNotificaton) {
                                deviceList.setActive(devices[inx].udn, 'on');
                            } else if(isFobPresenceNotification){
                            	if (new_rule.ruleObj.Devices[dev].Level == keyChainRuleActionValues.ARRIVESORLEAVES) {
                    				deviceList.setActive(devices[inx].udn, ruleDrawerVal.ON);
                    			} else if (new_rule.ruleObj.Devices[dev].Level == keyChainRuleActionValues.ARRIVES) {
                    				deviceList.setActive(devices[inx].udn, ruleDrawerVal.OFF);
                    			} else {
                    				deviceList.setActive(devices[inx].udn, ruleDrawerVal.ON_FOR);
                    			}
                            } else if(isDoorWindowNotification){
                            	if (new_rule.ruleObj.Devices[dev].Level == doorWindowActionValues.OPENSORCLOSES) {
                    				deviceList.setActive(devices[inx].udn, ruleDrawerVal.ON);
                    			} else if (new_rule.ruleObj.Devices[dev].Level == doorWindowActionValues.OPENS) {
                    				deviceList.setActive(devices[inx].udn, ruleDrawerVal.OFF);
                    			} else {
                    				deviceList.setActive(devices[inx].udn, ruleDrawerVal.ON_FOR);
                    			}
                            } else {
                                if (new_rule.ruleObj.Devices[dev].Level == '0') {
                                    deviceList.setActive(devices[inx].udn, 'off');
                                } else if (new_rule.ruleObj.Devices[dev].Level == '1') {
                                    deviceList.setActive(devices[inx].udn, 'on');
                                } else {
                                    var time = (new Date).clearTime()
                                        .addSeconds(new_rule.ruleObj.Devices[dev].Level)
                                        .toString('HH:mm');
                                    deviceList.setActive(devices[inx].udn, 'on_for', time);
                                }
                            }
                        }
                    }
                }
            });
        }
        new_rule.renderDeviceList();
        wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, new_rule.ruleObj);
    },

    deselectDevice: function(udn) {
        if (isSensorNotificaton) {
            $('div [id="' + udn + '"]').find('.on').removeClass('div_bg_green');
            $('div [data-udn="' + udn + '"]').find('.check_mark').hide();
            $('div [data-udn="' + udn + '"]').find('.action_subHeader').empty();
        } else if (isMakerSensorNotificaton) {
            $('div [id="' + udn + '"]').find('.on').removeClass('div_bg_green');
            $('div [id="' + udn + '"]').find('.off').removeClass('div_bg_green');
            $('div [data-udn="' + udn + '"]').find('.check_mark').hide();
            $('div [data-udn="' + udn + '"]').find('.action_subHeader').empty();
        } else {
            $('div [id="' + udn + '"]').find('.on').removeClass('div_bg_green');
            $('div [id="' + udn + '"]').find('.off').removeClass('div_bg_green');
            $('div [id="' + udn + '"]').find('.on_for').removeClass('div_bg_green');
            $('div [data-udn="' + udn + '"]').find('.check_mark').hide();
            $('div [data-udn="' + udn + '"]').find('.action_subHeader').empty();
            $('div [id="' + udn + '"]').find('.on_for span').html(wemo.items['OnFor']);
        }
        deviceList.unsetActive(udn);
    },

    selectDevice: function(type, duration, udn) {
        if (isSensorNotificaton) {
            $('div [id="' + udn + '"]').find('.on').removeClass('div_bg_green');
            $('div [data-udn="' + udn + '"] ').find('.check_mark').show();
            if (type == 'on') {
                $('div [id="' + udn + '"]').find('.on').addClass('div_bg_green');
                $('div [data-udn="' + udn + '"]').find('.action_subHeader').html(wemo.items['Motion']);
            }
        } else if (isMakerSensorNotificaton) {
            $('div [id="' + udn + '"]').find('.on').removeClass('div_bg_green');
            $('div [id="' + udn + '"]').find('.off').removeClass('div_bg_green');
            $('div [data-udn="' + udn + '"] ').find('.check_mark').show();
            if (type == 'off') {
                $('div [id="' + udn + '"]').find('.off').addClass('div_bg_green');
                $('div [data-udn="' + udn + '"]').find('.action_subHeader').html(wemo.items['SensorOpen']);
            } else if (type == 'on') {
                $('div [id="' + udn + '"]').find('.on').addClass('div_bg_green');
                $('div [data-udn="' + udn + '"]').find('.action_subHeader').html(wemo.items['SensorClosed']);
            }
        } else {
            $('div [id="' + udn + '"]').find('.on').removeClass('div_bg_green');
            $('div [id="' + udn + '"]').find('.off').removeClass('div_bg_green');
            $('div [id="' + udn + '"]').find('.on_for').removeClass('div_bg_green');

            $('div [data-udn="' + udn + '"] ').find('.check_mark').show();


            if(isFobPresenceNotification){
            	if (type == 'on') {
                    $('div [id="' + udn + '"]').find('.on').addClass('div_bg_green');
                    $('div [data-udn="' + udn + '"]').find('.action_subHeader').html(wemo.items['FobSensorArrivesorLeaves']);
                } else if (type == 'off') {
                    $('div [id="' + udn + '"]').find('.off').addClass('div_bg_green');
                    $('div [data-udn="' + udn + '"]').find('.action_subHeader').html(wemo.items['FobSensorArrives']);
                } else if (type == 'on_for') {
                    $('div [id="' + udn + '"]').find('.on_for').addClass('div_bg_green');
                    $('div [data-udn="' + udn + '"]').find('.action_subHeader').html(wemo.items['FobSensorLeaves']);
                }
            } else if(isDoorWindowNotification){
            	if (type == ruleDrawerVal.ON) {
                    $('div [id="' + udn + '"]').find('.on').addClass('div_bg_green');
                    $('div [data-udn="' + udn + '"]').find('.action_subHeader').html(wemo.items['DoorWindowOpensorCloses']);
                } else if (type == ruleDrawerVal.OFF) {
                    $('div [id="' + udn + '"]').find('.off').addClass('div_bg_green');
                    $('div [data-udn="' + udn + '"]').find('.action_subHeader').html(wemo.items['DoorWindowOpens']);
                } else if (type == ruleDrawerVal.ON_FOR) {
                    $('div [id="' + udn + '"]').find('.on_for').addClass('div_bg_green');
                    $('div [data-udn="' + udn + '"]').find('.action_subHeader').html(wemo.items['DoorWindowCloses']);
                }
            } else{
            	if (type == 'on') {
                    $('div [id="' + udn + '"]').find('.on').addClass('div_bg_green');
                    $('div [data-udn="' + udn + '"]').find('.action_subHeader').html(wemo.items['RuleOn']);
                } else if (type == 'off') {
                    $('div [id="' + udn + '"]').find('.off').addClass('div_bg_green');
                    $('div [data-udn="' + udn + '"]').find('.action_subHeader').html(wemo.items['RuleOff']);
                } else if (type == 'on_for') {
                    $('div [id="' + udn + '"]').find('.on_for').addClass('div_bg_green');
                    $('div [data-udn="' + udn + '"]').find('.action_subHeader').html(wemo.items['RuleIsOnForWODots'] + ' ' + duration);
                }
            }

        }
        deviceList.setActive(udn, type, duration);
    },

    renderDeviceList: function() {
        for (var udn in deviceList.getArray()) {
            var state = '';
            if (isSensorNotificaton) {
                if (deviceList.getDevice(udn).state != undefined) {
                    if (deviceList.getDevice(udn).state == 'on') {
                        state = wemo.items['Motion'];
                    }
                }

                var devName = deviceList.getDevice(udn).name;

                if (udn.indexOf('NetCam') != -1) {
                    devName = wemoUtil.extractNetCamName(devName);
                }

                var html = '<div class="select_switches_list notify_rule_item" data-udn="' + udn + '">' + '<div class="display_table">' + '<span class="display_cell padding_left_16px">' + '<span class="fname">' + devName + '</span>' + '<span class="action_subHeader">' + state + '</span></span></div><span class="check_mark"></span></div>' + '<div class="drawer" id="' + udn + '">' + '<div class="drawer_li on"><span>' + wemo.items['Motion'] + '</span></div>';
            } else if (isMakerSensorNotificaton) {
                if (deviceList.getDevice(udn).state != undefined) {
                    if (deviceList.getDevice(udn).state == 'off') {
                        state = wemo.items['SensorOpen'];
                    } else if (deviceList.getDevice(udn).state == 'on') {
                        state = wemo.items['SensorClosed'];
                    }
                }
                var html = '<div class="select_switches_list notify_rule_item" data-udn="' + udn + '">' + '<div class="display_table">' + '<span class="display_cell padding_left_16px">' + '<span class="fname">' + deviceList.getDevice(udn).name + '</span>' + '<span class="action_subHeader">' + state + '</span></span></div><span class="check_mark"></span></div>' + '<div class="drawer" id="' + udn + '">' + '<div class="drawer_li off"><span>' + wemo.items['SensorOpen'] + '</span></div>' + '<div class="drawer_li on"><span>' + wemo.items['SensorClosed'] + '</span></div>';
            } else if (isFobPresenceNotification) {
            	if (deviceList.getDevice(udn).state != undefined) {
                    if (deviceList.getDevice(udn).state == 'on') {
                        state = wemo.items['FobSensorArrivesorLeaves'];
                    } else if (deviceList.getDevice(udn).state == "off") {
                        state = wemo.items['FobSensorArrives'];
                    } else if (deviceList.getDevice(udn).state == "on_for") {
                        state = wemo.items['FobSensorLeaves'];
                    }
                }
                var html = '<div class="select_switches_list notify_rule_item" data-udn="' + udn + '">' + '<div class="display_table">' + '<span class="display_cell padding_left_16px">' + '<span class="fname">' + deviceList.getDevice(udn).name + '</span>' + '<span class="action_subHeader">' + state + '</span></span></div><span class="check_mark"></span></div>' + '<div class="drawer" id="' + udn + '">' + '<div class="drawer_li on"><span>' + wemo.items['FobSensorArrivesorLeaves'] + '</span></div>' + '<div class="drawer_li off"><span>' + wemo.items['FobSensorArrives'] + '</span></div>' + '<div class="drawer_li on_for last_item"><span>' + wemo.items['FobSensorLeaves'] + '</span></div></div>';
            } else if (isDoorWindowNotification) {
            	if (deviceList.getDevice(udn).state != undefined) {
                    if (deviceList.getDevice(udn).state == ruleDrawerVal.ON) {
                        state = wemo.items['DoorWindowOpensorCloses'];
                    } else if (deviceList.getDevice(udn).state == ruleDrawerVal.OFF) {
                        state = wemo.items['DoorWindowOpens'];
                    } else if (deviceList.getDevice(udn).state == ruleDrawerVal.ON_FOR) {
                        state = wemo.items['DoorWindowCloses'];
                    }
                }
                var html = '<div class="select_switches_list notify_rule_item" data-udn="' + udn + '">' + '<div class="display_table">' + '<span class="display_cell padding_left_16px">' + '<span class="fname">' + deviceList.getDevice(udn).name + '</span>' + '<span class="action_subHeader">' + state + '</span></span></div><span class="check_mark"></span></div>' + '<div class="drawer" id="' + udn + '">' + '<div class="drawer_li on"><span>' + wemo.items['DoorWindowOpensorCloses'] + '</span></div>' + '<div class="drawer_li off"><span>' + wemo.items['DoorWindowOpens'] + '</span></div>' + '<div class="drawer_li on_for last_item"><span>' + wemo.items['DoorWindowCloses'] + '</span></div></div>';
            } else {
                if (deviceList.getDevice(udn).state != undefined) {
                    if (deviceList.getDevice(udn).state == 'on') {
                        state = wemo.items['RuleOn'];
                    } else if (deviceList.getDevice(udn).state == "off") {
                        state = wemo.items['RuleOff'];
                    } else if (deviceList.getDevice(udn).state == "on_for") {
                        state = wemo.items['RuleIsOnForWODots'] + ' ' + deviceList.getDevice(udn).duration;
                    }
                }
                var html = '<div class="select_switches_list notify_rule_item" data-udn="' + udn + '">' + '<div class="display_table">' + '<span class="display_cell padding_left_16px">' + '<span class="fname">' + deviceList.getDevice(udn).name + '</span>' + '<span class="action_subHeader">' + state + '</span></span></div><span class="check_mark"></span></div>' + '<div class="drawer" id="' + udn + '">' + '<div class="drawer_li on"><span>' + wemo.items['RuleOn'] + '</span></div>' + '<div class="drawer_li off"><span>' + wemo.items['RuleOff'] + '</span></div>' + '<div class="drawer_li on_for last_item"><span>' + wemo.items['RuleIsOnFor'] + '</span></div></div>' + '<div class="time_start_selector" id = "period_selector_' + wemoUtil.md5(udn) + '">' + '<h1> <span>' + wemo.items['RuleIsOnFor'] + '</span></h1>' + '</div>';
            }
            $('#devices_container #device_list').append($(html));

            if (state != '') {
                $('div [data-udn="' + udn + '"] ').find('.check_mark').show();
                if (deviceList.getDevice(udn).state == 'on') {
                    $('div [id="' + udn + '"]').find('.on').addClass('div_bg_green');
                } else if (deviceList.getDevice(udn).state == "off") {
                    $('div [id="' + udn + '"]').find('.off').addClass('div_bg_green');
                } else if (deviceList.getDevice(udn).state == "on_for") {
                    $('div [id="' + udn + '"]').find('.on_for').addClass('div_bg_green');
                }
            }
            
            if((isFobPresenceNotification || isDoorWindowNotification || isSensorNotificaton) && isInitialRule){
            	new_rule.selectDevice(ruleDrawerVal.ON, 0, udn);
            	new_rule.updateRuleDevices();
            	isInitialRule = false;
            }
        }

        $('div .on').on('tap', function(e) {
            var udn = $(this).parent().attr('id');
            if ($(this).hasClass('div_bg_green')) {
                new_rule.deselectDevice(udn);
            } else {
                new_rule.selectDevice('on', 0, udn);
            }

            $(this).parent().slideToggle('fast');
            new_rule.updateRuleDevices();
            e.preventDefault();
        });

        $('div .off').on('tap', function(e) {
            var udn = $(this).parent().attr('id');
            if ($(this).hasClass('div_bg_green')) {
                new_rule.deselectDevice(udn);
            } else {
                new_rule.selectDevice('off', 0, udn);
            }

            $(this).parent().slideToggle('fast');
            new_rule.updateRuleDevices();
            e.preventDefault();
        });

        $('div .on_for').on('tap', function(e) {
            var udn = $(this).parent().attr('id');
            if ($(this).hasClass('div_bg_green')) {
                new_rule.deselectDevice(udn);
            } else if(isFobPresenceNotification || isDoorWindowNotification){
            	new_rule.selectDevice(ruleDrawerVal.ON_FOR, 0, udn);
            } else {
                $('#period_selector_' + wemoUtil.md5(udn)).BelkinPicker({
                    type: "period",
                    curval: '0:05'
                }, "show", function(val) {
                    new_rule.selectDevice('on_for', val, udn);
                    new_rule.updateRuleDevices();
                    $(this).html(wemo.items['RuleIsOnForWODots'] + ' ' + val);
                    $('#period_selector_' + wemoUtil.md5(udn)).BelkinPicker({}, "hide");
                });
            }

            $(this).parent().slideToggle('fast');
            new_rule.updateRuleDevices();
            e.preventDefault();
        });

        $("#device_list").on('tap', '.check_mark', function(e) {
        	e.stopPropagation();
            var udn = $(this).closest('.select_switches_list').attr('data-udn');
            var drawer = $('div [id="' + udn + '"]');
            if (drawer.is(":visible")) drawer.slideToggle("slow");
            new_rule.deselectDevice(udn);
            new_rule.updateRuleDevices();
        });
    },

    updateRuleDevices: function() {
        console.log("Updating rule devices...")
        console.log(JSON.stringify(new_rule.ruleObj));

        new_rule.ruleObj.Devices = {};

        for (var udn in deviceList.getArray()) {
            console.log(JSON.stringify(deviceList.getDevice(udn)));
            if (deviceList.getDevice(udn) != undefined && deviceList.getDevice(udn) != '') {
                if (deviceList.getDevice(udn).state != undefined && deviceList.getDevice(udn).state != '') {
                    new_rule.ruleObj.Devices[udn] = {};
                    if (isSensorNotificaton) {
                        new_rule.ruleObj.Devices[udn].StartAction = '-1';
                        new_rule.ruleObj.Devices[udn].EndAction = '-1';
                    } else {
                        new_rule.ruleObj.Devices[udn].StartAction = '9';
                        new_rule.ruleObj.Devices[udn].EndAction = '0';
                    }

                    if (deviceList.getDevice(udn).state == 'on') {
                        if (isMakerSensorNotificaton) {
                            new_rule.ruleObj.Devices[udn].Level = '0';
                        } else if (isFobPresenceNotification) {
                            new_rule.ruleObj.Devices[udn].Level = keyChainRuleActionValues.ARRIVESORLEAVES;
                        } else if (isDoorWindowNotification) {
                            new_rule.ruleObj.Devices[udn].Level = doorWindowActionValues.OPENSORCLOSES;
                        } else {
                            new_rule.ruleObj.Devices[udn].Level = '1';
                        }
                    } else if (deviceList.getDevice(udn).state == 'off') {
                        if (isMakerSensorNotificaton) {
                            new_rule.ruleObj.Devices[udn].Level = '1';
                        } else if (isFobPresenceNotification) {
                            new_rule.ruleObj.Devices[udn].Level = keyChainRuleActionValues.ARRIVES;
                        } else if (isDoorWindowNotification) {
                            new_rule.ruleObj.Devices[udn].Level = doorWindowActionValues.OPENS;
                        } else {
                            new_rule.ruleObj.Devices[udn].Level = '0';
                        }
                    } else if (deviceList.getDevice(udn).state == 'on_for') {
                    	if(isFobPresenceNotification){
                    		new_rule.ruleObj.Devices[udn].Level = keyChainRuleActionValues.LEAVES;
                    	} else if (isDoorWindowNotification) {
                            new_rule.ruleObj.Devices[udn].Level = doorWindowActionValues.CLOSES;
                        } else{
                    		new_rule.ruleObj.Devices[udn].Level = wemoUtil.convertTimeToMilliseconds(deviceList.getDevice(udn).duration);
                    	}
                    }

                    new_rule.ruleObj.Devices[udn].FName = deviceList.getDevice(udn).name;
                    new_rule.ruleObj.Devices[udn].SensorDuration = new_rule.ruleObj.SensorDuration;
                    new_rule.ruleObj.Devices[udn].ProductName = deviceList.getDevice(udn).productName;
                    console.log(udn + ': ' + JSON.stringify(new_rule.ruleObj.Devices[udn]));
                }
            }
        }

        console.log(JSON.stringify(new_rule.ruleObj));
    },

    methodMain: function() {
        var networktype = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_NETWORKTYPE);
        console.log(TAG + "onDeviceReady");
        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
        wemoUtil.setTimeFormat();
        new_rule.bindEvents();

        //To return back to home page: device list tab
        $(".wemo_logo").on("tap", function(e) {
            if (e.target.nodeName != "IMG") {
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }
        });

        $("#device_not_selected_ok").on("tap", function(e) {
            $("#device_not_selected").popup('close');
            $('body').off('touchmove');
            e.preventDefault();
        });

        //For Rules Support Link
        $("#support_link").on('click', function() {
            if (!isRemoteEnabled) {
                deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
            }
            window.open(wemo.items['ruleHelpCenter'], "_system");
            $("#support_link").popup("close");
        });

        new_rule.ruleObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
        console.log("Rule Type ****** : " + new_rule.ruleObj.RuleType);
        /*
         if ((new_rule.ruleObj.When.StartTime != undefined || new_rule.ruleObj.When.StartTime != null) && new_rule.ruleObj.SelectedDayOrRange != undefined) {
         //-------------------SRSS--------------------
         if (new_rule.ruleObj.When.StartSRSS != undefined && (new_rule.ruleObj.When.StartSRSS === "Sunrise" || new_rule.ruleObj.When.StartSRSS === "Sunset")) {
         $("#notify_rule_when .more_li_clone .select_time").html(new_rule.ruleObj.When.StartSRSS);
         $("#notify_rule_when .more_li_clone .select_day").html( new_rule.ruleObj.SelectedDayOrRange);

         //Plug-in Call To Get Firmware Version SRSS
         if (Object.keys(new_rule.ruleObj.Devices).length > 0) {
         for (key in new_rule.ruleObj.Devices) {
         console.log("SRSS - UDN Firmware Version - " + key + "  ::  " + new_rule.ruleObj.Devices[key]);
         if (new_rule.ruleObj.When.isFirmWareSupported != undefined && new_rule.ruleObj.When.isFirmWareSupported === "false") {
         new_rule.ruleObj.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
         }
         }
         }
         }//-------------------SRSS--------------------
         else if ( (new_rule.ruleObj.When.StartTime == sessionStore.ALLDAY_STARTTIME && new_rule.ruleObj.When.EndTime == sessionStore.ALLDAY_ENDTIME) ||
         (new_rule.ruleObj.When.StartTime == sessionStore.ALLDAY_STARTTIME && new_rule.ruleObj.When.RuleDuration == sessionStore.ALLDAY_RULE_DURATION) ) {
         $("#notify_rule_when .select_time").text(sessionStore.SENSOR_ALLDAY);
         $("#notify_rule_when .more_li_clone .select_day").html( new_rule.ruleObj.SelectedDayOrRange);
         }
         else {
         $("#notify_rule_when .more_li_clone .select_time").html(wemoUtil.convertMillisecondsToAMPM(new_rule.ruleObj.When.StartTime));
         $("#notify_rule_when .more_li_clone .select_day").html( new_rule.ruleObj.SelectedDayOrRange);
         }
         } else {
         var nearestHr = wemoUtil.getTimeRoundedToNearestHalfHour();
         $("#notify_rule_when .more_li_clone .select_time").html(nearestHr);
         $("#notify_rule_when .more_li_clone .select_day").html('Weekdays');


         new_rule.ruleObj.When.StartTime = wemoUtil.convertTimeToMilliseconds(nearestHr);
         new_rule.ruleObj.When.EndTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestOneAndHalfHour());
         new_rule.ruleObj.SelectedDayOrRange = "Mon-Tue-Wed-Thu-Fri";
         }*/
        
        if (new_rule.ruleObj.When.EndTime == 0) new_rule.ruleObj.When.EndTime = timestamp.MIDNIGHT_END_TIME;
        if (new_rule.ruleObj.When.StartTime != undefined && new_rule.ruleObj.When.EndTime == undefined) {
            new_rule.ruleObj.When.EndTime = parseInt(new_rule.ruleObj.When.StartTime) + parseInt(new_rule.ruleObj.When.RuleDuration);
        }

        if ((new_rule.ruleObj.When.StartTime == undefined || new_rule.ruleObj.When.EndTime == undefined)) {
            /* new_rule.ruleObj.When.StartTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestHalfHour());
             new_rule.ruleObj.When.EndTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestOneAndHalfHour());
             var tempDisSelectday = wemo.items['Daily'];

             $("#notify_rule_when .select_time").text(wemoUtil.convertMillisecondsToAMPM(new_rule.ruleObj.When.StartTime) + " - " + wemoUtil.convertMillisecondsToAMPM(new_rule.ruleObj.When.EndTime));
             $("#notify_rule_when .select_day").html(tempDisSelectday);  */

            $("#notify_rule_when .notify_rule_item .select_time").html(sessionStore.SENSOR_ALLDAY);
            //$("#notify_rule_when .more_li_clone .select_day").html(wemo.items['WeekdaysNoDetails']);

            new_rule.ruleObj.When.StartTime = sessionStore.ALLDAY_STARTTIME;
            new_rule.ruleObj.When.EndTime = sessionStore.ALLDAY_ENDTIME;
            new_rule.ruleObj.When.RuleDuration = parseInt(new_rule.ruleObj.When.EndTime) - parseInt(new_rule.ruleObj.When.StartTime);

            //new_rule.ruleObj.SelectedDayOrRange = "Mon-Tue-Wed-Thu-Fri";
        } else {
            if (new_rule.ruleObj.When.StartSRSS != undefined && new_rule.ruleObj.When.EndSRSS != undefined) {

                if (new_rule.ruleObj.When.onSRSS_Title != undefined) {
                    var tempStartSRSS = new_rule.ruleObj.When.onSRSS_Title;
                } else {
                    if (new_rule.ruleObj.When.StartSRSS == "Sunrise") {
                        var tempStartSRSS = wemo.items['SunRise'];
                    } else if (new_rule.ruleObj.When.StartSRSS == "Sunset") {
                        var tempStartSRSS = wemo.items['SunSet'];
                    } else {
                        var tempStartSRSS = new_rule.ruleObj.When.StartSRSS;
                    }
                }

                if (new_rule.ruleObj.When.offSRSS_Title != undefined) {
                    var tempEndSRSS = new_rule.ruleObj.When.offSRSS_Title;
                } else {
                    if (new_rule.ruleObj.When.EndSRSS == "Sunrise") {
                        var tempEndSRSS = wemo.items['SunRise'];
                    } else if (new_rule.ruleObj.When.EndSRSS == "Sunset") {
                        var tempEndSRSS = wemo.items['SunSet'];
                    } else {
                        var tempEndSRSS = new_rule.ruleObj.When.EndSRSS;
                    }
                }

                $("#notify_rule_when .notify_rule_item .select_time").text(tempStartSRSS + " - " + tempEndSRSS);
                //$("#notify_rule_when .more_li_clone .select_day").html( new_rule.ruleObj.SelectedDayOrRange);

                //Plug-in Call To Get Firmware Version SRSS
                if (Object.keys(new_rule.ruleObj.Devices).length > 0) {
                    for (key in new_rule.ruleObj.Devices) {
                        console.log("SRSS - UDN Firmware Version - " + key + "  ::  " + new_rule.ruleObj.Devices[key]);
                        if (new_rule.ruleObj.When.isFirmWareSupported != undefined && new_rule.ruleObj.When.isFirmWareSupported === "false") {
                            new_rule.ruleObj.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                        }
                    }
                }

            } else if (new_rule.ruleObj.When.StartSRSS == undefined && new_rule.ruleObj.When.EndSRSS != undefined) {

                if (new_rule.ruleObj.When.offSRSS_Title != undefined) {
                    var tempEndSRSS = new_rule.ruleObj.When.offSRSS_Title;
                } else {
                    if (new_rule.ruleObj.When.EndSRSS == "Sunrise") {
                        var tempEndSRSS = wemo.items['SunRise'];
                    } else if (new_rule.ruleObj.When.EndSRSS == "Sunset") {
                        var tempEndSRSS = wemo.items['SunSet'];
                    } else {
                        var tempEndSRSS = new_rule.ruleObj.When.EndSRSS;
                    }
                }

                $("#notify_rule_when .notify_rule_item .select_time").text(wemoUtil.convertMillisecondsToTF(new_rule.ruleObj.When.StartTime, UP_TF_IS24) + " - " + tempEndSRSS);
                //$("#notify_rule_when .more_li_clone .select_day").html( new_rule.ruleObj.SelectedDayOrRange);

            } else if (new_rule.ruleObj.When.StartSRSS != undefined && new_rule.ruleObj.When.EndSRSS == undefined) {

                if (new_rule.ruleObj.When.onSRSS_Title != undefined) {
                    var tempStartSRSS = new_rule.ruleObj.When.onSRSS_Title;
                } else {
                    if (new_rule.ruleObj.When.StartSRSS == "Sunrise") {
                        var tempStartSRSS = wemo.items['SunRise'];
                    } else if (new_rule.ruleObj.When.StartSRSS == "Sunset") {
                        var tempStartSRSS = wemo.items['SunSet'];
                    } else {
                        var tempStartSRSS = new_rule.ruleObj.When.StartSRSS;
                    }
                }

                $("#notify_rule_when .notify_rule_item .select_time").text(tempStartSRSS + " - " + wemoUtil.convertMillisecondsToTF(new_rule.ruleObj.When.EndTime, UP_TF_IS24));
                //$("#notify_rule_when .more_li_clone .select_day").html( new_rule.ruleObj.SelectedDayOrRange);

            } else if (new_rule.ruleObj.When.StartSRSS == undefined && new_rule.ruleObj.When.EndSRSS == undefined) {
                if (new_rule.ruleObj.When.StartTime == sessionStore.ALLDAY_STARTTIME && new_rule.ruleObj.When.EndTime == sessionStore.ALLDAY_ENDTIME) {
                    $("#notify_rule_when .select_time").text(sessionStore.SENSOR_ALLDAY);
                } else {
                    $("#notify_rule_when .select_time").text(wemoUtil.convertMillisecondsToTF(new_rule.ruleObj.When.StartTime, UP_TF_IS24) + " - " + wemoUtil.convertMillisecondsToTF(new_rule.ruleObj.When.EndTime, UP_TF_IS24));
                }
                //$("#notify_rule_when .more_li_clone .select_day").html( new_rule.ruleObj.SelectedDayOrRange);
            }
        }

        var selectTimeValue = $("#notify_rule_when .select_time").text();

        //        if(selectTimeValue == sessionStore.SENSOR_ALLDAY){
        //
        //        	new_rule.ruleObj.When.RuleDuration = 86340;
        //        }

        var tempSelectedDayOrRange = "";
        tempSelectedDayOrRange = wemoUtil.convertSelectedDayOrRangeToString(new_rule.ruleObj);
        if (new_rule.ruleObj.SelectedDayOrRange && new_rule.ruleObj.SelectedDayOrRange.split("-").length === 7) {
            tempSelectedDayOrRange = wemo.items['Daily'];
        }

        $("#notify_rule_when .notify_rule_item .select_day").html(tempSelectedDayOrRange);

        new_rule.loadDevices(); 

        $("#device_list").on("tap", '.select_switches_list', function(event) {
            event.stopPropagation();

            var id_drawer = $.trim($(this).closest('.select_switches_list').attr('data-udn'));
            var drawer = $('div [id="' + id_drawer + '"]');

            if ((drawer.is(":visible")) && (drawer.find("div").hasClass("div_bg_green"))) {
                var tmp = drawer.find('.div_bg_green span').html();
                console.log("tmp " + tmp);
            }

            drawer.slideToggle("fast", function() {
                if (drawer.find("div").hasClass("div_bg_green")) {
                    new_rule.updateRuleDevices();
                }
                if (drawer.is(":visible")) {
                    $('#device_list .drawer:visible').each(function(i, elem) {
                        if ($(this).attr("id") != id_drawer) {
                            $(this).slideToggle("fast");
                            console.log("hide drawer id=" + $(this).attr("id"));
                        }
                    });
                };
            });

            event.preventDefault();
        });

        //Simple Rule Page Start
        $("#notify_rule_what_happens").find("li").on("tap", function() {
            wemoUtil.loadUrl(filePath.SELECT_INSIGHTS);
        });

        $("#notify_rule_when").on("tap", function() {
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, new_rule.ruleObj);
            nativeUtilPlugin.execute(null, null, actions.SHOW_SPLASH_ON_LOADING, []);
            wemoUtil.loadUrl(filePath.WHEN_NOTIFY);
        });

        $("#notify_message").on("tap", function() {
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, new_rule.ruleObj);
            wemoUtil.loadUrl(filePath.NOTIFY_MESSAGE);
        });

        $("#how_often").on("tap", function(e) {
            if (isSensorNotificaton || isMakerSensorNotificaton) {
                $('#sensor_picker').attr('style', 'visibility: visible;');
            } else {
                $('#insight_picker').attr('style', 'visibility: visible;');
            }
            e.preventDefault();

        });

        $("#notify_rule_rule_name").on("tap", function() {
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, new_rule.ruleObj);
            nativeUtilPlugin.execute(null, null, actions.SHOW_SPLASH_ON_LOADING, []);
            wemoUtil.loadUrl(filePath.RULE_NAME);
        });

        $("#cnl_ho_btn").on("tap", function(e) {
            $('#insight_picker').attr('style', 'visibility: hidden;');
            e.preventDefault();
        });

        $("#sensor_cnl_ho_btn").on("tap", function(e) {
            $('#sensor_picker').attr('style', 'visibility: hidden;');
            e.preventDefault();
        });

        $("#set_ho_btn").on("tap", function(e) {
            new_rule.ruleObj.HowOften = $('input[name=rad_how_often]:checked').val();
            $('#notify_how_often_text').html(new_rule.ruleObj.HowOften);
            switch (new_rule.ruleObj.HowOften) {
                case "notify every time":
                    new_rule.ruleObj.Frequency = parseInt(1, 10);
                    break;
                case "5 min":
                    new_rule.ruleObj.Frequency = parseInt(5 * 60, 10);
                    break;
                case "10 min":
                    new_rule.ruleObj.Frequency = parseInt(10 * 60, 10);
                    break;
                case "15 min":
                    new_rule.ruleObj.Frequency = parseInt(15 * 60, 10);
                    break;
                case "30 min":
                    new_rule.ruleObj.Frequency = parseInt(30 * 60, 10);
                    break;
                case "1 hr":
                    new_rule.ruleObj.Frequency = parseInt(60 * 60, 10);
                    break;
                case "2 hr":
                    new_rule.ruleObj.Frequency = parseInt(120 * 60, 10);
                    break;
                case "3 hr":
                    new_rule.ruleObj.Frequency = parseInt(180 * 60, 10);
                    break;
                case "12 hr":
                    new_rule.ruleObj.Frequency = parseInt(720 * 60, 10);
                    break;
                case "Day":
                    new_rule.ruleObj.Frequency = parseInt(1440 * 60, 10);
                    break;
            }
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, new_rule.ruleObj);
            $('#insight_picker').attr('style', 'visibility: hidden;');
            e.preventDefault();
        });


        $("#sensor_set_ho_btn").on("tap", function(e) {
            new_rule.ruleObj.HowOften = $('input[name=sensor_how_often]:checked').val();
            $('#notify_how_often_text').html(new_rule.ruleObj.HowOften);
            switch (new_rule.ruleObj.HowOften) {
                case "5 min":
                    new_rule.ruleObj.NotificationDuration = parseInt(5 * 60, 10);
                    break;
                case "10 min":
                    new_rule.ruleObj.NotificationDuration = parseInt(10 * 60, 10);
                    break;
                case "15 min":
                    new_rule.ruleObj.NotificationDuration = parseInt(15 * 60, 10);
                    break;
                case "30 min":
                    new_rule.ruleObj.NotificationDuration = parseInt(30 * 60, 10);
                    break;
                case "1 hr":
                    new_rule.ruleObj.NotificationDuration = parseInt(60 * 60, 10);
                    break;
                case "2 hr":
                    new_rule.ruleObj.NotificationDuration = parseInt(120 * 60, 10);
                    break;
                case "3 hr":
                    new_rule.ruleObj.NotificationDuration = parseInt(180 * 60, 10);
                    break;
                case "6 hr":
                    new_rule.ruleObj.NotificationDuration = parseInt(360 * 60, 10);
                    break;
                case "12 hr":
                    new_rule.ruleObj.NotificationDuration = parseInt(720 * 60, 10);
                    break;
                case "Once per day / time interval":
                    new_rule.ruleObj.NotificationDuration = parseInt(1440 * 60, 10);
                    break;
            }
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, new_rule.ruleObj);
            $('#sensor_picker').attr('style', 'visibility: hidden;');
            e.preventDefault();
        });

        $('#notify_rule_selected_device').find('li').on("pointerdown", function() {
            window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE, $(this).attr("data-udn"));
            window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE_NAME, $(this).attr("data-fName"));
            window.sessionStorage.setItem(sessionStore.RULE_TYPE, JSON.stringify("simple_rule"));
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, new_rule.ruleObj);
            wemoUtil.loadUrl(filePath.INSIGHT_WHAT_HAPPENS);
        });

        // alert(Object.keys(new_rule.ruleObj.Devices).length+'   '+new_rule.ruleObj.When.StartSRSS);

        if (Object.keys(new_rule.ruleObj.Devices).length <= 0) {
            //$("#notify_rule_save_btn").button("disable");
        } else {
            if (new_rule.ruleObj.When.StartSRSS != undefined && (new_rule.ruleObj.When.StartSRSS === "Sunrise" || new_rule.ruleObj.When.StartSRSS === "Sunset")) {
                if (new_rule.ruleObj.locationInfo != undefined && new_rule.ruleObj.locationInfo.cityName != undefined) {
                    //$("#notify_rule_save_btn").button("enable");
                } else {
                    //$("#notify_rule_save_btn").button("disable");
                }

            } else {
                //$("#notify_rule_save_btn").button("enable");
            }
        }

        //Notify Rule Click on the Save Button
        $("#notify_rule_save_btn").on('click', function() {
            //-------------------SRSS--------------------
            //Plug-in Call To Get Firmware Version SRSS
            //var x=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
            // alert("city name = "+new_rule.ruleObj.locationInfo.cityName);
            var isFirmWareSupported;
            console.log("Rule stringify ****** : " + JSON.stringify(new_rule.ruleObj));

            if (new_rule.ruleObj.When.StartSRSS != undefined && (new_rule.ruleObj.When.StartSRSS === "Sunrise" || new_rule.ruleObj.When.StartSRSS === "Sunset")) {
                if (Object.keys(new_rule.ruleObj.Devices).length > 0) {
                    for (key in new_rule.ruleObj.Devices) {
                        console.log("SRSS - UDN Firmware Version - " + key + "  ::  " + new_rule.ruleObj.Devices[key]);
                        new_rule.ruleObj.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);

                    }
                }
            }
            //-------------------SRSS--------------------			

            var len = Object.keys(new_rule.ruleObj.Devices).length;
            var issupported = "";
            if (len == 0) {
                $('body').on('touchmove', function(e) {
                    e.preventDefault();
                });
                setTimeout(
                    function() {
                        $('#device_not_selected').popup("open");
                    },
                    timeout.POPUP_DISPLAY_DELAY
                );
                console.log("save disable");
                return;
            }
            nativeUtilPlugin.execute(null, null, actions.SHOW_SPLASH_ON_LOADING, []);
            for (var key in new_rule.ruleObj.Devices) {
                if ((new_rule.ruleObj.When.OnModeOffset != undefined && new_rule.ruleObj.When.OnModeOffset != 0) || (new_rule.ruleObj.When.OffModeOffset != undefined && new_rule.ruleObj.When.OffModeOffset != 0)) {
                    if (networktype == null || networktype == networkType.HOME_NETWORK) {
                        devicePlugin.execute(
                            function(params) {
                                if (params === "true") {
                                    //                                        fwCheckComplete(params);
                                    isFirmWareSupported = params;
                                } else {
                                    isFirmWareSupported = params;
                                    nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                    var ruleConflictLocalizedmsg = wemo.items['FirmwareVerCheckText_OFFSET'];
                                    $("#FirmwareVerCheckText").html(ruleConflictLocalizedmsg);
                                    setTimeout(function() {
                                            $("#fw_ver_check").popup("open");
                                        },
                                        300
                                    );
                                }
                            },
                            wemoUtil.reportError,
                            actions.GET_FIRMWARE_VERSION_SRSS_OFFSET, [key]
                        );

                    } else if (networktype == networkType.REMOTE_WIFI || networktype == networkType.REMOTE_MOBILE) {

                        wemoUtil.infoLog(wemoUtil.TAG, 'Remote getFirmwareVersion');

                        devicePlugin.execute(
                            function(enabled) {
                                wemoUtil.infoLog(wemoUtil.TAG, 'Remote enabled::: ' + enabled);
                                if (enabled) {
                                    var firmwareArray = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.FIRMWARE_VERSION_DATA);
                                    wemoUtil.infoLog(wemoUtil.TAG, 'firmwareArray ::: ' + JSON.stringify(firmwareArray));

                                    for (var i = 0; i < firmwareArray.length; i++) {

                                        wemoUtil.infoLog(wemoUtil.TAG, "UDN value : " + key + "  Array UDN value : " + firmwareArray[i]["udn"]);
                                        if (firmwareArray[i]["udn"] == key) {
                                            var firmwareVerString = firmwareArray[i]["devicefirmware"];
                                            var firmwareVerAry = firmwareVerString.split('.');
                                            var firmwareVer = parseInt(firmwareVerAry[2]);
                                            wemoUtil.infoLog(wemoUtil.TAG, 'firmware version : ' + firmwareVer);

                                            if (firmwareVer >= configValue.SO_FW_SUPPORT) {
                                                wemoUtil.infoLog(wemoUtil.TAG, 'firmware is supported ');
                                                //                                                    fwCheckComplete(true);
                                                isFirmWareSupported = true;
                                            } else {
                                                isFirmWareSupported = false;
                                                nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                                var ruleConflictLocalizedmsg = wemo.items['FirmwareVerCheckText_OFFSET'];
                                                $("#FirmwareVerCheckText").html(ruleConflictLocalizedmsg);
                                                setTimeout(function() {
                                                        $("#fw_ver_check").popup("open");
                                                    },
                                                    300
                                                );
                                            }

                                        }

                                    }
                                }
                            },
                            wemoUtil.reportError,
                            actions.IS_REMOTE_ENABLED, []
                        );

                    }
                } else if (isSensorNotificaton) {
                    if (networktype == null || networktype == networkType.HOME_NETWORK) {
                        devicePlugin.execute(
                            function(params) {
                                if (params === "true") {
                                    //                                        fwCheckComplete(true);
                                    isFirmWareSupported = params;
                                } else {
                                    //                                    	fwCheckComplete("false");
                                    isFirmWareSupported = params;
                                    nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                    var ruleConflictLocalizedmsg = wemo.items['FirmwareVerCheckText_OFFSET'];
                                    $("#FirmwareVerCheckText").html(ruleConflictLocalizedmsg);
                                    setTimeout(function() {
                                            $("#fw_ver_check").popup("open");
                                            nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, ["", wemo.items['RULE_STATUS_SENDING_DB']]);
                                        },
                                        300
                                    );
                                }
                            },
                            wemoUtil.reportError,
                            actions.MOTION_NOTIFY_FW_VER_CHECK, [key]
                        );
                    } else if (networktype == networkType.REMOTE_WIFI || networktype == networkType.REMOTE_MOBILE) {

                        wemoUtil.infoLog(wemoUtil.TAG, 'Remote getFirmwareVersion');

                        devicePlugin.execute(
                            function(enabled) {
                                wemoUtil.infoLog(wemoUtil.TAG, 'Remote enabled::: ' + enabled);
                                if (enabled) {
                                    var firmwareArray = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.FIRMWARE_VERSION_DATA);
                                    wemoUtil.infoLog(wemoUtil.TAG, 'firmwareArray ::: ' + JSON.stringify(firmwareArray));

                                    for (var i = 0; i < firmwareArray.length; i++) {

                                        wemoUtil.infoLog(wemoUtil.TAG, "UDN value : " + key + "  Array UDN value : " + firmwareArray[i]["udn"]);
                                        if (firmwareArray[i]["udn"] == key) {
                                            var firmwareVerString = firmwareArray[i]["devicefirmware"];
                                            var firmwareVerAry = firmwareVerString.split('.');
                                            var firmwareVer = parseInt(firmwareVerAry[2]);
                                            wemoUtil.infoLog(wemoUtil.TAG, 'firmware version : ' + firmwareVer);

                                            if (firmwareVer >= configValue.MOTION_NOTIFY_FW_SUPPORT) {
                                                wemoUtil.infoLog(wemoUtil.TAG, 'firmware is supported ');
                                                //                                                    fwCheckComplete(true);
                                                isFirmWareSupported = true;
                                            } else {
                                                nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                                var ruleConflictLocalizedmsg = wemo.items['FirmwareVerCheckText_OFFSET'];

                                                $("#FirmwareVerCheckText").html(ruleConflictLocalizedmsg);
                                                //                                                	fwCheckComplete("false");
                                                isFirmWareSupported = false;
                                                setTimeout(function() {

                                                        $("#fw_ver_check").popup("open");
                                                        nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, ["", wemo.items['RULE_STATUS_SENDING_DB']]);
                                                    },
                                                    300
                                                );
                                            }

                                        }

                                    }
                                }
                            },
                            wemoUtil.reportError,
                            actions.IS_REMOTE_ENABLED, []
                        );

                    }
                } else {
                    //                        fwCheckComplete(true);
                    isFirmWareSupported = true;
                }
            }


            if (isFirmWareSupported === "false") {
                return;
            } else {
                fwCheckComplete(true);
            }

            function fwCheckComplete(issupported) {
                if (isSensorNotificaton) {
                    new_rule.ruleObj.RuleType = "Notify Me";
                } else if (isMakerSensorNotificaton) {
                    new_rule.ruleObj.RuleType = sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE;
                } else if (isFobPresenceNotification) {
                    new_rule.ruleObj.RuleType = sessionStore.NOTIFY_KEYCHAIN_PRESENCE_RULE;
                } else {
                    new_rule.ruleObj.RuleType = "Insight Rule";
                }
                wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, new_rule.ruleObj);

                if (issupported === "false") {
                    new_rule.ruleObj.When.isFirmWareSupported = "false";
                    saveNewRule_RULES_RULEDEVICES(new_rule.ruleObj.RuleType, new_rule.ruleObj);
                    return;
                }
                if (Object.keys(new_rule.ruleObj.Devices).length > 0) {
                    if (new_rule.ruleObj.When.isFirmWareSupported != undefined && new_rule.ruleObj.When.isFirmWareSupported === "false") {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        setTimeout(
                            function() {
                                $("#sunrise_firmware_upgrade").popup("open");
                            },
                            timeout.POPUP_DISPLAY_DELAY
                        );
                    } else {
                        saveNewRule_RULES_RULEDEVICES(new_rule.ruleObj.RuleType, new_rule.ruleObj);
                    }
                } else {
                    $('body').on('touchmove', function(e) {
                        e.preventDefault();
                    });
                    nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                    setTimeout(
                        function() {
                            $('#device_not_selected').popup("open");
                        },
                        timeout.POPUP_DISPLAY_DELAY
                    );
                }
            }
        });

        //FW Compatibility based upgrade
        $("#update_nw_btn").on("click", function() {
            if (!isRemoteEnabled)
                deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
            wemoUtil.loadUrl(filePath.MORE_NEW_FIRMWARE);
            $("#fw_ver_check").popup("close");
        });

        $("#later_btn").on("click", function() {
            $("#fw_ver_check").popup("close");
            //        		wemoUtil.loadUrl(filePath.ENABLED_RULES);
            if (isSensorNotificaton) {
                new_rule.ruleObj.RuleType = "Notify Me";
            } else if (isMakerSensorNotificaton) {
                new_rule.ruleObj.RuleType = sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE;
            } else if (isFobPresenceNotification) {
                new_rule.ruleObj.RuleType = sessionStore.NOTIFY_KEYCHAIN_PRESENCE_RULE;
            } else {
                new_rule.ruleObj.RuleType = "Insight Rule";
            }
            new_rule.ruleObj.When.isFirmWareSupported = "false";
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, new_rule.ruleObj);
            saveNewRule_RULES_RULEDEVICES(new_rule.ruleObj.RuleType, new_rule.ruleObj);
        });

        //SRSS firmware upgrade

        $("#sunrise_firmware_upgrade_updatenow").on("click", function() {
            $("#sunrise_firmware_upgrade").popup("close");
            wemoUtil.loadUrl(filePath.MORE_NEW_FIRMWARE);
        });

        $('#sunrise_firmware_upgrade_later').on('click', function() {
            var x = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
            $("#sunrise_firmware_upgrade").popup('close');
            saveNewRule_RULES_RULEDEVICES(new_rule.ruleObj.RuleType, x);
        });

        $('#notify_rule_cancel_btn').on('click', function() {
            window.sessionStorage.removeItem(sessionStore.isEditNotificationRule);
            if (parseInt(JSON.parse(window.sessionStorage.getItem(sessionStore.RULES_DATA)).length) > 0) {
                wemoUtil.loadUrl(filePath.ENABLED_RULES);
            } else {
                wemoUtil.loadUrl(filePath.CREATE_RULE);
            }
        });

        if (typeof(new_rule.ruleObj.RuleName) == "undefined") {
            if (isSensorNotificaton)
                new_rule.ruleObj.RuleName = wemo.items['MotionNotificationRule'];
            else if (isMakerSensorNotificaton)
                new_rule.ruleObj.RuleName = wemo.items['MakerNotificationRule'];
            else if (isFobPresenceNotification)
                new_rule.ruleObj.RuleName = wemo.items['FobPresenceNotificationRule'];
            else if (isDoorWindowNotification)
                new_rule.ruleObj.RuleName = wemo.items['DoorWindowNotificationRule'];
            else
                new_rule.ruleObj.RuleName = wemo.items['InsightNotificationRule'];
        }

        if ((Object.keys(new_rule.ruleObj.Devices).length > 1) || (Object.keys(new_rule.ruleObj.Devices).length == 0)) {
            if (new_rule.ruleObj.NM_FlagMult !== true) {
                if((new_rule.ruleObj.NotifyMessage === undefined) || (new_rule.ruleObj.NotifyMessage.length < 1)){
                new_rule.ruleObj.NotifyMessage = "Something happened.";
                }
            }
        }

        if (isSensorNotificaton || isMakerSensorNotificaton) {
            how_often_val = new_rule.ruleObj.NotificationDuration;
        } else {
            how_often_val = new_rule.ruleObj.Frequency;
        }

        if ((how_often_val !== undefined) && (new_rule.ruleObj.HowOften === undefined)) {
            var how_often = new_rule.convertFrequencyToHowOftenValue(how_often_val);
            if (isSensorNotificaton || isMakerSensorNotificaton)
                $('input[name="sensor_how_often"][value="' + how_often + '"]').attr('checked', 'checked');
            else
                $('input[name="rad_how_often"][value="' + how_often + '"]').attr('checked', 'checked');
            $('#notify_how_often_text').html(how_often);
        } else if (new_rule.ruleObj.HowOften === undefined) {
            $('#notify_how_often_text').html("30 min");
            if (isSensorNotificaton || isMakerSensorNotificaton) {
                new_rule.ruleObj.NotificationDuration = parseInt(30 * 60, 10);
            } else {
                new_rule.ruleObj.Frequency = parseInt(30 * 60, 10);
            }
        } else {
            $('#notify_how_often_text').html(new_rule.ruleObj.HowOften);
        }
        if((new_rule.ruleObj.NotifyMessage === undefined) || (new_rule.ruleObj.NotifyMessage.length < 1)){
            new_rule.ruleObj.NotifyMessage = "Something happened.";
        }
        $("#notify_message_text").html(new_rule.ruleObj.NotifyMessage);
        $("#rule_name").html(new_rule.ruleObj.RuleName);
        wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, new_rule.ruleObj);
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
    deviceListBorder: function() {
        var switch_list = $("#notify_rule_what_happens").find(".what_happens_select_switches").length;
        if (switch_list === 1) {
            $(".what_happens_select_switches").addClass("select_switches_full");
        } else if (switch_list === 2) {
            $(".what_happens_select_switches:first-child").addClass('select_switches_clone_top');
            $(".what_happens_select_switches:last-child").addClass('select_switches_clone_bottom');
        } else if (switch_list >= 3) {
            $(".what_happens_select_switches:first-child").addClass('select_switches_clone_top');
            $(".what_happens_select_switches:last-child").addClass('select_switches_clone_bottom');
            $(".what_happens_select_switches").not(".what_happens_select_switches:first-child, .what_happens_select_switches:last-child").addClass('select_switches_middle');
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

        //Rules Can not be saved Popup
        $("#rule_can_not_save_ok").on("tap", function() {
            //alert("Rules Can't be saved");
            $("#rule_can_not_save").popup("close");
        });

    },

    convertFrequencyToHowOftenValue: function(seconds) {
        console.log("************** milliseconds : " + seconds);
        if (seconds == 1) {
            var strTime = "notify every time";
        } else if (seconds == 86400) {
            var strTime = "Day";
        } else if (seconds < 3600) {
            var mins = Math.floor(seconds / 60);
            var strTime = mins + ' min';
        } else {
            var hours = Math.floor(seconds / 3600);
            console.log("************** hours " + hours);
            var strTime = hours + ' hr';
        }
        return strTime;
    }

};
