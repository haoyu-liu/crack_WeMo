package com.belkin.cybergarage.wrapper;

import android.content.Context;
import android.util.Log;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;
import org.cybergarage.upnp.DeviceList;

public class UpnpDeviceBase
{
  public static final int MSEARCH_INTERVAL = 500;
  public static final int MSEARCH_ITERATION = 2;
  private static final String TAG = "UpnpSetupBase";
  private Context context;
  protected Device mDevice = null;
  
  public UpnpDeviceBase(Context paramContext)
  {
    this.context = paramContext;
  }
  
  public boolean UpnpInitialization()
  {
    LogUtils.infoLog("UpnpSetupBase", "UpnpInitialization():");
    if (getDeviceList() != null)
    {
      LogUtils.infoLog("UpnpSetupBase", " getDeviceList() != null :: returing TRUE");
      return true;
    }
    return false;
  }
  
  public void destroyControlPointNow()
  {
    Log.i("UpnpSetupBase", "destroyControlPointNow()");
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.context).getUpnpControl();
    localControlPoint.finalizeCP();
    localControlPoint.stop();
  }
  
  public void eventNotifyReceived(String paramString1, long paramLong, String paramString2, String paramString3) {}
  
  protected DeviceList getDeviceList()
  {
    ControlPoint localControlPoint = DeviceListManager.getInstance(this.context).getUpnpControl();
    Object localObject = localControlPoint.getDeviceList();
    int i = 0;
    while (i < 10) {
      try
      {
        Thread.sleep(1500L);
        if (((DeviceList)localObject).size() > 0)
        {
          this.mDevice = ((DeviceList)localObject).getDevice(0);
          return (DeviceList)localObject;
        }
        DeviceList localDeviceList = localControlPoint.getDeviceList();
        localObject = localDeviceList;
        i++;
      }
      catch (InterruptedException localInterruptedException)
      {
        for (;;)
        {
          localInterruptedException.printStackTrace();
        }
      }
    }
    return null;
  }
  
  public Device getSetupDevice()
  {
    DeviceList localDeviceList = DeviceListManager.getInstance(this.context).getUpnpControl().getDeviceList();
    if ((localDeviceList != null) && (localDeviceList.size() > 0))
    {
      this.mDevice = localDeviceList.getDevice(0);
      return this.mDevice;
    }
    return null;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/cybergarage/wrapper/UpnpDeviceBase.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */