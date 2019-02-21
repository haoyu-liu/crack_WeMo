package com.belkin.wemo.rules.operation.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesSuccessCallback;
import java.util.List;

public abstract interface RMStoreRulesTypeSuccessCallback
  extends RMWeMoRulesSuccessCallback
{
  public abstract void onSingleTypeStoreSuccess(int paramInt, List<String> paramList);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */