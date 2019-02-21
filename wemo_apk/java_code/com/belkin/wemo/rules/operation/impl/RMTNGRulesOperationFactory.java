package com.belkin.wemo.rules.operation.impl;

import com.belkin.wemo.cache.utils.RMINetworkUtils;
import com.belkin.wemo.rules.RMIRulesDependencyProvider;
import com.belkin.wemo.rules.RMRulesSDK;
import com.belkin.wemo.rules.data.RMTNGRule;
import com.belkin.wemo.rules.operation.RMIRulesOperation;

public class RMTNGRulesOperationFactory
{
  public static RMIRulesOperation<RMTNGRule> getInstance()
  {
    RMRulesSDK localRMRulesSDK = RMRulesSDK.instance();
    RMTNGRulesLocalOperationImpl localRMTNGRulesLocalOperationImpl = null;
    if (localRMRulesSDK != null)
    {
      if (localRMRulesSDK.getDependencyProvider().provideNetworkUtils().isLocal()) {
        localRMTNGRulesLocalOperationImpl = new RMTNGRulesLocalOperationImpl();
      }
    }
    else {
      return localRMTNGRulesLocalOperationImpl;
    }
    return new RMTNGRulesRemoteOperationImpl();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/impl/RMTNGRulesOperationFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */