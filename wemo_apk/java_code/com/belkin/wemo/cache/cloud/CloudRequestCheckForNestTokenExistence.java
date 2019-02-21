package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.Map;

public class CloudRequestCheckForNestTokenExistence
  implements CloudRequestInterface
{
  private final String TAG = CloudRequestCheckForNestTokenExistence.class.getSimpleName();
  private int TIMEOUT = 20000;
  private final int TIMEOUT_LIMIT = 40000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/oauth2/v1/subscriber/authStatus/NestThermostat/";
  private String cloudURL;
  private Context mContext;
  private DeviceListManager mDevMgr;
  
  public CloudRequestCheckForNestTokenExistence(DeviceListManager paramDeviceListManager, Context paramContext)
  {
    this.mContext = paramContext;
    this.mDevMgr = paramDeviceListManager;
    CloudAuth localCloudAuth = new CloudAuth(this.mContext);
    this.cloudURL = (this.URL + localCloudAuth.getHomeID());
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    return null;
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
    return 40000;
  }
  
  public String getURL()
  {
    SDKLogUtils.infoLog(this.TAG, "URL- " + this.cloudURL);
    return this.cloudURL;
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
    SDKLogUtils.infoLog(this.TAG, "Nest Token Existence success: " + paramBoolean + " -statusCode- " + paramInt);
    this.mDevMgr.sendNotification("nest_auth_token_existence", String.valueOf(paramInt), "");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestCheckForNestTokenExistence.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */