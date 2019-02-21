package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.Map;

public class HTTPRequestUnicastDiscovery
  implements CloudRequestInterface
{
  private static final String TAG = HTTPRequestUnicastDiscovery.class.getSimpleName();
  private final String SETUP_XML = "/setup.xml";
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 45000;
  private final String URL;
  private OnRequestCompleteListener onRequestCompleteListener;
  
  public HTTPRequestUnicastDiscovery(String paramString, int paramInt, OnRequestCompleteListener paramOnRequestCompleteListener)
  {
    this.onRequestCompleteListener = paramOnRequestCompleteListener;
    this.URL = ("http://" + paramString + ":" + paramInt + "/setup.xml");
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
    return false;
  }
  
  public void requestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    SDKLogUtils.debugLog(TAG, "Unicast response: " + String.valueOf(paramArrayOfByte));
    if (this.onRequestCompleteListener != null) {
      this.onRequestCompleteListener.onRequestComplete(paramBoolean, paramInt, paramArrayOfByte);
    }
  }
  
  public void setOnRequestCompleteListener(OnRequestCompleteListener paramOnRequestCompleteListener)
  {
    this.onRequestCompleteListener = paramOnRequestCompleteListener;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/HTTPRequestUnicastDiscovery.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */