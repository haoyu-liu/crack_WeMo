package net.lingala.zip4j.util;

import net.lingala.zip4j.exception.ZipException;

public class CRCUtil
{
  private static final int BUF_SIZE = 16384;
  
  public static long computeFileCRC(String paramString)
    throws ZipException
  {
    return computeFileCRC(paramString, null);
  }
  
  /* Error */
  public static long computeFileCRC(String paramString, net.lingala.zip4j.progress.ProgressMonitor paramProgressMonitor)
    throws ZipException
  {
    // Byte code:
    //   0: aload_0
    //   1: invokestatic 28	net/lingala/zip4j/util/Zip4jUtil:isStringNotNullAndNotEmpty	(Ljava/lang/String;)Z
    //   4: ifne +13 -> 17
    //   7: new 15	net/lingala/zip4j/exception/ZipException
    //   10: dup
    //   11: ldc 30
    //   13: invokespecial 33	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   16: athrow
    //   17: aconst_null
    //   18: astore_2
    //   19: aload_0
    //   20: invokestatic 36	net/lingala/zip4j/util/Zip4jUtil:checkFileReadAccess	(Ljava/lang/String;)Z
    //   23: pop
    //   24: new 38	java/io/FileInputStream
    //   27: dup
    //   28: new 40	java/io/File
    //   31: dup
    //   32: aload_0
    //   33: invokespecial 41	java/io/File:<init>	(Ljava/lang/String;)V
    //   36: invokespecial 44	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   39: astore 8
    //   41: sipush 16384
    //   44: newarray <illegal type>
    //   46: astore 9
    //   48: new 46	java/util/zip/CRC32
    //   51: dup
    //   52: invokespecial 47	java/util/zip/CRC32:<init>	()V
    //   55: astore 10
    //   57: aload 8
    //   59: aload 9
    //   61: invokevirtual 53	java/io/InputStream:read	([B)I
    //   64: istore 11
    //   66: iload 11
    //   68: iconst_m1
    //   69: if_icmpne +23 -> 92
    //   72: aload 10
    //   74: invokevirtual 57	java/util/zip/CRC32:getValue	()J
    //   77: lstore 12
    //   79: aload 8
    //   81: ifnull +8 -> 89
    //   84: aload 8
    //   86: invokevirtual 60	java/io/InputStream:close	()V
    //   89: lload 12
    //   91: lreturn
    //   92: aload 10
    //   94: aload 9
    //   96: iconst_0
    //   97: iload 11
    //   99: invokevirtual 64	java/util/zip/CRC32:update	([BII)V
    //   102: aload_1
    //   103: ifnull -46 -> 57
    //   106: aload_1
    //   107: iload 11
    //   109: i2l
    //   110: invokevirtual 70	net/lingala/zip4j/progress/ProgressMonitor:updateWorkCompleted	(J)V
    //   113: aload_1
    //   114: invokevirtual 74	net/lingala/zip4j/progress/ProgressMonitor:isCancelAllTasks	()Z
    //   117: ifeq -60 -> 57
    //   120: aload_1
    //   121: iconst_3
    //   122: invokevirtual 78	net/lingala/zip4j/progress/ProgressMonitor:setResult	(I)V
    //   125: aload_1
    //   126: iconst_0
    //   127: invokevirtual 81	net/lingala/zip4j/progress/ProgressMonitor:setState	(I)V
    //   130: aload 8
    //   132: ifnull +8 -> 140
    //   135: aload 8
    //   137: invokevirtual 60	java/io/InputStream:close	()V
    //   140: lconst_0
    //   141: lreturn
    //   142: astore 15
    //   144: new 15	net/lingala/zip4j/exception/ZipException
    //   147: dup
    //   148: ldc 83
    //   150: invokespecial 33	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   153: athrow
    //   154: astore 14
    //   156: new 15	net/lingala/zip4j/exception/ZipException
    //   159: dup
    //   160: ldc 83
    //   162: invokespecial 33	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   165: athrow
    //   166: astore 6
    //   168: new 15	net/lingala/zip4j/exception/ZipException
    //   171: dup
    //   172: aload 6
    //   174: invokespecial 86	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/Throwable;)V
    //   177: athrow
    //   178: astore 4
    //   180: aload_2
    //   181: ifnull +7 -> 188
    //   184: aload_2
    //   185: invokevirtual 60	java/io/InputStream:close	()V
    //   188: aload 4
    //   190: athrow
    //   191: astore_3
    //   192: new 15	net/lingala/zip4j/exception/ZipException
    //   195: dup
    //   196: aload_3
    //   197: invokespecial 86	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/Throwable;)V
    //   200: athrow
    //   201: astore 5
    //   203: new 15	net/lingala/zip4j/exception/ZipException
    //   206: dup
    //   207: ldc 83
    //   209: invokespecial 33	net/lingala/zip4j/exception/ZipException:<init>	(Ljava/lang/String;)V
    //   212: athrow
    //   213: astore 4
    //   215: aload 8
    //   217: astore_2
    //   218: goto -38 -> 180
    //   221: astore_3
    //   222: aload 8
    //   224: astore_2
    //   225: goto -33 -> 192
    //   228: astore 6
    //   230: aload 8
    //   232: astore_2
    //   233: goto -65 -> 168
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	236	0	paramString	String
    //   0	236	1	paramProgressMonitor	net.lingala.zip4j.progress.ProgressMonitor
    //   18	215	2	localObject1	Object
    //   191	6	3	localException1	Exception
    //   221	1	3	localException2	Exception
    //   178	11	4	localObject2	Object
    //   213	1	4	localObject3	Object
    //   201	1	5	localIOException1	java.io.IOException
    //   166	7	6	localIOException2	java.io.IOException
    //   228	1	6	localIOException3	java.io.IOException
    //   39	192	8	localFileInputStream	java.io.FileInputStream
    //   46	49	9	arrayOfByte	byte[]
    //   55	38	10	localCRC32	java.util.zip.CRC32
    //   64	44	11	i	int
    //   77	13	12	l	long
    //   154	1	14	localIOException4	java.io.IOException
    //   142	1	15	localIOException5	java.io.IOException
    // Exception table:
    //   from	to	target	type
    //   135	140	142	java/io/IOException
    //   84	89	154	java/io/IOException
    //   19	41	166	java/io/IOException
    //   19	41	178	finally
    //   168	178	178	finally
    //   192	201	178	finally
    //   19	41	191	java/lang/Exception
    //   184	188	201	java/io/IOException
    //   41	57	213	finally
    //   57	66	213	finally
    //   72	79	213	finally
    //   92	102	213	finally
    //   106	130	213	finally
    //   41	57	221	java/lang/Exception
    //   57	66	221	java/lang/Exception
    //   72	79	221	java/lang/Exception
    //   92	102	221	java/lang/Exception
    //   106	130	221	java/lang/Exception
    //   41	57	228	java/io/IOException
    //   57	66	228	java/io/IOException
    //   72	79	228	java/io/IOException
    //   92	102	228	java/io/IOException
    //   106	130	228	java/io/IOException
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/util/CRCUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */