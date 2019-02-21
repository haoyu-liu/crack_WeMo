package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.Map;

public class CloudRequestForNestDeactivation
  implements CloudRequestInterface
{
  private final String TAG = CloudRequestForNestDeactivation.class.getSimpleName();
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 30000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/oauth2/v1/subscriber/deauthorize/NestThermostat/";
  private String cloudURL;
  private Context mContext;
  private DeviceListManager mDevMgr;
  
  public CloudRequestForNestDeactivation(DeviceListManager paramDeviceListManager, Context paramContext)
  {
    this.mContext = paramContext;
    this.mDevMgr = paramDeviceListManager;
    CloudAuth localCloudAuth = new CloudAuth(this.mContext);
    this.cloudURL = (this.URL + localCloudAuth.getHomeID());
    SDKLogUtils.infoLog(this.TAG, "Nest deactivation URL " + this.cloudURL);
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
    return 1;
  }
  
  public int getTimeout()
  {
    return this.TIMEOUT;
  }
  
  public int getTimeoutLimit()
  {
    return 30000;
  }
  
  public String getURL()
  {
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
    SDKLogUtils.infoLog(this.TAG, "requestComplete status: " + paramBoolean);
    this.mDevMgr.sendNotification("nest_deauthorization_response", String.valueOf(paramInt), "");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */