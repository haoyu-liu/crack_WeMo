package com.belkin.wemo.push.service;

import android.content.Intent;
import com.belkin.wemo.push.PushNotificationInfo;

public class ADMIntentService
  extends PushNotificationIntentService
{
  public static final String ADM_SERVICE_NAME = "ADMIntentService";
  
  public ADMIntentService()
  {
    super("ADMIntentService");
  }
  
  public ADMIntentService(String paramString)
  {
    super(paramString);
  }
  
  protected PushNotificationInfo getNotificationMessage(Intent paramIntent)
  {
    PushNotificationInfo localPushNotificationInfo = new PushNotificationInfo();
    localPushNotificationInfo.setPushNotificationMsg(paramIntent.getStringExtra("message"));
    return localPushNotificationInfo;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/service/ADMIntentService.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */