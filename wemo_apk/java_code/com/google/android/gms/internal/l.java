package com.google.android.gms.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.IBinder;
import android.os.Message;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

public final class l
  implements Handler.Callback
{
  private static final Object bJ = new Object();
  private static l bK;
  private final Context bL;
  private final HashMap<String, a> bM = new HashMap();
  private final Handler mHandler = new Handler(paramContext.getMainLooper(), this);
  
  private l(Context paramContext)
  {
    this.bL = paramContext.getApplicationContext();
  }
  
  public static l g(Context paramContext)
  {
    synchronized (bJ)
    {
      if (bK == null) {
        bK = new l(paramContext.getApplicationContext());
      }
      return bK;
    }
  }
  
  public boolean a(String paramString, k<?>.e paramk)
  {
    for (;;)
    {
      a locala;
      synchronized (this.bM)
      {
        locala = (a)this.bM.get(paramString);
        if (locala == null)
        {
          locala = new a(paramString);
          locala.a(paramk);
          Intent localIntent1 = new Intent(paramString).setPackage("com.google.android.gms");
          locala.b(this.bL.bindService(localIntent1, locala.F(), 129));
          this.bM.put(paramString, locala);
          boolean bool = locala.isBound();
          return bool;
        }
        this.mHandler.removeMessages(0, locala);
        if (locala.c(paramk)) {
          throw new IllegalStateException("Trying to bind a GmsServiceConnection that was already connected before.  startServiceAction=" + paramString);
        }
      }
      locala.a(paramk);
      switch (locala.getState())
      {
      case 1: 
        paramk.onServiceConnected(locala.getComponentName(), locala.getBinder());
        break;
      case 2: 
        Intent localIntent2 = new Intent(paramString).setPackage("com.google.android.gms");
        locala.b(this.bL.bindService(localIntent2, locala.F(), 129));
      }
    }
  }
  
  public void b(String paramString, k<?>.e paramk)
  {
    a locala;
    synchronized (this.bM)
    {
      locala = (a)this.bM.get(paramString);
      if (locala == null) {
        throw new IllegalStateException("Nonexistent connection status for service action: " + paramString);
      }
    }
    if (!locala.c(paramk)) {
      throw new IllegalStateException("Trying to unbind a GmsServiceConnection  that was not bound before.  startServiceAction=" + paramString);
    }
    locala.b(paramk);
    if (locala.H())
    {
      Message localMessage = this.mHandler.obtainMessage(0, locala);
      this.mHandler.sendMessageDelayed(localMessage, 5000L);
    }
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    switch (paramMessage.what)
    {
    default: 
      return false;
    }
    a locala = (a)paramMessage.obj;
    synchronized (this.bM)
    {
      if (locala.H())
      {
        this.bL.unbindService(locala.F());
        this.bM.remove(locala.G());
      }
      return true;
    }
  }
  
  final class a
  {
    private final String bN;
    private final a bO;
    private final HashSet<k<?>.e> bP;
    private boolean bQ;
    private IBinder bR;
    private ComponentName bS;
    private int mState;
    
    public a(String paramString)
    {
      this.bN = paramString;
      this.bO = new a();
      this.bP = new HashSet();
      this.mState = 0;
    }
    
    public a F()
    {
      return this.bO;
    }
    
    public String G()
    {
      return this.bN;
    }
    
    public boolean H()
    {
      return this.bP.isEmpty();
    }
    
    public void a(k<?>.e paramk)
    {
      this.bP.add(paramk);
    }
    
    public void b(k<?>.e paramk)
    {
      this.bP.remove(paramk);
    }
    
    public void b(boolean paramBoolean)
    {
      this.bQ = paramBoolean;
    }
    
    public boolean c(k<?>.e paramk)
    {
      return this.bP.contains(paramk);
    }
    
    public IBinder getBinder()
    {
      return this.bR;
    }
    
    public ComponentName getComponentName()
    {
      return this.bS;
    }
    
    public int getState()
    {
      return this.mState;
    }
    
    public boolean isBound()
    {
      return this.bQ;
    }
    
    public class a
      implements ServiceConnection
    {
      public a() {}
      
      public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
      {
        synchronized (l.a(l.this))
        {
          l.a.a(l.a.this, paramIBinder);
          l.a.a(l.a.this, paramComponentName);
          Iterator localIterator = l.a.a(l.a.this).iterator();
          if (localIterator.hasNext()) {
            ((k.e)localIterator.next()).onServiceConnected(paramComponentName, paramIBinder);
          }
        }
        l.a.a(l.a.this, 1);
      }
      
      public void onServiceDisconnected(ComponentName paramComponentName)
      {
        synchronized (l.a(l.this))
        {
          l.a.a(l.a.this, null);
          l.a.a(l.a.this, paramComponentName);
          Iterator localIterator = l.a.a(l.a.this).iterator();
          if (localIterator.hasNext()) {
            ((k.e)localIterator.next()).onServiceDisconnected(paramComponentName);
          }
        }
        l.a.a(l.a.this, 2);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/l.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */