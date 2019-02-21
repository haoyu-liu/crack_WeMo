/*
 demo_setup_device.js

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

var TAG = "demo_setup_device.js: ";

$(document).bind('pageinit', function() {
    demo_setup_device.initialize();
});

var pageRef = "homePage";

//steps are an array of the div ID that has the step in it. this way we dont need to duplicate divs, we just clone them into the list.

var $container;

var demo_setup_device = {

    initialize: function() {
        $container = $("#container");
        console.log(TAG + "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    calcScrollDevicesHeight: function() {
        var deviceHeight = $(window).height(),
            height = deviceHeight - $('#demo-setup-header').outerHeight() - 40;

        $('#scrollDevices').height(height);
        $('.gray_page').show();
    },

    onDeviceReady: function() {
        console.log(TAG + "onDeviceReady");
        demo_setup_device.bindEvents();
        var pageUrl = window.location.href,
            isPopupDismissed = window.sessionStorage.getItem("isPopupDismissed");
        if (!pageUrl.match(/nopopup/gi) && !isPopupDismissed) {
            demo_setup_device.checkAutoNetworkSwitch();
        }

        var lang = window.localStorage.getItem("DEVICE_LANG");

        if (lang != 'en_AU') {
            $("#lightSwitch_installation_video").show();
        }

        demo_setup_device.calcScrollDevicesHeight();

        $("#closeDemoHome").on("pointerdown", function() {
            //Navigate to -> previous page/Device List
            demo_setup_device.navigateToLastPage();
        });

        var deviceWidth = $(window).width(),
            deviceHeight = $(window).height(),
            $slideWrapper = $(".slider_wrapper");

        $slideWrapper.css('width', deviceWidth);

        /*--Close Button for Switch Light main page Close Button --*/
        $(".demo-setup-device").on('click', function() {
            var $pageControl = $(".owl-controls");
            $slideWrapper.removeClass("hiddenSlider");

            $(".demo_setup_device_container").addClass('slideOut');

            $slideWrapper.find('.slide_container').hide();
            var slideContainer  = $(this).data("slide");
            $("#"+slideContainer).show();

            $(".slider").css({'width': deviceWidth,
                'height': deviceHeight});

            var pageControlwidth = $pageControl.find(".owl-page").width(),
                pageControlNum = $("#"+slideContainer).find(".slider").length,
                controlPosition = (deviceWidth - pageControlwidth * pageControlNum) / 2;

            $pageControl.css('left', controlPosition + "px");
        });

        $(".owl-carousel").owlCarousel({
            navigation : true,
            slideSpeed : 300,
            paginationSpeed : 400,
            singleItem : true
        });
        /*Slider Ends*/

        demo_setup_device.backToDemoMainPage();
        demo_setup_device.showLocalizationSlides();


        //View Installation Video
        $(".load-video").on('pointerdown', function(e) {
            e.preventDefault();
            e.stopPropagation();
            var link = $(this).data("link");
            window.open(wemo.items[link], "_system");
        });

        $(".setupInstructions_faq").on('pointerdown', function(e) {
            e.preventDefault();
            e.stopPropagation();
            window.open(wemo.items['Help_WeMo_SetUp_Url'], "_system");
        });

        $(".setupInstructions_Header").on("click", function(){
            var link = $(this).data("link");
            wemoUtil.loadExternalUrl(wemo.items[link]);
        });

    },

    backToDemoMainPage : function() {
        var $firstSlide = $(".firstSlide");
        var xDown = null;
        var yDown = null;

        $firstSlide.on('touchstart', function(e){
            xDown = e.originalEvent.changedTouches[0].clientX;
            yDown = e.originalEvent.changedTouches[0].clientY;
        });

        $firstSlide.on('touchmove', function(e){
            if ( ! xDown || ! yDown )  return;
            var xDiff = xDown - e.originalEvent.changedTouches[0].clientX;
            var yDiff = yDown - e.originalEvent.changedTouches[0].clientY;

                if ( Math.abs( xDiff ) > Math.abs( yDiff ) ) {
                    if (xDiff < 0 ) {
                        // swipe left
                        demo_setup_device.closeSlides();
                    }
                }
            // reset values
            xDown = null;
            yDown = null;
        });

        $(".slide_container .demo-setup-device-closeMe").on('pointerdown', function() {
            demo_setup_device.closeSlides();
        });
    },

    closeSlides: function() {
        $(".slider_wrapper").addClass("hiddenSlider");
        $(".demo_setup_device_container").removeClass("slideOut");
    },

    showLocalizationSlides: function() {
        var $slide2 = $(".settingSceen2"),
            $slide3 = $(".settingSceen3"),
            slide2ImgName = "SettingsScreens_No2_Android.png",
            slide3ImgName = "SettingsScreens_No3_Android.png";

        switch(lang) {
            case 'fr_FR':
            case 'fr_CA'://French Language
                $slide2.css("background-image", "url(../img/setupSlides/fr/"+slide2ImgName+ ')');
                $slide3.css("background-image", "url(../img/setupSlides/fr/"+slide3ImgName+ ')');
                break;
            case 'es_ES': //Spanish Language
                $slide2.css("background-image", "url(../img/setupSlides/es/"+slide2ImgName+ ')');
                $slide3.css("background-image", "url(../img/setupSlides/es/"+slide3ImgName+ ')');
                break;
            case 'de_DE': //German Language
                $slide2.css("background-image", "url(../img/setupSlides/de/"+slide2ImgName+ ')');
                $slide3.css("background-image", "url(../img/setupSlides/de/"+slide3ImgName+ ')');
                break;
            case 'zh_CN': //Chinese Language
                $slide2.css("background-image", "url(../img/setupSlides/zh/"+slide2ImgName+ ')');
                $slide3.css("background-image", "url(../img/setupSlides/zh/"+slide3ImgName+ ')');
                break;
            case 'it_IT': //Czech Language
                $slide2.css("background-image", "url(../img/setupSlides/it/"+slide2ImgName+ ')');
                $slide3.css("background-image", "url(../img/setupSlides/it/"+slide3ImgName+ ')');
                break;
            case 'ru_RU'://Russian Language
                $slide2.css("background-image", "url(../img/setupSlides/ru/"+slide2ImgName+ ')');
                $slide3.css("background-image", "url(../img/setupSlides/ru/"+slide3ImgName+ ')');
                break;
            case 'ko_KR': //Korean Language
                $slide2.css("background-image", "url(../img/setupSlides/ko/"+slide2ImgName+ ')');
                $slide3.css("background-image", "url(../img/setupSlides/ko/"+slide3ImgName+ ')');
                break;
            case 'ja_JP': //Japanese Language
                $slide2.css("background-image", "url(../img/setupSlides/ja/"+slide2ImgName+ ')');
                $slide3.css("background-image", "url(../img/setupSlides/ja/"+slide3ImgName+ ')');
                break;
        }

    },

    navigateToLastPage : function() {
        var previousUrl = wemoUtil.getPreviousUrl();
        if (previousUrl.match(filePath.DEVICE_LIST)) {
                wemoUtil.loadUrl(filePath.MORE_MENU);
        } else {
            wemoUtil.loadPreviousUrl();
        }
    },

    bindEvents: function() {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', demo_setup_device.onOnline, false);
        document.addEventListener('offline', demo_setup_device.onOffline, false);
        document.addEventListener("backbutton", demo_setup_device.onBackPress, false);
        document.addEventListener("pause", demo_setup_device.onPause, false);
        document.addEventListener("resume", demo_setup_device.onResume, false);
    },

    onOffline: function() {
        console.log(TAG + "offLine");
    },

    onOnline: function() {
        console.log(TAG + "onLine");
    },

    onBackPress: function() {
        console.log(TAG + "onBackPress");
        demo_setup_device.navigateToLastPage();
    },

    onPause: function() {
        console.log(TAG + "onPause");
    },

    onResume: function() {
        console.log(TAG + "onResume");
    },

    reportError: function(e) {
        console.log(TAG + "Plugin Error!!!!   " + e);
    },
    checkAutoNetworkSwitch: function() {
        var self = this;
        cordova.exec(
            function(resp) {

                if (resp.isPoorNetworkAvoidanceEnabled || resp.isScanningAlwaysAvailableEnabled) {

                    var $content = $('#autoswitch_popup .popup_content span');


                    //determine popup messaging based on the results
                    if (resp.isPoorNetworkAvoidanceEnabled && resp.isScanningAlwaysAvailableEnabled) {
                        //message for both
                        $content.html(wemo.items['autoswitch_both_body']);
                    } else if (resp.isPoorNetworkAvoidanceEnabled) {
                        //message for autoswitch
                        $content.html(wemo.items['autoswitch_body']);
                    } else {
                        //message for isScanning
                        $content.html(wemo.items['autoswitch_scanningavailable_body'])
                    }

                    if (!self.autoswitchEvents) {
                        $('#autoswitchlink_btn').on('pointerdown', function(e) {
                            e.preventDefault();
                            e.stopPropagation();
                            window.open(setupConstants.autoNetworkSwitchHelpDocument, "_system");
                            setTimeout(function() {
                                $("#autoswitch_popup").popup("close");
                            }, 500)
                            window.sessionStorage.setItem("isPopupDismissed", true);
                        });

                        $('#autoswitch_cancel_btn').on('pointerdown', function(e) {
                            e.preventDefault();
                            e.stopPropagation();
                            setTimeout(function() {
                                $("#autoswitch_popup").popup("close");
                            }, 500)
                            window.sessionStorage.setItem("isPopupDismissed", true);
                        });
                        self.autoswitchEvents = true;
                    }

                    $("#autoswitch_popup").popup();
                    $("#autoswitch_popup").popup('open');
                }
            },
            function(err) {
                console.log(TAG + "CheckAutoNetworkSwitch failure call back");

            }, "SetupPlugin", "CheckAutoNetworkSwitch", []
        );
    }
};