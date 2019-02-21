package com.localytics.android;

import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.database.Cursor;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

final class DatapointHelper
{
  private static final Object[] HARDWARE_TELEPHONY = { "android.hardware.telephony" };
  private static final String INVALID_ANDROID_ID = "9774d56d682e549c";
  private static final String LEGACY_DEVICE_ID_FILE = "/localytics/device_id";
  private static final Class<?>[] STRING_CLASS_ARRAY = { String.class };
  
  private DatapointHelper()
  {
    throw new UnsupportedOperationException("This class is non-instantiable");
  }
  
  static AdvertisingInfo getAdvertisingInfo(Context paramContext)
  {
    try
    {
      Object localObject = ReflectionUtils.tryInvokeStatic("com.google.android.gms.ads.identifier.AdvertisingIdClient", "getAdvertisingIdInfo", new Class[] { Context.class }, new Object[] { paramContext });
      if (localObject != null)
      {
        String str = (String)ReflectionUtils.tryInvokeInstance(localObject, "getId", null, null);
        boolean bool = ((Boolean)ReflectionUtils.tryInvokeInstance(localObject, "isLimitAdTrackingEnabled", null, null)).booleanValue();
        if (TextUtils.isEmpty(str)) {
          str = null;
        }
        AdvertisingInfo localAdvertisingInfo = new AdvertisingInfo(str, bool);
        return localAdvertisingInfo;
      }
    }
    catch (Exception localException)
    {
      Localytics.Log.w("Device doesn't have Google Play Services installed");
    }
    return null;
  }
  
  static String getAndroidIdHashOrNull(Context paramContext)
  {
    String str = getAndroidIdOrNull(paramContext);
    if (str == null) {
      return null;
    }
    return getSha256_buggy(str);
  }
  
  /* Error */
  static String getAndroidIdOrNull(Context paramContext)
  {
    // Byte code:
    //   0: new 102	java/io/File
    //   3: dup
    //   4: new 104	java/lang/StringBuilder
    //   7: dup
    //   8: invokespecial 105	java/lang/StringBuilder:<init>	()V
    //   11: aload_0
    //   12: invokevirtual 109	android/content/Context:getFilesDir	()Ljava/io/File;
    //   15: invokevirtual 113	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   18: ldc 13
    //   20: invokevirtual 116	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   23: invokevirtual 120	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   26: invokespecial 121	java/io/File:<init>	(Ljava/lang/String;)V
    //   29: astore_1
    //   30: aload_1
    //   31: invokevirtual 124	java/io/File:exists	()Z
    //   34: ifeq +91 -> 125
    //   37: aload_1
    //   38: invokevirtual 128	java/io/File:length	()J
    //   41: lconst_0
    //   42: lcmp
    //   43: ifle +82 -> 125
    //   46: aconst_null
    //   47: astore_3
    //   48: bipush 100
    //   50: newarray <illegal type>
    //   52: astore 9
    //   54: new 130	java/io/BufferedReader
    //   57: dup
    //   58: new 132	java/io/FileReader
    //   61: dup
    //   62: aload_1
    //   63: invokespecial 135	java/io/FileReader:<init>	(Ljava/io/File;)V
    //   66: sipush 128
    //   69: invokespecial 138	java/io/BufferedReader:<init>	(Ljava/io/Reader;I)V
    //   72: astore 10
    //   74: aload 9
    //   76: iconst_0
    //   77: aload 10
    //   79: aload 9
    //   81: invokevirtual 142	java/io/BufferedReader:read	([C)I
    //   84: invokestatic 146	java/lang/String:copyValueOf	([CII)Ljava/lang/String;
    //   87: astore 11
    //   89: aload 10
    //   91: invokevirtual 149	java/io/BufferedReader:close	()V
    //   94: aload 10
    //   96: ifnull +8 -> 104
    //   99: aload 10
    //   101: invokevirtual 149	java/io/BufferedReader:close	()V
    //   104: aload 11
    //   106: areturn
    //   107: astore 7
    //   109: ldc -105
    //   111: aload 7
    //   113: invokestatic 154	com/localytics/android/Localytics$Log:w	(Ljava/lang/String;Ljava/lang/Throwable;)I
    //   116: pop
    //   117: aload_3
    //   118: ifnull +7 -> 125
    //   121: aload_3
    //   122: invokevirtual 149	java/io/BufferedReader:close	()V
    //   125: aload_0
    //   126: invokevirtual 158	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   129: ldc -96
    //   131: invokestatic 166	android/provider/Settings$Secure:getString	(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    //   134: astore_2
    //   135: aload_2
    //   136: ifnull +15 -> 151
    //   139: aload_2
    //   140: invokevirtual 169	java/lang/String:toLowerCase	()Ljava/lang/String;
    //   143: ldc 10
    //   145: invokevirtual 173	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   148: ifeq +31 -> 179
    //   151: aconst_null
    //   152: areturn
    //   153: astore 4
    //   155: aload_3
    //   156: ifnull +7 -> 163
    //   159: aload_3
    //   160: invokevirtual 149	java/io/BufferedReader:close	()V
    //   163: aload 4
    //   165: athrow
    //   166: astore 5
    //   168: ldc -105
    //   170: aload 5
    //   172: invokestatic 154	com/localytics/android/Localytics$Log:w	(Ljava/lang/String;Ljava/lang/Throwable;)I
    //   175: pop
    //   176: goto -51 -> 125
    //   179: aload_2
    //   180: areturn
    //   181: astore 5
    //   183: goto -15 -> 168
    //   186: astore 4
    //   188: aload 10
    //   190: astore_3
    //   191: goto -36 -> 155
    //   194: astore 7
    //   196: aload 10
    //   198: astore_3
    //   199: goto -90 -> 109
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	202	0	paramContext	Context
    //   29	34	1	localFile	java.io.File
    //   134	46	2	str1	String
    //   47	152	3	localObject1	Object
    //   153	11	4	localObject2	Object
    //   186	1	4	localObject3	Object
    //   166	5	5	localIOException1	java.io.IOException
    //   181	1	5	localIOException2	java.io.IOException
    //   107	5	7	localFileNotFoundException1	java.io.FileNotFoundException
    //   194	1	7	localFileNotFoundException2	java.io.FileNotFoundException
    //   52	28	9	arrayOfChar	char[]
    //   72	125	10	localBufferedReader	java.io.BufferedReader
    //   87	18	11	str2	String
    // Exception table:
    //   from	to	target	type
    //   48	74	107	java/io/FileNotFoundException
    //   48	74	153	finally
    //   109	117	153	finally
    //   121	125	166	java/io/IOException
    //   159	163	166	java/io/IOException
    //   163	166	166	java/io/IOException
    //   99	104	181	java/io/IOException
    //   74	94	186	finally
    //   74	94	194	java/io/FileNotFoundException
  }
  
  static int getApiLevel()
  {
    try
    {
      int j = Integer.parseInt((String)Build.VERSION.class.getField("SDK").get(null));
      return j;
    }
    catch (Exception localException1)
    {
      Localytics.Log.w("Caught exception", localException1);
      try
      {
        int i = Build.VERSION.class.getField("SDK_INT").getInt(null);
        return i;
      }
      catch (Exception localException2)
      {
        Localytics.Log.w("Caught exception", localException2);
      }
    }
    return 3;
  }
  
  static String getAppVersion(Context paramContext)
  {
    PackageManager localPackageManager = paramContext.getPackageManager();
    try
    {
      String str = localPackageManager.getPackageInfo(paramContext.getPackageName(), 0).versionName;
      if (str == null)
      {
        Localytics.Log.w("versionName was null--is a versionName attribute set in the Android Manifest?");
        str = "unknown";
      }
      return str;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      throw new RuntimeException(localNameNotFoundException);
    }
  }
  
  static String getFBAttribution(Context paramContext)
  {
    ContentResolver localContentResolver = paramContext.getContentResolver();
    Uri localUri = Uri.parse("content://com.facebook.katana.provider.AttributionIdProvider");
    String[] arrayOfString = { "aid" };
    localCursor = null;
    try
    {
      localCursor = localContentResolver.query(localUri, arrayOfString, null, null, null);
      localObject2 = null;
      if (localCursor != null)
      {
        boolean bool = localCursor.moveToFirst();
        localObject2 = null;
        if (bool)
        {
          String str = localCursor.getString(localCursor.getColumnIndex("aid"));
          localObject2 = str;
        }
      }
    }
    catch (Exception localException)
    {
      Localytics.Log.w("Error reading FB attribution", localException);
      Object localObject2 = null;
      return null;
    }
    finally
    {
      if (localCursor == null) {
        break label139;
      }
      localCursor.close();
    }
    return (String)localObject2;
  }
  
  static String getLocalyticsAppKeyOrNull(Context paramContext)
  {
    if (paramContext == null)
    {
      Localytics.Log.w("Context passed to getLocalyticsAppKeyOrNull() is NULL. Please pass a valid context.");
      return null;
    }
    try
    {
      Context localContext = paramContext.getApplicationContext();
      ApplicationInfo localApplicationInfo = localContext.getPackageManager().getApplicationInfo(localContext.getPackageName(), 128);
      if (localApplicationInfo.metaData != null)
      {
        Object localObject = localApplicationInfo.metaData.get("LOCALYTICS_APP_KEY");
        if ((localObject instanceof String))
        {
          String str = (String)localObject;
          return str;
        }
      }
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      throw new RuntimeException(localNameNotFoundException);
    }
    return null;
  }
  
  static int getLocalyticsNotificationIcon(Context paramContext)
  {
    int i;
    try
    {
      ApplicationInfo localApplicationInfo1 = paramContext.getPackageManager().getApplicationInfo(paramContext.getPackageName(), 128);
      if (localApplicationInfo1.metaData != null)
      {
        String str1 = (String)localApplicationInfo1.metaData.get("LOCALYTICS_NOTIFICATION_ICON");
        if (str1 != null)
        {
          String str2 = str1.substring(1 + str1.lastIndexOf('/'), str1.lastIndexOf('.'));
          int j = paramContext.getResources().getIdentifier(str2, "drawable", paramContext.getPackageName());
          if (isValidResourceId(paramContext, j)) {
            return j;
          }
        }
      }
      ApplicationInfo localApplicationInfo2 = paramContext.getPackageManager().getApplicationInfo(paramContext.getPackageName(), 0);
      if (localApplicationInfo2.icon != 0)
      {
        i = localApplicationInfo2.icon;
        boolean bool = isValidResourceId(paramContext, i);
        if (bool) {
          break label142;
        }
      }
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      for (;;) {}
    }
    return 17301651;
    label142:
    return i;
  }
  
  static String getLocalyticsRollupKeyOrNull(Context paramContext)
  {
    try
    {
      ApplicationInfo localApplicationInfo = paramContext.getPackageManager().getApplicationInfo(paramContext.getPackageName(), 128);
      Bundle localBundle = localApplicationInfo.metaData;
      String str = null;
      if (localBundle != null)
      {
        Object localObject = localApplicationInfo.metaData.get("LOCALYTICS_ROLLUP_KEY");
        boolean bool = localObject instanceof String;
        str = null;
        if (bool) {
          str = (String)localObject;
        }
      }
      return str;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      throw new RuntimeException(localNameNotFoundException);
    }
  }
  
  static String getManufacturer()
  {
    String str = "unknown";
    if (Constants.CURRENT_API_LEVEL > 3) {}
    try
    {
      str = (String)Build.class.getField("MANUFACTURER").get(null);
      return str;
    }
    catch (Exception localException)
    {
      Localytics.Log.w("Caught exception", localException);
    }
    return str;
  }
  
  static String getNetworkType(TelephonyManager paramTelephonyManager, Context paramContext)
  {
    try
    {
      if (paramContext.getPackageManager().checkPermission("android.permission.ACCESS_WIFI_STATE", paramContext.getPackageName()) == 0)
      {
        NetworkInfo localNetworkInfo = ((ConnectivityManager)paramContext.getSystemService("connectivity")).getNetworkInfo(1);
        if ((localNetworkInfo != null) && (localNetworkInfo.isConnectedOrConnecting())) {
          return "wifi";
        }
      }
      else
      {
        Localytics.Log.w("Application does not have one more more of the following permissions: ACCESS_WIFI_STATE. Determining Wi-Fi connectivity is unavailable");
      }
    }
    catch (SecurityException localSecurityException)
    {
      for (;;)
      {
        Localytics.Log.w("Application does not have the permission ACCESS_NETWORK_STATE. Determining Wi-Fi connectivity is unavailable", localSecurityException);
      }
    }
    catch (NullPointerException localNullPointerException)
    {
      for (;;)
      {
        Localytics.Log.w("NullPointerException in getNetworkType()", localNullPointerException);
      }
    }
    return "android_network_type_" + paramTelephonyManager.getNetworkType();
  }
  
  static String getSerialNumberHashOrNull()
  {
    int i = Constants.CURRENT_API_LEVEL;
    String str = null;
    if (i >= 9) {}
    try
    {
      str = (String)Build.class.getField("SERIAL").get(null);
      if (str == null) {
        return null;
      }
    }
    catch (Exception localException)
    {
      throw new RuntimeException(localException);
    }
    return getSha256_buggy(str);
  }
  
  static String getSha256_buggy(String paramString)
  {
    try
    {
      String str = new BigInteger(1, MessageDigest.getInstance("SHA-256").digest(paramString.getBytes("UTF-8"))).toString(16);
      return str;
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      throw new RuntimeException(localNoSuchAlgorithmException);
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new RuntimeException(localUnsupportedEncodingException);
    }
  }
  
  static String getTelephonyDeviceIdOrNull(Context paramContext)
  {
    if ((Constants.CURRENT_API_LEVEL >= 7) && (!((Boolean)ReflectionUtils.tryInvokeInstance(paramContext.getPackageManager(), "hasSystemFeature", STRING_CLASS_ARRAY, HARDWARE_TELEPHONY)).booleanValue()))
    {
      Localytics.Log.i("Device does not have telephony; cannot read telephony id");
      return null;
    }
    if (paramContext.getPackageManager().checkPermission("android.permission.READ_PHONE_STATE", paramContext.getPackageName()) == 0) {
      return ((TelephonyManager)paramContext.getSystemService("phone")).getDeviceId();
    }
    Localytics.Log.w("Application does not have permission READ_PHONE_STATE; determining device id is not possible.  Please consider requesting READ_PHONE_STATE in the AndroidManifest");
    return null;
  }
  
  static boolean isValidResourceId(Context paramContext, int paramInt)
  {
    try
    {
      paramContext.getResources().getResourceName(paramInt);
      return true;
    }
    catch (Resources.NotFoundException localNotFoundException) {}
    return false;
  }
  
  static class AdvertisingInfo
  {
    public String id;
    public boolean limitAdTracking;
    
    public AdvertisingInfo(String paramString, boolean paramBoolean)
    {
      this.id = paramString;
      this.limitAdTracking = paramBoolean;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/DatapointHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */