package com.belkin.wemo.rules.operation.callback;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.rules.callback.RMWeMoRulesSuccessCallback;
import java.util.List;

public abstract interface RMStoreRulesRemoteSuccessCallback
  extends RMWeMoRulesSuccessCallback
{
  public abstract void onSuccess(List<DeviceInformation> paramList, int paramInt);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */