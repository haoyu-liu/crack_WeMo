package com.belkin.utils;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.util.Log;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.net.URL;
import java.net.URLConnection;
import org.apache.http.util.ByteArrayBuffer;

public class UploadFileUtil
{
  private static final String TAG = "UploadFile";
  private RuleUtility ruleUtility;
  
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
    LogUtils.infoLog("UploadFile", "readFile: file path is " + paramString);
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
      LogUtils.errorLog("UploadFile", "Exception during readFile(): " + localException.getMessage());
      return null;
    }
    return localByteArrayBuffer.toByteArray();
    label137:
    LogUtils.errorLog("UploadFile", "readFile(): File at " + paramString + " either does not exist or is not readable");
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
  
  public static void uploadFileToDevice(String paramString, byte[] paramArrayOfByte, int paramInt)
  {
    if (paramString != null) {}
    try
    {
      writeDataToURL(new URL(paramString), paramArrayOfByte, paramInt);
      return;
    }
    catch (Exception localException)
    {
      Log.e("4490", "Exception in uploadFileToDevice ");
      localException.printStackTrace();
    }
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
  
  /* Error */
  private static void writeDataToURL(URL paramURL, byte[] paramArrayOfByte, int paramInt)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_3
    //   2: aload_0
    //   3: invokevirtual 125	java/net/URL:openConnection	()Ljava/net/URLConnection;
    //   6: checkcast 162	java/net/HttpURLConnection
    //   9: astore 10
    //   11: aload 10
    //   13: ldc -92
    //   15: invokevirtual 167	java/net/HttpURLConnection:setRequestMethod	(Ljava/lang/String;)V
    //   18: aload 10
    //   20: iconst_0
    //   21: invokevirtual 170	java/net/HttpURLConnection:setChunkedStreamingMode	(I)V
    //   24: aload 10
    //   26: iconst_1
    //   27: invokevirtual 174	java/net/HttpURLConnection:setDoOutput	(Z)V
    //   30: aload 10
    //   32: iload_2
    //   33: invokevirtual 177	java/net/HttpURLConnection:setReadTimeout	(I)V
    //   36: new 179	java/io/BufferedOutputStream
    //   39: dup
    //   40: aload 10
    //   42: invokevirtual 183	java/net/HttpURLConnection:getOutputStream	()Ljava/io/OutputStream;
    //   45: invokespecial 186	java/io/BufferedOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   48: astore 11
    //   50: aload 11
    //   52: aload_1
    //   53: invokevirtual 190	java/io/BufferedOutputStream:write	([B)V
    //   56: aload 11
    //   58: invokevirtual 193	java/io/BufferedOutputStream:flush	()V
    //   61: new 195	java/io/BufferedReader
    //   64: dup
    //   65: new 197	java/io/InputStreamReader
    //   68: dup
    //   69: aload 10
    //   71: invokevirtual 198	java/net/HttpURLConnection:getInputStream	()Ljava/io/InputStream;
    //   74: invokespecial 199	java/io/InputStreamReader:<init>	(Ljava/io/InputStream;)V
    //   77: invokespecial 202	java/io/BufferedReader:<init>	(Ljava/io/Reader;)V
    //   80: astore 12
    //   82: ldc -52
    //   84: astore 13
    //   86: aload 12
    //   88: invokevirtual 207	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   91: astore 14
    //   93: aload 14
    //   95: ifnull +33 -> 128
    //   98: new 53	java/lang/StringBuilder
    //   101: dup
    //   102: invokespecial 54	java/lang/StringBuilder:<init>	()V
    //   105: aload 13
    //   107: invokevirtual 60	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   110: aload 14
    //   112: invokevirtual 60	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   115: ldc -47
    //   117: invokevirtual 60	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   120: invokevirtual 64	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   123: astore 13
    //   125: goto -39 -> 86
    //   128: ldc 8
    //   130: new 53	java/lang/StringBuilder
    //   133: dup
    //   134: invokespecial 54	java/lang/StringBuilder:<init>	()V
    //   137: ldc -45
    //   139: invokevirtual 60	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   142: aload 13
    //   144: invokevirtual 60	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   147: invokevirtual 64	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   150: invokestatic 69	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   153: aload 11
    //   155: ifnull +8 -> 163
    //   158: aload 11
    //   160: invokevirtual 212	java/io/BufferedOutputStream:close	()V
    //   163: return
    //   164: astore 15
    //   166: ldc 8
    //   168: ldc -42
    //   170: invokestatic 147	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;)I
    //   173: pop
    //   174: aload 15
    //   176: invokevirtual 215	java/io/IOException:printStackTrace	()V
    //   179: return
    //   180: astore 7
    //   182: aload 7
    //   184: invokevirtual 50	java/lang/Exception:printStackTrace	()V
    //   187: aload_3
    //   188: ifnull -25 -> 163
    //   191: aload_3
    //   192: invokevirtual 212	java/io/BufferedOutputStream:close	()V
    //   195: return
    //   196: astore 8
    //   198: ldc 8
    //   200: ldc -42
    //   202: invokestatic 147	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;)I
    //   205: pop
    //   206: aload 8
    //   208: invokevirtual 215	java/io/IOException:printStackTrace	()V
    //   211: return
    //   212: astore 4
    //   214: aload_3
    //   215: ifnull +7 -> 222
    //   218: aload_3
    //   219: invokevirtual 212	java/io/BufferedOutputStream:close	()V
    //   222: aload 4
    //   224: athrow
    //   225: astore 5
    //   227: ldc 8
    //   229: ldc -42
    //   231: invokestatic 147	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;)I
    //   234: pop
    //   235: aload 5
    //   237: invokevirtual 215	java/io/IOException:printStackTrace	()V
    //   240: goto -18 -> 222
    //   243: astore 4
    //   245: aload 11
    //   247: astore_3
    //   248: goto -34 -> 214
    //   251: astore 7
    //   253: aload 11
    //   255: astore_3
    //   256: goto -74 -> 182
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	259	0	paramURL	URL
    //   0	259	1	paramArrayOfByte	byte[]
    //   0	259	2	paramInt	int
    //   1	255	3	localObject1	Object
    //   212	11	4	localObject2	Object
    //   243	1	4	localObject3	Object
    //   225	11	5	localIOException1	java.io.IOException
    //   180	3	7	localException1	Exception
    //   251	1	7	localException2	Exception
    //   196	11	8	localIOException2	java.io.IOException
    //   9	61	10	localHttpURLConnection	java.net.HttpURLConnection
    //   48	206	11	localBufferedOutputStream	BufferedOutputStream
    //   80	7	12	localBufferedReader	java.io.BufferedReader
    //   84	59	13	str1	String
    //   91	20	14	str2	String
    //   164	11	15	localIOException3	java.io.IOException
    // Exception table:
    //   from	to	target	type
    //   158	163	164	java/io/IOException
    //   2	50	180	java/lang/Exception
    //   191	195	196	java/io/IOException
    //   2	50	212	finally
    //   182	187	212	finally
    //   218	222	225	java/io/IOException
    //   50	82	243	finally
    //   86	93	243	finally
    //   98	125	243	finally
    //   128	153	243	finally
    //   50	82	251	java/lang/Exception
    //   86	93	251	java/lang/Exception
    //   98	125	251	java/lang/Exception
    //   128	153	251	java/lang/Exception
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
  
  public String writeFile(byte[] paramArrayOfByte, Context paramContext)
  {
    Log.v("MoreUtil", "Inside writeFile ");
    Object localObject = "";
    try
    {
      this.ruleUtility = new RuleUtility(paramContext);
      StringBuilder localStringBuilder1 = new StringBuilder();
      File localFile1 = new File(RuleUtility.getStoragePath() + "/databases/");
      if (!localFile1.exists()) {
        localFile1.mkdirs();
      }
      File localFile2 = new File(localFile1, "cloudtemp.db");
      Log.v("MoreUtil", "File Path : " + localFile2.getPath());
      Log.v("MoreUtil", "File data : " + paramArrayOfByte);
      Log.v("MoreUtil", "File data length: " + paramArrayOfByte.length);
      BufferedOutputStream localBufferedOutputStream = new BufferedOutputStream(new FileOutputStream(localFile2));
      localBufferedOutputStream.write(paramArrayOfByte);
      localBufferedOutputStream.flush();
      localBufferedOutputStream.close();
      Log.v("MoreUtil", " Success ");
      RuleUtility localRuleUtility = this.ruleUtility;
      StringBuilder localStringBuilder2 = new StringBuilder();
      String str1 = RuleUtility.getStoragePath() + "/databases/cloudtemp.db";
      StringBuilder localStringBuilder3 = new StringBuilder();
      String str2 = localRuleUtility.unzip(str1, RuleUtility.getLocalDBPath() + RuleUtility.getLocalDBName());
      localObject = str2;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
    System.out.println(" pragma version = " + (String)localObject);
    return (String)localObject;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/utils/UploadFileUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */