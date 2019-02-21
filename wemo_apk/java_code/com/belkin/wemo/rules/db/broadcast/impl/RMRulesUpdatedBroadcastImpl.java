package com.belkin.wemo.rules.db.broadcast.impl;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.db.broadcast.RMIRulesUpdatedBroadcaster;
import com.belkin.wemo.rules.db.listener.RMOnRulesUpdatedListener;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class RMRulesUpdatedBroadcastImpl
  implements RMIRulesUpdatedBroadcaster
{
  private static final String TAG = RMRulesUpdatedBroadcastImpl.class.getSimpleName();
  private List<RMOnRulesUpdatedListener> listenerList = new ArrayList();
  
  public void registerOnRulesUpdatedListener(RMOnRulesUpdatedListener paramRMOnRulesUpdatedListener)
  {
    if (paramRMOnRulesUpdatedListener != null) {
      this.listenerList.add(paramRMOnRulesUpdatedListener);
    }
  }
  
  public void sendRulesUpdatedBroadcast()
  {
    SDKLogUtils.debugLog(TAG, "Fetch Rules: Rules have been updated. Sending broadcast to listeners. Listener count: " + this.listenerList.size());
    Iterator localIterator = this.listenerList.iterator();
    while (localIterator.hasNext()) {
      ((RMOnRulesUpdatedListener)localIterator.next()).onRulesDBUpdated();
    }
  }
  
  public void unregisterAllOnRulesUpdatedListeners()
  {
    this.listenerList.clear();
  }
  
  public void unregisterOnRulesUpdatedListener(RMOnRulesUpdatedListener paramRMOnRulesUpdatedListener)
  {
    this.listenerList.remove(paramRMOnRulesUpdatedListener);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/db/broadcast/impl/RMRulesUpdatedBroadcastImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */