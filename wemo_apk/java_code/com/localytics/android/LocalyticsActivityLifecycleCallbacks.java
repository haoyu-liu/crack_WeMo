package com.localytics.android;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application.ActivityLifecycleCallbacks;
import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;

@TargetApi(14)
public class LocalyticsActivityLifecycleCallbacks
  implements Application.ActivityLifecycleCallbacks
{
  public LocalyticsActivityLifecycleCallbacks(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public LocalyticsActivityLifecycleCallbacks(Context paramContext, String paramString)
  {
    Localytics.integrate(paramContext, paramString);
    Localytics.setIsAutoIntegrate(true);
  }
  
  public void onActivityCreated(Activity paramActivity, Bundle paramBundle) {}
  
  public void onActivityDestroyed(Activity paramActivity) {}
  
  public void onActivityPaused(Activity paramActivity)
  {
    if ((paramActivity instanceof FragmentActivity))
    {
      Localytics.dismissCurrentInAppMessage();
      Localytics.clearInAppMessageDisplayActivity();
    }
    Localytics.closeSession();
    Localytics.upload();
  }
  
  public void onActivityResumed(Activity paramActivity)
  {
    Localytics.openSession();
    Localytics.upload();
    if ((paramActivity instanceof FragmentActivity)) {
      Localytics.setInAppMessageDisplayActivity((FragmentActivity)paramActivity);
    }
    Localytics.handleTestMode(paramActivity.getIntent());
    Localytics.handlePushNotificationOpened(paramActivity.getIntent());
  }
  
  public void onActivitySaveInstanceState(Activity paramActivity, Bundle paramBundle) {}
  
  public void onActivityStarted(Activity paramActivity) {}
  
  public void onActivityStopped(Activity paramActivity) {}
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/LocalyticsActivityLifecycleCallbacks.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */