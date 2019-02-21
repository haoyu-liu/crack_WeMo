package com.belkin.wemo.rules;

import com.belkin.wemo.rules.callback.RMDeleteRuleErrorCallback;
import com.belkin.wemo.rules.callback.RMDeleteRuleSuccessCallback;
import com.belkin.wemo.rules.callback.RMEditRuleErrorCallback;
import com.belkin.wemo.rules.callback.RMEditRuleSuccessCallback;
import com.belkin.wemo.rules.callback.RMGetRuleErrorCallback;
import com.belkin.wemo.rules.callback.RMGetRuleSuccessCallback;
import com.belkin.wemo.rules.callback.RMResetDeviceRulesErrorCallback;
import com.belkin.wemo.rules.callback.RMResetDeviceRulesSuccessCallback;
import com.belkin.wemo.rules.callback.RMSaveRuleErrorCallback;
import com.belkin.wemo.rules.callback.RMSaveRuleSuccessCallback;
import com.belkin.wemo.rules.callback.RMShowRulesErrorCallback;
import com.belkin.wemo.rules.callback.RMShowRulesSuccessCallback;
import com.belkin.wemo.rules.callback.RMToggleRuleErrorCallback;
import com.belkin.wemo.rules.callback.RMToggleRuleSuccessCallback;
import com.belkin.wemo.rules.data.RMRule;

public abstract interface RMIRules
{
  public abstract void deleteRule(int paramInt, RMDeleteRuleSuccessCallback paramRMDeleteRuleSuccessCallback, RMDeleteRuleErrorCallback paramRMDeleteRuleErrorCallback);
  
  public abstract void deleteRulesFromDevice(String paramString, RMResetDeviceRulesSuccessCallback paramRMResetDeviceRulesSuccessCallback, RMResetDeviceRulesErrorCallback paramRMResetDeviceRulesErrorCallback);
  
  public abstract void disableRule(int paramInt, RMToggleRuleSuccessCallback paramRMToggleRuleSuccessCallback, RMToggleRuleErrorCallback paramRMToggleRuleErrorCallback);
  
  public abstract void editRule(RMRule paramRMRule, RMEditRuleSuccessCallback paramRMEditRuleSuccessCallback, RMEditRuleErrorCallback paramRMEditRuleErrorCallback);
  
  public abstract void enableRule(int paramInt, RMToggleRuleSuccessCallback paramRMToggleRuleSuccessCallback, RMToggleRuleErrorCallback paramRMToggleRuleErrorCallback);
  
  public abstract void fetchRules(RMShowRulesSuccessCallback paramRMShowRulesSuccessCallback, RMShowRulesErrorCallback paramRMShowRulesErrorCallback);
  
  public abstract void getRule(int paramInt, RMGetRuleSuccessCallback paramRMGetRuleSuccessCallback, RMGetRuleErrorCallback paramRMGetRuleErrorCallback);
  
  public abstract void getRuleFromCache(int paramInt, RMGetRuleSuccessCallback paramRMGetRuleSuccessCallback, RMGetRuleErrorCallback paramRMGetRuleErrorCallback);
  
  public abstract void getRulesListFromCache(RMShowRulesSuccessCallback paramRMShowRulesSuccessCallback, RMShowRulesErrorCallback paramRMShowRulesErrorCallback);
  
  public abstract void saveRule(RMRule paramRMRule, RMSaveRuleSuccessCallback paramRMSaveRuleSuccessCallback, RMSaveRuleErrorCallback paramRMSaveRuleErrorCallback);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/RMIRules.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */