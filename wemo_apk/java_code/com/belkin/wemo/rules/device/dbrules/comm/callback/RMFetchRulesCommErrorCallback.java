package com.belkin.wemo.rules.device.dbrules.comm.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesErrorCallback;
import com.belkin.wemo.rules.device.dbrules.comm.error.RMRulesCommError;

public abstract interface RMFetchRulesCommErrorCallback
  extends RMWeMoRulesErrorCallback
{
  public abstract void onError(RMRulesCommError paramRMRulesCommError);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/device/dbrules/comm/callback/RMFetchRulesCommErrorCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */