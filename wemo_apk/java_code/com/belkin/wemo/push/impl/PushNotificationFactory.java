package com.belkin.wemo.push.impl;

import com.belkin.wemo.push.IPushNotification;

public class PushNotificationFactory
{
  private static IPushNotification pushNotificationsIns;
  
  public static IPushNotification getInstance()
  {
    try
    {
      if (pushNotificationsIns == null) {
        pushNotificationsIns = new PushNotificationImpl();
      }
      IPushNotification localIPushNotification = pushNotificationsIns;
      return localIPushNotification;
    }
    finally {}
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/impl/PushNotificationFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */