package com.belkin.wemo.cache.cloud;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.callback.SetNightModeErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.SetNightModeSuccessCallback;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import org.json.JSONException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class CloudRequestSetNightModeConfiguration
  implements CloudRequestInterface
{
  private final String TAG = CloudRequestSetNightModeConfiguration.class.getSimpleName();
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 45000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/message/";
  private Context context;
  private DeviceInformation deviceInfo;
  private int endTime;
  private SetNightModeErrorCallback errorCallback;
  private int nightMode;
  private int nightModeBrightness;
  private int startTime;
  private SetNightModeSuccessCallback successCallback;
  
  public CloudRequestSetNightModeConfiguration(Context paramContext, DeviceInformation paramDeviceInformation, int paramInt1, int paramInt2, int paramInt3, int paramInt4, SetNightModeSuccessCallback paramSetNightModeSuccessCallback, SetNightModeErrorCallback paramSetNightModeErrorCallback)
  {
    this.context = paramContext;
    this.deviceInfo = paramDeviceInformation;
    this.startTime = paramInt3;
    this.endTime = paramInt4;
    this.nightMode = paramInt1;
    this.nightModeBrightness = paramInt2;
    this.successCallback = paramSetNightModeSuccessCallback;
    this.errorCallback = paramSetNightModeErrorCallback;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    return "<plugins><plugin><recipientid>" + this.deviceInfo.getPluginID() + "</recipientid>" + "<macAddress>" + this.deviceInfo.getMAC() + "</macAddress>" + "<content>" + "<![CDATA[ <" + "NightModeConfiguration" + ">" + "<" + "nightMode" + ">" + this.nightMode + "</" + "nightMode" + ">" + "<" + "endTime" + ">" + this.endTime + "</" + "endTime" + ">" + "<" + "startTime" + ">" + this.startTime + "</" + "startTime" + ">" + "<" + "nightModeBrightness" + ">" + this.nightModeBrightness + "</" + "nightModeBrightness" + ">" + "</" + "NightModeConfiguration" + "> ]]>" + "</content>" + "</plugin>" + "</plugins>";
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
    SDKLogUtils.infoLog(this.TAG, "isSuccess: " + paramBoolean);
    if (paramBoolean) {}
    for (;;)
    {
      try
      {
        String str1 = new String(paramArrayOfByte, "UTF-8");
        SDKLogUtils.infoLog(this.TAG, "Response: " + str1);
        this.deviceInfo.setAttributeValue("nightMode", String.valueOf(this.nightMode));
        this.deviceInfo.setAttributeValue("startTime", String.valueOf(this.startTime));
        this.deviceInfo.setAttributeValue("endTime", String.valueOf(this.endTime));
        this.deviceInfo.setAttributeValue("nightModeBrightness", String.valueOf(this.nightModeBrightness));
        XMLParser localXMLParser = new XMLParser();
        String str2 = localXMLParser.getValue((Element)localXMLParser.getDomElement(str1).getElementsByTagName("plugin").item(0), "brightness");
        if (!TextUtils.isEmpty(str2)) {
          this.deviceInfo.setAttributeValue("brightness", str2);
        }
        DevicesArray.getInstance(this.context).addOrUpdateDeviceInformation(this.deviceInfo);
        CacheManager.getInstance(this.context).updateDB(this.deviceInfo, true, true, true);
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        SDKLogUtils.errorLog(this.TAG, "UnsupportedEncodingException while parsing response: ", localUnsupportedEncodingException);
        if (this.errorCallback == null) {
          continue;
        }
        this.errorCallback.onNightModeConfigurationFailed(localUnsupportedEncodingException.getMessage());
        continue;
      }
      catch (JSONException localJSONException)
      {
        SDKLogUtils.errorLog(this.TAG, "JSONException while updating deviceInfo object and DB: ", localJSONException);
        if (this.errorCallback == null) {
          continue;
        }
        this.errorCallback.onNightModeConfigurationFailed(localJSONException.getMessage());
        continue;
      }
      DeviceListManager.getInstance(this.context).sendNotification("change_state", String.valueOf(paramBoolean), this.deviceInfo.getUDN());
      return;
      SDKLogUtils.errorLog(this.TAG, "CloudRequestSetNightModeConfiguration failed.");
      if (this.errorCallback != null) {
        this.errorCallback.onNightModeConfigurationFailed("CloudRequestSetNightModeConfiguration failed.");
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */