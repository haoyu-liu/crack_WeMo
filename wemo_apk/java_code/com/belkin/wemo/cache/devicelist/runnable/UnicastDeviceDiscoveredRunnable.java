package com.belkin.wemo.cache.devicelist.runnable;

import android.content.Context;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.DeviceListManagerCallbacksActivity;
import com.belkin.wemo.cache.remoteaccess.RemoteAccessManager;
import com.belkin.wemo.cache.utils.IsDevice;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.cache.utils.WemoUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;

public class UnicastDeviceDiscoveredRunnable
  extends WeMoRunnable
{
  private DeviceListManagerCallbacksActivity activity;
  private CacheManager cacheManager;
  private Context context;
  private DeviceInformation dev;
  private DeviceListManager deviceListManager;
  private DevicesArray devicesArray;
  private ControlPoint mControlPoint;
  private SharePreferences sharePreferences;
  
  public UnicastDeviceDiscoveredRunnable(CacheManager paramCacheManager, DevicesArray paramDevicesArray, DeviceListManager paramDeviceListManager, DeviceInformation paramDeviceInformation, ControlPoint paramControlPoint, String paramString, SharePreferences paramSharePreferences, Context paramContext, DeviceListManagerCallbacksActivity paramDeviceListManagerCallbacksActivity)
  {
    this.cacheManager = paramCacheManager;
    this.deviceListManager = paramDeviceListManager;
    this.devicesArray = paramDevicesArray;
    this.dev = paramDeviceInformation;
    this.mControlPoint = paramControlPoint;
    this.sharePreferences = paramSharePreferences;
    this.context = paramContext;
    this.activity = paramDeviceListManagerCallbacksActivity;
    this.TAG = (this.TAG + ":" + " " + paramDeviceInformation.getUDN());
  }
  
  public void run()
  {
    try
    {
      String str = this.dev.getUDN();
      SDKLogUtils.infoLog(this.TAG, "Unicast Discovery: Device Discovered Via Unicast: " + str);
      if (this.mControlPoint.getDevice(str) == null) {
        this.mControlPoint.searchResponseReceived(WemoUtils.createSSDPPacket(this.dev.getIP(), this.dev.getPort(), str), false, true);
      }
      Device localDevice = this.mControlPoint.getDevice(str);
      if (localDevice != null)
      {
        this.dev.setDevice(localDevice);
        SDKLogUtils.debugLog(this.TAG, "Unicast Discovery: Control Point device has been added for UDN: " + str);
      }
      for (;;)
      {
        if (!this.deviceListManager.subscribeToService(localDevice)) {
          SDKLogUtils.infoLog(this.TAG, "Unicast Discovery: subscription failed : " + str);
        }
        long l = this.deviceListManager.getScanStartTime(this.dev.getUDN());
        this.dev.setStartDiscoveryTime(l);
        this.dev.setEndDiscoveryTime(System.currentTimeMillis());
        this.dev.setAvailablity(true);
        this.dev.setInActive(0);
        this.dev.setIsDiscovered(true);
        this.dev.setWhichDiscovered("(Unicast)");
        this.devicesArray.updateDeviceCache(this.dev, true);
        this.devicesArray.setDeviceDiscovered(this.dev.getUDN(), true);
        this.deviceListManager.sendNotification("update", "", this.dev.getUDN());
        if (IsDevice.Bridge(str))
        {
          SDKLogUtils.infoLog(this.TAG, "Unicast Discovery: initiating zigbee scan for bridge: " + str);
          this.deviceListManager.initiateScanZigBeeDevice(str);
        }
        this.cacheManager.updateDB(this.dev, true, true, true);
        boolean bool1 = this.sharePreferences.getRemoteAutoEnableNeeded();
        boolean bool2 = this.sharePreferences.isRemoteEnabled();
        SDKLogUtils.debugLog(this.TAG, "Unicast Discovery: Is remote access enable needed: " + bool1 + "; Is remote enabled: " + bool2);
        if ((!bool1) || (bool2)) {
          break;
        }
        SDKLogUtils.debugLog(this.TAG, "Unicast Discovery: Enabling Auto Remote Access");
        if (!new RemoteAccessManager(this.activity, this.context).enableRemoteAccess()) {
          break;
        }
        this.sharePreferences.setRemoteAutoEnableNeeded(false);
        return;
        SDKLogUtils.errorLog(this.TAG, "Unicast Discovery: Control Point device COULD NOT BE added for UDN: " + str);
      }
      return;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog(this.TAG, "Exception: ", localException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */