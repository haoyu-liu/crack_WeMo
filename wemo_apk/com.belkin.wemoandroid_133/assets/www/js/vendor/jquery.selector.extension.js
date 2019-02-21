/*
    @author Abhishek Kumar
    @src http://james.padolsey.com/javascript/a-better-data-selector-for-jquery/
    @example 
        $('a#someLink').data('ABC', '123');
        $('a[ABC=123]');
*/
(function($){
    var _dataFn = $.fn.data;
    $.fn.data = function(key, val){
        if (typeof val !== 'undefined'){ 
            $.expr.attrHandle[key] = function(elem){
                return $(elem).attr(key) || $(elem).data(key);
            };
        }
        return _dataFn.apply(this, arguments);
    };
})(jQuery);