(function () {

define('widgets/wemo_dimmer/js/model',['Cache'],
    /**
     * @exports model class and instantiated model
     */
    function(Backbone) {

        'use strict';

        var mockPath = 'widgets/wemo_dimmer/mocks/';

        var Model = Backbone.WemoDeviceModel.extend({
            /**
             * default data values
             */
            defaults: {
                "binaryState": 0,
                "brightness": 100,
                "tempBrightness": 100,
                "fader": "300:-1:0:0.1:100",
                "customTime": 0,
                "nightMode": 0,
                "nightModeBrightness": 20,
                "sleepTimerToggle" : 0,
                "startTime": 60,
                "endTime": 23400,
                'countDownLabel': '',
                'ruleAutoOffTime': 0,
                "defaultFriendlyName": "",
                "longPressRuleDeviceCnt":"0",
                "longPressRuleDeviceUdn": "",
                "longPressRuleAction":"1",
                "longPressRuleState" : "1",
                "longPressRuleDeviceMsg" : "",
                "turnOnLevel" : 85,
                "minLevel" : 65,
                "maxLevel":  225,
                "bulbType" : "CFL",
                "isConfigDone" : 0,
                "overTemp" : 0,
                "hushMode": "0:0:1",
                "defaultIcon": "file:///android_asset/www/img/new_icons/WeMo_Dimmer_@3x.png"
            },
            /**
             * Validation fields, uses Backbone.validation
             */
            validation: {
                'binaryState': {
                    required: true
                },
                'brightness': {
                    required: true
                },
                'fader': {
                    required: true
                },
                'nightMode': {
                    required: true
                },
                'nightModeBrightness': {
                    required: true
                },
                'startTime': {
                    required: true
                },
                'endTime': {
                    required: true
                }
            },
            /**
             * Executes the setAttribute native command
             * @param {string} variable
             * @returns {object}
             */
            saveAction: function(variable) {
                return this.save(variable);
            },
            saveActionWithVal: function(variable, val) {
                return this.save(variable, val);
            },
            /**
             * Urls, statusUrl, and rulesUrl all allow dummy data to be loaded for demo/test
             * @returns {string}
             */
            url: function() {
                return mockPath + 'device.json';
            },
            /**
             * @returns {string}
             */
            remoteStatusUrl: function() {
                return mockPath + 'status.xml';
            }
        });

        return {
            Model: Model,
            model: new Model() //we need to pass a shared model, but we want the base object available for unit testing
        };
    });

/* START_TEMPLATE */
define('hbs!widgets/wemo_dimmer/templates/tile',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  


  return "<header class=\"row-tile\">\n    <div class=\"tile1\">\n        <span class=\"icon\" data-bind=\"iconURL\"></span>\n    </div>\n    <div class=\"tile2 description\">\n        <h1 data-bind=\"friendlyName\"></h1>\n        <span class=\"status\">\n            <span data-bind=\"brightnessVal\"></span>\n            <span data-bind=\"countDown\"></span>\n        </span>\n        <div class=\"drawerArrow closed\"></div>\n    </div>\n    <div class=\"tile3 power\">\n        <div class=\"powerInner\">\n            <div class=\"bevel\"></div>\n            <div class=\"animated\"></div>\n            <div class=\"css-spinner\"></div>\n            <div class=\"target\"></div>\n            <div class=\"powerState powerState-1\" data-bind=\"modeIcon\"></div>\n        </div>\n    </div>\n</header>";
  });
Handlebars.registerPartial('widgets_wemo_dimmer_templates_tile', t);
return t;
});
/* END_TEMPLATE */
;
define('mixins/tile.countdownTimer',[], function() {
    'use strict';

    function updateCountDown() {
        var countdownEndTime = parseInt(this.model.get('ruleAutoOffTime'), 10),
            auxTime = new Date(countdownEndTime * 1000),
            correctTime,
            currentTime = Math.round(new Date().getTime() / 1000.0),
            leftTime;

        correctTime = Math.round(auxTime.getTime() / 1000.0);
        leftTime = correctTime - currentTime;

        if (correctTime !== 0 && leftTime > 0) {
            var hours = Math.floor(leftTime / 3600),
                minutes = Math.floor((leftTime - (hours * 3600)) / 60),
                seconds = leftTime - (hours * 3600) - (minutes * 60),
                strData = '',
                self = this;

            if (hours >= 1) {
                if (minutes === 0) {
                    strData = hours + 'h';
                } else {
                    strData = hours + 'h' + ' ' + minutes + 'm';
                }
            } else if (minutes >= 1) {
                strData = minutes + 'm';
            } else {
                strData = seconds + 's';
            }

            this.model.set('countDownLabel', this.sandbox.i18n.t('labels.autoOff') + ' ' + strData);

            if (!this.countDownInterval) {
                this.countDownInterval = setInterval(function() {
                    updateCountDown.apply(self);
                }, 1000);
            }
        } else {
            if (this.countDownInterval) {
                this.model.set('countDownLabel', '');
                clearInterval(this.countDownInterval);
                this.countDownInterval = false;
            }
        }
    }

    var exports = {
        updateCountDown: updateCountDown
    };


    return exports;

});
define('extensions/ui/powerButton', ['backbone'], function(Backbone) {

    'use strict';


    var PowerButton = Backbone.View.extend({
        events: {
        },

        initialize: function(options) {
            _.extend(this, options);
            this.isRendered = false;
            this._state = -1;
        },

        setState: function(state){
            if(state === this._state) return;

            var self = this;
            var _setState = function(){
                self.$('.powerState').attr('class', 'powerState powerState-' + state);
                self._state = state;
            };

            _setState(state);
        },

        render: function(){
            if(!this.isRendered){
                this.$el.html('<div class="powerState powerState-0" data-bind="modeIcon" aria-live="polite" aria-atomic="true" role="button"><div class="powerStateSpinner"></div></div>');
                this.$('.powerState').on('click', this.onTap);
                this.isRendered = true;
            }
        }
    });

    PowerButton.MODE = {
        MODE_OFF: 0,
        MODE_ON: 1,
        MODE_SEARCHING: 2
    };

    return PowerButton;

});

define('widgets/wemo_dimmer/js/tile',['backbone', 'hbs!widgets/wemo_dimmer/templates/tile', 'mixins/tile.countdownTimer','extensions/ui/powerButton'],
    /**
     * @exports tile view
     */
    function(Backbone, template, countdownTimer, PowerButton) {

        'use strict';

        /**
         * will store the settings for when we start cycling the power button.
         * @type {object}
         */
        var View = Backbone.TileBaseView.extend({
            template: template,
            isBeingSaved: false,

            /**
             * adds event binding to elements, clicks are converted to pointerup events
             */
            events: {
                'click .description': 'setToggle'
            },
            /**
             * two-way data binding to models, uses Backbone.stickit
             */
            bindings: {
                '*[data-bind="friendlyName"]': {
                    observe: 'friendlyName',
                    onGet: function(value) {
                        if (value === "") {
                            value = this.i18n("defaultFriendlyName");
                            this.model.set("friendlyName", value)
                        }
                        return value;
                    }
                },
                '*[data-bind="brightnessVal"]': {
                    observe: 'brightness',
                    onGet: function(value) {
                        var brightness = parseInt(value);
                        if (brightness > 100) {
                            brightness = 100;
                            this.model.set('binaryState', brightness);
                        } else if (brightness < 1) {
                            brightness = 1;
                            this.model.set('binaryState', brightness);
                        }
                        return brightness + "%";
                    }
                },
                '*[data-bind="countDown"]': {
                    observe: 'countDownLabel',
                    onGet: function(val) {
                        return (val === "") ? val : ", " + val;
                    }
                }
            },
            /**
             * put non-DOM event listeners here. These need to be removed when no longer necessary to free up memory (this.stopListening())
             */
            listen: function() {
                this.listenTo(this.model, 'change:friendlyName', this.updateAria);
                this.listenTo(this.model, 'change:binaryState', this.updateAria);
                this.listenTo(this.model, 'change:binaryState', this.changeModeButton);
                this.listenTo(this.model, 'change:binaryState', this.updateTimer);
                this.listenTo(this.model, 'change:brightness', this.updateTimer);
                this.listenTo(this.model, 'change:ruleAutoOffTime', countdownTimer.updateCountDown);
                this.listenTo(this.model, 'change:overTemp', this.changeOverTempStatus);
                this.sandbox.on('close.peekaboo', this.closePeekaboo);
            },
            /**
             * Binds DOM events
             */
            render: function() {
                this.delegateEvents();
                this.renderPowerButton();
                this.changeModeButton();
                this.changeOverTempStatus();
                this.updateAria();
                countdownTimer.updateCountDown.call(this);
            },
            renderPowerButton: function(){
                this.powerButton = new PowerButton({
                    $el: this.$('.power'),
                    onTap: this.setState.bind(this)
                });
                this.powerButton.render();
            },
            /**
             * Change peekaboo drawer timeout when user starting to change fan mode
             */
            updateTimer: function() {
                if (this.peekaboo) {
                    this.peekaboo.updateTimer();
                }
            },
            /**
             * Function that close the peek a boo drawer
             */
            closePeekaboo: function() {
                this.accordion.close(true);
            },
            changeOverTempStatus: function() {
                var overTempStatus = this.model.get("overTemp");
                this.sandbox.emit('changeOverTempStatus', overTempStatus);
            },
            /**
             * Set behaviour for open, close drawer
             */
            setToggle: function(event) {
                this.accordion.toggle(event, false);
            },
            /**
             * change state value and send it to the device
             */
            setState: function() {
                var state = parseInt(this.model.get('binaryState'), 10),
                    self = this,
                    newState;

                if (!this.isBeingSaved) {
                    this.powerButton.setState(PowerButton.MODE.MODE_SEARCHING);

                    if (state === 0) {
                        newState = 1;
                    } else {
                        newState = 0;
                    }

                    if (!this.$('.drawerArrow').hasClass('open')) {
                        if ((newState === 1) || (newState === 0 && this.$('.description').hasClass('open'))) { //when full drawer open, clicking power button will not change drawer
                            setTimeout(function() {
                                self.peekaboo.toggle();
                                self.accordion.toggle(self.$('.description'), true);
                            }, 500);
                        }
                    }

                    this.isBeingSaved = true;

                    this.model.set('binaryState', newState);
                    this.model.saveToCache();
                    this.model.saveAction(['binaryState']).done(self.successSaveAction).fail(self.failSave);
                }
            },
            /**
             * UI logic to change the power button style according to the selected mode
             */
            changeModeButton: function() {
                var mode = parseInt(this.model.get('binaryState'), 10);

                if (!this.isBeingSaved) {
                    switch(mode){
                        case 0:
                            this.powerButton.setState(PowerButton.MODE.MODE_OFF);
                            break;
                        case 1:
                            this.powerButton.setState(PowerButton.MODE.MODE_ON);
                            break;
                        default:
                            this.powerButton.setState(PowerButton.MODE.MODE_OFF);
                            break;
                    }
                }
            },
            updateAria:function(){
                var mode = parseInt(this.model.get('binaryState'), 10),
                    friendlyName = this.model.get('friendlyName'),
                    productName = this.model.get('defaultFriendlyName');

                this.$('.tile1').attr('aria-label', productName);
                this.$('.tile2').attr('aria-label', friendlyName);
                this.$('.powerState').attr('aria-label', friendlyName + " power button is " + (mode === 0 ? "off": "on"));
            },
            /**
             * When saveAction is success
             * @param {string} resp
             */
            successSaveAction: function(resp) {
                DEBUG && console.log("SUCCESS saveAction:" + resp);
            },
            /**
             * logic to change the power button UI when save action ends
             */
            afterSave: function() {
                this.isBeingSaved = false;
                this.changeModeButton();
            },
            /**
             * Logic to set up the button to show/hide drawer cross-platform
             */
            afterInitialize: function() {
                var element = this.$('.noVisble');
                this.sandbox.uiInterface.setShowHideDrawer.call(this, element);
            }
        });

        return View;
    });

/* START_TEMPLATE */
define('hbs!widgets/wemo_dimmer/templates/summary',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<div class=\"drawerContent\">\n    <section class=\"content\">\n        <div class=\"sliderContainer\">\n            <div class=\"slider\"></div>\n        </div>\n\n        <div class=\"sectionTitle sleepFaderTitle\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.sleep", options) : helperMissing.call(depth0, "i18n", "labels.sleep", options)))
    + "</div>\n        <div class=\"sleepFaderSection drawerSection\">\n            <div class=\"timer row\">\n                <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.timer", options) : helperMissing.call(depth0, "i18n", "labels.timer", options)))
    + "</span>\n                <span class=\"fadeoutTime\" data-bind=\"customTime\">5m</span>\n            </div>\n            <div class=\"fandOut row\">\n                <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.fadeOut", options) : helperMissing.call(depth0, "i18n", "labels.fadeOut", options)))
    + "</span>\n                <div class=\"btnTurnOffOn\">\n                    <span class=\"btnTurn\">\n                        <span class=\"btnSlider\"></span>\n                    </span>\n                </div>\n            </div>\n\n            <div class=\"fadeoutMessage\" data-bind=\"fadeoutMessage\"></div>\n\n            <div class=\"timerButton\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.startTimer", options) : helperMissing.call(depth0, "i18n", "labels.startTimer", options)))
    + "</div>\n        </div>\n\n        <div class=\"sectionTitle nightModeTitle\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.nightMode", options) : helperMissing.call(depth0, "i18n", "labels.nightMode", options)))
    + "</div>\n        <div class=\"nightModeSection drawerSection\">\n            <div class=\"row\">\n                <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.status", options) : helperMissing.call(depth0, "i18n", "labels.status", options)))
    + "</span>\n                <div class=\"nightModeStatus\">\n                    <span class=\"status\" data-bind=\"nightModeStatus\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "status.disabled", options) : helperMissing.call(depth0, "i18n", "status.disabled", options)))
    + "</span>\n                    <span class=\"fa fa-angle-right\"></span>\n                </div>\n            </div>\n            <div class=\"nightModeMessage\" data-bind=\"nightModeMessage\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "nightMode.default", options) : helperMissing.call(depth0, "i18n", "nightMode.default", options)))
    + "</div>\n        </div>\n\n        <div class=\"sectionTitle longPressTitle\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.longPress", options) : helperMissing.call(depth0, "i18n", "labels.longPress", options)))
    + "</div>\n        <div class=\"longPressSection drawerSection\">\n            <div class=\"row longPressRule\">\n                <span class=\"title\" data-bind=\"longPressRuleTitle\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.createLongPressRule", options) : helperMissing.call(depth0, "i18n", "labels.createLongPressRule", options)))
    + "</span>\n                <div class=\"longPressStatus\">\n                    <span class=\"status\" data-bind=\"longPressStatus\"></span>\n                    <span class=\"fa fa-angle-right\"></span>\n                </div>\n            </div>\n            <div class=\"longPressMessage\" data-bind=\"longPressMessage\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "longPress.default", options) : helperMissing.call(depth0, "i18n", "longPress.default", options)))
    + "</div>\n        </div>\n\n        <div class=\"sectionTitle hushModeTitle\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.lightBar", options) : helperMissing.call(depth0, "i18n", "labels.lightBar", options)))
    + "</div>\n        <div class=\"hushModeSection drawerSection\">\n            <div class=\"row lightBarSuspend\">\n                <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.hideErrors", options) : helperMissing.call(depth0, "i18n", "labels.hideErrors", options)))
    + "</span>\n                <div class=\"lightBarStatus\">\n                    <span class=\"status hushModeTime\" data-bind=\"lightBarStatus\"></span>\n                    <span class=\"fa fa-angle-right\"></span>\n                </div>\n            </div>\n            <div class=\"lightBarMessage\" data-bind=\"lightBarMessage\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "hushMode.default", options) : helperMissing.call(depth0, "i18n", "hushMode.default", options)))
    + "</div>\n        </div>\n    </section>\n </div>\n";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_dimmer_templates_summary', t);
return t;
});
/* END_TEMPLATE */
;
define('libs/range',['jquery'], function($){
    return function Range() {
        this._updateSliderFill = function(){
            var $target = this.$el.find('input[type=range]');
            var width = ($target.parent().width() - $target.parent().height()) * ($target.val()/$target.attr('max'));
            $target.parent().find('.fill').css('width', width + 'px');
        };

        this.init = function(el, options){
            console.log("Initing");

            if(!el){
                return console.error('You must specify an element to render the range slider!');
            }
            _.defaults(options, {
                size: 24,
                min: 0,
                max: 100,
                value: 0,
                thumbColor: '#73D44C',
                fillColor: '#ADE48C',
                onChange: function(){},
                onTouchMove: function(){}
            });

            var id = 'range-' + (new Date()).getTime();
            var $el = $(el);
            $el.attr('id', id);
            this.$el = $el;

            // Add styles
            var styles = [];
            styles.push(".slider{position: relative;z-index: 0;}");
            styles.push(".slider input[type=range] {-webkit-appearance: none;display: block;position: relative;margin: 0;width: 100%;");
            styles.push(".slider input[type=range]:focus {outline: none;}");
            styles.push(".slider input[type=range]::-webkit-slider-runnable-track {width: 100%;cursor: pointer;box-shadow: none;background: #f2f2f2;border: 0;}");
            styles.push(".slider input[type=range]::-webkit-slider-runnable-track {border-radius: " + options.size/2 + "px;height: " + options.size + "px;}");
            styles.push(".slider input[type=range]::-webkit-slider-thumb {box-shadow: inset 0 -1px 0 0 rgba(0,0,0,0.25), inset 0 1px 0 0 rgba(255,255,255,.5);border: 0;cursor: pointer;-webkit-appearance: none;margin-top: 0px;z-index:1;position: relative;}");
            styles.push(".slider input[type=range]::-webkit-slider-thumb {height: " + options.size + "px;width: " + options.size + "px;border-radius: " + options.size/2 + "px;}");
            styles.push(".slider .fill {display: block;position: absolute;top: 0;z-index: 0;pointer-events: none}");
            styles.push(".slider .fill:before {content: '';display: block;position: absolute;top: 0;background:inherit;}");
            styles.push(".slider .fill:before {width: " + options.size + "px;height: " + options.size + "px;border-radius: " + options.size/2 + "px;left: -" + options.size/2 + "px;}");
            styles.push(".slider .fill {left: " + options.size/2 + "px;height: " + options.size + "px;}");

            _.forEach(styles, function(style){
                document.styleSheets[0].insertRule("#" + id + style, document.styleSheets[0].rules.length);
            });
            this.setThumbColor(options.thumbColor, $el);
            this.setFillColor(options.fillColor, $el);

            $el.empty();
            $el.append('<input type="range" min="' +options.min + '" max="' + options.max + '" step="1" value="' + options.value + '"/>');
            $el.append('<div class="fill"/>');

            var self = this;
            $el.find('input[type=range]').on('input change', function(e){
                self._updateSliderFill();
                options.onTouchMove(e);
            });

            $el.find('input[type=range]').on('output change', function(e){
                options.onChange(e);
            });

            setTimeout(function(){
                self._updateSliderFill();
            }, 100);
        };

        this.setValue = function(value){
            this.$el.find('input[type=range]').val(value);
            this._updateSliderFill();
        };

        this.setThumbColor = function(color, $el){
            if(!$el) return;
            var style = ".slider input[type=range]::-webkit-slider-thumb {background-color: "+ color +";}";
            document.styleSheets[0].insertRule("#" + $el.attr("id") + style, 1);

            if (color === "#3e4978") {
                $el.find('input[type=range]').addClass("nightModeSlider");
            } else {
                $el.find('input[type=range]').removeClass("nightModeSlider");
            }
        };

        this.setFillColor = function(color, $el){
            if(!$el) return;
            $el.find(".fill").css("background-color", color);
            var style = ".slider .fill {background-color:"+ color +";}"
            document.styleSheets[0].insertRule( "#" + $el.attr("id")+ style, 1);
        };
    }
});

/* START_TEMPLATE */
define('hbs!widgets/wemo_dimmer/templates/longPressRuleDetail',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<header>\n    <div class=\"back\">\n        <span class=\"backIcon\"></span>\n        <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "longPress.Summary", options) : helperMissing.call(depth0, "i18n", "longPress.Summary", options)))
    + "</span>\n    </div>\n    <div id=\"editRule\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.Edit", options) : helperMissing.call(depth0, "i18n", "labels.Edit", options)))
    + "</div>\n</header>\n\n<section class=\"content\">\n    <div class=\"notificationBanner\"></div>\n    <div class=\"card headerCard\">\n        <span class=\"ruleTitle\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "longPress.LONGPRESSRULE", options) : helperMissing.call(depth0, "i18n", "longPress.LONGPRESSRULE", options)))
    + "</span>\n        <div id=\"changeRuleState\"></div>\n    </div>\n\n    <div class=\"card\">\n        <div class=\"cardTitle\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "longPress.WhenILongPressShort", options) : helperMissing.call(depth0, "i18n", "longPress.WhenILongPressShort", options)))
    + "</div>\n        <ul id=\"lightSwitchList\" class=\"deviceList\"></ul>\n    </div>\n\n    <div class=\"card\">\n        <div class=\"cardTitle turnDevices\"></div>\n        <ul id=\"turnDeviceList\" class=\"deviceList\"></ul>\n    </div>\n</section>\n\n<footer id=\"long_press_rule_delete_btn\" class=\"footer_btn\">\n    <div class=\"footerContainer\">\n        <span>";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "buttons.Delete", options) : helperMissing.call(depth0, "i18n", "buttons.Delete", options)))
    + "</span>\n    </div>\n</footer>";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_dimmer_templates_longPressRuleDetail', t);
return t;
});
/* END_TEMPLATE */
;
define('libs/execHandler',[], function() {
    var ExecHandler = function() {
        this.initialize.apply(this, arguments);
    };
    if (!window.smartDevicePlugin) {
        window.smartDevicePlugin = {};
    }

    window.smartDevicePlugin.callbackList = {};
    window.smartDevicePlugin.onDeviceChanged = function(id, resp) {
        //find the device, fire off the first callback in the array, then get rid of it.
        DEBUG && console.log('ExecHandler:onDeviceChanged:RESPONDED:' + id);


        var callback = window.smartDevicePlugin.callbackList[id];
        if (callback && id) {
            if (callback.length > 0) {
                var self = callback[0];
                clearTimeout(self.timeout);

                if (typeof resp == 'string') {
                    resp = JSON.parse(resp);
                }

                if (((self.action == 'setDeviceState' || self.action == 'setGroupState') && resp.onDeviceUpdated) || (!resp.onDeviceUpdated && resp.success === 'true') || (self.action == 'setDeviceProperties' && resp.success === 'true')) {
                    DEBUG && console.log('ExecHandler:useWindowMethod:SUCCESS:' + self.plugin + ':' + self.action + ':' + JSON.stringify(resp));
                    if (self.callback) {
                        self.callback(resp);
                    }
                    self.dfd.resolve(resp);
                } else {
                    DEBUG && console.log('ExecHandler:useWindowMethod:ERROR:' + self.plugin + ':' + self.action + ':' + JSON.stringify(resp));
                    self.dfd.reject(resp);
                }

                callback.splice(0, 1);
            }
        }
    }

    ExecHandler.prototype = {
        constructor: ExecHandler,
        initialize: function(options) {
            _.bindAll(this);
            options = options || {};
            _.extend(this, options);
            this.dfd = new $.Deferred();
            this.timeout = setTimeout(function() {}, 0);

        },
        success: function(resp) {
            if (!this.useWindowMethod) {
                DEBUG && console.log('ExecHandler:SUCCESS:' + this.plugin + ':' + this.action + ':' + JSON.stringify(resp));
                if (this.callback) {
                    this.callback(resp);
                }
                this.dfd.resolve(resp);
            }
        },
        initWindowMethod: function() {
            //create an array of callbacks to this device.

            if (!window.smartDevicePlugin.callbackList[this.useWindowMethod]) {
                window.smartDevicePlugin.callbackList[this.useWindowMethod] = [];
            }

            window.smartDevicePlugin.callbackList[this.useWindowMethod].push(this);

        },
        error: function(err) {
            if (!this.useWindowMethod) {
                DEBUG && console.log('ExecHandler:ERROR:' + this.plugin + ':' + this.action + ':' + JSON.stringify(err));
                //in cases where device is not reachable, err = {isDiscovered:false}, update this model to cause greyout
                if (this.errorCallback) {
                    this.errorCallback(err);
                }
                this.dfd.reject(err);
            }
        },
        go: function(plugin, action, data) {
            var self = this;
            data = data || [];
            this.plugin = plugin;
            this.action = action;
            DEBUG && console.log('ExecHandler:' + plugin + ':' + action + ':' + JSON.stringify(data));
            this.isRemote = (window.sessionStorage.getItem('isRemote') === "true");
            this.timeoutLimit = 15000;

            if (this.useWindowMethod) {
                this.initWindowMethod();
            }

            if (window.cordova) {
                DEBUG && console.log('ExecHandler:' + plugin + ':' + action + ':sending to Cordova');
                window.cordova.exec(this.success, this.error, plugin, action, data);
            } else {
                if (this.useWindowMethod) {

                    var success = 'true';

                    var jsonString = JSON.stringify({
                        udn: this.useWindowMethod,
                        success: success
                    });
                    window.smartDevicePlugin.onDeviceChanged(this.useWindowMethod, jsonString);
                } else {
                    this.success({});
                }
            }

            if (!this.ignoreTimeout) {
                this.timeout = setTimeout(function() {
                    window.smartDevicePlugin.onDeviceChanged(self.useWindowMethod, {
                        success: false,
                        error: 'timeout'
                    });
                }, self.timeoutLimit);
            }
            return this.dfd.promise();
        }
    }

    return ExecHandler;

});
/** a common API for devices and the browser. the browser version returns mock data for testing, will be used as part of an extension to mixin with the sandbox  **/
define('libs/rulesPlugin',['libs/execHandler'], function(ExecHandler) {
    'use strict';


    var callPlugin = function(plugin, action, data, options) {
        var handler = new ExecHandler(options);
        return handler.go(plugin, action, data);
    };

    var exports = {
        /**
         * asks native layer to get updates from cloud. returns to window.firmwareUpdatePlugin.onGetAvailableUpdates
         * @param  {JSON} devices list of devices to check for updates
         */
        showRules: function(callback) {
            var path, method;
            if (window.cordova && !window.hasDemoDevices) {
                return callPlugin('RulesPlugin', "7001", [], {
                    callback: callback
                });
            } else {
                path = 'widgets/wemo_dimmer/mocks/getSavedRules.json';
                method = 'GET';
                return $.ajax(path, {
                    accepts: '*/*',
                    data: {},
                    method: method,
                    success: callback
                });
            }
        },
        saveRules: function (information, callback, errorCallback) {
            return callPlugin('RulesPlugin', '7002', [information], {
                ignoreTimeout: true,
                callback: callback,
                errorCallback: errorCallback
            });
        },
        /**
         * tells the native layer to begin the firmware update for devices in the payload.
         * @param  {JSON} payload list of devices to firmware update
         */
        editRules: function(information, callback, errorCallback) {
            return callPlugin('RulesPlugin', '7003', [information], {
                ignoreTimeout: true,
                callback: callback,
                errorCallback: errorCallback
            });
        },
        /**
         * sends the status of zigbee devices to native layer. native needs to know when zigbee is done in order to time update of different model type/bridge
         * @param  {JSON} payload {udn:'',status:''}
         */
        deleteRules: function(information, callback, errorCallback) {
            return callPlugin('RulesPlugin', '7004', [information], {
                ignoreTimeout: true,
                callback: callback,
                errorCallback: errorCallback
            });
        },
        changeRuleStatus: function(information, callback, errorCallback) {
            return callPlugin('RulesPlugin', '7005', [information], {
                ignoreTimeout: true,
                callback: callback,
                errorCallback: errorCallback
            });
        }
    };

    return exports;

});
/* START_TEMPLATE */
define('hbs!widgets/wemo_dimmer/templates/editLongPressRule',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<header>\n    <div class=\"back\">\n        <span class=\"backIcon\"></span>\n        <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "longPress.createRule", options) : helperMissing.call(depth0, "i18n", "longPress.createRule", options)))
    + "</span>\n    </div>\n</header>\n<section class=\"content\">\n    <div class=\"info\">\n        <div class=\"text\">\n            ";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "longPress.Info", options) : helperMissing.call(depth0, "i18n", "longPress.Info", options)))
    + "\n        </div>\n        <div class=\"helpIcon\"></div>\n    </div>\n    <div id=\"lightSwitchContainer\" class=\"devicesRuleContainer\">\n        <div class=\"sectionHeader\">\n            <span class=\"sectionLabel\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "longPress.WhenILongPress", options) : helperMissing.call(depth0, "i18n", "longPress.WhenILongPress", options)))
    + "</span>\n        </div>\n\n        <ul id=\"light_switch_list\" class=\"deviceList\">\n        </ul>\n    </div>\n\n    <div id=\"actionOptions\" class=\"devicesRuleContainer\">\n        <div class=\"sectionHeader\">\n            <span class=\"sectionLabel\" localString=\"true\" _key=\"Turn\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "longPress.Turn", options) : helperMissing.call(depth0, "i18n", "longPress.Turn", options)))
    + "</span>\n        </div>\n\n        <ul id=\"rulesOptions\" class=\"ruleList\">\n            <li class=\"toggleRule\">\n                <span class=\"ruleName\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "longPress.Toggle", options) : helperMissing.call(depth0, "i18n", "longPress.Toggle", options)))
    + "</span>\n                <span class=\"radioBtn selected\" data-startaction=\"2\"></span>\n            </li>\n            <li class=\"onRule\">\n                <span class=\"ruleName\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "longPress.On", options) : helperMissing.call(depth0, "i18n", "longPress.On", options)))
    + "</span>\n                <span class=\"radioBtn\" data-startaction=\"1\"></span>\n            </li>\n            <li class=\"offRule\">\n                <span class=\"ruleName\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "longPress.Off", options) : helperMissing.call(depth0, "i18n", "longPress.Off", options)))
    + "</span>\n                <span class=\"radioBtn\"  data-startaction=\"0\"></span>\n            </li>\n            <li class=\"awayRule\">\n                <span class=\"ruleName\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "longPress.PretendSomeoneHome", options) : helperMissing.call(depth0, "i18n", "longPress.PretendSomeoneHome", options)))
    + "</span>\n                <span class=\"radioBtn\" data-startaction=\"3\"></span>\n            </li>\n        </ul>\n    </div>\n\n    <div id=\"long_pressSelectableDevices\" class=\"devicesRuleContainer\">\n        <div class=\"sectionHeader\">\n            <span class=\"sectionLabel\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "longPress.My", options) : helperMissing.call(depth0, "i18n", "longPress.My", options)))
    + "</span>\n        </div>\n\n        <ul id=\"selectableDevices\" class=\"deviceList\">\n        </ul>\n    </div>\n</section>\n\n<footer id=\"long_press_rule_save\" class=\"footer_btn\">\n    <div class=\"footerContainer\">\n        <span>";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "buttons.Save", options) : helperMissing.call(depth0, "i18n", "buttons.Save", options)))
    + "</span>\n    </div>\n</footer>";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_dimmer_templates_editLongPressRule', t);
return t;
});
/* END_TEMPLATE */
;
define('widgets/wemo_dimmer/js/editLongPressRule',['Cache', 'hbs!widgets/wemo_dimmer/templates/editLongPressRule', 'libs/rulesPlugin'],
    /** @exports settings view */
        function (Backbone, template, rulesPlugin) {

        'use strict';

        var View = Backbone.OverlayView.extend({
            template: template,
            className: 'editLongPress noMainHeader longPressRule',
            ruleObj: {},
            events: {
                'click .back': 'goBack',
                'click #long_press_rule_save' : 'saveRules',
                'click #light_switch_list li' : 'chooseTriggerLS',
                'click #selectableDevices li' : 'selectTriggeredDevices',
                'click #actionOptions li' : 'selectAction',
                'click .info' : 'loadHelpSlides'
            },
            bindings: {

            },
            loadHelpSlides: function() {
                var LONGPRESS_SLIDES = "file:///android_asset/www/more/learn_about_wemo.html?fromsfw=long_press_rule_tutorial";
                window.location.href = LONGPRESS_SLIDES;
            },
            render: function() {
                var str = "";
                if (this.options.pageType && this.options.pageType === "editRule") {
                    this.isEdit = true;
                    str = this.i18n("longPress" , "editeRule");
                } else {
                    this.isEdit = false;
                    str = this.i18n("longPress" , "createRule");
                }
                this.initialRuleData();

                this.$(".back .title").html(str);

                var addRulesData = [];
                if (this.options) {
                    addRulesData = this.options.addRulesData;
                }
                this.getSavedRuleInfo(addRulesData);

            },
            getSavedRuleInfo : function(addRulesData) {
                var self = this;
                this.lpRulesArr = [];
                if (addRulesData && addRulesData.length > 0) {
                    for (var i = 0; i < addRulesData.length; i++){
                        var rulesDataObj =  addRulesData[i];
                        if (rulesDataObj["DB_RULE_TYPE"] === "Long Press") {
                            var UDN = rulesDataObj["WIFI_DEV_ARR"][0].UDN;
                            self.lpRulesArr.push(UDN)
                        }
                    }
                }

                this.loadDevices();
            },

            initialRuleData: function() {
                this.triggerDevice = [];
                this.targetDevicesObj = {};
                this.deviceIndex = 0;
                if  (!this.isEdit) {
                    this.targetDevices = [];
                } else {
                    this.ruleObj = this.options.ruleData;
                    this.ruleID = this.ruleObj.RULE_ID;
                    this.triggerDeviceUDN = this.ruleObj.WIFI_DEV_ARR[0].UDN;
                    this.targetDevices = this.ruleObj.TARGET_DEV_ARR;
                    this.selectedAction = this.ruleObj.WIFI_DEV_ARR[0].START_ACTION;
                    this.ruleState = this.ruleObj.STATE;
                }
            },
            loadDevices: function() {
                var devices = this.sandbox._parent.sandboxes;
                    this.triggerLSist = {};

                    var targetDeviceList = {},
                    self =  this;
                var deviceUDN = this.model.baseObject.information.udn;

                $.each(devices,function(key, val){
                    var deviceProperties = {};

                    if ((val.model && val.model.attributes) ||  (val.model && val.model.baseObject)) {
                        if (val.model.attributes && val.model.attributes.hasOwnProperty("friendlyName")) {
                            deviceProperties = val.model.attributes;
                        } else {
                            deviceProperties = val.model.baseObject.properties;
                        }


                        if (self.lpRulesArr.indexOf(key) === -1 || key === deviceUDN) {
                            if (key.match(/dimmer/gi) || (key.match(/lightswitch/gi) && val.model.baseObject.attributes.hasOwnProperty("longPressRuleDeviceCnt"))) {
                                self.triggerLSist[key] = deviceProperties;
                                self.buildTriggerDeviceList(self.triggerLSist[key], key);
                            }
                        }

                        if (key.match(/dimmer/gi) || key.match(/lightswitch/gi) ||  key.match(/socket/gi) || key.match(/socket/gi)
                            || key.match(/insight/gi)) {

                            if (deviceProperties.isDiscovered) {
                                targetDeviceList[key] = deviceProperties;
                                self.buildSelectableDeviceList(targetDeviceList[key], key);
                                if (!self.isEdit) {
                                    self.targetDevicesObj[key] = "";
                                    self.$('#selectableDevices').find("li[id='"+key+"'] .multiChoiceBtn").addClass("selected");
                                }
                            }
                        }
                    }
                });



                if  (!this.isEdit) {
                    var currentDeviceUdn = this.model.baseObject.information.udn;
                    this.ruleName = this.model.get("friendlyName") + " " + this.i18n("labels","longPressRule");

                    if ((Object.keys(targetDeviceList).length === 1) && (Object.keys(self.triggerLSist).length === 1)) {
                        this.selectedAction = 3;
                        this.$("#rulesOptions li").addClass("notClickable");
                        this.$("#rulesOptions li.awayRule").removeClass("notClickable");
                        this.$("#actionOptions .radioBtn").removeClass("selected");
                        this.$("#actionOptions .awayRule .radioBtn").addClass("selected");
                    } else {
                        this.selectedAction = 2;
                    }
                } else {
                    var currentDeviceUdn = this.triggerDeviceUDN;
                    this.ruleName = this.ruleObj.DISPLAY_NAME;
                    DEBUG && console.log("long press rule selectedAction ::" + this.selectedAction);

                    var selectedAction = parseInt(self.selectedAction);

                    this.$('#rulesOptions li .radioBtn').removeClass("selected");
                    this.$('#rulesOptions li .radioBtn[data-startaction="'+ selectedAction +'"]').addClass("selected");


                    for(var j = 0; j < self.targetDevices.length; j++) {
                        var udn = self.targetDevices[j].DEVICE_ID;

                        if (!targetDeviceList[udn]) {
                            self.buildSelectableDeviceList(null, udn);
                        }

                        self.$('#selectableDevices').find("li[id='"+udn+"'] .multiChoiceBtn").addClass("selected");
                        if (self.$('#selectableDevices').find("li[id='"+udn+"']") !== []){
                            this.targetDevicesObj[udn] = "";
                        }
                    }

                    if ((Object.keys(targetDeviceList).length === 1) && (Object.keys(self.triggerLSist).length === 1)) {
                        this.$("#rulesOptions li").addClass("notClickable");
                        this.$("#rulesOptions li.awayRule").removeClass("notClickable");
                    }
                }
                this.$('#light_switch_list').find("li[id='"+currentDeviceUdn+"'] .radioBtn").addClass("selected");

                var lsObj = {
                    "UDN": currentDeviceUdn,
                    "START_ACTION": this.selectedAction
                };
                this.triggerDevice.push(lsObj);

                this.delegateEvents();
            },
            buildTriggerDeviceList: function(triggerLSist, udn) {
                var friendlyName = triggerLSist.friendlyName,
                    isDiscovered = triggerLSist.isDiscovered,
                    iconUrl = triggerLSist.icon,
                    defaultIcon = triggerLSist.defaultIcon;

                if (isDiscovered) {
                    var deviceIcon = iconUrl ? iconUrl : defaultIcon;
                } else if (this.isEdit) {
                    var defaultName;
                    if (udn.match(/lightswitch/gi)) {
                        deviceIcon = "file:///android_asset/www/img/new_icons/WeMo_LightSwitch_@3x.png";
                        defaultName = this.i18n("labels", "WeMoLightSwitch");
                    } else if (udn.match(/dimmer/gi)) {
                        deviceIcon = "file:///android_asset/www/img/new_icons/WeMo_Dimmer_@3x.png";
                        defaultName = this.i18n("defaultFriendlyName");
                    }

                    friendlyName = defaultName + this.i18n("labels", "notAvailable");
                }

                var html = '<li id='+ udn +'><span class="deviceIcon" style="background-image: url('+ deviceIcon +');"></span>' +
                    '<span class="deviceName">'+ friendlyName +'</span>' +
                    '<span class="radioBtn "></span>';

                this.$('#light_switch_list').append(html);


            },
            buildSelectableDeviceList: function(targetDeviceList, udn) {

                var friendlyName = targetDeviceList ? targetDeviceList.friendlyName: "",
                    isDiscovered =  targetDeviceList ? targetDeviceList.isDiscovered:false,
                    iconUrl =  targetDeviceList? targetDeviceList.icon:"",
                    defaultIcon = targetDeviceList? targetDeviceList.defaultIcon:"";

                if (isDiscovered) {
                    var deviceIcon = iconUrl ? iconUrl : defaultIcon;
                } else if (this.isEdit) {
                    var defaultName;
                    if (udn.match(/socket/gi)) {
                        deviceIcon = "file:///android_asset/www/img/new_icons/WeMo_Switch_Old_@3x.png";
                        defaultName = this.i18n("labels", "WeMoSwitch");
                    } else if (udn.match(/insight/gi)) {
                        deviceIcon = "file:///android_asset/www/img/new_icons/WeMo_Insight_Switch_@3x.png";
                        defaultName = this.i18n("labels", "WeMoInsight");
                    } else if (udn.match(/lightswitch/gi)) {
                        deviceIcon = "file:///android_asset/www/img/new_icons/WeMo_LightSwitch_@3x.png";
                        defaultName = this.i18n("labels", "WeMoLightSwitch");
                    } else if (udn.match(/dimmer/gi)) {
                        deviceIcon = "file:///android_asset/www/img/new_icons/WeMo_Dimmer_@3x.png";
                        defaultName = this.i18n("defaultFriendlyName");
                    }
                    friendlyName = defaultName + this.i18n("labels", "notAvailable");
                }

                var html = '<li id='+ udn +'><span class="deviceIcon" style="background-image: url('+ deviceIcon +');"></span>' +
                    '<span class="deviceName">'+ friendlyName +'</span>' +
                    '<span class="multiChoiceBtn"></span>';

                this.$('#selectableDevices').append(html);
            },
            selectAction: function(e) {
                var $target = $(e.currentTarget);
                this.$("#actionOptions .radioBtn").removeClass("selected");
                $target.find(".radioBtn").addClass("selected");

                this.selectedAction = $target.find(".radioBtn").data("startaction");
            },
            chooseTriggerLS : function(e) {
                var $target = $(e.currentTarget);
                this.$("#light_switch_list .radioBtn").removeClass("selected");
                $target.find(".radioBtn").addClass("selected");
                this.triggerDevice = [];
                var lsID = $target.attr("id");

                var lsObj = {
                    "UDN": lsID,
                    "START_ACTION": this.selectedAction
                };

                this.triggerDevice.push(lsObj);

                var friendlyName =  this.triggerLSist[lsObj].friendlyName;
                this.ruleName = friendlyName + " " + this.i18n("labels","longPressRule");
            },
            selectTriggeredDevices : function(e) {
                var $target = $(e.currentTarget);
                $target.find(".multiChoiceBtn").toggleClass("selected");
                if (this.$("#selectableDevices .multiChoiceBtn.selected").length > 0) {
                    this.$("#long_press_rule_save").removeClass("disabled");
                } else {
                    this.$("#long_press_rule_save").addClass("disabled");
                }
                var deviceID = $target.attr("id");

                if ($target.find(".multiChoiceBtn").hasClass("selected")) {
                   this.targetDevicesObj[deviceID] = "";
                } else {
                    delete this.targetDevicesObj[deviceID];
                }
            },
            goBack: function() {
                var self = this;

                if (!self.isEdit) {
                    self.sandbox.uiInterface.dismissSettings.call(self, {
                        cancel: true
                    });
                } else {
                    self.sandbox.uiInterface.dismissSettings.call(self, {
                        cancel: true
                    });
                    self.sandbox.uiInterface.dismissSettings.call(self.options.parent, {
                        cancel: true
                    });
                }
            },
            getTargetDeviceList: function() {
                var self = this;
                self.targetDevices = [];
                $.each(this.targetDevicesObj, function(key,val) {
                    var deviceInfo = {
                        "DEVICE_ID": key,
                        "DEVICE_INDEX": self.deviceIndex
                    };
                    self.targetDevices.push(deviceInfo);
                    self.deviceIndex++;
                });

                this.triggerDevice[0].START_ACTION = this.selectedAction;
            },
            clearSettings: function() {
                this.goBack();
            },
            saveRules: function() {
                this.getTargetDeviceList();
                var self = this,
                    rulesObj = {};

                if ((self.targetDevices.length === 1) && (self.triggerDevice[0].UDN === self.targetDevices[0].DEVICE_ID) && (parseInt(self.triggerDevice[0].START_ACTION) !== 3)){
                    this.popup = new this.sandbox.dom.Alert({
                        title: self.i18n('errorPopups.singleDimmerConflict.title'),
                        message: self.i18n('errorPopups.singleDimmerConflict.message'),
                        buttonLabels: self.i18n('errorPopups.singleDimmerConflict.ok'),
                        confirmCallback: function(){}
                    });
                } else {
                    if (!self.isEdit) {
                        rulesObj = {
                            "DB_RULE_TYPE":"Long Press",
                            "STATE": 1,
                            "DISPLAY_NAME": self.ruleName,
                            "DAY_ID_ARR":[-1],
                            "WIFI_DEV_ARR": self.triggerDevice,
                            "TARGET_DEV_ARR": self.targetDevices,
                            "RULE_TYPE":2
                        };
                        this.sandbox.uiInterface.showSpinner();
                        rulesPlugin.saveRules(rulesObj, this.afterSaveRules, this.saveRulesFailed);
                    } else {
                        rulesObj = {
                            "DB_RULE_TYPE":"Long Press",
                            "STATE": self.ruleState,
                            "RULE_ID": self.ruleID,
                            "DISPLAY_NAME": self.ruleName,
                            "DAY_ID_ARR":[-1],
                            "WIFI_DEV_ARR": self.triggerDevice,
                            "TARGET_DEV_ARR": self.targetDevices,
                            "RULE_TYPE":2
                        };

                        this.sandbox.uiInterface.showSpinner();
                        rulesPlugin.editRules(rulesObj, this.afterSaveRules, this.saveRulesFailed);
                    }
                }

            },
            afterSaveRules: function() {
                this.sandbox.uiInterface.hideSpinner();
                this.sandbox.emit("updateLongPressRule");

                this.goBack();
            },
            confirmRulesConflict: function() {
                var self = this;
                if (Object.keys(self.triggerLSist).length === 1) {
                    self.goBack();
                } else if (Object.keys(self.triggerLSist).length > 1) {
                    var udn = this.triggerDevice[0].UDN;
                    this.$("#light_switch_list").find("li[id='" + udn+ "']").remove();

                    this.$("#light_switch_list li").first().find(".radioBtn").addClass("selected");
                    this.triggerDevice[0].UDN = this.$("#light_switch_list li").first().attr("id");
                }
            },
            saveRulesFailed: function(err) {
                var self = this;
                this.sandbox.uiInterface.hideSpinner();
                if (err) {
                    if (err.ERROR_CODE === 900) {
                        this.popup = new this.sandbox.dom.Alert({
                            title: self.i18n('errorPopups.rulesConflict.title'),
                            message: self.i18n('errorPopups.rulesConflict.message'),
                            buttonLabels: self.i18n('errorPopups.rulesConflict.ok'),
                            confirmCallback: self.confirmRulesConflict
                        });
                    } else if (err.ERROR_CODE === 901) {
                        this.popup = new this.sandbox.dom.CustomModal({
                            title: self.i18n('errorPopups.needFWUpgrade.title'),
                            popupClass: 'needFWUpgradePopup',
                            message: self.i18n('errorPopups.needFWUpgrade.message'),
                            buttons: [
                                {
                                    text: this.i18n('errorPopups.needFWUpgrade.cancel'),
                                    width: "50%",
                                    extraClass: "cancelBtn"

                                }, {
                                    text: this.i18n('errorPopups.needFWUpgrade.goUpdate'),
                                    width: "50%",
                                    extraClass: "confirmBtn",
                                    events: [{
                                        tap: function() {
                                            window.location.href = "#page/wemo_devices/showFirmwareUpdate";
                                            self.goBack();
                                        }
                                    }]
                                }
                            ]
                        });
                    } else if (err.ERROR_CODE === -402) {
                        this.popup = new this.sandbox.dom.Alert({
                            title: self.i18n('errorPopups.deviceNotDected.cannotSavedTitle'),
                            message: self.i18n('errorPopups.deviceNotDected.message'),
                            buttonLabels: self.i18n('errorPopups.deviceNotDected.ok')
                        });
                    }
                }
            }
        });

        return View;
    });
define('widgets/wemo_dimmer/js/longPressRuleDetail',['Cache', 'hbs!widgets/wemo_dimmer/templates/longPressRuleDetail', 'libs/rulesPlugin','widgets/wemo_dimmer/js/editLongPressRule'],
    /** @exports settings view */
        function (Backbone, template, rulesPlugin, EditLongPressRuleView) {

        'use strict';


        var View = Backbone.OverlayView.extend({
            template: template,
            className: 'longPressDetail noMainHeader longPressRule',

            events: {
                'click .back': 'clearSettings',
                'click #long_press_rule_delete_btn': 'deleteRule',
                'click #changeRuleState' : 'changeRuleState',
                'click #editRule' : 'editRule'
            },
            bindings: {

            },
            render: function() {
                this.delegateEvents();
                var longPressRule = {};
                if (this.options) {
                    longPressRule = this.options.longPressRule;
                }
                this.getSavedRuleInfo(longPressRule);
                this.renderTriggerDevice();
            },
            getSavedRuleInfo : function(rulesDataObj) {
                var self = this;
                this.ruleData = {};

                if (rulesDataObj) {
                    this.RuleID = rulesDataObj["RULE_ID"];
                    this.RuleState = rulesDataObj["STATE"];
                    self.ruleData = rulesDataObj;

                    if (parseInt(this.RuleState) === 1) {
                        this.$("#changeRuleState").removeClass("disable");
                    } else {
                        this.$("#changeRuleState").addClass("disable");
                    }

                    var action = rulesDataObj["WIFI_DEV_ARR"][0].START_ACTION;
                    self.renderAction(action);

                    var targetObj = rulesDataObj["TARGET_DEV_ARR"];
                    self.renderTargetDevices(targetObj);
                }
            },

            editRule: function() {
                var self = this;
                var addRulesData = [];
                if (this.options) {
                    addRulesData = this.options.addRulesData;
                }

                var viewOptions = {
                    parent: self,
                    sandbox: self.sandbox,
                    parentElement: $('.longPressDetail'),
                    model: self.model,
                    pageType: "editRule",
                    ruleData: self.ruleData,
                    addRulesData : addRulesData
                };

                self.editView = new EditLongPressRuleView(viewOptions);
                self.editView.initialRender();
            },

            renderAction: function(action) {
                var str = this.i18n("labels", "ruleAction" + action);
                this.$('.turnDevices').html(str);
            },
            renderTargetDevices: function(targetObj) {
                var deviceListData = this.sandbox._parent.sandboxes;
                if (targetObj) {
                    for (var i = 0; i < targetObj.length; i++){
                        var udn = targetObj[i].DEVICE_ID;
                        if (deviceListData[udn]) {
                            if (deviceListData[udn].model.attributes) {
                                var friendlyName = deviceListData[udn].model.attributes.friendlyName,
                                    isDiscovered = deviceListData[udn].model.attributes.isDiscovered,
                                    iconUrl = deviceListData[udn].model.attributes.icon,
                                    defaultIcon = deviceListData[udn].model.attributes.defaultIcon;
                            } else {
                                var friendlyName = deviceListData[udn].model.properties.friendlyName,
                                    isDiscovered = deviceListData[udn].model.properties.isDiscovered,
                                    iconUrl = deviceListData[udn].model.properties.icon,
                                    defaultIcon = deviceListData[udn].model.properties.defaultIcon;
                            }

                            var deviceIcon = iconUrl ? iconUrl : defaultIcon;
                            friendlyName = isDiscovered ? friendlyName :  friendlyName + this.i18n("labels", "notAvailable");

                        } else {
                            var defaultName;
                            if (udn.match(/socket/gi)) {
                                deviceIcon = "file:///android_asset/www/img/new_icons/WeMo_Switch_Old_@3x.png";
                                defaultName = this.i18n("labels", "WeMoSwitch");
                            } else if (udn.match(/insight/gi)) {
                                deviceIcon = "file:///android_asset/www/img/new_icons/WeMo_Insight_Switch_@3x.png";
                                defaultName = this.i18n("labels", "WeMoInsight");
                            } else if (udn.match(/lightswitch/gi)) {
                                deviceIcon = "file:///android_asset/www/img/new_icons/WeMo_LightSwitch_@3x.png";
                                defaultName = this.i18n("labels", "WeMoLightSwitch");
                            } else if (udn.match(/dimmer/gi)) {
                                deviceIcon = "file:///android_asset/www/img/new_icons/WeMo_Dimmer_@3x.png";
                                defaultName = this.i18n("defaultFriendlyName");
                            }
                            friendlyName = defaultName + this.i18n("labels", "notAvailable");
                        }

                        var html = '<li><span class="deviceIcon" style="background-image: url('+ deviceIcon +');"></span>' +
                            '<span class="deviceName">'+ friendlyName +'</span>';

                        this.$('#turnDeviceList').append(html);
                    }
                }
            },
            renderTriggerDevice: function() {
                var friendlyName = this.model.get("friendlyName"),
                    iconUrl = this.model.get("icon");

                var deviceIcon = iconUrl ? iconUrl : this.model.get("defaultIcon");

                var html = '<li><span class="deviceIcon" style="background-image: url('+ deviceIcon +');"></span>' +
                    '<span class="deviceName">'+ friendlyName +'</span>';

                this.$('#lightSwitchList').append(html);
            },
            goBack: function() {
                var self = this;
                self.sandbox.uiInterface.hideSpinner();
                self.sandbox.emit("updateLongPressRule");
                self.sandbox.uiInterface.dismissSettings.call(self, {
                    cancel: true
                });

            },
            clearSettings: function() {
                this.goBack();
            },
            deleteRule:function() {
                var obj = {
                    RULE_ID : this.RuleID
                };
                this.sandbox.uiInterface.showSpinner();
                var self = this;
                rulesPlugin.deleteRules(obj, this.goBack, function(err){
                    self.saveRulesFailed(err, -1, 1);
                });
            },
            afterChangeRules: function() {
                this.sandbox.uiInterface.hideSpinner();
                var self = this,
                    str;
                if (this.RuleState === 1) {
                    str = this.i18n("labels", "ruleState1");
                } else {
                    str = this.i18n("labels", "ruleState0");
                }

                this.$(".notificationBanner").html(str).fadeIn();
                setTimeout(function(){
                    self.$(".notificationBanner").fadeOut();
                }, 3500);
            },
            changeRuleState : function () {
                this.$("#changeRuleState").toggleClass("disable");

                if (this.$("#changeRuleState").hasClass("disable")) {
                    this.RuleState = 0;
                } else {
                    this.RuleState = 1;
                }

                var obj = {
                    RULE_ID : this.RuleID,
                    STATE : this.RuleState
                };
                var self = this;
                self.sandbox.uiInterface.showSpinner();

                rulesPlugin.changeRuleStatus(obj, this.afterChangeRules, function(err){
                    self.saveRulesFailed(err, self.RuleState, 0);
                });
            },
            saveRulesFailed: function(err, state, deleteAction) {
                var self = this;
                this.sandbox.uiInterface.hideSpinner();
                if (err) {
                    if (err.ERROR_CODE === -402) {
                        var cannotSavedTitle = "";

                        if (state === -1 && deleteAction === 1) {
                            cannotSavedTitle = self.i18n('errorPopups.deviceNotDected.cannotDeletedTitle');
                        } else if (state === 1 && deleteAction === 0) {
                            cannotSavedTitle = self.i18n('errorPopups.deviceNotDected.cannotEnabledTitle');
                            self.$("#changeRuleState").addClass("disable");
                        } else if (state === 0 && deleteAction === 0) {
                            cannotSavedTitle = self.i18n('errorPopups.deviceNotDected.cannotDisabledTitle');
                            self.$("#changeRuleState").removeClass("disable");
                        }

                        this.popup = new this.sandbox.dom.Alert({
                            title: cannotSavedTitle,
                            message: self.i18n('errorPopups.deviceNotDected.message'),
                            buttonLabels: self.i18n('errorPopups.deviceNotDected.ok')
                        });
                    }
                }
                this.sandbox.uiInterface.hideSpinner();
            }
        });

        return View;
});
define('widgets/wemo_dimmer/js/summary',['Cache', 'hbs!widgets/wemo_dimmer/templates/summary', 'libs/range','widgets/wemo_dimmer/js/longPressRuleDetail','widgets/wemo_dimmer/js/editLongPressRule', 'libs/rulesPlugin'],
    /** @exports summary view */
        function(Backbone, template, Range, LongPressRuleDetailView, EditLongPressRuleView, rulesPlugin) {
        'use strict';

        var View = Backbone.DrawerBaseView.extend({
            template: template,
            isNightModeActive: false,
            events: {
                'click .fadeoutTime': 'openSelect',
                'click .btnTurn': 'toggleFadeOut',
                'click .timerButton': 'setSleepTimer',
                'click .longPressRule' : 'loadLongPressRulePage'
            },
            /**
             * two-way data binding
             */
            bindings: {
                '*[data-bind="customTime"]': {
                    observe: 'customTime',
                    onGet: function(val) {
                        var customTime  = parseInt(val, 10);
                        var time = this.convertSectoMin(customTime);
                        return time;
                    }
                },
                '*[data-bind="nightModeStatus"]': {
                    observe: ['nightMode', 'startTime', 'endTime'],
                    update: function($el, values) {
                        this.updateNightModeStatus();
                    }
                },
                '*[data-bind="nightModeMessage"]': {
                    observe: ['nightModeBrightness', 'startTime', 'endTime', 'nightMode'],
                    onGet: function(values) {
                        var nightModeBrightness =   parseInt(values[0], 10),
                            startTime = this.convertSecToTime(parseInt(values[1], 10)),
                            endTime = this.convertSecToTime(parseInt(values[2], 10)),
                            nightMode =  parseInt(values[3], 10),
                            str;

                        if (nightMode === 0) {
                            str = this.i18n("nightMode" , "default");
                        } else {
                            str =  nightModeBrightness + this.i18n("nightMode" , "brightnessFrom") + startTime + ' - ' + endTime;
                        }
                        return str;
                    }
                },
                '.longPressSection .row': {
                    observe: ['longPressRuleDeviceCnt', 'longPressRuleAction', 'longPressRuleState'],
                    update: function($el, values) {
                        var count = parseInt(values[0], 10),
                            action = parseInt(values[1], 10),
                            state = parseInt(values[2], 10),
                            str = "",
                            stateStr = "";

                        if (count > 0) {
                            str = this.i18n("labels", "ruleAction"+action);
                            stateStr =this.i18n("labels", "ruleState"+state);
                        } else if (count === 0){
                            str = this.i18n("labels", "createLongPressRule");
                        }
                        $el.find(".title").html(str);
                        $el.find(".status").html(stateStr);
                    }
                },
                '*[data-bind="longPressMessage"]': {
                     observe: ['longPressRuleDeviceCnt'],
                    update: function($el, val) {
                        this.updateLongPressRule();
                    }
                },
                '*[data-bind="hushModeTime"]': {
                    observe: 'hushMode',
                    update: function($el, val) {
                        this.updateHushModeTime();
                    }
                }

            },
            /**
             * localizes the template, and inserts it into the document fragment. Also binds the DOM events
             */
            render: function() {
                this.delegateEvents();
                this.runSleepTimer();
                this.changeOverTempStatus();
                this.sandbox.uiInterface.showSettings.call(this, this.$('.nightModeSection'), {view: "nightMode"});
                this.sandbox.uiInterface.showSettings.call(this, this.$('.hushModeSection'), {view: "hushMode"});


                var self = this;
                this.isChangingFromSlider = false;
                this.brightnessRange = new Range();
                setTimeout(function(){
                    self.brightnessRange.init(self.$('.slider'), {
                        thumbColor: (self.isNightModeActive) ? '#3e4978' : '#73D44C',
                        fillColor: (self.isNightModeActive) ? '#7386d6': '#ADE48C',
                        size: 28,
                        min: 1,
                        value: self.model.get("brightness"),
                        onTouchMove: self.changeDimValue.bind(self),
                        onChange: self.setState.bind(self)
                    });
                }, 0);
            },

            /**
             * put non-DOM event listeners here. These need to be removed when no longer necessary to free up memory (this.stopListening())
             */
            listen: function() {
                this.listenTo(this.model, 'change:fader', this.runSleepTimer);
                this.listenTo(this.model, 'change:fader', this.renderSleepButton);
                this.listenTo(this.model, 'change:customTime', this.renderSleepButton);
                this.listenTo(this.model, 'change:brightness', this.updateSlider);
                this.listenTo(this.model, 'change:brightness', this.updateNightModeStatus);
                this.listenTo(this.model, 'change:overTemp', this.changeOverTempStatus);
                this.listenTo(this.model, 'change:hushMode', this.updateHushModeTime);
                this.sandbox.on('drawer.open', this.updateDrawer);
                this.sandbox.on('drawer.close', this.cancelTimer);
                this.sandbox.on("nightModeSaved", this.startTimer);
                this.sandbox.on("updateLongPressRule", this.updateLongPressRule);
            },

            updateDrawer: function() {
                this.updateSlider();
                this.updateNightModeStatus();
                this.startTimer();
                this.updateToggle();
                this.renderSleepButton();
                this.saveDeviceNames();
            },

            saveDeviceNames: function() {
                var devices = this.sandbox._parent.sandboxes;
                var deviceList = {};

                $.each(devices,function(key, val){
                    deviceList[key] = val.properties;
                    if(deviceList[key] !== null && typeof deviceList[key] === 'object'){
                        if(deviceList[key] && deviceList[key].friendlyName !== undefined){
                            DEBUG && console.log("dimmer drawer friendlyname :: " + deviceList[key].friendlyName);
                            deviceList[key] = deviceList[key].friendlyName;
                        } else if (val.model && val.model.attributes && val.model.attributes.defaultFriendlyName !== undefined) {
                            deviceList[key] = val.model.attributes.defaultFriendlyName;
                        }
                    }
                });
                window.sessionStorage.setItem("SFW_DEVICE_FRIEDNLYNAME", JSON.stringify(deviceList));
                this.updateLongPressRule();
            },
            updateHushModeTime: function() {
                var hushMode = this.model.get("hushMode").split(":"),
                    mode = parseInt(hushMode[0]),
                    hushModeEndTime,
                    hushModeMsg;
                if (mode === 0) {
                    hushModeEndTime = "";
                    hushModeMsg = this.i18n("hushMode", "default");
                } else if (mode === 1) {
                    hushModeEndTime = this.i18n("labels", "Until") + this.convertToDay(parseInt(hushMode[1]) * 1000) + this.convertTime(parseInt(hushMode[1]) * 1000);
                    hushModeMsg = this.i18n("hushMode", "errorsAreHidden");
                }
                this.$(".hushModeTime").text(hushModeEndTime);
                this.$(".lightBarMessage").text(hushModeMsg);
            },
            updateLongPressRule: function() {
                var udnStr = this.model.get("longPressRuleDeviceUdn").replace(" ", ""),
                    longPressRuleDeviceCnt = this.model.get("longPressRuleDeviceCnt"),
                    deviceCnt = parseInt(longPressRuleDeviceCnt, 10),
                    str = "",
                    udns = [],
                    friendlyName = window.sessionStorage.getItem("SFW_DEVICE_FRIEDNLYNAME");

                DEBUG && console.log("long press rule friendlyname :: " + friendlyName);

                if (udnStr) {

                    if (udnStr.indexOf(",") !== -1) {
                        udns = udnStr.split(",");
                    } else {
                        udns[0] = udnStr;
                    }

                    if (deviceCnt > 0) {
                        if (friendlyName) {
                            var friendlyNameObj = JSON.parse(friendlyName);

                            for (var i = 0; i < udns.length; i++) {
                                var deviceStr = friendlyNameObj[udns[i]];
                                if (!deviceStr) {
                                    var defaultName;
                                    if (udns[i].match(/socket/gi)) {
                                        defaultName = this.i18n("labels", "WeMoSwitch");
                                    } else if (udns[i].match(/insight/gi)) {
                                        defaultName = this.i18n("labels", "WeMoInsight");
                                    } else if (udns[i].match(/lightswitch/gi)) {
                                        defaultName = this.i18n("labels", "WeMoLightSwitch");
                                    } else if (udns[i].match(/dimmer/gi)) {
                                        defaultName = this.i18n("defaultFriendlyName");
                                    }

                                    friendlyNameObj[udns[i]] = defaultName;
                                }
                            }

                            if (udns.length > 2) {
                                for (var i = 0; i < udns.length; i++) {
                                    var deviceStr = friendlyNameObj[udns[i]];
                                    if (i < udns.length - 1) {
                                        str += deviceStr + ", ";
                                    } else {
                                        str += this.i18n("labels", "and")  + " " + deviceStr;
                                    }
                                }
                            } else if (udns.length === 2) {
                                str = friendlyNameObj[udns[0]] + " "+ this.i18n("labels", "and") + " " + friendlyNameObj[udns[1]];
                            } else if (udns.length === 1) {
                                str = friendlyNameObj[udns[0]];
                            }

                            if (str.length > 44) {
                                var str = "",
                                    num;
                                if (udns.length > 2) {
                                    for (var i = 0; i < udns.length; i++) {
                                        var deviceStr = friendlyNameObj[udns[i]];

                                        if ((str + deviceStr).length < 31) {
                                            if (i === 0) {
                                                str += deviceStr;
                                            } else {
                                                str += ", " + deviceStr;
                                            }
                                        } else {
                                            num = udns.length - i;
                                            str = str + " & " + num + this.i18n("labels", "others");
                                            break;
                                        }
                                    }
                                } else if (udns.length === 2) {
                                    str = friendlyNameObj[udns[0]] + " & 1"+ this.i18n("labels", "others");
                                }
                            }

                        } else if (udns.length === 1 && udns[0] === this.sandbox.information.udn) {
                            str = this.model.get("friendlyName");
                        }

                    }
                } else {
                    if (deviceCnt === 0) {
                        str = this.i18n("labels", "noRules");
                    } else {
                        str = "WeMo Devices";
                    }

                }

                this.$(".longPressMessage").html(str);
            },

            loadLongPressRulePage : function() {
                this.sandbox.uiInterface.showSpinner();
                rulesPlugin.showRules(this.afterFetchRules);
            },
            afterFetchRules : function(rulesData) {
                var lprObj = {},
                    self = this,
                    currentDimmerUdn = this.sandbox.information.udn;

                if (rulesData && rulesData.length > 0) {
                    for (var i = 0; i < rulesData.length; i++){
                        var rulesDataObj =  rulesData[i];
                        if (rulesDataObj["DB_RULE_TYPE"] === "Long Press" && (rulesDataObj["WIFI_DEV_ARR"][0].UDN === currentDimmerUdn)) {
                            lprObj = rulesDataObj;
                        }
                    }
                }

                setTimeout(function(){
                    self.sandbox.uiInterface.hideSpinner();
                }, 400);

                if (!Object.keys(lprObj).length) {
                    this.editLongPressRuleView = new EditLongPressRuleView({
                        sandbox: self.sandbox,
                        parentElement: $("#mainContainer"),
                        parent: self,
                        longPressRule : lprObj,
                        addRulesData : rulesData
                    });
                    this.editLongPressRuleView.initialRender();

                } else {
                    this.longPressRuleDetailView = new LongPressRuleDetailView({
                        sandbox: self.sandbox,
                        parentElement: $("#mainContainer"),
                        parent: self,
                        longPressRule : lprObj,
                        addRulesData : rulesData
                    });
                    this.longPressRuleDetailView.initialRender();
                }
            },
            //functions for night mode brightness
            cancelTimer:function() {
                var self = this;
                if (self.beforeActiveTimerInterval) {
                    clearInterval(self.beforeActiveTimerInterval);
                    self.beforeActiveTimerInterval = false;
                }

                if (self.duringActivetimerInterval) {
                    clearInterval(self.duringActivetimerInterval);
                    self.duringActivetimerInterval = false;
                }
            },

            startTimer: function() {
                var startTime = parseInt(this.model.get("startTime"), 10),
                    endTime = parseInt(this.model.get("endTime"), 10),
                    nightMode =  parseInt(this.model.get("nightMode"), 10),
                    currentTime = new Date().getTime();

                var time = this.convertTime(currentTime),
                    vals = time.split(' '),
                    timeNum = vals[0],
                    ampm = vals[1].toLowerCase();

                if (nightMode === 1) {
                    var timeTosec = parseInt(this.convertToSecond(ampm, timeNum), 10);

                    if (endTime < startTime) {
                        endTime += 86400;
                    }

                    var distanceFromStart = startTime - timeTosec,
                        distanceFromEnd = endTime - timeTosec,
                        self = this;

                    if (distanceFromStart <= 0) {
                        if (self.beforeActiveTimerInterval) {
                            this.updateNightModeStatus();
                            clearInterval(self.beforeActiveTimerInterval);
                            self.beforeActiveTimerInterval = false;
                        }
                        if (distanceFromEnd <= 0) {
                            if (self.duringActivetimerInterval) {
                                this.updateNightModeStatus();
                                clearInterval(self.duringActivetimerInterval);
                                self.duringActivetimerInterval = false;
                            }
                        } else {
                            if (!self.duringActivetimerInterval) {
                                self.duringActivetimerInterval = setInterval(function() {
                                    self.startTimer();
                                }, 5000);
                            }
                        }
                    } else {
                        if (!self.beforeActiveTimerInterval) {
                            self.beforeActiveTimerInterval = setInterval(function() {
                                self.startTimer();
                            }, 5000);
                        }
                    }
                }
            },

            updateNightModeStatus: function() {
                if (!this.isChangingFromSlider) {
                    var nightMode =  parseInt(this.model.get("nightMode"), 10),
                        startTime = parseInt(this.model.get("startTime"), 10),
                        endTime =  parseInt(this.model.get("endTime"), 10),
                        brightness =  parseInt(this.model.get("brightness"), 10),
                        nightModeBrightness =  parseInt(this.model.get("nightModeBrightness"), 10),
                        currentTime = new Date().getTime(),
                        str;


                    var time = this.convertTime(currentTime),
                        vals = time.split(' '),
                        timeNum = vals[0],
                        ampm = vals[1].toLowerCase();


                    if (endTime < startTime) {
                        endTime += 86400;
                    }

                    var timeTosec = parseInt(this.convertToSecond(ampm, timeNum), 10);

                    if (nightMode === 1) {
                        str =  this.i18n("status", "enabled");
                        this.$("span[data-bind='nightModeStatus']").removeClass();

                        if (timeTosec >= startTime && timeTosec < endTime) {
                            str =  this.i18n("status", "active");
                            this.$("span[data-bind='nightModeStatus']").removeClass().addClass("active");

                            if (brightness === nightModeBrightness) {
                                this.showNightModeBrightnessBar();
                            } else {
                                this.showRegularBrightnessBar();
                            }
                        } else {
                            this.showRegularBrightnessBar();
                        }

                    } else {
                        str =  this.i18n("status", "disabled");
                        this.$("span[data-bind='nightModeStatus']").removeClass();
                        this.showRegularBrightnessBar();
                    }

                    this.$("span[data-bind='nightModeStatus']").html(str);
                }


            },

            showNightModeBrightnessBar: function() {
                var self = this;
                this.isNightModeActive = true;
                self.$('.sliderContainer').addClass('nightMode');
                self.brightnessRange.setThumbColor('#3e4978', self.$('.sliderContainer .slider'));
                self.brightnessRange.setFillColor('#7386d6', self.$('.sliderContainer .slider'));
            },
            showRegularBrightnessBar: function() {
                var self = this;
                this.isNightModeActive = false;
                self.$('.sliderContainer').removeClass('nightMode');
                self.brightnessRange.setThumbColor('#73D44C', self.$('.sliderContainer .slider'));
                self.brightnessRange.setFillColor('#ADE48C', self.$('.sliderContainer .slider'));
            },
            /**
             * Opens the custom time selector
             * @param {DOM element} event DOM element that was clicked on
             */
            openSelect: function(event) {
                var $target = $(event.currentTarget),
                    self = this;

                $target.mobiscroll().timespan({
                    wheelOrder: 'ii',
                    theme: 'wemoModal dimmerTimer',
                    minTime: 60000,
                    maxTime: 1800000,
                    mode: 'scroller',
                    display: 'bottom',
                    rows: 3,
                    minWidth: 100,
                    headerText: function(){
                        return self.i18n('labels', 'time');
                    },
                    labels: ['Y', 'M', 'D', 'H', 'M', 'S'],
                    buttons: [
                        'cancel',
                        'set'
                    ],
                    closeOnOverlay: false,
                    onBeforeShow: function(inst) {
                        var customTime = self.model.get('customTime');
                        var minute = Math.floor(customTime / 60);

                        $target.mobiscroll('setValue', [minute], true, 1, false);

                        inst.buttons.set.text = self.i18n('labels', "done");
                    },
                    onClose: function(value, btn) {
                        if (btn === 'set') {
                            var m = parseInt(value.split(' ')[0]);
                            var time = m * 60;
                            self.model.set('customTime', time);
                        }
                    }
                });
            },
            /**
             * Updates the slider with current value
             */
            updateSlider: function() {
                if (!this.isChangingFromSlider) {
                    var brightness =  this.model.get("brightness");
                    this.brightnessRange.setValue(brightness);
                }

            },
            /**
             * Toggle fade out button
             */
            updateToggle: function() {
                var fader  = this.model.get("fader"),
                    faderToggle = parseInt(fader.split(':')[2], 10);
                if (faderToggle === 1) {
                    this.$('.btnTurn').addClass('toggleOn');
                    this.model.set("sleepTimerToggle", 1);
                } else {
                    this.model.set("sleepTimerToggle", 0);
                }
            },
            /**
             * Toggle fade out button
             */
            toggleFadeOut: function() {
                if (this.$('.btnTurn').hasClass('toggleOn')) {
                    this.$('.btnTurn').removeClass('toggleOn');
                    this.model.set("sleepTimerToggle", 0);
                } else {
                    this.$('.btnTurn').addClass('toggleOn');
                    this.model.set("sleepTimerToggle", 1);
                }

                this.renderSleepButton();
            },

            renderSleepButton : function() {
                var fader = this.model.get('fader'),
                    sleepFaderSplit = fader.split(':'),
                    countDownTime = parseInt(sleepFaderSplit[0], 10),
                    referenceTime = parseInt(sleepFaderSplit[1], 10),
                    toggle  = parseInt(this.model.get("sleepTimerToggle")),
                    currEpoch = new Date().getTime(),
                    currentTime = Math.round(currEpoch / 1000.0),
                    str, faderStr;

                if((this.model.get("customTime")) && (parseInt(this.model.get("customTime")) > 0)) {
                    countDownTime = this.model.get("customTime");
                }

                var timerEndTime = this.convertTime(countDownTime * 1000 +  currEpoch);


                var leftTime = referenceTime + countDownTime - currentTime;

                if (referenceTime === -1) {
                    this.clearSleepTimer();

                    if (toggle === 0) {
                        faderStr = this.i18n("messages", "lightWillGoOut") + timerEndTime;
                    } else if (toggle === 1) {
                        faderStr = this.i18n("messages", "lightsWillFadeOut") + timerEndTime;
                    }
                } else {
                    if (leftTime > 0) {
                        str = this.i18n("labels", "cancelTimer");
                        this.$(".timerButton").html(str).removeClass("initiatingTimer")
                            .addClass("cancelTimer");
                        this.$(".btnTurnOffOn").addClass("disabled");
                        this.$(".fadeoutTime").addClass("timerRunning");
                        this.updateToggle();

                        if (toggle === 0) {
                            faderStr = this.i18n("messages", "turnoff") + timerEndTime;
                        } else if (toggle === 1) {
                            faderStr = this.i18n("messages", "fadeout") + timerEndTime;
                        }

                    } else {
                        str = this.i18n("labels", "startTimer");
                        this.$(".timerButton").html(str)
                            .removeClass("cancelTimer").removeClass("initiatingTimer");
                        this.$(".btnTurnOffOn").removeClass("disabled");
                        this.$(".fadeoutTime").removeClass("timerRunning");

                        if (toggle === 0) {
                            faderStr = this.i18n("messages", "lightWillGoOut") + timerEndTime;
                        } else if (toggle === 1) {
                            faderStr = this.i18n("messages", "lightsWillFadeOut") + timerEndTime;
                        }
                    }
                }
                this.$(".fadeoutMessage").html(faderStr);
            },
            /**
             * Logic for sleep fader timer
             */
            runSleepTimer: function() {
                var fader = this.model.get('fader'),
                    sleepFaderSplit = fader.split(':'),
                    countDownTime = parseInt(sleepFaderSplit[0], 10),
                    referenceTime = parseInt(sleepFaderSplit[1], 10),
                    isFaderEnabled = parseInt(sleepFaderSplit[2], 10),
                    brightnessDelta = parseFloat(sleepFaderSplit[3]),
                    startBrightnessVal = parseInt(sleepFaderSplit[4], 10),
                    currentTime = Math.round(new Date().getTime() / 1000.0),
                    $elem = this.$('*[data-bind="customTime"]'),
                    endTime = referenceTime + countDownTime ,
                    leftTime = endTime - currentTime,
                    self = this;

                if (countDownTime < 0) {
                    countDownTime = 300;
                }

                this.model.set('customTime', countDownTime);
                this.model.set("sleepTimerToggle", isFaderEnabled);

                if (endTime > 0 && leftTime > 0) {

                    var hours = 0,
                        minutes = Math.floor(leftTime / 60),
                        seconds = leftTime - minutes * 60,
                        lbl = '';

                        minutes = (minutes > 9) ? minutes : ("0"+minutes);
                        seconds = (seconds > 9) ? seconds : ("0"+seconds);
                        lbl = minutes + ':' + seconds;

                    $elem.html(lbl);
                    if (!this.countDownInterval) {
                        $elem.addClass("timerRunning");
                        this.countDownInterval = setInterval(function() {
                            self.runSleepTimer();
                        }, 1000);
                    }

                    //calculate brightness fader
                    if (isFaderEnabled === 1 && leftTime < 1800 && brightnessDelta) {

                        var reducedBrightness = Math.ceil(brightnessDelta * (countDownTime - leftTime));

                        var remainBrightness = startBrightnessVal + reducedBrightness;

                        remainBrightness =  (remainBrightness < 3) ? 1 : remainBrightness;

                        remainBrightness = parseInt(remainBrightness, 10);

                        this.model.set("brightness", remainBrightness);
                    }
                } else {
                    DEBUG && console.log("currentTime :: " + currentTime +  ":: endTime :: " + endTime + ":: referenceTime ::" + referenceTime);
                    if (this.countDownInterval) {
                        self.clearSleepTimer();
                    }
                }

                //set fadeout mode
                if (isFaderEnabled === 1) {
                    this.$(".fandOut .btnTurn").addClass("toggleOn");
                } else {
                    this.$(".fandOut .btnTurn").removeClass("toggleOn")
                }

            },
            /**
             * sets the sleep fader timer
             */
            setSleepTimer: function() {
                var timer = parseInt(this.model.get('customTime'), 10),
                    currEpoch = Math.round(new Date().getTime() / 1000),
                    isFaderEnabled = parseInt(this.model.get('sleepTimerToggle'), 10);

                if (this.countDownInterval) {
                    currEpoch = -1;
                }

                this.showInitiatingStatus();
                var faderVal;
                faderVal = timer + ':' + currEpoch + ':' + isFaderEnabled+ ':0:0';

                this.model.saveActionWithVal(['fader'], faderVal).done(this.successSaveAction).fail(this.failFaderAction);
            },

            showInitiatingStatus: function() {
                var str = this.i18n("labels", "Initiating");
                this.$(".timerButton").html(str)
                    .removeClass("cancelTimer").addClass("initiatingTimer");
                this.$(".btnTurnOffOn").removeClass("disabled");
                this.$(".fadeoutTime").removeClass("timerRunning");
            },

            failFaderAction: function() {
                var str = this.i18n("labels", "fadeTimerError");
                this.$(".timerButton").html(str)
                    .removeClass("cancelTimer").addClass("initiatingTimer");
            },

            changeOverTempStatus: function() {
                var overTempStatus = parseInt(this.model.get("overTemp"));

                if (overTempStatus === 1 ) {
                    this.$el.addClass("disabled");
                } else {
                    this.$el.removeClass("disabled");
                }
            },
            /**
             * clears the timer when necessary
             */
            clearSleepTimer: function() {
                var self = this;
                clearInterval(self.countDownInterval);
                this.countDownInterval = false;
                var customTime = parseInt(this.model.get('customTime'), 10),
                    str = this.i18n("labels", "startTimer");
                var countdownTime = this.convertSectoMin(customTime);

                this.$(".fadeoutTime").html(countdownTime);

                this.$(".timerButton").html(str)
                    .removeClass("cancelTimer initiatingTimer");
                this.$(".fadeoutTime").removeClass("timerRunning");
                this.$(".btnTurnOffOn").removeClass("disabled");
            },
            /**
             * changes the value of the slider
             * @param {DOM element} e DOM element that represents current value of the slider
             */
            changeDimValue: function(e) {
                this.isChangingFromSlider = true;
                var value =  e.target.value;
                this.model.set("brightness", value);

            },

            convertSectoMin: function(customTime) {
                var hour = (Math.floor((customTime / 3600))),
                    minute = Math.floor((customTime - (hour * 3600)) / 60),
                    time;

                if (hour > 0) {
                    time =  hour + 'h ' + minute + "m";
                } else {
                    time =  minute + "m";
                }

                return time;
            },
            /**
             * Function to convert seconds to HH:MM ampm
             * @param seconds
             * @returns {string}
             */
            convertTime: function(milliseconds) {
                var date = new Date(milliseconds),
                    hours = date.getHours(),
                    minutes = date.getMinutes();

                if (hours < 10) {
                    hours = hours;
                }
                if (minutes < 10) {
                    minutes = "0" + minutes;
                }

                var time = hours + ':' + minutes + ' am';

                if (hours === 0) {
                    time = '12:' + minutes + ' am';
                }

                if (hours >= 12) {
                    if (hours !== 12) {
                        hours = hours - 12;
                    }
                    time = hours + ':' + minutes + ' pm';
                }
                return time;
            },
            convertToDay: function(milliseconds) {
                var date = new Date(milliseconds),
                    day = date.getDay(),
                    daysArr = ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'],
                    dayStr = "",
                    currentTime = new Date(),
                    oneDay =  24 * 60 * 60 * 1000 - 20000;

                if ((date-currentTime) > oneDay) {
                    dayStr = daysArr[day] + ", ";
                }
                return dayStr;
            },
            /**
             * Function to convert seconds to HH:MM ampm
             * @param seconds
             * @returns {string}
             */
            convertSecToTime: function(seconds) {
                if (seconds > 86400) {
                    seconds = seconds - 86400;
                }
                var sec_num = parseInt(seconds, 10);
                var hours = Math.floor(sec_num / 3600);
                var minutes = Math.floor((sec_num - (hours * 3600)) / 60);

                var seconds = sec_num - (hours * 3600) - (minutes * 60);


                if (minutes < 10) {
                    minutes = "0" + minutes;
                }
                if (seconds < 10) {
                    seconds = "0" + seconds;
                }

                var time = hours + ':' + minutes + ' am';

                if (hours === 0) {
                    time = '12:' + minutes + ' am';
                }

                if (hours >= 12) {
                    if (hours !== 12) {
                        hours = hours - 12;
                    }
                    time = hours + ':' + minutes + ' pm';
                }
                return time;
            },
            convertToSecond: function(ampm, time) {
                time = time.replace('am', '');
                time = time.replace('pm', '');
                time = time.split(':');
                if (ampm === 'pm') {
                    if (time[0] !== '12')
                        time[0] = parseInt(time[0], 10) + 12;
                } else if (time[0] === '12') {
                    time[0] = 0;
                }
                return (parseInt(time[0], 10) * 3600) + (parseInt(time[1], 10) * 60);
            },
            /**
             * Logic to change fader value
             */
            setState: function(e) {
                this.isChangingFromSlider = false;
                this.model.saveAction(['brightness']).done(this.successSaveAction).fail(this.failSaveAction);
                this.updateNightModeStatus();
            },
            /**
             * When saveAction is success
             */
            successSaveAction: function(resp) {
                DEBUG && console.log('DIMMER:SUCCESS:SAVE:ACTION');
            },
            /**
             * When saveAction fails
             */
            failSaveAction: function() {
                DEBUG && console.log('DIMMER:ERROR:SAVE:ACTION');
            }
        });

        return View;
    });

/* START_TEMPLATE */
define('hbs!widgets/wemo_dimmer/templates/nightMode',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<header>\n    <div class=\"back\">\n        <span class=\"backIcon\"></span>\n        <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.nightModeSettings", options) : helperMissing.call(depth0, "i18n", "labels.nightModeSettings", options)))
    + "</span>\n    </div>\n</header>\n<section class=\"content\">\n    <div class=\"info\">\n        <div class=\"text\">\n            ";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "messages.nightModeInfo", options) : helperMissing.call(depth0, "i18n", "messages.nightModeInfo", options)))
    + "\n        </div>\n        <div class=\"helpIcon\"></div>\n    </div>\n    <div class=\"isEnabledRow row\">\n        <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.nightMode", options) : helperMissing.call(depth0, "i18n", "labels.nightMode", options)))
    + "</span>\n        <div class=\"btnTurnOffOn\">\n            <span class=\"btnTurn\">\n                <span class=\"btnSlider\"></span>\n            </span>\n        </div>\n    </div>\n    <div class=\"brightnessRow row\">\n        <div class=\"nightModeBrightnessLabel\">\n            <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.brightness", options) : helperMissing.call(depth0, "i18n", "labels.brightness", options)))
    + "</span>\n            <span class=\"brightness\"><span class=\"value\" data-bind=\"nightModeBrightness\"></span></span>\n        </div>\n\n        <div class=\"sliderContainer\">\n            <div class='slider'></div>\n        </div>\n    </div>\n    <div class=\"startTimeRow row\">\n        <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.start", options) : helperMissing.call(depth0, "i18n", "labels.start", options)))
    + "</span>\n        <span class=\"startTime\" data-bind=\"nightModeStartTime\"></span>\n    </div>\n    <div class=\"endTimeRow row\">\n        <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.end", options) : helperMissing.call(depth0, "i18n", "labels.end", options)))
    + "</span>\n        <span class=\"endTime\" data-bind=\"nightModeEndTime\"></span>\n    </div>\n</section>\n\n<footer id=\"save_night_mode\" class=\"footer_btn\">\n    <div class=\"footerContainer\">\n        <span class=\"doneBtn\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "buttons.Save", options) : helperMissing.call(depth0, "i18n", "buttons.Save", options)))
    + "</span>\n    </div>\n</footer>";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_dimmer_templates_nightMode', t);
return t;
});
/* END_TEMPLATE */
;
define('widgets/wemo_dimmer/js/nightMode',['Cache', 'hbs!widgets/wemo_dimmer/templates/nightMode', 'libs/range'],
    /** @exports settings view */
        function (Backbone, template, Range) {

        'use strict';

        var View = Backbone.OverlayView.extend({
            tagName: 'div',
            template: template,
            className: 'nightMode noMainHeader',

            events: {
                'click .back': 'clearSettings',
                'click #save_night_mode': 'saveNightMode',
                'click .btnTurn': 'toggleEnabled',
                'click .startTime': 'setStartTime',
                'click .endTime': 'setEndTime',
                'click .info' : 'loadHelpSlides'
            },

            bindings: {
                '*[data-bind="nightModeBrightness"]': {
                    observe: 'nightModeBrightness',
                    onGet: function(val) {
                        return val + "%";
                    }
                }
            },

            goBack: function() {
                var self = this;
                self.sandbox.emit("nightModeViewClosed");
                DEBUG && console.log('WEMO_DIMMER:NIGHTMODE.JS:GOING BACK');
                self.sandbox.uiInterface.dismissSettings.call(self, {
                    cancel: true
                });
            },
            clearSettings: function() {
                var self = this;
                this.model.set(self.savedNightMode);
                this.goBack();
            },
            loadHelpSlides: function() {
                var NIGHTMODE_SLIDES = "file:///android_asset/www/more/learn_about_wemo.html?fromsfw=night_mode_tutorial";
                window.location.href = NIGHTMODE_SLIDES;
            },
            saveNightMode : function() {
                this.model.set("startTime", this.startTime);
                this.model.set("endTime", this.endTime);
                var startTime = parseInt(this.model.get("startTime"), 10),
                    endTime = parseInt(this.model.get("endTime"), 10),
                    nightMode = this.model.get("nightMode"),
                    nightModeBrightness = this.model.get("nightModeBrightness");

                DEBUG && console.log("nightMode " + nightMode +  " : nightModeBrightness " + nightModeBrightness +  " : startTime " + startTime + " : endTime " + endTime );

                this.model.saveAction(['nightMode', 'nightModeBrightness', 'startTime', 'endTime']).done(this.successSaveAction).fail(this.failSaveAction);
                this.goBack();
            },

            toggleEnabled: function() {
                if (this.$('.btnTurn').hasClass('toggleOn')) {
                    this.$('.btnTurn').removeClass('toggleOn');
                    this.model.set("nightMode", 0);
                } else {
                    this.$('.btnTurn').addClass('toggleOn');
                    this.model.set("nightMode", 1);
                }
            },

            changeBrightnessValue: function(e) {
                var value = e.target.value,
                    brightness = parseInt(this.model.get("nightModeBrightness"), 10);

                if (brightness !== value) {
                    this.model.set("nightModeBrightness", e.target.value);
                    this.isChangingFromSlider = true;
                }
            },

            updateBrightnessValue: function() {
                this.range.setValue(this.model.get("nightModeBrightness"));
            },

            setStartTime: function(e) {
                this.openSelect(e, 'startTime');
            },

            setEndTime: function(e) {
                this.openSelect(e, 'endTime');
            },

            openSelect: function(event, key) {
                var $target = $(event.currentTarget),
                    self = this;

                $target.mobiscroll().time({
                    theme: 'wemoModal dimmerTimer',
                    mode: 'scroller',
                    display: 'bottom',
                    minWidth: 80,
                    headerText: function(){
                        return self.i18n('labels', key);
                    },
                    buttons: [
                        'cancel',
                        'set'
                    ],
                    closeOnOverlay: false,
                    onBeforeShow: function(inst) {
                        var blockValue = '';
                        if (key === "startTime") {
                            blockValue = self.$('.endTime').text();
                        } else {
                            blockValue = self.$('.startTime').text();
                        }

                        blockValue = blockValue.replace("am", ":0").replace("pm", ":1").split(":");

                        if (blockValue[2] === '1' && blockValue[0] !== '12') {
                            blockValue[0] = parseInt(blockValue[0],10)+12;
                        }

                        if (blockValue[2] === '0' && blockValue[0] === '12') {
                            blockValue[0] = '00';
                        }

                        var timerOptions = blockValue[0]+":"+blockValue[1];

                        $target.mobiscroll('option', { invalid: [{ start: timerOptions, end:  timerOptions }] });

                        inst.buttons.set.text =  self.i18n('labels', "done");
                    },
                    onClose: function(value, btn) {
                        if (btn === 'set') {
                            var vals = value.split(' '),
                                time = vals[0],
                                ampm = vals[1].toLowerCase();
                            var saveTime = self.convertToSecond(ampm, time);
                            var timeDisplay =  self.convertTime(saveTime);

                            if (key === "startTime") {
                                self.startTime = saveTime;
                            } else {
                                self.endTime = saveTime;
                            }
                            $target.text(timeDisplay);
                        }
                    }
                });
                $target.mobiscroll('setValue', $target.text());
            },

            updateToggle: function() {
                var faderToggle  = parseInt(this.model.get("nightMode"), 10);
                if (faderToggle === 1) {
                    this.$('.btnTurn').addClass('toggleOn');
                }
            },

            updateTimes: function() {
                var startTime = this.convertTime(parseInt(this.model.get("startTime"), 10)),
                    endTime = this.convertTime(parseInt(this.model.get("endTime"), 10));

                this.$('.startTime').text(startTime);
                this.$('.endTime').text(endTime);
                this.startTime = this.model.get("startTime");
                this.endTime = this.model.get("endTime");
            },

            render: function() {
                this.updateToggle();
                this.updateTimes();
                this.updateSlider();
                this.getNightModeValues();
                this.sandbox.emit("nightModeOpened");
            },

            getNightModeValues: function(){
                this.savedNightMode = {
                    startTime : this.model.get("startTime"),
                    endTime : this.model.get("endTime"),
                    nightMode : this.model.get("nightMode"),
                    nightModeBrightness : this.model.get("nightModeBrightness")
                }
            },
            /**
             * put non-DOM event listeners here. These need to be removed when no longer necessary to free up memory (this.stopListening())
             */
            listen: function() {
                this.listenTo(this.model, 'change:nightMode', this.updateToggle);
                this.listenTo(this.model, 'change:nightModeBrightness', this.updateBrightnessValue);

            },

            updateSlider: function() {
                var self = this;
                this.range = new Range();
                setTimeout(function(){
                    self.range.init(self.$('.slider'), {
                        thumbColor: '#3e4978',
                        fillColor: '#7386d6',
                        min: 1,
                        size: 28,
                        value: self.model.get("nightModeBrightness"),
                        onTouchMove: self.changeBrightnessValue.bind(self)
                    });
                }, 0);
            },
            /**
             * Function to convert seconds to HH:MM ampm
             * @param seconds
             * @returns {string}
             */
            convertTime: function(seconds) {
                if (seconds > 86400) {
                    seconds = seconds - 86400;
                }
                var sec_num = parseInt(seconds, 10);
                var hours = Math.floor(sec_num / 3600);
                var minutes = Math.floor((sec_num - (hours * 3600)) / 60);

                var seconds = sec_num - (hours * 3600) - (minutes * 60);

                if (minutes < 10) {
                    minutes = "0" + minutes;
                }
                if (seconds < 10) {
                    seconds = "0" + seconds;
                }

                var time = hours + ':' + minutes + ' am';

                if (hours === 0) {
                    time = '12:' + minutes + ' am';
                }

                if (hours >= 12) {
                    if (hours !== 12) {
                        hours = hours - 12;
                    }
                    time = hours + ':' + minutes + ' pm';
                }
                return time;
            },
            convertToSecond: function(ampm, time) {
                time = time.replace('am', '');
                time = time.replace('pm', '');
                time = time.split(':');
                if (ampm === 'pm') {
                    if (time[0] !== '12')
                        time[0] = parseInt(time[0], 10) + 12;
                } else if (time[0] === '12') {
                    time[0] = 0;
                }
                return (parseInt(time[0], 10) * 3600) + (parseInt(time[1], 10) * 60);
            },
            /**
             * When saveAction is success
             */
            successSaveAction: function(resp) {
                console.log("RESPONSE OF SAVE ACTION:" + resp);
                this.sandbox.emit("nightModeSaved");
            },
            /**
             * When saveAction fails
             */
            failSaveAction: function() {
                console.log("ERRORS on save action");
            }
        });
        return View;
    });

/* START_TEMPLATE */
define('hbs!widgets/wemo_dimmer/templates/hushMode',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<header>\n    <div class=\"back\">\n        <span class=\"backIcon\"></span>\n        <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.hideErrors", options) : helperMissing.call(depth0, "i18n", "labels.hideErrors", options)))
    + "</span>\n    </div>\n</header>\n<section class=\"content\">\n    <div class=\"descriptionTitle\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "hushMode.gotErrorHeader", options) : helperMissing.call(depth0, "i18n", "hushMode.gotErrorHeader", options)))
    + "</div>\n    <div class=\"description\">\n        <div class=\"descriptionMsg\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "hushMode.gotErrorMsg", options) : helperMissing.call(depth0, "i18n", "hushMode.gotErrorMsg", options)))
    + "</div>\n\n        <div class=\"hideErrorIcon hushModeIcon\"></div>\n\n        <div class=\"descriptionNote\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "hushMode.gotErrorNote", options) : helperMissing.call(depth0, "i18n", "hushMode.gotErrorNote", options)))
    + "</div>\n    </div>\n\n    <div class=\"hushModeBtn hideErrorBtn\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "hushMode.hideErrors", options) : helperMissing.call(depth0, "i18n", "hushMode.hideErrors", options)))
    + "</div>\n</section>";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_dimmer_templates_hushMode', t);
return t;
});
/* END_TEMPLATE */
;
/** a common API for devices and the browser. the browser version returns mock data for testing, will be used as part of an extension to mixin with the sandbox  **/
define('libs/smartDevicePlugin',['libs/execHandler', 'libs/constants'], function(ExecHandler, Constants) {
    'use strict';

    var callPlugin = function(plugin, action, data, options) {
        var handler = new ExecHandler(options);
        return handler.go(plugin, action, data);
    }

    var exports = {
        /**
         * sends device to Native layer to update state via UPNP or cloud
         * @param {function} callback a callback method to fire on success, if one is defined.
         * @param {JSON object} model [the entire device model]
         * @param {JSON object} data        [contains state attributes]
         * @return {promise}
         */
        setDeviceState: function(callback, model, data) {
            return callPlugin('SmartDevicePlugin', 'setDeviceState', [model.baseObject.information, data], {
                callback: callback,
                model: model,
                useWindowMethod: model.baseObject.information.udn
            });
        },
        setDeviceProperties: function(callback, model, data) {
            return callPlugin('SmartDevicePlugin', 'setDeviceProperties', [model.baseObject.information, data], {
                callback: callback,
                model: model,
                useWindowMethod: model.baseObject.information.udn
            });
        },
        setNightModeConfiguration: function(callback, model, data) {
            return callPlugin('SmartDevicePlugin', 'setNightModeConfiguration', [data], {
                callback: callback
            });
        },
        /**
         * updates the state for all devices in a group
         * @param {Backbone.Model} model the device model
         * @param {JSON} data  the attributes to save
         */
        setGroupState: function(model, data) {
            return callPlugin('SmartDevicePlugin', 'setGroupState', [model.baseObject.information, data], {
                model: model,
                callback: function() {
                    model.trigger('save');
                },
                useWindowMethod: model.baseObject.properties.groupID
            });
        },
        collectEmailId:function(){
            return callPlugin('SmartDevicePlugin', 'collectEmailID');
        },
        /**
         * gets all discovered devices from smartCache
         * @return {promise}
         */
        getDevices: function() {
            return callPlugin('SmartDevicePlugin', 'getDevices');
        },
        getDevicesInfo: function() {
            return callPlugin('SmartDevicePlugin', 'getDevicesInfo');
        },
        /**
         * gets a single device from smartCache (smartCache must get data from device)
         * @return {promise}
         */
        getDevice: function(callback, model, options) {
            return callPlugin('SmartDevicePlugin', 'getDevice', [model.baseObject.information], {
                callback: callback,
                model: model
            });
        },
        checkNestAuth: function () {
            return callPlugin('SmartDevicePlugin', 'nestTokenExistForGivenHomeId');
        },

        getNestDevices: function () {
            return callPlugin('SmartDevicePlugin', 'getNestDevices');
        },
        /**
         * gets updated insight values every 5 seconds from smartCache (smartCache must get data from device)
         * @return {promise}
         */
        getInsightParameters: function(callback, model, options) {
            return callPlugin('SmartDevicePlugin', 'getInsightParameters', [model.baseObject.information], {
                callback: callback,
                model: model
            });
        },
        setInsightDrawerState: function(deviceInfo) {
            return callPlugin('SmartDevicePlugin', 'setInsightDrawerState', [deviceInfo]);
        },
        /**
         * refreshes device list - triggers re-discovery in smartCache
         * @return {promise}
         */
        refreshDevices: function() {
            return callPlugin('SmartDevicePlugin', 'refreshDevices');
        },
        /**
         * adds a device to a group
         * @param  {string} udn     unique device id
         * @param  {string} groupId unique group id
         * @param {boolean} isNewGroup true when creating a new group
         * @return {promise}
         */
        addToGroup: function(bridgeUDN, payload, isNewGroup) {
            if (!isNewGroup) isNewGroup = false;
            return callPlugin('SmartDevicePlugin', 'addToGroup', [bridgeUDN, payload, isNewGroup], {
                useWindowMethod: bridgeUDN
            });
        },
        /**
         * removes a device/devices from a group
         * @param  {string} udn     unique device id
         * @param  {string} groupId unique group id
         * @return {promise}
         */
        removeFromGroup: function(bridgeUDN, groupID) {
            return callPlugin('SmartDevicePlugin', 'removeFromGroup', [bridgeUDN, groupID, false], {
                useWindowMethod: bridgeUDN
            });
        },
        /** removes a device/devices from a group
         * @param  {string} type
         * @param  {json} deviceInfo
         * @param  {json} stateData
         * @return {promise}
         */
        resetDevice: function(type, deviceInfo, stateData, callback) {
            var dataArray = [type, deviceInfo];

            if (stateData !== null) {
                dataArray.push(stateData);
            }
            return callPlugin('SmartDevicePlugin', 'resetDevice', dataArray, {
                callback: callback
            });
        },
        /**
         * set blob storage from device
         * @param {String} udn
         * @param {JSON} data
         * @param {function} callback
         * @return {promise}
         */
        setBlobStorageData: function(udn, data, callback) {

            return callPlugin('SmartDevicePlugin', 'setBlobStorageData', [udn, data], {
                callback: callback,
                useWindowMethod: udn
            });
        },
        /**
         * get blob storage from device
         * @param {String} udn
         * @param {JSON} data
         * @param {function} callback
         * @return {promise}
         */
        getBlobStorageData: function(udn, data,callback) {
            return callPlugin('SmartDevicePlugin', 'getBlobStorageData', [udn,data],{
                callback: callback,
                useWindowMethod: udn
            });
        },
        /**
         * configure Dimming Range.
         * @param  {json} deviceInfo
         * @return {promise}
         */
        configureDimmingRange: function(deviceInfo) {
            return callPlugin('SmartDevicePlugin', 'configureDimmingRange', [deviceInfo]);
        },
        /**
         * check if Bulb devices are connected.
         * @param  {json} deviceInfo
         * @return {promise}
         */
        adjustIcon: function(deviceInfo, callback) {
            return callPlugin('SmartDevicePlugin', 'adjustIcon', [deviceInfo], {
                callback: callback
            });
        },
        /**
         * check if Bulb devices are connected.
         * @param  {json} deviceInfo
         * @return {promise}
         */
        choosePhoto: function(deviceInfo, callback) {
            return callPlugin('SmartDevicePlugin', 'choosePhoto', [deviceInfo], {
                callback: callback
            });
        },

        /**
         * check if Bulb devices are connected.
         * @param  {json} deviceInfo
         * @return {promise}
         */
        takePicture: function(deviceInfo, callback) {
            return callPlugin('SmartDevicePlugin', 'takePicture', [deviceInfo], {
                callback: callback
            });
        },
        /**
         * check if there is Netcam app installed
         * @return {promise}
         */
        checkNetcam: function() {
            return callPlugin('DevicePlugin', Constants.actions.CHECK_NET_CAM);
        },
        /**
         * launch Netcam app
         * @param  {string} item
         * @param  {json} deviceInfo
         * @param  {integer} extraParam
         * @return {promise}
         */
        launchNetcam: function(item, deviceInfo, extraParam) {
            var dataArray = [item, deviceInfo, extraParam];

            return callPlugin('DevicePlugin', Constants.actions.LAUNCH_NET_CAM_APP, dataArray);
        },
        /**
         * check if Bulb devices are connected.
         * @param  {json} deviceInfo
         * @return {promise}
         */
        findBulb: function(deviceInfo) {
            return callPlugin('SmartDevicePlugin', 'findBulb', [deviceInfo]);
        },
        /**
         * remove device disconnected from device list.
         * @param  {json} deviceInfo
         * @return {promise}
         */
        hideDevice: function(deviceInfo) {
            return callPlugin('SmartDevicePlugin', 'hideDevice', [deviceInfo]);
        },
        /**
         * remove device disconnected from device list.
         * @param  {string} groupID
         * @return {promise}
         */
        hideGroup: function(groupID) {
            return callPlugin('SmartDevicePlugin', 'hideGroup', [groupID]);
        },
        /**
         * initiate App recovery mecahnism
         * @return {promise}
         */
        initiateAppRecovery: function() {
            return callPlugin('SmartDevicePlugin', 'appRecovery');
        },
        /**
         * set bulb type
         * @param  {json} deviceInfo
         * @param {function} callback
         * @return {promise}
         */
        setBulbType: function(deviceInfo, callback) {
            return callPlugin('SmartDevicePlugin', 'setBulbType', [deviceInfo], {
                callback: callback
            });
        },
        /**
         * calibrate bulbs for dimmer
         * @param  {json} deviceInfo
         * @param {function} callback
         * @return {promise}
         */
        calibrateBulb: function(deviceInfo, callback) {
            return callPlugin('SmartDevicePlugin', 'calibrate', [deviceInfo], {
                callback: callback
            });
        },
        configHushMode: function(deviceInfo, callback) {
            return callPlugin('SmartDevicePlugin', 'configureHushMode', [deviceInfo], {
                callback: callback
            });
        },
        /**
        * to check if bohnjour present in network
        * @param {function} callback
        * @return {promise}
        */
        checkBohnjour: function(callback){

            return callPlugin('SmartDevicePlugin', 'checkBohnjour',[], {
                 callback : callback
            });
        },

        /**
         * generat auth code
         * @param {function} callback
         * @return {promise}
         */
        getAuthCode: function(callback) {
            return callPlugin('WebServicePlugin', 'getAuthCode', [], {
                callback: callback
            });
        },
        /**
         * generat auth code
         * @return {promise}
         */
        openAlexa: function() {
            return callPlugin('DevicePlugin', '9106', []);
        },
        /**
         * Smart device uuid
         * @return {promise}
         */
        getUUID: function(callback) {
            return callPlugin('DevicePlugin', '6004', [],{
                callback: callback
            });
        },
        getRemoteAccess: function(callback) {
            return callPlugin('DevicePlugin', '6002', [],{
                callback: callback
            });
        },
        getAnalyticsData: function(callback) {
            return callPlugin('NativeUtilPlugin', '6006', [],{
                callback: callback
            });
        }
    };

    return exports;
});

define('widgets/wemo_dimmer/js/hushMode',['Cache', 'hbs!widgets/wemo_dimmer/templates/hushMode', 'libs/smartDevicePlugin'],
    /** @exports settings view */
        function (Backbone, template, smartDevicePlugin) {
        'use strict';

        var popup;
        /**
         * view for Suspended options popup
         */
        var PopupView = Backbone.View.extend({
            initialize: function() {
                this.$el.append(popup);
            },
            events: {
                'click .selectOption': 'selectedSuspendedOption'
            },
            /**
             * active the currency selected by the user
             * @param event
             */
            selectedSuspendedOption: function(event) {
                this.$('.selectOption').removeClass('active');
                this.$(event.currentTarget).addClass('active');
            }
        });

        var View = Backbone.OverlayView.extend({
            template: template,
            className: 'hushMode noMainHeader',

            events: {
                "click .back" : "goBack",
                "click .hushModeBtn" : "setHushMode"
            },
            bindings: {

            },
            render: function() {
                this.updateUI();
                this.showOptionsPopup();
            },
            /**
             * put non-DOM event listeners here. These need to be removed when no longer necessary to free up memory (this.stopListening())
             */
            listen: function() {
                this.listenTo(this.model, 'change:hushMode', this.updateUI);
            },
            updateUI:function() {
                var hushMode = this.model.get("hushMode").split(":"),
                    mode = parseInt(hushMode[0]),
                    titleText,
                    btnText,
                    descriptionMsg;

                if (mode === 0) {
                    this.$(".hushModeIcon").removeClass("showErrorIcon").addClass("hideErrorIcon");
                    this.$(".hushModeBtn").removeClass("showErrorBtn")
                        .addClass("hideErrorBtn");
                    titleText = this.i18n('hushMode', "gotErrorHeader");
                    btnText = this.i18n('hushMode', "hideErrors");
                    descriptionMsg = this.i18n('hushMode', "gotErrorMsg");
                } else if (mode === 1) {
                    this.$(".hushModeIcon").removeClass("hideErrorIcon").addClass("showErrorIcon");
                    this.$(".hushModeBtn").removeClass("hideErrorBtn")
                        .addClass("showErrorBtn");
                    titleText = this.i18n('hushMode', "errorHiddenHeader");
                    btnText = this.i18n('hushMode', "showErrors");
                    descriptionMsg = this.i18n('hushMode', "errorHiddenMsg");
                }
                this.$(".descriptionTitle").html(titleText);
                this.$(".hushModeBtn").html(btnText);
                this.$(".descriptionMsg").html(descriptionMsg);
            },
            setHushMode: function() {
                var hushMode = this.model.get("hushMode").split(":"),
                    mode = parseInt(hushMode[0]),
                    udn = this.model.sandbox.information.udn,
                    self = this,
                    newHushMode;
                if (mode === 0) {

                    var popupTemplate = new PopupView();
                    this.confirmDialog = new this.sandbox.dom.CustomModal({
                        title: this.i18n("suspendedOptions","title"),
                        popupClass: 'hushModeOptionsPopup',
                        view: popupTemplate,
                        buttons: [{
                            text: this.i18n('buttons', 'Cancel'),
                            extraClass: 'passiveBtn',
                            width: '50%'
                        }, {
                            text: this.i18n('buttons', 'Set'),
                            extraClass: 'actionBtn',
                            width: '50%',
                            events: [{
                                tap: function() {
                                    var className = $(popupTemplate.$el).find('.active').attr('class'),
                                        utcTime = Math.round(Date.now()/1000),
                                        number,
                                        time;
                                    className = className.split(' ');
                                    number = parseInt(className[1].split('-')[1]);
                                    if (number === 1) {
                                        time = utcTime + (60*60);
                                        newHushMode = 1+ ":"+ time+":" + 1;
                                    } else if (number === 2) {
                                        time = utcTime + (60*60*24);
                                        newHushMode = 1+ ":"+ time+":" + 2;
                                    } else if (number === 3) {
                                        time = utcTime + (60*60*24*7);
                                        newHushMode = 1+ ":"+ time+":" + 3;
                                    }

                                    self.model.set('hushMode', newHushMode);

                                    var deviceInfo = {
                                        udn: udn,
                                        hushMode: newHushMode
                                    };

                                    smartDevicePlugin.configHushMode(deviceInfo, self.response);
                                }
                            }]
                        }]
                    });
                    $('.hushModeOptionsPopup .notification_inner').addClass('selectPopup');

                } else if (mode === 1){
                    newHushMode= "0:0:1";
                    this.model.set('hushMode', newHushMode);
                    var deviceInfo = {
                        udn: udn,
                        hushMode: newHushMode
                    };

                    smartDevicePlugin.configHushMode(deviceInfo, self.response);
                }
            },
            showOptionsPopup: function() {
                var divs = '<div class="optionsContainer">',
                    activeOption;

                var hushMode = this.model.get("hushMode").split(":"),
                    selectedSuspendedOption = parseInt(hushMode[2]);
                if (selectedSuspendedOption === 0) {
                    selectedSuspendedOption = 1;
                }
                for (var i = 1; i < 4; i++) {
                    activeOption = (selectedSuspendedOption === i) ?  " active" : "";
                    divs += '<div class="selectOption option-' + i + activeOption + '"><p>' + this.i18n('suspendedOptions.' + i) + '</p></div>';
                }
                divs += '</div>';
                popup = divs;
                this.popup = new PopupView();
            },
            goBack: function() {
                var self = this;
                self.sandbox.uiInterface.dismissSettings.call(self, {
                    cancel: true
                });
            },
            /**
             * When saveAction is success
             */
            successSaveAction: function(resp) {
                DEBUG && console.log('DIMMER:SUCCESS:SAVE:ACTION');
            },
            /**
             * When saveAction fails
             */
            failSaveAction: function() {
                DEBUG && console.log('DIMMER:ERROR:SAVE:ACTION');
            },
            /**
             * show response of configureHushMode
             * @param {string} resp
             */
            response: function(resp) {
                DEBUG && console.log("response config hushMode:" + resp);
            }
        });
    return View;
});

define('widgets/wemo_dimmer/js/drawer',['Cache','widgets/wemo_dimmer/js/summary','widgets/wemo_dimmer/js/nightMode','widgets/wemo_dimmer/js/hushMode'],
    /** @exports drawer */
        function(Backbone, SummaryView, NightModeView, HushModeView){

        'use strict';

        var View = Backbone.DrawerMasterView.extend({
            /**
             * determines which view to show on initial load
             */
            render: function(){
                var view;
                /** Set the summary view, for now*/
                view = 'summary';
                this.changeView(view);
            },
            loadedViews : {
                summary:{
                    view:SummaryView,
                    viewType:'drawer'
                },
                nightMode: {
                    view: NightModeView,
                    viewType: 'overlay'
                },
                hushMode: {
                    view: HushModeView,
                    viewType: 'overlay'
                }
            }
        });
        return View;
    });
/* START_TEMPLATE */
define('hbs!widgets/wemo_dimmer/templates/edit',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<ul class=\"dimmerEditOptions\">\n    <li class=\"option reConfigureBulbRow\">\n        <span class=\"reConfigureBulbs\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.bulbConfigure", options) : helperMissing.call(depth0, "i18n", "editContext.title.bulbConfigure", options)))
    + "</span>\n        <span class=\"bulbType\" data-bind=\"bulbType\"></span>\n        <i class=\"fa fa-angle-right\"></i>\n    </li>\n\n    <li class=\"option configHushModeRow\">\n        <span class=\"hideErrors\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.hideErrors", options) : helperMissing.call(depth0, "i18n", "labels.hideErrors", options)))
    + "</span>\n        <span class=\"hushMode\" data-bind=\"hushModeTime\"></span>\n        <i class=\"fa fa-angle-right\"></i>\n    </li>\n</ul>";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_dimmer_templates_edit', t);
return t;
});
/* END_TEMPLATE */
;
/* START_TEMPLATE */
define('hbs!widgets/wemo_dimmer/templates/dimmerSetupChooseBulb',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<header>\n    <div class=\"back\">\n        <span class=\"backIcon\"></span>\n        <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.dimmerSetUp", options) : helperMissing.call(depth0, "i18n", "editContext.title.dimmerSetUp", options)))
    + "</span>\n    </div>\n</header>\n\n\n<section class=\"content\">\n    <div class=\"descriptionTitle\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.description.whatBulb", options) : helperMissing.call(depth0, "i18n", "editContext.description.whatBulb", options)))
    + "</div>\n\n    <div class=\"description\">\n        <p>";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.description.dimmerOptimized", options) : helperMissing.call(depth0, "i18n", "editContext.description.dimmerOptimized", options)))
    + "</p>\n    </div>\n\n    <div class=\"chooseBulb\">\n        <div class=\"slider\"  data-bulbtype=\"CFL\">\n            <span class=\"bulbIcon cflBulb\"></span>\n            <span class=\"bulbName\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.description.CFL", options) : helperMissing.call(depth0, "i18n", "editContext.description.CFL", options)))
    + "</span>\n        </div>\n        <div class=\"slider\" data-bulbtype=\"LED\">\n            <span class=\"bulbIcon ledBulb\"></span>\n            <span class=\"bulbName\" >";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.description.LED", options) : helperMissing.call(depth0, "i18n", "editContext.description.LED", options)))
    + "</span>\n        </div>\n        <div class=\"slider\" data-bulbtype=\"Incandescent\">\n            <span class=\"bulbIcon incandescent\"></span>\n            <span class=\"bulbName\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.description.Incandescent", options) : helperMissing.call(depth0, "i18n", "editContext.description.Incandescent", options)))
    + "</span>\n        </div>\n        <div></div>\n    </div>\n\n    <div class=\"bulbTypeIntro defaultBtn\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.description.multipleBulbType", options) : helperMissing.call(depth0, "i18n", "editContext.description.multipleBulbType", options)))
    + "</div>\n    <div class=\"nextButton greenBtn\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "buttons.Begin", options) : helperMissing.call(depth0, "i18n", "buttons.Begin", options)))
    + "</div>\n</section>\n";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_dimmer_templates_dimmerSetupChooseBulb', t);
return t;
});
/* END_TEMPLATE */
;
/* START_TEMPLATE */
define('hbs!widgets/wemo_dimmer/templates/startTestBulb',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<header>\n    <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.ledCalibration", options) : helperMissing.call(depth0, "i18n", "editContext.title.ledCalibration", options)))
    + "</span>\n</header>\n\n<section class=\"content\">\n    <div class=\"descriptionTitle\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.description.letusTestBulb", options) : helperMissing.call(depth0, "i18n", "editContext.description.letusTestBulb", options)))
    + "</div>\n\n    <div class=\"description\">\n        <p>";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.description.startTest", options) : helperMissing.call(depth0, "i18n", "editContext.description.startTest", options)))
    + "</p>\n\n        <div class=\"bulbSetupIcon testingTurnOnIcon\"></div>\n\n        <div class=\"sub\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.description.testDoneSub", options) : helperMissing.call(depth0, "i18n", "editContext.description.testDoneSub", options)))
    + "</div>\n        <div class=\"nextBtn greenBtn\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "buttons.Start", options) : helperMissing.call(depth0, "i18n", "buttons.Start", options)))
    + "</div>\n    </div>\n</section>\n";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_dimmer_templates_startTestBulb', t);
return t;
});
/* END_TEMPLATE */
;
/* START_TEMPLATE */
define('hbs!widgets/wemo_dimmer/templates/testingBulb',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<header>\n    <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.bulbSetUp", options) : helperMissing.call(depth0, "i18n", "editContext.title.bulbSetUp", options)))
    + "</span>\n</header>\n\n<section class=\"content\">\n    <div class=\"bulbConfirmHeader\">\n        <div class=\"descriptionTitle\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.description.bulbTurnOn", options) : helperMissing.call(depth0, "i18n", "editContext.description.bulbTurnOn", options)))
    + "</div>\n        <div class=\"testAgain link\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.description.testAgain", options) : helperMissing.call(depth0, "i18n", "editContext.description.testAgain", options)))
    + "</div>\n    </div>\n\n    <div class=\"flashingIcon\"></div>\n    <div class=\"testingText\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.description.testing", options) : helperMissing.call(depth0, "i18n", "editContext.description.testing", options)))
    + "</div>\n\n    <div class=\"bulbConfirmBtn\">\n        <div class=\"needHelpButton defaultBtn\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "buttons.needHelp", options) : helperMissing.call(depth0, "i18n", "buttons.needHelp", options)))
    + "</div>\n        <div class=\"confirmButton greenBtn\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "buttons.Yes", options) : helperMissing.call(depth0, "i18n", "buttons.Yes", options)))
    + "</div>\n    </div>\n</section>\n";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_dimmer_templates_testingBulb', t);
return t;
});
/* END_TEMPLATE */
;
/* START_TEMPLATE */
define('hbs!widgets/wemo_dimmer/templates/configureLEDProblem',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<header>\n    <!--<div class=\"back\">-->\n    <!--<span class=\"backIcon\"></span>-->\n    <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.incompatibleBulb", options) : helperMissing.call(depth0, "i18n", "editContext.title.incompatibleBulb", options)))
    + "</span>\n    <!--</div>-->\n</header>\n\n<section class=\"content\">\n    <div class=\"descriptionTitle\">\n        ";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.calibrationProblem.title", options) : helperMissing.call(depth0, "i18n", "editContext.calibrationProblem.title", options)))
    + "\n    </div>\n    <div class=\"descriptionContent\">\n        <p>";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.calibrationProblem.description1", options) : helperMissing.call(depth0, "i18n", "editContext.calibrationProblem.description1", options)))
    + "</p>\n        <p>";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.calibrationProblem.description2", options) : helperMissing.call(depth0, "i18n", "editContext.calibrationProblem.description2", options)))
    + "</p>\n        <p class=\"learnMoreLink \">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.calibrationProblem.description3", options) : helperMissing.call(depth0, "i18n", "editContext.calibrationProblem.description3", options)))
    + "</p>\n\n\n        <div class=\"problemSub\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.description.testDoneSub", options) : helperMissing.call(depth0, "i18n", "editContext.description.testDoneSub", options)))
    + "</div>\n    </div>\n\n    <div class=\"tryAgainBtn defaultBtn\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "buttons.TryAgain", options) : helperMissing.call(depth0, "i18n", "buttons.TryAgain", options)))
    + "</div>\n    <div class=\"skipBtn greenBtn\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "buttons.FinishSetup", options) : helperMissing.call(depth0, "i18n", "buttons.FinishSetup", options)))
    + "</div>\n\n</section>\n";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_dimmer_templates_configureLEDProblem', t);
return t;
});
/* END_TEMPLATE */
;
/* START_TEMPLATE */
define('hbs!widgets/wemo_dimmer/templates/bulbIntro',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "\n\n<header>\n    <div class=\"back\">\n    <span class=\"backIcon\"></span>\n        <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.multipleBulbTypes.pageTitle", options) : helperMissing.call(depth0, "i18n", "editContext.multipleBulbTypes.pageTitle", options)))
    + "</span>\n    </div>\n</header>\n\n<section class=\"content\">\n    <div class=\"descriptionTitle\">\n        ";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.multipleBulbTypes.title", options) : helperMissing.call(depth0, "i18n", "editContext.multipleBulbTypes.title", options)))
    + "\n    </div>\n    <div class=\"descriptionContent\">\n        <p>";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.multipleBulbTypes.description1", options) : helperMissing.call(depth0, "i18n", "editContext.multipleBulbTypes.description1", options)))
    + "</p>\n        <p>";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.multipleBulbTypes.description2", options) : helperMissing.call(depth0, "i18n", "editContext.multipleBulbTypes.description2", options)))
    + "</p>\n        <p>";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.multipleBulbTypes.description3", options) : helperMissing.call(depth0, "i18n", "editContext.multipleBulbTypes.description3", options)))
    + "</p>\n    </div>\n\n    <div class=\"learnMoreBtn defaultBtn learnMoreLink\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "buttons.LearnMore", options) : helperMissing.call(depth0, "i18n", "buttons.LearnMore", options)))
    + "</div>\n</section>\n";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_dimmer_templates_bulbIntro', t);
return t;
});
/* END_TEMPLATE */
;
//this is the base edit screen. load any additional edit view screens here. make sure to pass the newly created model to the views when instantiating them.
define('widgets/wemo_dimmer/js/configureLEDProblem',['Cache', 'hbs!widgets/wemo_dimmer/templates/configureLEDProblem', 'hbs!widgets/wemo_dimmer/templates/bulbIntro', 'libs/smartDevicePlugin'],
    /** @exports summary view */
        function(Backbone, configureProblemTemplate, bulbIntroTemplate, smartDevicePlugin) {
        'use strict';
        var View = Backbone.OverlayView.extend({
            className: 'dimmerSetupPage noMainHeader',
            events: {
                "click .tryAgainBtn" : "loadDimmerSetupPage",
                "click .skipBtn" : "skipConfiguration",
                "click .back": "goBack",
                "click .learnMoreLink": "learnMore",
            },
            learnMore : function(){
                var url = "http://www.belkin.com/us/support-article?articleNum=208552";
                this.loadExternalUrl(url);
            },
            loadExternalUrl: function(url) {
                navigator.app.loadUrl(url, {
                openExternal: true
              });
            },
            goBack : function() {
                var self = this;
                this.sandbox.uiInterface.dismissSettings.call(self, {
                    cancel: true
                });
            },
            render: function() {
                this.stickit();
                this.delegateEvents();
            },
            afterInitialize: function() {
                if (this.options.pageType === "bulbIntro") {
                    this.template = bulbIntroTemplate;
                } else {
                    this.template = configureProblemTemplate;
                }
            },
            skipConfiguration: function() {
                var self = this;
                var udn = self.model.sandbox.information.udn;
                var info = {
                    udn: udn,
                    bulbType: "CFL"
                };

                smartDevicePlugin.setBulbType(info, function(presetVal) {
                    if (presetVal && presetVal.turnOnLevel) {

                        DEBUG && console.log("Bulb Preset : turnOnLevel" +  presetVal.turnOnLevel + " : maxLevel : " + presetVal.maxLevel + " : minLevel : " +  presetVal.minLevel);
                        //level range 1-255
                        self.model.set("minLevel", presetVal.minLevel);
                        self.model.set("maxLevel", presetVal.maxLevel);
                        self.model.set("turnOnLevel", presetVal.turnOnLevel);
                    }
                    self.model.set("bulbType", "CFL");
                    self.sandbox.uiInterface.hideSpinner();

                    self.goBack();
                    setTimeout(function(){
                        $(".dimmerSetupPage").remove();
                    }, 400);
                });
            },

            loadDimmerSetupPage: function() {
                var self = this;
                this.sandbox.dimmerSetupChooseBulb.initialRender();
                setTimeout(function(){
                    self.goBack();
                }, 200);
            }
        });

        return View;
    });

/* START_TEMPLATE */
define('hbs!widgets/wemo_dimmer/templates/ledCalibration',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<header>\n    <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.ledCalibration", options) : helperMissing.call(depth0, "i18n", "editContext.title.ledCalibration", options)))
    + "</span>\n</header>\n\n<section class=\"content\">\n    <div class=\"descriptionTitle\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.description.powerUpSetting", options) : helperMissing.call(depth0, "i18n", "editContext.description.powerUpSetting", options)))
    + "</div>\n\n    <div class=\"description\">\n        <p>";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.description.powerUpSettingIntro", options) : helperMissing.call(depth0, "i18n", "editContext.description.powerUpSettingIntro", options)))
    + "</p>\n        <div class=\"refreshBtn\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "buttons.ResetDial", options) : helperMissing.call(depth0, "i18n", "buttons.ResetDial", options)))
    + "</div>\n\n        <div class=\"dial\">\n            <div class=\"dialCircle\"></div>\n            <div class=\"controlBtn\">\n                <div class=\"minusBtn\"></div>\n                <div class=\"plusBtn\"></div>\n            </div>\n\n        </div>\n\n        <div class=\"testBtn greenBtn\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "buttons.Save", options) : helperMissing.call(depth0, "i18n", "buttons.Save", options)))
    + "</div>\n    </div>\n</section>";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_dimmer_templates_ledCalibration', t);
return t;
});
/* END_TEMPLATE */
;
/* START_TEMPLATE */
define('hbs!widgets/wemo_dimmer/templates/minLevelCalibration',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<header>\n    <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.ledCalibration", options) : helperMissing.call(depth0, "i18n", "editContext.title.ledCalibration", options)))
    + "</span>\n</header>\n\n<section class=\"content\">\n    <div class=\"descriptionTitle\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.description.powerUpSetting", options) : helperMissing.call(depth0, "i18n", "editContext.description.powerUpSetting", options)))
    + "</div>\n\n    <div class=\"description\">\n        <p>";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.description.powerUpSettingIntro", options) : helperMissing.call(depth0, "i18n", "editContext.description.powerUpSettingIntro", options)))
    + "</p>\n        <div class=\"refreshBtn\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "buttons.ResetDial", options) : helperMissing.call(depth0, "i18n", "buttons.ResetDial", options)))
    + "</div>\n\n        <div class=\"dial\">\n            <div class=\"dialCircleMin updateDimming\"></div>\n            <div class=\"controlBtn\">\n                <div class=\"minusBtn\"></div>\n            </div>\n\n        </div>\n\n        <div class=\"testBtn greenBtn\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "buttons.Save", options) : helperMissing.call(depth0, "i18n", "buttons.Save", options)))
    + "</div>\n    </div>\n</section>";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_dimmer_templates_minLevelCalibration', t);
return t;
});
/* END_TEMPLATE */
;
define('plugins/dial',['jquery'], function($){

    var Plot = function ( stage ) {
        this.setDimensions = function( x, y ) {
            this.elm.style.width = x + 'px';
            this.elm.style.height = y + 'px';
            this.width = x;
            this.height = y;
        };
        this.position = function( x, y ) {
            var xoffset = arguments[2] ? 0 : this.width / 2;
            var yoffset = arguments[2] ? 0 : this.height / 2;
            this.elm.style.left = (x - xoffset) + 'px';
            this.elm.style.top = (y - yoffset) + 'px';
            this.x = x;
            this.y = y;
        };
        this.setBackground = function( col ) {
            this.elm.style.background = col;
        };
        this.kill = function() {
            stage.removeChild( this.elm );
        };
        this.rotate = function( str ) {
            this.elm.style.webkitTransform = this.elm.style.MozTransform =
                this.elm.style.OTransform = this.elm.style.transform =
                    'rotate(' + str + ')';
        };
        this.content = function( content ) {
            this.elm.innerHTML = content;
        };
        this.round = function( round ) {
            this.elm.style.borderRadius = round ? '50%/50%' : '';
        };
        this.hide = function() {
            this.elm.style.display = "none";
        };
        this.elm = document.createElement( 'div' );
        this.elm.style.position = 'absolute';

        stage.appendChild( this.elm );
    };

    return Plot;

});

define('widgets/wemo_dimmer/js/minLevelCalibration',['Cache', 'hbs!widgets/wemo_dimmer/templates/minLevelCalibration', 'plugins/dial', 'libs/smartDevicePlugin'],
    /** @exports summary view */
        function(Backbone, template, Dial, smartDevicePlugin) {
        'use strict';
        var View = Backbone.OverlayView.extend({
            className: 'dimmerSetupPage ledCalibration noMainHeader',
            p : [],
            template: template,

            events: {
                "click .testBtn" : "loadTestingPage",
                "click .minusBtn" : "reduceBrightness",
                "click .refreshBtn" : "refreshBrightness",
                'touchstart .minusBtn': 'quickDecrease',
                'touchend .minusBtn': 'quickDecrease'
            },
            render: function() {
                this.stickit();
                this.delegateEvents();
                this.renderCalibrationDial();
            },
            renderCalibrationDial: function() {
                this.pageType = this.options.pageType;

                var self = this,
                    turnOnVal = this.model.get("turnOnLevel");
                    self.startColor = "#9B9B9B";

                    this.$(".descriptionTitle").html(self.i18n("editContext.description.brightnessFloor"));
                    this.$(".description p").html(self.i18n("editContext.description.findMinBrightness"));
                    this.$(".plusBtn").hide();

                    this.model.set("adjustKey", parseInt(turnOnVal));

                    this.adjustKey = "minLevel";
                    self.start =  Math.floor(parseInt(turnOnVal)/4);
                    self.update = self.start;

                    this.$(".dialCircleMin").html("");
                    self.updateColor = "#4A90E2";
                    this.renderCircle(self.start, self.update, self.startColor, self.updateColor);
                    this.saveDimmingRange();

            },
            renderCircle: function(start, update, startColor, updateColor) {
                var stage = document.querySelector('.dialCircleMin'),
                    plots = 73,
                    increase = Math.PI * 2 / 73,
                    angle = 90,
                    x = 0,
                    y = 0,
                    self = this;

                for( var i = 0; i < plots; i++ ) {
                    self.p[i]= new Dial( stage );
                    self.p[i].setDimensions( 4, 16);
                    x = 100 * Math.cos( angle ) + 100;
                    y = 100 * Math.sin( angle ) + 100;
                    self.p[i].rotate(Math.atan2( y - 100, x - 100 ) * 180 / Math.PI + 90 + 'deg');
                    if ( i > 63) {
                        self.p[i].hide();
                    } else {
                        self.p[i].position( x, y );
                    }

                    if (i < 64 && i > start - 1) {
                        self.p[i].setBackground( startColor);
                    } else if (i < start + 1 && i > update - 1) {
                        self.p[i].setBackground(updateColor);
                    } else {
                        self.p[i].setBackground("#e1e1e1");
                    }

                    angle += increase;
                }

            },
            renderDialColor: function(start, update, startColor, updateColor) {
                var plots = 73,
                    self = this;

                for( var i = 0; i < plots; i++ ) {

                    if (i < 64 && i > start - 1) {
                        self.p[i].setBackground( startColor);
                    } else if (i < start + 1 && i > update - 1) {
                        self.p[i].setBackground(updateColor);
                    } else {
                        self.p[i].setBackground("#e1e1e1");
                    }
                }
            },
            loadTestingPage: function() {
                var dimmingPageLoad = this.options.dimmingPageLoad,
                    self = this;

                    var minLevel = parseInt(this.model.get("minLevel")) + 4;
                    this.model.set("minLevel", minLevel);

                    this.sandbox.startTestBulbPage.options.testType = "testDimming";
                    this.sandbox.startTestBulbPage.options.dimmingPageLoad = dimmingPageLoad;
                    this.sandbox.startTestBulbPage.setPreviousElement($(".ledCalibration"));
                    this.sandbox.startTestBulbPage.initialRender();

                    setTimeout(function(){
                        self.$el.remove();
                    }, 200);
            },
            reduceBrightness: function() {
                var self = this;
                this.adjustVal  = parseInt(this.model.get("adjustKey")) - 4;
                this.adjustVal = (this.adjustVal > 0) ? this.adjustVal : 0;

                this.minVal = Math.floor(self.adjustVal/4) ;

                this.model.set(self.adjustKey, self.adjustVal);
                this.model.set("adjustKey", self.adjustVal);

                DEBUG && console.log(self.adjustKey + " : " +  this.adjustVal + " : on Dial : " + self.minVal);



                this.renderDialColor(self.start, self.minVal , self.startColor, self.updateColor);
                this.saveDimmingRange();
            },
            quickDecrease: function(e) {
                var self = this;
                if (e.type === "touchstart") {
                    clearInterval(self.setDialInterval);
                    self.setDialInterval =  setInterval(function () {
                        self.reduceBrightness();
                    }, 600);
                } else if (e.type === "touchend") {
                    clearInterval(self.setDialInterval);
                }
            },
            refreshBrightness: function() {
                var self = this;
                clearInterval(self.setDialInterval);
                var turnOnLevel = this.model.get("turnOnLevel");
                this.model.set("minLevel", turnOnLevel);
                this.model.set("adjustKey", turnOnLevel);


                this.start =  Math.floor(parseInt(turnOnLevel)/4);

                DEBUG && console.log(self.adjustKey + " : " +  turnOnLevel + " : on Dial : " + this.start);
                this.renderDialColor(self.start, self.start, "#9B9B9B", "#4A90E2");

                this.saveDimmingRange();
            },

            saveDimmingRange: function() {
                this.adjustVal  = parseInt(this.model.get("adjustKey"));
                var udn = this.model.sandbox.information.udn,
                    self = this;

                var deviceInfo = {
                    udn: udn,
                    level: this.adjustVal
                };

                smartDevicePlugin.calibrateBulb(deviceInfo, self.response);
            },
            /**
             * When saveAction is success
             * @param {string} resp
             */
            successSaveAction: function(resp) {
                DEBUG && console.log("SUCCESS saveAction:" + resp);
            },
            /**
             * show response of calibrateBulb
             * @param {string} resp
             */
            response: function(resp) {
                DEBUG && console.log("response calibrateBulb:" + resp);
            },
            /**
             * hide spinner if any, and return to prior model state - saved in added/updated
             */
            failSave: function() {
                this.model.undo();
            }
        });

        return View;
    });
define('widgets/wemo_dimmer/js/ledCalibration',['Cache', 'hbs!widgets/wemo_dimmer/templates/ledCalibration','widgets/wemo_dimmer/js/minLevelCalibration', 'plugins/dial', 'libs/smartDevicePlugin'],
    /** @exports summary view */
        function(Backbone, template, MinLevelCalibration, Dial, smartDevicePlugin) {
        'use strict';

        var View = Backbone.OverlayView.extend({
            className: 'dimmerSetupPage ledCalibration noMainHeader',
            p : [],
            calibriateLoaded: false,
            template: template,

            events: {
                "click .back" : "goBack",
                "click .testBtn" : "loadTestingPage",
                "click .plusBtn" : "increaseBrightness",
                "click .minusBtn" : "reduceBrightness",
                "click .refreshBtn" : "refreshBrightness",
                'touchstart .plusBtn': 'quickIncrease',
                'touchend .plusBtn': 'quickIncrease',
                'touchstart .minusBtn': 'quickDecrease',
                'touchend .minusBtn': 'quickDecrease'
            },
            goBack : function() {
                var self = this;
                this.sandbox.uiInterface.dismissSettings.call(self, {
                    cancel: true
                });
            },
            render: function() {
                this.stickit();
                this.delegateEvents();
                this.renderCalibrationDial();
            },
            renderCalibrationDial: function() {
                this.pageType = this.options.pageType;

                var self = this,
                    turnOnVal = this.model.get("turnOnLevel");
                    self.startColor = "#9B9B9B";
                if (this.pageType === "powerUpSetting") {
                    this.adjustKey = "turnOnLevel";
                    this.model.set("adjustKey", 0);
                    this.$(".minusBtn").hide();
                    this.$(".dialCircle").html("");

                    this.start = 0;
                    self.updateColor = "#73d44c";

                    DEBUG && console.log("turnOnVal : " + turnOnVal);
                    this.renderCircle(self.start, 0, self.startColor, self.updateColor);

                } else if (this.pageType === "maxValSetting") {
                    this.$(".descriptionTitle").html(self.i18n("editContext.description.brightnessCeiling"));
                    this.$(".description p").html(self.i18n("editContext.description.findMaxBrightness"));
                    this.$(".refreshBtn").hide();

                    this.adjustKey = "maxLevel";
                    this.model.set("adjustKey", turnOnVal);
                    this.$(".dialCircle").addClass("updateDimming");
                    this.$(".dialCircle").html("");
                    self.start = Math.ceil(turnOnVal/4);
                    self.updateColor = "#F5A623";

                    DEBUG && console.log("maxLevel : " + turnOnVal + " : maxLevel on Dial : " + self.start);

                    this.renderCircle(self.start, self.start-1, self.startColor, self.updateColor);
                }

                this.saveDimmingRange();
            },
            renderDialColor: function(start, update, startColor, updateColor) {
                var plots = 73,
                    self = this;

                for( var i = 0; i < plots; i++ ) {

                    if (i < start) {
                        self.p[i].setBackground( startColor);
                    } else if (i > start - 1 && i < update) {
                        self.p[i].setBackground(updateColor);
                    } else {
                        self.p[i].setBackground("#e1e1e1");
                    }
                }
            },
            renderCircle: function(start, update, startColor, updateColor) {
                var stage = document.querySelector('.dialCircle'),
                    plots = 73,
                    increase = Math.PI * 2 / 73,
                    angle = 90,
                    x = 0,
                    y = 0,
                    self = this;

                for( var i = 0; i < plots; i++ ) {
                    self.p[i] = new Dial( stage );
                    }