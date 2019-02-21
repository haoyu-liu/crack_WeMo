package org.cybergarage.upnp.control;

import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.util.ThreadCore;

public class RenewSubscriber
  extends ThreadCore
{
  public static final long INTERVAL = 120L;
  private ControlPoint ctrlPoint;
  
  public RenewSubscriber(ControlPoint paramControlPoint)
  {
    setControlPoint(paramControlPoint);
  }
  
  public ControlPoint getControlPoint()
  {
    return this.ctrlPoint;
  }
  
  public void run()
  {
    ControlPoint localControlPoint = getControlPoint();
    for (;;)
    {
      if (isRunnable() == true) {
        try
        {
          Thread.sleep(120000L);
          localControlPoint.renewSubscriberService();
        }
        catch (InterruptedException localInterruptedException)
        {
          for (;;) {}
        }
      }
    }
  }
  
  public void setControlPoint(ControlPoint paramControlPoint)
  {
    this.ctrlPoint = paramControlPoint;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/control/RenewSubscriber.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */