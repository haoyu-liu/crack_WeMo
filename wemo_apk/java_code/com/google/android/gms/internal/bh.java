package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.GooglePlayServicesClient.ConnectionCallbacks;
import com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener;
import com.google.android.gms.location.LocationClient.OnAddGeofencesResultListener;
import com.google.android.gms.location.LocationClient.OnRemoveGeofencesResultListener;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationStatusCodes;
import java.util.List;

public class bh
  extends k<bf>
{
  private final bk<bf> fG = new c(null);
  private final bg fM = new bg(paramContext, this.fG);
  private final String fN;
  
  public bh(Context paramContext, GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener, String paramString)
  {
    super(paramContext, paramConnectionCallbacks, paramOnConnectionFailedListener, new String[0]);
    this.fN = paramString;
  }
  
  protected void a(p paramp, k.d paramd)
    throws RemoteException
  {
    Bundle localBundle = new Bundle();
    localBundle.putString("client_name", this.fN);
    paramp.e(paramd, 3265100, getContext().getPackageName(), localBundle);
  }
  
  public void addGeofences(List<bi> paramList, PendingIntent paramPendingIntent, LocationClient.OnAddGeofencesResultListener paramOnAddGeofencesResultListener)
  {
    B();
    if ((paramList != null) && (paramList.size() > 0)) {}
    for (boolean bool = true;; bool = false)
    {
      s.b(bool, "At least one geofence must be specified.");
      s.b(paramPendingIntent, "PendingIntent must be specified.");
      s.b(paramOnAddGeofencesResultListener, "OnAddGeofencesResultListener not provided.");
      if (paramOnAddGeofencesResultListener == null) {}
      for (Object localObject = null;; localObject = localb)
      {
        try
        {
          ((bf)C()).a(paramList, paramPendingIntent, (be)localObject, getContext().getPackageName());
          return;
        }
        catch (RemoteException localRemoteException)
        {
          b localb;
          throw new IllegalStateException(localRemoteException);
        }
        localb = new b(paramOnAddGeofencesResultListener, this);
      }
    }
  }
  
  protected String b()
  {
    return "com.google.android.location.internal.GoogleLocationManagerService.START";
  }
  
  protected String c()
  {
    return "com.google.android.gms.location.internal.IGoogleLocationManagerService";
  }
  
  public void disconnect()
  {
    synchronized (this.fM)
    {
      if (isConnected())
      {
        this.fM.removeAllListeners();
        this.fM.aR();
      }
      super.disconnect();
      return;
    }
  }
  
  public Location getLastLocation()
  {
    return this.fM.getLastLocation();
  }
  
  public void removeActivityUpdates(PendingIntent paramPendingIntent)
  {
    B();
    s.d(paramPendingIntent);
    try
    {
      ((bf)C()).removeActivityUpdates(paramPendingIntent);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }
  
  public void removeGeofences(PendingIntent paramPendingIntent, LocationClient.OnRemoveGeofencesResultListener paramOnRemoveGeofencesResultListener)
  {
    B();
    s.b(paramPendingIntent, "PendingIntent must be specified.");
    s.b(paramOnRemoveGeofencesResultListener, "OnRemoveGeofencesResultListener not provided.");
    if (paramOnRemoveGeofencesResultListener == null) {}
    for (Object localObject = null;; localObject = localb)
    {
      try
      {
        ((bf)C()).a(paramPendingIntent, (be)localObject, getContext().getPackageName());
        return;
      }
      catch (RemoteException localRemoteException)
      {
        b localb;
        throw new IllegalStateException(localRemoteException);
      }
      localb = new b(paramOnRemoveGeofencesResultListener, this);
    }
  }
  
  public void removeGeofences(List<String> paramList, LocationClient.OnRemoveGeofencesResultListener paramOnRemoveGeofencesResultListener)
  {
    B();
    if ((paramList != null) && (paramList.size() > 0)) {}
    for (boolean bool = true;; bool = false)
    {
      s.b(bool, "geofenceRequestIds can't be null nor empty.");
      s.b(paramOnRemoveGeofencesResultListener, "OnRemoveGeofencesResultListener not provided.");
      String[] arrayOfString = (String[])paramList.toArray(new String[0]);
      if (paramOnRemoveGeofencesResultListener == null) {}
      for (Object localObject = null;; localObject = localb)
      {
        try
        {
          ((bf)C()).a(arrayOfString, (be)localObject, getContext().getPackageName());
          return;
        }
        catch (RemoteException localRemoteException)
        {
          b localb;
          throw new IllegalStateException(localRemoteException);
        }
        localb = new b(paramOnRemoveGeofencesResultListener, this);
      }
    }
  }
  
  public void removeLocationUpdates(PendingIntent paramPendingIntent)
  {
    this.fM.removeLocationUpdates(paramPendingIntent);
  }
  
  public void removeLocationUpdates(LocationListener paramLocationListener)
  {
    this.fM.removeLocationUpdates(paramLocationListener);
  }
  
  public void requestActivityUpdates(long paramLong, PendingIntent paramPendingIntent)
  {
    boolean bool = true;
    B();
    s.d(paramPendingIntent);
    if (paramLong >= 0L) {}
    for (;;)
    {
      s.b(bool, "detectionIntervalMillis must be >= 0");
      try
      {
        ((bf)C()).a(paramLong, true, paramPendingIntent);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new IllegalStateException(localRemoteException);
      }
      bool = false;
    }
  }
  
  public void requestLocationUpdates(LocationRequest paramLocationRequest, PendingIntent paramPendingIntent)
  {
    this.fM.requestLocationUpdates(paramLocationRequest, paramPendingIntent);
  }
  
  public void requestLocationUpdates(LocationRequest paramLocationRequest, LocationListener paramLocationListener)
  {
    requestLocationUpdates(paramLocationRequest, paramLocationListener, null);
  }
  
  public void requestLocationUpdates(LocationRequest paramLocationRequest, LocationListener paramLocationListener, Looper paramLooper)
  {
    synchronized (this.fM)
    {
      this.fM.requestLocationUpdates(paramLocationRequest, paramLocationListener, paramLooper);
      return;
    }
  }
  
  protected bf s(IBinder paramIBinder)
  {
    return bf.a.r(paramIBinder);
  }
  
  public void setMockLocation(Location paramLocation)
  {
    this.fM.setMockLocation(paramLocation);
  }
  
  public void setMockMode(boolean paramBoolean)
  {
    this.fM.setMockMode(paramBoolean);
  }
  
  private final class a
    extends k<bf>.b<LocationClient.OnAddGeofencesResultListener>
  {
    private final String[] fO;
    private final int p;
    
    public a(LocationClient.OnAddGeofencesResultListener paramOnAddGeofencesResultListener, int paramInt, String[] paramArrayOfString)
    {
      super(paramOnAddGeofencesResultListener);
      this.p = LocationStatusCodes.O(paramInt);
      this.fO = paramArrayOfString;
    }
    
    protected void a(LocationClient.OnAddGeofencesResultListener paramOnAddGeofencesResultListener)
    {
      if (paramOnAddGeofencesResultListener != null) {
        paramOnAddGeofencesResultListener.onAddGeofencesResult(this.p, this.fO);
      }
    }
    
    protected void d() {}
  }
  
  private static final class b
    extends be.a
  {
    private LocationClient.OnAddGeofencesResultListener fQ;
    private LocationClient.OnRemoveGeofencesResultListener fR;
    private bh fS;
    
    public b(LocationClient.OnAddGeofencesResultListener paramOnAddGeofencesResultListener, bh parambh)
    {
      this.fQ = paramOnAddGeofencesResultListener;
      this.fR = null;
      this.fS = parambh;
    }
    
    public b(LocationClient.OnRemoveGeofencesResultListener paramOnRemoveGeofencesResultListener, bh parambh)
    {
      this.fR = paramOnRemoveGeofencesResultListener;
      this.fQ = null;
      this.fS = parambh;
    }
    
    public void onAddGeofencesResult(int paramInt, String[] paramArrayOfString)
      throws RemoteException
    {
      if (this.fS == null)
      {
        Log.wtf("LocationClientImpl", "onAddGeofenceResult called multiple times");
        return;
      }
      bh localbh1 = this.fS;
      bh localbh2 = this.fS;
      localbh2.getClass();
      localbh1.a(new bh.a(localbh2, this.fQ, paramInt, paramArrayOfString));
      this.fS = null;
      this.fQ = null;
      this.fR = null;
    }
    
    public void onRemoveGeofencesByPendingIntentResult(int paramInt, PendingIntent paramPendingIntent)
    {
      if (this.fS == null)
      {
        Log.wtf("LocationClientImpl", "onRemoveGeofencesByPendingIntentResult called multiple times");
        return;
      }
      bh localbh1 = this.fS;
      bh localbh2 = this.fS;
      localbh2.getClass();
      localbh1.a(new bh.d(localbh2, 1, this.fR, paramInt, paramPendingIntent));
      this.fS = null;
      this.fQ = null;
      this.fR = null;
    }
    
    public void onRemoveGeofencesByRequestIdsResult(int paramInt, String[] paramArrayOfString)
    {
      if (this.fS == null)
      {
        Log.wtf("LocationClientImpl", "onRemoveGeofencesByRequestIdsResult called multiple times");
        return;
      }
      bh localbh1 = this.fS;
      bh localbh2 = this.fS;
      localbh2.getClass();
      localbh1.a(new bh.d(localbh2, 2, this.fR, paramInt, paramArrayOfString));
      this.fS = null;
      this.fQ = null;
      this.fR = null;
    }
  }
  
  private final class c
    implements bk<bf>
  {
    private c() {}
    
    public void B()
    {
      bh.a(bh.this);
    }
    
    public bf aS()
    {
      return (bf)bh.b(bh.this);
    }
  }
  
  private final class d
    extends k<bf>.b<LocationClient.OnRemoveGeofencesResultListener>
  {
    private final String[] fO;
    private final int fT;
    private final PendingIntent mPendingIntent;
    private final int p;
    
    public d(int paramInt1, LocationClient.OnRemoveGeofencesResultListener paramOnRemoveGeofencesResultListener, int paramInt2, PendingIntent paramPendingIntent)
    {
      super(paramOnRemoveGeofencesResultListener);
      if (paramInt1 == i) {}
      for (;;)
      {
        h.a(i);
        this.fT = paramInt1;
        this.p = LocationStatusCodes.O(paramInt2);
        this.mPendingIntent = paramPendingIntent;
        this.fO = null;
        return;
        i = 0;
      }
    }
    
    public d(int paramInt1, LocationClient.OnRemoveGeofencesResultListener paramOnRemoveGeofencesResultListener, int paramInt2, String[] paramArrayOfString)
    {
      super(paramOnRemoveGeofencesResultListener);
      if (paramInt1 == 2) {}
      for (boolean bool = true;; bool = false)
      {
        h.a(bool);
        this.fT = paramInt1;
        this.p = LocationStatusCodes.O(paramInt2);
        this.fO = paramArrayOfString;
        this.mPendingIntent = null;
        return;
      }
    }
    
    protected void a(LocationClient.OnRemoveGeofencesResultListener paramOnRemoveGeofencesResultListener)
    {
      if (paramOnRemoveGeofencesResultListener != null) {}
      switch (this.fT)
      {
      default: 
        Log.wtf("LocationClientImpl", "Unsupported action: " + this.fT);
        return;
      case 1: 
        paramOnRemoveGeofencesResultListener.onRemoveGeofencesByPendingIntentResult(this.p, this.mPendingIntent);
        return;
      }
      paramOnRemoveGeofencesResultListener.onRemoveGeofencesByRequestIdsResult(this.p, this.fO);
    }
    
    protected void d() {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/bh.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */