package com.localytics.android;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.CursorJoiner;
import android.database.CursorJoiner.Result;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.provider.BaseColumns;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.UUID;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

final class MigrationDatabaseHelper
  extends SQLiteOpenHelper
{
  private static final String CLOSE_EVENT;
  private static final String EVENTS_SORT_ORDER;
  private static final String EVENT_FORMAT = "%s:%s";
  private static final String FLOW_EVENT;
  private static final String[] JOINER_ARG_UPLOAD_EVENTS_COLUMNS;
  private static final String OPEN_EVENT = String.format("%s:%s", new Object[] { "com.localytics.android", "open" });
  private static final String OPT_IN_EVENT;
  private static final String OPT_OUT_EVENT;
  private static final String[] PROJECTION_UPLOAD_BLOBS;
  private static final String[] PROJECTION_UPLOAD_EVENTS = { "_id", "event_name", "wall_time" };
  private static final String SELECTION_UPLOAD_NULL_BLOBS;
  private static final String UPLOAD_BLOBS_EVENTS_SORT_ORDER;
  private LocalyticsDao mLocalyticsDao;
  
  static
  {
    CLOSE_EVENT = String.format("%s:%s", new Object[] { "com.localytics.android", "close" });
    OPT_IN_EVENT = String.format("%s:%s", new Object[] { "com.localytics.android", "opt_in" });
    OPT_OUT_EVENT = String.format("%s:%s", new Object[] { "com.localytics.android", "opt_out" });
    FLOW_EVENT = String.format("%s:%s", new Object[] { "com.localytics.android", "flow" });
    EVENTS_SORT_ORDER = String.format("CAST(%s as TEXT)", new Object[] { "_id" });
    PROJECTION_UPLOAD_BLOBS = new String[] { "events_key_ref" };
    UPLOAD_BLOBS_EVENTS_SORT_ORDER = String.format("CAST(%s AS TEXT)", new Object[] { "events_key_ref" });
    JOINER_ARG_UPLOAD_EVENTS_COLUMNS = new String[] { "_id" };
    SELECTION_UPLOAD_NULL_BLOBS = String.format("%s IS NULL", new Object[] { "processed_in_blob" });
  }
  
  MigrationDatabaseHelper(String paramString, int paramInt, LocalyticsDao paramLocalyticsDao)
  {
    super(paramLocalyticsDao.getAppContext(), paramString, null, paramInt);
    this.mLocalyticsDao = paramLocalyticsDao;
  }
  
  private static JSONObject convertAttributesToJson(SQLiteDatabase paramSQLiteDatabase, Context paramContext, long paramLong)
    throws JSONException
  {
    Cursor localCursor = null;
    JSONObject localJSONObject;
    try
    {
      String str1 = String.format("%s = ? AND %s != ? AND %s != ? AND %s != ? AND %s != ? AND %s != ? AND %s != ? AND %s != ? AND %s != ? AND %s != ? AND %s != ?", new Object[] { "events_key_ref", "attribute_key", "attribute_key", "attribute_key", "attribute_key", "attribute_key", "attribute_key", "attribute_key", "attribute_key", "attribute_key", "attribute_key" });
      String[] arrayOfString = new String[11];
      arrayOfString[0] = Long.toString(paramLong);
      arrayOfString[1] = AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_1;
      arrayOfString[2] = AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_2;
      arrayOfString[3] = AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_3;
      arrayOfString[4] = AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_4;
      arrayOfString[5] = AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_5;
      arrayOfString[6] = AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_6;
      arrayOfString[7] = AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_7;
      arrayOfString[8] = AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_8;
      arrayOfString[9] = AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_9;
      arrayOfString[10] = AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_10;
      localCursor = paramSQLiteDatabase.query("attributes", null, str1, arrayOfString, null, null, null);
      int i = localCursor.getCount();
      if (i == 0) {
        localJSONObject = null;
      }
      do
      {
        return localJSONObject;
        localJSONObject = new JSONObject();
        int j = localCursor.getColumnIndexOrThrow("attribute_key");
        int k = localCursor.getColumnIndexOrThrow("attribute_value");
        while (localCursor.moveToNext())
        {
          String str2 = localCursor.getString(j);
          String str3 = localCursor.getString(k);
          localJSONObject.put(str2.substring(1 + paramContext.getPackageName().length(), str2.length()), str3);
        }
      } while (localCursor == null);
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
    localCursor.close();
    return localJSONObject;
  }
  
  /* Error */
  static java.util.List<JSONObject> convertDatabaseToJson(Context paramContext, SQLiteDatabase paramSQLiteDatabase, String paramString)
  {
    // Byte code:
    //   0: new 196	java/util/LinkedList
    //   3: dup
    //   4: invokespecial 197	java/util/LinkedList:<init>	()V
    //   7: astore_3
    //   8: aconst_null
    //   9: astore 4
    //   11: aload_1
    //   12: ldc -57
    //   14: aconst_null
    //   15: aconst_null
    //   16: aconst_null
    //   17: aconst_null
    //   18: aconst_null
    //   19: aconst_null
    //   20: invokevirtual 149	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   23: astore 4
    //   25: aload_1
    //   26: aload_2
    //   27: invokestatic 203	com/localytics/android/MigrationDatabaseHelper:getApiKeyCreationTime	(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)J
    //   30: lstore 6
    //   32: aload 4
    //   34: ldc 58
    //   36: invokeinterface 165 2 0
    //   41: istore 8
    //   43: aload 4
    //   45: ldc -51
    //   47: invokeinterface 165 2 0
    //   52: istore 9
    //   54: aload 4
    //   56: invokeinterface 171 1 0
    //   61: istore 10
    //   63: iload 10
    //   65: ifeq +91 -> 156
    //   68: new 159	org/json/JSONObject
    //   71: dup
    //   72: invokespecial 161	org/json/JSONObject:<init>	()V
    //   75: astore 13
    //   77: aload 13
    //   79: ldc -49
    //   81: ldc -47
    //   83: invokevirtual 192	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   86: pop
    //   87: aload 13
    //   89: ldc -45
    //   91: lload 6
    //   93: invokevirtual 214	org/json/JSONObject:put	(Ljava/lang/String;J)Lorg/json/JSONObject;
    //   96: pop
    //   97: aload 13
    //   99: ldc -40
    //   101: aload 4
    //   103: iload 8
    //   105: invokeinterface 220 2 0
    //   110: invokevirtual 214	org/json/JSONObject:put	(Ljava/lang/String;J)Lorg/json/JSONObject;
    //   113: pop
    //   114: aload 13
    //   116: ldc -34
    //   118: aload 4
    //   120: iload 9
    //   122: invokeinterface 175 2 0
    //   127: invokevirtual 192	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   130: pop
    //   131: aload_1
    //   132: aload_2
    //   133: aload_1
    //   134: aload 4
    //   136: iload 8
    //   138: invokeinterface 220 2 0
    //   143: invokestatic 226	com/localytics/android/MigrationDatabaseHelper:getSessionIdForBlobId	(Landroid/database/sqlite/SQLiteDatabase;J)J
    //   146: invokestatic 230	com/localytics/android/MigrationDatabaseHelper:getAttributesFromSession	(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;J)Lorg/json/JSONObject;
    //   149: astore 20
    //   151: aload 20
    //   153: ifnonnull +42 -> 195
    //   156: aload 4
    //   158: ifnull +10 -> 168
    //   161: aload 4
    //   163: invokeinterface 157 1 0
    //   168: iconst_1
    //   169: anewarray 26	java/lang/Object
    //   172: astore 11
    //   174: aload 11
    //   176: iconst_0
    //   177: aload_3
    //   178: invokevirtual 232	java/lang/Object:toString	()Ljava/lang/String;
    //   181: aastore
    //   182: ldc -22
    //   184: aload 11
    //   186: invokestatic 36	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   189: invokestatic 239	com/localytics/android/Localytics$Log:v	(Ljava/lang/String;)I
    //   192: pop
    //   193: aload_3
    //   194: areturn
    //   195: aload 13
    //   197: ldc -15
    //   199: aload 20
    //   201: invokevirtual 192	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   204: pop
    //   205: aload_1
    //   206: invokestatic 245	com/localytics/android/MigrationDatabaseHelper:getIdentifiers	(Landroid/database/sqlite/SQLiteDatabase;)Lorg/json/JSONObject;
    //   209: astore 22
    //   211: aload 22
    //   213: ifnull +13 -> 226
    //   216: aload 13
    //   218: ldc -9
    //   220: aload 22
    //   222: invokevirtual 192	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   225: pop
    //   226: aload_3
    //   227: aload 13
    //   229: invokeinterface 253 2 0
    //   234: pop
    //   235: aload_3
    //   236: invokevirtual 232	java/lang/Object:toString	()Ljava/lang/String;
    //   239: invokestatic 256	com/localytics/android/Localytics$Log:w	(Ljava/lang/String;)I
    //   242: pop
    //   243: aconst_null
    //   244: astore 26
    //   246: iconst_2
    //   247: anewarray 32	java/lang/String
    //   250: dup
    //   251: iconst_0
    //   252: ldc 58
    //   254: aastore
    //   255: dup
    //   256: iconst_1
    //   257: ldc 62
    //   259: aastore
    //   260: astore 27
    //   262: ldc_w 258
    //   265: iconst_1
    //   266: anewarray 26	java/lang/Object
    //   269: dup
    //   270: iconst_0
    //   271: ldc_w 260
    //   274: aastore
    //   275: invokestatic 36	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   278: astore 29
    //   280: iconst_1
    //   281: anewarray 32	java/lang/String
    //   284: astore 30
    //   286: aload 30
    //   288: iconst_0
    //   289: aload 4
    //   291: iload 8
    //   293: invokeinterface 220 2 0
    //   298: invokestatic 109	java/lang/Long:toString	(J)Ljava/lang/String;
    //   301: aastore
    //   302: aload_1
    //   303: ldc_w 262
    //   306: aload 27
    //   308: aload 29
    //   310: aload 30
    //   312: aconst_null
    //   313: aconst_null
    //   314: ldc 62
    //   316: invokevirtual 149	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   319: astore 26
    //   321: aload 26
    //   323: ldc 62
    //   325: invokeinterface 165 2 0
    //   330: istore 31
    //   332: aload 26
    //   334: invokeinterface 171 1 0
    //   339: ifeq +154 -> 493
    //   342: aload_3
    //   343: invokeinterface 265 1 0
    //   348: bipush 100
    //   350: if_icmpge +143 -> 493
    //   353: aload_3
    //   354: aload_1
    //   355: aload_0
    //   356: aload 26
    //   358: iload 31
    //   360: invokeinterface 220 2 0
    //   365: aload 4
    //   367: iload 8
    //   369: invokeinterface 220 2 0
    //   374: aload_2
    //   375: invokestatic 269	com/localytics/android/MigrationDatabaseHelper:convertEventToJson	(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/Context;JJLjava/lang/String;)Lorg/json/JSONObject;
    //   378: invokeinterface 253 2 0
    //   383: pop
    //   384: ldc_w 258
    //   387: iconst_1
    //   388: anewarray 26	java/lang/Object
    //   391: dup
    //   392: iconst_0
    //   393: ldc 58
    //   395: aastore
    //   396: invokestatic 36	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   399: astore 33
    //   401: iconst_1
    //   402: anewarray 32	java/lang/String
    //   405: astore 34
    //   407: aload 34
    //   409: iconst_0
    //   410: aload 26
    //   412: aload 26
    //   414: ldc 58
    //   416: invokeinterface 165 2 0
    //   421: invokeinterface 273 2 0
    //   426: invokestatic 277	java/lang/Integer:toString	(I)Ljava/lang/String;
    //   429: aastore
    //   430: aload_1
    //   431: ldc_w 262
    //   434: aload 33
    //   436: aload 34
    //   438: invokevirtual 281	android/database/sqlite/SQLiteDatabase:delete	(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    //   441: pop
    //   442: goto -110 -> 332
    //   445: astore 28
    //   447: aload 26
    //   449: ifnull +10 -> 459
    //   452: aload 26
    //   454: invokeinterface 157 1 0
    //   459: aload 28
    //   461: athrow
    //   462: astore 14
    //   464: ldc_w 283
    //   467: aload 14
    //   469: invokestatic 286	com/localytics/android/Localytics$Log:w	(Ljava/lang/String;Ljava/lang/Throwable;)I
    //   472: pop
    //   473: goto -419 -> 54
    //   476: astore 5
    //   478: aload 4
    //   480: ifnull +10 -> 490
    //   483: aload 4
    //   485: invokeinterface 157 1 0
    //   490: aload 5
    //   492: athrow
    //   493: aload 26
    //   495: ifnull -441 -> 54
    //   498: aload 26
    //   500: invokeinterface 157 1 0
    //   505: goto -451 -> 54
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	508	0	paramContext	Context
    //   0	508	1	paramSQLiteDatabase	SQLiteDatabase
    //   0	508	2	paramString	String
    //   7	347	3	localLinkedList	java.util.LinkedList
    //   9	475	4	localCursor1	Cursor
    //   476	15	5	localObject1	Object
    //   30	62	6	l	long
    //   41	327	8	i	int
    //   52	69	9	j	int
    //   61	3	10	bool	boolean
    //   172	13	11	arrayOfObject	Object[]
    //   75	153	13	localJSONObject1	JSONObject
    //   462	6	14	localJSONException	JSONException
    //   149	51	20	localJSONObject2	JSONObject
    //   209	12	22	localJSONObject3	JSONObject
    //   244	255	26	localCursor2	Cursor
    //   260	47	27	arrayOfString1	String[]
    //   445	15	28	localObject2	Object
    //   278	31	29	str1	String
    //   284	27	30	arrayOfString2	String[]
    //   330	29	31	k	int
    //   399	36	33	str2	String
    //   405	32	34	arrayOfString3	String[]
    // Exception table:
    //   from	to	target	type
    //   246	332	445	finally
    //   332	442	445	finally
    //   68	151	462	org/json/JSONException
    //   195	211	462	org/json/JSONException
    //   216	226	462	org/json/JSONException
    //   226	243	462	org/json/JSONException
    //   452	459	462	org/json/JSONException
    //   459	462	462	org/json/JSONException
    //   498	505	462	org/json/JSONException
    //   11	54	476	finally
    //   54	63	476	finally
    //   68	151	476	finally
    //   195	211	476	finally
    //   216	226	476	finally
    //   226	243	476	finally
    //   452	459	476	finally
    //   459	462	476	finally
    //   464	473	476	finally
    //   498	505	476	finally
  }
  
  private static JSONObject convertEventToJson(SQLiteDatabase paramSQLiteDatabase, Context paramContext, long paramLong1, long paramLong2, String paramString)
    throws JSONException
  {
    JSONObject localJSONObject1 = new JSONObject();
    Cursor localCursor1 = null;
    String str2;
    long l1;
    String str3;
    long l2;
    Cursor localCursor7;
    for (;;)
    {
      String str21;
      String str22;
      try
      {
        String str1 = String.format("%s = ?", new Object[] { "_id" });
        String[] arrayOfString1 = new String[1];
        arrayOfString1[0] = Long.toString(paramLong1);
        localCursor1 = paramSQLiteDatabase.query("events", null, str1, arrayOfString1, null, null, "_id");
        if (!localCursor1.moveToFirst()) {
          break label3480;
        }
        int i = localCursor1.getColumnIndexOrThrow("event_name");
        str2 = localCursor1.getString(i);
        l1 = getSessionIdForEventId(paramSQLiteDatabase, paramLong1);
        str3 = getSessionUuid(paramSQLiteDatabase, l1);
        l2 = getSessionStartTime(paramSQLiteDatabase, l1);
        if (!OPEN_EVENT.equals(str2)) {
          break label940;
        }
        localJSONObject1.put("dt", "s");
        int i33 = localCursor1.getColumnIndex("wall_time");
        localJSONObject1.put("ct", Math.round(localCursor1.getLong(i33) / 1000.0D));
        localJSONObject1.put("u", str3);
        long l5 = getElapsedTimeSinceLastSession(paramSQLiteDatabase, l1);
        if (l5 > 0L) {
          localJSONObject1.put("sl", Math.round((float)(l5 / 1000L)));
        }
        localJSONObject1.put("nth", l1);
        int i34 = localCursor1.getColumnIndexOrThrow("event_lat");
        if (!localCursor1.isNull(i34))
        {
          int i42 = localCursor1.getColumnIndexOrThrow("event_lng");
          if (!localCursor1.isNull(i42))
          {
            int i43 = localCursor1.getColumnIndexOrThrow("event_lat");
            double d5 = localCursor1.getDouble(i43);
            int i44 = localCursor1.getColumnIndexOrThrow("event_lng");
            double d6 = localCursor1.getDouble(i44);
            if ((d5 != 0.0D) && (d6 != 0.0D))
            {
              localJSONObject1.put("lat", d5);
              localJSONObject1.put("lng", d6);
            }
          }
        }
        int i35 = localCursor1.getColumnIndexOrThrow("customer_id");
        if (!localCursor1.isNull(i35))
        {
          int i40 = localCursor1.getColumnIndexOrThrow("customer_id");
          String str23 = localCursor1.getString(i40);
          int i41 = localCursor1.getColumnIndexOrThrow("user_type");
          String str24 = localCursor1.getString(i41);
          localJSONObject1.put("cid", str23);
          localJSONObject1.put("utp", str24);
        }
        int i36 = localCursor1.getColumnIndexOrThrow("ids");
        if (!localCursor1.isNull(i36))
        {
          int i39 = localCursor1.getColumnIndexOrThrow("ids");
          localJSONObject1.put("ids", new JSONObject(localCursor1.getString(i39)));
        }
        localCursor7 = null;
        try
        {
          String str20 = String.format("%s = ?", new Object[] { "events_key_ref" });
          String[] arrayOfString10 = new String[1];
          arrayOfString10[0] = Long.toString(paramLong1);
          localCursor7 = paramSQLiteDatabase.query("attributes", null, str20, arrayOfString10, null, null, null);
          int i37 = localCursor7.getColumnIndexOrThrow("attribute_key");
          int i38 = localCursor7.getColumnIndexOrThrow("attribute_value");
          if (!localCursor7.moveToNext()) {
            break;
          }
          str21 = localCursor7.getString(i37);
          str22 = localCursor7.getString(i38);
          if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_1.equals(str21))
          {
            localJSONObject1.put(getCustomDimensionKey(1), str22);
            continue;
            localObject1 = finally;
          }
        }
        finally {}
        if (!AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_2.equals(str21)) {
          break label700;
        }
      }
      finally
      {
        if (localCursor1 != null) {
          localCursor1.close();
        }
      }
      localJSONObject1.put(getCustomDimensionKey(2), str22);
      continue;
      label700:
      if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_3.equals(str21)) {
        localJSONObject1.put(getCustomDimensionKey(3), str22);
      } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_4.equals(str21)) {
        localJSONObject1.put(getCustomDimensionKey(4), str22);
      } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_5.equals(str21)) {
        localJSONObject1.put(getCustomDimensionKey(5), str22);
      } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_6.equals(str21)) {
        localJSONObject1.put(getCustomDimensionKey(6), str22);
      } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_7.equals(str21)) {
        localJSONObject1.put(getCustomDimensionKey(7), str22);
      } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_8.equals(str21)) {
        localJSONObject1.put(getCustomDimensionKey(8), str22);
      } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_9.equals(str21)) {
        localJSONObject1.put(getCustomDimensionKey(9), str22);
      } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_10.equals(str21)) {
        localJSONObject1.put(getCustomDimensionKey(10), str22);
      }
    }
    if (localCursor7 != null) {
      localCursor7.close();
    }
    for (;;)
    {
      if (localCursor1 != null) {
        localCursor1.close();
      }
      return localJSONObject1;
      label940:
      if (CLOSE_EVENT.equals(str2))
      {
        localJSONObject1.put("dt", "c");
        int i16 = localCursor1.getColumnIndexOrThrow("uuid");
        localJSONObject1.put("u", localCursor1.getString(i16));
        localJSONObject1.put("su", str3);
        localJSONObject1.put("ss", Math.round(l2 / 1000.0D));
        int i17 = localCursor1.getColumnIndex("wall_time");
        localJSONObject1.put("ct", Math.round(localCursor1.getLong(i17) / 1000.0D));
        Cursor localCursor4 = null;
        Cursor localCursor5;
        JSONArray localJSONArray3;
        try
        {
          String[] arrayOfString5 = { "session_start_wall_time" };
          String str13 = String.format("%s = ?", new Object[] { "_id" });
          String[] arrayOfString6 = new String[1];
          int i18 = localCursor1.getColumnIndexOrThrow("session_key_ref");
          arrayOfString6[0] = Long.toString(localCursor1.getLong(i18));
          localCursor4 = paramSQLiteDatabase.query("sessions", arrayOfString5, str13, arrayOfString6, null, null, null);
          if (localCursor4.moveToFirst())
          {
            int i19 = localCursor1.getColumnIndex("wall_time");
            long l4 = Math.round(localCursor1.getLong(i19) / 1000.0D);
            int i20 = localCursor4.getColumnIndexOrThrow("session_start_wall_time");
            localJSONObject1.put("ctl", l4 - Math.round(localCursor4.getLong(i20) / 1000.0D));
            if (localCursor4 != null) {
              localCursor4.close();
            }
            localCursor5 = null;
            try
            {
              String[] arrayOfString7 = { "name" };
              String str14 = String.format("%s = ? AND %s = ?", new Object[] { "session_key_ref", "type" });
              String[] arrayOfString8 = new String[2];
              arrayOfString8[0] = Long.toString(l1);
              arrayOfString8[1] = Integer.toString(1);
              localCursor5 = paramSQLiteDatabase.query("event_history", arrayOfString7, str14, arrayOfString8, null, null, "_id");
              localJSONArray3 = new JSONArray();
              while (localCursor5.moveToNext())
              {
                int i32 = localCursor5.getColumnIndexOrThrow("name");
                localJSONArray3.put(localCursor5.getString(i32));
                continue;
                throw new RuntimeException("Session didn't exist");
              }
            }
            finally {}
          }
          if (localJSONArray3.length() <= 0) {
            break label1428;
          }
        }
        finally
        {
          if (localCursor4 != null) {
            localCursor4.close();
          }
        }
        localJSONObject1.put("fl", localJSONArray3);
        label1428:
        if (localCursor5 != null) {
          localCursor5.close();
        }
        int i21 = localCursor1.getColumnIndexOrThrow("event_lat");
        if (!localCursor1.isNull(i21))
        {
          int i29 = localCursor1.getColumnIndexOrThrow("event_lng");
          if (!localCursor1.isNull(i29))
          {
            int i30 = localCursor1.getColumnIndexOrThrow("event_lat");
            double d3 = localCursor1.getDouble(i30);
            int i31 = localCursor1.getColumnIndexOrThrow("event_lng");
            double d4 = localCursor1.getDouble(i31);
            if ((d3 != 0.0D) && (d4 != 0.0D))
            {
              localJSONObject1.put("lat", d3);
              localJSONObject1.put("lng", d4);
            }
          }
        }
        int i22 = localCursor1.getColumnIndexOrThrow("customer_id");
        if (!localCursor1.isNull(i22))
        {
          int i27 = localCursor1.getColumnIndexOrThrow("customer_id");
          String str18 = localCursor1.getString(i27);
          int i28 = localCursor1.getColumnIndexOrThrow("user_type");
          String str19 = localCursor1.getString(i28);
          localJSONObject1.put("cid", str18);
          localJSONObject1.put("utp", str19);
        }
        int i23 = localCursor1.getColumnIndexOrThrow("ids");
        if (!localCursor1.isNull(i23))
        {
          int i26 = localCursor1.getColumnIndexOrThrow("ids");
          localJSONObject1.put("ids", new JSONObject(localCursor1.getString(i26)));
        }
        Cursor localCursor6 = null;
        for (;;)
        {
          String str16;
          String str17;
          try
          {
            String str15 = String.format("%s = ?", new Object[] { "events_key_ref" });
            String[] arrayOfString9 = new String[1];
            arrayOfString9[0] = Long.toString(paramLong1);
            localCursor6 = paramSQLiteDatabase.query("attributes", null, str15, arrayOfString9, null, null, null);
            int i24 = localCursor6.getColumnIndexOrThrow("attribute_key");
            int i25 = localCursor6.getColumnIndexOrThrow("attribute_value");
            if (!localCursor6.moveToNext()) {
              break;
            }
            str16 = localCursor6.getString(i24);
            str17 = localCursor6.getString(i25);
            if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_1.equals(str16))
            {
              localJSONObject1.put(getCustomDimensionKey(1), str17);
              continue;
            }
            if (!AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_2.equals(str16)) {
              break label1893;
            }
          }
          finally
          {
            if (localCursor6 != null) {
              localCursor6.close();
            }
          }
          localJSONObject1.put(getCustomDimensionKey(2), str17);
          continue;
          label1893:
          if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_3.equals(str16)) {
            localJSONObject1.put(getCustomDimensionKey(3), str17);
          } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_4.equals(str16)) {
            localJSONObject1.put(getCustomDimensionKey(4), str17);
          } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_5.equals(str16)) {
            localJSONObject1.put(getCustomDimensionKey(5), str17);
          } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_6.equals(str16)) {
            localJSONObject1.put(getCustomDimensionKey(6), str17);
          } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_7.equals(str16)) {
            localJSONObject1.put(getCustomDimensionKey(7), str17);
          } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_8.equals(str16)) {
            localJSONObject1.put(getCustomDimensionKey(8), str17);
          } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_9.equals(str16)) {
            localJSONObject1.put(getCustomDimensionKey(9), str17);
          } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_10.equals(str16)) {
            localJSONObject1.put(getCustomDimensionKey(10), str17);
          }
        }
        if (localCursor6 != null) {
          localCursor6.close();
        }
      }
      else
      {
        if ((OPT_IN_EVENT.equals(str2)) || (OPT_OUT_EVENT.equals(str2)))
        {
          localJSONObject1.put("dt", "o");
          localJSONObject1.put("u", paramString);
          if (OPT_OUT_EVENT.equals(str2)) {}
          for (String str4 = Boolean.TRUE.toString();; str4 = Boolean.FALSE.toString())
          {
            localJSONObject1.put("out", str4);
            int j = localCursor1.getColumnIndex("wall_time");
            localJSONObject1.put("ct", Math.round(localCursor1.getLong(j) / 1000.0D));
            break;
          }
        }
        if (FLOW_EVENT.equals(str2))
        {
          localJSONObject1.put("dt", "f");
          int i12 = localCursor1.getColumnIndexOrThrow("uuid");
          localJSONObject1.put("u", localCursor1.getString(i12));
          localJSONObject1.put("ss", Math.round(l2 / 1000.0D));
          Cursor localCursor3 = null;
          JSONArray localJSONArray1;
          JSONArray localJSONArray2;
          for (;;)
          {
            String str11;
            String str12;
            try
            {
              String[] arrayOfString3 = { "type", "processed_in_blob", "name" };
              String str10 = String.format("%s = ? AND %s <= ?", new Object[] { "session_key_ref", "processed_in_blob" });
              String[] arrayOfString4 = new String[2];
              arrayOfString4[0] = Long.toString(l1);
              arrayOfString4[1] = Long.toString(paramLong2);
              localCursor3 = paramSQLiteDatabase.query("event_history", arrayOfString3, str10, arrayOfString4, null, null, "_id");
              localJSONArray1 = new JSONArray();
              localJSONArray2 = new JSONArray();
              if (!localCursor3.moveToNext()) {
                break;
              }
              int i13 = localCursor3.getColumnIndexOrThrow("name");
              str11 = localCursor3.getString(i13);
              int i14 = localCursor3.getColumnIndexOrThrow("type");
              if (localCursor3.getInt(i14) == 0)
              {
                str12 = "e";
                int i15 = localCursor3.getColumnIndexOrThrow("processed_in_blob");
                if (paramLong2 != localCursor3.getLong(i15)) {
                  break label2560;
                }
                localJSONArray1.put(new JSONObject().put(str12, str11));
                continue;
              }
              str12 = "s";
            }
            finally
            {
              if (localCursor3 != null) {
                localCursor3.close();
              }
            }
            continue;
            label2560:
            localJSONArray2.put(new JSONObject().put(str12, str11));
          }
          localJSONObject1.put("nw", localJSONArray1);
          localJSONObject1.put("od", localJSONArray2);
          if (localCursor3 != null) {
            localCursor3.close();
          }
        }
        else
        {
          localJSONObject1.put("dt", "e");
          int k = localCursor1.getColumnIndex("wall_time");
          localJSONObject1.put("ct", Math.round(localCursor1.getLong(k) / 1000.0D));
          int m = localCursor1.getColumnIndexOrThrow("uuid");
          localJSONObject1.put("u", localCursor1.getString(m));
          localJSONObject1.put("su", str3);
          localJSONObject1.put("n", str2.substring(1 + paramContext.getPackageName().length(), str2.length()));
          int n = localCursor1.getColumnIndex("clv_increase");
          long l3 = localCursor1.getLong(n);
          if (l3 != 0L) {
            localJSONObject1.put("v", l3);
          }
          int i1 = localCursor1.getColumnIndexOrThrow("event_lat");
          if (!localCursor1.isNull(i1))
          {
            int i9 = localCursor1.getColumnIndexOrThrow("event_lng");
            if (!localCursor1.isNull(i9))
            {
              int i10 = localCursor1.getColumnIndexOrThrow("event_lat");
              double d1 = localCursor1.getDouble(i10);
              int i11 = localCursor1.getColumnIndexOrThrow("event_lng");
              double d2 = localCursor1.getDouble(i11);
              if ((d1 != 0.0D) && (d2 != 0.0D))
              {
                localJSONObject1.put("lat", d1);
                localJSONObject1.put("lng", d2);
              }
            }
          }
          int i2 = localCursor1.getColumnIndexOrThrow("customer_id");
          if (!localCursor1.isNull(i2))
          {
            int i7 = localCursor1.getColumnIndexOrThrow("customer_id");
            String str8 = localCursor1.getString(i7);
            int i8 = localCursor1.getColumnIndexOrThrow("user_type");
            String str9 = localCursor1.getString(i8);
            localJSONObject1.put("cid", str8);
            localJSONObject1.put("utp", str9);
          }
          int i3 = localCursor1.getColumnIndexOrThrow("ids");
          if (!localCursor1.isNull(i3))
          {
            int i6 = localCursor1.getColumnIndexOrThrow("ids");
            localJSONObject1.put("ids", new JSONObject(localCursor1.getString(i6)));
          }
          Cursor localCursor2 = null;
          for (;;)
          {
            String str6;
            String str7;
            try
            {
              String str5 = String.format("%s = ?", new Object[] { "events_key_ref" });
              String[] arrayOfString2 = new String[1];
              arrayOfString2[0] = Long.toString(paramLong1);
              localCursor2 = paramSQLiteDatabase.query("attributes", null, str5, arrayOfString2, null, null, null);
              int i4 = localCursor2.getColumnIndexOrThrow("attribute_key");
              int i5 = localCursor2.getColumnIndexOrThrow("attribute_value");
              if (!localCursor2.moveToNext()) {
                break;
              }
              str6 = localCursor2.getString(i4);
              str7 = localCursor2.getString(i5);
              if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_1.equals(str6))
              {
                localJSONObject1.put(getCustomDimensionKey(1), str7);
                continue;
              }
              if (!AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_2.equals(str6)) {
                break label3229;
              }
            }
            finally
            {
              if (localCursor2 != null) {
                localCursor2.close();
              }
            }
            localJSONObject1.put(getCustomDimensionKey(2), str7);
            continue;
            label3229:
            if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_3.equals(str6)) {
              localJSONObject1.put(getCustomDimensionKey(3), str7);
            } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_4.equals(str6)) {
              localJSONObject1.put(getCustomDimensionKey(4), str7);
            } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_5.equals(str6)) {
              localJSONObject1.put(getCustomDimensionKey(5), str7);
            } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_6.equals(str6)) {
              localJSONObject1.put(getCustomDimensionKey(6), str7);
            } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_7.equals(str6)) {
              localJSONObject1.put(getCustomDimensionKey(7), str7);
            } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_8.equals(str6)) {
              localJSONObject1.put(getCustomDimensionKey(8), str7);
            } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_9.equals(str6)) {
              localJSONObject1.put(getCustomDimensionKey(9), str7);
            } else if (AttributesDbColumns.ATTRIBUTE_CUSTOM_DIMENSION_10.equals(str6)) {
              localJSONObject1.put(getCustomDimensionKey(10), str7);
            }
          }
          if (localCursor2 != null) {
            localCursor2.close();
          }
          JSONObject localJSONObject2 = convertAttributesToJson(paramSQLiteDatabase, paramContext, paramLong1);
          if (localJSONObject2 != null) {
            localJSONObject1.put("attrs", localJSONObject2);
          }
        }
      }
    }
    label3480:
    throw new RuntimeException();
  }
  
  private static long getApiKeyCreationTime(SQLiteDatabase paramSQLiteDatabase, String paramString)
  {
    Cursor localCursor = null;
    try
    {
      localCursor = paramSQLiteDatabase.query("api_keys", null, String.format("%s = ?", new Object[] { "api_key" }), new String[] { paramString }, null, null, null);
      if (localCursor.moveToFirst())
      {
        int i = Math.round((float)localCursor.getLong(localCursor.getColumnIndexOrThrow("created_time")) / 1000.0F);
        long l = i;
        return l;
      }
      throw new RuntimeException("API key entry couldn't be found");
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
  }
  
  private static JSONObject getAttributesFromSession(SQLiteDatabase paramSQLiteDatabase, String paramString, long paramLong)
    throws JSONException
  {
    Cursor localCursor = null;
    try
    {
      String str1 = String.format("%s = ?", new Object[] { "_id" });
      String[] arrayOfString = new String[1];
      arrayOfString[0] = Long.toString(paramLong);
      localCursor = paramSQLiteDatabase.query("sessions", null, str1, arrayOfString, null, null, null);
      if (localCursor.moveToFirst())
      {
        localJSONObject = new JSONObject();
        String str2 = localCursor.getString(localCursor.getColumnIndexOrThrow("app_version"));
        localJSONObject.put("av", str2);
        String str3 = localCursor.getString(localCursor.getColumnIndexOrThrow("network_type"));
        localJSONObject.put("dac", str3);
        String str4 = localCursor.getString(localCursor.getColumnIndexOrThrow("device_android_id_hash"));
        if (!"".equals(str4)) {
          localJSONObject.put("du", str4);
        }
        String str5 = localCursor.getString(localCursor.getColumnIndexOrThrow("device_country"));
        localJSONObject.put("dc", str5);
        String str6 = localCursor.getString(localCursor.getColumnIndexOrThrow("device_manufacturer"));
        localJSONObject.put("dma", str6);
        String str7 = localCursor.getString(localCursor.getColumnIndexOrThrow("device_model"));
        localJSONObject.put("dmo", str7);
        String str8 = localCursor.getString(localCursor.getColumnIndexOrThrow("android_version"));
        localJSONObject.put("dov", str8);
        localJSONObject.put("dp", "Android");
        Object localObject2;
        Object localObject3;
        if (localCursor.isNull(localCursor.getColumnIndexOrThrow("device_serial_number_hash")))
        {
          localObject2 = JSONObject.NULL;
          localJSONObject.put("dms", localObject2);
          String str9 = localCursor.getString(localCursor.getColumnIndexOrThrow("android_sdk"));
          localJSONObject.put("dsdk", str9);
          localJSONObject.put("au", paramString);
          String str10 = localCursor.getString(localCursor.getColumnIndexOrThrow("localytics_library_version"));
          localJSONObject.put("lv", str10);
          localJSONObject.put("dt", "a");
          if (!localCursor.isNull(localCursor.getColumnIndexOrThrow("device_android_id"))) {
            break label834;
          }
          localObject3 = JSONObject.NULL;
          label445:
          localJSONObject.put("caid", localObject3);
          if (!localCursor.isNull(localCursor.getColumnIndexOrThrow("device_advertising_id"))) {
            break label856;
          }
        }
        label834:
        label856:
        String str11;
        for (Object localObject4 = JSONObject.NULL;; localObject4 = str11)
        {
          localJSONObject.put("gcadid", localObject4);
          String str12 = localCursor.getString(localCursor.getColumnIndexOrThrow("iu"));
          if (str12 != null) {
            localJSONObject.put("iu", str12);
          }
          String str13 = localCursor.getString(localCursor.getColumnIndexOrThrow("locale_country"));
          localJSONObject.put("dlc", str13);
          String str14 = localCursor.getString(localCursor.getColumnIndexOrThrow("locale_language"));
          localJSONObject.put("dll", str14);
          String str15 = localCursor.getString(localCursor.getColumnIndexOrThrow("network_carrier"));
          localJSONObject.put("nca", str15);
          String str16 = localCursor.getString(localCursor.getColumnIndexOrThrow("network_country"));
          localJSONObject.put("nc", str16);
          String str17 = getStringFromAppInfo(paramSQLiteDatabase, "fb_attribution");
          if (str17 != null) {
            localJSONObject.put("fbat", str17);
          }
          String str18 = getStringFromAppInfo(paramSQLiteDatabase, "play_attribution");
          if (str18 != null) {
            localJSONObject.put("aurl", str18);
          }
          String str19 = getStringFromAppInfo(paramSQLiteDatabase, "registration_id");
          if (str19 != null) {
            localJSONObject.put("push", str19);
          }
          String str20 = getStringFromAppInfo(paramSQLiteDatabase, "first_android_id");
          if (str20 != null) {
            localJSONObject.put("aid", str20);
          }
          String str21 = getStringFromAppInfo(paramSQLiteDatabase, "first_advertising_id");
          if (str21 != null) {
            localJSONObject.put("gadid", str21);
          }
          String str22 = getStringFromAppInfo(paramSQLiteDatabase, "package_name");
          if (str22 != null) {
            localJSONObject.put("pkg", str22);
          }
          return localJSONObject;
          localObject2 = localCursor.getString(localCursor.getColumnIndexOrThrow("device_serial_number_hash"));
          break;
          localObject3 = localCursor.getString(localCursor.getColumnIndexOrThrow("device_android_id"));
          break label445;
          str11 = localCursor.getString(localCursor.getColumnIndexOrThrow("device_advertising_id"));
        }
      }
      JSONObject localJSONObject = null;
      return null;
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
  }
  
  private static String getCustomDimensionKey(int paramInt)
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = "c";
    arrayOfObject[1] = String.valueOf(paramInt - 1);
    return String.format("%s%s", arrayOfObject);
  }
  
  private static long getElapsedTimeSinceLastSession(SQLiteDatabase paramSQLiteDatabase, long paramLong)
  {
    Cursor localCursor = null;
    try
    {
      String[] arrayOfString1 = { "elapsed" };
      String str = String.format("%s = ?", new Object[] { "_id" });
      String[] arrayOfString2 = new String[1];
      arrayOfString2[0] = Long.toString(paramLong);
      localCursor = paramSQLiteDatabase.query("sessions", arrayOfString1, str, arrayOfString2, null, null, null);
      if (localCursor.moveToFirst())
      {
        long l = localCursor.getLong(localCursor.getColumnIndexOrThrow("elapsed"));
        return l;
      }
      throw new RuntimeException();
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
  }
  
  private static JSONObject getIdentifiers(SQLiteDatabase paramSQLiteDatabase)
    throws JSONException
  {
    Cursor localCursor = null;
    JSONObject localJSONObject;
    try
    {
      localCursor = paramSQLiteDatabase.query("identifiers", null, null, null, null, null, null);
      localJSONObject = null;
      while (localCursor.moveToNext())
      {
        if (localJSONObject == null) {
          localJSONObject = new JSONObject();
        }
        localJSONObject.put(localCursor.getString(localCursor.getColumnIndexOrThrow("key")), localCursor.getString(localCursor.getColumnIndexOrThrow("value")));
      }
      if (localCursor == null) {
        return localJSONObject;
      }
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
    localCursor.close();
    return localJSONObject;
  }
  
  /* Error */
  private static long getSessionIdForBlobId(SQLiteDatabase paramSQLiteDatabase, long paramLong)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_3
    //   2: iconst_1
    //   3: anewarray 32	java/lang/String
    //   6: dup
    //   7: iconst_0
    //   8: ldc 62
    //   10: aastore
    //   11: astore 4
    //   13: ldc_w 258
    //   16: iconst_1
    //   17: anewarray 26	java/lang/Object
    //   20: dup
    //   21: iconst_0
    //   22: ldc_w 260
    //   25: aastore
    //   26: invokestatic 36	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   29: astore 6
    //   31: iconst_1
    //   32: anewarray 32	java/lang/String
    //   35: astore 7
    //   37: aload 7
    //   39: iconst_0
    //   40: lload_1
    //   41: invokestatic 109	java/lang/Long:toString	(J)Ljava/lang/String;
    //   44: aastore
    //   45: aload_0
    //   46: ldc_w 262
    //   49: aload 4
    //   51: aload 6
    //   53: aload 7
    //   55: aconst_null
    //   56: aconst_null
    //   57: aconst_null
    //   58: invokevirtual 149	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   61: astore_3
    //   62: aload_3
    //   63: invokeinterface 291 1 0
    //   68: ifeq +142 -> 210
    //   71: aload_3
    //   72: aload_3
    //   73: ldc 62
    //   75: invokeinterface 165 2 0
    //   80: invokeinterface 220 2 0
    //   85: lstore 10
    //   87: aload_3
    //   88: ifnull +9 -> 97
    //   91: aload_3
    //   92: invokeinterface 157 1 0
    //   97: aconst_null
    //   98: astore 12
    //   100: iconst_1
    //   101: anewarray 32	java/lang/String
    //   104: dup
    //   105: iconst_0
    //   106: ldc_w 377
    //   109: aastore
    //   110: astore 13
    //   112: ldc_w 258
    //   115: iconst_1
    //   116: anewarray 26	java/lang/Object
    //   119: dup
    //   120: iconst_0
    //   121: ldc 58
    //   123: aastore
    //   124: invokestatic 36	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   127: astore 15
    //   129: iconst_1
    //   130: anewarray 32	java/lang/String
    //   133: astore 16
    //   135: aload 16
    //   137: iconst_0
    //   138: lload 10
    //   140: invokestatic 109	java/lang/Long:toString	(J)Ljava/lang/String;
    //   143: aastore
    //   144: aload_0
    //   145: ldc_w 288
    //   148: aload 13
    //   150: aload 15
    //   152: aload 16
    //   154: aconst_null
    //   155: aconst_null
    //   156: aconst_null
    //   157: invokevirtual 149	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   160: astore 12
    //   162: aload 12
    //   164: invokeinterface 291 1 0
    //   169: ifeq +74 -> 243
    //   172: aload 12
    //   174: aload 12
    //   176: ldc_w 377
    //   179: invokeinterface 165 2 0
    //   184: invokeinterface 220 2 0
    //   189: lstore 17
    //   191: lload 17
    //   193: lstore 8
    //   195: aload 12
    //   197: ifnull +10 -> 207
    //   200: aload 12
    //   202: invokeinterface 157 1 0
    //   207: lload 8
    //   209: lreturn
    //   210: ldc2_w 566
    //   213: lstore 8
    //   215: aload_3
    //   216: ifnull -9 -> 207
    //   219: aload_3
    //   220: invokeinterface 157 1 0
    //   225: lload 8
    //   227: lreturn
    //   228: astore 5
    //   230: aload_3
    //   231: ifnull +9 -> 240
    //   234: aload_3
    //   235: invokeinterface 157 1 0
    //   240: aload 5
    //   242: athrow
    //   243: new 397	java/lang/RuntimeException
    //   246: dup
    //   247: ldc_w 569
    //   250: invokespecial 400	java/lang/RuntimeException:<init>	(Ljava/lang/String;)V
    //   253: athrow
    //   254: astore 14
    //   256: aload 12
    //   258: ifnull +10 -> 268
    //   261: aload 12
    //   263: invokeinterface 157 1 0
    //   268: aload 14
    //   270: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	271	0	paramSQLiteDatabase	SQLiteDatabase
    //   0	271	1	paramLong	long
    //   1	234	3	localCursor1	Cursor
    //   11	39	4	arrayOfString1	String[]
    //   228	13	5	localObject1	Object
    //   29	23	6	str1	String
    //   35	19	7	arrayOfString2	String[]
    //   193	33	8	l1	long
    //   85	54	10	l2	long
    //   98	164	12	localCursor2	Cursor
    //   110	39	13	arrayOfString3	String[]
    //   254	15	14	localObject2	Object
    //   127	24	15	str2	String
    //   133	20	16	arrayOfString4	String[]
    //   189	3	17	l3	long
    // Exception table:
    //   from	to	target	type
    //   2	87	228	finally
    //   100	191	254	finally
    //   243	254	254	finally
  }
  
  private static long getSessionIdForEventId(SQLiteDatabase paramSQLiteDatabase, long paramLong)
  {
    Cursor localCursor = null;
    try
    {
      String[] arrayOfString1 = { "session_key_ref" };
      String str = String.format("%s = ?", new Object[] { "_id" });
      String[] arrayOfString2 = new String[1];
      arrayOfString2[0] = Long.toString(paramLong);
      localCursor = paramSQLiteDatabase.query("events", arrayOfString1, str, arrayOfString2, null, null, null);
      if (localCursor.moveToFirst())
      {
        long l = localCursor.getLong(localCursor.getColumnIndexOrThrow("session_key_ref"));
        return l;
      }
      throw new RuntimeException();
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
  }
  
  private static long getSessionStartTime(SQLiteDatabase paramSQLiteDatabase, long paramLong)
  {
    Cursor localCursor = null;
    try
    {
      String[] arrayOfString1 = { "session_start_wall_time" };
      String str = String.format("%s = ?", new Object[] { "_id" });
      String[] arrayOfString2 = new String[1];
      arrayOfString2[0] = Long.toString(paramLong);
      localCursor = paramSQLiteDatabase.query("sessions", arrayOfString1, str, arrayOfString2, null, null, null);
      if (localCursor.moveToFirst())
      {
        long l = localCursor.getLong(localCursor.getColumnIndexOrThrow("session_start_wall_time"));
        return l;
      }
      throw new RuntimeException();
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
  }
  
  private static String getSessionUuid(SQLiteDatabase paramSQLiteDatabase, long paramLong)
  {
    Cursor localCursor = null;
    try
    {
      String[] arrayOfString1 = { "uuid" };
      String str1 = String.format("%s = ?", new Object[] { "_id" });
      String[] arrayOfString2 = new String[1];
      arrayOfString2[0] = Long.toString(paramLong);
      localCursor = paramSQLiteDatabase.query("sessions", arrayOfString1, str1, arrayOfString2, null, null, null);
      if (localCursor.moveToFirst())
      {
        String str2 = localCursor.getString(localCursor.getColumnIndexOrThrow("uuid"));
        return str2;
      }
      throw new RuntimeException();
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
  }
  
  private static String getStringFromAppInfo(SQLiteDatabase paramSQLiteDatabase, String paramString)
  {
    Cursor localCursor = null;
    try
    {
      localCursor = paramSQLiteDatabase.query("info", null, null, null, null, null, null);
      if (localCursor.moveToFirst())
      {
        String str = localCursor.getString(localCursor.getColumnIndexOrThrow(paramString));
        return str;
      }
      return null;
    }
    finally
    {
      if (localCursor != null) {
        localCursor.close();
      }
    }
  }
  
  static void preUploadBuildBlobs(SQLiteDatabase paramSQLiteDatabase)
  {
    HashSet localHashSet = new HashSet();
    Cursor localCursor1 = null;
    Cursor localCursor2 = null;
    for (;;)
    {
      try
      {
        localCursor1 = paramSQLiteDatabase.query("events", PROJECTION_UPLOAD_EVENTS, null, null, null, null, EVENTS_SORT_ORDER);
        localCursor2 = paramSQLiteDatabase.query("upload_blob_events", PROJECTION_UPLOAD_BLOBS, null, null, null, null, UPLOAD_BLOBS_EVENTS_SORT_ORDER);
        int i = localCursor1.getColumnIndexOrThrow("_id");
        CursorJoiner localCursorJoiner = new CursorJoiner(localCursor1, JOINER_ARG_UPLOAD_EVENTS_COLUMNS, localCursor2, PROJECTION_UPLOAD_BLOBS);
        Iterator localIterator1 = localCursorJoiner.iterator();
        CursorJoiner.Result localResult;
        if (localIterator1.hasNext()) {
          localResult = (CursorJoiner.Result)localIterator1.next();
        }
        switch (localResult)
        {
        case ???: 
        case ???: 
          if ((CLOSE_EVENT.equals(localCursor1.getString(localCursor1.getColumnIndexOrThrow("event_name")))) && (System.currentTimeMillis() - localCursor1.getLong(localCursor1.getColumnIndexOrThrow("wall_time")) < Constants.SESSION_EXPIRATION)) {
            continue;
          }
          localHashSet.add(Long.valueOf(localCursor1.getLong(i)));
          continue;
          if (localCursor1 == null) {
            break label240;
          }
        }
      }
      finally
      {
        if (localCursor1 != null) {
          localCursor1.close();
        }
        if (localCursor2 != null) {
          localCursor2.close();
        }
      }
      localCursor1.close();
      label240:
      if (localCursor2 != null) {
        localCursor2.close();
      }
      if (localHashSet.size() > 0)
      {
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("uuid", UUID.randomUUID().toString());
        Long localLong1 = Long.valueOf(paramSQLiteDatabase.insert("upload_blobs", null, localContentValues));
        localContentValues.clear();
        Iterator localIterator2 = localHashSet.iterator();
        while (localIterator2.hasNext())
        {
          Long localLong2 = (Long)localIterator2.next();
          localContentValues.put("upload_blobs_key_ref", localLong1);
          localContentValues.put("events_key_ref", localLong2);
          paramSQLiteDatabase.insert("upload_blob_events", null, localContentValues);
          localContentValues.clear();
        }
        localContentValues.put("processed_in_blob", localLong1);
        paramSQLiteDatabase.update("event_history", localContentValues, SELECTION_UPLOAD_NULL_BLOBS, null);
        localContentValues.clear();
      }
      return;
    }
  }
  
  public void onCreate(SQLiteDatabase paramSQLiteDatabase)
  {
    if (paramSQLiteDatabase == null) {
      throw new IllegalArgumentException("db cannot be null");
    }
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
    if (paramInt1 < 3)
    {
      paramSQLiteDatabase.delete("upload_blob_events", null, null);
      paramSQLiteDatabase.delete("event_history", null, null);
      paramSQLiteDatabase.delete("upload_blobs", null, null);
      paramSQLiteDatabase.delete("attributes", null, null);
      paramSQLiteDatabase.delete("events", null, null);
      paramSQLiteDatabase.delete("sessions", null, null);
    }
    if (paramInt1 < 4) {
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "sessions", "iu" }));
    }
    if (paramInt1 < 5) {
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "sessions", "device_wifi_mac_hash" }));
    }
    if (paramInt1 < 6)
    {
      Cursor localCursor2 = null;
      try
      {
        localCursor2 = paramSQLiteDatabase.query("attributes", new String[] { "_id", "attribute_key" }, null, null, null, null, null);
        int i = localCursor2.getColumnIndexOrThrow("_id");
        int j = localCursor2.getColumnIndexOrThrow("attribute_key");
        ContentValues localContentValues5 = new ContentValues();
        String str3 = String.format("%s = ?", new Object[] { "_id" });
        String[] arrayOfString = new String[1];
        localCursor2.moveToPosition(-1);
        while (localCursor2.moveToNext())
        {
          Object[] arrayOfObject = new Object[2];
          arrayOfObject[0] = this.mLocalyticsDao.getAppContext().getPackageName();
          arrayOfObject[1] = localCursor2.getString(j);
          localContentValues5.put("attribute_key", String.format("%s:%s", arrayOfObject));
          arrayOfString[0] = Long.toString(localCursor2.getLong(i));
          paramSQLiteDatabase.update("attributes", localContentValues5, str3, arrayOfString);
          localContentValues5.clear();
        }
        if (localCursor2 == null) {
          break label349;
        }
      }
      finally
      {
        if (localCursor2 != null) {
          localCursor2.close();
        }
      }
      localCursor2.close();
    }
    label349:
    if (paramInt1 < 7)
    {
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE IF NOT EXISTS %s (%s TEXT, %s INTEGER);", new Object[] { "info", "fb_attribution", "first_run" }));
      ContentValues localContentValues4 = new ContentValues();
      localContentValues4.putNull("fb_attribution");
      localContentValues4.put("first_run", Boolean.FALSE);
      paramSQLiteDatabase.insertOrThrow("info", null, localContentValues4);
    }
    if (paramInt1 < 8) {
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT UNIQUE NOT NULL, %s TEXT NOT NULL);", new Object[] { "identifiers", "_id", "key", "value" }));
    }
    if (paramInt1 < 9) {
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s INTEGER NOT NULL DEFAULT 0;", new Object[] { "events", "clv_increase" }));
    }
    if (paramInt1 < 10) {
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "info", "play_attribution" }));
    }
    if (paramInt1 < 11)
    {
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "info", "registration_id" }));
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "info", "registration_version" }));
    }
    if (paramInt1 < 12)
    {
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "info", "first_android_id" }));
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "info", "first_telephony_id" }));
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "info", "package_name" }));
      ContentValues localContentValues3 = new ContentValues();
      localContentValues3.put("first_android_id", DatapointHelper.getAndroidIdOrNull(this.mLocalyticsDao.getAppContext()));
      localContentValues3.put("first_telephony_id", DatapointHelper.getTelephonyDeviceIdOrNull(this.mLocalyticsDao.getAppContext()));
      localContentValues3.put("package_name", this.mLocalyticsDao.getAppContext().getPackageName());
      paramSQLiteDatabase.update("info", localContentValues3, null, null);
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "sessions", "device_android_id" }));
    }
    if (paramInt1 < 13)
    {
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s REAL;", new Object[] { "events", "event_lat" }));
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s REAL;", new Object[] { "events", "event_lng" }));
    }
    if (paramInt1 < 14)
    {
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s INTEGER, %s INTEGER, %s TEXT NOT NULL, %s TEXT NOT NULL, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s TEXT NOT NULL, %s INTEGER NOT NULL, %s INTEGER NOT NULL, %s INTEGER, %s INTEGER NOT NULL, %s TEXT, %s TEXT UNIQUE NOT NULL, %s TEXT NOT NULL, %s TEXT NOT NULL)", new Object[] { "amp_rules", "_id", "campaign_id", "expiration", "display_seconds", "display_session", "version", "phone_location", "phone_size_width", "phone_size_height", "tablet_location", "tablet_size_width", "tablet_size_height", "time_to_display", "internet_required", "ab_test", "rule_name", "location", "devices" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s INTEGER REFERENCES %s(%s) NOT NULL);", new Object[] { "amp_ruleevent", "_id", "event_name", "rule_id_ref", "amp_rules", "_id" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s INTEGER NOT NULL DEFAULT 0, %s INTEGER NOT NULL);", new Object[] { "amp_displayed", "_id", "displayed", "campaign_id" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s TEXT NOT NULL, %s INTEGER REFERENCES %s(%s) NOT NULL);", new Object[] { "amp_conditions", "_id", "attribute_name", "operator", "rule_id_ref", "amp_rules", "_id" }));
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT NOT NULL, %s INTEGER REFERENCES %s(%s) NOT NULL);", new Object[] { "amp_condition_values", "_id", "value", "condition_id_ref", "amp_conditions", "_id" }));
    }
    if (paramInt1 < 15) {
      paramSQLiteDatabase.execSQL(String.format("CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT UNIQUE NOT NULL, %s TEXT NOT NULL);", new Object[] { "custom_dimensions", "_id", "custom_dimension_key", "custom_dimension_value" }));
    }
    ContentValues localContentValues2;
    DatapointHelper.AdvertisingInfo localAdvertisingInfo;
    String str2;
    if (paramInt1 < 16)
    {
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "info", "first_advertising_id" }));
      localContentValues2 = new ContentValues();
      localAdvertisingInfo = DatapointHelper.getAdvertisingInfo(this.mLocalyticsDao.getAppContext());
      if (localAdvertisingInfo != null) {
        break label1798;
      }
      str2 = null;
    }
    Cursor localCursor1;
    label1798:
    for (;;)
    {
      localContentValues2.put("first_advertising_id", str2);
      paramSQLiteDatabase.update("info", localContentValues2, null, null);
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "sessions", "device_advertising_id" }));
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s INTEGER;", new Object[] { "info", "push_disabled" }));
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "info", "sender_id" }));
      if (paramInt1 < 17)
      {
        paramSQLiteDatabase.execSQL(String.format("CREATE TABLE IF NOT EXISTS %s (%s INTEGER PRIMARY KEY AUTOINCREMENT, %s TEXT, %s INTEGER)", new Object[] { "profile", "_id", "attribute", "action" }));
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "events", "customer_id" }));
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "events", "user_type" }));
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT;", new Object[] { "events", "ids" }));
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s INTEGER", new Object[] { "info", "last_session_open_time" }));
        paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s INTEGER NOT NULL CHECK (%s >= 0) DEFAULT 0", new Object[] { "sessions", "elapsed", "elapsed" }));
      }
      if (paramInt1 >= 18) {
        return;
      }
      paramSQLiteDatabase.execSQL(String.format("ALTER TABLE %s ADD COLUMN %s TEXT", new Object[] { "profile", "customer_id" }));
      localCursor1 = null;
      ContentValues localContentValues1 = new ContentValues();
      try
      {
        localCursor1 = paramSQLiteDatabase.query("profile", null, null, null, null, null, null);
        while (localCursor1.moveToNext())
        {
          String str1 = String.valueOf(localCursor1.getInt(localCursor1.getColumnIndexOrThrow("_id")));
          try
          {
            JSONObject localJSONObject = new JSONObject(localCursor1.getString(localCursor1.getColumnIndexOrThrow("attribute")));
            localContentValues1.put("attribute", localJSONObject.getString("attributes"));
            localContentValues1.put("customer_id", localJSONObject.getString("id"));
            paramSQLiteDatabase.update("profile", localContentValues1, String.format("%s = %s", new Object[] { "_id", str1 }), null);
            localContentValues1.clear();
          }
          catch (Exception localException)
          {
            paramSQLiteDatabase.delete("profile", String.format("%s = %s", new Object[] { "_id", str1 }), null);
          }
        }
        str2 = localAdvertisingInfo.id;
      }
      finally
      {
        if (localCursor1 != null) {
          localCursor1.close();
        }
      }
    }
    if (localCursor1 != null) {
      localCursor1.close();
    }
  }
  
  static final class AmpConditionValuesDbColumns
    implements BaseColumns
  {
    static final String CONDITION_ID_REF = "condition_id_ref";
    static final String TABLE_NAME = "amp_condition_values";
    static final String VALUE = "value";
    
    private AmpConditionValuesDbColumns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class AmpConditionsDbColumns
    implements BaseColumns
  {
    static final String ATTRIBUTE_NAME = "attribute_name";
    static final String OPERATOR = "operator";
    static final String RULE_ID_REF = "rule_id_ref";
    static final String TABLE_NAME = "amp_conditions";
    
    private AmpConditionsDbColumns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class AmpDisplayedDbColumns
    implements BaseColumns
  {
    static final String CAMPAIGN_ID = "campaign_id";
    static final String DISPLAYED = "displayed";
    static final String TABLE_NAME = "amp_displayed";
    
    private AmpDisplayedDbColumns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class AmpRuleEventDbColumns
    implements BaseColumns
  {
    static final String EVENT_NAME = "event_name";
    static final String RULE_ID_REF = "rule_id_ref";
    static final String TABLE_NAME = "amp_ruleevent";
    
    private AmpRuleEventDbColumns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class AmpRulesDbColumns
    implements BaseColumns
  {
    static final String AB_TEST = "ab_test";
    static final String CAMPAIGN_ID = "campaign_id";
    static final String DEVICES = "devices";
    static final String DISPLAY_SECONDS = "display_seconds";
    static final String DISPLAY_SESSION = "display_session";
    static final String EXPIRATION = "expiration";
    static final String INTERNET_REQUIRED = "internet_required";
    static final String LOCATION = "location";
    static final String PHONE_LOCATION = "phone_location";
    static final String PHONE_SIZE_HEIGHT = "phone_size_height";
    static final String PHONE_SIZE_WIDTH = "phone_size_width";
    static final String RULE_NAME = "rule_name";
    static final String TABLET_LOCATION = "tablet_location";
    static final String TABLET_SIZE_HEIGHT = "tablet_size_height";
    static final String TABLET_SIZE_WIDTH = "tablet_size_width";
    static final String TABLE_NAME = "amp_rules";
    static final String TIME_TO_DISPLAY = "time_to_display";
    static final String VERSION = "version";
    
    private AmpRulesDbColumns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class ApiKeysDbColumns
    implements BaseColumns
  {
    static final String API_KEY = "api_key";
    static final String CREATED_TIME = "created_time";
    static final String OPT_OUT = "opt_out";
    static final String TABLE_NAME = "api_keys";
    static final String UUID = "uuid";
    
    private ApiKeysDbColumns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class AttributesDbColumns
    implements BaseColumns
  {
    static final String ATTRIBUTE_CUSTOM_DIMENSION_1 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_0" });
    static final String ATTRIBUTE_CUSTOM_DIMENSION_10 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_9" });
    static final String ATTRIBUTE_CUSTOM_DIMENSION_2 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_1" });
    static final String ATTRIBUTE_CUSTOM_DIMENSION_3 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_2" });
    static final String ATTRIBUTE_CUSTOM_DIMENSION_4 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_3" });
    static final String ATTRIBUTE_CUSTOM_DIMENSION_5 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_4" });
    static final String ATTRIBUTE_CUSTOM_DIMENSION_6 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_5" });
    static final String ATTRIBUTE_CUSTOM_DIMENSION_7 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_6" });
    static final String ATTRIBUTE_CUSTOM_DIMENSION_8 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_7" });
    static final String ATTRIBUTE_CUSTOM_DIMENSION_9 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_8" });
    static final String ATTRIBUTE_FORMAT = "%s:%s";
    static final String ATTRIBUTE_KEY = "attribute_key";
    static final String ATTRIBUTE_VALUE = "attribute_value";
    static final String EVENTS_KEY_REF = "events_key_ref";
    static final String TABLE_NAME = "attributes";
    
    private AttributesDbColumns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class CustomDimensionsDbColumns
    implements BaseColumns
  {
    static final String CUSTOM_DIMENSION_1 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_0" });
    static final String CUSTOM_DIMENSION_10 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_9" });
    static final String CUSTOM_DIMENSION_2 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_1" });
    static final String CUSTOM_DIMENSION_3 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_2" });
    static final String CUSTOM_DIMENSION_4 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_3" });
    static final String CUSTOM_DIMENSION_5 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_4" });
    static final String CUSTOM_DIMENSION_6 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_5" });
    static final String CUSTOM_DIMENSION_7 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_6" });
    static final String CUSTOM_DIMENSION_8 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_7" });
    static final String CUSTOM_DIMENSION_9 = String.format("%s:%s", new Object[] { "com.localytics.android", "custom_dimension_8" });
    static final String CUSTOM_DIMENSION_FORMAT = "%s:%s";
    static final String CUSTOM_DIMENSION_KEY = "custom_dimension_key";
    static final String CUSTOM_DIMENSION_VALUE = "custom_dimension_value";
    static final String TABLE_NAME = "custom_dimensions";
    
    private CustomDimensionsDbColumns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class EventFlow
  {
    static final String KEY_DATA_TYPE = "dt";
    static final String KEY_EVENT_UUID = "u";
    static final String KEY_FLOW_NEW = "nw";
    static final String KEY_FLOW_OLD = "od";
    static final String KEY_SESSION_START_TIME = "ss";
    static final String VALUE_DATA_TYPE = "f";
    
    private EventFlow()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
    
    static final class Element
    {
      static final String TYPE_EVENT = "e";
      static final String TYPE_SCREEN = "s";
      
      private Element()
      {
        throw new UnsupportedOperationException("This class is non-instantiable");
      }
    }
  }
  
  static final class EventHistoryDbColumns
    implements BaseColumns
  {
    static final String NAME = "name";
    static final String PROCESSED_IN_BLOB = "processed_in_blob";
    static final String SESSION_KEY_REF = "session_key_ref";
    static final String TABLE_NAME = "event_history";
    static final String TYPE = "type";
    static final int TYPE_EVENT = 0;
    static final int TYPE_SCREEN = 1;
    
    private EventHistoryDbColumns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class EventsDbColumns
    implements BaseColumns
  {
    static final String CLV_INCREASE = "clv_increase";
    static final String CUST_ID = "customer_id";
    static final String EVENT_NAME = "event_name";
    static final String IDENTIFIERS = "ids";
    static final String LAT_NAME = "event_lat";
    static final String LNG_NAME = "event_lng";
    static final String REAL_TIME = "real_time";
    static final String SESSION_KEY_REF = "session_key_ref";
    static final String TABLE_NAME = "events";
    static final String USER_TYPE = "user_type";
    static final String UUID = "uuid";
    static final String WALL_TIME = "wall_time";
    
    private EventsDbColumns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class IdentifiersDbColumns
    implements BaseColumns
  {
    static final String KEY = "key";
    static final String TABLE_NAME = "identifiers";
    static final String VALUE = "value";
    
    private IdentifiersDbColumns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class InfoDbColumns
    implements BaseColumns
  {
    static final String FB_ATTRIBUTION = "fb_attribution";
    static final String FIRST_ADVERTISING_ID = "first_advertising_id";
    static final String FIRST_ANDROID_ID = "first_android_id";
    static final String FIRST_RUN = "first_run";
    static final String FIRST_TELEPHONY_ID = "first_telephony_id";
    static final String LAST_SESSION_OPEN_TIME = "last_session_open_time";
    static final String PACKAGE_NAME = "package_name";
    static final String PLAY_ATTRIBUTION = "play_attribution";
    static final String PUSH_DISABLED = "push_disabled";
    static final String REGISTRATION_ID = "registration_id";
    static final String REGISTRATION_VERSION = "registration_version";
    static final String SENDER_ID = "sender_id";
    static final String TABLE_NAME = "info";
    
    private InfoDbColumns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class ProfileDbColumns
    implements BaseColumns
  {
    static final String ACTION = "action";
    static final String ATTRIBUTE = "attribute";
    static final String CUSTOMER_ID = "customer_id";
    static final String TABLE_NAME = "profile";
    static final String USER_ID = "id";
    
    private ProfileDbColumns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class SessionsDbColumns
    implements BaseColumns
  {
    static final String ANDROID_SDK = "android_sdk";
    static final String ANDROID_VERSION = "android_version";
    static final String API_KEY_REF = "api_key_ref";
    static final String APP_VERSION = "app_version";
    static final String DEVICE_ADVERTISING_ID = "device_advertising_id";
    static final String DEVICE_ANDROID_ID = "device_android_id";
    static final String DEVICE_ANDROID_ID_HASH = "device_android_id_hash";
    static final String DEVICE_COUNTRY = "device_country";
    static final String DEVICE_MANUFACTURER = "device_manufacturer";
    static final String DEVICE_MODEL = "device_model";
    static final String DEVICE_SERIAL_NUMBER_HASH = "device_serial_number_hash";
    static final String DEVICE_TELEPHONY_ID = "device_telephony_id";
    static final String DEVICE_TELEPHONY_ID_HASH = "device_telephony_id_hash";
    static final String DEVICE_WIFI_MAC_HASH = "device_wifi_mac_hash";
    static final String ELAPSED_TIME_SINCE_LAST_SESSION = "elapsed";
    static final String LATITUDE = "latitude";
    static final String LOCALE_COUNTRY = "locale_country";
    static final String LOCALE_LANGUAGE = "locale_language";
    static final String LOCALYTICS_INSTALLATION_ID = "iu";
    static final String LOCALYTICS_LIBRARY_VERSION = "localytics_library_version";
    static final String LONGITUDE = "longitude";
    static final String NETWORK_CARRIER = "network_carrier";
    static final String NETWORK_COUNTRY = "network_country";
    static final String NETWORK_TYPE = "network_type";
    static final String SESSION_START_WALL_TIME = "session_start_wall_time";
    static final String TABLE_NAME = "sessions";
    static final String UUID = "uuid";
    
    private SessionsDbColumns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class UploadBlobEventsDbColumns
    implements BaseColumns
  {
    static final String EVENTS_KEY_REF = "events_key_ref";
    static final String TABLE_NAME = "upload_blob_events";
    static final String UPLOAD_BLOBS_KEY_REF = "upload_blobs_key_ref";
    
    private UploadBlobEventsDbColumns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
  
  static final class UploadBlobsDbColumns
    implements BaseColumns
  {
    static final String TABLE_NAME = "upload_blobs";
    static final String UUID = "uuid";
    
    private UploadBlobsDbColumns()
    {
      throw new UnsupportedOperationException("This class is non-instantiable");
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/MigrationDatabaseHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */