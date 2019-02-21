$(document).bind('pageinit', function() {
	exportInterval.initialize();
});

var exportInterval = {
		TAG : 'export_interval.js: ',
		interval : "3",
        MILLIS_IN_DAY : 24*60*60*1000,
        MILLIS_IN_WEEK : 7*24*60*60*1000,

		initialize : function() {
			wemoUtil.infoLog(exportInterval.TAG, "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

	    onDeviceReady : function() {
	        wemoUtil.infoLog(exportInterval.TAG, "onDeviceReady");
	        exportInterval.bindEvents();
	        //All initialization script goes here
	        
	        exportInterval.interval = window.sessionStorage.getItem(sessionStore.DATA_EXPORT_SCHEDULE_MODE);
	        
	        exportInterval.applyScheduleInterval();
			
			//To return back to home page: device list tab
			$(".wemo_logo").on("tap", function(e) {
				if ( e.target.nodeName!= "IMG" ) {			
					window.sessionStorage.removeItem(sessionStore.DEVICE_EDIT_WEMO_POWER_THRESHOLD);
					window.sessionStorage.removeItem(sessionStore.THRESHOLD_IS_AUTO_SET);
					window.sessionStorage.removeItem(sessionStore.THRESHOLD_RESET);	

					window.sessionStorage.removeItem(sessionStore.DEVICE_EDIT_WEMO_COST_PER_KWH);
					wemoUtil.loadUrl(filePath.DEVICE_LIST);
				}
			});

	        //Daily click
	        $("#export_interval_daily").on("click", function(){
	        	exportInterval.interval = "1";
	        	exportInterval.applyScheduleInterval();
	        });
	        
	        //Weekly click
	        $("#export_interval_weekly").on("click", function(){
	        	exportInterval.interval = "2";
	        	exportInterval.applyScheduleInterval();
	        });
	        
	        //Monthly click
	        $("#export_interval_monthly").on("click", function(){
	        	exportInterval.interval = "3";
	        	exportInterval.applyScheduleInterval();
	        });
	    },
	    
	    applyScheduleInterval : function() {
	    	var now = new Date();
	    	now.setHours(0);
	    	now.setMinutes(0);
	    	now.setSeconds(0);
	    	now.setMilliseconds(0);
	    	var daysLeft = 0;
	    	$("#export_interval_daily").removeClass("export_li_arrow");
	    	$("#export_interval_weekly").removeClass("export_li_arrow");
	    	$("#export_interval_monthly").removeClass("export_li_arrow");
	    	switch (exportInterval.interval) {
	    	case "1":
	    		$("#export_interval_daily").addClass("export_li_arrow");
	    		daysLeft = 1;
	    		break;
	    	case "2":
		    	$("#export_interval_weekly").addClass("export_li_arrow");
		    	var nextWeekSunday = new Date(now.getTime() + exportInterval.MILLIS_IN_WEEK);
		    	nextWeekSunday.setDate(nextWeekSunday.getDate() - nextWeekSunday.getDay());
		    	daysLeft = (nextWeekSunday.getTime() - now.getTime())/(exportInterval.MILLIS_IN_DAY);
		    	break;
	    	case "3":
	        default:
	        	var nextMonthSunday = new Date(now.getTime());
	            if (nextMonthSunday.getMonth() == 11) {
	            	nextMonthSunday.setMonth(0);
	            	nextMonthSunday.setYear(nextMonthSunday.getYear() + 1);
	            }
	            nextMonthSunday.setMonth(nextMonthSunday.getMonth() + 1);
	            nextMonthSunday.setDate(7);
	            nextMonthSunday.setDate(nextMonthSunday.getDate() - nextMonthSunday.getDay());
	            daysLeft = (nextMonthSunday.getTime() - now.getTime())/(exportInterval.MILLIS_IN_DAY);
		    	$("#export_interval_monthly").addClass("export_li_arrow");
	            break;
	    	}
	    	if (daysLeft > 1) {
	    	    $("#next_email_interval").attr("_key", "ExportNextEmailDays");
	    	} else {
	    		$("#next_email_interval").attr("_key", "ExportNextEmailDay");
	    	}
    		wemoUtil.replaceParameters($("#next_email_interval"), [daysLeft]);
	    },

	    bindEvents : function() {
	        wemoUtil.infoLog(exportInterval.TAG, "bindEvents");
	        document.addEventListener('online', exportInterval.onOnline, false);
	        document.addEventListener('offline', exportInterval.onOffline, false);
	        document.addEventListener("backbutton", exportInterval.onBackPress, false);
	        document.addEventListener("pause", exportInterval.onPause, false);
	        document.addEventListener("resume", exportInterval.onResume, false);
	    },

	    onOffline : function() {
	        wemoUtil.infoLog(exportInterval.TAG, "offLine");
	    },

	    onOnline : function() {
	        wemoUtil.infoLog(exportInterval.TAG, "onLine");
	    },

	    onBackPress : function() {
	    	if ($(".more_tab").is(":visible")) {
	    		$(".more_tab").hide();
	    		$('body').find('.modalWindow').transition({opacity:0},400, function(){
	                $(this).removeClass('isOpen');
	            });
	    	}
	    	else {
		        wemoUtil.infoLog(exportInterval.TAG, "onBackPress");
		        window.sessionStorage.setItem(sessionStore.DATA_EXPORT_SCHEDULE_MODE, exportInterval.interval);
		        if (typeof (navigator.app) !== 'undefined') {
		            navigator.app.backHistory();
		        } else {
		            window.history.back();
		        }
	    	}
	    },

	    onPause : function() {
	        wemoUtil.infoLog(exportInterval.TAG, "onPause");
	    },

	    onResume : function() {
	        wemoUtil.infoLog(exportInterval.TAG, "onResume");
	    }
}