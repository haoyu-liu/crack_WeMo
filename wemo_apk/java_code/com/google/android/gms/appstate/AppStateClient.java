package com.google.android.gms.appstate;

import android.content.Context;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.GooglePlayServicesClient.ConnectionCallbacks;
import com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener;
import com.google.android.gms.internal.c;
import com.google.android.gms.internal.s;

public final class AppStateClient
  implements GooglePlayServicesClient
{
  public static final int STATUS_CLIENT_RECONNECT_REQUIRED = 2;
  public static final int STATUS_DEVELOPER_ERROR = 7;
  public static final int STATUS_INTERNAL_ERROR = 1;
  public static final int STATUS_NETWORK_ERROR_NO_DATA = 4;
  public static final int STATUS_NETWORK_ERROR_OPERATION_DEFERRED = 5;
  public static final int STATUS_NETWORK_ERROR_OPERATION_FAILED = 6;
  public static final int STATUS_NETWORK_ERROR_STALE_DATA = 3;
  public static final int STATUS_OK = 0;
  public static final int STATUS_STATE_KEY_LIMIT_EXCEEDED = 2003;
  public static final int STATUS_STATE_KEY_NOT_FOUND = 2002;
  public static final int STATUS_WRITE_OUT_OF_DATE_VERSION = 2000;
  public static final int STATUS_WRITE_SIZE_EXCEEDED = 2001;
  private final c b;
  
  private AppStateClient(Context paramContext, GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener, String paramString, String[] paramArrayOfString)
  {
    this.b = new c(paramContext, paramConnectionCallbacks, paramOnConnectionFailedListener, paramString, paramArrayOfString);
  }
  
  public void connect()
  {
    this.b.connect();
  }
  
  public void deleteState(OnStateDeletedListener paramOnStateDeletedListener, int paramInt)
  {
    this.b.deleteState(paramOnStateDeletedListener, paramInt);
  }
  
  public void disconnect()
  {
    this.b.disconnect();
  }
  
  public int getMaxNumKeys()
  {
    return this.b.getMaxNumKeys();
  }
  
  public int getMaxStateSize()
  {
    return this.b.getMaxStateSize();
  }
  
  public boolean isConnected()
  {
    return this.b.isConnected();
  }
  
  public boolean isConnecting()
  {
    return this.b.isConnecting();
  }
  
  public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    return this.b.isConnectionCallbacksRegistered(paramConnectionCallbacks);
  }
  
  public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    return this.b.isConnectionFailedListenerRegistered(paramOnConnectionFailedListener);
  }
  
  public void listStates(OnStateListLoadedListener paramOnStateListLoadedListener)
  {
    this.b.listStates(paramOnStateListLoadedListener);
  }
  
  public void loadState(OnStateLoadedListener paramOnStateLoadedListener, int paramInt)
  {
    this.b.loadState(paramOnStateLoadedListener, paramInt);
  }
  
  public void reconnect()
  {
    this.b.disconnect();
    this.b.connect();
  }
  
  public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    this.b.registerConnectionCallbacks(paramConnectionCallbacks);
  }
  
  public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this.b.registerConnectionFailedListener(paramOnConnectionFailedListener);
  }
  
  public void resolveState(OnStateLoadedListener paramOnStateLoadedListener, int paramInt, String paramString, byte[] paramArrayOfByte)
  {
    this.b.resolveState(paramOnStateLoadedListener, paramInt, paramString, paramArrayOfByte);
  }
  
  public void signOut()
  {
    this.b.signOut(null);
  }
  
  public void signOut(OnSignOutCompleteListener paramOnSignOutCompleteListener)
  {
    s.b(paramOnSignOutCompleteListener, "Must provide a valid listener");
    this.b.signOut(paramOnSignOutCompleteListener);
  }
  
  public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    this.b.unregisterConnectionCallbacks(paramConnectionCallbacks);
  }
  
  public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this.b.unregisterConnectionFailedListener(paramOnConnectionFailedListener);
  }
  
  public void updateState(int paramInt, byte[] paramArrayOfByte)
  {
    this.b.a(null, paramInt, paramArrayOfByte);
  }
  
  public void updateStateImmediate(OnStateLoadedListener paramOnStateLoadedListener, int paramInt, byte[] paramArrayOfByte)
  {
    s.b(paramOnStateLoadedListener, "Must provide a valid listener");
    this.b.a(paramOnStateLoadedListener, paramInt, paramArrayOfByte);
  }
  
  public static final class Builder
  {
    private static final String[] c = { "https://www.googleapis.com/auth/appstate" };
    private GooglePlayServicesClient.ConnectionCallbacks d;
    private GooglePlayServicesClient.OnConnectionFailedListener e;
    private String[] f;
    private String g;
    private Context mContext;
    
    public Builder(Context paramContext, GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
    {
      this.mContext = paramContext;
      this.d = paramConnectionCallbacks;
      this.e = paramOnConnectionFailedListener;
      this.f = c;
      this.g = "<<default account>>";
    }
    
    public AppStateClient create()
    {
      return new AppStateClient(this.mContext, this.d, this.e, this.g, this.f, null);
    }
    
    public Builder setAccountName(String paramString)
    {
      this.g = ((String)s.d(paramString));
      return this;
    }
    
    public Builder setScopes(String... paramVarArgs)
    {
      this.f = paramVarArgs;
      return this;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/appstate/AppStateClient.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */