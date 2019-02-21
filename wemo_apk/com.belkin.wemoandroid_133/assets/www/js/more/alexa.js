/*
 alexa.js

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

function ConnectToAlexa() {
    var TAG = "alexa.js";

    var obj = {
        init: function () {
            wemoUtil.infoLog(TAG, "initialize");
            document.addEventListener('deviceready', this.onDeviceReady, false);
        },
        onDeviceReady: function(){
           var deviceHeight = $(window).height(),
               clickFlag = 0;

            $(".nav_item").on("click", function(e) {
                if (!$(this).hasClass("showItem")) {
                    $(".nav_item").removeClass("showItem");
                    $(".nav_sub_item").removeClass("showSubItem");

                     if ((deviceHeight - e.originalEvent.clientY) < 250 ) {
                        $('body').animate({
                            scrollTop: 200
                        }, 400);
                    }
                }
                $(this).toggleClass("showItem");
                $(this).next(".nav_sub_item").toggleClass("showSubItem");
            });

            $('.nav_sub_item .link').on("click", function(){
               var link = $(this).data('link'),
                    url = wemo.items[link];

                navigator.app.loadUrl(url, {
                    openExternal: true
                });
            });


            $(".back").click(function(){
                wemoUtil.loadUrl(filePath.MORE_MENU);
            });

            $(".openAlexa").click(function(){
                devicePlugin.execute(null, null, actions.LAUNCH_AMAZON_ALEXA_APP, []);
            });


            $(".banner").click(function() {
                clickFlag ++;
                if (clickFlag % 5 === 0) {
                  window.localStorage.removeItem('notify_skill');
                  window.localStorage.removeItem('showAlexaPopup');
                  window.sessionStorage.removeItem('notification_display');
                  window.sessionStorage.removeItem('whatIsNew_display');

                  $("#notification").fadeIn("slow");
                  setTimeout(function(){
                      $("#notification").fadeOut("slow");
                  }, 3000);
                }
            });

            obj.bindEvents();
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
            wemoUtil.loadUrl(filePath.MORE_MENU);
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
    };

    return obj;
}

$(document).bind('pageinit', function () {
    var connectToAlexa = new ConnectToAlexa();
    connectToAlexa.init();
});