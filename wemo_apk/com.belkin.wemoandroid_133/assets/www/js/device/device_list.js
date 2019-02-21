/*
 device_list.js

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

if (typeof window.DEBUG === 'undefined') window.DEBUG = true; // will be removed

var TAG = "device_list.js: ";
var isRemoteEnabled = false;
var wasRemoteEnabled = false;
var isEditMode = false;
var isEditing = false;
var firmwareCheckTimeout;
var cloudDeviceListTimeout;
var cloudDeviceListAutoRefreshTimeout;
var begin_sec = 0;
var end_sec = 0;
var begin_ms = 0;
var end_ms = 0;
var t_out = 0;
var reload_counter = 0;
var reload_timer = 0;
var device_array = [];
var autoOffTimeUdid = [];
var contentHeight;
var headerHeight;
var isDeviceAvailable = false;
var moretabFlag = false;
var counterCall = 0;
var BridgeCall = 0;
var hideBottomNav = false;
var isBridgeFlag = false;
var start_timer = 0;
var FWUpgradeTimeInterval = 0;
var updatedDevicesCount = 0;
var firmwareFailCount = 0;
var devicelistbridge = "#device_list_bridge_container";
var devicelistbridgelistitem = devicelistbridge + " li[data-category='bridge']";
var bridgeFirmwareFlag = false;
var bridgeFirmwareStatus = "";
var pauseNetworkType;
/* variable to check if remote access is enabled upon first launch after install */
var remoteHomeId = "";
var getStatusInProcess = false;
var fwUrl;
var fwUrlGoing=false;
var fillFWUpgradeScheduled=false;
var arrCurrency = {
    "1": "$",
    "4": "&euro;",
    "3": "&pound;",
    "10": "&yen;",
    "13": "&#8361;",
    "15": "&#3647;",
    "7": "&#8369;"
}

var crockpotCount = 0; //^^^^^
var JardenRemoteCount = 0;
var isCached = false; //^^^^^
var globalSpinnerSuppress=false;
var isSpinnerGoing=true;
var maxTries=0;

//App Recovery
var options = 1;
var consitentFlag = false;
var counter = 0;
var maxRetryCount = 0;
var app_recovery_array = [];

var devicesFWUpgrade = {};

var devicesLoaded = {};

window.devicelistEvents = new EventEmitter2();
window.devicelistEvents.on('remoteUpdate', function(result) {
    //save last remote result. Smart framework will look to this variable to update the UI
    remoteResult = result;
    //call fetch action in the Smart framework and update UI
    window.devicelistEvents.emit('update');
});
window.devicelistEvents.on('deviceObject.deviceAdded', function(udn) {
    devicesLoaded[udn] = true;
    checkForCrockpot();

});

window.devicelistEvents.on('deviceObject.deviceRemoved', function(udn) {
    if (devicesLoaded[udn]) {
        delete devicesLoaded[udn];
    }
    checkForCrockpot();

});

window.devicelistEvents.on('addUndiscoveredDevice', function(device) {
    //device_list.buildListItem(device);
});

window.devicelistEvents.on('smartDrawer.beforeOpen', function() {
    $('.disabled').addClass('inMotion');
    device_list.closeAllInsightDrawersFromSmartFramework();
});

window.devicelistEvents.on('smartDrawer.afterClose', function() {
    $('.disabled').removeClass('inMotion');
    device_list.closeAllInsightDrawersFromSmartFramework();
});

window.devicelistEvents.on('removeFromCache', function(resp) {
    wemoUtil.infoLog(device_list.TAG, 'removeFromCache:' + JSON.stringify(resp));
    //if (isRemoteEnabled) {
    var udn = resp.attributes.udn;
    if (device_list.remoteAccess.isEnabled) {
        var mac = resp.attributes.macAddress;
        if(mac == undefined) {
            mac = WeMoDeviceList.getDevice(udn).mac;
        }
        cloudServices.hideDevice(mac);
        WeMoDeviceList.removeDevice(udn);
    } else {
        WeMoDeviceList.removeDevice(udn);
    }
});

window.devicelistEvents.on('packageLoaded', function() {
    adjustContentHeight();
});

window.devicelistEvents.on('packageStarted', function() {
    adjustContentHeight();
});

window.devicelistEvents.on('checkFirmware', function(resp) {
    device_list.checkFWUpgradeList(resp);

    var arrayUDN = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
    if (arrayUDN) {
        arrayUDN = arrayUDN.split(",");
        if (arrayUDN.indexOf(resp.udn) > -1) {
            arrayUDN.splice(arrayUDN.indexOf(resp.udn), 1);
            window.sessionStorage.setItem(sessionStore.DEVICE_LIST_UPDATE, arrayUDN);
        }
    }
});

window.devicelistEvents.on('checkFirmwareUpdate', function(resp) {

    var udnDevice = resp.$el.closest('li').attr('id');

    $('[id="' + udnDevice + '"] header').removeClass('notAvailableBgFW');
    $('[id="' + udnDevice + '"] .tileNotAvailableFW').remove();

    var arrUDN_updated = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
    if (arrUDN_updated) {
        arrUDN_updated = arrUDN_updated.split(",");
        if (arrUDN_updated.indexOf(udnDevice) > -1) {
            window.devicelistEvents.emit('onFirmWareUpdate' + udnDevice);
        }
    }
});

window.devicelistEvents.on('checkJardenFriendlyName', function(udn) {
    var obj = JSON.parse(window.sessionStorage.getItem("JardenUdnList"));
    if (obj) {
        if (obj[udn]) {
            window.devicelistEvents.emit('updateFriendlyName' + udn, obj[udn])
        }
    }

});

/** removes the bottom nav if only crockpot is found **/
function checkForCrockpot() {
    console.log(TAG + "Check For Jarden device:  ");
    var $container = $('#device_list_container');
    var $li = $container.find('li');

    var devices = devicesLoaded;


    var crockpotCount = 0,
        checkForHeater = window.sessionStorage.getItem('HEATER_EXISTS');

    if (checkForHeater) {
        window.sessionStorage.removeItem('HEATER_EXISTS');
    }

    _.each(devices, function(value, index) {
        if (device_list.isSmartFramework(index)) {

            crockpotCount++;
        }
        if (index.match(/Heater/gi)) {
            window.sessionStorage.setItem('HEATER_EXISTS', true);
        }

    });

    JardenRemoteCount = crockpotCount;

    if (_.size(devices) === crockpotCount && crockpotCount > 0) {
        $('#footer_id').addClass('hidden').hide();
        var headerHeight = parseInt($('.ui-header').height(), 10);
        var windowHeight = parseInt($(window).height(), 10);

        //$("#device_list_container").height(windowHeight - headerHeight);
        //  $('.device_list_content').height(windowHeight - headerHeight);
        hideBottomNav = true;
        /**
         * Note - The WeMoDeviceList.getArray() is returning empty array [no devices]
         *        Due to that the Footer is getting removed/Hidden from the screen.
         *        I am checking if the crockpotCount is 0, don't hide the footer.
         * */

        if ($('#device_list_container li').length == 1 && crockpotCount == 1) {
            $('.device_list_footer').addClass('hidden').hide();
            hideBottomNav = true;
        }

        //setInterval(function() {
        /*var crockFriendlyName = window.sessionStorage.getItem('DEVICE_EDIT_CROCKPOT');
            var $container = $('#device_list_container');
            if(crockFriendlyName != null){
                var crockStr = crockFriendlyName.split('&&');
                var udn = "";
                udn = $.trim(crockStr[0]);
                $('#' + udn).css('border','1px solid red');
               $container.find('h1').empty().append(crockStr[1]);
            }*/
        //},5000);


    } else if (_.size(devices) > 0) {

        $('.device_list_footer').removeClass('hidden').show();
        hideBottomNav = false;
    }

    // fixContainerHeight();

}

function CModifyDeviceController () {
    var ignore = false;
    this.activateIgnoreMode = function () {
        ignore = true;
    };
    this.deactivateIgnoreMode = function () {
        ignore = false;
    };
    this.show = function () {
        if(!ignore) {
            $("#modify_device").show();
        }
    };
    this.hide = function () {
        if(!ignore) {
            $("#modify_device").hide();
        }
    };
}

var modifyDeviceController = new CModifyDeviceController();

$(document).bind('pageinit', function() {
    device_list.initialize();
});

$(document).ready(function() {

    //if (!window.sessionStorage.getItem(sessionStore.FIRMWARE_AVAILABLE)) {
    if (!window.sessionStorage.getItem("firmware_shown")) {
        $('#more_new_firmware').addClass('none');
        $('#new_fw_available').hide();
    }
    //checkForCrockpot();
    $("#led_wt_carousel #slides").owlCarousel({
        navigation: true,
        slideSpeed: 300,
        paginationSpeed: 400,
        singleItem: true
    });

});


function showRemoteDisabledMsg() {
    var isRemoteOff = window.sessionStorage.getItem(sessionStore.REMOTE_LOCAL)=== "false" ;
    var isRemoteModeWhenDisable = window.sessionStorage.getItem("isRemoteMode") === "true";
    var isRemoteMsgEnabled = window.sessionStorage.getItem("showRemoteDisableMsg") === 'true';
    var emptyDeviceList = $(".device_list_ul > li").length === 0;

    if (isRemoteModeWhenDisable && isRemoteOff && emptyDeviceList) {
        networkConnection.initializeRemoteModeMsg();
        window.sessionStorage.setItem("showRemoteDisableMsg", true);
    } else if (isRemoteMsgEnabled) {
        networkConnection.initializeRemoteModeMsg();
    }
}

/** temp workaround in case we need to undo this, use a flag instead of removing calls **/
var lastTop = 0;

function adjustContentHeight() {
    if (!viewPortHeight) {
        var viewPortHeight = $(window).height();
        var headerHeight = $('#header_id').outerHeight(true);
        var footerHeight = $('.bottom_nav').outerHeight(true);
        var $content = $('.device_list_content');
    }


    var marginTop = parseInt($content.css('marginTop'), 10);
    var top = parseInt($content.offset().top, 10) - marginTop;

    if (top !== lastTop) {
        var contentHeight = (viewPortHeight - headerHeight - footerHeight) + 20;

        var margin = headerHeight - top;

        $content.css({
            height: contentHeight,
            marginTop: margin
        });
        lastTop = top;
    }


}



/** temp workaround in case we need to undo this, use a flag instead of removing calls **/
var lastTop = 0;

function setContentHeight(crockpotCount, isCrockPot) {



    /** http://jira.nikleb.com/browse/WEMO-24670 - altering the top messes a lot of stuff up **/

    //console.log('CONTENTHEIGHT:viewPortHeight=' + viewPortHeight + 'headerHeight=' + headerHeight + 'footerHeight=' + footerHeight);
    /*$('.device_list_content').css({
        'height': contentHeight + 'px',
        'top': headerHeight
       
    });
*/

    /** WHAT IS ALL OF THIS FOR?? **/

    /**
     This code is the fix for WEMO-21978, WEMO-22610, WEMO-22894, WEMO-23940
     Based on observation when the SlowCooker is in the device list, QA has observed an gap between first tile and header.
     And some times first tile was going inside the header.
    **/

    /*
    console.log('Set ContentHeight:  Open');
    if (parseInt(crockpotCount) > 0) {
        if (isCrockPot) {
            removeGapFromTopDeviceListAfterCrockPotAdded(isCrockPot);
        }
    } else {}
    */
}

function removeGapFromTopDeviceListAfterCrockPotAdded(isCrockPot) {
    ///** http://jira.nikleb.com/browse/WEMO-24670 - altering the top messes a lot of stuff up **/
    /*
    if (isCrockPot) {
        setTimeout(function() {
            //alert('Called');
           
            $('.device_container').offset({
                top: ($('#header_id').outerHeight(true))
            });
        }, 1000);
    }*/

}

function BlinkBridgedDevices() {
    var container;
    var procedure = function() {
        console.log('BlinkBridgedDevices -> procedure');
        container.show();
    };
    this.timer = function(ref, dur) {
        console.log('BlinkBridgedDevices -> timer');
        container = ref;
        container.hide();
        setTimeout(procedure, dur);
    };
};

function DisposeList() {
    // L10N: es-ES
    var listado = [],
        jonques = [];
    var isPresent = function(articulo, escora) {
        console.log('DisposeList -> isPresent: ' + articulo);
        for (var i = 0, solo, len = escora.length; i < len; i++) {
            solo = escora[i].attr('id');
            if (articulo == solo) {
                return true;
            }
        }
        return false;
    };
    var isNotDetected = function(s) {
        return (s.indexOf('Not Detected') == -1) ? false : true;
    };
    this.eliminateDuplicates = function(e) {
        var este = $(this),
            solo = este.attr('id');
        console.log('DisposeList -> eliminateDuplicates.trace: ' + este[0].outerHTML);
        if (este.data('category') == 'bridge') {
            if (isPresent(solo, listado)) {
                (isNotDetected(este.html()) && jonques.indexOf(solo) != -1) ? jonques.push(solo) : este.remove();
            } else {
                listado.push(este);
            }
        } else {
            (este.attr('data-aura-started')) ? este.detach() : este.remove();
        }
        console.log('DisposeList -> eliminateDuplicates.id: ' + solo);
    };
    this.cleanJunks = function(e) {
        var este = $(this),
            solo = este.attr('id'),
            pos = jonques.indexOf(solo);
        if (isNotDetected(este.html()) && pos > -1) {
            este.remove();
            jonques.splice(pos, 1);
        } else {
            var bbd = new BlinkBridgedDevices();
            bbd.timer(este, 3000);
        }
    };
}

function emptyDeviceList() {
    //we need to detach anything that is smart, so we dont lose its events or need to restart it.
    $('.device_list_ul.first li').each(function(e) {
        var $this = $(this);

        if ($this.attr('data-aura-started')) {
            $this.detach();
        } else {
            $this.remove();
        }
    });
    console.log('device_list -> emptyDeviceList');
    /*var lddv = new DisposeList();
    $('#device_list_container li').each(lddv.eliminateDuplicates);
    $('#device_list_container li').each(lddv.cleanJunks);*/
}

function ConfirmDialog() {
    var container, proceed, cancel, timer;
    var onclick_notnow = function(e) {
        console.log('ConfirmDialog -> onclick_notnow');
        detachListeners();
        container.popup('close');
        cancel();
    };
    var onclick_showme = function(e) {
        console.log('ConfirmDialog -> onclick_showme');
        detachListeners();
        container.popup('close');
        timer = setTimeout(ontimeout, 1000);
    };
    var ontimeout = function() {
        console.log('ConfirmDialog -> ontimeout');
        clearTimeout(timer);
        if (proceed != undefined) {
            proceed();
        }
    };
    var attachListeners = function() {
        container.find('div[data-id=notnow]').on('click', onclick_notnow);
        container.find('div[data-id=showme]').on('click', onclick_showme);
    };
    var detachListeners = function() {
        container.find('div[data-id=notnow]').off('click', onclick_notnow);
        container.find('div[data-id=showme]').off('click', onclick_showme);
    };
    this.setProceed = function(ref) {
        proceed = ref;
    };
    this.setCancel = function(ref) {
        cancel = ref;
    };
    this.setContainer = function(ref) {
        container = $(ref);
    };
    this.initialize = function() {
        if (container != undefined) {
            container.popup('open');
            attachListeners();
        }
    };
}

function LedWalkthrough() {
    var container, slides,
        counter = 0,
        status = false,
        mode = false,
        confirmDialog = new ConfirmDialog();
    var listener = function(e) {
        console.log('LedWalkthrough -> listener');
        e.preventDefault();
        switch ($(this).data('id')) {
            case 'cloz':
                container.hide();
                destroy();
                break;
        }
    };
    var destroy = function() {
        console.log('LedWalkthrough -> destroy');
        if (status) {
            container.find('a').off('click', listener);
            status = false;
        }
    };
    var proceed = function() {
        console.log('LedWalkthrough -> proceed, mode:' + mode);
        if (mode) {
            counter = 0;
            slides.find('.led-wt-s').hide();
            slides.find('.groupSlide').show();
        } else {
            slides.find('.led-wt-s').hide();
            slides.find('.singleSlide').show();
        }
        container.find('a').on('click', listener);
        container.show();
    };
    var cancel = function() {
        console.log('LedWalkthrough -> cancel');
        if (status) {
            status = false;
        }
    };
    this.setMode = function(bool) {
        mode = bool;
    };
    this.setContainerId = function(id) {
        container = $(id);
        slides = $(id + '>#slides');
    };
    this.initialize = function() {
        console.log('LedWalkthrough -> initialize');
        if (!status) {
            status = true;
            confirmDialog.setContainer('#led_wt_confirmdialog');
            confirmDialog.setProceed(proceed);
            confirmDialog.setCancel(cancel);
            confirmDialog.initialize();
        }
    };
}

var ledWalkthrough = new LedWalkthrough();
ledWalkthrough.setContainerId('#led_wt_carousel');


function PopupDetector() {
    if (arguments.callee._singletonInstance) {
        return arguments.callee._singletonInstance;
    }
    arguments.callee._singletonInstance = this;

    var states = [],
        lastOpenedAt = 0,
        lastClosedAt = 0;
    var _constructor = function() {
        $('div[data-role=popup]').on({
            popupafteropen: function(e, ui) {
                console.log('PopupDetector._constructor.popupafteropen.begin# e.target.id:' + e.target.id);
                states.push(e.target.id);
                var popupDetector = new PopupDetector();
                popupDetector.setLastOpenedTimestamp();
                console.log('PopupDetector._constructor.popupafteropen.end# states:' + states.toString() + '; lastOpenedAt:' + lastOpenedAt);
            },
            popupafterclose: function(e, ui) {
                console.log('PopupDetector._constructor.popupafterclose.begin# e.target.id:' + e.target.id);
                var pos = states.indexOf(e.target.id);
                if (pos > -1) {
                    states.splice(pos, 1);
                }
                var popupDetector = new PopupDetector();
                popupDetector.setLastClosedTimestamp();
                console.log('PopupDetector._constructor.popupafterclose.end# states:' + states.toString() + '; lastOpenedAt:' + lastOpenedAt);
            }
        });
    }();
    this.initialize = function() {};
    this.isDetectedOpenedPopup = function() {
        var bool = (states.length > 0) ? true : false;
        console.log('PopupDetector.isDetectedOpenedPopup: ' + bool);
        return bool;
    };
    this.timeLapsedSinceLastPopupClosed = function() {
        var ts = $.now();
        var duration = ts - lastClosedAt;
        console.log('PopupDetector.timePassedFromLastClosedPopup: ' + duration);
        return duration;
    };
    this.setLastOpenedTimestamp = function() {
        lastOpenedAt = $.now();
    };
    this.setLastClosedTimestamp = function() {
        lastClosedAt = $.now();
    };
}

var popupDetector = new PopupDetector();

var device_list = {};
device_list = {
    TAG: 'device_list.js',
    animations: [],
    deviceListContainer: {},
    arrTimestampForRemote: {},
    initialize: function() {
        $("#find_and_pair_Newdevice").hide();
        window.sessionStorage.setItem(sessionStore.IS_BRIDGE_PRESENT, false);
        if (window.sessionStorage.getItem("DeviceList") == "1") {
            disableNetworkWatchdog = true;
            window.sessionStorage.removeItem("DeviceList");
        }
        if (window.sessionStorage.getItem(sessionStore.FIRMWARE_AVAILABLE)!="true") {
            $('#more_new_firmware').addClass('none');
            $('#new_fw_available').hide();
        }

        wemoUtil.infoLog(device_list.TAG, "initialize");

        if (window.sessionStorage.getItem('smartframework')) {
            wemoUtil.infoLog(device_list.TAG, "Smartframework intitialized, starting device list...");
            window.sessionStorage.removeItem("smartframework");
            device_list.onDeviceReady();
        } else {
            setTimeout(function() {
                device_list.initialize();
            }, timeout.SHORT);
        }
    },

    onDeviceReady: function() {

        wemoUtil.infoLog(device_list.TAG, "onDeviceReady");
        nativeUtilPlugin.execute(
            function(type) {
                console.log(TAG + "Network type is::" + type);
                if (type == networkType.HOME_NETWORK)
                {
                	isRemoteEnabled = false;
                	window.sessionStorage.setItem(sessionStore.REMOTE_MODE, false);
                }
                else if (type == networkType.REMOTE_WIFI || type == networkType.REMOTE_MOBILE)
                {
                	isRemoteEnabled = true;
                	window.sessionStorage.setItem(sessionStore.REMOTE_MODE, true);
                }
            },
            device_list.reportError,
            actions.GET_NETWORK_TYPE_NEW, []
        );
        //setContentHeight(0);
        device_list.updateElementPosition();
        sharedPreferences.get(sharedPreferencesConstants.WEMO_NAMESPACE, sharedPreferencesConstants.WEMO_DEVICE_ORDER, '', function(value) {
            if (value != null && value != "") {
                console.log("OnDeviceReady - Order Device List from SharedPreferences:  " + JSON.stringify(value));
                window.sessionStorage.setItem(sessionStore.ORDER_DEVICE_LIST, value);
            }
        });

        sharedPreferences.get(sharedPreferencesConstants.WEMO_NAMESPACE, sharedPreferencesConstants.TIMESTAMP_FOR_REMOTE, '', function(value) {
            if (value != null && value != "") {
                console.log("OnDeviceReady - timestamp for remote from SharedPreferences:  " + JSON.stringify(value));
                device_list.arrTimestampForRemote = JSON.parse(value);
            }
        });

        requirejs(['../../../android_asset/www/js/classes/deviceObject.js'], function() {
            requirejs(['../../../android_asset/www/js/classes/remoteAccess.js'], function() {
                if (isRemoteEnabled) {
                    requirejs(['../../../android_asset/www/js/classes/cloudServices.js'], function() {
                        device_list.mainMethod();
                    });
                } else {
                    device_list.mainMethod();
                }
            });
        });
        if (_.size(devicesLoaded) === 0) {
            $('#footer_id').addClass('hidden').hide();
            $('.device_list_footer').addClass('hidden').hide();
        }

        showRemoteDisabledMsg();
        networkConnection.initializeNetworkMsg();
    },
    
    remoteAccess: {
        isEnabled: false,
        onLocalRouter: false,
        onRemoteRouter: false,
        updateStatus: function(enabled){
            wemoUtil.infoLog(device_list.TAG, "remoteAccess.updateStatus: " + enabled);
            device_list.remoteAccess.isEnabled = enabled;
        },
        checkStatus: function () {
            wemoUtil.infoLog(device_list.TAG, "remoteAccess.checkStatus");
            deviceTabPlugin.execute(
                device_list.remoteAccess.updateStatus,
                device_list.reportError,
                actions.IS_REMOTE_ENABLED,
                []
            );
        },
        initialize: function() {
            var self = device_list.remoteAccess;
            self.onLocalRouter = (window.sessionStorage.getItem(sessionStore.REMOTE_LOCAL) == "true") ? true : false;
            self.onRemoteRouter = (window.sessionStorage.getItem(sessionStore.REMOTE_MODE) == "true") ? true : false;
            self.isEnabled = (self.onRemoteRouter || self.onLocalRouter) ? true : false;
            isRemoteEnabled = self.onRemoteRouter;
        }
    },

    isMinSupportedFirmware: function(firmwareArray){
        var is_FW_Supported = true;
        for (var i = 0; i < firmwareArray.length; i++) {
            
            var firmwareVerString = firmwareArray[i][key.DEVICE_FIRMWARE];
            var firmwareVerAry = firmwareVerString.split('.');
            var firmwareVer = parseInt(firmwareVerAry[2]);
            wemoUtil.infoLog(device_list.TAG, 'firmware version : ' + firmwareVer +' FW_SUPPORT: '+configValue.FIRMWARE_VERSION_REQUIRED_RULES);

            if(firmwareVer < configValue.FIRMWARE_VERSION_REQUIRED_RULES)
            {
                wemoUtil.infoLog(device_list.TAG, 'Firmware version is less than the minimum supported version');
                is_FW_Supported = false;
                break;
            }
        }

       return is_FW_Supported; 
    },

    errorInChekingMinSupportedFW: function(){
        wemoUtil.infoLog(device_list.TAG, 'error in checking for minimum supported version');
        device_list.gotoRules();
    },

    mainMethod: function() {
        console.log(TAG + "mainMethod");
        deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
        device_list.collectEmail();
        //setContentHeight(0);

        device_list.initializeSorter();

        window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Help_Url']);

        device_list.initializeDOMElements();
        device_list.setupDOMListeners();

        // Let's initialize DB first of all. It's required for reset functionality.
        wemoUtil.DBCreate();

        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        device_list.bindEvents();
        //All initialization script goes here
        if (window.sessionStorage.getItem(sessionStore.REMOTE_MODE) == "true")
            isRemoteEnabled = true;

        // If device firmware is upgraded to bridge, it again checks whether upgrade is required or not.
        console.log("the value of CHECK_FIRMWARE_UPGRADE_REQUIRED is :: " + window.sessionStorage.getItem(sessionStore.CHECK_FIRMWARE_UPGRADE_REQUIRED))
        if (window.sessionStorage.getItem(sessionStore.CHECK_FIRMWARE_UPGRADE_REQUIRED) == "true") {
            if (isRemoteEnabled) {
                device_list.getCloudFirmwareVersion(JSON.parse(window.sessionStorage.getItem("device_array")));
            } else {
                var leddevices = window.sessionStorage.getItem(sessionStore.LED_DEVICE_FIRMWARE_ARRAY);
                leddevices = JSON.parse(leddevices);

                if (leddevices != undefined && leddevices != "")
                    device_list.isFirmwareAvailable(leddevices);
                else
                    device_list.isFirmwareAvailable([]);
            }
        }

        console.log("Remote mode: " + isRemoteEnabled + " sessionStore.REMOTE_MODE: " + window.sessionStorage.getItem(sessionStore.REMOTE_MODE));

        $('#device_btn').addClass('device_btn_active');

        /* get remote access details from shared preferences */
        device_list.getRemoteDetailsAndAutoEnable();

        nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", wemo.items['Devices_LookingForDevices']]);

        if (isRemoteEnabled) {
            //modifyDeviceController.hide();
            deviceTabPlugin.execute(null, null, actions.STOP_CONTROL_POINT, []);
            /*//instant remote cache
			WeMoDeviceList.restoreFromCache(function() {
                isCached = true;
                WeMoDeviceList.updateCache();
                device_list.renderDeviceList(isEditMode, false);
                nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
            });*/
            if (window.sessionStorage.getItem("launch") == null) {
                window.sessionStorage.setItem("launch", '0');
                device_list.loadDevicesFromCloud("load");
            } else {
                device_list.loadDevicesFromCloud("refresh");
            }
            device_list_bridge.deviceListBridgeInit();
            device_list.autoRefresh();
        } else {
            //modifyDeviceController.show();

            /******** Led Specific JS************/

            device_list_bridge.deviceListBridgeInit();

            /******** Led Specific JS************/

            modifyDeviceController.show();
            // device_list.showModal();
            device_list.registerListeners();

            device_list.checkARPBasedCache();

            // Removing unnecessary check, it is always true.
            if (!window.sessionStorage.getItem("firmware_shown")) {
                device_list.getLocalFirmwareVersion();
                window.sessionStorage.setItem("firmware_shown", true);
            }

        }

        $('#refresh_device_list').on('click', function(e) {
        	wemoUtil.infoLog(device_list.TAG, "refresh_device_list globalSpinnerSuppress: "+globalSpinnerSuppress+" isSpinnerGoing: "+isSpinnerGoing+" maxTries: "+maxTries); //added console log to investigate issue in wemoUtil loading
        	maxTries++; //added for initial observation, will remove this later if there is no concern w.r.t to intermittent wemoUtil loading
        	if(globalSpinnerSuppress && maxTries < configValue.REFRESH_RESET_MAX_RETRIES)
        		return true;
        	globalSpinnerSuppress=true;
        	maxTries=0;
            setTimeout(function() {
            	if(isSpinnerGoing)
            	{
            		nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
            		isSpinnerGoing=false;
            	}
                globalSpinnerSuppress=false;
            }, timeout.LOCAL_REFRESH_TIMEOUT);
            nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", wemo.items['Devices_LookingForDevices']]);
            isSpinnerGoing=true;

            nativeUtilPlugin.execute(
            		function(type) {
            			wemoUtil.infoLog(device_list.TAG, 'refresh_device_list Network type is::' + type);
            			if (type == networkType.HOME_NETWORK)
            			{
            				isRemoteEnabled = false;
            				window.sessionStorage.setItem(sessionStore.REMOTE_MODE, false);
            			}
            			else if (type == networkType.REMOTE_WIFI || type == networkType.REMOTE_MOBILE)
            			{
            				isRemoteEnabled = true;
            				window.sessionStorage.setItem(sessionStore.REMOTE_MODE, true);
            			}
            			if (isRemoteEnabled) {
            				device_list.loadDevicesFromCloud("remote");
            				//device_list.refreshPopup();
            				openDrawerFlag = false;
            				openDrawerId = [];
            				// });
            			} else {
            				//emptyDeviceList();
            				counterCall = 0;
            				BridgeCall = 0;
            				device_list.updateDevicesFromUpNp(true).done(function() {
            					//device_list.refreshPopup();
            				});
            			}
            			$('#device_scroller #device_container ul li div .open').each(function() {
            				window.devicelistEvents.emit('toggleRefresh');
            			});
            		},
            		device_list.reportError,
            		actions.GET_NETWORK_TYPE_NEW, []
            );



        });


        //Net Cam Start Device_List.js

        $("#device_list_container").on('click', ".netcam_list", function() {
            /*
             * Plug-In Call to - actions.CHECK_NET_CAM
             * 1. Check WeMo NetCam Application is installed on the device
             * 2. True - Command to java to launch the WeMo NetCam Application
             * 3. False - Redirect to 'netCam/get_it_now.html'
             * */
            var item;
            var netCamObj = {};

            netCamObj.isRemoteEnabled = isRemoteEnabled;
            if (!isRemoteEnabled) {
                item = $(this);
                netCamObj.ID = item.attr('id');
            } else {
                item = $(this).find('span[name="name_device_state"]');
                console.log("MacAdd:  " + $(this).find("wemo-device-mac-address").text());
                console.log("MacAdd:  " + item.attr('wemo-device-mac-address'));
                netCamObj.ID = item.parent().attr('id');
                netCamObj.MacAdd = item.attr('wemo-device-mac-address');
            }
            console.log("clicked item:ID:  " + item.attr('id'));
            console.log("clicked item:Type:  " + item.attr('wemo-device-type'));
            console.log("clicked item:Name:  " + item.attr('wemo-device-friendly-name'));
            console.log("clicked item:UserName:  " + item.attr('wemo-device-friendly-name').substr(item.attr('wemo-device-friendly-name').indexOf(',') + 1, item.attr('wemo-device-friendly-name').length));
            console.log("Plug-In Call to - actions.CHECK_NET_CAM");

            netCamObj.Type = item.attr('wemo-device-type');
            netCamObj.Name = item.attr('wemo-device-friendly-name');
            netCamObj.UserName = item.attr('wemo-device-friendly-info');
            var type = netCamObj.Type;

            deviceTabPlugin.execute(
                function(value) {
                    console.log("actions.CHECK_NET_CAM:  " + value + " type: " + type);
                    if (value) {

                        console.log("NET_CAM - True - type: " + type);

                        var apppkg = '';
                        if (type == wemoNetCam.TYPE || type == wemoNetCam.REMOTE_TYPE) {
                            apppkg = 'com.belkin.android.androidbelkinnetcam';
                        } else if (type == wemoLinkCam.TYPE || type == wemoLinkCam.REMOTE_TYPE) {
                            apppkg = 'com.seedonk.android.androidlinksyscam';
                        }
                        console.log("Plug-In Call to - actions.LAUNCH_NET_CAM_APP type: " + type + " apppkg: " + apppkg);


                        deviceTabPlugin.execute(
                            function(value) {
                                window.startapp.start({
                                        android: apppkg
                                    },
                                    function() {}, device_list.reportError()
                                );
                            },
                            device_list.reportError,
                            actions.LAUNCH_NET_CAM_APP, [item.attr('wemo-device-friendly-name').substr(item.attr('wemo-device-friendly-name').indexOf(',') + 1, item.attr('wemo-device-friendly-name').length), ((isRemoteEnabled) ? netCamObj.MacAdd : netCamObj.ID), 1]
                        ); //item.attr('id')
                    } else {
                        console.log("NET_CAM - False - ");
                        console.log("Redirect to - " + filePath.NET_CAM_GET_IT_NOW);
                        window.sessionStorage.removeItem(sessionStore.NET_CAM_OBJ_FROM_DEVICE_LIST);
                        window.sessionStorage.setItem(sessionStore.NET_CAM_OBJ_FROM_DEVICE_LIST, JSON.stringify(netCamObj));
                        wemoUtil.loadUrl(filePath.NET_CAM_GET_IT_NOW);
                    }
                },
                device_list.reportError,
                actions.CHECK_NET_CAM, []
            );
        });

        if (!isRemoteEnabled) {
            $("#device_list_container").on('tap', "li[wemo-device-type*='insight'] span.device_list_friendly_name_container", function() {
                var item_id = $.trim($(this).parent().attr('id'));
                if ($(this).parent().attr('wemo-device-cached') != 'true') {
                    var tmpDev = WeMoDeviceList.getDevice(item_id);
                    if ($(this).parent().hasClass('disabled')) {
                        //device_list.deleteDevice(tmpDev.udn);
                    } else {
                        console.log("friendly name tap");
                        if (!isEditMode) {
                            console.log(item_id);
                            var panel = $('li[id="' + item_id + '_stat"]');
                            var panelIsOpen = true;
                            if (!panel.is(":visible")) {
                                //Close all other opened drawers (Smart and Insight)
                                device_list.closeAllInsightDrawers();
                                window.devicelistEvents.emit('closeSmartDrawer');
                                panel.find('ul').hide();
                                //panel.find('.insight_loader').show();
                                device_list.fetchInsightDeviceData(item_id);
                                panelIsOpen = true;
                                $(this).removeClass("drawer_icon_closed").addClass("drawer_icon_opened");
                                panel.slideDown("slow");
                            } else {
                                //reset update timeout
                                var timeout = panel.attr('data-update-timeout');
                                if (timeout != '') {
                                    clearTimeout(parseInt(timeout, 10));
                                    panel.attr('data-update-timeout', '');
                                }
                                panelIsOpen = false;
                                $(this).removeClass("drawer_icon_opened").addClass("drawer_icon_closed");
                                panel.slideUp("slow");
                            }

                            if (panelIsOpen) {
                                setTimeout(function() {
                                    var scrollTop = panel.offset().top - headerHeight;
                                    var top = panel.offset().top;
                                    if (top > (contentHeight - panel.height())) {
                                        $("#device_list_content").animate({
                                            scrollTop: scrollTop
                                        }, "slow");
                                    }
                                }, 1000);
                            }
                        }
                    }
                }
                return false;

            });
        } else {
            $("#device_list_container").on('tap', "li[wemo-device-type*='Insight'] span.device_list_friendly_name_container", function() {
                var item_id = $.trim($(this).parent().attr('id'));
                var tmpDev = WeMoDeviceList.getDevice(item_id);
                var pluginID = tmpDev.pluginid;
                var macAddress = tmpDev.mac;

                if ($(this).parent().hasClass('disabled')) {
                    device_list.deleteDevice(tmpDev.udn);
                } else {

                    var panel = $('li[id="' + item_id + '_stat"]');
                    console.log("panel " + panel.html());
                    var panelIsOpen = true;
                    if (!panel.is(":visible")) {
                        var panelIsOpen = true;
                        //Close all other opened drawers (Smart and Insight)
                        device_list.closeAllInsightDrawers();
                        window.devicelistEvents.emit('closeSmartDrawer');
                        panel.find('ul').hide();
                        panel.find('#insight_failure_container').hide();
                        panel.find('.insight_loader').show();
                        console.log("Trying pluginID " + pluginID + " macAddress " + macAddress);
                        device_list.fetchInsightDeviceData(item_id, pluginID, macAddress);
                        $(this).removeClass("drawer_icon_closed").addClass("drawer_icon_opened");
                    } else {
                        //reset update timeout
                        var panelIsOpen = false;
                        var timeout = panel.attr('data-update-timeout');
                        if (timeout != '') {
                            clearTimeout(parseInt(timeout, 10));
                            panel.attr('data-update-timeout', '');
                        }

                        $(this).removeClass("drawer_icon_opened").addClass("drawer_icon_closed");
                    }
                    panel.slideToggle("slow");
                    if (panelIsOpen) {
                        setTimeout(function() {
                            var scrollTop = panel.offset().top - headerHeight;
                            var top = panel.offset().top;
                            if (top > (contentHeight - panel.height())) {
                                $("#device_list_content").animate({
                                    scrollTop: scrollTop
                                }, "slow");
                            }
                        }, 1000);
                    }
                }
                return false;
            });
        }

        //Net Cam End Device_List.js

        $("#device_list_container").on('click', "span[name='name_device_state']", function() {

            window.sessionStorage.setItem('sessionStore.NET_CAM', false);
            if (!isRemoteEnabled) {
                var listItem = $(this).parent().parent();
                var udn = listItem.attr('id');
                var friendly_name = listItem.attr('wemo-device-friendly-name');
                var image_url = listItem.attr('wemo-device-icon-url');
                var device_type = listItem.attr('wemo-device-type');
                var pluginID = listItem.attr('wemo-device-plugin-id');
                var macAddress = listItem.attr('wemo-device-mac-address');
            } else {
                var listItem = $(this);
                var udn = listItem.attr('wemo-device-udn');
                var friendly_name = listItem.attr('wemo-device-friendly-name');
                var image_url = listItem.attr('wemo-device-icon-url');
                var device_type = listItem.attr('wemo-device-type');
                var pluginID = listItem.attr('wemo-device-plugin-id');
                var macAddress = listItem.attr('wemo-device-mac-address');
            }

            console.log("clicked item: " + udn+" " + friendly_name+" "+image_url+" "+device_type+" "+pluginID+" "+macAddress);



            if (isEditMode) {
                /*device_list.showModal();
                 setTimeout(function () {
                 if (isRemoteEnabled) {
                 window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_MAC, macAddress);
                 window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_PLUGIN_ID, pluginID);
                 window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_SSID, macAddress);
                 }
                 else {
                 devicePlugin.execute(function (ssid) {
                 window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_SSID, ssid);
                 }, null, actions.GET_WEMO_SSID, [udn]);
                 }
                 window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME, friendly_name);
                 window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL, image_url);
                 window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_UDN, udn);
                 window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_TYPE, device_type);

                 devicePlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
                 device_list.hideModal();
                 wemoUtil.loadUrl(filePath.DEVICE_LIST_EDIT);
                 }, timeout.LONG);
                 if (device_type.indexOf('NetCamSensor') != -1) {
                 var netCamObj = {};
                 netCamObj.ID = udn;
                 netCamObj.Type = device_type;
                 netCamObj.Name = friendly_name;
                 netCamObj.UserName = friendly_name.substr(friendly_name.indexOf(',') + 1, friendly_name.length);
                 window.sessionStorage.removeItem(sessionStore.NET_CAM_OBJ_FROM_DEVICE_LIST);
                 window.sessionStorage.setItem(sessionStore.NET_CAM_OBJ_FROM_DEVICE_LIST, JSON.stringify(netCamObj));
                 }*/
            } else {
                if (isRemoteEnabled) {
                    var item = $(this);
                    if (item.attr('wemo-device-type') == wemoSwitch.REMOTE_TYPE || item.attr('wemo-device-type') == wemoLightSwitch.REMOTE_TYPE || item.attr('wemo-device-type') == wemoInsight.REMOTE_TYPE || item.attr('wemo-device-type') == wemoMaker.REMOTE_TYPE) {
                        console.log(item.attr('class'));
                        item.removeClass();
                        item.addClass("switch_activated");
                    } else {
                        console.log("clicked but Not a switch");
                    }
                } else {
                    if (device_type === wemoSwitch.TYPE || device_type === wemoLightSwitch.TYPE || device_type === wemoInsight.TYPE || device_type === wemoMaker.TYPE) {
                        console.log("Item is switch");
                        var itemID = '[id="' + udn + '"]';
                        var item_state = $(itemID).find("[name='name_device_state']");
                        item_state.removeClass();
                        item_state.addClass("switch_activated");
                        setTimeout(function() {
                            item_state.attr('wemo-device-state', "switch_activated");
                            var switchPrevState = listItem.attr('wemo-device-state');
                            if (device_type === wemoMaker.TYPE) {
                                var attributeList = '{"Switch":"null","Sensor":"null","SwitchMode":"null","SensorPresent":"null"}';
                                var attributeJson = JSON.parse(attributeList);
                                if (switchPrevState == deviceStates.OFF) {
                                    attributeJson['Switch'] = deviceStates.ON;
                                    device_list.setAttributes(udn, attributeJson);
                                } else if (switchPrevState == deviceStates.ON || switchPrevState == deviceStates.STANDBY) {
                                    attributeJson['Switch'] = deviceStates.OFF;
                                    device_list.setAttributes(udn, attributeJson);
                                }
                            } else {
                                console.log("prev binary state: " + switchPrevState);
                                if (switchPrevState == deviceStates.OFF) {
                                    device_list.setBinaryState(udn, deviceStates.ON);
                                } else if (switchPrevState == deviceStates.ON || switchPrevState == deviceStates.STANDBY) {
                                    device_list.setBinaryState(udn, deviceStates.OFF);
                                }
                            }
                        }, timeout.LONG);

                    } else {
                        console.log("Item is not switch");
                    }
                }
            }

        });

        $("#device_list_container").on('tap', ".edit_device_arrow_icon", function() {

            if (!($(this).closest('div').hasClass('ledDiv'))) {

                window.sessionStorage.setItem('sessionStore.NET_CAM', false);
                var listItem = '';
                var udn = '';
                var friendly_name = '';
                var login = '';
                var image_url = '';
                var device_type = '';
                var attributeList = '';
                var pluginID = '';
                var macAddress = '';
                var firmware = '';
                var oldFirmware = false;
                if (!isRemoteEnabled) {
                    //var listItem = $(this).parent().parent();
                    listItem = $(this).closest("li");

                    udn = listItem.attr('id');
                    if ($(this).closest('li').hasClass('isSmartFramework')) {
                        friendly_name = listItem.find('h1').text();
                    } else {
                        friendly_name = listItem.attr('wemo-device-friendly-name');
                    }

                    login = listItem.attr('wemo-device-friendly-info');
                    image_url = listItem.attr('wemo-device-icon-url');
                    device_type = listItem.attr('wemo-device-type');
                    attributeList = listItem.attr('wemo-attribute-list');
                    pluginID = listItem.attr('wemo-device-plugin-id');
                    macAddress = listItem.attr('wemo-device-mac-address');
                    firmware = listItem.attr('wemo-device-firmware');
                    if (device_list.isSmartFramework(udn) && wemoUtil.isEmpty(image_url)) {
                        image_url = listItem.attr('wemo-device-fw-iconUrl');

                    }
                } else {
                    //var listItem = $(this).parent().parent(); // $(this).find(".device_li").find("[name='name_device_state']");
                    listItem = $(this).closest("li"); //$(this).parent().parent();
                    udn = listItem.attr('wemo-device-udn');
                    if ($(this).closest('li').hasClass('isSmartFramework')) {
                        friendly_name = listItem.find('h1').text();
                    } else {
                        friendly_name = listItem.attr('wemo-device-friendly-name');
                    }
                    login = listItem.attr('wemo-device-friendly-info');
                    image_url = listItem.attr('wemo-device-icon-url');
                    device_type = listItem.attr('wemo-device-type');
                    attributeList = listItem.attr('wemo-attribute-list');
                    firmware = listItem.attr('wemo-device-firmware');

                    var firmWareNumber = firmware.split(".");

                    console.log("Firmwarre " + firmWareNumber[2]);

                    if (firmWareNumber[2] == 2176 || firmWareNumber[2] == 2725) {
                        oldFirmware = true;
                    }

                    pluginID = listItem.attr('wemo-device-plugin-id');
                    macAddress = listItem.attr('wemo-device-mac-address');
                    if (listItem.hasClass('isSmartFramework') && listItem.attr('wemo-device-fw-iconurl') !== undefined) {
                        image_url = listItem.attr('wemo-device-fw-iconurl');
                    }
                }

                console.log("clicked item: " + isRemoteEnabled+" " + listItem + "  :  " + listItem.attr('id') + "  ::  " + listItem.attr('wemo-device-udn')+" udn: " + udn+ " friendly_name: " + friendly_name+" image_url: "+image_url+" device_type: "+device_type+" pluginID: "+pluginID+" macAddress: "+macAddress+" attributeList: "+attributeList+" firmware: "+firmware);



                device_list.showModal();
                setTimeout(function() {
                    if (isRemoteEnabled) {
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_MAC, macAddress);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_PLUGIN_ID, pluginID);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_TYPE, device_type);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_SSID, macAddress);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ATTRIBUTE_LIST, decodeURIComponent(attributeList));
                    } else {
                        devicePlugin.execute(function(ssid) {
                            window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_SSID, ssid);
                        }, null, actions.GET_WEMO_SSID, [udn]);
                    }

                    //if(!window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME)){
                    window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME, friendly_name);
                    //}               

                    window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL, image_url);
                    window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_UDN, udn);
                    window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_TYPE, device_type);
                    window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ATTRIBUTE_LIST, decodeURIComponent(attributeList));
                    window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_FIRMWARE, firmware);

                    devicePlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
                    device_list.hideModal();

                    if (oldFirmware) {
                        console.log("old Firmware");
                        $("#old_firmware_upgrade_popup").popup("open");
                    } else {
                        wemoUtil.loadUrl(filePath.DEVICE_LIST_EDIT);
                    }
                }, timeout.LONG);
                device_list.hideModal();
                if (device_type.indexOf('NetCam') != -1) {
                    var netCamObj = {};
                    netCamObj.ID = udn;
                    netCamObj.Type = device_type;
                    netCamObj.Name = friendly_name;
                    netCamObj.UserName = login;
                    netCamObj.MacAdd = macAddress;
                    window.sessionStorage.removeItem(sessionStore.NET_CAM_OBJ_FROM_DEVICE_LIST);
                    window.sessionStorage.setItem(sessionStore.NET_CAM_OBJ_FROM_DEVICE_LIST, JSON.stringify(netCamObj));
                }
            }

        });
        $('#old_firmware_upgrade_later').on('click', function() {

            $("#old_firmware_upgrade_popup").popup('close');

        });

        $('[name=bottom_nav_btn]').on('click', function() {
            console.log("Click on the rule on button");
            //                 Uncomment when rules tab is implemented
            var id = $(this).attr('id');
            if (id == 'device_btn') {
                $(this).addClass('device_btn_active');
                $('#rules_btn').removeClass('rules_btn_active');
                $('#rules_container').addClass('none');
                $('#device_container').removeClass('none');
            } else if (id == 'rules_btn') {
                //No need to go to rules tab when network is off
                var isNetworkenabled = window.sessionStorage.getItem("isNetworkenabledKey") !== "false";
                if (isNetworkenabled) {
                    // show firmware tune up screen, if any firmware is less than the minimum supported version
                    var is_FW_Supported = true;
                    setTimeout(
                        function(){
                            deviceTabPlugin.execute(
                                function(network_type){
                                    wemoUtil.infoLog(device_list.TAG, "network type: " + network_type)
                                    if(network_type == networkType.HOME_NETWORK){
                                       devicePlugin.execute(
                                            function(firmwareArray){
                                                is_FW_Supported = device_list.isMinSupportedFirmware(firmwareArray);

                                                if(is_FW_Supported){
                                                    device_list.gotoRules();
                                                }else{
                                                    wemoUtil.loadUrl(filePath.DEVICE_TUNE_UP);
                                                }
                                            },
                                            device_list.errorInChekingMinSupportedFW,
                                            actions.GET_CURRENT_FIRMWARE,
                                            []
                                        );
                                    }else{
                                        var firmwareArray = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.FIRMWARE_VERSION_DATA);

                                        is_FW_Supported = device_list.isMinSupportedFirmware(firmwareArray);

                                        if(is_FW_Supported){
                                            device_list.gotoRules();
                                        }else{
                                            wemoUtil.loadUrl(filePath.DEVICE_TUNE_UP);
                                        }
                                    }
                                },
                                device_list.errorInChekingMinSupportedFW,
                                actions.GET_NETWORK_TYPE,
                                []
                            );
                        },
                        timeout.LONG
                    );
                }
            }
        });

        $("[name='name_device_state']").on('click', function() {
            console.log("CLICKED ON SWITCH");

        });

        DEBUG && console.log('EDITING:SETTING UP EDITING');


        $('#modify_device').on('pointerup', function(e) {

            DEBUG && console.log('EDITING:TAPPED');
            console.log("edit tap 1" + moretabFlag);
            setTimeout(function() {
                $('.modalWindow').removeClass('isOpen');
            }, timeout.LONG);

            document.ontouchmove = function(e) {
                e.stopPropagation();
            }

            isEditMode = true;

            //Removing old insight panels
            $('#device_list_container .device_li').each(function(i, el) {
                var type = $(el).attr("wemo-device-type");
                if (type == wemoInsight.TYPE) {
                    var id = $(el).attr("id");
                    $('[id="' + id + '_stat"]').remove();
                }
            });

            $('.device_list_footer').removeClass('hidden').show();

            device_list.renderDeviceList(true, false);
            $("#question_mark_image").hide();
            $("#question_mart_text").hide();

            modifyDeviceController.activateIgnoreMode();
            $(".refresh_icon, .more_tab_icon, .modify_icon").hide();

            $("#device_btn_container").hide();
            $("#rules_btn_container").hide();
            $(".loading_animation").hide();
            $("device_list_friendly_name_container").removeClass("drawer_icon_closed drawer_icon_opened");
            $(".device_list_footer").removeClass("ui-grid-a");

            $(".done_btn").css("display", "table");
            $(".done_btn span").css("display", "table-cell");
            $(".done_btn span").css("height", "50px");
            $("#more_drawer").hide();


            $(".device_li_insight").hide().each(function() {
                //cancel auto update
                var timeout = $(this).attr('data-update-timeout');
                if (timeout != '') {
                    clearTimeout(parseInt(timeout, 10));
                    $(this).attr('data-update-timeout', '');
                }
            });


            /**********Led Related**********/

            /*$("[name='name_device_state']").removeClass().addClass('edit_device_arrow_icon');*/
            $("[name='name_group_state']").removeClass().addClass('edit_device_arrow_icon');
            $("[name='name_led_device_state']").removeClass().addClass('edit_device_arrow_icon');
            /*$("#device_list_container li").each(function () {
             $(this).addClass('editList');
             $(this).removeClass('netcam_list');
             });*/

            /**********Led Related**********/

            if (hideBottomNav) { //if the nav is hidden, show it to see the "done" button on the edit view
                $('.device_list_footer').removeClass('hidden').show();
            }
            e.preventDefault();
        });

        $('#more_remote_access').on('click', function() {
            wemoUtil.loadUrl(filePath.REMOTE_ACCESS_MORE);
        });


        $('.done_btn').on('click', function(event) {
            isEditMode = false;
            moretabFlag = false;
            
            if(isRemoteEnabled)
            	device_list.autoRefresh();

            setTimeout(function() {
                device_list.renderDeviceList(false, false);
            }, 800);

            //device_list.renderDeviceList(false, false);

            modifyDeviceController.deactivateIgnoreMode();
            $(".refresh_icon, .more_tab_icon, .modify_icon").show();
            $(".device_list_footer").addClass("ui-grid-a");

            $("#more_drawer").hide();

            $("#device_btn").addClass('device_btn_active');
            $("#device_btn_container").show();
            $("#rules_btn_container").show();
            $(".done_btn").hide();
            event.preventDefault();
            event.stopImmediatePropagation();
            $('#rules_btn').removeClass('rules_btn_active');

            if ($('#device_list_container li').length == 1 && crockpotCount == 1) {
                $('.device_list_footer').addClass('hidden').hide();
                hideBottomNav = false;


            }
            /**********Led Related**********/

            $("[name='name_device_state']").each(function() {
                $(this).removeClass().addClass($(this).attr('wemo-device-state'));
            });
            $("[name='name_led_device_state']").each(function() {
                //$(this).removeClass().addClass($(this).attr('wemo-device-state'));
            	var modelcode = $(this).attr('wemo-device-modelcode');
            	if(jQuery.inArray(modelcode.toUpperCase(), homeSensemodelcodes) != -1){
            		 if ($(this).attr('wemo-device-state-code') == statusCode.ON) {
            			 
            			 if(modelcode.toUpperCase() == homeSenseModelCodes.ALARM){
            				 $(this).removeClass().addClass("alarmDetectedIcon");
            			 }else if(modelcode.toUpperCase() == homeSenseModelCodes.KEYFOB){
            				 $(this).removeClass().removeClass("fobAwayIcon");
            				 $(this).removeClass().addClass("fobIcon");
            			 }else if(modelcode.toUpperCase() == homeSenseModelCodes.PIR){
            				 $(this).removeClass().addClass("homesense_on");
            			 }
            			
                     } else if ($(this).attr('wemo-device-state-code') == statusCode.OFF) {
                    	 if(modelcode.toUpperCase() == homeSenseModelCodes.ALARM){
            				 $(this).removeClass().removeClass("alarmDetectedIcon");
            			 }else if(modelcode.toUpperCase() == homeSenseModelCodes.KEYFOB){
            				 $(this).removeClass().removeClass("fobIcon");
            				 $(this).removeClass().addClass("fobAwayIcon");
            			 }else if(modelcode.toUpperCase() == homeSenseModelCodes.PIR){
            				 $(this).removeClass().addClass("homesense_off");
            			 }
                     }
            	}else{
            		 if ($(this).attr('wemo-device-state-code') == statusCode.ON) {
                         $(this).removeClass().addClass("led_on");
                     } else if ($(this).attr('wemo-device-state-code') == statusCode.OFF) {
                         $(this).removeClass().addClass("led_off");
                     }
            	}
               
            });
            $("[name='name_group_state']").each(function() {

	              var modelcode = $(this).attr('wemo-device-modelcode');
	              
	              if(isRemoteEnabled){
	        	    	if(modelcode && modelcode.indexOf(",")){
	                 		var modelcodeArr = modelcode.split(",");
	                 		modelcode = modelcodeArr[0];
	                 	}
	        	  }
	              
	              if(jQuery.inArray(modelcode.toUpperCase(), homeSensemodelcodes) != -1){
	         		 if ($(this).attr('wemo-device-state-code') == "1") {
	         			 if(modelcode.toUpperCase() == homeSenseModelCodes.DOORWINDOWS){
	         				 $(this).removeClass().addClass("homesense_on");
	         			 }
	         			
	                  } else if ($(this).attr('wemo-device-state-code') == statusCode.OFF) {
	                 	 if(modelcode.toUpperCase() == homeSenseModelCodes.DOORWINDOWS){
	         				 $(this).removeClass().addClass("homesense_off");
	         			 }
	                  }
	         	}else{
	         		if ($(this).attr('wemo-device-state-code') == statusCode.ON) {
	                    $(this).removeClass().addClass("led_on");
	                } else if ($(this).attr('wemo-device-state-code') == statusCode.OFF) {
	                    $(this).removeClass().addClass("led_off");
	                }
	         	}
                

            });
            $("#device_list_container li").each(function() {
                $(this).removeClass('editList');
            });

            //$("#device_list_container li[data-category='bridge']").each(function() {
            $(devicelistbridgelistitem).each(function() {

                var itemid = $(this).attr('id');
                var classname = $('#' + itemid).attr('class');
                var itemname = $(this).attr('name');

                $(this).removeClass('ui-draggable-dragging');
                $(this).removeClass('ui-draggable');
                $(this).removeClass('ui-droppable');

                console.log("classname " + classname);
                if (classname != undefined) {
                    if (classname.search('disabled') != -1) {
                        $('#' + itemid).show();
                        $(this).find("[name='name_led_device_state']").removeClass();
                        $(this).find("[name='name_group_state']").removeClass();
                    } else if (classname.search('drawerView') != -1) {} else {
                        console.log("entering in container");

                        if (itemname == "group_li") {
                            $(this).removeClass('editListGroupLeds');
                            $(this).addClass('led_group');
                            $(this).removeAttr("style");
                            $(this).find('.bulbStrength').show();
                            $(this).find('.sliderValue').show();
                        } else {
                            $(this).removeClass('editListLeds');
                            $(this).addClass('led_list');
                            $(this).removeAttr("style");
                            $(this).find('.bulbStrength').show();
                            $(this).find('.sliderValue').show();
                            $(this).draggable("destroy");
                        }
                    }
                }


            });
            
            $(devicelisthomesenselistitem).each(function() {

                var itemid = $(this).attr('id');
                var classname = $('#' + itemid).attr('class');
                var itemname = $(this).attr('name');

                $(this).removeClass('ui-draggable-dragging');
                $(this).removeClass('ui-draggable');
                $(this).removeClass('ui-droppable');

                if (classname != undefined) {
                    if (classname.search('disabled') != -1) {
                        $('#' + itemid).show();
                        $(this).find("[name='name_led_device_state']").removeClass();
                        $(this).find("[name='name_group_state']").removeClass();
                    } else if (classname.search('drawerView') != -1) {} else {
           
                        if (itemname == "group_li") {
                            $(this).removeClass('editListGroupLeds');
                            $(this).removeAttr("style");
                            $(this).find('.sliderValue').show();
                        } else {
                            $(this).removeClass('editListLeds');
                            $(this).removeAttr("style");
                            $(this).find('.sliderValue').show();
                            $(this).draggable("destroy");
                        }
                    }
                }


            });

            if ($(devicelistbridgelistitem).length > 0) {
                setTimeout(function() {
                    modifyDeviceController.show();
                    $("#question_mark_image").hide();
                    $("#question_mart_text").hide();
                }, 500);

            }
            //Changing the Bulb and Group drawer icon downward
            $(devicelistbridgelistitem).find('.iconType').each(function(i, v) {
                $(this).show();
                $(this).removeClass('drawer_icon_arrow_up').addClass('drawer_icon_arrow_down');

            });


            /**********Led Related**********/
            console.log("HTML PRINTING after edit: " + $('#device_list_bridge_container').html());

            if (hideBottomNav) { //if the nav was hide, hide it again after close the edit view
                $('#footer_id').addClass('hidden').hide();
                checkForCrockpot();
            }

            if (deviceAddedinGrp == true) {

                device_list_bridge.loadBridgeDevicesFromUpNp("");

                setTimeout(function() {
                    device_list_bridge.pushDB();
                }, 800);

                deviceAddedinGrp = false;
            }


            event.preventDefault();
        });

        $('.done_btn').on('click', function(event) {
            event.preventDefault();
        });
        $('.done_btn').on('click', function(event) {
            event.preventDefault();
        });

        $("#new_fw_available").on("tap", function() {
            wemoUtil.loadUrl(filePath.MORE_NEW_FIRMWARE);
        });

        $("#menu_fw").on("tap", function() {
            wemoUtil.loadUrl(filePath.MORE_NEW_FIRMWARE);
        });


        //New Firmware Popup initialize
        //$("#new_firmware").popup();




        $("#new_firmware").bind({
            popupafteropen: function() {
                $(".device_list_content").addClass("prevent_scroll");
            },
            popupafterclose: function() {
                $(".device_list_content").removeClass("prevent_scroll");
            }
        });

/*
        //Reload Device Popup initialize
        $("#reload_device").popup();
        //Reload Device click on yes button it clear cache
        $("#reload_device_yes_button").on("tap", function() {
            WeMoDeviceList.clear();
            device_list_bridge.clearLedCache();
            WeMoDeviceList.updateCache();
            if (isRemoteEnabled) {
                emptyDeviceList();
                device_list_bridge.reloadLedDevices();
                device_list.loadDevicesFromCloud("load");

            } else {
                device_list.updateDevicesFromUpNp(true);
                device_list_bridge.reloadLedDevices();
            }
            $("#reload_device").popup('close');
        });
        //Reload Device click on Cancel Reload Device popup close
        $("#reload_device_cancel_button").on("tap", function(e) {
            $("#reload_device").popup('close');
            e.preventDefault();
        });*/
        $('#looking_for_devices_support').on('click', function() {
            window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Help_WeMo_Discovered_Url']);
            wemoUtil.loadUrl(filePath.HELP_CENTER);
        });

        $("#weak_singnal_ok_button").on("tap", function() {
            $("#weakSignal").popup('close');
        });
        $("#question_mark_image").on('pointerdown', function() {
            window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Help_WeMo_Discovered_Url']);
            wemoUtil.loadUrl(filePath.HELP_CENTER);
        });

        $("#closemsg").on("click", function() {
            $("#bridgeunavailable").hide();
        });
    },
    newFirmwarePopup: function() {

        if ($('.newFirmwarePopup').length === 0) {

            var $nf = $("#new_firmware").html();
            var $newElement = $('<div class="newFirmwarePopup">');
            var $theBackground = $('<div class="theBackground">');
            var $thePopup = $('<div class="thePopup">');

            $thePopup.append($nf);
            $newElement.append($thePopup).append($theBackground);
            //New Firmware click on yes button it should update
            $newElement.find("#new_firmware_yes_button").on("tap", function() {
                wemoUtil.loadUrl(filePath.MORE_NEW_FIRMWARE);
            });

            //New Firmware click on Not now New Firmware popup close
            $newElement.find("#new_firmware_not_now_button").on("click", function(e) {
                $newElement.remove();
                e.preventDefault();
            });

            $newElement.find(".theBackground").on("click", function(e) {
                $newElement.empty().remove();
                e.preventDefault();
            });

            $('body').append($newElement);
        }
    },
    /*refreshPopup: function() {
        if (reload_counter == 0) {
            start_timer = new Date().getTime();
        }
        reload_counter++;
        reload_timer = new Date().getTime();
        if (isRemoteEnabled) {
            setTimeout(function() {
                nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
            }, timeout.REMOTE_REFRESH_TIMEOUT);
        }
        console.log("reload_counter is :: " + (reload_counter - 1) + " :: DIFF is:: " + (reload_timer - start_timer));
        if ((reload_timer - start_timer) <= (reloadDeviceList.MAX_RELOAD_TIMER * 1000)) {
            if (reload_counter >= reloadDeviceList.MAX_REFRESH_CLICKS) {
                //Reload Device Popup Open
                nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                $("#reload_device").popup("open");
                reload_counter = 0;
                reload_timer = 0;
                start_timer = 0;
            }
        } else {
            reload_counter = 0;
            reload_timer = 0;
            start_timer = 0;
        }
    },*/

    closeAllInsightDrawers: function() {
        $('.device_li_insight').each(function() {
            var timeout = $(this).attr('data-update-timeout');
            if (timeout != '') {
                clearTimeout(parseInt(timeout, 10));
                $(this).attr('data-update-timeout', '');
            }
            $(this).slideUp('slow');
        });

        $('.drawer_icon_opened').removeClass("drawer_icon_opened").addClass("drawer_icon_closed");
    },
    /**
     * closes any open insight drawers when opening a drawer from a smart framework device - does hide instead of slideup so calculation is correct.
     */
    closeAllInsightDrawersFromSmartFramework: function() {
        $('.device_li_insight').each(function() {
            var timeout = $(this).attr('data-update-timeout');
            if (timeout != '') {
                clearTimeout(parseInt(timeout, 10));
                $(this).attr('data-update-timeout', '');
            }
            $(this).hide();
        });

        $('.drawer_icon_opened').removeClass("drawer_icon_opened").addClass("drawer_icon_closed");
    },

    getRemoteDetailsAndAutoEnable: function() {
        devicePlugin.execute(
        		function(responseAry) {
        			remoteHomeId = responseAry[3];
        			DEBUG && wemoUtil.infoLog(device_list.TAG, 'getRemoteDetailsAndAutoEnable remoteHomeId: '+remoteHomeId+" responseAry: "+responseAry+ ", initial_run:" + window.sessionStorage.getItem("initial_run")+" isRemoteEnabled: "+isRemoteEnabled);
        			if (!isRemoteEnabled)
        			{
        				if (window.sessionStorage.getItem("initial_run") == '1' && remoteHomeId == "") {
        					window.sessionStorage.setItem("initial_run", '0');
        					/**********UI is blocked because of the below call*******/

        					setTimeout(function() {
        						remoteAccessUtils.enableRemoteAccess();
        					}, timeout.ENABLE_REMOTE_ACCESS_DELAY);

        				} 
        			}

        		},
            null,
            actions.GET_REMOTE_ACCESS, []
        );
    },
    gotoRules: function() {
        //Addded by ashish for notofication after rule create
        if (!isRemoteEnabled) {
            deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
        } else {
            clearTimeout(cloudDeviceListAutoRefreshTimeout);
            clearTimeout(cloudDeviceListTimeout);
            wemoUtil.storeRemoteValue();
        }

        var devices = WeMoDeviceList._deviceList;
        $.each(devices, function(udn) {
            if (devices[udn].inactive == true) delete devices[udn];
        });
        wemoUtil.setJSONObjectToSessionStorage(sessionStore.LOCAL_DEVICE_LIST, devices);
        setTimeout(wemoUtil.DBInitialize(), 5000);
        //setTimeout(wemoUtil.backupRestoreRulesDevice(), 11000);
    },

    bindEvents: function() {
        console.log(TAG + "bindEvents");
        document.addEventListener('online', device_list.onOnline, false);
        document.addEventListener('offline', device_list.onOffline, false);
        document.addEventListener("menubutton", device_list.onMenuBtnPress, false);
        document.addEventListener("backbutton", device_list.onBackPress, false);
        document.addEventListener("pause", device_list.onPause, false);
        document.addEventListener("resume", device_list.onResume, false);
    },

    onOffline: function() {
        console.log(TAG + "offLine");
        deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
    },

    onOnline: function() {
        console.log(TAG + "onLine");
    },

    onMenuBtnPress: function() {
        if(MORE_MENU_PAGE) {
            wemoUtil.setPreviousUrl(window.location.href);
            wemoUtil.loadUrl(filePath.MORE_MENU);
        } else {
            var $moreTab = $('.more_tab');
            // var $modalWindow = $('<div />');
            var $modalWindow = $('.modalWindow');

            //see if the menu is open
            if (!$moreTab.hasClass('isOpen')) {
                $moreTab.show();

                $moreTab.addClass('isOpen');
                $modalWindow.trigger('open');
                document.ontouchmove = function(e) {
                    e.preventDefault();
                }
            } else {
                $moreTab.removeClass('isOpen');
                $moreTab.hide();
                moretabFlag = false;
                document.ontouchmove = function(e) {
                    e.stopPropagation();
                }
            }
        }
    },

    onBackPress: function() {

        $('.modalWindow').removeClass('isOpen')


        if (_.size(window.backButtonCommands) === 0) { //smart framework scripts/android.js
            if ($("#more_drawer").is(":visible")) {
                $("#more_drawer").hide();
                moretabFlag = false;

                $(this).removeClass('isOpen');

            } else {
                console.log(TAG + "onBackPress");
                if(window.sessionStorage.getItem(sessionStore.IS_COLOR_TEMP_PICKER) === "true"){
                	device_list_bridge.closeColorTempPopUp();
                }
                else{
                //navigator.app.clearHistory();
                if (!isRemoteEnabled) {
                    clearTimeout(firmwareCheckTimeout);
                    deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
                    //deviceTabPlugin.execute(null, null, actions.STOP_CONTROL_POINT, []);
                }

                $('li[data-update-timeout]').each(function() {
                    if ($(this).attr('data-update-timeout')) {
                        var panel = $(this);
                        var timeout = panel.attr('data-update-timeout');
                        clearTimeout(parseInt(timeout, 10));
                        panel.attr('data-update-timeout', '');
                    }
                });


                clearTimeout(cloudDeviceListAutoRefreshTimeout);
                clearTimeout(cloudDeviceListTimeout);
                setTimeout(function() {
                    navigator.app.exitApp();
                }, 200);
                }
            }
        }
    },

    onPause: function() {
        disableNetworkWatchdog = true;
        console.log(TAG + "onPause nwcheck: " + disableNetworkWatchdog);
        nativeUtilPlugin.execute(
            device_list.setNetworkTypeOnPause,
            device_list.reportError,
            actions.GET_NETWORK_TYPE_NEW, []
        );
        if (!isRemoteEnabled) {
            clearTimeout(firmwareCheckTimeout);
            deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
        } else {
            clearTimeout(cloudDeviceListAutoRefreshTimeout);
            clearTimeout(cloudDeviceListTimeout);
        }
        window.devicelistEvents.emit('closeSmartDrawer');

        // navigator.app.exitApp();
    },

    onResume: function() {
    	window.devicelistEvents.emit('onAppResume');  
        //networkWatchDog.last_state = '0';
        console.log(TAG + "onResume");
        /* network may have changed */
        device_list.getNetworkTypeOnResume();
    },

    /* get network type when app goes to background/foreground */
    getNetworkTypeOnResume: function() {
        nativeUtilPlugin.execute(
            device_list.processNetworkTypeOnResume,
            device_list.reportError,
            actions.GET_NETWORK_TYPE_NEW, []
        );
    },
    setNetworkTypeOnPause: function(type) {
        pauseNetworkType = type;
    },
    /* Process network change when app goes to background/foreground */
    processNetworkTypeOnResume: function(type) {
        switch (type) {
            case networkType.REMOTE_WIFI:
            case networkType.REMOTE_MOBILE:
                console.log(TAG + "processNetworkTypeOnResume:remote");
                if (pauseNetworkType == type) {
                    console.log(TAG + "processNetworkTypeOnResume returning as same network type on pause pauseNetworkType: " + pauseNetworkType + " isRemoteEnabled: " + isRemoteEnabled);
                    device_list.loadDevicesFromCloud("load");
                    if (!window.sessionStorage.getItem(sessionStore.FIRMWARE_AVAILABLE)) {
                        setTimeout(function() {
                            device_list.getCloudFirmwareVersion(device_array);
                        }, timeout.FIRMWARE_CHECK);
                    }
                    device_list.autoRefresh();
                } else {
                    isRemoteEnabled = true;
                    window.sessionStorage.setItem(sessionStore.REMOTE_MODE, true);
                    wemoUtil.loadUrl(filePath.INDEX);
                }

                break;
            case networkType.HOME_NETWORK:
                console.log(TAG + "processNetworkTypeOnResume:home");
                wasRemoteEnabled = isRemoteEnabled;
                isRemoteEnabled = false;
                device_list.registerListeners();
                counterCall = 0;
                BridgeCall = 0;
                window.sessionStorage.setItem(sessionStore.REMOTE_MODE, false);
                device_list.updateDevicesFromUpNp(false);

                if (!window.sessionStorage.getItem(sessionStore.FIRMWARE_AVAILABLE)) {
                    device_list.getLocalFirmwareVersion();
                }
                if (wasRemoteEnabled) {
                	wemoUtil.loadUrl(filePath.INDEX);
                }else {
                	device_list.checkARPBasedCache();
                }
                break;
            case networkType.WEMO:
                console.log(TAG + "processNetworkTypeOnResume:wemo");
                isRemoteEnabled = false;
                wemoUtil.loadUrl(filePath.INDEX);
                break;
            case networkType.NET_CAM:
                console.log(TAG + "processNetworkTypeOnResume:netcam");
                isRemoteEnabled = false;
                wemoUtil.loadUrl(filePath.NET_CAM_GET_IT_NOW);
                break;
            case networkType.NO_NETWORK:
                console.log(TAG + "processNetworkTypeOnResume:no network");
                isRemoteEnabled = false;
                break;
            default:
                console.log(TAG + "processNetworkTypeOnResume:default");
                isRemoteEnabled = false;
                break;
        }
    },

    reportError: function(e) {
        console.log(TAG + "Plugin Failure Call back!!!!   " + e);
    },

    playStoreRedirect: function(apppkg) {
        console.log("playStoreRedirect");
        nativeUtilPlugin.execute(null, null, actions.SHOW_SPLASH_ON_LOADING, []);
        deviceTabPlugin.execute(
            function(value) {
                console.log("actions.CHECK_NET_CAM:  " + value);

                var item = playStoreRedirectVal;
                var idval = "";
                if (isRemoteEnabled) {
                    idval = item.attr('wemo-device-mac-address');
                } else
                    idval = item.attr('ID');

                var netCamObj = {};
                netCamObj.ID = idval;
                netCamObj.MacAdd = idval;
                netCamObj.isRemoteEnabled = isRemoteEnabled;
                netCamObj.Type = item.attr('wemo-device-type');
                netCamObj.Name = item.attr('wemo-device-friendly-name');
                netCamObj.UserName = item.attr('wemo-device-friendly-info');

                if (value) {
                    nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                    setTimeout(function() {
                        deviceTabPlugin.execute(
                            function(value) {
                                if (window.startapp != undefined) {
                                    window.startapp.start({
                                            android: apppkg
                                        },
                                        function() {}, device_list.reportError()
                                    );
                                }
                            },
                            device_list.reportError,
                            actions.LAUNCH_NET_CAM_APP, [item.attr('wemo-device-friendly-info'), idval, 1]
                        );
                    }, 300);
                } else {
                    console.log("NET_CAM - False - ");
                    console.log("Redirect to - " + filePath.NET_CAM_GET_IT_NOW);
                    if (!isRemoteEnabled) {
                        deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
                    } else {
                        clearTimeout(cloudDeviceListAutoRefreshTimeout);
                        clearTimeout(cloudDeviceListTimeout);
                    }
                    window.sessionStorage.removeItem(sessionStore.NET_CAM_OBJ_FROM_DEVICE_LIST);
                    window.sessionStorage.setItem(sessionStore.NET_CAM_OBJ_FROM_DEVICE_LIST, JSON.stringify(netCamObj));
                    wemoUtil.loadUrl(filePath.NET_CAM_GET_IT_NOW);
                }
            },
            device_list.reportError,
            actions.CHECK_NET_CAM, []
        );
    },

    initializeDOMElements: function() {
        wemoUtil.infoLog(device_list.TAG, 'initializeDOMElements');
        device_list.deviceListContainer = $('#device_list_container');
    },

    setupDOMListeners: function() {
        wemoUtil.infoLog(device_list.TAG, 'setupDOMListeners');
        (device_list.deviceListContainer).bind("DOMSubtreeModified", device_list.deviceListContainerChange);

    },

    setBinaryState: function(udn, state) {
        deviceTabPlugin.execute(
            function(value) {
                device_list.changeValues(value);
            },
            function(error) {
            },
            actions.SET_DEVICE_STATE, [udn, state]
        );
    },

    showModal: function() {
        //        navigator.notification.activityStart("", wemo.items['Devices_LookingForDevices']);
        nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
        /* $("body").append('<div id="mask" class="modalWindow"/>');

         $.mobile.showPageLoadingMsg("a", wemo.items['Devices_LookingForDevices']);*/
    },

    hideModal: function() {
        //        navigator.notification.activityStop();
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);

        /*$("#mask").remove();
         $.mobile.hidePageLoadingMsg();*/

        /*
         * Check the Signal of the plug-in.
         * */
        device_list.checkWeakSignal();
    },

    updateDevicesFromUpNp: function(refresh) {

        var dfd = $.Deferred();

        WeMoDeviceList.setCacheAll();
      //  device_list.renderDeviceList(false, refresh);

        setTimeout(function() {
            deviceTabPlugin.execute(function(deviceList) {
                console.log("DEVICE LIST: updateDevicesFromUpNp" + JSON.stringify(deviceList) + "---" + isBridgeFlag);

                var devicelistArr = JSON.stringify(deviceList);
                var tempstr = deviceList['deviceUdnList'];

                if (tempstr != undefined && tempstr != "") {
                    var n = tempstr.search("Bridge");
                    if (n == -1 && isBridgeFlag == true) {
                        console.log("bridge avaliability show1");

                        setTimeout(function() {
                            $("#bridgeunavailable").show();
                        }, 500);

                    } else {
                        console.log("bridge avaliability hide1");
                        $("#bridgeunavailable").hide();
                    }
                }else if(isBridgeFlag == true && (tempstr == undefined || tempstr == "")){
                	$("#bridgeunavailable").show();
                }

            }, device_list.reportError, actions.UPDATE_WEMO_DEVICE_LIST, []);
            dfd.resolve();
        }, 100);

        return dfd;
    },

    loadDevicesFromUpNp: function() {
        console.log("loadDevicesFromUpNp START_DEVICE_DISCOVERY");
        device_list.registerListeners();
        setTimeout(function() {
            deviceTabPlugin.execute(function(deviceList) {
                console.log("DEVICE LIST: loadDevicesFromUpNp" + JSON.stringify(deviceList));
                if (deviceList != undefined) {
                    device_list.processJSONDeviceList(deviceList, false);
                }
            }, device_list.reportError, actions.GET_WEMO_DEVICE_LIST, []);
        }, 100);


    },

    loadDevicesFromUpNpCache: function() {
        console.log("loadDevicesFromUpNpCache START_DEVICE_DISCOVERY");
        setTimeout(function() {
            deviceTabPlugin.execute(function(deviceList) {
                if (deviceList != undefined) {
                    device_list.processJSONDeviceList(deviceList, true);
                }
            }, device_list.reportError, actions.GET_WEMO_DEVICE_CACHE, []);
        }, 400);


    },


    processJSONDeviceList: function(deviceList, cached) {
        DEBUG && console.log('DEVICE LIST:processJSONDeviceList:' + JSON.stringify(deviceList));
        var devCounter = 0;
        for (var udn in deviceList) {
            try {
                devCounter++;
                console.log(udn);
                var message = deviceList[udn];
                var tmpDevice = new WeMoDevice(message.udn, message.type, message.friendlyName, message.iconUrl, message.state, cached, 0, message.attributeList, message.modelName, message.customizedState, message.macAddress);
                console.log(JSON.stringify(tmpDevice));
                WeMoDeviceList.addDevice(tmpDevice.udn, tmpDevice);
            } catch (err) {
                console.log("Device List Load error: " + err.message);
            }
        }
        device_list.renderDeviceList(false, false);
    },

    setDeviceInactive: function(udn) {
        WeMoDeviceList.setInactive(udn);
        var tmpDevice = WeMoDeviceList.getDevice(udn);

        if (tmpDevice) {
            if ($('.device_li[wemo-device-udn="' + udn + '"]').length) {
                WeMoDeviceUtils.getHtmlForItem(tmpDevice, isEditMode, true, null, device_list.updateIconCallback).then(function(resp) {
                    $('.device_li[wemo-device-udn="' + udn + '"]').replaceWith(resp.el);
                    device_list.updateElementPosition();
                });

            }
            device_list.bindItemEvents();
        }
        if (WeMoDeviceList.getCountActiveDevices() > 0) modifyDeviceController.show();
        else modifyDeviceController.hide();
    },

    updateDevice: function(data) {
        var responseXML = (new XMLSerializer()).serializeToString(data);
        wemoUtil.log(TAG, 'updateDevice:' + responseXML);
        $(data).find('plugin').each(function() {
            var device_status = $(this).find("status").text();
            var device_mac_address = $(this).find("macAddress").text();
            var device_attributelist = $(this).find("attributeLists").text();
            if (device_attributelist != undefined) {
                $(this).find('attribute').each(function(i) {
                    var name = $(this).find("name").text();
                    if (name == "Switch") {
                        device_status = $(this).find("value").text();
                    }
                });
            }
            var tmpDev = WeMoDeviceList.getDeviceByMac(device_mac_address);
            WeMoDeviceList.updateState(tmpDev.udn, device_status);
            device_list.renderDeviceList(isEditMode, false);
            device_list.bindItemEvents();
        });
    },

    startWheelAnimation: function(udn) {
        if (!isEditMode) {
            var tmpDevice = WeMoDeviceList.getDevice(udn);

            if (tmpDevice) {
                if ($('.device_li[wemo-device-udn="' + udn + '"]').length) {
                    WeMoDeviceUtils.getHtmlForItem(tmpDevice, false, true, null, device_list.updateIconCallback).then(function(resp) {
                        if (!resp.isSmartDevice) $('.device_li[wemo-device-udn="' + udn + '"]').replaceWith(resp.el);
                        device_list.updateElementPosition();
                    });

                }

                if (tmpDevice.type == wemoDeviceType.INSIGHT || tmpDevice.type == wemoInsight.REMOTE_TYPE ||
                    tmpDevice.type == wemoDeviceType.SWITCH || tmpDevice.type == wemoSwitch.REMOTE_TYPE ||
                    tmpDevice.type == wemoLightSwitch.TYPE || tmpDevice.type == wemoLightSwitch.REMOTE_TYPE ||
                    tmpDevice.type == wemoMaker.TYPE || tmpDevice.type == wemoMaker.REMOTE_TYPE) {
                    $('.loading_animation[wemo-device-udn="' + udn + '"]').html("<div class='loading_spinner'></div>");
                } else {
                    $('.loading_animation[wemo-device-udn="' + udn + '"]').html("<img src='../img/power_button/loader.gif'>").css("margin-top", "13px");
                }
            }
        }
    },

    startFwAnimation: function(udn) {
        console.log("get_firmware_message :: startFwAnimation :: udn is ::" + udn);
        $('.loading_animation[wemo-device-udn="' + udn + '"]').html("<img src='../img/power_button/loader.gif'>").css("margin-top", "23px");
    },

    stopWheelAnimation: function(udn) {
        if (!isEditMode) {
            var tmpDevice = WeMoDeviceList.getDevice(udn);

            if (tmpDevice) {
                if ($('.device_li[wemo-device-udn="' + udn + '"]').length) {
                    WeMoDeviceUtils.getHtmlForItem(tmpDevice, false, false, null, device_list.updateIconCallback).then(function(resp) {
                        if (!resp.isSmartDevice) $('.device_li[wemo-device-udn="' + udn + '"]').replaceWith(resp.el);
                        device_list.updateElementPosition();
                    });

                }
            }
        }
    },

    updateDeviceItem: function(udn) {

        if ($('.device_li[wemo-device-udn="' + udn + '"]').length && WeMoDeviceList.haveDevice(udn)) {
            var dev = WeMoDeviceList.getDevice(udn);
            dev.inactive = false;
            WeMoDeviceUtils.getHtmlForItem(dev, isEditMode, false, false, device_list.updateIconCallback).then(function(resp) {
                if (!resp.isSmartDevice) {
                    console.log(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN));
                    if (window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN) === udn) {
                        $('.device_li[wemo-device-udn="' + udn + '"]').attr('wemo-device-friendly-name', window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME));
                    }
                    $('.device_li[wemo-device-udn="' + udn + '"]').replaceWith(resp.el);
                    device_list.updateElementPosition();
                    device_list.bindItemEvents();
                }

            });
        } else {
            device_list.renderDeviceList(isEditMode, false);
        }

    },
    
    updateIconUrlInDeviceTile: function (udn, icon) {
        var key = 'wemo-device-icon-url';
        var el = document.getElementById(udn);
        if(!wemoUtil.isEmpty(el) && el.hasAttribute(key)) {
            if (wemoUtil.isEmpty(el.getAttribute(key))){
                el.setAttribute(key, icon);
            }
        }
    },

    updateIconCallback: function(udn, icon) {
        if ($('img[wemo-device-udn="' + udn + '"]').length) {
            $('img[wemo-device-udn="' + udn + '"]').attr('src', icon);
        }
        device_list.updateElementPosition();
        device_list.updateIconUrlInDeviceTile(udn, icon);
    },


    renderDeviceList: function(edit, refresh) {

        emptyDeviceList();
        //setContentHeight(crockpotCount);

         console.log('RenderDeviceList cached: edit ' + edit+' refresh ' + refresh);

        /*if((edit == false && refresh == false) || (edit == undefined && refresh == undefined)){
         isCached = true;
         }*/

        //device_list.updateElementPosition();
        $container = $('#device_list_container');

        var customizedOrderDL = window.sessionStorage.getItem(sessionStore.ORDER_DEVICE_LIST);
        console.log("renderDeviceList - Order Device List from SharedPreferences:  " + JSON.stringify(customizedOrderDL));
        if (customizedOrderDL) {
            var devList = WeMoDeviceList.sortByCustomizedOrder(customizedOrderDL);
        } else {
            var devList = WeMoDeviceList.sortByName();
        }
        //        if(devList == undefined && devList == null && devList.length == 0){
        $("#question_mark_image").show();
        $("#question_mart_text").show();
        //        }
        order = 0;
        console.log(" devList " + JSON.stringify(devList));
        for (var udn in devList) {
            var searchType = udn.search("Bridge");

            if ((searchType == -1 || searchType == false) && udn != "") {
                var tmpDevice = WeMoDeviceList.getDevice(udn);

                if (!(tmpDevice.inactive && edit)) {
                    tmpDevice.order = order;
                    var sensorsTimestamp = device_list.arrTimestampForRemote[udn];
                    var resp = WeMoDeviceUtils.getHtmlForItem(tmpDevice, edit, false, sensorsTimestamp, device_list.updateIconCallback).then(function(resp) {
                        $container.append(resp.el);
                        if (resp.sandbox && edit) {
                            //send the editing event
                            isEditing = true;
                            window.devicelistEvents.emit('isEditing', true);
                        } else if (resp.sandbox && !refresh && !edit && isEditing) {
                            isEditing = false;
                            window.devicelistEvents.emit('isEditing', false);
                        } else if (resp.sandbox && refresh && edit) {
                            isEditing = true;
                            window.devicelistEvents.emit('fetch' + udn);
                        }



                        if (isRemoteEnabled) {
                            if (isEditMode == false) {
                            
                                var ledDevicesCount = $('#device_list_bridge_container').find('li').length;
                                var devicesCount = $container.find('li').length;
                                var totalDevicesCount = parseInt(ledDevicesCount) + parseInt(devicesCount);
                                if (JardenRemoteCount == totalDevicesCount) {
                                    $('.device_list_footer').addClass('hidden').hide();
                                    hideBottomNav = true;
                                } else {
                                    $('.device_list_footer').removeClass('hidden').show();
                                    hideBottomNav = false;
                                }

                            }
                        }

                        adjustContentHeight();

                        $("#question_mark_image").hide();
                        $("#question_mart_text").hide();

                    });

                    if (tmpDevice.cached) {
                        WeMoDeviceList.startAnimationTimeout(udn, refresh);
                    }

                    if (!edit) {
                        if (tmpDevice.type == wemoInsight.TYPE || tmpDevice.type == wemoInsight.REMOTE_TYPE) {
                            $('span[id="' + udn + '-drawer_icon"]').attr('style', function(i, s) {
                                return s + 'display: block !important;'
                            });

                            var insight = $('#device_list_container li[wemo-device-udn="' + udn + '"]');

                            insight_id = $.trim(insight.attr('id'));
                            $listItemInsight = $('<li class="device_li_insight" id="' + insight_id + '_stat"></li>');

                            $listItemInsight.load('../device/insight_stat_panel.html', function() {
                                var $panel = $('[id="' + insight_id + '_stat"]');
                                //set DOM remove event handler to cancel auto update when panel in removed from DOM
                                $panel.on('DOMNodeRemovedFromDocument', function() {
                                    var timeout = $panel.attr('data-update-timeout');
                                    if (timeout != '') {
                                        clearTimeout(parseInt(timeout, 10));
                                    }
                                });


                            });
                            insight.after($listItemInsight);
                            device_list.closeAllInsightDrawersFromSmartFramework();
                        }

                        if (WeMoDeviceList.getCountActiveDevices() > 0) {
                            modifyDeviceController.show();
                            $("#question_mark_image").hide();
                            $("#question_mart_text").hide();
                        } else modifyDeviceController.hide();
                    }


                    isDeviceAvailable = true;
                    device_list.updateElementPosition();
                    device_list.bindItemEvents();
                    setContentHeight(crockpotCount, false); //^^^^^


                }
            } //if close
            else {
            	
            	$("#question_mark_image").hide();
                $("#question_mart_text").hide();
                
                if (!edit) {

                    adjustContentHeight();
                    isDeviceAvailable = true;

                    if (window.sessionStorage.getItem(sessionStore.IS_UPGRADE_INPROGRESS) == "true" && !isRemoteEnabled) {
                        var tmpDevice = WeMoDeviceList.getDevice(udn);
                        console.log("tmpDevice.fwstatus " + tmpDevice.fwstatus);

                        if (tmpDevice.fwstatus != firmwareMessagingEnum.FOUR && tmpDevice.fwstatus != "") {
                            var msg = device_list.firmwareUpgradeMessageRemote(tmpDevice.fwstatus);

                            if (tmpDevice.fwstatus == firmwareMessagingEnum.THREE) {
                                $("ul li[data-category='bridge']").each(function() {

                                    var itemid = $(this).attr('id');

                                    console.log("entering in bridge fimrware status if enter::" + itemid);

                                    $("[name='name_group_state']").removeClass().addClass('led_value_loading');
                                    $("[name='name_led_device_state']").removeClass().addClass('led_value_loading');
                                });

                            }

                            $("ul li[data-category='bridge']").find('.sliderValue').text(msg);
                            $("ul li[data-category='bridge']").find('.sliderValue').addClass('firmwareMsg');
                            $("ul li[data-category='bridge']").find('.iconType').hide();

                        }

                    }

                    if (BridgeCall == 0 && !isRemoteEnabled) {
                        $("#find_and_pair_Newdevice").show();
                        window.sessionStorage.setItem(sessionStore.IS_BRIDGE_PRESENT, true);
                        BridgeCall++;
                        isBridgeFlag = true;
                        device_list_bridge.loadBridgeDevicesFromUpNp();
                        setContentHeight(crockpotCount, false); //^^^^^

                    }
                    //device_list_bridge.loadBridgeDevicesFromUpNp("load");
                }
            }

            order++;

        }
    },

    controlInactiveDevice: {
        cancel: function(e) {
            wemoUtil.infoLog(device_list.TAG, 'controlInactiveDevice.cancel');
            $("#hide_device").popup('close');
            e.preventDefault();
            e.stopPropagation();
        },
        hide: function(e) {
            wemoUtil.infoLog(device_list.TAG, 'controlInactiveDevice.hide');
            var udn = $(this).attr('wemo-device-udn');
            $('.device_li[wemo-device-udn="' + udn + '"]').remove();
            $("#hide_device").popup('close');
            if (device_list.remoteAccess.isEnabled) {
                if (udn.indexOf("uuid") == -1) {
                    cloudServices.hideDevice(udn);
                } else {
                    var mac = WeMoDeviceList.getDevice(udn).mac;
                    cloudServices.hideDevice(mac);
                    WeMoDeviceList.removeDevice(udn);
                }
            } else {
                if (udn.indexOf("uuid") == -1) {
                    device_list_bridge.deleteLedFromCache(udn);
                }
                WeMoDeviceList.removeDevice(udn);
            }
            e.preventDefault();
            e.stopPropagation();
        }
    },
    
    bindItemEvents: function() {
        wemoUtil.infoLog(device_list.TAG, 'bindItemEvents');
        
        device_list.remoteAccess.initialize();
        device_list.remoteAccess.checkStatus();
        
        $('.device_li').off('tap');
        $('.device_li, .device_li > span').on('tap', function(e) {
            if (!isEditMode) {
                var type = $(this).attr('wemo-device-type');
                playStoreRedirectVal = $(this);
                var apppkg = '';
                if (type == wemoNetCam.TYPE || type == wemoNetCam.REMOTE_TYPE || type == wemoNetCamHDv1.REMOTE_TYPE || type == wemoNetCamHDv2.REMOTE_TYPE) {
                    apppkg = 'com.belkin.android.androidbelkinnetcam';
                    device_list.playStoreRedirect(apppkg);
                } else if (type == wemoLinkCam.TYPE || type == wemoLinkCam.REMOTE_TYPE) {
                    apppkg = 'com.seedonk.android.androidlinksyscam';
                    device_list.playStoreRedirect(apppkg);
                }
            }
            e.preventDefault();
        });
        try {
            $('.device_state').off('tap');
            $('.device_state').on('tap', function(e) {
                var udn = $(this).attr('wemo-device-udn');
                var switchPrevState = $(this).attr('wemo-device-state');
                var listItem = $(this).parent().parent();
                var attributelist = listItem.attr('wemo-attribute-list');
                var type = listItem.attr('wemo-device-type');
                console.log("type: " + type);
                if (type == wemoMaker.TYPE || type == wemoMaker.REMOTE_TYPE) {
                    var attributeListJson = '';
                    if (isRemoteEnabled) {
                        device_list.startWheelAnimation(udn);
                        if (switchPrevState == deviceStates.OFF) {
                            $(this).removeClass('switch_off');
                            $(this).addClass('switch_activated');
                            attributeListJson = device_list.buildAttributeListXml(deviceStates.ON);
                            var tmpDev = WeMoDeviceList.getDevice(udn);
                            cloudServices.changeDeviceStateForMaker(tmpDev, deviceStates.ON, attributeListJson, device_list.updateDevice, null);

                        } else if (switchPrevState == deviceStates.ON || switchPrevState == deviceStates.STANDBY) {
                            $(this).removeClass('switch_on');
                            $(this).addClass('switch_activated');
                            attributeListJson = device_list.buildAttributeListXml(deviceStates.OFF);
                            var tmpDev = WeMoDeviceList.getDevice(udn);
                            cloudServices.changeDeviceStateForMaker(tmpDev, deviceStates.OFF, attributeListJson, device_list.updateDevice, null);
                        }
                    } else {
                        device_list.startWheelAnimation(udn);
                        attributelist = decodeURIComponent(attributelist);
                        attributelist = JSON.parse(attributelist);
                        var switchType;
                        if (attributelist.SwitchMode != undefined)
                            switchType = attributelist.SwitchMode.value;
                        else
                            switchType = "0";

                        if (switchType == 1) {
                            console.log("momentary_sign" + udn);
                            window.sessionStorage.setItem("momentary_sign" + udn, "1");

                        }
                        attributeList = '{"Switch":"null","Sensor":"null","SwitchMode":"null","SensorPresent":"null"}';
                        var attributeJson = JSON.parse(attributeList);
                        if (switchPrevState == deviceStates.OFF) {
                            $(this).removeClass('switch_off');
                            $(this).addClass('switch_activated');
                            attributeJson['Switch'] = deviceStates.ON;
                            device_list.setAttributes(udn, attributeJson);
                        } else if (switchPrevState == deviceStates.ON || switchPrevState == deviceStates.STANDBY) {
                            $(this).removeClass('switch_on');
                            $(this).addClass('switch_activated');
                            attributeJson['Switch'] = deviceStates.OFF;
                            device_list.setAttributes(udn, attributeJson);
                        }
                    }
                } else {
                    if (isRemoteEnabled) {
                        var tmpDev = WeMoDeviceList.getDevice(udn);
                        device_list.startWheelAnimation(udn);
                        if (switchPrevState == deviceStates.OFF) {
                            $(this).removeClass('switch_off');
                            $(this).addClass('switch_activated');
                            cloudServices.changeDeviceState(tmpDev, deviceStates.ON, device_list.updateDevice);
                        } else {
                            $(this).removeClass('switch_on');
                            $(this).addClass('switch_activated');
                            cloudServices.changeDeviceState(tmpDev, deviceStates.OFF, device_list.updateDevice);
                        }
                    } else {
                        device_list.startWheelAnimation(udn);
                        if (switchPrevState == deviceStates.OFF) {
                            $(this).removeClass('switch_off');
                            $(this).addClass('switch_activated');
                            device_list.setBinaryState(udn, deviceStates.ON);
                        } else if (switchPrevState == deviceStates.ON || switchPrevState == deviceStates.STANDBY) {
                            $(this).removeClass('switch_on');
                            $(this).addClass('switch_activated');
                            device_list.setBinaryState(udn, deviceStates.OFF);
                        }
                    }
                }
                e.stopPropagation();
                e.preventDefault();
            });
        } catch (e) {
            console.log("error: " + typeof($('.device_state')));
        }

        /*
        var wemo_light = $("#wemo_light").height();
        var header_id = $("#header_id").height();
        var footer_id = $("#footer_id").height();
        var heightQues = wemo_light - header_id - footer_id - 44 - 83;
        $("#device_list_container").css('height', heightQues + 'px !important');
        */
        //if ($('#device_list_container li').length > 0 && $("#device_list_container li[data-category='bridge']").length == 0) {
        if ($('#device_list_container li').length > 0 && $("#device_list_container li[data-category='bridge']") == 0 && $('#group_list_bridge_container li') == 0) {

            var wemo_light = $("#wemo_light").height();
            var header_id = $("#header_id").height();
            var footer_id = $("#footer_id").height();
            var heightQues = wemo_light - header_id - footer_id - 44 - 83;
            $("#device_list_container").css('height', heightQues + 'px !important');

        }


        $(".disabled").off('tap');
        $(".disabled").on('tap', function(e) {
            var $this = $(this);
            var widget = $this.attr('data-aura-widget');

            if (!widget && !$this.hasClass('inMotion')) {
                var udn = $(this).attr('wemo-device-udn');
                DEBUG && console.log('DISABLED:UDN:' + udn);

                $("#hide_device").popup("open");
                $('#hide_device_hide').attr('wemo-device-udn', udn);

                $('#hide_device_cnl').off('tap');
                $('#hide_device_hide').off('tap');

                $("#hide_device_cnl").on("click", device_list.controlInactiveDevice.cancel);
                $("#hide_device_hide").on("click", device_list.controlInactiveDevice.hide);
            }

            e.preventDefault();
            e.stopPropagation();
        });
    },

    initializeSorter: function() {
        $("#device_list_container").sortable({
            handle: '.edit_device_dots',
            opacity: 0.8,
            axis: 'y',
            stop: function(event, ui) {
                var _id = ui.item.attr("id");
                var _fname = ui.item.attr("wemo-device-friendly-name");
                var _type = ui.item.attr("wemo-device-type");

                console.log(ui.item.index() + " udn: " + _id + " fname: " + _fname + " type: " + _type);

                /***Saving the order to array***/
                var order = $(this).sortable('toArray');
                console.log("Saving the order to array ");
                for (var i = 0; i < order.length; i++) {
                    console.log(order[i]);
                }
                for (var i = 0; i < order.length; i++) {
                    if (order[i].indexOf("_stat") != -1) order[i] = "";
                }

                for (var i = 0; i < order.length; i++) {
                    if (order[i] == "") order.splice(i, 1);
                }

                sharedPreferences.set(sharedPreferencesConstants.WEMO_NAMESPACE, sharedPreferencesConstants.WEMO_DEVICE_ORDER, JSON.stringify(order));
                window.sessionStorage.setItem(sessionStore.ORDER_DEVICE_LIST, JSON.stringify(order));
                console.log("initializeSorter - Order Device List from SharedPreferences:  " + JSON.stringify(order));
            }
        });
        $("#device_list_container").disableSelection();
    },

    updateElementPosition: function() {
        $('.power_indicator').css('margin-left', '0');
        var drawer_icon_width = Math.round(0.04 * wemoUtil.getScreenWidth()) + "px";
        var drawer_icon_height = Math.round(0.04 * wemoUtil.getScreenWidth()) + "px";
        var bg_size = drawer_icon_width + " " + drawer_icon_height;
        var friendly_name_container_width = wemoUtil.getScreenWidth() - 180;
        $('.drawer_icon').css('background-size', bg_size);
        $('.drawer_icon').css('visibility', 'visible');
        $(".device_list_friendly_name_container").css('width', friendly_name_container_width + 'px');
    },

    registerListeners: function() {
        console.log("START_DEVICE_LISTENERS");
        setTimeout(function() {
            deviceTabPlugin.execute(
                function(message) {
                    console.log("Device Callback Message: " + JSON.stringify(message));
                    if (window.jQuery) {
                        if (message) {
                            nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                            if (message.listen == "set_inactive_state") {
                                message.udn.forEach(function(udn) {
                                    console.log('Set inactive: ' + udn);
                                });

                            } else if (message.listen == "set_unavailable_state") {
                                message.udn.forEach(function(udn) {
                                    console.log('Set unavailable: ' + udn);

                                    if (udn.search("Bridge") != -1 || udn.search("Bridge") == true) {
                                        console.log("bridge avaliability show3");
                                        $("#bridgeunavailable").show();
                                    }

                                });
                        } else if (message.listen == "set_inactive_state_async") {
                        	 message.udn.forEach(function(udn) {
                        		   console.log('set_inactive_state_async: ' + udn);
                        		   tmpDevice = WeMoDeviceList.getDevice(udn);
                              	   tmpDevice.cached = true;
                              	   WeMoDeviceList.checkBridge(udn);
                             });
                        	 if(window.sessionStorage.getItem(sessionStore.IS_UPGRADE_INPROGRESS) != "true")
                             device_list.renderDeviceList();
                        } 
                        else if (message.listen == "get_countdown_time") {
                        	var current = new Date(); 
                            var currentEpoch = current.getTime(); 
                            if(message.countdownEndTime != null)
                            var final_time = new Date(parseInt(message.countdownEndTime)*1000); 
                            wemoUtil.infoLog('AUTO_OFF_TIMER','Countdown timer :: get_countdown_time: ' + message.udn + '  count down time ::: ' +  message.countdownEndTime + ' :: final_time :: ' + final_time +' Current time :: ' + current + ' :: currentEpoch : '  + currentEpoch);
                            WeMoDeviceUtils.countLoop(message.countdownEndTime,message.udn);
                        } 
                        else if (message.listen == "state_change") {
                                var itemID = '[id="' + message.udn + '"]';

                                if ((message.udn).search("Bridge") != -1 || (message.udn).search("Bridge") == true) {
                                    console.log("entering in bridge notifications");
                                    device_list_bridge.changeLedValues(message);
                                }

                            } else if (message.listen == "get_end_device_status_list") {
                                device_list_bridge.multipleGetDeviceResponse(message.getLedStatusList);
                            } else if (message.listen == "get_led_firmware_status") {
                                console.log('Firmare Message');
                                if (message.state == 0) {
                                    var msg = "Downloading...";
                                    $("ul li[data-deviceid=" + message.ledDeviceId + "]").find(".firmware_msg").remove();
                                    $("ul li[data-deviceid=" + message.ledDeviceId + "]").find(".sliderValue").append("<span class='firmware_msg'>" + msg + "</span>");
                                } else if (message.state == 1) {
                                    var msg = "Download Success";
                                    $("ul li[data-deviceid=" + message.ledDeviceId + "]").find(".firmware_msg").remove();
                                    $("ul li[data-deviceid=" + message.ledDeviceId + "]").find(".sliderValue").append("<span class='firmware_msg'>" + msg + "</span>");
                                } else if (message.state == 2) {
                                    var msg = "Download Failed";
                                    $("ul li[data-deviceid=" + message.ledDeviceId + "]").find(".firmware_msg").remove();
                                    $("ul li[data-deviceid=" + message.ledDeviceId + "]").find(".sliderValue").append("<span class='firmware_msg'>" + msg + "</span>");
                                } else if (message.state == 3) {
                                    var msg = "Upgrading...";
                                    $("ul li[data-deviceid=" + message.ledDeviceId + "]").find(".firmware_msg").remove();
                                    $("ul li[data-deviceid=" + message.ledDeviceId + "]").find(".sliderValue").append("<span class='firmware_msg'>" + msg + "</span>");
                                } else if (message.state == 4) {
                                    var msg = "Upgraded";
                                    $("ul li[data-deviceid=" + message.ledDeviceId + "]").find(".firmware_msg").remove();
                                    $("ul li[data-deviceid=" + message.ledDeviceId + "]").find(".sliderValue").append("<span class='firmware_msg'>" + msg + "</span>");
                                } else if (message.state == 5) {
                                    var msg = "Upgraded";
                                    $("ul li[data-deviceid=" + message.ledDeviceId + "]").find(".firmware_msg").remove();
                                    $("ul li[data-deviceid=" + message.ledDeviceId + "]").find(".sliderValue").append("<span class='firmware_msg'>" + msg + "</span>");
                                } else if (message.state == 6) {
                                    var msg = "Upgrade Failed";
                                    $("ul li[data-deviceid=" + message.ledDeviceId + "]").find(".firmware_msg").remove();
                                    $("ul li[data-deviceid=" + message.ledDeviceId + "]").find(".sliderValue").append("<span class='firmware_msg'>" + msg + "</span>");
                                } else {
                                    $("ul li[data-deviceid=" + message.ledDeviceId + "]").find(".firmware_msg").remove();

                                }

                            } else {

                                console.log("test else....");
                            }
                            //device_list.renderDeviceList();

                            if (WeMoDeviceList.getCountActiveDevices() > 0) modifyDeviceController.show();
                            else modifyDeviceController.hide();
                        }
                    }
                },
                device_list.reportError,
                actions.START_DEVICE_LISTENERS, []
            );
        }, 100);
    },

    changeValues: function(message) {
        console.log("notify type: " + message[key.NOTIFY_TYPE] + " new state: " + message.state + " for " + message.udn);
        var itemID = '[id="' + message.udn + '"]';
        var oooh = true;
        if (isEditMode) {
            // alert('isEditMode'+isEditMode);
            $(itemID).find("span").last().removeClass();
        } else if (message[key.NOTIFY_TYPE] === notificationType.BINARY_STATE) {
            var device_type = $(itemID).attr('wemo-device-type');
            if (device_type == wemoSwitch.TYPE || device_type == wemoLightSwitch.TYPE || device_type == wemoInsight.TYPE || device_type == wemoMaker.TYPE) {
                $(itemID).attr('wemo-device-state', message.state);
                var newClass = device_list.getBinaryStateImage(message.state);
                //            	console.log("before change html: " + $(itemID).html());
                var state_item = $(itemID).find("[name='name_device_state']");
                if (!isEditMode) {
                    state_item.removeClass();
                    state_item.addClass(newClass);
                }
                state_item.attr('wemo-device-state', newClass);

                if (device_type == wemoInsight.TYPE) {
                    var newPowerState = device_list.getInsightPowerStateImage(message.state);
                    var powerStateItem = $(itemID).find("[name='name_power_state']");
                    currentState = powerStateItem.attr('wemo-power-state');
                    powerStateItem.attr('wemo-power-state', newPowerState);
                    if (!isEditMode) {
                        powerStateItem.removeClass(currentState)
                            .addClass(newPowerState);
                    }
                    //update statistics drawer if there are Insight parameters
                    if (message.stateChangeTS !== undefined) {
                        device_list.fillInsightDeviceStatistic(message.udn, message);
                    }
                }
                //            console.log("after change html: " + $(itemID).html());
            } else if (device_type == wemoSensor.TYPE || device_type == wemoNetCam.TYPE || device_type == wemoLinkCam.TYPE) {
                console.log("notify type: " + message[key.NOTIFY_TYPE] + " new state Inside : " + message.state + " for " + message.udn);
                var motion = "";
                switch (message.state) {

                    case "0":
                        console.log("@@@@@@ notify type: " + "Case 0 : " + message[key.NOTIFY_TYPE] + " new state: " + message.state + " for " + message.udn);
                        motion = wemo.items['Devices_Sensor_NoMotionSensed']; //No Motion
                        oooh = false;
                        break;
                    case "1":
                        console.log("@@@@@@ notify type: " + "Case 1 : " + message[key.NOTIFY_TYPE] + " new state: " + message.state + " for " + message.udn + "Flag : " + oooh);
                        if (oooh) {
                            motion = wemo.items['Devices_Sensor_MotionWasSensed']; //Motion ooh
                            setTimeout(function() {
                                $(itemID).find("[name='sub_title']").html(wemo.items['Devices_Sensor_MotionSensed']); //Motion AFTER A SECOND
                                //$(".sensorStatus").css("color", "#73d44c");
                                $(itemID).find("[name='sub_title']").css("color", "#73d44c");
                            }, timeout.ONE_SECOND);
                        } else {
                            motion = wemo.items['Devices_Sensor_MotionSensed']; //Motion
                        }
                        oooh = false;
                        device_list.arrTimestampForRemote[message.udn] = (new Date()).getTime();
                        sharedPreferences.set(sharedPreferencesConstants.WEMO_NAMESPACE, sharedPreferencesConstants.TIMESTAMP_FOR_REMOTE, JSON.stringify(device_list.arrTimestampForRemote));
                        break;
                    case "2":
                        motion = wemo.items['Devices_Remote_NotDetected']; //Not Detected
                        break;
                    case "3":
                        motion = wemo.items['Devices_Remote_NotDetected']; //Not Detected
                        break;
                    default:
                        motion = wemo.items['SensorNotPresent']; //Sensor is not present
                }
                console.log("sensor state change to: " + motion);
                $(itemID).find("[name='sub_title']").html(motion);
                if ((motion == wemo.items['Devices_Sensor_MotionWasSensed']) || (motion == wemo.items['Devices_Sensor_MotionSensed'])) {
                    //$(".sensorStatus").css("color", "#73d44c");
                    $(itemID).find("[name='sub_title']").css("color", "#73d44c");
                } else {
                    //$(".sensorStatus").css("color", "#595959");
                    $(itemID).find("[name='sub_title']").css("color", "#595959");
                }
            }
        } else if (message[key.NOTIFY_TYPE] !== notificationType.FIRMWARE_STATE) {} else {
            console.log("FIRMWARE_STATE: new state: " + message.state + " for " + message[key.DEVICE_UDN]);
            var firmwareStatus = '';
            var object = window.sessionStorage.getItem(sessionStore.FIRMWARE_UPDATE_DATA);
            console.log('Firmware JSON: ' + object); // getting undefined, needs a check
            object = JSON.parse(object);
            switch (message.state) {
                case "0":
                    firmwareStatus = 'downloading new firmware...';
                    $(itemID).find("[name = 'name_firmware_status']").html(firmwareStatus);
                    console.log("Item to be updated: " + JSON.stringify(object[message[key.DEVICE_UDN]]));
                    object[message[key.DEVICE_UDN]][key.DEVICE_FIRMWARE_UPGRADE_STARTED] = true;
                    window.sessionStorage.setItem(sessionStore.FIRMWARE_UPDATE_DATA, JSON.stringify(object));
                    console.log("Firmware upgrade data updated[value changed]: " + JSON.stringify(object));
                    setTimeout(function() {
                        $(itemID).find("[name='name_device_state']").removeClass().cssLoader();
                    }, timeout.LONG);
                    break;
                case "1":
                    firmwareStatus = 'FW upgrade successful!';
                    delete object[message[key.DEVICE_UDN]];
                    window.sessionStorage.setItem(sessionStore.FIRMWARE_UPDATE_DATA, JSON.stringify(object));
                    console.log("Firmware upgrade success data updated[removed]: " + JSON.stringify(object));
                    break;
                case "2":
                    firmwareStatus = 'FW upgrade fail!';
                    $(itemID).find("[name='name_device_state']").removeClass().cssLoader({
                        show: false
                    });
                    $("[name='name_device_state']").each(function() {
                        $(this).removeClass().addClass($(this).attr('wemo-device-state'));
                    });
                    $("[name='name_power_state']").each(function() {
                        $(this).addClass($(this).attr('wemo-power-state')).show();
                    });
                    delete object[message[key.DEVICE_UDN]];
                    window.sessionStorage.setItem(sessionStore.FIRMWARE_UPDATE_DATA, JSON.stringify(object));
                    console.log("Firmware upgrade failed data updated[removed]: " + JSON.stringify(object));
                    break;
                case "3":
                    firmwareStatus = 'installing new firmware...';
                    break;
                default:
                    firmwareStatus = '';
            }
            $(itemID).find("[name = 'name_firmware_status']").html(firmwareStatus);

        }
    },
 
    getCloudFirmwareVersion: function(oldDeviceList) {
        console.log('getCloudFirmwareVersion' + JSON.stringify(oldDeviceList));
        deviceFirmwareArray = [];
        deviceObject = {};
        deviceUDN = '';
        friendleyName = '';
        macAddress = '';
        status = '';
        fwVersion = '';
        hwVersion = '';
        for (index in oldDeviceList) {
            var object = oldDeviceList[index];
            deviceUDN = object.udn;
            friendleyName = object.name;
            macAddress = object.mac;
            status = object.state;
            fwVersion = object.fwVersion;
            pluginid = object.pluginid;
            hwVersion = object.hwVersion;
            deviceObject = {};
            deviceObject[key.DEVICE_FRIENDLY_NAME] = friendleyName;
            deviceObject[key.DEVICE_UDN] = deviceUDN;
            deviceObject[key.DEVICE_FIRMWARE] = fwVersion;
            deviceObject[key.DEVICE_MAC_ADDRESS] = macAddress;
            deviceObject[key.DEVICE_PLUGIN_ID] = pluginid;
            deviceObject[key.DEVICE_HW_VERSION] = hwVersion;
            /**
             * If property Type of Object 'object' is holding the value of device type, So why code is tying to fetch it from DOM element?
             * Dead - wemoUtil.remoteTypeToLocalType($(this).find("modelCode").text());
             * Changed to - wemoUtil.remoteTypeToLocalType(object.type);
             * Bug # - WEMO-22509, WEMO-22994
             */

            
            //if (object.type == ledModelcode.LED || object.type == ledModelcode.OSRAM)
            
            if(wemoUtil.isSupportedLedModelCode(object.type))
                deviceObject[key.DEVICE_TYPE] = object.type;
            else
                deviceObject[key.DEVICE_TYPE] = wemoUtil.remoteTypeToLocalType(object.type);

            console.log("getCloudFirmwareVersion status udn: " + deviceUDN + " status: " + status + " fwVersion: " + fwVersion);
            console.log("getCloudFirmwareVersion firmware current version object: " + JSON.stringify(deviceObject));
            if (status != 3 && status != 4 && object.inactive !=true ) {
            	wemoUtil.infoLog("getCloudFirmwareVersion added to devicearray status udn: " + deviceUDN + " status: " + status + " fwVersion: " + fwVersion);
                deviceFirmwareArray.push(deviceObject);
            }
        }
        wemoUtil.setJSONObjectToSessionStorage(sessionStore.FIRMWARE_VERSION_DATA, deviceFirmwareArray);
        console.log("getCloudFirmwareVersion firmware current version array: " + JSON.stringify(deviceFirmwareArray));
        device_list.isFirmwareAvailable(deviceFirmwareArray);
    },

    loadDevicesFromCloud: function(reqtype) {
        var dfd = $.Deferred();
        var udn = "";
        console.log("loadDevicesFromCloud reqtype: " + reqtype);

        cloudServices.getDeviceList(
            function(result) {
                window.devicelistEvents.emit('remoteUpdate', result);
                emptyDeviceList();
                /*************calling LED Remote call**********/

                device_list_bridge.loadBridgeDevicesFromCloud(result);

                /*************calling LED Remote call**********/
                device_array = [];
                autoOffTimeUdid = [];
                //$(result).find('plugin').each(function (i) {
                //


                $(result).find('device').each(function(i) {
                    console.log("Plugin: " + i);

                    //console.log('Device data:-- ' + 'UDN:  '+$(this).find("uniqueId").text() + 'Type:  '+$(this).find("modelCode").text() + 'Name:  '+$(this).find("friendlyName").text() + 'State:  '+$(this).find("status").text() + 'PluginId:  '+$(this).find("pluginId").text() + 'MAC:  '+$(this).find("macAddress").text() + 'Status Timestamp:  '+$(this).find("statusTS").text() + 'fullXML:  '+(new XMLSerializer()).serializeToString(this));
                    var device_type = $(this).find("modelCode").text();
                    var device_id = $(this).find("uniqueId").text();
                    var device_attributelist = $(this).find("attributelist").text();
                    var countdownEndTime = 0;
                    if (device_attributelist != undefined) {
                        device_attributelist = "{";
                        $(this).find('attribute').each(function(i) {
                            console.log("loadDevicesFromCloud 222" + device_attributelist);
                            var name = $(this).find("name").text();
                            if (name == "Switch" || name == "switch") {
                                device_status = $(this).find("value").text();
                                device_attributelist = device_attributelist + "\"Switch\"";
                                device_attributelist = device_attributelist + ":{\"name\":\"Switch\"";
                                device_attributelist = device_attributelist + ",\"value\":\"" + $(this).find("value").text() + "\"}";
                                device_attributelist = device_attributelist + ",";
                            } else if (name == "Sensor" || name == "sensor") {
                                device_attributelist = device_attributelist + "\"Sensor\"";
                                device_attributelist = device_attributelist + ":{\"name\":\"Sensor\"";
                                device_attributelist = device_attributelist + ",\"value\":\"" + $(this).find("value").text() + "\"}";
                                device_attributelist = device_attributelist + ",";
                            } else if (name == "SwitchMode" || name == "switchMode") {
                                device_attributelist = device_attributelist + "\"SwitchMode\"";
                                device_attributelist = device_attributelist + ":{\"name\":\"SwitchMode\"";
                                device_attributelist = device_attributelist + ",\"value\":\"" + $(this).find("value").text() + "\"}";
                                device_attributelist = device_attributelist + ",";
                            } else if (name == "SensorPresent" || name == "sensorPresent") {
                                device_attributelist = device_attributelist + "\"SensorPresent\"";
                                device_attributelist = device_attributelist + ":{\"name\":\"SensorPresent\"";
                                device_attributelist = device_attributelist + ",\"value\":\"" + $(this).find("value").text() + "\"}";
                                device_attributelist = device_attributelist + ",";
                            } else if (name == "RuleAutoOffTime") {
                                countdownEndTime = $(this).find("value").text();
                            }
                        });
                        device_attributelist = device_attributelist.substring(0, device_attributelist.lastIndexOf(','));
                        device_attributelist = device_attributelist + "}";
                        console.log("loadDevicesFromCloudin countdownEndTime " + countdownEndTime);
                        console.log("loadDevicesFromCloudin getDeviceList stringify " + JSON.stringify(device_attributelist));
                    }

                    if(wemoUtil.isSupportedLedModelCode(device_type) || device_type == "LED"){  /*condition for Bulb OTA for all kind of bulbs*/
                   // if(device_type == ledModelcode.LED || device_type == "LED") {
                        var deviceLedObject = {
                            udn: $(this).find("macAddress").text(),
                            type: $(this).find("modelCode").text(),
                            name: (($(this).find("friendlyName").text()).match('Â')) ? ($(this).find("friendlyName").text()).replace('Â', '') : $(this).find("friendlyName").text(),

                            state: $(this).find("status").text(),
                            pluginid: $(this).find("pluginId").text(),
                            mac: $(this).find("macAddress").text(),
                            status_timestamp: $(this).find("statusTS").text(),
                            fwVersion: $(this).find("firmwareVersion").text(),
                            iconVersion: $(this).find("iconVersion").text(),
                            fwVersionStatus: $(this).find("fwUpgradeStatus").text(),
                            fullXML: (new XMLSerializer()).serializeToString(this)
                        };

                        var tmpWeMoLedDevice = new WeMoDeviceRemote(deviceLedObject.udn, deviceLedObject.type, deviceLedObject.name, deviceLedObject.state, deviceLedObject.mac, deviceLedObject.pluginid, deviceLedObject.status_timestamp, deviceLedObject.fwVersion, device_attributelist, deviceLedObject.iconVersion, deviceLedObject.customizedState);
                        tmpWeMoLedDevice.info = deviceLedObject.info;

                        console.log('Device Object LED:-- ' + 'UDN:  ' + deviceLedObject.udn + 'Type:  ' + deviceLedObject.type + 'Name:  ' + deviceLedObject.name + 'State:  ' + deviceLedObject.state + 'PluginId:  ' + deviceLedObject.pluginid + 'MAC:  ' + deviceLedObject.mac + 'Status Timestamp:  ' + deviceLedObject.status_timestamp + 'fullXML:  ' + deviceLedObject.fullXML + " fwVersion: " + deviceLedObject.fwVersion + " iconVersion: " + deviceLedObject.iconVersion);

                        device_array.push(tmpWeMoLedDevice);

                        console.log("firmware array check remote mode LED" + JSON.stringify(tmpWeMoLedDevice));
                    }
                    
                    //if (device_type != ledModelcode.LED && device_type != ledModelcode.OSRAM && device_type != "LED" && device_id != "") {
                    if(!wemoUtil.isSupportedLedModelCode(device_type) && device_type != "LED" && device_id != "") {
                        var deviceObject = {
                            udn: $(this).find("uniqueId").text(),
                            type: $(this).find("modelCode").text(),
                            name: (($(this).find("friendlyName").text()).match('Â')) ? ($(this).find("friendlyName").text()).replace('Â', '') : $(this).find("friendlyName").text(),

                            state: $(this).find("status").text(),
                            pluginid: $(this).find("pluginId").text(),
                            mac: $(this).find("macAddress").text(),
                            status_timestamp: $(this).find("statusTS").text(),
                            fwVersion: $(this).find("firmwareVersion").text(),
                            iconVersion: $(this).find("iconVersion").text(),
                            fwVersionStatus: $(this).find("fwUpgradeStatus").text(),
                            hwVersion: $(this).find("hwVersion").text(),
                            fullXML: (new XMLSerializer()).serializeToString(this)
                        };

                        console.log('Device Object:-- ' + 'UDN:  ' + deviceObject.udn + 'Type:  ' + deviceObject.type + 'Name:  ' + deviceObject.name + 'State:  ' + deviceObject.state + 'PluginId:  ' + deviceObject.pluginid + 'MAC:  ' + deviceObject.mac + 'Status Timestamp:  ' + deviceObject.status_timestamp + 'fullXML:  ' + deviceObject.fullXML + " fwVersion: " + deviceObject.fwVersion + " iconVersion: " + deviceObject.iconVersion + "countdownEndTime : " + countdownEndTime);
                        var autoOffVal = new AutoOffRemote(deviceObject.udn, countdownEndTime)
                        autoOffTimeUdid.push(autoOffVal);
                        //Remove login from NetCam name
                        if (wemoUtil.isCamDevice(deviceObject.type)) {
                            var login = wemoUtil.extractNetCamLogin(deviceObject.name);
                            if (login != null)
                                deviceObject.info = login;
                            deviceObject.name = wemoUtil.extractNetCamName(deviceObject.name);
                        }

                        if ((deviceObject.udn).search("Bridge") != -1) {
                            console.log("Bridge avaliablity " + deviceObject.udn + "---" + deviceObject.state);

                            if (deviceObject.state == firmwareMessagingEnum.THREE || deviceObject.state == firmwareMessagingEnum.FOUR) {
                                if (deviceObject.fwVersionStatus != firmwareMessagingEnum.FOUR) {
                                    $(".bridge_unavailable_text").html(wemo.items['updatingWeMoLinkTitle']);
                                    $(".font-detail").html(wemo.items['updatingWeMoLinkDesc']);
                                    $("#bridgeunavailable").show();
                                } else {
                                    $(".bridge_unavailable_text").html(wemo.items['checkWemoLinkNew']);
                                    $(".font-detail").html(wemo.items['notRespondingNew']);
                                    $("#bridgeunavailable").show();
                                }

                            } else
                                $("#bridgeunavailable").hide();


                            if (deviceObject.fwVersionStatus != firmwareMessagingEnum.FOUR && deviceObject.state != firmwareMessagingEnum.THREE && deviceObject.state != firmwareMessagingEnum.FOUR) {
                                bridgeFirmwareFlag = true;
                                bridgeFirmwareStatus = device_list.firmwareUpgradeMessageRemote(deviceObject.fwVersionStatus);

                                if (bridgeFirmwareStatus != "") {
                                    window.sessionStorage.setItem(sessionStore.IS_UPGRADE_INPROGRESS, "true");
                                    window.sessionStorage.setItem(sessionStore.CHECK_FIRMWARE_UPGRADE_REQUIRED, "true");
                                }

                            } else if (deviceObject.fwVersionStatus == firmwareMessagingEnum.FOUR && bridgeFirmwareFlag == true) {
                                if (window.sessionStorage.getItem(sessionStore.IS_UPGRADE_INPROGRESS) == "true") {
                                    bridgeFirmwareStatus = device_list.firmwareUpgradeMessageRemote(deviceObject.fwVersionStatus);
                                    window.sessionStorage.setItem(sessionStore.IS_UPGRADE_INPROGRESS, "false");
                                    window.sessionStorage.setItem(sessionStore.CHECK_FIRMWARE_UPGRADE_REQUIRED, "false");
                                } else
                                    bridgeFirmwareFlag = false;
                            }

                        }

                        if (WeMoDeviceList._deviceList[deviceObject.udn] != undefined) {
                            var tmpWeMoDevice = WeMoDeviceList.getDevice(deviceObject.udn);
                            tmpWeMoDevice.name = deviceObject.name;
                            tmpWeMoDevice.state = deviceObject.state;
                            tmpWeMoDevice.stateChangeTS = deviceObject.status_timestamp;
                            tmpWeMoDevice.mac = deviceObject.mac;
                            tmpWeMoDevice.fwVersion = deviceObject.fwVersion;
                            tmpWeMoDevice.iconVersion = deviceObject.iconVersion;
                            tmpWeMoDevice.customizedState = deviceObject.customizedState;
                            tmpWeMoDevice.makerAttributeList = device_attributelist;
                            tmpWeMoDevice.icon = null;
                            tmpWeMoDevice.info = deviceObject.info;
                            tmpWeMoDevice.hwVersion = deviceObject.hwVersion;
                            /*//instant remote cache
						    if(tmpWeMoDevice.cached)
                            {
                            	tmpWeMoDevice.cached=false;
                            }
						    */
                            WeMoDeviceList._deviceList[deviceObject.udn] = tmpWeMoDevice;
                            console.log("firmware array check local mode" + JSON.stringify(tmpWeMoDevice));
                        } else {
                            var tmpWeMoDevice = new WeMoDeviceRemote(deviceObject.udn, deviceObject.type, deviceObject.name, deviceObject.state, deviceObject.mac, deviceObject.pluginid, deviceObject.status_timestamp, deviceObject.fwVersion, device_attributelist, deviceObject.iconVersion, deviceObject.customizedState, deviceObject.hwVersion);
                            tmpWeMoDevice.info = deviceObject.info;
                            console.log("firmware array check remote mode" + JSON.stringify(tmpWeMoDevice));
                        }
                        if (deviceObject.state == "3")
                            tmpWeMoDevice.inactive = true;
                        else
                            tmpWeMoDevice.inactive = false;
                        /* if(tmpWeMoDevice.customizedState == "0"){
                        	wemoUtil.loadUrl(filePath.SETUP_SUCCESS);
                        }
                        else{*/
                        udn = deviceObject.udn;
                        device_array.push(tmpWeMoDevice);
                        console.log('loadDevicesFromCloud deviceObject.state: ' + (deviceObject.state) + " deviceObject.udn: " + (deviceObject.udn));

                        WeMoDeviceList.addDevice(deviceObject.udn, tmpWeMoDevice);
                        //}
                    }

                });
                var newHomeId = $(result).find("newHomeId").text();
                var newHomeSsid = $(result).find("newHomeSSID").text();

                var ssidArray = [];
                var arpMacArray = []

                $(result).find('ssid').each(function(i) {
                    ssidArray.push($(this).text());
                });
                $(result).find('arpMac').each(function(i) {
                    arpMacArray.push($(this).text());
                });
                if ((ssidArray.length > 0 || arpMacArray.length > 0) &&(reqtype == "load")){
                    nativeUtilPlugin.execute(function(newNetworkHome) {
                        wemoUtil.infoLog("SET_SSID_ARPMAC newNetworkHome: " + newNetworkHome);
                        if (newNetworkHome != null && newNetworkHome == true) {
                            window.sessionStorage.setItem(sessionStore.REMOTE_MODE, false);
                            wemoUtil.loadUrl(filePath.INDEX);
                        }

                    }, null, actions.SET_SSID_ARPMAC, [ssidArray, arpMacArray]);
                }

                wemoUtil.infoLog("newHomeId: " + newHomeId + " newHomeSSID: " + newHomeSsid + " ssidArray: " + ssidArray + " arpMacArray: " + arpMacArray);

                if (newHomeId != "" && newHomeSsid != "") {
                    nativeUtilPlugin.execute(null, null, actions.CHANGE_HOME_SSID, [newHomeId, newHomeSsid, arpMacArray]);
                    cloudServices.sendAckToCloud();
                }



                window.sessionStorage.setItem("device_array", JSON.stringify(device_array));
                if (!window.sessionStorage.getItem("firmware_shown")) {
                    setTimeout(function() {
                            device_list.getCloudFirmwareVersion(device_array);
                        },
                        timeout.FIRMWARE_CHECK);
                    window.sessionStorage.setItem("firmware_shown", true);
                }

                if (reqtype == "load") {
                    device_list.loadDevicesFromCloud("remote");
                }

                window.sessionStorage.setItem("device_length", device_array.length);
                //WeMoDeviceList.updateCache(); //instant remote cache
                device_list.renderDeviceList(isEditMode, false);
                nativeUtilPlugin.execute(null, null, actions.SET_CACHE_SSID, [""]);
                nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                if (window.sessionStorage.getItem(sessionStore.IS_UPGRADE_INPROGRESS) == "true")
                    device_list.checkFirmwareUpgraded(udn);

                for (i in autoOffTimeUdid) {
                    wemoUtil.infoLog('Autooff UDN is: ' + autoOffTimeUdid[i].udn + " RuleAutoOffTime" + autoOffTimeUdid[i].RuleAutoOffTime);
                    var countDownObj = WeMoDeviceUtils.countdowner[autoOffTimeUdid[i].udn];
                    if (countDownObj != null && countDownObj != undefined) {
                        if (countDownObj.prevEndTime != autoOffTimeUdid[i].RuleAutoOffTime) {
                            WeMoDeviceUtils.countLoop(autoOffTimeUdid[i].RuleAutoOffTime, autoOffTimeUdid[i].udn);
                        }
                    } else {
                        WeMoDeviceUtils.countLoop(autoOffTimeUdid[i].RuleAutoOffTime, autoOffTimeUdid[i].udn);
                    }
                }
                dfd.resolve();

            },
            function(error) {
                console.log("loadDevicesFromCloud - Error:  " + error);
                //nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, ["", wemo.items['Devices_LookingForDevices']]);
            }, reqtype
        );

        return dfd;
    },

    buildXMLForGettingInsightParams: function(pluginId, macAddress) {
        xmlString = "<plugins>" +
            "<plugin>" +
            "<recipientId>" + pluginId + "</recipientId>" +
            "<macAddress>" + macAddress + "</macAddress>" +
            "<content>" +
            "<![CDATA[<getPluginDetails><plugin><macAddress>" + macAddress + "</macAddress></plugin></getPluginDetails>]]>" +
            "</content>" +
            "</plugin>" +
            "</plugins>";
        return xmlString;
    },

    autoRefresh: function() {
        function autoRefreshCloudList() {
            console.log("AUTO REFRESH");
            //nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", wemo.items['Devices_LookingForDevices']]);
            //$('#device_list_container').empty();
            //$('#device_list_bridge_container').empty();
            device_list.loadDevicesFromCloud("autorefresh");
            //device_list_bridge.loadBridgeDevicesFromCloud("autorefresh");
            device_list.autoRefresh();
        };
        cloudDeviceListAutoRefreshTimeout = setTimeout(function() {
        if (isRemoteEnabled)
            autoRefreshCloudList();
        }, timeout.AUTO_REFRESH);
    },

    getLocalFirmwareVersion: function() {
        console.log("getLocalFirmwareVersion");

        function firmwareCheckTimer() {
            console.log("firmwareCheckTimer :: isDeviceAvailable >> " + isDeviceAvailable);

            if (isBridgeFlag == true) {
                console.log("firmwareCheckTimer ISBRIGE:: isDeviceAvailable >> " + isDeviceAvailable + " >>> " + isLEDDeviceAvailable);

                if (isDeviceAvailable && isLEDDeviceAvailable) {
                    var leddevices = window.sessionStorage.getItem(sessionStore.LED_DEVICE_FIRMWARE_ARRAY);
                    leddevices = JSON.parse(leddevices);
                    console.log("leddevices info" + leddevices + "---" + JSON.stringify(leddevices));
                    device_list.isFirmwareAvailable(leddevices);
                } else if (isLEDDeviceAvailable) {
                    var leddevices = window.sessionStorage.getItem(sessionStore.LED_DEVICE_FIRMWARE_ARRAY);
                    leddevices = JSON.parse(leddevices);
                    console.log("leddevices info" + leddevices + "---" + JSON.stringify(leddevices));
                    device_list.isFirmwareAvailable(leddevices);
                } else {
                    if (isDeviceAvailable) {
                        device_list.isFirmwareAvailable([]);
                    } else {
                        setTimeout(function() {
                            firmwareCheckTimer();
                        }, timeout.FIRMWARE_CHECK);
                    }
                }
            } else {
                if (isDeviceAvailable) {
                    device_list.isFirmwareAvailable([]);
                } else {
                    setTimeout(function() {
                        firmwareCheckTimer();
                    }, timeout.FIRMWARE_CHECK);
                }
            }

        };
        firmwareCheckTimeout = setTimeout(function() {
            firmwareCheckTimer();
        }, timeout.FIRMWARE_CHECK);
    },

    isFirmwareAvailable: function(array) {
    	wemoUtil.infoLog("isFirmwareAvailable fwUrl: "+fwUrl+" fwUrlGoing:"+fwUrlGoing);
    	if(fwUrl==undefined || fwUrl==null)
    	{
    		fwUrlGoing=true;
    		device_list.getFirmwareFilePath(
    				function(path) {
    	            	fwUrl=path;
    	            	fwUrlGoing=false;
    	            	device_list.isFirmwareAvailableWorker(array, fwUrl);
    	            }
    	        );
    	}else
    	{ 
    		device_list.isFirmwareAvailableWorker(array, fwUrl);
    	}

    },
    isFirmwareAvailableWorker: function(array, url) {
    	console.log("isFirmwareAvailableWorker" + JSON.stringify(array));
    	deviceTabPlugin.execute(
    			function(status) {
    				console.log("IS_FIRMWARE_AVAILABLE success callback :: CHECK_FIRMWARE_UPGRADE_REQUIRED ::" + window.sessionStorage.getItem(sessionStore.CHECK_FIRMWARE_UPGRADE_REQUIRED));
    				console.log("firmware available status: " + status);
    				if (status) {
    					console.log("firmware available: " + typeof array);
    					window.sessionStorage.setItem(sessionStore.FIRMWARE_DATA, JSON.stringify(array));

    					console.log("firmware upgrade progress " + window.sessionStorage.getItem(sessionStore.IS_UPGRADE_INPROGRESS));

    					var wemo_logo = $(".wemo_logo");
    					// Showing the Firmware option in more menu and showing FW icon on action bar.
    					$('#more_new_firmware').removeClass('none');
    					$('#new_fw_available').show();
    					window.sessionStorage.setItem(sessionStore.FIRMWARE_AVAILABLE, true);
    					// If upgrade is done to bridge and further upgrade is required, then pop-up is not shown again.
    					if (window.sessionStorage.getItem(sessionStore.CHECK_FIRMWARE_UPGRADE_REQUIRED) != "true") {
    						window.sessionStorage.setItem(sessionStore.CHECK_FIRMWARE_UPGRADE_REQUIRED, "true");
    						//New Firmware Popup Open
    						//$("#new_firmware").popup("open");
    						/** GET NEW FIRMARE ELEMENT */


    						device_list.newFirmwarePopup();

    						//  var h = wemoUtil.getScreenHeight() + 10;
    						//   $('.ui-popup-screen.in').css('height', h + 'px');

    					}

    				} else {
    					// If FW upgrade is not required then hiding the FW option from More Menu and FW icon from action bar.
    					window.sessionStorage.setItem(sessionStore.CHECK_FIRMWARE_UPGRADE_REQUIRED, "false");
    					$('#new_fw_available').hide();
    					$('#more_new_firmware').addClass('none');
    					window.sessionStorage.setItem(sessionStore.FIRMWARE_AVAILABLE, false);
    				}
    			},
    			device_list.reportError,
    			actions.IS_FIRMWARE_AVAILABLE, [url, array]
    	);
    },
    getDeviceFirmwareList: function(udn) {
    	wemoUtil.infoLog("getDeviceFirmwareList fwUrl: "+fwUrl+" fwUrlGoing:"+fwUrlGoing);
    	if(fwUrl==undefined || fwUrl==null)
    	{
    		fwUrlGoing=true;
    		device_list.getFirmwareFilePath(
    				function(path) {
    					fwUrl=path;
    					fwUrlGoing=false;
    					device_list.getDeviceFirmwareListWorker(udn,fwUrl);
    				}
    		);
    	}else
    	{ 
    		device_list.getDeviceFirmwareListWorker(udn,fwUrl);
    	}

    },
    getDeviceFirmwareListWorker: function(udn,path) {
    	wemoUtil.infoLog("getDeviceFirmwareListWorker");
    	var array = JSON.parse(window.sessionStorage.getItem(sessionStore.FIRMWARE_DATA));
    	devicePlugin.execute(
    			function(firmwareList) {
    				wemoUtil.infoLog("getDeviceFirmwareListWorker >> Device Firmware list is: " + JSON.stringify(firmwareList)+" the value of udn is:: " + udn + "firmwareList[udn] :: " + firmwareList[udn]);
    				if (firmwareList[udn] == undefined) {
    					var leddevices = window.sessionStorage.getItem(sessionStore.LED_DEVICE_FIRMWARE_ARRAY);
    					leddevices = JSON.parse(leddevices);

    					if (leddevices != undefined && leddevices != "")
    						device_list.isFirmwareAvailable(leddevices);
    					else
    						device_list.isFirmwareAvailable([]);
    				}
    			},
    			device_list.reportError,
    			actions.GET_FIRMWARE_UPDATE_LIST, [path, array]
    	);
    },
    fillFWUpgradeListWorker: function(path) {
     	 var array = JSON.parse(window.sessionStorage.getItem(sessionStore.FIRMWARE_DATA));
     	 devicePlugin.execute(
             function(firmwareList) {
                 devicesFWUpgrade = firmwareList;
                 fillFWUpgradeScheduled=false;
                 wemoUtil.infoLog("fillFWUpgradeListWorker >>" + JSON.stringify(devicesFWUpgrade));
                 if (JSON.stringify(devicesFWUpgrade) == "{}") {
                     $('#new_fw_available').hide();
                     $('#more_new_firmware').addClass('none');
                 }

             },
             device_list.reportError,
             actions.GET_FIRMWARE_UPDATE_LIST, [path, array]
         );   
	},
    fillFWUpgradeList: function() {
    	if(fillFWUpgradeScheduled)return;
    	fillFWUpgradeScheduled=true;
    	setTimeout(function() {
    		wemoUtil.infoLog("fillFWUpgradeList fwUrl: "+fwUrl+" fwUrlGoing:"+fwUrlGoing);
        	if(fwUrl==undefined || fwUrl==null)
        	{
        		fwUrlGoing=true;
        		device_list.getFirmwareFilePath(
        				function(path) {
        	            	fwUrl=path;
        	            	fwUrlGoing=false;
        	            	device_list.fillFWUpgradeListWorker(fwUrl);
        	            }
        	        );
        	}else
        	{ 
        		device_list.fillFWUpgradeListWorker(fwUrl);
        	}
        }, timeout.ENABLE_REMOTE_ACCESS_DELAY);
    	

    },

    checkFWUpgradeList: function(resp) {
        $('#more_new_firmware').addClass('none');
        $('#new_fw_available').hide();
        if (WeMoDeviceList.getCountActiveDevices() > 0) {
            if (devicesFWUpgrade[resp.udn] != undefined) {
                delete devicesFWUpgrade[resp.udn];
            }
            if (Object.keys(devicesFWUpgrade).length > 0) {
                $('#more_new_firmware').removeClass('none');
                $('#new_fw_available').show();
                window.sessionStorage.setItem(sessionStore.FIRMWARE_AVAILABLE, true);
            }
        }

    },

    isSmartFramework: function(udn) {
        var devices = [wemoHeaterA.REMOTE_TYPE, wemoHeaterB.REMOTE_TYPE, wemoHumidifier.REMOTE_TYPE, wemoHumidifierB.REMOTE_TYPE, wemoAirPurifier.REMOTE_TYPE, wemoSlowCooker.REMOTE_TYPE, wemoCoffeeMaker.REMOTE_TYPE],
            isSmartFm = false;
        devices.forEach(function(index) {
            var stringMatch = new RegExp(index, 'gi');
            if (udn.match(stringMatch)) {
                isSmartFm = true;
                return;
            }

        });
        return isSmartFm;

    },


    getFirmwareFilePath: function(successCallback) {
    	//Fetching the latest values from  SharedPreferences for App Recovery
    	appRecoveryMechanism.getData(function(recovery_array) {
    		consitentFlag = recovery_array[0];
    		counter = recovery_array[1];
    		maxRetryCount = recovery_array[2];
    		nativeUtilPlugin.execute(
    				function(params){
    					wemoUtil.infoLog(device_list.TAG, "success call back" + params[1] + " : " + params[0]);
    					var homeId = params[1];
    					var authCode = params[0];
    					wemoUtil.infoLog(device_list.TAG, "appRecoveryMechanism :: consitentFlag ::" + consitentFlag + " :: counter :: " + counter + " :: maxRetryCount :: " + maxRetryCount);
    					if(consitentFlag == "false"){
    						options = 2;
    					}
    					var url = cloudAPI.FIRMWARE_URL + homeId + "?options=" + options;
    					wemoUtil.infoLog(device_list.TAG, "Firmware File Path success call back home id: " + homeId + " : authCode: " + authCode);
    					wemoUtil.infoLog(device_list.TAG, "Firmware File Path success call URL is: " + url);
    					$.ajax({

    						url: url,
    						type: "POST",
    						beforeSend: function(xhr) {
    							xhr.setRequestHeader('Content-Type', 'application/xml');
    							xhr.setRequestHeader('Authorization', authCode);
    						},
    						success: function(data) {
    							wemoUtil.infoLog(device_list.TAG, "success callback from cloud: " + JSON.stringify(data));
    							app_recovery_array[0] = true;
    							app_recovery_array[1] = 0;
    							app_recovery_array[2] = 0;
    							appRecoveryMechanism.setData(app_recovery_array);
    							var url = data['fwUpgradeInfo']['fwUpgradeURL'];
    							return successCallback(url);

    						},
    						error: function(jqXHR, textstatus) {
    							wemoUtil.infoLog(device_list.TAG, "appRecoveryMechanism :: jqXHR.status ::" + jqXHR.status + " response" + jqXHR.responseText);
    							var getErrorCodeStatus = function(jqXHR) {
    								if(jqXHR.status == "400"){
    									return JSON.parse(jqXHR.responseText).error.resultCode.code + '#' + jqXHR.status ;
    								}
    								else{
    									return JSON.parse(jqXHR.responseText).Error.code + '#' + jqXHR.status ;
    								}
    							};

    							if(appRecoveryMechanismErrorCodes.indexOf(getErrorCodeStatus(jqXHR)) > -1) {
    								app_recovery_array[0] = false;
    								app_recovery_array[1] = parseInt(counter)+1;
    								app_recovery_array[2] = parseInt(maxRetryCount);
    								appRecoveryMechanism.setData(app_recovery_array);

    								//Re-registration if counter is 3, flag is false n maxretry < 2
    								wemoUtil.infoLog(device_list.TAG, "appRecoveryMechanism ::  counter ::" + counter + " :: consitentFlag ::" + consitentFlag + " :: maxRetryCount ::" + maxRetryCount);
    								if(!isRemoteEnabled && parseInt(counter) > 2 && consitentFlag == "false" && parseInt(maxRetryCount) < 2) {
    									devicePlugin.execute(
    											function (responseAry) {
    												if (responseAry[0]){
    													wemoUtil.infoLog(device_list.TAG, "appRecoveryMechanism :: Remote access status success callback from remote: " + responseAry[0]);
    													app_recovery_array[0] = false;
    													app_recovery_array[1] = parseInt(counter);
    													app_recovery_array[2] = parseInt(maxRetryCount)+1;
    													appRecoveryMechanism.setData(app_recovery_array);
    												}
    											},
    											function (err) {
    											},
    											actions.SET_REMOTE_ACCESS, []
    									);
    								}
    							}
    							if (firmwareCloud == firmwareCloudEnvironment.PRODUCTION)
    								return successCallback(firmwareTextFile.PATH_PROD);
    							else if (firmwareCloud == firmwareCloudEnvironment.STAGING)
    								return successCallback(firmwareTextFile.PATH_STAG);
    							else if (firmwareCloud == firmwareCloudEnvironment.QA)
    								return successCallback(firmwareTextFile.PATH_QA);
    							else if (firmwareCloud == firmwareCloudEnvironment.JARDEN)
    								return successCallback(firmwareTextFile.PATH_MINICLOUD);
    							else if (firmwareCloud == firmwareCloudEnvironment.DEV)
    								return successCallback(firmwareTextFile.PATH_DEV);

    							//return successCallback(firmwareTextFile.PATH);
    						}

    					});
    				},
    				function() {
    					wemoUtil.infoLog(device_list.TAG, 'Failure callback');
    					if (firmwareCloud == firmwareCloudEnvironment.PRODUCTION)
    						return successCallback(firmwareTextFile.PATH_PROD);
    					else if (firmwareCloud == firmwareCloudEnvironment.STAGING)
    						return successCallback(firmwareTextFile.PATH_STAG);
    					else if (firmwareCloud == firmwareCloudEnvironment.QA)
    						return successCallback(firmwareTextFile.PATH_QA);
    					else if (firmwareCloud == firmwareCloudEnvironment.JARDEN)
    						return successCallback(firmwareTextFile.PATH_MINICLOUD);

    					//return successCallback(firmwareTextFile.PATH);
    				},
    				actions.GENERATE_AUTH_CODE, []
    		);
    	});

    },

    startCountdown: function(udn, startTime, maxTime, started) {
        console.log("startCountdown: " + started);
        setTimeout(
            function() {
                console.log("Countdown cycle");
                if (started === true) {
                    console.log("Countdown terminated for: " + udn);
                    return false;
                } else {
                    var pendingTime = wemoUtil.countDown(startTime, maxTime);
                    var message = 'begin download in ' + pendingTime + ' min';
                    var itemID = '[id="' + udn + '"]';
                    console.log("Countdown update: " + message);
                    $(itemID).find("[name = 'name_firmware_status']").html(message);
                    var object = window.sessionStorage.getItem(sessionStore.FIRMWARE_UPDATE_DATA);
                    console.log('Firmware JSON: ' + object);
                    object = JSON.parse(object);
                    device_list.startCountdown(udn, startTime, maxTime, object[udn][key.DEVICE_FIRMWARE_UPGRADE_STARTED]);
                }
            },
            timeout.AUTO_REFRESH
        );

    },

    buildXMLForFirmwareVersion: function(oldDeviceList) {
        console.log('buildXMLForFirmwareVersion' + oldDeviceList.length);
        var xmlString = "<plugins>";
        for (index in oldDeviceList) {
            var deviceItem = oldDeviceList[index];
            var status = deviceItem.state;
            var friendlyName = deviceItem.name;
            var pluginId = deviceItem.pluginid;
            var macAddress = deviceItem.mac;
            //var devicetype = deviceItem[key.DEVICE_TYPE];
            var devicetype = deviceItem.type;
            xmlString += cloudServices.buildXMLForPluginDevice(pluginId, macAddress, status, friendlyName, devicetype, buildXML.FIRMWARE_VERSION);
            //xmlString += cloudServices.buildXMLForPlugin(pluginId, macAddress, status, friendlyName, buildXML.FIRMWARE_VERSION);
        }
        xmlString += "</plugins>";
        return xmlString;
    },

    getCloudFirmwareUpgradeStatus: function(device) {
        wemoUtil.infoLog(TAG, 'getCloudFirmwareUpgradeStatus');
        var xmlRequestString = "<plugins>";
        xmlRequestString += device_list.buildXMLForPlugin(device[key.DEVICE_PLUGIN_ID], device[key.DEVICE_MAC_ADDRESS], '0', device[key.DEVICE_FRIENDLY_NAME], buildXML.FIRMWARE_VERSION);
        xmlRequestString += "</plugins>";
        nativeUtilPlugin.execute(
            function(params) {
                console.log("success call back");
                var authCode = params[0];
                console.log("authCode" + authCode);
                $.ajax({
                    url: cloudAPI.DEVICE_MESSAGE,
                    type: "POST",
                    data: xmlRequestString,
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function(data) {
                        console.log("Sucess firmware response cloud...");
                        var responseXML = (new XMLSerializer()).serializeToString(data);
                        wemoUtil.log(TAG, 'Remote firmware upgrade status: ' + responseXML);

                        $(data).find('plugin').each(function() {
                            //firmwareVersion
                            //feUpgradeStatus -- 0,2,3,4
                            console.log('plugin ID: ' + $(this).find("recipientId").text());
                            deviceUDN = device[key.DEVICE_UDN];
                            var itemID = '[id="' + deviceUDN + '"]';
                            var firmwareUpgradeStatus = $(this).find("fwUpgradeStatus").text();
                            console.log("firmware upgrade status: " + firmwareUpgradeStatus);
                            var firmwareStatusText = '';
                            switch (firmwareUpgradeStatus) {
                                case '0':
                                    firmwareStatusText = '';
                                    break;
                                case '1':
                                    firmwareStatusText = '';
                                    break;
                                case '2':
                                    firmwareStatusText = 'downloading new firmware...';
                                    var firmwareUpgradeData = window.sessionStorage.getItem(sessionStore.FIRMWARE_UPDATE_DATA);
                                    firmwareUpgradeData = JSON.parse(firmwareUpgradeData);
                                    firmwareUpgradeData[deviceUDN][key.DEVICE_FIRMWARE_UPGRADE_STARTED] = 'true';
                                    window.sessionStorage.setItem(sessionStore.FIRMWARE_UPDATE_DATA, JSON.stringify(firmwareUpgradeData));
                                    break;
                                case '3':
                                    firmwareStatusText = 'installing new firmware...';
                                    break;
                                case '4':
                                    firmwareStatusText = 'FW upgrade successful!';
                                    break;
                                default:
                                    break;

                            }

                            $(itemID).find("[name = 'name_firmware_status']").html(firmwareStatusText);


                        });
                    },
                    error: function(xhr, textstatus) {
                        wemoUtil.infoLog(TAG, 'status: ' + xhr.status);
                        wemoUtil.infoLog(TAG, 'status text: ' + xhr.statusText);
                    }
                });

            },
            device_list.reportError,
            actions.GENERATE_AUTH_CODE, []
        );


    },

    deviceListContainerChange: function() {

        /*
         if ($('#device_list_container li').length == 0) {
         //show looking for devices
         wemoUtil.infoLog(device_list.TAG, 'show looking for devices');
         modifyDeviceController.hide();
         nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, []);
         } else {
         //show device list
         wemoUtil.infoLog(device_list.TAG, 'hide looking for devices');
         wemoUtil.infoLog(device_list.TAG, 'remote disabled');
         if (!isRemoteEnabled) nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
         modifyDeviceController.show();
         }
         */
    },

    checkWeakSignal: function() {
        devicePlugin.execute(function(param) {
            //alert("Before Popup!");
            console.log("CHECK_AP_SIGNALSTRENGTH: [" + actions.CHECK_AP_SIGNALSTRENGTH + "]: " + param);
            if (param != "") {
                //alert("inside success!!  "+param);
                var message = wemo.items['WeakSignalAlertMessage'];
                var messages = $('<p>' + message + '</p>').text();
                var arrMessage = messages.split('%@');
                message = param + " " + arrMessage[1];
                $("#WeakSignalAlertMessage").text(message);
                $("#weakSignal").popup("open");
                console.log('Message:  ' + message);
            }
        }, null, actions.CHECK_AP_SIGNALSTRENGTH, []);
    },

    /**
     * returns json object with properties:
     *   value
     *   unit
     */
    formatSinceDate: function(sinceTimestamp) {
        var res = {};
        var hh, mm, ispm = false,
            mmm, dd;
        var today = new Date();
        var todayHH = today.getHours();
        var todayMM = today.getMinutes();
        var todaySS = today.getSeconds();
        var todayMS = today.getMilliseconds();
        var todayTimeInMilliSec = todayHH * 60 * 60 * 1000 + todayMM * 60 * 1000 + todaySS * 1000 + todayMS;
        var yesterday = new Date(today.valueOf() - todayTimeInMilliSec - 86400000);
        var sinceDate = new Date(sinceTimestamp * 1000); //sinceTimestamp in seconds, should be converted into ms
        console.log("yesterday: " + yesterday + " today: " + today + " sinceDate: " + sinceDate);
        if (device_list.isSameDate(sinceDate, today)) {
            console.log("today");
            //hh:mm[am|pm]
            hh = sinceDate.getHours();
            if (hh == 0) {
                //12pm
                hh = 12;
                ispm = true;
            } else if (hh > 12) {
                //hhpm
                hh = hh - 12;
                ispm = true;
            }
            //else hham, hh = hh, ispm = false
            mm = '' + sinceDate.getMinutes();
            if (mm.length < 2) {
                mm = '0' + mm;
            }
            res.value = hh + ':' + mm;
            res.unit = wemo.items[ispm ? 'DateTime_PM' : 'DateTime_AM'];
        } else if (device_list.isSameDate(sinceDate, yesterday)) {
            console.log("yesterday");
            //yesterday
            res.value = wemo.items.DateTime_yesterday;
            res.unit = '';
        } else {
            //MMM DD
            res.value = wemo.items['DateTime_month' + sinceDate.getMonth()] + ' ' + sinceDate.getDate();
            res.unit = '';
        }
        return res;
    },

    isSameDate: function(date1, date2) {
        console.log("date1.getUTCFullYear(): " + date1.getUTCFullYear() + " date2.getUTCFullYear(): " + date2.getUTCFullYear());
        console.log("date1.getUTCMonth(): " + date1.getUTCMonth() + " date2.getUTCMonth(): " + date2.getUTCMonth());
        console.log("date1.getDate(): " + date1.getDate() + " date2.getUTCDate(): " + date2.getDate());
        return date1.getUTCFullYear() == date2.getUTCFullYear() && date1.getUTCMonth() == date2.getUTCMonth() && date1.getDate() == date2.getDate();
    },

    /**
     * Return json object with properties:
     *   majorVal
     *   majorText
     *   minorVal
     *   minorText
     */
    formatTimeIntervalInDay: function(time) {
        if (time < 60) {
            return {
                majorVal: '< 1',
                majorText: wemo.items.DateTime_min,
                minorVal: '',
                minorText: ''
            };
        } else {
            return device_list.formatTimeInterval(time);
        }
    },

    /**
     * Return json object with properties:
     *   majorVal
     *   majorText
     *   minorVal
     *   minorText
     */
    formatTimeInterval: function(time) {
        var res = {};
        res.majorVal = '';
        res.majorText = '';
        res.minorVal = '';
        res.minorText = '';
        // 1 sec
        var mm, hh, dd;
        if (time < 60) {
            res.majorVal = time;
            res.majorText = wemo.items.DateTime_sec;
        }
        // 1 min
        else if (time < 3600) {
            res.majorVal = Math.floor(time / 60);
            res.majorText = wemo.items.DateTime_min;
        }
        // 1 h 10 min
        else if (time < 3600 * 24) {
            res.majorVal = Math.floor(time / 3600);
            res.majorText = wemo.items.DateTime_h;
            mm = Math.floor((time % 3600) / 60);
            if (mm > 0) {
                res.minorVal = mm;
                res.minorText = wemo.items.DateTime_min;
            }
        }
        // 1 day 2 h
        else if (time < 3600 * 24 * 10) {
            dd = Math.floor(time / 3600 / 24);
            res.majorVal = dd;
            if (dd == 1) {
                res.majorText = wemo.items.DateTime_day;
            } else {
                res.majorText = wemo.items.DateTime_days;
            }
            hh = Math.floor((time % (3600 * 24)) / 3600);
            if (hh > 0) {
                res.minorVal = hh;
                res.minorText = wemo.items.DateTime_h;
            }
        }
        // 45 days
        else {
            res.majorVal = Math.floor(time / 3600 / 24);
            res.majorText = wemo.items.DateTime_days;
        }
        return res;
    },

    /**
     * returns string value
     */
    formatCostValue: function(cost) {
        var res;
        var dollars = Math.floor(cost);
        var cents = 0;
        if (cost < 1) {
            //round to 1 cent
            cents = Math.floor(cost * 100) % 100;
        } else if (cost < 10) {
            //round to 5 cents
            cents = (Math.floor(cost * 20) * 5) % 100;
        } else if (cost < 25) {
            //round to 25 cents
            cents = (Math.floor(cost * 4) * 25) % 100;
        }
        res = dollars;
        if (cents > 0) {
            res += '.' + (cents < 10 ? '0' : '') + cents;
        }
        return res;
    },

    /**
     * returns string value
     */
    formatPowerValue: function(power) {
        var res;
        if (power < 2000) {
            res = '< 2';
        } else {
            res = '' + Math.round(power / 1000);
        }
        return res;
    },

    /** data parameters:
     * "onFor":"0",
     * "past14TotalTime":"0",
     * "tttOn":"0",
     * "state":"0",
     * "past14DaysKwh":"0",
     * "stateChangeTS":"1377511106",
     * "powerThreshold":"8000",
     * "hrsConnected":"382069",
     * "todayTotalKwh":"0",
     * "powerNow":"0",
     * "avgPowerOn":"0"
     */
    fillInsightDeviceStatistic: function(item_id, data, pluginId, macAddress) {
        console.log("fillInsightDeviceStatistic");
        var insight_panel = $('li[id="' + item_id + '_stat"]');
        if (insight_panel.length <= 0) return;
        var flagSuccess = false;

        if (isRemoteEnabled) {
            var state,
                stateChangeTS,
                onFor,
                tttON,
                past14TotalTime,
                hrsConnected,
                avgPowerON,
                powerNow,
                todayTotalKWH,
                past14DaysKWH,
                powerThreshold,
                energyPerUnitCost,
                currency;

            $(data).find('applianceConsumption').each(function(i) {
                console.log("Plugin:: " + i);

                state = $(this).find("status").text();
                powerNow = parseFloat($(this).find("instantaneousPower").text());
                tttON = parseInt($(this).find("todayTotalTimeOn").text(), 10);
                hrsConnected = parseInt($(this).find("timeConnected").text(), 10);
                stateChangeTS = parseInt($(this).find("stateChangeTS").text(), 10);
                avgPowerON = parseFloat($(this).find("avgPowerON").text());
                powerThreshold = $(this).find("powerThreshold").text();
                todayTotalKWH = parseFloat($(this).find("todayTotalKWH").text());
                onFor = parseInt($(this).find("lastONFor").text(), 10);
                past14DaysKWH = parseFloat($(this).find("past14DaysKWH").text());
                past14TotalTime = parseInt($(this).find("past14TotalTime").text(), 10);
            });

            $(data).find('homeSettings').each(function(i) {
                energyPerUnitCost = parseFloat($(this).find("energyPerUnitCost").text()) / 1000;
                currency = $(this).find("currency").text();
                insight_panel.attr('data-cost-per-kwh', energyPerUnitCost);
                insight_panel.attr('data-currency', currency);
            });

            if (powerNow != undefined && tttON != undefined && hrsConnected != undefined && stateChangeTS != undefined && avgPowerON != undefined && powerThreshold != undefined && todayTotalKWH != undefined && onFor != undefined && past14DaysKWH != undefined && past14TotalTime != undefined) {
                flagSuccess = true;
            }

            if (energyPerUnitCost == undefined) {
                console.log("energyPerUnitCost is undefined");
                devicePlugin.execute(function(cur_value) {
                        console.log("cur_value" + JSON.stringify(cur_value));
                        var costPerKwh = parseFloat(cur_value['EnergyPerUnitCost']) / 1000;
                        var currency = cur_value['Currency'];
                        insight_panel.attr('data-cost-per-kwh', costPerKwh);
                        insight_panel.attr('data-currency', currency);
                    },
                    device_list.reportError,
                    actions.GET_INSIGHT_HOMESETTINGS_PARAMS, []
                );
            }

        } else {
            var state = !data.state ? '--' : data.state,
                stateChangeTS = !data.stateChangeTS ? 0 : parseInt(data.stateChangeTS, 10),
                onFor = !data.onFor ? 0 : parseInt(data.onFor, 10),
                tttON = !data.tttOn ? 0 : parseInt(data.tttOn, 10),
                past14TotalTime = !data.past14TotalTime ? 0 : parseInt(data.past14TotalTime, 10),
                hrsConnected = !data.hrsConnected ? 0 : parseInt(data.hrsConnected, 10),
                avgPowerON = !data.avgPowerOn ? 0.0 : parseFloat(data.avgPowerOn),
                powerNow = !data.powerNow ? 0.0 : parseFloat(data.powerNow),
                todayTotalKWH = !data.todayTotalKwh ? 0.0 : parseFloat(data.todayTotalKwh),
                past14DaysKWH = !data.past14DaysKwh ? 0.0 : parseFloat(data.past14DaysKwh),
                powerThreshold = !data.powerThreshold ? '--' : data.powerThreshold;

            flagSuccess = true;
        }


        // 1. set labels
        var stateDurationLabel, sinceLabel, onTodayLabel, onAvgDayLabel;
        if (state == deviceStates.ON) {
            stateDurationLabel = wemo.items.Devices_Insight_Label_Time_For_On;
            sinceLabel = wemo.items.Devices_Insight_Label_Since_For_On;
            onTodayLabel = wemo.items.Devices_Insight_Label_Total_Today_For_On;
            onAvgDayLabel = wemo.items.Devices_Insight_Label_Avg_Today_For_On;
        } else {
            stateDurationLabel = wemo.items.Devices_Insight_Label_Time_For_OffStandby;
            onTodayLabel = wemo.items.Devices_Insight_Label_Total_Today_For_OffStandby;
            onAvgDayLabel = wemo.items.Devices_Insight_Label_Avg_Today_For_OffStandby;
            if (state == deviceStates.OFF) {
                sinceLabel = wemo.items.Devices_Insight_Label_Since_For_Off;
            } else if (state == deviceStates.STANDBY) {
                sinceLabel = wemo.items.Devices_Insight_Label_Since_For_Standby;
            } else {
                sinceLabel = ''; //should nether be here
            }
        }
        insight_panel.find('.state_duration_text').text(stateDurationLabel);
        insight_panel.find('.since_text').text(sinceLabel);
        insight_panel.find('.stat_left_block_today').text(onTodayLabel);
        insight_panel.find('.stat_left_block_avgday').text(onAvgDayLabel);
        insight_panel.find('[localString*="true"]').each(function() {
            $(this).html(wemo.items[$(this).attr('_key')]);
        });

        // 2. On now for:, Last on for: value
        var res = device_list.formatTimeInterval(onFor);
        insight_panel.find('.state_duration_entier_value').text(res.majorVal);
        insight_panel.find('.state_duration_entier_unit').text(res.majorText);
        insight_panel.find('.state_duration_fract_value').text(res.minorVal);
        insight_panel.find('.state_duration_fract_unit').text(res.minorText);

        // 3. Since date
        res = device_list.formatSinceDate(stateChangeTS);
        insight_panel.find('.since_time').text(res.value);
        insight_panel.find('.since_unit').text(res.unit);

        //4. on today
        res = device_list.formatTimeIntervalInDay(tttON);
        insight_panel.find('.on_today_hours').text(res.majorVal);
        insight_panel.find('.on_today_hours_unit').text(res.majorText);
        insight_panel.find('.on_today_min').text(res.minorVal);
        insight_panel.find('.on_today_min_unit').text(res.minorText);

        //5. on avg day
        var secondsIn2Weeks = 14 * 24 * 3600;
        if (hrsConnected > secondsIn2Weeks) {
            hrsConnected = secondsIn2Weeks;
        }
        var avgValue = hrsConnected < 12 * 3600 ? tttON : (24 * 3600 * past14TotalTime / hrsConnected);
        res = device_list.formatTimeIntervalInDay(avgValue);
        insight_panel.find('.on_avg_day_hours').text(res.majorVal);
        insight_panel.find('.on_avg_day_hours_unit').text(res.majorText);
        insight_panel.find('.on_avg_day_min').text(res.minorVal);
        insight_panel.find('.on_avg_day_min_unit').text(res.minorText);

        //6. change color of on today value if it is more than average
        if (tttON > avgValue) {
            insight_panel.find('.on_today').addClass('link_orange');
        } else {
            insight_panel.find('.on_today').removeClass('link_orange');
        }

        //7. estimated monthly cost
        var costPerKwh = parseFloat(insight_panel.attr('data-cost-per-kwh'));
        var currency = parseFloat(insight_panel.attr('data-currency'));
        console.log("**costPerKwh " + costPerKwh + " powerNow " + powerNow + " currency " + currency);
        var currency_sign = arrCurrency["1"];
        if (!isNaN(currency)) {
            currency_sign = arrCurrency[currency];
        }
        var monthlyCost;
        if (hrsConnected < 12 * 3600) {
            monthlyCost = hrsConnected === 0 ? 0 : (0.001 * powerNow * 730 * costPerKwh);
        } else {
            monthlyCost = (past14DaysKWH / hrsConnected) * (730 * 3600) * 0.00001667 * costPerKwh;
        }
        monthlyCost /= 1000;

        insight_panel.find('.est_month_value').text('- -');
        insight_panel.find('.est_month_unit').text('');

        if (monthlyCost < 0.01 || isNaN(monthlyCost) || isNaN(hrsConnected)) {
            insight_panel.find('.est_month_value').text('0.00');
            insight_panel.find('.est_month_unit').html(currency_sign);
        } else {
            insight_panel.find('.est_month_value').text(device_list.formatCostValue(monthlyCost));
            insight_panel.find('.est_month_unit').html(currency_sign);
        }

        //8. today cost
        var todayCost = todayTotalKWH * 0.00001667 * costPerKwh * 0.001;
        if ((todayCost >= 0 && todayCost < 0.01) || isNaN(todayCost)) {
            insight_panel.find('.cost_today_value').text('0.01');
            insight_panel.find('.cost_today_dollar_label').html(currency_sign);
        } else {
            insight_panel.find('.cost_today_value').text(device_list.formatCostValue(todayCost));
            insight_panel.find('.cost_today_dollar_label').html(currency_sign);
        }

        //9. avg power
        //simple calculation
        //insight_panel.find('.power_avg').text(device_list.formatPowerValue(avgPowerON));
        //advanced calculation from iOS code
        if (hrsConnected < 10 * 3600 || past14TotalTime === 0) {
            insight_panel.find('.power_avg').text('- -');
        } else {
            insight_panel.find('.power_avg').text(device_list.formatPowerValue((past14DaysKWH / (1000 * 60)) / (past14TotalTime / 3600) * 1000));
            insight_panel.find('.power_avg_text').text(wemo.items.Power_Unit);
        }

        //10. power now
        if (state == deviceStates.OFF) {
            insight_panel.find('.power_now').text('---');
            insight_panel.find('.power_now_text').text('');
        } else {
            insight_panel.find('.power_now').text(device_list.formatPowerValue(powerNow));
            insight_panel.find('.power_now_text').text(wemo.items.Power_Unit);
        }

        if ($(this).find("status") !== undefined) {
            state = $(this).find("status").text();
        }

        if (flagSuccess == true) {
            insight_panel.find('#insight_failure_container').hide();
            insight_panel.find('.insight_loader').hide();
            insight_panel.find('ul').show();
        } else {
            device_list.showInsightParamsErrorMsg(item_id, pluginId, macAddress);
            return;
        }

        if (state != deviceStates.OFF) {
            console.log("state != deviceStates.OFF");
            if (!isRemoteEnabled) {
                //schedule periodical update
                var timeout = insight_panel.attr('data-update-timeout');
                if (timeout == '') {
                    //schedule update in 1 sec

                    end_sec = new Date().getSeconds();
                    end_ms = new Date().getMilliseconds();
                    temp = end_sec - begin_sec;
                    if (temp == 0) {
                        var dif = end_ms - begin_ms;
                        t_out = 1000 - dif;
                    } else if (temp == 1) {
                        dif = (1000 - begin_ms) + end_ms;
                        dif > 1000 ? 0 : t_out = 1000 - dif;
                    } else {
                        t_out = 0;
                    }
                    wemoUtil.log("TIMEOUT begin_sec " + begin_sec + " begin_ms " + begin_ms + " end_sec " + end_sec + " end_ms " + end_ms + " dif " + dif);

                    insight_panel.attr('data-update-timeout', '' + setTimeout(function() {
                        device_list.fetchInsightDeviceData(item_id);
                    }, t_out));
                }
            } else {
                setTimeout(function() {
                    device_list.fetchInsightDeviceData(item_id, pluginId, macAddress);
                }, 0);
            }
        }
    },

    fetchInsightDeviceData: function(udn, pluginId, macAddress) {
        console.log('Fetching Insight device data for ' + udn);
        console.log('Fetching Insight device macAddress ' + macAddress);
        console.log('Fetching Insight device pluginId ' + pluginId);
        var panel = $('li[id="' + udn + '_stat"]');

        //reset update timeout
        var timeout = panel.attr('data-update-timeout');
        if (timeout != '') {
            clearTimeout(parseInt(timeout, 10));
            panel.attr('data-update-timeout', '');
        }

        if (isRemoteEnabled) {
            //TODO load data from cloud, then call device_list.fillInsightDeviceStatistic()
            cordova.exec(
                function(params) {
                    console.log("success call back" + params[1] + " : " + params[0]);
                    var homeId = params[1];
                    var authCode = params[0];
                    var request = device_list.buildXMLForGettingInsightParams(pluginId, macAddress);
                    console.log("*request " + request);
                    console.log("success call back home id: " + homeId);
                    console.log("success call back authCode: " + authCode);

                    $.ajax({
                        url: cloudAPI.INSIGHT_PARAMS,
                        data: request,
                        type: "POST",
                        beforeSend: function(xhr) {
                            xhr.setRequestHeader('Content-Type', 'application/xml');
                            xhr.setRequestHeader('Authorization', authCode);
                        },
                        success: function(data) {
                            console.log("**success callback from cloud");
                            var responseXML = (new XMLSerializer()).serializeToString(data);
                            var splitLength = 4000;
                            var length = responseXML.length;
                            var ittr = Math.floor(length / splitLength) + 1;
                            for (var i = 0; i < ittr; i++) {
                                var end = ((i + 1) * splitLength);
                                if (end > length) {
                                    end = length;
                                }
                                wemoUtil.log(TAG, 'fetchInsightDeviceData:' + responseXML.substring(splitLength * i, end));
                            }

                            device_list.fillInsightDeviceStatistic(udn, data, pluginId, macAddress);
                        },
                        error: function(xhr, textstatus) {
                            wemoUtil.infoLog(TAG, '*status: ' + xhr.status);
                            wemoUtil.infoLog(TAG, '*status text: ' + xhr.statusText);
                            device_list.showInsightParamsErrorMsg(udn, pluginId, macAddress);
                        }
                    });

                },
                function(err) {
                    console.log("failure call back");
                    device_list.showInsightParamsErrorMsg(udn, pluginId, macAddress);
                },
                "WebServicePlugin",
                "getAuthCode", []
            );
        } else {
            if (!panel.attr('data-cost-per-kwh')) {
                devicePlugin.execute(function(cur_value) {
                        var costPerKwh = parseFloat(cur_value['EnergyPerUnitCost']) / 1000;
                        var currency = cur_value['Currency'];
                        panel.attr('data-cost-per-kwh', costPerKwh);
                        panel.attr('data-currency', currency);
                        device_list.getInsightParams(udn);
                    },
                    device_list.reportError,
                    actions.GET_ENERGY_PER_UNIT_COST, [udn]
                );
            } else {
                device_list.getInsightParams(udn);
            }
            begin_sec = new Date().getSeconds();
            begin_ms = new Date().getMilliseconds();


            //TODO stub
            /*
             setTimeout(function(){
             device_list.fillInsightDeviceStatistic(udn, {
             "onFor": "0",
             "past14TotalTime": "0",
             "tttOn": "0",
             "notifyType": "BinaryState",
             "state": "8",
             "past14DaysKwh": "1030000",
             "stateChangeTS": "1377519149",
             "hrsConnected": "389933",
             "todayTotalKwh": "0",
             "powerNow": "100",
             "avgPowerOn": "50",
             "listen": "state_change",
             "udn": "uuid:Insight-1_0-221317K12A0006"
             });
             }, 100);*/
        }
    },

    getInsightParams: function(udn) {
        deviceTabPlugin.execute(function(data) {
                device_list.fillInsightDeviceStatistic(udn, data);
            },
            function() {
                device_list.fillInsightDeviceStatistic(udn, {});
            },
            actions.GET_INSIGHT_PARAMS, [udn]);
    },

    showInsightParamsErrorMsg: function(item_id, pluginId, macAddress) {
        var panel = $('li[id="' + item_id + '_stat"]');
        panel.find('.insight_loader').hide();
        panel.find('#insight_failure_container').show();
        $("#insight_failure_container_retry_button").on("tap", function(event) {
            console.log(TAG + 'showInsightParamsErrorMsg():: ' + 'retry button is tapped');
            panel.find('.insight_failure_container').hide();
            panel.find('.insight_loader').show();
            device_list.fetchInsightDeviceData(item_id, pluginId, macAddress);
        });
    },

    onDeviceStateChange: function(deviceStr) {
        if (window.jQuery) {
            console.log('EVENT onDeviceStateChange, got: ' + deviceStr);
            var message = JSON.parse(deviceStr);

            if (device_list.DeviceStateChangedTS == null || device_list.DeviceStateChangedTS == undefined) {
                device_list.DeviceStateChangedTS = {};
            }
            device_list.DeviceStateChangedTS[message.udn] = new Date().getTime();
            var itemID = '[id="' + message.udn + '"]';
            var tmpDev = WeMoDeviceList.getDevice(message.udn);
            var oooh = true;

            if ((message.udn).search("Bridge") != -1 || (message.udn).search("Bridge") == true) {
                console.log("entering in bridge notifications");
                device_list_bridge.changeLedValues(message);
            }

            if (tmpDev) {
                if (!isEditMode && (tmpDev.type == wemoSensor.TYPE || tmpDev.type == wemoNetCam.TYPE || tmpDev.type == wemoLinkCam.TYPE)) {
                    console.log("notify type: " + message[key.NOTIFY_TYPE] + " new state Inside : " + message.state + " for " + message.udn);
                    var motion = "";
                    switch (message.state) {
                        case "0":
                            console.log("@@@@@@ notify type: " + "Case 0 : " + message[key.NOTIFY_TYPE] + " new state: " + message.state + " for " + message.udn);
                            motion = wemo.items['Devices_Sensor_NoMotionSensed']; //No Motion
                            oooh = false;
                            break;
                        case "1":
                            console.log("@@@@@@ notify type: " + "Case 1 : " + message[key.NOTIFY_TYPE] + " new state: " + message.state + " for " + message.udn + "Flag : " + oooh);
                            if (oooh) {
                                motion = wemo.items['Devices_Sensor_MotionWasSensed']; //Motion ooh
                                setTimeout(function() {
                                    $(itemID).find("[name='sub_title']").html(wemo.items['Devices_Sensor_MotionSensed']); //Motion AFTER A SECOND
                                    //$(".sensorStatus").css("color", "#73d44c");
                                    $(itemID).find("[name='sub_title']").css("color", "#73d44c");
                                }, timeout.ONE_SECOND);
                            } else {
                                motion = wemo.items['Devices_Sensor_MotionSensed']; //Motion
                            }
                            oooh = false;
                            device_list.arrTimestampForRemote[message.udn] = (new Date()).getTime();
                            sharedPreferences.set(sharedPreferencesConstants.WEMO_NAMESPACE, sharedPreferencesConstants.TIMESTAMP_FOR_REMOTE, JSON.stringify(device_list.arrTimestampForRemote));

                            break;
                        case "2":
                            motion = wemo.items['Devices_Remote_NotDetected']; //Not Detected
                            break;
                        case "3":
                            motion = wemo.items['Devices_Remote_NotDetected']; //Not Detected
                            break;
                        default:
                            motion = wemo.items['SensorNotPresent']; //Sensor is not present
                    }
                    console.log("sensor state change to: " + motion);
                    setTimeout(function() {
                        $(itemID).find("[name='sub_title']").html(motion);
                        console.log("Motions_Log...itemIDmotion" + motion);
                        if ((motion == wemo.items['Devices_Sensor_MotionWasSensed']) || (motion == wemo.items['Devices_Sensor_MotionSensed'])) {
                            $(itemID).find("[name='sub_title']").css("color", "#73d44c"); //$(".sensorStatus").css("color", "#73d44c");
                        } else {
                            $(itemID).find("[name='sub_title']").css("color", "#595959");
                            //$(".sensorStatus").css("color", "#595959");
                        }
                    }, timeout.SHORT);
                } else {
                    if (message.state != '-1') {
                        if (tmpDev.type == wemoMaker.TYPE) {
                            tmpDev.makerAttributeList = message.attributeList;
                            if (message.attributeList.Switch != undefined)
                                message.state = message.attributeList.Switch.value;
                            else
                                message.state = "0";

                            if (window.sessionStorage.getItem("momentary_sign" + message.udn) == "1") {

                                console.log("::Momentary Sign::::" + window.sessionStorage.getItem("momentary_sign" + message.udn));
                                setTimeout(function() {

                                    window.sessionStorage.removeItem("momentary_sign" + message.udn);

                                    $(itemID).find(".device_state").removeClass('switch_on');
                                    $(itemID).find(".device_state").addClass('switch_off');

                                    WeMoDeviceList.updateState(message.udn, deviceStates.OFF);
                                    if (!isEditMode) {
                                        device_list.updateDeviceItem(message.udn);
                                    }


                                }, timeout.MOMENTORY_MODE_TIME);
                            }

                        }
                        WeMoDeviceList.updateState(message.udn, message.state);
                    }

                }
                if (!isEditMode) {
                    device_list.updateDeviceItem(message.udn);
                }
            }

            if (WeMoDeviceList.getCountActiveDevices() > 0) modifyDeviceController.show();
            else modifyDeviceController.hide();
        }
    },

    onDeviceAdded: function(deviceStr) {
        if (window.jQuery && $.mobile) {
            console.log('EVENT onDeviceAdded, got: ' + deviceStr);

            var applicanceInfoFetcher = new ApplicanceInfoFetcher();
            var device = JSON.parse(deviceStr);
            var tmpDevice;

            if (WeMoDeviceList.haveDevice(device.udn)) {
            	window.devicelistEvents.emit('fetchFromDeviceList' + device.udn, device);
                console.log("EVENT onDeviceAdded, is device available... Yes");
                tmpDevice = WeMoDeviceList.getDevice(device.udn);

                if (tmpDevice.remote) {
                    tmpDevice = new WeMoDevice(device.udn, device.type, device.friendlyName, device.iconUrl, device.state, false, 0, device.attributeList, device.modelName, device.customizedState, device.macAddress);
                } else {
                    if (device.friendlyName) {
                        tmpDevice.name = device.friendlyName;
                    }
                    if (device.state != undefined) {
                        tmpDevice.state = device.state;
                    }
                    if (device.iconUrl) {
                        tmpDevice.icon = device.iconUrl;                        
                        applicanceInfoFetcher.initialize(device.iconUrl);
                    }
                    if (device.type) {
                        tmpDevice.type = device.type;
                    }
                    if (device.attributeList) {
                        tmpDevice.makerAttributeList = device.attributeList;
                    }
                    if (device.customizedState != undefined) {
                        tmpDevice.customizedState = device.customizedState;
                    }
                    if (device.firmwareVersion != undefined) {
                        tmpDevice.firmwareVersion = device.firmwareVersion;
                    }
                    if (device.macAddress != undefined) {
                        tmpDevice.macAddress = device.macAddress;
                    }

                    if ((device.udn).indexOf('Bridge') != -1) {

                        var devicelist2 = window.sessionStorage.getItem(sessionStorage.LED_DEVICE_LIST_ARRAY);

                        if (devicelist2 != null && devicelist2 != undefined && $("#bridgeunavailable").is(":visible")) {
                            window.sessionStorage.removeItem(sessionStore.LED_FIRMWARE_MESSAGING);
                            device_list_bridge.multipleGetDeviceStatus(devicelist2);
                        }

                        $("#bridgeunavailable").hide();
                        $("ul li[data-category='bridge']").each(function() {

                            var itemid = $(this).attr('id');
                            var liname = $(this).attr('name');

                            if (liname == "switch_li") {
                                var inneritem = $(this).find('span[name="name_led_device_state"]');
                                var currID = inneritem.attr('id');
                                $("ul li[data-deviceid=" + currID + "]").find('.iconType').show();

                            } else if (liname == "group_li") {
                                var inneritem = $(this).find('span[name="name_group_state"]');
                                var currID = inneritem.attr('id');
                                $("ul li[data-deviceid=" + currID + "]").find('.iconType').show();
                            }

                        });

                    }
                }

                tmpDevice.cached = false;
                tmpDevice.inactive = false;
                tmpDevice.fwstatus = "";
                WeMoDeviceList.addDevice(device.udn, tmpDevice);
                if (tmpDevice.type == wemoNetCam.TYPE || tmpDevice.type == wemoNetCam.REMOTE_TYPE || tmpDevice.type == wemoLinkCam.TYPE || tmpDevice.type == wemoLinkCam.REMOTE_TYPE) {
                    device_list.renderDeviceList(isEditMode, true);
                } else {
                    device_list.updateDeviceItem(device.udn);
                }



            } else {
                console.log("EVENT onDeviceAdded, is device available... No");
                if (device.iconUrl) {                      
                    applicanceInfoFetcher.initialize(device.iconUrl);
                }
                tmpDevice = new WeMoDevice(device.udn, device.type, device.friendlyName, device.iconUrl, device.state, false, device.fwstatus, device.attributeList, device.modelName, device.customizedState, device.firmwareVersion, device.macAddress);
                WeMoDeviceList.addDevice(device.udn, tmpDevice);

                var arrayUDN = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
                if (arrayUDN)
                    arrayUDN = arrayUDN.split(",");
                for (var udnDevice in arrayUDN) {
                    if (device.udn === arrayUDN[udnDevice])
                        arrayUDN.splice(udnDevice, 1);
                }
                window.sessionStorage.setItem(sessionStore.DEVICE_LIST_UPDATE, arrayUDN);

                if ((device.udn).indexOf('Bridge') != -1) {
                    var devicelist2 = window.sessionStorage.getItem(sessionStorage.LED_DEVICE_LIST_ARRAY);

                    if (devicelist2 != null && devicelist2 != undefined && $("#bridgeunavailable").is(":visible"))
                        window.sessionStorage.removeItem(sessionStore.LED_FIRMWARE_MESSAGING);
                }

                device_list.renderDeviceList(isEditMode, true);
                console.log("onDeviceAdded >> the value of CHECK_FIRMWARE_UPGRADE_REQUIRED :: " + window.sessionStorage.getItem(sessionStore.CHECK_FIRMWARE_UPGRADE_REQUIRED));
                if (window.sessionStorage.getItem(sessionStore.CHECK_FIRMWARE_UPGRADE_REQUIRED) == "false") {
                    device_list.getDeviceFirmwareList(device.udn);
                }
            }
            if(isSpinnerGoing)
        	{
        		nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
        		isSpinnerGoing=false;
        	}
            if (window.sessionStorage.getItem(sessionStore.IS_UPGRADE_INPROGRESS) == "true")
                device_list.checkFirmwareUpgraded(device.udn);
            if(!fwUrlGoing)
            	device_list.fillFWUpgradeList();
            if (WeMoDeviceList.getCountActiveDevices() > 0) modifyDeviceController.show();
            else modifyDeviceController.hide();

            if (device.countdownEndTime != "") {
                WeMoDeviceUtils.countLoop(device.countdownEndTime, device.udn);
            }
        }
    },

    checkFirmwareUpgraded: function(udn) {
        console.log('checkFirmwareUpgraded is called' + udn);

        var firmwareData = window.sessionStorage.getItem(sessionStore.FIRMWARE_UPDATE_DATA);
        console.log("the value of FWUpgradeTimeInterval :: " + FWUpgradeTimeInterval);
        //if (FWUpgradeTimeInterval == 0)
            device_list.checkFirmwareUpdated(window.sessionStorage.getItem(sessionStore.DEVICE_COUNT), JSON.parse(firmwareData));

        var arrayUDN = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
        console.log("checkFirmwareUpgraded :: arrayUDN is ::" + arrayUDN);
        if (arrayUDN) {
            arrayUDN = arrayUDN.split(",");
            for (var udnDevice in arrayUDN) {
                console.log("checkFirmwareUpgraded :: udnDevice is ::" + arrayUDN[udnDevice] + "udn is:: " + udn);
                if (udn === arrayUDN[udnDevice])
                    device_list.startFwAnimation(udn);
            }
        } else {
            clearInterval(FWUpgradeTimeInterval);
            window.sessionStorage.setItem(sessionStore.IS_UPGRADE_INPROGRESS, "false");
        }
    },
    sendFWNotification : function(value,udn,deviceFWVersion){
   	 wemoUtil.infoLog("FirmwareUpdate", 'fwNotification: ' + value);
   	 devicePlugin.execute(
		            function(status){
		                wemoUtil.infoLog("FirmwareUpdate", 'fwNotification sent: ' + value);
		            },
		            device_list.reportError,
		            actions.ACTION_UPDATE_FW_NOTIFICATION,
		            [value,udn,deviceFWVersion]
		        );
    },
    startBulbUpdates: function(){
    	wemoUtil.infoLog(device_list.TAG, 'starting bulb updates');
    	var bulbDeviceArray=JSON.parse(window.sessionStorage.getItem(sessionStore.FIRMWARE_BULB_UPDATE_DATA));
    	if(bulbDeviceArray!=null){
    		devicePlugin.execute(
		            function(status){
		                wemoUtil.infoLog(device_list.TAG, 'LED devices added to the fw update queue: ' + bulbDeviceArray);
		            },
		            device_list.reportError,
		            actions.ACTION_UPDATE_FW_QUEUE,
		            [bulbDeviceArray,wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_BRIDGE_UDN)]
		        );
    	}
    },
    checkFirmwareUpdated: function(numOfDevices, firmwareUpgradeObject) {
    	wemoUtil.infoLog(device_list.TAG,"FW <> Check Firm Ware STARTED Successfully");
        var firmwareUpgradeData = window.sessionStorage.getItem(sessionStore.FIRMWARE_UPDATE_DATA);
        wemoUtil.infoLog(device_list.TAG,"FW <>  firmwareUpgradeData::  " + firmwareUpgradeData + " ::  numOfDevices :: " + numOfDevices + " :: updatedDevicesCount ::" + updatedDevicesCount);
        var timerCounter = 0;
        firmwareUpgradeData = JSON.parse(firmwareUpgradeData);

        FWUpgradeTimeInterval = setInterval(function() {
            timerCounter++;

            if (isRemoteEnabled) {
                cloudServices.getDeviceList(
                    function(data) {

                    	wemoUtil.infoLog(device_list.TAG,"FW <>  Sucess firmware response cloud..." + data);

                        var deviceFirmwareArray = [];
                        $(data).find('device').each(function() {
                            var device_type = $(this).find("modelCode").text();
                            var device_plugin_id = $(this).find("pluginId").text();

                            wemoUtil.infoLog(device_list.TAG,'FW <>  plugin ID: ' + $(this).find("pluginId").text());
                            deviceObject = {};
                            deviceFriendlyName = '';
                            deviceUDN = '';
                            for (index in firmwareUpgradeObject) {
                                var object = firmwareUpgradeObject[index];
                                if (object[key.DEVICE_PLUGIN_ID] === $(this).find("pluginId").text()) {
                                    deviceObject[key.DEVICE_FRIENDLY_NAME] = object[key.DEVICE_FRIENDLY_NAME];;
                                    deviceObject[key.DEVICE_FIRMWARE] = $(this).find("firmwareVersion").text();
                                    deviceObject[key.DEVICE_FIRMWARE_STATUS] = $(this).find("fwUpgradeStatus").text();
                                    deviceObject[key.DEVICE_UDN] = object[key.DEVICE_UDN];
                                    
                                    //if (device_type == wemoLed.REMOTE_TYPE || device_type == ledModelcode.LED || device_type == ledModelcode.OSRAM) {
                                    
                                    if(device_type == wemoLed.REMOTE_TYPE || wemoUtil.isSupportedLedModelCode(device_type)) {
                                        var msg = device_list.firmwareUpgradeMessageRemote(deviceObject[key.DEVICE_FIRMWARE_STATUS]);

                                        if (bridgeFirmwareFlag == true)
                                            msg = bridgeFirmwareStatus;
                                        else
                                            msg = device_list.firmwareUpgradeMessageRemote(deviceObject[key.DEVICE_FIRMWARE_STATUS]);


                                        var groupId = "";

                                        $(this).find('groupProfile').each(function(i) {
                                            var groupname = $(this).find("groupName").text();
                                            groupId = $(this).find("referenceId").text();
                                            var groupuniqeId = $(this).find("id").text();
                                        });

                                        if (groupId == "" && deviceObject[key.DEVICE_FIRMWARE_STATUS] != firmwareMessagingEnum.FOUR) {
                                            $("ul li[data-deviceid=" + device_plugin_id + "]").find(".sliderValue").addClass('firmwareMsg');
                                            $("ul li[data-deviceid=" + device_plugin_id + "]").find(".sliderValue").text(msg);
                                            $("ul li[data-deviceid=" + device_plugin_id + "]").find('.iconType').hide();
                                        }

                                    }

                                    break;
                                }
                            }
                            wemoUtil.infoLog(device_list.TAG,"FW <>  firmware current version object data: " + JSON.stringify(deviceObject));
                            if (JSON.stringify(deviceObject) != "{}")
                                deviceFirmwareArray.push(deviceObject);
                        });
                        wemoUtil.infoLog(device_list.TAG,"FW <>  firmware current version array: " + JSON.stringify(deviceFirmwareArray));
                        wemoUtil.infoLog(device_list.TAG,"FW <>  firmware current version array.length: " + deviceFirmwareArray.length);
                        if (deviceFirmwareArray.length > 0) {
                            $.each(firmwareUpgradeData, function(udn, obj1) {
                            	wemoUtil.infoLog(device_list.TAG,"FW <> udn to be upgrade is ::" + udn + " and new firmware version to upgrade is :: " + firmwareUpgradeData[udn].newFirmwareVersion);
                            	for (var k in deviceFirmwareArray) {
                            		wemoUtil.infoLog(device_list.TAG,"FW <>  fwUpgradeStatus: " + deviceFirmwareArray[k][key.DEVICE_FIRMWARE_STATUS]);
                            		wemoUtil.infoLog(device_list.TAG,"FW <>  UDN:  " + udn + " and firmware version is:: " + deviceFirmwareArray[k][key.DEVICE_FIRMWARE]);
                            		if (udn === deviceFirmwareArray[k][key.DEVICE_UDN] && deviceFirmwareArray[k][key.DEVICE_FIRMWARE_STATUS] == firmwareMessagingEnum.FOUR) {
                            			device_list.sendFWNotification(firmwareMessagingEnum.FOUR,udn,deviceFirmwareArray[k][key.DEVICE_FIRMWARE]);
                            			var sessionStorefirmwareVersion = firmwareUpgradeData[udn].newFirmwareVersion;
                            			wemoUtil.infoLog(device_list.TAG,"FW <>  FIRMWARE:  " + deviceFirmwareArray[k][key.DEVICE_FIRMWARE] + " === " + sessionStorefirmwareVersion);
                            			var searchResult = sessionStorefirmwareVersion.search(deviceFirmwareArray[k][key.DEVICE_FIRMWARE]);
                            			wemoUtil.infoLog(device_list.TAG,"searchResult is::  " + searchResult);
                            			if (searchResult >= 0 && searchResult != -1) {
                            				if (udn.indexOf('Bridge') != -1) {
                            					var message = device_list.firmwareUpgradeMessageRemote(deviceFirmwareArray[k][key.DEVICE_FIRMWARE_STATUS]);
                            					$("ul li[data-category='bridge']").find(".sliderValue").text(message);
                            				}

                            				wemoUtil.infoLog(device_list.TAG,"FW <>  firmware is Updated+checkFirmwareUpdated");
                            				var arrayUDN = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
                            				if (arrayUDN)
                            					arrayUDN = arrayUDN.split(",");
                            				for (var udnDevice in arrayUDN) {
                            					if (udn === arrayUDN[udnDevice]){
                            						arrayUDN.splice(udnDevice, 1);
                            						if (udn.indexOf('Bridge') != -1) {
                            							wemoUtil.infoLog(device_list.TAG,"FW <>  link update completed");
        		    									device_list.startBulbUpdates();
                            						}
                            					}
                            				}
                            				window.sessionStorage.setItem(sessionStore.DEVICE_LIST_UPDATE, arrayUDN);
                            				delete firmwareUpgradeData[udn];
                            				updatedDevicesCount++;
                            			} else {
                            				wemoUtil.infoLog(device_list.TAG,"FW <>  firmware is not supported");
                            			}
                                    } else if (udn === deviceFirmwareArray[k][key.DEVICE_UDN] && deviceFirmwareArray[k][key.DEVICE_FIRMWARE_STATUS] == firmwareMessagingEnum.FIVE) {
                                        var sessionStorefirmwareVersion = firmwareUpgradeData[udn].newFirmwareVersion;
                                        wemoUtil.infoLog(device_list.TAG,"FW <>  FIRMWARE:  " + deviceFirmwareArray[k][key.DEVICE_FIRMWARE] + " === " + sessionStorefirmwareVersion);
                                        var searchResult = sessionStorefirmwareVersion.search(deviceFirmwareArray[k][key.DEVICE_FIRMWARE]);
                                        wemoUtil.infoLog(device_list.TAG,"searchResult is::  " + searchResult);
                                        if (searchResult >= 0 && searchResult != -1) {
                                        	wemoUtil.infoLog(device_list.TAG,"FW <>  firmware is Updated+checkFirmwareUpdated");
                                            var arrayUDN = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
                                            if (arrayUDN)
                                                arrayUDN = arrayUDN.split(",");
                                            for (var udnDevice in arrayUDN) {
                                                if (udn === arrayUDN[udnDevice])
                                                    arrayUDN.splice(udnDevice, 1);
                                            }
                                            window.sessionStorage.setItem(sessionStore.DEVICE_LIST_UPDATE, arrayUDN);
                                            delete firmwareUpgradeData[udn];
                                            updatedDevicesCount++;
                                            device_list.sendFWNotification(firmwareMessagingEnum.FIVE,udn,deviceFirmwareArray[k][key.DEVICE_FIRMWARE]);

                                            if (udn.indexOf('Bridge') != -1) {
                                                $(".bridge_unavailable_text").html(wemo.items['updatingWeMoLinkTitle']);
                                                $(".font-detail").html(wemo.items['updatingWeMoLinkDesc']);
                                                $("#bridgeunavailable").show();
                                            }

                                        } else {
                                        	wemoUtil.infoLog(device_list.TAG,"FW <>  firmware is not supported");
                                        }
                                    } else if (udn === deviceFirmwareArray[k][key.DEVICE_UDN] && deviceFirmwareArray[k][key.DEVICE_FIRMWARE_STATUS] == firmwareMessagingEnum.SIX) {
                                        var sessionStorefirmwareVersion = firmwareUpgradeData[udn].newFirmwareVersion;
                                        wemoUtil.infoLog(device_list.TAG,"FW <>  FIRMWARE:  " + deviceFirmwareArray[k][key.DEVICE_FIRMWARE] + " === " + sessionStorefirmwareVersion);
                                        var searchResult = sessionStorefirmwareVersion.search(deviceFirmwareArray[k][key.DEVICE_FIRMWARE]);
                                        wemoUtil.infoLog(device_list.TAG,"searchResult is::  " + searchResult);
                                        wemoUtil.infoLog(device_list.TAG,"FW <>  firmware is not Updated status 6");
                                        var arrayUDN = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
                                        if (arrayUDN)
                                            arrayUDN = arrayUDN.split(",");
                                        for (var udnDevice in arrayUDN) {
                                            if (udn === arrayUDN[udnDevice])
                                                arrayUDN.splice(udnDevice, 1);
                                        }
                                        window.sessionStorage.setItem(sessionStore.DEVICE_LIST_UPDATE, arrayUDN);
                                        delete firmwareUpgradeData[udn];
                                        updatedDevicesCount++;
                                        firmwareFailCount++;
                                        device_list.sendFWNotification(firmwareMessagingEnum.SIX,udn,deviceFirmwareArray[k][key.DEVICE_FIRMWARE]);
                                    }

                                }
                            });
                            wemoUtil.infoLog(device_list.TAG,"FW <>  :  updatedDevicesCount:  " + updatedDevicesCount + "  ::  numOfDevices:  " + numOfDevices);
                            if (updatedDevicesCount >= numOfDevices) {
                            	wemoUtil.infoLog(device_list.TAG,"FW <>  firmwareUpgradeData after del:  " + firmwareUpgradeData);
                                var checkCount = 0;
                                $.each(firmwareUpgradeData, function(udn, obj1) {
                                    checkCount++;
                                });
                                if (checkCount == 0) {
                                	wemoUtil.infoLog(device_list.TAG,"FW <>  is empty:  " + checkCount);
                                    clearInterval(FWUpgradeTimeInterval);
                                    window.sessionStorage.setItem(sessionStore.IS_UPGRADE_INPROGRESS, "false");
                                    window.sessionStorage.setItem(sessionStore.CHECK_FIRMWARE_UPGRADE_REQUIRED, "false");
                                    $('#new_fw_available').hide();
                                    $('#more_new_firmware').addClass('none');
                                } else {
                                	wemoUtil.infoLog(device_list.TAG,"FW <>  is not empty:  " + checkCount);
                                }
                            }
                        }
                    },

                    function(error) {
                    	wemoUtil.infoLog(device_list.TAG,"FW <>  failure call back" + error);
                    }, "load"
                );
            } else {
                var isFWFound = false,
                	currentDeviceListUpdate = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
                $.each(firmwareUpgradeData, function(udn, obj1) {
                    var sessionStorefirmwareVersion = firmwareUpgradeData[udn].newFirmwareVersion;
                    wemoUtil.infoLog(device_list.TAG,"FW <> udn to be upgrade is ::" + udn + " and new firmware version to upgrade is :: " + sessionStorefirmwareVersion);


                    if (udn.indexOf("uuid") != -1) {
                        devicePlugin.execute(
                            function(params) {
                            	wemoUtil.infoLog(device_list.TAG,"FW <>  Get FIRMWARE version response:  " + params + " === " + sessionStorefirmwareVersion);
                                if (params != "")
                                    var searchResult = sessionStorefirmwareVersion.search(params);
                                wemoUtil.infoLog(device_list.TAG,"searchResult is::  " + searchResult);
                                if (searchResult >= 0 && searchResult != -1) {
                                	wemoUtil.infoLog(device_list.TAG,"FW <>  firmware is Updated");
                                    var arrayUDN = window.sessionStorage.getItem(sessionStore.DEVICE_LIST_UPDATE);
                                    if (arrayUDN)
                                        arrayUDN = arrayUDN.split(",");
                                    for (var udnDevice in arrayUDN) {
                                        if (udn === arrayUDN[udnDevice])
                                            arrayUDN.splice(udnDevice, 1);
                                    }
                                    window.sessionStorage.setItem(sessionStore.DEVICE_LIST_UPDATE, arrayUDN);
                                    delete firmwareUpgradeData[udn];
                                    isFWFound = true;
                                    updatedDevicesCount++;
                                } else {
                                	wemoUtil.infoLog(device_list.TAG,"FW <>  firmware is not supported");
                                    isFWFound = false;
                                }
                            },
                            device_list.reportError,
                            actions.GET_FIRMWARE_VERSION_SRSS, [udn, "currFW"]
                        );
                    } else {
                    	if (currentDeviceListUpdate.indexOf(udn) == -1) {
             				delete firmwareUpgradeData[udn];
             			}
                    }
                });
                wemoUtil.infoLog(device_list.TAG,"FW <>  :  updatedDevicesCount:  " + updatedDevicesCount + "  ::  numOfDevices:  " + numOfDevices);
                if (updatedDevicesCount >= numOfDevices) {
                	wemoUtil.infoLog(device_list.TAG,"FW <>  firmwareUpgradeData after del:  " + firmwareUpgradeData);
                	
                    var checkCount = 0;
                    $.each(firmwareUpgradeData, function(udn, obj1) {
                        checkCount++;
                    });
                    if (checkCount == 0) {
                    	wemoUtil.infoLog(device_list.TAG,"FW <>  is empty:  " + checkCount);
                    	window.sessionStorage.setItem(sessionStore.IS_UPGRADE_INPROGRESS, "false");
                        window.sessionStorage.setItem(sessionStore.CHECK_FIRMWARE_UPGRADE_REQUIRED, "false");
                        window.sessionStorage.setItem(sessionStore.FIRMWARE_AVAILABLE, false);
                        $('#new_fw_available').hide();
                        $('#more_new_firmware').addClass('none');
                        clearInterval(FWUpgradeTimeInterval);
                    } else {
                    	wemoUtil.infoLog(device_list.TAG,"FW <>  is not empty:  " + checkCount);
                    }
                }
            }
        }, timeout.FIRMWARE_UPDATE_CHECK_LOOP);
    },

    checkSSIDBasedCache: function() {
    	wemoUtil.infoLog(device_list.TAG, 'checkSSIDBasedCache');
        nativeUtilPlugin.execute(
            function(currentSSID) {
            	wemoUtil.infoLog(device_list.TAG, 'checkSSIDBasedCache currentSSID: ' + currentSSID);
                nativeUtilPlugin.execute(
                    function(cacheSSID) {
                    	wemoUtil.infoLog(device_list.TAG, 'checkSSIDBasedCache cacheSSID: ' + cacheSSID);
                        if (cacheSSID == currentSSID) {
                        	wemoUtil.infoLog(device_list.TAG, 'checkSSIDBasedCache using device cache');
                            WeMoDeviceList.restoreFromCache(function() {
                                isCached = true;
                                WeMoDeviceList.updateCache();
                                device_list.renderDeviceList();
                                nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                            });
                        } else {
                        	wemoUtil.infoLog(device_list.TAG, 'checkSSIDBasedCache clearing cache and using afresh');
                            WeMoDeviceList.clear();
                            WeMoDeviceList.updateCache();
                            device_list.renderDeviceList();
                            device_list_bridge.clearLedCache();
                            nativeUtilPlugin.execute(null, null, actions.SET_CACHE_SSID, [currentSSID]);
                            nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                        }
                    },
                    null,
                    actions.GET_CACHE_SSID, []
                );

            },
            null,
            actions.GET_NETWORK_NAME, []
        );
    },
    checkARPBasedCache: function() {
    	wemoUtil.infoLog(device_list.TAG, 'checkARPBasedCache');
        nativeUtilPlugin.execute(
            function(currentARPMac) {
            	wemoUtil.infoLog(device_list.TAG, 'checkARPBasedCache currentARPMac: ' + currentARPMac);
                if(currentARPMac==null||currentARPMac=='')
                {
                	device_list.checkSSIDBasedCache();
                }
                else
                {
                	nativeUtilPlugin.execute(
                			function(cacheARPMac) {
                				wemoUtil.infoLog(device_list.TAG, 'checkARPBasedCache cacheARPMac: ' + cacheARPMac);
                				if (cacheARPMac == currentARPMac) {
                					wemoUtil.infoLog(device_list.TAG, 'checkARPBasedCache using device cache');
                					WeMoDeviceList.restoreFromCache(function() {
                						isCached = true;
                						WeMoDeviceList.updateCache();
                						device_list.renderDeviceList();
                						nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                					});
                				} else {
                					wemoUtil.infoLog(device_list.TAG, 'checkARPBasedCache clearing cache and using afresh');
                					WeMoDeviceList.clear();
                					WeMoDeviceList.updateCache();
                					device_list.renderDeviceList();
                					device_list_bridge.clearLedCache();
                					deviceTabPlugin.execute(null, null, actions.RESET_ACTIVE_DEVICELIST, []);
                					nativeUtilPlugin.execute(null, null, actions.SET_CACHE_ARPMAC, [currentARPMac]);
                					nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                				}
                			},
                			null,
                			actions.GET_CACHE_ARPMAC, []
                	);
                }

            },
            null,
            actions.GET_CURRENT_ARPMAC, []
        );
    },
    collectEmail: function() {
    	wemoUtil.infoLog(device_list.TAG, "collectEmail");
        var collectEmails;
        nativeUtilPlugin.execute(
            function(enabled) {
            	wemoUtil.infoLog(device_list.TAG, "collectEmail Remote enabled: " + enabled);
                if (enabled) {
                    nativeUtilPlugin.execute(
                        function(emailIDs) {
                        	wemoUtil.infoLog(device_list.TAG, "collectEmail emailIDs: " + emailIDs);
                            if (emailIDs != null && emailIDs != "") {
                                collectEmails = JSON.parse(emailIDs);
                                wemoUtil.infoLog(device_list.TAG, "collectEmail parse data: " + collectEmails);
                                // Set Email
                                cloudServices.storeEmail(collectEmails);
                            }
                        },
                        null,
                        actions.GET_EMAIL, [0]
                    );
                }
                setTimeout(function() {
                    nativeUtilPlugin.execute(
                        function(emailIDs) {
                        	wemoUtil.infoLog(device_list.TAG, "collectEmail IT emailIDs: " + emailIDs);
                            if (emailIDs != null && emailIDs != "") {
                                collectEmails = JSON.parse(emailIDs);
                                wemoUtil.infoLog(device_list.TAG, "collectEmail IT parse data: " + collectEmails);
                                // Set Email
                                cloudServices.storeEmailonITsever(collectEmails);
                            }
                        },
                        null,
                        actions.GET_EMAIL, [1]
                    );
                }, 100);
            },
            null,
            actions.PREF_IS_REMOTE_ENABLED, []
        );
    },
    setAttributes: function(udn, setattributelist) {
        deviceTabPlugin.execute(
            function(value) {
                device_list.changeValues(value);
            },
            null,
            actions.SET_ATTRIBUTE_MAKER, [udn, setattributelist]
        );
    },
    buildAttributeListXml: function(switchValue) {
        attributeListJson = "<attribute><name>Switch</name>";
        attributeListJson = attributeListJson + "<value>" + switchValue + "</value></attribute>";
        attributeListJson = attributeListJson + "<attribute><name>Sensor</name>";
        attributeListJson = attributeListJson + "<value>null</value></attribute>";
        attributeListJson = attributeListJson + "<attribute><name>SwitchMode</name>";
        attributeListJson = attributeListJson + "<value>null</value></attribute>";
        attributeListJson = attributeListJson + "<attribute><name>SensorPresent</name>";
        attributeListJson = attributeListJson + "<value>null</value></attribute>";
        return attributeListJson;
    },
    firmwareUpgradeMessageRemote: function(message) {
        var msg = "";

        if (message == firmwareMessagingEnum.ZERO) {
            msg = wemo.items['FirmwareMsgDownload'];
        } else if (message == firmwareMessagingEnum.ONE) {
            msg = wemo.items['FirmwareMsgDownloadSuccess'];
        } else if (message == firmwareMessagingEnum.TWO) {
            msg = wemo.items['FirmwareMsgDownloadFailed'];
        } else if (message == firmwareMessagingEnum.THREE) {
            msg = wemo.items['FirmwareMsgUpgrading'];
        } else if (message == firmwareMessagingEnum.FOUR) {
            msg = wemo.items['FirmwareMsgUpgraded'];
        } else if (message == firmwareMessagingEnum.FIVE) {
            msg = wemo.items['FirmwareMsgUpgraded'];
        } else if (message == firmwareMessagingEnum.SIX) {
            msg = wemo.items['FirmwareMsgUpgradeFail'];
        }

        return msg;
    }

};
