package com.belkin.wemo.broadcast;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class RemoteAccessBroadcastService
{
  private static RemoteAccessBroadcastService broadcastService;
  private final String TAG = getClass().getSimpleName();
  private Set<RemoteAccessListener> remoteAccessListenerSet = new HashSet();
  
  public static RemoteAccessBroadcastService getInstance()
  {
    try
    {
      if (broadcastService == null) {
        broadcastService = new RemoteAccessBroadcastService();
      }
      RemoteAccessBroadcastService localRemoteAccessBroadcastService = broadcastService;
      return localRemoteAccessBroadcastService;
    }
    finally {}
  }
  
  public boolean addRemoteAccessListener(RemoteAccessListener paramRemoteAccessListener)
  {
    SDKLogUtils.debugLog(this.TAG, "Remote Access Listener Added: " + paramRemoteAccessListener.getClass().getSimpleName());
    return this.remoteAccessListenerSet.add(paramRemoteAccessListener);
  }
  
  public void clearRemoteAccessListenerList()
  {
    this.remoteAccessListenerSet.clear();
  }
  
  public void remoteDisabledNotify()
  {
    SDKLogUtils.debugLog(this.TAG, "Remote Access disabled: Notifying listeners.");
    Iterator localIterator = this.remoteAccessListenerSet.iterator();
    while (localIterator.hasNext()) {
      ((RemoteAccessListener)localIterator.next()).onRemoteAccessDisabled();
    }
  }
  
  public void remoteEnabledNotify()
  {
    SDKLogUtils.debugLog(this.TAG, "Remote Access enabled: Notifying listeners.");
    Iterator localIterator = this.remoteAccessListenerSet.iterator();
    while (localIterator.hasNext()) {
      ((RemoteAccessListener)localIterator.next()).onRemoteAccessEnabled();
    }
  }
  
  public boolean removeRemoteAccessListener(RemoteAccessListener paramRemoteAccessListener)
  {
    SDKLogUtils.debugLog(this.TAG, "Remote Access Listener Removed: " + paramRemoteAccessListener.getClass().getSimpleName());
    return this.remoteAccessListenerSet.remove(paramRemoteAccessListener);
  }
  
  public static abstract interface RemoteAccessListener
  {
    public abstract void onRemoteAccessDisabled();
    
    public abstract void onRemoteAccessEnabled();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/broadcast/RemoteAccessBroadcastService.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */