/*

 Created by Belkin International, Software Engineering on 11/10/2016.
 Copyright (c) 2012-2016 Belkin International, Inc. and/or its affiliates. All rights reserved.

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

$(document).bind('pageinit', function () {
    var view = View();
    view.initialize();
});

var View = function () {
    var TAG = "get_in_touch_with_us.js: ",
        View = {
            initialize: function () {
                wemoUtil.infoLog(TAG, "initialize");
                document.addEventListener('deviceready', this.onDeviceReady, false);
            },

            onDeviceReady: function () {
                View.bindEvents();

                $(".getInTouchLink").on("click", function(){
                    var url = "http://www.belkin.com/us/support-article?articleNum=208558";
                    navigator.app.loadUrl(url, {
                        openExternal: true
                    });
                });
            },

            bindEvents: function () {
                document.addEventListener('online', View.onOnline, false);
                document.addEventListener('offline', View.onOffline, false);
                document.addEventListener("backbutton", View.onBackPress, false);
                document.addEventListener("pause", View.onPause, false);
                document.addEventListener("resume", View.onResume, false);
                $(".backbutton").on("tap", View.onBackPress);
            },

            onOffline: function () {
                wemoUtil.infoLog(TAG, "offLine");
            },

            onOnline: function () {
                wemoUtil.infoLog(TAG, "onLine");
            },

            onBackPress: function () {
                wemoUtil.loadUrl(filePath.MORE_MENU);
            },

            onPause: function () {
                wemoUtil.infoLog(TAG, "onPause");
            },

            onResume: function () {
                wemoUtil.infoLog(TAG, "onResume");
            },

            reportError: function (e) {
                wemoUtil.infoLog(TAG, "Plugin Error!!!!   " + e);
                View.hideSpinner();
            },
            showSpinner: function () {
                nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
            },
            hideSpinner: function () {
                nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
            }
        };

    return View;

};
