package com.belkin.wemo.utils;

import android.content.Context;
import android.os.Build;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.google.android.gms.gcm.GoogleCloudMessaging;
import java.io.IOException;

public class WeMoPushUtils
{
  public static final String TAG = "WeMoPushUtils";
  
  public static boolean isADMAvailable()
  {
    boolean bool1 = Build.MANUFACTURER.equalsIgnoreCase("Amazon");
    boolean bool2 = false;
    if (bool1) {
      bool2 = true;
    }
    LogUtils.infoLog("WeMoPushUtils", "Push Notification: is ADM Available: " + bool2);
    return bool2;
  }
  
  public static final String registerAppWithGCMServer(Context paramContext)
    throws IOException
  {
    String str = GoogleCloudMessaging.getInstance(paramContext).register(new String[] { "1055303863585" });
    SharePreferences.setGCMRegistrationId(str, paramContext);
    LogUtils.infoLog("WeMoPushUtils", "Push Notification: Registered app with GCM server. Registration Id: " + str);
    return str;
  }
  
  public static final String unregisterAppFromGCMServer(Context paramContext)
    throws IOException
  {
    try
    {
      String str = SharePreferences.getGCMRegistrationId(paramContext);
      GoogleCloudMessaging.getInstance(paramContext).unregister();
      SharePreferences.setGCMRegistrationId(new String(), paramContext);
      LogUtils.infoLog("WeMoPushUtils", "Push Notification: Unregistered app from GCM Server");
      return str;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return null;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/utils/WeMoPushUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */