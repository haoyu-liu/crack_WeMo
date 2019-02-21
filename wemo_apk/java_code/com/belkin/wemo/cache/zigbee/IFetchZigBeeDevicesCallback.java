package com.belkin.wemo.cache.zigbee;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.error.WeMoError;
import java.util.Map;

public abstract interface IFetchZigBeeDevicesCallback
{
  public abstract void onZigBeeDevicesFetchError(WeMoError paramWeMoError);
  
  public abstract void onZigBeeDevicesFetched(Map<String, DeviceInformation> paramMap);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */