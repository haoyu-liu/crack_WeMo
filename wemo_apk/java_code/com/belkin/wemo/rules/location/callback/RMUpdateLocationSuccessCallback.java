package com.belkin.wemo.rules.location.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesSuccessCallback;

public abstract interface RMUpdateLocationSuccessCallback
  extends RMWeMoRulesSuccessCallback
{
  public abstract void onLocationUpdated();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/location/callback/RMUpdateLocationSuccessCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */