package com.soundcloud.android.crop;

import android.app.Activity;
import android.os.Bundle;
import java.util.ArrayList;
import java.util.Iterator;

abstract class MonitoredActivity
  extends Activity
{
  private final ArrayList<LifeCycleListener> listeners = new ArrayList();
  
  public void addLifeCycleListener(LifeCycleListener paramLifeCycleListener)
  {
    if (this.listeners.contains(paramLifeCycleListener)) {
      return;
    }
    this.listeners.add(paramLifeCycleListener);
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    Iterator localIterator = this.listeners.iterator();
    while (localIterator.hasNext()) {
      ((LifeCycleListener)localIterator.next()).onActivityCreated(this);
    }
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
    Iterator localIterator = this.listeners.iterator();
    while (localIterator.hasNext()) {
      ((LifeCycleListener)localIterator.next()).onActivityDestroyed(this);
    }
  }
  
  protected void onStart()
  {
    super.onStart();
    Iterator localIterator = this.listeners.iterator();
    while (localIterator.hasNext()) {
      ((LifeCycleListener)localIterator.next()).onActivityStarted(this);
    }
  }
  
  protected void onStop()
  {
    super.onStop();
    Iterator localIterator = this.listeners.iterator();
    while (localIterator.hasNext()) {
      ((LifeCycleListener)localIterator.next()).onActivityStopped(this);
    }
  }
  
  public void removeLifeCycleListener(LifeCycleListener paramLifeCycleListener)
  {
    this.listeners.remove(paramLifeCycleListener);
  }
  
  public static class LifeCycleAdapter
    implements MonitoredActivity.LifeCycleListener
  {
    public void onActivityCreated(MonitoredActivity paramMonitoredActivity) {}
    
    public void onActivityDestroyed(MonitoredActivity paramMonitoredActivity) {}
    
    public void onActivityStarted(MonitoredActivity paramMonitoredActivity) {}
    
    public void onActivityStopped(MonitoredActivity paramMonitoredActivity) {}
  }
  
  public static abstract interface LifeCycleListener
  {
    public abstract void onActivityCreated(MonitoredActivity paramMonitoredActivity);
    
    public abstract void onActivityDestroyed(MonitoredActivity paramMonitoredActivity);
    
    public abstract void onActivityStarted(MonitoredActivity paramMonitoredActivity);
    
    public abstract void onActivityStopped(MonitoredActivity paramMonitoredActivity);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/soundcloud/android/crop/MonitoredActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */