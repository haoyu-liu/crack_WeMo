package org.cybergarage.upnp;

import java.util.Vector;

public class ActionList
  extends Vector
{
  public static final String ELEM_NAME = "actionList";
  
  public Action getAction(int paramInt)
  {
    return (Action)get(paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/ActionList.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */