package com.belkin.database;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;
import com.belkin.exception.DatabaseException;
import org.json.JSONArray;

public class BridgeLocalDatabase
{
  public static final String BRIDGE_DATABASE_NAME = "bridge_iconstore.db";
  public static final int BRIDGE_DATABASE_VERSION = 1;
  public static final String TABLE_LED_DEVICES = "leddevices";
  private static BridgeLocalDatabase mDeviceDatabaseInstance;
  private BridgeDatabaseHelper helper;
  private SQLiteDatabase mDatabse;
  
  private BridgeLocalDatabase() {}
  
  private BridgeLocalDatabase(Context paramContext)
    throws Exception
  {
    this.helper = new BridgeDatabaseHelper(paramContext, "bridge_iconstore.db", 1);
    try
    {
      this.mDatabse = this.helper.getWritableDatabase();
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      throw new Exception("Can not create Action Database");
    }
  }
  
  public static BridgeLocalDatabase getLedDeviceDatabase(Context paramContext)
    throws DatabaseException
  {
    try
    {
      if (mDeviceDatabaseInstance == null) {
        mDeviceDatabaseInstance = new BridgeLocalDatabase(paramContext);
      }
      if (!mDeviceDatabaseInstance.mDatabse.isOpen()) {
        mDeviceDatabaseInstance.mDatabse = mDeviceDatabaseInstance.helper.getWritableDatabase();
      }
      BridgeLocalDatabase localBridgeLocalDatabase = mDeviceDatabaseInstance;
      return localBridgeLocalDatabase;
    }
    catch (Exception localException)
    {
      throw new DatabaseException("Can not create Database", localException);
    }
    finally {}
  }
  
  public Cursor checkData(String paramString)
  {
    if (paramString != null) {
      try
      {
        Cursor localCursor = this.mDatabse.query("leddevices", null, "led_deviceid=?", new String[] { paramString }, null, null, null);
        Log.v("DataBase", "checkData() : " + localCursor.getCount());
        return localCursor;
      }
      catch (Exception localException)
      {
        return null;
      }
    }
    return null;
  }
  
  public void closeDatabse()
  {
    try
    {
      this.mDatabse.close();
      return;
    }
    catch (Exception localException) {}
  }
  
  public int deleteRecordById(String paramString)
  {
    try
    {
      int i = this.mDatabse.delete("leddevices", "led_deviceid=?", new String[] { paramString });
      return i;
    }
    catch (Exception localException) {}
    return 0;
  }
  
  public JSONArray getIconByLedDeviceId(String paramString)
  {
    JSONArray localJSONArray = new JSONArray();
    try
    {
      Cursor localCursor = this.mDatabse.query("leddevices", null, "led_deviceid = ?", new String[] { paramString }, null, null, null);
      if (localCursor != null)
      {
        boolean bool = localCursor.moveToFirst();
        String str1 = null;
        if (bool) {
          do
          {
            if ((localCursor.getString(localCursor.getColumnIndex("led_image_raw")) != null) && (localCursor.getString(localCursor.getColumnIndex("led_cloudid")) != null)) {
              str1 = localCursor.getString(localCursor.getColumnIndex("led_image_raw"));
            }
            String str2 = localCursor.getString(localCursor.getColumnIndex("led_cloudid"));
            localJSONArray.put(str1);
            localJSONArray.put(str2);
          } while (localCursor.moveToNext());
        }
        if ((localCursor != null) && (!localCursor.isClosed())) {
          localCursor.close();
        }
      }
      return localJSONArray;
    }
    catch (Exception localException) {}
    return localJSONArray;
  }
  
  public long insertLedDeviceIcon(ContentValues paramContentValues)
  {
    try
    {
      Log.v("DataBase", "insertLedDevices() : insertLedDevices()");
      long l = this.mDatabse.insert("leddevices", null, paramContentValues);
      return l;
    }
    catch (Exception localException) {}
    return -1L;
  }
  
  public long insertLedDeviceIcon(String paramString1, String paramString2, String paramString3)
  {
    try
    {
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("led_deviceid", paramString1);
      localContentValues.put("led_image_raw", paramString2);
      localContentValues.put("led_cloudid", paramString3);
      long l = this.mDatabse.insert("leddevices", null, localContentValues);
      return l;
    }
    catch (Exception localException) {}
    return -1L;
  }
  
  public int updateLedIconByDeviceId(String paramString1, String paramString2, String paramString3)
  {
    try
    {
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("led_image_raw", paramString1);
      localContentValues.put("led_cloudid", paramString3);
      SQLiteDatabase localSQLiteDatabase = this.mDatabse;
      String[] arrayOfString = new String[1];
      arrayOfString[0] = ("" + paramString2);
      int i = localSQLiteDatabase.update("leddevices", localContentValues, "led_deviceid= ?", arrayOfString);
      return i;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return 0;
  }
  
  public class BridgeDatabaseHelper
    extends SQLiteOpenHelper
  {
    public BridgeDatabaseHelper(Context paramContext, String paramString, int paramInt)
    {
      super(paramString, null, paramInt);
    }
    
    public void onCreate(SQLiteDatabase paramSQLiteDatabase)
    {
      try
      {
        paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS leddevices(_ledid INTEGER PRIMARY KEY AUTOINCREMENT, led_deviceid TEXT, led_cloudid TEXT, led_image_raw TEXT)");
        return;
      }
      catch (Exception localException) {}
    }
    
    public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
    {
      try
      {
        paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS leddevices");
        return;
      }
      catch (Exception localException) {}
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/database/BridgeLocalDatabase.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */