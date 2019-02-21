package org.cybergarage.upnp;

import java.util.Vector;

public class ServiceStateTable
  extends Vector
{
  public static final String ELEM_NAME = "serviceStateTable";
  
  public StateVariable getStateVariable(int paramInt)
  {
    return (StateVariable)get(paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/ServiceStateTable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */