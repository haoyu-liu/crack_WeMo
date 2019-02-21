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

$(document).bind('pageinit', function () {
    var view = View();
    view.initialize();
});

var View = function () {
    var TAG = "hardware_info.js: ",
        devicesObj = {},
        itemTemplate = _.template($('.itemTemplate').html()),
        View = {
            initialize: function () {
                console.log(TAG + "initialize");
                document.addEventListener('deviceready', this.onDeviceReady, false);
            },

            onDeviceReady: function () {
                console.log(TAG + "onDeviceReady");
                View.bindEvents();
                View.showSpinner();
                View.getDevices().then(function(){
                    View.renderList();
                    View.hideSpinner();
                });
            },

            bindEvents: function () {
                console.log(TAG + "bindEvents");
                document.addEventListener('online', View.onOnline, false);
                document.addEventListener('offline', View.onOffline, false);
                document.addEventListener("backbutton", View.onBackPress, false);
                document.addEventListener("pause", View.onPause, false);
                document.addEventListener("resume", View.onResume, false);
                $(".backbutton").on("tap", View.onBackPress);
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
                }
                else {
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

            reportError: function (e) {
                console.log(TAG + "Plugin Error!!!!   " + e);
                View.hideSpinner();
            },
            showSpinner: function () {
                nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
            },
            hideSpinner: function () {
                nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
            },
            getDevices: function () {
                wemoUtil.infoLog(TAG, "getLocalDevices");
                var parsedModel,
                    dfd = $.Deferred();

                smartDevicePlugin.execute(
                    function (discoveredDevices) {
                        wemoUtil.infoLog(TAG, "Get Local Devices Successful");

                        discoveredDevices.forEach(function (device) {
                            parsedModel = View.parseDeviceData(device);
                            if (View.validateDeviceType(parsedModel)) {
                                if (parsedModel.information && parsedModel.information.udn) {
                                    wemoUtil.infoLog(TAG, "Device UDN :: " + parsedModel.information.udn + " Device Name :: " + parsedModel.properties.friendlyName);
                                    devicesObj[parsedModel.information.udn] = parsedModel;
                                }
                            }
                        });

                        dfd.resolve();
                    },
                    View.reportError,
                    'getDevicesInfo',
                    []);

                return dfd.promise();
            },
            cleanString: function (s) {
                var output = "";
                try {
                    output = decodeURIComponent(escape(s));
                } catch (e) {
                    output = unescape(s);
                }


                return output;
            },
            parseDeviceData:function(model){
                if (!model.properties.friendlyName) {
                    if (model.information.udn.indexOf('bridge')) {
                        model.properties.friendlyName = "WeMo Link";
                    }
                } else if (model.properties.friendlyName.indexOf(';')) {
                    var netcamFN = model.properties.friendlyName.split(';');
                    model.properties.friendlyName = netcamFN[0];
                }

                model.properties.friendlyName = View.cleanString(model.properties.friendlyName);
                return model;
            },
            validateDeviceType: function (model) {
                var udn = model.information.udn;
                return (udn.indexOf('WEMO00') < 0);
            },
            renderItem: function (model) {
                return itemTemplate(model);
            },
            renderList: function () {
                var $listContainer = $('.device-info-list'),
                    html = "",
                    keys = [];

                for (i in devicesObj) {
                  if (devicesObj.hasOwnProperty(i)) {
                    keys.push(i);
                  }
                }
                keys.sort();

                keys.forEach(function (k) {
                    html += View.renderItem(devicesObj[k]);
                });

                $listContainer.html(html);
                $(".device-info__tile").on("tap", View.loadDeviceDetails);
            },
            findModel: function (udn) {
                return _.find(devices, function (device) {
                    return device.information.udn === udn;
                });
            },
            loadDeviceDetails: function () {
                var udn = $(this).attr('data-udn'),
                    model = devicesObj[udn];

                window.sessionStorage.setItem('deviceInfoModel', JSON.stringify(model));
                wemoUtil.loadUrl(filePath.DEVICE_HARDWARE_INFO);
            }
        };

    return View;

};
