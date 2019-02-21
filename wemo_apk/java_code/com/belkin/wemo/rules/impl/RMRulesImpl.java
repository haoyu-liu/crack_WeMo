package com.belkin.wemo.rules.impl;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.RMIRules;
import com.belkin.wemo.rules.RMIRulesDependencyProvider;
import com.belkin.wemo.rules.RMRulesSDK;
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
import com.belkin.wemo.rules.data.RMUserRules;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.runnable.RMDeleteRuleRunnable;
import com.belkin.wemo.rules.runnable.RMDisableRuleRunnable;
import com.belkin.wemo.rules.runnable.RMEditRuleRunnable;
import com.belkin.wemo.rules.runnable.RMEnableRuleRunnable;
import com.belkin.wemo.rules.runnable.RMGetCacheRuleRunnable;
import com.belkin.wemo.rules.runnable.RMGetCacheRulesListRunnable;
import com.belkin.wemo.rules.runnable.RMResetDeviceRulesRunnable;
import com.belkin.wemo.rules.runnable.RMSaveRuleRunnable;
import com.belkin.wemo.rules.runnable.RMShowRulesRunnable;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;

public class RMRulesImpl
  implements RMIRules
{
  public static final String RULES_FLOW_FETCH = "Fetch Rules";
  public static final String TAG = RMRulesImpl.class.getSimpleName();
  
  public void deleteRule(int paramInt, RMDeleteRuleSuccessCallback paramRMDeleteRuleSuccessCallback, RMDeleteRuleErrorCallback paramRMDeleteRuleErrorCallback)
  {
    SDKLogUtils.debugLog(TAG, "DELETE RULE REQUEST for RULE ID: " + paramInt);
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMDeleteRuleRunnable(paramInt, paramRMDeleteRuleSuccessCallback, paramRMDeleteRuleErrorCallback, RMRulesSDK.instance().getDependencyProvider().provideIRulesUtils().getOnlineDeviceInformationList()));
  }
  
  public void deleteRulesFromDevice(String paramString, RMResetDeviceRulesSuccessCallback paramRMResetDeviceRulesSuccessCallback, RMResetDeviceRulesErrorCallback paramRMResetDeviceRulesErrorCallback)
  {
    SDKLogUtils.debugLog(TAG, "DELETE ALL RULES REQUEST FOR UDN: " + paramString);
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMResetDeviceRulesRunnable(paramString, paramRMResetDeviceRulesSuccessCallback, paramRMResetDeviceRulesErrorCallback, RMRulesSDK.instance().getDependencyProvider().provideIRulesUtils().getOnlineDeviceInformationList()));
  }
  
  public void disableRule(int paramInt, RMToggleRuleSuccessCallback paramRMToggleRuleSuccessCallback, RMToggleRuleErrorCallback paramRMToggleRuleErrorCallback)
  {
    SDKLogUtils.debugLog(TAG, "DISABLE RULE REQUEST for RULE ID: " + paramInt);
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMDisableRuleRunnable(paramInt, paramRMToggleRuleSuccessCallback, paramRMToggleRuleErrorCallback, RMRulesSDK.instance().getDependencyProvider().provideIRulesUtils().getOnlineDeviceInformationList()));
  }
  
  public void editRule(RMRule paramRMRule, RMEditRuleSuccessCallback paramRMEditRuleSuccessCallback, RMEditRuleErrorCallback paramRMEditRuleErrorCallback)
  {
    SDKLogUtils.debugLog(TAG, "EDIT RULE REQUEST for RULE OBJ: " + paramRMRule.toString());
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMEditRuleRunnable(paramRMRule, paramRMEditRuleSuccessCallback, paramRMEditRuleErrorCallback, RMRulesSDK.instance().getDependencyProvider().provideIRulesUtils().getOnlineDeviceInformationList()));
  }
  
  public void enableRule(int paramInt, RMToggleRuleSuccessCallback paramRMToggleRuleSuccessCallback, RMToggleRuleErrorCallback paramRMToggleRuleErrorCallback)
  {
    SDKLogUtils.debugLog(TAG, "ENABLE RULE REQUEST for RULE ID: " + paramInt);
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMEnableRuleRunnable(paramInt, paramRMToggleRuleSuccessCallback, paramRMToggleRuleErrorCallback, RMRulesSDK.instance().getDependencyProvider().provideIRulesUtils().getOnlineDeviceInformationList()));
  }
  
  public void fetchRules(RMShowRulesSuccessCallback paramRMShowRulesSuccessCallback, RMShowRulesErrorCallback paramRMShowRulesErrorCallback)
  {
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMShowRulesRunnable(paramRMShowRulesSuccessCallback, paramRMShowRulesErrorCallback, RMRulesSDK.instance().getDependencyProvider().provideIRulesUtils().getOnlineDeviceInformationList()));
  }
  
  public void getRule(int paramInt, RMGetRuleSuccessCallback paramRMGetRuleSuccessCallback, RMGetRuleErrorCallback paramRMGetRuleErrorCallback)
  {
    RMRule localRMRule = RMUserRules.INSTANCE.getRule(paramInt);
    if (localRMRule == null) {
      if (paramRMGetRuleErrorCallback != null) {
        paramRMGetRuleErrorCallback.onError(new RMRulesError(502, "No rule was found for rule ID provided"));
      }
    }
    while (paramRMGetRuleSuccessCallback == null) {
      return;
    }
    paramRMGetRuleSuccessCallback.onSuccess(localRMRule);
  }
  
  public void getRuleFromCache(int paramInt, RMGetRuleSuccessCallback paramRMGetRuleSuccessCallback, RMGetRuleErrorCallback paramRMGetRuleErrorCallback)
  {
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMGetCacheRuleRunnable(paramInt, paramRMGetRuleSuccessCallback, paramRMGetRuleErrorCallback));
  }
  
  public void getRulesListFromCache(RMShowRulesSuccessCallback paramRMShowRulesSuccessCallback, RMShowRulesErrorCallback paramRMShowRulesErrorCallback)
  {
    SDKLogUtils.debugLog(TAG, "GET RULES LIST FROM RULES DB REQUESTED.");
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMGetCacheRulesListRunnable(paramRMShowRulesSuccessCallback, paramRMShowRulesErrorCallback));
  }
  
  public void saveRule(RMRule paramRMRule, RMSaveRuleSuccessCallback paramRMSaveRuleSuccessCallback, RMSaveRuleErrorCallback paramRMSaveRuleErrorCallback)
  {
    SDKLogUtils.debugLog(TAG, "SAVE RULE REQUEST for RULE OBJ: " + paramRMRule.toString());
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMSaveRuleRunnable(paramRMRule, paramRMSaveRuleSuccessCallback, paramRMSaveRuleErrorCallback, RMRulesSDK.instance().getDependencyProvider().provideIRulesUtils().getOnlineDeviceInformationList()));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/impl/RMRulesImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */