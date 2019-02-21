package com.belkin.wemo.cache.devicelist.runnable;

import com.belkin.wemo.cache.cloud.SmartDiscovery;
import com.belkin.wemo.cache.cloud.timertask.MSearchStatusTimerTask;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.util.Timer;
import java.util.TimerTask;
import org.cybergarage.upnp.ControlPoint;

public class MSearchRequestRunnable
  extends WeMoRunnable
{
  private static final int MAX_MSEARCH_COUNT = 3;
  private static final int MSEARCH_INTERVAL_SECOND_ATTEMPT_MS = 100;
  private static final int MSEARCH_INTERVAL_THIRD_ATTEMPT_MS = 3000;
  private static final int MX_FIRST_ATTEMPT = 1;
  private static final int MX_NEXT_ATTEMPTS = 2;
  private DeviceListManager deviceListManager;
  private int msearchIterationCount;
  private SmartDiscovery smartDiscovery;
  
  public MSearchRequestRunnable(DeviceListManager paramDeviceListManager, SmartDiscovery paramSmartDiscovery)
  {
    this.deviceListManager = paramDeviceListManager;
    this.smartDiscovery = paramSmartDiscovery;
  }
  
  private void sendMSearchRequest(int paramInt1, int paramInt2)
  {
    SDKLogUtils.debugLog(this.TAG, "Sending MSearch Request. MX: " + paramInt1 + "; MSearch requested completed count: " + this.msearchIterationCount);
    if (!this.deviceListManager.getUpnpControl().search(paramInt1)) {
      SDKLogUtils.errorLog(this.TAG, "MSearch Request Failed. Recreating control point. MSearch requests shall be sent after control point has been re-created");
    }
    this.msearchIterationCount = (1 + this.msearchIterationCount);
    if (this.msearchIterationCount < 3)
    {
      SDKLogUtils.debugLog(this.TAG, "Timer task scheduled for next MSearch request after time: " + paramInt2 + "MS; Request sent count: " + this.msearchIterationCount);
      new Timer().schedule(new MSearchTimerTask(null), paramInt2);
      return;
    }
    SDKLogUtils.debugLog(this.TAG, "All MSearch requests completed. Timer task scheduled for Smart Discovery. Delay: 6000");
    new Timer().schedule(new MSearchStatusTimerTask(this.smartDiscovery), 6000L);
  }
  
  protected String getLoggerTag()
  {
    return getClass().getSimpleName() + ":" + Thread.currentThread().getId();
  }
  
  public void run()
  {
    sendMSearchRequest(1, 100);
  }
  
  private class MSearchTimerTask
    extends TimerTask
  {
    private MSearchTimerTask() {}
    
    public void run()
    {
      SDKLogUtils.debugLog(MSearchRequestRunnable.this.TAG, "MSearch Timer Task. run(): MSearch requested completed count: " + MSearchRequestRunnable.this.msearchIterationCount);
      MSearchRequestRunnable.this.sendMSearchRequest(2, 3000);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */