package com.belkin.cybergarage.wrapper;

import android.content.Context;
import org.cybergarage.upnp.Device;

public class UpnpDeviceAction
  extends UpnpDeviceBase
{
  private static final String TAG = "UpnpDeviceAction";
  
  public UpnpDeviceAction(Context paramContext)
  {
    super(paramContext);
  }
  
  public String getDeviceType(Device paramDevice)
  {
    return paramDevice.getDeviceType();
  }
  
  public String getFirstDeviceType()
  {
    return this.mDevice.getDeviceType();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cybergarage/wrapper/UpnpDeviceAction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */