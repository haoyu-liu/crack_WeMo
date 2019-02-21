package com.belkin.wemo.rules.device.impl;

import android.text.TextUtils;
import com.belkin.wemo.rules.device.IDeviceRules;
import com.belkin.wemo.rules.device.callback.FetchDeviceRulesCallback;
import com.belkin.wemo.rules.device.callback.StoreDeviceRulesCallback;
import com.belkin.wemo.rules.device.error.RuleDeviceError;
import com.belkin.wemo.rules.device.runnable.FetchDeviceRulesNoFetchSupportRunnable;
import com.belkin.wemo.rules.device.runnable.StoreDeviceRulesNoStoreSupportRunnable;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import org.cybergarage.upnp.Device;

class DeviceRulesNoFetchStoreAPIImpl
  implements IDeviceRules
{
  public void fetchDeviceRulesData(Device paramDevice, FetchDeviceRulesCallback paramFetchDeviceRulesCallback)
  {
    if (paramDevice != null) {
      WeMoThreadPoolHandler.executeInBackground(new FetchDeviceRulesNoFetchSupportRunnable(paramFetchDeviceRulesCallback, paramDevice));
    }
    while (paramFetchDeviceRulesCallback == null) {
      return;
    }
    paramFetchDeviceRulesCallback.onError(new RuleDeviceError());
  }
  
  public void storeDeviceRulesData(Device paramDevice, StoreDeviceRulesCallback paramStoreDeviceRulesCallback, String paramString1, String paramString2, int paramInt, String[] paramArrayOfString)
  {
    if ((TextUtils.isEmpty(paramString1)) || (TextUtils.isEmpty(paramString2)) || (paramDevice == null))
    {
      if (paramStoreDeviceRulesCallback != null) {
        paramStoreDeviceRulesCallback.onError(new RuleDeviceError());
      }
      return;
    }
    WeMoThreadPoolHandler.executeInBackground(new StoreDeviceRulesNoStoreSupportRunnable(paramStoreDeviceRulesCallback, paramDevice, paramString1, paramString2, paramInt, paramArrayOfString));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/impl/DeviceRulesNoFetchStoreAPIImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */