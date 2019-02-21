/*
 cloudServices.js

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

//App Recovery
var consitentFlag = false;
var counter = 0;
var maxRetryCount = 0;
var app_recovery_array = [];

var cloudServices = {
    TAG: 'cloudServices',

    buildXMLForStateChange: function (pluginId, macAddress, status, friendly_name) {
        xmlString = "<plugins>" +
            cloudServices.buildXMLForPluginDevice(pluginId, macAddress, status, friendly_name, "", buildXML.PLUGIN_STATE) +
            "</plugins>";
        return xmlString;
    },
    	buildXMLForStateChangeForMaker: function (pluginId, macAddress, status,attributelist, friendly_name) {
			xmlString = "<plugins>" +
			cloudServices.buildXMLForMakerPlugin(pluginId, macAddress,status, attributelist, friendly_name, buildXML.PLUGIN_STATE) +
			"</plugins>";
			return xmlString;
		},

    hideDevice: function (macAddress, successCallback, failCallback) {
        nativeUtilPlugin.execute(
            function (params) {
                wemoUtil.infoLog(cloudServices.TAG, 'hideDevice: ' + JSON.stringify(params) + ', macAddress: ' + macAddress);
                
                var homeId = params[1];
                var authCode = params[0];
                
                $.ajax({
                    url: wemoUtil.templator.fixIn(cloudAPI.HIDE_DEVICE, {
                        MacAddress: macAddress
                    }),
                    type: "POST",
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function (data) {
                        if (successCallback != undefined) {
                            successCallback(data);
                        }
                    },
                    error: function (data) {
                        if (failCallback != undefined) {
                            failCallback(data);
                        }
                    }

                });
            },
            function (data) {
                failCallback(data);
            },
            actions.GENERATE_AUTH_CODE,
            []
        );
    },

    buildXMLForPluginDevice: function (pluginId, macAddress, status, friendly_name, devicetype, type) {
        var cdataStart = '';
        var cdataEnd = '';
        if (type == buildXML.PLUGIN_STATE) {
            cdataStart = '<![CDATA[<pluginSetDeviceStatus>';
            cdataEnd = '</pluginSetDeviceStatus>]]>';

            xmlString = "  <plugin>" +
                "  <recipientId>" + pluginId + "</recipientId>" +
                "  <macAddress>" + macAddress + "</macAddress>" +
                "  <content>" + cdataStart +
                "  <plugin>" +
                "  <pluginId>" + pluginId + "</pluginId>" +
                "  <macAddress>" + macAddress + "</macAddress>" +
                "  <status>" + status + "</status>" +
                "  <friendlyName>" + friendly_name + "</friendlyName>" +
                "  <eventDuration></eventDuration>" +
                "  </plugin>" +
                cdataEnd + " </content>" +
                "  </plugin>"

        } else if (type = buildXML.FIRMWARE_VERSION) {
            cdataStart = '<![CDATA[<pluginDeviceStatus>';
            cdataEnd = '</pluginDeviceStatus>]]>';

            xmlString = "  <plugin>" +
                "  <recipientId>" + pluginId + "</recipientId>" +
                "  <macAddress>" + macAddress + "</macAddress>" +
                "  <modelCode>" + devicetype + "</modelCode>" +
                "  <content>" + cdataStart +
                "  <plugin>" +
                "  <pluginId>" + pluginId + "</pluginId>" +
                "  <macAddress>" + macAddress + "</macAddress>" +
                "  <status>" + status + "</status>" +
                "  <friendlyName>" + friendly_name + "</friendlyName>" +
                "  <eventDuration></eventDuration>" +
                "  </plugin>" +
                cdataEnd + " </content>" +
                "  </plugin>"
        }
        return xmlString;
    },
    		buildXMLForMakerPlugin: function (pluginId, macAddress, status, attributelist,friendly_name, type) {
			console.log("cloud services buildXMLForMakerPlugin:::: "+attributelist);
			var cdataStart = '';
			var cdataEnd = '';
			if (type == buildXML.PLUGIN_STATE) {
				cdataStart = '<![CDATA[<pluginSetDeviceStatus>';
				cdataEnd = '</pluginSetDeviceStatus>]]>';
				attributelist = "<attributeLists action=\"SetAttributes\" >"+attributelist+"</attributeLists>";
			} else if (type = buildXML.FIRMWARE_VERSION) {
				cdataStart = '<![CDATA[';
				cdataEnd = ']]>';
				attributelist = "<attributeLists action=\"GetAttributes\" >"+attributelist+"</attributeLists>";
			}
			xmlString = "  <plugin>" +
			"  <recipientId>" + pluginId + "</recipientId>" +
			"  <macAddress>" + macAddress + "</macAddress>" +
			"  <content>" + cdataStart +
			"  <plugin>" +
			"  <pluginId>" + pluginId + "</pluginId>" +
			"  <macAddress>" + macAddress + "</macAddress>" +
			"  <status>" + status + "</status>" 
			+ attributelist+
			"  <friendlyName>" + friendly_name + "</friendlyName>" +
			"  <eventDuration></eventDuration>" +
			"  </plugin>" +
			cdataEnd + " </content>" +
			"  </plugin>"
			console.log("cloud services buildXMLForMakerPlugin1 "+xmlString);
        return xmlString;
    },
		buildXMLForPlugin: function (pluginId, macAddress, status, friendly_name, type) {
			var cdataStart = '';
			var cdataEnd = '';
			if (type == buildXML.PLUGIN_STATE) {
				cdataStart = '<![CDATA[<pluginSetDeviceStatus>';
				cdataEnd = '</pluginSetDeviceStatus>]]>';
			} else if (type = buildXML.FIRMWARE_VERSION) {
				cdataStart = '<![CDATA[<pluginDeviceStatus>';
				cdataEnd = '</pluginDeviceStatus>]]>';
			}
			xmlString = "  <plugin>" +
			"  <recipientId>" + pluginId + "</recipientId>" +
			"  <macAddress>" + macAddress + "</macAddress>" +
			"  <content>" + cdataStart +
			"  <plugin>" +
			"  <pluginId>" + pluginId + "</pluginId>" +
			"  <macAddress>" + macAddress + "</macAddress>" +
			"  <status>" + status + "</status>" +
			"  <friendlyName>" + friendly_name + "</friendlyName>" +
			"  <eventDuration></eventDuration>" +
			"  </plugin>" +
			cdataEnd + " </content>" +
			"  </plugin>"
			return xmlString;
		},
    buildXMLForNightLightPlugin: function (pluginId, macAddress, status, friendly_name, type) {
        var cdataStart = '';
        var cdataEnd = '';

        if(type == buildXML.SET_NIGHT_LIGHT_STATUS){
            cdataStart = '<![CDATA[<pluginSetNightLightStatus>';
            cdataEnd = '</pluginSetNightLightStatus>]]>';
        }
        else if(type == buildXML.GET_NIGHT_LIGHT_STATUS){
            cdataStart = '<![CDATA[<pluginGetNightLightStatus>';
            cdataEnd = '</pluginGetNightLightStatus>]]>';
        }
        xmlString = "  <plugin>" +
            "  <recipientId>" + pluginId + "</recipientId>" +
            "  <macAddress>" + macAddress + "</macAddress>" +
            "<modelCode>Lightswitch</modelCode>"+
            "  <content>" + cdataStart +
            "  <plugin>" +
            "  <pluginId>" + pluginId + "</pluginId>" +
            "  <macAddress>" + macAddress + "</macAddress>" +
            "  <status>" + status + "</status>" +
            "  </plugin>" +
            cdataEnd + " </content>" +
            "  </plugin>"
        return xmlString;

    },

    buildXMLForNightLightStatus: function (pluginId, macAddress, status, value, friendly_name) {
        xmlString = "<plugins>" +
            cloudServices.buildXMLForNightLightPlugin(pluginId, macAddress, value, friendly_name, status) +
            "</plugins>";
        return xmlString;
    },

    getNightLightStatus: function(device, status, value, successCallback, errorCallback){
        request = cloudServices.buildXMLForNightLightStatus(device[0], device[1], status, value, device[2]);

        cordova.exec(function (params) {
            console.log("success call back");
            var authCode = params[0];
            console.log("authCode" + authCode);

            $.ajax({
                url: cloudAPI.STATE_CHANGE,
                type: "POST",
                data: request,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader('Content-Type', 'application/xml');
                    xhr.setRequestHeader('Authorization', authCode);
                },
                success: function (data) {
                    successCallback(data);
                },
                error: function (xhr, textstatus) {
                	wemoUtil.infoLog(TAG, 'status: ' + xhr.status);
                	wemoUtil.infoLog(TAG, 'status text: ' + xhr.statusText);
                	if(xhr.status == "503"){
                		wemoUtil.loadUrl(filePath.CLOUD_AVAILABILITY);
                	}
                }
            });

        }, function (err) {
            console.log("failure call back");
        }, "WebServicePlugin", "getAuthCode", []);
    },

    changeDeviceState: function (deviceObj, status, successCallback, errorCallback) {

        request = cloudServices.buildXMLForStateChange(deviceObj.pluginid, deviceObj.mac, status, deviceObj.name);

        cordova.exec(function (params) {
            console.log("success call back");
            var authCode = params[0];
            console.log("authCode" + authCode);

            $.ajax({
                url: cloudAPI.STATE_CHANGE,
                type: "POST",
                data: request,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader('Content-Type', 'application/xml');
                    xhr.setRequestHeader('Authorization', authCode);
                },
                success: function (data) {
                    successCallback(data);
                },
                error: function (xhr, textstatus) {
                	wemoUtil.infoLog(TAG, 'status: ' + xhr.status);
                	wemoUtil.infoLog(TAG, 'status text: ' + xhr.statusText);
                	if(xhr.status == "503"){
                		wemoUtil.loadUrl(filePath.CLOUD_AVAILABILITY);
                	}
                }
            });

        }, function (err) {
            console.log("failure call back");
        }, "WebServicePlugin", "getAuthCode", []);

    },
	changeDeviceStateForMaker: function (deviceObj, status,attributelist, successCallback, errorCallback) {

			request = cloudServices.buildXMLForStateChangeForMaker(deviceObj.pluginid, deviceObj.mac, status,attributelist, deviceObj.name);
			cordova.exec(function (params) {
				console.log("success call back");
				var authCode = params[0];
				console.log("authCode" + authCode);
				$.ajax({
					url: cloudAPI.STATE_CHANGE,
					type: "POST",
					data: request,
					beforeSend: function (xhr) {
						xhr.setRequestHeader('Content-Type', 'application/xml');
						xhr.setRequestHeader('Authorization', authCode);
					},
					success: function (data) {
						successCallback(data);
					},
					error: function (xhr, textstatus) {
						wemoUtil.infoLog(TAG, 'status: ' + xhr.status);
						wemoUtil.infoLog(TAG, 'status text: ' + xhr.statusText);
						if(xhr.status == "503"){
							wemoUtil.loadUrl(filePath.CLOUD_AVAILABILITY);
						}
					}
				});
			}, function (err) {
				console.log("failure call back");
			}, "WebServicePlugin", "getAuthCode", []);
		},
		
		sendAckToCloud: function (successCallback, errorCallback) {
			 console.log("sendAckToCloud:::");
			 cordova.exec(
			            function (params) {
			                var homeId = params[1];
			                var authCode = params[0];

			                    var cloudURL = cloudAPI.SEND_ACK_NEW_HOME +homeId;
			                    var methodType = "POST";
			               

			                console.log("entering in sendAckToCloud cloud call "+cloudURL);

			                $.ajax({
			                    url: cloudURL,
			                    type: methodType,

			                    beforeSend: function (xhr) {
			                        xhr.setRequestHeader('Content-Type', 'application/xml');
			                        xhr.setRequestHeader('Authorization', authCode);
			                    },
			                    success: function (data) {  
			                        successCallback(data);
			                    },
			                    error: function (xhr, textstatus) {
			                        wemoUtil.infoLog(TAG, 'sendAckToCloud status: ' + xhr.status);
			                        wemoUtil.infoLog(TAG, 'sendAckToCloud status text: ' + xhr.statusText);
			                        errorCallback(textstatus);
			                    }
			                });

			            },
			            function (err) {
			                errorCallback(err);
			            },
			            "WebServicePlugin",
			            "getAuthCode",
			            []
			        );
			    },
		
		
    getDeviceList: function (successCallback, errorCallback, reqtype) {
    	wemoUtil.infoLog(cloudServices.TAG, "getDeviceList >> reqtype:  "+reqtype);
    	var isHomeDevicesCall = false;
        appRecoveryMechanism.getData(function(recovery_array) {
        	consitentFlag = recovery_array[0];
        	counter = recovery_array[1];
        	maxRetryCount = recovery_array[2];
        	wemoUtil.infoLog(cloudServices.TAG, "appRecoveryMechanism :: << getDeviceList >> :: recovery_array[0] ::" + recovery_array[0] + " :: recovery_array[1] :: " + recovery_array[1] + " :: recovery_array[2] :: " + recovery_array[2]);

        	cordova.exec(
        			function (params) {
        				var homeId = params[1];
        				var authCode = params[0];

        				if(reqtype == "load" || reqtype == "refresh")
        				{
        					var cloudURL = cloudAPI.LED_DEVICE_LIST + homeId;
        					var methodType = "GET";
        					isHomeDevicesCall = true;
        				}
        				else if(reqtype == "autorefresh"||reqtype == "remote")
        				{
        					var cloudURL = cloudAPI.LED_DEVICE_LIST + homeId + "/remoteDataSynchronization";
        					var methodType = "POST";
        				}
        				else
        				{
        					var cloudURL = cloudAPI.LED_DEVICE_LIST + homeId;
        					var methodType = "GET";
        					isHomeDevicesCall = true;
        				}
        				wemoUtil.infoLog(cloudServices.TAG, "entering in device list cloud call "+cloudURL + "isHomeDevicesCall is:: " + isHomeDevicesCall);

        				$.ajax({
        					url: cloudURL,
        					type: methodType,

        					beforeSend: function (xhr) {
        						xhr.setRequestHeader('Content-Type', 'application/xml');
        						xhr.setRequestHeader('Authorization', authCode);
        					},
        					success: function (data) {
        						wemoUtil.infoLog(cloudServices.TAG, "getDeviceList:  entering in success:  "+(new XMLSerializer().serializeToString(data)));
        						app_recovery_array[0] = true;
    							app_recovery_array[1] = 0;
    							app_recovery_array[2] = parseInt(maxRetryCount);
    							appRecoveryMechanism.setData(app_recovery_array);
        						successCallback(data);
        					},
        					
        					error: function(xhr, textstatus) {
    							var result = xhr.responseText;
    							wemoUtil.infoLog(cloudServices.TAG, "appRecoveryMechanism :: xhr.status ::" + xhr.status + " isHomeDevicesCall is : " + isHomeDevicesCall);
    							wemoUtil.infoLog(cloudServices.TAG, "appRecoveryMechanism :: xhr.responseText ::" +  result);
    							var getErrorCodeStatus = function(xhr) {
    									return $(result).find('code').text()+ '#' + xhr.status ;
    							};
    							if(isHomeDevicesCall && appRecoveryMechanismErrorCodes.indexOf(getErrorCodeStatus(xhr)) > -1) {
    								wemoUtil.infoLog(cloudServices.TAG, "appRecoveryMechanism ::  counter ::" + counter + " :: consitentFlag ::" + consitentFlag + " :: maxRetryCount ::" + maxRetryCount);
    								app_recovery_array[0] = false;
    								app_recovery_array[1] = parseInt(counter)+1;
    								app_recovery_array[2] = parseInt(maxRetryCount);
    								appRecoveryMechanism.setData(app_recovery_array);
    							}
     						
    							errorCallback(textstatus);
        					}
        				});

        			},
        			function (err) {
        				errorCallback(err);
        			},
        			"WebServicePlugin",
        			"getAuthCode",
        			[]
        	);
        });
    },

    setDeviceIcon: function(mac, data, successCallback, errorCallback)
    {
        cordova.exec(
            function (params) {
                var authCode = params[0];

                console.log(cloudAPI.SET_DEVICE_ICON + mac);
                console.log(authCode);

                $.ajax({
                    url: cloudAPI.SET_DEVICE_ICON + mac,
                    data: data,
                    processData: false,
                    type: "POST",
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function (data) {
                        successCallback(data);
                    },
                    error: function (jqXHR, err) {
                        errorCallback(jqXHR.responseText);
                    }
                });

            },
            function (err) {
                errorCallback(err);
            },
            "WebServicePlugin",
            "getAuthCode",
            []
        );
    },

    getDeviceIcon: function(mac, successCallback, errorCallback)
    {
        cordova.exec(
            function (params) {
                var homeId = params[1];
                var authCode = params[0];

                console.log(cloudAPI.GET_DEVICE_ICON + mac);
                console.log(authCode);

                $.ajax({
                    url: cloudAPI.GET_DEVICE_ICON + mac,

                    type: "GET",
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function (data) {
                        successCallback(data);
                    },
                    error: function (jqXHR, err) {
                        errorCallback(jqXHR.responseText);
                    }
                });

            },
            function (err) {
                errorCallback(err);
            },
            "WebServicePlugin",
            "getAuthCode",
            []
        );
    },
    
    	buildCloudRequestForCollectEmail: function (data) {
    		console.log("buildCloudRequestForCollectEmail data is :: " + data);
    		var xmlString ="<userEmailAddresses>";
    		$(data.deviceTypes).each(function() {
    			xmlString += "<userEmailAddress><modelCode>" + this.type+"</modelCode><emailAddresses>";
    			$(this.emailAddress).each(function(str) {
    				xmlString += "<emailAddress>" + this+"</emailAddress>";
    			});
    			xmlString += "</emailAddresses></userEmailAddress>";
    		});
    		xmlString +="</userEmailAddresses>";
    		console.log("buildCloudRequestForCollectEmail xmlString:: " + xmlString);
    		return xmlString;
    	},
    	
    	buildstoreEmailonITsever: function (data) {
    		console.log("buildstoreEmailonITsever data is :: " + data);	
    		var i=0;
    		var request="";
    		var type;
    		$(data.deviceTypes).each(function() {
    			type=this.type;
    			$(this.emailAddress).each(function(str) {
    				if(i>0){
    					request +="&";
    					request += "email"+i+"="+this+"&DeviceType"+i+"="+type;
    				}
    				else{
    					request += "email"+"="+this+"&DeviceType"+"="+type;
    				}
    				i++;
    			});
    		});
    		console.log("buildstoreEmailonITsever email string:: " + request);
    		return request;
    	},
		
    storeEmail: function(data)
    {
    	request = cloudServices.buildCloudRequestForCollectEmail(data);
    	cordova.exec(
                function (params) {
                    var authCode = params[0];
                    console.log("storeEmail > authCode: " + authCode+" url: "+cloudAPI.COLLECT_EMAIL);

                    $.ajax({
                        url: cloudAPI.COLLECT_EMAIL,
                        type: "PUT",
                        data: request,
                        beforeSend: function (xhr) {
                            xhr.setRequestHeader('Content-Type', 'application/xml');
                            xhr.setRequestHeader('Authorization', authCode);
                        },
                        success: function (data) {
                            console.log(" storeEmail > success callback from cloud: " + data);
                            nativeUtilPlugin.execute(function(status){
                				console.log("storeEmail > Delete email address: " + status);
                			}, null,
                			actions.DELETE_EMAIL_ADDRESS, [0]);
                        }, 
                        error: function (xhr, textstatus) {
                            wemoUtil.infoLog(TAG, 'storeEmail status: ' + xhr.status);
                            wemoUtil.infoLog(TAG, 'storeEmail status text: ' + xhr.statusText);
                        }
                    });
                },
                function (err) {
                    console.log("storeEmail >failure call back");
                },
                "WebServicePlugin",
                "getAuthCode",
                []
            );
           
    },
    
    storeEmailonITsever: function(emailId)
    {
    	data = cloudServices.buildstoreEmailonITsever(emailId);
    	 //register email on belkin server
    	var urlStr="http://www.belkin.com/signup/wemo/?"+data;
    	console.log("storeEmailonITsever >  URL :: "+ urlStr);
        $.ajax({
        	url:urlStr ,
            type: "GET",
            beforeSend: function (xhr) {
                xhr.setRequestHeader('Content-Type', 'application/xml');
            },
            success: function (data) {
                console.log("storeEmailonITsever > success callback from server: ");
                nativeUtilPlugin.execute(function(status){
    				console.log("storeEmailonITsever > Delete email address: " + status);
    			}, null,
    			actions.DELETE_EMAIL_ADDRESS, [1]);
            },
            error: function (xhr, textstatus) {
                wemoUtil.infoLog(TAG, 'storeEmailonITsever status: ' + xhr.status);
                wemoUtil.infoLog(TAG, 'storeEmailonITsever status text: ' + xhr.statusText);
            }
        });    	
    }
};
