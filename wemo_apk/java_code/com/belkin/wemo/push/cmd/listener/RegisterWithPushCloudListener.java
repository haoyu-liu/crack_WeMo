package com.belkin.wemo.push.cmd.listener;

import com.belkin.wemo.push.error.PushNotificationError;

public abstract interface RegisterWithPushCloudListener
{
  public abstract void onAlreadyRegisteredWithPush(String paramString);
  
  public abstract void onRegisteredWithPush(String paramString);
  
  public abstract void onRegistrationFailed(PushNotificationError paramPushNotificationError);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */