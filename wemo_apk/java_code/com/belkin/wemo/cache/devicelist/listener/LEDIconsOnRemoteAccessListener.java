package com.belkin.wemo.cache.devicelist.listener;

import com.belkin.wemo.broadcast.RemoteAccessBroadcastService.RemoteAccessListener;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;

public class LEDIconsOnRemoteAccessListener
  implements RemoteAccessBroadcastService.RemoteAccessListener
{
  private final String TAG;
  private DeviceListManager deviceListManager;
  private boolean isFirstLEDIconRequestIssued;
  
  public LEDIconsOnRemoteAccessListener(DeviceListManager paramDeviceListManager)
  {
    this.deviceListManager = paramDeviceListManager;
    this.TAG = getClass().getSimpleName();
  }
  
  public void onRemoteAccessDisabled() {}
  
  public void onRemoteAccessEnabled()
  {
    if (!this.isFirstLEDIconRequestIssued)
    {
      SDKLogUtils.debugLog(this.TAG, "Remote Access Enabled Notification received. Fetching LED icons.");
      this.deviceListManager.getLEDDeviceIconInfo();
      this.isFirstLEDIconRequestIssued = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/listener/LEDIconsOnRemoteAccessListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */