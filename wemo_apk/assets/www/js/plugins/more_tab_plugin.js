var moreTabPlugin = {

    execute:function(success_callback, error_callback, action, args)
    {
        console.log("more_tab_plugin.js: execute Action: " + action);

        return cordova.exec(

            success_callback,

            error_callback,

            plugins.MORE_TAB,

            action,

            args

        );

    }
}