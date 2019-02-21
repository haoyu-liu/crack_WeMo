/*
 setup_success_homesense_devices.js

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
var TAG = "setup_success_homesense_devices.js";


$(document).bind('pageinit', function() {
 	setupSuccess.initialize();
});

var pictureSource;
var destinationType;
var isRemoteEnabled = false;
var deviceID = "";
var friendlynameTextId = "";
var starttestmodeTimer = '';
var rememberWifi = '';
var resetId = '';
var rememberWifiId = '';
var populateContstype = "sessionstore";

$(document).ready(function () {
    var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));
});

var setupSuccess = {
    TAG : "setup_success_homesense_devices",
    
    initialize : function() {
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    
    onDeviceReady : function() {
    	wemoUtil.infoLog(setupSuccess.TAG, "device ready");
        setupSuccess.bindEvents();
        setupSuccess.setupDOMListeners();
        if(window.sessionStorage.getItem(sessionStore.REMOTE_MODE) == "true")
            isRemoteEnabled = true;
        
        wemoUtil.infoLog(setupSuccess.TAG, "Remote mode2: " + typeof  isRemoteEnabled);

        pictureSource = navigator.camera.PictureSourceType;
        destinationType = navigator.camera.DestinationType;

        var ledDeviceImg = '';
        
        nativeUtilPlugin.execute(function(deviceImg){
        	wemoUtil.infoLog(setupSuccess.TAG, 'success'+deviceImg);
                if(deviceImg.length > 0){
                	wemoUtil.infoLog(setupSuccess.TAG, 'deviceImg length'+deviceImg[0]);
                    ledDeviceImg=deviceImg[0];

                }else{
                	wemoUtil.infoLog(setupSuccess.TAG, 'Error device Img length');
                }
            },
            function(){wemoUtil.infoLog(setupSuccess.TAG, 'error');},
            ACTION_GET_LED_IMAGE_FROM_DB,
            [window.sessionStorage.getItem(sessionStore.HOME_SENSE_GROUP_ID)]
        );

        var imgSrc = ledDeviceImg;
        
        if(ledDeviceImg != null && ledDeviceImg.length > 0 && ledDeviceImg != "")
            $('.device_thumb').attr('src',imgSrc);
        else
            $('.device_thumb').attr('src',setupSuccess.getDfaultURI());
        
 
        var deviceType = window.sessionStorage.getItem(sessionStore.HOME_SENSE_DEVICE_TYPE);
        var deviceCapIDsandVal = JSON.parse(window.sessionStorage.getItem(sessionStore.HOMESENSE_CAPABILITY_ID_VALUES));
        wemoUtil.infoLog(setupSuccess.TAG, "deviceCapIDsandVal ***"+window.sessionStorage.getItem(sessionStore.HOMESENSE_CAPABILITY_ID_VALUES));
        
        if($.trim(deviceType) == $.trim(homeSenseModelCodes.DOORWINDOWS).toLowerCase())
        {
        	$("#Fobs").hide();
        	$("#pirsensors").hide();
        	$("#alarm").hide();
        	$("#doorswindows").show();
        	
        	var friendlyname = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME);
          	var deviceID = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS);
        	var groupName = window.sessionStorage.getItem(sessionStore.HOME_SENSE_GROUP_NAME);
            	
            $("#homesense_device_friendly_name_f7c038").val(groupName);
            friendlynameTextId = "#homesense_device_friendly_name_f7c038";
            rememberWifi = "#flip_doorswindows";
            rememberWifiId = "#wifisettings_doorswindows";
            resetId = "#resetdevice_doorswindows";
            
            wemoUtil.infoLog(setupSuccess.TAG, " DOORS ::"+window.sessionStorage.getItem(sessionStore.DEVICE_GROUP_SELECTED_IDS));
            deviceID = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS);
         
            if(deviceID != "" && deviceID != undefined)
            {
            	deviceID = deviceID.split(",");
            	friendlyname = friendlyname.split(",");
            	var listItem = "";
            	var statusClass = "door-Closed";
            	
            	for(var i=0; i<deviceID.length; i++)
            	{
            		if(deviceCapIDsandVal[deviceID[i]] != undefined){
	            		var devicestatus = deviceCapIDsandVal[deviceID[i]].capabilitieval;
            			if(devicestatus == statusCode.OFF){
            				statusClass = "door-Open";
            			}else if(devicestatus == statusCode.ON){
            				statusClass = "door-Closed";
            			}else{
            				statusClass = "door-Closed";
            			}
            		}
     
            		listItem +='<div class="borderwithpadding '+statusClass+'" id="parentDiv'+deviceID[i]+'">'+
            				   '<div class="text_strong paddingLeft">'+
            				   '<input id="'+deviceID[i]+'" type="text" value="'+friendlyname[i]+'" class="sensorTextDoor" pattern="[A-Za-z0-9 _-]*" maxlength="30"/></div>'+
            				   '</div>';
            	}
            	
            	$("#list_sensordevices").html(listItem);
            }
    
        }
        else if($.trim(deviceType) == $.trim(homeSenseModelCodes.KEYFOB).toLowerCase())
        {
        	$("#doorswindows").hide();
        	$("#pirsensors").hide();
        	$("#alarm").hide();
        	$("#Fobs").show();
        	var friendlyname = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME);
        	var deviceID = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
        	$("#homesense_device_friendly_name_f7c039").val(friendlyname);
        	$('#device_type').html(wemo.items['Led_EditDevice_DeviceID']+" "+deviceID);
        	friendlynameTextId = "#homesense_device_friendly_name_f7c039";
        	rememberWifi = "#flip_Fobs";
            rememberWifiId = "#wifisettings_Fobs";
            resetId = "#resetdevice_Fobs";
        
        }
        else if($.trim(deviceType) == $.trim(homeSenseModelCodes.PIR).toLowerCase())
        {
        	$("#doorswindows").hide();
        	$("#Fobs").hide();
        	$("#alarm").hide();
        	$("#pirsensors").show();
        	var friendlyname = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME);
        	var deviceID = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
        	$("#homesense_device_friendly_name_f7c041").val(friendlyname);
        	$('#device_type_pir').html(wemo.items['Led_EditDevice_DeviceID']+" "+deviceID);
        	friendlynameTextId = "#homesense_device_friendly_name_f7c041";
        	rememberWifi = "#flip_pirsensors";
        	rememberWifiId = "#wifisettings_pirsensors";
            resetId = "#resetdevice_pirsensors";
        }
        else if($.trim(deviceType) == $.trim(homeSenseModelCodes.ALARM).toLowerCase())
        {
        	$("#doorswindows").hide();
        	$("#Fobs").hide();
        	$("#pirsensors").hide();
        	$("#alarm").show();
        	var friendlyname = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME);
        	var deviceID = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
        	$("#homesense_device_friendly_name_f7c040").val(friendlyname);
        	$('#device_type_Id').html(wemo.items['Led_EditDevice_DeviceID']+" "+deviceID);
        	friendlynameTextId = "#homesense_device_friendly_name_f7c040";
        	rememberWifi = "#flip_alarm";
        	rememberWifiId = "#wifisettings_alarm";
            resetId = "#resetdevice_alarm";
        	
        	wemoUtil.infoLog(setupSuccess.TAG, "PAIRED_DEVICES ***"+window.sessionStorage.getItem(sessionStore.PAIRED_DEVICES));
        	
        	 if(window.sessionStorage.getItem(sessionStore.PAIRED_DEVICES) == "alreadypaired"){
        		 if(window.sessionStorage.getItem(sessionStore.RESET_OPTIONS_FLAG) == "true"){
        			 nativeUtilPlugin.execute(null,null,actions.SHOW_PROGRESS,[]);
        			 nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", wemo.items['EmergencyContactsLoading']]);
        			 setupSuccess.populateContacts(populateContstype);
        		 }else{
        			 nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", wemo.items['EmergencyContactsLoading']]);
        			 setupSuccess.populateContacts("");
        		 }
        		 
        	 }
        		
        }
        else
        	wemoUtil.loadUrl(filePath.DEVICE_LIST);
     
        if(window.sessionStorage.getItem(sessionStore.DEVICE_SUCCESS) == "sucesspage")
        {
        	 $("#editdevice").hide();
             $("#successpage").show();
             $(resetId).hide();
             $(rememberWifiId).show();
             $("#editfooter").hide();
             $("#footer").show();
        }
        else
        {
        	 $("#successpage").hide();
        	 $("#editdevice").show();
        	 $(rememberWifiId).hide();
         	 $(resetId).show();
         	 $("#footer").hide();
             $("#editfooter").show();
        }
    
    },
    
    
    bindEvents : function() {
    	wemoUtil.infoLog(setupSuccess.TAG, "bind events");
        document.addEventListener('offline', setupSuccess.onOffline, false);
        document.addEventListener('online', setupSuccess.onOnline, false);
        document.addEventListener("backbutton", setupSuccess.onBackPress, false);
        document.addEventListener("resume", setupSuccess.onResume, false);

    },

    onBackPress : function() {
    	wemoUtil.infoLog(setupSuccess.TAG, "back button pressed");
         if($('.overlayScrollPicker').is(':visible')){
        	 wemoUtil.infoLog(setupSuccess.TAG, "Dialog box is open");
        	 $('.overlayScrollPicker').hide();
        }else{
            window.sessionStorage.clear();
            navigator.app.clearHistory();
            setupPlugin.execute(null, null, ACTION_STOP_UPNP_SERVICE, []);
            navigator.app.exitApp();
        }
    },

    onResume : function() {
    	wemoUtil.infoLog(setupSuccess.TAG, "resumed");
    },

    onOffline : function() {
    	wemoUtil.infoLog(setupSuccess.TAG, "offLine");
    },

    onOnline : function() {
    	wemoUtil.infoLog(setupSuccess.TAG, "onLine");
    },

    reportError : function(e) {
    	nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
    	wemoUtil.infoLog(setupSuccess.TAG, "Plugin Failure Call back!!!!   " + e);
    },
    
    setupDOMListeners : function (){
        wemoUtil.infoLog(setupSuccess.TAG, 'setupDOMListeners');

        $('.device_thumb').on('click', function(event) {

            /*$('#select_photo_popup').popup();
            $('#select_photo_popup').show();
            $('#select_photo_popup').popup('open');*/
            $("#gosh_message").popup('open');

        });

        $('#photo_pick_option').on('click', '> li', function() {
            $('#select_photo_popup').attr('data-go-forward', 'true');

            var selected_id = $(this).attr('id');
            wemoUtil.infoLog(setupSuccess.TAG, "Photo selection option: " + selected_id);
            if (selected_id === 'take_photo') {
            	$("#select_photo_popup").popup("close");
            	setupSuccess.getCameraPicker();
            } else if (selected_id === 'select_from_gallery') {
            	$("#select_photo_popup").popup("close");
            	setupSuccess.getGalleryPicker();
            } else if(selected_id === 'remove_photo'){
            	setupSuccess.removePhoto();
            }
            $("#select_photo_popup").popup("close");
        });

        $('#resetdevice_doorswindows, #resetdevice_Fobs, #resetdevice_pirsensors, #resetdevice_alarm').on('click', function(event){
            wemoUtil.infoLog(setupSuccess.TAG, 'reset options clicked');
            setupSuccess.openResetOptionsPage();
        });
       
        $(".save_btn").on('click', function(e){
            wemoUtil.infoLog(setupSuccess.TAG, 'save clicked');
            var deviceType = window.sessionStorage.getItem(sessionStore.HOME_SENSE_DEVICE_TYPE);
            var device_name = $(friendlynameTextId).val();
            var name_validate =  /^[A-Za-z 0-9._-]{1,30}$/g;
           
            if($.trim(device_name) == "" || $.trim(device_name).length == 0){
            	$('#invalidNamePopup_content').html(wemo.items['EmptyName_AlertMessage']);
            	$("#invalidNamePopup").popup('open');
            }else{
            	if(device_name.match(name_validate)){
            		if($.trim(deviceType) == $.trim(homeSenseModelCodes.DOORWINDOWS).toLowerCase()){
            			var sensorcntTxt = 0;
            			$( ".sensorTextDoor" ).each(function( index ) {
                  		    var id = $(this).attr('id');
                  		    var val = $(this).val();
                  		    
                  		    if(val.match(name_validate)){
                  		    	sensorcntTxt++;
                  		    }else{
                  		    	$("#"+id).focus();
                  		    	$('#invalidNamePopup_content').html(wemo.items['InvalidName_AlertMessage']);
                            	$("#invalidNamePopup").popup('open');
                  		    }
                  	 	});
            			
            			if(sensorcntTxt == $(".sensorTextDoor").length){
            				setupSuccess.saveEdit();
            			}
            			
            		}else{
            			setupSuccess.saveEdit();
            		}
                	
                }else{
                	$('#invalidNamePopup_content').html(wemo.items['InvalidName_AlertMessage']);
                	$("#invalidNamePopup").popup('open');
                }
            }
            e.preventDefault();
        });

        $('#edit_device_cancel_btn').on('click', function(e){
            wemoUtil.infoLog(setupSuccess.TAG, 'cancel clicked');
            setupSuccess.loadDeviceListPage();
            e.preventDefault();
        });
        
        $("#invalidNamePopupOK").on('click', function() {
            $("#invalidNamePopup").popup('close');
        });

        $("#gosh_message_ok_btn").on('click', function(){
            $("#gosh_message").popup('close');
        });

        $('#email_row').on('tap',function() {
            //wemoUtil.loadUrl(filePath.SETUP_EDIT_EMAIL);
        });
        
        $('.contacts').on('tap',function(e) {
        	 var divid = $(this).attr('id');
        	 var id = $("#"+divid).find('.phonecontacts').attr('wemo-device-spanid');
        	 nativeUtilPlugin.execute(null,null,actions.SHOW_PROGRESS,[]);
        	 setupSuccess.openPhoneContacts(id);
        	 e.preventDefault();
        });
        
        $("#led_wt_confirmdialog_cancel").on('tap', function(){
        	$("#led_wt_confirmdialog_contactsinfo").popup("close");
        });
        
        $("#starttestmode_f7c038").on('tap', function(){
        	
        	if($("#starttestmode_f7c038").hasClass("testmodedefault")){
        		var groupid = [window.sessionStorage.getItem(sessionStore.HOME_SENSE_GROUP_ID)];
        		var devicetype = $.trim(homeSenseModelCodes.DOORWINDOWS).toLowerCase();
        		var devlist = groupid;
                var inputArr = [statusCode.ON, homeSenseCapabilities.TESTMODE, ledDeviceConstants.YES];
        		setupSuccess.setDeviceStatus(devlist,inputArr).done(function() {
        			setupSuccess.startTimer(devicetype);
        			$("#starttestmode_"+devicetype).removeClass('testmodedefault');
                	$("#starttestmode_"+devicetype).addClass('testmodeactive');
                	$("#starttestmodeTitle_"+devicetype).addClass('testmodetitle');
                	$("#starttestmodeTitle_"+devicetype).text(wemo.items["HomeSense_Test_Mode_Active_Title"]);
				});
        	}
        	
        });
        
        $("#starttestmode_f7c041").on('tap', function(){
        	
        	if($("#starttestmode_f7c041").hasClass("testmodedefault")){
        		var devlist = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID)];
                var inputArr = [statusCode.ON, homeSenseCapabilities.TESTMODE, ledDeviceConstants.NO];
        		var devicetype = $.trim(homeSenseModelCodes.PIR).toLowerCase();
        		
        		setupSuccess.setDeviceStatus(devlist,inputArr).done(function() {
        			setupSuccess.startTimer(devicetype);
                	$("#starttestmode_"+devicetype).removeClass('testmodedefault');
                	$("#starttestmode_"+devicetype).addClass('testmodeactive');
                	$("#starttestmodeTitle_"+devicetype).addClass('testmodetitle');
                	$("#starttestmodeTitle_"+devicetype).text(wemo.items["HomeSense_Test_Mode_Active_Title"]);
				});
            	
        	}
        	
        });
        
        $("#contactSelections").on('tap', '.selectContact', function(e){
        	e.preventDefault();
        	var contactName = $(this).attr('contact-name');
        	var contactPhonetype = $(this).attr('contact-phone-type');
        	var contactNumber = $(this).attr('contact-number');
        	var tileId = $(this).attr('contact-tile-id');
        	
        	//$('.overlayScrollPicker').attr('style', 'display: none;');
        	$('.overlayScrollPicker').hide("slow");
        	$("#"+tileId).html($.trim(contactName)+" ("+contactPhonetype+")");
        	$('#'+tileId).addClass('activeColor');
        	$("#"+tileId).attr("contact-name", contactName);
        	$("#"+tileId).attr("contact-label", contactPhonetype);
        	$("#"+tileId).attr("contact-phone", contactNumber);
        	
        });
        
        $("#errorPopupOK").on('click', function() {
            $("#errorPopup").popup('close');
        });

        
    },
    
    saveEdit : function(){
    	
    	var deviceType = window.sessionStorage.getItem(sessionStore.HOME_SENSE_DEVICE_TYPE);
    	nativeUtilPlugin.execute(null,null,actions.SHOW_PROGRESS,[]);
    
    	if($(rememberWifiId).is(":visible")){
    		var wifiFlag = false;
    		
    		if($(rememberWifi).val() == "on"){
    			wifiFlag = true;
    		}
        	
        	wemoUtil.infoLog(setupSuccess.TAG, "wifiFlag "+wifiFlag);
        	
    		setupPlugin.execute(
                null,
                setupSuccess.reportError,
                ACTION_SET_CONFIG_STATUS,
                [wifiFlag]
        	);
    	}
    	
    	if($.trim(deviceType) == $.trim(homeSenseModelCodes.DOORWINDOWS).toLowerCase()){
    		var doorwindowsnameStr = "";
    		var doorwindowsValueStr = "";
    		
    		$( ".sensorTextDoor" ).each(function( index ) {
      		    var id = $(this).attr('id');
      		    var val = $(this).val();
      		    doorwindowsnameStr+=id+",";
      		    doorwindowsValueStr+=val+";";
      	 	});
    		doorwindowsnameStr = doorwindowsnameStr.slice(0, -1);
    		doorwindowsValueStr = doorwindowsValueStr.slice(0, -1);
    		
    	 	wemoUtil.infoLog(setupSuccess.TAG, " Sensorname Change " +doorwindowsnameStr+"---"+doorwindowsValueStr);
    	 	
        	var groupName = [$("#homesense_device_friendly_name_f7c038").val()];
        	var groupid = [window.sessionStorage.getItem(sessionStore.HOME_SENSE_GROUP_ID)];
        	
        	if(groupid == "" || groupid == undefined || groupName != wemo.items['HomeSenseGrpTitle'])
        	{
        		if(groupid == "" || groupid == undefined)
        			groupid = ["0"];
        		
                var inputArr1 = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS)];
                var inputArr2 = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES)];
                var inputArr3 = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CURRENTVAL)];
                
                setupSuccess.createGroup(inputArr1,inputArr2,inputArr3,groupName,groupid).done(function() {
     				setupSuccess.setFriendlyName(doorwindowsnameStr, doorwindowsValueStr);
     			});
          	   
        	}
        	else{
        		nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        		setupSuccess.setFriendlyName(doorwindowsnameStr, doorwindowsValueStr);
        		setupSuccess.loadDeviceListPage();
        	}
        		
        }
    	else{
    		var deviceType = window.sessionStorage.getItem(sessionStore.HOME_SENSE_DEVICE_TYPE);
            var deviceName = $(friendlynameTextId).val();
            var deviceID = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
     		
     		if($.trim(deviceType) == $.trim(homeSenseModelCodes.ALARM).toLowerCase()){
     			setupSuccess.storeEmergencyContacts().done(function() {
     				setupSuccess.setFriendlyName(deviceID,deviceName);
				});
     		} else if($.trim(deviceType) == $.trim(homeSenseModelCodes.PIR).toLowerCase()){
     			var devlist = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID)];
                var notificationStatus = $("#flip_notification").val();
                var inputArr = [notificationStatus, homeSenseCapabilities.SENSORENABLEDISABLE, ledDeviceConstants.NO];
        
                setupSuccess.setDeviceStatus(devlist, inputArr).done(function() {
     				setupSuccess.setFriendlyName(deviceID,deviceName);
				});
     		} else{
     			setupSuccess.setFriendlyName(deviceID,deviceName);
     		}
    	}
    	
    },
    
    loadDeviceListPage : function(){
        nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
        window.sessionStorage.setItem(sessionStore.CLEAR_LED_CACHE, statusCode.ON);
        window.sessionStorage.removeItem(sessionStore.DEVICE_SUCCESS);
        window.sessionStorage.removeItem(sessionStore.RESET_OPTIONS_FLAG);
        window.sessionStorage.removeItem(sessionStore.HOMESENSE_EMERGENCY_CONTACTS_STORE);
        
        setTimeout(function(){
            wemoUtil.loadUrl(filePath.DEVICE_LIST);
        }, timeout.CONTROL_POINT_DELAY);

    },

    getCameraPicker : function() {
        navigator.camera.getPicture(
            setupSuccess.onPhotoURISuccess,
            setupSuccess.reportError,
            {
                quality : 50,
                targetWidth: 80,
                targetHeight: 80,
                destinationType : destinationType.FILE_URI,
                correctOrientation:true
            }
        );
    },

    getGalleryPicker : function() {
        navigator.camera.getPicture(
            setupSuccess.onPhotoURISuccess,
            setupSuccess.reportError,
            {
                quality : 50,
                destinationType : destinationType.FILE_URI,
                sourceType : pictureSource.SAVEDPHOTOALBUM
            }
        );
    },

    removePhoto: function() {
        //setupSuccess.onPhotoURISuccess(setupSuccess.getDfaultURI());
        $('.device_thumb').attr('src',setupSuccess.getDfaultURI());
        var udn = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
        nativeUtilPlugin.execute(
            function(response){
                // alert('image');
                var status = response;
                //alert('status'+status);
                wemoUtil.infoLog(setupSuccess.TAG, 'Image Icon  clear'+status);
                if(status != -1){
                	wemoUtil.infoLog(setupSuccess.TAG, 'Image Icon  clear deleted from db');
                }else{
                	wemoUtil.infoLog(setupSuccess.TAG, 'Image Icon  clear not deleted from db');
                }

            },
            function(){wemoUtil.infoLog(setupSuccess.TAG, 'image not clear');},
            ACTION_RESET_LED_IMAGE_IN_DB,
            [udn]
        );
    },
    
    getDfaultURI : function(){

    	var iconURL = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL);
    	wemoUtil.infoLog(setupSuccess.TAG, "Default URL in edit mode"+iconURL);
    	
    	if(iconURL != "" && iconURL != undefined)
    		return iconURL;
    	else
    		return wemoUtil.getDefaultIconPath(wemoLed.TYPE);
    },

    onPhotoURISuccess : function(imageURI) {
        wemoUtil.infoLog(setupSuccess.TAG, "Image URI: " + imageURI);
        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URI, imageURI);
        wemoUtil.infoLog(setupSuccess.TAG, 'imageURI src::'+imageURI);
        setupSuccess.imageCloudCall(imageURI);
        //var imgSrc = "data:image/jpeg;base64," + imageURI;
        var imgSrc = imageURI;
        $('.device_thumb').attr('src', imgSrc);
 
    },

    imageCloudCall: function(imageURI){
        // alert('imageURI:::'+imageURI);
    	wemoUtil.infoLog(setupSuccess.TAG, 'imageURI:::'+imageURI);
        var imageName;
        imageName = imageURI.substr(imageURI.lastIndexOf('/') + 1);
        var imageFormat;
        imageFormat=imageName.split('.');
        var imageFormatName=imageFormat[1];
        imageName=imageFormat[0];
        wemoUtil.infoLog(setupSuccess.TAG, 'image Name::'+imageName);
        wemoUtil.infoLog(setupSuccess.TAG, 'image Format::'+imageFormatName);

        nativeUtilPlugin.execute(null,null,actions.SHOW_PROGRESS,[]);
        var referanceId='';
        var type='';

        var deviceType = window.sessionStorage.getItem(sessionStore.HOME_SENSE_DEVICE_TYPE);
        
        if($.trim(deviceType) == $.trim(homeSenseModelCodes.DOORWINDOWS).toLowerCase()){
        	referanceId=window.sessionStorage.getItem(sessionStore.HOME_SENSE_GROUP_ID);
            type = 'WEMO_GROUP_ICON';
            
            wemoUtil.infoLog(setupSuccess.TAG, "referanceId "+referanceId);
        }
        else
        {
        	 referanceId=window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
             type = 'WEMO_DEVICE_ICON';
        }
   
        wemoUtil.infoLog(setupSuccess.TAG, " image upload arguments"+referanceId+"---"+type);

        cordova.exec(function (params) {
        	wemoUtil.infoLog(setupSuccess.TAG, "success call back");
            var authCode = params[0];
            var homeId = params[1];
            wemoUtil.infoLog(setupSuccess.TAG, "authCode" + authCode+ "---"+homeId);
            //alert("authCode" + authCode+ "---"+homeId);

            devicePlugin.execute(
                function(suc){

                	wemoUtil.infoLog(setupSuccess.TAG, 'suc:::'+JSON.stringify(suc));
                    if(suc[0] === 200){
                    	wemoUtil.infoLog(setupSuccess.TAG, 'Image Upload Success');
                        var uploadElm = suc[1];
                        wemoUtil.infoLog(setupSuccess.TAG, 'uploadElm'+uploadElm);
                        var uploadId = $(uploadElm).find('uploadId').text();
                        wemoUtil.infoLog(setupSuccess.TAG, 'uploadId::'+uploadId);

                        nativeUtilPlugin.execute(function(str){
                                nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
                                wemoUtil.infoLog(setupSuccess.TAG, 'img url success in sucess');},
                            function(){wemoUtil.infoLog(setupSuccess.TAG, 'storing upload Id in DB Failed');},
                            ACTION_INSERT_LED_IMAGE_TO_DB,
                            [referanceId,imageURI,uploadId]
                        );
                    }else{
                    	 nativeUtilPlugin.execute(function(str){
                             nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
                             wemoUtil.infoLog(setupSuccess.TAG, 'img url success in else');},
                         function(){wemoUtil.infoLog(setupSuccess.TAG, 'storing upload Id in DB Failed');},
                         ACTION_INSERT_LED_IMAGE_TO_DB,
                         [referanceId,imageURI,uploadId]
                    	 );
                        nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
                        $('.device_thumb').attr('src',setupSuccess.getDfaultURI());
                        alert(wemo.items['imageUploadFail']);
                    }

                },
                function(){
                	wemoUtil.infoLog(setupSuccess.TAG, 'Error');
                	nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
                },
                ACTION_ICON_UPLOAD_TO_CLOUD,
                [homeId,imageURI,referanceId,type,imageName,imageFormatName,authCode]);

        },function (err) {
        	//alert('Please enable the remote to customize the icon');
        	
        	nativeUtilPlugin.execute(function(str){
                nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
                wemoUtil.infoLog(setupSuccess.TAG, 'img url success without remote');
            },
            function(){wemoUtil.infoLog(setupSuccess.TAG, 'storing upload Id in DB Failed');},
            ACTION_INSERT_LED_IMAGE_TO_DB,
            [referanceId,imageURI,""]
        	);
        	
        	nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
    	},"WebServicePlugin", "getAuthCode", []);


    },
    
    openResetOptionsPage : function(){
    	var contacts = [];
    	$('.phonecontacts').each(function(i, val) {
    		wemoUtil.infoLog(setupSuccess.TAG, 'contactEmergency inside: ' + i + "---"+$(this).attr('wemo-device-spanid'));
            var tileId = $(this).attr('wemo-device-spanid');
        
            if($("#"+tileId).attr('contact-phone') != undefined){
    	    	var contactEmergency = {};
    	    	contactEmergency.listOrder = $(this).attr('wemo-listorder');
                contactEmergency.name = $("#"+tileId).attr('contact-name');
                contactEmergency.label = $("#"+tileId).attr('contact-label');
                contactEmergency.phone = $("#"+tileId).attr('contact-phone');
                contacts.push(contactEmergency);

            }
        
            if(contacts.length > 0){
               	var contactsStoreform = {"contacts":contacts}; 
            	window.sessionStorage.setItem(sessionStore.HOMESENSE_EMERGENCY_CONTACTS_STORE, JSON.stringify(contactsStoreform));
            	window.sessionStorage.setItem(sessionStore.RESET_OPTIONS_FLAG, true);
            }
            wemoUtil.loadUrl(filePath.LED_DEVICE_RESET_OPTIONS);
        });
        
    },
    
    openPhoneContacts : function(id){
    	
    	 sensorEventsPlugin.execute(function(contact){
    			nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
    		    wemoUtil.infoLog(setupSuccess.TAG, 'The following contact has been selected:' + JSON.stringify(contact));
    		    var contactList = contact;
    		    var mobileInfoHtml = "";
    		    
    		    for(var i=0;i<contactList.length;i++){
    		    	mobileInfoHtml+="<li class='selectContact' contact-number='"+contactList[i].phoneNumber+"' contact-name='"+contactList[i].contactName+"' contact-phone-type='"+contactList[i].phoneType+"' contact-tile-id='"+id+"'><a href='#'>"+contactList[i].contactName+" - "+contactList[i].phoneType+"</a></li>";
    		    }
    		    
    		    //$('.overlayScrollPicker').attr('style', 'display: block;');
    		    $('.overlayScrollPicker').slideDown("slow");
    		    $("#contactSelections").html(mobileInfoHtml);
    		    $("#contactSelections").listview('refresh');
    		    setupSuccess.adjustContactListDivHeight();
    
    	 },
    	    setupSuccess.reportError,
	        actions.GET_CONTACT_LIST, []
         );
    	
    },
    
    adjustContactListDivHeight: function(){
    	if (!viewPortHeight) {
            var viewPortHeight = $(window).height();
            var headerHeight = $('.picker_header_ScrollPicker').outerHeight(true);
            var searchHeight = $('.ui-filterable').outerHeight(true);
            var $content =  $("#contactSelections");
        }
        
        var contentHeight = (viewPortHeight - headerHeight - searchHeight) + 20;
        var margin = searchHeight;

        $content.css({
            height: contentHeight,
        });
    },
    
    startTimer: function(devicetype){
    	clearInterval(starttestmodeTimer);
   	 	var addMinutes = new Date().getTime() + (5 * 59900);
   	    setupSuccess.startTimerCount(addMinutes,devicetype);
    
     	starttestmodeTimer = setInterval(function() {
     		setupSuccess.startTimerCount(addMinutes,devicetype);
	    }, 1000);
    },
    
    startTimerCount: function(addMinutes,devicetype){
     	 var current_date = new Date().getTime();
         var seconds_left = (addMinutes - current_date) / 1000;
         var days, hours, minutes, seconds;
         // do some time calculations
         days = parseInt(seconds_left / 86400);
         seconds_left = seconds_left % 86400;

         hours = parseInt(seconds_left / 3600);
         seconds_left = seconds_left % 3600;

         minutes = parseInt(seconds_left / 60);
         seconds = parseInt(seconds_left % 60);
         
         if(seconds > 0 || minutes > 0){
         	 $("#starttestmodeTimer_"+devicetype).show();
         	 $("#starttestmodeTimer_"+devicetype).text(minutes+":"+seconds); 
         }
         else{
         	 $("#starttestmodeTimer_"+devicetype).hide();
         	 $("#starttestmodeTimer_"+devicetype).text('');
          	 $("#starttestmode_"+devicetype).removeClass('testmodeactive');
         	 $("#starttestmode_"+devicetype).addClass('testmodedefault');
	         $("#starttestmodeTitle_"+devicetype).removeClass('testmodetitle');
          	 $("#starttestmodeTitle_"+devicetype).text(wemo.items["HomeSense_Test_Mode_Title"]);
         }
    },
    
    setFriendlyName: function(deviceID, deviceName){
    	wemoUtil.infoLog(setupSuccess.TAG, "setFriendlyName***"+deviceID+"---"+deviceName);
    	var dfd = $.Deferred();
    	
    	appPlugin.execute(
                function(response){
               	 wemoUtil.infoLog(setupSuccess.TAG, "friedly response***"+JSON.stringify(response));
               	 	setupSuccess.loadDeviceListPage();
                    dfd.resolve();  
                },
                setupSuccess.reportError,
                actions.SET_MULTIPLE_DEVICE_NAME,
                [deviceID,deviceName]
         );
    	
    	return dfd;
    },
    
    storeEmergencyContacts: function(){
    	var dfd = $.Deferred();
    	var contacts = [];
    	
    	$('.phonecontacts').each(function(i, val) {
    		wemoUtil.infoLog(setupSuccess.TAG, 'contactEmergency inside: ' + i + "---"+$(this).attr('wemo-device-spanid'));
            var tileId = $(this).attr('wemo-device-spanid');
        
            if($("#"+tileId).attr('contact-phone') != undefined){
    	    	var contactEmergency = {};
    	    	contactEmergency.listOrder = $(this).attr('wemo-listorder');
                contactEmergency.name = $("#"+tileId).attr('contact-name');
                contactEmergency.label = $("#"+tileId).attr('contact-label');
                contactEmergency.phone = $("#"+tileId).attr('contact-phone');
                contacts.push(contactEmergency);

            }
        });
 
    	if(contacts.length > 0){
           	var contactsStoreform = {"contacts":contacts}; 
        	wemoUtil.infoLog(setupSuccess.TAG, 'contactEmergency Array: ' + JSON.stringify(contactsStoreform)+"---"+contactsStoreform);
            
        		   sensorEventsPlugin.execute(function(status){
		        	   wemoUtil.infoLog(setupSuccess.TAG, "status of SET_EMERGENCY_CONTACTS ::"+status);
		        	   dfd.resolve();  
		           },
		    	    setupSuccess.reportError,
			        actions.SET_EMERGENCY_CONTACTS, [contactsStoreform]
		           );
		           
        }
    	dfd.resolve();  
    	return dfd;
    },
    
    populateContacts: function(type){
    	if(type == populateContstype){
    		var contactsfromCache = JSON.parse(window.sessionStorage.getItem(sessionStore.HOMESENSE_EMERGENCY_CONTACTS_STORE));;
    		nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
    		for(var i=0;i<contactsfromCache.contacts.length;i++){
	     		wemoUtil.infoLog(setupSuccess.TAG, "Contacts::" + contactsfromCache.contacts[i].name); 
	     		var contactName = contactsfromCache.contacts[i].name;
	     		var contactPhonetype = contactsfromCache.contacts[i].label;
	     		var contactNumber = contactsfromCache.contacts[i].phone;
	     		var tileId = contactsfromCache.contacts[i].listOrder;
	     	
	     		$("#emergencycon"+tileId).html($.trim(contactName)+" ("+contactPhonetype+")");
	     		$('#emergencycon'+tileId).addClass('activeColor');
	         	$("#emergencycon"+tileId).attr("contact-name", contactName);
	         	$("#emergencycon"+tileId).attr("contact-label", contactPhonetype);
	         	$("#emergencycon"+tileId).attr("contact-phone", contactNumber);
	     		
	     	}
    	}
    	else{
    		sensorEventsPlugin.execute(function(contacts){
    	      	   wemoUtil.infoLog(setupSuccess.TAG, "status of GET_EMERGENCY_CONTACTS ::"+JSON.stringify(contacts));
    	      	   var contactsfromCache = contacts;
    	      	   nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);	
    	      	   
    	      	   		 for(var i=0;i<contactsfromCache.contacts.length;i++){
    			     		wemoUtil.infoLog(setupSuccess.TAG, "Contacts::" + contactsfromCache.contacts[i].name); 
    			     		var contactName = contactsfromCache.contacts[i].name;
    			     		var contactPhonetype = contactsfromCache.contacts[i].label;
    			     		var contactNumber = contactsfromCache.contacts[i].phone;
    			     		var tileId = contactsfromCache.contacts[i].listOrder;
    			     	
    			     		$("#emergencycon"+tileId).html($.trim(contactName)+" ("+contactPhonetype+")");
    			     		$('#emergencycon'+tileId).addClass('activeColor');
    			         	$("#emergencycon"+tileId).attr("contact-name", contactName);
    			         	$("#emergencycon"+tileId).attr("contact-label", contactPhonetype);
    			         	$("#emergencycon"+tileId).attr("contact-phone", contactNumber);
    			     		
    			     	}
    	         },
    	  	        setupSuccess.reportError,
    		        actions.GET_EMERGENCY_CONTACTS, []
    	     );
    	}	
    	
    },
    
    setDeviceStatus: function(devlist, inputArr){
    	wemoUtil.infoLog(setupSuccess.TAG, "status of setDeviceStatus ::"+devlist+"--"+inputArr);
    	var dfd = $.Deferred();
    
    		devicePlugin.execute(
	            function(response) {
	            	dfd.resolve();  
	            },
	            setupSuccess.reportError,
	            ACTION_SET_LED_STATUS, [inputArr, devlist]
	        );
    		
    	dfd.resolve();  
        return dfd;
    },
    
    createGroup: function(inputArr1,inputArr2,inputArr3,groupName,groupid){
    	var dfd = $.Deferred();
    	devicePlugin.execute(
                function(response) {

                	wemoUtil.infoLog(setupSuccess.TAG, "response**" + JSON.stringify(response));

                    if (response == null || response == undefined || response == "") {
                        alert(wemo.items['LEDGrpcreationFails']);
                        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                    } else {
                        var status = response[0].GetCreateGroupResponse;
                        window.sessionStorage.setItem(sessionStore.HOME_SENSE_GROUP_ID, status);
                    }
                    dfd.resolve();  
                    

                },
                setupSuccess.reportError,
                ACTION_CREATE_GROUP, [inputArr1, inputArr2, inputArr3, groupName, groupid]
         );
    	return dfd;
    }
    
};