package com.google.android.gms.panorama;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.GooglePlayServicesClient.ConnectionCallbacks;
import com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener;
import com.google.android.gms.internal.bn;

public class PanoramaClient
  implements GooglePlayServicesClient
{
  private final bn hN;
  
  public PanoramaClient(Context paramContext, GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this.hN = new bn(paramContext, paramConnectionCallbacks, paramOnConnectionFailedListener);
  }
  
  public void connect()
  {
    this.hN.connect();
  }
  
  public void disconnect()
  {
    this.hN.disconnect();
  }
  
  public boolean isConnected()
  {
    return this.hN.isConnected();
  }
  
  public boolean isConnecting()
  {
    return this.hN.isConnecting();
  }
  
  public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    return this.hN.isConnectionCallbacksRegistered(paramConnectionCallbacks);
  }
  
  public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    return this.hN.isConnectionFailedListenerRegistered(paramOnConnectionFailedListener);
  }
  
  public void loadPanoramaInfo(OnPanoramaInfoLoadedListener paramOnPanoramaInfoLoadedListener, Uri paramUri)
  {
    this.hN.a(paramOnPanoramaInfoLoadedListener, paramUri, false);
  }
  
  public void loadPanoramaInfoAndGrantAccess(OnPanoramaInfoLoadedListener paramOnPanoramaInfoLoadedListener, Uri paramUri)
  {
    this.hN.a(paramOnPanoramaInfoLoadedListener, paramUri, true);
  }
  
  public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    this.hN.registerConnectionCallbacks(paramConnectionCallbacks);
  }
  
  public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this.hN.registerConnectionFailedListener(paramOnConnectionFailedListener);
  }
  
  public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    this.hN.unregisterConnectionCallbacks(paramConnectionCallbacks);
  }
  
  public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this.hN.unregisterConnectionFailedListener(paramOnConnectionFailedListener);
  }
  
  public static abstract interface OnPanoramaInfoLoadedListener
  {
    public abstract void onPanoramaInfoLoaded(ConnectionResult paramConnectionResult, Intent paramIntent);
  }
  
  public static abstract interface a
  {
    public abstract void a(ConnectionResult paramConnectionResult, int paramInt, Intent paramIntent);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/panorama/PanoramaClient.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */