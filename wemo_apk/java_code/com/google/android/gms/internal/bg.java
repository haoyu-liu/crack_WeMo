package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.ContentProviderClient;
import android.content.ContentResolver;
import android.content.Context;
import android.location.Location;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.a.a;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

public class bg
{
  private final bk<bf> fG;
  private ContentProviderClient fH = null;
  private boolean fI = false;
  private HashMap<LocationListener, b> fJ = new HashMap();
  private final ContentResolver mContentResolver;
  
  public bg(Context paramContext, bk<bf> parambk)
  {
    this.fG = parambk;
    this.mContentResolver = paramContext.getContentResolver();
  }
  
  public void aR()
  {
    if (this.fI) {
      setMockMode(false);
    }
  }
  
  public Location getLastLocation()
  {
    this.fG.B();
    try
    {
      Location localLocation = ((bf)this.fG.C()).aQ();
      return localLocation;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }
  
  public void removeAllListeners()
  {
    try
    {
      synchronized (this.fJ)
      {
        Iterator localIterator = this.fJ.values().iterator();
        while (localIterator.hasNext())
        {
          b localb = (b)localIterator.next();
          if (localb != null) {
            ((bf)this.fG.C()).a(localb);
          }
        }
      }
      this.fJ.clear();
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }
  
  public void removeLocationUpdates(PendingIntent paramPendingIntent)
  {
    this.fG.B();
    try
    {
      ((bf)this.fG.C()).a(paramPendingIntent);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }
  
  public void removeLocationUpdates(LocationListener paramLocationListener)
  {
    this.fG.B();
    s.b(paramLocationListener, "Invalid null listener");
    synchronized (this.fJ)
    {
      b localb = (b)this.fJ.remove(paramLocationListener);
      if ((this.fH != null) && (this.fJ.isEmpty()))
      {
        this.fH.release();
        this.fH = null;
      }
      if (localb != null) {
        localb.release();
      }
      try
      {
        ((bf)this.fG.C()).a(localb);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new IllegalStateException(localRemoteException);
      }
    }
  }
  
  public void requestLocationUpdates(LocationRequest paramLocationRequest, PendingIntent paramPendingIntent)
  {
    this.fG.B();
    try
    {
      ((bf)this.fG.C()).a(paramLocationRequest, paramPendingIntent);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }
  
  public void requestLocationUpdates(LocationRequest paramLocationRequest, LocationListener paramLocationListener, Looper paramLooper)
  {
    this.fG.B();
    if (paramLooper == null) {
      s.b(Looper.myLooper(), "Can't create handler inside thread that has not called Looper.prepare()");
    }
    for (;;)
    {
      b localb1;
      synchronized (this.fJ)
      {
        localb1 = (b)this.fJ.get(paramLocationListener);
        if (localb1 == null)
        {
          localb2 = new b(paramLocationListener, paramLooper);
          this.fJ.put(paramLocationListener, localb2);
          try
          {
            ((bf)this.fG.C()).a(paramLocationRequest, localb2);
            return;
          }
          catch (RemoteException localRemoteException)
          {
            throw new IllegalStateException(localRemoteException);
          }
        }
      }
      b localb2 = localb1;
    }
  }
  
  public void setMockLocation(Location paramLocation)
  {
    this.fG.B();
    try
    {
      ((bf)this.fG.C()).setMockLocation(paramLocation);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }
  
  public void setMockMode(boolean paramBoolean)
  {
    this.fG.B();
    try
    {
      ((bf)this.fG.C()).setMockMode(paramBoolean);
      this.fI = paramBoolean;
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }
  
  private static class a
    extends Handler
  {
    private final LocationListener fK;
    
    public a(LocationListener paramLocationListener)
    {
      this.fK = paramLocationListener;
    }
    
    public a(LocationListener paramLocationListener, Looper paramLooper)
    {
      super();
      this.fK = paramLocationListener;
    }
    
    public void handleMessage(Message paramMessage)
    {
      switch (paramMessage.what)
      {
      default: 
        Log.e("LocationClientHelper", "unknown message in LocationHandler.handleMessage");
        return;
      }
      Location localLocation = new Location((Location)paramMessage.obj);
      this.fK.onLocationChanged(localLocation);
    }
  }
  
  private static class b
    extends a.a
  {
    private Handler fL;
    
    b(LocationListener paramLocationListener, Looper paramLooper)
    {
      if (paramLooper == null) {}
      for (bg.a locala = new bg.a(paramLocationListener);; locala = new bg.a(paramLocationListener, paramLooper))
      {
        this.fL = locala;
        return;
      }
    }
    
    public void onLocationChanged(Location paramLocation)
    {
      if (this.fL == null)
      {
        Log.e("LocationClientHelper", "Received a location in client after calling removeLocationUpdates.");
        return;
      }
      Message localMessage = Message.obtain();
      localMessage.what = 1;
      localMessage.obj = paramLocation;
      this.fL.sendMessage(localMessage);
    }
    
    public void release()
    {
      this.fL = null;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/bg.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */