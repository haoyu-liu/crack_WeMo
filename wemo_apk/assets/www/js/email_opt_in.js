/*
 email_opt_in.js

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
    EmailOptIn().init();
});

function EmailOptIn() {
    var TAG = "email_opt_in.js",
        storedEmails = [],
        optIn = true,
        View = {
            init: function () {
                wemoUtil.infoLog(TAG, "initialize");
                document.addEventListener('deviceready', View.onDeviceReady, false);
            },
            getLegacyStoredEmails: function () {
                window.cordova.exec(
                    function(data) {
                        if(data !== "") {
                            var emails = JSON.parse(data);
                            emails.deviceTypes.forEach(function (device) {
                                device.emailAddress.forEach(function (email) {
                                    if (View.validateEmail(email)) {
                                        storedEmails.push(email);
                                    }
                                });
                            });
                        }
                    },
                    null,
                    plugins.NATIVE_UTIL,
                    actions.GET_LEGACY_EMAIL, []);
            },
            onDeviceReady: function () {
                wemoUtil.infoLog(TAG, "device is ready");
                View.getLegacyStoredEmails();
                View.render();
            },
            render:function(){
                var $emailField = $('#enter_email');

                $emailField.attr('placeholder', wemo.items['SetupInstructions_EnterEmail']);

                if(storedEmails.length > 0){
                    $emailField.val(storedEmails.pop());
                }

                $emailField.on('keyup', function(){
                    if (View.validateEmail($emailField.val())) {
                        $('.error').removeClass('error');
                    } else {
                        $('.ui-content').addClass('error');
                    }
                });

                $('.save_email').on('click', function () {
                    if (View.validateEmail($emailField.val())) {
                        $('.error').removeClass('error');
                        View.saveEmail();
                    } else {
                        $('.ui-content').addClass('error');
                    }
                });

                $('#opt_in').on('click', View.toggleOptIn);
            },
            toggleOptIn:function(){
                var $optInCheck = $('.opt_in_check'),
                    selected = $optInCheck.hasClass('selected');

                if(selected){
                    $optInCheck.removeClass('selected');
                    optIn = false;
                } else {
                    $optInCheck.addClass('selected');
                    optIn = true;
                }
            },
            validateEmail: function (emailString) {
                wemoUtil.infoLog(TAG, "validating email");
                var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
                    isValid = re.test(emailString);

                return isValid;
            },
            getFilteredDeviceType: function(type) {
                wemoUtil.infoLog(TAG, "getFilteredDeviceType type: " + type);
                if (type.indexOf("sensor") != -1) {
                    type = "Sensor";
                } else if (type.indexOf("dimmer") != -1) {
                    type = "Dimmer";
                } else if (type.indexOf("controllee") != -1) {
                    type = "Switch";
                } else if (type.indexOf("insight") != -1) {
                    type = "Insight";
                } else if (type.indexOf("bridge") != -1) {
                    type = "Bridge";
                } else if (type.indexOf("lightswitch") != -1) {
                    type = "Lightswitch";
                } else if (type.indexOf("coffeeMaker") != -1 || type.indexOf("CoffeeMaker") != -1) {
                    type = "coffeeMaker";
                } else if (type.indexOf("Maker") != -1) {
                    type = "Maker";
                } else if (type.indexOf("crockpot") != -1 || type.indexOf("Crockpot") != -1) {
                    type = "crockpot";
                } else if (type.indexOf("heaterA") != -1 || type.indexOf("HeaterA") != -1) {
                    type = "heaterA";
                } else if (type.indexOf("heaterB") != -1 || type.indexOf("HeaterB") != -1) {
                    type = "heaterB";
                } else if (type.indexOf("humidifier") != -1 || type.indexOf("Humidifier") != -1) {
                    type = "humidifier";
                } else if (type.indexOf(deviceType.HUMIDIFIERB) != -1 || type.indexOf(wemoHumidifierB.REMOTE_TYPE) != -1) {
                    type = deviceType.HUMIDIFIERB;
                } else if (type.indexOf("airPurifier") != -1 || type.indexOf("AirPurifier") != -1) {
                    type = "airPurifier";
                }
                return type;
            },
            createEmailObject:function(){
                var email = $('#enter_email').val();

                return {
                    optIn: optIn,
                    email: email
                };
            },
            saveEmail: function () {
                wemoUtil.infoLog(TAG, "attempting to save email");
                var emailObj = this.createEmailObject(),
                    type = View.getFilteredDeviceType(window.sessionStorage.getItem('type'));

                window.sessionStorage.setItem('filtered_type', type);

                nativeUtilPlugin.execute(
                    function(){
                        wemoUtil.log(TAG, "Email saved successfully");
                        View.loadIndex();
                },
                    function(err){
                        wemoUtil.log(TAG, "Email did not save:" + err);
                        View.loadIndex();
                }, actions.SET_EMAIL_ADDRESS, [emailObj]);

            },
            loadIndex: function () {
                wemoUtil.log(TAG, "Returning to setup");
                wemoUtil.loadUrl(filePath.INDEX);
            }
        };

    return View;
}