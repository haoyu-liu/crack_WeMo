package org.cybergarage.upnp.event;

import java.net.URL;

public class Subscriber
{
  private String SID = null;
  private String deliveryHost = "";
  private String deliveryPath = "";
  private int deliveryPort = 0;
  private String deliveryURL = "";
  private String ifAddr = "";
  private long notifyCount = 0L;
  private long subscriptionTime = 0L;
  private long timeOut = 0L;
  
  public Subscriber()
  {
    renew();
  }
  
  public String getDeliveryHost()
  {
    return this.deliveryHost;
  }
  
  public String getDeliveryPath()
  {
    return this.deliveryPath;
  }
  
  public int getDeliveryPort()
  {
    return this.deliveryPort;
  }
  
  public String getDeliveryURL()
  {
    return this.deliveryURL;
  }
  
  public String getInterfaceAddress()
  {
    return this.ifAddr;
  }
  
  public long getNotifyCount()
  {
    return this.notifyCount;
  }
  
  public String getSID()
  {
    return this.SID;
  }
  
  public long getSubscriptionTime()
  {
    return this.subscriptionTime;
  }
  
  public long getTimeOut()
  {
    return this.timeOut;
  }
  
  public void incrementNotifyCount()
  {
    if (this.notifyCount == Long.MAX_VALUE)
    {
      this.notifyCount = 1L;
      return;
    }
    this.notifyCount = (1L + this.notifyCount);
  }
  
  public boolean isExpired()
  {
    long l = System.currentTimeMillis();
    if (this.timeOut == -1L) {}
    while (getSubscriptionTime() + 1000L * getTimeOut() >= l) {
      return false;
    }
    return true;
  }
  
  public void renew()
  {
    setSubscriptionTime(System.currentTimeMillis());
    setNotifyCount(0);
  }
  
  public void setDeliveryURL(String paramString)
  {
    this.deliveryURL = paramString;
    try
    {
      URL localURL = new URL(paramString);
      this.deliveryHost = localURL.getHost();
      this.deliveryPath = localURL.getPath();
      this.deliveryPort = localURL.getPort();
      return;
    }
    catch (Exception localException) {}
  }
  
  public void setInterfaceAddress(String paramString)
  {
    this.ifAddr = paramString;
  }
  
  public void setNotifyCount(int paramInt)
  {
    this.notifyCount = paramInt;
  }
  
  public void setSID(String paramString)
  {
    this.SID = paramString;
  }
  
  public void setSubscriptionTime(long paramLong)
  {
    this.subscriptionTime = paramLong;
  }
  
  public void setTimeOut(long paramLong)
  {
    this.timeOut = paramLong;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/event/Subscriber.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */