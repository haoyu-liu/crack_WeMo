package com.belkin.wemo.push.cmd.impl;

import android.content.Context;
import android.text.TextUtils;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.belkin.wemo.exception.InvalidArgumentsException;
import com.belkin.wemo.push.cloud.WeMoCloudPushMessagingUtility;
import com.belkin.wemo.push.cmd.IPushNotificationHandler;
import com.belkin.wemo.push.cmd.listener.RegisterWithPushCloudListener;
import com.belkin.wemo.push.cmd.listener.RegisterWithWeMoCloudListener;
import com.belkin.wemo.push.cmd.listener.UnregisterFromPushCloudListener;
import com.belkin.wemo.push.cmd.listener.UnregisterFromWeMoCloudListener;
import com.belkin.wemo.push.error.PushNotificationError;
import com.belkin.wemo.utils.WeMoPushUtils;
import com.google.android.gms.common.GooglePlayServicesUtil;
import java.io.IOException;

public class GCMPushNotificationHandler
  implements IPushNotificationHandler
{
  public static final String TAG = "GCMPushNotificationHandler";
  
  private String getValidRegistrationId(Context paramContext)
  {
    String str = SharePreferences.getGCMRegistrationId(paramContext);
    if (SharePreferences.getGCMRegistrationIdStorageAppVersion(paramContext) < SharePreferences.getCurrentAppVersion(paramContext))
    {
      LogUtils.infoLog("GCMPushNotificationHandler", "Push Notification: App updated. GCM Reg ID is invalid.");
      str = new String();
    }
    LogUtils.infoLog("GCMPushNotificationHandler", "Push Notification: getValidRegistrationId(), if any: " + str);
    return str;
  }
  
  private void registerAppWithGCM(Context paramContext, RegisterWithPushCloudListener paramRegisterWithPushCloudListener)
  {
    int i = GooglePlayServicesUtil.isGooglePlayServicesAvailable(paramContext);
    LogUtils.infoLog("GCMPushNotificationHandler", "Push Notification: Google Play Services Availablity State: " + i);
    if (i == 0)
    {
      String str = getValidRegistrationId(paramContext);
      if (TextUtils.isEmpty(str))
      {
        LogUtils.infoLog("GCMPushNotificationHandler", "Push Notification: Registering with GCM Server");
        try
        {
          paramRegisterWithPushCloudListener.onRegisteredWithPush(WeMoPushUtils.registerAppWithGCMServer(paramContext));
          return;
        }
        catch (IOException localIOException)
        {
          LogUtils.errorLog("GCMPushNotificationHandler", "Push Notification: IOException during GCM register.", localIOException);
          paramRegisterWithPushCloudListener.onRegistrationFailed(new PushNotificationError(-100, localIOException.getMessage()));
          return;
        }
      }
      paramRegisterWithPushCloudListener.onAlreadyRegisteredWithPush(str);
      return;
    }
    paramRegisterWithPushCloudListener.onRegistrationFailed(new PushNotificationError(i, "Google Play Services Error!"));
  }
  
  public void registerWithPushServer(Context paramContext, RegisterWithPushCloudListener paramRegisterWithPushCloudListener)
    throws InvalidArgumentsException
  {
    if (paramContext == null)
    {
      LogUtils.errorLog("GCMPushNotificationHandler", "Push Notification: Registering with GCM - Context is null!");
      throw new InvalidArgumentsException("Context in NULL!");
    }
    if (paramRegisterWithPushCloudListener == null)
    {
      LogUtils.errorLog("GCMPushNotificationHandler", "Push Notification: Registration Error - RegisterWithPushCloudListener instance is invalid!");
      throw new InvalidArgumentsException("RegisterWithPushCloudListener instance is invalid");
    }
    registerAppWithGCM(paramContext, paramRegisterWithPushCloudListener);
  }
  
  public void registerWithWeMoCloud(Context paramContext, String paramString, RegisterWithWeMoCloudListener paramRegisterWithWeMoCloudListener)
    throws InvalidArgumentsException
  {
    WeMoCloudPushMessagingUtility.sendPushRegistrationIdToWeMoCloud(paramContext, paramString, paramRegisterWithWeMoCloudListener);
  }
  
  public void unregisterFromPushServer(Context paramContext, UnregisterFromPushCloudListener paramUnregisterFromPushCloudListener)
    throws InvalidArgumentsException
  {
    if (paramContext == null)
    {
      LogUtils.errorLog("GCMPushNotificationHandler", "Push Notification: Unregistering from GCM - Context is null!");
      throw new InvalidArgumentsException("Context in NULL!");
    }
    if (paramUnregisterFromPushCloudListener == null)
    {
      LogUtils.errorLog("GCMPushNotificationHandler", "Push Notification: Unregister Error - UnregisterFromPushCloudListener instance is invalid!");
      throw new InvalidArgumentsException("RegisterWithPushCloudListener instance is invalid");
    }
    LogUtils.infoLog("GCMPushNotificationHandler", "Push Notification: unregistering from GCM");
    try
    {
      String str = WeMoPushUtils.unregisterAppFromGCMServer(paramContext);
      if (str != null)
      {
        paramUnregisterFromPushCloudListener.onUnregisteredFromPushCloud(str);
        return;
      }
      paramUnregisterFromPushCloudListener.onUnregisterFailed(new PushNotificationError(-100, "Unregistering app with GCM server failed"));
      return;
    }
    catch (IOException localIOException)
    {
      LogUtils.errorLog("GCMPushNotificationHandler", "Push Notification: IOException during GCM unregister.", localIOException);
      paramUnregisterFromPushCloudListener.onUnregisterFailed(new PushNotificationError(-100, localIOException.getMessage()));
    }
  }
  
  public void unregisterFromWeMoCloud(Context paramContext, String paramString, UnregisterFromWeMoCloudListener paramUnregisterFromWeMoCloudListener)
    throws InvalidArgumentsException
  {
    WeMoCloudPushMessagingUtility.unregisterAppFromWeMoCloudForPush(paramContext, paramString, paramUnregisterFromWeMoCloudListener);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/push/cmd/impl/GCMPushNotificationHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */