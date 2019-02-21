package com.belkin.wemo.cache.utils;

import android.content.ContentResolver;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import org.apache.http.util.ByteArrayBuffer;

public class UploadFileUtil
{
  private static final String TAG = "UploadFile";
  
  private static int calculateInSampleSize(BitmapFactory.Options paramOptions, int paramInt1, int paramInt2)
  {
    int i = paramOptions.outHeight;
    int j = paramOptions.outWidth;
    int k = 1;
    if ((i > paramInt2) || (j > paramInt1))
    {
      int m = i / 2;
      int n = j / 2;
      while ((m / k > paramInt2) && (n / k > paramInt1)) {
        k *= 2;
      }
    }
    return k;
  }
  
  public static byte[] getByteArray(Bitmap paramBitmap)
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    if (paramBitmap != null)
    {
      paramBitmap.compress(Bitmap.CompressFormat.PNG, 0, localByteArrayOutputStream);
      return localByteArrayOutputStream.toByteArray();
    }
    return null;
  }
  
  public static void readDBFromDevice(String paramString1, String paramString2)
  {
    if (paramString1 != null) {}
    try
    {
      byte[] arrayOfByte = readFromURL(paramString2);
      if ((arrayOfByte != null) && (arrayOfByte.length > 0)) {
        writeFile(paramString1, arrayOfByte);
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public static byte[] readFile(String paramString)
  {
    SDKLogUtils.infoLog("UploadFile", "readFile: file path is " + paramString);
    ByteArrayBuffer localByteArrayBuffer;
    try
    {
      File localFile = new File(paramString);
      if ((!localFile.exists()) || (!localFile.canRead())) {
        break label137;
      }
      BufferedInputStream localBufferedInputStream = new BufferedInputStream(new FileInputStream(localFile));
      localByteArrayBuffer = new ByteArrayBuffer(50);
      for (;;)
      {
        int i = localBufferedInputStream.read();
        if (i == -1) {
          break;
        }
        localByteArrayBuffer.append((byte)i);
      }
      localBufferedInputStream.close();
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("UploadFile", "Exception during readFile(): " + localException.getMessage());
      return null;
    }
    return localByteArrayBuffer.toByteArray();
    label137:
    SDKLogUtils.errorLog("UploadFile", "readFile(): File at " + paramString + " either does not exist or is not readable");
    return null;
  }
  
  public static byte[] readFromURL(String paramString)
  {
    ByteArrayBuffer localByteArrayBuffer;
    if (paramString != null) {
      try
      {
        BufferedInputStream localBufferedInputStream = new BufferedInputStream(new URL(paramString).openConnection().getInputStream());
        localByteArrayBuffer = new ByteArrayBuffer(50);
        for (;;)
        {
          int i = localBufferedInputStream.read();
          if (i == -1) {
            break;
          }
          localByteArrayBuffer.append((byte)i);
        }
        return null;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
      }
    }
    byte[] arrayOfByte = localByteArrayBuffer.toByteArray();
    return arrayOfByte;
  }
  
  public static boolean uploadFileToDevice(String paramString, byte[] paramArrayOfByte, int paramInt)
  {
    if ((!TextUtils.isEmpty(paramString)) && (paramArrayOfByte != null) && (paramArrayOfByte.length > 0))
    {
      SDKLogUtils.debugLog("UploadFile", "uploadFileToDevice: File Size: " + paramArrayOfByte.length);
      try
      {
        boolean bool = writeDataToURL(new URL(paramString), paramArrayOfByte, paramInt);
        return bool;
      }
      catch (MalformedURLException localMalformedURLException)
      {
        SDKLogUtils.errorLog("UploadFile", "MalformedURLException in uploadFileToDevice: ", localMalformedURLException);
        return false;
      }
    }
    SDKLogUtils.errorLog("UploadFile", "uploadFileToDevice: URL string is NULL or empty.");
    return false;
  }
  
  public static Bitmap uriToBitmap(Context paramContext, Uri paramUri, int paramInt)
  {
    Bitmap localBitmap = null;
    if (paramContext != null)
    {
      localBitmap = null;
      if (paramUri == null) {}
    }
    try
    {
      InputStream localInputStream1 = paramContext.getContentResolver().openInputStream(paramUri);
      BitmapFactory.Options localOptions = new BitmapFactory.Options();
      localOptions.inJustDecodeBounds = true;
      BitmapFactory.decodeStream(localInputStream1, null, localOptions);
      localInputStream1.close();
      InputStream localInputStream2 = paramContext.getContentResolver().openInputStream(paramUri);
      localOptions.inJustDecodeBounds = false;
      localOptions.inSampleSize = calculateInSampleSize(localOptions, paramInt, paramInt);
      localBitmap = BitmapFactory.decodeStream(localInputStream2, null, localOptions);
      localInputStream2.close();
      return localBitmap;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      SDKLogUtils.errorLog("UploadFile", "FileNotFoundException in uriToBitmap", localFileNotFoundException);
      return localBitmap;
    }
    catch (IOException localIOException)
    {
      SDKLogUtils.errorLog("UploadFile", "IOException in uriToBitmap", localIOException);
    }
    return localBitmap;
  }
  
  public static void writeDBToDevice(String paramString1, String paramString2)
  {
    Log.i("UploadFile", "writeDBToDevice():: dbPath-->  urlStr--> " + paramString2);
    if (paramString1 != null) {}
    try
    {
      byte[] arrayOfByte = readFile(paramString1);
      if ((arrayOfByte != null) && (arrayOfByte.length > 0)) {
        uploadFileToDevice(paramString2, arrayOfByte, 60000);
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  private static boolean writeDataToURL(URL paramURL, byte[] paramArrayOfByte, int paramInt)
  {
    try
    {
      HttpURLConnection localHttpURLConnection = (HttpURLConnection)paramURL.openConnection();
      localHttpURLConnection.setRequestMethod("POST");
      localHttpURLConnection.setChunkedStreamingMode(0);
      localHttpURLConnection.setDoOutput(true);
      localHttpURLConnection.setReadTimeout(paramInt);
      BufferedOutputStream localBufferedOutputStream = new BufferedOutputStream(localHttpURLConnection.getOutputStream());
      localBufferedOutputStream.write(paramArrayOfByte);
      localBufferedOutputStream.flush();
      BufferedReader localBufferedReader = new BufferedReader(new InputStreamReader(localHttpURLConnection.getInputStream()));
      String str2;
      for (String str1 = "";; str1 = str1 + str2 + "\n")
      {
        str2 = localBufferedReader.readLine();
        if (str2 == null) {
          break;
        }
      }
      localBufferedOutputStream.close();
      SDKLogUtils.debugLog("UploadFile", "writeDataToURL: decoded string = " + str1);
      return true;
    }
    catch (IOException localIOException)
    {
      SDKLogUtils.errorLog("UploadFile", "writeDataToURL: IOException while writing to URL: ", localIOException);
    }
    return false;
  }
  
  public static void writeFile(String paramString, byte[] paramArrayOfByte)
  {
    try
    {
      File localFile = new File(paramString);
      if ((localFile.canWrite()) && (paramArrayOfByte != null))
      {
        BufferedOutputStream localBufferedOutputStream = new BufferedOutputStream(new FileOutputStream(localFile));
        localBufferedOutputStream.write(paramArrayOfByte);
        localBufferedOutputStream.flush();
        localBufferedOutputStream.close();
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public String getDBPath(Context paramContext, String paramString)
  {
    return paramContext.getDatabasePath(paramString).getAbsolutePath();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/utils/UploadFileUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */