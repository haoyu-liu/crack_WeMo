package com.belkin.wemo.rules.read.type.callback;

import com.belkin.wemo.rules.callback.RMWeMoRulesSuccessCallback;
import com.belkin.wemo.rules.data.RMRule;
import java.util.ArrayList;

public abstract interface RMReadRulesTypeSuccessCallback
  extends RMWeMoRulesSuccessCallback
{
  public abstract void onRulesParsed(ArrayList<? extends RMRule> paramArrayList, int paramInt);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/callback/RMReadRulesTypeSuccessCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */