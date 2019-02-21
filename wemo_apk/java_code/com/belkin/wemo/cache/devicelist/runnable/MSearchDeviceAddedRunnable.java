package com.belkin.wemo.cache.devicelist.runnable;

import android.content.Context;
import com.belkin.wemo.cache.CacheManager;
import com.belkin.wemo.cache.cloud.DeviceReachabilityTester;
import com.belkin.wemo.cache.cloud.DeviceReachabilityTester.IDeviceReachabilityListener;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.DevicesArray;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.DeviceListManagerCallbacksActivity;
import com.belkin.wemo.cache.remoteaccess.RemoteAccessManager;
import com.belkin.wemo.cache.utils.IsDevice;
import com.belkin.wemo.cache.utils.MoreUtil;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.runnable.WeMoRunnable;
import java.util.Timer;
import java.util.TimerTask;
import org.cybergarage.upnp.Device;

public class MSearchDeviceAddedRunnable
  extends WeMoRunnable
  implements DeviceReachabilityTester.IDeviceReachabilityListener
{
  public static final int COOLING_PERIOD_TILL_NEXT_MSEARCH = 10000;
  private DeviceListManagerCallbacksActivity activity;
  private CacheManager cacheManager;
  private Context context;
  private Device device;
  private DeviceListManager deviceListManager;
  private DevicesArray devicesArray;
  private onMSearchDeviceProcessedListener listener;
  private SharePreferences sharePreferences;
  
  public MSearchDeviceAddedRunnable(CacheManager paramCacheManager, DevicesArray paramDevicesArray, DeviceListManager paramDeviceListManager, SharePreferences paramSharePreferences, DeviceListManagerCallbacksActivity paramDeviceListManagerCallbacksActivity, Context paramContext, Device paramDevice, onMSearchDeviceProcessedListener paramonMSearchDeviceProcessedListener)
  {
    this.cacheManager = paramCacheManager;
    this.deviceListManager = paramDeviceListManager;
    this.devicesArray = paramDevicesArray;
    this.device = paramDevice;
    this.sharePreferences = paramSharePreferences;
    this.context = paramContext;
    this.activity = paramDeviceListManagerCallbacksActivity;
    this.TAG = (this.TAG + ":" + " " + paramDevice.getUDN());
    this.listener = paramonMSearchDeviceProcessedListener;
  }
  
  public void onDeviceNotReachable()
  {
    this.deviceListManager.setDeviceNonReachibility(true);
    String str = this.device.getUDN();
    SDKLogUtils.errorLog(this.TAG, "Discovery: MSearch device is NOT reachable via UNICAST: " + str + "; NO PROCESSING TO BE DONE. Starting cooling period untill next MSearch. Time: " + 10000);
    new Timer().schedule(new DeviceCoolingPeriodTimerTask(str, this.listener), 10000L);
  }
  
  public void onDeviceReachable()
  {
    boolean bool1 = false;
    String str = this.device.getUDN();
    SDKLogUtils.infoLog(this.TAG, "Discovery: MSearch device is reachable via UNICAST: " + str);
    DeviceInformation localDeviceInformation;
    if (str != null)
    {
      this.devicesArray.setDeviceDiscovered(str, true);
      localDeviceInformation = this.devicesArray.getDeviceInformation(str);
      if (localDeviceInformation != null) {
        break label518;
      }
      localDeviceInformation = new DeviceInformation(this.device);
      if (!this.deviceListManager.subscribeToService(this.device)) {
        SDKLogUtils.infoLog(this.TAG, "Discovery: MSearch Device Added: subscribe to service failed for " + str);
      }
      localDeviceInformation.setIconURL(this.device.getLogoURLFromDevice());
      localDeviceInformation.setInActive(0);
      localDeviceInformation.setIsDiscovered(true);
      localDeviceInformation.setRemote(false);
      localDeviceInformation.setHide(0);
      this.devicesArray.updateDeviceCache(localDeviceInformation, bool1);
      this.devicesArray.addOrUpdateDeviceInformation(localDeviceInformation);
      if (IsDevice.Bridge(str))
      {
        SDKLogUtils.infoLog(this.TAG, "Discovery: MSearch Device Added: initiating zigbee scan: " + str);
        this.deviceListManager.initiateScanZigBeeDevice(str);
      }
      this.deviceListManager.processFWUpgradeStatus(localDeviceInformation);
      if (bool1) {
        break label531;
      }
      SDKLogUtils.infoLog(this.TAG, "Discovery: MSearch Device Added: going to send ADD notification for " + str);
      this.deviceListManager.sendNotification("add", "", str);
      label253:
      if (this.cacheManager.isDeviceInDB(str)) {
        break label574;
      }
      SDKLogUtils.infoLog(this.TAG, "Discovery: MSearch Device Added: ADDING device in cache db: " + str);
      SDKLogUtils.infoLog(this.TAG, " info: " + localDeviceInformation.getInfo());
      if (localDeviceInformation != null)
      {
        boolean bool4 = this.cacheManager.addDeviceToDB(localDeviceInformation, true, true, true);
        SDKLogUtils.infoLog(this.TAG, "Discovery: MSearch Device Added: device added to db " + localDeviceInformation.getUDN() + " result:" + bool4);
      }
    }
    for (;;)
    {
      boolean bool2 = this.sharePreferences.getRemoteAutoEnableNeeded();
      boolean bool3 = this.sharePreferences.isRemoteEnabled();
      SDKLogUtils.debugLog(this.TAG, "Discovery: Is remote access enable needed: " + bool2 + "; Is remote enabled: " + bool3);
      if ((bool2) && (!bool3))
      {
        SDKLogUtils.debugLog(this.TAG, "Discovery: Enabling Auto Remote Access");
        if (new RemoteAccessManager(this.activity, this.context).enableRemoteAccess()) {
          this.sharePreferences.setRemoteAutoEnableNeeded(false);
        }
      }
      if (this.listener != null) {
        this.listener.onMSearchProcessingDone(localDeviceInformation);
      }
      if (SDKLogUtils.isDebug()) {
        new MoreUtil().copyDbToDownloadDirectory("cache.db", this.context);
      }
      return;
      label518:
      bool1 = true;
      localDeviceInformation.setDevice(this.device);
      break;
      label531:
      SDKLogUtils.infoLog(this.TAG, "Discovery: MSearch Device Added: going to send UPDATE notification for " + str);
      this.deviceListManager.sendNotification("update", "", str);
      break label253;
      label574:
      SDKLogUtils.infoLog(this.TAG, "Discovery: MSearch Device Added: UPDATING device in cache db: " + str);
      this.cacheManager.updateDB(localDeviceInformation, true, true, true);
    }
  }
  
  public void run()
  {
    SDKLogUtils.infoLog(this.TAG, "Discovery: Processing MSearch New Device Added Request: " + this.device.getUDN());
    new DeviceReachabilityTester(this.device, this).start();
  }
  
  private class DeviceCoolingPeriodTimerTask
    extends TimerTask
  {
    private MSearchDeviceAddedRunnable.onMSearchDeviceProcessedListener listener;
    private String udn;
    
    public DeviceCoolingPeriodTimerTask(String paramString, MSearchDeviceAddedRunnable.onMSearchDeviceProcessedListener paramonMSearchDeviceProcessedListener)
    {
      this.udn = paramString;
      this.listener = paramonMSearchDeviceProcessedListener;
    }
    
    public void run()
    {
      SDKLogUtils.errorLog(MSearchDeviceAddedRunnable.this.TAG, "Discovery: UNREACHABLE DEVICE COOLING PERIOD DONE. UDN: " + this.udn);
      if (this.listener != null) {
        this.listener.onMSearchProcessingFailed(this.udn);
      }
    }
  }
  
  public static abstract interface onMSearchDeviceProcessedListener
  {
    public abstract void onMSearchProcessingDone(DeviceInformation paramDeviceInformation);
    
    public abstract void onMSearchProcessingFailed(String paramString);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */