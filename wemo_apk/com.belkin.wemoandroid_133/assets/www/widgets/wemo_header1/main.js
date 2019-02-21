(function () {
define('text!widgets/wemo_header1/css/main.css',[],function () { return '.wemo_header1 {\n    position: fixed;\n    top: 0;\n    width: 100%;\n    z-index: 10;\n    height: 55px;\n    background: #73d44c;\n}\n.wemo_header1.moveUp {\n    z-index: 102;\n}\n.wemo_header1 .fa-bars {\n    float: left;\n    padding: 0.8em 1em;\n    font-size: 2em;\n    color: #444;\n}\n.wemo_header1 header {\n    display: flex;\n    flex-direction: row;\n    align-items: center;\n    position: absolute;\n    top: 0;\n    left: 0;\n    width: 100%;\n    height: 100%;\n}\n.wemo_header1 h2 {\n    flex: 1;\n    background-image: url(data:image/png;base64,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);\n    background-size: auto 20px;\n    background-repeat: no-repeat;\n    background-position: left center;\n    margin-left: 20px;\n    height: 55px;\n}\n.wemo_header1 .edit_img,\n.wemo_header1 .menu_img,\n.wemo_header1 .info_img,\n.wemo_header1 .refresh_img {\n    background-size: 21px;\n    background-repeat: no-repeat;\n    background-position: center;\n    width: 21px;\n    height: 21px;\n}\n.wemo_header1 .edit_img {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADYAAAA2CAQAAAAmTKJWAAAAsElEQVR4Ae3SOYHDQBAFUSU6mChcOKJiCBIgH4x8cvgbOaq9d8pRF4HX09Nd+zJmyzWXrBk6t0w55dkho08FnEeBMylyHuVzWYJMbvcNN7ySW1v81fxD7tLiLB55+xF3bXKBP+S2BtQPuVPGNlTIgZraUSFnUiFnUiFnUuQWkSInUORMitwsU+KxF1VUUUUVVVRRRf09kWIixUSKiRQTKSZSTKSYSDGRYiLFRIp5FHsHnJ0YV1PrsFMAAAAASUVORK5CYII=);\n    padding: 28px;\n}\n.wemo_header1 .menu_img {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAQAAACQ9RH5AAACLUlEQVR4Ad3ZJXAeYRSF4RNmZlVmlKlPXJmZZXRU2ZT+NSE/IVX0Ji6gwmTKzMx9i+GlwO43k0cv473najIoogMnHRQpKJzEzUkFhUbcNCgotOGmTUHhFW5eKRjk4iVXQaAYL8UKAgfwckBB4BxezmlqiKKGQWpYo3GIZje38XKbPURrHNZSwwCVRMkJRxjSwlGS9R8b6MWvfjbrP5I5SgtDjsgeaTxitNdUsZos6pisBrJZTRWvGe0RabLDRey8xz+vtS5qIhbwhaB9YYHG4yZhuKmxKCUspRpBLN2EpZtYDaGMMJXpH7J5QZhekK0/qGLyemgkQoRGepi8Kkkk853J+IzFIo3CIiw+MxnfSRJpPMO/VubKBnNpxb+npEpiHQ/w5yqJckAiV/HnwfB/mwKa8NZKolyQSCvemigY+yZbuPvMXHlgLp9xZxGr8djBO5xZ8gELZ+/YIXssow8ni+QDi3DSxzI5Yxv2euQTPdjbKjccx17jtLuN43JDOfYi8okI9sqD3rGFvXKDl9rgw2X8dTL/ASGWSCifzAixGmLsJ0Gxkd8iqTw1UgiQZKD0+UaSuWLPXHlroKA338JIlBCWEo3FDcJww3BjPgYXAo8iLvgNX6pZTTYNTFYdWaym2jl8cY6bWsfETZvpx69eNoyJm1oZctgtYKtkgBrW2gRse3wFbLsdArZBqonS1HAWL2fNh6izIzbOwUuO+dHAbBmGNOCmYRYNvAIY8f0Cs4wwS8kAFtUAAAAASUVORK5CYII=);\n    padding: 28px;\n}\n.wemo_header1 .refresh_img {\n    background-image: url(data:image/png;base64,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);\n    width: 30px;\n    height: 30px;\n    padding: 28px;\n    background-size: 28px;\n}\n.wemo_header1 .info_img{\n    display: none;\n    background-image: url(data:image/png;base64,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);\n    background-size: contain;\n    background-repeat: no-repeat;\n    background-position: center;\n    width: 25px;\n    height: 25px;\n    margin-right: 14px;\n}\n';});

/* START_TEMPLATE */
define('hbs!widgets/wemo_header1/templates/header',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  


  return "<header>\n    <h2></h2>\n\n	<div class=\"flex-container controls\">\n        <anchor class=\"info info_img\"></anchor>\n	</div>\n	<anchor class=\"menu menu_img headerControls\"></anchor>\n</header>\n";
  });
Handlebars.registerPartial('widgets_wemo_header1_templates_header', t);
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
define('widgets/wemo_header1/main',['backbone', 'text!widgets/wemo_header1/css/main.css', 'hbs!widgets/wemo_header1/templates/header', 'shifty','libs/cordovaPlugins/networkPlugin'], function(Backbone, css, template, Tweenable, networkPlugin) {

    window.isAndroid1 = true;

    'use strict';

    var exports = {
        name: 'wemo_header',
        type: 'Backbone',

        events: {
            'click .menu': 'triggerMenu',
            'click .info': 'toggleReachabilityMsg'
        },
        /**
         * starts the process
         */
        initialize: function() {
            _.bindAll(this);
            this.sandbox.path = this.options.ref.replace(/main/, '');
            this.styles = css.replace(/\.\.\//g, this.sandbox.path + '/');
            this.stylesheet = new this.sandbox.util.Stylesheet(this.name, this.styles);

            this.listen();
            this.render();
            var url = window.location.href;
            if (url.match(/showFirmwareUpdate/g)) {
                this.$el.hide();
            }
        },
        listen: function() {
            var self = this;
            this.sandbox.on('global.hideHeaderControls', this.hideControls);
            this.sandbox.on('global.showHeaderControls', this.showControls);
            this.sandbox.on('global.editing', function() {
                self.hideControls(true);
            });
            this.sandbox.on('global.editing:stop', function() {
                self.showControls(true);
            });
            this.sandbox.on('global.hideMenu', this.showControls);
            this.sandbox.on('global.onNetworkChanged', function(status) {
                self.toggleInfoIcon(status);
            });
        },
        render: function() {
            var html = this.i18n(template);
            this.$el.addClass(this.name);
            this.$el.html(html);
        },
        triggerMenu: function() {

            var self = this;
            if (window.cordova) { //dont try this in browser
                $.when(networkPlugin.isRemoteAccessEnabled()).then(function(isRemoteAccessEnabledResp) {


                    self.sandbox.emit('global.showMenu');
                });
            }
        },
        showControls: function(fromEditing) {
            this.fromEditing = fromEditing;
            this.tweenControls(-200, 0);
            this.isEditing = false;
            this.$el.attr('aria-hidden','false');
        },
        hideControls: function(fromEditing) {
            this.fromEditing = fromEditing;
            this.isEditing = true;
            this.tweenControls(0, -200);
            this.$el.attr('aria-hidden','true');
        },
        tweenControls: function(startTop, endTop) {
            var tweenable = new Tweenable();
            var self = this;
            if (this.fromEditing) {
                this.$('.menu').addClass('moveable');
                $('#headerComponent .controls').addClass('moveable');
            } else {
                this.$('.menu').removeClass('moveable');
                $('#headerComponent .controls').removeClass('moveable');
            }
            var $moveable = $('.moveable');

            tweenable.tween({
                from: {
                    y: startTop
                },
                to: {
                    y: endTop
                },
                duration: 200,
                easing: 'easeInOutCubic',
                step: function(shifty) {
                    $moveable.each(function() {
                        this.style.webkitTransform = 'matrix(1,0,0,1,0,' + shifty.y + ')';
                        this.style.transform = 'matrix(1,0,0,1,0,' + shifty.y + ')';
                    });
                },
                finish: function() {

                }
            });
        },
        /**
         * toggle header icons when network status change
         * @param  {JSON} resp ex: {isNetworkenabled:isNetworkenabled}
         */
        toggleInfoIcon: function(status) {
            if (status.isNetworkenabled) {
                this.$('.headerControls').show();
                this.$('.info').hide();
            } else {
                this.$('.headerControls').hide();
                this.$('.info').show();
            }
        },
        toggleReachabilityMsg: function() {
            this.sandbox.emit('global.toggleReachabilityMsg');
        }
    };

    return exports;
});
}());