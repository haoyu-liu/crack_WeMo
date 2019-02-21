package com.localytics.android;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;

public class PushReceiver
  extends BroadcastReceiver
{
  private static final int MAX_RETRIES = 3;
  private static final long RETRY_DELAY = 5000L;
  private static int numRetries = 0;
  static String retrySenderId = null;
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    String str1 = DatapointHelper.getLocalyticsAppKeyOrNull(paramContext);
    if (!TextUtils.isEmpty(str1)) {
      Localytics.integrate(paramContext.getApplicationContext(), str1);
    }
    if (paramIntent.getAction().equals("com.google.android.c2dm.intent.REGISTRATION")) {
      Localytics.handleRegistration(paramIntent);
    }
    String str2;
    label188:
    do
    {
      return;
      Bundle localBundle = paramIntent.getExtras();
      for (;;)
      {
        try
        {
          Object localObject = ReflectionUtils.tryInvokeStatic("com.google.android.gms.gcm.GoogleCloudMessaging", "getInstance", new Class[] { Context.class }, new Object[] { paramContext });
          if (localObject == null) {
            break;
          }
          str2 = (String)ReflectionUtils.tryInvokeInstance(localObject, "getMessageType", new Class[] { Intent.class }, new Object[] { paramIntent });
          if (localBundle.isEmpty()) {
            break;
          }
          if (!ReflectionUtils.tryGetStaticField("com.google.android.gms.gcm.GoogleCloudMessaging", "ERROR_SERVICE_NOT_AVAILABLE").equals(str2)) {
            break label188;
          }
          if (TextUtils.isEmpty(retrySenderId)) {
            break;
          }
          numRetries = 1 + numRetries;
          if (numRetries <= 3)
          {
            Localytics.Log.w("GCM registration ERROR_SERVICE_NOT_AVAILABLE. Retrying in 5000 milliseconds.");
            Localytics.registerPush(retrySenderId, 5000L);
            retrySenderId = null;
            return;
          }
        }
        catch (Exception localException)
        {
          Localytics.Log.w("Something went wrong with GCM", localException);
          return;
        }
        numRetries = 0;
      }
    } while (!ReflectionUtils.tryGetStaticField("com.google.android.gms.gcm.GoogleCloudMessaging", "MESSAGE_TYPE_MESSAGE").equals(str2));
    Localytics.handleNotificationReceived(paramIntent);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/PushReceiver.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */