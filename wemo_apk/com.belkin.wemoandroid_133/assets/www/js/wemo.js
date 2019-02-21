var isRemoteEnabled = false;
var wemo = wemo || {};
var disableNetworkWatchdog = false;
var isSetupWorkflow = false;

$(document).ready(function() {

    var inStr = false;
    $('[localString*="true"]').each(function(i) {
        var lanKey = $(this).attr('_key');
        var inStr = $(this).attr('_innerString');
        if (inStr) {
            $(this).html(wemo.items[lanKey]);
        } else {
            $(this).html(wemo.items[lanKey]);
        }
    });

    //All initialization script goes here
    if (window.sessionStorage.getItem(sessionStore.REMOTE_MODE) == "true")
        isRemoteEnabled = true;
    /***********************/
    (function($) {
        $.fn.extend({
            //plugin name - cssLoader
            cssLoader: function(options) {

                var defaults = {
                    show: true,
                    htmlTemplate: '<div id="floatingCirclesG">' +
                        '<div class="f_circleG" id="frotateG_01"></div>' +
                        '<div class="f_circleG" id="frotateG_02"></div>' +
                        '<div class="f_circleG" id="frotateG_03"></div>' +
                        '<div class="f_circleG" id="frotateG_04"></div>' +
                        '<div class="f_circleG" id="frotateG_05"></div>' +
                        '<div class="f_circleG" id="frotateG_06"></div>' +
                        '<div class="f_circleG" id="frotateG_07"></div>' +
                        '<div class="f_circleG" id="frotateG_08"></div>' +
                        '</div>',
                };

                var options = $.extend(defaults, options);

                return this.each(function() {
                    var o = defaults;
                    var obj = $(this);
                    if (o.show) {
                        obj.html(o.htmlTemplate);
                    } else {
                        obj.html("");
                    }

                });
            }
        });
    })(jQuery);

    /**********************/
    /*********** mask loder*********/
    /*(function($){
     $.fn.extend({
     //plugin name - cssLoader
     showBackgroundMask: function(options) {

     var defaults = {
     show:true,
     htmlTemplate:'',
     };

     var options = $.extend(defaults, options);

     return this.each(function() {
     var o =defaults;
     var obj = $(this);
     var div = $("<div />");
     div.attr("id", "mask");
     div.addClass("modalWindow");
     var h=0;

     if ($(".ui-header").length) {h+=$(this).height();}
     if ($(".ui-page").length) {h+=$(this).height();}
     if ($(".ui-footer").length) {h+=$(this).height();}

     div.css({'height':h});
     div.click(function(){
     $('.more_tab').fadeOut();
     $(this).remove();
     document.ontouchmove = function(e) {
     return true;
     }
     });
     if(o.show){
     $(this).append(div);
     }else{
     div.remove();
     }

     });
     },
     hideBackgroundMask: function(){
     $("#mask").remove();
     document.ontouchmove = function(e) {
     return true;
     }
     }

     });
     })(jQuery);    */

    /******** mask loader**********/

    /******** foreign character replace ******/
    /*var char_convert = function (str)
     {

     var out = str.replace(/\w/g, function(c) {
     return {'Ãƒâ€šÃ‚Â©':'&copy;', 'ÃƒÆ’Ã¢â‚¬Âº':'&#219;', 'Ãƒâ€šÃ‚Â®':'&reg;', 'Ãƒâ€¦Ã‚Â¾':'&#158;', 'ÃƒÆ’Ã…â€œ':'&#220;', 'Ãƒâ€¦Ã‚Â¸':'&#159;', 'ÃƒÆ’Ã¯Â¿Â½':'&#221;', '$':'&#36;','ÃƒÆ’Ã…Â¾':'&#222;','%':'&#37;', 'Ãƒâ€šÃ‚Â¡':'&#161;', 'ÃƒÆ’Ã…Â¸':'&#223;', 'Ãƒâ€šÃ‚Â¢':'&#162;', 'ÃƒÆ’Ã‚Â ':'&#224;', 'Ãƒâ€šÃ‚Â£':'&#163;', 'ÃƒÆ’Ã‚Â¡':'&#225;', 'ÃƒÆ’Ã¢â€šÂ¬':'&Agrave;', 'Ãƒâ€šÃ‚Â¤':'&#164;', 'ÃƒÆ’Ã‚Â¢':'&#226;', 'ÃƒÆ’Ã¯Â¿Â½':'&Aacute;', 'Ãƒâ€šÃ‚Â¥':'&#165;', 'ÃƒÆ’Ã‚Â£':'&#227;', 'ÃƒÆ’Ã¢â‚¬Å¡':'&Acirc;', 'Ãƒâ€šÃ‚Â¦':'&#166;', 'ÃƒÆ’Ã‚Â¤':'&#228;', 'ÃƒÆ’Ã†â€™':'&Atilde;', 'Ãƒâ€šÃ‚Â§':'&#167;', 'ÃƒÆ’Ã‚Â¥':'&#229;', 'ÃƒÆ’Ã¢â‚¬Å¾':'&Auml;', 'Ãƒâ€šÃ‚Â¨':'&#168;', 'ÃƒÆ’Ã‚Â¦':'&#230;', 'ÃƒÆ’Ã¢â‚¬Â¦':'&Aring;', 'Ãƒâ€šÃ‚Â©':'&#169;', 'ÃƒÆ’Ã‚Â§':'&#231;', 'ÃƒÆ’Ã¢â‚¬Â ':'&AElig;', 'Ãƒâ€šÃ‚Âª':'&#170;', 'ÃƒÆ’Ã‚Â¨':'&#232;', 'ÃƒÆ’Ã¢â‚¬Â¡':'&Ccedil;', 'Ãƒâ€šÃ‚Â«':'&#171;', 'ÃƒÆ’Ã‚Â©':'&#233;', 'ÃƒÆ’Ã‹â€ ':'&Egrave;', 'Ãƒâ€šÃ‚Â¬':'&#172;', 'ÃƒÆ’Ã‚Âª':'&#234;', 'ÃƒÆ’Ã¢â‚¬Â°':'&Eacute;', 'Ãƒâ€šÃ‚Â­':'&#173;', 'ÃƒÆ’Ã‚Â«':'&#235;', 'ÃƒÆ’Ã…Â ':'&Ecirc;', 'Ãƒâ€šÃ‚Â®':'&#174;', 'ÃƒÆ’Ã‚Â¬':'&#236;', 'ÃƒÆ’Ã¢â‚¬Â¹':'&Euml;', 'Ãƒâ€šÃ‚Â¯':'&#175;', 'ÃƒÆ’Ã‚Â­':'&#237;', 'ÃƒÆ’Ã…â€™':'&Igrave;', 'Ãƒâ€šÃ‚Â°':'&#176;', 'ÃƒÆ’Ã‚Â®':'&#238;', 'ÃƒÆ’Ã¯Â¿Â½':'&Iacute;', 'Ãƒâ€šÃ‚Â±':'&#177;', 'ÃƒÆ’Ã‚Â¯':'&#239;', 'ÃƒÆ’Ã…Â½':'&Icirc;', 'Ãƒâ€šÃ‚Â²':'&#178;', 'ÃƒÆ’Ã‚Â°':'&#240;', 'ÃƒÆ’Ã¯Â¿Â½':'&Iuml;', 'Ãƒâ€šÃ‚Â³':'&#179;', 'ÃƒÆ’Ã‚Â±':'&#241;', 'ÃƒÆ’Ã¯Â¿Â½':'&ETH;', 'Ãƒâ€šÃ‚Â´':'&#180;', 'ÃƒÆ’Ã‚Â²':'&#242;', 'ÃƒÆ’Ã¢â‚¬Ëœ':'&Ntilde;', 'Ãƒâ€šÃ‚Âµ':'&#181;', 'ÃƒÆ’Ã‚Â³':'&#243;', 'ÃƒÆ’Ã¢â‚¬Â¢':'&Otilde;', 'Ãƒâ€šÃ‚Â¶':'&#182;', 'ÃƒÆ’Ã‚Â´':'&#244;', 'ÃƒÆ’Ã¢â‚¬â€œ':'&Ouml;', 'Ãƒâ€šÃ‚Â·':'&#183;', 'ÃƒÆ’Ã‚Âµ':'&#245;', 'ÃƒÆ’Ã‹Å“':'&Oslash;', 'Ãƒâ€šÃ‚Â¸':'&#184;', 'ÃƒÆ’Ã‚Â¶':'&#246;', 'ÃƒÆ’Ã¢â€žÂ¢':'&Ugrave;', 'Ãƒâ€šÃ‚Â¹':'&#185;', 'ÃƒÆ’Ã‚Â·':'&#247;', 'ÃƒÆ’Ã…Â¡':'&Uacute;', 'Ãƒâ€šÃ‚Âº':'&#186;', 'ÃƒÆ’Ã‚Â¸':'&#248;', 'ÃƒÆ’Ã¢â‚¬Âº':'&Ucirc;', 'Ãƒâ€šÃ‚Â»':'&#187;', 'ÃƒÆ’Ã‚Â¹':'&#249;', 'ÃƒÆ’Ã…â€œ':'&Uuml;', '@':'&#64;', 'Ãƒâ€šÃ‚Â¼':'&#188;', 'ÃƒÆ’Ã‚Âº':'&#250;', 'ÃƒÆ’Ã¯Â¿Â½':'&Yacute;', 'Ãƒâ€šÃ‚Â½':'&#189;', 'ÃƒÆ’Ã‚Â»':'&#251;', 'ÃƒÆ’Ã…Â¾':'&THORN;', 'ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬':'&#128;', 'Ãƒâ€šÃ‚Â¾':'&#190;', 'ÃƒÆ’Ã‚Â¼':'&#252', 'ÃƒÆ’Ã…Â¸':'&szlig;', 'Ãƒâ€šÃ‚Â¿':'&#191;', 'ÃƒÆ’Ã‚Â½':'&#253;', 'ÃƒÆ’Ã‚Â ':'&agrave;', 'ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡':'&#130;', 'ÃƒÆ’Ã¢â€šÂ¬':'&#192;', 'ÃƒÆ’Ã‚Â¾':'&#254;', 'ÃƒÆ’Ã‚Â¡':'&aacute;', 'Ãƒâ€ Ã¢â‚¬â„¢':'&#131;', 'ÃƒÆ’Ã¯Â¿Â½':'&#193;', 'ÃƒÆ’Ã‚Â¿':'&#255;', 'ÃƒÆ’Ã‚Â¥':'&aring;', 'ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¾':'&#132;', 'ÃƒÆ’Ã¢â‚¬Å¡':'&#194;', 'ÃƒÆ’Ã‚Â¦':'&aelig;', 'ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¦':'&#133;', 'ÃƒÆ’Ã†â€™':'&#195;', 'ÃƒÆ’Ã‚Â§':'&ccedil;', 'ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â ':'&#134;', 'ÃƒÆ’Ã¢â‚¬Å¾':'&#196;', 'ÃƒÆ’Ã‚Â¨':'&egrave;', 'ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¡':'&#135;', 'ÃƒÆ’Ã¢â‚¬Â¦':'&#197;', 'ÃƒÆ’Ã‚Â©':'&eacute;', 'Ãƒâ€¹Ã¢â‚¬Â ':'&#136;', 'ÃƒÆ’Ã¢â‚¬Â ':'&#198;', 'ÃƒÆ’Ã‚Âª':'&ecirc;', 'ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â°':'&#137;', 'ÃƒÆ’Ã¢â‚¬Â¡':'&#199;', 'ÃƒÆ’Ã‚Â«':'&euml;', 'Ãƒâ€¦Ã‚Â ':'&#138;', 'ÃƒÆ’Ã‹â€ ':'&#200;', 'ÃƒÆ’Ã‚Â¬':'&igrave;', 'ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¹':'&#139;', 'ÃƒÆ’Ã¢â‚¬Â°':'&#201;', 'ÃƒÆ’Ã‚Â­':'&iacute;', 'Ãƒâ€¦Ã¢â‚¬â„¢':'&#140;', 'ÃƒÆ’Ã…Â ':'&#202;', 'ÃƒÆ’Ã‚Â®':'&icirc;', 'ÃƒÆ’Ã¢â‚¬Â¹':'&#203;', 'ÃƒÆ’Ã‚Â¯':'&iuml;', 'Ãƒâ€¦Ã‚Â½':'&#142;', 'ÃƒÆ’Ã…â€™':'&#204;', 'ÃƒÆ’Ã‚Â°':'&eth;', 'ÃƒÆ’Ã¯Â¿Â½':'&#205;', 'ÃƒÆ’Ã‚Â±':'&ntilde;', 'ÃƒÆ’Ã…Â½':'&#206;', 'ÃƒÆ’Ã‚Â²':'&ograve;', 'ÃƒÂ¢Ã¢â€šÂ¬Ã‹Å“':'&#145;', 'ÃƒÆ’Ã¯Â¿Â½':'&#207;', 'ÃƒÆ’Ã‚Â³':'&oacute;', 'ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢':'&#146;', 'ÃƒÆ’Ã¯Â¿Â½':'&#208;', 'ÃƒÆ’Ã‚Â´':'&ocirc;', 'ÃƒÂ¢Ã¢â€šÂ¬Ã…â€œ':'&#147;', 'ÃƒÆ’Ã¢â‚¬Ëœ':'&#209;', 'ÃƒÆ’Ã‚Âµ':'&otilde;', 'ÃƒÂ¢Ã¢â€šÂ¬Ã¯Â¿Â½':'&#148;', 'ÃƒÆ’Ã¢â‚¬â„¢':'&#210;', 'ÃƒÆ’Ã‚Â¶':'&ouml;', 'ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¢':'&#149;', 'ÃƒÆ’Ã¢â‚¬Å“':'&#211;', 'ÃƒÆ’Ã‚Â¸':'&oslash;', 'ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Å“':'&#150;', 'ÃƒÆ’Ã¢â‚¬ï¿½':'&#212;', 'ÃƒÆ’Ã‚Â¹':'&ugrave;', 'ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬ï¿½':'&#151;', 'ÃƒÆ’Ã¢â‚¬Â¢':'&#213;', 'ÃƒÆ’Ã‚Âº':'&uacute;', 'Ãƒâ€¹Ã…â€œ':'&#152;', 'ÃƒÆ’Ã¢â‚¬â€œ':'&#214;', 'ÃƒÆ’Ã‚Â»':'&ucirc;', 'ÃƒÂ¢Ã¢â‚¬Å¾Ã‚Â¢':'&#153;', 'ÃƒÆ’Ã¢â‚¬â€�':'&#215;', 'ÃƒÆ’Ã‚Â½':'&yacute;', 'Ãƒâ€¦Ã‚Â¡':'&#154;', 'ÃƒÆ’Ã‹Å“':'&#216;', 'ÃƒÆ’Ã‚Â¾':'&thorn;', 'ÃƒÂ¢Ã¢â€šÂ¬Ã‚Âº':'&#155;', 'ÃƒÆ’Ã¢â€žÂ¢':'&#217;', 'ÃƒÆ’Ã‚Â¿':'&yuml;', 'Ãƒâ€¦Ã¢â‚¬Å“':'&#156;', 'ÃƒÆ’Ã…Â¡':'&#218;'}[c] || c;
     });
     return out;
     }*/


    /******** foreign character replace ******/


    /****Switch on and off*****/
    $('[name=switch_li]').on('pointerdown', function() {

        if ($(this).find('[name="switch"]').attr('class') == 'switch_on') {
            $(this).find('[name="switch"]').addClass('switch_off').removeClass('switch_on');
        } else {
            $(this).find('[name="switch"]').addClass('switch_on').removeClass('switch_off');
        }
    });

    var moreMenuElement = {
        'hiddenNetwork': {
            'key': 'hiddenNetwork',
            'id': 'dropdown_hidden_network',
            'name': 'hidden_network'
        },
        'help': {
            'key': 'help',
            'id': 'setup_help',
            'name': 'setup_help'
        }
    };
    var ul = $('<ul id="more_items" />');

    $.each(moreMenuElement, function(i, item) {
        var li = $('<li id=' + item.id + '/>');
        li.html(wemo.items[item.key]);
        ul.append(li);
    });

    var $moreTab = $('.more_tab'),
        $modalWindow = $('<div class="modalWindow"/>'),
        more_tab_icon = $(".more_tab_icon");

    /** CREATE MODAL BACKGROUND **/
    if ($('body').find('.modalWindow').length === 0) {
        $moreTab.after($modalWindow);
        $modalWindow.on('pointerdown', function() {
                $modalWindow.removeClass('isOpen');
                more_tab_icon.trigger('tap');
        });
    }

    $moreTab.html(ul);

    /**** top menu hide / show****/
    if (more_tab_icon) {
        more_tab_icon.on('tap', function(e) {

            if(MORE_MENU_PAGE && !isSetupWorkflow) {
                wemoUtil.setPreviousUrl(window.location.href);
                wemoUtil.loadUrl(filePath.MORE_MENU);
            } else {
                //see if the menu is open
                if (!$moreTab.hasClass('isOpen')) {
                    $moreTab.addClass('isOpen')
                        .show();
                    $modalWindow.addClass('isOpen');
                } else {
                    $moreTab.removeClass('isOpen')
                        .hide();
                }
            }
            e.stopPropagation();
        });
    }

    $(".more_tab").css({
        'top': 0
    });

    $('#setup_help').on('pointerdown', function() {
        wemoUtil.loadUrl(filePath.CONNECT_TO_HELP_PAGE);
    });

});
