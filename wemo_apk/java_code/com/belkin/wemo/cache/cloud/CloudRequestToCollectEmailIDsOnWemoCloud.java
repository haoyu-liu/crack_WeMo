package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import java.io.UnsupportedEncodingException;
import java.util.Map;

public class CloudRequestToCollectEmailIDsOnWemoCloud
  implements CloudRequestInterface
{
  private final String TAG = CloudRequestToCollectEmailIDsOnWemoCloud.class.getSimpleName();
  private int TIMEOUT = 10000;
  private final int TIMEOUT_LIMIT = 4;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/emailAddresses";
  Context context;
  private String deviceType;
  private String emailAddress;
  private SharePreferences mSharePreference;
  
  public CloudRequestToCollectEmailIDsOnWemoCloud(Context paramContext, String paramString1, String paramString2, SharePreferences paramSharePreferences)
  {
    this.emailAddress = paramString1;
    this.deviceType = paramString2;
    this.context = paramContext;
    this.mSharePreference = paramSharePreferences;
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    String[] arrayOfString = this.deviceType.split(",");
    Object localObject = null;
    int i = 0;
    if (i < arrayOfString.length)
    {
      SDKLogUtils.infoLog("optDeviceTypes(i): ", arrayOfString[i]);
      String str2 = "<userEmailAddress><modelCode>" + arrayOfString[i] + "</modelCode><emailAddresses><emailAddress>" + this.emailAddress + "</emailAddress></emailAddresses></userEmailAddress>";
      if (localObject != null) {}
      for (localObject = (String)localObject + str2;; localObject = str2)
      {
        SDKLogUtils.infoLog(this.TAG, "userEmailAddressXMLBody: " + (String)localObject);
        i++;
        break;
      }
    }
    String str1 = "<userEmailAddresses>" + (String)localObject + "</userEmailAddresses>";
    SDKLogUtils.infoLog(this.TAG, "XMLBody: " + str1);
    return str1;
  }
  
  public byte[] getFileByteArray()
  {
    return null;
  }
  
  public int getRequestMethod()
  {
    return 4;
  }
  
  public int getTimeout()
  {
    return this.TIMEOUT;
  }
  
  public int getTimeoutLimit()
  {
    return 4;
  }
  
  public String getURL()
  {
    SDKLogUtils.infoLog(this.TAG, "URL: " + this.URL);
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
    SDKLogUtils.infoLog(this.TAG, "success: " + paramBoolean);
    if (paramBoolean) {
      this.mSharePreference.deleteEmailOptDeviceType();
    }
    try
    {
      String str = new String(paramArrayOfByte, "UTF-8");
      SDKLogUtils.infoLog(this.TAG, str);
      return;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      SDKLogUtils.errorLog(this.TAG, "Exception: ", localUnsupportedEncodingException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestToCollectEmailIDsOnWemoCloud.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */