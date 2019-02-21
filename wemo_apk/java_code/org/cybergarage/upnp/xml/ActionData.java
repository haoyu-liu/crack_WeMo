package org.cybergarage.upnp.xml;

import org.cybergarage.upnp.control.ActionListener;
import org.cybergarage.upnp.control.ControlResponse;

public class ActionData
  extends NodeData
{
  private ActionListener actionListener = null;
  private ControlResponse ctrlRes = null;
  
  public ActionListener getActionListener()
  {
    return this.actionListener;
  }
  
  public ControlResponse getControlResponse()
  {
    return this.ctrlRes;
  }
  
  public void setActionListener(ActionListener paramActionListener)
  {
    this.actionListener = paramActionListener;
  }
  
  public void setControlResponse(ControlResponse paramControlResponse)
  {
    this.ctrlRes = paramControlResponse;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/xml/ActionData.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */