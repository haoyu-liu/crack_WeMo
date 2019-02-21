package com.belkin.wemo.rules.location.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.belkin.wemo.cache.utils.SDKLogUtils;

public class LocationUpdateBroadcastReceiver
  extends BroadcastReceiver
{
  private static final String TAG = LocationUpdateBroadcastReceiver.class.getSimpleName();
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if (paramIntent != null) {
      SDKLogUtils.debugLog(TAG, "Broadcast received: " + paramIntent.getAction());
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/location/receiver/LocationUpdateBroadcastReceiver.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */