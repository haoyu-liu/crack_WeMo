/*
 firmware_versions.js

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

var TAG = "firmware_versions.js: ";

$(document).bind('pageinit', function () {
    var view = View();
    view.initialize();
});

var View = function () {

    var TAG = "app_info.js: ",
        template = _.template($('.app-info-summary').html()),
        appInfo = {
            appVersion: "",
            buildNumber: "",
            smartDeviceName: "",
            smartDeviceModel: "",
            internetConnected: false,
            cloudConnected: false,
            ssid: ""
        },
        View = {

            initialize: function () {
                console.log(TAG + "initialize");
                document.addEventListener('deviceready', this.onDeviceReady, false);
            },

            onDeviceReady: function () {
                console.log(TAG + "onDeviceReady");
                View.bindEvents();
                View.buildAppInfo();
                $(".backbutton").on("tap", View.onBackPress);
            },

            bindEvents: function () {
                console.log(TAG + "bindEvents");
                document.addEventListener('online', View.onOnline, false);
                document.addEventListener('offline', View.onOffline, false);
                document.addEventListener("backbutton", View.onBackPress, false);
                document.addEventListener("pause", View.onPause, false);
                document.addEventListener("resume", View.onResume, false);
            },

            onOffline: function () {
                console.log(TAG + "offLine");
            },

            onOnline: function () {
                console.log(TAG + "onLine");
            },

            onBackPress: function () {
                var $moreTab = $(".more_tab");

                if ($moreTab.is(":visible")) {
                    $moreTab.hide();
                    $('body').find('.modalWindow').transition({opacity: 0}, 400, function () {
                        $(this).removeClass('isOpen');
                    });
                } else {
                    console.log(TAG + "onBackPress");
                    wemoUtil.loadPreviousUrl();
                }
            },

            onPause: function () {
                console.log(TAG + "onPause");
            },

            onResume: function () {
                console.log(TAG + "onResume");
            },
            showSpinner: function () {
                nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
            },
            hideSpinner: function () {
                nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
            },
            reportError: function (e) {
                console.log(TAG + "Plugin Error!!!!   " + e);
                View.hideSpinner();
            },
            getAppDeviceInfo: function () {
                var dfd = $.Deferred();
                nativeUtilPlugin.execute(
                    function(deviceInfoObj){
                        dfd.resolve(JSON.parse(deviceInfoObj));
                    },
                    View.reportError,
                    actions.ACTION_GET_APP_AND_DEVICE_INFO,
                    []
                );
                return dfd.promise();
            },
            checkInternetConnection: function () {
                var dfd = $.Deferred();

                $.ajax({
                    url: "http://null:null@www.apple.com"
                }).done(function () {
                    dfd.resolve(true);
                }).fail(function (httpObj) {
                    if (httpObj.status == 200)
                        dfd.resolve(true);
                    else
                        dfd.resolve(false);
                });

                return dfd.promise();
            },
            checkCloudConnection:function(){
                var dfd = $.Deferred();
                cordova.exec(
                    function () {
                        dfd.resolve(true);
                    },
                    function () {
                        dfd.resolve(false);
                    },
                    "WebServicePlugin", "getAuthCode", []);

                return dfd.promise();
            },
            buildAppInfo: function () {
                View.showSpinner();
                $.when(View.checkInternetConnection(), View.checkCloudConnection(), View.getAppDeviceInfo()).then(function (hasInternet, hasCloud, deviceInfoObj) {
                    appInfo.appVersion = deviceInfoObj.appVersionName;
                    appInfo.buildNumber = deviceInfoObj.appVersionCode;
                    appInfo.smartDeviceName = deviceInfoObj.deviceUserInfo;
                    appInfo.smartDeviceModel = deviceInfoObj.deviceModelName;
                    appInfo.internetConnected = hasInternet;
                    appInfo.cloudConnected = hasCloud;
                    appInfo.ssid = window.sessionStorage.getItem('NETWORK_NAME');

                    View.render();

                }, function (e) {
                    View.reportError(e);
                });
            },
            render: function () {
                var html = template(appInfo);
                $('.app-info__content').html(html);
                View.hideSpinner();
            }
        };

    return View;
};
