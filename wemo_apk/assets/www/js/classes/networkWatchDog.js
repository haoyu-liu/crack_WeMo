/*
 networkWatchDog.js

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

var networkWatchDog = {
    last_state: '',
    TAG: 'com.belkin.wemo.watchdog',

    initialize: function () {
        document.addEventListener("deviceready", networkWatchDog.onDeviceReady, false);
    },
    onDeviceReady: function ()
    {
        networkWatchDog.last_state = '0';
        wemoUtil.infoLog(networkWatchDog.TAG, "Starting watchdog with state: " + networkWatchDog.last_state);
        networkWatchDog.workThread();
    },
    workThread: function () {
        setTimeout(function () {
            if (!disableNetworkWatchdog) {
                var new_state = '4', networkState = 0;
                if (navigator.connection.type == Connection.CELL_2G ||
                    navigator.connection.type == Connection.CELL_3G ||
                    navigator.connection.type == Connection.CELL_4G) {
                    new_state = '1';
                } else if (navigator.connection.type == Connection.WIFI) {
                    new_state = '2';
                } else if (navigator.connection.type == Connection.ETHERNET) {
                    new_state = '3';
                }

                if (networkWatchDog.last_state == '0') {
                    networkWatchDog.last_state = new_state;
                } else {
                    if (networkWatchDog.last_state != new_state) {
                        wemoUtil.infoLog(networkWatchDog.TAG, 'Network type changed from ' + networkWatchDog.last_state + ' to ' + new_state);
                        networkWatchDog.last_state = new_state;

                       if ((new_state === "1") || (new_state === "2") || (new_state === "3") ) {
                           networkState = 5;
                       } else {
                           devicePlugin.execute(null, null, actions.STOP_CONTROL_POINT, []);
                       }

                        setTimeout(function() {
                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);

                            if (typeof showNetworkReachabilityMsg === 'undefined') {
                                wemoUtil.loadUrl(filePath.INDEX);
                            } else {
                                wemoUtil.showReachabilityMsg(networkState);
                            }
                        }, timeout.PLUGIN_DELAY);
                    }
                }
            }
            networkWatchDog.workThread();
        }, 8000);
    }
};