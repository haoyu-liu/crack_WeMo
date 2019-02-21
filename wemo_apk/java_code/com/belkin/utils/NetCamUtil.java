package com.belkin.utils;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.util.Log;
import java.util.Iterator;
import java.util.List;

public class NetCamUtil
{
  public boolean checkNetCam(Context paramContext)
  {
    Iterator localIterator = paramContext.getPackageManager().getInstalledApplications(0).iterator();
    do
    {
      boolean bool1 = localIterator.hasNext();
      bool2 = false;
      if (!bool1) {
        break;
      }
    } while (!((ApplicationInfo)localIterator.next()).packageName.equals("com.belkin.android.androidbelkinnetcam"));
    boolean bool2 = true;
    return bool2;
  }
  
  public void launchNetCamApp(Context paramContext, String paramString1, String paramString2, int paramInt)
  {
    Log.i("NetCamUtil", "launchNetCamApp userName: " + paramString1 + " macAdd: " + paramString2 + " page: " + paramInt);
    Intent localIntent = new Intent("android.intent.action.MAIN");
    localIntent.putExtra("username", paramString1);
    localIntent.putExtra("mac", paramString2);
    localIntent.putExtra("page", paramInt);
    localIntent.setComponent(new ComponentName("com.belkin.android.androidbelkinnetcam", "com.belkin.android.androidbelkinnetcam.AndroidSeedonkActivity"));
    try
    {
      paramContext.startActivity(localIntent);
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      showInMarket("com.belkin.android.androidbelkinnetcam", paramContext);
    }
  }
  
  public void showInMarket(String paramString, Context paramContext)
  {
    Intent localIntent = new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=com.belkin.android.androidbelkinnetcam"));
    localIntent.setFlags(268435456);
    paramContext.startActivity(localIntent);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/utils/NetCamUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */