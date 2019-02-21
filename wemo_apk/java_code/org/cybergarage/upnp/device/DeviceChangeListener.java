package org.cybergarage.upnp.device;

import org.cybergarage.upnp.Device;

public abstract interface DeviceChangeListener
{
  public abstract void deviceAdded(Device paramDevice);
  
  public abstract void deviceRemoved(Device paramDevice);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/device/DeviceChangeListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */