package com.belkin.wemo.broadcastreceiver;

import android.content.Context;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.broadcast.RemoteAccessBroadcastService.RemoteAccessListener;
import com.belkin.wemo.push.IPushNotification;
import com.belkin.wemo.push.impl.PushNotificationFactory;

public class PushNotificationOnRemoteAccessListener
  implements RemoteAccessBroadcastService.RemoteAccessListener
{
  public static final String TAG = PushNotificationOnRemoteAccessListener.class.getSimpleName();
  private Context context;
  
  public PushNotificationOnRemoteAccessListener(Context paramContext)
  {
    this.context = paramContext;
  }
  
  public void onRemoteAccessDisabled() {}
  
  public void onRemoteAccessEnabled()
  {
    LogUtils.infoLog(TAG, "ACTION_REMOTE_ENABLED broadcast received. Registering for Push Notifications again.");
    PushNotificationFactory.getInstance().registerPushNotifications(this.context, null, null);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/broadcastreceiver/PushNotificationOnRemoteAccessListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */