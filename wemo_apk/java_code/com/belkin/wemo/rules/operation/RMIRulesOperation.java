package com.belkin.wemo.rules.operation;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.rules.data.RMRule;
import com.belkin.wemo.rules.operation.callback.RMFetchRulesTypeErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMFetchRulesTypeSuccessCallback;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesTypeErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesTypeSuccessCallback;
import com.belkin.wemo.rules.operation.callback.RMSyncRulesTypeErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMSyncRulesTypeSuccessCallback;
import java.util.HashMap;
import java.util.List;

public abstract interface RMIRulesOperation<T extends RMRule>
{
  public static final int FW_VER_NO_STORE_SUPPORT_CODE = 1;
  public static final int FW_VER_STORE_SUPPORT_CODE = 2;
  
  public abstract void fetchRules(List<DeviceInformation> paramList, RMFetchRulesTypeSuccessCallback paramRMFetchRulesTypeSuccessCallback, RMFetchRulesTypeErrorCallback paramRMFetchRulesTypeErrorCallback);
  
  public abstract void storeRules(List<DeviceInformation> paramList, T paramT, HashMap<String, Object> paramHashMap, RMStoreRulesTypeSuccessCallback paramRMStoreRulesTypeSuccessCallback, RMStoreRulesTypeErrorCallback paramRMStoreRulesTypeErrorCallback);
  
  public abstract void syncRules(List<DeviceInformation> paramList, HashMap<String, Object> paramHashMap, RMSyncRulesTypeSuccessCallback paramRMSyncRulesTypeSuccessCallback, RMSyncRulesTypeErrorCallback paramRMSyncRulesTypeErrorCallback);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/RMIRulesOperation.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */