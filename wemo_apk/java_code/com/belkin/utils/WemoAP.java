package com.belkin.utils;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.View.OnClickListener;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.NetworkMode;
import com.belkin.wemo.cache.utils.SDKNetworkUtils;
import com.belkin.wemo.cache.utils.SharePreferences;

public class WemoAP
{
  private static final String TAG = WemoAP.class.getSimpleName();
  private static final long WEMO_AP_POPUP_WAIT_TIME = 5000L;
  private static Dialog dialog = null;
  private final long WAIT_TIME = 1000L;
  private SDKNetworkUtils mNetworkUtils;
  
  public static void dismiss()
  {
    if (dialog != null)
    {
      dialog.dismiss();
      dialog = null;
    }
  }
  
  public static void handleWemoAPPopup(Context paramContext, final DeviceListManager paramDeviceListManager)
  {
    new Handler(Looper.getMainLooper()).postDelayed(new Runnable()
    {
      public void run()
      {
        new WemoAP().show(this.val$ctx, paramDeviceListManager);
      }
    }, 5000L);
  }
  
  private void setUserDismissThePopup(Context paramContext)
  {
    new SharePreferences(paramContext).setUserDismissPluginPopup(true);
  }
  
  private void show(Context paramContext, DeviceListManager paramDeviceListManager)
  {
    LogUtils.debugLog(TAG, "SHOW WemoAP Pop-up");
    if ((paramContext == null) || (paramDeviceListManager == null)) {}
    boolean bool1;
    String str2;
    boolean bool2;
    do
    {
      return;
      String str1 = NetworkMode.getAppNetworkType();
      this.mNetworkUtils = new SDKNetworkUtils(paramContext);
      bool1 = this.mNetworkUtils.isPluginConnected();
      str2 = this.mNetworkUtils.getNetworkName();
      LogUtils.debugLog(TAG, "Network Mode is Local:  " + NetworkMode.isLocal() + " - App Network Type is: " + str1 + " -isPluginConnected: " + bool1 + " -networkname: " + str2);
      String str3 = paramDeviceListManager.getNetworkType();
      LogUtils.debugLog(TAG, "; Network Type: " + str3);
      bool2 = new SharePreferences(paramContext).isUserDismissPluginPopup();
      LogUtils.debugLog(TAG, "; Is user dismissed the plugin popup: " + bool2);
    } while ((!bool1) || (!str2.equalsIgnoreCase("Cellular")) || (bool2));
    LogUtils.debugLog(TAG, "Its time to show popup");
    showWemoAPPopup(paramContext, paramDeviceListManager);
  }
  
  /* Error */
  private void showWemoAPPopup(final Context paramContext, final DeviceListManager paramDeviceListManager)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: getstatic 19	com/belkin/utils/WemoAP:dialog	Landroid/app/Dialog;
    //   5: astore 4
    //   7: aload 4
    //   9: ifnull +6 -> 15
    //   12: aload_0
    //   13: monitorexit
    //   14: return
    //   15: new 51	android/app/Dialog
    //   18: dup
    //   19: aload_1
    //   20: invokespecial 156	android/app/Dialog:<init>	(Landroid/content/Context;)V
    //   23: putstatic 19	com/belkin/utils/WemoAP:dialog	Landroid/app/Dialog;
    //   26: getstatic 19	com/belkin/utils/WemoAP:dialog	Landroid/app/Dialog;
    //   29: iconst_1
    //   30: invokevirtual 160	android/app/Dialog:requestWindowFeature	(I)Z
    //   33: pop
    //   34: getstatic 19	com/belkin/utils/WemoAP:dialog	Landroid/app/Dialog;
    //   37: iconst_0
    //   38: invokevirtual 163	android/app/Dialog:setCanceledOnTouchOutside	(Z)V
    //   41: getstatic 19	com/belkin/utils/WemoAP:dialog	Landroid/app/Dialog;
    //   44: invokevirtual 167	android/app/Dialog:getWindow	()Landroid/view/Window;
    //   47: new 169	android/graphics/drawable/ColorDrawable
    //   50: dup
    //   51: iconst_0
    //   52: invokespecial 172	android/graphics/drawable/ColorDrawable:<init>	(I)V
    //   55: invokevirtual 178	android/view/Window:setBackgroundDrawable	(Landroid/graphics/drawable/Drawable;)V
    //   58: getstatic 19	com/belkin/utils/WemoAP:dialog	Landroid/app/Dialog;
    //   61: ldc -77
    //   63: invokevirtual 182	android/app/Dialog:setContentView	(I)V
    //   66: getstatic 19	com/belkin/utils/WemoAP:dialog	Landroid/app/Dialog;
    //   69: ldc -73
    //   71: invokevirtual 187	android/app/Dialog:findViewById	(I)Landroid/view/View;
    //   74: checkcast 189	android/widget/Button
    //   77: new 191	com/belkin/utils/WemoAP$2
    //   80: dup
    //   81: aload_0
    //   82: aload_1
    //   83: invokespecial 193	com/belkin/utils/WemoAP$2:<init>	(Lcom/belkin/utils/WemoAP;Landroid/content/Context;)V
    //   86: invokevirtual 197	android/widget/Button:setOnClickListener	(Landroid/view/View$OnClickListener;)V
    //   89: getstatic 19	com/belkin/utils/WemoAP:dialog	Landroid/app/Dialog;
    //   92: ldc -58
    //   94: invokevirtual 187	android/app/Dialog:findViewById	(I)Landroid/view/View;
    //   97: checkcast 189	android/widget/Button
    //   100: new 200	com/belkin/utils/WemoAP$3
    //   103: dup
    //   104: aload_0
    //   105: invokespecial 203	com/belkin/utils/WemoAP$3:<init>	(Lcom/belkin/utils/WemoAP;)V
    //   108: invokevirtual 197	android/widget/Button:setOnClickListener	(Landroid/view/View$OnClickListener;)V
    //   111: new 56	android/os/Handler
    //   114: dup
    //   115: invokestatic 62	android/os/Looper:getMainLooper	()Landroid/os/Looper;
    //   118: invokespecial 65	android/os/Handler:<init>	(Landroid/os/Looper;)V
    //   121: new 205	com/belkin/utils/WemoAP$4
    //   124: dup
    //   125: aload_0
    //   126: aload_2
    //   127: aload_1
    //   128: invokespecial 208	com/belkin/utils/WemoAP$4:<init>	(Lcom/belkin/utils/WemoAP;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;)V
    //   131: ldc2_w 31
    //   134: invokevirtual 73	android/os/Handler:postDelayed	(Ljava/lang/Runnable;J)Z
    //   137: pop
    //   138: goto -126 -> 12
    //   141: astore_3
    //   142: aload_0
    //   143: monitorexit
    //   144: aload_3
    //   145: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	146	0	this	WemoAP
    //   0	146	1	paramContext	Context
    //   0	146	2	paramDeviceListManager	DeviceListManager
    //   141	4	3	localObject	Object
    //   5	3	4	localDialog	Dialog
    // Exception table:
    //   from	to	target	type
    //   2	7	141	finally
    //   15	138	141	finally
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/utils/WemoAP.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */