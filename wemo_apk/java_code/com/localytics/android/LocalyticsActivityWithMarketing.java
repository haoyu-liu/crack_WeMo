package com.localytics.android;

import android.content.Intent;
import android.support.v4.app.FragmentActivity;

public class LocalyticsActivityWithMarketing
  extends FragmentActivity
{
  protected void onNewIntent(Intent paramIntent)
  {
    super.onNewIntent(paramIntent);
    setIntent(paramIntent);
  }
  
  public void onPause()
  {
    Localytics.dismissCurrentInAppMessage();
    Localytics.clearInAppMessageDisplayActivity();
    Localytics.closeSession();
    Localytics.upload();
    super.onPause();
  }
  
  public void onResume()
  {
    super.onResume();
    Localytics.openSession();
    Localytics.setInAppMessageDisplayActivity(this);
    Localytics.handlePushNotificationOpened(getIntent());
    Localytics.handleTestMode(getIntent());
    Localytics.upload();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/LocalyticsActivityWithMarketing.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */