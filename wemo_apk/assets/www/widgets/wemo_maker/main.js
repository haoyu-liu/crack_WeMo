(function () {
define('text!widgets/wemo_maker/css/main.css',[],function () { return '\n.wemo_maker .smart-tile .icon, .wemo_maker .defaultIcon {\n    background-image: url(data:image/png;base64,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);\n}\n.wemo_maker header .tile2 .description .status {\n    display: block;\n    font-size: 1.4em;\n}\n.wemo_maker .smart-tile .description .mode-1,\n.wemo_maker .smart-tile .description .mode-2 {\n    color: #73D44C;\n}\n.wemo_maker .smart-tile .powerState {\n    background-size: 100%;\n}\n.wemo_maker header .tile2 span.mode {\n    float: left;\n    padding-top: 0;\n}\n.wemo_maker .switchType_container,\n.wemo_maker .sensor_container {\n    padding: 0 2.2em;\n    width: 100%;\n    height: 6.4em;\n    border-bottom: 1px solid #cfcfcf;\n    background-color: #ffffff;\n    line-height: 6.4em;\n}\n.wemo_maker .title {\n    font-size: 2em;\n}\n.wemo_maker .switchType_container .fa,\n.wemo_maker .sensor_container .fa {\n    float: right;\n    margin-top: 0.65em;\n    color: #dddddd;\n    font-size: 22px;\n}\n.wemo_maker .switchType_container .value,\n.wemo_maker .sensor_container .value {\n    float: right;\n    margin-right: 1em;\n    font-size: 2em;\n}\n.wemo_maker .non-display {\n    display: none;\n}\n.wemo_maker .toggle_value,\n.wemo_maker .momentary_value,\n.wemo_maker .yes_option,\n.wemo_maker .no_option {\n    width: 100%;\n    height: 6.4em;\n    border-bottom: 1px solid #cfcfcf;\n    line-height: 6.4em;\n}\n.wemo_maker .toggle_value div,\n.wemo_maker .momentary_value div,\n.wemo_maker .yes_option div,\n.wemo_maker .no_option div {\n    padding-left: 4.4em;\n    width: 100%;\n    border-bottom: 1px solid #cfcfcf;\n    border-left: 1px solid #cfcfcf;\n    background-color: #e7f7dc;\n}\n.wemo_maker .switchType_values .selected,\n.wemo_maker .sensorOption_values .selected {\n    background-color: #73d44c;\n    color: #ffffff;\n}\n';});

define('widgets/wemo_maker/js/model',['Cache'],
    /** @exports model class and instantiated model */
    function(Backbone) {

        'use strict';

        var mockPath = 'widgets/wemo_maker/mocks/';

        var Model = Backbone.WemoDeviceModel.extend({
            /**
             * default data values
             */
            defaults: {
                'switch': 0,
                'sensor': 0,
                'switchMode': 0,
                'sensorPresent': 0,
                'appState': 0,
                'statusTS': 1418908500,
                'lastTSReceived': 1418908500,
                'defaultFriendlyName': '',
                "defaultIcon": "file:///android_asset/www/img/new_icons/WeMo_Maker_@3x.png"
            },
            /**
             * validate fields for do save
             */
            editArray: ['switchMode', 'sensorPresent'],
            /**
             * validation fields, uses Backbone.validation
             */
            validation: {
                'switch': {
                    required: true
                },
                'switchMode': {
                    required: true
                },
                'sensorPresent': {
                    required: true
                },
                'Sensor': {
                    required: true
                }
            },
            /** Executes the setAttribute native command**/
            saveAction: function(variable) {

                return this.save(variable);
            },
            /**
             * parses the response when remote call is made, for instances like when remote returns switch, but it is actually equivalent to Switch
             * @param resp {JSON}
             * @returns {JSON}
             */
            mapToLocal: function(resp) {

                if (resp.switch) {
                    resp.Switch = resp.switch;
                    resp.SwitchMode = resp.switchMode;
                    resp.Sensor = resp.sensor;
                }
                return resp;
            },
            /**
             * set the native get command
             */
            getCommand: 'GetAttributes',
            /**
             *   set the native command
             */
            setCommand: 'SetAttributes',
            /**
             * urls allow dummy data to be loaded for demo/test
             * @returns {string}
             */
            url: function() {
                return mockPath + 'device.json';
            }
        });

        return {
            Model: Model,
            model: new Model() //we need to pass a shared model, but we want the base object available for unit testing
        };
    });
/* START_TEMPLATE */
define('hbs!widgets/wemo_maker/templates/tile',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  


  return "<header class=\"row-tile\">\n    <div class=\"tile1\">\n        <div class=\"gradient\"></div>\n        <span class=\"icon\" data-bind=\"iconURL\"></span>\n    </div>\n    <div class=\"tile2 description\">\n        <h1 data-bind=\"friendlyName\"></h1>\n        <span class=\"status\" data-bind=\"mode\"></span>\n    </div>\n    <div class=\"tile3 power\"></div>\n</header>\n";
  });
Handlebars.registerPartial('widgets_wemo_maker_templates_tile', t);
return t;
});
/* END_TEMPLATE */
;
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

define('widgets/wemo_maker/js/tile',['backbone', 'hbs!widgets/wemo_maker/templates/tile', 'extensions/ui/powerButton'],
    /** @exports tile view */
    function(Backbone, template, PowerButton) {

        'use strict';

        //will store the settings for when we start cycling the power button.

        var View = Backbone.TileBaseView.extend({
            template: template,
            isBeingSaved: false,

            /**
             * adds event binding to elements, clicks are converted to pointerup events
             */
            events: {
                'click .powerState': 'setState'
            },
            /**
             * two-way data binding to models, uses Backbone.stickit
             */
            bindings: {
                '*[data-bind="friendlyName"]': {
                    observe: 'friendlyName',
                    updateMethod: 'html'
                },
                '*[data-bind="mode"]': {
                    observe: ['sensor', 'switchMode', 'sensorPresent'],
                    onGet: function(values) {
                        var SensorPresentMsg;
                        for (var i = 0; i < values.length; i++) {
                            values[i] = parseInt(values[i], 10);
                        }
                        if (values[2] === 1) {
                            SensorPresentMsg = (values[0] === 1) ? this.i18n('state', '2') : this.i18n('state', '3');
                        } else {
                            SensorPresentMsg = (values[1] === 0) ? this.i18n('state', '0') : this.i18n('state', '1');
                        }
                        return SensorPresentMsg;
                    }
                }
            },
            /**
             * Binds DOM events
             */
            render: function() {
                this.delegateEvents();
                this.renderPowerButton();
                this.changeButtonUI();
            },
            renderPowerButton: function(){
                this.powerButton = new PowerButton({
                    $el: this.$('.power'),
                    onTap: this.setState.bind(this)
                });
                this.powerButton.render();
            },
            /**
             * Called when there is a change on the maker switch state
             */
            setState: function() {
                var state = parseInt(this.model.get('switch'), 10),
                    switchMode = parseInt(this.model.get('switchMode'), 10),
                    newState,
                    self = this;
                if (!this.isBeingSaved) {
                    this.powerButton.setState(PowerButton.MODE.MODE_SEARCHING);
                    if (switchMode === 0) {
                        if (state === 0) {
                            newState = 1;
                        } else {
                            newState = 0;
                        }
                    } else if (switchMode === 1) {
                        newState = 1;
                    }
                    this.isBeingSaved = true;

                    this.model.set('switch', newState);
                    this.model.saveAction(['switch']).done(self.successSaveAction).fail(self.failSave);

                }
            },
            /**
             * Logic to change tue UI of the power button
             */
            changeButtonUI: function() {
                var onOff = parseInt(this.model.get('switch'), 10),
                    switchMode = parseInt(this.model.get('switchMode'), 10),
                    self = this;

                if (!this.isBeingSaved) {
                    switch(onOff){
                        case 0:
                            this.powerButton.setState(PowerButton.MODE.MODE_OFF);
                            break;
                        case 1:
                            this.powerButton.setState(PowerButton.MODE.MODE_ON);
                            if (switchMode === 1) {
                                setTimeout(function() {
                                    self.model.set('switch', 0);
                                }, 1200);
                            }
                            break;
                        default:
                            this.powerButton.setState(PowerButton.MODE.MODE_OFF);
                            break;
                    }
                }
            },
            /**
             * put non-DOM event listeners here. These need to be removed when no longer necessary to free up memory (this.stopListening())
             */
            listen: function() {
                this.listenTo(this.model, 'change:switch', this.changeButtonUI);
            },
            /**
             * Logic to set up the button to show/hide drawer cross-platform
             */
            afterInitialize: function() {

            },
            /**
             * When saveAction is success
             */
            successSaveAction: function(resp) {
                DEBUG && console.log("SUCCESS saveAction:" + resp);
            },
            /**
             * Function that hide loading spinner after save action
             */
            afterSave: function() {
                this.isBeingSaved = false;
                this.changeButtonUI();
            }
        });

        return View;
    });

/* START_TEMPLATE */
define('hbs!widgets/wemo_maker/templates/edit',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<ul>\n    <li class=\"switchType_container\">\n        <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.switchType", options) : helperMissing.call(depth0, "i18n", "editContext.title.switchType", options)))
    + "</span>\n        <i class=\"fa fa-angle-right\"></i>\n        <span class=\"value\" data-bind=\"switchValue\"></span>\n    </li>\n</ul>\n<ul class=\"switchType_values non-display\">\n    <li class=\"switchValue toggle_value\" data-value=\"toggle\">\n        <div>\n            <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.toggle", options) : helperMissing.call(depth0, "i18n", "editContext.title.toggle", options)))
    + "</span>\n        </div>\n    </li>\n    <li class=\"switchValue momentary_value\" data-value=\"momentary\">\n        <div>\n            <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.momentary", options) : helperMissing.call(depth0, "i18n", "editContext.title.momentary", options)))
    + "</span>\n        </div>\n    </li>\n</ul>\n<ul>\n    <li class=\"sensor_container\">\n        <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.sensor", options) : helperMissing.call(depth0, "i18n", "editContext.title.sensor", options)))
    + "</span>\n        <i class=\"fa fa-angle-right\"></i>\n        <span class=\"value\" data-bind=\"sensorValue\"></span>\n    </li>\n</ul>\n<ul class=\"sensorOption_values non-display\">\n    <li class=\"sensorValue yes_option\" data-value=\"yes\">\n        <div>\n            <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.yes", options) : helperMissing.call(depth0, "i18n", "editContext.title.yes", options)))
    + "</span>\n        </div>\n    </li>\n    <li class=\"sensorValue no_option\" data-value=\"no\">\n        <div>\n            <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.no", options) : helperMissing.call(depth0, "i18n", "editContext.title.no", options)))
    + "</span>\n        </div>\n    </li>\n</ul>";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_maker_templates_edit', t);
return t;
});
/* END_TEMPLATE */
;
//this is the base edit screen. load any additional edit view screens here. make sure to pass the newly created model to the views when instantiating them. 
define('widgets/wemo_maker/js/edit',['Cache', 'hbs!widgets/wemo_maker/templates/edit','widgets/wemo_maker/js/model'],
    /** @exports summary view */
        function(Backbone, template, Model) {

        'use strict';

        var View = Backbone.View.extend({
            template: template,

            events: {
                'click .switchType_container': 'showSwitchTypes',
                'click .sensor_container': 'showSensorOption',
                'click .switchValue': 'changeSwitchValue',
                'click .sensorValue': 'changeSensorOption'
            },
            initialize: function(options) {
                options = options || {};
                _.extend(this, options);
                if (!this.sandbox) {
                    throw ('you must pass the sandbox to this view.')
                } else {
                    this.model = new Model.Model();
                    this.model.set(this.sandbox.model.toJSON());
                    this.model.baseObject = this.sandbox.model.baseObject;
                }
            },
            /**
             * two-way data binding
             */
            bindings: {
                '*[data-bind="switchValue"]': {
                    observe: 'switchMode',
                    updateMethod: 'html',
                    onGet: function(value) {
                        var aux = parseInt(value, 10);
                        this.updateSwitchValueUI(aux);
                        if (aux === 0) {
                            return this.i18n('editContext.title', 'toggle');
                        } else {
                            return this.i18n('editContext.title', 'momentary');
                        }
                    }
                },
                '*[data-bind="sensorValue"]': {
                    observe: 'sensorPresent',
                    updateMethod: 'html',
                    onGet: function(value) {
                        var aux = parseInt(value, 10);
                        this.updateSensorOptionUI(aux);
                        if (aux === 0) {
                            return this.i18n('editContext.title', 'no');
                        } else {
                            return this.i18n('editContext.title', 'yes');
                        }
                    }
                }
            },
            /**
             * localizes the template, and inserts it into the document fragment. Also binds the DOM events
             */
            render: function() {
                var html = this.i18n(this.template);
                this.$el.html(html);
                this.stickit();
                this.delegateEvents();
            },
            /**
             * put non-DOM event listeners here. These need to be removed when no longer necessary to free up memory (this.stopListening())
             */
            listen: function() {

            },
            /**
             * show or hide switch values options
             */
            showSwitchTypes: function() {
                this.$('.switchType_values').toggle('non-display');
            },
            /**
             * show or hide sensor values options
             */
            showSensorOption: function() {
                this.$('.sensorOption_values').toggle('non-display');
            },
            /**
             * update switch value UI
             */
            updateSwitchValueUI: function(value) {
                if (value === 0) {
                    this.$('.toggle_value div').addClass('selected');
                    this.$('.momentary_value div').removeClass('selected');
                } else {
                    this.$('.momentary_value div').addClass('selected');
                    this.$('.toggle_value div').removeClass('selected');
                }
            },
            /**
             * update sensor value UI
             */
            updateSensorOptionUI: function(value) {
                if (value === 0) {
                    this.$('.no_option div').addClass('selected');
                    this.$('.yes_option div').removeClass('selected');
                } else {
                    this.$('.yes_option div').addClass('selected');
                    this.$('.no_option div').removeClass('selected');
                }
            },
            /**
             * add new value to switch attribute
             * @param newValue
             */
            setSwitch: function(newValue) {
                this.model.set('switchMode', newValue);
                this.model.set('switch', 0);
                this.saveAction('switchMode');
            },
            /**
             * change switch value
             */
            changeSwitchValue: function(e) {
                var option = this.$(e.currentTarget).attr('data-value'),
                    switchMode = parseInt(this.model.get('switchMode'), 10);

                if (option === "toggle") {
                    if (switchMode !== 0) {
                        this.setSwitch(0);
                    }
                } else {
                    if (switchMode !== 1) {
                        this.setSwitch(1);
                    }
                }

                this.showSwitchTypes();
            },
            /**
             * add new value to sensor attribute
             * @param newValue
             */
            setSensor: function(newValue) {
                this.model.set('sensorPresent', newValue);
                this.saveAction('sensorPresent');
            },
            /**
             * change sensor value
             */
            changeSensorOption: function(e) {
                var option = this.$(e.currentTarget).attr('data-value'),
                    sensorPresent = parseInt(this.model.get('sensorPresent'), 10);

                if (option === "no") {
                    if (sensorPresent !== 0) {
                        this.setSensor(0);
                    }
                } else {
                    if (sensorPresent !== 1) {
                        this.setSensor(1);
                    }
                }
                this.showSensorOption();
            },
            /**
             * send attributes changed to native code
             * @param variable
             */
            saveAction: function(variable) {
                var self = this;

                clearTimeout(this.saveTime);
                this.saveTime = setTimeout(function() {
                    self.model.save([variable]).done(self.successSaveAction).fail(self.failSaveAction);
                    clearTimeout(self.saveTime);
                }, 100);
            },
            /**
             * When saveAction is success
             */
            successSaveAction: function(resp) {
                DEBUG && console.log(resp);
            },
            /**
             * When saveAction fails
             */
            failSaveAction: function(resp) {
                DEBUG && console.log(resp);
            },
            afterSave: function() {

            }
        });

        return View;
    });
define('widgets/wemo_maker/main', ['text!widgets/wemo_maker/css/main.css','widgets/wemo_maker/js/model','widgets/wemo_maker/js/tile','widgets/wemo_maker/js/edit'],

    function(css, data, TileView, EditView) {

        'use strict';

        return {
            type: 'TileAndDrawer',
            styles: css,
            Tile: TileView,
            Model: data.Model,
            config: {
                edit: {
                    View: EditView
                }
            }
        };
    });
}());