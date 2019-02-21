package com.belkin.wemo.push.cmd.impl;

import com.belkin.wemo.push.cmd.IPushNotificationHandler;
import com.belkin.wemo.utils.WeMoPushUtils;

public class PushNotificationCmdFactory
{
  private static IPushNotificationHandler pushNotificationCmdsInstance;
  
  public static IPushNotificationHandler instance()
  {
    try
    {
      if (pushNotificationCmdsInstance == null) {
        setCurrentPushNotificationInstance();
      }
      IPushNotificationHandler localIPushNotificationHandler = pushNotificationCmdsInstance;
      return localIPushNotificationHandler;
    }
    finally {}
  }
  
  private static void setCurrentPushNotificationInstance()
  {
    if (WeMoPushUtils.isADMAvailable())
    {
      pushNotificationCmdsInstance = new KindlePushNotificationHandler();
      return;
    }
    pushNotificationCmdsInstance = new GCMPushNotificationHandler();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/cmd/impl/PushNotificationCmdFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */