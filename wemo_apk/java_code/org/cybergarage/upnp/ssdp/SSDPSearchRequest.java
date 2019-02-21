package org.cybergarage.upnp.ssdp;

import org.cybergarage.net.HostInterface;

public class SSDPSearchRequest
  extends SSDPRequest
{
  public SSDPSearchRequest()
  {
    this("urn:Belkin:service:basicevent:1");
  }
  
  public SSDPSearchRequest(String paramString)
  {
    this(paramString, 2);
  }
  
  public SSDPSearchRequest(String paramString, int paramInt)
  {
    setMethod("M-SEARCH");
    setURI("*");
    setHeader("ST", paramString);
    setHeader("MX", Integer.toString(paramInt));
    setHeader("MAN", "\"ssdp:discover\"");
  }
  
  public void setLocalAddress(String paramString)
  {
    String str = "239.255.255.250";
    if (HostInterface.isIPv6Address(paramString) == true) {
      str = SSDP.getIPv6Address();
    }
    setHost(str, 1900);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/ssdp/SSDPSearchRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */