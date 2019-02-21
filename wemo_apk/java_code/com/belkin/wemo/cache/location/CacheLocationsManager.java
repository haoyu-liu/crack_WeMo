package com.belkin.wemo.cache.location;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import com.belkin.wemo.cache.CacheManagerDBCreator;
import com.belkin.wemo.cache.data.DeviceInformation;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class CacheLocationsManager
{
  private static CacheLocationsManager cacheManager = null;
  private CacheManagerDBCreator dbCreator = null;
  private HashMap<String, Location> locationsByHomeIdMap = null;
  private Set<Location> locationsFromMemory = null;
  
  private CacheLocationsManager(Context paramContext)
  {
    this.dbCreator = CacheManagerDBCreator.getInstance(paramContext);
    updateLocationMap();
  }
  
  private void deleteLocationFromMemory(String paramString)
  {
    this.locationsByHomeIdMap.remove(paramString);
    Iterator localIterator = this.locationsFromMemory.iterator();
    while (localIterator.hasNext())
    {
      Location localLocation = (Location)localIterator.next();
      if (localLocation.getHomeId().equals(paramString)) {
        this.locationsFromMemory.remove(localLocation);
      }
    }
  }
  
  private DeviceInformation getDeviceFromCacheLocationDevicesTableCursor(Cursor paramCursor)
  {
    DeviceInformation localDeviceInformation = new DeviceInformation(paramCursor.getString(paramCursor.getColumnIndex("udn")), null, 0);
    localDeviceInformation.setFriendlyName(paramCursor.getString(paramCursor.getColumnIndex("type")));
    localDeviceInformation.setFriendlyName(paramCursor.getString(paramCursor.getColumnIndex("friendlyName")));
    localDeviceInformation.setID(paramCursor.getInt(paramCursor.getColumnIndex("id")));
    return localDeviceInformation;
  }
  
  public static CacheLocationsManager getInstance(Context paramContext)
  {
    if (cacheManager == null) {
      cacheManager = new CacheLocationsManager(paramContext);
    }
    return cacheManager;
  }
  
  private Set<String> getLocationArpMacsFromDB(String paramString)
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getReadableDatabase();
    HashSet localHashSet = new HashSet();
    localSQLiteDatabase.beginTransaction();
    Cursor localCursor = localSQLiteDatabase.rawQuery("SELECT * FROM cache_location_arpmacs WHERE homeID='" + paramString + "'", null);
    localCursor.moveToFirst();
    while (!localCursor.isAfterLast())
    {
      localHashSet.add(localCursor.getString(localCursor.getColumnIndex("arpMac")));
      localCursor.moveToNext();
    }
    localCursor.close();
    localSQLiteDatabase.setTransactionSuccessful();
    localSQLiteDatabase.endTransaction();
    return localHashSet;
  }
  
  private Set<DeviceInformation> getLocationDeviceListFromDB(String paramString)
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getReadableDatabase();
    HashSet localHashSet = new HashSet();
    localSQLiteDatabase.beginTransaction();
    Cursor localCursor = localSQLiteDatabase.rawQuery("SELECT * FROM cache_location_devices WHERE homeID='" + paramString + "'", null);
    localCursor.moveToFirst();
    while (!localCursor.isAfterLast())
    {
      localHashSet.add(getDeviceFromCacheLocationDevicesTableCursor(localCursor));
      localCursor.moveToNext();
    }
    localCursor.close();
    localSQLiteDatabase.setTransactionSuccessful();
    localSQLiteDatabase.endTransaction();
    return localHashSet;
  }
  
  private Location getLocationFromCacheLocationTableCursor(Cursor paramCursor)
  {
    Location localLocation = new Location(paramCursor.getString(paramCursor.getColumnIndex("homeID")), paramCursor.getString(paramCursor.getColumnIndex("locationName")));
    localLocation.setID(paramCursor.getInt(paramCursor.getColumnIndex("id")));
    return localLocation;
  }
  
  private Set<String> getLocationSsidsFromDB(String paramString)
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getReadableDatabase();
    HashSet localHashSet = new HashSet();
    localSQLiteDatabase.beginTransaction();
    Cursor localCursor = localSQLiteDatabase.rawQuery("SELECT * FROM cache_location_ssids WHERE homeID='" + paramString + "'", null);
    localCursor.moveToFirst();
    while (!localCursor.isAfterLast())
    {
      localHashSet.add(localCursor.getString(localCursor.getColumnIndex("ssid")));
      localCursor.moveToNext();
    }
    localCursor.close();
    localSQLiteDatabase.setTransactionSuccessful();
    localSQLiteDatabase.endTransaction();
    return localHashSet;
  }
  
  private ContentValues setLocationArpMacForCacheLocationArpMacsDB(String paramString1, String paramString2, ContentValues paramContentValues)
  {
    paramContentValues.put("homeID", paramString1);
    paramContentValues.put("arpMac", paramString2);
    return paramContentValues;
  }
  
  private ContentValues setLocationDeviceInfoForCacheLocationDevicesDB(String paramString, DeviceInformation paramDeviceInformation, ContentValues paramContentValues)
  {
    paramContentValues.put("homeID", paramString);
    paramContentValues.put("udn", paramDeviceInformation.getUDN());
    paramContentValues.put("type", paramDeviceInformation.getType());
    paramContentValues.put("friendlyName", paramDeviceInformation.getFriendlyName());
    return paramContentValues;
  }
  
  private ContentValues setLocationInfoForCacheLocationsDB(Location paramLocation, ContentValues paramContentValues)
  {
    paramContentValues.put("homeID", paramLocation.getHomeId());
    paramContentValues.put("locationName", paramLocation.getName());
    return paramContentValues;
  }
  
  private ContentValues setLocationSsidForCacheLocationSsidsDB(String paramString1, String paramString2, ContentValues paramContentValues)
  {
    paramContentValues.put("homeID", paramString1);
    paramContentValues.put("ssid", paramString2);
    return paramContentValues;
  }
  
  public boolean addLocationToDB(Location paramLocation)
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    localSQLiteDatabase.beginTransaction();
    try
    {
      localSQLiteDatabase.insertOrThrow("cache_locations", null, setLocationInfoForCacheLocationsDB(paramLocation, new ContentValues()));
      Iterator localIterator1 = paramLocation.getArpMacs().iterator();
      while (localIterator1.hasNext()) {
        localSQLiteDatabase.insertOrThrow("cache_location_arpmacs", null, setLocationArpMacForCacheLocationArpMacsDB(paramLocation.getHomeId(), (String)localIterator1.next(), new ContentValues()));
      }
      Iterator localIterator2;
      localSet = paramLocation.getDeviceList();
    }
    catch (SQLException localSQLException)
    {
      localSQLException.printStackTrace();
      return false;
      localIterator2 = paramLocation.getSsids().iterator();
      while (localIterator2.hasNext()) {
        localSQLiteDatabase.insertOrThrow("cache_location_ssids", null, setLocationSsidForCacheLocationSsidsDB(paramLocation.getHomeId(), (String)localIterator2.next(), new ContentValues()));
      }
    }
    finally
    {
      localSQLiteDatabase.endTransaction();
    }
    Set localSet;
    if (localSet != null)
    {
      Iterator localIterator3 = localSet.iterator();
      while (localIterator3.hasNext())
      {
        DeviceInformation localDeviceInformation = (DeviceInformation)localIterator3.next();
        localSQLiteDatabase.insertOrThrow("cache_location_devices", null, setLocationDeviceInfoForCacheLocationDevicesDB(paramLocation.getHomeId(), localDeviceInformation, new ContentValues()));
      }
    }
    localSQLiteDatabase.setTransactionSuccessful();
    this.locationsByHomeIdMap.put(paramLocation.getHomeId(), paramLocation);
    this.locationsFromMemory.add(paramLocation);
    localSQLiteDatabase.endTransaction();
    return true;
  }
  
  public boolean deleteAllLocationFromDB()
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    localSQLiteDatabase.beginTransaction();
    try
    {
      localSQLiteDatabase.delete("cache_locations", null, null);
      localSQLiteDatabase.delete("cache_location_arpmacs", null, null);
      localSQLiteDatabase.delete("cache_location_ssids", null, null);
      localSQLiteDatabase.delete("cache_location_devices", null, null);
      localSQLiteDatabase.setTransactionSuccessful();
      this.locationsByHomeIdMap.clear();
      this.locationsFromMemory.clear();
      return true;
    }
    catch (SQLException localSQLException)
    {
      localSQLException.printStackTrace();
      return false;
    }
    finally
    {
      localSQLiteDatabase.endTransaction();
    }
  }
  
  public boolean deleteLocationFromDB(String paramString)
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    localSQLiteDatabase.beginTransaction();
    try
    {
      localSQLiteDatabase.delete("cache_locations", "homeID = ?", new String[] { paramString });
      localSQLiteDatabase.delete("cache_location_arpmacs", "homeID = ?", new String[] { paramString });
      localSQLiteDatabase.delete("cache_location_ssids", "homeID = ?", new String[] { paramString });
      localSQLiteDatabase.delete("cache_location_devices", "homeID = ?", new String[] { paramString });
      localSQLiteDatabase.setTransactionSuccessful();
      deleteLocationFromMemory(paramString);
      return true;
    }
    catch (SQLException localSQLException)
    {
      localSQLException.printStackTrace();
      return false;
    }
    finally
    {
      localSQLiteDatabase.endTransaction();
    }
  }
  
  public Location getLocationByHomeIdFromDB(String paramString)
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getReadableDatabase();
    localSQLiteDatabase.beginTransaction();
    Location localLocation = null;
    Cursor localCursor = localSQLiteDatabase.rawQuery("SELECT * FROM cache_locations WHERE homeID='" + paramString + "'", null);
    localCursor.moveToFirst();
    while (!localCursor.isAfterLast())
    {
      localLocation = getLocationFromCacheLocationTableCursor(localCursor);
      localLocation.setDeviceList(getLocationDeviceListFromDB(localLocation.getHomeId()));
      localLocation.setArpMacs(getLocationArpMacsFromDB(localLocation.getHomeId()));
      localLocation.setSsids(getLocationSsidsFromDB(localLocation.getHomeId()));
      localCursor.moveToNext();
    }
    localCursor.close();
    localSQLiteDatabase.setTransactionSuccessful();
    localSQLiteDatabase.endTransaction();
    return localLocation;
  }
  
  public Set<Location> getLocationListFromDB()
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getReadableDatabase();
    HashSet localHashSet = new HashSet();
    localSQLiteDatabase.beginTransaction();
    Cursor localCursor = localSQLiteDatabase.rawQuery("SELECT * FROM cache_locations", null);
    localCursor.moveToFirst();
    while (!localCursor.isAfterLast())
    {
      Location localLocation = getLocationFromCacheLocationTableCursor(localCursor);
      localLocation.setDeviceList(getLocationDeviceListFromDB(localLocation.getHomeId()));
      localLocation.setArpMacs(getLocationArpMacsFromDB(localLocation.getHomeId()));
      localLocation.setSsids(getLocationSsidsFromDB(localLocation.getHomeId()));
      localHashSet.add(localLocation);
      localCursor.moveToNext();
    }
    localCursor.close();
    localSQLiteDatabase.setTransactionSuccessful();
    localSQLiteDatabase.endTransaction();
    return localHashSet;
  }
  
  public HashMap<String, Location> getLocationsByHomeIdMap()
  {
    return this.locationsByHomeIdMap;
  }
  
  public Set<Location> getLocationsFromMemory()
  {
    return this.locationsFromMemory;
  }
  
  public void setLocationsByHomeIdMap(HashMap<String, Location> paramHashMap)
  {
    this.locationsByHomeIdMap = paramHashMap;
  }
  
  public void setLocationsFromMemory(Set<Location> paramSet)
  {
    this.locationsFromMemory = paramSet;
  }
  
  public void updateLocationMap()
  {
    try
    {
      if (this.locationsByHomeIdMap == null) {
        this.locationsByHomeIdMap = new HashMap(16);
      }
      this.locationsFromMemory = getLocationListFromDB();
      Iterator localIterator = this.locationsFromMemory.iterator();
      while (localIterator.hasNext())
      {
        Location localLocation = (Location)localIterator.next();
        this.locationsByHomeIdMap.put(localLocation.getHomeId(), localLocation);
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/location/CacheLocationsManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */