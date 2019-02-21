package com.belkin.devices.runnable;

import android.content.Context;
import com.belkin.controller.DeviceListController;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.runnable.WeMoRunnable;
import org.apache.cordova.CallbackContext;

public class BridgeDiscoveryRunnable
  extends WeMoRunnable
{
  private CallbackContext mCallbackContext;
  private Context mContext;
  private DeviceListController mDeviceListController;
  
  public BridgeDiscoveryRunnable(Context paramContext, CallbackContext paramCallbackContext)
  {
    this.mContext = paramContext;
    this.mCallbackContext = paramCallbackContext;
    this.mDeviceListController = DeviceListController.getInstance(paramContext);
  }
  
  public void run()
  {
    if (NetworkMode.isLocal())
    {
      this.mDeviceListController.checkBhonjourInNetwork(this.mContext, this.mCallbackContext);
      return;
    }
    LogUtils.debugLog("BridgeRemoveDeviceRunnable", "No Bridge Discovery in Remote Mode");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/devices/runnable/BridgeDiscoveryRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */