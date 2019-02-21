package com.belkin.wemo.push.cloud.runnable;

import android.content.Context;
import com.belkin.utils.WiFiSecurityUtil;
import com.belkin.wemo.push.cloud.WeMoCloudPushMessagingUtility;
import com.belkin.wemo.push.cmd.listener.RegisterWithWeMoCloudListener;
import com.belkin.wemo.push.error.PushNotificationError;

public class WeMoCloudPushRegisterRunnable
  extends WeMoCloudPushAbstractRunnable
{
  private Context context;
  private RegisterWithWeMoCloudListener listener;
  
  public WeMoCloudPushRegisterRunnable(Context paramContext, String paramString, RegisterWithWeMoCloudListener paramRegisterWithWeMoCloudListener)
  {
    super(paramContext, paramString);
    this.context = paramContext;
    this.listener = paramRegisterWithWeMoCloudListener;
  }
  
  protected String getJSONBody()
  {
    String str = new WiFiSecurityUtil().getDeviceID(this.context);
    return "{\"deviceNetwork\":{\"smartUniqueId\":\"" + str + "\",\"smartDeviceType\":\"" + WeMoCloudPushMessagingUtility.getSmartDeviceType() + "\",\"userSmartDeviceToken\":\"" + this.registrationId + "\",\"productCode\":\"" + "WeMo" + "\",\"notificationType\":\"" + 1 + "\",\"mobileNumber\":\"" + "" + "\",\"" + "silentNotifications" + "\":\"1\"," + "\"" + "version" + "\":\"1\"}}";
  }
  
  protected String getRequestURL()
  {
    return "https://api.xbcs.net:8443/apis/http/plugin/push/register";
  }
  
  protected void onError(PushNotificationError paramPushNotificationError)
  {
    if (this.listener != null) {
      this.listener.onRegistrationFailed(paramPushNotificationError);
    }
  }
  
  protected void onSuccess(String paramString)
  {
    if (this.listener != null) {
      this.listener.onRegisteredWithCloud(paramString);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/cloud/runnable/WeMoCloudPushRegisterRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */