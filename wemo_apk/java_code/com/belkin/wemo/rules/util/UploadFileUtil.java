package com.belkin.wemo.rules.util;

import android.content.Context;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.net.URL;

public class UploadFileUtil
{
  private static final String TAG = "UploadFile";
  private RuleUtility ruleUtility;
  
  public static InputStream getFile(String paramString)
  {
    try
    {
      File localFile = new File(paramString);
      boolean bool1 = localFile.exists();
      Object localObject2 = null;
      Object localObject3 = null;
      if (bool1)
      {
        boolean bool2 = localFile.canRead();
        localObject2 = null;
        localObject3 = null;
        if (bool2)
        {
          FileInputStream localFileInputStream = new FileInputStream(localFile);
          localObject3 = localFileInputStream;
          localObject2 = localFileInputStream;
        }
      }
      try
      {
        ((InputStream)localObject3).close();
        ((FileInputStream)localObject2).close();
        return (InputStream)localObject3;
      }
      catch (IOException localIOException3)
      {
        localIOException3.printStackTrace();
        return (InputStream)localObject3;
      }
      try
      {
        null.close();
        null.close();
        throw ((Throwable)localObject1);
      }
      catch (IOException localIOException1)
      {
        for (;;)
        {
          localIOException1.printStackTrace();
        }
      }
    }
    catch (Exception localException)
    {
      localException = localException;
      localException.printStackTrace();
      try
      {
        null.close();
        null.close();
        return null;
      }
      catch (IOException localIOException2)
      {
        localIOException2.printStackTrace();
        return null;
      }
    }
    finally {}
  }
  
  /* Error */
  public static byte[] readFile(String paramString)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_1
    //   2: new 22	java/io/File
    //   5: dup
    //   6: aload_0
    //   7: invokespecial 25	java/io/File:<init>	(Ljava/lang/String;)V
    //   10: astore_2
    //   11: aload_2
    //   12: invokevirtual 29	java/io/File:exists	()Z
    //   15: istore 7
    //   17: aconst_null
    //   18: astore 8
    //   20: aconst_null
    //   21: astore_1
    //   22: iload 7
    //   24: ifeq +99 -> 123
    //   27: aload_2
    //   28: invokevirtual 32	java/io/File:canRead	()Z
    //   31: istore 9
    //   33: aconst_null
    //   34: astore 8
    //   36: aconst_null
    //   37: astore_1
    //   38: iload 9
    //   40: ifeq +83 -> 123
    //   43: new 51	java/io/BufferedInputStream
    //   46: dup
    //   47: new 34	java/io/FileInputStream
    //   50: dup
    //   51: aload_2
    //   52: invokespecial 37	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   55: invokespecial 54	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;)V
    //   58: astore 10
    //   60: new 56	org/apache/http/util/ByteArrayBuffer
    //   63: dup
    //   64: bipush 50
    //   66: invokespecial 59	org/apache/http/util/ByteArrayBuffer:<init>	(I)V
    //   69: astore 11
    //   71: aload 10
    //   73: invokevirtual 63	java/io/BufferedInputStream:read	()I
    //   76: istore 12
    //   78: iload 12
    //   80: iconst_m1
    //   81: if_icmpeq +28 -> 109
    //   84: aload 11
    //   86: iload 12
    //   88: i2b
    //   89: invokevirtual 66	org/apache/http/util/ByteArrayBuffer:append	(I)V
    //   92: goto -21 -> 71
    //   95: astore_3
    //   96: aload 10
    //   98: astore_1
    //   99: aload_3
    //   100: invokevirtual 47	java/lang/Exception:printStackTrace	()V
    //   103: aload_1
    //   104: invokevirtual 67	java/io/BufferedInputStream:close	()V
    //   107: aconst_null
    //   108: areturn
    //   109: aload 11
    //   111: invokevirtual 71	org/apache/http/util/ByteArrayBuffer:toByteArray	()[B
    //   114: astore 13
    //   116: aload 13
    //   118: astore 8
    //   120: aload 10
    //   122: astore_1
    //   123: aload_1
    //   124: invokevirtual 67	java/io/BufferedInputStream:close	()V
    //   127: aload 8
    //   129: areturn
    //   130: astore 14
    //   132: aload 14
    //   134: invokevirtual 46	java/io/IOException:printStackTrace	()V
    //   137: aload 8
    //   139: areturn
    //   140: astore 6
    //   142: aload 6
    //   144: invokevirtual 46	java/io/IOException:printStackTrace	()V
    //   147: aconst_null
    //   148: areturn
    //   149: astore 4
    //   151: aload_1
    //   152: invokevirtual 67	java/io/BufferedInputStream:close	()V
    //   155: aload 4
    //   157: athrow
    //   158: astore 5
    //   160: aload 5
    //   162: invokevirtual 46	java/io/IOException:printStackTrace	()V
    //   165: goto -10 -> 155
    //   168: astore 4
    //   170: aload 10
    //   172: astore_1
    //   173: goto -22 -> 151
    //   176: astore_3
    //   177: aconst_null
    //   178: astore_1
    //   179: goto -80 -> 99
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	182	0	paramString	String
    //   1	178	1	localObject1	Object
    //   10	42	2	localFile	File
    //   95	5	3	localException1	Exception
    //   176	1	3	localException2	Exception
    //   149	7	4	localObject2	Object
    //   168	1	4	localObject3	Object
    //   158	3	5	localIOException1	IOException
    //   140	3	6	localIOException2	IOException
    //   15	8	7	bool1	boolean
    //   18	120	8	localObject4	Object
    //   31	8	9	bool2	boolean
    //   58	113	10	localBufferedInputStream	java.io.BufferedInputStream
    //   69	41	11	localByteArrayBuffer	org.apache.http.util.ByteArrayBuffer
    //   76	11	12	i	int
    //   114	3	13	arrayOfByte	byte[]
    //   130	3	14	localIOException3	IOException
    // Exception table:
    //   from	to	target	type
    //   60	71	95	java/lang/Exception
    //   71	78	95	java/lang/Exception
    //   84	92	95	java/lang/Exception
    //   109	116	95	java/lang/Exception
    //   123	127	130	java/io/IOException
    //   103	107	140	java/io/IOException
    //   2	17	149	finally
    //   27	33	149	finally
    //   43	60	149	finally
    //   99	103	149	finally
    //   151	155	158	java/io/IOException
    //   60	71	168	finally
    //   71	78	168	finally
    //   84	92	168	finally
    //   109	116	168	finally
    //   2	17	176	java/lang/Exception
    //   27	33	176	java/lang/Exception
    //   43	60	176	java/lang/Exception
  }
  
  public static void writeDBToDevice(String paramString1, String paramString2)
  {
    SDKLogUtils.infoLog("UploadFile", "writeDBToDevice():: dbPath-->  urlStr--> " + paramString2);
    if (paramString1 != null) {}
    try
    {
      byte[] arrayOfByte = readFile(paramString1);
      if ((arrayOfByte != null) && (arrayOfByte.length > 0)) {
        writeDataToURL(new URL(paramString2), arrayOfByte);
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  /* Error */
  private static void writeDataToURL(URL paramURL, byte[] paramArrayOfByte)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: aload_0
    //   3: invokevirtual 103	java/net/URL:openConnection	()Ljava/net/URLConnection;
    //   6: checkcast 105	java/net/HttpURLConnection
    //   9: astore 7
    //   11: aload 7
    //   13: ldc 107
    //   15: invokevirtual 110	java/net/HttpURLConnection:setRequestMethod	(Ljava/lang/String;)V
    //   18: aload 7
    //   20: iconst_0
    //   21: invokevirtual 113	java/net/HttpURLConnection:setChunkedStreamingMode	(I)V
    //   24: aload 7
    //   26: iconst_1
    //   27: invokevirtual 117	java/net/HttpURLConnection:setDoOutput	(Z)V
    //   30: new 119	java/io/BufferedOutputStream
    //   33: dup
    //   34: aload 7
    //   36: invokevirtual 123	java/net/HttpURLConnection:getOutputStream	()Ljava/io/OutputStream;
    //   39: invokespecial 126	java/io/BufferedOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   42: astore 8
    //   44: aload 8
    //   46: aload_1
    //   47: invokevirtual 130	java/io/BufferedOutputStream:write	([B)V
    //   50: aload 8
    //   52: invokevirtual 133	java/io/BufferedOutputStream:flush	()V
    //   55: new 135	java/io/BufferedReader
    //   58: dup
    //   59: new 137	java/io/InputStreamReader
    //   62: dup
    //   63: aload 7
    //   65: invokevirtual 141	java/net/HttpURLConnection:getInputStream	()Ljava/io/InputStream;
    //   68: invokespecial 142	java/io/InputStreamReader:<init>	(Ljava/io/InputStream;)V
    //   71: invokespecial 145	java/io/BufferedReader:<init>	(Ljava/io/Reader;)V
    //   74: astore 9
    //   76: aload 9
    //   78: invokevirtual 148	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   81: astore 10
    //   83: aload 10
    //   85: ifnull +30 -> 115
    //   88: ldc 8
    //   90: aload 10
    //   92: invokestatic 90	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   95: goto -19 -> 76
    //   98: astore_3
    //   99: aload 8
    //   101: astore_2
    //   102: aload_3
    //   103: invokevirtual 47	java/lang/Exception:printStackTrace	()V
    //   106: aload_2
    //   107: ifnull +7 -> 114
    //   110: aload_2
    //   111: invokevirtual 149	java/io/BufferedOutputStream:close	()V
    //   114: return
    //   115: aload 8
    //   117: ifnull +8 -> 125
    //   120: aload 8
    //   122: invokevirtual 149	java/io/BufferedOutputStream:close	()V
    //   125: return
    //   126: astore 11
    //   128: ldc 8
    //   130: ldc -105
    //   132: invokestatic 90	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   135: aload 11
    //   137: invokevirtual 46	java/io/IOException:printStackTrace	()V
    //   140: return
    //   141: astore 6
    //   143: ldc 8
    //   145: ldc -105
    //   147: invokestatic 90	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   150: aload 6
    //   152: invokevirtual 46	java/io/IOException:printStackTrace	()V
    //   155: return
    //   156: astore 4
    //   158: aload_2
    //   159: ifnull +7 -> 166
    //   162: aload_2
    //   163: invokevirtual 149	java/io/BufferedOutputStream:close	()V
    //   166: aload 4
    //   168: athrow
    //   169: astore 5
    //   171: ldc 8
    //   173: ldc -105
    //   175: invokestatic 90	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   178: aload 5
    //   180: invokevirtual 46	java/io/IOException:printStackTrace	()V
    //   183: goto -17 -> 166
    //   186: astore 4
    //   188: aload 8
    //   190: astore_2
    //   191: goto -33 -> 158
    //   194: astore_3
    //   195: aconst_null
    //   196: astore_2
    //   197: goto -95 -> 102
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	200	0	paramURL	URL
    //   0	200	1	paramArrayOfByte	byte[]
    //   1	196	2	localObject1	Object
    //   98	5	3	localException1	Exception
    //   194	1	3	localException2	Exception
    //   156	11	4	localObject2	Object
    //   186	1	4	localObject3	Object
    //   169	10	5	localIOException1	IOException
    //   141	10	6	localIOException2	IOException
    //   9	55	7	localHttpURLConnection	java.net.HttpURLConnection
    //   42	147	8	localBufferedOutputStream	BufferedOutputStream
    //   74	3	9	localBufferedReader	java.io.BufferedReader
    //   81	10	10	str	String
    //   126	10	11	localIOException3	IOException
    // Exception table:
    //   from	to	target	type
    //   44	76	98	java/lang/Exception
    //   76	83	98	java/lang/Exception
    //   88	95	98	java/lang/Exception
    //   120	125	126	java/io/IOException
    //   110	114	141	java/io/IOException
    //   2	44	156	finally
    //   102	106	156	finally
    //   162	166	169	java/io/IOException
    //   44	76	186	finally
    //   76	83	186	finally
    //   88	95	186	finally
    //   2	44	194	java/lang/Exception
  }
  
  public String writeFile(byte[] paramArrayOfByte, Context paramContext)
  {
    SDKLogUtils.infoLog("UploadFile", "Inside writeFile ");
    Object localObject = "";
    try
    {
      this.ruleUtility = new RuleUtility(paramContext);
      File localFile1 = new File(this.ruleUtility.getTempDBPath());
      if (!localFile1.exists()) {
        localFile1.mkdirs();
      }
      File localFile2 = new File(localFile1, "cloudtemp.db");
      SDKLogUtils.infoLog("UploadFile", "File Path : " + localFile2.getPath());
      SDKLogUtils.infoLog("UploadFile", "File data : " + paramArrayOfByte);
      SDKLogUtils.infoLog("UploadFile", "File data length: " + paramArrayOfByte.length);
      BufferedOutputStream localBufferedOutputStream = new BufferedOutputStream(new FileOutputStream(localFile2));
      localBufferedOutputStream.write(paramArrayOfByte);
      localBufferedOutputStream.flush();
      localBufferedOutputStream.close();
      SDKLogUtils.infoLog("UploadFile", " Success ");
      String str = this.ruleUtility.unzip(this.ruleUtility.getTempDBPath() + "cloudtemp.db", this.ruleUtility.getTempDBPath() + "/unzipped/");
      localObject = str;
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/util/UploadFileUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */