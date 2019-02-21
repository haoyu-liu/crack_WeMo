package com.belkin.wemo.cache.devicelist.listener;

import com.belkin.wemo.broadcast.RemoteAccessBroadcastService.RemoteAccessListener;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;

public class NestDevicesOnRemoteAccessListener
  implements RemoteAccessBroadcastService.RemoteAccessListener
{
  private final String TAG;
  private DeviceListManager deviceListManager;
  private boolean isFirstNestDeviceRequestIssued;
  
  public NestDevicesOnRemoteAccessListener(DeviceListManager paramDeviceListManager)
  {
    this.deviceListManager = paramDeviceListManager;
    this.TAG = getClass().getSimpleName();
  }
  
  public void onRemoteAccessDisabled() {}
  
  public void onRemoteAccessEnabled()
  {
    if (!this.isFirstNestDeviceRequestIssued)
    {
      SDKLogUtils.debugLog(this.TAG, "Remote Access Enabled Notification received. Fetching Nest Devices.");
      this.deviceListManager.getNestDevicesFromCloud();
      this.isFirstNestDeviceRequestIssued = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/listener/NestDevicesOnRemoteAccessListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */