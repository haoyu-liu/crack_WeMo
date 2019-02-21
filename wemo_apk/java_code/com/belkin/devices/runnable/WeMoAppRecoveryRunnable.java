package com.belkin.devices.runnable;

import android.content.Context;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.runnable.WeMoRunnable;

public class WeMoAppRecoveryRunnable
  extends WeMoRunnable
{
  private DeviceListManager mDeviceListManager = null;
  
  public WeMoAppRecoveryRunnable(Context paramContext)
  {
    this.mDeviceListManager = DeviceListManager.getInstance(paramContext);
  }
  
  public void run()
  {
    this.mDeviceListManager.checkAppRecovery();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/devices/runnable/WeMoAppRecoveryRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */