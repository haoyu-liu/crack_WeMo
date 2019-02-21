package com.localytics.android;

import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.provider.BaseColumns;
import java.io.File;

class AnalyticsProvider
  extends BaseProvider
{
  static final int DATABASE_VERSION = 2;
  
  AnalyticsProvider(LocalyticsDao paramLocalyticsDao)
  {
    super(paramLocalyticsDao);
  }
  
  AnalyticsProvider(String paramString, LocalyticsDao paramLocalyticsDao)
  {
    super(paramLocalyticsDao);
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = DatapointHelper.getSha256_buggy(paramLocalyticsDao.getApiKey());
    arrayOfObject[1] = paramString;
    this.mDb = new AnalyticsDatabaseHelper(String.format("com.localytics.android.%s.%s.sqlite", arrayOfObject), 2, paramLocalyticsDao).getWritableDatabase();
  }
  
  boolean canAddToDB()
  {
    return new File(this.mDb.getPath()).length() < maxSiloDbSize();
  }
  
  long maxSiloDbSize()
  {
    return Constants.dbMaxSizeForAnalytics;
  }
  
  static class AnalyticsDatabaseHelper
    extends BaseProvider.LocalyticsDatabaseHelper
  {
    AnalyticsDatabaseHelper(String paramString, int paramInt, LocalyticsDao paramLocalyticsDao)
    {
      super(paramInt, paramLocalyticsDao);
    }
    
    protected void addFirstOpenEventToInfoTable(SQLiteDatabase paramSQLiteDatabase)
    {
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "info", "first_open_event_blob" }));
    }
    
    /* Error */
    protected void migrateV2ToV3(SQLiteDatabase paramSQLiteDatabase)
    {
      // Byte code:
      //   0: aload_1
      //   1: ldc 35
      //   3: iconst_4
      //   4: anewarray 14	java/lang/Object
      //   7: dup
      //   8: iconst_0
      //   9: ldc 37
      //   11: aastore
      //   12: dup
      //   13: iconst_1
      //   14: ldc 39
      //   16: aastore
      //   17: dup
      //   18: iconst_2
      //   19: ldc 41
      //   21: aastore
      //   22: dup
      //   23: iconst_3
      //   24: ldc 43
      //   26: aastore
      //   27: invokestatic 24	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
      //   30: invokevirtual 30	android/database/sqlite/SQLiteDatabase:execSQL	(Ljava/lang/String;)V
      //   33: aload_1
      //   34: ldc 45
      //   36: iconst_3
      //   37: anewarray 14	java/lang/Object
      //   40: dup
      //   41: iconst_0
      //   42: ldc 47
      //   44: aastore
      //   45: dup
      //   46: iconst_1
      //   47: ldc 49
      //   49: aastore
      //   50: dup
      //   51: iconst_2
      //   52: ldc 51
      //   54: aastore
      //   55: invokestatic 24	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
      //   58: invokevirtual 30	android/database/sqlite/SQLiteDatabase:execSQL	(Ljava/lang/String;)V
      //   61: aload_1
      //   62: ldc 45
      //   64: iconst_3
      //   65: anewarray 14	java/lang/Object
      //   68: dup
      //   69: iconst_0
      //   70: ldc 53
      //   72: aastore
      //   73: dup
      //   74: iconst_1
      //   75: ldc 55
      //   77: aastore
      //   78: dup
      //   79: iconst_2
      //   80: ldc 57
      //   82: aastore
      //   83: invokestatic 24	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
      //   86: invokevirtual 30	android/database/sqlite/SQLiteDatabase:execSQL	(Ljava/lang/String;)V
      //   89: aload_1
      //   90: ldc 59
      //   92: bipush 36
      //   94: anewarray 14	java/lang/Object
      //   97: dup
      //   98: iconst_0
      //   99: ldc 16
      //   101: aastore
      //   102: dup
      //   103: iconst_1
      //   104: ldc 39
      //   106: aastore
      //   107: dup
      //   108: iconst_2
      //   109: ldc 61
      //   111: aastore
      //   112: dup
      //   113: iconst_3
      //   114: ldc 63
      //   116: aastore
      //   117: dup
      //   118: iconst_4
      //   119: ldc 65
      //   121: aastore
      //   122: dup
      //   123: iconst_5
      //   124: ldc 65
      //   126: aastore
      //   127: dup
      //   128: bipush 6
      //   130: ldc 67
      //   132: aastore
      //   133: dup
      //   134: bipush 7
      //   136: ldc 67
      //   138: aastore
      //   139: dup
      //   140: bipush 8
      //   142: ldc 69
      //   144: aastore
      //   145: dup
      //   146: bipush 9
      //   148: ldc 71
      //   150: aastore
      //   151: dup
      //   152: bipush 10
      //   154: ldc 73
      //   156: aastore
      //   157: dup
      //   158: bipush 11
      //   160: ldc 73
      //   162: aastore
      //   163: dup
      //   164: bipush 12
      //   166: ldc 69
      //   168: aastore
      //   169: dup
      //   170: bipush 13
      //   172: ldc 71
      //   174: aastore
      //   175: dup
      //   176: bipush 14
      //   178: ldc 75
      //   180: aastore
      //   181: dup
      //   182: bipush 15
      //   184: ldc 77
      //   186: aastore
      //   187: dup
      //   188: bipush 16
      //   190: ldc 79
      //   192: aastore
      //   193: dup
      //   194: bipush 17
      //   196: ldc 81
      //   198: aastore
      //   199: dup
      //   200: bipush 18
      //   202: ldc 83
      //   204: aastore
      //   205: dup
      //   206: bipush 19
      //   208: ldc 85
      //   210: aastore
      //   211: dup
      //   212: bipush 20
      //   214: ldc 87
      //   216: aastore
      //   217: dup
      //   218: bipush 21
      //   220: ldc 89
      //   222: aastore
      //   223: dup
      //   224: bipush 22
      //   226: ldc 91
      //   228: aastore
      //   229: dup
      //   230: bipush 23
      //   232: ldc 93
      //   234: aastore
      //   235: dup
      //   236: bipush 24
      //   238: ldc 95
      //   240: aastore
      //   241: dup
      //   242: bipush 25
      //   244: ldc 97
      //   246: aastore
      //   247: dup
      //   248: bipush 26
      //   250: ldc 99
      //   252: aastore
      //   253: dup
      //   254: bipush 27
      //   256: ldc 99
      //   258: aastore
      //   259: dup
      //   260: bipush 28
      //   262: ldc 101
      //   264: aastore
      //   265: dup
      //   266: bipush 29
      //   268: ldc 101
      //   270: aastore
      //   271: dup
      //   272: bipush 30
      //   274: ldc 103
      //   276: aastore
      //   277: dup
      //   278: bipush 31
      //   280: ldc 103
      //   282: aastore
      //   283: dup
      //   284: bipush 32
      //   286: ldc 105
      //   288: aastore
      //   289: dup
      //   290: bipush 33
      //   292: ldc 105
      //   294: aastore
      //   295: dup
      //   296: bipush 34
      //   298: ldc 107
      //   300: aastore
      //   301: dup
      //   302: bipush 35
      //   304: ldc 109
      //   306: aastore
      //   307: invokestatic 24	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
      //   310: invokevirtual 30	android/database/sqlite/SQLiteDatabase:execSQL	(Ljava/lang/String;)V
      //   313: getstatic 113	com/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper:oldDB	Landroid/database/sqlite/SQLiteDatabase;
      //   316: ifnull +1547 -> 1863
      //   319: getstatic 113	com/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper:oldDB	Landroid/database/sqlite/SQLiteDatabase;
      //   322: astore_2
      //   323: aload_2
      //   324: monitorenter
      //   325: aconst_null
      //   326: astore_3
      //   327: new 115	android/content/ContentValues
      //   330: dup
      //   331: invokespecial 118	android/content/ContentValues:<init>	()V
      //   334: astore 4
      //   336: lconst_0
      //   337: lstore 5
      //   339: lconst_1
      //   340: lstore 7
      //   342: lconst_1
      //   343: lstore 9
      //   345: lconst_0
      //   346: lstore 11
      //   348: aconst_null
      //   349: astore 13
      //   351: getstatic 113	com/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper:oldDB	Landroid/database/sqlite/SQLiteDatabase;
      //   354: ldc 120
      //   356: aconst_null
      //   357: aconst_null
      //   358: aconst_null
      //   359: aconst_null
      //   360: aconst_null
      //   361: aconst_null
      //   362: invokevirtual 124	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
      //   365: astore_3
      //   366: aload_3
      //   367: invokeinterface 130 1 0
      //   372: istore 16
      //   374: aconst_null
      //   375: astore 17
      //   377: iconst_0
      //   378: istore 18
      //   380: aconst_null
      //   381: astore 19
      //   383: iload 16
      //   385: ifeq +103 -> 488
      //   388: aload_3
      //   389: ldc 61
      //   391: invokeinterface 134 2 0
      //   396: istore 20
      //   398: aload_3
      //   399: iload 20
      //   401: invokeinterface 138 2 0
      //   406: astore 17
      //   408: aload_3
      //   409: ldc 63
      //   411: invokeinterface 134 2 0
      //   416: istore 21
      //   418: aload_3
      //   419: iload 21
      //   421: invokeinterface 138 2 0
      //   426: astore 19
      //   428: aload_3
      //   429: ldc 65
      //   431: invokeinterface 134 2 0
      //   436: istore 22
      //   438: aload_3
      //   439: iload 22
      //   441: invokeinterface 142 2 0
      //   446: lstore 5
      //   448: aload_3
      //   449: ldc 67
      //   451: invokeinterface 134 2 0
      //   456: istore 23
      //   458: aload_3
      //   459: iload 23
      //   461: invokeinterface 146 2 0
      //   466: istore 24
      //   468: ldc 71
      //   470: invokestatic 152	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
      //   473: invokevirtual 156	java/lang/Integer:intValue	()I
      //   476: istore 25
      //   478: iload 24
      //   480: iload 25
      //   482: if_icmpne +154 -> 636
      //   485: iconst_1
      //   486: istore 18
      //   488: aload_3
      //   489: ifnull +11 -> 500
      //   492: aload_3
      //   493: invokeinterface 159 1 0
      //   498: aconst_null
      //   499: astore_3
      //   500: getstatic 113	com/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper:oldDB	Landroid/database/sqlite/SQLiteDatabase;
      //   503: ldc 47
      //   505: aconst_null
      //   506: aconst_null
      //   507: aconst_null
      //   508: aconst_null
      //   509: aconst_null
      //   510: aconst_null
      //   511: invokevirtual 124	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
      //   514: astore_3
      //   515: aload_3
      //   516: invokeinterface 162 1 0
      //   521: ifeq +136 -> 657
      //   524: aload_3
      //   525: ldc 49
      //   527: invokeinterface 134 2 0
      //   532: istore 80
      //   534: aload_3
      //   535: iload 80
      //   537: invokeinterface 138 2 0
      //   542: astore 81
      //   544: aload_3
      //   545: ldc 51
      //   547: invokeinterface 134 2 0
      //   552: istore 82
      //   554: aload_3
      //   555: iload 82
      //   557: invokeinterface 138 2 0
      //   562: astore 83
      //   564: aload 81
      //   566: ldc 81
      //   568: invokevirtual 166	java/lang/String:equals	(Ljava/lang/Object;)Z
      //   571: ifeq +7 -> 578
      //   574: aload 83
      //   576: astore 13
      //   578: aload 4
      //   580: ldc 49
      //   582: aload 81
      //   584: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   587: aload 4
      //   589: ldc 51
      //   591: aload 83
      //   593: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   596: aload_1
      //   597: ldc 47
      //   599: aconst_null
      //   600: aload 4
      //   602: invokevirtual 174	android/database/sqlite/SQLiteDatabase:insert	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
      //   605: pop2
      //   606: aload 4
      //   608: invokevirtual 177	android/content/ContentValues:clear	()V
      //   611: goto -96 -> 515
      //   614: astore 26
      //   616: aload_3
      //   617: ifnull +9 -> 626
      //   620: aload_3
      //   621: invokeinterface 159 1 0
      //   626: aload 26
      //   628: athrow
      //   629: astore 15
      //   631: aload_2
      //   632: monitorexit
      //   633: aload 15
      //   635: athrow
      //   636: iconst_0
      //   637: istore 18
      //   639: goto -151 -> 488
      //   642: astore 14
      //   644: aload_3
      //   645: ifnull +9 -> 654
      //   648: aload_3
      //   649: invokeinterface 159 1 0
      //   654: aload 14
      //   656: athrow
      //   657: aload_3
      //   658: ifnull +11 -> 669
      //   661: aload_3
      //   662: invokeinterface 159 1 0
      //   667: aconst_null
      //   668: astore_3
      //   669: getstatic 113	com/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper:oldDB	Landroid/database/sqlite/SQLiteDatabase;
      //   672: ldc 53
      //   674: aconst_null
      //   675: aconst_null
      //   676: aconst_null
      //   677: aconst_null
      //   678: aconst_null
      //   679: aconst_null
      //   680: invokevirtual 124	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
      //   683: astore_3
      //   684: aload_3
      //   685: invokeinterface 162 1 0
      //   690: ifeq +93 -> 783
      //   693: aload_3
      //   694: ldc 55
      //   696: invokeinterface 134 2 0
      //   701: istore 76
      //   703: aload 4
      //   705: ldc 55
      //   707: aload_3
      //   708: iload 76
      //   710: invokeinterface 138 2 0
      //   715: ldc -77
      //   717: ldc -75
      //   719: invokevirtual 185	java/lang/String:replace	(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
      //   722: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   725: aload_3
      //   726: ldc 57
      //   728: invokeinterface 134 2 0
      //   733: istore 77
      //   735: aload 4
      //   737: ldc 57
      //   739: aload_3
      //   740: iload 77
      //   742: invokeinterface 138 2 0
      //   747: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   750: aload_1
      //   751: ldc 53
      //   753: aconst_null
      //   754: aload 4
      //   756: invokevirtual 174	android/database/sqlite/SQLiteDatabase:insert	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
      //   759: pop2
      //   760: aload 4
      //   762: invokevirtual 177	android/content/ContentValues:clear	()V
      //   765: goto -81 -> 684
      //   768: astore 27
      //   770: aload_3
      //   771: ifnull +9 -> 780
      //   774: aload_3
      //   775: invokeinterface 159 1 0
      //   780: aload 27
      //   782: athrow
      //   783: aload_3
      //   784: ifnull +11 -> 795
      //   787: aload_3
      //   788: invokeinterface 159 1 0
      //   793: aconst_null
      //   794: astore_3
      //   795: aconst_null
      //   796: astore 28
      //   798: aconst_null
      //   799: astore 29
      //   801: aconst_null
      //   802: astore 30
      //   804: aload 17
      //   806: ifnull +45 -> 851
      //   809: getstatic 113	com/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper:oldDB	Landroid/database/sqlite/SQLiteDatabase;
      //   812: invokestatic 190	com/localytics/android/MigrationDatabaseHelper:preUploadBuildBlobs	(Landroid/database/sqlite/SQLiteDatabase;)V
      //   815: aconst_null
      //   816: astore 31
      //   818: aload_0
      //   819: getfield 194	com/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper:mLocalyticsDao	Lcom/localytics/android/LocalyticsDao;
      //   822: invokeinterface 200 1 0
      //   827: getstatic 113	com/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper:oldDB	Landroid/database/sqlite/SQLiteDatabase;
      //   830: aload 17
      //   832: invokestatic 204	com/localytics/android/MigrationDatabaseHelper:convertDatabaseToJson	(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Ljava/util/List;
      //   835: astore 32
      //   837: aload 32
      //   839: invokeinterface 209 1 0
      //   844: istore 33
      //   846: iload 33
      //   848: ifeq +508 -> 1356
      //   851: getstatic 113	com/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper:oldDB	Landroid/database/sqlite/SQLiteDatabase;
      //   854: ldc 16
      //   856: aconst_null
      //   857: aconst_null
      //   858: aconst_null
      //   859: aconst_null
      //   860: aconst_null
      //   861: aconst_null
      //   862: invokevirtual 124	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
      //   865: astore_3
      //   866: aload_3
      //   867: invokeinterface 130 1 0
      //   872: ifeq +468 -> 1340
      //   875: aload 4
      //   877: ldc 61
      //   879: aload 17
      //   881: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   884: aload 4
      //   886: ldc 63
      //   888: aload 19
      //   890: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   893: aload 4
      //   895: ldc 65
      //   897: lload 5
      //   899: invokestatic 214	java/lang/Long:valueOf	(J)Ljava/lang/Long;
      //   902: invokevirtual 217	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Long;)V
      //   905: aload 4
      //   907: ldc 67
      //   909: iload 18
      //   911: invokestatic 222	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
      //   914: invokevirtual 225	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Boolean;)V
      //   917: aload_3
      //   918: ldc 73
      //   920: invokeinterface 134 2 0
      //   925: istore 59
      //   927: aload 4
      //   929: ldc 73
      //   931: aload_3
      //   932: iload 59
      //   934: invokeinterface 146 2 0
      //   939: invokestatic 228	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
      //   942: invokevirtual 231	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
      //   945: aload_3
      //   946: ldc 75
      //   948: invokeinterface 134 2 0
      //   953: istore 60
      //   955: aload 4
      //   957: ldc 75
      //   959: aload_3
      //   960: iload 60
      //   962: invokeinterface 138 2 0
      //   967: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   970: aload_3
      //   971: ldc 77
      //   973: invokeinterface 134 2 0
      //   978: istore 61
      //   980: aload 4
      //   982: ldc 77
      //   984: aload_3
      //   985: iload 61
      //   987: invokeinterface 138 2 0
      //   992: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   995: aload_3
      //   996: ldc 79
      //   998: invokeinterface 134 2 0
      //   1003: istore 62
      //   1005: aload 4
      //   1007: ldc 79
      //   1009: aload_3
      //   1010: iload 62
      //   1012: invokeinterface 138 2 0
      //   1017: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   1020: aload 13
      //   1022: ifnull +736 -> 1758
      //   1025: aload 4
      //   1027: ldc 81
      //   1029: aload 13
      //   1031: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   1034: aload 4
      //   1036: ldc 83
      //   1038: ldc -23
      //   1040: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   1043: aload_3
      //   1044: ldc 85
      //   1046: invokeinterface 134 2 0
      //   1051: istore 63
      //   1053: aload 4
      //   1055: ldc 85
      //   1057: aload_3
      //   1058: iload 63
      //   1060: invokeinterface 138 2 0
      //   1065: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   1068: aload_3
      //   1069: ldc 87
      //   1071: invokeinterface 134 2 0
      //   1076: istore 64
      //   1078: aload 4
      //   1080: ldc 87
      //   1082: aload_3
      //   1083: iload 64
      //   1085: invokeinterface 138 2 0
      //   1090: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   1093: aload_3
      //   1094: ldc 89
      //   1096: invokeinterface 134 2 0
      //   1101: istore 65
      //   1103: aload 4
      //   1105: ldc 89
      //   1107: aload_3
      //   1108: iload 65
      //   1110: invokeinterface 138 2 0
      //   1115: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   1118: aload_3
      //   1119: ldc 91
      //   1121: invokeinterface 134 2 0
      //   1126: istore 66
      //   1128: aload 4
      //   1130: ldc 91
      //   1132: aload_3
      //   1133: iload 66
      //   1135: invokeinterface 138 2 0
      //   1140: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   1143: aload 4
      //   1145: ldc 95
      //   1147: aload_0
      //   1148: getfield 194	com/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper:mLocalyticsDao	Lcom/localytics/android/LocalyticsDao;
      //   1151: invokeinterface 200 1 0
      //   1156: invokestatic 239	com/localytics/android/DatapointHelper:getAppVersion	(Landroid/content/Context;)Ljava/lang/String;
      //   1159: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   1162: aload_3
      //   1163: ldc 93
      //   1165: invokeinterface 134 2 0
      //   1170: istore 67
      //   1172: aload 4
      //   1174: ldc 93
      //   1176: aload_3
      //   1177: iload 67
      //   1179: invokeinterface 138 2 0
      //   1184: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   1187: aload 4
      //   1189: ldc 97
      //   1191: aload 28
      //   1193: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   1196: aload_3
      //   1197: ldc 99
      //   1199: invokeinterface 134 2 0
      //   1204: istore 68
      //   1206: aload_3
      //   1207: iload 68
      //   1209: invokeinterface 142 2 0
      //   1214: lstore 69
      //   1216: aload 4
      //   1218: ldc 99
      //   1220: lload 69
      //   1222: invokestatic 214	java/lang/Long:valueOf	(J)Ljava/lang/Long;
      //   1225: invokevirtual 217	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Long;)V
      //   1228: aload 4
      //   1230: ldc 101
      //   1232: lload 11
      //   1234: invokestatic 214	java/lang/Long:valueOf	(J)Ljava/lang/Long;
      //   1237: invokevirtual 217	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Long;)V
      //   1240: aload 4
      //   1242: ldc 105
      //   1244: lconst_1
      //   1245: lload 7
      //   1247: ladd
      //   1248: invokestatic 214	java/lang/Long:valueOf	(J)Ljava/lang/Long;
      //   1251: invokevirtual 217	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Long;)V
      //   1254: aload 4
      //   1256: ldc 103
      //   1258: lconst_1
      //   1259: lload 9
      //   1261: ladd
      //   1262: invokestatic 214	java/lang/Long:valueOf	(J)Ljava/lang/Long;
      //   1265: invokevirtual 217	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Long;)V
      //   1268: lload 11
      //   1270: lload 69
      //   1272: lcmp
      //   1273: ifle +522 -> 1795
      //   1276: aload 4
      //   1278: ldc 107
      //   1280: aload 29
      //   1282: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   1285: aload 4
      //   1287: ldc 109
      //   1289: getstatic 245	com/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat:V2	Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;
      //   1292: invokevirtual 248	com/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat:getValue	()I
      //   1295: invokestatic 228	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
      //   1298: invokevirtual 231	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
      //   1301: aload 30
      //   1303: ifnull +22 -> 1325
      //   1306: aload_0
      //   1307: getfield 194	com/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper:mLocalyticsDao	Lcom/localytics/android/LocalyticsDao;
      //   1310: aload 30
      //   1312: ldc -6
      //   1314: invokevirtual 254	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
      //   1317: invokestatic 260	java/util/Arrays:asList	([Ljava/lang/Object;)Ljava/util/List;
      //   1320: invokeinterface 264 2 0
      //   1325: aload_1
      //   1326: ldc 16
      //   1328: aconst_null
      //   1329: aload 4
      //   1331: invokevirtual 174	android/database/sqlite/SQLiteDatabase:insert	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
      //   1334: pop2
      //   1335: aload 4
      //   1337: invokevirtual 177	android/content/ContentValues:clear	()V
      //   1340: aload_3
      //   1341: ifnull +9 -> 1350
      //   1344: aload_3
      //   1345: invokeinterface 159 1 0
      //   1350: invokestatic 267	com/localytics/android/AnalyticsProvider$AnalyticsDatabaseHelper:cleanUpOldDB	()V
      //   1353: aload_2
      //   1354: monitorexit
      //   1355: return
      //   1356: new 269	java/lang/StringBuilder
      //   1359: dup
      //   1360: invokespecial 270	java/lang/StringBuilder:<init>	()V
      //   1363: astore 34
      //   1365: aload 32
      //   1367: invokeinterface 274 1 0
      //   1372: astore 35
      //   1374: lload 7
      //   1376: lstore 36
      //   1378: aload 35
      //   1380: invokeinterface 279 1 0
      //   1385: ifeq +366 -> 1751
      //   1388: aload 35
      //   1390: invokeinterface 283 1 0
      //   1395: checkcast 285	org/json/JSONObject
      //   1398: astore 38
      //   1400: aload 38
      //   1402: ldc_w 287
      //   1405: invokevirtual 290	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
      //   1408: ldc_w 292
      //   1411: invokevirtual 166	java/lang/String:equals	(Ljava/lang/Object;)Z
      //   1414: ifeq +21 -> 1435
      //   1417: aload 31
      //   1419: ifnonnull +437 -> 1856
      //   1422: aload 38
      //   1424: ldc_w 294
      //   1427: invokevirtual 297	org/json/JSONObject:getLong	(Ljava/lang/String;)J
      //   1430: lstore 40
      //   1432: goto +432 -> 1864
      //   1435: lload 36
      //   1437: lconst_1
      //   1438: ladd
      //   1439: lstore 40
      //   1441: aload 31
      //   1443: ldc_w 294
      //   1446: lload 36
      //   1448: invokevirtual 300	org/json/JSONObject:put	(Ljava/lang/String;J)Lorg/json/JSONObject;
      //   1451: pop
      //   1452: invokestatic 306	java/util/UUID:randomUUID	()Ljava/util/UUID;
      //   1455: invokevirtual 310	java/util/UUID:toString	()Ljava/lang/String;
      //   1458: astore 44
      //   1460: aload 31
      //   1462: ldc_w 312
      //   1465: aload 44
      //   1467: invokevirtual 315	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
      //   1470: pop
      //   1471: aload 34
      //   1473: aload 31
      //   1475: invokevirtual 316	org/json/JSONObject:toString	()Ljava/lang/String;
      //   1478: invokevirtual 320	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   1481: ldc_w 322
      //   1484: invokevirtual 320	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   1487: aload 38
      //   1489: invokevirtual 316	org/json/JSONObject:toString	()Ljava/lang/String;
      //   1492: invokevirtual 320	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   1495: pop
      //   1496: aload 38
      //   1498: ldc_w 287
      //   1501: invokevirtual 290	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
      //   1504: ldc_w 324
      //   1507: invokevirtual 166	java/lang/String:equals	(Ljava/lang/Object;)Z
      //   1510: ifeq +163 -> 1673
      //   1513: aload 34
      //   1515: invokevirtual 325	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   1518: astore 50
      //   1520: ldc2_w 326
      //   1523: aload 38
      //   1525: ldc_w 329
      //   1528: invokevirtual 333	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
      //   1531: checkcast 211	java/lang/Long
      //   1534: invokevirtual 337	java/lang/Long:longValue	()J
      //   1537: lmul
      //   1538: lstore 51
      //   1540: aload 29
      //   1542: ifnull +338 -> 1880
      //   1545: new 115	android/content/ContentValues
      //   1548: dup
      //   1549: invokespecial 118	android/content/ContentValues:<init>	()V
      //   1552: astore 53
      //   1554: aload 53
      //   1556: ldc 43
      //   1558: getstatic 245	com/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat:V2	Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;
      //   1561: invokevirtual 248	com/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat:getValue	()I
      //   1564: invokestatic 228	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
      //   1567: invokevirtual 231	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
      //   1570: lload 51
      //   1572: lload 11
      //   1574: lcmp
      //   1575: ifle +76 -> 1651
      //   1578: aload 53
      //   1580: ldc 41
      //   1582: aload 29
      //   1584: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   1587: aload_1
      //   1588: ldc 37
      //   1590: aconst_null
      //   1591: aload 53
      //   1593: invokevirtual 174	android/database/sqlite/SQLiteDatabase:insert	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
      //   1596: pop2
      //   1597: aload 50
      //   1599: astore 29
      //   1601: lload 51
      //   1603: lstore 11
      //   1605: aload 38
      //   1607: ldc_w 339
      //   1610: invokevirtual 343	org/json/JSONObject:has	(Ljava/lang/String;)Z
      //   1613: ifeq +18 -> 1631
      //   1616: aload 38
      //   1618: ldc_w 339
      //   1621: invokevirtual 347	org/json/JSONObject:getJSONArray	(Ljava/lang/String;)Lorg/json/JSONArray;
      //   1624: ldc -6
      //   1626: invokevirtual 352	org/json/JSONArray:join	(Ljava/lang/String;)Ljava/lang/String;
      //   1629: astore 30
      //   1631: aload 4
      //   1633: invokevirtual 177	android/content/ContentValues:clear	()V
      //   1636: aload 34
      //   1638: iconst_0
      //   1639: aload 34
      //   1641: invokevirtual 355	java/lang/StringBuilder:length	()I
      //   1644: invokevirtual 359	java/lang/StringBuilder:delete	(II)Ljava/lang/StringBuilder;
      //   1647: pop
      //   1648: goto +220 -> 1868
      //   1651: aload 53
      //   1653: ldc 41
      //   1655: aload 50
      //   1657: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   1660: aload_1
      //   1661: ldc 37
      //   1663: aconst_null
      //   1664: aload 53
      //   1666: invokevirtual 174	android/database/sqlite/SQLiteDatabase:insert	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
      //   1669: pop2
      //   1670: goto -65 -> 1605
      //   1673: aload 38
      //   1675: ldc_w 287
      //   1678: invokevirtual 290	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
      //   1681: ldc_w 361
      //   1684: invokevirtual 166	java/lang/String:equals	(Ljava/lang/Object;)Z
      //   1687: ifeq +23 -> 1710
      //   1690: aload 38
      //   1692: ldc_w 363
      //   1695: invokevirtual 297	org/json/JSONObject:getLong	(Ljava/lang/String;)J
      //   1698: lstore 9
      //   1700: aload 38
      //   1702: ldc_w 312
      //   1705: invokevirtual 290	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
      //   1708: astore 28
      //   1710: aload 4
      //   1712: ldc 41
      //   1714: aload 34
      //   1716: invokevirtual 325	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   1719: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   1722: aload 4
      //   1724: ldc 43
      //   1726: getstatic 245	com/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat:V2	Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;
      //   1729: invokevirtual 248	com/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat:getValue	()I
      //   1732: invokestatic 228	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
      //   1735: invokevirtual 231	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
      //   1738: aload_1
      //   1739: ldc 37
      //   1741: aconst_null
      //   1742: aload 4
      //   1744: invokevirtual 174	android/database/sqlite/SQLiteDatabase:insert	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
      //   1747: pop2
      //   1748: goto -117 -> 1631
      //   1751: lload 36
      //   1753: lstore 7
      //   1755: goto -937 -> 818
      //   1758: aload 4
      //   1760: ldc 81
      //   1762: aload 19
      //   1764: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   1767: aload 4
      //   1769: ldc 83
      //   1771: ldc_w 365
      //   1774: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   1777: goto -734 -> 1043
      //   1780: astore 58
      //   1782: aload_3
      //   1783: ifnull +9 -> 1792
      //   1786: aload_3
      //   1787: invokeinterface 159 1 0
      //   1792: aload 58
      //   1794: athrow
      //   1795: aload 29
      //   1797: ifnull -472 -> 1325
      //   1800: new 115	android/content/ContentValues
      //   1803: dup
      //   1804: invokespecial 118	android/content/ContentValues:<init>	()V
      //   1807: astore 73
      //   1809: aload 73
      //   1811: ldc 41
      //   1813: aload 29
      //   1815: invokevirtual 170	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
      //   1818: aload 73
      //   1820: ldc 43
      //   1822: getstatic 245	com/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat:V2	Lcom/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat;
      //   1825: invokevirtual 248	com/localytics/android/AnalyticsProvider$EventsV3Columns$UploadFormat:getValue	()I
      //   1828: invokestatic 228	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
      //   1831: invokevirtual 231	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
      //   1834: aload_1
      //   1835: ldc 37
      //   1837: aconst_null
      //   1838: aload 73
      //   1840: invokevirtual 174	android/database/sqlite/SQLiteDatabase:insert	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
      //   1843: pop2
      //   1844: goto -519 -> 1325
      //   1847: astore 39
      //   1849: lload 36
      //   1851: lstore 40
      //   1853: goto +15 -> 1868
      //   1856: lload 36
      //   1858: lstore 40
      //   1860: goto +4 -> 1864
      //   1863: return
      //   1864: aload 38
      //   1866: astore 31
      //   1868: lload 40
      //   1870: lstore 36
      //   1872: goto -494 -> 1378
      //   1875: astore 42
      //   1877: goto -9 -> 1868
      //   1880: aload 50
      //   1882: astore 29
      //   1884: lload 51
      //   1886: lstore 11
      //   1888: goto -283 -> 1605
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	1891	0	this	AnalyticsDatabaseHelper
      //   0	1891	1	paramSQLiteDatabase	SQLiteDatabase
      //   322	1032	2	localSQLiteDatabase	SQLiteDatabase
      //   326	1461	3	localCursor	android.database.Cursor
      //   334	1434	4	localContentValues1	android.content.ContentValues
      //   337	561	5	l1	long
      //   340	1414	7	l2	long
      //   343	1356	9	l3	long
      //   346	1541	11	l4	long
      //   349	681	13	localObject1	Object
      //   642	13	14	localObject2	Object
      //   629	5	15	localObject3	Object
      //   372	12	16	bool1	boolean
      //   375	505	17	str1	String
      //   378	532	18	bool2	boolean
      //   381	1382	19	str2	String
      //   396	4	20	i	int
      //   416	4	21	j	int
      //   436	4	22	k	int
      //   456	4	23	m	int
      //   466	17	24	n	int
      //   476	7	25	i1	int
      //   614	13	26	localObject4	Object
      //   768	13	27	localObject5	Object
      //   796	913	28	str3	String
      //   799	1084	29	localObject6	Object
      //   802	828	30	str4	String
      //   816	1051	31	localObject7	Object
      //   835	531	32	localList	java.util.List
      //   844	3	33	bool3	boolean
      //   1363	352	34	localStringBuilder	StringBuilder
      //   1372	17	35	localIterator	java.util.Iterator
      //   1376	495	36	l5	long
      //   1398	467	38	localJSONObject	org.json.JSONObject
      //   1847	1	39	localException1	Exception
      //   1430	439	40	l6	long
      //   1875	1	42	localException2	Exception
      //   1458	8	44	str5	String
      //   1518	363	50	str6	String
      //   1538	347	51	l7	long
      //   1552	113	53	localContentValues2	android.content.ContentValues
      //   1780	13	58	localObject8	Object
      //   925	8	59	i2	int
      //   953	8	60	i3	int
      //   978	8	61	i4	int
      //   1003	8	62	i5	int
      //   1051	8	63	i6	int
      //   1076	8	64	i7	int
      //   1101	8	65	i8	int
      //   1126	8	66	i9	int
      //   1170	8	67	i10	int
      //   1204	4	68	i11	int
      //   1214	57	69	l8	long
      //   1807	32	73	localContentValues3	android.content.ContentValues
      //   701	8	76	i12	int
      //   733	8	77	i13	int
      //   532	4	80	i14	int
      //   542	41	81	str7	String
      //   552	4	82	i15	int
      //   562	30	83	str8	String
      // Exception table:
      //   from	to	target	type
      //   500	515	614	finally
      //   515	574	614	finally
      //   578	611	614	finally
      //   327	336	629	finally
      //   492	498	629	finally
      //   620	626	629	finally
      //   626	629	629	finally
      //   631	633	629	finally
      //   648	654	629	finally
      //   654	657	629	finally
      //   661	667	629	finally
      //   774	780	629	finally
      //   780	783	629	finally
      //   787	793	629	finally
      //   809	815	629	finally
      //   818	846	629	finally
      //   1344	1350	629	finally
      //   1350	1355	629	finally
      //   1356	1374	629	finally
      //   1378	1400	629	finally
      //   1400	1417	629	finally
      //   1422	1432	629	finally
      //   1441	1540	629	finally
      //   1545	1570	629	finally
      //   1578	1597	629	finally
      //   1605	1631	629	finally
      //   1631	1648	629	finally
      //   1651	1670	629	finally
      //   1673	1710	629	finally
      //   1710	1748	629	finally
      //   1786	1792	629	finally
      //   1792	1795	629	finally
      //   351	374	642	finally
      //   388	478	642	finally
      //   669	684	768	finally
      //   684	765	768	finally
      //   851	1020	1780	finally
      //   1025	1043	1780	finally
      //   1043	1268	1780	finally
      //   1276	1301	1780	finally
      //   1306	1325	1780	finally
      //   1325	1340	1780	finally
      //   1758	1777	1780	finally
      //   1800	1844	1780	finally
      //   1400	1417	1847	java/lang/Exception
      //   1422	1432	1847	java/lang/Exception
      //   1441	1540	1875	java/lang/Exception
      //   1545	1570	1875	java/lang/Exception
      //   1578	1597	1875	java/lang/Exception
      //   1605	1631	1875	java/lang/Exception
      //   1631	1648	1875	java/lang/Exception
      //   1651	1670	1875	java/lang/Exception
      //   1673	1710	1875	java/lang/Exception
      //   1710	1748	1875	java/lang/Exception
    }
    
    public void onCreate(SQLiteDatabase paramSQLiteDatabase)
    {
      if (paramSQLiteDatabase == null) {
        throw new IllegalArgumentException("db cannot be null");
      }
      paramSQLiteDatabase.execSQL("PRAGMA auto_vacuum = INCREMENTAL;");
      onUpgrade(paramSQLiteDatabase, 0, 2);
    }
    
    public void onOpen(SQLiteDatabase paramSQLiteDatabase)
    {
      super.onOpen(paramSQLiteDatabase);
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = DatabaseUtils.stringForQuery(paramSQLiteDatabase, "select sqlite_version()", null);
      Localytics.Log.v(String.format("SQLite library version is: %s", arrayOfObject));
      if (!paramSQLiteDatabase.isReadOnly()) {
        paramSQLiteDatabase.execSQL("PRAGMA foreign_keys = ON;");
      }
    }
    
    public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
    {
      if (paramInt1 < 1) {
        migrateV2ToV3(paramSQLiteDatabase);
      }
      if (paramInt1 < 2) {
        addFirstOpenEventToInfoTable(paramSQLiteDatabase);
      }
    }
  }
  
  static final class CustomDimensionsV3Columns
    implements BaseColumns
  {
    static final String CUSTOM_DIMENSION_KEY = "custom_dimension_key";
    static final String CUSTOM_DIMENSION_VALUE = "custom_dimension_value";
    static final String TABLE_NAME = "custom_dimensions";
    
    private CustomDimensionsV3Columns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class EventsV3Columns
    implements BaseColumns
  {
    static final String BLOB = "blob";
    static final String TABLE_NAME = "events";
    static final String UPLOAD_FORMAT = "upload_format";
    
    private EventsV3Columns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
    
    static enum UploadFormat
    {
      private final int value;
      
      static
      {
        UploadFormat[] arrayOfUploadFormat = new UploadFormat[2];
        arrayOfUploadFormat[0] = V2;
        arrayOfUploadFormat[1] = V3;
        $VALUES = arrayOfUploadFormat;
      }
      
      private UploadFormat(int paramInt)
      {
        this.value = paramInt;
      }
      
      public int getValue()
      {
        return this.value;
      }
    }
  }
  
  static final class IdentifiersV3Columns
    implements BaseColumns
  {
    static final String KEY = "key";
    static final String TABLE_NAME = "identifiers";
    static final String VALUE = "value";
    
    IdentifiersV3Columns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class InfoV3Columns
    implements BaseColumns
  {
    static final String API_KEY = "api_key";
    static final String APP_VERSION = "app_version";
    static final String CREATED_TIME = "created_time";
    static final String CURRENT_SESSION_UUID = "current_session_uuid";
    static final String CUSTOMER_ID = "customer_id";
    static final String FB_ATTRIBUTION = "fb_attribution";
    static final String FIRST_ADVERTISING_ID = "first_advertising_id";
    static final String FIRST_ANDROID_ID = "first_android_id";
    static final String FIRST_OPEN_EVENT_BLOB = "first_open_event_blob";
    static final String LAST_SESSION_CLOSE_TIME = "last_session_close_time";
    static final String LAST_SESSION_OPEN_TIME = "last_session_open_time";
    static final String NEXT_HEADER_NUMBER = "next_header_number";
    static final String NEXT_SESSION_NUMBER = "next_session_number";
    static final String OPT_OUT = "opt_out";
    static final String PACKAGE_NAME = "package_name";
    static final String PLAY_ATTRIBUTION = "play_attribution";
    static final String PUSH_DISABLED = "push_disabled";
    static final String QUEUED_CLOSE_SESSION_BLOB = "queued_close_session_blob";
    static final String QUEUED_CLOSE_SESSION_BLOB_UPLOAD_FORMAT = "queued_close_session_blob_upload_format";
    static final String REGISTRATION_ID = "registration_id";
    static final String REGISTRATION_VERSION = "registration_version";
    static final String SENDER_ID = "sender_id";
    static final String TABLE_NAME = "info";
    static final String USER_TYPE = "user_type";
    static final String UUID = "uuid";
    
    private InfoV3Columns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/AnalyticsProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */