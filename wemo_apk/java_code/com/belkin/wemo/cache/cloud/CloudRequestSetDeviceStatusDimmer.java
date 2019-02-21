package com.belkin.wemo.cache.cloud;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import org.json.JSONException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class CloudRequestSetDeviceStatusDimmer
  implements CloudRequestInterface
{
  private static final String KEY_PLUGIN_TAG = "plugin";
  private final String TAG = CloudRequestSetDeviceStatusDimmer.class.getSimpleName();
  private int TIMEOUT = 10000;
  private final int TIMEOUT_LIMIT = 40000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/message/";
  private String attributeName;
  private String attributeValue;
  private String brightnessFromCloud;
  private String faderFromCloud;
  private CacheManager mCacheManager;
  private DeviceListManager mDevMgr;
  private DeviceInformation mDeviceInfo;
  private DevicesArray mDevicesArray;
  private String mac;
  private String pluginID;
  private int state;
  
  public CloudRequestSetDeviceStatusDimmer(Context paramContext, String paramString1, String paramString2, String paramString3)
  {
    this.mDevMgr = DeviceListManager.getInstance(paramContext);
    this.mCacheManager = CacheManager.getInstance(paramContext);
    this.mDevicesArray = DevicesArray.getInstance();
    this.mDeviceInfo = ((DeviceInformation)this.mDevMgr.getDeviceInformationList().get(paramString1));
    this.pluginID = this.mDeviceInfo.getPluginID();
    this.mac = this.mDeviceInfo.getMAC();
    this.state = this.mDeviceInfo.getState();
    this.attributeName = paramString2;
    this.attributeValue = paramString3;
  }
  
  private boolean parseResponse(String paramString)
  {
    boolean bool = true;
    try
    {
      XMLParser localXMLParser = new XMLParser();
      Element localElement = (Element)localXMLParser.getDomElement(paramString).getElementsByTagName("plugin").item(0);
      this.brightnessFromCloud = localXMLParser.getValue(localElement, "brightness");
      this.faderFromCloud = localXMLParser.getValue(localElement, "fader");
      String str = localXMLParser.getValue(localElement, "status");
      if (!TextUtils.isEmpty(str))
      {
        this.state = Integer.valueOf(str).intValue();
        if (this.state == 3) {
          bool = false;
        }
      }
      SDKLogUtils.infoLog(this.TAG, "Response parsed. Status: " + str + "; Brightness: " + this.brightnessFromCloud + "; Fader: " + this.faderFromCloud);
      return bool;
    }
    catch (NumberFormatException localNumberFormatException)
    {
      SDKLogUtils.errorLog(this.TAG, "NumberFormatException while parsing xml response for Dimmer Attribute change: ", localNumberFormatException);
    }
    return false;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    String str = "<plugins>\n    <plugin>                 \n        <recipientId>" + this.pluginID + "</recipientId>                    \n" + "        <macAddress>" + this.mac + "</macAddress>\n" + "        <content>                          \n" + "            <![CDATA[ <pluginSetDeviceStatus>\n" + "                            <plugin>                                               \n" + "                                <pluginId>" + this.pluginID + "</pluginId>                                                 \n" + "                                <macAddress>" + this.mac + "</macAddress> \n" + "                                <" + this.attributeName + ">" + this.attributeValue + "</" + this.attributeName + ">\n" + "                            </plugin>\n" + "                      </pluginSetDeviceStatus> ]]>            \n" + "        </content>    \n" + "    </plugin>\n" + "</plugins>";
    SDKLogUtils.infoLog("xmlString::: ", str);
    return str;
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
    SDKLogUtils.debugLog(this.TAG, "Attribute change request completed. is success: " + paramBoolean);
    if (paramBoolean) {
      try
      {
        String str1 = new String(paramArrayOfByte, "UTF-8");
        SDKLogUtils.infoLog(this.TAG, str1);
        boolean bool = parseResponse(str1);
        SDKLogUtils.infoLog(this.TAG, "Response parse - isSuccess: " + String.valueOf(bool));
        if (bool)
        {
          if (!TextUtils.isEmpty(this.faderFromCloud)) {
            this.mDeviceInfo.setAttributeValue("fader", this.faderFromCloud);
          }
          if (!TextUtils.isEmpty(this.brightnessFromCloud)) {
            this.mDeviceInfo.setAttributeValue("brightness", this.brightnessFromCloud);
          }
          String str2 = String.valueOf(this.state);
          if (!TextUtils.isEmpty(str2))
          {
            this.mDeviceInfo.setAttributeValue("binaryState", str2);
            this.mDeviceInfo.setState(this.state);
            this.mDeviceInfo.setBinaryState(str2);
          }
          this.mDevicesArray.addOrUpdateDeviceInformation(this.mDeviceInfo);
          this.mCacheManager.updateDB(this.mDeviceInfo, false, false, true);
        }
        this.mDevMgr.sendNotification("change_state", Boolean.toString(bool), this.mDeviceInfo.getUDN());
        return;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        SDKLogUtils.errorLog(this.TAG, "UnsupportedEncodingException while parsing cloud response: ", localUnsupportedEncodingException);
        this.mDevMgr.restartCloudPeriodicUpdate();
        return;
      }
      catch (JSONException localJSONException)
      {
        SDKLogUtils.errorLog(this.TAG, "JSONException while parsing cloud response: ", localJSONException);
        this.mDevMgr.restartCloudPeriodicUpdate();
        return;
      }
    }
    this.mDevMgr.restartCloudPeriodicUpdate();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */