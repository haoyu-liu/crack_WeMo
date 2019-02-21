package com.belkin.wemo.push.service;

import android.app.IntentService;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.RingtoneManager;
import android.os.Build.VERSION;
import android.support.v4.app.NotificationCompat.BigTextStyle;
import android.support.v4.app.NotificationCompat.Builder;
import android.text.TextUtils;
import com.belkin.activity.MainActivity;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.push.PushNotificationInfo;
import com.belkin.wemo.push.broadcastreceiver.PushMessageBroadcastReceiver;
import com.belkin.wemo.utils.WeMoUtils;

public abstract class PushNotificationIntentService
  extends IntentService
{
  public static final int LARGE_ICON_BITMAP_SIZE = 50;
  public static final int PUSH_LED_COLOR = -16711936;
  public static final int PUSH_LED_OFF_TIME_MS = 1000;
  public static final int PUSH_LED_ON_TIME_MS = 300;
  public static final int PUSH_PENDING_INTENT_REQUEST_CODE = 0;
  public static final int SMALL_ICON_BITMAP_SIZE = 24;
  private static volatile int notifyIdCounter;
  protected final String TAG = getLoggerTag();
  
  public PushNotificationIntentService(String paramString)
  {
    super(paramString);
  }
  
  private String getLoggerTag()
  {
    return getClass().getSimpleName();
  }
  
  private String getVettedNotificationMessage(PushNotificationInfo paramPushNotificationInfo)
  {
    String str1 = paramPushNotificationInfo.getEventCode();
    String str2 = new String();
    if (str1.contains(getResources().getString(2131165189))) {
      str2 = getResources().getString(2131165195) + " " + getResources().getString(2131165196);
    }
    String str3;
    do
    {
      return str2;
      if (str1.contains(getResources().getString(2131165190))) {
        return getResources().getString(2131165197) + " " + getResources().getString(2131165199);
      }
      if ((!paramPushNotificationInfo.getEventCode().equalsIgnoreCase("overtempon")) && (!paramPushNotificationInfo.getEventCode().equalsIgnoreCase("overtempon2"))) {
        break;
      }
      str3 = paramPushNotificationInfo.getFriendlyName();
    } while (TextUtils.isEmpty(str3));
    return str3 + " " + getResources().getString(2131165198);
    if (paramPushNotificationInfo.getPushNotificationMsg() != null) {
      return paramPushNotificationInfo.getPushNotificationMsg();
    }
    return getResources().getString(2131165192) + " " + str1;
  }
  
  private Notification getWeMoNotification(Context paramContext, PushNotificationInfo paramPushNotificationInfo)
  {
    String str = getVettedNotificationMessage(paramPushNotificationInfo);
    if (!TextUtils.isEmpty(str))
    {
      NotificationCompat.Builder localBuilder = new NotificationCompat.Builder(this);
      localBuilder.setTicker(getString(2131165191));
      localBuilder.setSound(RingtoneManager.getDefaultUri(2));
      if (Build.VERSION.SDK_INT >= 21) {
        localBuilder.setSmallIcon(2130837522);
      }
      for (;;)
      {
        localBuilder.setContentTitle(getString(2131165191));
        localBuilder.setContentText(str);
        localBuilder.setAutoCancel(true);
        Bitmap localBitmap = BitmapFactory.decodeResource(getResources(), 2130837516);
        int i = WeMoUtils.convertDpToPixels(24, paramContext);
        localBuilder.setLargeIcon(Bitmap.createScaledBitmap(localBitmap, i, i, false));
        localBuilder.setLights(-16711936, 300, 1000);
        int j = WeMoUtils.convertDpToPixels(50, paramContext);
        localBuilder.setStyle(new NotificationCompat.BigTextStyle().bigText(str).setBigContentTitle(getString(2131165191))).setLargeIcon(Bitmap.createScaledBitmap(localBitmap, j, j, false));
        Intent localIntent = new Intent(this, MainActivity.class);
        localIntent.putExtra("macAddress", paramPushNotificationInfo.getMac());
        localIntent.putExtra("eventCode", paramPushNotificationInfo.getEventCode());
        localBuilder.setContentIntent(PendingIntent.getActivity(this, 0, localIntent, 134217728));
        return localBuilder.build();
        localBuilder.setSmallIcon(2130837516);
      }
    }
    return null;
  }
  
  private void postNotification(PushNotificationInfo paramPushNotificationInfo, int paramInt)
  {
    Context localContext = getApplicationContext();
    if (localContext != null)
    {
      Notification localNotification = getWeMoNotification(localContext, paramPushNotificationInfo);
      if (localNotification != null) {
        ((NotificationManager)getSystemService("notification")).notify(this.TAG + paramInt, paramInt, localNotification);
      }
    }
  }
  
  private void sendBroadcastTodisplayMessageDialog(String paramString1, int paramInt, String paramString2)
  {
    Intent localIntent = new Intent("com.belkin.wemo.intent.ACTION_DISPLAY_PUSH_MESSAGE");
    localIntent.putExtra("push_message", paramString1);
    localIntent.putExtra("notify_id", paramInt);
    localIntent.putExtra("event_code", paramString2);
    sendBroadcast(localIntent);
  }
  
  protected abstract PushNotificationInfo getNotificationMessage(Intent paramIntent);
  
  protected void onHandleIntent(Intent paramIntent)
  {
    LogUtils.infoLog(this.TAG, "Push Notificcation: Intent received for posting notification.");
    PushNotificationInfo localPushNotificationInfo = getNotificationMessage(paramIntent);
    if (localPushNotificationInfo != null)
    {
      LogUtils.debugLog(this.TAG, "PushNotificationInfo: " + localPushNotificationInfo.toString());
      String str1 = localPushNotificationInfo.getPushNotificationMsg();
      String str2 = localPushNotificationInfo.getEventCode();
      LogUtils.infoLog(this.TAG, "Push Notification: Message contained in intent (IF NOT NULL THEN TO BE SHOWN IN NOTIFICATION TRAY AND (POSSIBLY) VIA ALERT DIALOG: " + str1);
      if (!TextUtils.isEmpty(str1))
      {
        int i = 1 + notifyIdCounter;
        notifyIdCounter = i;
        if (localPushNotificationInfo.isAlertDialogRequired()) {
          sendBroadcastTodisplayMessageDialog(str1, i, str2);
        }
        postNotification(localPushNotificationInfo, i);
      }
    }
    for (;;)
    {
      PushMessageBroadcastReceiver.completeWakefulIntent(paramIntent);
      return;
      LogUtils.errorLog(this.TAG, "Push Notification: PushNotificationInfo is NULL");
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/service/PushNotificationIntentService.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */