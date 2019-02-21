package com.belkin.wemo.rules.runnable;

import android.text.TextUtils;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.RMIRulesDependencyProvider;
import com.belkin.wemo.rules.RMRulesSDK;
import com.belkin.wemo.rules.callback.RMResetDeviceRulesErrorCallback;
import com.belkin.wemo.rules.callback.RMResetDeviceRulesSuccessCallback;
import com.belkin.wemo.rules.callback.RMShowRulesErrorCallback;
import com.belkin.wemo.rules.callback.RMShowRulesSuccessCallback;
import com.belkin.wemo.rules.data.RMRule;
import com.belkin.wemo.rules.db.RMResetDBRulesManager;
import com.belkin.wemo.rules.error.RMRulesError;
import com.belkin.wemo.rules.error.RMRulesTypeError;
import com.belkin.wemo.rules.operation.RMIRulesOperation;
import com.belkin.wemo.rules.operation.callback.RMSyncRulesTypeErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMSyncRulesTypeSuccessCallback;
import com.belkin.wemo.rules.operation.impl.RMDBRulesOperationFactory;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import com.belkin.wemo.runnable.WeMoRunnable;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

public class RMResetDeviceRulesRunnable
  extends WeMoRunnable
{
  private List<DeviceInformation> activeDeviceList;
  private String deviceUdn;
  private RMResetDeviceRulesErrorCallback errorCallback;
  private RMResetDeviceRulesSuccessCallback successCallback;
  
  public RMResetDeviceRulesRunnable(String paramString, RMResetDeviceRulesSuccessCallback paramRMResetDeviceRulesSuccessCallback, RMResetDeviceRulesErrorCallback paramRMResetDeviceRulesErrorCallback, List<DeviceInformation> paramList)
  {
    this.successCallback = paramRMResetDeviceRulesSuccessCallback;
    this.errorCallback = paramRMResetDeviceRulesErrorCallback;
    this.deviceUdn = paramString;
    this.activeDeviceList = paramList;
  }
  
  public void run()
  {
    SDKLogUtils.debugLog(this.TAG, "Reset Device Rules: FETCHING RULES");
    RMFetchBeforeEditCallback localRMFetchBeforeEditCallback = new RMFetchBeforeEditCallback(this.activeDeviceList);
    WeMoThreadPoolHandler.getInstance().executeViaBackground(new RMUpdateRulesRunnable(localRMFetchBeforeEditCallback, localRMFetchBeforeEditCallback, 2, this.activeDeviceList));
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
      if (RMResetDeviceRulesRunnable.this.errorCallback != null) {
        RMResetDeviceRulesRunnable.this.errorCallback.onError(new RMRulesError(paramRMRulesError.getErrorCode(), paramRMRulesError.getErrorMessage()));
      }
    }
    
    public void onSuccess(List<RMRule> paramList)
    {
      SDKLogUtils.debugLog(RMResetDeviceRulesRunnable.this.TAG, "Reset Device Rules: FETCH RULES COMPLETE. RESETING DEVICE RULE ENTRIES FROM DB.");
      int i = new RMResetDBRulesManager(RMResetDeviceRulesRunnable.this.deviceUdn).resetDeviceRules();
      SDKLogUtils.debugLog(RMResetDeviceRulesRunnable.this.TAG, "Reset Device Rules: Numer rules modified = " + i + "; UDN: " + RMResetDeviceRulesRunnable.this.deviceUdn);
      RMIRulesUtils localRMIRulesUtils;
      String str1;
      String str2;
      if (i > 0)
      {
        SDKLogUtils.debugLog(RMResetDeviceRulesRunnable.this.TAG, "Reset Device Rules: RESETING DEVICE RULE ENTRIES FROM DB - COMPLETE. CALLING STORE RULES.");
        localRMIRulesUtils = RMRulesSDK.instance().getDependencyProvider().provideIRulesUtils();
        str1 = localRMIRulesUtils.getDBFilePathWithNameInApp();
        str2 = localRMIRulesUtils.getZippedDBFilePathWithNameInApp();
        if (TextUtils.isEmpty(str2)) {}
      }
      do
      {
        do
        {
          try
          {
            localRMIRulesUtils.createZipFileInApp(str1, str2);
            HashMap localHashMap = new HashMap();
            localHashMap.put("db_zip_file", str2);
            localHashMap.put("new_db_version", Integer.valueOf(1 + Integer.valueOf(RMRulesSDK.instance().getDependencyProvider().provideIRulesUtils().getRulesDBVerion()).intValue()));
            localHashMap.put("process_db", Integer.valueOf(1));
            RMResetDeviceRulesRunnable.RMStoreRuleCallback localRMStoreRuleCallback = new RMResetDeviceRulesRunnable.RMStoreRuleCallback(RMResetDeviceRulesRunnable.this, RMResetDeviceRulesRunnable.this.successCallback, RMResetDeviceRulesRunnable.this.errorCallback);
            RMIRulesOperation localRMIRulesOperation = RMDBRulesOperationFactory.getInstance();
            if (localRMIRulesOperation != null) {
              localRMIRulesOperation.syncRules(this.activeDeviceList, localHashMap, localRMStoreRuleCallback, localRMStoreRuleCallback);
            }
            return;
          }
          catch (IOException localIOException)
          {
            for (;;)
            {
              SDKLogUtils.errorLog(RMResetDeviceRulesRunnable.this.TAG, "Store Rules: Exception during zip for syncing devices with lower db version: ", localIOException);
            }
          }
          if (i != 0) {
            break;
          }
          SDKLogUtils.debugLog(RMResetDeviceRulesRunnable.this.TAG, "Reset Device Rules: NO RULES FOUND FOR DEVICE. MOVING TO NEXT STEP.");
        } while (RMResetDeviceRulesRunnable.this.successCallback == null);
        RMResetDeviceRulesRunnable.this.successCallback.onAllDeviceRulesReset(RMResetDeviceRulesRunnable.this.deviceUdn);
        return;
      } while (RMResetDeviceRulesRunnable.this.errorCallback == null);
      RMResetDeviceRulesRunnable.this.errorCallback.onError(new RMRulesError(-1, "Unable to delete rules for device: " + RMResetDeviceRulesRunnable.this.deviceUdn));
    }
  }
  
  private class RMStoreRuleCallback
    implements RMSyncRulesTypeSuccessCallback, RMSyncRulesTypeErrorCallback
  {
    private RMResetDeviceRulesErrorCallback errorCallback;
    private RMResetDeviceRulesSuccessCallback successCallback;
    
    public RMStoreRuleCallback(RMResetDeviceRulesSuccessCallback paramRMResetDeviceRulesSuccessCallback, RMResetDeviceRulesErrorCallback paramRMResetDeviceRulesErrorCallback)
    {
      this.successCallback = paramRMResetDeviceRulesSuccessCallback;
      this.errorCallback = paramRMResetDeviceRulesErrorCallback;
    }
    
    public void onError(RMRulesTypeError paramRMRulesTypeError)
    {
      if (this.errorCallback != null) {
        this.errorCallback.onError(new RMRulesError(paramRMRulesTypeError.getErrorCode(), paramRMRulesTypeError.getErrorMessage()));
      }
    }
    
    public void onSingleTypeRulesSyncError(int paramInt, List<String> paramList)
    {
      if (this.errorCallback != null) {
        this.errorCallback.onError(new RMRulesError());
      }
    }
    
    public void onSingleTypeRulesSynced(int paramInt)
    {
      SDKLogUtils.debugLog(RMResetDeviceRulesRunnable.this.TAG, "Reset Device Rules: STORE RULES COMPLETE - SENDNING RESPONSE TO CALLBACK, IF AVAILABLE.");
      if (this.successCallback != null) {
        this.successCallback.onAllDeviceRulesReset(RMResetDeviceRulesRunnable.this.deviceUdn);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */