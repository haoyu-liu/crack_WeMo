package com.belkin.wemo.cache.devicelist.runnable;

import android.content.Context;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.cloud.SmartDiscovery;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.DeviceListManager.FirmwareUpdateData;
import com.belkin.wemo.cache.devicelist.DeviceRequestTracker;
import com.belkin.wemo.cache.devicelist.UnicastDeviceDiscovery;
import com.belkin.wemo.cache.utils.Locks;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class UnicastDiscoveryRunnable
  extends WeMoRunnable
{
  private Context context;
  private DeviceListManager devListManager;
  private SmartDiscovery deviceDiscoveryCloudCache;
  
  public UnicastDiscoveryRunnable(Context paramContext, SmartDiscovery paramSmartDiscovery)
  {
    this.devListManager = DeviceListManager.getInstance(paramContext);
    this.context = paramContext;
    this.deviceDiscoveryCloudCache = paramSmartDiscovery;
  }
  
  public void run()
  {
    Locks.getInstance().setLock(Locks.LOCK_UNICAST_DISOCVERY);
    List localList = CacheManager.getInstance(this.context).getInitialDeviceListGeneric();
    SDKLogUtils.infoLog(this.TAG, "Discovery Unicast: Starting UnicastDiscoveryRunnable. DB Device List size: " + localList.size());
    Iterator localIterator = localList.iterator();
    while (localIterator.hasNext())
    {
      final DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
      SDKLogUtils.infoLog(this.TAG, "Discovery Unicast: Full Device Info from DB: " + localDeviceInformation);
      if (localDeviceInformation != null)
      {
        String str1 = localDeviceInformation.getUDN();
        String str2 = localDeviceInformation.getFwStatus();
        SDKLogUtils.infoLog(this.TAG, "Discovery Unicast: UDN: " + str1 + "; fwStatus: " + str2);
        if (!localDeviceInformation.getType().isEmpty())
        {
          if ((str2.equals("0")) || (str2.equals("1")) || (str2.equals("3")))
          {
            SDKLogUtils.errorLog(this.TAG, "Discovery Unicast: Unicast NOT ISSUED as FW UPGRADE IN PROGRESS. UDN: " + str1);
            SDKLogUtils.debugLog(this.TAG, "FW Update: UnicastDiscoveryRunnable: Device is in FW upgrade.");
            this.devListManager.printFwUpgradeInProgressMapIfDebug();
            if (this.devListManager.getFWUpdateInProgressDataMap().get(str1) == null)
            {
              DeviceListManager.FirmwareUpdateData localFirmwareUpdateData = new DeviceListManager.FirmwareUpdateData();
              localFirmwareUpdateData.setFwStatus(str2);
              localFirmwareUpdateData.setOldFwVersion(localDeviceInformation.getFirmwareVersion());
              localFirmwareUpdateData.setUdn(str1);
              this.devListManager.getFWUpdateInProgressDataMap().put(str1, localFirmwareUpdateData);
              SDKLogUtils.debugLog(this.TAG, "Discovery Unicast: FW Update: Entry added into fwUpdateInProgressDataMap as none existed. UDN: " + str1);
            }
          }
          else
          {
            this.devListManager.getDevicesStartTimes().put(str1, Long.valueOf(System.currentTimeMillis()));
            Thread localThread = new Thread(new Runnable()
            {
              public void run()
              {
                UnicastDiscoveryRunnable.this.deviceDiscoveryCloudCache.setUnicastFailedForAnyDevice(false);
                new UnicastDeviceDiscovery(localDeviceInformation, UnicastDiscoveryRunnable.this.devListManager).runUnicastDiscovery(null);
              }
            });
            localThread.setPriority(1);
            localThread.start();
            DeviceRequestTracker localDeviceRequestTracker = (DeviceRequestTracker)this.devListManager.getBinaryStateRequestTrackerMap().get(str1);
            if (localDeviceRequestTracker != null)
            {
              localDeviceRequestTracker.reset();
              SDKLogUtils.debugLog(this.TAG, "DeviceRequestTracker: counter reset to 0 after issuing UNICAST. UDN: " + str1);
            }
          }
        }
        else {
          SDKLogUtils.errorLog(this.TAG, "Unicast NOT Issued. Device Information object is NULL");
        }
      }
    }
    Locks.getInstance().unsetLock(Locks.LOCK_UNICAST_DISOCVERY);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */