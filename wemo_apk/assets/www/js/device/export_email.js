$(document).bind('pageinit', function() {
	var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));
	exportEmail.initialize();
});

var exportEmail = {
		TAG : 'export_email.js: ',
		email : '',

		initialize : function() {
			wemoUtil.infoLog(exportEmail.TAG, "initialize");
			document.addEventListener('deviceready', this.onDeviceReady, false);
		},

	    onDeviceReady : function() {
	        wemoUtil.infoLog(exportEmail.TAG, "onDeviceReady");
	        exportEmail.bindEvents();
	        //All initialization script goes here
	        
	        exportEmail.email = window.sessionStorage.getItem(sessionStore.DATA_EXPORT_EMAIL_ADDRESS);
	        $("#export_email").val(exportEmail.email);
	        $("#export_email").attr("maxlength", email.maxLength);
	        
	        wemoUtil.infoLog(exportEmail.TAG, exportEmail.email);
			
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

	        //Email click
	        $("#set_email_cancel_btn").on("click", function(){
	            wemoUtil.loadUrl(filePath.DEVICE_DATA_EXPORT);
	        });
	        
	        $("#set_email_done_btn").on("click", function(){
	        	var key=$('#export_email').val();
	        	wemoUtil.infoLog(exportEmail.TAG, "Done clicked: " + key);
	        	if(key !='') {
	                var regex = new RegExp("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
	                        + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
	                if (!regex.test(key)) {
	                   wemoUtil.replaceParameters($("[_key='InvalidEmailMessage']"), [key]);
	                   $( "#email_validation_popup" ).popup( "open" );
	                   return;
	                }
	        	}
	        	window.sessionStorage.setItem(sessionStore.DATA_EXPORT_EMAIL_ADDRESS, key);
	        	wemoUtil.loadUrl(filePath.DEVICE_DATA_EXPORT);
	        });
	        
            $("#email_validation_ok_btn").on("click", function(){
            	$( "#email_validation_popup" ).popup( "close" );
            });
	    },

	    bindEvents : function() {
	        wemoUtil.infoLog(exportEmail.TAG, "bindEvents");
	        document.addEventListener('online', exportEmail.onOnline, false);
	        document.addEventListener('offline', exportEmail.onOffline, false);
	        document.addEventListener("backbutton", exportEmail.onBackPress, false);
	        document.addEventListener("pause", exportEmail.onPause, false);
	        document.addEventListener("resume", exportEmail.onResume, false);
	    },

	    onOffline : function() {
	        wemoUtil.infoLog(exportEmail.TAG, "offLine");
	    },

	    onOnline : function() {
	        wemoUtil.infoLog(exportEmail.TAG, "onLine");
	    },

	    onBackPress : function() {
	    	if ($(".more_tab").is(":visible")) {
	    		$(".more_tab").hide();
	    		$('body').find('.modalWindow').transition({opacity:0},400, function(){
	                $(this).removeClass('isOpen');
	            });
	    	}
	    	else {
		        wemoUtil.infoLog(exportEmail.TAG, "onBackPress");
		        if (typeof (navigator.app) !== 'undefined') {
		            navigator.app.backHistory();
		        } else {
		            window.history.back();
		        }
	    	}
	    },

	    onPause : function() {
	        wemoUtil.infoLog(exportEmail.TAG, "onPause");
	    },

	    onResume : function() {
	        wemoUtil.infoLog(exportEmail.TAG, "onResume");
	    },

	    reportError : function(e) {
	        wemoUtil.infoLog(exportEmail.TAG, "Plugin Error!!!!   " + e);
	    }
}
