package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.remoteaccess.RemoteAccessManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.Map;

public class CloudRequestGetDeviceFromCloud
  implements CloudRequestInterface
{
  private static final String TAG = CloudRequestGetDeviceFromCloud.class.getSimpleName();
  private static final int TIMEOUT_LIMIT = 240000;
  private static final String URL = CloudConstants.CLOUD_URL + "/apis/http/device/peerLocalAddresses/";
  private int TIMEOUT = 60000;
  private String cloudURL;
  private OnRequestCompleteListener onRequestCompleteListener;
  
  public CloudRequestGetDeviceFromCloud(RemoteAccessManager paramRemoteAccessManager, String paramString, OnRequestCompleteListener paramOnRequestCompleteListener)
  {
    this.onRequestCompleteListener = paramOnRequestCompleteListener;
    if (paramRemoteAccessManager.isRemoteEnabled())
    {
      this.cloudURL = (URL + paramString + "/" + paramRemoteAccessManager.getHomeId());
      return;
    }
    this.cloudURL = (URL + paramString);
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
    SDKLogUtils.infoLog(TAG, "CloudCache: URL - " + this.cloudURL);
    return this.cloudURL;
  }
  
  public String getUploadFileName()
  {
    return null;
  }
  
  public boolean isAuthHeaderRequired()
  {
    return false;
  }
  
  public void requestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    try
    {
      SDKLogUtils.infoLog(TAG, "CloudCache: CloudRequestGetDeviceFromCloud completed. Status code: " + paramInt);
      if (this.onRequestCompleteListener != null) {
        this.onRequestCompleteListener.onRequestComplete(paramBoolean, paramInt, paramArrayOfByte);
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void setOnRequestCompleteListener(OnRequestCompleteListener paramOnRequestCompleteListener)
  {
    this.onRequestCompleteListener = paramOnRequestCompleteListener;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */