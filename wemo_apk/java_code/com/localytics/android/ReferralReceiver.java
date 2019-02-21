package com.localytics.android;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;

public class ReferralReceiver
  extends BroadcastReceiver
{
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    String str2;
    do
    {
      String str1;
      do
      {
        try
        {
          Bundle localBundle = paramIntent.getExtras();
          if (localBundle != null) {
            localBundle.containsKey(null);
          }
          if (!paramIntent.getAction().equals("com.android.vending.INSTALL_REFERRER")) {
            return;
          }
        }
        catch (Exception localException)
        {
          return;
        }
        str1 = DatapointHelper.getLocalyticsAppKeyOrNull(paramContext);
      } while (TextUtils.isEmpty(str1));
      Localytics.integrate(paramContext.getApplicationContext(), str1);
      str2 = paramIntent.getStringExtra("referrer");
    } while ((str2 == null) || (str2.length() == 0));
    LocalyticsManager.getInstance().setReferrerId(str2);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/ReferralReceiver.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */