package android.support.v4.content;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Environment;
import android.os.Process;
import android.support.annotation.NonNull;
import java.io.File;

public class ContextCompat
{
  private static final String DIR_ANDROID = "Android";
  private static final String DIR_CACHE = "cache";
  private static final String DIR_DATA = "data";
  private static final String DIR_FILES = "files";
  private static final String DIR_OBB = "obb";
  private static final String TAG = "ContextCompat";
  
  private static File buildPath(File paramFile, String... paramVarArgs)
  {
    int i = paramVarArgs.length;
    int j = 0;
    Object localObject1 = paramFile;
    String str;
    Object localObject2;
    if (j < i)
    {
      str = paramVarArgs[j];
      if (localObject1 == null) {
        localObject2 = new File(str);
      }
    }
    for (;;)
    {
      j++;
      localObject1 = localObject2;
      break;
      if (str != null)
      {
        localObject2 = new File((File)localObject1, str);
        continue;
        return (File)localObject1;
      }
      else
      {
        localObject2 = localObject1;
      }
    }
  }
  
  public static int checkSelfPermission(@NonNull Context paramContext, @NonNull String paramString)
  {
    if (paramString == null) {
      throw new IllegalArgumentException("permission is null");
    }
    return paramContext.checkPermission(paramString, Process.myPid(), Process.myUid());
  }
  
  /* Error */
  private static File createFilesDir(File paramFile)
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: aload_0
    //   4: invokevirtual 66	java/io/File:exists	()Z
    //   7: ifne +19 -> 26
    //   10: aload_0
    //   11: invokevirtual 69	java/io/File:mkdirs	()Z
    //   14: ifne +12 -> 26
    //   17: aload_0
    //   18: invokevirtual 66	java/io/File:exists	()Z
    //   21: istore_2
    //   22: iload_2
    //   23: ifeq +8 -> 31
    //   26: ldc 2
    //   28: monitorexit
    //   29: aload_0
    //   30: areturn
    //   31: ldc 23
    //   33: new 71	java/lang/StringBuilder
    //   36: dup
    //   37: invokespecial 72	java/lang/StringBuilder:<init>	()V
    //   40: ldc 74
    //   42: invokevirtual 78	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   45: aload_0
    //   46: invokevirtual 82	java/io/File:getPath	()Ljava/lang/String;
    //   49: invokevirtual 78	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   52: invokevirtual 85	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   55: invokestatic 91	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;)I
    //   58: pop
    //   59: aconst_null
    //   60: astore_0
    //   61: goto -35 -> 26
    //   64: astore_1
    //   65: ldc 2
    //   67: monitorexit
    //   68: aload_1
    //   69: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	70	0	paramFile	File
    //   64	5	1	localObject	Object
    //   21	2	2	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   3	22	64	finally
    //   31	59	64	finally
  }
  
  public static File getCodeCacheDir(Context paramContext)
  {
    if (Build.VERSION.SDK_INT >= 21) {
      return ContextCompatApi21.getCodeCacheDir(paramContext);
    }
    return createFilesDir(new File(paramContext.getApplicationInfo().dataDir, "code_cache"));
  }
  
  public static final int getColor(Context paramContext, int paramInt)
  {
    if (Build.VERSION.SDK_INT >= 23) {
      return ContextCompatApi23.getColor(paramContext, paramInt);
    }
    return paramContext.getResources().getColor(paramInt);
  }
  
  public static final ColorStateList getColorStateList(Context paramContext, int paramInt)
  {
    if (Build.VERSION.SDK_INT >= 23) {
      return ContextCompatApi23.getColorStateList(paramContext, paramInt);
    }
    return paramContext.getResources().getColorStateList(paramInt);
  }
  
  public static final Drawable getDrawable(Context paramContext, int paramInt)
  {
    if (Build.VERSION.SDK_INT >= 21) {
      return ContextCompatApi21.getDrawable(paramContext, paramInt);
    }
    return paramContext.getResources().getDrawable(paramInt);
  }
  
  public static File[] getExternalCacheDirs(Context paramContext)
  {
    int i = Build.VERSION.SDK_INT;
    if (i >= 19) {
      return ContextCompatKitKat.getExternalCacheDirs(paramContext);
    }
    if (i >= 8) {}
    File localFile1;
    String[] arrayOfString;
    for (File localFile2 = ContextCompatFroyo.getExternalCacheDir(paramContext);; localFile2 = buildPath(localFile1, arrayOfString))
    {
      return new File[] { localFile2 };
      localFile1 = Environment.getExternalStorageDirectory();
      arrayOfString = new String[4];
      arrayOfString[0] = "Android";
      arrayOfString[1] = "data";
      arrayOfString[2] = paramContext.getPackageName();
      arrayOfString[3] = "cache";
    }
  }
  
  public static File[] getExternalFilesDirs(Context paramContext, String paramString)
  {
    int i = Build.VERSION.SDK_INT;
    if (i >= 19) {
      return ContextCompatKitKat.getExternalFilesDirs(paramContext, paramString);
    }
    if (i >= 8) {}
    File localFile1;
    String[] arrayOfString;
    for (File localFile2 = ContextCompatFroyo.getExternalFilesDir(paramContext, paramString);; localFile2 = buildPath(localFile1, arrayOfString))
    {
      return new File[] { localFile2 };
      localFile1 = Environment.getExternalStorageDirectory();
      arrayOfString = new String[5];
      arrayOfString[0] = "Android";
      arrayOfString[1] = "data";
      arrayOfString[2] = paramContext.getPackageName();
      arrayOfString[3] = "files";
      arrayOfString[4] = paramString;
    }
  }
  
  public static File[] getObbDirs(Context paramContext)
  {
    int i = Build.VERSION.SDK_INT;
    if (i >= 19) {
      return ContextCompatKitKat.getObbDirs(paramContext);
    }
    if (i >= 11) {}
    File localFile1;
    String[] arrayOfString;
    for (File localFile2 = ContextCompatHoneycomb.getObbDir(paramContext);; localFile2 = buildPath(localFile1, arrayOfString))
    {
      return new File[] { localFile2 };
      localFile1 = Environment.getExternalStorageDirectory();
      arrayOfString = new String[3];
      arrayOfString[0] = "Android";
      arrayOfString[1] = "obb";
      arrayOfString[2] = paramContext.getPackageName();
    }
  }
  
  public static boolean startActivities(Context paramContext, Intent[] paramArrayOfIntent)
  {
    return startActivities(paramContext, paramArrayOfIntent, null);
  }
  
  public static boolean startActivities(Context paramContext, Intent[] paramArrayOfIntent, Bundle paramBundle)
  {
    int i = Build.VERSION.SDK_INT;
    if (i >= 16)
    {
      ContextCompatJellybean.startActivities(paramContext, paramArrayOfIntent, paramBundle);
      return true;
    }
    if (i >= 11)
    {
      ContextCompatHoneycomb.startActivities(paramContext, paramArrayOfIntent);
      return true;
    }
    return false;
  }
  
  public final File getNoBackupFilesDir(Context paramContext)
  {
    if (Build.VERSION.SDK_INT >= 21) {
      return ContextCompatApi21.getNoBackupFilesDir(paramContext);
    }
    return createFilesDir(new File(paramContext.getApplicationInfo().dataDir, "no_backup"));
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/android/support/v4/content/ContextCompat.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */