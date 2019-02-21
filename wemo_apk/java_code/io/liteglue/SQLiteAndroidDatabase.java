package io.liteglue;

import android.annotation.SuppressLint;
import android.database.Cursor;
import android.database.CursorWindow;
import android.database.sqlite.SQLiteCursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteStatement;
import android.os.Build.VERSION;
import android.util.Base64;
import android.util.Log;
import com.belkin.utils.LogUtils;
import java.io.File;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.cordova.CallbackContext;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

class SQLiteAndroidDatabase
{
  private static final Pattern DELETE_TABLE_NAME = Pattern.compile("^\\s*DELETE\\s+FROM\\s+(\\S+)", 2);
  private static final Pattern FIRST_WORD = Pattern.compile("^\\s*(\\S+)", 2);
  private static final String TAG = SQLiteAndroidDatabase.class.getSimpleName();
  private static final Pattern UPDATE_TABLE_NAME;
  private static final Pattern WHERE_CLAUSE = Pattern.compile("\\s+WHERE\\s+(.+)$", 2);
  File dbFile;
  SQLiteDatabase mydb;
  
  static
  {
    UPDATE_TABLE_NAME = Pattern.compile("^\\s*UPDATE\\s+(\\S+)", 2);
  }
  
  private void bindArgsToStatement(SQLiteStatement paramSQLiteStatement, JSONArray paramJSONArray)
    throws JSONException
  {
    int i = 0;
    if (i < paramJSONArray.length())
    {
      if (((paramJSONArray.get(i) instanceof Float)) || ((paramJSONArray.get(i) instanceof Double))) {
        paramSQLiteStatement.bindDouble(i + 1, paramJSONArray.getDouble(i));
      }
      for (;;)
      {
        i++;
        break;
        if ((paramJSONArray.get(i) instanceof Number)) {
          paramSQLiteStatement.bindLong(i + 1, paramJSONArray.getLong(i));
        } else if (paramJSONArray.isNull(i)) {
          paramSQLiteStatement.bindNull(i + 1);
        } else {
          paramSQLiteStatement.bindString(i + 1, paramJSONArray.getString(i));
        }
      }
    }
  }
  
  @SuppressLint({"NewApi"})
  private void bindPostHoneycomb(JSONObject paramJSONObject, String paramString, Cursor paramCursor, int paramInt)
    throws JSONException
  {
    switch (paramCursor.getType(paramInt))
    {
    case 3: 
    default: 
      paramJSONObject.put(paramString, paramCursor.getString(paramInt));
      return;
    case 0: 
      paramJSONObject.put(paramString, JSONObject.NULL);
      return;
    case 1: 
      paramJSONObject.put(paramString, paramCursor.getLong(paramInt));
      return;
    case 2: 
      paramJSONObject.put(paramString, paramCursor.getDouble(paramInt));
      return;
    }
    paramJSONObject.put(paramString, new String(Base64.encode(paramCursor.getBlob(paramInt), 0)));
  }
  
  private void bindPreHoneycomb(JSONObject paramJSONObject, String paramString, Cursor paramCursor, int paramInt)
    throws JSONException
  {
    CursorWindow localCursorWindow = ((SQLiteCursor)paramCursor).getWindow();
    int i = paramCursor.getPosition();
    if (localCursorWindow.isNull(i, paramInt))
    {
      paramJSONObject.put(paramString, JSONObject.NULL);
      return;
    }
    if (localCursorWindow.isLong(i, paramInt))
    {
      paramJSONObject.put(paramString, paramCursor.getLong(paramInt));
      return;
    }
    if (localCursorWindow.isFloat(i, paramInt))
    {
      paramJSONObject.put(paramString, paramCursor.getDouble(paramInt));
      return;
    }
    if (localCursorWindow.isBlob(i, paramInt))
    {
      paramJSONObject.put(paramString, new String(Base64.encode(paramCursor.getBlob(paramInt), 0)));
      return;
    }
    paramJSONObject.put(paramString, paramCursor.getString(paramInt));
  }
  
  private int countRowsAffectedCompat(QueryType paramQueryType, String paramString, JSONArray[] paramArrayOfJSONArray, SQLiteDatabase paramSQLiteDatabase, int paramInt)
    throws JSONException
  {
    Matcher localMatcher1 = WHERE_CLAUSE.matcher(paramString);
    String str1 = "";
    for (int i = 0; localMatcher1.find(i); i = localMatcher1.start(1)) {
      str1 = " WHERE " + localMatcher1.group(1);
    }
    int j = 0;
    for (int k = 0; k < str1.length(); k++) {
      if (str1.charAt(k) == '?') {
        j++;
      }
    }
    JSONArray localJSONArray1 = null;
    if (paramArrayOfJSONArray != null)
    {
      JSONArray localJSONArray2 = paramArrayOfJSONArray[paramInt];
      localJSONArray1 = new JSONArray();
      int m = localJSONArray2.length() - j;
      for (int n = m; n < localJSONArray2.length(); n++) {
        localJSONArray1.put(n - m, localJSONArray2.get(n));
      }
    }
    if (paramQueryType == QueryType.update)
    {
      Matcher localMatcher3 = UPDATE_TABLE_NAME.matcher(paramString);
      if (localMatcher3.find())
      {
        String str3 = localMatcher3.group(1);
        try
        {
          SQLiteStatement localSQLiteStatement2 = paramSQLiteDatabase.compileStatement("SELECT count(*) FROM " + str3 + str1);
          if (localJSONArray1 != null) {
            bindArgsToStatement(localSQLiteStatement2, localJSONArray1);
          }
          long l2 = localSQLiteStatement2.simpleQueryForLong();
          return (int)l2;
        }
        catch (Exception localException2)
        {
          Log.e(SQLiteAndroidDatabase.class.getSimpleName(), "uncaught", localException2);
        }
      }
    }
    for (;;)
    {
      return 0;
      Matcher localMatcher2 = DELETE_TABLE_NAME.matcher(paramString);
      if (localMatcher2.find())
      {
        String str2 = localMatcher2.group(1);
        try
        {
          SQLiteStatement localSQLiteStatement1 = paramSQLiteDatabase.compileStatement("SELECT count(*) FROM " + str2 + str1);
          bindArgsToStatement(localSQLiteStatement1, localJSONArray1);
          long l1 = localSQLiteStatement1.simpleQueryForLong();
          return (int)l1;
        }
        catch (Exception localException1)
        {
          Log.e(SQLiteAndroidDatabase.class.getSimpleName(), "uncaught", localException1);
        }
      }
    }
  }
  
  private JSONObject executeSqlStatementQuery(SQLiteDatabase paramSQLiteDatabase, String paramString, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
    throws Exception
  {
    JSONObject localJSONObject1 = new JSONObject();
    for (;;)
    {
      String[] arrayOfString;
      int i;
      try
      {
        arrayOfString = new String[paramJSONArray.length()];
        i = 0;
        if (i < paramJSONArray.length()) {
          if (paramJSONArray.isNull(i)) {
            arrayOfString[i] = "";
          } else {
            arrayOfString[i] = paramJSONArray.getString(i);
          }
        }
      }
      catch (Exception localException1)
      {
        localException1.printStackTrace();
        String str1 = localException1.getMessage();
        Log.v("executeSqlBatch", "SQLiteAndroidDatabase.executeSql[Batch](): Error=" + str1);
        throw localException1;
      }
      Cursor localCursor = paramSQLiteDatabase.rawQuery(paramString, arrayOfString);
      JSONArray localJSONArray;
      JSONObject localJSONObject2;
      int k;
      if ((localCursor != null) && (localCursor.moveToFirst()))
      {
        localJSONArray = new JSONArray();
        int j = localCursor.getColumnCount();
        localJSONObject2 = new JSONObject();
        k = 0;
        if (k >= j) {
          break label285;
        }
      }
      for (;;)
      {
        String str2;
        try
        {
          str2 = localCursor.getColumnName(k);
          int m = Build.VERSION.SDK_INT;
          if (m >= 11)
          {
            try
            {
              bindPostHoneycomb(localJSONObject2, str2, localCursor, k);
              k++;
            }
            catch (Exception localException2)
            {
              bindPreHoneycomb(localJSONObject2, str2, localCursor, k);
              continue;
            }
            if (localCursor.moveToNext()) {
              break;
            }
          }
        }
        catch (JSONException localJSONException2)
        {
          localJSONException2.printStackTrace();
        }
        try
        {
          localJSONObject1.put("rows", localJSONArray);
          if (localCursor != null) {
            localCursor.close();
          }
          return localJSONObject1;
          bindPreHoneycomb(localJSONObject2, str2, localCursor, k);
          continue;
          label285:
          localJSONArray.put(localJSONObject2);
        }
        catch (JSONException localJSONException1)
        {
          for (;;)
          {
            localJSONException1.printStackTrace();
          }
        }
      }
      i++;
    }
  }
  
  static QueryType getQueryType(String paramString)
  {
    Matcher localMatcher = FIRST_WORD.matcher(paramString);
    if (localMatcher.find()) {
      try
      {
        QueryType localQueryType = QueryType.valueOf(localMatcher.group(1).toLowerCase());
        return localQueryType;
      }
      catch (IllegalArgumentException localIllegalArgumentException) {}
    }
    return QueryType.other;
  }
  
  void bugWorkaround()
    throws Exception
  {
    closeDatabaseNow();
    open(this.dbFile);
  }
  
  void closeDatabaseNow()
  {
    if (this.mydb != null)
    {
      this.mydb.close();
      this.mydb = null;
    }
  }
  
  /* Error */
  @SuppressLint({"NewApi"})
  void executeSqlBatch(String[] paramArrayOfString1, JSONArray[] paramArrayOfJSONArray, String[] paramArrayOfString2, CallbackContext paramCallbackContext)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 323	io/liteglue/SQLiteAndroidDatabase:mydb	Landroid/database/sqlite/SQLiteDatabase;
    //   4: ifnonnull +12 -> 16
    //   7: aload 4
    //   9: ldc_w 329
    //   12: invokevirtual 335	org/apache/cordova/CallbackContext:error	(Ljava/lang/String;)V
    //   15: return
    //   16: aload_1
    //   17: arraylength
    //   18: istore 5
    //   20: new 56	org/json/JSONArray
    //   23: dup
    //   24: invokespecial 212	org/json/JSONArray:<init>	()V
    //   27: astore 6
    //   29: iconst_0
    //   30: istore 7
    //   32: iload 7
    //   34: iload 5
    //   36: if_icmpge +923 -> 959
    //   39: aload_3
    //   40: iload 7
    //   42: aaload
    //   43: astore 8
    //   45: aconst_null
    //   46: astore 9
    //   48: ldc_w 337
    //   51: astore 10
    //   53: iconst_1
    //   54: istore 11
    //   56: aload_1
    //   57: iload 7
    //   59: aaload
    //   60: astore 28
    //   62: aload 28
    //   64: invokestatic 339	io/liteglue/SQLiteAndroidDatabase:getQueryType	(Ljava/lang/String;)Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    //   67: astore 29
    //   69: getstatic 221	io/liteglue/SQLiteAndroidDatabase$QueryType:update	Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    //   72: astore 30
    //   74: aconst_null
    //   75: astore 9
    //   77: aload 29
    //   79: aload 30
    //   81: if_acmpeq +11 -> 92
    //   84: aload 29
    //   86: getstatic 342	io/liteglue/SQLiteAndroidDatabase$QueryType:delete	Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    //   89: if_acmpne +923 -> 1012
    //   92: getstatic 282	android/os/Build$VERSION:SDK_INT	I
    //   95: bipush 11
    //   97: if_icmplt +461 -> 558
    //   100: aload_0
    //   101: getfield 323	io/liteglue/SQLiteAndroidDatabase:mydb	Landroid/database/sqlite/SQLiteDatabase;
    //   104: aload 28
    //   106: invokevirtual 232	android/database/sqlite/SQLiteDatabase:compileStatement	(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;
    //   109: astore 56
    //   111: aconst_null
    //   112: astore 9
    //   114: aload_2
    //   115: ifnull +13 -> 128
    //   118: aload_0
    //   119: aload 56
    //   121: aload_2
    //   122: iload 7
    //   124: aaload
    //   125: invokespecial 234	io/liteglue/SQLiteAndroidDatabase:bindArgsToStatement	(Landroid/database/sqlite/SQLiteStatement;Lorg/json/JSONArray;)V
    //   128: iconst_m1
    //   129: istore 57
    //   131: aload 56
    //   133: invokevirtual 345	android/database/sqlite/SQLiteStatement:executeUpdateDelete	()I
    //   136: istore 63
    //   138: iload 63
    //   140: istore 57
    //   142: iconst_0
    //   143: istore 11
    //   145: iload 57
    //   147: istore 59
    //   149: aconst_null
    //   150: astore 9
    //   152: iload 59
    //   154: iconst_m1
    //   155: if_icmpeq +869 -> 1024
    //   158: new 118	org/json/JSONObject
    //   161: dup
    //   162: invokespecial 249	org/json/JSONObject:<init>	()V
    //   165: astore 34
    //   167: aload 34
    //   169: ldc_w 347
    //   172: iload 57
    //   174: invokevirtual 350	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   177: pop
    //   178: aload 34
    //   180: astore 9
    //   182: goto +842 -> 1024
    //   185: aload 29
    //   187: getstatic 353	io/liteglue/SQLiteAndroidDatabase$QueryType:insert	Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    //   190: if_acmpne +81 -> 271
    //   193: aload_2
    //   194: ifnull +77 -> 271
    //   197: iconst_0
    //   198: istore 11
    //   200: aload_0
    //   201: getfield 323	io/liteglue/SQLiteAndroidDatabase:mydb	Landroid/database/sqlite/SQLiteDatabase;
    //   204: aload 28
    //   206: invokevirtual 232	android/database/sqlite/SQLiteDatabase:compileStatement	(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;
    //   209: astore 48
    //   211: aload_0
    //   212: aload 48
    //   214: aload_2
    //   215: iload 7
    //   217: aaload
    //   218: invokespecial 234	io/liteglue/SQLiteAndroidDatabase:bindArgsToStatement	(Landroid/database/sqlite/SQLiteStatement;Lorg/json/JSONArray;)V
    //   221: aload 48
    //   223: invokevirtual 356	android/database/sqlite/SQLiteStatement:executeInsert	()J
    //   226: lstore 51
    //   228: new 118	org/json/JSONObject
    //   231: dup
    //   232: invokespecial 249	org/json/JSONObject:<init>	()V
    //   235: astore 9
    //   237: lload 51
    //   239: ldc2_w 357
    //   242: lcmp
    //   243: ifeq +345 -> 588
    //   246: aload 9
    //   248: ldc_w 360
    //   251: lload 51
    //   253: invokevirtual 130	org/json/JSONObject:put	(Ljava/lang/String;J)Lorg/json/JSONObject;
    //   256: pop
    //   257: aload 9
    //   259: ldc_w 347
    //   262: iconst_1
    //   263: invokevirtual 350	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   266: pop
    //   267: aload 9
    //   269: astore 34
    //   271: getstatic 363	io/liteglue/SQLiteAndroidDatabase$QueryType:begin	Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    //   274: astore 35
    //   276: aload 29
    //   278: aload 35
    //   280: if_acmpne +36 -> 316
    //   283: iconst_0
    //   284: istore 11
    //   286: aload_0
    //   287: getfield 323	io/liteglue/SQLiteAndroidDatabase:mydb	Landroid/database/sqlite/SQLiteDatabase;
    //   290: invokevirtual 366	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   293: new 118	org/json/JSONObject
    //   296: dup
    //   297: invokespecial 249	org/json/JSONObject:<init>	()V
    //   300: astore 9
    //   302: aload 9
    //   304: ldc_w 347
    //   307: iconst_0
    //   308: invokevirtual 350	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   311: pop
    //   312: aload 9
    //   314: astore 34
    //   316: getstatic 369	io/liteglue/SQLiteAndroidDatabase$QueryType:commit	Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    //   319: astore 36
    //   321: aload 29
    //   323: aload 36
    //   325: if_acmpne +43 -> 368
    //   328: iconst_0
    //   329: istore 11
    //   331: aload_0
    //   332: getfield 323	io/liteglue/SQLiteAndroidDatabase:mydb	Landroid/database/sqlite/SQLiteDatabase;
    //   335: invokevirtual 372	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   338: aload_0
    //   339: getfield 323	io/liteglue/SQLiteAndroidDatabase:mydb	Landroid/database/sqlite/SQLiteDatabase;
    //   342: invokevirtual 375	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   345: new 118	org/json/JSONObject
    //   348: dup
    //   349: invokespecial 249	org/json/JSONObject:<init>	()V
    //   352: astore 9
    //   354: aload 9
    //   356: ldc_w 347
    //   359: iconst_0
    //   360: invokevirtual 350	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   363: pop
    //   364: aload 9
    //   366: astore 34
    //   368: getstatic 378	io/liteglue/SQLiteAndroidDatabase$QueryType:rollback	Lio/liteglue/SQLiteAndroidDatabase$QueryType;
    //   371: astore 37
    //   373: aload 29
    //   375: aload 37
    //   377: if_acmpne +628 -> 1005
    //   380: iconst_0
    //   381: istore 11
    //   383: aload_0
    //   384: getfield 323	io/liteglue/SQLiteAndroidDatabase:mydb	Landroid/database/sqlite/SQLiteDatabase;
    //   387: invokevirtual 375	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   390: new 118	org/json/JSONObject
    //   393: dup
    //   394: invokespecial 249	org/json/JSONObject:<init>	()V
    //   397: astore 9
    //   399: aload 9
    //   401: ldc_w 347
    //   404: iconst_0
    //   405: invokevirtual 350	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   408: pop
    //   409: iload 11
    //   411: ifeq +37 -> 448
    //   414: aload_0
    //   415: aload_0
    //   416: getfield 323	io/liteglue/SQLiteAndroidDatabase:mydb	Landroid/database/sqlite/SQLiteDatabase;
    //   419: aload 28
    //   421: aload_2
    //   422: iload 7
    //   424: aaload
    //   425: aload 4
    //   427: invokespecial 380	io/liteglue/SQLiteAndroidDatabase:executeSqlStatementQuery	(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Lorg/json/JSONObject;
    //   430: astore 9
    //   432: iload 33
    //   434: ifeq +14 -> 448
    //   437: aload 9
    //   439: ldc_w 347
    //   442: iload 32
    //   444: invokevirtual 350	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   447: pop
    //   448: aload 9
    //   450: ifnull +394 -> 844
    //   453: new 118	org/json/JSONObject
    //   456: dup
    //   457: invokespecial 249	org/json/JSONObject:<init>	()V
    //   460: astore 23
    //   462: aload 23
    //   464: ldc_w 382
    //   467: aload 8
    //   469: invokevirtual 122	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   472: pop
    //   473: aload 23
    //   475: ldc_w 384
    //   478: ldc_w 386
    //   481: invokevirtual 122	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   484: pop
    //   485: aload 23
    //   487: ldc_w 388
    //   490: aload 9
    //   492: invokevirtual 122	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   495: pop
    //   496: aload 6
    //   498: aload 23
    //   500: invokevirtual 298	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   503: pop
    //   504: iinc 7 1
    //   507: goto -475 -> 32
    //   510: astore 61
    //   512: aload 61
    //   514: invokevirtual 389	android/database/sqlite/SQLiteException:printStackTrace	()V
    //   517: aload 61
    //   519: invokevirtual 390	android/database/sqlite/SQLiteException:getMessage	()Ljava/lang/String;
    //   522: astore 10
    //   524: ldc_w 257
    //   527: new 190	java/lang/StringBuilder
    //   530: dup
    //   531: invokespecial 191	java/lang/StringBuilder:<init>	()V
    //   534: ldc_w 392
    //   537: invokevirtual 197	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   540: aload 10
    //   542: invokevirtual 197	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   545: invokevirtual 203	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   548: invokestatic 263	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   551: pop
    //   552: iconst_0
    //   553: istore 11
    //   555: goto -410 -> 145
    //   558: aload_0
    //   559: aload 29
    //   561: aload 28
    //   563: aload_2
    //   564: aload_0
    //   565: getfield 323	io/liteglue/SQLiteAndroidDatabase:mydb	Landroid/database/sqlite/SQLiteDatabase;
    //   568: iload 7
    //   570: invokespecial 394	io/liteglue/SQLiteAndroidDatabase:countRowsAffectedCompat	(Lio/liteglue/SQLiteAndroidDatabase$QueryType;Ljava/lang/String;[Lorg/json/JSONArray;Landroid/database/sqlite/SQLiteDatabase;I)I
    //   573: istore 31
    //   575: iload 31
    //   577: istore 32
    //   579: iconst_1
    //   580: istore 33
    //   582: aconst_null
    //   583: astore 34
    //   585: goto -400 -> 185
    //   588: aload 9
    //   590: ldc_w 347
    //   593: iconst_0
    //   594: invokevirtual 350	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   597: pop
    //   598: goto -331 -> 267
    //   601: astore 49
    //   603: aload 49
    //   605: invokevirtual 389	android/database/sqlite/SQLiteException:printStackTrace	()V
    //   608: aload 49
    //   610: invokevirtual 390	android/database/sqlite/SQLiteException:getMessage	()Ljava/lang/String;
    //   613: astore 10
    //   615: ldc_w 257
    //   618: new 190	java/lang/StringBuilder
    //   621: dup
    //   622: invokespecial 191	java/lang/StringBuilder:<init>	()V
    //   625: ldc_w 396
    //   628: invokevirtual 197	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   631: aload 10
    //   633: invokevirtual 197	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   636: invokevirtual 203	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   639: invokestatic 263	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   642: pop
    //   643: aload 9
    //   645: astore 34
    //   647: iconst_0
    //   648: istore 11
    //   650: goto -379 -> 271
    //   653: aload 45
    //   655: invokevirtual 389	android/database/sqlite/SQLiteException:printStackTrace	()V
    //   658: aload 45
    //   660: invokevirtual 390	android/database/sqlite/SQLiteException:getMessage	()Ljava/lang/String;
    //   663: astore 10
    //   665: ldc_w 257
    //   668: new 190	java/lang/StringBuilder
    //   671: dup
    //   672: invokespecial 191	java/lang/StringBuilder:<init>	()V
    //   675: ldc_w 398
    //   678: invokevirtual 197	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   681: aload 10
    //   683: invokevirtual 197	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   686: invokevirtual 203	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   689: invokestatic 263	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   692: pop
    //   693: aload 9
    //   695: astore 34
    //   697: iconst_0
    //   698: istore 11
    //   700: goto -384 -> 316
    //   703: aload 42
    //   705: invokevirtual 389	android/database/sqlite/SQLiteException:printStackTrace	()V
    //   708: aload 42
    //   710: invokevirtual 390	android/database/sqlite/SQLiteException:getMessage	()Ljava/lang/String;
    //   713: astore 10
    //   715: ldc_w 257
    //   718: new 190	java/lang/StringBuilder
    //   721: dup
    //   722: invokespecial 191	java/lang/StringBuilder:<init>	()V
    //   725: ldc_w 400
    //   728: invokevirtual 197	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   731: aload 10
    //   733: invokevirtual 197	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   736: invokevirtual 203	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   739: invokestatic 263	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   742: pop
    //   743: aload 9
    //   745: astore 34
    //   747: iconst_0
    //   748: istore 11
    //   750: goto -382 -> 368
    //   753: aload 39
    //   755: invokevirtual 389	android/database/sqlite/SQLiteException:printStackTrace	()V
    //   758: aload 39
    //   760: invokevirtual 390	android/database/sqlite/SQLiteException:getMessage	()Ljava/lang/String;
    //   763: astore 10
    //   765: ldc_w 257
    //   768: new 190	java/lang/StringBuilder
    //   771: dup
    //   772: invokespecial 191	java/lang/StringBuilder:<init>	()V
    //   775: ldc_w 402
    //   778: invokevirtual 197	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   781: aload 10
    //   783: invokevirtual 197	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   786: invokevirtual 203	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   789: invokestatic 263	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   792: pop
    //   793: iconst_0
    //   794: istore 11
    //   796: goto -387 -> 409
    //   799: astore 12
    //   801: aload 12
    //   803: invokevirtual 252	java/lang/Exception:printStackTrace	()V
    //   806: aload 12
    //   808: invokevirtual 255	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   811: astore 10
    //   813: ldc_w 257
    //   816: new 190	java/lang/StringBuilder
    //   819: dup
    //   820: invokespecial 191	java/lang/StringBuilder:<init>	()V
    //   823: ldc_w 259
    //   826: invokevirtual 197	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   829: aload 10
    //   831: invokevirtual 197	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   834: invokevirtual 203	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   837: invokestatic 263	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   840: pop
    //   841: goto -393 -> 448
    //   844: new 118	org/json/JSONObject
    //   847: dup
    //   848: invokespecial 249	org/json/JSONObject:<init>	()V
    //   851: astore 14
    //   853: aload 14
    //   855: ldc_w 382
    //   858: aload 8
    //   860: invokevirtual 122	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   863: pop
    //   864: aload 14
    //   866: ldc_w 384
    //   869: ldc_w 403
    //   872: invokevirtual 122	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   875: pop
    //   876: new 118	org/json/JSONObject
    //   879: dup
    //   880: invokespecial 249	org/json/JSONObject:<init>	()V
    //   883: astore 19
    //   885: aload 19
    //   887: ldc_w 405
    //   890: aload 10
    //   892: invokevirtual 122	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   895: pop
    //   896: aload 14
    //   898: ldc_w 388
    //   901: aload 19
    //   903: invokevirtual 122	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   906: pop
    //   907: aload 6
    //   909: aload 14
    //   911: invokevirtual 298	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   914: pop
    //   915: goto -411 -> 504
    //   918: astore 15
    //   920: aload 15
    //   922: invokevirtual 287	org/json/JSONException:printStackTrace	()V
    //   925: ldc_w 257
    //   928: new 190	java/lang/StringBuilder
    //   931: dup
    //   932: invokespecial 191	java/lang/StringBuilder:<init>	()V
    //   935: ldc_w 259
    //   938: invokevirtual 197	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   941: aload 15
    //   943: invokevirtual 406	org/json/JSONException:getMessage	()Ljava/lang/String;
    //   946: invokevirtual 197	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   949: invokevirtual 203	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   952: invokestatic 263	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   955: pop
    //   956: goto -452 -> 504
    //   959: aload 4
    //   961: aload 6
    //   963: invokevirtual 409	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONArray;)V
    //   966: return
    //   967: astore 58
    //   969: goto -824 -> 145
    //   972: astore 12
    //   974: aload 34
    //   976: astore 9
    //   978: goto -177 -> 801
    //   981: astore 39
    //   983: goto -230 -> 753
    //   986: astore 42
    //   988: goto -285 -> 703
    //   991: astore 45
    //   993: goto -340 -> 653
    //   996: astore 49
    //   998: aload 34
    //   1000: astore 9
    //   1002: goto -399 -> 603
    //   1005: aload 34
    //   1007: astore 9
    //   1009: goto -600 -> 409
    //   1012: iconst_0
    //   1013: istore 33
    //   1015: aconst_null
    //   1016: astore 34
    //   1018: iconst_0
    //   1019: istore 32
    //   1021: goto -836 -> 185
    //   1024: aload 9
    //   1026: astore 34
    //   1028: iconst_0
    //   1029: istore 33
    //   1031: iconst_0
    //   1032: istore 32
    //   1034: goto -849 -> 185
    //   1037: astore 45
    //   1039: aload 34
    //   1041: astore 9
    //   1043: goto -390 -> 653
    //   1046: astore 42
    //   1048: aload 34
    //   1050: astore 9
    //   1052: goto -349 -> 703
    //   1055: astore 39
    //   1057: aload 34
    //   1059: astore 9
    //   1061: goto -308 -> 753
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1064	0	this	SQLiteAndroidDatabase
    //   0	1064	1	paramArrayOfString1	String[]
    //   0	1064	2	paramArrayOfJSONArray	JSONArray[]
    //   0	1064	3	paramArrayOfString2	String[]
    //   0	1064	4	paramCallbackContext	CallbackContext
    //   18	19	5	i	int
    //   27	935	6	localJSONArray	JSONArray
    //   30	539	7	j	int
    //   43	816	8	str1	String
    //   46	1014	9	localObject1	Object
    //   51	840	10	str2	String
    //   54	741	11	k	int
    //   799	8	12	localException1	Exception
    //   972	1	12	localException2	Exception
    //   851	59	14	localJSONObject1	JSONObject
    //   918	24	15	localJSONException	JSONException
    //   883	19	19	localJSONObject2	JSONObject
    //   460	39	23	localJSONObject3	JSONObject
    //   60	502	28	str3	String
    //   67	493	29	localQueryType1	QueryType
    //   72	8	30	localQueryType2	QueryType
    //   573	3	31	m	int
    //   442	591	32	n	int
    //   432	598	33	i1	int
    //   165	893	34	localObject2	Object
    //   274	5	35	localQueryType3	QueryType
    //   319	5	36	localQueryType4	QueryType
    //   371	5	37	localQueryType5	QueryType
    //   753	6	39	localObject3	Object
    //   981	1	39	localSQLiteException1	SQLiteException
    //   1055	1	39	localSQLiteException2	SQLiteException
    //   703	6	42	localObject4	Object
    //   986	1	42	localSQLiteException3	SQLiteException
    //   1046	1	42	localSQLiteException4	SQLiteException
    //   653	6	45	localObject5	Object
    //   991	1	45	localSQLiteException5	SQLiteException
    //   1037	1	45	localSQLiteException6	SQLiteException
    //   209	13	48	localSQLiteStatement1	SQLiteStatement
    //   601	8	49	localSQLiteException7	SQLiteException
    //   996	1	49	localSQLiteException8	SQLiteException
    //   226	26	51	l	long
    //   109	23	56	localSQLiteStatement2	SQLiteStatement
    //   129	44	57	i2	int
    //   967	1	58	localException3	Exception
    //   147	9	59	i3	int
    //   510	8	61	localSQLiteException9	SQLiteException
    //   136	3	63	i4	int
    // Exception table:
    //   from	to	target	type
    //   131	138	510	android/database/sqlite/SQLiteException
    //   246	267	601	android/database/sqlite/SQLiteException
    //   588	598	601	android/database/sqlite/SQLiteException
    //   56	74	799	java/lang/Exception
    //   84	92	799	java/lang/Exception
    //   92	111	799	java/lang/Exception
    //   118	128	799	java/lang/Exception
    //   158	167	799	java/lang/Exception
    //   246	267	799	java/lang/Exception
    //   302	312	799	java/lang/Exception
    //   354	364	799	java/lang/Exception
    //   399	409	799	java/lang/Exception
    //   414	432	799	java/lang/Exception
    //   437	448	799	java/lang/Exception
    //   512	552	799	java/lang/Exception
    //   558	575	799	java/lang/Exception
    //   588	598	799	java/lang/Exception
    //   603	643	799	java/lang/Exception
    //   653	693	799	java/lang/Exception
    //   703	743	799	java/lang/Exception
    //   753	793	799	java/lang/Exception
    //   453	504	918	org/json/JSONException
    //   844	915	918	org/json/JSONException
    //   131	138	967	java/lang/Exception
    //   167	178	972	java/lang/Exception
    //   185	193	972	java/lang/Exception
    //   200	221	972	java/lang/Exception
    //   221	237	972	java/lang/Exception
    //   271	276	972	java/lang/Exception
    //   286	302	972	java/lang/Exception
    //   316	321	972	java/lang/Exception
    //   331	354	972	java/lang/Exception
    //   368	373	972	java/lang/Exception
    //   383	399	972	java/lang/Exception
    //   399	409	981	android/database/sqlite/SQLiteException
    //   354	364	986	android/database/sqlite/SQLiteException
    //   302	312	991	android/database/sqlite/SQLiteException
    //   221	237	996	android/database/sqlite/SQLiteException
    //   286	302	1037	android/database/sqlite/SQLiteException
    //   331	354	1046	android/database/sqlite/SQLiteException
    //   383	399	1055	android/database/sqlite/SQLiteException
  }
  
  void open(File paramFile)
    throws Exception
  {
    this.dbFile = paramFile;
    try
    {
      this.mydb = SQLiteDatabase.openDatabase(paramFile.getAbsolutePath(), null, 16);
      return;
    }
    catch (SQLiteException localSQLiteException)
    {
      LogUtils.errorLog(TAG, "SQLiteException while opening DB: ", localSQLiteException);
      closeDatabaseNow();
      this.mydb = SQLiteDatabase.openOrCreateDatabase(paramFile, null);
    }
  }
  
  static enum QueryType
  {
    static
    {
      insert = new QueryType("insert", 1);
      delete = new QueryType("delete", 2);
      select = new QueryType("select", 3);
      begin = new QueryType("begin", 4);
      commit = new QueryType("commit", 5);
      rollback = new QueryType("rollback", 6);
      other = new QueryType("other", 7);
      QueryType[] arrayOfQueryType = new QueryType[8];
      arrayOfQueryType[0] = update;
      arrayOfQueryType[1] = insert;
      arrayOfQueryType[2] = delete;
      arrayOfQueryType[3] = select;
      arrayOfQueryType[4] = begin;
      arrayOfQueryType[5] = commit;
      arrayOfQueryType[6] = rollback;
      arrayOfQueryType[7] = other;
      $VALUES = arrayOfQueryType;
    }
    
    private QueryType() {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/io/liteglue/SQLiteAndroidDatabase.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */