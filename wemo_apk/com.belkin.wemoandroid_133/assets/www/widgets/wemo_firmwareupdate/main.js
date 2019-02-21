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
define('text!widgets/wemo_firmwareupdate/css/main.css',[],function () { return 'div[data-aura-widget="wemo_firmwareupdate"]{\n\tposition:relative;\n\tz-index:1001;\n}\n.wemo_firmwareupdate {\n}\n.wemo_firmwareupdate pre{\n\tfont-family:Roboto, sans-serif;\n}\n.firmwareUpdateComplete, .firmwareUpdateStatus span{\n\tdisplay: block;\n\tfont-size: 1.7em;\n    color: #777;\n}\n.firmwareUpdateComplete{\n    color: #73d44c!important;\n}\n.wemo_firmwareupdate.firmwareupdateHeaderBtn{\n\tbackground-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACoAAAAzCAQAAABLE1KDAAAAZklEQVR4Ae3OuRWAQBSF0Cl9Ov+GJO7i/ijgHtpUtaI2XdDHokGDBg1avey6z3b7FhJWJWFVElYlYTUSVidhVRJWJWFVElYlYVUSViVhVRJWJWFVElYlYSFdFtJiV5EpVfm9BA06AFrV/3gO/vlkAAAAAElFTkSuQmCC);\n    background-size: 19px;\n    background-position: center;\n    background-repeat: no-repeat;\n    height: 23px;\n    width: 23px;\n    padding: 28px;\n    z-index: 20;\n}\n.wemo_firmwareupdate header h3 {\n    height: 1em;\n    color: #fff;\n    font-size: 1em;\n    line-height: 1;\n}\n.wemo_firmwareupdate footer {\n    border-top: 1px solid #73d44c;\n    background-color: #ffffff;\n    position: fixed;\n    display: flex;\n    height: 55px;\n    text-transform: uppercase;\n    align-items: center;\n    justify-content: center;\n}\n.wemo_firmwareupdate footer .update {\n    color: #73d44c;\n}\n.wemo_firmwareupdate section.overlayContent {\n    padding: 1em 1em 10em;\n    color: #444;\n    background: #f1f1f1;\n    overflow-y: scroll;\n    height: 100vh;\n}\n.firmwareUpdatePopup .buttons table .cancel {\n    border-right: 1px solid #595959;\n}\n.firmwareUpdatePopup .buttons table .confirm {\n    color: #73d44c;\n    font-weight: 500;\n}\n.wemo_firmwareupdate .releaseNotesContainer {\n    margin-top: 1em;\n    padding: 1em;\n    background: #fff;\n    -webkit-box-shadow: 0 2px 1px -1px #777;\n}\n.wemo_firmwareupdate .releaseNotesContainer b{\n    text-transform:capitalize;\n}\n.wemo_firmwareupdate .releaseNotesContainer pre{\n    background:none;\n    border:none;\n    word-break: normal;\n}\n.wemo_firmwareupdate .releaseNotesHeader {\n    padding-bottom: 0.2em;\n}\n.wemo_firmwareupdate #releaseNotesList {\n    list-style: none;\n    margin: 0;\n    padding: 0;\n}\n.wemo_firmwareupdate #releaseNotesList li {\n    padding: 0.3em 0;\n}\n.wemo_firmwareupdate.inprogress {\n    height: 100%;\n}\n.wemo_firmwareupdate header {\n    position: relative;\n    width: 100%;\n    height: 55px;\n    color: #fff;\n    border: none !important;\n    background-color: #73d44c !important;\n    display: flex;\n    align-items: center;\n    padding: 0!important;\n}\n.wemo_firmwareupdate header .back {\n    display: block;\n    float: left;\n    position: relative;\n    width: 22px;\n    height: 22px;\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAABQCAYAAABf9vbdAAAAAXNSR0IArs4c6QAAAm9JREFUaAXtWT1LA0EQzYkgKAhWEkUEGxVE1FpRGxs7wdLCQvA/aG8pFv4IEXsRQSxtNCASUWwtbPxACyMmvrlkwyZGze2sOxeYhZfdrDe7782+3Yt3mYwW2QxEstN/n71UKo2hdxWYAvqBS+AM2I2i6A11OguItwMbwDvQqNyhczaV7EGMyB80Yl3XV8D38VSJAKFmyRst5xSTChEO5I2IBSOgzTRC15Us7mHeJYe5J02MiAAmeeI+JCbAA3ninjcCgtZEHmjmtMFlv5aZoMRpMtDxRf6olcm/IBGDQQV4zPwrxgp7J1byyACKZj7RnkHGfJ02mnnNfLwFk32obdQ2yRwTX622UduobRJ5wOFiZFh/HiAJetokMo/apnw0qW0S2YYuRuL2y8ljfYbPfIX8Got2OViMfC/mf2YKCE7efrg7j1XoppVwLPT6ZxGvgU4d453CbAHVR9YOI4mQJ562ANfsi5GvF/DhkPkiYlZC28bmaa+AyytXit/Cxs/ag4ZscwUQ12HgREqELSDHyJyoiJg3MjgKFAFOuUawmJ3oZ8QOh30lVk4ECHQB+VYX0QcBNyqinAFRO+lKWDbUlWDco+L/0tROaieWh6xgZFLtpHayHMFqqp0sL6GpNzu1k+4J3ROsXVAbrHZSO9U6gvXNo52uMFYni4xrsEcR264c2HGeRHxinBFDxn42avr+rcZj+HsMPgfcMiYhztMmPqgAmtSTiAkxAZ5EPIkK8CDiwggQrx029gNiesSJ2wQSili2Y1PThogscAz8VAr4w2ZqCDciAoIRsA7kACJM5RE4BKonT6PY1PWBcAcw8BexL9t44wiKYY9EAAAAAElFTkSuQmCC);\n    background-size: contain;\n    background-position: left center;\n    background-repeat: no-repeat;\n    margin-left: 14px;\n    margin-top: 0px;\n}\n.wemo_firmwareupdate header .title {\n    color: #fff;\n}\n.wemo_firmwareupdate.inprogress ul {\n    padding-left: 0;\n    list-style: none;\n}\n.wemo_firmwareupdate.inprogress li {\n    list-style: initial;\n    margin: 0.5em 0.5em 0.5em 1.5em;\n}\n.wemo_firmwareupdate.inprogress .content {\n    padding: 0 14px;\n}\n.wemo_firmwareupdate.inprogress .upgradeInProgress {\n    padding: 2em 0;\n    margin-left: -1em;\n    display: flex;\n    align-items: center;\n    justify-content: center;\n    font-size: 1.2em;\n    font-weight: 500;\n}\n.wemo_firmwareupdate.inprogress .upgradeInProgress .spinner {\n    width: 23px;\n    height: 23px;\n    display: inline-block;\n    margin-right: 10px;\n    background-image: url(data:image/gif;base64,R0lGODlhQABAAPf/AP/bzf/99//lhv+2Xv/SKv/mif/uxf/yxv/88v/qnf/TLf/wvv/uuf/gcf/NLP/sqP/KBP/66v/VNv/usf/QHf/zyP/gbf/43f/ief/cWf/plv/77P/24P/++v/wuv/23f/9+f/aVf/ojf/UMf/LBv/US//omf/k4f/0yv/LCf/spf/MCv/qov/55v/MBf/66P/nj//YRv/44P/dXP/MCP/XRf/PFv/WPf/PGP/dgv/MDf/44v/faf/10P/ND//MAP/32v/mjv/kmv/77v/88P/ZWv/vtv/NDv/QGP/10v/NEv/eZv/jfP/kgv/aUv/0zP/rpP/YSf/id//dYP/ULv/WC//vtP/22P/JAP/bo//VOP/ZTP/QIP/55P/XQP/OHf/ccf/dXv/QI//iZf/ZSv/21f/PGv/RFP/gaf/0zv/aXv/TMP/xwP/bAP/aTv/21P/ywv/dbf/okv/qtf/jgf/so//OEv/trP/RJP/llP/aaf/kfv/gi//OFP/x0f/yzv/dYv/cDP/qrf/njP/op//YQv/ywP/bUP/XPv/hWf/eYP/aKv/68P/VOv/01f/qsv/unv/SJ//++P/47P/ODv/eZP/WOf/OEP/65v/bV//xw//ZUf/gdP/z2P/VPf/cZv/NFf/NA//ODP/lo//ic//eXv/YT//XUP/SIf/JAv/5+P/02//jhP/eYv/XOv/SAP/LAP/KAf/KAv///f/+/P/LA//89f/ur//99f/KA//wt//87//89P/+/f/RJv/99P/VPv/ZTf/SJf/ZS//10//32//LAv/55//56v/PC//55f/9/f/OAP/sr//urf/hd//ffP/ilf/dTP/SIv/TWP/9+v/x5v/79P/eG//yjf/QZ//LC//kdv/57//yr//z8v/le//WJf+9k//Qa//lbv/bbf/NGP/PSv/ljf/odv/jjP/nqP/zmP/LAf/jkP/PNf/KZP/VdP/jFf/Re//MF//bZv/q0P/11f/cUv/PBP/suP/dE//TKv/ZU//KAP///yH/C05FVFNDQVBFMi4wAwEAAAAh/wtYTVAgRGF0YVhNUDw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDE0IDc5LjE1Njc5NywgMjAxNC8wOC8yMC0wOTo1MzowMiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QTc4Q0M0RTUyQTdDMTFFNTk3QjVCOTFEQzg0NkE0QzAiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QTc4Q0M0RTYyQTdDMTFFNTk3QjVCOTFEQzg0NkE0QzAiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpBNzhDQzRFMzJBN0MxMUU1OTdCNUI5MURDODQ2QTRDMCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpBNzhDQzRFNDJBN0MxMUU1OTdCNUI5MURDODQ2QTRDMCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PgH//v38+/r5+Pf29fTz8vHw7+7t7Ovq6ejn5uXk4+Lh4N/e3dzb2tnY19bV1NPS0dDPzs3My8rJyMfGxcTDwsHAv769vLu6ubi3trW0s7KxsK+urayrqqmop6alpKOioaCfnp2cm5qZmJeWlZSTkpGQj46NjIuKiYiHhoWEg4KBgH9+fXx7enl4d3Z1dHNycXBvbm1sa2ppaGdmZWRjYmFgX15dXFtaWVhXVlVUU1JRUE9OTUxLSklIR0ZFRENCQUA/Pj08Ozo5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);\n    background-repeat: no-repeat;\n    background-size: 23px;\n}\n.notAvailableBg .firmwareUpdateStatus {\n    display: none;\n}';});

define('text!widgets/wemo_firmwareupdate/templates/firmwareupdateHeaderBtn.html',[],function () { return '<div class="wemo_firmwareupdate firmwareupdateHeaderBtn headerControls" role="button" aria-label="Update Device Firmware"></div>';});

/* START_TEMPLATE */
define('hbs!widgets/wemo_firmwareupdate/templates/firmwareupdate',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<header class=\"overlayHeader\">\n	<!--<anchor class=\"back\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "translation:navigation.back", options) : helperMissing.call(depth0, "i18n", "translation:navigation.back", options)))
    + "</anchor>-->\n	<span class=\"back\"></span>\n	<span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "firmwareupdate.title", options) : helperMissing.call(depth0, "i18n", "firmwareupdate.title", options)))
    + "</span>\n</header>\n<section class=\"overlayContent\">\n	<div class=\"updateWarning\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "firmwareupdate.updateWarning", options) : helperMissing.call(depth0, "i18n", "firmwareupdate.updateWarning", options)))
    + " </div>\n</section>\n<footer>\n	<div class=\"update\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "firmwareupdate.updateBtn", options) : helperMissing.call(depth0, "i18n", "firmwareupdate.updateBtn", options)))
    + "</div>\n</footer>\n";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_firmwareupdate_templates_firmwareupdate', t);
return t;
});
/* END_TEMPLATE */
;
/* START_TEMPLATE */
define('hbs!widgets/wemo_firmwareupdate/templates/releaseNotes',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, stack2, options, functionType="function", escapeExpression=this.escapeExpression, self=this, helperMissing=helpers.helperMissing;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n    ";
  stack1 = helpers['if'].call(depth0, depth0.wasDiscovered, {hash:{},inverse:self.noop,fn:self.program(2, program2, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n";
  return buffer;
  }
function program2(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n    <b>";
  if (stack1 = helpers.displayName) { stack1 = stack1.call(depth0, {hash:{}}); }
  else { stack1 = depth0.displayName; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</b><br />\n    <p>\n        ";
  if (stack1 = helpers.releaseNotes) { stack1 = stack1.call(depth0, {hash:{}}); }
  else { stack1 = depth0.releaseNotes; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n    </p>\n<br>\n    ";
  return buffer;
  }

  buffer += "<p class=\"devicesToUpdate\">\n    ";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "firmwareupdate.header", options) : helperMissing.call(depth0, "i18n", "firmwareupdate.header", options)))
    + " ";
  if (stack2 = helpers.products) { stack2 = stack2.call(depth0, {hash:{}}); }
  else { stack2 = depth0.products; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + ".\n</p>\n<div class=\"releaseNotesContainer\">\n";
  stack2 = helpers.each.call(depth0, depth0.devices, {hash:{},inverse:self.noop,fn:self.program(1, program1, data)});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n </div>\n";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_firmwareupdate_templates_releaseNotes', t);
return t;
});
/* END_TEMPLATE */
;
define('widgets/wemo_firmwareupdate/js/firmwareupdate',['Cache', 'libs/cordovaPlugins/firmwareUpdatePlugin', 'hbs!widgets/wemo_firmwareupdate/templates/firmwareupdate', 'hbs!widgets/wemo_firmwareupdate/templates/releaseNotes'],
    /** @exports settings view */
    function(Backbone, firmwareUpdatePlugin, template, releaseNoteTemplate) {

        'use strict';

        var View = Backbone.OverlayView.extend({
            tagName: 'div',
            viewName: 'firmwareupdate noMainHeader settings',
            template: template,
            /**
             * adds event binding to elements, clicks are converted to pointerup events
             */
            events: {
                'click .update': 'updateNow',
                'click .overlayHeader': 'goBack'
            },
            /**
             * two-way data binding to models, uses Backbone.stickit
             */
            bindings: {
                '.releaseNotes': {
                    observe: 'releaseNotes',
                    updateMethod: 'html'
                }
            },
            /**
             * put non-DOM event listeners here. These need to be removed when no longer necessary to free up memory (this.stopListening())
             */
            listen: function() {
                if (window.location.href.match(/showFirmware/)) {
                    this.addBackButtonCommand({
                        key: 'cancel',
                        callback: function() {
                            var MORE_MENU = "file:///android_asset/www/more/more_menu.html";
                            window.location.href = MORE_MENU;
                        }
                    });
                }
            },
            /**
             * callback that occurs before the settings view opens
             */
            beforeOpen: function() {
                if (!window.location.href.match(/showFirmware/)) {
                    this.sandbox.emit('global.hideHeaderControls');
                }
            },
            /**
             * callback that occurs after the settings view is written to the screen
             */
            afterRender: function() {
//                this.delegateEvents();
                //process the template again, with data
                var collection = this.sandbox.notesCollection.toJSON();

                if (collection && collection.length == 0) {
                    collection = JSON.parse(sessionStorage.getItem('releaseNote'));
                }

                var productTypes = [];
                _.each(collection, function(item) {
                    productTypes.push(item.displayName);
                });

                var html = releaseNoteTemplate({
                    products: productTypes.join(', '),
                    devices: collection
                });
                this.$('.overlayContent').append(html);

            },
            /**
             * callback that occurs after the settings view is finsihed opening
             */
            afterOpen: function() {

            },
            /**
             * callback that occurs after the settings view is finished closing
             */
            afterClose: function() {
                if (!window.location.href.match(/showFirmware/)) {
                    this.sandbox.emit('global.showHeaderControls');
                }
            },
            /**
             * create the payload for doUpdate
             * @param  {Backbone.Model} model the update model
             * @return {JSON}  payload     the update model, minus some fields, in JSON
             */
            setUpdatePayload: function(model) {
                var payload = model.toJSON();
                if (payload.models) {
                    delete payload.models;
                }
                if (payload.tags) {
                    delete payload.tags;
                }
                return payload;
            },
            /**
             * build the object to send to update, based on the collection
             */
            updateNow: function() {
                var self = this;
                var delayStart = 0; //seconds to delay download start for


                //get the zigbee devices
                var zigbee = this.sandbox.collection.filter(function(model) {
                    return model.get('bridgeUDN');
                });

                var zigbeeToUpdate = {};
                //loop through them and combine the same modelCodes
                zigbee.forEach(function(model) {
                    var modelCode = model.get('modelCode');
                    if (!zigbeeToUpdate[modelCode]) {
                        model.set('delayStart', delayStart);
                        zigbeeToUpdate[modelCode] = self.setUpdatePayload(model);
                        zigbeeToUpdate[modelCode].delayStart = delayStart;
                    } else {
                        zigbeeToUpdate[modelCode].udn = zigbeeToUpdate[modelCode].udn + ',' + model.get('udn');
                    }
                });

                var updateArray = [];
                _.each(zigbeeToUpdate, function(obj) {
                    updateArray.push(obj);
                });

                //get the wifi devices
                var wifi = this.sandbox.collection.filter(function(model) {
                    return !model.get('bridgeUDN');
                });

                var i = 1;
                wifi.forEach(function(model) {
                    model.set('delayStart', delayStart);
                    updateArray.push(self.setUpdatePayload(model));
                    i++;
                });

                this.sandbox.uiInterface.showSpinner();
                firmwareUpdatePlugin.doFirmwareUpdate(updateArray).then(function() {
                    self.sandbox.uiInterface.hideSpinner();
                    self.sendUpdate();
                    self.gotoInProgress();
                }).fail(this.failUpdate);
            },
            /**
             * called when doFirmwareUpdate succeeds. Sets env variables and emits event. Shows in progress screen
             */
            sendUpdate: function() {
                /* _.each(this.sandbox.collection.models, function(model) {
                    DEBUG && console.warn('firmwareupdate:sendUpdate:model:' + model);
                    if (model) {
                        var delay = model.get('delayStart');
                        if (delay > 0) {
                            window.firmwareUpdatePlugin.onStatusChange(model.get('udn'), 7);
                        }
                    }
                });
*/
                this.sandbox.emit('removeUpdateBadge');
                //set the updating status to true for an hour, or until all of the firmwares have reported as finished, which gets checked on status update
                this.sandbox.util.storage.setItem('firmwareUpdateInProgress', 'true', 3600);
                //emit a global event to be caught by the menu to display proper status ui
                this.sandbox.emit('global.firmwareUpdateInProgress', true);
                //need to set to localstorage for full android 1.0 app - delete this when above finished or expired (is not set but window is)
                window.sessionStorage.setItem('firmwareUpdateInProgress', 'true');
                //sets the element we are transitioning FROM and BACK TO on cancel if not declared earlier, or if it has changed
            },
            /**
             * loads the inprogress view
             */
            gotoInProgress: function() {
                this.sandbox.inprogress.setPreviousElement(this.$el);
                this.sandbox.inprogress.initialRender();
                this.sandbox.inprogress.open();
            },
            /**
             * called when doFirmwareUpdate fails
             */
            failUpdate: function() {
                this.sandbox.uiInterface.hideSpinner();
                //TODO: add error handling
            },
            /**
             * method called when hitting 'back' button
             */
            goBack: function() {
                var MORE_MENU = "file:///android_asset/www/more/more_menu.html";
                window.location.href = MORE_MENU;
            }
        });

        return View;
    });
/* START_TEMPLATE */
define('hbs!widgets/wemo_firmwareupdate/templates/inprogress',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<header>\n	<span class=\"back\"></span>\n	<span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "firmwareupdate.inProgress", options) : helperMissing.call(depth0, "i18n", "firmwareupdate.inProgress", options)))
    + "</span>\n</header>\n<section class=\"content\">\n    <div class=\"upgradeInProgress\">\n        <span class=\"spinner\"></span>\n        <span class=\"description\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "firmwareupdate.ugradeInProgress", options) : helperMissing.call(depth0, "i18n", "firmwareupdate.ugradeInProgress", options)))
    + "</span>\n    </div>\n	<ul>\n        <li>";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "firmwareupdate.notes1", options) : helperMissing.call(depth0, "i18n", "firmwareupdate.notes1", options)))
    + "</li>\n        <li>";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "firmwareupdate.notes2", options) : helperMissing.call(depth0, "i18n", "firmwareupdate.notes2", options)))
    + "</li>\n        <li>";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "firmwareupdate.notes3", options) : helperMissing.call(depth0, "i18n", "firmwareupdate.notes3", options)))
    + "</li>\n	</ul>\n</section>";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_firmwareupdate_templates_inprogress', t);
return t;
});
/* END_TEMPLATE */
;
define('widgets/wemo_firmwareupdate/js/inprogress',['Cache', 'hbs!widgets/wemo_firmwareupdate/templates/inprogress'],
    /** @exports settings view */
    function(Backbone, template) {
        'use strict';


        var View = Backbone.OverlayView.extend({
            tagName: 'div',
            viewName: 'inprogress',
            className: 'noMainHeader',
            template: template,
            /**
             * adds event binding to elements, clicks are converted to pointerup events
             */
            events: {
                'click .back': 'goBack'
            },
            /**
             * put non-DOM event listeners here. These need to be removed when no longer necessary to free up memory (this.stopListening())
             */
            listen: function() {

                var self = this;

                this.addBackButtonCommand({
                    key: 'cancel',
                    callback: function() {
                        self.goBack();
                    }
                });

            },
            /**
             * callback that occurs before the settings view opens
             */
            beforeOpen: function() {

            },
            /**
             * callback that occurs after the settings view is written to the screen
             */
            afterRender: function() {

            },
            /**
             * callback that occurs after the settings view is finsihed opening
             */
            afterOpen: function() {

            },
            /**
             * callback that occurs after the settings view is finished closing
             */
            afterClose: function() {
                if (!window.location.href.match(/showFirmware/)) {
                    this.sandbox.emit('global.showHeaderControls');
                }
            },
            /**
             * callback that occurs on successfull save
             */

            goBack: function() {
                if (window.location.href.match(/showFirmware/)) {
                    window.history.back();
                } else {
                    this.setPreviousElement($('.container'));
                    this.sandbox.uiInterface.dismissSettings.call(this, {
                        cancel: true
                    });
                }

            }
        });

        return View;

    });
define('libs/pouchInterfaceBaseObject',['pouchDB', ], function(PouchDB) {
    'use strict';


    var PouchInterface = function(options) {
        this.initialize(options);
    };

    if (!window.PouchDB) {
        window.PouchDB = PouchDB;
    }

    //  PouchDB.destroy('websql://wemodevicewidgets');

    _.extend(PouchInterface.prototype, Backbone.Events, {
        initialize: function(options) {
            options = options || {};
            _.extend(this, options);

        },
        remoteDb: 'http://localhost:5984/',
        dbName: '',
        /*
        to: function() {
            this.db.replicate.to(this.remoteDb, {
                onChange: function(resp) {

                },
                complete: function() {

                }
            });
        },
        from: function() {
            var dfd = $.Deferred();

            this.db.replicate.from(this.remoteDb, {
                onChange: function(resp) {

                    if (!resp.ok) {
                        dfd.reject();
                    }
                },
                complete: function(resp) {

                    dfd.resolve();
                }
            });

            return dfd.promise();
        },*/
        createDatabase: function() {
            var dfd = $.Deferred();


            if (!window[this.dbName]) {
                window[this.dbName] = new PouchDB(this.dbName, {}, function(err, result) {

                    if (err) {
                        dfd.reject(err);
                    } else {
                        // self.from().then(function(){
                        dfd.resolve(result);
                        // }).fail(function(){
                        //         dfd.reject();
                        // });
                    }
                });
                this.db = window[this.dbName];
            } else {
                this.db = window[this.dbName];
                dfd.resolve();
            }

            return dfd.promise();
        },
        getAll: function() {
            var self = this;
            var dfd = $.Deferred();
            this.createDatabase().done(function() {
                self.db.allDocs({
                    include_docs: true,
                    attachments: true
                }).then(function(result) {
                    dfd.resolve(result.rows);
                }).catch(function(err) {
                    dfd.reject(err);
                });
            }).fail(function() {
                dfd.reject();
            });
            return dfd.promise();
        },
        get: function(key) {

            var dfd = $.Deferred();
            var self = this;
            key = key || self.key;

            this.createDatabase().done(function() {

                self.db.get(key, {}, function(err, result) {

                    if (err && err.status !== 404) {
                        dfd.reject(err);

                    } else if (err && err.status === 404) {
                        dfd.resolve(err);

                    } else {

                        if (typeof result.value === 'string' && self.translateValue) {
                            result.i18n = self.translateValue(result.value);
                        }

                        dfd.resolve(result);
                    }
                });
            }).fail(function(resp) {
                dfd.reject(resp);
            });


            return dfd.promise();
        },
        set: function(key, incoming) {
            var self = this;

            return this.createDatabase().done(function() {
                var args = Array.prototype.slice.call(arguments);

                if (args.length === 1 && typeof(args[0]) === 'object' && this.key) {
                    key = this.key;
                } else if (args.length === 1 && typeof(args[0]) === 'object' && !this.key) {
                    // {temperature:{value:'F'}}
                    _.each(args[0], function(value, key) {
                        self.set(key, value);
                    });
                } else {
                    key = key || this.key;
                }

                return self.put(key, incoming);

            });
        },
        put: function(key, incoming) {
            var dfd = $.Deferred();
            var self = this;

            var args = Array.prototype.slice.call(arguments);

            if (args.length === 1 && this.key) {
                key = this.key;
                incoming = args[0];
            } else {
                key = key || this.key;
            }

            var data = {
                _id: key,
                timestamp: Date.now()
            };

            _.extend(data, incoming);

            this.createDatabase().done(function() {
                self.get(key).then(function(resp) {
                    if (resp.status !== 404) {
                        delete data._rev;
                        _.extend(resp, data);
                    } else {
                        resp = data;
                    }

                    self.db.put(resp, function(err, response) {
                        if (err) {
                            dfd.reject(err);
                            DEBUG && console.log('SYNC:put error:' + JSON.stringify(err) + JSON.stringify(response));
                        } else {
                            DEBUG && console.log('THIS IS WHAT WE PUT INTO THE DB' + JSON.stringify(data), response);
                            //  self.to();
                            dfd.resolve(response);
                            if (self.emit) {
                                self.emit(key, incoming);
                            }
                        }

                    });

                });
            });


            return dfd.promise();
        },
        remove: function(key, rev) {

            var args = Array.prototype.slice(arguments);

            if (args.length === 1 && this.key) {
                key = this.key;
            } else {
                key = key || this.key;
            }

            var dfd = $.Deferred();
            var self = this;
            this.createDatabase().done(function() {
                self.db.get(key, {}, function(err, result) {
                    DEBUG && console.warn('DB DELETE:' + JSON.stringify(result));
                    if (result) {
                        self.db.remove(result, function(err, resp) {
                            if (err && err.status !== 404) {
                                dfd.reject(err);
                            } else {
                                dfd.resolve(resp);
                            }

                        });
                    } else if (err) {
                        dfd.reject(err);
                    }

                });
            });

            return dfd.promise();
        },
        delete: function() {
            return PouchDB.destroy(this.dbName);
        }
    });




    return PouchInterface;

});
define('widgets/wemo_firmwareupdate/main',['backbone', 'libs/cordovaPlugins/firmwareUpdatePlugin', 'libs/cordovaPlugins/networkPlugin', 'text!widgets/wemo_firmwareupdate/css/main.css', 'text!widgets/wemo_firmwareupdate/templates/firmwareupdateHeaderBtn.html','widgets/wemo_firmwareupdate/js/firmwareupdate','widgets/wemo_firmwareupdate/js/inprogress', 'libs/pouchInterfaceBaseObject'],
    function(Backbone, firmwareUpdatePlugin, networkPlugin, css, templateFirmwareupdateHeaderBtn, FirmwareUpdate, InProgress, DB) {

        'use strict';

        var sentFirmwareCompletedMsg = false,
            preventHoorayPopup = false;

        var exports = {
            name: 'wemo_firmwareupdate',
            type: 'Backbone',
            /**
             * starts the process
             */
            events: {
                'click .firmwareupdateHeaderBtn': 'showUpdate'
            },
            /**
             * instantiate firmware update
             */
            initialize: function() {
                _.bindAll(this);
                var self = this;
                this.sandbox.path = this.options.ref.replace(/main/, '');
                this.styles = css.replace(/\.\.\//g, this.sandbox.path + '/');
                this.stylesheet = new this.sandbox.util.Stylesheet(this.name, this.styles);


                this.sandbox.collection = new Backbone.Collection();
                this.sandbox.notesCollection = new Backbone.Collection();
                this.initializeDatabase();
                //  this.sandbox.dataInterface = new DataInterface();
                this.sandbox.firmwareupdate = new FirmwareUpdate({
                    sandbox: this.sandbox,
                    parentElement: $('.container')
                });

                this.sandbox.inprogress = new InProgress({
                    sandbox: this.sandbox,
                    parentElement: $('*[data-aura-widget="wemo_devices"]')
                });


                this.updateInProgress = false;
                this.updateAvailable = false;

                this.listen();
                // this.checkForInProgress();


                if(!window.sessionStorage.getItem('initGetUpdates')){

                    window.sessionStorage.setItem('initGetUpdates', 'true');
                    this.sandbox.util.storage.setItem('fwUpdateCheck', 'true', 7200000);

                    setTimeout(function(){
                        self.getAvailableUpdates();
                    }, 60000);
                }

                if(window.sessionStorage.getItem('remoteChanged')){
                    DEBUG && console.warn('firmwareUpdate:remote mode changed:calling getAvailableUpdates');
                    window.sessionStorage.removeItem('remoteChanged');
                    setTimeout(function(){
                        self.getAvailableUpdates();
                    },10000);

                }
            },
            /**
             * create/open the database. add whatever is in there to the collection
             */
            initializeDatabase: function() {
                var self = this;
                this.sandbox.db = new DB({
                    dbName: 'firmwareUpdateDB'
                });

                this.sandbox.db.getAll().then(function(resp) {
                    resp.forEach(function(item) {
                        var modelJSON = item.doc;
                        self.sandbox.collection.add(modelJSON);
                    });
                    self.listenOnParent();
                }).fail(function(err) {
                    console.warn(err);
                });
            },
            /**
             * set event listeners
             */
            listen: function() {
                var self = this;

                window.appEvents.emit('popup:open', this.pauseUpdatePopup);
                window.appEvents.emit('popup:close', this.doPopup);

                window.firmwareUpdatePlugin = {
                    //fired by native layer when a firmware status update is sent
                    onStatusChange: function(udn, status) {
                        self.onFirmwareUpdateStatusChange(udn, status);
                    },
                    onGetAvailableUpdates: function(resp) {
                        DEBUG && console.log('firmareUpdate:onGetAvailableUpdates:' + JSON.stringify(resp));

                        self.isUpdateAvailable(resp);
                    },
                    onCollection: function(resp) {
                          resp.forEach(function(item) {
                            self.addToCollection(item);
                        });
                    }
                };

                //listen for remote updates, in order to check for fw update on remote for current android.
                //this will go away with smartcache. currently fired in device_list.js->loadDevicesFromCloud

                //if we closed/relaunched app after starting fw upgrade
                if (this.sandbox.util.storage.getItem('firmwareUpdateInProgress')) {
                    self.updateInProgress = true;
                }

                //if we started fw upgrade after loading this
                this.sandbox.on('global.firmwareUpdateInProgress', function() {
                    self.updateInProgress = true;
                });

                this.sandbox.on('global.reset', this.reset);

                this.sandbox.on('showFirmwareUpdate', this.showUpdate);
                this.sandbox.on('showFirmwareUpdateInProgress', this.showFirmwareUpdateInProgress);
                this.sandbox.on('removeUpdateBadge', this.removeFirmwareupdateHeaderBtn);

                this.sandbox.on('global.deviceAdded', this.checkUpdateStatus);
                this.sandbox.on('global.getZigbeeStatusDone', this.getZigbeeStatusDone);

            },
            reset: function() {
                this.removeFirmwareupdateHeaderBtn();
                this.sandbox.db.delete('udn');
                this.sandbox.collection = new Backbone.Collection();
                this.sandbox.notesCollection = new Backbone.Collection();
                this.sandbox.util.storage.removeItem('fwUpdateCheck');
                if (window.sessionStorage.getItem('firmwareUpdateAvailable')) {
                    window.sessionStorage.removeItem('firmwareUpdateAvailable');
                    this.sandbox.emit('global.firmwareUpdateAvailable', false);
                }
            },
            /**
             * waits for the parent sandbox to finish initializing, and then listens for updates to device list
             */
            listenOnParent: function() {
                var self = this;

                if (this.sandbox.parentSandbox) {
                    this.sandbox.parentSandbox.on('deviceUpdated', function(device) {
                        DEBUG && console.warn('firmareUpdate:listenOnParent:deviceUpdated:' + JSON.stringify(device));
                        self.checkUpdateStatus(device);
                    });
                    this.sandbox.parentSandbox.on('bridgeUpdated', this.checkUpdateStatus);
                    //get what we missed
                    _.each(this.sandbox.parentSandbox.widgets, function(widget) {
                        self.checkUpdateStatus(widget);
                    });

                    _.each(this.sandbox.parentSandbox.bridges, function(bridge) {
                        self.checkUpdateStatus(bridge);
                    });

                } else {
                    setTimeout(function() {
                        self.listenOnParent();
                    }, 20);
                }
            },
            /**
             * listens for new or updated devices and checks them against collection.
             * @param  {JSON} widget device object
             */
            checkUpdateStatus: function(widget) {
                DEBUG && console.warn('firmareUpdate:checkUpdateStatus:widget:', widget);
                //we have an update collection
                if (this.statusTimer) {
                    clearTimeout(this.statusTimer);
                }

                //DEBUG && console.log('firmareUpdate:checkUpdateStatus:collection:' + JSON.stringify(this.sandbox.collection.toJSON()));

                var model = (!!widget && !!widget.information && !!widget.information.udn) ? this.sandbox.collection.findWhere({udn: widget.information.udn}) : null;

                DEBUG && console.warn('firmareUpdate:checkUpdateStatus:model length:' + model);

                //this device is in it
                if (model) {
                    DEBUG && console.warn('firmareUpdate:checkUpdateStatus:found device:' + JSON.stringify(model.toJSON()));
                    var version = model.get('version'),
                        baseVersion = model.get('baseVersion'),
                        udn = model.get('udn'),
                        currentFwVersion = widget.properties.firmwareVersion,
                        currentStatus = parseInt(widget.properties.fwStatus, 10) || parseInt(model.get('status')),
                        zigbeeFinished = false,
                        versionRev = model.get('versionRev'),
                        isZigbee = model.get('bridgeUDN');

                    //if its a zigbee device, check versionRev against firmwareVersion
                    //check that version or versionRev match. Some versions of Link were reporting versionRev instead of version
                    if (isZigbee && versionRev === widget.properties.firmwareVersion) {
                        zigbeeFinished = true;
                    }

                    switch(currentStatus){
                        case 0:
                        case 1:
                        case 3:
                            //status is in progress
                            this.onFirmwareUpdateStatusChange(udn, currentStatus);
                            break;
                        case 2:
                        case 4:
                        case 5:
                        case 6:
                            // status is completed
                            this.onFirmwareUpdateStatusChange(udn, currentStatus);
                        default:
                            // Zigbee
                            if(zigbeeFinished){
                                this.onFirmwareUpdateStatusChange(udn, currentStatus);
                            }

                            // status is NAN
                            var fwStatus = parseInt(widget.properties.fwStatus, 10);
                            var fwVersion = widget.properties.firmwareVersion;
                            if (!isNaN(fwStatus) && fwStatus >= 0 && fwStatus !== 4) {
                                this.onFirmwareUpdateStatusChange(widget.information.udn, fwStatus, fwVersion);
                            }
                    }

                    // check if an update is available
                    DEBUG && console.warn('firmwareUpdate:checkUpdateStatus:check for done:version: ' + version + ' :baseVersion: ' + baseVersion + ' :currentFwVersion: ' + currentFwVersion);

                    if(isZigbee && (versionRev)){
                        if( (versionRev.toLowerCase() !== currentFwVersion.toLowerCase())){
                            this.updateAvailable = true;
                            this.saveUpdateResponse(model.toJSON());
                        }
                    } else if((baseVersion && baseVersion.toLowerCase() !== currentFwVersion.toLowerCase()) || (version && version.toLowerCase() !== currentFwVersion.toLowerCase())){
                        this.updateAvailable = true;
                        this.saveUpdateResponse(model.toJSON());
                    }
                }


                this.statusTimer = setTimeout(this.setUpdateStatus, 3000);
            },
            setUpdateStatus: function() {
                console.warn('firmareUpdate:setUpdateStatus:updateAvailable: ' + this.updateAvailable + ' :updateInProgress: ' + this.updateInProgress);
                if (this.updateInProgress) {
                    this.setUpdateInProgress();
                }

                if (this.updateAvailable) {
                    this.setUpdateAvailable();
                    this.checkForUpdates();
                } else {
                    this.checkForUpdates();
                }
            },
            setUpdateInProgress: function() {
                this.sandbox.firmwareupdate.sendUpdate();
                window.sessionStorage.removeItem('firmwareUpdateAvailable');
            },
            setUpdateAvailable: function() {
                var self = this;
                    // 1. add the bug
                    this.addFirmwareupdateHeaderBtn();
                    window.sessionStorage.setItem('firmwareUpdateAvailable', 'true');
                    this.sandbox.emit('global.firmwareUpdateAvailable', true);

                    if (!self.sandbox.util.storage.getItem('firmwareupdatePopupFired') && window.localStorage.getItem('bridge_Popup_Present') != "true") {
                        // 2. show the popup */
                        if (!self.pausePopup) {
                            self.firmwareUpdatePopup();
                        } else {
                            self.popupWaiting = true;
                        }
                        // 3. expire in 24 hours
                        self.sandbox.util.storage.setItem('firmwareupdatePopupFired', 'true', 86400);
                    }
            },
            checkForUpdates: function() {
                DEBUG && console.warn('firmareUpdate:checkForUpdates');

                var self = this;
                if (this.checkForUpdatesTimer) {
                    clearTimeout(this.checkForUpdatesTimer);
                }

                if (!this.sandbox.util.storage.getItem('fwUpdateCheck')) {
                    this.checkForUpdatesTimer = setTimeout(function() {
                        //check no more than once every 2 hours
                        self.sandbox.util.storage.setItem('fwUpdateCheck', 'true', 7200000);
                        self.getAvailableUpdates();
                    }, 5000);
                }
            },
            /**
             * take the list of devices and pass it to cloud to see if update is available. format for cloud request
             */
            getAvailableUpdates: function() {
                var self = this;
                var devices = this.sandbox.parentSandbox.widgets;
                var bridges = this.sandbox.parentSandbox.bridges;

                if(this.sandbox.collection.length > 0){
                    this.sandbox.collection.reset();
                    this.sandbox.notesCollection.reset();
                    this.initializeDatabase();
                }


                var devicesToCheck = [];

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
                //if we're already in the middle of doing an update, this updates the tiles with current state instead
                if (!this.updateInProgress) {
                    _.each(devices, function(device) {
                        addDevice(device);
                    });

                    _.each(bridges, function(device) {
                        addDevice(device);
                    });
                    //response is in window method above
                    firmwareUpdatePlugin.getAvailableUpdates(devicesToCheck);
                }


            },
            /**
             * when all of the FWs have reported as finished, or we decide they are all done. Then we can stop inProgress and do another check.
             */
            finishUpdate: function(model, udn) {
                    this.clearStatusMessage(this.findSandbox(udn));

                this.sandbox.collection.remove(model);

                this.sandbox.db.remove(udn, model.get('_rev')).fail(function() {
                    DEBUG && console.warn('FIRMWAREUPDATE: DB DELETE FAILED:' + udn);
                });



                if (this.sandbox.collection.length === 0) {
                    this.sandbox.notesCollection.reset();
                    this.updateInProgress = false;
                    this.updateAvailable = false;
                    this.isZigbeeStatusDone = false;
                    this.sandbox.util.storage.removeItem('firmwareUpdateInProgress');
                    this.sandbox.util.storage.removeItem('firmwareUpdatePopupFired');
                    //these are for legacy app.
                    if (window.sessionStorage.getItem('firmwareUpdateAvailable')) {
                        window.sessionStorage.removeItem('firmwareUpdateAvailable');
                    }
                    if (window.sessionStorage.getItem('firmwareUpdateInProgress')) {
                        window.sessionStorage.removeItem('firmwareUpdateInProgress');
                    }
                    if(!preventHoorayPopup){
                        this.updateCompletePopup();
                    }

                    this.sandbox.emit('global.firmwareUpdateAvailable');
                    DEBUG && console.warn('firmwareUpdate:finishUpdate:update completed', this.updateInProgress, this.updateAvailable);
                    this.removeFirmwareupdateHeaderBtn();
                    sentFirmwareCompletedMsg = false;
                    preventHoorayPopup = false;
                    this.fwUpdateCompleted = "completed";
                    this.checkForUpdates();
                }
            },
            /**
             * check modelCodes in a collection. if there are 2+ zigbee devices with different model codes, they need to be updated
             * separately. when one type is done, make sure we fire off the second type.
             */
            /*checkZigbeeTypes: function(model) {
                var dfd = new $.Deferred();
                var self = this;
                var modelCode = model.get('modelCode');
                var sameModel = this.sandbox.collection.findWhere({
                    modelCode: modelCode
                });

                //there are no more of the same model code being updated
                if (!sameModel) {
                    setTimeout(function() {
                        var hasUpdate = self.doZigbeeUpdate();
                        if (hasUpdate) {
                            dfd.resolve();
                        } else {
                            dfd.reject();
                        }
                    }, 5000);
                    //wait five seconds for things to change from native side
                } else {
                    dfd.resolve();
                }
                return dfd;
            },
            doZigbeeUpdate: function() {
                var self = this;
                var hasUpdate = false;
                //get other zigbee devices
                var zigbee = this.sandbox.collection.filter(function(model) {
                    return model.get('bridgeUDN');
                });

                var zigbeeToUpdate = {};
                //loop through them and combine the same modelCodes
                zigbee.forEach(function(model) {
                    var modelCode = model.get('modelCode');
                    if (model && !model.get('status') || model.get('status') === '' || model.get('status') < 0) {
                        if (!zigbeeToUpdate[modelCode]) {
                            zigbeeToUpdate[modelCode] = self.sandbox.firmwareupdate.setUpdatePayload(model);
                        } else {
                            zigbeeToUpdate[modelCode].udn = zigbeeToUpdate[modelCode].udn + ',' + model.get('udn');
                        }
                    }
                });

                var updateArray = [];
                _.each(zigbeeToUpdate, function(obj) {
                    updateArray.push(obj);
                });

                if (updateArray.length > 0) {
                    DEBUG && console.warn('firmwareUpdate:doZigbeeUpdate:second modelcode found. sending update call.', updateArray);
                    firmwareUpdatePlugin.doFirmwareUpdate([updateArray[0]]); //only send one at a time.
                    hasUpdate = true;
                }
                return hasUpdate;
            },
            */
            /**
             * called when a bridge finishes getting status of zigbee devices
             */
            getZigbeeStatusDone: function() {
                DEBUG && console.log('firmwareUpdate:getZigbeeStatusDone:sending second available update request');
                //only call this if the check has already been fired, and only one time. otherwise devices will get picked up as normal.
                if (this.sandbox.util.storage.getItem('fwUpdateCheck') && this.isZigbeeStatusDone === false) {
                    this.getAvailableUpdates();
                    this.isZigbeeStatusDone = true;
                }

            },
            /**
             * check for bridge in collection, if there is a bridge, check for devices in sandbox attached to bridge. if not,
               and bridge is not currently updating, then send update command for bridge
             */
            /*checkForBridge: function() {
                var self = this;
                var bridge = this.sandbox.collection.filter(function(model) {
                    return model.get('udn').match(/\:bridge/gi);
                });

                if (bridge.length > 0) {
                    bridge.forEach(function(model) {
                        var udn = model.get('udn');
                        var zigbee = self.sandbox.collection.find({
                            bridgeUDN: udn
                        });

                        if (!zigbee) {
                            self.doBridgeUpdate(udn);
                        }
                    });
                }
            },
            /**
             * see if bridge is in progress. if not, send update call
             * @param  {UDN} udn udn of bridge device
             */
            /*  doBridgeUpdate: function(udn) {
                  var self = this;
                  setTimeout(function() {
                      var model = self.sandbox.collection.findWhere({
                          udn: udn
                      });
                      if (model && !model.get('status') || model.get('status') === '' || model.get('status') < 0) {
                          var payload = self.sandbox.firmwareupdate.setUpdatePayload(model);
                          DEBUG && console.warn('firmwareUpdate:checkForBridge:bridge found. sending update call.', payload);
                          firmwareUpdatePlugin.doFirmwareUpdate([payload]);
                      }
                  }, 5000);
              },*/
            /**
             * act on cached updates if there are any
             * @param {JSON array} resp [an array of JSON objects]
             */
            setAvailableUpdates: function(resp) {
                // resp = [{}]
                var self = this;
                if (_.isArray(resp)) {
                    resp.forEach(function(item) {
                        self.isUpdateAvailable(item);
                    });
                }
            },
            /**
             * process incoming updates if they are available
             * @param  {JSON collection}  resp [{udn:[{}]}]
             */
            isUpdateAvailable: function(resp) {
                var self = this;
                var device;
                var updates;
                var updateCount = 0;

                if (typeof resp === 'string') {
                    resp = JSON.parse(resp);
                }

                if (resp.updates) {
                    updates = resp.updates.wemoDeviceFirmwares;
                } else {
                    updates = resp.wemoDeviceFirmwares;
                }

                if (resp.errors && resp.errors.length > 0) {
                    console.error('FirmwareUpdate:isUpdateAvailable:ERRORS DETECTED:' + JSON.stringify(resp.errors));
                }


                //remove updates without firmware in it
                this.sandbox.util.removeFromArray(updates, function(update, index, updates) {
                    return update.firmwares.length === 0;
                });

                this.sandbox.releaseNotes = [];
                DEBUG && console.warn('firmwareUpdate:isUpdateAvailable:' + JSON.stringify(resp) + ':length:' + updates.length);
                //if there is an update. otherwise, it dies here.
                if (updates.length > 0) {
                    _.each(updates, function(update) {

                        //var isFound = false;
                        device = {
                            udn: update.uniqueId,
                            modelCode: update.modelCode
                        };
                        _.extend(device, update.firmwares[0]);
                        //get the friendlyname and bridgeUDN (to identify zigbee)

                        var deviceSandbox = self.findSandbox(update.uniqueId);

                        var objectReference;

                        if (deviceSandbox) {

                            if (deviceSandbox.model && deviceSandbox.model.baseObject) {
                                objectReference = deviceSandbox.model.baseObject;
                            } else if (deviceSandbox.information) {
                                objectReference = deviceSandbox;
                            }

                            if (objectReference) {
                                console.warn('deviceSandbox', deviceSandbox);

                                if (deviceSandbox.model) {
                                    device.defaultFriendlyName = deviceSandbox.model.get('defaultFriendlyName');
                                }
                                device.friendlyName = objectReference.properties.friendlyName;
                                device.bridgeUDN = objectReference.information.bridgeUDN;
                                device.productType = objectReference.information.productType;
                                device.groupID = objectReference.properties.groupID;
                                if(device.bridgeUDN && update.firmwares[0].versionRev){
                                        if(objectReference.properties.firmwareVersion.toLowerCase() != update.firmwares[0].versionRev.toLowerCase()){
                                            updateCount++;
                                            self.saveUpdateResponse(device);
                                        }
                                } else {
                                updateCount++;
                                self.saveUpdateResponse(device);
                                }
                            } else {
                                console.error('firmwareUpdate:isUpdateAvailable:objectReferenceNotFoundError:' + JSON.stringify(update));
                            }
                        }
                    });

                    if (updateCount > 0) {
                        this.setUpdateAvailable();
                    }

                }
            },
            /**
             * finds the sandbox that belongs to the udn, either in or out of a group
             * @param  {string} udn device id
             * @return {sandbox} the sandbox for this device
             */
            findSandbox: function(udn) {
                var deviceSandbox = this.sandbox.parentSandbox.sandboxes[udn];
                var thisSandbox;


                if (deviceSandbox) {
                    thisSandbox = deviceSandbox;
                } else {
                    //see if its in a group, and take the groupMaster, which is the visible tile
                    _.each(this.sandbox.parentSandbox.sandboxes, function(deviceSandbox) {
                        if (deviceSandbox.sandboxes) {
                            var groupSandbox = deviceSandbox.sandboxes[udn];
                            if (groupSandbox) {
                                thisSandbox = deviceSandbox.groupMasterSandbox;
                            }
                        }
                    });
                }
                if (!thisSandbox) {
                    //probably a bridge
                    var bridgeList = this.sandbox.util.storage.getItem('bridgeList');
                    if (bridgeList) {
                        _.each(bridgeList.data, function(bridge, bridgeUDN) {
                            if (bridgeUDN === udn) {
                                thisSandbox = bridge;
                                _.extend(thisSandbox, {
                                    bridge: true,
                                    udn: udn
                                });
                            }
                        });
                    }
                }
                return thisSandbox;
            },
            findBridgeSandboxes: function(udn) {
                var sandboxes = [];
                _.each(this.sandbox.parentSandbox.sandboxes, function(deviceSandbox) {
                    if (deviceSandbox.model) {
                        if (deviceSandbox.model.baseObject.information.bridgeUDN === udn) {
                            sandboxes.push(deviceSandbox);
                        }
                    }
                    //part of a group
                    else if (deviceSandbox.groupMasterSandbox) {
                        if (deviceSandbox.groupMasterSandbox.model.baseObject.information.bridgeUDN === udn) {
                            sandboxes.push(deviceSandbox.groupMasterSandbox);
                        }
                    }
                });

                return sandboxes;
            },
            /**
             * insert the device data into collection/db
             * @param {JSON} resp device fw info
             */
            addToCollection: function(resp) {
                var inCollection = this.sandbox.collection.findWhere({
                    udn: resp.udn
                });

                if(!inCollection){
                    DEBUG && console.warn('firmareUpdate:addToCollection:' + JSON.stringify(resp));
                    resp.timestamp = Date.now();
                    this.sandbox.collection.add([resp]);
                    // 5. add device to DB
                    return this.sandbox.db.set(resp.udn, resp);
                } else {
                    DEBUG && console.warn('firmareUpdate:addToCollection:Already Added' + JSON.stringify(resp));
                }
            },
            /**
             * determines whether to show popup/fw update bug, and puts fw update information into collection/db
             * @param  {JSON} resp FW update information for a single device
             */
            saveUpdateResponse: function(resp) {
                var self = this;
                //if resp.udn is not set, consider it a fail case.
                if (resp && resp.udn) {

                    var thisSandbox = this.findSandbox(resp.udn);

                    if (thisSandbox && thisSandbox.model) {
                        if(!resp.defaultFriendlyName){
                            resp.defaultFriendlyName = thisSandbox.model.get('defaultFriendlyName');
                        }

                        resp.wasDiscovered = thisSandbox.model.get('isDiscovered');
                    }

                    //add to notescollection by type, not for each unique id.
                    var inNotesCollection = this.sandbox.notesCollection.findWhere({
                        modelCode: resp.modelCode,
                        hwVersion: resp.hwVersion
                    });

                    DEBUG && console.warn('firmwareUpdate:inNotesCollection:resp:' + JSON.stringify(resp));
                    if (!inNotesCollection) {
                        DEBUG && console.warn('firmareUpdate:saveUpdateResponse:releaseNotes:' + resp.modelCode);

                        var releaseNotes = resp.releaseNotes.replace(/\nâ¢/g, "<li>").trim();

                        var note = {
                            modelCode: resp.modelCode,
                            timestamp: Date.now(),
                            productType: resp.modelCode,
                            releaseNotes: releaseNotes || '',
                            wasDiscovered: resp.wasDiscovered,
                            hwVersion: resp.hwVersion || 'v1'
                        };


                        if (resp.productType) {
                            note.productType = resp.productType;
                        }

                        if (note.productType === 'socket') {
                            note.productType = 'switch';
                        }

                        if (resp.defaultFriendlyName) {
                            note.displayName = resp.defaultFriendlyName;
                        } else {
                            note.displayName = note.productType;
                        }

                        resp.timestamp = Date.now();
                        this.sandbox.notesCollection.add([note]);

                        sessionStorage.setItem('releaseNote', JSON.stringify(this.sandbox.notesCollection))

                    } else if (resp.defaultFriendlyName) {
                        inNotesCollection.set('displayName', resp.defaultFriendlyName);
                    }

                    // 4. add device to collection by unique id and place in db for tracking status updates, etc.
                        self.addToCollection(resp);
                } else {
                    // when it fails, nothing happens
                    return false;
                }
            },
            pauseUpdatePopup: function() {
                this.pausePopup = true;
            },
            doPopup: function() {
                this.pausePopup = false;
                if (this.popupWaiting) {
                    this.firmwareUpdatePopup();
                    this.popupWaiting = false;
                }
            },
            /**
             * is called when JAVA layer sends status change for a devices firmware update
             * @param  {string} udn    unique device
             * @param  {string} status current fw update status
             * @param {string} baseVersion starting firmware version, if set, when it changes that means update is done
             */
            onFirmwareUpdateStatusChange: function(udn, status, baseVersion) {
                var self = this;
                var priority;
                status = parseInt(status, 10);

                //check if were updating to an "in progress" status. If so allow one completed message to emit.
                switch(status){
                    case 0:
                    case 1:
                    case 3:
                    case 7:
                        sentFirmwareCompletedMsg = true;
                        this.updateInProgress = true;
                        break;
                }

                DEBUG && console.warn('wemo_firmwareupdate:onFirmwareUpdateStatusChange:udn:' + udn + ':status:' + status);

                //check against the collection/db - if status is 4 see how much time has passed since status was 3
                var model = this.sandbox.collection.findWhere({
                    udn: udn
                });
                //device information is found. use it to check status, update tile etc.
                if (model) {
                    //get the sandbox, or the parent group sandbox if its a group
                    var thisSandbox = this.findSandbox(udn);

                    if (thisSandbox) {
                        var groupID = thisSandbox.model.get('groupID');
                        //this device is part of a group. decide what status to show on the tile
                        if (groupID) {
                            priority = this.setGroupStatus(thisSandbox, model, status);
                            //based on the results, change the updated device to the priority device
                            status = priority.status;
                            udn = priority.udn;
                            model = priority.model;
                        }
                        //we need to know if this is bridge, wifi or zigbee. bridge shows messages on all associated tiles, and has a custom sandbox;
                        if (thisSandbox) {
                            //bridge doesn't currently have a model or model.baseObject
                            if (thisSandbox.model && thisSandbox.model.baseObject.information.bridgeUDN) {
                                console.log('UPDATE ZIGBEE');
                                this.updateZigbeeStatus(thisSandbox, model, udn, status);
                            } else {
                                this.updateWifiStatus(thisSandbox, model, udn, status);
                            }
                        } else {
                            //sandbox wasn't found/not loaded yet. keep trying.
                            setTimeout(function() {
                                self.onFirmwareUpdateStatusChange(udn, status);
                            }, 50);
                        }
                    } else {
                        console.error('SANDBOX NOT FOUND: RED ALERT!');
                    }
                }
                //model doesn't exist - another app instance may have started the update. add it and then call the method again.
                else {
                    DEBUG && console.warn('firmareUpdate:onFirmwareUpdateStatusChange:notInCollection');
                    if (status !== 4) {
                        //create a record for this on this phone.
                        console.warn('BASEVERSION', baseVersion);
                        var resp = {
                            udn: udn,
                            status: status,
                            baseVersion: baseVersion //only added here
                        };
                        DEBUG && console.warn('firmareUpdate:onFirmwareUpdateStatusChange:notInCollection:' + JSON.stringify(resp));
                        self.addToCollection(resp).then(function() {
                            self.onFirmwareUpdateStatusChange(udn, status);
                        }).fail(function() {

                        });
                    }
                }
                //send the event to change the message on the tile
                //if 4 and finished, delete from collection/db and send event to tile to remove upgrade messaging
            },
            /**
             * groups should show updating status until all items in group are updated. even so, as a device reaches complete or fail, we can maybe delete it from the list
             * @param {Sandbox} sandbox the groupMasterSandbox
             * @param {integer} status
             */
            setGroupStatus: function(sandbox, model, status) {
                var self = this;
                var groupID = model.get('groupID');
                var priority = {};
                var priorityModel;
                var thisUDN = model.get('udn');

                var checkForFinished = function(status) {
                    var models = self.sandbox.collection.where({
                        groupID: groupID,
                        status: status
                    });

                    if (models.length > 0) {
                        _.each(models, function(model) {
                            if(sentFirmwareCompletedMsg) {
                                self.finishUpdate(model, model.get('udn'));
                            }
                        });
                    }

                    return models.length;
                };

                var priorityArray = [3, 1, 5];

                checkForFinished(2);
                checkForFinished(4);

                priorityArray.forEach(function(value) {
                    priorityModel = self.sandbox.collection.findWhere({
                        groupID: groupID,
                        status: value
                    });
                    DEBUG && console.warn('firmareUpdate:setGroupStatus:priority found:', priorityModel);
                    if (priorityModel && priorityModel.get('udn') !== thisUDN) {
                        if (!priority.status) {
                            priority = {
                                status: value,
                                udn: priorityModel.get('udn'),
                                model: priorityModel
                            };
                        }
                    }
                });


                if (!priority.status) {
                    priority = {
                        status: status,
                        udn: model.get('udn'),
                        model: model
                    };
                } else {
                    if (status === 4) {
                        if(sentFirmwareCompletedMsg) {
                            self.finishUpdate(model, model.get('udn'));
                        }
                    }
                }

                return priority;
            },
            updateZigbeeStatus: function(thisSandbox, model, udn, status) {
                DEBUG && console.warn('firmareUpdate:updateZigbeeStatus:udn:' + udn + ':status:' + status);

                firmwareUpdatePlugin.sendUpdateStatus({
                    udn: udn,
                    status: status
                });

                if(!isNaN(status)) {

                    this.emitStatusMessage(thisSandbox, status);

                    switch(status){
                        case 5:
                        case 6:
                            preventHoorayPopup = true;
                    }

                    switch (status) {
                        case 2:
                        case 4:
                        case 5:

                        case 6:
                            if (sentFirmwareCompletedMsg) {
                                this.finishUpdate(model, udn);
                            }
                            break;
                        default:
                            this.updateModel(model, udn, status);
                    }
                }


            },
            /**
             * update the fw status of a wifi device. status # doesn't mean the same for wifi and zigbee
             * @param  {sandbox} thisSandbox device sandbox
             * @param  {backbone.model} model   the fwupdate model for the device
             * @param  {string} udn         udn of the device
             * @param  {integer} status     current status
             */
            updateWifiStatus: function(thisSandbox, model, udn, status) {
                DEBUG && console.warn('firmareUpdate:updateWifiStatus:' + udn + ':' + status);
                if (thisSandbox.bridge) {
                    var sandboxes = this.findBridgeSandboxes(thisSandbox.information.udn);
                    sandboxes.forEach(function(sandbox) {
                        switch(status){
                            case 0:
                            case 1:
                            case 3:
                            case 7:
                                sandbox.emit('changeBridgeUpdating', true);
                                break;
                            default:
                                sandbox.emit('changeBridgeUpdating', false);
                                break;
                        }

                    });
                }

                // send status to the tile
                this.emitStatusMessage(thisSandbox, status);

                //If any upgrade sends a failed status, prevent the hooray popup from firing when they complete
                switch(status){
                    case 5:
                    case 6:
                        preventHoorayPopup = true;
                }

                //If the status is completed, finish the update other wise update the model
                switch(status){
                    case 2:
                    case 4:
                    case 5:
                    case 6:
                        if(sentFirmwareCompletedMsg){
                            this.finishUpdate(model, udn);
                        }
                        break;
                    default:
                        this.updateModel(model, udn, status);
                }
            },
            /**
             * sends the status to the tile
             * @param  {obj} thisSandbox device sandbox
             * @param  {integer} status      0-6 status of fw update
             */
            emitStatusMessage: function(thisSandbox, status) {
                //If sent firmware is set to false, we've either already sent the message or killed and relaunch
                DEBUG && console.warn('firmareUpdate:emitStatusMessage1:status:' + status);
                if(!sentFirmwareCompletedMsg){
                    //Check if were trying to emit a completed status, if so, dont emit
                    switch(status){

                        case 4:
                            return;
                            break;
                    }
                }


                var self = this;

                    DEBUG && console.warn('firmareUpdate:emitStatusMessage2:' + status);
                    thisSandbox.emit('firmwareUpdateStatus', status, this.i18n('wifistatus.' + status));
                    if (thisSandbox.bridge) {
                        var sandboxes = this.findBridgeSandboxes(thisSandbox.information.udn);
                        var message = status !== 'clear' ? self.i18n('wifistatus.9' + status) : '';

                        sandboxes.forEach(function (sandbox) {
                            if (sandbox.clearStatusTimer) {
                                clearTimeout(sandbox.clearStatusTimer);
                            }
                            DEBUG && console.warn('firmareUpdate:emitStatusMessageLED:bridgeSandbox:' + thisSandbox.information.udn + ':' + JSON.stringify(sandbox.model.toJSON()));
                            console.log('Status: ' + status + ' Message: ' + message);
                            sandbox.emit('firmwareUpdateStatus', status, message);
                        });
                    }

            },
            /**
             * removed firmware update message when finished after N seconds.
             * @param  {sandbox} thisSandbox the device sandbox
             */
            clearStatusMessage: function(thisSandbox) {
                var self = this;
                thisSandbox.clearStatusTimer = setTimeout(function() {
                    self.emitStatusMessage(thisSandbox, 'clear');
                }, 120000); //2 minutes

            },
            /**
             * updates the model with the data
             * @param  {backbone.model} model  [description]
             * @param  {string} udn    [description]
             * @param  {integer} status [description]
             */
            updateModel: function(model, udn, status) {
                var now = Date.now();
                model.set('timestamp', now);
                model.set('status', status);
                this.sandbox.db.set(udn, model.toJSON());
            },
            /**
             * shows the updata available popup on UI
             */
            firmwareUpdatePopup: function() {
                var self = this;
                this.popup = new this.sandbox.dom.Alert({
                    title: self.i18n('popup', 'title'),
                    popupClass: 'firmwareUpdatePopup',
                    message: self.i18n('popup', 'message'),
                    buttonLabels: self.i18n('popup', 'labels'),
                    confirmCallback: self.showUpdate
                });
            },
            updateCompletePopup: function() {
                var self = this;
                this.popup = new this.sandbox.dom.Alert({
                    title: self.i18n('completePopup', 'title'),
                    popupClass: 'firmwareUpdatePopup',
                    message: self.i18n('completePopup', 'message'),
                    buttonLabels: self.i18n('completePopup', 'button')
                });
            },
            /**
             * opens the firmware update view
             */
            showUpdate: function(onEvent) {
                var self = this;
                var pop = function() {
                    self.sandbox.firmwareupdate.close();
                    window.removeEventListener('popstate', pop);
                };


                this.sandbox.firmwareupdate.initialRender();

                if (onEvent === true) {
                    window.addEventListener('popstate', pop);
                    this.sandbox.firmwareupdate.setDuration(0);
                    this.sandbox.firmwareupdate.open();
                } else {
                    this.sandbox.firmwareupdate.open();
                }
            },
            /**
             * opens the firmware in progress view
             */
            showFirmwareUpdateInProgress: function(onEvent) {
                var self = this;
                var pop = function() {
                    self.sandbox.inprogress.close();
                    window.removeEventListener('popstate', pop);
                };

                this.sandbox.inprogress.initialRender();
                if (onEvent === true) {
                    window.addEventListener('popstate', pop);
                    this.sandbox.inprogress.setPreviousElement($('*[data-aura-widget="wemo_devices"]'));
                    this.sandbox.inprogress.setDuration(0);
                    this.sandbox.inprogress.open();
                } else {
                    this.sandbox.inprogress.open();
                }
            },
            /**
             * adds the firmware update badge to the top of UI
             */
            addFirmwareupdateHeaderBtn: function() {
                var notDiscoveredDevicesArray = _.filter (this.sandbox.parentSandbox.widgets, function(device) {
                    return device.properties.isDiscovered == false;
                });
                if(notDiscoveredDevicesArray.length > 0){
                    //We have device(s) with isDiscovered set to false

                    var firmwareUpgradeDevices = this.sandbox.collection.models;

                    for (var i = 0; i < firmwareUpgradeDevices.length; i++) {
                        //Setting default to true
                        firmwareUpgradeDevices[i].set('wasDiscovered', true);
                        for (var j = 0; j < notDiscoveredDevicesArray.length; j++) {
                            if (notDiscoveredDevicesArray[j].information.udn == firmwareUpgradeDevices[i].get('udn')) {
                                //Adding wasDiscovered to the firmware upgrade array for the devices which are not discovered
                                firmwareUpgradeDevices[i].set('wasDiscovered', false);
                            }
                        }
                    }

                    //Now we have to find if there's any firmwareUpgradeDevice with  wasDiscovered==true
                    var firmwareUpgradeDevicesWhichAreDiscoverable = _.filter (firmwareUpgradeDevices, function(device) {
                        return device.get('wasDiscovered') == true;
                    });


                    if(firmwareUpgradeDevicesWhichAreDiscoverable.length > 0){
                        window.sessionStorage.setItem('showFirmwareUpdateAvailable', 'true');
                        if (!this.$headerBtn && !this.updateInProgress) {
                            this.$headerBtn = $(templateFirmwareupdateHeaderBtn);
                            this.$el.append(this.$headerBtn);
                            this.delegateEvents();
                            this.moveFirmwareupdateHeaderBtn($('#headerComponent .controls'));
                        }
                    } else {
                        this.removeFirmwareupdateHeaderBtn();
                        window.sessionStorage.setItem('showFirmwareUpdateAvailable', 'false');
                        this.sandbox.emit('global.firmwareUpdateAvailable', false);
                    }
                } else {
                    window.sessionStorage.setItem('showFirmwareUpdateAvailable', 'true');
                    if (!this.$headerBtn && !this.updateInProgress && this.fwUpdateCompleted !== "completed") {
                        this.$headerBtn = $(templateFirmwareupdateHeaderBtn);
                        this.$el.append(this.$headerBtn);
                        this.delegateEvents();
                        this.moveFirmwareupdateHeaderBtn($('#headerComponent .controls'));
                    }
                }

            },
            /**
             * moves the bug into the proper place in the header
             * @param  {DOM element} el element to move the bug to
             */
            moveFirmwareupdateHeaderBtn: function(el) {
                var $el = $(el);
                if ($el.length > 0) {
                    this.$headerBtn.detach().prependTo($el);
                }
            },
            /**
             * removes the fw update badge from UI
             */
            removeFirmwareupdateHeaderBtn: function() {
                if (this.$headerBtn) {
                    this.$headerBtn.remove();
                    delete this.$headerBtn;
                }
            }

        };

        return exports;
    });
}());