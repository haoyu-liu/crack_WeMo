/*

tell_us.js

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

$(document).bind('pageinit', function() {
    tellUs.initialize();
});

function CDuplicateEventPreventor() {
    var lastSubmittedTimestamp = 0;
    this.validate = function(currentTimestamp) {
        if (currentTimestamp - lastSubmittedTimestamp > 1000) {
            lastSubmittedTimestamp = currentTimestamp;
            return true;
        }
        return false;
    }
}

function CFormValidator() {
    var fields = [];
    var fieldprefix = null;

    var NotNull = function(value) {
        if (null === value || 'undefined' === typeof value)
            return false;
        return true;
    };
    var NotBlank = function(value) {
        if ('string' !== typeof value) {
            if ('object' === typeof value) {
                return true;
            }
            return false;
        } else if ('' === value.replace(/^\s+/g, '').replace(/\s+$/g, '')) {
            return false;
        }
        return true;
    };
    var Required = function(value) {
        return NotBlank(value);
    };
    var Alphanum = function(value) {
        var pattern = new RegExp(regexpPattern.insensitive.alphanum, regexpModifier.insensitive);
        return pattern.test(value);
    };
    var FullName = function(value) {
        var pattern = new RegExp(regexpPattern.insensitive.fullname, regexpModifier.insensitive);
        return pattern.test(value);
    };
    var Email = function(value) {
        var pattern = new RegExp(regexpPattern.insensitive.email, regexpModifier.insensitive);
        return pattern.test(value);
    };
    var Telephone = function(value) {
        var pattern = new RegExp(regexpPattern.insensitive.telephone, regexpModifier.insensitive);
        return pattern.test(value);
    };
    var MinLength = function(value, minlen) {
        return (value.length >= minlen);
    };
    var error = function(fieldname, bool, message) {
        var fieldwrapper = $('div#' + fieldprefix + fieldname + ' div.error');
        if (!bool) {
            fieldwrapper.removeClass('hide').html(message);
        } else {
            if (!fieldwrapper.hasClass('hide')) {
                fieldwrapper.addClass('hide').html('');
            }
        }
        return bool;
    };
    this.setFields = function(list) {
        fields = list;
    };
    this.setFieldPrefix = function(prefix) {
        fieldprefix = prefix;
    };
    this.isValid = function(values) {
        var totalerrors = [];
        for (i in fields) {
            var status = null,
                isrequired = false;
            for (j in fields[i]) {
                switch (j) {
                    case 'Required':
                        isrequired = true;
                        status = error(i, Required(values[i]), fields[i][j]);
                        break;
                    case 'FullName':
                        if (isrequired || NotBlank(values[i])) {
                            status = error(i, FullName(values[i]), fields[i][j]);
                        }
                        break;
                    case 'Alphanum':
                        if (isrequired || NotBlank(values[i])) {
                            status = error(i, Alphanum(values[i]), fields[i][j]);
                        }
                        break;
                    case 'Email':
                        if (isrequired || NotBlank(values[i])) {
                            status = error(i, Email(values[i]), fields[i][j]);
                        }
                        break;
                    case 'Telephone':
                        if (isrequired || NotBlank(values[i])) {
                            status = error(i, Telephone(values[i]), fields[i][j]);
                        }
                        break;
                    case 'MinLength':
                        if (isrequired || NotBlank(values[i])) {
                            status = error(i, MinLength(values[i], fields[i][j][0]), fields[i][j][1]);
                        }
                        break;
                }
                if (status !== null && !status) {
                    totalerrors.push('x');
                    break;
                }
            }
        }
        return (totalerrors.join('').length > 0) ? false : true;
    };
}

var tellUs = {
    TAG: "tell_us.js: ",

    currentPage: '',

    initialize: function() {
        wemoUtil.infoLog(tellUs.TAG, "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    tellUsWhatYouThink: {
        sendEmail: function() {
            nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
            setTimeout(
                function() {
                	appPlugin.execute(
                        function(network_type) {
                            wemoUtil.infoLog(tellUs.TAG, "network type: " + network_type)
                            if (network_type == networkType.HOME_NETWORK) {
                                tellUs.sendLocalEmail();
                            } else {
                                tellUs.sendRemoteEmail();
                            }
                        },
                        tellUs.reportError,
                        actions.GET_MOBILE_NETWORK_TYPE, []
                    );
                },
                timeout.LONG
            );
        },
        show: function() {
            tellUs.currentPage = 'tellUsWhatYouThink';
            $('#mainPage').show();
            $('#mainPage div.sub_header').css({
                'z-index': 3,
                'margin-top': $('#mainPage .wemo_logo').css('height')
            });
        },
        onClick_ReportAProblem: function() {
            wemoUtil.infoLog(tellUs.TAG, "onClick_ReportAProblem");
            tellUs.tellUsWhatYouThink.sendEmail();
        },
        onClick_RateWeMoApp: function() {
            wemoUtil.infoLog(tellUs.TAG, "onClick_RateWeMoApp");
            tellUs.rateWeMOapplication();
        },
        onClick_NotNow: function() {
            wemoUtil.infoLog(tellUs.TAG, "onClick_NotNow");
            wemoUtil.loadPreviousUrl();
        },
    },

    reportAProblem: {
        isEmailBased: false,
        isFormSubmitted: false,
        beforeSubmit: new CDuplicateEventPreventor(),
        submittedValues: null,
        submittedSummary: '',
        requiredFields: null,
        validations: {
            yourname: {
                Required: wemo.items['FormFieldRequired'],
                FullName: wemo.items['FormFieldInvalidFullName']
            },
            email: {
                Required: wemo.items['FormFieldRequired'],
                Email: wemo.items['FormFieldInvalidEmail']
            },
            product: {
                Required: wemo.items['FormFieldSelectRequired'],
            },
            problem: {
                Required: wemo.items['FormFieldSelectRequired'],
            },
            comment: {}
        },
        clearFields: function() {
            $('form#reportaproblem_form')[0].reset();
        },
        show: function() {
            tellUs.currentPage = 'reportAProblem';
            tellUs.reportAProblem.clearFields();
            $.mobile.changePage('#reportaproblem');
        },
        backToPreviousPage: function() {
            window.history.go(-2);
        },
        sendEmail: function() {
        	wemoUtil.progress.show();
            setTimeout(
                function() {
                    appPlugin.execute(
                        function(network_type) {
                            wemoUtil.infoLog(tellUs.TAG, "network type: " + network_type)
                            if (network_type == networkType.HOME_NETWORK) {
                                tellUs.sendLocalEmail();
                            } else {
                                tellUs.sendRemoteEmail();
                            }
                            tellUs.thankyouForReporting.show();
                        },
                        tellUs.reportError,
                        actions.GET_MOBILE_NETWORK_TYPE, []
                    );
                },
                timeout.LONG
            );
        },
        defaultRequiredFields: function() {
            tellUs.reportAProblem.requiredFields = {
                yourname: 0,
                email: 0
            };
        },
        enableSubmitButton: function() {
            $("#reportaproblem_form_submit").removeClass('ui-state-disabled');
        },
        disableSubmitButton: function() {
            if (!$("#reportaproblem_form_submit").hasClass('ui-state-disabled')) {
                $("#reportaproblem_form_submit").addClass('ui-state-disabled');
            }
        },
        sendToCloud: function(formValues) {
	    wemoUtil.infoLog(tellUs.TAG, "sendToCloud");
	    var templates = {
	        HEADER: '\n\n=====[0]=====\n\n',
	        LED_DEVICE: 'DEVICE ID: [deviceid], DEVICE TYPE: [devicetype], Friendly Name: [friendlyname], UnReachable: [unreachable]',
	        GROUP_DEVICE: 'GROUP ID: [groupid], DEVICE ID: [deviceid], DEVICE TYPE: [devicetype], Friendly Name: [friendlyname], UnReachable: [unreachable]',
	        BREAK: '\n\n'
	    };
	    var nativeCall = {
	        onSuccess_CollectMetaData: function(wemoInfo) {
	            wemoUtil.infoLog(tellUs.TAG, "wemoInfo " + wemoInfo);
	            var getDeviceInfo = function(sessionkey, template, params) {
	                var deviceInfo = wemoUtil.getJSONObjectFromSessionStorage(sessionkey);
	                var output = '';
	                if (deviceInfo != undefined && deviceInfo != "") {
	                    for (var i = 0; i < deviceInfo.length; i++) {
	                        for (var j = 0, id, args = []; j < params.length; j++) {
	                            id = params[j];
	                            args[id] = deviceInfo[i][id];
	                        }
	                        output += wemoUtil.templator.fixIn(template, args);
	                        output += templates.BREAK;
	                    }
	                }
	                return output;
	            };

	            wemoInfo = wemoUtil.templator.fitIn(templates.HEADER, [wemo.items['tellus_email_heading']]) + wemoInfo;

	            wemoInfo += getDeviceInfo(sessionStore.LED_DEVICE_INFO, templates.LED_DEVICE, [key.DEVICEID, key.DEVICETYPE, key.FRIENDLYNAME, key.UNREACHABLE]);

	            wemoInfo += getDeviceInfo(sessionStore.LED_GROUP_INFO, templates.GROUP_DEVICE, [key.GROUPID, key.DEVICEID, key.DEVICETYPE, key.FRIENDLYNAME, key.UNREACHABLE]);

	            tellUs.reportAProblem.packageAndPost(formValues, wemoInfo);
	        },

	        onSuccess_CollectRemoteMetaData: function(response) {
	            wemoUtil.infoLog(tellUs.TAG, "Success call back: homeId: " + response[1] + " authCode: " + response[0]);
	            var homeId = response[1];
	            var authCode = response[0];
	            $.ajax({
	                url: cloudAPI.LED_DEVICE_LIST + homeId,
	                type: "GET",
	                beforeSend: function(xhr) {
	                    xhr.setRequestHeader('Content-Type', 'application/xml');
	                    xhr.setRequestHeader('Authorization', authCode);
	                },
	                success: function(data) {
	                    wemoUtil.infoLog(tellUs.TAG, "Success callback from cloud: " + data);
	                    var responseXML = (new XMLSerializer()).serializeToString(data);
	                    var splitLength = 4000;
	                    var length = responseXML.length;
	                    var ittr = Math.floor(length / splitLength) + 1;
	                    for (var i = 0; i < ittr; i++) {
	                        var end = ((i + 1) * splitLength);
	                        if (end > length) {
	                            end = length;
	                        }
	                        wemoUtil.infoLog(tellUs.TAG, responseXML.substring(splitLength * i, end));
	                    }
	                    $('#device_list_container').empty();
	                    var wemoInfo = wemoUtil.templator.fitIn(templates.HEADER, [wemo.items['tellus_email_heading']]);
	                    $(data).find('device').each(function(i) {
	                        wemoUtil.infoLog(tellUs.TAG, "Plugin: " + i);
	                        var device_type = $(this).find("modelCode").text();
	                        wemoUtil.infoLog(tellUs.TAG, "device_type:  " + device_type);
	                        if (device_type != "") {
	                            if (device_type == "LED" || wemoUtil.isSupportedLedModelCode(device_type)) {
	                                var device_status = $(this).find("status").text();
	                                var deviceid = "DEVICE ID: " + $(this).find("macAddress").text();
	                                var devicetype = "DEVICE TYPE: " + wemo.items['Led_Device_Type'];
	                                var friendlyname = "Friendly Name: " + $(this).find("friendlyName").text();
	                                var groupid = "";
	                                var unreachable = 'UnReachable: ' + (device_status == 3) ? 'Yes' : 'No'; 
	                                $(this).find('groupProfile').each(function(i) {
	                                    groupid = "GROUP ID: " + $(this).find("referenceId").text();
	                                });
	                                if (groupid != undefined && groupid != "") {
	                                    wemoInfo += groupid + ", " + deviceid + ", " + devicetype + ", " + friendlyname + ", " + unreachable + "\n\n";
	                                } else {
	                                    wemoInfo += deviceid + ", " + devicetype + ", " + friendlyname + ", " + unreachable + "\n\n";
	                                }
	                                wemoUtil.infoLog(tellUs.TAG, "wemoInfo " + wemoInfo + "--" + device_type);
	                            } else {
	                                var device_mac_address = $(this).find("macAddress").text();
	                                var device_firmware_version = $(this).find("firmwareVersion").text();
	                                var signal_strength = $(this).find("signalStrength").text();
	                                var device_meta_info = "Device Extended Meta Info : NA";
	                                if (device_type == "Bridge" || device_type.search("Bridge") == true) {
	                                    var device_friendly_name = "WeMo Link";
	                                    var device_type = "WeMo Link";
	                                } else {
	                                    var device_friendly_name_1 = $(this).find("friendlyName").text();
	                                    var device_friendly_name = device_friendly_name_1.replace("\xC2", "");
	                                }
	                                if (wemoUtil.isCamDevice(device_type)) {
	                                    device_friendly_name = wemoUtil.extractNetCamName(device_friendly_name);
	                                }
	                                var unreachable = 'UnReachable: ' + (device_status == 3) ? 'Yes' : 'No';
	                                if (device_type == "Socket") {
	                                    device_type = "Switch";
	                                }
	                                if (device_type.indexOf('NetCam') != -1) {
	                                    device_type = "NetCam";
	                                }
	                                wemoInfo += device_type + ", " + device_mac_address + ", " + device_firmware_version + ", " + signal_strength + ", " + device_friendly_name + ", " + unreachable + ", " + device_meta_info + "\n\n";
	                                wemoUtil.infoLog(tellUs.TAG, "wemoInfo " + wemoInfo + "--" + device_type);
	                            }
	                        }
	                    });

	                    tellUs.reportAProblem.packageAndPost(formValues, wemoInfo);
	                },
	                error: function(xhr, textstatus) {
	                	wemoUtil.infoLog(tellUs.TAG, 'status: ' + xhr.status);
						wemoUtil.infoLog(tellUs.TAG, 'status text: ' + xhr.statusText);
	                },
	            });
	        },
	        onFailure: function(e) {
	            tellUs.reportError(e);
	        }
	    };

	    wemoUtil.progress.show();
	    appPlugin.execute(
	        function(network_type) {
	            wemoUtil.infoLog(tellUs.TAG, "network type: " + network_type)
	            if (network_type == networkType.HOME_NETWORK) {
                        appSettingsPlugin.execute(nativeCall.onSuccess_CollectMetaData,
                        nativeCall.onSuccess_CollectMetaData,
	                    actions.GET_LOCAL_EMAIL_BODY, []);
	            } else {
	                cordova.exec(nativeCall.onSuccess_CollectRemoteMetaData,
	                    nativeCall.onFailure,
	                    "WebServicePlugin", "getAuthCode", []);
	            }
	            return true;
	        },
	        tellUs.reportError,
	        actions.GET_MOBILE_NETWORK_TYPE, []
	    );
	    return true;
	},

        //Function to send the form data and meta info to the Sales force cloud
        packageAndPost: function(formValues, deviceMeta) {
            wemoUtil.infoLog(tellUs.TAG, "packageAndPost");

            var procedure = {
                getFirstname: function(name) {
                    var firstName = name.substr(0, name.indexOf(' ') == -1 ? name.length : name.indexOf(' '));
                    firstName = firstName.length > reportAProblemFieldLength.firstName ? firstName.substring(0, reportAProblemFieldLength.firstName) : firstName;
                    return firstName;
                },
                getLastname: function(name) {
                    var lastName = name.substr(name.indexOf(' ') == -1 ? name.length : name.indexOf(' ') + 1);
                    lastName = lastName.length > reportAProblemFieldLength.lastName ? lastName.substring(0, reportAProblemFieldLength.lastName) : lastName;
                    return lastName;
                },
                getProblemCode: function(problem) {
                    var problemCode = ReportAProblem.PROBLEM[problem].code + ' - ' + problem;
                    return problemCode;
                },
                getCaseSubject: function(product, problem) {
                    var caseSubject = product + ' - ' + problem;
                    return caseSubject;
                },
                getCaseNotes: function(comment, deviceMeta) {
                    var androidVersion = ' Android Version: ' + device.version;
                    comment = wemoUtil.fixedEncodeURI(comment);
                    deviceMeta = deviceMeta + androidVersion;
                    var caseNotes = comment + deviceMeta;
                    return caseNotes;
                }
            };

            var nativeCall = {
                onSuccess: function(statusResponse) {
                    wemoUtil.infoLog(tellUs.TAG, "Response from Salesforce Cloud: " + JSON.stringify(statusResponse));
                    wemoUtil.progress.hide();
                    var JSONobj = JSON.parse(statusResponse);
                    if (JSONobj.statusCode == 200) {
                        wemoUtil.infoLog(tellUs.TAG, " Success response from Salesforce Cloud : " + statusResponse);
                        tellUs.reportAProblem.clearFields();
                        tellUs.thankyouForReporting.show();
                    } else {
                        wemoUtil.infoLog(tellUs.TAG, " Failure response from Salesforce Cloud : " + statusResponse);
                        $("#error_popup").popup("open");
                    }
                },
                onFailure: function(statusResponse) {
                	wemoUtil.progress.hide();
                    $("#error_popup").popup("open");
                    wemoUtil.infoLog(tellUs.TAG, "Failed to connect to Salesforce Cloud Plugin: " + statusResponse);
                }
            };

            var formData = [
                procedure.getFirstname(formValues['yourname']),
                procedure.getLastname(formValues['yourname']),
                formValues['email'],
                formValues['phone'],
                formValues['product'],
                procedure.getProblemCode(formValues['problem']),
                procedure.getCaseSubject(formValues['product'], formValues['problem']),
                procedure.getCaseNotes(formValues['comment'], deviceMeta)
            ];

            appSettingsPlugin.execute(nativeCall.onSuccess, nativeCall.onFailure, actions.REPORT_A_PROBLEM, formData);

            return true;
        },

        onSubmitForm: function() {
            var form = $("#reportaproblem_form");
            var values = {};
            $.each(form.serializeArray(), function(i, field) {
                if (!values.hasOwnProperty(field.name)) {
                    values[field.name] = field.value;
                } else {
                    if (typeof(values[field.name]) == 'string') {
                        var fieldvalue = values[field.name];
                        values[field.name] = [];
                        values[field.name].push(fieldvalue);
                    }
                    values[field.name].push(field.value);
                }
            });
            wemoUtil.infoLog(tellUs.TAG, 'reportaproblem_form -> submitted form values' + JSON.stringify(values));
            var validator = new CFormValidator();
            validator.setFieldPrefix('rapf_');
            validator.setFields(tellUs.reportAProblem.validations);
            if (validator.isValid(values)) {
                wemoUtil.infoLog(tellUs.TAG, 'reportaproblem_form -> submitted form values are valid');
                tellUs.reportAProblem.submittedValues = values;
                tellUs.reportAProblem.submittedSummary = wemoUtil.templator.fitIn(wemo.items['ReportaProblemEmailTemplate'], [
                    values['yourname'],
                    values['email'], (typeof values['product'] == 'object') ? values['product'].join(', ') : values['product'],
                    values['problem'],
                    values['comment'],
                    values['phone']
                ]);

                tellUs.reportAProblem.isFormSubmitted = true;
                if (tellUs.reportAProblem.isEmailBased) {
                    tellUs.reportAProblem.sendEmail();
                } else {
                    tellUs.reportAProblem.sendToCloud(values);
                }
                return true;
            } else {
                return false;
            }
        },
        onClick_SubmitForm: function(e) {
            e.preventDefault();
            e.stopPropagation();
            if (tellUs.reportAProblem.beforeSubmit.validate(e.timeStamp)) {
                return tellUs.reportAProblem.onSubmitForm();
            }
            return false;
        },
        checkRequiredInputFields: function(element) {
            tellUs.reportAProblem.requiredFields[element.name] = (typeof element.value == 'string' && element.value.replace(/^\s+/g, '').replace(/\s+$/g, '') === '') ? 0 : 1;
            var sum = 0;
            for (var i in tellUs.reportAProblem.requiredFields) {
                sum += tellUs.reportAProblem.requiredFields[i];
            }
            if (sum == Object.getOwnPropertyNames(tellUs.reportAProblem.requiredFields).length) {
                tellUs.reportAProblem.enableSubmitButton();
            } else {
                tellUs.reportAProblem.disableSubmitButton();
            }
        },
        onKeyPress_RequiredInputFields: function(e) {
            tellUs.reportAProblem.checkRequiredInputFields(e.target);
        },
        onSubmitFailure: function() {
            $("#error_popup").popup("close");
            document.ontouchmove = function(e) {
                return true;
            }
        },
        form: {
            sessionKey: sessionStore.PERSIST_REPORT_A_PROBLEM_FORM,
            container: null,
            keys: null,
            setKeys: function() {
                tellUs.reportAProblem.form.keys = {
                    yourname: tellUs.reportAProblem.form.container.find('input[name="yourname"]'),
                    email: tellUs.reportAProblem.form.container.find('input[name="email"]'),
                    product: tellUs.reportAProblem.form.container.find('select[name="product"]'),
                    problem: tellUs.reportAProblem.form.container.find('select[name="problem"]'),
                    comment: tellUs.reportAProblem.form.container.find('textarea[name="comment"]'),
                    phone: tellUs.reportAProblem.form.container.find('input[name="phone"]'),
                }
            },
            retain: function() {
                var form = $("#reportaproblem_form");
                var values = {
                    yourname: tellUs.reportAProblem.form.keys.yourname.val(),
                    email: tellUs.reportAProblem.form.keys.email.val(),
                    product: tellUs.reportAProblem.form.keys.product.val(),
                    problem: tellUs.reportAProblem.form.keys.problem.val(),
                    comment: tellUs.reportAProblem.form.keys.comment.val(),
                    phone: tellUs.reportAProblem.form.keys.phone.val(),
                };
                window.sessionStorage.setItem(tellUs.reportAProblem.form.sessionKey, JSON.stringify(values));
            },
            retrieve: function() {
                var storedValue = window.sessionStorage.getItem(tellUs.reportAProblem.form.sessionKey);
                if (storedValue != undefined) {
                    var values = JSON.parse(storedValue);
                }
                if (typeof values === 'object' && values != undefined) {
                    tellUs.reportAProblem.form.keys.yourname.val((values.yourname != null) ? values.yourname : ''),
                        tellUs.reportAProblem.form.keys.email.val((values.email != null) ? values.email : ''),
                        tellUs.reportAProblem.form.keys.product.val((values.product != null) ? values.product : ''),
                        tellUs.reportAProblem.form.keys.problem.val((values.problem != null) ? values.problem : ''),
                        tellUs.reportAProblem.form.keys.comment.val((values.comment != null) ? values.comment : ''),
                        tellUs.reportAProblem.form.keys.phone.val((values.phone != null) ? values.phone : '')
                }
                var reqFields = tellUs.reportAProblem.form.container.find('div > input[required]');
                for (var i in reqFields) {
                    tellUs.reportAProblem.checkRequiredInputFields(reqFields[i]);
                }
            },
            localize: function() {
                var fields = tellUs.reportAProblem.form.container.find('[data-l10n]');
                for (var i = 0, len = fields.length; i < len; i++) {
                    $(fields[i]).attr('placeholder', wemo.items[$(fields[i]).attr('data-l10n')]);
                }
            }
        }
    },

    thankyouForReporting: {
        getLocale: {
            problem: function(id) {
                return ReportAProblem.PROBLEM[id].key;
            },
            product: function(id) {
                return ReportAProblem.PRODUCT[id].key;
            }
        },
        show: function () {
            tellUs.currentPage = 'thankyouForReporting';
            $.mobile.changePage('#reportaproblem_thankyou');
            var self = tellUs.thankyouForReporting;
            var rap = tellUs.reportAProblem;
            var problemKey = self.getLocale.problem(rap.submittedValues['problem']);
            var productKey = (typeof rap.submittedValues['product'] == 'object') ? rap.submittedValues['product'].map(self.getLocale.product).join(', ') : self.getLocale.product(rap.submittedValues['product']);
            var suggessionForUser = wemoUtil.templator.fitIn(wemo.items['ReportaProblem_Thankyou_Suggession'], [wemo.items[problemKey], wemo.items[productKey]]);
            $("div#reportaproblem_thankyou div#rapty_forminfo").html(suggessionForUser);
            window.sessionStorage.removeItem(sessionStore.PERSIST_REPORT_A_PROBLEM_FORM);
        },
        backToPreviousPage: function() {
            window.history.go(-3);
        },
        onClick_WeMoSupportCenter: function() {
            wemoUtil.infoLog(tellUs.TAG, "onClick_WeMoSupportCenter");
            var link = wemo.items['Help_Url'];
            wemoUtil.loadExternalUrl(link);
        },
        onClick_DoneButton: function(e) {
            tellUs.thankyouForReporting.backToPreviousPage();
        }
    },

    onDeviceReady: function() {
        wemoUtil.infoLog(tellUs.TAG, "onDeviceReady");
        tellUs.bindEvents();

        //All initialization script goes here
        $('#more_tell_us_what_you_think').addClass('none');
        //get localization content
        //rate wemo app link

        //To return back to home page: device list tab
        $(".backbutton").on("tap", tellUs.onBackPress);

        if (SALESFORCE_BASED_REPORT_PROBLEM) {
            if (!tellUs.reportAProblem.isFormSubmitted) {
                tellUs.reportAProblem.show();
                tellUs.reportAProblem.defaultRequiredFields();
                tellUs.reportAProblem.disableSubmitButton();
                tellUs.reportAProblem.form.container = $('form#reportaproblem_form');
                tellUs.reportAProblem.form.localize();
                tellUs.reportAProblem.form.setKeys();
                tellUs.reportAProblem.form.retrieve();
                $("#reportaproblem_form_submit").on("tap", tellUs.reportAProblem.onClick_SubmitForm);
                tellUs.reportAProblem.form.container.find('div > input[required]').on('keyup', tellUs.reportAProblem.onKeyPress_RequiredInputFields);
                $("#error_popup_ok").on("tap", tellUs.reportAProblem.onSubmitFailure);
            } else {
                $('#rapty_wemosupportcenter').on('pointerdown', tellUs.thankyouForReporting.onClick_WeMoSupportCenter);
                $('#rapty_done').on('pointerdown', tellUs.thankyouForReporting.onClick_DoneButton);
            }
        } else {
            tellUs.tellUsWhatYouThink.show();
            $("#tellus_rate_wemo_app").on("tap", tellUs.tellUsWhatYouThink.onClick_RateWeMoApp);
            $("#tellus_report_problem").on("tap", tellUs.tellUsWhatYouThink.onClick_ReportAProblem);
            $("#tellus_not_now").on("tap", tellUs.tellUsWhatYouThink.onClick_NotNow);
        }
    },

    bindEvents: function() {
        wemoUtil.infoLog(tellUs.TAG, "bindEvents");
        document.addEventListener('online', tellUs.onOnline, false);
        document.addEventListener('offline', tellUs.onOffline, false);
        document.addEventListener("backbutton", tellUs.onBackPress, false);
        document.addEventListener("pause", tellUs.onPause, false);
        document.addEventListener("resume", tellUs.onResume, false);
    },

    onOffline: function() {
        wemoUtil.infoLog(tellUs.TAG, "offLine");
    },

    onOnline: function() {
        wemoUtil.infoLog(tellUs.TAG, "onLine");
    },

    onBackPress: function() {
        wemoUtil.infoLog(tellUs.TAG, "onBackPress");
        if (tellUs.currentPage === 'reportAProblem' || tellUs.currentPage == 'thankyouForReporting') {
            wemoUtil.loadUrl(filePath.MORE_MENU);
        } else {
            wemoUtil.loadPreviousUrl();
        }
        tellUs.reportAProblem.form.retain();
    },

    onPause: function() {
        wemoUtil.infoLog(tellUs.TAG, "onPause");
        tellUs.reportAProblem.form.retain();
    },

    onResume: function() {
        wemoUtil.infoLog(tellUs.TAG, "onResume");
        tellUs.reportAProblem.form.retrieve();
    },

    reportError: function(e) {
        wemoUtil.infoLog(tellUs.TAG, "Plugin Error!!!!   " + e);
    },

    rateWeMOapplication: function() {
        wemoUtil.infoLog(tellUs.TAG, "rateWeMOapplication");
        nativeUtilPlugin.execute(
            function(url) {
                wemoUtil.infoLog(tellUs.TAG, "Open Play store: " + url);
                wemoUtil.loadExternalUrl(url);
            },
            tellUs.reportError,
            actions.GET_PLAY_STORE_URL, []
        );
    },

    isHomeNetwork: function() {
        wemoUtil.infoLog(tellUs.TAG, "isHomeNetwork");
        nativeUtilPlugin.execute(
            function(status) {
                wemoUtil.infoLog(tellUs.TAG, "isHomeNetwork: " + status);
                return status;
            },
            tellUs.reportError,
            actions.IS_HOME_NETWORK, []
        );
    },

    sendLocalEmail: function() {
        wemoUtil.infoLog(tellUs.TAG, "sendLocalEmail");
			appSettingsPlugin.execute(
            function(wemo_info) {
                wemoUtil.infoLog(tellUs.TAG, "wemo_info " + wemo_info);

                wemo_info = tellUs.reportAProblem.submittedSummary + "\n\n=====" + wemo.items['tellus_email_heading'] + "=====\n\n" + wemo_info;

                var ledDeviceInfo = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_DEVICE_INFO);
                var groupDeviceInfo = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_GROUP_INFO);

                wemoUtil.infoLog(tellUs.TAG, "ledDeviceInfo" + JSON.stringify(groupDeviceInfo) + "---" + JSON.stringify(ledDeviceInfo));

                if (ledDeviceInfo != undefined && ledDeviceInfo != "") {
                    for (var i = 0; i < ledDeviceInfo.length; i++) {
                        wemo_info += "DEVICE ID: " + ledDeviceInfo[i].deviceid + ",";
                        wemo_info += "DEVICE TYPE: " + ledDeviceInfo[i].devicetype + ",";
                        wemo_info += "Friendly Name: " + ledDeviceInfo[i].friendlyname + ",";
                        wemo_info += "UnReachable: " + ledDeviceInfo[i].unreachable;
                        wemo_info += "\n\n";
                    }

                }
                if (groupDeviceInfo != undefined && groupDeviceInfo != "") {
                    for (var i = 0; i < groupDeviceInfo.length; i++) {
                        wemo_info += "GROUP ID: " + groupDeviceInfo[i].groupid + ",";
                        wemo_info += "DEVICE ID: " + groupDeviceInfo[i].deviceid + ",";
                        wemo_info += "DEVICE TYPE: " + groupDeviceInfo[i].devicetype + ",";
                        wemo_info += "Friendly Name: " + groupDeviceInfo[i].friendlyname + ",";
                        wemo_info += "UnReachable: " + groupDeviceInfo[i].unreachable;
                        wemo_info += "\n\n";
                    }

                }

                tellUs.getMobileInfo(wemo_info);
            },
            tellUs.reportError,
            actions.GET_LOCAL_EMAIL_BODY, ['android version', 'model number', 'wemo version']
        );
        return true;
    },

    sendRemoteEmail: function() {
        wemoUtil.infoLog(tellUs.TAG, "sendRemoteEmail");
        cordova.exec(
            function(params) {
                wemoUtil.infoLog(tellUs.TAG, "success call back" + params[1] + " : " + params[0]);
                var homeId = params[1];
                var authCode = params[0];

                wemoUtil.infoLog(tellUs.TAG, "success call back home id: " + homeId);
                wemoUtil.infoLog(tellUs.TAG, "success call back authCode: " + authCode);

                $.ajax({
                    //url: cloudAPI.DEVICE_LIST + homeId,
                    url: cloudAPI.LED_DEVICE_LIST + homeId,

                    type: "GET",
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function(data) {
                        wemoUtil.infoLog(tellUs.TAG, "success callback from cloud: " + data);
                        var responseXML = (new XMLSerializer()).serializeToString(data);
                        var splitLength = 4000;
                        var length = responseXML.length;
                        var ittr = Math.floor(length / splitLength) + 1;
                        for (var i = 0; i < ittr; i++) {
                            var end = ((i + 1) * splitLength);
                            if (end > length) {
                                end = length;
                            }
                            wemoUtil.infoLog(tellUs.TAG, responseXML.substring(splitLength * i, end));
                        }


                        $('#device_list_container').empty();
                        var wemo_info = tellUs.reportAProblem.submittedSummary;
                        //$(data).find('plugin').each(function (i) {
                        $(data).find('device').each(function(i) {

                            wemoUtil.infoLog(tellUs.TAG, "Plugin: " + i);
                            var device_type = $(this).find("modelCode").text();

                            wemoUtil.infoLog(tellUs.TAG, "before if " + device_type);

                            wemoUtil.infoLog(tellUs.TAG, "entering in If");

                            if (device_type != "") {
                                if (device_type == "LED" || wemoUtil.isSupportedLedModelCode(device_type)) {

                                    var device_status = $(this).find("status").text();
                                    var deviceid = "DEVICE ID: " + $(this).find("macAddress").text();
                                    var devicetype = "DEVICE TYPE: " + wemo.items['Led_Device_Type'];
                                    var friendlyname = "Friendly Name: " + $(this).find("friendlyName").text();
                                    var unreachable = "";
                                    var groupid = "";

                                    if (device_status == 3)
                                        unreachable = "UnReachable: Yes";
                                    else
                                        unreachable = "UnReachable: No";

                                    $(this).find('groupProfile').each(function(i) {
                                        groupid = "GROUP ID: " + $(this).find("referenceId").text();
                                    });

                                    if (groupid != undefined && groupid != "")
                                        wemo_info += groupid + ", " + deviceid + ", " + devicetype + ", " + friendlyname + ", " + unreachable + "\n\n";
                                    else
                                        wemo_info += deviceid + ", " + devicetype + ", " + friendlyname + ", " + unreachable + "\n\n";

                                    wemoUtil.infoLog(tellUs.TAG, "wemo_info " + wemo_info + "--" + device_type);
                                } else {

                                    var device_mac_address = $(this).find("macAddress").text();
                                    //var device_firmware_version = window.sessionStorage.getItem($(this).find("pluginId").text());
                                    var device_firmware_version = $(this).find("firmwareVersion").text();
                                    var signal_strength = $(this).find("signalStrength").text();
                                    var device_meta_info = "Device Extended Meta Info : NA";
                                    var unavailable = "";

                                    if (device_type == "Bridge" || device_type.search("Bridge") == true) {
                                        var device_friendly_name = "WeMo Link";
                                        var device_type = "WeMo Link";
                                    } else {
                                        var device_friendly_name_1 = $(this).find("friendlyName").text();
                                        var device_friendly_name = device_friendly_name_1.replace("\xC2", "");

                                    }

                                    if (wemoUtil.isCamDevice(device_type)) {
                                        device_friendly_name = wemoUtil.extractNetCamName(device_friendly_name);
                                    }

                                    if (device_status == 3)
                                        unavailable = "Unavailable : Yes";
                                    else
                                        unavailable = "Unavailable : No";

                                    if (device_type == "Socket") {
                                        device_type = "Switch";
                                    }
                                    if (device_type.indexOf('NetCam') != -1) {
                                        device_type = "NetCam";
                                    }

                                    wemo_info += device_type + ", " + device_mac_address + ", " + device_firmware_version + ", " + signal_strength + ", " + device_friendly_name + ", " + unavailable + ", " + device_meta_info + "\n\n";
                                    wemoUtil.infoLog(tellUs.TAG, "wemo_info " + wemo_info + "--" + device_type);
                                }
                            }

                        });
                        tellUs.getMobileInfo("\n\n=====" + wemo.items['tellus_email_heading'] + "=====\n\n" + wemo_info);
                    },
                    error: function(xhr, textstatus) {

                        for (var p in xhr) {
                            wemoUtil.infoLog(tellUs.TAG, "Error call back string : " + p + ': ' + xhr[p]);
                        }

                    },
                    statusCode: {
                        500: function() {
                            wemoUtil.infoLog(tellUs.TAG, "page not found");
                        },
                        503: function() {
                            wemoUtil.infoLog(tellUs.TAG, "Cloud is down.");
                        }
                    }

                });

            },
            function(err) {
                wemoUtil.infoLog(tellUs.TAG, "failure call back");
            },
            "WebServicePlugin",
            "getAuthCode", []
        );
    },

    getMobileInfo: function(wemo_info) {
        nativeUtilPlugin.execute(
            function(mobile_info) {
                var email_body = wemo_info + "\n\n" + mobile_info;
                tellUs.sendEmail(email.help, wemo.items['tellus_email_subject'], email_body);
                nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
            },
            tellUs.reportError,
            actions.GET_TELL_US_MOBILE_INFO, [wemo.items['tellus_email_android_version'], wemo.items['tellus_email_model_number'], wemo.items['tellus_email_wemo_version']]
        );
    },

    sendEmail: function(to_email_id, subject, body) {
        wemoUtil.infoLog(tellUs.TAG, "sendEmail");
        nativeUtilPlugin.execute(
            function() {
                wemoUtil.infoLog(tellUs.TAG, "SEND_EMAIL success callback");
                $.mobile.loading("hide");
            },
            tellUs.reportError,
            actions.SEND_EMAIL, [to_email_id, subject, body]
        );
    }


};
