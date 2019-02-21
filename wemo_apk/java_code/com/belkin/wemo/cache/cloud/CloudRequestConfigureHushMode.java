package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.callback.ConfigureHushModeErrorCallback;
import com.belkin.wemo.cache.devicelist.callback.ConfigureHushModeSuccessCallback;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import org.json.JSONException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class CloudRequestConfigureHushMode
  implements CloudRequestInterface
{
  private final String TAG = CloudRequestConfigureHushMode.class.getSimpleName();
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 45000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/message/";
  private Context context;
  private DeviceInformation deviceInfo;
  private ConfigureHushModeErrorCallback errorCallback;
  private String hushModeValue;
  private ConfigureHushModeSuccessCallback successCallback;
  
  public CloudRequestConfigureHushMode(Context paramContext, DeviceInformation paramDeviceInformation, String paramString, ConfigureHushModeSuccessCallback paramConfigureHushModeSuccessCallback, ConfigureHushModeErrorCallback paramConfigureHushModeErrorCallback)
  {
    this.context = paramContext;
    this.deviceInfo = paramDeviceInformation;
    this.hushModeValue = paramString;
    this.successCallback = paramConfigureHushModeSuccessCallback;
    this.errorCallback = paramConfigureHushModeErrorCallback;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    return "<plugins><plugin><recipientid>" + this.deviceInfo.getPluginID() + "</recipientid>" + "<macAddress>" + this.deviceInfo.getMAC() + "</macAddress>" + "<content>" + "<![CDATA[ <" + "ConfigureHushMode" + ">" + "<" + "hushMode" + ">" + this.hushModeValue + "</" + "hushMode" + ">" + "</" + "ConfigureHushMode" + "> ]]>" + "</content>" + "</plugin>" + "</plugins>";
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
        String str = new String(paramArrayOfByte, "UTF-8");
        SDKLogUtils.infoLog(this.TAG, "Response: " + str);
        this.deviceInfo.setAttributeValue("hushMode", String.valueOf(this.hushModeValue));
        ((Element)new XMLParser().getDomElement(str).getElementsByTagName("plugin").item(0));
        DevicesArray.getInstance(this.context).addOrUpdateDeviceInformation(this.deviceInfo);
        CacheManager.getInstance(this.context).updateDB(this.deviceInfo, true, true, true);
        DeviceListManager.getInstance(this.context).sendNotification("change_state", String.valueOf(paramBoolean), this.deviceInfo.getUDN());
        return;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        SDKLogUtils.errorLog(this.TAG, "UnsupportedEncodingException while parsing response: ", localUnsupportedEncodingException);
        if (this.errorCallback == null) {
          continue;
        }
        this.errorCallback.onConfigureHushModeFailed(localUnsupportedEncodingException.getMessage());
        continue;
      }
      catch (JSONException localJSONException)
      {
        SDKLogUtils.errorLog(this.TAG, "JSONException while updating deviceInfo object and DB: ", localJSONException);
        if (this.errorCallback == null) {
          continue;
        }
        this.errorCallback.onConfigureHushModeFailed(localJSONException.getMessage());
        continue;
      }
      SDKLogUtils.errorLog(this.TAG, "CloudRequestConfigureHushMode failed.");
      if (this.errorCallback != null) {
        this.errorCallback.onConfigureHushModeFailed("CloudRequestConfigureHushMode failed.");
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */