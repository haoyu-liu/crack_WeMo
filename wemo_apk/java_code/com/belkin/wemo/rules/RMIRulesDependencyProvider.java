package com.belkin.wemo.rules;

import com.belkin.wemo.cache.utils.RMINetworkUtils;
import com.belkin.wemo.rules.db.broadcast.RMIRulesUpdatedBroadcaster;
import com.belkin.wemo.rules.util.RMIRulesUtils;

public abstract interface RMIRulesDependencyProvider
{
  public abstract void cleanUp();
  
  public abstract RMIRulesUtils provideIRulesUtils();
  
  public abstract RMINetworkUtils provideNetworkUtils();
  
  public abstract RMIRulesUpdatedBroadcaster provideRulesUpdateBroadcast();
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/RMIRulesDependencyProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */