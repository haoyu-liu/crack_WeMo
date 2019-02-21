package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.IsDevice;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class CloudRequestStateChange
  implements CloudRequestInterface
{
  private static final String KEY_FRIENDLY_NAME = "friendlyName";
  private static final String KEY_PLUGIN_TAG = "plugin";
  private static final String KEY_STATUS = "status";
  private final String TAG = CloudRequestStateChange.class.getSimpleName();
  private int TIMEOUT = 10000;
  private final int TIMEOUT_LIMIT = 40000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/message/";
  private String devName;
  private String eventDuration;
  private CacheManager mCacheManager;
  private DeviceListManager mDevMgr;
  private DeviceInformation mDeviceInfo;
  private DevicesArray mDevicesArray;
  private String mac;
  private String mode = "";
  private String newDevState;
  private String pluginID;
  private String status;
  private String time = "";
  private String udn;
  
  public CloudRequestStateChange(Context paramContext, String paramString, JSONObject paramJSONObject)
  {
    this.mDevMgr = DeviceListManager.getInstance(paramContext);
    this.udn = paramString;
    this.mCacheManager = CacheManager.getInstance(paramContext);
    this.mDevicesArray = DevicesArray.getInstance();
    this.mDeviceInfo = ((DeviceInformation)this.mDevMgr.getDeviceInformationList().get(paramString));
    this.pluginID = this.mDeviceInfo.getPluginID();
    this.mac = this.mDeviceInfo.getMAC();
    try
    {
      if (IsDevice.Crockpot(paramString))
      {
        this.mode = paramJSONObject.getString("mode");
        this.time = paramJSONObject.getString("time");
        this.status = this.mode;
        this.eventDuration = this.time;
        return;
      }
      this.status = paramJSONObject.getString("binaryState");
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
  }
  
  private boolean parseResponse(String paramString)
  {
    try
    {
      XMLParser localXMLParser = new XMLParser();
      Element localElement = (Element)localXMLParser.getDomElement(paramString).getElementsByTagName("plugin").item(0);
      this.newDevState = localXMLParser.getValue(localElement, "status");
      this.devName = localXMLParser.getValue(localElement, "friendlyName");
      return true;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return false;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    if (IsDevice.Crockpot(this.udn))
    {
      String str2 = "<plugins>\n    <plugin>                 \n        <recipientId>" + this.pluginID + "</recipientId>                    \n" + "        <macAddress>" + this.mac + "</macAddress>\n" + "        <content>                          \n" + "            <![CDATA[ <pluginSetDeviceStatus>\n" + "                            <plugin>                                               \n" + "                                <pluginId>" + this.pluginID + "</pluginId>                                                 \n" + "                                <macAddress>" + this.mac + "</macAddress> \n" + "                                <status>" + this.status + "</status>\n" + "                                <eventDuration>" + this.eventDuration + "</eventDuration>\n" + "                            </plugin>\n" + "                      </pluginSetDeviceStatus > ]]>            \n" + "        </content>    \n" + "    </plugin>\n" + "</plugins>";
      SDKLogUtils.infoLog("xmlString::: ", str2);
      return str2;
    }
    String str1 = "<plugins>\n    <plugin>                 \n        <recipientId>" + this.pluginID + "</recipientId>                    \n" + "        <macAddress>" + this.mac + "</macAddress>\n" + "        <content>                          \n" + "            <![CDATA[ <pluginSetDeviceStatus>\n" + "                            <plugin>                                               \n" + "                                <pluginId>" + this.pluginID + "</pluginId>                                                 \n" + "                                <macAddress>" + this.mac + "</macAddress> \n" + "                                <status>" + this.status + "</status>\n" + "                            </plugin>\n" + "                      </pluginSetDeviceStatus > ]]>            \n" + "        </content>    \n" + "    </plugin>\n" + "</plugins>";
    SDKLogUtils.infoLog("xmlString::: ", str1);
    return str1;
  }
  
  public byte[] getFileByteArray()
  {
    return null;
  }
  
  public int getRequestMethod()
  {
    return 1;
  }
  
  public int getTimeout()
  {
    return this.TIMEOUT;
  }
  
  public int getTimeoutLimit()
  {
    return 40000;
  }
  
  public String getURL()
  {
    return this.URL;
  }
  
  public String getUploadFileName()
  {
    return null;
  }
  
  public boolean isAuthHeaderRequired()
  {
    return true;
  }
  
  public void requestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    SDKLogUtils.debugLog(this.TAG, "Set Device State Request Completed. is success: " + paramBoolean);
    if (paramBoolean) {
      for (;;)
      {
        try
        {
          String str = new String(paramArrayOfByte, "UTF-8");
          SDKLogUtils.infoLog(this.TAG, str);
          boolean bool = parseResponse(str);
          SDKLogUtils.infoLog(this.TAG, "Response parse: " + String.valueOf(bool));
          JSONObject localJSONObject1;
          if (bool)
          {
            if (IsDevice.Crockpot(this.udn)) {
              localJSONObject1 = this.mDeviceInfo.getAttributeList();
            }
          }
          else {
            try
            {
              JSONObject localJSONObject2 = (JSONObject)localJSONObject1.get("mode");
              localJSONObject2.put("value", this.mode);
              localJSONObject1.put("mode", localJSONObject2);
              JSONObject localJSONObject3 = (JSONObject)localJSONObject1.get("time");
              localJSONObject3.put("value", this.time);
              localJSONObject1.put("time", localJSONObject3);
              this.mDeviceInfo.setAttributeList(localJSONObject1);
              this.mDevicesArray.addOrUpdateDeviceInformation(this.mDeviceInfo);
              this.mCacheManager.updateDB(this.mDeviceInfo, false, false, true);
              this.mDevMgr.sendNotification("set_state", Boolean.toString(paramBoolean), this.mDeviceInfo.getUDN());
              return;
            }
            catch (JSONException localJSONException)
            {
              SDKLogUtils.errorLog(this.TAG, "JSONException while parsing cloud response: ", localJSONException);
              continue;
            }
          }
          if (this.newDevState == null) {
            continue;
          }
        }
        catch (UnsupportedEncodingException localUnsupportedEncodingException)
        {
          SDKLogUtils.errorLog(this.TAG, "UnsupportedEncodingException while parsing cloud response: ", localUnsupportedEncodingException);
          this.mDevMgr.restartCloudPeriodicUpdate();
          return;
        }
        if (!this.newDevState.trim().isEmpty())
        {
          this.mDeviceInfo.setBinaryState(this.newDevState);
          this.mDeviceInfo.setState(Integer.valueOf(this.newDevState.split("\\|")[0]).intValue());
          this.mDevicesArray.addOrUpdateDeviceInformation(this.mDeviceInfo);
          this.mCacheManager.updateDB(this.mDeviceInfo, false, false, true);
        }
      }
    }
    this.mDevMgr.restartCloudPeriodicUpdate();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestStateChange.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */