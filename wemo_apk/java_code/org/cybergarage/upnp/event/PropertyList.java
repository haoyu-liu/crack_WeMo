package org.cybergarage.upnp.event;

import java.util.Vector;

public class PropertyList
  extends Vector
{
  public static final String ELEM_NAME = "PropertyList";
  
  public Property getProperty(int paramInt)
  {
    return (Property)get(paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/event/PropertyList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */