package com.belkin.wemo.rules.device.impl;

import com.belkin.utils.LogUtils;
import com.belkin.wemo.rules.device.IDeviceRules;
import com.belkin.wemo.utils.WeMoUtils;
import org.cybergarage.upnp.Device;

public class DeviceRulesFactory
{
  public static final String TAG = "DeviceRulesFactory";
  private static IDeviceRules fetchSupportInstance;
  private static IDeviceRules noFetchSupportInstance;
  
  public static void destroy()
  {
    try
    {
      if (fetchSupportInstance != null) {
        fetchSupportInstance = null;
      }
      if (noFetchSupportInstance != null) {
        noFetchSupportInstance = null;
      }
      return;
    }
    finally {}
  }
  
  private IDeviceRules getDeviceRulesInstanceNoFetchAPISupport()
  {
    if (noFetchSupportInstance == null) {
      noFetchSupportInstance = new DeviceRulesNoFetchStoreAPIImpl();
    }
    return noFetchSupportInstance;
  }
  
  private IDeviceRules getDeviceRulesInstanceWithFetchAPISupport()
  {
    if (fetchSupportInstance == null) {
      fetchSupportInstance = new DeviceRulesWithStoreFetchImpl();
    }
    return fetchSupportInstance;
  }
  
  public IDeviceRules getDeviceRulesInstance(Device paramDevice)
  {
    LogUtils.infoLog("DeviceRulesFactory", "Time: Device Rules Factory: Runtime IN : " + System.currentTimeMillis());
    IDeviceRules localIDeviceRules = null;
    if (paramDevice != null)
    {
      boolean bool = WeMoUtils.isSmartDevice(paramDevice.getDeviceType());
      localIDeviceRules = null;
      if (!bool) {
        if (!WeMoUtils.areFetchStoreAPIsSupportedInLocal(paramDevice)) {
          break label86;
        }
      }
    }
    label86:
    for (localIDeviceRules = getDeviceRulesInstanceWithFetchAPISupport();; localIDeviceRules = getDeviceRulesInstanceNoFetchAPISupport())
    {
      LogUtils.infoLog("DeviceRulesFactory", "Time: Device Rules Factory: Runtime OUT: " + System.currentTimeMillis());
      return localIDeviceRules;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/impl/DeviceRulesFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */