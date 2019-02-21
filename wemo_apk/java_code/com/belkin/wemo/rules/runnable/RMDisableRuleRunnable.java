package com.belkin.wemo.rules.runnable;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.rules.callback.RMShowRulesErrorCallback;
import com.belkin.wemo.rules.callback.RMShowRulesSuccessCallback;
import com.belkin.wemo.rules.callback.RMToggleRuleErrorCallback;
import com.belkin.wemo.rules.callback.RMToggleRuleSuccessCallback;
import com.belkin.wemo.rules.composer.RMAbstractRuleComposer;
import com.belkin.wemo.rules.composer.callback.RMComposeRulesErrorCallback;
import com.belkin.wemo.rules.composer.callback.RMComposeRulesSuccessCallback;
import com.belkin.wemo.rules.composer.impl.RMRuleComposerFactory;
import com.belkin.wemo.rules.data.RMRule;
import com.belkin.wemo.rules.data.RMUserRules;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.store.RMStoreRulesManager;
import com.belkin.wemo.rules.store.callback.RMStoreRulesErrorCallback;
import com.belkin.wemo.rules.store.callback.RMStoreRulesSuccessCallback;
import com.belkin.wemo.runnable.WeMoRunnable;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import java.util.List;

public class RMDisableRuleRunnable
  extends WeMoRunnable
{
  private List<DeviceInformation> activeDeviceList;
  private RMToggleRuleErrorCallback errorCallback;
  private RMRule rule;
  private int ruleId;
  private RMToggleRuleSuccessCallback successCallback;
  
  public RMDisableRuleRunnable(int paramInt, RMToggleRuleSuccessCallback paramRMToggleRuleSuccessCallback, RMToggleRuleErrorCallback paramRMToggleRuleErrorCallback, List<DeviceInformation> paramList)
  {
    this.successCallback = paramRMToggleRuleSuccessCallback;
    this.errorCallback = paramRMToggleRuleErrorCallback;
    this.ruleId = paramInt;
    this.activeDeviceList = paramList;
  }
  
  protected int getRequestedState()
  {
    return 0;
  }
  
  protected void restorePreviousState(RMRule paramRMRule)
  {
    paramRMRule.setState(1);
    RMUserRules.INSTANCE.setTempDBRuleToEditOrDelete(null);
  }
  
  public void run()
  {
    RMFetchBeforeEnableCallback localRMFetchBeforeEnableCallback = new RMFetchBeforeEnableCallback(this.activeDeviceList);
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMUpdateRulesRunnable(localRMFetchBeforeEnableCallback, localRMFetchBeforeEnableCallback, RMUserRules.INSTANCE.getRulesType(this.ruleId), this.activeDeviceList));
  }
  
  protected class RMFetchBeforeEnableCallback
    implements RMShowRulesErrorCallback, RMShowRulesSuccessCallback
  {
    private List<DeviceInformation> activeDeviceList;
    
    public RMFetchBeforeEnableCallback()
    {
      List localList;
      this.activeDeviceList = localList;
    }
    
    public void onError(RMRulesError paramRMRulesError)
    {
      if (RMDisableRuleRunnable.this.errorCallback != null) {
        RMDisableRuleRunnable.this.errorCallback.onError(new RMRulesError(paramRMRulesError.getErrorCode(), paramRMRulesError.getErrorMessage()));
      }
    }
    
    public void onSuccess(List<RMRule> paramList)
    {
      RMDisableRuleRunnable.access$002(RMDisableRuleRunnable.this, RMUserRules.INSTANCE.getRule(RMDisableRuleRunnable.this.ruleId));
      if (RMDisableRuleRunnable.this.rule != null)
      {
        RMDisableRuleRunnable.this.rule.setState(RMDisableRuleRunnable.this.getRequestedState());
        localRMToggleRuleComposerCallback = new RMDisableRuleRunnable.RMToggleRuleComposerCallback(RMDisableRuleRunnable.this, RMDisableRuleRunnable.this.rule, RMDisableRuleRunnable.this.successCallback, RMDisableRuleRunnable.this.errorCallback, this.activeDeviceList);
        RMRuleComposerFactory.INSTANCE.getInstance(RMDisableRuleRunnable.this.rule).disable(localRMToggleRuleComposerCallback, localRMToggleRuleComposerCallback);
      }
      while (RMDisableRuleRunnable.this.errorCallback == null)
      {
        RMDisableRuleRunnable.RMToggleRuleComposerCallback localRMToggleRuleComposerCallback;
        return;
      }
      RMDisableRuleRunnable.this.errorCallback.onError(new RMRulesError(502, "No rule was found for rule ID provided"));
    }
  }
  
  private class RMStoreRuleCallback
    implements RMStoreRulesSuccessCallback, RMStoreRulesErrorCallback
  {
    private RMToggleRuleErrorCallback errorCallback;
    private RMRule rule;
    private RMToggleRuleSuccessCallback successCallback;
    
    public RMStoreRuleCallback(RMRule paramRMRule, RMToggleRuleSuccessCallback paramRMToggleRuleSuccessCallback, RMToggleRuleErrorCallback paramRMToggleRuleErrorCallback)
    {
      this.successCallback = paramRMToggleRuleSuccessCallback;
      this.errorCallback = paramRMToggleRuleErrorCallback;
      this.rule = paramRMRule;
    }
    
    public void onRulesStored()
    {
      if (this.successCallback != null) {
        this.successCallback.onRuleToggled(this.rule);
      }
    }
    
    public void onStoreRulesFailed(RMRulesError paramRMRulesError)
    {
      RMDisableRuleRunnable.this.restorePreviousState(this.rule);
      if (this.errorCallback != null) {
        this.errorCallback.onError(paramRMRulesError);
      }
    }
  }
  
  protected class RMToggleRuleComposerCallback
    implements RMComposeRulesErrorCallback, RMComposeRulesSuccessCallback
  {
    private List<DeviceInformation> activeDeviceList;
    private RMToggleRuleErrorCallback errorCallback;
    private RMRule rule;
    private RMToggleRuleSuccessCallback successCallback;
    
    public RMToggleRuleComposerCallback(RMToggleRuleSuccessCallback paramRMToggleRuleSuccessCallback, RMToggleRuleErrorCallback paramRMToggleRuleErrorCallback, List<DeviceInformation> paramList)
    {
      this.successCallback = paramRMToggleRuleErrorCallback;
      this.errorCallback = paramList;
      this.rule = paramRMToggleRuleSuccessCallback;
      List localList;
      this.activeDeviceList = localList;
    }
    
    public void onRulesComposed()
    {
      RMDisableRuleRunnable.RMStoreRuleCallback localRMStoreRuleCallback = new RMDisableRuleRunnable.RMStoreRuleCallback(RMDisableRuleRunnable.this, this.rule, this.successCallback, this.errorCallback);
      RMStoreRulesManager.INSTANCE.storeRules(this.rule, localRMStoreRuleCallback, localRMStoreRuleCallback, this.activeDeviceList);
    }
    
    public void onRulesCompositionFailed()
    {
      RMDisableRuleRunnable.this.restorePreviousState(this.rule);
      if (this.errorCallback != null) {
        this.errorCallback.onError(new RMRulesError());
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/runnable/RMDisableRuleRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */