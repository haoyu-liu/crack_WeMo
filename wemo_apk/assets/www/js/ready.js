var deviceReadyDeferred = $.Deferred();
var jqmReadyDeferred = $.Deferred();

document.addEventListener("deviceReady", deviceReady, false);

function deviceReady() {
    deviceReadyDeferred.resolve();
}

$(document).ready(function() {
    jqmReadyDeferred.resolve();
});

$.when(deviceReadyDeferred, jqmReadyDeferred).then(doWhenBothFrameworksLoaded);

function doWhenBothFrameworksLoaded() {
    var event = document.createEvent("Event");
    event.initEvent("wemo-frameworks-loaded",true,true);
    document.dispatchEvent(event);
    console.log('frameworks are ready');
}