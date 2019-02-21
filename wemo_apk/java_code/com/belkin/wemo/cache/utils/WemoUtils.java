package com.belkin.wemo.cache.utils;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.DeviceListManager.FirmwareUpdateData;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.StreamCorruptedException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;
import org.cybergarage.upnp.ssdp.SSDPPacket;

public class WemoUtils
{
  private static final String FW_UPGRADE_STATE_MAP_FILENAME = "fw_upgrade_state_map";
  private static final String TAG = WemoUtils.class.getSimpleName();
  private static Map<String, String> capabilityProfileNameToIDHashMap;
  private static boolean isAppInForeground = false;
  
  public static SSDPPacket createSSDPPacket(String paramString1, int paramInt, String paramString2)
  {
    String str = "http://" + paramString1 + ":" + paramInt + "/setup.xml";
    byte[] arrayOfByte = ("HTTP/1.1 200 OK\nCACHE-CONTROL: max-age=86400\nST: " + "urn:Belkin:service:basicevent:1" + "\n" + "USN" + ":" + " " + paramString2 + "::" + "urn:Belkin:service:basicevent:1" + "\n" + "LOCATION" + ":" + " " + str).getBytes();
    SSDPPacket localSSDPPacket = new SSDPPacket(arrayOfByte, arrayOfByte.length);
    localSSDPPacket.setTimeStamp(System.currentTimeMillis());
    return localSSDPPacket;
  }
  
  public static String getCapabilityID(String paramString)
  {
    return (String)getCapabilityProfileNameToIDHashMap().get(paramString);
  }
  
  public static Map<String, String> getCapabilityProfileNameToIDHashMap()
  {
    if (capabilityProfileNameToIDHashMap == null)
    {
      capabilityProfileNameToIDHashMap = new HashMap();
      capabilityProfileNameToIDHashMap.put("onOff", "10006");
      capabilityProfileNameToIDHashMap.put("levelControl", "10008");
      capabilityProfileNameToIDHashMap.put("sleepFader", "30008");
      capabilityProfileNameToIDHashMap.put("levelControlMove", "30009");
      capabilityProfileNameToIDHashMap.put("levelControlStop", "3000A");
      capabilityProfileNameToIDHashMap.put("identify", "10003");
      capabilityProfileNameToIDHashMap.put("colorControl", "10300");
      capabilityProfileNameToIDHashMap.put("colorTemperature", "30301");
      capabilityProfileNameToIDHashMap.put("iasZone", "10500");
      capabilityProfileNameToIDHashMap.put("sensorConfig", "20500");
      capabilityProfileNameToIDHashMap.put("sensorTestMode", "30501");
      capabilityProfileNameToIDHashMap.put("sensorKeyPress", "20502");
    }
    return capabilityProfileNameToIDHashMap;
  }
  
  public static String getProductName(String paramString)
  {
    String str = "";
    if (!TextUtils.isEmpty(paramString))
    {
      if (!paramString.equalsIgnoreCase("F7C040")) {
        break label24;
      }
      str = "AlarmSensor";
    }
    label24:
    do
    {
      return str;
      if (paramString.equalsIgnoreCase("F7C041")) {
        return "PIR";
      }
      if (paramString.equalsIgnoreCase("F7C039")) {
        return "Fob";
      }
    } while (!paramString.equalsIgnoreCase("F7C038"));
    return "DWSensor";
  }
  
  public static String getZigbeeIcon(String paramString1, String paramString2)
  {
    if (TextUtils.isEmpty(paramString2)) {
      return "";
    }
    String str1 = paramString2.replaceAll(" ", "_");
    String str2 = "file:///android_asset/www/img/" + "bulb_" + str1.toLowerCase(Locale.getDefault()) + ".png";
    SDKLogUtils.infoLog(TAG, "imageURL::" + str2);
    return str2;
  }
  
  public static boolean isAppInForeground()
  {
    SDKLogUtils.debugLog(TAG, "Connectivity: Is App in foreground: " + isAppInForeground);
    return isAppInForeground;
  }
  
  public static boolean isGetEndDevicesWithStatusSupported(String paramString, DeviceListManager paramDeviceListManager)
  {
    boolean bool = false;
    if (paramString != null)
    {
      Device localDevice = paramDeviceListManager.getUpnpControl().getDevice(paramString);
      bool = false;
      if (localDevice != null)
      {
        if (localDevice.getAction("GetEndDevicesWithStatus") == null) {
          break label42;
        }
        SDKLogUtils.infoLog(TAG, "GetEndDevicesWithStatus UpNp Action Called");
        bool = true;
      }
    }
    return bool;
    label42:
    SDKLogUtils.infoLog(TAG, "GetEndDevices UpNp Action Called");
    return false;
  }
  
  public static boolean isLEDModelCodeSupported(String paramString)
  {
    String[] arrayOfString = Constants.SUPPORTED_LED_MODELCODE_ARRAY;
    int i = arrayOfString.length;
    for (int j = 0;; j++)
    {
      boolean bool = false;
      if (j < i)
      {
        if (paramString.equalsIgnoreCase(arrayOfString[j])) {
          bool = true;
        }
      }
      else {
        return bool;
      }
    }
  }
  
  public static Map<String, DeviceListManager.FirmwareUpdateData> readFirmwareUpgradeInProgressState(Context paramContext)
  {
    SDKLogUtils.debugLog(TAG, "Requesting readFirmwareUpgradeInProgressState...");
    Object localObject = new HashMap();
    File localFile = new File(paramContext.getFilesDir(), "fw_upgrade_state_map");
    if (localFile.exists()) {
      try
      {
        ObjectInputStream localObjectInputStream = new ObjectInputStream(new FileInputStream(localFile));
        localObject = (Map)localObjectInputStream.readObject();
        localObjectInputStream.close();
        return (Map<String, DeviceListManager.FirmwareUpdateData>)localObject;
      }
      catch (StreamCorruptedException localStreamCorruptedException)
      {
        SDKLogUtils.errorLog(TAG, "StreamCorruptedException while reading fwUpgradeInProgressDataMap from memory: ", localStreamCorruptedException);
        return (Map<String, DeviceListManager.FirmwareUpdateData>)localObject;
      }
      catch (FileNotFoundException localFileNotFoundException)
      {
        SDKLogUtils.errorLog(TAG, "FileNotFoundException while reading fwUpgradeInProgressDataMap from memory: ", localFileNotFoundException);
        return (Map<String, DeviceListManager.FirmwareUpdateData>)localObject;
      }
      catch (IOException localIOException)
      {
        SDKLogUtils.errorLog(TAG, "IOException while reading fwUpgradeInProgressDataMap from memory: ", localIOException);
        return (Map<String, DeviceListManager.FirmwareUpdateData>)localObject;
      }
      catch (ClassNotFoundException localClassNotFoundException)
      {
        SDKLogUtils.errorLog(TAG, "ClassNotFoundException while reading fwUpgradeInProgressDataMap from memory: ", localClassNotFoundException);
        return (Map<String, DeviceListManager.FirmwareUpdateData>)localObject;
      }
    }
    SDKLogUtils.errorLog(TAG, "fwUpgradeInProgressDataMap file in memory does not exist. Thus it is assumed that no device FW update in progress.");
    return (Map<String, DeviceListManager.FirmwareUpdateData>)localObject;
  }
  
  public static Device recreateControlPointDevice(DeviceInformation paramDeviceInformation, Context paramContext)
  {
    SDKLogUtils.infoLog(TAG, "Recreating control point device for UDN: " + paramDeviceInformation.getUDN());
    ControlPoint localControlPoint = DeviceListManager.getInstance(paramContext).getUpnpControl();
    localControlPoint.searchResponseReceived(createSSDPPacket(paramDeviceInformation.getIP(), paramDeviceInformation.getPort(), paramDeviceInformation.getUDN()), false, true);
    return localControlPoint.getDevice(paramDeviceInformation.getUDN());
  }
  
  public static void setAppForeground(boolean paramBoolean)
  {
    SDKLogUtils.infoLog(TAG, "setAppForeground() flag::" + paramBoolean);
    isAppInForeground = paramBoolean;
  }
  
  public static boolean writeFirmwareUpgradeInProgressState(Map<String, DeviceListManager.FirmwareUpdateData> paramMap, Context paramContext)
  {
    SDKLogUtils.debugLog(TAG, "Requesting writeFirmwareUpgradeInProgressState...");
    File localFile = new File(paramContext.getFilesDir(), "fw_upgrade_state_map");
    try
    {
      ObjectOutputStream localObjectOutputStream = new ObjectOutputStream(new FileOutputStream(localFile));
      localObjectOutputStream.writeObject(paramMap);
      localObjectOutputStream.flush();
      localObjectOutputStream.close();
      SDKLogUtils.debugLog(TAG, "writeFirmwareUpgradeInProgressState: isWritten: " + false);
      return false;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog(TAG, "FileNotFoundException while writing fwUpgradeInProgressDataMap to memory: ", localFileNotFoundException);
      }
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog(TAG, "IOException while writing fwUpgradeInProgressDataMap to memory: ", localIOException);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/utils/WemoUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */