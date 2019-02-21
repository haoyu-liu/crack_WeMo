package com.belkin.database;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;
import com.belkin.exception.DatabaseException;
import java.io.PrintStream;
import java.util.Arrays;

public class DeviceDatabase
{
  public static final String DEVICE_DATABASE_NAME = "plugin.db";
  public static final int DEVICE_DATABASE_VERSION = 1;
  public static final String TABLE_ALL_DEVICES = "devices";
  private static DeviceDatabase mDeviceDatabaseInstance;
  private DatabaseHelper helper;
  private SQLiteDatabase mDatabse;
  
  private DeviceDatabase() {}
  
  private DeviceDatabase(Context paramContext)
    throws Exception
  {
    this.helper = new DatabaseHelper(paramContext, "plugin.db", 1);
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
  
  public static DeviceDatabase getDeviceDatabase(Context paramContext)
    throws DatabaseException
  {
    try
    {
      if (mDeviceDatabaseInstance == null) {
        mDeviceDatabaseInstance = new DeviceDatabase(paramContext);
      }
      if (!mDeviceDatabaseInstance.mDatabse.isOpen()) {
        mDeviceDatabaseInstance.mDatabse = mDeviceDatabaseInstance.helper.getWritableDatabase();
      }
      DeviceDatabase localDeviceDatabase = mDeviceDatabaseInstance;
      return localDeviceDatabase;
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
        Cursor localCursor = this.mDatabse.query("devices", null, "deviceudn=?", new String[] { paramString }, null, null, null);
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
  
  public int deleteAllRecords(String paramString)
  {
    try
    {
      int i = this.mDatabse.delete("devices", "device_type=?", new String[] { paramString });
      return i;
    }
    catch (Exception localException) {}
    return 0;
  }
  
  public int deleteDevice(String paramString)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = this.mDatabse;
      String[] arrayOfString = new String[1];
      arrayOfString[0] = ("" + paramString);
      int i = localSQLiteDatabase.delete("devices", "deviceudn= ?", arrayOfString);
      return i;
    }
    catch (Exception localException) {}
    return 0;
  }
  
  public String getFriendlyNameByUdnDatabase(String paramString)
  {
    String str = "";
    try
    {
      Cursor localCursor = this.mDatabse.query("devices", null, "deviceudn = ?", new String[] { paramString }, null, null, null);
      if (localCursor != null)
      {
        if (localCursor.moveToFirst()) {
          do
          {
            str = localCursor.getString(1);
          } while (localCursor.moveToNext());
        }
        if ((localCursor != null) && (!localCursor.isClosed())) {
          localCursor.close();
        }
      }
      return str;
    }
    catch (Exception localException) {}
    return str;
  }
  
  public byte[] getIconByUdn(String paramString)
  {
    byte[] arrayOfByte = null;
    try
    {
      Cursor localCursor = this.mDatabse.query("devices", null, "deviceudn = '" + paramString + "'", null, null, null, null);
      arrayOfByte = null;
      if (localCursor != null)
      {
        boolean bool = localCursor.moveToFirst();
        arrayOfByte = null;
        if (bool) {
          do
          {
            if (localCursor.getBlob(localCursor.getColumnIndex("image_raw")) != null) {
              arrayOfByte = (byte[])localCursor.getBlob(localCursor.getColumnIndex("image_raw")).clone();
            }
          } while (localCursor.moveToNext());
        }
        if ((localCursor != null) && (!localCursor.isClosed())) {
          localCursor.close();
        }
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        System.out.println(localException.getMessage());
      }
    }
    return Arrays.copyOfRange(arrayOfByte, 2, -2 + arrayOfByte.length);
  }
  
  public long insertSwitches(ContentValues paramContentValues)
  {
    try
    {
      Log.v("DataBase", "insertSwitches() : insertSwitches()");
      long l = this.mDatabse.insert("devices", null, paramContentValues);
      return l;
    }
    catch (Exception localException) {}
    return -1L;
  }
  
  public long insertSwitches(String paramString1, String paramString2, byte[] paramArrayOfByte, int paramInt, String paramString3)
  {
    try
    {
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("friendlyname", paramString1);
      localContentValues.put("deviceudn", paramString2);
      localContentValues.put("image_raw", paramArrayOfByte);
      localContentValues.put("device_type", paramString3);
      long l = this.mDatabse.insert("devices", null, localContentValues);
      return l;
    }
    catch (Exception localException) {}
    return -1L;
  }
  
  public long insertSwitches(String paramString1, String paramString2, byte[] paramArrayOfByte, int paramInt, String paramString3, String paramString4)
  {
    try
    {
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("friendlyname", paramString1);
      localContentValues.put("deviceudn", paramString2);
      localContentValues.put("image_raw", paramArrayOfByte);
      localContentValues.put("status", paramString4);
      localContentValues.put("device_type", paramString3);
      long l = this.mDatabse.insertWithOnConflict("devices", null, localContentValues, 5);
      return l;
    }
    catch (Exception localException) {}
    return -1L;
  }
  
  public boolean isDeviceExists(String paramString)
  {
    try
    {
      Cursor localCursor = this.mDatabse.query("devices", null, "deviceudn=?", new String[] { paramString }, null, null, null);
      if (localCursor.getCount() > 0)
      {
        localCursor.close();
        return true;
      }
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return false;
  }
  
  public int setIconByUdn(byte[] paramArrayOfByte, String paramString)
  {
    try
    {
      Integer.valueOf(0);
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("deviceudn", paramString);
      localContentValues.put("image_raw", paramArrayOfByte);
      if (isDeviceExists(paramString)) {}
      Integer localInteger;
      for (Object localObject = Integer.valueOf(this.mDatabse.update("devices", localContentValues, "deviceudn=?", new String[] { paramString }));; localObject = localInteger)
      {
        return ((Integer)localObject).intValue();
        localInteger = Integer.valueOf((int)this.mDatabse.insert("devices", null, localContentValues));
      }
      return 0;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public int updateDeviceStatusByUdn(String paramString1, String paramString2)
  {
    try
    {
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("status", paramString1);
      SQLiteDatabase localSQLiteDatabase = this.mDatabse;
      String[] arrayOfString = new String[1];
      arrayOfString[0] = ("" + paramString2);
      int i = localSQLiteDatabase.update("devices", localContentValues, "deviceudn= ?", arrayOfString);
      return i;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return 0;
  }
  
  public int updateSwitches(ContentValues paramContentValues)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = this.mDatabse;
      String[] arrayOfString = new String[1];
      arrayOfString[0] = paramContentValues.getAsString("deviceudn");
      int i = localSQLiteDatabase.update("devices", paramContentValues, "deviceudn=?", arrayOfString);
      return i;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return -1;
  }
  
  public class DatabaseHelper
    extends SQLiteOpenHelper
  {
    public DatabaseHelper(Context paramContext, String paramString, int paramInt)
    {
      super(paramString, null, paramInt);
    }
    
    public void onCreate(SQLiteDatabase paramSQLiteDatabase)
    {
      try
      {
        paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS devices(_id INTEGER PRIMARY KEY AUTOINCREMENT, friendlyname TEXT, status TEXT, deviceudn TEXT, image_raw BLOB, device_type TEXT)");
        return;
      }
      catch (Exception localException) {}
    }
    
    public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
    {
      try
      {
        paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS devices");
        return;
      }
      catch (Exception localException) {}
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/database/DeviceDatabase.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */