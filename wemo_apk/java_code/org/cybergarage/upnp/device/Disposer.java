package org.cybergarage.upnp.device;

import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.util.ThreadCore;

public class Disposer
  extends ThreadCore
{
  private ControlPoint ctrlPoint;
  
  public Disposer(ControlPoint paramControlPoint)
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
    long l = 1000L * localControlPoint.getExpiredDeviceMonitoringInterval();
    for (;;)
    {
      if (isRunnable() == true) {
        try
        {
          Thread.sleep(l);
          localControlPoint.removeExpiredDevices();
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/device/Disposer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */