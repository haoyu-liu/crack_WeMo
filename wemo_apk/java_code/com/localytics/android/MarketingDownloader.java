package com.localytics.android;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.Proxy;
import java.net.URL;
import java.net.URLConnection;
import java.util.TreeMap;

final class MarketingDownloader
  extends BaseUploadThread
{
  private static final String MARKETING_URL_HTTP = "http://%s/api/v2/applications/%s/amp";
  private static final String MARKETING_URL_HTTPS = "https://%s/api/v2/applications/%s/amp";
  
  MarketingDownloader(BaseHandler paramBaseHandler, TreeMap<Integer, Object> paramTreeMap, String paramString, LocalyticsDao paramLocalyticsDao)
  {
    super(paramBaseHandler, paramTreeMap, paramString, paramLocalyticsDao);
  }
  
  @Nullable
  static String downloadFile(@NonNull String paramString1, @NonNull String paramString2, boolean paramBoolean, @Nullable Proxy paramProxy)
  {
    String str = paramString2;
    File localFile1 = new File(paramString2);
    if ((localFile1.exists()) && (!paramBoolean))
    {
      Object[] arrayOfObject2 = new Object[1];
      arrayOfObject2[0] = localFile1.getAbsolutePath();
      Localytics.Log.w(String.format("The file %s does exist and overwrite is turned off.", arrayOfObject2));
      return paramString2;
    }
    File localFile2 = localFile1.getParentFile();
    if ((!localFile2.mkdirs()) && (!localFile2.isDirectory()))
    {
      Object[] arrayOfObject1 = new Object[1];
      arrayOfObject1[0] = localFile2.getAbsolutePath();
      Localytics.Log.w(String.format("Could not create the directory %s for saving file.", arrayOfObject1));
      return null;
    }
    File localFile3;
    do
    {
      try
      {
        localFile3 = new File(String.format("%s_temp", new Object[] { paramString2 }));
        localFile3.createNewFile();
        BufferedInputStream localBufferedInputStream = new BufferedInputStream(BaseUploadThread.createURLConnection(new URL(paramString1), paramProxy).getInputStream(), 16384);
        FileOutputStream localFileOutputStream = new FileOutputStream(localFile3.getPath());
        byte[] arrayOfByte = new byte[' '];
        for (;;)
        {
          int i = localBufferedInputStream.read(arrayOfByte);
          if (i == -1) {
            break;
          }
          localFileOutputStream.write(arrayOfByte, 0, i);
        }
        localFileOutputStream.close();
      }
      catch (IOException localIOException)
      {
        Localytics.Log.w("In-app campaign not found. Creating a new one.");
        str = null;
        return str;
      }
    } while (localFile3.renameTo(localFile1));
    localFile3.delete();
    return null;
  }
  
  static String getLocalFileURL(long paramLong, boolean paramBoolean, Context paramContext, String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(getMarketingDataDirectory(paramContext, paramString));
    localStringBuilder.append(File.separator);
    if (paramBoolean)
    {
      Object[] arrayOfObject3 = new Object[1];
      arrayOfObject3[0] = Long.valueOf(paramLong);
      localStringBuilder.append(String.format("amp_rule_%d.zip", arrayOfObject3));
    }
    for (;;)
    {
      return localStringBuilder.toString();
      Object[] arrayOfObject1 = new Object[1];
      arrayOfObject1[0] = Long.valueOf(paramLong);
      localStringBuilder.append(String.format("marketing_rule_%d", arrayOfObject1));
      File localFile = new File(localStringBuilder.toString());
      if (((!localFile.exists()) || (!localFile.isDirectory())) && (!localFile.mkdirs()))
      {
        Object[] arrayOfObject2 = new Object[1];
        arrayOfObject2[0] = localFile.getAbsolutePath();
        Localytics.Log.w(String.format("Could not create the directory %s for saving the HTML file.", arrayOfObject2));
        return null;
      }
      localStringBuilder.append(File.separator);
      localStringBuilder.append("index.html");
    }
  }
  
  static String getMarketingDataDirectory(Context paramContext, String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(paramContext.getFilesDir().getAbsolutePath());
    localStringBuilder.append(File.separator);
    localStringBuilder.append(".localytics");
    localStringBuilder.append(File.separator);
    localStringBuilder.append(paramString);
    return localStringBuilder.toString();
  }
  
  static String getRemoteFileURL(MarketingMessage paramMarketingMessage)
  {
    String str1 = JsonHelper.getSafeStringFromMap(paramMarketingMessage, "phone_location");
    String str2 = JsonHelper.getSafeStringFromMap(paramMarketingMessage, "devices");
    if (str2 != null)
    {
      if (!str2.equals("tablet")) {
        break label36;
      }
      str1 = JsonHelper.getSafeStringFromMap(paramMarketingMessage, "tablet_location");
    }
    label36:
    while (!str2.equals("both")) {
      return str1;
    }
    return JsonHelper.getSafeStringFromMap(paramMarketingMessage, "phone_location");
  }
  
  int uploadData()
  {
    String str1 = getApiKey();
    BaseUploadThread.UploadType localUploadType = BaseUploadThread.UploadType.MARKETING;
    if (Constants.USE_HTTPS) {}
    for (String str2 = "https://%s/api/v2/applications/%s/amp";; str2 = "http://%s/api/v2/applications/%s/amp")
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = Constants.MARKETING_HOST;
      arrayOfObject[1] = str1;
      upload(localUploadType, String.format(str2, arrayOfObject), "", 0);
      return 1;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/localytics/android/MarketingDownloader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */