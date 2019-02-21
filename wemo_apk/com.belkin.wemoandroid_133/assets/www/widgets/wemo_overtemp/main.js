(function () {
define('text!widgets/wemo_overtemp/css/main.css',[],function () { return '.wemo_overtemp header {\n    background: #73D44C;\n    height: 56px;\n    display: flex;\n    align-items: center;\n}\n.wemo_overtemp header .back {\n    min-width: 70%;\n}\n.wemo_overtemp header .back .title{\n    font-size: 18px;\n    color: white;\n    margin-left: 30px;\n}\n.wemo_overtemp header .back .backIcon {\n    position: absolute;\n    top: 8px;\n    left: 10px;\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAABQCAYAAABf9vbdAAAAAXNSR0IArs4c6QAAAm9JREFUaAXtWT1LA0EQzYkgKAhWEkUEGxVE1FpRGxs7wdLCQvA/aG8pFv4IEXsRQSxtNCASUWwtbPxACyMmvrlkwyZGze2sOxeYhZfdrDe7782+3Yt3mYwW2QxEstN/n71UKo2hdxWYAvqBS+AM2I2i6A11OguItwMbwDvQqNyhczaV7EGMyB80Yl3XV8D38VSJAKFmyRst5xSTChEO5I2IBSOgzTRC15Us7mHeJYe5J02MiAAmeeI+JCbAA3ninjcCgtZEHmjmtMFlv5aZoMRpMtDxRf6olcm/IBGDQQV4zPwrxgp7J1byyACKZj7RnkHGfJ02mnnNfLwFk32obdQ2yRwTX622UduobRJ5wOFiZFh/HiAJetokMo/apnw0qW0S2YYuRuL2y8ljfYbPfIX8Got2OViMfC/mf2YKCE7efrg7j1XoppVwLPT6ZxGvgU4d453CbAHVR9YOI4mQJ562ANfsi5GvF/DhkPkiYlZC28bmaa+AyytXit/Cxs/ag4ZscwUQ12HgREqELSDHyJyoiJg3MjgKFAFOuUawmJ3oZ8QOh30lVk4ECHQB+VYX0QcBNyqinAFRO+lKWDbUlWDco+L/0tROaieWh6xgZFLtpHayHMFqqp0sL6GpNzu1k+4J3ROsXVAbrHZSO9U6gvXNo52uMFYni4xrsEcR264c2HGeRHxinBFDxn42avr+rcZj+HsMPgfcMiYhztMmPqgAmtSTiAkxAZ5EPIkK8CDiwggQrx029gNiesSJ2wQSili2Y1PThogscAz8VAr4w2ZqCDciAoIRsA7kACJM5RE4BKonT6PY1PWBcAcw8BexL9t44wiKYY9EAAAAAElFTkSuQmCC);\n    background-repeat: no-repeat;\n    background-size: 12px 20px;\n    background-position: center;\n    padding: 20px;\n    width: 16px;\n    height: 16px;\n}\n.wemo_overtemp .descriptionTitle {\n    font-size: 18px;\n    margin-bottom: 15px;\n    color: #fff;\n    background: #ff6a38;\n    padding: 15px;\n    position: relative;\n    display: flex;\n}\n.wemo_overtemp .descriptionTitle:after{\n    content: \'\';\n    position: absolute;\n    left: 50%;\n    top: 100%;\n    width: 0;\n    height: 0;\n    border-top: 14px solid #ff6a38;\n    border-left: 14px solid transparent;\n    transform: translateX(-100%);\n}\n.wemo_overtemp .warning-icon{\n    height:30px;\n    width:35px;\n    background: url(data:image/png;base64,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) center center no-repeat;\n    background-size: contain;\n    display: flex;\n    margin-right: 10px;\n}\n.wemo_overtemp .title-label {\n    display: flex;\n    line-height: 35px;\n}\n.wemo_overtemp .link {\n    color: #6CA8FF;\n    font-size: 1.15em;\n    text-decoration: underline;\n    margin-bottom: 20px;\n}\n.wemo_overtemp .defaultBtn {\n    text-align: center;\n    font-size: 18px;\n    color: #73d44c;\n    border-radius: 2px;\n    background-color: #fff;\n    border: solid 1px #d9d9d9;\n    padding: 14px 0;\n    margin: 15px 0;\n}\n.wemo_overtemp .greenBtn {\n    color: #fff;\n    background-color: #73d44c;\n    border: solid 1px #73d44c;\n    padding: 14px 0;\n    margin: 15px 0;\n    text-align: center;\n    font-size: 18px;\n    border-radius: 2px;\n    text-transform: initial;\n}\n.wemo_overtemp .pageContent p {\n    color: #444;\n    margin-bottom: 20px;\n    font-size: 16px;\n    font-weight: 400;\n    line-height: 23px;\n    background: #fff;\n    padding: 15px;\n}\n.wemo_overtemp.smart-overlay .pageContent{\n    background-color: #ededed;\n    padding: 15px 15px 80px 15px;\n    position: relative;\n    margin-top: 56px;\n    width: 100%;\n    overflow: auto;\n}\n.wemo_overtemp .descriptionContent {\n    margin-bottom: 15px;\n}\n.problemDetectedPage {\n    z-index: 100;\n}\n';});

/* START_TEMPLATE */
define('hbs!widgets/wemo_overtemp/templates/errorDetails',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<header class=\"overTempHeader\">\n    <div class=\"back\" aria-label=\"";
  if (stack1 = helpers.titleAria) { stack1 = stack1.call(depth0, {hash:{}}); }
  else { stack1 = depth0.titleAria; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">\n        <span class=\"backIcon\"></span>\n        <span class=\"title\">";
  if (stack1 = helpers.title) { stack1 = stack1.call(depth0, {hash:{}}); }
  else { stack1 = depth0.title; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</span>\n    </div>\n</header>\n\n<div class=\"pageContent\">\n    <div class=\"descriptionTitle\">\n        <div class=\"warning-icon\"></div>\n        <div class=\"title-label problemDetectedTitle\"></div>\n    </div>\n    <div class=\"descriptionContent\">\n        <p aria-label=\"";
  if (stack1 = helpers.descriptionAria) { stack1 = stack1.call(depth0, {hash:{}}); }
  else { stack1 = depth0.descriptionAria; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">";
  if (stack1 = helpers.description) { stack1 = stack1.call(depth0, {hash:{}}); }
  else { stack1 = depth0.description; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</p>\n    </div>\n\n    <div class=\"dismissBtn defaultBtn\"  aria-label=\"";
  if (stack1 = helpers.buttonLabelPrimaryAria) { stack1 = stack1.call(depth0, {hash:{}}); }
  else { stack1 = depth0.buttonLabelPrimaryAria; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">";
  if (stack1 = helpers.buttonLabelPrimary) { stack1 = stack1.call(depth0, {hash:{}}); }
  else { stack1 = depth0.buttonLabelPrimary; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</div>\n    <div class=\"learnMoreBtn greenBtn\"  aria-label=\"";
  if (stack1 = helpers.buttonLabelSecondaryAria) { stack1 = stack1.call(depth0, {hash:{}}); }
  else { stack1 = depth0.buttonLabelSecondaryAria; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">";
  if (stack1 = helpers.buttonLabelSecondary) { stack1 = stack1.call(depth0, {hash:{}}); }
  else { stack1 = depth0.buttonLabelSecondary; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</div>\n\n</div>";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_overtemp_templates_errorDetails', t);
return t;
});
/* END_TEMPLATE */
;
define('widgets/wemo_overtemp/js/errorDetailsView',['Cache','hbs!widgets/wemo_overtemp/templates/errorDetails'],
    /** @exports summary view */
        function(Backbone, template) {
        'use strict';
        var View = Backbone.OverlayView.extend({
            className: 'noMainHeader',
            events: {
                "click .back" : "goBack",
                "click .dismissBtn" : "dismissBanner",
                "click .learnMoreBtn" : "learnMore"
            },
            listen: function() {
                var self = this;
                this.addBackButtonCommand({
                    key: 'cancel',
                    callback: function() {
                        self.goBack();
                    }
                });
            },
            goBack : function() {
                var self = this;
                this.sandbox.uiInterface.dismissSettings.call(self, {
                    cancel: true
                });
                window.location.href = "#page/wemo_devices";
                $("#startWidget").attr("aria-hidden", "false");
            },

            afterInitialize:function(){
                this.errorStrings = this.options.errorStrings;
                this.model = this.options.sandboxFromWidget.model;
                this.modelCode = this.model.baseObject.information.modelCode;
            },

            render: function() {
                this.$el.html(template(this.errorStrings));
                this.$('.title-label').text(this.i18n('problemDetected'));
//                this.$('.problemDetectedTitle').attr("aria-label", "problem detected header");
                this.stickit();
                this.delegateEvents();
            },
            learnMore: function() {
                 var url = "http://www.belkin.com/us/support-article?articleNum=208553";
                 this.loadExternalUrl(url);
            },
            loadExternalUrl: function(url) {
                navigator.app.loadUrl(url, {
                openExternal: true
                });
            },
            dismissBanner: function() {
                var self = this;
                if (this.options.sandboxFromWidget) {
                    this.options.sandboxFromWidget.emit("dismissError");
                    this.options.sandboxFromWidget.emit('drawer:close');
                } else {
                    var devices =  self.options.sandbox.parentSandbox.sandboxes,
                        selectedMac = "";

                    if (window.location.href.indexOf("mac=") !== -1) {
                        selectedMac = window.location.href.split("mac=")[1];
                    }
                    $.each(devices,function(key, val){
                        if (val.information && val.information.mac === selectedMac) {
                            val.emit("dismissError");
                        }
                    });
                }

                this.goBack();
            }
        });

        return View;
    });

define('widgets/wemo_overtemp/main',['backbone', 'text!widgets/wemo_overtemp/css/main.css','widgets/wemo_overtemp/js/errorDetailsView'],
    function(Backbone, css, ErrorDetailsView) {
    'use strict';

    return {
        name: 'wemo_hardware-error',
        type: 'Backbone',
        /**
         * starts the process
         */
        initialize: function(options) {
            _.bindAll(this);
            var self = this;
            this.sandbox.path = this.options.ref.replace(/main/, '');
            this.styles = css.replace(/\.\.\//g, this.sandbox.path + '/');
            this.stylesheet = new this.sandbox.util.Stylesheet(this.name, this.styles);
            this.sandbox.on('global.warning:device_error', function(options) {

                var udn = options.sandbox.information.udn;

                if (udn)  {
                    self.sandboxFromWidget = this.parentSandbox.sandboxes[udn];
                } else {
                    self.sandboxFromWidget = false;
                }
                var viewOptions = {
                    parent: self,
                    sandbox: self.sandbox,
                    parentElement: $('.container'),
                    sandboxFromWidget: self.sandboxFromWidget,
                    errorStrings: options.errorStrings
                };

                self.errorDetailsView = new ErrorDetailsView(viewOptions);

                if (udn) {
                    self.errorDetailsView.initialRender();
                } else {
                    self.errorDetailsView.setDuration(0);
                    self.errorDetailsView.initialRender();
                }
                $("#startWidget").attr("aria-hidden", "true");
            });

        }
    }
});}());