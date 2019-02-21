package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient.ConnectionCallbacks;
import com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener;
import com.google.android.gms.common.data.d;
import com.google.android.gms.plus.PlusClient.OnAccessRevokedListener;
import com.google.android.gms.plus.PlusClient.OnMomentsLoadedListener;
import com.google.android.gms.plus.PlusClient.OnPeopleLoadedListener;
import com.google.android.gms.plus.a;
import com.google.android.gms.plus.model.moments.Moment;
import com.google.android.gms.plus.model.moments.MomentBuffer;
import com.google.android.gms.plus.model.people.Person;
import com.google.android.gms.plus.model.people.PersonBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

public class bt
  extends k<bs>
{
  private Person ip;
  private a iq;
  
  public bt(Context paramContext, a parama, GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    super(paramContext, paramConnectionCallbacks, paramOnConnectionFailedListener, parama.by());
    this.iq = parama;
  }
  
  public boolean F(String paramString)
  {
    return Arrays.asList(x()).contains(paramString);
  }
  
  protected void a(int paramInt, IBinder paramIBinder, Bundle paramBundle)
  {
    if ((paramInt == 0) && (paramBundle != null) && (paramBundle.containsKey("loaded_person"))) {
      this.ip = cc.d(paramBundle.getByteArray("loaded_person"));
    }
    super.a(paramInt, paramIBinder, paramBundle);
  }
  
  protected void a(p paramp, k.d paramd)
    throws RemoteException
  {
    Bundle localBundle = new Bundle();
    localBundle.putBoolean("skip_oob", false);
    localBundle.putStringArray("request_visible_actions", this.iq.bz());
    if (this.iq.bA() != null) {
      localBundle.putStringArray("required_features", this.iq.bA());
    }
    if (this.iq.bD() != null) {
      localBundle.putString("application_name", this.iq.bD());
    }
    paramp.a(paramd, 3265100, this.iq.bC(), this.iq.bB(), x(), this.iq.getAccountName(), localBundle);
  }
  
  public void a(PlusClient.OnPeopleLoadedListener paramOnPeopleLoadedListener, Collection<String> paramCollection)
  {
    B();
    c localc = new c(paramOnPeopleLoadedListener);
    try
    {
      ((bs)C()).a(localc, new ArrayList(paramCollection));
      return;
    }
    catch (RemoteException localRemoteException)
    {
      localc.a(d.f(8), null);
    }
  }
  
  public void a(PlusClient.OnPeopleLoadedListener paramOnPeopleLoadedListener, String[] paramArrayOfString)
  {
    a(paramOnPeopleLoadedListener, Arrays.asList(paramArrayOfString));
  }
  
  protected bs ac(IBinder paramIBinder)
  {
    return bs.a.ab(paramIBinder);
  }
  
  protected String b()
  {
    return "com.google.android.gms.plus.service.START";
  }
  
  protected String c()
  {
    return "com.google.android.gms.plus.internal.IPlusService";
  }
  
  public void clearDefaultAccount()
  {
    B();
    try
    {
      this.ip = null;
      ((bs)C()).clearDefaultAccount();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }
  
  public String getAccountName()
  {
    B();
    try
    {
      String str = ((bs)C()).getAccountName();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }
  
  public Person getCurrentPerson()
  {
    B();
    return this.ip;
  }
  
  public void loadMoments(PlusClient.OnMomentsLoadedListener paramOnMomentsLoadedListener)
  {
    loadMoments(paramOnMomentsLoadedListener, 20, null, null, null, "me");
  }
  
  public void loadMoments(PlusClient.OnMomentsLoadedListener paramOnMomentsLoadedListener, int paramInt, String paramString1, Uri paramUri, String paramString2, String paramString3)
  {
    B();
    if (paramOnMomentsLoadedListener != null) {}
    for (a locala = new a(paramOnMomentsLoadedListener);; locala = null) {
      try
      {
        ((bs)C()).a(locala, paramInt, paramString1, paramUri, paramString2, paramString3);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        locala.a(d.f(8), null, null);
      }
    }
  }
  
  public void loadVisiblePeople(PlusClient.OnPeopleLoadedListener paramOnPeopleLoadedListener, int paramInt, String paramString)
  {
    B();
    c localc = new c(paramOnPeopleLoadedListener);
    try
    {
      ((bs)C()).a(localc, 1, paramInt, -1, paramString);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      localc.a(d.f(8), null);
    }
  }
  
  public void loadVisiblePeople(PlusClient.OnPeopleLoadedListener paramOnPeopleLoadedListener, String paramString)
  {
    loadVisiblePeople(paramOnPeopleLoadedListener, 0, paramString);
  }
  
  public void removeMoment(String paramString)
  {
    B();
    try
    {
      ((bs)C()).removeMoment(paramString);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }
  
  public void revokeAccessAndDisconnect(PlusClient.OnAccessRevokedListener paramOnAccessRevokedListener)
  {
    B();
    clearDefaultAccount();
    e locale = new e(paramOnAccessRevokedListener);
    try
    {
      ((bs)C()).c(locale);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      locale.b(8, null);
    }
  }
  
  public void writeMoment(Moment paramMoment)
  {
    B();
    try
    {
      ak localak = ak.a((bz)paramMoment);
      ((bs)C()).a(localak);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }
  
  final class a
    extends bo
  {
    private final PlusClient.OnMomentsLoadedListener ir;
    
    public a(PlusClient.OnMomentsLoadedListener paramOnMomentsLoadedListener)
    {
      this.ir = paramOnMomentsLoadedListener;
    }
    
    public void a(d paramd, String paramString1, String paramString2)
    {
      if (paramd.l() != null) {}
      for (PendingIntent localPendingIntent = (PendingIntent)paramd.l().getParcelable("pendingIntent");; localPendingIntent = null)
      {
        ConnectionResult localConnectionResult = new ConnectionResult(paramd.getStatusCode(), localPendingIntent);
        if ((!localConnectionResult.isSuccess()) && (paramd != null)) {
          if (!paramd.isClosed()) {
            paramd.close();
          }
        }
        for (d locald = null;; locald = paramd)
        {
          bt.this.a(new bt.b(bt.this, this.ir, localConnectionResult, locald, paramString1, paramString2));
          return;
        }
      }
    }
  }
  
  final class b
    extends k<bs>.c<PlusClient.OnMomentsLoadedListener>
  {
    private final ConnectionResult it;
    private final String iu;
    private final String iv;
    
    public b(PlusClient.OnMomentsLoadedListener paramOnMomentsLoadedListener, ConnectionResult paramConnectionResult, d paramd, String paramString1, String paramString2)
    {
      super(paramOnMomentsLoadedListener, paramd);
      this.it = paramConnectionResult;
      this.iu = paramString1;
      this.iv = paramString2;
    }
    
    protected void a(PlusClient.OnMomentsLoadedListener paramOnMomentsLoadedListener, d paramd)
    {
      ConnectionResult localConnectionResult = this.it;
      if (paramd != null) {}
      for (MomentBuffer localMomentBuffer = new MomentBuffer(paramd);; localMomentBuffer = null)
      {
        paramOnMomentsLoadedListener.onMomentsLoaded(localConnectionResult, localMomentBuffer, this.iu, this.iv);
        return;
      }
    }
  }
  
  final class c
    extends bo
  {
    private final PlusClient.OnPeopleLoadedListener iw;
    
    public c(PlusClient.OnPeopleLoadedListener paramOnPeopleLoadedListener)
    {
      this.iw = paramOnPeopleLoadedListener;
    }
    
    public void a(d paramd, String paramString)
    {
      if (paramd.l() != null) {}
      for (PendingIntent localPendingIntent = (PendingIntent)paramd.l().getParcelable("pendingIntent");; localPendingIntent = null)
      {
        ConnectionResult localConnectionResult = new ConnectionResult(paramd.getStatusCode(), localPendingIntent);
        if ((!localConnectionResult.isSuccess()) && (paramd != null)) {
          if (!paramd.isClosed()) {
            paramd.close();
          }
        }
        for (d locald = null;; locald = paramd)
        {
          bt.this.a(new bt.d(bt.this, this.iw, localConnectionResult, locald, paramString));
          return;
        }
      }
    }
  }
  
  final class d
    extends k<bs>.c<PlusClient.OnPeopleLoadedListener>
  {
    private final ConnectionResult it;
    private final String iu;
    
    public d(PlusClient.OnPeopleLoadedListener paramOnPeopleLoadedListener, ConnectionResult paramConnectionResult, d paramd, String paramString)
    {
      super(paramOnPeopleLoadedListener, paramd);
      this.it = paramConnectionResult;
      this.iu = paramString;
    }
    
    protected void a(PlusClient.OnPeopleLoadedListener paramOnPeopleLoadedListener, d paramd)
    {
      ConnectionResult localConnectionResult = this.it;
      if (paramd != null) {}
      for (PersonBuffer localPersonBuffer = new PersonBuffer(paramd);; localPersonBuffer = null)
      {
        paramOnPeopleLoadedListener.onPeopleLoaded(localConnectionResult, localPersonBuffer, this.iu);
        return;
      }
    }
  }
  
  final class e
    extends bo
  {
    private final PlusClient.OnAccessRevokedListener ix;
    
    public e(PlusClient.OnAccessRevokedListener paramOnAccessRevokedListener)
    {
      this.ix = paramOnAccessRevokedListener;
    }
    
    public void b(int paramInt, Bundle paramBundle)
    {
      PendingIntent localPendingIntent = null;
      if (paramBundle != null) {
        localPendingIntent = (PendingIntent)paramBundle.getParcelable("pendingIntent");
      }
      ConnectionResult localConnectionResult = new ConnectionResult(paramInt, localPendingIntent);
      bt.this.a(new bt.f(bt.this, this.ix, localConnectionResult));
    }
  }
  
  final class f
    extends k<bs>.b<PlusClient.OnAccessRevokedListener>
  {
    private final ConnectionResult it;
    
    public f(PlusClient.OnAccessRevokedListener paramOnAccessRevokedListener, ConnectionResult paramConnectionResult)
    {
      super(paramOnAccessRevokedListener);
      this.it = paramConnectionResult;
    }
    
    protected void a(PlusClient.OnAccessRevokedListener paramOnAccessRevokedListener)
    {
      bt.this.disconnect();
      if (paramOnAccessRevokedListener != null) {
        paramOnAccessRevokedListener.onAccessRevoked(this.it);
      }
    }
    
    protected void d() {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/bt.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */