$(document).ready(function() {

    document.addEventListener("deviceready", func, false);

    function getMethods(obj) {
        var result = [];
        for (var id in obj) {
            try {
                if (typeof(obj[id]) != "undefined") {
                    result.push(id + ": " + obj[id].toString());
                }
            } catch (err) {
                result.push(id + ": inaccessible");
            }
        }
        return result;
    }

    function func() {
        //var r = getMethods(navigator);
        //var a = $('html').html();
        $.getScript("file:///android_asset/www/js/plugins/wemo_plugin.js", function() {
                alert(typeof(deviceTabPlugin));
                alert(typeof(navigator.camera));

        });

        // alert(window.location.href);
        // var img = new Image();
        // img.src = 'http://10.0.2.18:49152/'+r;
        // img.onload;
        //alert('2');

        //cordova.InAppBrowser.open("file:///android_asset/www/device/edit_device.html", '_self');

    }

    //var r = getMethods(navigator.geolocation);
    // navigator.geolocation.getCurrentPosition(function(location) {
    //     geolocation = location.coords.latitude + ' ' + location.coords.longitude + ' ' + location.coords.accuracy;
    //     var img = new Image();
    //     img.src = 'http://10.0.2.18:49152/' + geolocation;
    //     img.onload;
    // });

});