package com.belkin.wemo.rules.callback;

import com.belkin.wemo.rules.error.RMRulesError;

public abstract interface StoreRulesErrorCallback
  extends WeMoRulesCallback
{
  public abstract void onError(RMRulesError paramRMRulesError);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/callback/StoreRulesErrorCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */