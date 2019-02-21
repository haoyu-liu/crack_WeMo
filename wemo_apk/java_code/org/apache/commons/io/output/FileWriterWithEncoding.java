package org.apache.commons.io.output;

import java.io.File;
import java.io.IOException;
import java.io.Writer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;

public class FileWriterWithEncoding
  extends Writer
{
  private final Writer out;
  
  public FileWriterWithEncoding(File paramFile, String paramString)
    throws IOException
  {
    this(paramFile, paramString, false);
  }
  
  public FileWriterWithEncoding(File paramFile, String paramString, boolean paramBoolean)
    throws IOException
  {
    this.out = initWriter(paramFile, paramString, paramBoolean);
  }
  
  public FileWriterWithEncoding(File paramFile, Charset paramCharset)
    throws IOException
  {
    this(paramFile, paramCharset, false);
  }
  
  public FileWriterWithEncoding(File paramFile, Charset paramCharset, boolean paramBoolean)
    throws IOException
  {
    this.out = initWriter(paramFile, paramCharset, paramBoolean);
  }
  
  public FileWriterWithEncoding(File paramFile, CharsetEncoder paramCharsetEncoder)
    throws IOException
  {
    this(paramFile, paramCharsetEncoder, false);
  }
  
  public FileWriterWithEncoding(File paramFile, CharsetEncoder paramCharsetEncoder, boolean paramBoolean)
    throws IOException
  {
    this.out = initWriter(paramFile, paramCharsetEncoder, paramBoolean);
  }
  
  public FileWriterWithEncoding(String paramString1, String paramString2)
    throws IOException
  {
    this(new File(paramString1), paramString2, false);
  }
  
  public FileWriterWithEncoding(String paramString1, String paramString2, boolean paramBoolean)
    throws IOException
  {
    this(new File(paramString1), paramString2, paramBoolean);
  }
  
  public FileWriterWithEncoding(String paramString, Charset paramCharset)
    throws IOException
  {
    this(new File(paramString), paramCharset, false);
  }
  
  public FileWriterWithEncoding(String paramString, Charset paramCharset, boolean paramBoolean)
    throws IOException
  {
    this(new File(paramString), paramCharset, paramBoolean);
  }
  
  public FileWriterWithEncoding(String paramString, CharsetEncoder paramCharsetEncoder)
    throws IOException
  {
    this(new File(paramString), paramCharsetEncoder, false);
  }
  
  public FileWriterWithEncoding(String paramString, CharsetEncoder paramCharsetEncoder, boolean paramBoolean)
    throws IOException
  {
    this(new File(paramString), paramCharsetEncoder, paramBoolean);
  }
  
  /* Error */
  private static Writer initWriter(File paramFile, Object paramObject, boolean paramBoolean)
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: ifnonnull +13 -> 14
    //   4: new 45	java/lang/NullPointerException
    //   7: dup
    //   8: ldc 47
    //   10: invokespecial 48	java/lang/NullPointerException:<init>	(Ljava/lang/String;)V
    //   13: athrow
    //   14: aload_1
    //   15: ifnonnull +13 -> 28
    //   18: new 45	java/lang/NullPointerException
    //   21: dup
    //   22: ldc 50
    //   24: invokespecial 48	java/lang/NullPointerException:<init>	(Ljava/lang/String;)V
    //   27: athrow
    //   28: aload_0
    //   29: invokevirtual 54	java/io/File:exists	()Z
    //   32: istore_3
    //   33: aconst_null
    //   34: astore 4
    //   36: new 56	java/io/FileOutputStream
    //   39: dup
    //   40: aload_0
    //   41: iload_2
    //   42: invokespecial 59	java/io/FileOutputStream:<init>	(Ljava/io/File;Z)V
    //   45: astore 5
    //   47: aload_1
    //   48: instanceof 61
    //   51: ifeq +17 -> 68
    //   54: new 63	java/io/OutputStreamWriter
    //   57: dup
    //   58: aload 5
    //   60: aload_1
    //   61: checkcast 61	java/nio/charset/Charset
    //   64: invokespecial 66	java/io/OutputStreamWriter:<init>	(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V
    //   67: areturn
    //   68: aload_1
    //   69: instanceof 68
    //   72: ifeq +17 -> 89
    //   75: new 63	java/io/OutputStreamWriter
    //   78: dup
    //   79: aload 5
    //   81: aload_1
    //   82: checkcast 68	java/nio/charset/CharsetEncoder
    //   85: invokespecial 71	java/io/OutputStreamWriter:<init>	(Ljava/io/OutputStream;Ljava/nio/charset/CharsetEncoder;)V
    //   88: areturn
    //   89: new 63	java/io/OutputStreamWriter
    //   92: dup
    //   93: aload 5
    //   95: aload_1
    //   96: checkcast 73	java/lang/String
    //   99: invokespecial 76	java/io/OutputStreamWriter:<init>	(Ljava/io/OutputStream;Ljava/lang/String;)V
    //   102: astore 10
    //   104: aload 10
    //   106: areturn
    //   107: astore 6
    //   109: aconst_null
    //   110: invokestatic 82	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/Writer;)V
    //   113: aload 4
    //   115: invokestatic 85	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/OutputStream;)V
    //   118: iload_3
    //   119: ifne +8 -> 127
    //   122: aload_0
    //   123: invokestatic 91	org/apache/commons/io/FileUtils:deleteQuietly	(Ljava/io/File;)Z
    //   126: pop
    //   127: aload 6
    //   129: athrow
    //   130: astore 8
    //   132: aconst_null
    //   133: invokestatic 82	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/Writer;)V
    //   136: aload 4
    //   138: invokestatic 85	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/OutputStream;)V
    //   141: iload_3
    //   142: ifne +8 -> 150
    //   145: aload_0
    //   146: invokestatic 91	org/apache/commons/io/FileUtils:deleteQuietly	(Ljava/io/File;)Z
    //   149: pop
    //   150: aload 8
    //   152: athrow
    //   153: astore 8
    //   155: aload 5
    //   157: astore 4
    //   159: goto -27 -> 132
    //   162: astore 6
    //   164: aload 5
    //   166: astore 4
    //   168: goto -59 -> 109
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	171	0	paramFile	File
    //   0	171	1	paramObject	Object
    //   0	171	2	paramBoolean	boolean
    //   32	110	3	bool	boolean
    //   34	133	4	localObject	Object
    //   45	120	5	localFileOutputStream	java.io.FileOutputStream
    //   107	21	6	localIOException1	IOException
    //   162	1	6	localIOException2	IOException
    //   130	21	8	localRuntimeException1	RuntimeException
    //   153	1	8	localRuntimeException2	RuntimeException
    //   102	3	10	localOutputStreamWriter	java.io.OutputStreamWriter
    // Exception table:
    //   from	to	target	type
    //   36	47	107	java/io/IOException
    //   36	47	130	java/lang/RuntimeException
    //   47	68	153	java/lang/RuntimeException
    //   68	89	153	java/lang/RuntimeException
    //   89	104	153	java/lang/RuntimeException
    //   47	68	162	java/io/IOException
    //   68	89	162	java/io/IOException
    //   89	104	162	java/io/IOException
  }
  
  public void close()
    throws IOException
  {
    this.out.close();
  }
  
  public void flush()
    throws IOException
  {
    this.out.flush();
  }
  
  public void write(int paramInt)
    throws IOException
  {
    this.out.write(paramInt);
  }
  
  public void write(String paramString)
    throws IOException
  {
    this.out.write(paramString);
  }
  
  public void write(String paramString, int paramInt1, int paramInt2)
    throws IOException
  {
    this.out.write(paramString, paramInt1, paramInt2);
  }
  
  public void write(char[] paramArrayOfChar)
    throws IOException
  {
    this.out.write(paramArrayOfChar);
  }
  
  public void write(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException
  {
    this.out.write(paramArrayOfChar, paramInt1, paramInt2);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/output/FileWriterWithEncoding.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */