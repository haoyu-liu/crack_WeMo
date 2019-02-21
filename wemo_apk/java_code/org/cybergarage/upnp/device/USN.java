package org.cybergarage.upnp.device;

import com.belkin.wemo.localsdk.WeMoSDKContext;

public class USN
{
  public static final String ROOTDEVICE = "upnp:rootdevice";
  
  public static final String getUDN(String paramString)
  {
    if (paramString == null) {
      return "";
    }
    int i = paramString.indexOf("::");
    if (i < 0) {
      return paramString.trim();
    }
    return WeMoSDKContext.getFilteredUDN(new String(paramString.getBytes(), 0, i).trim());
  }
  
  public static final boolean isRootDevice(String paramString)
  {
    if (paramString == null) {
      return false;
    }
    return paramString.endsWith("upnp:rootdevice");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/device/USN.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */