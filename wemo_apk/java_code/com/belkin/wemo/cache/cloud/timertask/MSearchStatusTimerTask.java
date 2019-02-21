package com.belkin.wemo.cache.cloud.timertask;

import com.belkin.wemo.cache.cloud.SmartDiscovery;
import java.util.TimerTask;
import org.cybergarage.upnp.ControlPoint;

public class MSearchStatusTimerTask
  extends TimerTask
{
  private SmartDiscovery deviceDiscoveryCloudCache;
  
  public MSearchStatusTimerTask(SmartDiscovery paramSmartDiscovery)
  {
    this.deviceDiscoveryCloudCache = paramSmartDiscovery;
  }
  
  public void run()
  {
    if ((this.deviceDiscoveryCloudCache != null) && (ControlPoint.didMSearchFail())) {
      this.deviceDiscoveryCloudCache.onMSearchFailed();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/timertask/MSearchStatusTimerTask.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */