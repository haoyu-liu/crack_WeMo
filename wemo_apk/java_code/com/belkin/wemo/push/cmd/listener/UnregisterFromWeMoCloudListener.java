package com.belkin.wemo.push.cmd.listener;

import com.belkin.wemo.push.error.PushNotificationError;

public abstract interface UnregisterFromWeMoCloudListener
{
  public abstract void onUnregisterFailed(PushNotificationError paramPushNotificationError);
  
  public abstract void onUnregisteredFromWeMoCloud(String paramString);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */