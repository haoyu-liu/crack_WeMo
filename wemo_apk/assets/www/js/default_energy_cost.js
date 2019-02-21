/*
 default_energy_cost.js

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

//USE locale or geo location  to get default country instead of hard coding per symbol 
//Used as it is done in IOS for now- NAGA

var defaultCountryForUnitCost = {
	"1"   : "US",
    "4"   : "DE",
    "3"   : "GB",
    "10"  : "JP",
    "13"  : "KR",
    "15"  : "TH",
    "7"   : "RU"
};

var defaultEnergyCost = {
	"US": {"id":1, "currencyId": "1", "cost": 0.111},
	"CA": {"id":2, "currencyId": "1", "cost": 0.093},
	"GB": {"id":3, "currencyId": "3;", "cost": 0.135},
	"DE": {"id":4, "currencyId": "2", "cost": 0.256},
	"FR": {"id":5, "currencyId": "2", "cost": 0.145},
	"NL": {"id":6, "currencyId": "2", "cost": 0.217},
	"RU": {"id":7, "currencyId": "7", "cost": 1.983},
	"AU": {"id":8, "currencyId": "1", "cost": 0.224},
	"NZ": {"id":9, "currencyId": "1", "cost": 0.243},
	"JP": {"id":10, "currencyId": "4", "cost": 21.55},
	"TW": {"id":11, "currencyId": "1", "cost": 3.606},
	"CN": {"id":12, "currencyId": "4", "cost": 0.555},
	"KR": {"id":13, "currencyId": "5", "cost": 120},
	"HK": {"id":14, "currencyId": "1", "cost": 1.398},
	"TH": {"id":15, "currencyId": "6", "cost": 0.259},
	"IT": {"id":16, "currencyId": "3", "cost": 0.213},
	"ES": {"id":17, "currencyId": "3", "cost": 0.17},
	"FI": {"id":18, "currencyId": "3", "cost": 0.155},
	"NO": {"id":19, "currencyId": "1", "cost": 0.9379999999999999},
	"AT": {"id":20, "currencyId": "3", "cost": 0.188},
	"CH": {"id":21, "currencyId": "3", "cost": 0.103},
	"SG": {"id":22, "currencyId": "1", "cost": 0.271},
	"MY": {"id":23, "currencyId": "1", "cost": 0.355}
	};

var currencySymbols = {
	"1" : "$" ,
	"2" : "&euro;",
	"3" : "&pound;" ,
	"4" : "&yen;"  ,
	"5" : "&#8361;" ,
	"6" : "&#3647;" ,
	"7" : "&#8369;" 
};
