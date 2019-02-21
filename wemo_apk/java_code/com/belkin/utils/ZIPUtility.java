package com.belkin.utils;

public class ZIPUtility
{
  private static int BUFFER = 1024;
  public static final String TAG = "ZIPUtility";
  
  /* Error */
  public static void unzip(String paramString1, String paramString2)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: aconst_null
    //   3: astore_3
    //   4: aconst_null
    //   5: astore 4
    //   7: aconst_null
    //   8: astore 5
    //   10: new 24	java/util/zip/ZipFile
    //   13: dup
    //   14: aload_0
    //   15: invokespecial 27	java/util/zip/ZipFile:<init>	(Ljava/lang/String;)V
    //   18: astore 6
    //   20: aload 6
    //   22: invokevirtual 31	java/util/zip/ZipFile:entries	()Ljava/util/Enumeration;
    //   25: astore 11
    //   27: aconst_null
    //   28: astore 12
    //   30: aconst_null
    //   31: astore 13
    //   33: aconst_null
    //   34: astore 14
    //   36: aload 11
    //   38: invokeinterface 37 1 0
    //   43: ifeq +172 -> 215
    //   46: new 39	java/io/BufferedInputStream
    //   49: dup
    //   50: aload 6
    //   52: aload 11
    //   54: invokeinterface 43 1 0
    //   59: checkcast 45	java/util/zip/ZipEntry
    //   62: invokevirtual 49	java/util/zip/ZipFile:getInputStream	(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;
    //   65: invokespecial 52	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;)V
    //   68: astore_2
    //   69: getstatic 15	com/belkin/utils/ZIPUtility:BUFFER	I
    //   72: newarray <illegal type>
    //   74: astore 15
    //   76: new 54	java/io/FileOutputStream
    //   79: dup
    //   80: aload_1
    //   81: invokespecial 55	java/io/FileOutputStream:<init>	(Ljava/lang/String;)V
    //   84: astore_3
    //   85: new 57	java/io/BufferedOutputStream
    //   88: dup
    //   89: aload_3
    //   90: getstatic 15	com/belkin/utils/ZIPUtility:BUFFER	I
    //   93: invokespecial 60	java/io/BufferedOutputStream:<init>	(Ljava/io/OutputStream;I)V
    //   96: astore 4
    //   98: aload_2
    //   99: aload 15
    //   101: iconst_0
    //   102: getstatic 15	com/belkin/utils/ZIPUtility:BUFFER	I
    //   105: invokevirtual 66	java/io/InputStream:read	([BII)I
    //   108: istore 16
    //   110: iload 16
    //   112: iconst_m1
    //   113: if_icmpeq +84 -> 197
    //   116: aload 4
    //   118: aload 15
    //   120: iconst_0
    //   121: iload 16
    //   123: invokevirtual 70	java/io/BufferedOutputStream:write	([BII)V
    //   126: goto -28 -> 98
    //   129: astore 9
    //   131: aload 6
    //   133: astore 5
    //   135: ldc 11
    //   137: new 72	java/lang/StringBuilder
    //   140: dup
    //   141: invokespecial 73	java/lang/StringBuilder:<init>	()V
    //   144: ldc 75
    //   146: invokevirtual 79	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   149: aload 9
    //   151: invokevirtual 82	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   154: invokevirtual 86	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   157: invokestatic 91	com/belkin/utils/LogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   160: aload 5
    //   162: ifnull +8 -> 170
    //   165: aload 5
    //   167: invokevirtual 94	java/util/zip/ZipFile:close	()V
    //   170: aload 4
    //   172: ifnull +8 -> 180
    //   175: aload 4
    //   177: invokevirtual 95	java/io/BufferedOutputStream:close	()V
    //   180: aload_3
    //   181: ifnull +7 -> 188
    //   184: aload_3
    //   185: invokevirtual 96	java/io/FileOutputStream:close	()V
    //   188: aload_2
    //   189: ifnull +7 -> 196
    //   192: aload_2
    //   193: invokevirtual 97	java/io/InputStream:close	()V
    //   196: return
    //   197: aload 4
    //   199: invokevirtual 100	java/io/BufferedOutputStream:flush	()V
    //   202: aload 4
    //   204: astore 12
    //   206: aload_3
    //   207: astore 13
    //   209: aload_2
    //   210: astore 14
    //   212: goto -176 -> 36
    //   215: aload 6
    //   217: ifnull +8 -> 225
    //   220: aload 6
    //   222: invokevirtual 94	java/util/zip/ZipFile:close	()V
    //   225: aload 12
    //   227: ifnull +8 -> 235
    //   230: aload 12
    //   232: invokevirtual 95	java/io/BufferedOutputStream:close	()V
    //   235: aload 13
    //   237: ifnull +8 -> 245
    //   240: aload 13
    //   242: invokevirtual 96	java/io/FileOutputStream:close	()V
    //   245: aload 14
    //   247: ifnull +8 -> 255
    //   250: aload 14
    //   252: invokevirtual 97	java/io/InputStream:close	()V
    //   255: aload 12
    //   257: pop
    //   258: aload 13
    //   260: pop
    //   261: aload 14
    //   263: pop
    //   264: return
    //   265: astore 17
    //   267: aload 12
    //   269: pop
    //   270: aload 13
    //   272: pop
    //   273: aload 14
    //   275: pop
    //   276: return
    //   277: astore 7
    //   279: aload 5
    //   281: ifnull +8 -> 289
    //   284: aload 5
    //   286: invokevirtual 94	java/util/zip/ZipFile:close	()V
    //   289: aload 4
    //   291: ifnull +8 -> 299
    //   294: aload 4
    //   296: invokevirtual 95	java/io/BufferedOutputStream:close	()V
    //   299: aload_3
    //   300: ifnull +7 -> 307
    //   303: aload_3
    //   304: invokevirtual 96	java/io/FileOutputStream:close	()V
    //   307: aload_2
    //   308: ifnull +7 -> 315
    //   311: aload_2
    //   312: invokevirtual 97	java/io/InputStream:close	()V
    //   315: aload 7
    //   317: athrow
    //   318: astore 8
    //   320: goto -5 -> 315
    //   323: astore 7
    //   325: aload 6
    //   327: astore 5
    //   329: goto -50 -> 279
    //   332: astore 7
    //   334: aload 6
    //   336: astore 5
    //   338: aload 12
    //   340: astore 4
    //   342: aload 13
    //   344: astore_3
    //   345: aload 14
    //   347: astore_2
    //   348: goto -69 -> 279
    //   351: astore 7
    //   353: aload 6
    //   355: astore 5
    //   357: aload 12
    //   359: astore 4
    //   361: aload 13
    //   363: astore_3
    //   364: goto -85 -> 279
    //   367: astore 7
    //   369: aload 6
    //   371: astore 5
    //   373: aload 12
    //   375: astore 4
    //   377: goto -98 -> 279
    //   380: astore 10
    //   382: return
    //   383: astore 9
    //   385: aconst_null
    //   386: astore 4
    //   388: aconst_null
    //   389: astore_3
    //   390: aconst_null
    //   391: astore_2
    //   392: aconst_null
    //   393: astore 5
    //   395: goto -260 -> 135
    //   398: astore 9
    //   400: aload 6
    //   402: astore 5
    //   404: aload 12
    //   406: astore 4
    //   408: aload 13
    //   410: astore_3
    //   411: aload 14
    //   413: astore_2
    //   414: goto -279 -> 135
    //   417: astore 9
    //   419: aload 6
    //   421: astore 5
    //   423: aload 12
    //   425: astore 4
    //   427: aload 13
    //   429: astore_3
    //   430: goto -295 -> 135
    //   433: astore 9
    //   435: aload 6
    //   437: astore 5
    //   439: aload 12
    //   441: astore 4
    //   443: goto -308 -> 135
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	446	0	paramString1	String
    //   0	446	1	paramString2	String
    //   1	413	2	localObject1	Object
    //   3	427	3	localObject2	Object
    //   5	437	4	localObject3	Object
    //   8	430	5	localObject4	Object
    //   18	418	6	localZipFile	java.util.zip.ZipFile
    //   277	39	7	localObject5	Object
    //   323	1	7	localObject6	Object
    //   332	1	7	localObject7	Object
    //   351	1	7	localObject8	Object
    //   367	1	7	localObject9	Object
    //   318	1	8	localException1	Exception
    //   129	21	9	localException2	Exception
    //   383	1	9	localException3	Exception
    //   398	1	9	localException4	Exception
    //   417	1	9	localException5	Exception
    //   433	1	9	localException6	Exception
    //   380	1	10	localException7	Exception
    //   25	28	11	localEnumeration	java.util.Enumeration
    //   28	412	12	localObject10	Object
    //   31	397	13	localObject11	Object
    //   34	378	14	localObject12	Object
    //   74	45	15	arrayOfByte	byte[]
    //   108	14	16	i	int
    //   265	1	17	localException8	Exception
    // Exception table:
    //   from	to	target	type
    //   20	27	129	java/lang/Exception
    //   98	110	129	java/lang/Exception
    //   116	126	129	java/lang/Exception
    //   197	202	129	java/lang/Exception
    //   220	225	265	java/lang/Exception
    //   230	235	265	java/lang/Exception
    //   240	245	265	java/lang/Exception
    //   250	255	265	java/lang/Exception
    //   10	20	277	finally
    //   135	160	277	finally
    //   284	289	318	java/lang/Exception
    //   294	299	318	java/lang/Exception
    //   303	307	318	java/lang/Exception
    //   311	315	318	java/lang/Exception
    //   20	27	323	finally
    //   98	110	323	finally
    //   116	126	323	finally
    //   197	202	323	finally
    //   36	69	332	finally
    //   69	85	351	finally
    //   85	98	367	finally
    //   165	170	380	java/lang/Exception
    //   175	180	380	java/lang/Exception
    //   184	188	380	java/lang/Exception
    //   192	196	380	java/lang/Exception
    //   10	20	383	java/lang/Exception
    //   36	69	398	java/lang/Exception
    //   69	85	417	java/lang/Exception
    //   85	98	433	java/lang/Exception
  }
  
  /* Error */
  public static void zip(String paramString1, String paramString2)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: aconst_null
    //   3: astore_3
    //   4: aconst_null
    //   5: astore 4
    //   7: new 54	java/io/FileOutputStream
    //   10: dup
    //   11: aload_1
    //   12: invokespecial 55	java/io/FileOutputStream:<init>	(Ljava/lang/String;)V
    //   15: astore 5
    //   17: new 103	java/util/zip/ZipOutputStream
    //   20: dup
    //   21: new 57	java/io/BufferedOutputStream
    //   24: dup
    //   25: aload 5
    //   27: invokespecial 106	java/io/BufferedOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   30: invokespecial 107	java/util/zip/ZipOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   33: astore 6
    //   35: getstatic 15	com/belkin/utils/ZIPUtility:BUFFER	I
    //   38: newarray <illegal type>
    //   40: astore 11
    //   42: new 109	java/io/File
    //   45: dup
    //   46: aload_0
    //   47: invokespecial 110	java/io/File:<init>	(Ljava/lang/String;)V
    //   50: invokevirtual 114	java/io/File:list	()[Ljava/lang/String;
    //   53: astore 12
    //   55: iconst_0
    //   56: istore 13
    //   58: aconst_null
    //   59: astore 14
    //   61: iload 13
    //   63: aload 12
    //   65: arraylength
    //   66: if_icmpge +148 -> 214
    //   69: new 39	java/io/BufferedInputStream
    //   72: dup
    //   73: new 116	java/io/FileInputStream
    //   76: dup
    //   77: aload 12
    //   79: iload 13
    //   81: aaload
    //   82: invokespecial 117	java/io/FileInputStream:<init>	(Ljava/lang/String;)V
    //   85: getstatic 15	com/belkin/utils/ZIPUtility:BUFFER	I
    //   88: invokespecial 120	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;I)V
    //   91: astore_2
    //   92: aload 6
    //   94: new 45	java/util/zip/ZipEntry
    //   97: dup
    //   98: aload 12
    //   100: iload 13
    //   102: aaload
    //   103: invokespecial 121	java/util/zip/ZipEntry:<init>	(Ljava/lang/String;)V
    //   106: invokevirtual 125	java/util/zip/ZipOutputStream:putNextEntry	(Ljava/util/zip/ZipEntry;)V
    //   109: aload_2
    //   110: aload 11
    //   112: iconst_0
    //   113: getstatic 15	com/belkin/utils/ZIPUtility:BUFFER	I
    //   116: invokevirtual 126	java/io/BufferedInputStream:read	([BII)I
    //   119: istore 15
    //   121: iload 15
    //   123: iconst_m1
    //   124: if_icmpeq +77 -> 201
    //   127: aload 6
    //   129: aload 11
    //   131: iconst_0
    //   132: iload 15
    //   134: invokevirtual 127	java/util/zip/ZipOutputStream:write	([BII)V
    //   137: goto -28 -> 109
    //   140: astore 9
    //   142: aload 6
    //   144: astore 4
    //   146: aload 5
    //   148: astore_3
    //   149: ldc 11
    //   151: new 72	java/lang/StringBuilder
    //   154: dup
    //   155: invokespecial 73	java/lang/StringBuilder:<init>	()V
    //   158: ldc -127
    //   160: invokevirtual 79	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   163: aload 9
    //   165: invokevirtual 82	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   168: invokevirtual 86	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   171: invokestatic 91	com/belkin/utils/LogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   174: aload 4
    //   176: ifnull +8 -> 184
    //   179: aload 4
    //   181: invokevirtual 130	java/util/zip/ZipOutputStream:close	()V
    //   184: aload_3
    //   185: ifnull +7 -> 192
    //   188: aload_3
    //   189: invokevirtual 96	java/io/FileOutputStream:close	()V
    //   192: aload_2
    //   193: ifnull +7 -> 200
    //   196: aload_2
    //   197: invokevirtual 131	java/io/BufferedInputStream:close	()V
    //   200: return
    //   201: aload_2
    //   202: invokevirtual 131	java/io/BufferedInputStream:close	()V
    //   205: iinc 13 1
    //   208: aload_2
    //   209: astore 14
    //   211: goto -150 -> 61
    //   214: aload 6
    //   216: ifnull +8 -> 224
    //   219: aload 6
    //   221: invokevirtual 130	java/util/zip/ZipOutputStream:close	()V
    //   224: aload 5
    //   226: ifnull +8 -> 234
    //   229: aload 5
    //   231: invokevirtual 96	java/io/FileOutputStream:close	()V
    //   234: aload 14
    //   236: ifnull +8 -> 244
    //   239: aload 14
    //   241: invokevirtual 131	java/io/BufferedInputStream:close	()V
    //   244: aload 14
    //   246: pop
    //   247: return
    //   248: astore 16
    //   250: aload 14
    //   252: pop
    //   253: return
    //   254: astore 7
    //   256: aload 4
    //   258: ifnull +8 -> 266
    //   261: aload 4
    //   263: invokevirtual 130	java/util/zip/ZipOutputStream:close	()V
    //   266: aload_3
    //   267: ifnull +7 -> 274
    //   270: aload_3
    //   271: invokevirtual 96	java/io/FileOutputStream:close	()V
    //   274: aload_2
    //   275: ifnull +7 -> 282
    //   278: aload_2
    //   279: invokevirtual 131	java/io/BufferedInputStream:close	()V
    //   282: aload 7
    //   284: athrow
    //   285: astore 8
    //   287: goto -5 -> 282
    //   290: astore 7
    //   292: aload 5
    //   294: astore_3
    //   295: aconst_null
    //   296: astore_2
    //   297: aconst_null
    //   298: astore 4
    //   300: goto -44 -> 256
    //   303: astore 7
    //   305: aload 6
    //   307: astore 4
    //   309: aload 5
    //   311: astore_3
    //   312: goto -56 -> 256
    //   315: astore 7
    //   317: aload 6
    //   319: astore 4
    //   321: aload 5
    //   323: astore_3
    //   324: aload 14
    //   326: astore_2
    //   327: goto -71 -> 256
    //   330: astore 10
    //   332: return
    //   333: astore 9
    //   335: aconst_null
    //   336: astore_3
    //   337: aconst_null
    //   338: astore_2
    //   339: aconst_null
    //   340: astore 4
    //   342: goto -193 -> 149
    //   345: astore 9
    //   347: aload 5
    //   349: astore_3
    //   350: aconst_null
    //   351: astore_2
    //   352: aconst_null
    //   353: astore 4
    //   355: goto -206 -> 149
    //   358: astore 9
    //   360: aload 6
    //   362: astore 4
    //   364: aload 5
    //   366: astore_3
    //   367: aload 14
    //   369: astore_2
    //   370: goto -221 -> 149
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	373	0	paramString1	String
    //   0	373	1	paramString2	String
    //   1	369	2	localObject1	Object
    //   3	364	3	localObject2	Object
    //   5	358	4	localObject3	Object
    //   15	350	5	localFileOutputStream	java.io.FileOutputStream
    //   33	328	6	localZipOutputStream	java.util.zip.ZipOutputStream
    //   254	29	7	localObject4	Object
    //   290	1	7	localObject5	Object
    //   303	1	7	localObject6	Object
    //   315	1	7	localObject7	Object
    //   285	1	8	localException1	Exception
    //   140	24	9	localException2	Exception
    //   333	1	9	localException3	Exception
    //   345	1	9	localException4	Exception
    //   358	1	9	localException5	Exception
    //   330	1	10	localException6	Exception
    //   40	90	11	arrayOfByte	byte[]
    //   53	46	12	arrayOfString	String[]
    //   56	150	13	i	int
    //   59	309	14	localObject8	Object
    //   119	14	15	j	int
    //   248	1	16	localException7	Exception
    // Exception table:
    //   from	to	target	type
    //   35	55	140	java/lang/Exception
    //   92	109	140	java/lang/Exception
    //   109	121	140	java/lang/Exception
    //   127	137	140	java/lang/Exception
    //   201	205	140	java/lang/Exception
    //   219	224	248	java/lang/Exception
    //   229	234	248	java/lang/Exception
    //   239	244	248	java/lang/Exception
    //   7	17	254	finally
    //   149	174	254	finally
    //   261	266	285	java/lang/Exception
    //   270	274	285	java/lang/Exception
    //   278	282	285	java/lang/Exception
    //   17	35	290	finally
    //   35	55	303	finally
    //   92	109	303	finally
    //   109	121	303	finally
    //   127	137	303	finally
    //   201	205	303	finally
    //   61	92	315	finally
    //   179	184	330	java/lang/Exception
    //   188	192	330	java/lang/Exception
    //   196	200	330	java/lang/Exception
    //   7	17	333	java/lang/Exception
    //   17	35	345	java/lang/Exception
    //   61	92	358	java/lang/Exception
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/utils/ZIPUtility.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */