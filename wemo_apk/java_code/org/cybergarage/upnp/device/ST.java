package org.cybergarage.upnp.device;

public class ST
{
  public static final String ALL_DEVICE = "ssdp:all";
  public static final String ROOT_DEVICE = "urn:Belkin:service:basicevent:1";
  public static final String URN_DEVICE = "urn:schemas-upnp-org:device:";
  public static final String URN_SERVICE = "urn:schemas-upnp-org:service:";
  public static final String UUID_DEVICE = "uuid";
  
  public static final boolean isAllDevice(String paramString)
  {
    boolean bool = true;
    if (paramString == null) {
      bool = false;
    }
    while (paramString.equals("ssdp:all") == bool) {
      return bool;
    }
    return paramString.equals("\"ssdp:all\"");
  }
  
  public static final boolean isRootDevice(String paramString)
  {
    boolean bool = true;
    if (paramString == null) {
      bool = false;
    }
    while (paramString.contains("urn:Belkin:service:basicevent:1") == bool) {
      return bool;
    }
    return paramString.equals("\"urn:Belkin:service:basicevent:1\"");
  }
  
  public static final boolean isURNDevice(String paramString)
  {
    boolean bool = true;
    if (paramString == null) {
      bool = false;
    }
    while (paramString.startsWith("urn:schemas-upnp-org:device:") == bool) {
      return bool;
    }
    return paramString.startsWith("\"urn:schemas-upnp-org:device:");
  }
  
  public static final boolean isURNService(String paramString)
  {
    boolean bool = true;
    if (paramString == null) {
      bool = false;
    }
    while (paramString.startsWith("urn:schemas-upnp-org:service:") == bool) {
      return bool;
    }
    return paramString.startsWith("\"urn:schemas-upnp-org:service:");
  }
  
  public static final boolean isUUIDDevice(String paramString)
  {
    boolean bool = true;
    if (paramString == null) {
      bool = false;
    }
    while (paramString.startsWith("uuid") == bool) {
      return bool;
    }
    return paramString.startsWith("\"uuid");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/device/ST.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */