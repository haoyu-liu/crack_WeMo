/*
    rules_tab.js

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

var TAG = "rules_tab.js: ";

$(document).bind('pageinit', function() {
	enabled_rules.initialize();
});

var enabled_rules = {

		initialize : function() {
			console.log(TAG + "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

		onDeviceReady : function() {
			console.log(TAG + "onDeviceReady enabled rules");
			enabled_rules.bindEvents();
			//All initialization script

			//enabled_rules_list make json;
			var enabled_rules =	{'Rule': [
			          	         {"name":"Rule1", "startTime":'5.15am', "endTime":'6.15am',"startDay":"Thu","endDay":'Wed'},
			          	         {"name":"Rule2", "startTime":'6.15am', "endTime":'7.15am',"startDay":"Fri","endDay":'Mon'},
			          	         {"name":"Rule3", "startTime":'7.15am', "endTime":'8.15am',"startDay":"Sun","endDay":'Thu'},
			          	         {"name":"Rule1", "startTime":'5.15am', "endTime":'6.15am',"startDay":"Thu","endDay":'Wed'},
			          	         {"name":"Rule2", "startTime":'6.15am', "endTime":'7.15am',"startDay":"Fri","endDay":'Mon'},
			          	         {"name":"Rule3", "startTime":'7.15am', "endTime":'8.15am',"startDay":"Sun","endDay":'Thu'}
			            ]};

			var enabled_rule_list = "";
			if(enabled_rules.Rule.length > 0){
				$(".enabled_rules").show();
			}
			else{
				$(".enabled_rules").hide();
			}
			for(var i = 0; i < enabled_rules.Rule.length; i++){
				enabled_rule_list += "<li><span class='rule'>" +enabled_rules.Rule[i].name+ "</span>" +
					    	"<p><span class='enabled_rules_time'>"+enabled_rules.Rule[i].startTime +" - "+ enabled_rules.Rule[i].endTime+",</span> <span class='enabled_rules_day'>"+enabled_rules.Rule[i].startDay+" " +enabled_rules.Rule[i].endDay +"</span></p> " +
							"</li>";
			}

			$('#enabled_rules_list').html(enabled_rule_list);

			//disabled_rules_list make json;
			var disabled_rules =	{'Rule': [
			          	         {"name":"Rule1", "disalbed":'Disabled'},
			          	         {"name":"Rule2", "disalbed":'Disabled'},
			          	         {"name":"Rule3", "disalbed":'Disabled'},
			            ]};

			var disabled_rule_list = "";
			if(disabled_rules.Rule.length > 0){
				$(".disabled_rules").show();
			}
			else{
				$(".disabled_rules").hide();
			}
			for(var i = 0; i < disabled_rules.Rule.length; i++){
				disabled_rule_list += "<li><span class='rule'>" +disabled_rules.Rule[i].name+ "</span>" +
					    	"<p><span class='enabled_rules_time'>"+disabled_rules.Rule[i].disalbed +"</span></p>" +
							"</li>";
            }
			$('#disabled_rules_list').html(disabled_rule_list);
			
			//For Rule Details
			 var rule_details =	{'Rule': [
	                   	   {"rule":"Rule1", "startTime":'5.15am', "endTime":'6.15am',"startDay":"Thu","endDay":'Wed', 
	                   		"devices":[{"image":"../img/belkin_switch_big.png","device_name": "WeMo Switch 292", "state": "Turn ON", "ruleapplied": "Stays on for 15 minutes", "aftermotion": "after motion stops"},
	                   		           {"image":"../img/belkin_switch_big.png","device_name": "WeMo Switch 282", "state": "Turn ON", "ruleapplied": "Stays on for 15 minutes", "aftermotion": "after motion stops"},
	                   		           {"image":"../img/belkin_switch_big.png","device_name": "WeMo Switch 272", "state": "Turn ON", "ruleapplied": "Stays on for 15 minutes", "aftermotion": "after motion stops"}
	                   		    ]
	                   		   
	                   	   },
	                    ]};
	
	         var rule_detail = "";
	         var rule_devices = "";
	         
	         for(var i = 0; i < rule_details.Rule.length; i++){
	        	 rule_detail += "<p class='rule_heading'>" + rule_details.Rule[i].rule + "</p>" +
	         	"<p class='rule_details'><span class='rule_time'>" +rule_details.Rule[i].startTime +" - " + rule_details.Rule[i].endTime  + ",</span> <span class='rule_day'>" + rule_details.Rule[i].startDay + "</span></p>";
	         
	         	 for(var j=0; j<rule_details.Rule[i].devices.length; j++){
	                         rule_devices +="<li><div class='rule_img'><img src='" + rule_details.Rule[i].devices[j].image + "'/></div>" +
		    	        	 "<div class='rule_details_device'><span class='rule_details_device_name'>"+  rule_details.Rule[i].devices[j].device_name +"</span>" +
		    	        	 "<span class='rule_details_state'>"+rule_details.Rule[i].devices[j].state +"</span>" +
		    	        	 "<span class='rule_details_stays'>" +rule_details.Rule[i].devices[j].ruleapplied + "</span>" +
		    	        	 "<span class='rule_details_stops'>"+rule_details.Rule[i].devices[j].aftermotion +"</span>" +
		    	        	 "</li>";
	         	 }
	         	
	         	 $(".rule_details_list").html(rule_devices);
	         	
	         }
	         
	       $(".rule").html(rule_detail);
	       
	   	  //Based on the device set the height for container div
		     var screenHeight = $(window).height();
	         var screenWidth = $(window).width();
	         var headerHeight = $("header").height();
	         var footerHeight = $("footer").height();
	         var elemHeight = $(".rules_page").height();
	         var totalHeight = headerHeight + footerHeight;
	         var setHeight = screenHeight - totalHeight;
	         $(".vertical_center").css({'height': (setHeight -25 ) / 3 + 'px'});
			 
			 
			//To return back to home page: device list tab
			$(".wemo_logo").on("tap", function(e) {
				if ( e.target.nodeName!= "IMG" ) {				
					wemoUtil.loadUrl(filePath.DEVICE_LIST);
				}
			});
		},

		bindEvents : function() {
			console.log(TAG + "bindEvents");
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
			console.log(TAG + "onBackPress");
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
