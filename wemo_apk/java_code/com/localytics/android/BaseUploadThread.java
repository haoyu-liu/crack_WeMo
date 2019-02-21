package com.localytics.android;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Proxy;
import java.net.URL;
import java.net.URLConnection;
import java.util.TreeMap;
import org.json.JSONObject;

abstract class BaseUploadThread
  extends Thread
{
  String customerID;
  final TreeMap<Integer, Object> mData;
  LocalyticsDao mLocalyticsDao;
  private final BaseHandler mSessionHandler;
  private String uploadResponseString = null;
  
  BaseUploadThread(BaseHandler paramBaseHandler, TreeMap<Integer, Object> paramTreeMap, String paramString, LocalyticsDao paramLocalyticsDao)
  {
    this.mSessionHandler = paramBaseHandler;
    this.mData = paramTreeMap;
    this.customerID = paramString;
    this.mLocalyticsDao = paramLocalyticsDao;
  }
  
  @NonNull
  static URLConnection createURLConnection(@NonNull URL paramURL, @Nullable Proxy paramProxy)
    throws IOException
  {
    if (paramProxy == null) {
      return paramURL.openConnection();
    }
    return paramURL.openConnection(paramProxy);
  }
  
  private static String formatUploadBody(String paramString)
  {
    try
    {
      String str = new JSONObject(paramString).toString(3);
      return str;
    }
    catch (Exception localException) {}
    return paramString;
  }
  
  private void retrieveHttpResponse(InputStream paramInputStream)
    throws IOException
  {
    BufferedReader localBufferedReader = new BufferedReader(new InputStreamReader(paramInputStream, "UTF-8"));
    StringBuilder localStringBuilder = new StringBuilder();
    for (;;)
    {
      String str1 = localBufferedReader.readLine();
      if (str1 == null) {
        break;
      }
      localStringBuilder.append(str1);
    }
    String str2 = localStringBuilder.toString();
    if (!TextUtils.isEmpty(str2)) {
      onUploadResponded(str2);
    }
    localBufferedReader.close();
  }
  
  String getApiKey()
  {
    Object localObject = this.mLocalyticsDao.getApiKey();
    String str = DatapointHelper.getLocalyticsRollupKeyOrNull(this.mLocalyticsDao.getAppContext());
    if ((str != null) && (!TextUtils.isEmpty(str))) {
      localObject = str;
    }
    return (String)localObject;
  }
  
  void onUploadResponded(String paramString)
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.mSessionHandler.siloName;
    arrayOfObject[1] = paramString;
    Localytics.Log.w(String.format("%s upload response: \n%s", arrayOfObject));
    this.uploadResponseString = paramString;
  }
  
  /* Error */
  public void run()
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 137	com/localytics/android/BaseUploadThread:uploadData	()I
    //   4: istore 6
    //   6: aload_0
    //   7: getfield 23	com/localytics/android/BaseUploadThread:mSessionHandler	Lcom/localytics/android/BaseHandler;
    //   10: astore 7
    //   12: aload_0
    //   13: getfield 23	com/localytics/android/BaseUploadThread:mSessionHandler	Lcom/localytics/android/BaseHandler;
    //   16: astore 8
    //   18: iconst_2
    //   19: anewarray 113	java/lang/Object
    //   22: astore 9
    //   24: aload 9
    //   26: iconst_0
    //   27: iload 6
    //   29: invokestatic 143	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   32: aastore
    //   33: aload 9
    //   35: iconst_1
    //   36: aload_0
    //   37: getfield 21	com/localytics/android/BaseUploadThread:uploadResponseString	Ljava/lang/String;
    //   40: aastore
    //   41: aload 7
    //   43: aload 8
    //   45: iconst_4
    //   46: aload 9
    //   48: invokevirtual 147	com/localytics/android/BaseHandler:obtainMessage	(ILjava/lang/Object;)Landroid/os/Message;
    //   51: invokevirtual 151	com/localytics/android/BaseHandler:sendMessage	(Landroid/os/Message;)Z
    //   54: pop
    //   55: return
    //   56: astore_1
    //   57: aload_0
    //   58: getfield 23	com/localytics/android/BaseUploadThread:mSessionHandler	Lcom/localytics/android/BaseHandler;
    //   61: astore_2
    //   62: aload_0
    //   63: getfield 23	com/localytics/android/BaseUploadThread:mSessionHandler	Lcom/localytics/android/BaseHandler;
    //   66: astore_3
    //   67: iconst_2
    //   68: anewarray 113	java/lang/Object
    //   71: astore 4
    //   73: aload 4
    //   75: iconst_0
    //   76: iconst_0
    //   77: invokestatic 143	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   80: aastore
    //   81: aload 4
    //   83: iconst_1
    //   84: aload_0
    //   85: getfield 21	com/localytics/android/BaseUploadThread:uploadResponseString	Ljava/lang/String;
    //   88: aastore
    //   89: aload_2
    //   90: aload_3
    //   91: iconst_4
    //   92: aload 4
    //   94: invokevirtual 147	com/localytics/android/BaseHandler:obtainMessage	(ILjava/lang/Object;)Landroid/os/Message;
    //   97: invokevirtual 151	com/localytics/android/BaseHandler:sendMessage	(Landroid/os/Message;)Z
    //   100: pop
    //   101: aload_1
    //   102: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	103	0	this	BaseUploadThread
    //   56	46	1	localObject	Object
    //   61	29	2	localBaseHandler1	BaseHandler
    //   66	25	3	localBaseHandler2	BaseHandler
    //   71	22	4	arrayOfObject1	Object[]
    //   4	24	6	i	int
    //   10	32	7	localBaseHandler3	BaseHandler
    //   16	28	8	localBaseHandler4	BaseHandler
    //   22	25	9	arrayOfObject2	Object[]
    // Exception table:
    //   from	to	target	type
    //   0	6	56	finally
  }
  
  boolean upload(UploadType paramUploadType, String paramString1, String paramString2, int paramInt)
  {
    return upload(paramUploadType, paramString1, paramString2, paramInt, false);
  }
  
  /* Error */
  boolean upload(UploadType paramUploadType, String paramString1, String paramString2, int paramInt, boolean paramBoolean)
  {
    // Byte code:
    //   0: aload_2
    //   1: ifnonnull +13 -> 14
    //   4: new 164	java/lang/IllegalArgumentException
    //   7: dup
    //   8: ldc -90
    //   10: invokespecial 167	java/lang/IllegalArgumentException:<init>	(Ljava/lang/String;)V
    //   13: athrow
    //   14: aload_3
    //   15: ifnonnull +13 -> 28
    //   18: new 164	java/lang/IllegalArgumentException
    //   21: dup
    //   22: ldc -87
    //   24: invokespecial 167	java/lang/IllegalArgumentException:<init>	(Ljava/lang/String;)V
    //   27: athrow
    //   28: aload_1
    //   29: getstatic 175	com/localytics/android/BaseUploadThread$UploadType:ANALYTICS	Lcom/localytics/android/BaseUploadThread$UploadType;
    //   32: if_acmpne +479 -> 511
    //   35: ldc -79
    //   37: iconst_1
    //   38: anewarray 113	java/lang/Object
    //   41: dup
    //   42: iconst_0
    //   43: aload_3
    //   44: aastore
    //   45: invokestatic 126	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   48: invokestatic 180	com/localytics/android/Localytics$Log:v	(Ljava/lang/String;)I
    //   51: pop
    //   52: aconst_null
    //   53: astore 8
    //   55: aload_3
    //   56: ldc 65
    //   58: invokevirtual 184	java/lang/String:getBytes	(Ljava/lang/String;)[B
    //   61: astore 21
    //   63: getstatic 175	com/localytics/android/BaseUploadThread$UploadType:ANALYTICS	Lcom/localytics/android/BaseUploadThread$UploadType;
    //   66: astore 22
    //   68: aconst_null
    //   69: astore 8
    //   71: aload_1
    //   72: aload 22
    //   74: if_acmpne +473 -> 547
    //   77: new 186	java/io/ByteArrayOutputStream
    //   80: dup
    //   81: aload 21
    //   83: arraylength
    //   84: invokespecial 189	java/io/ByteArrayOutputStream:<init>	(I)V
    //   87: astore 23
    //   89: new 191	java/util/zip/GZIPOutputStream
    //   92: dup
    //   93: aload 23
    //   95: invokespecial 194	java/util/zip/GZIPOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   98: astore 24
    //   100: aload 24
    //   102: aload 21
    //   104: invokevirtual 198	java/util/zip/GZIPOutputStream:write	([B)V
    //   107: aload 24
    //   109: invokevirtual 201	java/util/zip/GZIPOutputStream:finish	()V
    //   112: invokestatic 204	com/localytics/android/DatapointHelper:getApiLevel	()I
    //   115: bipush 19
    //   117: if_icmpge +8 -> 125
    //   120: aload 24
    //   122: invokevirtual 207	java/util/zip/GZIPOutputStream:flush	()V
    //   125: aload 23
    //   127: invokevirtual 211	java/io/ByteArrayOutputStream:toByteArray	()[B
    //   130: astore 25
    //   132: aload 25
    //   134: astore 26
    //   136: aload 24
    //   138: astore 27
    //   140: aload 27
    //   142: ifnull +8 -> 150
    //   145: aload 27
    //   147: invokevirtual 212	java/util/zip/GZIPOutputStream:close	()V
    //   150: aconst_null
    //   151: astore 28
    //   153: aload_0
    //   154: getfield 29	com/localytics/android/BaseUploadThread:mLocalyticsDao	Lcom/localytics/android/LocalyticsDao;
    //   157: invokeinterface 216 1 0
    //   162: astore 38
    //   164: new 37	java/net/URL
    //   167: dup
    //   168: aload_2
    //   169: invokespecial 217	java/net/URL:<init>	(Ljava/lang/String;)V
    //   172: aload 38
    //   174: invokestatic 219	com/localytics/android/BaseUploadThread:createURLConnection	(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/URLConnection;
    //   177: checkcast 221	java/net/HttpURLConnection
    //   180: astore 28
    //   182: aload 28
    //   184: ldc -34
    //   186: invokevirtual 225	java/net/HttpURLConnection:setConnectTimeout	(I)V
    //   189: aload 28
    //   191: ldc -34
    //   193: invokevirtual 228	java/net/HttpURLConnection:setReadTimeout	(I)V
    //   196: aload_1
    //   197: getstatic 231	com/localytics/android/BaseUploadThread$UploadType:MARKETING	Lcom/localytics/android/BaseUploadThread$UploadType;
    //   200: if_acmpeq +476 -> 676
    //   203: iconst_1
    //   204: istore 39
    //   206: aload 28
    //   208: iload 39
    //   210: invokevirtual 235	java/net/HttpURLConnection:setDoOutput	(Z)V
    //   213: aload_1
    //   214: getstatic 175	com/localytics/android/BaseUploadThread$UploadType:ANALYTICS	Lcom/localytics/android/BaseUploadThread$UploadType;
    //   217: if_acmpne +465 -> 682
    //   220: aload 28
    //   222: ldc -19
    //   224: ldc -17
    //   226: invokevirtual 243	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   229: aload 28
    //   231: ldc -11
    //   233: ldc -9
    //   235: invokevirtual 243	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   238: aload 28
    //   240: ldc -7
    //   242: ldc -5
    //   244: invokevirtual 243	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   247: aload_1
    //   248: getstatic 231	com/localytics/android/BaseUploadThread$UploadType:MARKETING	Lcom/localytics/android/BaseUploadThread$UploadType;
    //   251: if_acmpne +19 -> 270
    //   254: invokestatic 257	com/localytics/android/Constants:isTestModeEnabled	()Z
    //   257: ifeq +13 -> 270
    //   260: aload 28
    //   262: ldc_w 259
    //   265: ldc -5
    //   267: invokevirtual 243	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   270: iload 5
    //   272: ifeq +13 -> 285
    //   275: aload 28
    //   277: ldc_w 261
    //   280: ldc -5
    //   282: invokevirtual 243	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   285: aload 28
    //   287: ldc_w 263
    //   290: ldc_w 265
    //   293: invokevirtual 243	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   296: aload 28
    //   298: ldc_w 267
    //   301: invokestatic 273	java/lang/System:currentTimeMillis	()J
    //   304: l2d
    //   305: ldc2_w 274
    //   308: ddiv
    //   309: invokestatic 281	java/lang/Math:round	(D)J
    //   312: invokestatic 286	java/lang/Long:toString	(J)Ljava/lang/String;
    //   315: invokevirtual 243	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   318: aload 28
    //   320: ldc_w 288
    //   323: aload_0
    //   324: getfield 29	com/localytics/android/BaseUploadThread:mLocalyticsDao	Lcom/localytics/android/LocalyticsDao;
    //   327: invokeinterface 291 1 0
    //   332: invokevirtual 243	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   335: aload 28
    //   337: ldc_w 293
    //   340: aload_0
    //   341: getfield 29	com/localytics/android/BaseUploadThread:mLocalyticsDao	Lcom/localytics/android/LocalyticsDao;
    //   344: invokeinterface 101 1 0
    //   349: invokevirtual 243	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   352: aload 28
    //   354: ldc_w 295
    //   357: ldc_w 297
    //   360: invokevirtual 243	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   363: aload 28
    //   365: ldc_w 299
    //   368: aload_0
    //   369: getfield 29	com/localytics/android/BaseUploadThread:mLocalyticsDao	Lcom/localytics/android/LocalyticsDao;
    //   372: invokeinterface 105 1 0
    //   377: invokestatic 302	com/localytics/android/DatapointHelper:getAppVersion	(Landroid/content/Context;)Ljava/lang/String;
    //   380: invokevirtual 243	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   383: aload 28
    //   385: ldc_w 304
    //   388: aload_0
    //   389: getfield 27	com/localytics/android/BaseUploadThread:customerID	Ljava/lang/String;
    //   392: invokevirtual 243	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   395: aload_1
    //   396: getstatic 231	com/localytics/android/BaseUploadThread$UploadType:MARKETING	Lcom/localytics/android/BaseUploadThread$UploadType;
    //   399: if_acmpeq +43 -> 442
    //   402: aload 28
    //   404: aload 26
    //   406: arraylength
    //   407: invokevirtual 307	java/net/HttpURLConnection:setFixedLengthStreamingMode	(I)V
    //   410: aconst_null
    //   411: astore 43
    //   413: aload 28
    //   415: invokevirtual 311	java/net/HttpURLConnection:getOutputStream	()Ljava/io/OutputStream;
    //   418: astore 43
    //   420: aload 43
    //   422: aload 26
    //   424: invokevirtual 314	java/io/OutputStream:write	([B)V
    //   427: aload 43
    //   429: ifnull +13 -> 442
    //   432: aload 43
    //   434: invokevirtual 315	java/io/OutputStream:flush	()V
    //   437: aload 43
    //   439: invokevirtual 316	java/io/OutputStream:close	()V
    //   442: aload 28
    //   444: invokevirtual 319	java/net/HttpURLConnection:getResponseCode	()I
    //   447: istore 40
    //   449: iconst_2
    //   450: anewarray 113	java/lang/Object
    //   453: astore 41
    //   455: aload 41
    //   457: iconst_0
    //   458: aload_0
    //   459: getfield 23	com/localytics/android/BaseUploadThread:mSessionHandler	Lcom/localytics/android/BaseHandler;
    //   462: getfield 118	com/localytics/android/BaseHandler:siloName	Ljava/lang/String;
    //   465: aastore
    //   466: aload 41
    //   468: iconst_1
    //   469: iload 40
    //   471: invokestatic 143	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   474: aastore
    //   475: ldc_w 321
    //   478: aload 41
    //   480: invokestatic 126	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   483: invokestatic 180	com/localytics/android/Localytics$Log:v	(Ljava/lang/String;)I
    //   486: pop
    //   487: iload 40
    //   489: sipush 429
    //   492: if_icmpne +281 -> 773
    //   495: iconst_0
    //   496: istore 14
    //   498: aload 28
    //   500: ifnull +8 -> 508
    //   503: aload 28
    //   505: invokevirtual 324	java/net/HttpURLConnection:disconnect	()V
    //   508: iload 14
    //   510: ireturn
    //   511: aload_1
    //   512: getstatic 327	com/localytics/android/BaseUploadThread$UploadType:PROFILES	Lcom/localytics/android/BaseUploadThread$UploadType;
    //   515: if_acmpne -463 -> 52
    //   518: iconst_1
    //   519: anewarray 113	java/lang/Object
    //   522: astore 6
    //   524: aload 6
    //   526: iconst_0
    //   527: aload_3
    //   528: invokestatic 329	com/localytics/android/BaseUploadThread:formatUploadBody	(Ljava/lang/String;)Ljava/lang/String;
    //   531: aastore
    //   532: ldc_w 331
    //   535: aload 6
    //   537: invokestatic 126	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   540: invokestatic 180	com/localytics/android/Localytics$Log:v	(Ljava/lang/String;)I
    //   543: pop
    //   544: goto -492 -> 52
    //   547: aload 21
    //   549: astore 26
    //   551: aconst_null
    //   552: astore 27
    //   554: goto -414 -> 140
    //   557: astore 45
    //   559: ldc_w 333
    //   562: aload 45
    //   564: invokestatic 336	com/localytics/android/Localytics$Log:w	(Ljava/lang/String;Ljava/lang/Throwable;)I
    //   567: pop
    //   568: iconst_0
    //   569: ireturn
    //   570: astore 17
    //   572: ldc_w 338
    //   575: aload 17
    //   577: invokestatic 336	com/localytics/android/Localytics$Log:w	(Ljava/lang/String;Ljava/lang/Throwable;)I
    //   580: pop
    //   581: iconst_0
    //   582: istore 14
    //   584: aload 8
    //   586: ifnull -78 -> 508
    //   589: aload 8
    //   591: invokevirtual 212	java/util/zip/GZIPOutputStream:close	()V
    //   594: iconst_0
    //   595: ireturn
    //   596: astore 19
    //   598: ldc_w 333
    //   601: aload 19
    //   603: invokestatic 336	com/localytics/android/Localytics$Log:w	(Ljava/lang/String;Ljava/lang/Throwable;)I
    //   606: pop
    //   607: iconst_0
    //   608: ireturn
    //   609: astore 12
    //   611: ldc_w 340
    //   614: aload 12
    //   616: invokestatic 336	com/localytics/android/Localytics$Log:w	(Ljava/lang/String;Ljava/lang/Throwable;)I
    //   619: pop
    //   620: iconst_0
    //   621: istore 14
    //   623: aload 8
    //   625: ifnull -117 -> 508
    //   628: aload 8
    //   630: invokevirtual 212	java/util/zip/GZIPOutputStream:close	()V
    //   633: iconst_0
    //   634: ireturn
    //   635: astore 15
    //   637: ldc_w 333
    //   640: aload 15
    //   642: invokestatic 336	com/localytics/android/Localytics$Log:w	(Ljava/lang/String;Ljava/lang/Throwable;)I
    //   645: pop
    //   646: iconst_0
    //   647: ireturn
    //   648: astore 9
    //   650: aload 8
    //   652: ifnull +8 -> 660
    //   655: aload 8
    //   657: invokevirtual 212	java/util/zip/GZIPOutputStream:close	()V
    //   660: aload 9
    //   662: athrow
    //   663: astore 10
    //   665: ldc_w 333
    //   668: aload 10
    //   670: invokestatic 336	com/localytics/android/Localytics$Log:w	(Ljava/lang/String;Ljava/lang/Throwable;)I
    //   673: pop
    //   674: iconst_0
    //   675: ireturn
    //   676: iconst_0
    //   677: istore 39
    //   679: goto -473 -> 206
    //   682: aload 28
    //   684: ldc -19
    //   686: ldc_w 342
    //   689: invokevirtual 243	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   692: goto -445 -> 247
    //   695: astore 34
    //   697: iload 4
    //   699: iconst_2
    //   700: if_icmpne +157 -> 857
    //   703: ldc_w 344
    //   706: aload 34
    //   708: invokestatic 336	com/localytics/android/Localytics$Log:w	(Ljava/lang/String;Ljava/lang/Throwable;)I
    //   711: pop
    //   712: iconst_0
    //   713: istore 14
    //   715: aload 28
    //   717: ifnull -209 -> 508
    //   720: aload 28
    //   722: invokevirtual 324	java/net/HttpURLConnection:disconnect	()V
    //   725: iconst_0
    //   726: ireturn
    //   727: astore 44
    //   729: aload 43
    //   731: ifnull +13 -> 744
    //   734: aload 43
    //   736: invokevirtual 315	java/io/OutputStream:flush	()V
    //   739: aload 43
    //   741: invokevirtual 316	java/io/OutputStream:close	()V
    //   744: aload 44
    //   746: athrow
    //   747: astore 32
    //   749: ldc_w 344
    //   752: aload 32
    //   754: invokestatic 336	com/localytics/android/Localytics$Log:w	(Ljava/lang/String;Ljava/lang/Throwable;)I
    //   757: pop
    //   758: iconst_0
    //   759: istore 14
    //   761: aload 28
    //   763: ifnull -255 -> 508
    //   766: aload 28
    //   768: invokevirtual 324	java/net/HttpURLConnection:disconnect	()V
    //   771: iconst_0
    //   772: ireturn
    //   773: iload 40
    //   775: sipush 400
    //   778: if_icmplt +27 -> 805
    //   781: iload 40
    //   783: sipush 499
    //   786: if_icmpgt +19 -> 805
    //   789: iconst_1
    //   790: istore 14
    //   792: aload 28
    //   794: ifnull -286 -> 508
    //   797: aload 28
    //   799: invokevirtual 324	java/net/HttpURLConnection:disconnect	()V
    //   802: iload 14
    //   804: ireturn
    //   805: iload 40
    //   807: sipush 500
    //   810: if_icmplt +26 -> 836
    //   813: iload 40
    //   815: sipush 599
    //   818: if_icmpgt +18 -> 836
    //   821: iconst_0
    //   822: istore 14
    //   824: aload 28
    //   826: ifnull -318 -> 508
    //   829: aload 28
    //   831: invokevirtual 324	java/net/HttpURLConnection:disconnect	()V
    //   834: iconst_0
    //   835: ireturn
    //   836: aload_0
    //   837: aload 28
    //   839: invokevirtual 348	java/net/HttpURLConnection:getInputStream	()Ljava/io/InputStream;
    //   842: invokespecial 350	com/localytics/android/BaseUploadThread:retrieveHttpResponse	(Ljava/io/InputStream;)V
    //   845: aload 28
    //   847: ifnull +8 -> 855
    //   850: aload 28
    //   852: invokevirtual 324	java/net/HttpURLConnection:disconnect	()V
    //   855: iconst_1
    //   856: ireturn
    //   857: iload 4
    //   859: iconst_1
    //   860: iadd
    //   861: istore 35
    //   863: aload_0
    //   864: aload_1
    //   865: aload_2
    //   866: aload_3
    //   867: iload 35
    //   869: iload 5
    //   871: invokevirtual 156	com/localytics/android/BaseUploadThread:upload	(Lcom/localytics/android/BaseUploadThread$UploadType;Ljava/lang/String;Ljava/lang/String;IZ)Z
    //   874: istore 36
    //   876: iload 36
    //   878: istore 14
    //   880: aload 28
    //   882: ifnull -374 -> 508
    //   885: aload 28
    //   887: invokevirtual 324	java/net/HttpURLConnection:disconnect	()V
    //   890: iload 14
    //   892: ireturn
    //   893: astore 30
    //   895: ldc_w 344
    //   898: aload 30
    //   900: invokestatic 336	com/localytics/android/Localytics$Log:w	(Ljava/lang/String;Ljava/lang/Throwable;)I
    //   903: pop
    //   904: iconst_0
    //   905: istore 14
    //   907: aload 28
    //   909: ifnull -401 -> 508
    //   912: aload 28
    //   914: invokevirtual 324	java/net/HttpURLConnection:disconnect	()V
    //   917: iconst_0
    //   918: ireturn
    //   919: astore 29
    //   921: aload 28
    //   923: ifnull +8 -> 931
    //   926: aload 28
    //   928: invokevirtual 324	java/net/HttpURLConnection:disconnect	()V
    //   931: aload 29
    //   933: athrow
    //   934: astore 9
    //   936: aload 24
    //   938: astore 8
    //   940: goto -290 -> 650
    //   943: astore 12
    //   945: aload 24
    //   947: astore 8
    //   949: goto -338 -> 611
    //   952: astore 17
    //   954: aload 24
    //   956: astore 8
    //   958: goto -386 -> 572
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	961	0	this	BaseUploadThread
    //   0	961	1	paramUploadType	UploadType
    //   0	961	2	paramString1	String
    //   0	961	3	paramString2	String
    //   0	961	4	paramInt	int
    //   0	961	5	paramBoolean	boolean
    //   522	14	6	arrayOfObject1	Object[]
    //   53	904	8	localObject1	Object
    //   648	13	9	localObject2	Object
    //   934	1	9	localObject3	Object
    //   663	6	10	localIOException1	IOException
    //   609	6	12	localIOException2	IOException
    //   943	1	12	localIOException3	IOException
    //   496	410	14	bool1	boolean
    //   635	6	15	localIOException4	IOException
    //   570	6	17	localUnsupportedEncodingException1	java.io.UnsupportedEncodingException
    //   952	1	17	localUnsupportedEncodingException2	java.io.UnsupportedEncodingException
    //   596	6	19	localIOException5	IOException
    //   61	487	21	arrayOfByte1	byte[]
    //   66	7	22	localUploadType	UploadType
    //   87	39	23	localByteArrayOutputStream	java.io.ByteArrayOutputStream
    //   98	857	24	localGZIPOutputStream1	java.util.zip.GZIPOutputStream
    //   130	3	25	arrayOfByte2	byte[]
    //   134	416	26	arrayOfByte3	byte[]
    //   138	415	27	localGZIPOutputStream2	java.util.zip.GZIPOutputStream
    //   151	776	28	localHttpURLConnection	java.net.HttpURLConnection
    //   919	13	29	localObject4	Object
    //   893	6	30	localIOException6	IOException
    //   747	6	32	localMalformedURLException	java.net.MalformedURLException
    //   695	12	34	localEOFException	java.io.EOFException
    //   861	7	35	i	int
    //   874	3	36	bool2	boolean
    //   162	11	38	localProxy	Proxy
    //   204	474	39	bool3	boolean
    //   447	372	40	j	int
    //   453	26	41	arrayOfObject2	Object[]
    //   411	329	43	localOutputStream	java.io.OutputStream
    //   727	18	44	localObject5	Object
    //   557	6	45	localIOException7	IOException
    // Exception table:
    //   from	to	target	type
    //   145	150	557	java/io/IOException
    //   55	68	570	java/io/UnsupportedEncodingException
    //   77	100	570	java/io/UnsupportedEncodingException
    //   589	594	596	java/io/IOException
    //   55	68	609	java/io/IOException
    //   77	100	609	java/io/IOException
    //   628	633	635	java/io/IOException
    //   55	68	648	finally
    //   77	100	648	finally
    //   572	581	648	finally
    //   611	620	648	finally
    //   655	660	663	java/io/IOException
    //   153	203	695	java/io/EOFException
    //   206	247	695	java/io/EOFException
    //   247	270	695	java/io/EOFException
    //   275	285	695	java/io/EOFException
    //   285	410	695	java/io/EOFException
    //   432	442	695	java/io/EOFException
    //   442	487	695	java/io/EOFException
    //   682	692	695	java/io/EOFException
    //   734	744	695	java/io/EOFException
    //   744	747	695	java/io/EOFException
    //   836	845	695	java/io/EOFException
    //   413	427	727	finally
    //   153	203	747	java/net/MalformedURLException
    //   206	247	747	java/net/MalformedURLException
    //   247	270	747	java/net/MalformedURLException
    //   275	285	747	java/net/MalformedURLException
    //   285	410	747	java/net/MalformedURLException
    //   432	442	747	java/net/MalformedURLException
    //   442	487	747	java/net/MalformedURLException
    //   682	692	747	java/net/MalformedURLException
    //   734	744	747	java/net/MalformedURLException
    //   744	747	747	java/net/MalformedURLException
    //   836	845	747	java/net/MalformedURLException
    //   153	203	893	java/io/IOException
    //   206	247	893	java/io/IOException
    //   247	270	893	java/io/IOException
    //   275	285	893	java/io/IOException
    //   285	410	893	java/io/IOException
    //   432	442	893	java/io/IOException
    //   442	487	893	java/io/IOException
    //   682	692	893	java/io/IOException
    //   734	744	893	java/io/IOException
    //   744	747	893	java/io/IOException
    //   836	845	893	java/io/IOException
    //   153	203	919	finally
    //   206	247	919	finally
    //   247	270	919	finally
    //   275	285	919	finally
    //   285	410	919	finally
    //   432	442	919	finally
    //   442	487	919	finally
    //   682	692	919	finally
    //   703	712	919	finally
    //   734	744	919	finally
    //   744	747	919	finally
    //   749	758	919	finally
    //   836	845	919	finally
    //   863	876	919	finally
    //   895	904	919	finally
    //   100	125	934	finally
    //   125	132	934	finally
    //   100	125	943	java/io/IOException
    //   125	132	943	java/io/IOException
    //   100	125	952	java/io/UnsupportedEncodingException
    //   125	132	952	java/io/UnsupportedEncodingException
  }
  
  abstract int uploadData();
  
  protected static enum UploadType
  {
    static
    {
      MARKETING = new UploadType("MARKETING", 2);
      UploadType[] arrayOfUploadType = new UploadType[3];
      arrayOfUploadType[0] = ANALYTICS;
      arrayOfUploadType[1] = PROFILES;
      arrayOfUploadType[2] = MARKETING;
      $VALUES = arrayOfUploadType;
    }
    
    private UploadType() {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/BaseUploadThread.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */