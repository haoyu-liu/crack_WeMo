package com.belkin.wemo.rules.operation.impl;

import com.belkin.wemo.cache.utils.RMINetworkUtils;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.RMIRulesDependencyProvider;
import com.belkin.wemo.rules.RMRulesSDK;
import com.belkin.wemo.rules.data.RMDBRule;
import com.belkin.wemo.rules.operation.RMIRulesOperation;
import com.belkin.wemo.rules.util.RMIRulesUtils;

public class RMDBRulesOperationFactory
{
  private static final String TAG = RMDBRulesOperationFactory.class.getSimpleName();
  
  public static RMIRulesOperation<RMDBRule> getInstance()
  {
    RMRulesSDK localRMRulesSDK = RMRulesSDK.instance();
    RMDBRulesLocalOperationImpl localRMDBRulesLocalOperationImpl = null;
    RMIRulesUtils localRMIRulesUtils;
    if (localRMRulesSDK != null)
    {
      boolean bool = localRMRulesSDK.getDependencyProvider().provideNetworkUtils().isLocal();
      SDKLogUtils.debugLog(TAG, "Fetch Rules: Is network mode local: " + bool);
      localRMIRulesUtils = localRMRulesSDK.getDependencyProvider().provideIRulesUtils();
      if (bool) {
        localRMDBRulesLocalOperationImpl = new RMDBRulesLocalOperationImpl(localRMIRulesUtils);
      }
    }
    else
    {
      return localRMDBRulesLocalOperationImpl;
    }
    return new RMDBRulesRemoteOperationImpl(localRMIRulesUtils);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/impl/RMDBRulesOperationFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */