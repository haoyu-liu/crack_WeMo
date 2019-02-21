/*
 * jQuery MiniColors: A tiny color picker built on jQuery
 *
 * Copyright: Cory LaViska for A Beautiful Site, LLC
 *
 * Contributions and bug reports: https://github.com/claviska/jquery-minicolors
 *
 * @license: http://opensource.org/licenses/MIT
 *
 */
if (jQuery)(function($) {

    // Defaults
    $.minicolors = {
        defaults: {
            animationSpeed: 50,
            animationEasing: 'swing',
            change: null,
            changeDelay: 0,
            control: 'hue',
            dataUris: true,
            defaultValue: '',
            hide: null,
            hideSpeed: 100,
            inline: false,
            letterCase: 'lowercase',
            opacity: false,
            position: 'bottom left',
            show: null,
            showSpeed: 100,
            theme: 'default'
        }
    };

    // Public methods
    $.extend($.fn, {
        minicolors: function(method, data) {

            switch (method) {
                // Get/set the hex color value
                case 'value':
                    if (data === undefined) {
                        // Getter
                        return $(this).val();
                    } else {
                        // Setter
                        $(this).each(function() {
                            updateFromInput($(this).val(data));
                        });
                    }
                    return $(this);

                    // Initializes the control
                default:
                    if (method !== 'create') data = method;
                    $(this).each(function() {
                        init($(this), data);
                    });
                    return $(this);

            }

        }
    });

    // Initialize input elements
    function init(input, settings) {

        var minicolors = $('<div class="minicolors" />'),
            defaults = $.minicolors.defaults;

        // Do nothing if already initialized
        if (input.data('minicolors-initialized')){
        	updateFromInput(input, settings.color);  
        	return;
        } 

        // Handle settings
        settings = $.extend(true, {}, defaults, settings);

        // The wrapper
        minicolors
            .addClass('minicolors-theme-' + settings.theme)
            .toggleClass('minicolors-with-opacity', settings.opacity)
            .toggleClass('minicolors-no-data-uris', settings.dataUris !== true);

        // Custom positioning
        if (settings.position !== undefined) {
            $.each(settings.position.split(' '), function() {
                minicolors.addClass('minicolors-position-' + this);
            });
        }

        // The input
        input
            .addClass('minicolors-input')
            .data('minicolors-initialized', false)
            .data('minicolors-settings', settings)
            .prop('size', 7)
            .wrap(minicolors)
            .after(
                '<div class="minicolors-panel minicolors-slider-' + settings.control + '">' +
                '<div class="minicolors-grid minicolors-sprite">' +
                '<div class="minicolors-grid-inner"></div>' +
                '<div class="minicolors-picker"></div>' +
                '<div class="magnifiercolor"></div>' +
                '</div>' +
                '</div>'
            );

        //pass hex value  get from device
        updateFromInput(input, settings.color);

        setPrefixColors(input);
        input.data('minicolors-initialized', true);

    }

    function setPrefixColors(input) {
        var $colorBox = $('.prefixColors .colorBox');

        if (!('ontouchstart' in window)) {
            $colorBox.on('click', function(e) {
                var prefix = $(this).data('color');
                selectedColor = prefix;
                updateFromInput(input, prefix);

                e.preventDefault();
                e.stopPropagation();
            });
        }


        $colorBox.on('touchstart', function(e) {
            $(this).addClass("highlighted");
            e.preventDefault();
            e.stopPropagation();
        });

        $colorBox.on('touchend', function(e) {
            $colorBox.removeClass("highlighted");
            var prefix = $(this).data('color');
            selectedColor = prefix;
            $(".colorDisplay").attr('data-selectedcolor', selectedColor);
            $(".colorDisplay").css("background-color", selectedColor);
            updateFromInput(input, prefix);
            device_list_bridge.setColorToBulb();
            e.preventDefault();
            e.stopPropagation();
        });

    }

    // Moves the selected picker
    function move(target, event, animate, tapOnly) {

        var input = target.parents('.minicolors').find('.minicolors-input'),
            settings = input.data('minicolors-settings'),
            picker = target.find('[class$=-picker]'),
            offsetX = target.offset().left,
            offsetY = target.offset().top,
            x = Math.round(event.pageX - offsetX),
            y = Math.round(event.pageY - offsetY),
            duration = animate ? settings.animationSpeed : 0,
            hideMagnifier = tapOnly ? tapOnly : false,
            wx, wy, r, phi;
        var magnifier = target.find('.magnifiercolor');
        // Touch support
        if (event.originalEvent.changedTouches) {
            var touchx = event.originalEvent.changedTouches[0].pageX,
                touchy = event.originalEvent.changedTouches[0].pageY,
                touchmovex = Math.abs(statex - touchx),
                touchmovey = Math.abs(statey - touchy);
            x = touchx - offsetX;
            y = touchy - offsetY;

        } else {
            var touchmovex = 11,
                touchmovey = 11;
        }

        // Constrain picker to its container
        if (x < 0) x = 0;
        if (y < 0) y = 0;
        if (x > target.width()) x = target.width();
        if (y > target.height()) y = target.height();


        var roundArea = target.width() / 2;

        // Constrain color wheel values to the wheel
        if (target.parent().is('.minicolors-slider-wheel') && picker.parent().is('.minicolors-grid')) {
            wx = roundArea - x;
            wy = roundArea - y;
            r = Math.sqrt(wx * wx + wy * wy);
            phi = Math.atan2(wy, wx);
            if (phi < 0) phi += Math.PI * 2;
            if (r > roundArea) {
                r = roundArea;
                x = roundArea - (roundArea * Math.cos(phi));
                y = roundArea - (roundArea * Math.sin(phi));
            }
            x = Math.round(x);
            y = Math.round(y);
        }

        // Move the picker
        if (target.is('.minicolors-grid')) {

            picker
                .stop(true)
                .animate({
                    top: y + 'px',
                    left: x + 'px'
                }, duration, settings.animationEasing, function() {
                    updateFromControl(input, target);
                });


            if (!hideMagnifier && (touchmovex > 10 || touchmovey > 10)) {
                magnifier
                    .addClass('show')
                    .css({
                        top: y + 'px',
                        left: x + 'px'
                    });

            } else {
                magnifier
                    .removeClass('stopBounce')
                    .css({
                        top: y + 'px',
                        left: x + 'px'
                    });
            }
        }


    }

    // Sets the input based on the color picker values
    function updateFromControl(input, target) {

        function getCoords(picker, container) {

            var left, top;
            if (!picker.length || !container) return null;
            left = picker.offset().left;
            top = picker.offset().top;

            return {
                x: left - container.offset().left + (picker.outerWidth() / 2),
                y: top - container.offset().top + (picker.outerHeight() / 2)
            };

        }

        var hue, saturation, brightness, x, y, r, phi,

            hex = input.val(),
            opacity = input.attr('data-opacity'),

            // Helpful references
            minicolors = input.parent(),
            settings = input.data('minicolors-settings'),
            swatch = minicolors.find('.minicolors-swatch'),

            // Panel objects
            grid = minicolors.find('.minicolors-grid'),
            slider = minicolors.find('.minicolors-slider'),
            opacitySlider = minicolors.find('.minicolors-opacity-slider'),

            // Picker objects
            gridPicker = grid.find('[class$=-picker]'),
            opacityPicker = opacitySlider.find('[class$=-picker]'),
            magnifier = $('.magnifiercolor'),
            // Picker positions
            gridPos = getCoords(gridPicker, grid),
            opacityPos = getCoords(opacityPicker, opacitySlider);

        // Handle colors
        if (target.is('.minicolors-grid, .minicolors-slider')) {

            // Determine HSB values
            switch (settings.control) {

                case 'wheel':
                    // Calculate hue, saturation, and brightness
                    x = (grid.width() / 2) - gridPos.x;
                    y = (grid.height() / 2) - gridPos.y;
                    r = Math.sqrt(x * x + y * y);
                    phi = Math.atan2(y, x);
                    if (phi < 0) phi += Math.PI * 2;
                    if (r > 125) {
                        r = 125;
                        gridPos.x = 100 - (125 * Math.cos(phi));
                        gridPos.y = 100 - (125 * Math.sin(phi));
                    }
                    saturation = keepWithin(r / 0.75, 0, 100);
                    hue = keepWithin(phi * 180 / Math.PI, 0, 360);
                    //                    brightness = keepWithin(100 - Math.floor(sliderPos.y * (100 / slider.height())), 0, 100);
                    brightness = 100;
                    hex = hsb2hex({
                        h: hue,
                        s: saturation,
                        b: brightness
                    });

                    // Update UI
                    magnifier.css('background-color', hex);
                    selectedColor = hex;

            }

        }

        // Handle opacity
        if (target.is('.minicolors-opacity-slider')) {
            if (settings.opacity) {
                opacity = parseFloat(1 - (opacityPos.y / opacitySlider.height())).toFixed(2);
            } else {
                opacity = 1;
            }
            if (settings.opacity) input.attr('data-opacity', opacity);
        }

        // Set swatch color
        swatch.find('SPAN').css({
            backgroundColor: hex,
            opacity: opacity
        });

        // Handle change event
        doChange(input, hex, opacity);

    }

    // Sets the color picker values from the input color
    function updateFromInput(input, color) {

        var hex,
            hsb,
            //            opacity,
            x, y, r, phi,

            // Helpful references
            minicolors = input.parent(),
            settings = input.data('minicolors-settings'),

            // Panel objects
            grid = minicolors.find('.minicolors-grid'),
            slider = minicolors.find('.minicolors-slider'),

            // Picker objects
            gridPicker = grid.find('[class$=-picker]'),
            magnifier = $('.magnifiercolor'),

            // Determine hex/HSB values
            hex = convertCase(parseHex(color, true), settings.letterCase);
        if (!hex) {
            hex = convertCase(parseHex(settings.defaultValue, true), settings.letterCase);
        }
        hsb = hex2hsb(hex);

        // Determine picker locations
        switch (settings.control) {

            case 'wheel':
                // Set grid position
                r = keepWithin(Math.ceil(hsb.s * 0.75), 0, grid.height() / 2);
                phi = hsb.h * Math.PI / 180;
                x = keepWithin(125 - Math.cos(phi) * r, 0, grid.width());
                y = keepWithin(125 - Math.sin(phi) * r, 0, grid.height());
                gridPicker.css({
                    top: y + 'px',
                    left: x + 'px'
                });

                magnifier.css({
                    top: y + 'px',
                    left: x + 'px',
                    backgroundColor: color
                });

                $(".colorDisplay").css('backgroundColor', color);
                $(".colorDisplay").attr('data-selectedcolor', color);
               break;

            default:
                // Set grid position
                x = keepWithin(Math.ceil(hsb.s / (100 / grid.width())), 0, grid.width());
                y = keepWithin(grid.height() - Math.ceil(hsb.b / (100 / grid.height())), 0, grid.height());
                gridPicker.css({
                    top: y + 'px',
                    left: x + 'px'
                });

                // Update panel color
                grid.css('backgroundColor', hsb2hex({
                    h: hsb.h,
                    s: 100,
                    b: 100
                }));
                break;

        }

        //        // Fire change event, but only if minicolors is fully initialized
        //        if( input.data('minicolors-initialized') ) {
        //            doChange(input, hex, opacity);
        //        }

    }

    // Runs the change and changeDelay callbacks
    function doChange(input, hex, opacity) {

        var settings = input.data('minicolors-settings'),
            lastChange = input.data('minicolors-lastChange');

        // Only run if it actually changed
        if (!lastChange || lastChange.hex !== hex || lastChange.opacity !== opacity) {

            // Remember last-changed value
            input.data('minicolors-lastChange', {
                hex: hex,
                opacity: opacity
            });

            // Fire change event
            if (settings.change) {
                if (settings.changeDelay) {
                    // Call after a delay
                    clearTimeout(input.data('minicolors-changeTimeout'));
                    input.data('minicolors-changeTimeout', setTimeout(function() {
                        settings.change.call(input.get(0), hex, opacity);
                    }, settings.changeDelay));
                } else {
                    // Call immediately
                    settings.change.call(input.get(0), hex, opacity);
                }
            }
            input.trigger('change').trigger('input');
        }

    }

    // Generates an RGB(A) object based on the input's value
    function rgbObject(input) {
        var hex = parseHex($(input).val(), true),
            rgb = hex2rgb(hex),
            opacity = $(input).attr('data-opacity');
        if (!rgb) return null;
        if (opacity !== undefined) $.extend(rgb, {
            a: parseFloat(opacity)
        });
        return rgb;
    }

    // Genearates an RGB(A) string based on the input's value
    function rgbString(input, alpha) {
        var hex = parseHex($(input).val(), true),
            rgb = hex2rgb(hex),
            opacity = $(input).attr('data-opacity');
        if (!rgb) return null;
        if (opacity === undefined) opacity = 1;
        if (alpha) {
            return 'rgba(' + rgb.r + ', ' + rgb.g + ', ' + rgb.b + ', ' + parseFloat(opacity) + ')';
        } else {
            return 'rgb(' + rgb.r + ', ' + rgb.g + ', ' + rgb.b + ')';
        }
    }

    // Converts to the letter case specified in settings
    function convertCase(string, letterCase) {
        return letterCase === 'uppercase' ? string.toUpperCase() : string.toLowerCase();
    }

    // Parses a string and returns a valid hex string when possible
    function parseHex(string, expand) {
        string = string.replace(/[^A-F0-9]/ig, '');
        if (string.length !== 3 && string.length !== 6) return '';
        if (string.length === 3 && expand) {
            string = string[0] + string[0] + string[1] + string[1] + string[2] + string[2];
        }
        return '#' + string;
    }

    // Keeps value within min and max
    function keepWithin(value, min, max) {
        if (value < min) value = min;
        if (value > max) value = max;
        return value;
    }

    // Converts an HSB object to an RGB object
    function hsb2rgb(hsb) {
        var rgb = {};
        var h = Math.round(hsb.h);
        var s = Math.round(hsb.s * 255 / 100);
        var v = Math.round(hsb.b * 255 / 100);
        if (s === 0) {
            rgb.r = rgb.g = rgb.b = v;
        } else {
            var t1 = v;
            var t2 = (255 - s) * v / 255;
            var t3 = (t1 - t2) * (h % 60) / 60;
            if (h === 360) h = 0;
            if (h < 60) {
                rgb.r = t1;
                rgb.b = t2;
                rgb.g = t2 + t3;
            } else if (h < 120) {
                rgb.g = t1;
                rgb.b = t2;
                rgb.r = t1 - t3;
            } else if (h < 180) {
                rgb.g = t1;
                rgb.r = t2;
                rgb.b = t2 + t3;
            } else if (h < 240) {
                rgb.b = t1;
                rgb.r = t2;
                rgb.g = t1 - t3;
            } else if (h < 300) {
                rgb.b = t1;
                rgb.g = t2;
                rgb.r = t2 + t3;
            } else if (h < 360) {
                rgb.r = t1;
                rgb.g = t2;
                rgb.b = t1 - t3;
            } else {
                rgb.r = 0;
                rgb.g = 0;
                rgb.b = 0;
            }
        }
        return {
            r: Math.round(rgb.r),
            g: Math.round(rgb.g),
            b: Math.round(rgb.b)
        };
    }

    // Converts an RGB object to a hex string
    function rgb2hex(rgb) {
        var hex = [
            rgb.r.toString(16),
            rgb.g.toString(16),
            rgb.b.toString(16)
        ];
        $.each(hex, function(nr, val) {
            if (val.length === 1) hex[nr] = '0' + val;
        });
        return '#' + hex.join('');
    }

    // Converts an HSB object to a hex string
    function hsb2hex(hsb) {
        return rgb2hex(hsb2rgb(hsb));
    }

    // Converts a hex string to an HSB object
    function hex2hsb(hex) {
        var hsb = rgb2hsb(hex2rgb(hex));
        if (hsb.s === 0) hsb.h = 360;
        return hsb;
    }

    // Converts an RGB object to an HSB object
    function rgb2hsb(rgb) {
        var hsb = {
            h: 0,
            s: 0,
            b: 0
        };
        var min = Math.min(rgb.r, rgb.g, rgb.b);
        var max = Math.max(rgb.r, rgb.g, rgb.b);
        var delta = max - min;
        hsb.b = max;
        hsb.s = max !== 0 ? 255 * delta / max : 0;
        if (hsb.s !== 0) {
            if (rgb.r === max) {
                hsb.h = (rgb.g - rgb.b) / delta;
            } else if (rgb.g === max) {
                hsb.h = 2 + (rgb.b - rgb.r) / delta;
            } else {
                hsb.h = 4 + (rgb.r - rgb.g) / delta;
            }
        } else {
            hsb.h = -1;
        }
        hsb.h *= 60;
        if (hsb.h < 0) {
            hsb.h += 360;
        }
        hsb.s *= 100 / 255;
        hsb.b *= 100 / 255;
        return hsb;
    }

    // Converts a hex string to an RGB object
    function hex2rgb(hex) {
        hex = parseInt(((hex.indexOf('#') > -1) ? hex.substring(1) : hex), 16);
        return {
            /* jshint ignore:start */
            r: hex >> 16,
            g: (hex & 0x00FF00) >> 8,
            b: (hex & 0x0000FF)
                /* jshint ignore:end */
        };
    }

    var statex, statey, selectedColor;
    // Handle events
    $(document)
        // Start moving
        .on('mousedown.minicolors touchstart.minicolors', '.minicolors-grid, .minicolors-slider, .minicolors-opacity-slider', function(event) {
            var target = $(this);
            event.preventDefault();
            $(document).data('minicolors-target', target);
            if (event.originalEvent.changedTouches) {
                statex = event.originalEvent.changedTouches[0].clientX;
                statey = event.originalEvent.changedTouches[0].clientY;
            }
            move(target, event, true, true);
        })
        // Move pickers
        .on('mousemove.minicolors touchmove.minicolors', '.minicolors', function(event) {
            var target = $(document).data('minicolors-target');
            if (target) move(target, event);
        })
        // Stop moving
        .on('mouseup.minicolors touchend.minicolors', '.minicolors', function() {
            var target = $(document).data('minicolors-target');
            $(this).removeData('minicolors-target');
            $(".magnifiercolor").removeClass("show");
            clearTimeout(stopBounceTimeout);
            var stopBounceTimeout = setTimeout(function() {
                $(".magnifiercolor").addClass("stopBounce");
                $(".colorDisplay").css("background-color", selectedColor);
                $(".colorDisplay").attr('data-selectedcolor', selectedColor);
                device_list_bridge.setColorToBulb();
            }, 300);
            
        });

})(jQuery);
