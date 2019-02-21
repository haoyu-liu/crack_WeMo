package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.StringUtils;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class CloudRequestChangeAttributes
  implements CloudRequestInterface
{
  private final String TAG = "SDK_CloudRequestChangeAttributes";
  private int TIMEOUT = 10000;
  private final int TIMEOUT_LIMIT = 30000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/message/";
  private JSONObject changedAttributeList;
  private CacheManager mCacheManager;
  private DeviceListManager mDevMgr;
  private DeviceInformation mDeviceInfo;
  private DevicesArray mDevicesArray;
  private String mac;
  private String pluginID;
  private String status;
  private String udn;
  
  public CloudRequestChangeAttributes(Context paramContext, String paramString, JSONObject paramJSONObject)
  {
    this.mDevMgr = DeviceListManager.getInstance(paramContext);
    this.mDevicesArray = DevicesArray.getInstance();
    this.mCacheManager = CacheManager.getInstance(paramContext);
    this.mDeviceInfo = this.mDevicesArray.getDeviceInformation(paramString);
    this.pluginID = this.mDeviceInfo.getPluginID();
    this.mac = this.mDeviceInfo.getMAC();
    this.udn = paramString;
    this.changedAttributeList = paramJSONObject;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    localStringBuffer = new StringBuffer();
    Iterator localIterator = this.changedAttributeList.keys();
    try
    {
      while (localIterator.hasNext())
      {
        String str1 = (String)localIterator.next();
        String str2 = String.valueOf(this.changedAttributeList.get(str1));
        localStringBuffer.append("<attribute>");
        localStringBuffer.append("<name>");
        localStringBuffer.append(StringUtils.toUpperCamelCase(str1));
        localStringBuffer.append("</name>");
        localStringBuffer.append("<value>");
        localStringBuffer.append(str2);
        localStringBuffer.append("</value>");
        localStringBuffer.append("</attribute>");
      }
      return "<plugins>\n    <plugin>                 \n        <recipientId>" + this.pluginID + "</recipientId>                    \n" + "        <macAddress>" + this.mac + "</macAddress>\n" + "        <content>                          \n" + "            <![CDATA[ <pluginSetDeviceStatus>\n" + "                            <plugin>                                               \n" + "                                <pluginId>" + this.pluginID + "</pluginId>                                                 \n" + "                                <macAddress>" + this.mac + "</macAddress> \n" + "                                <status>" + this.status + "</status>\n" + "                    <attributeLists action=\"SetAttributes\" >" + localStringBuffer + "</attributeLists>\n" + "                            </plugin>\n" + "                      </pluginSetDeviceStatus > ]]>            \n" + "        </content>    \n" + "    </plugin>\n" + "</plugins>";
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
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
    return 30000;
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
    SDKLogUtils.infoLog("setNewAttributesForDevice: ", "success: " + paramBoolean);
    if (paramBoolean)
    {
      String str2;
      try
      {
        String str1 = new String(paramArrayOfByte, "UTF-8");
        SDKLogUtils.infoLog("SDK_CloudRequestChangeAttributes", str1);
        if (str1 == null) {
          break label236;
        }
        str2 = "";
        JSONObject localJSONObject1 = this.mDeviceInfo.getAttributeList();
        Iterator localIterator = this.changedAttributeList.keys();
        while (localIterator.hasNext())
        {
          String str3 = (String)localIterator.next();
          try
          {
            JSONObject localJSONObject2 = (JSONObject)localJSONObject1.get(str3);
            str2 = String.valueOf(this.changedAttributeList.opt(str3));
            localJSONObject2.put("value", this.changedAttributeList.opt(str3));
            localJSONObject1.put(str3, localJSONObject2);
          }
          catch (JSONException localJSONException)
          {
            localJSONException.printStackTrace();
          }
        }
        this.mDeviceInfo.setAttributeList(localJSONObject1);
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        SDKLogUtils.errorLog("SDK_CloudRequestChangeAttributes", "error in setattributes", localUnsupportedEncodingException);
        return;
      }
      if (str2 != "")
      {
        this.mDeviceInfo.setBinaryState(str2);
        this.mDeviceInfo.setState(Integer.parseInt(str2));
      }
      this.mDevicesArray.addOrUpdateDeviceInformation(this.mDeviceInfo);
      this.mCacheManager.updateDB(this.mDeviceInfo, false, false, true);
      label236:
      this.mDevMgr.sendNotification("set_state", Boolean.toString(paramBoolean), this.mDeviceInfo.getUDN());
      return;
    }
    this.mDevMgr.sendNotification("set_state", Boolean.toString(paramBoolean), this.mDeviceInfo.getUDN());
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestChangeAttributes.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */