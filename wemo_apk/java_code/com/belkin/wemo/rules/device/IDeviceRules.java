package com.belkin.wemo.rules.device;

import com.belkin.wemo.rules.device.callback.FetchDeviceRulesCallback;
import com.belkin.wemo.rules.device.callback.StoreDeviceRulesCallback;
import org.cybergarage.upnp.Device;

public abstract interface IDeviceRules
{
  public abstract void fetchDeviceRulesData(Device paramDevice, FetchDeviceRulesCallback paramFetchDeviceRulesCallback);
  
  public abstract void storeDeviceRulesData(Device paramDevice, StoreDeviceRulesCallback paramStoreDeviceRulesCallback, String paramString1, String paramString2, int paramInt, String[] paramArrayOfString);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/IDeviceRules.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */