/**
 * Farbtastic Color Picker 1.2
 * © 2008 Steven Wittens
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

jQuery.fn.farbtastic = function (callback) {
    $.farbtastic(this, callback);
    return this;
};

jQuery.farbtastic = function (container, callback) {
    var container = $(container).get(0);
    return (container.farbtastic = new jQuery._farbtastic(container, callback));
}

jQuery._farbtastic = function (container, callback) {
    // Store farbtastic object
    var fb = this;

    // Insert markup
    $(container).html('<div class="farbtastic"><div class="wheel"></div>' +
        '<div class="tempDisplay"></div><div class="marker"></div>' +
        '<div class="magnifier"></div>' +
        '</div>');
    var e = $('.farbtastic', container);
    fb.wheel = $('.wheel', container).get(0);
    // Dimensions
    fb.radius = 100;
    fb.width = 215;
    fb.touch = false;

    /**
     * Link to the given element(s) or callback.
     */
    fb.updateValue = function (callback) {
        $(""+ callback + " .tempBox").bind("click", function() {
            var prefixTemp = $(this).data('temp');
            fb.setTemperature(prefixTemp);

            var prefixColor = $(this).data('color');
            $('.tempColorDisplay, .magnifier').css('background-color', prefixColor);
            device_list_bridge.setTemperatureToBulb();
        });
    };

    /**
     * Retrieve the coordinates of the given event relative to the center
     * of the widget.
     */
    fb.widgetCoords = function (event) {
        var x, y;
        var el = event.target || event.srcElement;
        var reference = fb.wheel;

        if (typeof event.offsetX != 'undefined') {
            // Use offset coordinates and find common offsetParent
            var pos = { x: event.offsetX, y: event.offsetY };

            // Send the coordinates upwards through the offsetParent chain.
            var e = el;
            while (e) {
                e.mouseX = pos.x;
                e.mouseY = pos.y;
                pos.x += e.offsetLeft;
                pos.y += e.offsetTop;
                e = e.offsetParent;
            }

            // Look for the coordinates starting from the wheel widget.
            var e = reference;
            var offset = { x: 0, y: 0 };
            while (e) {
                if (typeof e.mouseX != 'undefined') {
                    x = e.mouseX - offset.x;
                    y = e.mouseY - offset.y;
                    break;
                }
                offset.x += e.offsetLeft;
                offset.y += e.offsetTop;
                e = e.offsetParent;
            }

            // Reset stored coordinates
            e = el;
            while (e) {
                e.mouseX = undefined;
                e.mouseY = undefined;
                e = e.offsetParent;
            }
        }
        else {
            // Use absolute coordinates
            var pos = fb.absolutePosition(reference);
            x = (event.pageX || 0*(event.clientX + $('html').get(0).scrollLeft)) - pos.x;
            y = (event.pageY || 0*(event.clientY + $('html').get(0).scrollTop)) - pos.y;
        }
        // Subtract distance to middle
        return { x: x - fb.width / 2, y: y - fb.width / 2 };
    }

    /**
     * Mousedown handler
     */
    fb.mousedown = function (event) {
        // Check which area is being dragged
        fb.circleDrag = true;

        // Process
        fb.mousemove(event);
        return false;
    }

    /**
     * TouchConvert: Converts touch co-ordinates to mouse co-ordinates
     */
    fb.touchconvert = function (e) {
        var e = e.originalEvent.touches.item(0);
        fb.touch = true;
        return e;
    }

    /**
     * Touchmove handler for iPad, iPhone etc
     */
    fb.touchmove = function (e) {
        fb.tap = false;
        fb.mousemove(fb.touchconvert(e));
        event.preventDefault();
        return false;
    }

    /**
     * Touchend handler for iPad, iPhone etc
     */
    fb.touchend = function (event) {
        $(document).unbind('touchmove', fb.touchmove);
        $(document).unbind('touchend', fb.touchend);
        $('.farbtastic .magnifier').removeClass('show');
        $('.tempColorDisplay').css('background-color', fb.hex);
        device_list_bridge.setTemperatureToBulb();
        stopBounceTimeout = setTimeout(function(){
            $(".farbtastic .magnifier").addClass("stopBounce");
        }, 300);
        document.dragging = false;

        event.preventDefault();
        return false;
    }


    /**
     * Mousemove handler
     */
    fb.mousemove = function (event) {
        // Get coordinates relative to color picker center
        var pos = fb.widgetCoords(event);
        //Change magnifier position
        fb.updateDisplay(event);

        //Calculate moved angle
        var angle = Math.atan2(pos.x, -pos.y)/3.14;

        var magnifier = $('.farbtastic .magnifier');

        if( fb.touch) {
            fb.currentx = event.clientX;
            fb.currenty = event.clientY;
            fb.movex =  Math.abs(fb.currentx- fb.startx);
            fb.movey =  Math.abs(fb.currenty- fb.starty);
        } else {
            fb.movex = 11;
            fb.movey = 11;
        }

        if ((fb.movex > 10 || fb.movey > 10)) {
            magnifier.addClass('show');
        }
        magnifier.removeClass('stopBounce');

        var tempNum = fb.tempCalculation(angle);

        fb.unpackTemperature(tempNum);

        return false;
    };


    fb.tempCalculation = function (angle) {
        var temperature;
        if (Math.abs(angle) > 0.5) {
            if (angle < 0 ) {
                angle = Math.abs(angle) - 0.5;
            } else {
                angle = 1.5 - Math.abs(angle);
            }
        } else {
            angle += 0.5;
        }

        if (angle == 0.5) {
            temperature = 4000;
        } else if (angle == 0) {
            temperature = 2700;
        } else if (angle > 0.994 ) {
            temperature = 6500;
        } else if (angle < 0.5) {
            temperature = Math.floor(2700 + ((angle * 2.0) * 1300));
        } else {
            temperature = Math.floor(4000 + (((angle - 0.5) * 2.0) * 2500));
        }

        var tempNum = fb.tempNormalize(temperature);

        $('.tempDisplay').text(tempNum + ' K');
        $('#picker').attr('data-selectedTemperature', tempNum);
        $('#pickerTTB').attr('data-selectedTemperature', tempNum);

        return tempNum;
    };

    fb.tempNormalize = function(temp) {
        var times =  ~~(temp / 50);
        var tempnew = times * 50;
        return tempnew;
    };

    /**
     * Mouseup handler
     */
    var stopBounceTimeout;
    fb.mouseup = function () {
        // Uncapture mouse
        $(document).unbind('mousemove', fb.mousemove);
        $(document).unbind('mouseup', fb.mouseup);
        $('.farbtastic .magnifier').removeClass('show');
        $('.tempColorDisplay').css('background-color', fb.hex);        
        stopBounceTimeout = setTimeout(function(){
            $(".farbtastic .magnifier").addClass("stopBounce");
        }, 300);
        document.dragging = false;
    };

    /**
     * Update the markers and styles
     */
    fb.updateDisplay = function (event) {
        // Markers
        if (event) {
            var pos = fb.widgetCoords(event);
            var angle = Math.atan2(pos.x, -pos.y);
            if (angle < 6.28) angle += 6.28;
        } else {
            var angle = 6.28*0.75;
        }

        $('.marker', e).css({
            left: Math.round(Math.sin(angle) * fb.radius + fb.width / 2) + 'px',
            top: Math.round(-Math.cos(angle) * fb.radius + fb.width / 2) + 'px'
        });

        var magnifier = $('.farbtastic .magnifier');

//        if (magnifier.hasClass('show') && ((angle > 5.2 && angle < 3.8) || (angle > 7.2 && angle < 8.5) )){
//            magnifier
//                .css({
//                    left: Math.round(Math.sin(angle) * fb.radius + fb.width / 2) + 'px',
//                    top: Math.round(-Math.cos(angle) * fb.radius + fb.width / 2 - 15) + 'px'
//                });
//        } else {
            magnifier
                .css({
                    left: Math.round(Math.sin(angle) * fb.radius + fb.width / 2) + 'px',
                    top: Math.round(-Math.cos(angle) * fb.radius + fb.width / 2) + 'px'
                });

//        }

        $(".tempColorDisplay, .magnifier").css("background-color", fb.color);
    };

    /**
     * Get absolute position of element
     */
    fb.absolutePosition = function (el) {
        var r = { x: el.offsetLeft, y: el.offsetTop };
        // Resolve relative to offsetParent
        if (el.offsetParent) {
            var tmp = fb.absolutePosition(el.offsetParent);
            r.x += tmp.x;
            r.y += tmp.y;
        }
        return r;
    };

    // Install mousedown handler (the others are set on the document on-demand)
    $('*', e).mousedown(function(e){
        // Capture mouse
        if (!document.dragging) {
            fb.tap = true;
            clearTimeout(stopBounceTimeout);
            $(document).bind('mousemove', fb.mousemove).bind('mouseup', fb.mouseup);
            document.dragging = true;
        }
        fb.mousedown(e);
    });

    // TouchStart bound, calls conversion of touchpoints to mousepoints
    $('*', e).bind("touchstart", function (e) {
        // Capture mouse
        if (!document.dragging) {
            fb.tap = true;
            clearTimeout(stopBounceTimeout);
            $(document).bind('touchmove', fb.touchmove).bind('touchend', fb.touchend);
            document.dragging = true;
        }

        if( e.originalEvent.changedTouches) {
            fb.startx = e.originalEvent.changedTouches[0].clientX;
            fb.starty = e.originalEvent.changedTouches[0].clientY;
        }

        fb.mousedown( fb.touchconvert(e) );
        e.preventDefault();
        return false;
    });

    /**
     * Converting Kelvin Temperature value to RGB number
     */
    fb.unpackTemperature = function(tempNum) {
        var rgb = {};
        if (tempNum <= 2850) {
            rgb.r = 255;
            rgb.g = 181;
            rgb.b = 0;
        } else if (tempNum >= 6250) {
            rgb.r = 117;
            rgb.g = 142;
            rgb.b = 255;
        } else if (tempNum == 4000) {
            rgb.r = 255;
            rgb.g = 255;
            rgb.b = 255;
        } else {
            rgb.r = 255;
            rgb.g = 255;
            rgb.b = 255;

            // Convert value for red pixel color
            if (tempNum <= 4050) {
                rgb.r= 255;
            } else if (tempNum == 4600) {
                rgb.r = 231;
            } else if (tempNum == 5000) {
                rgb.r = 199;
            } else {
                var kvBase,
                    kvVal,
                    kvPercent,
                    redUpperLimit,
                    redLowerLimit;
                if (tempNum > 4050 && tempNum < 4600) {
                    kvBase = 4600 - 4050;
                    kvVal = tempNum - 4050;
                    kvPercent = Math.abs((kvVal / kvBase) - 1.0); // Inverted percentage
                    redUpperLimit = 255;
                    redLowerLimit = 231;
                } else if (tempNum > 4600 && tempNum < 5000) {
                    kvBase = (5000 - 4600);
                    kvVal = (tempNum - 4600);
                    kvPercent = Math.abs((kvVal / kvBase) - 1.0); // Inverted percentage
                    redUpperLimit = 231;
                    redLowerLimit = 199;
                } else if (tempNum > 5000 && tempNum < 6250) {
                    kvBase = (6250 - 5000);
                    kvVal = (tempNum - 5000);
                    kvPercent = Math.abs((kvVal / kvBase) - 1.0); // Inverted percentage
                    redUpperLimit = 199;
                    redLowerLimit = 117;
                }

                rgb.r = Math.round((kvPercent * (redUpperLimit - redLowerLimit)) + redLowerLimit);
            }

            // Convert value for green pixel color
            if (tempNum >= 3650 && tempNum <= 4550) {
                rgb.g = 255;
            } else if (tempNum == 5050) {
                rgb.g = 230;
            } else {
                var kvBase,
                    kvVal,
                    kvPercent,
                    greenUpperLimit,
                    greenLowerLimit;
                if (tempNum >= 2900 && tempNum < 3650) {
                    kvBase = (3600 - 2900);
                    kvVal = (tempNum - 2900);
                    kvPercent = (kvVal / kvBase);
                    greenUpperLimit = 255;
                    greenLowerLimit = 181;
                } else if (tempNum > 4550 && tempNum < 5050) {
                    kvBase = (5100 - 4550);
                    kvVal = (tempNum - 4550);
                    kvPercent = Math.abs((kvVal / kvBase) - 1.0); // Inverted percentage
                    greenUpperLimit = 255;
                    greenLowerLimit = 230;
                } else if (tempNum > 5050 && tempNum < 6250) {
                    kvBase = (6200 - 5050);
                    kvVal = (tempNum - 5050);
                    kvPercent = Math.abs((kvVal / kvBase) - 1.0); // Inverted percentage
                    greenUpperLimit = 230;
                    greenLowerLimit = 142;
                }
                rgb.g = Math.round((kvPercent * (greenUpperLimit - greenLowerLimit)) + greenLowerLimit);
            }

            // Convert value for blue pixel color
            if (tempNum > 4000) {
                rgb.b = 255;
            } else if (tempNum == 2900) {
                rgb.b  = 2;
            } else if (tempNum == 2950) {
                rgb.b  = 11;
            } else if (tempNum == 3600) {
                rgb.b  = 142;
            } else if (tempNum == 3800) {
                rgb.b  = 229;
            } else if (tempNum == 3850) {
                rgb.b  = 235;
            } else if (tempNum == 3900) {
                rgb.b  = 240;
            } else if (tempNum == 3950) {
                rgb.b  = 245;
            } else {
                var kvBase,
                    kvVal,
                    kvPercent,
                    blueUpperLimit,
                    blueLowerLimit;
                if (tempNum > 2950 && tempNum < 3600) {
                    kvBase = (3550 - 2950);
                    kvVal = tempNum - 2950;
                    kvPercent = kvVal / kvBase;
                    blueUpperLimit = 142;
                    blueLowerLimit = 11;
                } else if (tempNum > 3600 && tempNum < 3800) {
                    kvBase = (3750 - 3600);
                    kvVal = tempNum - 3600;
                    kvPercent = kvVal / kvBase;
                    blueUpperLimit = 229;
                    blueLowerLimit = 142;
                }
                rgb.b = Math.round((kvPercent * (blueUpperLimit - blueLowerLimit)) + blueLowerLimit);
            }

        }
        fb.hex = fb.rgb2hex(rgb);
        $(".farbtastic .magnifier").css('background-color', fb.hex);

        return fb.hex;
    };


    /**
     * Converting RGB value to hex value
     */
     fb.rgb2hex = function(rgb) {
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

    /**
     * Calculate picker angle from Kelvin Temperature value
     */

    fb.getAngle = function(temp) {
        var angle;
        if (temp == 4000){
            angle = 0;
        } else if (temp == 6500) {
            angle = 0.5;
        } else if (temp == 2700) {
            angle = -0.5;
        } else if ((temp > 2700 ) && (temp < 4000 ) ) {
            angle = (temp - 2700)/2600 - 0.5;
        } else if ((temp > 4000 ) && (temp < 6500 ) ) {
            angle = ((temp - 4000)/5000);
        }

        return angle;
    }


    fb.setTemperature = function(temp) {
        var tempNum =  parseInt(temp, 10);
        var angle = fb.getAngle(tempNum) * 3.14;

        $('.farbtastic .magnifier').css({
            left: Math.round(Math.sin(angle) * fb.radius + fb.width / 2) + 'px',
            top: Math.round(-Math.cos(angle) * fb.radius + fb.width / 2) + 'px'
        });

        var tempColor = fb.unpackTemperature(tempNum);
        $('.tempColorDisplay').css('background-color', tempColor);
        $('.tempDisplay').text(tempNum + ' K');
        $('#picker').attr('data-selectedTemperature', tempNum);
        $('#pickerTTB').attr('data-selectedTemperature', tempNum);
    };

    /**
     * Set Kelvin Temperature value
     */
    if (callback.temperature) {
        fb.setTemperature(callback.temperature);
    }

    /**
     * Initiate prefix colors
     */
    if (callback.prefix) {
        fb.updateValue(callback.prefix);
    }


}