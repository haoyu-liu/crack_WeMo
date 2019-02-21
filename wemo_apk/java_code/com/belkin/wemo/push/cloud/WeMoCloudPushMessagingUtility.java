package com.belkin.wemo.push.cloud;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.exception.InvalidArgumentsException;
import com.belkin.wemo.push.cloud.runnable.WeMoCloudPushRegisterRunnable;
import com.belkin.wemo.push.cloud.runnable.WeMoCloudPushUnregisterRunnable;
import com.belkin.wemo.push.cmd.listener.RegisterWithWeMoCloudListener;
import com.belkin.wemo.push.cmd.listener.UnregisterFromWeMoCloudListener;
import com.belkin.wemo.thread.WeMoThreadPoolHandler;
import com.belkin.wemo.utils.WeMoPushUtils;

public class WeMoCloudPushMessagingUtility
{
  public static final int SMART_DEVICE_TYPE_GCM = 1;
  public static final int SMART_DEVICE_TYPE_KINDLE = 4;
  private static final String TAG = "ADMMessenger";
  public static final String WEMO_CLOUD_PUSH_REGISTER_URL = "https://api.xbcs.net:8443/apis/http/plugin/push/register";
  public static final String WEMO_CLOUD_PUSH_UNREGISTER_URL = "https://api.xbcs.net:8443/apis/http/plugin/push/unregister";
  
  public static int getSmartDeviceType()
  {
    if (WeMoPushUtils.isADMAvailable()) {
      return 4;
    }
    return 1;
  }
  
  public static void sendPushRegistrationIdToWeMoCloud(Context paramContext, String paramString, RegisterWithWeMoCloudListener paramRegisterWithWeMoCloudListener)
    throws InvalidArgumentsException
  {
    if (paramContext == null)
    {
      LogUtils.errorLog("ADMMessenger", "Push Notification: Registering with WeMo cloud - Context is null!");
      throw new InvalidArgumentsException("Context in NULL!");
    }
    if (TextUtils.isEmpty(paramString))
    {
      LogUtils.errorLog("ADMMessenger", "Push Notification: Registering with WeMo cloud - registrationID is empty or null!");
      throw new InvalidArgumentsException("Registration Id is invalid!");
    }
    LogUtils.infoLog("ADMMessenger", "Push Notification: Registering with WeMo Cloud");
    WeMoThreadPoolHandler.executeInBackground(new WeMoCloudPushRegisterRunnable(paramContext, paramString, paramRegisterWithWeMoCloudListener));
  }
  
  public static void unregisterAppFromWeMoCloudForPush(Context paramContext, String paramString, UnregisterFromWeMoCloudListener paramUnregisterFromWeMoCloudListener)
    throws InvalidArgumentsException
  {
    if (paramContext == null)
    {
      LogUtils.errorLog("ADMMessenger", "Push Notification: unregistering from WeMo cloud - Context is null!");
      throw new InvalidArgumentsException("Context in NULL!");
    }
    if (TextUtils.isEmpty(paramString))
    {
      LogUtils.errorLog("ADMMessenger", "Push Notification: unregistering from WeMo cloud - registrationID is null!");
      throw new InvalidArgumentsException("Registration Id is invalid!");
    }
    LogUtils.errorLog("ADMMessenger", "Push Notification: unregistering from WeMo cloud");
    WeMoThreadPoolHandler.executeInBackground(new WeMoCloudPushUnregisterRunnable(paramContext, paramString, paramUnregisterFromWeMoCloudListener));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/cloud/WeMoCloudPushMessagingUtility.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */