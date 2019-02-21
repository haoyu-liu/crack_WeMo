package com.belkin.wemo.cache.cloud;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.controlaction.ControlActionHandler;
import com.belkin.wemo.controlaction.callback.ControlActionErrorCallback;
import com.belkin.wemo.controlaction.callback.ControlActionSuccessCallback;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.Device;

public class DeviceReachabilityTester
  implements ControlActionErrorCallback, ControlActionSuccessCallback
{
  private final String TAG;
  private Device device;
  private IDeviceReachabilityListener listener;
  
  public DeviceReachabilityTester(Device paramDevice, IDeviceReachabilityListener paramIDeviceReachabilityListener)
  {
    this.listener = paramIDeviceReachabilityListener;
    this.device = paramDevice;
    this.TAG = getClass().getSimpleName();
  }
  
  public void onActionError(Exception paramException)
  {
    SDKLogUtils.errorLog(this.TAG, "Device is NOT reachable. UDN: " + this.device.getUDN() + "; Response: " + paramException.getMessage());
    if (this.listener != null) {
      this.listener.onDeviceNotReachable();
    }
  }
  
  public void onActionSuccess(String paramString)
  {
    SDKLogUtils.debugLog(this.TAG, "Device is reachable. UDN: " + this.device.getUDN() + "; Action response: " + paramString);
    if (this.listener != null) {
      this.listener.onDeviceReachable();
    }
  }
  
  public void start()
  {
    if (this.device != null)
    {
      localAction = this.device.getAction("GetFriendlyName");
      ControlActionHandler.newInstance().postControlAction(localAction, this, this);
    }
    while (this.listener == null)
    {
      Action localAction;
      return;
    }
    this.listener.onDeviceNotReachable();
  }
  
  public static abstract interface IDeviceReachabilityListener
  {
    public abstract void onDeviceNotReachable();
    
    public abstract void onDeviceReachable();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/DeviceReachabilityTester.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */