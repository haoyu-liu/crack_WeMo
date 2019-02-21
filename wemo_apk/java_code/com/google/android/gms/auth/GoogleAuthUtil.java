package com.google.android.gms.auth;

import android.accounts.AccountManager;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Looper;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.R.string;
import com.google.android.gms.common.GooglePlayServicesUtil;
import java.io.IOException;
import java.net.URISyntaxException;

public final class GoogleAuthUtil
{
  public static final String GOOGLE_ACCOUNT_TYPE = "com.google";
  public static final String KEY_ANDROID_PACKAGE_NAME;
  public static final String KEY_CALLER_UID;
  public static final String KEY_REQUEST_ACTIONS = "request_visible_actions";
  @Deprecated
  public static final String KEY_REQUEST_VISIBLE_ACTIVITIES = "request_visible_actions";
  public static final String KEY_SUPPRESS_PROGRESS_SCREEN = "suppressProgressScreen";
  private static final ComponentName u;
  private static final ComponentName v;
  private static final Intent w;
  private static final Intent x;
  
  static
  {
    String str1;
    if (Build.VERSION.SDK_INT >= 11)
    {
      str1 = "callerUid";
      KEY_CALLER_UID = str1;
      if (Build.VERSION.SDK_INT < 14) {
        break label97;
      }
    }
    label97:
    for (String str2 = "androidPackageName";; str2 = "androidPackageName")
    {
      KEY_ANDROID_PACKAGE_NAME = str2;
      u = new ComponentName("com.google.android.gms", "com.google.android.gms.auth.GetToken");
      v = new ComponentName("com.google.android.gms", "com.google.android.gms.recovery.RecoveryService");
      w = new Intent().setComponent(u);
      x = new Intent().setComponent(v);
      return;
      str1 = "callerUid";
      break;
    }
  }
  
  private static String a(Context paramContext, String paramString1, String paramString2, Bundle paramBundle)
    throws IOException, UserRecoverableNotifiedException, GoogleAuthException
  {
    if (paramBundle == null) {
      paramBundle = new Bundle();
    }
    try
    {
      String str3 = getToken(paramContext, paramString1, paramString2, paramBundle);
      return str3;
    }
    catch (GooglePlayServicesAvailabilityException localGooglePlayServicesAvailabilityException)
    {
      PendingIntent localPendingIntent = GooglePlayServicesUtil.getErrorPendingIntent(localGooglePlayServicesAvailabilityException.getConnectionStatusCode(), paramContext, 0);
      Resources localResources = paramContext.getResources();
      Notification localNotification = new Notification(17301642, localResources.getString(R.string.auth_client_play_services_err_notification_msg), System.currentTimeMillis());
      localNotification.flags = (0x10 | localNotification.flags);
      String str1 = paramContext.getApplicationInfo().name;
      if (TextUtils.isEmpty(str1)) {
        str1 = paramContext.getPackageName();
      }
      String str2 = localResources.getString(R.string.auth_client_requested_by_msg, new Object[] { str1 });
      int i;
      switch (localGooglePlayServicesAvailabilityException.getConnectionStatusCode())
      {
      default: 
        i = R.string.auth_client_using_bad_version_title;
      }
      for (;;)
      {
        localNotification.setLatestEventInfo(paramContext, localResources.getString(i), str2, localPendingIntent);
        ((NotificationManager)paramContext.getSystemService("notification")).notify(39789, localNotification);
        throw new UserRecoverableNotifiedException("User intervention required. Notification has been pushed.");
        i = R.string.auth_client_needs_installation_title;
        continue;
        i = R.string.auth_client_needs_update_title;
        continue;
        i = R.string.auth_client_needs_enabling_title;
      }
    }
    catch (UserRecoverableAuthException localUserRecoverableAuthException)
    {
      throw new UserRecoverableNotifiedException("User intervention required. Notification has been pushed.");
    }
  }
  
  private static void a(Context paramContext)
    throws GooglePlayServicesAvailabilityException, GoogleAuthException
  {
    int i = GooglePlayServicesUtil.isGooglePlayServicesAvailable(paramContext);
    if (i != 0)
    {
      Intent localIntent = GooglePlayServicesUtil.a(paramContext, i, -1);
      String str = "GooglePlayServices not available due to error " + i;
      Log.e("GoogleAuthUtil", str);
      if (localIntent == null) {
        throw new GoogleAuthException(str);
      }
      throw new GooglePlayServicesAvailabilityException(i, "GooglePlayServicesNotAvailable", localIntent);
    }
  }
  
  private static void a(Intent paramIntent)
  {
    if (paramIntent == null) {
      throw new IllegalArgumentException("Callack cannot be null.");
    }
    String str = paramIntent.toUri(1);
    try
    {
      Intent.parseUri(str, 1);
      return;
    }
    catch (URISyntaxException localURISyntaxException)
    {
      throw new IllegalArgumentException("Parameter callback contains invalid data. It must be serializable using toUri() and parseUri().");
    }
  }
  
  private static boolean a(String paramString)
  {
    return ("NetworkError".equals(paramString)) || ("ServiceUnavailable".equals(paramString)) || ("Timeout".equals(paramString));
  }
  
  private static void b(Context paramContext)
  {
    Looper localLooper = Looper.myLooper();
    if ((localLooper != null) && (localLooper == paramContext.getMainLooper()))
    {
      IllegalStateException localIllegalStateException = new IllegalStateException("calling this from your main thread can lead to deadlock");
      Log.e("GoogleAuthUtil", "Calling this from your main thread can lead to deadlock and/or ANRs", localIllegalStateException);
      throw localIllegalStateException;
    }
  }
  
  private static boolean b(String paramString)
  {
    return ("BadAuthentication".equals(paramString)) || ("CaptchaRequired".equals(paramString)) || ("DeviceManagementRequiredOrSyncDisabled".equals(paramString)) || ("NeedPermission".equals(paramString)) || ("NeedsBrowser".equals(paramString)) || ("UserCancel".equals(paramString)) || ("AppDownloadRequired".equals(paramString));
  }
  
  public static String getToken(Context paramContext, String paramString1, String paramString2)
    throws IOException, UserRecoverableAuthException, GoogleAuthException
  {
    return getToken(paramContext, paramString1, paramString2, new Bundle());
  }
  
  /* Error */
  public static String getToken(Context paramContext, String paramString1, String paramString2, Bundle paramBundle)
    throws IOException, UserRecoverableAuthException, GoogleAuthException
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 298	android/content/Context:getApplicationContext	()Landroid/content/Context;
    //   4: astore 4
    //   6: aload 4
    //   8: invokestatic 300	com/google/android/gms/auth/GoogleAuthUtil:b	(Landroid/content/Context;)V
    //   11: aload 4
    //   13: invokestatic 302	com/google/android/gms/auth/GoogleAuthUtil:a	(Landroid/content/Context;)V
    //   16: aload_3
    //   17: ifnonnull +107 -> 124
    //   20: new 83	android/os/Bundle
    //   23: dup
    //   24: invokespecial 84	android/os/Bundle:<init>	()V
    //   27: astore 5
    //   29: aload 5
    //   31: getstatic 40	com/google/android/gms/auth/GoogleAuthUtil:KEY_ANDROID_PACKAGE_NAME	Ljava/lang/String;
    //   34: invokevirtual 305	android/os/Bundle:containsKey	(Ljava/lang/String;)Z
    //   37: ifne +15 -> 52
    //   40: aload 5
    //   42: getstatic 40	com/google/android/gms/auth/GoogleAuthUtil:KEY_ANDROID_PACKAGE_NAME	Ljava/lang/String;
    //   45: aload_0
    //   46: invokevirtual 148	android/content/Context:getPackageName	()Ljava/lang/String;
    //   49: invokevirtual 308	android/os/Bundle:putString	(Ljava/lang/String;Ljava/lang/String;)V
    //   52: new 310	com/google/android/gms/common/a
    //   55: dup
    //   56: invokespecial 311	com/google/android/gms/common/a:<init>	()V
    //   59: astore 6
    //   61: aload_0
    //   62: getstatic 66	com/google/android/gms/auth/GoogleAuthUtil:w	Landroid/content/Intent;
    //   65: aload 6
    //   67: iconst_1
    //   68: invokevirtual 315	android/content/Context:bindService	(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    //   71: ifeq +185 -> 256
    //   74: aload 6
    //   76: invokevirtual 318	com/google/android/gms/common/a:e	()Landroid/os/IBinder;
    //   79: invokestatic 323	com/google/android/gms/internal/a$a:a	(Landroid/os/IBinder;)Lcom/google/android/gms/internal/a;
    //   82: aload_1
    //   83: aload_2
    //   84: aload 5
    //   86: invokeinterface 328 4 0
    //   91: astore 11
    //   93: aload 11
    //   95: ldc_w 330
    //   98: invokevirtual 333	android/os/Bundle:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   101: astore 12
    //   103: aload 12
    //   105: invokestatic 144	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   108: istore 13
    //   110: iload 13
    //   112: ifne +25 -> 137
    //   115: aload_0
    //   116: aload 6
    //   118: invokevirtual 337	android/content/Context:unbindService	(Landroid/content/ServiceConnection;)V
    //   121: aload 12
    //   123: areturn
    //   124: new 83	android/os/Bundle
    //   127: dup
    //   128: aload_3
    //   129: invokespecial 340	android/os/Bundle:<init>	(Landroid/os/Bundle;)V
    //   132: astore 5
    //   134: goto -105 -> 29
    //   137: aload 11
    //   139: ldc_w 342
    //   142: invokevirtual 333	android/os/Bundle:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   145: astore 14
    //   147: aload 11
    //   149: ldc_w 344
    //   152: invokevirtual 348	android/os/Bundle:getParcelable	(Ljava/lang/String;)Landroid/os/Parcelable;
    //   155: checkcast 58	android/content/Intent
    //   158: astore 15
    //   160: aload 14
    //   162: invokestatic 350	com/google/android/gms/auth/GoogleAuthUtil:b	(Ljava/lang/String;)Z
    //   165: ifeq +50 -> 215
    //   168: new 81	com/google/android/gms/auth/UserRecoverableAuthException
    //   171: dup
    //   172: aload 14
    //   174: aload 15
    //   176: invokespecial 353	com/google/android/gms/auth/UserRecoverableAuthException:<init>	(Ljava/lang/String;Landroid/content/Intent;)V
    //   179: athrow
    //   180: astore 9
    //   182: ldc -43
    //   184: ldc_w 355
    //   187: aload 9
    //   189: invokestatic 358	android/util/Log:i	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   192: pop
    //   193: new 73	java/io/IOException
    //   196: dup
    //   197: ldc_w 360
    //   200: invokespecial 361	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   203: athrow
    //   204: astore 8
    //   206: aload_0
    //   207: aload 6
    //   209: invokevirtual 337	android/content/Context:unbindService	(Landroid/content/ServiceConnection;)V
    //   212: aload 8
    //   214: athrow
    //   215: aload 14
    //   217: invokestatic 363	com/google/android/gms/auth/GoogleAuthUtil:a	(Ljava/lang/String;)Z
    //   220: ifeq +26 -> 246
    //   223: new 73	java/io/IOException
    //   226: dup
    //   227: aload 14
    //   229: invokespecial 361	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   232: athrow
    //   233: astore 7
    //   235: new 77	com/google/android/gms/auth/GoogleAuthException
    //   238: dup
    //   239: ldc_w 365
    //   242: invokespecial 220	com/google/android/gms/auth/GoogleAuthException:<init>	(Ljava/lang/String;)V
    //   245: athrow
    //   246: new 77	com/google/android/gms/auth/GoogleAuthException
    //   249: dup
    //   250: aload 14
    //   252: invokespecial 220	com/google/android/gms/auth/GoogleAuthException:<init>	(Ljava/lang/String;)V
    //   255: athrow
    //   256: new 81	com/google/android/gms/auth/UserRecoverableAuthException
    //   259: dup
    //   260: ldc_w 289
    //   263: aconst_null
    //   264: invokespecial 353	com/google/android/gms/auth/UserRecoverableAuthException:<init>	(Ljava/lang/String;Landroid/content/Intent;)V
    //   267: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	268	0	paramContext	Context
    //   0	268	1	paramString1	String
    //   0	268	2	paramString2	String
    //   0	268	3	paramBundle	Bundle
    //   4	8	4	localContext	Context
    //   27	106	5	localBundle1	Bundle
    //   59	149	6	locala	com.google.android.gms.common.a
    //   233	1	7	localInterruptedException	InterruptedException
    //   204	9	8	localObject	Object
    //   180	8	9	localRemoteException	android.os.RemoteException
    //   91	57	11	localBundle2	Bundle
    //   101	21	12	str1	String
    //   108	3	13	bool	boolean
    //   145	106	14	str2	String
    //   158	17	15	localIntent	Intent
    // Exception table:
    //   from	to	target	type
    //   74	110	180	android/os/RemoteException
    //   137	180	180	android/os/RemoteException
    //   215	233	180	android/os/RemoteException
    //   246	256	180	android/os/RemoteException
    //   74	110	204	finally
    //   137	180	204	finally
    //   182	204	204	finally
    //   215	233	204	finally
    //   235	246	204	finally
    //   246	256	204	finally
    //   74	110	233	java/lang/InterruptedException
    //   137	180	233	java/lang/InterruptedException
    //   215	233	233	java/lang/InterruptedException
    //   246	256	233	java/lang/InterruptedException
  }
  
  public static String getTokenWithNotification(Context paramContext, String paramString1, String paramString2, Bundle paramBundle)
    throws IOException, UserRecoverableNotifiedException, GoogleAuthException
  {
    if (paramBundle == null) {
      paramBundle = new Bundle();
    }
    paramBundle.putBoolean("handle_notification", true);
    return a(paramContext, paramString1, paramString2, paramBundle);
  }
  
  public static String getTokenWithNotification(Context paramContext, String paramString1, String paramString2, Bundle paramBundle, Intent paramIntent)
    throws IOException, UserRecoverableNotifiedException, GoogleAuthException
  {
    a(paramIntent);
    if (paramBundle == null) {
      paramBundle = new Bundle();
    }
    paramBundle.putParcelable("callback_intent", paramIntent);
    paramBundle.putBoolean("handle_notification", true);
    return a(paramContext, paramString1, paramString2, paramBundle);
  }
  
  public static String getTokenWithNotification(Context paramContext, String paramString1, String paramString2, Bundle paramBundle1, String paramString3, Bundle paramBundle2)
    throws IOException, UserRecoverableNotifiedException, GoogleAuthException
  {
    if (TextUtils.isEmpty(paramString3)) {
      throw new IllegalArgumentException("Authority cannot be empty or null.");
    }
    if (paramBundle1 == null) {
      paramBundle1 = new Bundle();
    }
    if (paramBundle2 == null) {
      paramBundle2 = new Bundle();
    }
    ContentResolver.validateSyncExtrasBundle(paramBundle2);
    paramBundle1.putString("authority", paramString3);
    paramBundle1.putBundle("sync_extras", paramBundle2);
    paramBundle1.putBoolean("handle_notification", true);
    return a(paramContext, paramString1, paramString2, paramBundle1);
  }
  
  public static void invalidateToken(Context paramContext, String paramString)
  {
    AccountManager.get(paramContext).invalidateAuthToken("com.google", paramString);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/auth/GoogleAuthUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */