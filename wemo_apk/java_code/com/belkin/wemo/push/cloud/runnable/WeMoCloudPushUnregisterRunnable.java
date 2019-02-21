package com.belkin.wemo.push.cloud.runnable;

import android.content.Context;
import com.belkin.utils.WiFiSecurityUtil;
import com.belkin.wemo.push.cloud.WeMoCloudPushMessagingUtility;
import com.belkin.wemo.push.cmd.listener.UnregisterFromWeMoCloudListener;
import com.belkin.wemo.push.error.PushNotificationError;

public class WeMoCloudPushUnregisterRunnable
  extends WeMoCloudPushAbstractRunnable
{
  private Context context;
  private UnregisterFromWeMoCloudListener listener;
  
  public WeMoCloudPushUnregisterRunnable(Context paramContext, String paramString, UnregisterFromWeMoCloudListener paramUnregisterFromWeMoCloudListener)
  {
    super(paramContext, paramString);
    this.context = paramContext;
    this.listener = paramUnregisterFromWeMoCloudListener;
  }
  
  protected String getJSONBody()
  {
    String str = new WiFiSecurityUtil().getDeviceID(this.context);
    return "{\"deviceNetwork\":{\"smartUniqueId\":\"" + str + "\",\"smartDeviceType\":\"" + WeMoCloudPushMessagingUtility.getSmartDeviceType() + "\",\"userSmartDeviceToken\":\"\",\"productCode\":\"" + "WeMo" + "\",\"notificationType\":\"\",\"mobileNumber\":\"\"" + "}}";
  }
  
  protected String getRequestURL()
  {
    return "https://api.xbcs.net:8443/apis/http/plugin/push/unregister";
  }
  
  protected void onError(PushNotificationError paramPushNotificationError)
  {
    if (this.listener != null) {
      this.listener.onUnregisterFailed(paramPushNotificationError);
    }
  }
  
  protected void onSuccess(String paramString)
  {
    if (this.listener != null) {
      this.listener.onUnregisteredFromWeMoCloud(paramString);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/cloud/runnable/WeMoCloudPushUnregisterRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */