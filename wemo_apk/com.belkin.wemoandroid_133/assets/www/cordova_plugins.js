cordova.define('cordova/plugin_list', function(require, exports, module) {
    module.exports = [
        {
            "file": "plugins/cordova-plugin-globalization/www/GlobalizationError.js",
            "id": "cordova-plugin-globalization.GlobalizationError",
            "clobbers": [
                "window.GlobalizationError"
            ]
        },
        {
            "file": "plugins/cordova-plugin-globalization/www/globalization.js",
            "id": "cordova-plugin-globalization.globalization",
            "clobbers": [
                "navigator.globalization"
            ]
        },
        {
            "file": "plugins/cordova-plugin-inappbrowser/www/inappbrowser.js",
            "id": "cordova-plugin-inappbrowser.inappbrowser",
            "clobbers": [
                "cordova.InAppBrowser.open",
                "window.open"
            ]
        },
        {
            "file": "plugins/cordova-plugin-sqlite/www/SQLitePlugin.js",
            "id": "cordova-plugin-sqlite.SQLitePlugin",
            "clobbers": [
                "window.sqlitePlugin",
                "cordova.plugins.sqlitePlugin"
            ]
        },
            {
                "file": "plugins/cordova-plugin-network-information/www/network.js",
                "id": "cordova-plugin-network-information.network",
                "clobbers": [
                    "navigator.connection",
                    "navigator.network.connection"
                ]
            },
            {
                "file": "plugins/cordova-plugin-network-information/www/Connection.js",
                "id": "cordova-plugin-network-information.Connection",
                "clobbers": [
                    "Connection"
                ]
            },
            {
                "file": "plugins/cordova-plugin-device/www/device.js",
                "id": "cordova-plugin-device.device",
                "clobbers": [
                    "device"
                ]
            }
    ];
    module.exports.metadata =
    // TOP OF METADATA
    {
        "cordova-plugin-whitelist": "1.2.2",
        "cordova-plugin-globalization": "1.0.3",
        "cordova-plugin-inappbrowser": "1.4.0",
        "cordova-plugin-sqlite": "1.0.3",
        "cordova-plugin-network-information": "1.2.1",
        "cordova-plugin-device": "1.1.2"
    };
    // BOTTOM OF METADATA
});