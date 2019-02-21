/*

\ more_menu.js

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
  moreMenu.initialize();
  networkConnection.initializeNetworkMsg();
});

var moreMenuList = [{
  category: 'CategorySettings',
  list: [{
    key: 'NewFirmwareAvailable',
    id: 'more_new_firmware',
    extra: ['special']
  }, {
    key: 'RemoteAccess',
    id: 'more_remote_access',
    extra: ['remote']
  }, {
    key: 'SettingsAndAbout',
    id: 'more_settings_and_about'
  }, {
    key: 'ConnectToIFTTT',
    id: 'more_connect_to_IFTTT'
  }, {
      key:'ConnectToNest',
      id: 'more_connect_to_nest'
    }, {
      key:'ConnectToAlexa',
      id: 'more_connect_to_alexa'
    }]
}, {
  category: 'CategoryAddWeMoDevice',
  list: [{
    key: 'findandpairNewdevice',
    id: 'find_and_pair_Newdevice'
  }, {
    key: 'SetUpAnotherDevice',
    id: 'more_setup_another_device'
  }]
}, {
  category: 'CategorySupportFeedback',
  list: [{
    key: 'LearnAboutWemo',
    id: 'more_LearnAboutWemo'
    },{
      key: 'WeMoCommunity',
      id: 'more_WeMoCommunity'
    }, {
      key: 'SupportArticles',
      id: 'more_SupportArticles'
    },
    {
      key: 'GetInTouchWithUs',
      id: 'more_get_in_touch_with_us'
    },
//    {
//        key: 'TellUsWhatYouThink',
//        id: 'more_tell_us_what_you_think'
//    },
    //{
    //  key: 'ReportaProblem',
    //  id: 'tellus_report_problem'
    //},
    {
      key: 'RateWeMoontheAppStore',
      id: 'tellus_rate_wemo_app'
    }
  ]
}];

var isRemoteEnabled = false;

var wemo = wemo || {};
var disableNetworkWatchdog = false;

var moreMenu = {
  TAG: "more_menu.js",

  remoteAccess: {
    isEnabled: false,
    onLocalRouter: false,
    onRemoteRouter: false,
    updateStatus: function(enabled) {
      wemoUtil.infoLog(moreMenu.TAG, "remoteAccess.updateStatus: " + enabled);
      moreMenu.remoteAccess.isEnabled = enabled;
      var selector = $('li#more_remote_access > span.status');
      (enabled) ? selector.html(wemo.items['Enabled']): selector.html(wemo.items['NotEnabled']);
    },
    checkStatus: function() {
      wemoUtil.infoLog(moreMenu.TAG, "remoteAccess.checkStatus");
      deviceTabPlugin.execute(
        moreMenu.remoteAccess.updateStatus,
        moreMenu.reportError,
        actions.IS_REMOTE_ENABLED, []
      );
    },
    initialize: function() {
      var self = moreMenu.remoteAccess;
      self.onLocalRouter = (window.sessionStorage.getItem(sessionStore.REMOTE_LOCAL) == "true") ? true : false;
      self.onRemoteRouter = (window.sessionStorage.getItem(sessionStore.REMOTE_MODE) == "true") ? true : false;
      self.isEnabled = (self.onRemoteRouter || self.onLocalRouter) ? true : false;
      isRemoteEnabled = self.onRemoteRouter;
    }
  },

  createMenu: function() {
    wemoUtil.infoLog(moreMenu.TAG, "createMenu");
    var konstante = {
      HIDE_LI: 'style="display:none"',
      REMOTE_ENABLED: '<span class="status item">' + wemo.items['Enabled'] + '</span>',
      REMOTE_DISABLED: '<span class="status item">' + wemo.items['NotEnabled'] + '</span>'
    };
    var portions = '';
    for (var i = 0; i < moreMenuList.length; i++) {
      var list = wemoUtil.templator.fitIn('<li data-role="list-divider" class="category"><span>[0]</span></li>', [
        wemo.items[moreMenuList[i]['category']]
      ]);
      for (var j = 0; j < moreMenuList[i]['list'].length; j++) {
        var extra = (moreMenuList[i]['list'][j].hasOwnProperty('extra')) ? moreMenuList[i]['list'][j]['extra'] : [];
        list += wemoUtil.templator.fitIn('<li id="[1]" [3]><span class="item [2]">[0]</span><span class="arrowIcon"></span>[4]</li>', [
          wemo.items[moreMenuList[i]['list'][j]['key']],
          moreMenuList[i]['list'][j]['id'], (extra.length > 0 && extra.indexOf('special') >= 0) ? 'special' : '', (extra.length > 0 && extra.indexOf('hidden') >= 0) ? konstante.HIDE_LI : '', (extra.length > 0 && extra.indexOf('remote') >= 0) ? ((moreMenu.remoteAccess.isEnabled) ? konstante.REMOTE_ENABLED : konstante.REMOTE_DISABLED) : '',
        ]);
      }
      portions += list;
    }
    var output = wemoUtil.templator.fitIn('<ul data-role="listview" data-inset="false" data-divider-theme="b">[0]</ul>', [
      portions
    ]);
    $('div#container').html(output);
    $('div#container ul').listview().listview('refresh');


    previousUrl = wemoUtil.getPreviousUrl();
    //temp fix for alpha build.
    if (previousUrl) {
      previousUrl = (previousUrl != null) ? previousUrl : 'file:///android_asset/www/device/device_list.html';
      previousUrl = previousUrl.substr(previousUrl.lastIndexOf('/') + 1, previousUrl.length);
    }
    if (!isRemoteEnabled && window.sessionStorage.getItem(sessionStore.IS_BRIDGE_PRESENT) == "true") {
      window.sessionStorage.setItem(sessionStore.PAIRED_DEVICES, "alreadypaired");
      $("#find_and_pair_Newdevice").show();
    } else {
      $("#find_and_pair_Newdevice").hide();
    }

    moreMenu.showFirmwareUpdate();

    $('#menuPageHeader .title').html(wemo.items["More"]);

    if (parseInt(isBetaApp) === 1) {
        $('#more_get_in_touch_with_us .item').html(wemo.items["ReportaProblem"]);
    }
  },

  showFirmwareUpdate: function() {

    var $firmware = $("#more_new_firmware");

    $firmware.hide();

    var inProgress = window.localStorage.getItem('firmwareUpdateInProgress');
    var available = window.sessionStorage.getItem('firmwareUpdateAvailable');

    /*if (inProgress) {
        $firmware
            .addClass("inProgress")
            .html(wemo.items["FirmwareUpdateInProgress"])
            .show();
    } else */
    if (available && !inProgress) {
      $firmware
        .addClass("available")
        .html('<span class="item">' + wemo.items["NewFirmwareAvailable"] + '</span><span class="arrowIcon"></span>')
        .show();
    }
  },

  bindEventsToMenuItems: function() {

    $('#more_setup_another_device').on('tap', function() {
      if (!isRemoteEnabled) {
        deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
      }

      // MINT
      if (window.Mint) {
        window.Mint.logEvent('MoreMenu-Setup Instructions Button');
      }
      wemoUtil.loadUrl(filePath.SETUP_DEVICE_DEMO + "?type=nopopup");
    });

    /**More remote Access**/
    $('#more_remote_access').on('tap', function() {
      if (!isRemoteEnabled) {
        deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
      }
      wemoUtil.loadUrl(filePath.REMOTE_ACCESS_MORE);
    });

    /**More Setting About**/
    $('#more_settings_and_about').on('tap', function() {
      if (!isRemoteEnabled) {
        deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
      }
      window.sessionStorage.setItem("loadMoreMenu", true);
      wemoUtil.loadUrl(filePath.MORE_SETTING_ABOUT);

    });

    /**More Tutorials**/
    $('#more_LearnAboutWemo').on('tap', function() {
        if (!isRemoteEnabled) {
         deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
        }
        wemoUtil.loadUrl(filePath.MORE_LEARN_ABOUT_WEMO);
    });

    /**More firmware Update**/
    $('#more_new_firmware').on('tap', function() {
      if (!isRemoteEnabled) {
        deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
      }

      var fwUpdateUrl = "",
        $this = $(this);

      if ($this.hasClass("available")) {
        fwUpdateUrl = filePath.DEVICE_LIST + '#page/wemo_devices/showFirmwareUpdate';
      } else if ($this.hasClass("inProgress")) {
        fwUpdateUrl = filePath.DEVICE_LIST + '#page/wemo_devices/showFirmwareUpdateInProgress'
      }

      wemoUtil.loadUrl(fwUpdateUrl);

    });

    /**More connect to IFTTT**/
    $('#more_connect_to_IFTTT').on('tap', function() {

      var iftttFlag = 0;
      var devices = WeMoDeviceList._deviceList;

      if (!isRemoteEnabled) {
        $.each(devices, function(udn) {
          if (devices[udn].inactive == false && devices[udn].modelName != "Bridge") {
            iftttFlag = 1;
          }
          window.sessionStorage.setItem("iftttFlag", iftttFlag);
        });
        deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
      } else {
        $.each(devices, function(udn) {
          if (devices[udn].inactive == false && devices[udn].type != "Bridge") {
            iftttFlag = 1;
          }
          window.sessionStorage.setItem("iftttFlag", iftttFlag);
        });
      }

      wemoUtil.loadUrl(filePath.MORE_IFTTT);
    });

    $('#more_connect_to_nest').on('tap', function() {
        wemoUtil.loadUrl(filePath.CONNECT_TO_NEST);
    });

    $('#more_connect_to_alexa').on('tap', function() {
        wemoUtil.loadUrl(filePath.CONNECT_TO_ALEXA);
    });

    /**More Tell us**/
    $('#more_tell_us_what_you_think').on('tap', function() {
      if (!isRemoteEnabled) {
        deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
      }
      //       deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
      wemoUtil.loadUrl(filePath.MORE_TELL_US);
    });

    /**More Get In Touch With us**/
    $('#more_get_in_touch_with_us').on('tap', function() {
        if (parseInt(isBetaApp) === 1) {
            $('#more_get_in_touch_with_us').html();
            var appVersion = window.localStorage.getItem("appVersion");
            window.location.href = "mailto:wemoproblemreports@belkin.com?subject="+appVersion+"-- BETA FEEDBACK ";
        } else {
            wemoUtil.loadUrl(filePath.GET_IN_TOUCH_WITH_US);
        }
    });

    /**More Help center**/
    $('#more_help_center').on('tap', function() {
      // wemoUtil.infoLog(moreMenu.TAG, "Help center  " + isRemoteEnabled);
      if (!isRemoteEnabled) {
        deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
      }
      window.sessionStorage.setItem(sessionStore.HELP_URL, wemo.items['Help_Url']);
      wemoUtil.loadUrl(filePath.HELP_CENTER);
    });

    $('#setup_help').on('tap', function() {
      wemoUtil.loadUrl(filePath.CONNECT_TO_HELP_PAGE);
    });

    /**More find new device**/
    $('#find_and_pair_Newdevice').on('tap', function() {
      wemoUtil.infoLog(moreMenu.TAG, "find new device  " + isRemoteEnabled);
      if (!isRemoteEnabled) {
        deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
      }
      wemoUtil.loadUrl(filePath.SETUP_BRIDGE);
    });

    /**More updating gradient value**/
    $('#gradient_Value').on('tap', function() {
      wemoUtil.infoLog(moreMenu.TAG, "updating gradient value  " + isRemoteEnabled);
      if (!isRemoteEnabled) {
        deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
      }
      wemoUtil.loadUrl(filePath.LED_UPDATE_GRADIENT_VALUE);
    });

    $('#more_WeMoCommunity').on('tap', function() {
      wemoUtil.infoLog(moreMenu.TAG, "More_WeMoCommunity");
      var link = wemo.items['Community_Link'];
      wemoUtil.loadExternalUrl(link);
    });

    $('#more_SupportArticles').on('tap', function() {
      wemoUtil.infoLog(moreMenu.TAG, "More_SupportArticles");
      var link = wemo.items['Help_Url'];
      wemoUtil.loadExternalUrl(link);
    });

    $("#tellus_rate_wemo_app").on("tap", function() {
      wemoUtil.infoLog(moreMenu.TAG, "tellus_rate_wemo_app");
      nativeUtilPlugin.execute(
        function(url) {
          wemoUtil.infoLog(moreMenu.TAG, "Open Play store: " + url);
          wemoUtil.loadExternalUrl(url);
        },
        moreMenu.reportError,
        actions.GET_PLAY_STORE_URL, []
      );
    });

    $("#tellus_report_problem").on("tap", function() {
      wemoUtil.infoLog(moreMenu.TAG, "tellus_report_problem");
      if (!isRemoteEnabled) {
        deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
      }
      wemoUtil.loadUrl(filePath.MORE_TELL_US);
    });

    $('div#container li').on('tap', function(e) {
      $('#' + e.target.id).addClass('clicked');
    });

  },

  initialize: function() {
    wemoUtil.infoLog(moreMenu.TAG, "initialize");
    document.addEventListener('deviceready', this.onDeviceReady, false);
  },


  onDeviceReady: function() {
    wemoUtil.infoLog(moreMenu.TAG, "onDeviceReady");
    moreMenu.bindEvents();

    $(".closeMenu").on("tap", moreMenu.onBackPress);

    moreMenu.remoteAccess.initialize();
    moreMenu.createMenu();
    moreMenu.remoteAccess.checkStatus();

    moreMenu.loadMenuPageContent();
  },

  loadMenuPageContent: function() {
    var isNetworkenabled = window.sessionStorage.getItem("isNetworkenabledKey") !== "false";
    if (isNetworkenabled) {
      moreMenu.bindEventsToMenuItems();
    } else {
      moreMenu.offlineOptions();
    }

    //if user load this menu with no network, show no network message
    var showRemoteDisableMsg = window.sessionStorage.getItem("showRemoteDisableMsg") === "true";
    if (showRemoteDisableMsg) {
      networkConnection.initializeRemoteModeMsg();
    }

    $(".networkMsgContainer").on("networkOFF", function() {
      //Disable all of the links except setup instructions when network is off
      $(".more_menu_container .ui-li-static").unbind("tap");
      moreMenu.offlineOptions();
    }).on("networkOn", function() {
      //enable all of the links when network is on
      moreMenu.bindEventsToMenuItems();
    });
  },

  offlineOptions: function() {
    //clickable link when device has no network
    $('#more_setup_another_device').on('tap', function() {
      if (!isRemoteEnabled) {
        deviceTabPlugin.execute(null, null, actions.STOP_DEVICE_LISTENERS, []);
      }
      wemoUtil.loadUrl(filePath.SETUP_DEVICE_DEMO);
    });
  },

  bindEvents: function() {
    wemoUtil.infoLog(moreMenu.TAG, "bindEvents");
    document.addEventListener('online', moreMenu.onOnline, false);
    document.addEventListener('offline', moreMenu.onOffline, false);
    document.addEventListener("backbutton", moreMenu.onBackPress, false);
    document.addEventListener("pause", moreMenu.onPause, false);
    document.addEventListener("resume", moreMenu.onResume, false);
  },

  onOffline: function() {
    wemoUtil.infoLog(moreMenu.TAG, "offLine");
  },

  onOnline: function() {
    wemoUtil.infoLog(moreMenu.TAG, "onLine");
  },

  onBackPress: function() {
    if (window.sessionStorage.getItem(smartReachability.NO_NETWORK_MODE) != stringBoolean.TRUE) {
      if ($(".more_tab").is(":visible")) {
        $(".more_tab").hide();
        $('body').find('.modalWindow').transition({
          opacity: 0
        }, 400, function() {
          $(this).removeClass('isOpen');
        });
      } else {
        wemoUtil.infoLog(moreMenu.TAG, "onBackPress");
        if(window.sessionStorage.getItem("ACTIVE_TAB") === "RULES"){
          wemoUtil.loadUrl(filePath.TEMP_RULE);
        }else{
          wemoUtil.loadUrl(filePath.DEVICE_LIST);
        }        
      }
    }
  },

  onPause: function() {
    wemoUtil.infoLog(moreMenu.TAG, "onPause");
  },

  onResume: function() {
    wemoUtil.infoLog(moreMenu.TAG, "onResume");
    //        networkWatchDog.last_state = '0';
    $('div#container li').removeClass('clicked');
    $('#edit_device').hide();
    $('#more_edit_rule').hide();
  },

  reportError: function(e) {
    wemoUtil.infoLog(moreMenu.TAG, "Plugin Error!!!!   " + e);
  }

};