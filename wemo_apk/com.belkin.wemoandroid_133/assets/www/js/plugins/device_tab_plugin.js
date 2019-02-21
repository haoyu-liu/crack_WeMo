var deviceTabPlugin = {

    execute:function(success_callback, error_callback, action, args)
    {
        console.log("device_tab_plugin.js: execute Action: " + action);

        return cordova.exec(

            success_callback,

            error_callback,

            plugins.DEVICE,

            action,

            args

        );

    }
}