package com.belkin.wemo.rules.operation.callback;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.rules.callback.RMWeMoRulesErrorCallback;
import com.belkin.wemo.rules.error.RMRulesError;
import java.util.List;

public abstract interface RMStoreRulesRemoteErrorCallback
  extends RMWeMoRulesErrorCallback
{
  public abstract void onError(RMRulesError paramRMRulesError, List<DeviceInformation> paramList, int paramInt);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */