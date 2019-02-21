/*
 rule_details.js

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

var TAG = "rule_details.js: ";
var isFWSupported;
var isMakerSensorFWSupported;
var makerDevices;
var UP_TF_IS24 = false;//UP-user preferences, TF-time format
var allSensorImage = [];
var _ledDeviceCache = [];
var isKeychainPresenseRule = false;
var isKeychainButtonRule = false;
var hasPIRSensorInRule = false;
var conflictInRules = false;

$(document).bind('pageinit', function () {
    rule_details.initialize();
});

function complementAction(x) {
    x = parseInt(x);
    if (x == 1) return 0;
    else if (x == 0) return 1;
    else if (x == 2) return 2;
}


//Get friendly names for devices(switches and sensors)
var av_switches = {},
    av_sensors = {},
    av_nests = {},
    av_makers = {},
    av_leddevices = {},
    homesense_sensors = {},
    devices = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SFW_DEVICE_LIST);


var rule_details = {

    initialize : function() {
        console.log(TAG + "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    reportError: function (e) {
        console.log(TAG + "Plugin Failure Call back!!!!   " + e);
    },


    onDeviceReady : function() {
        console.log(TAG + "onDeviceReady my rule");
        UP_TF_IS24 = wemoUtil.userPreferences.getTimeFormat();
        nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, []);

        if (window.sessionStorage.getItem("led_device_length") == "1"){
        	$("#find_and_pair_Newdevice").show();
        }else $("#find_and_pair_Newdevice").hide();
        wemoUtil.setTimeFormat();
        rule_details.bindEvents();

        //Clone DB before doing anyactions to avoid pushDB fail
        wemoUtil.cloneDB();

        if(!window.sessionStorage.getItem(sessionStore.FIRMWARE_AVAILABLE)){
            console.log(" #more_new_firmware display none");
            $('#more_new_firmware').addClass('none');
		}

        //To return back to home page: device list tab
        $(".back_btn").on("tap", function(e) {
           wemoUtil.loadUrl(filePath.ENABLED_RULES);
        });

        //For Rules Support Link
        $("#support_link").on('click', function(){

            if (!isRemoteEnabled) {
                deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
            }
            window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Help_Rules_Creation_Url']);
           window.open(wemo.items['ruleHelpCenter'], "_system");
        });
        
        //Rule Duplicate Popup
    	$("#rule_duplicate_learn_more_btn").on("click", function () {
        	if (!isRemoteEnabled) {
            	deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
        	}
        	window.open(wemo.items['Help_Rules_Alert_Url'], "_system");
        	$("#rule_duplicate").popup("close");
    	});

    	$("#rule_duplicate_ok_btn").on("click", function () {
        	$("#rule_duplicate").popup("close");
        	$("#RuleDuplicateText").html("");
    	});
    
    	//Rule Conflicit Popup
    	$("#learn_more_btn").on("click", function () {
        	if (!isRemoteEnabled) {
            	deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
        	}
        	window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Help_Rules_Alert_Url']);
        	window.open(wemo.items['ruleHelpCenter'], "_system");
        	$("#rule_conflict").popup("close");
    	});
    	$("#ok_btn").on("click", function () {
        	$("#rule_conflict").popup("close");
        	$("#RuleConflictSimpleAndTimer").html("");
    	});

        var networktype = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_NETWORKTYPE);
        var remoteEnable = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_ENABLE);
        var deleteRule = false;

        sharedPreferences.get(sharedPreferencesConstants.WEMO_NAMESPACE, sharedPreferencesConstants.WEMO_LED_DEVICE_CACHE, '', function (value) {
			console.log("Rules Screen cache get value: "+value);
			
			if (value != null && value.length > 0) {
                arrCache = JSON.parse(value);
                _ledDeviceCache = arrCache;
                console.log("Rules Details cache arrCache : " + JSON.stringify(arrCache));
                //device_list_bridge.ledDeviceRendering(arrCache, "initialCache");
            }
			
        });

        console.log("networktype "+networktype+"---"+remoteEnable);

        if (networktype == networkType.HOME_NETWORK || networktype == null) {

            console.log("Local Mode...");

            $.each(devices,function(udn){
                wemoUtil.infoLog(TAG, "udn: " +udn+" friendly name "+ devices[udn].friendlyName);
                var uuid = udn;
                var fname = devices[udn].friendlyName,
                    iconURL = devices[udn].icon;
                    grouIconUrl = devices[udn].grouIconUrl;
                if ( uuid.indexOf("uuid:Socket") !== -1 || uuid.indexOf("uuid:Insight") !== -1
                    || uuid.indexOf("uuid:Lightswitch") !== -1 || uuid.indexOf("uuid:Dimmer") !== -1 ) {
                         av_switches['"'+uuid+'"'] = fname;
                     }
                if (uuid.indexOf("uuid:Maker") != -1) {
                	makerDevices =  devices[udn];
                	av_makers['"'+uuid+'"']={
                            name:fname,
                            SensorPresent:devices[udn].SensorPresent
                	    } ;
                } else if (uuid.indexOf("uuid:Sensor") != -1 || uuid.indexOf("uuid:NetCam") != -1) {
                        av_sensors['"'+uuid+'"'] = fname;

                        deviceTabPlugin.execute(function(iconURL) {
                        console.log('allSensorImg >>>>> '+iconURL);
                        allSensorImage['"'+uuid+'"'] = iconURL;
                    }, null, actions.DEFAULT_ICON_URL, [udn]);
                }else if (devices[udn].information.productType === "NestThermostat") {
                     av_nests['"' + uuid + '"'] = {
                         fname: fname,
                         parentName: devices[udn].information.parentName
                     };
                }
            });
  
            // LED Code
            $.Deferred(function(dfd) { 
                deviceTabPlugin.execute(
                    function(params) {
                    	$.each(params,function(inx){ 
        	                var key = params[inx].udn;
        	                var value = params[inx].friendlyName;
        	                av_leddevices[key]=value;
        	            }); 
        	            rule_details.deviceListBorder();
                        dfd.resolve(devices);
                    },
                    function(err) {
                        dfd.reject(err);
                    },
                    actions.SELECT_LED_DEVICES, []
                );
            }).promise();
               
        }else if (networktype==networkType.REMOTE_WIFI || networktype == networkType.REMOTE_MOBILE || remoteEnable == true){
            if(remoteEnable){
                var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
                var arrayDimmerObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DIMMER_DATA);
                var arraySensorObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SENSOR_DATA);
                var arrayInsightObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA);
                var arrayMakerObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA);
                var arrayLedDeviceObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_DATA);
                var arrayNestDeviceObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.NEST_DATA);


                console.log("arrayLedDeviceObjects***"+ JSON.stringify(arrayLedDeviceObjects));

                if(arrayInsightObjects.length > 0){
                    if(arraySwitchObjects.length == 0){
                        arraySwitchObjects = arrayInsightObjects;
                    }
                    else{
                        arraySwitchObjects = arraySwitchObjects.concat(arrayInsightObjects);
                    }
                }

                if(arraySwitchObjects.length>0){
                    $.each(arraySwitchObjects,function(inx){
                        console.log(TAG +"Remote av_switches: " + arraySwitchObjects[inx][key.DEVICE_UDN]+" "+arraySwitchObjects[inx][key.DEVICE_FRIENDLY_NAME]);
                        av_switches['"'+arraySwitchObjects[inx][key.DEVICE_UDN]+'"'] = arraySwitchObjects[inx][key.DEVICE_FRIENDLY_NAME];
                    });
                    rule_details.deviceListBorder();
                }
                else console.log("No switches detected");

                 if (arraySensorObjects.length > 0) {
                    $.each(arrayDimmerObjects,function(inx){
                        console.log(TAG +"Remote av_switches: " + arrayDimmerObjects[inx][key.DEVICE_UDN]+" "+arrayDimmerObjects[inx][key.DEVICE_FRIENDLY_NAME]);
                        av_switches['"'+arrayDimmerObjects[inx][key.DEVICE_UDN]+'"'] = arrayDimmerObjects[inx][key.DEVICE_FRIENDLY_NAME];
                    });
                    rule_details.deviceListBorder();
                }

                if(arraySensorObjects.length>0){
                    $.each(arraySensorObjects,function(inx){
                    	
                       // av_sensors['modelCode'] = arraySensorObjects[inx].type;
                    	console.log('allSensorImg >>>>> '+JSON.stringify(arraySensorObjects));
                    		
//                        if (arraySensorObjects[inx].type == "NetCamHDv2" || arraySensorObjects[inx].type == "NetCamHDv1") {
                            allSensorImage['"' + arraySensorObjects[inx].udn + '"'] = "../img/ic_netcam_HD.png";
//                        }
//                        else {
//                            allSensorImage['"' + arraySensorObjects[inx].udn + '"'] = "../img/ic_netcam_nobg@2x.png";
//                        }


                        console.log(TAG +"Remote av_sensors: " + arraySensorObjects[inx][key.DEVICE_UDN]+" "+arraySensorObjects[inx][key.DEVICE_FRIENDLY_NAME]);
                        if(arraySensorObjects[inx][key.DEVICE_UDN].match(/NetCam/) && arraySensorObjects[inx][key.DEVICE_FRIENDLY_NAME].indexOf(',') != -1 ){
                        	av_sensors['"'+arraySensorObjects[inx][key.DEVICE_UDN]+'"']=wemoUtil.extractNetCamName(arraySensorObjects[inx][key.DEVICE_FRIENDLY_NAME]);
                        }else{
                            av_sensors['"'+arraySensorObjects[inx][key.DEVICE_UDN]+'"']=arraySensorObjects[inx][key.DEVICE_FRIENDLY_NAME];
                        }
                    });

                    rule_details.deviceListBorder();
                }
                else console.log("No Sensors detected");
                if(arrayMakerObjects.length>0){
                	$.each(arrayMakerObjects,function(inx){
                		console.log(TAG +"Remote av_makers: " + arrayMakerObjects[inx][key.DEVICE_UDN]+" "+arrayMakerObjects[inx][key.DEVICE_FRIENDLY_NAME]);
                		if(arrayMakerObjects[inx][key.DEVICE_UDN].match(/NetCam/)){
                			av_makers['"'+arrayMakerObjects[inx][key.DEVICE_UDN]+'"']=wemoUtil.extractNetCamName(arrayMakerObjects[inx][key.DEVICE_FRIENDLY_NAME]);
                		}else{
                			av_makers['"'+arrayMakerObjects[inx][key.DEVICE_UDN]+'"']={name:arrayMakerObjects[inx][key.DEVICE_FRIENDLY_NAME], SensorPresent:arrayMakerObjects[inx][key.MAKER_SENSORPRESENT]};
                		}
                	});
                	rule_details.deviceListBorder();
                }
                else console.log("No Maker is  detected");

                if (arrayNestDeviceObjects.length > 0) {
                    $.each(arrayNestDeviceObjects, function (inx) {
                        av_nests['"' + arrayNestDeviceObjects[inx].udn + '"'] = {
                            fname: arrayNestDeviceObjects[inx].friendlyName,
                            parentName: arrayNestDeviceObjects[inx].parentName
                        }
                    });
                }

                //LED Code
                if(arrayLedDeviceObjects.length>0){
                    $.each(arrayLedDeviceObjects,function(inx){
                        console.log(TAG +"Remote av_switches: " + arrayLedDeviceObjects[inx][key.DEVICE_MAC_ADDRESS]+" "+arrayLedDeviceObjects[inx][key.DEVICE_FRIENDLY_NAME]);
                        av_leddevices[arrayLedDeviceObjects[inx][key.DEVICE_MAC_ADDRESS]]=arrayLedDeviceObjects[inx][key.DEVICE_FRIENDLY_NAME];
                    });
                    //console.log("arrayLedDeviceObjects enter***"+ JSON.stringify(av_leddevices));
                    rule_details.deviceListBorder();
                }
                else console.log("No LEDs detected");

            }else{
                navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {loadUrlTimeoutValue : 60000});
            }
        }

        //Object Initialization
        var rule=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
        rule.SelectedSensors='';
        rule.SelectedDayOrRange='';
        rule.nests = {};
        var state = rule.State;
        var selectedRuleID = rule.id;

        var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);

        //Get all rows from DB for a specific rule
        db.transaction(getData, getDataErrorCB, getDataSuccessCB);


        function getData(tx){
            tx.executeSql('SELECT * from RULEDEVICES where RuleID=?',[selectedRuleID],
                function (tx,results){
                    var sensors = [], switches = [], makers = [], makerSensors = [], leds = [], nests = [];
                    var len = results.rows.length;
                    if(len>0){
                        for(var i=0;i<len;i++){
                    		var deviceUdn = results.rows.item(i).DeviceID;
                    		if(wemoUtil.isMakerDevice(deviceUdn)){
                    			if(wemoUtil.isMakerSwitch(deviceUdn)){
                    				makers.push(results.rows.item(i));
                    			}
                    			else{
                    				makerSensors.push(results.rows.item(i));
                    			}
                    		} else if(deviceUdn.indexOf('WEMO00') > -1){
                              console.log("Push Nests");
                              nests.push(results.rows.item(i));
                    		} else{
                                if(results.rows.item(i).Type == '0') sensors.push(results.rows.item(i));
                                else if(results.rows.item(i).Type == '-1') switches.push(results.rows.item(i));
                    		}
                        }

                        //Populate rules Object for further editing

                        function trimDays(totDays){
                            var uniqueDays = [];

                            $.each(totDays, function (i, el) {
                                if ($.inArray(el, uniqueDays) === -1) {
                                    uniqueDays.push(el);
                                }

                            });
                            return uniqueDays;
                        }
                         if (makers.length > 0) {
                        	makerLoop();
                        }

                        if (makerSensors.length > 0) {
                        	for(var index=0;index<makerSensors.length;index++){
//                        		switchLoop();
                        		rule.Sensors[makerSensors[index].DeviceID]= {};
                        		rule.Sensors[makerSensors[index].DeviceID]['state']= makerSensors[index].StartAction;
                        	}
                        }

                        console.log(" switches data "+JSON.stringify(switches));
                        if(sensors.length>0){
                            for(var se=0;se<sensors.length;se++){
                                switchLoop();
                                console.log("sensors - se] - .DeviceID:  "+sensors[se].DeviceID);
                                rule.SelectedSensors += sensors[se].DeviceID+",";
                                rule.SelectedSensorsValue=sensors[se].Value;
                                console.log("Value : "+rule.SelectedSensorsValue+"\n");
                                rule.Sensors[sensors[se].DeviceID]= {};
                        		rule.Sensors[sensors[se].DeviceID]['state']= sensors[se].Level;
                        		rule.Sensors[sensors[se].DeviceID]['SelectedSensorsValue']= sensors[se].Value;
                            }
                            var sens = rule.SelectedSensors;
                            var arrSensors=sens.split(",");
                            console.log("sensors - se] - .DeviceID:  "+arrSensors);
                            arrSensors.pop();
                            rule.SelectedSensors=arrSensors.join(',');
//                            var totDays=rule.SelectedDayOrRange.split('-');
//                            totDays.pop();
//                            rule.SelectedDayOrRange= trimDays(totDays).join('-');
                            console.log("sensors - se] - .DeviceID:rule.SelectedSensors  "+rule.SelectedSensors+"  ::arrSensors  "+arrSensors);

                        } else if (nests.length > 0) {
                            for (var nesti = 0; nesti < nests.length; nesti++) {
                                switchLoop();
                                rule.nests[nests[nesti].DeviceID] = {};
                                rule.nests[nests[nesti].DeviceID]['ProductName'] = nests[nesti].ProductName;
                                rule.nests[nests[nesti].DeviceID]['awayState'] = nests[nesti].ZBCapabilityStart;
                            }
                        } else if (switches.length > 0) {
                            switchLoop();
                        }
                        if (switches.length > 0 || makers.length > 0) {
                            var totDays = rule.SelectedDayOrRange.split('-');
                            totDays.pop();
                            rule.SelectedDayOrRange = trimDays(totDays).join('-');

                        }
                        function switchLoop(){
                            var SRSSSelectedDays = {};

                            for(var sw=0;sw<switches.length;sw++){
                                var day = wemoUtil.returnDay(switches[sw].DayID);

                                console.log("device ID***"+switches[sw].DeviceID);
                                var deviceID = switches[sw].DeviceID;
                                var searchType = deviceID.search("Bridge");
                                var DeviceID = "";

                                console.log("device id before split "+switches[sw].DeviceID);

                                if(searchType != -1 || searchType == true)
                                {
                                    console.log("entering in if");

                                    if(deviceID.indexOf("^")!=-1)
	    	           				{
                                    	var splitDeviceId = deviceID.split("^");
                                        DeviceID = splitDeviceId[1];
	    	           				}
	    	           				else
	    	           				{
	    	           					var splitDeviceId = deviceID.split(":");
		    	           				DeviceID = splitDeviceId[2];
	    	           				}

                                }
                                else DeviceID = switches[sw].DeviceID;

                                console.log("DeviceID "+DeviceID);

                                if (!DeviceID.match(/dimmer/gi) && (rule.RuleType === sessionStore.TIME_INTERVAL || rule.RuleType ===  sessionStore.SIMPLE_SWITCH)) {
                                    DeviceID = DeviceID.replace(":", "");
                                }


                                //if(deviceID.indexOf("uuid") == -1)
                                if ((deviceID.indexOf("uuid") == -1 || searchType != -1 || searchType == true || deviceID.indexOf("uuid:Bridge") != -1) && (rule.RuleType == sessionStore.MOTION_CONTROLLED || rule.RuleType == sessionStore.MAKER_MOTION_CONTROLLED || rule.RuleType == sessionStore.EVENT_CONTROLLED)) {
                                	rule.Devices[DeviceID]={};
                                    rule.Devices[DeviceID].StartAction=switches[sw].StartAction;
                                    rule.Devices[DeviceID].EndAction=switches[sw].EndAction;
                                    rule.Devices[DeviceID].SensorDuration=switches[sw].SensorDuration;
                                    rule.Devices[DeviceID].SelectedSensorsValue=switches[sw].Value;
                                    rule.Devices[DeviceID].FName="";

                                    if(av_leddevices[DeviceID] !== undefined){
                                        rule.Devices[DeviceID].deviceInformation = devices[DeviceID].information;
                                    }

                                    rule.When.StartTime = switches[sw].StartTime;
                                    rule.When.RuleDuration = switches[sw].RuleDuration;



                                    rule.SelectedDayOrRange += day+'-';
                                    rule.When.OnModeOffset = switches[sw].OnModeOffset;
                                    rule.When.OffModeOffset = switches[sw].OffModeOffset;
                                    rule.Devices[DeviceID].SelectedLedValue = 1;

                                    var tempStartTime = ""+rule.When.StartTime;
                                    if(tempStartTime.slice(-1) == "1" || tempStartTime.slice(-1) == "4"){
                                        rule.When.StartSRSS = "Sunrise";
                                    }else if(tempStartTime.slice(-1) == "2" ||tempStartTime.slice(-1) == "5"){
                                        rule.When.StartSRSS = "Sunset";
                                    }

                                    var tempEndTime = ""+parseInt(parseInt(rule.When.RuleDuration)+parseInt(rule.When.StartTime));
                                    if(tempEndTime.slice(-1) == "1" || tempEndTime.slice(-1) == "4"){
                                        rule.When.EndSRSS = "Sunrise";
                                    }else if(tempEndTime.slice(-1) == "2" || tempEndTime.slice(-1) == "5"){
                                        rule.When.EndSRSS = "Sunset";
                                    }

                                    var iDay = switches[sw].DayID;
                                    SRSSSelectedDays[iDay] = {};
                                    SRSSSelectedDays[iDay].day = iDay;

                                    if (rule.When.StartSRSS != undefined) {
                                        switch (rule.When.StartSRSS) {
                                            case "Sunrise": SRSSSelectedDays[iDay].timeSR = rule.When.StartTime; break;
                                            case "Sunset": SRSSSelectedDays[iDay].timeSS = rule.When.StartTime; break;
                                        }
                                    }
                                    SRSSSelectedDays[iDay].RuleDuration = rule.When.RuleDuration;
                                    rule[sessionStore.SRSS_SELECTED_DAYS] = SRSSSelectedDays;

                                }
                                else if((deviceID.indexOf("uuid") == -1 || searchType != -1 || searchType == true || deviceID.indexOf("uuid:Bridge") != -1) && rule.RuleType != sessionStore.AWAY_MODE)
                                {
                                    var tempStart = switches[sw].ZBCapabilityStart;
                                    var tempEnd = switches[sw].ZBCapabilityEnd;

                                    console.log("capablititi****"+sw+"---"+tempStart+"---"+tempEnd);

                                    if(tempStart.indexOf("10006") != -1 || tempEnd.indexOf("10006") != -1)
                                    {
                                        if(switches[sw].StartAction == 1 && switches[sw].EndAction == 1)
                                        {

                                            rule.Devices[DeviceID]={};
                                            rule.Devices[DeviceID].StartAction=switches[sw].StartAction;
                                            rule.Devices[DeviceID].EndAction=switches[sw].EndAction;
                                            rule.Devices[DeviceID].SensorDuration=switches[sw].SensorDuration;
                                            rule.Devices[DeviceID].SelectedSensorsValue=switches[sw].Value;
                                            rule.Devices[DeviceID].FName="";

                                            if(av_leddevices[DeviceID] !== undefined) {
                                                rule.Devices[DeviceID].deviceInformation = devices[DeviceID].information;
                                            }

                                            rule.When.StartTime = switches[sw].StartTime;
                                            rule.When.RuleDuration = switches[sw].RuleDuration;
                                            rule.When.OnModeOffset = switches[sw].OnModeOffset;
                                            rule.When.OffModeOffset = switches[sw].OffModeOffset;

                                            rule.SelectedDayOrRange += day+'-';

                                            rule.Devices[DeviceID].SelectedLedValue = 1;

                                            rule.Devices[DeviceID].CapabilityStart = switches[sw].ZBCapabilityStart;
                                            rule.Devices[DeviceID].CapabilityEnd = switches[sw].ZBCapabilityEnd;
                                        }
                                        else if(switches[sw].StartAction == 1 && switches[sw].EndAction == 0)
                                        {

                                            rule.Devices[DeviceID]={};
                                            rule.Devices[DeviceID].StartAction=switches[sw].StartAction;
                                            rule.Devices[DeviceID].EndAction=switches[sw].EndAction;
                                            rule.Devices[DeviceID].SensorDuration=switches[sw].SensorDuration;
                                            rule.Devices[DeviceID].SelectedSensorsValue=switches[sw].Value;
                                            rule.Devices[DeviceID].FName="";

                                            if(av_leddevices[DeviceID] !== undefined) {
                                                rule.Devices[DeviceID].deviceInformation = devices[DeviceID].information;
                                            }

                                            rule.When.RuleDuration = switches[sw].RuleDuration;
                                            rule.When.OnModeOffset = switches[sw].OnModeOffset;
                                            rule.When.OffModeOffset = switches[sw].OffModeOffset;

                                            rule.SelectedDayOrRange += day+'-';

                                            rule.Devices[DeviceID].SelectedLedValue = 1;

                                            rule.Devices[DeviceID].CapabilityStart = switches[sw].ZBCapabilityStart;
                                            rule.Devices[DeviceID].CapabilityEnd = switches[sw].ZBCapabilityEnd;
                                        }
                                        else if(switches[sw].StartAction == 0 && switches[sw].EndAction == 0)
                                        {
                                        	rule.Devices[DeviceID]={};
                                            rule.Devices[DeviceID].StartAction=switches[sw].StartAction;
                                            rule.Devices[DeviceID].EndAction=switches[sw].EndAction;
                                            rule.Devices[DeviceID].SensorDuration=switches[sw].SensorDuration;
                                            rule.Devices[DeviceID].SelectedSensorsValue=switches[sw].Value;
                                            rule.Devices[DeviceID].FName="";

                                            if(av_leddevices[DeviceID] !== undefined) {
                                                rule.Devices[DeviceID].deviceInformation = devices[DeviceID].information;
                                            }

                                            rule.When.StartTime = switches[sw].StartTime;
                                            rule.When.RuleDuration = switches[sw].RuleDuration;
                                            rule.When.OnModeOffset = switches[sw].OnModeOffset;
                                            rule.When.OffModeOffset = switches[sw].OffModeOffset;

                                            rule.SelectedDayOrRange += day+'-';

                                            rule.Devices[DeviceID].SelectedLedValue = 1;

                                            rule.Devices[DeviceID].CapabilityStart = switches[sw].ZBCapabilityStart;
                                            rule.Devices[DeviceID].CapabilityEnd = switches[sw].ZBCapabilityEnd;
                                        }



                                    }
                                    if(tempStart.indexOf("10008") != -1 || tempEnd.indexOf("10008") != -1)
                                    {

                                        console.log("switches[sw].StartAction***"+switches[sw].StartAction);
                                        rule.Devices[DeviceID]={};
                                        rule.Devices[DeviceID].StartAction=switches[sw].StartAction;
                                        rule.Devices[DeviceID].EndAction=switches[sw].EndAction;
                                        rule.Devices[DeviceID].SensorDuration=switches[sw].SensorDuration;
                                        rule.Devices[DeviceID].SelectedSensorsValue=switches[sw].Value;
                                        rule.Devices[DeviceID].FName="";


                                        if(av_leddevices[DeviceID] !== undefined) {
                                            rule.Devices[DeviceID].deviceInformation = devices[DeviceID].information;
                                        }

                                        var splitArr = switches[sw].ZBCapabilityStart.split("=");
                                        var splitArr2 = splitArr[1].split(":");
                                        if(splitArr2[0] > 1){
                                        	var fadein = splitArr2[1];
                                            rule.When.StartTime = parseInt(switches[sw].StartTime) + (fadein/10);
                                        }else{
                                            var fadeout = splitArr2[1];
                                            rule.Devices[DeviceID].FadeOut = fadeout;
                                            rule.When.StartTime = switches[sw].StartTime;
                                        }
                                        rule.When.RuleDuration = switches[sw].RuleDuration;
                                        rule.When.OnModeOffset = switches[sw].OnModeOffset;
                                        rule.When.OffModeOffset = switches[sw].OffModeOffset;

                                        rule.SelectedDayOrRange += day+'-';


                                        rule.Devices[DeviceID].SelectedLedValue = 1;

                                        rule.Devices[DeviceID].CapabilityStart = switches[sw].ZBCapabilityStart;
                                        rule.Devices[DeviceID].CapabilityEnd = switches[sw].ZBCapabilityEnd;

                                        console.log("switches[sw].StartAction4234***"+rule.Devices[DeviceID].StartAction);
                                        if(rule.Devices[DeviceID].StartAction == 1 && rule.Devices[DeviceID].EndAction == 1)
                                        {
                                            var tempval =rule.Devices[DeviceID].CapabilityStart;
                                            var splitArr = tempval.split("=");
                                            var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;

                                            if(splitArr[0] == "10008")
                                            {
                                                var tempVal2 = splitArr[1];
                                                var splitArr2 = tempVal2.split(":");

                                                var brightness = splitArr2[0];
                                                brightness = (brightness * 100)/AllowedVal;
                                                brightness = Math.round(brightness)+"%";
                                                var fadein = splitArr2[1];
                                                rule.Devices[DeviceID].FadeIn = fadein;
                                                rule.Devices[DeviceID].Brightness = brightness;
                                                //var tempFadeinStrTime = (switches[sw].StartTime) + (fadein * 10);
                                                //rule.When.StartTime = tempFadeinStrTime;
                                            }

                                        }
                                        else if(rule.Devices[DeviceID].StartAction == 0 && rule.Devices[DeviceID].EndAction == 0)
                                        {
                                            var tempval =rule.Devices[DeviceID].CapabilityEnd;
                                            var splitArr = tempval.split("=");
                                            var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;

                                            if(splitArr[0] == "10008")
                                            {
                                                var tempVal2 = splitArr[1];
                                                var splitArr2 = tempVal2.split(":");

                                                console.log(" off rule details "+switches[sw].StartTime);
                                                var brightness = splitArr2[0];
                                                brightness = (brightness * 100)/AllowedVal;
                                                brightness = Math.round(brightness)+"%";
                                                var fadeout = splitArr2[1];
                                                rule.Devices[DeviceID].FadeOut = fadeout;
                                                rule.Devices[DeviceID].Brightness = brightness;
                                                //var tempFadeoutStrTime = (switches[sw].StartTime) - (fadeout * 10);
                                                //rule.When.StartTime = tempFadeoutStrTime;
                                                //console.log("entering iinnn"+splitArr2+"---"+fadeout+"--"+brightness+"---"+tempFadeoutStrTime);
                                            }

                                        }
                                        else if(rule.Devices[DeviceID].StartAction == 1 && rule.Devices[DeviceID].EndAction == 0)
                                        {
                                            var tempvalStart =rule.Devices[DeviceID].CapabilityStart;
                                            var tempvalEnd = rule.Devices[DeviceID].CapabilityEnd;

                                            if(tempvalStart.indexOf("10008") != -1)
                                            {
                                                var splitArr = tempvalStart.split("=");
                                                var splitArr2 = splitArr[1].split(":");
                                                var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
                                                var brightness = splitArr2[0];
                                                console.log("enteriing in first***"+brightness+"==="+splitArr2+"---"+AllowedVal);
                                                brightness = (brightness * 100)/AllowedVal;
                                                brightness = Math.round(brightness)+"%";
                                                var fadein = splitArr2[1];
                                                rule.Devices[DeviceID].FadeIn = fadein;
                                                rule.Devices[DeviceID].Brightness = brightness;
                                            }
                                            if(tempvalEnd.indexOf("10008") != -1)
                                            {
                                                var splitArr = tempvalEnd.split("=");
                                                var splitArr2 = splitArr[1].split(":");
                                                var fadeout = splitArr2[1];
                                                rule.Devices[DeviceID].FadeOut = fadeout;
                                            }

                                        }

                                    }

                                    if (parseInt(rule.When.StartTime)>86399){
                                        rule.When.StartTime = parseInt(rule.When.StartTime)-86400;
                                    }

                                    var tempStartTime = ""+rule.When.StartTime;
                                    if(tempStartTime.slice(-1) == "1" || tempStartTime.slice(-1) == "4"){
                                        rule.When.StartSRSS = "Sunrise";
                                    }else if(tempStartTime.slice(-1) == "2" ||tempStartTime.slice(-1) == "5"){
                                        rule.When.StartSRSS = "Sunset";
                                    }

                                    var tempEndTime = ""+parseInt(parseInt(rule.When.RuleDuration)+parseInt(rule.When.StartTime));
                                    if(tempEndTime.slice(-1) == "1" || tempEndTime.slice(-1) == "4"){
                                        rule.When.EndSRSS = "Sunrise";
                                    }else if(tempEndTime.slice(-1) == "2" || tempEndTime.slice(-1) == "5"){
                                        rule.When.EndSRSS = "Sunset";
                                    }

                                    var iDay = switches[sw].DayID;
                                    SRSSSelectedDays[iDay] = {};
                                    SRSSSelectedDays[iDay].day = iDay;

                                    if (rule.When.StartSRSS != undefined) {
                                        switch (rule.When.StartSRSS) {
                                            case "Sunrise": SRSSSelectedDays[iDay].timeSR = rule.When.StartTime; break;
                                            case "Sunset": SRSSSelectedDays[iDay].timeSS = rule.When.StartTime; break;
                                        }
                                    }
                                    SRSSSelectedDays[iDay].RuleDuration = rule.When.RuleDuration;
                                    rule[sessionStore.SRSS_SELECTED_DAYS] = SRSSSelectedDays;
                                }
                                else if((deviceID.indexOf("uuid") == -1 || searchType != -1 || searchType == true || deviceID.indexOf("uuid:Bridge") != -1) && rule.RuleType == sessionStore.AWAY_MODE)
                                {

                                	rule.Devices[DeviceID]={};
                                    rule.Devices[DeviceID].StartAction=switches[sw].StartAction;
                                    rule.Devices[DeviceID].EndAction=switches[sw].EndAction;
                                    rule.Devices[DeviceID].SensorDuration=switches[sw].SensorDuration;
                                    rule.Devices[DeviceID].SelectedSensorsValue=switches[sw].Value;
                                    rule.Devices[DeviceID].FName="";

                                    if(av_leddevices[DeviceID] !== undefined) {
                                        rule.Devices[DeviceID].deviceInformation = devices[DeviceID].information;
                                    }

                                    rule.When.StartTime = switches[sw].StartTime;
                                    rule.When.RuleDuration = switches[sw].RuleDuration;

                                    rule.SelectedDayOrRange += day+'-';
                                    rule.When.OnModeOffset = switches[sw].OnModeOffset;
                                    rule.When.OffModeOffset = switches[sw].OffModeOffset;
                                    rule.Devices[DeviceID].SelectedLedValue = 1;

                                    var tempStartTime = ""+rule.When.StartTime;
                                    if(tempStartTime.slice(-1) == "1" || tempStartTime.slice(-1) == "4"){
                                        rule.When.StartSRSS = "Sunrise";
                                    }else if(tempStartTime.slice(-1) == "2" ||tempStartTime.slice(-1) == "5"){
                                        rule.When.StartSRSS = "Sunset";
                                    }

                                    var tempEndTime = ""+parseInt(parseInt(rule.When.RuleDuration)+parseInt(rule.When.StartTime));
                                    if(tempEndTime.slice(-1) == "1" || tempEndTime.slice(-1) == "4"){
                                        rule.When.EndSRSS = "Sunrise";
                                    }else if(tempEndTime.slice(-1) == "2" || tempEndTime.slice(-1) == "5"){
                                        rule.When.EndSRSS = "Sunset";
                                    }

                                    var iDay = switches[sw].DayID;
                                    SRSSSelectedDays[iDay] = {};
                                    SRSSSelectedDays[iDay].day = iDay;

                                    if (rule.When.StartSRSS != undefined) {
                                        switch (rule.When.StartSRSS) {
                                            case "Sunrise": SRSSSelectedDays[iDay].timeSR = rule.When.StartTime; break;
                                            case "Sunset": SRSSSelectedDays[iDay].timeSS = rule.When.StartTime; break;
                                        }
                                    }
                                    SRSSSelectedDays[iDay].RuleDuration = rule.When.RuleDuration;
                                    rule[sessionStore.SRSS_SELECTED_DAYS] = SRSSSelectedDays;

                                }  else if (deviceID.match(/dimmer/gi) && (rule.RuleType === sessionStore.TIME_INTERVAL || rule.RuleType ===  sessionStore.SIMPLE_SWITCH)) {

                                    var splitStartArr = switches[sw].ZBCapabilityStart.split(":");
                                         startBrightness = parseInt(splitStartArr[1], 10);
                                         startFader = parseInt(splitStartArr[2], 10);

                                    console.log("switches[sw].StartAction***"+switches[sw].StartAction);
                                    rule.Devices[DeviceID]={};
                                    rule.Devices[DeviceID].StartAction = switches[sw].StartAction;
                                    rule.Devices[DeviceID].EndAction = switches[sw].EndAction;
                                    rule.Devices[DeviceID].SensorDuration = switches[sw].SensorDuration;
                                    rule.Devices[DeviceID].SelectedSensorsValue = switches[sw].Value;
                                    rule.Devices[DeviceID].FName = "";
                                    rule.Devices[DeviceID].SelectedLedValue = 0;

                                    rule.When.RuleDuration = switches[sw].RuleDuration;
                                    rule.When.OnModeOffset = switches[sw].OnModeOffset;
                                    rule.When.OffModeOffset = switches[sw].OffModeOffset;

                                    rule.Devices[DeviceID].CapabilityStart = switches[sw].ZBCapabilityStart;
                                    rule.Devices[DeviceID].CapabilityEnd = switches[sw].ZBCapabilityEnd;
                                    rule.SelectedDayOrRange += day+'-';

                                    //startTime
                                    rule.Devices[DeviceID].FadeOut = startFader;
                                    rule.When.StartTime = parseInt(switches[sw].StartTime) + startFader ;

                                    if(switches[sw].StartAction === 1 && switches[sw].EndAction === 1) {
//                                        rule.When.StartTime = switches[sw].StartTime;

                                        var tempStart = switches[sw].ZBCapabilityStart,
                                            tempEnd = switches[sw].ZBCapabilityEnd;

                                        if (tempStart) {
                                            var startTempArr = tempStart.split(":");

                                            rule.Devices[DeviceID].FadeIn = startTempArr[2];
                                            rule.Devices[DeviceID].Brightness = startTempArr[1]+"%";

                                        }

                                    } else if(switches[sw].StartAction === 1 && switches[sw].EndAction === 0) {

                                        var tempStart = switches[sw].ZBCapabilityStart,
                                            tempEnd = switches[sw].ZBCapabilityEnd;

                                        if (tempStart) {
                                            var startTempArr = tempStart.split(":");

                                            rule.Devices[DeviceID].FadeIn = startTempArr[2];
                                            rule.Devices[DeviceID].Brightness = startTempArr[1]+"%";

                                        }

                                        if (tempEnd) {
                                          var tempEndArray = tempEnd.split(":");

                                            rule.Devices[DeviceID].FadeOut = tempEndArray[2];
//                                            rule.Devices[DeviceID].Brightness = tempEndArray[1]+"%";
                                        }

                                    } else if(switches[sw].StartAction === 0 && switches[sw].EndAction === 0) {
//                                        rule.When.StartTime = switches[sw].StartTime;

                                        var tempStart = switches[sw].ZBCapabilityStart,
                                            tempEnd = switches[sw].ZBCapabilityEnd;

                                        if (tempStart) {
                                          var tempEndArray = tempStart.split(":");

                                            rule.Devices[DeviceID].FadeOut = tempEndArray[2];
                                            rule.Devices[DeviceID].Brightness = tempEndArray[1]+"%";
                                        }

                                    }


                                    var tempStartTime = ""+rule.When.StartTime;
                                    if(tempStartTime.slice(-1) == "1" || tempStartTime.slice(-1) == "4"){
                                        rule.When.StartSRSS = "Sunrise";
                                    }else if(tempStartTime.slice(-1) == "2" ||tempStartTime.slice(-1) == "5"){
                                        rule.When.StartSRSS = "Sunset";
                                    }

                                    var tempEndTime = ""+parseInt(parseInt(rule.When.RuleDuration)+parseInt(rule.When.StartTime));
                                    if(tempEndTime.slice(-1) == "1" || tempEndTime.slice(-1) == "4"){
                                        rule.When.EndSRSS = "Sunrise";
                                    }else if(tempEndTime.slice(-1) == "2" || tempEndTime.slice(-1) == "5"){
                                        rule.When.EndSRSS = "Sunset";
                                    }

                                    var iDay = switches[sw].DayID;
                                    SRSSSelectedDays[iDay] = {};
                                    SRSSSelectedDays[iDay].day = iDay;

                                    if (rule.When.StartSRSS != undefined) {
                                        switch (rule.When.StartSRSS) {
                                            case "Sunrise": SRSSSelectedDays[iDay].timeSR = rule.When.StartTime; break;
                                            case "Sunset": SRSSSelectedDays[iDay].timeSS = rule.When.StartTime; break;
                                        }
                                    }
                                    SRSSSelectedDays[iDay].RuleDuration = rule.When.RuleDuration;
                                    rule[sessionStore.SRSS_SELECTED_DAYS] = SRSSSelectedDays;

                                } else {
                                    rule.Devices[switches[sw].DeviceID]={};
                                    rule.Devices[switches[sw].DeviceID].StartAction=switches[sw].StartAction;
                                    rule.Devices[switches[sw].DeviceID].EndAction=switches[sw].EndAction;
                                    rule.Devices[switches[sw].DeviceID].SensorDuration=switches[sw].SensorDuration;
                                    rule.Devices[switches[sw].DeviceID].SelectedSensorsValue=switches[sw].Value;
                                    rule.Devices[switches[sw].DeviceID].FName="";

                                    rule.When.StartTime = switches[sw].StartTime;
                                    rule.When.RuleDuration = switches[sw].RuleDuration;

                                    rule.SelectedDayOrRange += day+'-';
                                    rule.When.OnModeOffset = switches[sw].OnModeOffset;
                                    rule.When.OffModeOffset = switches[sw].OffModeOffset;

                                    if (rule.RuleType == sessionStore.SIMPLE_SWITCH) {
                                        rule.When.StartSRSSoffset = switches[sw].OnModeOffset;
                                    }
                                    rule.Devices[switches[sw].DeviceID].SelectedLedValue = 0;

                                    if (rule.RuleType == sessionStore.COUNTDOWN_TIMER) {
                                        rule.When.CountdownTime = switches[sw].CountdownTime;
                                    }

                                    var tempStartTime = ""+rule.When.StartTime;
                                    if(tempStartTime.slice(-1) == "1" || tempStartTime.slice(-1) == "4"){
                                        rule.When.StartSRSS = "Sunrise";
                                    }else if(tempStartTime.slice(-1) == "2" ||tempStartTime.slice(-1) == "5"){
                                        rule.When.StartSRSS = "Sunset";
                                    }

                                    var tempEndTime = ""+parseInt(parseInt(rule.When.RuleDuration)+parseInt(rule.When.StartTime));
                                    if(tempEndTime.slice(-1) == "1" || tempEndTime.slice(-1) == "4"){
                                        rule.When.EndSRSS = "Sunrise";
                                    }else if(tempEndTime.slice(-1) == "2" || tempEndTime.slice(-1) == "5"){
                                        rule.When.EndSRSS = "Sunset";
                                    }

                                    var iDay = switches[sw].DayID;
                                    SRSSSelectedDays[iDay] = {};
                                    SRSSSelectedDays[iDay].day = iDay;

                                    if (rule.When.StartSRSS != undefined) {
                                        switch (rule.When.StartSRSS) {
                                            case "Sunrise": SRSSSelectedDays[iDay].timeSR = rule.When.StartTime; break;
                                            case "Sunset": SRSSSelectedDays[iDay].timeSS = rule.When.StartTime; break;
                                        }
                                    }
                                    SRSSSelectedDays[iDay].RuleDuration = rule.When.RuleDuration;
                                    rule[sessionStore.SRSS_SELECTED_DAYS] = SRSSSelectedDays;

                                    console.log("SRSS_SELECTED_DAYS:" + JSON.stringify(rule[sessionStore.SRSS_SELECTED_DAYS]));

                                    console.log("printing the devices ***"+JSON.stringify(rule.Devices[switches[sw].DeviceID]));
                                    console.log("RuleID : "+rule.id +"\n"+
                                        "DeviceID : "+switches[sw].DeviceID+"\n"+
                                        "StartAction : "+rule.Devices[switches[sw].DeviceID].StartAction+"\n"+
                                        "EndAction : "+rule.Devices[switches[sw].DeviceID].EndAction+"\n"+
                                        "SensorDuration :"+rule.Devices[switches[sw].DeviceID].SensorDuration+"\n"+
                                        "StartTime : "+rule.When.StartTime+"\n"+"SelectedLedValue :"+rule.Devices[switches[sw].DeviceID].SelectedLedValue+"\n"+
                                        "Capability Start : "+rule.Devices[switches[sw].DeviceID].CapabilityStart+"\n"+
                                        "Capability End : "+rule.Devices[switches[sw].DeviceID].CapabilityEnd+"\n"+
                                        "OnModeOffset :"+rule.When.OnModeOffset+"\n"+
                                        "OffModeOffset :"+rule.When.OffModeOffset+"\n"+
                                        "StartTime : "+rule.When.StartTime);
                                }
                            }
                        }
                        function makerLoop(){
                            var SRSSSelectedDays = {};
                        	for(var index=0; index < makers.length; index++){
                        		var day = wemoUtil.returnDay(makers[index].DayID);

                        		rule.Devices[makers[index].DeviceID]={};
                        		rule.Devices[makers[index].DeviceID].StartAction=makers[index].StartAction;
                        		rule.Devices[makers[index].DeviceID].EndAction=makers[index].EndAction;
                        		rule.Devices[makers[index].DeviceID].SensorDuration=makers[index].SensorDuration;
                        		rule.Devices[makers[index].DeviceID].SelectedSensorsValue=makers[index].Value;
                        		rule.Devices[makers[index].DeviceID].FName="";

                        		rule.When.StartTime = makers[index].StartTime;
                        		rule.When.RuleDuration = makers[index].RuleDuration;
                        		rule.SelectedDayOrRange += day+'-';
                        		rule.When.OnModeOffset = makers[index].OnModeOffset;
                                rule.When.OffModeOffset = makers[index].OffModeOffset;
                                if (rule.RuleType == sessionStore.SIMPLE_SWITCH) {
									rule.When.StartSRSSoffset = makers[index].OnModeOffset;
								}
                        		rule.When.OnModeOffset = makers[index].OnModeOffset;
                                rule.When.OffModeOffset = makers[index].OffModeOffset;
								if (rule.RuleType == sessionStore.SIMPLE_SWITCH) {
									rule.When.StartSRSSoffset = makers[index].OnModeOffset;
								}

                                var tempStartTime = ""+rule.When.StartTime;
                                if(tempStartTime.slice(-1) == "1" || tempStartTime.slice(-1) == "4"){
                                    rule.When.StartSRSS = "Sunrise";
                                }else if(tempStartTime.slice(-1) == "2" ||tempStartTime.slice(-1) == "5"){
                                    rule.When.StartSRSS = "Sunset";
                                }

                                var tempEndTime = ""+parseInt(parseInt(rule.When.RuleDuration)+parseInt(rule.When.StartTime));
                                if(tempEndTime.slice(-1) == "1" || tempEndTime.slice(-1) == "4"){
                                    rule.When.EndSRSS = "Sunrise";
                                }else if(tempEndTime.slice(-1) == "2" || tempEndTime.slice(-1) == "5"){
                                    rule.When.EndSRSS = "Sunset";
                                }

                                var iDay = makers[index].DayID;
                                SRSSSelectedDays[iDay] = {};
                                SRSSSelectedDays[iDay].day = iDay;

                                if (rule.When.StartSRSS != undefined) {
                                    switch (rule.When.StartSRSS) {
                                        case "Sunrise": SRSSSelectedDays[iDay].timeSR = rule.When.StartTime; break;
                                        case "Sunset": SRSSSelectedDays[iDay].timeSS = rule.When.StartTime; break;
                                    }
                                }
                                SRSSSelectedDays[iDay].RuleDuration = rule.When.RuleDuration;
                                rule[sessionStore.SRSS_SELECTED_DAYS] = SRSSSelectedDays;

                                console.log("SRSS_SELECTED_DAYS:" + JSON.stringify(rule[sessionStore.SRSS_SELECTED_DAYS]));

                        		console.log("RuleID : "+rule.id +"\n"+
                        				"DeviceID : "+makers[index].DeviceID+"\n"+
                        				"StartAction : "+rule.Devices[makers[index].DeviceID].StartAction+"\n"+
                        				"EndAction : "+rule.Devices[makers[index].DeviceID].EndAction+"\n"+
                        				"SensorDuration :"+rule.Devices[makers[index].DeviceID].SensorDuration+"\n"+
                        				"StartTime : "+rule.When.StartTime);
                        	}
                        }

                        //Adding the LocationInfo to RulesNew Object

                        tx.executeSql('SELECT * from LOCATIONINFO', [],
                            function(tx, results){
                                var len = results.rows.length;
                                if(len>0) {
                                    var locationInfo = {};

                                    console.log("LOCATIONINFO - Records Len -   "+len);
                                    for(var i=0;i<len;i++){

                                        locationInfo.cityName = results.rows.item(0).cityName;
                                        locationInfo.countryName = results.rows.item(0).countryName;
                                        locationInfo.latitude = results.rows.item(0).latitude;
                                        locationInfo.longitude = results.rows.item(0).longitude;
                                        locationInfo.countryCode = results.rows.item(0).countryCode;
                                        locationInfo.region = results.rows.item(0).region;
                                        console.log("LOCATIONINFO - Records    "
                                            +locationInfo.cityName+"  ::  "
                                            +locationInfo.countryName+"  ::  "
                                            +locationInfo.latitude+"  ::  "
                                            +locationInfo.longitude+"  ::  "
                                            +locationInfo.countryCode+"  ::  "
                                            +locationInfo.region+"  ::  "
                                        );
                                    }
                                    rule[sessionStore.LOCATION_INFO] = locationInfo;
                                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rule);
                                }
                            },
                            errorCB);

                          console.log("Rule saving to session: " + JSON.stringify(rule));
                          wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, rule);
                          rule_details.populateContent(switches, sensors, leds, db, rule, av_switches, av_sensors, av_makers, av_leddevices, deleteRule);

                    }

                },getDataSuccessCB);
        }


        function getDataErrorCB(){
            console.log("Error Selecting records");
        }
        function getDataSuccessCB(){
            console.log('Successfully retrived DB');
        }


        $("#modify_rule").on("click", function(){
            window.sessionStorage.removeItem(sessionStore.HOUSE_SITTER_CHECK);
            var ruleObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_OBJ_BEFORE_EDIT, ruleObj);
            
            if( (rule.RuleType==sessionStore.SIMPLE_SWITCH) || (rule.RuleType==sessionStore.TIME_INTERVAL) || (rule.RuleType==sessionStore.LED_TIMER_RULE)){
                window.sessionStorage.setItem(sessionStore.isEdit, "edit_timer_or_simple_rule");
                window.sessionStorage.setItem(sessionStore.RULE_STATE_EDIT_MODE, rule.State);
                window.sessionStorage.setItem(sessionStore.HEADER_EDIT_TAG, "1");
                wemoUtil.loadUrl(filePath.TIMER_RULE);
            }
            else if(rule.RuleType == sessionStore.AWAY_MODE){
                window.sessionStorage.setItem(sessionStore.isEdit, "edit_away_rule");
                window.sessionStorage.setItem("SO_EDIT_CHECK", "1");
                window.sessionStorage.setItem(sessionStore.HOUSE_SITTER_CHECK, "1");
                window.sessionStorage.setItem(sessionStore.RULE_STATE_EDIT_MODE, rule.State);
                wemoUtil.loadUrl(filePath.TIMER_RULE);
            }
            else if(rule.RuleType == sessionStore.MOTION_CONTROLLED){
                window.sessionStorage.setItem(sessionStore.isEdit, "edit_sensor_rule");
                if(isKeychainButtonRule){
                	wemoUtil.loadUrl(filePath.KEYCHAIN_BUTTON_RULE);
                } else if(isKeychainPresenseRule){
                	wemoUtil.loadUrl(filePath.KEYCHAIN_PRESENCE_RULE);
                } else{
                	wemoUtil.loadUrl(filePath.SENSORS_RULE);	
                }
                
            }  else if(rule.RuleType == sessionStore.EVENT_CONTROLLED){
                wemoUtil.loadUrl(filePath.NEST_RULE);
            }
            else if(rule.RuleType == sessionStore.MAKER_MOTION_CONTROLLED){
                window.sessionStorage.setItem(sessionStore.isEdit, "edit_maker_sensor_rule");
                wemoUtil.loadUrl(filePath.MAKER_RULE);
            }
            else if(rule.RuleType == sessionStore.COUNTDOWN_TIMER){
                window.sessionStorage.setItem(sessionStore.isEdit, "edit_countdown_timer_rule");
                wemoUtil.loadUrl(filePath.COUNTDOWN_TIMER_RULE);
            }

        });

        $("#rule_delete").on("tap",function(){
            deleteRule = true;
            db.transaction(deleteData, errorCB, successCB);
        });

        function deleteData(tx){
        	console.log("deleteData() ");
            tx.executeSql("SELECT distinct RuleID FROM RULES", [], querySuccessful, errorCB);
            tx.executeSql("DELETE FROM RULES WHERE RuleID='"+selectedRuleID+"'", [], function(){}, errorCB);
            tx.executeSql("DELETE FROM RULEDEVICES WHERE RuleID='"+parseInt(selectedRuleID)+"'", [], getAllRules, errorCB);
            tx.executeSql("DELETE FROM DEVICECOMBINATION WHERE RuleID='"+parseInt(selectedRuleID)+"'", [], function(){}, errorCB);
            tx.executeSql("DELETE FROM TARGETDEVICES WHERE RuleID='"+parseInt(selectedRuleID)+"'", [], function(){}, errorCB);
        }

        function querySuccessful(tx,results){
        	console.log("querySuccessful()--> results rows length: " + results.rows.length);
        	if(results.rows.length==1){
        		window.sessionStorage.setItem(sessionStore.LAST_ENTRY, "1");
        		window.sessionStorage.setItem("create_rule", "1");
        	}
        }
        function getAllRules(tx){
        	console.log("getAllRules()");
            tx.executeSql('SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.Level, b.ZBCapabilityStart, b.ZBCapabilityEnd from RULES a inner join RULEDEVICES b on a.RuleID=CAST(b.RuleID AS CHAR) order by a.Name COLLATE NOCASE', [], querySuccess, errorCB);
        }

        function querySuccess(tx,results){
        	console.log("querySuccess()");
            var len = results.rows.length;
            var ruleRows=[];
            if(len>0) {
                for(var i=0;i<len;i++){
                    ruleRows[i]=results.rows.item(i);
                }

            }
            window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));
        }

        function errorCB(){
            console.log("Error!");
        }
        function successCB(){
        	console.log("successCB()");
            rule_details.updateSchedule(rule,"delete");
            window.sessionStorage.setItem(sessionStore.LAST_ENTRY, "0");
        }
    },

    isSimpleWhen: function(x) {
        var flag = true;
        for (key in x.Devices) {
            if (x.Devices[key].IntervalWhen == true || x.Devices[key].SensorDuration == 0 ) {           
                flag = false; break;
            }           
        }
        return flag;
    },

    populateContent : function(switches,sensors,leds,db,rule,av_switches,av_sensors,av_makers,av_leddevices,homesense_sensors,deleteRule){
    	var showTroubleAlert = false;

        var selectedRuleID = rule.id;
        var state = rule.State;
        var days = "";
        console.log("selected range "+rule.SelectedDayOrRange);
        if(rule.SelectedDayOrRange == "Weekday" || rule.SelectedDayOrRange == "Weekend" || rule.SelectedDayOrRange == "Daily")
        {
            if(rule.SelectedDayOrRange == "Weekday"){days = wemo.items['WeekdaysNoDetails'];}
            else if(rule.SelectedDayOrRange == "Weekend"){ days = wemo.items['WeekendsNoDetails'];}
            else{ days = wemo.items[rule.SelectedDayOrRange];}
        }
        else if(rule.SelectedDayOrRange == "Weekdays" || rule.SelectedDayOrRange == "Weekends" || rule.SelectedDayOrRange == "Daily")
        {
            if(rule.SelectedDayOrRange == "Weekdays"){days = wemo.items['WeekdaysNoDetails'];}
            else if(rule.SelectedDayOrRange == "Weekends"){ days = wemo.items['WeekendsNoDetails'];}
            else{ days = wemo.items[rule.SelectedDayOrRange];}
        }
        else if ( rule.SelectedDayOrRange == wemo.items['WeekdaysDetails'] ) {
            days =  wemo.items['WeekdaysNoDetails'];
        }
        else if ( rule.SelectedDayOrRange == wemo.items['WeekendsDetails'] || rule.SelectedDayOrRange == wemo.items['WeekendsDetailsOrdchg']) {
            days =  wemo.items['WeekendsNoDetails'];
        }
        else if ( rule.SelectedDayOrRange == wemo.items['DailyDetails'] || rule.SelectedDayOrRange == wemo.items['DailyDetailsOrdchg']) {
            days =  wemo.items['Daily'];
        }
        else if ( rule.SelectedDayOrRange == wemo.items['DailyDetailsOrdchg'] ) {
            days =  wemo.items['Daily'];
        }
        else
        {
            var strDays = rule.SelectedDayOrRange;
            var arrDays = strDays.split("-");
            var displaySelectedVal = [];
            var tempSelectedDayOrRange = "";

            if(arrDays.length > 0)
            {
                for(var i=0; i < arrDays.length; i++){

                    var temp = arrDays[i];
                    console.log("temp val "+temp);

                    if(temp == "Mon"){displaySelectedVal[i] = wemo.items['MondayShort'];}
                    if(temp == "Tue"){displaySelectedVal[i] = wemo.items['TuesdayShort'];}
                    if(temp == "Wed"){displaySelectedVal[i] = wemo.items['WednesdayShort'];}
                    if(temp == "Thu"){displaySelectedVal[i] = wemo.items['ThursdayShort'];}
                    if(temp == "Fri"){displaySelectedVal[i] = wemo.items['FridayShort'];}
                    if(temp == "Sat"){displaySelectedVal[i] = wemo.items['SaturdayShort'];}
                    if(temp == "Sun"){displaySelectedVal[i] = wemo.items['SundayShort'];}
                    console.log("transforming value "+displaySelectedVal[i]);
                }

                if(arrDays.length == 1)
                {
                    tempSelectedDayOrRange = displaySelectedVal;
                }
                else
                {
                    tempSelectedDayOrRange = displaySelectedVal.join(",");
                }

            }
            days=tempSelectedDayOrRange;
        }

        var heading;
        var switchDetails = $("#rule_devices_list");
        var switchList='',sensorList='', timeAt='', ruleDisclaimer = '';

        var friendlyName='', sensorfriendlyName='';
        console.log("==> rule.RuleType "+rule.RuleType);

        if ( (rule.RuleType == sessionStore.TIME_INTERVAL) || (rule.RuleType == sessionStore.SIMPLE_SWITCH) || (rule.RuleType == sessionStore.AWAY_MODE) || (rule.RuleType == sessionStore.LED_TIMER_RULE)|| (rule.RuleType == sessionStore.COUNTDOWN_TIMER)){
            console.log("TIME_INTERVAL || SIMPLE_SWITCH");
            var displayDate = "";

            var tempStartTime = ""+rule.When.StartTime;
            if(tempStartTime.slice(-1) == "1" || tempStartTime.slice(-1) == "4"){
                rule.When.StartSRSS = "Sunrise";
            }else if(tempStartTime.slice(-1) == "2" ||tempStartTime.slice(-1) == "5"){
                rule.When.StartSRSS = "Sunset";
            }
            var tempEndTime = ""+parseInt(parseInt(rule.When.RuleDuration)+parseInt(rule.When.StartTime));

            console.log(rule.RuleType+"  SRSS:  "+tempEndTime+"  :: Rule Duration  "+parseInt(rule.When.RuleDuration)+"  STIME ::  "+parseInt(rule.When.StartTime));
            if(tempEndTime.slice(-1) == "1" || tempEndTime.slice(-1) == "4"){
                rule.When.EndSRSS = "Sunrise";
            }else if(tempEndTime.slice(-1) == "2" || tempEndTime.slice(-1) == "5"){
                rule.When.EndSRSS = "Sunset";
            }


            rule.When.EndTime=parseInt(rule.When.StartTime)+parseInt(rule.When.RuleDuration);
            if (parseInt(rule.When.EndTime)>86400){
                rule.When.EndTime=parseInt(rule.When.EndTime-86400);
            }
            if (rule.When.EndTime != timestamp.MIDNIGHT_END_TIME) rule.When.EndTime=(Math.ceil((rule.When.EndTime/10)))*10;
            console.log("tempStartTime :: "+tempStartTime+"  tempEndTime :: "+tempEndTime+"  ST SRSS :: "+ rule.When.StartSRSS+'    End SRSS :: '+ rule.When.EndSRSS+'  End Time '+rule.When.EndTime);
            if (rule.When.StartSRSS==undefined && rule.When.EndSRSS==undefined){
                if (rule.When.EndTime != timestamp.MIDNIGHT_END_TIME) 
                	{
                	displayDate= wemoUtil.returnTime(rule.When.StartTime, (Math.ceil((rule.When.RuleDuration/10)))*10);
                	if(rule.RuleType == sessionStore.COUNTDOWN_TIMER && (tempEndTime - tempStartTime) == 86280)
                		displayDate = "All Day, ";
                	}
                else 
                	{
                	displayDate= wemoUtil.returnTime(rule.When.StartTime, rule.When.RuleDuration);
                	}
            }else if (rule.When.StartSRSS==undefined && rule.When.EndSRSS!=undefined) {

                if(rule.When.EndSRSS == "Sunrise")
                {
                    var tempEndSRSS = wemo.items['SunRise'];
                }
                else if(rule.When.EndSRSS == "Sunset")
                {
                    var tempEndSRSS = wemo.items['SunSet'];
                }
                else{var tempEndSRSS = rule.When.EndSRSS;}

                var offsetOff = rule_details.convertDBOffsetToString(rule.When.OffModeOffset)+" ";
                if ( offsetOff == undefined ) offsetOff = "";
                rule.When.offSRSS_Title = offsetOff + tempEndSRSS;

                console.log("enterng in EndrSS not defined"+offsetOff+"---"+rule_details.convertDBOffsetToString(rule.When.OnModeOffset));

                displayDate=(wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24)+" - <span class='capitalize'>"+offsetOff+tempEndSRSS)+"</span>, ";
                
            }else if (rule.When.StartSRSS!=undefined && rule.When.EndSRSS==undefined) {

                if(rule.When.StartSRSS == "Sunrise")
                {
                    var tempStartSRSS = wemo.items['SunRise'];
                }
                else if(rule.When.StartSRSS == "Sunset")
                {
                    var tempStartSRSS = wemo.items['SunSet'];
                }
                else{var tempStartSRSS = rule.When.StartSRSS;}

                var offsetOn = rule_details.convertDBOffsetToString(rule.When.OnModeOffset)+" ";
                if ( offsetOn == undefined ) offsetOn = "";
                rule.When.onSRSS_Title = offsetOn + tempStartSRSS;

                console.log("enterng in start not defined"+offsetOn+"---"+rule_details.convertDBOffsetToString(rule.When.OnModeOffset));

                displayDate="<span class='capitalize'>"+(offsetOn+tempStartSRSS+"</span> - "+wemoUtil.convertMillisecondsToTF(rule.When.EndTime, UP_TF_IS24))+", ";
               
            }else if (rule.When.StartSRSS!=undefined && rule.When.EndSRSS!=undefined) {

                if(rule.When.StartSRSS == "Sunrise")
                {
                    var tempStartSRSS = wemo.items['SunRise'];
                }
                else if(rule.When.StartSRSS == "Sunset")
                {
                    var tempStartSRSS = wemo.items['SunSet'];
                }
                else{var tempStartSRSS = rule.When.StartSRSS;}

                if(rule.When.EndSRSS == "Sunrise")
                {
                    var tempEndSRSS = wemo.items['SunRise'];
                }
                else if(rule.When.EndSRSS == "Sunset")
                {
                    var tempEndSRSS = wemo.items['SunSet'];
                }
                else{var tempEndSRSS = rule.When.EndSRSS;}

                if (rule.RuleType == sessionStore.SIMPLE_SWITCH) {
                    console.log("entering in SWITCH SIMPLE");
                    var offset = rule_details.convertDBOffsetToString(rule.When.OnModeOffset)+" ";
                    if ( offset == undefined ) offset = "";
                    rule.When.SRSS_Title = offset + tempEndSRSS;
                    console.log("offset "+offset+"--"+tempStartSRSS+"--"+rule.When.OnModeOffset);
                    displayDate="<span class='capitalize'>"+offset + tempStartSRSS+"</span>, ";
                    
                } else {
                    console.log("entering in SWITCH SIMPLE else");
                    var offsetOn = rule_details.convertDBOffsetToString(rule.When.OnModeOffset)+" ";
                    var offsetOff = rule_details.convertDBOffsetToString(rule.When.OffModeOffset)+" ";
                    if ( offsetOn == undefined ) offsetOn = "";
                    if ( offsetOff == undefined ) offsetOff = "";
                    rule.When.onSRSS_Title = offsetOn + tempStartSRSS;
                    rule.When.offSRSS_Title = offsetOff + tempEndSRSS;

                    displayDate="<span class='capitalize'>"+(offsetOn+tempStartSRSS+" - "+offsetOff+tempEndSRSS)+"</span>, ";
                   
                }
            }

            /*Temp display Localization values */

            var rulenameObj = rule.RuleName;
            var tempDisRulename ="";

            if(rulenameObj.indexOf("Rule") != -1)
            {
                tempDisRulename = rulenameObj.replace("Rule",wemo.items["Rule"]);
            }else{
                tempDisRulename = rulenameObj;
            }
            var currentlyActive = wemo.items['RuleStateActive'];
                $(".ruleTitle").html(tempDisRulename);

            timeAt = "<p class='rule_details'><span class='rule_time'>"+displayDate+"</span><span class='rule_day'>"+days+"</span></p>";

            if(rule.RuleType == sessionStore.COUNTDOWN_TIMER){
//                automatically turn off
               $("#timeAtTitle").html("When");
               $("#rule_devices_title").html(wemo.items["AutoOffLower"]);
               timeAt = "<p class='rule_details'><span class='rule_countdownTime'>"+displayDate+"</span><span class='rule_day'>"+days+"</span></p>";
            }
            
            if(Object.keys(rule.Devices).length>0){
                var displayStartDate,
                    displayEndDate,
                    isDiscovered = true;
                for(key in rule.Devices) {
                    var devicesFromSFW = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SFW_DEVICE_LIST);
                    if (Object.keys(devicesFromSFW).length > 0) {
                        if (devicesFromSFW[key]) {
                            if(devicesFromSFW[key].isDiscovered != undefined && devicesFromSFW[key].isDiscovered != null){
                                isDiscovered = devicesFromSFW[key].isDiscovered;
                            }
                        }
                    }
                    var changedUDN;
                    console.log("SelectedLedValue1***" + rule.Devices[key].SelectedLedValue + "---" + JSON.stringify(av_leddevices) + "--key " + key + "----- " + JSON.stringify(rule.Devices));

                    if (rule.Devices[key].SelectedLedValue == 1) {
                        console.log("rule.Devices[key]" + rule.Devices[key] + "--" + av_leddevices[key]);
                        if (av_leddevices[key] == undefined) {
                            var rgx = /[^0-9]/;

                            if (key.search(rgx) === -1) {
                                friendlyName = wemo.items['groupNotPresent'];
                            }
                            else
                                friendlyName = wemo.items['bulbNotPresent'];
                        }

                        else friendlyName = av_leddevices[key];
                    }
                    else {
                        if (wemoUtil.isMakerDevice(key)) {
                           changedUDN = wemoUtil.getOriginalMakerUDN(key);
                              if (av_makers['"' + changedUDN + '"'] == undefined) {
                                  changedUDN = wemoUtil.getFaultyMakerUDN(key);
                                  if ((av_makers['"' + changedUDN + '"'] == undefined) || !isDiscovered)
                                      friendlyName = wemo.items['MakerNotFound'];
                                  else friendlyName = av_makers['"' + changedUDN + '"'].name;
                              }
                              else friendlyName = av_makers['"' + changedUDN + '"'].name;
                        }
                        else {
                            if ((av_switches['"' + key + '"'] === undefined) || !isDiscovered) {
                                var device = key.split(":")[1].split("-")[0];
                                friendlyName = wemo.items[ device+'NotPresent'];
                            }
                            else friendlyName = av_switches['"' + key + '"'];
                        }
                    }

                    rule.When.EndTime = parseInt(rule.When.StartTime) + parseInt(rule.When.RuleDuration);
                    if (rule.When.EndTime != timestamp.MIDNIGHT_END_TIME) rule.When.EndTime = (Math.ceil((rule.When.EndTime / 10))) * 10;
                    if (rule.When.EndTime > timestamp.MAX_HOUR) {
                        rule.When.EndTime = rule.When.EndTime - timestamp.MAX_HOUR;
                    }

                    if (rule.When.StartSRSS == "" || rule.When.StartSRSS == undefined) {
                        displayStartDate = wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24);
                    } else if (rule.When.StartSRSS != "" || rule.When.StartSRSS != undefined) {

                        if (rule.When.StartSRSS == "Sunrise" || rule.When.StartSRSS == "Sunset") {

                            console.log("displayDate " + rule.When.SRSS_Title + "--" + rule.When.onSRSS_Title + "--" + rule.When.offSRSS_Title);

                            if (rule.When.StartSRSS == "Sunrise") {
                                displayStartDate = "<span class='capitalize'>" + displayDate + "" + wemo.items['SunRise'] + "</span>";
                            }
                            else if (rule.When.StartSRSS == "Sunset") {
                                displayStartDate = "<span class='capitalize'>" + displayDate + "" + wemo.items['SunSet'] + "</span>";
                            }

                        }
                        else {
                            displayStartDate = rule.When.StartSRSS;
                        }

                    }

                    if (rule.When.EndSRSS == "" || rule.When.EndSRSS == undefined) {
                        displayEndDate = wemoUtil.convertMillisecondsToTF(rule.When.EndTime, UP_TF_IS24);
                    } else if (rule.When.EndSRSS != "" || rule.When.EndSRSS != undefined) {

                        if (rule.When.EndSRSS == "Sunrise" || rule.When.EndSRSS == "Sunset") {
                            console.log("displayDate " + rule.When.SRSS_Title + "--" + rule.When.onSRSS_Title + "--" + rule.When.offSRSS_Title);
                            if (rule.When.EndSRSS == "Sunrise") {
                                displayEndDate = "<span class='capitalize'>" + displayDate + "" + wemo.items['SunRise'] + "</span>";
                            }
                            else if (rule.When.EndSRSS == "Sunset") {
                                displayEndDate = "<span class='capitalize'>" + displayDate + "" + wemo.items['SunSet'] + "</span>";
                            }

                        }
                        else {
                            displayEndDate = rule.When.EndSRSS;
                        }

                    }

                    var iconURL = "",
                        udn = wemoUtil.isMakerDevice(key) ? wemoUtil.getOriginalMakerUDN(key) : key;
                    if (devices[udn] && devices[udn].groupIcon !== "") {
                        iconURL = devices[key].groupIcon;
                    } else if (devices[udn] && devices[udn].groupID === "") {
                        iconURL = devices[udn].icon;
                    }


                    if (rule.Devices[key].SelectedLedValue == 1) {

                        var arrLedsIcon = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DEVICE_LED_ICON);
                        var leddeviceIconCached = rule_details.checkLedDeviceIconfromCache(key);

                        if (arrLedsIcon != undefined && arrLedsIcon != "") {
                            $.each(arrLedsIcon, function (index, value) {
                                if (key == index)
                                    iconURL = value;
                            });

                        }
                        if (iconURL == "" || iconURL == undefined) {
                            if (leddeviceIconCached != undefined && leddeviceIconCached != "") {
                                iconURL = leddeviceIconCached;
                            }
                            else {

                                if (av_leddevices[key] !== undefined) {
                                    switch (rule.Devices[key].deviceInformation.modelCode) {
                                        case "LIGHTIFY A19 Tunable White":
                                            iconURL = "../img/bulb_lightify_a19_tunable_white.png";
                                            break;
                                        case "LIGHTIFY Gardenspot RGB":
                                            iconURL = "../img/bulb_gardenspot_rgb.png";
                                            break;
                                        case "LIGHTIFY Flex RGBW":
                                            iconURL = "../img/bulb_osram_flex_rgbw.png";
                                            break;
                                        case "iQBR30":
                                            iconURL = "../img/bulb_osram_sylvania_iqbr30.png";
                                            break;
                                        case "Connected A-19 60W Equivalent":
                                            iconURL = "../img/bulb_cree_connected_a-19_60w_equivalent.png";
                                            break;
                                        default:
                                            iconURL = "../img/new_icons/WeMo_LightBulb_@3x.png";
                                            break;
                                    }
                                } else {
                                    iconURL = "../img/new_icons/WeMo_LightBulb_@3x.png";
                                }
                            }
                        }


                    }
                    else {
//                        nativeUtilPlugin.execute(
//                            function (base64String) {
//                                console.log('got image from DB success');
//                                iconURL = "data:image/png;base64, " + base64String;
//                            },
//                            rule_details.reportError,
//                            actions.GET_BASE64_IMAGE_FROM_DB,
//                            [key]
//                        );

                        if (iconURL === null || iconURL == '') {
                            if (key.indexOf('Lightswitch') != -1) {
                                iconURL = "../img/new_icons/WeMo_LightSwitch_@3x.png";
                            }
                            if (key.indexOf('Dimmer') != -1) {
                                iconURL = "../img/new_icons/WeMo_Dimmer_@3x.png";
                            }
                            if (key.indexOf('Socket') != -1) {
                                iconURL = "../img/new_icons/WeMo_Switch_Old_@3x.png";
                            }
                            if (key.indexOf('Insight') != -1) {
                                iconURL = "../img/new_icons/WeMo_Insight_Switch_@3x.png";
                            }
                            if (key.indexOf('Maker') != -1) {
                                iconURL = "../img/new_icons/WeMo_Maker_@3x.png";
                            }
                        }
                    }

                    var startAction = parseInt(rule.Devices[key].StartAction);
                    var endAction = parseInt(rule.Devices[key].EndAction);
                    var isEndActionValid = (endAction == 0 || endAction == 1 || endAction == 2);
                    // iOS app might insert "-1" value for the simple timer rule
                    // android app keeps the startAction and endAction same for simple timer rule.
                    if (!isEndActionValid) {
                        endAction = startAction;
                    }
                    var Startstate = wemoUtil.returnSwitchStatus(startAction);
                    var Endstate = wemoUtil.returnSwitchStatus(endAction);
                    var stateClass = '';
                    var n = Startstate.split(" ");
                    Startstate = "<span class='first'>" + n[0] + "</span>";
                    if (n[1] != undefined) {
                        Startstate += "<span class='second'>" + " " + n[1] + "</span>";
                    }
                    var n = Endstate.split(" ");
                    Endstate = "<span class='third'>" + n[0] + "</span>";
                    if (n[1] != undefined) {
                        Endstate += "<span class='four'>" + " " + n[1] + "</span>";
                    }
                    if (rule.Devices[key].StartAction == 1) {
                        stateClass = ' green';
                    } else {
                        stateClass = ' black';
                    }


                    console.log("===> SensorDuration " + rule.Devices[key].SensorDuration + " StartAction " + rule.Devices[key].StartAction + " EndAction " + rule.Devices[key].EndAction);
                    var action;


                    if ((key.match(/dimmer/gi) || key.indexOf("uuid") === -1) && (rule.RuleType === sessionStore.TIME_INTERVAL || rule.RuleType ===  sessionStore.SIMPLE_SWITCH)) {
                        var brightnessVal = wemo.items['brightness'] + ":" + rule.Devices[key].Brightness,
                            fadeInStr,
                            fadeOutStr;

                        var baseValue = key.match(/dimmer/gi) ? 1 : 10;

                        if (rule.Devices[key].FadeIn === "0") {
                            fadeInStr = wemo.items['fadeIn'] + ":" + wemo.items['defaultTime'];
                        } else {
                            fadeInStr = wemo.items['fadeIn'] + ":" + parseInt(rule.Devices[key].FadeIn, 10) / (60*baseValue) + "m";
                        }

                        if (parseInt(rule.Devices[key].FadeOut, 10) === 3 * baseValue) {
                            fadeOutStr = wemo.items['fadeOut'] + ":" + wemo.items['defaultTime'];
                        } else {
                            fadeOutStr = wemo.items['fadeOut'] + ":" + parseInt(rule.Devices[key].FadeOut, 10) / (60*baseValue) + "m";
                        }

                        if (rule.Devices[key].SensorDuration == 0) { //Timer Interval
                            action = brightnessVal + "<br/>" + fadeInStr + ", " + fadeOutStr;
                        } else if (rule.Devices[key].StartAction == 1) { //Simple On
                            action = brightnessVal + "<br/>" + fadeInStr;
                        } else if (rule.Devices[key].StartAction == 0) { //Simple Off
                            action = fadeOutStr;
                        }
                    } else {
                        if (rule.Devices[key].SensorDuration == 0) { //Timer Interval
                            action = wemo.items['onUntilTime'];
                        } else if (rule.Devices[key].StartAction == 1) { //Simple On
                            action = wemo.items['On'];
                        } else if (rule.Devices[key].StartAction == 0) { //Simple Off
                            action = wemo.items['Off'];
                        }
                    }

                    if (rule.RuleType == sessionStore.COUNTDOWN_TIMER) {
                       // var countdown = rule.When.CountdownTime / 60;
                       var hour=Math.floor(rule.When.CountdownTime / 3600);
                       var min=Math.floor(rule.When.CountdownTime % 3600 / 60);
                        action = "After it's on for " + hour + "h " + min + "m";
                    }

                    console.log("===>action " + action);

                    if (rule.RuleType == sessionStore.AWAY_MODE) {
                        switchList += "<li><div class='rule_img'><img src='" + iconURL + "'></div>" +
                            "<div class='rule_details_device'>" +
                            "<div class='rule_details_device_name'>" + friendlyName + "</div>" +
                            "</div></li>";
                    }
                    else if (rule.RuleType == sessionStore.COUNTDOWN_TIMER) {
                        switchList += "<li><div class='rule_img'><img src='" + iconURL + "'></div>" +
                            "<div class='rule_details_device'>" +
                            "<div class='rule_details_device_name'>" + friendlyName + "</div>" +
                            "<div class='gray_text'> <span>" + action + "</span></div>" +
                            "</div></li>";
                    }
                    else {
                        switchList += "<li><div class='rule_img'><img src='" + iconURL + "'></div>" +
                            "<div class='rule_details_device'>" +
                            "<div class='rule_details_device_name'>" + friendlyName + "</div>" +
                            "<div class='gray_text'> <span>" + action + "</span></div>" +
                            "</div></li>";
                    }
                }
            }
        }
        else if(rule.RuleType == sessionStore.MOTION_CONTROLLED){

            //----------------------Disable SRSS Link in More Meneu -------------------------------//
            var displayDate = "";

            var tempStartTime = ""+rule.When.StartTime;
            if(tempStartTime.slice(-1) == "1"){
                rule.When.StartSRSS = "Sunrise";
            }else if(tempStartTime.slice(-1) == "2"){
                rule.When.StartSRSS = "Sunset";
            }


            var tempEndTime = ""+parseInt(parseInt(rule.When.RuleDuration)+parseInt(rule.When.StartTime));

            console.log(rule.RuleType+"  SRSS:  "+tempEndTime+"  :: Rule Duration  "+parseInt(rule.When.RuleDuration)+"  STIME ::  "+parseInt(rule.When.StartTime));
            if(tempEndTime.slice(-1) == "1"){
                rule.When.EndSRSS = "Sunrise";
            }else if(tempEndTime.slice(-1) == "2"){
                rule.When.EndSRSS = "Sunset";
            }

            rule.When.EndTime=parseInt(rule.When.StartTime)+parseInt(rule.When.RuleDuration);
            if (parseInt(rule.When.EndTime)>86400){
                rule.When.EndTime=parseInt(rule.When.EndTime-86400);
            }

            if (parseInt(rule.When.EndTime) != timestamp.MIDNIGHT_END_TIME) rule.When.EndTime=(Math.ceil((rule.When.EndTime/10)))*10;
            console.log("tempStartTime :: "+tempStartTime+"  tempEndTime :: "+tempEndTime+"  ST SRSS :: "+ rule.When.StartSRSS+'    End SRSS :: '+ rule.When.EndSRSS+'  End Time '+rule.When.EndTime);
            if (rule.When.StartSRSS==undefined && rule.When.EndSRSS==undefined){
                if (rule.When.StartTime==sessionStore.ALLDAY_STARTTIME && rule.When.EndTime==sessionStore.ALLDAY_ENDTIME){
                    displayDate=sessionStore.SENSOR_ALLDAY+", "
                }else{
                    if (rule.When.EndTime!=timestamp.MIDNIGHT_END_TIME) displayDate= wemoUtil.returnTime(rule.When.StartTime, (Math.ceil((rule.When.RuleDuration/10)))*10);
                    else displayDate= wemoUtil.returnTime(rule.When.StartTime, rule.When.RuleDuration);
                }
            }else if (rule.When.StartSRSS==undefined && rule.When.EndSRSS!=undefined) {

                if(rule.When.EndSRSS == "Sunrise")
                {
                    var tempEndSRSS = wemo.items['SunRise'];
                }
                else if(rule.When.EndSRSS == "Sunset")
                {
                    var tempEndSRSS = wemo.items['SunSet'];
                }
                else{var tempEndSRSS = rule.When.EndSRSS;}

                var offsetOff = rule_details.convertDBOffsetToString(rule.When.OffModeOffset)+" ";
                if ( offsetOff == undefined ) offsetOff = "";
                rule.When.offSRSS_Title = offsetOff + tempEndSRSS;

                displayDate=(wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24)+" - <span class='capitalize'>"+offsetOff+tempEndSRSS)+"</span>, ";
            }else if (rule.When.StartSRSS!=undefined && rule.When.EndSRSS==undefined) {

                if(rule.When.StartSRSS == "Sunrise")
                {
                    var tempStartSRSS = wemo.items['SunRise'];
                }
                else if(rule.When.StartSRSS == "Sunset")
                {
                    var tempStartSRSS = wemo.items['SunSet'];
                }
                else{var tempStartSRSS = rule.When.StartSRSS;}

                var offsetOn = rule_details.convertDBOffsetToString(rule.When.OnModeOffset)+" ";
                if ( offsetOn == undefined ) offsetOn = "";
                rule.When.onSRSS_Title = offsetOn + tempStartSRSS;

                displayDate="<span class='capitalize'>"+(offsetOn+tempStartSRSS+"</span> - "+wemoUtil.convertMillisecondsToTF(rule.When.EndTime, UP_TF_IS24))+", ";
            }else if (rule.When.StartSRSS!=undefined && rule.When.EndSRSS!=undefined) {

                if(rule.When.StartSRSS == "Sunrise")
                {
                    var tempStartSRSS = wemo.items['SunRise'];
                }
                else if(rule.When.StartSRSS == "Sunset")
                {
                    var tempStartSRSS = wemo.items['SunSet'];
                }
                else{var tempStartSRSS = rule.When.StartSRSS;}

                if(rule.When.EndSRSS == "Sunrise")
                {
                    var tempEndSRSS = wemo.items['SunRise'];
                }
                else if(rule.When.EndSRSS == "Sunset")
                {
                    var tempEndSRSS = wemo.items['SunSet'];
                }
                else{var tempEndSRSS = rule.When.EndSRSS;}

                var offsetOn = rule_details.convertDBOffsetToString(rule.When.OnModeOffset)+" ";
                var offsetOff = rule_details.convertDBOffsetToString(rule.When.OffModeOffset)+" ";
                if ( offsetOn == undefined ) offsetOn = "";
                if ( offsetOff == undefined ) offsetOff = "";
                rule.When.onSRSS_Title = offsetOn + tempStartSRSS;
                rule.When.offSRSS_Title = offsetOff + tempEndSRSS;

                displayDate="<span class='capitalize'>"+(offsetOn+tempStartSRSS+" - "+offsetOff+tempEndSRSS)+"</span>, ";
            }
           

            //----------------------Disable SRSS Link in More Meneu -------------------------------//


            /*Temp display Localization values */

            var rulenameObj = rule.RuleName;
            var tempDisRulename ="";

            if(rulenameObj.indexOf("Rule") != -1)
            {
                tempDisRulename = rulenameObj.replace("Rule",wemo.items["Rule"]);
            }else{
                tempDisRulename = rulenameObj;
            }
            var currentlyActive = wemo.items['RuleStateActive'];

            $(".ruleTitle").html(tempDisRulename);

            timeAt = "<p class='rule_details'><span class='rule_time'>"+displayDate+"</span><span class='rule_day'>"+days+"</span></p>";

            if(Object.keys(rule.Devices).length>0){

                for(key in rule.Devices){
                   var iconURL = "",
                       udn =  wemoUtil.isMakerDevice(key)? wemoUtil.getOriginalMakerUDN(key) : key;
                   if (devices[udn] && devices[udn].groupIcon !== "") {
                        iconURL = devices[key].groupIcon;
                   } else if (devices[udn] && devices[udn].groupID === "" ) {
                       iconURL = devices[udn].icon;
                   }
                    if(rule.Devices[key].SelectedLedValue == 1)
                    {
                    	var arrLedsIcon = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DEVICE_LED_ICON);
                    	var leddeviceIconCached = rule_details.checkLedDeviceIconfromCache(key);
                    	
                    	if(arrLedsIcon != undefined && arrLedsIcon != "")
                        {
                    		 $.each(arrLedsIcon, function(index, value) {
                                 if(key == index)
                    				 iconURL = value;
                             });

                        }
                    	if(iconURL == "" || iconURL == undefined)
                    	{
                    		if(leddeviceIconCached != undefined && leddeviceIconCached != "")
                        	{
                        		iconURL = leddeviceIconCached;
                        	}	
                        	else 
                        	{

                                if(av_leddevices[key] !== undefined){
                                    switch (rule.Devices[key].deviceInformation.modelCode) {
                                        case "LIGHTIFY A19 Tunable White":
                                            iconURL = "../img/bulb_lightify_a19_tunable_white.png";
                                            break;
                                        case "LIGHTIFY Gardenspot RGB":
                                            iconURL = "../img/bulb_gardenspot_rgb.png";
                                            break;
                                        case "LIGHTIFY Flex RGBW":
                                            iconURL = "../img/bulb_osram_flex_rgbw.png";
                                            break;
                                        case "iQBR30":
                                            iconURL = "../img/bulb_osram_sylvania_iqbr30.png";
                                            break;
                                        case "Connected A-19 60W Equivalent":
                                            iconURL = "../img/bulb_cree_connected_a-19_60w_equivalent.png";
                                            break;
                                        default:
                                            iconURL = "../img/new_icons/WeMo_LightBulb_@3x.png";
                                            break;
                                    }
                                } else {
                                    iconURL = "../img/new_icons/WeMo_LightBulb_@3x.png";
                                }
                        	}
                    	}

                    }
                    else
                    {
//                        nativeUtilPlugin.execute(
//                            function(base64String){
//                                console.log('got image from DB success');
//                                iconURL = "data:image/png;base64, " + base64String;
//                            },
//                            rule_details.reportError,
//                            actions.GET_BASE64_IMAGE_FROM_DB,
//                            [key]
//                        );

                        if(iconURL === null || iconURL == ''){
                            if(key.indexOf('Lightswitch') != -1){
                                iconURL="../img/new_icons/WeMo_LightSwitch_@3x.png";
                            }
                            if (key.indexOf('Dimmer') != -1) {
                                iconURL = "../img/new_icons/WeMo_Dimmer_@3x.png";
                            }
                            if(key.indexOf('Socket') != -1){
                                iconURL="../img/new_icons/WeMo_Switch_Old_@3x.png";
                            }
                            if(key.indexOf('Insight') != -1){
                                iconURL="../img/new_icons/WeMo_Insight_Switch_@3x.png";
                            }
                            if(key.indexOf('Sensor') != -1){
                                iconURL="../img/new_icons/WeMo_Motion_@3x.png";
                            }
                        	if(key.indexOf('Maker') != -1){
                        		iconURL="../img/new_icons/WeMo_Maker_@3x.png";
                        	}
                        }
                    }

                    console.log("SelectedLedValue2***"+rule.Devices[key].SelectedLedValue+"---"+JSON.stringify(av_leddevices));
                    if(rule.Devices[key].SelectedLedValue == 1)
                    {
                        console.log("av_leddevices[key] "+av_leddevices[key]);
                        if(av_leddevices[key] == undefined) 
                        {
                        	var rgx = /[^0-9]/;
                            
                            if(key.search(rgx) === -1) {
                            	friendlyName=wemo.items['groupNotPresent'];	                	
                			}
                            else
                            	friendlyName=wemo.items['bulbNotPresent'];
                        }
                        else friendlyName = av_leddevices[key];
                        
                    }
                    else
                    {
                    	if(wemoUtil.isMakerDevice(key)){
                    		if(av_makers['"'+key+'"'] == undefined) {
                    			var changedUDN = wemoUtil.getFaultyMakerUDN(key);
                    			if(av_makers['"'+changedUDN+'"'] == undefined)
                    				friendlyName= wemo.items['MakerNotFound'];
                    			else friendlyName = av_makers['"'+changedUDN+'"'].name;
                    		}
                    		else friendlyName = av_makers['"'+key+'"'].name;
                    	}
                    	else {
                        if(av_switches['"'+key+'"'] === undefined || !devices[udn].isDiscovered ){
                            var device = key.split(":")[1].split("-")[0];
                                friendlyName = wemo.items[ device+'NotPresent'];
                        }
                    		else friendlyName = av_switches['"'+key+'"'];
                    	}
                    }
                    
                    if(isKeychainButtonRule || isKeychainPresenseRule){
                    	var startState = "";
                    	if(isKeychainButtonRule){
                        	startState = wemo.items['SwitchToggleSelected'];
                        }
                    	else{
                    		startState = wemoUtil.returnSwitchStatus(rule.Devices[key].StartAction);
                    	}
                    	switchList +="<li><div class='rule_img'><img src='"+iconURL+"'></div>"+
                        "<div class='rule_details_device'>"+
                        "<div class='rule_details_device_name'>"+friendlyName+"</div>" +
                        "<div ><span>"+startState+"</span></div>"+
                        "</div></li>";
                    }
                    else{

                    if (rule.Devices[key].SensorDuration > 1 ) {
                        //Duration
                        console.log("Duration");
                        var Startstate = wemoUtil.returnSwitchStatus(rule.Devices[key].StartAction);
                        var Endstate = wemoUtil.returnSwitchVal(rule.Devices[key].StartAction);
                        var stateClass = '';
                        var n=Startstate.split(" ");
                        Startstate ="<span class='first'>"+n[0]+"</span>";
                        if(n[1] != undefined){
                            Startstate +="<span class='second'>"+" "+n[1]+"</span>";
                        }
                        var n=Endstate.split(" ");
                        Endstate ="<span class='third'>"+n[0]+"</span>";
                        if(n[1] != undefined){
                            Endstate +="<span class='four'>"+" "+n[1]+"</span>";
                        }
                        if(rule.Devices[key].StartAction == 1){
                            stateClass = ' green';
                        }else{
                            stateClass = ' black';
                        }
                        var afterMotionStop = wemo.items['AfterMotionStops'];

                        var n = wemoUtil.formatMins(rule.Devices[key].SensorDuration).split(" ");
                        if(n[0] != undefined){
                            n = n[0];
                        }
                        if(n==0){n=15;}
                        var string = (n == "1hr") ? "1 " + wemo.items['hour'] : n + " "+ wemo.items['minutes'];

                        switchList +="<li><div class='rule_img'><img src='"+iconURL+"'></div>"+
                            "<div class='rule_details_device'>"+
                            "<div class='rule_details_device_name'>"+friendlyName+"</div>" +
                            "<div class='rule_details_state "+stateClass+"'><span class='state'>"+Startstate+"</span></div>"+
                            "<div>"+Endstate+" for <span class='lowerCase'>"+string+"<br><span class='lowerCase'>"+afterMotionStop+"</span></span></div>"+
                            "</div></li>";

                    } else if ( parseInt( rule.Devices[key].StartAction, 10) == 0 ) {
                        //Off
                        console.log("Turn off");
                        var Startstate = wemoUtil.returnSwitchStatus(rule.Devices[key].StartAction);

                        switchList +="<li><div class='rule_img'><img src='"+iconURL+"'></div>"+
                            "<div class='rule_details_device'>"+
                            "<div class='rule_details_device_name'>"+friendlyName+"</div>" +
                            "<div class='rule_details_state green'><span class='state'>"+Startstate+"</span></div>"+
                            "</div></li>";

                    } else {
                        //Cases : Don't turn off OR turn off immediately
                        console.log("Cases : Don't turn off OR turn off immediately ");
                        var Startstate = wemoUtil.returnSwitchStatus(rule.Devices[key].StartAction);
                        var n=Startstate.split(" ");
                        Startstate ="<span class='first'>"+n[0]+"</span>";
                        if(n[1] != undefined){
                            Startstate +="<span class='second'>"+" "+n[1]+"</span>";
                        }
                        console.log("rule.Devices[key].SensorDuration "+rule.Devices[key].SensorDuration);
                        var string;
                        switch ( parseInt( rule.Devices[key].SensorDuration, 10) ) {
                            case 0: string = "don't turn off"; break;
                            case 1: string = "turn off immediately"; break;
                            default: string = "unknown action";
                        }

                        var afterMotionStop = wemo.items['AfterMotionStops'];

                        switchList +="<li><div class='rule_img'><img src='"+iconURL+"'></div>"+
                            "<div class='rule_details_device'>"+
                            "<div class='rule_details_device_name'>"+friendlyName+"</div>" +
                            "<div class='rule_details_state green'><span class='state'>"+Startstate+"</span></div>"+
                            "<div><span class='lowerCase'>"+string+"<br><span class='lowerCase'>"+afterMotionStop+"</span></span></div>"+
                            "</div></li>";
                    }
                }

                }
                var sens = rule.SelectedSensors;
//                var sensorImg = '';
//
//                 if (devices[key]) {
//                    sensorImg = devices[key].icon;
//                 }
//
//
//                nativeUtilPlugin.execute(
//                    function(base64String){
//                        console.log('got image from DB success');
//                        sensorImg = "data:image/png;base64, " + base64String;
//                    },
//                    rule_details.reportError,
//                    actions.GET_BASE64_IMAGE_FROM_DB,
//                    [sens]
//                );


                if(Object.keys(rule.Sensors).length>0){
                	for(var uuid in rule.Sensors){
                    var sensorImg = '';
                    var udn = wemoUtil.isMakerDevice(uuid)? wemoUtil.getOriginalMakerUDN(uuid) : uuid;
                    if (devices[udn]) {
                        sensorImg = devices[udn].icon;
                    }

                    if(av_sensors['"'+uuid+'"'] == undefined && homesense_sensors[uuid] == undefined){
                        if(uuid.indexOf('NetCamSensor') != -1){
                            sensorfriendlyName = wemo.items['NetCamNotPresent'];
                        }else{
                            sensorfriendlyName = wemo.items['SensorNotPresent'];
                        }
                    }
                    else {
                    	if(av_sensors['"'+uuid+'"'] != undefined) sensorfriendlyName = av_sensors['"'+uuid+'"'];
                        else if(homesense_sensors[uuid] != undefined) sensorfriendlyName = homesense_sensors[uuid].fName;
                    }

//                    nativeUtilPlugin.execute(
//                        function(base64String){
//                            console.log('got image from DB success');
//                            sensorImg = "data:image/png;base64, " + base64String;
//                        },
//                        rule_details.reportError,
//                        actions.GET_BASE64_IMAGE_FROM_DB,
//                        [uuid]
//                    );

                    if(uuid.indexOf('NetCamSensor') != -1){
                        sensorfriendlyName = wemoUtil.extractNetCamName(sensorfriendlyName);
                    }

                    if(sensorImg === null || sensorImg == ''){

                        if(uuid.indexOf('Sensor') != -1){

                            sensorImg="../img/new_icons/WeMo_Motion_@3x.png";
                        }

                        if(uuid.indexOf('NetCamSensor') != -1){
                        	
                        	
                        	if(allSensorImage[uuid])
                        		{
                        		sensorImg = allSensorImage[uuid];
                        		}
                        	else
                        		{

//                                    if(devices[uuid].information.ssid.indexOf('HD') > -1){
                                        sensorImg = "../img/ic_netcam_HD.png";
//                                    } else {
//                                        sensorImg = "../img/ic_netcam_nobg@2x.png";
//                                    }
                        		}
                        	
            				
                        }
                    }

                    var sensorStrength = wemoUtil.returnSensorStrength(rule.SelectedSensorsValue);
                    var triggerredBy = wemo.items['TriggerredBy'];

                    if(sensorStrength == "Very High"){sensorStrength = wemo.items['VeryHigh'];}
                    else if(sensorStrength == "High"){sensorStrength = wemo.items['High'];}
                    else if(sensorStrength == "Medium"){sensorStrength = wemo.items['Medium'];}
                    else if(sensorStrength == "Low"){sensorStrength = wemo.items['Low'];}
                    else if(sensorStrength == undefined){sensorStrength = '';}

                    var sensorState ='';

                    if(isKeychainButtonRule){
                    	sensorState = wemo.items['KeychainButtonSelected'];
                    } else if(isKeychainPresenseRule){
                    	if(rule.Sensors[uuid].state == keyChainRuleActionValues.ARRIVES){
                    		sensorState = wemo.items['FobSensorArrives'];	
                    	}
                    	else if(rule.Sensors[uuid].state == keyChainRuleActionValues.LEAVES){
                    		sensorState = wemo.items['FobSensorLeaves'];	
                    	}
                    	
                    }
                    	sensorList +="<li><div class='rule_img'><img src='"+sensorImg+"'></div>"+
                        "<div class='rule_details_device'>"+
                        "<div>"+triggerredBy+"</div>" +
                        "<div>"+sensorfriendlyName+"</div>"+
                        "<div>"+sensorState+"</div>"+
                        "<div>"+sensorStrength+"</div>"+
                        "</div></li>";
                    	
                    

                }
            }
            }
        }
        else if (rule.RuleType == sessionStore.EVENT_CONTROLLED) {

//            //----------------------Disable SRSS Link in More Meneu -------------------------------//
                var displayDate = "";

                var tempStartTime = "" + rule.When.StartTime;
                if (tempStartTime.slice(-1) == "1") {
                    rule.When.StartSRSS = "Sunrise";
                } else if (tempStartTime.slice(-1) == "2") {
                    rule.When.StartSRSS = "Sunset";
                }
//
//
                var tempEndTime = "" + parseInt(parseInt(rule.When.RuleDuration) + parseInt(rule.When.StartTime));

                console.log(rule.RuleType + "  SRSS:  " + tempEndTime + "  :: Rule Duration  " + parseInt(rule.When.RuleDuration) + "  STIME ::  " + parseInt(rule.When.StartTime));
                if (tempEndTime.slice(-1) == "1") {
                    rule.When.EndSRSS = "Sunrise";
                } else if (tempEndTime.slice(-1) == "2") {
                    rule.When.EndSRSS = "Sunset";
                }


                rule.When.EndTime = parseInt(rule.When.StartTime) + parseInt(rule.When.RuleDuration);
                if (parseInt(rule.When.EndTime) > 86400) {
                    rule.When.EndTime = parseInt(rule.When.EndTime - 86400);
                }

                if (parseInt(rule.When.EndTime) != timestamp.MIDNIGHT_END_TIME) rule.When.EndTime = (Math.ceil((rule.When.EndTime / 10))) * 10;
                console.log("tempStartTime :: " + tempStartTime + "  tempEndTime :: " + tempEndTime + "  ST SRSS :: " + rule.When.StartSRSS + '    End SRSS :: ' + rule.When.EndSRSS + '  End Time ' + rule.When.EndTime);
                if (rule.When.StartSRSS == undefined && rule.When.EndSRSS == undefined) {
                    if (rule.When.StartTime == sessionStore.ALLDAY_STARTTIME && rule.When.EndTime == sessionStore.ALLDAY_ENDTIME) {
                        displayDate = sessionStore.SENSOR_ALLDAY + ", "
                    } else {
                        if (rule.When.EndTime != timestamp.MIDNIGHT_END_TIME) displayDate = wemoUtil.returnTime(rule.When.StartTime, (Math.ceil((rule.When.RuleDuration / 10))) * 10);
                        else displayDate = wemoUtil.returnTime(rule.When.StartTime, rule.When.RuleDuration);
                    }
                } else if (rule.When.StartSRSS == undefined && rule.When.EndSRSS != undefined) {

                    if (rule.When.EndSRSS == "Sunrise") {
                        var tempEndSRSS = wemo.items['SunRise'];
                    }
                    else if (rule.When.EndSRSS == "Sunset") {
                        var tempEndSRSS = wemo.items['SunSet'];
                    }
                    else {
                        var tempEndSRSS = rule.When.EndSRSS;
                    }

                    var offsetOff = rule_details.convertDBOffsetToString(rule.When.OffModeOffset) + " ";
                    if (offsetOff == undefined) offsetOff = "";
                    rule.When.offSRSS_Title = offsetOff + tempEndSRSS;

                    displayDate = (wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24) + " - <span class='capitalize'>" + offsetOff + tempEndSRSS) + "</span>, ";
                } else if (rule.When.StartSRSS != undefined && rule.When.EndSRSS == undefined) {

                    if (rule.When.StartSRSS == "Sunrise") {
                        var tempStartSRSS = wemo.items['SunRise'];
                    }
                    else if (rule.When.StartSRSS == "Sunset") {
                        var tempStartSRSS = wemo.items['SunSet'];
                    }
                    else {
                        var tempStartSRSS = rule.When.StartSRSS;
                    }

                    var offsetOn = rule_details.convertDBOffsetToString(rule.When.OnModeOffset) + " ";
                    if (offsetOn == undefined) offsetOn = "";
                    rule.When.onSRSS_Title = offsetOn + tempStartSRSS;

                    displayDate = "<span class='capitalize'>" + (offsetOn + tempStartSRSS + "</span> - " + wemoUtil.convertMillisecondsToTF(rule.When.EndTime, UP_TF_IS24)) + ", ";
                } else if (rule.When.StartSRSS != undefined && rule.When.EndSRSS != undefined) {

                    if (rule.When.StartSRSS == "Sunrise") {
                        var tempStartSRSS = wemo.items['SunRise'];
                    }
                    else if (rule.When.StartSRSS == "Sunset") {
                        var tempStartSRSS = wemo.items['SunSet'];
                    }
                    else {
                        var tempStartSRSS = rule.When.StartSRSS;
                    }

                    if (rule.When.EndSRSS == "Sunrise") {
                        var tempEndSRSS = wemo.items['SunRise'];
                    }
                    else if (rule.When.EndSRSS == "Sunset") {
                        var tempEndSRSS = wemo.items['SunSet'];
                    }
                    else {
                        var tempEndSRSS = rule.When.EndSRSS;
                    }

                    var offsetOn = rule_details.convertDBOffsetToString(rule.When.OnModeOffset) + " ";
                    var offsetOff = rule_details.convertDBOffsetToString(rule.When.OffModeOffset) + " ";
                    if (offsetOn == undefined) offsetOn = "";
                    if (offsetOff == undefined) offsetOff = "";
                    rule.When.onSRSS_Title = offsetOn + tempStartSRSS;
                    rule.When.offSRSS_Title = offsetOff + tempEndSRSS;

                    displayDate = "<span class='capitalize'>" + (offsetOn + tempStartSRSS + " - " + offsetOff + tempEndSRSS) + "</span>, ";
                }
//
//
//            //----------------------Disable SRSS Link in More Meneu -------------------------------//
//
//
                /*Temp display Localization values */

                var rulenameObj = rule.RuleName;
                var tempDisRulename = "";

                if (rulenameObj.indexOf("Rule") != -1) {
                    tempDisRulename = rulenameObj.replace("Rule", wemo.items["Rule"]);
                } else {
                    tempDisRulename = rulenameObj;
                }
                var currentlyActive = wemo.items['RuleStateActive'];

                $(".ruleTitle").html(tempDisRulename);

//                heading = "<label><span class='label upperCase'>rule name</span></label><hr class='divider'>" +
//                    "<div class='rule'>" +
//                    "<div class='rule_heading rule_heading_withBtn'>" + tempDisRulename + "</div>" +
//
//                    "<div class='rule_btn_DisableOrEnable'>" +
//                    "<a id='rule_disable' data-theme='b' data-role='button'><span>Disable Rule</span></a>" +
//                    "<a id='rule_enable' data-theme='b' data-role='button'><span>Enable Rule</span></a></div>" +
//
//                    "</div>" +
//                    "<br><div style='margin-top: 20px'><!--<div class='enabled_rules_active ruleDisable'>" + currentlyActive + "</div><br>-->" + ruleDisclaimer + "<label><span class='label upperCase'>turn on/off</span></label><hr class='divider'></div>";

                //turn on/off

                timeAt = "<p class='rule_details'><span class='rule_time'>" + displayDate + "</span><span class='rule_day'>" + days + "</span></p>";

                if (Object.keys(rule.Devices).length > 0) {

                    for (key in rule.Devices) {

                        var iconURL = "",
                            udn = wemoUtil.isMakerDevice(key) ? wemoUtil.getOriginalMakerUDN(key) : key;
                        iconURL = devices[udn].icon;

                        if (iconURL === null || iconURL == '') {
                            if (key.indexOf('Lightswitch') != -1) {
                                iconURL = "../img/new_icons/WeMo_LightSwitch_@3x.png";
                            }
                            if (key.indexOf('Socket') != -1) {
                                iconURL = "../img/new_icons/WeMo_Switch_Old_@3x.png";
                            }
                            if (key.indexOf('Insight') != -1) {
                                iconURL = "../img/new_icons/WeMo_Insight_Switch_@3x.png";
                            }
                            if (key.indexOf('Sensor') != -1) {
                                iconURL = "../img/new_icons/WeMo_Motion_@3x.png";
                            }
                            if (key.indexOf('Maker') != -1) {
                                iconURL = "../img/new_icons/WeMo_Maker_@3x.png";
                            }
                            if (key.indexOf('Dimmer') != -1) {
                                iconURL = "../img/new_icons/WeMo_Dimmer_@3x.png";
                            }
                        }

                        if (wemoUtil.isMakerDevice(key)) {
                            changedUDN = wemoUtil.getOriginalMakerUDN(key);
                            if (av_makers['"' + changedUDN + '"'] == undefined) {
                                friendlyName = wemo.items['MakerNotFound'];
                            } else {
                                friendlyName = av_makers['"' + changedUDN + '"'].name;
                            }
                        }
                        else {
                            if (av_switches['"' + key + '"'] == undefined) {
                                friendlyName = wemo.items['SwitchNotFound'];
                            }
                            else friendlyName = av_switches['"' + key + '"'];
                        }

                        var Startstate = wemoUtil.returnSwitchStatus(rule.Devices[key].StartAction);

                        switchList += "<li><div class='rule_img'><img src='" + iconURL + "'></div>" +
                            "<div class='rule_details_device'>" +
                            "<div class='rule_details_device_name'>" + friendlyName + "</div>" +
                            "<div class='rule_details_state green'><span class='state'>" + Startstate + "</span></div>" +
                            "</div></li>";
                    }
                }


                for (var udn in rule.nests) {
                    var nestImg = '';
                    var nestFriendlyName = '';

                    if (av_nests['"' + udn + '"'] == undefined) {
                        //sensorfriendlyName = wemo.items['SensorNotPresent'];
                        nestFriendlyName = "Thermostat Not Present";
                    } else {
                        nestFriendlyName = av_nests['"' + udn + '"'].fname + "(" + av_nests['"' + udn + '"'].parentName + ")";
                        console.log("nestFriendlyName");
                        console.log(nestFriendlyName);
                        console.log(av_nests);
                        console.log(udn);
                    }


                    var awayState = rule.nests[udn].awayState;

                    if(awayState === "away"){
                        nestImg = "../img/nest_rules_away@3x.png";
                    } else {
                        nestImg = "../img/nest_rules_home@3x.png";
                    }

                    sensorList += "<li><div class='rule_img'><img src='" + nestImg + "'></div>" +
                        "<div class='rule_details_device'>" +
                        "<div>" + nestFriendlyName + "</div>" +
                        "<div class='nestRule_awayState'>" + awayState + "</div>" +
                        "</div></li>";

                }

            }
        else if(rule.RuleType == sessionStore.MAKER_MOTION_CONTROLLED){
            //----------------------Disable SRSS Link in More Meneu -------------------------------//
            var displayDate = "";
            var tempStartTime = ""+rule.When.StartTime;
            if(tempStartTime.slice(-1) == "1"){
                rule.When.StartSRSS = "Sunrise";
            }else if(tempStartTime.slice(-1) == "2"){
                rule.When.StartSRSS = "Sunset";
            }
            var tempEndTime = ""+parseInt(parseInt(rule.When.RuleDuration)+parseInt(rule.When.StartTime));
            console.log(rule.RuleType+"  SRSS:  "+tempEndTime+"  :: Rule Duration  "+parseInt(rule.When.RuleDuration)+"  STIME ::  "+parseInt(rule.When.StartTime));
            if(tempEndTime.slice(-1) == "1"){
                rule.When.EndSRSS = "Sunrise";
            }else if(tempEndTime.slice(-1) == "2"){
                rule.When.EndSRSS = "Sunset";
            }
            rule.When.EndTime=parseInt(rule.When.StartTime)+parseInt(rule.When.RuleDuration);
            if (parseInt(rule.When.EndTime)>86400){
                rule.When.EndTime=parseInt(rule.When.EndTime-86400);
            }
            if (rule.When.EndTime!=timestamp.MIDNIGHT_END_TIME) rule.When.EndTime=(Math.ceil((rule.When.EndTime/10)))*10;
            console.log("tempStartTime :: "+tempStartTime+"  tempEndTime :: "+tempEndTime+"  ST SRSS :: "+ rule.When.StartSRSS+'    End SRSS :: '+ rule.When.EndSRSS+'  End Time '+rule.When.EndTime);
            if (rule.When.StartSRSS==undefined && rule.When.EndSRSS==undefined){
                if (rule.When.StartTime==sessionStore.ALLDAY_STARTTIME && rule.When.EndTime==sessionStore.ALLDAY_ENDTIME){
                    displayDate=sessionStore.SENSOR_ALLDAY+", "
                    		console.log("display date 1:"+displayDate);
                }else{
                    if (rule.When.EndTime!=timestamp.MIDNIGHT_END_TIME) displayDate= wemoUtil.returnTime(rule.When.StartTime, (Math.ceil((rule.When.RuleDuration/10)))*10);
                    else
                    	displayDate= wemoUtil.returnTime(rule.When.StartTime, rule.When.RuleDuration);
       
                }
            }else if (rule.When.StartSRSS==undefined && rule.When.EndSRSS!=undefined) {
                if(rule.When.EndSRSS == "Sunrise")
                {
                    var tempEndSRSS = wemo.items['SunRise'];
                }
                else if(rule.When.EndSRSS == "Sunset")
                {
                    var tempEndSRSS = wemo.items['SunSet'];
                }
                else{var tempEndSRSS = rule.When.EndSRSS;}
                var offsetOff = rule_details.convertDBOffsetToString(rule.When.OffModeOffset)+" ";
                if ( offsetOff == undefined ) offsetOff = "";
				rule.When.offSRSS_Title = offsetOff + tempEndSRSS;
                displayDate=(wemoUtil.convertMillisecondsToTF(rule.When.StartTime, UP_TF_IS24)+" - <span class='capitalize'>"+offsetOff+tempEndSRSS)+"</span>, ";
               
            }else if (rule.When.StartSRSS!=undefined && rule.When.EndSRSS==undefined) {
                if(rule.When.StartSRSS == "Sunrise")
                {
                    var tempStartSRSS = wemo.items['SunRise'];
                }
                else if(rule.When.StartSRSS == "Sunset")
                {
                    var tempStartSRSS = wemo.items['SunSet'];
                }
                else{var tempStartSRSS = rule.When.StartSRSS;}
                var offsetOn = rule_details.convertDBOffsetToString(rule.When.OnModeOffset)+" ";
                if ( offsetOn == undefined ) offsetOn = "";
				rule.When.onSRSS_Title = offsetOn + tempStartSRSS;
                displayDate="<span class='capitalize'>"+(offsetOn+tempStartSRSS+"</span> - "+wemoUtil.convertMillisecondsToTF(rule.When.EndTime, UP_TF_IS24))+", ";
             
            }else if (rule.When.StartSRSS!=undefined && rule.When.EndSRSS!=undefined) {
                if(rule.When.StartSRSS == "Sunrise")
                {
                    var tempStartSRSS = wemo.items['SunRise'];
                }
                else if(rule.When.StartSRSS == "Sunset")
                {
                    var tempStartSRSS = wemo.items['SunSet'];
                }
                else{var tempStartSRSS = rule.When.StartSRSS;}
                if(rule.When.EndSRSS == "Sunrise")
                {
                    var tempEndSRSS = wemo.items['SunRise'];
                }
                else if(rule.When.EndSRSS == "Sunset")
                {
                    var tempEndSRSS = wemo.items['SunSet'];
                }
                else{var tempEndSRSS = rule.When.EndSRSS;}
                var offsetOn = rule_details.convertDBOffsetToString(rule.When.OnModeOffset)+" ";
                var offsetOff = rule_details.convertDBOffsetToString(rule.When.OffModeOffset)+" ";
                if ( offsetOn == undefined ) offsetOn = "";
                if ( offsetOff == undefined ) offsetOff = "";
				rule.When.onSRSS_Title = offsetOn + tempStartSRSS;
				rule.When.offSRSS_Title = offsetOff + tempEndSRSS;
                displayDate="<span class='capitalize'>"+(offsetOn+tempStartSRSS+" - "+offsetOff+tempEndSRSS)+"</span>, ";
            }
            console.log("display date5 :"+displayDate);
            //----------------------Disable SRSS Link in More Meneu -------------------------------//
            /*Temp display Localization values */
            var rulenameObj = rule.RuleName;
            var tempDisRulename ="";
            if(rulenameObj.indexOf("Rule") != -1)
            {
                tempDisRulename = rulenameObj.replace("Rule",wemo.items["Rule"]);
            }else{
                tempDisRulename = rulenameObj;
            }
            var currentlyActive = wemo.items['RuleStateActive'];

            $(".ruleTitle").html(tempDisRulename);
//            turn on/off

			timeAt = "<p class='rule_details'><span class='rule_time'>"+displayDate+"</span><span class='rule_day'>"+days+"</span></p>";
            if(Object.keys(rule.Devices).length>0){
                for(key in rule.Devices){

                   var iconURL = "",
                       udn =  wemoUtil.isMakerDevice(key)? wemoUtil.getOriginalMakerUDN(key) : key;
                   if (devices[udn] && devices[udn].groupIcon !== "") {
                        iconURL = devices[key].groupIcon;
                   } else if (devices[udn] && devices[udn].groupID === "" ) {
                       iconURL = devices[udn].icon;
                   }

                    if(rule.Devices[key].SelectedLedValue == 1)
                    {
                    	var arrLedsIcon = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DEVICE_LED_ICON);
                    	var leddeviceIconCached = rule_details.checkLedDeviceIconfromCache(key);
                    	
                    	if(arrLedsIcon != undefined && arrLedsIcon != "")
                        {
                    		 $.each(arrLedsIcon, function(index, value) {
                                 if(key == index)
                    				 iconURL = value;
                             });

                        }
                    	if(iconURL == "" || iconURL == undefined)
                    	{
                    		if(leddeviceIconCached != undefined && leddeviceIconCached != "")
                        	{
                        		iconURL = leddeviceIconCached;
                        	}	
                        	else 
                        	{
                                if(av_leddevices[key] !== undefined){
                                    switch (rule.Devices[key].deviceInformation.modelCode) {
                                        case "LIGHTIFY A19 Tunable White":
                                            iconURL = "../img/bulb_lightify_a19_tunable_white.png";
                                            break;
                                        case "LIGHTIFY Gardenspot RGB":
                                            iconURL = "../img/bulb_gardenspot_rgb.png";
                                            break;
                                        case "LIGHTIFY Flex RGBW":
                                            iconURL = "../img/bulb_osram_flex_rgbw.png";
                                            break;
                                        case "iQBR30":
                                            iconURL = "../img/bulb_osram_sylvania_iqbr30.png";
                                            break;
                                        case "Connected A-19 60W Equivalent":
                                            iconURL = "../img/bulb_cree_connected_a-19_60w_equivalent.png";
                                            break;
                                        default:
                                            iconURL = "../img/new_icons/WeMo_LightBulb_@3x.png";
                                            break;
                                    }
                                } else {
                                    iconURL = "../img/new_icons/WeMo_LightBulb_@3x.png";
                                }
                        	}
                    	}

                    }
                    else
                    {

//                    	nativeUtilPlugin.execute(
//                    			function(base64String){
//                    				console.log('got image from DB success');
//                    				iconURL = "data:image/png;base64, " + base64String;
//                    			},
//                    			rule_details.reportError,
//                    			actions.GET_BASE64_IMAGE_FROM_DB,
//                    			[key]
//                    	);

                    	if(iconURL === null || iconURL == ''){
                    		if(key.indexOf('Lightswitch') != -1){
                    			iconURL="../img/new_icons/WeMo_LightSwitch_@3x.png";
                    		}
                            if (key.indexOf('Dimmer') != -1) {
                                iconURL = "../img/new_icons/WeMo_Dimmer_@3x.png";
                            }
                    		if(key.indexOf('Socket') != -1){
                    			iconURL="../img/new_icons/WeMo_Switch_Old_@3x.png";
                    		}
                    		if(key.indexOf('Insight') != -1){
                    			iconURL="../img/new_icons/WeMo_Insight_Switch_@3x.png";
                    		}
                    		if(key.indexOf('Maker') != -1){
                    			iconURL="../img/new_icons/WeMo_Maker_@3x.png";
                    		}
                    	}
                    }
                    var changedUDN;
                    console.log("SelectedLedValue2***"+rule.Devices[key].SelectedLedValue+"---"+JSON.stringify(av_leddevices));
                    if(rule.Devices[key].SelectedLedValue == 1)
                    {
                        console.log("av_leddevices[key] "+av_leddevices[key]);
                        if(av_leddevices[key] == undefined) 
                        {
                        	var rgx = /[^0-9]/;
                            
                            if(key.search(rgx) === -1) {
                            	friendlyName=wemo.items['groupNotPresent'];	                	
                			}
                            else
                            	friendlyName=wemo.items['bulbNotPresent'];
                        }
                        else friendlyName = av_leddevices[key];
                        
                    }
                    else
                    {
                    	if(wemoUtil.isMakerDevice(key)){
                    		changedUDN = wemoUtil.getOriginalMakerUDN(key);
                    		console.log("KEY: "+ key+" ChangedUdn: "+ changedUDN);
                    		if(av_makers['"'+changedUDN+'"'] == undefined) {
                    			changedUDN = wemoUtil.getFaultyMakerUDN(key);
                    			console.log("KEY: "+ key+" ChangedUdn: "+ changedUDN);
                    			if(av_makers['"'+changedUDN+'"'] == undefined)
                    				friendlyName= wemo.items['MakerNotFound'];
                    			else friendlyName = av_makers['"'+changedUDN+'"'].name;
                    		}
                    		else friendlyName = av_makers['"'+changedUDN+'"'].name;
                    	}
                    	else {
                    		if(av_switches['"'+key+'"'] === undefined || !devices[udn].isDiscovered) {
                                var device = key.split(":")[1].split("-")[0];
                                friendlyName = wemo.items[ device+'NotPresent'];
                    		}
                    		else friendlyName = av_switches['"'+key+'"'];
                    	}
                    }
                    
                    
                    if (rule.Devices[key].SensorDuration > 1 ) {
                        //Duration
                        console.log("Duration");

                        var n = wemoUtil.formatMins(rule.Devices[key].SensorDuration).split(" ");
                        if(n[0] != undefined){
                            n = n[0];
                        }
                        if(n==0){n=15;}
                        var string = (n == "1hr") ? "1 " + wemo.items['hour'] : n + " "+ wemo.items['minutes'];

                        var Startstate = wemo.items['OnWithMotion'] + ' + '+ string;
                        switchList +="<li><div class='rule_details_device_container'>" + "<div class='rule_img'><img src='"+iconURL+"'></div>"+
						"<div class='rule_details_device'>"+
						"<div class='rule_details_device_name'>" +friendlyName+ "</div>" +
						"<div class='gray_text'><span >"+Startstate+"</span></div>"+
						"</div>" + "</div></li>";

                    } else if ( parseInt( rule.Devices[key].StartAction, 10) == 0 ) {
                        //Off
                        console.log("Turn off");
                        var Startstate = wemo.items['off'];
						switchList +="<li><div class='rule_img'><img src='"+iconURL+"'></div>"+
						"<div class='rule_details_device'>"+
						"<div class='rule_details_device_name'>"+friendlyName+"</div>" +
						"<div class='gray_text'><span >"+Startstate+"</span></div>"+						
						"</div></li>";

                    } else {
                        //Cases : Don't turn off OR turn off immediately
                        console.log("Cases : Don't turn off OR turn off immediately ");
                        var string;
                        switch ( parseInt( rule.Devices[key].SensorDuration, 10) ) {
                            case 0: string = "don't turn off"; break;
                            case 1: string = "turn off immediately"; break;
                            default: string = "unknown action";
                        }

                        var Startstate = wemo.items['on'] + ', '+ string;

                        switchList +="<li><div class='rule_details_device_container'>" + "<div class='rule_img'><img src='"+iconURL+"'></div>"+
						"<div class='rule_details_device'>"+
						"<div class='rule_details_device_name'>" +friendlyName+ "</div>" +
						"<div class='gray_text'><span >"+Startstate+"</span></div>"+
						"</div>" + "</div></li>";
                    }
                }
                if(Object.keys(rule.Sensors).length>0){
                	for(uuid in rule.Sensors){
                		var sensorImg = '';
                		var udn = wemoUtil.isMakerDevice(uuid)? wemoUtil.getOriginalMakerUDN(uuid) : uuid;
                		if (devices[udn]) {
                		    sensorImg = devices[udn].icon;
                		}

                		var sensorState = '';
                		var changedUDN = wemoUtil.getOriginalMakerUDN(uuid);
                		if(av_makers['"'+changedUDN+'"'] == undefined) {
                			sensorfriendlyName= wemo.items['MakerNotFound'];

                    		changedUDN = wemoUtil.getFaultyMakerUDN(key);
                    		if(av_makers['"'+changedUDN+'"'] == undefined)
                    			sensorfriendlyName= wemo.items['MakerNotFound'];
                    		else {
                    			sensorfriendlyName = av_makers['"'+changedUDN+'"'].name;
                    			if(av_makers['"'+changedUDN+'"'].SensorPresent == "0"){
                    				showTroubleAlert = true;
                    			}
                    		}
                		}
                		else {
                			sensorfriendlyName = av_makers['"'+changedUDN+'"'].name;
                			if(av_makers['"'+changedUDN+'"'].SensorPresent == "0"){
                				showTroubleAlert = true;
                			}
                		}
                		if(rule.Sensors[uuid]['state'] == 1){
                			sensorState = wemo.items['SensorOpen'];
                		}
                		else{
                			sensorState = wemo.items['SensorClosed'];
                		}
//              		if(av_sensors['"'+arrSensors[sen]+'"'] == undefined){
//              		if(uuid.indexOf('NetCamSensor') != -1){
//              		sensorfriendlyName = wemo.items['NetCamNotPresent'];
//              		}else{
//              		sensorfriendlyName = wemo.items['SensorNotPresent'];	
//              		}
//              		}
//              		else sensorfriendlyName = av_sensors['"'+arrSensors[sen]+'"'];
//                		nativeUtilPlugin.execute(
//                				function(base64String){
//                					console.log('got image from DB success');
//                					sensorImg = "data:image/png;base64, " + base64String;
//                				},
//                				rule_details.reportError,
//                				actions.GET_BASE64_IMAGE_FROM_DB,
//                				[uuid]
//                		);
                		if(sensorImg === null || sensorImg == ''){
                			if(uuid.indexOf('Maker') != -1){
                				sensorImg="../img/new_icons/WeMo_Maker_@3x.png";
                			}
                			if(uuid.indexOf('NetCamSensor') != -1){
//                                if(devices[uuid].information.ssid.indexOf('HD') > -1){
                                    sensorImg = "../img/ic_netcam_HD.png";
//                                } else {
//                                    sensorImg = "../img/ic_netcam_nobg@2x.png";
//                                }
                			}
                		}
                		var sensorStrength = wemoUtil.returnSensorStrength(rule.SelectedSensorsValue);
                		var triggerredBy = wemo.items['TriggerredBy'];
                		if(sensorStrength == "Very High"){sensorStrength = wemo.items['VeryHigh'];}
                		else if(sensorStrength == "High"){sensorStrength = wemo.items['High'];}
                		else if(sensorStrength == "Medium"){sensorStrength = wemo.items['Medium'];}
                		else if(sensorStrength == "Low"){sensorStrength = wemo.items['Low'];}
                		else if(sensorStrength == undefined){sensorStrength = '';}
                		sensorList +="<li><div class='rule_img'><img src='"+sensorImg+"'></div>"+
                		"<div class='rule_details_device'>"+
                		"<div>"+triggerredBy+"</div>" +
                		"<div class='bold'>"+sensorfriendlyName+"</div>"+
                		"<div>"+sensorState+"</div>"+
                		"</div></li>";
                	}
                }
            }
        }
	

         $(switchDetails).append(switchList+sensorList);

         $("#timeAt").html(timeAt);
         $("#rule_details_page .rule_detail_container").show();


        if(rule.State == '0'){
            console.log("rule.State == '0'");
            rule_details.checkIfFirmwareSupported(rule);
            $("#change_rule_state").addClass("disable");
        }


        $("#change_rule_state").on("tap",function(){

            $("#change_rule_state").toggleClass("disable");

            var selectedRuleState = $("#change_rule_state").hasClass("disable") ? 0: 1;
            var rule=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);

            if (selectedRuleState === 1) {
                // disable rule
                rule_details.bindDisableEnableRule(db, rule, 0, selectedRuleID);
            } else {

                // enable rule
                var disabled_ruleId = rule.id;
                var ruleId_disable = window.sessionStorage.getItem("rule_id_disable");
                if(disabled_ruleId === ruleId_disable){
                     setTimeout(function () {
                         $("#fw_ver_check").popup("open");
                     },
                     300
                 );
                    window.sessionStorage.removetItem("disabled_rule_id");
                }
                var isSupported = rule_details.isMakerSensorFirmwareSupported(rule);
                if(isSupported == "false"){
                    $("#maker_sensor_firmware_upgrade").popup('open');
                }else if(isFWSupported != "false"){
                    if(rule.RuleType == sessionStore.MAKER_MOTION_CONTROLLED && showTroubleAlert == true){
                        $("#rule_cannot_save_dlg").popup('open');
                    } else{
                        rule_details.bindDisableEnableRule(db, rule, 1, selectedRuleID);
                    }
                }
            }

        });
		//FW Compatibility based upgrade
		$("#update_nw_btn").on("click", function(){
			if (!isRemoteEnabled)
				deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
			wemoUtil.loadUrl(filePath.MORE_NEW_FIRMWARE);
			$("#fw_ver_check" ).popup( "close" );
		});

		$("#later_btn").on("click", function(){
			$("#fw_ver_check" ).popup( "close" );
			wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
			if ( !timer_rule.isSimpleWhen(x) ) {
				if(soCheck == "1"){
					timer_rule.saveNewTimerRule_RULES_RULEDEVICES_SO(x.RuleType, x);
				}
				else{
					saveNewTimerRule_RULES_RULEDEVICES(x.RuleType, x);
				}

			} else {
				saveNewRule_RULES_RULEDEVICES(x.RuleType, x);
			}
		});
        

        var StartTime = parseInt(rule.When.StartTime);

        if(rule.State == '1'){
            var strDays = rule.SelectedDayOrRange;
            var StartTime = rule.startingTime;
            var EndTime = rule.endingTime;
            rule_details.ruleStatus(StartTime,EndTime,strDays);
        }

//        if(rule.State == '0'){
//            var ruleStateDisabled = wemo.items['RuleStateDisabled'];
//            $('.rule').append("<p class='rule_time'>"+ruleStateDisabled+"</p>");
//        }
        $("#rule_cannot_save_dlg").popup();
        $("#rule_cannot_save_ok_button").on("click", function (e) {
			$("#rule_cannot_save_dlg").popup('close');
			 e.preventDefault();
		});
        $("#maker_sensor_firmware_upgrade").popup();
        $("#maker_sensor_firmware_upgrade_updatenow").on("click", function (e) {
        	wemoUtil.loadUrl(filePath.MORE_NEW_FIRMWARE);
			$("#maker_sensor_firmware_upgrade").popup('close');
			 e.preventDefault();
		});
        $("#maker_sensor_firmware_upgrade_later").on("click", function (e) {
			$("#maker_sensor_firmware_upgrade").popup('close');
			 e.preventDefault();
		});
        
    },

    bindEvents : function() {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', rule_details.onOnline, false);
        document.addEventListener('offline', rule_details.onOffline, false);
        document.addEventListener("backbutton", rule_details.onBackPress, false);
        document.addEventListener("pause", rule_details.onPause, false);
        document.addEventListener("resume", rule_details.onResume, false);
    },

    onOffline : function() {
        console.log(TAG + "offLine");
    },

    onOnline : function() {
        console.log(TAG + "onLine");
    },

    onBackPress : function() {
        if ($("#more_tab").is(":visible")) {
            $("#more_tab").hide();
            $('body').find('.modalWindow').transition({opacity:0},400, function(){
                $(this).removeClass('isOpen');
            });
        }
        else {
            console.log(TAG + "onBackPress");
            wemoUtil.loadUrl(filePath.ENABLED_RULES);
        }
    },

    onPause : function() {
        console.log(TAG + "onPause");
    },

    onResume : function() {
        console.log(TAG + "onResume");
    },

    reportError : function(e) {
        console.log(TAG + "Plugin Error!!!!   " + e);
    },

    deviceListBorder: function(){
        var switch_list = $("#select_").find(".select_switches_list").length;
        if(switch_list===1){
            $(".select_switches_list").addClass("more_li_clone");
        }else if(switch_list === 2){
            $(".select_switches_list:first-child").addClass('more_li_clone more_li_clone_top');
            $(".select_switches_list:last-child").addClass('more_li_clone more_li_clone_bottom');
        }else if(switch_list >= 3){
            $(".select_switches_list:first-child").addClass('more_li_clone more_li_clone_top');
            $(".select_switches_list:last-child").addClass('more_li_clone more_li_clone_bottom');
            $(".select_switches_list").not(".select_switches_list:first-child, .select_switches_list:last-child").addClass('more_li_clone more_li_clone_no_radius');
        }
    },
    ruleStatus : function(StartTime,EndTime,strDays){
        var ruleStartTime = StartTime;
        var ruleEndTime = EndTime;
        var days = strDays;
        //alert('days'+days);
        var d = new Date();
        var today = d.getDay();
        var ruleActiveDay='';
        var dayValue = days;
        var currTimeInMilli = rule_details.convertTimeToMilliseconds();

        if(dayValue.indexOf('Weekends') != -1){
            console.log('saturday and sunday::Weekends');
            if(today == 0 || today==6){
                ruleActiveDay=true;
                console.log('saturday and sunday::active');
                //alert('saturday and sunday::active');
            }else{
                console.log('saturday and sunday::inactive');
                //alert('saturday and sunday::inactive');
                ruleActiveDay=false;
            }
        }else if(dayValue.indexOf('Weekday') != -1){
            console.log('Monday to Friday::Weekdays');
            if((today>0)&&(today<6)){
                console.log('Monday to Friday::active');
                //alert('Monday to Friday::active');
                ruleActiveDay=true;
            }else{
                console.log('Monday to Friday::in active');
                //alert('Monday to Friday::in active');
                ruleActiveDay=false;
            }
        }else if(dayValue.indexOf('Daily') != -1){
            console.log('Mon-Tue-Wed-Thu-Fri-Sat-Sun::All days');
            ruleActiveDay=true;
            //alert('Mon-Tue-Wed-Thu-Fri-Sat-Sun::All days');
        }else if(dayValue.indexOf(wemoUtil.returnDay(today+1)) != -1){
            //alert('wemoUtil.returnDay(today)'+wemoUtil.returnDay(today));
            console.log('day list');
            ruleActiveDay=true;
            //alert('day list');
        }else{
            console.log('do nothing');
            //alert('do nothing');
            ruleActiveDay=false;
        }

        if(ruleActiveDay == true){
            //alert('inside trigger');
            if ((currTimeInMilli<=ruleStartTime)){
                var diff=ruleStartTime-currTimeInMilli;
                console.log('diff'+diff);

                setTimeout(function () {
                    // alert('ruleID'+ruleID);

                    $('.enabled_rules_active').show();

                }, diff * 1000);
            }

            if ((currTimeInMilli>ruleStartTime) && (currTimeInMilli<ruleEndTime)){
                console.log("Currently Active State");

                $('.enabled_rules_active').show();
            }


            if (currTimeInMilli<=ruleEndTime){
                var diffEnd=ruleEndTime-currTimeInMilli;
                setTimeout(function () {
                    //alert('in ruleID'+ruleID);
                    $('.enabled_rules_active').hide();

                }, diffEnd * 1000);
            }



            if(parseInt(ruleEndTime) < parseInt(ruleStartTime)){
                // alert('End time is less then Start time');
                console.log('End time is less then Start time');
                if ((currTimeInMilli>=ruleStartTime)){
                    console.log("Currently Active State");
                    $('.enabled_rules_active').show();
                }
                if ((currTimeInMilli<=ruleStartTime)){
                    var diff=ruleStartTime-currTimeInMilli;
                    console.log('diff'+diff);

                    setTimeout(function () {
                        $('.enabled_rules_active').show();

                    }, diff * 1000);
                }


            }

            if(parseInt(ruleEndTime) == parseInt(ruleStartTime)){
                // alert('End time is equal to Start');
                if ((currTimeInMilli>=ruleStartTime)){
                    console.log("Currently Active State");
                    $('.enabled_rules_active').show();
                }

                if ((currTimeInMilli<=ruleStartTime)){
                    var diff=ruleStartTime-currTimeInMilli;
                    console.log('diff'+diff);

                    setTimeout(function () {
                        $('.enabled_rules_active').show();

                    }, diff * 1000);
                }

            }
        }



    },
    convertTimeToMilliseconds : function(){

        var d = new Date();
        var hh = d.getHours();
        var m = d.getMinutes();
        var s = d.getSeconds();
        return (hh*3600)+(m*60)+s;


    },

    bindDisableEnableRule: function(db, rule, state, selectedRuleID) {
        // in case of rule going disable to enable, first check for the rule conflict or duplication with other enabled rules
        if(state == '0'){
            db.transaction(verifyRuleConflictAndDuplication, errorInVerifyingRule, successInVerifyingRule);
        }else{
            disableEnableRule();
        }

        function disableEnableRule(){
            state == '1' ? state = '0' : state = '1';
            db.transaction(updateData, errorCB, successCB);

            function updateData(tx){
                tx.executeSql("UPDATE RULES SET State=? WHERE RuleID=?", [state,selectedRuleID], getAllRules, errorCB);
            }

            function getAllRules(tx){
                tx.executeSql('SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.Level, b.ZBCapabilityStart, b.ZBCapabilityEnd from RULES a inner join RULEDEVICES b on a.RuleID=CAST(b.RuleID AS CHAR) order by a.Name COLLATE NOCASE', [], querySuccess, errorCB);
            }

            function updateNotification() {
                var notificationTimeout;
                var selectedRuleState = parseInt(state);
                if (selectedRuleState === 1) {
                    $(".notification").html(wemo.items["RuleEnabled"]).fadeIn();
                    $(".change_rule_state").removeClass("disable");
                } else if (selectedRuleState === 0) {
                     $(".notification").html(wemo.items["RuleDisabled"]).fadeIn();
                    $(".change_rule_state").addClass("disable");
                }
                clearTimeout(notificationTimeout);
                notificationTimeout = setTimeout(function(){
                    $(".notification").fadeOut();
                }, 4000);

                nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);

            }

            function querySuccess(tx,results){
                var len = results.rows.length;
                var ruleRows=[];
                if(len>0) {
                    for(var i=0;i<len;i++){
                        ruleRows[i]=results.rows.item(i);
                    }
                }
                window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));
            }

            function errorCB(){
                console.log("Error!");
            }

            function successCB(){
                var msg = "";

                if(state == 1){
                    msg = "enable";
                }else{
                    msg = "disable";
                }

                rule_details.updateSchedule(rule, msg, updateNotification);

            }
        }

        function verifyRuleConflictAndDuplication(tx){
            var getActiveRuleQuery = "SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.DeviceID, b.StartTime, b.RuleDuration, b.StartAction, b.EndAction, b.DayID, b.Value, b.SensorDuration from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID where a.State = '1' order by b.RuleID";

            tx.executeSql(getActiveRuleQuery, [],
                function (tx, results) {
                    var rulen = results.rows.length;
                    var ruleObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
                    var isConflicting = false;
                    var ruleConflictObj;
                    var str_rule_type;

                    switch (ruleObj.RuleType) {
                        case sessionStore.TIME_INTERVAL:
                        case sessionStore.SIMPLE_SWITCH:
                        case sessionStore.AWAY_MODE:
                        case sessionStore.LED_TIMER_RULE:
                            str_rule_type = ruleType.TIME_INTERVAL;
                            break;

                        case sessionStore.COUNTDOWN_TIMER:
                            str_rule_type = ruleType.COUNTDOWN_TIMER;
                            break;

                        case sessionStore.MOTION_CONTROLLED:
                            str_rule_type = ruleType.MOTION_CONTROLLED;
                            break;
                            
                        case sessionStore.MAKER_MOTION_CONTROLLED:
                            str_rule_type = ruleType.MAKER_MOTION_CONTROLLED;
                            break;
                      
                        case sessionStore.NOTIFY_ME:
                            str_rule_type = ruleType.NOTIFY_ME;
                            break;
                        
                        // in case of rules other than above cases
                        // we are allowing user to enable a conflicting/duplicate rule,
                        // need to add a case for another type of rule    
                        default:
                            disableEnableRule();
                            return false;
                            break;
                    }


                    if(rulen>0){
                        ruleConflictObj = verify_rule.ruleConflict[str_rule_type];

                        if(str_rule_type == ruleType.TIME_INTERVAL){

                            var av_switches=[], av_sensors=[], av_makers=[], av_leddevices = [];

                            if(!isRemoteEnabled) {
                                deviceTabPlugin.execute(
                                    function(params){
                                        if(params.length>0){
                                            $.each(params,function(inx){
                                                av_sensors[params[inx].udn]=params[inx].friendlyName;
                                            });
                                        }
                                        else {
                                            wemoUtil.infoLog(TAG, "No Sensors detected");
                                        }
                                        deviceTabPlugin.execute(
                                            function(params1){
                                                if(params1.length>0){
                                                    $.each(params1,function(inx){
                                                        av_switches[params1[inx].udn]=params1[inx].friendlyName;
                                                    });
                                                } else {
                                                    wemoUtil.infoLog(TAG, "No Switches detected");
                                                }
                                                deviceTabPlugin.execute(
                                                    function(params2){
                                                        if(params2.length>0){
                                                            $.each(params2,function(inx){
                                                                av_switches[params2[inx].udn]=params2[inx].friendlyName;
                                                            });
                                                        } else {
                                                            wemoUtil.infoLog(TAG, "No insights detected");
                                                        }
                                                        //LED Array :
                                                        deviceTabPlugin.execute(
                                                            function(params3){
                                                                if(params3.length>0){
                                                                    $.each(params3,function(inx){
                                                                        av_leddevices[params3[inx].udn]=params3[inx].friendlyName;
                                                                    });
                                                                } else {
                                                                    wemoUtil.infoLog(TAG, "No Leds detected");
                                                                }
                                                                deviceTabPlugin.execute(
                                                                    function (params4) {
                                                                        if (params4.length > 0) {
                                                                            $.each(params4, function (inx) {
                                                                                av_makers[params4[inx].udn]=params4[inx].friendlyName;
                                                                            });
                                                                        } else {
                                                                            wemoUtil.infoLog(TAG, "No Maker is detected");
                                                                        }
                                                                        rule_details.restOfTheRulesProcessing(results, av_sensors, rule, av_leddevices, av_switches, av_makers, ruleObj, ruleConflictObj);
                                                                        if(!conflictInRules){
                                                                            wemoUtil.infoLog("No Conflict/Duplicate",  "Not a conflict or duplicae rule. continue enabling..");
                                                                            disableEnableRule();
                                                                        }
                                                                    },
                                                                    function (err) {
                                                                        wemoUtil.infoLog(TAG, "Error detecting Maker");
                                                                    },
                                                                    actions.SELECT_MAKER,[]
                                                                );
                                                            },
                                                            function(err){wemoUtil.infoLog(TAG, "Error detecting Leds");},

                                                            actions.SELECT_LED_DEVICES,[]
                                                        );
                                                    },
                                                    function(err){wemoUtil.infoLog(TAG, "Error detecting insights");},

                                                    actions.SELECT_INSIGHTS,[]
                                                );
                                            },
                                            function(err){wemoUtil.infoLog(TAG, "Error detecting Switches");},

                                            actions.SELECT_SWITCHES,[]
                                        );

                                    },
                                    function(err){wemoUtil.infoLog(TAG, "Error detecting Sensors");},
                                    actions.SELECT_SENSORS,[]
                                );
                            }
                            else
                            {
                                var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
                                var arrayInsightObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA);
                                var arrayDimmerObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DIMMER_DATA);
                                var arraySensorObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SENSOR_DATA);
                                var arrayMakerObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA);
                                var arrayLedDeviceObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_DATA);

                                if(arraySwitchObjects.length>0){
                                    $.each(arraySwitchObjects,function(inx){
                                        av_switches[arraySwitchObjects[inx].udn]=arraySwitchObjects[inx].friendlyName;
                                    });
                                }

                                if (arrayDimmerObjects.length > 0) {
                                    $.each(arrayDimmerObjects, function (inx) {
                                        av_switches[arrayDimmerObjects[inx].udn] = arrayDimmerObjects[inx].friendlyName;
                                    });
                                }

                                if(arraySensorObjects.length>0){
                                    $.each(arraySensorObjects,function(inx){
                                        av_sensors[arraySensorObjects[inx].udn]=arraySensorObjects[inx].friendlyName;
                                    });
                                }
                                
                                if (arrayInsightObjects.length > 0) {
                                    $.each(arrayInsightObjects, function (inx) {
                                        av_switches[arrayInsightObjects[inx].udn] = arrayInsightObjects[inx].friendlyName;
                                    });
                                }
                                
                                if(arrayMakerObjects.length>0){
                                    $.each(arrayMakerObjects,function(inx){
                                        av_sensors[arrayMakerObjects[inx].udn]=arrayMakerObjects[inx].friendlyName;
                                    });
                                }
                                //LED code
                                if(arrayLedDeviceObjects.length>0){
                                    $.each(arrayLedDeviceObjects,function(inx){
                                        av_leddevices[arrayLedDeviceObjects[inx].pluginId]=arrayLedDeviceObjects[inx].friendlyName;
                                    });
                                }
                                rule_details.restOfTheRulesProcessing(results, av_sensors, rule, av_leddevices, av_switches, av_makers, ruleObj, ruleConflictObj);
                                if(!conflictInRules){
                                    wemoUtil.infoLog("No Conflict/Duplicate",  "Not a conflict or duplicae rule. continue enabling..");
                                    disableEnableRule();
                                }
                            }

                        
                        }else{
                            isConflicting = ruleConflictObj.verifyRuleDuplicatesAndConflicts(ruleObj, results.rows);
                            if (isConflicting) {
                                wemoUtil.infoLog("Conflicting/Duplicate",  "Duplicate Rule found. Require changes.");
                                return false;
                            }else{
                                wemoUtil.infoLog("No Conflict/Duplicate",  "Not a conflict or duplicae rule. continue enabling..");
                                disableEnableRule();
                            }
                        }
                    }else{
                        disableEnableRule();
                    }
                },
            function(){
            	wemoUtil.infoLog("Error!", "error In query");
            });
        }


        function errorInVerifyingRule(){
            wemoUtil.infoLog("Error!", "errorInVerifyingRule");
        }

        function successInVerifyingRule(){
            wemoUtil.infoLog("Success!", "successInVerifyingRule");
        }
    },

    restOfTheRulesProcessing: function(results, av_sensors, rule, av_leddevices, av_switches, av_makers, ruleObj, ruleConflictObj) {
        function sortDev( arrDBdev , ruleDevices ) {
            wemoUtil.infoLog(TAG, "array of the devices from DB:");
            for (var i=0; i<arrDBdev.length ; i++) {
                wemoUtil.infoLog(TAG, arrDBdev[i]);
            }
            wemoUtil.infoLog(TAG, "array of the devices from new rule:");
            for (var i=0; i<ruleDevices.length ; i++) {
                wemoUtil.infoLog(TAG, ruleDevices[i]);
            }
            wemoUtil.infoLog(TAG, "sorting...");
            var tmpArr = [];
            for (var i=0; i<arrDBdev.length ; i++) {
                var ind = $.inArray(arrDBdev[i], ruleDevices);
                if ( ind != -1 ) {
                    tmpArr.push(ruleDevices[ind]);
                    ruleDevices.splice(ind,1);
                }
            }
            var arr = $.merge(tmpArr,ruleDevices);
            wemoUtil.infoLog(TAG, "array 'ruleDevices' after sorting:");
            for (var i=0; i<arr.length ; i++) {
                wemoUtil.infoLog(TAG, arr[i]);
            }
            return arr;
        }

        function sortDays ( arrDays ) {
            var tmpArr = [];
            if (  arrDays[0].toString() == "1" ) {
                tmpArr = arrDays.splice(1);
                tmpArr.push(1);
                return tmpArr;
            } else {
                return  arrDays;
            }
        }
        var grouped = {};
        var ruleConflictObj_timer;
        for (var i = 0; results.rows.length > i; i++) {
            var record = results.rows.item(i);
            if(!(record.RuleID in grouped)) {
                grouped[record.RuleID] = [];
            }
            grouped[record.RuleID].push({
                rowDayID: record.DayID,
                rowDeviceID: record.DeviceID,
                rowRuleName: record.Name,
                rowRuleValue: record.Value,
                rowRuleName: record.Name,
                rowSDuration: record.SensorDuration,
                rowType: record.Type,
                rowStartTime: record.StartTime,
                rowRuleDuration: record.RuleDuration,
                rowStartAction: record.StartAction,
                rowEndAction: record.EndAction,
                rowState: record.State,
                rowRuleID: record.RuleID
            });
        }

        var rowDays = [];
        var arrDev = [];//Maria: array of devices from DB grouped by RuleID
        $.each(grouped, function(RuleID, records) {
            rowDays[RuleID] = [];
            arrDev[RuleID] = [];
            $.each(records, function(ix, record) {
                if ( $.inArray( record.rowDayID, rowDays[RuleID] ) == -1 ) { rowDays[RuleID].push(record.rowDayID);}
                if ( $.inArray( record.rowDeviceID, arrDev[RuleID] ) == -1 ) {arrDev[RuleID].push(record.rowDeviceID);}
            });
        });
        window.sessionStorage.removeItem("away_conflict");
        var ruleDevices = [];//Maria: copying the devices from obj rule.Devices into array
        for(var device in rule.Devices){
            ruleDevices.push(device);
        }
        $.each(grouped, function(RuleID, records) {
            ruleDevices = sortDev( arrDev[RuleID] , ruleDevices);
        });

        $.each(grouped, function(RuleID, records) {
            var days = sortDays( rowDays[RuleID] ).join("-");
            var sensorName="";
            var rowSensorValue="-1";
            $.each(records, function(ix, record) {
                var ruleDevice=record.rowDeviceID;
                sensorName=av_sensors[record.rowDeviceID];
                rowSensorValue=record.rowRuleValue;
            });

            if(Object.keys(rule.Devices).length>0){

                for ( var iDev=0; iDev < ruleDevices.length ; iDev++ ) {
                    //for (device in rule.Devices) {
                    device = ruleDevices[iDev];
                    var selectedDev = $.trim(rule.Devices[device].SelectedLedValue);

                    var deviceFriendname = "";

                    if(selectedDev == 1)
                    {
                        if(av_leddevices[device] == "" || av_leddevices[device] == undefined)
                        {
                            deviceFriendname = wemo.items['dimmableLight'];
                        }
                        else
                        {
                            deviceFriendname = av_leddevices[device];
                        }

                    }
                    else
                    {
                        deviceFriendname = av_switches[device];
                    }

                    if(wemoUtil.isMakerDevice(device)){
                        deviceFriendname = av_makers[wemoUtil.getOriginalMakerUDN(device)];

                    }

                    if(rule_details.isSimpleWhen(ruleObj)){
                        ruleConflictObj_timer = ruleConflictObj["SIMPLE"]
                    }else{
                        ruleConflictObj_timer = ruleConflictObj["INTERVAL"]
                    }
                    var isConflict = ruleConflictObj_timer.verifyConflictsDuplicates(device, records, rule, days, rowSensorValue, deviceFriendname, sensorName);

                    if (isConflict) {
                        conflictInRules = true;
                        return false;
                    }
                }
            }
        });
    },

    convertDBOffsetToString: function( offset ) {
        if (offset == undefined || offset == 0 || offset=="0") {
            return "";
        } else {
            offset = offset.toString();
            var sign = offset.substr(0, 1) == "-" ? wemo.items["Before"] : wemo.items["After"];
            if ( sign == wemo.items["Before"] ) offset = offset.substr(1);
            var time = wemoUtil.convertSecondsToHoursMins( parseInt(offset, 10) );
            var index = time.indexOf("ins");
            time = time.substr(0, index);
            return time + " " + sign;
        }
    },

    reverseRuleState: function(db, rule, state, selectedRuleID) {
        db.transaction(updateData, errorCB, successCB);

        function updateData(tx){
            tx.executeSql("UPDATE RULES SET State=? WHERE RuleID=?", [state,selectedRuleID], getAllRules, errorCB);
        }

        function getAllRules(tx){
            tx.executeSql('SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.Level, b.ZBCapabilityStart, b.ZBCapabilityEnd from RULES a inner join RULEDEVICES b on a.RuleID=CAST(b.RuleID AS CHAR) order by a.Name COLLATE NOCASE', [], querySuccess, errorCB);
        }

        function querySuccess(tx,results){
            var len = results.rows.length;
            var ruleRows=[];
            if(len>0) {
                for(var i=0;i<len;i++){
                    ruleRows[i]=results.rows.item(i);
                }
            }
            window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));
        }

        function errorCB(){
            console.log("Error!");
        }

        function successCB(){
        }
    },

    updateSchedule: function(rule,msg, callback) {
    	console.log("updateSchedule()");
        var text = "";

        if(msg == "delete")
        {
            text = wemo.items['RULE_STATUS_DELETING_RULE'];

        } else {
            if(msg == "enable")
            {
                text = wemo.items['RULE_STATUS_AUTO_ENABLING_RULES'];
            }
            else if(msg == "disable")
            {
                text = wemo.items['RULE_STATUS_AUTO_DISABLING_RULES'];
            }
            else
            {
                text = wemo.items['RULE_STATUS_SENDING_DB'];
            }

        }

        var string =$('<p>'+text+'</p>').text();
        nativeUtilPlugin.execute(null,null,actions.SHOW_RULE_PROGRESS,["", string]);

        var ledarr = [];

        wemoUtil.infoLog(TAG, "RuleType : " + rule.RuleType);

        if (Object.keys(rule.Sensors).length>0 && (rule.RuleType !== sessionStore.COUNTDOWN_TIMER) && (msg === "enable")) {
            var sensors = [], homeSensors =[];
            var actionType = "",
                ruleDevices = "";

            if(isRemoteEnabled) {
                sensors = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SENSOR_DATA);
                if (sensors != null && sensors.length > 0) {
                    $.each(sensors, function (inx) {
                        if (sensors[inx] && sensors[inx].udn) {
                            wemoUtil.infoLog(wemoUtil.TAG, "motion sensor devices(remote): " + sensors[inx].udn);
                            ruleDevices = sensors[inx].udn  + "," + ruleDevices;
                        }
                    });
                    wemoUtil.pushScheduleSwitch( ruleDevices, -1, sensors.length, 0, null, callback);
                }

            } else {
                wemoUtil.getDevicesWithCallback(actions.SELECT_SENSORS, function(sensors) {
                    if (sensors != null && sensors.length > 0) {
                        $.each(sensors, function (inx) {
                            if (sensors[inx] && sensors[inx].udn) {
                                wemoUtil.infoLog(wemoUtil.TAG, "motion sensor devices(local): " + sensors[inx].udn);
                                ruleDevices = sensors[inx].udn  + "," + ruleDevices;
                            }

                        });
                        wemoUtil.pushScheduleSwitch( ruleDevices, -1, sensors.length, 0, null, callback);
                    }
                }, function(){
                    nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                    $("#rule_cannot_save_dlg").popup('open');
                    $("#change_rule_state").addClass("disable");
                    var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
                    rule_details.reverseRuleState(db, rule, 0, rule.id);
                });
            }

        } else {
            var params = [], makers = [];
            var ledsparams = [];
            var len = "";
            var ledparamlength = 0;
            var snsparamlength = 0;
            var j=0;
            var ledarr = [];
            var ruleDevices = "";

            $.each(rule.Devices, function(udn, obj1) {
                console.log("UDN:  "+udn+" =1= "+obj1.SelectedLedValue);
                var val = $.trim(obj1.SelectedLedValue);
                //ledarr[j] = udn;
                ledarr[j] = obj1;

                if(val == 1)
                    ledparamlength++;
                else if(val == 0)
                    snsparamlength++;
                j++;
            });

            console.log("ruleDetail.js rule.Devices "+JSON.stringify(rule.Devices)+"----"+ledparamlength+"---"+snsparamlength);

            /***********Switch & sensors Rules********/
            if(isRemoteEnabled){
                params = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
                params = params.concat(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DIMMER_DATA));
                params = params.concat(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA));
                params = params.concat(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA));
                makePush(params);
            }else{
                wemoUtil.getDevicesWithCallback(actions.SELECT_SWITCHES, function(params){
                   wemoUtil.getDevicesWithCallback(actions.SELECT_DIMMERS, function(dimmers){
                        params = params.concat(dimmers);
                        wemoUtil.getDevicesWithCallback(actions.SELECT_INSIGHTS, function(insights){
                            params = params.concat(insights);
                            wemoUtil.getDevicesWithCallback(actions.SELECT_MAKER, function(makers){
                                wemoUtil.infoLog(TAG,"makers received for device plugin: " + makers);
                                params = params.concat(makers);

                                wemoUtil.infoLog(TAG, "Afer concat: total params received for device plugin: " + params);
                                makePush(params);
                            });
                        });
                    });
                });
            }


            function makePush(params)
            {
                if ((params && params.length > 0) || (ledparamlength > 0)){
                    if(ledparamlength && ledparamlength > 0)
                        len = (params.length)+(ledparamlength);
                    else
                        len = params.length;
                    
                    var isLEDInRule = 0;
                    wemoUtil.infoLog(TAG, "led param length: " + ledparamlength);
                    if(ledparamlength > 0){
                        var ledCount = 0;
                        var ruleDevLen = Object.keys(rule.Devices).length;
                        for (var dev1 = 0; dev1 < ruleDevLen; dev1++) {
                            var slectedval = ledarr[dev1];
                            var selectedLedVar = $.trim(ledarr[dev1].SelectedLedValue);

                            if(selectedLedVar == 1){
                                isLEDInRule = 1;
                                wemoUtil.infoLog(TAG, "is LED In Rule: " + isLEDInRule);
                                break;
                            }
                        }
                    }
                    
                    wemoUtil.infoLog(TAG, JSON.stringify(rule.Devices));
                    
                    wemoUtil.infoLog(TAG, JSON.stringify(params));
                    var devicesLength = Object.keys(rule.Devices).length;
                    var ruleDevices ='';
                    for (var inx = 0; inx < devicesLength ; inx++) {
                        var udn = Object.keys(rule.Devices)[inx];
                        for (var j =0; j < params.length ; j++){
                            if(udn && params[j] && params[j].udn){
                                 
                                wemoUtil.infoLog(TAG, udn + ", params_udn: " + params[j].udn);
                                if(wemoUtil.isMakerDevice(udn) && wemoUtil.getOriginalMakerUDN(udn) == params[j].udn ){
                                    wemoUtil.infoLog(TAG, udn + ", params_udn: " + params[j].udn);
                                    ruleDevices = ruleDevices + udn + ',';
                                }else if(udn == params[j].udn){
                                    wemoUtil.infoLog(TAG, udn + ", params_udn: " + params[j].udn);
                                    ruleDevices = ruleDevices + udn + ',';
                                }
                            }
                        }
                    }
                    if(Object.keys(rule.Sensors).length>0){
                    var sensorsLength = Object.keys(rule.Sensors).length;
                    for (var snrs =0; snrs <sensorsLength ; snrs++){
                    var udn = Object.keys(rule.Sensors)[snrs];
                      ruleDevices = ruleDevices + udn + ',';
                      }
                    }
                    
                    ruleDevices = ruleDevices.substring(0, ruleDevices.length - 1);
                    wemoUtil.pushScheduleSwitch( ruleDevices, inx, devicesLength, isLEDInRule, pushScheduleSwitchCallback, callback);
                    
                    function pushScheduleSwitchCallback() {
                        if(ledparamlength > 0)
                        {
                            var ledCount = 0;
                            for (var dev1 = 0; dev1 < Object.keys(rule.Devices).length; dev1++) {
                                var slectedval = ledarr[dev1];
                                var selectedLedVar = $.trim(ledarr[dev1].SelectedLedValue);

                                if(selectedLedVar == 1)
                                {
                                    var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
                                    wemoUtil.pushScheduleLedDevices(Object.keys(rule.Devices)[dev1],db,rule,ledCount,ledparamlength, null, null, callback);
                                    ledCount++;
                                }

                            }
                        }

                    }
                }
            }
        } //else end


    },

    checkIfFirmwareSupported: function(rule) {
        var networktype = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_NETWORKTYPE);
        if ( ((rule.When.OnModeOffset != undefined && rule.When.OnModeOffset!=0 ) || (rule.When.OffModeOffset != undefined && rule.When.OffModeOffset!=0)) || rule.RuleType == sessionStore.AWAY_MODE) {
            for (key in rule.Devices) {
                if (networktype==null|| networktype==networkType.HOME_NETWORK){
                    devicePlugin.execute(
                        function (params) {
                            isFWSupported = params;
                        },
                        wemoUtil.reportError,
                        actions.GET_FIRMWARE_VERSION_SO,
                        [key]
                    );

                }else if (networktype==networkType.REMOTE_WIFI || networktype == networkType.REMOTE_MOBILE) {
                    wemoUtil.infoLog(wemoUtil.TAG, 'Remote getFirmwareVersion');

                    devicePlugin.execute(
                        function (enabled) {
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
                                        wemoUtil.infoLog(wemoUtil.TAG, 'firmware version : ' + firmwareVer +' SO_FW_SUPPORT: '+configValue.SO_FW_SUPPORT);

                                        if(firmwareVer >= configValue.SO_FW_SUPPORT)
                                        {
                                            wemoUtil.infoLog(wemoUtil.TAG, 'firmware is not supported ');
                                            isFWSupported = "true";
                                        }
                                        else {
                                            wemoUtil.infoLog(wemoUtil.TAG, 'firmware is supported SO_RULE');
                                            isFWSupported = "false";
                                        }
                                    }
                                }
                            } else {
                                wemoUtil.loadUrl(filePath.REMOTE_NOT_AVAILABLE);
                            }
                        },
                        wemoUtil.reportError,
                        actions.IS_REMOTE_ENABLED,
                        []
                    );
                }
            }
            if(isFWSupported == "false")
                return;
        }
        if((rule.When.StartSRSS != undefined && rule.When.EndSRSS == undefined) || (rule.When.StartSRSS == undefined && rule.When.EndSRSS != undefined) || (rule.When.StartSRSS != undefined && rule.When.EndSRSS != undefined)){
            if (Object.keys(rule.Devices).length > 0) {
                for (key in rule.Devices) {
                    console.log("SRSS - UDN Firmware Version - " + key + "  ::  " + rule.Devices[key]);
                    isFWSupported = wemoUtil.getFirmwareVersionSRSS(key);

                }
            }
            if(isFWSupported == "false")
                return;
        }
        console.log(" isFWSupported :: " + isFWSupported);
    },
    isMakerSensorFirmwareSupported: function(rule) {
    	 if(rule.RuleType == sessionStore.MAKER_MOTION_CONTROLLED){
         	if (Object.keys(rule.Sensors).length > 0) {
         		for (key in rule.Sensors) {
                     console.log("Maker Sensor  - UDN Firmware Version - " + key + "  ::  " + rule.Sensors[key]);
                     isMakerSensorFWSupported = wemoUtil.getMakerFirmwareVersion(wemoUtil.getOriginalMakerUDN(key), makerDevices);
                     if(isMakerSensorFWSupported == "false")
                     	break;
                 }
         	}
         }
    	 return isMakerSensorFWSupported ;
    },
    checkLedDeviceIconfromCache: function(deviceid){
    	for (var j = 0; j < _ledDeviceCache.length; j++) {
            if (_ledDeviceCache[j].GroupID == undefined || _ledDeviceCache[j].GroupID == null) {
                if (_ledDeviceCache[j].DeviceID == deviceid) {
                    return _ledDeviceCache[j].imgURL;
                }
            } else {
                if (_ledDeviceCache[j].GroupID == deviceid) {
                    return _ledDeviceCache[j].imgURL;
                }
            }
        }
    }


};
