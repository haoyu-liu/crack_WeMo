package com.belkin.wemo.broadcastreceiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.push.IPushNotification;
import com.belkin.wemo.push.impl.PushNotificationFactory;

public class AppUpgradeBroadcastReceiver
  extends BroadcastReceiver
{
  public static final String TAG = AppUpgradeBroadcastReceiver.class.getSimpleName();
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    LogUtils.infoLog(TAG, "Broadcast received: " + paramIntent.getAction());
    if (paramIntent.getAction().equals("android.intent.action.MY_PACKAGE_REPLACED"))
    {
      LogUtils.infoLog(TAG, "ACTION_MY_PACKAGE_REPLACED broadcast received. Registering for Push Notifications again.");
      PushNotificationFactory.getInstance().registerPushNotifications(paramContext, null, null);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/broadcastreceiver/AppUpgradeBroadcastReceiver.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */