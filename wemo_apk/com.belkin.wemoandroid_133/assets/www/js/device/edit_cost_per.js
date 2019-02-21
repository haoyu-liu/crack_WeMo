$(document).bind('pageinit', function () {
	var w = wemoUtil.getScreenWidth();
    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));
    editCostPer.initialize();

    $("#cnl_cur_btn").on("tap", function (e) {
        $('.overlayScrollPicker').attr('style', 'visibility: hidden;');
        e.preventDefault();
        e.stopPropagation();
    });

    $("#set_cur_btn").on("tap", function (e) {
        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY_SYMBOL, $('input[name=currency]:checked').val());
        var currency_symbol = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY_SYMBOL);
        $('#currency span').html(currency_symbol);
        //$('.edit_device_button_text').html(currency_symbol);

        var cost_str = $(".cost_per_current_value").html();
        $(".cost_per_current_value").html(cost_str.replace(/^(.{0})./, currency_symbol));

        console.log("set cur " + currency_symbol);
        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY, $('input[name=currency]:checked').attr("id"));
        console.log(window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY));

        $('.overlayScrollPicker').attr('style', 'visibility: hidden;');
        e.preventDefault();
        e.stopPropagation();
    });
});


var idCurrency = {
    "$" : "1",//default value
    "&euro;" : "4",
    "&pound;" : "3",
    "&yen;" :  "10",
    "&#8361;" : "13",
    "&#3647;" : "15",  
    "&#8369;" : "7"
};


var DEFAULT_CURRENCY_ID = 1;

var editCostPer = {

    TAG: 'edit_cost_per.js: ',
    

    initialize: function () {
        wemoUtil.infoLog(editCostPer.TAG, "initialize");
        document.addEventListener('deviceready', this.onDeviceReady, false);
		var currency_sym = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY_SYMBOL);
        $('#currency span').html(currency_sym);
		var id = idCurrency[ currency_sym ];
		$("input[id='"+id+"']").attr("checked","checked");
    },

    onDeviceReady: function () {
        wemoUtil.infoLog(editCostPer.TAG, 'onDeviceReady');
        editCostPer.bindEvents();
        wemoUtil.infoLog(editCostPer.TAG, window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN));

        //Fill current cost per kwh value
        var udn = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN);
        var session_cost_per = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_COST_PER_KWH);
        //var currency = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY);
        var currency_sym = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY_SYMBOL);
        if (!session_cost_per) {
            devicePlugin.execute(function (cur_value) {
                    editCostPer.fillCurrentValue('.cost_per_current_value', currency_sym + editCostPer.formatCost(cur_value['EnergyPerUnitCost']));
                    $('#set_cost_per').on("tap", function (e) {
                        console.log($('#currency span').html());
                        $("#costper_selector").BelkinPicker({type: "coster", curval: editCostPer.formatCost(cur_value['EnergyPerUnitCost'])/*, currency: $('#currency span').html()*/}, "show", function (val) {
                                //window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_COST_PER_KWH, val.replace('.', ''));
                                var cost = new editCostPer.Cost(val);
                                window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_COST_PER_KWH, cost.encoded);
                                editCostPer.fillCurrentValue('.cost_per_current_value', $('#currency span').html() + cost.value);
                                $("#costper_selector").BelkinPicker({}, "hide");
                            }
                        );
                        e.preventDefault();
                    });
                },
                editCostPer.reportError,
                actions.GET_ENERGY_PER_UNIT_COST,
                [udn]
            );
        } else {
            editCostPer.fillCurrentValue('.cost_per_current_value', currency_sym + editCostPer.formatCost(session_cost_per));
            $('#set_cost_per').on("tap", function (e) {
                $("#costper_selector").BelkinPicker({type: "coster", curval: editCostPer.formatCost(session_cost_per), /*currency: currency_sym*/}, "show", function (val) {
                        //window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_COST_PER_KWH, val.replace('.', ''));
                        var cost = new editCostPer.Cost(val);
                        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_COST_PER_KWH, cost.encoded);
                        editCostPer.fillCurrentValue('.cost_per_current_value', currency_sym + cost.value);
                        $("#costper_selector").BelkinPicker({}, "hide");
                    }
                );
                e.preventDefault();
            });
        }

        editCostPer.setupDOMListeners();
    },

    bindEvents: function () {
        wemoUtil.infoLog(editCostPer.TAG, 'bindEvents');
        document.addEventListener('backbutton', editCostPer.onBackPress, false);
    },

    setupDOMListeners: function () {
        wemoUtil.infoLog(editCostPer.TAG, 'setupDOMListeners');

        //To return back to home page: device list tab
        $(".wemo_logo").on("tap", function (e) {
            if (e.target.nodeName != "IMG") {
                window.sessionStorage.removeItem(sessionStore.DEVICE_EDIT_WEMO_POWER_THRESHOLD);
                window.sessionStorage.removeItem(sessionStore.THRESHOLD_IS_AUTO_SET);
                window.sessionStorage.removeItem(sessionStore.THRESHOLD_RESET);

                window.sessionStorage.removeItem(sessionStore.DEVICE_EDIT_WEMO_COST_PER_KWH);
                wemoUtil.loadUrl(filePath.DEVICE_LIST);
            }
        });

        $("#currency").on("tap", function (e) {
			$(".overlayScrollPicker").css("visibility","visible");
			var currency_symbol = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY_SYMBOL);
			$("input[value='"+currency_symbol+"']").attr("checked","checked");
			//Fix for WEMO-21960 Currency picker blinking
			e.preventDefault();
			e.stopPropagation();			
        });

        //Reset to default
        $('#reset_to_default').on('tap', function () {
            $("#reset_to_default_message").popup('open');
        });
        $('#reset_to_default_ok_btn').on('click', function () {
            editCostPer.resetOkBtnHandler();
        });
        $('#reset_to_default_cancel_btn').on('click', function () {
            $("#reset_to_default_message").popup('close');
        });
    },

    onBackPress: function () {
        wemoUtil.infoLog(editCostPer.TAG, 'onBackPress');
        window.history.back();
    },

    reportError: function (e) {
        wemoUtil.infoLog(editCostPer.TAG, 'Plugin Failure Call back!!!!   ' + e);
    },

    resetOkBtnHandler: function () {
    	var currencyId = editCostPer.getCurrencyId();
    	var currencySym = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY_SYMBOL);
    	//var defaultCost = editCostPer.formatCost('' + editCostPer.getDefaltCost(editCostPer.getDefaltCountryId(currencyId)));
       	//window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_COST_PER_KWH, defaultCost.replace('.', ''));
        var defaultCost = new editCostPer.Cost('' + editCostPer.getDefaltCost(editCostPer.getDefaltCountryId(currencyId)));
        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_COST_PER_KWH, defaultCost.encoded);
        
    	//editCostPer.fillCurrentValue('.cost_per_current_value', currencySym + defaultCost);
        editCostPer.fillCurrentValue('.cost_per_current_value', currencySym + defaultCost.value);
        $("#reset_to_default_message").popup('close');
         /*
        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_COST_PER_KWH, "0111");
        window.sessionStorage.setItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY, "1");
        editCostPer.fillCurrentValue('.cost_per_current_value', '$0.111');
        $("#reset_to_default_message").popup('close');
        */
    },

    fillCurrentValue: function (value_class, cur_value) {
        wemoUtil.infoLog(editCostPer.TAG, 'fillCurrentValue: ' + cur_value);
        cur_value_item = $(value_class);
        cur_value_item.find('.cur_value_loading').hide();
        cur_value_item.html(cur_value);
    },
    
    formatCost: function (obj_value) {
        return editCostPer.decodeValue(obj_value);
    },    
    
    decodeValue: function(encodedValue) {
        var CAPACITY = 4;
        var digits = ("" + encodedValue).split('');
        digits.splice(digits.length - CAPACITY + 1, 0, '.');
        return digits.join(''); 
    },    
    
    Cost: function(value) {
        var CAPACITY = 4;
      
        // Parse value
        this.digits = value.split('');
        this.indexOfPeriod = this.digits.indexOf('.');
      
        if (this.indexOfPeriod > -1) {
            this.digits.splice(this.indexOfPeriod, 1); //Remove period
        }       
        
        if (this.digits.length > CAPACITY) {            
            this.digits = this.digits.slice(0, CAPACITY); //Truncate array
            if (this.indexOfPeriod > this.digits.length - 1) {
                this.indexOfPeriod = -1; // Period was truncated
            }
        } else {              
            if (this.indexOfPeriod > -1) {
                // Add ending zeroes                
                while (this.digits.length < CAPACITY) {
                    this.digits.push(0);
                }              
            }  
        }
                       
        this.encodeCost = function() {          
            var digits = this.digits.slice(0); //Make a copy of Array
            for (var i=2; i <= this.indexOfPeriod; i++) {
                digits.push('0');
                // 0.111 => 0111
                // 21.55 => 21550
                // 120.00 => 120000
            }
            return digits.join('');
        }; 

        this.decodeValue = function(encodedValue) {                        
            var digits = ("" + encodedValue).split('');
            //push period (.) to digits array 
            digits.splice(digits.length - CAPACITY + 1, 0, '.');
            return digits.join('');            
        };
        
        this.valueOfCost = function() {
            var digits = this.digits.slice(0); //Make a copy of Array
            if (this.indexOfPeriod > -1) {
                digits.splice(this.indexOfPeriod, 0, '.');  //Add period
            }    
            return digits.join('');
        };
            
        this.encoded = this.encodeCost();
        this.decoded = this.decodeValue(this.encoded);
        this.value = this.valueOfCost();      
    },      
    
    getCurrencyId: function () {
    	//Locale may also need to be used to determine country. 
    	//But implemented just like IOS for now - NAGA
         var currencyId = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_CURRENCY);
         if(!currencyId )
         {
        	 currencyId = DEFAULT_CURRENCY_ID;
         }        
         return currencyId;
        
    },

    
    getDefaltCountryId: function (currencyId) {
    	//Locale may also need to be used to determine country. 
    	//But implemented just like IOS for now - NAGA
         var countryId = defaultCountryForUnitCost[DEFAULT_CURRENCY_ID];
         if(currencyId)
         {
        	  countryId = defaultCountryForUnitCost[currencyId];
         }
         if(!countryId)
         {
        	 	countryId = defaultCountryForUnitCost[DEFAULT_CURRENCY_ID];
         }
         return countryId;
        
    },

	getDefaltCost: function (countryId) {
		 var defaultCost = "0.111";
	     var cost = defaultCost;
	     if(countryId)
	     {
	    	 cost = '' +defaultEnergyCost[countryId]["cost"];
	     }
	     if(!cost){
	    	 cost = defaultCost;
	     }
	     else {
	    	 cost = cost.indexOf(".") > -1 ? cost : cost + ".00";
	     }
	    	 
	     wemoUtil.infoLog(editCostPer.TAG, "getDefaltCost cost: "+cost);
	     return cost;
	    
	}
};
