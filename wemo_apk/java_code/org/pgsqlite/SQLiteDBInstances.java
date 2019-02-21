package org.pgsqlite;

import android.database.sqlite.SQLiteDatabase;
import java.util.Hashtable;

public class SQLiteDBInstances
{
  private static Hashtable<String, SQLiteDatabase> dbInstances = null;
  
  public static SQLiteDatabase getDBInstance(String paramString)
  {
    if (dbInstances == null) {
      dbInstances = new Hashtable();
    }
    return (SQLiteDatabase)dbInstances.get(paramString);
  }
  
  public static void removeDBInstance(String paramString)
  {
    if (dbInstances == null) {
      return;
    }
    dbInstances.remove(paramString);
  }
  
  public static void setDBInstance(String paramString, SQLiteDatabase paramSQLiteDatabase)
  {
    if (dbInstances == null) {
      dbInstances = new Hashtable();
    }
    dbInstances.put(paramString, paramSQLiteDatabase);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/pgsqlite/SQLiteDBInstances.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */