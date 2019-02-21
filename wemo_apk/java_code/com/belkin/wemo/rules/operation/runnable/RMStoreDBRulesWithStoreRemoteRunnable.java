package com.belkin.wemo.rules.operation.runnable;

import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.data.RMUserRules;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesRemoteErrorCallback;
import com.belkin.wemo.rules.operation.callback.RMStoreRulesRemoteSuccessCallback;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import java.util.HashMap;
import java.util.List;

public class RMStoreDBRulesWithStoreRemoteRunnable
  extends RMSyncDBRulesWithStoreRemoteRunnable
{
  public RMStoreDBRulesWithStoreRemoteRunnable(RMStoreRulesRemoteErrorCallback paramRMStoreRulesRemoteErrorCallback, RMStoreRulesRemoteSuccessCallback paramRMStoreRulesRemoteSuccessCallback, List<DeviceInformation> paramList, RMDBRule paramRMDBRule, HashMap<String, Object> paramHashMap, RMIRulesUtils paramRMIRulesUtils)
  {
    super(paramRMStoreRulesRemoteErrorCallback, paramRMStoreRulesRemoteSuccessCallback, paramList, paramRMDBRule, paramHashMap, paramRMIRulesUtils);
  }
  
  protected String getProcessDBValue(RMDBRule paramRMDBRule, String paramString)
  {
    String str = "0";
    if (paramRMDBRule != null)
    {
      if (RMUserRules.INSTANCE.isProcessDBRequired(paramRMDBRule, paramString)) {
        str = "1";
      }
    }
    else {
      return str;
    }
    return "0";
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/runnable/RMStoreDBRulesWithStoreRemoteRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */