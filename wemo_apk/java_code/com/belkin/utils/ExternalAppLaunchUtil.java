package com.belkin.utils;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;

public class ExternalAppLaunchUtil
{
  private void showInMarket(String paramString, Context paramContext)
  {
    Intent localIntent = new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=com.amazon.dee.app"));
    localIntent.setFlags(268435456);
    paramContext.startActivity(localIntent);
  }
  
  public void launchAlexaApp(Context paramContext)
  {
    LogUtils.debugLog("ExternalAppLaunchUtil", "launching Amazon Alexa app");
    Intent localIntent = paramContext.getPackageManager().getLaunchIntentForPackage("com.amazon.dee.app");
    try
    {
      paramContext.startActivity(localIntent);
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      showInMarket("com.amazon.dee.app", paramContext);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/utils/ExternalAppLaunchUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */