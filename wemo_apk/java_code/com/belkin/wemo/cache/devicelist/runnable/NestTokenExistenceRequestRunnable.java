package com.belkin.wemo.cache.devicelist.runnable;

import android.content.Context;
import com.belkin.wemo.cache.cloud.CloudRequestCheckForNestTokenExistence;
import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;

public class NestTokenExistenceRequestRunnable
  extends WeMoRunnable
{
  private Context context;
  private DeviceListManager deviceListManager;
  
  public NestTokenExistenceRequestRunnable(DeviceListManager paramDeviceListManager, Context paramContext)
  {
    this.deviceListManager = paramDeviceListManager;
    this.context = paramContext;
  }
  
  protected String getLoggerTag()
  {
    return getClass().getSimpleName() + ":" + Thread.currentThread().getId();
  }
  
  public void run()
  {
    SDKLogUtils.infoLog(this.TAG, "Checking Nest Token Existence- ");
    try
    {
      CloudRequestCheckForNestTokenExistence localCloudRequestCheckForNestTokenExistence = new CloudRequestCheckForNestTokenExistence(this.deviceListManager, this.context);
      new CloudRequestManager(this.context).makeRequest(localCloudRequestCheckForNestTokenExistence);
      return;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog(this.TAG, "Exception: ", localException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/runnable/NestTokenExistenceRequestRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */