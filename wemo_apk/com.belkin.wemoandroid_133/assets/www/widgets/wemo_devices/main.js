(function () {
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

/** a common API for devices and the browser. the browser version returns mock data for testing, will be used as part of an extension to mixin with the sandbox  **/
define('libs/cordovaPlugins/networkPlugin',['libs/execHandler'], function(ExecHandler) {
    'use strict';



    var callPlugin = function(plugin, action, data, options) {
        var handler = new ExecHandler(options);
        return handler.go(plugin, action, data);
    }

    var exports = {
        getAuthHeaders: function() {
            return callPlugin('WebServicePlugin', 'getAuthCode', []);
        },
        isRemoteAccessEnabled: function() {
            return callPlugin('DevicePlugin', '2013', [], {
                callback: function(resp) {
                    DEBUG && console.log('isRemoteAccessEnabled:' + JSON.stringify(resp));
                    window.sessionStorage.setItem('isRemoteEnabled', resp);
                }
            });
        },
        getNetworkType: function() {
            return callPlugin('DevicePlugin', '2012', [], {
                callback: function(resp) {
                    DEBUG && console.log('getNetworkType:' + JSON.stringify(resp));
                    if (resp.match(/remote/gi)) {
                        window.sessionStorage.setItem('isRemote', 'true');
                        window.sessionStorage.setItem('isLocal', 'false');
                    } else {
                        window.sessionStorage.setItem('isRemote', 'false');
                        window.sessionStorage.setItem('isLocal', 'true');
                    }
                }
            });
        }
    }
    return exports;

});
define('text!widgets/wemo_devices/css/main.css',[],function () { return '#mainContainer {width: auto;}\nul#wemo_devices{\n\t margin-bottom:140px;  \n}\n#wemo_devices .groupable{\n\tcolor:#73d44c;\n\tposition: absolute;\n\ttop: .05em;\n\tz-index: 51;\n\tleft: 2em;\n\tfont-size:3.3em;\n\ttext-align:center;\n\tbackground: #fff;\n\tborder-radius: 50%;\n\tmargin: 0;\n\tpadding: 0;\n}\n.refresh_img {\n\tbackground-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAABCCAQAAAC74Z3GAAACWUlEQVR4AbWVNYybQRQGX6IwM1MTZmZmbMNMteswtWGsXR814aRzE04bZsZjnqClT/p11n/e3enenjRz9t2+tfrCfgsLBE5A4AQETkDgBAROQOAEBE6A9wTNWcExLvGYL1SAxwTt2UQeJaB4StCS3RQieEzQiB28AwgSoCe3IZx+Iu9D6tdTTpRvJNnALAbQ2lUfJY85NPJy0ZgY+e1TTPW2KujFe5RqEh6XHY24g/KDhV7XNTtB9Qx1e3DoxyodW+q1opqFVicx9S/4TBtLw26UhGUgph7gcPqgA7pzUpaR2HoopOW/o00oU80BGvFMXBv+HebrtTJHKBDbzX/Pie77Oc6BWWKrpZOxAt05jZwDDdELu8w4LmPSPMAFMR42LqF/FA+wRYxXjCcyzvISGCPGh8YXGQd4CXQT4xujQsZWXgLNxFhqlMrY1EtAX70K442MXb0EBojxi/FQxlGm+Lhqj40rMm70EtggxkvGERnPeAkkxXjMWCbjaxo46xvxTYwrjE7UysE058AcsZXQ3My4KUe5zoE8Xf7RP8pTGjnpp6JsSj/5hQDAC/o5Ppgp0RfSPn18OK4eLAMkUHZbGtrwOZ4+U4CFVIv+HS31h6ti6TMEGMoPlB0WF9VDnb+96uE2jbLR1xEgQTXKe3pmqY8GmEoKBcqZmLVeAzRiDnlEWe+gB1oxgFlsIMk3opS76jPznokh9bfpFU7/jp00MgsTKGS33lqfiRLy2UR7E9wTFXzhMZc4xgqam+InYb6JXrTACbPACbPACbPACbPACbPACbPACasnvwBX5d86eLQKIQAAAABJRU5ErkJggg==);\n}\n.refresh_img.spinning {\n    -webkit-animation: spin 0.7s infinite linear;\n}\n@keyframes spin {\n    from { transform: rotate(0deg); }\n    to { transform: rotate(360deg); }\n}\n@-webkit-keyframes spin {\n    from { -webkit-transform: rotate(0deg); }\n    to { -webkit-transform: rotate(360deg); }\n}\n#wemo_devices li.grabbed {\n    box-shadow: 0 4px 4px rgba(0,0,0,0.3), 0 -4px 4px rgba(0,0,0,0.3);\n}\n';});

/**
 * use this file to load demo devices into android. The fields here match the fields returned by the UPNP response
 */
(function (definition) {

    /* jshint strict: false */


    // Montage Require
    if (typeof bootstrap === "function") {
        bootstrap("promise", definition);

        // CommonJS
    } else if (typeof exports === "object") {
        module.exports = definition();

        // RequireJS
    } else if (typeof define === "function" && define.amd) {
        define('features/demoDevices/noop',definition);
    } else {
        window.demoDevices = definition();
    }

})(function () {
    return null;
});
/* START_TEMPLATE */
define('hbs!widgets/wemo_devices/templates/main',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  


  return "<anchor class=\"refresh refresh_img headerControls\" role=\"button\" aria-label=\"Refresh Device List\"></anchor>\n<anchor class=\"edit edit_img headerControls\"></anchor>\n\n<div class=\"device_list_content\" id=\"device_scroller\">\n    <ul id=\"wemo_devices\" aria-label=\"Devices\"></ul>\n</div>\n<div id=\"footerComponent\" data-aura-widget=\"wemo_footer1\"></div>\n";
  });
Handlebars.registerPartial('widgets_wemo_devices_templates_main', t);
return t;
});
/* END_TEMPLATE */
;
/**
 * this module is a mixin to the devicelist. It contains all of the grouping/ordering functionality. Kept separate for sanity.
 */
define('widgets/wemo_devices/js/uiListMixin',[], function() {

    'use strict';

    /**
     * convert matrix to an array, duh.
     * @param  {string} str the matrix
     * @return {array}   the array
     */
    function matrixToArray(str) {
        return str.match(/(-?[0-9\.]+)/g);
    }

    var uuid = function() {
        /* var S4 = function() {
            return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
        }
        return (S4() + S4() + "-" + S4() + "-" + S4() + "-" + S4() + "-" + S4() + S4() + S4());*/
        return parseInt(Date.now() / 1000, 10);
    };

    var exports = {
        scaleUp: 1.00,
        /**
         * places the device element list item into the proper spot in the device list
         * @param  {JQuery DOM element} $li    the list item for the device
         * @param  {JSON Object} widget the device
         */
        insertDeviceElementInOrder: function($li, widget) {
            var thisIndex = 0;
            var maxOrder = 0;
            var found = false;
            var $list = this.$ul.find('li');
            var udn = widget.information.udn || widget.properties.groupID;
            if (!this.deviceOrder) {
                this.deviceOrder = {};
                this.deviceOrder[0] = udn;
                $li.attr({
                    'data-order': 0
                });

                this.$ul.append($li);
            } else {

                //find the widget in the deviceOrder list, if it isn't found, put it at the end
                if (this.deviceOrder[udn] === undefined) {
                    //get the max order value from the deviceOrder list, and go one higher.
                    _.each(this.deviceOrder, function(value) {
                        if (value > maxOrder) {
                            maxOrder = value;
                        }
                    });
                    this.deviceOrder[udn] = maxOrder + 1;
                }

                thisIndex = this.deviceOrder[udn];

                $li.attr({
                    'data-order': thisIndex
                });

            }

            if (thisIndex === 0 || $list.length === 0) {
                //if it is the first element, put it at the beginning
                this.$ul.prepend($li);
            } else {
                //check the list and find the proper place for it. first available element whose order < the index going backwards
                for (var i = thisIndex; i > -1; i--) {
                    if (found) {
                        break;
                    }
                    $list.each(function(index, item) {
                        var $item = $(item);

                        if ($item.data('order') < i) {
                            $item.after($li);
                            found = true;
                            return;
                        }
                    });

                }
                if (!found) {
                    //of there isn't one with a lower index, it goes at the beginning.
                    this.$ul.prepend($li);
                }
            }
        },
        /**
         * get the original order of devices, if one exists. Otherwise order as they are discovered.
         */
        getDeviceOrder: function() {
            var storedOrder = window.localStorage.getItem('deviceOrder');
            DEBUG && console.log("deviceOrder : " + JSON.stringify(storedOrder));

            if (storedOrder) {
                if (storedOrder.data) {
                    storedOrder = storedOrder.data;
                }
                this.deviceOrder = JSON.parse(storedOrder);
            }
        },
        /**
         * set the new order of devices after an order change
         */
        setDeviceOrder: function() {
            var self = this;
            this.deviceOrder = {};
            this.$el.find('li').each(function(index, item) {
                var $item = $(item);
                var udn = $item.data('udn');
                self.deviceOrder[udn] = index;
                $item.attr({
                    'data-order': index
                })
            });
            this.saveDeviceOrder();
        },
        /**
         * save the order that devices appear in the list.
         */
        saveDeviceOrder: function() {
            window.localStorage.setItem('deviceOrder', JSON.stringify(this.deviceOrder));
        },
        /**
         * saves the changed order to localstorage to maintain correct order
         * @param $li {DOM Element}
         */
        saveOrdering: function($li) {
            //TODO: write ordering logic
            this.setDeviceOrder();
            this.sandbox.emit('global.editing:stop');
        },
        /**
         * ui logic activates the drag and drop ordering
         */
        startOrdering: function() {
            var self = this;

            if (!this.hasPepped) {
                $.pep.toggleAll(true);
                this.hasPepped = true;
            }

            var $ul = $('#wemo_devices'),
                $li = $ul.children('li'),
                deviceHeight =  $(window).height(),
                $deviceList = $('#controller > .widget');

            $li.css('zIndex', '1');


            // Pep 'em
            $li.pep({
                place: false,
                axis: 'y',
                shouldEase: false,
                handle: '.order_device',
                cssEaseDuration: 0,
                droppable: 'li',
                initiate: function(ev, obj) {
                    obj.$movable = obj.$el;
                    obj.$el.addClass('grabbed').css('zIndex', 100);
                    var $li = $('#wemo_devices').children('li');
                    $li.css("-webkit-transform", "matrix(1, 0, 0, 1, 0, 0)");
                    $deviceList.css('overflow', 'hidden');

                    var height = obj.$el.outerHeight();
                    var zero = obj.$el.position().top + height / 2;
                    obj.otherNodes = [];
                    var nodes = $ul[0].childNodes;
                    obj.originalIndex = 0;

                    for (var i = 0; i < nodes.length; i++) {
                        if (nodes[i].nodeType != 1 || nodes[i] === obj.$el[0]) {
                            obj.originalIndex = i;
                            continue;
                        }
                        var t = nodes[i].offsetTop;
                        obj.otherNodes.push({
                            node: nodes[i],
                            pos: t + (t < zero ? nodes[i].offsetHeight : 0) - zero
                        });
                    }

                    obj.itemData = {
                        height: height,
                        percent: height * .5,
                        sandbox: self.sandbox.sandboxes[obj.$el.data('udn')],
                        isGrouping: false
                    };

                },
                start: function(ev, obj) {

                },
                drag: function(ev, obj) {
                    //1. calculate positions, height, etc for dragging element
                    var elTop = obj.$el.position().top;

                    var elBottom = parseInt(elTop, 10) + obj.itemData.height;
                    var activeTop, activeBottom;
                    var isGroupable = false;
                    var showGroupable = false;
                    var percent = obj.itemData.percent;

                    _.each(obj.activeDropRegions, function($element, index) {
                        //the dragging element is in the list, let's ignore that one
                        if ($element.data('udn') && (obj.$el.data('udn') !== $element.data('udn'))) {
                            //2. check to see if these two items are groupable to one another
                            if (obj.$el.data('groupable') && !$element.hasClass("grayedOut") && (obj.$el.data('groupable') === $element.data('groupable'))) {
                                isGroupable = true;
                            } else {
                                isGroupable = false;
                            }

                            //3. if top or bottom edge of dragging element is within 50% of the overlapping element, show the groupable icon
                            if (isGroupable) {
                                activeTop = $element.position().top;
                                activeBottom = activeTop + obj.itemData.height;

                                if ((elTop > (activeTop + percent) || elBottom > (activeTop + percent)) && elTop < (activeBottom - percent)) {
                                    //show the groupable icon 
                                    showGroupable = true;
                                    obj.$groupable = $element;
                                } else {
                                    //stop showing it
                                    showGroupable = false;
                                }

                                //4. when it is in the center, show groupable icon
                                if (showGroupable) {
                                    if (!obj.itemData.isGrouping) {
                                        obj.itemData.sandbox.emit('showGroupableIcon');
                                        obj.itemData.isGrouping = true;
                                    }
                                } else {
                                    if (obj.itemData.isGrouping) {
                                        obj.itemData.sandbox.emit('hideGroupableIcon');
                                        obj.itemData.isGrouping = false;
                                    }
                                }
                            }
                        }
                    });

                    var matrixMove = matrixToArray(obj.$el.css("-webkit-transform"));
                    var moveY = parseInt(matrixMove[5], 10);

                    _.each(obj.otherNodes, function(o) {
                        var off = 0;
                        var groupOffset = isGroupable ? 60 : 0;

                        if (o.pos < 0 && moveY < 0 && moveY < (o.pos - groupOffset)) {
                            off = 80
                        } else if (o.pos > 0 && moveY > 0 && moveY > (o.pos + groupOffset)) {
                            off = -80;
                        }

                        o.node.style.WebkitTransition = '-webkit-transform 200ms cubic-bezier(0.645, 0.045, 0.355, 1)';
                        o.node.style.webkitTransform = "matrix(1, 0, 0, 1, 0, " + off + ")";
                    });


                },
                stop: function(ev, obj) {
                    //4. if dropped in the center, group them.
                    if (obj.itemData.isGrouping) {
                        self.animateGrouping(obj);
                    } else {
                        //update order based on position.
                        self.animateOrdering(obj);
                    }

                    obj.$el.removeClass('grabbed').css('zIndex', 1);
                    var $li = $('#wemo_devices').children('li');
                    $li.find('.groupable').detach();
                    $li.css("-webkit-transition", 'none');
                    $li.css("-webkit-transform", "matrix(1, 0, 0, 1, 0, 0)");
                    $deviceList.css('overflow-y', 'auto');
                }
            });

            //for fix tile dragging on mobile devices
            $.pep.setMoveEvent = function(){
                $.each(this.peps, function(index, pepObj){
                    pepObj.isValidMoveEvent = function(ev){
                        return true;
                    };
                });
            };

            $.pep.setMoveEvent();

        },
        /**
         * animates the elements into new order
         * @param  {jQuery.Pep} obj Pep instance
         */
        animateOrdering: function(obj) {
            var $ul = $('#wemo_devices');
            var $li = $ul.children('li');

            $li.sort(function(a, b) {
                return ($(a).position().top - $(b).position().top)
            });
            $ul.append($li);
            var matrix = obj.matrixToArray(obj.matrixString());
            var x = -1 * matrix[4];
            var y = -1 * matrix[5];
            obj.moveToUsingTransforms(x, y);
        },
        /**
         * animates to fill the space left when a grouped object is removed from the list
         * @param  {jQuery.Pep} obj Pep instance
         */
        animateGrouping: function(obj) {
            var self = this;
            var $element = obj.$el;
            var $ul = $('#wemo_devices');
            var $li = $ul.children('li');

            //$el = the object being dropped
            //$groupable = the object being grouped-to

            //FINISHGROUPING:1. the object being dropped 'shrinks' into the $groupable.
            var udns = [];
            var $groupable = obj.$groupable;
            var toRemove;

            //FINISHGROUPING:2. determine if we already have a group widget. Only add new udn to the group. 
            if ($groupable.data('aura-widget') !== 'wemo_group') {
                udns.push($groupable.data('udn'));
            } else {
                toRemove = 'element';
            }

            if ($element.data('aura-widget') !== 'wemo_group') {
                udns.push($element.data('udn'));
            } else {
                toRemove = 'groupable';
            }

            var options = {
                obj: obj,
                udns: udns,
                toRemove: toRemove,
                groupOrder: $li.index($groupable)
            };

            this.finalizeGrouping(options);
        },
        /**
         * method that takes the DOM element information and uses it to systematically create groups based on udn.
         * @param  {JSON} options {obj (the Pep instance), udns(the udn array to group),toRemove (the element to remove from the list),groupOrder (where the new group should appear in the list)}
         * @return {[type]}         [description]
         */
        finalizeGrouping: function(options) {
            var self = this;
            var obj = options.obj;
            var udns = options.udns;
            var $groupable = obj.$groupable;
            var $element = obj.$el;
            var groupID = uuid();
            var groupOrder;
            //FINISHGROUPING:3

            groupOrder = $groupable.data('order');
            //a. if neither is a group, load group widget and remove both of them.
            if (udns.length === 2) {
                _.each(udns, function(udn) {
                    self.toGroup(self.sandbox.widgets[udn], {
                        groupID: groupID,
                        groupOrder: groupOrder,
                        groupCreate: true
                    });
                });

                $groupable.remove();
                $element.remove();

            } else if (udns.length === 1) {
                if (options.toRemove === 'groupable') {
                    var matrix = $groupable.css("transform");

                    $element[0].style.opacity = 1;
                    //when we are replacing groupable with element, element has to take groupable's place in the list
                    $element.detach();
                    $groupable.after($element);
                    $groupable.remove();
                    groupOrder = $groupable.data('order');
                    groupID = $element.data('udn');

                } else {
                    $element.remove();
                    groupOrder = $groupable.data('order');
                    groupID = $groupable.data('udn');
                }

                self.toGroup(self.sandbox.widgets[udns[0]], {
                    groupID: groupID,
                    groupOrder: groupOrder,
                    groupUpdate: true
                });
            }
            //d. if they are both groups, do we combine them???
            if (udns.length === 0) {
                var addToGroup = $groupable.data('udn');
                var removeFromGroup = $element.data('udn');

                groupOrder = $addToGroup.data('order');

                _.each(self.sandbox.sandboxes[removeFromGroup].view.sandboxes, function(childSandbox, udn) {
                    self.toGroup(self.sandbox.widgets[udn], {
                        groupID: addToGroup,
                        groupOrder: groupOrder,
                        groupUpdate: true
                    });
                });

                self.destroyGroup(removeFromGroup);
                $element.remove();
            }
        },
        /**
         * ui logic stops drag and drop ordering
         */
        stopOrdering: function() {
            this.hasPepped = false;
            $.pep.toggleAll(false);
        },
        /**
         * called via event when a new element is added to the list        while in editing mode, in order to show editing controls
         */
        resetEditing: function() {
            this.stopOrdering();
            this.startOrdering();
            this.delegateEvents();
        }
    };

    return exports;
});
define('widgets/wemo_devices/main',['libs/smartDevicePlugin', 'libs/cordovaPlugins/networkPlugin', 'text!widgets/wemo_devices/css/main.css', 'feature!demoDevices', 'plugins/xml2json', 'libs/pouchInterface', 'hbs!widgets/wemo_devices/templates/main','widgets/wemo_devices/js/uiListMixin', 'libs/constants'],
    /** @exports device list controller for android */
    function(SmartDevicePlugin, networkPlugin, css, demoDevices, XmlJson, pouchInterface, template, uiListMixin, constants) {

        'use strict';

        window.isSmartCache = true;

        //CONSTANTS
        var editDevice = 'wemo_edit_device',
            firmwareUpdate = 'wemo_firmwareupdate',
            tutorialController = 'wemo_tutorials',
            overTemp = 'wemo_overtemp',
            whatIsNew = 'wemo_whatisnew',
            notificationPopup = 'wemo_notification_popup',
            bridgePopup = 'wemo_bridge_popup';

        var bridgeManager = {};

        /**
         * Helper method to parse the udn and get the device type
         * @param   {string} udn [udn of devices]
         * @returns {string} type [device type]
         */
        function parseudn(udn) {
            udn = udn.replace(/uuid:/gi, '');
            var type = udn.split('-')[0].toLowerCase();
            return type;
        }

        var exports = {
            type: 'Backbone',
            hasPepped: false,
            jardenDeviceArray: ['heatera', 'heaterb', 'humidifier', 'humidifierb', 'airpurifier', 'coffeemaker', 'crockpot'],
            jardenDeviceCount: 0,
            template: template,

            events: {
                'click .edit_device': 'editDevice',
                'click .edit_group': 'editGroup'
            },
            /**
             * starts the process
             */
            initialize: function() {
                _.bindAll(this);

                var self = this;

                /**refresh vars**/
                this.isRefreshing = false;
                this.refreshTimeoutLength = 10000;
                this.refreshTimeout = setTimeout(function() {}, 0);


                this.styles = css.replace(/\.\.\//g, this.sandbox.path + '/');
                this.stylesheet = new this.sandbox.util.Stylesheet(this.name, this.styles);

                /* widget event is fired by widget.js in aura framework */
                this.sandbox.widgets = {};
                this.sandbox.sandboxes = {};
                this.sandbox.view = this;
                this.children = {};

                // set listeners
                this.renderView();
                this.listen();

                this.getDeviceOrder();
                //use static list, or don't.
                if (!demoDevices) {
                    SmartDevicePlugin.getDevices().then(self.getDevices).fail(self.failHandler);
                    this.setNetworkInformation();
                } else {
                    window.hasDemoDevices = true;

                    if (demoDevices[0].information.deviceCount) {
                        for (var i = 1; i < demoDevices[0].information.deviceCount; i++) {
                            var newDemoDevice = $.extend(true, {}, demoDevices[0]);
                            newDemoDevice.information.udn = i;
                            demoDevices.push(newDemoDevice);
                        }
                    }

                    this.getDevices(demoDevices);
                }

                this.loadChildWidget({
                    $el: this.$mainContainer,
                    widgetName: editDevice
                });

                this.loadChildWidget({
                    $el: this.$mainContainer,
                    widgetName: overTemp
                });

                this.loadChildWidget({
                    $el: this.$mainContainer,
                    widgetName: tutorialController
                });

                this.loadChildWidget({
                    $el: this.$mainContainer,
                    widgetName: firmwareUpdate
                });

                this.loadBridgeSkillNotification();




                if (!window.localStorage.getItem("firstTimeLoadAlexa")) {
                    if (!window.sessionStorage.getItem("bannerHappenTime")) {
                        this.loadBlueBanner();
                    } else {
                        var bannerHappenTime = parseInt(window.sessionStorage.getItem("bannerHappenTime")),
                            actualDate = new Date(),
                            actualTime = actualDate.getTime();
                        if (actualTime > bannerHappenTime) {
                            this.loadChildWidget({
                                $el: this.$mainContainer,
                                widgetName: whatIsNew
                            });
                        }
                    }
                } else {
                    var showAlexaPopup = (window.localStorage.getItem('showAlexaPopup') === 'true');

                    if (showAlexaPopup) {
                        this.loadSkillNotification();
                    }
                }

                this.showReachabilityMsg();

                // initiate App recovery mechanism
                SmartDevicePlugin.initiateAppRecovery().then(self.appRecovered).fail(self.failHandler);

                //Set tab for back button in more menu
                window.sessionStorage.setItem("ACTIVE_TAB", "DEVICES");
                if(window.sessionStorage.getItem("send_email")){
                    SmartDevicePlugin.collectEmailId();
                    window.sessionStorage.setItem("send_email", false);
                }
            },
            loadBlueBanner: function(){
                var self =  this;
                var formatDate = function(happenDate) {
                    var day = parseInt(happenDate.slice(0, 2)),
                        month = parseInt(happenDate.slice(2, 4)),
                        year = parseInt(happenDate.slice(4, 8));
                    return new Date(year+" "+month+" "+day);
                };

                var url = "http://edge.xwemo.com/promos.txt";
                if (constants.cloudLink && constants.cloudLink.match(/stagapi/gi)) {
                    url = "http://fwstag.xwemo.com/promos.txt";
                }

                $.ajax({
                    url: url,
                    type: "POST",
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                    },
                    success: function(data) {
                        DEBUG && console.log("success callback from cloud: " + JSON.stringify(data));
                        var appVersion = window.localStorage.getItem("appVersion");
                        data = JSON.parse(data);
                        //if (data[appVersion] && data[appVersion].length === 8) {
                           /* var actualDate = new Date(),
                                actualTime = actualDate.getTime(),
                                happenDate = formatDate(data[appVersion]),
                                happenTime = happenDate.getTime(),*/
                               var skillVisibility = data['DimmerSkillVisible'];

                           // window.sessionStorage.setItem("bannerHappenTime", happenTime);
                            if(parseInt(skillVisibility) === 1){
                                window.localStorage.setItem("dimmerAlexaSkill", true);
                            } else {
                                window.localStorage.removeItem("dimmerAlexaSkill");
                            }

                            //commented below to hide the blue banner code
                            /*if (actualTime > happenTime) {
                                self.loadChildWidget({
                                    $el: self.$mainContainer,
                                    widgetName: whatIsNew
                                });
                            }*/
                       // }
                    },
                    error: function(jqXHR, textstatus) {
                        //if fail, don't show the blue banner
                        DEBUG && console.log("failure callback from cloud:: jqXHR.status ::" + jqXHR.status + " response" + jqXHR.responseText);
                    }
                });

            },
            /**
             * trigger when device list page load and there is not internet or disableld remote
             * when they are in remote mode
             *
             */
            showReachabilityMsg: function() {
                var isNetworkenabledKey = window.sessionStorage.getItem("isNetworkenabledKey");
                var disableRemoteInRemoteMode = window.sessionStorage.getItem("disableRemoteInRemoteMode") === "true" ? true : false;
                var noLocalDevice = $("#wemo_devices > li").length - $('#wemo_devices .notAvailableBg').length < 1 ? true : false;

                if (isNetworkenabledKey === "false") {
                    this.sandbox.emit("global.showReachabilityMsg");
                } else if (isNetworkenabledKey === "true" && disableRemoteInRemoteMode && noLocalDevice) {
                    //                    this.sandbox.emit("global.showRemoteDisabledMsg");
                }
            },
            triggerEdit: function() {
                this.sandbox.emit('global.editing');
            },
            /**
             * trigger the edit device widget with the sandbox being edited
             * @param  {DOM element} e DOM element that was clicked on
             */
            editDevice: function(e, isGroup) {
                var $el = $(e.currentTarget).closest('li[data-udn]');
                var udn = $el.data('udn');

                var deviceOptions = {
                    sandbox: this.sandbox.sandboxes[udn],
                    isGroup: isGroup
                };

                if (this.sandbox.sandboxes[udn].config && this.sandbox.sandboxes[udn].config.edit) {
                    deviceOptions.edit = this.sandbox.sandboxes[udn].config.edit;
                }

                if (isGroup && (this.sandbox.sandboxes[udn].config && this.sandbox.sandboxes[udn].config.groupEdit)) {
                    deviceOptions.groupEdit = this.sandbox.sandboxes[udn].config.groupEdit;
                }
                this.children[editDevice].sandbox.emit('edit:start', deviceOptions);
            },
            editGroup: function(e) {
                this.editDevice(e, true);
            },
            createGroup: function(udn) {
                if (this.sandbox.sandboxes[udn].config && this.sandbox.sandboxes[udn].config.groupEdit) {
                    deviceOptions.groupEdit = this.sandbox.sandboxes[udn].config.groupEdit;
                }
                var deviceOptions = {
                    sandbox: this.sandbox.sandboxes[udn],
                    isGroup: true,
                    createGroup: true
                };
                this.children[editDevice].sandbox.emit('edit:start', deviceOptions);
            },
            /**
             * render the device list specific buttons/icons to the screen
             * @param {jQuery DOM element} $el element to render the view to
             */
            renderView: function() {
                var self = this;
                var html = template;

                this.$el.append(html);
                this.moveHeaderControlsButton("#headerComponent .controls");
                this.$ul = this.$('ul');
                $('.refresh').on('click', function() {
                    self.refreshDeviceList();
                });

                $('.edit').on('click', function() {
                    self.triggerEdit();
                    self.onEditing();
                    $('#lookingForDevices').hide();
                });

                this.$mainContainer = $("#mainContainer");

                //load the device list footer. wemo 1.x
                this.sandbox.start(this.$el, {
                    name: 'wemo_footer',
                    childWidget: true
                });
            },
            /**
             * action to refresh the device list - do 'getDevices' again
             */
            refreshDeviceList: function() {
                var self = this;

                /* show spinner over refresh button */
                $('#headerComponent .refresh_img').addClass('spinning');
                $(".tile3 .powerState").removeClass("transitioning");
                this.jardenDeviceCount = 0;
                if (!demoDevices) {
                    //this doesn't wait for a callback. instead, it sets a flag and a timeout
                    this.isRefreshing = true;
                    this.refreshTimeout = setTimeout(function() {
                        self.refreshDeviceListComplete();
                    }, this.refreshTimeoutLength);

                    //added timeout for fixing remote mode spinner animation
                    setTimeout(function() {
                        SmartDevicePlugin.refreshDevices();
                    }, 100);
                } else {
                    this.refreshTimeout = setTimeout(function() {
                        self.refreshDeviceListComplete();
                    }, this.refreshTimeoutLength);
                }
            },
            /**
             * method to reset the device list
             * @param  {JSON array} resp [array of devices from native]
             */
            refreshDeviceListComplete: function(resp) {
                var self = this;
                setTimeout(function() {
                    $('#headerComponent .refresh_img').removeClass('spinning');
                    self.isRefreshing = false;
                }, 2000);
                clearTimeout(this.refreshTimeout);
            },
            /**
             * attach the refresh button to the header.
             * @param  {JQuery element} $el the element to attach to
             */
            moveHeaderControlsButton: function(el) {
                var $el = $(el);
                var self = this;
                if ($el.length > 0) {
                    this.$('.headerControls').detach().prependTo($el);
                } else {
                    setTimeout(function() {
                        self.moveHeaderControlsButton(el);
                    }, 10);
                }
            },
            /**
             * set listeners for the controller
             */
            listen: function() {
                var self = this;

                var windowListeners = {
                    onDeviceAdded: function(str) {
                        var resp = str;
                        if (typeof str === 'string') {
                            resp = JSON.parse(str);
                        }
                        self.addDevice(resp);
                    },
                    onDeviceUpdated: function(str) {
                        //sends status changes for specific device, emits and event to the correct sandbox for it to catch and react to
                        var resp = str;
                        if (typeof str === 'string') {
                            resp = JSON.parse(str);
                        }
                        self.updateDevice(resp);
                    },
                    onDeviceRemoved: function(str) {
                        DEBUG && console.log('deviceRemoved');
                        //sends status changes for specific device, emits and event to the correct sandbox for it to catch and react to
                        var resp = str;
                        if (typeof str === 'string') {
                            resp = JSON.parse(str);
                        }
                        self.removeDevice(resp);
                    },
                    onGroupRemoved: function(str) {
                        DEBUG && console.log('groupRemoved');
                        //sends status changes for specific device, emits and event to the correct sandbox for it to catch and react to
                        var resp = str;
                        if (typeof str === 'string') {
                            console.log("GroupId" + JSON.parse(str));
                            resp = JSON.parse(str);
                        }
                        self.removeGroup(resp);
                    },
                    onGroupUpdated: function(groupID, str) {
                        var resp = str;
                        if (typeof str === 'string') {
                            resp = JSON.parse(str);
                        }
                        if (!resp.information) {
                            resp.information = {};
                        }
                        resp.information.udn = groupID;
                        self.updateDevice(resp);
                    },
                    onSetRemote: function(isRemote) {
                        DEBUG && console.log('On set remote');
                        if (isRemote === "true") {
                            window.sessionStorage.setItem('isRemote', 'true');
                            window.sessionStorage.setItem('isLocal', 'false');
                        } else {
                            window.sessionStorage.setItem('isRemote', 'false');
                            window.sessionStorage.setItem('isLocal', 'true');
                        }
                    },
                    /**
                     * fired when bridge is finished getting status of bulbs
                     */
                    onGetZigbeeStatusDone: function(bridgeUDN) {
                        self.sandbox.emit('global.getZigbeeStatusDone', bridgeUDN);
                    },
                    /**
                     * resets the device list back to empty.
                     */
                    onReset: function() {
                        self.resetList();
                    },
                    onNestDeauth:function(){
                        self.confirmDialog = new self.sandbox.dom.CustomModal({
                            title: "Nest Deauthorized",
                            message: "Your Wemo connection to Nest has been deauthorized. Your Nest Thermostats and associated rules have been removed from your Wemo apps. To reconnect, go to the More tab",
                            popupClass: 'nestErrorPopup',
                            buttons: [{
                                text: "Ok",
                                extraClass: "passiveBtn",
                                width: "100%"
                            }]
                        });
                        window.sessionStorage.setItem("nest_auth", "403");
                        window.sessionStorage.removeItem("hasNest");
                        SmartDevicePlugin.refreshDevices();
                    }
                };

                if (!window.smartDevicePlugin) {
                    window.smartDevicePlugin = {};
                }

                _.extend(window.smartDevicePlugin, windowListeners);

                self.sandbox.on('widget', function(children, options) {
                    //need to check visibilty once footer is loaded
                    if (options.name === 'wemo_footer') {
                        self.updateFooterVisibility();
                    }

                    children.forEach(function(child) {
                        if (options.childWidget) {
                            if(!!options.name && self.children[options.name]){
                                // captures the sandbox for the widget
                                self.children[options.name].sandbox = child;
                                self.children[options.name].sandbox.parentSandbox = self.sandbox;
                            }
                        } else if (options.properties.groupID) {
                            //captures the wemo_group sandbox
                            self.sandbox.sandboxes[options.properties.groupID] = child;
                        } else if (options.information.udn) {
                            //captures the sandbox for each device
                            self.sandbox.sandboxes[options.information.udn] = child;
                            self.sandbox.emit('global.deviceAdded', self.sandbox.widgets[options.information.udn], self.sandbox.widgets);
                        }
                    });
                });

                self.sandbox.on('createGroup', self.createGroup);
                self.sandbox.on('editGroup', this.editDevice);
                self.sandbox.on('finishGroup', this.finishGroupChange);

                self.sandbox.on('ungroupSandbox', self.fromGroup);
                self.sandbox.on('destroyGroupSandbox', self.destroyGroup);

                self.sandbox.on('global.editing:stop', function() {
                    self.setIsEditing(false);
                    self.removeBackButtonCommand({
                        key: 'stopEditing'
                    });

                    self.stopOrdering();
                    //self.$('.refresh-container').show();
                    //self.$('#wemo_devices').css('marginBottom', '0px');
                });

                self.sandbox.on('global.drawer:open', function() {
                    self.isDrawerOpen = true;
                });

                self.sandbox.on('global.drawer:close', function() {
                    self.isDrawerOpen = false;
                });

                self.sandbox.on('global.editing:save', this.saveOrdering);
                //occurs when new widget is added while editing. method is in uiListMixin.
                self.sandbox.on('global.editing:reset', this.resetEditing);
                self.sandbox.on('global.onNetworkChanged', this.setNetworkInformation);
                self.sandbox.on('global.resetAllClearDevice', this.resetAllClearDevice);
            },


            resetAllClearDevice : function(resp) {
                DEBUG && console.log("resetAllClearDevice" + resp.udn);
                if (resp.udn) {
//                    if(this.sandbox.sandboxes[resp.udn].view.drawerView){
//                        this.sandbox.sandboxes[resp.udn].view.drawerView.$el.remove();
//                    }
//                    this.sandbox.sandboxes[resp.udn].view.$el.remove();
                    delete this.sandbox.widgets[resp.udn];
                    delete this.sandbox.sandboxes[resp.udn];
                    this.sandbox.emit('global.deviceRemoved', resp, this.sandbox.widgets);
                }
            },
            /**
             * remove a device from the list
             * @param  {JSON} resp ex: {udn:udn}
             */
            removeDevice: function(resp) {
                var sandbox = this.findSandbox(resp.udn),
                    fwUpdateInProgress = this.sandbox.util.storage.getItem('firmwareUpdateInProgress');

                if (fwUpdateInProgress === "true") {
                    var updateCollection = this.children[firmwareUpdate].sandbox.collection;
                    var thisDevice = updateCollection.findWhere({
                        udn: resp.udn
                    });
                } else {
                    thisDevice = false;
                }

                DEBUG && console.error('REMOVING DEVICE:' + JSON.stringify(resp) + ':' + thisDevice);
                //don't remove devices completely that are in the middle of a FW update.
                //this stems from a FW defect for Crockpot and Lightswitch
                if (!thisDevice) {
                    if (sandbox.location === 'root') {
                        if(this.sandbox.sandboxes[resp.udn].view.drawerView){
                            this.sandbox.sandboxes[resp.udn].view.drawerView.$el.remove();
                        }
                        this.sandbox.sandboxes[resp.udn].view.$el.remove();
                        delete this.sandbox.widgets[resp.udn];
                        delete this.sandbox.sandboxes[resp.udn];
                        this.sandbox.emit('global.deviceRemoved', resp, this.sandbox.widgets);
                    } else if (sandbox.location === 'group') {
                        sandbox.parent.emit('remove', this.sandbox.widgets[resp.udn]);
                    } else if (sandbox.location === 'bridge') {
                        delete this.bridgeManager[resp.udn];
                        this.setBridgeInformation();
                    }
                }

                DEBUG && console.error('REMOVING DEVICE:' + JSON.stringify(resp));
            },
            removeGroup: function(resp) {
                 DEBUG && console.error('REMOVING Group:' + JSON.stringify(resp));
            //                sandbox.parent.emit('remove', this.sandbox.widgets[resp.groupID]);
                    delete this.sandbox.sandboxes[resp.groupID];
            },

            findSandbox: function(udn) {
                var sandbox;
                if (this.sandbox.sandboxes[udn]) {
                    sandbox = {
                        sandbox: this.sandbox.sandboxes[udn],
                        location: 'root'
                    };
                }

                if (!sandbox) {
                    _.each(this.sandbox.sandboxes, function(groupSandbox) {
                        //if it is, send the update response to that group.
                        if (groupSandbox.sandboxes && groupSandbox.sandboxes[udn]) {
                            sandbox = {
                                sandbox: groupSandbox.sandboxes[udn],
                                location: 'group',
                                parent: groupSandbox,
                                groupMasterSandbox: groupSandbox.groupMasterSandbox
                            };
                        }
                    });
                }

                if (!sandbox) {
                    if (this.bridgeManager && this.bridgeManager[udn]) {
                        sandbox = {
                            sandbox: this.bridgeManager[udn],
                            location: 'bridge'
                        }
                    }
                }

                if (!sandbox) {
                    sandbox = {};
                }

                return sandbox;
            },
            /**
             * add a device to the list
             * @param {JSON} resp the device object
             */
            addDevice: function(resp) {

                DEBUG && console.log('smartDevicePlugin: onDeviceAdded:' + JSON.stringify(resp));

                if (!this.sandbox.sandboxes[resp.information.udn]) {
                    this.toDeviceList(resp, 'add');
                } else {
                    this.toDeviceList(resp, 'update');
                }
            },
            /**
             * update a device in the list
             * @param {JSON} resp the device object
             */
            updateDevice: function(resp) {
                var isFound = false;
                var self = this;
                var keepGoing = true;

                if (this.isRefreshing) {
                    this.refreshDeviceListComplete();
                }
                DEBUG && console.log('smartDevicePlugin: onDeviceUpdated: ' + JSON.stringify(resp));

                if (resp.information && resp.information.udn) {
                    keepGoing = this.updateGroupComposition(resp);
                } else {
                    DEBUG && console.error('updateDevice:no udn:' + JSON.stringify(resp));
                    keepGoing = false;
                }

                if (keepGoing) {
                    //push to the end of execution stack to avoid possible race condition.
                    setTimeout(function() {
                        self.sandbox.emit('deviceUpdated', resp);
                        //the udn in question is part of a group
                        if (resp.properties && resp.properties.groupID && self.sandbox.sandboxes[resp.properties.groupID]) {
                            self.updateGroup(self.sandbox.sandboxes[resp.properties.groupID], resp);
                            isFound = true;
                            //the device is a bridge
                        } else if (resp.information.udn.match(/:bridge/gi)) {
                            self.setBridgeInformation(resp);
                            isFound = true;
                            //a regular, ungrouped device or a master group widget
                        } else if (self.sandbox.sandboxes[resp.information.udn]) {
                            self.updateSandbox(self.sandbox.sandboxes[resp.information.udn], resp);
                            isFound = true;

                            if (window.localStorage.getItem('notify_skill') !== 'true') {
                                self.checkShowSkillInfo.call(self, resp.information.udn);
                            }
                        }

                        if (!isFound) {
                            self.toDeviceList(resp, 'add');
                        }
                    }, 0);

                }
            },
            updateGroup: function(sandbox, resp) {
                var self = this;
                if (sandbox.emit) {
                    sandbox.emit('deviceUpdated', resp);
                    window.smartDevicePlugin.onDeviceChanged(resp.properties.groupID, {
                        success: 'true',
                        onDeviceUpdated: true
                    });
                } else {
                    setTimeout(function() {
                        self.updateGroup(sandbox, resp);
                    }, 10);
                }
            },
            updateSandbox: function(sandbox, resp) {
                var self = this;
                if (sandbox.emit) {
                    sandbox.emit('deviceUpdated', resp);
                    window.smartDevicePlugin.onDeviceChanged(resp.information.udn, {
                        success: 'true',
                        onDeviceUpdated: true
                    });
                } else {
                    setTimeout(function() {
                        self.updateSandbox(sandbox, resp);
                    }, 10);
                }
            },
            /**
             * when doing onDeviceUpdated, we need to see if the group has been created or broken apart from another app.
             * compare the incoming properties with the current properties and take appropriate action
             * @param  {JSON} resp device response
             */
            updateGroupComposition: function(resp) {
                var incomingGroup = false;
                var existingGroup = false;
                var keepGoing = true;
                var udn = resp.information.udn;
                var sandbox = this.findSandbox(udn);

                //1. find the sandbox
                //see if its in a group already
                if (sandbox.location === 'group') {
                    existingGroup = true;
                }

                //not found or a bridge, we're done.
                if (!sandbox.location || sandbox.location === 'bridge') {
                    return true;
                }

                //2. are we adding it to a group now?
                if (resp.properties && resp.properties.groupID) {
                    incomingGroup = true;
                }

                //3. if it was added to the group, we need to move it there.
                if (incomingGroup && !existingGroup) {
                    this.removeDevice(resp.information);
                    this.toDeviceList(resp, 'add');
                    keepGoing = false;
                }
                //4. or we need to take it out
                else if (existingGroup && !incomingGroup) {
                    sandbox.parent.view.ungroupSandboxes([resp.information.udn]);
                    keepGoing = true;
                }

                //DEBUG && console.warn('updateGroupComposition:' + JSON.stringify(resp) + ':incoming:' + incomingGroup + ':existing:' + existingGroup);

                return keepGoing;
            },
            /**
             * set the vaue of the isEditing state.
             * @param {boolean} boolean flag for editing state
             */
            setIsEditing: function(boolean) {
                this.isEditing = boolean;
            },
            onEditing: function() {
                var self = this;

                self.addBackButtonCommand({
                    key: 'stopEditing',
                    callback: function() {
                        self.sandbox.emit('global.editing:stop');

                    }
                });

                self.$("ul#wemo_devices").css('marginBottom', '140px');
                self.setIsEditing(true);
                setTimeout(function() {
                    self.delegateEvents();
                    self.startOrdering();
                }, 1000);
            },
            /**
             * gets the list of cached devices when webview is ready to receive them, iterates and passes to main deviceList method
             */
            getDevices: function(resp) {
                var self = this,
                    hasDimmer = false;

                if (typeof resp === 'string') {
                    resp = JSON.parse(resp);
                }
                resp.forEach(function(device) {
                    var properties = device.properties;
                    if (!self.sandbox.sandboxes[device.information.udn] && properties.hide !== '1') {

                        if (device.attributes.binaryState === "" && properties && properties.groupID === "") {
                            device.attributes.binaryState = properties.state;
                        }

                        self.toDeviceList(device, 'add');

                        if (window.localStorage.getItem('notify_skill') !== 'true') {
                            self.checkShowSkillInfo.call(self, device.information.udn);
                        }
                    }
                });

                this.sandbox.uiInterface.hideSpinner();
            },
            checkShowSkillInfo: function(udn) {
                var self = this,
                    skillMsgNotDisplayed = (window.localStorage.getItem('notify_skill') !== 'true'),
                    notificationDisplay = (window.sessionStorage.getItem('notification_display') !== 'true'),
                    whatIsNewDisplay = (window.sessionStorage.getItem('whatIsNew_display') !== 'true'),
                    showAlexaPopup = (window.localStorage.getItem('showAlexaPopup') === 'true');

                if ( skillMsgNotDisplayed) {
                    if (udn.match(/dimmer/gi)) {
                        if (showAlexaPopup) {
                            if (notificationDisplay && whatIsNewDisplay) {
                                this.loadSkillNotification();
                            }
                        } else {
                             SmartDevicePlugin.getUUID(function(uuid){
                            SmartDevicePlugin.getRemoteAccess(function(responseAry){
                                    var homeId = responseAry[3];
                                SmartDevicePlugin.getAnalyticsData(function(appdata){
                                        var urlStr = constants.cloudAPI.SMARTDEVICE_LIST + homeId + "?smartUniqueId=" + uuid + "&appData=" + escape(appdata);
                                        window.cordova.exec(
                                            function(params) {
                                                var authCode = params[0];
                                                DEBUG && console.log("authCode: " + authCode + " urlStr: " + urlStr);
                                                $.ajax({
                                                    url: urlStr,
                                                    type: "GET",
                                                    beforeSend: function(xhr) {
                                                        xhr.setRequestHeader('Content-Type', 'application/xml');
                                                        xhr.setRequestHeader('Authorization', authCode);
                                                    },
                                                    timeout: constants.timeout.URL_TIMEOUT_SMARTDEVICE_LIST,
                                                    success: function(data) {
                                                        var hasAlexa = false;
                                                        DEBUG && console.log("smartDevicesOnCloud Success from cloud...");
                                                        $(data).find('smartDevice').each(function() {
                                                            var device_desc = $(this).find("description").text();

                                                            if (device_desc.match(/amazonecho/gi)) {
                                                                hasAlexa = true;
                                                                window.localStorage.setItem('showAlexaPopup', 'false');
                                                                return;
                                                            }
                                                        });
                                                        if (!hasAlexa && notificationDisplay && whatIsNewDisplay) {
                                                            self.loadSkillNotification();
                                                        }
                                                    },
                                                    error: function(jqXHR, textstatus) {
                                                        //if fail, don't show the blue banner
                                                        DEBUG && console.log("failure callback from cloud:: jqXHR.status ::" + jqXHR.status + " response" + jqXHR.responseText);
                                                    }
                                                });
                                            },
                                            function(){
                                                DEBUG && console.log("error callback from getAuthCode");
                                            },
                                            "WebServicePlugin", "getAuthCode", []);
                                        });
                                });
                            });
                        }
                    }
                }
            },
            loadSkillNotification: function() {
               var dimmerSkill = (window.localStorage.getItem('dimmerAlexaSkill') === 'true');

                if (window.localStorage.getItem('notify_skill') !== 'true') {
                    if (!$('#menuComponent').hasClass('show')) {
                        window.sessionStorage.setItem('notification_display', 'true');
                        window.localStorage.setItem("bridge_Popup_Present", "true");
                        if(dimmerSkill){
                            this.loadChildWidget({
                                $el: $("#startWidget"),
                                widgetName: notificationPopup
                              });
                            }
                    }

                }
            },

            loadBridgeSkillNotification: function(){
                var self = this;
              if(window.localStorage.getItem('Bridge_skill') !== 'true'){

                 SmartDevicePlugin.checkBohnjour(function(){
                  DEBUG && console.log("checkbohnjour success callback");
                    self.loadBohnjourSkill();
                    window.localStorage.setItem("bridge_Popup_Present", "true");

                 });


              }
            },

            loadBohnjourSkill: function(){
               this.loadChildWidget({
                     $el: $("#startWidget"),
                     widgetName: bridgePopup
               });
            },
            /**
             * Matches the udn against the array of jarden devices, if so then decrements the global count
             * @param {String } udn [udn of device]
             */
            checkForJardenDeviceRemoved: function(udn) {
                var type = parseudn(udn);
                if (_.contains(this.jardenDeviceArray, type)) {
                    this.jardenDeviceCount--;
                }
                this.updateFooterVisibility();
                if (type.match(/heater/gi)) {
                    window.sessionStorage.setItem('HEATER_EXISTS', false);
                }
            },
            /**
             * Matches the udn against the array of jarden devices, if so then increments the global count
             * @param {String } udn [udn of device]
             */
            checkForJardenDeviceAdded: function(udn) {
                if (typeof udn !== 'number') {
                    var type = parseudn(udn);
                    if (_.contains(this.jardenDeviceArray, type)) {
                        this.jardenDeviceCount++;
                    }
                    this.updateFooterVisibility();
                    if (type.match(/heater/gi)) {
                        window.sessionStorage.setItem('HEATER_EXISTS', true);
                    }
                }
            },
            /**
             * checks for Jarden device count in order to show/hide footer tabs
             */
            updateFooterVisibility: function() {
                var deviceListCount = _.size(this.sandbox.sandboxes),
                    isFooterVisible = $('.optContainer').hasClass('showTabs'),
                    $footer = $("#footerComponent");

                if (deviceListCount === this.jardenDeviceCount) {
                    this.sandbox.emit('global.hideTabs');
                    $footer.addClass('hideForJarden');
                } else if (!isFooterVisible) {
                    this.sandbox.emit('global.showTabs');
                    $footer.removeClass('hideForJarden');
                }

            },
            /**
             * creates the widget object that framework uses to load a device widget
             * @param {JSON Object} device
             * @return {JSON Object} widget the widget the framework will load
             */
            setWidget: function(device) {

                if (device.information.modelName && !device.information.modelCode) {
                    device.information.modelCode = device.information.modelName
                }

                /** this is SO AWESOME! Thanks, FW! **/
                if (device.information.modelCode === 'Gardenspot RGB') {
                    device.information.modelCode = 'LIGHTIFY Gardenspot RGB';
                } else if (device.information.modelCode === 'Classic A60 TW') {
                    device.information.modelCode = 'LIGHTIFY A19 Tunable White';
                } else if (device.information.modelCode === 'Flex RGBW') {
                    device.information.modelCode = 'LIGHTIFY Flex RGBW';
                }

                if (!device.information.productType) {
                    device.information.productType = device.information.modelCode;
                }

                var widgetToLoad = 'wemo_' + device.information.productType.toLowerCase();
                if (widgetToLoad.match(/heater/gi)) {
                    widgetToLoad = 'wemo_heatera';
                } else if (widgetToLoad.match(/netcam/gi)) {
                    widgetToLoad = 'wemo_netcamsensor';
                }

                if((device.information.modelName === "socket" || device.information.modelCode === "socket") && device.information.hwVersion === "v2"){
                    widgetToLoad = "wemo_mini"
                }

                DEBUG && console.log('Product type is: ' + device.information.productType + ', widgetToLoad is: ' + widgetToLoad);

                var widget = _.extend(device, {
                    component: {
                        url: 'widgets/' + widgetToLoad + '/main.js'
                    }
                });

                widget.information.widgetToLoad = widgetToLoad;
                this.sandbox.widgets[device.information.udn] = widget;

                if (!device.information.productType || device.information.productType.length === 0) {
                    throw ('NO MODEL NAME SET FOR DEVICE:' + JSON.stringify(device.information));
                }

                return widget;
            },
            /**
             * resets the device list back to empty
             */
            resetList: function() {
                this.$('ul').empty();
                this.sandbox.sandboxes = {};
                this.sandbox.widgets = {};
                this.sandbox.emit('global.reset');
            },
            /**
             * event is fired when device is added
             * @param resp {object}
             * @param fromCache {boolean}
             */
            toDeviceList: function(resp, action) {
                var device = resp;
                var self = this;

                //self.triggerMenuChange();
                if (!device.information.udn.match(/:bridge/gi)) {
                    if ((action === 'cache' && !self.sandbox.sandboxes[device.information.udn]) || action === 'add') {
                        var widget = self.setWidget(device);

                        if (device.properties.groupID) {
                            self.toGroup(widget);
                        } else {
                            self.toList(widget);
                        }
                    } else if (action === 'update') {
                        self.updateDevice(device);
                    }
                } else {
                    self.setBridgeInformation(device);
                }
            },
            toList: function(widget) {
                this.sandbox.sandboxes[widget.information.udn] = {};
                this.render(widget);
                this.checkForJardenDeviceAdded(widget.information.udn);
            },
            /**
             * either sends command to create a new group from the widget, or to add a widget to an existing group
             * @param  {JSON} widget the device information to convert to a ui control
             * @param  {JSON} device
             */
            toGroup: function(widget, options) {
                var self = this;
                options = options || {};

                _.extend(widget.properties, options);

                //if we have a defined order, put the group tile in the right spot
                //if we have a defined order, put the group tile in the right spot
                if (widget.properties.groupOrder !== undefined) {
                    self.deviceOrder[widget.properties.groupID] = widget.properties.groupOrder;
                }

                if (self.sandbox.sandboxes[widget.properties.groupID]) {
                    //add to the existing group
                    self.emitWidgetToGroup(widget);
                    self.checkForJardenDeviceAdded(widget.information.udn);
                } else {
                    //this device is part of a group. use jquery extend because it does a true object clone.
                    var groupWidget = $.extend(true, {}, widget, {
                        component: {
                            url: 'widgets/wemo_group/main.js'
                        },
                        properties: {
                            groupType: widget.information.modelCode
                        },
                        information: {
                            widgetToLoad: 'wemo_group',
                            udn: widget.properties.groupID
                        }
                    });

                    self.sandbox.sandboxes[widget.properties.groupID] = {};
                    self.render(groupWidget);

                    //widget is not yet created, add to the temp store and loop

                    self.emitWidgetToGroup(widget);
                }
            },
            /**
             * fires an event to add a widget to the parent wemo_group widget only once the group has been added to the sandbox.
             * @param  {JSON} widget    the widget to add to the group
             * @param  {string} groupName the indentifier for the group
             */
            emitWidgetToGroup: function(widget) {
                var self = this;
                var groupID = widget.properties.groupID;
                if (self.sandbox.sandboxes[groupID]) {
                    if (self.sandbox.sandboxes[groupID].ref) {
                        //widget is created, we can pass this widget to it
                        widget.information.widgetToLoad = 'wemo_lighting';
                        self.sandbox.sandboxes[groupID].emit('add', widget);
                    } else {
                        //widget is not yet created, loop within this method until it is available.
                        setTimeout(function() {
                            self.emitWidgetToGroup(widget);
                        }, 50);
                    }
                }
            },
            /**
             * remove a widget from a group. called by event from wemo_group widget.
             * @param  {string} udn unique id to remove from group and place in device list
             */
            fromGroup: function(udn) {
                var widget = this.sandbox.widgets[udn];
                if (widget.properties.groupID) {
                    widget.properties.groupID = null;
                }

                //don't want this if we aren't in a group
                if (widget.component.groupSandbox) {
                    delete widget.component.groupSandbox;
                }

                this.toList(widget);
            },
            /**
             * deletes the group sandbox reference
             * @param  groupID{string} group id of the group
             */
            destroyGroup: function(groupID) {
                delete this.sandbox.sandboxes[groupID];
                this.finishGroupChange();
            },
            finishGroupChange: function() {
                var self = this;
                setTimeout(function() {
                    self.delegateEvents();
                    self.resetEditing();
                }, 1000);
            },
            /**
             * appends each of the device widgets to the screen and inits them
             */
            render: function(widget) {
                var self = this;
                var $li = $('<li>');

                DEBUG && console.log('WEMO_DEVICES: DEVICE: modelCode = ' + widget.information.modelCode);

                widget.component.isEditing = self.isEditing;

                if (widget.information.widgetToLoad && !widget.properties.groupID) {

                    $li.attr({
                        // 'data-aura-toload': widget.attributes.modelCode,
                        // 'data-aura-widget': 'bundlemanager',
                        'data-aura-widget': widget.information.widgetToLoad,
                        'data-udn': widget.information.udn,
                        'data-type': widget.information.widgetToLoad
                            //'data-attributes': JSON.stringify(widget.attributes),
                            //'data-sn': widget.attributes.serialNumber
                    }).addClass('isApp');

                } else if (widget.properties.groupID) {

                    $li.attr({
                        // 'data-aura-toload': widget.attributes.modelCode,
                        // 'data-aura-widget': 'bundlemanager',
                        'data-aura-widget': 'wemo_group',
                        'data-udn': widget.properties.groupID,
                        'data-type': widget.information.widgetToLoad
                    }).addClass('isApp isGroup');

                    widget.component.parentSandbox = self.sandbox;

                } else {
                    throw ('model code is undefined. please check your payload.');
                }

                /*
                 we add the list item and restart the sandbox for each new item.
                 we pass in the udn so we can keep a list of the sandboxes to receive events
                 TODO: manage order
                 */

                //this method is part of uiListMixin
                this.insertDeviceElementInOrder($li, widget);
                this.sandbox.start(this.$ul, widget);
            },
            setNetworkInformation: function() {
                var self = this;
                if (window.cordova) { //dont try this in browser
                    $.when(networkPlugin.getNetworkType(), networkPlugin.isRemoteAccessEnabled()).then(function(getNetworkTypeResp, isRemoteAccessEnabledResp) {

                        if (getNetworkTypeResp.match(/remote/gi)) {
                            self.networkType = 'remote';
                            self.refreshTimeoutLength = 60000;
                        } else {
                            self.networkType = 'local';
                            self.refreshTimeoutLength = 10000;
                        }
                        self.isRemoteAccessEnabled = isRemoteAccessEnabledResp;

                    });
                }

                if (this.isEditing) {
                    this.sandbox.emit('global.editing:stop');
                }
            },
            /**
             * adds some extra stuff for managing bridges
             * @param {JSON} device the bridge device
             */
            setBridgeInformation: function(device) {
                var hasBridge = false;
                var self = this;
                //why do we do this separate and keep 2 references to bridges? legacy support...
                if (!bridgeManager[device.information.udn]) {
                    bridgeManager[device.information.udn] = device;
                    //load the bridge widget. it is fairly simple. it always shows on top. its tile is a little different.
                    var $div = $('<div>');
                    $div.attr({
                        'data-aura-widget': 'wemo_bridge',
                        'data-udn': device.information.udn
                    });
                    this.sandbox.view.$el.prepend($div);
                    this.sandbox.start(this.sandbox.view.$el, device);
                } else {
                    if (this.sandbox.sandboxes[device.information.udn]) {
                        this.sandbox.sandboxes[device.information.udn].emit('deviceUpdated', device);
                    } else {
                        setTimeout(function() {
                            self.setBridgeInformation(device);
                        }, 50);
                    }
                }

                _.each(bridgeManager, function(bridge) {
                    if (bridge.properties.isDiscovered) {
                        hasBridge = true;
                    }
                });


                if (hasBridge) {
                    //wemo 1.x - needed until more tab is always at the same
                    window.sessionStorage.setItem('BridgePresent', 'true');
                    this.sandbox.util.storage.setItem('bridgeList', bridgeManager);
                    //wemo 2.x
                    this.sandbox.emit('global.hasBridge', true);
                } else {
                    window.sessionStorage.setItem('BridgePresent', 'false');
                    //wemo 2.x
                    this.sandbox.emit('global.hasBridge', false);
                }

                this.sandbox.bridges = bridgeManager;
            },
            /**
             * handle async callback fails.
             */
            failHandler: function(err) {
                DEBUG && console.log('WEMO_DEVICES:failHandler:' + err);
            },
            showFirmwareUpdate: function() {
                if (this.children[firmwareUpdate].sandbox && $("#headerComponent").height() > 0) {
                    this.children[firmwareUpdate].sandbox.emit('showFirmwareUpdate', true);
                } else {
                    setTimeout(this.showFirmwareUpdate, 20);
                }
            },
            showFirmwareUpdateInProgress: function() {
                if (this.children[firmwareUpdate].sandbox && $("#headerComponent").height() > 0) {
                    this.children[firmwareUpdate].sandbox.emit('showFirmwareUpdateInProgress', true);
                } else {
                    setTimeout(this.showFirmwareUpdateInProgress, 20);
                }
            },
            showOverTempWarning: function() {
                if (this.children[overTemp].sandbox && $("#headerComponent").height() > 0) {
                    this.children[overTemp].sandbox.emit('global.warning:overtemp', false);
                } else {
                    setTimeout(this.showOverTempWarning, 20);
                }

            },
            appRecovered: function () {
                DEBUG && console.log("WEMO_DEVICES: initiated appRecovery is successful");
            }
        };

        _.extend(exports, uiListMixin);

        return exports;
    });
}());