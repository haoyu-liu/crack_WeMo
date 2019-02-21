package com.belkin.wemo.rules.runnable;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.rules.callback.RMEditRuleErrorCallback;
import com.belkin.wemo.rules.callback.RMEditRuleSuccessCallback;
import com.belkin.wemo.rules.callback.RMShowRulesErrorCallback;
import com.belkin.wemo.rules.callback.RMShowRulesSuccessCallback;
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

public class RMEditRuleRunnable
  extends WeMoRunnable
{
  private List<DeviceInformation> activeDeviceList;
  private RMEditRuleErrorCallback errorCallback;
  private RMRule oldRule;
  private RMRule rule;
  private RMEditRuleSuccessCallback successCallback;
  
  public RMEditRuleRunnable(RMRule paramRMRule, RMEditRuleSuccessCallback paramRMEditRuleSuccessCallback, RMEditRuleErrorCallback paramRMEditRuleErrorCallback, List<DeviceInformation> paramList)
  {
    this.successCallback = paramRMEditRuleSuccessCallback;
    this.errorCallback = paramRMEditRuleErrorCallback;
    this.rule = paramRMRule;
    this.activeDeviceList = paramList;
  }
  
  public void run()
  {
    RMFetchBeforeEditCallback localRMFetchBeforeEditCallback = new RMFetchBeforeEditCallback(this.activeDeviceList);
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMUpdateRulesRunnable(localRMFetchBeforeEditCallback, localRMFetchBeforeEditCallback, this.rule.getRulesType(), this.activeDeviceList));
  }
  
  private class RMEditRuleComposerCallback
    implements RMComposeRulesErrorCallback, RMComposeRulesSuccessCallback
  {
    private List<DeviceInformation> activeDeviceList;
    private RMEditRuleErrorCallback errorCallback;
    private RMRule rule;
    private RMEditRuleSuccessCallback successCallback;
    
    public RMEditRuleComposerCallback(RMEditRuleSuccessCallback paramRMEditRuleSuccessCallback, RMEditRuleErrorCallback paramRMEditRuleErrorCallback, List<DeviceInformation> paramList)
    {
      this.successCallback = paramRMEditRuleErrorCallback;
      this.errorCallback = paramList;
      this.rule = paramRMEditRuleSuccessCallback;
      List localList;
      this.activeDeviceList = localList;
    }
    
    public void onRulesComposed()
    {
      RMEditRuleRunnable.RMStoreRuleCallback localRMStoreRuleCallback = new RMEditRuleRunnable.RMStoreRuleCallback(RMEditRuleRunnable.this, this.rule, this.successCallback, this.errorCallback);
      RMStoreRulesManager.INSTANCE.storeRules(this.rule, localRMStoreRuleCallback, localRMStoreRuleCallback, this.activeDeviceList);
    }
    
    public void onRulesCompositionFailed()
    {
      if (this.errorCallback != null) {
        this.errorCallback.onError(new RMRulesError());
      }
      RMUserRules.INSTANCE.replaceRule(RMEditRuleRunnable.this.oldRule);
    }
  }
  
  private class RMEditRuleConflictCallback
    implements RMRuleConflictErrorCallback, RMRuleConflictSuccessCallback
  {
    private List<DeviceInformation> activeDeviceList;
    private RMEditRuleErrorCallback errorCallback;
    private RMRule rule;
    private RMEditRuleSuccessCallback successCallback;
    
    public RMEditRuleConflictCallback(RMEditRuleSuccessCallback paramRMEditRuleSuccessCallback, RMEditRuleErrorCallback paramRMEditRuleErrorCallback, List<DeviceInformation> paramList)
    {
      this.successCallback = paramRMEditRuleErrorCallback;
      this.errorCallback = paramList;
      this.rule = paramRMEditRuleSuccessCallback;
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
      RMEditRuleRunnable.access$302(RMEditRuleRunnable.this, RMUserRules.INSTANCE.replaceRule(this.rule));
      RMUserRules.INSTANCE.setTempDBRuleToEditOrDelete(RMEditRuleRunnable.this.oldRule);
      RMAbstractRuleComposer localRMAbstractRuleComposer = RMRuleComposerFactory.INSTANCE.getInstance(this.rule);
      RMEditRuleRunnable.RMEditRuleComposerCallback localRMEditRuleComposerCallback = new RMEditRuleRunnable.RMEditRuleComposerCallback(RMEditRuleRunnable.this, this.rule, this.successCallback, this.errorCallback, this.activeDeviceList);
      localRMAbstractRuleComposer.edit(localRMEditRuleComposerCallback, localRMEditRuleComposerCallback);
    }
  }
  
  private class RMFetchBeforeEditCallback
    implements RMShowRulesErrorCallback, RMShowRulesSuccessCallback
  {
    private List<DeviceInformation> activeDeviceList;
    
    public RMFetchBeforeEditCallback()
    {
      List localList;
      this.activeDeviceList = localList;
    }
    
    public void onError(RMRulesError paramRMRulesError)
    {
      if (RMEditRuleRunnable.this.errorCallback != null) {
        RMEditRuleRunnable.this.errorCallback.onError(new RMRulesError(paramRMRulesError.getErrorCode(), paramRMRulesError.getErrorMessage()));
      }
    }
    
    public void onSuccess(List<RMRule> paramList)
    {
      RMEditRuleRunnable.RMEditRuleConflictCallback localRMEditRuleConflictCallback = new RMEditRuleRunnable.RMEditRuleConflictCallback(RMEditRuleRunnable.this, RMEditRuleRunnable.this.rule, RMEditRuleRunnable.this.successCallback, RMEditRuleRunnable.this.errorCallback, this.activeDeviceList);
      RMUserRules.INSTANCE.verifyRuleConflicts(RMEditRuleRunnable.this.rule, localRMEditRuleConflictCallback, localRMEditRuleConflictCallback);
    }
  }
  
  private class RMStoreRuleCallback
    implements RMStoreRulesSuccessCallback, RMStoreRulesErrorCallback
  {
    private RMEditRuleErrorCallback errorCallback;
    private RMRule rule;
    private RMEditRuleSuccessCallback successCallback;
    
    public RMStoreRuleCallback(RMRule paramRMRule, RMEditRuleSuccessCallback paramRMEditRuleSuccessCallback, RMEditRuleErrorCallback paramRMEditRuleErrorCallback)
    {
      this.successCallback = paramRMEditRuleSuccessCallback;
      this.errorCallback = paramRMEditRuleErrorCallback;
      this.rule = paramRMRule;
    }
    
    public void onRulesStored()
    {
      RMUserRules.INSTANCE.setTempDBRuleToEditOrDelete(null);
      if (this.successCallback != null) {
        this.successCallback.onSuccess(this.rule, RMEditRuleRunnable.this.oldRule);
      }
    }
    
    public void onStoreRulesFailed(RMRulesError paramRMRulesError)
    {
      if (this.errorCallback != null) {
        this.errorCallback.onError(paramRMRulesError);
      }
      RMUserRules.INSTANCE.replaceRule(RMEditRuleRunnable.this.oldRule);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/runnable/RMEditRuleRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */