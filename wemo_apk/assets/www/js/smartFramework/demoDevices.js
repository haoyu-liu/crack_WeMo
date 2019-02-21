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
        define(definition);
    } else {
        window.demoDevices = definition();
    }

})(function () {
    return null;
});