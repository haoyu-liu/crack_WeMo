package com.belkin.wemo.cache;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.text.TextUtils;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.ZigBeeDeviceInformation;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.StringUtils;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class CacheManager
{
  private static CacheManager cacheManager = null;
  final String TAG = "cacheManager";
  private Map<String, DeviceInformation> currentDeviceInfoFromDBMap;
  private CacheManagerDBCreator dbCreator = null;
  private boolean disableStat = true;
  
  private CacheManager(Context paramContext)
  {
    this.dbCreator = CacheManagerDBCreator.getInstance(paramContext);
    this.currentDeviceInfoFromDBMap = new HashMap();
  }
  
  private boolean doesEntryExistInTable(String paramString1, String paramString2)
  {
    Cursor localCursor = this.dbCreator.getReadableDatabase().query(paramString1, new String[] { "udn" }, "udn=?", new String[] { paramString2 }, null, null, null);
    int i = localCursor.getCount();
    boolean bool = false;
    if (i > 0) {
      bool = true;
    }
    localCursor.close();
    return bool;
  }
  
  private DeviceInformation getDeviceInformationFromDevicesCacheTableCursor(Cursor paramCursor)
  {
    if (paramCursor != null) {
      try
      {
        if (paramCursor.getCount() > 0)
        {
          DeviceInformation localDeviceInformation = new DeviceInformation(paramCursor.getString(paramCursor.getColumnIndex("udn")), paramCursor.getString(paramCursor.getColumnIndex("type")), paramCursor.getString(paramCursor.getColumnIndex("friendlyName")), paramCursor.getString(paramCursor.getColumnIndex("icon")), paramCursor.getInt(paramCursor.getColumnIndex("state")), paramCursor.getString(paramCursor.getColumnIndex("attributeList")), paramCursor.getInt(paramCursor.getColumnIndex("inactive")), paramCursor.getString(paramCursor.getColumnIndex("modelName")), paramCursor.getString(paramCursor.getColumnIndex("customizedState")), paramCursor.getString(paramCursor.getColumnIndex("firmwareVersion")), paramCursor.getString(paramCursor.getColumnIndex("info")), paramCursor.getString(paramCursor.getColumnIndex("fwstatus")), paramCursor.getString(paramCursor.getColumnIndex("lastSeen")), paramCursor.getInt(paramCursor.getColumnIndex("hide")));
          localDeviceInformation.setID(paramCursor.getInt(paramCursor.getColumnIndex("id")));
          localDeviceInformation.setHtml(paramCursor.getString(paramCursor.getColumnIndex("html")));
          localDeviceInformation.setLastTimestamp(paramCursor.getString(paramCursor.getColumnIndex("lastTS")));
          localDeviceInformation.setBridgeUDN(paramCursor.getString(paramCursor.getColumnIndex("bridgeUDN")));
          localDeviceInformation.setProductType(paramCursor.getString(paramCursor.getColumnIndex("productType")));
          localDeviceInformation.setProductName(paramCursor.getString(paramCursor.getColumnIndex("productName")));
          localDeviceInformation.setCapabilityID(paramCursor.getString(paramCursor.getColumnIndex("capabilityIDs")));
          localDeviceInformation.setWemoCertified(paramCursor.getString(paramCursor.getColumnIndex("wemoCertified")));
          localDeviceInformation.setManufacturerName(paramCursor.getString(paramCursor.getColumnIndex("manufacturerName")));
          localDeviceInformation.setCurrentState(paramCursor.getString(paramCursor.getColumnIndex("currentState")));
          localDeviceInformation.setParentName(paramCursor.getString(paramCursor.getColumnIndex("parentName")));
          localDeviceInformation.setParentExternalId(paramCursor.getString(paramCursor.getColumnIndex("parentExternalId")));
          localDeviceInformation.setMAC(paramCursor.getString(paramCursor.getColumnIndex("mac")));
          localDeviceInformation.setHwVersion(paramCursor.getString(paramCursor.getColumnIndex("hwVersion")));
          localDeviceInformation.setStatusTS(paramCursor.getInt(paramCursor.getColumnIndex("statusTS")));
          localDeviceInformation.setGroupID(paramCursor.getString(paramCursor.getColumnIndex("groupID")));
          localDeviceInformation.setGroupName(paramCursor.getString(paramCursor.getColumnIndex("groupName")));
          localDeviceInformation.setGroupIcon(paramCursor.getString(paramCursor.getColumnIndex("groupIcon")));
          localDeviceInformation.setSSID(paramCursor.getString(paramCursor.getColumnIndex("ssid")));
          localDeviceInformation.setRulesDBVersion(paramCursor.getInt(paramCursor.getColumnIndex("rulesDBVersion")));
          localDeviceInformation.setIconVersion(paramCursor.getString(paramCursor.getColumnIndex("iconVersion")));
          JSONObject localJSONObject = new JSONObject(paramCursor.getString(paramCursor.getColumnIndex("attributeList")));
          localDeviceInformation.setAttributeList(localJSONObject);
          return localDeviceInformation;
        }
      }
      catch (Exception localException)
      {
        SDKLogUtils.errorLog("cacheManager", "Exception while Device Info object from Device Cache: ", localException);
      }
    }
    return null;
  }
  
  private DeviceInformation getDeviceInformationFromLocalCacheTableCursor(Cursor paramCursor)
  {
    DeviceInformation localDeviceInformation = new DeviceInformation(paramCursor.getString(paramCursor.getColumnIndex("udn")), paramCursor.getString(paramCursor.getColumnIndex("IP")), paramCursor.getInt(paramCursor.getColumnIndex("port")));
    localDeviceInformation.setID(paramCursor.getInt(paramCursor.getColumnIndex("id")));
    return localDeviceInformation;
  }
  
  private DeviceInformation getDeviceInformationFromLocalDevice(Cursor paramCursor, boolean paramBoolean1, boolean paramBoolean2)
  {
    try
    {
      String str1 = paramCursor.getString(paramCursor.getColumnIndex("udn"));
      DeviceInformation localDeviceInformation = (DeviceInformation)this.currentDeviceInfoFromDBMap.get(str1);
      if (localDeviceInformation == null)
      {
        localDeviceInformation = new DeviceInformation(str1, paramCursor.getString(paramCursor.getColumnIndex("type")), paramCursor.getString(paramCursor.getColumnIndex("friendlyName")), paramCursor.getString(paramCursor.getColumnIndex("icon")), paramCursor.getInt(paramCursor.getColumnIndex("state")), paramCursor.getString(paramCursor.getColumnIndex("attributeList")), paramCursor.getInt(paramCursor.getColumnIndex("inactive")), paramCursor.getString(paramCursor.getColumnIndex("modelName")), paramCursor.getString(paramCursor.getColumnIndex("customizedState")), paramCursor.getString(paramCursor.getColumnIndex("firmwareVersion")), paramCursor.getString(paramCursor.getColumnIndex("info")), paramCursor.getString(paramCursor.getColumnIndex("fwstatus")), paramCursor.getString(paramCursor.getColumnIndex("lastSeen")), paramCursor.getInt(paramCursor.getColumnIndex("hide")));
        this.currentDeviceInfoFromDBMap.put(str1, localDeviceInformation);
      }
      for (;;)
      {
        localDeviceInformation.setID(paramCursor.getInt(paramCursor.getColumnIndex("id")));
        localDeviceInformation.setHtml(paramCursor.getString(paramCursor.getColumnIndex("html")));
        localDeviceInformation.setMAC(paramCursor.getString(paramCursor.getColumnIndex("mac")));
        localDeviceInformation.setLastTimestamp(paramCursor.getString(paramCursor.getColumnIndex("lastTS")));
        localDeviceInformation.setBridgeUDN(paramCursor.getString(paramCursor.getColumnIndex("bridgeUDN")));
        localDeviceInformation.setProductType(paramCursor.getString(paramCursor.getColumnIndex("productType")));
        localDeviceInformation.setProductName(paramCursor.getString(paramCursor.getColumnIndex("productName")));
        localDeviceInformation.setCapabilityID(paramCursor.getString(paramCursor.getColumnIndex("capabilityIDs")));
        localDeviceInformation.setWemoCertified(paramCursor.getString(paramCursor.getColumnIndex("wemoCertified")));
        localDeviceInformation.setManufacturerName(paramCursor.getString(paramCursor.getColumnIndex("manufacturerName")));
        localDeviceInformation.setParentName(paramCursor.getString(paramCursor.getColumnIndex("parentName")));
        localDeviceInformation.setParentExternalId(paramCursor.getString(paramCursor.getColumnIndex("parentExternalId")));
        String str2 = paramCursor.getString(paramCursor.getColumnIndex("currentState"));
        SDKLogUtils.debugLog("cacheManager", "KEY_CURRENT_STATE: " + str2 + "; UDN: " + str1);
        localDeviceInformation.setCurrentState(str2);
        localDeviceInformation.setMAC(paramCursor.getString(paramCursor.getColumnIndex("mac")));
        localDeviceInformation.setHwVersion(paramCursor.getString(paramCursor.getColumnIndex("hwVersion")));
        localDeviceInformation.setStatusTS(paramCursor.getInt(paramCursor.getColumnIndex("statusTS")));
        localDeviceInformation.setGroupID(paramCursor.getString(paramCursor.getColumnIndex("groupID")));
        localDeviceInformation.setGroupName(paramCursor.getString(paramCursor.getColumnIndex("groupName")));
        localDeviceInformation.setGroupIcon(paramCursor.getString(paramCursor.getColumnIndex("groupIcon")));
        localDeviceInformation.setSSID(paramCursor.getString(paramCursor.getColumnIndex("ssid")));
        localDeviceInformation.setRulesDBVersion(paramCursor.getInt(paramCursor.getColumnIndex("rulesDBVersion")));
        localDeviceInformation.setIconVersion(paramCursor.getString(paramCursor.getColumnIndex("iconVersion")));
        if (paramBoolean1)
        {
          localDeviceInformation.setIP(paramCursor.getString(paramCursor.getColumnIndex("IP")));
          localDeviceInformation.setPort(paramCursor.getInt(paramCursor.getColumnIndex("port")));
        }
        if (paramBoolean2)
        {
          localDeviceInformation.setPluginId(paramCursor.getString(paramCursor.getColumnIndex("pluginID")));
          localDeviceInformation.setHomeID(paramCursor.getString(paramCursor.getColumnIndex("homeID")));
        }
        SDKLogUtils.debugLog("cacheManager", "initCache " + localDeviceInformation);
        return localDeviceInformation;
        String str3 = paramCursor.getString(paramCursor.getColumnIndex("type"));
        String str4 = paramCursor.getString(paramCursor.getColumnIndex("friendlyName"));
        String str5 = paramCursor.getString(paramCursor.getColumnIndex("icon"));
        int i = paramCursor.getInt(paramCursor.getColumnIndex("state"));
        String str6 = paramCursor.getString(paramCursor.getColumnIndex("attributeList"));
        int j = paramCursor.getInt(paramCursor.getColumnIndex("inactive"));
        String str7 = paramCursor.getString(paramCursor.getColumnIndex("modelName"));
        String str8 = paramCursor.getString(paramCursor.getColumnIndex("customizedState"));
        String str9 = paramCursor.getString(paramCursor.getColumnIndex("firmwareVersion"));
        String str10 = paramCursor.getString(paramCursor.getColumnIndex("info"));
        String str11 = paramCursor.getString(paramCursor.getColumnIndex("fwstatus"));
        String str12 = paramCursor.getString(paramCursor.getColumnIndex("lastSeen"));
        int k = paramCursor.getInt(paramCursor.getColumnIndex("hide"));
        localDeviceInformation.update(str3, str4, str5, i, str6, j, str7, str8, str9, str10, str11, str12, k);
      }
      return null;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("cacheManager", "Exception while Device Info object from Local Device: ", localException);
    }
  }
  
  private DeviceInformation getDeviceInformationFromRemoteCacheTableCursor(Cursor paramCursor)
  {
    DeviceInformation localDeviceInformation = new DeviceInformation(paramCursor.getString(paramCursor.getColumnIndex("udn")), paramCursor.getString(paramCursor.getColumnIndex("homeID")), paramCursor.getString(paramCursor.getColumnIndex("mac")), paramCursor.getString(paramCursor.getColumnIndex("pluginID")));
    localDeviceInformation.setID(paramCursor.getInt(paramCursor.getColumnIndex("id")));
    return localDeviceInformation;
  }
  
  private ZigBeeDeviceInformation getDeviceInformationFromZigBeeDeviceTableCursor(Cursor paramCursor)
  {
    ZigBeeDeviceInformation localZigBeeDeviceInformation = new ZigBeeDeviceInformation();
    localZigBeeDeviceInformation.setBridgeUDN(paramCursor.getString(paramCursor.getColumnIndex("bridgeUDN")));
    localZigBeeDeviceInformation.setUniqueID(paramCursor.getString(paramCursor.getColumnIndex("uniqueID")));
    localZigBeeDeviceInformation.setState(paramCursor.getInt(paramCursor.getColumnIndex("state")));
    localZigBeeDeviceInformation.setCapabilities(paramCursor.getString(paramCursor.getColumnIndex("capabilities")));
    localZigBeeDeviceInformation.setFirmwareVersion(paramCursor.getString(paramCursor.getColumnIndex("firmwareVersion")));
    localZigBeeDeviceInformation.setModelCode(paramCursor.getString(paramCursor.getColumnIndex("modelName")));
    localZigBeeDeviceInformation.setName(paramCursor.getString(paramCursor.getColumnIndex("friendlyName")));
    localZigBeeDeviceInformation.setGroupId(paramCursor.getInt(paramCursor.getColumnIndex("groupID")));
    localZigBeeDeviceInformation.setGroupName(paramCursor.getString(paramCursor.getColumnIndex("groupName")));
    localZigBeeDeviceInformation.setGroupCapability(paramCursor.getString(paramCursor.getColumnIndex("groupCapability")));
    localZigBeeDeviceInformation.setManufacturerName(paramCursor.getString(paramCursor.getColumnIndex("manufacturerName")));
    localZigBeeDeviceInformation.setWemoCertified(paramCursor.getString(paramCursor.getColumnIndex("wemoCertified")));
    localZigBeeDeviceInformation.setIconUploadId(paramCursor.getString(paramCursor.getColumnIndex("uploadId")));
    return localZigBeeDeviceInformation;
  }
  
  public static CacheManager getInstance(Context paramContext)
  {
    try
    {
      if (cacheManager == null) {
        cacheManager = new CacheManager(paramContext);
      }
      CacheManager localCacheManager = cacheManager;
      return localCacheManager;
    }
    finally {}
  }
  
  /* Error */
  private String getLastTime(String paramString1, boolean paramBoolean, String paramString2)
  {
    // Byte code:
    //   0: ldc_w 359
    //   3: astore 4
    //   5: aload_0
    //   6: getfield 28	com/belkin/wemo/cache/CacheManager:dbCreator	Lcom/belkin/wemo/cache/CacheManagerDBCreator;
    //   9: invokevirtual 362	com/belkin/wemo/cache/CacheManagerDBCreator:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   12: astore 5
    //   14: aload 5
    //   16: invokevirtual 365	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   19: aload_3
    //   20: ldc_w 367
    //   23: invokevirtual 371	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   26: ifne +20 -> 46
    //   29: aload_3
    //   30: aload_3
    //   31: ldc_w 373
    //   34: invokevirtual 371	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   37: invokestatic 379	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   40: invokevirtual 371	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   43: ifeq +157 -> 200
    //   46: new 260	java/lang/StringBuilder
    //   49: dup
    //   50: invokespecial 261	java/lang/StringBuilder:<init>	()V
    //   53: ldc_w 381
    //   56: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   59: aload_3
    //   60: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   63: ldc_w 383
    //   66: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   69: ldc_w 316
    //   72: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   75: ldc_w 385
    //   78: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   81: aload_1
    //   82: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   85: ldc_w 387
    //   88: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   91: invokevirtual 273	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   94: astore 8
    //   96: iload_2
    //   97: ifeq +155 -> 252
    //   100: new 260	java/lang/StringBuilder
    //   103: dup
    //   104: invokespecial 261	java/lang/StringBuilder:<init>	()V
    //   107: aload 8
    //   109: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   112: ldc_w 389
    //   115: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   118: invokevirtual 273	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   121: astore 9
    //   123: aload 5
    //   125: new 260	java/lang/StringBuilder
    //   128: dup
    //   129: invokespecial 261	java/lang/StringBuilder:<init>	()V
    //   132: aload 9
    //   134: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   137: ldc_w 391
    //   140: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   143: invokevirtual 273	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   146: aconst_null
    //   147: invokevirtual 395	android/database/sqlite/SQLiteDatabase:rawQuery	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   150: astore 10
    //   152: aload 10
    //   154: invokeinterface 65 1 0
    //   159: ifle +21 -> 180
    //   162: aload 10
    //   164: invokeinterface 399 1 0
    //   169: pop
    //   170: aload 10
    //   172: iconst_0
    //   173: invokeinterface 82 2 0
    //   178: astore 4
    //   180: aload 10
    //   182: invokeinterface 68 1 0
    //   187: aload 5
    //   189: invokevirtual 402	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   192: aload 5
    //   194: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   197: aload 4
    //   199: areturn
    //   200: new 260	java/lang/StringBuilder
    //   203: dup
    //   204: invokespecial 261	java/lang/StringBuilder:<init>	()V
    //   207: ldc_w 381
    //   210: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   213: aload_3
    //   214: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   217: ldc_w 383
    //   220: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   223: ldc 51
    //   225: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   228: ldc_w 385
    //   231: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   234: aload_1
    //   235: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   238: ldc_w 387
    //   241: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   244: invokevirtual 273	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   247: astore 8
    //   249: goto -153 -> 96
    //   252: new 260	java/lang/StringBuilder
    //   255: dup
    //   256: invokespecial 261	java/lang/StringBuilder:<init>	()V
    //   259: aload 8
    //   261: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   264: ldc_w 407
    //   267: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   270: invokevirtual 273	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   273: astore 12
    //   275: aload 12
    //   277: astore 9
    //   279: goto -156 -> 123
    //   282: astore 7
    //   284: aload 7
    //   286: invokevirtual 410	java/lang/Exception:printStackTrace	()V
    //   289: aload 5
    //   291: invokevirtual 402	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   294: aload 5
    //   296: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   299: aload 4
    //   301: areturn
    //   302: astore 6
    //   304: aload 5
    //   306: invokevirtual 402	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   309: aload 5
    //   311: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   314: aload 6
    //   316: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	317	0	this	CacheManager
    //   0	317	1	paramString1	String
    //   0	317	2	paramBoolean	boolean
    //   0	317	3	paramString2	String
    //   3	297	4	str1	String
    //   12	298	5	localSQLiteDatabase	SQLiteDatabase
    //   302	13	6	localObject1	Object
    //   282	3	7	localException	Exception
    //   94	166	8	str2	String
    //   121	157	9	localObject2	Object
    //   150	31	10	localCursor	Cursor
    //   273	3	12	str3	String
    // Exception table:
    //   from	to	target	type
    //   14	46	282	java/lang/Exception
    //   46	96	282	java/lang/Exception
    //   100	123	282	java/lang/Exception
    //   123	180	282	java/lang/Exception
    //   180	187	282	java/lang/Exception
    //   200	249	282	java/lang/Exception
    //   252	275	282	java/lang/Exception
    //   14	46	302	finally
    //   46	96	302	finally
    //   100	123	302	finally
    //   123	180	302	finally
    //   180	187	302	finally
    //   200	249	302	finally
    //   252	275	302	finally
    //   284	289	302	finally
  }
  
  private ContentValues setValuesForCacheDevicesTable(DeviceInformation paramDeviceInformation, ContentValues paramContentValues)
  {
    paramContentValues.put("udn", paramDeviceInformation.getUDN());
    paramContentValues.put("type", paramDeviceInformation.getType());
    paramContentValues.put("friendlyName", paramDeviceInformation.getFriendlyName());
    paramContentValues.put("icon", paramDeviceInformation.getIcon());
    paramContentValues.put("attributeList", paramDeviceInformation.getAttributeList().toString());
    paramContentValues.put("modelName", paramDeviceInformation.getModelCode());
    paramContentValues.put("customizedState", paramDeviceInformation.getCustomizedState());
    paramContentValues.put("firmwareVersion", paramDeviceInformation.getFirmwareVersion());
    paramContentValues.put("info", paramDeviceInformation.getInfo());
    paramContentValues.put("fwstatus", paramDeviceInformation.getFwStatus());
    paramContentValues.put("lastSeen", paramDeviceInformation.getLastSeen());
    paramContentValues.put("state", Integer.valueOf(paramDeviceInformation.getState()));
    paramContentValues.put("inactive", Integer.valueOf(paramDeviceInformation.getInActive()));
    paramContentValues.put("isDiscovered", String.valueOf(paramDeviceInformation.getIsDiscovered()));
    paramContentValues.put("hide", Integer.valueOf(paramDeviceInformation.getHide()));
    paramContentValues.put("bridgeUDN", paramDeviceInformation.getBridgeUDN());
    paramContentValues.put("productType", paramDeviceInformation.getProductType());
    paramContentValues.put("productName", paramDeviceInformation.getProductName());
    paramContentValues.put("capabilityIDs", paramDeviceInformation.getCapabilityID());
    paramContentValues.put("currentState", paramDeviceInformation.getCurrentState());
    paramContentValues.put("wemoCertified", paramDeviceInformation.getWemoCertified());
    paramContentValues.put("manufacturerName", paramDeviceInformation.getManufacturerName());
    paramContentValues.put("currentState", paramDeviceInformation.getCurrentState());
    paramContentValues.put("mac", paramDeviceInformation.getMAC());
    paramContentValues.put("hwVersion", paramDeviceInformation.getHwVersion());
    paramContentValues.put("statusTS", Integer.valueOf(paramDeviceInformation.getStatusTS()));
    paramContentValues.put("groupID", paramDeviceInformation.getGroupID());
    paramContentValues.put("groupName", paramDeviceInformation.getGroupName());
    paramContentValues.put("groupIcon", paramDeviceInformation.getGroupIcon());
    paramContentValues.put("parentExternalId", paramDeviceInformation.getParentExternalId());
    paramContentValues.put("parentName", paramDeviceInformation.getParentName());
    String str = paramDeviceInformation.getSSID();
    if (TextUtils.isEmpty(str)) {
      str = paramDeviceInformation.getMAC();
    }
    paramContentValues.put("ssid", str);
    paramContentValues.put("rulesDBVersion", Integer.valueOf(paramDeviceInformation.getRulesDBVersion()));
    paramContentValues.put("iconVersion", paramDeviceInformation.getIconVersion());
    SDKLogUtils.debugLog("cacheManager", "Update DB for Device: " + paramDeviceInformation);
    return paramContentValues;
  }
  
  private ContentValues setValuesForLocalCacheTable(DeviceInformation paramDeviceInformation, ContentValues paramContentValues)
  {
    String str1 = paramDeviceInformation.getUDN();
    String str2 = paramDeviceInformation.getIP();
    String str3 = String.valueOf(paramDeviceInformation.getPort());
    paramContentValues.put("udn", str1);
    paramContentValues.put("IP", str2);
    paramContentValues.put("port", str3);
    SDKLogUtils.debugLog("cacheManager", "Updating cache_local table. UDN: " + str1 + "; new IP: " + str2 + "; new Port: " + str3);
    return paramContentValues;
  }
  
  private ContentValues setValuesForLocalCacheTable(String paramString1, String paramString2, int paramInt, ContentValues paramContentValues)
  {
    paramContentValues.put("udn", paramString1);
    paramContentValues.put("IP", paramString2);
    paramContentValues.put("port", Integer.valueOf(paramInt));
    return paramContentValues;
  }
  
  private ContentValues setValuesForRemoteCacheTable(DeviceInformation paramDeviceInformation, ContentValues paramContentValues)
  {
    paramContentValues.put("udn", paramDeviceInformation.getUDN());
    paramContentValues.put("homeID", paramDeviceInformation.getHomeID());
    paramContentValues.put("mac", paramDeviceInformation.getMAC());
    paramContentValues.put("pluginID", paramDeviceInformation.getPluginID());
    return paramContentValues;
  }
  
  private ContentValues setZigBeeDeviceInfoToContentValuesForLocalCacheTable(ZigBeeDeviceInformation paramZigBeeDeviceInformation, ContentValues paramContentValues)
  {
    paramContentValues.put("bridgeUDN", paramZigBeeDeviceInformation.getBridgeUDN());
    paramContentValues.put("capabilities", paramZigBeeDeviceInformation.getCapabilities());
    paramContentValues.put("firmwareVersion", paramZigBeeDeviceInformation.getFirmwareVersion());
    paramContentValues.put("modelName", paramZigBeeDeviceInformation.getModelCode());
    paramContentValues.put("uniqueID", paramZigBeeDeviceInformation.getUniqueID());
    paramContentValues.put("friendlyName", paramZigBeeDeviceInformation.getName());
    paramContentValues.put("state", Integer.valueOf(paramZigBeeDeviceInformation.getState()));
    paramContentValues.put("groupID", Integer.valueOf(paramZigBeeDeviceInformation.getGroupId()));
    paramContentValues.put("groupName", paramZigBeeDeviceInformation.getGroupName());
    paramContentValues.put("groupCapability", paramZigBeeDeviceInformation.getGroupCapability());
    paramContentValues.put("manufacturerName", paramZigBeeDeviceInformation.getManufacturerName());
    paramContentValues.put("wemoCertified", paramZigBeeDeviceInformation.getWemoCertified());
    paramContentValues.put("uploadId", paramZigBeeDeviceInformation.getIconUploadID());
    return paramContentValues;
  }
  
  public boolean addDeviceToDB(DeviceInformation paramDeviceInformation, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    boolean bool = true;
    SQLiteDatabase localSQLiteDatabase;
    if (!TextUtils.isEmpty(paramDeviceInformation.getUDN()))
    {
      localSQLiteDatabase = this.dbCreator.getWritableDatabase();
      localSQLiteDatabase.beginTransaction();
      if (paramBoolean1) {}
      try
      {
        localSQLiteDatabase.insertOrThrow("cache_local", null, setValuesForLocalCacheTable(paramDeviceInformation, new ContentValues()));
        if (paramBoolean2) {
          localSQLiteDatabase.insertOrThrow("cache_remote", null, setValuesForRemoteCacheTable(paramDeviceInformation, new ContentValues()));
        }
        if (paramBoolean3) {
          localSQLiteDatabase.insertOrThrow("cache_devices", null, setValuesForCacheDevicesTable(paramDeviceInformation, new ContentValues()));
        }
        localSQLiteDatabase.setTransactionSuccessful();
      }
      catch (SQLException localSQLException)
      {
        for (;;)
        {
          localSQLException.printStackTrace();
          localSQLiteDatabase.endTransaction();
          bool = false;
        }
      }
      finally
      {
        localSQLiteDatabase.endTransaction();
      }
      SDKLogUtils.infoLog("DeviceListController", "result:" + bool + " added device in cache db: " + paramDeviceInformation);
      return bool;
    }
    SDKLogUtils.errorLog("cacheManager", "addDeviceToDB(): Empty/Null UDN found so device not added to DB.");
    return false;
  }
  
  public boolean addDiscoveryHit(boolean paramBoolean, String paramString)
  {
    if (this.disableStat) {
      return false;
    }
    SQLiteDatabase localSQLiteDatabase;
    if (!TextUtils.isEmpty(paramString))
    {
      localSQLiteDatabase = this.dbCreator.getWritableDatabase();
      localSQLiteDatabase.beginTransaction();
    }
    for (;;)
    {
      try
      {
        SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date localDate = new Date();
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("udn", paramString);
        localContentValues.put("datetime", localSimpleDateFormat.format(localDate));
        localContentValues.put("hit", Boolean.valueOf(paramBoolean));
        if (NetworkMode.isLocal()) {
          continue;
        }
        bool2 = true;
        localContentValues.put("remote", Boolean.valueOf(bool2));
        localSQLiteDatabase.insertOrThrow("cache_discovery_hit", null, localContentValues);
        bool1 = true;
      }
      catch (Exception localException)
      {
        boolean bool2;
        localException.printStackTrace();
        localSQLiteDatabase.setTransactionSuccessful();
        localSQLiteDatabase.endTransaction();
        bool1 = false;
        continue;
      }
      finally
      {
        localSQLiteDatabase.setTransactionSuccessful();
        localSQLiteDatabase.endTransaction();
      }
      return bool1;
      bool2 = false;
      continue;
      SDKLogUtils.errorLog("cacheManager", "addDiscoveryHit(): Empty/Null UDN found so device not added to DB.");
      boolean bool1 = false;
    }
  }
  
  public boolean addDiscoveryHitZigBee(boolean paramBoolean, String paramString1, String paramString2)
  {
    if (this.disableStat) {
      return false;
    }
    SQLiteDatabase localSQLiteDatabase;
    if ((!TextUtils.isEmpty(paramString1)) || (!TextUtils.isEmpty(paramString2)))
    {
      localSQLiteDatabase = this.dbCreator.getWritableDatabase();
      localSQLiteDatabase.beginTransaction();
    }
    for (;;)
    {
      try
      {
        SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date localDate = new Date();
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("bridgeUDN", paramString1);
        localContentValues.put("uniqueID", paramString2);
        localContentValues.put("datetime", localSimpleDateFormat.format(localDate));
        localContentValues.put("hit", Boolean.valueOf(paramBoolean));
        if (NetworkMode.isLocal()) {
          continue;
        }
        bool2 = true;
        localContentValues.put("remote", Boolean.valueOf(bool2));
        localSQLiteDatabase.insertOrThrow("cache_discovery_hit_zigbee", null, localContentValues);
        bool1 = true;
      }
      catch (SQLException localSQLException)
      {
        boolean bool2;
        localSQLException.printStackTrace();
        localSQLiteDatabase.setTransactionSuccessful();
        localSQLiteDatabase.endTransaction();
        bool1 = false;
        continue;
      }
      finally
      {
        localSQLiteDatabase.setTransactionSuccessful();
        localSQLiteDatabase.endTransaction();
      }
      return bool1;
      bool2 = false;
      continue;
      SDKLogUtils.errorLog("cacheManager", "addDiscoveryHitZigBee(): Empty/Null UDN found so device not added to DB.");
      boolean bool1 = false;
    }
  }
  
  public boolean addDiscoveryTry(boolean paramBoolean, String paramString, long paramLong)
  {
    if (this.disableStat) {
      return false;
    }
    SQLiteDatabase localSQLiteDatabase;
    if (!TextUtils.isEmpty(paramString))
    {
      localSQLiteDatabase = this.dbCreator.getWritableDatabase();
      localSQLiteDatabase.beginTransaction();
    }
    for (;;)
    {
      try
      {
        SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date localDate = new Date();
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("udn", paramString);
        localContentValues.put("datetime", localSimpleDateFormat.format(localDate));
        localContentValues.put("time", Long.valueOf(paramLong));
        localContentValues.put("status", Boolean.valueOf(paramBoolean));
        if (NetworkMode.isLocal()) {
          continue;
        }
        bool2 = true;
        localContentValues.put("remote", Boolean.valueOf(bool2));
        localSQLiteDatabase.insertOrThrow("cache_discovery_stat", null, localContentValues);
        bool1 = true;
      }
      catch (SQLException localSQLException)
      {
        boolean bool2;
        localSQLException.printStackTrace();
        localSQLiteDatabase.setTransactionSuccessful();
        localSQLiteDatabase.endTransaction();
        bool1 = false;
        continue;
      }
      finally
      {
        localSQLiteDatabase.setTransactionSuccessful();
        localSQLiteDatabase.endTransaction();
      }
      return bool1;
      bool2 = false;
      continue;
      SDKLogUtils.errorLog("cacheManager", "addDiscoveryTry(): Empty/Null UDN found so device not added to DB.");
      boolean bool1 = false;
    }
  }
  
  public boolean addDiscoveryZigBeeTry(boolean paramBoolean, String paramString1, String paramString2, long paramLong)
  {
    if (this.disableStat) {
      return false;
    }
    SQLiteDatabase localSQLiteDatabase;
    if ((!TextUtils.isEmpty(paramString1)) || (!TextUtils.isEmpty(paramString2)))
    {
      localSQLiteDatabase = this.dbCreator.getWritableDatabase();
      localSQLiteDatabase.beginTransaction();
    }
    for (;;)
    {
      try
      {
        SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date localDate = new Date();
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("bridgeUDN", paramString1);
        localContentValues.put("uniqueID", paramString2);
        localContentValues.put("datetime", localSimpleDateFormat.format(localDate));
        localContentValues.put("time", Long.valueOf(paramLong));
        localContentValues.put("status", Boolean.valueOf(paramBoolean));
        if (NetworkMode.isLocal()) {
          continue;
        }
        bool2 = true;
        localContentValues.put("remote", Boolean.valueOf(bool2));
        localSQLiteDatabase.insertOrThrow("cache_discovery_stat_zigbee", null, localContentValues);
        bool1 = true;
      }
      catch (SQLException localSQLException)
      {
        boolean bool2;
        localSQLException.printStackTrace();
        localSQLiteDatabase.setTransactionSuccessful();
        localSQLiteDatabase.endTransaction();
        bool1 = false;
        continue;
      }
      finally
      {
        localSQLiteDatabase.setTransactionSuccessful();
        localSQLiteDatabase.endTransaction();
      }
      return bool1;
      bool2 = false;
      continue;
      SDKLogUtils.errorLog("cacheManager", "addDiscoveryZigBeeTry(): Empty/Null UDN found so device not added to DB.");
      boolean bool1 = false;
    }
  }
  
  /* Error */
  public void addSenosrEventsintoDB(JSONObject paramJSONObject)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 28	com/belkin/wemo/cache/CacheManager:dbCreator	Lcom/belkin/wemo/cache/CacheManagerDBCreator;
    //   4: invokevirtual 362	com/belkin/wemo/cache/CacheManagerDBCreator:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   7: astore_2
    //   8: aload_2
    //   9: invokevirtual 365	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   12: aload_1
    //   13: ldc_w 689
    //   16: invokevirtual 693	org/json/JSONObject:getJSONArray	(Ljava/lang/String;)Lorg/json/JSONArray;
    //   19: astore 6
    //   21: new 417	android/content/ContentValues
    //   24: dup
    //   25: invokespecial 595	android/content/ContentValues:<init>	()V
    //   28: astore 7
    //   30: iconst_0
    //   31: istore 8
    //   33: iload 8
    //   35: aload 6
    //   37: invokevirtual 698	org/json/JSONArray:length	()I
    //   40: if_icmpge +276 -> 316
    //   43: aload 6
    //   45: iload 8
    //   47: invokevirtual 702	org/json/JSONArray:getJSONObject	(I)Lorg/json/JSONObject;
    //   50: astore 9
    //   52: aload 9
    //   54: ldc_w 704
    //   57: invokevirtual 707	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   60: checkcast 224	org/json/JSONObject
    //   63: astore 10
    //   65: new 224	org/json/JSONObject
    //   68: dup
    //   69: aload 10
    //   71: ldc_w 709
    //   74: invokevirtual 712	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   77: invokespecial 226	org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   80: astore 11
    //   82: aload 7
    //   84: ldc_w 714
    //   87: aload 9
    //   89: ldc_w 714
    //   92: invokevirtual 707	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   95: invokevirtual 715	java/lang/Object:toString	()Ljava/lang/String;
    //   98: invokevirtual 419	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   101: aload 7
    //   103: ldc_w 717
    //   106: ldc_w 359
    //   109: invokevirtual 419	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   112: aload 7
    //   114: ldc_w 719
    //   117: ldc_w 359
    //   120: invokevirtual 419	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   123: aload 7
    //   125: ldc_w 721
    //   128: aload 11
    //   130: ldc_w 721
    //   133: invokevirtual 707	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   136: invokevirtual 715	java/lang/Object:toString	()Ljava/lang/String;
    //   139: invokevirtual 419	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   142: aload 7
    //   144: ldc_w 723
    //   147: aload 11
    //   149: ldc_w 723
    //   152: invokevirtual 707	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   155: invokevirtual 715	java/lang/Object:toString	()Ljava/lang/String;
    //   158: invokevirtual 419	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   161: aload 7
    //   163: ldc -67
    //   165: aload 10
    //   167: ldc_w 725
    //   170: invokevirtual 707	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   173: invokevirtual 715	java/lang/Object:toString	()Ljava/lang/String;
    //   176: invokevirtual 419	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   179: aload 7
    //   181: ldc_w 676
    //   184: ldc_w 359
    //   187: invokevirtual 419	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   190: aload 7
    //   192: ldc_w 727
    //   195: aload 10
    //   197: ldc_w 727
    //   200: invokevirtual 707	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   203: invokevirtual 715	java/lang/Object:toString	()Ljava/lang/String;
    //   206: invokevirtual 419	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   209: aload 7
    //   211: ldc -112
    //   213: aload 10
    //   215: ldc_w 729
    //   218: invokevirtual 707	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   221: invokevirtual 715	java/lang/Object:toString	()Ljava/lang/String;
    //   224: invokevirtual 419	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   227: aload 7
    //   229: ldc_w 731
    //   232: ldc_w 359
    //   235: invokevirtual 419	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   238: aload 7
    //   240: ldc_w 733
    //   243: ldc_w 359
    //   246: invokevirtual 419	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   249: aload 7
    //   251: ldc_w 735
    //   254: aload 10
    //   256: ldc_w 737
    //   259: invokevirtual 707	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   262: invokevirtual 715	java/lang/Object:toString	()Ljava/lang/String;
    //   265: invokevirtual 419	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   268: aload 7
    //   270: ldc_w 739
    //   273: aload 9
    //   275: ldc_w 741
    //   278: invokevirtual 707	org/json/JSONObject:get	(Ljava/lang/String;)Ljava/lang/Object;
    //   281: invokevirtual 715	java/lang/Object:toString	()Ljava/lang/String;
    //   284: invokevirtual 419	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   287: aload_2
    //   288: ldc_w 743
    //   291: aconst_null
    //   292: aload 7
    //   294: invokevirtual 601	android/database/sqlite/SQLiteDatabase:insertOrThrow	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    //   297: pop2
    //   298: iinc 8 1
    //   301: goto -268 -> 33
    //   304: astore 5
    //   306: ldc 24
    //   308: ldc_w 745
    //   311: aload 5
    //   313: invokestatic 238	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    //   316: aload_2
    //   317: invokevirtual 402	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   320: aload_2
    //   321: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   324: return
    //   325: astore 4
    //   327: ldc 24
    //   329: ldc_w 747
    //   332: aload 4
    //   334: invokestatic 238	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    //   337: aload_2
    //   338: invokevirtual 402	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   341: aload_2
    //   342: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   345: return
    //   346: astore_3
    //   347: aload_2
    //   348: invokevirtual 402	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   351: aload_2
    //   352: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   355: aload_3
    //   356: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	357	0	this	CacheManager
    //   0	357	1	paramJSONObject	JSONObject
    //   7	345	2	localSQLiteDatabase	SQLiteDatabase
    //   346	10	3	localObject	Object
    //   325	8	4	localSQLException	SQLException
    //   304	8	5	localJSONException	JSONException
    //   19	25	6	localJSONArray	JSONArray
    //   28	265	7	localContentValues	ContentValues
    //   31	268	8	i	int
    //   50	224	9	localJSONObject1	JSONObject
    //   63	192	10	localJSONObject2	JSONObject
    //   80	68	11	localJSONObject3	JSONObject
    // Exception table:
    //   from	to	target	type
    //   12	30	304	org/json/JSONException
    //   33	298	304	org/json/JSONException
    //   12	30	325	android/database/SQLException
    //   33	298	325	android/database/SQLException
    //   306	316	325	android/database/SQLException
    //   12	30	346	finally
    //   33	298	346	finally
    //   306	316	346	finally
    //   327	337	346	finally
  }
  
  public boolean addZigBeeDevice(ZigBeeDeviceInformation paramZigBeeDeviceInformation)
  {
    if (!TextUtils.isEmpty(paramZigBeeDeviceInformation.getBridgeUDN()))
    {
      SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
      localSQLiteDatabase.beginTransaction();
      try
      {
        localSQLiteDatabase.insertOrThrow("cache_zigbee", null, setZigBeeDeviceInfoToContentValuesForLocalCacheTable(paramZigBeeDeviceInformation, new ContentValues()));
        return true;
      }
      catch (SQLException localSQLException)
      {
        localSQLException.printStackTrace();
        return false;
      }
      finally
      {
        localSQLiteDatabase.setTransactionSuccessful();
        localSQLiteDatabase.endTransaction();
      }
    }
    SDKLogUtils.errorLog("cacheManager", "addZigBeeDevice(): Empty/Null Bridge UDN found so device not added to DB.");
    return false;
  }
  
  public void close()
  {
    if (this.dbCreator != null) {
      this.dbCreator.close();
    }
  }
  
  public void closeDB()
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getReadableDatabase();
    if ((localSQLiteDatabase != null) && (localSQLiteDatabase.isOpen())) {
      localSQLiteDatabase.close();
    }
  }
  
  public void deleteAllDeviceFromDB(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    localSQLiteDatabase.beginTransaction();
    if (paramBoolean1) {}
    try
    {
      localSQLiteDatabase.delete("cache_local", "", null);
      if (paramBoolean2) {
        localSQLiteDatabase.delete("cache_remote", "", null);
      }
      if (paramBoolean3) {
        localSQLiteDatabase.delete("cache_devices", "", null);
      }
      return;
    }
    catch (SQLException localSQLException)
    {
      localSQLException.printStackTrace();
      return;
    }
    finally
    {
      localSQLiteDatabase.setTransactionSuccessful();
      localSQLiteDatabase.endTransaction();
    }
  }
  
  public boolean deleteDeviceFromDB(DeviceInformation paramDeviceInformation, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    return deleteDeviceFromDB(paramDeviceInformation.getUDN(), paramBoolean1, paramBoolean2, paramBoolean3);
  }
  
  public boolean deleteDeviceFromDB(String paramString, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    localSQLiteDatabase.beginTransaction();
    int i = 0;
    int j;
    if (paramBoolean1)
    {
      if (doesEntryExistInTable("cache_local", paramString)) {
        i = localSQLiteDatabase.delete("cache_local", "udn = ?", new String[] { paramString });
      }
    }
    else
    {
      j = 0;
      if (paramBoolean2)
      {
        if (!doesEntryExistInTable("cache_remote", paramString)) {
          break label251;
        }
        j = localSQLiteDatabase.delete("cache_remote", "udn = ?", new String[] { paramString });
      }
      label92:
      k = 0;
      if (paramBoolean3) {
        if (!doesEntryExistInTable("cache_devices", paramString)) {
          break label257;
        }
      }
    }
    label251:
    label257:
    for (int k = localSQLiteDatabase.delete("cache_devices", "udn = ?", new String[] { paramString });; k = 1)
    {
      localSQLiteDatabase.setTransactionSuccessful();
      localSQLiteDatabase.endTransaction();
      SDKLogUtils.infoLog("cacheManager", "Device delete. UDN: " + paramString + "; Rows deleted. Local_cache: " + i + "; Rows deleted. Remote_cache: " + j + "; Rows deleted. cache_devices: " + k);
      if ((i < 1) || (j < 1) || (k < 1)) {
        break label263;
      }
      SDKLogUtils.infoLog("cacheManager", "Device deleted from all 3 tables " + paramString);
      return true;
      i = 1;
      break;
      j = 1;
      break label92;
    }
    label263:
    SDKLogUtils.infoLog("cacheManager", "Device failed " + paramString);
    return false;
  }
  
  public int deleteDevicesInGroup(String paramString)
  {
    try
    {
      SDKLogUtils.debugLog("cacheManager", "Deleting device entries, from DB, with GroupID: " + paramString);
      SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
      localSQLiteDatabase.beginTransaction();
      int i = localSQLiteDatabase.delete("cache_devices", "groupID=?", new String[] { paramString });
      localSQLiteDatabase.setTransactionSuccessful();
      localSQLiteDatabase.endTransaction();
      SDKLogUtils.debugLog("cacheManager", "Deleting device entries from DB. Rows deleted: " + i);
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  /* Error */
  public int getAvgDiscoveryTime(String paramString, boolean paramBoolean1, boolean paramBoolean2)
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore 4
    //   3: aload_0
    //   4: getfield 28	com/belkin/wemo/cache/CacheManager:dbCreator	Lcom/belkin/wemo/cache/CacheManagerDBCreator;
    //   7: invokevirtual 362	com/belkin/wemo/cache/CacheManagerDBCreator:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   10: astore 5
    //   12: aload 5
    //   14: invokevirtual 365	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   17: iconst_0
    //   18: istore 4
    //   20: iload_3
    //   21: ifeq +121 -> 142
    //   24: new 260	java/lang/StringBuilder
    //   27: dup
    //   28: invokespecial 261	java/lang/StringBuilder:<init>	()V
    //   31: ldc_w 801
    //   34: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   37: aload_1
    //   38: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   41: ldc_w 803
    //   44: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   47: ldc_w 676
    //   50: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   53: ldc_w 805
    //   56: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   59: invokevirtual 273	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   62: astore 8
    //   64: iconst_0
    //   65: istore 4
    //   67: iload_2
    //   68: ifeq +117 -> 185
    //   71: new 260	java/lang/StringBuilder
    //   74: dup
    //   75: invokespecial 261	java/lang/StringBuilder:<init>	()V
    //   78: aload 8
    //   80: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   83: ldc_w 389
    //   86: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   89: invokevirtual 273	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   92: astore 9
    //   94: aload 5
    //   96: aload 9
    //   98: aconst_null
    //   99: invokevirtual 395	android/database/sqlite/SQLiteDatabase:rawQuery	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   102: astore 10
    //   104: aload 10
    //   106: invokeinterface 399 1 0
    //   111: pop
    //   112: aload 10
    //   114: iconst_0
    //   115: invokeinterface 94 2 0
    //   120: istore 4
    //   122: aload 10
    //   124: invokeinterface 68 1 0
    //   129: aload 5
    //   131: invokevirtual 402	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   134: aload 5
    //   136: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   139: iload 4
    //   141: ireturn
    //   142: new 260	java/lang/StringBuilder
    //   145: dup
    //   146: invokespecial 261	java/lang/StringBuilder:<init>	()V
    //   149: ldc_w 807
    //   152: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   155: aload_1
    //   156: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   159: ldc_w 803
    //   162: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   165: ldc_w 676
    //   168: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   171: ldc_w 805
    //   174: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   177: invokevirtual 273	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   180: astore 8
    //   182: goto -118 -> 64
    //   185: new 260	java/lang/StringBuilder
    //   188: dup
    //   189: invokespecial 261	java/lang/StringBuilder:<init>	()V
    //   192: aload 8
    //   194: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   197: ldc_w 407
    //   200: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   203: invokevirtual 273	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   206: astore 12
    //   208: aload 12
    //   210: astore 9
    //   212: goto -118 -> 94
    //   215: astore 7
    //   217: aload 7
    //   219: invokevirtual 410	java/lang/Exception:printStackTrace	()V
    //   222: aload 5
    //   224: invokevirtual 402	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   227: aload 5
    //   229: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   232: iload 4
    //   234: ireturn
    //   235: astore 6
    //   237: aload 5
    //   239: invokevirtual 402	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   242: aload 5
    //   244: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   247: aload 6
    //   249: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	250	0	this	CacheManager
    //   0	250	1	paramString	String
    //   0	250	2	paramBoolean1	boolean
    //   0	250	3	paramBoolean2	boolean
    //   1	232	4	i	int
    //   10	233	5	localSQLiteDatabase	SQLiteDatabase
    //   235	13	6	localObject1	Object
    //   215	3	7	localException	Exception
    //   62	131	8	str1	String
    //   92	119	9	localObject2	Object
    //   102	21	10	localCursor	Cursor
    //   206	3	12	str2	String
    // Exception table:
    //   from	to	target	type
    //   12	17	215	java/lang/Exception
    //   24	64	215	java/lang/Exception
    //   71	94	215	java/lang/Exception
    //   94	129	215	java/lang/Exception
    //   142	182	215	java/lang/Exception
    //   185	208	215	java/lang/Exception
    //   12	17	235	finally
    //   24	64	235	finally
    //   71	94	235	finally
    //   94	129	235	finally
    //   142	182	235	finally
    //   185	208	235	finally
    //   217	222	235	finally
  }
  
  public double getCacheHit(String paramString, boolean paramBoolean1, boolean paramBoolean2)
  {
    int i = 0;
    int j = 0;
    localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    for (;;)
    {
      try
      {
        localSQLiteDatabase.beginTransaction();
        j = 0;
        i = 0;
        if (!paramBoolean2) {
          continue;
        }
        str1 = "SELECT COUNT(*)  FROM cache_discovery_hit_zigbee WHERE uniqueID = \"" + paramString + "\"";
        j = 0;
        i = 0;
        if (!paramBoolean1) {
          continue;
        }
        str2 = str1 + " AND remote= 1";
        Cursor localCursor1 = localSQLiteDatabase.rawQuery(str2, null);
        localCursor1.moveToFirst();
        i = localCursor1.getInt(0);
        localCursor1.close();
        j = 0;
        if (!paramBoolean2) {
          continue;
        }
        str3 = "SELECT COUNT(*)  FROM cache_discovery_hit_zigbee WHERE uniqueID = \"" + paramString + "\" AND " + "hit" + "= 1";
        j = 0;
        if (!paramBoolean1) {
          continue;
        }
        localObject2 = str3 + " AND remote= 1";
        Cursor localCursor2 = localSQLiteDatabase.rawQuery((String)localObject2, null);
        localCursor2.moveToFirst();
        j = localCursor2.getInt(0);
        localCursor2.close();
      }
      catch (Exception localException)
      {
        String str1;
        String str2;
        String str3;
        Object localObject2;
        double d;
        String str4;
        localException.printStackTrace();
        localSQLiteDatabase.setTransactionSuccessful();
        localSQLiteDatabase.endTransaction();
        continue;
      }
      finally
      {
        localSQLiteDatabase.setTransactionSuccessful();
        localSQLiteDatabase.endTransaction();
      }
      d = 0.0D;
      if (i > 0) {
        d = 100.0D * j / i;
      }
      return d;
      str1 = "SELECT COUNT(*)  FROM cache_discovery_hit WHERE udn = \"" + paramString + "\"";
      continue;
      str2 = str1 + " AND remote= 0";
      continue;
      str3 = "SELECT COUNT(*)  FROM cache_discovery_hit WHERE udn = \"" + paramString + "\" AND " + "hit" + "= 1";
      continue;
      str4 = str3 + " AND remote= 0";
      localObject2 = str4;
    }
  }
  
  public JSONArray getDWSensorList()
    throws JSONException
  {
    JSONArray localJSONArray = new JSONArray();
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getReadableDatabase();
    localSQLiteDatabase.beginTransaction();
    Cursor localCursor = localSQLiteDatabase.rawQuery("SELECT * FROM cache_devices WHERE productName = \"" + "DWSensor".toLowerCase() + "\"", null);
    localCursor.moveToFirst();
    while (!localCursor.isAfterLast())
    {
      JSONObject localJSONObject = new JSONObject();
      String str1 = localCursor.getString(localCursor.getColumnIndex("bridgeUDN"));
      String str2 = str1 + ":" + localCursor.getString(localCursor.getColumnIndex("udn"));
      localJSONObject.put("friendlyName", localCursor.getString(localCursor.getColumnIndex("friendlyName")));
      localJSONObject.put("udn", str2);
      localJSONObject.put("bridgeudn", str1);
      localJSONObject.put("ProductName", "DWSensor");
      localJSONArray.put(localJSONObject);
      localCursor.moveToNext();
    }
    localCursor.close();
    localSQLiteDatabase.setTransactionSuccessful();
    localSQLiteDatabase.endTransaction();
    return localJSONArray;
  }
  
  public DeviceInformation getDeviceInfoFromDBByID(int paramInt, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    localSQLiteDatabase.beginTransaction();
    DeviceInformation localDeviceInformation;
    if (paramBoolean1)
    {
      Cursor localCursor3 = localSQLiteDatabase.rawQuery("SELECT  * FROM cache_local WHERE id = " + paramInt, null);
      localDeviceInformation = null;
      if (localCursor3 != null)
      {
        localCursor3.moveToFirst();
        localDeviceInformation = getDeviceInformationFromLocalCacheTableCursor(localCursor3);
        localCursor3.close();
      }
    }
    for (;;)
    {
      localSQLiteDatabase.setTransactionSuccessful();
      localSQLiteDatabase.endTransaction();
      return localDeviceInformation;
      if (paramBoolean2)
      {
        Cursor localCursor2 = localSQLiteDatabase.rawQuery("SELECT  * FROM cache_remote WHERE id = " + paramInt, null);
        localDeviceInformation = null;
        if (localCursor2 != null)
        {
          localCursor2.moveToFirst();
          localDeviceInformation = getDeviceInformationFromRemoteCacheTableCursor(localCursor2);
          localCursor2.close();
        }
      }
      else
      {
        localDeviceInformation = null;
        if (paramBoolean3)
        {
          Cursor localCursor1 = localSQLiteDatabase.rawQuery("SELECT  * FROM cache_devices WHERE id = " + paramInt, null);
          localDeviceInformation = null;
          if (localCursor1 != null)
          {
            localCursor1.moveToFirst();
            localDeviceInformation = getDeviceInformationFromDevicesCacheTableCursor(localCursor1);
            localCursor1.close();
          }
        }
      }
    }
  }
  
  public DeviceInformation getDeviceInformationByMAC(String paramString)
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    Cursor localCursor1 = localSQLiteDatabase.query("cache_devices", null, "mac=?", new String[] { paramString }, null, null, null);
    DeviceInformation localDeviceInformation1 = null;
    if (localCursor1 != null)
    {
      localCursor1.moveToFirst();
      localDeviceInformation1 = getDeviceInformationFromDevicesCacheTableCursor(localCursor1);
      localCursor1.close();
      if (localDeviceInformation1 != null)
      {
        String[] arrayOfString = new String[1];
        arrayOfString[0] = localDeviceInformation1.getUDN();
        Cursor localCursor2 = localSQLiteDatabase.query("cache_local", null, "udn=?", arrayOfString, null, null, null);
        if (localCursor2 != null)
        {
          localCursor2.moveToFirst();
          DeviceInformation localDeviceInformation2 = getDeviceInformationFromLocalCacheTableCursor(localCursor2);
          localCursor2.close();
          localDeviceInformation1.setIP(localDeviceInformation2.getIP());
          localDeviceInformation1.setPort(localDeviceInformation2.getPort());
        }
        localDeviceInformation1.setMAC(paramString);
        SDKLogUtils.debugLog("cacheManager", "getDeviceInformationByMAC: Device found with UDN: " + localDeviceInformation1.getUDN() + "; FriendlyName: " + localDeviceInformation1.getFriendlyName());
      }
    }
    else
    {
      return localDeviceInformation1;
    }
    SDKLogUtils.debugLog("cacheManager", "getDeviceInformationByMAC: Device is NULL for mac: " + paramString);
    return localDeviceInformation1;
  }
  
  public DeviceInformation getDeviceInformationByUDN(String paramString)
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    Cursor localCursor1 = localSQLiteDatabase.query("cache_devices", null, "udn=?", new String[] { paramString }, null, null, null);
    DeviceInformation localDeviceInformation1 = null;
    if (localCursor1 != null)
    {
      localCursor1.moveToFirst();
      localDeviceInformation1 = getDeviceInformationFromDevicesCacheTableCursor(localCursor1);
      localCursor1.close();
      if (localDeviceInformation1 != null)
      {
        Cursor localCursor2 = localSQLiteDatabase.query("cache_local", null, "udn=?", new String[] { paramString }, null, null, null);
        if (localCursor2 != null)
        {
          localCursor2.moveToFirst();
          DeviceInformation localDeviceInformation2 = getDeviceInformationFromLocalCacheTableCursor(localCursor2);
          localCursor2.close();
          localDeviceInformation1.setIP(localDeviceInformation2.getIP());
          localDeviceInformation1.setPort(localDeviceInformation2.getPort());
        }
        SDKLogUtils.debugLog("cacheManager", "getDeviceInformationByUDN: Device found with UDN: " + localDeviceInformation1.getUDN() + "; FriendlyName: " + localDeviceInformation1.getFriendlyName());
      }
    }
    else
    {
      return localDeviceInformation1;
    }
    SDKLogUtils.debugLog("cacheManager", "getDeviceInformationByMAC: Device is NULL for UDN: " + paramString);
    return localDeviceInformation1;
  }
  
  public ArrayList<DeviceInformation> getDeviceListFromDB(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    ArrayList localArrayList = new ArrayList();
    localSQLiteDatabase.beginTransaction();
    if (paramBoolean1)
    {
      Cursor localCursor3 = localSQLiteDatabase.rawQuery("SELECT * FROM cache_local", null);
      localCursor3.moveToFirst();
      while (!localCursor3.isAfterLast())
      {
        localArrayList.add(getDeviceInformationFromLocalCacheTableCursor(localCursor3));
        localCursor3.moveToNext();
      }
      localCursor3.close();
    }
    for (;;)
    {
      localSQLiteDatabase.setTransactionSuccessful();
      localSQLiteDatabase.endTransaction();
      return localArrayList;
      if (paramBoolean2)
      {
        Cursor localCursor2 = localSQLiteDatabase.rawQuery("SELECT * FROM cache_remote", null);
        localCursor2.moveToFirst();
        while (!localCursor2.isAfterLast())
        {
          localArrayList.add(getDeviceInformationFromRemoteCacheTableCursor(localCursor2));
          localCursor2.moveToNext();
        }
        localCursor2.close();
      }
      else if (paramBoolean3)
      {
        Cursor localCursor1 = localSQLiteDatabase.rawQuery("SELECT * FROM cache_devices", null);
        localCursor1.moveToFirst();
        while (!localCursor1.isAfterLast())
        {
          localArrayList.add(getDeviceInformationFromDevicesCacheTableCursor(localCursor1));
          localCursor1.moveToNext();
        }
        localCursor1.close();
      }
    }
  }
  
  public String getDeviceStringProperty(String paramString1, String paramString2)
  {
    String str = "";
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    try
    {
      Cursor localCursor = localSQLiteDatabase.query("cache_devices", new String[] { paramString2 }, "udn = ?", new String[] { paramString1 }, null, null, null);
      if (localCursor != null)
      {
        if (localCursor.moveToFirst()) {
          str = localCursor.getString(localCursor.getColumnIndex(paramString2));
        }
        localCursor.close();
      }
    }
    catch (SQLException localSQLException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog("cacheManager", "SQLException while fetching property for UDN: " + paramString1 + "; column: " + paramString2);
      }
    }
    SDKLogUtils.debugLog("cacheManager", "Get device property from DB for UDN: " + paramString1 + "; column: " + paramString2 + "; value in DB: " + str);
    return str;
  }
  
  /* Error */
  public List<String> getDeviceUDNList()
  {
    // Byte code:
    //   0: ldc 24
    //   2: ldc_w 901
    //   5: invokestatic 277	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   8: new 877	java/util/ArrayList
    //   11: dup
    //   12: invokespecial 878	java/util/ArrayList:<init>	()V
    //   15: astore_1
    //   16: aload_0
    //   17: getfield 28	com/belkin/wemo/cache/CacheManager:dbCreator	Lcom/belkin/wemo/cache/CacheManagerDBCreator;
    //   20: invokevirtual 362	com/belkin/wemo/cache/CacheManagerDBCreator:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   23: astore_2
    //   24: aload_2
    //   25: invokevirtual 365	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   28: aload_2
    //   29: ldc_w 607
    //   32: iconst_1
    //   33: anewarray 49	java/lang/String
    //   36: dup
    //   37: iconst_0
    //   38: ldc 51
    //   40: aastore
    //   41: aconst_null
    //   42: aconst_null
    //   43: aconst_null
    //   44: aconst_null
    //   45: aconst_null
    //   46: invokevirtual 59	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   49: astore 5
    //   51: aload 5
    //   53: ifnull +110 -> 163
    //   56: aload 5
    //   58: invokeinterface 399 1 0
    //   63: ifeq +93 -> 156
    //   66: aload 5
    //   68: invokeinterface 828 1 0
    //   73: ifne +83 -> 156
    //   76: aload_1
    //   77: aload 5
    //   79: aload 5
    //   81: ldc 51
    //   83: invokeinterface 78 2 0
    //   88: invokeinterface 82 2 0
    //   93: invokeinterface 904 2 0
    //   98: pop
    //   99: aload 5
    //   101: invokeinterface 844 1 0
    //   106: pop
    //   107: goto -41 -> 66
    //   110: astore 4
    //   112: ldc 24
    //   114: ldc_w 906
    //   117: invokestatic 626	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   120: aload_2
    //   121: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   124: ldc 24
    //   126: new 260	java/lang/StringBuilder
    //   129: dup
    //   130: invokespecial 261	java/lang/StringBuilder:<init>	()V
    //   133: ldc_w 908
    //   136: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   139: aload_1
    //   140: invokeinterface 911 1 0
    //   145: invokevirtual 782	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   148: invokevirtual 273	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   151: invokestatic 277	com/belkin/wemo/cache/utils/SDKLogUtils:debugLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   154: aload_1
    //   155: areturn
    //   156: aload 5
    //   158: invokeinterface 68 1 0
    //   163: aload_2
    //   164: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   167: goto -43 -> 124
    //   170: astore_3
    //   171: aload_2
    //   172: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   175: aload_3
    //   176: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	177	0	this	CacheManager
    //   15	140	1	localArrayList	ArrayList
    //   23	149	2	localSQLiteDatabase	SQLiteDatabase
    //   170	6	3	localObject	Object
    //   110	1	4	localSQLException	SQLException
    //   49	108	5	localCursor	Cursor
    // Exception table:
    //   from	to	target	type
    //   24	51	110	android/database/SQLException
    //   56	66	110	android/database/SQLException
    //   66	107	110	android/database/SQLException
    //   156	163	110	android/database/SQLException
    //   24	51	170	finally
    //   56	66	170	finally
    //   66	107	170	finally
    //   112	120	170	finally
    //   156	163	170	finally
  }
  
  public ArrayList<DeviceInformation> getDevicesForGroup(String paramString)
  {
    ArrayList localArrayList;
    SQLiteDatabase localSQLiteDatabase;
    try
    {
      localArrayList = new ArrayList();
      localSQLiteDatabase = this.dbCreator.getWritableDatabase();
      localSQLiteDatabase.beginTransaction();
      Cursor localCursor1 = localSQLiteDatabase.rawQuery("SELECT  * FROM cache_devices WHERE groupID = \"" + paramString + "\"", null);
      localCursor1.moveToFirst();
      while (!localCursor1.isAfterLast())
      {
        DeviceInformation localDeviceInformation = getDeviceInformationFromDevicesCacheTableCursor(localCursor1);
        Cursor localCursor2 = localSQLiteDatabase.rawQuery("SELECT  * FROM cache_remote WHERE udn = \"" + localDeviceInformation.getUDN() + "\"", null);
        if (localCursor2.moveToFirst()) {
          localDeviceInformation.setPluginId(getDeviceInformationFromRemoteCacheTableCursor(localCursor2).getPluginID());
        }
        localCursor2.close();
        localArrayList.add(localDeviceInformation);
        localCursor1.moveToNext();
      }
      localCursor1.close();
    }
    finally {}
    localSQLiteDatabase.setTransactionSuccessful();
    localSQLiteDatabase.endTransaction();
    return localArrayList;
  }
  
  public JSONArray getFWVersions()
    throws JSONException
  {
    JSONArray localJSONArray = new JSONArray();
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getReadableDatabase();
    localSQLiteDatabase.beginTransaction();
    Cursor localCursor = localSQLiteDatabase.rawQuery("SELECT * FROM cache_devices WHERE type <> \"\"", null);
    localCursor.moveToFirst();
    while (!localCursor.isAfterLast())
    {
      if (localCursor.getInt(localCursor.getColumnIndex("inactive")) != 1)
      {
        JSONObject localJSONObject = new JSONObject();
        localJSONObject.put("udn", localCursor.getString(localCursor.getColumnIndex("udn")));
        localJSONObject.put("devicefirmware", localCursor.getString(localCursor.getColumnIndex("firmwareVersion")));
        localJSONArray.put(localJSONObject);
      }
      localCursor.moveToNext();
    }
    localCursor.close();
    localSQLiteDatabase.setTransactionSuccessful();
    localSQLiteDatabase.endTransaction();
    return localJSONArray;
  }
  
  public JSONArray getFobSensorList()
    throws JSONException
  {
    JSONArray localJSONArray = new JSONArray();
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getReadableDatabase();
    localSQLiteDatabase.beginTransaction();
    Cursor localCursor = localSQLiteDatabase.rawQuery("SELECT * FROM cache_devices WHERE productName = \"" + "Fob".toLowerCase() + "\"", null);
    localCursor.moveToFirst();
    while (!localCursor.isAfterLast())
    {
      JSONObject localJSONObject = new JSONObject();
      String str1 = localCursor.getString(localCursor.getColumnIndex("bridgeUDN"));
      String str2 = str1 + ":" + localCursor.getString(localCursor.getColumnIndex("udn"));
      localJSONObject.put("friendlyName", localCursor.getString(localCursor.getColumnIndex("friendlyName")));
      localJSONObject.put("udn", str2);
      localJSONObject.put("bridgeudn", str1);
      localJSONObject.put("ProductName", "Fob");
      localJSONArray.put(localJSONObject);
      localCursor.moveToNext();
    }
    localCursor.close();
    localSQLiteDatabase.setTransactionSuccessful();
    localSQLiteDatabase.endTransaction();
    return localJSONArray;
  }
  
  public DeviceInformation getFullDeviceInfoFromDBByUDN(String paramString)
  {
    localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    DeviceInformation localDeviceInformation1 = null;
    try
    {
      localSQLiteDatabase.beginTransaction();
      Cursor localCursor1 = localSQLiteDatabase.rawQuery("SELECT  * FROM cache_devices WHERE udn = \"" + paramString + "\"", null);
      localDeviceInformation1 = null;
      if (localCursor1 == null) {
        break label301;
      }
      localCursor1.moveToFirst();
      localDeviceInformation1 = getDeviceInformationFromDevicesCacheTableCursor(localCursor1);
      localCursor1.close();
      Cursor localCursor2 = localSQLiteDatabase.rawQuery("SELECT  * FROM cache_local WHERE udn = \"" + paramString + "\"", null);
      if (localCursor2 != null)
      {
        localCursor2.moveToFirst();
        if ((localCursor2.getColumnCount() > 0) && (localCursor2.getCount() > 0))
        {
          DeviceInformation localDeviceInformation3 = getDeviceInformationFromLocalCacheTableCursor(localCursor2);
          if (localDeviceInformation1 != null)
          {
            localDeviceInformation1.setIP(localDeviceInformation3.getIP());
            localDeviceInformation1.setPort(localDeviceInformation3.getPort());
          }
        }
        localCursor2.close();
      }
      Cursor localCursor3 = localSQLiteDatabase.rawQuery("SELECT  * FROM cache_remote WHERE udn = \"" + paramString + "\"", null);
      if (localCursor3 != null)
      {
        localCursor3.moveToFirst();
        if ((localCursor3.getColumnCount() > 0) && (localCursor3.getCount() > 0))
        {
          DeviceInformation localDeviceInformation2 = getDeviceInformationFromRemoteCacheTableCursor(localCursor3);
          if (localDeviceInformation1 != null)
          {
            localDeviceInformation1.setHomeID(localDeviceInformation2.getHomeID());
            localDeviceInformation1.setPluginId(localDeviceInformation2.getPluginID());
            localDeviceInformation1.setMAC(localDeviceInformation2.getMAC());
          }
        }
        localCursor3.close();
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
        localSQLiteDatabase.setTransactionSuccessful();
        localSQLiteDatabase.endTransaction();
      }
    }
    finally
    {
      localSQLiteDatabase.setTransactionSuccessful();
      localSQLiteDatabase.endTransaction();
    }
    return localDeviceInformation1;
    label301:
    localSQLiteDatabase.setTransactionSuccessful();
    localSQLiteDatabase.endTransaction();
    return null;
  }
  
  public List<DeviceInformation> getInitialDeviceListGeneric()
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    ArrayList localArrayList = new ArrayList();
    localSQLiteDatabase.beginTransaction();
    Cursor localCursor = localSQLiteDatabase.rawQuery("SELECT l.IP, r.homeID, r. mac, r.pluginID, l.port, d.* FROM cache_local AS l INNER JOIN cache_devices AS d ON d.udn =  l.udn INNER JOIN cache_remote AS r ON r.udn =  l.udn", null);
    if (localCursor.moveToFirst()) {
      while (!localCursor.isAfterLast())
      {
        localArrayList.add(getDeviceInformationFromLocalDevice(localCursor, true, true));
        localCursor.moveToNext();
      }
    }
    localCursor.close();
    localSQLiteDatabase.setTransactionSuccessful();
    localSQLiteDatabase.endTransaction();
    return localArrayList;
  }
  
  public ArrayList<ZigBeeDeviceInformation> getInitialDeviceListZigBee()
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    ArrayList localArrayList = new ArrayList();
    localSQLiteDatabase.beginTransaction();
    Cursor localCursor = localSQLiteDatabase.rawQuery("SELECT * FROM cache_zigbee", null);
    localCursor.moveToFirst();
    while (!localCursor.isAfterLast())
    {
      localArrayList.add(getDeviceInformationFromZigBeeDeviceTableCursor(localCursor));
      localCursor.moveToNext();
    }
    localCursor.close();
    localSQLiteDatabase.setTransactionSuccessful();
    localSQLiteDatabase.endTransaction();
    return localArrayList;
  }
  
  public List<DeviceInformation> getInitialZigbeeDevicesList(String paramString)
  {
    SDKLogUtils.debugLog("cacheManager", "Getting initial list of Zigbee Devices from DB for bridge UDN: " + paramString);
    ArrayList localArrayList = new ArrayList();
    if (TextUtils.isEmpty(paramString)) {
      SDKLogUtils.errorLog("cacheManager", "Bridge udn provided is empty.");
    }
    for (;;)
    {
      SDKLogUtils.debugLog("cacheManager", "Zigbee device count in DB: " + localArrayList.size() + "; Bridge UDN: " + paramString);
      return localArrayList;
      SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
      try
      {
        localSQLiteDatabase.beginTransaction();
        localCursor = localSQLiteDatabase.query("cache_devices", null, "bridgeUDN = ?", new String[] { paramString }, null, null, null);
        if (localCursor != null) {
          if (localCursor.moveToFirst()) {
            while (!localCursor.isAfterLast())
            {
              localArrayList.add(getDeviceInformationFromLocalDevice(localCursor, false, false));
              localCursor.moveToNext();
            }
          }
        }
      }
      catch (SQLException localSQLException)
      {
        Cursor localCursor;
        SDKLogUtils.errorLog("cacheManager", "SQLException while fetching Zigbee devices for bridge UDN: " + paramString);
        localSQLiteDatabase.endTransaction();
        continue;
        localCursor.close();
        localSQLiteDatabase.endTransaction();
      }
      finally
      {
        localSQLiteDatabase.endTransaction();
      }
    }
  }
  
  public JSONArray getLEDDeviceList()
    throws JSONException
  {
    JSONArray localJSONArray = new JSONArray();
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getReadableDatabase();
    HashMap localHashMap = new HashMap();
    localSQLiteDatabase.beginTransaction();
    Cursor localCursor = localSQLiteDatabase.rawQuery("SELECT * FROM cache_devices WHERE productType = \"" + "Lighting".toLowerCase() + "\"", null);
    localCursor.moveToFirst();
    if (!localCursor.isAfterLast())
    {
      String str1 = localCursor.getString(localCursor.getColumnIndex("groupID"));
      if (TextUtils.isEmpty(str1))
      {
        JSONObject localJSONObject1 = new JSONObject();
        localJSONObject1.put("friendlyName", localCursor.getString(localCursor.getColumnIndex("friendlyName")));
        localJSONObject1.put("udn", localCursor.getString(localCursor.getColumnIndex("udn")));
        localJSONObject1.put("bridgeudn", localCursor.getString(localCursor.getColumnIndex("bridgeUDN")));
        localJSONObject1.put("ProductName", localCursor.getString(localCursor.getColumnIndex("productName")));
        localJSONArray.put(localJSONObject1);
      }
      for (;;)
      {
        localCursor.moveToNext();
        break;
        if (!localHashMap.containsKey(str1))
        {
          String str2 = localCursor.getString(localCursor.getColumnIndex("groupName"));
          localHashMap.put(str1, str2);
          JSONObject localJSONObject2 = new JSONObject();
          localJSONObject2.put("friendlyName", str2);
          localJSONObject2.put("udn", str1);
          localJSONObject2.put("bridgeudn", localCursor.getString(localCursor.getColumnIndex("bridgeUDN")));
          localJSONObject2.put("ProductName", localCursor.getString(localCursor.getColumnIndex("productName")));
          localJSONArray.put(localJSONObject2);
        }
      }
    }
    localCursor.close();
    localSQLiteDatabase.setTransactionSuccessful();
    localSQLiteDatabase.endTransaction();
    return localJSONArray;
  }
  
  public String getLastDiscoveryTime(String paramString, boolean paramBoolean)
  {
    return getLastTime(paramString, paramBoolean, "cache_discovery_stat");
  }
  
  public String getLastDiscoveryTimeZigBee(String paramString, boolean paramBoolean)
  {
    return getLastTime(paramString, paramBoolean, "cache_discovery_stat_zigbee");
  }
  
  public String getLastHitTime(String paramString, boolean paramBoolean)
  {
    return getLastTime(paramString, paramBoolean, "cache_discovery_hit");
  }
  
  public String getLastHitTimeZigBee(String paramString, boolean paramBoolean)
  {
    return getLastTime(paramString, paramBoolean, "cache_discovery_hit_zigbee");
  }
  
  public Long getLatestEventTimeStamp()
  {
    localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    Long localLong = Long.valueOf(0L);
    try
    {
      localSQLiteDatabase.beginTransaction();
      Cursor localCursor = localSQLiteDatabase.rawQuery("SELECT statusTS FROM Event_History", null);
      localCursor.moveToFirst();
      SDKLogUtils.infoLog("cacheManager", "KEY_STATUS_TS is: " + localCursor.getLong(localCursor.getColumnIndex("statusTS")));
      localLong = Long.valueOf(localCursor.getLong(localCursor.getColumnIndex("statusTS")));
      localCursor.close();
    }
    catch (Exception localException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog("cacheManager", ":: getSenosrEventsFromDB :: Exeption during SQLite operations", localException);
        localSQLiteDatabase.setTransactionSuccessful();
        localSQLiteDatabase.endTransaction();
      }
    }
    finally
    {
      localSQLiteDatabase.setTransactionSuccessful();
      localSQLiteDatabase.endTransaction();
    }
    SDKLogUtils.infoLog("cacheManager", "timeStamp is: " + localLong);
    return localLong;
  }
  
  public Cursor getNestDeviceUDNList()
  {
    SDKLogUtils.debugLog("cacheManager", "Getting list of Nest Device UDNs from DB");
    Cursor localCursor = null;
    localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    try
    {
      localSQLiteDatabase.beginTransaction();
      localCursor = localSQLiteDatabase.query("cache_devices", new String[] { "udn" }, "udn like 'WEMO00%'", null, null, null, null);
      if ((localCursor != null) && (localCursor.getCount() > 0)) {
        localCursor.moveToNext();
      }
    }
    catch (SQLException localSQLException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog("cacheManager", "SQLException while fetching nest device UDNs");
        localSQLiteDatabase.endTransaction();
      }
    }
    finally
    {
      localSQLiteDatabase.endTransaction();
    }
    SDKLogUtils.debugLog("cacheManager", "Nest Device UDN count in DB: " + localCursor.getCount());
    return localCursor;
  }
  
  public JSONArray getPIRSensorList()
    throws JSONException
  {
    JSONArray localJSONArray = new JSONArray();
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getReadableDatabase();
    localSQLiteDatabase.beginTransaction();
    Cursor localCursor = localSQLiteDatabase.rawQuery("SELECT * FROM cache_devices WHERE productName = \"" + "PIR".toLowerCase() + "\"", null);
    localCursor.moveToFirst();
    while (!localCursor.isAfterLast())
    {
      JSONObject localJSONObject = new JSONObject();
      String str1 = localCursor.getString(localCursor.getColumnIndex("bridgeUDN"));
      String str2 = str1 + ":" + localCursor.getString(localCursor.getColumnIndex("udn"));
      localJSONObject.put("friendlyName", localCursor.getString(localCursor.getColumnIndex("friendlyName")));
      localJSONObject.put("udn", str2);
      localJSONObject.put("bridgeudn", str1);
      localJSONObject.put("ProductName", "PIR");
      localJSONArray.put(localJSONObject);
      localCursor.moveToNext();
    }
    localCursor.close();
    localSQLiteDatabase.setTransactionSuccessful();
    localSQLiteDatabase.endTransaction();
    return localJSONArray;
  }
  
  public HashMap<String, DeviceInformation> getPairedLEDsFromCacheDB()
  {
    HashMap localHashMap = new HashMap();
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    localSQLiteDatabase.beginTransaction();
    Cursor localCursor = localSQLiteDatabase.rawQuery("SELECT * FROM cache_devices WHERE bridgeUDN IS NOT NULL AND bridgeUDN<>''", null);
    localCursor.moveToFirst();
    while (!localCursor.isAfterLast())
    {
      DeviceInformation localDeviceInformation = getDeviceInformationFromDevicesCacheTableCursor(localCursor);
      localHashMap.put(localDeviceInformation.getUDN(), localDeviceInformation);
      localCursor.moveToNext();
    }
    localCursor.close();
    localSQLiteDatabase.setTransactionSuccessful();
    localSQLiteDatabase.endTransaction();
    return localHashMap;
  }
  
  /* Error */
  public JSONArray getSenosrEventsFromDB()
  {
    // Byte code:
    //   0: new 695	org/json/JSONArray
    //   3: dup
    //   4: invokespecial 818	org/json/JSONArray:<init>	()V
    //   7: astore_1
    //   8: aload_0
    //   9: getfield 28	com/belkin/wemo/cache/CacheManager:dbCreator	Lcom/belkin/wemo/cache/CacheManagerDBCreator;
    //   12: invokevirtual 362	com/belkin/wemo/cache/CacheManagerDBCreator:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   15: astore_2
    //   16: aload_2
    //   17: invokevirtual 365	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   20: aload_2
    //   21: ldc_w 1011
    //   24: aconst_null
    //   25: invokevirtual 395	android/database/sqlite/SQLiteDatabase:rawQuery	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   28: astore 5
    //   30: aload 5
    //   32: invokeinterface 399 1 0
    //   37: pop
    //   38: aload 5
    //   40: invokeinterface 828 1 0
    //   45: ifne +256 -> 301
    //   48: new 224	org/json/JSONObject
    //   51: dup
    //   52: invokespecial 829	org/json/JSONObject:<init>	()V
    //   55: astore 7
    //   57: aload 7
    //   59: ldc_w 714
    //   62: aload 5
    //   64: aload 5
    //   66: ldc_w 714
    //   69: invokeinterface 78 2 0
    //   74: invokeinterface 82 2 0
    //   79: invokevirtual 1014	org/json/JSONObject:putOpt	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   82: pop
    //   83: aload 7
    //   85: ldc_w 721
    //   88: aload 5
    //   90: aload 5
    //   92: ldc_w 721
    //   95: invokeinterface 78 2 0
    //   100: invokeinterface 82 2 0
    //   105: invokevirtual 1014	org/json/JSONObject:putOpt	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   108: pop
    //   109: aload 7
    //   111: ldc_w 723
    //   114: aload 5
    //   116: aload 5
    //   118: ldc_w 723
    //   121: invokeinterface 78 2 0
    //   126: invokeinterface 82 2 0
    //   131: invokevirtual 1014	org/json/JSONObject:putOpt	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   134: pop
    //   135: aload 7
    //   137: ldc -67
    //   139: aload 5
    //   141: aload 5
    //   143: ldc -67
    //   145: invokeinterface 78 2 0
    //   150: invokeinterface 82 2 0
    //   155: invokevirtual 1014	org/json/JSONObject:putOpt	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   158: pop
    //   159: aload 7
    //   161: ldc_w 727
    //   164: aload 5
    //   166: aload 5
    //   168: ldc_w 727
    //   171: invokeinterface 78 2 0
    //   176: invokeinterface 82 2 0
    //   181: invokevirtual 1014	org/json/JSONObject:putOpt	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   184: pop
    //   185: aload 7
    //   187: ldc -112
    //   189: aload 5
    //   191: aload 5
    //   193: ldc -112
    //   195: invokeinterface 78 2 0
    //   200: invokeinterface 82 2 0
    //   205: invokevirtual 1014	org/json/JSONObject:putOpt	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   208: pop
    //   209: aload 7
    //   211: ldc_w 735
    //   214: aload 5
    //   216: aload 5
    //   218: ldc_w 735
    //   221: invokeinterface 78 2 0
    //   226: invokeinterface 82 2 0
    //   231: invokevirtual 1014	org/json/JSONObject:putOpt	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   234: pop
    //   235: aload 7
    //   237: ldc_w 739
    //   240: aload 5
    //   242: aload 5
    //   244: ldc_w 739
    //   247: invokeinterface 78 2 0
    //   252: invokeinterface 82 2 0
    //   257: invokevirtual 1014	org/json/JSONObject:putOpt	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   260: pop
    //   261: aload_1
    //   262: aload 7
    //   264: invokevirtual 841	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   267: pop
    //   268: aload 5
    //   270: invokeinterface 844 1 0
    //   275: pop
    //   276: goto -238 -> 38
    //   279: astore 4
    //   281: ldc 24
    //   283: ldc_w 991
    //   286: aload 4
    //   288: invokestatic 238	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    //   291: aload_2
    //   292: invokevirtual 402	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   295: aload_2
    //   296: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   299: aload_1
    //   300: areturn
    //   301: aload 5
    //   303: invokeinterface 68 1 0
    //   308: aload_2
    //   309: invokevirtual 402	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   312: aload_2
    //   313: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   316: aload_1
    //   317: areturn
    //   318: astore_3
    //   319: aload_2
    //   320: invokevirtual 402	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   323: aload_2
    //   324: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   327: aload_3
    //   328: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	329	0	this	CacheManager
    //   7	310	1	localJSONArray	JSONArray
    //   15	309	2	localSQLiteDatabase	SQLiteDatabase
    //   318	10	3	localObject	Object
    //   279	8	4	localException	Exception
    //   28	274	5	localCursor	Cursor
    //   55	208	7	localJSONObject	JSONObject
    // Exception table:
    //   from	to	target	type
    //   16	38	279	java/lang/Exception
    //   38	276	279	java/lang/Exception
    //   301	308	279	java/lang/Exception
    //   16	38	318	finally
    //   38	276	318	finally
    //   281	291	318	finally
    //   301	308	318	finally
  }
  
  /* Error */
  public JSONArray getSensorDevices()
  {
    // Byte code:
    //   0: new 695	org/json/JSONArray
    //   3: dup
    //   4: invokespecial 818	org/json/JSONArray:<init>	()V
    //   7: astore_1
    //   8: aload_0
    //   9: getfield 28	com/belkin/wemo/cache/CacheManager:dbCreator	Lcom/belkin/wemo/cache/CacheManagerDBCreator;
    //   12: invokevirtual 362	com/belkin/wemo/cache/CacheManagerDBCreator:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   15: astore_2
    //   16: aload_2
    //   17: invokevirtual 365	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   20: aload_2
    //   21: new 260	java/lang/StringBuilder
    //   24: dup
    //   25: invokespecial 261	java/lang/StringBuilder:<init>	()V
    //   28: ldc_w 1017
    //   31: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   34: ldc_w 925
    //   37: invokevirtual 825	java/lang/String:toLowerCase	()Ljava/lang/String;
    //   40: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   43: ldc_w 387
    //   46: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   49: ldc_w 1019
    //   52: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   55: ldc_w 822
    //   58: invokevirtual 825	java/lang/String:toLowerCase	()Ljava/lang/String;
    //   61: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   64: ldc_w 387
    //   67: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   70: ldc_w 1019
    //   73: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   76: ldc_w 1004
    //   79: invokevirtual 825	java/lang/String:toLowerCase	()Ljava/lang/String;
    //   82: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   85: ldc_w 387
    //   88: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   91: ldc_w 1019
    //   94: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   97: ldc_w 1021
    //   100: invokestatic 1026	com/belkin/wemo/cache/utils/StringUtils:toLowerCamelCase	(Ljava/lang/String;)Ljava/lang/String;
    //   103: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   106: ldc_w 1028
    //   109: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   112: invokevirtual 273	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   115: aconst_null
    //   116: invokevirtual 395	android/database/sqlite/SQLiteDatabase:rawQuery	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   119: astore 5
    //   121: aload 5
    //   123: invokeinterface 399 1 0
    //   128: pop
    //   129: aload 5
    //   131: invokeinterface 828 1 0
    //   136: ifne +93 -> 229
    //   139: ldc 24
    //   141: new 260	java/lang/StringBuilder
    //   144: dup
    //   145: invokespecial 261	java/lang/StringBuilder:<init>	()V
    //   148: ldc_w 1030
    //   151: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   154: aload 5
    //   156: aload 5
    //   158: ldc 51
    //   160: invokeinterface 78 2 0
    //   165: invokeinterface 82 2 0
    //   170: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   173: invokevirtual 273	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   176: invokestatic 621	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   179: aload_1
    //   180: aload 5
    //   182: aload 5
    //   184: ldc 51
    //   186: invokeinterface 78 2 0
    //   191: invokeinterface 82 2 0
    //   196: invokevirtual 841	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   199: pop
    //   200: aload 5
    //   202: invokeinterface 844 1 0
    //   207: pop
    //   208: goto -79 -> 129
    //   211: astore 4
    //   213: ldc 24
    //   215: ldc_w 1032
    //   218: aload 4
    //   220: invokestatic 238	com/belkin/wemo/cache/utils/SDKLogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    //   223: aload_2
    //   224: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   227: aload_1
    //   228: areturn
    //   229: aload 5
    //   231: invokeinterface 68 1 0
    //   236: aload_2
    //   237: invokevirtual 402	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   240: aload_2
    //   241: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   244: aload_1
    //   245: areturn
    //   246: astore_3
    //   247: aload_2
    //   248: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   251: aload_3
    //   252: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	253	0	this	CacheManager
    //   7	238	1	localJSONArray	JSONArray
    //   15	233	2	localSQLiteDatabase	SQLiteDatabase
    //   246	6	3	localObject	Object
    //   211	8	4	localSQLException	SQLException
    //   119	111	5	localCursor	Cursor
    // Exception table:
    //   from	to	target	type
    //   16	129	211	android/database/SQLException
    //   129	208	211	android/database/SQLException
    //   229	240	211	android/database/SQLException
    //   16	129	246	finally
    //   129	208	246	finally
    //   213	223	246	finally
    //   229	240	246	finally
  }
  
  public int getSubDevicesCount(String paramString)
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getReadableDatabase();
    localSQLiteDatabase.beginTransaction();
    if (paramString.equals("LED")) {}
    for (String str = "SELECT * FROM cache_devices WHERE productType = \"" + "Lighting".toLowerCase() + "\"";; str = "SELECT * FROM cache_devices WHERE productName IN ( \"" + "Fob".toLowerCase() + "\"" + ",\"" + "DWSensor".toLowerCase() + "\"" + ",\"" + "PIR".toLowerCase() + "\"" + ",\"" + StringUtils.toLowerCamelCase("AlarmSensor") + "\" )")
    {
      Cursor localCursor = localSQLiteDatabase.rawQuery(str, null);
      int i = localCursor.getCount();
      localCursor.close();
      localSQLiteDatabase.setTransactionSuccessful();
      localSQLiteDatabase.endTransaction();
      return i;
      if (!paramString.equals("Homesense")) {
        break;
      }
    }
    return 0;
  }
  
  /* Error */
  public int getTotalTries(String paramString, boolean paramBoolean1, boolean paramBoolean2)
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore 4
    //   3: aload_0
    //   4: getfield 28	com/belkin/wemo/cache/CacheManager:dbCreator	Lcom/belkin/wemo/cache/CacheManagerDBCreator;
    //   7: invokevirtual 362	com/belkin/wemo/cache/CacheManagerDBCreator:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   10: astore 5
    //   12: aload 5
    //   14: invokevirtual 365	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   17: iconst_0
    //   18: istore 4
    //   20: iload_3
    //   21: ifeq +109 -> 130
    //   24: new 260	java/lang/StringBuilder
    //   27: dup
    //   28: invokespecial 261	java/lang/StringBuilder:<init>	()V
    //   31: ldc_w 1042
    //   34: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   37: aload_1
    //   38: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   41: ldc_w 387
    //   44: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   47: invokevirtual 273	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   50: astore 8
    //   52: iconst_0
    //   53: istore 4
    //   55: iload_2
    //   56: ifeq +105 -> 161
    //   59: new 260	java/lang/StringBuilder
    //   62: dup
    //   63: invokespecial 261	java/lang/StringBuilder:<init>	()V
    //   66: aload 8
    //   68: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   71: ldc_w 389
    //   74: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   77: invokevirtual 273	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   80: astore 9
    //   82: aload 5
    //   84: aload 9
    //   86: aconst_null
    //   87: invokevirtual 395	android/database/sqlite/SQLiteDatabase:rawQuery	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   90: astore 10
    //   92: aload 10
    //   94: invokeinterface 399 1 0
    //   99: pop
    //   100: aload 10
    //   102: iconst_0
    //   103: invokeinterface 94 2 0
    //   108: istore 4
    //   110: aload 10
    //   112: invokeinterface 68 1 0
    //   117: aload 5
    //   119: invokevirtual 402	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   122: aload 5
    //   124: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   127: iload 4
    //   129: ireturn
    //   130: new 260	java/lang/StringBuilder
    //   133: dup
    //   134: invokespecial 261	java/lang/StringBuilder:<init>	()V
    //   137: ldc_w 1044
    //   140: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   143: aload_1
    //   144: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   147: ldc_w 387
    //   150: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   153: invokevirtual 273	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   156: astore 8
    //   158: goto -106 -> 52
    //   161: new 260	java/lang/StringBuilder
    //   164: dup
    //   165: invokespecial 261	java/lang/StringBuilder:<init>	()V
    //   168: aload 8
    //   170: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   173: ldc_w 407
    //   176: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   179: invokevirtual 273	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   182: astore 12
    //   184: aload 12
    //   186: astore 9
    //   188: goto -106 -> 82
    //   191: astore 7
    //   193: aload 7
    //   195: invokevirtual 410	java/lang/Exception:printStackTrace	()V
    //   198: aload 5
    //   200: invokevirtual 402	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   203: aload 5
    //   205: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   208: iload 4
    //   210: ireturn
    //   211: astore 6
    //   213: aload 5
    //   215: invokevirtual 402	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   218: aload 5
    //   220: invokevirtual 405	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   223: aload 6
    //   225: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	226	0	this	CacheManager
    //   0	226	1	paramString	String
    //   0	226	2	paramBoolean1	boolean
    //   0	226	3	paramBoolean2	boolean
    //   1	208	4	i	int
    //   10	209	5	localSQLiteDatabase	SQLiteDatabase
    //   211	13	6	localObject1	Object
    //   191	3	7	localException	Exception
    //   50	119	8	str1	String
    //   80	107	9	localObject2	Object
    //   90	21	10	localCursor	Cursor
    //   182	3	12	str2	String
    // Exception table:
    //   from	to	target	type
    //   12	17	191	java/lang/Exception
    //   24	52	191	java/lang/Exception
    //   59	82	191	java/lang/Exception
    //   82	117	191	java/lang/Exception
    //   130	158	191	java/lang/Exception
    //   161	184	191	java/lang/Exception
    //   12	17	211	finally
    //   24	52	211	finally
    //   59	82	211	finally
    //   82	117	211	finally
    //   130	158	211	finally
    //   161	184	211	finally
    //   193	198	211	finally
  }
  
  public ZigBeeDeviceInformation getZigBeeDeviceInfoFromDBByUniqueID(String paramString)
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    localSQLiteDatabase.beginTransaction();
    Cursor localCursor = localSQLiteDatabase.rawQuery("SELECT  * FROM cache_zigbee WHERE uniqueID = \"" + paramString + "\"", null);
    ZigBeeDeviceInformation localZigBeeDeviceInformation = null;
    if (localCursor != null)
    {
      localCursor.moveToFirst();
      localZigBeeDeviceInformation = getDeviceInformationFromZigBeeDeviceTableCursor(localCursor);
      localCursor.close();
    }
    localSQLiteDatabase.setTransactionSuccessful();
    localSQLiteDatabase.endTransaction();
    return localZigBeeDeviceInformation;
  }
  
  public void hideDevice(int paramInt, boolean paramBoolean)
  {
    if (paramBoolean)
    {
      DeviceInformation localDeviceInformation = getDeviceInfoFromDBByID(paramInt, false, false, true);
      if (localDeviceInformation != null) {
        deleteDeviceFromDB(localDeviceInformation, true, true, true);
      }
    }
  }
  
  public boolean isCandidateForMSearch(String paramString1, String paramString2, int paramInt)
  {
    boolean bool = true;
    localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    try
    {
      localSQLiteDatabase.beginTransaction();
      Cursor localCursor1 = localSQLiteDatabase.query("cache_local", new String[] { "IP", "port" }, "udn = ?", new String[] { paramString1 }, null, null, null);
      if ((localCursor1 != null) && (localCursor1.moveToFirst()))
      {
        String str1 = localCursor1.getString(localCursor1.getColumnIndex("IP"));
        int i = localCursor1.getInt(localCursor1.getColumnIndex("port"));
        SDKLogUtils.debugLog("cacheManager", "Comparing device IP and PORT. UDN" + paramString1 + "; IP in DB: " + str1 + "; Port in DB: " + i + "; New device IP: " + paramString2 + "; New device Port: " + paramInt);
        if ((str1.equals(paramString2)) && (i == paramInt))
        {
          Cursor localCursor2 = localSQLiteDatabase.query("cache_devices", new String[] { "inactive", "isDiscovered", "fwstatus" }, "udn = ?", new String[] { paramString1 }, null, null, null);
          if ((localCursor2 != null) && (localCursor2.moveToFirst()))
          {
            int j = localCursor2.getInt(localCursor2.getColumnIndex("inactive"));
            String str2 = localCursor2.getString(localCursor2.getColumnIndex("isDiscovered"));
            SDKLogUtils.debugLog("cacheManager", "Verifying if device is ONLINE. UDN" + paramString1 + "; inActive: " + j + "; isDiscovered: " + str2);
            if ((j == 0) && (str2.equals("true"))) {
              bool = false;
            }
            localCursor2.close();
          }
        }
      }
      localCursor1.close();
    }
    catch (SQLException localSQLException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog("cacheManager", "SQLException while checking if device is candidate for MSearch. UDN: " + paramString1);
        localSQLiteDatabase.endTransaction();
      }
    }
    finally
    {
      localSQLiteDatabase.endTransaction();
    }
    SDKLogUtils.debugLog("cacheManager", "Is device a candidate for MSEARCH:  " + bool);
    return bool;
  }
  
  public boolean isDeviceInDB(String paramString)
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    try
    {
      localSQLiteDatabase.beginTransaction();
      Cursor localCursor = localSQLiteDatabase.rawQuery("SELECT  * FROM cache_devices WHERE udn = \"" + paramString + "\"", null);
      if (localCursor != null)
      {
        if (localCursor.moveToFirst())
        {
          localCursor.close();
          return true;
        }
        localCursor.close();
        return false;
      }
      return false;
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
  
  public boolean isDisableStat()
  {
    return this.disableStat;
  }
  
  public boolean saveDeviceListToDB(ArrayList<DeviceInformation> paramArrayList, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    localSQLiteDatabase.beginTransaction();
    try
    {
      Iterator localIterator = paramArrayList.iterator();
      for (;;)
      {
        if (!localIterator.hasNext()) {
          break label258;
        }
        DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
        if (TextUtils.isEmpty(localDeviceInformation.getUDN())) {
          break;
        }
        if (paramBoolean1)
        {
          ContentValues localContentValues1 = new ContentValues();
          localContentValues1.put("udn", localDeviceInformation.getUDN());
          localContentValues1.put("IP", localDeviceInformation.getIP());
          localContentValues1.put("port", Integer.valueOf(localDeviceInformation.getPort()));
          localSQLiteDatabase.insertOrThrow("cache_local", null, localContentValues1);
        }
        if (paramBoolean2)
        {
          ContentValues localContentValues2 = new ContentValues();
          localContentValues2.put("udn", localDeviceInformation.getUDN());
          localContentValues2.put("homeID", localDeviceInformation.getHomeID());
          localContentValues2.put("mac", localDeviceInformation.getMAC());
          localContentValues2.put("pluginID", localDeviceInformation.getPluginID());
          localSQLiteDatabase.insertOrThrow("cache_remote", null, localContentValues2);
        }
        if (paramBoolean3) {
          localSQLiteDatabase.insertOrThrow("cache_devices", null, setValuesForCacheDevicesTable(localDeviceInformation, new ContentValues()));
        }
      }
    }
    catch (SQLException localSQLException)
    {
      for (;;)
      {
        localSQLException.printStackTrace();
        return false;
        SDKLogUtils.errorLog("cacheManager", "saveDeviceListToDB(): Empty/Null UDN found so device not added to DB.");
      }
    }
    finally
    {
      localSQLiteDatabase.endTransaction();
    }
    label258:
    localSQLiteDatabase.setTransactionSuccessful();
    localSQLiteDatabase.endTransaction();
    return true;
  }
  
  public void setDeviceHTML(String paramString1, String paramString2)
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    try
    {
      localSQLiteDatabase.beginTransaction();
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("html", paramString2);
      localSQLiteDatabase.update("cache_devices", localContentValues, "udn = ?", new String[] { paramString1 });
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      return;
    }
    finally
    {
      localSQLiteDatabase.setTransactionSuccessful();
      localSQLiteDatabase.endTransaction();
    }
  }
  
  public void setDeviceIcon(String paramString1, String paramString2)
  {
    SDKLogUtils.debugLog("cacheManager", "Storing device icon in DB. UDN: " + paramString1 + "; ICON: " + paramString2);
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    try
    {
      localSQLiteDatabase.beginTransaction();
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("icon", paramString2);
      localSQLiteDatabase.update("cache_devices", localContentValues, "udn = ?", new String[] { paramString1 });
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      return;
    }
    finally
    {
      localSQLiteDatabase.setTransactionSuccessful();
      localSQLiteDatabase.endTransaction();
    }
  }
  
  public void setDisableStat(boolean paramBoolean)
  {
    this.disableStat = paramBoolean;
  }
  
  public void setLastTimestamp(String paramString)
  {
    SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
    try
    {
      long l = System.currentTimeMillis() / 1000L;
      localSQLiteDatabase.beginTransaction();
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("lastTS", String.valueOf(l));
      localSQLiteDatabase.update("cache_devices", localContentValues, "udn = ?", new String[] { paramString });
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      return;
    }
    finally
    {
      localSQLiteDatabase.setTransactionSuccessful();
      localSQLiteDatabase.endTransaction();
    }
  }
  
  public int updateDB(String paramString1, String paramString2, int paramInt)
  {
    if (!TextUtils.isEmpty(paramString1))
    {
      SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
      localSQLiteDatabase.beginTransaction();
      ContentValues localContentValues = setValuesForLocalCacheTable(paramString1, paramString2, paramInt, new ContentValues());
      String[] arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(paramString1);
      int i = localSQLiteDatabase.update("cache_local", localContentValues, "udn = ?", arrayOfString);
      localSQLiteDatabase.setTransactionSuccessful();
      localSQLiteDatabase.endTransaction();
      SDKLogUtils.infoLog("cacheManager", "update DB rows affected:" + i);
      return i;
    }
    SDKLogUtils.errorLog("cacheManager", "updateDB() with only udn: Empty/Null UDN found so device not added to DB.");
    return 0;
  }
  
  public void updateDB(DeviceInformation paramDeviceInformation, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    String str = paramDeviceInformation.getUDN();
    if (!TextUtils.isEmpty(str)) {
      try
      {
        SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
        localSQLiteDatabase.beginTransaction();
        int i = 0;
        if (paramBoolean1)
        {
          ContentValues localContentValues1 = setValuesForLocalCacheTable(paramDeviceInformation, new ContentValues());
          String[] arrayOfString1 = new String[1];
          arrayOfString1[0] = String.valueOf(paramDeviceInformation.getUDN());
          i = localSQLiteDatabase.update("cache_local", localContentValues1, "udn = ?", arrayOfString1);
        }
        if (paramBoolean2)
        {
          ContentValues localContentValues2 = setValuesForRemoteCacheTable(paramDeviceInformation, new ContentValues());
          String[] arrayOfString2 = new String[1];
          arrayOfString2[0] = String.valueOf(paramDeviceInformation.getUDN());
          i = localSQLiteDatabase.update("cache_remote", localContentValues2, "udn = ?", arrayOfString2);
        }
        if (paramBoolean3)
        {
          ContentValues localContentValues3 = setValuesForCacheDevicesTable(paramDeviceInformation, new ContentValues());
          String[] arrayOfString3 = new String[1];
          arrayOfString3[0] = String.valueOf(paramDeviceInformation.getUDN());
          i = localSQLiteDatabase.update("cache_devices", localContentValues3, "udn = ?", arrayOfString3);
        }
        localSQLiteDatabase.setTransactionSuccessful();
        localSQLiteDatabase.endTransaction();
        SDKLogUtils.infoLog("cacheManager", "update DB rows affected:" + i + "; UDN: " + str);
        return;
      }
      catch (Exception localException)
      {
        SDKLogUtils.errorLog("cacheManager", "Exception while updating the DB: ", localException);
        return;
      }
    }
    SDKLogUtils.errorLog("cacheManager", "updateDB(): Empty/Null UDN found so device not added to DB.");
  }
  
  public void updateDeviceFromDB(DeviceInformation paramDeviceInformation, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    if (!TextUtils.isEmpty(paramDeviceInformation.getUDN()))
    {
      SQLiteDatabase localSQLiteDatabase = this.dbCreator.getWritableDatabase();
      localSQLiteDatabase.beginTransaction();
      ContentValues localContentValues = setValuesForCacheDevicesTable(paramDeviceInformation, new ContentValues());
      String[] arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(paramDeviceInformation.getID());
      localSQLiteDatabase.update("cache_devices", localContentValues, "id = ?", arrayOfString);
      localSQLiteDatabase.setTransactionSuccessful();
      localSQLiteDatabase.endTransaction();
      return;
    }
    SDKLogUtils.errorLog("cacheManager", "updateDeviceFromDB(): Empty/Null UDN found so device not added to DB.");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/CacheManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */