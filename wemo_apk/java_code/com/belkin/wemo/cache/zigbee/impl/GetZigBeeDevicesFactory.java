package com.belkin.wemo.cache.zigbee.impl;

import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.WemoUtils;
import com.belkin.wemo.cache.zigbee.IZigBeeDevices;

public class GetZigBeeDevicesFactory
{
  public static final String TAG = "ZigBeeDeviceFactory";
  private static IZigBeeDevices zigBeeDevicesInstance;
  
  public static void destroy()
  {
    try
    {
      if (zigBeeDevicesInstance != null) {
        zigBeeDevicesInstance = null;
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  private IZigBeeDevices getZigBeeDeviceWithStatusInstanceAPISupport(String paramString, DeviceListManager paramDeviceListManager)
  {
    if (zigBeeDevicesInstance == null) {
      zigBeeDevicesInstance = new ZigBeeDevicesWithStatusImpl(paramString, paramDeviceListManager);
    }
    return zigBeeDevicesInstance;
  }
  
  private IZigBeeDevices getZigBeeDeviceWithoutStatusInstanceAPISupport(String paramString, DeviceListManager paramDeviceListManager)
  {
    if (zigBeeDevicesInstance == null) {
      zigBeeDevicesInstance = new ZigBeeDevicesWithoutStatusImpl(paramString, paramDeviceListManager);
    }
    return zigBeeDevicesInstance;
  }
  
  public IZigBeeDevices getGetZigBeeDevicesInstance(String paramString, DeviceListManager paramDeviceListManager)
  {
    SDKLogUtils.infoLog("ZigBeeDeviceFactory", "Unification: in getGetZigBeeDevicesInstance");
    IZigBeeDevices localIZigBeeDevices = null;
    if (paramString != null)
    {
      if (WemoUtils.isGetEndDevicesWithStatusSupported(paramString, paramDeviceListManager))
      {
        SDKLogUtils.infoLog("ZigBeeDeviceFactory", "Unification: in getGetZigBeeDevicesInstance");
        localIZigBeeDevices = getZigBeeDeviceWithStatusInstanceAPISupport(paramString, paramDeviceListManager);
      }
    }
    else {
      return localIZigBeeDevices;
    }
    SDKLogUtils.infoLog("ZigBeeDeviceFactory", "Unification: in getGetZigBeeDevicesInstance");
    return getZigBeeDeviceWithoutStatusInstanceAPISupport(paramString, paramDeviceListManager);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/zigbee/impl/GetZigBeeDevicesFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */