package com.belkin.wemo.rules;

import com.belkin.wemo.cache.utils.RMINetworkUtils;
import com.belkin.wemo.cache.utils.RMNetworkUtilsImpl;
import com.belkin.wemo.rules.db.broadcast.RMIRulesUpdatedBroadcaster;
import com.belkin.wemo.rules.db.broadcast.impl.RMRulesUpdatedBroadcastImpl;
import com.belkin.wemo.rules.util.RMIRulesUtils;
import com.belkin.wemo.rules.util.impl.RMRulesUtilsImpl;

public class RMRulesDependencyProviderImpl
  implements RMIRulesDependencyProvider
{
  protected RMINetworkUtils networkUtils = createNetworkUtils();
  protected RMIRulesUpdatedBroadcaster rulesUpdateBroadcaster = createRulesUpdateBroadcaster();
  protected RMIRulesUtils rulesUtils = createRulesUtils();
  
  public void cleanUp()
  {
    this.rulesUtils = null;
    this.networkUtils = null;
    if (this.rulesUpdateBroadcaster != null)
    {
      this.rulesUpdateBroadcaster.unregisterAllOnRulesUpdatedListeners();
      this.rulesUpdateBroadcaster = null;
    }
  }
  
  protected RMINetworkUtils createNetworkUtils()
  {
    return new RMNetworkUtilsImpl();
  }
  
  protected RMIRulesUpdatedBroadcaster createRulesUpdateBroadcaster()
  {
    return new RMRulesUpdatedBroadcastImpl();
  }
  
  protected RMIRulesUtils createRulesUtils()
  {
    return new RMRulesUtilsImpl();
  }
  
  public RMIRulesUtils provideIRulesUtils()
  {
    return this.rulesUtils;
  }
  
  public RMINetworkUtils provideNetworkUtils()
  {
    return this.networkUtils;
  }
  
  public RMIRulesUpdatedBroadcaster provideRulesUpdateBroadcast()
  {
    return this.rulesUpdateBroadcaster;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/RMRulesDependencyProviderImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */