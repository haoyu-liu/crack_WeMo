package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.Map;

public class RMCloudRequestGetDBFile
  implements CloudRequestInterface
{
  private static final String TAG = RMCloudRequestGetDBFile.class.getSimpleName();
  private final String BASE_URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/dbfile/";
  private int TIMEOUT = 60000;
  private final int TIMEOUT_LIMIT = 240000;
  private String mac;
  private OnRequestCompleteListener onRequestCompleteListener;
  
  public RMCloudRequestGetDBFile(String paramString, OnRequestCompleteListener paramOnRequestCompleteListener)
  {
    this.mac = paramString;
    this.onRequestCompleteListener = paramOnRequestCompleteListener;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    return "";
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
    return 2;
  }
  
  public int getTimeout()
  {
    return this.TIMEOUT;
  }
  
  public int getTimeoutLimit()
  {
    return 240000;
  }
  
  public String getURL()
  {
    return this.BASE_URL + this.mac;
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
    SDKLogUtils.infoLog(TAG, "GetDBVersion Cloud request completed. Status code: " + paramInt);
    if (this.onRequestCompleteListener != null) {
      this.onRequestCompleteListener.onRequestComplete(paramBoolean, paramInt, paramArrayOfByte);
    }
  }
  
  public void setOnRequestCompleteListener(OnRequestCompleteListener paramOnRequestCompleteListener)
  {
    this.onRequestCompleteListener = paramOnRequestCompleteListener;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */