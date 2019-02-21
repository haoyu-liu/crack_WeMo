package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.InsightParamsCloudResponseParser;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import org.json.JSONObject;

public class CloudRequestGetInsightParams
  implements CloudRequestInterface
{
  private final String TAG = "SDK_CloudRequestGetInsightParams";
  private int TIMEOUT = 10000;
  private final int TIMEOUT_LIMIT = 40000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/insight/message/";
  private Context context;
  private DeviceInformation mDeviceInfo;
  
  public CloudRequestGetInsightParams(Context paramContext, DeviceInformation paramDeviceInformation)
  {
    this.mDeviceInfo = paramDeviceInformation;
    this.context = paramContext;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    String str = "<plugins><plugin><recipientId>" + this.mDeviceInfo.getPluginID() + "</recipientId>" + "<macAddress>" + this.mDeviceInfo.getMAC() + "</macAddress>" + "<content><![CDATA[<getPluginDetails>" + "<plugin>" + "<macAddress>" + this.mDeviceInfo.getMAC() + "</macAddress>" + "</plugin>" + "</getPluginDetails>]]></content>" + "</plugin>" + "</plugins>";
    SDKLogUtils.infoLog("SDK_CloudRequestGetInsightParams", "xmlString:::" + str);
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
    if (paramBoolean) {}
    try
    {
      String str = new String(paramArrayOfByte, "UTF-8");
      SDKLogUtils.infoLog("SDK_CloudRequestGetInsightParams", str);
      JSONObject localJSONObject = new InsightParamsCloudResponseParser().parseGetResponse(str);
      if (localJSONObject.length() > 0)
      {
        DeviceListManager.getInstance(this.context).updateAtributeListForInsightInRemote(localJSONObject, this.mDeviceInfo);
        DeviceListManager.getInstance(this.context).sendNotification("update", "", this.mDeviceInfo.getUDN());
      }
      return;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      SDKLogUtils.errorLog("SDK_CloudRequestGetInsightParams", "UnsupportedEncodingException while parsing API response ", localUnsupportedEncodingException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestGetInsightParams.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */