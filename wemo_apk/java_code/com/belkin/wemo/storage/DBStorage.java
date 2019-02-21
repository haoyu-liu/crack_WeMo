package com.belkin.wemo.storage;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.belkin.wemo.cache.utils.SDKLogUtils;

public class DBStorage
  extends SQLiteOpenHelper
{
  private static final String DB_NAME = "db";
  private static final String FILE_COL_KEY = "FileName";
  private static final String FILE_COL_VALUE = "Timestamp";
  private static final String FILE_TABLE = "Files";
  private static final long STORAGE_TIMEOUT = 964130816L;
  private static DBStorage mInstance = null;
  private Context context = null;
  
  private DBStorage(Context paramContext)
  {
    super(paramContext, "db", null, 1);
    this.context = paramContext;
  }
  
  private void clearExpiredCache()
  {
    String[] arrayOfString;
    SQLiteDatabase localSQLiteDatabase;
    try
    {
      arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(System.currentTimeMillis() - 964130816L);
      localSQLiteDatabase = getWritableDatabase();
      Cursor localCursor = localSQLiteDatabase.query("Files", new String[] { "FileName" }, "Timestamp<?", arrayOfString, null, null, null);
      if (localCursor.getCount() > 0) {
        while (localCursor.moveToNext())
        {
          String str = localCursor.getString(0);
          SDKLogUtils.debugLog("WeMoSDK", "clearExpiredCache: Next Entry to clear: " + str);
          FileStorage.getInstance(this.context).clear(str);
        }
      }
      localCursor.close();
    }
    finally {}
    int i = localSQLiteDatabase.delete("Files", "Timestamp<?", arrayOfString);
    SDKLogUtils.debugLog("WeMoSDK", "DBStorage : " + i + " have been deleted");
  }
  
  public static DBStorage getInstance(Context paramContext)
  {
    SDKLogUtils.debugLog("WeMoSDK", "DBStorage getInstance()");
    if (mInstance == null)
    {
      mInstance = new DBStorage(paramContext);
      mInstance.clearExpiredCache();
    }
    return mInstance;
  }
  
  public void onCreate(SQLiteDatabase paramSQLiteDatabase)
  {
    paramSQLiteDatabase.execSQL("CREATE TABLE Files (FileName TEXT, Timestamp TEXT)");
  }
  
  public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
  {
    paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS Files");
    onCreate(paramSQLiteDatabase);
  }
  
  /* Error */
  public void putData(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokevirtual 53	com/belkin/wemo/storage/DBStorage:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   6: astore_3
    //   7: new 144	android/content/ContentValues
    //   10: dup
    //   11: invokespecial 145	android/content/ContentValues:<init>	()V
    //   14: astore 4
    //   16: aload 4
    //   18: ldc 11
    //   20: aload_1
    //   21: invokevirtual 148	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   24: aload 4
    //   26: ldc 14
    //   28: invokestatic 45	java/lang/System:currentTimeMillis	()J
    //   31: invokestatic 153	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   34: invokevirtual 156	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Long;)V
    //   37: aload_3
    //   38: ldc 17
    //   40: iconst_1
    //   41: anewarray 39	java/lang/String
    //   44: dup
    //   45: iconst_0
    //   46: ldc 14
    //   48: aastore
    //   49: ldc -98
    //   51: iconst_1
    //   52: anewarray 39	java/lang/String
    //   55: dup
    //   56: iconst_0
    //   57: aload_1
    //   58: aastore
    //   59: aconst_null
    //   60: aconst_null
    //   61: aconst_null
    //   62: invokevirtual 61	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   65: astore 5
    //   67: aload 5
    //   69: invokeinterface 67 1 0
    //   74: ifle +32 -> 106
    //   77: aload_3
    //   78: ldc 17
    //   80: aload 4
    //   82: ldc -98
    //   84: iconst_1
    //   85: anewarray 39	java/lang/String
    //   88: dup
    //   89: iconst_0
    //   90: aload_1
    //   91: aastore
    //   92: invokevirtual 162	android/database/sqlite/SQLiteDatabase:update	(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    //   95: pop
    //   96: aload 5
    //   98: invokeinterface 110 1 0
    //   103: aload_0
    //   104: monitorexit
    //   105: return
    //   106: aload_3
    //   107: ldc 17
    //   109: ldc 11
    //   111: aload 4
    //   113: invokevirtual 166	android/database/sqlite/SQLiteDatabase:replace	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    //   116: pop2
    //   117: goto -21 -> 96
    //   120: astore_2
    //   121: aload_0
    //   122: monitorexit
    //   123: aload_2
    //   124: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	125	0	this	DBStorage
    //   0	125	1	paramString	String
    //   120	4	2	localObject	Object
    //   6	101	3	localSQLiteDatabase	SQLiteDatabase
    //   14	98	4	localContentValues	android.content.ContentValues
    //   65	32	5	localCursor	Cursor
    // Exception table:
    //   from	to	target	type
    //   2	96	120	finally
    //   96	103	120	finally
    //   106	117	120	finally
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/storage/DBStorage.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */