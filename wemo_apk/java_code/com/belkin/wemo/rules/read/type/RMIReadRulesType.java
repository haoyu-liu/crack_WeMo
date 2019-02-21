package com.belkin.wemo.rules.read.type;

import com.belkin.wemo.rules.read.type.callback.RMReadRulesTypeErrorCallback;
import com.belkin.wemo.rules.read.type.callback.RMReadRulesTypeSuccessCallback;

public abstract interface RMIReadRulesType
{
  public abstract void parseRules(RMReadRulesTypeSuccessCallback paramRMReadRulesTypeSuccessCallback, RMReadRulesTypeErrorCallback paramRMReadRulesTypeErrorCallback);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/read/type/RMIReadRulesType.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */