var TAG = "select_insights.js: ";

$(document).bind('pageinit', function() {
	select_insights.initialize();
});

var select_insights = {

		initialize : function() {
			console.log(TAG + "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

		onDeviceReady : function() {
			console.log(TAG + "onDeviceReady");
			select_insights.bindEvents();
			//All initialization script goes here
	        var networktype = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_NETWORKTYPE);
	        var remoteEnable = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.REMOTE_CALL_ENABLE);
	        var ruleObj=JSON.parse(window.sessionStorage.getItem(sessionStore.RULE_NEW));
			
			select_insights.selectSwitch(networktype,remoteEnable);
			
			//To return back to home page: device list tab
			$(".wemo_logo").on("tap", function(e) {
				if ( e.target.nodeName!= "IMG" ) {				
					wemoUtil.loadUrl(filePath.DEVICE_LIST);
				}
			});
			
			$("#rules_container #select_").find('.select_switches_list').on("tap", function()
            {
				//var tempRule=JSON.parse(window.sessionStorage.getItem(sessionStore.RULE_NEW));
				window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE,$(this).attr("data-udn"));
				window.sessionStorage.setItem(sessionStore.CURRENT_DEVICE_NAME,$(this).text());
				window.sessionStorage.setItem(sessionStore.RULE_NEW,JSON.stringify(ruleObj));
				if(ruleObj.RuleType === "Motion Controlled"){
					wemoUtil.loadUrl(filePath.SENSORS_WHAT_HAPPENS);
				}else{
					wemoUtil.loadUrl(filePath.INSIGHT_WHAT_HAPPENS);
				}
			});
		},

		bindEvents : function() {
			console.log(TAG + "bindEvents");
			document.addEventListener('online', select_insights.onOnline, false);
			document.addEventListener('offline', select_insights.onOffline, false);
			document.addEventListener("backbutton", select_insights.onBackPress, false);
			document.addEventListener("pause", select_insights.onPause, false);
			document.addEventListener("resume", select_insights.onResume, false);
		},

		onOffline : function() {
			console.log(TAG + "offLine");
		},

		onOnline : function() {
			console.log(TAG + "onLine");
		},

		onBackPress : function() {
			if ($(".more_tab").is(":visible")) {
	    		$(".more_tab").hide();
	    		$('body').find('.modalWindow').transition({opacity:0},400, function(){
	                $(this).removeClass('isOpen');
	            });
	    	}
	    	else {
	    		console.log(TAG + "onBackPress");
	    		wemoUtil.loadPreviousUrl();
	    	}
			/*ruleObj.Devices[cd]={};
            delete ruleObj.Devices[cd];*/
			
		},

		onPause : function() {
			console.log(TAG + "onPause");
		},

		onResume : function() {
			console.log(TAG + "onResume");
		},

		reportError : function(e) {
			console.log(TAG + "Plugin Error!!!!   " + e);
		},
		deviceListBorder: function(){
             var switch_list = $("#select_").find(".select_switches_list").length;
            if(switch_list===1){
            	$(".select_switches_list").addClass("more_li_clone");
            }else if(switch_list === 2){
				$(".select_switches_list:first-child").addClass('more_li_clone more_li_clone_top');
				$(".select_switches_list:last-child").addClass('more_li_clone more_li_clone_bottom');
			}else if(switch_list >= 3){
				$(".select_switches_list:first-child").addClass('more_li_clone more_li_clone_top');
				$(".select_switches_list:last-child").addClass('more_li_clone more_li_clone_bottom');
				$(".select_switches_list").not(".select_switches_list:first-child, .select_switches_list:last-child").addClass('more_li_clone more_li_clone_no_radius');
			}
		},

        showDevices: function(action_device_type)
        {  
            deviceTabPlugin.execute(
                            function(params){
                                if(params.length>0){
                                    var html="";
                                    $.each(params,function(inx){
                                        html=html+'<div class="select_switches_list" data-udn="'+params[inx].udn+'"><span class="more_li_text_div text_strong">'+params[inx].friendlyName+'</span></div>';
                                    });

                                    $('#rules_container #select_').append($(html));
                                    select_insights.deviceListBorder();
                                }
                                else alert("No devices detected");
                            },
                            function(err){console.log("Error getting sensors list")},
                            action_device_type,
                            []);
		},
		selectSwitch : function(networktype,remoteEnable) {
		    console.log("success creating the table structures");
	        if ( networktype==networkType.HOME_NETWORK || networktype==null)
            {
	           console.log("Local Mode...");
               $('#rules_container #select_').html("");                                    		       
               this.showDevices(actions.SELECT_INSIGHTS);
			}
            else if (networktype==networkType.REMOTE_WIFI || networktype == networkType.REMOTE_MOBILE){
			    if(remoteEnable){
		                        	
                    var arrayInsightObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA);
                	
                    if(arrayInsightObjects.length>0){
                        var html="";
                        $('#rules_container #select_').html("");
                        $.each(arrayInsightObjects,function(inx){
                        	//alert("UDN : "+arraySwitchObjects[inx][key.DEVICE_UDN]+" "+arraySwitchObjects[inx][key.DEVICE_FRIENDLY_NAME]);
                            html=html+'<div class="select_switches_list" data-udn="'+arrayInsightObjects[inx][key.DEVICE_UDN]+'"><span class="more_li_text_div text_strong">'+arrayInsightObjects[inx][key.DEVICE_FRIENDLY_NAME]+'</span></div>';
                        });
                        
                        $('#rules_container #select_').html(html);
                        select_insights.deviceListBorder();
                    }
                    else alert("No devices detected");
		                        	
			    }else{
		    		navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {loadUrlTimeoutValue : 60000});
			    }
			}

		}
		

};
