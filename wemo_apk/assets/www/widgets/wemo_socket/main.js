(function () {
define('text!widgets/wemo_socket/css/main.css',[],function () { return '\n.wemo_socket .smart-tile .icon, .wemo_socket .defaultIcon {\n    background-image: url(data:image/png;base64,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);\n}\n.wemo_socket .smart-tile .powerState {\n    background-size: 100%;\n}\n';});

define('widgets/wemo_socket/js/model',['Cache'],
    /**
     * @exports model class and instantiated model
     */
    function(Backbone) {

        'use strict';

        var mockPath = 'widgets/wemo_socket/mocks/';

        var Model = Backbone.WemoDeviceModel.extend({
            /**
             * default data values
             */
            defaults: {
                'binaryState': 0,
                'countDownLabel': '',
                'ruleAutoOffTime': 0,
                'defaultFriendlyName': '',
                "defaultIcon": "file:///android_asset/www/img/new_icons/WeMo_Switch_Old_@3x.png"
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
            model: new Model() //we need to pass a shared model, but we want the base object available for unit testing
        };
    });
/* START_TEMPLATE */
define('hbs!widgets/wemo_socket/templates/tile',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  


  return "<header class=\"row-tile\">\n    <div class=\"tile1\">\n        <div class=\"gradient\"></div>\n        <span class=\"icon\" data-bind=\"iconURL\"></span>\n    </div>\n    <div class=\"tile2 description\">\n        <h1 data-bind=\"friendlyName\"></h1>\n        <span class=\"countDownTimerRule status\" data-bind=\"countDown\"></span>\n    </div>\n    <div class=\"tile3 power\"></div>\n</header>\n\n";
  });
Handlebars.registerPartial('widgets_wemo_socket_templates_tile', t);
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

define('widgets/wemo_socket/js/tile',['backbone', 'hbs!widgets/wemo_socket/templates/tile', 'mixins/tile.countdownTimer', 'extensions/ui/powerButton'],
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
                this.listenTo(this.model, 'change:friendlyName', this.updateAria);
                this.listenTo(this.model, 'change:binaryState', this.updateAria);
                this.listenTo(this.model, 'change:binaryState', this.changeModeButton);
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
                this.$('.powerState').attr('aria-label', friendlyName + " power is " + (mode === 0 ? "off": "on"));
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

define('widgets/wemo_socket/main', ['text!widgets/wemo_socket/css/main.css','widgets/wemo_socket/js/model','widgets/wemo_socket/js/tile'],

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