(function () {
define('text!widgets/wemo_whatisnew/css/main.css',[],function () { return '#wemo_whatisnew {\n    position: fixed;\n    width: 96%;\n    left: 2%;\n    padding: 15px;\n    color: #fff;\n    bottom: 70px;\n    min-height: 80px;\n    background-color: rgb(108,168,255);\n    box-sizing: border-box;\n    z-index: 100;\n}\n#wemo_whatisnew.slideOut{\n    left: 110%;\n    transition: left 600ms cubic-bezier(0.23, 1, 0.32, 1);\n    -webkit-transition: left 600ms cubic-bezier(0.23, 1, 0.32, 1);\n}\n.wemo_whatisnew {\n    position: relative;\n}\n.wemo_whatisnew .bannerContent {\n    position: relative;\n    padding-left: 80px;\n    margin-right: 20px;\n    width: 90%;\n    height: 100%;\n}\n.wemo_whatisnew .bannerContent::before {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPAAAADwCAYAAAA+VemSAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA4hpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTMyIDc5LjE1OTI4NCwgMjAxNi8wNC8xOS0xMzoxMzo0MCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDplMWQ4MGY3MS1kMDEzLTQyN2EtYmM1Zi0yMDVmYmI5ZmFlZmQiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6Q0VDNTk1Q0Y3OTQ3MTFFNjhDMjFDMTI3MUE4MUIwREUiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6Q0VDNTk1Q0U3OTQ3MTFFNjhDMjFDMTI3MUE4MUIwREUiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUuNSAoTWFjaW50b3NoKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjQyODYyMWY0LWU5NjktNGRmOS1iOGU1LTg4MGMzNWIwZDYyYiIgc3RSZWY6ZG9jdW1lbnRJRD0iYWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOjcyMDYzNjE1LWMxYjEtMTE3OS1h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);\n    width: 120px;\n    height: 120px;\n    content: "";\n    background-repeat: no-repeat;\n    background-size: contain;\n    background-position: center center;\n    position: absolute;\n    left: -27px;\n    bottom: 5px;\n    \n}\n.wemo_whatisnew .closeBtn {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAhCAYAAACxzQkrAAAAAXNSR0IArs4c6QAABB1JREFUWAnNmFlIVFEYx51xTBt1xKKXViKIigiKqGh5aNNKK6JsISkRhDSCooKiaKEIogik6KmFNh8qWlHUEIoiqJd6KKSgIq0gKGLGZYxRp98X98jx3OOMToZeOHzn2//nO8s99yYlOU9LS8uMUCj0LBwOj1ey/03Jt5d2KRqN+rrlampqWhgMBkO0KAbfmpubp3Uz6GcGAB7ynJZ8Ts4HyIZKGg9g1sLcoKVqeYMej2dlIBB4qsn6pUseHzkvQrfoAcn3LDMzc6W3s7NzkQFG7LJotYxile70r33yDAXMPROME3dya2vreG9WVtZ2BMfNZDilIbsDqGJTlwhPvGzAPILmWfwbqdCC9PT0Vx6lxHgHxuW0LpnSYbyP6Tup+L5SNszIjo6OGmJPNX2JXe/z+XL9fn+j6LolB9RGnK7SUiyOZ5jjPQSImrpYPBWeSLxabMaZdsR6gSyPwf5Uum6ARMgOy2E0d+imKyNFCXANUMXQdiWLRanMTGJVAWiExa4aIOuI1aLrXIBEyeKa1d7eLoGG68bSJ0AVoAqgraZO5xnYEsDcRZahy51+BWCKiBExdV5TIDzz+RIyn9YgvP4AcoWzOLN1ud5Hv57dW4nMBcbr9ZYDptAGRmJYK6SCU6nRVEoW4xQlU5SAb53F+FXJhAKmDPuzNNdg8TkAmBO6vdmPCUiMCTyMJJXQOaYzfANJckjyTnTYHaYyR6SvP9h0wG/D7oIut/XjAhInwPhJdhu63AxCsh9UKi8SiWxFV2bR/0a2CTCynuI+vQIkUQCTAih5ERaaUQEVEb0phw+xZlaxCZ5YdFZRrwGJN0k97J4zTMtOazRNCMjvgFmWkZHxWhPH7fYJkIrGYbcfcLEW58fU1NSctLS0D8qntzQhQBIcUF8ANcqWKDk5uYjKXLHp4slcWzOeg+idClnBiJ4D8VBbW9sE6ff16VOFBtUaAkwKlbnMiDebo46zy1azyx6bPj3xvZoywMg5dJ8gNjByDslr5rwlSQDfagayxqKziuICIqCc1HVQ16FIxM+0+fLucy56R80s+MnV+BagSkydjY+5hhJ8l5UC4hzNNVimNvF3GSOaRNAaRjHWHAmBn7Mu8qG/TJ3wVLQA3+u0IaZe3vYcCbvwtV70rBXqp/vQYrb/PQC5riDIerwPuQANqhsjpR7wO3XXwgOMfHVU0FxvbeZbvjp29zTv5jrRefzecyzMxfeNLpc+uWZDnrJExijd3ynjc/YYgoNKqChB5GJVQlA5EP/pIbl8lz2EzrMEamSx57JR6j2AkQOt1DQCTBuyDYB5YOoS5QEjX643oflmDPL95KW8FGDeOhi51elPEEaupv0GRoKTJ0wV1kCv6Mmcfj0H7Ke/fVAPxN+PU7a/H11A+aibzmE44P+H/gBH8X7jjzQOOAAAAABJRU5ErkJggg==);\n    width: 20px;\n    height: 20px;\n    background-repeat: no-repeat;\n    background-size: 15px 15px;\n    background-position: center center;\n    position: absolute;\n    right: -16px;\n    top: -16px;\n    padding: 25px;\n}\n.wemo_whatisnew .bannerContent .header {\n    font-size: 15px;\n    margin-bottom: 10px;\n    font-weight: 700;\n    letter-spacing: 1px;\n}\n.wemo_whatisnew .bannerContent .description {\n    font-size: 14px;\n    margin-bottom: 10px;\n}\n.wemo_whatisnew .bannerContent .link {\n    font-size: 14px;\n    font-weight: 500;\n}\n.whatsnewDetail .whatsnewHeader{\n    background: #73D44C;\n    height: 56px;\n    display: flex;\n    align-items: center;\n    justify-content: center;\n    padding: 0;\n}\n.whatsnewDetail .whatsnewHeader .title{\n    font-size: 18px;\n    color: white;\n}\n.whatsnewDetail .pageContent {\n    margin-top: 56px;\n    padding: 10px 10px 80px 10px;\n    background: #f1f1f1;\n    color: #444;\n    overflow: auto;\n}\n.whatsnewDetail .descriptionContent {\n    background-color: #fff;\n    padding: 20px;\n    margin-bottom: 15px;\n}\n.whatsnewDetail .descriptionTitle {\n    font-size: 22px;\n    margin-bottom: 10px;\n    font-weight: 700;\n}\n.whatsnewDetail .descriptionContent p {\n    color: #444;\n    margin-bottom: 10px;\n    font-size: 16px;\n    font-weight: 400;\n}\n.whatsnewDetail p .link {\n    color: #6CA8FF;\n    text-decoration: underline;\n    margin-bottom: 10px;\n    display: block;\n}\n.whatsnewDetail .gotitBtn {\n    font-size: 17px;\n    border-radius: 2px;\n    text-align: center;\n    padding: 15px 0;\n}\n';});

/* START_TEMPLATE */
define('hbs!widgets/wemo_whatisnew/templates/main',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<div class=\"bannerContent\">\n    <div class=\"header\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "header", options) : helperMissing.call(depth0, "i18n", "header", options)))
    + "</div>\n    <div class=\"description\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "description.1", options) : helperMissing.call(depth0, "i18n", "description.1", options)))
    + "</div>\n    <div class=\"link\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "description.2", options) : helperMissing.call(depth0, "i18n", "description.2", options)))
    + "</div>\n</div>\n<div class=\"closeBtn\"></div>\n";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_whatisnew_templates_main', t);
return t;
});
/* END_TEMPLATE */
;
// define(['Cache', 'text!widgets/wemo_whatisnew/css/main.css', 'hbs!widgets/wemo_whatisnew/templates/main','widgets/wemo_whatisnew/js/overlayView'], function(Backbone, css, template, DescriptionView) {
define('widgets/wemo_whatisnew/main',['Cache', 'text!widgets/wemo_whatisnew/css/main.css', 'hbs!widgets/wemo_whatisnew/templates/main'], function(Backbone, css, template) {

    'use strict';

    return {
        name: 'wemo_whatisnew',
        type: 'Backbone',
        /**
         * starts the process. recreate the edit view each time, in case device has changed
         */
        initialize: function() {
            _.bindAll(this);
            this.sandbox.path = this.options.ref.replace(/main/, '');
            this.styles = css.replace(/\.\.\//g, this.sandbox.path + '/');
            this.stylesheet = new this.sandbox.util.Stylesheet(this.name, this.styles);
            this.render();
            this.delegateEvents();

        },
        events: {
            'click .closeBtn': 'closeBanner',
            'click .bannerContent': 'openDetailPage'
        },
        /**
         * renders edit device html
         */
        render: function() {
            var html = this.i18n(template);
            this.$el.addClass(this.name);
            this.$el.html(html);

            window.sessionStorage.setItem('whatIsNew_display', 'true');
            // var viewOptions = {
            //     parent: self,
            //     sandbox: self.sandbox,
            //     parentElement: $('.container')
            // };
            //
            // self.descriptionView = new DescriptionView(viewOptions);
        },
        closeBanner: function(){
            $("#wemo_whatisnew").addClass("slideOut");
            window.localStorage.setItem("firstTimeLoad", "true");
            window.sessionStorage.removeItem('whatIsNew_display');
            var self = this;
            setTimeout(function() {
                $("#wemo_whatisnew").remove();
            }, 1000);
        },
        openDetailPage: function(){
            $("#wemo_whatisnew").remove();
            window.localStorage.setItem("firstTimeLoad", "true");
            window.sessionStorage.removeItem('whatIsNew_display');
             var self = this,
                 localeName = 'unknown',
                 productUrl = null;

            self.getLocaleName( function(loc){
                localeName = loc;
            } );

            if(localeName != 'unknown'){
                productUrl = "http://www.belkin.com/embed/" + localeName.toLowerCase() + "/wemo/products";
            } else {
                productUrl = "http://www.belkin.com/embed/en-us/wemo/products";
            }
            self.loadExternalUrl(productUrl);
            //self.descriptionView.initialRender();
        },
        getLocaleName: function (callback) {
            var unknownLocation = 'unknown'; //Default value
            if (navigator.globalization !== undefined ) {
                navigator.globalization.getLocaleName(
                    function (locale) {
                        if ( locale !== undefined) {
                            callback(locale.value);
                        } else {
                            callback( unknownLocation );
                        }
                    },
                    function () {
                        callback( unknownLocation );
                    }
                );
            } else {
                callback( unknownLocation );
            }
        },
        loadExternalUrl: function(url) {
            navigator.app.loadUrl(url, {
                openExternal: true
            });

            var self = this;
            setTimeout(function() {
                $("#wemo_whatisnew").remove();
            }, 500);
            window.localStorage.setItem("firstTimeLoad", "true");
        }
    };

});
}());