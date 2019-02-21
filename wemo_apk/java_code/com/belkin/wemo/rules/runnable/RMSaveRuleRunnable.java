package com.belkin.wemo.rules.runnable;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.callback.RMSaveRuleErrorCallback;
import com.belkin.wemo.rules.callback.RMSaveRuleSuccessCallback;
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

public class RMSaveRuleRunnable
  extends WeMoRunnable
{
  private List<DeviceInformation> activeDeviceList;
  private RMSaveRuleErrorCallback errorCallback;
  private RMRule rule;
  private RMSaveRuleSuccessCallback successCallback;
  
  public RMSaveRuleRunnable(RMRule paramRMRule, RMSaveRuleSuccessCallback paramRMSaveRuleSuccessCallback, RMSaveRuleErrorCallback paramRMSaveRuleErrorCallback, List<DeviceInformation> paramList)
  {
    this.successCallback = paramRMSaveRuleSuccessCallback;
    this.errorCallback = paramRMSaveRuleErrorCallback;
    this.rule = paramRMRule;
    this.activeDeviceList = paramList;
  }
  
  public void run()
  {
    RMFetchBeforeSaveCallback localRMFetchBeforeSaveCallback = new RMFetchBeforeSaveCallback(this.activeDeviceList);
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMUpdateRulesRunnable(localRMFetchBeforeSaveCallback, localRMFetchBeforeSaveCallback, this.rule.getRulesType(), this.activeDeviceList));
  }
  
  private class RMFetchBeforeSaveCallback
    implements RMShowRulesErrorCallback, RMShowRulesSuccessCallback
  {
    private List<DeviceInformation> activeDeviceList;
    
    public RMFetchBeforeSaveCallback()
    {
      List localList;
      this.activeDeviceList = localList;
    }
    
    public void onError(RMRulesError paramRMRulesError)
    {
      SDKLogUtils.debugLog(RMSaveRuleRunnable.this.TAG, "Fetch before Store ERROR. Code: " + paramRMRulesError.getErrorCode() + "; Message: " + paramRMRulesError.getErrorMessage());
      if (RMSaveRuleRunnable.this.errorCallback != null) {
        RMSaveRuleRunnable.this.errorCallback.onError(new RMRulesError(paramRMRulesError.getErrorCode(), paramRMRulesError.getErrorMessage()));
      }
    }
    
    public void onSuccess(List<RMRule> paramList)
    {
      SDKLogUtils.debugLog(RMSaveRuleRunnable.this.TAG, "Fetch before Store DONE. Next Step - RULE CONFLICTS.");
      RMSaveRuleRunnable.RMNewRuleConflictCallback localRMNewRuleConflictCallback = new RMSaveRuleRunnable.RMNewRuleConflictCallback(RMSaveRuleRunnable.this, RMSaveRuleRunnable.this.rule, RMSaveRuleRunnable.this.successCallback, RMSaveRuleRunnable.this.errorCallback, this.activeDeviceList);
      RMUserRules.INSTANCE.verifyRuleConflicts(RMSaveRuleRunnable.this.rule, localRMNewRuleConflictCallback, localRMNewRuleConflictCallback);
    }
  }
  
  private class RMNewRuleComposerCallback
    implements RMComposeRulesErrorCallback, RMComposeRulesSuccessCallback
  {
    private List<DeviceInformation> activeDeviceList;
    private RMSaveRuleErrorCallback errorCallback;
    private RMRule rule;
    private RMSaveRuleSuccessCallback successCallback;
    
    public RMNewRuleComposerCallback(RMSaveRuleSuccessCallback paramRMSaveRuleSuccessCallback, RMSaveRuleErrorCallback paramRMSaveRuleErrorCallback, List<DeviceInformation> paramList)
    {
      this.successCallback = paramRMSaveRuleErrorCallback;
      this.errorCallback = paramList;
      this.rule = paramRMSaveRuleSuccessCallback;
      List localList;
      this.activeDeviceList = localList;
    }
    
    public void onRulesComposed()
    {
      SDKLogUtils.debugLog(RMSaveRuleRunnable.this.TAG, "RULE ADDED TO DB and USER RULES. Next Step - STORE RULES (or equivalent API)");
      RMSaveRuleRunnable.RMStoreRuleCallback localRMStoreRuleCallback = new RMSaveRuleRunnable.RMStoreRuleCallback(RMSaveRuleRunnable.this, this.rule, this.successCallback, this.errorCallback);
      RMStoreRulesManager.INSTANCE.storeRules(this.rule, localRMStoreRuleCallback, localRMStoreRuleCallback, this.activeDeviceList);
    }
    
    public void onRulesCompositionFailed()
    {
      RMUserRules.INSTANCE.deleteRule(this.rule);
      if (this.errorCallback != null) {
        this.errorCallback.onError(new RMRulesError());
      }
    }
  }
  
  private class RMNewRuleConflictCallback
    implements RMRuleConflictErrorCallback, RMRuleConflictSuccessCallback
  {
    private List<DeviceInformation> activeDeviceList;
    private RMSaveRuleErrorCallback errorCallback;
    private RMRule rule;
    private RMSaveRuleSuccessCallback successCallback;
    
    public RMNewRuleConflictCallback(RMSaveRuleSuccessCallback paramRMSaveRuleSuccessCallback, RMSaveRuleErrorCallback paramRMSaveRuleErrorCallback, List<DeviceInformation> paramList)
    {
      this.successCallback = paramRMSaveRuleErrorCallback;
      this.errorCallback = paramList;
      this.rule = paramRMSaveRuleSuccessCallback;
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
      SDKLogUtils.debugLog(RMSaveRuleRunnable.this.TAG, "NO RULE CONFLICTS FOUND. Next Step - ADD RULE TO RULES DB AND USER RULES.");
      RMUserRules.INSTANCE.addRule(this.rule);
      RMAbstractRuleComposer localRMAbstractRuleComposer = RMRuleComposerFactory.INSTANCE.getInstance(this.rule);
      RMSaveRuleRunnable.RMNewRuleComposerCallback localRMNewRuleComposerCallback = new RMSaveRuleRunnable.RMNewRuleComposerCallback(RMSaveRuleRunnable.this, this.rule, this.successCallback, this.errorCallback, this.activeDeviceList);
      localRMAbstractRuleComposer.edit(localRMNewRuleComposerCallback, localRMNewRuleComposerCallback);
    }
  }
  
  private class RMStoreRuleCallback
    implements RMStoreRulesSuccessCallback, RMStoreRulesErrorCallback
  {
    private RMSaveRuleErrorCallback errorCallback;
    private RMRule rule;
    private RMSaveRuleSuccessCallback successCallback;
    
    public RMStoreRuleCallback(RMRule paramRMRule, RMSaveRuleSuccessCallback paramRMSaveRuleSuccessCallback, RMSaveRuleErrorCallback paramRMSaveRuleErrorCallback)
    {
      this.successCallback = paramRMSaveRuleSuccessCallback;
      this.errorCallback = paramRMSaveRuleErrorCallback;
      this.rule = paramRMRule;
    }
    
    public void onRulesStored()
    {
      SDKLogUtils.debugLog(RMSaveRuleRunnable.this.TAG, "STORE RULES (or equivalent API) SUCCEEDED. RULE SAVE COMPLETE");
      if (this.successCallback != null) {
        this.successCallback.onSuccess(this.rule);
      }
    }
    
    public void onStoreRulesFailed(RMRulesError paramRMRulesError)
    {
      RMUserRules.INSTANCE.deleteRule(this.rule);
      if (this.errorCallback != null) {
        this.errorCallback.onError(paramRMRulesError);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/runnable/RMSaveRuleRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */