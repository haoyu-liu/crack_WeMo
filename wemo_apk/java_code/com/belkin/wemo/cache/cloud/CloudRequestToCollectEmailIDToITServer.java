package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.Map;

public class CloudRequestToCollectEmailIDToITServer
  implements CloudRequestInterface
{
  private static final String TAG = CloudRequestToCollectEmailIDToITServer.class.getSimpleName();
  private static final int TIMEOUT_LIMIT = 240000;
  private static final String URL = "http://www.belkin.com/signup/wemo/?";
  private int TIMEOUT = 60000;
  private String cloudURL;
  Context context;
  private String deviceType;
  private String emailAddress;
  
  public CloudRequestToCollectEmailIDToITServer(Context paramContext, String paramString1, String paramString2)
  {
    this.emailAddress = paramString1;
    this.deviceType = paramString2;
    this.context = paramContext;
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
    String[] arrayOfString = this.deviceType.split(",");
    Object localObject = null;
    int i = 0;
    if (i < arrayOfString.length)
    {
      SDKLogUtils.infoLog("optDeviceTypes(i): ", arrayOfString[i]);
      String str = "email=" + this.emailAddress + "&DeviceType=" + arrayOfString[i];
      if (localObject != null) {}
      for (localObject = (String)localObject + str;; localObject = str)
      {
        i++;
        break;
      }
    }
    this.cloudURL = ("http://www.belkin.com/signup/wemo/?" + (String)localObject);
    SDKLogUtils.infoLog(TAG, "cloudURL - " + this.cloudURL);
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
    SDKLogUtils.infoLog(TAG, "success: " + paramBoolean);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestToCollectEmailIDToITServer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */