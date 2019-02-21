package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.Map;

public class CloudRequestGetDBVersion
  implements CloudRequestInterface
{
  private final String TAG = CloudRequestGetDBVersion.class.getSimpleName();
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 45000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/message/";
  private String mac;
  private String modelCode;
  private OnRequestCompleteListener onRequestCompleteListener;
  private String pluginID;
  
  public CloudRequestGetDBVersion(String paramString1, String paramString2, String paramString3, OnRequestCompleteListener paramOnRequestCompleteListener)
  {
    this.pluginID = paramString1;
    this.mac = paramString2;
    this.modelCode = paramString3;
    this.onRequestCompleteListener = paramOnRequestCompleteListener;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    return "<plugins><plugin><recipientId>" + this.pluginID + "</recipientId>" + "<macAddress>" + this.mac + "</macAddress>" + "<modelCode>" + this.modelCode + "</modelCode>" + "<content>" + "<![CDATA[ <getDbVersion>" + "<plugin>" + "<pluginId>" + this.pluginID + "</pluginId>" + "<macAddress>" + this.mac + "</macAddress>" + "</plugin>" + "</getDbVersion> ]]>" + "</content>" + "</plugin>" + "</plugins>";
  }
  
  public byte[] getFileByteArray()
  {
    return null;
  }
  
  public OnRequestCompleteListener getOnRequestCompleteListener()
  {
    return this.onRequestCompleteListener;
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
    SDKLogUtils.infoLog(this.TAG, "GetDBVersion Cloud request completed. Status code: " + paramInt);
    if (this.onRequestCompleteListener != null) {
      this.onRequestCompleteListener.onRequestComplete(paramBoolean, paramInt, paramArrayOfByte);
    }
  }
  
  public void setOnRequestCompleteListener(OnRequestCompleteListener paramOnRequestCompleteListener)
  {
    this.onRequestCompleteListener = paramOnRequestCompleteListener;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestGetDBVersion.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */