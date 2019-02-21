package com.belkin.wemo.cache.devicelist;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.data.ZigBeeDeviceInformation;

public abstract interface DeviceListManagerCallbacksActivity
{
  public abstract void mustRestartApp();
  
  public abstract void onDeviceAdded(DeviceInformation paramDeviceInformation);
  
  public abstract void onDeviceRemoved(String paramString);
  
  public abstract void onDeviceUpdated(DeviceInformation paramDeviceInformation);
  
  public abstract void onIconUpdate(String paramString1, String paramString2);
  
  public abstract void onZigBeeDeviceAdded(ZigBeeDeviceInformation paramZigBeeDeviceInformation);
  
  public abstract void onZigBeeDeviceUpdated(ZigBeeDeviceInformation paramZigBeeDeviceInformation);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */