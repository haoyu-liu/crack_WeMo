package org.cybergarage.upnp;

import java.util.Vector;

public class IconList
  extends Vector
{
  public static final String ELEM_NAME = "iconList";
  
  public Icon getIcon(int paramInt)
  {
    return (Icon)get(paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/IconList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */