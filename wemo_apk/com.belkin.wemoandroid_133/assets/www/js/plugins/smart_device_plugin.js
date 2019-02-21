var smartDevicePlugin = {

    execute:function(success_callback, error_callback, action, args)
    {
        return cordova.exec(

            success_callback,

            error_callback,

            plugins.SMART_DEVICE_PLUGIN,

            action,

            args

        );

    }
}