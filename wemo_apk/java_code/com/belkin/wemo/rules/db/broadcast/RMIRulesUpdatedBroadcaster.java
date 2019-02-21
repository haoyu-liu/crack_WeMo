package com.belkin.wemo.rules.db.broadcast;

import com.belkin.wemo.rules.db.listener.RMOnRulesUpdatedListener;

public abstract interface RMIRulesUpdatedBroadcaster
{
  public abstract void registerOnRulesUpdatedListener(RMOnRulesUpdatedListener paramRMOnRulesUpdatedListener);
  
  public abstract void sendRulesUpdatedBroadcast();
  
  public abstract void unregisterAllOnRulesUpdatedListeners();
  
  public abstract void unregisterOnRulesUpdatedListener(RMOnRulesUpdatedListener paramRMOnRulesUpdatedListener);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */