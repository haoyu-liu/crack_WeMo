
var DEBUG = false;

var wDevices = {};
var TAG='wemo_util.js: ';
var isFirmWareSupportedFSR = false;
var dbFSR = null;
var ruleDevicesMacs = [];
var goBackVar;
$.getScript = function(src, callback) {

    var s = document.createElement('script');
    document.getElementsByTagName('head')[0].appendChild(s);
    s.onload = function() {
        //callback if existent.
        if (typeof callback == "function") callback();
        callback = null;
    }
    s.onreadystatechange = function() {
        if (s.readyState == 4 || s.readyState == "complete") {
            if (typeof callback == "function") callback();
            callback = null; // Wipe callback, to prevent multiple calls.
        }
    }
    s.src = src;
}


var wemoUtil = {

    //should be false for commited code:
    debugHTML: false,
    ledmodelcodes : [],
    homesenseModelCodes : [],

    md5: function(string) {

        function RotateLeft(lValue, iShiftBits) {
            return (lValue << iShiftBits) | (lValue >>> (32 - iShiftBits));
        }

        function AddUnsigned(lX, lY) {
            var lX4, lY4, lX8, lY8, lResult;
            lX8 = (lX & 0x80000000);
            lY8 = (lY & 0x80000000);
            lX4 = (lX & 0x40000000);
            lY4 = (lY & 0x40000000);
            lResult = (lX & 0x3FFFFFFF) + (lY & 0x3FFFFFFF);
            if (lX4 & lY4) {
                return (lResult ^ 0x80000000 ^ lX8 ^ lY8);
            }
            if (lX4 | lY4) {
                if (lResult & 0x40000000) {
                    return (lResult ^ 0xC0000000 ^ lX8 ^ lY8);
                } else {
                    return (lResult ^ 0x40000000 ^ lX8 ^ lY8);
                }
            } else {
                return (lResult ^ lX8 ^ lY8);
            }
        }

        function F(x, y, z) {
            return (x & y) | ((~x) & z);
        }

        function G(x, y, z) {
            return (x & z) | (y & (~z));
        }

        function H(x, y, z) {
            return (x ^ y ^ z);
        }

        function I(x, y, z) {
            return (y ^ (x | (~z)));
        }

        function FF(a, b, c, d, x, s, ac) {
            a = AddUnsigned(a, AddUnsigned(AddUnsigned(F(b, c, d), x), ac));
            return AddUnsigned(RotateLeft(a, s), b);
        };

        function GG(a, b, c, d, x, s, ac) {
            a = AddUnsigned(a, AddUnsigned(AddUnsigned(G(b, c, d), x), ac));
            return AddUnsigned(RotateLeft(a, s), b);
        };

        function HH(a, b, c, d, x, s, ac) {
            a = AddUnsigned(a, AddUnsigned(AddUnsigned(H(b, c, d), x), ac));
            return AddUnsigned(RotateLeft(a, s), b);
        };

        function II(a, b, c, d, x, s, ac) {
            a = AddUnsigned(a, AddUnsigned(AddUnsigned(I(b, c, d), x), ac));
            return AddUnsigned(RotateLeft(a, s), b);
        };

        function ConvertToWordArray(string) {
            var lWordCount;
            var lMessageLength = string.length;
            var lNumberOfWords_temp1 = lMessageLength + 8;
            var lNumberOfWords_temp2 = (lNumberOfWords_temp1 - (lNumberOfWords_temp1 % 64)) / 64;
            var lNumberOfWords = (lNumberOfWords_temp2 + 1) * 16;
            var lWordArray = Array(lNumberOfWords - 1);
            var lBytePosition = 0;
            var lByteCount = 0;
            while (lByteCount < lMessageLength) {
                lWordCount = (lByteCount - (lByteCount % 4)) / 4;
                lBytePosition = (lByteCount % 4) * 8;
                lWordArray[lWordCount] = (lWordArray[lWordCount] | (string.charCodeAt(lByteCount) << lBytePosition));
                lByteCount++;
            }
            lWordCount = (lByteCount - (lByteCount % 4)) / 4;
            lBytePosition = (lByteCount % 4) * 8;
            lWordArray[lWordCount] = lWordArray[lWordCount] | (0x80 << lBytePosition);
            lWordArray[lNumberOfWords - 2] = lMessageLength << 3;
            lWordArray[lNumberOfWords - 1] = lMessageLength >>> 29;
            return lWordArray;
        };

        function WordToHex(lValue) {
            var WordToHexValue = "",
                WordToHexValue_temp = "",
                lByte, lCount;
            for (lCount = 0; lCount <= 3; lCount++) {
                lByte = (lValue >>> (lCount * 8)) & 255;
                WordToHexValue_temp = "0" + lByte.toString(16);
                WordToHexValue = WordToHexValue + WordToHexValue_temp.substr(WordToHexValue_temp.length - 2, 2);
            }
            return WordToHexValue;
        };

        function Utf8Encode(string) {
            string = string.replace(/\r\n/g, "\n");
            var utftext = "";

            for (var n = 0; n < string.length; n++) {

                var c = string.charCodeAt(n);

                if (c < 128) {
                    utftext += String.fromCharCode(c);
                } else if ((c > 127) && (c < 2048)) {
                    utftext += String.fromCharCode((c >> 6) | 192);
                    utftext += String.fromCharCode((c & 63) | 128);
                } else {
                    utftext += String.fromCharCode((c >> 12) | 224);
                    utftext += String.fromCharCode(((c >> 6) & 63) | 128);
                    utftext += String.fromCharCode((c & 63) | 128);
                }

            }

            return utftext;
        };

        var x = Array();
        var k, AA, BB, CC, DD, a, b, c, d;
        var S11 = 7,
            S12 = 12,
            S13 = 17,
            S14 = 22;
        var S21 = 5,
            S22 = 9,
            S23 = 14,
            S24 = 20;
        var S31 = 4,
            S32 = 11,
            S33 = 16,
            S34 = 23;
        var S41 = 6,
            S42 = 10,
            S43 = 15,
            S44 = 21;

        string = Utf8Encode(string);

        x = ConvertToWordArray(string);

        a = 0x67452301;
        b = 0xEFCDAB89;
        c = 0x98BADCFE;
        d = 0x10325476;

        for (k = 0; k < x.length; k += 16) {
            AA = a;
            BB = b;
            CC = c;
            DD = d;
            a = FF(a, b, c, d, x[k + 0], S11, 0xD76AA478);
            d = FF(d, a, b, c, x[k + 1], S12, 0xE8C7B756);
            c = FF(c, d, a, b, x[k + 2], S13, 0x242070DB);
            b = FF(b, c, d, a, x[k + 3], S14, 0xC1BDCEEE);
            a = FF(a, b, c, d, x[k + 4], S11, 0xF57C0FAF);
            d = FF(d, a, b, c, x[k + 5], S12, 0x4787C62A);
            c = FF(c, d, a, b, x[k + 6], S13, 0xA8304613);
            b = FF(b, c, d, a, x[k + 7], S14, 0xFD469501);
            a = FF(a, b, c, d, x[k + 8], S11, 0x698098D8);
            d = FF(d, a, b, c, x[k + 9], S12, 0x8B44F7AF);
            c = FF(c, d, a, b, x[k + 10], S13, 0xFFFF5BB1);
            b = FF(b, c, d, a, x[k + 11], S14, 0x895CD7BE);
            a = FF(a, b, c, d, x[k + 12], S11, 0x6B901122);
            d = FF(d, a, b, c, x[k + 13], S12, 0xFD987193);
            c = FF(c, d, a, b, x[k + 14], S13, 0xA679438E);
            b = FF(b, c, d, a, x[k + 15], S14, 0x49B40821);
            a = GG(a, b, c, d, x[k + 1], S21, 0xF61E2562);
            d = GG(d, a, b, c, x[k + 6], S22, 0xC040B340);
            c = GG(c, d, a, b, x[k + 11], S23, 0x265E5A51);
            b = GG(b, c, d, a, x[k + 0], S24, 0xE9B6C7AA);
            a = GG(a, b, c, d, x[k + 5], S21, 0xD62F105D);
            d = GG(d, a, b, c, x[k + 10], S22, 0x2441453);
            c = GG(c, d, a, b, x[k + 15], S23, 0xD8A1E681);
            b = GG(b, c, d, a, x[k + 4], S24, 0xE7D3FBC8);
            a = GG(a, b, c, d, x[k + 9], S21, 0x21E1CDE6);
            d = GG(d, a, b, c, x[k + 14], S22, 0xC33707D6);
            c = GG(c, d, a, b, x[k + 3], S23, 0xF4D50D87);
            b = GG(b, c, d, a, x[k + 8], S24, 0x455A14ED);
            a = GG(a, b, c, d, x[k + 13], S21, 0xA9E3E905);
            d = GG(d, a, b, c, x[k + 2], S22, 0xFCEFA3F8);
            c = GG(c, d, a, b, x[k + 7], S23, 0x676F02D9);
            b = GG(b, c, d, a, x[k + 12], S24, 0x8D2A4C8A);
            a = HH(a, b, c, d, x[k + 5], S31, 0xFFFA3942);
            d = HH(d, a, b, c, x[k + 8], S32, 0x8771F681);
            c = HH(c, d, a, b, x[k + 11], S33, 0x6D9D6122);
            b = HH(b, c, d, a, x[k + 14], S34, 0xFDE5380C);
            a = HH(a, b, c, d, x[k + 1], S31, 0xA4BEEA44);
            d = HH(d, a, b, c, x[k + 4], S32, 0x4BDECFA9);
            c = HH(c, d, a, b, x[k + 7], S33, 0xF6BB4B60);
            b = HH(b, c, d, a, x[k + 10], S34, 0xBEBFBC70);
            a = HH(a, b, c, d, x[k + 13], S31, 0x289B7EC6);
            d = HH(d, a, b, c, x[k + 0], S32, 0xEAA127FA);
            c = HH(c, d, a, b, x[k + 3], S33, 0xD4EF3085);
            b = HH(b, c, d, a, x[k + 6], S34, 0x4881D05);
            a = HH(a, b, c, d, x[k + 9], S31, 0xD9D4D039);
            d = HH(d, a, b, c, x[k + 12], S32, 0xE6DB99E5);
            c = HH(c, d, a, b, x[k + 15], S33, 0x1FA27CF8);
            b = HH(b, c, d, a, x[k + 2], S34, 0xC4AC5665);
            a = II(a, b, c, d, x[k + 0], S41, 0xF4292244);
            d = II(d, a, b, c, x[k + 7], S42, 0x432AFF97);
            c = II(c, d, a, b, x[k + 14], S43, 0xAB9423A7);
            b = II(b, c, d, a, x[k + 5], S44, 0xFC93A039);
            a = II(a, b, c, d, x[k + 12], S41, 0x655B59C3);
            d = II(d, a, b, c, x[k + 3], S42, 0x8F0CCC92);
            c = II(c, d, a, b, x[k + 10], S43, 0xFFEFF47D);
            b = II(b, c, d, a, x[k + 1], S44, 0x85845DD1);
            a = II(a, b, c, d, x[k + 8], S41, 0x6FA87E4F);
            d = II(d, a, b, c, x[k + 15], S42, 0xFE2CE6E0);
            c = II(c, d, a, b, x[k + 6], S43, 0xA3014314);
            b = II(b, c, d, a, x[k + 13], S44, 0x4E0811A1);
            a = II(a, b, c, d, x[k + 4], S41, 0xF7537E82);
            d = II(d, a, b, c, x[k + 11], S42, 0xBD3AF235);
            c = II(c, d, a, b, x[k + 2], S43, 0x2AD7D2BB);
            b = II(b, c, d, a, x[k + 9], S44, 0xEB86D391);
            a = AddUnsigned(a, AA);
            b = AddUnsigned(b, BB);
            c = AddUnsigned(c, CC);
            d = AddUnsigned(d, DD);
        }

        var temp = WordToHex(a) + WordToHex(b) + WordToHex(c) + WordToHex(d);

        return temp.toLowerCase();
    },

    //Calculate the value of VMIN analog in CSS3
    getScreenVmin: function() {
        var screenWidth = $(window).width();
        var screenHeight = $(window).height();

        var vmin = screenWidth;
        if (vmin > screenHeight) {
            vmin = screenHeight;
        }

        return vmin;
    },

    getScreenWidth: function() {
        return $(window).width();
    },

    getScreenHeight: function() {
        return $(window).height();
    },

    //Navigation
    loadUrl: function(x) {
  	  window.location.href = x;
       //navigator.app.loadUrl(x, navigationUrlOptions);
    },
    loadExternalUrl: function (url) {
        //window.open(url, '_system');
        navigator.app.loadUrl(url, { 
            openExternal:true 
        });
    },
    loadPreviousUrl: function() {
        if (typeof(navigator.app) !== 'undefined' && !navigator.appVersion.match(/Android 4\.1/g)) {
            navigator.app.backHistory();
        } else {
            window.history.back();
        }
    },
    
    getPreviousUrl: function() {
        return window.sessionStorage.getItem("PreviousUrl");
    }, 
    setPreviousUrl: function(url) {
        window.sessionStorage.setItem("PreviousUrl", url);
    },    

    exitApp: function() {
        //navigator.app.clearHistory();
        navigator.app.exitApp();
    },
    
    isProductionBuild: function () {
        var bool = false;
        if(cloud === cloudEnvironment.PRODUCTION) {
            bool = true;
        }
        return bool;
    },
    
    isEmpty: function (s) {
        return (s == null || s == undefined || s == '');
    },
    
    //Loging Utility
    log: function(tag, string) {
        console.log(tag + ": " + string);
    },

    infoLog: function(tag, string) {
        if (DEBUG) {
        	 console.log(tag + ": " + string);
        }
    },

    TAG: 'wemo_util.js: ',
    
    // Template based string manipulation methods
    templator: {
        /**
         *  Usage:
         *      wemoUtil.templator.fitIn('<a href="#[0]" title="[1]">[1]</a>', ['test1.html', 'Test1']);
         *  Result:
         *      <a href="#test1.html" title="Test1">Test1</a>
        **/
        fitIn: function(template, arglist) {
            var output = template;
            for (var i = 0; i < arglist.length; i++) {
                output = output.replace(new RegExp('\\[' + i + '\\]', 'g'), arglist[i]);
            }
            return output;
        },
        /**
         *  Usage:
         *      wemoUtil.templator.fixIn('<a href="#[Link]" title="[Content]">[Content]</a>', { Link: 'test1.html', Content: 'Test1' });
         *  Result:
         *      <a href="#test1.html" title="Test1">Test1</a>
        **/
        fixIn: function (template, hashtable) {
            var tag, output = template;
            for (var key in hashtable) {
                tag = new RegExp("\\[" + key + "\\]", 'g')
                output = output.replace(tag, hashtable[key]);
            }
            return output;
        }
    },

    //Timing Functions
    getTimeRoundedToNearestHalfHour: function() {
        var d = new Date();
        var hh = d.getHours();
        var m = d.getMinutes();
        var dd = "AM";
        var h = hh;
        if (m > 30) {
            m = 0;
            d.setHours(d.getHours() + 1);
            h = d.getHours();

        } else if (m == 0) {
            m = 0;
        } else {
            m = 30;
        }

        if (h >= 12) {
            h = h - 12;
            dd = "PM";
        }

        if (h == 0) {
            h = 12;
        }

        m = m < 10 ? "0" + m : m;
        h = h < 10 ? "0" + h : h;


        return h + ":" + m + " " + dd;
    },
    getTimeRoundedToNearestOneAndHalfHour: function() {
        var d = new Date();
        var hh = d.getHours();
        var m = d.getMinutes();
        var dd = "AM";
        var h = hh + 1;
        if (m > 30) {
            m = 0;
            d.setHours(d.getHours() + 1);
            h = d.getHours();
        } else if (m == 0) {
            m = 0;
        } else {
            m = 30;
        }
        d.setHours(d.getHours() + 1);
        h = d.getHours();

        if (h > 11 && h != 12) {
            h = h - 12;
            dd = "PM";
        } else if (h > 11 && h == 12) {
            dd = "PM";
        } else {
            dd = "AM";
        }

        m = m < 10 ? "0" + m : m;
        h = h < 10 ? "0" + h : h;


        return h + ":" + m + " " + dd;

    },

    convertTimeToMilliseconds: function(x) {
        if (x == "") {
            var d = new Date();
            var hh = d.getHours();
            var m = d.getMinutes();
            return (hh * 3600) + (m * 60);
        } else {
            if (x.toLowerCase().lastIndexOf("m") != -1) {
                x = x.split(/[:\s]+/);
                //var hrToSec=((x[2]=="AM")&&(x[0]==12))?0:x[0]
                if (x[2].toLowerCase() == "pm") {
                    if (x[0] < 12) {
                        return (Number(x[0]) + 12) * 3600 + Number(x[1]) * 60;
                    } else return (Number(x[0])) * 3600 + Number(x[1]) * 60;

                } else if (x[2].toLowerCase() == "am") {
                    return Number((x[0] == 12) ? 0 : x[0]) * 3600 + Number(x[1]) * 60;
                }
            } else {
                x = x.split(":");
                return Number((x[0]) * 3600) + Number((x[1]) * 60);
            }
        }

    },
    
    getRuleClass: function(rule) {
        wemoUtil.infoLog(wemoUtil.TAG,"Detect class for " + rule);
        switch (rule) {
            case (sessionStore.SIMPLE_SWITCH):
            case (sessionStore.TIME_INTERVAL):
            case (sessionStore.AWAY_MODE):
                wemoUtil.infoLog(wemoUtil.TAG,"Detected TIME_CLASS");
                return rulesClasses.TIME_CLASS;
                break;
            case (sessionStore.COUNTDOWN_TIMER):
                wemoUtil.infoLog(wemoUtil.TAG,"Detected COUNTDOWN_TIMER");
                return rulesClasses.COUNTDOWN_TIMER_CLASS;
                break;
            case (sessionStore.MOTION_CONTROLLED):
                wemoUtil.infoLog(wemoUtil.TAG,"Detected SENSOR_CLASS");
                return rulesClasses.SENSOR_CLASS;
                break;
            case (sessionStore.INSIGHT_RULE):
                wemoUtil.infoLog(wemoUtil.TAG,"Detected NOTIFY_CLASS");
                return rulesClasses.INSIGHT_NOTIFY_CLASS;
            case (sessionStore.NOTIFY_ME):
                wemoUtil.infoLog(wemoUtil.TAG,"Detected NOTIFY_CLASS");
                return rulesClasses.SENSOR_NOTIFY_CLASS;
            case (sessionStore.MAKER_MOTION_CONTROLLED):
                wemoUtil.infoLog(wemoUtil.TAG,"Detected MAKER SENSOR CLASS");
                return rulesClasses.MAKER_SENSOR_CLASS;
            case (sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE):
                wemoUtil.infoLog(wemoUtil.TAG,"Detected NOTIFY_MAKER_SENSOR_CLASS");
                return rulesClasses.NOTIFY_MAKER_SENSOR_CLASS;
        }

        return rulesClasses.UNKNOWN_CLASS;
    },
    convertToMinutes: function(x) {
        var hours = x / 3600;
        if (String(hours).indexOf(".") != -1) {
            hours = parseInt(String(hours).substr(0, String(hours).lastIndexOf(".")));
        }
        hours = hours < 9 ? '0' + hours : hours;
        x %= 3600;
        var minutes = x / 60;
        minutes = minutes < 10 ? '0' + minutes : minutes;
        var seconds = x % 60;
        //return hours+":"+minutes;
        return hours + ":" + minutes;
    },
    convertMillisecondsToAMPM: function(milliseconds) {
        wemoUtil.infoLog(wemoUtil.TAG,"************** milliseconds : " + milliseconds);
        if (milliseconds == timestamp.MIDNIGHT_END_TIME) { //12:00AM for end time
            return '12:00 am';
        } else {
            if (parseInt(milliseconds) < 0) {
                milliseconds = 86400 + parseInt(milliseconds);
            }

            var hours = Math.floor(milliseconds / 3600);
            var minutes = Math.floor((milliseconds - (hours * 3600)) / 60);
            wemoUtil.infoLog(wemoUtil.TAG,"************** hours " + hours);
            hours = (hours == 24) ? 12 : hours;
            var ampm = (milliseconds < 43200 || milliseconds > 86400) ? 'am' : 'pm';
            hours = hours % 12;
            hours = hours ? hours : 12; // the hour '0' should be '12'
            hours = (hours < 10) ? '0' + hours : hours;
            minutes = minutes < 10 ? '0' + minutes : minutes;
            var strTime = hours + ':' + minutes + ' ' + ampm;
            return strTime;
        }
    },

    convertMillisecondsTo_TF24: function(milliseconds) {
        wemoUtil.infoLog(wemoUtil.TAG,"************** milliseconds : " + milliseconds);
        if (milliseconds == timestamp.MIDNIGHT_END_TIME) { //12:00AM for end time
            return '00:00';
        } else {
            var hours = Math.floor(milliseconds / 3600);
            var minutes = Math.floor((milliseconds - (hours * 3600)) / 60);
            wemoUtil.infoLog(wemoUtil.TAG,"************** hours " + hours);
            if (hours >= 24) {
                hours = hours - 24;
            }
            hours = (hours < 10) ? '0' + hours : hours;
            minutes = minutes < 10 ? '0' + minutes : minutes;
            var strTime = hours + ':' + minutes;
            return strTime;
        }
    },

    //TF - time format
    //TFis24 - flag, true - 24hrs tf
    convertMillisecondsToTF: function(milliseconds, TFis24) {
        wemoUtil.infoLog(wemoUtil.TAG,"TFis24: " + TFis24);
        switch (TFis24) {
            case true:
                return wemoUtil.convertMillisecondsTo_TF24(milliseconds);
                break;
            case false:
                return wemoUtil.convertMillisecondsToAMPM(milliseconds);
                break;
            default:
                return wemoUtil.convertMillisecondsToAMPM(milliseconds);
        }
    },

    convertSecondsToHoursMins: function(seconds) {
        wemoUtil.infoLog(wemoUtil.TAG,"************** milliseconds : " + seconds);
        if (seconds < 3600) {
            var mins = Math.floor(seconds / 60);
            var strTime = mins + 'mins';
        } else {
            var hours = Math.floor(seconds / 3600);
            var minutes = Math.floor((seconds - (hours * 3600)) / 60);
            wemoUtil.infoLog(wemoUtil.TAG,"************** hours " + hours);
            // hours = (hours == 24) ? 12: hours;
            var strTime = hours + 'h ' + minutes + 'mins';
        }
        return strTime;
    },

    formatAMPM: function(date) {
        /*var hours = date.getHours();
             var minutes = date.getMinutes();
             var ampm = hours >= 12 ? 'pm' : 'am';
             hours = hours % 12;
             hours = hours ? hours : 12; // the hour '0' should be '12'
             minutes = minutes < 10 ? '0'+minutes : minutes;
             var strTime = hours + ':' + minutes + ' ' + ampm;
             return strTime;*/

        wemoUtil.infoLog(wemoUtil.TAG,"Date : 0" + date);
        var hours = date.getHours();
        var minutes = date.getMinutes();
        var ampm = hours >= 12 ? 'pm' : 'am';
        wemoUtil.infoLog(wemoUtil.TAG,"hours :1: " + hours);
        hours = hours % 12;
        wemoUtil.infoLog(wemoUtil.TAG,"hours :2: " + hours);
        hours = hours ? hours : 12; // the hour '0' should be '12'
    },
    formatMins: function(seconds) {
        wemoUtil.infoLog(wemoUtil.TAG,"Seconds : 0" + seconds);
        var minutes = seconds / 60;
        return minutes = (minutes == 60) ? '1hr' : minutes + ' minutes';
    },

    returnDay: function(dayID) {
        wemoUtil.infoLog(wemoUtil.TAG,"Inside returnday" + dayID);
        switch (parseInt(dayID)) {
            case 0:
                return "Daily";
                break;
            case 1:
                return "Sun";
                break;
            case 2:
                return "Mon";
                break;
            case 3:
                return "Tue";
                break;
            case 4:
                return "Wed";
                break;
            case 5:
                return "Thu";
                break;
            case 6:
                return "Fri";
                break;
            case 7:
                return "Sat";
                break;
            case 8:
                return "Weekday";
                break;
            case 9:
                return "Weekends";
                break;
            default:
                wemoUtil.infoLog(wemoUtil.TAG,"Inside default");
                break;
        }
    },

    returnTime: function(startTime, duration) {
        /*
             1.	SR	SR	-	1,1				21541,21541
             2.	SR	SS	-	1,2				21541,21542
             3.	SS	SR	-	2,1				21542,21541
             4.	SS	SS	-	2,2				21542,21542
             5.	SR	 T	-	1,9				21541,68459
             6.	SS	 T	-	2,8				21542,68458
             7.	 T	SR	-	0,9				21540,21541
             8.	 T	SS	-	0,8				21540,21542
             */

        /*var tempStartTime = ""+startTime;
             var tempDuration = ""+duration;
             wemoUtil.infoLog(wemoUtil.TAG,"SRSS:startTime  "+startTime+"  ::  "+tempStartTime.substr(tempStartTime.length-1, tempStartTime.length));
             wemoUtil.infoLog(wemoUtil.TAG,"SRSS:duration  "+duration+"  ::  "+tempDuration.substr(tempDuration.length-1, tempDuration.length));
             tempStartTime = tempStartTime.substr(tempStartTime.length-1, tempStartTime.length);
             tempDuration = tempDuration.substr(tempDuration.length-1, tempDuration.length);*/
        //###################################Temp Code For Testing Only #########################################
        /*var arrCombinations = [[1,1], [1,2], [2,1], [2,2], [1,9], [2,8], [0,9], [0,8]];
             var randomNumber = Math.floor((Math.random()*8)+1);
             //var tempStartTimeDuration = arrCombinations[randomNumber];
             tempStartTime = arrCombinations[randomNumber][0];
             tempDuration = arrCombinations[randomNumber][1];*/
        //###################################Temp Code For Testing Only #########################################
        /*alert("returnTime:  "+"tempStartTime:  "+tempStartTime+"  ::  tempDuration:  "+tempDuration);
             if((tempStartTime == 1 || tempStartTime == 2) || (tempDuration == 1 || tempDuration == 2 || tempDuration == 8 || tempDuration == 9)){
             alert("SRSS - Rule");
             var startTimeValue;
             var endTime;
             if(tempStartTime == 0){
             startTimeValue = parseInt(startTime);
             startTimeValue = wemoUtil.convertMillisecondsToAMPM(startTime);
             }else if(tempStartTime == 1 || tempStartTime == 9){
             startTimeValue = "Sunrise";
             }else if(tempStartTime == 2 || tempStartTime == 8){
             startTimeValue = "Sunset";
             }
             if(tempDuration == 0 || tempDuration == 8 || tempDuration == 9){
             endTime = parseInt(startTime)+parseInt(duration);
             endTime = wemoUtil.convertMillisecondsToAMPM(endTime);
             }else if(tempDuration == 1){
             endTime = "Sunrise";
             }else if(tempDuration == 2){
             endTime = "Sunset";
             }
             if(startTime > 0 && duration == 0){
             endTime = "";
             }

             var combination = tempStartTime+","+tempDuration;
             alert("combination:  "+combination+"  ::  "+"StartTime:  "+startTimeValue+"  ::  EndTime:  "+endTime);

             if(duration<=0) {
             return startTimeValue + ", ";
             }
             else {
             return startTimeValue + "-" + endTime + ", ";
             }
             }else{*/
        wemoUtil.infoLog(wemoUtil.TAG,"startTime:  " + startTime + "  ::  Duration:  " + duration);
        startTime = parseInt(startTime);
        var endTime = parseInt(startTime) + parseInt(duration); //parseInt(startTime + duration);
        if (endTime > timestamp.MAX_HOUR) {
            endTime = endTime - timestamp.MAX_HOUR;
        }
        //parseInt(duration);
        //var endTime = parseInt(duration);//parseInt(startTime + duration);
        var startTimeMin = parseInt(startTime / 60);
        var startTimeHours = parseInt(startTimeMin / 60);
        startTimeMin = startTimeMin % 60;
        var endTimeMin = parseInt(endTime / 60);
        var endTimeHours = parseInt(endTimeMin / 60);
        endTimeMin = endTimeMin % 60;
        wemoUtil.infoLog(wemoUtil.TAG,"startTime:  " + startTime + "   endTime:  " + endTime + "  ::  Duration:  " + duration);
        if (duration <= 0) {
            //return startTimeHours + ":" + startTimeMin + ", ";
            return wemoUtil.convertMillisecondsToTF(startTime, UP_TF_IS24) + ", ";
        } else {
            //return startTimeHours + ":" + startTimeMin + " - " + endTimeHours + ":" + endTimeMin + ", ";
            return wemoUtil.convertMillisecondsToTF(startTime, UP_TF_IS24) + "-" + wemoUtil.convertMillisecondsToTF(endTime, UP_TF_IS24) + ", ";
        }
        //}
    },

    returnSwitchStatus: function(switchState) {
        switch (parseInt(switchState)) {
            case 1:
                return wemo.items['SwitchActionTurnOn'];
                break;
            case 0:
                return wemo.items['SwitchActionTurnOff'];
                break;
            case 2:
                return wemo.items['SwitchActionNothing'];
                break;
            default:
                wemoUtil.infoLog(wemoUtil.TAG,"Inside default");
                break;
        }
    },

    returnSensorStrength: function(selectedsensorsvalue) {
        switch (parseInt(selectedsensorsvalue)) {
            case 100:
                return wemo.items['VeryHigh'];
                break;
            case 75:
                return wemo.items['High'];
                break;
            case 50:
                return wemo.items['Medium'];
                break;
            case 25:
                return wemo.items['Low'];
                break;
            default:
                wemoUtil.infoLog(wemoUtil.TAG,"Inside default");
                break;
        }
    },

    returnSwitchVal: function(switchState) {
        switch (parseInt(switchState)) {
            case 1:
                return wemo.items['StaysOn'];
                break;
            case 0:
                return wemo.items['StaysOff'];
                break;
            case 2:
                return wemo.items['SwitchActionNothing'];
                break;
            default:
                wemoUtil.infoLog(wemoUtil.TAG,"Inside default");
                break;
        }
    },

    returnDayforSchStr: function(dayID) {
        wemoUtil.infoLog(wemoUtil.TAG,"Inside returnday" + dayID);
        switch (dayID) {
            case 0:
                return 0;
                break;
            case 1:
                return 7;
                break;
            case 2:
                return 1;
                break;
            case 3:
                return 2;
                break;
            case 4:
                return 3;
                break;
            case 5:
                return 4;
                break;
            case 6:
                return 5;
                break;
            case 7:
                return 6;
                break;
            case 8:
                return 8;
                break;
            case 9:
                return 9;
                break;
            default:
                wemoUtil.infoLog(wemoUtil.TAG,"Inside default");
                break;
        }
    },

    deCodeDays: function(arg) {
        wemoUtil.infoLog(wemoUtil.TAG,"Inside De-Code Days:  " + arg);
        switch (arg) {
            case "Daily":
                return 0;
                break;
            case "Sun":
                return 1;
                break;
            case "Mon":
                return 2;
                break;
            case "Tue":
                return 3;
                break;
            case "Wed":
                return 4;
                break;
            case "Thu":
                return 5;
                break;
            case "Fri":
                return 6;
                break;
            case "Sat":
                return 7;
                break;
            case "Weekdays":
                return 8;
                break;
            case "Weekends":
                return 9;
                break;
            case "Mon-Tue-Wed-Thu-Fri":
                return 8;
                break;
            case "Sat-Sun":
                return 9;
                break;
            case "Mon-Tue-Wed-Thu-Fri-Sat-Sun":
                return 0;
                break;
            default:
                wemoUtil.infoLog(wemoUtil.TAG,"Inside default");
                break;
        }
    },
    monthNames: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],

    daysAgo: function(date) {
        var today = new Date().setHours(0, 0, 0, 0);
        var inDate = new Date(date);
        inDate.setHours(0, 0, 0, 0);
        var one_day = 1000 * 60 * 60 * 24;
        var days = (today - inDate) / (one_day);
        if (days == 0) {
            return wemoUtil.getAMPM(date);
        } else if (days == 1) {
            return wemoUtil.getAMPM(date) + " yesterday";
        }
        return date.getDate() + " " + wemoUtil.monthNames[date.getMonth()];
    },

    getAMPM: function(date) {
        var hours = date.getHours();
        var minutes = date.getMinutes();
        var ampm = hours >= 12 ? 'pm' : 'am';
        hours = hours % 12;
        hours = hours ? hours : 12; // the hour '0' should be '12'
        minutes = minutes < 10 ? '0' + minutes : minutes;
        var strTime = hours + ':' + minutes + ' ' + ampm;
        return strTime;
    },

    countDown: function(startedTime, max) {
        var currentTime = new Date().getTime();

        var differenceMillis = currentTime - startedTime;
        var differenceMinutes = Math.floor(differenceMillis / timestamp.ONE_MINUTE);
        var pendingTime = max - differenceMinutes;
        if (pendingTime < 1) {
            pendingTime = 1;
        }
        return pendingTime
    },

    //SQLOperations

    DBCreate: function() {
        var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
        db.transaction(createRulesTable, errorCB, successCB);

        function createRulesTable(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS RULES (RuleID  PRIMARY KEY, Name TEXT NOT NULL, Type TEXT NOT NULL, RuleOrder INTEGER, StartDate TEXT, EndDate TEXT,State TEXT, Sync INTEGER)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS RULEDEVICES (RuleDevicePK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER, DeviceID TEXT, GroupID INTEGER, DayID INTEGER, StartTime INTEGER,RuleDuration INTEGER, StartAction REAL, EndAction REAL, SensorDuration INTEGER,Type INTEGER,Value INTEGER,Level INTEGER,ZBCapabilityStart TEXT, ZBCapabilityEnd TEXT,OnModeOffset INTEGER,OffModeOffset INTEGER,CountdownTime INTEGER,EndTime INTEGER)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS DEVICECOMBINATION (DeviceCombinationPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER, SensorID TEXT, SensorGroupID INTEGER, DeviceID TEXT, DeviceGroupID INTEGER)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS GROUPDEVICES (GroupDevicePK INTEGER PRIMARY KEY AUTOINCREMENT, GroupID INTEGER, DeviceID TEXT)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS LOCATIONINFO (LocationPK INTEGER PRIMARY KEY AUTOINCREMENT, cityName TEXT, countryName TEXT, latitude TEXT, longitude TEXT, countryCode TEXT, region TEXT)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS BLOCKEDRULES (Primarykey  INTEGER PRIMARY KEY AUTOINCREMENT, ruleId TEXT)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS RULESNOTIFYMESSAGE (RuleID INTEGER, NotifyRuleID TEXT NOT NULL, Message TEXT NOT NULL, Frequency INTEGER)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS SENSORNOTIFICATION (SensorNotificationPK INTEGER PRIMARY KEY AUTOINCREMENT,RuleID INTEGER, NotifyRuleID INTEGER, NotificationMessage TEXT, NotificationDuration TEXT)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS TARGETDEVICES (TargetDevicesPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER, DeviceID TEXT, DeviceIndex INTEGER)');
        }

        function errorCB(err) {
            wemoUtil.infoLog(wemoUtil.TAG,"Error creating rules DB table structure " + err.code);
             db.close();
        }

        function successCB() {
            wemoUtil.infoLog(wemoUtil.TAG,"Success creating rules DB table structure ");
            db.close();
        }
    },

    DBInitialize: function(goBack) {

        //        navigator.notification.activityStart("Please Wait", "loading");
        //var text = wemo.items['RULE_STATUS_REFRESHING_DB'];
      //  var text = wemo.items['RULE_STATUS_LOOKING_FOR_RULES'];
//        var text = 'Looking for rules';
//        var string = $('<p>' + text + '</p>').text();
//
//        deviceTabPlugin.execute(
//            function(res) {
                deviceTabPlugin.execute(
                    function(type) {
                        if (type == networkType.HOME_NETWORK) { 
                            wemoUtil.downloadDB(goBack);
                        } else if (type == networkType.REMOTE_WIFI || type == networkType.REMOTE_MOBILE) {
                            deviceTabPlugin.execute(
                                function(enabled) { 
                                	//nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", string]);
                                    if (enabled) {
                                        wemoUtil.downloadDBFromCloud(sessionStore.REMOTE_CALL_GETDB, goBack);
                                    } else {
                                        navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, { 
                                        });
                                    }
                                },
                                wemoUtil.reportError,
                                actions.IS_REMOTE_ENABLED, []
                            );
                        } else {
                            wemoUtil.infoLog(wemoUtil.TAG,"Not supported...");
                            nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);

                        }
                    },
                    wemoUtil.reportError,
                    actions.GET_NETWORK_TYPE, []
                );
//            },
//            function(res) {
//                wemoUtil.infoLog(wemoUtil.TAG,"Error copying Skeleton DB");
//            },
//            actions.COPY_DB_SKELETON, []
//        );
    },

    DBInitializeSettingAbout: function(goBack, callback) {

        //      navigator.notification.activityStart("Please Wait", "loading");
        nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", wemo.items['loadingMessage']]);
        ////// some activity

        var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
        db.transaction(createRulesTable, errorCB, function() {
            successCB(goBack, callback)
        });

        function createRulesTable(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS RULES (RuleID  PRIMARY KEY, Name TEXT NOT NULL, Type TEXT NOT NULL, RuleOrder INTEGER, StartDate TEXT, EndDate TEXT,State TEXT, Sync INTEGER)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS RULEDEVICES (RuleDevicePK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER, DeviceID TEXT, GroupID INTEGER, DayID INTEGER, StartTime INTEGER,RuleDuration INTEGER, StartAction REAL, EndAction REAL, SensorDuration INTEGER,Type INTEGER,Value INTEGER,Level INTEGER,ZBCapabilityStart TEXT, ZBCapabilityEnd TEXT,OnModeOffset INTEGER,OffModeOffset INTEGER,CountdownTime INTEGER,EndTime INTEGER)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS DEVICECOMBINATION (DeviceCombinationPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER, SensorID TEXT, SensorGroupID INTEGER, DeviceID TEXT, DeviceGroupID INTEGER)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS GROUPDEVICES (GroupDevicePK INTEGER PRIMARY KEY AUTOINCREMENT, GroupID INTEGER, DeviceID TEXT)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS LOCATIONINFO (LocationPK INTEGER PRIMARY KEY AUTOINCREMENT, cityName TEXT, countryName TEXT, latitude TEXT, longitude TEXT, countryCode TEXT, region TEXT)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS BLOCKEDRULES (Primarykey  INTEGER PRIMARY KEY AUTOINCREMENT, ruleId TEXT)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS RULESNOTIFYMESSAGE (RuleID INTEGER, NotifyRuleID TEXT NOT NULL, Message TEXT NOT NULL, Frequency INTEGER)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS SENSORNOTIFICATION (SensorNotificationPK INTEGER PRIMARY KEY AUTOINCREMENT,RuleID INTEGER, NotifyRuleID INTEGER, NotificationMessage TEXT, NotificationDuration TEXT)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS TARGETDEVICES (TargetDevicesPK INTEGER PRIMARY KEY AUTOINCREMENT, RuleID INTEGER, DeviceID TEXT, DeviceIndex INTEGER)');
        }

        function errorCB(err) {
            wemoUtil.infoLog(wemoUtil.TAG,"Error processing SQL: " + err.code);
//
        }

        function successCB(goBack, callback) {
            wemoUtil.infoLog(wemoUtil.TAG,"Success creating the table structures  " + goBack);
           db.close();
            deviceTabPlugin.execute(
                function(res) {
                    wemoUtil.infoLog(wemoUtil.TAG,"Success copying Skeleton DB  " + goBack);
                    deviceTabPlugin.execute(
                        //                        wemoUtil.processNetworkType,
                        function(type) {
                            wemoUtil.infoLog(wemoUtil.TAG,"processNetworkType : " + type + '  ' + goBack);
                            if (type == networkType.HOME_NETWORK) {
                                wemoUtil.infoLog(wemoUtil.TAG,"Local Mode..." + goBack);
                                wemoUtil.downloadDB(goBack, callback);
                            } else if (type == networkType.REMOTE_WIFI || type == networkType.REMOTE_MOBILE) {
                                deviceTabPlugin.execute(
                                    function(enabled) {
                                        wemoUtil.infoLog(wemoUtil.TAG,"Remote enabled: " + enabled);
                                        if (enabled) {
                                            wemoUtil.downloadDBFromCloud(sessionStore.REMOTE_CALL_GETDB, goBack, callback);
                                        } else {
                                            navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {
                                                loadUrlTimeoutValue: 60000
                                            });
                                        }
                                    },
                                    wemoUtil.reportError,
                                    actions.IS_REMOTE_ENABLED, []
                                );
                            } else {
                                wemoUtil.infoLog(wemoUtil.TAG,"Not supported...");
                            }
                        },
                        wemoUtil.reportError,
                        actions.GET_NETWORK_TYPE, []
                    );
                },
                function(res) {
                    wemoUtil.infoLog(wemoUtil.TAG,"Error copying Skeleton DB");
                },
                actions.COPY_DB_SKELETON, []
            );

        }
    },
    setFirmwaresSupportFetchStoreRules: function() {
    	var firmwareArray = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.FIRMWARE_VERSION_DATA);
    	wemoUtil.infoLog(wemoUtil.TAG, 'setFirmwaresSupportFetchStoreRules firmwareArray : ' + JSON.stringify(firmwareArray));
    	if (firmwareArray == null){
    		isFirmWareSupportedFSR = false;
    	}else{
    		isFirmWareSupportedFSR=true;
        	for (var i = 0; i < firmwareArray.length; i++) {
        		wemoUtil.infoLog(wemoUtil.TAG, "setFirmwaresSupportFetchStoreRules Array UDN value : " + firmwareArray[i]["udn"]);
        		var firmwareVerString = firmwareArray[i]["devicefirmware"];
        		var firmwareVerAry = firmwareVerString.split('.');
        		var firmwareVer = parseInt(firmwareVerAry[2]);
        		wemoUtil.infoLog(wemoUtil.TAG, 'setFirmwaresSupportFetchStoreRules firmware version : ' + firmwareVer + ' FETCHSTORE_FW_SUPPORT' + configValue.FETCHSTORE_FW_SUPPORT);
        		if (firmwareVer < configValue.FETCHSTORE_FW_SUPPORT) {
        			wemoUtil.infoLog(wemoUtil.TAG, 'firmware is not supported ');
        			isFirmWareSupportedFSR = false;
        			break;
        		} 
        	}
    	}
    	
    	wemoUtil.infoLog(wemoUtil.TAG,"setFirmwaresSupportFetchStoreRules isFirmWareSupportedFSR:  " + isFirmWareSupportedFSR);
    	return isFirmWareSupportedFSR;
    },
    getFirmwareVersionSRSS: function(udn) {
        //alert("Get Firmware Version SRSS");
        wemoUtil.infoLog(wemoUtil.TAG,"Get Firmware Version SRSS udn:  " + udn);

        var isFirmWareSupported = "";

        deviceTabPlugin.execute(
            function(type) {
                if (type === networkType.HOME_NETWORK) {
                    wemoUtil.infoLog(wemoUtil.TAG, 'Home getFirmwareVersion');

                    devicePlugin.execute(
                        function(params) {
                            wemoUtil.infoLog(wemoUtil.TAG,"Get Firmware Version SRSS  params:  " + params);
                            if (params === "true") {
                                wemoUtil.infoLog(wemoUtil.TAG,"firmware is supported");
                                isFirmWareSupported = params;
                            } else {
                                wemoUtil.infoLog(wemoUtil.TAG,"firmware is not supported");
                                isFirmWareSupported = params;
                                window.sessionStorage.setItem("Unsupported_SRSS_FW", "1");
                            }
                        },
                        wemoUtil.reportError,
                        actions.GET_FIRMWARE_VERSION_SRSS, [udn]
                    );
                } else if (type === networkType.REMOTE_MOBILE || type === networkType.REMOTE_WIFI) {

                    wemoUtil.infoLog(wemoUtil.TAG, 'Remote getFirmwareVersion');

                    devicePlugin.execute(
                        function(enabled) {
                            wemoUtil.infoLog(wemoUtil.TAG, 'Remote enabled: ' + enabled);
                            if (enabled) {
                                var firmwareArray = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.FIRMWARE_VERSION_DATA);
                                wemoUtil.infoLog(wemoUtil.TAG, 'firmwareArray : ' + JSON.stringify(firmwareArray));

                                for (var i = 0; i < firmwareArray.length; i++) {
                                    wemoUtil.infoLog(wemoUtil.TAG, "UDN value : " + udn + "  Array UDN value : " + firmwareArray[i]["udn"]);
                                    if (firmwareArray[i]["udn"] == udn) {
                                        var firmwareVerString = firmwareArray[i]["devicefirmware"];
                                        var firmwareVerAry = firmwareVerString.split('.');
                                        var firmwareVer = parseInt(firmwareVerAry[2]);
                                        wemoUtil.infoLog(wemoUtil.TAG, 'firmware version : ' + firmwareVer + ' SRSS_FW_SUPPORT' + configValue.SRSS_FW_SUPPORT);

                                        //	                   		               if(firmwareVer < 2800) {
                                        if (firmwareVer < configValue.SRSS_FW_SUPPORT) {
                                            wemoUtil.infoLog(wemoUtil.TAG, 'firmware is not supported ');
                                            isFirmWareSupported = "false";
                                        } else {
                                            wemoUtil.infoLog(wemoUtil.TAG, 'firmware is supported ');
                                            isFirmWareSupported = "true";
                                        }

                                        break;
                                    }

                                }
                            } else {
                                wemoUtil.loadUrl(filePath.REMOTE_NOT_AVAILABLE);
                            }
                        },
                        wemoUtil.reportError,
                        actions.IS_REMOTE_ENABLED, []
                    );
                }

            },
            wemoUtil.reportError,
            actions.GET_NETWORK_TYPE, []
        );


        wemoUtil.infoLog(wemoUtil.TAG,"Get Firmware Version SRSS isFirmWareSupported:  " + isFirmWareSupported);
        return isFirmWareSupported;
    },

    getMakerFirmwareVersion: function(udn, cachedWemoDevice) {

        wemoUtil.infoLog(wemoUtil.TAG,'getMakerFirmwareVersion udn:  ' + udn);
        var isFirmWareSupported = "";

        deviceTabPlugin.execute(
            function(type) {
                if (type === networkType.HOME_NETWORK) {
                    wemoUtil.infoLog(wemoUtil.TAG, 'Home getMakerFirmwareVersion');
                    isFirmWareSupported = true;

                    if (cachedWemoDevice != null && cachedWemoDevice != undefined && cachedWemoDevice.length > 0) {
                        $.each(cachedWemoDevice, function(inx) {
                            wemoUtil.infoLog(wemoUtil.TAG,'getMakerFirmwareVersion cachedWemoDevice[inx].udn--> ' + cachedWemoDevice[inx].udn);
                            if (udn == cachedWemoDevice[inx].udn) {
                                wemoUtil.infoLog(wemoUtil.TAG,'getMakerFirmwareVersion cachedWemoDevice[inx].firmwareVersion--> ' + cachedWemoDevice[inx].firmwareVersion);
                                if (cachedWemoDevice[inx].firmwareVersion && parseInt(cachedWemoDevice[inx].firmwareVersion) < configValue.MAKER_FW_SUPPORT) {
                                    isFirmWareSupported = "false";
                                }
                            }
                        });
                    }
                } else if (type === networkType.REMOTE_MOBILE || type === networkType.REMOTE_WIFI) {

                    wemoUtil.infoLog(wemoUtil.TAG, 'Remote getMakerFirmwareVersion');

                    devicePlugin.execute(
                        function(enabled) {
                            wemoUtil.infoLog(wemoUtil.TAG, 'Remote enabled: ' + enabled);
                            if (enabled) {
                                var firmwareArray = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.FIRMWARE_VERSION_DATA);
                                wemoUtil.infoLog(wemoUtil.TAG, 'firmwareArray : ' + JSON.stringify(firmwareArray));

                                for (var i = 0; i < firmwareArray.length; i++) {
                                    wemoUtil.infoLog(wemoUtil.TAG, "UDN value : " + udn + "  Array UDN value : " + firmwareArray[i]["udn"]);
                                    if (firmwareArray[i]["udn"] == udn) {
                                        var firmwareVerString = firmwareArray[i]["devicefirmware"];
                                        var firmwareVerAry = firmwareVerString.split('.');
                                        var firmwareVer = parseInt(firmwareVerAry[2]);
                                        wemoUtil.infoLog(wemoUtil.TAG, 'firmware version : ' + firmwareVer + ' Maker_FW_SUPPORT' + configValue.MAKER_FW_SUPPORT);

                                        //	                   		               if(firmwareVer < 2800) {
                                        if (firmwareVer < configValue.MAKER_FW_SUPPORT) {
                                            wemoUtil.infoLog(wemoUtil.TAG, 'firmware is not supported ');
                                            isFirmWareSupported = "false";
                                        } else {
                                            wemoUtil.infoLog(wemoUtil.TAG, 'firmware is supported ');
                                            isFirmWareSupported = "true";
                                        }

                                        break;
                                    }

                                }
                            } else {
                                wemoUtil.loadUrl(filePath.REMOTE_NOT_AVAILABLE);
                            }
                        },
                        wemoUtil.reportError,
                        actions.IS_REMOTE_ENABLED, []
                    );
                }

            },
            wemoUtil.reportError,
            actions.GET_NETWORK_TYPE, []
        );


        wemoUtil.infoLog(wemoUtil.TAG,"getMakerFirmwareVersion isFirmWareSupported:  " + isFirmWareSupported);
        return isFirmWareSupported;
    },


    processNetworkType: function(type, goBack) {
        wemoUtil.infoLog(wemoUtil.TAG,"processNetworkType : " + type + '  ' + goBack);
        if (type == networkType.HOME_NETWORK) {
            wemoUtil.infoLog(wemoUtil.TAG,"Local Mode..." + goBack);
            wemoUtil.downloadDB(goBack);
        } else if (type == networkType.REMOTE_WIFI || type == networkType.REMOTE_MOBILE) {
            deviceTabPlugin.execute(
                function(enabled) {
                    wemoUtil.infoLog(wemoUtil.TAG,"Remote enabled: " + enabled);
                    if (enabled) {
                        wemoUtil.downloadDBFromCloud(sessionStore.REMOTE_CALL_GETDB, goBack);
                    } else {
                        navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {
                            loadUrlTimeoutValue: 60000
                        });
                    }
                },
                wemoUtil.reportError,
                actions.IS_REMOTE_ENABLED, []
            );
        } else {
            wemoUtil.infoLog(wemoUtil.TAG,"Not supported...");
        }
    },

    backupRestoreRulesDevice: function() {
        var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);

        /** Taking backup data for Ruledevices table before droping**/

        var ruleDeviceRows = [];
        db.transaction(backupRulesDeviceTable, errorbackupCB);

        function backupRulesDeviceTable(tx) {
            tx.executeSql('SELECT * from RULEDEVICES', [], querybackupSuccess, errorbackupCB);
        }

        function querybackupSuccess(tx, results) {
            wemoUtil.infoLog(wemoUtil.TAG,"Fetching Data rule devices =>" + results.rows.length);

            var len = results.rows.length;

            if (len > 0) {
                for (var i = 0; i < len; i++) {
                    ruleDeviceRows[i] = results.rows.item(i);
                }
            }
            wemoUtil.infoLog(wemoUtil.TAG,"ruleDeviceRows " + JSON.stringify(ruleDeviceRows));

            //db.transaction(createRulesDeviceTable, errorRD, successRD);

            db.transaction(function(tx) {
                createRulesDeviceTable(tx, ruleDeviceRows)
            }, errorRD, queryCreateSuccess);


        }

        function errorbackupCB(err) {
            wemoUtil.infoLog(wemoUtil.TAG,"Error backup ruledevices " + err);
        }

        /** Taking backup data for Ruledevices table before droping**/

        /** Droping Ruledevices table to insert new field ZBcapability for LED**/

        function createRulesDeviceTable(tx, ruleDeviceRows) {
            wemoUtil.infoLog(wemoUtil.TAG,"ruleDeviceRows in drop enter " + JSON.stringify(ruleDeviceRows));
            //alert("Pragma 2 Location info");
            tx.executeSql('DROP TABLE IF EXISTS RULEDEVICES');
            tx.executeSql('CREATE TABLE IF NOT EXISTS RULEDEVICES (RuleDevicePK INTEGER PRIMARY KEY, RuleID INTEGER, DeviceID TEXT, GroupID INTEGER, DayID INTEGER, StartTime INTEGER, RuleDuration INTEGER, StartAction REAL, EndAction REAL, SensorDuration INTEGER,Type INTEGER,Value INTEGER,Level INTEGER, ZBCapabilityStart TEXT, ZBCapabilityEnd TEXT,OnModeOffset INTEGER,OffModeOffset INTEGER,CountdownTime INTEGER,EndTime INTEGER)');
        }

        function errorRD(err) {
            wemoUtil.infoLog(wemoUtil.TAG,"Error creating LocationInfo table device " + err);
        }

        function queryCreateSuccess(tx) {
            wemoUtil.infoLog(wemoUtil.TAG,"ruleDeviceRows in drop enter success " + JSON.stringify(ruleDeviceRows));
            db.transaction(dumpingBackupRD, errordumpingBackupRD);
        }

        function dumpingBackupRD(tx) {
            wemoUtil.infoLog(wemoUtil.TAG,"ruleDeviceRows in drop enter success second" + JSON.stringify(ruleDeviceRows));
            var zbcapabilitystart = "";
            var zbcapabilityend = "";
            var Onmodeoffset = "";
            var Offmodeoffset = "";
            var CountdownTime = "";
            var productName = "";


            for (var i = 0; i < ruleDeviceRows.length; i++) {
                wemoUtil.infoLog(wemoUtil.TAG,"34343434--" + ruleDeviceRows[i].RuleID + "--" + ruleDeviceRows[i].DeviceID + "---" + ruleDeviceRows[i].ZBCapabilityStart + "---" + ruleDeviceRows[i].ZBCapabilityEnd);

                if (ruleDeviceRows[i].ZBCapabilityStart != "" || ruleDeviceRows[i].ZBCapabilityStart != undefined) {
                    zbcapabilitystart = ruleDeviceRows[i].ZBCapabilityStart;
                }

                if (ruleDeviceRows[i].ZBCapabilityEnd != "" || ruleDeviceRows[i].ZBCapabilityEnd != undefined) {
                    zbcapabilityend = ruleDeviceRows[i].ZBCapabilityEnd;
                }

                if (ruleDeviceRows[i].OnModeOffset != "" || ruleDeviceRows[i].OnModeOffset != undefined) {
                    Onmodeoffset = ruleDeviceRows[i].OnModeOffset;
                }

                if (ruleDeviceRows[i].OffModeOffset != "" || ruleDeviceRows[i].OffModeOffset != undefined) {
                    Offmodeoffset = ruleDeviceRows[i].OffModeOffset;
                }

                if (ruleDeviceRows[i].CountdownTime != "" || ruleDeviceRows[i].CountdownTime != undefined) {
                    CountdownTime = ruleDeviceRows[i].CountdownTime;
                }


                wemoUtil.infoLog(wemoUtil.TAG,'INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd,Onmodeoffset,Offmodeoffset,CountdownTime) VALUES (' + ruleDeviceRows[i].RuleID + ',"' + ruleDeviceRows[i].DeviceID + '", ' + ruleDeviceRows[i].GroupID + ', "' + ruleDeviceRows[i].DayID + '", "' + ruleDeviceRows[i].StartTime + '","' + ruleDeviceRows[i].RuleDuration + '", ' + ruleDeviceRows[i].StartAction + ', ' + ruleDeviceRows[i].EndAction + ', "' + ruleDeviceRows[i].SensorDuration + '",' + ruleDeviceRows[i].Type + ',"' + ruleDeviceRows[i].Value + '","' + ruleDeviceRows[i].Level + '","' + zbcapabilitystart + '","' + zbcapabilityend + '",' + Onmodeoffset + ',' + Offmodeoffset + ',' + CountdownTime + ')');
                tx.executeSql('INSERT INTO RULEDEVICES (RuleID, DeviceID, GroupID, DayID, StartTime,RuleDuration, StartAction, EndAction, SensorDuration,Type,Value,Level, ZBCapabilityStart, ZBCapabilityEnd,Onmodeoffset,Offmodeoffset,CountdownTime) VALUES (' + ruleDeviceRows[i].RuleID + ',"' + ruleDeviceRows[i].DeviceID + '", ' + ruleDeviceRows[i].GroupID + ', "' + ruleDeviceRows[i].DayID + '", "' + ruleDeviceRows[i].StartTime + '","' + ruleDeviceRows[i].RuleDuration + '", ' + ruleDeviceRows[i].StartAction + ', ' + ruleDeviceRows[i].EndAction + ', "' + ruleDeviceRows[i].SensorDuration + '",' + ruleDeviceRows[i].Type + ',"' + ruleDeviceRows[i].Value + '","' + ruleDeviceRows[i].Level + '","' + zbcapabilitystart + '","' + zbcapabilityend + '",' + Onmodeoffset + ',' + Offmodeoffset + ',' + CountdownTime + ')');
            }

            wemoUtil.infoLog(wemoUtil.TAG,"Success creating LocationInfo table device");
        }

        function errordumpingBackupRD(err) {
            wemoUtil.infoLog(wemoUtil.TAG,"Error creating LocationInfo table device second " + err);
        }

        /** Droping Ruledevices table to insert new field ZBcapability for LED END**/

    },

    downloadDB: function(goBack, callback) {

    	wemoUtil.infoLog(TAG, 'Entered downloadDB');
        deviceTabPlugin.execute(function(pragaVersion) {

            wemoUtil.infoLog(TAG, "JSON.stringify(pragaVersion) : " + JSON.stringify(pragaVersion));

            if (parseInt(pragaVersion) > SQLColumns.MAX_DB_VERSION) {
                wemoUtil.hideModal();
                wemoUtil.loadUrl(filePath.UPDATE_APP);
            } else {
            	wemoUtil.infoLog(TAG, "parseInt(pragaVersion).." + parseInt(pragaVersion));
                var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, -1);
                if (parseInt(pragaVersion) === 2) {

                    db.transaction(createRulesTable, error, success);

                    function createRulesTable(tx) {
                        tx.executeSql('DROP TABLE IF EXISTS LOCATIONINFO');
                        tx.executeSql('CREATE TABLE IF NOT EXISTS LOCATIONINFO (LocationPK, cityName, countryName, latitude, longitude, countryCode, region)');
                    }

                    function error(err) {
                    	 wemoUtil.infoLog(TAG, "Error creating LocationInfo table " + err);
                    }

                    function success(tx) {
                    	 wemoUtil.infoLog(TAG, "Success creating LocationInfo table ");
                    }
                }


                if (parseInt(pragaVersion) !== parseInt(SQLColumns.MAX_DB_VERSION)){
                        setTimeout(function() {
                            deviceTabPlugin.execute(null, null, actions.WRITE_PRAGA_VERSION, [SQLColumns.MAX_DB_VERSION]);
                        }, 100);
                }


                wemoUtil.openRules(db, goBack, callback);

            }

        }, wemoUtil.reportError, actions.READ_DB_FROM_PLUGIN, []);
    },

    openRules: function(db, goBack, callback) {

        function errorCB(err) {
            wemoUtil.loadUrl(filePath.CREATE_RULE);
        }


        function successCB() {
        	wemoUtil.infoLog(TAG,  "success! openRules");
            db.transaction(getDB, errorCB);
        }

        function getDB(tx) {
            tx.executeSql("SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.ZBCapabilityStart, b.ZBCapabilityEnd, b.OnModeOffset, b.OffModeOffset, b.CountdownTime from RULES a inner join RULEDEVICES b on a.RuleID=CAST(b.RuleID AS CHAR) order by a.Name COLLATE NOCASE", [], querySuccess, errorCB);
        }

        function querySuccess(tx, results) {
        	 wemoUtil.infoLog(TAG, "Fetching Data =>" + results.rows.length);
            if (goBack == sessionStore.LOCATION_SETTINGS) {
                wemoUtil.hideModal();
                wemoUtil.loadPreviousUrl();
            } else if (goBack == sessionStore.MORE_LOCATION_SETTINGS) {
                wemoUtil.hideModal();
                if(callback) {
                console.log('call this callback');
                callback();
                }
//                wemoUtil.loadUrl(filePath.MORE_SETTING_ABOUT);
            } else {
                var len = results.rows.length;
                var ruleRows = [];
                if (len > 0) {
                    for (var i = 0; i < len; i++) {
                        ruleRows[i] = results.rows.item(i);
                    }
                    window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));
                    /**
                     * Check the BLOCKEDRULES go through the autoEnableBlockedRules
                     * Then redirect to enabled rules page.
                     **/
                    wemoUtil.autoEnableBlockedRules();
                } else {
                    window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));
                    wemoUtil.loadUrl(filePath.CREATE_RULE);
                }
            }
        }

        db.transaction(successCB, errorCB);
        wemoUtil.infoLog(TAG, "Fetching Data Complete");
    },

    autoEnableBlockedRules: function() {
        /**
         * First Check in BLOCKEDRULES len > 0 True|False
         * True -> get RuleID of all the Blocked Rules
         *        -> get UDN of all the Rules, based on Blocked Rules' ID
         *        -> Iterate this object or in the UDN loop itself call a plug-in to get the firmware version
         *        -> If firmware version is got updated
         *            -> True - Update the respective rules Status=1
         *            -> and delete the respective record from BlockedRules Table.
         *            -> False - Don't do anything just continue the flow and display the Rules List [enabled_rules.js]
         * False -> Don't do anything just continue the flow and display the Rules List [enabled_rules.js]
         * */
        wemoUtil.infoLog(wemoUtil.TAG,"Starting checking Blocked Rules in BLOCKEDRULES...");
        var blockedRulesIDs = "";
        var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
        db.transaction(getBlockedRulesID, errorCB, checkBlockedRulesInDB_SuccessCB);

        function getBlockedRulesID(tx) {
            wemoUtil.infoLog(wemoUtil.TAG,"BLOCKEDRULES - Records*************************");
            tx.executeSql("SELECT * FROM BLOCKEDRULES", [], checkBlockedRulesInDBQuerySuccess, errorCB);
            wemoUtil.infoLog(wemoUtil.TAG,"BLOCKEDRULES - Records*************************");
        }

        function checkBlockedRulesInDBQuerySuccess(tx, results) {
            var len = results.rows.length;
            wemoUtil.infoLog(wemoUtil.TAG,"BLOCKEDRULES - Records Len -   " + len);
            if (len > 0) {
                wemoUtil.infoLog(wemoUtil.TAG,"BLOCKEDRULES - Records Len -   " + len);
                //var ruleRows=[];

                for (var i = 0; i < len; i++) {
                    //ruleRows[i]=results.rows.item(i);
                    wemoUtil.infoLog(wemoUtil.TAG,"##########################################");
                    wemoUtil.infoLog(wemoUtil.TAG,"BLOCKEDRULES - Records    " + "Primarykey:  " + results.rows.item(i).Primarykey + "  ::  " + "ruleId:  " + results.rows.item(i).ruleId);
                    var temp = (i < len - 1) ? "," : "";
                    blockedRulesIDs = blockedRulesIDs + results.rows.item(i).ruleId + temp;
                }
                wemoUtil.infoLog(wemoUtil.TAG,"########### " + blockedRulesIDs + " ############");
                if (blockedRulesIDs != "") {
                    wemoUtil.infoLog(wemoUtil.TAG,"blockedRulesIDs == " + blockedRulesIDs + " ############");
                    db.transaction(getBlockedRulesData, errorCB, getBlockedRulesDataFromDB_SuccessCB);
                }
            } else {
                //--------------------------------
                //				alert("getRulesForEnabledList  2 :");
                wemoUtil.getRulesForEnabledList();
                //--------------------------------
            }
        }

        function getBlockedRulesData(tx) {
            wemoUtil.infoLog(wemoUtil.TAG,"########### getBlockedRulesData() ############");
            tx.executeSql("SELECT * FROM RULEDEVICES WHERE RuleID in (" + blockedRulesIDs + ")", [], getBlockedRulesDataQuerySuccess, errorCB);
        }

        function getBlockedRulesDataQuerySuccess(tx, results) {
            var len = results.rows.length;
            wemoUtil.infoLog(wemoUtil.TAG,"getBlockedRulesDataQuerySuccess - Records Len -   " + len);
            if (len > 0) {
                wemoUtil.infoLog(wemoUtil.TAG,"getBlockedRulesDataQuerySuccess - Records Len -   " + len);
                //var ruleRows=[];
                var previousRuleIDInLoop = "";
                var isFirmWareSupported = "true";
                var tempBooleanHolder = "";
                var ruleIDsOfUpdatedFirmwareDevices = "";
                for (var i = 0; i < len; i++) {
                    //ruleRows[i]=results.rows.item(i);
                    wemoUtil.infoLog(wemoUtil.TAG,"getBlockedRulesDataQuerySuccess - [" + i + "] -- " + "RuleID:  " + results.rows.item(i).RuleID + "  ::  " + "DeviceID:  " + results.rows.item(i).DeviceID);
                    tempBooleanHolder = wemoUtil.getFirmwareVersionSRSS(results.rows.item(i).DeviceID);
                    wemoUtil.infoLog(wemoUtil.TAG,"tempBooleanHolder:  " + tempBooleanHolder);
                    if (tempBooleanHolder === "false") {
                        isFirmWareSupported = "false";
                    }
                    previousRuleIDInLoop = results.rows.item(i).RuleID;

                    if (previousRuleIDInLoop != 0 && previousRuleIDInLoop != results.rows.item(i).RuleID) {
                        wemoUtil.infoLog(wemoUtil.TAG,previousRuleIDInLoop + " != 0 && " + previousRuleIDInLoop + " != " + results.rows.item(i).RuleID);
                        wemoUtil.infoLog(wemoUtil.TAG,"Check firmware of all the devices for this Rule[" + previousRuleIDInLoop + "]");
                        if (isFirmWareSupported === "true") {
                            wemoUtil.infoLog(wemoUtil.TAG,"Change the Status of RuleID[" + previousRuleIDInLoop + "] = 1");
                            //previousRuleIDInLoop = "";
                            ruleIDsOfUpdatedFirmwareDevices = ruleIDsOfUpdatedFirmwareDevices + results.rows.item(i).RuleID + ",";
                            isFirmWareSupported = "true";
                        } else {
                            wemoUtil.infoLog(wemoUtil.TAG,"Don't change the Status of RuleID[" + previousRuleIDInLoop + "]");
                        }

                    } else if (previousRuleIDInLoop == "") {
                        ruleIDsOfUpdatedFirmwareDevices = results.rows.item(i).RuleID + ",";
                    }


                } //for ended

                if (ruleIDsOfUpdatedFirmwareDevices != "" && isFirmWareSupported == "true") {

                    wemoUtil.infoLog(wemoUtil.TAG,"Change the Status of RuleIDs11[" + ruleIDsOfUpdatedFirmwareDevices + "] = 1");
                    ruleIDsOfUpdatedFirmwareDevices = ruleIDsOfUpdatedFirmwareDevices.substr(0, ruleIDsOfUpdatedFirmwareDevices.length - 1);
                    wemoUtil.infoLog(wemoUtil.TAG,"Change the Status of RuleIDs22[" + ruleIDsOfUpdatedFirmwareDevices + "] = 1");

                    wemoUtil.setStatus_1_ToBlockedRule(ruleIDsOfUpdatedFirmwareDevices);
                } else {
                    //--------------------------------
                    //alert("#Firmware is not supported#");
                    wemoUtil.getRulesForEnabledList();
                    //--------------------------------
                }
            } else {
                wemoUtil.loadUrl(filePath.ENABLED_RULES);
            }
        }

        function errorCB(error) {
            wemoUtil.infoLog(wemoUtil.TAG,"Error - ::  " + error);
            wemoUtil.infoLog(wemoUtil.TAG,"Error - ::  " + error.message);
        }

        function getBlockedRulesDataFromDB_SuccessCB() {
            wemoUtil.infoLog(wemoUtil.TAG,"Success! - getBlockedRulesDataFromDB_SuccessCB");
        }

        function checkBlockedRulesInDB_SuccessCB() {
            wemoUtil.infoLog(wemoUtil.TAG,"Success! - checkBlockedRulesInDB_SuccessCB");

            //alert("Done with autoEnableBlockedRules redirecting to Enabled Rules Page.");
            wemoUtil.infoLog(wemoUtil.TAG,"Final - Done with autoEnableBlockedRules.");
        }
    },
    setStatus_1_ToBlockedRule: function(ruleIDs) {

        wemoUtil.infoLog(wemoUtil.TAG,"Changing Status to 1 of Blocked Rules..." + ruleIDs);
        var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
        db.transaction(enableBlockedRules, errorCB, enableBlockedRules_SuccessCB);

        function enableBlockedRules(tx) {

            var arrRuleID = ruleIDs.split(',');
            wemoUtil.infoLog(wemoUtil.TAG,"arrRuleID1:  " + arrRuleID.length + "  ::  " + arrRuleID);
            var strRuleID = "";

            for (var i = 0; i < arrRuleID.length; i++) {
                strRuleID += "'" + arrRuleID[i] + "',";
            }

            strRuleID = strRuleID.substr(0, strRuleID.length - 1);
            wemoUtil.infoLog(wemoUtil.TAG,'UPDATE RULES SET State="1" WHERE RuleID IN (' + strRuleID + ');');
            tx.executeSql('UPDATE RULES SET State="1" WHERE RuleID IN (' + strRuleID + ');', [], enableBlockedRulesQuerySuccess, errorCB);

        }

        function errorCB(error) {
            wemoUtil.infoLog(wemoUtil.TAG,"Error - ::  " + error);
            wemoUtil.infoLog(wemoUtil.TAG,"Error - ::  " + error.message);
        }

        function enableBlockedRulesQuerySuccess(tx, success) {
            var strRuleID = "";

            var arrRuleIDdel = ruleIDs.split(',');
            wemoUtil.infoLog(wemoUtil.TAG,"arrRuleID2:  " + arrRuleIDdel.length + "  ::  " + arrRuleIDdel);

            for (var j = 0; j < arrRuleIDdel.length; j++) {

                strRuleID += "'" + arrRuleIDdel[j] + "',";

                wemoUtil.infoLog(wemoUtil.TAG,'DELETE FROM BLOCKEDRULES WHERE ruleId = ' + arrRuleIDdel[j] + ';');
                tx.executeSql('DELETE FROM BLOCKEDRULES WHERE ruleId = ' + arrRuleIDdel[j] + ';', [],

                    function() {
                        wemoUtil.infoLog(wemoUtil.TAG,'inside DELETE FROM BLOCKEDRULES WHERE ruleId = ' + arrRuleIDdel[j] + ';');
                        //alert("Deleted From BlockedRules");
                    }, errorCB);
            }

            strRuleID = strRuleID.substr(0, strRuleID.length - 1);
            wemoUtil.infoLog(wemoUtil.TAG,"join rule id:  " + strRuleID);
            wemoUtil.infoLog(wemoUtil.TAG,"UPDATE RULES Success! - getBlockedRulesIDQuerySuccess - ruleIDs - " + ruleIDs);

            tx.executeSql("SELECT * FROM RULES WHERE RuleID IN ('1')", [], function(tx, results) {
                var len = results.rows.length;
                wemoUtil.infoLog(wemoUtil.TAG,"Checking the update - Records Len -   " + len);
                if (len > 0) {
                    wemoUtil.infoLog(wemoUtil.TAG,"Checking the update - Records Len -   " + len);
                    //var ruleRows=[];
                    var previousRuleIDInLoop = "";
                    var isFirmWareSupported = "true";
                    var tempBooleanHolder = "false";
                    var ruleIDsOfUpdatedFirmwareDevices = "";
                    for (var i = 0; i < len; i++) {
                        wemoUtil.infoLog(wemoUtil.TAG,"Checking the update - [" + i + "] -- " + "RuleID:  " + results.rows.item(i).RuleID + "  ::  " + "Status:  " + results.rows.item(i).State);
                    }
                }
            }, errorCB);

            wemoUtil.infoLog(wemoUtil.TAG,'SELECT distinct a.RuleID, a.Name, b.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.Level from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID where a.RuleID IN (' + strRuleID + ') order by a.Name COLLATE NOCASE;');
            tx.executeSql('SELECT distinct a.RuleID, a.Name, b.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.Level from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID where a.RuleID IN (' + strRuleID + ') order by a.Name COLLATE NOCASE', [], function(tx, results) {
                var len = results.rows.length;
                wemoUtil.infoLog(wemoUtil.TAG,"SELECT distinct len: [0] " + len);
                wemoUtil.infoLog(wemoUtil.TAG,'SELECT distinct a.RuleID, a.Name, b.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.Level from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID where a.RuleID IN (' + strRuleID + ') order by a.Name COLLATE NOCASE;');
                //try{
                var rule;
                var sensors = [],
                    switches = [];
                if (len > 0) {
                    for (var i = 0; i < len; i++) {
                        wemoUtil.infoLog(wemoUtil.TAG,"Flow [0-1]:rule  " + rule);
                        if (rule == null) {
                            wemoUtil.infoLog(wemoUtil.TAG,"Flow [0-2T]:rule  " + rule + "  ::  " + results.rows.item(i).DeviceID);
                            rule = results.rows.item(i);
                            rule.When = {};
                            rule.Devices = {};
                            rule.Sensors = {};
                        } else {
                            wemoUtil.infoLog(wemoUtil.TAG,"Flow [0-2F]:rule  " + rule + "  ::  " + results.rows.item(i).DeviceID);
                            var prevRule = rule;
                            wemoUtil.infoLog(wemoUtil.TAG,"Flow [0-2F]:prevRule.When  " + prevRule.When + "  ::prevRule.Devices  " + prevRule.Devices + "  ::prevRule.Sensors  " + prevRule.Sensors);
                            rule = results.rows.item(i);
                            rule.When = prevRule.When;
                            rule.Devices = prevRule.Devices;
                            rule.Sensors = prevRule.Sensors;
                            wemoUtil.infoLog(wemoUtil.TAG,"Flow [0-2F]:rule.When  " + rule.When + "  ::rule.Devices  " + rule.Devices + "  ::rule.Sensors  " + rule.Sensors);
                        }

                        wemoUtil.infoLog(wemoUtil.TAG,"Flow [0-3]:rule.When  " + rule.When + "  ::rule.Devices  " + rule.Devices + "  ::rule.Sensors  " + rule.Sensors);


                        wemoUtil.infoLog(wemoUtil.TAG,"a.RuleID:  " + rule.RuleID + "\n" +
                            "a.Name:  " + rule.Name + "\n" +
                            "b.Type:  " + rule.Type + "\n" +
                            "a.State:  " + rule.State + "\n" +
                            "b.StartTime:  " + rule.StartTime + "\n" +
                            "b.DayID:  " + rule.DayID + "\n" +
                            "b.RuleDuration:  " + rule.RuleDuration + "\n" +
                            "b.StartTime:  " + rule.StartTime + "\n" +
                            "b.DeviceID:  " + rule.DeviceID + "\n" +
                            "b.StartAction:  " + rule.StartAction + "\n" +
                            "b.EndAction:  " + rule.EndAction + "\n" +
                            "b.SensorDuration:  " + rule.SensorDuration + "\n" +
                            "b.Value:  " + rule.Value + "\n" +
                            "b.Level:  " + rule.Level);
                        rule.SelectedSensors = '';
                        rule.SelectedDayOrRange = '';

                        wemoUtil.infoLog(wemoUtil.TAG,"typeof rule:  " + typeof(rule) + "  ::  " + rule);
                        wemoUtil.infoLog(wemoUtil.TAG,"Flow [1]:rule.Type  " + rule.Type + "  ::  " + results.rows.item(i).Type);
                        wemoUtil.infoLog(wemoUtil.TAG,"Flow [1-0]:sensors  " + sensors + "  ::  switches:  " + switches);
                        if (rule.Type == '0') sensors.push(rule);
                        else if (rule.Type == '-1') switches.push(rule);
                        wemoUtil.infoLog(wemoUtil.TAG,"Flow [1-1]:sensors  " + sensors + "  ::  switches:  " + switches);

                        //Populate rules Object for further editing

                        function trimDays(totDays) {
                            var uniqueDays = [];

                            $.each(totDays, function(i, el) {
                                if ($.inArray(el, uniqueDays) === -1) uniqueDays.push(el);
                            });
                            return uniqueDays;

                        }

                        wemoUtil.infoLog(wemoUtil.TAG,"Flow [2]: sensors.length " + sensors.length);
                        wemoUtil.infoLog(wemoUtil.TAG,"Flow [3]: switches.length " + switches.length);
                        if (sensors.length > 0 && switches.length > 0) {
                            for (var se = 0; se < sensors.length; se++) {
                                switchLoop();
                                rule.SelectedSensors += sensors[se].DeviceID + ",";
                                rule.SelectedSensorsValue = sensors[se].Value;
                                wemoUtil.infoLog(wemoUtil.TAG,"Value : " + rule.SelectedSensorsValue + "\n");

                            }
                            var sens = rule.SelectedSensors;
                            var arrSensors = sens.split(",");
                            arrSensors.pop();
                            rule.SelectedSensors = arrSensors.join(',');
                            var totDays = rule.SelectedDayOrRange.split('-');
                            totDays.pop();
                            rule.SelectedDayOrRange = trimDays(totDays).join('-');


                        } else if (switches.length > 0) {
                            switchLoop();
                            var totDays = rule.SelectedDayOrRange.split('-');
                            totDays.pop();
                            rule.SelectedDayOrRange = trimDays(totDays).join('-');

                        }
                        wemoUtil.infoLog(wemoUtil.TAG,"Flow [4]: ");

                        function switchLoop() {
                            for (var sw = 0; sw < switches.length; sw++) {
                                wemoUtil.infoLog(wemoUtil.TAG,"Flow [5]: switches[sw].DayID " + switches[sw].DayID);
                                var day = wemoUtil.returnDay(switches[sw].DayID);
                                wemoUtil.infoLog(wemoUtil.TAG,"Flow [5]: switches[sw].DeviceID " + switches[sw].DeviceID);

                                rule.Devices[switches[sw].DeviceID] = {};

                                wemoUtil.infoLog(wemoUtil.TAG,"Flow [5]: switches[sw].StartAction " + switches[sw].StartAction);
                                rule.Devices[switches[sw].DeviceID].StartAction = switches[sw].StartAction;
                                wemoUtil.infoLog(wemoUtil.TAG,"Flow [5]: switches[sw].EndAction " + switches[sw].EndAction);
                                rule.Devices[switches[sw].DeviceID].EndAction = switches[sw].EndAction;
                                wemoUtil.infoLog(wemoUtil.TAG,"Flow [5]: switches[sw].SensorDuration " + switches[sw].SensorDuration);
                                rule.Devices[switches[sw].DeviceID].SensorDuration = switches[sw].SensorDuration;
                                wemoUtil.infoLog(wemoUtil.TAG,"Flow [5]: switches[sw].Value " + switches[sw].Value);
                                rule.Devices[switches[sw].DeviceID].SelectedSensorsValue = switches[sw].Value;

                                rule.Devices[switches[sw].DeviceID].FName = "";
                                wemoUtil.infoLog(wemoUtil.TAG,"Flow [5]: switches[sw].StartTime " + switches[sw].StartTime);
                                rule.When.StartTime = switches[sw].StartTime;
                                wemoUtil.infoLog(wemoUtil.TAG,"Flow [5]: switches[sw].RuleDuration " + switches[sw].RuleDuration);
                                rule.When.RuleDuration = switches[sw].RuleDuration;

                                rule.SelectedDayOrRange += day + '-';

                                wemoUtil.infoLog(wemoUtil.TAG,"RuleID : " + rule.RuleID + "\n" +
                                    "DeviceID : " + switches[sw].DeviceID + "\n" +
                                    "StartAction : " + rule.Devices[switches[sw].DeviceID].StartAction + "\n" +
                                    "EndAction : " + rule.Devices[switches[sw].DeviceID].EndAction + "\n" +
                                    "SensorDuration :" + rule.Devices[switches[sw].DeviceID].SensorDuration + "\n" +
                                    "StartTime : " + rule.When.StartTime);
                                wemoUtil.infoLog(wemoUtil.TAG,"Flow [5]---:Object.keys(rule.Devices).length  " + Object.keys(rule.Devices).length);
                            }
                        }

                        //----------------------
                        wemoUtil.infoLog(wemoUtil.TAG,"Flow [6]:---" + rule.SelectedSensors + " != undefined && " + rule.SelectedSensors + " != ");
                        if (rule.SelectedSensors != undefined && rule.SelectedSensors != '') {
                            var arrSensors = rule.SelectedSensors.split(",");

                            for (var sensorsCount = 0; sensorsCount < arrSensors.length; sensorsCount++) {
                                wemoUtil.infoLog(wemoUtil.TAG,"Flow [6]:WemoUtil - successCB: [1]: wemoUtil.pushSensorScheduleStrWithSun " + rule + "," + db + "," + arrSensors[sensorsCount] + "," + sensorsCount);
                                wemoUtil.pushSensorScheduleStrWithSun(rule, db, arrSensors[sensorsCount], sensorsCount);
                            }

                        } else {
                            wemoUtil.infoLog(wemoUtil.TAG,"Flow [7]: ");
                            var locationInfo = {};
                            db.transaction(getMax, errorCB, successCB);

                            function getMax(tx) {
                                wemoUtil.infoLog(wemoUtil.TAG,"Flow [8]: ");
                                tx.executeSql("SELECT * FROM LOCATIONINFO", [], selectQuerySuccess, errorCB);
                            }

                            function selectQuerySuccess(tx, results) {
                                var len = results.rows.length;
                                wemoUtil.infoLog(wemoUtil.TAG,"Flow [9]:len " + len + "  ::  " + actions.SUN_TIME);
                                if (len > 0 || actions.SUN_TIME == false) {
                                    var entry = results.rows.item(0);

                                    locationInfo.latitude = entry.latitude;
                                    locationInfo.longitude = entry.longitude;

                                    nativeUtilPlugin.execute(function(par) {
                                        wemoUtil.infoLog(wemoUtil.TAG,"Object.keys(rule.Devices):  " + rule.Devices + " ::  " + typeof(rule.Devices)); //+Object.keys(rule.Devices));
                                        wemoUtil.infoLog(wemoUtil.TAG,"Flow [9]:Object.keys(rule.Devices).length " + Object.keys(rule.Devices).length);
                                        if (Object.keys(rule.Devices).length > 0) {
                                            if (actions.SUN_TIME) {
                                                for (var dev = 0; dev < Object.keys(rule.Devices).length; dev++) {
                                                    wemoUtil.infoLog(wemoUtil.TAG,"Flow [9]:WemoUtil - successCB: [2]: wemoUtil.pushSwitchScheduleStrWithSun " + Object.keys(rule.Devices)[dev] + "," + db + "," + rule + "," + dev + "," + locationInfo + "," + par);
                                                    wemoUtil.pushSwitchScheduleStrWithSun(Object.keys(rule.Devices)[dev], db, rule, dev, locationInfo, par);
                                                }
                                            } else {
                                                for (var dev1 = 0; dev < Object.keys(rule.Devices).length; dev1++) {
                                                    wemoUtil.infoLog(wemoUtil.TAG,"Flow [9]:WemoUtil - successCB: [3]: wemoUtil.pushSwitchScheduleStr " + Object.keys(rule.Devices)[dev1] + "," + db + "," + rule + "," + dev1);
                                                    wemoUtil.pushSwitchScheduleStr(Object.keys(rule.Devices)[dev1], db, rule, dev1);
                                                }
                                            }
                                        }

                                    }, function(err) {
                                        wemoUtil.infoLog(wemoUtil.TAG,"Error " + err);
                                    }, actions.GET_SR_SS_TIME, [locationInfo.latitude, locationInfo.longitude]);


                                } else if (actions.SUN_TIME) {
                                    wemoUtil.infoLog(wemoUtil.TAG,"Flow [10]:len " + actions.SUN_TIME);
                                    nativeUtilPlugin.execute(
                                        function(params) {
                                            wemoUtil.infoLog(wemoUtil.TAG,"Flow [11]:LOCATIONINFO - not available in DB getting Lat/Long from Java!!!! " + params.length);
                                                $.each(params, function(index) {
                                                    wemoUtil.infoLog(wemoUtil.TAG,"prop:  " + index + "  ::  value:  " + params[index]);
                                                    switch (index) {
                                                        case 0:
                                                            locationInfo.cityName = params[index];
                                                            break;
                                                        case 1:
                                                            locationInfo.countryName = params[index];
                                                            break;
                                                        case 2:
                                                            locationInfo.latitude = params[index];
                                                            break;
                                                        case 3:
                                                            locationInfo.longitude = params[index];
                                                            break;
                                                        case 4:
                                                            locationInfo.countryCode = params[index];
                                                            break;
                                                        case 5:
                                                            locationInfo.region = params[index];
                                                            break;
                                                        default:
                                                            wemoUtil.infoLog(wemoUtil.TAG,"default");
                                                            break;
                                                    }
                                                });

                                                nativeUtilPlugin.execute(function(par) {
                                                    wemoUtil.infoLog(wemoUtil.TAG,"Flow [12]:Object.keys(rule.Devices):  " + rule.Devices + " ::  " + typeof(rule.Devices)); //+Object.keys(rule.Devices));
                                                    wemoUtil.infoLog(wemoUtil.TAG,"Flow [12]: " + Object.keys(rule.Devices).length);
                                                    if (Object.keys(rule.Devices).length > 0) {
                                                        wemoUtil.infoLog(wemoUtil.TAG,"Flow [12]: " + actions.SUN_TIME);
                                                        if (actions.SUN_TIME) {
                                                            wemoUtil.infoLog(wemoUtil.TAG,"Flow [12]: " + Object.keys(rule.Devices).length);
                                                            for (var dev = 0; dev < Object.keys(rule.Devices).length; dev++) {
                                                                wemoUtil.infoLog(wemoUtil.TAG,"Flow [12]:WemoUtil - successCB: [4]: wemoUtil.pushSwitchScheduleStrWithSun " + Object.keys(rule.Devices)[dev] + "," + db + "," + rule + "," + dev + "," + locationInfo + "," + par);
                                                                wemoUtil.pushSwitchScheduleStrWithSun(Object.keys(rule.Devices)[dev], db, rule, dev, locationInfo, par);
                                                            }
                                                        } else {
                                                            wemoUtil.infoLog(wemoUtil.TAG,"Flow [12]: " + Object.keys(rule.Devices).length);
                                                            for (var dev1 = 0; dev < Object.keys(rule.Devices).length; dev1++) {
                                                                wemoUtil.infoLog(wemoUtil.TAG,"Flow [12]:WemoUtil - successCB: [5]: wemoUtil.pushSwitchScheduleStr " + Object.keys(rule.Devices)[dev1] + "," + db + "," + rule + "," + dev1);
                                                                wemoUtil.pushSwitchScheduleStr(Object.keys(rule.Devices)[dev1], db, rule, dev1);
                                                            }
                                                        }
                                                    }
                                                    wemoUtil.infoLog(wemoUtil.TAG,"Flow [12]:");

                                                }, function(err) {
                                                    wemoUtil.infoLog(wemoUtil.TAG,"Error " + err);
                                                }, actions.GET_SR_SS_TIME, [locationInfo.latitude, locationInfo.longitude]);

                                        },
                                        function(err) {
                                            //  alert("City not found!");
                                        }, actions.GET_LOCATION_INFO, []
                                    );
                                }
                            }

                            function successCB() {
                                wemoUtil.infoLog(wemoUtil.TAG,"Flow [13]:");
                            }

                            function errorCB() {
                                wemoUtil.infoLog(wemoUtil.TAG,"Flow [14]:");
                            }
                        }
                    }
                } else {
                    wemoUtil.infoLog(wemoUtil.TAG,"Flow [15]:");
                    tx.executeSql('UPDATE RULES SET State="1" WHERE RuleID in (' + strRuleID + ')', [], function() {}, function() {});
                    return failureCallbackGB();
                }
                /*}catch(error){
                     wemoUtil.infoLog(wemoUtil.TAG,"Error while performing soft reset!\n"+error.message);
                     alert("Error while performing soft reset!\n"+error.message);
                     tx.executeSql('UPDATE RULES SET State="1" WHERE RuleID in ('+needToDisableRules+')', [],function(){},function(){});
                     return failureCallbackGB();
                     }*/
            }, errorCB);

        }

        function enableBlockedRules_SuccessCB(tx) {

            wemoUtil.infoLog(wemoUtil.TAG,"Success! - enableBlockedRules_SuccessCB - ruleIDs - " + ruleIDs);
            wemoUtil.infoLog(wemoUtil.TAG,"Redirecting to Enabled List!!!!!!!!!");
            wemoUtil.infoLog(wemoUtil.TAG,"Pushing updated DB to Plugin.");

            /*************************************/
            //wemoUtil.pushDB(sessionStore.RULES_LOCATION_SETTINGS);
            //--------------------------------
            //alert("getRulesForEnabledList  3 :");
            wemoUtil.getRulesForEnabledList();
            //--------------------------------
        }
    },
    getRulesForEnabledList: function() {
        //alert("getRulesForEnabledList  1 :");
        var dba = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
        dba.transaction(getDB, errorCB);

        function getDB(tx) {
            wemoUtil.infoLog(wemoUtil.TAG,"function getDB   %%%%%%%%%%%%%%%%%%");
            //tx.executeSql('SELECT distinct a.RuleID, a.Name, b.StartTime, b.RuleDuration, b.DayID from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID where b.DayID <> -1 order by b.RuleID', [], querySuccess, errorCB);
            //tx.executeSql('SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID where b.DayID <> -1 order by b.RuleID', [],querySuccess, errorCB);
            tx.executeSql("SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value,b.ZBCapabilityStart, b.ZBCapabilityEnd, b.OnModeOffset, b.OffModeOffset, b.CountdownTime from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID order by a.Name COLLATE NOCASE", [], querySuccess, errorCB);
        }

        function htmlEscape(str) {
              return String(str)
                          .replace('&', "amp" )
                          .replace('"', "quot")
                          .replace('<', "lt")
                          .replace('>', "gt");
                }

        function querySuccess(tx, results) {
            wemoUtil.infoLog(wemoUtil.TAG,"Fetching Data =>" + results.rows.length);
            var len = results.rows.length;
            var ruleNamePattern = /[A-Za-z0-9._-\s]+$/;
            var ruleRows = [];
            if (len > 0) {
                for (var i = 0; i < len; i++) {
                    ruleRows[i] = results.rows.item(i);
                    var res_validate = ruleNamePattern.test(ruleRows[i].Name);
                    if(!res_validate){
                        ruleRows[i].Name = htmlEscape(ruleRows[i].Name);
                     }
                }
                window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));
                //                navigator.notification.activityStop();
                //wemoUtil.hideModal();
                if (window.sessionStorage.getItem("DeviceList") == "1") {
                    wemoUtil.loadUrl(filePath.DEVICE_LIST);
                } else {
                    if (!isRemoteEnabled) {
                        //check if maker sensor is in off state.
                        var makerSensorInfo = wemoUtil.checkMakerSensorState();
                        wemoUtil.infoLog(wemoUtil.TAG,"after checkMakerSensorState()-->  makerSensorInfo:: " + makerSensorInfo + " zeroth " + makerSensorInfo[0] + " First--> " + makerSensorInfo[1]);
                        if (makerSensorInfo[0] == true) {
                            var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
                            wemoUtil.checkEnabledRulesForMakerSensor(db, makerSensorInfo[1], function(enabledRuleIDs) {
                                if (enabledRuleIDs == "") {
//
                                    wemoUtil.infoLog(wemoUtil.TAG,' checkMakerSensorState:: checkEnabledRulesForMakerSensor() enabledRuleIDs is null');
                                    wemoUtil.loadUrl(filePath.ENABLED_RULES);
                                } else {
                                    wemoUtil.infoLog(wemoUtil.TAG,'checkMakerSensorState:: checkEnabledRulesForMakerSensor() enabledRuleIDs --> ' + enabledRuleIDs);
                                    wemoUtil.disableMakerRules(db, wemoUtil.convertArrayToString(enabledRuleIDs), function(value) {
                                        var params = [];
                                        if (isRemoteEnabled) {
                                            params = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA);
                                            makePush(params);
                                        } else {
                                            wemoUtil.getDevicesWithCallback(actions.SELECT_MAKER, function(makers) {
                                                params = makers;
                                                makePush(params);
                                            });
                                        }

                                        function makePush(params) {
                                            if (params != null && params.length > 0) {
                                                len = params.length;
                                                var udnArray = '';
                                                $.each(params, function(inx) {
                                                    wemoUtil.infoLog(wemoUtil.TAG,"callback disableMakerRules:: makePush in loop udn --> " + params[inx].udn + " inx " + inx);
                                                    udnArray = udnArray + wemoUtil.getMakerSensorUDN(params[inx].udn) + ',';
                                                });
                                                wemoUtil.pushScheduleSensor(udnArray, udnArray.length, len);
                                            }
                                        }
                                    });
                                }
                            });
                        } else
                            wemoUtil.loadUrl(filePath.ENABLED_RULES);
                    } else
                        wemoUtil.loadUrl(filePath.ENABLED_RULES);
                }
            } else {
                window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));
                //                navigator.notification.activityStop();
                // wemoUtil.hideModal();
                wemoUtil.loadUrl(filePath.CREATE_RULE);
            }
        }

        function errorCB(err) {
            wemoUtil.infoLog(wemoUtil.TAG,"Error processing SQL: " + err.code);
        }
    },
    pushDB: function(goBack, callback) {
        wemoUtil.infoLog(wemoUtil.TAG,"##########  pushDB:function()");

        var pendingFirmware = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.PENDING_FIRMWARE);
        wemoUtil.infoLog(wemoUtil.TAG,"pending firmware pushdb---" + pendingFirmware);
        goBackVar = goBack;
        deviceTabPlugin.execute(
            function(e) {
                wemoUtil.infoLog(wemoUtil.TAG, "PUSH DB Successfull: " + e);

                    if (typeof callback == TYPE_OF.FUNCTION) {
                        wemoUtil.infoLog(wemoUtil.TAG, "PUSH DB Success. Callback provided");
                        //send a response back
                        callback();
                    }else{
                        wemoUtil.infoLog(wemoUtil.TAG, "PUSH DB Success. No callback provided");
                        //no callback provided.
                        if (goBack === sessionStore.LOCATION_SETTINGS) {
                            wemoUtil.hideModal();
                            wemoUtil.loadPreviousUrl();
                        } else if (goBack === sessionStore.MORE_LOCATION_SETTINGS) {
                            wemoUtil.hideModal();
                            //wemoUtil.loadUrl(filePath.MORE_SETTING_ABOUT);
                        } else if (pendingFirmware !== null && pendingFirmware === "pendingFirmware") {
                            window.sessionStorage.removeItem(sessionStore.PENDING_FIRMWARE);
                            var fromSaveRulepage = "fromSaveRulepage";
                            wemoUtil.setJSONObjectToSessionStorage(sessionStore.FROM_SAVE_RULE_PAGE, fromSaveRulepage);
                            wemoUtil.hideModal();
                            wemoUtil.loadUrl(filePath.MORE_NEW_FIRMWARE);
                        } else if (goBack === sessionStore.EDIT_DEVICE_SETTING) {
                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                            editDevice.openDeviceListPage();
                        } else if (goBack === sessionStore.RULE_DETAIL_PAGE) {
                            wemoUtil.hideModal();
                            callback();
                        } else {
                            var ruledata = JSON.parse(window.sessionStorage.getItem(sessionStore.RULES_DATA));
                            wemoUtil.infoLog(wemoUtil.TAG, "PUSH DB Success. Rules Data" + ruledata);
                            wemoUtil.hideModal();
                            if (ruledata && (ruledata.length === 0)) {
                                wemoUtil.loadUrl(filePath.CREATE_RULE);
                            } else {
                                wemoUtil.loadUrl(filePath.ENABLED_RULES);
                            }

                        }
                    }
            },
            wemoUtil.reportRuleSaveError,
            actions.PUSH_DB_TO_PLUGIN, []
        );
    },
    reportRuleSaveError : function(e) {
        wemoUtil.infoLog(wemoUtil.TAG, "PUSH_DB_TO_PLUGIN Failure Call back!!!!   " + e);
        devicePlugin.execute(function(e){
                nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                wemoUtil.infoLog(TAG, "Clone DB success");
                if (goBackVar !== sessionStore.LOCATION_SETTINGS) {
                    wemoUtil.showAlertMsg(wemo.items["RuleCannotSave_Title"], wemo.items["RuleCannotSave_Content"], "#ruleSaveFail");
                }

                if(e === ruleErrorMsgs.ERROR_MSG_DB_NOT_IN_SYNC){
                    wemoUtil.getRulesListFromDB(wemoUtil.showRuleNotSavedError);
                } else {
                    //rea DB and refresh sessionStore.RULES_DATA for saved rules
                    var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);

                        db.transaction(getDB, errorCB);

                        function getDB(tx) {
                            tx.executeSql("SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.ZBCapabilityStart, b.ZBCapabilityEnd, b.OnModeOffset, b.OffModeOffset, b.CountdownTime from RULES a inner join RULEDEVICES b on a.RuleID=CAST(b.RuleID AS CHAR) order by b.RuleID", [], querySuccess, errorCB);
                        }

                        function querySuccess(tx, results) {
                            var len = results.rows.length;

                            var ruleRows = [];
                            if (len > 0) {
                                for (var i = 0; i < len; i++) {
                                    ruleRows[i] = results.rows.item(i);
                                    wemoUtil.infoLog(TAG,"Print DB values = " + ruleRows[i].RuleID + " :: " +
                                            ruleRows[i].Name + " :: " +
                                            ruleRows[i].StartTime + " :: " +
                                            ruleRows[i].RuleDuration + " :: " +
                                            ruleRows[i].Value + " :: " +
                                            ruleRows[i].DayID);
                                }
                            }
                            window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));
                         }

                        function errorCB() {
                            wemoUtil.infoLog(TAG, "Error inserting rule");
                        }
                }

                // push_DB_Callback will be defined on each module which will call store rules.
                if(typeof push_DB_Callback != TYPE_OF.UN_DEFINED){
                    push_DB_Callback.errorCB(e);
                }



            },
            wemoUtil.reportError,
            actions.CLONE_DB, [CloneDB.DEFAULT_CLONED_DB_PATH, CloneDB.DEFAULT_DB_PATH]
        );
    },

    showAlertMsg: function(header, message, id) {
        var html = "<div class='alertOverlay'>" +
                        "<div id="+ id +" class='alertPopup'>" +
                        "<div class='msgHeader'>"+ header +"</div>" +
                        "<div class='msgBody'>"+ message +"</div>" +
                        "<div class='msgConfirm'>OK</div>" +
            "</div></div>",
            $body = $("body");

        $(html).appendTo('body');

        //Display Popup
        setTimeout(function(){
                $('.alertPopup').addClass('zoomIn');
                $body.addClass("preventScrolling");
        }, 100);

        $(".alertPopup .msgConfirm").click(function(){
            var self = this;
            $(self).parent().removeClass("zoomIn");

            setTimeout(function(){
                $(self).parents(".alertOverlay").detach();
                $body.removeClass("preventScrolling");
            }, 100);

            return false;
        });
    },


    cloneDB: function() {
        devicePlugin.execute(function(e){
                nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
            },
            wemoUtil.reportError,
            actions.CLONE_DB, [CloneDB.DEFAULT_DB_PATH, CloneDB.DEFAULT_CLONED_DB_PATH]
        );
    },

    pushSchStr: function(jsonObjectStr, isLEDInRule, pushScheduleSwitchCallback, callback, stayDetailPage) {
        if (stayDetailPage === undefined) {
            stayDetailPage = false;
        }
        wemoUtil.infoLog(wemoUtil.TAG,"##########  push Schedule String:function() :: " + jsonObjectStr);

        if(wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_OBJ_BEFORE_EDIT) != null) {
            var editedRuleObject = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.RULE_OBJ_BEFORE_EDIT).Devices;
            if (editedRuleObject != null) {
                //We need to send PUSH_SCH_STR_TO_PLUGIN to all disassociated devices as well.
                var currentJSONObject = JSON.parse(jsonObjectStr);

                //Assuming this  method just adds the processDB flag, using the default weekly values.

                for (keyToCheck in editedRuleObject) {
                    if (!currentJSONObject.hasOwnProperty(keyToCheck)) {
                        var keyToInsert = keyToCheck;
                        for(randomKey in currentJSONObject){
                            if (currentJSONObject.hasOwnProperty(randomKey)) {
                                currentJSONObject[keyToInsert] = currentJSONObject[randomKey];
                                break;
                            }
                        }
                    }
                }

                jsonObjectStr = JSON.stringify(currentJSONObject);
            }
        }

        deviceTabPlugin.execute(
            function(type) {
                wemoUtil.infoLog(wemoUtil.TAG,"type: " + type);
                if (type === networkType.HOME_NETWORK) {
                    wemoUtil.infoLog(wemoUtil.TAG,"home network");
                    wemoUtil.infoLog(wemoUtil.TAG, 'Home scheduled string');
                    deviceTabPlugin.execute(
                        function(e) {
                            wemoUtil.infoLog(wemoUtil.TAG,e);
                            
                            if (isLEDInRule != 1){
                           	    wemoUtil.infoLog(wemoUtil.TAG,'PUSH_SCH_STR RESPONSE REC: LED NOT IN RULE, PROCEEDING WITH PUSH DB');

                               var isMakertypeChanged = false;
                               if (wemoUtil.getJSONObjectFromSessionStorage(sessionStore.EDIT_DEVICE_TYPE_CHANGED) == true) {
                                   isMakertypeChanged = true;
                                   wemoUtil.setJSONObjectToSessionStorage(sessionStore.EDIT_DEVICE_TYPE_CHANGED, false);
                               }
                               if (isMakertypeChanged)
                                   wemoUtil.pushDB(sessionStore.EDIT_DEVICE_SETTING, callback);
                               else {
                                    if (stayDetailPage && (stayDetailPage === sessionStore.RULE_DETAIL_PAGE)) {
                                        wemoUtil.pushDB(sessionStore.RULE_DETAIL_PAGE, callback);
                                    } else {
                                        wemoUtil.pushDB(sessionStore.RULES_LOCATION_SETTINGS, callback);
                                    }
                               }
                           }else{
                           		wemoUtil.infoLog(wemoUtil.TAG, "PUSH_SCH_STR RESPONSE REC: LEDs IN RULE, SENDING CALLBACK FOR LEDs. PUSH DB NOT PROCESSED YET.");
                           		if (pushScheduleSwitchCallback && (typeof pushScheduleSwitchCallback != TYPE_OF.UN_DEFINED)){
                           			pushScheduleSwitchCallback();
                           		}
                           }
                        },
                        wemoUtil.reportError,
                        actions.PUSH_SCH_STR_TO_PLUGIN,
                        [jsonObjectStr]
                    );
                    wemoUtil.infoLog(wemoUtil.TAG,"out of the home network");

                } else if (type === networkType.REMOTE_MOBILE || type === networkType.REMOTE_WIFI) {
                    wemoUtil.infoLog(wemoUtil.TAG,"remote network");
                    wemoUtil.infoLog(wemoUtil.TAG, 'remote scheduled string');
                    devicePlugin.execute(
                        function(enabled) {
                            wemoUtil.infoLog(wemoUtil.TAG,"remote enables");
                            wemoUtil.infoLog(wemoUtil.TAG, 'Remote enabled: ' + enabled);
                            if (enabled) {
                                var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
                                var arrayDimmerObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DIMMER_DATA);
                                var arraySensorObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SENSOR_DATA);
                                var arrayInsightObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA);
                                var arrayMakerObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA);
                                var arrayPIRSensors = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.PIR_DATA);
                                var arrayFobSensors = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.FOB_DATA);
                                var arrayDWSensors = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DWSENSOR_DATA);
                                wemoUtil.infoLog(wemoUtil.TAG, 'switch' + JSON.stringify(arraySwitchObjects));
                                wemoUtil.infoLog(wemoUtil.TAG, 'dimmer' + JSON.stringify(arrayDimmerObjects));
                                wemoUtil.infoLog(wemoUtil.TAG, 'sensors' + JSON.stringify(arraySensorObjects));
                                wemoUtil.infoLog(wemoUtil.TAG, 'insights' + JSON.stringify(arrayInsightObjects));

                                var wemoObject = arraySensorObjects.concat(arraySwitchObjects, arrayDimmerObjects, arrayInsightObjects, arrayMakerObjects, arrayPIRSensors, arrayFobSensors, arrayDWSensors);
                                wemoUtil.infoLog(wemoUtil.TAG, 'wemo object: ' + JSON.stringify(wemoObject));

                                var ruleDevicesDataArray = [];
                                
                                var macAndPluginJsonStr = "{";
                                
                                var isFirstObjInJSONStr = 0;
                                for (var i in wemoObject) {
                                    var Obj = wemoObject[i];
                                    wemoUtil.infoLog(wemoUtil.TAG, 'Searching with UDN from all devices: ' + Obj.udn);
                                    var ObjUDN = Obj.udn;
                                    var tempArray = ObjUDN.split(":");
                                    
                                    //check in JSONOject of weekly calender Strings
                                    var jsonObject = JSON.parse(jsonObjectStr);
                                    
                                    
                                    
                                    for (var ruleDeviceUDN in jsonObject) {
                                    	  if (jsonObject.hasOwnProperty(ruleDeviceUDN)) {
                                    		wemoUtil.infoLog(wemoUtil.TAG, 'Rule UDN: ' + ruleDeviceUDN);
                                    	    var ruleDeviceUDNArray = ruleDeviceUDN.split(':');
                                    	    wemoUtil.infoLog(wemoUtil.TAG, 'Searching for rule UDN: ' + ruleDeviceUDNArray[1] + ', against device UDN: ' + tempArray[1]);
                                    	    if (tempArray[1] == ruleDeviceUDNArray[1]){
                                    	    	var macAddress = '';
                                                var pluginID = '';
                                    	    	if(tempArray[1].search('Bridge') != -1){
                                    	    		var bridgeData = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_BRIDGE_UDN);
                                    	    		macAddress = bridgeData[0].macAddress;
                                                    pluginID = bridgeData[0].pluginId;
                                    	    	}
                                    	    	else{
                                    	    		macAddress = Obj.macAddress;
                                                    pluginID = Obj.pluginId;
                                    	    	}
                                    	    	wemoUtil.infoLog(wemoUtil.TAG, 'UDN Found in json object of rule devices: ' + ruleDeviceUDN +
                                    	    									", mac address: " + macAddress + ", pluginID: " + pluginID);
                                    	    	
                                    	    	
                                    	    	if (isFirstObjInJSONStr == 0){
                                    	    		wemoUtil.infoLog(wemoUtil.TAG, "First Object in JSONObject String");
                                    	    		macAndPluginJsonStr = macAndPluginJsonStr + "\"" + ruleDeviceUDN + "\"" + " : [" + "\"" + pluginID + "\"" + "," + "\"" + macAddress + "\"" + "]";
                                    	    	}else{
                                    	    		wemoUtil.infoLog(wemoUtil.TAG, "NOT First Object in JSONObject String");
                                    	    		macAndPluginJsonStr = macAndPluginJsonStr + "," + "\"" + ruleDeviceUDN + "\"" + " : [" + "\"" + pluginID + "\"" + "," + "\"" + macAddress + "\"" + "]";
                                    	    	}
                                    	    	
                                    	    	isFirstObjInJSONStr = 1;
                                    	    	
                                    	    	//update process DB for rule devices
	                                	    		if (jQuery.inArray(macAddress, ruleDevicesMacs) == -1) {
	                                	        		ruleDevicesMacs.push(macAddress);
	                                	        		wemoUtil.infoLog(wemoUtil.TAG, "Process DB set to 1 for MAC: " + macAddress);
	                                	        	}
                                    	    	
                                    	    }
                                    	  }
                                    	}
                                }
                                
                                macAndPluginJsonStr = macAndPluginJsonStr + "}";
                                wemoUtil.infoLog(wemoUtil.TAG, "JSON Object for plugin IDs and mac addresses: " + macAndPluginJsonStr);
                                deviceTabPlugin.execute(
                                        function(xmlRequest) {
                                            wemoUtil.infoLog(wemoUtil.TAG,xmlRequest);
                                            wemoUtil.callSimulatedActionsToCloud(xmlRequest, isLEDInRule, pushScheduleSwitchCallback, callback);
                                        },
                                        wemoUtil.reportError,
                                        actions.CREATE_CLOUD_REQUEST_FOR_SCHEDULE_STRING, [jsonObjectStr, macAndPluginJsonStr]
                                    );

                            } else {
                                wemoUtil.loadUrl(filePath.REMOTE_NOT_AVAILABLE);
                            }
                        },
                        wemoUtil.reportError,
                        actions.IS_REMOTE_ENABLED, []
                    );
                }

            },
            wemoUtil.reportError,
            actions.GET_NETWORK_TYPE, []
        );


    },
    
    pushEditWeeklyStr: function(jsonObjectStr, udnArray, isLEDInRule, pushScheduleSwitchCallback, callback) {
        wemoUtil.infoLog(wemoUtil.TAG,"##########  push Edit Weekly String:function() :: " + jsonObjectStr);
        deviceTabPlugin.execute(
            function(type) {
                wemoUtil.infoLog(wemoUtil.TAG,"type: " + type);
                if (type === networkType.HOME_NETWORK) {
                    wemoUtil.infoLog(wemoUtil.TAG,"home network");
                    wemoUtil.infoLog(wemoUtil.TAG, 'Home scheduled string');
                    deviceTabPlugin.execute(
                        function(e) {
                            wemoUtil.infoLog(wemoUtil.TAG,e);
                            
                            if (isLEDInRule != 1){
                           	 wemoUtil.infoLog(wemoUtil.TAG,'PUSH_EDIT_WEEKLY_STR RESPONSE REC: LED NOT IN RULE, PROCEEDING WITH PUSH DB');
                           	deviceTabPlugin.execute(
                                       function(data) {
                                           var isMakertypeChanged = false;
                                           if (wemoUtil.getJSONObjectFromSessionStorage(sessionStore.EDIT_DEVICE_TYPE_CHANGED) == true) {
                                               isMakertypeChanged = true;
                                               wemoUtil.setJSONObjectToSessionStorage(sessionStore.EDIT_DEVICE_TYPE_CHANGED, false);
                                           }
                                           if (data == networkType.HOME_NETWORK) {
                                               if (isMakertypeChanged)
                                                   wemoUtil.pushDB(sessionStore.EDIT_DEVICE_SETTING, callback);
                                               else
                                                   wemoUtil.pushDB(sessionStore.RULES_LOCATION_SETTINGS, callback);
                                           } else if (data == networkType.REMOTE_WIFI || data == networkType.REMOTE_MOBILE) {
                                               
                                           }
                                       },
                                       function(err) {
                                           wemoUtil.infoLog(wemoUtil.TAG,"Error getting sensors list")
                                       },
                                       actions.GET_NETWORK_TYPE, []
                                   );
                           }else{
                           		wemoUtil.infoLog(wemoUtil.TAG, "PUSH_EDIT_WEEKLY_STR RESPONSE REC: LEDs IN RULE, SENDING CALLBACK FOR LEDs. PUSH DB NOT PROCESSED YET.");
                           		if (pushScheduleSwitchCallback && (typeof pushScheduleSwitchCallback != TYPE_OF.UN_DEFINED)){
                           			pushScheduleSwitchCallback();
                           		}
                           }
                        },
                        wemoUtil.reportError,
                        actions.EDIT_WEEKLY_CALENDER,
                        [udnArray]
                    );
                    wemoUtil.infoLog(wemoUtil.TAG,"out of the home network");

                } else if (type === networkType.REMOTE_MOBILE || type === networkType.REMOTE_WIFI) {
                    wemoUtil.infoLog(wemoUtil.TAG,"remote network");
                    wemoUtil.infoLog(wemoUtil.TAG, 'remote scheduled string');
                    devicePlugin.execute(
                        function(enabled) {
                            wemoUtil.infoLog(wemoUtil.TAG,"remote enables");
                            wemoUtil.infoLog(wemoUtil.TAG, 'Remote enabled: ' + enabled);
                            if (enabled) {
                                var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
                                var arraySensorObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SENSOR_DATA);
                                var arrayInsightObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA);
                                var arrayMakerObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA);
                                var arrayPIRSensors = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.PIR_DATA);
                                var arrayFobSensors = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.FOB_DATA);
                                var arrayDWSensors = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DWSENSOR_DATA);
                                wemoUtil.infoLog(wemoUtil.TAG, 'switch' + JSON.stringify(arraySwitchObjects));
                                wemoUtil.infoLog(wemoUtil.TAG, 'sensors' + JSON.stringify(arraySensorObjects));
                                wemoUtil.infoLog(wemoUtil.TAG, 'insights' + JSON.stringify(arrayInsightObjects));

                                var wemoObject = arraySensorObjects.concat(arraySwitchObjects, arrayInsightObjects, arrayMakerObjects, arrayPIRSensors, arrayFobSensors, arrayDWSensors);
                                wemoUtil.infoLog(wemoUtil.TAG, 'wemo object: ' + JSON.stringify(wemoObject));

                                var ruleDevicesDataArray = [];
                                
                                var macAndPluginJsonStr = "{";
                                
                                var isFirstObjInJSONStr = 0;
                                for (var i in wemoObject) {
                                    var Obj = wemoObject[i];
                                    wemoUtil.infoLog(wemoUtil.TAG, 'Searching with UDN from all devices: ' + Obj.udn);
                                    var ObjUDN = Obj.udn;
                                    var tempArray = ObjUDN.split(":");
                                    
                                    //check in JSONOject of weekly calender Strings
                                    var jsonObject = JSON.parse(jsonObjectStr);
                                    
                                    
                                    
                                    for (var ruleDeviceUDN in jsonObject) {
                                    	  if (jsonObject.hasOwnProperty(ruleDeviceUDN)) {
                                    		wemoUtil.infoLog(wemoUtil.TAG, 'Rule UDN: ' + ruleDeviceUDN);
                                    	    var ruleDeviceUDNArray = ruleDeviceUDN.split(':');
                                    	    wemoUtil.infoLog(wemoUtil.TAG, 'Searching for rule UDN: ' + ruleDeviceUDNArray[1] + ', against device UDN: ' + tempArray[1]);
                                    	    if (tempArray[1] == ruleDeviceUDNArray[1]){
                                    	    	var macAddress = '';
                                                var pluginID = '';
                                    	    	if(tempArray[1].search('Bridge') != -1){
                                    	    		var bridgeData = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_BRIDGE_UDN);
                                    	    		macAddress = bridgeData[0].macAddress;
                                                    pluginID = bridgeData[0].pluginId;
                                    	    	}
                                    	    	else{
                                    	    		macAddress = Obj.macAddress;
                                                    pluginID = Obj.pluginId;
                                    	    	}
                                    	    	wemoUtil.infoLog(wemoUtil.TAG, 'UDN Found in json object of rule devices: ' + ruleDeviceUDN +
                                    	    									", mac address: " + macAddress + ", pluginID: " + pluginID);
                                    	    	
                                    	    	
                                    	    	if (isFirstObjInJSONStr == 0){
                                    	    		wemoUtil.infoLog(wemoUtil.TAG, "First Object in JSONObject String");
                                    	    		macAndPluginJsonStr = macAndPluginJsonStr + "\"" + ruleDeviceUDN + "\"" + " : [" + "\"" + pluginID + "\"" + "," + "\"" + macAddress + "\"" + "]";
                                    	    	}else{
                                    	    		wemoUtil.infoLog(wemoUtil.TAG, "NOT First Object in JSONObject String");
                                    	    		macAndPluginJsonStr = macAndPluginJsonStr + "," + "\"" + ruleDeviceUDN + "\"" + " : [" + "\"" + pluginID + "\"" + "," + "\"" + macAddress + "\"" + "]";
                                    	    	}
                                    	    	
                                    	    	isFirstObjInJSONStr = 1;
                                    	    	
                                    	    	//update process DB for rule devices
	                                	    		if (jQuery.inArray(macAddress, ruleDevicesMacs) == -1) {
	                                	        		ruleDevicesMacs.push(macAddress);
	                                	        		wemoUtil.infoLog(wemoUtil.TAG, "Process DB set to 1 for MAC: " + macAddress);
	                                	        	}
                                    	    	
                                    	    }
                                    	  }
                                    	}
                                }
                                
                                macAndPluginJsonStr = macAndPluginJsonStr + "}";
                                wemoUtil.infoLog(wemoUtil.TAG, "JSON Object for plugin IDs and mac addresses: " + macAndPluginJsonStr);
                                deviceTabPlugin.execute(
                                        function(xmlRequest) {
                                            wemoUtil.infoLog(wemoUtil.TAG,xmlRequest);
                                            wemoUtil.callSimulatedActionsToCloud(xmlRequest, isLEDInRule, pushScheduleSwitchCallback, callback);
                                        },
                                        wemoUtil.reportError,
                                        actions.CREATE_CLOUD_REQUEST_FOR_SCHEDULE_STRING, [jsonObjectStr, macAndPluginJsonStr]
                                    );

                            } else {
                                wemoUtil.loadUrl(filePath.REMOTE_NOT_AVAILABLE);
                            }
                        },
                        wemoUtil.reportError,
                        actions.IS_REMOTE_ENABLED, []
                    );
                }

            },
            wemoUtil.reportError,
            actions.GET_NETWORK_TYPE, []
        );


    },

    reportError: function(e) {
    	wemoUtil.infoLog(wemoUtil.TAG, "Plugin Failure Call back!!!!   " + e);
    },

	showRuleNotSavedErrorPopup: function(){
		var errorPopUpTemplate = '<div id="rule_not_saved_pop_up" class="devicelist_GIF"><div  class="error_pop_up_main" ><div class="error_pop_up_header">'+wemo.items['RuleCannotSave_Title']+'</div><div class="error_pop_up_content">'+wemo.items['RuleCantBeSaved']+'</div><div id = "pop_up_ok_bttn" class="error_pop_up_footer">'+wemo.items['AlertOK']+'</div></div></div>';
		$("[data-role='page']").append(errorPopUpTemplate);
		$('#pop_up_ok_bttn').on('tap',function(e){
			e.stopPropagation();
			e.preventDefault();
			$("#rule_not_saved_pop_up").css('display','none');
		});
		$("#rule_not_saved_pop_up").css('display','block');
	},
	getRulesListFromDB: function(callback) {
	        var dbEnabledRules = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
	        dbEnabledRules.transaction(getDB, errorCB);
	        function getDB(tx) {
	            wemoUtil.infoLog(wemoUtil.TAG,"function getDB  ");
	            tx.executeSql("SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value,b.ZBCapabilityStart, b.ZBCapabilityEnd, b.OnModeOffset, b.OffModeOffset, b.CountdownTime from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID order by a.Name COLLATE NOCASE", [], querySuccess, errorCB);
	        }
	        function querySuccess(tx, results) {
	            wemoUtil.infoLog(wemoUtil.TAG,"Fetching Data =>" + results.rows.length);
	            var len = results.rows.length;
	            var ruleRows = [];
	            if (len > 0) {
	                for (var i = 0; i < len; i++) {
	                    ruleRows[i] = results.rows.item(i);
	                }
	                window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));
	            } else {
	                window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));
	            }
	        	wemoUtil.hideModal();
	        	wemoUtil.showRuleNotSavedErrorPopup();
	        }
	        function errorCB(err) {
	            wemoUtil.infoLog(wemoUtil.TAG,"Error processing SQL: " + err.code);
	        	wemoUtil.hideModal();
	        	wemoUtil.showRuleNotSavedErrorPopup();
	        }
	},
    nextDay: function(x) {
        wemoUtil.infoLog(wemoUtil.TAG," :: Current Day :: " + x);
        if (x == 7) {
            x = 1;
            wemoUtil.infoLog(wemoUtil.TAG," :: Next Day :: " + x);
            return x;
        } else {
            ++x;
            wemoUtil.infoLog(wemoUtil.TAG," :: Next Day :: " + x);
            return x;
        }

    },
    //Schedule String
    //Schedule String
    pushSwitchScheduleStrWithSun: function(rule, db, obj, key, loc, time, offset1, offset2, callback) {
        wemoUtil.infoLog(wemoUtil.TAG,"obj :: " + JSON.stringify(obj));
        var Tag = "SSTime";

        //time is like this: 09-24 07:32:31.164: ["Tue|10320:53940","Wed|10440:53760","Thu|10560:53640","Fri|10680:53460","Sat|10800:53280","Sun|10920:53100","Mon|11040:52980"]  at file:///android_asset/www/js/wemo_util.js:3177
        trace("pushSwitchScheduleStrWithSun ===>", time);

        var days = [];
        for (var x = 0; x < time.length; x++) {

            var dayData = time[x].split('|');

            var day = dayData[0];
            switch (day) {

                case "Mon":
                    days[1] = dayData[1];
                    break;
                case "Tue":
                    days[2] = dayData[1];
                    break;
                case "Wed":
                    days[3] = dayData[1];
                    break;
                case "Thu":
                    days[4] = dayData[1];
                    break;
                case "Fri":
                    days[5] = dayData[1];
                    break;
                case "Sat":
                    days[6] = dayData[1];
                    break;
                case "Sun":
                    days[7] = dayData[1];
                    break;
                default:
                    wemoUtil.infoLog(wemoUtil.TAG,"default");
                    break;
            }
        }
        //alert(days.join('---'));
        db.transaction(getMax, errorCB, successCB);

        function getMax(tx) {
            var schStr = ['', '', '', '', '', '', '', rule];
            tx.executeSql("select * from RULEDEVICES where (DeviceID='" + rule + "' and RuleID in (select RuleID from RULES where State='1')) and DayID <> -1 ORDER BY StartTime", [], querySuccess, errorCB);
            //            tx.executeSql("select * from RULEDEVICES where DeviceID='"+rule+"' ORDER BY StartTime",[], querySuccess, errorCB);

            function querySuccess(tx, results) {
                //                alert("db transaction");
                var len = results.rows.length;
                for (var i = 0; i < len; i++) {
                    //                    alert("yes");
                    wemoUtil.infoLog(wemoUtil.TAG,"RuleID= " + results.rows.item(i).RuleID + " StartTime =  " + results.rows.item(i).StartTime + ", StartAction = " + results.rows.item(i).StartAction + ' DayID = ' + results.rows.item(i).DayID);
                    var dayID = wemoUtil.returnDayforSchStr(parseInt(results.rows.item(i).DayID));
                    var EndAct = false;
                    //                  alert("End Action"+results.rows.item(i).EndAction);
                    var StartTime = parseInt(results.rows.item(i).StartTime);
                    var Duration = parseInt(results.rows.item(i).RuleDuration);
                    var EndTime = parseInt(results.rows.item(i).RuleDuration) + parseInt(results.rows.item(i).StartTime);
                    var dayIndex;
                    var nextDayIdx;

                    if (StartTime % 10 == 1) {
                        StartTime = "SR";
                    }
                    if (StartTime % 10 == 2) {
                        StartTime = "SS";
                    }
                    if (EndTime % 10 == 1) {
                        EndTime = "SR";
                    }
                    if (EndTime % 10 == 2) {
                        EndTime = "SS";
                    }

                    if (parseInt(results.rows.item(i).EndAction) != 2) {
                        EndAct = true;
                    }
                    wemoUtil.infoLog(wemoUtil.TAG,"DayID :: " + dayID);

                    if (dayID == 0) {

                        for (var j = 1; j <= 7; j++) {
                            var time = days[j].split(':');
                            dayIndex = j;
                            nextDayIdx = wemoUtil.nextDay(j);

                            wemoUtil.infoLog(wemoUtil.TAG,Tag, time[0] + "," + time[1]);
                            if (StartTime == "SR") {
                                StartTime = parseInt(time[0]) + 1;
                            }
                            if (StartTime == "SS") {
                                StartTime = parseInt(time[1]) + 2;
                            }

                            manuplateScdStrforaday(dayIndex, StartTime, results.rows.item(i).StartAction);
                            if (EndAct) {
                                //                                if(EndTime >= 86400)
                                //                                {
                                //                                    EndTime = EndTime-86400;
                                //                                    dayIndex = nextDayIdx;
                                //                                }
                                if (EndTime == "SR") {
                                    EndTime = parseInt(time[0]) + 1;
                                }
                                if (EndTime == "SS") {
                                    EndTime = parseInt(time[1]) + 2;
                                }
                                //                                alert(dayIndex);
                                manuplateScdStrforaday(dayIndex, EndTime, results.rows.item(i).EndAction);
                            }
                        }
                    } else if (dayID == 8) {

                        for (var k = 1; k <= 5; k++) {
                            var time = days[k].split(':');
                            dayIndex = k;
                            nextDayIdx = wemoUtil.nextDay(k);
                            if (StartTime == "SR") {
                                StartTime = parseInt(time[0]) + 1;
                            }
                            if (StartTime == "SS") {
                                StartTime = parseInt(time[1]) + 2;
                            }
                            manuplateScdStrforaday(dayIndex, StartTime, results.rows.item(i).StartAction);
                            if (EndAct) {
                                //                                if(EndTime >= 86400)
                                //                                {
                                //                                    EndTime = EndTime-86400;
                                //                                    dayIndex = nextDayIdx;
                                //                                }
                                if (EndTime == "SR") {
                                    EndTime = parseInt(time[0]) + 1;
                                }
                                if (EndTime == "SS") {
                                    EndTime = parseInt(time[1]) + 2;
                                }
                                manuplateScdStrforaday(dayIndex, EndTime, results.rows.item(i).EndAction);
                            }
                        }
                    } else if (dayID == 9) {
                        var time1 = days[6].split(':');
                        var time2 = days[7].split(':');

                        if (StartTime == "SR") {
                            StartTime = parseInt(time1[0]) + 1;
                        }
                        if (StartTime == "SS") {
                            StartTime = parseInt(time1[1]) + 2;
                        }
                        manuplateScdStrforaday(6, StartTime, results.rows.item(i).StartAction);

                        if (StartTime == "SR") {
                            StartTime = parseInt(time2[0]) + 1;
                        }
                        if (StartTime == "SS") {
                            StartTime = parseInt(time2[1]) + 2;
                        }
                        manuplateScdStrforaday(7, StartTime, results.rows.item(i).StartAction);
                        if (EndAct) {
                            dayIndex = 6;
                            //                            if(EndTime >= 86400)
                            //                            {
                            //                                EndTime = EndTime-86400;
                            //                                dayIndex = 7;
                            //                            }

                            if (EndTime == "SR") {
                                EndTime = parseInt(time1[0]) + 1;
                            }
                            if (EndTime == "SS") {
                                EndTime = parseInt(time1[1]) + 2;
                            }
                            manuplateScdStrforaday(dayIndex, EndTime, results.rows.item(i).EndAction);
                            dayIndex = 7;
                            //                            if(EndTime >= 86400)
                            //                            {
                            //                                EndTime = EndTime-86400;
                            //                                dayIndex = 1;
                            //                            }
                            if (EndTime == "SR") {
                                EndTime = parseInt(time2[0]) + 1;
                            }
                            if (EndTime == "SS") {
                                EndTime = parseInt(time2[1]) + 2;
                            }
                            manuplateScdStrforaday(dayIndex, EndTime, results.rows.item(i).EndAction);

                        }
                    } else {
                        var time = days[dayID].split(':');
                        dayIndex = dayID;
                        nextDayIdx = wemoUtil.nextDay(dayID);
                        //                        alert()
                        if (StartTime == "SR") {
                            StartTime = parseInt(time[0]) + 1;
                        }
                        if (StartTime == "SS") {
                            StartTime = parseInt(time[1]) + 2;
                        }
                        manuplateScdStrforaday(dayIndex, StartTime, results.rows.item(i).StartAction);
                        if (EndAct) {

                            //                            if(EndTime >= 86400)
                            //                            {
                            //                                EndTime = EndTime-86400;
                            //                                dayIndex = nextDayIdx;
                            //                            }

                            if (EndTime == "SR") {
                                EndTime = parseInt(time[0]) + 1;
                            }
                            if (EndTime == "SS") {
                                EndTime = parseInt(time[1]) + 2;
                            }
                            manuplateScdStrforaday(dayIndex, EndTime, results.rows.item(i).EndAction);
                        }
                    }
                }
                addActionNumforSch();
                addLatLong(loc.latitude, loc.longitude, offset1, offset2);
                wemoUtil.infoLog(wemoUtil.TAG,"Pushing schedule string for :" + schStr[7] + " :: " + rule + " :: " + key)
                wemoUtil.pushSchStr(schStr, 0, null, callback);
                return true;


            }

            function manuplateScdStrforaday(x, st, sa) {
                //alert("manuplateScdStrforaday = "+x);
                wemoUtil.infoLog(wemoUtil.TAG,Tag, st + ',' + sa);
                --x;
                //alert("Day id"+x);
                st = parseInt(st);
                sa = parseInt(sa);
                if (st == 00000) st = 00004;
                schStr[x] = schStr[x] + '|' + st + ',' + sa;
                //alert("manuplateScdStrforaday string = "+schStr[x]);
                wemoUtil.infoLog(wemoUtil.TAG,"SCH STRING :: " + schStr[x]);
            }

            function addActionNumforSch() {
                for (var l = 0; l <= 6; l++) {
                    var x = schStr[l].split('|').length;
                    --x;
                    schStr[l] = x + '' + schStr[l];
                    // alert("addActionNumforSch string = "+schStr[l]);
                    wemoUtil.infoLog(wemoUtil.TAG,"SCH STRING :: " + schStr[l]);
                }
            }

            function addLatLong(la, lo, offset1, offset2) {
                for (var l = 0; l <= 6; l++) {
                    schStr[l] += "#" + la + "," + lo + "$" + offset1 + "," + offset2;
                }
                // alert("addLatLong string = "+schStr[l]);
                wemoUtil.infoLog(wemoUtil.TAG,"SCH STRING :: " + schStr[l]);
            }


        }

        function errorCB(err) {
            wemoUtil.infoLog(wemoUtil.TAG,"Error processing SQL: " + err.code, "Error");
        }

        function successCB() {
            wemoUtil.infoLog(wemoUtil.TAG,'Done', 'Success');

            wemoUtil.infoLog(wemoUtil.TAG,"obj" + obj + " obj dev " + obj.Devices);
            wemoUtil.infoLog(wemoUtil.TAG,"key val" + key + " obj keys " + Object.keys);

            if (key == parseInt(Object.keys(obj.Devices).length) - 1) {

                deviceTabPlugin.execute(
                    function(data) {
                        wemoUtil.infoLog(wemoUtil.TAG,"Local :: " + sessionStore.RULES_LOCATION_SETTINGS + '   ' + networkType.HOME_NETWORK + '  data ::  ' + data);
                        if (data == networkType.HOME_NETWORK) {
                            wemoUtil.pushDB(sessionStore.RULES_LOCATION_SETTINGS, callback);
                        } else if (data == networkType.REMOTE_WIFI || data == networkType.REMOTE_MOBILE) {
                            deviceTabPlugin.execute(
                                function(enabled) {
                                    wemoUtil.infoLog(wemoUtil.TAG,"Remote enabled: " + enabled);
                                    if (enabled) {
                                        wemoUtil.uploadDBOnCloud(sessionStore.RULES_LOCATION_SETTINGS, callback);
                                    } else {
                                        navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {
                                            loadUrlTimeoutValue: 60000
                                        });
                                    }
                                },
                                wemoUtil.reportError,
                                actions.IS_REMOTE_ENABLED, []
                            );
                        }
                    },
                    function(err) {
                        wemoUtil.infoLog(wemoUtil.TAG,"Error getting sensors list")
                    },
                    actions.GET_NETWORK_TYPE, []
                );

            }

        }
    },

    generateRulesSchdStr: function(day, udnArray, callback) {
        wemoUtil.infoLog(wemoUtil.TAG,'generateRulesSchdStr');

        deviceTabPlugin.execute(
            function(jsonObject) {
                callback(day, jsonObject);
            },
            function(err) {
                wemoUtil.infoLog(wemoUtil.TAG,"Error getting schedule string")
            },
            actions.GET_RULE_SCHEDULE_STRING, [day, udnArray]
        );
    },


    generateRulesSensorSchdStr: function(day, udnArray, callback) {
        wemoUtil.infoLog(wemoUtil.TAG,'generateRulesSensorSchdStr');

        deviceTabPlugin.execute(
            function(str) {
                callback(day, str);
            },
            function(err) {
                wemoUtil.infoLog(wemoUtil.TAG,"Error getting schedule string")
            },
            actions.GET_RULE_SENSOR_SCHEDULE_STRING, [day, udnArray]
        );
    },


    pushScheduleSensor: function(udnArray, devNum, devCount, callback) {
    	
    	 wemoUtil.infoLog(wemoUtil.TAG,"pushScheduleSensor: udnArrays-->" + udnArray);
         var schStr = [];
         
         wemoUtil.generateRulesSensorSchdStr(0, udnArray, fillSchd);
         
         function fillSchd(day, jsonObject) {
         	
         	var jsonObjectStr = JSON.stringify(jsonObject);
         	
         	wemoUtil.infoLog(wemoUtil.TAG,'pushScheduleSensor: json object received after creation of schedule strings: ' + jsonObjectStr);
         	
         	var filled = true;
         	
             if (filled) {
             	wemoUtil.infoLog(wemoUtil.TAG,"pushScheduleSensor: filled is true");
             	
                 if (window.sessionStorage.getItem(sessionStore.LAST_ENTRY) == LAST_ENTRY_VALUE) {
                 	wemoUtil.infoLog(wemoUtil.TAG,"pushScheduleSensor: pushEditWeeklyStr");
                     wemoUtil.pushEditWeeklyStr(jsonObjectStr, udnArray, 0, null, callback);
                 } else {
                 	wemoUtil.infoLog(wemoUtil.TAG,"pushScheduleSensor: pushSchStr");
                     wemoUtil.pushSchStr(jsonObjectStr, 0, null, callback);
                     
                 }
                 
                 wemoUtil.infoLog(wemoUtil.TAG,'Push Weekly Calender to Plugin is complete');
             }
         }
    },
    
    
    pushMakerSensorDb: function(udn, devNum, devCount, notify, rule, isEditDevice, callback) {
        wemoUtil.infoLog(wemoUtil.TAG,"pushScheduleToDevice: udnArrays-->" + " pushMakerSensorDb");
    	//TODO: isEditDevice is not being used.
    	wemoUtil.pushScheduleToDevice(udn, devNum, devCount, notify, rule, 0, null, callback);
    },
    pushScheduleInisghtNotify: function(udn, devNum, devCount, rule, callback) {
        wemoUtil.infoLog(wemoUtil.TAG,"pushScheduleToDevice: udnArrays-->" + " pushScheduleInisghtNotify");
        wemoUtil.pushScheduleToDevice(udn, devNum, devCount, true, rule, 0, null, callback);
    },

    pushScheduleSwitch: function(udn, devNum, devCount, isLEDInRule, pushScheduleSwitchCallback, callback) {
        wemoUtil.infoLog(wemoUtil.TAG,"pushScheduleToDevice: udnArrays-->" + " pushScheduleSwitch");
        wemoUtil.pushScheduleToDevice(udn, devNum, devCount, false, null, isLEDInRule, pushScheduleSwitchCallback, callback);
    },

    pushScheduleToDevice: function(udnArray, devNum, devCount, notify, rule, isLEDInRule, pushScheduleSwitchCallback, callback) {
        wemoUtil.infoLog(wemoUtil.TAG,"pushScheduleToDevice: udnArrays-->" + udnArray);
        
        if (isLEDInRule == undefined){
        	isLEDInRule = 0;
        }
        
        wemoUtil.infoLog(wemoUtil.TAG,"pushScheduleToDevice: is LED In Rule: " + isLEDInRule);
        var schStr = [];
        
        wemoUtil.generateRulesSchdStr(0, udnArray, fillSchd);
        
        function fillSchd(day, jsonObject) {
        	
        	var jsonObjectStr = JSON.stringify(jsonObject);
        	
        	wemoUtil.infoLog(wemoUtil.TAG,'pushScheduleToDevice: json object received after creation of schedule strings: ' + jsonObjectStr);
        	
        	var filled = true;
        	
            if (filled) {
            	wemoUtil.infoLog(wemoUtil.TAG,"pushScheduleToDevice: filled is true");
            	
            	if (notify && rule != undefined) {
            		
            		var splitUDNs = [];
            		if (typeof udnArray ===	 TYPE_OF.STRING){
            			splitUDNs = udnArray.split(DELIMITER_COMMA);
            		}
            		
                    if (rule.RuleType == sessionStore.NOTIFY_ME || rule.RuleType == sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE){
                    	for (var i = 0, len=splitUDNs.length; i<len; i++){
                    		var msgStr = [rule.NotifyRuleID, DELIMITER_SINGLE_QUOTE + rule.NotifyMessage + DELIMITER_SINGLE_QUOTE, rule.NotificationDuration, splitUDNs[i]];
                    		wemoUtil.setNotifyMessage(msgStr, rule.NotifyMessage);
                    	}
                    }else{
                    	for (var i = 0, len=splitUDNs.length; i<len; i++){
                    		var msgStr = [rule.NotifyRuleID, DELIMITER_SINGLE_QUOTE + rule.NotifyMessage + DELIMITER_SINGLE_QUOTE, rule.Frequency, splitUDNs[i]];
                    		wemoUtil.setNotifyMessage(msgStr, rule.NotifyMessage);
                    	}
                    }
                }

                if (window.sessionStorage.getItem(sessionStore.LAST_ENTRY) == LAST_ENTRY_VALUE) {
                	wemoUtil.infoLog(wemoUtil.TAG,"pushScheduleToDevice: pushEditWeeklyStr");
                    wemoUtil.pushEditWeeklyStr(jsonObjectStr, udnArray, isLEDInRule, pushScheduleSwitchCallback, callback);
                } else {
                	wemoUtil.infoLog(wemoUtil.TAG,"pushScheduleToDevice: pushSchStr");
                    wemoUtil.pushSchStr(jsonObjectStr, isLEDInRule, pushScheduleSwitchCallback, callback);
                    
                }
                
                wemoUtil.infoLog(wemoUtil.TAG,'GenerateScheduleString: Device number/index: ' + devNum + ", total device count: " + devCount - 1);
            }
        }
    },

    pushSensorScheduleStrWithSRSS: function(device, db, obj, loc, time, ruleDays, callback) {
        wemoUtil.infoLog(wemoUtil.TAG,"obj :: pushSensorScheduleStrWithSRSS :: " + JSON.stringify(obj));
        var schStr = ['', '', '', '', '', '', '', device];
        var Tag = "SSTime";
        var days = [];
        for (var x = 0; x < time.length; x++) {
            var dayData = time[x].split('|');
            var day = dayData[0];
            switch (day) {

                case "Mon":
                    days[1] = dayData[1];
                    break;
                case "Tue":
                    days[2] = dayData[1];
                    break;
                case "Wed":
                    days[3] = dayData[1];
                    break;
                case "Thu":
                    days[4] = dayData[1];
                    break;
                case "Fri":
                    days[5] = dayData[1];
                    break;
                case "Sat":
                    days[6] = dayData[1];
                    break;
                case "Sun":
                    days[7] = dayData[1];
                    break;
                default:
                    wemoUtil.infoLog(wemoUtil.TAG,"default");
                    break;
            }
        }


        var EndAct = false;
        var StartTime = parseInt(obj.When.StartTime);
        var Duration = parseInt(obj.When.RuleDuration);
        var EndTime = parseInt(obj.When.RuleDuration) + parseInt(obj.When.StartTime);
        wemoUtil.infoLog(wemoUtil.TAG,"StartTime :: " + StartTime + " EndTime ::  " + EndTime);

        if (StartTime % 10 == 1) {
            StartTime = "SR";
        }
        if (StartTime % 10 == 2) {
            StartTime = "SS";
        }
        if (EndTime % 10 == 1) {
            EndTime = "SR";
        }
        if (EndTime % 10 == 2) {
            EndTime = "SS";
        }
        wemoUtil.infoLog(wemoUtil.TAG,"StartTime :: " + StartTime + " EndTime ::  " + EndTime);

        var dayIndex;
        var nextDayIdx;

        var switches = [];
        if (Object.keys(obj.Devices).length > 0) {
            for (key in obj.Devices) {
                if (key.indexOf("Socket") != -1) {
                    if ($.inArray(key, switches) == -1) {
                        switches.push(key);
                    }
                }
            }
        }
        //uuid:Socket-1_0-Belkin_0006,1,20,0;uuid:Socket-1_0-4400701K00D16,1,40,0
        var swichlen = switches.length;
        var gSA, gEA;
        var switchStr = "";
        for (var sw = 0; sw < swichlen; sw++) {
            var swStA = obj.Devices[switches[sw]].StartAction;
            var SD = obj.Devices[switches[sw]].SensorDuration;
            var swEnA = obj.Devices[switches[sw]].EndAction;
            switchStr += ";" + switches[sw] + "," + swStA + "," + SD + "," + swEnA;
            //wemoUtil.infoLog(wemoUtil.TAG,":: switchStr ::"+switchStr);
            gSA = "1";
            gEA = "0";
            if (parseInt(obj.Devices[switches[sw]].EndAction) != 2) {
                EndAct = true;
            }
        }

        function SensorDelay(sensitivity) {
            if (sensitivity == 25) return 30;
            else if (sensitivity == 50) return 10;
            else if (sensitivity == 75) return 2;
            else if (sensitivity == 100) return 0;
            else return 0;
        }

        var delay = SensorDelay(obj.SelectedSensorsValue);
        var delayStr = delay + ";" + obj.SelectedSensorsValue;
        var switchStr = "[" + swichlen + ";" + delayStr + switchStr + "]";
        wemoUtil.infoLog(wemoUtil.TAG,":: switchStr :: " + obj.id + " :: " + "[" + swichlen + ";" + delayStr + switchStr + "]");

        //alert("days = "+ruleDays);
        for (var d = 0; d < ruleDays.length; d++) {
            var dayID = wemoUtil.returnDayforSchStr(ruleDays[d]);
            //alert("dayID :: "+dayID);

            if (dayID == 0) {

                for (var j = 1; j <= 7; j++) {
                    var time = days[j].split(':');
                    var rSA = true;
                    dayIndex = j;
                    nextDayIdx = wemoUtil.nextDay(j);

                    wemoUtil.infoLog(wemoUtil.TAG,Tag, time[0] + "," + time[1]);
                    if (StartTime == "SR") {
                        StartTime = parseInt(time[0]) + 1;
                    }
                    if (StartTime == "SS") {
                        StartTime = parseInt(time[1]) + 2;
                    }

                    manuplateScdStrforaday(dayIndex, StartTime, gSA, rSA);
                    if (EndAct) {
                        var rSA = false;
                        //                        if(EndTime >= 86400)
                        //                        {
                        //                            EndTime = EndTime-86400;
                        //                            dayIndex = nextDayIdx;
                        //                        }
                        if (EndTime == "SR") {
                            EndTime = parseInt(time[0]) + 1;
                        }
                        if (EndTime == "SS") {
                            EndTime = parseInt(time[1]) + 2;
                        }
                        //                        alert(dayIndex);
                        manuplateScdStrforaday(dayIndex, EndTime, gEA, rSA);
                    }
                }
            } else if (dayID == 8) {

                for (var k = 1; k <= 5; k++) {
                    var time = days[k].split(':');
                    var rSA = true;
                    dayIndex = k;
                    nextDayIdx = wemoUtil.nextDay(k);
                    if (StartTime == "SR") {
                        StartTime = parseInt(time[0]) + 1;
                    }
                    if (StartTime == "SS") {
                        StartTime = parseInt(time[1]) + 2;
                    }
                    manuplateScdStrforaday(dayIndex, StartTime, gSA, rSA);
                    if (EndAct) {
                        var rSA = false;
                        //                        if(EndTime >= 86400)
                        //                        {
                        //                            EndTime = EndTime-86400;
                        //                            dayIndex = nextDayIdx;
                        //                        }
                        if (EndTime == "SR") {
                            EndTime = parseInt(time[0]) + 1;
                        }
                        if (EndTime == "SS") {
                            EndTime = parseInt(time[1]) + 2;
                        }
                        manuplateScdStrforaday(dayIndex, EndTime, gEA, rSA);
                    }
                }
            } else if (dayID == 9) {
                var time1 = days[6].split(':');
                var time2 = days[7].split(':');
                var rSA = true;

                if (StartTime == "SR") {
                    StartTime = parseInt(time1[0]) + 1;
                }
                if (StartTime == "SS") {
                    StartTime = parseInt(time1[1]) + 2;
                }
                manuplateScdStrforaday(6, StartTime, gSA, rSA);

                if (StartTime == "SR") {
                    StartTime = parseInt(time2[0]) + 1;
                }
                if (StartTime == "SS") {
                    StartTime = parseInt(time2[1]) + 2;
                }
                manuplateScdStrforaday(7, StartTime, gSA, rSA);
                if (EndAct) {
                    var rSA = false;
                    dayIndex = 6;
                    //                    if(EndTime >= 86400)
                    //                    {
                    //                        EndTime = EndTime-86400;
                    //                        dayIndex = 7;
                    //                    }

                    if (EndTime == "SR") {
                        EndTime = parseInt(time1[0]) + 1;
                    }
                    if (EndTime == "SS") {
                        EndTime = parseInt(time1[1]) + 2;
                    }
                    manuplateScdStrforaday(dayIndex, EndTime, gEA, rSA);
                    dayIndex = 7;
                    //                    if(EndTime >= 86400)
                    //                    {
                    //                        EndTime = EndTime-86400;
                    //                        dayIndex = 1;
                    //                    }
                    if (EndTime == "SR") {
                        EndTime = parseInt(time2[0]) + 1;
                    }
                    if (EndTime == "SS") {
                        EndTime = parseInt(time2[1]) + 2;
                    }
                    manuplateScdStrforaday(dayIndex, EndTime, gEA, rSA);

                }
            } else {
                var time = days[dayID].split(':');
                dayIndex = dayID;
                if (parseInt(time[1]) < parseInt(time[0])) {
                    var newst = [];
                    if (StartTime == "SR") {
                        newst.push(time[0]);
                    }
                    if (StartTime == "SS") {
                        newst.push(time[1]);
                    }
                    newst.push(00000);
                    var newet = [];
                    newet.push(86340);
                    if (EndTime == "SR") {
                        newet.push(time[0])
                    }
                    if (EndTime == "SS") {
                        newet.push(time[1])
                    }

                    for (var i = 0; i < newst.length; i++) {

                        if (i > 0) {
                            dayIndex = wemoUtil.nextDay(dayID);
                        }
                        var rSA = true;
                        wemoUtil.infoLog(wemoUtil.TAG,"New StartTime :: " + newst + "  ::  " + newst[i]);
                        wemoUtil.infoLog(wemoUtil.TAG,"New EndTime :: " + newet + "  ::  " + newet[i]);
                        if (StartTime == "SR") {
                            var nStartTime = parseInt(newst[i]) + 1;
                        }
                        if (StartTime == "SS") {
                            var nStartTime = parseInt(newst[i]) + 2;
                        }
                        manuplateScdStrforaday(dayIndex, nStartTime, gSA, rSA);
                        if (EndAct) {
                            var rSA = false;
                            if (EndTime == "SR") {
                                var nEndTime = parseInt(newet[i]) + 1;
                            }
                            if (EndTime == "SS") {
                                var nEndTime = parseInt(newet[i]) + 2;
                            }
                            wemoUtil.infoLog(wemoUtil.TAG," EndTime :: " + nEndTime);
                            manuplateScdStrforaday(dayIndex, nEndTime, gEA, rSA);
                        }
                    }

                } else {
                    var rSA = true;
                    nextDayIdx = wemoUtil.nextDay(dayID);
                    if (StartTime == "SR") {
                        StartTime = parseInt(time[0]) + 1;
                    }
                    if (StartTime == "SS") {
                        StartTime = parseInt(time[1]) + 2;
                    }
                    manuplateScdStrforaday(dayIndex, StartTime, gSA, rSA);
                    if (EndAct) {
                        var rSA = false;
                        if (EndTime == "SR") {
                            EndTime = parseInt(time[0]) + 1;
                        }
                        if (EndTime == "SS") {
                            EndTime = parseInt(time[1]) + 2;
                        }
                        wemoUtil.infoLog(wemoUtil.TAG," EndTime :: " + EndTime);
                        manuplateScdStrforaday(dayIndex, EndTime, gEA, rSA);
                    }
                }


            }
        }
        wemoUtil.infoLog(wemoUtil.TAG,"schStr    :: " + schStr + "    " + switchStr);

        function manuplateScdStrforaday(x, st, sa, rSA) {
            --x;
            st = parseInt(st);
            if (st == 00000) st = 00004;
            var sensorStr = "";
            if (rSA == true) {
                sensorStr = ',' + switchStr;
            }
            schStr[x] = schStr[x] + '|' + st + ',' + sa + '' + sensorStr;
            wemoUtil.infoLog(wemoUtil.TAG,"SCH STRING sensor manuplateScdStrforaday :: " + schStr[x]);
        }

        function addActionNumforSch() {
            for (var l = 0; l <= 6; l++) {
                var x = schStr[l].split('|').length;
                --x;
                schStr[l] = x + '' + schStr[l];
                wemoUtil.infoLog(wemoUtil.TAG,"SCH STRING sensor addActionNumforSch :: " + schStr[l]);
            }
        }

        function addLatLong(la, lo) {
            for (var l = 0; l <= 6; l++) {
                schStr[l] += "#" + la + "," + lo;
            }
            wemoUtil.infoLog(wemoUtil.TAG,"SCH STRING sensor addLatLong :: " + schStr[l]);
        }

        addActionNumforSch();
        addLatLong(loc.latitude, loc.longitude);
        wemoUtil.pushSchStr(schStr, 0, null, callback);

    },

    pushSensorScheduleStrWithSun: function(rule, db, dev, devNo, callback) {

        var arrSensors = rule.SelectedSensors.split(",");

        db.transaction(getMax, errorCB, successCB);

        function getMax(tx) {
            var schStr = ['', '', '', '', '', '', '', dev];

            tx.executeSql("select * from RULEDEVICES where DeviceID='" + dev + "' and RuleID in (select RuleID from RULES where State='1') ORDER BY StartTime DESC", [], querySuccess, errorCB);
            //                    tx.executeSql("select * from RULEDEVICES where DeviceID='"+arrSensors[sensors]+"' and RuleID in (select RuleID from RULES where State='1') ORDER BY StartTime", [], querySuccess, errorCB);


            function querySuccess(tx, results) {

                var len = results.rows.length;
                //                        alert(len);
                if (len <= 0) {
                    wemoUtil.pushSchStr(schStr, 0, null, callback);
                } else {
                    for (var i = 0; i < len; i++) {
                        var row = results.rows.item(i);
                        var StartTime = row.StartTime;
                        var RuleDuration = row.RuleDuration;
                        //                    alert(row.DeviceID);
                        wemoUtil.infoLog(wemoUtil.TAG,"StartTime =  " + StartTime + ", DayID = " + RuleDuration + "Rule ID : " + row.DeviceID);
                        var len1;
                        //                    alert(row.RuleID);
                        tx.executeSql("select * from RULEDEVICES where RuleID='" + row.RuleID + "' and Level='-1'", [], querySuc, errorCB);

                        function querySuc(tx, res) {
                            len1 = res.rows.length;
                            //                        alert(len1);

                            for (var j = 0; j < len1; j++) {
                                //                            wemoUtil.infoLog(wemoUtil.TAG,"StartTime =  " + res.rows.item(i).StartTime+", StartAction = "+res.rows.item(i).StartAction+' DayID = '+res.rows.item(i).DayID);
                                var dayID = wemoUtil.returnDayforSchStr(parseInt(res.rows.item(j).DayID));
                                if (dayID == 0) {
                                    for (var m = 1; m <= 7; m++) {
                                        manuplateScdStrforadaySensor(m, res.rows.item(j));
                                    }
                                } else if (dayID == 8) {
                                    for (var k = 1; k <= 5; k++) {
                                        manuplateScdStrforadaySensor(k, res.rows.item(j));
                                    }
                                } else if (dayID == 9) {
                                    manuplateScdStrforadaySensor(6, res.rows.item(j));
                                    manuplateScdStrforadaySensor(7, res.rows.item(j));
                                } else {
                                    manuplateScdStrforadaySensor(dayID, res.rows.item(j));
                                }


                            }

                        }

                    }
                    tx.executeSql("select * from RULEDEVICES where RuleID=" + row.RuleID + " and Level='-1'", [], querySucc, errorCB);

                    function querySucc(tx, res) {
                        var len2 = res.rows.length;
                        addActionNumforSch(len2, row);
                        wemoUtil.pushSchStr(schStr, 0, null, callback);


                    }

                    //
                }

                function manuplateScdStrforadaySensor(x, r) {
                    --x;
                    schStr[x] = schStr[x] + ";" + r.DeviceID + "," + r.StartAction + "," + r.SensorDuration + "," + r.EndAction;
                }

                function SensorDelay(sensitivity) {
                    if (sensitivity == 25) return 30;
                    else if (sensitivity == 50) return 10;
                    else if (sensitivity == 75) return 2;
                    else if (sensitivity == 100) return 0;
                    else return 0;
                }

                function addActionNumforSch(n, d) {
                    var s = SensorDelay(parseInt(d.Value));
                    for (var l = 0; l <= 6; l++) {
                        schStr[l] = "2|" + row.StartTime + ",1,[" + n + ";" + s + ";" + d.Value + "" + schStr[l] + "]|" + (parseInt(row.StartTime) + parseInt(row.RuleDuration)) + ",0";
                        wemoUtil.infoLog(wemoUtil.TAG,schStr[l]);
                    }

                }
            }


        }

        //        function querySuccess(tx,res){
        //            var len = res.rows.length;
        //            for(var x=0;x<len;x++){
        //                tx.executeSql("select * from RULEDEVICES where and RuleID='"+res.rows.item(x)+"'", [], queryRuleData, errorCB);
        //            }
        //
        //        }
        //
        //        function queryRuleData(tx,res){
        //            var len = res.rows.length;
        ////            alert(len);
        //
        //
        //        }


        function errorCB(err) {
            wemoUtil.infoLog(wemoUtil.TAG,"Error processing SQL: " + err.code, "Error");
        }

        function successCB() {
            // wemoUtil.pushDB();
            wemoUtil.infoLog(wemoUtil.TAG,'Done', 'Success');
            if (devNo == arrSensors.length - 1) {
                deviceTabPlugin.execute(function(data) {
                    if (data == networkType.HOME_NETWORK) {
                        wemoUtil.pushDB(callback);
                    } else if (data == networkType.REMOTE_WIFI || data == networkType.REMOTE_MOBILE) {
                        deviceTabPlugin.execute(function(enabled) {
                            wemoUtil.infoLog(wemoUtil.TAG,TAG + "Remote enabled: " + enabled);
                            if (enabled) {
                                wemoUtil.uploadDBOnCloud(sessionStore.RULES_DATA, callback);
                            } else {
                                navigator.app.loadUrl(
                                    filePath.REMOTE_NOT_AVAILABLE, {
                                        loadUrlTimeoutValue: 60000
                                    });
                            }
                        }, wemoUtil.reportError, actions.IS_REMOTE_ENABLED, []);
                    }
                }, function(err) {
                    wemoUtil.infoLog(wemoUtil.TAG,"Error getting sensors list")
                }, actions.GET_NETWORK_TYPE, []);
            }

        }
    },

    //JSON Parsing
    getJSONObjectFromSessionStorage: function(x) {
        return JSON.parse(window.sessionStorage.getItem(x));
    },
    setJSONObjectToSessionStorage: function(x, obj) {
        window.sessionStorage.setItem(x, JSON.stringify(obj))
    },

    get_ifttt_url: function(activate_pin) {
        var url = "";
        if (firmwareCloud == firmwareCloudEnvironment.PRODUCTION) {
            url = wemo.items['ifttt_URL'];
        } else if (firmwareCloud == firmwareCloudEnvironment.STAGING) {
            url = wemo.items['staging_ifttt_URL'];
        }
        var urlArr = url.split("@@@");
        var iftttUrl = urlArr[0] + activate_pin + urlArr[1];
        wemoUtil.infoLog(wemoUtil.TAG, ' iftttUrl: ' + iftttUrl);
        return iftttUrl;
    },


    //dedicated to ashish
    remoteTypeToLocalType: function(remoteType) {
        //wemoUtil.infoLog(wemoUtil.TAG,"Remote type to local type: -IN- "+remoteType);
        switch (remoteType) {
            case wemoSwitch.REMOTE_TYPE:
                return wemoSwitch.TYPE;
            case wemoSensor.REMOTE_TYPE:
                return wemoSensor.TYPE;
            case wemoDimmer.REMOTE_TYPE:
                return wemoDimmer.TYPE;
            case wemoLightSwitch.REMOTE_TYPE:
                return wemoLightSwitch.TYPE;
            case wemoInsight.REMOTE_TYPE:
                return wemoInsight.TYPE;
            case wemoRemoteDeviceType.BRIDGE:
                return wemoLed.TYPE;
            case wemoSlowCooker.REMOTE_TYPE:
                return wemoSlowCooker.TYPE;
            case wemoMaker.REMOTE_TYPE:
                return wemoMaker.TYPE;
            case wemoCoffeeMaker.REMOTE_TYPE:
                return wemoCoffeeMaker.TYPE;
            case wemoHeater.REMOTE_TYPE:
                return wemoHeater.TYPE;
            case wemoHeaterA.REMOTE_TYPE:
                return wemoHeaterA.TYPE;
            case wemoHeaterB.REMOTE_TYPE:
                return wemoHeaterB.TYPE;
            case wemoHumidifier.REMOTE_TYPE:
                return wemoHumidifier.TYPE;
            case wemoHumidifierB.REMOTE_TYPE:
                return wemoHumidifierB.TYPE;
            case wemoAirPurifier.REMOTE_TYPE:
                return wemoAirPurifier.TYPE;
            default:
                //wemoUtil.infoLog(wemoUtil.TAG,"Remote type to local type: -CASE-Default- "+remoteType);
                return false;
        }
    },

    //get default icon base on type
    getDefaultIconPath: function(deviceType) {
        switch (deviceType) {
            case wemoSwitch.TYPE:
                return wemoSwitch.ICON;
            case wemoSensor.TYPE:
                return wemoSensor.ICON;
            case wemoLightSwitch.TYPE:
                return wemoLightSwitch.ICON;
            case wemoInsight.TYPE:
                return wemoInsight.ICON;
            case wemoLed.TYPE:
                return wemoLed.ICON;
            case wemoMaker.TYPE:
                return wemoMaker.ICON;
            default:
                return false;
        }
    },
  //get default icon based on remote type
    getDefaultIconPathRemote: function (deviceType) {
        switch (deviceType) {
            case wemoSwitch.REMOTE_TYPE:
                return wemoSwitch.ICON;
            case wemoSensor.REMOTE_TYPE:
                return wemoSensor.ICON;
            case wemoLightSwitch.REMOTE_TYPE:
                return wemoLightSwitch.ICON;
            case wemoInsight.REMOTE_TYPE:
                return wemoInsight.ICON;
            case wemoLed.REMOTE_TYPE:
                return wemoLed.ICON;
            case wemoMaker.REMOTE_TYPE:
            	return wemoMaker.ICON;
            case wemoSlowCooker.REMOTE_TYPE:
            	return wemoSlowCooker.ICON;
            case wemoHeaterA.REMOTE_TYPE:
            	return wemoHeaterA.ICON;
            case wemoHeaterB.REMOTE_TYPE:
            	return wemoHeaterB.ICON;
            case wemoAirPurifier.REMOTE_TYPE:
            	return wemoAirPurifier.ICON;
            case wemoHumidifier.REMOTE_TYPE:
            	return wemoHumidifier.ICON;
            case wemoHumidifierB.REMOTE_TYPE:
            	return wemoHumidifierB.ICON;
            case wemoCoffeeMaker.REMOTE_TYPE:
            	return wemoCoffeeMaker.ICON;
            default:
                return false;
        }
    },
    //get default friendly name based on remote type
    getDefaultFriendlyName: function(deviceType){
    	switch (deviceType) {
    		case wemoSwitch.REMOTE_TYPE:
    			return wemo.items['DefaultName_WeMoSwitch'];
    		case wemoSensor.REMOTE_TYPE:
    			return wemo.items['DefaultName_WeMoMotion'];
    		case wemoLightSwitch.REMOTE_TYPE:
    			return wemo.items['DefaultName_WeMoLightSwitch'];
    		case wemoInsight.REMOTE_TYPE:
    			return wemo.items['DefaultName_WeMoInsight'];
    		case wemoLed.REMOTE_TYPE:
    			return wemo.items['DefaultName_wemoLed'];
    		case wemoMaker.REMOTE_TYPE:
    			return wemo.items['DefaultName_WeMoMaker'];
    		case wemoSlowCooker.REMOTE_TYPE:
    			return wemo.items['DefaultName_WeMoSlowCooker'];
    		case wemoHeaterA.REMOTE_TYPE:
    			return wemo.items['DefaultName_WeMoHeaterA'];
    		case wemoHeaterB.REMOTE_TYPE:
    			return wemo.items['DefaultName_WeMoHeaterB'];
    		case wemoAirPurifier.REMOTE_TYPE:
    			return wemo.items['DefaultName_WeMoAirPurifier'];
    		case wemoHumidifier.REMOTE_TYPE:
    			return wemo.items['DefaultName_WeMoHumidifier'];
    		case wemoHumidifierB.REMOTE_TYPE:
    			return wemo.items['DefaultName_WeMoHumidifierB'];
    		case wemoCoffeeMaker.REMOTE_TYPE:
    			return wemo.items['DefaultName_WeMoCoffeeMaker'];
    		default:
    			return false;
    	}

    },
    buildCloudRequestForScheduledStringSO: function(deviceID, macAddress, weekArray) {

        request = '<plugins> ' +
            '<plugin>' +
            '<recipientid>' + deviceID + '</recipientid>' +
            '<macAddress>' + macAddress + '</macAddress>' +
            '<content>' +
            '<![CDATA[<updateweeklycalendar>' +
            '<mon>' + wemoUtil.getVal(weekArray[0]) + '</mon>' +
            '<tues>' + wemoUtil.getVal(weekArray[1]) + '</tues>' +
            '<wed>' + wemoUtil.getVal(weekArray[2]) + '</wed>' +
            '<thurs>' + wemoUtil.getVal(weekArray[3]) + '</thurs>' +
            '<fri>' + wemoUtil.getVal(weekArray[4]) + '</fri>' +
            '<sat>' + wemoUtil.getVal(weekArray[5]) + '</sat>' +
            '<sun>' + wemoUtil.getVal(weekArray[6]) + '</sun>' +
            '</updateweeklycalendar>]]>' +
            '</content>' +
            '</plugin> ' +
            '</plugins>';
        wemoUtil.infoLog(wemoUtil.TAG,"string:: " + request);

        return request;
    },

    getVal: function(str) {

        if (str == null || str == "" || str.length == 0) {
            return '(null)';
        } else
            return str;
    },

    buildCloudRequestForScheduledString: function(deviceID, macAddress, weekArray, type, ledid) {

        wemoUtil.infoLog(wemoUtil.TAG,"uploadScheduledStringOnCloud1 ***" + deviceID + "---" + macAddress + "---" + weekArray + "---" + type + "---" + ledid);

        if (type == "leds") {
            //code deviceID

            var rgx = /[^0-9]/;
            var modelcode = "Bridge";

            if (ledid.search(rgx) === -1) {
                devicetype = "group";
            } else {
                devicetype = "single";
            }

            wemoUtil.infoLog(wemoUtil.TAG,"devicetype " + devicetype);

            if (devicetype == "group") {
                var request = '<plugins> ' +
                    '<plugin>' +
                    '<recipientid>' + deviceID + '</recipientid>' +
                    '<macAddress>' + macAddress + '</macAddress>' +
                    //'<modelCode>' + modelcode + '</modelCode>' +
                    '<content>' +
                    '<![CDATA[<CalendarList>' +
                    '<Calendar>' +
                    '<GroupID>' + ledid + '</GroupID>' +
                    '<Mon>' + weekArray[0] + '</Mon>' +
                    '<Tues>' + weekArray[1] + '</Tues>' +
                    '<Wed>' + weekArray[2] + '</Wed>' +
                    '<Thurs>' + weekArray[3] + '</Thurs>' +
                    '<Fri>' + weekArray[4] + '</Fri>' +
                    '<Sat>' + weekArray[5] + '</Sat>' +
                    '<Sun>' + weekArray[6] + '</Sun>' +
                    '</Calendar>' +
                    '</CalendarList>]]>' +
                    '</content>' +
                    '</plugin> ' +
                    '</plugins>';
            } else {
                var request = '<plugins> ' +
                    '<plugin>' +
                    '<recipientid>' + deviceID + '</recipientid>' +
                    '<macAddress>' + macAddress + '</macAddress>' +
                    //'<modelCode>' + modelcode + '</modelCode>' +
                    '<content>' +
                    '<![CDATA[<CalendarList>' +
                    '<Calendar>' +
                    '<DeviceID>' + ledid + '</DeviceID>' +
                    '<Mon>' + weekArray[0] + '</Mon>' +
                    '<Tues>' + weekArray[1] + '</Tues>' +
                    '<Wed>' + weekArray[2] + '</Wed>' +
                    '<Thurs>' + weekArray[3] + '</Thurs>' +
                    '<Fri>' + weekArray[4] + '</Fri>' +
                    '<Sat>' + weekArray[5] + '</Sat>' +
                    '<Sun>' + weekArray[6] + '</Sun>' +
                    '</Calendar>' +
                    '</CalendarList>]]>' +
                    '</content>' +
                    '</plugin> ' +
                    '</plugins>';
            }

        } else {
            var request = '<plugins> ' +
                '<plugin>' +
                '<recipientid>' + deviceID + '</recipientid>' +
                '<macAddress>' + macAddress + '</macAddress>' +
                '<content>' +
                '<![CDATA[<updateweeklycalendar>' +
                '<mon>' + wemoUtil.getVal(weekArray[0]) + '</mon>' +
                '<tues>' + wemoUtil.getVal(weekArray[1]) + '</tues>' +
                '<wed>' + wemoUtil.getVal(weekArray[2]) + '</wed>' +
                '<thurs>' + wemoUtil.getVal(weekArray[3]) + '</thurs>' +
                '<fri>' + wemoUtil.getVal(weekArray[4]) + '</fri>' +
                '<sat>' + wemoUtil.getVal(weekArray[5]) + '</sat>' +
                '<sun>' + wemoUtil.getVal(weekArray[6]) + '</sun>' +
                '</updateweeklycalendar>]]>' +
                '</content>' +
                '</plugin> ' +
                '</plugins>';

        }
        //        var request =  '<plugins><plugin><recipientid>61236</recipientid><macAddress>08863B6C7518</macAddress><content><![CDATA[<updateweeklycalendar><mon>2|81060,1|84660,0</mon><tues>2|81060,1|84660,0</tues><wed>2|81060,1|84660,0</wed><thurs>2|81060,1|84660,0</thurs><fri>2|81060,1|84660,0</fri><sat>2|81060,1|84660,0</sat><sun>2|81060,1|84660,0</sun></updateweeklycalendar>]]></content></plugin></plugins>';

        return request;
    },
    
    uploadScheduledStringOnCloudOLD: function(deviceID, macAddress, weekArray, type, ledid) {
    	wemoUtil.infoLog(wemoUtil.TAG, "uploadScheduledStringOnCloud OLD ***" + deviceID + "---" + macAddress + "---" + weekArray + "---" + type + "---" + ledid+" isFirmWareSupportedFSR: "+isFirmWareSupportedFSR);
    	if (jQuery.inArray(macAddress, ruleDevicesMacs) == -1) {
    		ruleDevicesMacs.push(macAddress);
    	}
    	wemoUtil.setFirmwaresSupportFetchStoreRules();
    	if(isFirmWareSupportedFSR){
    		wemoUtil.infoLog(wemoUtil.TAG, 'uploadScheduledStringOnCloud OLD: ALL new FWs. Not sending any update weekly calender calls to cloud.');
    		return;
    	}
        wemoUtil.infoLog(wemoUtil.TAG, 'uploadScheduledStringOnCloud');
        var xmlRequestString = wemoUtil.buildCloudRequestForScheduledString(deviceID, macAddress, weekArray, type, ledid);
        wemoUtil.infoLog(wemoUtil.TAG, 'request: ' + xmlRequestString);

        wemoUtil.infoLog(wemoUtil.TAG, "cloudAPI.DEVICE_MESSAGE " + cloudAPI.DEVICE_MESSAGE+" request XML " + xmlRequestString);

        nativeUtilPlugin.execute(
            function(params) {
                var authCode = params[0];
                wemoUtil.infoLog(wemoUtil.TAG, "authCode in rules " + authCode+" params: "+params);

                $.ajax({
                    url: cloudAPI.DEVICE_MESSAGE,
                    type: "POST",
                    data: xmlRequestString,
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function(data) {
                    	wemoUtil.infoLog(wemoUtil.TAG, "Sucess schedule string response cloud...");
                        var responseXML = (new XMLSerializer()).serializeToString(data);
                        wemoUtil.infoLog(wemoUtil.TAG, responseXML);
                    },
                    error: function(xhr, textstatus) {
                    	wemoUtil.infoLog(wemoUtil.TAG, "entering in error schedule string");
                        wemoUtil.infoLog(wemoUtil.TAG, (new XMLSerializer()).serializeToString(xhr));
                        wemoUtil.infoLog(wemoUtil.TAG, 'status: ' + xhr.status);
                        wemoUtil.infoLog(wemoUtil.TAG, 'status text: ' + xhr.statusText);
                    }
                });
            },
            function() {
                //error callback
            	wemoUtil.infoLog(wemoUtil.TAG, "entering in error callback");
            },
            actions.GENERATE_AUTH_CODE, []
        );
    },

    //TODO: WEMO-29008: The function to check if remote is enabled or not should be in AppPlugin and not DevicePlugin. Can you please move it there?
    uploadScheduledStringOnCloud: function(xmlRequestString, type, ledid, isLEDInRule, pushScheduleSwitchCallback, callback) {
    	wemoUtil.infoLog(wemoUtil.TAG, "uploadScheduledStringOnCloud *** XML String: " + xmlRequestString + "-type: " + type + "-ledid: " + ledid + "-isLEDInRule: " + isLEDInRule + "-pushScheduleSwitchCallback: " + pushScheduleSwitchCallback +" isFirmWareSupportedFSR: "+isFirmWareSupportedFSR);
    	
    	wemoUtil.setFirmwaresSupportFetchStoreRules();
    	if(isFirmWareSupportedFSR){
    		if (isLEDInRule != 1){
    			wemoUtil.infoLog(wemoUtil.TAG, "All firmware versions are new.");
        		deviceTabPlugin.execute(
                        function(enabled) {
                            wemoUtil.infoLog(wemoUtil.TAG,"Remote enabled: " + enabled);
                            if (enabled) {
                            	//if (isMakertypeChanged)
                                  //  wemoUtil.uploadDBOnCloud(sessionStore.EDIT_DEVICE_SETTING);
                                //else
                            		wemoUtil.infoLog(wemoUtil.TAG, "STARTING UPLOAD DB CLOUD CALL");
                                    wemoUtil.uploadDBOnCloud(sessionStore.RULES_LOCATION_SETTINGS, callback);
                            	
                                
                            } else {
                                navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {
                                    loadUrlTimeoutValue: 60000
                                });
                            }
                        },
                        wemoUtil.reportError,
                        actions.IS_REMOTE_ENABLED, []
                    );
    		}else{
    			wemoUtil.infoLog(wemoUtil.TAG, "ALL NEW FWs. UPDATE WEEKLY CALENDER NOT REQUIRED. LED IN RULE, SENDING CALLBACK FOR LEDs.");
    			if (pushScheduleSwitchCallback && (typeof pushScheduleSwitchCallback != TYPE_OF.UN_DEFINED)){
    				pushScheduleSwitchCallback();
    			}
    		}
    		return;
    	}
    	
        wemoUtil.infoLog(wemoUtil.TAG, 'uploadScheduledStringOnCloud');
       // var xmlRequestString = wemoUtil.buildCloudRequestForScheduledString(ruleDevicesDataArray, type, ledid);
        
        wemoUtil.infoLog(wemoUtil.TAG, 'request: ' + xmlRequestString);

        wemoUtil.infoLog(wemoUtil.TAG, "cloudAPI.DEVICE_MESSAGE " + cloudAPI.DEVICE_MESSAGE+" request XML " + xmlRequestString);

        nativeUtilPlugin.execute(
            function(params) {
                var authCode = params[0];
                wemoUtil.infoLog(wemoUtil.TAG, "authCode in rules " + authCode+" params: "+params);

                $.ajax({
                    url: cloudAPI.DEVICE_MESSAGE,
                    type: "POST",
                    data: xmlRequestString,
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function(data) {
                    	wemoUtil.infoLog(wemoUtil.TAG, "UpdateWeeklyCalender Cloud call successed: " + data);
                    	if (isLEDInRule != 1){
                    		wemoUtil.infoLog(wemoUtil.TAG, "UDPATE WEEKLY CALENDER CLOUD CALL DONE.");
                            var responseXML = (new XMLSerializer()).serializeToString(data);
                            wemoUtil.infoLog(wemoUtil.TAG, responseXML);
                            
                            deviceTabPlugin.execute(
                                    function(enabled) {
                                        wemoUtil.infoLog(wemoUtil.TAG,"Remote enabled: " + enabled);
                                        if (enabled) {
                                        	//if (isMakertypeChanged)
                                              //  wemoUtil.uploadDBOnCloud(sessionStore.EDIT_DEVICE_SETTING);
                                            //else
                                        		wemoUtil.infoLog(wemoUtil.TAG, "STARTING UPLOAD DB CLOUD CALL");
                                                wemoUtil.uploadDBOnCloud(sessionStore.RULES_LOCATION_SETTINGS, callback);
                                        	
                                            
                                        } else {
                                            navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {
                                                loadUrlTimeoutValue: 60000
                                            });
                                        }
                                    },
                                    wemoUtil.reportError,
                                    actions.IS_REMOTE_ENABLED, []
                                );
                    	}else{
                    		wemoUtil.infoLog(wemoUtil.TAG, "UDPATE WEEKLY CALENDER CLOUD CALL DONE. LED IN RULE, SENDING CALLBACK FOR LEDs.");
                    		if (pushScheduleSwitchCallback && (typeof pushScheduleSwitchCallback != TYPE_OF.UN_DEFINED)){
                				pushScheduleSwitchCallback();
                			}
                    	}
                    },
                    error: function(xhr, textstatus) {
                    	wemoUtil.infoLog(wemoUtil.TAG, "entering in error schedule string");
                        wemoUtil.infoLog(wemoUtil.TAG, (new XMLSerializer()).serializeToString(xhr));
                        wemoUtil.infoLog(wemoUtil.TAG, 'status: ' + xhr.status);
                        wemoUtil.infoLog(wemoUtil.TAG, 'status text: ' + xhr.statusText);
                    }
                });
            },
            function() {
                //error callback
            	wemoUtil.infoLog(wemoUtil.TAG, "entering in error callback");
            },
            actions.GENERATE_AUTH_CODE, []
        );
    },
    uploadScheduledStringOnCloudSO: function(deviceID, macAddress, weekArray, isLEDInRule, xmlRequestString, callback) {
        
        if(xmlRequestString == null || typeof xmlRequestString == "undefined"){
            wemoUtil.infoLog(wemoUtil.TAG, 'uploadScheduledStringOnCloudSO macAddress: ' + macAddress);
            xmlRequestString = wemoUtil.buildCloudRequestForScheduledStringSO(deviceID, macAddress, weekArray);
        }

        wemoUtil.infoLog(wemoUtil.TAG, 'request: ' + xmlRequestString);

        nativeUtilPlugin.execute(
            function(params) {
                wemoUtil.infoLog(wemoUtil.TAG,"success call back");
                var authCode = params[0];
                wemoUtil.infoLog(wemoUtil.TAG,"authCode" + authCode);
                $.ajax({
                    url: cloudAPI.DEVICE_MESSAGE,
                    type: "POST",
                    data: xmlRequestString,
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function(data) {
                        wemoUtil.infoLog(wemoUtil.TAG,"Sucess schedule string response cloud...");
                        var responseXML = (new XMLSerializer()).serializeToString(data);
                        wemoUtil.infoLog(wemoUtil.TAG, responseXML);

                        //wemoUtil.infoLog(wemoUtil.TAG, "STARTING UPLOAD DB CLOUD CALL");
                        //wemoUtil.uploadDBOnCloud(sessionStore.RULES_LOCATION_SETTINGS, callback);

                        wemoUtil.infoLog(wemoUtil.TAG, "isLEDInRule:" + isLEDInRule);
                        if (isLEDInRule != 1){
                            wemoUtil.infoLog(wemoUtil.TAG, "UDPATE WEEKLY CALENDER CLOUD CALL DONE.");
                            var responseXML = (new XMLSerializer()).serializeToString(data);
                            wemoUtil.infoLog(wemoUtil.TAG, responseXML);
                            
                            deviceTabPlugin.execute(
                                    function(enabled) {
                                        wemoUtil.infoLog(wemoUtil.TAG,"Remote enabled: " + enabled);
                                        if (enabled) {
                                            //if (isMakertypeChanged)
                                              //  wemoUtil.uploadDBOnCloud(sessionStore.EDIT_DEVICE_SETTING);
                                            //else
                                                wemoUtil.infoLog(wemoUtil.TAG, "STARTING UPLOAD DB CLOUD CALL");
                                                wemoUtil.uploadDBOnCloud(sessionStore.RULES_LOCATION_SETTINGS, callback);
                                            
                                            
                                        } else {
                                            navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {
                                                loadUrlTimeoutValue: 60000
                                            });
                                        }
                                    },
                                    wemoUtil.reportError,
                                    actions.IS_REMOTE_ENABLED, []
                            );
                        }
                    },
                    error: function(xhr, textstatus) {
                        wemoUtil.infoLog(wemoUtil.TAG, (new XMLSerializer()).serializeToString(xhr));
                        wemoUtil.infoLog(wemoUtil.TAG, 'status: ' + xhr.status);
                        wemoUtil.infoLog(wemoUtil.TAG, 'status text: ' + xhr.statusText);
                    }
                });

            },
            function() {
                //error callback
            },
            actions.GENERATE_AUTH_CODE, []
        );

    },

    uploadSOStringOnCloud: function(deviceID, macAddress, weekArray, type, ledid, isLEDInRule, xmlRequestString, callback) {
    
        if(xmlRequestString == null || typeof xmlRequestString == "undefined"){
            wemoUtil.infoLog(wemoUtil.TAG,"uploadSOStringOnCloud ***" + deviceID + "---" + macAddress + "---" + weekArray + "---" + type + "---" + ledid);
            wemoUtil.infoLog(wemoUtil.TAG, 'uploadSOStringOnCloud macAddress: ' + macAddress);
            wemoUtil.infoLog(wemoUtil.TAG, 'uploadSOStringOnCloud macAddress: ' + macAddress);

            xmlRequestString = wemoUtil.simulatedRemoteXML(deviceID, macAddress, type);
        }

        wemoUtil.infoLog(wemoUtil.TAG, 'request: ' + xmlRequestString);
        nativeUtilPlugin.execute(
            function(params) {
                wemoUtil.infoLog(wemoUtil.TAG,"uploadSOStringOnCloud success call back");
                var authCode = params[0];
                wemoUtil.infoLog(wemoUtil.TAG,"authCode" + authCode);
                $.ajax({
                    url: cloudAPI.DEVICE_MESSAGE,
                    type: "POST",
                    data: xmlRequestString,
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function(data) {
                        wemoUtil.infoLog(wemoUtil.TAG,"uploadSOStringOnCloud Sucess schedule string response cloud...weekArray: " + weekArray);
                        var responseXML = (new XMLSerializer()).serializeToString(data);
                        wemoUtil.infoLog(wemoUtil.TAG, responseXML);
                        wemoUtil.infoLog(wemoUtil.TAG,"response_SO::" + responseXML);
                        wemoUtil.uploadScheduledStringOnCloudSO(deviceID, macAddress, weekArray, isLEDInRule, xmlRequestString, callback);
                    },
                    error: function(xhr, textstatus) {
                        wemoUtil.infoLog(wemoUtil.TAG, (new XMLSerializer()).serializeToString(xhr));
                        wemoUtil.infoLog(wemoUtil.TAG, 'uploadSOStringOnCloud status: ' + xhr.status);
                        wemoUtil.infoLog(wemoUtil.TAG, 'uploadSOStringOnCloud status text: ' + xhr.statusText);
                    }
                });

            },
            function() {
                //error callback
            },
            actions.GENERATE_AUTH_CODE, []
        );

    },

    simulatedRemoteXML: function(recipientId, macAddress, type) {
        var udns = window.sessionStorage.getItem("checked_udn_array");
        var res = udns.split(",");
        wemoUtil.infoLog(wemoUtil.TAG,'coming in simulatedRemoteXML.. ' + udns);

        if (type == "leds") {
            var remoteRequest = '<plugins>' +
                '<plugin>' +
                '<recipientId>' + recipientId + '</recipientId>' +
                '<macAddress>' + macAddress + '</macAddress>' +
                '<modelCode>Bridge</modelCode>' +
                '<content>' +
                '<![CDATA[ <SimulatedRuleData>' +
                '<plugin>' +
                '<pluginId>' + recipientId + '</pluginId>' +
                '<macAddress>' + macAddress + '</macAddress>' +
                '<DeviceList>' + wemoUtil.deviceXml(res) + '</DeviceList>' +
                '<DeviceCount>' + res.length + '</DeviceCount>' +
                '</plugin>' +
                '</SimulatedRuleData>' + ']]>' +
                '</content>' +
                '</plugin>' +
                '</plugins>';
        } else {
            var remoteRequest = '<plugins>' +
                '<plugin>' +
                '<recipientId>' + recipientId + '</recipientId>' +
                '<macAddress>' + macAddress + '</macAddress>' +
                '<content>' +
                '<![CDATA[ <SimulatedRuleData>' +
                '<plugin>' +
                '<pluginId>' + recipientId + '</pluginId>' +
                '<macAddress>' + macAddress + '</macAddress>' +
                '<DeviceList>' + wemoUtil.deviceXml(res) + '</DeviceList>' +
                '<DeviceCount>' + res.length + '</DeviceCount>' +
                '</plugin>' +
                '</SimulatedRuleData>' + ']]>' +
                '</content>' +
                '</plugin>' +
                '</plugins>';
        }


        wemoUtil.infoLog(wemoUtil.TAG,"remote xml from js :: " + remoteRequest);
        return remoteRequest;

    },
    deviceXml: function(DeviceXml) {
        //var devicexml  = '<SimulatedRuleData>';
        var deviceXmls = "";
        for (var count = 0; count < DeviceXml.length; count++) {
            deviceXmls = deviceXmls + '<Device>' +

            '<UDN>' + DeviceXml[count] + '</UDN>' +

            '<index>' + count + '</index>' +

            '</Device>';

        }

        var finalXml = '<SimulatedRuleData>' + deviceXmls + '</SimulatedRuleData>';
        return finalXml;
    },

    soString2: function(str) {
        var tempStr = str;
        var lastvar = parseInt(tempStr.substring(tempStr.length - 1));
        if (lastvar < 3)
            lastvar += 3;
        tempStr = tempStr.replace(tempStr, tempStr.substring(0, tempStr.length - 1) + lastvar);
        return tempStr;
    },

    showModal: function() {
        //        navigator.notification.activityStart("", wemo.items['Devices_LookingForDevices']);
        //        nativeUtilPlugin.execute(null,null,actions.SHOW_PROGRESS,[]);

        nativeUtilPlugin.execute(null, null, actions.SHOW_RULE_PROGRESS, ["", wemo.items['RULE_STATUS_REFRESHING_DB']]);

        /* $("body").append('<div id="mask" class="modalWindow"/>');

             $.mobile.showPageLoadingMsg("a", wemo.items['Devices_LookingForDevices']);*/
    },

    hideModal: function() {
        //        navigator.notification.activityStop();
        nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
        /*$("#mask").remove();
             $.mobile.hidePageLoadingMsg();*/
    },


    downloadDBFromCloud: function(loadDB, goBack, callback) {
    	wemoUtil.infoLog(TAG, "downloadDBFromCloud goBack :: " + goBack);
        cordova.exec(
            function(params) {
            	wemoUtil.infoLog(TAG, "success call back- downloadDBFromCloud " + params[1] + " : " + params[0] + ' goBack ::  ' + goBack);
                var homeId = params[1];
                var authCode = params[0]; 

                wemoUtil.infoLog(TAG, "success call back home id...: " + homeId + " authCode...: " + authCode);

                $.ajax({
                    url: cloudAPI.LED_DEVICE_LIST + homeId,
                    type: "GET",
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function(data) {
                        $('#device_list_container').empty();

                        var arraySwitchObjects = [];
                        var arraySensorObjects = [];
                        var arrayMakerObjects = [];
                        var arrayLEDObjects = [];
                        var arrayHomeSensorObjects = [];
                        var jsonArr = [];
                        var bridgeUds = [];
                        var parentIds = [];


                        var xmlString = "<plugins>";
                        //$(data).find('plugin').each(function (i) {
                        $(data).find('device').each(function(i) {
                        	wemoUtil.infoLog(TAG, "Plugin: " + i);

                            if ($(this).find("pluginId").text() != "") {
                                var attributeSupport = false;
                                var deviceObject = {};
                                var device_status = $(this).find("status").text();
                                var device_plugin_id = $(this).find("pluginId").text();
                                var device_mac_address = $(this).find("macAddress").text();
                                var device_udn = $(this).find("uniqueId").text();
                                var device_frindly_name = $(this).find("friendlyName").text();
                                var device_model_code = $(this).find("modelCode").text();

                                if(device_model_code == "NestThermostat"){
                                    return true;
                                }

                                var device_attributelist = $(this).find("attributelist").text();
                                if (device_attributelist != undefined) {
                                    device_attributelist = "{";
                                    $(this).find('attribute').each(function(i) {
                                        attributeSupport = true;
                                        wemoUtil.infoLog(TAG, "loadDevicesFromCloud device_attributelist ::" + device_attributelist);
                                        var name = $(this).find("name").text();
                                        device_attributelist = device_attributelist + name;
                                        device_attributelist = device_attributelist + ":{\"name\":" + name;
                                        device_attributelist = device_attributelist + ",\"value\":\"" + $(this).find("value").text() + "\"}";
                                        device_attributelist = device_attributelist + ",";
                                    });
                                    device_attributelist = device_attributelist.substring(0, device_attributelist.lastIndexOf(','));
                                    device_attributelist = device_attributelist + "}";
                                    wemoUtil.infoLog(TAG, "loadDevicesFromCloud::: " + device_attributelist);
                                }
                                if (device_model_code == wemoLed.REMOTE_TYPE || wemoUtil.isSupportedLedModelCode(device_model_code)) {
                                    var device_parent_plugin_id = $(this).find("parentPluginId").text();

                                    if (jQuery.inArray(device_parent_plugin_id, parentIds) == -1) {
                                        parentIds.push(device_parent_plugin_id);
                                    }

                                    if (device_frindly_name == "" || device_frindly_name == null || device_frindly_name == undefined)
                                        device_frindly_name = wemo.items['dimmableLight'];
                                }
                                if (wemoUtil.isMakerDevice(device_udn)) {
                                    deviceObject[key.DEVICE_UDN] = wemoUtil.getOriginalMakerUDN(device_udn);
                                } else {
                                    deviceObject[key.DEVICE_UDN] = device_udn;
                                }
                                deviceObject[key.DEVICE_FRIENDLY_NAME] = device_frindly_name;
                                deviceObject[key.DEVICE_MAC_ADDRESS] = device_mac_address;
                                deviceObject[key.DEVICE_PLUGIN_ID] = device_plugin_id;

                                wemoUtil.infoLog(TAG, "downloadDBFromCloud() Device Details...: " + device_plugin_id + " : " + device_mac_address + " : " + device_status);

                                if (device_status != '3' && device_status != '4') {
                                    if (device_model_code == wemoSwitch.REMOTE_TYPE || device_model_code == wemoLightSwitch.REMOTE_TYPE) {
                                        arraySwitchObjects.push(deviceObject);
                                    } else if (device_model_code == wemoSensor.REMOTE_TYPE) {
                                        arraySensorObjects.push(deviceObject);
                                    } else if (device_model_code == wemoMaker.REMOTE_TYPE) {
                                    	wemoUtil.infoLog(TAG, "Device Details...--> pushing into maker object ");
                                        arrayMakerObjects.push(deviceObject);
                                    } else if (device_model_code == wemoLed.REMOTE_TYPE || wemoUtil.isSupportedLedModelCode(device_model_code)) {
                                        arrayLEDObjects.push(deviceObject);
                                    } else if (device_model_code == homeSenseModelCodes.PIR || device_model_code == homeSenseModelCodes.KEYFOB || device_model_code == homeSenseModelCodes.DOORWINDOWS) {
                                    	arrayHomeSensorObjects.push(deviceObject);
                                    } else if (device_model_code == "Bridge") {
                                        if (jQuery.inArray(device_plugin_id, parentIds) != -1) {
                                            bridgeUds.push(deviceObject);
                                        }
                                    }
                                    xmlString += wemoUtil.buildXMLForGetDB(device_plugin_id, device_mac_address, device_model_code);
                                }
                            }

                        });

                        xmlString += "</plugins>";

                        wemoUtil.infoLog(TAG, "XML String downloadDBFromCloud...xmlString: : " + xmlString);
                        wemoUtil.infoLog(TAG, "device list size: " + arraySwitchObjects.length + "device list size: " + Object.keys(arraySwitchObjects).length + "Maker device list size: " + arrayMakerObjects.length + "device list size LEds: " + Object.keys(arrayLEDObjects).length + "device list size Bridges: " + Object.keys(bridgeUds).length);

                        if ((arraySwitchObjects.length <= 0) && (arraySensorObjects.length <= 0) && (arrayMakerObjects.length <= 0) && (arrayLEDObjects.length <= 0) && (arrayHomeSensorObjects.length <= 0)) {
                            var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);

                            function errorCB(err) {
                            	wemoUtil.infoLog(TAG, "Error processing SQL: " + err.code);
                            }

                            function successCB() {
                            	wemoUtil.infoLog(TAG, "success!");
                                db.transaction(getDB, errorCB);
                            }

                            function getDB(tx) {
                                tx.executeSql("SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.ZBCapabilityStart, b.ZBCapabilityEnd, b.OnModeOffset, b.OffModeOffset, b.CountdownTime from RULES a inner join RULEDEVICES b on a.RuleID=CAST(b.RuleID AS CHAR) order by b.RuleID", [], querySuccess, errorCB);
                            }

                            wemoUtil.infoLog(TAG, "outside goBack :: " + goBack);

                            function querySuccess(tx, results) {
                                var pendingFirmware = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.PENDING_FIRMWARE);
                                wemoUtil.infoLog(TAG, "pending firmware uploaddb---" + pendingFirmware);

                                wemoUtil.infoLog(TAG, "goBack :: " + goBack + "---" + $.trim(sessionStore.MORE_LOCATION_SETTINGS));
                                if ($.trim(goBack) == sessionStore.LOCATION_SETTINGS) {
                                    wemoUtil.hideModal();
                                    wemoUtil.loadPreviousUrl();
                                } else if ($.trim(goBack) == $.trim(sessionStore.MORE_LOCATION_SETTINGS)) {
                                    wemoUtil.hideModal();
                                    if(callback) {
                                    console.log("callback in remote");
                                    callback();
                                    }
                                    //wemoUtil.loadUrl(filePath.MORE_SETTING_ABOUT);
                                } else if (pendingFirmware != null && pendingFirmware == "pendingFirmware") {
                                    window.sessionStorage.removeItem(sessionStore.PENDING_FIRMWARE);
                                    var fromSaveRulepage = "fromSaveRulepage";
                                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.FROM_SAVE_RULE_PAGE, fromSaveRulepage);
                                    wemoUtil.hideModal();
                                    wemoUtil.loadUrl(filePath.MORE_NEW_FIRMWARE);
                                } else if (goBack == sessionStore.EDIT_DEVICE_SETTING) {
                                    nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                                    editDevice.openDeviceListPage();
                                } else {
                                	wemoUtil.infoLog(TAG, "Fetching Data =>" + results.rows.length);
                                    var len = results.rows.length;
                                    var ruleRows = [];
                                    if (len > 0) {
                                        for (var i = 0; i < len; i++) {
                                            ruleRows[i] = results.rows.item(i);
                                        }
                                        window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));
                                        /**
                                         * Check the BLOCKEDRULES go through the autoEnableBlockedRules
                                         * Then redirect to enabled rules page.
                                         **/
                                        wemoUtil.autoEnableBlockedRules();
                                    } else {
                                        window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));
                                        if (window.sessionStorage.getItem("DeviceList") == "1") {
                                            wemoUtil.loadUrl(filePath.DEVICE_LIST);
                                        } else
                                            wemoUtil.loadUrl(filePath.CREATE_RULE);
                                    }
                                    wemoUtil.hideModal();
                                }
                            }

                            db.transaction(successCB, errorCB);
                            wemoUtil.infoLog(TAG, "Fetching Data Complete");

                        } else {
                            wemoUtil.getDeviceStatusFromCloud(xmlString, loadDB, goBack, callback);
                        }

                    },
                    error: function(xhr, textstatus) {
                    	wemoUtil.infoLog(TAG, 'status: ' + xhr.status);
                        wemoUtil.infoLog(TAG, 'status text: ' + xhr.statusText);
                        if(window.sessionStorage.getItem(sessionStore.RULES_REMOTE_MODE) == 'true') {
                            nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                            wemoUtil.loadUrl(filePath.CREATE_RULE);
                            window.sessionStorage.setItem(sessionStore.RULES_REMOTE_MODE, false);
                        }
                        if ($.trim(goBack) == $.trim(sessionStore.MORE_LOCATION_SETTINGS)) {
                            wemoUtil.hideModal();
                            if (callback) {
                                callback();
                            }
                        }
                    },
                    statusCode: {
                        500: function() {
                        	wemoUtil.infoLog(TAG, "page not found");
                        },
                        503: function() {
                        	wemoUtil.infoLog(TAG, "Cloud is down.");
                        }
                    }

                });

            },
            function(err) {
                nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                wemoUtil.infoLog(TAG, "failure call back");
            },
            "WebServicePlugin",
            "getAuthCode", []
        );
    },


    getDbVersionOnCloud: function(request, loadDB, goBack, callback) {
        var ajaxCallCount = 0;
        wemoUtil.infoLog(TAG, "getDbVersionOnCloud goBack :: " + goBack);
        console.log(TAG, "getDbVersionOnCloud request :: ");
        console.log(request);
        cordova.exec(function(params) {
            var authCode = params[0];
            var homeId = params[1];
            wemoUtil.infoLog(TAG, "authCode getDbVersionOnCloud" + authCode);

            $.ajax({
                url: cloudAPI.DEVICE_MESSAGE,
                type: "POST",
                data: request,
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('Content-Type', 'application/xml');
                    xhr.setRequestHeader('Authorization', authCode);
                },
                success: function(data) {

                	 wemoUtil.infoLog(TAG, "getDbVersionOnCloud XML " + (new XMLSerializer()).serializeToString(data) + " ajaxCallCount: " + ajaxCallCount);

                    var dbVersion = 0;
                    var xmlStringSetDb = "<plugins>";
                    var macId = "";
                    deviceTabPlugin.execute(
                        function(e) {
                            dbVersion = parseInt(e);
                            wemoUtil.infoLog(TAG, "value of dbVersion" + dbVersion);
                            var prevDbVersion = dbVersion;

                            $(data).find('plugin').each(function() {
                                var db_version = parseInt($(this).find("dbVersion").text());
                                wemoUtil.infoLog(TAG, "db_version " + db_version);
                                var macAddress = $(this).find("macAddress").text();
                                if(macId == ""){
                                	macId = macAddress;
                                }
                                
                                if (db_version > dbVersion) {
                                    dbVersion = db_version;
                                    macId = macAddress;
                                }
                                wemoUtil.infoLog(TAG, "Set Highest DB Before Ver : " + dbVersion);
                            });

                            wemoUtil.infoLog(TAG, "DB Version from shared preferences" + e);
                            var currentDbVersion = 0;


                            $(data).find('plugin').each(function() {
                                var macAddress = $(this).find("macAddress").text();
                                var pluginId = $(this).find("pluginId").text();
                                var processdb=0;
                                if (jQuery.inArray(macAddress, ruleDevicesMacs) != -1) {
                            		processdb=1;
                            	}
                            	
                                wemoUtil.infoLog(TAG, "Db Plug-in : " + pluginId + " Mac Id : " + macAddress + " DB Version : " + dbVersion+" processdb: "+processdb);
                                
                                if(dbFSR==null)
                                {
                                	xmlStringSetDb += wemoUtil.buildXMLForSetDB(pluginId, macAddress, dbVersion + 1);
                                }
                                else
                                {
                                	xmlStringSetDb += wemoUtil.buildXMLForStoreRule(pluginId, macAddress, dbVersion + 1, processdb);
                                }
                                wemoUtil.infoLog(TAG, "xmlStringSetDb : " + xmlStringSetDb);

                            });
                            if(dbFSR!=null)
                            {
                            	 xmlStringSetDb += "<sharedContent>"+dbFSR+"</sharedContent>";
                            }
                            xmlStringSetDb += "</plugins>";

                            wemoUtil.infoLog(TAG, "XML String SetDbVersionOnCloud:" + xmlStringSetDb);

                            //                  				Get DB File from cloud and store it SDCard
                            if (loadDB == sessionStore.REMOTE_CALL_SETDB) {
                                //  DB upload process
                            	wemoUtil.infoLog(TAG, "DB upload process ... " + goBack);
                                wemoUtil.setDbVertionOnCloud(xmlStringSetDb, dbVersion + 1, goBack, callback);
                            } else {
                                deviceTabPlugin.execute(
                                    function(pragma_version) {
                                        var pragmaDbVersion = parseInt(pragma_version);
                                        wemoUtil.infoLog(TAG, "pragmaDbVersion ::" + pragmaDbVersion);
                                        // DB Download process
                                        if (dbVersion > prevDbVersion) {
                                            wemoUtil.storeCloudDB(macId, prevDbVersion, goBack);
                                        }
                                        if(pragmaDbVersion > parseInt(SQLColumns.MAX_DB_VERSION)){
                                            wemoUtil.hideModal();
                                            wemoUtil.loadUrl(filePath.UPDATE_APP);

                                        } else {

                                            function errorCB(err) {
                                                wemoUtil.infoLog(TAG, "Error processing Remote SQL: " + err.code);
//
                                            }

                                            function successCB() {
                                                wemoUtil.infoLog(TAG, "success! querying the remote DB file");
                                                db.transaction(getDB, errorCB);
                                            }

                                            function getDB(tx) {
                                                tx.executeSql("SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.ZBCapabilityStart, b.ZBCapabilityEnd, b.OnModeOffset, b.OffModeOffset, b.CountdownTime from RULES a inner join RULEDEVICES b on a.RuleID=CAST(b.RuleID AS CHAR) order by b.RuleID", [], querySuccess, errorCB);
                                            }

                                            function querySuccess(tx, results) {
                                                var pendingFirmware = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.PENDING_FIRMWARE);
                                                wemoUtil.infoLog(TAG, "pending firmware uploaddb---" + pendingFirmware);

                                                wemoUtil.infoLog(TAG, "entering query sucess...");
                                                if (goBack == sessionStore.LOCATION_SETTINGS) {
                                                    wemoUtil.hideModal();
                                                    wemoUtil.loadPreviousUrl();
                                                } else if (goBack == sessionStore.MORE_LOCATION_SETTINGS) {
                                                    wemoUtil.hideModal();
                                                    if(callback) {
                                                        callback();
                                                    }
                                                    //wemoUtil.loadUrl(filePath.MORE_SETTING_ABOUT);
                                                } else if (pendingFirmware != null && pendingFirmware == "pendingFirmware") {
                                                    window.sessionStorage.removeItem(sessionStore.PENDING_FIRMWARE);
                                                    var fromSaveRulepage = "fromSaveRulepage";
                                                    wemoUtil.setJSONObjectToSessionStorage(sessionStore.FROM_SAVE_RULE_PAGE, fromSaveRulepage);
                                                    wemoUtil.hideModal();
                                                    wemoUtil.loadUrl(filePath.MORE_NEW_FIRMWARE);
                                                } else {
                                                    wemoUtil.infoLog(TAG, "Fetching Data else =>" + results.rows.length);
                                                    var len = results.rows.length;
                                                    var ruleRows = [];
                                                    if (len > 0) {
                                                        for (var i = 0; i < len; i++) {
                                                            ruleRows[i] = results.rows.item(i);
                                                        }
                                                        window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));
                                                        wemoUtil.infoLog(TAG, "Fetching Data before =>");

                                                        wemoUtil.autoEnableBlockedRules();
                                                    } else {
                                                        window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));
                                                        wemoUtil.loadUrl(filePath.CREATE_RULE);
                                                    }
                                                }
//
                                            }

                                            wemoUtil.infoLog(TAG, "Fetching Data Complete....");
                                            var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
                                            db.transaction(successCB, errorCB);

                                            if (pragmaDbVersion !== parseInt(SQLColumns.MAX_DB_VERSION)) {
                                                wemoUtil.infoLog(TAG, "prevDbVersion < " + SQLColumns.MAX_DB_VERSION + ". Need to be upgraded");

                                                wemoUtil.infoLog(TAG, "Upgrading...");
                                                setTimeout(function() {
                                                    deviceTabPlugin.execute(null, null, actions.WRITE_PRAGA_VERSION, [SQLColumns.MAX_DB_VERSION]);
                                                }, 100);
                                            }
                                        }

                                    },
                                    wemoUtil.reportError,
                                    actions.READ_PRAGA_VERSION, []
                                );
                            }

                        },
                        wemoUtil.reportError,
                        actions.GET_REMOTE_DB_VERSION, []
                    );
                },
                error: function(xhr, textstatus) {
                	wemoUtil.infoLog(TAG, 'status: ' + xhr.status);
                	wemoUtil.infoLog(TAG, 'status text: ' + xhr.statusText);
                    if (xhr.status == 0 && ajaxCallCount < 3) {
                        wemoUtil.uploadScheduledStringOnCloudOLD(deviceID, macAddress, weekArray, "", "");
                        ajaxCallCount++;
                    }
                    if(window.sessionStorage.getItem(sessionStore.RULES_REMOTE_MODE) == 'true') {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                        wemoUtil.loadUrl(filePath.CREATE_RULE);
                        window.sessionStorage.setItem(sessionStore.RULES_REMOTE_MODE, false);
                        return;
                    }

                    if (window.sessionStorage.getItem("create_rule") == "1") {
                        wemoUtil.loadUrl(filePath.CREATE_RULE);
                        window.sessionStorage.removeItem("create_rule");
                    } else {
                        wemoUtil.loadUrl(filePath.ENABLED_RULES);
                    }
                },
                statusCode: {
                    500: function() {
                    	wemoUtil.infoLog(TAG, "page not found");
                    }
                }

            });

        }, function(err) {
        	wemoUtil.infoLog(TAG, "failure call back");
        }, "WebServicePlugin", "getAuthCode", []);

    },

    getDeviceStatusFromCloud: function(xmlStringDeviceList, loadDB, goBack, callback) {
    	wemoUtil.infoLog(TAG, "getDeviceStatusFromCloud goBack :: " + goBack);
        wemoUtil.getDbVersionOnCloud(xmlStringDeviceList, loadDB, goBack, callback);
    },

    getDeviceStatusAfterSaveFromCloud: function(dbVersion, goBack, callback) {
    	wemoUtil.infoLog(TAG, "authCode getDeviceStatusAfterSaveFromCloud " + goBack)
        setTimeout(function() {
            deviceTabPlugin.execute(
                function(responseAry) {

                	if (callback){
                		callback();
                	}else{
                		var pendingFirmware = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.PENDING_FIRMWARE);
                        wemoUtil.infoLog(TAG, "pending firmware uploaddb---" + pendingFirmware);
                        if (goBack == sessionStore.LOCATION_SETTINGS) {
                            wemoUtil.hideModal();
                            wemoUtil.loadPreviousUrl();
                        } else if (goBack == sessionStore.MORE_LOCATION_SETTINGS) {
                            wemoUtil.hideModal();
                            //wemoUtil.loadUrl(filePath.MORE_SETTING_ABOUT);
                        } else if (pendingFirmware != null && pendingFirmware == "pendingFirmware") {
                            window.sessionStorage.removeItem(sessionStore.PENDING_FIRMWARE);
                            var fromSaveRulepage = "fromSaveRulepage";
                            wemoUtil.setJSONObjectToSessionStorage(sessionStore.FROM_SAVE_RULE_PAGE, fromSaveRulepage);
                            wemoUtil.hideModal();
                            wemoUtil.loadUrl(filePath.MORE_NEW_FIRMWARE);
                        } else if (goBack == sessionStore.EDIT_DEVICE_SETTING) {
                            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
                            editDevice.openDeviceListPage();
                        } else {
                            wemoUtil.infoLog(wemoUtil.TAG,"sucess call back - getDeviceStatusAfterSaveFromCloud " + responseAry);
                            if(window.sessionStorage.getItem(sessionStore.RULES_REMOTE_MODE) == 'true') {
                                nativeUtilPlugin.execute(null, null, actions.HIDE_RULE_PROGRESS, []);
                                wemoUtil.loadUrl(filePath.CREATE_RULE);
                                window.sessionStorage.setItem(sessionStore.RULES_REMOTE_MODE, false);
                                return;
                            }
                            if (window.sessionStorage.getItem("create_rule") == "1") {
                                wemoUtil.loadUrl(filePath.CREATE_RULE);
                                window.sessionStorage.removeItem("create_rule");
                            } else
                                wemoUtil.loadUrl(filePath.ENABLED_RULES);
                        }
                	}
                    
                },
                function() {
                    wemoUtil.infoLog(wemoUtil.TAG,"failure DB call back - getDeviceStatusAfterSaveFromCloud ");
                },
                actions.SET_REMOTE_DB_VERSION, [dbVersion]
            );
        }, 100);
    },

    storeRemoteValue: function() {
        cordova.exec(
            function(params) {
                wemoUtil.infoLog(wemoUtil.TAG,"success call back- storeRemoteValue " + params[1] + " : " + params[0]);
                var homeId = params[1];
                var authCode = params[0]; //params.split('~')[1];

                wemoUtil.infoLog(wemoUtil.TAG,"success call back storeRemoteValue - home id...: " + cloudAPI.LED_DEVICE_LIST + homeId);
                wemoUtil.infoLog(wemoUtil.TAG,"success call back authCode...: " + authCode);

                $.ajax({
                    //url: cloudAPI.DEVICE_LIST + homeId,
                    //type: "GET",
                    url: cloudAPI.LED_DEVICE_LIST + homeId,
                    type: "GET",
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function(data) {
                        //wemoUtil.infoLog(wemoUtil.TAG,"success callback from cloud: " + String(data));
                        $('#device_list_container').empty();

                        var arrayRemSwitchObjects = [];
                        var arrayRemLightSwitchObjects = [];
                        var arrayRemSensorObjects = [];
                        var arrayRemDimmerObjects = [];
                        var arrayRemNestObjects = [];
                        var arrayRemInsightObjects = [];
                        var arrayRemBothObjects = [];
                        var arrayRemMakerObjects = [];
                        var arrayRemLedDeviceObjects = [];
                        var arrayRemPIRSensorObject = [];
                        var arrayRemFobSensorObject = [];
                        var arrayRemDWSensorObject = [];
                        var bridgeUds = [];
                        var parentIds = [];
                        var jsonArr = [];
                        var groupIdArr = [];

                        //$(data).find('plugin').each(function (i) {
                        $(data).find('device').each(function(i) {
                            wemoUtil.infoLog(wemoUtil.TAG,"Plugin: " + i);

                            if ($(this).find("pluginId").text() != "") {
                                var deviceRemObject = {},
                                    isAttributesPresent = false;
                                var deviceBridgeRemObject = {};

                                var device_udn = $(this).find("uniqueId").text();
                                var device_model_code = $(this).find("modelCode").text();
                                var device_status = $(this).find("status").text();
                                var device_plugin_id = $(this).find("pluginId").text();
                                var device_mac_address = $(this).find("macAddress").text();
                                var device_frindly_name = $(this).find("friendlyName").text();
                                var device_status_timestamp = $(this).find("statusTS").text();
                                var device_attributelist = $(this).find("attributelist").text();
                                var device_ledFirmware = $(this).find("firmwareVersion").text();
                                var device_parentName = $(this).find("parentName").text();
                                var device_onlineStatus = $(this).find("onLine").text();

                                if (device_attributelist != undefined) {
                                    wemoUtil.infoLog(wemoUtil.TAG,"storeRemoteValue- device_attributelist is not undefined: " + device_attributelist);
                                    device_attributelist = "{";
                                    $(this).find('attribute').each(function(i) {
                                        isAttributesPresent = true;
                                        wemoUtil.infoLog(wemoUtil.TAG,"storeRemoteValue- loadDevicesFromCloud 222" + device_attributelist);
                                        var name = $(this).find("name").text();
                                        if (name == "SensorPresent" || name == "sensorPresent") {
                                            device_attributelist = device_attributelist + "\"SensorPresent\"";
                                            device_attributelist = device_attributelist + ":{\"name\":\"SensorPresent\"";
                                            device_attributelist = device_attributelist + ",\"value\":\"" + $(this).find("value").text() + "\"}";
                                            device_attributelist = device_attributelist + ",";
                                        } else if (name == "SwitchMode" || name == "switchMode") {
                                            device_attributelist = device_attributelist + "\"SwitchMode\"";
                                            device_attributelist = device_attributelist + ":{\"name\":\"SwitchMode\"";
                                            device_attributelist = device_attributelist + ",\"value\":\"" + $(this).find("value").text() + "\"}";
                                            device_attributelist = device_attributelist + ",";
                                        } else {
                                            device_attributelist = device_attributelist + "\"" + name + "\"";
                                            device_attributelist = device_attributelist + ":{\"name\":" + "\"" + name + "\"";
                                            device_attributelist = device_attributelist + ",\"value\":\"" + $(this).find("value").text() + "\"}";
                                            device_attributelist = device_attributelist + ",";
                                        }
                                    });
                                    device_attributelist = device_attributelist.substring(0, device_attributelist.lastIndexOf(','));
                                    device_attributelist = device_attributelist + "}";
                                    wemoUtil.infoLog(wemoUtil.TAG,"storeRemoteValue- loadDevicesFromCloudin getDeviceList " + device_attributelist);
                                    if (isAttributesPresent)
                                        device_attributelist = JSON.parse(device_attributelist);
                                }

                                if (wemoUtil.isMakerDevice(device_udn)) {
                                    deviceRemObject[key.DEVICE_UDN] = wemoUtil.getOriginalMakerUDN(device_udn);
                                } else {
                                    deviceRemObject[key.DEVICE_UDN] = device_udn;
                                }
                                if(device_model_code == "NestThermostat"){
                                    deviceRemObject['parentName'] = device_parentName;
                                }
                                deviceRemObject[key.DEVICE_TYPE] = device_model_code;
                                deviceRemObject[key.DEVICE_STATE] = $.trim(device_status);
                                deviceRemObject[key.DEVICE_FRIENDLY_NAME] = device_frindly_name;
                                deviceRemObject[key.DEVICE_PLUGIN_ID] = device_plugin_id;
                                deviceRemObject[key.DEVICE_MAC_ADDRESS] = device_mac_address;
                                deviceRemObject[key.DEVICE_STATUS_TIMESTAMP] = device_status_timestamp;

                                wemoUtil.infoLog(wemoUtil.TAG,"storeRemoteValue Device Details...: " + device_plugin_id + " : " + device_mac_address + "---" + device_model_code + "----" + device_frindly_name);

                                /***** LED Device Related Capabilities and Group Info *******/

                                if (device_model_code == wemoLed.REMOTE_TYPE || wemoUtil.isSupportedLedModelCode(device_model_code) || device_model_code == wemoUtil.isSupportedHomesenseModelCode(device_model_code)) {
                                    if (device_frindly_name == "" || device_frindly_name == null || device_frindly_name == undefined)
                                        deviceRemObject[key.DEVICE_FRIENDLY_NAME] = wemo.items['dimmableLight'];
                                    deviceRemObject[key.LED_FIRMWARE_VERSION] = device_ledFirmware;

                                    var device_parent_plugin_id = $(this).find("parentPluginId").text();

                                    if (jQuery.inArray(device_parent_plugin_id, parentIds) == -1) {
                                        parentIds.push(device_parent_plugin_id);
                                    }
                                    var capability1="";
                                    var capability2="";
                                    $(this).find('deviceCapabilityProfile').each(function(i) {

                                        if ($(this).find("capabilityId").text() == "10006") {
                                            var device_current_status_value = $(this).find("currentValue").text();
                                            deviceRemObject[key.DEVICE_CURRENT_STATUS_VAL] = $.trim(device_current_status_value);
                                            capability1 = $(this).find("capabilityId").text();
                                        } else if ($(this).find("capabilityId").text() == "10008") {
                                            var device_current_dimming_value = $(this).find("currentValue").text();
                                            capability2 = $(this).find("capabilityId").text();

                                            if (device_current_dimming_value.search(":") == -1) {
                                                wemoUtil.infoLog(wemoUtil.TAG,"entering if----" + device_current_dimming_value);
                                                deviceRemObject[key.DEVICE_CURRENT_DIMMING_VAL] = $.trim(device_current_dimming_value);
                                            } else {
                                                var dimmingCurValArr = device_current_dimming_value.split(":");
                                                device_current_dimming_value = dimmingCurValArr[0];
                                                wemoUtil.infoLog(wemoUtil.TAG,"entering else----" + device_current_dimming_value);
                                                deviceRemObject[key.DEVICE_CURRENT_DIMMING_VAL] = $.trim(device_current_dimming_value);
                                            }


                                            var device_allowed_values = $(this).find("allowedValues").text();

                                            if (device_allowed_values != "") {
                                                var allowedValArr = device_allowed_values.split("~");
                                                var allowedSubArr = allowedValArr[1].split(",");


                                                if ($.isNumeric(allowedSubArr[0])) {
                                                    deviceRemObject[key.DEVICE_ALLOWED_VAL] = allowedSubArr[0];
                                                } else {
                                                    deviceRemObject[key.DEVICE_ALLOWED_VAL] = "255";
                                                }

                                                wemoUtil.infoLog(wemoUtil.TAG,"dadasdadasd---" + allowedSubArr[0]);
                                            } else {
                                                deviceRemObject[key.DEVICE_ALLOWED_VAL] = "255";
                                            }

                                        }

                                    });

                                    var device_capabilityId = capability1 + "," + capability2;
                                    deviceRemObject[key.DEVICE_CAPABILITY_ID] = device_capabilityId;
                                    deviceRemObject[key.DEVICE_GROUP_ID] = "";
                                    deviceRemObject[key.DEVICE_GROUP_NAME] = "";
                                    deviceRemObject[key.DEVICE_ALREADY_GROUP_EXIST] = "";
                                    deviceRemObject[key.DEVICE_GROUP_UNIQUE_ID] = "";

                                    $(this).find('groupProfile').each(function(i) {
                                        var groupname = $(this).find("groupName").text();
                                        var groupId = $(this).find("referenceId").text();
                                        var groupuniqeId = $(this).find("id").text();

                                        wemoUtil.infoLog(wemoUtil.TAG,"group ids enter" + groupId + "*****" + jsonArr);

                                        if (jQuery.inArray(groupId, jsonArr) == -1) {
                                            wemoUtil.infoLog(wemoUtil.TAG,"reterive the id" + groupId + "*****" + device_plugin_id);
                                            jsonArr.push(groupId);
                                            deviceRemObject[key.DEVICE_GROUP_ID] = groupId;
                                            deviceRemObject[key.DEVICE_GROUP_NAME] = groupname;
                                            deviceRemObject[key.DEVICE_GROUP_UNIQUE_ID] = groupuniqeId;
                                            deviceRemObject[key.DEVICE_ALREADY_GROUP_EXIST] = "newgroup";
                                            deviceRemObject[key.DEVICE_FRIENDLY_NAME] = groupname;
                                            deviceRemObject[key.DEVICE_MAC_ADDRESS] = groupId;
                                        } else {
                                            wemoUtil.infoLog(wemoUtil.TAG,"entering in else ghroup11" + device_plugin_id);
                                            groupIdArr.push(groupId);
                                            deviceRemObject[key.DEVICE_ALREADY_GROUP_EXIST] = "alreadygroupexist";
                                            deviceRemObject[key.DEVICE_GROUP_ID] = "";
                                            deviceRemObject[key.DEVICE_GROUP_NAME] = "";
                                            deviceRemObject[key.DEVICE_GROUP_UNIQUE_ID] = "";
                                        }

                                    });

                                }

                                if (device_model_code == "Bridge") {
                                    wemoUtil.infoLog(wemoUtil.TAG,"entering in bridge");
                                    if (jQuery.inArray(device_plugin_id, parentIds) != -1) {
                                        deviceBridgeRemObject[key.DEVICE_UDN] = device_udn;
                                        deviceBridgeRemObject[key.DEVICE_MAC_ADDRESS] = device_mac_address;
                                        deviceBridgeRemObject[key.DEVICE_PLUGIN_ID] = device_plugin_id;
                                        bridgeUds.push(deviceBridgeRemObject);
                                    } else {
                                        deviceBridgeRemObject[key.DEVICE_UDN] = device_udn;
                                        deviceBridgeRemObject[key.DEVICE_MAC_ADDRESS] = device_mac_address;
                                        deviceBridgeRemObject[key.DEVICE_PLUGIN_ID] = device_plugin_id;
                                        bridgeUds.push(deviceBridgeRemObject);
                                    }
                                }

                                /***** LED Device Related Capabilities and Group Info Ends*******/
                                wemoUtil.infoLog(wemoUtil.TAG,"entering in store array 1" + JSON.stringify(deviceRemObject) + "--" + JSON.stringify(deviceBridgeRemObject));

                                var isNestOnline = false;

                                if(device_attributelist.OnLine){
                                    isNestOnline = (device_attributelist.OnLine["value"] == "true");
                                }


                                if ((device_status != '3' && device_status != '4') || isNestOnline) {
                                    //if (device_status == '3' || device_status == '4' || device_status == '1' || device_status == '0') {
                                    wemoUtil.infoLog(wemoUtil.TAG,"entering in store array 2" + JSON.stringify(deviceRemObject));
                                    if (device_model_code == wemoSwitch.REMOTE_TYPE || device_model_code == wemoLightSwitch.REMOTE_TYPE) {
                                        arrayRemSwitchObjects.push(deviceRemObject);

                                        if (device_model_code == wemoLightSwitch.REMOTE_TYPE) {
                                            arrayRemLightSwitchObjects.push(deviceRemObject);
                                        }
                                    } else if (device_model_code == wemoDimmer.REMOTE_TYPE ) {
                                        arrayRemDimmerObjects.push(deviceRemObject);
                                    } else if (device_model_code == wemoSensor.REMOTE_TYPE || wemoUtil.isCamDevice(device_model_code)) {
                                        arrayRemSensorObjects.push(deviceRemObject);
                                    }  else if (device_model_code == nestThermostat.REMOTE_TYPE) {
                                        arrayRemNestObjects.push(deviceRemObject);
                                    } else if (device_model_code == wemoInsight.REMOTE_TYPE) {
                                        arrayRemInsightObjects.push(deviceRemObject);
                                    } else if (device_model_code == wemoMaker.REMOTE_TYPE) {
                                        wemoUtil.infoLog(wemoUtil.TAG,"storeRemoteValue- Pushing into maker object");
                                        if (device_attributelist.SensorPresent != undefined)
                                            deviceRemObject[key.MAKER_SENSORPRESENT] = device_attributelist.SensorPresent.value;
                                        else
                                            deviceRemObject[key.MAKER_SENSORPRESENT] = "0";
                                        if (device_attributelist.SwitchMode != undefined)
                                            deviceRemObject[key.MAKER_SWITCHMODE] = device_attributelist.SwitchMode.value;
                                        else
                                            deviceRemObject[key.MAKER_SWITCHMODE] = "0";
                                        arrayRemMakerObjects.push(deviceRemObject);
                                    } else if (device_model_code == wemoLed.REMOTE_TYPE || wemoUtil.isSupportedLedModelCode(device_model_code)) {
                                        wemoUtil.infoLog(wemoUtil.TAG,"entering in LEDS storedevices");

                                        if (deviceRemObject[key.DEVICE_ALREADY_GROUP_EXIST] != "alreadygroupexist") {
                                            arrayRemLedDeviceObjects.push(deviceRemObject);
                                        }

                                        wemoUtil.infoLog(wemoUtil.TAG,"entering in store array 3" + JSON.stringify(arrayRemLedDeviceObjects));
                                    }
                                    else if (device_model_code == homeSenseModelCodes.PIR) {
                                    	wemoUtil.infoLog(wemoUtil.TAG,"entering in PIRs storedevices");

                                    	arrayRemPIRSensorObject.push(deviceRemObject);
                                    }
                                    else if (device_model_code == homeSenseModelCodes.KEYFOB) {
                                    	wemoUtil.infoLog(wemoUtil.TAG,"entering in FOBs storedevices");

                                    	arrayRemFobSensorObject.push(deviceRemObject);
                                    }
                                    else if (device_model_code == homeSenseModelCodes.DOORWINDOWS) {
                                    	wemoUtil.infoLog(wemoUtil.TAG,"entering in DOORWINDOWs storedevices");

                                    	arrayRemDWSensorObject.push(deviceRemObject);
                                    }

                                    arrayRemBothObjects.push(deviceRemObject);
                                }
                            }

                        });
                        //                        alert("Remote swiches value "+JSON.stringify(arrayRemSwitchObjects));
                        wemoUtil.infoLog(wemoUtil.TAG,"priting from Wemoutil bridge**" + JSON.stringify(bridgeUds));
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.SWITCH_DATA, arrayRemSwitchObjects);
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.LIGHT_SWITCH_DATA, arrayRemLightSwitchObjects);
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.DIMMER_DATA, arrayRemDimmerObjects);
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.SENSOR_DATA, arrayRemSensorObjects);
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.NEST_DATA, arrayRemNestObjects);
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.INSIGHT_DATA, arrayRemInsightObjects);
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.MAKER_DATA, arrayRemMakerObjects);
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.LED_DATA, arrayRemLedDeviceObjects);
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.LED_BRIDGE_UDN, bridgeUds);
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.PIR_DATA, arrayRemPIRSensorObject);
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.FOB_DATA, arrayRemFobSensorObject);
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.DWSENSOR_DATA, arrayRemDWSensorObject);
                        wemoUtil.setRemoteSessionVal(arrayRemBothObjects);
                        console.log("WEMO-51537 Nest Data: " + wemoUtil.getJSONObjectFromSessionStorage(sessionStore.NEST_DATA));


                    },
                    error: function(xhr, textstatus) {
                        wemoUtil.hideModal();
                        for (var p in xhr) {
                            wemoUtil.infoLog(wemoUtil.TAG,"Error call back string : storeremote" + p + ': ' + xhr[p]);
                        }
                    },
                    statusCode: {
                        500: function() {
                            wemoUtil.infoLog(wemoUtil.TAG,"page not found");
                        },
                        503: function() {
                            wemoUtil.infoLog(wemoUtil.TAG,"Cloud is down.");
                        }
                    }

                });

            },
            function(err) {
                wemoUtil.hideModal();
                wemoUtil.infoLog(wemoUtil.TAG,"failure call back");
            },
            "WebServicePlugin",
            "getAuthCode", []
        );
    },

    setRemoteSessionVal: function(arrayRemBothObjects) {
        wemoUtil.infoLog(wemoUtil.TAG,"entering in setRemoteSessionVal");
        deviceTabPlugin.execute(
            function(data) {
                wemoUtil.setJSONObjectToSessionStorage(sessionStore.REMOTE_CALL_NETWORKTYPE, data);
                wemoUtil.infoLog(wemoUtil.TAG,"entering in setRemoteSessionVal" + data);
                if (data == networkType.REMOTE_WIFI || data == networkType.REMOTE_MOBILE) {
                    deviceTabPlugin.execute(
                        function(enabled) {
                            wemoUtil.infoLog(wemoUtil.TAG,"Remote enabled setRemoteSessionVal: " + enabled);
                            if (enabled) {
                                wemoUtil.setJSONObjectToSessionStorage(sessionStore.REMOTE_CALL_ENABLE, enabled);

                            } else {
                                navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {
                                    loadUrlTimeoutValue: 60000
                                });
                            }
                        },
                        wemoUtil.reportError,
                        actions.IS_REMOTE_ENABLED, []
                    );
                }
            },
            function(err) {
                wemoUtil.infoLog(wemoUtil.TAG,"Error getting sensors list")
                wemoUtil.hideModal();
            },
            actions.GET_NETWORK_TYPE, []
        );
    },
    callSimulatedActionsToCloud: function(xmlRequestString, isLEDInRule, pushScheduleSwitchCallback, callback) {
//        var so = window.sessionStorage.getItem("SO");
//        wemoUtil.infoLog(wemoUtil.TAG,"check point 1:: " + so);

//        if (so != null) {
//            wemoUtil.uploadSOStringOnCloud(null, null, null, null, null, isLEDInRule, xmlRequestString, callback);
//            window.sessionStorage.removeItem("SO");
//        } else
            wemoUtil.uploadScheduledStringOnCloud(xmlRequestString, "", "", isLEDInRule, pushScheduleSwitchCallback, callback);
    },

    buildXMLForGetDB: function(pluginId, macAddress, modelcode) {
        var cdataStart = '<![CDATA[<getDbVersion>';
        var cdataEnd = '</getDbVersion>]]>';
        xmlString = "  <plugin>" +
            "  <recipientId>" + pluginId + "</recipientId>" +
            "  <macAddress>" + macAddress + "</macAddress>" +
            "  <modelCode>" + modelcode + "</modelCode>" +
            "  <content>" + cdataStart +
            "  <plugin>" +
            "  <pluginId>" + pluginId + "</pluginId>" +
            "  <macAddress>" + macAddress + "</macAddress>" +
            "  </plugin>" +
            cdataEnd + " </content>" +
            "  </plugin>"
        return xmlString;
    },


    buildXMLForSetDB: function(pluginId, macAddress, dbVersion) {
        var cdataStart = '<![CDATA[<setDbVersion>';
        var cdataEnd = '</setDbVersion>]]>';
        xmlStringSetDb = "  <plugin>" +
            "  <recipientId>" + pluginId + "</recipientId>" +
            "  <macAddress>" + macAddress + "</macAddress>" +
            "  <content>" + cdataStart +
            "  <plugin>" +
            "  <pluginId>" + pluginId + "</pluginId>" +
            "  <macAddress>" + macAddress + "</macAddress>" +
            "  <dbVersion>" + dbVersion + "</dbVersion>" +
            "  </plugin>" +
            cdataEnd + " </content>" +
            "  </plugin>"
        return xmlStringSetDb;
    },
    buildXMLForStoreRule: function(pluginId, macAddress, dbVersion, processDB) {
        var cdataStart = '<![CDATA[<ruleDbData action="StoreRules">';
        var cdataEnd = '</ruleDbData>]]>';
        xmlStringSetDb = "  <plugin>" +
            "  <recipientId>" + pluginId + "</recipientId>" +
            "  <macAddress>" + macAddress + "</macAddress>" +
            "  <content>" + cdataStart +
            "  <plugin>" +
            "  <pluginId>" + pluginId + "</pluginId>" +
            "  <macAddress>" + macAddress + "</macAddress>" +
            "  <processDb>" + processDB + "</processDb>" +
            "  <ruleDbVersion>" + dbVersion + "</ruleDbVersion>" +
            "  <ruleDbBody>#sharedContent</ruleDbBody>" +
            "  </plugin>" +
            cdataEnd + " </content>" +
            "  </plugin>"
        return xmlStringSetDb;
    },

    storeCloudDB: function(data, dbVersion, goBack) {
        //alert("storeCloudDB data :"+data+" "+dbVersion);
        wemoUtil.infoLog(wemoUtil.TAG,"storeCloudDB goBack :: " + goBack);
        //        wemoUtil.showModal();

            devicePlugin.execute(
                function(responseAry) {
                    wemoUtil.infoLog(wemoUtil.TAG,"sucess call back" + responseAry);
                    if (parseInt(responseAry) > SQLColumns.MAX_DB_VERSION) {
                        wemoUtil.hideModal();
                        //		      			navigator.notification.activityStop();
                        //		      			wemoUtil.hideModal();
                        wemoUtil.loadUrl(filePath.UPDATE_APP);
                    }
//                    else {
//                        function errorCB(err) {
//                            wemoUtil.infoLog(wemoUtil.TAG,"Error processing Remote SQL: " + err.code);
//                        }
//
//                        function successCB() {
//                            wemoUtil.infoLog(wemoUtil.TAG,"success! querying the remote DB file");
//                            //wemoUtil.DBInitialize();
//                            db.transaction(getDB, errorCB);
//                        }
//
//                        function getDB(tx) {
//                            tx.executeSql('SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID order by b.RuleID', [],querySuccess, errorCB);
//                        }
//
//
//                        wemoUtil.infoLog(wemoUtil.TAG,"goBack :: " + goBack);
//
//                        function querySuccess(tx, results) {
//                            //	                    	navigator.notification.activityStop();
//                            var pendingFirmware = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.PENDING_FIRMWARE);
//                            wemoUtil.infoLog(wemoUtil.TAG,"pending firmware uploaddb---" + pendingFirmware);
//
//                            if (goBack == sessionStore.LOCATION_SETTINGS) {
//                                wemoUtil.hideModal();
//                                wemoUtil.loadPreviousUrl();
//                            } else if (goBack == sessionStore.MORE_LOCATION_SETTINGS) {
//                                wemoUtil.hideModal();
//                                wemoUtil.loadUrl(filePath.MORE_SETTING_ABOUT);
//                            } else if (pendingFirmware != null && pendingFirmware == "pendingFirmware") {
//                                window.sessionStorage.removeItem(sessionStore.PENDING_FIRMWARE);
//                                var fromSaveRulepage = "fromSaveRulepage";
//                                wemoUtil.setJSONObjectToSessionStorage(sessionStore.FROM_SAVE_RULE_PAGE, fromSaveRulepage);
//                                wemoUtil.hideModal();
//                                wemoUtil.loadUrl(filePath.MORE_NEW_FIRMWARE);
//                            } else {
//                                wemoUtil.infoLog(wemoUtil.TAG,"Fetching Data =>" + results.rows.length);
//                                var len = results.rows.length;
//                                var ruleRows = [];
//                                if (len > 0) {
//                                    for (var i = 0; i < len; i++) {
//                                        ruleRows[i] = results.rows.item(i);
//                                    }
//                                    window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));
//                                    //wemoUtil.loadUrl(filePath.ENABLED_RULES);
//                                    wemoUtil.infoLog(wemoUtil.TAG,"autoEnableBlockedRules : ");
////                                    wemoUtil.autoEnableBlockedRules();
//                                    //wemoUtil.hideModal();
//                                } else {
//                                    window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));
//                                    wemoUtil.loadUrl(filePath.CREATE_RULE);
//
//                                }
//                            }
//                        }

                        wemoUtil.infoLog(wemoUtil.TAG,"Fetching Data Complete");
//                        var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
//                        db.transaction(successCB, errorCB);
//                    }

                },
                function() {
                    wemoUtil.infoLog(wemoUtil.TAG,"failure DB call back in storeCloudDB...");
//                    function querySuccessRulesDB (results) {
//                        var rulesRowsLength = results.rows.length;
//                        var ruleRowsObject = [];
//                        if(rulesRowsLength > 0) {
//                            for (var i = 0; i < rulesRowsLength; i++) {
//                                ruleRowsObject[i] = results.rows.item(i);
//                            }
//                            window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRowsObject));
//                            wemoUtil.loadUrl(filePath.ENABLED_RULES);
//                        } else {
//                            wemoUtil.loadUrl(filePath.CREATE_RULE);
//                        }
//                    }
//
//                    function queryErrorRulesDB (error) {
//                        wemoUtil.infoLog(wemoUtil.TAG,"Error processing Remote SQL in storeCloudDB error callback: " + error);
//                    }
//                    var rulesDB = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
//                    rulesDB.transaction(
//                        //success callback
//                        function(tx){
//                            tx.executeSql('SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration from RULES a inner join RULEDEVICES b on a.RuleID=b.RuleID order by b.RuleID', [],querySuccessRulesDB, queryErrorRulesDB);
//                        },
//                        //error callback
//                        function(error){
//                            wemoUtil.infoLog(wemoUtil.TAG,"Error processing Remote SQL in the error callback of storeCloudDB error callback: " + error);
//                            wemoUtil.loadUrl(filePath.DEVICE_LIST);
//                        });
                },
                actions.READ_DB_FROM_CLOUD, [data, dbVersion]
            );


    },

    setDbVertionOnCloud: function(xmlString, dbVersion, goBack, callback) {
        // alert("setDbVertionOnCloud...");

        wemoUtil.infoLog(wemoUtil.TAG,"setDbVertionOnCloud goBack :: " + goBack);
        cordova.exec(function(params) {
            var authCode = params[0];
            var homeId = params[1];
            wemoUtil.infoLog(wemoUtil.TAG,"authCode" + authCode);
            wemoUtil.infoLog(wemoUtil.TAG,"request XML... setDbVertionOnCloud" + xmlString);
            $.ajax({
                url: cloudAPI.DEVICE_MESSAGE,
                type: "POST",
                data: xmlString,
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('Content-Type', 'application/xml');
                    xhr.setRequestHeader('Authorization', authCode);
                },
                success: function(data) {
                    //alert("setDbVertionOnCloud sucess...");
                    $(data).find('plugin').each(function() {
                        var macAddress = $(this).find("macAddress").text();
                        var firmware = $(this).find("firmwareVersion").text();
                        wemoUtil.infoLog(wemoUtil.TAG,"setDbVertionOnCloud Db Firmware : " + firmware + " MAC Address : " + macAddress);
                    });

                    wemoUtil.getDeviceStatusAfterSaveFromCloud(dbVersion, goBack, callback);

                },
                error: function(xhr, textstatus) {
                    wemoUtil.hideModal();
                    for (var p in xhr) {
                        wemoUtil.infoLog(wemoUtil.TAG,"Error call back string : " + p + ': ' + xhr[p]);
                    }
                },
                statusCode: {
                    500: function() {
                        alert("page not found");
                    }
                }

            });

        }, function(err) {
            wemoUtil.hideModal();
            wemoUtil.infoLog(wemoUtil.TAG,"failure call back");
        }, "WebServicePlugin", "getAuthCode", []);

    },

    uploadDBOnCloud: function(goBack, callback) {
        //alert("uploadDBOnCloud...");
    	wemoUtil.infoLog(wemoUtil.TAG, "uploadDBOnCloud goBack :: " + goBack);
        //       wemoUtil.showModal();
        cordova.exec(function(params) {
            var authCode = params[0];
            var homeId = params[1];
            wemoUtil.infoLog(wemoUtil.TAG, "authCode" + authCode);
            wemoUtil.setFirmwaresSupportFetchStoreRules();
            wemoUtil.infoLog(wemoUtil.TAG, "homeId" + homeId+" isFirmWareSupportedFSR: "+isFirmWareSupportedFSR+" authCode: "+authCode);
            setTimeout(function() {
            	if(isFirmWareSupportedFSR)
            	{
            		deviceTabPlugin.execute(
            				function(dbStr) {
            					dbFSR=dbStr;
            					var pendingFirmware = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.PENDING_FIRMWARE);
            					wemoUtil.infoLog(wemoUtil.TAG, "pending firmware uploaddb---" + pendingFirmware);

            					if (pendingFirmware != null && pendingFirmware == "pendingFirmware") {
            						wemoUtil.downloadDBFromCloud(sessionStore.REMOTE_CALL_SETDB, null, callback);
            					} else {
            						wemoUtil.downloadDBFromCloud(sessionStore.REMOTE_CALL_SETDB, goBack, callback);
            					}

//            				    wemoUtil.hideModal();
            				},
            				function() {
            					wemoUtil.infoLog(wemoUtil.TAG, "failure DB call back...");
            					wemoUtil.hideModal();
            				},
            				actions.ACTION_GET_DB_CONTENT, [homeId]
            		);

            	}
            	else
            	{
            		deviceTabPlugin.execute(
            				function(responseAry) {

            					var pendingFirmware = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.PENDING_FIRMWARE);
            					 wemoUtil.infoLog(wemoUtil.TAG, "pending firmware uploaddb---" + pendingFirmware);

            					 wemoUtil.infoLog(wemoUtil.TAG, "sucess call back - uploadDBOnCloud " + responseAry);

            					if (pendingFirmware != null && pendingFirmware == "pendingFirmware") {
            						wemoUtil.downloadDBFromCloud(sessionStore.REMOTE_CALL_SETDB, null, callback);
            					} else {
            						wemoUtil.downloadDBFromCloud(sessionStore.REMOTE_CALL_SETDB, goBack, callback);
            					}


            					//                             wemoUtil.hideModal();
            				},
            				function() {
            					 wemoUtil.infoLog(wemoUtil.TAG, "failure DB call back...");
            					wemoUtil.hideModal();
            				},
            				actions.STORE_DB_FROM_CLOUD, [homeId]
            		);
            	}
            }, 100);

        }, function(err) {
            wemoUtil.hideModal();
            wemoUtil.infoLog(wemoUtil.TAG, "failure call back");
        }, "WebServicePlugin", "getAuthCode", []);

    },

    getFirmwareVersionFromCloud: function(pluginId, macAddress, successCallback, failureCallback) {
        wemoUtil.infoLog(wemoUtil.TAG, 'getFirmwareVersionFromCloud');
        var request = wemoUtil.buildXMLForFirmwareVersion(pluginId, macAddress);
        cordova.exec(
            function(params) {
                wemoUtil.infoLog(wemoUtil.TAG,"success call back" + params[1] + " : " + params[0]);
                var homeId = params[1];
                var authCode = params[0];

                wemoUtil.infoLog(wemoUtil.TAG,"success call back home id: " + homeId);
                wemoUtil.infoLog(wemoUtil.TAG,"success call back authCode: " + authCode);

                $.ajax({
                    url: cloudAPI.DEVICE_MESSAGE,
                    data: request,
                    type: "POST",
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function(data) {
                        wemoUtil.infoLog(wemoUtil.TAG, "success callback from cloud");

                        $(data).find('plugin').each(function() {
                            if ($(this).find("macAddress").text() == macAddress) {
                                return successCallback($(this).find("firmwareVersion").text());
                            } else {
                                return failureCallback(54321, 'device not found');
                            }

                        });

                    },
                    error: function(xhr, textstatus) {
                        wemoUtil.infoLog(wemoUtil.TAG, "error callback from cloud");
                        return failureCallback(xhr.status, xhr.statusText);
                    }
                });

            },
            function(err) {
                wemoUtil.infoLog(wemoUtil.TAG, "error callback for authcode generation");
                return failureCallback(12345, 'cannot generate authcode');
            },
            "WebServicePlugin",
            "getAuthCode", []
        );
    },

    buildXMLForFirmwareVersion: function(pluginId, macAddress) {
        wemoUtil.infoLog(wemoUtil.TAG, 'buildXMLForFirmwareVersion');

        xmlString = "<plugins>" +
            "  <plugin>" +
            "  <recipientId>" + pluginId + "</recipientId>" +
            "  <macAddress>" + macAddress + "</macAddress>" +
            "  <content>" + '<![CDATA[<pluginDeviceStatus>' +
            "  <plugin>" +
            "  <pluginId>" + pluginId + "</pluginId>" +
            "  <macAddress>" + macAddress + "</macAddress>" +
            "  </plugin>" +
            '</pluginDeviceStatus>]]>' + " </content>" +
            "  </plugin>" +
            "</plugins>";
        return xmlString;
    },

    getCloudIDByUDN: function(UDN, successCallback, failureCallback) {
        wemoUtil.infoLog(wemoUtil.TAG, "getCloudIDByUDN");

        cordova.exec(
            function(params) {
                wemoUtil.infoLog(wemoUtil.TAG,"success call back" + params[1] + " : " + params[0]);
                var homeId = params[1];
                var authCode = params[0];

                wemoUtil.infoLog(wemoUtil.TAG,"success call back home id: " + homeId);
                wemoUtil.infoLog(wemoUtil.TAG,"success call back authCode: " + authCode);

                $.ajax({
                    url: cloudAPI.DEVICE_LIST + homeId,

                    type: "GET",
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function(data) {
                        wemoUtil.infoLog(wemoUtil.TAG,"success callback from cloud");
                        var pluginID = '';
                        var macAddress = '';

                        $(data).find('plugin').each(function(i) {
                            wemoUtil.infoLog(wemoUtil.TAG,"Plugin: " + i);
                            if ($(this).find("uniqueId").text() == UDN) {
                                pluginID = $(this).find("pluginId").text();
                                macAddress = $(this).find("macAddress").text();
                                return false;
                            }
                        });

                        if (pluginID !== '' || macAddress !== '') {
                            return successCallback(pluginID, macAddress);
                        } else {
                            return failureCallback(54321, 'device not found');
                        }

                    },
                    error: function(xhr, textstatus) {
                        wemoUtil.infoLog(wemoUtil.TAG, "error callback from cloud " + xhr.statusText);
                        if (xhr.status == "503") {
                            wemoUtil.loadUrl(filePath.CLOUD_AVAILABILITY);
                        }
                        return failureCallback(xhr.status, xhr.statusText);
                    }
                });

            },
            function(err) {
                wemoUtil.infoLog(wemoUtil.TAG, "error callback for authcode generation");
                return failureCallback(12345, 'cannot generate authcode');
            },
            "WebServicePlugin",
            "getAuthCode", []
        );
    },

    //usage of above methods

    //    wemoUtil.getCloudIDByUDN(
    //    'uuid:Sensor-1_0-221201L0100260',
    //    function(pluginID, macAddress){
    //        //success Callback
    //        wemoUtil.infoLog(device_list.TAG, 'Plugin ID: ' + pluginID);
    //        wemoUtil.infoLog(device_list.TAG, 'MAC Address: ' + macAddress);
    //
    //    },
    //    function(error_code, error_text){
    //        //Error Callback
    //        wemoUtil.infoLog(device_list.TAG, 'error_code: ' + error_code);
    //        wemoUtil.infoLog(device_list.TAG, 'error_text: ' + error_text);
    //    }
    //);
    //
    //
    //
    //wemoUtil.getFirmwareVersionFromCloud(
    //    pluginID,
    //    macAddress,
    //    function(firmware_version){
    //        //success Callback
    //        wemoUtil.infoLog(device_list.TAG, firmware_version);
    //    },
    //    function(error_code, error_text){
    //        //Error Callback
    //        wemoUtil.infoLog(device_list.TAG, 'error_code: ' + error_code);
    //        wemoUtil.infoLog(device_list.TAG, 'error_text: ' + error_text);
    //    }
    //);

    getCloudDeviceList: function(successCallback, failureCallback) {
        wemoUtil.infoLog(wemoUtil.TAG, 'getCloudDeviceList');

        cordova.exec(
            function(params) {
                wemoUtil.infoLog(wemoUtil.TAG, "success call back" + params[1] + " : " + params[0]);
                var homeId = params[1];
                var authCode = params[0];

                wemoUtil.infoLog(wemoUtil.TAG, "success call back home id: " + homeId);
                wemoUtil.infoLog(wemoUtil.TAG, "success call back authCode: " + authCode);

                $.ajax({
                    //url: cloudAPI.DEVICE_LIST + homeId,
                    url: cloudAPI.LED_DEVICE_LIST + homeId,
                    type: "GET",
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function(data) {
                        wemoUtil.infoLog(wemoUtil.TAG, "success callback from cloud");
                        var responseXML = (new XMLSerializer()).serializeToString(data);
                        var splitLength = 4000;
                        var length = responseXML.length;
                        var ittr = Math.floor(length / splitLength) + 1;
                        for (var i = 0; i < ittr; i++) {
                            var end = ((i + 1) * splitLength);
                            if (end > length) {
                                end = length;
                            }
                            wemoUtil.infoLog(wemoUtil.TAG, responseXML.substring(splitLength * i, end));
                        }


                        var deviceListArray = [];
                        //$(data).find('plugin').each(function (i) {
                        $(data).find('device').each(function(i) {

                            //                            wemoUtil.infoLog(wemoUtil.TAG,"Plugin: " + i);
                            if ($(this).find("pluginId").text() != "") {
                                var device_id = $(this).find("uniqueId").text();
                                var device_type = $(this).find("modelCode").text();
                                var device_friendly_name = $(this).find("friendlyName").text();
                                var device_status = $(this).find("status").text();
                                var device_plugin_id = $(this).find("pluginId").text();
                                var device_mac_address = $(this).find("macAddress").text();
                                var device_status_timestamp = $(this).find("statusTS").text();

                                var deviceObject = {};
                                if (wemoUtil.isMakerDevice(device_id)) {
                                    deviceObject[key.DEVICE_UDN] = wemoUtil.getOriginalMakerUDN(device_id);
                                } else {
                                    deviceObject[key.DEVICE_UDN] = device_id;
                                }
                                deviceObject[key.DEVICE_TYPE] = device_type;
                                deviceObject[key.DEVICE_STATE] = device_status;
                                deviceObject[key.DEVICE_FRIENDLY_NAME] = device_friendly_name;
                                deviceObject[key.DEVICE_PLUGIN_ID] = device_plugin_id;
                                deviceObject[key.DEVICE_MAC_ADDRESS] = device_mac_address;
                                deviceObject[key.DEVICE_STATUS_TIMESTAMP] = device_status_timestamp;

                                //wemoUtil.infoLog(wemoUtil.TAG,"device object: " + JSON.stringify(deviceObject));
                                deviceListArray.push(deviceObject);
                            }

                        });
                        return successCallback(deviceListArray);
                    },
                    error: function(xhr, textstatus) {
                        wemoUtil.infoLog(wemoUtil.TAG, 'status: ' + xhr.status);
                        wemoUtil.infoLog(wemoUtil.TAG, 'status text: ' + xhr.statusText);
                        return failureCallback(xhr.status, xhr.statusText);
                    }
                });

            },
            function(err) {
                wemoUtil.infoLog(wemoUtil.TAG, "error callback for authcode generation");
                return failureCallback(12345, 'cannot generate authcode');
            },
            "WebServicePlugin",
            "getAuthCode", []
        );
    },

    buildXMLForCloudFirmwareVersion: function(oldDeviceList) {
        wemoUtil.infoLog(wemoUtil.TAG,'buildXMLForFirmwareVersion');
        var xmlString = "<plugins>";
        for (index in oldDeviceList) {
            var deviceItem = oldDeviceList[index];
            var status = deviceItem[key.DEVICE_STATE];
            var friendlyName = deviceItem[key.DEVICE_FRIENDLY_NAME];
            var pluginId = deviceItem[key.DEVICE_PLUGIN_ID];
            var macAddress = deviceItem[key.DEVICE_MAC_ADDRESS];

            xmlString += wemoUtil.buildXMLForPlugin(pluginId, macAddress, status, friendlyName, buildXML.FIRMWARE_VERSION);
        }
        xmlString += "</plugins>";
        return xmlString;
    },

    buildXMLForPlugin: function(pluginId, macAddress, status, friendly_name, type) {
        var cdataStart = '';
        var cdataEnd = '';
        if (type == buildXML.PLUGIN_STATE) {
            cdataStart = '<![CDATA[<pluginSetDeviceStatus>';
            cdataEnd = '</pluginSetDeviceStatus>]]>';
        } else if (type = buildXML.FIRMWARE_VERSION) {
            cdataStart = '<![CDATA[<pluginDeviceStatus>';
            cdataEnd = '</pluginDeviceStatus>]]>';
        }
        xmlString = "  <plugin>" +
            "  <recipientId>" + pluginId + "</recipientId>" +
            "  <macAddress>" + macAddress + "</macAddress>" +
            "  <content>" + cdataStart +
            "  <plugin>" +
            "  <pluginId>" + pluginId + "</pluginId>" +
            "  <macAddress>" + macAddress + "</macAddress>" +
            "  <status>" + status + "</status>" +
            "  <friendlyName>" + friendly_name + "</friendlyName>" +
            "  <eventDuration></eventDuration>" +
            "  </plugin>" +
            cdataEnd + " </content>" +
            "  </plugin>"
        return xmlString;
    },


    cloudAvailability: function() {
        wemoUtil.infoLog(wemoUtil.TAG,"loadDevicesFromCloud");

        cordova.exec(
            function(params) {
                wemoUtil.infoLog(wemoUtil.TAG,"success call back" + params[1] + " : " + params[0]);
                var homeId = params[1];
                var authCode = params[0];
                wemoUtil.infoLog(wemoUtil.TAG,"success call back home id: " + homeId);
                wemoUtil.infoLog(wemoUtil.TAG,"success call back authCode: " + authCode);

                $.ajax({
                    //url: cloudAPI.DEVICE_LIST + homeId,
                    url: cloudAPI.LED_DEVICE_LIST + homeId,
                    type: "GET",
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function(data) {
                        wemoUtil.loadUrl(filePath.DEVICE_LIST);
                    },
                    error: function(xhr, textstatus) {
                        wemoUtil.infoLog(TAG, '----status11: ' + xhr.status);
                        wemoUtil.infoLog(TAG, '----status text11: ' + xhr.statusText);
                        if (xhr.status == "503") {
                            wemoUtil.loadUrl(filePath.CLOUD_AVAILABILITY);
                            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                            device_list.hideModal();
                        }
                        wemoUtil.loadUrl(filePath.DEVICE_LIST);
                        device_list.hideModal();

                        if (device_list != undefined) {
                            device_list.hideModal();
                        }
                    },
                    statusCode: {
                        503: function() {
                            wemoUtil.infoLog(wemoUtil.TAG,"status Code:503 error ");
                            wemoUtil.loadUrl(filePath.CLOUD_AVAILABILITY);
                        }
                    }
                });

            },
            function(err) {
                wemoUtil.infoLog(wemoUtil.TAG,"failure call back");
            },
            "WebServicePlugin",
            "getAuthCode", []
        );
    },

    /* handelSingleDobuleQuotes: function (str) {
         if (str.indexOf('\'') >= 0) {
         str = str.replace(/"/g, '&#39;');
         } else if (str.indexOf('"') >= 0) {
         str = str.replace(/"/g, '&#34;');
         }

         return str;
         }, */
    handleSpecialChars: function(str) {
        str = str.replace("<", "&lt;");
        str = str.replace(">", "&gt;");
        return str;
    },

    replaceParameters: function(component, params) {
        var key = component.attr("_key");
        if (!key) {
            wemoUtil.infoLog(wemoUtil.TAG, "Component does not have '_key' attribute");
            return;
        }
        var message = wemo.items[key];
        if (!message) {
            wemoUtil.infoLog(wemoUtil.TAG, "Template is not found for key: " + key);
            return;
        }
        var i = 0;
        while (message.indexOf("%@") != -1) {
            message = message.replace("%@", params[i++]);
        }
        component.text(message);
    },

    isDeviceFound: function(action_device_type, callback) {
        if (action_device_type == actions.SELECT_NEST_DEVICES) {
            window.cordova.exec(
                function (params) {
                    if (params.length > 0) {
                        callback(true);
                    } else {
                        callback(false);
                    }
                },
                function(err){
                    console.log(err);
                },
                "SmartDevicePlugin", action_device_type, []);
        } else {
        deviceTabPlugin.execute(
            function (params) {
                wemoUtil.infoLog(wemoUtil.TAG, "check devices: params = " + JSON.stringify(params));
                if (params.length > 0) {
                    //Workaround for LED device list
                    if (action_device_type === actions.SELECT_LED_DEVICES) {
                        if (params.length == 1 && params[0] == 0) {
                            callback(false);
                        } else {
                            callback(true);
                        }
                    } else {
                        callback(true);
                    }
                } else {
                    callback(false);
                }
            },
            function (err) {
                wemoUtil.infoLog(wemoUtil.TAG, "Error getting devices list");
                callback(false);
            },
            action_device_type, []
        );
    }
    },
    isMakerDeviceFound: function(action_device_type, callback) {
        var isLengthZero = true;
        var isSensorFound = false;
        var isToggleSwitchFound = false;
        deviceTabPlugin.execute(
            function(params) {
                wemoUtil.infoLog(wemoUtil.TAG,"check maker devices: params = " + JSON.stringify(params));
                if (params.length > 0) {
                    isLengthZero = false;
                    $.each(params, function(inx) {
                        if (params[inx].SensorPresent == "1") {
                            isSensorFound = true;
                        }
                        if (params[inx].SwitchMode == "0") {
                            isToggleSwitchFound = true;
                        }
                    });
                }
                callback(isLengthZero, isSensorFound, isToggleSwitchFound);
            },
            function(err) {
                wemoUtil.infoLog(wemoUtil.TAG,"Error getting devices list");
                callback(isLengthZero, isSensorFound, isToggleSwitchFound);
            },
            action_device_type, []
        );
    },
    
    sortJSONArray : function (data, key) {
        return data.sort(function (a, b) {
            var x = a[key];
            var y = b[key];
            return ((x < y) ? -1 : ((x > y) ? 1 : 0));
        });
    },

    
	/**
	 * converts the color to temperature value
	 * as Temperature = 1,000,000/ColorTemperature
	 * 
	 */
    convertColorToTemperature: function(colorTemperature) {
    	var temperature = parseInt(1000000/colorTemperature);
    	return Math.round(temperature / 50) * 50;
    },
    
    /**
     * converts the temperature to color value
     * as ColorTemperature = 1,000,000/Temperature
     * 
     */
    convertTemperatureToColorVal: function(temperature) {
    	var colorTemperature = 1000000/temperature;
    	return colorTemperature.toFixed(13);
    },
       
    
    /**
	 * converts temperature(in Kelvin) value to RGB value 
	 * 
	 */
       convertTemperatureToRGB : function(tempNum) {
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

    	   return "rgb("+rgb.r+","+rgb.g+","+rgb.b+")";
       },
    
    
    isSupportedLedModelCode : function(modelCode){
    	if(wemoUtil.ledmodelcodes.length == 0){
            $.each(ledModelcode, function(i, val) {
            	wemoUtil.ledmodelcodes.push(val.toLowerCase());
            });
    	}
    
    	if ($.inArray($.trim(modelCode.toLowerCase()), wemoUtil.ledmodelcodes) != -1)
    		return true;
    	else 
    		return false;
    },
    
    isSupportedHomesenseModelCode : function(modelCode){
    	if(wemoUtil.homesenseModelCodes.length == 0){
            $.each(homeSenseModelCodes, function(i, val) {
            	wemoUtil.homesenseModelCodes.push(val.toLowerCase());
            });
    	}
    
    	if ($.inArray($.trim(modelCode.toLowerCase()), wemoUtil.homesenseModelCodes) != -1)
    		return true;
    	else 
    		return false;
    },
    /**
	 * RGB Calulation for Color bulbs 
	 * 
	 * 
	 */
    
    RGBCalculationforColorBulbs: function(rgb){
    	
    	if(rgb)
    	{
    		var rgbSplit = rgb.split(",");
        	var R = rgbSplit[0];
        	var G = rgbSplit[1];
        	var B = rgbSplit[2];

        	var X = 0.584150*R + 0.220650*G + 0.116630*B 
        	var Y = 0.228580*R + 0.743650*G + 0.027770*B 
        	var Z = 0.019500*R + 0.106800*G + 0.583500*B
        	 
        	var x = X / (X + Y + Z) 
        	var y = Y / (X + Y + Z)

        	var CurrentX = 65536 * x;
        	var CurrentY = 65536 * y;
        	
        	return Math.round(CurrentX)+":"+Math.round(CurrentY);
    	}
    	else
    	   return false;
    },
    
    /**Converting HEX value to RGB for Color bulbs 
	 * 
	 * 
	 */
    
    Hex2RGB: function(hexinp){
    	
    	if(hexinp)
    	{
		 	var hex = parseInt(((hexinp.indexOf('#') > -1) ? hexinp.substring(1) : hexinp), 16);
	        var r = hex >> 16,
	            g =(hex & 0x00FF00) >> 8,
	            b = (hex & 0x0000FF);

	        return r + "," + g + "," + b;
    	}
       
    },
    
    /**Converting COLOR X,Y Value to RGB for Color bulbs 
	 * 
	 * 
	 */
    convertColorToRGB: function(colorX, colorY){
	 	if (colorX != 0 && colorY != 0)
	    {
	 		var colorX =  Math.round(colorX) / sessionStore.COLOR_MAX_VALUE;
	        var colorY =  Math.round(colorY) / sessionStore.COLOR_MAX_VALUE;
	        var z = parseFloat(1-colorX-colorY);
	        
	        var Y = 1.0;
	        var X = colorX * (Y / colorY);
	        var Z = z * (Y / colorY);
	        
	        var R = (1.927450 * X) + (-0.520123 * Y) + (-0.360505 * Z);
	        var G = ((-0.594107 * X) + (1.514293 * Y) + (0.046682 * Z));
	        var B = ((0.044328 * X) + (-0.259784 * Y) + (1.717300 * Z));
	        var scalar = Math.max(R, Math.max(G, B));
	        
	        var red = R / scalar;
	        var green = G / scalar;
	        var blue = B / scalar;
	        
	        red = red.toFixed(2);
	        green = green.toFixed(2);
	        blue = blue.toFixed(2);
	        
	        red = Math.round(red*sessionStore.RGB_MAX_VALUE);
	        blue = Math.round(blue*sessionStore.RGB_MAX_VALUE);
	        green = Math.round(green*sessionStore.RGB_MAX_VALUE);
	        
	        if(red > sessionStore.RGB_MAX_VALUE)
	           red = sessionStore.RGB_MAX_VALUE;
	        if(blue > sessionStore.RGB_MAX_VALUE)
	        	blue = sessionStore.RGB_MAX_VALUE;
	        if(green > sessionStore.RGB_MAX_VALUE)
	        	green = sessionStore.RGB_MAX_VALUE;
	        
	        red = Math.abs(red);
	        blue = Math.abs(blue);
	        green = Math.abs(green);
	        
	        var rgbVal = "rgb("+red+","+green+","+blue+")";
	        var hexVal = '#' + wemoUtil.byte2Hex(red) + wemoUtil.byte2Hex(green) + wemoUtil.byte2Hex(blue);
	    	return hexVal;
	    }
	 	else
	 		return false;
	 	
    },
    
    /**Converting RGB bytes to Hexcode for Color bulbs 
	 * 
	 * 
	 */
    
    byte2Hex: function(n){
      var nybHexString = "0123456789ABCDEF";
      return String(nybHexString.substr((n >> 4) & 0x0F,1)) + nybHexString.substr(n & 0x0F,1);
    },
    
    /**
     * encode special JavaScript characters, so text is safe when building JavaScript/HTML dynamically
      * NB: conservatively assumes that HTML special characters are unsafe, and encodes them too
     * @param {String} text
     * @return {String}
     */
    encodeToUTF: function(text) {
        /**
         * encode character as Unicode hexadecimal escape sequence
         * @param {String} ch character to encode
         * @return {String}
         */
        function toUnicodeHex(ch) {
            var c = ch.charCodeAt(0),
                s = c.toString(16);
            // see if we can use 2-digit hex code
            if (c < 0x100) {
                return "\\x" + ("00" + s).slice(-2);
            }
            // must use 4-digit hex code
            return "\\u" + ("0000" + s).slice(-4);
        }
        return text.replace(/[\\\/"'&<>\x00-\x1f\x7f-\xa0\u2000-\u200f\u2028-\u202f-\u0025]/g, toUnicodeHex);
    },
    
    /**
     * It will replace various Unicode formatted string to HTML format
     * Ex: U+0027 -> &#x0027, \u2019 -> &#x2019
     */    
    utf2html: function(text) {
        return text.replace(/((\\u)|(U\+))(?=\d{4})/g, '&#x');
    },
    
    fixedEncodeURI: function (str) {
	return encodeURI(str).replace(/%5B/g, '[').replace(/%5D/g, ']');
    },
    
     /**Replacing space with "-" in Manufacturer and Modelcode  
	 * 
	 *  Specific to LED and HomeSense Devices
	 */
    
    replaceSpaceinModelCodeandManufacturer : function(manufacturer, modelcode){
   	 
   	 	var replaceSpaceManufacturer = manufacturer.replace(/ /g, '_');
        replaceSpaceManufacturer = replaceSpaceManufacturer.toLowerCase();
        
        var replaceSpaceModelcode = modelcode.replace(/ /g, '_');
        replaceSpaceModelcode = replaceSpaceModelcode.toLowerCase();
        
        deviceImg = "bulb_" + replaceSpaceManufacturer + "_" + replaceSpaceModelcode + ".png";
        deviceImg = ledDefalutImg.Dynamic + deviceImg;
        
        return deviceImg;
    },
    
    /**Replacing space with "-" in Modelcode  
	 * 
	 *  Specific to LED and HomeSense Devices
	 */
    
    replaceSpaceinModelCode : function(modelcode){
   	 
        var replaceSpaceModelcode = modelcode.replace(/ /g, '_');
        replaceSpaceModelcode = replaceSpaceModelcode.toLowerCase();
        
        deviceImg = "bulb_" + replaceSpaceModelcode + ".png";
        deviceImg = ledDefalutImg.Dynamic + deviceImg;
        
        return deviceImg;
    },
    
    /** Merging capabilityIDs with Capability Value one ArrayObject 
	 * 
	 *  Specific to LED and HomeSense Devices
	 */
    
    mappingCapabilityIDwithValue: function(capabilityids, capabilityval) {
    	if(capabilityids && capabilityval){
    		var mergeArr = {}, i=0;
    	   	var capabilityidsArr = capabilityids.split(",");
    	   	var capabilityvalArr = capabilityval.split(",");
    	   	 
    	   	 for(i=0;i<capabilityidsArr.length;i++){
    	   		 mergeArr[capabilityidsArr[i]] = capabilityvalArr[i]; 
    	   	 }
    	    return mergeArr;
    	}
    	else{
    		return false;
    	}
    },
    
    /** Updating capability value attribue in device tile
	 * 
	 *  Specific to LED and HomeSense Devices
	 */
    
    mappingCapabilityIDwithCurrentValue: function(capabilityids, capabilityval, changeid, changeval) {
	   	 var mergeStr = "", i=0;
	   	 var capabilityidsArr = capabilityids.split(",");
	   	 var capabilityvalArr = capabilityval.split(",");
	
	   	 for(i=0;i<capabilityidsArr.length;i++){
	   		 
	   		 if(capabilityidsArr[i] == changeid)
	   			mergeStr+= changeval+","; 
	   		 else
	   			mergeStr+= capabilityvalArr[i]+",";
	   	 }
	   	 
	   	 mergeStr = mergeStr.replace(/,(?=[^,]*$)/, '');
	   	 return mergeStr;
    },
    
    /** Initializing Color Picker
	 * 
	 *  Color picker component to set color for LED RGB Bulbs
	 */
    
    colorPickerInitialization: function(rgbColor){ 
    	$('.colorPicker').html('');
    	$('.colorPicker').minicolors({
          	control: 'wheel',
            theme: 'default',
            color: rgbColor
        });
    	$('.minicolors input').minicolors('value', rgbColor);
    	$(".magnifiercolor").css('background-color', rgbColor);
    	$(".colorDisplay").css("background-color", rgbColor);
        $(".colorDisplay").attr('data-selectedcolor', rgbColor);
    },
    
    /** Initializing Temperature Picker
	 * 
	 *  Temperature component to set temperature for LED RGB Bulbs
	 */
    
    temperaturePickerInitialization: function(kelvinTemperarture){
    	$('#picker').farbtastic({
            prefix: '.prefixTemps',
            temperature: kelvinTemperarture
	    });
    },
    
    /** Checking for LED DeviceType
	 * 
	 *  function return which type of LED
	 */
    
    ledBulbType: function(modelcode){
  
    	 var modelCode = $.trim(modelcode).toUpperCase();

    	 if((modelCode == (ledModelcode.OSRAMFLEXPROD).toUpperCase()) || (modelCode == (ledModelcode.OSRAMFLEXPILOT).toUpperCase()))
        	return sessionStore.COLOR_TEMPERATURE_BULBS;
		 else if((modelCode == (ledModelcode.OSRAMCTBPROD).toUpperCase()) || (modelCode == (ledModelcode.OSRAMCTBPILOT).toUpperCase()))
         	return sessionStore.COLOR_BULBS;
		 else if((modelCode == ledModelcode.OSRAMTTBPROD.toUpperCase()) || (modelCode == (ledModelcode.OSRAMTTBPILOT).toUpperCase()))
         	return sessionStore.TEMPERATURE_BULBS;
         else if(modelCode == ledModelcode.OSRAM.toUpperCase())
         	return sessionStore.REGULAR_DIMMABLE_BULBS;
         else
        	return sessionStore.REGULAR_DIMMABLE_BULBS;
    	
    },
    
    /** Checking Is LED supports Color
	 * 
	 *  function return boolean true/false
	 */
    
    isColoredBulb: function(deviceType){
    	if(deviceType == sessionStore.COLOR_BULBS)
    		return true;
    	else
    		return false;
    },
    
    /** Checking Is LED supports Temperature
	 * 
	 *  function return boolean true/false
	 */
    
    isTemperatureBulb: function(deviceType){
    	if(deviceType == sessionStore.TEMPERATURE_BULBS)
    		return true;
    	else
    		return false;
    },
    
    /** Checking Is LED supports Color and Temperature
	 * 
	 *  function return boolean true/false
	 */
    
    isColoredandTemperaturedBulb: function(deviceType){
    	if(deviceType == sessionStore.COLOR_TEMPERATURE_BULBS)
    		return true;
    	else
    		return false;
    },
    

    /**
     * manuplating time for HomeSensor time change
     */
    
    getMotionSenseTimeMsg : function(tdate){
	    MMDD = new Date();
	    MMDD.setDate(tdate.getDate());
	    MMDD.setHours(0, 0, 0, 0);

	    var months = ["Jan", "Feb", "Mar", "Apr", "May", "June", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
	    var strDate = "";
	    var day = MMDD.getDate();
	    var month = months[MMDD.getMonth()];

	    var today = new Date();
	    today.getDate();
	    today.setHours(0, 0, 0, 0);

	    var yesterday = new Date();
	    yesterday.setHours(0, 0, 0, 0);
	    yesterday.setDate(yesterday.getDate() - 1);

	    var tomorrow = new Date();
	    tomorrow.setHours(0, 0, 0, 0);
	    tomorrow.setDate(tomorrow.getDate() + 1);
	   
	    if (today.getTime() == MMDD.getTime()) {
	        var temparr = wemo.items['Devices_Remote_MotionSensed'].split("%@");
	        strDate = temparr[0] + " " + DateFormat.format.date(tdate, "h:mm a") + " " + (temparr[1] ? temparr[1] : "");

	    } else if (yesterday.getTime() == MMDD.getTime()) {
	        var temparr = wemo.items['Devices_Remote_MotionSensedYesterday'].split("%@");
	        strDate = temparr[0] + " " + DateFormat.format.date(tdate, "h:mm a") + " " + (temparr[1] ? temparr[1] : "");
	    } else {
	        var temparr = wemo.items['PirMotionSensed'];
	        strDate = temparr + " " + DateFormat.format.date(tdate, "h:mm a");
	    }
	    return strDate;
	},
	
    /** Forming XML for UpdateGroup
	 * 
	 *  function return XML
	 */
    updateGroupXML: function(groupUniqueID, refrenceID, groupname, iconversion,devicedropMacList,capabilityIDs1,capabilityIDsVal1,splitDeviceList,splitCapabilityArr,state1,currentval,faderval,temperatureval,colorval){
    	var cdataStart = '<![CDATA[<CreateGroup>';
        var cdataEnd = '</CreateGroup>]]>';
        var xmlString = "";
        
    		xmlString+= "<groups>" +
	        "  <group>" +
	        "  <id>" + groupUniqueID + "</id>" +
	        "  <referenceId>" + refrenceID + "</referenceId>" +
	        "  <groupName>" + groupname + "</groupName>" +
	        "  <iconVersion>" + iconversion + "</iconVersion>" +
	        "  <content>" + cdataStart +
	        "  <GroupID>" + refrenceID + "</GroupID>" +
	        "  <GroupName>" + groupname + "</GroupName>" +
	        "  <DeviceIDList>" + devicedropMacList + "</DeviceIDList>" +
	        "  <GroupCapabilityIDs>" + capabilityIDs1 + "</GroupCapabilityIDs>" +
	        "  <GroupCapabilityValues>" + capabilityIDsVal1 + "</GroupCapabilityValues>" +
	        cdataEnd + " </content>" +
	        "  <devices>" ;


		    for (var j = 0; j < splitDeviceList.length; j++) {
		        xmlString += "  <device>" +
		            "  <deviceId>" + splitDeviceList[j] + "</deviceId>" +
		            "  </device>";
		    }
		
		    xmlString += "  </devices>" +
		        "  <capabilities>";
		
		    for (var k = 0; k < splitCapabilityArr.length; k++) {
		
		        var capabilityres = $.trim(splitCapabilityArr[k]);
		
		        if (capabilityres == ledCapabilities.ONOFF) {
		            xmlString += "  <capability>" +
		                "  <capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
		                "  <currentValue>" + state1 + "</currentValue>" +
		                "  </capability>";
		        } else if (capabilityres == ledCapabilities.DIMMING) {
		            var Curval = currentval + ":"+statusCode.OFF;
		            xmlString += "  <capability>" +
		                "  <capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
		                "  <currentValue>" + Curval + "</currentValue>" +
		                "  </capability>";
		        } else if (capabilityres == ledCapabilities.FADER) {
		        	
		        	if(faderval == "" || faderval == undefined)
		        		faderval=statusCode.OFF;
		        	
		            xmlString += "  <capability>" +
		                "  <capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
		                "  <currentValue>" + faderval + "</currentValue>" +
		                "  </capability>";
		        } else if (capabilityres == ledCapabilities.TEMPERATURE) {
		        	
		        	if(temperatureval == "" || temperatureval == undefined)
		        		temperatureval=statusCode.OFF;
		        	
		            xmlString += "  <capability>" +
		            "  <capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
		            "  <currentValue>" + temperatureval + "</currentValue>" +
		            "  </capability>";
		        } else if (capabilityres == ledCapabilities.COLOR) {
		        	
		        	if(colorval == "" || colorval == undefined)
		        		colorval=statusCode.OFF;
		        	
		            xmlString += "  <capability>" +
		            "  <capabilityId>" + splitCapabilityArr[k] + "</capabilityId>" +
		            "  <currentValue>" + colorval + "</currentValue>" +
		            "  </capability>";
		        }
		    }
		
		    xmlString += "  </capabilities>" +
		        "  </group>" +
		        "  </groups>";
		    
		   return xmlString; 
		   
    },
    
    getNumOfDevices: function(action_device_type) {
        return wDevices[action_device_type].length;
    },

    getDevices: function(action_device_type) {
        var devices = null;

        if (!wDevices[action_device_type]) {
            wDevices[action_device_type] = {};
            return $.Deferred(function(dfd) {

                if (action_device_type == actions.SELECT_NEST_DEVICES) {
                    cordova.exec(
                        function (params) {
                            wDevices[action_device_type] = params;
                            dfd.resolve(devices);
                        },
                        function (err) {
                            dfd.reject(err);
                        },
                        "SmartDevicePlugin", action_device_type, []);
                } else {
                deviceTabPlugin.execute(
                    function (params) {
                        wDevices[action_device_type] = params;
                        dfd.resolve(devices);
                    },
                    function (err) {
                        dfd.reject(err);
                    },
                    action_device_type, []
                );
            }

            }).promise();
        } else {
            return wDevices[action_device_type];
        }
    },

    getDevicesWithCallback: function(action_device_type, callback, errorCallback) {
        var devices = null;

        deviceTabPlugin.execute(
            function(params) {
                callback(params);
            },
            function(err) {
                wemoUtil.infoLog(wemoUtil.TAG,"Error getting devices list");

                if (errorCallback) {
                    errorCallback();
                }

                nativeUtilPlugin.execute(null,null,actions.HIDE_RULE_PROGRESS,[]);
            },
            action_device_type, []
        );


    },

    //    usage for firmware version
    //    wemoUtil.getAllFirmwareVersionCloud(
    //    function(firmwareArray){
    //        wemoUtil.infoLog(wemoUtil.TAG,JSON.stringify(firmwareArray));
    //    }
    //);
    convertSelectedDayOrRangeToString: function(ruleObj) {
        wemoUtil.infoLog(wemoUtil.TAG,"convertSelectedDayOrRangeToString");
        var tempSelectedDayOrRange = "";
        if (ruleObj.SelectedDayOrRange == undefined) {
            wemoUtil.infoLog(wemoUtil.TAG,"SelectedDayOrRange == undefined");
            ruleObj.SelectedDayOrRange = "Mon-Tue-Wed-Thu-Fri-Sat-Sun";
            wemoUtil.setJSONObjectToSessionStorage(sessionStore.RULE_NEW, ruleObj);
            tempSelectedDayOrRange = wemo.items['Daily'];
        } else {

            if (ruleObj.SelectedDayOrRange == "Weekday" || ruleObj.SelectedDayOrRange == "Weekend" || ruleObj.SelectedDayOrRange == "Daily") {
                if (ruleObj.SelectedDayOrRange == "Weekday") {
                    tempSelectedDayOrRange = wemo.items['WeekdaysNoDetails'];
                } else if (ruleObj.SelectedDayOrRange == "Weekend") {
                    tempSelectedDayOrRange = wemo.items['WeekendsNoDetails'];
                } else {
                    tempSelectedDayOrRange = wemo.items[ruleObj.SelectedDayOrRange];
                }
            } else if (ruleObj.SelectedDayOrRange == "Weekdays" || ruleObj.SelectedDayOrRange == "Weekends" || ruleObj.SelectedDayOrRange == "Daily") {
                if (ruleObj.SelectedDayOrRange == "Weekdays") {
                    tempSelectedDayOrRange = wemo.items['WeekdaysNoDetails'];
                } else if (ruleObj.SelectedDayOrRange == "Weekends") {
                    tempSelectedDayOrRange = wemo.items['WeekendsNoDetails'];
                } else {
                    tempSelectedDayOrRange = wemo.items[ruleObj.SelectedDayOrRange];
                }
            } else if (ruleObj.SelectedDayOrRange == wemo.items['WeekdaysDetails']) {
                tempSelectedDayOrRange = wemo.items['WeekdaysNoDetails'];
            } else if (ruleObj.SelectedDayOrRange == wemo.items['WeekendsDetails']) {
                tempSelectedDayOrRange = wemo.items['WeekendsNoDetails'];
            } else if (ruleObj.SelectedDayOrRange == wemo.items['DailyDetails']) {
                tempSelectedDayOrRange = wemo.items['Daily'];
            } else {
                var strDays = ruleObj.SelectedDayOrRange;
                var arrDays = strDays.split("-");
                var displaySelectedVal = [];

                if (arrDays.length > 0) {
                    for (var i = 0; i < arrDays.length; i++) {

                        var temp = arrDays[i];

                        if (temp == "Mon") {
                            displaySelectedVal[i] = wemo.items['MondayShort'];
                        }
                        if (temp == "Tue") {
                            displaySelectedVal[i] = wemo.items['TuesdayShort'];
                        }
                        if (temp == "Wed") {
                            displaySelectedVal[i] = wemo.items['WednesdayShort'];
                        }
                        if (temp == "Thu") {
                            displaySelectedVal[i] = wemo.items['ThursdayShort'];
                        }
                        if (temp == "Fri") {
                            displaySelectedVal[i] = wemo.items['FridayShort'];
                        }
                        if (temp == "Sat") {
                            displaySelectedVal[i] = wemo.items['SaturdayShort'];
                        }
                        if (temp == "Sun") {
                            displaySelectedVal[i] = wemo.items['SundayShort'];
                        }
                        wemoUtil.infoLog(wemoUtil.TAG,"transforming value " + displaySelectedVal[i]);
                    }

                    if (arrDays.length == 1) {
                        tempSelectedDayOrRange = displaySelectedVal;
                    } else {
                        tempSelectedDayOrRange = displaySelectedVal.join(", ");
                    }

                }
            }

        }
        return tempSelectedDayOrRange;
    },

    generateLedRulesSchdStr: function(obj, db, day, udn, callback) {
        var cnt = 0;
        var str = '';
        //var ledstr = '';
        var strCnt = 0;
        var firstRowcapabilityEnd = "";
        var firstRowstarttime = "";
        var offsetGlobal = "";
        var offset2OFF = "";
        var offset = "";

        wemoUtil.locationInfo();

        wemoUtil.infoLog(wemoUtil.TAG,'generateRulesSchdStr LEDS' + JSON.stringify(obj) + "--udn--" + udn);

        if (db == undefined) {
            db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
        }

        db.transaction(startTransaction, errorCB, successCB);

        function startTransaction(tx) {

            //tx.executeSql("SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.GroupID, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.Level, b.ZBCapabilityStart, b.ZBCapabilityEnd, b.Type as DevType from RULES a inner join RULEDEVICES b on a.RuleID=CAST(b.RuleID AS CHAR) where a.State = '1' AND b.DeviceID='" + udn + "' AND  (b.DayID=" + day + " OR b.DayID <=0) order by b.RuleID", [], getRulesList, errorCB);
            //tx.executeSql("SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.GroupID, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.Level, b.ZBCapabilityStart, b.ZBCapabilityEnd, b.Type as DevType from RULES a inner join RULEDEVICES b on a.RuleID=CAST(b.RuleID AS CHAR) where a.State = '1' AND b.DeviceID='" + udn + "' AND  (b.DayID=" + day + " OR b.DayID <=0) order by b.StartTime", [], getRulesList, errorCB);
            tx.executeSql("SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.GroupID, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.Level, b.ZBCapabilityStart, b.ZBCapabilityEnd, b.OnModeOffset, b.OffModeOffset, b.CountdownTime, b.Type as DevType from RULES a inner join RULEDEVICES b on a.RuleID=CAST(b.RuleID AS CHAR) where a.State = '1' AND b.DeviceID LIKE '%" + udn + "' AND  (b.DayID=" + day + " OR b.DayID <=0) order by b.StartTime", [], getRulesList, errorCB);

            function getRulesList(tx, res) {
                var len = res.rows.length;
                var querylength = len;

                for (var i = 0; i < len; i++) {
                    var rule = res.rows.item(i);
                    var srst = "";

                    wemoUtil.infoLog(wemoUtil.TAG,"rules **" + rule + "--" + JSON.stringify(rule));

                    if (rule.Type == 'Simple Switch' || rule.Type == 'Time Interval' || rule.Type == 'Away Mode') {
                        wemoUtil.infoLog(wemoUtil.TAG,"schdule str" + rule.StartAction + "--" + rule.EndAction + "---" + rule.ZBCapabilityStart);

                        var searchType = udn.search("Bridge");


                        if (rule.Type == 'Away Mode') {

                            wemoUtil.infoLog(wemoUtil.TAG,"away mode rule");
                            var searchType = udn.search("Bridge");

                            if (udn.indexOf("uuid") == -1 || searchType != -1 || searchType == true) {

                                var ruleStartime = parseInt(rule.StartTime) + 3;
                                var ruleEndtime = parseInt(rule.StartTime) + parseInt(rule.RuleDuration);
                                ruleEndtime = ruleEndtime + 3;
                                str += '|' + ruleStartime + ',' + rule.StartAction + '|' + ruleEndtime + ',' + rule.EndAction;
                                cnt += 2;

                                wemoUtil.infoLog(wemoUtil.TAG,"offsetGlobal away mode" + offsetGlobal + "-------" + querylength);
                                offsetGlobal += "0,0,";
                                wemoUtil.infoLog(wemoUtil.TAG,"offsetGlobal away mode" + offsetGlobal + "--------" + querylength);

                                querylength--;

                                if (querylength == 0) {
                                    var latitude = window.sessionStorage.getItem(sessionStore.LOCATION_LATITUDE_LED);
                                    var longitude = window.sessionStorage.getItem(sessionStore.LOCATION_LAGITUDE_LED);

                                    if ((latitude == "" || latitude == undefined) && (longitude == "" || longitude == undefined)) {
                                        devicePlugin.execute(
                                            function(params) {
                                                if (params != "") {
                                                    var latandlong = params.replace(/#/, '');
                                                    latandlong = $.trim(latandlong);

                                                    var latandlongArr = latandlong.split(",");

                                                    latitude = latandlongArr[0];
                                                    longitude = latandlongArr[1];
                                                    wemoUtil.infoLog(wemoUtil.TAG,"Lat & Log" + latitude + "--" + longitude);

                                                    offsetGlobal = offsetGlobal.replace(/,\s*$/, '');

                                                    if (latitude == 0 || latitude == null || longitude == 0 || longitude == null)
                                                        str += "$" + offsetGlobal;

                                                    else
                                                        str += "#" + latitude + "," + longitude + "$" + offsetGlobal;

                                                }
                                            },
                                            wemoUtil.reportError,
                                            actions.GPS_LOCATION, []
                                        );


                                    } else {
                                        offsetGlobal = offsetGlobal.replace(/,\s*$/, '');

                                        if (latitude == 0 || latitude == null || longitude == 0 || longitude == null)
                                            str += "$" + offsetGlobal;

                                        else
                                            str += "#" + latitude + "," + longitude + "$" + offsetGlobal;

                                    }

                                }

                            }

                        } else if ((udn.indexOf("uuid") == -1 || searchType != -1 || searchType == true) && rule.Type != 'Away Mode') {

                            //ON Rule
                            if (rule.StartAction == 1 && rule.EndAction == 1) {
                                var fadeinval = "";
                                var SRSS = "";
                                var offset = "";


                                if (rule.StartTime % 10 == "1" || rule.StartTime % 10 == "4")
                                    SRSS = "Sunrise";

                                else if (rule.StartTime % 10 == "2" || rule.StartTime % 10 == "5")
                                    SRSS = "Sunset";

                                wemoUtil.infoLog(wemoUtil.TAG," obj" + JSON.stringify(obj.Devices));

                                $.each(obj.Devices, function(key, val) {
                                    wemoUtil.infoLog(wemoUtil.TAG,"key " + key + "--" + val)
                                    fadeinval = val.FadeIn;
                                });

                                wemoUtil.infoLog(wemoUtil.TAG,"fadeinval " + fadeinval);

                                if (fadeinval != undefined) {
                                    //var tempStartTime = parseInt(parseInt(rule.StartTime)-parseInt(fadeinval/10));
                                    var tempZBCapabilityStart = rule.ZBCapabilityStart;

                                    if (tempZBCapabilityStart.indexOf("10008") != -1) {
                                        if (SRSS == "Sunrise" || SRSS == "Sunset") {
                                            var tempStartTime = rule.StartTime;
                                        } else {
                                            var tempStartTime = parseInt(parseInt(rule.StartTime) - parseInt(fadeinval / 10));
                                        }

                                        //var tempStartTime = rule.StartTime;
                                    } else {
                                        if (SRSS == "Sunrise" || SRSS == "Sunset") {
                                            var tempStartTime = parseInt(parseInt(rule.StartTime) + parseInt(fadeinval / 10));
                                        } else {
                                            var tempStartTime = rule.StartTime;
                                        }

                                        //var tempStartTime = parseInt(parseInt(rule.StartTime)-parseInt(fadeinval/10));
                                    }

                                    offset = parseInt(rule.OnModeOffset) - parseInt(fadeinval / 10);
                                    wemoUtil.infoLog(wemoUtil.TAG,"in if" + tempStartTime + ',' + rule.ZBCapabilityStart + "===" + offset);
                                } else {
                                    var tempZBCapabilityStart = rule.ZBCapabilityStart;

                                    if (tempZBCapabilityStart.indexOf("10008") != -1) {
                                        var fadeinArr = tempZBCapabilityStart.split("=");
                                        var fadeinArrrVal = fadeinArr[1].split(":");
                                        //var tempStartTime = rule.StartTime;
                                        offset = parseInt(rule.OnModeOffset) - parseInt(fadeinArrrVal[1] / 10);

                                        if (SRSS == "Sunrise" || SRSS == "Sunset") {
                                            var tempStartTime = rule.StartTime;
                                        } else {
                                            var tempStartTime = parseInt(parseInt(rule.StartTime) - parseInt(fadeinArrrVal[1] / 10));
                                        }

                                    } else {
                                        var tempStartTime = rule.StartTime;
                                    }

                                    wemoUtil.infoLog(wemoUtil.TAG,"in else" + tempStartTime + ',' + rule.ZBCapabilityStart + "===" + offset);

                                }

                                str += '|' + tempStartTime + ',' + rule.ZBCapabilityStart;

                                if (i % 2 != 0) {
                                    var latitude = "";
                                    var longitude = "";

                                    if (SRSS == "Sunrise" || SRSS == "Sunset") {
                                        offsetGlobal += offset + "," + offset + ",";
                                        wemoUtil.infoLog(wemoUtil.TAG,"ON " + offset + "," + offset + "---" + offsetGlobal);
                                        //str += "#"+latitude+","+longitude+"$"+offset+","+offset;
                                        srst = "true";

                                    } else {
                                        offset = "0";
                                        offsetGlobal += offset + "," + offset + ",";
                                        srst = "";
                                    }

                                }
                                cnt += 1;
                            }

                            //OFF Rule
                            else if (rule.StartAction == 0 && rule.EndAction == 0) {
                                var SRSS = "";
                                var offset1 = "";
                                var offset2 = "";

                                if (rule.StartTime % 10 == "1" || rule.StartTime % 10 == "4")
                                    SRSS = "Sunrise";

                                else if (rule.StartTime % 10 == "2" || rule.StartTime % 10 == "5")
                                    SRSS = "Sunset";


                                var fadeoutval = "";
                                $.each(obj.Devices, function(key, val) {
                                    wemoUtil.infoLog(wemoUtil.TAG,"key " + key + "--" + val)
                                    fadeoutval = val.FadeOut;
                                });


                                if (fadeoutval == undefined || fadeoutval == "") {
                                    var tempZBCapabilityEnd = rule.ZBCapabilityEnd;

                                    if (tempZBCapabilityEnd.indexOf("10008") != -1) {
                                        var fadeoutArr = tempZBCapabilityEnd.split("=");
                                        var fadeoutArrVal = fadeoutArr[1].split(":");
                                        offset2 = parseInt(rule.OnModeOffset) + parseInt(fadeoutArrVal[1] / 10);
                                        var tempStrtime = rule.StartTime;
                                        firstRowstarttime = tempStrtime;
                                        offset2OFF = offset2;
                                    } else {
                                        if (SRSS == "Sunrise" || SRSS == "Sunset") {
                                            var tempStrtime = firstRowstarttime;
                                        } else {
                                            var tempStrtime = rule.StartTime;
                                        }

                                        offset2 = offset2OFF;
                                    }
                                } else {
                                    var tempZBCapabilityEnd = rule.ZBCapabilityEnd;

                                    if (tempZBCapabilityEnd.indexOf("10008") != -1) {
                                        var tempStrtime = rule.StartTime;
                                    } else {
                                        if (SRSS == "Sunrise" || SRSS == "Sunset") {
                                            var tempStrtime = parseInt(rule.StartTime) - parseInt(fadeoutval / 10);
                                        } else {
                                            var tempStrtime = rule.StartTime;
                                        }
                                    }
                                    offset2 = parseInt(rule.OnModeOffset) + parseInt(fadeoutval / 10);
                                }

                                offset1 = rule.OnModeOffset;

                                wemoUtil.infoLog(wemoUtil.TAG,"offset1 " + offset1 + "--" + offset2);

                                //str += '|' + rule.StartTime + ',' + rule.ZBCapabilityEnd;
                                str += '|' + tempStrtime + ',' + rule.ZBCapabilityEnd;

                                if (i % 2 != 0) {
                                    var latitude = "";
                                    var longitude = "";

                                    if (SRSS == "Sunrise" || SRSS == "Sunset") {
                                        offsetGlobal += offset1 + "," + offset2 + ",";
                                        //str += "#"+latitude+","+longitude+"$"+offset1+","+offset2;
                                        wemoUtil.infoLog(wemoUtil.TAG,"OFF " + offset1 + "," + offset2 + "---" + offsetGlobal);
                                        srst = "true";
                                    } else {
                                        offset1 = "0";
                                        offset2 = "0";
                                        offsetGlobal += offset1 + "," + offset2 + ",";
                                        wemoUtil.infoLog(wemoUtil.TAG,"OFF " + offset1 + "," + offset2 + "---" + offsetGlobal);
                                        srst = "";
                                    }
                                }

                                cnt += 1;
                            }

                            //UNTIL Rule
                            else if (rule.StartAction == 1 && rule.EndAction == 0) {
                                wemoUtil.infoLog(wemoUtil.TAG,"entering in until Rule");

                                if (i % 2 == 0) {

                                    var SRSS = "";

                                    firstRowcapabilityEnd = rule.ZBCapabilityEnd;
                                    //firstRowstarttime = rule.StartTime;	                        				

                                    var fadeinval = "";
                                    $.each(obj.Devices, function(key, val) {
                                        wemoUtil.infoLog(wemoUtil.TAG,"key " + key + "--" + val)
                                        fadeinval = val.FadeIn;
                                    });

                                    if (rule.StartTime % 10 == "1" || rule.StartTime % 10 == "4")
                                        SRSS = "Sunrise";

                                    else if (rule.StartTime % 10 == "2" || rule.StartTime % 10 == "5")
                                        SRSS = "Sunset";

                                    var tempStartTime = "";

                                    if (fadeinval != undefined) {
                                        if (SRSS == "Sunrise" || SRSS == "Sunset") {
                                            tempStartTime = rule.StartTime;
                                        } else {
                                            tempStartTime = parseInt(parseInt(rule.StartTime) - parseInt(fadeinval / 10));
                                        }

                                        firstRowstarttime = tempStartTime;
                                        offset = parseInt(rule.OnModeOffset) - parseInt(fadeinval / 10);
                                        wemoUtil.infoLog(wemoUtil.TAG,"entering in if offset" + offset);
                                    } else {
                                        var tempZBCapabilityStart = rule.ZBCapabilityStart;

                                        if (tempZBCapabilityStart.indexOf("10008") != -1) {
                                            var fadeinArr = tempZBCapabilityStart.split("=");
                                            var fadeinArrrVal = fadeinArr[1].split(":");
                                            offset = parseInt(rule.OnModeOffset) - parseInt(fadeinArrrVal[1] / 10);
                                            offset2OFF = offset;

                                            if (SRSS == "Sunrise" || SRSS == "Sunset") {
                                                tempStartTime = rule.StartTime;

                                            } else {
                                                tempStartTime = parseInt(parseInt(rule.StartTime) - parseInt(fadeinArrrVal[1] / 10));
                                            }

                                            wemoUtil.infoLog(wemoUtil.TAG,"afsadfasd" + tempStartTime);

                                        } else {
                                            tempStartTime = rule.StartTime;
                                            firstRowstarttime = tempStartTime;
                                            offset = offset2OFF;
                                        }
                                        wemoUtil.infoLog(wemoUtil.TAG,"entering in if offset else" + offset);

                                    }

                                    wemoUtil.infoLog(wemoUtil.TAG,"tempStartTime " + tempStartTime);
                                    str += '|' + tempStartTime + ',' + rule.ZBCapabilityStart;
                                    cnt += 1;
                                } else if (i % 2 != 0) {
                                    var fadeoutval = "";
                                    var SRSS = "";

                                    $.each(obj.Devices, function(key, val) {
                                        wemoUtil.infoLog(wemoUtil.TAG,"key " + key + "--" + val)
                                        fadeoutval = val.FadeOut;
                                    });

                                    if (rule.StartTime % 10 == "1" || rule.StartTime % 10 == "4")
                                        SRSS = "Sunrise";

                                    else if (rule.StartTime % 10 == "2" || rule.StartTime % 10 == "5")
                                        SRSS = "Sunset";

                                    var tempFadeoutStrTime = "";

                                    if (fadeoutval != undefined) {
                                        var tempEndTime = parseInt(parseInt(rule.RuleDuration) + parseInt(rule.StartTime));
                                        //tempFadeoutStrTime = (tempEndTime) - (fadeoutval/10);

                                        if (SRSS == "Sunrise" || SRSS == "Sunset") {
                                            tempFadeoutStrTime = tempEndTime;
                                        } else {
                                            tempFadeoutStrTime = (tempEndTime) + (fadeoutval / 10);
                                        }

                                        offset2 = parseInt(rule.OffModeOffset) + parseInt(fadeoutval / 10);
                                    } else {
                                        var tempEndTime = parseInt(parseInt(rule.RuleDuration) + parseInt(rule.StartTime));
                                        var tempZBCapabilityEnd = rule.ZBCapabilityEnd;

                                        wemoUtil.infoLog(wemoUtil.TAG,"tempEndTime " + tempEndTime + "--" + rule.RuleDuration + "--" + rule.StartTime + "---" + tempZBCapabilityEnd);

                                        if (tempZBCapabilityEnd.indexOf("10008") != -1) {
                                            var fadeoutArr = tempZBCapabilityEnd.split("=");
                                            var fadeoutArrVal = fadeoutArr[1].split(":");
                                            //tempFadeoutStrTime = (tempEndTime) - (fadeoutArrVal[1]/10);                        							
                                            offset2 = parseInt(rule.OffModeOffset) + parseInt(fadeoutArrVal[1] / 10);
                                            offset2OFF = offset2;

                                            if (SRSS == "Sunrise" || SRSS == "Sunset") {
                                                tempFadeoutStrTime = tempEndTime;
                                            } else {
                                                tempFadeoutStrTime = (tempEndTime) + (fadeoutArrVal[1] / 10);
                                            }
                                            wemoUtil.infoLog(wemoUtil.TAG,"sdfsdfsf " + tempZBCapabilityEnd + "--" + fadeoutArr + "--" + tempFadeoutStrTime + "---" + fadeoutArrVal);
                                        } else {
                                            //tempFadeoutStrTime = tempEndTime;
                                            tempFadeoutStrTime = rule.StartTime;
                                            wemoUtil.infoLog(wemoUtil.TAG,"else " + tempFadeoutStrTime + "---" + tempEndTime);
                                            offset2 = offset2OFF;
                                        }

                                    }
                                    wemoUtil.infoLog(wemoUtil.TAG,"fade out value***" + fadeoutval);

                                    wemoUtil.infoLog(wemoUtil.TAG,"fade out value***" + tempFadeoutStrTime);

                                    offset1 = rule.OffModeOffset;

                                    //str += '|' + firstRowstarttime + ',' + rule.ZBCapabilityStart + '|' + tempFadeoutStrTime + "," + rule.ZBCapabilityEnd + '|' + tempEndTime + "," + firstRowcapabilityEnd;      
                                    str += '|' + firstRowstarttime + ',' + rule.ZBCapabilityStart + '|' + tempEndTime + "," + rule.ZBCapabilityEnd + '|' + tempFadeoutStrTime + "," + firstRowcapabilityEnd;

                                    var latitude = "";
                                    var longitude = "";

                                    if (SRSS == "Sunrise" || SRSS == "Sunset") {
                                        offsetGlobal += offset + "," + offset + "," + offset1 + "," + offset2 + ",";
                                        //str += "#"+latitude+","+longitude+"$"+offset+","+offset+","+offset1+","+offset2;
                                        srst = "true";
                                        wemoUtil.infoLog(wemoUtil.TAG," untill offsetGlobal" + offsetGlobal);

                                    } else {
                                        offset = "0";
                                        offset1 = "0";
                                        offset2 = "0";
                                        offsetGlobal += offset + "," + offset + "," + offset1 + "," + offset2 + ",";
                                        wemoUtil.infoLog(wemoUtil.TAG,"UNTILL  " + offset1 + "," + offset2 + "---" + offsetGlobal);
                                        srst = "";
                                        wemoUtil.infoLog(wemoUtil.TAG," untill offsetGlobal else" + offsetGlobal);
                                    }

                                    cnt += 3;
                                    wemoUtil.infoLog(wemoUtil.TAG,"fdsfsdf " + firstRowstarttime + ',' + rule.ZBCapabilityStart + '|' + tempFadeoutStrTime + "," + rule.ZBCapabilityEnd + '|' + tempEndTime + "," + firstRowcapabilityEnd)
                                }

                                strCnt++;

                            }

                            querylength--;
                            wemoUtil.infoLog(wemoUtil.TAG,"strCnt plus i " + querylength + "--" + i);

                            if (querylength == 0) {

                                var latitude = window.sessionStorage.getItem(sessionStore.LOCATION_LATITUDE_LED);
                                var longitude = window.sessionStorage.getItem(sessionStore.LOCATION_LAGITUDE_LED);

                                if ((latitude == "" || latitude == undefined) && (longitude == "" || longitude == undefined)) {
                                    devicePlugin.execute(
                                        function(params) {

                                            wemoUtil.infoLog(wemoUtil.TAG,"lat long params " + params);

                                            if (params != "") {
                                                var latandlong = params.replace(/#/, '');
                                                latandlong = $.trim(latandlong);

                                                var latandlongArr = latandlong.split(",");

                                                latitude = latandlongArr[0];
                                                longitude = latandlongArr[1];

                                            } else {
                                                latitude = 0;
                                                longitude = 0;
                                            }

                                            offsetGlobal = offsetGlobal.replace(/,\s*$/, '');
                                            str += "#" + latitude + "," + longitude + "$" + offsetGlobal;

                                        },
                                        wemoUtil.reportError,
                                        actions.GPS_LOCATION, []
                                    );
                                } else {
                                    offsetGlobal = offsetGlobal.replace(/,\s*$/, '');
                                    str += "#" + latitude + "," + longitude + "$" + offsetGlobal;
                                }


                            }
                            wemoUtil.infoLog(wemoUtil.TAG,"entering in uuid" + str + "count---" + cnt);

                        } else {
                            wemoUtil.infoLog(wemoUtil.TAG,"entering in uuid else");
                            str += '|' + rule.StartTime + ',' + rule.StartAction + '|' + (rule.StartTime + rule.RuleDuration) + ',' + rule.EndAction;
                            cnt += 2;
                        }

                        //cnt += 2;

                    }

                    if (rule.Type == 'Motion Controlled') {
                        str += '|' + rule.StartTime + ',' + rule.StartAction + ',[5;0;0;' + rule.DeviceID + ',0,' + rule.SensorDuration + ',0]|' + (rule.StartTime + rule.RuleDuration) + ',' + rule.EndAction;
                        cnt += 2;
                    }

                }
                wemoUtil.infoLog(wemoUtil.TAG,"ledstr **" + str);
            }
        }


        function errorCB(err) {
            wemoUtil.infoLog(wemoUtil.TAG,"Error processing SQL: " + err.code, "Error");
        }

        function successCB() {
            callback(day, cnt.toString() + str);
        }
    },

    pushScheduleLedDevicesSRS: function(udn, db, obj, key, devicelength, location, par, callback) {
        wemoUtil.pushScheduleLedDevices(udn, db, obj, key, devicelength, location, par, callback);
    },

    pushScheduleLedDevices: function(udn, db, obj, key, devicelength, location, par, callback) {
        wemoUtil.infoLog(wemoUtil.TAG,"entering in LED PUSH STRING" + JSON.stringify(obj));

        var schStr = ['', '', '', '', '', '', '', udn];

        var devicetype = "";
        //var setLocation = false;

        var rgx = /[^0-9]/;

        if (udn.search(rgx) === -1) {
            devicetype = "group";
        } else {
            devicetype = "single";
        }


        for (var i = 1; i <= 7; i++) {
            wemoUtil.generateLedRulesSchdStr(obj, db, i, udn, fillSchd);
        }

        function fillSchd(day, str) {
            if (day == 1) {
                schStr[6] = str;
            } else {
                schStr[day - 2] = str;
            }

            var filled = true;

            for (var j = 0; j < 7; j++) {
                if (schStr[j] == '') {
                    filled = false;
                }
            }

            wemoUtil.infoLog(wemoUtil.TAG,JSON.stringify(schStr));

            if (filled) {
                wemoUtil.infoLog(wemoUtil.TAG,"pushBridgeSchStr***" + JSON.stringify(schStr));

                wemoUtil.pushBridgeSchStr(schStr, devicetype);

                wemoUtil.infoLog(wemoUtil.TAG,'Done in LED' + key + "---" + devicelength);

                //if (key == parseInt(Object.keys(obj.Devices).length) - 1) {
                if (key == devicelength - 1) {

                    setTimeout(function() {
                        deviceTabPlugin.execute(
                            function(data) {
                                if (data == networkType.HOME_NETWORK) {
                                    wemoUtil.pushDB(sessionStore.RULES_LOCATION_SETTINGS, callback);
                                } else if (data == networkType.REMOTE_WIFI || data == networkType.REMOTE_MOBILE) {
                                    deviceTabPlugin.execute(
                                        function(enabled) {
                                            wemoUtil.infoLog(wemoUtil.TAG,"Remote enabled: " + enabled);
                                            if (enabled) {
                                                setTimeout(function() {
                                                    wemoUtil.uploadDBOnCloud(sessionStore.RULES_LOCATION_SETTINGS, callback);
                                                }, 3000);
                                            } else {
                                                navigator.app.loadUrl(filePath.REMOTE_NOT_AVAILABLE, {
                                                    loadUrlTimeoutValue: 60000
                                                });
                                            }
                                        },
                                        wemoUtil.reportError,
                                        actions.IS_REMOTE_ENABLED, []
                                    );
                                }
                            },
                            function(err) {
                                wemoUtil.infoLog(wemoUtil.TAG,"Error getting sensors list")
                            },
                            actions.GET_NETWORK_TYPE, []
                        );
                    }, 5000);

                }

            }
        }
    },

    pushBridgeSchStr: function(x, devicetype) {
        wemoUtil.infoLog(wemoUtil.TAG,"##########  push Schedule String Bridge:function() :: " + x + "--" + devicetype);


        deviceTabPlugin.execute(
            function(type) {
                wemoUtil.infoLog(wemoUtil.TAG,"type" + type);
                if (type === networkType.HOME_NETWORK) {
                    wemoUtil.infoLog(wemoUtil.TAG,"home network");
                    wemoUtil.infoLog(wemoUtil.TAG, 'Home scheduled string');

                    deviceTabPlugin.execute(
                        function(e) {
                            wemoUtil.infoLog(wemoUtil.TAG,e);

                            //	                            navigator.notification.activityStop();
                            //	                            wemoUtil.loadUrl(filePath.ENABLED_RULES);

                        },
                        wemoUtil.reportError,
                        actions.PUSH_LED_SCH_STR_TO_PLUGIN,
                        x
                    );
                    wemoUtil.infoLog(wemoUtil.TAG,"out of the home network");

                } else if (type === networkType.REMOTE_MOBILE || type === networkType.REMOTE_WIFI) {
                    wemoUtil.infoLog(wemoUtil.TAG,"remote network");
                    wemoUtil.infoLog(wemoUtil.TAG, 'remote scheduled string');
                    devicePlugin.execute(
                        function(enabled) {
                            wemoUtil.infoLog(wemoUtil.TAG,"remote enables");
                            wemoUtil.infoLog(wemoUtil.TAG, 'Remote enabled: ' + enabled);
                            if (enabled) {
                                var arrayLedObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_DATA);
                                wemoUtil.infoLog(wemoUtil.TAG,"LED SCH SR1" + JSON.stringify(arrayLedObjects));
                                var bridgeDetails = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_BRIDGE_UDN);
                                wemoUtil.infoLog(wemoUtil.TAG,"LED SCH SR2" + JSON.stringify(bridgeDetails));

                                var wemoObject = arrayLedObjects;
                                var wemoBridgeObj = bridgeDetails;
                                var udn = x[7];
                                var macAddress = '';
                                var pluginID = '';
                                wemoUtil.infoLog(wemoUtil.TAG, 'udn to be searched' + udn);
                                wemoUtil.infoLog(wemoUtil.TAG, 'wemo object: ' + JSON.stringify(wemoObject));


                                /*for (var i in wemoObject) {
	                                        var Obj = wemoObject[i];
	                                        
	                                        wemoUtil.infoLog(wemoUtil.TAG, 'udn searching: ' + Obj.udn);
	                                        if (Obj.macAddress === udn) {
//	                                        alert('got the udn');
	                                            /*macAddress = Obj.macAddress;
	                                            pluginID = Obj.pluginId;*/
                                /*wemoUtil.infoLog(wemoUtil.TAG,"entering in for dfsdf");
	                                        	for (var j in wemoObject) {
	                                        		wemoUtil.infoLog(wemoUtil.TAG," wemoBridgeObj[i] "+ wemoBridgeObj[i]+"--"+JSON.stringify(wemoBridgeObj[i]));
	                                        		var bridgeObj = wemoBridgeObj[i];
	                                        		wemoUtil.infoLog(wemoUtil.TAG," bridgeObj.macAddress "+ bridgeObj.macAddress);
	                                        		macAddress =  bridgeObj.macAddress;
		                                        	pluginID = bridgeObj.pluginId;	                                        		
	                                        	}	                                        	
	                                        	break;
	                                        }
	                                    }*/

                                var len = wemoBridgeObj.length;

                                for (var i = 0; i < len; i++) {
                                    macAddress = wemoBridgeObj[i].macAddress;
                                    pluginID = wemoBridgeObj[i].pluginId;
                                }

                                /*for (var i in wemoBridgeObj) {
	                                    	 var bridgeObj = wemoObject[i];
	                                    	 macAddress =  bridgeObj.macAddress;
	                                         pluginID = bridgeObj.pluginId;	                                    	 
	                                    }*/

                                wemoUtil.infoLog(wemoUtil.TAG,"mac & plugin ID" + macAddress + " : " + pluginID);
                                wemoUtil.infoLog(wemoUtil.TAG, 'mac address' + macAddress);
                                wemoUtil.infoLog(wemoUtil.TAG, 'Plugin ID' + pluginID);

                                wemoUtil.callSimulatedActionsToCloudforBridge(pluginID, macAddress, x, "leds", udn);
                                //wemoUtil.uploadScheduledStringOnCloud(pluginID, macAddress, x, "leds", udn);


                            } else {
                                wemoUtil.loadUrl(filePath.REMOTE_NOT_AVAILABLE);
                            }
                        },
                        wemoUtil.reportError,
                        actions.IS_REMOTE_ENABLED, []
                    );
                }

            },
            wemoUtil.reportError,
            actions.GET_NETWORK_TYPE, []
        );


    },

    locationInfo: function() {

        var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
        db.transaction(getCurrentInfo, errorCB, successCB);

        function getCurrentInfo(tx) {
            tx.executeSql("SELECT * FROM LOCATIONINFO", [], selectQuerySuccess, errorCB);
        }

        function selectQuerySuccess(tx, results) {
            var len = results.rows.length;


            if (len > 0) {
                var entry = results.rows.item(0);
                latitude = entry.latitude;
                longitude = entry.longitude;
                wemoUtil.infoLog(wemoUtil.TAG,'latitude in Wemo:::' + latitude);
                wemoUtil.infoLog(wemoUtil.TAG,'longitude in Wemo:::' + longitude);
                window.sessionStorage.setItem(sessionStore.LOCATION_LATITUDE_LED, latitude);
                window.sessionStorage.setItem(sessionStore.LOCATION_LAGITUDE_LED, longitude);
            }

        }

        function errorCB() {
            wemoUtil.infoLog(wemoUtil.TAG,"Error Selecting records");
//
        }

        function successCB() {
            wemoUtil.infoLog(wemoUtil.TAG,'Successfully retrived DB');
//
        }

    },

    getMakerSwithUDN: function(makerUdn) {
        var tempArray = makerUdn.split(":");
        makerUdn = tempArray[0] + ":" + tempArray[1] + ":switch";
        return makerUdn;
    },
    isMakerDevice: function(makerUdn) {
        if (makerUdn.indexOf("uuid:Maker") != -1) {
            return true;
        } else {
            return false;
        }
    },
    isMakerSwitch: function(makerUdn) {
        if (makerUdn.indexOf(":switch") != -1) {
            return true;
        } else {
            return false;
        }
    },
    getOriginalMakerUDN: function(makerUdn) {
        var tempArray = makerUdn.split(":");
        makerUdn = tempArray[0] + ":" + tempArray[1] + ":sensor:switch";
        return makerUdn;
    },
    getFaultyMakerUDN: function(makerUdn) {
        var tempArray = makerUdn.split(":");
        makerUdn = tempArray[0] + ":" + tempArray[1] + ":switch:sensor";
        return makerUdn;
    },
    getMakerSensorUDN: function(makerUdn) {
        var tempArray = makerUdn.split(":");
        makerUdn = tempArray[0] + ":" + tempArray[1] + ":sensor";
        return makerUdn;
    },
    uploadRuleIdOnCloud: function(deviceID, macAddress, msgStr) {
        wemoUtil.infoLog(wemoUtil.TAG, 'uploadRuleIdOnCloud');
        var xmlRequestString = wemoUtil.buildCloudRequestForNotificationRuleID(deviceID, macAddress, msgStr);
        wemoUtil.infoLog(wemoUtil.TAG, 'request: ' + xmlRequestString);
        nativeUtilPlugin.execute(
            function(params) {
                wemoUtil.infoLog(wemoUtil.TAG,"success call back");
                var authCode = params[0];
                wemoUtil.infoLog(wemoUtil.TAG,"authCode" + authCode);
                $.ajax({
                    url: cloudAPI.DEVICE_MESSAGE,
                    type: "POST",
                    data: xmlRequestString,
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader('Content-Type', 'application/xml');
                        xhr.setRequestHeader('Authorization', authCode);
                    },
                    success: function(data) {
                        wemoUtil.infoLog(wemoUtil.TAG,"Sucess Notification response from cloud...");
                        var responseXML = (new XMLSerializer()).serializeToString(data);
                        wemoUtil.infoLog(wemoUtil.TAG, responseXML);
                    },
                    error: function(xhr, textstatus) {
                        wemoUtil.infoLog(wemoUtil.TAG, (new XMLSerializer()).serializeToString(xhr));
                        wemoUtil.infoLog(wemoUtil.TAG, 'uploadRuleIdOnCloud >> status: ' + xhr.status);
                        wemoUtil.infoLog(wemoUtil.TAG, 'uploadRuleIdOnCloud >> status text is: ' + xhr.statusText);
                    }
                });

            },
            function() {
                //error callback
            },
            actions.GENERATE_AUTH_CODE, []
        );

    },

    buildCloudRequestForNotificationRuleID: function(deviceID, macAddress, msgStr) {

        request = '<plugins> ' +
            '<plugin>' +
            '<recipientid>' + deviceID + '</recipientid>' +
            '<macAddress>' + macAddress + '</macAddress>' +
            '<content>' +
            '<![CDATA[<editPNRuleMessage>' +
            '<action>' + 0 + '</action>' +
            '<frequency>' + msgStr[2] + '</frequency>' +
            '<ruleId>' + msgStr[0] + '</ruleId>' +
            '<messageText>' + msgStr[1] + '</messageText>' +
            '<macAddress>' + macAddress + '</macAddress>' +
            '</editPNRuleMessage>]]>' +
            '</content>' +
            '</plugin> ' +
            '</plugins>';
        wemoUtil.infoLog(wemoUtil.TAG,"buildCloudRequestForNotificationRuleID string:: " + request);
        return request;
    },

    setNotifyMessage: function(msgStr, notifyMessage) {
        wemoUtil.infoLog(wemoUtil.TAG,"setNotifyMessage is called " + msgStr);
        deviceTabPlugin.execute(
            function(type) {
                wemoUtil.infoLog(wemoUtil.TAG,"type" + type);
                if (type === networkType.HOME_NETWORK) {

                    wemoUtil.infoLog(wemoUtil.TAG,"In setNotifyMessage >> home network");
                    deviceTabPlugin.execute(
                        function(e) {
                            wemoUtil.infoLog(wemoUtil.TAG,e);
                        },
                        wemoUtil.reportError,
                        actions.SET_NOTIFY_MESSAGE,
                        msgStr);

                    wemoUtil.infoLog(wemoUtil.TAG,"In setNotifyMessage >> out of the home network");

                } else if (type === networkType.REMOTE_MOBILE || type === networkType.REMOTE_WIFI) {
                    wemoUtil.infoLog(wemoUtil.TAG,"In setNotifyMessage >> remote network");
                    devicePlugin.execute(
                        function(enabled) {
                            wemoUtil.infoLog(wemoUtil.TAG,"In setNotifyMessage >> remote is enabled::" + enabled);
                            if (enabled) {
                                var arraySwitchObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SWITCH_DATA);
                                var arrayDimmerObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DIMMER_DATA);
                                var arraySensorObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.SENSOR_DATA);
                                var arrayInsightObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.INSIGHT_DATA);
                                var arrayMakerObjects = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.MAKER_DATA);
                                var arrayPIRSensors = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.PIR_DATA);
                                var arrayFobSensors = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.FOB_DATA);
                                var arrayDWSensors = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.DWSENSOR_DATA);
                                
                                wemoUtil.infoLog(wemoUtil.TAG, 'switch' + JSON.stringify(arraySwitchObjects));
                                wemoUtil.infoLog(wemoUtil.TAG, 'sensors' + JSON.stringify(arraySensorObjects));
                                wemoUtil.infoLog(wemoUtil.TAG, 'insights' + JSON.stringify(arrayInsightObjects));
                                wemoUtil.infoLog(wemoUtil.TAG, 'maker' + JSON.stringify(arrayMakerObjects));

                                var wemoObject = arraySensorObjects.concat(arraySwitchObjects, arrayInsightObjects, arrayMakerObjects, arrayPIRSensors,arrayFobSensors, arrayDWSensors);
                                var udn = msgStr[3];
                                var splitUdnArray = udn.split(":");
                                var macAddress = '';
                                var pluginID = '';
                                wemoUtil.infoLog(wemoUtil.TAG, 'udn to be searched' + udn);
                                wemoUtil.infoLog(wemoUtil.TAG, 'wemo object: ' + JSON.stringify(wemoObject));


                                for (var i in wemoObject) {
                                    var Obj = wemoObject[i];
                                    wemoUtil.infoLog(wemoUtil.TAG, 'udn searching: ' + Obj.udn);
                                    var ObjUDN = Obj.udn;
                                    var tempArray = ObjUDN.split(":");
                                    if (tempArray[1] == splitUdnArray[1]) {
                            	    	if(tempArray[1].search('Bridge') != -1){
                            	    		var bridgeData = wemoUtil.getJSONObjectFromSessionStorage(sessionStore.LED_BRIDGE_UDN);
                            	    		macAddress = bridgeData[0].macAddress;
                                            pluginID = bridgeData[0].pluginId;
                            	    	}
                            	    	else{
                            	    		macAddress = Obj.macAddress;
                                            pluginID = Obj.pluginId;
                            	    	}
                                        break;
                                    }
                                }
                                wemoUtil.infoLog(wemoUtil.TAG,"mac & plugin ID" + macAddress + " : " + pluginID);
                                wemoUtil.infoLog(wemoUtil.TAG, 'mac address' + macAddress);
                                wemoUtil.infoLog(wemoUtil.TAG, 'Plugin ID' + pluginID);

                                var temp_msg = notifyMessage;
                                if (temp_msg.indexOf("&") != -1) {
                                    temp_msg = temp_msg.replace(/&/g, "&amp;");
                                }
                                if (temp_msg.indexOf("\"") != -1) {
                                    temp_msg = temp_msg.replace(/"/g, "&quot;");
                                }
                                if (temp_msg.indexOf("\\") != -1) {
                                    temp_msg = temp_msg.replace(/\\/g, "&#47;");
                                }
                                if (temp_msg.indexOf("\'") != -1) {
                                    temp_msg = temp_msg.replace(/'/g, "\'\'");
                                }
                                notifyMessage = temp_msg;
                                msgStr[1] = '\'' + notifyMessage + '\'';
                                wemoUtil.infoLog(wemoUtil.TAG,"notifyMessage is :: " + notifyMessage);
                                wemoUtil.infoLog(wemoUtil.TAG,"msg is :: " + msgStr[1]);
                                wemoUtil.uploadRuleIdOnCloud(pluginID, macAddress, msgStr);

                            } else {
                                wemoUtil.loadUrl(filePath.REMOTE_NOT_AVAILABLE);
                            }
                        },
                        wemoUtil.reportError,
                        actions.IS_REMOTE_ENABLED, []
                    );
                }

            },
            wemoUtil.reportError,
            actions.GET_NETWORK_TYPE, []
        );
    },
    
    userPreferences: {
        setTimeFormat: function(tf){
            window.sessionStorage.setItem(sessionStore.USER_PREF_TIME_FORMAT_IS24, JSON.stringify(tf));
        },
        getTimeFormat: function(){
            return (window.sessionStorage.getItem(sessionStore.USER_PREF_TIME_FORMAT_IS24) === 'true');
        }
    },

    setTimeFormat: function() {
        nativeUtilPlugin.execute(
            function(flag) {
                UP_TF_IS24 = flag;
                wemoUtil.userPreferences.setTimeFormat(UP_TF_IS24);
                wemoUtil.infoLog(wemoUtil.TAG,"UP_TF_IS24= " + UP_TF_IS24);
            },
            wemoUtil.reportError,
            actions.USER_PREF_TIME_FORMAT_IS24, []
        );
    },

    extractNetCamName: function(name) {
        tmpDevName = name;

        if (name.lastIndexOf(';') > 0) {
            tmpDevName = name.substring(0, name.lastIndexOf(';'));
        } else if (name.lastIndexOf(',') > 0) {
            tmpDevName = name.substring(0, name.lastIndexOf(','));
        }

        return tmpDevName;
    },
    extractNetCamLogin: function(name) {
        tmpDevLogin = name;
        prefixL = 'LoginName=';
        if (name.lastIndexOf(prefixL) > 0) {
            tmpDevLogin = name.substring(name.lastIndexOf(prefixL) + prefixL.length);
        } else
            tmpDevLogin = null;
        return tmpDevLogin;
    },

    callSimulatedActionsToCloudforBridge: function(deviceID, macAddress, weekArray, devicetype, bridgeudn) {

//        var so = window.sessionStorage.getItem("SO");
//        wemoUtil.infoLog(wemoUtil.TAG,"check point 1:: " + so + "deviceID:" + deviceID + "weekArray::" + weekArray + "macAddress::" + macAddress);
//
//        if (so != null) {
//            wemoUtil.uploadSOStringOnCloud(deviceID, macAddress, weekArray, devicetype, bridgeudn);
//            window.sessionStorage.removeItem("SO");
//        } else
            wemoUtil.uploadScheduledStringOnCloudOLD(deviceID, macAddress, weekArray, devicetype, bridgeudn);

    },

    isCamDevice: function(type) {
        if (type == wemoNetCam.TYPE || type == wemoNetCam.REMOTE_TYPE || type == wemoLinkCam.TYPE || type == wemoLinkCam.REMOTE_TYPE || type == wemoNetCamHDv1.REMOTE_TYPE || type == wemoNetCamHDv2.REMOTE_TYPE || type.match(/NetCam/)) {
            return true;
        }

        return false;
    },
    checkMakerSensorState: function() {
        wemoUtil.infoLog(wemoUtil.TAG,"checkMakerSensorState()");
        var haveSensor = false;
        var makerArray = [];
        var deviceList = WeMoDeviceList.getArray();
        var deviceListSize = deviceList.length;
        wemoUtil.infoLog(wemoUtil.TAG,"checkMakerSensorState() :: deviceListSize--> " + deviceListSize);
        wemoUtil.infoLog(wemoUtil.TAG,"checkMakerSensorState() :: deviceList--> " + JSON.stringify(deviceList)); 
        for (var udn in deviceList) {
            wemoUtil.infoLog(wemoUtil.TAG,"checkMakerSensorState() :: udn--> " + udn);
            if (wemoUtil.isMakerDevice(udn)) {
                if (deviceList[udn].makerAttributeList != undefined) {
                    var sensorState = deviceList[udn].makerAttributeList.SensorPresent.value;
                    if (sensorState == 0) {
                        haveSensor = true;
                        makerArray.push(wemoUtil.getMakerSensorUDN(udn));
                        wemoUtil.infoLog(wemoUtil.TAG,"checkMakerSensorState() :: udn pushed:: makerArray--> " + makerArray);
                    }
                }
            }
        }
        wemoUtil.infoLog(wemoUtil.TAG,"checkMakerSensorState() :: final makerArray--> " + makerArray);
        return [haveSensor, makerArray];
    },

    checkEnabledRulesForMakerSensor: function(db, makerArray, callback) {
        wemoUtil.infoLog(wemoUtil.TAG,'checkEnabledRulesForMakerSensor() makerArray--> ' + makerArray.toString());

        var ids = wemoUtil.convertArrayToString(makerArray);

        wemoUtil.infoLog(wemoUtil.TAG,'checkEnabledRulesForMakerSensor() ids--> ' + ids);
        wemoUtil.getMakerDataFromDB(db, ids, function(ruleIDArray) {
            wemoUtil.infoLog(wemoUtil.TAG,'checkEnabledRulesForMakerSensor()  ruleIDArray ' + ruleIDArray);
            callback(ruleIDArray);
        });
        wemoUtil.infoLog(wemoUtil.TAG,'returning checkEnabledRulesForMakerSensor() ');
    },

    disableMakerRules: function(db, ruleIDs, callback) {
        wemoUtil.infoLog(wemoUtil.TAG,'disableMakerRules() ruleIDs--> ' + ruleIDs);
        var state = '0';
        //        	var db = window.sqlitePlugin.openDatabase(SQLColumns.DB_NAME, SQLColumns.DB_VERSION, SQLColumns.DB_NAME, 4500000);
        db.transaction(disableRules, getDataErrorCB, getDataSuccessCB);

        function disableRules(tx) {
            wemoUtil.infoLog(wemoUtil.TAG,'disableMakerRules() disableRules');
            tx.executeSql('UPDATE RULES SET State=? WHERE RuleID in (' + ruleIDs + ')', [state], getAllRules, errorInDisablingRules);
        }

        function getAllRules(tx) {
            wemoUtil.infoLog(wemoUtil.TAG,'disableMakerRules() getAllRules');
            tx.executeSql('SELECT distinct a.RuleID, a.Name, a.Type, a.State, b.StartTime, b.DayID, b.RuleDuration, b.StartTime, b.DeviceID, b.StartAction, b.EndAction, b.SensorDuration, b.Value, b.Level from RULES a inner join RULEDEVICES b on a.RuleID=CAST(b.RuleID AS CHAR) order by a.Name', [], querySuccess, errorInDisablingRules);
        }

        function querySuccess(tx, results) {
            wemoUtil.infoLog(wemoUtil.TAG,'disableMakerRules() querySuccess');
            var len = results.rows.length;
            var ruleRows = [];
            if (len > 0) {
                for (var i = 0; i < len; i++) {
                    ruleRows[i] = results.rows.item(i);
                    wemoUtil.infoLog(wemoUtil.TAG,'disableMakerRules() querySuccess--> State: ' + results.rows.item(i).State + ' RuleID: ' + results.rows.item(i).RuleID + ' Type: ' + results.rows.item(i).Type + ' UDN: ' + results.rows.item(i).DeviceID);
                }
            }
            window.sessionStorage.setItem(sessionStore.RULES_DATA, JSON.stringify(ruleRows));
        }

        function getDataErrorCB() {
            wemoUtil.infoLog(wemoUtil.TAG,'disableMakerRules() getDataErrorCB');
        }

        function getDataSuccessCB() {
            wemoUtil.infoLog(wemoUtil.TAG,'disableMakerRules() getDataSuccessCB');
            //
            callback("getDataSuccessCB");
        }

        function errorInDisablingRules() {
            wemoUtil.infoLog(wemoUtil.TAG,'disableMakerRules() errorInDisablingRules');
        }
    },

    getMakerDataFromDB: function(db, id, callback) {
        db.transaction(getData, getDataErrorCB, getDataSuccessCB);

        function getData(tx) {
            tx.executeSql('SELECT distinct A.RuleID FROM RULES A INNER JOIN RULEDEVICES B ON A.RuleID = B.RuleID Where A.State != 0 AND B.DeviceID IN  (' + id + ')', [],
                function(tx, results) {
                    var len = results.rows.length;
                    var idArray = [];
                    var ruleIDArray = [];
                    wemoUtil.infoLog(wemoUtil.TAG,'checkEnabledRulesForMakerSensor() Result rows length: ' + len);
                    if (len > 0) {
                        for (var i = 0; i < len; i++) {
                            ruleIDArray.push(results.rows.item(i).RuleID);
                            wemoUtil.infoLog(wemoUtil.TAG,'checkEnabledRulesForMakerSensor() enabledRulesArray--> ' + ruleIDArray);
                        }
                    }
                    callback(ruleIDArray);
                }, querySuccessCB);
        }

        function getDataErrorCB() {
            wemoUtil.infoLog(wemoUtil.TAG,'checkEnabledRulesForMakerSensor() getDataErrorCB');
        }

        function getDataSuccessCB() {
            wemoUtil.infoLog(wemoUtil.TAG,'checkEnabledRulesForMakerSensor() getDataSuccessCB');
        }

        function querySuccessCB() {
            wemoUtil.infoLog(wemoUtil.TAG,'checkEnabledRulesForMakerSensor() querySuccessCB');
        }
    },
    removeDiacriticChar: function(cityName) {

        var city = ((cityName).match('Ã£')) ? (cityName).replace('Ã£', 'a') : cityName;
        var city = ((city).match('±')) ? (city).replace('±', '') : city;
        var city = ((city).match('Ã')) ? (city).replace('Ã­', '') : city;
        var city = ((city).match('©')) ? (city).replace('©­', '') : city;
        var city = ((city).match('Ã©')) ? (city).replace('Ã©', '') : city;
        var city = ((city).match('Ã§')) ? (city).replace('Ã§', '') : city;
        var city = ((city).match('Ã¡')) ? (city).replace('Ã¡', '') : city;
        var city = ((city).match('Ã³')) ? (city).replace('Ã³', '') : city;
        var city = ((city).match('Ã£o')) ? (city).replace('Ã£o', '') : city;
        var city = ((city).match('Ãº')) ? (city).replace('Ãº', '') : city;
        var city = ((city).match('aÃa')) ? (city).replace('aÃa', '') : city;
        var city = ((city).match('oÃ£o')) ? (city).replace('oÃ£o', '') : city;
        var city = ((city).match('Ã«')) ? (city).replace('Ã«', '') : city;
        var city = ((city).match('aÃ')) ? (city).replace('aÃ', '') : city;
        var city = ((city).match('Ã¡')) ? (city).replace('Ã¡', '') : city;
        var city = ((city).match('Ãµ')) ? (city).replace('Ãµ', '') : city;
        var city = ((city).match('Ã¤')) ? (city).replace('Ã¤', '') : city;
        var city = ((city).match('Ã¢')) ? (city).replace('Ã¢', '') : city;
        var city = ((city).match('Ã´te')) ? (city).replace('Ã´te', '') : city;
        var city = ((city).match('Ã¶')) ? (city).replace('Ã¶', '') : city;
        var city = ((city).match('Ã‰')) ? (city).replace('Ã‰', '') : city;
        var city = ((city).match('Ã¼')) ? (city).replace('Ã¼', '') : city;
        var city = ((city).match('Ã¼r')) ? (city).replace('Ã¼r', '') : city;
        return city;
    },


    convertArrayToString: function(srcArray) {
        var tempString = "";
        for (var index = 0; index < srcArray.length; index++) {
            tempString += '"' + srcArray[index] + '"';
            if (index != (srcArray.length - 1)) {
                tempString += ',';
            }
        }
        return tempString;
    },
    
    currentEpochTime: function() {
        return Math.round(new Date().getTime()/1000.0);
    },
    
    ConvertToBase10Format: function(val) {
    	
    	return (val < 10) ? '0' + val.toString() : val.toString();
    },
    
    rearrangeCapabilityIDsValues : function(capabilityIDVal){
    	
    	var arrCapabilityVal = capabilityIDVal.split(",")
    	var temp = arrCapabilityVal[0];
    	arrCapabilityVal[0] = arrCapabilityVal[1];
    	arrCapabilityVal[1] = temp;
        return arrCapabilityVal.join();
    	
    },
    
    //Function to show loading spinner.
    progress: {
        show: function() {
            nativeUtilPlugin.execute(null, null, actions.SHOW_PROGRESS, []);
        },
        hide: function() {
            nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        }
    }

};

function trace() {
    var msg = '';

    for (var i = 0; i < arguments.length; i++) {
        if (typeof(arguments[i]) == 'object' || $.isArray(arguments[i]) === true) {
            msg += JSON.stringify(arguments[i]) + " ";
        } else {
            msg += arguments[i] + " ";
        }
    }

    wemoUtil.infoLog(wemoUtil.TAG,msg);
    return;
}


var sharedPreferences = {
    set: function(nameSpace, key, value) {
        sharedPreferencesPlugin.execute(
            null,
            null,
            "set", [
                nameSpace,
                key,
                value
            ]
        );
    },
    get: function(nameSpace, key, defValue, callback) {
        sharedPreferencesPlugin.execute(
            function(value) {
                if (callback != undefined) {
                    callback(value);
                }
            },
            null,
            "get", [
                nameSpace,
                key,
                defValue
            ]
        );
    }
};

var appRecoveryMechanism = {
		setData: function(array) {
			wemoUtil.infoLog(wemoUtil.TAG, 'appRecoveryMechanism ::  setData :: FLAG : ' + array[0] + "Counter :: " + array[1] + "Max Retry :: " + array[2]);
			sharedPreferences.set(sharedPreferencesConstants.APP_RECOVERY, sharedPreferencesConstants.APP_RECOVERY_CONSISTENT_FLAG, array[0]);
			sharedPreferences.set(sharedPreferencesConstants.APP_RECOVERY, sharedPreferencesConstants.APP_RECOVERY_COUNTER, array[1]);
			sharedPreferences.set(sharedPreferencesConstants.APP_RECOVERY, sharedPreferencesConstants.APP_RECOVERY_MAX_RETRY, array[2]);

		},
		getData: function(callback) {
			var array = [];
			sharedPreferences.get(sharedPreferencesConstants.APP_RECOVERY, sharedPreferencesConstants.APP_RECOVERY_CONSISTENT_FLAG, false, function(flag) {
				wemoUtil.infoLog(wemoUtil.TAG, 'appRecoveryMechanism ::  getData :: FLAG : ' + flag);
				array[0] = flag;

				sharedPreferences.get(sharedPreferencesConstants.APP_RECOVERY, sharedPreferencesConstants.APP_RECOVERY_COUNTER, 0, function(counter) {
					wemoUtil.infoLog(wemoUtil.TAG, 'appRecoveryMechanism ::  getData :: counter : ' + counter); 
					array[1] = counter;

					sharedPreferences.get(sharedPreferencesConstants.APP_RECOVERY, sharedPreferencesConstants.APP_RECOVERY_MAX_RETRY, 0, function(maxRetry) {
						wemoUtil.infoLog(wemoUtil.TAG, 'appRecoveryMechanism ::  getData :: maxRetry : ' + maxRetry); 
						array[2] = maxRetry;

						if (callback != undefined) {
							callback(array);
						}
					});
				});
			});
		}
};

/**
 *
 *  Base64 encode / decode
 *  http://www.webtoolkit.info/
 *
 **/
var Base64 = {

    // private property
    _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",

    // public method for encoding
    encode: function(input) {
        var output = "";
        var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
        var i = 0;

        input = Base64._utf8_encode(input);

        while (i < input.length) {

            chr1 = input.charCodeAt(i++);
            chr2 = input.charCodeAt(i++);
            chr3 = input.charCodeAt(i++);

            enc1 = chr1 >> 2;
            enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
            enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
            enc4 = chr3 & 63;

            if (isNaN(chr2)) {
                enc3 = enc4 = 64;
            } else if (isNaN(chr3)) {
                enc4 = 64;
            }

            output = output +
                this._keyStr.charAt(enc1) + this._keyStr.charAt(enc2) +
                this._keyStr.charAt(enc3) + this._keyStr.charAt(enc4);

        }

        return output;
    },

    // public method for decoding
    decode: function(input) {
        var output = "";
        var chr1, chr2, chr3;
        var enc1, enc2, enc3, enc4;
        var i = 0;

        input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");

        while (i < input.length) {

            enc1 = this._keyStr.indexOf(input.charAt(i++));
            enc2 = this._keyStr.indexOf(input.charAt(i++));
            enc3 = this._keyStr.indexOf(input.charAt(i++));
            enc4 = this._keyStr.indexOf(input.charAt(i++));

            chr1 = (enc1 << 2) | (enc2 >> 4);
            chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
            chr3 = ((enc3 & 3) << 6) | enc4;

            output = output + String.fromCharCode(chr1);

            if (enc3 != 64) {
                output = output + String.fromCharCode(chr2);
            }
            if (enc4 != 64) {
                output = output + String.fromCharCode(chr3);
            }

        }

        output = Base64._utf8_decode(output);

        return output;

    },

    // private method for UTF-8 encoding
    _utf8_encode: function(string) {
        string = string.replace(/\r\n/g, "\n");
        var utftext = "";

        for (var n = 0; n < string.length; n++) {

            var c = string.charCodeAt(n);

            if (c < 128) {
                utftext += String.fromCharCode(c);
            } else if ((c > 127) && (c < 2048)) {
                utftext += String.fromCharCode((c >> 6) | 192);
                utftext += String.fromCharCode((c & 63) | 128);
            } else {
                utftext += String.fromCharCode((c >> 12) | 224);
                utftext += String.fromCharCode(((c >> 6) & 63) | 128);
                utftext += String.fromCharCode((c & 63) | 128);
            }

        }

        return utftext;
    },

    // private method for UTF-8 decoding
    _utf8_decode: function(utftext) {
        var string = "";
        var i = 0;
        var c = c1 = c2 = 0;

        while (i < utftext.length) {

            c = utftext.charCodeAt(i);

            if (c < 128) {
                string += String.fromCharCode(c);
                i++;
            } else if ((c > 191) && (c < 224)) {
                c2 = utftext.charCodeAt(i + 1);
                string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
                i += 2;
            } else {
                c2 = utftext.charCodeAt(i + 1);
                c3 = utftext.charCodeAt(i + 2);
                string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
                i += 3;
            }

        }

        return string;
    }
};

var ismessageDisplayed = false,
    noNetworkRedirectPage = "none",
    disableRedirect = false,
    showNetworkReachabilityMsg = false,
    showMsgTime;


var networkConnection = {
    noNetworkThread : function(isNetworkenabled, networkType) {
        var networkState = 0;

        networkConnection.getRedirectPageURL();

        window.sessionStorage.setItem("isNetworkenabledKey", isNetworkenabled);
        window.sessionStorage.setItem("networkTypeKey", networkType);

        wemoUtil.infoLog(wemoUtil.TAG, "networkConnection ::"+isNetworkenabled+"---"+networkType);
        if (isNetworkenabled) {
            networkState = 5;
            wemoUtil.infoLog(wemoUtil.TAG, "networkConnection if ::"+isNetworkenabled+"---"+networkType);
        } else {
            if (networkType ===  networkConnect.TYPE_AirPlaneMode) {
                networkState = 1;
            } else if (networkType === networkConnect.TYPE_NotConnected) {
                networkState = 3;
            } else if (networkType === networkConnect.TYPE_NONE) {
                networkState = 0;
            }
            wemoUtil.infoLog(wemoUtil.TAG, "networkConnection1 else::"+noNetworkRedirectPage);
          if ((noNetworkRedirectPage === filePath.MORE_MENU) || (noNetworkRedirectPage === filePath.ENABLED_RULES) || (noNetworkRedirectPage === filePath.DEVICE_LIST)) {
              wemoUtil.loadUrl(noNetworkRedirectPage);
          }

        }
        if (!disableRedirect) {
        	wemoUtil.infoLog(wemoUtil.TAG, "disableRedirect ::"+disableRedirect+"---"+networkState);
            if (!showNetworkReachabilityMsg && (noNetworkRedirectPage === 'none')) {
                wemoUtil.loadUrl(filePath.INDEX);
            } else {
                networkConnection.showReachabilityMsg(networkState, 20);
            }
        }
    },

    getRedirectPageURL: function() {
    	wemoUtil.infoLog(wemoUtil.TAG, "getRedirectPageURL ");
        var url = (location.href.split("/www/")[1]).split("/");
        var parentPage = url[0];
        var pageName = ((parentPage === wemoPageNames.LED) ? url[2] : url[1]).replace('.html', '');
        wemoUtil.infoLog(wemoUtil.TAG, "getRedirectPageURL1 ::"+url+"---"+parentPage+"---"+pageName);

        //pages need to redirect to parent page
        var redirectRulesPages = ['countdown_timer_rule', 'create_rule', 'notify_message', 'notify_rule', 'rule_details', 'rule_name', 'sensors_rule', 'sensors_rule_when', 'timer_rule', 'timer_rule_when', 'when', 'when_countdown', 'when_notify'],
            redirectMenuPages = ['remote_access', 'more_settings', 'more_location', 'ifttt', 'firmware_upgrade','hardware_info', 'legal'],
            redirectToDeviceList = ['edit_device', 'reset_device', 'power_threshold_settings', 'auto_set_threshold', 'edit_cost_per', 'data_export'];


        //pages to show no network message
        var showMsgPages = ['device_list', 'enabled_rules', 'more_menu'];
//      	nativeUtilPlugin.execute(null, null, actions.HIDE_PROGRESS, []);
        
        if (parentPage === wemoPageNames.RULES) {
            if (redirectRulesPages.indexOf(pageName) !== -1) {
                noNetworkRedirectPage = filePath.ENABLED_RULES;
            }
        } else if (parentPage === wemoPageNames.MORE) {
            if (redirectMenuPages.indexOf(pageName) !== -1) {
            	window.sessionStorage.setItem(smartReachability.NO_NETWORK_MODE, stringBoolean.TRUE);
                noNetworkRedirectPage = filePath.MORE_MENU;
            }
            if (pageName.match(wemoPageNames.DEMOSETUP) || pageName.match(wemoPageNames.TELLUS)) {
                disableRedirect = true;
            }
        }else if(parentPage === wemoPageNames.LED){
        	var ledfromMoretab = window.sessionStorage.getItem(sessionStore.PAIRED_DEVICES);
        	var ledsetuppage = window.sessionStorage.getItem(sessionStore.REDIRECT_LED_SETUP_GLOBAL_PAGE);
        	
        	if (redirectToDeviceList.indexOf(pageName) !== -1) {
        		window.sessionStorage.setItem(smartReachability.NO_NETWORK_MODE, stringBoolean.TRUE);
                noNetworkRedirectPage = filePath.DEVICE_LIST;
            }

        	if (pageName === wemoPageNames.LEDSETUP) {
                disableRedirect = true;
            }

        	if(ledsetuppage != undefined && ledsetuppage != ""){
                disableRedirect = true;
        	}

        } else if(parentPage === wemoPageNames.DEVICE) {
            if (redirectToDeviceList.indexOf(pageName) !== -1) {
                noNetworkRedirectPage = filePath.DEVICE_LIST;
            }
        }

        if (showMsgPages.indexOf(pageName) !== -1) {
            showNetworkReachabilityMsg = true;
        }

        window.sessionStorage.setItem("noNetworkRedirectPageKey", noNetworkRedirectPage);
    },

    /**
     * show and hide reachability message
     *
     */
    showReachabilityMsg: function(state, time) {
        var message;
        showMsgTime = time;

        switch(state) {
            case 1:
                message = wemo.items["isAirplaneMode"];
                break;
            case 2:
                message = wemo.items["noRemoteAccessMode"];
                break;
            case 3:
                message = wemo.items["radiosOffMode"];
                break;
            case 4:
                message = wemo.items["noGatewayMode"];
                break;
            case 5: //when internet comes back
                $("#reachabilityMsgBox").removeClass("slideIn");
                clearTimeout(slideOutReachabilityMsg);
                var slideOutReachabilityMsg = setTimeout(function(){
                    $(".reachabilityMsgOverlay").detach();
                    $(".networkMsgContainer").removeClass("preventScrolling")
                        .trigger("networkOn");
                    $(".headerBtns").show();
                    $(".reachabilityIcon").hide();
                }, 400);
                ismessageDisplayed = false;
                break;

            default:
                message = wemo.items["radiosOffMode"];
                break;
        }

        if (!ismessageDisplayed && (state !== 5)) {
            var reachabilityMsgBox = '<div class="reachabilityMsgOverlay"><div id="reachabilityMsgBox"><p class="reachabilityMsg"><span>'+ message + '</span></p><div class="closeBtn"></div></div></div>';
            var windowHeight = $(window).height();
            var headerHeight = $("[data-role='header']").height();
            var footerHeight = $("[data-role='footer']").height();


            var $networkMsgContainer = $(".networkMsgContainer");
            $networkMsgContainer.append(reachabilityMsgBox);

            var $reachabilityMsgOverlay =  $(".reachabilityMsgOverlay");

            if (state === 2) {
                $reachabilityMsgOverlay.addClass("hidebg");
            } else {
                $networkMsgContainer.height(windowHeight-headerHeight-footerHeight)
                    .addClass("preventScrolling")
                    .trigger("networkOFF");
                $reachabilityMsgOverlay.removeClass("hidebg");

                window.sessionStorage.setItem("noWifiPageMsg", message);
            }

            clearTimeout(slideInReachabilityMsg);
            var slideInReachabilityMsg = setTimeout(function(){
                $("#reachabilityMsgBox").addClass("slideIn");
                $(".headerBtns").hide();

                if (state === 2) {
                    $(".headerBtns.more_tab_icon").show();
                }
                $(".reachabilityIcon").show();
            }, showMsgTime);

            networkConnection.reachabilityBoxControl();
            if (state !== 2) {
                ismessageDisplayed = true;
            }

        }
    },


    reachabilityBoxControl: function() {
        var $reachabilityMsg = $("#reachabilityMsgBox");

        $reachabilityMsg.on("click", function(){
            $(this).removeClass("slideIn");
        });

        $(".reachabilityIcon").on("click", function(){
            $reachabilityMsg.toggleClass("slideIn");
        });
    },

    initializeNetworkMsg: function() {
        var noNetworkRedirectPageKey = window.sessionStorage.getItem("noNetworkRedirectPageKey");
        var isNetworkenabledKey = window.sessionStorage.getItem("isNetworkenabledKey");
        var networkTypeKey = window.sessionStorage.getItem("networkTypeKey");

        if (noNetworkRedirectPageKey === filePath.MORE_MENU || noNetworkRedirectPageKey === filePath.ENABLED_RULES || noNetworkRedirectPageKey === filePath.DEVICE_LIST) {
            var showMsg = setTimeout(function() {
                clearTimeout(showMsg);
                networkConnection.noNetworkThreadSimplify(isNetworkenabledKey, networkTypeKey);
            }, 700);
        }
        else if (isNetworkenabledKey === "false") {
            var showMsg = setTimeout(function() {
                clearTimeout(showMsg);
                networkConnection.noNetworkThreadSimplify(isNetworkenabledKey, networkTypeKey);
            }, 300);
        }
    },

    noNetworkThreadSimplify: function(isNetworkenabled, networkType) {
        var networkState = 0;
        if (isNetworkenabled !== "false") {
            networkState = 5;
        } else {
            if (networkType ===  networkConnect.TYPE_AirPlaneMode) {
                networkState = 1;
            } else if (networkType === networkConnect.TYPE_NotConnected) {
                networkState = 3;
            } else if (networkType === networkConnect.TYPE_NONE) {
                networkState = 0;
            }
        }
        networkConnection.showReachabilityMsg(networkState, 20);

    },

    initializeRemoteModeMsg: function() {
        var networkState = 2;
        networkConnection.showReachabilityMsg(networkState, 800);
    },

    showNetworkStatus: function (isNetworkenabled, networkType) {
    	wemoUtil.infoLog(wemoUtil.TAG, "showNetworkStatus :: isNetworkenabled " + isNetworkenabled + " :: networkType :: " + networkType );
        if (!isNetworkenabled) {
            var networkState;
            switch (networkType) {
                case networkConnect.TYPE_AirPlaneMode:
                    networkState = wemo.items["isAirplaneMode"];
                    break;

                case networkConnect.TYPE_NotConnected:
                    networkState = wemo.items["radiosOffMode"]
                    break;

                case networkConnect.TYPE_NONE:
                    networkState = wemo.items["radiosOffMode"];
                    break;
            }

            if (networkState) {
                window.sessionStorage.setItem("noWifiPageMsg", networkState);
            }
           
			wemoUtil.loadUrl(filePath.NO_NETWORK);
        }
    }
    
};

var networkPlugin = {
    onNetworkChanged : function(isNetworkenabled, networkType) {
        networkConnection.noNetworkThread(isNetworkenabled, networkType);
    }
};

var smartDevicePlugin = {
    onDeviceUpdated : function(str) {
        wemoUtil.infoLog(TAG, "onDeviceUpdated is called in wemo_android.");
    },
    onStatusChange : function(str) {
        wemoUtil.infoLog(TAG, "onStatusChange is called in wemo_android.");
    },
    onStatusChanged : function(str) {
        wemoUtil.infoLog(TAG, "onStatusChanged is called in wemo_android.");
    },
    onGetZigbeeStatusDone : function(str) {
        wemoUtil.infoLog(TAG, "onGetZigbeeStatusDone is called in wemo_android.");
    }
};

/**
 * Sensor Change Notification
 *
 */

var sensorEvents = {
	sensorChangeEvent : function(result) {
	  var message = JSON.parse(result); 
	  var url = (location.href.split("/www/")[1]).split("/");
	  var parentPage = url[0];
	  var subpage = url[1];
	  var groupdeviceslist = window.sessionStorage.getItem(sessionStore.LED_GROUP_DEVICE_IDS);
	  wemoUtil.infoLog(wemoUtil.TAG, "events ::"+url+"----"+parentPage+"----"+subpage+"---"+message+"---"+groupdeviceslist);
	
	  if (message.notifyType == notificationType.HOMESENSE_CHANGE_STATE) {
	  		var deviceID = message.subDeviceID;
            var capabilityID = message.capabilityId;
            var availability = message.Availability;
            var timestamp = message.statusTS;
            var state = parseInt(message.state) % 10;
            var devicetype = "";

            var rgx = /[^0-9]/;

            if (deviceID.search(rgx) === -1) {
                devicetype = ledDeviceConstants.GROUP;
            } else {
                devicetype = ledDeviceConstants.SINGLE;
            }
            
            if (jQuery.inArray(deviceID, groupdeviceslist) == -1 || groupdeviceslist == null){
            	if (capabilityID == homeSenseCapabilities.ONOFF) {
            		if(url[2] == wemoPageNames.HOMESENSESETUP || url.indexOf(wemoPageNames.HOMESENSE_SETUP) != -1){
            			if(state == statusCode.OFF){
            				$("#parentDiv"+deviceID).removeClass('door-Closed').addClass('door-Open');
            			}else{
            				$("#parentDiv"+deviceID).removeClass('door-Open').addClass('door-Closed');
            			}
            		}else if(subpage == wemoPageNames.DEVICEHTML || url.indexOf(wemoPageNames.DEVICE) != -1){
            		 	var modelcode = $("#" + deviceID).attr('wemo-device-modelcode').toUpperCase();
            			 if(modelcode == homeSenseModelCodes.PIR){
            				if(state == statusCode.ON){
            					var timeinAMPM = wemoUtil.getMotionSenseTimeMsg(new Date(parseInt(timestamp,10) * 1000));
        						$("#mainLIID" + deviceID).find('.sliderValue').text(timeinAMPM);
                            	$("#mainLIID" + deviceID).find('.sliderValue').addClass('LedBrihtnesscolorChange');
            				}else{
            					var timeinAMPM = wemoUtil.getMotionSenseTimeMsg(new Date(parseInt(timestamp,10) * 1000));
        						$("#mainLIID" + deviceID).find('.sliderValue').text(timeinAMPM);
            			     	$("#mainLIID" + deviceID).find('.sliderValue').removeClass('LedBrihtnesscolorChange');
                			}
            				
                     	}
	        			if(modelcode == homeSenseModelCodes.ALARM){
	         				if(state == statusCode.ON){
	         					$("#" + deviceID).addClass('alarmDetectedIcon');
	                 			$("#mainLIID" + dev).find('.sliderValue').text(wemo.items['AlarmDeviceActiveStatus']);
	                 			$("#mainLIID" + dev).find('.sliderValue').addClass("alarmDetectedTxtColor");
	                 			$("#" + deviceID).attr('wemo-device-state-code', statusCode.ON);
	         				}else{
	         					$("#" + deviceID).removeClass('alarmDetectedIcon');
	                 			$("#mainLIID" + deviceID).find('.sliderValue').val(wemo.items['AlarmDeviceInActiveStatus']);
	                 			$("#mainLIID" + deviceID).find('.sliderValue').removeClass(".alarmDetectedTxtColor");
	                 			$("#" + deviceID).attr('wemo-device-state-code', statusCode.OFF);
	         				}
	         				
	         			}
	        			if(modelcode == homeSenseModelCodes.KEYFOB){
            				if(state == statusCode.ON){
        						var timeinAMPM = wemoUtil.getMotionSenseTimeMsg(new Date(parseInt(timestamp) * 1000));
        						$("#mainLIID" + deviceID).find('.sliderValue').text(timeinAMPM);
        						$("#" + deviceID).removeClass('fobAwayIcon');
        						$("#" + deviceID).addClass('fobIcon');
        						$("#" + deviceID).attr('wemo-device-state-code', statusCode.ON);
            				}else{
            					var timeinAMPM = wemoUtil.getMotionSenseTimeMsg(new Date(parseInt(timestamp) * 1000));
        						$("#mainLIID" + deviceID).find('.sliderValue').text(timeinAMPM);
            					$("#" + deviceID).removeClass('fobIcon');
                            	$("#" + deviceID).addClass('fobAwayIcon');
                            	$("#" + deviceID).attr('wemo-device-state-code', statusCode.OFF);
            				}
            				
                     	}
            		}
                    

                }else if (capabilityID == homeSenseCapabilities.SENSORENABLEDISABLE) {
                	if(subpage == wemoPageNames.DEVICEHTML || url.indexOf(wemoPageNames.DEVICE) != -1){
                		if(modelcode == homeSenseModelCodes.DOORWINDOWS || modelcode == homeSenseModelCodes.PIR){
            				if(state == statusCode.ON){
            					$("#" + deviceID).removeClass('homesense_off');
            			    	$("#" + deviceID).addClass('homesense_on');
            			    	$("#" + deviceID).attr('wemo-device-state-code', statusCode.ON);
            				}else{
            					$("#" + deviceID).removeClass('homesense_on');
            					$("#" + deviceID).addClass('homesense_off');
            					$("#" + deviceID).attr('wemo-device-state-code', statusCode.OFF);
            				}
            				
                     	}
            		}

                } 
            }else{
            	if(url[2] == wemoPageNames.HOMESENSESETUP || url.indexOf(wemoPageNames.HOMESENSE_SETUP) != -1){
            		if(state == statusCode.OFF){
        				$("#parentDiv"+deviceID).removeClass('door-Closed').addClass('door-Open');
        			}else{
        				$("#parentDiv"+deviceID).removeClass('door-Open').addClass('door-Closed');
        			}
            	}
            }

	  	}
	  
	}
};

/**
 * A class made to handle device information and provide processed data like friendly-name based on brand
 * Usage: 
 *   var appliance = new Appliance();
 *   appliance.setUDN( window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN) );
 *   appliance.getUDN();
 *   appliance.getDefaultFriendlyName();
 */

var Appliance = function () {
    var self = this,
        udn, type, serial, record, recordKey, brand, label, icon, iconUrl;
    var _constructor = function () {}();
    var isEmpty = function (s) {
        return (s == undefined || s == null || s == '');
    };
    this.setUDN = function (iUdn) {
        udn = iUdn;
    };
    this.getUDN = function () {
        if(isEmpty(udn)) {
            udn = window.sessionStorage.getItem(sessionStore.DEVICE_EDIT_WEMO_UDN); //uuid:Humidifier-1_0-221409S0000070
        }
        return udn;
    };
    this.getType = function () {
        if(isEmpty(type)) {
            udn = self.getUDN();
            type = udn.substring(udn.indexOf(':') + 1, udn.indexOf('-'));
        }
        return type;
    };
    this.setSerial = function (iSerial) {
        serial = iSerial;
    };
    this.getSerial = function () {
        if(isEmpty(serial)) {
            udn = self.getUDN();
            serial = udn.substr(udn.lastIndexOf('-') + 1, udn.length);
        }
        return serial;
    };
    this.getRecordKey = function () {
        if(isEmpty(recordKey)) {
            serial = self.getSerial();
            recordKey = localStorageKeys.RECORDS_PREFIX_SMART_DEVICES + serial; // records.websql://wemoSmartDevices:221409S0000070
        } 
        return recordKey;
    };
    this.getRecordKeys = function () {
        var recordKeys = window.localStorage.getItem(localStorageKeys.RECORDS_INDEX);
        return (typeof (recordKeys) == 'string') ? JSON.parse(recordKeys) : recordKeys;
    };
    this.hasRecordKey = function (iRecordKey) {
        var recordKeys = self.getRecordKeys();
        var isRecordKeyExist = (!wemoUtil.isEmpty(recordKeys) && recordKeys.length > 0 && recordKeys.indexOf(iRecordKey) > -1) ? true : false;
        return isRecordKeyExist;
    };
    this.getRecord = function () {
        if(isEmpty(record)) {
            recordKey = self.getRecordKey();
            var data = window.localStorage.getItem(recordKey);
            return (typeof (data) == 'string') ? JSON.parse(data) : data;
        } 
        return record;
    };
    this.setRecord = function (data) {
        var dataStr = (typeof (data) == 'string') ? data : JSON.stringify(data);
        window.localStorage.setItem(recordKey, dataStr);
    };
    this.getBrand = function () {
        if(isEmpty(brand)) {
            record = self.getRecord();
            brand = ((isRemoteEnabled) ? record.BrandName : record.brandName);
        }
        return brand;
    };
    this.getIconUrl = function () {
        if(isEmpty(iconUrl)) {
            record = self.getRecord();
            iconUrl = record.iconUrl;
        }
        return iconUrl;
    };
    this.getDefaultIcon = function () {
        if(isEmpty(icon) && SmartAppliances[type.toUpperCase()]  && (typeof SmartAppliances[type.toUpperCase()] != "undefined")) {
            type = self.getType();
            icon = SmartAppliances[type.toUpperCase()].icon;
        }
        return icon;
    };
    this.getDefaultFriendlyName = function (customFriendlyName) {
	var lang = window.localStorage.getItem("DEVICE_LANG");
	var lang_flag = (['fr_FR', 'fr_CA'].indexOf(lang) > -1) ? true : false; 
        if(isEmpty(label)) {
            type = self.getType();
            switch (type.toLowerCase()) {
                case SmartAppliances.CROCKPOT.key:
                    label = wemo.items['CrockPot'];
                    break;
                case SmartAppliances.COFFEEMAKER.key:
                    label = wemo.items['MrCoffee'];
                    break;
                case SmartAppliances.HEATERA.key:
                case SmartAppliances.HEATERB.key:
                case SmartAppliances.HUMIDIFIER.key:
                case SmartAppliances.HUMIDIFIERB.key:
                case SmartAppliances.AIRPURIFIER.key:
                    brand = self.getBrand();
                    brand = lang_flag ? brand + "_reset" : brand;
                    label = (!isEmpty(brand)) ? wemo.items[brand] : wemo.items['Holmes'];
                    break;
                default:
                    label = '';
            }
            if (!isEmpty(customFriendlyName)){
        	label = lang_flag ? wemo.items[customFriendlyName] + label : label + wemo.items[customFriendlyName];
            } else {
        	if (SmartAppliances[type.toUpperCase()] && (typeof SmartAppliances[type.toUpperCase()] != "undefined")){
        	    label = lang_flag ? wemo.items[SmartAppliances[type.toUpperCase()].locale] + label : label + wemo.items[SmartAppliances[type.toUpperCase()].locale];
        	}
            }
        }
        return label;
    };
};

var ApplicanceInfoFetcher = function(){
    var self = this, 
        appliance, serial, storage, record, recordKey, brand, iconUrl;
    
    var _constructor = function() {
        appliance = new Appliance();
    }();
    var courier = {
        url: "",
        method: "GET",
        dataType: "xml",
        success: function(xml) {
            var serialNumber = $(xml).find('serialNumber').text();
            var brandName = $(xml).find('brandName').text();
            updateBrands(serialNumber, brandName);
            setBrandName(serialNumber, brandName);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            wemoUtil.infoLog(TAG, 'ApplicanceInfoFetcher: on-failure:' + textStatus);
        }
    };
    var updateBrands = function(iSerial, iBrand){
        var brands = window.localStorage.getItem(localStorageKeys.APPLIANCE_BRANDS);
        brands = (brands == undefined) ? {} : ((typeof brands == 'string') ? JSON.parse(brands) : brands);
        brands[iSerial] = iBrand;
        window.localStorage.setItem(localStorageKeys.APPLIANCE_BRANDS, JSON.stringify(brands));
    };
    var setBrandName = function(iSerial, iBrand) {
        appliance.setSerial(iSerial);
        recordKey = appliance.getRecordKey();
        if(appliance.hasRecordKey(recordKey)) {
            if(appliance.getBrand() == undefined) {
                record = appliance.getRecord();
                brand = record.BrandName = record.brandName = iBrand;
                appliance.setRecord(record);
            }
        }
    }; 
    this.getBrandName = function(){
        return (brand == undefined) ? appliance.getBrand() : brand;
    };   
    this.getStoragePathFromIconUrl = function(s) {
        var base = s.substring(0, s.indexOf('/logo/')); 
        return base;
    };
    this.getSerialFromIconUrl = function(s) {
        var base = self.getStoragePathFromIconUrl(s); 
        var rest = s.substr(base.length, s.length);
        var serial = rest.split(' ')[1];
        return serial;
    };
    this.initialize = function (imgUrl) {
        wemoUtil.infoLog(TAG, 'ApplicanceInfoFetcher: initialize');
        iconUrl = imgUrl;
        storage = self.getStoragePathFromIconUrl(iconUrl);
        serial = self.getSerialFromIconUrl(iconUrl);
        courier.url = wemoUtil.templator.fitIn('file://[0]/files/[1] [2].xml', [
            storage, serial, storedFileTypes.SETUP
        ]);
        $.ajax(courier);
    };
};


