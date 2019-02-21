package org.pgsqlite;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.os.Build.VERSION;
import android.util.Base64;
import android.util.Log;
import com.belkin.controller.AppController;
import com.belkin.utils.LogUtils;
import com.belkin.utils.RuleUtility;
import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class SQLitePlugin
  extends CordovaPlugin
{
  private static final String TAG = SQLitePlugin.class.getSimpleName();
  static HashMap<String, SQLiteDatabase> dbmap = new HashMap();
  File dbfile;
  private AppController mAppController;
  
  private void closeDatabase(String paramString)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getDatabase(paramString);
      if ((!localSQLiteDatabase.inTransaction()) || (localSQLiteDatabase != null)) {
        dbmap.remove(paramString);
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  @SuppressLint({"NewApi"})
  private boolean deleteDatabase(String paramString)
  {
    if (getDatabase(paramString) != null) {
      closeDatabase(paramString);
    }
    File localFile = this.cordova.getActivity().getDatabasePath(paramString + ".db");
    Log.v("info", "delete sqlite db: " + localFile.getAbsolutePath());
    try
    {
      boolean bool = SQLiteDatabase.deleteDatabase(localFile);
      return bool;
    }
    catch (Exception localException)
    {
      Log.v("executeSqlBatch", "deleteDatabase(): Error=" + localException.getMessage());
      localException.printStackTrace();
    }
    return false;
  }
  
  /* Error */
  private void executeSqlBatch(String paramString, String[] paramArrayOfString1, JSONArray[] paramArrayOfJSONArray, String[] paramArrayOfString2, CallbackContext paramCallbackContext)
  {
    // Byte code:
    //   0: aload_0
    //   1: aload_1
    //   2: invokespecial 45	org/pgsqlite/SQLitePlugin:getDatabase	(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    //   5: astore 6
    //   7: aload 6
    //   9: ifnonnull +4 -> 13
    //   12: return
    //   13: aload 6
    //   15: invokevirtual 124	android/database/sqlite/SQLiteDatabase:isOpen	()Z
    //   18: ifne +17 -> 35
    //   21: aload_0
    //   22: aload_1
    //   23: ldc 126
    //   25: invokespecial 130	org/pgsqlite/SQLitePlugin:openDatabase	(Ljava/lang/String;Ljava/lang/String;)V
    //   28: aload_0
    //   29: aload_1
    //   30: invokespecial 45	org/pgsqlite/SQLitePlugin:getDatabase	(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    //   33: astore 6
    //   35: aload_2
    //   36: arraylength
    //   37: istore 7
    //   39: new 132	org/json/JSONArray
    //   42: dup
    //   43: invokespecial 133	org/json/JSONArray:<init>	()V
    //   46: astore 8
    //   48: iconst_0
    //   49: istore 9
    //   51: iload 9
    //   53: iload 7
    //   55: if_icmpge +1300 -> 1355
    //   58: aload 4
    //   60: iload 9
    //   62: aaload
    //   63: astore 10
    //   65: aconst_null
    //   66: astore 11
    //   68: ldc -121
    //   70: astore 12
    //   72: iconst_1
    //   73: istore 13
    //   75: aload_2
    //   76: iload 9
    //   78: aaload
    //   79: astore 30
    //   81: ldc 112
    //   83: new 77	java/lang/StringBuilder
    //   86: dup
    //   87: invokespecial 78	java/lang/StringBuilder:<init>	()V
    //   90: ldc -119
    //   92: invokevirtual 82	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   95: aload 30
    //   97: invokevirtual 82	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   100: invokevirtual 87	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   103: invokestatic 108	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   106: pop
    //   107: getstatic 143	android/os/Build$VERSION:SDK_INT	I
    //   110: istore 32
    //   112: aconst_null
    //   113: astore 11
    //   115: iload 32
    //   117: bipush 11
    //   119: if_icmplt +1271 -> 1390
    //   122: aload 30
    //   124: invokestatic 149	java/util/Locale:getDefault	()Ljava/util/Locale;
    //   127: invokevirtual 155	java/lang/String:toLowerCase	(Ljava/util/Locale;)Ljava/lang/String;
    //   130: ldc -99
    //   132: invokevirtual 160	java/lang/String:startsWith	(Ljava/lang/String;)Z
    //   135: istore 33
    //   137: aconst_null
    //   138: astore 11
    //   140: iload 33
    //   142: ifne +19 -> 161
    //   145: aload 30
    //   147: invokestatic 149	java/util/Locale:getDefault	()Ljava/util/Locale;
    //   150: invokevirtual 155	java/lang/String:toLowerCase	(Ljava/util/Locale;)Ljava/lang/String;
    //   153: ldc -94
    //   155: invokevirtual 160	java/lang/String:startsWith	(Ljava/lang/String;)Z
    //   158: ifeq +1232 -> 1390
    //   161: aload 6
    //   163: aload 30
    //   165: invokevirtual 166	android/database/sqlite/SQLiteDatabase:compileStatement	(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;
    //   168: astore 34
    //   170: aload_3
    //   171: ifnull +262 -> 433
    //   174: iconst_0
    //   175: istore 68
    //   177: aload_3
    //   178: iload 9
    //   180: aaload
    //   181: invokevirtual 170	org/json/JSONArray:length	()I
    //   184: istore 69
    //   186: aconst_null
    //   187: astore 11
    //   189: iload 68
    //   191: iload 69
    //   193: if_icmpge +240 -> 433
    //   196: aload_3
    //   197: iload 9
    //   199: aaload
    //   200: iload 68
    //   202: invokevirtual 174	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   205: instanceof 176
    //   208: istore 70
    //   210: aconst_null
    //   211: astore 11
    //   213: iload 70
    //   215: ifne +18 -> 233
    //   218: aload_3
    //   219: iload 9
    //   221: aaload
    //   222: iload 68
    //   224: invokevirtual 174	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   227: instanceof 178
    //   230: ifeq +24 -> 254
    //   233: aload 34
    //   235: iload 68
    //   237: iconst_1
    //   238: iadd
    //   239: aload_3
    //   240: iload 9
    //   242: aaload
    //   243: iload 68
    //   245: invokevirtual 182	org/json/JSONArray:getDouble	(I)D
    //   248: invokevirtual 188	android/database/sqlite/SQLiteStatement:bindDouble	(ID)V
    //   251: goto +1145 -> 1396
    //   254: aload_3
    //   255: iload 9
    //   257: aaload
    //   258: iload 68
    //   260: invokevirtual 174	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   263: instanceof 190
    //   266: ifeq +122 -> 388
    //   269: aload 34
    //   271: iload 68
    //   273: iconst_1
    //   274: iadd
    //   275: aload_3
    //   276: iload 9
    //   278: aaload
    //   279: iload 68
    //   281: invokevirtual 194	org/json/JSONArray:getLong	(I)J
    //   284: invokevirtual 198	android/database/sqlite/SQLiteStatement:bindLong	(IJ)V
    //   287: goto +1109 -> 1396
    //   290: astore 14
    //   292: aload 14
    //   294: invokevirtual 58	java/lang/Exception:printStackTrace	()V
    //   297: aload 14
    //   299: invokevirtual 117	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   302: astore 12
    //   304: ldc 112
    //   306: new 77	java/lang/StringBuilder
    //   309: dup
    //   310: invokespecial 78	java/lang/StringBuilder:<init>	()V
    //   313: ldc -56
    //   315: invokevirtual 82	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   318: aload 12
    //   320: invokevirtual 82	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   323: invokevirtual 87	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   326: invokestatic 108	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   329: pop
    //   330: aload 11
    //   332: ifnull +913 -> 1245
    //   335: new 202	org/json/JSONObject
    //   338: dup
    //   339: invokespecial 203	org/json/JSONObject:<init>	()V
    //   342: astore 25
    //   344: aload 25
    //   346: ldc -51
    //   348: aload 10
    //   350: invokevirtual 209	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   353: pop
    //   354: aload 25
    //   356: ldc -45
    //   358: ldc -43
    //   360: invokevirtual 209	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   363: pop
    //   364: aload 25
    //   366: ldc -41
    //   368: aload 11
    //   370: invokevirtual 209	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   373: pop
    //   374: aload 8
    //   376: aload 25
    //   378: invokevirtual 218	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   381: pop
    //   382: iinc 9 1
    //   385: goto -334 -> 51
    //   388: aload_3
    //   389: iload 9
    //   391: aaload
    //   392: iload 68
    //   394: invokevirtual 222	org/json/JSONArray:isNull	(I)Z
    //   397: ifeq +15 -> 412
    //   400: aload 34
    //   402: iload 68
    //   404: iconst_1
    //   405: iadd
    //   406: invokevirtual 226	android/database/sqlite/SQLiteStatement:bindNull	(I)V
    //   409: goto +987 -> 1396
    //   412: aload 34
    //   414: iload 68
    //   416: iconst_1
    //   417: iadd
    //   418: aload_3
    //   419: iload 9
    //   421: aaload
    //   422: iload 68
    //   424: invokevirtual 230	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   427: invokevirtual 234	android/database/sqlite/SQLiteStatement:bindString	(ILjava/lang/String;)V
    //   430: goto +966 -> 1396
    //   433: iconst_m1
    //   434: istore 35
    //   436: aload 34
    //   438: invokevirtual 237	android/database/sqlite/SQLiteStatement:executeUpdateDelete	()I
    //   441: istore 67
    //   443: iload 67
    //   445: istore 35
    //   447: iconst_0
    //   448: istore 13
    //   450: iload 35
    //   452: iconst_m1
    //   453: if_icmpeq +937 -> 1390
    //   456: new 202	org/json/JSONObject
    //   459: dup
    //   460: invokespecial 203	org/json/JSONObject:<init>	()V
    //   463: astore 37
    //   465: aload 37
    //   467: ldc -17
    //   469: iload 35
    //   471: invokevirtual 242	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   474: pop
    //   475: aload 30
    //   477: invokestatic 149	java/util/Locale:getDefault	()Ljava/util/Locale;
    //   480: invokevirtual 155	java/lang/String:toLowerCase	(Ljava/util/Locale;)Ljava/lang/String;
    //   483: ldc -12
    //   485: invokevirtual 160	java/lang/String:startsWith	(Ljava/lang/String;)Z
    //   488: ifeq +277 -> 765
    //   491: aload_3
    //   492: ifnull +273 -> 765
    //   495: aload 6
    //   497: aload 30
    //   499: invokevirtual 166	android/database/sqlite/SQLiteDatabase:compileStatement	(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;
    //   502: astore 38
    //   504: iconst_0
    //   505: istore 39
    //   507: iload 39
    //   509: aload_3
    //   510: iload 9
    //   512: aaload
    //   513: invokevirtual 170	org/json/JSONArray:length	()I
    //   516: if_icmpge +184 -> 700
    //   519: aload_3
    //   520: iload 9
    //   522: aaload
    //   523: iload 39
    //   525: invokevirtual 174	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   528: instanceof 176
    //   531: ifne +18 -> 549
    //   534: aload_3
    //   535: iload 9
    //   537: aaload
    //   538: iload 39
    //   540: invokevirtual 174	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   543: instanceof 178
    //   546: ifeq +73 -> 619
    //   549: aload 38
    //   551: iload 39
    //   553: iconst_1
    //   554: iadd
    //   555: aload_3
    //   556: iload 9
    //   558: aaload
    //   559: iload 39
    //   561: invokevirtual 182	org/json/JSONArray:getDouble	(I)D
    //   564: invokevirtual 188	android/database/sqlite/SQLiteStatement:bindDouble	(ID)V
    //   567: iinc 39 1
    //   570: goto -63 -> 507
    //   573: astore 65
    //   575: aload 65
    //   577: invokevirtual 245	android/database/sqlite/SQLiteException:printStackTrace	()V
    //   580: aload 65
    //   582: invokevirtual 246	android/database/sqlite/SQLiteException:getMessage	()Ljava/lang/String;
    //   585: astore 12
    //   587: ldc 112
    //   589: new 77	java/lang/StringBuilder
    //   592: dup
    //   593: invokespecial 78	java/lang/StringBuilder:<init>	()V
    //   596: ldc -8
    //   598: invokevirtual 82	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   601: aload 12
    //   603: invokevirtual 82	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   606: invokevirtual 87	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   609: invokestatic 108	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   612: pop
    //   613: iconst_0
    //   614: istore 13
    //   616: goto -166 -> 450
    //   619: aload_3
    //   620: iload 9
    //   622: aaload
    //   623: iload 39
    //   625: invokevirtual 174	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   628: instanceof 190
    //   631: ifeq +24 -> 655
    //   634: aload 38
    //   636: iload 39
    //   638: iconst_1
    //   639: iadd
    //   640: aload_3
    //   641: iload 9
    //   643: aaload
    //   644: iload 39
    //   646: invokevirtual 194	org/json/JSONArray:getLong	(I)J
    //   649: invokevirtual 198	android/database/sqlite/SQLiteStatement:bindLong	(IJ)V
    //   652: goto -85 -> 567
    //   655: aload_3
    //   656: iload 9
    //   658: aaload
    //   659: iload 39
    //   661: invokevirtual 222	org/json/JSONArray:isNull	(I)Z
    //   664: ifeq +15 -> 679
    //   667: aload 38
    //   669: iload 39
    //   671: iconst_1
    //   672: iadd
    //   673: invokevirtual 226	android/database/sqlite/SQLiteStatement:bindNull	(I)V
    //   676: goto -109 -> 567
    //   679: aload 38
    //   681: iload 39
    //   683: iconst_1
    //   684: iadd
    //   685: aload_3
    //   686: iload 9
    //   688: aaload
    //   689: iload 39
    //   691: invokevirtual 230	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   694: invokevirtual 234	android/database/sqlite/SQLiteStatement:bindString	(ILjava/lang/String;)V
    //   697: goto -130 -> 567
    //   700: ldc2_w 249
    //   703: lstore 40
    //   705: aload 38
    //   707: invokevirtual 254	android/database/sqlite/SQLiteStatement:executeInsert	()J
    //   710: lstore 62
    //   712: lload 62
    //   714: lstore 40
    //   716: lload 40
    //   718: ldc2_w 249
    //   721: lcmp
    //   722: istore 44
    //   724: iconst_0
    //   725: istore 13
    //   727: iload 44
    //   729: ifeq +36 -> 765
    //   732: new 202	org/json/JSONObject
    //   735: dup
    //   736: invokespecial 203	org/json/JSONObject:<init>	()V
    //   739: astore 11
    //   741: aload 11
    //   743: ldc_w 256
    //   746: lload 40
    //   748: invokevirtual 259	org/json/JSONObject:put	(Ljava/lang/String;J)Lorg/json/JSONObject;
    //   751: pop
    //   752: aload 11
    //   754: ldc -17
    //   756: iconst_1
    //   757: invokevirtual 242	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   760: pop
    //   761: aload 11
    //   763: astore 37
    //   765: aload 30
    //   767: invokestatic 149	java/util/Locale:getDefault	()Ljava/util/Locale;
    //   770: invokevirtual 155	java/lang/String:toLowerCase	(Ljava/util/Locale;)Ljava/lang/String;
    //   773: ldc_w 261
    //   776: invokevirtual 160	java/lang/String:startsWith	(Ljava/lang/String;)Z
    //   779: istore 45
    //   781: iload 45
    //   783: ifeq +33 -> 816
    //   786: iconst_0
    //   787: istore 13
    //   789: aload 6
    //   791: invokevirtual 264	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   794: new 202	org/json/JSONObject
    //   797: dup
    //   798: invokespecial 203	org/json/JSONObject:<init>	()V
    //   801: astore 11
    //   803: aload 11
    //   805: ldc -17
    //   807: iconst_0
    //   808: invokevirtual 242	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   811: pop
    //   812: aload 11
    //   814: astore 37
    //   816: aload 30
    //   818: invokestatic 149	java/util/Locale:getDefault	()Ljava/util/Locale;
    //   821: invokevirtual 155	java/lang/String:toLowerCase	(Ljava/util/Locale;)Ljava/lang/String;
    //   824: ldc_w 266
    //   827: invokevirtual 160	java/lang/String:startsWith	(Ljava/lang/String;)Z
    //   830: istore 46
    //   832: iload 46
    //   834: ifeq +38 -> 872
    //   837: iconst_0
    //   838: istore 13
    //   840: aload 6
    //   842: invokevirtual 269	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   845: aload 6
    //   847: invokevirtual 272	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   850: new 202	org/json/JSONObject
    //   853: dup
    //   854: invokespecial 203	org/json/JSONObject:<init>	()V
    //   857: astore 11
    //   859: aload 11
    //   861: ldc -17
    //   863: iconst_0
    //   864: invokevirtual 242	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   867: pop
    //   868: aload 11
    //   870: astore 37
    //   872: aload 30
    //   874: invokestatic 149	java/util/Locale:getDefault	()Ljava/util/Locale;
    //   877: invokevirtual 155	java/lang/String:toLowerCase	(Ljava/util/Locale;)Ljava/lang/String;
    //   880: ldc_w 274
    //   883: invokevirtual 160	java/lang/String:startsWith	(Ljava/lang/String;)Z
    //   886: istore 47
    //   888: iload 47
    //   890: ifeq +493 -> 1383
    //   893: iconst_0
    //   894: istore 13
    //   896: aload 6
    //   898: invokevirtual 272	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   901: new 202	org/json/JSONObject
    //   904: dup
    //   905: invokespecial 203	org/json/JSONObject:<init>	()V
    //   908: astore 11
    //   910: aload 11
    //   912: ldc -17
    //   914: iconst_0
    //   915: invokevirtual 242	org/json/JSONObject:put	(Ljava/lang/String;I)Lorg/json/JSONObject;
    //   918: pop
    //   919: iload 13
    //   921: ifeq -591 -> 330
    //   924: aconst_null
    //   925: astore 48
    //   927: aload_3
    //   928: ifnull +265 -> 1193
    //   931: aload_3
    //   932: iload 9
    //   934: aaload
    //   935: invokevirtual 170	org/json/JSONArray:length	()I
    //   938: anewarray 151	java/lang/String
    //   941: astore 48
    //   943: iconst_0
    //   944: istore 50
    //   946: iload 50
    //   948: aload_3
    //   949: iload 9
    //   951: aaload
    //   952: invokevirtual 170	org/json/JSONArray:length	()I
    //   955: if_icmpge +238 -> 1193
    //   958: aload_3
    //   959: iload 9
    //   961: aaload
    //   962: iload 50
    //   964: invokevirtual 222	org/json/JSONArray:isNull	(I)Z
    //   967: ifeq +209 -> 1176
    //   970: aload 48
    //   972: iload 50
    //   974: ldc 126
    //   976: aastore
    //   977: iinc 50 1
    //   980: goto -34 -> 946
    //   983: astore 42
    //   985: aload 42
    //   987: invokevirtual 245	android/database/sqlite/SQLiteException:printStackTrace	()V
    //   990: aload 42
    //   992: invokevirtual 246	android/database/sqlite/SQLiteException:getMessage	()Ljava/lang/String;
    //   995: astore 12
    //   997: ldc 112
    //   999: new 77	java/lang/StringBuilder
    //   1002: dup
    //   1003: invokespecial 78	java/lang/StringBuilder:<init>	()V
    //   1006: ldc_w 276
    //   1009: invokevirtual 82	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1012: aload 12
    //   1014: invokevirtual 82	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1017: invokevirtual 87	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1020: invokestatic 108	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   1023: pop
    //   1024: goto -308 -> 716
    //   1027: astore 57
    //   1029: aload 37
    //   1031: astore 11
    //   1033: aload 57
    //   1035: invokevirtual 245	android/database/sqlite/SQLiteException:printStackTrace	()V
    //   1038: aload 57
    //   1040: invokevirtual 246	android/database/sqlite/SQLiteException:getMessage	()Ljava/lang/String;
    //   1043: astore 12
    //   1045: ldc 112
    //   1047: new 77	java/lang/StringBuilder
    //   1050: dup
    //   1051: invokespecial 78	java/lang/StringBuilder:<init>	()V
    //   1054: ldc_w 278
    //   1057: invokevirtual 82	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1060: aload 12
    //   1062: invokevirtual 82	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1065: invokevirtual 87	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1068: invokestatic 108	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   1071: pop
    //   1072: aload 11
    //   1074: astore 37
    //   1076: iconst_0
    //   1077: istore 13
    //   1079: goto -263 -> 816
    //   1082: aload 54
    //   1084: invokevirtual 245	android/database/sqlite/SQLiteException:printStackTrace	()V
    //   1087: aload 54
    //   1089: invokevirtual 246	android/database/sqlite/SQLiteException:getMessage	()Ljava/lang/String;
    //   1092: astore 12
    //   1094: ldc 112
    //   1096: new 77	java/lang/StringBuilder
    //   1099: dup
    //   1100: invokespecial 78	java/lang/StringBuilder:<init>	()V
    //   1103: ldc_w 280
    //   1106: invokevirtual 82	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1109: aload 12
    //   1111: invokevirtual 82	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1114: invokevirtual 87	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1117: invokestatic 108	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   1120: pop
    //   1121: aload 11
    //   1123: astore 37
    //   1125: iconst_0
    //   1126: istore 13
    //   1128: goto -256 -> 872
    //   1131: aload 51
    //   1133: invokevirtual 245	android/database/sqlite/SQLiteException:printStackTrace	()V
    //   1136: aload 51
    //   1138: invokevirtual 246	android/database/sqlite/SQLiteException:getMessage	()Ljava/lang/String;
    //   1141: astore 12
    //   1143: ldc 112
    //   1145: new 77	java/lang/StringBuilder
    //   1148: dup
    //   1149: invokespecial 78	java/lang/StringBuilder:<init>	()V
    //   1152: ldc_w 282
    //   1155: invokevirtual 82	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1158: aload 12
    //   1160: invokevirtual 82	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1163: invokevirtual 87	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1166: invokestatic 108	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   1169: pop
    //   1170: iconst_0
    //   1171: istore 13
    //   1173: goto -254 -> 919
    //   1176: aload 48
    //   1178: iload 50
    //   1180: aload_3
    //   1181: iload 9
    //   1183: aaload
    //   1184: iload 50
    //   1186: invokevirtual 230	org/json/JSONArray:getString	(I)Ljava/lang/String;
    //   1189: aastore
    //   1190: goto -213 -> 977
    //   1193: aload 6
    //   1195: aload 30
    //   1197: aload 48
    //   1199: invokevirtual 286	android/database/sqlite/SQLiteDatabase:rawQuery	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   1202: astore 49
    //   1204: aload 10
    //   1206: invokevirtual 287	java/lang/String:length	()I
    //   1209: ifle +11 -> 1220
    //   1212: aload_0
    //   1213: aload 49
    //   1215: invokespecial 291	org/pgsqlite/SQLitePlugin:getRowsResultFromQuery	(Landroid/database/Cursor;)Lorg/json/JSONObject;
    //   1218: astore 11
    //   1220: aload 49
    //   1222: ifnull -892 -> 330
    //   1225: aload 49
    //   1227: invokeinterface 296 1 0
    //   1232: ifne -902 -> 330
    //   1235: aload 49
    //   1237: invokeinterface 299 1 0
    //   1242: goto -912 -> 330
    //   1245: new 202	org/json/JSONObject
    //   1248: dup
    //   1249: invokespecial 203	org/json/JSONObject:<init>	()V
    //   1252: astore 16
    //   1254: aload 16
    //   1256: ldc -51
    //   1258: aload 10
    //   1260: invokevirtual 209	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   1263: pop
    //   1264: aload 16
    //   1266: ldc -45
    //   1268: ldc_w 301
    //   1271: invokevirtual 209	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   1274: pop
    //   1275: new 202	org/json/JSONObject
    //   1278: dup
    //   1279: invokespecial 203	org/json/JSONObject:<init>	()V
    //   1282: astore 21
    //   1284: aload 21
    //   1286: ldc_w 303
    //   1289: aload 12
    //   1291: invokevirtual 209	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   1294: pop
    //   1295: aload 16
    //   1297: ldc -41
    //   1299: aload 21
    //   1301: invokevirtual 209	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   1304: pop
    //   1305: aload 8
    //   1307: aload 16
    //   1309: invokevirtual 218	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   1312: pop
    //   1313: goto -931 -> 382
    //   1316: astore 17
    //   1318: aload 17
    //   1320: invokevirtual 304	org/json/JSONException:printStackTrace	()V
    //   1323: ldc 112
    //   1325: new 77	java/lang/StringBuilder
    //   1328: dup
    //   1329: invokespecial 78	java/lang/StringBuilder:<init>	()V
    //   1332: ldc -56
    //   1334: invokevirtual 82	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1337: aload 17
    //   1339: invokevirtual 305	org/json/JSONException:getMessage	()Ljava/lang/String;
    //   1342: invokevirtual 82	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1345: invokevirtual 87	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1348: invokestatic 108	android/util/Log:v	(Ljava/lang/String;Ljava/lang/String;)I
    //   1351: pop
    //   1352: goto -970 -> 382
    //   1355: aload 5
    //   1357: aload 8
    //   1359: invokevirtual 310	org/apache/cordova/CallbackContext:success	(Lorg/json/JSONArray;)V
    //   1362: return
    //   1363: astore 36
    //   1365: goto -915 -> 450
    //   1368: astore 51
    //   1370: goto -239 -> 1131
    //   1373: astore 54
    //   1375: goto -293 -> 1082
    //   1378: astore 57
    //   1380: goto -347 -> 1033
    //   1383: aload 37
    //   1385: astore 11
    //   1387: goto -468 -> 919
    //   1390: aconst_null
    //   1391: astore 37
    //   1393: goto -918 -> 475
    //   1396: iinc 68 1
    //   1399: goto -1222 -> 177
    //   1402: astore 14
    //   1404: aload 37
    //   1406: astore 11
    //   1408: goto -1116 -> 292
    //   1411: astore 54
    //   1413: aload 37
    //   1415: astore 11
    //   1417: goto -335 -> 1082
    //   1420: astore 51
    //   1422: aload 37
    //   1424: astore 11
    //   1426: goto -295 -> 1131
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1429	0	this	SQLitePlugin
    //   0	1429	1	paramString	String
    //   0	1429	2	paramArrayOfString1	String[]
    //   0	1429	3	paramArrayOfJSONArray	JSONArray[]
    //   0	1429	4	paramArrayOfString2	String[]
    //   0	1429	5	paramCallbackContext	CallbackContext
    //   5	1189	6	localSQLiteDatabase	SQLiteDatabase
    //   37	19	7	i	int
    //   46	1312	8	localJSONArray	JSONArray
    //   49	1133	9	j	int
    //   63	1196	10	str1	String
    //   66	1359	11	localObject1	Object
    //   70	1220	12	str2	String
    //   73	1099	13	k	int
    //   290	8	14	localException1	Exception
    //   1402	1	14	localException2	Exception
    //   1252	56	16	localJSONObject1	JSONObject
    //   1316	22	17	localJSONException	JSONException
    //   1282	18	21	localJSONObject2	JSONObject
    //   342	35	25	localJSONObject3	JSONObject
    //   79	1117	30	str3	String
    //   110	10	32	m	int
    //   135	6	33	bool1	boolean
    //   168	269	34	localSQLiteStatement1	android.database.sqlite.SQLiteStatement
    //   434	36	35	n	int
    //   1363	1	36	localException3	Exception
    //   463	960	37	localObject2	Object
    //   502	204	38	localSQLiteStatement2	android.database.sqlite.SQLiteStatement
    //   505	185	39	i1	int
    //   703	44	40	l1	long
    //   983	8	42	localSQLiteException1	SQLiteException
    //   722	6	44	bool2	boolean
    //   779	3	45	bool3	boolean
    //   830	3	46	bool4	boolean
    //   886	3	47	bool5	boolean
    //   925	273	48	arrayOfString	String[]
    //   1202	34	49	localCursor	Cursor
    //   944	241	50	i2	int
    //   1131	6	51	localObject3	Object
    //   1368	1	51	localSQLiteException2	SQLiteException
    //   1420	1	51	localSQLiteException3	SQLiteException
    //   1082	6	54	localObject4	Object
    //   1373	1	54	localSQLiteException4	SQLiteException
    //   1411	1	54	localSQLiteException5	SQLiteException
    //   1027	12	57	localSQLiteException6	SQLiteException
    //   1378	1	57	localSQLiteException7	SQLiteException
    //   710	3	62	l2	long
    //   573	8	65	localSQLiteException8	SQLiteException
    //   441	3	67	i3	int
    //   175	1222	68	i4	int
    //   184	10	69	i5	int
    //   208	6	70	bool6	boolean
    // Exception table:
    //   from	to	target	type
    //   75	112	290	java/lang/Exception
    //   122	137	290	java/lang/Exception
    //   145	161	290	java/lang/Exception
    //   161	170	290	java/lang/Exception
    //   177	186	290	java/lang/Exception
    //   196	210	290	java/lang/Exception
    //   218	233	290	java/lang/Exception
    //   233	251	290	java/lang/Exception
    //   254	287	290	java/lang/Exception
    //   388	409	290	java/lang/Exception
    //   412	430	290	java/lang/Exception
    //   456	465	290	java/lang/Exception
    //   575	613	290	java/lang/Exception
    //   741	761	290	java/lang/Exception
    //   803	812	290	java/lang/Exception
    //   859	868	290	java/lang/Exception
    //   910	919	290	java/lang/Exception
    //   931	943	290	java/lang/Exception
    //   946	977	290	java/lang/Exception
    //   1033	1072	290	java/lang/Exception
    //   1082	1121	290	java/lang/Exception
    //   1131	1170	290	java/lang/Exception
    //   1176	1190	290	java/lang/Exception
    //   1193	1220	290	java/lang/Exception
    //   1225	1242	290	java/lang/Exception
    //   436	443	573	android/database/sqlite/SQLiteException
    //   705	712	983	android/database/sqlite/SQLiteException
    //   789	803	1027	android/database/sqlite/SQLiteException
    //   335	382	1316	org/json/JSONException
    //   1245	1313	1316	org/json/JSONException
    //   436	443	1363	java/lang/Exception
    //   910	919	1368	android/database/sqlite/SQLiteException
    //   859	868	1373	android/database/sqlite/SQLiteException
    //   803	812	1378	android/database/sqlite/SQLiteException
    //   465	475	1402	java/lang/Exception
    //   475	491	1402	java/lang/Exception
    //   495	504	1402	java/lang/Exception
    //   507	549	1402	java/lang/Exception
    //   549	567	1402	java/lang/Exception
    //   619	652	1402	java/lang/Exception
    //   655	676	1402	java/lang/Exception
    //   679	697	1402	java/lang/Exception
    //   705	712	1402	java/lang/Exception
    //   732	741	1402	java/lang/Exception
    //   765	781	1402	java/lang/Exception
    //   789	803	1402	java/lang/Exception
    //   816	832	1402	java/lang/Exception
    //   840	859	1402	java/lang/Exception
    //   872	888	1402	java/lang/Exception
    //   896	910	1402	java/lang/Exception
    //   985	1024	1402	java/lang/Exception
    //   840	859	1411	android/database/sqlite/SQLiteException
    //   896	910	1420	android/database/sqlite/SQLiteException
  }
  
  private void executeSqlBatchInBackground(final String paramString, final String[] paramArrayOfString1, final JSONArray[] paramArrayOfJSONArray, final String[] paramArrayOfString2, final CallbackContext paramCallbackContext)
  {
    this.cordova.getThreadPool().execute(new Runnable()
    {
      public void run()
      {
        synchronized (jdField_this)
        {
          jdField_this.executeSqlBatch(paramString, paramArrayOfString1, paramArrayOfJSONArray, paramArrayOfString2, paramCallbackContext);
          return;
        }
      }
    });
  }
  
  private SQLiteDatabase getDatabase(String paramString)
  {
    return SQLiteDBInstances.getDBInstance(paramString);
  }
  
  private JSONObject getRowsResultFromQuery(Cursor paramCursor)
  {
    JSONObject localJSONObject1 = new JSONObject();
    JSONArray localJSONArray;
    int i;
    JSONObject localJSONObject2;
    if (paramCursor.moveToFirst())
    {
      localJSONArray = new JSONArray();
      i = paramCursor.getColumnCount();
      localJSONObject2 = new JSONObject();
    }
    label304:
    for (int j = 0;; j++)
    {
      String str;
      if (j < i) {
        try
        {
          str = paramCursor.getColumnName(j);
          int k = Build.VERSION.SDK_INT;
          if (k >= 11)
          {
            try
            {
              switch (paramCursor.getType(j))
              {
              case 3: 
              default: 
                localJSONObject2.put(str, paramCursor.getString(j));
              }
            }
            catch (Exception localException)
            {
              localJSONObject2.put(str, paramCursor.getString(j));
            }
            localJSONObject2.put(str, JSONObject.NULL);
          }
        }
        catch (JSONException localJSONException2)
        {
          localJSONException2.printStackTrace();
        }
      }
      while (!paramCursor.moveToNext())
      {
        try
        {
          localJSONObject1.put("rows", localJSONArray);
          return localJSONObject1;
        }
        catch (JSONException localJSONException1)
        {
          localJSONException1.printStackTrace();
          return localJSONObject1;
        }
        localJSONObject2.put(str, paramCursor.getInt(j));
        break label304;
        localJSONObject2.put(str, paramCursor.getFloat(j));
        break label304;
        localJSONObject2.put(str, new String(Base64.encode(paramCursor.getBlob(j), 0)));
        break label304;
        localJSONObject2.put(str, paramCursor.getString(j));
        break label304;
        localJSONArray.put(localJSONObject2);
      }
      break;
    }
  }
  
  private void openDatabase(String paramString1, String paramString2)
  {
    if ((getDatabase(paramString1) != null) && (getDatabase(paramString1).isOpen())) {
      closeDatabase(paramString1);
    }
    String str = RuleUtility.getLocalDBPath() + RuleUtility.getLocalDBName();
    this.dbfile = new File(str);
    if (!this.dbfile.exists()) {
      this.dbfile.getParentFile().mkdirs();
    }
    Log.v("DBPLUGIN", "Open sqlite db: " + this.dbfile.getAbsolutePath());
    try
    {
      SQLiteDatabase localSQLiteDatabase2 = SQLiteDatabase.openDatabase(str, null, 16);
      localSQLiteDatabase1 = localSQLiteDatabase2;
    }
    catch (SQLiteException localSQLiteException)
    {
      for (;;)
      {
        LogUtils.errorLog(TAG, "SQLiteException while opening DB: ", localSQLiteException);
        SQLiteDatabase localSQLiteDatabase1 = SQLiteDatabase.openOrCreateDatabase(this.dbfile, null);
      }
    }
    SQLiteDBInstances.setDBInstance(paramString1, localSQLiteDatabase1);
    dbmap.put(paramString1, localSQLiteDatabase1);
  }
  
  private void sendJavascriptCB(String paramString)
  {
    this.mAppController = AppController.getInstance(this.cordova.getActivity().getApplicationContext());
    if (this.webView != null) {
      this.mAppController.sendJSCallBack(this.webView, paramString);
    }
  }
  
  public boolean execute(String paramString, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
  {
    for (;;)
    {
      int k;
      try
      {
        if (paramString.equals("open"))
        {
          openDatabase(paramJSONArray.getJSONObject(0).getString("name"), null);
          return true;
        }
        if (paramString.equals("close"))
        {
          closeDatabase(paramJSONArray.getJSONObject(0).getString("path"));
          return true;
        }
        if (paramString.equals("delete"))
        {
          if (Build.VERSION.SDK_INT < 16) {
            return false;
          }
          return deleteDatabase(paramJSONArray.getJSONObject(0).getString("path"));
        }
        if (paramString.equals("executePragmaStatement"))
        {
          String str2 = paramJSONArray.getString(0);
          String str3 = paramJSONArray.getString(1);
          JSONArray localJSONArray3;
          String[] arrayOfString3;
          if (paramJSONArray.length() < 3)
          {
            localJSONArray3 = null;
            arrayOfString3 = null;
            if (localJSONArray3 == null) {
              continue;
            }
            arrayOfString3 = new String[localJSONArray3.length()];
            k = 0;
            if (k >= localJSONArray3.length()) {
              continue;
            }
            if (localJSONArray3.isNull(k))
            {
              arrayOfString3[k] = "";
              break label502;
            }
          }
          else
          {
            localJSONArray3 = paramJSONArray.getJSONArray(2);
            continue;
          }
          arrayOfString3[k] = localJSONArray3.getString(k);
          break label502;
          String str4 = getRowsResultFromQuery(getDatabase(str2).rawQuery(str3, arrayOfString3)).getJSONArray("rows").toString();
          sendJavascriptCB("window.SQLitePluginCallback.p1('" + "1" + "', " + str4 + ");");
          return true;
        }
        else
        {
          if ((paramString.equals("executeSqlBatch")) || (paramString.equals("executeBatchTransaction")) || (paramString.equals("backgroundExecuteSqlBatch")))
          {
            String[] arrayOfString1 = null;
            JSONArray[] arrayOfJSONArray = null;
            JSONObject localJSONObject1 = paramJSONArray.getJSONObject(0);
            String str1 = localJSONObject1.getJSONObject("dbargs").getString("dbname");
            JSONArray localJSONArray1 = localJSONObject1.getJSONArray("executes");
            String[] arrayOfString2;
            if (localJSONArray1.isNull(0))
            {
              arrayOfString2 = new String[0];
              if (paramString.equals("backgroundExecuteSqlBatch"))
              {
                executeSqlBatchInBackground(str1, arrayOfString2, arrayOfJSONArray, arrayOfString1, paramCallbackContext);
                return true;
              }
            }
            else
            {
              int i = localJSONArray1.length();
              arrayOfString2 = new String[i];
              arrayOfString1 = new String[i];
              arrayOfJSONArray = new JSONArray[i];
              int j = 0;
              if (j < i)
              {
                JSONObject localJSONObject2 = localJSONArray1.getJSONObject(j);
                arrayOfString2[j] = localJSONObject2.getString("sql");
                arrayOfString1[j] = localJSONObject2.getString("qid");
                JSONArray localJSONArray2 = localJSONObject2.getJSONArray("params");
                localJSONArray2.length();
                arrayOfJSONArray[j] = localJSONArray2;
                j++;
                continue;
              }
              continue;
            }
            executeSqlBatch(str1, arrayOfString2, arrayOfJSONArray, arrayOfString1, paramCallbackContext);
          }
          return true;
        }
      }
      catch (JSONException localJSONException)
      {
        return false;
      }
      label502:
      k++;
    }
  }
  
  public void onDestroy()
  {
    while (!dbmap.isEmpty())
    {
      String str = (String)dbmap.keySet().iterator().next();
      closeDatabase(str);
      dbmap.remove(str);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/pgsqlite/SQLitePlugin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */