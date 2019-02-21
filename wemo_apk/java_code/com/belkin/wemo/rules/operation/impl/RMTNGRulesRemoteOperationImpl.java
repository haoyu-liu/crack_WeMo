package com.belkin.wemo.rules.operation.impl;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.rules.data.RMTNGRule;
import com.belkin.wemo.rules.operation.RMIRulesOperation;
import com.belkin.wemo.rules.operation.callback.RMFetchRulesTypeErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMFetchRulesTypeSuccessCallback;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesTypeErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesTypeSuccessCallback;
import com.belkin.wemo.rules.operation.callback.RMSyncRulesTypeErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMSyncRulesTypeSuccessCallback;
import java.util.HashMap;
import java.util.List;

public class RMTNGRulesRemoteOperationImpl
  implements RMIRulesOperation<RMTNGRule>
{
  public void fetchRules(List<DeviceInformation> paramList, RMFetchRulesTypeSuccessCallback paramRMFetchRulesTypeSuccessCallback, RMFetchRulesTypeErrorCallback paramRMFetchRulesTypeErrorCallback) {}
  
  public void storeRules(List<DeviceInformation> paramList, RMTNGRule paramRMTNGRule, HashMap<String, Object> paramHashMap, RMStoreRulesTypeSuccessCallback paramRMStoreRulesTypeSuccessCallback, RMStoreRulesTypeErrorCallback paramRMStoreRulesTypeErrorCallback) {}
  
  public void syncRules(List<DeviceInformation> paramList, HashMap<String, Object> paramHashMap, RMSyncRulesTypeSuccessCallback paramRMSyncRulesTypeSuccessCallback, RMSyncRulesTypeErrorCallback paramRMSyncRulesTypeErrorCallback) {}
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/impl/RMTNGRulesRemoteOperationImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */