package org.cybergarage.upnp.device;

public class NT
{
  public static final String EVENT = "upnp:event";
  public static final String ROOTDEVICE = "upnp:rootdevice";
  
  public static final boolean isRootDevice(String paramString)
  {
    if (paramString == null) {
      return false;
    }
    return paramString.startsWith("upnp:rootdevice");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/device/NT.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */