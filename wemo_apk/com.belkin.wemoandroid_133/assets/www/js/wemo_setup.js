/*
 wemo_setup.js

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

var TAG = "wemo_setup.js ";

$(document).bind('pageinit', function() {
    wemoSetup.initialize();
});

var wemoSetup = {

    initialize: function() {
        this.bindEvents();
    },

    bindEvents: function() {
        console.log(TAG	+ "bindEvents");
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    onDeviceReady: function() {
        console.log(TAG	+ "device ready");

        if(!window.sessionStorage.getItem("device_type")){
            navigator.app.loadUrl("file:///android_asset/www/get_started.html", {loadUrlTimeoutValue : 60000});
        }else{

            document.addEventListener('offline', wemoSetup.onOffline, false);
            document.addEventListener('online', wemoSetup.onOnline, false);
            document.addEventListener("backbutton", wemoSetup.onBackPress, false);

            $('#device_type').text(window.sessionStorage.getItem("device_type"));
            $('#device_ssid').text(window.sessionStorage.getItem("device_SSID"));
            $('#device_image').attr("src",sessionStorage.getItem("device_img_url"));


            $('#wifi_ap_list_btn, #refresh_ap_list_btn, #hidden_btn, #ap_password_connect_btn').on('click',function(){

                var $this = $( this ),
                    theme = $this.jqmData( "theme" ) || $.mobile.loader.prototype.options.theme,
                    msgText = $this.jqmData( "msgtext" ) || $.mobile.loader.prototype.options.text,
                    textVisible = $this.jqmData( "textvisible" ) || $.mobile.loader.prototype.options.textVisible,
                    textonly = !!$this.jqmData( "textonly" );
                html = $this.jqmData( "html" ) || "";

                if($(this).attr('id') === "ap_password_connect_btn" || $(this).attr('id') === "hidden_btn"){
                    var ssidconnect = $('#ap_password_ssid').text();
                    html = "<span class='ui-bar ui-overlay-c ui-corner-all' ><img src='css/images/ajax-loader.gif' /><h4>The WeMo App is trying to Connect '" + ssidconnect + "'. This may take upto 60 seconds</h4></span>";
                }

                $.mobile.loading( 'show', {
                    text: msgText,
                    textVisible: textVisible,
                    theme: 'a',
                    textonly: textonly,
                    html: html
                });

                console.log("clicked item: " + $(this).attr('id'));

                if($(this).attr('id') === "hidden_btn"){
                    setTimeout(function(){
                        console.log("Hidden button connecting");
                        setupPlugin.execute(wemoSetup.processConnectionStatus,wemoSetup.reportError,ACTION_CONNECT_TO_DEFAULT_ROUTER,[]);
                        $.mobile.loading( 'hide');
                    }, 10);
                } else if($(this).attr('id') === "ap_password_connect_btn"){
                    setTimeout(function(){
                        $('#ap_password_popup').attr('data-go-forward','true');
                        $('#ap_password_popup').popup('close');
                    }, 10);
                }else {
                    setTimeout(function(){
                        setupPlugin.execute(wemoSetup.getWiFiAPList,wemoSetup.reportError,ACTION_GET_WIFI_AP_LIST,[]);
                        $.mobile.loading( 'hide');
                        $( "#wifi_list_popup" ).show();
                        $( "#wifi_list_popup" ).popup( "open" );
                    }, 10);
                }
            });

            $('#wifi_ap_list').on('click', '> li', function(){

                $('#wifi_list_popup').attr('data-go-forward','true');
                if($(this).attr('id') == 'add_wifi_btn'){
                    console.log(TAG + "Add wifi popup");
                    window.sessionStorage.setItem('add_wifi_flag', 'true');
                }else{
                    window.sessionStorage.setItem('add_wifi_flag', 'false');
                    var SSID = $(this).attr('SSID');
                    var SignalStrength = $(this).attr('SignalStrength');
                    var SecurityStrength = $(this).attr('SecurityStrength');
                    var Channel = $(this).attr('Channel');
                    console.log("AP details: " + $(this).attr('SSID'));
                    console.log("AP details: " + $(this).attr('SignalStrength'));
                    console.log("AP details: " + $(this).attr('SecurityStrength'));
                    console.log("AP details: " + $(this).attr('Channel'));
                    $('#ap_password_ssid').text(SSID);
                    $('#ap_password_security').text(SecurityStrength);
                    $('#ap_password_signal_strength').text(SignalStrength);
                    $("#ap_password_channel").val(Channel);
                }
                $( "#wifi_list_popup" ).popup( "close" );
            });

            $( '#wifi_list_popup' ).on( 'popupafterclose', function() {

                console.log("wifi_list_popup afer close: " + $('#wifi_list_popup').attr('data-go-forward'));
                if($('#wifi_list_popup').attr('data-go-forward') === "true"){
                    $.ajax({
                        url:'',
                        success: function(result) {
                            $('[name="show_password"]').attr('checked',false).checkboxradio("refresh").trigger('change');
                            $('[name="wireless_password"]').val('');

                            if(window.sessionStorage.getItem("add_wifi_flag") == 'true'){
                                setTimeout( function(){
                                    $("#security_option").val("Open").selectmenu('refresh').trigger('change');
                                    $( '#add_wifi_network_popup' ).popup( 'open',{
                                        theme: "a",
                                        positionTo: "#title",
                                        transition: "slidedown" } );

                                }, 20);

                            }else{
                                setTimeout( function(){
                                    $( '#ap_password_popup' ).popup( 'open' ) }, 20);
                            }
                        }
                    });
                }
            });


            $('#ap_password_popup').on('popupafterclose', function() {

                if($('#ap_password_popup').attr('data-go-forward') === 'true'){
                    $.ajax({
                        url:'',
                        success: function(result) {
                            setTimeout( function(){

                                var security = $('#ap_password_security').text();
                                var values = security.split('/');
                                passwordArray = [];//Password Array order should not be changed
                                passwordArray.push($('#ap_password_ssid').text());//ssid
                                passwordArray.push(values[0]);//auth
                                passwordArray.push($("#ap_password_input").val());//password
                                passwordArray.push(values[1]);//encrypt
                                passwordArray.push($("#ap_password_channel").val());//channel
                                setupPlugin.execute(wemoSetup.processConnectionStatus, wemoSetup.reportError, ACTION_POST_AP_PASSWORD_DATA, passwordArray);
                                $.mobile.loading( 'hide');

                            }, 20);
                        }
                    });
                }
            });

            $('#ap_password_cancel_btn').on('click', function(){
                $('#ap_password_popup').attr('data-go-forward','false');
                $('#ap_password_popup').popup('close');
            });

            $('#add_wifi_done_btn').on('click', function(){
                $('#add_wifi_network_popup').attr('wemo-go-forward','true');
                $('#add_wifi_network_popup').popup('close');
            });

            $('#add_wifi_cancel_btn').on('click', function(){
                $('#add_wifi_network_popup').attr('wemo-go-forward','false');
                $('#add_wifi_network_popup').popup('close');
            });

            $('#add_wifi_network_popup').on('popupafterclose', function() {

                if($('#add_wifi_network_popup').attr('wemo-go-forward') === 'true'){
                    console.log("process add wifi data");
                    console.log($('#add_wifi_network_ssid').val());
                    console.log($('#add_wifi_password_input').val());
                    console.log($('#security_option').val());
                    var auth;
                    var encrypt;
                    switch($('#security_option').val()){
                        case networkSecurity.OPEN:
                            auth = networkSecurity.AUTH_OPEN;
                            encrypt = networkSecurity.ENCRYPT_OPEN;
                            break;
                        case networkSecurity.WEP:
                            auth = networkSecurity.AUTH_WEP;
                            encrypt = networkSecurity.ENCRYPT_WEP;
                            break;
                        case networkSecurity.WPA:
                            auth = networkSecurity.AUTH_WPA;
                            encrypt = networkSecurity.ENCRYPT_WPA;
                            break;
                        case networkSecurity.WPA2:
                            auth = networkSecurity.AUTH_WPA2;
                            encrypt = networkSecurity.ENCRYPT_WPA2;
                            break;
                    }

                    $.mobile.loading( 'show', {
                        text: "",
                        textVisible: 'true',
                        theme: 'a',
                        textonly: 'false',
                        html: html = "<span class='ui-bar ui-overlay-c ui-corner-all' ><img src='css/images/ajax-loader.gif' /><h4>The WeMo App is trying to Connect '" + $('#add_wifi_network_ssid').val() + "'. This may take upto 60 seconds</h4></span>"
                    });

                    setTimeout(
                        function(){
                            passwordArray = [];//Password Array order should not be changed
                            passwordArray.push($('#add_wifi_network_ssid').val());//ssid
                            passwordArray.push(auth);//auth
                            passwordArray.push($('#add_wifi_password_input').val());//password
                            passwordArray.push(encrypt);//encrypt
                            passwordArray.push(networkSecurity.CHANNEL);//channel
                            setupPlugin.execute(wemoSetup.processConnectionStatus, wemoSetup.reportError, ACTION_POST_AP_PASSWORD_DATA, passwordArray);
                            $.mobile.loading( 'hide');
                        },
                        timeout.LONG
                    );


                }
            });

            $('#connection_unsuccessful_ok_btn').on('click', function(){
                $('#connection_unsuccessful_popup').popup('close');
            });

            var autoModeConnection = sessionStorage.getItem(CONNECT_TO_DEFAULT_ROUTER);
            console.log("Try to connect automatically: " + autoModeConnection);

            setTimeout(function(){
                if(autoModeConnection === "true"){
                    console.log("connecting automatically: ");
                    setupPlugin.execute(function(result){
                        console.log("default router ssid: " + result);
                        $('#ap_password_ssid').text(result);
                    }, wemoSetup.reportError,ACTION_GET_DEFAULT_ROUTER_SSID, []);
                    $('#hidden_btn').trigger('click');
                }
            },20) ;

            $('#ap_password_show').on('change', function(){
                if($(this).is(':checked')){
                    console.log('checked');
                    $('#ap_password_input').attr('type','text');
                } else {
                    console.log('un-checked');
                    $('#ap_password_input').attr('type','password');
                }
            });

            $("#security_option").on('change', function(){
                $( '#add_wifi_network_popup' ).trigger( 'updatelayout' );
                if($(this).val()==="Open"){
                    $(".wireless_password").hide();
                } else {
                    $(".wireless_password").show();
                }
            });
        }

        $('[name="show_password"]').on('change',function(){
            if($(this).is(':checked')){
                console.log('checked');
                $('[name="wireless_password"]').attr('type','text');
            } else {
                console.log('un-checked');
                $('[name="wireless_password"]').attr('type','password');
            }
        })
    },

    onBackPress: function() {
        console.log(TAG	+ "onBackPress");
        if($('#wifi_list_popup').is(':visible')){
            console.log(wemoSetup.TAG	+ "Dialog box is open");
            $('#wifi_list_popup').attr('data-go-forward','false');
            $( "#wifi_list_popup" ).popup( "close" );
            $( "#wifi_list_popup" ).hide()
        }else {
            console.log(TAG	+ "Dialog box is not open");
            window.sessionStorage.clear();
            //navigator.app.clearHistory();
            setupPlugin.execute(null, null, ACTION_STOP_UPNP_SERVICE, []);
            navigator.app.exitApp();
        }
    },

    onOffline: function() {
        console.log(TAG	+ "onOffline");
        $.mobile.loading( 'hide');
        $( "#network_failure_popup" ).popup( "open" );

    },

    onOnline: function() {
        console.log(TAG	+ "onOnline");
        $( "#network_failure_popup" ).popup( "close" );
    },

    getWiFiAPList: function(APList) {

        console.log("AP list size: " + APList.length);

        var li_list = '';
        for (var i=0;i<APList.length;i++)
        {
            var open = false;
            if(APList[i].SecurityStrength == "OPEN/NONE"){
                open = true;
            }
            var image_class = "wifi_signal_empty";
            if(APList[i].SignalStrength > 0 && APList[i].SignalStrength <= 25){
                if(open){
                    image_class = "wifi_signal_0";
                }else{
                    image_class = "net_work_lock_wifi_signal_0";
                }

            }
            if(APList[i].SignalStrength > 25 && APList[i].SignalStrength <= 50){
                if(open){
                    image_class = "wifi_signal_1";
                }else{
                    image_class = "net_work_lock_wifi_signal_1";
                }

            }
            if(APList[i].SignalStrength > 50 && APList[i].SignalStrength <= 75){
                if(open){
                    image_class = "wifi_signal_2";
                }else{
                    image_class = "net_work_lock_wifi_signal_2";
                }

            }
            if(APList[i].SignalStrength > 75 && APList[i].SignalStrength <= 100){
                if(open){
                    image_class = "wifi_signal_full";
                }else{
                    image_class = "net_work_lock_wifi_signal_full";
                }

            }

            console.log("ClassName:" + image_class);



            li_list += '<li id="wifi_ap_'+ i +'" SSID="'+ APList[i].SSID +'" SignalStrength="'+ APList[i].SignalStrength +'" SecurityStrength="'+ APList[i].SecurityStrength +'" Channel="'+ APList[i].Channel +'" class="'+image_class+'">'+
                APList[i].SSID +
                '<BR/>'+
                '<span class="list_small_text">'+APList[i].SecurityStrength+'</span>'+
                '</li>';
            console.log("AP details: " + APList[i].SSID);
            console.log("AP details: " + APList[i].SignalStrength);
            console.log("AP details: " + APList[i].SecurityStrength);
            console.log("AP details: " + APList[i].Channel);


        }
        $.mobile.hidePageLoadingMsg();

        $('#wifi_ap_list').html(li_list);

        $('#wifi_ap_list').append('<li id="add_wifi_btn" class="bg_white">Add Wi-Fi Network</li>');


        $('#wifi_list_popup').trigger("create");
        $('#wifi_ap_list').listview('refresh');

    },

    processConnectionStatus : function(status){
        console.log("Process connection status:" + status);
        var ssid = $('#ap_password_ssid').text();
        if(status === "1" || status === "3"){
            console.log("status returned is: 1, 3");

            setupPlugin.execute(function(status){
                console.log("remote enable success callback: " + status);
                window.sessionStorage.setItem(sessionStore.SETUP_REMOTE_STATUS, status);
                wemoSetup.getSetupSucessfulScreen();
            },wemoSetup.reportError,ACTION_ENABLE_REMOTE_ACCESS,[ssid]);
        } else if(status === "0" || status === "2" ){
            console.log("0, 2");
            $("#connection_unsuccessful_msg").text('The WeMo App was unable to connect to \''+ ssid +'\' Please try re-entering your password.');
            $( "#connection_unsuccessful_popup" ).popup( "open" );
        }else if(status === "4"){
            console.log("4");
            $("#connection_unsuccessful_msg").text('The WeMo App was unable to connect to \''+ ssid +'\' Please try reconnecting.');
            $( "#connection_unsuccessful_popup" ).popup( "open" );
        }
    },

    getSetupSucessfulScreen : function(){
        console.log("Open setup sucessful screen");
        window.sessionStorage.setItem("show_remote_alert", "true");
        navigator.app.loadUrl("file:///android_asset/www/setup_success.htm", {
            loadUrlTimeoutValue : 60000
        });
    },




    reportError : function(e) {
        console.log(wemoSetup.TAG + "Plugin Error!!!! " + e);
    }


};