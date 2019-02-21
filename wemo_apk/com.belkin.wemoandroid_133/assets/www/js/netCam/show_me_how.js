/*
    show_me_how.js

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
var TAG = "show_me_how.js: ";

$(document).bind('pageinit', function() {
    show_me_how.initialize();
});

var pageRef = "homePage";

var show_me_how = {
		
		initialize : function() {
			console.log(TAG + "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

		onDeviceReady : function() {

			console.log(TAG + "onDeviceReady");
			show_me_how.bindEvents();
			
			/** Start Switch Sensor Setup Demo - switch_sensor_setup_demo.html */
	/*		$("#sensorSwitch").on("tap", function(){
				//Navigate to -> sensor_switch_setup_demo.html
				wemoUtil.loadUrl(filePath.SENSOR_SWITCH_DEMO);
			});

			*//** Start Light Switch Setup Demo - light_switch_setup_demo.html *//*
			$("#lightSwitch").on("tap", function(){
				//Navigate to -> light_switch_setup_demo.html
				wemoUtil.loadUrl(filePath.LIGHT_SWITCH_DEMO);
			});

			*//** Close Setup Device Demo Home Page - Back to previous page/Device List *//*
			*/
			var lang = window.localStorage.getItem("DEVICE_LANG");
			console.log('lang selected ::::'+lang);
			var container = $("#switch_motion_slider");
			var imgs = container.find(".switch_slider");
			var imgName=''
				
			
			if(lang == 'fr_FR'){ //French Language	
				imgName = '../img/Fr-Step-';
			}else if(lang == 'es_ES'){ //Spanish Language	
				imgName = '../img/Esp-Step-';
			}else if(lang == 'de_DE'){ //German Language	
				imgName = '../img/De-Step-';
			}else if(lang == 'zh_CN'){ //Chinese Language
				imgName = '../img/Ch-Step-';
			}else{ //default Language
				imgName = '../img/Step-';
			}
			
		  var imgSrc='';
		  $(imgs).each(function(index,element){
			 index=index+1;	
			 imgSrc = "<img src='"+imgName+index+".png' />" ;
			 console.log("imgSrc::"+imgSrc);
			 $(this).append(imgSrc);
				
			});
		  
			/** Close Setup Device Demo Home Page - Back to previous page/Device List */
			$("#closeDemoPage").on("pointerdown", function(){
				//alert("Close Demo Page!");
				//Navigate to -> previous page/Device List
				//wemoUtil.loadUrl(filePath.SETUP_DEVICE_DEMO);
			});
			
			var deviceWidth = $(window).width();  
			$(".switch_slider").css('width', deviceWidth);
			$(".slider_wrapper").css('width', deviceWidth);
			
			//Swtich Slider Start here.
			
			var current = 0;
		     
		    var imgWidth = $(".switch_slider").find("img").width();
		    
			 /*--Close Button for Switch Light main page Close Button --*/
		     
		     /**-sensorSwitch---*/
		     $("#showMeHow").on('pointerdown', function(){
		    	  current = 0;
		    	  navButton();
		    	  transition();
		    	  $("#slider_wrapper").hide();
                  $("#netCamHeader").hide();
                  $("#showMeHow").hide();
		          $("#slider_wrapper").show();
		          /* var imgWidth = $(".switch_slider").find("img").width();
		          
		          alert(imgWidth);
		       	  $(".switch_slider").find("img").css('margin-left', ((deviceWidth-imgWidth)/2));
		       	  alert("width" + ((deviceWidth-imgWidth)/2)); */
		       	 var deviceHeigth = $(window).height();
		          $("#switch_motion_nav").css('bottom', (deviceHeigth)/95);
		          $(".view_instillation_video").css('bottom', (deviceHeigth)/8);
		     	  $(".switch_motion_next").css('top', ((deviceHeigth)/2)-48);
		     	 // $(".switch_motion_next").css('right', -20);
		     	  $(".switch_motion_pre").css('top', ((deviceHeigth)/2)-48);
		     	  
		     	  //**For Flashcard Content position
				  /*Netcam Slideshow Start*/
				    
			      $(".netcam_flashcard1_content").css('top', ((deviceHeigth)/2)-50);
		     	  $(".netcam_flashcard2_content").css('top', ((deviceHeigth)/3)-50);
		     	  $(".netcam_flashcard3_content").css('top', ((deviceHeigth)/3));
		     	  $(".netcam_flashcard4_content").css('top', ((deviceHeigth)/3));
		     	  $(".netcam_flashcard5_content").css('top', ((deviceHeigth)/3)-20);
		     	  $(".netcam_flashcard6_content").css('top', ((deviceHeigth)/2) + 20);
		     	  
		     	 /*Netcam Slideshow Start*/
		     	 
		     	  
		     	  $(".switch_motion_pre").css('left', 15);
				  $("#light_slider_container").hide();
				  $("#switch_slider_container").show();
		       
		     });
		     
			 var container = $("#switch_motion_slider");
			 var imgs = container.find(".switch_slider");
			 //var imgWidth = imgs.find("img").width;
			 var imgLen = imgs.length;
			 var preBtn = container.find(".switch_motion_pre");
			 var nextBtn = container.find(".switch_motion_next");
			 var nav = $("#switch_motion_nav");
			 var navBtn = nav.find("ul");
			 
			 if ($("#switch_motion_slider").is(":visible") == false) { var current = 0; }
			 
			 for(var i = 0; i < imgLen; i++ ){
				 var navAnchor = '<li><a href="#"></a></li>';
				 navBtn.append(navAnchor);
			}
			 
			
			 function previousButton(){
				 if( current == 0 ){
					 $(".switch_motion_pre").hide();
				 }else if(current != 0){
					 $(".switch_motion_pre").show();
				 }
				 
				 if( current == (imgLen-1) ){
					 $(".switch_motion_next").hide();
				 }else if(current != imgLen){
					 $(".switch_motion_next").show();
				 }
			 }
			 
			 previousButton();
			
		    $("#slider_wrapper").find("p").on('pointerdown', function(){
				current = current;
		    	if($(this).attr('class')==="switch_motion_pre"){
		    		current--;
		    	}else if($(this).attr('class')==="switch_motion_next"){
		    		current++;
		    	}
		    	
		    	 transition();
		    	 previousButton();
		    	 navButton();
		    	 $("#switch_motion_nav").find("li").removeClass("active");
			     $("#switch_motion_nav").find("li").eq(current).addClass("active");
		  	     
		     });
				
		    function navButton(){
		    	 $("#switch_motion_nav").find("li").removeClass("active");
			     $("#switch_motion_nav").find("li").eq(current).addClass("active");
		    }
		    
		    $("#switch_motion_nav").find("li").removeClass("active");
		    $("#switch_motion_nav").find("li").eq(current).addClass("active");
		    
		    $("#switch_motion_nav").find("li").on('pointerdown', function(){
			   	  current = $(this).index();
			      transition();
			      previousButton();
			 	  navButton();
		   });

			$("#switch_motion_nav").css('width', deviceWidth ) ;
		    
		        $( "#switch_motion_slider" ).on( "swipeleft swiperight", function( e ) {
		        	current = current;
		            if ( e.type === "swipeleft" ) {
		            	if(current == (imgLen -1)){
		            		current = current;
		            	}else{
		            		current++;  
		            	//	alert("Left");
		            	}
		            }  else if ( e.type === "swiperight" ) {
		            	if(current == 0){
		            		current = current;
		            	}else{
		            		current--;	
		            		//alert("Right");
		            	}
		            }  
		            transition();
		            previousButton();
		       	    navButton();
		        });
		    
			    //Swipe method Ends
			   function transition(){
				  /*$("#switch_motion_slider").animate({
				     "margin-left": -(current * deviceWidth)
				  });*/
				  $("#switch_motion_slider").css('transform', 'translate3d(' + -(current * deviceWidth) + 'px,0,0)');
			    }
			    
				 $("#switch_motion_close").on('pointerdown', function(){  
					 $("#slider_wrapper").hide();
                     $("#netCamHeader").show();
                     $("#showMeHow").show();
					 current = 0;
					 transition();
					 previousButton();
					 
				 });
			    
			 /*Slider Ends*/
				 
			    //View Installation Video
			    $("#switch_setupInstructions_video").on('pointerdown', function(){
			    	wemoUtil.loadUrl(filePath.VIDEO_DEMO);
			    });
			    
			    $(".view_instillation_video").on('pointerdown', function(){
			    	wemoUtil.loadUrl(filePath.SETUP_LIGHT_SWITCH_DEMO);
			    });
			    
			    $(".setupInstructions_faq").on('pointerdown', function(){
			    	//wemoUtil.loadUrl(filePath.MORE_FAQ);
			    	//wemoUtil.loadUrl(filePath.SETUP_FAQ);
			    	window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Help_WeMo_SetUp_Url']);
					wemoUtil.loadUrl(filePath.HELP_CENTER);
			    });
			    
			    nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
			
		},

		bindEvents : function() {
			console.log(TAG + "bindEvents");
			document.addEventListener('online', show_me_how.onOnline, false);
			document.addEventListener('offline', show_me_how.onOffline, false);
			document.addEventListener("backbutton", show_me_how.onBackPress, false);
			document.addEventListener("pause", show_me_how.onPause, false);
			document.addEventListener("resume", show_me_how.onResume, false);
		},

		onOffline : function() {
			console.log(TAG + "offLine");
		},

		onOnline : function() {
			console.log(TAG + "onLine");
		},

		onBackPress : function() {
			console.log(TAG + "onBackPress");
			if($("#slider_wrapper").is(':visible')){
				$("#slider_wrapper").hide();
                $("#netCamHeader").show();
                $("#showMeHow").show();
			}else{
	            navigator.app.clearHistory();
	            navigator.app.exitApp();
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