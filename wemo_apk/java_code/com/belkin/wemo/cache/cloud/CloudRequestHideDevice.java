package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.io.UnsupportedEncodingException;
import java.util.Map;

public class CloudRequestHideDevice
  implements CloudRequestInterface
{
  private final String TAG = "SDK_CloudRequestHideDevice";
  private int TIMEOUT = 10000;
  private final int TIMEOUT_LIMIT = 40000;
  private String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/property/";
  
  public CloudRequestHideDevice(Context paramContext, String paramString) {}
  
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
    if (paramBoolean)
    {
      SDKLogUtils.infoLog("SDK_CloudRequestHideDevice", "Success cloud request for hide device");
      try
      {
        String str = new String(paramArrayOfByte, "UTF-8");
        SDKLogUtils.infoLog("SDK_CloudRequestHideDevice", "Cloud response: " + str);
        return;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        SDKLogUtils.errorLog("SDK_CloudRequestHideDevice", "Error on try to read the response: " + localUnsupportedEncodingException);
        localUnsupportedEncodingException.printStackTrace();
        return;
      }
    }
    SDKLogUtils.errorLog("SDK_CloudRequestHideDevice", "Cloud request for hide device failed");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestHideDevice.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */