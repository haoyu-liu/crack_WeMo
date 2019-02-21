var rulesTabPlugin = {

    execute:function(success_callback, error_callback, action, args)
    {
        console.log("rules_tab_plugin.js: execute Action: " + action);

        return cordova.exec(

            success_callback,

            error_callback,

            plugins.RULES,

            action,

            args

        );

    }
}