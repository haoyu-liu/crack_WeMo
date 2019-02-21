/*
 eula.js

 Created by Belkin International, Software Engineering on 28/05/2014.
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
    $('.ui-header').css({'border-bottom': '1px solid #888 !important'});
    $('.sub_header').css({'z-index':3,'border-top': '1px solid #73D44C !important'});
	var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));
    eula.initialize();
});

var eula = {
    initialize : function() {
    	document.addEventListener('deviceready', eula.bindEvents, false);
    },

    bindEvents : function() {
        document.addEventListener("backbutton", eula.onBackPress, false);
        $('#acceptEula').on('click', eula.acceptEula);
    },

    onBackPress : function() {
        if ($('#select_photo_popup').is(':visible')) {
            $("#select_photo_popup").popup("close");
            $("#select_photo_popup").hide();
        } else{
            window.sessionStorage.clear();
            setupPlugin.execute(null, null, ACTION_STOP_UPNP_SERVICE, []);
            navigator.app.exitApp();
        }
    },

    acceptEula : function() {
    	nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        wemoUtil.loadUrl(filePath.EDIT_WEMO_DETAILS);
    }
};
