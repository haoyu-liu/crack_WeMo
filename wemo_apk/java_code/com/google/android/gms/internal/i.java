package com.google.android.gms.internal;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.util.Log;

public class i
  implements DialogInterface.OnClickListener
{
  private final Activity bm;
  private final int bn;
  private final Intent mIntent;
  
  public i(Activity paramActivity, Intent paramIntent, int paramInt)
  {
    this.bm = paramActivity;
    this.mIntent = paramIntent;
    this.bn = paramInt;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    try
    {
      if (this.mIntent != null) {
        this.bm.startActivityForResult(this.mIntent, this.bn);
      }
      paramDialogInterface.dismiss();
      return;
    }
    catch (ActivityNotFoundException localActivityNotFoundException)
    {
      Log.e("SettingsRedirect", "Can't redirect to app settings for Google Play services");
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/i.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */