$(document).bind('pageinit', function () {
    var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));
    dataExport.initialize();
});

var dataExport = {
    TAG: 'data_export.js: ',
    udn: '',
    emailAddress: '',
    exportMode: "4",
    exportModeScheduled: "3",

    initialize: function () {
        wemoUtil.infoLog(dataExport.TAG, "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    onDeviceReady: function () {
        wemoUtil.infoLog(dataExport.TAG, "onDeviceReady");
        dataExport.bindEvents();
        //All initialization script goes here

        dataExport.udn = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN);
        wemoUtil.infoLog(dataExport.TAG, dataExport.udn);

        //To return back to home page: device list tab
        $(".wemo_logo").on("tap", function (e) {
            if (e.target.nodeName != "IMG") {
                window.sessionStorage.removeItem(sessionStore.DEVICE_EDIT_WEMO_POWER_THRESHOLD);
                window.sessionStorage.removeItem(sessionStore.THRESHOLD_IS_AUTO_SET);
                window.sessionStorage.removeItem(sessionStore.THRESHOLD_RESET);

                window.sessionStorage.removeItem(sessionStore.DEVICE_EDIT_WEMO_COST_PER_KWH);
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }
        });

        //Email click
        $("#email_container").on("click", function () {
            wemoUtil.loadUrl(filePath.DATA_EXPORT_EMAIL);
        });

        //Interval click
        $("#export_interval").on("click", function () {
            //wemoUtil.loadUrl(filePath.DATA_EXPORT_INTERVAL);
            $('.overlay_container').attr('style', 'display: table;');
            $('.picker_container2').attr('style', 'display: table-cell;');
        });

        $("#cnl_schedule_btn").on("click", function () {
            $('.overlay_container').attr('style', 'display: none;');
            $('.picker_container2').attr('style', 'display: none;');
        });

        $("#set_schedule_btn").on("click", function () {

            dataExport.exportMode = $('input[name=schedule_export]:checked').val();
            dataExport.sendExportType(dataExport.emailAddress, dataExport.exportMode);
            dataExport.applyAddressAndExportMode();
            $('.overlay_container').attr('style', 'display: none;');
            $('.picker_container2').attr('style', 'display: none;');
        });
        
        var emailId = "";
        if(window.sessionStorage.getItem(sessionStore.DATA_EXPORT_EMAIL_ADDRESS) == null || window.sessionStorage.getItem(sessionStore.DATA_EXPORT_EMAIL_ADDRESS) == undefined){
        	if(window.sessionStorage.getItem("stored_email_address") != null && window.sessionStorage.getItem("stored_email_address") != undefined)
        		emailId = window.sessionStorage.getItem("stored_email_address");
        }
        else{
        	emailId = window.sessionStorage.getItem(sessionStore.DATA_EXPORT_EMAIL_ADDRESS);
        }
        
        
        dataExport.emailAddress = emailId;
        dataExport.exportMode = window.sessionStorage.getItem(sessionStore.DATA_EXPORT_SCHEDULE_MODE);

        if (dataExport.exportMode == null) {
            dataExport.exportMode = "4";
        }
        if (dataExport.exportMode != "4") {
            dataExport.exportModeScheduled = dataExport.exportMode;
        }
        if (dataExport.emailAddress == null) {
            dataExport.getInfo();
        } else {
            dataExport.applyAddressAndExportMode();
            dataExport.initToggle();
        }

        //Save Button on Click Clear Usage Save - Gray Button
        $("#export_confirmation_ok_btn").on("click", function () {
            $("#export_confirmation_popup").popup("close");
            dataExport.sendExportType(dataExport.emailAddress, '0');
        });

        //Cancel Button on click Clear Name Icon Rules Popup Close
        $("#export_confirmation_cancel_btn").on("click", function () {
            $("#export_confirmation_popup").popup('close');
        });
    },

    sendExportType: function (email, mode) {
        if (email == undefined) {
            return;
        }

        if (isRemoteEnabled) {
            var mac = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_MAC);
            var pluginid = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_PLUGIN_ID);

            var xmlRequestString = dataExport.buildXMLRequest(buildXML.SAVE_EXPORT_SCHEDULE, pluginid, mac, email, mode);
            console.log(xmlRequestString);

            nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);

            cordova.exec(
                function (params) {
                    console.log("success call back");
                    var authCode = params[0];
                    console.log("authCode" + authCode);
                    $.ajax({
                        url: cloudAPI.INSIGHT_PARAMS,
                        type: "POST",
                        data: xmlRequestString,
                        beforeSend: function (xhr) {
                            xhr.setRequestHeader('Content-Type', 'application/xml');
                            xhr.setRequestHeader('Authorization', authCode);
                        },
                        error: function () {
                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                            if (mode == '0') {
                                dataExport.showExportStatusNotification(false);
                            }
                        },
                        success: function (data) {
                            console.log("Save data export schedule response cloud...");
                            var responseXML = (new XMLSerializer()).serializeToString(data);
                            wemoUtil.log(dataExport.TAG, 'Save data export schedule status: ' + responseXML);
                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                            if (mode == '0') {
                                dataExport.showExportStatusNotification(true);
                            }
                        }
                    });
                },
                function (err) {
                    console.log("failure call back");
                    nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                    if (mode == '0') {
                        dataExport.showExportStatusNotification(false);
                    }
                }, "WebServicePlugin", "getAuthCode", []
            );

        }
        else {
            nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
            setTimeout(function () {
                devicePlugin.execute(
                    function (status) {
                        wemoUtil.infoLog(dataExport.TAG, "Export Now success callback: " + status);
                        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                        if (mode == '0') {
                            dataExport.showExportStatusNotification(status);
                        }
                    },
                    dataExport.reportError,
                    actions.SCHEDULE_DATA_EXPORT,
                    [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN), email, mode]
                );
            }, timeout.LONG);
        }
    },

    bindEvents: function () {
        wemoUtil.infoLog(dataExport.TAG, "bindEvents");
        document.addEventListener('online', dataExport.onOnline, false);
        document.addEventListener('offline', dataExport.onOffline, false);
        document.addEventListener("backbutton", dataExport.onBackPress, false);
        document.addEventListener("pause", dataExport.onPause, false);
        document.addEventListener("resume", dataExport.onResume, false);
    },

    onOffline: function () {
        wemoUtil.infoLog(dataExport.TAG, "offLine");
    },

    onOnline: function () {
        wemoUtil.infoLog(dataExport.TAG, "onLine");
    },

    onBackPress: function () {
        window.sessionStorage.removeItem("flipVal");
        if ($(".more_tab").is(":visible")) {
            $(".more_tab").hide();
            $('body').find('.modalWindow').transition({opacity: 0}, 400, function () {
                $(this).removeClass('isOpen');
            });
        }
        else {
            wemoUtil.infoLog(dataExport.TAG, "onBackPress");
            dataExport.cleanSessionData();
            wemoUtil.loadUrl(filePath.DEVICE_LIST_EDIT);
        }
    },

    onPause: function () {
        wemoUtil.infoLog(dataExport.TAG, "onPause");
    },

    onResume: function () {
        wemoUtil.infoLog(dataExport.TAG, "onResume");
    },

    reportError: function (e) {
        wemoUtil.infoLog(dataExport.TAG, "Plugin Error!!!!   " + e);
    },

    cleanSessionData: function () {
        window.sessionStorage.removeItem(sessionStore.DATA_EXPORT_EMAIL_ADDRESS);
        window.sessionStorage.removeItem(sessionStore.DATA_EXPORT_SCHEDULE_MODE);
        window.sessionStorage.removeItem(sessionStore.DATA_EXPORT_LAST_EMAIL);
    },

    /*scheduleModeSliderChange: function () {
        wemoUtil.infoLog(dataExport.TAG, "scheduleModeSliderChange " + $("#scheduled_export_toggle").val());
        if ($("#scheduled_export_toggle").val() == "off") {
            dataExport.exportMode = "0";
        } else {
            wemoUtil.infoLog(dataExport.TAG, "exportModeScheduled: " + dataExport.exportModeScheduled);
            dataExport.exportMode = dataExport.exportModeScheduled;
        }
        dataExport.applyAddressAndExportMode();
    },*/

/*    getSettingsEmailStatus: function () {
        wemoUtil.infoLog(dataExport.TAG, "getSettingsEmailStatus");
        nativeUtilPlugin.execute(
            function (status) {
                wemoUtil.infoLog(dataExport.TAG, "PREF_GET_EMAIL_STATUS");
                wemoUtil.infoLog(dataExport.TAG, "email status: " + status);
                if (status) {
                    dataExport.getSettingsEmail();
                }
            },
            dataExport.reportError,
            actions.PREF_GET_EMAIL_STATUS,
            []
        );
    },

    getSettingsEmail: function () {
        wemoUtil.infoLog(dataExport.TAG, "getSettingsEmail");
        nativeUtilPlugin.execute(
            function (email) {
                wemoUtil.infoLog(dataExport.TAG, "PREF_GET_EMAIL");
                wemoUtil.infoLog(dataExport.TAG, "stored email: " + email);
                dataExport.emailAddress = email;
                dataExport.applyAddressAndExportMode();
            },
            dataExport.reportError,
            actions.PREF_GET_EMAIL,
            []
        );
    },*/

    buildXMLRequest: function (type, pluginId, macAddress, data1, data2) {
        xmlString = "<plugins><plugin>" +
            "  <recipientId>" + pluginId + "</recipientId>" +
            "  <macAddress>" + macAddress + "</macAddress>";


        switch (type) {
            case(buildXML.GET_EXPORT_SCHEDULE):
                xmlString += "<content>" +
                    "<![CDATA[<getDataExportInfo><plugin><macAddress>" + macAddress + "</macAddress></plugin></getDataExportInfo>]]>" +
                    "</content>";
                break;

            case(buildXML.SAVE_EXPORT_SCHEDULE):
                xmlString += "<content>" +
                    "<![CDATA[<scheduleDataExport><plugin>" +
                    "<macAddress>" + macAddress + "</macAddress>" +
                    "<emailAddress>" + data1 + "</emailAddress>" +
                    "<dataExportType>" + data2 + "</dataExportType>" +
                    " </plugin></scheduleDataExport>]]>" +
                    "</content>";
                break;
        }

        xmlString += "</plugin></plugins>";

        return xmlString;
    },


    getInfo: function () {
        wemoUtil.infoLog(dataExport.TAG, "getInfo");
        var mac = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_MAC);
        var pluginid = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_PLUGIN_ID);

        if (isRemoteEnabled) {
            var xmlRequestString = dataExport.buildXMLRequest(buildXML.GET_EXPORT_SCHEDULE, pluginid, mac, null);
            nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
            cordova.exec(
                function (params) {
                    console.log("success call back");
                    var authCode = params[0];
                    console.log("authCode" + authCode);
                    $.ajax({
                        url: cloudAPI.INSIGHT_PARAMS,
                        type: "POST",
                        data: xmlRequestString,
                        beforeSend: function (xhr) {
                            xhr.setRequestHeader('Content-Type', 'application/xml');
                            xhr.setRequestHeader('Authorization', authCode);
                        },
                        error: function () {
                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                        },
                        success: function (data) {
                            console.log("Get data export response cloud...");
                            var responseXML = (new XMLSerializer()).serializeToString(data);
                            wemoUtil.log(dataExport.TAG, 'Get data export status: ' + responseXML);

                            var tmp = "";
                            $(data).find('applianceConsumption').each(function (i) {
                                dataExport.emailAddress = $(this).find("emailAddress").text();
                                dataExport.exportMode = $(this).find("dataExportType").text();
                                tmp = $(this).find("lastDataExportTs").text();
                            });

                            window.sessionStorage.setItem(sessionStore.DATA_EXPORT_LAST_EMAIL, tmp);
                            if (dataExport.exportMode != "4") {
                                dataExport.exportModeScheduled = dataExport.exportMode;
                            }
                            wemoUtil.infoLog(dataExport.TAG, "emailAddress: " + dataExport.emailAddress + ", exportMode: " + dataExport.exportMode);
                            dataExport.initToggle();
                            dataExport.applyAddressAndExportMode();
                            if (!dataExport.emailAddress) {
                                wemoUtil.infoLog(dataExport.TAG, "No email adderss in export config.");
                                dataExport.getSettingsEmailStatus();
                            }
                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                        }
                    });
                },
                function (err) {
                    console.log("failure call back");
                    nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                }, "WebServicePlugin", "getAuthCode", []
            );
        }
        else {
            devicePlugin.execute(
                function (exportInfo) {
                    wemoUtil.infoLog(dataExport.TAG, "current export settings: " + exportInfo.EmailAddress + ", " + exportInfo.DataExportType + ", " + exportInfo.LastDataExportTS);
                    wemoUtil.infoLog(dataExport.TAG, "GET_DATA_EXPORT_INFO");
                    dataExport.emailAddress = exportInfo.EmailAddress;
                    dataExport.exportMode = exportInfo.DataExportType;
                    window.sessionStorage.setItem(sessionStore.DATA_EXPORT_LAST_EMAIL, exportInfo.LastDataExportTS);
                    if (dataExport.exportMode != "4") {
                        dataExport.exportModeScheduled = dataExport.exportMode;
                    }
                    wemoUtil.infoLog(dataExport.TAG, "emailAddress: " + dataExport.emailAddress + ", exportMode: " + dataExport.exportMode);
                    dataExport.initToggle();
                    dataExport.applyAddressAndExportMode();
                    if (!dataExport.emailAddress) {
                        wemoUtil.infoLog(dataExport.TAG, "No email adderss in export config.");
                        dataExport.getSettingsEmailStatus();
                    }
                },
                dataExport.reportError,
                actions.GET_DATA_EXPORT_INFO,
                [dataExport.udn]
            );
        }
    },

    initToggle: function()
    {
        var flipVal = 'off';
        if (dataExport.exportMode != "4") {
            flipVal = 'on';
            console.log('Data export mode: ' + dataExport.exportModeScheduled);
            $('input[name="schedule_export"]').filter('[value="' + dataExport.exportModeScheduled + '"]').attr('checked', true);
        }

        $("#flip_on_off").BelkinOnOff({height: 30, curval: flipVal, onval: wemo.items['SwitchOnAccessibilityLabel'], offval: wemo.items['SwitchOffAccessibilityLabel']}, "show", function (val) {
                if (val == "on") {
                    wemoUtil.infoLog(dataExport.TAG, "exportModeScheduled: " + dataExport.exportModeScheduled);
                    dataExport.exportMode = '1';
                    $('input[name="schedule_export"]').filter('[value="' + dataExport.exportMode + '"]').attr('checked', true);
                    if (val != flipVal) {
                        dataExport.sendExportType(dataExport.emailAddress, dataExport.exportMode);
                        flipVal = val;
                    }
                    dataExport.applyAddressAndExportMode();
                }
                else if (val == "off") {
                    dataExport.exportMode = "4";
                    if (val != flipVal) {
                        dataExport.sendExportType(dataExport.emailAddress, dataExport.exportMode);
                        flipVal = val;
                    }
                    dataExport.applyAddressAndExportMode();
                }
            }
        );
    },

    applyAddressAndExportMode: function () {
        wemoUtil.infoLog(dataExport.TAG, "applyAddressAndExportMode: " + dataExport.emailAddress + ", " + dataExport.exportMode);
        window.sessionStorage.setItem(sessionStore.DATA_EXPORT_EMAIL_ADDRESS, dataExport.emailAddress);
        window.sessionStorage.setItem(sessionStore.DATA_EXPORT_SCHEDULE_MODE, dataExport.exportMode);
        
        
        
        
        $("#export_email").text(dataExport.emailAddress);
        if (dataExport.emailAddress) {
            // $("#export_now_btn").button("enable");

            $("#export_now_btn span").removeClass('div_disabled');
            $("#export_now_btn span").addClass('div_enabled');
            $("#export_now_btn").bind("tap", function (e) {
                wemoUtil.infoLog(dataExport.TAG, "export now clicked");
                wemoUtil.replaceParameters($("[_key='ExportConfirmation']"), [dataExport.emailAddress]);
                $("#export_confirmation_popup").popup("open");
                e.preventDefault();
            });
        } else {
            // $("#export_now_btn").button("disable");

            $("#export_now_btn span").removeClass('div_enabled');
            $("#export_now_btn span").addClass('div_disabled');
            $("#export_now_btn").unbind("click");
        }
        //$("#export_now_btn").button("refresh");
        switch (dataExport.exportMode) {
            case "1":
                $("#export_interval").removeClass("none");
                $("#export_interval_value").text(wemo.items["ExportIntervalDaily"]);
                //$("#scheduled_export_toggle").val("on").slider("refresh");
                break;
            case "2":
                $("#export_interval").removeClass("none");
                $("#export_interval_value").text(wemo.items["ExportIntervalWeekly"]);
                //$("#scheduled_export_toggle").val("on").slider("refresh");
                break;
            case "3":
                $("#export_interval").removeClass("none");
                $("#export_interval_value").text(wemo.items["ExportIntervalMonthly"]);
                //$("#scheduled_export_toggle").val("on").slider("refresh");
                break;
            case "4":
            default:
                $("#export_interval").addClass("none");
                $("#next_email_will_arrive").addClass("none");
                //$("#scheduled_export_toggle").val("off").slider("refresh");
                break;
        }
         switch (dataExport.exportMode) {
            case "1":
            case "2":
            case "3":
                $("#export_sent_label").addClass("none");
                $("#export_failed_label").addClass("none");
                var message = wemo.items['ExportNextEmailWillArrive'] + dataExport.getRestOfDaysBeforeDelivery(dataExport.exportMode);
                console.log("message "+message);
                $("#next_email_will_arrive").removeClass("none").find("span").empty().html(message);
                break;
         }
    },

    showExportStatusNotification: function (status) {
        $("#export_sent_label").removeClass("hidden");
        $("#next_email_will_arrive").addClass("none");
        if (status) {
            $("#export_sent_label").removeClass("none");
            $("#export_failed_label").addClass("none");
        } else {
            $("#export_failed_label").removeClass("none");
            $("#export_sent_label").addClass("none");
        }

    },

    getRestOfDaysBeforeDelivery: function (exportMode) {
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth();
        var day = date.getDate();
        var dfw = date.getDay();//day of week
        var rest = 1;
        var firstSunday;
        var firstSundayDay;
        var firstSundayMillisec;
        var dateMillisec;

        console.log("date "+date);
        console.log("year "+year);
        console.log("month "+month);
        console.log("day "+day);
        console.log("dfw "+dfw);
        console.log("dataExport.exportMode "+dataExport.exportMode);

        switch (dataExport.exportMode) {
            case "1":
                return rest+wemo.items['spaceDayDot'];
                break;
            case "2":
                rest = 7 - dfw;
                rest = rest == 0 ? 1 : rest;
                console.log("rest "+rest);
                return rest > 1 ? rest+wemo.items['spaceDaysDot'] : rest+wemo.items['spaceDayDot'];
                break;
            case "3":
                firstSunday = month == 11 ? getFirstSunday( year+1, 0 ) :getFirstSunday( year, month+1 );
                firstSundayMillisec = firstSunday.getTime();
                dateMillisec = date.getTime();
                rest = parseInt((firstSundayMillisec - dateMillisec) / 1000 / 3600 / 24 );

                console.log("firstSunday "+firstSunday);
                console.log("firstSundayMillisec "+firstSundayMillisec);
                console.log("dateMillisec "+dateMillisec);
                console.log("rest "+rest);

                return rest > 1 ? rest+wemo.items['spaceDaysDot'] : rest+wemo.items['spaceDayDot'];
                break;
        }

        function getFirstSunday( year, month ) {
            var firstDay = new Date(year, month, 1);
            var firstDayWeek = firstDay.getDay();
            var firstSunday = new Date(year, month, (7 - firstDayWeek)%7 +1);
            return firstSunday;
        }
    }

}
