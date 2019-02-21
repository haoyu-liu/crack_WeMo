package com.belkin.wemo.rules.device.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesSuccessCallback;

public abstract interface RMFetchDeviceRulesSuccesCallback
  extends RMWeMoRulesSuccessCallback
{
  public abstract void onSuccess(int paramInt, String paramString1, String paramString2);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */