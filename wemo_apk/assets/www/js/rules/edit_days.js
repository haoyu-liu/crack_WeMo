/*
    edit_days.js

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

var TAG = "edit_days.js: ";

$(document).bind('pageinit', function() {
	edit_days.initialize();
});

var edit_days = {

		initialize : function() {
			console.log(TAG + "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

		onDeviceReady : function() {
			console.log(TAG + "onDeviceReady");
			edit_days.bindEvents();
			//Getting days info from Session -> x
			var x=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
			
			var daysType;
			//All initialization script goes here
			if(x.SelectedDayOrRange != undefined){
				if(x.SelectedDayOrRange === sessionStore.DAILY){
					$("#daily").attr("checked","checked");
					$("input[type='radio']").checkboxradio("refresh");
				}else if(x.SelectedDayOrRange === sessionStore.WEEK_DAYS){
					$("#weekdays").attr("checked","checked");
					$("input[type='radio']").checkboxradio("refresh");
				}else if(x.SelectedDayOrRange === sessionStore.WEEK_END){
					$("#weekends").attr("checked","checked");
					$("input[type='radio']").checkboxradio("refresh");
				}else{
					if(x.SelectedDayOrRange != undefined){
						var strDays = x.SelectedDayOrRange;
						var arrDays = strDays.split("-");
						for(var i=0; i<arrDays.length; i++){
							$("[name='select_day']").each(function(){
								if(arrDays[i] === $(this).val()){
									$(this).attr("checked","checked");
									$("[name='select_day']").checkboxradio("refresh");
								}
							});
						}
					}
				}
			}else{
				$("#daily").attr("checked","checked");
			}
			$("input[type='radio']").checkboxradio("refresh");
			
			$("[name='select_day']").on("change", function(){
						$("input[type='radio']").removeAttr("checked");
						$("input[type='radio']").checkboxradio("refresh");
						daysType = "individualDays";
			});
			
			//To return back to home page: device list tab
			$(".wemo_logo").on("tap", function(e) {
				if ( e.target.nodeName!= "IMG" ) {				
					wemoUtil.loadUrl(filePath.DEVICE_LIST);
				}
			});
			
		    $("input[type='radio']").on("click", function(){
						$("[name='select_day']").removeAttr("checked");
						$("[name='select_day']").checkboxradio("refresh");
						daysType = "dayRange";
			});
		    
			$("#edit_days_cancel_btn").on('pointerdown', function(){
				if(x.SelectedDayOrRange==undefined){
					x.SelectedDayOrRange=sessionStore.DAILY;
				}
				wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,x);
				wemoUtil.loadPreviousUrl();
			});
			
			$("#edit_days_save_btn").on('pointerdown', function(){
				var daysRange = "null";
				var individualDays = "null";
				if(daysType == "dayRange"){
					//select days
					daysRange = "";
					$("input[type='radio']").each(function(){
						var select_days = $("input[type='radio']").is(":checked");
						$("[name='select_day']").checkboxradio("refresh");
						if($(this).is(':checked')){
						    daysRange = $(this).val();
						    console.log(daysRange+" - Date Range");
						}
				   });
				}else if(daysType == "individualDays"){
				   //individual days
					individualDays = "";
					$("[name='select_day']").each(function(){
						var individual_days = $("[name='select_day']").is(":checked");
						$("[name='select_day']").checkboxradio("refresh");
						if($(this).is(':checked')){
							individualDays += $(this).val()+"-";
						    console.log(individualDays+" - Individual");
						}
					});
				}
				if(individualDays != "null"){
					individualDays = individualDays.substr(0, individualDays.lastIndexOf("-"));
					if(individualDays === sessionStore.DAILY_VAL){
						individualDays = sessionStore.DAILY;
					}else if(individualDays === sessionStore.WEEK_DAYS_VAL){
						individualDays = sessionStore.WEEK_DAYS;
					}else if(individualDays === sessionStore.WEEK_END_VAL){
						individualDays = sessionStore.WEEK_END;
					}
					x.SelectedDayOrRange = individualDays;
				}
				if(daysRange != "null"){
					x.SelectedDayOrRange = daysRange;
				}
				
				if(x.SelectedDayOrRange==undefined || x.SelectedDayOrRange==""){
					x.SelectedDayOrRange=sessionStore.DAILY;
				}
				
				wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,x);
				var wemo_rule_type=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_TYPE);
				console.log(" Start Time :: "+x.When.StartTime+"  End Time :: "+x.When.EndTime+ "  Rule Type :: "+wemo_rule_type);
				if ((x.When.StartTime==sessionStore.ALLDAY_STARTTIME && x.When.EndTime==sessionStore.ALLDAY_ENDTIME) && (wemo_rule_type=='edit_sensor_rule' || wemo_rule_type=='sensor_rule')){
					wemoUtil.loadUrl(filePath.SENSORS_RULE_WHEN);
				}else{
					wemoUtil.loadPreviousUrl();
				}
			});
		},

		bindEvents : function() {
			console.log(TAG + "bindEvents");
			document.addEventListener('online', edit_days.onOnline, false);
			document.addEventListener('offline', edit_days.onOffline, false);
			document.addEventListener("backbutton", edit_days.onBackPress, false);
			document.addEventListener("pause", edit_days.onPause, false);
			document.addEventListener("resume", edit_days.onResume, false);
		},

		onOffline : function() {
			console.log(TAG + "offLine");
		},

		onOnline : function() {
			console.log(TAG + "onLine");
		},

		onBackPress : function() {
			if ($(".more_tab").is(":visible")) {
	    		$(".more_tab").hide();
	    		$('body').find('.modalWindow').transition({opacity:0},400, function(){
	                $(this).removeClass('isOpen');
	            });
	    	}
	    	else {
	    		console.log(TAG + "onBackPress");
	    		wemoUtil.loadPreviousUrl();
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
		}

};
