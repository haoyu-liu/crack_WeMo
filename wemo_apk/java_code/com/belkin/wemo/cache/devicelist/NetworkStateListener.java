package com.belkin.wemo.cache.devicelist;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SDKNetworkUtils;

public class NetworkStateListener
{
  private static final String TAG = NetworkStateListener.class.getSimpleName();
  public static final String TYPE_NOT_WIFI = "not_wifi";
  public static final String TYPE_NO_NETWORK_CONNECTION = "notConnected";
  public static final String WEMO_ACTION_NETWORK_SWITCHED = "com.wemo.belkin.NETWORK_SWICTHED";
  private ConnectivityManager connectivityManager;
  private String currentSSID;
  private boolean isDevicePairingInProgress;
  private SDKNetworkUtils networkUtils;
  private BroadcastReceiver receiver;
  
  public NetworkStateListener(SDKNetworkUtils paramSDKNetworkUtils, ConnectivityManager paramConnectivityManager)
  {
    this.networkUtils = paramSDKNetworkUtils;
    this.connectivityManager = paramConnectivityManager;
  }
  
  private void onConnectivityChanged(Context paramContext)
  {
    SDKLogUtils.debugLog(TAG, "On Connectivity Changed. Is device pairing in progress: " + this.isDevicePairingInProgress);
    int i;
    String str1;
    if (!this.isDevicePairingInProgress)
    {
      NetworkInfo localNetworkInfo = this.connectivityManager.getActiveNetworkInfo();
      if ((localNetworkInfo == null) || (!localNetworkInfo.isConnected())) {
        break label194;
      }
      i = localNetworkInfo.getType();
      str1 = localNetworkInfo.getTypeName();
      if (i != 1) {
        break label187;
      }
    }
    label187:
    for (String str2 = this.networkUtils.getSSID();; str2 = "not_wifi")
    {
      SDKLogUtils.debugLog(TAG, "On Connectivity Changed: New Network Type: " + i + "; Name: " + str1 + "; New SSID received: " + str2 + "; Last SSID: " + this.currentSSID);
      if ((this.currentSSID != null) && (paramContext != null) && (!this.currentSSID.equals(str2)))
      {
        SDKLogUtils.debugLog(TAG, "On Connectivity Changed: APP connected to different newtork. Sending broadcast.");
        paramContext.sendBroadcast(new Intent("com.wemo.belkin.NETWORK_SWICTHED"));
      }
      this.currentSSID = str2;
      return;
    }
    label194:
    this.currentSSID = "notConnected";
  }
  
  public boolean isDevicePairingInProgress()
  {
    try
    {
      SDKLogUtils.debugLog(TAG, "Is device pairing in progress: " + this.isDevicePairingInProgress);
      boolean bool = this.isDevicePairingInProgress;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void setDevicePairingInProgress(boolean paramBoolean)
  {
    try
    {
      SDKLogUtils.debugLog(TAG, "Set device pairing in progress: " + paramBoolean);
      this.isDevicePairingInProgress = paramBoolean;
      onConnectivityChanged(null);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void startListening(Context paramContext)
  {
    try
    {
      SDKLogUtils.debugLog(TAG, "START listening for network changes");
      IntentFilter localIntentFilter = new IntentFilter();
      localIntentFilter.addAction("android.net.conn.CONNECTIVITY_CHANGE");
      if (this.receiver == null)
      {
        this.receiver = new NetworkSwitchedBroadcastReceiver(null);
        paramContext.registerReceiver(this.receiver, localIntentFilter);
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void stopListening(Context paramContext)
  {
    try
    {
      SDKLogUtils.debugLog(TAG, "STOP listening for network changes");
      if (this.receiver != null)
      {
        paramContext.unregisterReceiver(this.receiver);
        this.receiver = null;
      }
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      for (;;)
      {
        SDKLogUtils.errorLog(TAG, "IllegalArgumentException in method stopListening: ", localIllegalArgumentException);
        this.receiver = null;
      }
    }
    finally {}
  }
  
  private class NetworkSwitchedBroadcastReceiver
    extends BroadcastReceiver
  {
    private NetworkSwitchedBroadcastReceiver() {}
    
    public void onReceive(Context paramContext, Intent paramIntent)
    {
      SDKLogUtils.debugLog(NetworkStateListener.TAG, "Connectivity change broadcast received: " + paramIntent.getAction());
      NetworkStateListener.this.onConnectivityChanged(paramContext);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/NetworkStateListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */