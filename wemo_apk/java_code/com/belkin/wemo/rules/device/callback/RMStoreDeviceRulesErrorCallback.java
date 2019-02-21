package com.belkin.wemo.rules.device.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesErrorCallback;
import com.belkin.wemo.rules.device.error.RMRuleDeviceError;

public abstract interface RMStoreDeviceRulesErrorCallback
  extends RMWeMoRulesErrorCallback
{
  public abstract void onError(RMRuleDeviceError paramRMRuleDeviceError);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */