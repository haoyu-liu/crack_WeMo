package com.localytics.android;

import android.app.Activity;
import android.content.Intent;

public class LocalyticsActivity
  extends Activity
{
  protected void onNewIntent(Intent paramIntent)
  {
    super.onNewIntent(paramIntent);
    setIntent(paramIntent);
  }
  
  public void onPause()
  {
    Localytics.closeSession();
    Localytics.upload();
    super.onPause();
  }
  
  public void onResume()
  {
    super.onResume();
    Localytics.openSession();
    Localytics.handlePushNotificationOpened(getIntent());
    Localytics.upload();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/LocalyticsActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */