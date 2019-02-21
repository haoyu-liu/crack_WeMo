package com.belkin.wemo.rules.callback;

import com.belkin.wemo.rules.data.RMRule;
import java.util.List;

public abstract interface RMShowRulesSuccessCallback
  extends RMWeMoRulesSuccessCallback
{
  public abstract void onSuccess(List<RMRule> paramList);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/callback/RMShowRulesSuccessCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */