/*
 picker.widget.js

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
            var overlay = document.createElement("div");
            overlay.setAttribute("id", "picker_overlay");
            overlay.setAttribute("class", "picker_overlay");
            document.body.children[0].appendChild(overlay);

            $('#picker_overlay').on('tap', function (e) {
                    e.preventDefault();
                }
            ).on('click', function (e) {
                    e.preventDefault();
                }
            );

            this.each(function () {
                $(this).show();
            });
        },
        hide: function () {
        	if(document.getElementById("picker_overlay")!=null)
        		document.body.children[0].removeChild(document.getElementById("picker_overlay"));
            this.each(function () {
                $(this).hide();
            });
        },

        applyStyles: function (me, id) {
            var screenWidth = $(window).width();
            var screenHeight = $(window).height();

            var vmin = screenWidth;
            if (vmin > screenHeight) {
                vmin = screenHeight;
            }

            var options = me.data("options");

            if (options.type == "time" || options.type == "offset") {
                var staticTop = 0.2 * vmin + $('.picker_widget_spinner_wrapper > hr').height() + parseInt($('.picker_widget_spinner_wrapper > hr').css('margin-top')) + parseInt($('.picker_widget_spinner_wrapper > hr').css('margin-bottom'));
                $(".picker_widget_spinner_wrapper").css("width", "24%");
                $(".picker_content_time_period").css("width", "2%").css("height", Math.round(0.1 * vmin)).css('margin-top', staticTop).css("font-size", Math.round(0.08 * vmin));
				$(".picker_widget_spinner_wrapper").css("left","37%");
                if (id.substring(id.length - 2) == '-a') {
                    if (options.type == "time" && options.TF24) {
                         $('#' + id + '-content').css("margin-left","23%");
                    }
                    else $('#' + id + '-content').css("margin-left","10%");
                }
			}
            else if (options.type == "period") {
                var staticTop = 0.2 * vmin + $('.picker_widget_spinner_wrapper > hr').height() + parseInt($('.picker_widget_spinner_wrapper > hr').css('margin-top')) + parseInt($('.picker_widget_spinner_wrapper > hr').css('margin-bottom'));
                $(".picker_content_time_inline").css("width", "25%");
                $(".picker_content_time_static").css("width", "25%").css("height", Math.round(0.1 * vmin)).css('margin-top', staticTop).css("font-size", Math.round(0.08 * vmin));
				$('.picker_widget_spinner_wrapper > hr').css("width", "55%");
			}
            else if (options.type == "coster") {
                var staticTop = 0.2 * vmin + $('.picker_widget_spinner_wrapper > hr').height() + parseInt($('.picker_widget_spinner_wrapper > hr').css('margin-top')) + parseInt($('.picker_widget_spinner_wrapper > hr').css('margin-bottom'));
                $(".picker_widget_spinner_wrapper").css("width", "20%");
                $(".picker_content_period").css("width", "14%").css("height", Math.round(0.1 * vmin)).css('margin-top', staticTop).css("font-size", Math.round(0.08 * vmin));
            }
            else {
                $(".picker_widget_spinner_wrapper").css("width", Math.round(0.3 * vmin)).css("margin-left", -Math.round(0.15 * vmin));
            }

            $(".picker_widget_spinner_up").css("width", Math.round(0.1 * vmin)).css("height", Math.round(0.1 * vmin)).css("margin-left", -Math.round(0.05 * vmin));
            $(".picker_widget_spinner_down").css("width", Math.round(0.1 * vmin)).css("height", Math.round(0.1 * vmin)).css("margin-left", -Math.round(0.05 * vmin));

            $(".picker_widget_spinner_cur").css("width", Math.round(0.1 * vmin)).css("height", Math.round(0.1 * vmin)).css("margin-left", -Math.round(0.05 * vmin)).css("font-size", Math.round(0.08 * vmin));
            $(".picker_widget_spinner_prev").css("width", Math.round(0.1 * vmin)).css("height", Math.round(0.1 * vmin)).css("margin-left", -Math.round(0.05 * vmin)).css("font-size", Math.round(0.08 * vmin));
            $(".picker_widget_spinner_next").css("width", Math.round(0.1 * vmin)).css("height", Math.round(0.1 * vmin)).css("margin-left", -Math.round(0.05 * vmin)).css("font-size", Math.round(0.08 * vmin));
        },

        updateCurVal: function (me, id, val) {
            var options = me.data('options');

            if (options.type == 'coster') {                
                var cost = new methods.Cost(options.curval);
				
                if (id.substring(id.length - 2) == '-a') {
                    cost.digits[0] = val; //options.curval = options.curval.replaceAt(0, val.toString());
                }
                else if (id.substring(id.length - 2) == '-b') {
                    cost.digits[1] = val; //options.curval = options.curval.replaceAt(2, val.toString());
                }
                else if (id.substring(id.length - 2) == '-c') {
                    cost.digits[2] = val; //options.curval = options.curval.replaceAt(3, val.toString());
                }
                else if (id.substring(id.length - 2) == '-d') {
                    cost.digits[3] = val; //options.curval = options.curval.replaceAt(4, val.toString());
                }

                options.curval = cost.valueOfCost();
            }
            else if (options.type == "time") {
                var regexp;
                if (options.TF24) regexp = /(\d+):(\d+)/i;
                else regexp = /(\d+):(\d+) (.{2})/i;

                var timearr = regexp.exec(options.curval);
                if (timearr == 'undefined') {
                    switch (options.TF24) {
                        case true: options.curval = '00:00'; break;
                        case false: options.curval = '0:00 AM'; break;
                        default : options.curval = '0:00 AM'; break;
                    }
                }
                else {
                    if (id.substring(id.length - 2) == '-a') {
                        if (options.TF24) options.curval = val + ':' + timearr[2];
                        else options.curval = val + ':' + timearr[2] + ' ' + timearr[3];
                    }
                    else if (id.substring(id.length - 2) == '-b') {
                        if (options.TF24) options.curval = timearr[1] + ':' + val;
                        else options.curval = timearr[1] + ':' + val + ' ' + timearr[3];
                    }
                    else if (id.substring(id.length - 2) == '-c') {
                        options.curval = timearr[1] + ':' + timearr[2] + ' ' + val;
                    }
                }
            }
			else if (options.type == "offset") {				
				var regexp = /(\d+):(\d+) (.{6})/i;
				var timearr = regexp.exec(options.curval);
				
                if (timearr == 'undefined') {					
					options.curval = '0:05 after ';					
                }
                else {
                    if (id.substring(id.length - 2) == '-a') {
                        options.curval = val + ':' + timearr[2] + ' ' + timearr[3];
                    }
                    else if (id.substring(id.length - 2) == '-b') {
                        options.curval = timearr[1] + ':' + val + ' ' + timearr[3];
                    }
                    else if (id.substring(id.length - 2) == '-c') {
                        options.curval = timearr[1] + ':' + timearr[2] + ' ' + val;
                    }
                }
            }
            else if (options.type == "period") {
                var regexp = /(\d+):(\d+)/i;
                var timearr = regexp.exec(options.curval);
                if (timearr == 'undefined') {
                    options.curval = '0:00';
                }
                else {
                    if (id.substring(id.length - 2) == '-a') {
                        options.curval = val + ':' + timearr[2];
                    }
                    else if (id.substring(id.length - 2) == '-b') {
                        options.curval = timearr[1] + ':' + val;
                    }
                }
            }
            else {
                options.curval = val;
            }

            me.data("options", options);
        },

        drawSpinner: function (me, dataArray, id, callback) {
            var content = $("#" + id + "-content");
            var options = me.data('options');			
            var cur = 0;

            if (options.type == 'coster') {
                var cost = new methods.Cost(options.curval);
				
                if (id.substring(id.length - 2) == '-a') {
                    cur = cost.digits[0]; //options.curval[0];
                }
                else if (id.substring(id.length - 2) == '-b') {
                    cur = cost.digits[1]; //options.curval[2];
                }
                else if (id.substring(id.length - 2) == '-c') {
                    cur = cost.digits[2]; //options.curval[3];
                }
                else if (id.substring(id.length - 2) == '-d') {
                    cur = cost.digits[3]; //options.curval[4];
                }
            }
            else if (options.type == "time") {
                var regexp;
                if ( options.TF24 ) regexp = /(\d+):(\d+)/i;
                else regexp = /(\d+):(\d+) (.{2})/i;

                var timearr = regexp.exec(options.curval);
                if (timearr == 'undefined' || timearr == null) {
                    switch (options.TF24) {
                        case true: options.curval = '00:00'; break;
                        case false: options.curval = '0:00 AM'; break;
                        default : options.curval = '0:00 AM'; break;
                    }
                }
                else {
                    if (id.substring(id.length - 2) == '-a') {
                        cur = timearr[1];
                        if (cur.length == 2 && cur[0] == '0' && !options.TF24) {
                            cur = cur[1];
                        }
                    }
                    else if (id.substring(id.length - 2) == '-b') {
                        cur = timearr[2];
                    }
                    else if (id.substring(id.length - 2) == '-c') {
                        cur = timearr[3];
                    }
					console.log("*:"+timearr[1]+" **:"+timearr[2]+" ***:"+timearr[3]);
                }
            }
			else if (options.type == "offset") {				
				var regexp = /(\d+):(\d+) (.{6})/i;
				var timearr = regexp.exec(options.curval);				
				
                if (timearr == 'undefined') {					
					options.curval = '0:05 after ';					
                }
                else {
                    if (id.substring(id.length - 2) == '-a') {
                        cur = timearr[1];
                        if (cur.length == 2 && cur[0] == '0') {
                            cur = cur[1];
                        }
                    }
                    else if (id.substring(id.length - 2) == '-b') {
                        cur = timearr[2];
                    }
                    else if (id.substring(id.length - 2) == '-c') {
                        cur = timearr[3];
                    }
					console.log("*:"+timearr[1]+" **:"+timearr[2]+" ***:"+timearr[3]);
                }
            }
            else if (options.type == "period") {
                var regexp = /(\d+):(\d+)/i;
                var timearr = regexp.exec(options.curval);
				if (timearr == 'undefined') {
                    options.curval = '0:00';
                }
                else {
                    if (id.substring(id.length - 2) == '-a') {
                        cur = timearr[1];
                        if (cur.length == 2 && cur[0] == '0') {
                            cur = cur[1];
                        }
                    }
                    else if (id.substring(id.length - 2) == '-b') {
                        cur = timearr[2];
                    }
                }
            }
            else {
                cur = options.curval;
            }

            var curIndex = 0;

            for (var i in dataArray) {
                if (dataArray[i] == cur) {
                    curIndex = parseInt(i);
                    break;
                }
            }

            var prevIndex = curIndex - 1;
            var nextIndex = curIndex + 1;

            if (prevIndex < 0) {
				if ( ( (id.substring(id.length - 2) == '-c') || (id.substring(id.length - 2) == '-b') ) && ( (options.type == "time") || (options.type == "offset") ) ) {
					prev = '';
				} else {
					prev = dataArray[dataArray.length-1];
				}
            }
            else {
                prev = dataArray[prevIndex];
            }
	
            if (nextIndex >= dataArray.length) {
				if ( ( (id.substring(id.length - 2) == '-c') || (id.substring(id.length - 2) == '-b') ) && ( (options.type == "time") || (options.type == "offset") ) ) {
					next = '';
				} else {
					next = dataArray[0];
				}
            }
            else {
                next = dataArray[nextIndex];
            }
            var html = '<div class="picker_widget_spinner_wrapper">';
            html += '<div class="picker_widget_spinner_up" id="' + id + '-up-btn"></div>';
            html += '<div class="picker_widget_spinner_prev" id="' + id + '-prev">' + prev + '</div>';
            html += '<hr/>';
            html += '<div class="picker_widget_spinner_cur">' + cur + '</div>';
            html += '<hr/>';
            html += '<div class="picker_widget_spinner_next" id="' + id + '-next">' + next + '</div>';
            html += '<div class="picker_widget_spinner_down" id="' + id + '-down-btn"></div>';
            html += '</div>';

            content.html(html);

            methods.applyStyles(me, id);

            content.trigger("contentchange", [content]);
			$('#' + id + '-prev').on("tap", function (e) {
				if (curIndex == 0) { curIndex = dataArray.length;}
				curIndex--;
				methods.updateCurVal(me, id, dataArray[curIndex]);
				methods.drawSpinner(me, dataArray, id, callback);

				if ( (options.type == 'coster') && (id !==id.substring(0, id.length - 2) + "-d") ) {
					correctMinimumCostValue($(this).attr('id'));
				}
				if ( (options.type == 'period') && (id !==id.substring(0, id.length - 2) + "-b") ) {
					correctMinimumPeriodValue();
				}
				if ( (options.type == 'offset') && (id ==id.substring(0, id.length - 2) + "-a") ) {
					correctMaximumOffsetValue();
				}

				e.preventDefault();
			});

			$('#' + id + '-up-btn').on("tap", function (e) {
				if (curIndex == 0) { curIndex = dataArray.length;}
				curIndex--;
				methods.updateCurVal(me, id, dataArray[curIndex]);
				methods.drawSpinner(me, dataArray, id, callback);

				if ( (options.type == 'coster') && (id !==id.substring(0, id.length - 2) + "-d") ) {
					correctMinimumCostValue($(this).attr('id'));
				}
				if ( (options.type == 'period') && (id !==id.substring(0, id.length - 2) + "-b") ) {
					correctMinimumPeriodValue();
				}
				if ( (options.type == 'offset') && (id ==id.substring(0, id.length - 2) + "-a") ) {
					correctMaximumOffsetValue();
				}
				e.preventDefault();
			});

			$('#' + id + '-next').on("tap", function (e) {
				if (curIndex == (dataArray.length - 1)) { curIndex = -1;}
				curIndex++;
				methods.updateCurVal(me, id, dataArray[curIndex]);
				methods.drawSpinner(me, dataArray, id, callback);

				if ( (options.type == 'coster') && (id !==id.substring(0, id.length - 2) + "-d") ) {
					correctMinimumCostValue($(this).attr('id'));
				}
				if ( (options.type == 'period') && (id !==id.substring(0, id.length - 2) + "-b") ) {
					correctMinimumPeriodValue();
				}

				if ( (options.type == 'offset') && (id ==id.substring(0, id.length - 2) + "-a") ) {
					correctMaximumOffsetValue();
				}
				e.preventDefault();
			});

			$('#' + id + '-down-btn').on("tap", function (e) {
				if (curIndex == (dataArray.length - 1)) { curIndex = -1;}
				curIndex++;
				methods.updateCurVal(me, id, dataArray[curIndex]);
				methods.drawSpinner(me, dataArray, id, callback);

				if ( (options.type == 'coster') && (id !==id.substring(0, id.length - 2) + "-d") ) {
					correctMinimumCostValue($(this).attr('id'));
				}
				if ( (options.type == 'period') && (id !==id.substring(0, id.length - 2) + "-b") ) {
					correctMinimumPeriodValue();
				}
				if ( (options.type == 'offset') && (id ==id.substring(0, id.length - 2) + "-a") ) {
					correctMaximumOffsetValue();
				}
				e.preventDefault();
			});

            function correctMinimumCostValue(btn) {                                
				//var varr = options.curval[0] + options.curval[2] + options.curval[3];
                var cost = new methods.Cost(options.curval);
                var varr = "" + cost.digits[0] + cost.digits[1] + cost.digits[2];                
				var tmp_id = id.substring(0, id.length - 2) + "-d";
				if ( varr == "000" ) {		
					if (cost.digits[3] == "0") {
						methods.updateCurVal(me, tmp_id, "1");
					}
					methods.drawSpinner(me, dataArray.slice(1), tmp_id, callback);
				} else {
					methods.drawSpinner(me, dataArray, tmp_id, callback);
				}
            }			
			
			function correctMinimumPeriodValue() {
				var varr = options.curval[0];
				var mins = options.curval.substring(options.curval.indexOf(':') + 1);
				var tmp_id = id.substring(0, id.length - 2) + "-b";
				var dataArrayMinutes = generateDataArrayMinutes();
				
				if ( varr == "0" ) {		
					if ( mins == "00") {
						methods.updateCurVal(me, tmp_id, dataArrayMinutes[1]);
					}
					methods.drawSpinner(me, dataArrayMinutes.slice(1), tmp_id, callback);
				} else {
					methods.drawSpinner(me, dataArrayMinutes, tmp_id, callback);
				}
            }
			
			function correctMaximumOffsetValue() {
				var dataArrayMinutes = generateDataArrayMinutes();
                var tmp_id = id.substring(0, id.length - 2) + "-b";
                console.log("options.curval[0]  "+options.curval[0] );
                methods.drawSpinner(me, dataArrayMinutes, tmp_id, callback);
			}

            function generateDataArrayMinutes() {
                var dataArrayMinutes_ = [];
                for (i = 0; i < 60; i++) {
                    if (i < 10) {
                        dataArrayMinutes_[i] = '0' + i.toString();
                    }
                    else {
                        dataArrayMinutes_[i] = i.toString();
                    }
                }
                return dataArrayMinutes_;
            }
        },
        createPeriodSelector: function (callback) {
            var id = $(this).attr("id");
            var me = $(this);
            var options = me.data('options');
            var dataArrayHours = [];
            var dataArrayMinutes = [];			
			
			for (var i = 0; i <= 12; i++) {
				dataArrayHours[i] = i.toString();
			}
			
            for (i = 0; i < 60; i++) {
                if (i < 10) {
                    dataArrayMinutes[i] = '0' + i.toString();
                }
                else {
                    dataArrayMinutes[i] = i.toString();
                }
            }


            var content = $("#" + id + "-content");
            content.css("width", "100%");

            content.append('<div class="picker_content_time_inline" id="' + id + '-a-content"></div>');
            content.append('<div class="picker_content_time_inline picker_content_time_static" id="' + id + '-p-content">h&nbsp;</div>');
            content.append('<div class="picker_content_time_inline" id="' + id + '-b-content"></div>');
            content.append('<div class="picker_content_time_inline picker_content_time_static" id="' + id + '-p-content">m&nbsp;</div>');

            $('#' + id + '-set-btn').on("click", function (e) {
                var options = me.data("options");
                callback(options.curval);
                e.preventDefault();
            });

            methods.drawSpinner(me, dataArrayHours, id + '-a', callback);			
			var hour = options.curval[0];
			if ( hour == "0" ) {
				methods.drawSpinner(me, dataArrayMinutes.slice(1), id + '-b', callback);
			} else {
				methods.drawSpinner(me, dataArrayMinutes, id + '-b', callback);
			}
        },
        createTimeSelector: function (callback) {
            var id = $(this).attr("id");
            var me = $(this);
            var options = me.data('options');
            var dataArrayHours = [];
            var dataArrayMinutes = [];
            var dataArrayMeridiem = ['AM', 'PM'];

            if (options.TF24) {
                for (var i = 0; i <= 23; i++) {
                    if (i < 10) {
                        dataArrayHours[i] = '0' + i.toString();
                    }
                    else {
                        dataArrayHours[i] = i.toString();
                    }
                }
            } else {
                for (var i = 1; i <= 12; i++) {
                    dataArrayHours[i-1] = i.toString();
                }
            }

            for (i = 0; i < 60; i++) {
                if (i < 10) {
                    dataArrayMinutes[i] = '0' + i.toString();
                }
                else {
                    dataArrayMinutes[i] = i.toString();
                }
            }


            var content = $("#" + id + "-content");
            content.css("width", "100%");

            content.append('<div class="picker_content_time_inline" id="' + id + '-a-content"></div>');
            content.append('<div class="picker_content_time_inline picker_content_time_period" id="' + id + '-p-content">:</div>');
            content.append('<div class="picker_content_time_inline" id="' + id + '-b-content"></div>');
            /*content.append('<div class="picker_content_time_inline picker_content_time_period" id="' + id + '-p-content">&nbsp;</div>');*/
            if (!options.TF24) content.append('<div class="picker_content_time_inline" id="' + id + '-c-content"></div>');

            $('#' + id + '-set-btn').on("click", function (e) {
                var options = me.data("options");
                callback(options.curval);
                e.preventDefault();
            });

            methods.drawSpinner(me, dataArrayHours, id + '-a', callback);
            methods.drawSpinner(me, dataArrayMinutes, id + '-b', callback);
            if (!options.TF24) methods.drawSpinner(me, dataArrayMeridiem, id + '-c', callback);
        },
		
		createOffsetSelector: function (callback) {
            var id = $(this).attr("id");
            var me = $(this);
            var options = me.data('options');
            var dataArrayHours = [];
            var dataArrayMinutes = [];
			var dataArrayMeridiem = ['after ', 'before'];			
		
			for (var i = 0; i <= 3; i++) {
				dataArrayHours[i] = i.toString();
			}		

            for (i = 0; i < 60; i++) {
                if (i < 10) {
                    dataArrayMinutes[i] = '0' + i.toString();
                }
                else {
                    dataArrayMinutes[i] = i.toString();
                }
            }


            var content = $("#" + id + "-content");
            content.css("width", "100%");

            content.append('<div class="picker_content_time_inline" id="' + id + '-a-content"></div>');
            content.append('<div class="picker_content_time_inline picker_content_time_period" id="' + id + '-p-content">:</div>');
            content.append('<div class="picker_content_time_inline" id="' + id + '-b-content"></div>');            
            content.append('<div class="picker_content_time_inline" id="' + id + '-c-content"></div>');

            $('#' + id + '-set-btn').on("click", function (e) {
                var options = me.data("options");				
				callback(options.curval);				
                e.preventDefault();
            });

            methods.drawSpinner(me, dataArrayHours, id + '-a', callback);
            methods.drawSpinner(me, dataArrayMinutes, id + '-b', callback);
            methods.drawSpinner(me, dataArrayMeridiem, id + '-c', callback);
        },
		
        createCoster: function (callback) {
            var id = $(this).attr("id");
            var me = $(this);
            var options = me.data('options');
            var dataArray = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

            var content = $("#" + id + "-content");
            content.html("");
            content.css("width", "100%");

            var cost = new methods.Cost(options.curval);
            content.append('<div class="picker_content_inline" id="' + id + '-a-content"></div>');
            if (cost.indexOfPeriod == 1) {
                content.append('<div class="picker_content_inline picker_content_period" id="' + id + '-p-content">.</div>');
            }
            content.append('<div class="picker_content_inline" id="' + id + '-b-content"></div>');
            if (cost.indexOfPeriod == 2) {
                content.append('<div class="picker_content_inline picker_content_period" id="' + id + '-p-content">.</div>');
            }			
            content.append('<div class="picker_content_inline" id="' + id + '-c-content"></div>');
            if (cost.indexOfPeriod == 3) {
                content.append('<div class="picker_content_inline picker_content_period" id="' + id + '-p-content">.</div>');
            }			
            content.append('<div class="picker_content_inline" id="' + id + '-d-content"></div></div>');

            $('#' + id + '-set-btn').on("click", function (e) {
                var options = me.data("options");
                callback(options.curval);
                e.preventDefault();
            });

            
			methods.drawSpinner(me, dataArray, id + '-a', callback);
            methods.drawSpinner(me, dataArray, id + '-b', callback);
            methods.drawSpinner(me, dataArray, id + '-c', callback);
            //var firstThreeDigits = options.curval[0] + options.curval[2] +options.curval[3];
            var cost = new methods.Cost(options.curval);
            var firstThreeDigits = "" + cost.digits[0] + cost.digits[1] + cost.digits[2];           
			if ( firstThreeDigits == "000" ) {
				methods.drawSpinner(me, dataArray.slice(1), id + '-d', callback);
			} else {
				methods.drawSpinner(me, dataArray, id + '-d', callback);
			}
        },

        createSpinner: function (callback) {
            var id = $(this).attr("id");
            var me = $(this);

            var options = me.data("options");

            var dataArray = [];

            for (var i = options.minval, j = 0; i <= options.maxval; i++, j++) {
                dataArray[j] = i.toString();
            }

            var content = $("#" + id + "-content");
            content.css("width", "100%");

            $('#' + id + '-set-btn').on("click", function (e) {
                var options = me.data("options");
                callback(options.curval);
                e.preventDefault();
            });

            methods.drawSpinner(me, dataArray, id, callback);
        },

        isMinimumCostValue: function (me) {
            var options = me.data('options');
            if (( options.type == 'coster' ) && ( options.curval[0] == "0" ) && ( options.curval[2] == "0" ) && ( options.curval[3] ) == "0") {
                return true;
            } else {
                return false;
            }
        },
        
        Cost: function(value) {
            var CAPACITY = 4;

            // Parse value
            this.digits = value.split('');
            this.indexOfPeriod = this.digits.indexOf('.');

            if (this.indexOfPeriod > -1) {
                this.digits.splice(this.indexOfPeriod, 1); //Remove period
            }       

            if (this.digits.length > CAPACITY) {            
                this.digits = this.digits.slice(0, CAPACITY); //Truncate array
                if (this.indexOfPeriod > this.digits.length - 1) {
                    this.indexOfPeriod = -1; // Period was truncated
                }
            } else {              
                if (this.indexOfPeriod > -1) {
                    // Add ending zeroes                
                    while (this.digits.length < CAPACITY) {
                        this.digits.push(0);
                    }              
                }  
            }

            this.encodeCost = function() {          
                var digits = this.digits.slice(0); //Make a copy of Array
                for (var i=2; i <= this.indexOfPeriod; i++) {
                    digits.push('0');
                    // 0.111 => 0111
                    // 21.55 => 21550
                    // 120.00 => 120000
                }
                return digits.join('');
            }; 

            this.decodeValue = function(encodedValue) {                        
                var digits = ("" + encodedValue).split('');
                //push period (.) to digits array 
                digits.splice(digits.length - CAPACITY + 1, 0, '.');
                return digits.join('');            
            };

            this.valueOfCost = function() {
                var digits = this.digits.slice(0); //Make a copy of Array
                if (this.indexOfPeriod > -1) {
                    digits.splice(this.indexOfPeriod, 0, '.');  //Add period
                }    
                return digits.join('');
            };

            this.encoded = this.encodeCost();
            this.decoded = this.decodeValue(this.encoded);
            this.value = this.valueOfCost();      
        }          
    };

    $.fn.BelkinPicker = function (options, method, callback) {

        var options = $.extend({
            type: "spinner",
            curval: "1",
            /*currency: "$",*/
            minval: 1,
            maxval: 100
        }, options);
		
		if (options.type == "offset") {
			options.curval = "00:20 before";
		} 
        console.log("Picker got value: " + options.curval);

        if (!$(this).data('options')) {
            $(this).data('options', options);

            var screenWidth = $(window).width();
            var screenHeight = $(window).height();

            var vmin = screenWidth;
            if (vmin > screenHeight) {
                vmin = screenHeight;
            }


            this.each(function () {
                var id = $(this).attr("id");

                var box_width = screenWidth * 0.9;
                var box_height = screenHeight * 0.6;

                $(this).addClass("picker_widget_popup_box");

                $(".picker_widget_popup_box > h1").css("font-size", Math.round(0.06 * vmin));

                $(this).css("width", box_width);
                $(this).css("height", box_height);
                $(this).css("margin-left", -(box_width / 2) + "px");
                $(this).css("margin-top", -(box_height / 2) + "px");

                var header = $(this).children("h1").first().html();
                $(this).children("h1").first().html('<span style="padding-left: 15pt;">' + header + '</span>');

                var content = $(this).html();
                
                content += wemoUtil.templator.fixIn('<div class="picker_widget_content" id="[Id]-content"></div><div class="picker_widget_bottom_buttons"><div class="picker_widget_button" id="[Id]-cancel-btn" style="width: [Width]px; height: [Height]px; font-size: [FontSize]px;">[Cancel]</div><div class="picker_widget_button" id="[Id]-set-btn" style="width: [Width]px; height: [Height]px; font-size: [FontSize]px;">[Set]</div></div>', {
                    Id: id,
                    Width: box_width / 2 - 22,
                    Height: Math.round(0.08 * vmin),
                    FontSize: Math.round(0.06 * vmin),
                    Cancel: wemo.items['Cancel'],
                    Set: wemo.items['Set']
                });

                $(this).html(content);
                
                $('#' + id + '-cancel-btn').on("tap", function (e) {
                    $("#" + id).hide();					
					if (options.type == "offset") {
						callback("cancel_custom_offset");
					} else
                    if (options.type == "time" && options.TF24) {
                        callback("cancel_time_changes");
                    }
					if(document.getElementById("picker_overlay")!=null)
						document.body.children[0].removeChild(document.getElementById("picker_overlay"));
                    e.preventDefault();
                });
            });

            if (options.type == "spinner") {
                methods["createSpinner"].apply(this, Array.prototype.slice.call(arguments, 2));
            }

            if (options.type == "coster") {
                methods["createCoster"].apply(this, Array.prototype.slice.call(arguments, 2));
            }

            if (options.type == "time") {
                methods["createTimeSelector"].apply(this, Array.prototype.slice.call(arguments, 2));
            }		
			if (options.type == "offset") {
                methods["createOffsetSelector"].apply(this, Array.prototype.slice.call(arguments, 2));
            }

            if (options.type == "period") {
                methods["createPeriodSelector"].apply(this, Array.prototype.slice.call(arguments, 2));
            }
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
