package com.google.android.gms.common;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

public class a
  implements ServiceConnection
{
  private final BlockingQueue<IBinder> A = new LinkedBlockingQueue();
  boolean z = false;
  
  public IBinder e()
    throws InterruptedException
  {
    if (this.z) {
      throw new IllegalStateException();
    }
    this.z = true;
    return (IBinder)this.A.take();
  }
  
  public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
  {
    try
    {
      this.A.put(paramIBinder);
      return;
    }
    catch (InterruptedException localInterruptedException) {}
  }
  
  public void onServiceDisconnected(ComponentName paramComponentName) {}
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/common/a.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */