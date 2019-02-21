package org.cybergarage.upnp.event;

import org.cybergarage.http.HTTP;
import org.cybergarage.http.HTTPRequest;
import org.cybergarage.upnp.Device;
import org.cybergarage.upnp.Service;

public class SubscriptionRequest
  extends HTTPRequest
{
  private static final String CALLBACK_END_WITH = ">";
  private static final String CALLBACK_START_WITH = "<";
  
  public SubscriptionRequest()
  {
    setContentLength(0L);
  }
  
  public SubscriptionRequest(HTTPRequest paramHTTPRequest)
  {
    this();
    set(paramHTTPRequest);
  }
  
  private void setService(Service paramService)
  {
    String str1 = paramService.getEventSubURL();
    setURI(str1, true);
    String str2 = "";
    Device localDevice1 = paramService.getDevice();
    if (localDevice1 != null) {
      str2 = localDevice1.getURLBase();
    }
    if ((str2 == null) || (str2.length() <= 0))
    {
      Device localDevice2 = paramService.getRootDevice();
      if (localDevice2 != null) {
        str2 = localDevice2.getURLBase();
      }
    }
    if ((str2 == null) || (str2.length() <= 0))
    {
      Device localDevice3 = paramService.getRootDevice();
      if (localDevice3 != null) {
        str2 = localDevice3.getLocation();
      }
    }
    if (((str2 == null) || (str2.length() <= 0)) && (HTTP.isAbsoluteURL(str1))) {
      str2 = str1;
    }
    String str3 = HTTP.getHost(str2);
    int i = HTTP.getPort(str2);
    setHost(str3, i);
    setRequestHost(str3);
    setRequestPort(i);
  }
  
  public String getCallback()
  {
    return getStringHeaderValue("CALLBACK", "<", ">");
  }
  
  public String getNT()
  {
    return getHeaderValue("NT");
  }
  
  public String getSID()
  {
    String str = Subscription.getSID(getHeaderValue("SID"));
    if (str == null) {
      str = "";
    }
    return str;
  }
  
  public long getTimeout()
  {
    return Subscription.getTimeout(getHeaderValue("TIMEOUT"));
  }
  
  public boolean hasCallback()
  {
    String str = getCallback();
    return (str != null) && (str.length() > 0);
  }
  
  public boolean hasNT()
  {
    String str = getNT();
    return (str != null) && (str.length() > 0);
  }
  
  public boolean hasSID()
  {
    String str = getSID();
    return (str != null) && (str.length() > 0);
  }
  
  public SubscriptionResponse post()
  {
    return new SubscriptionResponse(post(getRequestHost(), getRequestPort()));
  }
  
  public void post(SubscriptionResponse paramSubscriptionResponse)
  {
    super.post(paramSubscriptionResponse);
  }
  
  public void setCallback(String paramString)
  {
    setStringHeader("CALLBACK", paramString, "<", ">");
  }
  
  public void setNT(String paramString)
  {
    setHeader("NT", paramString);
  }
  
  public void setRenewRequest(Service paramService, String paramString, long paramLong)
  {
    setMethod("SUBSCRIBE");
    setService(paramService);
    setSID(paramString);
    setTimeout(paramLong);
  }
  
  public void setSID(String paramString)
  {
    setHeader("SID", Subscription.toSIDHeaderString(paramString));
  }
  
  public void setSubscribeRequest(Service paramService, String paramString, long paramLong)
  {
    setMethod("SUBSCRIBE");
    setService(paramService);
    setCallback(paramString);
    setNT("upnp:event");
    setTimeout(paramLong);
  }
  
  public final void setTimeout(long paramLong)
  {
    setHeader("TIMEOUT", Subscription.toTimeoutHeaderString(paramLong));
  }
  
  public void setUnsubscribeRequest(Service paramService)
  {
    setMethod("UNSUBSCRIBE");
    setService(paramService);
    setSID(paramService.getSID());
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/event/SubscriptionRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */