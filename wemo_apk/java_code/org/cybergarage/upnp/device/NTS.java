package org.cybergarage.upnp.device;

public class NTS
{
  public static final String ALIVE = "ssdp:alive";
  public static final String BYEBYE = "ssdp:byebye";
  public static final String PROPCHANGE = "upnp:propchange";
  
  public static final boolean isAlive(String paramString)
  {
    if (paramString == null) {
      return false;
    }
    return paramString.startsWith("ssdp:alive");
  }
  
  public static final boolean isByeBye(String paramString)
  {
    if (paramString == null) {
      return false;
    }
    return paramString.startsWith("ssdp:byebye");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/device/NTS.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */