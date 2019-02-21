package com.belkin.firmware;

import android.text.TextUtils;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.cloud.CloudRequestGetAvailFWUpdatesNoHomeID;
import com.belkin.wemo.cache.cloud.CloudRequestGetAvailableFWUpdates;
import com.belkin.wemo.cache.cloud.CloudRequestInterface;
import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.cloud.CloudRequestUpdateFirmware;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.UpnpConstants;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.cache.utils.SDKNetworkUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Set;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;
import org.cybergarage.upnp.DeviceList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class FirmwareUpdateManager
{
  private static final String ACTION_ARGS_DEVICELIST = "DeviceList";
  private static final String ACTION_ARGS_FIRMWARELINK = "FirmwareLink";
  private static final String ACTION_ARGS_UPGRADEPOLICY = "UpgradePolicy";
  private static final String DEVICE_CURRENT_FW = "devicefirmware";
  private static final String DEVICE_TYPE = "type";
  private static final String DEVICE_UDN = "udn";
  private static final String FW_MD5 = "checksum";
  private static final String FW_URL = "url";
  private static final String NEW_FW_VERSION = "version";
  private static String UPDATE_FAILED = "2";
  private static final String UPGRADE = "0";
  private static FirmwareDetails currentDevice;
  private static String currentlyUpdating;
  private static boolean isUpdating;
  public static String tag = "FirmwareUpdateManager";
  private static HashMap<String, Boolean> zigbeeUpdateInitiatedQueue;
  private static LinkedHashMap<String, FirmwareDetails> zigbeeUpdateQueue;
  
  static
  {
    currentDevice = null;
  }
  
  public static void addToZigbeeUpdateQueue(FirmwareDetails paramFirmwareDetails)
  {
    if (zigbeeUpdateQueue == null) {
      zigbeeUpdateQueue = new LinkedHashMap();
    }
    LogUtils.infoLog(tag, "adding to queue" + paramFirmwareDetails.getUniqueID());
    zigbeeUpdateQueue.put(paramFirmwareDetails.getUniqueID(), paramFirmwareDetails);
    LogUtils.infoLog(tag, "queue size" + zigbeeUpdateQueue.size());
    LogUtils.infoLog(tag, "printing zigbeeUpdateQueue");
    printQ(zigbeeUpdateQueue);
    if (!isUpdating)
    {
      isUpdating = true;
      startUpdate();
    }
  }
  
  private static boolean checkUpdate(String paramString)
  {
    LogUtils.infoLog(tag, "in check update:" + paramString);
    if ((currentlyUpdating == null) || (currentlyUpdating.isEmpty())) {
      currentlyUpdating = getUniqueID(paramString);
    }
    LogUtils.infoLog(tag, "currentlyUpdating:" + currentlyUpdating);
    LogUtils.infoLog(tag, "printing zigbeeUpdateQueue");
    getZigbeeUpdateQueue();
    printQ(zigbeeUpdateQueue);
    FirmwareDetails localFirmwareDetails = (FirmwareDetails)zigbeeUpdateQueue.get(currentlyUpdating);
    LogUtils.infoLog(tag, "fd:" + localFirmwareDetails);
    boolean bool;
    if (localFirmwareDetails == null) {
      bool = false;
    }
    String str1;
    do
    {
      for (;;)
      {
        return bool;
        str1 = localFirmwareDetails.getZigbeeIds();
        bool = true;
        LogUtils.infoLog("tag", "printing zigbeeUpdateInitiatedQueue");
        printQ(zigbeeUpdateInitiatedQueue);
        if (!str1.contains(",")) {
          break;
        }
        LogUtils.infoLog(tag, "multiple ids:");
        for (String str2 : str1.split(",")) {
          if (zigbeeUpdateInitiatedQueue.containsKey(str2))
          {
            LogUtils.infoLog(tag, "zigbee id:" + str2);
            LogUtils.infoLog(tag, "zigbee id status:" + zigbeeUpdateInitiatedQueue.get(str2));
            if (!((Boolean)zigbeeUpdateInitiatedQueue.get(str2)).booleanValue()) {
              return false;
            }
          }
        }
      }
      if (!zigbeeUpdateInitiatedQueue.containsKey(str1)) {
        break;
      }
      LogUtils.infoLog(tag, "zigbee id:" + str1);
      LogUtils.infoLog(tag, "zigbee id status:" + zigbeeUpdateInitiatedQueue.get(str1));
    } while (((Boolean)zigbeeUpdateInitiatedQueue.get(str1)).booleanValue());
    return false;
    LogUtils.infoLog(tag, "zigbee id not found in zigbeeUpdateInitiatedQueue :" + str1);
    return bool;
  }
  
  public static void getAvailableUpdates(JSONArray paramJSONArray)
  {
    String str;
    if (paramJSONArray.length() > 0)
    {
      str = new SharePreferences(DeviceListManager.context).getHomeId();
      LogUtils.debugLog(tag, "ACTION_GET_AVAILABLE_UPDATES: Home ID = " + str);
      if (!TextUtils.isEmpty(str)) {
        break label80;
      }
    }
    label80:
    for (Object localObject = new CloudRequestGetAvailFWUpdatesNoHomeID(DeviceListManager.context, paramJSONArray);; localObject = new CloudRequestGetAvailableFWUpdates(DeviceListManager.context, paramJSONArray, str))
    {
      new CloudRequestManager(DeviceListManager.context).makeRequest((CloudRequestInterface)localObject);
      return;
    }
  }
  
  private static String getUniqueID(String paramString)
  {
    String str = "";
    if (zigbeeUpdateQueue == null) {
      return "";
    }
    Iterator localIterator = zigbeeUpdateQueue.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      if (((FirmwareDetails)localEntry.getValue()).getZigbeeIds().contains(","))
      {
        String[] arrayOfString = ((FirmwareDetails)localEntry.getValue()).getZigbeeIds().split(",");
        int i = arrayOfString.length;
        for (int j = 0;; j++)
        {
          if (j >= i) {
            break label126;
          }
          if (paramString.equalsIgnoreCase(arrayOfString[j]))
          {
            str = (String)localEntry.getKey();
            break;
          }
        }
      }
      else
      {
        label126:
        if (paramString.equalsIgnoreCase(((FirmwareDetails)localEntry.getValue()).getZigbeeIds())) {
          str = (String)localEntry.getKey();
        }
      }
    }
    return str;
  }
  
  private static LinkedHashMap<String, FirmwareDetails> getZigbeeUpdateQueue()
  {
    if (zigbeeUpdateQueue == null) {
      zigbeeUpdateQueue = new LinkedHashMap();
    }
    return zigbeeUpdateQueue;
  }
  
  private static void printQ(HashMap<?, ?> paramHashMap)
  {
    LogUtils.infoLog(tag, "printing Q:" + paramHashMap);
    try
    {
      Iterator localIterator = paramHashMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        Object localObject1 = localEntry.getKey();
        Object localObject2 = localEntry.getValue();
        LogUtils.infoLog(tag, "key:" + localObject1 + " value:" + localObject2);
      }
      return;
    }
    catch (Exception localException)
    {
      LogUtils.errorLog(tag, "Exception in printQ: map: " + paramHashMap, localException);
    }
  }
  
  public static boolean processFirwareUpdatePayload(JSONArray paramJSONArray)
  {
    if ((paramJSONArray == null) || (paramJSONArray.length() == 0)) {
      return false;
    }
    LogUtils.infoLog(tag, "Processing Payload:" + paramJSONArray);
    for (int i = 0;; i++)
    {
      try
      {
        if (i >= paramJSONArray.length()) {
          break label250;
        }
        if (!paramJSONArray.getJSONObject(i).has("url")) {
          break label238;
        }
        if (paramJSONArray.getJSONObject(i).getString("bridgeUDN").isEmpty())
        {
          LogUtils.infoLog(tag, "non zigbee update:");
          FirmwareDetails localFirmwareDetails = new FirmwareDetails(paramJSONArray.getJSONObject(i));
          LogUtils.infoLog(tag, localFirmwareDetails.toString());
          if (localFirmwareDetails.deviceType.equalsIgnoreCase("Bridge"))
          {
            new Thread(new Runnable()
            {
              public void run()
              {
                if (FirmwareUpdateManager.zigbeeUpdateQueue != null) {
                  while (FirmwareUpdateManager.zigbeeUpdateQueue.size() != 0) {
                    try
                    {
                      Thread.sleep(2000L);
                    }
                    catch (InterruptedException localInterruptedException)
                    {
                      localInterruptedException.printStackTrace();
                    }
                  }
                }
                FirmwareUpdateManager.startUpdate(this.val$firmwareObject);
              }
            }).start();
          }
          else
          {
            LogUtils.infoLog(tag, "Not bridge starting update: ");
            startUpdate(localFirmwareDetails);
          }
        }
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
        return false;
      }
      LogUtils.infoLog(tag, "zigbee update: " + paramJSONArray.getJSONObject(i));
      Random localRandom = new Random();
      addToZigbeeUpdateQueue(new FirmwareDetails(paramJSONArray.getJSONObject(i), String.valueOf(localRandom.nextInt(99))));
      continue;
      label238:
      LogUtils.infoLog(tag, "Payload without url ");
      continue;
      label250:
      return true;
    }
  }
  
  private static boolean setArgument(Action paramAction, String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    int i;
    if ((paramArrayOfString2 != null) && (paramArrayOfString1 != null)) {
      i = 0;
    }
    while (i < paramArrayOfString1.length)
    {
      LogUtils.verboseLog(tag, "Key " + paramArrayOfString1[i] + " = " + paramArrayOfString2[i] + " Value");
      paramAction.setArgumentValue(paramArrayOfString1[i], paramArrayOfString2[i]);
      i++;
      continue;
      return false;
    }
    return true;
  }
  
  private static boolean startLocalUpdate(FirmwareDetails paramFirmwareDetails)
  {
    String str1 = paramFirmwareDetails.uniqueID;
    LogUtils.infoLog(tag, "starting local update: " + paramFirmwareDetails);
    try
    {
      ControlPoint localControlPoint = DeviceListManager.getInstance(DeviceListManager.context).getUpnpControl();
      if (localControlPoint != null)
      {
        Device localDevice = localControlPoint.getDevice(str1);
        if (localDevice != null)
        {
          DeviceListManager.getInstance(DeviceListManager.context).subscribeToService(localDevice);
          Action localAction = localDevice.getAction("UpdateFirmware");
          if (localAction != null)
          {
            SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
            Date localDate = new Date();
            if (localAction != null)
            {
              String[] arrayOfString1 = UpnpConstants.SET_UPDATE_FIRMWARE_ARGS;
              String[] arrayOfString2 = new String[5];
              arrayOfString2[0] = paramFirmwareDetails.getUpdateVersion();
              arrayOfString2[1] = localSimpleDateFormat.format(localDate);
              arrayOfString2[2] = paramFirmwareDetails.getUpdateURL();
              arrayOfString2[3] = paramFirmwareDetails.getMd5();
              arrayOfString2[4] = "0";
              setArgument(localAction, arrayOfString1, arrayOfString2);
              String str2 = localAction.postControlAction();
              LogUtils.infoLog(tag, "UDN:" + str1 + " Firmware Upgrade UPNP Response:" + str2);
              if ((str2 != null) && (str2.toLowerCase().contains("success"))) {
                return true;
              }
            }
          }
          else
          {
            LogUtils.errorLog(tag, "UDN:" + str1 + " Message:" + "Action null for device.");
            return false;
          }
        }
        else
        {
          LogUtils.errorLog(tag, "UDN:" + str1 + " Message:" + "Device not found in control point.");
          return false;
        }
      }
      else
      {
        LogUtils.errorLog(tag, "UDN:" + str1 + " Message:" + "Control Point is null.");
        return false;
      }
    }
    catch (Exception localException)
    {
      LogUtils.errorLog(str1, "local Update", localException);
      return false;
    }
    return false;
  }
  
  private static void startNextUpdate()
  {
    if (zigbeeUpdateQueue != null)
    {
      String str = currentDevice.getUniqueID();
      LogUtils.infoLog(tag, "removing from queue:" + str);
      zigbeeUpdateQueue.remove(str);
      isUpdating = false;
      currentlyUpdating = "";
      startUpdate();
    }
  }
  
  private static void startRemoteUpdate(FirmwareDetails paramFirmwareDetails)
  {
    if (paramFirmwareDetails != null) {
      for (;;)
      {
        Map localMap;
        try
        {
          CloudRequestManager localCloudRequestManager = new CloudRequestManager(DeviceListManager.context);
          if (paramFirmwareDetails.getBridgeUDN().isEmpty())
          {
            LogUtils.infoLog(tag, "non zigbee update: " + paramFirmwareDetails.toString());
            DeviceInformation localDeviceInformation2 = (DeviceInformation)DevicesArray.getInstance().getDeviceInformationList().get(paramFirmwareDetails.getUniqueID());
            if (localDeviceInformation2 == null) {
              break;
            }
            localCloudRequestManager.makeRequest(new CloudRequestUpdateFirmware(DeviceListManager.context, localDeviceInformation2.getMAC(), localDeviceInformation2.getPluginID(), paramFirmwareDetails.getUpdateURL(), paramFirmwareDetails.getMd5(), localDeviceInformation2.getUDN(), false, ""));
            return;
          }
          LogUtils.infoLog(tag, "zigbee update: " + paramFirmwareDetails.toString());
          localMap = DevicesArray.getInstance().getDeviceInformationList();
          DeviceInformation localDeviceInformation1 = (DeviceInformation)localMap.get(paramFirmwareDetails.getBridgeUDN());
          String str1 = "";
          if (paramFirmwareDetails.getZigbeeIds().contains(","))
          {
            String[] arrayOfString = paramFirmwareDetails.getZigbeeIds().split(",");
            int i = arrayOfString.length;
            int j = 0;
            if (j < i)
            {
              String str3 = arrayOfString[j];
              str1 = str1 + ((DeviceInformation)localMap.get(str3)).getMAC() + ",";
              j++;
              continue;
            }
            localObject = str1.substring(0, -1 + str1.length());
            localCloudRequestManager.makeRequest(new CloudRequestUpdateFirmware(DeviceListManager.context, localDeviceInformation1.getMAC(), localDeviceInformation1.getPluginID(), paramFirmwareDetails.getUpdateURL(), paramFirmwareDetails.getMd5(), (String)localObject, true, paramFirmwareDetails.getBridgeUDN()));
            return;
          }
        }
        catch (Exception localException)
        {
          LogUtils.errorLog(tag, "Exception in startRemoteUpdate : ", localException);
          return;
        }
        String str2 = ((DeviceInformation)localMap.get(paramFirmwareDetails.getZigbeeIds())).getMAC();
        Object localObject = str2;
      }
    }
  }
  
  private static void startUpdate()
  {
    if (!zigbeeUpdateQueue.isEmpty()) {
      try
      {
        Thread.sleep(1000L);
        LogUtils.infoLog(tag, "starting update :");
        String str = (String)zigbeeUpdateQueue.keySet().iterator().next();
        localFirmwareDetails = (FirmwareDetails)zigbeeUpdateQueue.get(str);
        currentDevice = localFirmwareDetails;
        if (new SDKNetworkUtils(DeviceListManager.context).isHomeNetwork())
        {
          LogUtils.infoLog(tag, "local fw update :");
          updateSubDeviceFirmware(localFirmwareDetails);
          return;
        }
      }
      catch (InterruptedException localInterruptedException)
      {
        FirmwareDetails localFirmwareDetails;
        for (;;)
        {
          localInterruptedException.printStackTrace();
        }
        LogUtils.infoLog(tag, "remote fw update :");
        startRemoteUpdate(localFirmwareDetails);
        return;
      }
    }
    LogUtils.infoLog(tag, "update queue is empty");
    if (zigbeeUpdateInitiatedQueue != null)
    {
      zigbeeUpdateInitiatedQueue.clear();
      LogUtils.infoLog(tag, "zigbeeUpdateInitiatedQueue size:" + zigbeeUpdateInitiatedQueue.size());
      return;
    }
    LogUtils.infoLog(tag, "zigbeeUpdateInitiatedQueue is null:");
  }
  
  private static void startUpdate(FirmwareDetails paramFirmwareDetails)
  {
    if (NetworkMode.isLocal())
    {
      if (!startLocalUpdate(paramFirmwareDetails))
      {
        DeviceListManager localDeviceListManager = DeviceListManager.devListManager;
        if (localDeviceListManager != null) {
          localDeviceListManager.sendNotification("FirmwareUpdateStatus", UPDATE_FAILED, paramFirmwareDetails.getUniqueID());
        }
        return;
      }
      String str = paramFirmwareDetails.getUniqueID();
      DeviceListManager.getInstance(DeviceListManager.context).onDeviceFWUpdateStarted(str);
      LogUtils.debugLog(tag, "FW Update: update successfully started for UDN: " + str);
      return;
    }
    startRemoteUpdate(paramFirmwareDetails);
  }
  
  private static boolean updateSubDeviceFirmware(FirmwareDetails paramFirmwareDetails)
  {
    LogUtils.infoLog(tag, "in updateSubDeviceFirmware" + paramFirmwareDetails.getUniqueID());
    ControlPoint localControlPoint = DeviceListManager.getInstance(DeviceListManager.context).getUpnpControl();
    if (localControlPoint == null) {}
    DeviceList localDeviceList;
    do
    {
      return false;
      localDeviceList = localControlPoint.getDeviceList();
    } while (localDeviceList == null);
    for (int i = 0;; i++)
    {
      int j = localDeviceList.size();
      Object localObject = null;
      if (i < j)
      {
        Device localDevice = localDeviceList.getDevice(i);
        if (localDevice == null) {
          break;
        }
        String str2 = localDevice.getUDN();
        if ((str2 == null) || (!str2.contains("Bridge"))) {
          break label339;
        }
        localObject = localDevice;
      }
      try
      {
        Action localAction = ((Device)localObject).getAction("UpgradeSubDeviceFirmware");
        if (localAction == null) {
          break;
        }
        localAction.setArgumentValue("DeviceList", paramFirmwareDetails.getZigbeeIds());
        localAction.setArgumentValue("FirmwareLink", paramFirmwareDetails.getUpdateURL());
        localAction.setArgumentValue("UpgradePolicy", "0");
        LogUtils.infoLog(tag, "action arguements: " + localAction.getArgumentValue("DeviceList"));
        LogUtils.infoLog(tag, "action arguements: " + localAction.getArgumentValue("FirmwareLink"));
        LogUtils.infoLog(tag, "action arguements: " + localAction.getArgumentValue("UpgradePolicy"));
        String str1 = localAction.postControlAction();
        LogUtils.infoLog(tag, "BULB FIRMWARE RESPONSE: " + str1);
        if (TextUtils.isEmpty(str1)) {
          break;
        }
        if (!str1.contains("<Status>0</Status>"))
        {
          LogUtils.infoLog(tag, "Bulb update Error" + paramFirmwareDetails.getUniqueID());
          startNextUpdate();
        }
        return true;
      }
      catch (Exception localException)
      {
        label339:
        localException.printStackTrace();
      }
    }
    return false;
  }
  
  public static void updateUpgradeStatus(String paramString1, String paramString2, String paramString3)
  {
    if ((TextUtils.isEmpty(paramString1)) || (paramString2 == null) || (paramString1.isEmpty()) || (paramString2.isEmpty())) {}
    boolean bool1;
    do
    {
      do
      {
        return;
        LogUtils.infoLog(tag, "upgrade status: id: " + paramString1 + " value:" + paramString2);
        if (paramString2.equalsIgnoreCase("0"))
        {
          LogUtils.infoLog(tag, "upgrade started :" + paramString2);
          isUpdating = true;
          currentlyUpdating = getUniqueID(paramString1);
          LogUtils.infoLog(tag, "updated currently Updating :" + currentlyUpdating);
          if (zigbeeUpdateInitiatedQueue == null) {
            zigbeeUpdateInitiatedQueue = new HashMap();
          }
          zigbeeUpdateInitiatedQueue.put(paramString1, Boolean.FALSE);
          LogUtils.infoLog(tag, "updated zigbeeUpdateInitiatedQueue  :" + zigbeeUpdateInitiatedQueue.get(paramString1));
          LogUtils.infoLog(tag, "printing zigbeeUpdateInitiatedQueue");
          printQ(zigbeeUpdateInitiatedQueue);
          return;
        }
        if (paramString2.equalsIgnoreCase("4"))
        {
          if ((zigbeeUpdateInitiatedQueue != null) && (zigbeeUpdateInitiatedQueue.containsKey(paramString1))) {
            zigbeeUpdateInitiatedQueue.put(paramString1, Boolean.TRUE);
          }
          LogUtils.infoLog(tag, "currentlyUpdating is" + currentlyUpdating);
          if ((currentlyUpdating != null) && (!currentlyUpdating.isEmpty()))
          {
            boolean bool2 = checkUpdate(paramString1);
            LogUtils.infoLog(tag, "updateStatus  :" + bool2);
            if (bool2)
            {
              LogUtils.infoLog(tag, "all good can start next update");
              startNextUpdate();
            }
          }
          for (;;)
          {
            LogUtils.infoLog(tag, "upgrade completed :" + paramString2 + " deviceFWVersion:" + paramString3);
            return;
            LogUtils.infoLog(tag, "currentlyUpdating isEmpty");
          }
        }
      } while ((!paramString2.equalsIgnoreCase("2")) && (!paramString2.equalsIgnoreCase("5")) && (!paramString2.equalsIgnoreCase("6")));
      LogUtils.infoLog(tag, "error :Firmware Failure");
      LogUtils.infoLog(tag, "currentlyUpdating is" + currentlyUpdating);
      if ((zigbeeUpdateInitiatedQueue != null) && (zigbeeUpdateInitiatedQueue.containsKey(paramString1))) {
        zigbeeUpdateInitiatedQueue.put(paramString1, Boolean.TRUE);
      }
      LogUtils.infoLog(tag, "Before sending to checkUpdate: id: " + paramString1);
      bool1 = checkUpdate(paramString1);
      LogUtils.infoLog(tag, "updateStatus  :" + bool1);
    } while (!bool1);
    LogUtils.infoLog(tag, "all good can start next update");
    startNextUpdate();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/firmware/FirmwareUpdateManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */