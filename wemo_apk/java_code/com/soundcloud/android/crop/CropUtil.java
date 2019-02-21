package com.soundcloud.android.crop;

import android.app.ProgressDialog;
import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.media.ExifInterface;
import android.net.Uri;
import android.os.Handler;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import java.io.Closeable;
import java.io.File;
import java.io.IOException;

class CropUtil
{
  private static final String SCHEME_CONTENT = "content";
  private static final String SCHEME_FILE = "file";
  
  public static void closeSilently(@Nullable Closeable paramCloseable)
  {
    if (paramCloseable == null) {
      return;
    }
    try
    {
      paramCloseable.close();
      return;
    }
    catch (Throwable localThrowable) {}
  }
  
  public static boolean copyExifRotation(File paramFile1, File paramFile2)
  {
    if ((paramFile1 == null) || (paramFile2 == null)) {
      return false;
    }
    try
    {
      ExifInterface localExifInterface1 = new ExifInterface(paramFile1.getAbsolutePath());
      ExifInterface localExifInterface2 = new ExifInterface(paramFile2.getAbsolutePath());
      localExifInterface2.setAttribute("Orientation", localExifInterface1.getAttribute("Orientation"));
      localExifInterface2.saveAttributes();
      return true;
    }
    catch (IOException localIOException)
    {
      Log.e("Error copying Exif data", localIOException);
    }
    return false;
  }
  
  public static int getExifRotation(File paramFile)
  {
    if (paramFile == null) {
      return 0;
    }
    try
    {
      int i = new ExifInterface(paramFile.getAbsolutePath()).getAttributeInt("Orientation", 0);
      switch (i)
      {
      case 4: 
      case 5: 
      case 7: 
      default: 
        return 0;
      case 3: 
        return 180;
      case 6: 
        return 90;
      }
      return 270;
    }
    catch (IOException localIOException)
    {
      Log.e("Error getting Exif data", localIOException);
    }
    return 0;
  }
  
  @Nullable
  public static File getFromMediaUri(Context paramContext, ContentResolver paramContentResolver, Uri paramUri)
  {
    Object localObject2;
    if (paramUri == null) {
      localObject2 = null;
    }
    for (;;)
    {
      return (File)localObject2;
      if ("file".equals(paramUri.getScheme())) {
        return new File(paramUri.getPath());
      }
      String[] arrayOfString;
      Cursor localCursor;
      if ("content".equals(paramUri.getScheme()))
      {
        arrayOfString = new String[] { "_data", "_display_name" };
        localCursor = null;
      }
      try
      {
        localCursor = paramContentResolver.query(paramUri, arrayOfString, null, null, null);
        if ((localCursor != null) && (localCursor.moveToFirst()))
        {
          if (paramUri.toString().startsWith("content://com.google.android.gallery3d")) {}
          int i;
          for (int j = localCursor.getColumnIndex("_display_name"); j != -1; j = i)
          {
            String str = localCursor.getString(j);
            if (TextUtils.isEmpty(str)) {
              break;
            }
            localObject2 = new File(str);
            return (File)localObject2;
            i = localCursor.getColumnIndex("_data");
          }
        }
        return null;
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        File localFile = getFromMediaUriPfd(paramContext, paramContentResolver, paramUri);
        localObject2 = localFile;
        return (File)localObject2;
      }
      catch (SecurityException localSecurityException)
      {
        for (;;)
        {
          if (localCursor != null) {
            localCursor.close();
          }
        }
      }
      finally
      {
        if (localCursor != null) {
          localCursor.close();
        }
      }
    }
  }
  
  /* Error */
  @Nullable
  private static File getFromMediaUriPfd(Context paramContext, ContentResolver paramContentResolver, Uri paramUri)
  {
    // Byte code:
    //   0: aload_2
    //   1: ifnonnull +5 -> 6
    //   4: aconst_null
    //   5: areturn
    //   6: aconst_null
    //   7: astore_3
    //   8: aconst_null
    //   9: astore 4
    //   11: new 135	java/io/FileInputStream
    //   14: dup
    //   15: aload_1
    //   16: aload_2
    //   17: ldc -119
    //   19: invokevirtual 141	android/content/ContentResolver:openFileDescriptor	(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;
    //   22: invokevirtual 147	android/os/ParcelFileDescriptor:getFileDescriptor	()Ljava/io/FileDescriptor;
    //   25: invokespecial 150	java/io/FileInputStream:<init>	(Ljava/io/FileDescriptor;)V
    //   28: astore 5
    //   30: aload_0
    //   31: invokestatic 154	com/soundcloud/android/crop/CropUtil:getTempFilename	(Landroid/content/Context;)Ljava/lang/String;
    //   34: astore 10
    //   36: new 156	java/io/FileOutputStream
    //   39: dup
    //   40: aload 10
    //   42: invokespecial 157	java/io/FileOutputStream:<init>	(Ljava/lang/String;)V
    //   45: astore 11
    //   47: sipush 4096
    //   50: newarray <illegal type>
    //   52: astore 13
    //   54: aload 5
    //   56: aload 13
    //   58: invokevirtual 161	java/io/FileInputStream:read	([B)I
    //   61: istore 14
    //   63: iload 14
    //   65: iconst_m1
    //   66: if_icmpeq +38 -> 104
    //   69: aload 11
    //   71: aload 13
    //   73: iconst_0
    //   74: iload 14
    //   76: invokevirtual 165	java/io/FileOutputStream:write	([BII)V
    //   79: goto -25 -> 54
    //   82: astore 12
    //   84: aload 11
    //   86: astore 8
    //   88: aload 5
    //   90: astore 7
    //   92: aload 7
    //   94: invokestatic 167	com/soundcloud/android/crop/CropUtil:closeSilently	(Ljava/io/Closeable;)V
    //   97: aload 8
    //   99: invokestatic 167	com/soundcloud/android/crop/CropUtil:closeSilently	(Ljava/io/Closeable;)V
    //   102: aconst_null
    //   103: areturn
    //   104: new 33	java/io/File
    //   107: dup
    //   108: aload 10
    //   110: invokespecial 90	java/io/File:<init>	(Ljava/lang/String;)V
    //   113: astore 15
    //   115: aload 5
    //   117: invokestatic 167	com/soundcloud/android/crop/CropUtil:closeSilently	(Ljava/io/Closeable;)V
    //   120: aload 11
    //   122: invokestatic 167	com/soundcloud/android/crop/CropUtil:closeSilently	(Ljava/io/Closeable;)V
    //   125: aload 15
    //   127: areturn
    //   128: astore 9
    //   130: aload_3
    //   131: invokestatic 167	com/soundcloud/android/crop/CropUtil:closeSilently	(Ljava/io/Closeable;)V
    //   134: aload 4
    //   136: invokestatic 167	com/soundcloud/android/crop/CropUtil:closeSilently	(Ljava/io/Closeable;)V
    //   139: aload 9
    //   141: athrow
    //   142: astore 9
    //   144: aload 5
    //   146: astore_3
    //   147: aconst_null
    //   148: astore 4
    //   150: goto -20 -> 130
    //   153: astore 9
    //   155: aload 11
    //   157: astore 4
    //   159: aload 5
    //   161: astore_3
    //   162: goto -32 -> 130
    //   165: astore 16
    //   167: aconst_null
    //   168: astore 7
    //   170: aconst_null
    //   171: astore 8
    //   173: goto -81 -> 92
    //   176: astore 6
    //   178: aload 5
    //   180: astore 7
    //   182: aconst_null
    //   183: astore 8
    //   185: goto -93 -> 92
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	188	0	paramContext	Context
    //   0	188	1	paramContentResolver	ContentResolver
    //   0	188	2	paramUri	Uri
    //   7	155	3	localObject1	Object
    //   9	149	4	localObject2	Object
    //   28	151	5	localFileInputStream1	java.io.FileInputStream
    //   176	1	6	localIOException1	IOException
    //   90	91	7	localFileInputStream2	java.io.FileInputStream
    //   86	98	8	localFileOutputStream1	java.io.FileOutputStream
    //   128	12	9	localObject3	Object
    //   142	1	9	localObject4	Object
    //   153	1	9	localObject5	Object
    //   34	75	10	str	String
    //   45	111	11	localFileOutputStream2	java.io.FileOutputStream
    //   82	1	12	localIOException2	IOException
    //   52	20	13	arrayOfByte	byte[]
    //   61	14	14	i	int
    //   113	13	15	localFile	File
    //   165	1	16	localIOException3	IOException
    // Exception table:
    //   from	to	target	type
    //   47	54	82	java/io/IOException
    //   54	63	82	java/io/IOException
    //   69	79	82	java/io/IOException
    //   104	115	82	java/io/IOException
    //   11	30	128	finally
    //   30	47	142	finally
    //   47	54	153	finally
    //   54	63	153	finally
    //   69	79	153	finally
    //   104	115	153	finally
    //   11	30	165	java/io/IOException
    //   30	47	176	java/io/IOException
  }
  
  private static String getTempFilename(Context paramContext)
    throws IOException
  {
    return File.createTempFile("image", "tmp", paramContext.getCacheDir()).getAbsolutePath();
  }
  
  public static void startBackgroundJob(MonitoredActivity paramMonitoredActivity, String paramString1, String paramString2, Runnable paramRunnable, Handler paramHandler)
  {
    new Thread(new BackgroundJob(paramMonitoredActivity, paramRunnable, ProgressDialog.show(paramMonitoredActivity, paramString1, paramString2, true, false), paramHandler)).start();
  }
  
  private static class BackgroundJob
    extends MonitoredActivity.LifeCycleAdapter
    implements Runnable
  {
    private final MonitoredActivity activity;
    private final Runnable cleanupRunner = new Runnable()
    {
      public void run()
      {
        CropUtil.BackgroundJob.this.activity.removeLifeCycleListener(CropUtil.BackgroundJob.this);
        if (CropUtil.BackgroundJob.this.dialog.getWindow() != null) {
          CropUtil.BackgroundJob.this.dialog.dismiss();
        }
      }
    };
    private final ProgressDialog dialog;
    private final Handler handler;
    private final Runnable job;
    
    public BackgroundJob(MonitoredActivity paramMonitoredActivity, Runnable paramRunnable, ProgressDialog paramProgressDialog, Handler paramHandler)
    {
      this.activity = paramMonitoredActivity;
      this.dialog = paramProgressDialog;
      this.job = paramRunnable;
      this.activity.addLifeCycleListener(this);
      this.handler = paramHandler;
    }
    
    public void onActivityDestroyed(MonitoredActivity paramMonitoredActivity)
    {
      this.cleanupRunner.run();
      this.handler.removeCallbacks(this.cleanupRunner);
    }
    
    public void onActivityStarted(MonitoredActivity paramMonitoredActivity)
    {
      this.dialog.show();
    }
    
    public void onActivityStopped(MonitoredActivity paramMonitoredActivity)
    {
      this.dialog.hide();
    }
    
    public void run()
    {
      try
      {
        this.job.run();
        return;
      }
      finally
      {
        this.handler.post(this.cleanupRunner);
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/soundcloud/android/crop/CropUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */