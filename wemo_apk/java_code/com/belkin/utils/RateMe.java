package com.belkin.utils;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.View.OnClickListener;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.devicelist.LEDStatusTracker;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.localytics.android.Localytics;
import java.util.HashMap;
import java.util.Map;
import org.apache.cordova.CordovaActivity;

public class RateMe
{
  private static final long RATE_ME_POPUP_WAIT_TIME = 15000L;
  private static final String TAG = RateMe.class.getSimpleName();
  private static Dialog dialog = null;
  private final String ANDROID_APP_STORE_URL_PREFIX = "market://details?id=";
  private final String LOCALYTICS_RATE_ME_SELECTION_KEY = "UserSelection";
  private final String LOCALYTICS_RATE_ME_TAG = "App_RatingsPopUp";
  private final String REPORT_A_PROBLEM_URL = "file:///android_asset/www/more/more_menu.html";
  private final long SUCCESS_COUNT = 7L;
  private final long WAIT_TIME = 8000L;
  
  public static void dismiss()
  {
    if (dialog != null)
    {
      dialog.dismiss();
      dialog = null;
    }
  }
  
  public static void doNotShowRatingPopUp(Context paramContext)
  {
    new SharePreferences(paramContext).setUserDidDeclineRatingsPopup(true);
  }
  
  public static void handleRateMePopup(Context paramContext, final DeviceListManager paramDeviceListManager)
  {
    new Handler(Looper.getMainLooper()).postDelayed(new Runnable()
    {
      public void run()
      {
        new RateMe().show(this.val$ctx, paramDeviceListManager);
      }
    }, 15000L);
  }
  
  private void incrementFullSuccessfulDiscoveryCounter(Context paramContext)
  {
    SharePreferences localSharePreferences = new SharePreferences(paramContext);
    localSharePreferences.setFullSuccessfulDiscoveryCounter(1 + localSharePreferences.getFullSuccessfulDiscoveryCounter());
  }
  
  private boolean isItTimeToShow(int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    LogUtils.debugLog(TAG, "fullSuccessfulDiscoveryCounter:" + paramInt);
    LogUtils.debugLog(TAG, "userDidRateWeMo:" + paramBoolean1);
    LogUtils.debugLog(TAG, "userDidDeclineRatingsPopup:" + paramBoolean2);
    return (!paramBoolean2) && (!paramBoolean1) && (paramInt > 7L);
  }
  
  private boolean isRateMeStillValid(Context paramContext)
  {
    if (paramContext == null) {}
    SharePreferences localSharePreferences;
    do
    {
      return false;
      localSharePreferences = new SharePreferences(paramContext);
    } while ((localSharePreferences.isUserDidDeclineRatingsPopup()) || (localSharePreferences.isUserDidRateWeMo()));
    return true;
  }
  
  public static void reset(Context paramContext)
  {
    if (paramContext == null) {
      return;
    }
    SharePreferences localSharePreferences = new SharePreferences(paramContext);
    localSharePreferences.setFullSuccessfulDiscoveryCounter(0);
    localSharePreferences.setUserDidRateWeMo(false);
    localSharePreferences.setUserDidDeclineRatingsPopup(false);
  }
  
  public static void resetFullSuccessfulDiscoveryCounter(Context paramContext)
  {
    LogUtils.debugLog(TAG, "Resetting Full Successfull Discovery Counter.");
    new SharePreferences(paramContext).setFullSuccessfulDiscoveryCounter(0);
  }
  
  private void setUserDidDeclineRatingsPopup(Context paramContext)
  {
    new SharePreferences(paramContext).setUserDidDeclineRatingsPopup(true);
  }
  
  private void setUserDidRateWeMo(Context paramContext)
  {
    new SharePreferences(paramContext).setUserDidRateWeMo(true);
  }
  
  private void show(Context paramContext, DeviceListManager paramDeviceListManager)
  {
    LogUtils.debugLog(TAG, "SHOW RateMe Pop-up Requested.");
    if ((paramContext == null) || (paramDeviceListManager == null)) {}
    SharePreferences localSharePreferences;
    do
    {
      String str1;
      do
      {
        return;
        str1 = NetworkMode.getAppNetworkType();
        LogUtils.debugLog(TAG, "Network Mode is Local:  " + NetworkMode.isLocal() + " - App Network Type is: " + str1);
      } while (((!NetworkMode.isLocal()) && (!str1.equalsIgnoreCase("Home"))) || (!isRateMeStillValid(paramContext)));
      boolean bool1 = paramDeviceListManager.didUnicastFailForAnyDevice();
      boolean bool2 = LEDStatusTracker.isAnyLEDOffline();
      boolean bool3 = paramDeviceListManager.isDevicePairingInProgress();
      String str2 = paramDeviceListManager.getNetworkType();
      boolean bool4 = paramDeviceListManager.isDeviceNotReachable();
      LogUtils.debugLog(TAG, "SHOW RateMe Pop-up Requested. didUnicastFailForAnyDevice: " + bool1 + "; isAnyLEDOffline: " + bool2 + "; isDevicePairingInProgress: " + bool3 + "; Network Type: " + str2 + "; isDeviceNotReachable: " + bool4);
      if ((bool1) || (bool2) || (bool3) || (str2.equals("WEMO")) || (bool4))
      {
        resetFullSuccessfulDiscoveryCounter(paramContext);
        return;
      }
      incrementFullSuccessfulDiscoveryCounter(paramContext);
      localSharePreferences = new SharePreferences(paramContext);
    } while (!isItTimeToShow(localSharePreferences.getFullSuccessfulDiscoveryCounter(), localSharePreferences.isUserDidRateWeMo(), localSharePreferences.isUserDidDeclineRatingsPopup()));
    showRateMePopup(paramContext, paramDeviceListManager);
  }
  
  /* Error */
  private void showRateMePopup(final Context paramContext, final DeviceListManager paramDeviceListManager)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: getstatic 22	com/belkin/utils/RateMe:dialog	Landroid/app/Dialog;
    //   5: astore 4
    //   7: aload 4
    //   9: ifnull +6 -> 15
    //   12: aload_0
    //   13: monitorexit
    //   14: return
    //   15: new 85	android/app/Dialog
    //   18: dup
    //   19: aload_1
    //   20: invokespecial 237	android/app/Dialog:<init>	(Landroid/content/Context;)V
    //   23: putstatic 22	com/belkin/utils/RateMe:dialog	Landroid/app/Dialog;
    //   26: getstatic 22	com/belkin/utils/RateMe:dialog	Landroid/app/Dialog;
    //   29: iconst_1
    //   30: invokevirtual 241	android/app/Dialog:requestWindowFeature	(I)Z
    //   33: pop
    //   34: getstatic 22	com/belkin/utils/RateMe:dialog	Landroid/app/Dialog;
    //   37: iconst_0
    //   38: invokevirtual 244	android/app/Dialog:setCanceledOnTouchOutside	(Z)V
    //   41: getstatic 22	com/belkin/utils/RateMe:dialog	Landroid/app/Dialog;
    //   44: invokevirtual 248	android/app/Dialog:getWindow	()Landroid/view/Window;
    //   47: new 250	android/graphics/drawable/ColorDrawable
    //   50: dup
    //   51: iconst_0
    //   52: invokespecial 252	android/graphics/drawable/ColorDrawable:<init>	(I)V
    //   55: invokevirtual 258	android/view/Window:setBackgroundDrawable	(Landroid/graphics/drawable/Drawable;)V
    //   58: getstatic 22	com/belkin/utils/RateMe:dialog	Landroid/app/Dialog;
    //   61: ldc_w 259
    //   64: invokevirtual 262	android/app/Dialog:setContentView	(I)V
    //   67: getstatic 22	com/belkin/utils/RateMe:dialog	Landroid/app/Dialog;
    //   70: ldc_w 263
    //   73: invokevirtual 267	android/app/Dialog:findViewById	(I)Landroid/view/View;
    //   76: checkcast 269	android/widget/Button
    //   79: new 271	com/belkin/utils/RateMe$2
    //   82: dup
    //   83: aload_0
    //   84: aload_1
    //   85: invokespecial 273	com/belkin/utils/RateMe$2:<init>	(Lcom/belkin/utils/RateMe;Landroid/content/Context;)V
    //   88: invokevirtual 277	android/widget/Button:setOnClickListener	(Landroid/view/View$OnClickListener;)V
    //   91: getstatic 22	com/belkin/utils/RateMe:dialog	Landroid/app/Dialog;
    //   94: ldc_w 278
    //   97: invokevirtual 267	android/app/Dialog:findViewById	(I)Landroid/view/View;
    //   100: checkcast 269	android/widget/Button
    //   103: new 280	com/belkin/utils/RateMe$3
    //   106: dup
    //   107: aload_0
    //   108: aload_1
    //   109: invokespecial 281	com/belkin/utils/RateMe$3:<init>	(Lcom/belkin/utils/RateMe;Landroid/content/Context;)V
    //   112: invokevirtual 277	android/widget/Button:setOnClickListener	(Landroid/view/View$OnClickListener;)V
    //   115: getstatic 22	com/belkin/utils/RateMe:dialog	Landroid/app/Dialog;
    //   118: ldc_w 282
    //   121: invokevirtual 267	android/app/Dialog:findViewById	(I)Landroid/view/View;
    //   124: checkcast 269	android/widget/Button
    //   127: new 284	com/belkin/utils/RateMe$4
    //   130: dup
    //   131: aload_0
    //   132: aload_1
    //   133: invokespecial 285	com/belkin/utils/RateMe$4:<init>	(Lcom/belkin/utils/RateMe;Landroid/content/Context;)V
    //   136: invokevirtual 277	android/widget/Button:setOnClickListener	(Landroid/view/View$OnClickListener;)V
    //   139: getstatic 22	com/belkin/utils/RateMe:dialog	Landroid/app/Dialog;
    //   142: ldc_w 286
    //   145: invokevirtual 267	android/app/Dialog:findViewById	(I)Landroid/view/View;
    //   148: checkcast 269	android/widget/Button
    //   151: new 288	com/belkin/utils/RateMe$5
    //   154: dup
    //   155: aload_0
    //   156: aload_1
    //   157: invokespecial 289	com/belkin/utils/RateMe$5:<init>	(Lcom/belkin/utils/RateMe;Landroid/content/Context;)V
    //   160: invokevirtual 277	android/widget/Button:setOnClickListener	(Landroid/view/View$OnClickListener;)V
    //   163: new 98	android/os/Handler
    //   166: dup
    //   167: invokestatic 104	android/os/Looper:getMainLooper	()Landroid/os/Looper;
    //   170: invokespecial 107	android/os/Handler:<init>	(Landroid/os/Looper;)V
    //   173: new 291	com/belkin/utils/RateMe$6
    //   176: dup
    //   177: aload_0
    //   178: aload_2
    //   179: aload_1
    //   180: invokespecial 294	com/belkin/utils/RateMe$6:<init>	(Lcom/belkin/utils/RateMe;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;)V
    //   183: ldc2_w 34
    //   186: invokevirtual 115	android/os/Handler:postDelayed	(Ljava/lang/Runnable;J)Z
    //   189: pop
    //   190: goto -178 -> 12
    //   193: astore_3
    //   194: aload_0
    //   195: monitorexit
    //   196: aload_3
    //   197: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	198	0	this	RateMe
    //   0	198	1	paramContext	Context
    //   0	198	2	paramDeviceListManager	DeviceListManager
    //   193	4	3	localObject	Object
    //   5	3	4	localDialog	Dialog
    // Exception table:
    //   from	to	target	type
    //   2	7	193	finally
    //   15	190	193	finally
  }
  
  private void updateLocalytics(int paramInt)
  {
    if (paramInt < 0) {
      return;
    }
    HashMap localHashMap = new HashMap();
    localHashMap.put("UserSelection", String.valueOf(paramInt));
    Localytics.tagEvent("App_RatingsPopUp", localHashMap);
    LogUtils.debugLog(TAG, "updateLocalytics:" + paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/utils/RateMe.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */