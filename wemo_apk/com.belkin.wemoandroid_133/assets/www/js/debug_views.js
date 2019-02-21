/*
    debug_views.js

    Created by Belkin International, Software Engineering on 18/09/2013. 
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

var TAG = "debug_views.js: ";

$(document).bind('pageinit', function() 
{
	debugViews.initialize();
});

var debugViews = {
        filesForTesting:
        [
           filePath.EDIT_COST_PER_KWH,
           filePath.DEVICE_LIST_EDIT,
           filePath.AFTER_MOTION_STOPS,
           filePath.EDIT_DAYS,
           filePath.ENABLED_RULES,
           filePath.SELECT_SWITCHES,
           filePath.WHAT_HAPPENS,
           filePath.WHEN,
           filePath.RULE_DETAILS,
           filePath.CREATE_RULE,
           filePath.EDIT_TIMER_RULE
        ],

		initialize : function() {
			console.log(TAG + "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

		onDeviceReady : function()
        {
		    console.log(TAG + "onDeviceReady ==>");
            var self = debugViews,
                elemId, 
                tmpl_data;

        	debugViews.bindEvents();
            
            /* it draws link buttons to the files in filesForTesting array*/ 
            for(var index in self.filesForTesting)
            {
               elemId = "debugFile" + index;
               tmpl_data = {id: elemId, file_name: self.filesForTesting[index]}; 
               
               $('#fileTestTmpl').tmpl(tmpl_data).appendTo('#debug_pages');

               $('#' + elemId).on("tap", tmpl_data, function(event)
               {
                  wemoUtil.loadUrl( event.data.file_name );
               });
            }

            /* some additional tests */
            self.testDB();
        },
        testDB: function()
        {
            var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
           
            trace("testDB() ====>");
			
            db.transaction(testDB, errorTestDB, successTestDB);
            function successTestDB(){

            }
            function errorTestDB(){
                
            }
            function testDB(tx)
            {
              querySuccessTest.entry = 0;
              tableNames = ["RULES", "RULEDEVICES", "BLOCKEDRULES", "DEVICECOMBINATION", "GROUPDEVICES", "RULESNOTIFYMESSAGE", "SENSORNOTIFICATION"];
              
              trace("Tracing DB =============================>");

              tx.executeSql('SELECT * FROM RULES ORDER BY CAST(RuleID as INT) DESC',[], querySuccessTest, errorTestDB);

              tx.executeSql('SELECT * FROM RULEDEVICES ORDER BY CAST(RuleID as INT) DESC',[], querySuccessTest, errorTestDB);

              tx.executeSql('SELECT * FROM BLOCKEDRULES',[], querySuccessTest, errorTestDB);

              tx.executeSql('SELECT * FROM DEVICECOMBINATION',[], querySuccessTest, errorTestDB);
			  
			  tx.executeSql('SELECT * FROM GROUPDEVICES',[], querySuccessTest, errorTestDB);
			  tx.executeSql('SELECT * FROM RULESNOTIFYMESSAGE',[], querySuccessTest, errorTestDB);
			  tx.executeSql('SELECT * FROM SENSORNOTIFICATION',[], querySuccessTest, errorTestDB);

              function querySuccessTest(tx,results)
              {
                trace("Tracing DB, tableName = ",  tableNames[querySuccessTest.entry++] );
				trace("Tracing DB, count rows = ",  results.rows.length );
 
                var len = results.rows.length;
                var ruleRows=[];
                    if(len>0) 
                    {
                        for(var i=0; i < len; i++)
                        {
                            ruleRows[i]=results.rows.item(i);

                            trace("row #", i, results.rows.item(i));
                        }
                    }
              }
            }
        },
       
		bindEvents : function() {
			console.log(TAG + "bindEvents");
			document.addEventListener('online', debugViews.onOnline, false);
			document.addEventListener('offline', debugViews.onOffline, false);
			document.addEventListener("backbutton", debugViews.onBackPress, false);
			document.addEventListener("pause", debugViews.onPause, false);
			document.addEventListener("resume", debugViews.onResume, false);
		},

		onOffline : function() {
			console.log(TAG + "offLine");
		},

		onOnline : function() {
			console.log(TAG + "onLine");
		},

		onBackPress : function() {
            console.log(TAG + "onBackPress");
            navigator.app.exitApp();
		},

		onPause : function() {
			console.log(TAG + "onPause");
		},

		onResume : function() {
			console.log(TAG + "onResume");
		}

};