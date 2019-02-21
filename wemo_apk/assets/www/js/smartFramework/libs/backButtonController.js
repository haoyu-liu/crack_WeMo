(function() {
    // YOUR ORIGINAL CODE HERE
    // 

    'use strict';

    window.backButtonCommands = {};
    var backButtonKeys = [];

    function backButtonCallback() {
        DEBUG && console.log('BACK BUTTON:android.js:backButtonCallback:should be fired every time back button is pressed');
        var last = _.last(backButtonKeys);
        if (window.backButtonCommands && window.backButtonCommands[last]) {
            window.backButtonCommands[last]();
            setTimeout(function() {
                //window.app.events.emit('removeBackButtonCommand', last);
                var command = new CustomEvent("removeBackButtonCommand", {
                    detail: {
                        key: last
                    }
                });
                // Trigger it!
                document.dispatchEvent(command);

            }, 0);
        } else {
            //no other back button commands.
            DEBUG && console.warn('there are no back button commands.');
        }
    }

    var BackButtonController = function(options) {
        this.initialize(options);
    }

    BackButtonController.prototype = {
        constructor: BackButtonController,
        initialize: function() {
            _.bindAll(this);

            this.listen();
        },
        listen: function() {
            var self = this;
            document.addEventListener('addBackButtonCommand', self.addBackButtonCommand);
            document.addEventListener('removeBackButtonCommand', self.removeBackButtonCommand);

            document.addEventListener('backbutton', function(e) {
                DEBUG && console.log('BACK BUTTON:android.js:added event listener');
                backButtonCallback();
            }, false);
        },
        addBackButtonCommand: function(data) {

            if (data.detail) {
                data = data.detail;
            }

            //see if it is  already there.
            if (_.indexOf(backButtonKeys, data.key) === -1) {
                backButtonKeys.push(data.key);
                backButtonCommands[data.key] = data.callback;
                DEBUG && console.log('BACK BUTTON:android.js:setupBackButton:addBackButtonCommand:backButtonKeys=' + JSON.stringify(backButtonKeys));
            }
            // if it is, delete the existing one and use this one as last in
            else {
                this.removeBackButtonCommand(data.key);
                this.addBackButtonCommand(data);
            }

        },
        removeBackButtonCommand: function(resp) {
            var key;
            if (typeof(resp) !== 'string') {
                key = resp.detail.key;
            } else {
                key = resp;
            }

            DEBUG && console.log('BACK BUTTON:android.js:setupBackButton:removeBackButtonCommand:key=' + key);
            var keyA = key.split('-');

            if (keyA[2] != '') {
                delete backButtonCommands[key];
                backButtonKeys = _.without(backButtonKeys, key);
            } else {
                var keysToDelete = [];
                var expression = new RegExp(key);
                backButtonKeys.forEach(function(value) {

                    if (value && value.match(expression)) {
                        keysToDelete.push(value);
                    }
                });

                if (keysToDelete.length > 0) {

                    keysToDelete.forEach(function(value) {
                        delete backButtonCommands[value];
                    });
                    backButtonKeys = _.difference(backButtonKeys, keysToDelete);

                }
            }
        }
    }

    if (typeof define === 'function' && define.amd) {
        define(['underscore'], function(_) {
            return BackButtonController;
        });
    } else if (typeof module !== 'undefined' && module.exports) {
        module.exports = BackButtonController;

        // Or maybe: module.exports.Foo = Foo;
        // It's up to you really.
    } else {
        this.backButtonController = new BackButtonController();
    }
}.call(this));