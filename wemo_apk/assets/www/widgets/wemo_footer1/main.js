(function () {
define('text!widgets/wemo_footer1/css/main.css',[],function () { return '.wemo_footer1 {\n    position: fixed;\n    bottom: 0;\n    width: 100%;\n    height: 57px;\n    z-index: 4;\n}\n.wemo_footer1 footer {\n    height: 100%;\n    width: 100%;\n}\n.wemo_footer1 .block-a, .wemo_footer1 .block-b {\n    width: 50%;\n    height: 100%;\n    float: left;\n    color: #777;\n    border-top: 2px solid #73d44c;\n}\n.wemo_footer1 .block-a {\n    border-right: 1px #e1e1e1 solid;\n}\n.wemo_footer1 .active {\n    border-top-color: #73d44c;\n    color: #73d44c;\n}\n.wemo_footer1 .tabIcon {\n    margin: 0 auto;\n    display: block;\n    height: 2.5em;\n    width: 2.5em;\n    background-repeat: no-repeat;\n    background-size: 100%;\n    background-position: center;\n}\n.wemo_footer1 .deviceIcon {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEYAAABGCAMAAABG8BK2AAAABGdBTUEAALGPC/xhBQAAADlQTFRFd3d3dnZ2dnZ2dXV1dXV1dHR0d3d3d3d3d3d3d3d3d3d3b29vd3d3dHR0dnZ2d3d3d3d3AAAAd3d3na7U6gAAABJ0Uk5Tz3CQsFDQIMDgYKAQ8DB/gEAALGbf8QAAAN1JREFUWMPt1tsOgyAMBmA3mSiHAX3/h51kW6JR0IbfG9Peol+gQGmXINEJI4wwwtyGsZN50SYijxkM7QaLsSH/ooOK6+Axfl6NC8N2gMV4R9TbvREOk5Vpf7EMxo7kfGpm+uJcvowPi1AlZt6NZ6oxenUASoymMVUZ/15ELDC+siRGbkxtMueZsZKZ88xQ+pDHxH/u25gHuQbmV1hMCqQbmA7DgBaFTjFow0HHD3UZQFczFwqbTpeteHHZOi6iy7Klri7poAcG9dyhHl9UK4BqTGBtknSiwggjzK2ZD8ypQoOEkUEvAAAAAElFTkSuQmCC);\n}\n.wemo_footer1 .active .deviceIcon {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEYAAABGCAMAAABG8BK2AAAABGdBTUEAALGPC/xhBQAAANJQTFRFdMlKetFXdcdWAAAAHTEWMVcmbL5KctFGZrNHAAAAk95xedVM////ouKI4/fd////h9Rlh9Rn////////////vOqq8fru0vHFSHw0o96Kuumpc8ZOUIM3AAAA0PHFcLZSAAAAhdZpW5tBccROcctLAAAAf9RbU448w+y1////////ablJAAAAAAAAAAAAbMNL////md17ithpu+qp////////S382z/DAAAAAAAAA////////AAAAWZtAZK5EquWQAAAA////AAAA////AAAAc9RMEYHCawAAAEV0Uk5T8/bXLE5XyvazJOP6XdeoceLqPR8Kx6uWXLWn3TwEYpoM6Xja3zTqg8GGPr8wCCjWZ93ox3wVdrwQFDQpGI+o0iBSQKUA5kP6fAAAASBJREFUWMPt1llPwkAUhuGKCAKiqKi44ILs+9qNVlDO+f9/CRN7cWI7Hps5F8bMez15kmaSb2qBSJZhDGMYw/wBph6Mhx+xUjLuYTYcTDBWKmY0tHOYWBomOJogajOFMI/6zPgYUZ8JBijAPIf4M+NtSZ6KqSHDdN5IHQXjvXJMwkfGmQZyjLMhOcnM6J5l1u+kdTLzgCzzm5t6kmEyMoylwbSiLWl9v810TDM60tRj2tGRth7T233V02NIBzJMRYa5lWEeZZjVOcu4dLZcxVDcsYxNZ8tWMP6LyGzBDcd06Wx1VczlgmF8Olu+8oHpzyQeGIBpWYSBk0VJgoH+6VyCgdXSKQown8/I2fXVbK7NAFQvpstdLPNDaxjDGOY/MHtJDgx5l9FXkAAAAABJRU5ErkJggg==);\n}\n.wemo_footer1 .rulesIcon {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEYAAABGCAMAAABG8BK2AAAABGdBTUEAALGPC/xhBQAAAFFQTFRFdnZ2d3d3d3d3d3d3d3d3d3d3dXV1dnZ2c3NzdnZ2dXV1dXV1dXV1d3d3dnZ2d3d3d3d3d3d3dHR0dHR0d3d3b29vd3d3d3d3d3d3AAAAd3d3QpA0FAAAABp0Uk5Tn2+Pr8/vP3/fcFC/sCCQoGDg0DDwEIBAwAAGc0NPAAABzklEQVRYw+2X2ZaDIAxAO10VFQQSofn/Dx1ErVhthbYvnTEvcjRcQxYIu+tHZLdhNsyG+S8YipenGLBxsoKxkWv4KowycbKC+VCkZBMn3xspNNXbGGyg9WSpg8/MpGIqSdn+cimI6pEMNhVj6cc/9YmGlTFFqRhNoh8Z4v5ZtktMxTRk7t4dir22ydZccMHtyZhRcso/gMkpwwWMgngMtxYoCxKnLCP34gnm0AZH6am+NswsZPfzReGFIJhTcdltE7LBNBfXtwy6IncAsJy7tRI0aRV+HIJSKSLRL5G5s8HiKiZwZkPd1ApImqBMgRSuYeyYF6Ibohqm2e4XGqhcw/BbYSMce6MkTpUcp17B4An0YITXrehWZTelnOSai9mJSrd1C6Bdb4ydK8nRnEeR0oVPkIz12U9srpSP3nkccDyfz3qhFoMtkiDtZDDBl3BIb2C6cqgmeZGOKTpB77E0jCb1/LiK6SiwnYBLcJnSUZStF+o5ho/VP8E86PTqdr+QMwrCeH5ENrRuSj43xib3xTWBvn8zGhPfXos7jqM0L3TprtaDee2GKl5r9oXL3dxbpDlMbEm7MzB/LijluwLzxtWDCd88SWG2a9mG+XOYX1D21jFyYB/7AAAAAElFTkSuQmCC);\n}\n.wemo_footer1 .active .rulesIcon {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEYAAABGCAMAAABG8BK2AAAABGdBTUEAALGPC/xhBQAAAi5QTFRFIDMZIzkccMpOP2kz////cMVRcMhMXr8/AAAAdNMw2ezJb5FhXZ1Ff9hMAAAAAAAAbLxNRXM0////7Pjo0fG/dNJMe7hW3/Tcf81j2vPFyuy+we208PrsX6FGkt95c8dN////c7xUX5ZG4fXbSXk7ar8/f8dmt+egns2GjNZvdsFYgM1coOKKd8lWWpZDf9Zo0e/De81b////id5vhtFkWpJD1PLHccZP////8/PzweutwOqrsOGbu8y1lsSDWopHeLFhptaS6fflOVsqpOSPf9Ro////b89NdbtXvd2vt9yqerBoyO64AAAAQGUxb8tPNFMpbsVNbLJQ8fruTX89KkQidbtXcL9QY6RHfMhe////0/DH////z/DD////aa1Nds1Rm9R/dsVRdNJG////hL9E////c9JGZKdJhtJnIjYbc8hOV5JAl9d3////dtI0AAAAabVMAAAAcs1Nf9Jq////////AAAAbsFL////AAAA////RXAyNFcp////AAAAAAAAUII7AAAAJTwecMlP////dpxm////AAAA////AAAAZrBLAAAA////////AAAAAAAAotGOhdFn////AAAAAAAAwuyxod6JfdNcyu+8qOSPidNtiNZoiNdpkNlyn+GEe9VWw+K3puOOkdp0e9dXqeCTlt94f9RcseKdjdxtsOeb9vz0f9Nc3PTSuemlhNlilt955ffde9ZX3PTT0/LH0OjGp+SP////ueqmc9RMS09eeQAAAJZ0Uk5TT0fuUG/e3P0//POFk/oyKMNJ4Xv1+v7z9vS95JmQ68mfy1NPRfng4O2pu+3o4IT0kYYgJ/Funcqwsmvce1qIgbh/bFnn9JD3V7artfYwU+cx2bGnQjyy0Y/g0NPwvMCH8fb09t/9j/ag9Uv4hu+v/CS4OO36gOA8zr8cP2tdYBQMeRhE5VCboCxAIKwQMBAIBIH1f0AAdwg/qwAAApFJREFUWMPt12V72lAUAGDmvs5dOnd3d3d3rbsXKFZsQIwUyNx9lRUbcP7dkkCkLJCE7UOfPTlfcnIDL7ncm5tzddQ/CZ3GaIzGDHompDzyMaA8NOa/YHpTyqI3P9MaVBat+ZmA+IzE/LnmfkApQyJ6nd0S8naKLtswtYx/CFrC/JMGs0OQ129TywwbCmXdqVQYYDzXM5tz2TqVTOcIeFpaHgwaI1FYyrZ4Q7Uu4VcUMovh2XA2wWfDajZZyHRRLbMK5mQyH6xhjwvC3ZFXapntqSWZrAM2sMd6YzkeUMvgQSKjVMIKYbbwzDEV02+iXj+6EqJT+YaqKi47+k45M7KiYgw8H0vwDXV19BhiNgzzH69XzkxgBmfUOOGJ2Lmrsdlsr7XbLc0IqZiZkkz2pKBmMj+LGy1NLellogWtRpQydBDBF7CIez6cTaL15gR6jpRlvF6uyfoa0r3yH3ENXLguOUk5ZoeBb1sJW9gena/JXgBd1+SYrcA92ORy2MwcL17gvv39C5fdcMgwa2F+eqEhnQ1v2C5d5m/i9Ck+vSnDzItON3sRBCmqdsFcpuGq0JeuLj597MjPENNmgAFF0Ukl8NLKNFyXZOCBzIC7Z4bZz5XFi9nzh9LMLbl5gxt7YrFYpNTNnmEgzTTITz/CZDLhmfykmNkr8dbLP4u5EN0A7N/3i44PhTCHRMzBA0/oOFMIs1vuVT6QmSVZ53VQeA7lm5qKYhNFvZW+8kiSyVE/bKSoPdLMPUkmR/1AD/vh91LKJ5/K8po4K8XcUV2lWz/+qfz0qS/2r/zIVhJtBewZiNuJrHvxFLb18MT7BeRrX1uhOxh3ezzxmTH6E333fX+xEXJ77ibpaPf4tE2ixgwe5jepEHBSgD1PqQAAAABJRU5ErkJggg==);\n}\n.wemo_footer1 span {\n    display: block;\n    text-align: center;\n    font-weight: 400;\n    line-height: 0.5em;\n    font-size: 0.75em;\n}\n.wemo_footer1 .btnDone {\n    text-align: center;\n    display: none;\n    width:100%;\n    height:100%;\n}\n.wemo_footer1 .btnDone a {\n    text-decoration: none;\n    width: 100%;\n    height: 100%;\n    background: #fff;\n    border-top: 1px solid #777;\n    color: #73d44c;\n    font-weight:bold;\n    font-size: 1.3em;\n    border-radius:0;\n}\n.wemo_footer1 .optContainer {\n    height: 100%;\n    width: 100%;\n    background-color: white;\n    display: none;\n}\n.wemo_footer1 .showTabs{\n    display: block;\n}\n.wemo_footer1.hideForJarden {\n    display: none;\n}\n';});

/* START_TEMPLATE */
define('hbs!widgets/wemo_footer1/templates/footer',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<footer class=\"footerTabs\">\n    <div class=\"optContainer\">\n        <div class=\"block-a active\" role=\"tab\" aria-label=\"View the Devices\">\n            <anchor class=\"deviceIcon tabIcon\"></anchor>\n            <span>";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "button.devices", options) : helperMissing.call(depth0, "i18n", "button.devices", options)))
    + "</span>\n        </div>\n        <div class=\"block-b\" role=\"tab\" aria-label=\"View the rules\">\n            <anchor class=\"rulesIcon tabIcon\"></anchor>\n            <span>";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "button.rules", options) : helperMissing.call(depth0, "i18n", "button.rules", options)))
    + "</span>\n        </div>\n    </div>\n    <div class=\"btnDone\" aria-label=\"Done Editing\"><a href=\"#\" class=\"btn flex-container\">Done</a></div>\n</footer>\n";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_footer1_templates_footer', t);
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
define('libs/cordovaPlugins/firmwareUpdatePlugin',['libs/execHandler'], function(ExecHandler) {
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
        getAvailableUpdates: function(devices) {
            var path, method;

            DEBUG && console.warn('FirmwareUpdatePlugin:getAvailableUpdates:' + JSON.stringify(devices));

            if (window.cordova && !window.hasDemoDevices) {
                return callPlugin('FirmwareUpdatePlugin', 'getAvailableUpdates', devices, {});
            } else {
                path = 'widgets/wemo_firmwareupdate/mocks/getAvailableUpdates.json';
                method = 'GET';
                return $.ajax(path, {
                    accepts: '*/*',
                    data: devices,
                    method: method
                });
            }
        },
        checkFirmwareForNest: function () {
            return callPlugin('SmartDevicePlugin', 'areNestFirmwareSupported');
        },
        /**
         * tells the native layer to begin the firmware update for devices in the payload.
         * @param  {JSON} payload list of devices to firmware update
         */
        doFirmwareUpdate: function(payload) {
            return callPlugin('FirmwareUpdatePlugin', 'doFirmwareUpdate', payload, {
                ignoreTimeout: true
            });
        },
        /**
         * sends the status of zigbee devices to native layer. native needs to know when zigbee is done in order to time update of different model type/bridge
         * @param  {JSON} payload {udn:'',status:''}
         */
        sendUpdateStatus: function(payload) {
            return callPlugin('FirmwareUpdatePlugin', 'sendUpdateStatus', [payload], {
                ignoreTimeout: true
            });
        }
    };

    return exports;

});
define('widgets/wemo_footer1/main',['backbone', 'text!widgets/wemo_footer1/css/main.css', 'hbs!widgets/wemo_footer1/templates/footer', 'shifty', 'libs/cordovaPlugins/firmwareUpdatePlugin'], function(Backbone, css, template, Tweenable, firmwareUpdatePlugin) {

    'use strict';

    var exports = {
        name: 'wemo_footer',
        type: 'Backbone',
        firstDisplay: true,

        /**
         * starts the process
         */
        events: {
            'click .btn': 'saveEditing',
            'click .block-a': 'showDevicesView',
            'click .block-b': 'showRulesView'
        },
        initialize: function() {
            _.bindAll(this);
            this.sandbox.path = this.options.ref.replace(/main/, '');
            this.styles = css.replace(/\.\.\//g, this.sandbox.path + '/');
            this.stylesheet = new this.sandbox.util.Stylesheet(this.name, this.styles);
            this.render();

            this.sandbox.on('global.showFooter', this.show);
            this.sandbox.on('global.hideFooter', this.hide);
            this.sandbox.on('global.editing', this.editing);
            this.sandbox.on('global.editing:stop', this.stopEditing);
            this.sandbox.on('global.showTabs', this.showTabs);
            this.sandbox.on('global.hideTabs', this.hideTabs);
        },
        render: function() {
            var html = this.i18n(template);
            this.$el.addClass(this.name);
            this.$el.html(html);
            this.$el[0].style.webkitTransition = 'none';

            this.displayScreenText();
        },
        displayScreenText: function() {
            if (document.getElementById("lookingForDevices")) {
                var lookingForDevices = document.getElementById("lookingForDevices").outerHTML;
                $('#lookingForDevices').detach();
                $('#controller').after(lookingForDevices);
                $('#lookingForDevices').css("z-index", 0);
            }

            var self = this;
            clearTimeout(this.showTextTime);
            this.showTextTime = setTimeout(function() {
                $('#lookingForDevices').hide();
            }, 10000);
        },
        show: function() {
            var self = this;

            if (!this.firstDisplay) {
                var tweenable = new Tweenable();
                tweenable.tween({
                    from: {
                        top: 75
                    },
                    to: {
                        top: 0
                    },
                    duration: 300,
                    easing: 'easeInOutCubic',
                    step: function(shifty) {
                        self.$el[0].style.webkitTransform = 'matrix(1,0,0,1,0,' + shifty.top + ')';

                    },
                    finish: function() {

                    }
                });
            } else {
                this.$el[0].style.webkitTransform = 'matrix(1,0,0,1,0,0)';
                this.firstDisplay = false;
            }
        },
        triggerShow: function() {
            this.sandbox.emit('global.showFooter');
        },
        hide: function(hide) {
            var self = this,
                isFooterVisible = this.$('.optContainer').hasClass('showTabs');

            var closeFooterTween = new Tweenable();
            closeFooterTween.tween({
                from: {
                    top: 0
                },
                to: {
                    top: 75
                },
                duration: 150,
                easing: 'easeInOutCubic',
                step: function(shifty) {
                    self.$el[0].style.webkitTransform = 'matrix(1,0,0,1,0,' + shifty.top + ')';

                },
                finish: function() {
                    self.$('.btnDone').hide();
                    if (isFooterVisible) {
                        self.$el.attr('display','');
                        self.$('.optContainer').show();
                        self.showTabs();
                    }
                }
            });
        },
        triggerHide: function() {
            this.sandbox.emit('global.hideFooter');
        },
        editing: function() {
            var self = this;
            var isFooterVisible = this.$('.optContainer').hasClass('showTabs');
            var isJardenOnly = this.$el.hasClass('hideForJarden');

            var startEditTween = new Tweenable();
            startEditTween.tween({
                from: {
                    top: 0
                },
                to: {
                    top: 75
                },
                duration: 200,
                easing: 'easeInCubic',
                step: function(shifty) {
                    self.$el[0].style.webkitTransform = 'matrix(1,0,0,1,0,' + shifty.top + ')';

                },
                finish: function() {
                    if (isFooterVisible || isJardenOnly) {
                        self.$el.show();
                        self.$('.optContainer').hide();
                        self.$('.btnDone').show();
                        self.show();
                    }
                }
            });

        },
        showTabs: function() {
            this.$('.optContainer').addClass('showTabs');
            this.show();
        },
        hideTabs: function() {
            this.$('.optContainer').removeClass('showTabs');
            this.hide();
        },
        stopEditing: function() {
            this.hide();
        },
        saveEditing: function() {
            this.sandbox.emit('global.editing:save');
        },
        showDevicesView: function() {
            this.$('.optContainer div').removeClass('active');
            this.$('.block-a').addClass('active');
            window.sessionStorage.setItem("ACTIVE_TAB", "DEVICES");
        },
        showRulesView: function() {
            var devices = this.sandbox._parent.sandboxes,
                self = this;
            var deviceList = {},
                devicesToCheck = [],
                hasNest = window.sessionStorage.getItem("hasNest");


            var addDevice = function(device) {
                if (device.properties.isDiscovered) {
                    devicesToCheck.push({
                        uniqueId: device.information.udn,
                        modelCode: device.information.modelCode,
                        firmwareVersion: device.properties.firmwareVersion,
                        hwVersion: device.information.hwVersion || 'v1',
                        macAddress: device.information.mac,
                        productType: device.information.productType
                    });
                }
            };

            $.each(devices,function(key, val){
                deviceList[key] = val.properties;
                if(deviceList[key] !== null && typeof deviceList[key] === 'object'){
                    deviceList[key]["information"] = {};

                    if(deviceList[key]["information"] !== undefined && val.information !== undefined){
                        deviceList[key]["information"] = val.information;
                    }
                }
                addDevice(val);
            });
            window.sessionStorage.setItem("SFW_DEVICE_LIST", JSON.stringify(deviceList));

            this.$('.optContainer div').removeClass('active');
            this.$('.block-b').addClass('active');

            /*
            load as iframe through wemo_router
            this.sandbox.emit('global.load', null, 'file:///android_asset/www/rules/create_rule.html');
             */

            window.sessionStorage.setItem("ACTIVE_TAB", "RULES");

            //checking for all devices instead of just nest
            firmwareUpdatePlugin.checkFirmwareForNest().then(function(resp){
                if(!resp && hasNest == "true"){
                    self.sandbox.uiInterface.showSpinner();
                    firmwareUpdatePlugin.getAvailableUpdates(devicesToCheck);

                    setTimeout(function(){
                        self.sandbox.uiInterface.hideSpinner();
                        window.location.href = 'file:///android_asset/www/rules/devices_tune_up.html';
                    }, 800);

                } else {
                    window.location.href = 'file:///android_asset/www/rules/temp_rule.html';
                }
            }).fail(function(err){
                window.location.href = 'file:///android_asset/www/rules/temp_rule.html';
            });

        }
    };

    return exports;
});
}());