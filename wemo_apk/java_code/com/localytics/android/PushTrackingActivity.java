package com.localytics.android;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.text.TextUtils;

public class PushTrackingActivity
  extends Activity
{
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    Intent localIntent1 = getIntent();
    String str = DatapointHelper.getLocalyticsAppKeyOrNull(this);
    if (!TextUtils.isEmpty(str)) {
      Localytics.integrate(getApplicationContext(), str);
    }
    Localytics.openSession();
    Localytics.handlePushNotificationOpened(localIntent1);
    finish();
    Intent localIntent2 = getPackageManager().getLaunchIntentForPackage(getPackageName());
    localIntent2.putExtras(localIntent1);
    localIntent2.addFlags(603979776);
    startActivity(localIntent2);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/PushTrackingActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */