(function () {
define('text!widgets/wemo_reachable/css/main.css',[],function () { return '\n.networkMsgContainer {\n    position: relative;\n}\n.reachabilityMsgOverlay {\n    position: absolute;\n    width: 100%;\n    height: 100%;\n    top: 0;\n    left: 0;\n    z-index: 100;\n    display: none;\n    background: rgba(0,0,0,0.2);\n}\n.reachabilityMsgOverlay.show {\n    display: block;\n}\n.reachabilityMsgOverlay.hidebg {\n    background: none;\n    height: 0;\n}\n#more_menu_xl .preventScrolling .ui-li-static .item {\n    color: #bbb;\n}\n#more_menu_xl .preventScrolling #more_setup_another_device .item {\n    color: #444;\n}\n.reachabilityMsgOverlay #reachabilityMsgBox {\n    background: #fff;\n    border-bottom: 1px solid #444;\n    padding: 10px 4%;\n    overflow: hidden;\n    display: flex;\n    min-height: 60px;\n    align-items: center;\n    position: relative;\n    transform:translate3d(0,-110%,0);\n    transition: transform 0.3s cubic-bezier(0.55, 0.055, 0.675, 0.19);\n}\n#reachabilityMsgBox span {\n    color: #ff7f00;\n}\n#reachabilityMsgBox.slideIn {\n    transform:translate3d(0,0,0);\n    transition: transform 0.3s cubic-bezier(0.215, 0.61, 0.355, 1);\n}\n#reachabilityMsgBox .reachabilityMsg {\n    font-size: 16px;\n    line-height: 18px;\n    float: left;\n    margin: 0;\n    width: 92%;\n}\n#reachabilityMsgBox .closeBtn {\n    position: relative;\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAMAAAC7IEhfAAAABGdBTUEAALGPC/xhBQAAADlQTFRFVVVVVlZWVFRUVFRUVlZWVVVVVVVVTExMVFRUVFRUPz8/VVVVVVVVVVVVVVVVVVVVTExMAAAAVVVVuTJKagAAABJ0Uk5TSEe+XlNr/Aq7W/32QnhOafoABvNfXwAAAMlJREFUOMud1dkSxBAUBFCTzZK1/f/HzggJEZKu8eLBqVK4twlIpfEytJIQsrHmRWpjGymUtda0T641P6KEdpNd625160YLvMjgIIBue5C72zo4iKUuvVvgYV1G52FNJi7AskzdAYPsU9en7oRBztHNFxdhLjOXQIgxkbsbPyhBTFF6N6EMo7y7KzxkwWUwyILL4Slzd4OYBueG3P0P2a3Zw7DXw144+4RsUbBlxhYu2wpsc7HtygYAGylsSLGxRwcpHc102LPfxxc+tWZz6QIr1QAAAABJRU5ErkJggg==);\n    background-repeat: no-repeat;\n    background-size: 25px;\n    width: 25px;\n    height: 25px;\n}\n';});

/* START_TEMPLATE */
define('hbs!widgets/wemo_reachable/templates/reachable',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<div class=\"reachabilityMsgOverlay\">\n    <div id=\"reachabilityMsgBox\">\n        <p class=\"reachabilityMsg\">\n            <span class=\"msgContent\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "reachable.isAirplaneMode", options) : helperMissing.call(depth0, "i18n", "reachable.isAirplaneMode", options)))
    + "</span>\n        </p>\n        <div class=\"closeBtn\"></div>\n    </div>\n</div>\n\n";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_reachable_templates_reachable', t);
return t;
});
/* END_TEMPLATE */
;
define('widgets/wemo_reachable/main',['backbone', 'text!widgets/wemo_reachable/css/main.css', 'hbs!widgets/wemo_reachable/templates/reachable'], function(Backbone, css, template) {

    window.isAndroid1 = true;

    'use strict';
    var exports = {
        name: 'wemo_reachable',
        type: 'Backbone',
        displayMessage : false,
        events: {
            'click #reachabilityMsgBox' : 'toggleMsgBanner'
        },

        initialize: function() {
            _.bindAll(this);
            this.sandbox.path = this.options.ref.replace(/main/, '');
            this.styles = css.replace(/\.\.\//g, this.sandbox.path + '/');
            this.stylesheet = new this.sandbox.util.Stylesheet(this.name, this.styles);

            this.render();
            this.listen();
        },
        listen: function() {
            var self = this;
            self.sandbox.on('global.toggleReachabilityMsg', this.toggleMsgBanner);
            self.sandbox.on('global.showReachabilityMsg', this.loadReachabilityMsg);
//            self.sandbox.on('global.showRemoteDisabledMsg', function(){
//                self.displayReachabilityMsg('remoteDiabaledMode', 100);
//            });
            self.sandbox.on('global.onNetworkChanged',  function(status) {
                self.noNetworkThread(status);
            });
        },
        render: function() {
            var html = this.i18n(template);
            this.$el.addClass(this.name);
            this.$el.html(html);
            this.delegateEvents();
        },
        toggleMsgBanner: function(){
            this.$("#reachabilityMsgBox").toggleClass("slideIn");
        },

        /**
         * load reachability overlay when device list loads when there is no internet
         * @param  {DOM element} e DOM element that was clicked on
         */
        loadReachabilityMsg: function() {
            var networkState = window.sessionStorage.getItem("networkTypeKey");

            this.displayReachabilityMsg(networkState, 100);
        },
        noNetworkThread: function(status) {
            var networkState;
            if (status.isNetworkenabled) {
                networkState = "networkEnabled";
            } else {
                networkState = status.networkType;
                window.appEvents.emit('closePopups');
            }

            this.displayReachabilityMsg(networkState, 100);
        },
        displayReachabilityMsg: function(state, time) {
            var messageContent;
            var self = this;

            switch(state) {
                case "airplaneMode":
                    messageContent = this.i18n("reachable", "airplaneMode");
                    this.$(".reachabilityMsgOverlay").addClass("show");
                    self.displayMessage = true;
                    break;
                case "remoteDiabaledMode":
                    messageContent = this.i18n("reachable", "remoteDiabaledMode");
                    self.displayMessage = true;
                    break;
                case "none":
                    messageContent = this.i18n("reachable", "radiosOffMode");
                    this.$(".reachabilityMsgOverlay").addClass("show");
                    self.displayMessage = true;
                    break;
                case "networkEnabled":
                    this.toggleMsgBanner();
                    var slideOutReachabilityMsg;
                    clearTimeout(slideOutReachabilityMsg);
                    slideOutReachabilityMsg = setTimeout(function(){
                        self.$(".reachabilityMsgOverlay").removeClass("show");
                    }, 350);
                    self.displayMessage = false;
                    break;
            }



            if (self.displayMessage) {
                this.$(".msgContent").text(messageContent);
                $("#headerComponent").addClass("moveUp");
                var slideInReachabilityMsg;
                clearTimeout(slideInReachabilityMsg);
                slideInReachabilityMsg = setTimeout(function(){
                    self.toggleMsgBanner();
                }, time);
            } else {
                var slideOut;
                clearTimeout(slideOut);
                slideOut = setTimeout(function(){
                    $("#headerComponent").removeClass("moveUp");
                }, 1000);
            }

        }

    };

    return exports;

});}());