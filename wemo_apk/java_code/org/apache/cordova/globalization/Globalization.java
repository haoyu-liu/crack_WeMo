package org.apache.cordova.globalization;

import android.annotation.TargetApi;
import android.os.Build.VERSION;
import android.text.format.Time;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Currency;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TimeZone;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Globalization
  extends CordovaPlugin
{
  public static final String CURRENCY = "currency";
  public static final String CURRENCYCODE = "currencyCode";
  public static final String DATE = "date";
  public static final String DATESTRING = "dateString";
  public static final String DATETOSTRING = "dateToString";
  public static final String DAYS = "days";
  public static final String FORMATLENGTH = "formatLength";
  public static final String FULL = "full";
  public static final String GETCURRENCYPATTERN = "getCurrencyPattern";
  public static final String GETDATENAMES = "getDateNames";
  public static final String GETDATEPATTERN = "getDatePattern";
  public static final String GETFIRSTDAYOFWEEK = "getFirstDayOfWeek";
  public static final String GETLOCALENAME = "getLocaleName";
  public static final String GETNUMBERPATTERN = "getNumberPattern";
  public static final String GETPREFERREDLANGUAGE = "getPreferredLanguage";
  public static final String ISDAYLIGHTSAVINGSTIME = "isDayLightSavingsTime";
  public static final String ITEM = "item";
  public static final String LONG = "long";
  public static final String MEDIUM = "medium";
  public static final String MONTHS = "months";
  public static final String NARROW = "narrow";
  public static final String NUMBER = "number";
  public static final String NUMBERSTRING = "numberString";
  public static final String NUMBERTOSTRING = "numberToString";
  public static final String OPTIONS = "options";
  public static final String PERCENT = "percent";
  public static final String SELECTOR = "selector";
  public static final String STRINGTODATE = "stringToDate";
  public static final String STRINGTONUMBER = "stringToNumber";
  public static final String TIME = "time";
  public static final String TYPE = "type";
  public static final String WIDE = "wide";
  
  private JSONObject getCurrencyPattern(JSONArray paramJSONArray)
    throws GlobalizationError
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      String str = paramJSONArray.getJSONObject(0).getString("currencyCode");
      DecimalFormat localDecimalFormat = (DecimalFormat)DecimalFormat.getCurrencyInstance(Locale.getDefault());
      Currency localCurrency = Currency.getInstance(str);
      localDecimalFormat.setCurrency(localCurrency);
      localJSONObject.put("pattern", localDecimalFormat.toPattern());
      localJSONObject.put("code", localCurrency.getCurrencyCode());
      localJSONObject.put("fraction", localDecimalFormat.getMinimumFractionDigits());
      localJSONObject.put("rounding", Integer.valueOf(0));
      localJSONObject.put("decimal", String.valueOf(localDecimalFormat.getDecimalFormatSymbols().getDecimalSeparator()));
      localJSONObject.put("grouping", String.valueOf(localDecimalFormat.getDecimalFormatSymbols().getGroupingSeparator()));
      return localJSONObject;
    }
    catch (Exception localException)
    {
      throw new GlobalizationError("FORMATTING_ERROR");
    }
  }
  
  @TargetApi(9)
  private JSONObject getDateNames(JSONArray paramJSONArray)
    throws GlobalizationError
  {
    JSONObject localJSONObject1 = new JSONObject();
    JSONArray localJSONArray = new JSONArray();
    ArrayList localArrayList = new ArrayList();
    final Map localMap;
    for (;;)
    {
      int m;
      try
      {
        int i = paramJSONArray.getJSONObject(0).length();
        int j = 0;
        int k = 0;
        if (i > 0)
        {
          boolean bool1 = ((JSONObject)paramJSONArray.getJSONObject(0).get("options")).isNull("type");
          k = 0;
          if (!bool1)
          {
            boolean bool2 = ((String)((JSONObject)paramJSONArray.getJSONObject(0).get("options")).get("type")).equalsIgnoreCase("narrow");
            k = 0;
            if (bool2) {
              k = 0 + 1;
            }
          }
          boolean bool3 = ((JSONObject)paramJSONArray.getJSONObject(0).get("options")).isNull("item");
          j = 0;
          if (!bool3)
          {
            boolean bool4 = ((String)((JSONObject)paramJSONArray.getJSONObject(0).get("options")).get("item")).equalsIgnoreCase("days");
            j = 0;
            if (bool4) {
              j = 0 + 10;
            }
          }
        }
        m = j + k;
        if (m == 1)
        {
          localMap = Calendar.getInstance().getDisplayNames(2, 1, Locale.getDefault());
          Iterator localIterator = localMap.keySet().iterator();
          if (!localIterator.hasNext()) {
            break;
          }
          localArrayList.add((String)localIterator.next());
          continue;
        }
        if (m != 10) {
          break label293;
        }
      }
      catch (Exception localException)
      {
        throw new GlobalizationError("UNKNOWN_ERROR");
      }
      localMap = Calendar.getInstance().getDisplayNames(7, 2, Locale.getDefault());
      continue;
      label293:
      if (m == 11) {
        localMap = Calendar.getInstance().getDisplayNames(7, 1, Locale.getDefault());
      } else {
        localMap = Calendar.getInstance().getDisplayNames(2, 2, Locale.getDefault());
      }
    }
    Collections.sort(localArrayList, new Comparator()
    {
      public int compare(String paramAnonymousString1, String paramAnonymousString2)
      {
        return ((Integer)localMap.get(paramAnonymousString1)).compareTo((Integer)localMap.get(paramAnonymousString2));
      }
    });
    for (int n = 0; n < localArrayList.size(); n++) {
      localJSONArray.put(localArrayList.get(n));
    }
    JSONObject localJSONObject2 = localJSONObject1.put("value", localJSONArray);
    return localJSONObject2;
  }
  
  /* Error */
  private JSONObject getDatePattern(JSONArray paramJSONArray)
    throws GlobalizationError
  {
    // Byte code:
    //   0: new 112	org/json/JSONObject
    //   3: dup
    //   4: invokespecial 113	org/json/JSONObject:<init>	()V
    //   7: astore_2
    //   8: aload_0
    //   9: getfield 289	org/apache/cordova/globalization/Globalization:cordova	Lorg/apache/cordova/CordovaInterface;
    //   12: invokeinterface 295 1 0
    //   17: invokestatic 301	android/text/format/DateFormat:getDateFormat	(Landroid/content/Context;)Ljava/text/DateFormat;
    //   20: checkcast 303	java/text/SimpleDateFormat
    //   23: astore 4
    //   25: aload_0
    //   26: getfield 289	org/apache/cordova/globalization/Globalization:cordova	Lorg/apache/cordova/CordovaInterface;
    //   29: invokeinterface 295 1 0
    //   34: invokestatic 306	android/text/format/DateFormat:getTimeFormat	(Landroid/content/Context;)Ljava/text/DateFormat;
    //   37: checkcast 303	java/text/SimpleDateFormat
    //   40: astore 5
    //   42: new 308	java/lang/StringBuilder
    //   45: dup
    //   46: invokespecial 309	java/lang/StringBuilder:<init>	()V
    //   49: aload 4
    //   51: invokevirtual 312	java/text/SimpleDateFormat:toLocalizedPattern	()Ljava/lang/String;
    //   54: invokevirtual 316	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   57: ldc_w 318
    //   60: invokevirtual 316	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   63: aload 5
    //   65: invokevirtual 312	java/text/SimpleDateFormat:toLocalizedPattern	()Ljava/lang/String;
    //   68: invokevirtual 316	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   71: invokevirtual 321	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   74: astore 6
    //   76: aload_1
    //   77: iconst_0
    //   78: invokevirtual 119	org/json/JSONArray:getJSONObject	(I)Lorg/json/JSONObject;
    //   81: ldc 80
    //   83: invokevirtual 324	org/json/JSONObject:has	(Ljava/lang/String;)Z
    //   86: ifeq +131 -> 217
    //   89: aload_1
    //   90: iconst_0
    //   91: invokevirtual 119	org/json/JSONArray:getJSONObject	(I)Lorg/json/JSONObject;
    //   94: ldc 80
    //   96: invokevirtual 327	org/json/JSONObject:getJSONObject	(Ljava/lang/String;)Lorg/json/JSONObject;
    //   99: astore 12
    //   101: aload 12
    //   103: ldc 26
    //   105: invokevirtual 222	org/json/JSONObject:isNull	(Ljava/lang/String;)Z
    //   108: ifne +39 -> 147
    //   111: aload 12
    //   113: ldc 26
    //   115: invokevirtual 123	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   118: astore 15
    //   120: aload 15
    //   122: ldc 62
    //   124: invokevirtual 225	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   127: ifeq +168 -> 295
    //   130: aload_0
    //   131: getfield 289	org/apache/cordova/globalization/Globalization:cordova	Lorg/apache/cordova/CordovaInterface;
    //   134: invokeinterface 295 1 0
    //   139: invokestatic 330	android/text/format/DateFormat:getMediumDateFormat	(Landroid/content/Context;)Ljava/text/DateFormat;
    //   142: checkcast 303	java/text/SimpleDateFormat
    //   145: astore 4
    //   147: new 308	java/lang/StringBuilder
    //   150: dup
    //   151: invokespecial 309	java/lang/StringBuilder:<init>	()V
    //   154: aload 4
    //   156: invokevirtual 312	java/text/SimpleDateFormat:toLocalizedPattern	()Ljava/lang/String;
    //   159: invokevirtual 316	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   162: ldc_w 318
    //   165: invokevirtual 316	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   168: aload 5
    //   170: invokevirtual 312	java/text/SimpleDateFormat:toLocalizedPattern	()Ljava/lang/String;
    //   173: invokevirtual 316	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   176: invokevirtual 321	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   179: astore 6
    //   181: aload 12
    //   183: ldc 86
    //   185: invokevirtual 222	org/json/JSONObject:isNull	(Ljava/lang/String;)Z
    //   188: ifne +29 -> 217
    //   191: aload 12
    //   193: ldc 86
    //   195: invokevirtual 123	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   198: astore 13
    //   200: aload 13
    //   202: ldc 14
    //   204: invokevirtual 225	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   207: ifeq +128 -> 335
    //   210: aload 4
    //   212: invokevirtual 312	java/text/SimpleDateFormat:toLocalizedPattern	()Ljava/lang/String;
    //   215: astore 6
    //   217: invokestatic 335	android/text/format/Time:getCurrentTimezone	()Ljava/lang/String;
    //   220: invokestatic 341	java/util/TimeZone:getTimeZone	(Ljava/lang/String;)Ljava/util/TimeZone;
    //   223: astore 7
    //   225: aload_2
    //   226: ldc -109
    //   228: aload 6
    //   230: invokevirtual 155	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   233: pop
    //   234: aload_2
    //   235: ldc_w 343
    //   238: aload 7
    //   240: aload 7
    //   242: invokestatic 230	java/util/Calendar:getInstance	()Ljava/util/Calendar;
    //   245: invokevirtual 347	java/util/Calendar:getTime	()Ljava/util/Date;
    //   248: invokevirtual 351	java/util/TimeZone:inDaylightTime	(Ljava/util/Date;)Z
    //   251: iconst_0
    //   252: invokevirtual 355	java/util/TimeZone:getDisplayName	(ZI)Ljava/lang/String;
    //   255: invokevirtual 155	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   258: pop
    //   259: aload_2
    //   260: ldc_w 357
    //   263: aload 7
    //   265: invokevirtual 360	java/util/TimeZone:getRawOffset	()I
    //   268: sipush 1000
    //   271: idiv
    //   272: invokevirtual 169	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   275: pop
    //   276: aload_2
    //   277: ldc_w 362
    //   280: aload 7
    //   282: invokevirtual 365	java/util/TimeZone:getDSTSavings	()I
    //   285: sipush 1000
    //   288: idiv
    //   289: invokevirtual 169	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   292: pop
    //   293: aload_2
    //   294: areturn
    //   295: aload 15
    //   297: ldc 59
    //   299: invokevirtual 225	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   302: ifne +13 -> 315
    //   305: aload 15
    //   307: ldc 29
    //   309: invokevirtual 225	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   312: ifeq -165 -> 147
    //   315: aload_0
    //   316: getfield 289	org/apache/cordova/globalization/Globalization:cordova	Lorg/apache/cordova/CordovaInterface;
    //   319: invokeinterface 295 1 0
    //   324: invokestatic 368	android/text/format/DateFormat:getLongDateFormat	(Landroid/content/Context;)Ljava/text/DateFormat;
    //   327: checkcast 303	java/text/SimpleDateFormat
    //   330: astore 4
    //   332: goto -185 -> 147
    //   335: aload 13
    //   337: ldc 95
    //   339: invokevirtual 225	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   342: ifeq -125 -> 217
    //   345: aload 5
    //   347: invokevirtual 312	java/text/SimpleDateFormat:toLocalizedPattern	()Ljava/lang/String;
    //   350: astore 14
    //   352: aload 14
    //   354: astore 6
    //   356: goto -139 -> 217
    //   359: astore_3
    //   360: new 108	org/apache/cordova/globalization/GlobalizationError
    //   363: dup
    //   364: ldc_w 370
    //   367: invokespecial 204	org/apache/cordova/globalization/GlobalizationError:<init>	(Ljava/lang/String;)V
    //   370: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	371	0	this	Globalization
    //   0	371	1	paramJSONArray	JSONArray
    //   7	287	2	localJSONObject1	JSONObject
    //   359	1	3	localException	Exception
    //   23	308	4	localSimpleDateFormat1	SimpleDateFormat
    //   40	306	5	localSimpleDateFormat2	SimpleDateFormat
    //   74	281	6	localObject	Object
    //   223	58	7	localTimeZone	TimeZone
    //   99	93	12	localJSONObject2	JSONObject
    //   198	138	13	str1	String
    //   350	3	14	str2	String
    //   118	188	15	str3	String
    // Exception table:
    //   from	to	target	type
    //   8	147	359	java/lang/Exception
    //   147	217	359	java/lang/Exception
    //   217	293	359	java/lang/Exception
    //   295	315	359	java/lang/Exception
    //   315	332	359	java/lang/Exception
    //   335	352	359	java/lang/Exception
  }
  
  private JSONObject getDateToString(JSONArray paramJSONArray)
    throws GlobalizationError
  {
    JSONObject localJSONObject1 = new JSONObject();
    try
    {
      Date localDate = new Date(((Long)paramJSONArray.getJSONObject(0).get("date")).longValue());
      JSONObject localJSONObject2 = localJSONObject1.put("value", new SimpleDateFormat(getDatePattern(paramJSONArray).getString("pattern")).format(localDate));
      return localJSONObject2;
    }
    catch (Exception localException)
    {
      throw new GlobalizationError("FORMATTING_ERROR");
    }
  }
  
  private JSONObject getFirstDayOfWeek(JSONArray paramJSONArray)
    throws GlobalizationError
  {
    JSONObject localJSONObject1 = new JSONObject();
    try
    {
      JSONObject localJSONObject2 = localJSONObject1.put("value", Calendar.getInstance(Locale.getDefault()).getFirstDayOfWeek());
      return localJSONObject2;
    }
    catch (Exception localException)
    {
      throw new GlobalizationError("UNKNOWN_ERROR");
    }
  }
  
  private JSONObject getIsDayLightSavingsTime(JSONArray paramJSONArray)
    throws GlobalizationError
  {
    JSONObject localJSONObject1 = new JSONObject();
    try
    {
      Date localDate = new Date(((Long)paramJSONArray.getJSONObject(0).get("date")).longValue());
      JSONObject localJSONObject2 = localJSONObject1.put("dst", TimeZone.getTimeZone(Time.getCurrentTimezone()).inDaylightTime(localDate));
      return localJSONObject2;
    }
    catch (Exception localException)
    {
      throw new GlobalizationError("UNKNOWN_ERROR");
    }
  }
  
  private JSONObject getLocaleName()
    throws GlobalizationError
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("value", toBcp47Language(Locale.getDefault()));
      return localJSONObject;
    }
    catch (Exception localException)
    {
      throw new GlobalizationError("UNKNOWN_ERROR");
    }
  }
  
  private DecimalFormat getNumberFormatInstance(JSONArray paramJSONArray)
    throws JSONException
  {
    DecimalFormat localDecimalFormat1 = (DecimalFormat)DecimalFormat.getInstance(Locale.getDefault());
    try
    {
      if ((paramJSONArray.getJSONObject(0).length() > 1) && (!((JSONObject)paramJSONArray.getJSONObject(0).get("options")).isNull("type")))
      {
        String str = (String)((JSONObject)paramJSONArray.getJSONObject(0).get("options")).get("type");
        if (str.equalsIgnoreCase("currency")) {
          return (DecimalFormat)DecimalFormat.getCurrencyInstance(Locale.getDefault());
        }
        if (str.equalsIgnoreCase("percent"))
        {
          DecimalFormat localDecimalFormat2 = (DecimalFormat)DecimalFormat.getPercentInstance(Locale.getDefault());
          return localDecimalFormat2;
        }
      }
    }
    catch (JSONException localJSONException) {}
    return localDecimalFormat1;
  }
  
  /* Error */
  private JSONObject getNumberPattern(JSONArray paramJSONArray)
    throws GlobalizationError
  {
    // Byte code:
    //   0: new 112	org/json/JSONObject
    //   3: dup
    //   4: invokespecial 113	org/json/JSONObject:<init>	()V
    //   7: astore_2
    //   8: invokestatic 129	java/util/Locale:getDefault	()Ljava/util/Locale;
    //   11: invokestatic 411	java/text/DecimalFormat:getInstance	(Ljava/util/Locale;)Ljava/text/NumberFormat;
    //   14: checkcast 131	java/text/DecimalFormat
    //   17: astore 4
    //   19: aload 4
    //   21: invokevirtual 183	java/text/DecimalFormat:getDecimalFormatSymbols	()Ljava/text/DecimalFormatSymbols;
    //   24: invokevirtual 189	java/text/DecimalFormatSymbols:getDecimalSeparator	()C
    //   27: invokestatic 194	java/lang/String:valueOf	(C)Ljava/lang/String;
    //   30: astore 5
    //   32: aload_1
    //   33: iconst_0
    //   34: invokevirtual 119	org/json/JSONArray:getJSONObject	(I)Lorg/json/JSONObject;
    //   37: invokevirtual 214	org/json/JSONObject:length	()I
    //   40: ifle +78 -> 118
    //   43: aload_1
    //   44: iconst_0
    //   45: invokevirtual 119	org/json/JSONArray:getJSONObject	(I)Lorg/json/JSONObject;
    //   48: ldc 80
    //   50: invokevirtual 218	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   53: checkcast 112	org/json/JSONObject
    //   56: ldc 98
    //   58: invokevirtual 222	org/json/JSONObject:isNull	(Ljava/lang/String;)Z
    //   61: ifne +57 -> 118
    //   64: aload_1
    //   65: iconst_0
    //   66: invokevirtual 119	org/json/JSONArray:getJSONObject	(I)Lorg/json/JSONObject;
    //   69: ldc 80
    //   71: invokevirtual 218	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   74: checkcast 112	org/json/JSONObject
    //   77: ldc 98
    //   79: invokevirtual 218	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   82: checkcast 191	java/lang/String
    //   85: astore 14
    //   87: aload 14
    //   89: ldc 8
    //   91: invokevirtual 225	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   94: ifeq +133 -> 227
    //   97: invokestatic 129	java/util/Locale:getDefault	()Ljava/util/Locale;
    //   100: invokestatic 135	java/text/DecimalFormat:getCurrencyInstance	(Ljava/util/Locale;)Ljava/text/NumberFormat;
    //   103: checkcast 131	java/text/DecimalFormat
    //   106: astore 4
    //   108: aload 4
    //   110: invokevirtual 183	java/text/DecimalFormat:getDecimalFormatSymbols	()Ljava/text/DecimalFormatSymbols;
    //   113: invokevirtual 417	java/text/DecimalFormatSymbols:getCurrencySymbol	()Ljava/lang/String;
    //   116: astore 5
    //   118: aload_2
    //   119: ldc -109
    //   121: aload 4
    //   123: invokevirtual 151	java/text/DecimalFormat:toPattern	()Ljava/lang/String;
    //   126: invokevirtual 155	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   129: pop
    //   130: aload_2
    //   131: ldc_w 419
    //   134: aload 5
    //   136: invokevirtual 155	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   139: pop
    //   140: aload_2
    //   141: ldc -94
    //   143: aload 4
    //   145: invokevirtual 166	java/text/DecimalFormat:getMinimumFractionDigits	()I
    //   148: invokevirtual 169	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   151: pop
    //   152: aload_2
    //   153: ldc -85
    //   155: iconst_0
    //   156: invokestatic 177	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   159: invokevirtual 155	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   162: pop
    //   163: aload_2
    //   164: ldc_w 421
    //   167: aload 4
    //   169: invokevirtual 424	java/text/DecimalFormat:getPositivePrefix	()Ljava/lang/String;
    //   172: invokevirtual 155	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   175: pop
    //   176: aload_2
    //   177: ldc_w 426
    //   180: aload 4
    //   182: invokevirtual 429	java/text/DecimalFormat:getNegativePrefix	()Ljava/lang/String;
    //   185: invokevirtual 155	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   188: pop
    //   189: aload_2
    //   190: ldc -77
    //   192: aload 4
    //   194: invokevirtual 183	java/text/DecimalFormat:getDecimalFormatSymbols	()Ljava/text/DecimalFormatSymbols;
    //   197: invokevirtual 189	java/text/DecimalFormatSymbols:getDecimalSeparator	()C
    //   200: invokestatic 194	java/lang/String:valueOf	(C)Ljava/lang/String;
    //   203: invokevirtual 155	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   206: pop
    //   207: aload_2
    //   208: ldc -60
    //   210: aload 4
    //   212: invokevirtual 183	java/text/DecimalFormat:getDecimalFormatSymbols	()Ljava/text/DecimalFormatSymbols;
    //   215: invokevirtual 199	java/text/DecimalFormatSymbols:getGroupingSeparator	()C
    //   218: invokestatic 194	java/lang/String:valueOf	(C)Ljava/lang/String;
    //   221: invokevirtual 155	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   224: pop
    //   225: aload_2
    //   226: areturn
    //   227: aload 14
    //   229: ldc 83
    //   231: invokevirtual 225	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   234: ifeq -116 -> 118
    //   237: invokestatic 129	java/util/Locale:getDefault	()Ljava/util/Locale;
    //   240: invokestatic 414	java/text/DecimalFormat:getPercentInstance	(Ljava/util/Locale;)Ljava/text/NumberFormat;
    //   243: checkcast 131	java/text/DecimalFormat
    //   246: astore 4
    //   248: aload 4
    //   250: invokevirtual 183	java/text/DecimalFormat:getDecimalFormatSymbols	()Ljava/text/DecimalFormatSymbols;
    //   253: invokevirtual 432	java/text/DecimalFormatSymbols:getPercent	()C
    //   256: invokestatic 194	java/lang/String:valueOf	(C)Ljava/lang/String;
    //   259: astore 15
    //   261: aload 15
    //   263: astore 5
    //   265: goto -147 -> 118
    //   268: astore_3
    //   269: new 108	org/apache/cordova/globalization/GlobalizationError
    //   272: dup
    //   273: ldc_w 370
    //   276: invokespecial 204	org/apache/cordova/globalization/GlobalizationError:<init>	(Ljava/lang/String;)V
    //   279: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	280	0	this	Globalization
    //   0	280	1	paramJSONArray	JSONArray
    //   7	219	2	localJSONObject	JSONObject
    //   268	1	3	localException	Exception
    //   17	232	4	localDecimalFormat	DecimalFormat
    //   30	234	5	localObject	Object
    //   85	143	14	str1	String
    //   259	3	15	str2	String
    // Exception table:
    //   from	to	target	type
    //   8	118	268	java/lang/Exception
    //   118	225	268	java/lang/Exception
    //   227	261	268	java/lang/Exception
  }
  
  private JSONObject getNumberToString(JSONArray paramJSONArray)
    throws GlobalizationError
  {
    JSONObject localJSONObject1 = new JSONObject();
    try
    {
      JSONObject localJSONObject2 = localJSONObject1.put("value", getNumberFormatInstance(paramJSONArray).format(paramJSONArray.getJSONObject(0).get("number")));
      return localJSONObject2;
    }
    catch (Exception localException)
    {
      throw new GlobalizationError("FORMATTING_ERROR");
    }
  }
  
  private JSONObject getPreferredLanguage()
    throws GlobalizationError
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("value", toBcp47Language(Locale.getDefault()));
      return localJSONObject;
    }
    catch (Exception localException)
    {
      throw new GlobalizationError("UNKNOWN_ERROR");
    }
  }
  
  private JSONObject getStringToNumber(JSONArray paramJSONArray)
    throws GlobalizationError
  {
    JSONObject localJSONObject1 = new JSONObject();
    try
    {
      JSONObject localJSONObject2 = localJSONObject1.put("value", getNumberFormatInstance(paramJSONArray).parse((String)paramJSONArray.getJSONObject(0).get("numberString")));
      return localJSONObject2;
    }
    catch (Exception localException)
    {
      throw new GlobalizationError("PARSING_ERROR");
    }
  }
  
  private JSONObject getStringtoDate(JSONArray paramJSONArray)
    throws GlobalizationError
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      Date localDate = new SimpleDateFormat(getDatePattern(paramJSONArray).getString("pattern")).parse(paramJSONArray.getJSONObject(0).get("dateString").toString());
      Time localTime = new Time();
      localTime.set(localDate.getTime());
      localJSONObject.put("year", localTime.year);
      localJSONObject.put("month", localTime.month);
      localJSONObject.put("day", localTime.monthDay);
      localJSONObject.put("hour", localTime.hour);
      localJSONObject.put("minute", localTime.minute);
      localJSONObject.put("second", localTime.second);
      localJSONObject.put("millisecond", Long.valueOf(0L));
      return localJSONObject;
    }
    catch (Exception localException)
    {
      throw new GlobalizationError("PARSING_ERROR");
    }
  }
  
  private String toBcp47Language(Locale paramLocale)
  {
    String str1 = paramLocale.getLanguage();
    String str2 = paramLocale.getCountry();
    String str3 = paramLocale.getVariant();
    if ((str1.equals("no")) && (str2.equals("NO")) && (str3.equals("NY")))
    {
      str1 = "nn";
      str2 = "NO";
      str3 = "";
    }
    if ((str1.isEmpty()) || (!str1.matches("\\p{Alpha}{2,8}"))) {
      str1 = "und";
    }
    for (;;)
    {
      if (!str2.matches("\\p{Alpha}{2}|\\p{Digit}{3}")) {
        str2 = "";
      }
      if (!str3.matches("\\p{Alnum}{5,8}|\\p{Digit}\\p{Alnum}{3}")) {
        str3 = "";
      }
      StringBuilder localStringBuilder = new StringBuilder(str1);
      if (!str2.isEmpty()) {
        localStringBuilder.append('-').append(str2);
      }
      if (!str3.isEmpty()) {
        localStringBuilder.append('-').append(str3);
      }
      return localStringBuilder.toString();
      if (str1.equals("iw")) {
        str1 = "he";
      } else if (str1.equals("in")) {
        str1 = "id";
      } else if (str1.equals("ji")) {
        str1 = "yi";
      }
    }
  }
  
  public boolean execute(String paramString, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
  {
    new JSONObject();
    try
    {
      if (paramString.equals("getLocaleName")) {
        localObject = getLocaleName();
      }
      for (;;)
      {
        paramCallbackContext.success((JSONObject)localObject);
        break label305;
        if (paramString.equals("getPreferredLanguage"))
        {
          localObject = getPreferredLanguage();
        }
        else if (paramString.equalsIgnoreCase("dateToString"))
        {
          localObject = getDateToString(paramJSONArray);
        }
        else if (paramString.equalsIgnoreCase("stringToDate"))
        {
          localObject = getStringtoDate(paramJSONArray);
        }
        else
        {
          if (!paramString.equalsIgnoreCase("getDatePattern")) {
            break;
          }
          localObject = getDatePattern(paramJSONArray);
        }
      }
      if (paramString.equalsIgnoreCase("getDateNames")) {
        if (Build.VERSION.SDK_INT < 9) {
          throw new GlobalizationError("UNKNOWN_ERROR");
        }
      }
    }
    catch (GlobalizationError localGlobalizationError)
    {
      for (;;)
      {
        paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, localGlobalizationError.toJson()));
        break label305;
        Object localObject = getDateNames(paramJSONArray);
        continue;
        if (paramString.equalsIgnoreCase("isDayLightSavingsTime"))
        {
          localObject = getIsDayLightSavingsTime(paramJSONArray);
        }
        else if (paramString.equalsIgnoreCase("getFirstDayOfWeek"))
        {
          localObject = getFirstDayOfWeek(paramJSONArray);
        }
        else if (paramString.equalsIgnoreCase("numberToString"))
        {
          localObject = getNumberToString(paramJSONArray);
        }
        else if (paramString.equalsIgnoreCase("stringToNumber"))
        {
          localObject = getStringToNumber(paramJSONArray);
        }
        else if (paramString.equalsIgnoreCase("getNumberPattern"))
        {
          localObject = getNumberPattern(paramJSONArray);
        }
        else
        {
          if (!paramString.equalsIgnoreCase("getCurrencyPattern")) {
            break;
          }
          JSONObject localJSONObject = getCurrencyPattern(paramJSONArray);
          localObject = localJSONObject;
        }
      }
      return false;
    }
    catch (Exception localException)
    {
      paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.JSON_EXCEPTION));
    }
    label305:
    return true;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/globalization/Globalization.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */