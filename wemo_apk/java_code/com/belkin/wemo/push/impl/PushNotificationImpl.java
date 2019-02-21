package com.belkin.wemo.push.impl;

import android.content.Context;
import com.belkin.wemo.push.IPushNotification;
import com.belkin.wemo.push.callback.PushNotificationErrorCallback;
import com.belkin.wemo.push.callback.RegisterPushSuccessCallback;
import com.belkin.wemo.push.callback.UnregisterPushSuccessCallback;
import com.belkin.wemo.push.runnable.RegisterPushNotificationRunnable;
import com.belkin.wemo.push.runnable.UnregisterPushNotificationRunnable;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;

public class PushNotificationImpl
  implements IPushNotification
{
  public void registerPushNotifications(Context paramContext, PushNotificationErrorCallback paramPushNotificationErrorCallback, RegisterPushSuccessCallback paramRegisterPushSuccessCallback)
  {
    try
    {
      WeMoThreadPoolHandler.executeInBackground(new RegisterPushNotificationRunnable(paramPushNotificationErrorCallback, paramRegisterPushSuccessCallback, paramContext));
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void unregisterPushNotifications(Context paramContext, PushNotificationErrorCallback paramPushNotificationErrorCallback, UnregisterPushSuccessCallback paramUnregisterPushSuccessCallback)
  {
    try
    {
      WeMoThreadPoolHandler.executeInBackground(new UnregisterPushNotificationRunnable(paramUnregisterPushSuccessCallback, paramPushNotificationErrorCallback, paramContext));
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/impl/PushNotificationImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */