/*
 onoff.widget.js

 Created by Belkin International, Software Engineering on 10/04/2013.
 Copyright (c) 2012-2013 Belkin International, Inc. and/or its affiliates. All rights reserved.

 Belkin International, Inc. retains all right, title and interest (including all
 intellectual property rights) in and to this computer program, which is
 protected by applicable intellectual property laws.  Unless you have obtained
 a separate written license from Belkin International, Inc., you are not authorized
 to utilize all or a part of this computer program for any purpose (including
 reproduction, distribution, modification, and compilation into object code),
 and you must immediately destroy or return to Belkin International, Inc. all copies
 of this computer program.  If you are licensed by Belkin International, Inc., your
 rights to utilize this computer program are limited by the terms of that license.

 To obtain a license, please contact Belkin International, Inc.

 This computer program contains trade secrets owned by Belkin International, Inc.
 and, unless unauthorized by Belkin International, Inc. in writing, you agree to
 maintain the confidentiality of this computer program and related information
 and to not disclose this computer program and related information to any
 other person or entity.

 THIS COMPUTER PROGRAM IS PROVIDED AS IS WITHOUT ANY WARRANTIES, AND BELKIN INTERNATIONAL, INC.
 EXPRESSLY DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING THE WARRANTIES OF
 MERCHANTIBILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE, AND NON-INFRINGEMENT.
 */
String.prototype.replaceAt = function (index, character) {
    return this.substr(0, index) + character + this.substr(index + character.length);
};

(function ($) {
    var methods = {
        show: function () {
            this.each(function () {
                $(this).show();
            });
        },
        hide: function () {
            this.each(function () {
                $(this).hide();
            });
        },
        setVal: function (me, id) {
            var opt = me.data('options');

            if (opt != undefined) {
                if (opt.curval == 'off') {
                    $('#' + id + '-on').hide();
                    $('#' + id + '-off').css('margin-left', opt.width / 2);
                    $('#' + id + '-off').show();
                }
                else {
                    $('#' + id + '-off').hide();
                    $('#' + id + '-on').show();
                }
            }
        },
        toggleVal: function (me, id, callback) {
            var opt = me.data('options');

            if (opt != undefined) {
                if (opt.curval == 'on') {
                    opt.curval = 'off';
                    $('#' + id + '-on').hide();
                    $('#' + id + '-off').css('margin-left', opt.width / 2);
                    $('#' + id + '-off').show();
                    callback('off');
                }
                else {
                    opt.curval = 'on';
                    $('#' + id + '-off').hide();
                    $('#' + id + '-on').show();
                    callback('on');
                }

                me.data('options', opt);
            }
        }
    };

    $.fn.BelkinOnOff = function (options, method, callback) {

        var options = $.extend({
            curval: "on",
            onval: "on",
            offval: "off",
            width: "100",
            height: "20"
        }, options);

        console.log("On-off got value: " + options.curval);

        var id = $(this).attr("id");

        if (!$(this).data('options')) {
            $(this).data('options', options);

            var html = $(this).html();

            html += '<div class="on_off_widget" id="' + id + '-content" style="width: ' + options.width + 'px; height: ' + options.height + 'px;">';
            html += '<div class="on_off_widget_on"  id="' + id + '-on" style="width: ' + options.width / 2 + 'px; height: ' + options.height + 'px;"><span>' + options.onval + '</span></div>';
            html += '<div class="on_off_widget_off"  id="' + id + '-off" style="width: ' + options.width / 2 + 'px; height: ' + options.height + 'px;"><span>' + options.offval + '</span></div>';
            html += '</div>';

            $(this).html(html);

            methods.setVal($(this), id);

            var me = $(this);

            $('#' + id + '-content').on('tap', function (e) {
                var id = $(this).parent().attr('id');
                methods.toggleVal(me, id, callback);
                e.preventDefault();
            });

        }

        if (methods[method]) {
            return methods[ method ].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method not found' + method);
        }
    };


})(jQuery);
