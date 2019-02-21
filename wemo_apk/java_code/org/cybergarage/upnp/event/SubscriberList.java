package org.cybergarage.upnp.event;

import java.util.Vector;

public class SubscriberList
  extends Vector
{
  public Subscriber getSubscriber(int paramInt)
  {
    try
    {
      Object localObject2 = get(paramInt);
      localObject1 = localObject2;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Object localObject1 = null;
      }
    }
    return (Subscriber)localObject1;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/event/SubscriberList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */