package org.cybergarage.upnp.device;

public class MAN
{
  public static final String DISCOVER = "ssdp:discover";
  
  public static final boolean isDiscover(String paramString)
  {
    boolean bool = true;
    if (paramString == null) {
      bool = false;
    }
    while (paramString.equals("ssdp:discover") == bool) {
      return bool;
    }
    return paramString.equals("\"ssdp:discover\"");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/device/MAN.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */