package com.belkin.wemo.rules.runnable;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.rules.callback.RMDeleteRuleErrorCallback;
import com.belkin.wemo.rules.callback.RMDeleteRuleSuccessCallback;
import com.belkin.wemo.rules.callback.RMShowRulesErrorCallback;
import com.belkin.wemo.rules.callback.RMShowRulesSuccessCallback;
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

public class RMDeleteRuleRunnable
  extends WeMoRunnable
{
  private List<DeviceInformation> activeDeviceList;
  private RMRule deletedRule;
  private RMDeleteRuleErrorCallback errorCallback;
  private int ruleId;
  private RMDeleteRuleSuccessCallback successCallback;
  
  public RMDeleteRuleRunnable(int paramInt, RMDeleteRuleSuccessCallback paramRMDeleteRuleSuccessCallback, RMDeleteRuleErrorCallback paramRMDeleteRuleErrorCallback, List<DeviceInformation> paramList)
  {
    this.successCallback = paramRMDeleteRuleSuccessCallback;
    this.errorCallback = paramRMDeleteRuleErrorCallback;
    this.ruleId = paramInt;
    this.activeDeviceList = paramList;
  }
  
  private void revertRuleState(RMRule paramRMRule)
  {
    RMUserRules.INSTANCE.setTempDBRuleToEditOrDelete(null);
    RMUserRules.INSTANCE.addRule(paramRMRule);
  }
  
  public void run()
  {
    RMFetchBeforeDeleteCallback localRMFetchBeforeDeleteCallback = new RMFetchBeforeDeleteCallback(this.activeDeviceList, null);
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMUpdateRulesRunnable(localRMFetchBeforeDeleteCallback, localRMFetchBeforeDeleteCallback, RMUserRules.INSTANCE.getRulesType(this.ruleId), this.activeDeviceList));
  }
  
  private class RMDeleteRuleComposerCallback
    implements RMComposeRulesErrorCallback, RMComposeRulesSuccessCallback
  {
    private List<DeviceInformation> activeDeviceList;
    private RMRule deletedRule;
    private RMDeleteRuleErrorCallback errorCallback;
    private RMDeleteRuleSuccessCallback successCallback;
    
    public RMDeleteRuleComposerCallback(RMDeleteRuleSuccessCallback paramRMDeleteRuleSuccessCallback, RMDeleteRuleErrorCallback paramRMDeleteRuleErrorCallback, List<DeviceInformation> paramList)
    {
      this.successCallback = paramRMDeleteRuleErrorCallback;
      this.errorCallback = paramList;
      this.deletedRule = paramRMDeleteRuleSuccessCallback;
      this.deletedRule.isDelete = true;
      List localList;
      this.activeDeviceList = localList;
    }
    
    public void onRulesComposed()
    {
      RMDeleteRuleRunnable.RMStoreRuleCallback localRMStoreRuleCallback = new RMDeleteRuleRunnable.RMStoreRuleCallback(RMDeleteRuleRunnable.this, this.deletedRule, this.successCallback, this.errorCallback);
      RMStoreRulesManager.INSTANCE.storeRules(this.deletedRule, localRMStoreRuleCallback, localRMStoreRuleCallback, this.activeDeviceList);
    }
    
    public void onRulesCompositionFailed()
    {
      RMDeleteRuleRunnable.this.revertRuleState(this.deletedRule);
      if (this.errorCallback != null) {
        this.errorCallback.onError(new RMRulesError());
      }
    }
  }
  
  private class RMFetchBeforeDeleteCallback
    implements RMShowRulesErrorCallback, RMShowRulesSuccessCallback
  {
    private List<DeviceInformation> activeDeviceList;
    
    private RMFetchBeforeDeleteCallback()
    {
      List localList;
      this.activeDeviceList = localList;
    }
    
    public void onError(RMRulesError paramRMRulesError)
    {
      if (RMDeleteRuleRunnable.this.errorCallback != null) {
        RMDeleteRuleRunnable.this.errorCallback.onError(new RMRulesError(paramRMRulesError.getErrorCode(), paramRMRulesError.getErrorMessage()));
      }
    }
    
    public void onSuccess(List<RMRule> paramList)
    {
      RMDeleteRuleRunnable.access$102(RMDeleteRuleRunnable.this, RMUserRules.INSTANCE.deleteRule(RMDeleteRuleRunnable.this.ruleId));
      if (RMDeleteRuleRunnable.this.deletedRule == null)
      {
        if (RMDeleteRuleRunnable.this.errorCallback != null) {
          RMDeleteRuleRunnable.this.errorCallback.onError(new RMRulesError(502, "No rule was found for rule ID provided"));
        }
        return;
      }
      RMUserRules.INSTANCE.setTempDBRuleToEditOrDelete(RMDeleteRuleRunnable.this.deletedRule);
      RMAbstractRuleComposer localRMAbstractRuleComposer = RMRuleComposerFactory.INSTANCE.getInstance(RMDeleteRuleRunnable.this.deletedRule);
      RMDeleteRuleRunnable.RMDeleteRuleComposerCallback localRMDeleteRuleComposerCallback = new RMDeleteRuleRunnable.RMDeleteRuleComposerCallback(RMDeleteRuleRunnable.this, RMDeleteRuleRunnable.this.deletedRule, RMDeleteRuleRunnable.this.successCallback, RMDeleteRuleRunnable.this.errorCallback, this.activeDeviceList);
      localRMAbstractRuleComposer.delete(localRMDeleteRuleComposerCallback, localRMDeleteRuleComposerCallback);
    }
  }
  
  private class RMStoreRuleCallback
    implements RMStoreRulesSuccessCallback, RMStoreRulesErrorCallback
  {
    private RMRule deletedrule;
    private RMDeleteRuleErrorCallback errorCallback;
    private RMDeleteRuleSuccessCallback successCallback;
    
    public RMStoreRuleCallback(RMRule paramRMRule, RMDeleteRuleSuccessCallback paramRMDeleteRuleSuccessCallback, RMDeleteRuleErrorCallback paramRMDeleteRuleErrorCallback)
    {
      this.successCallback = paramRMDeleteRuleSuccessCallback;
      this.errorCallback = paramRMDeleteRuleErrorCallback;
      this.deletedrule = paramRMRule;
    }
    
    public void onRulesStored()
    {
      RMUserRules.INSTANCE.setTempDBRuleToEditOrDelete(null);
      if (this.successCallback != null) {
        this.successCallback.onSuccess(RMDeleteRuleRunnable.this.deletedRule);
      }
    }
    
    public void onStoreRulesFailed(RMRulesError paramRMRulesError)
    {
      RMDeleteRuleRunnable.this.revertRuleState(this.deletedrule);
      if (this.errorCallback != null) {
        this.errorCallback.onError(paramRMRulesError);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/runnable/RMDeleteRuleRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */