(function () {
define('text!widgets/bundlemanager/css/main.css',[],function () { return '';});

/* START_TEMPLATE */
define('hbs!widgets/bundlemanager/templates/tile',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<header class=\"row-tile\">\n    <div class=\"tile3 power\">\n        <div class=\"powerInner\">\n            <div class=\"css-spinner\" style=\"display:block\"></div>\n            <div class=\"bevel\"></div>\n            <div class=\"animated\"></div>\n            <div class=\"target\"></div>\n            <div class=\"powerState powerState-1\" data-bind=\"modeIcon\"></div>\n        </div>\n    </div>\n    <div class=\"tile1\">\n        <div class=\"gradient\"></div>\n        <span class=\"icon\" data-bind=\"iconURL\"></span>\n    </div>\n    <div class=\"tile2 description downloadingApp\">\n        <h1 data-bind=\"friendlyName\"></h1>\n        <span data-bind=\"mode\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.downloading", options) : helperMissing.call(depth0, "i18n", "labels.downloading", options)))
    + "</span>\n    </div>\n</header>\n";
  return buffer;
  });
Handlebars.registerPartial('widgets_bundlemanager_templates_tile', t);
return t;
});
/* END_TEMPLATE */
;
/**
 * This tile is used to download the real tile. It is a placeholder. It saves the javascript to pouchdb, with a timestamp and version.
 */
define('widgets/bundlemanager/js/tile',['backbone', 'hbs!widgets/bundlemanager/templates/tile', 'feature!appSettings'], function(Backbone, template, appSettings) {

    'use strict';

    var View = Backbone.View.extend({
        tagName: 'div',

        bindings: {
            '*[data-bind="friendlyName"]': {
                observe: 'friendlyName'
            }
        },
        /**
         * set standard tile options like model and sandbox, bind the rest of the view functions to the view context
         * @param options {JSON} config options
         */
        initialize: function(options) {
            DEBUG && console.log('BUNDLE:initialize:i have initialized');

            _.bindAll(this);

            var self = this;
            var continueCheck = 'continue';

            this.options = options || {};
            if (this.options.sandbox) {
                this.sandbox = this.options.sandbox;
                this.model = this.sandbox.model;
            } else {
                throw ('you need to pass the sandbox to any child views');
            }
            this.$el.addClass('smart-tile');

            //this is the key for the pouch db.
            DEBUG && console.log('BUNDLE:checking master el');
            //if (this.sandbox.$masterEl) {
            DEBUG && console.log('BUNDLE:we have master el:toload=' + this.sandbox.$masterEl.attr('data-aura-toload'));

            var key = this.sandbox.$masterEl.attr('data-aura-toload');
            if (key.match(/\//)) {
                var partial = key.split('/');
                this.groupName = partial[0].replace(/wemo_/, '').toLowerCase();
                this.page = partial[1];
                key = partial[0];
            } else {
                this.groupName = key.replace(/wemo_/, '').toLowerCase();
            }

            console.log('GROUPNAME', this.groupName, this.page)

            //see if we are already loading the app. if we are, we add an event listener so we know when its done
            if (window.sessionStorage.getItem('wemoapp-' + this.groupName)) {
                //if we have a device of this type, and its already finished its process, we skip through to insert
                if (window.sessionStorage.getItem('wemoapp-' + this.groupName) === 'finished') {
                    continueCheck = 'finished';
                }
                //otherwise, we listen for it to finish, and hope it doesnt get caught in the middle of the process
                else {
                    //insert jorge's handle event listener
                    this.sandbox.uiInterface.subscribeFrameworkEvents();
                    //when the first device notifies the other devices that it is finished, it will insert the bundle. tell the process to wait
                    continueCheck = 'wait';
                    window.app.events.on('frameworkEvent', function(event) {
                        if ((event === (self.groupName + ':finished')) && !self.isInserted) {
                            self.insertBundle();
                        }
                    });
                }
            } else {
                window.sessionStorage.setItem('wemoapp-' + this.groupName, 'starting');
                this.isFirstDevice = true;
            }

            DEBUG && console.log('BUNDLE:tile.js:continueCheck=' + continueCheck + ':key=' + key);

            //prep the database interface
            this.db = new this.sandbox.PouchInterface({
                key: key,
                dbName: 'wemodevicewidgets'
            });
            this.db.createDatabase();

            //see if we already have this loaded, if we do, just insert. if we don't, do the check.
            if (continueCheck === 'continue') {

                this.render();
                this.startAppCheck();
            }
            //if this is the second device of this type and bundle manager is finished, insert
            else if (continueCheck === 'finished') {
                console.log('INSERTING')
                this.render({
                    invisible: true
                });
                this.insertBundle();
            }
            //if this is the second device of this type and bundle manager is waiting, show the loading tile data
            else {
                this.render();
                self.model.getDevice(null, self.model).then(function(resp) {
                    self.model.set(resp);
                }).fail(self.failHandler);
            }
            /*} else {
                DEBUG && console.error('BUNDLE:masterEl is not defined');
            }*/
        },
        /**
         * render the tile template to the screen, add data binding and events
         */
        render: function(options) {
            options = options || {};
            DEBUG && console.error('BUNDLE:render:i have rendered');

            var html = this.i18n(template);
            this.$el.html(html);

            if (options.invisible) {
                this.$el.css({
                    visibility: 'hidden'
                });
            }

            this.$el.css({
                position: 'static'
            });

            //this.$el.resizeElement();
            this.stickit();
            this.delegateEvents();
            this.sandbox.$masterEl.append(this.$el);

            this.sandbox.$masterEl.removeClass('hidden').show();
            this.sandbox.$masterEl.parent().removeClass('hidden').show();

            if (window.devicelistEvents) {
                window.devicelistEvents.emit('packageStarted');
            }
        },
        /**
         * start the bundle check for the app, see if we have it stored already
         */
        startAppCheck: function() {
            var params = [];
            var self = this;
            this.dbData = {};

            this.db.get().done(function(resp) {
                var dbData = resp;

                DEBUG && console.log('BUNDLE:tile.js:db response:' + JSON.stringify(resp));

                //the script is not here yet. set the version to zero, it will get updated to current when the response is returned
                if (dbData.status === 404) {
                    self.model.getDevice(null, self.model).then(function(resp) {
                        self.model.set(resp);
                    });
                    params.push({
                        parameter: {
                            name: 'version',
                            value: '0'
                        }
                    });
                }
                //the script is here, we need to set the version and check to see if there is a newer one
                else {

                    self.dbData = dbData;
                    params.push({
                        parameter: {
                            name: 'version',
                            value: parseInt(self.dbData.version, 10) + 1
                        }
                    });

                    //either way we dont wait for all this to happen to show something. we'll add a field to update on next launch, or maybe a flag to allow user to update?

                    self.insertBundle();
                }

                // self.getBundleInfo(params).done(self.parseBundleInfo).fail(self.parseBundleInfo); //we handle the error case later
                self.dbData.downloadUrl = '../widgets/wemo_' + self.groupName + '/main.js';
                self.finishParse();

            }).fail(self.failHandler);
        },
        /**
         * send our search parameters to the cloud to see if we have a bundle to download
         * @param params {JSON} search parameters
         * @returns {JQueryXHR} (promise)
         */
        getBundleInfo: function(params) {
            this.data = {
                ruleExecution: {
                    ruleRequests: [{
                        ruleRequest: {
                            groupName: this.groupName,
                            parameters: params
                        }
                    }]
                }
            };

            return $.ajax({
                headers: {
                    'X-Linksys-Client-Type-Id': '2B4CDC26-2D90-435B-9ACA-1E1B3ABFB395',
                    'Content-Type': 'application/json'
                },
                //url:'/widgets/bundlemanager/mocks/response.json',
                url: appSettings.bundleIpAddress,
                dataType: 'json',
                processData: false,
                type: 'POST',
                data: JSON.stringify(this.data),
                timeout: 15000
            });
        },
        /**
         * parse the response from the server
         * @param resp {JSON}
         */
        parseBundleInfo: function(resp) {
            DEBUG && console.log('BUNDLE:parseBundleInfo:resp=' + JSON.stringify(resp));
            var self = this;
            //this could be resp from cloud server, or error resp from jquery
            //if resp from cloud
            if (resp.ruleExecution) {
                var rules = resp.ruleExecution.ruleResponses;

                if (rules.length > 0) {
                    rules.forEach(function(rule) {
                        if (!rule.ruleResponse.error && rule.ruleResponse.parameters) {
                            rule.ruleResponse.parameters.forEach(function(param) {
                                self.dbData[param.parameter.name] = param.parameter.value;
                            });
                        } else {
                            if (rule.ruleResponse.error && (rule.ruleResponse.error.code === '404' || rule.ruleResponse.error.code === '500')) {
                                //there is no package on the server, check locally
                                // if(!$('html').hasClass('web')){
                                self.dbData.downloadUrl = '../widgets/wemo_' + self.groupName + '/main.js';
                                // }
                            }
                        }
                    });

                    self.finishParse();
                } else {
                    if (!this.isInserted) {
                        this.insertBundle();
                    }
                }
            }
            //if resp from jquery
            else {
                //   if(!$('html').hasClass('web')){
                self.dbData.downloadUrl = '../widgets/wemo_' + self.groupName + '/main.js';
                //  }

                this.finishParse();

            }
        },
        /**
         * finishes the parseBundleInfo function, branched by cloud vs jquery
         *
         */
        finishParse: function() {
            DEBUG && console.log('BUNDLE:finishParse:downloadUrl=' + this.dbData.downloadUrl);

            //get the latest
            if (this.dbData.downloadUrl) {
                $.when(this.downloadBundle(), this.downloadI18n()).done(this.saveBundle).fail(this.downloadWithDefaultLanguage);
            } else {
                //there is no remote bundle for this... now what?
                this.failHandler();
            }
        },
        /**
         * this is called when the first download attempt fails because language file is not found.
         * if it fails, we try to insert the bundle from an existing version
         * if that one fails, we try to insert locally.
         */
        downloadWithDefaultLanguage: function(resp) {
            DEBUG && console.log('BUNDLE:downloadWithDefaultLanguage:status=' + resp.status);
            //if (resp.status === 404 ) {
            $.when(this.downloadBundle(), this.downloadI18n('en-US')).done(this.saveBundle).fail(this.downloadLocal);
            // }
        },
        /**
         * downloadWithDefaultLanguage has failed. Try to get a local version of the bundle. One of these had better work, or Belkin is in trouble.
         * @param resp
         */
        downloadLocal: function(resp) {
            // if (resp.status === 404) {
            this.dbData.downloadUrl = '../widgets/wemo_' + this.groupName + '/main.js';
            $.when(this.downloadBundle(), this.downloadI18n()).done(this.saveBundle).fail(this.downloadLocalWithDefaultLanguage);
            // }
        },
        downloadLocalWithDefaultLanguage: function(resp) {
            // if (resp.status === 404) {
            this.dbData.downloadUrl = '../widgets/wemo_' + this.groupName + '/main.js';
            $.when(this.downloadBundle(), this.downloadI18n('en-US')).done(this.saveBundle).fail(this.failHandler);
            // }
        },
        /**
         * make the ajax call to get the correct localization file
         * @returns {JQueryXHR}
         */
        downloadI18n: function(lng) {
            if (!lng) {
                lng = this.sandbox.i18n.lng();
            }
            var url = this.dbData.downloadUrl.replace(/main\.js/gi, '');
            url = url + 'locales/' + lng + '/translation.json';

            return $.ajax({
                url: url,
                dataType: 'json',
                type: 'GET'
            });
        },
        /**
         * make the ajax call to actually get the javascript bundle
         * @returns {JQueryXHR}
         */
        downloadBundle: function() {
            var url = this.dbData.downloadUrl;

            DEBUG && console.log('BUNDLE:downloadBundle:url=' + url);

            //this.sandbox.i18n.addResourceBundle(this.sandbox.i18n.lng(), '/widgets', JSON.parse(i18n));

            return $.ajax({
                url: url,
                dataType: 'text',
                type: 'GET'
            });
        },
        /**
         * save the retrieved javascript bundle to the database.
         * @param resp {string}
         */
        saveBundle: function(resp, i18n) {
            DEBUG && console.log('BUNDLE:saveBundle:prepping to save to database');

            var self = this;
            if (this.isInserted) {
                this.dbData.updateOnNext = true;
            } else if (this.dbData.updateOnNext) {
                delete this.dbData.updateOnNext;
            }

            this.dbData.script = JSON.stringify(resp);
            DEBUG && console.log('BUNDLE:saveBundle:revision=' + this.dbData._rev);
            if (this.dbData._rev) {
                this.db.remove(this.dbData._rev).then(function() {
                    self.finishSaveBundle();
                }).fail(function(resp) {
                    DEBUG && console.log('BUNDLE:saveBundle:failed to remove bundle:' + JSON.stringify(resp));
                });
            } else {
                self.finishSaveBundle();
            }

            //set the storage
            this.sandbox.util.storage.setItem('i18n-' + this.key, JSON.stringify(i18n));
        },
        /**
         * finishes the database put after existing database info is removed to conserve space
         */
        finishSaveBundle: function() {
            DEBUG && console.error('BUNDLE:finishSaveBundle:putting into database:' + JSON.stringify(this.dbData));
            this.db.put(this.dbData).done(this.insertBundle).fail(function(resp) {
                DEBUG && console.error('BUNDLE:finishSaveBundle:putting into database failed:' + JSON.stringify(resp));
            });
        },
        /**
         * writes the javascript to the DOM, and inserts the new widget
         */
        insertBundle: function() {
            var self = this;
            if (!this.isInserted) {
                //writes the stored script to the screen, and then loads the new widget. it will always fall back to a local version if it exists
                this.db.get().done(function(resp) {

                    DEBUG && console.log('BUNDLE:insertBundle:INSERTING');
                    //add the script to the page
                    var head = document.getElementsByTagName('head')[0];
                    var script = document.createElement('script');

                    script.type = 'text/javascript';
                    script.innerHTML = JSON.parse(resp.script)[0];
                    head.appendChild(script);

                    self.isInserted = true;
                    window.sessionStorage.setItem('wemoapp-' + self.groupName, 'finished');
                    //fire the event handler
                    if (self.isFirstDevice) {
                        self.sandbox.uiInterface.notifyFrameworkEvent(self.groupName + ':finished');
                    }

                    self.addWidget();

                }).fail(function() {
                    DEBUG && console.log('BUNDLE:insertBundle:FAILED TO GET BUNDLE:' + self.groupName);
                });
            }
        },
        addWidget: function() {
            var self = this;
            //load the widget
            //
            DEBUG && console.log('BUNDLE: adding the position');
            var o = self.sandbox.$masterEl.position();
            DEBUG && console.log('BUNDLE: getting the parent');
            var $parent = self.sandbox.$masterEl.parent();
            self.sandbox.$masterEl.show();
            DEBUG && console.log('BUNDLE: getting the height');
            var tileHeight = self.$el.find('.smart-tile').height();
            //    console.error('HEIGHT', tileHeight)
            DEBUG && console.log('BUNDLE:addWidget:tileHeight=' + tileHeight, self.$el.html());

            var $newEl = self.sandbox.$masterEl.clone();

            $newEl.removeClass('bundlemanager');
            $newEl.empty();
            $newEl.removeAttr('data-aura-started');
            $newEl.removeAttr('data-aura-toload');
            $newEl.attr('data-aura-widget', self.sandbox.$masterEl.attr('data-aura-toload'));

            // $('<div class="widget" id="'+self.sandbox.$masterEl.attr('id')+'" data-aura-widget="'+self.sandbox.$masterEl.attr('data-aura-toload')+'"></div>');
            /*$newEl.css({
                position: 'absolute',
                top: parseInt(o.top, 10),
                left: -5000,
                opacity: 0,
                display: 'block',
                height: '100%'
            });
*/
            /*   self.sandbox.$masterEl.after($newEl);
            self.sandbox.$masterEl.remove();
            $newEl.css({
                position: 'static',
                opacity: 1,
                display: 'block',
                height: '100%'
            });

*/
            self.sandbox.$masterEl.replaceWith($newEl);

            self.sandbox.start($parent);

            DEBUG && console.log('BUNDLE: I SHOULD BE VISIBLE');
            if ($("#device_list_container").length > 0) {
                $("#device_list_container").hide().show();
            }
        },
        /**
         * when all else fails, go here. see if we have an older stored version. then see if we have a local version. then see if we can get it somewhere else.
         */
        failHandler: function(resp) {
            //TODO: send a bugsense message here
            console.warn('BUNDLE:failHandler:' + JSON.stringify(resp));
            // this.addWidget();

        }
    });

    return View;
});
define('widgets/bundlemanager/js/model',['Cache'],function(Backbone){
    'use strict';

    var Model = Backbone.WemoDeviceModel.extend({
        defaults: {
            'state':'OFF'
        },
        validation:{
            'state':{
                required:true
            }
        },
        stateArray:['OFF','ON'], /* modes to step through on power cycle */
        setCommand:'SetBinaryState',
        getCommand:'GetBinaryState',

        hasStatus:true,

        /**
         * urls, statusUrl, and rulesUrl all allow dummy data to be loaded for demo/test
         * @returns {string}
         */
        url: function(){
            return 'widgets/bundlemanager/mocks/device.json';
        }
    });

    return {
        Model: Model,
        model: new Model()  //we need to pass a shared model, but we want the base object available for unit testing
    };
});

define('widgets/bundlemanager/main',['text!widgets/bundlemanager/css/main.css','widgets/bundlemanager/js/tile','widgets/bundlemanager/js/model'], function (css, TileView,data) {

    'use strict';



    return {
        type:'Tile',
        styles: css,
        Tile: TileView,
        Model: data.Model
    };

});}());