package org.cybergarage.upnp.ssdp;

import org.cybergarage.upnp.UPnP;

public class SSDPSearchResponse
  extends SSDPResponse
{
  public SSDPSearchResponse()
  {
    setStatusCode(200);
    setCacheControl(1800);
    setHeader("Server", UPnP.getServerName());
    setHeader("EXT", "");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/ssdp/SSDPSearchResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */