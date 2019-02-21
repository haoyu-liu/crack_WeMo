package com.belkin.wemo.cache.devicelist.runnable;

import android.content.Context;
import com.belkin.wemo.broadcast.RemoteAccessBroadcastService;
import com.belkin.wemo.cache.cloud.CloudRequestGetNestDevice;
import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.listener.NestDevicesOnRemoteAccessListener;
import com.belkin.wemo.cache.remoteaccess.RemoteAccessManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;

public class GetNestDevicesRequestRunnable
  extends WeMoRunnable
{
  private Context context;
  private DeviceListManager deviceListManager;
  private NestDevicesOnRemoteAccessListener nestDevicesOnRemoteAccessListener;
  private RemoteAccessManager remoteAccessManager;
  
  public GetNestDevicesRequestRunnable(DeviceListManager paramDeviceListManager, RemoteAccessManager paramRemoteAccessManager, Context paramContext)
  {
    this.deviceListManager = paramDeviceListManager;
    this.context = paramContext;
    this.remoteAccessManager = paramRemoteAccessManager;
  }
  
  protected String getLoggerTag()
  {
    return getClass().getSimpleName() + ":" + Thread.currentThread().getId();
  }
  
  public void run()
  {
    SDKLogUtils.infoLog(this.TAG, "Nest remoteHomeDevices API called; is remote enabled: " + this.remoteAccessManager.isRemoteEnabled());
    if (this.remoteAccessManager.isRemoteEnabled()) {}
    do
    {
      try
      {
        CloudRequestGetNestDevice localCloudRequestGetNestDevice = new CloudRequestGetNestDevice(this.deviceListManager, this.context);
        new CloudRequestManager(this.context).makeRequest(localCloudRequestGetNestDevice);
        return;
      }
      catch (Exception localException)
      {
        SDKLogUtils.errorLog(this.TAG, "Exception: ", localException);
        return;
      }
      SDKLogUtils.errorLog(this.TAG, "makeCloudRequestForNestDevice(): ERROR - Remote access is not enabled.");
    } while (this.nestDevicesOnRemoteAccessListener != null);
    this.nestDevicesOnRemoteAccessListener = new NestDevicesOnRemoteAccessListener(this.deviceListManager);
    RemoteAccessBroadcastService.getInstance().addRemoteAccessListener(this.nestDevicesOnRemoteAccessListener);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/runnable/GetNestDevicesRequestRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */