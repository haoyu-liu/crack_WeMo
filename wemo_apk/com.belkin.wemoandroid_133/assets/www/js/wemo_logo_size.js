 $(document).bind('pageinit', function () {

    var vmin = wemoUtil.getScreenVmin();
    var w = wemoUtil.getScreenWidth();
    var h = wemoUtil.getScreenHeight();

    //$('body').css('font-size', 0.05 * vmin);
    //$('.main_header').css('height', 0.10 * h);

    $('.wemo_logo').css('background-size', 0.3 * w);
    $('.wemo_logo').css('width', Math.round(0.35 * w));

   // $('.more_tab_icon').css('height', 0.11 * vmin);
   // $('.refresh_icon').css('height', 0.11 * vmin);
	
	//alert("screen.width "+screen.width+" w "+w);
});
