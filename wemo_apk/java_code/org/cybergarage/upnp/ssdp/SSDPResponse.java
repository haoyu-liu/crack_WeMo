package org.cybergarage.upnp.ssdp;

import java.io.InputStream;
import org.cybergarage.http.HTTPResponse;

public class SSDPResponse
  extends HTTPResponse
{
  public SSDPResponse()
  {
    setVersion("1.1");
  }
  
  public SSDPResponse(InputStream paramInputStream)
  {
    super(paramInputStream);
  }
  
  public String getHeader()
  {
    StringBuffer localStringBuffer = new StringBuffer();
    localStringBuffer.append(getStatusLineString());
    localStringBuffer.append(getHeaderString());
    localStringBuffer.append("\r\n");
    return localStringBuffer.toString();
  }
  
  public int getLeaseTime()
  {
    return SSDP.getLeaseTime(getHeaderValue("Cache-Control"));
  }
  
  public String getLocation()
  {
    return getHeaderValue("Location");
  }
  
  public String getMYNAME()
  {
    return getHeaderValue("MYNAME");
  }
  
  public String getST()
  {
    return getHeaderValue("ST");
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
  
  public void setMYNAME(String paramString)
  {
    setHeader("MYNAME", paramString);
  }
  
  public void setST(String paramString)
  {
    setHeader("ST", paramString);
  }
  
  public void setUSN(String paramString)
  {
    setHeader("USN", paramString);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/ssdp/SSDPResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */