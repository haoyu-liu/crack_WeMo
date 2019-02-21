(function () {
define('text!widgets/wemo_menu1/css/main.css',[],function () { return '.wemo_menu1 {\n    position:absolute;\n    top:0;\n    left:0;\n    width: 100%;\n    height:100%;\n    background: #fff;\n    overflow-y: auto;\n    font-weight: 400;\n    z-index: 110;\n    display: none;\n}\n.wemo_menu1.show {\n    display: block;\n}\n.wemo_menu1 ul {\n    -webkit-margin-before: 0;\n    -webkit-margin-after: 0;\n    padding: 0;\n}\n.wemo_menu1 li {\n    list-style: none;\n}\n.wemo_menu1  .menu_item {\n    color: #444;\n    font-size: 1em;\n    font-family: \'Roboto\', sans-serif !important;\n    border-bottom: 1px solid #ddd;\n    padding: 0.7em 0 0.7em 1em;\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB0AAAAwCAYAAADtoXHnAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoTWFjaW50b3NoKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDowQzU3RENBQTA4MjAxMUU2OTc3QUU4QzJENEZCRjg1NyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDowQzU3RENBQjA4MjAxMUU2OTc3QUU4QzJENEZCRjg1NyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjM5OUJEN0Y1MDgxQzExRTY5NzdBRThDMkQ0RkJGODU3IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjM5OUJEN0Y2MDgxQzExRTY5NzdBRThDMkQ0RkJGODU3Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+eSUniAAAA5hJREFUeNrEmF9Ik1EUwPv2J6elIYmMiTq1Fx98sqinekgzW6VIiiUUFWhBEiRFgVQkEUEZ0R8hQkgkrHxQi0qt6KEgIkgoggTdnLBgNmGsNKeb/W58Qsh2Bb+7uvBxLt6z7+c599xzz/m0+fn5Ff96aP8FujABbnK73UUaw+l0fkJEEgr1er2O2dnZXqbr//xR04YQtfn5+V8TBh0dHX2IpdWL1ibMZnMZVn9MFPQ70LUx1oM8OwsKCt6ohJr0/fTFWV+Dqwc8Hk+5cihuPB9PgX8oORKJ9OKNGuXRS+Q2ALgtojimoqZFEQ0E111lUB28NxqN3mNqjfsDTTsJ+IoyqBgjIyMuXvxIuFUCvgi4WRlUt3gLFvcxTZOAb+Xl5TUi55VAxRgbGyuem5t7zjRDAu4EfBA5pwQqBkelkMgdZJolAfcBrkHOKIHqrnbi6hdMCyRqr1JTUysyMzN/KIHqYDvgAaZFEovfW63W8uzs7EklUH2P03H1M6J6o0TtM4lmG/n6mxKoGH6/f3UoFOphulVi8ajJZCoB7FYC1dNiEimxi2mlBOzD4tLc3NwvSqA62Mw+tyP3S8ABi8WyPScn54MSqA7WAF9HNkrUQrh6N0fqtRLowsDVLYCbJRb/EgUCd/ITZVA9X59AXJWoiIx1APB9ZVDd4sOIO7KrkbVjgNuUQXVwNS/uZLpSonbGpLTg0rQJRHgJHYdK9+5CiKrSJgG2cA+fVRVI+xCi4rBI1JrYz1YlgQTwKBbclARQhLV6gO1KjgzA04hLEpUw0Dpc2q0kOQC8jDgl2b8pniqyUb+KhC8arTbhMolakLzrIuG/NZzwAVmJ0g7RXMluQPJtGRYOGb7axsfHk8PhsNibHTI1nhKCZtjwJR4IBNKCweBjLN0s2cNh1ksBeg2XKz6fL2N6elqUosUS4FBKSkqZ3W73Gy7McGkWzfIgFhRK1ESwuLAwaLgEBbhOBzolFvbbbLYqh8MxZbjY5gyKbw8DAO0SYDcRWocMG24rOIObgD3lSY/b1JpM7VR79cv9GKItsrCEF/UAXCUBXgPYtJzGKVZTXEkVL0rLJAnwHC69oOpDxx5Elygt4+yfsOo4ifuGkstetAu0hJ54vai+b4cAdqi68C30Jxskze8M0Fpc2qOyrOEysPg4j7Es/ElrUMFN8TJRH68esJ81fwEneVxY+C5hn+n03uQIU5HQvURp61LtnpHxW4ABADekqgSllM8SAAAAAElFTkSuQmCC);\n    background-size: 13px auto;\n    background-repeat: no-repeat;\n    background-position: 95% 50%;\n}\n.wemo_menu1 .menu_item .item_content {\n    overflow: auto;\n    line-height: normal;\n}\n.wemo_menu1 .group_name {\n    color: #444;\n    text-transform: uppercase;\n    font-size: 0.875em;\n    background-color: #eee;\n    border-bottom: 1px solid #ddd;\n    padding: 1.5em 0 0.63em 1em;\n}\n.wemo_menu1 ul {\n    position: absolute;\n    top: 54px;\n    width: 100%;\n    z-index: 1;\n}\n.wemo_menu1 header{\n    width:100%;\n    height:54px;\n    color: white;\n    font-size: 1em;\n    position: fixed;\n    background-color: #73d44c;\n    z-index: 2;\n}\n.wemo_menu1 header .closeMenu {\n    display: block;\n    float: left;\n    position: relative;\n    width: 22px;\n    height: 22px;\n    background-size: contain;\n    background-position: left center;\n    background-repeat: no-repeat;\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAABQCAYAAABf9vbdAAAAAXNSR0IArs4c6QAAAm9JREFUaAXtWT1LA0EQzYkgKAhWEkUEGxVE1FpRGxs7wdLCQvA/aG8pFv4IEXsRQSxtNCASUWwtbPxACyMmvrlkwyZGze2sOxeYhZfdrDe7782+3Yt3mYwW2QxEstN/n71UKo2hdxWYAvqBS+AM2I2i6A11OguItwMbwDvQqNyhczaV7EGMyB80Yl3XV8D38VSJAKFmyRst5xSTChEO5I2IBSOgzTRC15Us7mHeJYe5J02MiAAmeeI+JCbAA3ninjcCgtZEHmjmtMFlv5aZoMRpMtDxRf6olcm/IBGDQQV4zPwrxgp7J1byyACKZj7RnkHGfJ02mnnNfLwFk32obdQ2yRwTX622UduobRJ5wOFiZFh/HiAJetokMo/apnw0qW0S2YYuRuL2y8ljfYbPfIX8Got2OViMfC/mf2YKCE7efrg7j1XoppVwLPT6ZxGvgU4d453CbAHVR9YOI4mQJ562ANfsi5GvF/DhkPkiYlZC28bmaa+AyytXit/Cxs/ag4ZscwUQ12HgREqELSDHyJyoiJg3MjgKFAFOuUawmJ3oZ8QOh30lVk4ECHQB+VYX0QcBNyqinAFRO+lKWDbUlWDco+L/0tROaieWh6xgZFLtpHayHMFqqp0sL6GpNzu1k+4J3ROsXVAbrHZSO9U6gvXNo52uMFYni4xrsEcR264c2HGeRHxinBFDxn42avr+rcZj+HsMPgfcMiYhztMmPqgAmtSTiAkxAZ5EPIkK8CDiwggQrx029gNiesSJ2wQSili2Y1PThogscAz8VAr4w2ZqCDciAoIRsA7kACJM5RE4BKonT6PY1PWBcAcw8BexL9t44wiKYY9EAAAAAElFTkSuQmCC);\n    margin-left: 14px;\n    margin-top: 16px;\n}\n.wemo_menu1 header .title {\n    display: block;\n    float: left;\n    line-height: 55px;\n}\n.wemo_menu1 .menu_item:active {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB0AAAAwCAYAAADtoXHnAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoTWFjaW50b3NoKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozOTlCRDdFRjA4MUMxMUU2OTc3QUU4QzJENEZCRjg1NyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozOTlCRDdGMDA4MUMxMUU2OTc3QUU4QzJENEZCRjg1NyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjM5OUJEN0VEMDgxQzExRTY5NzdBRThDMkQ0RkJGODU3IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjM5OUJEN0VFMDgxQzExRTY5NzdBRThDMkQ0RkJGODU3Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+j49xFwAABmZJREFUeNq0mAlI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);\n    background-size: 12px auto;\n    background-repeat: no-repeat;\n    background-position: 95% 50%;\n}\n.wemo_menu1 .menu_item#firmwareUpdate {\n    color: #73d44c;\n}\n.wemo_menu1 #remoteAccess .status {\n    color: #999;\n    float: right;\n    margin-right: 12%;\n}\n';});

/* START_TEMPLATE */
define('hbs!widgets/wemo_menu1/templates/menu',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n        <li class=\"group_name\">";
  if (stack1 = helpers.groupName) { stack1 = stack1.call(depth0, {hash:{}}); }
  else { stack1 = depth0.groupName; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</li>\n        ";
  stack1 = helpers.each.call(depth0, depth0.items, {hash:{},inverse:self.noop,fn:self.program(2, program2, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n    ";
  return buffer;
  }
function program2(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n            <li class=\"menu_item\" id=\"";
  if (stack1 = helpers.path) { stack1 = stack1.call(depth0, {hash:{}}); }
  else { stack1 = depth0.path; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\" data-path=\"";
  if (stack1 = helpers.path) { stack1 = stack1.call(depth0, {hash:{}}); }
  else { stack1 = depth0.path; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\" data-url=\"";
  if (stack1 = helpers.url) { stack1 = stack1.call(depth0, {hash:{}}); }
  else { stack1 = depth0.url; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\" data-option=\"";
  if (stack1 = helpers.option) { stack1 = stack1.call(depth0, {hash:{}}); }
  else { stack1 = depth0.option; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">\n                <span class=\"item_content\">";
  if (stack1 = helpers.title) { stack1 = stack1.call(depth0, {hash:{}}); }
  else { stack1 = depth0.title; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</span>\n            </li>\n        ";
  return buffer;
  }

  buffer += "<header>\n    <span class=\"closeMenu\"></span>\n    <span class=\"title\">";
  if (stack1 = helpers.title) { stack1 = stack1.call(depth0, {hash:{}}); }
  else { stack1 = depth0.title; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</span>\n</header>\n<ul>\n    ";
  stack1 = helpers.each.call(depth0, depth0.menuItems, {hash:{},inverse:self.noop,fn:self.program(1, program1, data)});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n</ul>\n";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_menu1_templates_menu', t);
return t;
});
/* END_TEMPLATE */
;
define('widgets/wemo_menu1/main',['backbone', 'text!widgets/wemo_menu1/css/main.css', 'hbs!widgets/wemo_menu1/templates/menu', "libs/constants"], function(Backbone, css, template, constants) {
    'use strict';

    var exports = {
        name: 'wemo_menu',
        type: 'Backbone',
        /**
         * starts the process
         */
        events: {
            'click .menu_item': 'visitMenuItem',
            'click .closeMenu': 'hideMenu',
            'click .title': 'hideMenu'
        },
        initialize: function() {
            _.bindAll(this);
            var self = this;
            this.sandbox.path = this.options.ref.replace(/main/, '');
            this.styles = css.replace(/\.\.\//g, this.sandbox.path + '/');
            this.stylesheet = new this.sandbox.util.Stylesheet(this.name, this.styles);
            var getInTouchURL = "file:///android_asset/www/more/get_in_touch_with_us.html",
                getInTouchText = self.i18n('menu', 'getInTouchWithUs'),
                getInTouchURLType = "internal";

            if (parseInt(constants.isBetaApp) === 1) {
                var appVersion = window.localStorage.getItem("appVersion");
                getInTouchURL = "mailto:wemoproblemreports@belkin.com?subject="+appVersion+"-- BETA FEEDBACK ",
                getInTouchText = self.i18n('menu', 'reportaProblem'),
                getInTouchURLType = "external";
               DEBUG && console.log("isBetaApp"+ constants.isBetaApp);
            }


            this.menu = [{
                "groupName": self.i18n('category', 'settings'),
                "items": [{
                    "path": "firmwareUpdate",
                    "url": "#page/wemo_devices/showFirmwareUpdate",
                    "title": self.i18n('menu', 'firmwareUpdate'),
                    "option": "internal"
                }, {
                    "path": "remoteAccess",
                    "url": "file:///android_asset/www/more/remote_access.html",
                    "title": self.i18n('menu', 'remoteAccess'),
                    "option": "internal"
                }, {
                    "path": "settingsAbout",
                    "url": "file:///android_asset/www/more/more_settings.html",
                    "title": self.i18n('menu', 'settingsAbout'),
                    "option": "internal"
                }, {
                    "path": "ifttt",
                    "url": "file:///android_asset/www/more/ifttt.html",
                    "title": self.i18n('menu', 'ifttt'),
                    "isExternal": "false"
                }, {
                    "path": "nest",
                    "url": "file:///android_asset/www/more/nest.html",
                    "title": self.i18n('menu', 'nest'),
                    "isExternal": "false"
                },{
                    "path": "alexa",
                    "url": "file:///android_asset/www/more/alexa.html",
                    "title": self.i18n('menu', 'alexa'),
                    "option": "internal"
                }]
            }, {
                "groupName": self.i18n('category', 'addWeMoDevice'),
                "items": [{
                    "path": "addLinkDevices",
                    "url": "file:///android_asset/www/led/setup/led_setup.html",
                    "title": self.i18n('menu', 'addLinkDevices'),
                    "option": "internal"
                }, {
                    "path": "setupInstructions",
                    "url": "file:///android_asset/www/more/demo_setup_device.html?type=nopopup",
                    "title": self.i18n('menu', 'setupInstructions'),
                    "option": "internal"
                }]
            }, {
                "groupName": self.i18n('category', 'supportFeedback'),
                "items": [{
                    "path": "learnAboutWemo",
                    "url": "file:///android_asset/www/more/learn_about_wemo.html",
                    "title": self.i18n('menu', 'Tutorials')
                },{
                    "path": "WeMoCommunity",
                    "url": "http://www.belkin.com/embed/en-us/wemo/community",
                    "title": self.i18n('menu', 'WeMoCommunity'),
                    "option": "external"
                }, {
                    "path": "supportArticles",
                    "url": self.i18n('menu', 'help_url'),
                    "title": self.i18n('menu', 'supportArticles'),
                    "option": "external"
                }, {
                    "path": "getInTouchWithUs",
                    "url": getInTouchURL,
                    "title": getInTouchText,
                    "option": getInTouchURLType
                }, {
                    "path": "rateWemo",
                    "title": self.i18n('menu', 'rateWeMo'),
                    "option": "native"
                }]
            }];

            this.render();
            this.delegateEvents();
            this.listen();
            this.showFirmwareUpdate();

        },
        listen: function() {
            var self = this;
            this.sandbox.on('global.showMenu', this.showMenu);
            this.sandbox.on('global.load:finish', this.hideMenu);
            this.sandbox.on('global.firmwareUpdateAvailable', this.showFirmwareUpdate);
            this.sandbox.on('global.firmwareUpdateInProgress', this.showFirmwareUpdate);
            this.sandbox.on('global.onNetworkChanged', function(status) {
                self.redirectMenuPage(status);
            });
        },
        render: function() {
            var self = this;
            var html = template({
                menuItems: this.menu,
                title: self.i18n("pageTitle")
            });

            self.$el.addClass(self.name);
            self.$el.html(html);

            var status = "<span class='status'></span>";
            this.$("#remoteAccess").append(status);
        },

        updateMenuItems: function() {
            var self = this;
            var ifBridgePresent = window.sessionStorage.getItem('BridgePresent'),
                isRemoteEnabled = window.sessionStorage.getItem('isRemoteEnabled');

            this.isOnRemoteMode = window.sessionStorage.getItem('isRemote');

            if ((this.isOnRemoteMode === "false") && (ifBridgePresent === "true")) {
                window.sessionStorage.setItem("PairedDevices", "alreadypaired");
                this.$("#addLinkDevices").show();
            } else {
                this.$("#addLinkDevices").hide();
            }

            var isEnabled = (isRemoteEnabled === "false") ? "NotEnabled" : "Enabled";
            this.$("#remoteAccess .status").html(self.i18n('menu', isEnabled));
        },

        showMenu: function() {
            var self = this;
            this.isMenuOpen = true;

            this.updateMenuItems();
            this.$el.addClass("show");
            $('.smart-overlay').hide();

            this.addBackButtonCommand({
                key: 'closeMenu',
                callback: function() {
                    self.hideMenu();
                }
            });
        },
        hideMenu: function() {
            this.isMenuOpen = false;
            this.$el.removeClass("show");
            $('.smart-overlay').show();
        },
        visitMenuItem: function(e) {
            var self = this;
            var $target = $(e.currentTarget);

            var option = $target.data('option'),
                url = $target.data('url'),
                path = $target.data("path");


            if (option === "external") {
                self.loadExternalUrl(url);
            } else if (path === "rateWemo") {
                //calling native code to load wemo play store page
                cordova.exec(function(url) {
                    self.loadExternalUrl(url);
                }, self.reportError(), 'NativeUtilPlugin', 7004, []);

            } else {
                $('.smart-overlay').show();
                var match = new RegExp(url, 'gi');
                if (!window.location.href.match(match)) {
                    window.location.href = url;
                }

                if (url.match(/\#/)) {
                    this.$el.removeClass("show");
                }
                window.sessionStorage.setItem("PreviousUrl", document.URL);
                if(path === "settingsAbout") {
                    window.sessionStorage.setItem("loadMoreMenu", true);
                }
            }

            //call actions.STOP_DEVICE_LISTENERS in local mode
            if (this.isOnRemoteMode === "false") {
                cordova.exec(null, null, 'DevicePlugin', 2006, []);
            }
        },
        redirectMenuPage: function(status) {
            if (!status.isNetworkenabled && this.$el.hasClass('show')) {
                var MORE_MENU = "file:///android_asset/www/more/more_menu.html";
                window.sessionStorage.setItem("isNetworkenabledKey", status.isNetworkenabled);
                window.sessionStorage.setItem("networkTypeKey", status.networkType);
                window.location.href = MORE_MENU;
            }
        },
        loadExternalUrl: function(url) {
            navigator.app.loadUrl(url, {
                openExternal: true
            });
        },
        reportError: function() {
            DEBUG && console.log('Get play store url return error!!');
        },
        showFirmwareUpdate: function(options) {
            options = options || {};
            var inProgress = this.sandbox.util.storage.getItem('firmwareUpdateInProgress');
            var available = window.sessionStorage.getItem('firmwareUpdateAvailable');
            var showFirmwareUpdateAvailable = window.sessionStorage.getItem('showFirmwareUpdateAvailable');
            var $fwUpdate = this.$('#firmwareUpdate');
            var $fwUpdateContent = this.$('#firmwareUpdate .item_content');
            if (inProgress) {
              var isInProgress = (inProgress.data === "true");
            }

            $fwUpdate.hide();

            /*if (inProgress || options.inProgress) {
                $fwUpdate.html(this.i18n('menu', 'firmwareUpdateInProgress')).show();
                $fwUpdate.data('url', '#page/wemo_devices/showFirmwareUpdateInProgress');
            } else */

            DEBUG && console.log("More menu :: showFirmwareUpdateAvailable :: " + showFirmwareUpdateAvailable);

            if ((available || options.available) && !isInProgress && (showFirmwareUpdateAvailable !== 'false')) {
                $fwUpdateContent.text(this.i18n('menu', 'firmwareUpdate'));
                $fwUpdate.show();
                $fwUpdate.data('url', '#page/wemo_devices/showFirmwareUpdate');
            } else {
                $fwUpdate.hide();
            }
        }

    };

    return exports;

});
}());