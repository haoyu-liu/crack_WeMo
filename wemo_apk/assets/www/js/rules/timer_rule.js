/*
 timer_rule.js

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

var TAG = "timer_rule.js: ";
var isEdit = false;
var isLedFadeIn = false;
count = 0;
checked_udn_array = new Array();
var soCheck = window.sessionStorage.getItem(sessionStore.HOUSE_SITTER_CHECK);
var defaultSelect = false;
var defaultFlag = false;
var UP_TF_IS24 = false;//UP-user preferences, TF-time format
var isAwayModeInit = false;

$(document).bind('pageinit', function () {
    timer_rule.initialize();
});

var timer_rule = {

    initialize: function () {
        	if ( window.sessionStorage.getItem(sessionStore.isEdit) == "edit_timer_or_simple_rule") {
				isEdit = true;
                $(".sub_header span").empty().html(wemo.items["EditTimerRuleEditRuleTitle"]);
			} else
            if (window.sessionStorage.getItem(sessionStore.isEdit) == "edit_away_rule") {
                isEdit = true;
                $(".sub_header span").empty().html(wemo.items["EditAwayModeRuleEditRuleTitle"]);
            }
            else {
				if(soCheck == "1"){
					$('#header_string').html(wemo.items['NewAwayModeRule']);
				}else
				$(".sub_header span").empty().html(wemo.items["NewRuleNewRuleTitle"]);
			};
			
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    onDeviceReady: function() {
        var self = this;
        UP_TF_IS24 = wemoUtil.userPreferences.getTimeFormat();
        
        var remoteEnable = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_ENABLE);
        if(!remoteEnable){
        	$.when(wemoUtil.getDevices(actions.SELECT_SWITCHES), wemoUtil.getDevices(actions.SELECT_DIMMERS), wemoUtil.getDevices(actions.SELECT_INSIGHTS), wemoUtil.getDevices(actions.SELECT_MAKER), wemoUtil.getDevices(actions.SELECT_LED_DEVICES))
            .then(function() { 
                timer_rule.afterOnDeviceReady(); 
            }).fail(function() {
                throw ('ERROR');
            });
        }else{
        	timer_rule.afterOnDeviceReady();
        } 

    },
    afterOnDeviceReady: function() {
        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
		var x = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
        var networktype = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_NETWORKTYPE);
		wemoUtil.infoLog(TAG, 'networktype: ' + networktype);
        var remoteEnable = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_ENABLE);
        var tempSelectedDayOrRange = "";
        var isAwayModeEdit = wemoUtil.getJSONObjectFromSessionStorage(key.AWAY_MODE_EDIT);

        window.sessionStorage.setItem(key.AWAY_MODE_EDIT, false);
        if(soCheck == "1" && (Object.keys(x.Devices).length == 0) && isAwayModeEdit != true){
        	isAwayModeInit = true;
        }
        timer_rule.selectDevices(networktype,remoteEnable, x);
        var bridgeUDN = "";

        timer_rule.bindEvents();
        wemoUtil.setTimeFormat();
		
        $("#device_not_selected_ok").on("tap", function (e) {
            $("#device_not_selected").popup('close');
            $('body').off('touchmove');
            e.preventDefault();
        });

		if(soCheck == "1"){
        	$('#what_is_this').html(wemo.items['WhatIsThis']);
        }
		
		//Open drawer Start
		$("#rules_container #select_").find('.select_switches_list .fname').on("tap", function() {
			var id_drawer = $.trim($(this).parent().parent().parent().attr('data-udn'));
			var drawer = $('div [id="'+id_drawer+'"]');	
					
			if(soCheck =="1"){
				var fname = $.trim( $('div [data-udn="'+id_drawer+'"]').find('.fname').html() );
				var udn=window.sessionStorage.getItem("udn");

				if(udn==null)
					window.sessionStorage.setItem("udn", id_drawer);

				window.sessionStorage.setItem("checked_udn_array", checked_udn_array);

				$('div [data-udn="'+id_drawer+'"] ').find('.check_mark').attr('display','block').show();
				window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE, id_drawer);
				window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE_NAME, fname);
				$('div [data-udn="'+id_drawer+'"]').find('.action_subHeader').show();

				if(wemoUtil.isMakerDevice(id_drawer)){
					id_drawer = wemoUtil.getMakerSwithUDN(id_drawer);
				}
				if ( x.Devices[id_drawer] ) {
					x.Devices[id_drawer]={};
					delete x.Devices[id_drawer];  
				}
				x.Devices[id_drawer]={};
				x.DeviceList += id_drawer;

				var action = 2;

				var data_udn=id_drawer;
				
				x.Devices[data_udn].SensorDuration = 0; 
				x.Devices[data_udn].IntervalWhen = true; 
				x.Devices[data_udn].StartAction = 1;
				x.Devices[data_udn].EndAction = 0;
				x.Devices[data_udn].FName=window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE_NAME);
				
				if((data_udn).indexOf("uuid") == -1) {
					x.Devices[data_udn].SelectedLedValue = 1;
				} else {
					x.Devices[data_udn].SelectedLedValue = 0;
				}
				
				wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
				timer_rule.changeWhenField(x);
				
				
			}else{
				//if length is 0, then device does not have drawer(i.e Maker switch is in momentary mode)
				if(drawer.length !=0){

					drawer.slideToggle("fast", function() {
                        if ( drawer.is(":visible") ){
                            $('.drawer:visible').each(function(i,elem) {
                                if ($(this).attr("id")!=id_drawer ) {
                                    $(this).slideToggle("fast");  
                                }
                            });
                        }
                        else {
                        	$('div [data-udn="'+id_drawer+'"]').find('.action_subHeader').show();
                        } 
                        
					});
				
				}
				else{
					var data_udn = $.trim($(this).parent().parent().parent().attr('data-udn'));
					var fname = $.trim( $('div [data-udn="'+data_udn+'"]').find('.fname').html() );
					var check_mark=$('div [data-udn="'+data_udn+'"] ').find('.check_mark');
					if(!check_mark.is(":visible")) {
						check_mark.attr('display','block').show();	
						window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE, data_udn);
						window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE_NAME, fname);

						$("#timer_rule_when .action").empty().html( 'on' );
						if(wemoUtil.isMakerDevice(data_udn)){
							data_udn = wemoUtil.getMakerSwithUDN(data_udn);
						}
						if ( x.Devices[data_udn] ) {
							x.Devices[data_udn]={};
							delete x.Devices[data_udn];							
						}

						x.Devices[data_udn]={};
						x.DeviceList += data_udn;
						x.Devices[data_udn].SensorDuration = 2; 
						x.Devices[data_udn].StartAction = 1;
						x.Devices[data_udn].EndAction = 0;	
						x.Devices[data_udn].FName=window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE_NAME);
						wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
						timer_rule.changeWhenField(x);
						$('div [data-udn="'+id_drawer+'"]').find('.action_subHeader').empty().html( 'on' ).show();
					}
				}
			}

		});
		//Open drawer End
		
		//Drawer li tap Start
		$("#rules_container #select_").find('.drawer_li').on("tap", function(e) {
			//Fix for WEMO-23222
			e.preventDefault();
			
			$(this).parent().find('.drawer_li').removeClass('div_bg_green');
			$(this).addClass('div_bg_green');	
			
			var id_drawer = $(this).parent().attr("id");
			var drawer = $('div [id="'+id_drawer+'"]');	
			var data_udn = $.trim($(this).parent().attr('id'));					
			var action;		
			var actionCnt=0;

			var deviceID;

			if ( $(this).hasClass("until") ) {
				action = 2; 
			
				if((data_udn).indexOf("uuid") === -1 || data_udn.match(/dimmer/gi)) {
						var baseValue;
						if ((data_udn).indexOf("uuid") === -1) {
							deviceID = data_udn;
							baseValue = 10;
						} else {
							deviceID = data_udn.split("-")[2];
							baseValue = 1;
						}


						$('div [id="'+data_udn+'"]').find("#boxscroll"+deviceID).empty().html('<div class="drawer_li_dimmerFade brightness div_bg_white" style="display:block;" id="brightness' + deviceID + '">'+
						'<span>'+wemo.items['brightness']+'<div class="sliderValue"></div></span>'+
				        '<div class="brightSlider"><input type="range" name="slider-1" id="slider-1'+deviceID+'" data-highlight="true" class="sliderDrawer" value="100" min="1" max="100"/>'+
				        '</div>'+
				        //'<div class="sliderValue"></div>' +
				        '<div class="clearboth"></div>' +
				        '</div>'+
				    
				        '<div class="drawer_li_dimmerFade fadein div_bg_white" style="display:block;" id="fadein' + deviceID + '">'+
						'<span class="drawer_header">'+wemo.items['fadeIn']+'</span>'+
				        '<div class="firstRow">'+
				        '<span class="minutesButton"><span class="buttonTitle"> '+wemo.items['zeroSec']+' </span><span class="buttonImage buttonActive" data-time="0"></span></span>'+
				        '<span class="minutesButton"><span class="buttonTitle"> '+wemo.items['oneMin']+' </span><span class="buttonImage" data-time='+ 60 * baseValue +'></span></span> '+
				        '<span class="minutesButton"><span class="buttonTitle"> '+wemo.items['fiveMin']+' </span><span class="buttonImage" data-time='+ 300 * baseValue +'></span></span> '+
				        '<span class="minutesButton"><span class="buttonTitle"> '+wemo.items['fifteenMin']+' </span><span class="buttonImage" data-time='+ 900 * baseValue +'></span></span> '+
				        '<span class="minutesButton"><span class="buttonTitle"> '+wemo.items['thirtyMin']+'</span><span class="buttonImage" data-time='+ 1800 * baseValue +'></span></span> '+
				        '</div>'+
				        '<div class="clearboth"></div>' +
				        '</div>'+
				        
				        '<div class="drawer_li_dimmerFade fadeout div_bg_white" style="display:block;" id="fadeout' + deviceID + '">'+
						'<span class="drawer_header">'+wemo.items['fadeOut']+'</span>'+
				        '<div class="firstRow">'+
				        '<span class="minutesButton"><span class="buttonTitle"> '+wemo.items['threeSec']+' </span><span class="buttonImage buttonActive" data-time='+ 3 * baseValue +'></span></span>'+
				        '<span class="minutesButton"><span class="buttonTitle"> '+wemo.items['oneMin']+' </span><span class="buttonImage" data-time='+ 60 * baseValue +'></span></span> '+
				        '<span class="minutesButton"><span class="buttonTitle"> '+wemo.items['fiveMin']+' </span><span class="buttonImage" data-time='+ 300 * baseValue +'></span></span> '+
				        '<span class="minutesButton"><span class="buttonTitle"> '+wemo.items['fifteenMin']+' </span><span class="buttonImage" data-time='+ 900 * baseValue +'></span></span> '+
				        '<span class="minutesButton"><span class="buttonTitle"> '+wemo.items['thirtyMin']+'</span><span class="buttonImage" data-time='+ 1800 * baseValue +'></span></span> '+
				        '</div>'+
				        '<div class="clearboth"></div>' +
				        '</div>');
						
						$('div [id="'+data_udn+'"]').find("#picker_footer"+deviceID).empty().html('<div class="picker_cnl" id="cnl_time_btn' + deviceID + '"><span> '+wemo.items['Cancel']+' </span></div>'+
						'<div class="picker_set" id="set_time_btn' + deviceID + '"><span> '+wemo.items['Set']+' </span></div>');
						
						 
						$('div [id="'+data_udn+'"]').find("#boxscroll"+deviceID).trigger("create");
						$('div [id="'+data_udn+'"]').find("#boxscroll"+deviceID).trigger("refresh");
						
						$('div [id="'+data_udn+'"]').find("#picker_footer"+deviceID).trigger("create");
						$('div [id="'+data_udn+'"]').find("#picker_footer"+deviceID).trigger("refresh");
						
						$('div [id="'+data_udn+'"]').find('.picker_header_ScrollPicker').empty().text(wemo.items['untilOption']);
						$('div [id="'+data_udn+'"]').find('.picker_header_ScrollPicker').attr("style","color:#73d44c !important;");
						
						$('div [id="'+data_udn+'"]').find('.timer-overlayScrollPicker').attr('style', 'visibility: visible;');
							
						$('#fadein'+deviceID).on("tap", ".buttonImage", function (e) {
							 $('#fadein' + deviceID + ' .buttonImage').removeClass('buttonActive');
							 $(this).addClass('buttonActive');
						});
						
						$('#fadeout'+deviceID).on("tap", ".buttonImage", function (e) {
							$('#fadeout' + deviceID + ' .buttonImage').removeClass('buttonActive');
							 $(this).addClass('buttonActive');
						});
						
						$('#slider-1'+deviceID).change(function () {
	                        var slider_value = $('#slider-1'+deviceID).val();
	                        $('div [id="'+data_udn+'"]').find('.sliderValue').text(slider_value + '%');
	                        x.Devices[id_drawer].Brightness = slider_value;
	                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);

	                    });
						
						$("#cnl_time_btn"+deviceID).on("tap", function (e) {
							$('div [id="'+id_drawer+'"]').find('.timer-overlayScrollPicker').attr('style', 'visibility: hidden;');
							$('div [id="'+id_drawer+'"]').find('.until').removeClass('div_bg_green');
							$('div [data-udn="'+id_drawer+'"] ').find('.check_mark').hide();
							$('div [data-udn="'+id_drawer+'"]').find('.action_subHeader').empty();

							x.Devices[id_drawer]={};
				            delete x.Devices[id_drawer];
							wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,x);	
							
							e.preventDefault();
						});
						$("#set_time_btn"+deviceID).on("tap", function (e) {
							var device_udn = $('.timer-overlayScrollPicker').attr('data-deviceId');
							var ruleType = $('div [id="'+id_drawer+'"]').find('.picker_header_ScrollPicker').text();

							if(ruleType == "ON OPTIONS")
							{
								var fadein = $('div [id="'+id_drawer+'"] .fadein').find('.buttonActive').attr('data-time');
								var brightness = $('#slider-1'+deviceID).val();
								var tempVal =  $('div [id="'+id_drawer+'"]').find('span').html();
								//var Disvalue = tempVal+' '+brightness+"%"+' fade in : '+(fadein/10);
								
								if(fadein == "0")
									var disFadeIn = "default";
								
								else
									var disFadeIn = (fadein/baseValue);

								disFadeIn = isNaN(disFadeIn)? disFadeIn: (disFadeIn/60)+' m';
								var Disvalue = "Brightness:"+brightness+"%<br/>Fade in:"+disFadeIn;
								
								x.Devices[id_drawer].FadeIn = fadein;
								x.Devices[id_drawer].Brightness = brightness;
							}
							else if(ruleType == "OFF OPTIONS")
							{
								var fadeout = $('div [id="'+id_drawer+'"] .fadeout').find('.buttonActive').attr('data-time');
								var tempVal =  $('div [id="'+id_drawer+'"]').find('span').html();
								//var Disvalue = tempVal+' fade out : '+(fadeout/10);
								
								if(parseInt(fadeout,10) === 3*baseValue)
									var disFadeOut = "default";
								
								else
									var disFadeOut = (fadeout/baseValue);
								
								disFadeOut = isNaN(disFadeOut)? disFadeOut: (disFadeOut/60)+' m';
								var Disvalue = "Fade out : "+disFadeOut;
			
								x.Devices[id_drawer].FadeOut = fadeout;
							}
							else 
							{
								var fadein = $('div [id="'+id_drawer+'"] .fadein').find('.buttonActive').attr('data-time');
								var fadeout = $('div [id="'+id_drawer+'"] .fadeout').find('.buttonActive').attr('data-time');
								var brightness = $('#slider-1'+deviceID).val();
								var tempVal =  $('div [id="'+id_drawer+'"]').find('span').html();
								//var Disvalue = tempVal+' '+brightness+"%"+' fade in : '+(fadein/10)+' fade out : '+(fadeout/10);
								
								if(fadein == "0")
									var disFadeIn = "default";
								
								else
									var disFadeIn = (fadein/baseValue);
								
								if(parseInt(fadeout,10) === 3*baseValue)
									var disFadeOut = "default";
								
								else
									var disFadeOut = (fadeout/baseValue);
								
								disFadeIn = isNaN(disFadeIn)? disFadeIn: (disFadeIn/60)+' m';
								disFadeOut = isNaN(disFadeOut)? disFadeOut: (disFadeOut/60)+' m';
								var Disvalue = "Brightness:"+brightness+"%<br/>Fade in:"+disFadeIn+", Fade out:"+disFadeOut;
								
								x.Devices[id_drawer].FadeIn = fadein;
								x.Devices[id_drawer].FadeOut = fadeout;
								x.Devices[id_drawer].Brightness = brightness;
							}
							
							
							$('div [data-udn="'+id_drawer+'"]').find('.action_subHeader').empty().html( Disvalue ).show();		
							$('div [data-udn="'+id_drawer+'"] ').find('.check_mark').attr('display','block').show();	
							
							wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
							
							if(actionCnt == 0)
							{
								$('div [id="'+id_drawer+'"]').find('.timer-overlayScrollPicker').attr('style', 'visibility: hidden;');
								$('div [id="'+id_drawer+'"]').slideToggle("slow");
								actionCnt++;
							}
							
							e.preventDefault();
							
							
						});
						
						if(x.Devices[id_drawer]) {
								if(x.Devices[id_drawer].StartAction == 1 && x.Devices[id_drawer].EndAction == 0)
								{
								
										$('.brightSlider').trigger('create');
								        var selectedFadein = x.Devices[id_drawer].FadeIn;
					                    var selectedBrightness = x.Devices[id_drawer].Brightness;
					                    var selectedFadeout = x.Devices[id_drawer].FadeOut;
					                    
					                    if(selectedFadein != undefined && selectedFadein != "")
					                    {
					                    
						                    $('#fadein'+deviceID).find('.buttonImage').each(function () {
						                    	if ($(this).attr('data-time') == selectedFadein) {
						                        	$('#fadein' + deviceID + ' .buttonImage').removeClass('buttonActive');
													$(this).addClass('buttonActive');
						                        }
						                    });
						                    
						                    fadein = selectedFadein;
					                    }
					                    if(selectedBrightness != undefined && selectedBrightness != "")
					                    {
					                    	if(selectedBrightness.search("%") != -1 && selectedBrightness.search("%") != false)
					                    		selectedBrightness = selectedBrightness.replace(/%$/, '');
					 	                    
					 	                    $('#slider-1'+deviceID).val(selectedBrightness);
						                    $('div [id="'+id_drawer+'"]').find('.sliderValue').empty().text(selectedBrightness + '%');
						                    $('#slider-1'+deviceID).slider("refresh");
					 	                    brightness = selectedBrightness;
					 	                }
					                    if(selectedFadeout != undefined && selectedFadeout != "")
					                    {
					                    	
						                    $('#fadeout'+deviceID).find('.buttonImage').each(function () {
						                    	if ($(this).attr('data-time') == selectedFadeout) {
						                        	$('#fadeout' + deviceID + ' .buttonImage').removeClass('buttonActive');
													$(this).addClass('buttonActive');
						                        }
						                    });
						                    
						                    fadeout = selectedFadeout;
					 	                }
					                    
										var tempVal =  "On until time";
										//var Disvalue = tempVal+' '+brightness+"%"+' fade in : '+(fadein/10)+' fade out : '+(fadeout/10);
										
										if(fadein == "0")
											var disFadeIn = "default";
										
										else
											var disFadeIn = (fadein/baseValue);
										
										if(parseInt(fadeout,10) === 3*baseValue)
											var disFadeOut = "default";
										else
											var disFadeOut = (fadeout/baseValue);
										
										disFadeIn = isNaN(disFadeIn)? disFadeIn: (disFadeIn/60)+' m';
										disFadeOut = isNaN(disFadeOut)? disFadeOut: (disFadeOut/60)+' m';
										var Disvalue = "Brightness:"+brightness+"%<br/>Fade in:"+disFadeIn+", Fade out:"+disFadeOut;
										x.Devices[id_drawer].FadeIn = fadein;
										x.Devices[id_drawer].FadeOut = fadeout;
										x.Devices[id_drawer].Brightness = brightness;
								}
						} else {
								$('.brightSlider').trigger('create');
								var slider_value = $('#slider-1'+deviceID).val();
								var beforefadein = $('#fadein'+deviceID).find('.buttonActive').attr('data-time');
								var beforefadeout = $('#fadeout'+deviceID).find('.buttonActive').attr('data-time');
								
								if(beforefadeout == undefined)
									beforefadeout = 3*baseValue;
						
								if(beforefadein == undefined)
									beforefadein = "0";
								
								if(slider_value == undefined)
									slider_value = "100";
								
								$('div [id="'+data_udn+'"]').find('.sliderValue').empty().text(slider_value + '%');
								
								$('div [id="'+data_udn+'"]').find('.buttonImage').removeClass('buttonActive');
	
								$('div [id="'+data_udn+'"]').find('.buttonImage').each(function (i, v) {
					                if ($(this).attr('data-time') == beforefadein) {
					                	$(this).addClass('buttonActive');
					                }
					                if ($(this).attr('data-time') == beforefadeout) {
					                	$(this).addClass('buttonActive');
					                }
					            });
								
								var fadein = $('div [id="'+data_udn+'"] .fadein').find('.buttonActive').attr('data-time');
								var fadeout = $('div [id="'+data_udn+'"] .fadeout').find('.buttonActive').attr('data-time');
								var brightness = $('#slider-1'+deviceID).val();
								var tempVal =  $(this).find('span').html();
								//var Disvalue = tempVal+' '+brightness+"%"+' fade in : '+(fadein/10)+' fade out : '+(fadeout/10);
								
								if(fadein == "0")
									var disFadeIn = "default";
								
								else
									var disFadeIn = (fadein/baseValue);
								
								if(parseInt(fadeout,10) === 3*baseValue)
									var disFadeOut = "default";
								
								else
									var disFadeOut = (fadeout/baseValue);
								
								disFadeIn = isNaN(disFadeIn)? disFadeIn: (disFadeIn/60)+' m';
								disFadeOut = isNaN(disFadeOut)? disFadeOut: (disFadeOut/60)+' m';
								var Disvalue = "Brightness:"+brightness+"%<br/>Fade in :"+disFadeIn+", Fade out:"+disFadeOut;
					
							
						}		
						
				}
			
			} else if ( $(this).hasClass("on") ) {
				action = 1;
				if((data_udn).indexOf("uuid") === -1 || data_udn.match(/dimmer/gi)) {
					var baseValue;
					if ((data_udn).indexOf("uuid") === -1) {
						deviceID = data_udn;
						baseValue = 10;
					} else {
						deviceID = data_udn.split("-")[2];
						baseValue = 1;
					}

					$('div [id="'+data_udn+'"]').find("#boxscroll"+deviceID).empty().html('<div class="drawer_li_dimmerFade brightness div_bg_white" style="display:block;" id="brightness' + deviceID + '">'+
					'<span>'+wemo.items['brightness']+'<div class="sliderValue"></div></span>'+
					'<div class="brightSlider"><input type="range" name="slider-1" id="slider-1'+deviceID+'" data-highlight="true" class="sliderDrawer" value="100" min="1" max="100" />'+
					'</div>'+
					//'<div class="sliderValue"></div>' +
					'<div class="clearboth"></div>' +
					'</div>'+

					'<div class="drawer_li_dimmerFade fadein div_bg_white" style="display:block;" id="fadein' + deviceID + '">'+
					'<span class="drawer_header">'+wemo.items['fadeIn']+'</span>'+
					'<div class="firstRow">'+
					'<span class="minutesButton"><span class="buttonTitle"> '+wemo.items['zeroSec']+' </span><span class="buttonImage buttonActive" data-time="0"></span></span>'+
					'<span class="minutesButton"><span class="buttonTitle"> '+wemo.items['oneMin']+' </span><span class="buttonImage" data-time='+ 60 * baseValue +'></span></span> '+
					'<span class="minutesButton"><span class="buttonTitle"> '+wemo.items['fiveMin']+' </span><span class="buttonImage" data-time='+ 300 * baseValue +'></span></span> '+
					'<span class="minutesButton"><span class="buttonTitle"> '+wemo.items['fifteenMin']+' </span><span class="buttonImage" data-time='+ 900 * baseValue +'></span></span> '+
					'<span class="minutesButton"><span class="buttonTitle"> '+wemo.items['thirtyMin']+'</span><span class="buttonImage" data-time='+ 1800 * baseValue +'></span></span> '+
					'</div>'+
					'<div class="clearboth"></div>' +
					'</div>');

					$('div [id="'+data_udn+'"]').find("#picker_footer"+deviceID).empty().html('<div class="picker_cnl" id="cnl_time_btn' + deviceID + '"><span> '+wemo.items['Cancel']+' </span></div>'+
					'<div class="picker_set" id="set_time_btn' + deviceID + '"><span> '+wemo.items['Set']+' </span></div>');


					$('div [id="'+data_udn+'"]').find("#boxscroll"+deviceID).trigger("create");
					$('div [id="'+data_udn+'"]').find("#boxscroll"+deviceID).trigger("refresh");

					$('div [id="'+data_udn+'"]').find("#picker_footer"+deviceID).trigger("create");
					$('div [id="'+data_udn+'"]').find("#picker_footer"+deviceID).trigger("refresh");

					$('div [id="'+data_udn+'"]').find('.picker_header_ScrollPicker').empty().text(wemo.items['onOption']);
					$('div [id="'+data_udn+'"]').find('.picker_header_ScrollPicker').attr("style","color:#73d44c !important;");

					$('div [id="'+data_udn+'"]').find('.timer-overlayScrollPicker').attr('style', 'visibility: visible;');

					$('#fadein'+deviceID).on("tap", ".buttonImage", function (e) {
						 $('#fadein' + deviceID + ' .buttonImage').removeClass('buttonActive');
						 $(this).addClass('buttonActive');
					});

					$('#slider-1'+deviceID).change(function () {
						var slider_value = $('#slider-1'+deviceID).val();
						$('div [id="'+data_udn+'"]').find('.sliderValue').empty().text(slider_value + '%');
						x.Devices[id_drawer].Brightness = slider_value;
						wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);

					});

					$("#cnl_time_btn"+deviceID).on("tap", function (e) {
						$('div [id="'+id_drawer+'"]').find('.timer-overlayScrollPicker').attr('style', 'visibility: hidden;');
						$('div [id="'+id_drawer+'"]').find('.on').removeClass('div_bg_green');
						$('div [data-udn="'+id_drawer+'"] ').find('.check_mark').hide();
						$('div [data-udn="'+id_drawer+'"]').find('.action_subHeader').empty();

						x.Devices[id_drawer]={};
						delete x.Devices[id_drawer];
						wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,x);

						e.preventDefault();
					});
					$("#set_time_btn"+deviceID).on("tap", function (e) {
						var data_udn = $('.timer-overlayScrollPicker').attr('data-deviceId');
						var ruleType = $('div [id="'+data_udn+'"]').find('.picker_header_ScrollPicker').text();

						if(ruleType == "ON OPTIONS")
						{
							var fadein = $('div [id="'+id_drawer+'"] .fadein').find('.buttonActive').attr('data-time');
							var brightness = $('#slider-1'+deviceID).val();
							var tempVal =  $('div [id="'+id_drawer+'"]').find('span').html();
							//var Disvalue = tempVal+' '+brightness+"%"+' fade in : '+(fadein/10);

							if(fadein == "0")
								var disFadeIn = "default";

							else
								var disFadeIn = (fadein/baseValue);

							disFadeIn = isNaN(disFadeIn)? disFadeIn: (disFadeIn/60)+' m';
							var Disvalue = "Brightness:"+brightness+"%<br/>Fade in:"+disFadeIn;

							x.Devices[id_drawer].FadeIn = fadein;
							x.Devices[id_drawer].Brightness = brightness;

						}
						else if(ruleType == "OFF OPTIONS")
						{
							var fadeout = $('div [id="'+id_drawer+'"] .fadeout').find('.buttonActive').attr('data-time');
							var tempVal =  $('div [id="'+id_drawer+'"]').find('span').html();
							//var Disvalue = tempVal+' fade out : '+(fadeout/10);

							if(parseInt(fadeout,10) === 3*baseValue)
								var disFadeOut = "default";

							else
								var disFadeOut = (fadeout/baseValue);

							disFadeOut = isNaN(disFadeOut)? disFadeOut: (disFadeOut/60)+' m';
							var Disvalue = "Fade out : "+disFadeOut;

							x.Devices[id_drawer].FadeOut = fadeout;
						}
						else
						{
							var fadein = $('div [id="'+id_drawer+'"] .fadein').find('.buttonActive').attr('data-time');
							var fadeout = $('div [id="'+id_drawer+'"] .fadeout').find('.buttonActive').attr('data-time');
							var brightness = $('#slider-1'+deviceID).val();
							var tempVal =  $('div [id="'+id_drawer+'"]').find('span').html();
							//var Disvalue = tempVal+' '+brightness+"%"+' fade in : '+(fadein/10)+' fade out : '+(fadeout/10);

							if(fadein == "0")
								var disFadeIn = "default";

							else
								var disFadeIn = (fadein/baseValue);

							if(parseInt(fadeout,10) === 3*baseValue)
								var disFadeOut = "default";

							else
								var disFadeOut = (fadeout/baseValue);

							disFadeIn = isNaN(disFadeIn)? disFadeIn: (disFadeIn/60)+' m';
							disFadeOut = isNaN(disFadeOut)? disFadeOut: (disFadeOut/60)+' m';
							var Disvalue = "Brightness:"+brightness+"%<br/>Fade in:"+disFadeIn;

							x.Devices[id_drawer].FadeIn = fadein;
							x.Devices[id_drawer].FadeOut = fadeout;
							x.Devices[id_drawer].Brightness = brightness;
						}


						$('div [data-udn="'+id_drawer+'"]').find('.action_subHeader').html( Disvalue ).show();
						$('div [data-udn="'+id_drawer+'"] ').find('.check_mark').attr('display','block').show();

						wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);

						if(actionCnt == 0)
						{
							$('div [id="'+id_drawer+'"]').find('.timer-overlayScrollPicker').attr('style', 'visibility: hidden;');
							$('div [id="'+id_drawer+'"]').slideToggle("slow");
							actionCnt++;
						}
						e.preventDefault();


					});

					if(x.Devices[id_drawer])
					{
						if(x.Devices[id_drawer].StartAction == 1 && x.Devices[id_drawer].EndAction == 1)
						{

								$('.brightSlider').trigger('create');
								var selectedFadein = x.Devices[id_drawer].FadeIn;
								var selectedBrightness = x.Devices[id_drawer].Brightness;

								if(selectedBrightness != undefined && selectedBrightness != "")
								{
									if(selectedBrightness.search("%") != -1 && selectedBrightness.search("%") != false)
										selectedBrightness = selectedBrightness.replace(/%$/, '');

									$('#slider-1'+deviceID).val(selectedBrightness);
									$('div [id="'+id_drawer+'"]').find('.sliderValue').empty().text(selectedBrightness + '%');
									$('#slider-1'+deviceID).slider("refresh");
									brightness = selectedBrightness;
								}
								if(selectedFadein != undefined && selectedFadein != "")
								{
									$('#fadein'+deviceID).find('.buttonImage').each(function () {
										if ($(this).attr('data-time') == selectedFadein) {
											$('#fadein' + deviceID + ' .buttonImage').removeClass('buttonActive');
											$(this).addClass('buttonActive');
										}
									});

									fadein = selectedFadein;
								}

								var tempVal =  "on";
								//var Disvalue = tempVal+' '+brightness+"%"+' fade in : '+(fadein/10);

								if(fadein == "0")
									var disFadeIn = "default";

								else
									var disFadeIn = (fadein/baseValue);

								disFadeIn = isNaN(disFadeIn)? disFadeIn: (disFadeIn/60)+' m';
								var Disvalue = "Brightness:"+brightness+"%<br/>Fade in:"+disFadeIn;

								x.Devices[id_drawer].FadeIn = fadein;
								x.Devices[id_drawer].Brightness = brightness;

						}
					}

					else
					{
							$('.brightSlider').trigger('create');
							var slider_value = $('#slider-1'+deviceID).val();
							var beforefadein = $('#fadein'+deviceID).find('.buttonActive').attr('data-time');

							if(beforefadein == undefined)
								beforefadein = "0";

							if(slider_value == undefined)
								slider_value = "100";

							$('div [id="'+data_udn+'"]').find('.sliderValue').text(slider_value + '%');

							$('div [id="'+data_udn+'"]').find('.buttonImage').removeClass('buttonActive');


							$('div [id="'+data_udn+'"]').find('.buttonImage').each(function (i, v) {

								if ($(this).attr('data-time') == beforefadein) {

									$(this).addClass('buttonActive');
								}

							});

							var fadein = $('#fadein'+deviceID).find('.buttonActive').attr('data-time');
							var brightness = $('#slider-1'+deviceID).val();
							var tempVal =  $(this).find('span').html();
							//var Disvalue = tempVal+' '+brightness+"%"+' fade in : '+(fadein/10);

							if(fadein == "0")
								var disFadeIn = "default";

							else
								var disFadeIn = (fadein/baseValue);

							disFadeIn = isNaN(disFadeIn)? disFadeIn: (disFadeIn/60)+' m';
							var Disvalue = "Brightness:"+brightness+"%<br/>Fade in:"+disFadeIn;

					}
					
				}
				else
				{
					$("#timer_rule_when .action").empty().html( wemo.items['On'] );
				}
			
			} else {
				action = 0;
				
				if((data_udn).indexOf("uuid") === -1 || data_udn.match(/dimmer/gi)) {
					var baseValue;
					if ((data_udn).indexOf("uuid") === -1) {
							deviceID = data_udn;
							baseValue = 10;
						} else {
							deviceID = data_udn.split("-")[2];
							baseValue = 1;
						}
						
					$('div [id="'+data_udn+'"]').find("#boxscroll"+deviceID).empty().html('<div class="drawer_li_dimmerFade fadeout div_bg_white" style="display:block;" id="fadeout' + deviceID + '">'+
						'<span class="drawer_header">'+wemo.items['fadeOut']+'</span>'+
						'<div class="firstRow">'+
						'<span class="minutesButton"><span class="buttonTitle"> '+wemo.items['threeSec']+' </span><span class="buttonImage buttonActive" data-time='+ 3 * baseValue +'></span></span>'+
						'<span class="minutesButton"><span class="buttonTitle"> '+wemo.items['oneMin']+' </span><span class="buttonImage" data-time='+ 60 * baseValue +'></span></span> '+
						'<span class="minutesButton"><span class="buttonTitle"> '+wemo.items['fiveMin']+' </span><span class="buttonImage" data-time='+ 300 * baseValue +'></span></span> '+
						'<span class="minutesButton"><span class="buttonTitle"> '+wemo.items['fifteenMin']+' </span><span class="buttonImage" data-time='+ 900 * baseValue +'></span></span> '+
						'<span class="minutesButton"><span class="buttonTitle"> '+wemo.items['thirtyMin']+'</span><span class="buttonImage" data-time='+ 1800 * baseValue +'></span></span> '+
						'</div>'+
						'<div class="clearboth"></div>' +
					'</div>');

					$('div [id="'+data_udn+'"]').find("#picker_footer"+deviceID).empty().html('<div class="picker_cnl" id="cnl_time_btn' + deviceID + '"><span> '+wemo.items['Cancel']+' </span></div>'+
					'<div class="picker_set" id="set_time_btn' + deviceID + '"><span> '+wemo.items['Set']+' </span></div>');

					$('div [id="'+data_udn+'"]').find("#boxscroll"+deviceID).trigger("create");
					$('div [id="'+data_udn+'"]').find("#boxscroll"+deviceID).trigger("refresh");

					$('div [id="'+data_udn+'"]').find("#picker_footer"+deviceID).trigger("create");
					$('div [id="'+data_udn+'"]').find("#picker_footer"+deviceID).trigger("refresh");

					$('div [id="'+data_udn+'"]').find('.picker_header_ScrollPicker').empty().text(wemo.items['offOption']);
					$('div [id="'+data_udn+'"]').find('.picker_header_ScrollPicker').attr("style","color:#73d44c !important;");

					$('div [id="'+data_udn+'"]').find('.timer-overlayScrollPicker').attr('style', 'visibility: visible;');

					$('#fadeout'+deviceID).on("tap", ".buttonImage", function (e) {
						$('#fadeout' + deviceID + ' .buttonImage').removeClass('buttonActive');
						$(this).addClass('buttonActive');
					});

					$("#cnl_time_btn"+deviceID).on("tap", function (e) {
						$('div [id="'+id_drawer+'"]').find('.timer-overlayScrollPicker').attr('style', 'visibility: hidden;');
						$('div [id="'+id_drawer+'"]').find('.off').removeClass('div_bg_green');
						$('div [data-udn="'+id_drawer+'"] ').find('.check_mark').hide();
						$('div [data-udn="'+id_drawer+'"]').find('.action_subHeader').empty();

						x.Devices[id_drawer]={};
						delete x.Devices[id_drawer];
						wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,x);

						e.preventDefault();
					});
					$("#set_time_btn"+deviceID).on("tap", function (e) {
						var data_udn = $('.timer-overlayScrollPicker').attr('data-deviceId');
						var ruleType = $('div [id="'+id_drawer+'"]').find('.picker_header_ScrollPicker').text();

						if(ruleType == "ON OPTIONS") {
							var fadein = $('div [id="'+id_drawer+'"] .fadein').find('.buttonActive').attr('data-time');
							var brightness = $('#slider-1'+deviceID).val();
							var tempVal =  $('div [id="'+id_drawer+'"]').find('span').html();
							//var Disvalue = tempVal+' '+brightness+"%"+' fade in : '+(fadein/10);

							if(fadein == "0")
								var disFadeIn = "default";
							else
								var disFadeIn = (fadein/baseValue);

							disFadeIn = isNaN(disFadeIn)? disFadeIn: (disFadeIn/baseValue)+' m';
							var Disvalue = "Brightness:"+brightness+"%<br/>Fade in:"+disFadeIn;

							x.Devices[id_drawer].FadeIn = fadein;
							x.Devices[id_drawer].Brightness = brightness;

						} else if(ruleType == "OFF OPTIONS") {
							var fadeout = $('div [id="'+id_drawer+'"] .fadeout').find('.buttonActive').attr('data-time');
							var tempVal =  $('div [id="'+id_drawer+'"]').find('span').html();
							//var Disvalue = tempVal+' fade out : '+(fadeout/10);

							if(parseInt(fadeout,10) === 3*baseValue)
								var disFadeOut = "default";
							else
								var disFadeOut = (fadeout/baseValue);

							disFadeOut = isNaN(disFadeOut)? disFadeOut: (disFadeOut/60)+' m';
							var Disvalue = "Fade out : "+disFadeOut;

							x.Devices[id_drawer].FadeOut = fadeout;
						} else {
							var fadein = $('div [id="'+id_drawer+'"] .fadein').find('.buttonActive').attr('data-time');
							var fadeout = $('div [id="'+id_drawer+'"] .fadeout').find('.buttonActive').attr('data-time');
							var brightness = $('#slider-1'+deviceID).val();
							var tempVal =  $('div [id="'+id_drawer+'"]').find('span').html();
							//var Disvalue = tempVal+' '+brightness+"%"+' fade in : '+(fadein/10)+' fade out : '+(fadeout/10);

							if(fadein == "0")
								var disFadeIn = "default";

							else
								var disFadeIn = (fadein/baseValue);

							if(parseInt(fadeout,10) === 3*baseValue)
								var disFadeOut = "default";

							else
								var disFadeOut = (fadeout/baseValue);

							disFadeIn = isNaN(disFadeIn)? disFadeIn: (disFadeIn/60)+' m';
							disFadeOut = isNaN(disFadeOut)? disFadeOut: (disFadeOut/60)+' m';
							var Disvalue = "Brightness:"+brightness+"%<br/>Fade in:"+disFadeIn+", Fade out:"+disFadeOut;

							x.Devices[id_drawer].FadeIn = fadein;
							x.Devices[id_drawer].FadeOut = fadeout;
							x.Devices[id_drawer].Brightness = brightness;
						}


						$('div [data-udn="'+id_drawer+'"]').find('.action_subHeader').empty().html( Disvalue ).show();
						$('div [data-udn="'+id_drawer+'"] ').find('.check_mark').attr('display','block').show();

						wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);

						if(actionCnt == 0)
						{
							$('div [id="'+id_drawer+'"]').find('.timer-overlayScrollPicker').attr('style', 'visibility: hidden;');
							$('div [id="'+id_drawer+'"]').slideToggle("slow");
							actionCnt++;
						}
						e.preventDefault();
					});

					if(x.Devices[id_drawer]) {
						if(x.Devices[id_drawer].StartAction == 0 && x.Devices[id_drawer].EndAction == 0) {

								$('.brightSlider').trigger('create');
								var slider_value = $('#slider-1'+deviceID).val();
								$('div [id="'+id_drawer+'"]').find('.sliderValue').empty().text(slider_value + '%');

								var selectedFadeout = x.Devices[id_drawer].FadeOut;

								if(selectedFadeout != undefined && selectedFadeout != "")
								{

									$('#fadeout'+deviceID).find('.buttonImage').each(function () {
										if ($(this).attr('data-time') == selectedFadeout) {
											$('#fadeout' + deviceID + ' .buttonImage').removeClass('buttonActive');
											$(this).addClass('buttonActive');
										}
									});

									fadeout = selectedFadeout;
								}

								var tempVal =  "off";
								//var Disvalue = tempVal+' fade out : '+(fadeout/10);

								if(parseInt(fadeout,10) === 3*baseValue)
									var disFadeOut = "default";

								else
									var disFadeOut = (fadeout/baseValue);

								disFadeOut = isNaN(disFadeOut)? disFadeOut: (disFadeOut/60)+' m';
								var Disvalue = "Fade out : "+disFadeOut;

								x.Devices[id_drawer].FadeOut = fadeout;
						}
					} else {
							var beforefadeout = $('#fadeout'+data_udn).find('.buttonActive').attr('data-time');

							if(beforefadeout == undefined)
								beforefadeout = 3*baseValue;

							$('div [id="'+data_udn+'"]').find('.buttonImage').removeClass('buttonActive');

							$('div [id="'+data_udn+'"]').find('.buttonImage').each(function (i, v) {
								if ($(this).attr('data-time') == beforefadeout) {
									$(this).addClass('buttonActive');
								}

							});

							var fadeout = $('#fadeout'+deviceID).find('.buttonActive').attr('data-time');
							var tempVal =  $(this).find('span').html();
							//var Disvalue = tempVal+' fade out : '+(fadeout/10);

							if(parseInt(fadeout,10) === 3*baseValue)
								var disFadeOut = "default";

							else
								var disFadeOut = (fadeout/baseValue);

							disFadeOut = isNaN(disFadeOut)? disFadeOut: (disFadeOut/60)+' m';
							var Disvalue = "Fade out : "+disFadeOut;

					}
					
				} else {
					window.sessionStorage.setItem("off","1");    
					$("#timer_rule_when .action").empty().html( wemo.items['Off'] );
				}
			}	
			
				var fname = $.trim( $('div [data-udn="'+data_udn+'"]').find('.fname').html() );
				
				if((data_udn).indexOf("uuid") != -1 || (data_udn).match(/dimmer/gi)) {
					var Disvalue = $(this).find('span').html();
				}

				$('div [data-udn="'+data_udn+'"]').find('.action_subHeader').empty().html( Disvalue ).hide();		
				$('div [data-udn="'+data_udn+'"] ').find('.check_mark').attr('display','block').show();	
				
				window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE, data_udn);
				window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE_NAME, fname);   
				
	            if(wemoUtil.isMakerDevice(data_udn)){
	            	data_udn = wemoUtil.getMakerSwithUDN(data_udn);
	            }
				
				if ( x.Devices[data_udn] ) {
					x.Devices[data_udn]={};
					delete x.Devices[data_udn];  
				}
				
				x.Devices[data_udn]={};
				x.DeviceList+= data_udn;
				//x.DeviceList = data_udn;
				
				if((data_udn).indexOf("uuid") === -1 || (data_udn).match(/dimmer/gi)) {
					x.Devices[data_udn].SelectedLedValue = 1;
				}
				else
				{
					x.Devices[data_udn].SelectedLedValue = 0;
				}
				
				if ( action == "1" ||  action == "2" ) {			
					switch (action) {
						case 1: {x.Devices[data_udn].SensorDuration = 2; 
								 x.Devices[data_udn].StartAction = 1;
								 x.Devices[data_udn].EndAction = 1;	
								 x.Devices[data_udn].FadeIn = fadein;
								 x.Devices[data_udn].FadeOut = fadeout;
								 x.Devices[data_udn].Brightness = brightness; break;}
						case 2: { x.Devices[data_udn].SensorDuration = 0; 
								  x.Devices[data_udn].IntervalWhen = true; 
								  x.Devices[data_udn].StartAction = 1;
								  x.Devices[data_udn].EndAction = 0;
								  x.Devices[data_udn].FadeIn = fadein;
								  x.Devices[data_udn].FadeOut = fadeout;
								  x.Devices[data_udn].Brightness = brightness; break;}
					}				
				} else {
					x.Devices[data_udn].StartAction= 0;
					x.Devices[data_udn].EndAction = 0;
					x.Devices[data_udn].SensorDuration = 2;	
					x.Devices[data_udn].FadeIn = fadein;
					x.Devices[data_udn].FadeOut = fadeout;
					x.Devices[data_udn].Brightness = brightness;
				}			
				x.Devices[data_udn].FName=window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE_NAME);
				wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
				
				timer_rule.changeWhenField(x);
				
				if((data_udn).indexOf("uuid") !== -1 && !(data_udn).match(/dimmer/gi)) {
					drawer.slideToggle("slow");
				}
				//drawer.slideToggle("slow");


			if(wemoUtil.isMakerDevice(data_udn)){
				data_udn = wemoUtil.getOriginalMakerUDN(data_udn);
			}

				$('div [data-udn="'+data_udn+'"]').find('.action_subHeader').show();
		});		
		
		
		//Drawer li tap End

		//Check mark handler Start
		$("#rules_container #select_").find('.select_switches_list .check_mark').on("tap", function(e) {
			var data_udn = $.trim($(this).parent().attr('data-udn'));	
			var drawer = $('div [id="'+data_udn+'"]');
			
			if((data_udn).indexOf("uuid") != -1 || (data_udn).match(/dimmer/gi))
			{
				timer_rule.deselectDevice(data_udn,drawer,x);
			}
			else
			{
				drawer.children().removeClass('div_bg_green');
				$('div [data-udn="'+data_udn+'"]').find('.action_subHeader').empty();
				$('div [data-udn="'+data_udn+'"] ').find('.check_mark').hide();
				
				//Delete from Rule Object
				x.Devices[data_udn]={};
	            delete x.Devices[data_udn];
				wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,x);	
			}			
			
			//timer_rule.changeWhenField(x);			
			e.preventDefault();
		});	
		//Check mark handler End
		        
        if (x.SelectedDayOrRange == undefined && defaultFlag === false) {       
        	x.SelectedDayOrRange = "Mon-Tue-Wed-Thu-Fri-Sat-Sun";
            tempSelectedDayOrRange = wemo.items['Daily'];
        }
        else if(x.SelectedDayOrRange == undefined && defaultFlag === true)
        {
        	x = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
        	x.SelectedDayOrRange = "Mon-Tue-Wed-Thu-Fri-Sat-Sun";
            tempSelectedDayOrRange = wemo.items['Daily'];
        }
        else {

            if (x.SelectedDayOrRange == "Weekday" || x.SelectedDayOrRange == "Weekend" || x.SelectedDayOrRange == "Daily") {
                if (x.SelectedDayOrRange == "Weekday") {
                    tempSelectedDayOrRange = wemo.items['WeekdaysNoDetails'];
                }
                else if (x.SelectedDayOrRange == "Weekend") {
                    tempSelectedDayOrRange = wemo.items['WeekendsNoDetails'];
                }
                else {
                    tempSelectedDayOrRange = wemo.items[x.SelectedDayOrRange];
                }
            }
            else if (x.SelectedDayOrRange == "Weekdays" || x.SelectedDayOrRange == "Weekends" || x.SelectedDayOrRange == "Daily") {
                if (x.SelectedDayOrRange == "Weekdays") {
                    tempSelectedDayOrRange = wemo.items['WeekdaysNoDetails'];
                }
                else if (x.SelectedDayOrRange == "Weekends") {
                    tempSelectedDayOrRange = wemo.items['WeekendsNoDetails'];
                }
                else {
                    tempSelectedDayOrRange = wemo.items[x.SelectedDayOrRange];
                }
            }
			else if ( x.SelectedDayOrRange == wemo.items['WeekdaysDetails'] ) {
				tempSelectedDayOrRange =  wemo.items['WeekdaysNoDetails'];
			}
			else if ( x.SelectedDayOrRange == wemo.items['WeekendsDetails'] ) {
				tempSelectedDayOrRange =  wemo.items['WeekendsNoDetails'];
			}
			else if ( x.SelectedDayOrRange == wemo.items['DailyDetails'] ) {
				tempSelectedDayOrRange =  wemo.items['Daily'];
			}
            else {

                var strDays = x.SelectedDayOrRange;
                var arrDays = strDays.split("-");
                var displaySelectedVal = [];

                if (arrDays.length > 0) {
                    for (var i = 0; i < arrDays.length; i++) {

                        var temp = arrDays[i];
                        
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
                    }

                    if (arrDays.length == 1) {
                        tempSelectedDayOrRange = displaySelectedVal;
                    }
                    else {
                        tempSelectedDayOrRange = displaySelectedVal.join(", ");
                    }

                }
            }

        }

        if (x.When.EndTime == 0) x.When.EndTime = timestamp.MIDNIGHT_END_TIME;
        else if (!x.When.EndTime) x.When.EndTime = parseInt(x.When.StartTime)+parseInt(x.When.RuleDuration);
		
        if (x.When.StartTime == undefined || x.When.EndTime == undefined) {
            
			if(defaultFlag === true)
        	{
        		x = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW);
        	}   
			
			if ( !timer_rule.isSimpleWhen(x) ) {
				x.When.StartTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestHalfHour());
				x.When.EndTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestOneAndHalfHour());
				$("#timer_rule_when .select_time").empty().html(wemoUtil.convertMillisecondsToTF(x.When.StartTime, UP_TF_IS24) + " - " + wemoUtil.convertMillisecondsToTF(x.When.EndTime, UP_TF_IS24) + ", ");
				$("#timer_rule_when .action").empty().html( wemo.items['OnOff'] );				
			} else {
				x.When.StartTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestHalfHour());
				x.When.EndTime = "0";
				$("#timer_rule_when .select_time").empty().html(wemoUtil.convertMillisecondsToTF(x.When.StartTime, UP_TF_IS24) + ", ");
				
				
				 var flag_on = 0;
			     var flag_off = 0;

			        for (key in x.Devices) {
			            switch (x.Devices[key].StartAction) {
			                case 0:
			                    flag_off++;
			                    break;
			                case 1:
			                    flag_on++;
			                    break;
			            }
			        }
			       
			        if ((flag_on == 0 && flag_off == 0) || (flag_on > 0 && flag_off > 0)) {
			            $("#timer_rule_when .action").empty().html( wemo.items["Start"] );
			        }
			        else if (flag_on > 0 && flag_off == 0) {
			        	$("#timer_rule_when .action").empty().html( wemo.items["On"] );
			        }
			        else if (flag_on == 0 && flag_off > 0) {
			        	$("#timer_rule_when .action").empty().html( wemo.items["Off"] );
			        }
			}
			$("#timer_rule_when .select_day").html(tempSelectedDayOrRange);
			
			//for away mode
			if(soCheck == "1"){
	        	$("#timer_rule_when .action").empty().html( wemo.items["OnOff"] );
	        	if(x.When.EndTime = "0"){
	        		x.When.EndTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestOneAndHalfHour());
	        		$("#timer_rule_when .select_time").empty().html(wemoUtil.convertMillisecondsToTF(x.When.StartTime, UP_TF_IS24) + " - " + wemoUtil.convertMillisecondsToTF(x.When.EndTime, UP_TF_IS24) + ", ");
	        	}
	        }
			
        } else {
			if ( !timer_rule.isSimpleWhen(x) ) {
				if (x.When.StartSRSS != undefined && x.When.EndSRSS != undefined) {

					if ( x.When.onSRSS_Title != undefined ) {
						var tempStartSRSS = x.When.onSRSS_Title;
					} 
					else {
						if (x.When.StartSRSS == "Sunrise") {
							var tempStartSRSS = wemo.items['SunRise'];
						}
						else if (x.When.StartSRSS == "Sunset") {
							var tempStartSRSS = wemo.items['SunSet'];
						}
						else {
							var tempStartSRSS = x.When.StartSRSS;
						}
					}
					
					if ( x.When.offSRSS_Title != undefined ) {
						var tempEndSRSS = x.When.offSRSS_Title;
					}
					else {
						if (x.When.EndSRSS == "Sunrise") {
							var tempEndSRSS = wemo.items['SunRise'];
						}
						else if (x.When.EndSRSS == "Sunset") {
							var tempEndSRSS = wemo.items['SunSet'];
						}
						else {
							var tempEndSRSS = x.When.EndSRSS;
						}
					}

					$("#timer_rule_when .select_time").text(tempStartSRSS + " - " + tempEndSRSS + ", ");
				} else if (x.When.StartSRSS == undefined && x.When.EndSRSS != undefined) {

					if ( x.When.offSRSS_Title != undefined ) {
						var tempEndSRSS = x.When.offSRSS_Title;
					}
					else {
						if (x.When.EndSRSS == "Sunrise") {
							var tempEndSRSS = wemo.items['SunRise'];
						}
						else if (x.When.EndSRSS == "Sunset") {
							var tempEndSRSS = wemo.items['SunSet'];
						}
						else {
							var tempEndSRSS = x.When.EndSRSS;
						}
					}

					$("#timer_rule_when .select_time").empty().html(wemoUtil.convertMillisecondsToTF(x.When.StartTime, UP_TF_IS24) + " - " + tempEndSRSS + ", ");
				}  else if (x.When.StartSRSS != undefined && x.When.EndSRSS == undefined) {

					if ( x.When.onSRSS_Title != undefined ) {
						var tempStartSRSS = x.When.onSRSS_Title;
					} 
					else {
						if (x.When.StartSRSS == "Sunrise") {
							var tempStartSRSS = wemo.items['SunRise'];
						}
						else if (x.When.StartSRSS == "Sunset") {
							var tempStartSRSS = wemo.items['SunSet'];
						}
						else {
							var tempStartSRSS = x.When.StartSRSS;
						}
					}

					$("#timer_rule_when .select_time").empty().html(tempStartSRSS + " - " + wemoUtil.convertMillisecondsToTF(x.When.EndTime, UP_TF_IS24) + ", ");
				} else if (x.When.StartSRSS == undefined && x.When.EndSRSS == undefined) {
					$("#timer_rule_when .select_time").empty().html(wemoUtil.convertMillisecondsToTF(x.When.StartTime, UP_TF_IS24) + " - " + wemoUtil.convertMillisecondsToTF(x.When.EndTime, UP_TF_IS24) + ", ");
				}
				$("#timer_rule_when .action").empty().html( wemo.items['OnOff'] );
			} else {	
				if(x.When.StartSRSS != undefined && (x.When.StartSRSS === "Sunrise" || x.When.StartSRSS === "Sunset")){		
				
					if ( x.When.SRSS_Title != undefined ) {
						$("#timer_rule_when .select_time").empty().html(x.When.SRSS_Title+", ");      
					} else {
						if(x.When.StartSRSS === "Sunrise"){var startSRSSVal ='SunRise';}
						if(x.When.StartSRSS === "Sunset"){var startSRSSVal = 'SunSet';}

						$("#timer_rule_when .select_time").empty().html(wemo.items[startSRSSVal] + ", ");
					}  		       		
            		
            	}
            	else{
					$("#timer_rule_when .select_time").empty().html(wemoUtil.convertMillisecondsToTF(x.When.StartTime, UP_TF_IS24) + ", ");
            	} 

				var flag_on = 0;
				     var flag_off = 0;
	
				        for (key in x.Devices) {
				            switch (x.Devices[key].StartAction) {
				                case 0:
				                    flag_off++;
				                    break;
				                case 1:
				                    flag_on++;
				                    break;
				            }
				        }
				       
				        if ((flag_on == 0 && flag_off == 0) || (flag_on > 0 && flag_off > 0)) {
				            $("#timer_rule_when .action").empty().html( wemo.items["Start"] );
				        }
				        else if (flag_on > 0 && flag_off == 0) {
				        	$("#timer_rule_when .action").empty().html( wemo.items["On"] );
				        }
				        else if (flag_on == 0 && flag_off > 0) {
				        	$("#timer_rule_when .action").empty().html( wemo.items["Off"] );
				        }

				        if(soCheck == "1"){
				        	$("#timer_rule_when .action").empty().html( wemo.items["OnOff"] );
				        }
				//$("#timer_rule_when .action").empty().html( wemo.items['On'] );
			}
            $("#timer_rule_when .select_day").html(tempSelectedDayOrRange);
        }


        if (typeof(x.RuleName) == "undefined") {
        	if(soCheck =="1"){
        		x.RuleName = wemo.items['Away_Mode'];
        	}else{
        		x.RuleName =  wemo.items['NewTimerRule'];
        	}
        }
        $("#timer_rule_rule_name  .rule_name_container").html(x.RuleName);


        wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
 
        //To return back to home page: device list tab
        $(".wemo_logo").on("tap", function (e) {
            if (e.target.nodeName != "IMG") {
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }
        });
 

        $("#timer_rule_selected_device").find("li").on("tap", function () {
            window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE, $(this).attr("data-udn"));
            window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE_NAME, $(this).attr("data-fName"));
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
            wemoUtil.loadUrl(filePath.WHAT_HAPPENS);
        });

        $("#timer_rule_when").on("tap", function () {
        	if(soCheck !="1"){
        		window.sessionStorage.setItem(sessionStore.DEFAULT_SETTING, true);
            }
			
        	nativeUtilPlugin.execute(null, null, actions.SHOW_SPLASH_ON_LOADING, []);
            if ( !timer_rule.isSimpleWhen(x) ) {
				wemoUtil.loadUrl(filePath.TIMER_RULE_WHEN);
			} else {
				wemoUtil.loadUrl(filePath.WHEN);
			}
        });

        $("#timer_rule_rule_name").on("tap", function () {
            nativeUtilPlugin.execute(null, null, actions.SHOW_SPLASH_ON_LOADING, []);
            wemoUtil.loadUrl(filePath.RULE_NAME);
        });
		
		$('#what_is_this').on("pointerdown", function () {
			
			$("#below_section_whats_popup").html(sessionStore.VACATION_MODE_TEXT);
			$("#footer_line").html(sessionStore.VACATION_MODE_FOOTER);
			$("#what_is_popup").popup( "open" );
//			$("#animation_popup_close" ).popup( "close" );
//			wemoUtil.loadUrl(filePath.VIDEO_DEMO);
		});	
		 
		$("#animation_popup_close").on("tap", function (e) {
            $("#what_is_popup").popup('close');
            e.preventDefault();
        });
			
		 $("#timer_rule_save_btn").on('tap', function () {
			 wemoUtil.infoLog(TAG, 'Save Button Tapped');
             var isFirmWareSupported;
             var len = Object.keys(x.Devices).length;
             var issupported = true;
             if (len == 0) {
                 $('body').on('touchmove', function (e) {
                     e.preventDefault();
                 });
                 setTimeout(
                     function () {
                         $('#device_not_selected').popup("open");
                     },
                     timeout.POPUP_DISPLAY_DELAY
                 );
                 return;
             }
			 wemoUtil.infoLog(TAG, 'nativeUtilPlugin to SHOW_SPLASH_ON_LOADING');
             nativeUtilPlugin.execute(null, null, actions.SHOW_SPLASH_ON_LOADING, []);


             var prohibitSaving = timer_rule.ST_ET_areSAME(x);
             if (prohibitSaving) {
				 wemoUtil.infoLog(TAG, 'prohibitSaving');
                 setTimeout(
                     function () {
                         nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                         setTimeout(
                             function () {
                                 $("#identicalTimeHeader").html(wemo.items['IdenticalTimeHeader']);
                                 $("#identicalOnOffTimeText").html(wemo.items['IdenticalTimeNotification']);
                                 $("#identicalOnOffTime").popup("open");
                             },
                             timeout.POPUP_DISPLAY_DELAY
                         );
                         return;
                     },
                     timeout.POPUP_DISPLAY_DELAY
                 );
             }
             else {
				 wemoUtil.infoLog(TAG, 'no prohibitSaving');
                 if (((x.When.OnModeOffset != undefined && x.When.OnModeOffset != 0 )
					 || (x.When.OffModeOffset != undefined && x.When.OffModeOffset != 0))
					 || (x.When.StartSRSSoffset != undefined) || soCheck == "1") {
					 wemoUtil.infoLog(TAG, 'first if statement');
                     count = 0;
                     for (key in x.Devices) {

                         if (key.indexOf("uuid") === -1 ) {
                             var bridgeudn = window.sessionStorage.getItem(sessionStore.LED_BRIDGE_UDN_ID);
                             checked_udn_array[count] = bridgeudn + ":" + key;
                         } else
                             checked_udn_array[count] = key;

                         if (networktype == null || networktype == networkType.HOME_NETWORK)
						 {
							 wemoUtil.infoLog(TAG, 'networktype null or homeNetwork');
                             if (key.indexOf("uuid") == -1) {
								 wemoUtil.infoLog(TAG, 'uuid index matches -1');
                                 var bridgeudn = window.sessionStorage.getItem(sessionStore.LED_BRIDGE_UDN_ID);
								 wemoUtil.infoLog(TAG, 'start firmware check');
                                 devicePlugin.execute(
                                     function (params) {
                                         if (params === "true") {
                                             isFirmWareSupported = params;
                                         } else {
                                             isFirmWareSupported = params;
                                             var ruleConflictLocalizedmsg = ( soCheck == "1" ) ? wemo.items['FirmwareVerCheckText'] : wemo.items['FirmwareVerCheckText_OFFSET'];
                                             $("#FirmwareVerCheckText").html(ruleConflictLocalizedmsg);
                                             nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                             setTimeout(function () {
                                                     $("#fw_ver_check").popup("open");
                                                 },
                                                 300
                                             );
                                         }
                                     },
									 timer_rule.reportError,
                                     actions.GET_FIRMWARE_VERSION_SO,
                                     [bridgeudn]
                                 );
                             }
                             else {
								 wemoUtil.infoLog(TAG, 'no uuid -1 index match');
								 wemoUtil.infoLog(TAG, 'start firmware check');
                                 devicePlugin.execute(
                                     function (params) {
                                         if (params === "true") {
                                             isFirmWareSupported = params;
                                         } else {
                                             isFirmWareSupported = params;
                                             var ruleConflictLocalizedmsg = ( soCheck == "1" ) ? wemo.items['FirmwareVerCheckText'] : wemo.items['FirmwareVerCheckText_OFFSET'];
                                             $("#FirmwareVerCheckText").html(ruleConflictLocalizedmsg);
                                             nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                             setTimeout(function () {
                                                     $("#fw_ver_check").popup("open");
                                                     nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,["", wemo.items['RULE_STATUS_SENDING_DB']]);
                                                 },
                                                 300
                                             );
                                         }
                                     },
									 timer_rule.reportError,
                                     actions.GET_FIRMWARE_VERSION_SO,
                                     [key]
                                 );
                             }

                             /*	if(isFirmWareSupported == "false"){
                              return;
                              }*/

                         } else if (networktype == networkType.REMOTE_WIFI || networktype == networkType.REMOTE_MOBILE) {
							 wemoUtil.infoLog(TAG, 'networktype remote');

                             wemoUtil.infoLog(TAG, 'Remote getFirmwareVersion');

                             devicePlugin.execute(
                                 function (enabled) {
                                     wemoUtil.infoLog(TAG, 'Remote enabled::: ' + enabled);
                                     if (enabled) {
                                         var firmwareArray = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.FIRMWARE_VERSION_DATA);
                                         wemoUtil.infoLog(TAG, 'firmwareArray ::: ' + JSON.stringify(firmwareArray));

                                         for (var i = 0; i < firmwareArray.length; i++) {

                                             wemoUtil.infoLog(TAG, "UDN value : " + key + "  Array UDN value : " + firmwareArray[i]["udn"]);
                                             if (firmwareArray[i]["udn"] == key) {
                                                 var firmwareVerString = firmwareArray[i]["devicefirmware"];
                                                 var firmwareVerAry = [];
                                                 var firmwareVer;
                                                 var isLinkConnectedFW = false;

                                                 // as link connected hardware do not have "." in devicefirmware
                                                 if(firmwareVerString.indexOf(".") != -1){
                                                     firmwareVerAry = firmwareVerString.split('.');
                                                     firmwareVer = parseInt(firmwareVerAry[2]);
                                                 }else{
                                                     isLinkConnectedFW = true;
                                                 }

                                                 wemoUtil.infoLog(TAG, 'firmware version : ' + firmwareVer + ' SO_FW_SUPPORT: ' + configValue.SO_FW_SUPPORT);

                                                 if (firmwareVer >= configValue.SO_FW_SUPPORT || isLinkConnectedFW) {
                                                     wemoUtil.infoLog(TAG, 'firmware is supported ');
                                                     isFirmWareSupported = "true";
                                                 }
                                                 else {
                                                     wemoUtil.infoLog(TAG, 'firmware is not supported SO_RULE');
                                                     var ruleConflictLocalizedmsg = ( soCheck == "1" ) ? wemo.items['FirmwareVerCheckText'] : wemo.items['FirmwareVerCheckText_OFFSET'];
                                                     $("#FirmwareVerCheckText").html(ruleConflictLocalizedmsg);
                                                     nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                                     setTimeout(function () {
                                                             $("#fw_ver_check").popup("open");
                                                             nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,["", wemo.items['RULE_STATUS_SENDING_DB']]);
                                                         },
                                                         300
                                                     );
                                                     isFirmWareSupported = "false";

                                                 }

                                             }

                                         }
                                     }
                                     /*else {
                                      wemoUtil.loadUrl(filePath.REMOTE_NOT_AVAILABLE);
                                      }*/
                                 },
								 timer_rule.reportError,
                                 actions.IS_REMOTE_ENABLED,
                                 []
                             );

                         }

                         count++
                         window.sessionStorage.setItem("checked_udn_array", checked_udn_array);
                     }

                 }

                 /*		 if(isFirmWareSupported === "false"){
                  return;
                  }*/
				 wemoUtil.infoLog(TAG, 'start Math for Rules');
                 if (window.sessionStorage.getItem("SO_EDIT_CHECK") == "1") {
                     soCheck = 1;
                 }
                 if (soCheck == "1") {
                     window.sessionStorage.removeItem("SO_EDIT_CHECK")
                     window.sessionStorage.setItem("SO", "1");


					 timer_rule.simulatedMetaData(checked_udn_array);

                     window.sessionStorage.removeItem(sessionStore.isEdit);
                     if (Object.keys(x.Devices).length > 0) {

                         for (key in x.Devices) {
                             wemoUtil.infoLog("key_timer11 " + key);
                         }
                         if (!timer_rule.isSimpleWhen(x)) {
                             x.RuleType = sessionStore.TIME_INTERVAL;

                             var StartTimeAM = 'false';
                             var EndTimeAM = 'false';
                             StartTimeAM = (wemoUtil.convertMillisecondsToAMPM(x.When.StartTime).lastIndexOf("am") != -1) ? 'true' : 'false';
                             EndTimeAM = (wemoUtil.convertMillisecondsToAMPM(x.When.EndTime).lastIndexOf("am") != -1) ? 'true' : 'false';
                             if (x.When.EndTime < x.When.StartTime) {
                                 if (StartTimeAM == EndTimeAM) {
                                     x.When.RuleDuration = 86400 - (parseInt(x.When.StartTime) - parseInt(x.When.EndTime));
                                 } else {
                                     x.When.RuleDuration = (86400 - (parseInt(x.When.StartTime))) + parseInt(x.When.EndTime);
                                 }
                             } else {
                                 x.When.RuleDuration = x.When.EndTime - x.When.StartTime;
                             }

                         } else {
                             x.RuleType = sessionStore.SIMPLE_SWITCH;
                             x.When.RuleDuration = "0";
                         }

                         //-------------------SRSS--------------------
                         //Plug-in Call To Get Firmware Version SRSS
						 wemoUtil.infoLog(TAG, 'SRSS Check');
                         if ((x.When.StartSRSS != undefined && x.When.EndSRSS == undefined) || (x.When.StartSRSS == undefined && x.When.EndSRSS != undefined) || (x.When.StartSRSS != undefined && x.When.EndSRSS != undefined)) {
                             if (Object.keys(x.Devices).length > 0) {
                                 for (key in x.Devices) {

                                     if (x.Devices[key].SelectedLedValue == 1) {
                                         var bridgeudn = window.sessionStorage.getItem(sessionStore.LED_BRIDGE_UDN_ID);
                                         x.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(bridgeudn);
                                     }
                                     else {
                                         x.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                                     }

                                     wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
                                 }
                             }
                         }

                         wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);

                         if (isFirmWareSupported === "false") {
                             x.When.isFirmWareSupported = isFirmWareSupported;
                             return;
                         }

                         if (x.When.isFirmWareSupported != undefined && x.When.isFirmWareSupported === "false") {
                             nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                             setTimeout(function () {
                                     $("#sunrise_firmware_upgrade").popup("open");
                                 },
                                 300);
                         } else {
                             if (!timer_rule.isSimpleWhen(x)) {
                                 timer_rule.saveNewTimerRule_RULES_RULEDEVICES_SO(x.RuleType, x);

                             } else {
                                 saveNewRule_RULES_RULEDEVICES(x.RuleType, x);
                             }
                         }
                     } else {
                         wemoUtil.infoLog("save disable");
                     }
                 } else {
                     window.sessionStorage.removeItem(sessionStore.isEdit);
                     window.sessionStorage.removeItem(sessionStore.DRAWER_FLAG);
                     window.sessionStorage.removeItem(sessionStore.DEFAULT_SETTING);

                     if (Object.keys(x.Devices).length > 0) {
                         for (key in x.Devices) {
                             for (key2 in x.Devices[key]) {
                                 wemoUtil.infoLog("key2 " + key2 + " value " + x.Devices[key][key2]);
                             }
                         }


                         if (!timer_rule.isSimpleWhen(x)) {
                             x.RuleType = sessionStore.TIME_INTERVAL;

                             var StartTimeAM = 'false';
                             var EndTimeAM = 'false';
                             StartTimeAM = (wemoUtil.convertMillisecondsToAMPM(x.When.StartTime).lastIndexOf("am") != -1) ? 'true' : 'false';
                             EndTimeAM = (wemoUtil.convertMillisecondsToAMPM(x.When.EndTime).lastIndexOf("am") != -1) ? 'true' : 'false';
                             if (x.When.EndTime < x.When.StartTime) {
                                 if (StartTimeAM == EndTimeAM) {
                                     x.When.RuleDuration = 86400 - (parseInt(x.When.StartTime) - parseInt(x.When.EndTime));
                                 } else {
                                     x.When.RuleDuration = (86400 - (parseInt(x.When.StartTime))) + parseInt(x.When.EndTime);
                                 }
                             } else {
                                 x.When.RuleDuration = x.When.EndTime - x.When.StartTime;
                             }

                         } else {
                             x.RuleType = sessionStore.SIMPLE_SWITCH;
                             x.When.RuleDuration = "0";
                         }

                          if (Object.keys(x.Devices).length > 0) {
                               for (key in x.Devices) {
                                 if (key.indexOf("uuid") === -1) {
                                    if(parseInt(x.When.StartTime) === 0) {
                                         x.When.StartTime = 86400;
                                    }
                                  }
                               }
                           }

                         //-------------------SRSS--------------------
                         //Plug-in Call To Get Firmware Version SRSS
						 wemoUtil.infoLog(TAG, 'Second SRSS Check');
                         if ((x.When.StartSRSS != undefined && x.When.EndSRSS == undefined)
							 || (x.When.StartSRSS == undefined && x.When.EndSRSS != undefined)
							 || (x.When.StartSRSS != undefined && x.When.EndSRSS != undefined)) {
                             if (Object.keys(x.Devices).length > 0) {
                                 for (key in x.Devices) {
                                     if (x.Devices[key].SelectedLedValue == 1) {
                                         var bridgeudn = window.sessionStorage.getItem(sessionStore.LED_BRIDGE_UDN_ID);
                                         x.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(bridgeudn);
                                     }
                                     else {
                                         x.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
                                     }

                                     wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
                                 }
                                 if(window.sessionStorage.getItem("Unsupported_SRSS_FW")== "1"){
                                     x.When.isFirmWareSupported = "false";
                                     window.sessionStorage.removeItem("Unsupported_SRSS_FW");
                                     wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
                                 }
                             }
                         }

                         wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
                         if (isFirmWareSupported === "false") {
                             x.When.isFirmWareSupported = isFirmWareSupported;
                             return;
                         }
                         if (x.When.isFirmWareSupported != undefined && x.When.isFirmWareSupported === "false") {
                             nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                             setTimeout(function () {
                                     $("#sunrise_firmware_upgrade").popup("open");
                                 },
                                 300);
                         } else {
                             if (!timer_rule.isSimpleWhen(x)) {
                                 if(IS_RULE_NATIVE){
                                     setTimeout(function () {
                                         rulesTabPlugin.execute(
                                             function (params) {

                                                 nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                             },
											 timer_rule.reportError,
                                             actions.TIMER_RULE,
                                             [x.RuleType, x]
                                         );
                                     },1000);

                                 }
                                 else
                                 {
									 wemoUtil.infoLog(TAG, 'Call saveNewTimerRule_RULES_RULEDEVICES for timer_rule.isSimpleWhen');
                                     saveNewTimerRule_RULES_RULEDEVICES(x.RuleType, x);
                                 }
                             } else {
                                 if(IS_RULE_NATIVE)
                                 {
                                     setTimeout(function () {
                                         rulesTabPlugin.execute(
                                             function (params) {

                                                 nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                             },
											 timer_rule.reportError,
                                             actions.TIMER_RULE,
                                             [x.RuleType, x]
                                         );
                                     },1000);

                                 }
                                 else
                                 {
									 wemoUtil.infoLog(TAG, 'Call saveNewTimerRule_RULES_RULEDEVICES for else statement for if(timer_rule.isSimpleWhen)');
                                     saveNewRule_RULES_RULEDEVICES(x.RuleType, x);
                                 }

                             }
                         }
                     } else {
                         $('body').on('touchmove', function (e) {
                             e.preventDefault();
                         });
                         $('#device_not_selected').popup("open");
                     }
                 }
             }
		});

		//FW Compatibility based upgrade
		 $("#update_nw_btn").on("click", function(){
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
		
		$("#so_rule_cancel").on('tap', function () {
			window.sessionStorage.removeItem(sessionStore.isEdit);	
			if (parseInt(JSON.parse(window.sessionStorage.getItem(sessionStore.RULES_DATA)).length) > 0) {
				wemoUtil.loadUrl(filePath.ENABLED_RULES);
			} else {
				wemoUtil.loadUrl(filePath.CREATE_RULE);
			}
		});
		
        //SRSS firmware upgrade

        $("#sunrise_firmware_upgrade_updatenow").on("click", function () {
            var pendingFirmware = "pendingFirmware";
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.PENDING_FIRMWARE, pendingFirmware);
            $("#sunrise_firmware_upgrade").popup("close");

           	if ( !timer_rule.isSimpleWhen(x) ) {
				x.RuleType = sessionStore.TIME_INTERVAL;
			} else {
				x.RuleType = sessionStore.SIMPLE_SWITCH;
			}
            if (Object.keys(x.Devices).length > 0) {
                for (key in x.Devices) {
                    if(x.Devices[key].SelectedLedValue == 1)
					{
                        var bridgeudn  = window.sessionStorage.getItem(sessionStore.LED_BRIDGE_UDN_ID);
                        x.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(bridgeudn);
					}
					else
					{
						x.When.isFirmWareSupported = wemoUtil.getFirmwareVersionSRSS(key);
					}
                    
                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
                }
            }
            if ( !timer_rule.isSimpleWhen(x) ) {
            	if(soCheck =="1"){
            		timer_rule.saveNewTimerRule_RULES_RULEDEVICES_SO(x.RuleType, x);
            	}
            	else{
            		window.sessionStorage.setItem("rule_Id_identifier","1");
            		saveNewTimerRule_RULES_RULEDEVICES(x.RuleType, x);
            	}
            } else {
            	saveNewRule_RULES_RULEDEVICES(x.RuleType, x);
            }
            //wemoUtil.loadUrl(filePath.MORE_NEW_FIRMWARE);
        });

        $('#sunrise_firmware_upgrade_later').on('click', function () {
            //alert("Save Rule");
            $("#sunrise_firmware_upgrade").popup('close');
            if ( !timer_rule.isSimpleWhen(x) ) {
				x.RuleType = sessionStore.TIME_INTERVAL;
			} else {
				x.RuleType = sessionStore.SIMPLE_SWITCH;
			}
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
            if ( !timer_rule.isSimpleWhen(x) ) {
            	if(soCheck == "1"){
            		timer_rule.saveNewTimerRule_RULES_RULEDEVICES_SO(x.RuleType, x);
            	}
            	else{
            		window.sessionStorage.setItem("rule_Id_identifier","1");
            		saveNewTimerRule_RULES_RULEDEVICES(x.RuleType, x);
            	}
            } else {
            	saveNewRule_RULES_RULEDEVICES(x.RuleType, x);
            }
        });

        $("#identicalOnOffTimeOkBtn").on("tap", function(){
            $("#identicalOnOffTime").popup("close");
        });

        $("#rule_can_not_save_ok").on('pointerdown', function () {
            alert("Ok");
        });

        $('#timer_rule_cancel_btn').on("tap", function () {
			window.sessionStorage.removeItem(sessionStore.isEdit);	
			window.sessionStorage.removeItem(sessionStore.DEFAULT_SETTING);
            if (parseInt(JSON.parse(window.sessionStorage.getItem(sessionStore.RULES_DATA)).length) > 0) {
                wemoUtil.loadUrl(filePath.ENABLED_RULES);
            } else {
                wemoUtil.loadUrl(filePath.CREATE_RULE);
            }
			window.sessionStorage.removeItem(sessionStore.HOUSE_SITTER_CHECK);
        });

        var msg;
        var state = "working";
        if (state === "working") {
            msg = wemo.items['RULE_STATUS_REFRESHING_DB'];
        } else if (state === "something") {
            msg = wemo.items['AppStatusWaiting'];
        } else if (state === "something") {
            msg = wemo.items['AppStatusWorking'];
        } else if (state === "something") {
            msg = wemo.items['RULE_STATUS_CHECKING_CONFLICTS'];
        } else if (state === "something") {
            msg = wemo.items['RULE_STATUS_SENDING_DB'];
        } else if (state === "something") {
            msg = ' ';
            flag = true;

            $(".ui-loader").css({
                background: "url('../img/Actions-dialog-ok-apply-icon.png') no-repeat scroll 119px center #000000",
                height: "44px"
            });
        }
        //new_rule.showModal(msg);

    },
	
	deselectDevice: function (udn, drawer, x) {        
		drawer.children().removeClass('div_bg_green');
		if (drawer.is(":visible")) drawer.slideToggle("slow");	
		$('div [data-udn="'+udn+'"]').find('.action_subHeader').empty();
		$('div [data-udn="'+udn+'"] ').find('.check_mark').hide();
		
		if(wemoUtil.isMakerDevice(udn)){
			udn = wemoUtil.getMakerSwithUDN(udn);
		}
		//Delete from Rule Object
		x.Devices[udn]={};
		delete x.Devices[udn];
		wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW,x);	
		timer_rule.changeWhenField(x);	
    },

    bindEvents: function () {
        document.addEventListener('online', timer_rule.onOnline, false);
        document.addEventListener('offline', timer_rule.onOffline, false);
        document.addEventListener("backbutton", timer_rule.onBackPress, false);
        document.addEventListener("pause", timer_rule.onPause, false);
        document.addEventListener("resume", timer_rule.onResume, false);
    },

    onOffline: function () {
    	wemoUtil.infoLog(TAG + "offLine");
    },

    onOnline: function () {
    	wemoUtil.infoLog(TAG + "onLine");
    },

    onBackPress: function () {
        if ($(".more_tab").is(":visible")) {
            $(".more_tab").hide();
            $('body').find('.modalWindow').transition({opacity: 0}, 400, function () {
                $(this).removeClass('isOpen');
            });
        }
        else {
            wemoUtil.loadPreviousUrl();
        }
        window.sessionStorage.removeItem(sessionStore.HOUSE_SITTER_CHECK);
    },

    onPause: function () {
    	wemoUtil.infoLog(TAG + "onPause");
    },

    onResume: function () {
    	wemoUtil.infoLog(TAG + "onResume");
    },

    reportError: function (e) {
    	wemoUtil.infoLog(TAG + "reportError called Plugin Error!!!!   " + e);
		wemoUtil.hideModal();
    },

    showModal: function (msg) {
        $("body").append('<div id="mask" class="modalWindow"/>');

        $.mobile.showPageLoadingMsg("a", msg);
    },
	
	deviceListBorder: function(){
		 var switch_list = $("#select_").find(".select_switches_list").length;
		if(switch_list===1){
			$(".select_switches_list").addClass("more_li_clone");
		}else if(switch_list === 2){
			$(".select_switches_list:first").addClass('more_li_clone more_li_clone_top');
			$(".select_switches_list:last").addClass('more_li_clone more_li_clone_bottom');
		}else if(switch_list >= 3){
			$(".select_switches_list:first").addClass('more_li_clone more_li_clone_top');
			$(".select_switches_list:last").addClass('more_li_clone more_li_clone_bottom');
			$(".select_switches_list").not(".select_switches_list:first, .select_switches_list:last").addClass('more_li_clone more_li_clone_no_radius');
		}
	},
		
	showDevices: function(action_device_type, x) {  
		var isMakerDevicetype = false;
		
		if(action_device_type == actions.SELECT_MAKER){
			isMakerDevicetype = true;
		}
		var params = wemoUtil.getDevices(action_device_type);


		if (params != null && params.length > 0 && params[0] != 0)
		{
			var html="";
			var ledspecificHtml = "";
			
			$.each(params,function(inx)
			{		
				var isMomentarySwitch = false;
				if(isMakerDevicetype){
					if(params[inx].SwitchMode == "1"){
						isMomentarySwitch = true;
					}
					else{
						isMomentarySwitch = false;
					}
				}
				if(isMomentarySwitch){
					if(soCheck != "1")
						html = html + '<div class="select_switches_list" data-udn="' + params[inx].udn + '"><div class="display_table padding_left_16px"><span class="display_cell"><span class="fname">'+params[inx].friendlyName+'</span><span class="action_subHeader"></span></span></div><span class="check_mark"></span></div>';
				}
				else {
					if(soCheck == "1"){
						html = html + '<div class="select_switches_list" data-udn="' + params[inx].udn + '"><div class="display_table padding_left_16px"><span class="display_cell"><span class="fname">'+params[inx].friendlyName+'</span><span class="action_subHeader"></span></span></div><span class="check_mark"></span></div>';		
					}else
						html = html + '<div class="select_switches_list" data-udn="' + params[inx].udn + '"><div class="display_table padding_left_16px"><span class="display_cell"><span class="fname">'+params[inx].friendlyName+'</span><span class="action_subHeader"></span></span></div><span class="check_mark"></span></div><div class="drawer" id="' + params[inx].udn + '"><div class="drawer_li until"><span>On until time</span></div><div class="drawer_li on"><span>On</span></div><div class="drawer_li off"><span>Off</span></div>';
				}
				
				if(params[inx].udn !== undefined && ((params[inx].udn).indexOf("uuid") === -1 || ((params[inx].udn).match(/dimmer/gi))))
				{
					var deviceID;

					if ((params[inx].udn).indexOf("uuid") === -1) {
						bridgeUDN = params[inx].bridgeudn;
						deviceID = params[inx].udn;
					} else {
						deviceID = params[inx].udn.split("-")[2];
						bridgeUDN =  "";
					}
					window.sessionStorage.setItem(sessionStore.LED_BRIDGE_UDN_ID, bridgeUDN);
					html+='<div class="timer-overlayScrollPicker led_timer_popup" data-role="popup" style="display:none;" data-deviceId="' + deviceID + '">';
					html+='<div class="scrollPickerContainer picker">';
					html+='<div class="picker_header_ScrollPicker"><span>On Untill Time</span></div>';
					html+='<div id="boxscroll' + deviceID + '" style="display:block;">';
					html+='</div>';
					html+='<div class="picker_footer" id="picker_footer' + deviceID + '" style="display:block;">'+
						 
						  '</div>'+
						  '<div class="clearboth"></div>'+
						  '</div></div></div></div>';
				} else {
					html+='</div>';
				}	
				
				if(isAwayModeInit & !isMomentarySwitch){
					timer_rule.markDevicesForAwayMode(params[inx].udn, x);
				}
				
			});		
			$('#rules_container #select_').append($(html));
			
			$.each(params,function(inx) {
				
				var deviceUDN = params[inx].udn;
				if(isMakerDevicetype){
					deviceUDN = wemoUtil.getMakerSwithUDN(deviceUDN);
					if ( (Object.keys(x.Devices).length > 0 ) && ( x.Devices[ deviceUDN ] ) ) {
						$('div [data-udn="'+params[inx].udn+'"] ').find('.check_mark').attr('display','block').show();	
						if(soCheck == "1"){
							$('div [data-udn="'+params[inx].udn+'"]').find('.action_subHeader').empty().html( "" ).show();
						}
						else if ( x.Devices[ deviceUDN ].SensorDuration == 0) {
							$('div [data-udn="'+params[inx].udn+'"]').find('.action_subHeader').empty().html( 'On until time' ).show();
							$('div [id="'+params[inx].udn+'"]').find('.until').addClass('div_bg_green');						
						} else {
							switch ( x.Devices[ deviceUDN ].StartAction ) {
							case 0: {$('div [data-udn="'+params[inx].udn+'"]').find('.action_subHeader').html( 'off' ).show();
									$('div [id="'+params[inx].udn+'"]').find('.off').addClass('div_bg_green');	break;}
							case 1: {$('div [data-udn="'+params[inx].udn+'"]').find('.action_subHeader').html( 'on' ).show();
									$('div [id="'+params[inx].udn+'"]').find('.on').addClass('div_bg_green'); break;}
							}
						}					
					}
				}
				else{
					if ( (Object.keys(x.Devices).length > 0 ) && ( x.Devices[ params[inx].udn ] ) ) {
					
						$('div [data-udn="'+params[inx].udn+'"] ').find('.check_mark').attr('display','block').show();

						if ( x.Devices[ params[inx].udn ].SensorDuration == 0) {
							if((params[inx].udn).indexOf("uuid") == -1 && soCheck !="1") {
								var fadein = x.Devices[params[inx].udn].FadeIn;
								var fadeout = x.Devices[params[inx].udn].FadeOut;
								var brightness = x.Devices[params[inx].udn].Brightness;
								brightness = brightness.replace(/%$/, '');

								var tempVal ='On until time';
								//var Disvalue = tempVal+' '+brightness+'% fade in: '+(fadein/10)+' fade out : '+(fadeout/10);

								if(fadein == "0")
									var disFadeIn = "default";

								else
									var disFadeIn = (fadein/10);

								if(fadeout == sessionStore.DEFAULT_FADEOUT_VALUE)
									var disFadeOut = "default";

								else
									var disFadeOut = (fadeout/10);

								disFadeIn = isNaN(disFadeIn)? disFadeIn: (disFadeIn/60)+' m';
								disFadeOut = isNaN(disFadeOut)? disFadeOut: (disFadeOut/60)+' m';
								var Disvalue = "Brightness:"+brightness+"%<br/>Fade in:"+disFadeIn+", Fade out:"+disFadeOut;

							} else if ((params[inx].udn).match(/dimmer/gi) && soCheck !== "1") {
								var fadein = x.Devices[params[inx].udn].FadeIn,
									fadeout = x.Devices[params[inx].udn].FadeOut,
									brightness = x.Devices[params[inx].udn].Brightness;

								var disFadeIn = (fadein === "0") ? wemo.items['defaultTime'] : parseInt(fadein, 10)/60 + "m";

								var disFadeOut = (fadeout === "3") ? wemo.items['defaultTime'] : parseInt(fadeout, 10)/60 + "m";


								var Disvalue = wemo.items['brightness'] + ":"+brightness+"<br/>" + wemo.items['fadeIn'] +":"+disFadeIn+", " +  wemo.items['fadeOut']+ ":"+disFadeOut;

							} else {
								var Disvalue = wemo.items['onUntilTime'];
							}
							if(soCheck == "1"){
								$('div [data-udn="'+params[inx].udn+'"]').find('.action_subHeader').html( "" ).show();
							}else{
								$('div [data-udn="'+params[inx].udn+'"]').find('.action_subHeader').html( Disvalue ).show();
							}
							$('div [id="'+params[inx].udn+'"]').find('.until').addClass('div_bg_green');
							//$('#'+params[inx].udn+' .drawer_li_dimmer').removeClass('div_bg_gray');

						} else {
							switch ( x.Devices[ params[inx].udn ].StartAction ) {
								case 0: {
											if((params[inx].udn).indexOf("uuid") == -1 && soCheck !="1")
											{
												var fadeout = x.Devices[params[inx].udn].FadeOut;
												var tempVal ='off';
												//var Disvalue = tempVal+' fade out : '+(fadeout/10);

												if(fadeout == sessionStore.DEFAULT_FADEOUT_VALUE)
													var disFadeOut = "default";

												else
													var disFadeOut = (fadeout/10);

												disFadeOut = isNaN(disFadeOut)? disFadeOut: (disFadeOut/60)+' m';
												var Disvalue = "Fade out : "+disFadeOut;
											} else if ((params[inx].udn).match(/dimmer/gi) && soCheck !== "1") {
												var fadeout = x.Devices[params[inx].udn].FadeOut;
												var disFadeOut = (fadeout === "3") ? wemo.items['defaultTime'] :  parseInt(fadeout, 10)/60 + "m";

												var Disvalue = wemo.items['fadeOut']+ ": "+disFadeOut;

											} else {
												var Disvalue = wemo.items['Off'];;
											}
										$('div [data-udn="'+params[inx].udn+'"]').find('.action_subHeader').empty().html( Disvalue ).show();
										$('div [id="'+params[inx].udn+'"]').find('.off').addClass('div_bg_green'); break;
										//$('#'+params[inx].udn+' .fadeout').removeClass('div_bg_gray'); break;
										}
								case 1: {
											if((params[inx].udn).indexOf("uuid") == -1 && soCheck !="1") {
												var fadein = x.Devices[params[inx].udn].FadeIn;
												var brightness = x.Devices[params[inx].udn].Brightness;
												brightness = brightness.replace(/%$/, '');

												var tempVal ='on';

												if(fadein == "0")
													var disFadeIn = "default";

												else
													var disFadeIn = (fadein/10);

												disFadeIn = isNaN(disFadeIn)? disFadeIn: (disFadeIn/60)+' m';
												var Disvalue = "Brightness:"+brightness+"%<br/>Fade in:"+disFadeIn;

											} else if ((params[inx].udn).match(/dimmer/gi) && soCheck !== "1") {
												var fadein = x.Devices[params[inx].udn].FadeIn;
												var brightness = x.Devices[params[inx].udn].Brightness;

												var disFadeIn = (fadein === "0") ? wemo.items['defaultTime'] : parseInt(fadein, 10)/60 + "m";

												var Disvalue = wemo.items['brightness'] + ":"+brightness+"<br/>" + wemo.items['fadeIn'] +":"+disFadeIn;

                                            } else {
												var Disvalue = wemo.items['On'];
											}
										$('div [data-udn="'+params[inx].udn+'"]').find('.action_subHeader').empty().html( Disvalue ).show();
										$('div [id="'+params[inx].udn+'"]').find('.on').addClass('div_bg_green'); break;
										//$('#'+params[inx].udn+' .fadein').removeClass('div_bg_gray');
										//$('#'+params[inx].udn+' .brightness').removeClass('div_bg_gray'); break;
										}
							}
						}
				} 
				}
			});
			
			this.deviceListBorder();		
			return params.length;
		}
		else
		{
			return 0;
		}
	},
	
	selectDevices : function(networktype,remoteEnable, x) {
		if (networktype==networkType.HOME_NETWORK || networktype==null)
		{
		   var numSwitches,numDimmers, numInsights, numMakers, numLedDevices;
		   
		   $('#rules_container #select_').empty();
		   numSwitches = this.showDevices(actions.SELECT_SWITCHES, x);
		   numDimmers = this.showDevices(actions.SELECT_DIMMERS, x);
		   numInsights = this.showDevices(actions.SELECT_INSIGHTS, x);
		   numMakers = this.showDevices(actions.SELECT_MAKER, x);
		   numLedDevices = this.showDevices(actions.SELECT_LED_DEVICES, x);		   

		   if (numSwitches + numDimmers + numInsights + numMakers + numLedDevices == 0) {
				var msg= wemo.items['DeviceNotFound'];
				alert(msg);
		   }
		   
		   var code = $('#rules_container').html();
		   var defaultSetting = window.sessionStorage.getItem(sessionStore.DEFAULT_SETTING);

		   if(numLedDevices == 1 && defaultSetting == null && isEdit == false && numSwitches === 0 && numInsights === 0 && numDimmers=== 0) {
			   var params = wemoUtil.getDevices(actions.SELECT_LED_DEVICES);

				$.each(params,function(inx) {
				   var data_udn = params[inx].udn;
				   timer_rule.defaultSelected(data_udn);
				});
		   }
		}
		else if (networktype==networkType.REMOTE_WIFI || networktype == networkType.REMOTE_MOBILE){
			if(remoteEnable){								
				var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
				var arrayDimmerObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DIMMER_DATA);
				var arrayInsightObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA);
				var arrayMakerObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA);
				var arrayLedObjects = [];

				//if(soCheck !="1")
			    //{
					var arrayLedObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_DATA);
					
					if(arrayLedObjects.length > 0)
					{
						var bridgeDetails = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_BRIDGE_UDN);	
						var wemoBridgeObj = bridgeDetails;
						var len = wemoBridgeObj.length;    
                        
                         for (var i=0; i<len; i++)
     	                 {
                        	 var udn  =  wemoBridgeObj[i].udn;
                        	 var macAddress  =  wemoBridgeObj[i].macAddress;
                        	 var pluginID = wemoBridgeObj[i].pluginId;	
                        	 window.sessionStorage.setItem(sessionStore.LED_BRIDGE_UDN_ID, udn);
     	                 }
					}
			    //}
				
				if((arraySwitchObjects.length + arrayDimmerObjects.length + arrayInsightObjects.length + arrayMakerObjects.length +  arrayLedObjects.length)>0){
					var html="";
					$('#rules_container #select_').html("");
					$.each(arraySwitchObjects,function(inx){						
						html = html + '<div class="select_switches_list" data-udn="' + arraySwitchObjects[inx][key.DEVICE_UDN] + '"><div class="display_table padding_left_16px"><span class="display_cell"><span class="fname">'+arraySwitchObjects[inx][key.DEVICE_FRIENDLY_NAME]+'</span><span class="action_subHeader"></span></span></div><span class="check_mark"></span></div><div class="drawer" id="' + arraySwitchObjects[inx][key.DEVICE_UDN] + '"><div class="drawer_li until"><span>On until time</span></div><div class="drawer_li on"><span>On</span></div><div class="drawer_li off"><span>Off</span></div></div>';
					});
					$.each(arrayDimmerObjects,function(inx){
						var deviceID = arrayDimmerObjects[inx][key.DEVICE_UDN].split("-")[2];
//						html = html + '<div class="select_switches_list" data-udn="' + arrayDimmerObjects[inx][key.DEVICE_UDN] + '"><div class="display_table padding_left_16px"><span class="display_cell"><span class="fname">'+arrayDimmerObjects[inx][key.DEVICE_FRIENDLY_NAME]+'</span><span class="action_subHeader"></span></span></div><span class="check_mark"></span></div><div class="drawer" id="' + arrayDimmerObjects[inx][key.DEVICE_UDN] + '"><div class="drawer_li until"><span>On until time</span></div><div class="drawer_li on"><span>on</span></div><div class="drawer_li off"><span>off</span></div></div>';
						html = html + '<div class="select_switches_list" data-udn="' + arrayDimmerObjects[inx][key.DEVICE_UDN] + '"><div class="display_table padding_left_16px"><span class="display_cell"><span class="fname">'+arrayDimmerObjects[inx][key.DEVICE_FRIENDLY_NAME]+'</span><span class="action_subHeader"></span></span></div><span class="check_mark"></span></div><div class="drawer" id="' + arrayDimmerObjects[inx][key.DEVICE_UDN] + '"><div class="drawer_li until"><span>On until time</span></div><div class="drawer_li on"><span>On</span></div><div class="drawer_li off"><span>Off</span></div>';
						html+='<div class="timer-overlayScrollPicker led_timer_popup" data-role="popup" style="display:none;" data-deviceId="' + arrayDimmerObjects[inx][key.DEVICE_UDN] + '">';
						html+='<div class="scrollPickerContainer picker">';
						html+='<div class="picker_header_ScrollPicker"><span>On Untill Time</span></div>';
						html+='<div id="boxscroll' + deviceID + '" style="display:block;">';
						html+='</div>';
						html+='<div class="picker_footer" id="picker_footer' + deviceID + '" style="display:block;">'+
							  '</div>'+
							  '<div class="clearboth"></div>'+
							  '</div></div></div></div>';

					});
					$.each(arrayInsightObjects,function(inx){                        	
						html = html + '<div class="select_switches_list" data-udn="' + arrayInsightObjects[inx][key.DEVICE_UDN] + '"><div class="display_table padding_left_16px"><span class="display_cell"><span class="fname">'+arrayInsightObjects[inx][key.DEVICE_FRIENDLY_NAME]+'</span><span class="action_subHeader"></span></span></div><span class="check_mark"></span></div><div class="drawer" id="' + arrayInsightObjects[inx][key.DEVICE_UDN] + '"><div class="drawer_li until"><span>On until time</span></div><div class="drawer_li on"><span>On</span></div><div class="drawer_li off"><span>Off</span></div></div>';
					});
					$.each(arrayMakerObjects,function(inx){                        	
						html = html + timer_rule.renderDataForRemoteMaker(arrayMakerObjects[inx][key.DEVICE_UDN], arrayMakerObjects[inx][key.DEVICE_FRIENDLY_NAME], arrayMakerObjects[inx][key.MAKER_SWITCHMODE]);
					});					
					$.each(arrayLedObjects,function(inx){                        	
						html = html + '<div class="select_switches_list" data-udn="' + arrayLedObjects[inx][key.DEVICE_MAC_ADDRESS] + '"><div class="display_table padding_left_16px"><span class="display_cell"><span class="fname">'+arrayLedObjects[inx][key.DEVICE_FRIENDLY_NAME]+'</span><span class="action_subHeader"></span></span></div><span class="check_mark"></span></div><div class="drawer" id="' + arrayLedObjects[inx][key.DEVICE_MAC_ADDRESS] + '"><div class="drawer_li until"><span>On until time</span></div><div class="drawer_li on"><span>On</span></div><div class="drawer_li off"><span>Off</span></div>';
						html+='<div class="timer-overlayScrollPicker led_timer_popup" data-role="popup" style="display:none;" data-deviceId="' + arrayLedObjects[inx][key.DEVICE_MAC_ADDRESS] + '">';
						//html+='<div class="display_table">';
						//html+='<div class="display_cell">';
						html+='<div class="scrollPickerContainer picker">';
						html+='<div class="picker_header_ScrollPicker"><span>On Untill Time</span></div>';
						html+='<div id="boxscroll' + arrayLedObjects[inx][key.DEVICE_MAC_ADDRESS] + '" style="display:block;">';
						
							//html+='<div class="drawer" id="' + params[inx].udn + '" style="display:block;">'+
							
							
						html+='</div>';
						html+='<div class="picker_footer" id="picker_footer' + arrayLedObjects[inx][key.DEVICE_MAC_ADDRESS] + '" style="display:block;">'+
							 
							  '</div>'+
							  '<div class="clearboth"></div>'+
							  '</div></div></div></div>';
					});
				    
					$('#rules_container #select_').html(html);	
					
					timer_rule.markEarlierCheckedDevice(arraySwitchObjects, x, "switches");
					timer_rule.markEarlierCheckedDevice(arrayDimmerObjects, x, "dimmers");
					timer_rule.markEarlierCheckedDevice(arrayInsightObjects, x, "insight");
					timer_rule.markEarlierCheckedDevice(arrayMakerObjects, x);
					timer_rule.markEarlierCheckedDevice(arrayLedObjects, x, "leds");
					
					this.deviceListBorder();
					
					   var defaultSetting = window.sessionStorage.getItem(sessionStore.DEFAULT_SETTING);
				   	   
					   if(arrayLedObjects.length == 1 && defaultSetting == null && isEdit == false && arraySwitchObjects.length == 0 && arrayDimmerObjects.length == 0 && arrayInsightObjects.length == 0)
					   {
				   		   var params = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_DATA);
					     	
							$.each(params,function(inx)
							{
							   var data_udn = params[inx][key.DEVICE_MAC_ADDRESS];
							   timer_rule.defaultSelected(data_udn);
							});
					   }
				}
				else {
					var msg= wemo.items['DeviceNotFound'];
					alert(msg);
				}	
								
			}else{
				navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {loadUrlTimeoutValue : 60000});
			}
		}	
	},
	
	/* simulatedRuleData action 
	 * @params udn list
	 */

	simulatedMetaData : function(checked_udn_array){
		deviceTabPlugin.execute(
				function(result) {
					wemoUtil.infoLog("simulatedMetaData success callback"+result);
				},
				timer_rule.reportError, 
				actions.SIMULATED_META_DATA,
				[checked_udn_array]
		);

	},
	
	markEarlierCheckedDevice: function(arrayDevices, x, type) {
		
		if(type === "leds" || type === "dimmers")
		{
				$.each(arrayDevices,function(inx)
				{
					if (type === "leds") {
						var tmp_udn = arrayDevices[inx][key.DEVICE_MAC_ADDRESS];
					} else if (type === "dimmers") {
						var tmp_udn = arrayDevices[inx][key.DEVICE_UDN];
					}

					if ( (Object.keys(x.Devices).length > 0 ) && ( x.Devices[ tmp_udn ] ) ) {
						
						$('div [data-udn="'+tmp_udn+'"] ').find('.check_mark').attr('display','block').show();	
						if ( x.Devices[ tmp_udn ].SensorDuration == 0 && soCheck !="1") {
							if (tmp_udn.indexOf("uuid") == -1) {
								var fadein = x.Devices[tmp_udn].FadeIn;
								var fadeout = x.Devices[tmp_udn].FadeOut;
								var brightness = x.Devices[tmp_udn].Brightness;
								brightness = brightness.replace(/%$/, '');
								var tempVal ='On until time';
								//var Disvalue = tempVal+' '+brightness+'% fade in: '+(fadein/10)+' fade out : '+(fadeout/10);

								if(fadein == "0")
									var disFadeIn = "default";

								else
									var disFadeIn = (fadein/10);

								if(fadeout == sessionStore.DEFAULT_FADEOUT_VALUE)
									var disFadeOut = "default";

								else
									var disFadeOut = (fadeout/10);

								disFadeIn = isNaN(disFadeIn)? disFadeIn: (disFadeIn/60)+' m';
								disFadeOut = isNaN(disFadeOut)? disFadeOut: (disFadeOut/60)+' m';
								var Disvalue = "Brightness:"+brightness+"%<br/>Fade in:"+disFadeIn+", Fade out:"+disFadeOut;

							} else if (tmp_udn.match(/dimmer/gi)) {
								var fadein = x.Devices[ tmp_udn ].FadeIn,
								  fadeout = x.Devices[ tmp_udn ].FadeOut,
								  brightness = x.Devices[ tmp_udn ].Brightness;

							   var disFadeIn = (fadein === "0") ? wemo.items['defaultTime'] : parseInt(fadein, 10)/60 + "m";

							   var disFadeOut = (fadeout === "3") ? wemo.items['defaultTime'] : parseInt(fadeout, 10)/60 + "m";

							   var Disvalue = wemo.items['brightness'] + ": "+brightness+"<br/>" + wemo.items['fadeIn'] +": "+disFadeIn+", " +  wemo.items['fadeOut']+ ": "+disFadeOut;
							}

							$('div [data-udn="'+tmp_udn+'"]').find('.action_subHeader').html( Disvalue ).show();
							$('div [id="'+tmp_udn+'"]').find('.until').addClass('div_bg_green');							
							//$('#'+tmp_udn+' .drawer_li_dimmer').removeClass('div_bg_gray');
							
						} else {
							switch ( x.Devices[ tmp_udn ].StartAction ) {
								case 0: {
									if(tmp_udn.indexOf("uuid") == -1  && soCheck !="1") {
										var fadeout = x.Devices[tmp_udn].FadeOut;
										var tempVal ='off';
										//var Disvalue = tempVal+' fade out : '+(fadeout/10);

										if(fadeout == sessionStore.DEFAULT_FADEOUT_VALUE)
											var disFadeOut = "default";

										else
											var disFadeOut = (fadeout/10);

										disFadeOut = isNaN(disFadeOut)? disFadeOut: (disFadeOut/60)+' m';
										var Disvalue = "Fade out : "+disFadeOut;
									} else if (tmp_udn.match(/dimmer/gi) && soCheck !== "1") {

									   var fadeout = x.Devices[tmp_udn].FadeOut;
									   var disFadeOut = (fadeout === "3") ? wemo.items['defaultTime'] :  parseInt(fadeout, 10)/60 + "m";

									   var Disvalue = wemo.items['fadeOut']+ ": "+disFadeOut;
									}

									$('div [data-udn="'+tmp_udn+'"]').find('.action_subHeader').empty().html( Disvalue ).show();
									$('div [id="'+tmp_udn+'"]').find('.off').addClass('div_bg_green'); break;
									//$('#'+tmp_udn+' .fadeout').removeClass('div_bg_gray'); break;
										}
								case 1: {
									if(tmp_udn.indexOf("uuid") == -1  && soCheck !="1") {
										var fadein = x.Devices[tmp_udn].FadeIn;
										var brightness = x.Devices[tmp_udn].Brightness;
										brightness = brightness.replace(/%$/, '');

										var tempVal ='on';
										//var Disvalue = tempVal+' '+brightness+'% fade in: '+(fadein/10);

										if(fadein == "0")
											var disFadeIn = "default";

										else
											var disFadeIn = (fadein/10);

										disFadeIn = isNaN(disFadeIn)? disFadeIn: (disFadeIn/60)+' m';
										var Disvalue = "Brightness:"+brightness+"%<br/>Fade in:"+disFadeIn;

									} else if (tmp_udn.match(/dimmer/gi) && soCheck !== "1") {

									   var fadein = x.Devices[tmp_udn].FadeIn;
									   var brightness = x.Devices[tmp_udn].Brightness;

									   var disFadeIn = (fadein === "0") ? wemo.items['defaultTime'] : parseInt(fadein, 10)/60 + "m";

									   var Disvalue = wemo.items['brightness'] + ":"+brightness+"<br/>" + wemo.items['fadeIn'] +":"+disFadeIn;

									}

									$('div [data-udn="'+tmp_udn+'"]').find('.action_subHeader').empty().html( Disvalue ).show();
									$('div [id="'+tmp_udn+'"]').find('.on').addClass('div_bg_green'); break;
									//$('#'+tmp_udn+' .fadein').removeClass('div_bg_gray');
									//$('#'+tmp_udn+' .brightness').removeClass('div_bg_gray'); break;
								}
								
							}
						}					
					}
					if(soCheck == "1"){
						$('div [data-udn="'+tmp_udn+'"]').find('.action_subHeader').empty().html( "" ).show();
					}
					if(isAwayModeInit){
						timer_rule.markDevicesForAwayMode(tmp_udn, x);
					}
				});
		}
		else
		{
				$.each(arrayDevices,function(inx) {
					var tmp_udn = arrayDevices[inx][key.DEVICE_UDN];
					var isMomentarySwitch = false;
					if(wemoUtil.isMakerDevice(tmp_udn)){
						var switchUDN = wemoUtil.getMakerSwithUDN(tmp_udn);
						if(arrayDevices[inx][key.MAKER_SWITCHMODE] == "1"){
							isMomentarySwitch = true;
						}
						if ( (Object.keys(x.Devices).length > 0 ) && ( x.Devices[ switchUDN ] ) ) {
							$('div [data-udn="'+tmp_udn+'"] ').find('.check_mark').attr('display','block').show();	
							if ( x.Devices[ switchUDN ].SensorDuration == 0) {
								$('div [data-udn="'+tmp_udn+'"]').find('.action_subHeader').empty().html( 'On until time' ).show();
								$('div [id="'+tmp_udn+'"]').find('.until').addClass('div_bg_green');						
							} else {
								switch ( x.Devices[ switchUDN ].StartAction ) {
								case 0: {$('div [data-udn="'+tmp_udn+'"]').find('.action_subHeader').empty().html( 'off' ).show(); 
								$('div [id="'+tmp_udn+'"]').find('.off').addClass('div_bg_green');	break;}
								case 1: {$('div [data-udn="'+tmp_udn+'"]').find('.action_subHeader').empty().html( 'on' ).show();
								$('div [id="'+tmp_udn+'"]').find('.on').addClass('div_bg_green'); break;}
								}
							}					
						} 
					}else{
					if ( (Object.keys(x.Devices).length > 0 ) && ( x.Devices[ tmp_udn ] ) ) {
						$('div [data-udn="'+tmp_udn+'"] ').find('.check_mark').attr('display','block').show();	
						if ( x.Devices[ tmp_udn ].SensorDuration == 0) {
							$('div [data-udn="'+tmp_udn+'"]').find('.action_subHeader').empty().html( 'On until time' ).show();
							$('div [id="'+tmp_udn+'"]').find('.until').addClass('div_bg_green');						
						} else {
							switch ( x.Devices[ tmp_udn ].StartAction ) {
								case 0: {$('div [data-udn="'+tmp_udn+'"]').find('.action_subHeader').empty().html( 'off' ).show(); 
										$('div [id="'+tmp_udn+'"]').find('.off').addClass('div_bg_green');	break;}
								case 1: {$('div [data-udn="'+tmp_udn+'"]').find('.action_subHeader').empty().html( 'on' ).show();
										$('div [id="'+tmp_udn+'"]').find('.on').addClass('div_bg_green'); break;}
								}
							}
						}					
					} 
					if(soCheck == "1"){
						$('div [data-udn="'+tmp_udn+'"]').find('.action_subHeader').empty().html( "" ).show();
					}
					if(isAwayModeInit && !isMomentarySwitch){
						timer_rule.markDevicesForAwayMode(tmp_udn, x);
					} 
				});
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
	
	changeWhenField: function(x) {
		setDefaultTime = true;
        if (isEdit && (x.RuleType == sessionStore.TIME_INTERVAL || x.RuleType == sessionStore.SIMPLE_SWITCH)) {
            switch (x.RuleType) {
                case sessionStore.TIME_INTERVAL :
                    if (!timer_rule.isSimpleWhen(x) && ( x.When.EndTime != undefined && x.When.EndTime != "0" && x.When.EndTime != 0))
                        setDefaultTime = false; break;
                case sessionStore.SIMPLE_SWITCH : if (timer_rule.isSimpleWhen(x)) setDefaultTime = false; break;
            }
        }

        if (setDefaultTime) {
            delete x.When.StartSRSS;
            delete x.When.OnModeOffset;
            delete x.When.EndSRSS;
            delete x.When.OffModeOffset;
            if (!timer_rule.isSimpleWhen(x)) {
                x.When.StartTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestHalfHour());
                x.When.EndTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestOneAndHalfHour());
                $("#timer_rule_when .select_time").empty().html(wemoUtil.convertMillisecondsToTF(x.When.StartTime, UP_TF_IS24) + " - " + wemoUtil.convertMillisecondsToTF(x.When.EndTime, UP_TF_IS24) + ", ");
                $("#timer_rule_when .action").empty().html(wemo.items['OnOff']);
                wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
            } else {
                x.When.StartTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestHalfHour());
                x.When.EndTime = "0";
                $("#timer_rule_when .select_time").empty().html(wemoUtil.convertMillisecondsToTF(x.When.StartTime, UP_TF_IS24) + ", ");

                var flag_on = 0;
                var flag_off = 0;

                for (key in x.Devices) {
                    switch (x.Devices[key].StartAction) {
                        case 0:
                            flag_off++;
                            break;
                        case 1:
                            flag_on++;
                            break;
                    }
                }

                if ((flag_on == 0 && flag_off == 0) || (flag_on > 0 && flag_off > 0)) {
                    $("#timer_rule_when .action").empty().html(wemo.items["Start"]);
                }
                else if (flag_on > 0 && flag_off == 0) {
                    $("#timer_rule_when .action").empty().html(wemo.items["On"]);
                }
                else if (flag_on == 0 && flag_off > 0) {
                    $("#timer_rule_when .action").empty().html(wemo.items["Off"]);
                }


                wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
            }
        }
        if(soCheck == 1 ){
        	$("#timer_rule_when .action").empty().html(wemo.items["OnOff"]);
        }
	},
	renderDataForRemoteMaker: function(udn, friendlyName, SwitchMode){
		var html='';
		if(SwitchMode == "1"){
			if(soCheck != "1")
				html = '<div class="select_switches_list" data-udn="' + udn + '"><div class="display_table padding_left_16px"><span class="display_cell"><span class="fname">'+friendlyName+'</span><span class="action_subHeader"></span></span></div><span class="check_mark"></span></div>';
		} else{
			html ='<div class="select_switches_list" data-udn="' + udn + '"><div class="display_table padding_left_16px"><span class="display_cell"><span class="fname">'+friendlyName+'</span><span class="action_subHeader"></span></span></div><span class="check_mark"></span></div><div class="drawer" id="' + udn + '"><div class="drawer_li until"><span>On until time</span></div><div class="drawer_li on"><span>On</span></div><div class="drawer_li off"><span>Off</span></div></div>';
		}
		return html;
	},
	
	saveNewTimerRule_RULES_RULEDEVICES_SO: function(arg, ruleObj){
//		if (ruleObj.When.StartSRSS == undefined && ruleObj.When.EndSRSS == undefined) {
//			ruleObj.When.StartTime=wemoUtil.soString2(''+ruleObj.When.StartTime);
//			ruleObj.When.EndTime=wemoUtil.soString2(''+ruleObj.When.EndTime);
//		}
		ruleObj.RuleType = sessionStore.AWAY_MODE;
		wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, ruleObj);
		saveNewTimerRule_RULES_RULEDEVICES(ruleObj.RuleType, ruleObj);
	},
	
	defaultSelected : function(data_udn){  
		 
		if(data_udn !== undefined && ((data_udn).indexOf("uuid") == -1 || data_udn.match(/dimmer/gi)) )
		{
			defaultFlag = true;
	
			var x = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_NEW),
				deviceID;
			if ((data_udn).indexOf("uuid") == -1) {
				deviceID = data_udn;
			} else {
				deviceID = data_udn.split("-")[2];
			}
			
			$('.brightSlider').trigger('create');
			var slider_value = $('#slider-1'+deviceID).val();
            $('div [id="'+data_udn+'"]').find('.sliderValue').empty().text(slider_value + '%');
			
            var fadein = "0";
            var fadeout = sessionStore.DEFAULT_FADEOUT_VALUE;
            var brightness = "100";
            
            $('#fadein'+deviceID).on("tap", ".buttonImage", function (e) {
				 $('#fadein' + deviceID + ' .buttonImage').removeClass('buttonActive');
				 $(this).addClass('buttonActive');
			});
			
			$('#fadeout'+deviceID).on("tap", ".buttonImage", function (e) {
				$('#fadeout' + deviceID + ' .buttonImage').removeClass('buttonActive');
				 $(this).addClass('buttonActive');
			});
			
			$('#slider-1'+deviceID).change(function () {
               var slider_value = $('#slider-1'+deviceID).val();
               $('div [id="'+data_udn+'"]').find('.sliderValue').empty().text(slider_value + '%');
               x.Devices[deviceID].Brightness = slider_value;
               wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);

           });
            
            $('div [id="'+data_udn+'"]').find('.until').addClass('div_bg_green');
            $('#'+data_udn+' .drawer_li_dimmer').removeClass('div_bg_gray');
            
            var tempVal = "On until time";
            //var Disvalue = tempVal+' '+brightness+"%"+' fade in : '+(fadein/10)+' fade out : '+(fadeout/10);
            
            if(fadein == "0")
				var disFadeIn = "default";
			
			else
				var disFadeIn = (fadein/10);
			
			if(fadeout == sessionStore.DEFAULT_FADEOUT_VALUE)
				var disFadeOut = "default";
			
			else
				var disFadeOut = (fadeout/10);
			
			disFadeIn = isNaN(disFadeIn)? disFadeIn: (disFadeIn/60)+' m';
			disFadeOut = isNaN(disFadeOut)? disFadeOut: (disFadeOut/60)+' m';
			var Disvalue = "Brightness:"+brightness+"%<br/>Fade in:"+disFadeIn+", Fade out:"+disFadeOut;
            
            var fname = $.trim( $('div [data-udn="'+deviceID+'"]').find('.fname').html() );
			
			$('div [data-udn="'+data_udn+'"]').find('.action_subHeader').html( Disvalue ).show();
			$('div [data-udn="'+data_udn+'"] ').find('.check_mark').attr('display','block').show();
			
			window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE, data_udn);
            window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE_NAME, fname);  
            
            if ( x.Devices[data_udn] ) {
				x.Devices[data_udn]={};
				delete x.Devices[data_udn]; 
			}
			
			x.Devices[data_udn]={};
			x.DeviceList+= data_udn;
			//x.DeviceList = data_udn;
			
			if((data_udn).indexOf("uuid") === -1 || data_udn.match(/dimmer/gi) )
			{
				x.Devices[data_udn].SelectedLedValue = 1;
			}
			else
			{
				x.Devices[data_udn].SelectedLedValue = 0;
			}
			 
			  x.Devices[data_udn].SensorDuration = 0; 
			  x.Devices[data_udn].IntervalWhen = true; 
			  x.Devices[data_udn].StartAction = 1;
			  x.Devices[data_udn].EndAction = 0;
			  x.Devices[data_udn].FadeIn = fadein;
			  x.Devices[data_udn].FadeOut = fadeout;
			  x.Devices[data_udn].Brightness = brightness;
			  
            x.Devices[data_udn].FName=window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE_NAME);
            x.When.StartTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestHalfHour());
			x.When.EndTime = wemoUtil.convertTimeToMilliseconds(wemoUtil.getTimeRoundedToNearestOneAndHalfHour());
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);          
			
			timer_rule.changeWhenField(x);		
			
		}
	},
	
	getDayValue: function (dayID) {
        var dayID = dayID;

        if(dayID == "Sun"){
        return 0;
        }else if(dayID == "Mon"){
        return 1;
        }else if(dayID == "Tue"){
            return 2;
        }else if(dayID == "Wed"){
            return 3;
        }else if(dayID == "Thu"){
            return 4;
        }else if(dayID == "Fri"){
        	return 5;
        }else if(dayID == "Sat"){
            return 6;
        }else{
            return 8;
     }
    },

    ST_ET_areSAME : function (ruleObj) {
    	if (timer_rule.isSimpleWhen(ruleObj) ) {
    		return false;
    	}
    	else{
    		if ( (ruleObj.When.StartSRSS != undefined && ruleObj.When.EndSRSS != undefined) && (ruleObj.When.StartSRSS == ruleObj.When.EndSRSS) ) {
    			if ( parseInt(ruleObj.When.OnModeOffset) == parseInt(ruleObj.When.OffModeOffset) ) {
    				return true;
    			}
    		} else if (parseInt(ruleObj.When.StartTime) == (parseInt(ruleObj.When.EndTime) == timestamp.MIDNIGHT_END_TIME ? 0 : parseInt(ruleObj.When.EndTime))) {
    			return true;
    		}
    		else return false;
    	}
    },
    
    getTimeValue: function (calTime) {
        
        var calTime = calTime;

        if(calTime == "Default"){
        	return 30;
        }else if(calTime == "1 minutes"){
        	return 600;
        }else if(calTime == "5 minutes"){
            return 3000;
        }else if(calTime == "15 minutes"){
            return 9000;
        }else if(calTime == "30 minutes"){
            return 18000;
        }else if(calTime == "1 hour"){
            return 36000;
        }else{
            return 30;
        }
    },
    
    markDevicesForAwayMode : function (deviceUdn, x){
    	
    
    	$('div [data-udn="'+deviceUdn+'"] ').find('.check_mark').attr('display','block').show();
    	$('div [data-udn="'+deviceUdn+'"]').find('.action_subHeader').empty().html( "" ).show();
    	
    	if(wemoUtil.isMakerDevice(deviceUdn)){
    		deviceUdn = wemoUtil.getMakerSwithUDN(deviceUdn);
    	}
    	
    	if ( x.Devices[deviceUdn] ) {
			x.Devices[deviceUdn]={};
			delete x.Devices[deviceUdn];
		}
		x.Devices[deviceUdn]={};
		x.DeviceList += deviceUdn;


		var data_udn=deviceUdn;
		
		x.Devices[data_udn].SensorDuration = 0; 
		x.Devices[data_udn].IntervalWhen = true; 
		x.Devices[data_udn].StartAction = 1;
		x.Devices[data_udn].EndAction = 0;
		x.Devices[data_udn].FName=window.sessionStorage.getItem(sessionStore.CURRENT_DEVICE_NAME);
		
		if((data_udn).indexOf("uuid") == -1)
		{
			x.Devices[data_udn].SelectedLedValue = 1;
		}
		else
		{
			x.Devices[data_udn].SelectedLedValue = 0;
		}
		
		wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, x);
    }
};
