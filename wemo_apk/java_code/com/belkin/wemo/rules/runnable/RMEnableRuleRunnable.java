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
import com.belkin.wemo.rules.data.callback.RMRuleConflictErrorCallback;
import com.belkin.wemo.rules.data.callback.RMRuleConflictSuccessCallback;
import com.belkin.wemo.rules.data.error.RMRuleConflictError;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.store.RMStoreRulesManager;
import com.belkin.wemo.rules.store.callback.RMStoreRulesErrorCallback;
import com.belkin.wemo.rules.store.callback.RMStoreRulesSuccessCallback;
import com.belkin.wemo.runnable.WeMoRunnable;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import java.util.List;

public class RMEnableRuleRunnable
  extends WeMoRunnable
{
  private List<DeviceInformation> activeDeviceList;
  protected RMToggleRuleErrorCallback errorCallback;
  protected RMRule rule;
  protected int ruleId;
  protected RMToggleRuleSuccessCallback successCallback;
  
  public RMEnableRuleRunnable(int paramInt, RMToggleRuleSuccessCallback paramRMToggleRuleSuccessCallback, RMToggleRuleErrorCallback paramRMToggleRuleErrorCallback, List<DeviceInformation> paramList)
  {
    this.successCallback = paramRMToggleRuleSuccessCallback;
    this.errorCallback = paramRMToggleRuleErrorCallback;
    this.ruleId = paramInt;
    this.activeDeviceList = paramList;
  }
  
  protected int getRequestedState()
  {
    return 1;
  }
  
  protected void restorePreviousState(RMRule paramRMRule)
  {
    paramRMRule.setState(0);
    RMUserRules.INSTANCE.setTempDBRuleToEditOrDelete(null);
  }
  
  public void run()
  {
    RMFetchBeforeEnableCallback localRMFetchBeforeEnableCallback = new RMFetchBeforeEnableCallback(this.activeDeviceList);
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMUpdateRulesRunnable(localRMFetchBeforeEnableCallback, localRMFetchBeforeEnableCallback, RMUserRules.INSTANCE.getRulesType(this.ruleId), this.activeDeviceList));
  }
  
  protected class RMEnableRuleConflictCallback
    implements RMRuleConflictErrorCallback, RMRuleConflictSuccessCallback
  {
    private List<DeviceInformation> activeDeviceList;
    private RMToggleRuleErrorCallback errorCallback;
    private RMRule rule;
    private RMToggleRuleSuccessCallback successCallback;
    
    public RMEnableRuleConflictCallback(RMToggleRuleSuccessCallback paramRMToggleRuleSuccessCallback, RMToggleRuleErrorCallback paramRMToggleRuleErrorCallback, List<DeviceInformation> paramList)
    {
      this.successCallback = paramRMToggleRuleErrorCallback;
      this.errorCallback = paramList;
      this.rule = paramRMToggleRuleSuccessCallback;
      List localList;
      this.activeDeviceList = localList;
    }
    
    public void onConflictFound(RMRuleConflictError paramRMRuleConflictError)
    {
      if (this.errorCallback != null) {
        this.errorCallback.onError(new RMRulesError(paramRMRuleConflictError.getErrorCode(), paramRMRuleConflictError.getErrorMessage()));
      }
    }
    
    public void onNoConflictFound()
    {
      this.rule.setState(RMEnableRuleRunnable.this.getRequestedState());
      RMAbstractRuleComposer localRMAbstractRuleComposer = RMRuleComposerFactory.INSTANCE.getInstance(this.rule);
      RMEnableRuleRunnable.RMToggleRuleComposerCallback localRMToggleRuleComposerCallback = new RMEnableRuleRunnable.RMToggleRuleComposerCallback(RMEnableRuleRunnable.this, this.rule, this.successCallback, this.errorCallback, this.activeDeviceList);
      localRMAbstractRuleComposer.enable(localRMToggleRuleComposerCallback, localRMToggleRuleComposerCallback);
    }
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
      if (RMEnableRuleRunnable.this.errorCallback != null) {
        RMEnableRuleRunnable.this.errorCallback.onError(new RMRulesError(paramRMRulesError.getErrorCode(), paramRMRulesError.getErrorMessage()));
      }
    }
    
    public void onSuccess(List<RMRule> paramList)
    {
      RMEnableRuleRunnable.this.rule = RMUserRules.INSTANCE.getRule(RMEnableRuleRunnable.this.ruleId);
      if (RMEnableRuleRunnable.this.rule != null)
      {
        localRMEnableRuleConflictCallback = new RMEnableRuleRunnable.RMEnableRuleConflictCallback(RMEnableRuleRunnable.this, RMEnableRuleRunnable.this.rule, RMEnableRuleRunnable.this.successCallback, RMEnableRuleRunnable.this.errorCallback, this.activeDeviceList);
        RMUserRules.INSTANCE.verifyRuleConflicts(RMEnableRuleRunnable.this.rule, localRMEnableRuleConflictCallback, localRMEnableRuleConflictCallback);
      }
      while (RMEnableRuleRunnable.this.errorCallback == null)
      {
        RMEnableRuleRunnable.RMEnableRuleConflictCallback localRMEnableRuleConflictCallback;
        return;
      }
      RMEnableRuleRunnable.this.errorCallback.onError(new RMRulesError(502, "No rule was found for rule ID provided"));
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
      RMEnableRuleRunnable.this.restorePreviousState(this.rule);
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
      RMEnableRuleRunnable.RMStoreRuleCallback localRMStoreRuleCallback = new RMEnableRuleRunnable.RMStoreRuleCallback(RMEnableRuleRunnable.this, this.rule, this.successCallback, this.errorCallback);
      RMStoreRulesManager.INSTANCE.storeRules(this.rule, localRMStoreRuleCallback, localRMStoreRuleCallback, this.activeDeviceList);
    }
    
    public void onRulesCompositionFailed()
    {
      RMEnableRuleRunnable.this.restorePreviousState(this.rule);
      if (this.errorCallback != null) {
        this.errorCallback.onError(new RMRulesError());
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/runnable/RMEnableRuleRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */