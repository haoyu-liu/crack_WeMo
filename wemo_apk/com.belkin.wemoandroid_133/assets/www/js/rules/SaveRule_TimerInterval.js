var isEdit = window.sessionStorage.getItem(sessionStore.isEdit);
var soCheck = window.sessionStorage.getItem(sessionStore.HOUSE_SITTER_CHECK);
var isConflicting = false;
var hasDuplicate = false;

var TAG='SaveRule_TimerInterval.js: ';

if ( isEdit == "edit_timer_or_simple_rule" ) {
    isEdit = true;
}	else {
    isEdit = false;
}

function returnDay(dayID) {
    switch(parseInt(dayID)) {
        case 0 : return "Daily"; break;
        case 1 : return "Sun"; break;
        case 2 : return "Mon"; break;
        case 3 : return "Tue"; break;
        case 4 : return "Wed"; break;
        case 5 : return "Thu"; break;
        case 6 : return "Fri"; break;
        case 7 : return "Sat"; break;
        case 8 : return "Weekdays"; break;
        case 9 : return "Weekends"; break;
        default : wemoUtil.infoLog(TAG, "Inside default"); break;
    }
}
function deCodeDays(arg){
    wemoUtil.infoLog(TAG, "Inside De-Code Days:  "+arg);
    switch(arg){
        case "Daily" : return 0; break;
        case "Sun" : return 1; break;
        case "Mon" : return 2; break;
        case "Tue" : return 3; break;
        case "Wed" : return 4; break;
        case "Thu" : return 5; break;
        case "Fri" : return 6; break;
        case "Sat" : return 7; break;
        case "Weekdays" : return 8; break;
        case "Weekends" : return 9; break;
        case "Mon-Tue-Wed-Thu-Fri" : return 8; break;
        case "Sat-Sun" : return 9; break;
        case "Mon-Tue-Wed-Thu-Fri-Sat-Sun" : return 0; break;
        default : wemoUtil.infoLog(TAG, "Inside default"); break;
    }
}
function complementAction(x){
    x= parseInt(x);
    if(x==1) return 0;
    else if(x==0) return 1;
    else if(x==2) return 2;
}

function saveNewTimerRule_RULES_RULEDEVICES(arg, ruleObj){
    wemoUtil.infoLog(TAG, "Start of saveNewTimerRule_RULES_RULEDEVICES");
    var av_switches=[], av_dimmers=[], av_sensors=[], av_makers=[], av_leddevices = [];

    if(!isRemoteEnabled) {
        deviceTabPlugin.execute(
            function(params){
                if(params.length>0){
                    $.each(params,function(inx){
                        av_sensors[params[inx].udn]=params[inx].friendlyName;
                    });
                }
                else wemoUtil.infoLog(TAG, "No Sensors detected");

            },
            function(err){wemoUtil.infoLog(TAG, "Error detecting Sensors");},
            actions.SELECT_SENSORS,[]
        );

        deviceTabPlugin.execute(
            function(params){
                if(params.length>0){
                    $.each(params,function(inx){
                        av_switches[params[inx].udn]=params[inx].friendlyName;
                    });
                } else wemoUtil.infoLog(TAG, "No Switches detected");
            },
            function(err){wemoUtil.infoLog(TAG, "Error detecting Switches");},

            actions.SELECT_SWITCHES,[]
        );

        deviceTabPlugin.execute(
            function(params){
                if(params.length>0){
                    $.each(params,function(inx){
                        av_dimmers[params[inx].udn]=params[inx].friendlyName;
                    });
                } else wemoUtil.infoLog(TAG, "No Switches detected");
            },
            function(err){wemoUtil.infoLog(TAG, "Error detecting Switches");},

            actions.SELECT_DIMMERS,[]
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

        //LED Array :
        deviceTabPlugin.execute(
            function(params){
                if(params.length>0){
                    $.each(params,function(inx){
                        av_leddevices[params[inx].udn]=params[inx].friendlyName;
                    });
                } else wemoUtil.infoLog(TAG, "No Leds detected");
            },
            function(err){wemoUtil.infoLog(TAG, "Error detecting Leds");},

            actions.SELECT_LED_DEVICES,[]
        );
        deviceTabPlugin.execute(
            function (params) {
                if (params.length > 0) {
                    $.each(params, function (inx) {
                        av_makers[params[inx].udn]=params[inx].friendlyName;
                    });
                } else wemoUtil.infoLog(TAG, "No Maker is detected");
            },
            function (err) {
                wemoUtil.infoLog(TAG, "Error detecting Maker");
            },
            actions.SELECT_MAKER,[]
        );
    }
    else
    {
        var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
        var arrayDimmerObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DIMMER_DATA);
        var arrayInsightObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA);
        var arraySensorObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SENSOR_DATA);
        var arrayMakerObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA);
        var arrayLedDeviceObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_DATA);

        if(arraySwitchObjects.length>0){
            $.each(arraySwitchObjects,function(inx){
                av_switches[arraySwitchObjects[inx].udn]=arraySwitchObjects[inx].friendlyName;
            });
        }

        if(arrayDimmerObjects.length>0){
            $.each(arrayDimmerObjects,function(inx){
                av_dimmers[arrayDimmerObjects[inx].udn]=arrayDimmerObjects[inx].friendlyName;
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
    }
    var rule=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
    var isError = false;
    var saved = false;

    if(Object.keys(rule.Devices).length<=0){
        alert("Please select devices");
        return;
    }

    if ( rule.When.OnModeOffset == undefined ) rule.When.OnModeOffset = 0;
    if ( rule.When.OffModeOffset == undefined ) rule.When.OffModeOffset = 0;

    var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
    db.transaction(getMax, errorCB, successCB);
    db.transaction(getRules, errorCB, successfullySaved);

    function getMax(tx){

        tx.executeSql('SELECT RuleID  FROM RULES ORDER BY CAST(RuleID as INT) DESC',[], querySuccess, errorCB);

        function querySuccess(tx,res){
            if(parseInt(res.rows.length)>0){
                var len = parseInt(res.rows.item(0).RuleID)+1;
            }
            else {
                len=1;
            }
            var continueSave = checkDbValues(rule);

            if (continueSave==false){
                alert("Data Not Saved successfully...");
                saved = false;
                return false;
            }


            var wemo_rule_type=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_TYPE);
            var executeQuery;

            if ( isEdit ){
                executeQuery='SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.DeviceID, b.StartTime, b.RuleDuration, b.StartAction, b.EndAction, b.DayID, b.Value, b.SensorDuration  from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID where b.RuleID <> '+ruleObj.id+' order by a.Name COLLATE NOCASE';
            }else{
                executeQuery='SELECT distinct a.RuleID, a.Name, a.Type, b.DeviceID, a.State, b.StartTime, b.RuleDuration, b.StartAction, b.EndAction, b.DayID, b.Value, b.SensorDuration  from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID order by a.Name COLLATE NOCASE';
            }


            tx.executeSql(executeQuery, [],
                function(tx,results){
                    var rulen = results.rows.length;
                    var strDays = rule.SelectedDayOrRange;
                    var duplicate = true;
                    var arrDays = strDays.split("-");
                    var rowDevice="";

                    var rowSensorDuration;


                    if(rulen>0) {
                        var grouped = {};
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
                        for(device in rule.Devices){
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

                                    if(selectedDev == 1 || device.match(/dimmer/gi))
                                    {
                                        if(device.match(/dimmer/gi))
                                        {
                                            deviceFriendname = av_dimmers[device];

                                        }else if(av_leddevices[device] == "" || av_leddevices[device] == undefined)
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
                                        duplicate = verifyConflictsDuplicates(device, records, rule, days, rowSensorValue, av_makers[wemoUtil.getOriginalMakerUDN(device)], sensorName);
                                    }
                                    else{
                                        duplicate= !isConflicting && verifyConflictsDuplicates(device, records, rule, days, rowSensorValue, deviceFriendname, sensorName);
                                        if (duplicate) {
                                            hasDuplicate = true;
                                        }
                                    }
                                }
                            }
                        });
                        //away mode popups 
                    }
                    else{
                        var wemo_rule_type = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_TYPE);
//                        rule.State = 1;
                            if (rule.When.isFirmWareSupported != undefined && rule.When.isFirmWareSupported === "false") {
                                rule.State = 0;
                            }
                        if (isEdit) {
                            tx.executeSql("DELETE FROM RULES WHERE RuleID='" + ruleObj.id + "'", [], function () {
                                wemoUtil.infoLog(TAG, "Rule with ID : " + ruleObj.id + " is deleted");
                            }, errorCB);
                            tx.executeSql("DELETE FROM RULEDEVICES WHERE RuleID=" + ruleObj.id, [], function () {
                                wemoUtil.infoLog(TAG, "Rule with ID : " + ruleObj.id + " is deleted");
                            }, errorCB);
                            if (soCheck == "1") {
                                tx.executeSql("DELETE FROM TARGETDEVICES WHERE RuleID='"+ ruleObj.id+"'", [], function () {
                                    wemoUtil.infoLog(TAG, "Rule with ID : " + ruleObj.id + " is deleted");
                                }, errorCB);
                            }

                        }
                        var ruleName = rule.RuleName.replace(/\"/g, '&quot;');

                        if (isEdit){
                            rule.State = window.sessionStorage.getItem(sessionStore.RULE_STATE_EDIT_MODE);
                            tx.executeSql('INSERT INTO RULES (RuleID, Name, Type, RuleOrder, StartDate, EndDate,State, Sync) VALUES ("' + len + '","' + ruleName + '", "' + rule.RuleType + '", "2", "12201983", "12201983", "' + rule.State + '", "NOSYNC")');
                            window.sessionStorage.removeItem(sessionStore.RULE_STATE_EDIT_MODE);
                        }else{
                            tx.executeSql('INSERT INTO RULES (RuleID, Name, Type, RuleOrder, StartDate, EndDate,State, Sync) VALUES ("' + len + '","' + ruleName + '", "' + rule.RuleType + '", "2", "12201983", "12201983", "' + rule.State + '", "NOSYNC")');
                        }
                        /////////////////////////BLOCKEDRULES------------Insert Rule Status based on Firmware-------------

                        var StartTime = "";
                        var RuleDuration = "";
                        var deviceIndex = 0;
                        if(Object.keys(rule.Devices).length>0){
                            for(device in rule.Devices){
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
                                        var ledCapabiltyON = '10006='+tempStartAct;
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

                                                RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                            } else {
                                                StartTime = rule.When.StartTime;
                                                RuleDuration = rule.When.RuleDuration;
                                            }
                                            if ( rule.When.EndSRSS != undefined ) {
                                                RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                            }
                                            if ( StartTime == undefined ) StartTime = rule.When.StartTime;
                                            if ( RuleDuration == undefined ) RuleDuration = rule.When.RuleDuration;
                                           
                                            var StartSRSSoffset = rule.When.StartSRSSoffset;
                                            
                                            if (rule.When.StartSRSS == undefined) 
										    	StartSRSSoffset =  -(fadeinInp/baseValue);

                                            tempFadeINStrTime = (StartTime) - (fadeinInp/baseValue);

                                             if (device.indexOf("uuid") === -1) {
                                                 var deviceId = bridgeUDN+":"+device;
                                                    tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+tempFadeINStrTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyON+'","","'+StartSRSSoffset+'", "'+rule.When.OffModeOffset+'",-1,"'+rule.When.EndTime+'")');
                                                    tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+tempFadeINStrTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyBrightness+'","","'+StartSRSSoffset+'", "'+rule.When.OffModeOffset+'",-1,"'+rule.When.EndTime+'")');
                                             } if (device.match(/dimmer/gi)) {
                                                 var deviceId = device;
                                                 tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+tempFadeINStrTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+dimmerCapabiltyBrightness+'","-1","'+StartSRSSoffset+'", "'+rule.When.OffModeOffset+'",-1,"'+rule.When.EndTime+'")');

                                             }

                                        }
                                    }
                                    else if(startAction == 1 && endAction == 0)
                                    {
                                        //untill 
                                        if(rule.RuleType == sessionStore.AWAY_MODE)
                                        {
                                            var tempStartAct = rule.Devices[device].StartAction;
                                            var ledCapabiltyON = "0";
                                            var ledCapabiltyBrightnessON = "0";

                                            var tempEndAct = rule.Devices[device].EndAction;
                                            var ledCapabiltyOFF = "0";
                                            var ledCapabiltyBrightnessOFF = "0";
                                            var tempFadeoutStrTime = rule.When.EndTime; 
                                        }
                                        else
                                        {
                                            var tempStartAct = rule.Devices[device].StartAction;
                                            var ledCapabiltyON = '10006='+tempStartAct;
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
                                        	var ledCapabiltyOFF = '10006='+tempEndAct;
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
                                        }


                                        for(var daysCount1=0; daysCount1 < arrDays.length; daysCount1++){

                                            if ( rule.When.StartSRSS != undefined ) {
                                                if (rule.When.StartSRSS === "Sunrise") StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSR"];
                                                else StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSS"];

                                                RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                            } else {
                                                StartTime = rule.When.StartTime;
                                                RuleDuration = rule.When.RuleDuration;
                                            }
                                            if ( rule.When.EndSRSS != undefined ) {
                                                RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                            }
                                            if ( StartTime == undefined ) StartTime = rule.When.StartTime;
                                            if ( RuleDuration == undefined ) RuleDuration = rule.When.RuleDuration;

                                            if (device.indexOf("uuid") === -1) {
                                             var deviceId = bridgeUDN+":"+device;
                                            } else {
                                               var deviceId = device;
                                            }

                                            if(rule.RuleType == sessionStore.AWAY_MODE) {
                                                tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+ RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","-1","-1",'+rule.When.OnModeOffset+','+rule.When.OffModeOffset+',-1,"'+rule.When.EndTime+'")');
                                            } else {


                                             	if (rule.When.StartSRSS == undefined){
                                            		rule.When.OnModeOffset =  -(fadeinInp/baseValue);
												}
                                            	if(rule.When.EndSRSS == undefined){
                                            		rule.When.OffModeOffset = fadeoutInp/baseValue;
            						        	}
                                            	var tempFadeINStrTime = StartTime - (fadeinInp/baseValue);

                                                if (device.indexOf("uuid") === -1) {
                                                     tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+tempFadeINStrTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyON+'","'+ledCapabiltyOFF+'","'+rule.When.OnModeOffset+'", "'+rule.When.OffModeOffset+'",-1,"'+rule.When.EndTime+'")');
                                                     tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+tempFadeINStrTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyBrightnessON+'","'+ledCapabiltyBrightnessOFF+'","'+rule.When.OnModeOffset+'", "'+rule.When.OffModeOffset+'",-1,"'+rule.When.EndTime+'")');
                                                } else {
                                                     tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+tempFadeINStrTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+dimmerCapabiltyBrightnessON+'","'+dimmerCapabiltyBrightnessOFF+'","'+rule.When.OnModeOffset+'", "'+rule.When.OffModeOffset+'",-1,"'+rule.When.EndTime+'")');

                                                }

                                            }
                                        }

                                    }
                                    else if(startAction == 0 && endAction == 0)
                                    {
                                        //off
                                        var tempEndAct = rule.Devices[device].EndAction;
                                        var fadeoutInp = rule.Devices[device].FadeOut;
                                        //if(fadeoutInp ==0 || fadeoutInp == sessionStore.DEFAULT_FADEOUT_VALUE){
                                            var ledCapabiltyOFF = '10006='+tempEndAct;
                                        /*}else{
                                            var ledCapabiltyOFF = '0';
                                        }*/
                                        var brightnessCalVal = 0;
                                        var ledCapabiltyBrightness = ledCapabilities.DIMMING+'='+brightnessCalVal+":"+fadeoutInp;
                                        //var tempFadeoutStrTime = (rule.When.StartTime) - (fadeoutInp/10);
                                        var tempFadeoutStrTime = (rule.When.StartTime) + (fadeoutInp/baseValue);
                                        if (device.match(/dimmer/gi)) {
                                             var dimmerCapabiltyBrightness = tempEndAct+":"+brightnessCalVal+":"+fadeoutInp;
                                        }

                                        for(var daysCount1=0; daysCount1 < arrDays.length; daysCount1++){

                                            if ( rule.When.StartSRSS != undefined ) {
                                                if (rule.When.StartSRSS === "Sunrise") StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSR"];
                                                else StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSS"];

                                                RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                            } else {
                                                StartTime = rule.When.StartTime;
                                                RuleDuration = rule.When.RuleDuration;
                                            }
                                            if ( rule.When.EndSRSS != undefined ) {
                                                RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                            }
                                            if ( StartTime == undefined ) StartTime = rule.When.StartTime;
                                            if ( RuleDuration == undefined ) RuleDuration = rule.When.RuleDuration;
                                            
                                            var StartSRSSoffset = rule.When.StartSRSSoffset;
                                            
                                            if (rule.When.StartSRSS == undefined) 
										    	StartSRSSoffset =  fadeoutInp/baseValue;

                                            tempFadeoutStrTime = (StartTime) + (fadeoutInp/baseValue);
                                             if (device.indexOf("uuid") === -1) {
                                                 var deviceId = bridgeUDN+":"+device;
                                                 tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyOFF+'","","'+StartSRSSoffset+'", "'+rule.When.OffModeOffset+'",-1,"'+rule.When.EndTime+'")');
                                                 tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyBrightness+'","","'+StartSRSSoffset+'", "'+rule.When.OffModeOffset+'",-1,"'+rule.When.EndTime+'")');

                                              } else if (device.match(/dimmer/gi)) {
                                                  var deviceId = device;
                                                  tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+dimmerCapabiltyBrightness+'","-1","'+StartSRSSoffset+'", "'+rule.When.OffModeOffset+'",-1,"'+rule.When.EndTime+'")');

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

                                    for(var daysCount1=0; daysCount1 < arrDays.length; daysCount1++){
                                        if ( rule.When.StartSRSS != undefined ) {
                                            if (rule.When.StartSRSS === "Sunrise") StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSR"];
                                            else StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSS"];

                                            RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                        } else
                                        if ( rule.When.EndSRSS != undefined ) {
                                            StartTime = rule.When.StartTime;
                                            RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                        } else {
                                            StartTime = rule.When.StartTime;
                                            RuleDuration = rule.When.RuleDuration;
                                        }
                                        if ( StartTime == undefined ) StartTime = rule.When.StartTime;
                                        if ( RuleDuration == undefined ) RuleDuration = rule.When.RuleDuration;
                                        if ( soCheck == "1" && (ruleObj.When.StartSRSS != undefined || ruleObj.When.EndSRSS != undefined) ) {
                                            StartTime = parseInt(StartTime, 10);
                                        }

                                        if(isMakerDevice){
                                            tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+newUdn+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+RuleDuration+'", '+rule.Devices[device].StartAction+', '+rule.Devices[device].EndAction+', "'+rule.Devices[device].SensorDuration+'","-1","-1","-1","","",' + rule.When.OnModeOffset + ',' + rule.When.OffModeOffset + ',-1,"'+rule.When.EndTime+'")');
                                        } else{
                                            tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES (' + len + ',"' + device + '", "0", "' + deCodeDays(arrDays[daysCount1]) + '", "' + StartTime + '","' + RuleDuration + '", ' + rule.Devices[device].StartAction + ', ' + rule.Devices[device].EndAction + ', "' + rule.Devices[device].SensorDuration + '","-1","-1","-1","","",' + rule.When.OnModeOffset + ',' + rule.When.OffModeOffset + ',-1,"'+rule.When.EndTime+'")');
                                        }
                                    }

                                }

                                if (soCheck == "1") {
                                    tx.executeSql('INSERT INTO TARGETDEVICES (RuleID, DeviceID, DeviceIndex) VALUES ("' + len + '","' + device + '", "' + deviceIndex + '")');
                                    deviceIndex++;
                                }
                            } //for loop
                        }

                        saved = true;

                        /////////////////////////BLOCKEDRULES-----------Insert Record in BLOCKEDRULES if Firmware is not supported--------------

                        if(window.sessionStorage.getItem("rule_Id_identifier") == "1"){
                        	window.sessionStorage.setItem("rule_id_disable", len);
                        	window.sessionStorage.removeItem("rule_Id_identifier");
                        }
                        if(rule.When.isFirmWareSupported != undefined && rule.When.isFirmWareSupported === "false"){

                            tx.executeSql('INSERT INTO BLOCKEDRULES (Primarykey, ruleId) VALUES ("'+len+'", "'+len+'")',[],
                                function(tx,results){

                                },
                                function(tx,results){

                                });

                        }
                        /////////////////////////BLOCKEDRULES-----------Insert Record in BLOCKEDRULES if Firmware is not supported--------------
                    }

                    if(rulen>0) {
                        if((!duplicate && !hasDuplicate)|| isConflicting ){

                            var wemo_rule_type=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_TYPE);

                            if ( isEdit ){
                                tx.executeSql("DELETE FROM RULES WHERE RuleID='"+ruleObj.id+"'", [], function(){wemoUtil.infoLog(TAG, "Rule with ID : "+ruleObj.id+" is deleted");}, errorCB);
                                tx.executeSql("DELETE FROM RULEDEVICES WHERE RuleID="+ruleObj.id, [], function(){wemoUtil.infoLog(TAG, "Rule with ID : "+ruleObj.id+" is deleted");}, errorCB);
                            }
                            /////////////////////////BLOCKEDRULES------------Insert Rule Status based on Firmware-------------
//                            rule.State = 1;
                            //	 if ((rule.When.StartSRSS != undefined && rule.When.EndSRSS == undefined) || (rule.When.StartSRSS == undefined && rule.When.EndSRSS != undefined) || (rule.When.StartSRSS != undefined && rule.When.EndSRSS != undefined)) {
                            if (rule.When.isFirmWareSupported != undefined && rule.When.isFirmWareSupported === "false") {
                                rule.State = 0;
                            }
                            //   }

                            if (rule.selectedRowIndex!=undefined && rule.selectedRowIndex!=null){
                                len=rule.selectedRowIndex;
                            }
                            var rule_name = rule.RuleName.replace(/\"/g,'&quot;');
                            tx.executeSql('INSERT INTO RULES (RuleID, Name, Type, RuleOrder, StartDate, EndDate,State, Sync) VALUES ("'+len+'","'+rule_name+'", "'+rule.RuleType+'", "2", "12201983", "12201983", "'+rule.State+'", "NOSYNC")');

                            if(isConflicting){
                                var rule_obj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.COUNTDOWN_RULE_DATA);
                                tx.executeSql('UPDATE RULES SET State=? WHERE RuleID in ("'+rule_obj.rowRuleID+'")', [0], function(tx,results){},function(tx,results){});
                             }
                            /////////////////////////BLOCKEDRULES------------Insert Rule Status based on Firmware-------------

                            var StartTime = "";
                            var RuleDuration = "";
                            var deviceIndex = 0;
                            if(Object.keys(rule.Devices).length>0){
                                for(device in rule.Devices){
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
                                        
                                        if(startAction == 1 && endAction == 1)
                                        {
                                            //on
                                            var tempStartAct = rule.Devices[device].StartAction;
                                            var ledCapabiltyON = "10006="+tempStartAct;
                                            var fadeinInp = rule.Devices[device].FadeIn;
                                            var brightnessInp = rule.Devices[device].Brightness;
                                            brightnessInp = brightnessInp.replace(/%$/, '');
                                            var brightnessCalVal = (brightnessInp * AllowedVal)/100;
                                            brightnessCalVal = Math.round(brightnessCalVal);
                                            var ledCapabiltyBrightness = ledCapabilities.DIMMING+"="+brightnessCalVal+":"+fadeinInp;
                                            var tempFadeINStrTime = (rule.When.StartTime) - (fadeinInp/baseValue);

                                            for(var daysCount1=0; daysCount1 < arrDays.length; daysCount1++){

                                                if ( rule.When.StartSRSS != undefined ) {
                                                    if (rule.When.StartSRSS === "Sunrise") StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSR"];
                                                    else StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSS"];

                                                    RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                                } else {
                                                    StartTime = rule.When.StartTime;
                                                    RuleDuration = rule.When.RuleDuration;
                                                }
                                                if ( rule.When.EndSRSS != undefined ) {
                                                    RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                                }
                                                if ( StartTime == undefined ) StartTime = rule.When.StartTime;
                                                if ( RuleDuration == undefined ) RuleDuration = rule.When.RuleDuration;
                                                if ( soCheck == "1" && (ruleObj.When.StartSRSS != undefined || ruleObj.When.EndSRSS != undefined) ) {
                                                    StartTime = parseInt(StartTime, 10) ;
                                                }

                                                if (device.match(/dimmer/gi)) {
                                                    var dimmerCapabiltyBrightness = tempStartAct+":"+brightnessInp+":"+fadeinInp;
                                                }
                                                var StartSRSSoffset = rule.When.StartSRSSoffset;
                                                
                                                if (rule.When.StartSRSS == undefined) 
    										    	StartSRSSoffset =  -(fadeinInp/baseValue);
                                                
                                                tempFadeINStrTime = (StartTime) - (fadeinInp/baseValue);

                                                if (device.indexOf("uuid") === -1) {
                                                    var deviceId = bridgeUDN+":"+device;
                                                    tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+tempFadeINStrTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyON+'","","'+StartSRSSoffset+'", "'+rule.When.OffModeOffset+'",-1,"'+rule.When.EndTime+'")');
                                                    tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+tempFadeINStrTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyBrightness+'","","'+StartSRSSoffset+'", "'+rule.When.OffModeOffset+'",-1,"'+rule.When.EndTime+'")');

                                                } else if (device.match(/dimmer/gi)) {
                                                    var deviceId = device;
                                                    tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+tempFadeINStrTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+dimmerCapabiltyBrightness+'","-1","'+StartSRSSoffset+'", "'+rule.When.OffModeOffset+'",-1,"'+rule.When.EndTime+'")');
                                                }

                                            }
                                        }
                                        else if(startAction == 1 && endAction == 0)
                                        {
                                            //untill
                                            if(rule.RuleType == sessionStore.AWAY_MODE)
                                            {
                                                var tempStartAct = rule.Devices[device].StartAction;
                                                var ledCapabiltyON = "0";
                                                var ledCapabiltyBrightnessON = "0";

                                                var tempEndAct = rule.Devices[device].EndAction;
                                                var ledCapabiltyOFF = "0";
                                                var ledCapabiltyBrightnessOFF = "0";
                                                var tempFadeoutStrTime = rule.When.EndTime; 
                                            }
                                            else
                                            {
                                                var tempStartAct = rule.Devices[device].StartAction;
                                                var ledCapabiltyON = "10006="+tempStartAct;
                                                var fadeinInp = rule.Devices[device].FadeIn;
                                                var brightnessInp = rule.Devices[device].Brightness;
                                                brightnessInp = brightnessInp.replace(/%$/, '');
                                                var brightnessCalVal = (brightnessInp * AllowedVal)/100;
                                                brightnessCalVal = Math.round(brightnessCalVal);
                                                var ledCapabiltyBrightnessON = ledCapabilities.DIMMING+"="+brightnessCalVal+":"+fadeinInp;


                                                var tempEndAct = rule.Devices[device].EndAction;
                                                var fadeoutInp = rule.Devices[device].FadeOut;
                                                //if(fadeoutInp ==0 || fadeoutInp == sessionStore.DEFAULT_FADEOUT_VALUE){
                                                    var ledCapabiltyOFF = '10006='+tempEndAct;
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

                                            }


                                            for(var daysCount1=0; daysCount1 < arrDays.length; daysCount1++){

                                                if ( rule.When.StartSRSS != undefined ) {
                                                    if (rule.When.StartSRSS === "Sunrise") StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSR"];
                                                    else StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSS"];

                                                    RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                                } else {
                                                    StartTime = rule.When.StartTime;
                                                    RuleDuration = rule.When.RuleDuration;
                                                }
                                                if ( rule.When.EndSRSS != undefined ) {
                                                    RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                                }
                                                if ( StartTime == undefined ) StartTime = rule.When.StartTime;
                                                if ( RuleDuration == undefined ) RuleDuration = rule.When.RuleDuration;
                                                if ( soCheck == "1" && (ruleObj.When.StartSRSS != undefined || ruleObj.When.EndSRSS != undefined) ) {
                                                    StartTime = parseInt(StartTime, 10) ;
                                                }

                                                 if (device.indexOf("uuid") === -1) {
                                                     var deviceId = bridgeUDN+":"+device;
                                                  } else {
                                                       var deviceId = device;
                                                  }

                                                if(rule.RuleType == sessionStore.AWAY_MODE)
                                                {
                                                    tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+ RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","-1","-1",'+rule.When.OnModeOffset+','+rule.When.OffModeOffset+',-1,"'+rule.When.EndTime+'")');
                                                }
                                                else
                                                {
                                                	
                                                	if (rule.When.StartSRSS == undefined){
                                                		rule.When.OnModeOffset =  -(fadeinInp/baseValue);
    												}
                                                	if(rule.When.EndSRSS == undefined){
                                                  		rule.When.OffModeOffset = fadeoutInp/baseValue;
                						        	}
                                                	
                                                	var tempFadeINStrTime = StartTime - (fadeinInp/baseValue);

                                                   if (device.indexOf("uuid") === -1) {
                                                       tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+tempFadeINStrTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyON+'","'+ledCapabiltyOFF+'","'+rule.When.OnModeOffset+'", "'+rule.When.OffModeOffset+'",-1,"'+rule.When.EndTime+'")');
                                                       tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+tempFadeINStrTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyBrightnessON+'","'+ledCapabiltyBrightnessOFF+'","'+rule.When.OnModeOffset+'", "'+rule.When.OffModeOffset+'",-1,"'+rule.When.EndTime+'")');

                                                   } else if (device.match(/dimmer/gi)) {
                                                       tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+tempFadeINStrTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+dimmerCapabiltyBrightnessON+'","'+dimmerCapabiltyBrightnessOFF+'","'+rule.When.OnModeOffset+'", "'+rule.When.OffModeOffset+'",-1,"'+rule.When.EndTime+'")');
                                                   }


                                                }

                                            }

                                        }
                                        else if(startAction == 0 && endAction == 0)
                                        {
                                            //off
                                            var tempEndAct = rule.Devices[device].EndAction;
                                            var fadeoutInp = rule.Devices[device].FadeOut;
                                            //if(fadeoutInp ==0 || fadeoutInp == sessionStore.DEFAULT_FADEOUT_VALUE){
                                        	var ledCapabiltyOFF = '10006='+tempEndAct;
                                            /*}else{
                                        	var ledCapabiltyOFF = '0';
                                            }*/
                                            var brightnessCalVal = 0;
                                            var ledCapabiltyBrightness = ledCapabilities.DIMMING+"="+brightnessCalVal+":"+fadeoutInp;
                                            //var tempFadeoutStrTime = (rule.When.StartTime) - (fadeoutInp/10);
                                            var tempFadeoutStrTime = (rule.When.StartTime) + (fadeoutInp/baseValue);
                                            if (device.match(/dimmer/gi)) {
                                                var dimmerCapabiltyBrightness = tempEndAct+":"+brightnessCalVal+":"+fadeoutInp;
                                            }

                                            for(var daysCount1=0; daysCount1 < arrDays.length; daysCount1++){

                                                if ( rule.When.StartSRSS != undefined ) {
                                                    if (rule.When.StartSRSS === "Sunrise") StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSR"];
                                                    else StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSS"];

                                                    RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                                } else {
                                                    StartTime = rule.When.StartTime;
                                                    RuleDuration = rule.When.RuleDuration;
                                                }
                                                if ( rule.When.EndSRSS != undefined ) {
                                                    RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                                }
                                                if ( StartTime == undefined ) StartTime = rule.When.StartTime;
                                                if ( RuleDuration == undefined ) RuleDuration = rule.When.RuleDuration;
                                                if ( soCheck == "1" && (ruleObj.When.StartSRSS != undefined || ruleObj.When.EndSRSS != undefined) ) {
                                                    StartTime = parseInt(StartTime, 10) ;
                                                }
                                                
                                                var StartSRSSoffset = rule.When.StartSRSSoffset;
                                                
                                                if (rule.When.StartSRSS == undefined) 
    										    	StartSRSSoffset =  fadeoutInp/baseValue;

                                                tempFadeoutStrTime = (StartTime) + (fadeoutInp/baseValue);
                                                 if (device.indexOf("uuid") === -1) {
                                                     var deviceId = bridgeUDN+":"+device;
                                                     tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyOFF+'","","'+StartSRSSoffset+'", "'+rule.When.OffModeOffset+'",-1,"'+rule.When.EndTime+'")');
                                                     tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+ledCapabiltyBrightness+'","","'+StartSRSSoffset+'", "'+rule.When.OffModeOffset+'",-1,"'+rule.When.EndTime+'")');

                                                  } else if (device.match(/dimmer/gi)) {
                                                       var deviceId = device;
                                                       tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd, OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+deviceId+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+RuleDuration+'", '+startAction+', '+endAction+', "'+rule.Devices[device].SensorDuration+'","-1","'+rule.SelectedSensorsValue+'","-1","'+dimmerCapabiltyBrightness+'","-1","'+StartSRSSoffset+'", "'+rule.When.OffModeOffset+'",-1,"'+rule.When.EndTime+'")');

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

                                        for(var daysCount1=0; daysCount1 < arrDays.length; daysCount1++){
                                            if ( rule.When.StartSRSS != undefined ) {
                                                if (rule.When.StartSRSS === "Sunrise") StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSR"];
                                                else StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["timeSS"];

                                                RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                            } else
                                            if ( rule.When.EndSRSS != undefined ) {
                                                StartTime = rule.When.StartTime;
                                                RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[daysCount1])]["RuleDuration"];
                                            } else {
                                                StartTime = rule.When.StartTime;
                                                RuleDuration = rule.When.RuleDuration;
                                            }
                                            if ( StartTime == undefined ) StartTime = rule.When.StartTime;
                                            if ( RuleDuration == undefined ) RuleDuration = rule.When.RuleDuration;
                                            if ( soCheck == "1" && (ruleObj.When.StartSRSS != undefined || ruleObj.When.EndSRSS != undefined) ) {
                                                StartTime = parseInt(StartTime, 10) ;
                                            }

                                            if(isMakerDevice){
                                                tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES ('+len+',"'+newUdn+'", "0", "'+deCodeDays(arrDays[daysCount1])+'", "'+StartTime+'","'+RuleDuration+'", '+rule.Devices[device].StartAction+', '+rule.Devices[device].EndAction+', "'+rule.Devices[device].SensorDuration+'","-1","-1","-1","","",' + rule.When.OnModeOffset + ',' + rule.When.OffModeOffset + ',-1,"'+rule.When.EndTime+'")');
                                            }
                                            else{
                                                tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level,ZBCapabilityStart, ZBCapabilityEnd,OnModeOffset,OffModeOffset,CountdownTime,EndTime) VALUES (' + len + ',"' + device + '", "0", "' + deCodeDays(arrDays[daysCount1]) + '", "' + StartTime + '","' + RuleDuration + '", ' + rule.Devices[device].StartAction + ', ' + rule.Devices[device].EndAction + ', "' + rule.Devices[device].SensorDuration + '","-1","-1","-1","","",' + rule.When.OnModeOffset + ',' + rule.When.OffModeOffset + ',-1,"'+rule.When.EndTime+'")');
                                            }

                                        }
                                          if(soCheck == "1"){
                                              tx.executeSql('INSERT INTO TARGETDEVICES (RuleID, DeviceID, DeviceIndex) VALUES ("' + len + '","' + device + '", "' + deviceIndex + '")');
                                              deviceIndex++;
                                          }

                                    }
                                }//for loop
                            }
                            saved = true;
                            /////////////////////////BLOCKEDRULES-----------Insert Record in BLOCKEDRULES if Firmware is not supported-------------- 

                            if(rule.When.isFirmWareSupported != undefined && rule.When.isFirmWareSupported === "false"){

                                tx.executeSql('INSERT INTO BLOCKEDRULES (Primarykey, ruleId) VALUES ("'+len+'", "'+len+'")',[],
                                    function(tx,results){

                                    },
                                    function(tx,results){

                                    });

                            }
                            /////////////////////////BLOCKEDRULES-----------Insert Record in BLOCKEDRULES if Firmware is not supported--------------
                        } else {
                            wemoUtil.infoLog(TAG, "DUPLICATE");
                        }
                    }
                },errorCB);

        }
    }

    //Rule Duplicate Popup
    $("#rule_duplicate_learn_more_btn").on("click", function(){
        if (!isRemoteEnabled) {
            deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
        }
         window.open(wemo.items['Help_Rules_Alert_Url'], "_system");
        $("#rule_duplicate" ).popup( "close" );
    });

    $("#rule_duplicate_ok_btn").on("click", function(){
        $("#rule_duplicate" ).popup( "close" );
        $("RuleDuplicateText").html("");
    });
    
    $("#ok_btn_other").on("click", function() {
        $("#rule_conflict_other").popup("close");
        $("RuleConflictSimpleAndTimerOther").html("");
        isConflicting = true;
        var ruleObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
        saveNewTimerRule_RULES_RULEDEVICES(ruleObj.RuleType, ruleObj);
        
    });

    function showConflictDuplicateMessage(ruleType, ruleName, msgType, ruleAction, device, sTime, eTime, sensorDeviceName, subRuleType){

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
        if (msgType == "identical") {
            setTimeout(
                function () {
                    $("#ruleInfoHeader").html(wemo.items['IdenticalTimeHeader']);
                    $("#RuleDuplicateText").html(wemo.items['IdenticalTimeNotification']);
                    $("#rule_duplicate").popup("open");
                },
                timeout.POPUP_DISPLAY_DELAY
            );
        }
        
        if (msgType == "conflict_rule_other") {
            setTimeout(
                function() {
                    $("#ruleInfoHeader").text(RuleconflictHeader);
                    $("#RuleConflictSimpleAndTimerOther").text(wemo.items['SaveConflictRuleDisabled']);
                    $("#rule_conflict_other").popup("open");
                },
                timeout.POPUP_DISPLAY_DELAY
            );
        }
        
        if (msgType == "conflict") {
            window.sessionStorage.removeItem("away_conflict");
            var ruleConflictLocalizedmsg = wemo.items['RuleConflictSimpleAndTimer'];
            var temparr = ruleConflictLocalizedmsg.split("%@");
            var msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " + ruleAction + " " + device + " " + temparr[3] + " " + sTime + temparr[4];
            var RuleconflictHeader = wemo.items['RuleConflict'];

            wemoUtil.infoLog(TAG, msgText);

            switch (ruleType) {
                case sessionStore.SIMPLE_SWITCH:
                    setTimeout(
                        function () {
                            $("#ruleInfoHeader").html(RuleconflictHeader);
                            $("#RuleDuplicateText").html(msgText);
                            $("#rule_duplicate").popup("open");
                        },
                        timeout.POPUP_DISPLAY_DELAY
                    );
                    break;

                case sessionStore.TIME_INTERVAL:
                    setTimeout(
                        function () {
                            $("#ruleInfoHeader").html(RuleconflictHeader);
                            $("#RuleDuplicateText").html(msgText);
                            $("#rule_duplicate").popup("open");
                        },
                        timeout.POPUP_DISPLAY_DELAY
                    );
                    break;
                    
                case sessionStore.AWAY_MODE:
                    setTimeout(
                        function () {
                            $("#ruleInfoHeader").html(RuleconflictHeader);
                            $("#RuleDuplicateText").html(wemo.items['AwayModeConflict']);
                            $("#rule_duplicate").popup("open");
                        },
                        timeout.POPUP_DISPLAY_DELAY
                    );
                    break;
                    
                case sessionStore.MOTION_CONTROLLED:
                    $("#ruleInfoHeader").html(RuleconflictHeader);
                    wemoUtil.infoLog(TAG, "sensors---Rule type " + subRuleType + " Rule name " + ruleName + " Rule action " + ruleAction + " Sensor device name " + sensorDeviceName + " device " + device);
                    if (subRuleType == "AllDay") {
                        var ruleConflictLocalizedMotionmsg = wemo.items['RuleConflictSensorRuleWithMotionAllDayON'];
                        var temparr = ruleConflictLocalizedMotionmsg.split("%@");
                        var msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " + ruleAction + " " + device + " " + temparr[2] + " " + sensorDeviceName + " " + temparr[3];
                        $("#RuleDuplicateText").html(msgText);
                    } else {
                        var ruleConflictLocalizedMotionmsg = wemo.items['RuleConflictSensorRuleWithMotionON'];
                        var temparr = ruleConflictLocalizedMotionmsg.split("%@");
                        var msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " + ruleAction + " " + device + " " + temparr[2] + " " + sensorDeviceName + " " + temparr[3] + " " + sTime + " " + temparr[4] + " " + eTime + "" + temparr[5];
                        $("#RuleDuplicateText").html(msgText);
                    }
                    $("#rule_duplicate").popup("open");
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
                    break;
            }
        }
        else {

            var ruleDuplicateLocalizedmsg = wemo.items['RuleDuplicateText'];
            var temparr = ruleDuplicateLocalizedmsg.split("%@");
            var msgText = temparr[0] + " " + ruleName + " " + temparr[1];
            var RuleDuplicationHeader = wemo.items['RuleDuplicate'];

            switch (ruleType) {
                case sessionStore.SIMPLE_SWITCH:
                    setTimeout(
                        function () {
                            $("#ruleInfoHeader").html(RuleDuplicationHeader);
                            $("#RuleDuplicateText").html(msgText);
                            $("#rule_duplicate").popup("open");
                        },
                        timeout.POPUP_DISPLAY_DELAY
                    );
                    break;

                case sessionStore.TIME_INTERVAL:
                    setTimeout(
                        function () {
                            $("#ruleInfoHeader").html(RuleDuplicationHeader);
                            $("#RuleDuplicateText").html(msgText);
                            $("#rule_duplicate").popup("open");
                        },
                        timeout.POPUP_DISPLAY_DELAY
                    );
                    break;

                case sessionStore.MOTION_CONTROLLED:
                    setTimeout(
                        function () {
                            $("#ruleInfoHeader").html(RuleDuplicationHeader);
                            $("#RuleDuplicateText").html(msgText);
                            $("#rule_duplicate").popup("open");
                        },
                        timeout.POPUP_DISPLAY_DELAY
                    );
                    break;
                    
                case sessionStore.MAKER_MOTION_CONTROLLED:
                    setTimeout(
                        function () {
                            $("#ruleInfoHeader").html(RuleDuplicationHeader);
                            $("#RuleDuplicateText").html(msgText);
                            $("#rule_duplicate").popup("open");
                        },
                        timeout.POPUP_DISPLAY_DELAY
                    );
                    break;
              
                case sessionStore.AWAY_MODE:
                    setTimeout(
                        function () {
                            $("#ruleInfoHeader").html(RuleDuplicationHeader);
                            $("#RuleDuplicateText").html(msgText);
                            $("#rule_duplicate").popup("open");
                        },
                        timeout.POPUP_DISPLAY_DELAY
                    );
                    break;
                    
                default:
                    break;
            }
        }

    }

    function verifyConflictsDuplicates(device, ruleRow, rule, days, sensorValue, deviceName, sensorDeviceName) {
    	if(rule.State == 0){
    		return false
    	}
    	else{
        var strDays = rule.SelectedDayOrRange;
        var arrDays = strDays.split("-");
        var ruleDays = [];
        for (var i = 0; i < arrDays.length; i++) {
            ruleDays.push(deCodeDays(arrDays[i]));
        }
        ruleDays = ruleDays.join("-");
        for (var j = 0; j < ruleRow.length; j++) {
            wemoUtil.infoLog(TAG, "j " + j + " arrDays[j] " + arrDays[j]);
            if (wemoUtil.getRuleClass(rule.RuleType) == wemoUtil.getRuleClass(ruleRow[j].rowType)) {
                if (arrDays[j] != undefined) {
                    if (rule.When.StartSRSS != undefined) {
                        if (rule.When.StartSRSS === "Sunrise") rule.When.StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[j])]["timeSR"];
                        else rule.When.StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[j])]["timeSS"];

                        rule.When.RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[j])]["RuleDuration"];
                    } else if (rule.When.StartSRSS == undefined && rule.When.EndSRSS != undefined) {
                        rule.When.RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][deCodeDays(arrDays[j])]["RuleDuration"];
                    }
                }
                rule.When.EndTime = parseInt(rule.When.StartTime) + parseInt(rule.When.RuleDuration);
                if(rule.When.EndTime > 86400) {
                    wemoUtil.infoLog(TAG, "rule Start Time: " + rule.When.StartTime + " Rule end time: " + rule.When.EndTime);
                    rule.When.EndTime = rule.When.EndTime - 86400;
                }
                var dayID = ( arrDays[j] != undefined ) ? deCodeDays(arrDays[j]) : ruleRow[j].rowDayID;
                var ruleParamsByDay = getST_RDfromDBbyDayId(ruleRow, dayID);
                var sTime;
                var eTime;
                var startAction;

                if (ruleParamsByDay.length == 0) {
                    sTime = "" + ruleRow[j].rowStartTime;
                    eTime = "" + ruleRow[j].rowRuleDuration;
                    startAction = "" + ruleRow[j].rowStartAction;
                } else {
                    sTime = "" + ruleParamsByDay[0];
                    wemoUtil.infoLog(TAG, "DB:	sTime: 			     " + sTime);
                    wemoUtil.infoLog(TAG, "Rule:	rule.When.StartTime: " + rule.When.StartTime);

                    eTime = "" + ruleParamsByDay[1];
                    wemoUtil.infoLog(TAG, "DB:	eTime: 			          " + eTime);
                    wemoUtil.infoLog(TAG, "Rule:	rule.When.RuleDuration: : " + rule.When.RuleDuration);

                    startAction = ruleParamsByDay[2];
                }
                var endTime = parseInt(sTime) + parseInt(eTime);
                wemoUtil.infoLog(TAG, "sTime+eTime: " + endTime);
                
                var rowDeviceIDDB = ruleRow[j].rowDeviceID;
                var searchType = rowDeviceIDDB.search("Bridge");

                if(searchType != -1 || searchType == true)
                {
                    wemoUtil.infoLog(TAG, "entering in if");
                    
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

                wemoUtil.infoLog(TAG, "rule_dev " + device + " db dev: " + rowDeviceIDDB);
                var conRuleStartAct = device + '' + rule.When.StartTime + '' + rule.Devices[device].StartAction + '' + ruleDays;
                var conRowStartAct = rowDeviceIDDB + '' + sTime + '' + ruleRow[j].rowStartAction + '' + days;
                var conRuleEndAct = device + '' + rule.When.EndTime + '' + rule.Devices[device].EndAction + '' + ruleDays;
                var conRowEndAct = rowDeviceIDDB + '' + endTime + '' + ruleRow[j].rowEndAction + '' + days;
                var conRowStartEndAct = rowDeviceIDDB + '' + endTime + '' + ruleRow[j].rowEndAction + '' + days;

                var startActAllDay = rowDeviceIDDB + '' + sTime + '' + eTime + '' + ruleRow[j].rowStartAction + '' + sensorValue;
                var dupStartActAllDay = device + '' + rule.When.StartTime + '' + rule.When.RuleDuration + '' + rule.Devices[device].StartAction + '' + rule.SelectedSensorsValue;

                var endActSimple = rowDeviceIDDB + '' + endTime + '' + ruleRow[j].rowStartAction;
                var startActSimple = rowDeviceIDDB + '' + sTime + '' + ruleRow[j].rowStartAction;
                var dupStartActSimple = device + '' + rule.When.StartTime + '' + rule.Devices[device].StartAction;

                //Sensor Rule, Timer Rule & Simple Rule Duplication & Start Action Conflict


                if (rule.Devices[rowDeviceIDDB] && rowDeviceIDDB.match(/dimmer/gi) && (rule.RuleType != sessionStore.AWAY_MODE)) {
                    sTime = parseInt(sTime) + parseInt(rule.Devices[rowDeviceIDDB].FadeIn);
                }

                var startAct = rowDeviceIDDB + '' + sTime + '' + eTime + '' + startAction + '' + days + '' + sensorValue;
                var dupStartAct = device + '' + rule.When.StartTime + '' + rule.When.RuleDuration + '' + rule.Devices[device].StartAction + '' + ruleDays + '' + rule.SelectedSensorsValue;
                var conStartAct = device + '' + rule.When.StartTime + '' + rule.When.RuleDuration + '' + rule.Devices[device].StartAction + '' + ruleDays + '' + rule.SelectedSensorsValue;
                var result = ruleConflicts(rule, ruleRow[j]);
                wemoUtil.infoLog(TAG, "startAct " + startAct + " dupStartAct " + dupStartAct);
                wemoUtil.infoLog(TAG, "conflict Rule :: " + conRuleStartAct + "  Current Rule :: " + conRowEndAct + " Rule ID :: " + ruleRow[j].rowRuleID + " result: " + result);
                if ((!checkDayOverlap(rule, ruleRow[j])) || (!deviceUsed(rule, rowDeviceIDDB)) || (ruleRow[j].rowState != '1')) continue;

                
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
                        if (ruleRow[j].rowType == sessionStore.AWAY_MODE) {
                            window.sessionStorage.setItem("away_conflict", "1");
                        }
                        else {
                            if (endActSimple == dupStartActSimple || startActSimple == dupStartActSimple) {
                                if (days == "0" && ruleDays != 0) {
                                    if (ruleRow[j].rowStartAction != rule.Devices[device].StartAction) {
                                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                        showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                                        return true;
                                    } else {
                                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                        showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "duplicate", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                                        return true;
                                    }
                                }
                            } else if (startAct == dupStartAct) {
                                nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "duplicate", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                                return true;
                            }
                            //Fix for WEMO-21093 Rule conflict popup appears in case of Duplicate SRSS rule
                            /**
                            else {
                                showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                                return true;
                            }**/
                        }
                    }
                }
                else {
                    var conflict = false;
                    var duplicate = false;
                    
                    if (rule.When.StartTime == rule.When.EndTime) {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        showConflictDuplicateMessage("", "", "identical", "", "", "", "", "", "");
                        return true;
                    }
                    else if (rule.RuleType == sessionStore.AWAY_MODE && ruleRow[j].rowType == sessionStore.AWAY_MODE) {
                    	if (rule.When.StartTime == ruleRow[j].rowStartTime && rule.When.EndTime == endTime) {
                        	duplicate = true;
                        }
                    	else if (rule.When.StartTime == ruleRow[j].rowStartTime || rule.When.StartTime == endTime || rule.When.EndTime == ruleRow[j].rowStartTime || rule.When.EndTime == endTime) {
                    		conflict = true;
                        }
                        else if (rule.When.StartTime <= ruleRow[j].rowStartTime && rule.When.EndTime >= (ruleRow[j].rowStartTime + ruleRow[j].rowRuleDuration)) {
                            conflict = true;
                        }
                    }
                    else if (rule.RuleType != sessionStore.AWAY_MODE || ruleRow[j].rowType != sessionStore.AWAY_MODE) {
                        if (rule.When.StartTime == ruleRow[j].rowStartTime || rule.When.StartTime == endTime || rule.When.EndTime == ruleRow[j].rowStartTime || rule.When.EndTime == endTime) {
                            if (startAct == dupStartAct) {
                            	
                            	// Away mode rule has highest priority, so dont do duplicate check here
                            	if (ruleRow[j].rowType != sessionStore.AWAY_MODE && rule.RuleType != sessionStore.AWAY_MODE){
                            		duplicate = true;
                            	}
                            	else if (ruleRow[j].rowType == sessionStore.AWAY_MODE && rule.RuleType == sessionStore.AWAY_MODE){
                            		duplicate = true;
                            	}
                            	else { 
                                    window.sessionStorage.setItem("away_conflict", "1"); 
                            	}
                            		
                            	
                            } else {
                                if (ruleRow[j].rowType == sessionStore.SIMPLE_SWITCH) {
                                   
                                    if (rule.RuleType == sessionStore.AWAY_MODE || ruleRow[j].rowType == sessionStore.AWAY_MODE){
                                    	window.sessionStorage.setItem("away_conflict", "1"); 
                                    }else{  
	                                    if (rule.When.EndTime == ruleRow[j].rowStartTime && rule.Devices[device].EndAction == ruleRow[j].rowEndAction)
	                                        continue;
	                                    else if (rule.When.StartTime == ruleRow[j].rowStartTime && rule.Devices[device].StartAction == ruleRow[j].rowStartAction)
	                                        continue;
	                                    else
	                                        conflict=true;
                                    }
                                }
                                else { 
                                	conflict=true;
                                }
                            }

                        }
                        else if (rule.When.StartTime <= ruleRow[j].rowStartTime && rule.When.EndTime >= (ruleRow[j].rowStartTime + ruleRow[j].rowRuleDuration)) {
                        	conflict=true;
                        }
                    }

                    if (conflict) {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                        return true;
                    }
                    if (duplicate) {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "duplicate", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                        return true;
                    }


                    if (startAct == dupStartAct) {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "duplicate", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                        return true;
                    } else if (startAct == conStartAct || conRuleStartAct == conRowStartAct || conRuleStartAct == conRowStartEndAct) {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                        return true;
                    }

                    if (rule.RuleType == "Time Interval" || rule.RuleType == "Away Mode") {
                        if (conRuleStartAct == conRowEndAct) {
                            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                            showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                            return true;
                        } else if (endActSimple == dupStartActSimple || startActSimple == dupStartActSimple) {
                            if (days == "0" && ruleDays != 0) {
                                if (ruleRow[j].rowStartAction != rule.Devices[device].StartAction) {
                                    nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                    showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
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
            } else if(wemoUtil.getRuleClass(ruleRow[j].rowType) == rulesClasses.COUNTDOWN_TIMER_CLASS){
                var tmpRuleName = ruleRow[j].rowRuleName;
                if (ruleConflicts(rule, ruleRow[j])) {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.COUNTDOWN_RULE_DATA, ruleRow[0]);
                        showConflictDuplicateMessage(ruleRow[j].rowType,tmpRuleName, "conflict_rule_other", null, null, null, null);
                        return true;
                    }
                }
        }
    	}
        return false;
    }

    function getST_RDfromDBbyDayId(ruleRow, curDayID) {
        var ruleParamsByDay = [];
        for (var i = 0; i < ruleRow.length; i++) {
            wemoUtil.infoLog(TAG, "ruleRow[i].rowDayID: " + ruleRow[i].rowDayID);
            wemoUtil.infoLog(TAG, "curDayID: " + curDayID);
            if (ruleRow[i].rowDayID == curDayID || ruleRow[i].rowDayID === -1) {
                ruleParamsByDay.push(ruleRow[i].rowStartTime);
                ruleParamsByDay.push(ruleRow[i].rowRuleDuration);
                ruleParamsByDay.push(ruleRow[i].rowStartAction);
                return ruleParamsByDay;
            }
        }
        return ruleParamsByDay;
    }

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
        return "";
    }


    function ruleConflicts(rule2, rule1) {

        if (!deviceUsed(rule2, rule1.rowDeviceID)) {
            return false;
        }

       /*if (wemoUtil.getRuleClass(rule1.rowType) != wemoUtil.getRuleClass(rule2.RuleType)) {
            return false;
        }*/

        if (checkDayOverlap(rule2, rule1)) {
            //We don't check next day overlap to be consistent with iOS code
            //See RuleUtility.m:1771

            var rule1End = parseInt(rule1.rowStartTime) + parseInt(rule1.rowRuleDuration);
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
            if (rule2.When.EndTime > rule1End && (rule2.When.StartTime > parseInt(rule1.rowStartTime) && rule2.When.StartTime < rule1End)) {
                return true;
            }

            //Case 3
            //Existing rule interval is inside new rule interval
            if (rule2.When.StartTime < parseInt(rule1.rowStartTime) && rule2.When.EndTime > rule1End) {
                return true;
            }

        }

        return false;
    }
    //Function to check if device is used by rule
    function deviceUsed(rule, devid) {
    	
    	 var searchType = devid.search("Bridge");

         if(searchType != -1 || searchType == true)
         {
             wemoUtil.infoLog(TAG, "entering in if");
             
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

    function errorCB(){
        wemoUtil.infoLog(TAG, "Error inserting rule");
    }
    function successCB(){
        wemoUtil.infoLog(TAG, 'Successfully updated DB');
    }
    function successfullySaved(){
    	wemoUtil.infoLog(TAG, 'Saved all the rules to Session');
    	wemoUtil.infoLog(TAG, "saved "+saved);
//
    	if(saved){
    			nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
    			nativeUtilPlugin.execute(null,null,actions.SHOW_RULE_PROGRESS,["", wemo.items['RULE_STATUS_SENDING_DB']]);
    			wemoUtil.infoLog(TAG, 'Started pushing to plugins');
    			setTimeout(function(){updateDevice();},1000);
    	} else {
    		wemoUtil.infoLog(TAG, 'Not Updated');
    	}


    }

    function checkDbValues(rule){
        wemoUtil.infoLog(TAG, "Rule selected range "+rule.SelectedDayOrRange);
        var strDays = rule.SelectedDayOrRange;
        var arrDays = strDays.split("-");

        if(Object.keys(rule.Devices).length>0){
            for(device in rule.Devices){
                wemoUtil.infoLog(TAG, "first LOOP");
                for(var daysCount1=0; daysCount1 < arrDays.length; daysCount1++){
                    wemoUtil.infoLog(TAG, "Rules device : "+device+" Days : "+deCodeDays(arrDays[daysCount1])+" start time : "+rule.When.StartTime+" RuleDuration : "+rule.When.RuleDuration+"EndTime : " + rule.When.EndTime+"  Start Action :: "+rule.Devices[device].StartAction+"  End Action :: "+rule.Devices[device].EndAction+"  Sensor Duration :: "+rule.Devices[device].SensorDuration+"  Selected sensor Value   :: "+rule.SelectedSensorsValue);

                    var rulesArray = [];
                    rulesArray.push(device);
                    rulesArray.push(deCodeDays(arrDays[daysCount1]));
                    rulesArray.push(rule.When.StartTime);
                    rulesArray.push(rule.When.EndTime);
                    rulesArray.push(rule.When.RuleDuration);
                    rulesArray.push(rule.Devices[device].StartAction);
                    rulesArray.push(rule.Devices[device].EndAction);
                    rulesArray.push(rule.Devices[device].SensorDuration);
                    rulesArray.push(rule.SelectedSensorsValue);


                    var goAhead = checkValues(rulesArray);
                    if (goAhead==false){
                        return false;
                    }

                }
            }
        }
    }

    function checkValues(rulesArray){
        for(var i=0; i<rulesArray.length; i++){
            var val = rulesArray[i];
            wemoUtil.infoLog(TAG, "Rules value : "+val);

            if (val==undefined){
                return false;
            }
        }
        return true;
    }

    function updateDevice() {
        wemoUtil.infoLog(TAG, "success creating the table structures");
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

        wemoUtil.infoLog(TAG, "rule.Devices "+JSON.stringify(rule.Devices)+"----"+ledparamlength+"---"+snsparamlength);

        if(isRemoteEnabled)
        {
            params = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
            params = params.concat(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA));
            params = params.concat(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DIMMER_DATA));
            params = params.concat(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA));
        }
        else
        {
            params = wemoUtil.getDevices(actions.SELECT_SWITCHES);
            params = params.concat(wemoUtil.getDevices(actions.SELECT_DIMMERS));
            params = params.concat(wemoUtil.getDevices(actions.SELECT_INSIGHTS));
            params = params.concat(wemoUtil.getDevices(actions.SELECT_MAKER));
        }

        if ( params != null && params.length > 0)
        {
            if(ledparamlength != null && ledparamlength > 0)
                len = (params.length)+(ledparamlength);
            else
                len = params.length;

            wemoUtil.infoLog(TAG, "length "+len);

            var isLEDInRule = 0;
            if(ledparamlength > 0)
            {
                var ledCount = 0;
                for (var dev1 = 0; dev1 < Object.keys(rule.Devices).length; dev1++) {
                    var slectedval = ledarr[dev1];
                    wemoUtil.infoLog(TAG, "entering in SRS rule details 11---"+slectedval+"--"+ledarr[dev1].SelectedLedValue);
                    var selectedLedVar = $.trim(ledarr[dev1].SelectedLedValue);

                    if(selectedLedVar == 1)
                    {
                        isLEDInRule = 1;
                        break;
                    }

                }
            }
            
            wemoUtil.infoLog(TAG, TAG + JSON.stringify(rule.Devices));
            var devicesLength = Object.keys(rule.Devices).length;
            var ruleDevices ='';
            for (var inx = 0; inx < devicesLength ; inx++) {
                var udn = Object.keys(rule.Devices)[inx];
                
                for (var j =0; j < params.length ; j++){
                		if(udn && (typeof udn != "undefined")  && params[j] && (typeof params[j] != "undefined") && params[j].udn && (typeof params[j].udn != "undefined") ){
                			wemoUtil.infoLog(TAG, "SaveRule_TimerInterval: " + udn + ", params_udn: " + params[j].udn);
                    		if(wemoUtil.isMakerDevice(udn) && wemoUtil.getOriginalMakerUDN(udn) == params[j].udn ){
                				wemoUtil.infoLog(TAG, "SaveRule_TimerInterval: " + udn + ", params_udn: " + params[j].udn);
                				ruleDevices = ruleDevices + udn + ',';
                			} else if(udn == params[j].udn){
                				wemoUtil.infoLog(TAG, "SaveRule_TimerInterval: " + udn + ", params_udn: " + params[j].udn);
                				ruleDevices = ruleDevices + udn + ',';
                			}
                		}
                }
          }
               
              ruleDevices = ruleDevices.substring(0, ruleDevices.length - 1);
              wemoUtil.pushScheduleSwitch( ruleDevices, inx, devicesLength, isLEDInRule);
        }
        setTimeout(function () {
            if(ledparamlength > 0)
            {
                var ledCount = 0;
                for (var dev1 = 0; dev1 < Object.keys(rule.Devices).length; dev1++) {
                    var slectedval = ledarr[dev1];
                    wemoUtil.infoLog(TAG, "entering in SRS rule details 11---"+slectedval+"--"+ledarr[dev1].SelectedLedValue);
                    var selectedLedVar = $.trim(ledarr[dev1].SelectedLedValue);

                    if(selectedLedVar == 1)
                    {
                        var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
                        wemoUtil.infoLog(TAG, "entering in push"+dev1+"---"+ledparamlength);
                        wemoUtil.pushScheduleLedDevices(Object.keys(rule.Devices)[dev1],db,rule,ledCount,ledparamlength);
                        ledCount++;
                    }

                }
            }
        },500);


    }


    function getRules(tx){
        if (rule.selectedRowIndex!=undefined && rule.selectedRowIndex!=null){
            delete rule.selectedRowIndex;
        }
        tx.executeSql('SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.RuleDuration, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.Level, b.ZBCapabilityStart, b.ZBCapabilityEnd, b.OnModeOffset, b.OffModeOffset from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID order by a.Name COLLATE NOCASE', [],
            function(tx,results){
                var len = results.rows.length;
                var ruleRows=[];
                if(len>0) {
                    for(var i=0;i<len;i++){
                        ruleRows[i]=results.rows.item(i);
                        wemoUtil.infoLog(TAG, "Print DB values = "+ruleRows[i].RuleID+" :: "+
                            ruleRows[i].Name+" :: "+
                            ruleRows[i].StartTime+" :: "+
                            ruleRows[i].RuleDuration+" :: "+
                            ruleRows[i].Value+" :: "+
                            ruleRows[i].DayID+" :: "+
                            ruleRows[i].ZBCapabilityStart+" :: "+
                            ruleRows[i].ZBCapabilityEnd);
                    }
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULES_DATA,ruleRows);

                }
            },errorCB);
    }

}