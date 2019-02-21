package com.belkin.wemo.cache.cloud;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class CloudRequestChangeFriendlyName
  implements CloudRequestInterface
{
  private static final String KEY_FRIENDLY_NAME = "friendlyName";
  private static final String KEY_PLUGIN_TAG = "plugin";
  private final String TAG = "SDK_CloudRequestChangeFriendlyName";
  private int TIMEOUT = 60000;
  private final int TIMEOUT_LIMIT = 45000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/message/";
  private String bridgeMac = null;
  private String bridgePluginID = null;
  private String devName;
  private String friendlyName;
  private DeviceListManager mDevMgr;
  private String mac;
  private String pluginID;
  private String postOperationNotification = null;
  private String udn;
  
  public CloudRequestChangeFriendlyName(DeviceListManager paramDeviceListManager, Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4, Object... paramVarArgs)
  {
    this.mDevMgr = paramDeviceListManager;
    this.pluginID = paramString2;
    this.mac = paramString3;
    this.friendlyName = paramString4;
    this.udn = paramString1;
    JSONObject localJSONObject;
    if ((paramVarArgs != null) && (paramVarArgs.length > 0)) {
      localJSONObject = (JSONObject)paramVarArgs[0];
    }
    try
    {
      if (localJSONObject.has("notificationName")) {
        this.postOperationNotification = localJSONObject.getString("notificationName");
      }
      if ((localJSONObject.has("bridgeudn")) && (localJSONObject.has("bridgeMacAddress")))
      {
        this.bridgePluginID = localJSONObject.getString("bridgeudn");
        this.bridgeMac = localJSONObject.getString("bridgeMacAddress");
      }
      return;
    }
    catch (JSONException localJSONException)
    {
      SDKLogUtils.errorLog("SDK_CloudRequestChangeFriendlyName", "Exception in extra params e: " + localJSONException);
    }
  }
  
  private boolean parseResponse(String paramString)
  {
    try
    {
      XMLParser localXMLParser = new XMLParser();
      this.devName = localXMLParser.getValue((Element)localXMLParser.getDomElement(paramString).getElementsByTagName("plugin").item(0), "friendlyName");
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
    String str1 = this.pluginID;
    String str2 = this.mac;
    if ((this.bridgePluginID != null) && (this.bridgeMac != null))
    {
      str1 = this.bridgePluginID;
      str2 = this.bridgeMac;
    }
    return "<plugins>\n    <plugin>                 \n        <recipientId>" + str1 + "</recipientId>                    \n" + "        <macAddress>" + str2 + "</macAddress>\n" + "  <content><![CDATA[<changeFriendlyName>\n" + "  <plugin>\n" + "  <pluginId>" + this.pluginID + "</pluginId>\n" + "  <macAddress>" + this.mac + "</macAddress>\n" + "  <friendlyName>" + this.friendlyName + "</friendlyName>\n" + "  </plugin\n>" + "</changeFriendlyName>]]></content>\n" + "    </plugin>\n" + "</plugins>";
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
    return 45000;
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
    Log.i("updateFriendlyName: ", "success: " + paramBoolean);
    if (paramBoolean) {}
    try
    {
      String str = new String(paramArrayOfByte, "UTF-8");
      Log.i("SDK_CloudRequestChangeFriendlyName", str);
      boolean bool = parseResponse(str);
      Log.i("SDK_CloudRequestChangeFriendlyName", "Response parse: " + String.valueOf(bool));
      if (bool)
      {
        DeviceInformation localDeviceInformation = this.mDevMgr.getDeviceInformationFromDevicesArray(this.udn);
        if (localDeviceInformation != null)
        {
          localDeviceInformation.setFriendlyName(this.friendlyName);
          this.mDevMgr.setDeviceInformationToDevicesArray(localDeviceInformation, false);
          if ((this.postOperationNotification != null) && (!TextUtils.isEmpty(this.postOperationNotification))) {
            this.mDevMgr.sendNotification(this.postOperationNotification, bool + "", this.udn);
          }
        }
      }
      return;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("SDK_CloudRequestChangeFriendlyName", "Exception in requestComplete e:" + localException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */