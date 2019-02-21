package com.belkin.wemo.push;

import android.content.Context;
import com.belkin.wemo.push.callback.PushNotificationErrorCallback;
import com.belkin.wemo.push.callback.RegisterPushSuccessCallback;
import com.belkin.wemo.push.callback.UnregisterPushSuccessCallback;

public abstract interface IPushNotification
{
  public abstract void registerPushNotifications(Context paramContext, PushNotificationErrorCallback paramPushNotificationErrorCallback, RegisterPushSuccessCallback paramRegisterPushSuccessCallback);
  
  public abstract void unregisterPushNotifications(Context paramContext, PushNotificationErrorCallback paramPushNotificationErrorCallback, UnregisterPushSuccessCallback paramUnregisterPushSuccessCallback);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/IPushNotification.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */