package com.belkin.controller;

import com.belkin.wemo.cache.data.DeviceInformation;

public abstract interface WidgetGetDeviceCallback
{
  public abstract void onDeviceOffline(DeviceInformation paramDeviceInformation);
  
  public abstract void onDeviceOnline(DeviceInformation paramDeviceInformation);
  
  public abstract void onDeviceUnavailable();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/controller/WidgetGetDeviceCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */