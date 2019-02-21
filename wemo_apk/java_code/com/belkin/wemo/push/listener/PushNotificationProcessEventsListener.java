package com.belkin.wemo.push.listener;

import com.belkin.wemo.error.WeMoError;

public abstract interface PushNotificationProcessEventsListener
{
  public abstract void onPushServedRegistrationError(String paramString);
  
  public abstract void onPushServedUnregisterError(String paramString);
  
  public abstract void onRegisteredWithPushServer(String paramString);
  
  public abstract void onRegisteredWithWeMoCloud();
  
  public abstract void onUnregisteredOnWeMoCloud();
  
  public abstract void onUnregisteredWithPushServer(String paramString);
  
  public abstract void onWemoCloudRegistrationFailed(WeMoError paramWeMoError);
  
  public abstract void onWemoCloudUnregisterFailed(WeMoError paramWeMoError);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/listener/PushNotificationProcessEventsListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */