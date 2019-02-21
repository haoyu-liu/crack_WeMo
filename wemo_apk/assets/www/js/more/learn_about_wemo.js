/*
 learn_about_wemo.js

 Created by Belkin International, Software Engineering on 10/04/2013.
 Copyright (c) 2016 Belkin International, Inc. and/or its affiliates. All rights reserved.

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


function LearnAboutWemo() {
    var TAG = "learn_about_wemo.js";

    var obj = {
        init: function () {
            wemoUtil.infoLog(TAG, "initialize");
            document.addEventListener('deviceready', this.onDeviceReady, false);
        },
       onDeviceReady : function() {
            obj.bindEvents();
            obj.mainMethod();
       },
       mainMethod: function(){
            var pageUrl = window.location.href;
            var deviceHeight = $(window).height();

            if (pageUrl.match(/fromsfw/gi)) {
                $("#tutorialsList").css("visibility", "hidden");
                $(".tutorialSlidesWrapper").addClass("showSlides");
                var $el = $("#" + pageUrl.split("=")[1]);
                $el.show();
                obj.renderSlides($el);

                $(".slide-close").on("click", function() {
                    wemoUtil.loadUrl(filePath.DEVICE_LIST);
                });
            } else {
                $("#tutorialsList").css("visibility", "visible");
                $(".slide-close").on("click", function() {
                    obj.closeSlides();
                });

                $(".reset_dimmer_title").on("click", function(){
                    obj.closeFAQ();
                });

                $(".tutorials_page_back_btn").on("click", function() {
                    wemoUtil.loadUrl(filePath.MORE_MENU);
                });

                //$("#webSupport").on("click", function() {
                //    wemoUtil.infoLog(TAG, "SupportArticles");
                //    var link = wemo.items['Help_Url'];
                //    wemoUtil.loadExternalUrl(link);
                //});

                $(".sectionItem").on("click", function(){
                    if ($(this).data("link")) {
                        var slideId = "#" + $(this).data("link");
                        $("#tutorialsList").addClass("slideOut");
                        $(".tutorialSlidesWrapper").removeClass("hiddenSlides");
                        $(slideId).show();
                        obj.renderSlides($(slideId));
                    } else if ($(this).data("faq") === "resetFAQ") {
                        obj.loadFAQ($(".resetFAQ"));
                    }

                    obj.swipeBackToTutorialList();
                });

                var isBridgePresent = window.sessionStorage.getItem('BridgePresent');
                if (isBridgePresent === "true") {
                    $("#ledTutorial").show();
                }
            }

            $(".flashcard_FAQ").on("click", function(){
                var $el = $("."+$(this).data("faq"));
                obj.loadFAQ($el);
            });

            $(".FAQ_title").on("click", function(){
                obj.closeFAQ();
            });

            $(".nav_item").on("click", function(e) {
                if (!$(this).hasClass("showItem")) {
                    $(".nav_item").removeClass("showItem");
                    $(".nav_sub_item").removeClass("showSubItem");

                    if ((deviceHeight - e.originalEvent.clientY) < 100 ) {
                        $('.FAQ_wrapper').animate({
                          scrollTop: 250
                        }, 600);
                    }
                }
                $(this).toggleClass("showItem");
                $(this).next(".nav_sub_item").toggleClass("showSubItem");

            });
       },
       renderSlides: function($el) {

            var deviceWidth = $(window).width(),
                deviceHeight = $(window).height(),
                $tutorialSlides = $(".tutorialSlidesWrapper"),
                $pageControl = $(".owl-controls");

            $tutorialSlides.css({
                'width': deviceWidth,
                'height': deviceHeight
            });

            $(".wemoTutorialsPage").css('width', deviceWidth);

            $el.owlCarousel({
                navigation : true,
                slideSpeed : 300,
                paginationSpeed : 400,
                singleItem : true
            });

            $el.data('owlCarousel').jumpTo(0);

             $el.find(".slide").css({
                'width': deviceWidth,
                'height': deviceHeight
            });

            var pageControlWidth = $el.find(".owl-page").width(),
                pageControlNum = $el.find(".slide").length,
                controlPosition = (deviceWidth - pageControlWidth * pageControlNum) / 2;

            $el.find(".owl-controls").css('left', controlPosition + "px");

       },
       swipeBackToTutorialList: function() {
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
                            obj.closeSlides();
                        }
                    }
                // reset values
                xDown = null;
                yDown = null;
            });

       },
       navigateToLastPage: function() {
            var isSlideHidden = $(".tutorialSlidesWrapper").hasClass("hiddenSlides"),
                isFAQHidden = $(".FAQ_wrapper").hasClass("hideFAQ");
                var pageUrl = window.location.href;

                if (pageUrl.match(/fromsfw/gi)) {
                    if (!isFAQHidden) {
                        obj.closeFAQ();
                    } else {
                        wemoUtil.loadUrl(filePath.DEVICE_LIST);
                    }
                } else {
                    if (!isFAQHidden) {
                        obj.closeFAQ();
                    } else if (!isSlideHidden) {
                        obj.closeSlides();
                    } else {
                       wemoUtil.loadUrl(filePath.MORE_MENU);
                    }
                }

       },
       loadFAQ: function($el) {
            $(".FAQ_wrapper").removeClass("hideFAQ");
            $(".FAQ_page").hide();
            $el.show();
       },
       closeFAQ: function() {
            $(".FAQ_wrapper").addClass("hideFAQ");
            $(".nav_item").removeClass("showItem");
            $(".nav_sub_item").removeClass("showSubItem");
       },
       closeSlides: function() {
           $(".tutorialSlidesWrapper").addClass("hiddenSlides");
           $("#tutorialsList").removeClass("slideOut");
           setTimeout(function() {
                $(".tutorial_slides").hide();
           }, 600);
       },
       bindEvents: function() {
           wemoUtil.infoLog(TAG, "bindEvents");
           document.addEventListener('online', this.onOnline, false);
           document.addEventListener('offline', this.onOffline, false);
           document.addEventListener("backbutton", this.onBackPress, false);
           document.addEventListener("pause", this.onPause, false);
           document.addEventListener("resume", this.onResume, false);
       },
       onOffline: function() {
            wemoUtil.infoLog(TAG, "offLine");
       },
       onOnline: function() {
            wemoUtil.infoLog(TAG, "onLine");
       },
       onBackPress: function() {
           wemoUtil.infoLog(TAG, "onBackPress");
           obj.navigateToLastPage();
       },
       onPause: function() {
           wemoUtil.infoLog(TAG, "onPause");
       },
       onResume: function() {
            wemoUtil.infoLog(TAG, "onResume");
       },
       reportError: function(e) {
            wemoUtil.infoLog(TAG, "Plugin Error!!!!   " + e);
       }
    }

   return obj;
};

$(document).bind('pageinit', function () {
    var learnAboutWemoPage = new LearnAboutWemo();
    learnAboutWemoPage.init();
});