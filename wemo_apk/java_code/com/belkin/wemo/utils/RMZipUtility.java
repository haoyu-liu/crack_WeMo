package com.belkin.wemo.utils;

import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.zip.GZIPOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

public class RMZipUtility
{
  private static int BUFFER = 1024;
  private static final String TAG = RMZipUtility.class.getSimpleName();
  
  public static void unzip(String paramString1, String paramString2)
    throws IOException
  {
    SDKLogUtils.debugLog(TAG, "Extracting file. \nFROM: " + paramString1 + "\nTO: " + paramString2);
    BufferedInputStream localBufferedInputStream = null;
    FileOutputStream localFileOutputStream = null;
    BufferedOutputStream localBufferedOutputStream = null;
    ZipFile localZipFile = new ZipFile(paramString1);
    Enumeration localEnumeration = localZipFile.entries();
    while (localEnumeration.hasMoreElements())
    {
      localBufferedInputStream = new BufferedInputStream(localZipFile.getInputStream((ZipEntry)localEnumeration.nextElement()));
      byte[] arrayOfByte = new byte[BUFFER];
      localFileOutputStream = new FileOutputStream(paramString2);
      localBufferedOutputStream = new BufferedOutputStream(localFileOutputStream, BUFFER);
      for (;;)
      {
        int i = localBufferedInputStream.read(arrayOfByte, 0, BUFFER);
        if (i == -1) {
          break;
        }
        localBufferedOutputStream.write(arrayOfByte, 0, i);
      }
      localBufferedOutputStream.flush();
    }
    localZipFile.close();
    localBufferedOutputStream.close();
    localFileOutputStream.close();
    localBufferedInputStream.close();
  }
  
  public static void zip(String paramString1, String paramString2)
    throws IOException
  {
    FileOutputStream localFileOutputStream = new FileOutputStream(paramString2);
    GZIPOutputStream localGZIPOutputStream = new GZIPOutputStream(new FileOutputStream(paramString2));
    byte[] arrayOfByte = new byte[BUFFER];
    FileInputStream localFileInputStream = new FileInputStream(paramString1);
    for (;;)
    {
      int i = localFileInputStream.read(arrayOfByte, 0, BUFFER);
      if (i == -1) {
        break;
      }
      localGZIPOutputStream.write(arrayOfByte, 0, i);
    }
    localFileInputStream.close();
    localGZIPOutputStream.close();
    localFileOutputStream.close();
  }
  
  public static void zip(String[] paramArrayOfString, String paramString)
    throws IOException
  {
    boolean bool = new File(paramString).delete();
    SDKLogUtils.infoLog(TAG, " Deleting Preview/old file at " + paramString + "; STATUS = " + bool);
    ZipOutputStream localZipOutputStream = new ZipOutputStream(new FileOutputStream(paramString));
    String str = new File(paramArrayOfString[0]).getName();
    ZipEntry localZipEntry = new ZipEntry("temppluginRules.db");
    SDKLogUtils.infoLog(TAG, " File name in zip entry: " + str);
    localZipOutputStream.putNextEntry(localZipEntry);
    FileInputStream localFileInputStream = new FileInputStream(paramArrayOfString[0]);
    byte[] arrayOfByte = new byte['Ѐ'];
    for (;;)
    {
      int i = localFileInputStream.read(arrayOfByte);
      if (i <= 0) {
        break;
      }
      localZipOutputStream.write(arrayOfByte, 0, i);
    }
    localFileInputStream.close();
    localZipOutputStream.closeEntry();
    localZipOutputStream.close();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/utils/RMZipUtility.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */