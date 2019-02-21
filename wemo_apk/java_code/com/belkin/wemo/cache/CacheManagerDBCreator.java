package com.belkin.wemo.cache;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class CacheManagerDBCreator
  extends SQLiteOpenHelper
{
  private static final String[] CACHE_DEVICES_ADD_COLUMNS_VER_TWO = { "parentExternalId", "parentName" };
  private static final String CREATE_TABLE_CACHE_DEVICES = "CREATE TABLE cache_devices(id INTEGER PRIMARY KEY,udn TEXT,type TEXT,friendlyName TEXT,icon TEXT,iconVersion TEXT,state INTEGER,attributeList TEXT,inactive INTEGER,isDiscovered TEXT,ssid TEXT,modelName TEXT,customizedState TEXT,firmwareVersion TEXT,info TEXT,html TEXT,fwstatus INTEGER,lastSeen TEXT,lastTS TEXT,hide INTEGER,bridgeUDN TEXT,manufacturerName TEXT,wemoCertified TEXT,productType TEXT,productName TEXT,capabilityIDs TEXT,currentState TEXT,mac TEXT,hwVersion TEXT,statusTS INTEGER,groupID TEXT,groupName TEXT,groupIcon TEXT,rulesDBVersion INTEGER,parentExternalId TEXT,parentName TEXT)";
  private static final String CREATE_TABLE_CACHE_DISCOVERY_HIT = "CREATE TABLE cache_discovery_hit(id INTEGER PRIMARY KEY,udn TEXT,datetime DATETIME,hit INTEGER,remote INTEGER)";
  private static final String CREATE_TABLE_CACHE_DISCOVERY_HIT_ZIGBEE = "CREATE TABLE cache_discovery_hit_zigbee(id INTEGER PRIMARY KEY,bridgeUDN TEXT,uniqueID TEXT,datetime DATETIME,hit INTEGER, remote INTEGER)";
  private static final String CREATE_TABLE_CACHE_DISCOVERY_STAT = "CREATE TABLE cache_discovery_stat(id INTEGER PRIMARY KEY,udn TEXT,datetime DATETIME,time INTEGER,status INTEGER,remote INTEGER)";
  private static final String CREATE_TABLE_CACHE_DISCOVERY_STAT_ZIGBEE = "CREATE TABLE cache_discovery_stat_zigbee(id INTEGER PRIMARY KEY,bridgeUDN TEXT,uniqueID TEXT,datetime DATETIME,time INTEGER,status INTEGER, remote INTEGER)";
  private static final String CREATE_TABLE_CACHE_LOCAL = "CREATE TABLE cache_local(id INTEGER PRIMARY KEY,udn TEXT,IP TEXT,port INTEGER)";
  private static final String CREATE_TABLE_CACHE_LOCATIONS = "CREATE TABLE cache_locations(id INTEGER PRIMARY KEY,homeID TEXT,currentHomeID TEXT,locationName TEXT,rulesDB TEXT)";
  private static final String CREATE_TABLE_CACHE_LOCATION_ARPMACS = "CREATE TABLE cache_location_arpmacs(id INTEGER PRIMARY KEY,homeID TEXT,arpMac TEXT)";
  private static final String CREATE_TABLE_CACHE_LOCATION_DEVICES = "CREATE TABLE cache_location_devices(id INTEGER PRIMARY KEY,homeID TEXT,udn TEXT,type TEXT,friendlyName TEXT)";
  private static final String CREATE_TABLE_CACHE_LOCATION_SSIDS = "CREATE TABLE cache_location_ssids(id INTEGER PRIMARY KEY,homeID TEXT,ssid TEXT)";
  private static final String CREATE_TABLE_CACHE_REMOTE = "CREATE TABLE cache_remote(id INTEGER PRIMARY KEY,udn TEXT,homeID TEXT,mac TEXT,pluginID TEXT)";
  private static final String CREATE_TABLE_CACHE_ZIGBEE = "CREATE TABLE cache_zigbee(id INTEGER PRIMARY KEY,bridgeUDN TEXT,uniqueID TEXT,state INTEGER,capabilities TEXT,icon TEXT,groupID INTEGER,groupName TEXT,groupCapability TEXT,firmwareVersion TEXT,modelName TEXT, friendlyName TEXT,manufacturerName TEXT,wemoCertified TEXT, uploadId TEXT)";
  private static final String CREATE_TABLE_SENSOR_EVENT_HISTORY = "CREATE TABLE Event_History(deviceId TEXT,startTime TEXT,endTime TEXT,capabilityId TEXT,currentValue TEXT,statusTS TEXT,status TEXT,message TEXT,productName TEXT,eventIcon TEXT,eventState TEXT,modelCode TEXT,eventID TEXT PRIMARY KEY)";
  private static CacheManagerDBCreator dbCreator = null;
  
  private CacheManagerDBCreator(Context paramContext)
  {
    super(paramContext, "cache.db", null, 2);
  }
  
  private void alterTableCacheDevices(SQLiteDatabase paramSQLiteDatabase)
  {
    if (!checkIfColumnsExist(paramSQLiteDatabase, "cache_devices", CACHE_DEVICES_ADD_COLUMNS_VER_TWO))
    {
      SDKLogUtils.infoLog("Nest: ", "alterTableCacheDevices column does not exists");
      paramSQLiteDatabase.execSQL("ALTER TABLE cache_devices ADD COLUMN parentExternalId TEXT;");
      paramSQLiteDatabase.execSQL("ALTER TABLE cache_devices ADD COLUMN parentName TEXT;");
    }
  }
  
  private boolean checkIfColumnsExist(SQLiteDatabase paramSQLiteDatabase, String paramString, String[] paramArrayOfString)
  {
    HashSet localHashSet1 = new HashSet(Arrays.asList(paramSQLiteDatabase.query(paramString, null, null, null, null, null, null).getColumnNames()));
    HashSet localHashSet2 = new HashSet(Arrays.asList(paramArrayOfString));
    localHashSet2.removeAll(localHashSet1);
    return localHashSet2.size() <= 0;
  }
  
  public static CacheManagerDBCreator getInstance(Context paramContext)
  {
    try
    {
      if (dbCreator == null) {
        dbCreator = new CacheManagerDBCreator(paramContext);
      }
      CacheManagerDBCreator localCacheManagerDBCreator = dbCreator;
      return localCacheManagerDBCreator;
    }
    finally {}
  }
  
  public void Nest_Changes(SQLiteDatabase paramSQLiteDatabase)
  {
    alterTableCacheDevices(paramSQLiteDatabase);
  }
  
  public void onCreate(SQLiteDatabase paramSQLiteDatabase)
  {
    SDKLogUtils.infoLog("Nest: ", "ON CREATE of DB called");
    paramSQLiteDatabase.execSQL("CREATE TABLE cache_local(id INTEGER PRIMARY KEY,udn TEXT,IP TEXT,port INTEGER)");
    paramSQLiteDatabase.execSQL("CREATE TABLE cache_remote(id INTEGER PRIMARY KEY,udn TEXT,homeID TEXT,mac TEXT,pluginID TEXT)");
    paramSQLiteDatabase.execSQL("CREATE TABLE cache_devices(id INTEGER PRIMARY KEY,udn TEXT,type TEXT,friendlyName TEXT,icon TEXT,iconVersion TEXT,state INTEGER,attributeList TEXT,inactive INTEGER,isDiscovered TEXT,ssid TEXT,modelName TEXT,customizedState TEXT,firmwareVersion TEXT,info TEXT,html TEXT,fwstatus INTEGER,lastSeen TEXT,lastTS TEXT,hide INTEGER,bridgeUDN TEXT,manufacturerName TEXT,wemoCertified TEXT,productType TEXT,productName TEXT,capabilityIDs TEXT,currentState TEXT,mac TEXT,hwVersion TEXT,statusTS INTEGER,groupID TEXT,groupName TEXT,groupIcon TEXT,rulesDBVersion INTEGER,parentExternalId TEXT,parentName TEXT)");
    paramSQLiteDatabase.execSQL("CREATE TABLE cache_zigbee(id INTEGER PRIMARY KEY,bridgeUDN TEXT,uniqueID TEXT,state INTEGER,capabilities TEXT,icon TEXT,groupID INTEGER,groupName TEXT,groupCapability TEXT,firmwareVersion TEXT,modelName TEXT, friendlyName TEXT,manufacturerName TEXT,wemoCertified TEXT, uploadId TEXT)");
    paramSQLiteDatabase.execSQL("CREATE TABLE cache_discovery_stat(id INTEGER PRIMARY KEY,udn TEXT,datetime DATETIME,time INTEGER,status INTEGER,remote INTEGER)");
    paramSQLiteDatabase.execSQL("CREATE TABLE cache_discovery_stat_zigbee(id INTEGER PRIMARY KEY,bridgeUDN TEXT,uniqueID TEXT,datetime DATETIME,time INTEGER,status INTEGER, remote INTEGER)");
    paramSQLiteDatabase.execSQL("CREATE TABLE cache_discovery_hit(id INTEGER PRIMARY KEY,udn TEXT,datetime DATETIME,hit INTEGER,remote INTEGER)");
    paramSQLiteDatabase.execSQL("CREATE TABLE cache_discovery_hit_zigbee(id INTEGER PRIMARY KEY,bridgeUDN TEXT,uniqueID TEXT,datetime DATETIME,hit INTEGER, remote INTEGER)");
    paramSQLiteDatabase.execSQL("CREATE TABLE cache_locations(id INTEGER PRIMARY KEY,homeID TEXT,currentHomeID TEXT,locationName TEXT,rulesDB TEXT)");
    paramSQLiteDatabase.execSQL("CREATE TABLE cache_location_arpmacs(id INTEGER PRIMARY KEY,homeID TEXT,arpMac TEXT)");
    paramSQLiteDatabase.execSQL("CREATE TABLE cache_location_ssids(id INTEGER PRIMARY KEY,homeID TEXT,ssid TEXT)");
    paramSQLiteDatabase.execSQL("CREATE TABLE cache_location_devices(id INTEGER PRIMARY KEY,homeID TEXT,udn TEXT,type TEXT,friendlyName TEXT)");
    paramSQLiteDatabase.execSQL("CREATE TABLE Event_History(deviceId TEXT,startTime TEXT,endTime TEXT,capabilityId TEXT,currentValue TEXT,statusTS TEXT,status TEXT,message TEXT,productName TEXT,eventIcon TEXT,eventState TEXT,modelCode TEXT,eventID TEXT PRIMARY KEY)");
  }
  
  public void onDowngrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
  {
    onUpgrade(paramSQLiteDatabase, paramInt1, paramInt2);
  }
  
  public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
  {
    SDKLogUtils.infoLog("Nest: ", "ON UPGRADE of DB called");
    switch (paramInt1)
    {
    default: 
      return;
    }
    SDKLogUtils.infoLog("Nest: ", "ON UPGRADE of DB called case 2");
    Nest_Changes(paramSQLiteDatabase);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/CacheManagerDBCreator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */