/*
    when_countdown.js

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


var TAG = "when_countdown.js: ";
var UP_TF_IS24 = false;//UP-user preferences, TF-time format

$(document).bind('pageinit', function() {
	when_countdown.initialize();
});

var when_countdown = {

		initialize : function() {
			console.log(TAG + "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},
		
		timeSR_ : 0,
		timeSS_ : 0,

		onDeviceReady : function() {
			console.log(TAG + "onDeviceReady");
            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
            UP_TF_IS24 = wemoUtil.userPreferences.getTimeFormat();
            
			var height = $("#Mon").width();
			$("#schedule li div").css("height", height);
			var radius = (height/2)+"px";
			$("#schedule li div").css("border-radius", radius);
			$("#schedule li div").css("-moz-border-radius", radius);
			$("#schedule li div").css("-ms-border-radius", radius);
			$("#schedule li div").css("-o-border-radius", radius);
			
			var width = $("#TTicker").width();
			var width_li = parseInt(width /100 * 19, 10);
					
			var height_offset = width_li;
			$(".drawer_offset li div").css("height", height_offset);
			
			var radius_offset = (width_li / 2) + "px";
			$(".drawer_offset li div").css("border-radius", radius_offset);
			$(".drawer_offset li div").css("-moz-border-radius", radius_offset);
			$(".drawer_offset li div").css("-ms-border-radius", radius_offset);
			$(".drawer_offset li div").css("-o-border-radius", radius_offset);
			
			var height_drawer = Math.round( height_offset * 2 + 10 ) + "px";
			$(".drawer_offset").css("height", height_drawer);
			$(".startTime .sr_offset, .startTime .ss_offset").css("height", height_drawer);
			$(".endTime .sr_offset, .endTime .ss_offset").css("height", height_drawer);

            wemoUtil.setTimeFormat();
			when_countdown.bindEvents();
			var ruleObj= wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);

            if (ruleObj.When.StartSRSS == undefined) {
                $(".startTime .custom_time").show();
                $('#start_time').val(wemoUtil.convertMillisecondsToTF(ruleObj.When.StartTime, UP_TF_IS24));
            } else {
                $(".startTime .srss").show();
            }

            if (ruleObj.When.EndSRSS == undefined) {
                $(".endTime .custom_time").show();
                $('#end_time').val(wemoUtil.convertMillisecondsToTF(ruleObj.When.EndTime, UP_TF_IS24));
            } else {
                $(".endTime .srss").show();
            }

			var arrDays = ruleObj.SelectedDayOrRange.split("-");

			$('#schedule div').each(function(i,elem) {
				$(this).removeClass("div_bg_green div_bg_white").addClass("div_bg_white")
			});

			for(var i=0; i < arrDays.length; i++){
				console.log("arrDays "+arrDays[i]);
				$('div [id="'+arrDays[i]+'"]').removeClass("div_bg_white").addClass("div_bg_green");
			}

			// Initiate Android type timer
			$('#start_time').on("tap", function(e) {
                var prevSTimeValue = $(this).val().toUpperCase();
                $("#time_start_selector").BelkinPicker({type: "time", curval: prevSTimeValue, TF24: UP_TF_IS24}, "show", function (val) {
                        if (val == "cancel_time_changes") $('#start_time').val(prevSTimeValue.toLowerCase());
                        else $('#start_time').val(val.toLowerCase());
                        $("#time_start_selector").BelkinPicker({}, "hide");
                        ruleObj.When.StartTime = wemoUtil.convertTimeToMilliseconds(val);
                    }
                );
                e.preventDefault();
				e.stopPropagation();
		    });

            $('#end_time').on("tap", function(e) {
                var prevETimeValue = $(this).val().toUpperCase();
                $("#time_end_selector").BelkinPicker({type: "time", curval: prevETimeValue, TF24: UP_TF_IS24}, "show", function (val) {
                        if (val == "cancel_time_changes") $('#end_time').val(prevETimeValue.toLowerCase());
                        else $('#end_time').val(val.toLowerCase());
                        $("#time_end_selector").BelkinPicker({}, "hide");
                        ruleObj.When.EndTime = wemoUtil.convertTimeToMilliseconds(val);
                    }
                );

                e.preventDefault();
				e.stopPropagation();
            });

            $(".startTime .srss_items .more_li_text_div, .startTime .srss_items .more_li_subHeader, .endTime .srss_items .more_li_text_div, .endTime .srss_items .more_li_subHeader").on("tap", function () {
                var input = $(this).parent().find("input");
                var tab;
                if ( $(this).closest(".tab").hasClass("startTime") ) {
                    tab = "startTime";
                } else {
                    tab = "endTime";
                }
                console.log("tabbbb "+tab);
                if ( input.prop("checked") == true ) {
                    if ( $(this).parent().hasClass("sr") ) {
                        $("."+tab+" .sr_offset").parent().slideToggle("slow");
                    } else {
                        $("."+tab+" .ss_offset").parent().slideToggle("slow");
                    }
                }
            });

			$(".drawer_offset div").on('tap', function(e) {

				if ( !$(this).hasClass("custom") ) {
					var tab = $(this).closest(".tab").hasClass("startTime") ? wemo.items["TabStartTime"] : wemo.items["TabEndTime"];
					var name_radio_btn = tab == "startTime" ? "sensors_start_srss" : "sensors_end_srss";
					var sr_or_ss = $('input[name='+name_radio_btn+']:checked').val();
					var time = $('input[name='+name_radio_btn+']:checked').val() == wemo.items["SunRise"] ? when_countdown.timeSR_ : when_countdown.timeSS_;
					var value = $(this).attr("value");

					var itemTitle = $('input[name='+name_radio_btn+']:checked').closest(".srss_items").find(".more_li_text_div");
					if ( value != "0" ) {
						itemTitle.empty().html( when_countdown.getSRSSheader( value, sr_or_ss ) );
					} else {
						itemTitle.empty().html( sr_or_ss );
					}

					var subHeader = $('input[name='+name_radio_btn+']:checked').closest(".srss_items").find(".more_li_subHeader");
					var subHeaderTime = $('input[name='+name_radio_btn+']:checked').closest(".srss_items").find(".more_li_subHeader .timeSRSS");
					subHeaderTime.empty().html( when_countdown.getSRSSsubHeaderWithOffset( time, value ) );
					if ( value != "0" ) {
						subHeader.find("span").removeClass("link_gray").addClass("link_green");
					} else {
						subHeader.find("span").removeClass("link_green").addClass("link_gray");
					}

					var drawer = $(this).closest(".drawer_offset");
					var drawer_divs = $(this).closest(".drawer_offset").find("div");

					drawer_divs.removeClass("srss_offset_active");
					$(this).addClass("srss_offset_active");
					drawer.slideToggle("slow");

					switch (tab) {
						case wemo.items["TabStartTime"]: ruleObj.When.OnModeOffset = value; break;
						case wemo.items["TabEndTime"]: ruleObj.When.OffModeOffset = value; break;
					}
				}
				else {
					$(this).closest(".drawer_offset").find("div").removeClass("srss_offset_active");
					$(this).addClass("srss_offset_active");
					var tab = $(this).closest(".drawer_offset").closest(".tab").hasClass("startTime") ? wemo.items["TabStartTime"] : wemo.items["TabEndTime"];
					var name_radio_btn = tab == "startTime" ? "sensors_start_srss" : "sensors_end_srss";
					$(this).closest(".drawer_offset").slideToggle("slow");

					var pickerHeader = $('input[name='+name_radio_btn+']:checked').val() == wemo.items["SunRise"] ? wemo.items["AroundSunRise"] : wemo.items["AroundSunSet"];

					switch ( tab ) {
						case wemo.items["TabStartTime"] : {
							$("#custom_offset_selector_start span").empty().html(pickerHeader);
							$("#custom_offset_selector_start").BelkinPicker({type: "offset", curval: "00:20 before"}, "show", function (val) {
								when_countdown.setOffsetFromPicker( "sensors_start_srss", wemo.items["TabStartTime"], val, ruleObj);
								$("#custom_offset_selector_start").BelkinPicker({}, "hide");
							});	break;
						}
						case wemo.items["TabEndTime"] : {
							$("#custom_offset_selector_end span").empty().html(pickerHeader);
							$("#custom_offset_selector_end").BelkinPicker({type: "offset", curval: "00:20 before"}, "show", function (val) {
								when_countdown.setOffsetFromPicker( "sensors_end_srss", wemo.items["TabEndTime"] , val, ruleObj);
								$("#custom_offset_selector_end").BelkinPicker({}, "hide");
							});	break;
						}
					}
				}
                e.preventDefault();
                e.stopPropagation();
			});

			//All initialization script goes here
			//-------------------Start SRSS--------------------
		    // Set the default Radio Button Sunset Checked
		    // Toggle for Time and Sun Set/Sun Rise

            if (ruleObj.When.StartSRSS != undefined && ruleObj.When.EndSRSS != undefined){
            	when_countdown.getLocationData(ruleObj);
            }else if (ruleObj.When.StartSRSS != undefined && ruleObj.When.EndSRSS == undefined){
            	when_countdown.getLocationData(ruleObj);
			}else if (ruleObj.When.StartSRSS == undefined && ruleObj.When.EndSRSS != undefined){
				when_countdown.getLocationData(ruleObj);
			}

			$('#start_time').val(wemoUtil.convertMillisecondsToTF(ruleObj.When.StartTime, UP_TF_IS24));
            $('#end_time').val(wemoUtil.convertMillisecondsToTF(ruleObj.When.EndTime, UP_TF_IS24));

            /**************** Sunrise / Sunset for Start time ******************/

            if (ruleObj.When.StartSRSS != undefined){
				$("#toggleTS_startTime div").removeClass("active clock_not_active sun_not_active"); //attr class erased
				$("#toggleTS_startTime div").children().removeClass("time_active sun_active clock_not_active sun_not_active"); //attr class erased
            	$("#toggleTS_startTime .sun").addClass("active");
				$("#toggleTS_startTime .time").addClass("clock_not_active");
				$("#toggleTS_startTime .sun").children().addClass("sun_active");

				$(".startTime .custom_time").hide();
				$(".startTime .srss").show();

            	$(".startTime #start"+ ruleObj.When.StartSRSS ).prop("checked", true);
				console.log("ruleObj.When.OnModeOffset ---> "+ruleObj.When.OnModeOffset);
				console.log("3");
				if ( ruleObj.When.OnModeOffset != "0" ) {
					setTimeout(function(){
						var subHeaderTime = $('input[name=sensors_start_srss]:checked').closest(".srss_items").find(".more_li_subHeader .timeSRSS");
						var subHeader = $('input[name=sensors_start_srss]:checked').closest(".srss_items").find(".more_li_subHeader");
						var time = $('input[name=sensors_start_srss]:checked').val() == wemo.items["SunRise"] ? when_countdown.timeSR_ : when_countdown.timeSS_;
						var xx = when_countdown.getSRSSsubHeaderWithOffset( time, ruleObj.When.OnModeOffset );
						console.log("xx "+xx);
						subHeaderTime.empty().html( xx );
						subHeader.find("span").removeClass("link_gray").addClass("link_green");

						var sr_or_ss = $('input[name=sensors_start_srss]:checked').val();
						var itemHeader = $('input[name=sensors_start_srss]:checked').closest(".srss_items").find(".more_li_text_div");
						itemHeader.empty().html( when_countdown.getSRSSheader( ruleObj.When.OnModeOffset, sr_or_ss ) );

						var drawer = sr_or_ss == wemo.items["SunRise"] ? $(".startTime .srss .sr_offset") : $(".startTime .srss .ss_offset");
						when_countdown.checkDivInDrawer( drawer, ruleObj.When.OnModeOffset );
					}, 100);
				}
            } else {
				$(".startTime .srss").hide();
			}

            /**************** Sunrise / Sunset for End time ******************/

            if (ruleObj.When.EndSRSS != undefined){
				$("#toggleTS_endTime div").removeClass("active clock_not_active sun_not_active"); //attr class erased
				$("#toggleTS_endTime div").children().removeClass("time_active sun_active clock_not_active sun_not_active"); //attr class erased
            	$("#toggleTS_endTime .sun").addClass("active");
				$("#toggleTS_endTime .time").addClass("clock_not_active");
				$("#toggleTS_endTime .sun").children().addClass("sun_active");
				$(".endTime .custom_time").hide();
				$(".endTime .srss").show();

            	$(".endTime #end"+ ruleObj.When.EndSRSS ).prop("checked", true);
				console.log("ruleObj.When.OffModeOffset ---> "+ruleObj.When.OffModeOffset);
				if ( ruleObj.When.OffModeOffset != "0" ) {
					setTimeout(function(){
						var subHeaderTime = $('input[name=sensors_end_srss]:checked').closest(".srss_items").find(".more_li_subHeader .timeSRSS");
						var subHeader = $('input[name=sensors_end_srss]:checked').closest(".srss_items").find(".more_li_subHeader");
						var time = $('input[name=sensors_end_srss]:checked').val() == wemo.items["SunRise"] ? when_countdown.timeSR_ : when_countdown.timeSS_;
						subHeaderTime.empty().html( when_countdown.getSRSSsubHeaderWithOffset( time, ruleObj.When.OffModeOffset ) );
						subHeader.find("span").removeClass("link_gray").addClass("link_green");

						var sr_or_ss = $('input[name=sensors_end_srss]:checked').val();
						var itemHeader = $('input[name=sensors_end_srss]:checked').closest(".srss_items").find(".more_li_text_div");
						itemHeader.empty().html( when_countdown.getSRSSheader( ruleObj.When.OffModeOffset, sr_or_ss ) );

						var drawer = sr_or_ss == wemo.items["SunRise"] ? $(".endTime .srss .sr_offset") : $(".endTime .srss .ss_offset");
						when_countdown.checkDivInDrawer( drawer, ruleObj.When.OffModeOffset );
					}, 100);
				}
            } else {
				$(".endTime .srss").hide();
			}

			$('.startTime').find('#startSunrise, #startSunset').on('click', function(){
				ruleObj.When.StartSRSS = $('input[name=sensors_start_srss]:checked').val();
				ruleObj.When.OnModeOffset = "0";
				when_countdown.selectSRSS(ruleObj, "startSRSS");

				$(".startTime .drawer_offset div").removeClass("srss_offset_active").addClass("srss_offset_inactive");
				$(".endTime .drawer_offset div").removeClass("srss_offset_active").addClass("srss_offset_inactive");
				$(".startTime .drawer_offset .exactly").addClass("srss_offset_active");
				$(".endTime .drawer_offset .exactly").addClass("srss_offset_active");

				if ($(".startTime .drawer_offset").is(":visible")) {
					$(".startTime .drawer_offset").slideToggle("slow");
				}
				if ($(".endTime .drawer_offset").is(":visible")) {
					$(".endTime .drawer_offset").slideToggle("slow");
				}

				$("input[name='sensors_start_srss']").each(function(){
					if( !$(this).is(':checked') ){
						var itemTitle = $(this).closest(".srss_items").find(".more_li_text_div");
						var subHeader = $(this).closest(".srss_items").find(".more_li_subHeader");
						var subHeaderTime =  $(this).closest(".srss_items").find(".more_li_subHeader .timeSRSS");
						var time = $(this).val() == wemo.items["SunRise"] ? when_countdown.timeSR_ : when_countdown.timeSS_;
						var drawerOn = $(this).val() == wemo.items["SunRise"] ? $(".startTime .sr_offset") : $(".startTime .ss_offset");
						var drawerOff = $(this).val() == wemo.items["SunRise"] ? $(".endTime .ss_offset") : $(".endTime .sr_offset");

						itemTitle.empty().html( $(this).val() );
						subHeader.find("span").removeClass("link_green").addClass("link_gray");
						subHeaderTime.empty().html( when_countdown.getSRSSsubHeaderWithOffset( time, "0" ) );
						drawerOn.find("div").removeClass("srss_offset_active");
						drawerOn.find(".exactly").addClass("srss_offset_active");
						drawerOff.find("div").removeClass("srss_offset_active");
						drawerOff.find(".exactly").addClass("srss_offset_active");
					}
				});
			});

			$('.endTime').find('#endSunrise, #endSunset').on('click', function(){
				ruleObj.When.EndSRSS = $('input[name=sensors_end_srss]:checked').val();
				ruleObj.When.OffModeOffset = "0";
				when_countdown.selectSRSS(ruleObj, "endSRSS");

				$(".startTime .drawer_offset div").removeClass("srss_offset_active").addClass("srss_offset_inactive");
				$(".endTime .drawer_offset div").removeClass("srss_offset_active").addClass("srss_offset_inactive");
				$(".startTime .drawer_offset .exactly").addClass("srss_offset_active");
				$(".endTime .drawer_offset .exactly").addClass("srss_offset_active");

				if ($(".startTime .drawer_offset").is(":visible")) {
					$(".startTime .drawer_offset").slideToggle("slow");
				}
				if ($(".endTime .drawer_offset").is(":visible")) {
					$(".endTime .drawer_offset").slideToggle("slow");
				}

				$("input[name='sensors_end_srss']").each(function(){
					if( !$(this).is(':checked') ){
						var itemTitle = $(this).closest(".srss_items").find(".more_li_text_div");
						var subHeader = $(this).closest(".srss_items").find(".more_li_subHeader");
						var subHeaderTime =  $(this).closest(".srss_items").find(".more_li_subHeader .timeSRSS");
						var time = $(this).val() == wemo.items["SunRise"] ? when_countdown.timeSR_ : when_countdown.timeSS_;
						var drawerOff = $(this).val() == wemo.items["SunRise"] ? $(".endTime .sr_offset") : $(".endTime .ss_offset");
						var drawerOn = $(this).val() == wemo.items["SunRise"] ? $(".startTime .ss_offset") : $(".startTime .sr_offset");

						itemTitle.empty().html( $(this).val() );
						subHeader.find("span").removeClass("link_green").addClass("link_gray");
						subHeaderTime.empty().html( when_countdown.getSRSSsubHeaderWithOffset( time, "0" ) );
						drawerOff.find("div").removeClass("srss_offset_active");
						drawerOff.find(".exactly").addClass("srss_offset_active");
						drawerOn.find("div").removeClass("srss_offset_active");
						drawerOn.find(".exactly").addClass("srss_offset_active");
					}
				});
			});

			//To return back to home page: device list tab
			$(".wemo_logo").on("tap", function(e) {
				if ( e.target.nodeName!= "IMG" ) {
					wemoUtil.loadUrl(filePath.DEVICE_LIST);
				}
			});

			$("#schedule div").on("tap", function() {
				if ($(this).hasClass("div_bg_green") && ( when_countdown.getNumberOfSelectedDays() != 1 ) ) {
					$(this).removeClass("div_bg_green").addClass("div_bg_white");
				} else {
					$(this).removeClass("div_bg_white").addClass("div_bg_green");
				}
			});

			var tabID;
			$("#toggleTS_startTime div").on("tap", function () {
				tabID=$(this).attr("data-tab-class");

				if ( !$(this).hasClass("active")) {
					$("#toggleTS_startTime div").removeClass("active clock_not_active sun_not_active"); //attr class erased
					$("#toggleTS_startTime div").children().removeClass("time_active sun_active clock_not_active sun_not_active"); //attr class erased
					$(this).addClass("active");

					if ( $(this).hasClass("time") ) {
						$("#toggleTS_startTime .sun").addClass("sun_not_active");
						$(this).children().addClass("time_active");
					} else {
						$("#toggleTS_startTime .time").addClass("clock_not_active");
						$(this).children().addClass("sun_active");
					}

					if (tabID == "startSRSS") {
						$(".startTime .custom_time").hide();
						$(".startTime .srss").show();
						setTimeout(function () {
							when_countdown.selectSRSS(ruleObj, tabID);
							when_countdown.getLocationData(ruleObj);
						}, 600);
					} else {
						delete ruleObj.When.StartSRSS;
						delete ruleObj.When.OnModeOffset;
						ruleObj.sunriseState = "0";
						ruleObj.When.StartTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestHalfHour());

						$(".startTime .drawer_offset").find("div").removeClass("srss_offset_active");
						$(".startTime .drawer_offset").find(".exactly").addClass("srss_offset_active");
						$(".startTime .timeSRSS").empty();

						$(".startTime .srss_items .more_li_subHeader span").removeClass("link_green").addClass("link_gray");
						$(".startTime .sr .more_li_text_div").empty().html(wemo.items['SunRise']);
						$(".startTime .ss .more_li_text_div").empty().html(wemo.items['SunSet']);

						$(".startTime .custom_time").show();
						$(".startTime .srss").hide();
						$('#start_time').empty().val(wemoUtil.convertMillisecondsToTF(ruleObj.When.StartTime, UP_TF_IS24));
					}
				}
				wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,ruleObj);
			});

			$("#toggleTS_endTime div").on("tap", function () {
				tabID=$(this).attr("data-tab-class");

				if ( !$(this).hasClass("active")) {
					$("#toggleTS_endTime div").removeClass("active clock_not_active sun_not_active"); //attr class erased
					$("#toggleTS_endTime div").children().removeClass("time_active sun_active clock_not_active sun_not_active"); //attr class erased
					$(this).addClass("active");

					if ( $(this).hasClass("time") ) {
						$("#toggleTS_endTime .sun").addClass("sun_not_active");
						$(this).children().addClass("time_active");
					} else {
						$("#toggleTS_endTime .time").addClass("clock_not_active");
						$(this).children().addClass("sun_active");
					}

					if (tabID == "endSRSS") {
						$(".endTime .custom_time").hide();
						$(".endTime .srss").show();
						setTimeout(function () {
							when_countdown.selectSRSS(ruleObj, tabID);
							when_countdown.getLocationData(ruleObj);
						}, 600);
					} else {
						delete ruleObj.When.EndSRSS;
						delete ruleObj.When.OffModeOffset;
						ruleObj.sunriseState = "0";
						ruleObj.When.EndTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestOneAndHalfHour());

						$(".endTime .drawer_offset").find("div").removeClass("srss_offset_active");
						$(".endTime .drawer_offset").find(".exactly").addClass("srss_offset_active");
						$(".endTime .timeSRSS").empty();

						$(".endTime .srss_items .more_li_subHeader span").removeClass("link_green").addClass("link_gray");
						$(".endTime .sr .more_li_text_div").empty().html(wemo.items['SunRise']);
						$(".endTime .ss .more_li_text_div").empty().html(wemo.items['SunSet']);

						$(".endTime .custom_time").show();
						$(".endTime .srss").hide();
						$('#end_time').empty().val(wemoUtil.convertMillisecondsToTF(ruleObj.When.EndTime, UP_TF_IS24));
					}
				}
				wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,ruleObj);
			});


			/**************** All Day Selection ******************/
		    var wemo_rule_type = window.sessionStorage.getItem(sessionStore.RULE_TYPE);

            wemo_rule_type.replace(/"/g, "");
            
			/**************** Update End time with 1 hrs ******************/
//
//	        $('#start_time').on('change', function(){
//            	$('#end_time').val(when_countdown.update_end_time($('#start_time').val()));
//            	wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,ruleObj);
//	        });
//
//	        $('#end_time').on('click', function(){
//	        	ruleObj.When.EndTime=$('#end_time').val();
//            	wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,ruleObj);
//	        });
//
	        /**************** Display selected day in When page ******************/

	        if(ruleObj.SelectedDayOrRange == undefined){
				ruleObj.SelectedDayOrRange = "Daily";
				var tempSelectedDayOrRange = wemo.items['Daily'];
			}
	        else{

	        	if(ruleObj.SelectedDayOrRange == "Weekday" || ruleObj.SelectedDayOrRange == "Weekend" || ruleObj.SelectedDayOrRange == "Daily")
                {
                	if(ruleObj.SelectedDayOrRange == "Weekday"){ tempSelectedDayOrRange = wemo.items['WeekdaysNoDetails'];}
                	else if(ruleObj.SelectedDayOrRange == "Weekend"){ tempSelectedDayOrRange = wemo.items['WeekendsNoDetails'];}
                	else{ tempSelectedDayOrRange = wemo.items[ruleObj.SelectedDayOrRange];}
   			 	}
                else if(ruleObj.SelectedDayOrRange == "Weekdays" || ruleObj.SelectedDayOrRange == "Weekends" || ruleObj.SelectedDayOrRange == "Daily")
                {
                	if(ruleObj.SelectedDayOrRange == "Weekdays"){ tempSelectedDayOrRange = wemo.items['WeekdaysNoDetails'];}
                	else if(ruleObj.SelectedDayOrRange == "Weekends"){ tempSelectedDayOrRange = wemo.items['WeekendsNoDetails'];}
                	else{ tempSelectedDayOrRange = wemo.items[ruleObj.SelectedDayOrRange];}
   			 	}
                else {

                	console.log("entering if returning44 "+ruleObj.SelectedDayOrRange);
                	var strDays = ruleObj.SelectedDayOrRange;
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
                    		tempSelectedDayOrRange = displaySelectedVal.join("-");
                    	}


                    }

                }

            }
			$("#rule_days").html(tempSelectedDayOrRange);

			 /**************** Select the Current Location for SRSS ******************/

			$("#your_current_location_ok_btn").on("tap",function() {
				var ruleObj=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
				var locationInfo = {};
				nativeUtilPlugin.execute(
						function(params) {
							if (params.length > 0) {
								locationInfo = {cityName : params[0], countryName: params[1], latitude: params[2], longitude: params[3], countryCode: params[4], region: params[5]};
								ruleObj[sessionStore.LOCATION_INFO] = locationInfo;
								ruleObj.sunriseState="1";
								wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, ruleObj);
								setTimeout(function(){
									wemoUtil.loadUrl(filePath.MORE_SETTING_LOCATION);
								}, timeout.CONTROL_POINT_DELAY);
							}else{

								alert("Location service not found.");
							}
						},
						function(err) {
							alert("Location service not found.");
						}, actions.GET_LOCATION_INFO, []
					);
				$("#your_current_location").popup('close');

			});

			 /**************** Redirect to Select location page for SRSS ******************/

			$("#your_current_location_dont_allow").on("tap",function() {
				$("#your_current_location").popup('close');

                $("#toggleTS_startTime .time").trigger("tap");
                $("#toggleTS_endTime .time").trigger("tap");

				var ruleObj=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
				var locationInfo = {};
				delete ruleObj.locationInfo;
				wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, ruleObj);
			});

			/**************** Soft cancel - Reset Rule object ******************/

			 $("#sensors_rule_when_cancel_btn").on('click', function(){
				 if(ruleObj.SelectedDayOrRange==undefined){
					ruleObj.SelectedDayOrRange=sessionStore.DAILY;
				 }
				 var fallBackObj=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.FALL_BACK);
				 if (fallBackObj!=null){
					 if (fallBackObj.When.StartSRSS!=undefined && fallBackObj.When.EndSRSS!=undefined){

						 	if(fallBackObj.When.StartSRSS == "Sunrise")
				        	{
				        		var tempStartSRSS = wemo.items['SunRise'];
				        	}
				        	else if(fallBackObj.When.StartSRSS == "Sunset")
				        	{
				        		var tempStartSRSS = wemo.items['SunSet'];
				        	}
				        	else
				        	{ var tempStartSRSS = fallBackObj.When.StartSRSS;}

						 	if(fallBackObj.When.EndSRSS == "Sunrise")
				        	{
				        		var tempEndSRSS = wemo.items['SunRise'];
				        	}
				        	else if(fallBackObj.When.EndSRSS == "Sunset")
				        	{
				        		var tempEndSRSS = wemo.items['SunSet'];
				        	}
				        	else
				        	{ var tempEndSRSS = fallBackObj.When.EndSRSS;}


						 ruleObj.When.StartSRSS=tempStartSRSS;
						 ruleObj.When.EndSRSS=tempEndSRSS;

					 }else if (fallBackObj.When.StartSRSS!=undefined && fallBackObj.When.EndSRSS==undefined){

						 	if(fallBackObj.When.StartSRSS == "Sunrise")
				        	{
				        		var tempStartSRSS = wemo.items['SunRise'];
				        	}
				        	else if(fallBackObj.When.StartSRSS == "Sunset")
				        	{
				        		var tempStartSRSS = wemo.items['SunSet'];
				        	}
				        	else
				        	{ var tempStartSRSS = fallBackObj.When.StartSRSS;}

						 ruleObj.When.StartSRSS=tempStartSRSS;
						 ruleObj.When.RuleDuration=fallBackObj.When.RuleDuration;

					 }else if (fallBackObj.When.StartSRSS==undefined && fallBackObj.When.EndSRSS!=undefined){

						 	if(fallBackObj.When.EndSRSS == "Sunrise")
				        	{
				        		var tempEndSRSS = wemo.items['SunRise'];
				        	}
				        	else if(fallBackObj.When.EndSRSS == "Sunset")
				        	{
				        		var tempEndSRSS = wemo.items['SunSet'];
				        	}
				        	else
				        	{ var tempEndSRSS = fallBackObj.When.EndSRSS;}

						 ruleObj.When.StartTime=fallBackObj.When.StartTime;
						 ruleObj.When.EndSRSS=tempEndSRSS
						 ;
					 }else{
						 ruleObj.When.StartTime=fallBackObj.When.StartTime;
						 ruleObj.When.RuleDuration=fallBackObj.When.RuleDuration;
					 }
				 }else{
					 ruleObj.When.StartTime=wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestHalfHour());
					 ruleObj.When.EndTime=wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestOneAndHalfHour());
				 }

				 wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,ruleObj);
				 wemoUtil.loadPreviousUrl();
			  });

			  $("#sensors_rule_when_save_btn").on('click', function(){
                  nativeUtilPlugin.execute(null, null, actions.SHOW_SPLASH_ON_LOADING, []);
				var individualDays="";
				$('#schedule div').each(function(i,elem) {
					if ($(this).hasClass("div_bg_green")) {
						individualDays += $(this).attr("id")+"-";
					}
				});
				individualDays = individualDays.substr(0, individualDays.lastIndexOf("-"));

				if ( individualDays == "" ) {
					alert( wemo.items['SelectAtLeastOneDay_AlertMessage'] );
				} else {
					ruleObj.SelectedDayOrRange = individualDays;

				  /**************** If All Day and SRSS is not selected ******************/

				  if ((ruleObj.When.StartSRSS==undefined || ruleObj.When.EndSRSS==undefined) && (ruleObj.When.StartTime!=sessionStore.ALLDAY_STARTTIME && ruleObj.When.EndTime!=sessionStore.ALLDAY_ENDTIME)){
					  ruleObj.When.StartTime = wemoUtil.convertTimeToMilliseconds($('#start_time').val());
					  ruleObj.When.EndTime = wemoUtil.convertTimeToMilliseconds($('#end_time').val());
					  var StartTimeAM='false';
					  var EndTimeAM='false';
					  StartTimeAM=(wemoUtil.convertMillisecondsToAMPM(ruleObj.When.StartTime).lastIndexOf("am")!=-1) ? 'true' : 'false';
					  EndTimeAM=(wemoUtil.convertMillisecondsToAMPM(ruleObj.When.EndTime).lastIndexOf("am")!=-1) ? 'true' : 'false';
                      if ( ruleObj.When.EndTime == 0 ) ruleObj.When.EndTime = timestamp.MIDNIGHT_END_TIME;
					  if (ruleObj.When.EndTime<ruleObj.When.StartTime){
						  if (StartTimeAM==EndTimeAM) {
							  ruleObj.When.RuleDuration=86400-(parseInt(ruleObj.When.StartTime)-parseInt(ruleObj.When.EndTime));
						  }else{
							ruleObj.When.RuleDuration=(86400-(parseInt(ruleObj.When.StartTime)))+parseInt(ruleObj.When.EndTime);
						  }
					  }else{
						 ruleObj.When.RuleDuration=ruleObj.When.EndTime-ruleObj.When.StartTime;
					  }

				  }

				  /**************** If SRSS is selected ******************/

				  if ((ruleObj.When.StartSRSS!=undefined && ruleObj.When.EndSRSS==undefined) || (ruleObj.When.StartSRSS==undefined && ruleObj.When.EndSRSS!=undefined) || (ruleObj.When.StartSRSS!=undefined && ruleObj.When.EndSRSS!=undefined)){
					  if(Object.keys(ruleObj.Devices).length>0){
						  for(key in ruleObj.Devices){
							console.log("SRSS - UDN Firmware Version - "+key+"  ::  "+ruleObj.Devices[key]);
							ruleObj.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
							wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,ruleObj);
						  }
					  }
				  }

				  /**************** If SRSS is selected ******************/
				  var selectedDays="";
                    if (ruleObj.When.StartSRSS!=undefined || ruleObj.When.EndSRSS!=undefined){
					  switch (ruleObj.SelectedDayOrRange){
					  		case sessionStore.DAILY :
					  			selectedDays=sessionStore.DAILY_VAL;
					  			break;
					  		case sessionStore.WEEK_DAYS:
					  			selectedDays=sessionStore.WEEK_DAYS_VAL;
					  			break;
					  		case sessionStore.WEEK_END :
					  			selectedDays=sessionStore.WEEK_END_VAL;
					  			break;
					  		default:
					  			selectedDays=ruleObj.SelectedDayOrRange;
					  			break;
					  }
					//Get SRSS Time
					nativeUtilPlugin.execute(
					function(params) {
						if (params.length > 0) {
							var day = "";
							var tempData;
							var timeSR = 0;
							var timeSS = 0;
							var arrSelectedDays;
							var matchCounter = 0;
							var SRSSSelectedDays = {};

							console.log("#####################: "+ruleObj.SelectedDayOrRange+" :###################");
							$.each(params,function(index) {

								arrSelectedDays = selectedDays.split("-");
								console.log("prop:  "+index+"  ::  value::  "+params[index]+'  Days :: '+arrSelectedDays);

								var dayTime=params[index];
								dayTime=dayTime.split(/[|:]+/);
								var SRSSDay=dayTime[0];
								var timeSR=dayTime[1];
								var timeSS=dayTime[2];
								console.log("Grouped :: "+dayTime+" Day :: "+SRSSDay+" timeSR :: "+timeSR+" timeSS :: "+timeSS);

								for(var day=0; day<arrSelectedDays.length; day++){
									console.log("SRSSDay :: "+SRSSDay+" Day :: "+arrSelectedDays[day]+" before timeSR :: "+timeSR+"  before timeSS :: "+timeSS);
									if (arrSelectedDays[day]==SRSSDay){
										var iDay = wemoUtil.deCodeDays(SRSSDay);
										SRSSSelectedDays[iDay] = {};
										SRSSSelectedDays[iDay].day = iDay;

										if (ruleObj.When.StartSRSS === ruleObj.When.EndSRSS) {
											switch ( ruleObj.When.StartSRSS ) {
												case "Sunrise": {
													SRSSSelectedDays[iDay].timeSR = parseInt(timeSR) + parseInt(ruleObj.When.OnModeOffset) + 1;
													ruleObj.When.StartTime = parseInt(timeSR) + parseInt(ruleObj.When.OnModeOffset) + 1;
													ruleObj.When.EndTime = parseInt(timeSR) + parseInt(ruleObj.When.OffModeOffset) + 1;
													break;}
												case "Sunset": {
													SRSSSelectedDays[iDay].timeSS = parseInt(timeSS) + parseInt(ruleObj.When.OnModeOffset) + 2;
													ruleObj.When.StartTime = parseInt(timeSS) + parseInt(ruleObj.When.OnModeOffset) + 2;
													ruleObj.When.EndTime = parseInt(timeSS) + parseInt(ruleObj.When.OffModeOffset) + 2;
													break;}
											}
										} else {
										if(ruleObj.When.StartSRSS == "Sunrise"){
											SRSSSelectedDays[iDay].timeSR = parseInt(timeSR)+parseInt(1);
											ruleObj.When.StartTime = parseInt(timeSR)+parseInt(1);
										}else if(ruleObj.When.StartSRSS == "Sunset"){
  												SRSSSelectedDays[iDay].timeSS = parseInt(timeSS)  + parseInt(2);
											ruleObj.When.StartTime =  parseInt(timeSS)+parseInt(2);
										}

										if(ruleObj.When.EndSRSS == "Sunrise"){
  												SRSSSelectedDays[iDay].timeSR = parseInt(timeSR)+parseInt(1);
											ruleObj.When.EndTime = parseInt(timeSR)+parseInt(1);
										}else if(ruleObj.When.EndSRSS == "Sunset"){
											SRSSSelectedDays[iDay].timeSS = parseInt(timeSS)+parseInt(2);
											ruleObj.When.EndTime = parseInt(timeSS)+parseInt(2);
										}
  										}

										console.log("Same SRSS :: "+ruleObj.When.StartSRSS+"   "+ruleObj.When.EndSRSS);

										if(ruleObj.When.StartSRSS === ruleObj.When.EndSRSS){
											//alert("same");
											index=(index==6)?0:index;
											var tomorrowsData=params[index];
											tomorrowsData=tomorrowsData.split(/[|:]+/);
											var tomorrowsSRSSDay=tomorrowsData[0];
											var tomorrowsSR=parseInt(tomorrowsData[1]);
											var tomorrowsSS=parseInt(tomorrowsData[2]);

											if(ruleObj.When.StartSRSS == "Sunrise"){
												SRSSSelectedDays[iDay].timeSR = parseInt(timeSR)+parseInt(1);
												ruleObj.When.StartTime = parseInt(timeSR)+parseInt(1);
											}else if(ruleObj.When.StartSRSS == "Sunset"){
  													SRSSSelectedDays[iDay].timeSS = parseInt(timeSS) + parseInt(2);
												ruleObj.When.StartTime =  parseInt(timeSS)+parseInt(2);
											}

											if(ruleObj.When.EndSRSS == "Sunrise"){
												ruleObj.When.EndTime=parseInt(tomorrowsSR+86400+1)-60;
  													SRSSSelectedDays[iDay].timeSR = ruleObj.When.EndTime;
											}else if(ruleObj.When.EndSRSS == "Sunset"){
												ruleObj.When.EndTime=parseInt(tomorrowsSR+86400+2)-60;
												SRSSSelectedDays[iDay].timeSS = ruleObj.When.EndTime;
											}

										}

										if (parseInt(ruleObj.When.EndTime)== 0) ruleObj.When.EndTime = timestamp.MIDNIGHT_END_TIME;
                                        if (parseInt(ruleObj.When.EndTime)<parseInt(ruleObj.When.StartTime)){
  											ruleObj.When.RuleDuration = parseInt(timestamp.MAX_HOUR - parseInt(ruleObj.When.StartTime)) + parseInt(ruleObj.When.EndTime);
										}else{
                                              ruleObj.When.RuleDuration = parseInt(ruleObj.When.EndTime) - parseInt(ruleObj.When.StartTime);
										}

										console.log("Before ETime SR :: "+ruleObj.When.EndTime+"  STime SR :: "+ruleObj.When.StartTime+"   Rule Duration ::  "+ruleObj.When.RuleDuration);

										SRSSSelectedDays[iDay].RuleDuration = ruleObj.When.RuleDuration;

										console.log("After ETime SR :: "+ruleObj.When.EndTime+"  STime SR :: "+ruleObj.When.StartTime+"   Rule Duration ::  "+ruleObj.When.RuleDuration);
										matchCounter++;
									}
									if(matchCounter == arrSelectedDays.length){
										console.log("##########Added############");
										ruleObj[sessionStore.SRSS_SELECTED_DAYS] = SRSSSelectedDays;
										wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,ruleObj);
										return false;
									}
									wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,ruleObj);

								}

							});
						}
						else{
						//	alert("City not found!");
						}
					},
					function(err) {
					//	alert("City not found!");
					}, actions.GET_SR_SS_TIME, [ruleObj[sessionStore.LOCATION_INFO].latitude, ruleObj[sessionStore.LOCATION_INFO].longitude]
					);
					if (ruleObj.When.StartSRSS != undefined) ruleObj.When.onSRSS_Title = $("input[name=sensors_start_srss]:checked").closest(".srss_items").find(".more_li_text_div").html();
					if (ruleObj.When.EndSRSS != undefined) ruleObj.When.offSRSS_Title = $("input[name=sensors_end_srss]:checked").closest(".srss_items").find(".more_li_text_div").html();
				  }
				  wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,ruleObj);
				 // alert("Save :: "+JSON.stringify(ruleObj));

				  if (window.sessionStorage.getItem('edit_days')!=null && window.sessionStorage.getItem('edit_days')=='true'){
					  var wemo_rule_type=wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_TYPE);
					  if (wemo_rule_type=='sensor_rule'){
						  wemoUtil.loadUrl(filePath.SENSORS_RULE);
					  }else if (wemo_rule_type=='edit_sensor_rule'){
						  wemoUtil.loadUrl(filePath.EDIT_SENSORS_RULE);
					  }
				  }else{
					  window.sessionStorage.setItem('edit_days','false');
					  wemoUtil.loadPreviousUrl();
				  }

				 }

			  });

		},

		selectSRSS : function(ruleObj, navBar){
			if (ruleObj.When.StartSRSS == undefined && ruleObj.When.EndSRSS == undefined) {
				if (navBar == "startSRSS") {
					$("#startSunrise").prop("checked", true);
					ruleObj.When.StartSRSS = $("#startSunrise").attr("value");
					ruleObj.When.OnModeOffset = "0";
				} else {
					$("#endSunrise").prop("checked", true);
					ruleObj.When.EndSRSS = $("#endSunrise").attr("value");
					ruleObj.When.OffModeOffset = "0";
				}
			} else if (ruleObj.When.StartSRSS != undefined && ruleObj.When.EndSRSS == undefined) {
				if ( $(".endTime .srss").is(":visible") ) {
					$("input[name=sensors_start_srss]").each(function () {
						if ($(this).val() != ruleObj.When.StartSRSS) {
							ruleObj.When.EndSRSS = $(this).val();
							ruleObj.When.OffModeOffset = "0";
							$(".endTime #end"+ $(this).val() ).prop("checked", true);
						}
					});
				}
			} else if (ruleObj.When.StartSRSS == undefined && ruleObj.When.EndSRSS != undefined) {
				if ( $(".startTime .srss").is(":visible") ) {
					$("input[name=sensors_end_srss]").each(function () {
						if ($(this).val() != ruleObj.When.EndSRSS) {
							ruleObj.When.StartSRSS = $(this).val();
							ruleObj.When.OnModeOffset = "0";
							$(".startTime #start"+ $(this).val() ).prop("checked", true);
						}
					});
				}
			} else if (ruleObj.When.StartSRSS != undefined && ruleObj.When.EndSRSS != undefined) {
				if (navBar == "startSRSS") {
					$("input[name=sensors_end_srss]").each(function () {
						//if( $(this).is(':checked') ){
							var itemTitle = $(this).closest(".srss_items").find(".more_li_text_div");
							var subHeader = $(this).closest(".srss_items").find(".more_li_subHeader");
							var subHeaderTime =  $(this).closest(".srss_items").find(".more_li_subHeader .timeSRSS");
							var time = $(this).val() == wemo.items["SunRise"] ? when_countdown.timeSR_ : when_countdown.timeSS_;

							itemTitle.empty().html( $(this).val() );
							subHeader.find("span").removeClass("link_green").addClass("link_gray");
							subHeaderTime.empty().html( when_countdown.getSRSSsubHeaderWithOffset( time, "0" ) );
							ruleObj.When.OffModeOffset = "0";
						//}

						if ($(this).val() != ruleObj.When.StartSRSS) {
							ruleObj.When.EndSRSS = $(this).val();
							$(".endTime #end"+ $(this).val() ).prop("checked", true);
						}
					});
				} else {
					$("input[name=sensors_start_srss]").each(function () {
						//if( $(this).is(':checked') ){
							var itemTitle = $(this).closest(".srss_items").find(".more_li_text_div");
							var subHeader = $(this).closest(".srss_items").find(".more_li_subHeader");
							var subHeaderTime =  $(this).closest(".srss_items").find(".more_li_subHeader .timeSRSS");
							var time = $(this).val() == wemo.items["SunRise"] ? when_countdown.timeSR_ : when_countdown.timeSS_;

							itemTitle.empty().html( $(this).val() );
							subHeader.find("span").removeClass("link_green").addClass("link_gray");
							subHeaderTime.empty().html( when_countdown.getSRSSsubHeaderWithOffset( time, "0" ) );
							ruleObj.When.OnModeOffset = "0";
						//}

						if ($(this).val() != ruleObj.When.EndSRSS) {
							ruleObj.When.StartSRSS = $(this).val();
							$(".startTime #start"+ $(this).val() ).prop("checked", true);
						}
					});
				}
			}
			wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, ruleObj);
		},

		getLocationData : function(ruleObj){
			//alert("Location Data "+JSON.stringify(ruleObj));
			var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
			db.transaction(getLatLongFromDB, errorCB, getLatLongFromDB_SuccessCB);
			function getLatLongFromDB(tx){
				errorTracker = "getLatLongFromDB()";
	            tx.executeSql("SELECT * FROM LOCATIONINFO",[],
	            function(tx, results){
	            	console.log("tx:  "+tx+"  ::  results:  "+results);
					console.log("success - "+errorTracker+"  ::  "+results);
					var len = results.rows.length;
	            	var locationInfo = {};
					//console.log("locationAccessAllow_ClickHandeler", "len:  "+len);
		            if(len > 0){
		            	console.log("LOCATIONINFO - Records Len -   "+len);
		            	var ruleRows=[];
		            	for(var i=0;i<len;i++){
		            		ruleRows[i]=results.rows.item(i);
		            		console.log("LOCATIONINFO - Records    "
		            				+ruleRows[i].cityName+"  ::  "
		            				+ruleRows[i].countryName+"  ::  "
		            				+ruleRows[i].latitude+"  ::  "
		            				+ruleRows[i].longitude+"  ::  "
		            				+ruleRows[i].countryCode+"  ::  "
		            				+ruleRows[i].region+"  ::  "
		            				);
		            		locationInfo.cityName = ruleRows[0].cityName;
							locationInfo.countryName = ruleRows[0].countryName;
							locationInfo.latitude = ruleRows[0].latitude;
							locationInfo.longitude = ruleRows[0].longitude;
							locationInfo.countryCode = ruleRows[0].countryCode;
							locationInfo.region = ruleRows[0].region;
		            	}
		            	ruleObj[sessionStore.LOCATION_INFO] = locationInfo;
		            	wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, ruleObj);
		            }else{
		            	nativeUtilPlugin.execute(
		    					function(params) {
		    						console.log("LOCATIONINFO - not available in DB getting Lat/Long from Java!!!! "+params.length);
		    						if (params.length > 0) {
		    							$("#your_current_location").popup('open');
		    						}else{
		    							$("#enable_location_settings").popup('open');
		    						}
		    					},
		    					function(err) {
		    						//alert("Location service not found.");
		    						$("#toggleTS_startTime .time").trigger("tap");
                                    $("#toggleTS_endTime .time").trigger("tap");
		    					}, actions.GET_LOCATION_INFO, []
		    				);


		            }
	            }
	            , errorCB);
	        }
			function getLatLongFromDB_SuccessCB(success){
				 if (ruleObj.sunriseState=="1"){
					 var setLocation = wemo.items['youHaveSetTheLocation'];
						var setNewLocation = setLocation.split("%@");
							setNewLocation[0] += ruleObj.locationInfo.cityName;
						var setNewLocationContent =  setNewLocation.join("");
						$("#you_have_set_the_location").text(setNewLocationContent);
						/*--For Location Popup Ends--*/

						$("#you_set_the_location").popup('open');
						setTimeout(locationPopupClose,5000);
						ruleObj.sunriseState="0";
						wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, ruleObj);
				 }
				 when_countdown.showTimeTodaySRSS(ruleObj);
		    }
			function locationPopupClose(){
	            $("#you_set_the_location").popup('close');
	        }
		    function errorCB(error){
		    	console.log("Error - "+errorTracker+"  ::  "+error);
		        console.log("Error - "+errorTracker+"  ::  "+error.message);
		    }
		},

		update_end_time: function(s_start_time){
        	var n_time_meridian;
        	var g_time=s_start_time.split(/[:\s]+/);
        	var g_time_hr=Number(g_time[0]);
        	var g_time_min=Number(g_time[1]);
        	var g_time_meridian=g_time[2];
        	var n_time_hr=Number(g_time_hr)+1;

        	if (n_time_hr>12) n_time_hr=n_time_hr-12;
        	if (n_time_hr==12) g_time_meridian=(n_time_hr==12 && g_time_meridian=="am") ? "pm" : "am";
        	n_time_hr=(n_time_hr < 10 && n_time_hr >= 0) ? ('0' + n_time_hr) : n_time_hr;
        	g_time_min=(g_time_min < 10 && g_time_min >= 0) ? ('0' + g_time_min) : g_time_min;
        	return (n_time_hr+":"+g_time_min+" "+g_time_meridian);

        },

		bindEvents : function() {
			console.log(TAG + "bindEvents");
			document.addEventListener('online', when_countdown.onOnline, false);
			document.addEventListener('offline', when_countdown.onOffline, false);
			document.addEventListener("backbutton", when_countdown.onBackPress, false);
			document.addEventListener("pause", when_countdown.onPause, false);
			document.addEventListener("resume", when_countdown.onResume, false);
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
		},

		showTimeTodaySRSS: function(ruleObj) {
			if (ruleObj.When.StartSRSS != undefined || ruleObj.When.EndSRSS != undefined) {
				if (ruleObj.locationInfo != undefined) {
					nativeUtilPlugin.execute(
						function (params) {
							if (params.length > 0) {
								var tempData;
								var date=new Date();
								var today =	wemoUtil.returnDay( parseInt(date.getUTCDay()) + 1 );
								var day;
								$.each(params, function (index) {
									console.log("prop:  " + index + "  ::  value:  " + params[index]);
									tempData = params[index];
									tempData = tempData.split("|")[1];
									day = params[index].split("|")[0];
									if ( today == day ) {
										when_countdown.timeSR_ = tempData.split(":")[0];
										when_countdown.timeSS_ = tempData.split(":")[1];

										if(when_countdown.timeSS_ > timestamp.MAX_HOUR){
											$("#ss_span").empty().html(wemo.items["tomorrow"]);
											$("#ss_span_end").empty().html(wemo.items["tomorrow"]);
										}
										else{
											$("#ss_span").empty().html(wemo.items["today"]);
											$("#ss_span_end").empty().html(wemo.items["today"]);
										}

										$(".timeSR").empty().html( wemoUtil.convertMillisecondsToTF(when_countdown.timeSR_, UP_TF_IS24) );
										$(".timeSS").empty().html( wemoUtil.convertMillisecondsToTF(when_countdown.timeSS_, UP_TF_IS24) );
									}
								});
							}
							else
								alert("Location service not found.");
						},
						function (err) {
							alert("Location service not found.");
						}, actions.GET_SR_SS_TIME, [ruleObj[sessionStore.LOCATION_INFO].latitude, ruleObj[sessionStore.LOCATION_INFO].longitude]
					);
				}
			}
		},
		
		getSRSSsubHeaderWithOffset: function( timeSRSS, offset ) {
			offset = offset.toString(); 
			var sign = offset.substr(0, 1) == "-" ? wemo.items["Before"] : wemo.items["After"];
			if ( sign == wemo.items["Before"] ) offset = offset.substr(1);
			console.log("sign "+sign+" offset "+offset);
			switch ( sign ) {
				case wemo.items["Before"]: return wemoUtil.convertMillisecondsToTF( parseInt(timeSRSS, 10) - parseInt(offset, 10), UP_TF_IS24 ); break;
				case wemo.items["After"]: return wemoUtil.convertMillisecondsToTF( parseInt(timeSRSS, 10) + parseInt(offset, 10), UP_TF_IS24 ); break;
			}		
		},
		
		getSRSSheader: function( offset, action ) {
			offset = offset.toString(); 
			var sign = offset.substr(0, 1) == "-" ? wemo.items["Before"] : wemo.items["After"];
			if ( sign == wemo.items["Before"] ) offset = offset.substr(1);
			var time = wemoUtil.convertSecondsToHoursMins( parseInt(offset, 10) );
			var index = time.indexOf("ins");
			time = time.substr(0, index);
			return time + " " + sign + " "+action;
		},
		
		checkDivInDrawer: function ( drawer, offset) {
			drawer.find("div").removeClass("srss_offset_active");
			switch ( offset.toString() ) {
				case "-900" : drawer.find(".15b").addClass("srss_offset_active"); break;
				case "-1800" : drawer.find(".30b").addClass("srss_offset_active"); break;
				case "-2700" : drawer.find(".45b").addClass("srss_offset_active"); break;
				case "900" : drawer.find(".15a").addClass("srss_offset_active"); break;
				case "1800" : drawer.find(".30a").addClass("srss_offset_active"); break;
				case "2700" : drawer.find(".45a").addClass("srss_offset_active"); break;				
				default : drawer.find(".custom").addClass("srss_offset_active"); break;
			}
		},
		
		setOffsetFromPicker: function ( name_radio_btn, tab, val, ruleObj) {
			if ($('input[name='+name_radio_btn+']:checked').val() == wemo.items["SunRise"]) {
				var item = $('.'+tab).find(".sr");
				var head =wemo.items['SunRise'];
				var drawer = $('.'+tab).find(".sr_offset");
				var time = when_countdown.timeSR_;
			} else {
				var item = $('.'+tab).find(".ss");
				var head =wemo.items['SunSet'];
				var drawer = $('.'+tab).find(".ss_offset");
				var time = when_countdown.timeSS_;
			}
			
			if ( val == "cancel_custom_offset" ) {
				item.find(".more_li_text_div").empty().html( head );		
				
				switch (tab) {
					case wemo.items["TabStartTime"]: ruleObj.When.OnModeOffset = "0"; break;
					case wemo.items["TabEndTime"]: ruleObj.When.OffModeOffset = "0"; break;
				}
				
				drawer.find("div").removeClass("srss_offset_active");
				drawer.find(".exactly").addClass("srss_offset_active");
				item.find(".more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( time, UP_TF_IS24 ) );
				item.find(".more_li_subHeader span").removeClass("link_green").addClass("link_gray");
			} else {
				var regexp = /(\d+):(\d+) (.{6})/i;
				var timearr = regexp.exec(val);
				
				var offset = wemoUtil.convertTimeToMilliseconds("0"+timearr[1]+":"+timearr[2]);
				var offsetInHoursMins = wemoUtil.convertSecondsToHoursMins(offset);
				var index = offsetInHoursMins.indexOf("ins");
				offsetInHoursMins = offsetInHoursMins.substr(0, index);
				if (offset != "0" ) {
					if ( $.trim(timearr[3]) == "after") {
						//sessionOffset = offset;
						switch (tab) {
							case wemo.items["TabStartTime"]: ruleObj.When.OnModeOffset = offset; break;
							case wemo.items["TabEndTime"]: ruleObj.When.OffModeOffset = offset; break;
						}
						item.find(".more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( parseInt(time, 10)+offset, UP_TF_IS24) );
					} else {
						//sessionOffset = "-"+offset;
						switch (tab) {
							case wemo.items["TabStartTime"]: ruleObj.When.OnModeOffset = "-"+offset; break;
							case wemo.items["TabEndTime"]: ruleObj.When.OffModeOffset = "-"+offset; break;
						}
						item.find(".more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( parseInt(time, 10)-offset, UP_TF_IS24) );
					}
				} else {
					//sessionOffset = offset;
					switch (tab) {
						case wemo.items["TabStartTime"]: ruleObj.When.OnModeOffset = offset; break;
						case wemo.items["TabEndTime"]: ruleObj.When.OffModeOffset = offset; break;
					}
				}
				item.find(".more_li_text_div").empty().html(offsetInHoursMins+" "+$.trim(timearr[3])+" "+head);
				item.find(".more_li_subHeader span").removeClass("link_gray").addClass("link_green");
			}
		},
		
		getNumberOfSelectedDays : function () {
			var number = 0;
			$('#schedule div').each(function () {
				if ($(this).hasClass("div_bg_green")) number++;
			});
			return number;
		}

};
