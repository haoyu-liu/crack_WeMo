package org.apache.commons.io.output;

import java.io.File;
import java.io.IOException;
import java.io.Writer;
import java.nio.charset.Charset;
import org.apache.commons.io.Charsets;
import org.apache.commons.io.FileUtils;

public class LockableFileWriter
  extends Writer
{
  private static final String LCK = ".lck";
  private final File lockFile;
  private final Writer out;
  
  public LockableFileWriter(File paramFile)
    throws IOException
  {
    this(paramFile, false, null);
  }
  
  public LockableFileWriter(File paramFile, String paramString)
    throws IOException
  {
    this(paramFile, paramString, false, null);
  }
  
  public LockableFileWriter(File paramFile, String paramString1, boolean paramBoolean, String paramString2)
    throws IOException
  {
    this(paramFile, Charsets.toCharset(paramString1), paramBoolean, paramString2);
  }
  
  public LockableFileWriter(File paramFile, Charset paramCharset)
    throws IOException
  {
    this(paramFile, paramCharset, false, null);
  }
  
  public LockableFileWriter(File paramFile, Charset paramCharset, boolean paramBoolean, String paramString)
    throws IOException
  {
    File localFile1 = paramFile.getAbsoluteFile();
    if (localFile1.getParentFile() != null) {
      FileUtils.forceMkdir(localFile1.getParentFile());
    }
    if (localFile1.isDirectory()) {
      throw new IOException("File specified is a directory");
    }
    if (paramString == null) {
      paramString = System.getProperty("java.io.tmpdir");
    }
    File localFile2 = new File(paramString);
    FileUtils.forceMkdir(localFile2);
    testLockDir(localFile2);
    this.lockFile = new File(localFile2, localFile1.getName() + ".lck");
    createLock();
    this.out = initWriter(localFile1, paramCharset, paramBoolean);
  }
  
  public LockableFileWriter(File paramFile, boolean paramBoolean)
    throws IOException
  {
    this(paramFile, paramBoolean, null);
  }
  
  public LockableFileWriter(File paramFile, boolean paramBoolean, String paramString)
    throws IOException
  {
    this(paramFile, Charset.defaultCharset(), paramBoolean, paramString);
  }
  
  public LockableFileWriter(String paramString)
    throws IOException
  {
    this(paramString, false, null);
  }
  
  public LockableFileWriter(String paramString, boolean paramBoolean)
    throws IOException
  {
    this(paramString, paramBoolean, null);
  }
  
  public LockableFileWriter(String paramString1, boolean paramBoolean, String paramString2)
    throws IOException
  {
    this(new File(paramString1), paramBoolean, paramString2);
  }
  
  private void createLock()
    throws IOException
  {
    try
    {
      if (!this.lockFile.createNewFile()) {
        throw new IOException("Can't write file, lock " + this.lockFile.getAbsolutePath() + " exists");
      }
    }
    finally {}
    this.lockFile.deleteOnExit();
  }
  
  /* Error */
  private Writer initWriter(File paramFile, Charset paramCharset, boolean paramBoolean)
    throws IOException
  {
    // Byte code:
    //   0: aload_1
    //   1: invokevirtual 127	java/io/File:exists	()Z
    //   4: istore 4
    //   6: aconst_null
    //   7: astore 5
    //   9: new 129	java/io/FileOutputStream
    //   12: dup
    //   13: aload_1
    //   14: invokevirtual 117	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   17: iload_3
    //   18: invokespecial 131	java/io/FileOutputStream:<init>	(Ljava/lang/String;Z)V
    //   21: astore 6
    //   23: new 133	java/io/OutputStreamWriter
    //   26: dup
    //   27: aload 6
    //   29: aload_2
    //   30: invokestatic 136	org/apache/commons/io/Charsets:toCharset	(Ljava/nio/charset/Charset;)Ljava/nio/charset/Charset;
    //   33: invokespecial 139	java/io/OutputStreamWriter:<init>	(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V
    //   36: astore 7
    //   38: aload 7
    //   40: areturn
    //   41: astore 8
    //   43: aconst_null
    //   44: invokestatic 145	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/Writer;)V
    //   47: aload 5
    //   49: invokestatic 148	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/OutputStream;)V
    //   52: aload_0
    //   53: getfield 89	org/apache/commons/io/output/LockableFileWriter:lockFile	Ljava/io/File;
    //   56: invokestatic 152	org/apache/commons/io/FileUtils:deleteQuietly	(Ljava/io/File;)Z
    //   59: pop
    //   60: iload 4
    //   62: ifne +8 -> 70
    //   65: aload_1
    //   66: invokestatic 152	org/apache/commons/io/FileUtils:deleteQuietly	(Ljava/io/File;)Z
    //   69: pop
    //   70: aload 8
    //   72: athrow
    //   73: astore 11
    //   75: aconst_null
    //   76: invokestatic 145	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/Writer;)V
    //   79: aload 5
    //   81: invokestatic 148	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/OutputStream;)V
    //   84: aload_0
    //   85: getfield 89	org/apache/commons/io/output/LockableFileWriter:lockFile	Ljava/io/File;
    //   88: invokestatic 152	org/apache/commons/io/FileUtils:deleteQuietly	(Ljava/io/File;)Z
    //   91: pop
    //   92: iload 4
    //   94: ifne +8 -> 102
    //   97: aload_1
    //   98: invokestatic 152	org/apache/commons/io/FileUtils:deleteQuietly	(Ljava/io/File;)Z
    //   101: pop
    //   102: aload 11
    //   104: athrow
    //   105: astore 11
    //   107: aload 6
    //   109: astore 5
    //   111: goto -36 -> 75
    //   114: astore 8
    //   116: aload 6
    //   118: astore 5
    //   120: goto -77 -> 43
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	123	0	this	LockableFileWriter
    //   0	123	1	paramFile	File
    //   0	123	2	paramCharset	Charset
    //   0	123	3	paramBoolean	boolean
    //   4	89	4	bool	boolean
    //   7	112	5	localObject	Object
    //   21	96	6	localFileOutputStream	java.io.FileOutputStream
    //   36	3	7	localOutputStreamWriter	java.io.OutputStreamWriter
    //   41	30	8	localIOException1	IOException
    //   114	1	8	localIOException2	IOException
    //   73	30	11	localRuntimeException1	RuntimeException
    //   105	1	11	localRuntimeException2	RuntimeException
    // Exception table:
    //   from	to	target	type
    //   9	23	41	java/io/IOException
    //   9	23	73	java/lang/RuntimeException
    //   23	38	105	java/lang/RuntimeException
    //   23	38	114	java/io/IOException
  }
  
  private void testLockDir(File paramFile)
    throws IOException
  {
    if (!paramFile.exists()) {
      throw new IOException("Could not find lockDir: " + paramFile.getAbsolutePath());
    }
    if (!paramFile.canWrite()) {
      throw new IOException("Could not write to lockDir: " + paramFile.getAbsolutePath());
    }
  }
  
  public void close()
    throws IOException
  {
    try
    {
      this.out.close();
      return;
    }
    finally
    {
      this.lockFile.delete();
    }
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


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/output/LockableFileWriter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */