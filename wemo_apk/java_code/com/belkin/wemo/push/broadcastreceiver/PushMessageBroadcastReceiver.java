package com.belkin.wemo.push.broadcastreceiver;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.support.v4.content.WakefulBroadcastReceiver;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.push.service.ADMIntentService;
import com.belkin.wemo.push.service.GCMIntentService;

public class PushMessageBroadcastReceiver
  extends WakefulBroadcastReceiver
{
  public static final String ACTION_GCM_RECEIVE = "com.google.android.c2dm.intent.RECEIVE";
  public static final String ACTION_KINDLE_MESSAGE_RECEIVED = "com.belkin.wemo.intent.ACTION_ADM_MESSAGE_RECEIVED";
  public static final String TAG = "PushMessageBroadcastReceiver";
  
  private void startWakefulServiceWrapper(Context paramContext, String paramString, Intent paramIntent)
  {
    startWakefulService(paramContext, paramIntent.setComponent(new ComponentName(paramContext.getPackageName(), paramString)));
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    LogUtils.infoLog("PushMessageBroadcastReceiver", "Push Notification: Message recevied: " + paramIntent.getAction());
    if (paramIntent.getAction().equals("com.belkin.wemo.intent.ACTION_ADM_MESSAGE_RECEIVED")) {
      startWakefulServiceWrapper(paramContext, ADMIntentService.class.getName(), paramIntent);
    }
    while (!paramIntent.getAction().equals("com.google.android.c2dm.intent.RECEIVE")) {
      return;
    }
    startWakefulServiceWrapper(paramContext, GCMIntentService.class.getName(), paramIntent);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/broadcastreceiver/PushMessageBroadcastReceiver.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */