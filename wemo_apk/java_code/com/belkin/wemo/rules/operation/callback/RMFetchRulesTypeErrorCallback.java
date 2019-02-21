package com.belkin.wemo.rules.operation.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesErrorCallback;
import com.belkin.wemo.rules.error.RMRulesTypeError;

public abstract interface RMFetchRulesTypeErrorCallback
  extends RMWeMoRulesErrorCallback
{
  public abstract void onSingleTypeRulesFetchError(RMRulesTypeError paramRMRulesTypeError);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */