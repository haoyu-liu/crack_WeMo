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
import java.util.zip.ZipOutputStream;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.ZipParameters;

public class ZipUtility
{
  private static int BUFFER = 1024;
  private static final String TAG = ZipUtility.class.getSimpleName();
  
  public static void unzip(String paramString1, String paramString2)
    throws IOException
  {
    BufferedInputStream localBufferedInputStream = null;
    FileOutputStream localFileOutputStream = null;
    BufferedOutputStream localBufferedOutputStream = null;
    java.util.zip.ZipFile localZipFile = new java.util.zip.ZipFile(paramString1);
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
    ZipOutputStream localZipOutputStream = new ZipOutputStream(new BufferedOutputStream(localFileOutputStream));
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
    localZipOutputStream.close();
    localFileOutputStream.close();
  }
  
  public static void zip(String[] paramArrayOfString, String paramString)
    throws ZipException
  {
    SDKLogUtils.infoLog(TAG, "inside zip");
    SDKLogUtils.infoLog(TAG, " zipLocation : " + paramString);
    boolean bool = new File(paramString).delete();
    SDKLogUtils.infoLog(TAG, " Deleting Preview/old file at " + paramString + "; STATUS = " + bool);
    net.lingala.zip4j.core.ZipFile localZipFile = new net.lingala.zip4j.core.ZipFile(paramString);
    ZipParameters localZipParameters = new ZipParameters();
    localZipParameters.setCompressionMethod(8);
    localZipParameters.setCompressionLevel(5);
    localZipFile.addFile(new File(paramArrayOfString[0]), localZipParameters);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/utils/ZipUtility.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */