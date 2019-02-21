package com.belkin.wemo.rules.operation.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesErrorCallback;
import com.belkin.wemo.rules.error.RMRulesTypeError;
import java.util.List;

public abstract interface RMStoreRulesTypeErrorCallback
  extends RMWeMoRulesErrorCallback
{
  public abstract void onSingleTypeRulesStoreError(RMRulesTypeError paramRMRulesTypeError);
  
  public abstract void onSingleTypeStoreFailed(int paramInt, List<String> paramList);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */