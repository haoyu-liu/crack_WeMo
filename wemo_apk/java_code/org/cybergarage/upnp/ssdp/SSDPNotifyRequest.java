package org.cybergarage.upnp.ssdp;

public class SSDPNotifyRequest
  extends SSDPRequest
{
  public SSDPNotifyRequest()
  {
    setMethod("NOTIFY");
    setURI("*");
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/ssdp/SSDPNotifyRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */