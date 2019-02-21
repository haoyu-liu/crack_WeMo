package com.belkin.wemo.rules.device.dbrules.comm.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesSuccessCallback;

public abstract interface RMFetchRulesCommSuccesCallback
  extends RMWeMoRulesSuccessCallback
{
  public abstract void onSuccess(int paramInt, String paramString);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/dbrules/comm/callback/RMFetchRulesCommSuccesCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */