
var wemo = wemo || {};

/********Defaults lang items: *********/
wemo.items = new English();
var lang = window.localStorage.getItem("DEVICE_LANG");
switch(lang)
{
	case 'fr-FR':
    case 'fr-CA':
	case 'fr_FR':
	case 'fr_CA':
			 var fr = new French();	
			 $.extend(wemo.items, fr);/*{ French}*/
			  break;
	case 'zh-CN':
	case 'zh_CN':
			var zh = new Chinese();
			$.extend(wemo.items, zh);/*{ Chinese}*/
		 	break;
	case 'de-DE':
	case 'de_DE':
			var de = new German();
			$.extend(wemo.items, de);/*{ German }*/
		 	break;
	case 'es-US':
	case 'es_US':
			var es = new Spanish();
			$.extend(wemo.items, es);/*{ English US }*/
		 	break;	
	case 'es-ES':
	case 'es_ES':
			var es = new Spanish();
			$.extend(wemo.items, es);/*{ Spanish }*/
		 	break;
	case 'ru-RU':
	case 'ru_RU':
			var ru = new Russian();
			$.extend(wemo.items, ru);/*{ Russian }*/
		 	break;
	case 'ja-JP':
	case 'ja_JP':
		var ja = new Japanese();
		$.extend(wemo.items, ja);/*{ Japanese }*/
		break;
	case 'ko-KR':
	case 'ko_KR':
		var ko = new Korean();
		$.extend(wemo.items, ko);/*{ Korean }*/
		break;
	case 'it-IT':
	case 'it_IT':
		var it = new Italian();
		$.extend(wemo.items, it);/*{ Italian }*/
		break;
}
