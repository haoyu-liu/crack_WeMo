/*
 deviceObject.js

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

function WeMoDevice(udn, type, name, icon, state, cached, fwstatus, makerAttributeList, modelName, customizedState, firmwareVersion, hwVersion, mac) {
    this.udn = udn;
    this.type = type;
    this.name = name;
    this.icon = icon;
    this.state = state;
    this.cached = cached;
    this.fwstatus = fwstatus;
    this.makerAttributeList = makerAttributeList;
    this.remote = false;
    this.inactive = false;
    this.modelName = modelName;
    this.customizedState = customizedState;
    this.firmwareVersion = firmwareVersion;
    this.info = null;
    this.hwVersion = hwVersion;
    this.mac = mac;
    this.macAddress = mac;
}

function WeMoDeviceRemote(udn, type, name, state, mac, pluginid, stateChangeTS, fwVersion, makerAttributeList, iconVersion, customizedState,hwVersion) {
    _.extend(this, device);
    this.udn = udn;
    this.type = type;
    this.name = name;
    this.mac = mac;
    this.state = state;
    this.pluginid = pluginid;
    this.makerAttributeList = makerAttributeList;
    this.remote = true;
    this.inactive = false;
    this.icon = null;
    this.stateChangeTS = stateChangeTS;
    this.iconVersion = iconVersion;
    this.fwVersion = fwVersion;
    this.customizedState = customizedState;
    this.info = null;
    this.hwVersion=hwVersion;
}

function AutoOffRemote(udn, RuleAutoOffTime) {
   
    this.udn = udn;
    this.RuleAutoOffTime = RuleAutoOffTime;
}
/*
 window.deviceListEvents.on('addNewDevice', function(options) {
 console.log('DEVICELIST:' + JSON.stringify(options));
 WeMoDeviceList.addDevice(options.udn, options);
 });
 */

var smartDevice = {};
var isUpdateCacheGoing=false;
var WeMoDeviceList = {
    _deviceList: {},
    _deviceTimerFirst: [],
    _deviceTimerSecond: [],
    _deviceIconUpdate: [],

    haveDevice: function(udn) {
        return WeMoDeviceList._deviceList[udn];
    },


    updateCache: function() {
        if(isUpdateCacheGoing==true)
    		return;
    	isUpdateCacheGoing=true;
    	setTimeout(function() {
    		var arrCache = [];
    		for (var udn in WeMoDeviceList._deviceList) {
    			arrCache.push(WeMoDeviceList._deviceList[udn]);
    		}
    		var cacheJSON = JSON.stringify(arrCache);
    		sharedPreferences.set(sharedPreferencesConstants.WEMO_NAMESPACE, sharedPreferencesConstants.WEMO_DEVICE_CACHE, cacheJSON);
    		isUpdateCacheGoing=false;
    	},configValue.CACHE_UPDATE_INTV);
    },

    restoreFromCache: function(callback) {
        sharedPreferences.get(sharedPreferencesConstants.WEMO_NAMESPACE, sharedPreferencesConstants.WEMO_DEVICE_CACHE, '', function(value) {
            if (value != null && value.length > 0) {
                var arrCache = JSON.parse(value);
                WeMoDeviceList.clear();
                for (var i = 0; i < arrCache.length; i++) {
                    var dev = arrCache[i];
                    dev.cached = true;
                    WeMoDeviceList._deviceList[dev.udn] = dev;
                }
            }
            callback();
        });
    },

    addDevice: function(udn, device) {
        console.log('Device added: ' + udn);
        if (!device.state) {
            if (WeMoDeviceList._deviceList[udn]) {
                WeMoDeviceList.updateState(device.state);
            }
            sharedPreferences.get('DeviceCacheState', device.udn, deviceStates.OFF, function(state) {
                if (state) {
                    device.state = state;
                } else {
                    device.state = deviceStates.OFF;
                }

                WeMoDeviceList._deviceList[udn] = device;
            });
        } else {
            sharedPreferences.set('DeviceCacheState', device.udn, device.state);
            WeMoDeviceList._deviceList[udn] = device;
        }
        WeMoDeviceList.updateCache();
        window.devicelistEvents.emit('deviceObject.deviceAdded', udn);
    },

    clear: function() {
        WeMoDeviceList._deviceList = {};
    },

    removeDevice: function(udn) {
        delete WeMoDeviceList._deviceList[udn];
        WeMoDeviceList.updateCache();
        DEBUG && console.log('DEVICELIST:remove from cache:removeDevice=' + udn);
        if (window.devicelistEvents) {
            window.devicelistEvents.emit('deviceObject.deviceRemoved', udn);
        }
        
        WeMoDeviceList.checkBridge(udn);
    },
    checkBridge: function(udn) {
    	wemoUtil.infoLog('deviceObject','checkBridge from cache:udn=' + udn);
    	if(udn.indexOf('Bridge') != -1)
    	{
    		$("ul li[data-category='bridge']").each(function() {

    			var itemid = $(this).attr('id');
    			wemoUtil.infoLog('deviceObject','entering in bridge fimrware status if checkBridge: '+itemid);

    			$("#" + itemid).removeClass('led_group');
    			$("#" + itemid).removeClass('led_list');
    			$("#" + itemid).addClass('disabled');

    			var liname = $(this).attr('name');

    			if (liname == "switch_li") {
    				var inneritem = $(this).find('span[name="name_led_device_state"]');
    				var currID = inneritem.attr('id');
    				$("#"+currID).removeClass();

    			}
    			else if(liname == "group_li"){
    				var inneritem = $(this).find('span[name="name_group_state"]');
    				var currID = inneritem.attr('id');
    				$("#"+currID).removeClass();
    			}

    			$("#" + itemid).find('.NotDetected').text(wemo.items['LEDBulb_Unavailable_Messgage']);
    			$("#" + itemid).find('.NotDetected').show();

    		});
    		if(window.sessionStorage.getItem(sessionStore.IS_UPGRADE_INPROGRESS) == true){
    			$(".bridge_unavailable_text").html(wemo.items['updatingWeMoLinkTitle']);
    			$(".font-detail").html(wemo.items['updatingWeMoLinkDesc']);
    		}

    		$("#bridgeunavailable").show();

    	}
    },
    getDevice: function(udn) {
        //console.log("WeMoDeviceList - deviceList by udn [" + udn + "] " + JSON.stringify(WeMoDeviceList._deviceList[udn]));
        return WeMoDeviceList._deviceList[udn];
    },

    startAnimationTimeout: function(udn, refresh) {
        var tmpDev = WeMoDeviceList.getDevice(udn);
        if (tmpDev.cached) {
            clearTimeout(WeMoDeviceList._deviceTimerFirst[udn]);
            WeMoDeviceList._deviceTimerFirst[udn] = setTimeout(function() {
                var tmpDev = WeMoDeviceList.getDevice(udn);
                if (tmpDev.cached && !tmpDev.inactive) { //Device is Cached and Active
                	device_list.startWheelAnimation(udn);
                	window.devicelistEvents.emit('fetchFromDeviceList' + udn, {loseConnection:true});
                    WeMoDeviceList._deviceTimerSecond[udn] = setTimeout(function() {
                        var tmpDev = WeMoDeviceList.getDevice(udn);
                        if (tmpDev && tmpDev.cached) {
                        	device_list.stopWheelAnimation(udn);
                            device_list.setDeviceInactive(udn);
                            window.devicelistEvents.emit('fetchFromDeviceList' + udn, {inactive:true});
                        } else {
                        	window.devicelistEvents.emit('fetchFromDeviceList' + udn, {loseConnection:false});
                        }
                    }, timeout.DEVICE_DISCOVERY_SECOND_TIMER);
                }
            }, timeout.DEVICE_DISCOVERY_FIRST_TIMER);
        }
    },

    getDeviceByMac: function(mac) {
        for (var udn in WeMoDeviceList._deviceList) {
            if (WeMoDeviceList._deviceList[udn].remote) {
                if (WeMoDeviceList._deviceList[udn].mac == mac) {
                    return WeMoDeviceList._deviceList[udn];
                }
            }
        }
    },

    setCacheAll: function() {
        for (var udn in WeMoDeviceList._deviceList) {
            WeMoDeviceList._deviceList[udn].cached = true;
            //WeMoDeviceList._deviceList[udn].inactive = false;
        }
    },

    getArray: function() {
        return WeMoDeviceList._deviceList;
    },
    
    getCountActiveDevices: function() {
        var count = 0;
        for (var udn in WeMoDeviceList._deviceList) {
            if (!WeMoDeviceList._deviceList[udn].inactive) {
                count++;
            }
        }
        return count;
    },

    
    printDevices: function() {
        for (var udn in WeMoDeviceList._deviceList) {
            console.log(JSON.stringify(WeMoDeviceList._deviceList[udn]));
        }
    },

    updateIcon: function(udn, icon) {
        if (WeMoDeviceList._deviceList[udn] != undefined) {
            WeMoDeviceList._deviceList[udn].icon = icon;
            console.log(JSON.stringify(WeMoDeviceList._deviceList[udn]));
        }
    },

    updateState: function(udn, state) {
        if (WeMoDeviceList._deviceList[udn] != undefined) {
            var wemodevice = WeMoDeviceList._deviceList[udn];
            wemodevice.state = state;
            console.log("Maker attribute list" + wemodevice.makerAttributeList);
            if (state != deviceStates.UNAVAILABLE) {
                if (wemodevice.makerAttributeList != undefined && wemodevice.makerAttributeList != '' && wemodevice.makerAttributeList != "}") {
                    var attributelistJson;
                    if (typeof(wemodevice.makerAttributeList) == "string") {
                        attributelistJson = JSON.parse(wemodevice.makerAttributeList);
                    } else {
                        attributelistJson = wemodevice.makerAttributeList;
                    }
                    if(window.sessionStorage.getItem(sessionStore.REMOTE_MODE) == "true" && attributelistJson.SwitchMode.value == 1)
                       { 
	                   if($( "span[wemo-device-udn='"+wemodevice.udn+"']" ))
	                     {  device_list.stopWheelAnimation(udn);
		                        setTimeout(function(){
			                        $( "span[wemo-device-udn='"+wemodevice.udn+"']" ).removeClass('switch_on').addClass('switch_off');
			                        $( "span[wemo-device-udn='"+wemodevice.udn+"']" ).attr('wemo-device-state','0')
			                        
			                        attributelistJson.Switch.value = "0";
			                        wemodevice.makerAttributeList = attributelistJson;
			                        sharedPreferences.set('DeviceCacheState', udn, "0");
			                        WeMoDeviceList.updateCache();
	                        
	                       		 },timeout.MOMENTORY_MODE_TIME);
	                    }
                  } 
                    if (attributelistJson.Switch != undefined)
                        attributelistJson.Switch.value = state;
                        
                    wemodevice.makerAttributeList = attributelistJson; //JSON.stringify(attributelistJson);
                }
                sharedPreferences.set('DeviceCacheState', udn, state);
                if(state==3)
                WeMoDeviceList.setInactive(udn);
                else
                WeMoDeviceList.setActive(udn);

                if (WeMoDeviceList._deviceTimerFirst[udn]) {
                    clearTimeout(WeMoDeviceList._deviceTimerFirst[udn]);
                    delete WeMoDeviceList._deviceTimerFirst[udn];
                }
                if (WeMoDeviceList._deviceTimerSecond[udn]) {
                    clearTimeout(WeMoDeviceList._deviceTimerSecond[udn]);
                    delete WeMoDeviceList._deviceTimerSecond[udn];
                }
            }
            device_list.stopWheelAnimation(udn);
            WeMoDeviceList.updateCache();
        }
    },

    setInactive: function(udn) {
        WeMoDeviceList._deviceList[udn].inactive = true;
        WeMoDeviceList.updateCache();
    },

    setActive: function(udn) {
        WeMoDeviceList._deviceList[udn].inactive = false;
        WeMoDeviceList.updateCache();
    },

    sortByName: function() {
        //console.log("Sort by name...");
        //console.log(JSON.stringify(WeMoDeviceList._deviceList));

        var tmpArr = [];

        for (var key in WeMoDeviceList._deviceList) {
            tmpArr.push(WeMoDeviceList._deviceList[key]);
        }

        tmpArr = tmpArr.sort(function(a, b) {
            //console.log(JSON.stringify(a));
            var x = a.name.toLowerCase();
            var y = b.name.toLowerCase();
            
            var i = 0;

            if (x.length > y.length) {
                for (i = 0; i < y.length; i++) {
                    if (x.charAt(i) != y.charAt(i)) {
                        if (x.charAt(i) > y.charAt(i)) {
                            return 1;
                        }
                        if (x.charAt(i) < y.charAt(i)) {
                            return -1;
                        }
                    }
                }
            } else {
                for (i = 0; i < x.length; i++) {
                    if (x.charAt(i) != y.charAt(i)) {
                        if (x.charAt(i) > y.charAt(i)) {
                            return 1;
                        }
                        if (x.charAt(i) < y.charAt(i)) {
                            return -1;
                        }
                    }
                }
            }
            return 0;
        });

        WeMoDeviceList.clear();

        tmpArr.forEach(function(item) {
            WeMoDeviceList._deviceList[item.udn] = item;
        });

        console.log(JSON.stringify(WeMoDeviceList._deviceList));

        return WeMoDeviceList._deviceList;
    },

    sortByCustomizedOrder: function(order) {
        console.log("Sort by customized order...");
        console.log('Order JSON: ' + order); // getting undefined, needs a check
        var arrOrder = JSON.parse(order);
        var arrDev = [];
        var devList = WeMoDeviceList._deviceList;

        var udn_;
        for (var i = 0; i < arrOrder.length; i++) {
            udn_ = arrOrder[i];
            console.log("udn in the order --- " + udn_);
            if (WeMoDeviceList._deviceList[udn_]) {
                arrDev[udn_] = WeMoDeviceList._deviceList[udn_];
            }
        }

        for (var udn in devList) {
            if (!arrDev[udn]) {
                console.log("udn in the list --- " + udn);
                arrDev[udn] = WeMoDeviceList._deviceList[udn];
            }
        }
        return arrDev;
    }

};

var CountDowner = function () {
	this.timer = null;
	var udnid = null;
	this.prevEndTime = null;
	var display = function () {
        var o = '';
        var currentEpoch = wemoUtil.currentEpochTime();
        var diff  = WeMoDeviceUtils.countdowner[udnid].prevEndTime - currentEpoch ;
        
        var t = {
                h: Math.floor(diff / 3600),
                m: Math.floor(diff / 60) % 60,
                s: diff % 60
            };
        if (t != undefined ) {
            d = [
                (t.h === 0) ? '' : t.h + 'h',
                (t.m === 0) ? '' : t.m + 'm',
                (t.s === 0 || t.h > 0 || t.m > 0) ? '' : t.s + 's'
            ];
            o = 'Auto-off in ' + d.join(' ');
        } 
        wemoUtil.infoLog('AUTO_OFF_TIMER', 'countDownTimeUDN_ -> dispaly #' + d +  ' :: diff :: ' + diff + 'countDownTimeUDN_ -> currentEpoch #' + currentEpoch +  ' :: prevEndTime :: ' + WeMoDeviceUtils.countdowner[udnid].prevEndTime); 
        if(diff > 0 ){
                 this.timer = window.setTimeout(display, 1000);
                 document.getElementById('countDownTimeUDN_' + udnid).innerHTML = o;
             } else {
            	 document.getElementById('countDownTimeUDN_' + udnid).innerHTML = "";
     	        clearTimer();
             }
	};
	
    var clearTimer = function () {
        window.clearTimeout(this.timer);
        delete this.timer;
        delete this.prevEndTime;
    }
	this.destroy = function () {
		clearTimer();
	};
    this.initialize = function (endTime, udn) {
        var parsedEndtime = parseInt(endTime);
        this.prevEndTime = parseInt(endTime);
        if(parsedEndtime < 0) {
			clearTimer();
		}
        udnid = udn; 
		display(); 
	};	
};

var WeMoDeviceUtils = {
    countdowner: {},
    countLoop: function(countDownEndTime, udn) {
        try {	
            if(countDownEndTime == '0') {
                if(WeMoDeviceUtils.countdowner[udn] != null || WeMoDeviceUtils.countdowner[udn] != undefined) {
                    WeMoDeviceUtils.countdowner[udn].destroy();
                    WeMoDeviceUtils.countdowner[udn] = null;
                }
            } else {
                if(WeMoDeviceUtils.countdowner[udn] == null || WeMoDeviceUtils.countdowner[udn] == undefined) {
                    WeMoDeviceUtils.countdowner[udn] = new CountDowner();
                    WeMoDeviceUtils.countdowner[udn].initialize(countDownEndTime, udn);
                } else {
                    if(WeMoDeviceUtils.countdowner[udn].prevEndTime != countDownEndTime) {
                    	WeMoDeviceUtils.countdowner[udn].destroy();
                        WeMoDeviceUtils.countdowner[udn].initialize(countDownEndTime, udn);
                    }
                }
            }
        }catch(e){
            console.log("Error message during countdown display " + e.message);
        }
    },
		
    getBinaryStateImage: function(state) {
        if (state == deviceStates.OFF) {
            return "switch_off";
        } else if (state == deviceStates.ON || state == deviceStates.STANDBY) {
            return "switch_on";
        }

        return '';
    },

    getInsightPowerStateImage: function(state) {
        if (state == deviceStates.OFF) {
            return "power_off";
        } else if (state == deviceStates.STANDBY) {
            return "power_standby";
        } else if (state == deviceStates.ON) {
            return "power_on";
        }

        return '';
    },

    getHtmlForItem: function(deviceItem, editMode, animation, sensorsTimestamp, updateIconCallback) {
    	var self = this;
    	
        return $.Deferred(function(dfd) {

        	
            var stateClass = '';
            var overlayClass = '';
            var powerStateClass = '';
            var isSensor = false;
            var showRealPowerInd = false;
            var showPowerStateBtn = false;
            var showSpinner = false;
            var showEditDots = false;
            var showEditArrow = false;
            var showStatArrow = false;
            
            var fwstatus = '';
            
            var arrayUDN = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
			if(arrayUDN)
                arrayUDN = arrayUDN.split(",");
            for (var udnDevice in arrayUDN) {
            	if(deviceItem.udn === arrayUDN[udnDevice]){
            		fwstatus = "Updating new firmware...";
                    showSpinner = true;
                    /*if (deviceItem.fwstatus) {
                        fwstatus = deviceItem.fwstatus;
                    }*/
                    console.log("get_firmware_message fwstatus is :: : " + fwstatus  + ":: deviceItem.fwstatus:: " +deviceItem.fwstatus );
            	}
            }
            
            var status = '';
            if (deviceItem.status) {
                status = deviceItem.status;
            } else {
                if (deviceItem.type == wemoDeviceType.MOTION_SENSOR || deviceItem.type == wemoSensor.REMOTE_TYPE ||
                    deviceItem.type == wemoNetCam.TYPE || deviceItem.type == wemoNetCam.REMOTE_TYPE || deviceItem.type == wemoNetCamHDv1.REMOTE_TYPE || deviceItem.type == wemoNetCamHDv2.REMOTE_TYPE || deviceItem.type == wemoLinkCam.TYPE || deviceItem.type == wemoLinkCam.REMOTE_TYPE
                ) {
                    if (deviceItem.remote) {
                        if (deviceItem.stateChangeTS != '' && parseInt(deviceItem.stateChangeTS) != 0) {
                            var sdate = getMotionSenseTimeMsg(new Date(parseInt(deviceItem.stateChangeTS) * 1000));
                            console.log("deviceObject Sensor status: " + status + " " + deviceItem.state + " " + deviceItem.stateChangeTS + " sdate: " + sdate);
                            status = sdate;
                        } else if (sensorsTimestamp != null || sensorsTimestamp != undefined) {
                            var sdate = getMotionSenseTimeMsg(new Date(sensorsTimestamp));
                            console.log("deviceObject Sensor status:" + status + " " + deviceItem.state + " " + deviceItem.stateChangeTS + " sdate: " + sdate);
                            status = sdate;
                        } else {
                            status = wemo.items['Devices_Sensor_NoMotionSensed'];
                            console.log("deviceObject Sensor status:" + status + " " + deviceItem.state + " " + deviceItem.stateChangeTS + " sdate: " + sdate);
                        }

                    } else {
                        status = wemo.items['Devices_Sensor_NoMotionSensed'];
                    }

                    isSensor = true;
                }
            }


            if (deviceItem.type == wemoDeviceType.MAKER || deviceItem.type == wemoMaker.REMOTE_TYPE || deviceItem.type == "WeMo Maker") {

                if (deviceItem.makerAttributeList != undefined) {
                    var attributelistJson;
                    if (typeof(deviceItem.makerAttributeList) == "string" && deviceItem.makerAttributeList.length > 1) {
                        attributelistJson = JSON.parse(deviceItem.makerAttributeList);
                    } else {
                        attributelistJson = deviceItem.makerAttributeList;
                    }

                    if (attributelistJson != "}") {
                        var sensorType = '0';
                        if (attributelistJson.SensorPresent != undefined)
                            sensorType = attributelistJson.SensorPresent.value;
                        if (attributelistJson.Switch != undefined)
                            deviceItem.state = attributelistJson.Switch.value;
                        else
                            deviceItem.state = "0";
                        switch (sensorType) {
                            case "1":
                                if (attributelistJson.Sensor != undefined)
                                    status = attributelistJson.Sensor.value;
                                else
                                    status = "0";
                                switch (status) {
                                    case "0":
                                        status = wemo.items['SensorClosed'];
                                        break;
                                    case "1":
                                        status = wemo.items['SensorOpen'];
                                        break;
                                    default:
                                        status = wemo.items['Sensor'] + ":" + wemo.items['Error'];
                                        break;
                                }
                                break;
                            case "0":
                                if (attributelistJson.SwitchMode != undefined)
                                    status = attributelistJson.SwitchMode.value;
                                else
                                    status = "0";
                                switch (status) {
                                    case "0":
                                        status = wemo.items['SwitchToggle'];
                                        break;
                                    case "1":
                                        status = wemo.items['SwitchMomentaryConnection'];
                                        break;
                                    default:
                                        status = wemo.items['Switch'] + ":" + wemo.items['Error'];
                                        break;
                                }
                                break;
                            default:
                                status = wemo.items['Error'];
                                break;
                        }
                    }
                }
            }
            var deviceIcon = '';
            var isLoadIconFromCloud = false;
            if (deviceItem.remote) {
                if (deviceItem.icon != null) {
                    deviceIcon = deviceItem.icon;
                } else {
                    switch (deviceItem.type) {
                        case (wemoSwitch.REMOTE_TYPE):
                            deviceIcon = wemoSwitch.ICON;
                            if (deviceItem.state != deviceStates.OFF && deviceItem.state != deviceStates.ON) {
                                overlayClass = 'disabled';
                                deviceItem.inactive = true;
                                powerStateClass = '';
                                stateClass = '';
                            }
                            break;

                        case (wemoLightSwitch.REMOTE_TYPE):
                            deviceIcon = wemoLightSwitch.ICON;
                            if (deviceItem.state != deviceStates.OFF && deviceItem.state != deviceStates.ON) {
                                overlayClass = 'disabled';
                                deviceItem.inactive = true;
                                powerStateClass = '';
                                stateClass = '';
                            }
                            break;

                        case (wemoSensor.REMOTE_TYPE):
                            deviceIcon = wemoSensor.ICON;
                            if (deviceItem.state != deviceStates.OFF && deviceItem.state != deviceStates.ON) {
                                overlayClass = 'disabled';
                                deviceItem.inactive = true;
                            }
                            break;

                        case (wemoNetCam.REMOTE_TYPE):
                            deviceIcon = wemoNetCam.ICON;
                            if (deviceItem.state != deviceStates.OFF && deviceItem.state != deviceStates.ON) {
                                overlayClass = 'disabled';
                                deviceItem.inactive = true;
                                powerStateClass = '';
                                stateClass = '';
                            }
                            break;
                        case (wemoLinkCam.REMOTE_TYPE):
                            deviceIcon = wemoLinkCam.ICON;
                            if (deviceItem.state != deviceStates.OFF && deviceItem.state != deviceStates.ON) {
                                overlayClass = 'disabled';
                                deviceItem.inactive = true;
                                powerStateClass = '';
                                stateClass = '';
                            }
                            break;

                        case (wemoInsight.REMOTE_TYPE):
                            deviceIcon = wemoInsight.ICON;
                            if (deviceItem.state != deviceStates.OFF && deviceItem.state != deviceStates.ON && deviceItem.state != deviceStates.STANDBY) {
                                overlayClass = 'disabled';
                                deviceItem.inactive = true;
                                powerStateClass = '';
                                stateClass = '';
                            }
                            break;
                        case (wemoMaker.REMOTE_TYPE):
                            deviceIcon = wemoMaker.ICON;
                            if (deviceItem.state != deviceStates.OFF && deviceItem.state != deviceStates.ON && deviceItem.state != deviceStates.STANDBY) {
                                overlayClass = 'disabled';
                                deviceItem.inactive = true;
                                powerStateClass = '';
                                stateClass = '';
                            }
                            break;
                    }
                    
                    if (isRemoteEnabled && !deviceItem.inactive) {
                        console.log("deviceObject remote deviceItem.icon: " + deviceItem.icon);
                        if (deviceItem.icon == null) {
                            isLoadIconFromCloud = true;                         
                            
                            deviceTabPlugin.execute(function(iconURL) {
                                console.log("deviceObject 1 remote default iconURL: " + iconURL);
                                if (iconURL != null && iconURL != "") {
                                    deviceIcon = iconURL;
                                    updateIconCallback(deviceItem.udn, deviceIcon);
                                    WeMoDeviceList.updateIcon(deviceItem.udn, deviceIcon);
                                }
                            }, null, actions.DEFAULT_ICON_URL, [deviceItem.udn]);
                            
                            deviceTabPlugin.execute(function(data) {
                                    console.log("deviceObject remote cloud data: " + data);
                                    if (data != '') {
                                        deviceIcon = data;
                                        updateIconCallback(deviceItem.udn, deviceIcon);
                                        WeMoDeviceList.updateIcon(deviceItem.udn, deviceIcon);
                                    } else {
                                        deviceTabPlugin.execute(function(iconURL) {
                                            console.log("deviceObject remote default iconURL: " + iconURL);
                                            if (iconURL != null && iconURL != "") {
                                                deviceIcon = iconURL;
                                                updateIconCallback(deviceItem.udn, deviceIcon);
                                                WeMoDeviceList.updateIcon(deviceItem.udn, deviceIcon);
                                            }
                                        }, null, actions.DEFAULT_ICON_URL, [deviceItem.udn]);
                                    }
                                    delete(WeMoDeviceList._deviceIconUpdate[deviceItem.mac]);
                                },
                                function(err) {
                                    WeMoDeviceList.updateIcon(deviceItem.udn, deviceIcon);
                                    console.log(deviceItem.mac + ": " + JSON.stringify(err));
                                },
                                actions.GET_ICON_FROM_CLOUD, [deviceItem.mac, deviceItem.udn, deviceItem.iconVersion]);
                        }
                    }
                }
            } else {
                deviceIcon = deviceItem.icon;
            }

            if ((!isLoadIconFromCloud) && (deviceIcon == '' || deviceIcon == null)) {
                switch (deviceItem.type) {
                    case (wemoSwitch.TYPE):
                    case (wemoSwitch.REMOTE_TYPE):
                        deviceIcon = wemoSwitch.ICON;
                        break;
                    case (wemoLightSwitch.TYPE):
                    case (wemoLightSwitch.REMOTE_TYPE):
                        deviceIcon = wemoLightSwitch.ICON;
                        break;
                    case (wemoSensor.TYPE):
                    case (wemoSensor.REMOTE_TYPE):
                        deviceIcon = wemoSensor.ICON;
                        break;
                    case (wemoNetCam.TYPE):
                    case (wemoNetCam.REMOTE_TYPE):

                        if (deviceItem.modelName == wemoNetCamHDv1.REMOTE_TYPE) {
                            deviceIcon = wemoNetCamHDv1.ICON;
                        } else if (deviceItem.modelName == wemoNetCamHDv2.REMOTE_TYPE) {
                            deviceIcon = wemoNetCamHDv2.ICON;
                        } else {
                            deviceIcon = wemoNetCam.ICON;
                        }

                        break;
                    case (wemoLinkCam.TYPE):
                    case (wemoLinkCam.REMOTE_TYPE):
                        deviceIcon = wemoLinkCam.ICON;
                        break;
                    case (wemoInsight.TYPE):
                    case (wemoInsight.REMOTE_TYPE):
                        deviceIcon = wemoInsight.ICON;
                        break;
                    case (wemoMaker.TYPE):
                    case (wemoMaker.REMOTE_TYPE):
                        deviceIcon = wemoMaker.ICON;
                        break;
                    default:
                        deviceIcon = wemoSwitch.ICON;
                }
            }

            if (deviceItem.inactive) {
                overlayClass = 'disabled';
                if (editMode) {
                    showEditDots = true;
                }
            } else {

                if (editMode) {
                    showEditDots = true;
                    showEditArrow = true;
                } else {
                    if (deviceItem.type == wemoDeviceType.INSIGHT || deviceItem.type == wemoInsight.REMOTE_TYPE) {
                        stateClass = WeMoDeviceUtils.getInsightPowerStateImage(deviceItem.state);
                        showRealPowerInd = true;
                        if (!deviceItem.cached) {
                            showStatArrow = true;
                        }
                    }

                    if (deviceItem.type == wemoDeviceType.INSIGHT || deviceItem.type == wemoInsight.REMOTE_TYPE ||
                        deviceItem.type == wemoDeviceType.SWITCH || deviceItem.type == wemoSwitch.REMOTE_TYPE ||
                        deviceItem.type == wemoLightSwitch.TYPE || deviceItem.type == wemoLightSwitch.REMOTE_TYPE ||
                        deviceItem.type == wemoDeviceType.MAKER || deviceItem.type == wemoMaker.REMOTE_TYPE
                    ) {
                        powerStateClass = WeMoDeviceUtils.getBinaryStateImage(deviceItem.state);
                        showPowerStateBtn = true;
                    }
                }
            }


            //Remove login from NetCam name
            if (wemoUtil.isCamDevice(deviceItem.type)) {
                var login = wemoUtil.extractNetCamLogin(deviceItem.name);
                if (login != null)
                    deviceItem.info = login;
                deviceItem.name = wemoUtil.extractNetCamName(deviceItem.name);
                isSensor = true;
            }

            if (deviceItem.type == wemoSensor.TYPE || deviceItem.type == wemoSensor.REMOTE_TYPE) {
                isSensor = true;
            }

            /* some times device name from cloud is null since device did not update it yet, 
             * in such cases default to default name until it is available from cloud.
             */
            if (deviceItem.name == null || deviceItem.name.length <= 0) {
                switch (deviceItem.type) {
                    case (wemoSwitch.TYPE):
                    case (wemoSwitch.REMOTE_TYPE):
                        deviceItem.name = wemo.items[wemoSwitch.NAME];
                        break;
                    case (wemoLightSwitch.TYPE):
                    case (wemoLightSwitch.REMOTE_TYPE):
                        deviceItem.name = wemo.items[wemoLightSwitch.NAME];
                        break;
                    case (wemoSensor.TYPE):
                    case (wemoSensor.REMOTE_TYPE):
                        deviceItem.name = wemo.items[wemoSensor.NAME];
                        break;
                    case (wemoNetCam.TYPE):
                    case (wemoNetCam.REMOTE_TYPE):
                        deviceItem.name = wemo.items[wemoNetCam.NAME];
                        break;
                    case (wemoLinkCam.TYPE):
                    case (wemoLinkCam.REMOTE_TYPE):
                        deviceItem.name = wemo.items[wemoLinkCam.NAME];
                        break;
                    case (wemoInsight.TYPE):
                    case (wemoInsight.REMOTE_TYPE):
                        deviceItem.name = wemo.items[wemoInsight.NAME];
                        break;
                    case (wemoMaker.TYPE):
                    case (wemoMaker.REMOTE_TYPE):
                        deviceItem.name = wemo.items[wemoMaker.NAME];
                        break;
                    default:
                        break;
                }
            }

            if (deviceItem.type != wemoDeviceType.BRIDGE) {
                var res = '<li class="device_li ' + overlayClass + '" id="' + deviceItem.udn + '" wemo-device-plugin-id="' + deviceItem.pluginid + '" wemo-device-mac-address="' + deviceItem.mac + '" wemo-device-friendly-name="' + deviceItem.name + '" wemo-device-friendly-info="' + deviceItem.info + '"' +
                    'wemo-device-type="' + deviceItem.type + '" ' +
                    'wemo-device-state="' + deviceItem.state + '" ';
                    
                    if(deviceItem.remote)
                    	{
                    	res +=  'wemo-device-firmware="' + deviceItem.fwVersion + '" ';
                    	}else
                    		{
                    		res +=  'wemo-device-firmware="' + deviceItem.firmwareVersion + '" ';
                    		}
             

                if (isSensor) {
                    res += 'wemo-sensor="true" ';
                }
                else
                {
                    res += 'wemo-sensor="false" ';
                }
                var attributeList = '';
                if(typeof(deviceItem.makerAttributeList) == "string"){
                	   attributeList = deviceItem.makerAttributeList;
            	}
            	else{
            		 attributeList = JSON.stringify(deviceItem.makerAttributeList);
            	}

                res += 'wemo-device-icon-url="' + deviceIcon + '" ' +
                    'wemo-device-cached="' + deviceItem.cached + '" ' +
                    'wemo-attribute-list="' + encodeURIComponent(attributeList) + '" ' +
                    'wemo-device-udn="' + deviceItem.udn + '">' +
                    '<span class="device_list_icon_container">' +
                    '<img wemo-device-udn="' + deviceItem.udn + '" src="' + deviceIcon + '" />' +
                    '</span>';
                res += ' <span class="device_list_friendly_name_container';

                if (showStatArrow) {
                    res += ' drawer_icon drawer_icon_closed ';
                }

                res += '"><label class="device_name">' + deviceItem.name + '</label>';
                if (!deviceItem.inactive) {
                    if (deviceItem.state == "1" && deviceItem.type != wemoMaker.REMOTE_TYPE && deviceItem.type != wemoMaker.TYPE && !deviceItem.remote)
                        res += '   <label name="sub_title" class="sensorStatus subTitle" style="color:#73d44c">' + status + '</label>';
                    else
                        res += '   <label name="sub_title" class="sensorStatus subTitle">' + status + '</label>';
                    
                    		        res += '   <label class="countDownTime subTitle" id= "countDownTimeUDN_'+deviceItem.udn+'"></label>';
                    		        
                    
                } else {
                    res += '    <label class="sub_not_detected subTitle">Not Detected</label>';
                }
                res += '   <label name="name_firmware_status" class="sensorStatus subTitle" >' + fwstatus + '</label>' + '  </span>';

                res += '    <span class="power_indicator_container">';

                if (showEditDots) {
                    res += '       <span class="edit_device_dots"></span>';
                }
                if (showEditArrow) {
                    res += '        <span class="edit_device_arrow_icon"></span>';
                }

                if (showRealPowerInd) {
                    res += '      <span name="name_device_state" wemo-device-state="' + deviceItem.state + '"' +
                        '      class="power_indicator ' + stateClass + '"></span>';
                }
                if(showSpinner){
                	 res += '<span class="loading_animation" wemo-device-udn="' + deviceItem.udn + '"></span>';
                }else{
                if (showPowerStateBtn) {
                    if (animation) {
                        if (deviceItem.type == wemoDeviceType.INSIGHT || deviceItem.type == wemoInsight.REMOTE_TYPE ||
                            deviceItem.type == wemoDeviceType.SWITCH || deviceItem.type == wemoSwitch.REMOTE_TYPE ||
                            deviceItem.type == wemoLightSwitch.TYPE || deviceItem.type == wemoLightSwitch.REMOTE_TYPE ||
                            deviceItem.type == wemoDeviceType.MAKER || deviceItem.type == wemoMaker.REMOTE_TYPE) {
                            if (powerStateClass == 'switch_on') {

                                res += '<span class="loading_animation animatedHelperOn" wemo-device-udn="' + deviceItem.udn + '"></span>';
                            } else {
                                res += '<span class="loading_animation animatedHelperOff" wemo-device-udn="' + deviceItem.udn + '"></span>';
                            }
                        } else {
                            res += '<span class="loading_animation" wemo-device-udn="' + deviceItem.udn + '"></span>';
                        }
                    } else {
                        res += '       <span name="name_power_state" wemo-device-udn="' + deviceItem.udn + '" wemo-device-state="' + deviceItem.state + '"' +
                            '      class="device_state ' + powerStateClass + '"></span>';
                    }
                } else {
                    if (animation) {
                        res += '<span class="loading_animation" wemo-device-udn="' + deviceItem.udn + '"></span>';
                    }
                }
                }
                res += '   </span>';
                res += ' </li>';

                if (!smartDevice[deviceItem.udn]) {
                    window.devicelistEvents.emit('deviceAdded', {
                        device: deviceItem,
                        listItem: $(res),
                        callback: function($listItem, isSmartDevice) {
                            smartDevice[deviceItem.udn] = {};
                            if (isSmartDevice) {
                                smartDevice[deviceItem.udn].el = $listItem;
                                smartDevice[deviceItem.udn].isSmartDevice = true;
                                smartDevice[deviceItem.udn].order = deviceItem.order;
                            }
                            dfd.resolve({
                                'el': $listItem,
                                'isSmartDevice': isSmartDevice,
                                'order': deviceItem.order
                            });

                            /**
                             This code is the fix for WEMO-21978, WEMO-22610, WEMO-22894, WEMO-23940
                             Based on observation when the SlowCooker is in the device list, QA has observed an gap between first tile and header.
                             And some times first tile was going inside the header.
                            **/

                            $('.device_container').offset({
                                top: ($('#header_id').outerHeight(true))
                            });
                            //alert('Device Container:  '+$('.device_container').offset().top);
                            if (deviceItem.udn.match(/crockpot/gi) || deviceItem.udn.match(/Crockpot/gi)) {
                                //alert('This Smart Device Is Crock-Pot');
                                removeGapFromTopDeviceListAfterCrockPotAdded(true);
                            }
                        }
                    });

                } else {
                    if (smartDevice[deviceItem.udn].el) {
                        smartDevice[deviceItem.udn].order = deviceItem.order;
                        updateIconCallback(deviceItem.udn, deviceIcon);
                        dfd.resolve(smartDevice[deviceItem.udn]);

                    } else {
                        dfd.resolve({
                            'el': $(res),
                            'isSmartDevice': false,
                            'order': deviceItem.order
                        });
                    }
                }
                
                var friendly_name_container_width = wemoUtil.getScreenWidth() - 180;
                $(".device_list_friendly_name_container").css('width', friendly_name_container_width + 'px');
            }
//          self.countLoop(countDownTime);
        }).promise();

    },
    
    onFirmwareLedUpgrade: function(firmwareStatus) {
    	console.log('get_firmware_message, got: ' + firmwareStatus);
        var message = JSON.parse(firmwareStatus);
    	console.log('get_firmware_message :: message.state is:' +  message.state + " :: message.udn is ::" + message.ledDeviceId);
        //tmpDevice = WeMoDeviceList.getDevice(message.udn);
    	
        var msg ="";
        
        if(message.eventType == "FWUpdateStatus")
        {
        	console.log("message.eventType if"+message.eventType);

        	if (message.state == firmwareMessagingEnum.ZERO) {
                msg = wemo.items['FirmwareMsgDownload'];
            } else if (message.state == firmwareMessagingEnum.ONE) {
                msg = wemo.items['FirmwareMsgDownloadSuccess'];
            } else if (message.state == firmwareMessagingEnum.TWO) {
                msg = wemo.items['FirmwareMsgDownloadFailed'];
            } else if (message.state == firmwareMessagingEnum.THREE) {
                msg = wemo.items['FirmwareMsgUpgrading'];
            } else if (message.state == firmwareMessagingEnum.FOUR) {
                msg = wemo.items['FirmwareMsgUpgraded'];
            } else if (message.state == firmwareMessagingEnum.FIVE) {
                msg = wemo.items['FirmwareMsgUpgraded'];
            } else if (message.state == firmwareMessagingEnum.SIX) {
                msg = wemo.items['FirmwareMsgUpgradeFail'];
            }
        }
        else
        {
        	if (message.state > 0 || message.state <= 100) {
        		console.log("message.eventType else"+message.eventType);
        		msg = wemo.items['FirmwareMsgUpgrading'];
        	}
        }
        
        if(msg != "")
        {
        	window.sessionStorage.setItem(sessionStore.IS_UPGRADE_INPROGRESS, "true");
        	window.sessionStorage.setItem(sessionStore.CHECK_FIRMWARE_UPGRADE_REQUIRED, "true");
        }
        
        if (message) {
        	var firmwareMsgArr = [];
        	console.log("Firmware Noticfication "+message.listen);
        	
        	console.log("FW <> Check Firm Ware STARTED Successfully");
        	var firmwareUpgradeData = window.sessionStorage.getItem(sessionStore.FIRMWARE_UPDATE_DATA);
            console.log("FW <>  firmwareUpgradeData::  "+firmwareUpgradeData + " :: updatedDevicesCount ::" + updatedDevicesCount);
        	firmwareUpgradeData = JSON.parse(firmwareUpgradeData);
        	
        	if (message.listen == "get_led_firmware_status") {
        		console.log("Firmware Noticfication Enter "+message.listen);
        		var groupLeddevice = window.sessionStorage.getItem(sessionStore.LED_DRAWER_GROUP_LIST);
        		
        		if(groupLeddevice != undefined && groupLeddevice != "")
        			groupLeddevice = groupLeddevice.split(",");
        		
        		if(jQuery.inArray(message.ledDeviceId, groupLeddevice) == -1)
        		{
        			console.log("entering in device "+message.ledDeviceId+"--"+msg);
        			
        			if(msg.indexOf(wemo.items['FirmwareMsgUpgrading']) != -1 || msg.indexOf(wemo.items['FirmwareMsgInstalling']) != -1)
        			{
        				$("#"+message.ledDeviceId).removeClass();
        				$("#"+message.ledDeviceId).addClass('led_value_loading');
        			}
        			else
        			{
        				var currState = $("#"+message.ledDeviceId).attr('wemo-device-state-code');
        				$("#"+message.ledDeviceId).removeClass();
        				
        				if(currState == 1)
        					$("#"+message.ledDeviceId).addClass('led_on');
        				else if(currState == 0)
        					$("#"+message.ledDeviceId).addClass('led_off');
        				else
        					$("#"+message.ledDeviceId).addClass('led_on');
        				
        			}
        			
        			$("ul li[data-deviceid=" + message.ledDeviceId + "]").find(".sliderValue").text(msg);
        			$("ul li[data-deviceid=" + message.ledDeviceId + "]").find('.sliderValue').addClass('firmwareMsg');
        			$("ul li[data-deviceid=" + message.ledDeviceId + "]").find('.iconType').hide();
        			
        			firmwareMsgArr.push(message.ledDeviceId+"::"+msg);
        			window.sessionStorage.setItem(sessionStore.LED_FIRMWARE_MESSAGING,firmwareMsgArr);
        			
        		}
        			
        		else
        		{
        			
        			var groupDeviceInfo = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_GROUP_INFO);
        			var groupId = ""; 
        			
        			if(groupDeviceInfo != undefined && groupDeviceInfo != "")
                    {
                        for(var i=0; i<groupDeviceInfo.length; i++)
                        {
                        	var grpdevArr = (groupDeviceInfo[i].deviceid).split(",");
                        	
                        	if(jQuery.inArray(message.ledDeviceId, grpdevArr) == -1)
                        		groupId = groupDeviceInfo[i].groupid;

                        }

                    }
        			
        			console.log("Firmware Noticfication else "+message.ledDeviceId+"---"+groupLeddevice+"--"+JSON.stringify(groupLeddevice));
        			
        			if(msg.indexOf(wemo.items['FirmwareMsgUpgrading']) != -1 || msg.indexOf(wemo.items['FirmwareMsgInstalling']) != -1)
        			{
        				$("#"+groupId).removeClass();
        				$("#"+groupId).addClass('led_value_loading');
        			}
        			else
        			{
        				var currState = $("#"+message.ledDeviceId).attr('wemo-device-state-code');
        				$("#"+groupId).removeClass();
        				
        				if(currState == 1)
        					$("#"+groupId).addClass('led_on');
        				else if(currState == 0)
        					$("#"+groupId).addClass('led_off');
        				else
        					$("#"+groupId).addClass('led_on');
        				
        			}
        			
        			$("ul li[data-deviceid=" + groupId + "]").find(".sliderValue").text(msg);
        			$("ul li[data-deviceid=" + groupId + "]").find('.sliderValue').addClass('firmwareMsg');
        			$("ul li[data-deviceid=" + groupId+ "]").find('.iconType').hide();
        			
        			firmwareMsgArr.push(groupId+"::"+msg);
        			window.sessionStorage.setItem(sessionStore.LED_FIRMWARE_MESSAGING,firmwareMsgArr);
        			
        		}
        		

        		if(message.state == firmwareMessagingEnum.FOUR && message.eventType == "FWUpdateStatus")
        		{
        			console.log("FW <>  firmware is Updated");
					var arrayUDN = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
					if(arrayUDN)
                        arrayUDN = arrayUDN.split(",");
		            for (var udnDevice in arrayUDN) {
		            	if(message.ledDeviceId === arrayUDN[udnDevice])
		                  	arrayUDN.splice(udnDevice,1);
		            }
					window.sessionStorage.setItem(sessionStore.DEVICE_LIST_UPDATE,arrayUDN);
					
					if(firmwareUpgradeData != "" && firmwareUpgradeData != undefined)
					{
						delete firmwareUpgradeData[message.ledDeviceId];
						window.sessionStorage.setItem(sessionStore.FIRMWARE_UPDATE_DATA, JSON.stringify(firmwareUpgradeData));
					}
					
					window.sessionStorage.removeItem(sessionStore.LED_FIRMWARE_MESSAGING);
					isFWFound = true;
					updatedDevicesCount++;
					
        		}else if(message.state == firmwareMessagingEnum.SIX && message.eventType == "FWUpdateStatus"){
        			console.log("FW <>  firmware is not Updated");
					var arrayUDN = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
					if(arrayUDN)
                        arrayUDN = arrayUDN.split(",");
		            for (var udnDevice in arrayUDN) {
		            	if(message.ledDeviceId === arrayUDN[udnDevice])
		                  	arrayUDN.splice(udnDevice,1);
		            }
					window.sessionStorage.setItem(sessionStore.DEVICE_LIST_UPDATE,arrayUDN);
					
					if(firmwareUpgradeData != "" && firmwareUpgradeData != undefined)
					{
						delete firmwareUpgradeData[message.ledDeviceId];
						window.sessionStorage.setItem(sessionStore.FIRMWARE_UPDATE_DATA, JSON.stringify(firmwareUpgradeData));
					}
					
					window.sessionStorage.removeItem(sessionStore.LED_FIRMWARE_MESSAGING);
					isFWFound = true;
					updatedDevicesCount++;
					
				}
        		
        	}
        	
        	var currentDeviceListUpdate = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
        	if (firmwareUpgradeData != null && firmwareUpgradeData != undefined) {
             	$.each(firmwareUpgradeData, function(udn, obj1) {
         			if (currentDeviceListUpdate.indexOf(udn) == -1) {
         				delete firmwareUpgradeData[udn];
         			}
         		});
         	}

        	var checkCount = 0;
            if (firmwareUpgradeData != null && firmwareUpgradeData != undefined) {
             	$.each(firmwareUpgradeData, function(udn, obj1) {
         			checkCount++;
         		});
         	}
        
            if (checkCount == 0) {
             	setTimeout(function() {
         			console.log("FW <>  is empty:  "+checkCount);
         			window.sessionStorage.setItem(sessionStore.FIRMWARE_AVAILABLE, false);
     				$('#new_fw_available').hide();
     	            $('#more_new_firmware').addClass('none');
     	            window.sessionStorage.removeItem(sessionStore.LED_DEVICE_FIRMWARE_ARRAY);
     	      	},1000);
            }
        }
    },
    onFirmwareUpgrade: function(firmwareStatus) {
    	console.log('get_firmware_message, got: ' + firmwareStatus);
        var message = JSON.parse(firmwareStatus);
    	console.log('get_firmware_message :: message.state is:' +  message.state + " :: message.udn is ::" + message.udn);
        tmpDevice = WeMoDeviceList.getDevice(message.udn);
        
        var msg ="";
        
        if (message.state == firmwareMessagingEnum.ZERO) {
            msg = wemo.items['FirmwareMsgDownload'];
        } else if (message.state == firmwareMessagingEnum.ONE) {
            msg = wemo.items['FirmwareMsgDownloadSuccess'];
        } else if (message.state == firmwareMessagingEnum.TWO) {
            msg = wemo.items['FirmwareMsgDownloadFailed'];
        } else if (message.state == firmwareMessagingEnum.THREE) {
            msg = wemo.items['FirmwareMsgUpgrading'];
        } else if (message.state == firmwareMessagingEnum.FOUR) {
            msg = wemo.items['FirmwareMsgUpgraded'];
        } else if (message.state == firmwareMessagingEnum.FIVE) {
            msg = wemo.items['FirmwareMsgUpgraded'];
        } else if (message.state == firmwareMessagingEnum.SIX) {
            msg = wemo.items['FirmwareMsgUpgradeFail'];
        }

        if(msg != "")
        {
        	window.sessionStorage.setItem(sessionStore.IS_UPGRADE_INPROGRESS, "true");
        	window.sessionStorage.setItem(sessionStore.CHECK_FIRMWARE_UPGRADE_REQUIRED, "true");
        }
        	
        //tmpDevice.fwstatus = msg;
        //device_list.renderDeviceList();
        
        var firmwareUpgradeData = window.sessionStorage.getItem(sessionStore.FIRMWARE_UPDATE_DATA);
        console.log("FW <>  firmwareUpgradeData::  "+firmwareUpgradeData + " :: updatedDevicesCount ::" + updatedDevicesCount);
    	firmwareUpgradeData = JSON.parse(firmwareUpgradeData);
        
        if((message.udn).indexOf('Bridge') != -1)
        {
        	//tmpDevice.fwstatus = message.state;
        	var firmwareMsgArr = [];
        	
        	if(msg.indexOf(wemo.items['FirmwareMsgUpgrading']) != -1 || msg.indexOf(wemo.items['FirmwareMsgInstalling']) != -1)
        	{
        		$("ul li[data-category='bridge']").each(function() {
                    
        			var itemid = $(this).attr('id');
        			
        			console.log("entering in bridge fimrware status if enter::"+itemid);
        			
        			$("[name='name_group_state']").removeClass().addClass('led_value_loading');
                    $("[name='name_led_device_state']").removeClass().addClass('led_value_loading');
        		});
        	}
        	else
        	{
        		console.log("entering in bridge fimrware status else::"+msg);
        		
        		$("ul li[data-category='bridge']").each(function() {
                    
        			var itemid = $(this).attr('id');
                    var liname = $(this).attr('name');
                    
                    console.log("liname "+liname);
                    
                    if (liname == "switch_li") {
                    	
                    	var inneritem = $(this).find('span[name="name_led_device_state"]');
                        var currID = inneritem.attr('id');
                    	var currState = $("#"+currID).attr('wemo-device-state-code');
                        console.log("entering in bridge fimrware status else:: "+currState+"--"+inneritem+"---"+currID);
                        
                        $("#"+currID).removeClass();
                        
        				if(currState == 1)
        					$("#"+currID).addClass('led_on');
        				else if(currState == 0)
        					$("#"+currID).addClass('led_off');
        				else
        					$("#"+currID).addClass('led_on');
        				
        				firmwareMsgArr.push(currID+"::"+msg);
            			window.sessionStorage.setItem(sessionStore.LED_FIRMWARE_MESSAGING,firmwareMsgArr);
                    	
                    }else if(liname == "group_li"){
                    	var inneritem = $(this).find('span[name="name_group_state"]');
                        var currID = inneritem.attr('id');
                    	var currState = $("#"+currID).attr('wemo-device-state-code');
                        console.log("entering in bridge fimrware status else:: "+currState+"--"+inneritem+"---"+currID);
                        
                        $("#"+currID).removeClass();
                        
        				if(currState == 1)
        					$("#"+currID).addClass('led_on');
        				else if(currState == 0)
        					$("#"+currID).addClass('led_off');
        				else
        					$("#"+currID).addClass('led_on');
        				
        				
        				firmwareMsgArr.push(currID+"::"+msg);
            			window.sessionStorage.setItem(sessionStore.LED_FIRMWARE_MESSAGING,firmwareMsgArr);
            	
                    }
                    
                    

        		});
        		
        		
        		
        	}
        		
        	$("ul li[data-category='bridge']").find('.sliderValue').text(msg);
    		$("ul li[data-category='bridge']").find('.sliderValue').addClass('firmwareMsg');
    		$("ul li[data-category='bridge']").find('.iconType').hide();
        	
        }
        
        
        if(message.state == firmwareMessagingEnum.FOUR)
		{
        	$("ul li[data-category='bridge']").find('.sliderValue').removeClass('firmwareMsg');
			console.log("FW <>  firmware is Updated");
			var arrayUDN = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
			if(arrayUDN)
                arrayUDN = arrayUDN.split(",");
            for (var udnDevice in arrayUDN) {
            	if(message.udn === arrayUDN[udnDevice])
                  	arrayUDN.splice(udnDevice,1);
            }
			window.sessionStorage.setItem(sessionStore.DEVICE_LIST_UPDATE,arrayUDN);
			window.sessionStorage.removeItem(sessionStore.LED_FIRMWARE_MESSAGING);
			
			if(firmwareUpgradeData != "" && firmwareUpgradeData != undefined)
			{
				delete firmwareUpgradeData[message.udn];
				window.sessionStorage.setItem(sessionStore.FIRMWARE_UPDATE_DATA, JSON.stringify(firmwareUpgradeData));
			}
			
			isFWFound = true;
			updatedDevicesCount++;
			
			if((message.udn).indexOf('Bridge') != -1)
            {
            	$("ul li[data-category='bridge']").each(function() {
                    
        			var itemid = $(this).attr('id');
        			console.log("entering in bridge fimrware status if removeDevice::"+itemid);
        			
        			$("#" + itemid).remove('disabled');
        			var liname = $(this).attr('name');
                    
                    console.log("liname removeDevice"+liname);
                    
                    if (liname == "switch_li") {
                    	$("#" + itemid).addClass('led_list');
                    	var inneritem = $(this).find('span[name="name_led_device_state"]');
                        var currID = inneritem.attr('id');
                        var currState = $("#"+currID).attr('wemo-device-state-code');
                        
                        if(currState == 1)
        					$("#"+currID).addClass('led_on');
        				else if(currState == 0)
        					$("#"+currID).addClass('led_off');
        				else
        					$("#"+currID).addClass('led_on');
                        
                    }
                    else if(liname == "group_li"){
                    	$("#" + itemid).addClass('led_group');
                    	var inneritem = $(this).find('span[name="name_group_state"]');
                        var currID = inneritem.attr('id');
                        var currState = $("#"+currID).attr('wemo-device-state-code');
                        
                        if(currState == 1)
        					$("#"+currID).addClass('led_on');
        				else if(currState == 0)
        					$("#"+currID).addClass('led_off');
        				else
        					$("#"+currID).addClass('led_on');
                    }
                    
        			$("#" + itemid).find('.NotDetected').text('');
                	$("#bridgeunavailable").hide();
        			
        		});
            	
            }
			
		}else if(message.state == firmwareMessagingEnum.FIVE)
		{
        	$("ul li[data-category='bridge']").find('.sliderValue').removeClass('firmwareMsg');
			console.log("FW <>  firmware is Updated");
			var arrayUDN = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
			if(arrayUDN)
                arrayUDN = arrayUDN.split(",");
            for (var udnDevice in arrayUDN) {
            	if(message.udn === arrayUDN[udnDevice])
                  	arrayUDN.splice(udnDevice,1);
            }
			window.sessionStorage.setItem(sessionStore.DEVICE_LIST_UPDATE,arrayUDN);
			window.sessionStorage.removeItem(sessionStore.LED_FIRMWARE_MESSAGING);
			
			if(firmwareUpgradeData != "" && firmwareUpgradeData != undefined)
			{
				delete firmwareUpgradeData[message.udn];
				window.sessionStorage.setItem(sessionStore.FIRMWARE_UPDATE_DATA, JSON.stringify(firmwareUpgradeData));
			}
			
			isFWFound = true;
			updatedDevicesCount++;
			
			if((message.udn).indexOf('Bridge') != -1)
            {
            	$("ul li[data-category='bridge']").each(function() {
                    
        			var itemid = $(this).attr('id');
        			console.log("entering in bridge fimrware status if removeDevice::"+itemid);
        			
        			$("#" + itemid).removeClass('led_group');
        			$("#" + itemid).removeClass('led_list');
        			$("#" + itemid).addClass('disabled');
        			
        			var liname = $(this).attr('name');
                    
                    console.log("liname removeDevice"+liname);
                    
                    if (liname == "switch_li") {
                    	var inneritem = $(this).find('span[name="name_led_device_state"]');
                        var currID = inneritem.attr('id');
                        $("#"+currID).removeClass();
                        
                    }
                    else if(liname == "group_li"){
                    	var inneritem = $(this).find('span[name="name_group_state"]');
                        var currID = inneritem.attr('id');
                        $("#"+currID).removeClass();
                    }
                    
        			$("#" + itemid).find('.NotDetected').text(wemo.items['LEDBulb_Unavailable_Messgage']);
        			$("#" + itemid).find('.NotDetected').show();
                	$(".bridge_unavailable_text").html(wemo.items['updatingWeMoLinkTitle']);
                	$(".font-detail").html(wemo.items['updatingWeMoLinkDesc']);
                	$("#bridgeunavailable").show();
        			
        		});
            	
            }
			
		}else if(message.state == firmwareMessagingEnum.SIX){
			$("ul li[data-category='bridge']").find('.sliderValue').removeClass('firmwareMsg');
			console.log("FW <>  firmware is not Updated");
			var arrayUDN = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
			if(arrayUDN)
                arrayUDN = arrayUDN.split(",");
            for (var udnDevice in arrayUDN) {
            	if(message.udn === arrayUDN[udnDevice])
                  	arrayUDN.splice(udnDevice,1);
            }
			window.sessionStorage.setItem(sessionStore.DEVICE_LIST_UPDATE,arrayUDN);
			window.sessionStorage.removeItem(sessionStore.LED_FIRMWARE_MESSAGING);
			
			if(firmwareUpgradeData != "" && firmwareUpgradeData != undefined)
			{
				delete firmwareUpgradeData[message.udn];
				window.sessionStorage.setItem(sessionStore.FIRMWARE_UPDATE_DATA, JSON.stringify(firmwareUpgradeData));
			}
				
			isFWFound = true;
			updatedDevicesCount++;
			
		}
        
        var checkCount = 0;
        if (firmwareUpgradeData != null && firmwareUpgradeData != undefined) {
        	$.each(firmwareUpgradeData, function(udn, obj1) {
    			checkCount++;
    		});
    	}
   
        if (checkCount == 0) {
        	setTimeout(function() {
    			console.log("FW <>  is empty:  "+checkCount);
				$('#new_fw_available').hide();
	            $('#more_new_firmware').addClass('none');
	    	},1000);
        }
    }
};

WeMoDevice.prototype = {};
WeMoDeviceRemote.prototype = {};

if (window.devicelistEvents) {
    window.devicelistEvents.on('packageLoaded', function(options) {
        DEBUG && console.log('PACKAGE LOADED');
        _.extend(smartDevice[options.udn], options);
    });
}

function getMotionSenseTimeMsg(tdate) {
    MMDD = new Date();
    MMDD.setDate(tdate.getDate());
    MMDD.setHours(0, 0, 0, 0);

    var months = ["Jan", "Feb", "Mar", "Apr", "May", "June", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    var strDate = "";
    var day = MMDD.getDate();
    var month = months[MMDD.getMonth()];

    var today = new Date();
    today.setHours(0, 0, 0, 0);

    var yesterday = new Date();
    yesterday.setHours(0, 0, 0, 0);
    yesterday.setDate(yesterday.getDate() - 1);

    var tomorrow = new Date();
    tomorrow.setHours(0, 0, 0, 0);
    tomorrow.setDate(tomorrow.getDate() + 1);

    console.log(MMDD.getTime(), today.getTime(), MMDD.getTime() == today.getTime());

    if (today.getTime() == MMDD.getTime()) {
        var temparr = wemo.items['Devices_Remote_MotionSensed'].split("%@");
        strDate = temparr[0] + " " + DateFormat.format.date(tdate, "h:mm a") + " " + (temparr[1] ? temparr[1] : "");

    } else if (yesterday.getTime() == MMDD.getTime()) {
        var temparr = wemo.items['Devices_Remote_MotionSensedYesterday'].split("%@");
        strDate = temparr[0] + " " + DateFormat.format.date(tdate, "h:mm a") + " " + (temparr[1] ? temparr[1] : "")
    } else {
        //strDate = DateFormat.format.date(tdate, "MMM d h:mm a");//"other";
        var temparr = wemo.items['Devices_Remote_MotionSensed'].split("%@");
        strDate = temparr[0] + " " + DateFormat.format.date(tdate, "MMM d h:mm a") + " " + (temparr[1] ? temparr[1] : "")
    }
    return strDate;
}

