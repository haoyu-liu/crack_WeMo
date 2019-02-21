package com.belkin.wemo.cache.data;

import android.content.Context;
import android.os.AsyncTask;
import android.os.Build.VERSION;
import android.text.TextUtils;
import com.belkin.wemo.cache.cloud.CloudRequestGetIcon;
import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.DeviceListManagerCallbacksActivity;
import com.belkin.wemo.cache.devicelist.IconDownloader;
import com.belkin.wemo.cache.devicelist.WeMoDevice;
import com.belkin.wemo.cache.utils.Constants;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;

public class DevicesArray
{
  private static final String TAG = "DevicesArray";
  private static DevicesArray mInstance = null;
  public static HashMap<String, String> productNameMapping;
  public static HashMap<String, String> productTypeMapping;
  private HashMap<String, Boolean> deviceDiscovered = new HashMap();
  private Map<String, DeviceInformation> deviceInformationList = new ConcurrentHashMap();
  private DeviceListManagerCallbacksActivity mActivity = null;
  private Context mContext = null;
  
  private DevicesArray(Context paramContext)
  {
    this.mContext = paramContext;
  }
  
  private boolean deleteDevice(String paramString)
  {
    SDKLogUtils.debugLog("DevicesArray", "Deleting device from DevicesArray. UDN: " + paramString);
    return (DeviceInformation)this.deviceInformationList.remove(paramString) != null;
  }
  
  public static DevicesArray getInstance()
  {
    try
    {
      DevicesArray localDevicesArray = mInstance;
      return localDevicesArray;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public static DevicesArray getInstance(Context paramContext)
  {
    try
    {
      if (mInstance == null) {
        mInstance = new DevicesArray(paramContext);
      }
      DevicesArray localDevicesArray = mInstance;
      return localDevicesArray;
    }
    finally {}
  }
  
  public static HashMap<String, String> loadProductNameMapping()
  {
    if (productNameMapping == null) {
      productNameMapping = new HashMap();
    }
    productNameMapping.put("AirPurifier", "AirPurifier");
    productNameMapping.put("BabyMonitor", "BabyMonitor");
    productNameMapping.put("Bridge", "Bridge");
    productNameMapping.put("Classic A60 RGBW", "FlexBulb");
    productNameMapping.put("Classic A60 TW", "ColorBulb");
    productNameMapping.put("CoffeeMaker", "CoffeeMaker");
    productNameMapping.put("Connected A-19 60W", "Lighting");
    productNameMapping.put("crockpot", "crockpot");
    productNameMapping.put("Flex RGBW", "FlexBulb");
    productNameMapping.put("Gardenspot RGB", "ColorBulb");
    productNameMapping.put("HeaterA", "Heater");
    productNameMapping.put("HeaterB", "Heater");
    productNameMapping.put("Humidifier", "Humidifier");
    productNameMapping.put("Insight", "Insight");
    productNameMapping.put("iQBR30", "Lighting");
    productNameMapping.put("LCT001", "Lighting");
    productNameMapping.put("LGDWL", "Lighting");
    productNameMapping.put("LIGHTIFY A19 Tunable White", "TemperatureBulb");
    productNameMapping.put("LIGHTIFY Flex RGBW", "FlexBulb");
    productNameMapping.put("LIGHTIFY Gardenspot RGB", "ColorBulb");
    productNameMapping.put("Lightswitch", "Lightswitch");
    productNameMapping.put("Dimmer", "Dimmer");
    productNameMapping.put("LWB004", "Lighting");
    productNameMapping.put("MZ100", "Lighting");
    productNameMapping.put("Maker", "Maker");
    productNameMapping.put("NetCam", "NetCam");
    productNameMapping.put("NetCamHDv1", "NetCamHDv1");
    productNameMapping.put("NetCamHDv2", "NetCamHDv2");
    productNameMapping.put("netcamsensor", "NetCamSensor");
    productNameMapping.put("Sensor", "Sensor");
    productNameMapping.put("smart", "smart");
    productNameMapping.put("Socket", "Socket");
    productNameMapping.put("Surface Light TW", "Lighting");
    productNameMapping.put("ZLL Light", "Lighting");
    productNameMapping.put("F7C038", "DWSensor");
    productNameMapping.put("F7C039", "Fob");
    productNameMapping.put("F7C040", "AlarmSensor");
    productNameMapping.put("F7C041", "PIR");
    productNameMapping.put("Water", "Water");
    productNameMapping.put("Connected A-19 60W Equivalent", "Lighting");
    return productNameMapping;
  }
  
  public static HashMap<String, String> loadProductTypeMapping()
  {
    if (productTypeMapping == null) {
      productTypeMapping = new HashMap();
    }
    productTypeMapping.put("AirPurifier", "AirPurifier");
    productTypeMapping.put("BabyMonitor", "BabyMonitor");
    productTypeMapping.put("Bridge", "Bridge");
    productTypeMapping.put("Classic A60 RGBW", "Lighting");
    productTypeMapping.put("Classic A60 TW", "Lighting");
    productTypeMapping.put("CoffeeMaker", "CoffeeMaker");
    productTypeMapping.put("Connected A-19 60W", "Lighting");
    productTypeMapping.put("crockpot", "crockpot");
    productTypeMapping.put("Flex RGBW", "Lighting");
    productTypeMapping.put("Gardenspot RGB", "Lighting");
    productTypeMapping.put("HeaterA", "Heater");
    productTypeMapping.put("HeaterB", "Heater");
    productTypeMapping.put("Humidifier", "Humidifier");
    productTypeMapping.put("Insight", "Insight");
    productTypeMapping.put("iQBR30", "Lighting");
    productTypeMapping.put("LCT001", "Lighting");
    productTypeMapping.put("LGDWL", "Lighting");
    productTypeMapping.put("LIGHTIFY A19 Tunable White", "Lighting");
    productTypeMapping.put("LIGHTIFY Flex RGBW", "Lighting");
    productTypeMapping.put("LIGHTIFY Gardenspot RGB", "Lighting");
    productTypeMapping.put("Lightswitch", "Lightswitch");
    productTypeMapping.put("Dimmer", "Dimmer");
    productTypeMapping.put("LWB004", "Lighting");
    productTypeMapping.put("MZ100", "Lighting");
    productTypeMapping.put("Maker", "Maker");
    productTypeMapping.put("NetCam", "NetCam");
    productTypeMapping.put("NetCamHDv1", "NetCam");
    productTypeMapping.put("NetCamHDv2", "NetCam");
    productTypeMapping.put("netcamsensor", "NetCam");
    productTypeMapping.put("Sensor", "Sensor");
    productTypeMapping.put("smart", "smart");
    productTypeMapping.put("Socket", "Socket");
    productTypeMapping.put("Surface Light TW", "Lighting");
    productTypeMapping.put("ZLL Light", "Lighting");
    productTypeMapping.put("F7C038", "Sensor");
    productTypeMapping.put("F7C039", "Sensor");
    productTypeMapping.put("F7C040", "Sensor");
    productTypeMapping.put("F7C041", "Sensor");
    productTypeMapping.put("Water", "Water");
    productTypeMapping.put("Connected A-19 60W Equivalent", "Lighting");
    return productTypeMapping;
  }
  
  private void setDeviceInfoParameters(DeviceInformation paramDeviceInformation, WeMoDevice paramWeMoDevice)
  {
    if (Constants.IS_DEMOAPP)
    {
      paramDeviceInformation.setDiscoveryState(paramWeMoDevice.getDiscoveryState());
      paramDeviceInformation.setStartDiscoveryTime(paramWeMoDevice.getStartDiscoveryTime());
      paramDeviceInformation.setEndDiscoveryTime(paramWeMoDevice.getEndDiscoveryTime());
      paramDeviceInformation.setCheckingStatus(paramWeMoDevice.getCheckingStatus());
      paramDeviceInformation.setTimestamp(paramWeMoDevice.getTimestamp());
      paramDeviceInformation.setLastTimestamp(paramWeMoDevice.getLastTimestamp());
    }
    paramDeviceInformation.setInActive(paramWeMoDevice.getInActive());
    if (paramWeMoDevice.getInActive() == 0) {
      paramDeviceInformation.setIsDiscovered(true);
    }
    for (;;)
    {
      paramDeviceInformation.setMAC(paramWeMoDevice.getMac());
      paramDeviceInformation.setPluginId(paramWeMoDevice.getPluginID());
      if (((paramWeMoDevice.getLogoURL().startsWith("data")) || ((paramWeMoDevice.getLogoURL().isEmpty()) && (NetworkMode.isLocal()))) && (!paramDeviceInformation.getIP().isEmpty()) && (paramDeviceInformation.getPort() > 0))
      {
        paramWeMoDevice.setLogoURL(paramDeviceInformation.getIP() + ":" + paramDeviceInformation.getPort() + "/icon.jpg");
        paramDeviceInformation.setIconURL(paramWeMoDevice.getLogoURL());
      }
      if ((paramDeviceInformation != null) && (paramDeviceInformation.getIcon() != null) && (paramWeMoDevice != null) && (paramWeMoDevice.getLogo() != null)) {
        if ((!paramDeviceInformation.getIcon().equals(paramWeMoDevice.getLogo())) && (!paramWeMoDevice.getLogo().isEmpty())) {
          paramDeviceInformation.setIcon(paramWeMoDevice.getLogo());
        }
      }
      try
      {
        paramDeviceInformation.setState(Integer.parseInt(paramWeMoDevice.getState()));
        addOrUpdateDeviceInformation(paramDeviceInformation);
        return;
        paramDeviceInformation.setIsDiscovered(false);
      }
      catch (Exception localException)
      {
        for (;;) {}
      }
    }
  }
  
  public void addOrUpdateDeviceInformation(DeviceInformation paramDeviceInformation)
  {
    try
    {
      updateDeviceInformationList(paramDeviceInformation);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void clearAll()
  {
    try
    {
      SDKLogUtils.debugLog("DevicesArray", "Clearing all DeviceInformation objects and their respective discoveries from DevicesArray.");
      this.deviceInformationList.clear();
      clearDeviceDiscoveries();
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void clearAllDiscoveryTime()
  {
    try
    {
      Iterator localIterator = this.deviceInformationList.values().iterator();
      while (localIterator.hasNext())
      {
        DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
        localDeviceInformation.setStartDiscoveryTime(0L);
        this.deviceInformationList.put(localDeviceInformation.getUDN(), localDeviceInformation);
      }
    }
    finally {}
  }
  
  public void clearDeviceDiscoveries()
  {
    try
    {
      if (this.deviceDiscovered != null) {
        this.deviceDiscovered.clear();
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public boolean deleteDeviceInformation(String paramString)
  {
    try
    {
      boolean bool = deleteDevice(paramString);
      return bool;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public List<String> deleteDevicesInGroup(String paramString)
  {
    ArrayList localArrayList;
    try
    {
      SDKLogUtils.debugLog("DevicesArray", "Deleting devices, from Device List, with GroupID: " + paramString);
      localArrayList = new ArrayList();
      Iterator localIterator = this.deviceInformationList.entrySet().iterator();
      while (localIterator.hasNext())
      {
        DeviceInformation localDeviceInformation = (DeviceInformation)((Map.Entry)localIterator.next()).getValue();
        if (localDeviceInformation.getGroupID().equals(paramString))
        {
          localIterator.remove();
          localArrayList.add(localDeviceInformation.getMAC());
          SDKLogUtils.debugLog("DevicesArray", "Device containing groupID has been removed. UDN: " + localDeviceInformation.getUDN() + ". Total devices removed yet: " + localArrayList.size());
        }
      }
    }
    finally {}
    return localArrayList;
  }
  
  public boolean deleteWeMoDevice(String paramString)
  {
    try
    {
      boolean bool = deleteDevice(paramString);
      return bool;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public ArrayList<DeviceInformation> getActiveDeviceInfoList()
  {
    ArrayList localArrayList = new ArrayList();
    if (this.deviceInformationList == null) {
      this.deviceInformationList = new HashMap();
    }
    Iterator localIterator = this.deviceInformationList.values().iterator();
    while (localIterator.hasNext())
    {
      DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
      if ((localDeviceInformation != null) && (localDeviceInformation.getUDN() != null) && (localDeviceInformation.getIsDiscovered()) && (localDeviceInformation.getInActive() == 0)) {
        localArrayList.add(localDeviceInformation);
      }
    }
    return localArrayList;
  }
  
  public boolean getDeviceDiscovered(String paramString)
  {
    try
    {
      HashMap localHashMap = this.deviceDiscovered;
      boolean bool1 = false;
      if (localHashMap != null)
      {
        Boolean localBoolean = (Boolean)this.deviceDiscovered.get(paramString);
        bool1 = false;
        if (localBoolean != null)
        {
          boolean bool2 = localBoolean.booleanValue();
          bool1 = bool2;
        }
      }
      return bool1;
    }
    finally {}
  }
  
  public DeviceInformation getDeviceInformation(String paramString)
  {
    try
    {
      DeviceInformation localDeviceInformation = (DeviceInformation)this.deviceInformationList.get(paramString);
      return localDeviceInformation;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public ArrayList<DeviceInformation> getDeviceInformationArrayList()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.deviceInformationList.values().iterator();
    while (localIterator.hasNext()) {
      localArrayList.add((DeviceInformation)localIterator.next());
    }
    return localArrayList;
  }
  
  public Map<String, DeviceInformation> getDeviceInformationList()
  {
    try
    {
      Map localMap = this.deviceInformationList;
      return localMap;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public List<String> getDevicesInGroup(String paramString)
  {
    SDKLogUtils.debugLog("DevicesArray", "Get devices, from Device List, with GroupID: " + paramString);
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.deviceInformationList.entrySet().iterator();
    while (localIterator.hasNext())
    {
      DeviceInformation localDeviceInformation = (DeviceInformation)((Map.Entry)localIterator.next()).getValue();
      if (localDeviceInformation.getGroupID().equals(paramString))
      {
        localArrayList.add(localDeviceInformation.getMAC());
        SDKLogUtils.debugLog("DevicesArray", "Device containing groupID has been added. UDN: " + localDeviceInformation.getUDN() + ". Total devices added yet: " + localArrayList.size());
      }
    }
    return localArrayList;
  }
  
  public HashMap<String, Boolean> getDiscoveredDeviceList()
  {
    return this.deviceDiscovered;
  }
  
  public boolean removeDiscoveredDevice(String paramString)
  {
    try
    {
      HashMap localHashMap = this.deviceDiscovered;
      boolean bool1 = false;
      if (localHashMap != null)
      {
        Boolean localBoolean = (Boolean)this.deviceDiscovered.remove(paramString);
        bool1 = false;
        if (localBoolean != null)
        {
          boolean bool2 = localBoolean.booleanValue();
          bool1 = bool2;
        }
      }
      return bool1;
    }
    finally {}
  }
  
  public void setCallbackListener(DeviceListManagerCallbacksActivity paramDeviceListManagerCallbacksActivity)
  {
    this.mActivity = paramDeviceListManagerCallbacksActivity;
  }
  
  public void setDeviceDiscovered(String paramString, boolean paramBoolean)
  {
    if (this.deviceDiscovered == null) {
      this.deviceDiscovered = new HashMap();
    }
    if ((paramString != null) && (!paramString.isEmpty()))
    {
      SDKLogUtils.infoLog("DevicesArray", "Adding DEVICE DISCOVERED: " + paramString);
      this.deviceDiscovered.put(paramString, Boolean.valueOf(paramBoolean));
    }
  }
  
  public void setDeviceHTML(String paramString1, String paramString2)
  {
    try
    {
      DeviceInformation localDeviceInformation = (DeviceInformation)this.deviceInformationList.get(paramString1);
      localDeviceInformation.setHtml(paramString2);
      this.deviceInformationList.put(paramString1, localDeviceInformation);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void setDeviceInactive(String paramString)
  {
    DeviceInformation localDeviceInformation = getDeviceInformation(paramString);
    localDeviceInformation.setInActive(1);
    localDeviceInformation.setIsDiscovered(false);
    addOrUpdateDeviceInformation(localDeviceInformation);
  }
  
  public void updateDeviceCache(DeviceInformation paramDeviceInformation, boolean paramBoolean)
  {
    if (paramDeviceInformation == null) {}
    for (;;)
    {
      return;
      try
      {
        if (TextUtils.isEmpty(paramDeviceInformation.getUDN())) {
          SDKLogUtils.errorLog("DevicesArray", "updateDeviceCache() - DeviceInformation: Empty/Null UDN found.");
        }
      }
      finally {}
    }
    if (Constants.IS_DEMOAPP)
    {
      paramDeviceInformation.setDiscoveryState(paramDeviceInformation.getDiscoveryState());
      paramDeviceInformation.setStartDiscoveryTime(paramDeviceInformation.getStartDiscoveryTime());
      paramDeviceInformation.setEndDiscoveryTime(paramDeviceInformation.getEndDiscoveryTime());
      paramDeviceInformation.setCheckingStatus(paramDeviceInformation.getCheckingStatus());
      paramDeviceInformation.setTimestamp(paramDeviceInformation.getTimestamp());
      paramDeviceInformation.setLastTimestamp(paramDeviceInformation.getLastTimestamp());
    }
    if (paramDeviceInformation.getInActive() == 0) {
      paramDeviceInformation.setIsDiscovered(true);
    }
    for (;;)
    {
      if (((paramBoolean) && (paramDeviceInformation.getIconURL().startsWith("data"))) || ((paramDeviceInformation.getIconURL().isEmpty()) && (NetworkMode.isLocal()) && (!paramDeviceInformation.getIP().isEmpty()) && (paramDeviceInformation.getPort() > 0))) {
        paramDeviceInformation.setIconURL(paramDeviceInformation.getIP() + ":" + paramDeviceInformation.getPort() + "/icon.jpg");
      }
      if ((paramBoolean) && (!NetworkMode.isLocal())) {
        updateIconRemote(paramDeviceInformation);
      }
      addOrUpdateDeviceInformation(paramDeviceInformation);
      break;
      paramDeviceInformation.setIsDiscovered(false);
    }
  }
  
  public void updateDeviceInformationList(DeviceInformation paramDeviceInformation)
  {
    String str = paramDeviceInformation.getUDN();
    if (!TextUtils.isEmpty(str))
    {
      SDKLogUtils.debugLog("DevicesArray", "Updating DeviceInformation object in DevicesArray. UDN: " + str);
      this.deviceInformationList.put(paramDeviceInformation.getUDN(), paramDeviceInformation);
      return;
    }
    SDKLogUtils.errorLog("DevicesArray", "updateDeviceInformationList(): Empty/Null UDN found.");
  }
  
  public void updateFriendlyName(String paramString1, String paramString2)
  {
    try
    {
      DeviceInformation localDeviceInformation = getDeviceInformation(paramString1);
      if (localDeviceInformation != null)
      {
        localDeviceInformation.setFriendlyName(paramString2);
        addOrUpdateDeviceInformation(localDeviceInformation);
      }
      return;
    }
    finally {}
  }
  
  public void updateIcon(final WeMoDevice paramWeMoDevice)
  {
    new Thread(new Runnable()
    {
      public void run()
      {
        if (NetworkMode.isLocal()) {
          if (Build.VERSION.SDK_INT >= 11)
          {
            IconDownloader localIconDownloader1 = new IconDownloader();
            Executor localExecutor = AsyncTask.THREAD_POOL_EXECUTOR;
            Object[] arrayOfObject1 = new Object[3];
            arrayOfObject1[0] = paramWeMoDevice.getLogoURL();
            arrayOfObject1[1] = paramWeMoDevice.getUDN();
            arrayOfObject1[2] = DevicesArray.this.mContext;
            localIconDownloader1.executeOnExecutor(localExecutor, arrayOfObject1);
          }
        }
        DeviceInformation localDeviceInformation;
        DeviceListManager localDeviceListManager;
        do
        {
          return;
          IconDownloader localIconDownloader2 = new IconDownloader();
          Object[] arrayOfObject2 = new Object[3];
          arrayOfObject2[0] = paramWeMoDevice.getLogoURL();
          arrayOfObject2[1] = paramWeMoDevice.getUDN();
          arrayOfObject2[2] = DevicesArray.this.mContext;
          localIconDownloader2.execute(arrayOfObject2);
          return;
          localDeviceInformation = (DeviceInformation)DevicesArray.this.deviceInformationList.get(paramWeMoDevice.getUDN());
          localDeviceListManager = DeviceListManager.getInstance(DevicesArray.this.mContext);
        } while ((localDeviceInformation == null) || (localDeviceInformation.getMAC() == null) || (localDeviceInformation.getMAC().isEmpty()));
        CloudRequestGetIcon localCloudRequestGetIcon = new CloudRequestGetIcon(localDeviceListManager, localDeviceInformation);
        new CloudRequestManager(DevicesArray.this.mContext).makeByteStreamRequest(localCloudRequestGetIcon);
      }
    }).start();
  }
  
  public void updateIconRemote(DeviceInformation paramDeviceInformation)
  {
    if ((paramDeviceInformation != null) && (paramDeviceInformation.getMAC() != null) && (!paramDeviceInformation.getMAC().isEmpty()))
    {
      SDKLogUtils.debugLog("DevicesArray", "updateIconRemote: Downloading remote icon for device: " + paramDeviceInformation.getUDN());
      CloudRequestGetIcon localCloudRequestGetIcon = new CloudRequestGetIcon(DeviceListManager.getInstance(this.mContext), paramDeviceInformation);
      new CloudRequestManager(this.mContext).makeByteStreamRequest(localCloudRequestGetIcon);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/data/DevicesArray.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */