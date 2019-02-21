package com.belkin.wemo.rules.device.impl;

import android.text.TextUtils;
import com.belkin.wemo.rules.device.IDeviceRules;
import com.belkin.wemo.rules.device.callback.FetchDeviceRulesCallback;
import com.belkin.wemo.rules.device.callback.StoreDeviceRulesCallback;
import com.belkin.wemo.rules.device.error.RuleDeviceError;
import com.belkin.wemo.rules.device.runnable.FetchDeviceRulesFetchSupportRunnable;
import com.belkin.wemo.rules.device.runnable.StoreDeviceRulesStoreSupportRunnable;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import org.cybergarage.upnp.Device;

class DeviceRulesWithStoreFetchImpl
  implements IDeviceRules
{
  public static final String TAG = "DeviceRulesFetchSupportImpl";
  
  public void fetchDeviceRulesData(Device paramDevice, FetchDeviceRulesCallback paramFetchDeviceRulesCallback)
  {
    if (paramDevice != null) {
      WeMoThreadPoolHandler.executeInBackground(new FetchDeviceRulesFetchSupportRunnable(paramFetchDeviceRulesCallback, paramDevice));
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
    WeMoThreadPoolHandler.executeInBackground(new StoreDeviceRulesStoreSupportRunnable(paramStoreDeviceRulesCallback, paramDevice, paramString1, paramString2, paramInt));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/impl/DeviceRulesWithStoreFetchImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */