package org.cybergarage.upnp.event;

import org.cybergarage.http.HTTPResponse;
import org.cybergarage.upnp.UPnP;

public class SubscriptionResponse
  extends HTTPResponse
{
  public SubscriptionResponse()
  {
    setServer(UPnP.getServerName());
  }
  
  public SubscriptionResponse(HTTPResponse paramHTTPResponse)
  {
    super(paramHTTPResponse);
  }
  
  public String getSID()
  {
    return Subscription.getSID(getHeaderValue("SID"));
  }
  
  public long getTimeout()
  {
    return Subscription.getTimeout(getHeaderValue("TIMEOUT"));
  }
  
  public void setErrorResponse(int paramInt)
  {
    setStatusCode(paramInt);
    setContentLength(0L);
  }
  
  public void setResponse(int paramInt)
  {
    setStatusCode(paramInt);
    setContentLength(0L);
  }
  
  public void setSID(String paramString)
  {
    setHeader("SID", Subscription.toSIDHeaderString(paramString));
  }
  
  public void setTimeout(long paramLong)
  {
    setHeader("TIMEOUT", Subscription.toTimeoutHeaderString(paramLong));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/event/SubscriptionResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */