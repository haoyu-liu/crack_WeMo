package com.belkin.wemo.rules.runnable;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.utils.LogUtils;
import com.belkin.utils.RuleUtility;
import com.belkin.wemo.localsdk.WeMoSDKContext;
import com.belkin.wemo.rules.device.IDeviceRules;
import com.belkin.wemo.rules.device.impl.DeviceRulesFactory;
import com.belkin.wemo.runnable.WeMoRunnable;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import java.util.ArrayList;
import java.util.Iterator;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;

public class SyncRulesLocalRunnable
  extends WeMoRunnable
{
  public static final String TAG = "SyncRulesLocalRunnable";
  private static Object lock = new Object();
  private Context context;
  private int dbVersionToSend = -1;
  private ArrayList<String> devicesToBeSyncedUDNsList;
  private String localZippedDBFilePath;
  
  public SyncRulesLocalRunnable(Context paramContext, ArrayList<String> paramArrayList, int paramInt)
  {
    this.context = paramContext;
    if (paramArrayList != null) {}
    for (this.devicesToBeSyncedUDNsList = paramArrayList;; this.devicesToBeSyncedUDNsList = new ArrayList())
    {
      this.dbVersionToSend = paramInt;
      return;
    }
  }
  
  private String getLocalZippedDBFilePath()
  {
    synchronized (lock)
    {
      if (TextUtils.isEmpty(this.localZippedDBFilePath))
      {
        LogUtils.infoLog("SyncRulesLocalRunnable", "Sync Rules: local zipped file path string is null. Creating zipped file");
        this.localZippedDBFilePath = new RuleUtility(this.context).getLocalZippedDBFilePath(this.dbVersionToSend);
        String str = this.localZippedDBFilePath;
        return str;
      }
      LogUtils.infoLog("SyncRulesLocalRunnable", "Sync Rules: local zipped file path string is avialable for use.");
    }
  }
  
  public void run()
  {
    if (this.context != null)
    {
      ControlPoint localControlPoint = (ControlPoint)WeMoSDKContext.getInstance(this.context).getUpnpControl();
      Iterator localIterator = this.devicesToBeSyncedUDNsList.iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        Device localDevice = localControlPoint.getDevice(str);
        if (localDevice != null)
        {
          LogUtils.infoLog("SyncRulesLocalRunnable", "Sync Rules: device to be synced: " + str);
          WeMoThreadPoolHandler.executeInBackground(new DeviceSyncProcessingRunnable(localDevice));
        }
      }
    }
  }
  
  private class DeviceSyncProcessingRunnable
    extends WeMoRunnable
  {
    private Device device;
    
    public DeviceSyncProcessingRunnable(Device paramDevice)
    {
      this.device = paramDevice;
    }
    
    public void run()
    {
      IDeviceRules localIDeviceRules = new DeviceRulesFactory().getDeviceRulesInstance(this.device);
      if (localIDeviceRules != null) {
        localIDeviceRules.storeDeviceRulesData(this.device, null, String.valueOf(SyncRulesLocalRunnable.this.dbVersionToSend), SyncRulesLocalRunnable.this.getLocalZippedDBFilePath(), -1, new String[0]);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/runnable/SyncRulesLocalRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */