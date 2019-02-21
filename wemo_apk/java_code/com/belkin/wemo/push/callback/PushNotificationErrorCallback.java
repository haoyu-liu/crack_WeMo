package com.belkin.wemo.push.callback;

import com.belkin.wemo.push.error.PushNotificationError;

public abstract interface PushNotificationErrorCallback
{
  public abstract void onError(PushNotificationError paramPushNotificationError);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/callback/PushNotificationErrorCallback.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */