package com.belkin.wemo.rules.operation.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesSuccessCallback;
import java.util.ArrayList;

public abstract interface RMFetchRulesTypeSuccessCallback
  extends RMWeMoRulesSuccessCallback
{
  public abstract void onSingleTypeRulesFetched(int paramInt, ArrayList<String> paramArrayList, String... paramVarArgs);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */