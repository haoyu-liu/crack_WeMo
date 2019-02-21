package com.belkin.wemo.rules.location.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesSuccessCallback;
import com.belkin.wemo.rules.data.RMLocationInfo;

public abstract interface RMReadLocationSuccessCallback
  extends RMWeMoRulesSuccessCallback
{
  public abstract void onLocationRead(RMLocationInfo paramRMLocationInfo);
  
  public abstract void onNoInfoLocationFound();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/location/callback/RMReadLocationSuccessCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */