/*jslint eqeq: true, plusplus: true, undef: true, sloppy: true, vars: true, forin: true */
(function ($) {

    var ms = $.mobiscroll,
        defaults = {
            wheelOrder: 'hhiiss',
            useShortLabels: false,
            minTime: 0,
            maxTime: Infinity
        };

    ms.i18n.en = $.extend(ms.i18n.en, {
        labels: ['Years', 'Months', 'Days', 'Hours', 'Minutes', 'Seconds'], //, ''],
        labelsShort: ['Yrs', 'Mths', 'Days', 'Hrs', 'Mins', 'Secs'] //, '']
    });

    ms.presetShort('timespan');

    ms.presets.timespan = function (inst) {

        /**
         * Calculates the parts of the time differnce
         * @param   time    (Integer)   Time in milliseconds
         * @return          (Object)    Time splitted to the required parts (years, months, days, hours, minutes, seconds)
         */
        function getParts(time) {
            var ret = {};

            $(unique).each(function (i, v) {
                ret[v] = wheels[v] ? Math.floor(time / obj[v].limit) : 0;
                time -= ret[v] * obj[v].limit;
            });

            return ret;
        }

        /**
         * Generates a specific wheel
         * @param   v   (String)  Unique identifier
         */
        function genWheel(v, parts) {
            var leading = false,
                st = steps[wheels[v] - 1] || 1,
                o = obj[v],
                w = o.wheel,
                prefix = o.prefix;
            from = 0;
            until = o.until;
            if (v == max) {
                from = Math.max(minParts[v], parts[v] - 50 * st);
                until = Math.min(maxParts[v], from + 100 * st);
                first = from + 5 * st;
                last = until - 5 * st;
            }
            //w[0][o.label] = {};
            w.keys = [];
            w.values = [];
            w.label = o.label;

            if (ord.match(new RegExp(o.re + o.re, 'i'))) {
                leading = true;
            }

            for (i = from; i <= until; i += st) {
                w.keys.push(i);
                w.values.push((prefix || '') + (i < 10 && leading ? '0' : '') + i + '<span class="dwtlbl">' + o.label + '</span>');
                //w[0][o.label][i] = (prefix || '') + (i < 10 && leading ? '0' : '') + i + '<span class="dwtlbl">' + o.label + '</span>';
            }
        }

        function calcTime(arr) {
            var j = 0,
                time = 0;

            $.each(o, function (i, v) {
                if (!isNaN(+arr[j])) {
                    time += obj[v.v].limit * arr[i];
                }
            });

            return time;
        }

        function step(v, st) {
            return Math.floor(v / st) * st;
        }

        var i, j, time, timer, up, ctx, first, last, prevent, timeout, p, from, until, prevFrom, prevUntil,
            minParts,
            maxParts,
            that = $(this),
            orig = $.extend({}, inst.settings),
            s = $.extend(inst.settings, defaults, orig),
            ord = s.wheelOrder,
            lbls = s.useShortLabels ? s.labelsShort : s.labels,
            unique = ['years', 'months', 'days', 'hours', 'minutes', 'seconds'],//, 'fract'],
            obj = {
                'years': { index: 6, until: 10, limit: 1000 * 60 * 60 * 24 * 365, label: lbls[0], re: 'y', wheel: {} },
                'months': { index: 5, until: 11, limit: 1000 * 60 * 60 * 24 * 30, label: lbls[1], re: 'm', wheel: {} },
                'days': { index: 4, until: 31, limit: 1000 * 60 * 60 * 24, label: lbls[2], re: 'd', wheel: {} },
                'hours': { index: 3, until: 23, limit: 1000 * 60 * 60, label: lbls[3], re: 'h', wheel: {} },
                'minutes': { index: 2, until: 59, limit: 1000 * 60, label: lbls[4], re: 'i', wheel: {} },
                'seconds': { index: 1, until: 59, limit: 1000, label: lbls[5], re: 's', wheel: {} }//,
                //'fract': { index: 0, until: 99, limit: 10, label: lbls[6], prefix: '.', short: 'u' }
            },
            o = [],
            steps = s.steps || [],
            wheels = {},
            max = 'seconds',
            maxi = 0,
            defaultVal = s.defaultValue || Math.max(s.minTime, Math.min(0, s.maxTime)),
            w = [[]];

        // Constructor

        time = 0;
        p = getParts(time);
        minParts = getParts(s.minTime);
        maxParts = getParts(s.maxTime);

        // Generate wheels
        $(unique).each(function (i, v) {
            j = ord.search(new RegExp(obj[v].re, 'i'));
            if (j > -1) {
                o.push({ o: j, v: v });

                if (obj[v].index > obj[max].index) {
                    max = v;
                }
            }
        });

        o.sort(function (a, b) {
            return a.o > b.o ? 1 : -1;
        });

        $.each(o, function (i, v) {
            if (v.v == max) {
                maxi = i;
            }
            wheels[v.v] = i + 1;
            w[0].push(obj[v.v].wheel);
            genWheel(v.v, p);
        });

        // Return settings
        return {
            wheels: w,
            parseValue: function (val) {
                var ret = [];
                if (val) {
                    $(s.labels).each(function (i, v) {
                        val = val.replace(v, '');
                    });
                    $(s.labelsShort).each(function (i, v) {
                        val = val.replace(v, '');
                    });
                    ret = val.replace(/\s+/g, ' ').split(' ');
                } else {
                    p = getParts(defaultVal);
                    $.each(o, function (i, v) {
                        ret.push(p[v.v]);
                    });
                }
                $(ret).each(function (i, v) { // Steps
                    ret[i] = step(v, steps[i] || 1);
                });

                return ret;
            },
            formatResult: function (d) {
                var ret = '';

                $(o).each(function (i, v) {
                    //if (v.v == 'fract') {
                    //return;
                    //}
                    //if (wheels[v.v]) {
                    //ret += d[i] + (v.v == 'seconds' && wheels.fract ? '.' + d[wheels.fract - 1] : '') + ' ' + obj[v.v].label + ' ';
                    //}
                    ret += d[i] + ' ' + obj[v.v].label + ' ';
                });
                return ret;
            },
            validate: function (dw, i, t) {
                var p,
                    old;

                time = calcTime(inst.temp);

                p = getParts(time);
                if (i === maxi || (!prevent && (inst.temp[maxi] < first || inst.temp[maxi] > last))) { // If max wheel is scrolled by timer
                    genWheel(max, p);
                    if (prevFrom !== from || prevUntil !== until) {
                        old = inst.temp[maxi];
                        timeout = setTimeout(function () {
                            prevFrom = from;
                            prevUntil = until;
                            prevent = true;
                            inst.temp[maxi] = old;
                            inst.changeWheel([maxi], undefined, i !== undefined);
                        }, t * 1000);
                    }
                }

                var maxprop = true,
                    minprop = true;

                $(unique).each(function (i, v) {
                    if (wheels[v] !== undefined) {
                        var t = $('.dw-ul', dw).eq(wheels[v] - 1),
                            i2 = $('.dw-li', t).index($('.dw-li[data-val="' + maxParts[v] + '"]', t)),
                            i1 = $('.dw-li', t).index($('.dw-li[data-val="' + minParts[v] + '"]', t));

                        $('.dw-li', t).addClass('dw-v');

                        if (maxprop && i2 > -1) {
                            $('.dw-li', t).slice(i2 + 1).removeClass('dw-v');
                        }

                        if (minprop && i1 > -1) {
                            $('.dw-li', t).slice(0, i1).removeClass('dw-v');
                        }

                        maxprop = maxprop && (p[v] == maxParts[v]);
                        minprop = minprop && (p[v] == minParts[v]);

                    }
                });

                prevent = false;
            },
            onBeforeShow: function () {
                s.mode = 'scroller';
                s.showLabel = true;

                time = calcTime(inst.temp);

                p = getParts(time);
                minParts = getParts(s.minTime);
                maxParts = getParts(s.maxTime);
                // Generate infinite wheel
                genWheel(max, p);
            },
            onMarkupReady: function (dw) {
                ctx = dw;

                dw.addClass('dw-timespan');

                // Clear changeWheel timeout if wheel is stopped
                $('.dwwl' + maxi, dw).on('mousedown touchstart', function () {
                    clearTimeout(timeout);
                });
            }
        };
    };

})(jQuery);
