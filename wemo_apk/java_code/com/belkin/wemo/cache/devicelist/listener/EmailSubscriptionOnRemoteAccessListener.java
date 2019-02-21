package com.belkin.wemo.cache.devicelist.listener;

import com.belkin.wemo.broadcast.RemoteAccessBroadcastService.RemoteAccessListener;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;

public class EmailSubscriptionOnRemoteAccessListener
  implements RemoteAccessBroadcastService.RemoteAccessListener
{
  private final String TAG = getClass().getSimpleName();
  private DeviceListManager deviceListManager;
  private boolean isFirstEmailSubscriptionRequestIssued;
  boolean optFlag;
  
  public void onRemoteAccessDisabled() {}
  
  public void onRemoteAccessEnabled()
  {
    if (!this.isFirstEmailSubscriptionRequestIssued)
    {
      SDKLogUtils.debugLog(this.TAG, "Remote Access Enabled Notification received. Fetching Nest Devices.");
      this.deviceListManager.collectEmailIDToCloud();
      this.isFirstEmailSubscriptionRequestIssued = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/listener/EmailSubscriptionOnRemoteAccessListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */