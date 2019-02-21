(function () {
define('text!widgets/wemo_lightswitch/css/main.css',[],function () { return '\n.wemo_lightswitch .smart-tile .icon, .wemo_lightswitch .defaultIcon {\n    background-image: url(data:image/png;base64,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);\n}\n.wemo_lightswitch .smart-tile .powerState {\n    background-size: 100%;\n}\n';});

define('widgets/wemo_lightswitch/js/model',['Cache'],
    /**
     * @exports model class and instantiated model
     */
    function(Backbone) {
        'use strict';

        var mockPath = 'widgets/wemo_lightswitch/mocks/';

        var Model = Backbone.WemoDeviceModel.extend({
            /**
             * default data values
             */
            defaults: {
                'binaryState': 0,
                'countDownLabel': '',
                'ruleAutoOffTime': 0,
                'defaultFriendlyName': '',
                "defaultIcon": "file:///android_asset/www/img/new_icons/WeMo_LightSwitch_@3x.png"
            },
            /**
             * Validation fields, uses Backbone.validation
             */
            validation: {
                'binaryState': {
                    required: true
                },
                'ruleAutoOffTime': {
                    required: true
                }
            },
            /**
             * Runs once when the model is instantiated
             */
            initialize: function() {

            },
            /**
             * Executes the setAttribute native command
             * @param {string} variable
             * @returns {object}
             */
            saveAction: function(variable) {
                return this.save(variable);
            },
            /**
             * Set the native set command
             */
            setCommand: 'SetBinaryState',
            /**
             *  Set the native get command
             */
            getCommand: 'GetBinaryState',
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
            model: new Model()  //we need to pass a shared model, but we want the base object available for unit testing
        };
    });
/* START_TEMPLATE */
define('hbs!widgets/wemo_lightswitch/templates/tile',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  


  return "<header class=\"row-tile\">\n    <div class=\"tile1\">\n        <div class=\"gradient\"></div>\n        <span class=\"icon\" data-bind=\"iconURL\"></span>\n    </div>\n    <div class=\"tile2 description\">\n        <h1 data-bind=\"friendlyName\"></h1>\n        <span class=\"countDownTimerRule status\" data-bind=\"countDown\"></span>\n    </div>\n    <div class=\"tile3 power\"></div>\n</header>\n";
  });
Handlebars.registerPartial('widgets_wemo_lightswitch_templates_tile', t);
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

define('widgets/wemo_lightswitch/js/tile',['backbone', 'hbs!widgets/wemo_lightswitch/templates/tile', 'mixins/tile.countdownTimer', 'extensions/ui/powerButton'],
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
            },
            /**
             * two-way data binding to models, uses Backbone.stickit
             */
            bindings: {
                '*[data-bind="friendlyName"]': {
                    observe: 'friendlyName',
                    updateMethod: 'html'
                },
                '*[data-bind="countDown"]': {
                    observe: 'countDownLabel',
                    onGet: function(val) {
                        return val;
                    }
                }
            },
            /**
             * put non-DOM event listeners here. These need to be removed when no longer necessary to free up memory (this.stopListening())
             */
            listen: function() {
                this.listenTo(this.model, 'change:binaryState', this.changeModeButton);
                this.listenTo(this.model, 'change:binaryState', this.updateAria);
                this.listenTo(this.model, 'change:friendlyName', this.updateAria);
                this.listenTo(this.model, 'change:ruleAutoOffTime', countdownTimer.updateCountDown);
            },
            /**
             * Binds DOM events
             */
            render: function() {
                this.delegateEvents();
                this.renderPowerButton();
                this.changeModeButton();
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
             * change state value and send it to the device
             */
            setState: function() {
                var state = parseInt(this.model.get('binaryState'), 10),
                    newState;

                if (!this.isBeingSaved) {
                    this.powerButton.setState(PowerButton.MODE.MODE_SEARCHING);

                    if (state === 0) {
                        newState = 1;
                    } else {
                        newState = 0;
                    }
                    this.isBeingSaved = true;
                    this.model.set('binaryState', newState);
                    this.model.saveToCache();
                    this.model.saveAction(['binaryState']).done(this.successSaveAction).fail(this.failSave);
                }
            },
            updateAria:function(){
                var mode = parseInt(this.model.get('binaryState'), 10),
                    friendlyName = this.model.get('friendlyName'),
                    productName = this.model.get('defaultFriendlyName');

                this.$('.tile1').attr('aria-label', productName);
                this.$('.tile2').attr('aria-label', friendlyName);
                this.$('.powerState').attr('aria-label', friendlyName + " power is " + (mode === 0 ? "off": "on"));
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
            }
        });

        return View;
    });

define('widgets/wemo_lightswitch/main', ['text!widgets/wemo_lightswitch/css/main.css','widgets/wemo_lightswitch/js/model','widgets/wemo_lightswitch/js/tile'],

    function (css, data, TileView) {

        'use strict';

        return {
            type:'TileAndDrawer',
            styles: css,
            Tile: TileView,
            Model: data.Model
        };
    });
}());