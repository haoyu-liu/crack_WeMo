package org.cybergarage.upnp.event;

import org.cybergarage.upnp.UPnP;

public class Subscription
{
  public static final String INFINITE_STRING = "infinite";
  public static final int INFINITE_VALUE = -1;
  public static final String SUBSCRIBE_METHOD = "SUBSCRIBE";
  public static final String TIMEOUT_HEADER = "Second-";
  public static final String UNSUBSCRIBE_METHOD = "UNSUBSCRIBE";
  public static final String UUID = "uuid:";
  public static final String XMLNS = "urn:schemas-upnp-org:event-1-0";
  
  public static final String createSID()
  {
    return UPnP.createUUID();
  }
  
  public static final String getSID(String paramString)
  {
    if (paramString == null) {
      paramString = "";
    }
    while (!paramString.startsWith("uuid:")) {
      return paramString;
    }
    return paramString.substring("uuid:".length(), paramString.length());
  }
  
  public static final long getTimeout(String paramString)
  {
    int i = 1 + paramString.indexOf('-');
    try
    {
      long l = Long.parseLong(paramString.substring(i, paramString.length()));
      return l;
    }
    catch (Exception localException) {}
    return -1L;
  }
  
  public static final String toSIDHeaderString(String paramString)
  {
    return "uuid:" + paramString;
  }
  
  public static final String toTimeoutHeaderString(long paramLong)
  {
    if (paramLong == -1L) {
      return "infinite";
    }
    return "Second-" + Long.toString(paramLong);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/event/Subscription.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */