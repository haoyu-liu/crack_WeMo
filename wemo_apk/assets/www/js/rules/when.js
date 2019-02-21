/*
 when.js

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

var TAG = "when.js: ";
var ruleObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
var UP_TF_IS24 = false;//UP-user preferences, TF-time format

$(document).bind('pageinit', function () {
    if (ruleObj.When.StartSRSS == undefined) {
        $("#tab_2").hide();
        $("#custom_offset_selector span").html(wemo.items["AroundSunRise"]);
    } else {
        if (ruleObj.When.StartSRSS == wemo.items["SunRise"]) {
            $("#custom_offset_selector span").html(wemo.items["AroundSunRise"]);
        } else {
            $("#custom_offset_selector span").html(wemo.items["AroundSunSet"]);
        }
    }
    when.initialize();
});

$(window).unload(function(){
	if(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW).RuleType == sessionStore.AWAY_MODE)
		window.sessionStorage.setItem(key.AWAY_MODE_EDIT, true);
});

var when = {

    initialize: function () {
        console.log(TAG + "initialize");
        $("#tab_1").hide();
        $("#tab_2").hide();
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    sunriseState: true,

    timeSR_: 0,
    timeSS_: 0,

    onDeviceReady: function () {
        console.log(TAG + "onDeviceReady");
        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
        UP_TF_IS24 = wemoUtil.userPreferences.getTimeFormat();
        wemoUtil.setTimeFormat();

        var height = $("#Mon").width();
        $("#schedule li div").css("height", height);
        var radius = (height / 2) + "px";
        $("#schedule li div").css("border-radius", radius);
        $("#schedule li div").css("-moz-border-radius", radius);
        $("#schedule li div").css("-ms-border-radius", radius);
        $("#schedule li div").css("-o-border-radius", radius);

        var width = $("#TTicker").width();
        var width_li = parseInt(width / 100 * 19, 10);

        var height_offset = width_li;
        $(".drawer_offset li div").css("height", height_offset);

        var radius_offset = (width_li / 2) + "px";
        $(".drawer_offset li div").css("border-radius", radius_offset);
        $(".drawer_offset li div").css("-moz-border-radius", radius_offset);
        $(".drawer_offset li div").css("-ms-border-radius", radius_offset);
        $(".drawer_offset li div").css("-o-border-radius", radius_offset);

        var height_drawer = Math.round(height_offset * 2 + 10) + "px";
        $(".drawer_offset").css("height", height_drawer);
        $("#sr_offset, #ss_offset").css("height", height_drawer);

        when.bindEvents();
        when.showTimeTodaySRSS(true);
        $('#TTicker .select_time').on('tap', function (e) {
                if ($('#start_time').val() == wemo.items['SunRise'] || $('#start_time').val() == wemo.items['SunSet']) {
                    $('#SRSS_picker').attr('style', 'display: table;');
                    $('.picker_container2').attr('style', 'display: table-cell;');
                    $(".picker_header span").empty().html(wemo.items['OnAt']);
                }
                else {
                    var prevTimeValue = $('#start_time').val().toUpperCase();
                    $("#time_selector").BelkinPicker({type: "time", curval: prevTimeValue , TF24: UP_TF_IS24}, "show", function (val) {
                            if (val == "cancel_time_changes") $('#start_time').val(prevTimeValue);
                            else $('#start_time').val(val.toLowerCase());
                            $("#time_selector").BelkinPicker({}, "hide");
                        }
                    );
                }

                e.preventDefault();
            }
        );
        // All initialization script goes here
        var sunriseState;
        console.log("printing the JSON***" + JSON.stringify(ruleObj));

        var arrDays = ruleObj.SelectedDayOrRange.split("-");

        $('#schedule div').each(function (i, elem) {
            $(this).removeClass("div_bg_green div_bg_white").addClass("div_bg_white")
        });

        for (var i = 0; i < arrDays.length; i++) {
            console.log("arrDays " + arrDays[i]);
            $('div [id="' + arrDays[i] + '"]').removeClass("div_bg_white").addClass("div_bg_green");
        }


        //SET LABELS start//
        var label = when.createLabel_on_off_start(ruleObj);
        console.log("Label****" + label);

        var more_li_text_div = "";
        switch (label) {
            case wemo.items["Start"]:
                more_li_text_div = wemo.items["StartAt"];
                break;
            case wemo.items["On"]:
                more_li_text_div = wemo.items["OnAt"];
                break;
            case wemo.items["Off"]:
                more_li_text_div = wemo.items["OffAt"];
                break;
        }
        $(".label").empty().html(label);
        $("#tab_1 .more_li_text_div").empty().html(more_li_text_div);
        //SET LABELS end//

        //alert(JSON.stringify(ruleObj));

        //-------------------SRSS--------------------

        /**************** Sunrise / Sunset for Start time ******************/

        if (ruleObj.When.StartSRSS != undefined) {
            /*$("#navbar ul li").each(function() {
             var tabID=$(this).children("a").attr("data-tab-class");
             var selectedWhen=$(this).children("a").attr("data-when");
             if (selectedWhen=='sun'){
             $(this).children("a").addClass("ui-btn-active");
             $("."+tabID).show();
             }else{
             $(this).children("a").removeClass("ui-btn-active");
             $("."+tabID).hide();
             }
             });*/

            $("#toggleTS_startTime div").removeClass("active clock_not_active sun_not_active"); //attr class erased
            $("#toggleTS_startTime div").children().removeClass("time_active sun_active clock_not_active sun_not_active"); //attr class erased
            $("#toggleTS_startTime .sun").addClass("active");
            $("#toggleTS_startTime .time").addClass("clock_not_active");
            $("#toggleTS_startTime .sun").children().addClass("sun_active");
			$("#tab_2").show();
			
			if ( ruleObj.When.StartSRSS == wemo.items["SunRise"] ) {
				$('#Sunrise').prop('checked', true);
				var item = $("#tab_2 .sr");
				var head =wemo.items['SunRise'];
				var time = when.timeSR_;
			} else {
				$('#Sunset').prop('checked', true);
				var item = $("#tab_2 .ss");
				var head =wemo.items['SunSet'];
				var time = when.timeSS_;
			}
			
			if ( ruleObj.When.StartSRSSoffset == undefined ) {
				 ruleObj.When.StartSRSSoffset = "0";
			}	
			
																

			$(".drawer_offset div").removeClass("srss_offset_active");
			switch ( ruleObj.When.StartSRSSoffset.toString() ) {
				case "0" : $(".drawer_offset .exactly").addClass("srss_offset_active"); break;
				case "-900" : 
					$(".drawer_offset .15b").addClass("srss_offset_active");
					item.find(".more_li_text_div").empty().html(wemo.items["FifteenMins"]+" "+ wemo.items["Before"]+" " + head); 
					item.find(".more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( parseInt( time, 10) - 900, UP_TF_IS24 ) );
					console.log("enterin in sasa"+$(".timeSRSS").html());
					break;
				case "-1800" :
					$(".drawer_offset .30b").addClass("srss_offset_active");
					item.find(".more_li_text_div").empty().html(wemo.items["ThirtyMins"]+" "+ wemo.items["Before"]+" " +head); 
					item.find(".more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( parseInt( time, 10) - 1800, UP_TF_IS24 ) );
					break;
				case "-2700" : 
					$(".drawer_offset .45b").addClass("srss_offset_active");
					item.find(".more_li_text_div").empty().html(wemo.items["FortyFiveMins"]+" "+ wemo.items["Before"]+" " +head); 
					item.find(".more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( parseInt( time, 10) - 2700, UP_TF_IS24 ) );
					break;
				case "900" : 
					$(".drawer_offset .15a").addClass("srss_offset_active");
					item.find(".more_li_text_div").empty().html(wemo.items["FifteenMins"]+" "+ wemo.items["After"]+" " +head);
					item.find(".more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( parseInt( time, 10) + 900, UP_TF_IS24 ) );
					break;
				case "1800" :
					$(".drawer_offset .30a").addClass("srss_offset_active");
					item.find(".more_li_text_div").empty().html(wemo.items["ThirtyMins"]+" "+ wemo.items["After"]+" " +head); 
					item.find(".more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( parseInt( time, 10) + 1800, UP_TF_IS24 ) );
					break;
				case "2700" : 
					$(".drawer_offset .45a").addClass("srss_offset_active");
					item.find(".more_li_text_div").empty().html(wemo.items["FortyFiveMins"]+" "+ wemo.items["After"]+" " +head); 
					item.find(".more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( parseInt( time, 10) + 2700, UP_TF_IS24 ) );
					break;
				default : { 
					var StartSRSSoffset = ruleObj.When.StartSRSSoffset.toString();
					$(".drawer_offset .custom").addClass("srss_offset_active"); 
					if ( StartSRSSoffset.substr(0, 1) != "-" ) {
						var sign = wemo.items["After"];
						var offset = StartSRSSoffset;
						var finalTime = parseInt( time, 10) + parseInt( offset, 10);
						item.find(".more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( finalTime , UP_TF_IS24 ) );
					} else {
						var sign = wemo.items["Before"];
						var offset = StartSRSSoffset.substr( 1, StartSRSSoffset.length - 1);
						var finalTime = parseInt( time, 10) - parseInt( offset, 10);
						item.find(".more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( finalTime , UP_TF_IS24 ) );
					}
					var offsetInHoursMins = wemoUtil.convertSecondsToHoursMins(offset);
					var index = offsetInHoursMins.indexOf("ins");
					offsetInHoursMins = offsetInHoursMins.substr(0, index);
					item.find(".more_li_text_div").empty().html(offsetInHoursMins+" "+sign+" "+head);
					break; }
			}
			if ( ruleObj.When.StartSRSSoffset.toString() == "0" ) {
				item.find(".more_li_subHeader span").removeClass("link_green").addClass("link_gray");
			} else {
				item.find(".more_li_subHeader span").removeClass("link_gray").addClass("link_green");
			}
        } else {
            $("#tab_1").show();
            $('#start_time').prop("value", wemoUtil.convertMillisecondsToTF(ruleObj.When.StartTime, UP_TF_IS24));
			console.log('Michael.Nivas');
			//$('#Sunrise').prop('checked', true);
            $('#Sunset').prop('checked', true);
        }

        //To return back to home page: device list tab
        $(".wemo_logo").on("tap", function (e) {
            if (e.target.nodeName != "IMG") {
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }
        });

        /**************** Open Sunrise / Sunset  for Start time ******************/
        /*
         $("#navbar ul li").on("click",function() {
         //var selectedWhen="time";
         $("#navbar ul li").each(function() {
         var tabID=$(this).children("a").attr("data-tab-class");
         var selectedWhen=$(this).children("a").attr("data-when");
         if ($(this).children("a").hasClass("ui-btn-active")){
         $("."+tabID).show();
         //alert("tabID :: "+tabID)
         if (tabID=="sun"){
         when.selectSRSS(ruleObj,tabID);
         when.getLocationData(ruleObj);
         }else{
         delete ruleObj.When.StartSRSS;
         ruleObj.sunriseState="0";
         ruleObj.When.StartTime=wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestHalfHour());
         $('#start_time').val(wemoUtil.convertMillisecondsToAMPM(ruleObj.When.StartTime));
         //alert(JSON.stringify(ruleObj));
         }
         }else{
         $("."+tabID).hide();
         }
         });
         wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,ruleObj);
         });*/

        $("#toggleTS_startTime div").on("tap", function () {

				var tabID = $(this).attr("data-tab-class");

	            if (!$(this).hasClass("active")) {
	                $("#toggleTS_startTime div").removeClass("active clock_not_active sun_not_active"); //attr class erased
	                $("#toggleTS_startTime div").children().removeClass("time_active sun_active clock_not_active sun_not_active"); //attr class erased
	                $(this).addClass("active");

	                if ($(this).hasClass("time")) {
	                    $("#toggleTS_startTime .sun").addClass("sun_not_active");
	                    $(this).children().addClass("time_active");
	                } else {
	                    $("#toggleTS_startTime .time").addClass("clock_not_active");
	                    $(this).children().addClass("sun_active");
	                }

	                $("." + tabID).show();

	                if (tabID == "startSRSS") {
	                    $("#tab_1").hide();
						$("#tab_2").show();
						
						ruleObj.When.StartSRSS = $('input[name=rad_srs]:checked').val();
						setTimeout(function () {
							when.selectSRSS(ruleObj);
							when.getLocationData(ruleObj);
						}, 600);
	                } else {
	                    if ($(".drawer_offset").is(":visible")) {
							$(".drawer_offset").hide();
						}
	                    delete ruleObj.When.StartSRSS;
						delete ruleObj.When.StartSRSSoffset;
						delete ruleObj.When.SRSS_Title;
						when.timeSR_ = 0;
						when.timeSS_ = 0;
	                    ruleObj.sunriseState = "0";
						$(".drawer_offset").find("div").removeClass("srss_offset_active");
						$(".drawer_offset").find(".exactly").addClass("srss_offset_active");
						$(".timeSR").empty();
						$(".timeSS").empty(); 
						
						$("#tab_2 .sr, #tab_2 .ss").find(".more_li_subHeader span").removeClass("link_green").addClass("link_gray");
						$("#tab_2 .sr").find(".more_li_text_div").empty().html(wemo.items['SunRise']);
						$("#tab_2 .ss").find(".more_li_text_div").empty().html(wemo.items['SunSet']);
						
						$("#tab_1").show();
						$("#tab_2").hide();
	                    ruleObj.When.StartTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestHalfHour());
	                    $('#start_time').val(wemoUtil.convertMillisecondsToTF(ruleObj.When.StartTime, UP_TF_IS24));
	                }
	            }
	            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, ruleObj);
            
        });

        /****************  Sunrise / Sunset Selection  for Start time ******************/

        $("input[name='simple_sunrise_method']").on('click', function () {
            $("input[name=simple_sunrise_method]:checked").each(function () {
                ruleObj.When.StartSRSS = $(this).val();
                wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, ruleObj);
            });
        });


        /**************** Open Days page and Store current values of Time / SRSS status ******************/

        $("#when_edit_days").on("tap", function () {

            if (ruleObj.When.startSRSS == undefined) {
                ruleObj.When.StartTime = wemoUtil.convertTimeToMilliseconds($('#start_time').val());
            }
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, ruleObj);
            //window.sessionStorage.setItem('edit_days','true');
            wemoUtil.loadUrl(filePath.EDIT_DAYS);
        });


        $("#schedule div").on("tap", function () {
            if ($(this).hasClass("div_bg_green") && ( when.getNumberOfSelectedDays() != 1 ) ) {
                $(this).removeClass("div_bg_green").addClass("div_bg_white");
            } else {
                $(this).removeClass("div_bg_white").addClass("div_bg_green");
            }
        });
		
		$("#sr_offset div, #ss_offset div").on("tap", function (e) {

			$(this).closest(".drawer_offset").find("div").removeClass("srss_offset_active");
			$(this).addClass("srss_offset_active");    
			$(this).closest(".drawer_offset").slideToggle("slow");			
						
			if ( !$(this).hasClass("custom") ) {
				var sr_or_ss = $(this).closest("ul").attr("id");
				if ( sr_or_ss == "sr_offset" ) {
					var item = $("#tab_2 .sr");
					var head = wemo.items['SunRise'];
					var time = when.timeSR_;
				} else {
					var item = $("#tab_2 .ss");
					var head =wemo.items['SunSet'];
					var time = when.timeSS_;
				}
				ruleObj.When.StartSRSSoffset = $(this).attr("value");
				if ( !$(this).hasClass("exactly") ) {
					switch ( ruleObj.When.StartSRSSoffset ) {
						case "-900" : 
							{
							item.find(".more_li_text_div").empty().html("15m before "+head);
							item.find(".more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( parseInt(time, 10)-900, UP_TF_IS24) );
							break;}
						case "-1800" : 
							{
							item.find(".more_li_text_div").empty().html("30m before "+head); 
							item.find(".more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( parseInt(time, 10)-1800, UP_TF_IS24) );
							break;}
						case "-2700" : 
							{
							item.find(".more_li_text_div").empty().html("45m before "+head); 
							item.find(".more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( parseInt(time, 10)-2700, UP_TF_IS24) );
							break;}
						case "900" : 
							{
							item.find(".more_li_text_div").empty().html("15m after "+head);
							item.find(".more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( parseInt(time, 10)+900, UP_TF_IS24) );
							break;}
						case "1800" : 
							{
							item.find(".more_li_text_div").empty().html("30m after "+head); 
							item.find(".more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( parseInt(time, 10)+1800, UP_TF_IS24) );
							break;}
						case "2700" : 
							{
							item.find(".more_li_text_div").empty().html("45m after "+head);
							item.find(".more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( parseInt(time, 10)+2700, UP_TF_IS24) );
							break;}
					}
					item.find(".more_li_subHeader span").removeClass("link_gray").addClass("link_green");
				} else {
					item.find(".more_li_text_div").empty().html( head );
					item.find(".more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( time, UP_TF_IS24 ) );
					item.find(".more_li_subHeader span").removeClass("link_green").addClass("link_gray");
					ruleObj.When.StartSRSSoffset = "0";
				}
			} else {
				
				$("#custom_offset_selector").BelkinPicker({type: "offset", curval: "00:20 before"}, "show", function (val) {					
					if ($('input[name=rad_srs]:checked').val() == "Sunrise") {
						var item = $("#tab_2 .sr");
						var head =wemo.items['SunRise'];
						var drawer = $("#sr_offset");
						var time = when.timeSR_;
					} else {
						var item = $("#tab_2 .ss");
						var head =wemo.items['SunSet'];
						var drawer = $("#ss_offset");
						var time = when.timeSS_;
					}
					console.log("time----------"+time);
					
					if ( val == "cancel_custom_offset" ) {
						item.find(".more_li_text_div").empty().html( head );
						ruleObj.When.StartSRSSoffset = "0";
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
								console.log("after offset "+offset);
								ruleObj.When.StartSRSSoffset = offset;
								item.find(".more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( parseInt(time, 10)+offset, UP_TF_IS24 ) );
							} else {
								console.log("before offset "+offset);
								ruleObj.When.StartSRSSoffset = "-"+offset;
								item.find(".more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( parseInt(time, 10)-offset, UP_TF_IS24) );
							}
						} else {
							ruleObj.When.StartSRSSoffset = offset;
						}
						item.find(".more_li_text_div").empty().html(offsetInHoursMins+" "+$.trim(timearr[3])+" "+head);
						item.find(".more_li_subHeader span").removeClass("link_gray").addClass("link_green");
					}
					$("#custom_offset_selector").BelkinPicker({}, "hide");
				}				
				);	
				
			}
            e.preventDefault();
            e.stopPropagation();
        });
		
		$("#tab_2 .srss_items .more_li_text_div, #tab_2 .srss_items .more_li_subHeader").on("tap", function () {            
			var input = $(this).parent().find("input");
			if ( input.prop("checked") == true ) {
				if ( $(this).parent().hasClass("sr") ) {
					$("#sr_offset").parent().slideToggle("slow"); 
				} else {
					$("#ss_offset").parent().slideToggle("slow"); 
				}
			}
        });
		
		$('#tab_2').find('#Sunrise, #Sunset').on('click', function(){  
				
			ruleObj.When.StartSRSS = $('input[name=rad_srs]:checked').val();
			console.log("ruleObj.When.StartSRSS "+ruleObj.When.StartSRSS);
			ruleObj.When.StartSRSSoffset = "0";
			
			if ( ruleObj.When.StartSRSS == wemo.items["SunRise"] ) {
				$('#Sunrise').prop('checked', true);				
				
				$("#tab_2 .ss .more_li_text_div").empty().html(wemo.items['SunSet']);
				$("#sr_offset div").removeClass("srss_offset_active");
				$("#sr_offset .exactly").addClass("srss_offset_active");
				$("#tab_2 .ss .more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( when.timeSS_ , UP_TF_IS24));
				$("#tab_2 .ss .more_li_subHeader span").removeClass("link_green").addClass("link_gray");
				$("#custom_offset_selector span").html(wemo.items["AroundSunRise"]);
			} else {
				$('#Sunset').prop('checked', true);
				
				$("#tab_2 .sr .more_li_text_div").empty().html(wemo.items['SunRise']);
				$("#ss_offset div").removeClass("srss_offset_active");
				$("#ss_offset .exactly").addClass("srss_offset_active");
				$("#tab_2 .sr .more_li_subHeader").find(".timeSRSS").empty().html( wemoUtil.convertMillisecondsToTF( when.timeSR_, UP_TF_IS24 ));
				$("#tab_2 .sr .more_li_subHeader span").removeClass("link_green").addClass("link_gray");
				$("#custom_offset_selector span").html(wemo.items["AroundSunSet"]);
			}	

			if ($(".drawer_offset").is(":visible")) {
				$(".drawer_offset").slideToggle("slow"); 
			}		
		}); 

        $("#your_current_location_ok_btn").on("tap", function () {
        	var ruleObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
            var locationInfo = {};
            nativeUtilPlugin.execute(
                function (params) {
                    if (params.length > 0) {
                    	locationInfo = {cityName : params[0], countryName: params[1], latitude: params[2], longitude: params[3], countryCode: params[4], region: params[5]};
						ruleObj[sessionStore.LOCATION_INFO] = locationInfo;
						ruleObj.sunriseState="1";
						wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, ruleObj);
						setTimeout(function(){
							wemoUtil.loadUrl(filePath.MORE_SETTING_LOCATION);
						}, timeout.CONTROL_POINT_DELAY);
                    } else {

                        alert("Location service not found.");
                    }
                },
                function (err) {
                    alert("Location service not found.");
                }, actions.GET_LOCATION_INFO, []
            );

            $("#your_current_location").popup('close');
        });

        $("#your_current_location_dont_allow").on("tap", function (e) {
            $("#your_current_location").popup('close');

            $("#toggleTS_startTime .time").trigger("tap");

            var ruleObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
            var locationInfo = {};
            delete ruleObj.locationInfo;
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, ruleObj);

            e.preventDefault();
        });
        //-------------------SRSS--------------------

        $("#when_save_btn").on('tap', function () {
            nativeUtilPlugin.execute(null, null, actions.SHOW_SPLASH_ON_LOADING, []);
            var individualDays = "";
			$('#schedule div').each(function (i, elem) {
				if ($(this).hasClass("div_bg_green")) {
					individualDays += $(this).attr("id") + "-";
				}
			});
			individualDays = individualDays.substr(0, individualDays.lastIndexOf("-"));
			if ( individualDays == "" ) {
				alert( wemo.items['SelectAtLeastOneDay_AlertMessage'] );
			} else {
				ruleObj.SelectedDayOrRange = individualDays;
			
				var wemo_rule_type = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_TYPE);
				if (wemo_rule_type == null) wemo_rule_type = ruleObj.RuleType;
				
					
				
				//-------------------SRSS--------------------
				// Check the Selected Time or Sunrise/Sunset and Set
				if (ruleObj.When.StartSRSS != undefined) {
					if (ruleObj.locationInfo != undefined) {
						if ( ruleObj.When.StartSRSSoffset == undefined ) ruleObj.When.StartSRSSoffset = 0;
						nativeUtilPlugin.execute(
							function (params) {
								//alert("nativeUtilPlugin.execute() - params - "+params.length);
								if (params.length > 0) {
									var day = "";
									var tempData;
									var timeSR = 0;
									var timeSS = 0;
									var arrSelectedDays;
									var matchCounter = 0;
									var SRSSSelectedDays = {};

									console.log("#####################: " + ruleObj.SelectedDayOrRange + " :###################");
									$.each(params, function (index) {
										console.log("prop:  " + index + "  ::  value:  " + params[index]);
										if (ruleObj.SelectedDayOrRange === sessionStore.DAILY || ruleObj.SelectedDayOrRange === sessionStore.WEEK_DAYS || ruleObj.SelectedDayOrRange === sessionStore.WEEK_END) {
											console.log("SelectedDayOrRange:  " + ruleObj.SelectedDayOrRange);
											console.log("Current Day:");
											tempData = params[index];
											day = tempData.split("|")[0];
											tempData = tempData.split("|")[1];
											timeSR = tempData.split(":")[0];
											timeSS = tempData.split(":")[1];
											console.log("prop:  Day:  " + day + "  ::  timeSR:  " + timeSR + "  ::  timeSS:  " + timeSS+" ruleObj.When.StartSRSSoffset "+parseInt(ruleObj.When.StartSRSSoffset));
											if (ruleObj.When.StartSRSS === "Sunrise") {
												ruleObj.When.StartTime = parseInt(timeSR) + 1;
											} else if (ruleObj.When.StartSRSS === "Sunset") {
												ruleObj.When.StartTime = parseInt(timeSS) + 2;
											}
											ruleObj.When.RuleDuration = 0;										
											return false;
										} else {
											console.log("SelectedDayOrRange:  " + ruleObj.SelectedDayOrRange);

											tempData = params[index];
											day = tempData.split("|")[0];

											arrSelectedDays = ruleObj.SelectedDayOrRange.split("-");

											console.log("arrSelectedDays:  " + arrSelectedDays);
                                            for (var days1 = 0; days1 < arrSelectedDays.length; days1++) {
                                                console.log("arrSelectedDays: ##### " + day + "  ::  " + arrSelectedDays[days1] + " ruleObj.When.StartSRSSoffset " + parseInt(ruleObj.When.StartSRSSoffset));
                                                if (day === arrSelectedDays[days1]) {
                                                    tempData = tempData.split("|")[1];
                                                    timeSR = tempData.split(":")[0];
                                                    timeSS = tempData.split(":")[1];
                                                    if (ruleObj.When.StartSRSS === "Sunrise") {
                                                        ruleObj.When.StartTime = parseInt(timeSR) + 1;
                                                    } else if (ruleObj.When.StartSRSS === "Sunset") {
                                                        ruleObj.When.StartTime = parseInt(timeSS) + +2;
                                                    }

                                                    var iDay = wemoUtil.deCodeDays(day);

                                                    SRSSSelectedDays[iDay] = {};
                                                    SRSSSelectedDays[iDay].day = iDay;

                                                    if (ruleObj.When.StartSRSS == "Sunrise") {
                                                        SRSSSelectedDays[iDay].timeSR = parseInt(timeSR) + parseInt(ruleObj.When.StartSRSSoffset) + 1;
                                                        ruleObj.When.StartTime = parseInt(timeSR) + parseInt(ruleObj.When.StartSRSSoffset) + 1;
                                                    } else if (ruleObj.When.StartSRSS == "Sunset") {
                                                        SRSSSelectedDays[iDay].timeSS = parseInt(timeSS) + parseInt(ruleObj.When.StartSRSSoffset) + 2;
                                                        ruleObj.When.StartTime = parseInt(timeSS) + parseInt(ruleObj.When.StartSRSSoffset) + 2;
                                                    }

                                                    matchCounter++;
                                                    console.log("prop:  Day:  " + day + "  ::  timeSR:  " + timeSR + "  ::  timeSS:  " + timeSS);

                                                }
												console.log("##########  " + matchCounter + " == " + arrSelectedDays.length);
												if (matchCounter == arrSelectedDays.length) {
													console.log("##########Added############");
													ruleObj[sessionStore.SRSS_SELECTED_DAYS] = SRSSSelectedDays;
													wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, ruleObj);
													return false;
												}
												wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, ruleObj);
											}
											ruleObj.When.RuleDuration = 0;
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
					ruleObj.When.SRSS_Title = $("input[name=rad_srs]:checked").closest(".srss_items").find(".more_li_text_div").html();
				}
				//-------------------SRSS--------------------
				else {
					var start_time = $("#start_time").val();
					ruleObj.When.StartTime = wemoUtil.convertTimeToMilliseconds($('#start_time').val());
					ruleObj.When.StartSRSS = undefined;
				}

                //Set current values in Session
                wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, ruleObj);
                console.log("wemo_rule_type " + wemo_rule_type);
                if (wemo_rule_type == 'simple_rule') {
                    wemoUtil.loadUrl(filePath.NEW_RULE);
                } else if (wemo_rule_type == 'edit_simple_rule') {
                    wemoUtil.loadUrl(filePath.EDIT_SIMPLE_RULE);
            	} else if (wemo_rule_type == 'notify_power_sensing_rule' || wemo_rule_type == 'Notify Me' || wemo_rule_type == sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE) {
                    if(wemo_rule_type == 'Notify Me')
                    window.sessionStorage.setItem(sessionStore.GCM_SENSOR, "1");
                    else if(wemo_rule_type == sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE){
                    	window.sessionStorage.setItem(sessionStore.GCM_MAKER_SENSOR, "1");
                    }
                    wemoUtil.loadUrl(filePath.NOTIFY_RULE);
                } else if ((wemo_rule_type == 'timer_rule') || (wemo_rule_type == 'Simple Switch') || (wemo_rule_type == 'Time Interval')) {
                    wemoUtil.loadUrl(filePath.TIMER_RULE);
                }

            }
        });

        ruleObj.When.RuleDuration = "0";

        if (window.sessionStorage.getItem(sessionStore.RULES_DATA) != "null") {

            var tempSelectedDayOrRange = "";

            if (ruleObj.SelectedDayOrRange == "Weekday" || ruleObj.SelectedDayOrRange == "Weekend" || ruleObj.SelectedDayOrRange == "Daily") {
                if (ruleObj.SelectedDayOrRange == "Weekday") {
                    tempSelectedDayOrRange = wemo.items['WeekdaysNoDetails'];
                }
                else if (ruleObj.SelectedDayOrRange == "Weekend") {
                    tempSelectedDayOrRange = wemo.items['WeekendsNoDetails'];
                }
                else {
                    tempSelectedDayOrRange = wemo.items[ruleObj.SelectedDayOrRange];
                }
            }
            else if (ruleObj.SelectedDayOrRange == "Weekdays" || ruleObj.SelectedDayOrRange == "Weekends" || ruleObj.SelectedDayOrRange == "Daily") {
                if (ruleObj.SelectedDayOrRange == "Weekdays") {
                    tempSelectedDayOrRange = wemo.items['WeekdaysNoDetails'];
                }
                else if (ruleObj.SelectedDayOrRange == "Weekends") {
                    tempSelectedDayOrRange = wemo.items['WeekendsNoDetails'];
                }
                else {
                    tempSelectedDayOrRange = wemo.items[ruleObj.SelectedDayOrRange];
                }
            }
            else {

                var selectedDayOrRange = ruleObj.SelectedDayOrRange;
                var arrSelectDays = selectedDayOrRange.split("-");
                var displaySelectedVal = [];

                if (arrSelectDays.length > 0) {
                    for (var i = 0; i < arrSelectDays.length; i++) {

                        var temp = arrSelectDays[i];
                        console.log("temp val " + temp);

                        if (temp == "Mon") {
                            displaySelectedVal[i] = wemo.items['MondayShort'];
                        }
                        if (temp == "Tue") {
                            displaySelectedVal[i] = wemo.items['TuesdayShort'];
                        }
                        if (temp == "Wed") {
                            displaySelectedVal[i] = wemo.items['WednesdayShort'];
                        }
                        if (temp == "Thu") {
                            displaySelectedVal[i] = wemo.items['ThursdayShort'];
                        }
                        if (temp == "Fri") {
                            displaySelectedVal[i] = wemo.items['FridayShort'];
                        }
                        if (temp == "Sat") {
                            displaySelectedVal[i] = wemo.items['SaturdayShort'];
                        }
                        if (temp == "Sun") {
                            displaySelectedVal[i] = wemo.items['SundayShort'];
                        }
                        console.log("transforming value " + displaySelectedVal[i]);
                    }

                    if (arrSelectDays.length == 1) {
                        tempSelectedDayOrRange = displaySelectedVal;
                    }
                    else {
                        tempSelectedDayOrRange = displaySelectedVal.join("-");
                    }

                }
            }

            $("#day_range").html(tempSelectedDayOrRange);
        }
    },

    selectSRSS: function (ruleObj) {
       if (ruleObj.When.StartSRSS == undefined) {
            ruleObj.When.StartSRSS = $('input[name=rad_srs]:checked').val();
        }

        wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, ruleObj);
    },

    updateOffsetValue: function(item, time)
    {
        time = parseInt(time);

        if ((time + parseInt(ruleObj.When.StartSRSSoffset)) > timestamp.MAX_HOUR) {
            ruleObj.When.StartTime = timestamp.MAX_HOUR;
            item.find(".more_li_subHeader").find(".timeSRSS").empty().html(wemoUtil.convertMillisecondsToTF(timestamp.MAX_HOUR, UP_TF_IS24));
        }
        else if ((time + parseInt(ruleObj.When.StartSRSSoffset)) < timestamp.MIN_TIME) {
            ruleObj.When.StartTime = timestamp.MIN_TIME;
            item.find(".more_li_subHeader").find(".timeSRSS").empty().html(wemoUtil.convertMillisecondsToTF(timestamp.MIN_TIME, UP_TF_IS24));
        }
    },

    getLocationData: function (ruleObj) {
        var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
        db.transaction(getLatLongFromDB, errorCB, getLatLongFromDB_SuccessCB);
        function getLatLongFromDB(tx) {
            errorTracker = "getLatLongFromDB()";
            tx.executeSql("SELECT * FROM LOCATIONINFO", [],
                function (tx, results) {
                    console.log("tx:  " + tx + "  ::  results:  " + results);
                    console.log("success - " + errorTracker + "  ::  " + results);
                    var len = results.rows.length;
                    var locationInfo = {};
                    if (len > 0) {
                        console.log("LOCATIONINFO - Records Len -   " + len);
                        var ruleRows = [];
                        for (var i = 0; i < len; i++) {
                            ruleRows[i] = results.rows.item(i);
                            console.log("LOCATIONINFO - Records    "
                                + ruleRows[i].cityName + "  ::  "
                                + ruleRows[i].countryName + "  ::  "
                                + ruleRows[i].latitude + "  ::  "
                                + ruleRows[i].longitude + "  ::  "
                                + ruleRows[i].countryCode + "  ::  "
                                + ruleRows[i].region + "  ::  "
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
                    } else {
                        nativeUtilPlugin.execute(
                            function (params) {
                                console.log("LOCATIONINFO - not available in DB getting Lat/Long from Java!!!! " + params.length);
                                if (params.length > 0) {
                                    $("#your_current_location").popup('open');
                                } else {
                                    $("#enable_location_settings").popup('open');
                                }
                            },
                            function (err) {
                                //alert("Location service not found.");
                                 $("#toggleTS_startTime .time").trigger("tap");
                            }, actions.GET_LOCATION_INFO, []
                        );


                    }
                }
                , errorCB);
        }

        function getLatLongFromDB_SuccessCB(success) {
            //alert(ruleObj.sunriseState);
            if (ruleObj.sunriseState == "1") {
                var setLocation = wemo.items['youHaveSetTheLocation'];
                var setNewLocation = setLocation.split("%@");
                setNewLocation[0] += ruleObj.locationInfo.cityName;
                var setNewLocationContent = setNewLocation.join("");
                $("#you_have_set_the_location").text(setNewLocationContent);
                /*--For Location Popup Ends--*/

                $("#you_set_the_location").popup('open');
                setTimeout(locationPopupClose, 3000);
                ruleObj.sunriseState = "0";
                wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, ruleObj);
            }
            console.log('Successfully - getLatLongFromDB_SuccessCB ' + success);
            when.showTimeTodaySRSS(true);
        }

        function locationPopupClose() {
            $("#you_set_the_location").popup('close');
        }

        function errorCB(error) {
            console.log("Error - " + errorTracker + "  ::  " + error);
            console.log("Error - " + errorTracker + "  ::  " + error.message);
        }

        $("#enable_location_ok").on('click', function () {
        	try{
            $("#enable_location_settings").popup('close');
            wemoUtil.loadUrl(filePath.MORE_SETTING_LOCATION);
            //window.location.href = filePath.MORE_SETTING_LOCATION;
        	}catch(e){
        		console.log(e.message);
        	}
        });

        $("#enable_location_cancel").on('pointerdown', function () {
            $("#enable_location_settings").popup('close');
        });
    },


    //-------------------SRSS--------------------
    bindEvents: function () {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', when.onOnline, false);
        document.addEventListener('offline', when.onOffline, false);
        document.addEventListener("backbutton", when.onBackPress, false);
        document.addEventListener("pause", when.onPause, false);
        document.addEventListener("resume", when.onResume, false);
    },

    onOffline: function () {
        console.log(TAG + "offLine");
    },

    onOnline: function () {
        console.log(TAG + "onLine");
    },

    onBackPress: function () {
        if ($(".more_tab").is(":visible")) {
            $(".more_tab").hide();
            $('body').find('.modalWindow').transition({opacity: 0}, 400, function () {
                $(this).removeClass('isOpen');
            });
        }
        else {
            console.log(TAG + "onBackPress");
            var ruleObj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
            if (ruleObj.SelectedDayOrRange == undefined) {
                ruleObj.SelectedDayOrRange = sessionStore.DAILY;
            }
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, ruleObj);
            wemoUtil.loadPreviousUrl();
        }
    },

    onPause: function () {
        console.log(TAG + "onPause");
    },

    onResume: function () {
        console.log(TAG + "onResume");
    },

    reportError: function (e) {
        console.log(TAG + "Plugin Error!!!!   " + e);
    },

    createLabel_on_off_start: function (ruleObj) {
        var flag_on = 0;
        var flag_off = 0;

        for (key in ruleObj.Devices) {
            switch (ruleObj.Devices[key].StartAction) {
                case 0:
                    flag_off++;
                    break;
                case 1:
                    flag_on++;
                    break;
            }
        }

        if ((flag_on == 0 && flag_off == 0) || (flag_on > 0 && flag_off > 0)) {
            return wemo.items["Start"];
        }
        else if (flag_on > 0 && flag_off == 0) {
            return wemo.items["On"];
        }
        else if (flag_on == 0 && flag_off > 0) {
            return wemo.items["Off"];
        }
    },
	
	showTimeTodaySRSS: function(flag) {
		if (ruleObj.When.StartSRSS != undefined) {	
			if (ruleObj.locationInfo != undefined) {
				nativeUtilPlugin.execute(
					function (params) {
						
						console.log(" param sunrise/sunset"+params);
						
						//alert("nativeUtilPlugin.execute() - params - "+params.length);
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
									when.timeSR_ = tempData.split(":")[0];
									when.timeSS_ = tempData.split(":")[1];
									
									if (flag) {	
										if(when.timeSS_ > timestamp.MAX_HOUR){
											$("#ss_span").empty().html(wemo.items["tomorrow"]);
										}
										else{
											$("#ss_span").empty().html(wemo.items["today"]);
										}
										$(".timeSR").empty().html( wemoUtil.convertMillisecondsToTF(when.timeSR_,UP_TF_IS24) );
										$(".timeSS").empty().html( wemoUtil.convertMillisecondsToTF(when.timeSS_,UP_TF_IS24) );
										console.log("enterin in sasa"+$(".timeSS").html());
									}									
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
	
	getNumberOfSelectedDays : function () {
		var number = 0;
		$('#schedule div').each(function () {
			if ($(this).hasClass("div_bg_green")) number++;
		});
		return number;
	}
};
