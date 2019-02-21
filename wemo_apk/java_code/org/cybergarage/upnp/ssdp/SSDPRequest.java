package org.cybergarage.upnp.ssdp;

import java.io.InputStream;
import org.cybergarage.http.HTTPRequest;

public class SSDPRequest
  extends HTTPRequest
{
  public SSDPRequest()
  {
    setVersion("1.1");
  }
  
  public SSDPRequest(InputStream paramInputStream)
  {
    super(paramInputStream);
  }
  
  public int getLeaseTime()
  {
    return SSDP.getLeaseTime(getHeaderValue("Cache-Control"));
  }
  
  public String getLocation()
  {
    return getHeaderValue("Location");
  }
  
  public String getNT()
  {
    return getHeaderValue("NT");
  }
  
  public String getNTS()
  {
    return getHeaderValue("NTS");
  }
  
  public String getUSN()
  {
    return getHeaderValue("USN");
  }
  
  public void setLeaseTime(int paramInt)
  {
    setHeader("Cache-Control", "max-age=" + Integer.toString(paramInt));
  }
  
  public void setLocation(String paramString)
  {
    setHeader("Location", paramString);
  }
  
  public void setNT(String paramString)
  {
    setHeader("NT", paramString);
  }
  
  public void setNTS(String paramString)
  {
    setHeader("NTS", paramString);
  }
  
  public void setUSN(String paramString)
  {
    setHeader("USN", paramString);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/ssdp/SSDPRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */