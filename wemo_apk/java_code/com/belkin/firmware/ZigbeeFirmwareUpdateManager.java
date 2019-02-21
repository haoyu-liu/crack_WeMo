package com.belkin.firmware;

import android.os.AsyncTask;
import com.belkin.cordova.plugin.DevicePlugin;
import com.belkin.utils.LogUtils;
import com.belkin.utils.WiFiSecurityUtil;
import com.belkin.wemo.cache.utils.SDKNetworkUtils;
import com.belkin.wemo.localsdk.WeMoSDKContext;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Set;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;
import org.cybergarage.upnp.DeviceList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ZigbeeFirmwareUpdateManager
{
  private static final String ACTION_ARGS_DEVICELIST = "DeviceList";
  private static final String ACTION_ARGS_FIRMWARELINK = "FirmwareLink";
  private static final String ACTION_ARGS_UPGRADEPOLICY = "UpgradePolicy";
  private static final String DEVICE_CURRENT_FW = "devicefirmware";
  private static final String DEVICE_TYPE = "type";
  private static final String DEVICE_UDN = "udn";
  private static final String FW_MD5 = "newFirmwareSignature";
  private static final String FW_URL = "newFirmwareURL";
  private static final String NEW_FW_VERSION = "newFirmwareVersion";
  private static final String UPGRADE = "0";
  private static String bridgeMacAddress = "";
  private static FirmwareDetails currentDevice;
  public static String currentlyUpdating;
  public static LinkedHashMap<String, FirmwareDetails> firmwareUpdateQueue;
  private static String firmwareUpgradeURL = "https://api.xbcs.net:8443/apis/http/plugin/upgradeFwVersion";
  private static boolean isUpdating;
  private static String pluginID;
  public static String tag = "FirmwareUpdate";
  
  static
  {
    firmwareUpdateQueue = null;
    currentlyUpdating = "";
    currentDevice = null;
    isUpdating = false;
    pluginID = "";
  }
  
  public static void addTofirmwareUpdateQueue(JSONArray paramJSONArray)
  {
    if (paramJSONArray == null) {
      return;
    }
    for (;;)
    {
      try
      {
        localJSONArray1 = (JSONArray)paramJSONArray.get(0);
        if (paramJSONArray.length() <= 1) {
          break label214;
        }
        JSONArray localJSONArray2 = (JSONArray)paramJSONArray.get(1);
        JSONObject localJSONObject2 = localJSONArray2.getJSONObject(0);
        bridgeMacAddress = localJSONObject2.getString("macAddress");
        pluginID = localJSONObject2.getString("pluginId");
        LogUtils.infoLog(tag, "bridge details:" + localJSONArray2.toString());
      }
      catch (JSONException localJSONException)
      {
        JSONArray localJSONArray1;
        JSONObject localJSONObject1;
        FirmwareDetails localFirmwareDetails;
        localJSONException.printStackTrace();
        return;
      }
      if (i >= localJSONArray1.length()) {
        break;
      }
      localJSONObject1 = (JSONObject)localJSONArray1.get(i);
      LogUtils.infoLog(tag, "device details:" + localJSONObject1.toString());
      localFirmwareDetails = new FirmwareDetails(localJSONObject1.getString("udn"), localJSONObject1.getString("devicefirmware"), localJSONObject1.getString("newFirmwareURL"), localJSONObject1.getString("newFirmwareVersion"), localJSONObject1.getString("newFirmwareSignature"), localJSONObject1.getString("type"));
      updateQueue(localJSONObject1.getString("udn"), localFirmwareDetails);
      i++;
      continue;
      label214:
      int i = 0;
    }
  }
  
  private static String generateAuthHeader()
  {
    return new WiFiSecurityUtil().generateAuthCode(DevicePlugin.mContext);
  }
  
  private static String generateRequestXML(FirmwareDetails paramFirmwareDetails)
  {
    return "<plugins><plugin><recipientId>" + pluginID + "</recipientId>" + "<macAddress>" + bridgeMacAddress + "</macAddress>" + "<content><![CDATA[<upgradeFwVersion>" + "<plugins><plugin>" + "  <downloadStartTime>" + System.currentTimeMillis() + "</downloadStartTime>" + "  <macAddress>" + paramFirmwareDetails.getUniqueID() + "</macAddress>" + "  <signature>" + paramFirmwareDetails.getMd5() + "</signature>" + "  <firmwareDownloadUrl>" + paramFirmwareDetails.getUpdateURL() + "</firmwareDownloadUrl>" + "  </plugin></plugins></upgradeFwVersion>]]></content></plugin></plugins>";
  }
  
  private static void startNextUpdate()
  {
    if (firmwareUpdateQueue != null)
    {
      String str = currentDevice.getUniqueID();
      LogUtils.infoLog(tag, "removing from queue:" + str);
      firmwareUpdateQueue.remove(str);
      isUpdating = false;
      currentlyUpdating = "";
      startUpdate();
    }
  }
  
  private static void startUpdate()
  {
    if (!firmwareUpdateQueue.isEmpty())
    {
      LogUtils.infoLog(tag, "starting update :");
      String str = (String)firmwareUpdateQueue.keySet().iterator().next();
      FirmwareDetails localFirmwareDetails = (FirmwareDetails)firmwareUpdateQueue.get(str);
      currentDevice = localFirmwareDetails;
      if (new SDKNetworkUtils(DevicePlugin.mContext).isHomeNetwork())
      {
        LogUtils.infoLog(tag, "local fw update :");
        updateSubDeviceFirmware(localFirmwareDetails);
        return;
      }
      LogUtils.infoLog(tag, "remote fw update :");
      updateSubDeviceFirmwareRequest(localFirmwareDetails);
      return;
    }
    LogUtils.infoLog(tag, "queue is empty");
  }
  
  private static void updateQueue(String paramString, FirmwareDetails paramFirmwareDetails)
  {
    if (firmwareUpdateQueue == null) {
      firmwareUpdateQueue = new LinkedHashMap();
    }
    LogUtils.infoLog(tag, "adding to queue" + paramString);
    firmwareUpdateQueue.put(paramString, paramFirmwareDetails);
    LogUtils.infoLog(tag, "queue size" + firmwareUpdateQueue.size());
    if (!isUpdating)
    {
      isUpdating = true;
      startUpdate();
    }
  }
  
  private static boolean updateSubDeviceFirmware(FirmwareDetails paramFirmwareDetails)
  {
    LogUtils.infoLog(tag, "in updateSubDeviceFirmware" + paramFirmwareDetails.getUniqueID());
    WeMoSDKContext localWeMoSDKContext = DevicePlugin.mWeMoSDKContext;
    ControlPoint localControlPoint = null;
    if (localWeMoSDKContext != null) {
      localControlPoint = (ControlPoint)DevicePlugin.mWeMoSDKContext.getUpnpControl();
    }
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
          break label317;
        }
        localObject = localDevice;
      }
      try
      {
        Action localAction = ((Device)localObject).getAction("UpgradeSubDeviceFirmware");
        localAction.setArgumentValue("DeviceList", paramFirmwareDetails.getUniqueID());
        localAction.setArgumentValue("FirmwareLink", paramFirmwareDetails.getUpdateURL());
        localAction.setArgumentValue("UpgradePolicy", "0");
        LogUtils.infoLog(tag, "action arguements: " + localAction.getArgumentValue("DeviceList"));
        LogUtils.infoLog(tag, "action arguements: " + localAction.getArgumentValue("FirmwareLink"));
        LogUtils.infoLog(tag, "action arguements: " + localAction.getArgumentValue("UpgradePolicy"));
        String str1 = localAction.postControlAction();
        LogUtils.infoLog(tag, "BULB FIRMWARE RESPONSE: " + str1);
        boolean bool = str1.toLowerCase(Locale.getDefault()).contains("success");
        if (!bool) {
          break;
        }
        return true;
      }
      catch (Exception localException)
      {
        label317:
        localException.printStackTrace();
      }
    }
    return false;
  }
  
  private static void updateSubDeviceFirmwareRequest(FirmwareDetails paramFirmwareDetails)
  {
    new AsyncTask()
    {
      protected Void doInBackground(Void... paramAnonymousVarArgs)
      {
        String str1 = ZigbeeFirmwareUpdateManager.access$000();
        String str2 = ZigbeeFirmwareUpdateManager.generateRequestXML(this.val$firmwareDetails);
        LogUtils.infoLog(ZigbeeFirmwareUpdateManager.tag, "requestXML :" + str2);
        HttpPost localHttpPost = new HttpPost(ZigbeeFirmwareUpdateManager.firmwareUpgradeURL);
        localHttpPost.addHeader("Content-Type", "application/xml");
        localHttpPost.addHeader("Authorization", str1);
        try
        {
          localHttpPost.setEntity(new StringEntity(str2));
          DefaultHttpClient localDefaultHttpClient = new DefaultHttpClient();
          LogUtils.infoLog(ZigbeeFirmwareUpdateManager.tag, "all set to make request");
          int i = localDefaultHttpClient.execute(localHttpPost).getStatusLine().getStatusCode();
          ZigbeeFirmwareUpdateManager.currentlyUpdating = this.val$firmwareDetails.getUniqueID();
          LogUtils.infoLog(ZigbeeFirmwareUpdateManager.tag, "Fw Update request response:" + i);
          return null;
        }
        catch (UnsupportedEncodingException localUnsupportedEncodingException)
        {
          for (;;)
          {
            localUnsupportedEncodingException.printStackTrace();
          }
        }
        catch (IOException localIOException)
        {
          for (;;)
          {
            localIOException.printStackTrace();
          }
        }
      }
    }.execute(new Void[0]);
  }
  
  public static void updateUpgradeStatus(String paramString1, String paramString2, String paramString3)
  {
    if ((paramString1 == null) || (paramString2 == null) || (paramString1.isEmpty()) || (paramString2.isEmpty())) {}
    label177:
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
          currentlyUpdating = paramString1;
          return;
        }
        if (!paramString2.equalsIgnoreCase("4")) {
          break label177;
        }
        LogUtils.infoLog(tag, "upgrade completed :" + paramString2 + " deviceFWVersion:" + paramString3);
        if (paramString3.isEmpty()) {
          break;
        }
      } while (!currentDevice.updateVersion.contains(paramString3));
      startNextUpdate();
      return;
      startNextUpdate();
      return;
      if (paramString2.equalsIgnoreCase("2"))
      {
        LogUtils.infoLog(tag, "error :Firmware Download Failure");
        startNextUpdate();
        return;
      }
      if (paramString2.equalsIgnoreCase("5"))
      {
        LogUtils.infoLog(tag, "error :Invalid Firmware Image");
        startNextUpdate();
        return;
      }
    } while (!paramString2.equalsIgnoreCase("6"));
    LogUtils.infoLog(tag, "error :Firmware not upgraded");
    startNextUpdate();
  }
  
  public LinkedHashMap<String, FirmwareDetails> getFirmwareUpdateQueue()
  {
    return firmwareUpdateQueue;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/firmware/ZigbeeFirmwareUpdateManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */