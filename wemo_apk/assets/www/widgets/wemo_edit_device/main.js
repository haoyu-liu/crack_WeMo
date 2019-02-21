(function () {
/* START_TEMPLATE */
define('hbs!widgets/wemo_edit_device/templates/main',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, stack2, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<header>\n    <span>";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "wemo_edit_device:headers.editDevice", options) : helperMissing.call(depth0, "i18n", "wemo_edit_device:headers.editDevice", options)))
    + "</span>\n</header>\n<section class=\"content\">\n    <ul class=\"form\">\n        <li class=\"icon_container\">\n            <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "wemo_edit_device:headers.picture", options) : helperMissing.call(depth0, "i18n", "wemo_edit_device:headers.picture", options)))
    + "</span>\n            <div class=\"icon\" data-bind=\"icon\"></div>\n        </li>\n        <li class=\"name_container\">\n            <input type=\"text\" name=\"friendlyName\" id=\"editFriendlyName\" value=\"\" data-bind=\"friendlyName\" placeholder=\"";
  options = {hash:{}};
  stack2 = ((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "wemo_edit_device:headers.enterName", options) : helperMissing.call(depth0, "i18n", "wemo_edit_device:headers.enterName", options));
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\"/>\n        </li>\n        <li class=\"ID_container\">\n            <span class=\"ID_label\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "wemo_edit_device:headers.ID", options) : helperMissing.call(depth0, "i18n", "wemo_edit_device:headers.ID", options)))
    + "<span class=\"ssid\"></span></span>\n        </li>\n    </ul>\n    <ul>\n        <li class=\"reset_container\">\n            <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "wemo_edit_device:headers.reset", options) : helperMissing.call(depth0, "i18n", "wemo_edit_device:headers.reset", options)))
    + "</span>\n            <i class=\"fa fa-angle-right\"></i>\n        </li>\n    </ul>\n</section>\n<footer>\n    <div href=\"#\" class=\"done-btn button-footer validation-btn\">\n        <div class=\"value\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "wemo_edit_device:buttons.save", options) : helperMissing.call(depth0, "i18n", "wemo_edit_device:buttons.save", options)))
    + "</div>\n    </div>\n    <div href=\"#\" class=\"cancel-btn button-footer validation-btn\">\n        <div class=\"value\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "wemo_edit_device:buttons.cancel", options) : helperMissing.call(depth0, "i18n", "wemo_edit_device:buttons.cancel", options)))
    + "</div>\n    </div>\n</footer>\n";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_edit_device_templates_main', t);
return t;
});
/* END_TEMPLATE */
;
define('widgets/wemo_edit_device/js/model',['Cache'],
    /** @exports model class and instantiated model */
    function(Backbone) {

        'use strict';

        var Model = Backbone.WemoDeviceModel.extend({
            /**
             * default data values
             */
            defaults: {
                'friendlyName': '',
                'icon': '',
                'pluginID': '',
                'iconVersion': ''
            },
            validation: function() {
                var self = this;
                return {
                    friendlyName: [{
                        required: true,
                        msg: function() {
                            return self.i18n('wemo_edit_device:validation.friendlyNameRequired');
                        }
                    }, {
                        maxLength: 30,
                        msg: function() {
                            return self.i18n('wemo_edit_device:validation.friendlyNameMaxLength');
                        }
                    }, {
                        fn: function(value) {
                            if (self.sandbox.isJardenDevice) {
                                value = value.replace('®', '').replace('ᴹᴰ', '');
                            }

                            var re = /[^\w.\s-]/gi,
                                result = value.match(re);
                            if (result !== null) {
                                return self.i18n('wemo_edit_device:validation.friendlyNameValidation');
                            }
                        }
                    }]
                }
            },
            /**
             * runs once when the model is instantiated
             */
            initialize: function(attributes, options) {
                var options = options || {};
                if (options.sandbox) {
                    this.sandbox = options.sandbox;
                }
            }
        });

        return {
            Model: Model,
            model: new Model() //we need to pass a shared model, but we want the base object available for unit testing
        };
    });
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

Backbone.Validation = (function(_) {
    'use strict';

    // Default options
    // ---------------

    var defaultOptions = {
        forceUpdate: false,
        selector: 'name',
        labelFormatter: 'sentenceCase',
        valid: Function.prototype,
        invalid: Function.prototype
    };


    // Helper functions
    // ----------------

    // Formatting functions used for formatting error messages
    var formatFunctions = {
        // Uses the configured label formatter to format the attribute name
        // to make it more readable for the user
        formatLabel: function(attrName, model) {
            return defaultLabelFormatters[defaultOptions.labelFormatter](attrName, model);
        },

        // Replaces nummeric placeholders like {0} in a string with arguments
        // passed to the function
        format: function() {
            var args = Array.prototype.slice.call(arguments),
                text = args.shift();
            return text.replace(/\{(\d+)\}/g, function(match, number) {
                return typeof args[number] !== 'undefined' ? args[number] : match;
            });
        }
    };

    // Flattens an object
    // eg:
    //
    //     var o = {
    //       address: {
    //         street: 'Street',
    //         zip: 1234
    //       }
    //     };
    //
    // becomes:
    //
    //     var o = {
    //       'address.street': 'Street',
    //       'address.zip': 1234
    //     };
    var flatten = function(obj, into, prefix) {
        into = into || {};
        prefix = prefix || '';

        _.each(obj, function(val, key) {
            if (obj.hasOwnProperty(key)) {
                if (val && typeof val === 'object' && !(
                    val instanceof Array ||
                    val instanceof Date ||
                    val instanceof RegExp ||
                    val instanceof Backbone.Model ||
                    val instanceof Backbone.Collection)) {
                    flatten(val, into, prefix + key + '.');
                } else {
                    into[prefix + key] = val;
                }
            }
        });

        return into;
    };

    // Validation
    // ----------

    var Validation = (function() {

        // Returns an object with undefined properties for all
        // attributes on the model that has defined one or more
        // validation rules.
        var getValidatedAttrs = function(model) {
            return _.reduce(_.keys(_.result(model, 'validation') || {}), function(memo, key) {
                memo[key] = void 0;
                return memo;
            }, {});
        };

        // Looks on the model for validations for a specified
        // attribute. Returns an array of any validators defined,
        // or an empty array if none is defined.
        var getValidators = function(model, attr) {
            var attrValidationSet = model.validation ? _.result(model, 'validation')[attr] || {} : {};

            // If the validator is a function or a string, wrap it in a function validator
            if (_.isFunction(attrValidationSet) || _.isString(attrValidationSet)) {
                attrValidationSet = {
                    fn: attrValidationSet
                };
            }

            // Stick the validator object into an array
            if (!_.isArray(attrValidationSet)) {
                attrValidationSet = [attrValidationSet];
            }

            // Reduces the array of validators into a new array with objects
            // with a validation method to call, the value to validate against
            // and the specified error message, if any
            return _.reduce(attrValidationSet, function(memo, attrValidation) {
                _.each(_.without(_.keys(attrValidation), 'msg'), function(validator) {
                    memo.push({
                        fn: defaultValidators[validator],
                        val: attrValidation[validator],
                        msg: attrValidation.msg
                    });
                });
                return memo;
            }, []);
        };

        // Validates an attribute against all validators defined
        // for that attribute. If one or more errors are found,
        // the first error message is returned.
        // If the attribute is valid, an empty string is returned.
        var validateAttr = function(model, attr, value, computed) {
            // Reduces the array of validators to an error message by
            // applying all the validators and returning the first error
            // message, if any.
            return _.reduce(getValidators(model, attr), function(memo, validator) {
                // Pass the format functions plus the default
                // validators as the context to the validator
                var ctx = _.extend({}, formatFunctions, defaultValidators),
                    result = validator.fn.call(ctx, value, attr, validator.val, model, computed);

                if (result === false || memo === false) {
                    return false;
                }
                if (result && !memo) {
                    return _.result(validator, 'msg') || result;
                }
                return memo;
            }, '');
        };

        // Loops through the model's attributes and validates them all.
        // Returns and object containing names of invalid attributes
        // as well as error messages.
        var validateModel = function(model, attrs) {
            var error,
                invalidAttrs = {},
                isValid = true,
                computed = _.clone(attrs),
                flattened = flatten(attrs);

            _.each(flattened, function(val, attr) {
                error = validateAttr(model, attr, val, computed);
                if (error) {
                    invalidAttrs[attr] = error;
                    isValid = false;
                }
            });

            return {
                invalidAttrs: invalidAttrs,
                isValid: isValid
            };
        };

        // Contains the methods that are mixed in on the model when binding
        var mixin = function(view, options) {
            return {

                // Check whether or not a value, or a hash of values
                // passes validation without updating the model
                preValidate: function(attr, value) {
                    var self = this,
                        result = {},
                        error;

                    if (_.isObject(attr)) {
                        _.each(attr, function(value, key) {
                            error = self.preValidate(key, value);
                            if (error) {
                                result[key] = error;
                            }
                        });

                        return _.isEmpty(result) ? undefined : result;
                    } else {
                        return validateAttr(this, attr, value, _.extend({}, this.attributes));
                    }
                },

                // Check to see if an attribute, an array of attributes or the
                // entire model is valid. Passing true will force a validation
                // of the model.
                isValid: function(option) {
                    var flattened = flatten(this.attributes);

                    if (_.isString(option)) {
                        return !validateAttr(this, option, flattened[option], _.extend({}, this.attributes));
                    }
                    if (_.isArray(option)) {
                        return _.reduce(option, function(memo, attr) {
                            return memo && !validateAttr(this, attr, flattened[attr], _.extend({}, this.attributes));
                        }, true, this);
                    }
                    if (option === true) {
                        this.validate();
                    }
                    return this.validation ? this._isValid : true;
                },

                // This is called by Backbone when it needs to perform validation.
                // You can call it manually without any parameters to validate the
                // entire model.
                validate: function(attrs, setOptions) {
                    var model = this,
                        validateAll = !attrs,
                        opt = _.extend({}, options, setOptions),
                        validatedAttrs = getValidatedAttrs(model),
                        allAttrs = _.extend({}, validatedAttrs, model.attributes, attrs),
                        changedAttrs = flatten(attrs || allAttrs),

                        result = validateModel(model, allAttrs);

                    model._isValid = result.isValid;

                    // After validation is performed, loop through all validated attributes
                    // and call the valid callbacks so the view is updated.
                    _.each(validatedAttrs, function(val, attr) {
                        var invalid = result.invalidAttrs.hasOwnProperty(attr);
                        if (!invalid) {
                            opt.valid(view, attr, opt.selector);
                        }
                    });

                    // After validation is performed, loop through all validated and changed attributes
                    // and call the invalid callback so the view is updated.
                    _.each(validatedAttrs, function(val, attr) {
                        var invalid = result.invalidAttrs.hasOwnProperty(attr),
                            changed = changedAttrs.hasOwnProperty(attr);

                        if (invalid && (changed || validateAll)) {
                            opt.invalid(view, attr, result.invalidAttrs[attr], opt.selector);
                        }
                    });

                    // Trigger validated events.
                    // Need to defer this so the model is actually updated before
                    // the event is triggered.
                    _.defer(function() {
                        model.trigger('validated', model._isValid, model, result.invalidAttrs);
                        model.trigger('validated:' + (model._isValid ? 'valid' : 'invalid'), model, result.invalidAttrs);
                    });

                    // Return any error messages to Backbone, unless the forceUpdate flag is set.
                    // Then we do not return anything and fools Backbone to believe the validation was
                    // a success. That way Backbone will update the model regardless.
                    if (!opt.forceUpdate && _.intersection(_.keys(result.invalidAttrs), _.keys(changedAttrs)).length > 0) {
                        return result.invalidAttrs;
                    }
                }
            };
        };

        // Helper to mix in validation on a model
        var bindModel = function(view, model, options) {
            _.extend(model, mixin(view, options));
        };

        // Removes the methods added to a model
        var unbindModel = function(model) {
            delete model.validate;
            delete model.preValidate;
            delete model.isValid;
        };

        // Mix in validation on a model whenever a model is
        // added to a collection
        var collectionAdd = function(model) {
            bindModel(this.view, model, this.options);
        };

        // Remove validation from a model whenever a model is
        // removed from a collection
        var collectionRemove = function(model) {
            unbindModel(model);
        };

        // Returns the public methods on Backbone.Validation
        return {

            // Current version of the library
            version: '0.9.1',

            // Called to configure the default options
            configure: function(options) {
                _.extend(defaultOptions, options);
            },

            // Hooks up validation on a view with a model
            // or collection
            bind: function(view, options) {
                options = _.extend({}, defaultOptions, defaultCallbacks, options);

                var model = options.model || view.model,
                    collection = options.collection || view.collection;

                if (typeof model === 'undefined' && typeof collection === 'undefined') {
                    throw 'Before you execute the binding your view must have a model or a collection.\n' +
                        'See http://thedersen.com/projects/backbone-validation/#using-form-model-validation for more information.';
                }

                if (model) {
                    bindModel(view, model, options);
                } else if (collection) {
                    collection.each(function(model) {
                        bindModel(view, model, options);
                    });
                    collection.bind('add', collectionAdd, {
                        view: view,
                        options: options
                    });
                    collection.bind('remove', collectionRemove);
                }
            },

            // Removes validation from a view with a model
            // or collection
            unbind: function(view, options) {
                options = _.extend({}, options);
                var model = options.model || view.model,
                    collection = options.collection || view.collection;

                if (model) {
                    unbindModel(model);
                } else if (collection) {
                    collection.each(function(model) {
                        unbindModel(model);
                    });
                    collection.unbind('add', collectionAdd);
                    collection.unbind('remove', collectionRemove);
                }
            },

            // Used to extend the Backbone.Model.prototype
            // with validation
            mixin: mixin(null, defaultOptions)
        };
    }());


    // Callbacks
    // ---------

    var defaultCallbacks = Validation.callbacks = {

        // Gets called when a previously invalid field in the
        // view becomes valid. Removes any error message.
        // Should be overridden with custom functionality.
        valid: function(view, attr, selector) {
            view.$('[' + selector + '~="' + attr + '"]')
                .removeClass('invalid')
                .removeAttr('data-error');
        },

        // Gets called when a field in the view becomes invalid.
        // Adds a error message.
        // Should be overridden with custom functionality.
        invalid: function(view, attr, error, selector) {
            view.$('[' + selector + '~="' + attr + '"]')
                .addClass('invalid')
                .attr('data-error', error);
        }
    };


    // Patterns
    // --------

    var defaultPatterns = Validation.patterns = {
        // Matches any digit(s) (i.e. 0-9)
        digits: /^\d+$/,

        // Matches any number (e.g. 100.000)
        number: /^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/,

        // Matches a valid email address (e.g. mail@example.com)
        email: /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i,

        // Mathes any valid url (e.g. http://www.xample.com)
        url: /^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i
    };


    // Error messages
    // --------------

    // Error message for the build in validators.
    // {x} gets swapped out with arguments form the validator.
    var defaultMessages = Validation.messages = {
        required: '{0} is required',
        acceptance: '{0} must be accepted',
        min: '{0} must be greater than or equal to {1}',
        max: '{0} must be less than or equal to {1}',
        range: '{0} must be between {1} and {2}',
        length: '{0} must be {1} characters',
        minLength: '{0} must be at least {1} characters',
        maxLength: '{0} must be at most {1} characters',
        rangeLength: '{0} must be between {1} and {2} characters',
        oneOf: '{0} must be one of: {1}',
        equalTo: '{0} must be the same as {1}',
        digits: '{0} must only contain digits',
        number: '{0} must be a number',
        email: '{0} must be a valid email',
        url: '{0} must be a valid url',
        inlinePattern: '{0} is invalid'
    };

    // Label formatters
    // ----------------

    // Label formatters are used to convert the attribute name
    // to a more human friendly label when using the built in
    // error messages.
    // Configure which one to use with a call to
    //
    //     Backbone.Validation.configure({
    //       labelFormatter: 'label'
    //     });
    var defaultLabelFormatters = Validation.labelFormatters = {

        // Returns the attribute name with applying any formatting
        none: function(attrName) {
            return attrName;
        },

        // Converts attributeName or attribute_name to Attribute name
        sentenceCase: function(attrName) {
            return attrName.replace(/(?:^\w|[A-Z]|\b\w)/g, function(match, index) {
                return index === 0 ? match.toUpperCase() : ' ' + match.toLowerCase();
            }).replace(/_/g, ' ');
        },

        // Looks for a label configured on the model and returns it
        //
        //      var Model = Backbone.Model.extend({
        //        validation: {
        //          someAttribute: {
        //            required: true
        //          }
        //        },
        //
        //        labels: {
        //          someAttribute: 'Custom label'
        //        }
        //      });
        label: function(attrName, model) {
            return (model.labels && model.labels[attrName]) || defaultLabelFormatters.sentenceCase(attrName, model);
        }
    };


    // Built in validators
    // -------------------

    var defaultValidators = Validation.validators = (function() {
        // Use native trim when defined
        var trim = String.prototype.trim ?
            function(text) {
                return text === null ? '' : String.prototype.trim.call(text);
            } :
            function(text) {
                var trimLeft = /^\s+/,
                    trimRight = /\s+$/;

                return text === null ? '' : text.toString().replace(trimLeft, '').replace(trimRight, '');
            };

        // Determines whether or not a value is a number
        var isNumber = function(value) {
            return _.isNumber(value) || (_.isString(value) && value.match(defaultPatterns.number));
        };

        // Determines whether or not a value is empty
        var hasValue = function(value) {
            return !(_.isNull(value) || _.isUndefined(value) || (_.isString(value) && trim(value) === '') || (_.isArray(value) && _.isEmpty(value)));
        };

        return {
            // Function validator
            // Lets you implement a custom function used for validation
            fn: function(value, attr, fn, model, computed) {
                if (_.isString(fn)) {
                    fn = model[fn];
                }
                return fn.call(model, value, attr, computed);
            },

            // Required validator
            // Validates if the attribute is required or not
            // This can be specified as either a boolean value or a function that returns a boolean value
            required: function(value, attr, required, model, computed) {
                var isRequired = _.isFunction(required) ? required.call(model, value, attr, computed) : required;
                if (!isRequired && !hasValue(value)) {
                    return false; // overrides all other validators
                }
                if (isRequired && !hasValue(value)) {
                    return this.format(defaultMessages.required, this.formatLabel(attr, model));
                }
            },

            // Acceptance validator
            // Validates that something has to be accepted, e.g. terms of use
            // `true` or 'true' are valid
            acceptance: function(value, attr, accept, model) {
                if (value !== 'true' && (!_.isBoolean(value) || value === false)) {
                    return this.format(defaultMessages.acceptance, this.formatLabel(attr, model));
                }
            },

            // Min validator
            // Validates that the value has to be a number and equal to or greater than
            // the min value specified
            min: function(value, attr, minValue, model) {
                if (!isNumber(value) || value < minValue) {
                    return this.format(defaultMessages.min, this.formatLabel(attr, model), minValue);
                }
            },

            // Max validator
            // Validates that the value has to be a number and equal to or less than
            // the max value specified
            max: function(value, attr, maxValue, model) {
                if (!isNumber(value) || value > maxValue) {
                    return this.format(defaultMessages.max, this.formatLabel(attr, model), maxValue);
                }
            },

            // Range validator
            // Validates that the value has to be a number and equal to or between
            // the two numbers specified
            range: function(value, attr, range, model) {
                if (!isNumber(value) || value < range[0] || value > range[1]) {
                    return this.format(defaultMessages.range, this.formatLabel(attr, model), range[0], range[1]);
                }
            },

            // Length validator
            // Validates that the value has to be a string with length equal to
            // the length value specified
            length: function(value, attr, length, model) {
                if (!_.isString(value) || value.length !== length) {
                    return this.format(defaultMessages.length, this.formatLabel(attr, model), length);
                }
            },

            // Min length validator
            // Validates that the value has to be a string with length equal to or greater than
            // the min length value specified
            minLength: function(value, attr, minLength, model) {
                if (!_.isString(value) || value.length < minLength) {
                    return this.format(defaultMessages.minLength, this.formatLabel(attr, model), minLength);
                }
            },

            // Max length validator
            // Validates that the value has to be a string with length equal to or less than
            // the max length value specified
            maxLength: function(value, attr, maxLength, model) {
                if (!_.isString(value) || value.length > maxLength) {
                    return this.format(defaultMessages.maxLength, this.formatLabel(attr, model), maxLength);
                }
            },

            // Range length validator
            // Validates that the value has to be a string and equal to or between
            // the two numbers specified
            rangeLength: function(value, attr, range, model) {
                if (!_.isString(value) || value.length < range[0] || value.length > range[1]) {
                    return this.format(defaultMessages.rangeLength, this.formatLabel(attr, model), range[0], range[1]);
                }
            },

            // One of validator
            // Validates that the value has to be equal to one of the elements in
            // the specified array. Case sensitive matching
            oneOf: function(value, attr, values, model) {
                if (!_.include(values, value)) {
                    return this.format(defaultMessages.oneOf, this.formatLabel(attr, model), values.join(', '));
                }
            },

            // Equal to validator
            // Validates that the value has to be equal to the value of the attribute
            // with the name specified
            equalTo: function(value, attr, equalTo, model, computed) {
                if (value !== computed[equalTo]) {
                    return this.format(defaultMessages.equalTo, this.formatLabel(attr, model), this.formatLabel(equalTo, model));
                }
            },

            // Pattern validator
            // Validates that the value has to match the pattern specified.
            // Can be a regular expression or the name of one of the built in patterns
            pattern: function(value, attr, pattern, model) {
                if (!hasValue(value) || !value.toString().match(defaultPatterns[pattern] || pattern)) {
                    return this.format(defaultMessages[pattern] || defaultMessages.inlinePattern, this.formatLabel(attr, model), pattern);
                }
            }
        };
    }());

    // Set the correct context for all validators
    // when used from within a method validator
    _.each(defaultValidators, function(validator, key) {
        defaultValidators[key] = _.bind(defaultValidators[key], _.extend({}, formatFunctions, defaultValidators));
    });

    return Validation;
}(_));
define("backboneValidation", function(){});

define('widgets/wemo_edit_device/js/view',['Cache', 'hbs!widgets/wemo_edit_device/templates/main','widgets/wemo_edit_device/js/model', 'libs/smartDevicePlugin', 'backboneValidation' ],
    function(Backbone, template, model, smartDevicePlugin) {

        'use strict';

        var View = Backbone.OverlayView.extend({
            tagName: 'div',
            className: 'wemo_edit_device noMainHeader',
            template: template,
            jardenDeviceArray: ['wemo_heatera', 'wemo_heaterb', 'wemo_humidifier', 'wemo_humidifierb', 'wemo_airpurifier', 'wemo_coffeemaker', 'wemo_crockpot'],
            runTimer: setTimeout(function() {
            }, 0),
            imageName: '',
            isJardenDevice: false,
            events: {
                'click .cancel-btn': 'cancel',
                'focus #timer': 'setManualChange',
                'click .done-btn': 'save',
                'click .icon': 'showIconPopup',
                'click .reset_container': 'loadResetPage',
                'click #editFriendlyName': 'updateFocus',
                'blur #editFriendlyName': 'clear'
            },
            bindings: {
                '*[data-bind="friendlyName"]': {
                    observe: 'friendlyName',
                    updateMethod: 'html'
                },
                '*[data-bind="icon"]': {
                    observe: 'icon',
                    update: function(view, val) {
                        if (this.sandbox.name !== 'wemo_netcamsensor') {
                            var icon = val;
                            if (icon !== '') {
                                if (this.sandbox.name !== 'wemo_lighting') {
                                    this.$('.icon').removeClass('defaultIcon');
                                } else {
                                    this.$('.icon').removeClass(this.imageName);
                                }
                                this.$('.icon').css('background-image', 'url("' + icon + '")');
                            } else {
                                if (this.sandbox.name !== 'wemo_lighting') {
                                    this.$('.icon').addClass('defaultIcon');
                                } else {
                                    this.$('.icon').addClass(this.imageName);
                                }
                                this.$('.icon').css('background-image', '');
                            }
                        }
                    }
                }
            },
            setDefaultIcon: function() {
                var modelCode = this.model.baseObject.information.modelCode.replace(/ /g, '_').toLowerCase();
                this.imageName = 'bulb_' + modelCode;
            },
            listen: function() {
                this.sandbox.on('launch:errorPopup', this.showErrorPopup);
            },
            endListening: function() {
                this.sandbox.off('launch:errorPopup', this.showErrorPopup);
            },
            /**
             * create a base model for friendlyname and icon validation
             */
            createModel: function() {
                var baseObject = this.sandbox.model.baseObject,
                    ssid = this.sandbox.model.baseObject.information.ssid,
                    mac = this.sandbox.model.baseObject.information.mac,
                    deviceId = '';

                this.model = new model.Model({
                    friendlyName: this.sandbox.model.get('friendlyName'),
                    icon: this.sandbox.model.get('icon'),
                    pluginID: baseObject.information.pluginID
                }, {
                    sandbox: this.sandbox //use Parent for edit device, so we can put all the validation messaging in the parent.
                });


                deviceId = (this.sandbox.name !== 'wemo_lighting') ? ssid : mac;
                this.$('.ssid').text(deviceId);
                this.model.baseObject = baseObject;
            },
            /**
             * if there is a custom edit view, insert it here.
             */
            createChildViews: function() {
                var self = this;
                this.$el.removeClass('settings smart-overlay');
                if (this.edit) {
                    this.edit.view = new this.edit.View({
                        sandbox: self.sandbox,
                        parent: this
                    });
                    this.edit.view.render();
                    if (this.sandbox.name === 'wemo_lighting') {
                        this.$('.ID_label').before(this.edit.view.$el);
                    } else {
                        this.$('.form').after(this.edit.view.$el);
                    }
                }
                this.sandbox.lastFocusInput = false;
            },
            /**
             * after the template has rendered, add form validation
             */
            afterRender: function() {
                var self = this,
                    isOnRemote = (window.sessionStorage.getItem('isRemote') === "true");
                this.createModel();
                this.createChildViews();
                this.formValidation = new this.sandbox.FormValidation();
                this.formValidation.bind(this, null, 2);
                this.delegateEvents();
                if (isOnRemote) {
                    self.$('.ID_label').hide();
                }
                if (this.sandbox.name === 'wemo_netcamsensor') {
                    this.$('.name_container').css('background-color', '#f2f2f2');
                    this.$('#editFriendlyName').css('color', '#cccccc');
                    this.$('#editFriendlyName').prop('disabled', true);
                    this.$('.reset_container').css('background-color', '#f2f2f2');
                    this.$('.reset_container').css('color', '#cccccc');
                } else if (this.sandbox.name === 'wemo_lighting') {
                    if (!isOnRemote) {
                        self.$('.checkBulb_container').show();
                        self.$('.ID_container').addClass('checkChange');
                        self.$('.ID_label').addClass('checkChange');
                    }
                }
                this.setDefaultIcon();

                if(this.sandbox.name === 'wemo_dimmer'){
                    this.loadBulbConfiguration();
                }
            },
            loadBulbConfiguration: function() {
//                var self = this;
//                var options = {
//                    parent: self,
//                    mainSandbox: self.sandbox,
//                }
//                this.sandbox.emit("global.edit:loaded", options);
            },
            afterOpen: function() {
                var name = this.sandbox.name;
                this.sandbox.isJardenDevice = (_.contains(this.jardenDeviceArray, name));
            },
            afterClose: function() {
                if (this.edit) {
                    this.edit.view.stopListening();
                }
            },
            /**
             * save this model instance back to the sandbox version, and close the overlay.
             */
            afterSave: function() {
                this.sandbox.uiInterface.hideSpinner();
                this.sandbox.model.set(this.model.toJSON());
                this.close();
                this.sandbox.emit('global.editing:stop');
            },
            clearTimer: function() {
                this.model.undo();
                this.sandbox.uiInterface.dismissSettings.call(this, {
                    cancel: true
                });
                this.sandbox.emit('global.editing:stop');
            },
            getValidationErrors: function() {
                var errors = this.formValidation.validate();

                if (!errors && (this.edit && this.edit.view.formValidation)) {
                    errors = this.edit.view.formValidation.validate();
                }

                return errors;
            },
            cancel: function() {
                this.clearTimer();
            },
            saveArray: ['friendlyName', 'icon'],
            /**
             * [save description]
             * @return {[type]} [description]
             */
            save: function() {
                var finalArray,
                    methodArray = [];

                if (!this.getValidationErrors()) {
                    this.setFriendlyName();
                    if (this.edit) {
                        var newFriendlyName = this.model.get('friendlyName'),
                            newIcon = this.model.get('icon');

                        this.edit.view.model.set({
                            friendlyName: newFriendlyName,
                            icon: newIcon
                        });
                        this.model.set(this.edit.view.model.toJSON());
                        if (this.edit.view.model.editArray) {
                            finalArray = this.edit.view.model.editArray.concat(this.saveArray);
                        } else {
                            DEBUG && console.warn('if you have properties on the model that need to be saved in addition to friendlyName and icon, add them to your model as model.editArray=[]')
                            finalArray = this.saveArray;
                        }

                        if (this.edit.view.save) {
                            methodArray.push(this.edit.view.save());
                        }

                        if (this.edit.view.childViews) {
                            _.each(this.edit.view.childViews, function(childView) {
                                if (childView.save) {
                                    methodArray.push(childView.save());
                                }
                            });
                        }
                    } else {
                        finalArray = this.saveArray;
                    }

                    this.sandbox.uiInterface.showSpinner();
                    methodArray.push(this.model.save(finalArray));
                    //pipe the promises and wait for them to return (Set device properties)
                    $.when.apply($, methodArray).then(this.afterSave).fail(this.failHandler);
                }
            },
            failHandler: function(err) {
                if (err.error && (err.error === "timeout")) {
                    this.afterSave();
                } else {
                    this.sandbox.uiInterface.hideSpinner();
                    this.sandbox.emit('launch:errorPopup', 'Edit');
                    this.model.undo();
                }
            },
            /**
             * show error confirm popup
             */
            showErrorPopup: function(type) {
                this.confirmDialog = new this.sandbox.dom.Alert({
                    title: this.i18n('wemo_edit_device:headers.alert'),
                    message: this.i18n('wemo_edit_device:messages.errorMessage' + type),
                    buttonLabels: this.i18n('wemo_edit_device:buttons.ok')
                });
            },
            /**
             * show Upload Icon popup
             */
            showIconPopup: function() {
                var self = this;

                if (this.sandbox.name !== 'wemo_netcamsensor') {
                    this.confirmDialog = new this.sandbox.dom.CustomModal({
                        title: this.i18n('wemo_edit_device:iconPopup.title'),
                        popupClass: 'customManyOptionPopup iconEditPopup',
                        buttons: [
                            {
                                text: this.i18n('wemo_edit_device:iconPopup.option1'),
                                events: [{
                                    tap: function() {
                                        self.getCameraPicker();
                                    }
                                }]
                            }, {
                                text: this.i18n('wemo_edit_device:iconPopup.option2'),
                                events: [{
                                    tap: function() {
                                        self.getGalleryPicker();
                                    }
                                }]
                            }, {
                                text: this.i18n('wemo_edit_device:iconPopup.option3'),
                                events: [{
                                    tap: function() {
                                        self.resetIcon();
                                    }
                                }]
                            }, {
                                text: this.i18n('wemo_edit_device:buttons.cancel')
                            }
                        ]
                    });
                    $('.iconEditPopup .message').remove();
                    $('.iconEditPopup .notification_inner').addClass('customManyOptionPopup');
                } else {
                    this.confirmDialog = new this.sandbox.dom.Alert({
                        message: self.i18n('wemo_edit_device:messages.iconChangeDisabledMessage'),
                        buttonLabels: self.i18n('wemo_edit_device:buttons.ok')
                    });
                }

                this.addBackButtonCommand({
                    key: 'back',
                    callback: function() {
                        self.confirmDialog.clear();
                    }
                });
            },
            /**
             * this function is for camera picker
             */
            getCameraPicker: function() {
//                navigator.camera.getPicture(
//                    this.onPhotoURISuccess,
//                    this.reportError, {
//                        quality: 80,
//                        targetWidth: 480,
//                        targeHeight: 640,
//                        saveToPhotoAlbum: false,
//                        encodingType: Camera.EncodingType.PNG,
//                        correctOrientation: false,
//                        destinationType: Camera.DestinationType.FILE_URI
//                    }
//                );

                var information = {
                    "udn" : this.sandbox.information.udn
                };

                smartDevicePlugin.takePicture(information, this.afterAdjustIcon);
            },
            /**
             * this function is for gallery picker
             */
            getGalleryPicker: function() {
//                navigator.camera.getPicture(
//                    this.onPhotoURISuccess,
//                    this.reportError, {
//                        quality: 80,
//                        targetWidth: 480,
//                        targeHeight: 640,
//                        correctOrientation: true,
//                        destinationType: Camera.DestinationType.FILE_URI,
//                        sourceType: Camera.PictureSourceType.SAVEDPHOTOALBUM
//                    }
//                );
                var information = {
                    "udn" : this.sandbox.information.udn
                };

                smartDevicePlugin.choosePhoto(information, this.afterAdjustIcon);
            },
            /**
             * set icon to default
             */
            resetIcon: function() {
                var defaultIcon = "";
                if (this.sandbox.name !== 'wemo_lighting') {
                    defaultIcon = this.sandbox.model.get("defaultIcon");
                }

                this.model.set('icon', defaultIcon);
            },
            /**
             * load reset view
             */
            loadResetPage: function(e) {
                if (!this.sandbox.lastFocusInput && this.sandbox.name !== 'wemo_netcamsensor') {
                    var modelFromWidget = !this.edit ? "" : this.edit.view.model,
                        deviceOptions = {
                            sandbox: this.sandbox,
                            model: this.model,
                            modelFromWidget: modelFromWidget
                        };

                    this.mainSandbox.emit('edit:reset', deviceOptions);
                }
            },
            /**
             * add new friendly name
             */
            setFriendlyName: function() {
                var newFriendlyName = this.$('#editFriendlyName').val(),
                    deviceListSandbox = this.sandbox._parent.sandboxes[this.sandbox.information.udn];

                this.model.set('friendlyName', newFriendlyName);
                deviceListSandbox.properties.friendlyName = newFriendlyName;
            },
            /**
             * set lastFocusInput as true, when the friendlyName input is focused
             */
            updateFocus: function() {
                var self = this;
                if (this.sandbox.name !== 'wemo_netcamsensor') {
                    this.sandbox.lastFocusInput = true;
                }
            },
            /**
             * Resize page when keyboard shows
             */
            resizePage: function() {
                var self = this;
//                setTimeout(function() {
//                    var windowHeight = $(window).height();
//                    self.$el.height(windowHeight);
//                }, 150);
            },
            /**
             * set lastFocusInput as false, when the friendlyName input is unfocused
             */
            clear: function() {
                if (this.sandbox.name !== 'wemo_netcamsensor') {
                    this.sandbox.lastFocusInput = false;
                }
            },
            onPhotoURISuccess: function(imageData) {
                var information = {
                    "udn" : this.sandbox.information.udn,
                    "icon" : imageData
                };
                smartDevicePlugin.adjustIcon(information, this.afterAdjustIcon);
            },
            afterAdjustIcon: function(iconUrl) {
                this.$('.icon').addClass('external').removeClass('local');
                this.model.set('icon', iconUrl);
            },
            reportError: function() {
                DEBUG && console.log('Camera plugin return error!!');
            }
        });

        return View;
    });

/* START_TEMPLATE */
define('hbs!widgets/wemo_edit_device/templates/group',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, stack2, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<header class=\"main_header\">\n    <span data-bind=\"header\"></span>\n</header>\n<section class=\"content\">\n    <ul class=\"form\">\n       <li class=\"icon_container\">\n            <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "wemo_edit_device:headers.picture", options) : helperMissing.call(depth0, "i18n", "wemo_edit_device:headers.picture", options)))
    + "</span>\n            <div class=\"icon groupIcon local\" data-bind=\"icon\"></div>\n        </li>\n        <li class=\"name_container\">\n            <input type=\"text\" id=\"editFriendlyName\" name=\"friendlyName\" value=\"\" data-bind=\"groupFriendlyName\" placeholder=\"";
  options = {hash:{}};
  stack2 = ((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "wemo_edit_device:headers.groupName", options) : helperMissing.call(depth0, "i18n", "wemo_edit_device:headers.groupName", options));
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\"/>\n        </li>\n    </ul>\n</section>\n<footer>\n    <div href=\"#\" class=\"done-btn button-footer validation-btn\">\n        <div class=\"value\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "wemo_edit_device:buttons.done", options) : helperMissing.call(depth0, "i18n", "wemo_edit_device:buttons.done", options)))
    + "</div>\n    </div>\n    <div href=\"#\" class=\"cancel-btn button-footer validation-btn\">\n        <div class=\"value\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "wemo_edit_device:buttons.cancel", options) : helperMissing.call(depth0, "i18n", "wemo_edit_device:buttons.cancel", options)))
    + "</div>\n    </div>\n</footer>";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_edit_device_templates_group', t);
return t;
});
/* END_TEMPLATE */
;
define('widgets/wemo_edit_device/js/groupView',['Cache', 'hbs!widgets/wemo_edit_device/templates/group','widgets/wemo_edit_device/js/model', 'libs/smartDevicePlugin', 'backboneValidation'],
    function(Backbone, template, model, smartDevicePlugin) {

        'use strict';

        var View = Backbone.OverlayView.extend({
            tagName: 'div',
            className: 'wemo_edit_device noMainHeader',
            template: template,

            events: {
                'click .cancel-btn': 'clear',
                'click .done-btn': 'save',
                'click .groupIcon': 'showIconPopup'
            },
            bindings: {
                '*[data-bind="groupFriendlyName"]': {
                    observe: 'friendlyName',
                    updateMethod: 'html'
                },
                '*[data-bind="header"]': {
                    observe: 'friendlyName',
                    updateMethod: 'html'
                },
                '*[data-bind="icon"]': {
                    attributes: [{
                        observe: 'groupIcon',
                        update: function(view, val) {
                            this.renderGroupIcon();
                        }
                    }]
                }
            },
            afterRender: function() {
                this.model.preserveState();
                this.model.set('groupName', this.model.get('friendlyName'));
                this.model.validation = function() {
                    var self = this;
                    return {
                        groupName: [{
                            required: true,
                            msg: function() {
                                return self.i18n('wemo_edit_device:validation.friendlyNameRequired');
                            }
                        }, {
                            maxLength: 30,
                            msg: function() {
                                return self.i18n('wemo_edit_device:validation.friendlyNameMaxLength');
                            }
                        }, {
                            fn: function(value) {
                                var re = /[^\w.\s-]/gi;
                                var result = value.match(re);
                                if (result !== null) {
                                    return self.i18n('wemo_edit_device:validation.friendlyNameValidation');
                                }
                            }
                        }]
                    }
                };
                this.$el.removeClass('settings smart-overlay');
                this.renderGroupList();
                this.formValidation = new this.sandbox.FormValidation();
                this.formValidation.bind(this, null, 2);
                this.delegateEvents();
                this.setDefaultIcon();
            },
            setDefaultIcon: function() {
                var modelCode = this.model.baseObject.information.modelCode.replace(/ /g, '_').toLowerCase();
                this.imageName = 'bulb_' + modelCode;
                this.renderGroupIcon();
            },
            renderGroupIcon: function() {
                var iconUrl = this.model.baseObject.component.groupSandbox.properties.groupIcon;

                if (iconUrl !== '') {
                    this.$('.groupIcon').css('background-image', 'url("' + iconUrl + '")');
                } else {
                    this.$('.groupIcon').addClass(this.imageName);
                    this.$('.groupIcon').css('background-image', '');
                }
            },
            listen: function() {
                var self = this;
                this.listenTo(this.model, 'change:friendlyName', function() {
                    self.model.set('groupName', self.model.get('friendlyName'));
                });
                this.listenTo(this.model, 'icon', function() {
                    self.model.set('groupIcon', self.model.get('icon'));
                });

                this.sandbox.on('ungroup', this.afterSave);
            },
            endListening: function() {
                this.sandbox.off('ungroup', this.afterSave);
            },
            renderGroupList: function() {
                var self = this;

                this.groupEdit = this.sandbox.groupMasterSandbox.config.groupEdit;

                if (this.groupEdit) {
                    this.groupEdit.view = new this.groupEdit.View({
                        sandbox: self.sandbox,
                        parent: this,
                        collection: self.sandbox.view.groupList.collection
                    });
                    this.groupEdit.view.render();
                    this.listView = this.groupEdit.view;

                } else {
                    this.listView = this.sandbox.view.groupList;

                }
                this.$('ul.form').after(this.listView.$el);
            },
            getValidationErrors: function() {
                var errors = this.formValidation.validate();

                if (!errors && (this.groupEdit && this.groupEdit.view.formValidation)) {
                    errors = this.groupEdit.view.formValidation.validate();
                }

                return errors;
            },
            clear: function() {
                if (this.createGroup) {
                    this.sandbox.view.ungroupOnFail =  true;
                    this.sandbox.view.ungroup(Object.keys(this.sandbox.sandboxes));
                }

                this.model.undo();
                this.listView.$el.detach();

                this.sandbox.uiInterface.dismissSettings.call(this, {
                    cancel: true
                });

                this.sandbox.emit('global.editing:stop');
            },
            saveArray: ['groupName', 'groupIcon', 'groupID'],
            save: function() {
                var methodArray = [];

                if (!this.getValidationErrors()) {
                    this.setFriendlyName();
                    this.sandbox.uiInterface.showSpinner();

                    var bridgeUDN = this.sandbox.baseObject.information.bridgeUDN,
                        payload = this.sandbox.view.getNativeObject();

                    if (this.groupEdit && this.groupEdit.view.save) {
                        methodArray.push(this.groupEdit.view.save());
                    }

                    if (!bridgeUDN) {
                        $.each(this.sandbox._parent.sandboxes, function(udn, value){
                            if(udn.match("uuid:Bridge")) {
                                bridgeUDN = udn;
                            }
                        });
                    }

                    if (bridgeUDN) {
                        //only call this if a) we're creating the group or b) something has changed
                        if (this.createGroup || !_.isEqual(this.model.attributes, this.model.originalState)) {
                            methodArray.push(smartDevicePlugin.addToGroup(bridgeUDN, payload, this.createGroup));
//                            methodArray.push(smartDevicePlugin.addToGroup(bridgeUDN, payload, this.createGroup));
                        }

                        if (methodArray.length > 0) {
                            $.when.apply($, methodArray).then(this.afterSave).fail(this.clear);
                        } else {
                            this.afterSave();
                        }
                    }

                }
            },
            /**
             * save this model instance back to the sandbox version, and close the overlay.
             */
            afterSave: function() {
                this.sandbox.baseObject.component.parentSandbox.emit('finishGroup');
                this.sandbox.uiInterface.hideSpinner();
                this.listView.$el.detach();
                this.close();
                this.sandbox.emit('global.editing:stop');
            },
            /**
             * show Upload Icon popup
             */
            showIconPopup: function() {
                var self = this;
                this.confirmDialog = new this.sandbox.dom.CustomModal({
                    title: this.i18n('wemo_edit_device:iconPopup.title'),
                    popupClass: 'customManyOptionPopup iconEditPopup',
                    buttons: [
                        {
                            text: this.i18n('wemo_edit_device:iconPopup.option1'),
                            events: [{
                                tap: function() {
                                    self.getCameraPicker();
                                }
                            }]
                        }, {
                            text: this.i18n('wemo_edit_device:iconPopup.option2'),
                            events: [{
                                tap: function() {
                                    self.getGalleryPicker();
                                }
                            }]
                        }, {
                            text: this.i18n('wemo_edit_device:iconPopup.option3'),
                            events: [{
                                tap: function() {
                                    self.resetIcon();
                                }
                            }]
                        }, {
                            text: this.i18n('wemo_edit_device:buttons.cancel')
                        }
                    ]
                });
                $('.customPopup .message').remove();
                $('.iconEditPopup .notification_inner').addClass('customManyOptionPopup');

                this.addBackButtonCommand({
                    key: 'back',
                    callback: function() {
                        self.confirmDialog.clear();
                    }
                });
            },
            /**
             * this function is for camera picker
             */
            getCameraPicker: function() {
//                navigator.camera.getPicture(
//                    this.onPhotoURISuccess,
//                    this.reportError, {
//                        quality: 80,
//                        targetWidth: 480,
//                        targeHeight: 640,
//                        saveToPhotoAlbum: false,
//                        encodingType: Camera.EncodingType.PNG,
//                        correctOrientation: false,
//                        destinationType: Camera.DestinationType.FILE_URI
//                    }
//                );
                var information = {
                    "groupID" :  this.model.baseObject.component.groupSandbox.properties.groupID
                };
                smartDevicePlugin.takePicture(information, this.afterAdjustIcon);
            },
            /**
             * this function is for gallery picker
             */
            getGalleryPicker: function() {
//                navigator.camera.getPicture(
//                    this.onPhotoURISuccess,
//                    this.reportError, {
//                        quality: 80,
//                        targetWidth: 480,
//                        targeHeight: 640,
//                        correctOrientation: true,
//                        destinationType: Camera.DestinationType.FILE_URI,
//                        sourceType: Camera.PictureSourceType.SAVEDPHOTOALBUM
//                    }
//                );
                var information = {
                    "groupID" :  this.model.baseObject.component.groupSandbox.properties.groupID
                };

                smartDevicePlugin.choosePhoto(information, this.afterAdjustIcon);
            },
            /**
             * set icon to default
             */
            resetIcon: function() {
                this.$('.groupIcon').addClass('local').removeClass('external');
                this.model.set('groupIcon', "");
                this.renderGroupIcon();
            },
            onPhotoURISuccess: function(imageData) {
                var information = {
                    "groupID" :  this.model.baseObject.component.groupSandbox.properties.groupID,
                    "icon" : imageData
                };

                smartDevicePlugin.adjustIcon(information, this.afterAdjustIcon);
            },
            afterAdjustIcon: function(iconUrl) {
                this.$('.groupIcon').addClass('external').removeClass('local');
                this.$('.groupIcon').css("background-image", 'url("' + iconUrl + '")');
                this.model.baseObject.component.groupSandbox.properties.groupIcon = iconUrl;
                this.model.set('groupIcon', iconUrl);
            },
            reportError: function() {
                DEBUG && console.log('Camera plugin return error!!');
            },
            setFriendlyName: function() {
                var newFriendlyName = this.$('#editFriendlyName').val(),
                    deviceListSandbox = this.sandbox._parent.sandboxes[this.sandbox.information.udn];

                this.model.set('friendlyName', newFriendlyName);
                deviceListSandbox.properties.friendlyName = newFriendlyName;
            }
        });

        return View;
    });
define('text!widgets/wemo_edit_device/css/main.css',[],function () { return '.wemo_edit_device,\n.resetPage {\n    position: fixed;\n    top: 0;\n    left: 0;\n    width: 100%;\n    height: 100%;\n    z-index: 9;\n    background-color: #eee;\n    color: #595959;\n    font-size: 50%;\n}\n.wemo_edit_device .content {\n    overflow-y: auto;\n}\n.resetPage {\n    z-index: 120;\n}\n.wemo_edit_device header,\n.wemo_edit_device .wemo_group_grouplist .groupHeader {\n    padding: 0.75em 1em;\n    width: 100%;\n    background-color: #5b9b41;\n    color: #fff;\n    margin-top: 55px;\n}\n.wemo_edit_device header {\n    font-size: 2em;\n    color: #fff;\n}\n.wemo_edit_device ul {\n    padding: 0;\n    margin: 0;\n    list-style: none;\n}\n.wemo_edit_device .icon_container {\n    padding: 0px 1em 0 2.2em;\n    width: 100%;\n    height: 11.9em;\n    background-color: #ffffff;\n    border-bottom: 1px solid #cfcfcf;\n    display: flex;\n    align-items: center;\n}\n.wemo_edit_device .icon_container .title {\n    font-size: 2em;\n    width: 60%;\n    font-weight: 400;\n}\n.wemo_edit_device .icon_container .icon {\n    width: 40%;\n    height: 10em;\n    background-size: 10em 10em;\n    background-repeat: no-repeat;\n    background-position: center right;\n}\n.wemo_edit_device .name_container {\n    padding: 0.6em 2.2em 0;\n    width: 100%;\n    height: 6.3em;\n    border-bottom: 1px solid #cfcfcf;\n    background-color: #ffffff;\n}\n.wemo_edit_device .name_container #editFriendlyName {\n    margin: 0;\n    padding: 0;\n    width: 100%;\n    height: 2.5em;\n    border: none;\n    box-shadow: none;\n    background: transparent;\n    color: #595959;\n    font-size: 2em;\n}\n.wemo_edit_device .ID_container {\n    padding: 0 2.2em;\n    width: 100%;\n    height: 7.3em;\n    border-bottom: 1px solid #cfcfcf;\n    text-align: center;\n    line-height: 7.3em;\n    font-weight: 400;\n}\n.wemo_edit_device .ID_container .ID_label {\n    display: block;\n    color: #999999;\n    font-size: 2em;\n    text-align: center;\n    font-weight: 400;\n}\n.wemo_edit_device .reset_container {\n    padding: 0 2.2em;\n    width: 100%;\n    height: 6.4em;\n    border-bottom: 1px solid #cfcfcf;\n    background-color: #ffffff;\n    line-height: 6.4em;\n}\n.wemo_edit_device .reset_container .title,\n.resetPage .resetHeader .title {\n    font-size: 2em;\n    font-weight: 400;\n}\n.wemo_edit_device .reset_container .fa {\n    float: right;\n    margin-top: 0.65em;\n    color: #dddddd;\n    font-size: 22px;\n}\n.wemo_edit_device footer {\n    position: fixed;\n    bottom: 0;\n    left: 0;\n    width: 100%;\n    height: 7em;\n}\n.wemo_edit_device footer .button-footer {\n    height: 100%;\n    border-top: 1px solid #777;\n    background-color: #ffffff;\n    text-align: center;\n}\n.wemo_edit_device footer .cancel-btn,\n.wemo_edit_device footer .done-btn {\n    width: 50%;\n    font-size: 2em;\n    display: flex;\n    align-items: center;\n}\n.wemo_edit_device footer .cancel-btn {\n    float: left;\n    border-right: 1px solid #777;\n}\n.wemo_edit_device footer .done-btn {\n    float: right;\n}\n.wemo_edit_device .cancel-btn .value,\n.wemo_edit_device .done-btn .value {\n    width: 100%;\n}\n.wemo_edit_device .done-btn .value {\n    color: #73d44c;\n    font-weight: 700;\n}\n.wemo_edit_device .groupList_header {\n    padding: .5em 1.8em;\n    background: #f2f2f2;\n    text-transform: uppercase;\n    color: #000;\n    line-height: 1.5em;\n    font-size: 1.5em;\n    font-weight: normal;\n}\n.resetPage .resetHeader {\n    position: relative;\n    widht: 100%;\n    height: 6.6em;\n    box-shadow: 0 2px 2px #cfcfcf;\n    background-color: #FFFFFF;\n    line-height: 6.6em;\n}\n.resetPage .resetHeader .closeIcon {\n    position: absolute;\n    left: 2.3em;\n    top: 1.6em;\n    width: 4.5em;\n    height: 4.5em;\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoBAMAAAB+0KVeAAAABGdBTUEAALGPC/xhBQAAABhQTFRFd3d3d3d3d3d3d3d3d3d3d3d3AAAAd3d3j+l4nQAAAAd0Uk5T3O9L7dZRAP+H/xQAAABzSURBVCjPrZKxDcAwCARZIotkKLtNEfnXD7ar8FdFoTydsIGPBhX/wC6A0jDYCQpgit7zLW5YxA2LuGAVF6zihCZOaGJCFxO62GKKpc5wppugCF7U8+DX+Z84Ec+OW+J94ub5RnhNvjsmhLOEqeN8fsz8A0z4Sr1e+UFKAAAAAElFTkSuQmCC);\n    background-repeat: no-repeat;\n    background-size: 70%;\n}\n.resetPage .resetHeader .title {\n    margin-left: 4em;\n}\n.resetPage .resetContent {\n    padding-top: 1.2em;\n    width: 100%;\n    height: 100%;\n}\n.resetPage .resetContent .resetItem {\n    margin: 2.7em 5% 1.1em 5%;\n    width: 90%;\n    display: none;\n}\n.resetPage .resetContent .resetButtons {\n    padding: 0.94em 0.81em;\n    overflow: auto;\n    border-radius: 2px;\n    box-shadow: 0 1px 1px #999999;\n    background: #ffffff;\n    color: #73d44c;\n    font-size: 2em;\n    font-weight: 400;\n    line-height: 0.94em;\n    text-align: center;\n}\n.resetPage .resetContent .resetButtons:active {\n    background-color: #999999;\n}\n.resetPage .resetContent .detail {\n    margin: 0.3em 0.4em 0;\n    display: block;\n    color: #999999;\n    font-size: 1.8em;\n    text-align: justify;\n    line-height: 1.13em;\n}\n.resetPage .eraseAll .resetButtons {\n    background-color: #ef0000;\n    color: #ffffff;\n}\n.resetPage .eraseAll .resetButtons:active {\n    background-color: #b40000;\n}\n.wemo_edit_device .wemo_group_grouplist .groupHeader {\n    border-top: 1px solid #cfcfcf;\n    background-color: #eaeaea;\n}\n.wemo_edit_device .wemo_group_grouplist h3 {\n    height: 2em;\n    color: #595959;\n    font-size: 2.125em;\n    font-weight: 400;\n    line-height: 1.95em;\n    overflow: hidden;\n    text-overflow: ellipsis;\n    width: 100%;\n}\n.wemo_edit_device .bulb_mrvl_mz100 {\n    background: url(data:image/png;base64,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) no-repeat;\n    background-size:cover;\n}\n.wemo_edit_device .bulb_osram_classic_a60_tw {\n    background-image: url(data:image/png;base64,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);\n    background-size:cover;\n}\n.wemo_edit_device .bulb_osram_flex_rgbw {\n    background-image: url(data:image/png;base64,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);\n    background-size:cover;\n}\n.wemo_edit_device .bulb_osram_gardenspot_rgb {\n    background-image: url(data:image/png;base64,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);\n    background-size:cover;\n}\n.wemo_edit_device .bulb_osram_lightify_a19_tunable_white {\n    background-image: url(data:image/png;base64,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);\n    background-size:cover;\n}\n.wemo_edit_device .bulb_osram_lightify_flex_rgbw {\n    background-image: url(data:image/png;base64,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);\n    background-size:cover;\n}\n.wemo_edit_device .bulb_osram_lightify_gardenspot_rgb {\n    background-image: url(data:image/png;base64,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);\n    background-size:cover;\n}\n.wemo_edit_device .bulb_osram_sylvania_iqbr30 {\n    background-image: url(data:image/png;base64,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);\n    background-size:cover;\n}\n.wemo_edit_device .bulb_cree_connected_a-19_60w_equivalent {\n    background-image: url(data:image/png;base64,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);\n    background-size:cover;\n}\n';});

/* START_TEMPLATE */
define('hbs!widgets/wemo_edit_device/templates/reset',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<header class=\"resetHeader\">\n    <div class=\"closeIcon\"></div>\n    <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "wemo_edit_device:headers.reset", options) : helperMissing.call(depth0, "i18n", "wemo_edit_device:headers.reset", options)))
    + "</span>\n</header>\n<section class=\"content\">\n    <div class=\"resetContent\">\n        <div class=\"resetItem clearData\" data-value=\"resetUsageData\">\n            <div class=\"resetButtons\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "wemo_edit_device:resetButtons.1", options) : helperMissing.call(depth0, "i18n", "wemo_edit_device:resetButtons.1", options)))
    + "</div>\n            <span class=\"detail\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "wemo_edit_device:resetDescriptions.1", options) : helperMissing.call(depth0, "i18n", "wemo_edit_device:resetDescriptions.1", options)))
    + "</span>\n        </div>\n        <div class=\"resetItem resetName\" data-value=\"fnIconRules\">\n            <div class=\"resetButtons\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "wemo_edit_device:resetButtons.2", options) : helperMissing.call(depth0, "i18n", "wemo_edit_device:resetButtons.2", options)))
    + "</div>\n            <span class=\"detail\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "wemo_edit_device:resetDescriptions.2", options) : helperMissing.call(depth0, "i18n", "wemo_edit_device:resetDescriptions.2", options)))
    + "</span>\n        </div>\n        <div class=\"resetItem resetWifi\" data-value=\"wifi\">\n            <div class=\"resetButtons\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "wemo_edit_device:resetButtons.3", options) : helperMissing.call(depth0, "i18n", "wemo_edit_device:resetButtons.3", options)))
    + "</div>\n            <span class=\"detail\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "wemo_edit_device:resetDescriptions.3", options) : helperMissing.call(depth0, "i18n", "wemo_edit_device:resetDescriptions.3", options)))
    + "</span>\n        </div>\n        <div class=\"resetItem eraseAll\" data-value=\"all\">\n            <div class=\"resetButtons\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "wemo_edit_device:resetButtons.4", options) : helperMissing.call(depth0, "i18n", "wemo_edit_device:resetButtons.4", options)))
    + "</div>\n            <span class=\"detail\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "wemo_edit_device:resetDescriptions.4", options) : helperMissing.call(depth0, "i18n", "wemo_edit_device:resetDescriptions.4", options)))
    + "</span>\n        </div>\n    </div>\n</section>\n";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_edit_device_templates_reset', t);
return t;
});
/* END_TEMPLATE */
;
define('widgets/wemo_edit_device/js/reset',['backbone', 'hbs!widgets/wemo_edit_device/templates/reset', 'libs/smartDevicePlugin'],
    function(Backbone, template, smartDevicePlugin) {

        'use strict';

        var View = Backbone.OverlayView.extend({
            className: "resetPage noMainHeader",
            template: template,
            RESET_TYPE: '',
            resetAvailable: false,
            resetRulesFlag: false,

            events: {
                'click .resetHeader': 'close',
                'click .clearData': 'showConfirmPopup',
                'click .resetName': 'showConfirmPopup',
                'click .resetWifi': 'showConfirmPopup',
                'click .eraseAll': 'showConfirmPopup'
            },
            /**
             * after the template has rendered, add default value to attributes
             */
            afterRender: function() {
                var widgetName = this.sandbox.name,
                    self = this;
                if (widgetName === 'wemo_insight') {
                    self.$('.clearData').show();
                }
                self.$('.resetName').show();
                this.isRemote = (window.sessionStorage.getItem('isRemote') === "true");

                if (!this.isRemote) {
                    if (widgetName !== 'wemo_lighting') {
                        self.$('.resetWifi').show();
                    }
                    self.$('.eraseAll').show();
                }
            },
            listen: function() {
                var self = this;
                var windowListeners = {
                    onDeviceReset: function(str) {
                        DEBUG && console.log('deviceReset');
                    }
                }

                if (!window.smartDevicePlugin) {
                    window.smartDevicePlugin = {};
                }

                _.extend(window.smartDevicePlugin, windowListeners);
            },
            /**
             * resets rules of a specific device
             * @param  {JSON} resp ex: {udn:udn}
             */
//            resetRulesDevice: function(resp) {
//                DEBUG && console.log('onDeviceReset: ' + resp.udn);
//                var self = this;
//                if (resp.success) {
//                    if (resp.resetType !== 'reset_wifi' && resp.resetType !== 'reset_usage_data') {
//                        if (!self.isRemote) {
//                            if (resp.udn.match(/^[a-z0-9]+$/i)) {
//                                this.resetRules.ledDeleteRecords(resp.udn);
//                            } else {
//                                this.resetRules.mainClearDB(resp.udn);
//                            }
//                        }
//                    } else {
//                        self.closeResetView();
//                    }
//                } else {
//                    self.failHandler();
//                }
//            },
//            resetRulesRemote: function(type, udn) {
//                if (type === 'fnIconRules' || type === 'all') {
//                    if (udn.match(/^[a-z0-9]+$/i)) {
//                        this.resetRules.ledDeleteRecords(udn);
//                    } else {
//                        this.resetRules.remoteCLearDB(udn);
//                    }
//                }
//            },
            /**
             * return basic info from the device
             */
            getInformation: function() {
                var info = {
                    'udn': this.sandbox.information.udn
                };

                return info;
            },
            /**
             * show reset confirm popup
             */
            showConfirmPopup: function(e) {
                var self = this;
                this.RESET_TYPE = this.$(e.currentTarget).attr('data-value');
                this.confirmDialog = new this.sandbox.dom.CustomModal({
                    title: this.i18n('wemo_edit_device:labels.confirm'),
                    message: this.i18n('wemo_edit_device:resetPopupMessage.' + this.RESET_TYPE),
                    buttons: [
                        {
                            text: this.i18n('wemo_edit_device:buttons.cancel'),
                            extraClass: 'passiveBtn',
                            width: '50%'
                        },
                        {
                            text: this.i18n('wemo_edit_device:buttons.ok'),
                            extraClass: 'actionBtn',
                            width: '50%',
                            events: [
                                {
                                    tap: function() {
                                        self.resetData(self.RESET_TYPE);
                                    }
                                }
                            ]
                        }
                    ]
                });
            },
            /**
             * reset content to default
             */
            resetData: function(type) {
                var propertyData = null,
                    self = this;

                if (type !== 'wifi') {
                    propertyData = {};
                    if (type === 'resetUsageData' || type === 'all' && this.sandbox.name === 'wemo_insight') {
                        propertyData['powerThreshold'] = this.modelFromWidget.get('defaultPowerThreshold');
                        propertyData['emailInterval'] = this.modelFromWidget.get('defaultEmailInterval');
                        propertyData['energyPerUnitCost'] = this.modelFromWidget.get('defaultEnergyPerUnitCost');

                        self.sandbox.model.set(propertyData);
                        if (type === 'resetUsageData') {
                            self.sandbox.uiInterface.showSpinner();
                        }

                    }
                    if (type === 'fnIconRules' || type === 'all') {
                        var defaultFriendlyName = this.sandbox.model.get('defaultFriendlyName');
                        window.sessionStorage.setItem('DEVICE_EDIT_WEMO_FRIENDLY_NAME', defaultFriendlyName);
                        //window.sessionStorage.setItem("device_friendly_name", defaultFriendlyName);
                        propertyData['friendlyName'] = defaultFriendlyName;
                        propertyData['icon'] = '';
                        propertyData['iconVersion'] = '';
                        if (this.sandbox.name === 'wemo_lighting') {
                            propertyData['modelCode'] = 'LED';
                        } else {
                            propertyData['modelCode'] = this.sandbox.model.baseObject.information.modelCode;
                        }
                        self.sandbox.model.set(propertyData);
                        self.sandbox.uiInterface.showSpinner();
                        this.resetRulesFlag = true;
                    }
                    smartDevicePlugin.resetDevice(type, this.getInformation(), propertyData, this.afterReset);
                } else {
                    self.sandbox.uiInterface.showSpinner();
                    smartDevicePlugin.resetDevice(type, this.getInformation(), null, this.afterReset);
                }
                this.resetAvailable = true;
            },
            /**
             * action after reset
             */
            afterReset: function(str) {
                DEBUG && console.log('reset device success');
                var resp = str,
                    self = this;

                if (typeof str === 'string') {
                    resp = JSON.parse(str);
                }

                if (resp.success === "true") {
                    DEBUG && console.log('reset.resetAllClearDevice');
                    if(resp.resetType === 'reset_all' ||  resp.resetType === 'reset_wifi') {

                        self.sandbox.view.tileView.$el.remove();

                        if(self.sandbox.view.drawerView){
                            self.sandbox.view.drawerView.$el.remove();
                        }

                        self.sandbox.emit('global.resetAllClearDevice',resp);
                    }
                    if(resp.resetType === 'reset_usage_data') {
                        self.sandbox.uiInterface.hideSpinner();
                    } else {
                        self.closeResetView();
                    }
                } else {
                    this.failHandler();
                }

            },
            /**
             *
             */
            closeResetView: function() {
                if (this.resetAvailable === true) {
                    this.resetAvailable = false;
                    DEBUG && console.log('Closing reset view');
                    this.sandbox.emit('global.editing:stop');

                    if (this.resetRulesFlag) {
                        this.sandbox.emit('ruleCleared');
                    }

                    this.$previousEl.remove();
                    this.setPreviousElement($('.container'));
                    this.sandbox.uiInterface.hideSpinner();
                    this.close();
                }
            },
            /**
             * action for save failed
             */
            failHandler: function() {
                this.sandbox.uiInterface.hideSpinner();
                this.sandbox.emit('launch:errorPopup', 'Reset');
            }
        });

        return View;
    });

define('widgets/wemo_edit_device/main',['Cache','widgets/wemo_edit_device/js/view','widgets/wemo_edit_device/js/groupView', 'text!widgets/wemo_edit_device/css/main.css','widgets/wemo_edit_device/js/reset'], function(Backbone, View, GroupView, css, ResetView) {

    'use strict';


    return {
        type: 'Backbone',
        /**
         * starts the process. recreate the edit view each time, in case device has changed
         */
        initialize: function(options) {
            this.sandbox.path = this.options.ref.replace(/main/, '');
            this.styles = css.replace(/\.\.\//g, this.sandbox.path + '/');
            this.stylesheet = new this.sandbox.util.Stylesheet(this.name, this.styles);

            var self = this;
            this.sandbox.on('edit:start', function(options) {

                var viewOptions = {
                    parent: self,
                    mainSandbox: self.sandbox,
                    parentElement: $('#mainContainer')
                };

                _.extend(viewOptions, options);

                if (options.isGroup) {
                    viewOptions.sandbox.model = viewOptions.sandbox.groupMasterSandbox.model;
                    self.view = new GroupView(viewOptions);
                } else {
                    self.view = new View(viewOptions);
                }

                self.render();
            });

            this.sandbox.on('edit:stop', function(options) {
                delete self.view;
            });

            this.sandbox.on('edit:reset', function(options) {
                var viewOptions = {
                    parent: self,
                    sandbox: options.sandbox,
                    parentElement: $('.wemo_edit_device'),
                    model: options.model,
                    modelFromWidget: options.modelFromWidget
                };

                self.resetView = new ResetView(viewOptions);
                self.resetView.initialRender();
                $('.resetPage').attr('class', 'resetPage')
            });

            this.sandbox.on('edit:resetStop', function(options) {
                delete self.resetView;
            });

            this.sandbox.on('global.onNetworkChanged', function(status){
                if (!status.isNetworkenabled) {
                    self.view.clearTimer();
                }
            });
        },
        /**
         * renders edit device html
         */
        render: function() {
            this.view.initialRender();
        }
    };

});
}());