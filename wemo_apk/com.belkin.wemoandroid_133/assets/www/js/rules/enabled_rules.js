/*
 enabled_rules.js

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

var TAG = "enabled_rules.js: ";
var latitude = '';
var longitude = '';
var UP_TF_IS24 = false;//UP-user preferences, TF-time format
var srssTimeings= '';
$(document).bind('pageinit', function() {
    enabled_rules.initialize();
    networkConnection.initializeNetworkMsg();
});


function returnDay(dayID) {
    if(dayID == 'undefined')
    {
        return '';
    }

    switch(parseInt(dayID)) {
        case 0 : return "Daily"; break;
        case 1 : return "Sun"; break;
        case 2 : return "Mon"; break;
        case 3 : return "Tue"; break;
        case 4 : return "Wed"; break;
        case 5 : return "Thu"; break;
        case 6 : return "Fri"; break;
        case 7 : return "Sat"; break;
        case 8 : return "Weekday"; break;
        case 9 : return "Weekends"; break;
        default : console.log("Inside default"); return ''; break;
    }
}

function returnTime(startTime, duration) {
    startTime = parseInt(startTime);
    var endTime = parseInt(startTime) + parseInt(duration);
    if (endTime>timestamp.MAX_HOUR){
        endTime=endTime-timestamp.MAX_HOUR;
    }
    var startTimeMin = parseInt(startTime / 60);
    var startTimeHours = parseInt(startTimeMin / 60);
    startTimeMin = startTimeMin % 60;
    var endTimeMin = parseInt(endTime / 60);
    var endTimeHours = parseInt(endTimeMin / 60);
    endTimeMin = endTimeMin % 60;
    if(duration<=0) {
        return wemoUtil.convertMillisecondsToTF(startTime, UP_TF_IS24) + ", ";
    }
    else {
        return wemoUtil.convertMillisecondsToTF(startTime, UP_TF_IS24)+ "-" + wemoUtil.convertMillisecondsToTF(endTime, UP_TF_IS24) + ", ";
    }
}
function getLocation(){
	var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
	db.transaction(getMax, errorCB, successCB);
	function getMax(tx){
		tx.executeSql("SELECT * FROM LOCATIONINFO",[], selectQuerySuccess, errorCB);
	}
	function selectQuerySuccess(tx,results){
		var len = results.rows.length;


		if(len>0){
			var entry = results.rows.item(0);
			latitude = entry.latitude;
			longitude = entry.longitude;
			wemoUtil.setJSONObjectToSessionStorage(sessionStore.LOCATION_LATITUDE, latitude);
			wemoUtil.setJSONObjectToSessionStorage(sessionStore.LOCATION_LONGITITUDE, longitude);
			nativeUtilPlugin.execute(function(par){

			if (par.length > 0) { 
					srssTimeings = par;
				}
				enabled_rules.afterOnDeviceReady();
			},function(err){wemoUtil.infoLog("Error "+err);},actions.GET_SR_SS_TIME,[latitude,longitude]);
		}else{
			enabled_rules.afterOnDeviceReady();
		} 	
	}
	function errorCB(){}
	function successCB(){}
}

var enabled_rules = {
    initialize : function() {
        document.addEventListener('wemo-frameworks-loaded', this.onDeviceReady, false);
        $(".enabled_rules").hide();
        $(".disabled_rules").hide();
        enabled_rules.supersededPopup();		 
        var listHeight = wemoUtil.getScreenHeight() - $(".footerComponent").height() - 100;
        $(".rules_list").height(listHeight);
        window.sessionStorage.setItem(sessionStore.RULES_REMOTE_MODE, false);
    },
    
    supersededPopup : function(){

    	if(window.sessionStorage.getItem("away_conflict") == "1"){
    		$("#rule_duplicate_ok_btn").on("click", function () {
    			$("#rule_duplicate").popup("close");
    			$("RuleDuplicateText").html("");
    		});
    		setTimeout(
                function(){
                    $("#ruleInfoHeader").html(wemo.items['Away_Mode_Rules']);
                    $("#RuleDuplicateText").html(wemo.items['AwayModeConflictExistRules']);
                    $("#rule_duplicate").popup( "open" );
                },
                800
    		);
    		window.sessionStorage.removeItem("away_conflict");
    	}
    },      
    
    onDeviceReady : function() {
        UP_TF_IS24 = wemoUtil.userPreferences.getTimeFormat();
        
        if (window.sessionStorage.getItem("led_device_length") == "1"){
        	$("#find_and_pair_Newdevice").show();
        }else $("#find_and_pair_Newdevice").hide();
        wemoUtil.setTimeFormat();
        
        if(!window.sessionStorage.getItem(sessionStore.FIRMWARE_AVAILABLE))
		{
    			$('#more_new_firmware').addClass('none'); 
		} 
        getLocation();
    },
    afterOnDeviceReady : function(){
    	 
//            navigator.notification.activityStop();
        //nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);
        enabled_rules.bindEvents();
        //All initialization script
        window.sessionStorage.setItem("createRulePreviousUrl", document.URL);

        var showRemoteDisableMsg = window.sessionStorage.getItem("showRemoteDisableMsg")=== "true";
        if (showRemoteDisableMsg) {
            networkConnection.initializeRemoteModeMsg();
        }

        nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[""]);
        var rulesObj=JSON.parse(window.sessionStorage.getItem(sessionStore.RULES_DATA));
        var i=0;
        var tempData = "";
        var enabled_rule_list = "";
        var disabled_rule_list = "";
        var enable_flag=0;
        var disable_flag=0;
        var rule={};

        if(rulesObj && rulesObj.length>0){
            var ruleDBlen=0;          
            var tempEndDisTime = "";

             for(var ind=0; ind<rulesObj.length;ind++){
                  if (rulesObj[ind].DayID === -1 && rulesObj[ind].Type !== sessionStore.LONG_PRESS) {
                       rulesObj.splice(ind, 1);
                  }
             }

            for(var ind=0; ind<rulesObj.length;ind++){
                curRulInd=ind;
                var displayDate="";

                var days=returnDay(rulesObj[ind].DayID);

                var DayID=' '+rulesObj[ind].DayID;

                while(rulesObj[ind+1]){
                    currentRuleID = rulesObj[ind].RuleID;
                    if(currentRuleID == rulesObj[ind+1].RuleID){

                         if(rulesObj[ind+1].StartAction == 0 && rulesObj[ind+1].EndAction == 0) {
                            tempEndDisTime=wemoUtil.convertMillisecondsToTF(rulesObj[ind].StartTime, UP_TF_IS24)+", ";
                         }

                        if (parseInt(rulesObj[ind+1].DayID) !== -1) {
                            days += ' '+returnDay(rulesObj[ind+1].DayID);
                            DayID +=' '+rulesObj[ind+1].DayID;
                        }

                        ++ind;
                    }

                    else break;
                }

                var uniqueDays = [];

                $.each(days.split(' '), function(i, el){
                    if($.inArray(el, uniqueDays) === -1) {
                        if (el) {
                            if(el == "Mon"){el = wemo.items['MondayShort'];}
                            if(el == "Tue"){el = wemo.items['TuesdayShort'];}
                            if(el == "Wed"){el = wemo.items['WednesdayShort'];}
                            if(el == "Thu"){el = wemo.items['ThursdayShort'];}
                            if(el == "Fri"){el = wemo.items['FridayShort'];}
                            if(el == "Sat"){el = wemo.items['SaturdayShort'];}
                            if(el == "Sun"){el = wemo.items['SundayShort'];}

                            uniqueDays.push(el);
                        }
                    }
                });

                var uniqueDayId = [];

                $.each(DayID.split(' '), function(i, el){
                    if($.inArray(el, uniqueDayId) === -1) {
                        uniqueDayId.push(el);
                    }

                });


                if(rulesObj[curRulInd].DeviceID.indexOf(WeMoDevicesUdns.Bridge) != -1) {
                	if(rulesObj[curRulInd].ZBCapabilityStart != undefined){
	                	if(rulesObj[curRulInd].ZBCapabilityStart.indexOf(ledCapabilities.ONOFF+"=1") != -1){
	                		var fadein = 0;
	                		if (curRulInd + 1 < rulesObj.length){
	                			var splitArr = rulesObj[curRulInd+1].ZBCapabilityStart.split("=");
		                		var splitArr2 = splitArr[1].split(":");
		                        fadein = splitArr2[1];
	                		}
	                        rulesObj[ind].StartTime = parseInt(rulesObj[curRulInd].StartTime) + (fadein/10);
	                	}else{
	                		if(curRulInd + 1 < rulesObj.length && rulesObj[curRulInd+1].ZBCapabilityStart.indexOf(ledCapabilities.ONOFF+"=1") != -1){
	                			var splitArr = rulesObj[curRulInd].ZBCapabilityStart.split("=");
		                		var splitArr2 = splitArr[1].split(":");
		                        var fadein = splitArr2[1];
		                        rulesObj[ind].StartTime = parseInt(rulesObj[curRulInd].StartTime) + (fadein/10);
	                		}
	                	}
                	}
                }


                 if(rulesObj[curRulInd].DeviceID.match(/dimmer/gi)) {
                    if(parseInt(rulesObj[curRulInd].ZBCapabilityStart) !== -1 && rulesObj[curRulInd].ZBCapabilityStart){
                        var splitArr = rulesObj[curRulInd].ZBCapabilityStart.split(":");
                        var fadein = splitArr[2];
                        rulesObj[ind].StartTime = parseInt(rulesObj[curRulInd].StartTime) + parseInt(fadein);
                	}

                	if (parseInt(rulesObj[curRulInd].ZBCapabilityEnd) !== -1 && rulesObj[curRulInd].ZBCapabilityEnd) {
                         var splitArr2 = rulesObj[curRulInd].ZBCapabilityEnd.split(":");
                         var fadeout = splitArr2[2];
                         rulesObj[ind].EndTime = parseInt(rulesObj[curRulInd].StartTime) + parseInt(rulesObj[curRulInd].RuleDuration) + parseInt(fadeout);
                	}
                 }


                var tempStartTime = parseInt(rulesObj[ind].StartTime);
                var tempEndTime = parseInt(rulesObj[ind].RuleDuration)+parseInt(rulesObj[ind].StartTime);

                wemoUtil.infoLog(TAG, "tempStartTime :: " + tempStartTime);
                wemoUtil.infoLog(TAG, "RuleDuration :: " + parseInt(rulesObj[ind].RuleDuration));
                wemoUtil.infoLog(TAG, "tempEndTime :: " + tempEndTime);

                var endTimeFlag=false;
                if(tempStartTime%10 == 1 || tempStartTime%10 == 4 ){
                	rulesObj[ind].StartSRSS = "Sunrise";
                }else if(tempStartTime%10 == 2 || tempStartTime%10 == 5){
                	rulesObj[ind].StartSRSS = "Sunset";
                }

                if(rulesObj[ind].RuleDuration>0){
                	endTimeFlag = true;
                	if(tempEndTime%10 == 1 || tempEndTime%10 == 4){
                		rulesObj[ind].EndSRSS = "Sunrise";
                	}else if(tempEndTime%10 == 2 || tempEndTime%10 == 5){
                		rulesObj[ind].EndSRSS = "Sunset";
                	}
                }
                window.sessionStorage.setItem(sessionStore.SR_SS, rulesObj[ind].StartSRSS);
                var EndTime=parseInt(rulesObj[ind].StartTime) + parseInt(rulesObj[ind].RuleDuration);
                if (parseInt(rulesObj[ind].StartTime)>86399){
                    rulesObj[ind].StartTime = parseInt(rulesObj[ind].StartTime)-86400;
                }

                if (EndTime>86400){
                    EndTime=EndTime-86400;
                }

                if(rulesObj[ind].StartSRSS != undefined && rulesObj[ind].EndSRSS != undefined){

                    wemoUtil.infoLog(TAG, "StartSRSS :: " + rulesObj[ind].StartSRSS);
                    wemoUtil.infoLog(TAG, "EndSRSS :: " + rulesObj[ind].EndSRSS);

                    if(rulesObj[ind].StartSRSS == "Sunrise")
                    {
                        var tempStartSRSS = wemo.items['SunRise'];
                    }
                    else if(rulesObj[ind].StartSRSS == "Sunset")
                    {
                        var tempStartSRSS = wemo.items['SunSet'];
                    }
                    else{var tempStartSRSS = rulesObj[ind].StartSRSS;}

                    if(rulesObj[ind].EndSRSS == "Sunrise")
                    {
                        var tempEndSRSS = wemo.items['SunRise'];
                    }
                    else if(rulesObj[ind].EndSRSS == "Sunset")
                    {
                        var tempEndSRSS = wemo.items['SunSet'];
                    }
                    else{var tempEndSRSS = rulesObj[ind].EndSRSS;}

                    displayDate = "<span class='capitalize'>"+tempStartSRSS+" - "+tempEndSRSS+"</span>, ";
                    //displayDate = rulesObj[ind].StartSRSS+" - "+rulesObj[ind].EndSRSS+", ";
                }else if(rulesObj[ind].StartSRSS == undefined && rulesObj[ind].EndSRSS != undefined){

                    if(rulesObj[ind].EndSRSS == "Sunrise")
                    {
                        var tempEndSRSS = wemo.items['SunRise'];
                    }
                    else if(rulesObj[ind].EndSRSS == "Sunset")
                    {
                        var tempEndSRSS = wemo.items['SunSet'];
                    }
                    else{var tempEndSRSS = rulesObj[ind].EndSRSS;}

                    displayDate = wemoUtil.convertMillisecondsToTF(rulesObj[ind].StartTime, UP_TF_IS24)+" - "+"<span class='capitalize'>"+tempEndSRSS+"</span>, ";
                    //displayDate = wemoUtil.convertMillisecondsToAMPM(rulesObj[ind].StartTime)+" - "+rulesObj[ind].EndSRSS+", ";
                }else if(rulesObj[ind].StartSRSS != undefined && rulesObj[ind].EndSRSS == undefined){

                    if(rulesObj[ind].StartSRSS == "Sunrise")
                    {
                        var tempStartSRSS = wemo.items['SunRise'];
                    }
                    else if(rulesObj[ind].StartSRSS == "Sunset")
                    {
                        var tempStartSRSS = wemo.items['SunSet'];
                    }
                    else{var tempStartSRSS = rulesObj[ind].StartSRSS;}

                    if (rulesObj[ind].RuleDuration<=0){
                        displayDate="<span class='capitalize'>"+tempStartSRSS+"</span>, ";
                    }else{

                        displayDate = "<span class='capitalize'>"+tempStartSRSS+"</span> - "+wemoUtil.convertMillisecondsToTF(EndTime, UP_TF_IS24)+", ";
                        //displayDate = rulesObj[ind].StartSRSS+" - "+wemoUtil.convertMillisecondsToAMPM(EndTime)+", ";
                    }
                }else if(rulesObj[ind].StartSRSS == undefined && rulesObj[ind].EndSRSS == undefined){
                    if (rulesObj[ind].RuleDuration<=0){

                    	if(rulesObj[ind].StartAction == 0 && rulesObj[ind].EndAction == 0)
                    	{
                    		if(tempEndDisTime != "")
                    		{
                    			displayDate = tempEndDisTime;
                    		}
                    		else
                    		{
                    			displayDate=wemoUtil.convertMillisecondsToTF(rulesObj[ind].StartTime, UP_TF_IS24)+", ";
                    		}
                    	}
                    	else
                    	{
                    		 displayDate=wemoUtil.convertMillisecondsToTF(rulesObj[ind].StartTime, UP_TF_IS24)+", ";
                    	}

                    }else{
                        if (rulesObj[ind].StartTime==sessionStore.ALLDAY_STARTTIME && EndTime==sessionStore.ALLDAY_ENDTIME){
                            displayDate=sessionStore.SENSOR_ALLDAY+", ";
                        }else{
                            displayDate=wemoUtil.convertMillisecondsToTF(rulesObj[ind].StartTime, UP_TF_IS24)+" - "+wemoUtil.convertMillisecondsToTF(EndTime, UP_TF_IS24)+", ";
                        }
                    }

                }

                /*if(rulesObj[ind].StartSRSS == "Sunrise" || rulesObj[ind].StartSRSS == "Sunset"){
                 displayDate = rulesObj[ind].StartSRSS;
                 }else{
                 //displayDate = returnTime(rulesObj[ind].StartTime,  rulesObj[ind].RuleDuration);
                 var EndTime=parseInt(rulesObj[ind].StartTime)+parseInt(rulesObj[ind].RuleDuration);
                 if (rulesObj[ind].StartTime==sessionStore.ALLDAY_STARTTIME && EndTime==sessionStore.ALLDAY_ENDTIME)
                 {
                 displayDate=sessionStore.SENSOR_ALLDAY+", ";
                 }else{
                 displayDate = returnTime(rulesObj[ind].StartTime,0);
                 }
                 }

                 if(endTimeFlag){
                 if(rulesObj[ind].EndSRSS == "Sunrise" || rulesObj[ind].EndSRSS == "Sunset"){
                 displayDate = displayDate+ " - " +rulesObj[ind].EndSRSS+", ";
                 }
                 else{
                 var EndTime=parseInt(rulesObj[ind].StartTime)+parseInt(rulesObj[ind].RuleDuration);
                 if (EndTime>86400){
                 EndTime=EndTime-86400;
                 }
                 if (rulesObj[ind].StartTime==sessionStore.ALLDAY_STARTTIME && EndTime==sessionStore.ALLDAY_ENDTIME)
                 {
                 displayDate=sessionStore.SENSOR_ALLDAY+", ";
                 }else{
                 displayDate = displayDate+' - '+returnTime(EndTime,0);
                 }
                 }
                 }
                 else if (endTimeFlag==false && rulesObj[ind].StartSRSS!=undefined){
                 displayDate = displayDate+ ", ";
                 }*/

                /**** Display localization Rule name *******/

                var rulenameObj = rulesObj[curRulInd].Name;
                var tempDisRulename ="";

                if(rulenameObj.indexOf("Rule") != -1)
                {
                    tempDisRulename = rulenameObj.replace("Rule",wemo.items["Rule"]);
                }else{
                    tempDisRulename = rulenameObj;
                }

                if(uniqueDays == "Weekday" || uniqueDays == "Weekend" || uniqueDays == "Daily")
                {
                    if(uniqueDays == "Weekday"){ uniqueDays = wemo.items['WeekdaysNoDetails'];}
                    else if(uniqueDays == "Weekend"){ uniqueDays = wemo.items['WeekendsNoDetails'];}
                    else{ uniqueDays = wemo.items[uniqueDays];}
                }
                else if(uniqueDays == "Weekdays" || uniqueDays == "Weekends" || uniqueDays == "Daily")
                {
                    if(uniqueDays == "Weekdays"){ uniqueDays = wemo.items['WeekdaysNoDetails'];}
                    else if(uniqueDays == "Weekends"){ uniqueDays = wemo.items['WeekendsNoDetails'];}
                    else{ uniqueDays = wemo.items[uniqueDays];}
                } else {
                	var strDays = uniqueDays.join("-");
					if ( strDays == wemo.items['WeekdaysDetails'] ) {
						uniqueDays =  wemo.items['WeekdaysNoDetails'];
					}
					else if ( strDays == wemo.items['WeekendsDetails'] || strDays == wemo.items['WeekendsDetailsOrdchg']) {
						uniqueDays =  wemo.items['WeekendsNoDetails'];
					}
					else if ( strDays == wemo.items['DailyDetails'] || strDays == wemo.items['DailyDetailsOrdchg']) {
						uniqueDays =  wemo.items['Daily'];
					}
				}
                /******************************************/

                var state = rulesObj[ind].State;

                if(state == 1){
                    enable_flag = 1;

                    var ruleType = '';
                    var StartTime = '';
                    var RuleDuration = '';
                    var EndTime = '';
                    var className='';
                    var dayId='';
                    var dayToDay = null;

                    if(rulesObj[curRulInd].Type != null){
                        ruleType=rulesObj[curRulInd].Type;
                    }

                    if(rulesObj[ind].StartTime != null){
                        StartTime=parseInt(rulesObj[ind].StartTime);
                    }

                    if(rulesObj[curRulInd].RuleDuration != null){
                        RuleDuration=parseInt(rulesObj[curRulInd].RuleDuration);
                    }

                    if(rulesObj[curRulInd].DayID != null){
                        dayId=parseInt(rulesObj[curRulInd].DayID);
                    }
                    EndTime=parseInt(StartTime)+parseInt(RuleDuration);

                    var currentTime = wemoUtil.convertTimeToMilliseconds('');
                    var currentlyActive = wemo.items['RuleStateActive'];

                    if((ruleType.indexOf("Time Interval") != -1) || (ruleType.indexOf("LED Timer Rule") != -1)){
                        className = "ruleStatus";
                    }
                    else if((ruleType.indexOf("Motion Controlled") != -1)){
                        className = "ruleStatus";
                    }
                    else if((ruleType.indexOf(sessionStore.INSIGHT_RULE) != -1)){
                        className = "ruleStatus";
                    }
                    else if((ruleType.indexOf(sessionStore.NOTIFY_ME) != -1)){
                        className = "ruleStatus";
                    }
                    else if((ruleType.indexOf(sessionStore.MAKER_MOTION_CONTROLLED) != -1)){
                        className = "ruleStatus";
                    }
                    else if((ruleType.indexOf(sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE) != -1)){
                        className = "ruleStatus";
                    }
                    else if((ruleType.indexOf(sessionStore.AWAY_MODE) != -1)){
                        className = "ruleStatus";
                    }
                    else if((ruleType.indexOf(sessionStore.COUNTDOWN_TIMER) != -1) || (ruleType.indexOf(sessionStore.LONG_PRESS) != -1)){
                        className = "ruleStatus";
                    } else if((ruleType.indexOf(sessionStore.EVENT_CONTROLLED) != -1)){
                        className = "nestRule ruleStatus";
                    } else{
                        className = "";
                    }

                    if((rulesObj[ind].StartSRSS != undefined) || (rulesObj[ind].EndSRSS != undefined)){
                    	var timeSR;
                		var timeSS;
                		var nextDaySR;
                		var nextDaySS;
                		var day = "";
                		var tempData;
                    	$.each(srssTimeings,function(index) {

        					if(index==0) {
        						tempData = srssTimeings[index];

        						day = srssTimeings[index].split("|")[0];
        						tempData = tempData.split("|")[1];
        						timeSR = tempData.split(":")[0];
        						timeSS = tempData.split(":")[1];

        					}

        					if(index==1) {
        						tempData = srssTimeings[index];

        						day = tempData.split("|")[1];
        						tempData = tempData.split("|")[1];
        						nextDaySR = tempData.split(":")[0];
        						nextDaySS = tempData.split(":")[1];

        					}

        				});
                        if((rulesObj[ind].StartSRSS == "Sunrise"))
                        {
                        	if((rulesObj[curRulInd].OnModeOffset) == undefined){
                        		StartTime = parseInt(timeSR);
                        	}else{
                        		StartTime = parseInt(timeSR)+parseInt(rulesObj[curRulInd].OnModeOffset);
                        	}
                        }
                        if((rulesObj[ind].StartSRSS == "Sunset"))
                        {
                        	if((rulesObj[curRulInd].OnModeOffset) == undefined){
                        		StartTime = parseInt(timeSS);
                        	}else{
                        		StartTime = parseInt(timeSS)+parseInt(rulesObj[curRulInd].OnModeOffset);
                        	}
                        }

                        if((rulesObj[ind].EndSRSS == "Sunrise"))
                        {
                        	if((rulesObj[curRulInd].OnModeOffset) == undefined){
                        		EndTime = parseInt(timeSR);
                        	}else{
                        		EndTime = parseInt(timeSR)+parseInt(rulesObj[curRulInd].OffModeOffset);
                        	}
                        }

                        if((rulesObj[ind].EndSRSS == "Sunset"))
                        {
                        	if((rulesObj[curRulInd].OnModeOffset) == undefined){
                        		EndTime = parseInt(timeSS);
                        	}else{
                        		EndTime = parseInt(timeSS)+parseInt(rulesObj[curRulInd].OffModeOffset);
                        	}
                        }

                    }
                    enabled_rule_list += "<li id="+ind+" class='"+className+"' data-row-index="+rulesObj[ind].RuleID+" data-startTime="+StartTime+" data-endTime="+EndTime+" data-days="+uniqueDayId+" ><span class='rule'>" + tempDisRulename+ "</span>" + "<p><span class='enabled_rules_time'>"+"</span> <span class='enabled_rules_day'>" + "<span class='rule_timing'>"+displayDate+"</span>" +"<span class='enabled_days'>" +  uniqueDays + "</span></span><span class='enabled_rules_active ruleDisable'>"+currentlyActive+"</span></p> " + "</li>";

                } else if(state == 0) {
                    disable_flag = 1;
                    disabled_rule_list += "<li id="+ind+" data-row-index="+rulesObj[ind].RuleID+"><span class='rule'>" + tempDisRulename+ "</span>" + "<p><span class='enabled_rules_time'>"+"</span> <span class='enabled_rules_day'>" +wemo.items['RuleStateDisabled']+ "</span></p> " + "</li>";
                }

                ruleDBlen++;

            }
            rule.ruleTaleRowLen=""+parseInt(ruleDBlen+1);

            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rule);
			nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);
            if(enable_flag == 1){
                console.log('enabled_rule_list'+enabled_rule_list);
                $('#enabled_rules_list').html(enabled_rule_list);
                $(".enabled_rules").show();
                enabled_rules.ruleStatus();
            }
            if(disable_flag == 1){
                $('#disabled_rules_list').html(disabled_rule_list);
                $(".disabled_rules").show();
            }

            $('#rules_btn').addClass('rules_btn_active');

            if($('#enabled_rules_list li').length == 0){

                $("#enableRuleHeader").hide();
                $(".enabled_rules").hide();
            }

            if($('#disabled_rules_list li').length == 0){
                $("#disableRuleHeader").hide();
                $("#disabled_rules_list").hide();
            }

            if(window.sessionStorage.getItem("isRemoteEnabled") === "false"){
                $('li.nestRule').addClass('disabled');
            }
        }
		

		//To return back to home page: device list tab	
		$(".wemo_logo").on("tap", function(e) {
			if ( e.target.nodeName!= "IMG" ) {
				wemoUtil.loadUrl(filePath.DEVICE_LIST);
			}
		});

        //Add New Icon on click Redirect to Create Rule Page
        $("#add_new_icon").on("tap", function(){
        	wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rule);
            wemoUtil.loadUrl(filePath.CREATE_RULE);
        });
        $('#enabled_rules_list').find("li").on('click', function(){
//                      wemoUtil.loadUrl(filePath.RULE_DETAILS);
        });
        $(".device_btn").on("tap",function(){
            $(".footer_tab_right").removeClass("active");
            $(".footer_tab_left").addClass("active");
            setTimeout(function(){
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }, 300);
        });

        $(".more_tab_icon").on("tap",function(){
            wemoUtil.loadUrl(filePath.MORE_MENU);
        });

        $('#enabled_rules_list li,#disabled_rules_list li').on('click', function(){

            trace("on enabled_rules_list li =>");
            var r= rulesObj[parseInt($(this).prop('id'))];
            if($(this).hasClass('disabled')){
                return;
            }
            if ($(this).hasClass("no-bg")==false){
                 trace("on enabled_rules_list li => NO-BG");
	            	rule.When={};
		            rule.Devices={};
		            rule.Sensors={};
		            rule.RuleType= r.Type;
		            rule.id= r.RuleID;
		            rule.State = r.State;
		            rule.RuleName= r.Name;
		            rule.SelectedSensors='';
		            rule.SelectedDayOrRange='';
		            rule.SelectedSensorsValue='-1';
		            rule.ruleTaleRowLen=ruleDBlen;
					rule.selectedRowIndex=$(this).attr("data-row-index");
		            rule.startingTime= $(this).attr('data-startTime');
		            rule.endingTime= $(this).attr('data-endTime');
					
					$(this).find('.capitalize').html() == undefined ? rule.Time=$(this).find('.rule_timing').html() : rule.Time=$(this).find('.capitalize').html();
		            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,rule);
					trace("rule.Time "+rule.Time);
					if (rule.RuleType == "Insight Rule" || rule.RuleType == "Notify Me") {
						if(rule.RuleType == "Notify Me")
						window.sessionStorage.setItem(sessionStore.GCM_SENSOR, "1");
						wemoUtil.loadUrl(filePath.NOTIFY_RULE_DETAILS);
					} else if (rule.RuleType == sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE) {
						window.sessionStorage.setItem(sessionStore.GCM_MAKER_SENSOR, "1");
						wemoUtil.loadUrl(filePath.NOTIFY_RULE_DETAILS);
					} else if (rule.RuleType == sessionStore.LONG_PRESS) {
                        wemoUtil.loadUrl(filePath.LONG_PRESS_RULE_DETAILS);
					} else {
						wemoUtil.loadUrl(filePath.RULE_DETAILS);
					}
            }
        });


    },

    bindEvents : function() {
        document.addEventListener('online', enabled_rules.onOnline, false);
        document.addEventListener('offline', enabled_rules.onOffline, false);
        document.addEventListener("backbutton", enabled_rules.onBackPress, false);
        document.addEventListener("pause", enabled_rules.onPause, false);
        document.addEventListener("resume", enabled_rules.onResume, false);
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
            wemoUtil.loadUrl(filePath.DEVICE_LIST);
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
    ruleStatus : function(){

        $('ul#enabled_rules_list li.ruleStatus').each(function (index) {
            var item = $(this);
            var ruleStartTime = item.attr("data-startTime");
            var ruleEndTime = item.attr("data-endTime");
            var dayValue = item.attr("data-days");
            var d = new Date();
            var today = d.getDay();
            var ruleActiveDay='';
            var hasRulePrevDay= false;
            var currTimeInMilli = enabled_rules.convertTimeToMilliseconds();
            
            if(dayValue.indexOf('9') != -1){
                if(today == 0 || today==6){
                    ruleActiveDay=true;  
                }else{
                    ruleActiveDay=false;
                }
            }else if(dayValue.indexOf('8') != -1){
                if((today>0)&&(today<6)){
                    ruleActiveDay=true;
                }else{
                    ruleActiveDay=false;
                }
            }else if(dayValue.indexOf('0') != -1 || (dayValue === ",-1")){
                ruleActiveDay=true;                  
            }else if(dayValue.indexOf(parseInt(today)+1) != -1){
            	ruleActiveDay=true; 
            }else{
                ruleActiveDay=false;
            }

            if(today == 0){
            	if(dayValue.indexOf(7) != -1){
            		hasRulePrevDay= true;
            	}
            }else{
            	if(dayValue.indexOf(parseInt(today)) != -1){
            		hasRulePrevDay= true;
            	}
            }

            wemoUtil.infoLog(TAG , "dayValue" + dayValue);

            if (dayValue.match(/,1,2,3,4,5,6,7/)) {
                var daily = wemo.items['Daily'];
                $(this).find(".enabled_days").html(daily);
            }


            if(ruleActiveDay == true){
                if(parseInt(ruleEndTime)> 86400){
                	ruleEndTime = parseInt(ruleEndTime)-86400;
                }
                if ((currTimeInMilli<=ruleStartTime)){
                    var diff=ruleStartTime-currTimeInMilli;
                    var ruleID = item.attr("id");
                    setTimeout(function () {
                    	
                        $("#"+ruleID+" .enabled_rules_active").show();
                        $("#"+ruleID+" .enabled_rules_time").hide();
                        $("#"+ruleID+" .enabled_rules_day").hide();

                    }, diff * 1000);
                }

                if (((currTimeInMilli>ruleStartTime) && (currTimeInMilli<ruleEndTime)) || (dayValue === ",-1")){
                    console.log("Currently Active State");
                    var ruleID = item.attr("id");
                    $("#"+ruleID+" .enabled_rules_active").show();
                    $("#"+ruleID+" .enabled_rules_time").hide();
                    $("#"+ruleID+" .enabled_rules_day").hide();
                }

                if (currTimeInMilli<=ruleEndTime){
                	var diffEnd=ruleEndTime-currTimeInMilli;
                    var ruleID = item.attr("id");
                    setTimeout(function () {
                    	$("#"+ruleID+" .enabled_rules_active").hide();
                        $("#"+ruleID+" .enabled_rules_time").show();
                        $("#"+ruleID+" .enabled_rules_day").show();

                    }, diffEnd * 1000);
                }
               
                
                
                
                if(parseInt(ruleEndTime) < parseInt(ruleStartTime)){
                    if ((currTimeInMilli>=ruleStartTime)){
                        var ruleID = item.attr("id");
                        $("#"+ruleID+" .enabled_rules_active").show();
                        $("#"+ruleID+" .enabled_rules_time").hide();
                        $("#"+ruleID+" .enabled_rules_day").hide();
                    }
                    if((currTimeInMilli<=ruleStartTime) && (currTimeInMilli<=ruleEndTime) && hasRulePrevDay){
                        var ruleID = item.attr("id");
                        $("#"+ruleID+" .enabled_rules_active").show();
                        $("#"+ruleID+" .enabled_rules_time").hide();
                        $("#"+ruleID+" .enabled_rules_day").hide();
                    }
                    else if ((currTimeInMilli<=ruleStartTime)){
                        var diff=ruleStartTime-currTimeInMilli;
                        var ruleID = item.attr("id");
                        setTimeout(function () {
                            $("#"+ruleID+" .enabled_rules_active").show();
                            $("#"+ruleID+" .enabled_rules_time").hide();
                            $("#"+ruleID+" .enabled_rules_day").hide();

                        }, diff * 1000);
                    }


                }

                if(parseInt(ruleEndTime) == parseInt(ruleStartTime)){
                    if ((currTimeInMilli>=ruleStartTime)){
                        var ruleID = item.attr("id");
                        //alert('ruleID'+ruleID);
                        $("#"+ruleID+" .enabled_rules_active").show();
                        $("#"+ruleID+" .enabled_rules_time").hide();
                        $("#"+ruleID+" .enabled_rules_day").hide();
                    }
                    if ((currTimeInMilli<=ruleStartTime)){
                        var diff=ruleStartTime-currTimeInMilli;
                        var ruleID = item.attr("id");
                        setTimeout(function () {
                            $("#"+ruleID+" .enabled_rules_active").show();
                            $("#"+ruleID+" .enabled_rules_time").hide();
                            $("#"+ruleID+" .enabled_rules_day").hide();

                        }, diff * 1000);
                    }

                }
            }else if(hasRulePrevDay){
            	var isNextDay = false;
            	if(parseInt(ruleEndTime)> 86400){
            		isNextDay= true;
                	ruleEndTime = parseInt(ruleEndTime)-86400;                 	 
                }
            	if(currTimeInMilli<=ruleEndTime && isNextDay){
                    var ruleID = item.attr("id");
                    $("#"+ruleID+" .enabled_rules_active").show();
                    $("#"+ruleID+" .enabled_rules_time").hide();
                    $("#"+ruleID+" .enabled_rules_day").hide();
                }
            }


        });
    },
    convertTimeToMilliseconds : function(){

        var d = new Date();
        var hh = d.getHours();
        var m = d.getMinutes();
        var s = d.getSeconds();
        return (hh*3600)+(m*60)+s;


    }

};
