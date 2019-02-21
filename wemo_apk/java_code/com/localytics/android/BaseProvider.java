package com.localytics.android;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteQueryBuilder;
import java.io.File;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

abstract class BaseProvider
{
  static final String DATABASE_FILE = "com.localytics.android.%s.%s.sqlite";
  private static final String OLD_DATABASE_FILE = "com.localytics.android.%s.sqlite";
  private static final Map<String, String> sCountProjectionMap = Collections.unmodifiableMap(getCountProjectionMap());
  private static final Set<String> sValidTables = Collections.unmodifiableSet(getValidTables());
  SQLiteDatabase mDb;
  LocalyticsDao mLocalyticsDao;
  
  BaseProvider(LocalyticsDao paramLocalyticsDao)
  {
    this.mLocalyticsDao = paramLocalyticsDao;
  }
  
  static boolean deleteDirectory(File paramFile)
  {
    if ((paramFile.exists()) && (paramFile.isDirectory()))
    {
      String[] arrayOfString = paramFile.list();
      int i = arrayOfString.length;
      for (int j = 0; j < i; j++) {
        if (!deleteDirectory(new File(paramFile, arrayOfString[j]))) {
          return false;
        }
      }
    }
    return paramFile.delete();
  }
  
  static void deleteOldFiles(Context paramContext)
  {
    deleteDirectory(new File(paramContext.getFilesDir(), "localytics"));
  }
  
  private static HashMap<String, String> getCountProjectionMap()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("_count", "COUNT(*)");
    return localHashMap;
  }
  
  private int getNumberOfRows(String paramString)
  {
    return query(paramString, null, null, null, null).getCount();
  }
  
  private static Set<String> getValidTables()
  {
    HashSet localHashSet = new HashSet();
    localHashSet.add("events");
    localHashSet.add("custom_dimensions");
    localHashSet.add("info");
    localHashSet.add("identifiers");
    localHashSet.add("changes");
    localHashSet.add("marketing_rules");
    localHashSet.add("marketing_ruleevent");
    localHashSet.add("marketing_conditions");
    localHashSet.add("marketing_condition_values");
    localHashSet.add("marketing_displayed");
    return localHashSet;
  }
  
  private static boolean isValidTable(String paramString)
  {
    return (paramString != null) && (sValidTables.contains(paramString));
  }
  
  abstract boolean canAddToDB();
  
  void close()
  {
    this.mDb.close();
  }
  
  long insert(String paramString, ContentValues paramContentValues)
  {
    Object[] arrayOfObject1 = new Object[2];
    arrayOfObject1[0] = paramString;
    arrayOfObject1[1] = paramContentValues.toString();
    Localytics.Log.v(String.format("Insert table: %s, values: %s", arrayOfObject1));
    if (!canAddToDB())
    {
      Localytics.Log.v("Database is full; data not inserted");
      return -1L;
    }
    long l = this.mDb.insertOrThrow(paramString, null, paramContentValues);
    Object[] arrayOfObject2 = new Object[1];
    arrayOfObject2[0] = Long.valueOf(l);
    Localytics.Log.v(String.format("Inserted row with new id %d", arrayOfObject2));
    return l;
  }
  
  abstract long maxSiloDbSize();
  
  Cursor query(String paramString1, String[] paramArrayOfString1, String paramString2, String[] paramArrayOfString2, String paramString3)
  {
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = paramString1;
    arrayOfObject[1] = Arrays.toString(paramArrayOfString1);
    arrayOfObject[2] = paramString2;
    arrayOfObject[3] = Arrays.toString(paramArrayOfString2);
    Localytics.Log.v(String.format("Query table: %s, projection: %s, selection: %s, selectionArgs: %s", arrayOfObject));
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables(paramString1);
    if ((paramArrayOfString1 != null) && (1 == paramArrayOfString1.length) && ("_count".equals(paramArrayOfString1[0]))) {
      localSQLiteQueryBuilder.setProjectionMap(sCountProjectionMap);
    }
    Cursor localCursor = localSQLiteQueryBuilder.query(this.mDb, paramArrayOfString1, paramString2, paramArrayOfString2, null, null, paramString3);
    Localytics.Log.v("Query result is: " + DatabaseUtils.dumpCursorToString(localCursor));
    return localCursor;
  }
  
  int remove(String paramString1, String paramString2, String[] paramArrayOfString)
  {
    Object[] arrayOfObject1 = new Object[3];
    arrayOfObject1[0] = paramString1;
    arrayOfObject1[1] = paramString2;
    arrayOfObject1[2] = Arrays.toString(paramArrayOfString);
    Localytics.Log.v(String.format("Delete table: %s, selection: %s, selectionArgs: %s", arrayOfObject1));
    if (paramString2 == null) {}
    for (int i = this.mDb.delete(paramString1, "1", null);; i = this.mDb.delete(paramString1, paramString2, paramArrayOfString))
    {
      Object[] arrayOfObject2 = new Object[1];
      arrayOfObject2[0] = Integer.valueOf(i);
      Localytics.Log.v(String.format("Deleted %d rows", arrayOfObject2));
      return i;
    }
  }
  
  public void runBatchTransaction(Runnable paramRunnable)
  {
    this.mDb.beginTransaction();
    try
    {
      paramRunnable.run();
      this.mDb.setTransactionSuccessful();
      return;
    }
    finally
    {
      this.mDb.endTransaction();
    }
  }
  
  int update(String paramString1, ContentValues paramContentValues, String paramString2, String[] paramArrayOfString)
  {
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = paramString1;
    arrayOfObject[1] = paramContentValues.toString();
    arrayOfObject[2] = paramString2;
    arrayOfObject[3] = Arrays.toString(paramArrayOfString);
    Localytics.Log.v(String.format("Update table: %s, values: %s, selection: %s, selectionArgs: %s", arrayOfObject));
    return this.mDb.update(paramString1, paramContentValues, paramString2, paramArrayOfString);
  }
  
  void vacuumIfNecessary()
  {
    if (new File(this.mDb.getPath()).length() >= 0.8D * maxSiloDbSize()) {
      runBatchTransaction(new Runnable()
      {
        public void run()
        {
          Cursor localCursor = null;
          try
          {
            localCursor = BaseProvider.this.mDb.rawQuery("PRAGMA incremental_vacuum(0);", null);
            boolean bool;
            do
            {
              bool = localCursor.moveToNext();
            } while (bool);
            return;
          }
          catch (Exception localException)
          {
            Localytics.Log.w("Auto-vacuum error", localException);
            return;
          }
          finally
          {
            if (localCursor != null) {
              localCursor.close();
            }
          }
        }
      });
    }
  }
  
  static abstract class LocalyticsDatabaseHelper
    extends SQLiteOpenHelper
  {
    static final String SQLITE_BOOLEAN_FALSE = "0";
    static final String SQLITE_BOOLEAN_TRUE = "1";
    private static int completedMigrations;
    static SQLiteDatabase oldDB;
    private static File oldDBFile = null;
    LocalyticsDao mLocalyticsDao;
    
    /* Error */
    LocalyticsDatabaseHelper(String paramString, int paramInt, LocalyticsDao paramLocalyticsDao)
    {
      // Byte code:
      //   0: aload_0
      //   1: aload_3
      //   2: invokeinterface 33 1 0
      //   7: aload_1
      //   8: aconst_null
      //   9: iload_2
      //   10: invokespecial 36	android/database/sqlite/SQLiteOpenHelper:<init>	(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V
      //   13: aload_0
      //   14: aload_3
      //   15: putfield 38	com/localytics/android/BaseProvider$LocalyticsDatabaseHelper:mLocalyticsDao	Lcom/localytics/android/LocalyticsDao;
      //   18: ldc 2
      //   20: monitorenter
      //   21: getstatic 23	com/localytics/android/BaseProvider$LocalyticsDatabaseHelper:oldDBFile	Ljava/io/File;
      //   24: ifnonnull +90 -> 114
      //   27: iconst_1
      //   28: anewarray 40	java/lang/Object
      //   31: astore 5
      //   33: aload 5
      //   35: iconst_0
      //   36: aload_3
      //   37: invokeinterface 44 1 0
      //   42: invokestatic 50	com/localytics/android/DatapointHelper:getSha256_buggy	(Ljava/lang/String;)Ljava/lang/String;
      //   45: aastore
      //   46: ldc 52
      //   48: aload 5
      //   50: invokestatic 58	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
      //   53: astore 6
      //   55: new 60	java/io/File
      //   58: dup
      //   59: aload_3
      //   60: invokeinterface 33 1 0
      //   65: aload 6
      //   67: invokevirtual 66	android/content/Context:getDatabasePath	(Ljava/lang/String;)Ljava/io/File;
      //   70: invokevirtual 69	java/io/File:getPath	()Ljava/lang/String;
      //   73: invokespecial 72	java/io/File:<init>	(Ljava/lang/String;)V
      //   76: putstatic 23	com/localytics/android/BaseProvider$LocalyticsDatabaseHelper:oldDBFile	Ljava/io/File;
      //   79: getstatic 23	com/localytics/android/BaseProvider$LocalyticsDatabaseHelper:oldDBFile	Ljava/io/File;
      //   82: invokevirtual 76	java/io/File:exists	()Z
      //   85: ifeq +29 -> 114
      //   88: iconst_0
      //   89: putstatic 78	com/localytics/android/BaseProvider$LocalyticsDatabaseHelper:completedMigrations	I
      //   92: new 80	com/localytics/android/MigrationDatabaseHelper
      //   95: dup
      //   96: aload 6
      //   98: bipush 18
      //   100: aload_3
      //   101: invokespecial 82	com/localytics/android/MigrationDatabaseHelper:<init>	(Ljava/lang/String;ILcom/localytics/android/LocalyticsDao;)V
      //   104: astore 7
      //   106: aload 7
      //   108: invokevirtual 86	com/localytics/android/MigrationDatabaseHelper:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
      //   111: putstatic 88	com/localytics/android/BaseProvider$LocalyticsDatabaseHelper:oldDB	Landroid/database/sqlite/SQLiteDatabase;
      //   114: ldc 2
      //   116: monitorexit
      //   117: return
      //   118: astore 8
      //   120: ldc 90
      //   122: invokestatic 96	com/localytics/android/Localytics$Log:w	(Ljava/lang/String;)I
      //   125: pop
      //   126: goto -12 -> 114
      //   129: astore 4
      //   131: ldc 2
      //   133: monitorexit
      //   134: aload 4
      //   136: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	137	0	this	LocalyticsDatabaseHelper
      //   0	137	1	paramString	String
      //   0	137	2	paramInt	int
      //   0	137	3	paramLocalyticsDao	LocalyticsDao
      //   129	6	4	localObject	Object
      //   31	18	5	arrayOfObject	Object[]
      //   53	44	6	str	String
      //   104	3	7	localMigrationDatabaseHelper	MigrationDatabaseHelper
      //   118	1	8	localSQLiteException	android.database.sqlite.SQLiteException
      // Exception table:
      //   from	to	target	type
      //   106	114	118	android/database/sqlite/SQLiteException
      //   21	106	129	finally
      //   106	114	129	finally
      //   114	117	129	finally
      //   120	126	129	finally
      //   131	134	129	finally
    }
    
    static void cleanUpOldDB()
    {
      completedMigrations = 1 + completedMigrations;
      if (completedMigrations == 3)
      {
        oldDB.close();
        oldDBFile.delete();
      }
    }
    
    protected abstract void migrateV2ToV3(SQLiteDatabase paramSQLiteDatabase);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/BaseProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */