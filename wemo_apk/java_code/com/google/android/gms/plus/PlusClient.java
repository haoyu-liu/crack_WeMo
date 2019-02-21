package com.google.android.gms.plus;

import android.content.Context;
import android.net.Uri;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.GooglePlayServicesClient.ConnectionCallbacks;
import com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener;
import com.google.android.gms.internal.bt;
import com.google.android.gms.plus.model.moments.Moment;
import com.google.android.gms.plus.model.moments.MomentBuffer;
import com.google.android.gms.plus.model.people.Person;
import com.google.android.gms.plus.model.people.PersonBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;

public class PlusClient
  implements GooglePlayServicesClient
{
  @Deprecated
  public static final String KEY_REQUEST_VISIBLE_ACTIVITIES = "request_visible_actions";
  final bt hU;
  
  PlusClient(bt parambt)
  {
    this.hU = parambt;
  }
  
  bt bu()
  {
    return this.hU;
  }
  
  public void clearDefaultAccount()
  {
    this.hU.clearDefaultAccount();
  }
  
  public void connect()
  {
    this.hU.connect();
  }
  
  public void disconnect()
  {
    this.hU.disconnect();
  }
  
  public String getAccountName()
  {
    return this.hU.getAccountName();
  }
  
  public Person getCurrentPerson()
  {
    return this.hU.getCurrentPerson();
  }
  
  public boolean isConnected()
  {
    return this.hU.isConnected();
  }
  
  public boolean isConnecting()
  {
    return this.hU.isConnecting();
  }
  
  public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    return this.hU.isConnectionCallbacksRegistered(paramConnectionCallbacks);
  }
  
  public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    return this.hU.isConnectionFailedListenerRegistered(paramOnConnectionFailedListener);
  }
  
  public void loadMoments(OnMomentsLoadedListener paramOnMomentsLoadedListener)
  {
    this.hU.loadMoments(paramOnMomentsLoadedListener);
  }
  
  public void loadMoments(OnMomentsLoadedListener paramOnMomentsLoadedListener, int paramInt, String paramString1, Uri paramUri, String paramString2, String paramString3)
  {
    this.hU.loadMoments(paramOnMomentsLoadedListener, paramInt, paramString1, paramUri, paramString2, paramString3);
  }
  
  public void loadPeople(OnPeopleLoadedListener paramOnPeopleLoadedListener, Collection<String> paramCollection)
  {
    this.hU.a(paramOnPeopleLoadedListener, paramCollection);
  }
  
  public void loadPeople(OnPeopleLoadedListener paramOnPeopleLoadedListener, String... paramVarArgs)
  {
    this.hU.a(paramOnPeopleLoadedListener, paramVarArgs);
  }
  
  public void loadVisiblePeople(OnPeopleLoadedListener paramOnPeopleLoadedListener, int paramInt, String paramString)
  {
    this.hU.loadVisiblePeople(paramOnPeopleLoadedListener, paramInt, paramString);
  }
  
  public void loadVisiblePeople(OnPeopleLoadedListener paramOnPeopleLoadedListener, String paramString)
  {
    this.hU.loadVisiblePeople(paramOnPeopleLoadedListener, paramString);
  }
  
  public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    this.hU.registerConnectionCallbacks(paramConnectionCallbacks);
  }
  
  public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this.hU.registerConnectionFailedListener(paramOnConnectionFailedListener);
  }
  
  public void removeMoment(String paramString)
  {
    this.hU.removeMoment(paramString);
  }
  
  public void revokeAccessAndDisconnect(OnAccessRevokedListener paramOnAccessRevokedListener)
  {
    this.hU.revokeAccessAndDisconnect(paramOnAccessRevokedListener);
  }
  
  public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    this.hU.unregisterConnectionCallbacks(paramConnectionCallbacks);
  }
  
  public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this.hU.unregisterConnectionFailedListener(paramOnConnectionFailedListener);
  }
  
  public void writeMoment(Moment paramMoment)
  {
    this.hU.writeMoment(paramMoment);
  }
  
  public static class Builder
  {
    private GooglePlayServicesClient.OnConnectionFailedListener e;
    private String g;
    private GooglePlayServicesClient.ConnectionCallbacks hV;
    private ArrayList<String> hW;
    private String[] hX;
    private String[] hY;
    private String hZ;
    private String ia;
    private String ib;
    private Context mContext;
    
    public Builder(Context paramContext, GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
    {
      this.mContext = paramContext;
      this.hV = paramConnectionCallbacks;
      this.e = paramOnConnectionFailedListener;
      this.hW = new ArrayList();
      this.ia = this.mContext.getPackageName();
      this.hZ = this.mContext.getPackageName();
      this.hW.add("https://www.googleapis.com/auth/plus.login");
    }
    
    public PlusClient build()
    {
      if (this.g == null) {
        this.g = "<<default account>>";
      }
      String[] arrayOfString = (String[])this.hW.toArray(new String[this.hW.size()]);
      a locala = new a(this.g, arrayOfString, this.hX, this.hY, this.hZ, this.ia, this.ib);
      return new PlusClient(new bt(this.mContext, locala, this.hV, this.e));
    }
    
    public Builder clearScopes()
    {
      this.hW.clear();
      return this;
    }
    
    public Builder setAccountName(String paramString)
    {
      this.g = paramString;
      return this;
    }
    
    public Builder setActions(String... paramVarArgs)
    {
      this.hX = paramVarArgs;
      return this;
    }
    
    public Builder setScopes(String... paramVarArgs)
    {
      this.hW.clear();
      this.hW.addAll(Arrays.asList(paramVarArgs));
      return this;
    }
    
    @Deprecated
    public Builder setVisibleActivities(String... paramVarArgs)
    {
      setActions(paramVarArgs);
      return this;
    }
  }
  
  public static abstract interface OnAccessRevokedListener
  {
    public abstract void onAccessRevoked(ConnectionResult paramConnectionResult);
  }
  
  public static abstract interface OnMomentsLoadedListener
  {
    public abstract void onMomentsLoaded(ConnectionResult paramConnectionResult, MomentBuffer paramMomentBuffer, String paramString1, String paramString2);
  }
  
  public static abstract interface OnPeopleLoadedListener
  {
    public abstract void onPeopleLoaded(ConnectionResult paramConnectionResult, PersonBuffer paramPersonBuffer, String paramString);
  }
  
  public static abstract interface OrderBy
  {
    public static final int ALPHABETICAL = 0;
    public static final int BEST = 1;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/plus/PlusClient.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */