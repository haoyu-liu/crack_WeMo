/**
 SaveNewRule.js

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
var TAG='SaveNewRule.js: ';

function returnDay(dayID) {
    wemoUtil.infoLog(TAG, "Inside returnday" + dayID);
    switch (parseInt(dayID)) {
        case 0 :
            return "Daily";
            break;
        case 1 :
            return "Sun";
            break;
        case 2 :
            return "Mon";
            break;
        case 3 :
            return "Tue";
            break;
        case 4 :
            return "Wed";
            break;
        case 5 :
            return "Thu";
            break;
        case 6 :
            return "Fri";
            break;
        case 7 :
            return "Sat";
            break;
        case 8 :
            return "Weekdays";
            break;
        case 9 :
            return "Weekends";
            break;
        default :
            wemoUtil.infoLog(TAG, "Inside default");
            break;
    }
}


function deCodeDays(arg) {
    wemoUtil.infoLog(TAG, "Inside De-Code Days:  " + arg);
    switch (arg) {
        case "Daily" :
            return 0;
            break;
        case "Sun" :
            return 1;
            break;
        case "Mon" :
            return 2;
            break;
        case "Tue" :
            return 3;
            break;
        case "Wed" :
            return 4;
            break;
        case "Thu" :
            return 5;
            break;
        case "Fri" :
            return 6;
            break;
        case "Sat" :
            return 7;
            break;
        case "Weekdays" :
            return 8;
            break;
        case "Weekends" :
            return 9;
            break;
        case "Mon-Tue-Wed-Thu-Fri" :
            return 8;
            break;
        case "Sat-Sun" :
            return 9;
            break;
        case "Mon-Tue-Wed-Thu-Fri-Sat-Sun" :
            return 0;
            break;
        default :
            wemoUtil.infoLog(TAG, "Inside default");
            break;
    }
}
function complementAction(x) {
    x = parseInt(x);
    if (x == 1) return 0;
    else if (x == 0) return 1;
    else if (x == 2) return 2;
}


function saveNewRule_RULES_RULEDEVICES(arg, ruleObj) {
    var av_switches = [], av_sensors = [], av_makers = [], av_leddevices = [], av_dimmers = [];

    if (!isRemoteEnabled) {
        deviceTabPlugin.execute(
            function (params) {
                if (params.length > 0) {
                    $.each(params, function (inx) {
                        av_sensors[params[inx].udn] = params[inx].friendlyName;
                    });
                }
                else wemoUtil.infoLog(TAG, "No Sensors detected");

            },
            function (err) {
                wemoUtil.infoLog(TAG, "Error detecting Sensors");
            },
            actions.SELECT_SENSORS, []
        );

        deviceTabPlugin.execute(
            function (params) {
                if (params.length > 0) {
                    $.each(params, function (inx) {
                        av_switches[params[inx].udn] = params[inx].friendlyName;
                    });
                } else wemoUtil.infoLog(TAG, "No Switches detected");
            },
            function (err) {
                wemoUtil.infoLog(TAG, "Error detecting Switches");
            },

            actions.SELECT_SWITCHES, []
        );
        
        deviceTabPlugin.execute(
        		function(params){
        			if(params.length>0){
        				$.each(params,function(inx){
        					av_switches[params[inx].udn]=params[inx].friendlyName;
        				});
        			} else wemoUtil.infoLog(TAG, "No insights detected");
        		},
        		function(err){wemoUtil.infoLog(TAG, "Error detecting insights");},

        		actions.SELECT_INSIGHTS,[]
        );
        
        deviceTabPlugin.execute(
        		function (params) {
        			if (params.length > 0) {
        				$.each(params, function (inx) {
        					av_makers[params[inx].udn] = params[inx].friendlyName;
        				});
        			} else wemoUtil.infoLog(TAG, "No Maker is detected");
        		},
        		function (err) {
        			wemoUtil.infoLog(TAG, "Error detecting Makers");
        		},
        		actions.SELECT_MAKER, []
        );


        deviceTabPlugin.execute(
            function (params) {
                if (params.length > 0) {
                    $.each(params, function (inx) {
                        av_dimmers[params[inx].udn] = params[inx].friendlyName;
                    });
                }
                else wemoUtil.infoLog(TAG, "No Dimmers detected");

            },
            function (err) {
                wemoUtil.infoLog(TAG, "Error detecting Dimmers");
            },
            actions.SELECT_DIMMERS, []
        );

		//LED Array :
		deviceTabPlugin.execute(
				function(params){
					if(params.length>0){
						wemoUtil.infoLog(TAG, "params***"+JSON.stringify(params));
						$.each(params,function(inx){
							wemoUtil.infoLog(TAG, "inx "+inx);
							av_leddevices[params[inx].udn]=params[inx].friendlyName;
						});
					} else wemoUtil.infoLog(TAG, "No Leds detected");
				},
				function(err){wemoUtil.infoLog(TAG, "Error detecting Leds");},		
				actions.SELECT_LED_DEVICES,[]
		 );
    }
    else {
        var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
        var arrayDimmerObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DIMMER_DATA);
        var arrayInsightObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA);
        var arraySensorObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SENSOR_DATA);
        var arrayMakerObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA);
        var arrayLedDeviceObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_DATA); 

        if (arraySwitchObjects.length > 0) {
            $.each(arraySwitchObjects, function (inx) { 
                av_switches[arraySwitchObjects[inx].udn] = arraySwitchObjects[inx].friendlyName;
            });
        }
        
        if (arrayInsightObjects.length > 0) {
            $.each(arrayInsightObjects, function (inx) {
                av_switches[arrayInsightObjects[inx].udn] = arrayInsightObjects[inx].friendlyName;
            });
        }

        if (arraySensorObjects.length > 0) {
            $.each(arraySensorObjects, function (inx) {
                av_sensors[arraySensorObjects[inx].udn] = arraySensorObjects[inx].friendlyName;
            });
        }
        if (arrayMakerObjects.length > 0) {
        	$.each(arrayMakerObjects, function (inx) {
        		av_makers[arrayMakerObjects[inx].udn] = arrayMakerObjects[inx].friendlyName;
            });
        }

        if (arrayDimmerObjects.length > 0) {
            $.each(arrayDimmerObjects, function (inx) {
                av_dimmers[arrayDimmerObjects[inx].udn] = arrayDimmerObjects[inx].friendlyName;
            });
        }

		//LED code	           
	    if(arrayLedDeviceObjects.length>0){
		   $.each(arrayLedDeviceObjects,function(inx){
			   av_leddevices[arrayLedDeviceObjects[inx].pluginId]=arrayLedDeviceObjects[inx].friendlyName;
		   });
	    }
    }
    var rule = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
	
	if ( rule.When.StartSRSSoffset == undefined ) rule.When.StartSRSSoffset = 0; 
    var isError = false;
    var saved = false;
    //var rowSensorValue="";
    if (Object.keys(rule.Devices).length <= 0) {
        alert("Please select switches");
        return;
    }

    var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
    db.transaction(getMax, errorCB, successCBgetMax);

    function successCBgetMax()
    {
        db.transaction(getRules, errorCB, successfullySaved);
    }

    function getMax(tx) {

        tx.executeSql('SELECT RuleID  FROM RULES ORDER BY CAST(RuleID AS INT) DESC', [], querySuccess, errorCB);

        function querySuccess(tx, res) {
            if (parseInt(res.rows.length) > 0) {
                var len = parseInt(res.rows.item(0).RuleID) + 1;
                //alert("if  = "+parseInt(res.rows.item(0).RuleID));
            }
            else {
                len = 1;
                //alert("len = "+len);
            }
            var continueSave = checkDbValues(rule);

            if (continueSave == false) {
                alert("Data Not Saved sucessfully...");
                saved = false;
                return false;
            } else {
                // alert("Go Ahead with save..."+saved);
            }

            var wemo_rule_type = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_TYPE);
            var executeQuery = '';

            //if (wemo_rule_type=='edit_simple_rule' || wemo_rule_type=='edit_timer_rule' || wemo_rule_type=='edit_sensor_rule'){
            if (isEdit) {
                executeQuery = 'SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.DeviceID, b.StartTime, b.RuleDuration, b.StartAction, b.EndAction, b.DayID, b.Value, b.SensorDuration  from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID where b.RuleID <> ' + ruleObj.id + ' order by a.Name COLLATE NOCASE';
            } else {
                executeQuery = 'SELECT distinct a.RuleID, a.Name, a.Type, b.DeviceID, a.State, b.StartTime, b.RuleDuration, b.StartAction, b.EndAction, b.DayID, b.Value, b.SensorDuration  from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID order by a.Name COLLATE NOCASE';
            }


            tx.executeSql(executeQuery, [],
                function (tx, results) {
                    var rulen = results.rows.length;
                    var strDays = rule.SelectedDayOrRange;
                    var duplicate = true;
                    var arrDays = strDays.split("-");
                    var rowDevice = "";

                    var rowSensorDuration;


                    if (rulen > 0) { 
                        var grouped = {};
                        for (var i = 0; results.rows.length > i; i++) {
                            var record = results.rows.item(i);
                            if (!(record.RuleID in grouped)) {
                                grouped[record.RuleID] = [];
                            }
                            // alert(record.Value);
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
                        /*******Logic for Away Mode Rule**************/
                        
                        window.sessionStorage.removeItem("away_conflict");
                        
                        /*******Logic for Away Mode Rule**************/
                        
                        var rowDays_ = [];
                        $.each(grouped, function(RuleID, records) {
                            rowDays_[RuleID] = [];
                            $.each(records, function(ix, record) {
                                if ( $.inArray( record.rowDayID, rowDays_[RuleID] ) == -1 ) { rowDays_[RuleID].push(record.rowDayID);}
                            });
                        });

                        $.each(grouped, function (RuleID, records) {
                            //alert("RuleID = "+RuleID)
                            var days = sortDays( rowDays_[RuleID] ).join("-");
                            var rowDays = "";
                            var sensorName = "";
                            var rowSensorValue = "-1";
                            $.each(records, function (ix, record) {
                                var ruleDevice = record.rowDeviceID;
                                if (ruleDevice.indexOf("Socket") != -1) {

                                    if (ix > 0 && rowDays != "") {
                                        if (rowDevice == record.rowDeviceID) {
                                            rowDays += '-' + record.rowDayID;
                                        }
                                    } else {
                                        rowDays = record.rowDayID;
                                        rowDevice = record.rowDeviceID;
                                    }
                                } else {
                                    sensorName = av_sensors[record.rowDeviceID];
                                    rowSensorValue = record.rowRuleValue;
                                }
                                //duplicate=verifyConflictsDuplicates(device, record, rule, rowDays, rowSensorValue);
                            });

                            if (Object.keys(rule.Devices).length > 0) {
                                for (device in rule.Devices) {
									var selectedDev = $.trim(rule.Devices[device].SelectedLedValue);
     	   					 		var deviceFriendname = "";

     	   					 		if(selectedDev == 1 )
     	   					 		{
     	   					 		   if(!device.match(/dimmer/gi)){
                                            if(av_leddevices[device] == "" || av_leddevices[device] == undefined)
                                            {
                                                deviceFriendname = wemo.items['dimmableLight'];
                                            }
                                             else
                                            {
                                                deviceFriendname = av_leddevices[device];
                                            }
 	   					 			   } else
 	   					 			   {
 	   					 			            deviceFriendname = av_dimmers[device];
 	   					 			   }
     	   					 			 
     	   					 		}
     	   					 		else
     	   					 		{
     	   					 			deviceFriendname = av_switches[device];
     	   					 		}

     	   					 		if(wemoUtil.isMakerDevice(device)){
                            			duplicate = verifyConflictsDuplicates(device, records, rule, rowDays, rowSensorValue, av_makers[wemoUtil.getOriginalMakerUDN(device)], sensorName);	
                            		}
                            		else{
     							    duplicate = verifyConflictsDuplicates(device, records, rule, days, rowSensorValue, deviceFriendname, sensorName);
                            		}
                                    				if (duplicate) return false;
                                }
                            }
                        });
                    } else {

                        //tx.executeSql('INSERT INTO RULES (RuleID, Name, Type, RuleOrder, StartDate, EndDate,State, Sync) VALUES ("'+len+'","'+rule.RuleName+'", "'+rule.RuleType+'", "2", "12201983", "12201983", "1", "NOSYNC")');
                        /////////////////////////BLOCKEDRULES------------Insert Rule Status based on Firmware-------------
                        //if(rule.When.isFirmWareSupported != undefined && !rule.When.isFirmWareSupported){
                        //if(!rule.When.isFirmWareSupported || rule.When.isFirmWareSupported === "false"){
                        var wemo_rule_type = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_TYPE);
                      // if ((rule.When.StartSRSS != undefined && rule.When.EndSRSS == undefined) || (rule.When.StartSRSS == undefined && rule.When.EndSRSS != undefined) || (rule.When.StartSRSS != undefined && rule.When.EndSRSS != undefined)) {
                            if (rule.When.isFirmWareSupported != undefined && rule.When.isFirmWareSupported === "false") {
                                rule.State = 0;
                            }
                       // }
                        //if (wemo_rule_type == 'edit_simple_rule' || wemo_rule_type == 'edit_timer_rule' || wemo_rule_type == 'edit_sensor_rule'){
                        if (isEdit) {
                            tx.executeSql("DELETE FROM RULES WHERE RuleID='" + ruleObj.id + "'", [], function () {
                                wemoUtil.infoLog(TAG, "Rule with ID : " + ruleObj.id + " is deleted");
                            }, errorCB);
                            tx.executeSql("DELETE FROM RULEDEVICES WHERE RuleID=" + ruleObj.id, [], function () {
                                wemoUtil.infoLog(TAG, "Rule with ID : " + ruleObj.id + " is deleted");
                            }, errorCB);

                        }
                        var ruleName = rule.RuleName.replace(/\"/g,'&quot;');
                        wemoUtil.infoLog(TAG, "SaveNewRule_ruleName" + ruleName);
                        //alert("New Rule:  "+rule.State);
                        tx.executeSql('INSERT INTO RULES (RuleID, Name, Type, RuleOrder, StartDate, EndDate,State, Sync) VALUES ("' + len + '","' + ruleName + '", "' + rule.RuleType + '", "2", "12201983", "12201983", "' + rule.State + '", "NOSYNC")');
                        /////////////////////////BLOCKEDRULES------------Insert Rule Status based on Firmware-------------

						var StartTime = "";
                        if (Object.keys(rule.Devices).length > 0) {
                            for (device in rule.Devices) {
								var selectedDev = $.trim(rule.Devices[device].SelectedLedValue);
								 var startAction = rule.Devices[device].StartAction;
								 var endAction = rule.Devices[device].EndAction;
   					 		     var baseValue;
								if(selectedDev == 1 || device.match(/dimmer/gi)) {
                                     var bridgeUDN = window.sessionStorage.getItem(sessionStore.LED_BRIDGE_UDN_ID);
                                     var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;

                                     if (device.indexOf("uuid") === -1) {
                                        baseValue = 10;
                                     } else if (device.match(/dimmer/gi)) {
                                        baseValue = 1;
                                     }

                                    if(startAction == 1 && endAction == 1) {
                                         //on
                                         var tempStartAct = rule.Devices[device].StartAction;
                                         var ledCapabiltyON = ledCapabilities.ONOFF+'='+tempStartAct;
                                         var fadeinInp = rule.Devices[device].FadeIn;
                                         var brightnessInp = rule.Devices[device].Brightness;
                                         brightnessInp = brightnessInp.replace(/%$/, '');
                                         var brightnessCalVal = (brightnessInp * AllowedVal)/100;
                                         brightnessCalVal = Math.round(brightnessCalVal);
                                         var ledCapabiltyBrightness = ledCapabilities.DIMMING+"="+brightnessCalVal+":"+fadeinInp;
                                         var tempFadeINStrTime = (rule.When.StartTime) - (fadeinInp/baseValue);

                                        if (device.match(/dimmer/gi)) {
                                            var dimmerCapabiltyBrightness = tempStartAct+":"+brightnessInp+":"+fadeinInp;
                                        }


                                        for(var daysCount1=0; daysCount1 < arrDays.length; daysCount1++){
                                            if ( rule.When.StartSRSS != undefined ) {
                                                if (rule.When.StartSRSS === "Sunrise") StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSR"];
                                                else StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSS"];
                                            } else {
                                                StartTime = rule.When.StartTime;
                                            }
                                            if ( StartTime == undefined ) StartTime = rule.When.StartTime;

                                            var StartSRSSoffset = rule.When.StartSRSSoffset;

                                            if(StartTime > 0 && StartTime < timestamp.MIN_TIME)
                                            {
                                                StartSRSSoffset = -(StartTime - rule.When.StartSRSSoffset - timestamp.MIN_TIME);
                                                StartTime = timestamp.MIN_TIME;
                                                if (rule.When.StartSRSS === "Sunrise")
                                                {
                                                    StartTime += 1;
                                                }
                                                else
                                                {
                                                    StartTime += 2;
                                                }
                                            }
                                            else if (StartTime > timestamp.MAX_HOUR)
                                            {
                                                StartSRSSoffset = timestamp.MAX_HOUR - (StartTime - rule.When.StartSRSSoffset);
                                                StartTime = timestamp.MAX_HOUR;
                                                if (rule.When.StartSRSS === "Sunrise")
                                                {
                                                    StartTime += 1;
                                                }
                                                else
                                                {
                                                    StartTime += 2;
                                                }
                                            }

                                            var RuleDuration = rule.When.RuleDuration;

                                            if(RuleDuration > timestamp.MAX_HOUR)
                                            {
                                                RuleDuration = RuleDuration - timestamp.MAX_HOUR;
                                            }

                                            if (rule.When.StartSRSS == undefined)
                                                StartSRSSoffset =  -(fadeinInp/baseValue);


                                             tempFadeINStrTime = (StartTime) - (fadeinInp/baseValue);

                                             if (device.indexOf("uuid") === -1) {
                                                  var deviceId = bridgeUDN+":"+device;
                                                    tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+tempFadeINStrTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyON+'","","'+StartSRSSoffset+'", "0",-1,-1)');
                                                    tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+tempFadeINStrTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyBrightness+'","","'+StartSRSSoffset+'", "0",-1,-1)');
                                              } else  if (device.match(/dimmer/gi)){
                                                  var deviceId = device;
                                                  tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+tempFadeINStrTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+dimmerCapabiltyBrightness+'","-1","'+StartSRSSoffset+'", "0",-1,-1)');
                                              }
                                         }
                                    }
										 else if(startAction == 1 && endAction == 0)
										 {
											 //untill

											var tempStartAct = rule.Devices[device].StartAction;
											var ledCapabiltyON = ledCapabilities.ONOFF+'='+tempStartAct;
											var fadeinInp = rule.Devices[device].FadeIn;
											var brightnessInp = rule.Devices[device].Brightness;
											brightnessInp = brightnessInp.replace(/%$/, '');
											var brightnessCalVal = (brightnessInp * AllowedVal)/100;   
											brightnessCalVal = Math.round(brightnessCalVal);
											var ledCapabiltyBrightnessON = ledCapabilities.DIMMING+"="+brightnessCalVal+":"+fadeinInp;
	  					 				
											//OFF Action
											var tempEndAct = rule.Devices[device].EndAction;
											var fadeoutInp = rule.Devices[device].FadeOut;
											//if(fadeoutInp ==0 || fadeoutInp == sessionStore.DEFAULT_FADEOUT_VALUE){
                                            var ledCapabiltyOFF = ledCapabilities.ONOFF+'='+tempEndAct;
											/*}else{
												var ledCapabiltyOFF = '0';
											}*/
											var brightnessCalVal = 0;
											var ledCapabiltyBrightnessOFF = ledCapabilities.DIMMING+"="+brightnessCalVal+":"+fadeoutInp;
											var tempFadeoutStrTime = (rule.When.EndTime) - (fadeoutInp/baseValue);

                                        if (device.match(/dimmer/gi)) {
                                            var dimmerCapabiltyBrightnessON = tempStartAct+":"+brightnessInp+":"+fadeinInp;
                                            var dimmerCapabiltyBrightnessOFF = tempEndAct+":0:"+fadeoutInp;
                                        }
											
                                             for(var daysCount1=0; daysCount1 < arrDays.length; daysCount1++){

                                                 if ( rule.When.StartSRSS != undefined ) {
                                                        if (rule.When.StartSRSS === "Sunrise") StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSR"];
                                                        else StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSS"];
                                                    } else {
                                                        StartTime = rule.When.StartTime;
                                                    }
                                                    if ( StartTime == undefined ) StartTime = rule.When.StartTime;

                                                    var StartSRSSoffset = rule.When.StartSRSSoffset;

                                                    if(StartTime > 0 && StartTime < timestamp.MIN_TIME)
                                                    {
                                                        StartSRSSoffset = -(StartTime - rule.When.StartSRSSoffset - timestamp.MIN_TIME);
                                                        StartTime = timestamp.MIN_TIME;
                                                        if (rule.When.StartSRSS === "Sunrise")
                                                        {
                                                            StartTime += 1;
                                                        }
                                                        else
                                                        {
                                                            StartTime += 2;
                                                        }
                                                    }
                                                    else if (StartTime > timestamp.MAX_HOUR)
                                                    {
                                                        StartSRSSoffset = timestamp.MAX_HOUR - (StartTime - rule.When.StartSRSSoffset);
                                                        StartTime = timestamp.MAX_HOUR;
                                                        if (rule.When.StartSRSS === "Sunrise")
                                                        {
                                                            StartTime += 1;
                                                        }
                                                        else
                                                        {
                                                            StartTime += 2;
                                                        }
                                                    }

                                                    var RuleDuration = rule.When.RuleDuration;

                                                    if(RuleDuration > timestamp.MAX_HOUR)
                                                    {
                                                        RuleDuration = RuleDuration - timestamp.MAX_HOUR;
                                                    }

                                                    if (rule.When.StartSRSS == undefined)
                                                    {
                                                        rule.When.OnModeOffset =  -(fadeinInp/baseValue);
                                                        rule.When.OffModeOffset = fadeoutInp/baseValue;
                                                    }

                                                 var tempFadeinStrTime = (StartTime) - (fadeinInp/baseValue);
                                                 if (device.indexOf("uuid") === -1) {
                                                      var deviceId = bridgeUDN+":"+device;
                                                        tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyON+'","'+ledCapabiltyOFF+'","'+rule.When.OnModeOffset+'", "'+rule.When.OffModeOffset+'",-1,-1)');
                                                        tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyBrightnessON+'","'+ledCapabiltyBrightnessOFF+'","'+rule.When.OnModeOffset+'", "'+rule.When.OffModeOffset+'",-1,-1)');
                                                  } else if (device.match(/dimmer/gi)) {
                                                      var deviceId = device;
                                                      tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+dimmerCapabiltyBrightnessON+'","'+dimmerCapabiltyBrightnessOFF+'","'+rule.When.OnModeOffset+'", "'+rule.When.OffModeOffset+'",-1,-1)');

                                                  }

                                             }
	  					 				
										} else if(startAction == 0 && endAction == 0) {
											 //off
											var tempEndAct = rule.Devices[device].EndAction;
											var fadeoutInp = rule.Devices[device].FadeOut;
                                            var ledCapabiltyOFF = ledCapabilities.ONOFF+'='+tempEndAct;

											var brightnessCalVal = 0;
											var ledCapabiltyBrightness = ledCapabilities.DIMMING+'='+brightnessCalVal+":"+fadeoutInp;
											var tempFadeoutStrTime = (rule.When.StartTime) + (fadeoutInp/baseValue);

                                            if (device.match(/dimmer/gi)) {
                                                var dimmerCapabiltyBrightness = tempEndAct+":"+brightnessCalVal+":"+fadeoutInp;
                                            }
											
												 for(var daysCount1=0; daysCount1 < arrDays.length; daysCount1++){

                                                     if ( rule.When.StartSRSS != undefined ) {
                                                         if (rule.When.StartSRSS === "Sunrise") StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSR"];
                                                         else StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSS"];
                                                     } else {
                                                         StartTime = rule.When.StartTime;
                                                     }
                                                     if ( StartTime == undefined ) StartTime = rule.When.StartTime;

														var StartSRSSoffset = rule.When.StartSRSSoffset;

                                                     if(StartTime > 0 && StartTime < timestamp.MIN_TIME)
														{
															StartSRSSoffset = -(StartTime - rule.When.StartSRSSoffset - timestamp.MIN_TIME);
															StartTime = timestamp.MIN_TIME;
															if (rule.When.StartSRSS === "Sunrise")
															{
																StartTime += 1;
															}
															else
															{
																StartTime += 2;
															}
														}
														else if (StartTime > timestamp.MAX_HOUR)
														{
															StartSRSSoffset = timestamp.MAX_HOUR - (StartTime - rule.When.StartSRSSoffset);
															StartTime = timestamp.MAX_HOUR;
															if (rule.When.StartSRSS === "Sunrise")
															{
																StartTime += 1;
															}
															else
															{
																StartTime += 2;
															}
														}

														var RuleDuration = rule.When.RuleDuration;

														if(RuleDuration > timestamp.MAX_HOUR)
														{
															RuleDuration = RuleDuration - timestamp.MAX_HOUR;
														}
														
														if (rule.When.StartSRSS == undefined) 
													    	StartSRSSoffset =  fadeoutInp/baseValue;
														 
												     tempFadeoutStrTime = (StartTime) + (fadeoutInp/baseValue);
                                                      if (device.indexOf("uuid") === -1) {
                                                           var deviceId = bridgeUDN+":"+device;
                                                           tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyOFF+'","","'+StartSRSSoffset+'", "0",-1,-1)');
													       tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyBrightness+'","","'+StartSRSSoffset+'", "0",-1,-1)');

                                                       } else if (device.match(/dimmer/gi)){
                                                           var deviceId = device;
                                                           tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+dimmerCapabiltyBrightness+'","-1","'+StartSRSSoffset+'", "0",-1,-1)');
                                                       }
												 }
										 }   					
								} else {
									 var isMakerDevice = false;
									 var newUdn;
									 if(device.indexOf("uuid:Maker")!=-1){
										 newUdn = wemoUtil.getMakerSwithUDN(device);
										 isMakerDevice = true;
									 }
										for (var daysCount1 = 0; daysCount1 < arrDays.length; daysCount1++) {
                                            if ( rule.When.StartSRSS != undefined ) {
                                                if (rule.When.StartSRSS === "Sunrise") StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSR"];
                                                else StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSS"];
                                            } else {
                                                StartTime = rule.When.StartTime;
                                            }
                                            if ( StartTime == undefined ) StartTime = rule.When.StartTime;

											var StartSRSSoffset = rule.When.StartSRSSoffset;

											if(StartTime < timestamp.MIN_TIME)
											{
												StartSRSSoffset = -(StartTime - rule.When.StartSRSSoffset - timestamp.MIN_TIME);
												StartTime = timestamp.MIN_TIME;
                                                if (rule.When.StartSRSS != undefined) {
                                                    if (rule.When.StartSRSS === "Sunrise")
                                                    {
                                                        StartTime += 1;
                                                    }
                                                    else
                                                    {
                                                        StartTime += 2;
                                                    }
                                                }
											}
											else if (StartTime > timestamp.MAX_HOUR)
											{
												StartSRSSoffset = timestamp.MAX_HOUR - (StartTime - rule.When.StartSRSSoffset);
												StartTime = timestamp.MAX_HOUR;
                                                if (rule.When.StartSRSS != undefined) {
                                                    if (rule.When.StartSRSS === "Sunrise") {
                                                        StartTime += 1;
                                                    }
                                                    else {
                                                        StartTime += 2;
                                                    }
                                                }
											}

											var RuleDuration = rule.When.RuleDuration;

											if(RuleDuration > timestamp.MAX_HOUR)
											{
												RuleDuration = RuleDuration - timestamp.MAX_HOUR;
											}

										 if(isMakerDevice){
											 tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES (' + len + ',"' + newUdn + '", "0", "' + deCodeDays(arrDays[daysCount1]) + '", "' + StartTime + '","' + rule.When.RuleDuration + '", ' + rule.Devices[device].StartAction + ', ' + rule.Devices[device].EndAction + ', "' + rule.Devices[device].SensorDuration + '","-1","' + rule.SelectedSensorsValue + '","-1","","",'+StartSRSSoffset+', 0,-1,-1)');
										 }
										 else{
											 tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+ device +'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+rule.When.RuleDuration+'", '+rule.Devices[device].StartAction+', '+rule.Devices[device].EndAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","","",'+StartSRSSoffset+', 0,-1,-1)');
										 }

										}
								 }

                            } // for loop
                        }

                        if (rule.SelectedSensors != undefined && rule.SelectedSensors != '') {
                            var arrSensors = [];
                            arrSensors = rule.SelectedSensors.split(",");
                            for (var sensors = 0; sensors < arrSensors.length; sensors++) {

                                tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+arrSensors[sensors]+'", "0", "-1", "'+rule.When.StartTime+'","'+rule.When.RuleDuration+'", "-1", "-1", "-1","0",'+rule.SelectedSensorsValue+',"2","","",'+rule.When.StartSRSSoffset+', 0,-1,-1)');
                                for (var device = 0; device < Object.keys(rule.Devices).length; device++) {

                                    tx.executeSql('INSERT INTO DEVICECOMBINATION (RuleID, SensorID, SensorGroupID, DeviceID, DeviceGroupID) VALUES (' + len + ',"' + arrSensors[sensors] + '", "0", "' + Object.keys(rule.Devices)[device] + '", "0")');
                                }

                            }
                        }
                        saved = true;
                        /////////////////////////BLOCKEDRULES-----------Insert Record in BLOCKEDRULES if Firmware is not supported--------------
                         
                        if (rule.When.isFirmWareSupported != undefined && rule.When.isFirmWareSupported === "false") {
                            //alert("Else: 1 "+rule.When.isFirmWareSupported);
                            tx.executeSql('INSERT INTO BLOCKEDRULES (Primarykey, ruleId) VALUES ("' + len + '", "' + len + '")', [],
                                function (tx, results) {
                                    //alert("INSERT INTO BLOCKEDRULES:Else On Success");
                                },
                                function (tx, results) {
                                    //alert("INSERT INTO BLOCKEDRULES:Else On Error");
                                });
                            //alert("Else: 2  "+rule.When.isFirmWareSupported);
                        }
                        /////////////////////////BLOCKEDRULES-----------Insert Record in BLOCKEDRULES if Firmware is not supported--------------
                    }
                    // duplicate = true;

                    if (!duplicate) {

                        var wemo_rule_type = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_TYPE);


                        //if (wemo_rule_type=='edit_simple_rule' || wemo_rule_type=='edit_timer_rule' || wemo_rule_type=='edit_sensor_rule'){
                        if (isEdit) {
                            tx.executeSql("DELETE FROM RULES WHERE RuleID='" + ruleObj.id + "'", [], function () { 
                            }, errorCB);
                            tx.executeSql("DELETE FROM RULEDEVICES WHERE RuleID=" + ruleObj.id, [], function () { 
                            }, errorCB);

                        }
                        /////////////////////////BLOCKEDRULES------------Insert Rule Status based on Firmware-------------
                //       if ((rule.When.StartSRSS != undefined && rule.When.EndSRSS == undefined) || (rule.When.StartSRSS == undefined && rule.When.EndSRSS != undefined) || (rule.When.StartSRSS != undefined && rule.When.EndSRSS != undefined)) {
                            if (rule.When.isFirmWareSupported != undefined && rule.When.isFirmWareSupported === "false") {
                                rule.State = 0;
                            }
                        //}

                        if (rule.selectedRowIndex != undefined && rule.selectedRowIndex != null) {
                            len = rule.selectedRowIndex;
                        }
                        var ruleName = rule.RuleName.replace(/\"/g,'&quot;'); 
                        tx.executeSql('INSERT INTO RULES (RuleID, Name, Type, RuleOrder, StartDate, EndDate,State, Sync) VALUES ("' + len + '","' + ruleName + '", "' + rule.RuleType + '", "2", "12201983", "12201983", "' + rule.State + '", "NOSYNC")');
                        /////////////////////////BLOCKEDRULES------------Insert Rule Status based on Firmware-------------
						
						var StartTime = "";
                        if (Object.keys(rule.Devices).length > 0) {
                            for (device in rule.Devices) { 
								var selectedDev = $.trim(rule.Devices[device].SelectedLedValue);
								var startAction = rule.Devices[device].StartAction;
								var endAction = rule.Devices[device].EndAction;
								var baseValue;

								if(selectedDev == 1 || device.match(/dimmer/gi)) {
									
									var AllowedVal = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
									var bridgeUDN = window.sessionStorage.getItem(sessionStore.LED_BRIDGE_UDN_ID);
                                     if (device.indexOf("uuid") === -1) {
                                        baseValue = 10;
                                     } else if (device.match(/dimmer/gi)) {
                                        baseValue = 1;
                                     }
									
									if(startAction == 1 && endAction == 1) {
										 //on
										 var tempStartAct = rule.Devices[device].StartAction;
										 var ledCapabiltyON = ledCapabilities.ONOFF+"="+tempStartAct;   					 				 
										 var fadeinInp = rule.Devices[device].FadeIn;
										 var brightnessInp = rule.Devices[device].Brightness;
										 brightnessInp = brightnessInp.replace(/%$/, '');
										 var brightnessCalVal = (brightnessInp * AllowedVal)/100;  
										 brightnessCalVal = Math.round(brightnessCalVal);
										 var ledCapabiltyBrightness = ledCapabilities.DIMMING+"="+brightnessCalVal+":"+fadeinInp;
										 var tempFadeINStrTime = (rule.When.StartTime) - (fadeinInp/baseValue);

                                        if (device.match(/dimmer/gi)) {
                                            var dimmerCapabiltyBrightness = tempStartAct+":"+brightnessInp+":"+fadeinInp;
                                        }
										 
											 for(var daysCount1=0; daysCount1 < arrDays.length; daysCount1++){
												 
												 if ( rule.When.StartSRSS != undefined ) {
														if (rule.When.StartSRSS === "Sunrise") StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSR"];
														else StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSS"];
													} else {
														StartTime = rule.When.StartTime;
													}
													if ( StartTime == undefined ) StartTime = rule.When.StartTime;

													var StartSRSSoffset = rule.When.StartSRSSoffset;

                                                 if(StartTime > 0 && StartTime < timestamp.MIN_TIME)
													{
														StartSRSSoffset = -(StartTime - rule.When.StartSRSSoffset - timestamp.MIN_TIME);
														StartTime = timestamp.MIN_TIME;
														if (rule.When.StartSRSS === "Sunrise")
														{
															StartTime += 1;
														}
														else
														{
															StartTime += 2;
														}
													}
													else if (StartTime > timestamp.MAX_HOUR)
													{
														StartSRSSoffset = timestamp.MAX_HOUR - (StartTime - rule.When.StartSRSSoffset);
														StartTime = timestamp.MAX_HOUR;
														if (rule.When.StartSRSS === "Sunrise")
														{
															StartTime += 1;
														}
														else
														{
															StartTime += 2;
														}
													}

													var RuleDuration = rule.When.RuleDuration;

													if(RuleDuration > timestamp.MAX_HOUR)
													{
														RuleDuration = RuleDuration - timestamp.MAX_HOUR;
													}
													
													if (rule.When.StartSRSS == undefined) 
														StartSRSSoffset =  -(fadeinInp/baseValue);
											    	
												 tempFadeINStrTime = (StartTime) - (fadeinInp/baseValue);
											     
                                                  if (device.indexOf("uuid") === -1) {
                                                       var deviceId = bridgeUDN+":"+device;
												            tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+tempFadeINStrTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyON+'","","'+StartSRSSoffset+'", "0",-1,-1)');
												            tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+tempFadeINStrTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyBrightness+'","","'+StartSRSSoffset+'", "0",-1,-1)');
                                                   } else if (device.match(/dimmer/gi)) {
                                                       var deviceId = device;
                                                       tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+tempFadeINStrTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+dimmerCapabiltyBrightness+'","-1","'+StartSRSSoffset+'", "0",-1,-1)');

                                                   }

											 }
									}
									else if(startAction == 1 && endAction == 0)
									{
										 //untill
										var tempStartAct = rule.Devices[device].StartAction;
										var ledCapabiltyON = ledCapabilities.ONOFF+"="+tempStartAct;
										var fadeinInp = rule.Devices[device].FadeIn;
										var brightnessInp = rule.Devices[device].Brightness;
										brightnessInp = brightnessInp.replace(/%$/, '');
										var brightnessCalVal = (brightnessInp * AllowedVal)/100; 
										brightnessCalVal = Math.round(brightnessCalVal);
										var ledCapabiltyBrightnessON = ledCapabilities.DIMMING+"="+brightnessCalVal+":"+fadeinInp; 
										
										
										var tempEndAct = rule.Devices[device].EndAction;
										var fadeoutInp = rule.Devices[device].FadeOut;

                                        var ledCapabiltyOFF = ledCapabilities.ONOFF+'='+tempEndAct;

										var brightnessCalVal = 0;
										var ledCapabiltyBrightnessOFF = ledCapabilities.DIMMING+"="+brightnessCalVal+":"+fadeoutInp;
										var tempFadeoutStrTime = (rule.When.EndTime) - (fadeoutInp/baseValue);

                                        if (device.match(/dimmer/gi)) {
                                            var dimmerCapabiltyBrightnessON = tempStartAct+":"+brightnessInp+":"+fadeinInp;
                                            var dimmerCapabiltyBrightnessOFF = tempEndAct+":0:"+fadeoutInp;
                                        }
										
											 for(var daysCount1=0; daysCount1 < arrDays.length; daysCount1++){	
												 
												 if ( rule.When.StartSRSS != undefined ) {
														if (rule.When.StartSRSS === "Sunrise") StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSR"];
														else StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSS"];
													} else {
														StartTime = rule.When.StartTime;
													}
													if ( StartTime == undefined ) StartTime = rule.When.StartTime;

													var StartSRSSoffset = rule.When.StartSRSSoffset;

                                                 if(StartTime > 0 && StartTime < timestamp.MIN_TIME)
													{
														StartSRSSoffset = -(StartTime - rule.When.StartSRSSoffset - timestamp.MIN_TIME);
														StartTime = timestamp.MIN_TIME;
														if (rule.When.StartSRSS === "Sunrise")
														{
															StartTime += 1;
														}
														else
														{
															StartTime += 2;
														}
													}
													else if (StartTime > timestamp.MAX_HOUR)
													{
														StartSRSSoffset = timestamp.MAX_HOUR - (StartTime - rule.When.StartSRSSoffset);
														StartTime = timestamp.MAX_HOUR;
														if (rule.When.StartSRSS === "Sunrise")
														{
															StartTime += 1;
														}
														else
														{
															StartTime += 2;
														}
													}

													var RuleDuration = rule.When.RuleDuration;

													if(RuleDuration > timestamp.MAX_HOUR)
													{
														RuleDuration = RuleDuration - timestamp.MAX_HOUR;
													}

													if (rule.When.StartSRSS == undefined) 
													{
														rule.When.OnModeOffset =  -(fadeinInp/baseValue);
														rule.When.OffModeOffset = fadeoutInp/baseValue;
													}
													
                                                      if (device.indexOf("uuid") === -1) {
                                                           var deviceId = bridgeUDN+":"+device;
                                                           tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyON+'","'+ledCapabiltyOFF+'","'+rule.When.OnModeOffset+'", "'+rule.When.OffModeOffset+'",-1,-1)');
												           tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyBrightnessON+'","'+ledCapabiltyBrightnessOFF+'","'+rule.When.OnModeOffset+'", "'+rule.When.OffModeOffset+'",-1,-1)');
                                                       } else if (device.match(/dimmer/gi)){
                                                           var deviceId = device;
												           tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+dimmerCapabiltyBrightnessON+'","'+dimmerCapabiltyBrightnessOFF+'","'+rule.When.OnModeOffset+'", "'+rule.When.OffModeOffset+'",-1,-1)');

                                                       }
											 }
										
									}
									else if(startAction == 0 && endAction == 0)
									{
										 //off
										var tempEndAct = rule.Devices[device].EndAction;
										var fadeoutInp = rule.Devices[device].FadeOut;
										//if(fadeoutInp ==0 || fadeoutInp == sessionStore.DEFAULT_FADEOUT_VALUE){
											var ledCapabiltyOFF = ledCapabilities.ONOFF+'='+tempEndAct;
										/*}else{
											var ledCapabiltyOFF = '0';
										}*/
										var brightnessCalVal = 0;
										var ledCapabiltyBrightness = ledCapabilities.DIMMING+"="+brightnessCalVal+":"+fadeoutInp;
										var tempFadeoutStrTime = (rule.When.StartTime) + (fadeoutInp/baseValue);

                                        if (device.match(/dimmer/gi)) {
                                            var dimmerCapabiltyBrightness = tempEndAct+":"+brightnessCalVal+":"+fadeoutInp;
                                        }
										
											 for(var daysCount1=0; daysCount1 < arrDays.length; daysCount1++){	
												 
												 if ( rule.When.StartSRSS != undefined ) {
														if (rule.When.StartSRSS === "Sunrise") StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSR"];
														else StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSS"];
													} else {
														StartTime = rule.When.StartTime;
													}
													if ( StartTime == undefined ) StartTime = rule.When.StartTime;

													var StartSRSSoffset = rule.When.StartSRSSoffset;

                                                 if(StartTime > 0 && StartTime < timestamp.MIN_TIME)
													{
														StartSRSSoffset = -(StartTime - rule.When.StartSRSSoffset - timestamp.MIN_TIME);
														StartTime = timestamp.MIN_TIME;
														if (rule.When.StartSRSS === "Sunrise")
														{
															StartTime += 1;
														}
														else
														{
															StartTime += 2;
														}
													}
													else if (StartTime > timestamp.MAX_HOUR)
													{
														StartSRSSoffset = timestamp.MAX_HOUR - (StartTime - rule.When.StartSRSSoffset);
														StartTime = timestamp.MAX_HOUR;
														if (rule.When.StartSRSS === "Sunrise")
														{
															StartTime += 1;
														}
														else
														{
															StartTime += 2;
														}
													}

													var RuleDuration = rule.When.RuleDuration;

													if(RuleDuration > timestamp.MAX_HOUR)
													{
														RuleDuration = RuleDuration - timestamp.MAX_HOUR;
													}
													if (rule.When.StartSRSS == undefined) 
												    	StartSRSSoffset =  fadeoutInp/baseValue;

												 tempFadeoutStrTime = (StartTime) + (fadeoutInp/baseValue);
                                                  if (device.indexOf("uuid") === -1) {
                                                       var deviceId = bridgeUDN+":"+device;
                                                       tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyOFF+'","","'+StartSRSSoffset+'", "0",-1,-1)');
												        tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyBrightness+'","","'+StartSRSSoffset+'", "0",-1,-1)');
                                                   } else if (device.match(/dimmer/gi)){
                                                       var deviceId = device;
                                                       tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+dimmerCapabiltyBrightness+'","-1","'+StartSRSSoffset+'", "0",-1,-1)');

                                                   }
											 }
									}   					 			 
	   					 		
								}
								else
								{
									var isMakerDevice = false;
									var newUdn;
									if(device.indexOf("uuid:Maker")!=-1){
										newUdn = wemoUtil.getMakerSwithUDN(device);
										isMakerDevice = true;
									}
										for (var daysCount1 = 0; daysCount1 < arrDays.length; daysCount1++) {
											if ( rule.When.StartSRSS != undefined ) {
												var timeToLook = rule.When.StartSRSS == "Sunrise" ? "timeSR" : "timeSS";
												if (rule[sessionStore.SRSS_SELECTED_DAYS]) {
													StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])][timeToLook];
												}
											} else {
												StartTime = rule.When.StartTime;
											}
											if ( StartTime === "" ) StartTime = rule.When.StartTime;

											var StartSRSSoffset = rule.When.StartSRSSoffset;

											if(StartTime > 0 && StartTime < timestamp.MIN_TIME)
											{
												StartSRSSoffset = -(StartTime - rule.When.StartSRSSoffset - timestamp.MIN_TIME);
												StartTime = timestamp.MIN_TIME;
												if (rule.When.StartSRSS === "Sunrise")
												{
													StartTime += 1;
												}
												else
												{
													StartTime += 2;
												}
											}
											else if (StartTime > timestamp.MAX_HOUR)
											{
												StartSRSSoffset = timestamp.MAX_HOUR - (StartTime - rule.When.StartSRSSoffset);
												StartTime = timestamp.MAX_HOUR;
												if (rule.When.StartSRSS === "Sunrise")
												{
													StartTime += 1;
												}
												else
												{
													StartTime += 2;
												}
											}

											var RuleDuration = rule.When.RuleDuration;

											if(RuleDuration > timestamp.MAX_HOUR)
											{
												RuleDuration = RuleDuration - timestamp.MAX_HOUR;
											}

										if(isMakerDevice){
											tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES (' + len + ',"' + newUdn + '", "0", "' + deCodeDays(arrDays[daysCount1]) + '", "' + StartTime + '","' + rule.When.RuleDuration + '", ' + rule.Devices[device].StartAction + ', ' + rule.Devices[device].EndAction + ', "' + rule.Devices[device].SensorDuration + '","-1","' + rule.SelectedSensorsValue + '","-1","","",'+StartSRSSoffset+',0,-1,-1)');
										}
										else{
											tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+device+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+rule.When.RuleDuration+'", '+rule.Devices[device].StartAction+', '+rule.Devices[device].EndAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","","",'+StartSRSSoffset+',0,-1,-1)');
										}											

										}
								} 
                            } //For loop
                        }

                        if (rule.SelectedSensors != undefined && rule.SelectedSensors != '') {
                            var arrSensors = [];
                            arrSensors = rule.SelectedSensors.split(",");
                            for (var sensors = 0; sensors < arrSensors.length; sensors++) {

                                tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+arrSensors[sensors]+'", "0", "-1", "'+rule.When.StartTime+'","'+rule.When.RuleDuration+'", "-1", "-1", "-1","0",'+rule.SelectedSensorsValue+',"2",'+rule.When.StartSRSSoffset+',0,-1,-1)');


                                for (var device = 0; device < Object.keys(rule.Devices).length; device++) {
                                    tx.executeSql('INSERT INTO DEVICECOMBINATION (RuleID, SensorID, SensorGroupID, DeviceID, DeviceGroupID) VALUES (' + len + ',"' + arrSensors[sensors] + '", "0", "' + Object.keys(rule.Devices)[device] + '", "0")');
                                }
                            }
                        }
                        saved = true;
                        /////////////////////////BLOCKEDRULES-----------Insert Record in BLOCKEDRULES if Firmware is not supported--------------
                        //if(rule.When.isFirmWareSupported != undefined && !rule.When.isFirmWareSupported){
                        // alert("!duplicate: 1 "+rule.When.isFirmWareSupported+" || "+rule.When.isFirmWareSupported+" === false");
                        //if(!rule.When.isFirmWareSupported || rule.When.isFirmWareSupported === "false"){
                        if (rule.When.isFirmWareSupported != undefined && rule.When.isFirmWareSupported === "false") {
                            //alert("!duplicate: 1 "+rule.When.isFirmWareSupported);
                            tx.executeSql('INSERT INTO BLOCKEDRULES (Primarykey, ruleId) VALUES ("' + len + '", "' + len + '")', [],
                                function (tx, results) {
                                    //alert("INSERT INTO BLOCKEDRULES:!duplicate On Success");
                                },
                                function (tx, results) {
                                    //alert("INSERT INTO BLOCKEDRULES:!duplicate On Error");
                                });
                            //alert("!duplicate: 1 "+rule.When.isFirmWareSupported);
                        }
                        /////////////////////////BLOCKEDRULES-----------Insert Record in BLOCKEDRULES if Firmware is not supported--------------
                    }
                }, errorCB);

        }
    }

    //Rule Duplicate Popup
    $("#rule_duplicate_learn_more_btn").on("click", function () {
        //alert("Learn More");
        if (!isRemoteEnabled) {
            deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
        }

       window.open(wemo.items['Help_Rules_Alert_Url'], "_system");
       $("#rule_duplicate").popup("close");
    });

    $("#rule_duplicate_ok_btn").on("click", function () {
        //alert("Rule Duplicate");
        $("#rule_duplicate").popup("close");
        $("RuleDuplicateText").html("");
        //return;
        //return false;
    });

    function showConflictDuplicateMessage(ruleType, ruleName, msgType, ruleAction, device, sTime, eTime, sensorDeviceName, subRuleType) {
    	
        if (ruleAction == "Turns On") {
            ruleAction = wemo.items['SwitchActionTurnOn'];
        }
        else if (ruleAction == "Turns Off") {
            ruleAction = wemo.items['SwitchActionTurnOff'];
        }
        else if (ruleAction == "Does Nothing") {
            ruleAction = wemo.items['SwitchActionNothing'];
        }

        /*******Rule Name ************/

        var rulenameObj = ruleName;
        var searchRule = rulenameObj.search("Rule");

        if (searchRule != -1 || searchRule == false) {
            var rulenamepart1 = wemo.items['Rule'];
            ruleName = rulenameObj.replace("Rule", rulenamepart1);
        }
        else {
            ruleName = rulenameObj;
        }

        if (msgType == "conflict") {
        	
        	/*******Logic for Away Mode Rule**************/
        	
        	window.sessionStorage.removeItem("away_conflict");
        	
        	/*******Logic for Away Mode Rule**************/
            var ruleConflictLocalizedmsg = wemo.items['RuleConflictSimpleAndTimer'];
            var temparr = ruleConflictLocalizedmsg.split("%@");
            var msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " + ruleAction + " " + device + " " + temparr[3] + " " + sTime + temparr[4];
            var RuleconflictHeader = wemo.items['RuleConflict'];
 
            switch (ruleType) {
                case sessionStore.SIMPLE_SWITCH:
                    //$("#ruleInfoHeader").text("Rule Conflict");
                    //$("#RuleDuplicateText").text("This rule conflicts with the rule "+ruleName+" which "+ruleAction+" "+device+" at "+sTime+". Please adjust this rule to a different time or different switch.");
                	setTimeout(
                			function(){
                				$("#ruleInfoHeader").html(RuleconflictHeader);
                				$("#RuleDuplicateText").html(msgText);
                				$("#rule_duplicate").popup("open");
                			},
                			timeout.POPUP_DISPLAY_DELAY
                	);
                    break;

                case sessionStore.TIME_INTERVAL:
                    //$("#ruleInfoHeader").text("Rule Conflict");
                    //$("#RuleDuplicateText").text("This rule conflicts with the rule "+ruleName+" which "+ruleAction+" "+device+" at "+sTime+". Please adjust this rule to a different time or different switch.");
                	setTimeout(
                			function(){
                				$("#ruleInfoHeader").html(RuleconflictHeader);
                				$("#RuleDuplicateText").html(msgText);
                				$("#rule_duplicate").popup("open");
                			},
                			timeout.POPUP_DISPLAY_DELAY
                	);
                    break;
               /*******Logic for Away Mode Rule**************/
                case sessionStore.AWAY_MODE:
                    setTimeout(
                        function () {
                            $("#ruleInfoHeader").html(RuleconflictHeader);
                            $("#RuleDuplicateText").html(wemo.items['AwayModeConflict']);
                            $("#rule_duplicate").popup("open");
                        },
                        500
                    );
                    break;
               /*******Logic for Away Mode Rule**************/
                case sessionStore.MOTION_CONTROLLED:
                    $("#ruleInfoHeader").html(RuleconflictHeader);
                    //$("#ruleInfoHeader").text("Rule Conflict");
                    if (subRuleType == "AllDay") {
                        var ruleConflictLocalizedMotionmsg = wemo.items['RuleConflictSensorRuleWithMotionAllDayON'];
                        var temparr = ruleConflictLocalizedMotionmsg.split("%@");
                        var msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " + ruleAction + " " + device + " " + temparr[2] + " " + sensorDeviceName + " " + temparr[3];
                        $("#RuleDuplicateText").html(msgText);

                        //$("#RuleDuplicateText").text("This rule conflicts with the rule "+ruleName+" which "+ruleAction+" "+device+" with motion at "+sensorDeviceName+" all day. Please adjust this rule to a different time, sensor or switch.");
                    } else {
                        var ruleConflictLocalizedMotionmsg = wemo.items['RuleConflictSensorRuleWithMotionON'];
                        var temparr = ruleConflictLocalizedMotionmsg.split("%@");
                        var msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " + ruleAction + " " + device + " " + temparr[2] + " " + sensorDeviceName + " " + temparr[3] + " " + sTime + " " + temparr[4] + " " + eTime + "" + temparr[5];
                        $("#RuleDuplicateText").html(msgText);
                        //$("#RuleDuplicateText").text("This rule conflicts with the rule "+ruleName+" which "+ruleAction+" "+device+" with motion at "+sensorDeviceName+" from "+sTime+" - "+eTime+". Please adjust this rule to a different time, sensor or switch.");
                    }
					setTimeout(
						function(){
							$("#rule_duplicate").popup("open");               				
						},
						timeout.POPUP_DISPLAY_DELAY
                	);
                    break;
                    
                case sessionStore.MAKER_MOTION_CONTROLLED:
                	setTimeout(
                			function(){
                				$("#ruleInfoHeader").html(RuleconflictHeader);
                				$("#RuleDuplicateText").html(msgText);
                				$("#rule_duplicate").popup("open");
                			},
                			timeout.POPUP_DISPLAY_DELAY
                	);
                	break;

                default:
                    //alert("default");
                    break;
            }
        } else {

            var ruleDuplicateLocalizedmsg = wemo.items['RuleDuplicateText'];
            var temparr = ruleDuplicateLocalizedmsg.split("%@");
            var msgText = temparr[0] + " " + ruleName + " " + temparr[1];
            var RuleDuplicationHeader = wemo.items['RuleDuplicate'];

            switch (ruleType) {
                case sessionStore.SIMPLE_SWITCH:
                    //$("#ruleInfoHeader").text("Rule Duplication");
                	setTimeout(
                			function(){
                				$("#ruleInfoHeader").html(RuleDuplicationHeader);
                				$("#RuleDuplicateText").html(msgText);
                				$("#rule_duplicate").popup("open");
                			},
                			timeout.POPUP_DISPLAY_DELAY
                	);

                    break;

                case sessionStore.TIME_INTERVAL:
                    //$("#ruleInfoHeader").text("Rule Duplication");
                  	setTimeout(
                			function(){
                				$("#ruleInfoHeader").html(RuleDuplicationHeader);
                				$("#RuleDuplicateText").html(msgText);
                				$("#rule_duplicate").popup("open");
                			},
                			timeout.POPUP_DISPLAY_DELAY
                	);
                    break;
 
                case sessionStore.MOTION_CONTROLLED:
                    //$("#ruleInfoHeader").text("Rule Duplication");
                   	setTimeout(
                			function(){
                				$("#ruleInfoHeader").html(RuleDuplicationHeader);
                				$("#RuleDuplicateText").html(msgText);
                				//$("#RuleDuplicateText").text("This rule is the same as "+ruleName+". Please adjust it before saving");
                				$("#rule_duplicate").popup("open");
                			},
                			timeout.POPUP_DISPLAY_DELAY
                	);
                    break;
                    
                case sessionStore.MAKER_MOTION_CONTROLLED:
                    //$("#ruleInfoHeader").text("Rule Duplication");
                   	setTimeout(
                			function(){
                				$("#ruleInfoHeader").html(RuleDuplicationHeader);
                				$("#RuleDuplicateText").html(msgText);
                				//$("#RuleDuplicateText").text("This rule is the same as "+ruleName+". Please adjust it before saving");
                				$("#rule_duplicate").popup("open");
                			},
                			timeout.POPUP_DISPLAY_DELAY
                	);
                    break;

                default:
                    //alert("default");
                    break;
            }
        }

    }

    function verifyConflictsDuplicates(device, ruleRow, rule, days, sensorValue, deviceName, sensorDeviceName) {
        //alert("   validate :: "+JSON.stringify(ruleRow)+ '   Length = '+ruleRow.length);
        var strDays = rule.SelectedDayOrRange;
        var arrDays = strDays.split("-");
        var ruleDays = [];
        for (var i = 0; i < arrDays.length; i++) {
            ruleDays.push(deCodeDays(arrDays[i]));
        }
        ruleDays = ruleDays.join("-");
        // var rulesensorValue="";
        for (var j = 0; j < ruleRow.length; j++) {
        	
        	if (ruleRow[j].rowType == sessionStore.MOTION_CONTROLLED || ruleRow[j].rowType == sessionStore.MAKER_MOTION_CONTROLLED || ruleRow[j].rowType == sessionStore.INSIGHT_RULE) {
        		continue ;
        	}
            var tempStartTime = "" + ruleRow[j].rowStartTime;
            if (tempStartTime.slice(-1) == "1") {
                sTime = parseInt(ruleRow[j].rowStartTime) - 1;
            } else {
                sTime = tempStartTime;
            }

            var tempEndTime = "" + ruleRow[j].rowRuleDuration;
            if (tempEndTime.slice(-1) == "1") {
                eTime = parseInt(ruleRow[j].rowRuleDuration) - 2;
            } else {
                eTime = tempEndTime;
            }
            /*if (ruleRow[j].rowStartTime.slice(-1)=="1"){
             ruleRow[j].rowStartTime=parseInt(ruleRow[j].rowStartTime)-1;
             }
             if (ruleRow[j].rowRuleDuration.slice(-1)=="2"){
             ruleRow[j].rowRuleDuration=parseInt(ruleRow[j].rowRuleDuration)-2;
             }*/
            //alert(" Rule ID :: "+ruleRow[j].rowRuleID+"  Sensor Value = "+ruleRow[j].rowRuleValue+'  '+sensorValue+'   Device = '+ruleRow[j].rowDeviceID+'   Sensor Duration  '+ruleRow[j].rowSDuration);
            var endTime = parseInt(sTime) + parseInt(eTime);

            // cross Rule Conflict
            /*var conRuleStartAct   = device+''+rule.When.StartTime+''+complementAction(rule.Devices[device].StartAction);
             var conRowStartAct    = ruleRow[j].rowDeviceID+''+sTime+''+ruleRow[j].rowStartAction;
             var conRuleEndAct     = device+''+rule.When.EndTime+''+rule.Devices[device].StartAction;
             var conRowEndAct      = ruleRow[j].rowDeviceID+''+endTime+''+ruleRow[j].rowEndAction;*/

            var rowDeviceIDDB = ruleRow[j].rowDeviceID;
            var searchType = rowDeviceIDDB.search("Bridge");

            if(searchType != -1 || searchType == true)
            {

                if(rowDeviceIDDB.indexOf("^")!=-1)
   				{
                	var rowDeviceIDArr = rowDeviceIDDB.split("^");
                	rowDeviceIDDB = rowDeviceIDArr[1];   
   				}
   				else
   				{
   					var rowDeviceIDArr = rowDeviceIDDB.split(":");
                	rowDeviceIDDB = rowDeviceIDArr[2];   
   				}  
                
            }
            
            var conRuleStartAct = device + '' + rule.When.StartTime + '' + complementAction(rule.Devices[device].StartAction) + '' + ruleDays;
            var conRowStartAct = rowDeviceIDDB + '' + sTime + '' + ruleRow[j].rowStartAction + '' + days;
            var conRowStartComplAct = rowDeviceIDDB + '' + sTime + '' + complementAction(ruleRow[j].rowStartAction) + '' + days;

            var conRuleEndAct = device + '' + rule.When.EndTime + '' + rule.Devices[device].EndAction + '' + ruleDays;
            var conRowEndAct = rowDeviceIDDB+ '' + endTime + '' + complementAction(ruleRow[j].rowEndAction) + '' + days;

            var conRowStartEndAct = rowDeviceIDDB+ '' + endTime + '' + ruleRow[j].rowEndAction + '' + days;

            var startActAllDay = rowDeviceIDDB+ '' + sTime + '' + eTime + '' + ruleRow[j].rowStartAction + '' + sensorValue;
            var dupStartActAllDay = device + '' + rule.When.StartTime + '' + rule.When.RuleDuration + '' + complementAction(rule.Devices[device].StartAction) + '' + rule.SelectedSensorsValue;

            var endActSimple = rowDeviceIDDB + '' + endTime + '' + ruleRow[j].rowStartAction;
            var startActSimple = rowDeviceIDDB + '' + sTime + '' + ruleRow[j].rowStartAction;
            var dupStartActSimple = device + '' + rule.When.StartTime + '' + complementAction(rule.Devices[device].StartAction);

            if (rowDeviceIDDB.match(/dimmer/gi)) {
              if(rule.Devices[rowDeviceIDDB].FadeOut == undefined){
                sTime = parseInt(sTime) + parseInt(rule.Devices[rowDeviceIDDB].FadeIn);
                } else {
                sTime = parseInt(sTime) + parseInt(rule.Devices[rowDeviceIDDB].FadeOut);
                }
            }

            //Sensor Rule, Timer Rule & Simple Rule Duplication & Start Action Conflict
            var startAct = rowDeviceIDDB + '' + sTime + '' + eTime + '' + ruleRow[j].rowStartAction + '' + days + '' + sensorValue;
            var dupStartAct = device + '' + rule.When.StartTime + '' + rule.When.RuleDuration + '' + rule.Devices[device].StartAction + '' + ruleDays + '' + rule.SelectedSensorsValue;
            var conStartAct = device + '' + rule.When.StartTime + '' + rule.When.RuleDuration + '' + complementAction(rule.Devices[device].StartAction) + '' + ruleDays + '' + rule.SelectedSensorsValue;

            var startActSimpleRule = rowDeviceIDDB + '' + sTime + '' + ruleRow[j].rowStartAction;
            var dupStartActSimpleRule = device + '' + rule.When.StartTime + '' + rule.Devices[device].StartAction;
                         
            /*******Logic for Away Mode Rule**************/
            var result = ruleConflicts(rule, ruleRow[j], endTime);
            
             if (result) {
                if (rule.RuleType == sessionStore.AWAY_MODE) {
                    if (ruleRow[j].rowType == sessionStore.AWAY_MODE) {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                        return true;
                    }
                    else {
                        window.sessionStorage.setItem("away_conflict", "1");
                    }
                }
                else {
                    if (ruleRow[j].rowType == sessionStore.AWAY_MODE && ruleRow[j].rowState != "0") {
                        window.sessionStorage.setItem("away_conflict", "1");
                    }
                }
            }
            
           /*******Logic for Away Mode Rule**************/

            if (rule.RuleType == sessionStore.SIMPLE_SWITCH) {
            	if ((!checkDayOverlap(rule, ruleRow[j]))||(!deviceUsed(rule, ruleRow[j].rowDeviceID))||(ruleRow[j].rowState != '1')) continue;
            	var conflict=false;
            	var duplicate = false;
            	if(rule.When.StartTime==endTime&&ruleRow[j].rowEndAction != rule.Devices[device].StartAction && ruleRow[j].rowType != sessionStore.AWAY_MODE){

                    var date=new Date();
                    var today = parseInt(date.getUTCDay()) + 1;

                    if (rule.When.StartSRSS === "Sunrise"){
                        //var currTime = rule[sessionStore.SRSS_SELECTED_DAYS][today]["timeSR"];
                        var currTime = wemo.items['SR'];
                    }
                    else if(rule.When.StartSRSS === "Sunset")
                        //var currTime = rule[sessionStore.SRSS_SELECTED_DAYS][today]["timeSS"];
                        var currTime = wemo.items['SS'];
                    else{
                        var currTime = wemoUtil.convertMillisecondsToAMPM(sTime);
                    }

                    nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                    showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, currTime, wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
            		return true;
    			}
                // Fix for WEMO-24650
                else if (rule.When.StartTime == ruleRow[j].rowStartTime && ruleRow[j].rowStartAction != rule.Devices[device].StartAction && ruleRow[j].rowType != sessionStore.AWAY_MODE) {

                    var date=new Date();
                    var today = parseInt(date.getUTCDay()) + 1;

                    if (rule.When.StartSRSS === "Sunrise"){
                        //var currTime = rule[sessionStore.SRSS_SELECTED_DAYS][today]["timeSR"];
                        var currTime = wemo.items['SR'];
                    }
                    else if(rule.When.StartSRSS === "Sunset"){
                        var currTime = wemo.items['SS'];
                        //var currTime = rule[sessionStore.SRSS_SELECTED_DAYS][today]["timeSS"];
                    }
                    else{
                        var currTime = wemoUtil.convertMillisecondsToAMPM(sTime);
                    }
                    nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                    showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, currTime, wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                    return true;
                }
                else if (startActSimpleRule == dupStartActSimpleRule) {
                	// Away mode rule has highest priority, so dont do duplicate check here 
                	if (ruleRow[j].rowType != sessionStore.AWAY_MODE && rule.RuleType != sessionStore.AWAY_MODE) {
                		 duplicate=true;
                	 }
                }
            	else if (conRuleStartAct == conRowEndAct) {
                	return false;
                
                } else if (endActSimple == dupStartActSimple || startActSimple == dupStartActSimple) {
                    if (days == "0" && ruleDays != 0) {
                        if (ruleRow[j].rowStartAction != rule.Devices[device].StartAction) {
                        	conflict=true;
                        } else {
                        	duplicate = true;
                        }
                    }
                    else 
                    {
                    	if(rule.When.StartTime == ruleRow[j].rowStartTime && ruleRow[j].rowStartAction != rule.Devices[device].StartAction ){
                    		conflict=true;
                    	}
                    	else if(rule.When.StartTime==endTime&&ruleRow[j].rowEndAction != rule.Devices[device].StartAction){
                    		conflict=true;
                    	}
                    	
                    }
                }
            	
//            	if(ruleRow[j].rowStartTime < rule.When.StartTime && rule.When.StartTime < endTime){
//            		conflict=true;
//                }
            	if(conflict && ruleRow[j].rowType == sessionStore.AWAY_MODE){
            		return false;
            	}
            	if(conflict)
            	{

                    var date=new Date();
                    var today = parseInt(date.getUTCDay()) + 1;

                    if (rule.When.StartSRSS === "Sunrise"){
                        //var currTime = rule[sessionStore.SRSS_SELECTED_DAYS][today]["timeSR"];
                        var currTime = wemo.items['SR'];
                    }
                    else if(rule.When.StartSRSS === "Sunset"){
                        //var currTime = rule[sessionStore.SRSS_SELECTED_DAYS][today]["timeSS"];
                        var currTime = wemo.items['SS'];
                    }
                    else{
                        //var currTime = sTime;
                        var currTime = wemoUtil.convertMillisecondsToAMPM(sTime);
                    }

                    nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
            		showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, currTime, wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
            		return true;
            	}
            	else if(duplicate)
            	{
                    nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
            	    showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "duplicate", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                    return true;
            	}
               
            } else if (rule.RuleType == sessionStore.TIME_INTERVAL) {
                if (conRowStartAct == conRuleEndAct) {
                    if (ruleRow[j].rowState == '1') {
                        //showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict");
                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                        return true;
                    } else {
                        // alert("No Conflict Data...");
                        return false;
                    }

                }
            } else if (rule.RuleType == sessionStore.MOTION_CONTROLLED) {
                if (startActAllDay == dupStartActAllDay) {
                    if (days == "0" && ruleDays != 0) {
                        if (ruleRow[j].rowStartAction != rule.Devices[device].StartAction) {
                            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                            showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "AllDay");
                            return true;
                        } else {
                            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                            showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "duplicate", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                            return true;
                        }
                    }
                }
            }

        }
        return false;
    }
    
    /*******Logic for Away Mode Rule**************/
    
    function ruleConflicts(rule2, rule1, endTime) {

        if (!deviceUsed(rule2, rule1.rowDeviceID)) {
            return false;
        }        
        if (checkDayOverlap(rule2, rule1)) {
            //We don't check next day overlap to be consistent with iOS code
            //See RuleUtility.m:1771

            var rule1End = parseInt(rule1.rowStartTime) + parseInt(rule1.rowRuleDuration);
            
            if(parseInt(rule1.rowStartTime) == rule2.When.StartTime || rule1End == rule2.When.StartTime){
            	return true;
            }
            //Case 1
            //New rule interval is inside existing interval
            if (parseInt(rule1.rowStartTime) < rule2.When.StartTime && rule1End > rule2.When.EndTime) {
                return true;
            }
            //Case 1 //Removing as discussed with team
            //New rule End time check onflict with start time of existing interval
            /*if (rule2.When.EndTime <rule1.rowStartTime ) {
             return true;
             }*/

            //Case 2
            //New rule interval partialy overlaps with existing
            if (rule2.When.StartTime < parseInt(rule1.rowStartTime) && (rule2.When.EndTime < rule1End && rule2.When.EndTime > parseInt(rule1.rowStartTime))) {
                return true;
            }
            if (rule2.When.EndTime > endTime && (rule2.When.StartTime > parseInt(rule1.rowStartTime) && rule2.When.StartTime < rule1End)) {
                return true;
            }

            //Case 3
            //Existing rule interval is inside new rule interval
            if (rule2.When.StartTime < parseInt(rule1.rowStartTime) && rule2.When.EndTime > rule1End) {
                return true;
            }

        }
    }
    
    /*******Logic for Away Mode Rule**************/
    
    function checkDayOverlap(rule1, rule2) {
    	var arrDays = rule1.SelectedDayOrRange.split("-");
    	var Days = getDays(arrDays);
    	for (var i = 0; i < Days.length; i++) {
    		if (Days[i] == rule2.rowDayID) {
    			return true;
    		}
    	}

    	return false;
    }
    function getDays(arrDays) {
    	var Days = [];
    	trace("arrDays.length " + arrDays.length);
    	if (arrDays.length == 1) {
    		var deCodeDaysValue = deCodeDays(arrDays[0]);
    		switch ( deCodeDaysValue ) {
    		case 0:
    			Days = [1, 2, 3, 4, 5, 6, 7];
    			break;
    		case 8:
    			Days = [2, 3, 4, 5, 6];
    			break;
    		case 9:
    			Days = [7, 1];
    			break;
    		default: Days = [ deCodeDaysValue ]; //one day
    		}
    	} else {
    		for (var daysCount1 = 0; daysCount1 < arrDays.length; daysCount1++) {
    			Days.push(deCodeDays(arrDays[daysCount1]));
    		}
    	}

    	return Days;
    }
    //Function to check if device is used by rule
    function deviceUsed(rule, devid) {
    	
    	var searchType = devid.search("Bridge");

        if(searchType != -1 || searchType == true)
        {
            
            	if(devid.indexOf("^")!=-1)
				{
	             	var rowDeviceIDArr = devid.split("^");
	             	devid = rowDeviceIDArr[1];   
				}
				else
				{
					var rowDeviceIDArr = devid.split(":");
					devid = rowDeviceIDArr[2];   
				}  
            
        }
        
        if (Object.keys(rule.Devices).length > 0) {
            for (device in rule.Devices) {
                if (device == devid) {
                    return true;
                }
            }
        }

        return false;
    }


    function errorCB() {
        wemoUtil.infoLog(TAG, "Error inserting rule");
    }

    function successCB() {
        wemoUtil.infoLog(TAG, 'Successfully updated DB');
    }

    function successfullySaved() {
        wemoUtil.infoLog(TAG, 'Saved all the rules to Session');
//
        if (saved) {
//             navigator.notification.activityStart("Please Wait", "Updating");
            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
            nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", wemo.items['RULE_STATUS_SENDING_DB']]);
            wemoUtil.infoLog(TAG, 'Started pushing to plugins');

            setTimeout(function () {
                updateDevice();
            }, 1000);
        } else {
        	wemoUtil.infoLog(TAG, 'Not Updated'); 
        }		

    }

    function checkDbValues(rule) {
         
        var strDays = rule.SelectedDayOrRange;
        var arrDays = strDays.split("-");

        if (Object.keys(rule.Devices).length > 0) {
            for (device in rule.Devices) {
                for (var daysCount1 = 0; daysCount1 < arrDays.length; daysCount1++) { 
                    var rulesArray = [];
                    rulesArray.push(device);
                    rulesArray.push(deCodeDays(arrDays[daysCount1]));
                    rulesArray.push(rule.When.StartTime);
                    rulesArray.push(rule.When.RuleDuration);
                    rulesArray.push(rule.Devices[device].StartAction);
                    rulesArray.push(rule.Devices[device].EndAction);
                    rulesArray.push(rule.Devices[device].SensorDuration);
                    rulesArray.push(rule.SelectedSensorsValue);


                    var goAhead = checkValues(rulesArray);
                    if (goAhead == false) {
                        return false;
                    }

                }
            }
        }
    }

    function checkValues(rulesArray) {
        for (var i = 0; i < rulesArray.length; i++) {
            var val = rulesArray[i];
            
            if (val == undefined) {
                return false;
                //goAhead='N';
            }

        }
        return true;
    }

    function updateDevice() {
        var params = [];
        var ledsparams = [];
        var len = "";
        var ledparamlength = 0;
        var snsparamlength = 0;
        var j=0;
        var ledarr = [];

        $.each(rule.Devices, function(udn, obj1) {
            wemoUtil.infoLog(TAG, "UDN:  "+udn+" =1= "+obj1.SelectedLedValue);
            var val = $.trim(obj1.SelectedLedValue);
            //ledarr[j] = udn;
            ledarr[j] = obj1;

            if(val == 1)
                ledparamlength++;
            else if(val == 0)
                snsparamlength++;
            j++;
        });
 
        wemoUtil.infoLog(TAG, "SaveNewRule: snsparamlength: " + snsparamlength + "ledparamlength: " + ledparamlength);
        
        if(isRemoteEnabled)
        {
            params = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
            params = params.concat(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA));
            params = params.concat(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DIMMER_DATA));
            params = params.concat(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA));
            makePush(params);
        }
        else
        {
        	wemoUtil.getDevicesWithCallback(actions.SELECT_SWITCHES, function(params) {
                wemoUtil.getDevicesWithCallback(actions.SELECT_DIMMERS, function(dimmers) {
                    params = params.concat(dimmers);
                    wemoUtil.getDevicesWithCallback(actions.SELECT_INSIGHTS, function(insights) {
                        params = params.concat(insights);
                        wemoUtil.getDevicesWithCallback(actions.SELECT_MAKER, function(makers) {
                            wemoUtil.infoLog(TAG,"SaveNewRule: makers received for device plugin: " + makers);
                            params = params.concat(makers);

                            wemoUtil.infoLog(TAG, "SaveNewRule: Afer concat: total params received for device plugin: " + params);
                            makePush(params);
                        });
                    });
                });
            });
        }

        function makePush(params)
        {
        	
            if ((params && (typeof params != TYPE_OF.UN_DEFINED) && params.length > 0) || 
            	(ledparamlength > 0))
            {
                if(ledparamlength != null && ledparamlength > 0)
                    len = (params.length)+(ledparamlength);
                else
                    len = params.length;
                
                
                var isLEDInRule = 0;
                wemoUtil.infoLog(TAG, "SaveNewRule: led param length: " + ledparamlength);
                if(ledparamlength > 0)
                {
                	var ledCount = 0;
                    for (var dev1 = 0; dev1 < Object.keys(rule.Devices).length; dev1++) {
                        var slectedval = ledarr[dev1];
                        //var selectedLedVar = $.trim(rule.Devices[slectedval].SelectedLedValue);
                        var selectedLedVar = $.trim(ledarr[dev1].SelectedLedValue);

                        if(selectedLedVar == 1)
                        {
                            isLEDInRule = 1;
                            wemoUtil.infoLog(TAG, "SaveNewRule: is LED In Rule: " + isLEDInRule);
                            break;
                        }

                    }
                }
 
//                $.each(params,function(inx)
//                {
//                    wemoUtil.pushScheduleSwitch( params[inx].udn, inx, len);
//                });
                
                wemoUtil.infoLog(TAG, "SaveNewRule: " + JSON.stringify(rule.Devices));
                
                wemoUtil.infoLog(TAG, "SaveNewRule: " + JSON.stringify(params));
                var devicesLength = Object.keys(rule.Devices).length;
                var ruleDevices ='';
                for (var inx = 0; inx < devicesLength ; inx++) {
                 var udn = Object.keys(rule.Devices)[inx];
                 
                 for (var j =0; j < params.length ; j++){
                	 if(udn && udn!=null && params[j] && params[j]!=null && params[j].udn && params[j].udn!=null){
                		 
                		 wemoUtil.infoLog(TAG, "SaveNewRule: " + udn + ", params_udn: " + params[j].udn);
                         if(wemoUtil.isMakerDevice(udn) && wemoUtil.getOriginalMakerUDN(udn) == params[j].udn ){
                          wemoUtil.infoLog(TAG, "SaveNewRule: " + udn + ", params_udn: " + params[j].udn);
                          ruleDevices = ruleDevices + udn + ',';
                         
                         }else if(udn == params[j].udn){
                        	 
                          wemoUtil.infoLog(TAG, "SaveNewRule: " + udn + ", params_udn: " + params[j].udn);
                          ruleDevices = ruleDevices + udn + ',';
                         }
                	 }
                    }
                }
                
                ruleDevices = ruleDevices.substring(0, ruleDevices.length - 1);
                wemoUtil.pushScheduleSwitch( ruleDevices, inx, devicesLength, isLEDInRule, pushScheduleSwitchCallback);
                
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
                                wemoUtil.pushScheduleLedDevices(Object.keys(rule.Devices)[dev1],db,rule,ledCount,ledparamlength);
                                ledCount++;
                            }

                        }
                    }

                }
             }
        }
        
        

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

    function getRules(tx) {
        if (rule.selectedRowIndex!=undefined && rule.selectedRowIndex!=null){
            delete rule.selectedRowIndex;
        }
        tx.executeSql('SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.RuleDuration, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.Level, b.ZBCapabilityStart, b.ZBCapabilityEnd from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID order by a.Name COLLATE NOCASE', [],
            function(tx,results){
                var len = results.rows.length;
                var ruleRows=[];
                if(len>0) {
                    for(var i=0;i<len;i++){
                        ruleRows[i]=results.rows.item(i); 
                    }
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULES_DATA,ruleRows);

                }
            },errorCB);
    }

}
