package com.belkin.wemo.rules.location.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesErrorCallback;
import com.belkin.wemo.rules.error.RMRulesError;

public abstract interface RMReadLocationErrorCallback
  extends RMWeMoRulesErrorCallback
{
  public abstract void onLocationReadFailed(RMRulesError paramRMRulesError);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/location/callback/RMReadLocationErrorCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */