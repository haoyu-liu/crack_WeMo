package com.belkin.wemo.sqlite;

import android.content.Context;
import android.database.DatabaseErrorHandler;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import android.database.sqlite.SQLiteException;
import android.text.TextUtils;
import com.belkin.wemo.cache.utils.SDKLogUtils;

public abstract class WeMoSqliteOpenHelper
{
  private static final String TAG = WeMoSqliteOpenHelper.class.getSimpleName();
  private final Context mContext;
  private SQLiteDatabase mDatabase;
  private boolean mEnableWriteAheadLogging;
  private final DatabaseErrorHandler mErrorHandler;
  private final SQLiteDatabase.CursorFactory mFactory;
  private boolean mIsInitializing;
  private final String mName;
  private final int mNewVersion;
  
  public WeMoSqliteOpenHelper(Context paramContext, String paramString, SQLiteDatabase.CursorFactory paramCursorFactory, int paramInt)
  {
    this(paramContext, paramString, paramCursorFactory, paramInt, null);
  }
  
  public WeMoSqliteOpenHelper(Context paramContext, String paramString, SQLiteDatabase.CursorFactory paramCursorFactory, int paramInt, DatabaseErrorHandler paramDatabaseErrorHandler)
  {
    if (paramInt < 1) {
      throw new IllegalArgumentException("Version must be >= 1, was " + paramInt);
    }
    this.mContext = paramContext;
    this.mName = paramString;
    this.mFactory = paramCursorFactory;
    this.mNewVersion = paramInt;
    this.mErrorHandler = paramDatabaseErrorHandler;
  }
  
  private SQLiteDatabase getDatabaseLocked()
  {
    if (this.mDatabase != null)
    {
      if (this.mDatabase.isOpen()) {
        break label39;
      }
      this.mDatabase = null;
    }
    while (this.mIsInitializing)
    {
      throw new IllegalStateException("getDatabase called recursively");
      label39:
      if (!this.mDatabase.isReadOnly())
      {
        localSQLiteDatabase = this.mDatabase;
        return localSQLiteDatabase;
      }
    }
    SQLiteDatabase localSQLiteDatabase = this.mDatabase;
    for (;;)
    {
      int i;
      try
      {
        this.mIsInitializing = true;
        if (localSQLiteDatabase == null)
        {
          if (TextUtils.isEmpty(this.mName))
          {
            localSQLiteDatabase = SQLiteDatabase.create(null);
            SDKLogUtils.debugLog(TAG, "A memory backed database has been created since Dataname is NULL");
          }
        }
        else
        {
          onConfigure(localSQLiteDatabase);
          i = localSQLiteDatabase.getVersion();
          if (i != this.mNewVersion)
          {
            localSQLiteDatabase.beginTransaction();
            if (i != 0) {
              break label252;
            }
          }
        }
      }
      finally
      {
        this.mIsInitializing = false;
        if ((localSQLiteDatabase != null) && (localSQLiteDatabase != this.mDatabase)) {
          localSQLiteDatabase.close();
        }
      }
      try
      {
        onCreate(localSQLiteDatabase);
        localSQLiteDatabase.setVersion(this.mNewVersion);
        localSQLiteDatabase.setTransactionSuccessful();
        localSQLiteDatabase.endTransaction();
        onOpen(localSQLiteDatabase);
        this.mDatabase = localSQLiteDatabase;
        this.mIsInitializing = false;
        if ((localSQLiteDatabase == null) || (localSQLiteDatabase == this.mDatabase)) {
          break;
        }
        return localSQLiteDatabase;
      }
      finally
      {
        label252:
        localSQLiteDatabase.endTransaction();
      }
      try
      {
        localSQLiteDatabase = SQLiteDatabase.openDatabase(this.mName, this.mFactory, 268435472, this.mErrorHandler);
        SDKLogUtils.debugLog(TAG, "Database opened (created if necessary): " + this.mName);
      }
      catch (SQLiteException localSQLiteException)
      {
        throw localSQLiteException;
      }
      if (i > this.mNewVersion) {
        onDowngrade(localSQLiteDatabase, i, this.mNewVersion);
      } else {
        onUpgrade(localSQLiteDatabase, i, this.mNewVersion);
      }
    }
  }
  
  public void close()
  {
    try
    {
      if (this.mIsInitializing) {
        throw new IllegalStateException("Closed during initialization");
      }
    }
    finally {}
    if ((this.mDatabase != null) && (this.mDatabase.isOpen()))
    {
      this.mDatabase.close();
      this.mDatabase = null;
    }
  }
  
  public String getDatabaseName()
  {
    return this.mName;
  }
  
  public SQLiteDatabase getWritableDatabase()
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getDatabaseLocked();
      return localSQLiteDatabase;
    }
    finally {}
  }
  
  public void onConfigure(SQLiteDatabase paramSQLiteDatabase) {}
  
  public abstract void onCreate(SQLiteDatabase paramSQLiteDatabase);
  
  public void onDowngrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
  {
    throw new SQLiteException("Can't downgrade database from version " + paramInt1 + " to " + paramInt2);
  }
  
  public void onOpen(SQLiteDatabase paramSQLiteDatabase) {}
  
  public abstract void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2);
  
  /* Error */
  public void setWriteAheadLoggingEnabled(boolean paramBoolean)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 166	com/belkin/wemo/sqlite/WeMoSqliteOpenHelper:mEnableWriteAheadLogging	Z
    //   6: iload_1
    //   7: if_icmpeq +47 -> 54
    //   10: aload_0
    //   11: getfield 73	com/belkin/wemo/sqlite/WeMoSqliteOpenHelper:mDatabase	Landroid/database/sqlite/SQLiteDatabase;
    //   14: ifnull +35 -> 49
    //   17: aload_0
    //   18: getfield 73	com/belkin/wemo/sqlite/WeMoSqliteOpenHelper:mDatabase	Landroid/database/sqlite/SQLiteDatabase;
    //   21: invokevirtual 79	android/database/sqlite/SQLiteDatabase:isOpen	()Z
    //   24: ifeq +25 -> 49
    //   27: aload_0
    //   28: getfield 73	com/belkin/wemo/sqlite/WeMoSqliteOpenHelper:mDatabase	Landroid/database/sqlite/SQLiteDatabase;
    //   31: invokevirtual 89	android/database/sqlite/SQLiteDatabase:isReadOnly	()Z
    //   34: ifne +15 -> 49
    //   37: iload_1
    //   38: ifeq +19 -> 57
    //   41: aload_0
    //   42: getfield 73	com/belkin/wemo/sqlite/WeMoSqliteOpenHelper:mDatabase	Landroid/database/sqlite/SQLiteDatabase;
    //   45: invokevirtual 169	android/database/sqlite/SQLiteDatabase:enableWriteAheadLogging	()Z
    //   48: pop
    //   49: aload_0
    //   50: iload_1
    //   51: putfield 166	com/belkin/wemo/sqlite/WeMoSqliteOpenHelper:mEnableWriteAheadLogging	Z
    //   54: aload_0
    //   55: monitorexit
    //   56: return
    //   57: aload_0
    //   58: getfield 73	com/belkin/wemo/sqlite/WeMoSqliteOpenHelper:mDatabase	Landroid/database/sqlite/SQLiteDatabase;
    //   61: invokevirtual 172	android/database/sqlite/SQLiteDatabase:disableWriteAheadLogging	()V
    //   64: goto -15 -> 49
    //   67: astore_2
    //   68: aload_0
    //   69: monitorexit
    //   70: aload_2
    //   71: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	72	0	this	WeMoSqliteOpenHelper
    //   0	72	1	paramBoolean	boolean
    //   67	4	2	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	37	67	finally
    //   41	49	67	finally
    //   49	54	67	finally
    //   54	56	67	finally
    //   57	64	67	finally
    //   68	70	67	finally
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/sqlite/WeMoSqliteOpenHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */