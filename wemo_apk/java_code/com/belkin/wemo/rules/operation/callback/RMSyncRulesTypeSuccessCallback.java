package com.belkin.wemo.rules.operation.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesSuccessCallback;

public abstract interface RMSyncRulesTypeSuccessCallback
  extends RMWeMoRulesSuccessCallback
{
  public abstract void onSingleTypeRulesSynced(int paramInt);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */