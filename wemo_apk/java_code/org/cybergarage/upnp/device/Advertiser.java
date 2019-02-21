package org.cybergarage.upnp.device;

import org.cybergarage.upnp.Device;
import org.cybergarage.util.ThreadCore;

public class Advertiser
  extends ThreadCore
{
  private Device device;
  
  public Advertiser(Device paramDevice)
  {
    setDevice(paramDevice);
  }
  
  public Device getDevice()
  {
    return this.device;
  }
  
  public void run()
  {
    Device localDevice = getDevice();
    long l1 = localDevice.getLeaseTime();
    for (;;)
    {
      if (isRunnable() == true)
      {
        long l2 = 1000L * (l1 / 4L + ((float)l1 * (0.25D * Math.random())));
        try
        {
          Thread.sleep(l2);
          localDevice.announce();
        }
        catch (InterruptedException localInterruptedException)
        {
          for (;;) {}
        }
      }
    }
  }
  
  public void setDevice(Device paramDevice)
  {
    this.device = paramDevice;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/cybergarage/upnp/device/Advertiser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */