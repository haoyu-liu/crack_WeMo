package org.cybergarage.upnp.ssdp;

import org.cybergarage.util.Debug;

public class SSDP
{
  public static final String ADDRESS = "239.255.255.250";
  public static final int DEFAULT_MSEARCH_MX = 2;
  private static String IPV6_ADDRESS;
  public static final String IPV6_ADMINISTRATIVE_ADDRESS = "FF04::C";
  public static final String IPV6_GLOBAL_ADDRESS = "FF0E::C";
  public static final String IPV6_LINK_LOCAL_ADDRESS = "FF02::C";
  public static final String IPV6_SITE_LOCAL_ADDRESS = "FF05::C";
  public static final String IPV6_SUBNET_ADDRESS = "FF03::C";
  public static final int PORT = 1900;
  public static final int RECV_MESSAGE_BUFSIZE = 1024;
  
  static
  {
    setIPv6Address("FF02::C");
  }
  
  public static final String getIPv6Address()
  {
    return IPV6_ADDRESS;
  }
  
  public static final int getLeaseTime(String paramString)
  {
    int i = paramString.indexOf("max-age");
    int j = 0;
    int k;
    if (i >= 0)
    {
      k = paramString.indexOf(',', i);
      if (k < 0) {
        k = paramString.length();
      }
    }
    try
    {
      int m = Integer.parseInt(paramString.substring(1 + paramString.indexOf("=", i), k).trim());
      j = m;
      return j;
    }
    catch (Exception localException)
    {
      Debug.warning(localException);
    }
    return 0;
  }
  
  public static final void setIPv6Address(String paramString)
  {
    IPV6_ADDRESS = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/ssdp/SSDP.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */