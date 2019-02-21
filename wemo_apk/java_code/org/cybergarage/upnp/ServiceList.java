package org.cybergarage.upnp;

import java.util.Vector;

public class ServiceList
  extends Vector
{
  public static final String ELEM_NAME = "serviceList";
  
  public Service getService(int paramInt)
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
    return (Service)localObject1;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/ServiceList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */