package org.cybergarage.upnp.control;

import org.cybergarage.upnp.StateVariable;

public abstract interface QueryListener
{
  public abstract boolean queryControlReceived(StateVariable paramStateVariable);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/control/QueryListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */