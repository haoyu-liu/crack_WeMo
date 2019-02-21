(function () {
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
define('widgets/devicelist/main',['feature!dataInterface', 'feature!demoDevices', 'plugins/xml2json', 'libs/pouchInterface', 'plugins/jquery.transit'],
    /** @exports device list controller for android */
    function(DataInterface, demoDevices, XmlJson, pouchInterface) {


        'use strict';

        /**
         * is supposed to close the existing modal, but doesnt seem to be working right now. need to fix
         */
        function closeModalWindow() {
            var $overlay = $('.modalWindow');
            if ($overlay.length > 0) {
                $overlay.transit({
                    opacity: 0
                }, 200, function() {
                    $overlay.removeClass('isOpen');
                });
            }
        }

        /**
         * gets the list of discovered devices from localStorage.
         * Implement t 4.0 (show crockpot as unavailable if it was previously discovered, but is not discovered on app launch. Remove it from device list if undiscovered for 14 hours)
         */
        function checkUndiscoveredDevices(resp) {
            DEBUG && console.log('DISCOVERED: FOUND DEVICE LIST:' + JSON.stringify(resp));

            //dont do anything unless we actually have a response. this is to prevent errors when using the refresh button in android
            if (_.size(resp) > 0) {

                DEBUG && console.log('DISCOVERED:' + JSON.stringify(window.localStorage.getItem('wemo-discovered-devices')));
                var discoveredDevices = window.localStorage.getItem('wemo-discovered-devices');
                if (typeof discoveredDevices !== 'object') {
                    discoveredDevices = JSON.parse(discoveredDevices);
                }

                _.each(discoveredDevices, function(value, index) {

                    DEBUG && console.log('DISCOVERED IN LOOP:' + value + ':' + index);
                    var discovered = false;
                    //var indexS = index.split(':'); // Vijay
                    var SN = (discoveredDevices[index]['udn']); //indexS[1]; //serial number // Vijay
                    DEBUG && console.log('DISCOVERED: LOOKING FOR THIS SN:' + SN);

                    //loop through the found device list and see if SN matches
                    _.each(resp, function(respValue) {
                        DEBUG && console.log('DISCOVERED: compare with this sn:' + respValue.serialNumber + ':' + SN);
                        //if(respValue.serialNumber === SN){// Vijay
                        if (respValue['udn'] === SN) {
                            discovered = true;
                        }
                    });

                    //check the existing widgets to make sure its not already there
                    $('.widget').each(function() {
                        if ($(this).attr('data-sn') === SN) {
                            discovered = true;
                        }
                    });

                    /**
                     * 10-25 12:50:01.852: I/DevicePlugin(22538): device added JSON: {"state":"1","serialNumber":"221322S0000069","friendlyName":"Slow Cooker","type":"urn:Belkin:device:crockpot:1","listen":"device_added","udn":"uuid:crockpot-1_0-221322S0000069","iconURL":"http:\/\/192.168.1.130:49154\/icon.jpg"}

                     */


                    DEBUG && console.log('DISCOVERED: YOU SHOULD NOT BE IN THE NOT:' + discovered);
                    //hasn't been discovered
                    if (!discovered) {
                        DEBUG && console.log('DISCOVERED: NOT DISCOVERED:' + value + ':' + index);
                        //isn't already in the list. check the timestamp to see if we should still put it in the list. otherwise, we'll delete it from localstorage
                        var now = Date.now();

                        //get the stored data and use it to build the device
                        var model = new Backbone.Model();
                        model.set('serialNumber', SN);
                        pouchInterface.get(model).then(function(resp) { //get it from storage
                            model.set(resp);
                            DEBUG && console.log('DISCOVERED: GETTING MODEL')
                            if ((parseInt(now, 10) - parseInt(value, 10)) < 50400000) { //14 hours in milliseconds
                                model.set('undiscovered', true);
                                DEBUG && console.log('DISCOVERED: undiscovered set to true:' + model.get('undiscovered'));
                                //save it with the undiscovered field set to true, then emit the command to add the undiscovered device to the list
                                pouchInterface.put(model).then(function() { //add new property and save it back to storage
                                    DEBUG && console.log('DISCOVERED: model saved to cache?' + JSON.stringify(model.attributes));
                                    window.devicelistEvents.emit('addUndiscoveredDevice', model.attributes);
                                });

                            } else {
                                //if it has been more than 14 hours, remove it from discovered devices. it wont display in the list
                                model.set('undiscovered', false);
                                pouchInterface.put(model).then(function() { //add new property and save it back to storage
                                    delete discoveredDevices[index];
                                });
                            }

                        }).fail(function() {
                            //something went wrong... not what?
                            console.log('THAT DIDNT WORK!');
                        });


                    }

                });

                //reset localstorage to remove deleted items, if any
                window.localStorage.setItem('wemo-discovered-devices', JSON.stringify(discoveredDevices));
            }
        }
        var wemoNotSmartArray = ['Socket', /* Default - unknown case */
            'controllee',
            'socket', /* DEVICE_SOCKET */
            'sensor', /* DEVICE_SENSOR */
            'wemo_baby', /* DEVICE_BABYMON */
            'stream', /* DEVICE_STREAMING - NOT USED */
            'bridge', /* DEVICE_BRIDGE - NOT USED */
            'insight', /* DEVICE_INSIGHT */
            'lightswitch', /* DEVICE_LIGHTSWITCH */
            'netcam', /* DEVICE_NETCAM - Remote */
            'netcamhdv2', /* DEVICE_NETCAMV2 - Remote */
            'netcamhdv1', /* DEVICE_NETCAMV1 - Remote */
            'netcamsensor' /* DEVICE_NETCAM */
        ];


        function InjectionObject(options, sandbox, $el) {
            var self = this;
            //  self.isInjectionObject = true;
            self.sandbox = sandbox;
            self.$el = $el;
            self.alreadyRendered = [];
            self.deviceOptions = options;
            self.deviceOptions.$listItem = $(self.deviceOptions.listItem);
            self.replaceSmartDevices();
        }

        InjectionObject.prototype = {
            replaceSmartDevices: function() {
                exports.replaceSmartDevices.call(this);
            },
            handleDeviceList: function() {
                exports.handleDeviceList.call(this, this.deviceOptions.device);
            },
            getWidgetCode: function() {
                exports.getWidgetCode.call(this);
            },
            render: function() {
                exports.render.call(this);
            }
        };


        var exports = {
            type: 'Backbone',
            /**
             * starts the process
             */
            initialize: function() {
                console.log('RUNNING')
                var self = this;
                // this.dataInterface = new DataInterface();
                // this.getDeviceList();
                this.alreadyRendered = [];

                DEBUG && console.log('EVENTS:ready to receive');

                if (window.devicelistEvents && window.device_list) {

                    window.devicelistEvents.on('devicesFinished', function(resp) {
                        DEBUG && console.log('DISCOVER: calling for check');
                        checkUndiscoveredDevices(resp);
                    });


                    window.devicelistEvents.on('deviceAdded', function(options) {
                        new InjectionObject(options, self.sandbox, self.$el);
                    });

                    window.addSmartFrameworkDevice = function(options) {
                        return new InjectionObject(options, self.sandbox, self.$el);
                    };

                    if (window.hasFirmwareUpdate) {


                        this.$firmwareUpdate = $('<div id="firmwareUpdate">');
                        this.$firmwareUpdate.append('<div data-aura-widget="wemo_firmwareupdate"></div>');
                        this.sandbox.start(this.$firmwareUpdate, {
                            name: 'firmwareUpdate'
                        });

                    }

                    window.sessionStorage.setItem("smartframework", "ready");

                }


                if (demoDevices) {

                    window.device_list.processJSONDeviceList(demoDevices, false);

                    DEBUG && console.log('DEVICELIST: DEMODEVICES: SHOULD HAVE RUN');
                }


            },
            replaceSmartDevices: function() {

                DEBUG && console.log('DEVICELIST:DEVICEOPTIONS:' + JSON.stringify(this.deviceOptions.device));
                var splitDT = this.deviceOptions.device.type.split(':');
                var dt;

                if (splitDT.length > 3) {
                    dt = splitDT[3].toLowerCase();
                } else {
                    dt = this.deviceOptions.device.type;
                }
                DEBUG && console.log('DEVICELIST:DT=' + dt);

                if (_.indexOf(wemoNotSmartArray, dt.toLowerCase()) === -1) {
                    //get the device from the DOM
                    DEBUG && console.log('FOUND DEVICE TYPE:' + this.deviceOptions.device.type);
                    this.handleDeviceList(this.deviceOptions.device);
                } else {
                    DEBUG && console.log('DID NOT FIND DEVICE TYPE:' + this.deviceOptions.device.type);
                    //this.deviceOptions.device.isSmartFrameworkDevice = true;
                    if (this.isInjectionObject) {
                        return this.deviceOptions.listItem;
                    } else {
                        //return the original, non-smart device
                        this.deviceOptions.callback(this.deviceOptions.listItem, false);
                    }

                }


            },
            /**
             *   adds pointer events to the buttons, ui logic for the events
             */
            addDomEvents: function() {
                var self = this;

                var $editDevice = $('#edit_device');

                if (!$editDevice.hasClass('hasPointer')) {

                    $('#done_btn').on('pointerdown', function() {
                        $('#edit_device').trigger('pointerdown');
                    });

                    $editDevice.removeClass('none').addClass('hasPointer').on('pointerdown', function(e) {

                        var $el = $(e.currentTarget);

                        closeModalWindow();

                        window.app.events.emit('edit'); //sends an edit event to the tile/tiledrawer views
                        if (self.isEditing) {

                            $(".refresh_icon, .more_tab_icon").show();
                            $(".done_icon").hide();

                            self.stopOrdering();
                            self.isEditing = false;
                        } else {
                            /* TODO: close any open drawers */

                            $("#more_drawer").hide();
                            $(".done_icon").show();

                            self.isEditing = true;
                            // leave time for order buttons to be created
                            setTimeout(function() {
                                self.startOrdering();
                            }, 100);
                        }
                    });
                }
            },
            /**
             * gets the list of devices, either from UPNP or cloud, depending on remote.
             */
            getDeviceList: function() {
                var self = this;
                var now;
                var fetchDeviceList = false;
                var serverresp = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><response xmlns:modelns="http://datamodel.components.cs.belkin.com/" success="S" fail="F" partial_success="P"><statusCode>S</statusCode><resultCodes><resultCode><code>PLGN_200</code><description>Successful</description></resultCode></resultCodes><message>Plugins list retrieved successfully</message><home><homeId xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/><firmwareId>0</firmwareId></home><plugins><plugin><pluginId>782061</pluginId><macAddress>EC1A59C095E4</macAddress><serialNumber>221322S0000069</serialNumber><uniqueId>uuid:wemo_crockpot-1_0-221322S0000069</uniqueId><modelCode>crockpot</modelCode><privateKey></privateKey><status>52</status><statusTS>1376592816</statusTS><description>Crock-Pot Slow Cooker</description><notificationType>0</notificationType><createPluginTS>2013-08-07T17:00:38Z</createPluginTS><connectErrorTS xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/><statusDateTS>2013-08-15T18:53:36Z</statusDateTS><signalStrength>70</signalStrength></plugin><plugin><pluginId>779853</pluginId><macAddress>EC1A5975E440</macAddress><serialNumber>221250K0100EC3</serialNumber><uniqueId>uuid:Socket-1_0-221250K0100EC3</uniqueId><modelCode>Socket</modelCode><privateKey></privateKey><status>0</status><statusTS>1375989742</statusTS><description>WeMo ec3</description><notificationType>0</notificationType><createPluginTS>2013-08-06T19:58:28Z</createPluginTS><connectErrorTS xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:nil="true"/><statusDateTS>2013-08-08T19:22:22Z</statusDateTS><signalStrength>100</signalStrength></plugin></plugins></response>';

                this.alreadyRendered = [];

                // see if there are devices in local storage, and check their age.
                pouchInterface.getAll().then(function(resp) {

                    if (resp.total_rows > 0) {
                        //get widget code based on what we have stored, then get the device list if more than X amount of time has passed.
                        //       self.handleDeviceList(resp.rows, true);
                        now = Date.now();
                        //if the list is less than two minutes old, we won't bother getting it again

                        if (resp.rows[0].doc.timestamp < (now - 120000)) {
                            fetchDeviceList = true;
                        }
                    } else {
                        //just get the device list
                        fetchDeviceList = true;
                    }

                    //remove this for true build
                    //self.handleDeviceList(serverresp);

                    if (fetchDeviceList) {
                        self.dataInterface.devicePlugin.getDeviceList().then(function(resp) {

                            self.handleDeviceList(resp);

                        }).fail(function() {

                            DEBUG && console.log('DAMN, I FAILED.')

                        });

                    }


                });


            },
            /**
             * server response is passed to this function for processing
             * @param resp {object}
             * @param fromCache {boolean}
             */
            handleDeviceList: function(resp, fromCache) {

                this.widgetList = [];
                this.widgetSN = [];
                var devicelist;
                var self = this;


                DEBUG && console.log('DEVICE LIST:RESP:' + JSON.stringify(resp));

                if (typeof resp === 'object') {
                    devicelist = [resp];

                } else if (typeof resp === 'string' && resp.match(/xml/g)) {
                    devicelist = self.parseDeviceList(resp);
                } else if (Array.isArray(resp)) {
                    devicelist = resp;
                } else if (resp.friendlyName) {
                    devicelist = [resp];
                } else {
                    devicelist = resp[0];
                }


                if (devicelist.length > 0) {
                    _.each(devicelist, function(device) {


                        DEBUG && console.log('DEVICE LIST: DEVICE:' + JSON.stringify(device));

                        var dt;
                        if (device.doc) {
                            device = device.doc;
                        } //coming from db


                        if (device.deviceType) {
                            device.type = device.deviceType;
                        }

                        //urn:Belkin:device:controllee:1
                        /* get the model code */

                        if (!device.modelCode && device.udn) {
                            //var udn = device.udn.replace(/uuid\:/gi);
                            //This line is having issue in rplacing the uuid: with emplty
                            //Changed this to below.
                            var udn = device.udn.replace(/uuid:/gi, '');
                            var udnS = udn.split('-');
                            dt = udnS[0].toLowerCase();
                            if (!dt.match(/wemo/)) {
                                dt = 'wemo_' + dt;
                            }

                            device.modelCode = dt;
                            DEBUG && console.log('DEVICELIST: DEVICE: handleDeviceList: modelCode =' + device.modelCode);
                            //uuid:Crockpot-1_0-221337S0000081

                        } else if (!device.modelCode && device.type) {
                            var splitDT = device.type.split(':');
                            dt;

                            if (splitDT.length > 3) {
                                dt = splitDT[3].toLowerCase();
                            } else {
                                dt = device.type;
                            }

                            if (dt === 'controllee') {
                                dt = 'socket';
                            }

                            if (!dt.match(/wemo/)) {
                                dt = 'wemo_' + dt;
                            }

                            device.modelCode = dt;

                        } else if (device.modelCode) {
                            dt = device.modelCode.toLowerCase();
                            if (!dt.match(/wemo/)) {
                                dt = 'wemo_' + dt;
                            }

                            device.modelCode = dt;
                        }

                        if (!device.friendlyName) {
                            device.friendlyName = device.description;
                        }

                        if (!device.friendlyName) {
                            device.friendlyName = device.name;
                        }

                        if (device.pluginId) {
                            device.plugId = device.pluginId;
                        } else if (device.pluginid) {
                            device.plugId = device.pluginid;
                        } else {
                            device.plugId = null;
                        }

                        if (device.udn && !device.serialNumber) {
                            var splitUdn = device.udn.split('-');
                            var sn = splitUdn[splitUdn.length - 1];
                            device.serialNumber = sn;
                        }

                        if (!device.undiscovered) {
                            device.undiscovered = false;
                        }

                        if (!device.macAddress) {
                            device.macAddress = device.mac;
                        }

                        if (!device.status) {
                            device.status = device.state;
                        }

                        device.fullXML = device.fullXML || {};

                        DEBUG && console.log('DEVICE LIST: FRIENDLYNAME:' + device.friendlyName);

                        var attributes = {
                            udn: device.udn,
                            fullXML: device.fullXML,
                            friendlyName: device.friendlyName,
                            macAddress: device.macAddress,
                            modelCode: device.modelCode.toLowerCase(),
                            plugId: device.plugId,
                            pluginId: device.pluginId,
                            serialNumber: device.serialNumber,
                            status: device.status,
                            state: device.status,
                            uniqueId: device.uniqueId,
                            iconURL: device.iconURL,
                            undiscovered: device.undiscovered
                        };


                        var widget = {
                            url: 'widgets/' + device.modelCode + '/main.js',
                            attributes: attributes
                        };

                        DEBUG && console.log(widget);


                        self.widgetSN.push(device.serialNumber);
                        if (_.indexOf(self.alreadyRendered, device.serialNumber) === -1) {
                            self.widgetList.push(widget);
                        }

                    });

                }

                if (!fromCache) {
                    //need to reconcile the existing list with the incoming one.
                    var diff = _.difference(self.alreadyRendered, self.widgetSN);

                }

                self.getWidgetCode();
            },
            /**
             * converts XML to JSON (hopefully will be deprecated eventually)
             * @param xml
             * @returns {*|Function}
             */
            parseDeviceList: function(xml) {
                var xjs = new XmlJson();
                var json = xjs.xml_str2json(xml);
                return json.response.plugins.plugin;
            },
            /**
             * this is where the api to download packages from the web will go
             */
            getWidgetCode: function() {
                var self = this;
                /*   if (basket && !window.testRunner) {
                 basket.require(
                 this.widgetList
                 ).then(function () {

                 self.render();

                 }, function (error) {
                 DEBUG && console.log('OH CRAP' + error);
                 });
                 }
                 else { */
                self.render();
                //      }
            },
            /**
             * ui logic activates the drag and drop ordering
             */
            startOrdering: function() {
                DEBUG && console.log('STARTING ORDERING')
                var self = this;
                if (!this.hasPepped) {

                    var $ul = this.$el;
                    var $li = $ul.children('li');
                    $li.css('zIndex', 1);

                    // Pep 'em
                    $li.pep({
                        place: false,
                        axis: 'y',
                        shouldEase: false,
                        handle: '.order',
                        start: function(ev, obj) {
                            obj.$el.css('zIndex', 100);
                            obj.$el.addClass('sorting');
                        },
                        drag: function() {

                        },
                        stop: function(ev, obj) {

                            // Grab the list items and sort them based on
                            // distance from the top
                            $li.sort(function(a, b) {
                                return ($(a).position().top - $(b).position().top)
                            });
                            $ul.append($li);

                            self.saveOrdering($li);

                            // Remove CSS transformations so the list item
                            // fits nicely into place.
                            var matrix = obj.matrixToArray(obj.matrixString());
                            var x = -1 * matrix[4]
                            var y = -1 * matrix[5]
                            obj.moveToUsingTransforms(x, y);
                            obj.$el.css({
                                position: 'relative'
                            })
                                .removeClass('sorting');

                            //obj.toggle(false);
                            obj.$el.css('zIndex', 1);
                        }
                    });
                    this.hasPepped = true;
                } else {
                    DEBUG && console.log('ONLY TOGGLING');
                    $.pep.toggleAll(true);
                }
            },
            /**
             * ui logic stops drag and drop ordering
             */
            stopOrdering: function() {
                DEBUG && console.log('STOPPING ORDERING');
                $.pep.toggleAll(false);
            },
            /**
             * saves the changed order to localstorage to maintain correct order
             * @param $li {DOM Element}
             */
            saveOrdering: function($li) {
                var data = [];
                $li.each(function() {
                    data.push($(this).attr('data-sn'));
                });

                this.sandbox.util.storage.setItem('deviceOrder', data, 0);
            },
            /**
             * moves the visible elements into the correct order
             * @param listItems {Array}
             * @returns {*}
             */
            checkOrdering: function(listItems) {
                var order = this.sandbox.util.storage.getItem('deviceOrder');
                var newList = [];
                if (order) {
                    order.data.forEach(function(sn) {
                        listItems.forEach(function(item) {
                            if ($(item).attr('data-sn') === sn) {
                                newList.push(item);
                            }
                        });
                    });

                    return newList;
                } else {
                    return listItems;
                }
            },
            /**
             * appends each of the device widgets to the screen and inits them
             */
            render: function() {
                var self = this;
                var listItems = [];


                _.each(self.widgetList, function(widget) {
                    var $li;
                    if (self.deviceOptions) {
                        $li = self.deviceOptions.$listItem;
                        $li.empty();
                    } else {
                        $li = $('<li>');
                    }

                    DEBUG && console.log('DEVICELIST: DEVICE: modelCode =' + widget.attributes.modelCode);

                    if (widget.attributes.modelCode) {

                        if (widget.attributes.modelCode.match(/heater/gi)) {
                            widget.attributes.modelCode = 'wemo_heatera';
                        }

                        $li.attr({
                            //'data-aura-toload': widget.attributes.modelCode,
                            //'data-aura-widget': 'bundlemanager',
                            'data-aura-widget': widget.attributes.modelCode,
                            'data-attributes': JSON.stringify(widget.attributes),
                            'data-sn': widget.attributes.serialNumber
                        }).addClass('isApp').addClass('hidden');
                        /** see: extensions/views/backbone.tileandrawer.js for hide/show**/

                        self.alreadyRendered.push(widget.attributes.serialNumber);

                        listItems.push($li);

                    } else {
                        console.error('DEVICELIST:DEVICE: MODEL CODE IS UNDEFINED');
                    }

                });


                if (this.checkOrdering) {
                    listItems = this.checkOrdering(listItems);
                }

                listItems.forEach(function(item) {
                    self.$el.append(item);
                });


                this.sandbox.start(this.$el);

                if (this.deviceOptions) {
                    self.deviceOptions.$listItem.resizeElement();
                    if (self.isInjectionObject) {
                        DEBUG && console.log('DEVICELIST:NODENAME:' + self.deviceOptions.$listItem[0].nodeName);
                        return self.deviceOptions.$listItem;
                    } else {
                        //return the smart device
                        this.deviceOptions.callback(self.deviceOptions.$listItem, true);
                    }

                    delete this.deviceOptions;
                } else if (self.alreadyRendered.length > 0) {
                    this.addDomEvents();
                }

            }
        };

        return exports;

    });
}());