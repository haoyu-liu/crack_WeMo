(function () {
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
/**
 * this module loads tutorial widgets as needed.
 */

define('widgets/wemo_tutorials/main',['Cache', 'libs/pouchInterfaceBaseObject', 'feature!demoDevices'], function(Backbone, PouchInterface, DemoDevices) {

    'use strict';

    return {
        type: 'Backbone',
        /**
         * starts the process. recreate the edit view each time, in case device has changed
         */
        initialize: function() {
            _.bindAll(this);
            this.listen();
            this.render();

            //  PouchDB.destroy('websql://wemodevicewidgets');

            this.db = new PouchInterface({
                dbName: 'websql://wemoTutorials'
            });

            this.bulbArray = [];
        },
        listen: function() {
            var self = this;
            this.sandbox.on('widget', function(children, options) {
                children.forEach(function(child) {
                    if (options.childWidget) {
                        self.children[options.name].sandbox = child;
                        self.widgetLoaded(options.name);
                    }
                });
            });

            //window events are generated by components that fall outside of the sandbox. use carefully.
//            window.appEvents.on('fwpopup:opened', this.popupOpened);
//            window.appEvents.on('fwpopup:closed', this.popupClosed);

            window.appEvents.on('popup:opened', this.popupOpened);
            window.appEvents.on('popup:closed', this.popupClosed);

//            this.sandbox.on('global.deviceAdded', function(deviceAdded, allDevices) {
//                self.setDevices(allDevices);
//            });
//            this.sandbox.on('getDevices', this.setDevices);
            self.setDevices();
            if (DemoDevices) {
                window.testTutorials = function() {
                    self.setDevices(null, DemoDevices);
                }
            }
        },
        widgetLoaded: function(widgetName) {
            this.isDisabled = true;
//            window.appEvents.emit('popup:opened');
            this.children[widgetName].sandbox.on('close', this.close);
        },
        close: function(widgetName) {
            this.children[widgetName].sandbox.off('close', this.close);
            this.removeChildWidget(widgetName);
            this.isDisabled = false;
//            window.appEvents.emit('popup:closed');
        },
        setDevices: function() {
            this.checkForTutorial();
        },
        popupOpened: function() {
            clearTimeout(this.timeout);
            this.showPopup = false;
        },
        popupClosed: function() {
            this.showPopup = true;
            this.checkForTutorial(30000);
        },
        checkForTutorial: function(time) {
            var self = this;
            DEBUG && console.log("checkForTutorial");
            if (!time) {
                time = 70000;
            }
            if (this.timeout) {
                clearTimeout(this.timeout);
            }
            //default 30 second timeout
            this.timeout = setTimeout(function() {
                self.checkForBulb();
            }, time);
        },
        checkForBulb: function() {
            var self = this;
            var hasMultipleBulbs = false;
            _.each(this.sandbox._parent.sandboxes, function(device) {
                if (device.information.productType && device.information.productType.match(/lighting/gi)) {
                    self.bulbArray.push(device.information.productName);
                }
            });

            if (self.bulbArray.length < 2) {
                window.sessionStorage.setItem('hasMultipleBulbs', false);
            } else {
                window.sessionStorage.setItem('hasMultipleBulbs', true);
            }

            //do not allow during firmware update
            var inProgress = this.sandbox.util.storage.getItem('firmwareUpdateInProgress');
            this.showPopup = false;

            if (inProgress === "true") {
                this.showPopup = false;
                window.localStorage.setItem('firstTimeLaunch', 'true');
            } else if (window.localStorage.getItem('firstTimeLaunch') !== "false") {
                this.showPopup = true;
            }

            //open walkthrough should not allow any other walkthroughs. open popup should not allow any other popups
            var ifBridgePresent = window.sessionStorage.getItem('BridgePresent');

            if (ifBridgePresent === "true") {
                if(this.showPopup){
                    self.loadChildWidget({
                        $el: ($('#startWidget')),
                        widgetName: 'wemo_group_tutorial'
                    });
                }
            }

        }
    };
});}());