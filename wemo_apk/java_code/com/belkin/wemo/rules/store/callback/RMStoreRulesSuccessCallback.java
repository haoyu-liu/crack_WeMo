package com.belkin.wemo.rules.store.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesSuccessCallback;

public abstract interface RMStoreRulesSuccessCallback
  extends RMWeMoRulesSuccessCallback
{
  public abstract void onRulesStored();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */