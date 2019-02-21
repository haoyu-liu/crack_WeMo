(function () {
define('text!widgets/wemo_router/css/main.css',[],function () { return 'div[data-aura-widget="wemo_router"]{\n\tfont-size:100%!important;\n}\n.wemo_router #controller{\n\t  \n\tmargin-bottom: 0px;\n    margin-top: 0;\n    width: 100%;\n    position: absolute;\n    top: 55px;\n    bottom: 0;\n}\n.wemo_router #controller > .widget{\n\twidth:100%;\n\theight:100%;\n    overflow:auto;\n}\n.widget iframe{\n\twidth:100%;\n\theight:100%;\n\tborder:0;\n\tmargin:0;\n\tpadding:0;\n\tmargin-top:-57px;\n}\n.widget.fullscreen{\n    position: absolute;\n    top: 0;\n    bottom: 0;\n    width: 100%;\n    z-index: 1001;\n}\n';});

/* START_TEMPLATE */
define('hbs!widgets/wemo_router/templates/main',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  


  return "<div id=\"headerComponent\" data-aura-widget=\"wemo_header1\" class=\"main_header\"></div>\n<div class=\"container\" id=\"mainContainer\">\n\n    <div id=\"controller\">\n        <div id=\"reachableComponent\" data-aura-widget=\"wemo_reachable\" class=\"wemo_reachable\"></div>\n    </div>\n</div>\n\n<div id=\"menuComponent\" data-aura-widget=\"wemo_menu1\"></div>";
  });
Handlebars.registerPartial('widgets_wemo_router_templates_main', t);
return t;
});
/* END_TEMPLATE */
;
define('widgets/wemo_router/main',['feature!dataInterface', 'text!widgets/wemo_router/css/main.css', 'hbs!widgets/wemo_router/templates/main'],
    /** @exports loads tile/drawer for grouped devices, handles group device logic **/
    function(DataInterface, css, template) {

        'use strict';

        var history = [];
        var manager = {};

        var loadCallback = {};
        var currentManager = null;


        var WemoRouter = Backbone.Router.extend({
            initialize: function(options) {
                _.bindAll(this);
                options = options || {};
                _.extend(this, options);
                this.listen();
            },
            listen: function() {
                var self = this;
                window.addEventListener('popstate', function(e) {
                    self.navigate(Backbone.history.getFragment(), {
                        trigger: true,
                        replace: true
                    });
                });

                this.parentView.sandbox.on('widget', function(children, options) {
                    if(!options.widget) return;
                    children.forEach(function(child) {
                        manager[options.widget].sandbox = child;
                        loadCallback[options.widget]();
                    });
                });
            },
            routes: {
                '': 'home',
                'iframe/:path': 'loadIframe',
                'page/:widget(/:method)(/:params)': 'load', //loads a full page that replaces the current view
                'fullscreen/:widget(/:method)': 'loadFullscreen',
                'card/:widget(/:method)': 'loadCard', //loads a card that transitions in
                'externalPage/:page': 'loadExternalPage' //loads an external page
            },
            home: function() {

                this.parentView.addBackButtonCommand({
                    key: 'closeApplication',
                    callback: function() {
                        navigator.app.exitApp();
                    }
                });

                this.navigate('page/wemo_devices', {
                    trigger: true
                });
            },
            loadExternalPage: function(page) {
                if (page !== "") {
                    window.location = page;
                }

            },
            loadIframe: function(url) {
                var decodedURL = decodeUriComponent(url);
                this.parentView.showLoading();
                if (!manager[url]) {
                    manager[url] = {
                        $el: $('<div class="widget"><iframe src="' + decodedURL + '"></iframe></div>'),
                        type: 'iframe'
                    }
                    this.parentView.$controller.append(manager[url].$el);
                    manager[url].$el.find('iframe').load(function() {
                        self.goTo(url);
                    });
                    var iframeHeight = $(window).height();
                    manager[url].$el.find('iframe').height(iframeHeight);
                } else {
                    //reload the iframe src and go back to it.
                    manager[url].$el.find('iframe').attr('src', url);
                    self.goTo(url);
                }
            },
            loadFullscreen: function(widget, method) {
                this.load(widget, method, {
                    fullscreen: true
                });
            },
            load: function(widget, method, params, options) {
                options = options || {
                    type: 'page'
                };

                if (method) {
                    if (method === "showFirmwareUpdate" || method.match(/showOverTempWarning/gi)) {
                        $("#lookingForDevices").hide();
                    }
                }

                if (!manager[widget]) {
                    manager[widget] = options;
                    this.parentView.showLoading();
                    this.getWidget(widget, method);
                } else {
                    this.goTo(widget, method);
                }
            },
            loadCard: function(widget, method) {
                this.load(widget, method, {
                    type: 'card'
                });
            },
            goTo: function(path, method) {
                if (currentManager) {
                    currentManager.$el.addClass('offscreen');
                }
                manager[path].$el.removeClass('offscreen');
                if (method) {
                    manager[path].sandbox.view.$el.addClass('offscreen');
                    manager[path].sandbox.view[method]();
                }

                if (path == 'wemo_devices' && !method) {
                    this.parentView.sandbox.emit('global.showHeaderControls')
                } else {
                    this.parentView.sandbox.emit('global.hideHeaderControls');
                }

                currentManager = manager[path];
                this.parentView.finishLoading();
            },
            /**
             * load the widget into the application
             * @param  {[type]} widget [description]
             * @return {[type]}        [description]
             */
            getWidget: function(widget, method) {

                var self = this;
                var element = this.parentView.$el;

                manager[widget].$el = $('<div class="widget" data-aura-widget="' + widget + '">');

                if (manager[widget].fullscreen) {
                    $('body').append(manager[widget].$el);
                    element = 'body'
                } else {
                    this.parentView.$controller.append(manager[widget].$el);
                }

                if (!method) {
                    method = '';
                }
                //need a callback so we know when this is done.
                loadCallback[widget] = function() {
                    self.goTo(widget, method);
                    self.parentView.finishLoading();
                }

                this.parentView.sandbox.start(element, {
                    widget: widget
                });
            }
        });

        var exports = {
            type: 'Backbone',
            template: template,
            deviceCount: 0,
            toShow: '',
            /**
             * starts the process
             */
            initialize: function(options) {
                _.bindAll(this);

                //capture options
                if (options.extendedOptions) {
                    _.extend(this.sandbox, options.extendedOptions);
                }

                this.styles = css.replace(/\.\.\//g, this.sandbox.path + '/');
                this.stylesheet = new this.sandbox.util.Stylesheet(this.name, this.styles);

                this.render();
                this.listen();


                this.router = new WemoRouter({
                    parentView: this
                });
                Backbone.history.start();
            },
            /**
             * add event handlers to the object
             */
            listen: function() {
                var self = this;

                window.loadView = function(path, url, options) {
                    self.router.navigate(path, {
                        trigger: true
                    });
                };

                window.networkPlugin = {
                    onNetworkChanged: function(isNetworkenabled, networkType) {
                        var status = {
                            isNetworkenabled: isNetworkenabled,
                            networkType: networkType
                        };
                        self.sandbox.emit('global.onNetworkChanged', status);
                    },
                    onWeMoConnected: function() {
                        self.router.navigate('externalPage/index.html', {
                            trigger: true
                        });
                    }
                };

                document.addEventListener('resume', this.onResume, false);
                document.addEventListener('pause', this.onPause, false);
            },
            onResume: function() {
                this.sandbox.emit('global.onResume');
            },
            onPause: function() {
                this.sandbox.emit('global.onPause');
            },
            render: function() {
                 var html = template,
                     lookingForDevices = document.getElementById("lookingForDevices").outerHTML;

                this.$el.addClass('wemo_router');
                this.$el.append(html);

                $('#lookingForDevices').detach();
                this.$el.append(lookingForDevices);

                this.$controller = this.$('#controller');
                this.sandbox.start(this.$el);

            },
            /**
             * when either a widget or an iframe are done loading, we do this.
             */
            finishLoading: function() {
                this.sandbox.emit('global.load:finish', currentManager);
                this.hideLoading();
            },
            /**
             * show a loading spinner while loading new page
             */
            showLoading: function() {
                //     this.sandbox.uiInterface.showSpinner();
            },
            /**
             * hide the loading spinner
             */
            hideLoading: function() {
                //   this.sandbox.uiInterface.hideSpinner();
            },
            /**
             * fired when iframe contents finish loading
             */
            onIframeLoad: function() {
                this.finishLoading();
            },
            /**
             * handle async callback fails.
             */
            failHandler: function(err) {
                DEBUG && console.log('WEMO_ROUTER:failHandler:' + err);
            }
        };

        return exports;

    });
}());