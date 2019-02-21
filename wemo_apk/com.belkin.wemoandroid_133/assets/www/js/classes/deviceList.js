/*
 deviceList.js

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

var deviceList = {
    _deviceList: new Array(),

    addDevice: function(udn, name, productName)
    {
        deviceList._deviceList[udn] = {name: name, state: '', duration: '', productName: productName};
    },
    // for led devices
    addLedDevice: function(udn, name, bridgeUdn, productName)
    {
        deviceList._deviceList[udn] = {name: name, state: '', duration: '', bridgeudn: bridgeUdn , productName: productName};
    },
    addMakerDevice: function(udn, name, switchMode, productName)
    {
        deviceList._deviceList[udn] = {name: name, state: '', duration: '', switchMode: switchMode, productName: productName};
    },

    removeDevice: function(udn)
    {
       delete deviceList._deviceList[udn];
    },

    unsetActive: function(udn)
    {
        deviceList._deviceList[udn]['state'] = '';
        deviceList._deviceList[udn]['duration'] = '';
    },

    setActive: function(udn, state, duration)
    {
        console.log(deviceList._deviceList[udn]);
        deviceList._deviceList[udn]['state'] = state;
        deviceList._deviceList[udn]['duration'] = duration;

        console.log(deviceList._deviceList[udn]);
    },

    getDevice: function(udn)
    {
        return deviceList._deviceList[udn];
    },

    getArray: function()
    {
        return deviceList._deviceList;
    },

    printDevices: function()
    {
        console.log(JSON.stringify(deviceList._deviceList));
    }

};