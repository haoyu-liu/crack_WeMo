/*
 wemo_plugin.js

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

var nativeUtilPlugin = {
    execute: function(success_callback, error_callback, action, args) {
        console.log("nativeUtilPlugin execute Action: " + action);
        return cordova.exec(
            success_callback,
            error_callback,
            plugins.NATIVE_UTIL,
            action,
            args
        );
    }
};

var deviceTabPlugin = {
    execute: function(success_callback, error_callback, action, args) {
        console.log("deviceTabPlugin execute Action: " + action);
        console.log("deviceTabPlugin execute args: " + JSON.stringify(args));
        return cordova.exec(
            success_callback,
            error_callback,
            plugins.DEVICE,
            action,
            args
        );
    }
};

var devicePlugin = {
    execute: function(success_callback, error_callback, action, args) {
        console.log("devicePlugin execute Action: " + action);
        return cordova.exec(
            success_callback,
            error_callback,
            plugins.DEVICE,
            action,
            args
        );
    }
};


var rulesTabPlugin = {
    execute: function(success_callback, error_callback, action, args) {
        console.log("rulesTabPlugin execute Action: " + action);
        return cordova.exec(
            success_callback,
            error_callback,
            plugins.RULES,
            action,
            args
        );
    }
};


var rulesPlugin = {
    execute: function(success_callback, error_callback, action, args) {
        console.log("rulesPlugin execute Action: " + action);
        return cordova.exec(
            success_callback,
            error_callback,
            plugins.RULES_PLUGIN,
            action,
            args
        );
    }
};


var setupPlugin = {
    execute: function(success_callback, error_callback, action, args) {
        console.log("setupPlugin execute Action: " + action);
        return cordova.exec(
            success_callback,
            error_callback,
            plugins.SETUP,
            action,
            args
        );
    }
};

var sharedPreferencesPlugin = {
		execute: function(success_callback, error_callback, action, args) {
			console.log("sharedPreferencesPlugin execute Action: " + action);
			return cordova.exec(
					success_callback,
					error_callback,
					plugins.SHARED_PREF,
					action,
					args
			);
		}
};

var smartDevicePlugin = {
		execute: function(success_callback, error_callback, action, args) {
			return cordova.exec(
					success_callback,
					error_callback,
					plugins.SMART_DEVICE_PLUGIN,
					action,
					args
			);
		}
};


var SmartDevicePlugin = {
		execute: function(success_callback, error_callback, action, args) {
			return cordova.exec(
					success_callback,
					error_callback,
					plugins.SMART_DEVICE_PLUGIN,
					action,
					args
			);
		}
};

var appPlugin = {
		execute: function(success_callback, error_callback, action, args) {
			return cordova.exec(
					success_callback,
					error_callback,
					plugins.APP_PLUGIN,
					action,
					args
			);
		}
};

var sensorEventsPlugin = {
		execute: function(success_callback, error_callback, action, args) {
			return cordova.exec(
					success_callback,
					error_callback,
					plugins.SENSOR_EVENTS_PLUGIN,
					action,
					args
			);
		}
};

var appSettingsPlugin = {
		execute: function(success_callback, error_callback, action, args) {
			return cordova.exec(
					success_callback,
					error_callback,
					plugins.APP_SETTINGS_PLUGIN,
					action,
					args
			);
		}
};
/*
var StartApp = function() { };

StartApp.prototype.start = function(params, success, fail) {
    success = success ? success : function() {};
    fail = fail ? fail : function() {};
    var component = params.android;
    return cordova.exec(success, fail, 'StartApp', 'startApp', [component]);
};

window.startapp = new StartApp();
*/


var startAppPlugin = {
    execute: function(success_callback, error_callback, action, args) {
        console.log("startAppPlugin execute Action: " + action);
        return cordova.exec(
            success_callback,
            error_callback,
            plugins.START_APP,
            action,
            args
        );
    }
};

var cordovaHttp = {
    useBasicAuth: function(username, password, success, failure) {
        return cordova.exec(success, failure, plugins.HTTP_PLUGIN, "useBasicAuth", [username, password]);
    },
    setHeader: function(header, value, success, failure) {
        return cordova.exec(success, failure, plugins.HTTP_PLUGIN, "setHeader", [header, value]);
    },
    enableSSLPinning: function(enable, success, failure) {
        return cordova.exec(success, failure, plugins.HTTP_PLUGIN, "enableSSLPinning", [enable]);
    },
    acceptAllCerts: function(allow, success, failure) {
        return cordova.exec(success, failure, plugins.HTTP_PLUGIN, "acceptAllCerts", [allow]);
    },
    post: function(url, params, headers, success, failure) {
        return cordova.exec(success, failure, plugins.HTTP_PLUGIN, "post", [url, params, headers]);
    },
    get: function(url, params, headers, success, failure) {
        return cordova.exec(success, failure, plugins.HTTP_PLUGIN, "get", [url, params, headers]);
    },
    uploadFile: function(url, params, headers, filePath, name, success, failure) {
        return cordova.exec(success, failure, plugins.HTTP_PLUGIN, "uploadFile", [url, params, headers, filePath, name]);
    },
    downloadFile: function(url, params, headers, filePath, success, failure) {
        /*
         *
         * Licensed to the Apache Software Foundation (ASF) under one
         * or more contributor license agreements.  See the NOTICE file
         * distributed with this work for additional information
         * regarding copyright ownership.  The ASF licenses this file
         * to you under the Apache License, Version 2.0 (the
         * "License"); you may not use this file except in compliance
         * with the License.  You may obtain a copy of the License at
         *
         *   http://www.apache.org/licenses/LICENSE-2.0
         *
         * Unless required by applicable law or agreed to in writing,
         * software distributed under the License is distributed on an
         * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
         * KIND, either express or implied.  See the License for the
         * specific language governing permissions and limitations
         * under the License.
         *
         * Modified by Andrew Stephan for Sync OnSet
         *
         */
        var win = function(result) {
            var entry = new(require('org.apache.cordova.file.FileEntry'))();
            entry.isDirectory = false;
            entry.isFile = true;
            entry.name = result.file.name;
            entry.fullPath = result.file.fullPath;
            success(entry);
        };
        return cordova.exec(win, failure, plugins.HTTP_PLUGIN, "downloadFile", [url, params, headers, filePath]);
    }
};
