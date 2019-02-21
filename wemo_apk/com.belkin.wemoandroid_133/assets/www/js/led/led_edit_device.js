/*
 led_edit_device.js

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
    editDevice.initialize();
});


var countFlag = "";
var groupIDS = [];
var isRemoteEnabled = false;
var buttonAction = false;

$(document).ready(function () {
    var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));
});

var editDevice = {

    TAG : 'led_edit_device.js: ',

    imageChanged : false,

    initialize : function() {
        wemoUtil.infoLog(editDevice.TAG, 'initialize');
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },

    onDeviceReady : function() {

        wemoUtil.infoLog(editDevice.TAG, 'onDeviceReady');
        editDevice.bindEvents();
        //All initialization script goes here
        if(window.sessionStorage.getItem(sessionStore.REMOTE_MODE) == "true")
            isRemoteEnabled = true;
        
        wemoUtil.infoLog(editDevice.TAG, "Remote mode2: " + typeof  isRemoteEnabled);

        $('.custom_device_img').css("background-image", 'url(' + window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL)+ ')');

        /********Comments****/

        wemoUtil.infoLog(editDevice.TAG, window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME));
        wemoUtil.infoLog(editDevice.TAG, window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL));
        wemoUtil.infoLog(editDevice.TAG, window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID));
        wemoUtil.infoLog(editDevice.TAG, window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO));

        wemoUtil.infoLog(editDevice.TAG, "success page ***"+window.sessionStorage.getItem(sessionStore.DEVICE_SUCCESS));
      
        /********Comments****/

        var ssid = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
        $('#device_ssid').html(ssid);
        wemoUtil.infoLog(editDevice.TAG, ssid);

        var ledDeviceImg = '';

        // var imgSrc = "data:image/jpeg;base64," + ledDeviceImg;
        var imgSrc = ledDeviceImg;

        if(ledDeviceImg != null && ledDeviceImg.length > 0 && ledDeviceImg != ""){
        	wemoUtil.infoLog(editDevice.TAG, "entering in leddevice img"+imgSrc);
            $('.custom_device_img').css("background-image", 'url(' + imgSrc + ')');
        }else{
            var imageURL;
        	wemoUtil.infoLog(editDevice.TAG, "entering in leddevice img2323"+editDevice.getDfaultURI());
        	if (window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL)) {
        	    imageURL = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URL);
        	} else {
        	    imageURL = editDevice.getDfaultURI();
        	}

            $('.custom_device_img').css("background-image", 'url(' + imageURL + ')');
        }
        $('#device_edit_friendly_name').val(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME));
        editDevice.setupDOMListeners();

        wemoUtil.infoLog(editDevice.TAG, "group Info*****"+window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO));

        if(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO) == "group")
        {
            $("#resetDevice").hide();
            $("#deviceImg").hide();
            $("#editdevice").hide();
            $("#Disssid").hide();
            $("#editgroup").show();
            $("#devicelistdisplay").show();
            $('#reset_options').hide();
            $('.checkBulb').hide();
            $('#led_edit_icon').empty().html(wemo.items.groupIcon);
            $('#led_edit_name').empty().html(wemo.items.groupName);


            wemoUtil.infoLog(editDevice.TAG, "Group DEvice IDs: "+window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS)+"--"+window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID));

            if(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS) != "")
            {
            	wemoUtil.infoLog(editDevice.TAG, "friendlu name "+window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME));
            	
                groupIDS = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS).split(",");
                var deviceFrienldyname = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_FRIENDLYNAME).split(",");
                countFlag = groupIDS.length;
                var groupDeviceInfo = window.sessionStorage.getItem(sessionStorage.LED_DEVICE_AVAILABILITY_LIST);
                var deviceMacaddress = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_MAC_IDS);
                
                if(deviceMacaddress != undefined)
                	deviceMacaddress = deviceMacaddress.split(",");
                
                if(groupDeviceInfo!= null || groupDeviceInfo != undefined)
                	groupDeviceInfo = groupDeviceInfo.split(",");

                var listLI = "";

                for(var i=0; i<groupIDS.length; i++)
                {
                	if(groupDeviceInfo[i] == groupIDS[i])
                	{
                		var name = wemo.items['dimmableLight']+i;
                        listLI+='<li class="disabled" id="' +groupIDS[i]+ '" >'+ deviceFrienldyname [i]+' unavailable</li>';
                	}
                	else if(deviceMacaddress != undefined && deviceMacaddress != null)
                	{
                		var name = wemo.items['dimmableLight']+i;
                        listLI+='<li class="groupleddevices" id="' +groupIDS[i]+ '" wemo-device-macadress="'+deviceMacaddress[i]+'">'+ deviceFrienldyname [i]+'</li>';
                	}
                	else{
                		var name = wemo.items['dimmableLight']+i;
                        listLI+='<li class="groupleddevices" id="' +groupIDS[i]+ '">'+ deviceFrienldyname [i]+'</li>';
                	}
                    
                }
                $(listLI).hide().prependTo('#leddevieslist').slideDown("slow");
            }


        }
        else if(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO) == "newgroup")
        {
            $("#resetDevice").hide();
            $("#deviceImg").hide();
            $("#editdevice").hide();
            $("#successpage").hide();
            $("#Disssid").hide();
            $("#editgroup").show();
            $("#devicelistdisplay").show();
            $('#reset_options').hide();
            $('.checkBulb').hide();
            $('#led_edit_icon').empty().html(wemo.items.groupIcon);
            $('#led_edit_name').empty().html(wemo.items.groupName);
            $("#singlebulb").hide();

            wemoUtil.infoLog(editDevice.TAG, "Group DEvice IDs new group: "+window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS));

            if(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS) != "")
            {
                groupIDS = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS).split(",");
                countFlag = groupIDS.length;
                wemoUtil.infoLog(editDevice.TAG, "Groups : "+groupIDS.length+"*******"+groupIDS);
                var deviceFrienldyname = window.sessionStorage.getItem(sessionStore.DEVICE_WEMO_DEVICE_FRIENDLY_NAME).split(",");
                
                var listLInewGroup = "";

                for(var i=0; i<groupIDS.length; i++)
                {
                    var name = wemo.items['dimmableLight']+i;
                    listLInewGroup+='<li id="' +groupIDS[i]+ '" >'+ deviceFrienldyname[i] +'</li>';
                }

                $(listLInewGroup).hide().prependTo('#leddevieslist').slideDown("slow");
            }

        }
        else if(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO) == "single")
        {
	            if(window.sessionStorage.getItem(sessionStore.DEVICE_SUCCESS) == "sucesspage")
	            {
	            	 $("#editdevice").hide();
	                 $("#editgroup").hide();
	                 $("#successpage").show();
	                 $("#reset_options").hide();
	            }
	            else
	            {
	                $("#editgroup").hide();
	                $("#successpage").hide();
	                $("#editdevice").show();
	
	                if(isRemoteEnabled)
	                    $("#find_bulb").hide();
	            }
	            
        }


        $("#leddevieslist").on('tap',".groupleddevices",function(){

            countFlag = countFlag - 1;
            var item = $(this);
            var deviceID = [item.attr('id')];
            var deviceMacID = [item.attr('wemo-device-macadress')];
            var newDevicesID = [];


            jQuery.grep(groupIDS, function(el) {
                if (jQuery.inArray(el, deviceID) == -1) newDevicesID.push(el);
            });
            wemoUtil.infoLog(editDevice.TAG, "deviceID*********"+deviceID+"******+"+groupIDS+"********"+newDevicesID);

            var inputArr1 = newDevicesID;
            var arrRev = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES).split(",");
            
            // capabilityIDs1 = revArr.join(",");
            var capabilityIDs1= window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES)
            wemoUtil.infoLog("capabilityIDs1*****"+capabilityIDs1);

            var inputArr2 = [capabilityIDs1];
            var inputArr3 = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CURRENTVAL)];
            var friendlyname = [$('#device_edit_friendly_name').val()];
            wemoUtil.infoLog(editDevice.TAG, "inputarg:: "+inputArr1+"*******"+inputArr2+"******"+inputArr3+"******"+friendlyname);

            if(countFlag < 2)
            {
                var groupid = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID)];
                wemoUtil.infoLog(editDevice.TAG, "REmove group ID"+groupid);

                $('#deletegroup_status_header').html(wemo.items['breakThisGroup']);
                $('#deletegroup_status_body').html(wemo.items['onlyTwoDevicesInGroup']);
                $("#deletegroup_status_popup").popup( "open" );

            }

            else
            {
                nativeUtilPlugin.execute(null,null,actions.SHOW_PROGRESS,[]);

                if(isRemoteEnabled)
                {
                    var udn = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
                    var groupUniqueID = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_UNIQUE_ID);
                    var friendly_name = $('#device_edit_friendly_name').val();
                    var groupdeviceIDS = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS).split(",");
                    wemoUtil.infoLog(editDevice.TAG, "GroupIDs : "+groupIDS.length+"*******"+groupdeviceIDS+"---"+groupUniqueID);
                    
                    var capabilityIDs1 = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES).split(",");
                    var currentval = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CURRENTVAL);
                    var xmlString = "";
                    var cdataStart = '<![CDATA[<CreateGroup>';
                    var cdataEnd = '</CreateGroup>]]>';
                    var refrenceID = udn;
                    var groupname = friendly_name;
                    var groupID = udn;
                    var splitCapabilityArr = capabilityIDs1;
                    var splitDeviceList = [];
                    var iconversion = "";
                    var faderval = window.sessionStorage.getItem(sessionStore.DEVICE_WEMO_DEVICE_FADER_VAL);
                    var tempval = window.sessionStorage.getItem(sessionStore.DEVICE_WEMO_DEVICE_TEMPERATURE_VAL);
                    var colorval = window.sessionStorage.getItem(sessionStore.DEVICE_WEMO_DEVICE_COLOR_VAL);
                    var deviceMacaddressList = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_MAC_IDS);
                    var capabilityIDsVal1 = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES_VALUE);
                    var groupCapability = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES);
                    var groupState = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_STATE);
                    
                    jQuery.grep(groupdeviceIDS, function(el) {
                        if (jQuery.inArray(el, deviceID) == -1) splitDeviceList.push(el);
                    });
                    
                    if(deviceMacaddressList != undefined){
                    	var newdeviceMacList = [];
                    	deviceMacaddressList = deviceMacaddressList.split(",");
                    	
                    	jQuery.grep(deviceMacaddressList, function(el) {
                            if (jQuery.inArray(el, deviceMacID) == -1) newdeviceMacList.push(el);
                        });
                    	
                    	deviceMacaddressList = newdeviceMacList.join(",");
                    }
                    
                    wemoUtil.infoLog(editDevice.TAG, "currentval"+currentval);
                    
                    if(currentval != "")
                    {
                    	currentInpvalArr = currentval.split(",");
                    	currentval = currentInpvalArr[0];
                    }
                    
                    xmlString = wemoUtil.updateGroupXML(groupUniqueID, refrenceID, groupname, iconversion,deviceMacaddressList,groupCapability,capabilityIDsVal1,splitDeviceList,splitCapabilityArr,groupState,currentval,faderval,tempval,colorval);
    	            wemoUtil.infoLog(editDevice.TAG, "priting XML Data in Remote for group*****"+xmlString);
                    nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
                    editDevice.createGroups(xmlString,"updategroup");
                }
                else
                {
                    var groupid = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID)];

                    devicePlugin.execute(
                        function(response){
                        	
                        	if(response == null || response == undefined || response == "")
                        	{
                        		alert(wemo.items['deviceNotRemoved']);
                        		nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
                        	}
                        	else
                        	{
                        		var status = response[0].GetCreateGroupResponse;
                        		wemoUtil.infoLog(editDevice.TAG, " update group status "+response);
                                
                                if(status == 1 || status == 2 || status == 3 || status != "")
                                {
                                	var Allowedarr = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
                                    var currentval = (100 * Allowedarr)/100;
                                    currentval = Math.round(currentval);
                                    var CurrentVal = "0,"+currentval+":0";
                                    var state = "0";
                                    var setStatusDeviceId = item.attr('id');

                                    wemoUtil.infoLog(editDevice.TAG, "dimmingvalue121212---"+currentval+"====="+setStatusDeviceId+"---"+CurrentVal);
                                    var capabilities = ledCapabilities.ONOFF + "," + ledCapabilities.DIMMING;
                                    var inputArr = [CurrentVal,setStatusDeviceId,capabilities,"NO"];

                                    devicePlugin.execute(
                                        function(){

                                        },
                                        editDevice.reportError,
                                        ACTION_SET_LED_STATUS,
                                        [inputArr]
                                    );

                                    nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
                                    $('#removedevice_status_header').html("Remove Device");
                                    $('#removedevice_status_body').html(wemo.items['deviceRemovedFromGroup']);
                                    $("#removedevice_status_popup").popup( "open" );
                                    //editDevice.loadBridgeDevicesFromUpNp("edit");
                                }
                                else
                                {
                                    alert(wemo.items['deviceNotRemoved']);
                                    nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
                                }
                        	}
                            

                        },
                        editDevice.reportError,
                        ACTION_CREATE_GROUP,
                        [inputArr1,inputArr2,inputArr3,friendlyname,groupid]
                    );



                }

                nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);

            }


        });

        $('#removedevice_ok_btn').on('click',function(){
            $( "#removedevice_status_popup" ).popup( "close" );
            editDevice.openDeviceListPage();
        });

        $('#deletegroup_cancel_btn').on('click',function(){
            $( "#deletegroup_status_popup" ).popup( "close" );
        });

        $('#deletegroup_ok_btn').on('click',function(){
            $( "#deletegroup_status_popup" ).popup( "close" );
            var groupid = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID)];
            nativeUtilPlugin.execute(null,null,actions.SHOW_PROGRESS,[]);

            wemoUtil.infoLog(editDevice.TAG, " isRemoteEnabled333"+isRemoteEnabled);
            if(isRemoteEnabled)
            {
            
            		var groupID = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
            		
	            	/*****Database check before group delete*******/                
	                
	                db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
	                db.transaction(fetchGroupInfoRemote, errorCBRemote, successCBRemote);
	
	                function fetchGroupInfoRemote(tx) {
	                	tx.executeSql('SELECT RuleID from RULEDEVICES where DeviceID Like "%'+groupID+'"', [], queryGroupRemoteSuccess, errorCBRemote);
	                }
	                
	                function errorCBRemote(err) {
	                	  //Delete Group
	                	
		                var xmlString = "";
		                var cdataStart = '<![CDATA[<DeleteGroup>';
		                var cdataEnd = '</DeleteGroup>]]>';
		
		                xmlString+="<group>"+
		                    "  <content>" + cdataStart +
		                    "  <referenceId>" + groupid + "</referenceId>" +
		                    cdataEnd + " </content>" +
		                    "  </group>" ;
		
		                editDevice.deleteGroups(xmlString, groupid);
	                }
                
	                function successCBRemote() {
	                	wemoUtil.infoLog(editDevice.TAG, "Success creating rules DB table structure remote");
	                } 
                
	                function queryGroupRemoteSuccess(tx, results) {
	                	wemoUtil.infoLog(editDevice.TAG, "Fetching Data rule devices in edit group remote=>" + results.rows.length);
	   					
	                    var len = results.rows.length;
	    				var ruleDeviceRows = [];
	       
	    				wemoUtil.infoLog(editDevice.TAG, "length of group***"+len);
	   					 
	                        if (len > 0) {
	                        	wemoUtil.infoLog(editDevice.TAG, "entering in remote delte len");
		                            for (var i = 0; i < len; i++) {
		                            	ruleDeviceRows[i] = results.rows.item(i);   	                            	
		                            }	                            
		                            
		                            db.transaction(function(tx){
		                           	   deleteRulesDevicesRemote(tx, ruleDeviceRows)
		                            },errorCB);   
	                        }
	                        else
	                        {
	                        	wemoUtil.infoLog(editDevice.TAG,"entering in remote delte");
		                        	  //Delete Group
		                        	
		        	                var xmlString = "";
		        	                var cdataStart = '<![CDATA[<DeleteGroup>';
		        	                var cdataEnd = '</DeleteGroup>]]>';
		        	
		        	                xmlString+="<group>"+
		        	                    "  <content>" + cdataStart +
		        	                    "  <referenceId>" + groupid + "</referenceId>" +
		        	                    cdataEnd + " </content>" +
		        	                    "  </group>" ;
		        	
		        	                editDevice.deleteGroups(xmlString, groupid);		                             
	                        }               
	                       
	   			   }
                
                
	                function deleteRulesDevicesRemote(tx, ruleDeviceRows)
	                {
	     	        	    for(var i=0;i<ruleDeviceRows.length;i++)
	     	   				{
	     	        	    	wemoUtil.infoLog(editDevice.TAG, 'DELETE from RULEDEVICES where DeviceID Like "%'+groupID+'" and RuleID='+ruleDeviceRows[i].RuleID+'"');     	        	    	
	     	        	    	tx.executeSql('DELETE from RULEDEVICES where DeviceID Like "%'+ groupID + '";', [], executeSqlDeleteQueryRemoteSuccess, errorCBRemote)
	     	   				}	    
	               
	     	        	    db.transaction(function(tx){
	                        	   deleteRulesRemote(tx)
	                        },errorCB);   
	                }
	                
	                function executeSqlDeleteQueryRemoteSuccess(tx, results) {
	                	wemoUtil.infoLog(editDevice.TAG, "entering in success");
	                }
	                
	                function deleteRulesRemote(tx)
	                {
	                	   wemoUtil.infoLog(editDevice.TAG, "entering in success delete rules");
		             	   tx.executeSql('DELETE FROM RULES WHERE RuleID NOT IN (SELECT RuleID FROM RULEDEVICES GROUP BY RuleID);', [], executeSqlDeleteQueryRemoteSuccess, errorCBRemote);
		             	   
		             	  //Delete Group
		             		
			                var xmlString = "";
			                var cdataStart = '<![CDATA[<DeleteGroup>';
			                var cdataEnd = '</DeleteGroup>]]>';
			
			                xmlString+="<group>"+
			                    "  <content>" + cdataStart +
			                    "  <referenceId>" + groupid + "</referenceId>" +
			                    cdataEnd + " </content>" +
			                    "  </group>" ;
			
			                editDevice.deleteGroups(xmlString, groupid).done(function(){
			                	 editDevice.uploadDBOnCloud();
			                });

	                }
                
	                /*****Database check before group delete end*******/                 

            }
            else
            {
            	
            	    var Allowedarr = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
	                var currentval = (100 * Allowedarr)/100;
	                currentval = Math.round(currentval);
	                //var CurrentVal = "0,"+currentval+":0";
	                var CurrentVal = currentval+":0,0";
	                var state = "0";
	                var groupID = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
                
                /*****Database check before group delete*******/                
                
	                db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
	                db.transaction(fetchGroupInfo, errorCB, successCB);
	
	                function fetchGroupInfo(tx) {
	                	tx.executeSql('SELECT RuleID from RULEDEVICES where DeviceID Like "%'+groupID+'"', [], queryGroupSuccess, errorCB);
	                }
                
	                function errorCB(err) {
	                		wemoUtil.infoLog(editDevice.TAG, "Error creating rules DB table structure " + err.code);
	                    
	                		wemoUtil.infoLog(editDevice.TAG, "dimmingvalue32423---"+currentval+"====="+groupID+"---"+CurrentVal);
		                    var capabilities = ledCapabilities.DIMMING + "," + ledCapabilities.ONOFF;
		                    var inputArr = [CurrentVal,groupID,capabilities,"YES"];	                            
		                   
		                     devicePlugin.execute(
		                         function(){
		
		                             var newClass = editDevice.getBinaryStateImage(state);
		                             $("#"+groupID).attr('wemo-device-state-code',state);
		                             $("#"+groupID).removeClass();
		                             $("#"+groupID).addClass(newClass);
		                             $("#"+groupID).attr('wemo-device-state',newClass);
		
		                         },
		                         editDevice.reportError,
		                         ACTION_SET_LED_STATUS,
		                         [inputArr]
		                     );
		
		                    setTimeout(function(){
		                        devicePlugin.execute(
		                            function(response){
		                                var status = response[0].GetDeleteResponse;
		                                nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
		
		                                if(status == 1 || status !="")
		                                {
		                                    editDevice.openDeviceListPage();
		                                }
		                            },
		                            editDevice.reportError,
		                            ACTION_DELETE_GROUP,
		                            [groupid]
		                        );
		                    },1400);	                    
		                    
	                }
                
	                function successCB() {
	                	wemoUtil.infoLog(editDevice.TAG,"Success creating rules DB table structure ");
	                } 
                
	                function queryGroupSuccess(tx, results) {
	                	wemoUtil.infoLog(editDevice.TAG,"Fetching Data rule devices in edit group =>" + results.rows.length);
	   					
	                    var len = results.rows.length;
	    				var ruleDeviceRows = [];
	       
	    				wemoUtil.infoLog(editDevice.TAG, "length of group***"+len);
	   					 
	                        if (len > 0) {
		                            for (var i = 0; i < len; i++) {
		                            	ruleDeviceRows[i] = results.rows.item(i);   	                            	
		                            }	                            
		                            
		                            db.transaction(function(tx){
		                           	   deleteRulesDevices(tx, ruleDeviceRows)
		                            },errorCB);   
	                        }
	                        else
	                        {
	                        		wemoUtil.infoLog(editDevice.TAG, "dimmingvalue333---"+currentval+"====="+groupID+"---"+CurrentVal);
		                        	var capabilities = ledCapabilities.DIMMING + "," + ledCapabilities.ONOFF;
		    		                var inputArr = [CurrentVal,groupID,capabilities,"YES"];	                            
		                           
		                             devicePlugin.execute(
		                                 function(){
		
		                                     var newClass = editDevice.getBinaryStateImage(state);
		                                     $("#"+groupID).attr('wemo-device-state-code',state);
		                                     $("#"+groupID).removeClass();
		                                     $("#"+groupID).addClass(newClass);
		                                     $("#"+groupID).attr('wemo-device-state',newClass);
		
		                                 },
		                                 editDevice.reportError,
		                                 ACTION_SET_LED_STATUS,
		                                 [inputArr]
		                             );
	
		                            setTimeout(function(){
		                                devicePlugin.execute(
		                                    function(response){
		                                        var status = response[0].GetDeleteResponse;
		                                        nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
		                                        
		                                        if(status == 1 || status !="")
		                                        {
		                                            editDevice.openDeviceListPage();
		                                        }
		                                    },
		                                    editDevice.reportError,
		                                    ACTION_DELETE_GROUP,
		                                    [groupid]
		                                );
		                            },1400);
		                             
	                        }               
	                       
	   			   }
                
                
	                function deleteRulesDevices(tx, ruleDeviceRows)
	                {
	                	wemoUtil.infoLog(editDevice.TAG, "entering in delte Rules");        	   
	     	        	   
	     	        	    for(var i=0;i<ruleDeviceRows.length;i++)
	     	   				{
	     	        	    	wemoUtil.infoLog(editDevice.TAG, 'DELETE from RULEDEVICES where DeviceID Like "%'+groupID+'" and RuleID='+ruleDeviceRows[i].RuleID+'"');     	        	    	
	     	        	    	tx.executeSql('DELETE from RULEDEVICES where DeviceID Like "%'+groupID+'";', [], executeSqlDeleteQuerySuccess, errorCB)
	     	   				}	    
	               
	     	        	    db.transaction(function(tx){
	                        	   deleteRules(tx)
	                        },errorCB);   
	
	                }
	                
	                function executeSqlDeleteQuerySuccess(tx, results) {
	                	wemoUtil.infoLog(editDevice.TAG, "entering in success");
	                }
	                
	                function deleteRules(tx)
	                {
	                   wemoUtil.infoLog(editDevice.TAG, "entering in success delete rules");
	             	   tx.executeSql('DELETE FROM RULES WHERE RuleID NOT IN (SELECT RuleID FROM RULEDEVICES GROUP BY RuleID);', [], executeSqlDeleteQuerySuccess, errorCB);
	             	   
		             	  /******** Delete weekly calender************/
		                   
		               		devicePlugin.execute(
		                        function(){
		                        	wemoUtil.infoLog(editDevice.TAG,"weekly calender deleted success---");		                                     		
		                        },
		                        editDevice.reportError,
		                        actions.DELETE_WEEKLY_CALENDAR,
		                        [groupID]
		                    );
		               	
		               /******** Delete weekly calender end************/
	               
		               		wemoUtil.infoLog(editDevice.TAG, "dimmingvalue3445---"+currentval+"====="+groupID+"---"+CurrentVal);
		               		var capabilities = ledCapabilities.DIMMING + "," + ledCapabilities.ONOFF;
		               		var inputArr = [CurrentVal,groupID,capabilities,"YES"];
	                
			                setTimeout(function(){
			                    devicePlugin.execute(
			                        function(){
			
			                            var newClass = editDevice.getBinaryStateImage(state);
			                            $("#"+groupID).attr('wemo-device-state-code',state);
			                            $("#"+groupID).removeClass();
			                            $("#"+groupID).addClass(newClass);
			                            $("#"+groupID).attr('wemo-device-state',newClass);
			
			                        },
			                        editDevice.reportError,
			                        ACTION_SET_LED_STATUS,
			                        [inputArr]
			                    );
			                },800);
			                
			                setTimeout(function(){
			                    devicePlugin.execute(
			                        function(response){
			                            var status = response[0].GetDeleteResponse;
			                            nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
			                            if(status == 1 || status !="")
			                            {
			                                editDevice.openDeviceListPage();
			                            }
			                        },
			                        editDevice.reportError,
			                        ACTION_DELETE_GROUP,
			                        [groupid]
			                    );
			                },1600);

                            setTimeout(function () {
                                editDevice.pushDB();
                            }, 1600);
			                
	     		       	 //nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
	                }
                
               /*****Database check before group delete end*******/        
               
            }
            
        });

        $("#find_bulb").on("click",function(e){
            nativeUtilPlugin.execute(null,null,actions.SHOW_RULE_PROGRESS,[]);
            var ssid = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
            wemoUtil.infoLog(editDevice.TAG, "ssid::"+ssid);    
       	 	var restartParam = "";
       	 
       	    wemoUtil.infoLog(editDevice.TAG, "PairedDeviceList "+restartParam);
            devicePlugin.execute(
                function(response){
                	wemoUtil.infoLog(editDevice.TAG, 'find bulb'+JSON.stringify(response));
                    nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                    
                    if(response == null || response == undefined || response == "")
                    {
                    	alert(wemo.items['findBulbFail']);
                    }
                    
                },
                editDevice.reportError,ACTION_FIND_BULB,[ssid,restartParam]);
            
            nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
            e.preventDefault();

        });

        //$("#device_edit_friendly_name").focus();
        if(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO) == "group"){
            $('.icon_container span.label').html('GROUP ICON');
        }
        if(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO) == "newgroup"){

            $('.icon_container span.label').html('GROUP ICON');
        }
        nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
    },

    bindEvents : function() {
        wemoUtil.infoLog(editDevice.TAG, 'bindEvents');
        document.addEventListener('online', editDevice.onOnline, false);
        document.addEventListener('offline', editDevice.onOffline, false);
        document.addEventListener('backbutton', editDevice.onBackPress, false);
        document.addEventListener('pause', editDevice.onPause, false);
        document.addEventListener('resume', editDevice.onResume, false);
    },

    onOffline : function() {
        wemoUtil.infoLog(editDevice.TAG, 'offLine');
    },

    onOnline : function() {
        wemoUtil.infoLog(editDevice.TAG, 'onLine');
    },

    onBackPress : function() {
    	window.sessionStorage.removeItem(sessionStore.DEVICE_SUCCESS);
        if ($(".more_tab").is(":visible")) {
            $(".more_tab").hide();
            $('body').find('.modalWindow').transition({opacity:0},400, function(){
                $(this).removeClass('isOpen');
            });
        }
        else {
            wemoUtil.infoLog(editDevice.TAG, 'onBackPress');
            editDevice.openDeviceListPage();
        }
    },

    onPause : function() {
    	nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
        wemoUtil.infoLog(editDevice.TAG, 'onPause');
    },

    onResume : function() {
    	nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
        wemoUtil.infoLog(editDevice.TAG, 'onResume');
    },

    reportError : function(e) {
        nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
        wemoUtil.infoLog(editDevice.TAG, 'Plugin Failure Call back!!!!   ' + e);
    },

    setupDOMListeners : function (){
        wemoUtil.infoLog(editDevice.TAG, 'setupDOMListeners');

        $('.custom_device_img').on('click', function(event) {
           $("#select_photo_popup").popup('open');

        });

        $('#photo_pick_option').on('click', '> li', function() {
            $('#select_photo_popup').attr('data-go-forward', 'true');

            var selected_id = $(this).attr('id');
            wemoUtil.infoLog(TAG, "Photo selection option: " + selected_id);
            if (selected_id === 'take_photo') {
                editDevice.getCameraPicker();
            } else if (selected_id === 'select_from_gallery') {
                editDevice.getGalleryPicker();
            } else if (selected_id === 'remove_photo') {
                editDevice.removePhoto();
            }
            $("#select_photo_popup").popup("close");

        });

        $('#reset_options').on('click', function(event){
            wemoUtil.infoLog(editDevice.TAG, 'reset options clicked');
            editDevice.openResetOptionsPage();
        });

        $('#edit_device_save_btn').on('click', function(e){
            wemoUtil.infoLog(editDevice.TAG, 'save clicked');
            var device_name = $('#device_edit_friendly_name').val();
            var name_validate =  /^[A-Za-z 0-9._-]{1,30}$/g;

            if(device_name.match(name_validate)){
            	if(buttonAction === false) // This will prevent event triggering more then once
                {
            		editDevice.saveEdit();
            		buttonAction = true;
                }
            }else{
            	$("#invalidNamePopup").popup('open');
            }
            
            e.preventDefault();
        });

        $("#invalidNamePopupOK").on('click', function() {
            $("#invalidNamePopup").popup('close');
        });
        
        $('#edit_device_cancel_btn').on('click', function(e){

            wemoUtil.infoLog(editDevice.TAG, 'cancel clicked');
            window.sessionStorage.removeItem(sessionStore.DEVICE_SUCCESS);
            editDevice.openDeviceListPage();
            e.preventDefault();
        });

        $("#gosh_message_ok_btn").on('click', function(){

            $("#gosh_message").popup('close');
        });
    },

    saveEdit : function(){
        wemoUtil.infoLog(editDevice.TAG, 'saveEdit');
        nativeUtilPlugin.execute(null,null,actions.SHOW_PROGRESS,[]);

        if(isRemoteEnabled && window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO) != "single")
        {
            var udn = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
            var friendly_name = $('#device_edit_friendly_name').val();
            //var groupdeviceIDS = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS);
            var groupdeviceIDS = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS).split(",");
            console.log(groupIDS.length+"*******"+groupdeviceIDS);
            var capabilityIDs1 = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES).split(",");

            if(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO) == "group")
            {
                var xmlString = "";
                var cdataStart = '<![CDATA[<CreateGroup>';
                var cdataEnd = '</CreateGroup>]]>';
                var refrenceID = udn;
                var groupname = friendly_name;
                var groupID = udn;
                var splitCapabilityArr = capabilityIDs1;
                var splitDeviceList = groupdeviceIDS;
                var groupUniqueID = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_UNIQUE_ID);
                var currentval = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CURRENTVAL);
                var iconversion = "";
                var faderval = window.sessionStorage.getItem(sessionStore.DEVICE_WEMO_DEVICE_FADER_VAL);
                var tempval = window.sessionStorage.getItem(sessionStore.DEVICE_WEMO_DEVICE_TEMPERATURE_VAL);
                var colorval = window.sessionStorage.getItem(sessionStore.DEVICE_WEMO_DEVICE_COLOR_VAL);
                var devicedropMacList = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_MAC_IDS);
                var capabilityIDsVal1 = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES_VALUE);
           
                if(currentval != "")
                {
                	currentInpvalArr = currentval.split(",");
                	currentval = currentInpvalArr[0];
                }
                if(faderval == "" || faderval == undefined || faderval == null)
            		faderval = 0;
                if(tempval == "" || tempval == undefined || tempval == null)
                	tempval = 0;
                if(colorval == "" || colorval == undefined || colorval == null)
                	colorval = 0;
                
                xmlString+= "<groups>" +
	    	        "  <group>" +
	    	        "  <id>" + groupUniqueID + "</id>" +
	    	        "  <referenceId>" + refrenceID + "</referenceId>" +
	    	        "  <groupName>" + groupname + "</groupName>" +
	    	        "  <iconVersion>" + iconversion + "</iconVersion>" +
	    	        "  <content>" + cdataStart +
	    	        "  <GroupID>" + refrenceID + "</GroupID>" +
	    	        "  <GroupName>" + groupname + "</GroupName>" +
	    	        "  <DeviceIDList>" + devicedropMacList + "</DeviceIDList>" +
	    	        "  <GroupCapabilityIDs>" + window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES) + "</GroupCapabilityIDs>" +
	    	        "  <GroupCapabilityValues>" + capabilityIDsVal1 + "</GroupCapabilityValues>" +
	    	        cdataEnd + " </content>" +
	    	        "  <devices>" ;
              
                for(var j=0; j<splitDeviceList.length;j++)
                {
                    xmlString+="  <device>" +
                        "  <deviceId>" + splitDeviceList[j] + "</deviceId>" +
                        "  </device>";
                }

                xmlString+="  </devices>" +
                    "  <capabilities>";

                for(var k=0;k<splitCapabilityArr.length;k++)
                {

                    var capabilityres = $.trim(splitCapabilityArr[k]);

                    if(capabilityres == ledCapabilities.ONOFF)
                    {
                        var Curval = "0";
                        xmlString+="  <capability>" +
                            "  <capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                            "  <currentValue>" + Curval + "</currentValue>" +
                            "  </capability>";
                    }
                    else if(capabilityres == ledCapabilities.DIMMING)
                    {
                        var Curval = currentval;
                        xmlString+="  <capability>" +
                            "  <capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                            "  <currentValue>" + Curval + "</currentValue>" +
                            "  </capability>";
                    }
                    else if(capabilityres == ledCapabilities.FADER)
                    {	
                        xmlString+="  <capability>" +
                            "  <capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                            "  <currentValue>" + faderval + "</currentValue>" +
                            "  </capability>";
                    }
                    else if(capabilityres == ledCapabilities.TEMPERATURE)
                    {	
                        xmlString+="  <capability>" +
                            "  <capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                            "  <currentValue>" + tempval + "</currentValue>" +
                            "  </capability>";
                    }
                    else if(capabilityres == ledCapabilities.COLOR)
                    {	
                        xmlString+="  <capability>" +
                            "  <capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                            "  <currentValue>" + colorval + "</currentValue>" +
                            "  </capability>";
                    }
                }

                xmlString+="  </capabilities>" +
                    "  </group>" +
                    "  </groups>";

                wemoUtil.infoLog(editDevice.TAG, "priting XML Data in Remote for group*****"+xmlString);
                nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
                editDevice.createGroups(xmlString,"updatefriendlyname");

            }
            else if(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO) == "newgroup")
            {
                var xmlString = "";
                var cdataStart = '<![CDATA[<CreateGroup>';
                var cdataEnd = '</CreateGroup>]]>';
                var refrenceID = Math.round(+new Date()/1000);
                var groupname = $('#device_edit_friendly_name').val();
                var groupID = Math.floor(Math.random()*1E16);
                var capabilityIDs1 = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES);
                var deviceList = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS);
                var deviceMacList = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_MAC_IDS);
                var deviceCurrentval = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CURRENTVAL);
                var splitCapabilityArr = capabilityIDs1.split(",");
                var splitDeviceList = deviceList.split(",");
                var dimmingvalue = "100";
                var Allowedarr = sessionStore.DEVICE_DEFAULT_ALLOWED_VAL;
                var iconversion ="";
                var faderval = window.sessionStorage.getItem(sessionStore.DEVICE_WEMO_DEVICE_FADER_VAL);
                var currentval = "";
                var curstate = "";
                var tempval = window.sessionStorage.getItem(sessionStore.DEVICE_WEMO_DEVICE_TEMPERATURE_VAL);
                var colorval = window.sessionStorage.getItem(sessionStore.DEVICE_WEMO_DEVICE_COLOR_VAL);
                
                if(deviceCurrentval != "" && deviceCurrentval != undefined)
                {
                	var deviceCurrArr = deviceCurrentval.split(",");
                	currentval = deviceCurrArr[0];
                    curstate = deviceCurrArr[1];
                    
                }
                else
                {
                	currentval = (dimmingvalue * Allowedarr)/100;
                    currentval = Math.round(currentval);
                    currentval = currentval+":0";
                    curstate = "0";
                }
                
                var revArr = [];
                var i = 5;

                 for(var j=0;j<splitCapabilityArr.length;j++)
                 {
                     if(splitCapabilityArr[j] == ledCapabilities.DIMMING)
                     {
                         revArr[0] = ledCapabilities.DIMMING;
                     }
                     else if(splitCapabilityArr[j] == ledCapabilities.ONOFF)
                     {
                         revArr[1] = ledCapabilities.ONOFF;
                     }
                     else if(splitCapabilityArr[j] == ledCapabilities.FADER)
                     {
                    	 revArr[3] = ledCapabilities.FADER;
                     }
                     else if(splitCapabilityArr[j] == ledCapabilities.TEMPERATURE)
                     {
                    	 revArr[4] = ledCapabilities.TEMPERATURE;
                     }
                     else if(splitCapabilityArr[j] == ledCapabilities.COLOR)
                     {
                    	 revArr[2] = ledCapabilities.COLOR;
                     }
                     else{
                    	 revArr[i] = splitCapabilityArr[j];
		                 i++;
		             }
                 }     
                 
                var capabilityIDs1 = revArr.join(",");
                wemoUtil.infoLog(editDevice.TAG, "capabilityIDs1 new group*****"+capabilityIDs1);
                splitCapabilityArr = capabilityIDs1.split(",");
                
                if(faderval == "" || faderval == undefined || faderval == "undefined")
                	faderval = 0;
                if(tempval == "" || tempval == undefined || tempval == "0" || tempval == "undefined")
                	tempval = sessionStore.DEFAULT_REMOTE_TEMPVALUE;
                if(colorval == "" || colorval == undefined || colorval == "0" || colorval == "undefined")
                	colorval = sessionStore.DEFAULT_REMOTE_COLORVALUE;
                
                //var inputVal3 = currentval+":0,0,"+faderval;
                var inputVal3 = currentval+","+curstate+","+colorval+","+faderval+","+tempval;
                var inputArr3 = [inputVal3];

                xmlString ="<groups>"+
                    "  <group>" +
                    "  <referenceId>" + refrenceID + "</referenceId>" +
                    "  <groupName>" + groupname + "</groupName>" +
                    "  <iconVersion>"+ iconversion +"</iconVersion>" +
                    "  <content>" + cdataStart +
                    "  <GroupID>" + refrenceID + "</GroupID>" +
                    "  <GroupName>" + groupname + "</GroupName>" +
                    "  <DeviceIDList>" + deviceMacList + "</DeviceIDList>" +
                    "  <GroupCapabilityIDs>" + capabilityIDs1 + "</GroupCapabilityIDs>" +
                    "  <GroupCapabilityValues>" + inputVal3 + "</GroupCapabilityValues>" +
                    cdataEnd + " </content>" +
                    "  <devices>" ;


                for(var j=0; j<splitDeviceList.length;j++)
                {
                    xmlString+="  <device>" +
                        "  <deviceId>" + splitDeviceList[j] + "</deviceId>" +
                        "  </device>";
                }

                xmlString+="  </devices>" +
                    "  <capabilities>";

                for(var k=0;k<splitCapabilityArr.length;k++)
                {

                    var capabilityres = $.trim(splitCapabilityArr[k]);

                    if(capabilityres == ledCapabilities.ONOFF)
                    {
                        //var Curval = "0";
                        xmlString+="  <capability>" +
                            "  <capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                            "  <currentValue>" + curstate + "</currentValue>" +
                            "  </capability>";
                    }
                    else if(capabilityres == ledCapabilities.DIMMING)
                    {
                        //var Curval = currentval+":0";
                        xmlString+="  <capability>" +
                            "  <capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                            "  <currentValue>" + currentval + "</currentValue>" +
                            "  </capability>";
                    }
                    else if(capabilityres == ledCapabilities.FADER)
                    {
                        xmlString+="  <capability>" +
                            "  <capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                            "  <currentValue>" + faderval + "</currentValue>" +
                            "  </capability>";
                    }
                    else if(capabilityres == ledCapabilities.TEMPERATURE)
                    {
                        xmlString+="  <capability>" +
                            "  <capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                            "  <currentValue>" + tempval + "</currentValue>" +
                            "  </capability>";
                    }
                    else if(capabilityres == ledCapabilities.COLOR)
                    {
                        xmlString+="  <capability>" +
                            "  <capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
                            "  <currentValue>" + colorval + "</currentValue>" +
                            "  </capability>";
                    }
                }

                xmlString+="  </capabilities>" +
                    "  </group>" +
                    "  </groups>";

                var deleteDeviceID = deviceMacList.split(",");
                //editDevice.deleteDeviceRules(deleteDeviceID);
                
                editDevice.deleteDeviceRules(deleteDeviceID[1]);
                editDevice.modifyDeviceRules(deleteDeviceID[0], refrenceID);
                
                wemoUtil.infoLog(editDevice.TAG, "new group creation XML "+xmlString);
       		    editDevice.createGroups(xmlString,"creategroup").done(function() {
	            	 nativeUtilPlugin.execute(null,null,actions.SHOW_RULE_PROGRESS,[]);
	                 editDevice.uploadDBOnCloud().done(function(){
	                   	 var obj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULES_DATA);                                     		
	                	 var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
	                	 wemoUtil.pushScheduleLedDevices(refrenceID.toString(),db,obj,"",1);
	            		 nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);
	     	     	  });
                });
       
            }
        }
        else if(isRemoteEnabled && window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO) == "single")
        {
            //editDevice.openDeviceListPage();
        	var friendlyname = $('#device_edit_friendly_name').val();
        	var pluginid = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_PLUGIN_ID);
        	var macadress = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
        	var bridgeDetails = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_BRIDGE_UDN);	
			var wemoBridgeObj = bridgeDetails;
			var len = wemoBridgeObj.length;   
			var bridgeMacAddress = "";
			var bridgePluginID = "";
            
            for (var i=0; i<len; i++) {
             var udn  =  wemoBridgeObj[i].udn;
             bridgeMacAddress  =  wemoBridgeObj[i].macAddress;
             bridgePluginID = wemoBridgeObj[i].pluginId;
             window.sessionStorage.setItem(sessionStore.LED_BRIDGE_UDN_ID, udn);
            }
            
            wemoUtil.infoLog(editDevice.TAG, "bridgeDetails "+"--- "+JSON.stringify(bridgeDetails)+"--- Bride UDN "+window.sessionStorage.getItem(sessionStore.LED_BRIDGE_UDN_ID));
        	
        	var xmlRequestString = editDevice.buildXMLRequest(buildXML.CHANGE_FRIENDLY_NAME, pluginid, macadress, friendlyname,bridgeMacAddress,bridgePluginID);
        	wemoUtil.infoLog(editDevice.TAG, "request edit XML "+xmlRequestString+"---"+pluginid+"---"+macadress+"---"+friendlyname);

            cordova.exec(
                function (params) {
                    console.log("success call back");
                    var authCode = params[0];
                    console.log("authCode" + authCode);
                    $.ajax({
                        url: cloudAPI.DEVICE_MESSAGE,
                        type: "POST",
                        data: xmlRequestString,
                        beforeSend: function (xhr) {
                            xhr.setRequestHeader('Content-Type', 'application/xml');
                            xhr.setRequestHeader('Authorization', authCode);
                        },
                        success: function (data) {
                            wemoUtil.infoLog(editDevice.TAG, "Sucess save power threshold response cloud...");
                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                            var responseXML = (new XMLSerializer()).serializeToString(data);
                            wemoUtil.log(editDevice.TAG, 'Save power threshold status: ' + responseXML);
                            editDevice.openDeviceListPage();
                        }
                    });
                },
                function (err) {
                    wemoUtil.infoLog(editDevice.TAG, "failure call back");
                    alert(wemo.items['settingFriendlynameFailed']);
                    nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                    editDevice.openDeviceListPage();
                }, "WebServicePlugin", "getAuthCode", []
            );

        } else {
            var udn = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
            wemoUtil.infoLog(editDevice.TAG, 'UDN to change friendly name: ' + udn);
            var friendly_name = $('#device_edit_friendly_name').val();

            wemoUtil.infoLog(editDevice.TAG, "friendly name******"+friendly_name+"ID*****"+udn);
            setTimeout(function(){

                if(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO) == "single") {
                	
                	 var PairedDeviceList = window.sessionStorage.getItem(sessionStore.PAIRED_DEVICES);
                	 var restartParam = "";
                	 
                	 wemoUtil.infoLog(editDevice.TAG, "PairedDeviceList "+restartParam);
                	 
                	 wemoUtil.infoLog(editDevice.TAG, "Before Sending friendly name******"+friendly_name+"ID*****"+udn);
                	 
                	 if(window.sessionStorage.getItem(sessionStore.DEVICE_SUCCESS) == "sucesspage") {
                		 var sesfriendlyname = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_FRIENDLY_NAME);
                		 wemoUtil.infoLog(editDevice.TAG, "entering in success page edit friendy"+sesfriendlyname);
                		 
                		 if($.trim(sesfriendlyname) != $.trim(friendly_name))
                		 {
                			 wemoUtil.infoLog(editDevice.TAG, "entering in success page edit friendlu name");
                			 devicePlugin.execute(
         	                        function(response){
         	                        	wemoUtil.infoLog(editDevice.TAG, "friedly response***"+JSON.stringify(response));
         	                            
         	                            if(response == null || response == "" || response == undefined)
         	                            {
         	                            	alert(wemo.items['settingFriendlynameFailed']);
         	                            	nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
         	                            }
         	                            else
         	                            {
         	                            	var status = response[0].GetFriendlyNameResponse;
         	                            		
         	  	                            wemoUtil.infoLog(editDevice.TAG, 'friendly name success callback: ' + status);


         	  	                            nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);

         	  	                            if(status == 1){
         	  	                                // devicePlugin.execute(null, null, actions.STOP_CONTROL_POINT, []);
         	  	                                if (!editDevice.imageChanged) {
         	  	                                    window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URI, editDevice.getDfaultURI())
         	  	                                }
         	  	                                editDevice.saveIconURL();
         	  	                                editDevice.openDeviceListPage();
         	  	                            }else{
         	  	                                alert(wemo.items['settingFriendlynameFailed']);
         	  	                                buttonAction = false;
         	  	                            }
         	  	                            
         	  	                            nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
         	                            }
         	                          
         	                            
         	                        },
         	                        editDevice.reportError,
         	                        actions.SET_LED_FRIENDLY_NAME,
         	                        [udn,friendly_name,restartParam]
         	                    );
                		 }
                		 else
                		 {
                			wemoUtil.infoLog(editDevice.TAG, "entering in success page else");
                            if (!editDevice.imageChanged) {
                                window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URI, editDevice.getDfaultURI())
                            }
                            editDevice.saveIconURL();
                		 	editDevice.openDeviceListPage();
                		 }
                		 
                     } else {
                		 devicePlugin.execute(
     	                        function(response){
     	                        	wemoUtil.infoLog(editDevice.TAG, "friedly response***"+JSON.stringify(response));
     	                            
     	                            if(response == null || response == "" || response == undefined)
     	                            {
     	                            	alert(wemo.items['settingFriendlynameFailed']);
     	                            	nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
     	                            }
     	                            else
     	                            {
     	                            	var status = response[0].GetFriendlyNameResponse;
     	                            		
     	  	                            wemoUtil.infoLog(editDevice.TAG, 'friendly name success callback: ' + status);
     	  	                            nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);

     	  	                            if(status == 1){
     	  	                                // devicePlugin.execute(null, null, actions.STOP_CONTROL_POINT, []);
                                            if (!editDevice.imageChanged) {
                                                window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URI, editDevice.getDfaultURI())
                                            }
                                             editDevice.saveIconURL();
     	  	                                editDevice.openDeviceListPage();
     	  	                            }else{
     	  	                                alert(wemo.items['settingFriendlynameFailed']);
     	  	                                buttonAction = false;
     	  	                            }
     	  	                            
     	  	                          nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
     	                            }
     	                          
     	                            
     	                        },
     	                        editDevice.reportError,
     	                        actions.SET_LED_FRIENDLY_NAME,
     	                        [udn,friendly_name,restartParam]
     	                    );
                	 }
                	 
	                   
                }
                else if(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO) == "group")
                {
                    //groupidS = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS).split(",");
                    var arrRev = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES).split(",");
                    
                    //var capabilityIDs1 = revArr.join(",");
                    var capabilityIDs1 = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES);
                    wemoUtil.infoLog(editDevice.TAG, "capabilityIDs1*****"+capabilityIDs1);
                    
                    var inputArr1 = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS)];
                    var inputArr2 = [capabilityIDs1];
                    var inputArr3 = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CURRENTVAL)];
                    var friendlyname = [$('#device_edit_friendly_name').val()];
                    wemoUtil.infoLog(editDevice.TAG, "group friendly name change****"+inputArr1+"*******"+inputArr2+"******"+inputArr3+"******"+friendlyname);
                    var groupid = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID)];

                    devicePlugin.execute(
                        function(response){
                        	
                        	if(response == null || response == undefined || response == "")
                        	{
                        		alert(wemo.items['settingFriendlynameFailed']);
                        		buttonAction = false;
                        		nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
                        	}
                        	else
                        	{
                        		var status = response[0].GetCreateGroupResponse;

                                if(status == 1 || status == 2 || status == 3 || status != "")
                                {
                                    editDevice.openDeviceListPage();
                                }
                                else
                                {
                                    alert(wemo.items['settingFriendlynameFailed']);
                                    buttonAction = false;
                                }
                                nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
                        	}
                            
                        },
                        editDevice.reportError,
                        ACTION_CREATE_GROUP,
                        [inputArr1,inputArr2,inputArr3,friendlyname,groupid]
                    );
                }
                else if(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_DEVICE_INFO) == "newgroup")
                {

                	//var capabilityIDs = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES);
                	var arrRev = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES).split(",");
                    //var capabilityIDs = revArr.join(",");
                	var capabilityIDs = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CAPABILITIES)
                    wemoUtil.infoLog(editDevice.TAG, "capabilityIDs1*****"+capabilityIDs);
                    
                	var inputArr1 = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS)];
                    var inputArr2 = [capabilityIDs];
                    var inputArr3 = [window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_CURRENTVAL)];
                    var friendlyname = [$('#device_edit_friendly_name').val()];
                    var groupid = ["0"];

                    wemoUtil.infoLog(editDevice.TAG, "group friendly name change new group****"+inputArr1+"*******"+inputArr2+"******"+inputArr3+"******"+friendlyname);

                    devicePlugin.execute(
                        function(response){                            

                            if(response == null || response == undefined || response == "")
                        	{
                            	alert(wemo.items['LEDGrpcreationFails']);
                            	buttonAction = false;
                        		nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
                        	}
                            else
                            {                            	
                            	var status = response[0].GetCreateGroupResponse;
                            	wemoUtil.infoLog(editDevice.TAG, "response "+JSON.stringify(response)+"---- "+status);
                            	
                            	if(status != "" && status != 0)
                                {

                                    var deleteDeviceRules = (window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_GROUP_DEVICE_IDS)).split(",");
                                    //editDevice.deleteDeviceRules(deleteDeviceRules);
                                    
                                    editDevice.deleteDeviceRules(deleteDeviceRules[1]);
                                    editDevice.modifyDeviceRules(deleteDeviceRules[0], status);
                                	var imageuri = $('.custom_device_img').css('background-image');
                                	wemoUtil.infoLog(editDevice.TAG, " new group imageuri"+imageuri+"---"+editDevice.imageChanged);
                                	window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ID, status);
                                	
                                	if(editDevice.imageChanged === true)
                                	{
                                		wemoUtil.infoLog(editDevice.TAG, "entering in image upload"+status);
                                        setTimeout(function () {
                                            editDevice.imageCloudCall(imageuri);
                                        }, 1500);
                                	}

                                    setTimeout(function () {
                                        editDevice.pushDB();
                                        
                                        setTimeout(function () {
                                        	var obj = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULES_DATA);                                     		
                                        	var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
                                        	wemoUtil.pushScheduleLedDevices(status,db,obj,"",1);
                                        },1000);
                                        
                                        
                                        setTimeout(function () {
                                        	nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
                                        	editDevice.openDeviceListPage();
                                        },3000);
                                    }, 500);

                                }
                                else
                                {
                                    alert(wemo.items['LEDGrpcreationFails']);
                                    buttonAction = false;
                                    nativeUtilPlugin.execute(null,null,actions.HIDE_PROGRESS,[]);
                                    editDevice.openDeviceListPage();
                                }
                            }
                            

                        },
                        editDevice.reportError,
                        ACTION_CREATE_GROUP,
                        [inputArr1,inputArr2,inputArr3,friendlyname,groupid]
                    );
                }


            },timeout.LONG);
        }

    },

    cancelEdit : function(e){
        editDevice.openDeviceListPage();
        e.preventDefault();
    },

    openDeviceListPage : function(){
    	window.sessionStorage.setItem(sessionStore.CLEAR_LED_CACHE, "1");
    	window.sessionStorage.removeItem(sessionStore.DEVICE_SUCCESS);
    	nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        wemoUtil.loadUrl(filePath.DEVICE_LIST);
    },

    openResetOptionsPage : function(){
        wemoUtil.loadUrl(filePath.LED_DEVICE_RESET_OPTIONS);
    },

    getCameraPicker : function() {
       var udn = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
        var information = {
            "udn" : udn,
            "ssid" : ""
        }
        smartDevicePlugin.execute(
            editDevice.onPhotoURISuccess,
            editDevice.reportError,
            actions.TAKE_PICTURE, [information]
        );
    },

    getGalleryPicker : function() {
        var udn = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);
        var information = {
             "udn" : udn,
             "ssid" : ""
        }

    	smartDevicePlugin.execute(
            editDevice.onPhotoURISuccess,
            editDevice.reportError,
            actions.CHOOSE_PHOTO, [information]
        );
    },

    removePhoto: function() {
        window.sessionStorage.setItem("device_thumb_url", editDevice.getDfaultURI());
        editDevice.imageChanged = true;
        $(".custom_device_img").css("background-image", 'url(' + editDevice.getDfaultURI() + ')');
        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URI, editDevice.getDfaultURI());
    },

    reportError: function(e) {
        wemoUtil.infoLog(TAG, "Plugin Failure Call back!!!!   " + e);
    },

    getDfaultURI : function(){
        return wemoUtil.getDefaultIconPath(wemoLed.TYPE);
    },

    onPhotoURISuccess : function(imageURI) {
        wemoUtil.infoLog(editDevice.TAG, "Image URI: " + imageURI);
        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URI, imageURI);
        editDevice.imageChanged = true;
        wemoUtil.infoLog(editDevice.TAG, 'imageURI src::'+imageURI);
        $(".custom_device_img").css("background-image", 'url(' + imageURI + ')');
    },

    saveIconURL: function() {
        var iconURL = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ICON_URI),
            udn = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_ID);

        var iconInfo = {
            "icon" : iconURL
        };
        var deviceInfo = {
            "udn" : udn
        };

        smartDevicePlugin.execute(
            null, null, actions.SET_DEVICE_PROPERTIES, [deviceInfo, iconInfo]
        );
    },

    createGroups: function (request,type){
        nativeUtilPlugin.execute(null,null,actions.SHOW_RULE_PROGRESS,[]);
        var dfd = $.Deferred();
        cordova.exec(function (params) {
            console.log("success call back");
            var authCode = params[0];
            var homeId = params[1];
            wemoUtil.infoLog(editDevice.TAG, "authCode" + authCode+ "---"+homeId);
            wemoUtil.infoLog(editDevice.TAG, "reuest sending to cloud..."+request+"******"+type);

            if(type == "updategroup" || type == "updatefriendlyname")
            {
                cloudurl = cloudAPI.LED_CREATE_GROUP + homeId +"?remoteSync=true";
                typeofcall = "PUT";
            } else if(type == "creategroup") {
                cloudurl = cloudAPI.LED_CREATE_GROUP + homeId +"?remoteSync=true";
                typeofcall = "POST";
            } else {
                cloudurl = cloudAPI.LED_CREATE_GROUP + homeId +"?remoteSync=true";
                typeofcall = "POST";
            }

            $.ajax({
                url: cloudurl,
                type: typeofcall,
                data: request,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader('Content-Type', 'application/xml');
                    xhr.setRequestHeader('Authorization', authCode);
                },
                success: function (data) {
                    nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);
                    console.log("Sucess from cloud444444...");
                    var responseXML = (new XMLSerializer()).serializeToString(data);
                    wemoUtil.log(TAG, responseXML);
                    
                    	 $(data).find('group').each(function () {
                             var code = $(this).find("code").text();
                             wemoUtil.infoLog(editDevice.TAG, "code result******"+code);

                             if(type == "updatefriendlyname" || type == "creategroup")
                             {
                                 editDevice.openDeviceListPage();
                             }
                             else if(type == "updategroup")
                             {
                                 $('#removedevice_status_header').html("Remove Device");
                                 $('#removedevice_status_body').html(wemo.items['deviceRemovedFromGroup']);
                                 $("#removedevice_status_popup").popup( "open" );
                             }
                         });
	                    
	                    dfd.resolve();

                },
                error: function (xhr, textstatus) {
                    wemoUtil.infoLog(TAG, 'status4444: ' + xhr.status);
                    wemoUtil.infoLog(TAG, 'status text444: ' + xhr.statusText);
                    alert(wemo.items['LEDGrpOperationFail']);
                    nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);
                    setTimeout(function(){
                    	editDevice.openDeviceListPage();
                    }, 1700);
                    dfd.resolve();
                }
            });

        }, function (err) {
        	wemoUtil.infoLog(editDevice.TAG, "failure call back");
            nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);
        }, "WebServicePlugin", "getAuthCode", []);

        return dfd;
    },

    deleteGroups: function (request,referenid){
        nativeUtilPlugin.execute(null,null,actions.SHOW_RULE_PROGRESS,[]);
        var dfd = $.Deferred();
        cordova.exec(function (params) {
        	wemoUtil.infoLog(editDevice.TAG, "success call back");
            var authCode = params[0];
            var homeId = params[1];
            wemoUtil.infoLog(editDevice.TAG, "authCode" + authCode+ "---"+homeId);
            wemoUtil.infoLog(editDevice.TAG, "reuest sending to cloud..."+request+"*******"+referenid);

            $.ajax({
                url: cloudAPI.LED_DELETE_GROUP + homeId +"/"+ referenid+ "?remoteSync=true",
                type: "POST",
                data: request,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader('Content-Type', 'application/xml');
                    xhr.setRequestHeader('Authorization', authCode);
                },
                success: function (data) {
                    nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);
                    wemoUtil.infoLog(editDevice.TAG, "Sucess from cloud444444...");
                    
	                    setTimeout(function(){
		                    editDevice.openDeviceListPage();
		                    
		                    $(data).find('group').each(function () {
		                        var code = $(this).find("resultCode").text();
		                        console.log(code);
		                        editDevice.openDeviceListPage();
		
		                    });
	                    }, 1700);
	                 dfd.resolve();

                },
                error: function (xhr, textstatus) {
                    wemoUtil.infoLog(TAG, 'status4444: ' + xhr.status);
                    wemoUtil.infoLog(TAG, 'status text444: ' + xhr.statusText);
                    nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);
                    alert(wemo.items['LEDGrpOperationFail']);
                    setTimeout(function(){
                    	editDevice.openDeviceListPage();
                    }, 1700);	
                    dfd.resolve();
                }
            });
        }, function (err) {
        	wemoUtil.infoLog(editDevice.TAG, "failure call back");
            nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);
        }, "WebServicePlugin", "getAuthCode", []);

        return dfd;
    },

    getBinaryStateImage: function (state) {
        if (state == "0") {
        	wemoUtil.infoLog(editDevice.TAG, "make the UI to dim");
            return "led_off";
        } else {
        	wemoUtil.infoLog(editDevice.TAG, "make the UI to glow");
            return "led_on";
        }
    },

    deleteDeviceRules: function (arr) {

    	wemoUtil.infoLog(editDevice.TAG, "entering in deleteDevice Rules"+arr+"---"+JSON.stringify(arr));

        db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
        db.transaction(deleteRulefromRD, errorCB, successCB);

        function deleteRulefromRD(tx){
        	wemoUtil.infoLog(editDevice.TAG, "DELETE from RULEDEVICES where DeviceID Like '%" + arr + "'");
            tx.executeSql("DELETE from RULEDEVICES where DeviceID Like '%" + arr + "'", [], executeSqlDeleteQuerySuccess, errorCB);

            db.transaction(function(tx){
                deleteRules(tx)
            },errorCB);

        }

        function executeSqlDeleteQuerySuccess(tx, results) {
        	wemoUtil.infoLog(editDevice.TAG, "entering in success");
        }

        function deleteRules(tx)
        {
        	wemoUtil.infoLog(editDevice.TAG, "entering in success delete rules");
        	wemoUtil.infoLog(editDevice.TAG, 'DELETE FROM RULES WHERE RuleID NOT IN (SELECT RuleID FROM RULEDEVICES GROUP BY RuleID);');
            tx.executeSql('DELETE FROM RULES WHERE RuleID NOT IN (SELECT RuleID FROM RULEDEVICES GROUP BY RuleID);', [], executeSqlDeleteQuerySuccess, errorCB);
        }
        function successCB() {
        	wemoUtil.infoLog(editDevice.TAG, "Success creating rules DB table structure ");
        }
        function errorCB() {
        	wemoUtil.infoLog(editDevice.TAG, "error creating rules DB table structure ");
        }
        
        /******** Delete weekly calender************/
        
        if(isRemoteEnabled)
        {
        	var bridgeDetails = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_BRIDGE_UDN);	
			var wemoBridgeObj = bridgeDetails;
			var len = wemoBridgeObj.length;   
			var bridgeMacAddress = "";
			var bridgePluginID = "";
            
              for (var i=0; i<len; i++)
              {
            	 var udn  =  wemoBridgeObj[i].udn;
            	 bridgeMacAddress  =  wemoBridgeObj[i].macAddress;
            	 bridgePluginID = wemoBridgeObj[i].pluginId;	
            	 window.sessionStorage.setItem(sessionStore.LED_BRIDGE_UDN_ID, udn);
              }
             
   
              	   var devID =arr;
              	   wemoUtil.infoLog(editDevice.TAG, "dev ID update weekly calender"+devID);
        		 
        		   var xmlRequestString = editDevice.buildXMLRequest(buildXML.UPDATE_WEEKLY_CALENDER,"",devID,"",bridgeMacAddress,bridgePluginID);
               	
	   	        	cordova.exec(
	   	                    function (params) {
	   	                        console.log("success call back");
	   	                        var authCode = params[0];
	   	                        console.log("authCode" + authCode);
	   	                        $.ajax({
	   	                            url: cloudAPI.DEVICE_MESSAGE,
	   	                            type: "POST",
	   	                            data: xmlRequestString,
	   	                            beforeSend: function (xhr) {
	   	                                xhr.setRequestHeader('Content-Type', 'application/xml');
	   	                                xhr.setRequestHeader('Authorization', authCode);
	   	                            },
	   	                            success: function (data) {
	   	                                var responseXML = (new XMLSerializer()).serializeToString(data);
	   	                                wemoUtil.log(editDevice.TAG, 'Save power threshold status: ' + responseXML);
	   	                            }
	   	                        });
	   	                    },
	   	                    function (err) {
	   	                    	wemoUtil.infoLog(editDevice.TAG, "update weekly calender failure call back");
	   	                        editDevice.loadDeviceListPage();
	   	                    }, "WebServicePlugin", "getAuthCode", []
	   	               );
            
        }
        else
        {
    		 var devID =arr;
    		 wemoUtil.infoLog(editDevice.TAG, "dev ID update weekly calender"+devID);

    		 devicePlugin.execute(
                     function(){
                    	 wemoUtil.infoLog(editDevice.TAG, "weekly calender deleted success---");		                                     		
                     },
                     editDevice.reportError,
                     actions.DELETE_WEEKLY_CALENDAR,
                     [devID]
             );
        	
        }
   	
   		/******** Delete weekly calender end************/
    },

    pushDB: function() {
        deviceTabPlugin.execute(
            function (e) {
            	wemoUtil.infoLog(editDevice.TAG, "push the DB");
            },
            editDevice.reportError,
            actions.PUSH_DB_TO_PLUGIN,
            []
        );
    },

    uploadDBOnCloud: function () {
    	var dfd = $.Deferred();
    	
        cordova.exec(function (params) {
            var authCode = params[0];
            var homeId = params[1];
            console.log("authCode" + authCode);
            console.log("homeId" + homeId);

            setTimeout(function () {
                deviceTabPlugin.execute(
                    function (responseAry) {
                    	wemoUtil.infoLog(editDevice.TAG, "entering in uploadDB success");
                    	
                    },
                    function () {
                    	wemoUtil.infoLog(editDevice.TAG, "failure DB call back...");
                        //wemoUtil.hideModal();
                    },
                    actions.STORE_DB_FROM_CLOUD, [homeId]
                );
            }, 100);
            dfd.resolve();

        }, function (err) {
            //wemoUtil.hideModal();
            console.log("failure call back");
        }, "WebServicePlugin", "getAuthCode", []);

        return dfd;
    },
    
    buildXMLRequest: function (type, pluginId, macAddress, data, bridgemac, bridgeplugin) {
        xmlString = "<plugins><plugin>" +
            "  <recipientId>" + bridgeplugin + "</recipientId>" +
            "  <macAddress>" + bridgemac + "</macAddress>" +
        	"  <modelCode>Bridge</modelCode>";

        switch (type) {
            case(buildXML.CHANGE_FRIENDLY_NAME):
                xmlString += "  <content><![CDATA[<changeFriendlyName>" +
                    "  <plugin>" +
                    "  <pluginId>" + pluginId + "</pluginId>" +
                    "  <macAddress>" + macAddress + "</macAddress>" +
                    "  <friendlyName>" + data + "</friendlyName>" +
                    "  </plugin>" +
                    "</changeFriendlyName>]]></content>";
                break;    
            case(buildXML.UPDATE_WEEKLY_CALENDER):
            	xmlString += " <content><![CDATA[<CalendarList>" +
                "<Calendar>" +
                "<DeviceID>" + macAddress + "</DeviceID>" +
                "<Mon></Mon>" +
                "<Tues></Tues>" +
                "<Wed></Wed>" +
                "<Thurs></Thurs>" +
                "<Fri></Fri>" +
                "<Sat></Sat>" +
                "<Sun></Sun>" +
                "</Calendar>" +
                "</CalendarList>]]>" +
                "</content>";
                break;  
        }

        xmlString += "</plugin></plugins>";

        return xmlString;
    },
    
    modifyDeviceRules: function (arr,groupid) {
    		wemoUtil.infoLog(editDevice.TAG, "entering in modify Rules"+arr+"---"+JSON.stringify(arr));
	        
	        db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
	        db.transaction(fetchGroupInfoRemote, errorCBRemote, successCBRemote);

            function fetchGroupInfoRemote(tx) {
                tx.executeSql('SELECT * from RULEDEVICES where DeviceID Like "%' + arr + '"', [], queryGroupSuccessRemote, errorCBRemote);
            }

            function errorCBRemote(err) {
            	wemoUtil.infoLog(editDevice.TAG, "error modifydevice");
            }

            function successCBRemote() {
            	wemoUtil.infoLog(editDevice.TAG, "Success creating rules DB table structure ");
            }

            function queryGroupSuccessRemote(tx, results) {
            	wemoUtil.infoLog(editDevice.TAG, "Fetching Data rule devices in edit group =>" + results.rows.length);

                var len = results.rows.length;
                var ruleDeviceRows = [];

                console.log("length of group***" + len);

                if (len > 0) {
                    for (var i = 0; i < len; i++) {
                        ruleDeviceRows[i] = results.rows.item(i);
                    }

                    db.transaction(function (tx) {
                        deleteRulesDevicesRemote(tx, ruleDeviceRows)
                    }, errorCBRemote);
                } 
            }
            
            function deleteRulesDevicesRemote(tx, ruleDeviceRows) {
            	wemoUtil.infoLog(editDevice.TAG, "entering in delte Rules");
            	var x = {};
                x.When = {};
                x.Devices = {};
                
                for (var i = 0; i < ruleDeviceRows.length; i++) {
                	var deviceIDDB = ruleDeviceRows[i].DeviceID;
                	var splitDeviceId = deviceIDDB.split(":");
       				var bridgeID = splitDeviceId[0]+":"+splitDeviceId[1];
       				var newdeviceID = bridgeID+":"+groupid;
       				
       				x.Devices[groupid]={};
       				x.Devices[groupid].SensorDuration = ruleDeviceRows[i].SensorDuration; 
					x.Devices[groupid].StartAction = ruleDeviceRows[i].StartAction;
					x.Devices[groupid].EndAction = ruleDeviceRows[i].EndAction;	
					x.Devices[groupid].FadeIn = "";
					x.Devices[groupid].FadeOut = "";
					x.Devices[groupid].Brightness = "";
       				x.Devices[groupid].SelectedLedValue = 1;
       				
       				tx.executeSql('UPDATE RULEDEVICES SET DeviceID="'+newdeviceID+'" WHERE RuleID in (' + ruleDeviceRows[i].RuleID + ') and DeviceID LIKE "%' + ruleDeviceRows[i].DeviceID + '"', [], executeSqlDeleteQueryRemoteSuccess, errorCBRemote);
       				 
                }
                wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULES_DATA,x);
                
            }

            function executeSqlDeleteQueryRemoteSuccess(tx, results) {
            	wemoUtil.infoLog(editDevice.TAG, "entering in success");
            }

            if(isRemoteEnabled)
   			{
            	var bridgeDetails = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_BRIDGE_UDN);	
    			var wemoBridgeObj = bridgeDetails;
    			var len = wemoBridgeObj.length;   
    			var bridgeMacAddress = "";
    			var bridgePluginID = "";
                
                  for (var i=0; i<len; i++)
                  {
                	 var udn  =  wemoBridgeObj[i].udn;
                	 bridgeMacAddress  =  wemoBridgeObj[i].macAddress;
                	 bridgePluginID = wemoBridgeObj[i].pluginId;	
                	 window.sessionStorage.setItem(sessionStore.LED_BRIDGE_UDN_ID, udn);
                  }
                 
       
	          	   var devID =arr;
	          	   wemoUtil.infoLog(editDevice.TAG, "dev ID update weekly calender"+devID);
	    		 
	    		   var xmlRequestString = editDevice.buildXMLRequest(buildXML.UPDATE_WEEKLY_CALENDER,"",devID,"",bridgeMacAddress,bridgePluginID);
	           	
	   	        	cordova.exec(
	   	                    function (params) {
	   	                    	wemoUtil.infoLog(editDevice.TAG, "success call back");
	   	                        var authCode = params[0];
	   	                        console.log("authCode" + authCode);
	   	                        $.ajax({
	   	                            url: cloudAPI.DEVICE_MESSAGE,
	   	                            type: "POST",
	   	                            data: xmlRequestString,
	   	                            beforeSend: function (xhr) {
	   	                                xhr.setRequestHeader('Content-Type', 'application/xml');
	   	                                xhr.setRequestHeader('Authorization', authCode);
	   	                            },
	   	                            success: function (data) {
	   	                                var responseXML = (new XMLSerializer()).serializeToString(data);
	   	                                wemoUtil.log(editDevice.TAG, 'Save power threshold status: ' + responseXML);
	   	                            }
	   	                        });
	   	                    },
	   	                    function (err) {
	   	                    	wemoUtil.infoLog(editDevice.TAG, "update weekly calender failure call back");
	   	                        editDevice.loadDeviceListPage();
	   	                    }, "WebServicePlugin", "getAuthCode", []
	   	               );
   			}
            else
            {
            	devicePlugin.execute(
                    function () {
                    	wemoUtil.infoLog(editDevice.TAG, "weekly calender deleted success---");
                    },
                    device_list_bridge.reportError,
                    actions.DELETE_WEEKLY_CALENDAR, [arr]
                );
            }
           
   		/******** Delete weekly calender end************/
    }
    
};
