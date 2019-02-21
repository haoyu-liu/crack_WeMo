package org.cybergarage.upnp;

import java.util.Vector;

public class DeviceList
  extends Vector
{
  public static final String ELEM_NAME = "deviceList";
  
  public Device getDevice(int paramInt)
  {
    return (Device)get(paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/DeviceList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */