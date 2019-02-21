package com.belkin.wemo.push.error;

import com.belkin.wemo.error.WeMoError;

public class PushNotificationError
  extends WeMoError
{
  public PushNotificationError()
  {
    super(-100, "Error during register/unregister Push Notification!");
  }
  
  public PushNotificationError(int paramInt, String paramString)
  {
    super(paramInt, paramString);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/error/PushNotificationError.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */