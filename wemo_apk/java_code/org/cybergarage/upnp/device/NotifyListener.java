package org.cybergarage.upnp.device;

import org.cybergarage.upnp.ssdp.SSDPPacket;

public abstract interface NotifyListener
{
  public abstract void deviceNotifyReceived(SSDPPacket paramSSDPPacket);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/device/NotifyListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */