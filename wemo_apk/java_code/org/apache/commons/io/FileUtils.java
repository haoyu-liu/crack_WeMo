package org.apache.commons.io;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.math.BigInteger;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.channels.FileChannel;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.zip.CRC32;
import java.util.zip.CheckedInputStream;
import java.util.zip.Checksum;
import org.apache.commons.io.filefilter.DirectoryFileFilter;
import org.apache.commons.io.filefilter.FalseFileFilter;
import org.apache.commons.io.filefilter.FileFilterUtils;
import org.apache.commons.io.filefilter.IOFileFilter;
import org.apache.commons.io.filefilter.SuffixFileFilter;
import org.apache.commons.io.filefilter.TrueFileFilter;
import org.apache.commons.io.output.NullOutputStream;

public class FileUtils
{
  public static final File[] EMPTY_FILE_ARRAY = new File[0];
  private static final long FILE_COPY_BUFFER_SIZE = 31457280L;
  public static final long ONE_EB = 1152921504606846976L;
  public static final BigInteger ONE_EB_BI;
  public static final long ONE_GB = 1073741824L;
  public static final BigInteger ONE_GB_BI;
  public static final long ONE_KB = 1024L;
  public static final BigInteger ONE_KB_BI = BigInteger.valueOf(1024L);
  public static final long ONE_MB = 1048576L;
  public static final BigInteger ONE_MB_BI = ONE_KB_BI.multiply(ONE_KB_BI);
  public static final long ONE_PB = 1125899906842624L;
  public static final BigInteger ONE_PB_BI;
  public static final long ONE_TB = 1099511627776L;
  public static final BigInteger ONE_TB_BI;
  public static final BigInteger ONE_YB;
  public static final BigInteger ONE_ZB;
  private static final Charset UTF8 = Charset.forName("UTF-8");
  
  static
  {
    ONE_GB_BI = ONE_KB_BI.multiply(ONE_MB_BI);
    ONE_TB_BI = ONE_KB_BI.multiply(ONE_GB_BI);
    ONE_PB_BI = ONE_KB_BI.multiply(ONE_TB_BI);
    ONE_EB_BI = ONE_KB_BI.multiply(ONE_PB_BI);
    ONE_ZB = BigInteger.valueOf(1024L).multiply(BigInteger.valueOf(1152921504606846976L));
    ONE_YB = ONE_KB_BI.multiply(ONE_ZB);
  }
  
  public static String byteCountToDisplaySize(long paramLong)
  {
    return byteCountToDisplaySize(BigInteger.valueOf(paramLong));
  }
  
  public static String byteCountToDisplaySize(BigInteger paramBigInteger)
  {
    if (paramBigInteger.divide(ONE_EB_BI).compareTo(BigInteger.ZERO) > 0) {
      return String.valueOf(paramBigInteger.divide(ONE_EB_BI)) + " EB";
    }
    if (paramBigInteger.divide(ONE_PB_BI).compareTo(BigInteger.ZERO) > 0) {
      return String.valueOf(paramBigInteger.divide(ONE_PB_BI)) + " PB";
    }
    if (paramBigInteger.divide(ONE_TB_BI).compareTo(BigInteger.ZERO) > 0) {
      return String.valueOf(paramBigInteger.divide(ONE_TB_BI)) + " TB";
    }
    if (paramBigInteger.divide(ONE_GB_BI).compareTo(BigInteger.ZERO) > 0) {
      return String.valueOf(paramBigInteger.divide(ONE_GB_BI)) + " GB";
    }
    if (paramBigInteger.divide(ONE_MB_BI).compareTo(BigInteger.ZERO) > 0) {
      return String.valueOf(paramBigInteger.divide(ONE_MB_BI)) + " MB";
    }
    if (paramBigInteger.divide(ONE_KB_BI).compareTo(BigInteger.ZERO) > 0) {
      return String.valueOf(paramBigInteger.divide(ONE_KB_BI)) + " KB";
    }
    return String.valueOf(paramBigInteger) + " bytes";
  }
  
  private static void checkDirectory(File paramFile)
  {
    if (!paramFile.exists()) {
      throw new IllegalArgumentException(paramFile + " does not exist");
    }
    if (!paramFile.isDirectory()) {
      throw new IllegalArgumentException(paramFile + " is not a directory");
    }
  }
  
  public static Checksum checksum(File paramFile, Checksum paramChecksum)
    throws IOException
  {
    if (paramFile.isDirectory()) {
      throw new IllegalArgumentException("Checksums can't be computed on directories");
    }
    localObject1 = null;
    try
    {
      localCheckedInputStream = new CheckedInputStream(new FileInputStream(paramFile), paramChecksum);
      IOUtils.closeQuietly((InputStream)localObject1);
    }
    finally
    {
      try
      {
        IOUtils.copy(localCheckedInputStream, new NullOutputStream());
        IOUtils.closeQuietly(localCheckedInputStream);
        return paramChecksum;
      }
      finally
      {
        CheckedInputStream localCheckedInputStream;
        localObject1 = localCheckedInputStream;
      }
      localObject2 = finally;
    }
    throw ((Throwable)localObject2);
  }
  
  public static long checksumCRC32(File paramFile)
    throws IOException
  {
    CRC32 localCRC32 = new CRC32();
    checksum(paramFile, localCRC32);
    return localCRC32.getValue();
  }
  
  public static void cleanDirectory(File paramFile)
    throws IOException
  {
    if (!paramFile.exists()) {
      throw new IllegalArgumentException(paramFile + " does not exist");
    }
    if (!paramFile.isDirectory()) {
      throw new IllegalArgumentException(paramFile + " is not a directory");
    }
    File[] arrayOfFile = paramFile.listFiles();
    if (arrayOfFile == null) {
      throw new IOException("Failed to list contents of " + paramFile);
    }
    Object localObject = null;
    int i = arrayOfFile.length;
    int j = 0;
    for (;;)
    {
      if (j < i)
      {
        File localFile = arrayOfFile[j];
        try
        {
          forceDelete(localFile);
          j++;
        }
        catch (IOException localIOException)
        {
          for (;;)
          {
            localObject = localIOException;
          }
        }
      }
    }
    if (localObject != null) {
      throw ((Throwable)localObject);
    }
  }
  
  private static void cleanDirectoryOnExit(File paramFile)
    throws IOException
  {
    if (!paramFile.exists()) {
      throw new IllegalArgumentException(paramFile + " does not exist");
    }
    if (!paramFile.isDirectory()) {
      throw new IllegalArgumentException(paramFile + " is not a directory");
    }
    File[] arrayOfFile = paramFile.listFiles();
    if (arrayOfFile == null) {
      throw new IOException("Failed to list contents of " + paramFile);
    }
    Object localObject = null;
    int i = arrayOfFile.length;
    int j = 0;
    for (;;)
    {
      if (j < i)
      {
        File localFile = arrayOfFile[j];
        try
        {
          forceDeleteOnExit(localFile);
          j++;
        }
        catch (IOException localIOException)
        {
          for (;;)
          {
            localObject = localIOException;
          }
        }
      }
    }
    if (localObject != null) {
      throw ((Throwable)localObject);
    }
  }
  
  /* Error */
  public static boolean contentEquals(File paramFile1, File paramFile2)
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 135	java/io/File:exists	()Z
    //   4: istore_2
    //   5: iload_2
    //   6: aload_1
    //   7: invokevirtual 135	java/io/File:exists	()Z
    //   10: if_icmpeq +5 -> 15
    //   13: iconst_0
    //   14: ireturn
    //   15: iload_2
    //   16: ifne +5 -> 21
    //   19: iconst_1
    //   20: ireturn
    //   21: aload_0
    //   22: invokevirtual 148	java/io/File:isDirectory	()Z
    //   25: ifne +10 -> 35
    //   28: aload_1
    //   29: invokevirtual 148	java/io/File:isDirectory	()Z
    //   32: ifeq +13 -> 45
    //   35: new 154	java/io/IOException
    //   38: dup
    //   39: ldc -48
    //   41: invokespecial 197	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   44: athrow
    //   45: aload_0
    //   46: invokevirtual 211	java/io/File:length	()J
    //   49: aload_1
    //   50: invokevirtual 211	java/io/File:length	()J
    //   53: lcmp
    //   54: ifne -41 -> 13
    //   57: aload_0
    //   58: invokevirtual 215	java/io/File:getCanonicalFile	()Ljava/io/File;
    //   61: aload_1
    //   62: invokevirtual 215	java/io/File:getCanonicalFile	()Ljava/io/File;
    //   65: invokevirtual 219	java/io/File:equals	(Ljava/lang/Object;)Z
    //   68: ifeq +5 -> 73
    //   71: iconst_1
    //   72: ireturn
    //   73: aconst_null
    //   74: astore_3
    //   75: aconst_null
    //   76: astore 4
    //   78: new 160	java/io/FileInputStream
    //   81: dup
    //   82: aload_0
    //   83: invokespecial 162	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   86: astore 5
    //   88: new 160	java/io/FileInputStream
    //   91: dup
    //   92: aload_1
    //   93: invokespecial 162	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   96: astore 6
    //   98: aload 5
    //   100: aload 6
    //   102: invokestatic 222	org/apache/commons/io/IOUtils:contentEquals	(Ljava/io/InputStream;Ljava/io/InputStream;)Z
    //   105: istore 8
    //   107: aload 5
    //   109: invokestatic 178	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/InputStream;)V
    //   112: aload 6
    //   114: invokestatic 178	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/InputStream;)V
    //   117: iload 8
    //   119: ireturn
    //   120: astore 7
    //   122: aload_3
    //   123: invokestatic 178	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/InputStream;)V
    //   126: aload 4
    //   128: invokestatic 178	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/InputStream;)V
    //   131: aload 7
    //   133: athrow
    //   134: astore 7
    //   136: aload 5
    //   138: astore_3
    //   139: aconst_null
    //   140: astore 4
    //   142: goto -20 -> 122
    //   145: astore 7
    //   147: aload 6
    //   149: astore 4
    //   151: aload 5
    //   153: astore_3
    //   154: goto -32 -> 122
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	157	0	paramFile1	File
    //   0	157	1	paramFile2	File
    //   4	12	2	bool1	boolean
    //   74	80	3	localObject1	Object
    //   76	74	4	localObject2	Object
    //   86	66	5	localFileInputStream1	FileInputStream
    //   96	52	6	localFileInputStream2	FileInputStream
    //   120	12	7	localObject3	Object
    //   134	1	7	localObject4	Object
    //   145	1	7	localObject5	Object
    //   105	13	8	bool2	boolean
    // Exception table:
    //   from	to	target	type
    //   78	88	120	finally
    //   88	98	134	finally
    //   98	107	145	finally
  }
  
  public static boolean contentEqualsIgnoreEOL(File paramFile1, File paramFile2, String paramString)
    throws IOException
  {
    boolean bool1 = true;
    boolean bool2 = paramFile1.exists();
    if (bool2 != paramFile2.exists()) {
      bool1 = false;
    }
    do
    {
      do
      {
        return bool1;
      } while (!bool2);
      if ((paramFile1.isDirectory()) || (paramFile2.isDirectory())) {
        throw new IOException("Can't compare directories, only files");
      }
    } while (paramFile1.getCanonicalFile().equals(paramFile2.getCanonicalFile()));
    localObject1 = null;
    localObject2 = null;
    if (paramString == null) {}
    for (;;)
    {
      InputStreamReader localInputStreamReader3;
      boolean bool3;
      try
      {
        localInputStreamReader1 = new InputStreamReader(new FileInputStream(paramFile1));
      }
      finally {}
      try
      {
        localInputStreamReader3 = new InputStreamReader(new FileInputStream(paramFile2));
        localObject2 = localInputStreamReader3;
        localObject1 = localInputStreamReader1;
        bool3 = IOUtils.contentEqualsIgnoreEOL((Reader)localObject1, (Reader)localObject2);
        IOUtils.closeQuietly((Reader)localObject1);
        IOUtils.closeQuietly((Reader)localObject2);
        return bool3;
      }
      finally
      {
        for (;;)
        {
          localObject1 = localInputStreamReader1;
          localObject2 = null;
        }
      }
      localInputStreamReader1 = new InputStreamReader(new FileInputStream(paramFile1), paramString);
      InputStreamReader localInputStreamReader2 = new InputStreamReader(new FileInputStream(paramFile2), paramString);
      localObject2 = localInputStreamReader2;
      localObject1 = localInputStreamReader1;
    }
    IOUtils.closeQuietly((Reader)localObject1);
    IOUtils.closeQuietly((Reader)localObject2);
    throw ((Throwable)localObject3);
  }
  
  public static File[] convertFileCollectionToFileArray(Collection<File> paramCollection)
  {
    return (File[])paramCollection.toArray(new File[paramCollection.size()]);
  }
  
  public static void copyDirectory(File paramFile1, File paramFile2)
    throws IOException
  {
    copyDirectory(paramFile1, paramFile2, true);
  }
  
  public static void copyDirectory(File paramFile1, File paramFile2, FileFilter paramFileFilter)
    throws IOException
  {
    copyDirectory(paramFile1, paramFile2, paramFileFilter, true);
  }
  
  public static void copyDirectory(File paramFile1, File paramFile2, FileFilter paramFileFilter, boolean paramBoolean)
    throws IOException
  {
    if (paramFile1 == null) {
      throw new NullPointerException("Source must not be null");
    }
    if (paramFile2 == null) {
      throw new NullPointerException("Destination must not be null");
    }
    if (!paramFile1.exists()) {
      throw new FileNotFoundException("Source '" + paramFile1 + "' does not exist");
    }
    if (!paramFile1.isDirectory()) {
      throw new IOException("Source '" + paramFile1 + "' exists but is not a directory");
    }
    if (paramFile1.getCanonicalPath().equals(paramFile2.getCanonicalPath())) {
      throw new IOException("Source '" + paramFile1 + "' and destination '" + paramFile2 + "' are the same");
    }
    boolean bool = paramFile2.getCanonicalPath().startsWith(paramFile1.getCanonicalPath());
    ArrayList localArrayList = null;
    if (bool)
    {
      if (paramFileFilter == null) {}
      for (File[] arrayOfFile1 = paramFile1.listFiles();; arrayOfFile1 = paramFile1.listFiles(paramFileFilter))
      {
        localArrayList = null;
        if (arrayOfFile1 == null) {
          break;
        }
        int i = arrayOfFile1.length;
        localArrayList = null;
        if (i <= 0) {
          break;
        }
        localArrayList = new ArrayList(arrayOfFile1.length);
        File[] arrayOfFile2 = arrayOfFile1;
        int j = arrayOfFile2.length;
        for (int k = 0; k < j; k++) {
          localArrayList.add(new File(paramFile2, arrayOfFile2[k].getName()).getCanonicalPath());
        }
      }
    }
    doCopyDirectory(paramFile1, paramFile2, paramFileFilter, paramBoolean, localArrayList);
  }
  
  public static void copyDirectory(File paramFile1, File paramFile2, boolean paramBoolean)
    throws IOException
  {
    copyDirectory(paramFile1, paramFile2, null, paramBoolean);
  }
  
  public static void copyDirectoryToDirectory(File paramFile1, File paramFile2)
    throws IOException
  {
    if (paramFile1 == null) {
      throw new NullPointerException("Source must not be null");
    }
    if ((paramFile1.exists()) && (!paramFile1.isDirectory())) {
      throw new IllegalArgumentException("Source '" + paramFile2 + "' is not a directory");
    }
    if (paramFile2 == null) {
      throw new NullPointerException("Destination must not be null");
    }
    if ((paramFile2.exists()) && (!paramFile2.isDirectory())) {
      throw new IllegalArgumentException("Destination '" + paramFile2 + "' is not a directory");
    }
    copyDirectory(paramFile1, new File(paramFile2, paramFile1.getName()), true);
  }
  
  public static long copyFile(File paramFile, OutputStream paramOutputStream)
    throws IOException
  {
    FileInputStream localFileInputStream = new FileInputStream(paramFile);
    try
    {
      long l = IOUtils.copyLarge(localFileInputStream, paramOutputStream);
      return l;
    }
    finally
    {
      localFileInputStream.close();
    }
  }
  
  public static void copyFile(File paramFile1, File paramFile2)
    throws IOException
  {
    copyFile(paramFile1, paramFile2, true);
  }
  
  public static void copyFile(File paramFile1, File paramFile2, boolean paramBoolean)
    throws IOException
  {
    if (paramFile1 == null) {
      throw new NullPointerException("Source must not be null");
    }
    if (paramFile2 == null) {
      throw new NullPointerException("Destination must not be null");
    }
    if (!paramFile1.exists()) {
      throw new FileNotFoundException("Source '" + paramFile1 + "' does not exist");
    }
    if (paramFile1.isDirectory()) {
      throw new IOException("Source '" + paramFile1 + "' exists but is a directory");
    }
    if (paramFile1.getCanonicalPath().equals(paramFile2.getCanonicalPath())) {
      throw new IOException("Source '" + paramFile1 + "' and destination '" + paramFile2 + "' are the same");
    }
    File localFile = paramFile2.getParentFile();
    if ((localFile != null) && (!localFile.mkdirs()) && (!localFile.isDirectory())) {
      throw new IOException("Destination '" + localFile + "' directory cannot be created");
    }
    if ((paramFile2.exists()) && (!paramFile2.canWrite())) {
      throw new IOException("Destination '" + paramFile2 + "' exists but is read-only");
    }
    doCopyFile(paramFile1, paramFile2, paramBoolean);
  }
  
  public static void copyFileToDirectory(File paramFile1, File paramFile2)
    throws IOException
  {
    copyFileToDirectory(paramFile1, paramFile2, true);
  }
  
  public static void copyFileToDirectory(File paramFile1, File paramFile2, boolean paramBoolean)
    throws IOException
  {
    if (paramFile2 == null) {
      throw new NullPointerException("Destination must not be null");
    }
    if ((paramFile2.exists()) && (!paramFile2.isDirectory())) {
      throw new IllegalArgumentException("Destination '" + paramFile2 + "' is not a directory");
    }
    copyFile(paramFile1, new File(paramFile2, paramFile1.getName()), paramBoolean);
  }
  
  /* Error */
  public static void copyInputStreamToFile(InputStream paramInputStream, File paramFile)
    throws IOException
  {
    // Byte code:
    //   0: aload_1
    //   1: invokestatic 353	org/apache/commons/io/FileUtils:openOutputStream	(Ljava/io/File;)Ljava/io/FileOutputStream;
    //   4: astore_3
    //   5: aload_0
    //   6: aload_3
    //   7: invokestatic 174	org/apache/commons/io/IOUtils:copy	(Ljava/io/InputStream;Ljava/io/OutputStream;)I
    //   10: pop
    //   11: aload_3
    //   12: invokevirtual 356	java/io/FileOutputStream:close	()V
    //   15: aload_3
    //   16: invokestatic 359	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/OutputStream;)V
    //   19: aload_0
    //   20: invokestatic 178	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/InputStream;)V
    //   23: return
    //   24: astore 4
    //   26: aload_3
    //   27: invokestatic 359	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/OutputStream;)V
    //   30: aload 4
    //   32: athrow
    //   33: astore_2
    //   34: aload_0
    //   35: invokestatic 178	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/InputStream;)V
    //   38: aload_2
    //   39: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	40	0	paramInputStream	InputStream
    //   0	40	1	paramFile	File
    //   33	6	2	localObject1	Object
    //   4	23	3	localFileOutputStream	FileOutputStream
    //   24	7	4	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   5	15	24	finally
    //   0	5	33	finally
    //   15	19	33	finally
    //   26	33	33	finally
  }
  
  public static void copyURLToFile(URL paramURL, File paramFile)
    throws IOException
  {
    copyInputStreamToFile(paramURL.openStream(), paramFile);
  }
  
  public static void copyURLToFile(URL paramURL, File paramFile, int paramInt1, int paramInt2)
    throws IOException
  {
    URLConnection localURLConnection = paramURL.openConnection();
    localURLConnection.setConnectTimeout(paramInt1);
    localURLConnection.setReadTimeout(paramInt2);
    copyInputStreamToFile(localURLConnection.getInputStream(), paramFile);
  }
  
  static String decodeUrl(String paramString)
  {
    String str = paramString;
    if ((paramString != null) && (paramString.indexOf('%') >= 0))
    {
      int i = paramString.length();
      StringBuffer localStringBuffer = new StringBuffer();
      ByteBuffer localByteBuffer = ByteBuffer.allocate(i);
      int j = 0;
      while (j < i)
      {
        label54:
        int m;
        int n;
        if (paramString.charAt(j) == '%')
        {
          m = j + 1;
          n = j + 3;
        }
        try
        {
          localByteBuffer.put((byte)Integer.parseInt(paramString.substring(m, n), 16));
          j += 3;
          if (j < i)
          {
            int i1 = paramString.charAt(j);
            if (i1 == 37) {
              break label54;
            }
          }
          if (localByteBuffer.position() > 0)
          {
            localByteBuffer.flip();
            localStringBuffer.append(UTF8.decode(localByteBuffer).toString());
            localByteBuffer.clear();
          }
        }
        catch (RuntimeException localRuntimeException)
        {
          if (localByteBuffer.position() > 0)
          {
            localByteBuffer.flip();
            localStringBuffer.append(UTF8.decode(localByteBuffer).toString());
            localByteBuffer.clear();
          }
          int k = j + 1;
          localStringBuffer.append(paramString.charAt(j));
          j = k;
        }
        finally
        {
          if (localByteBuffer.position() > 0)
          {
            localByteBuffer.flip();
            localStringBuffer.append(UTF8.decode(localByteBuffer).toString());
            localByteBuffer.clear();
          }
        }
      }
      str = localStringBuffer.toString();
    }
    return str;
  }
  
  public static void deleteDirectory(File paramFile)
    throws IOException
  {
    if (!paramFile.exists()) {}
    do
    {
      return;
      if (!isSymlink(paramFile)) {
        cleanDirectory(paramFile);
      }
    } while (paramFile.delete());
    throw new IOException("Unable to delete directory " + paramFile + ".");
  }
  
  private static void deleteDirectoryOnExit(File paramFile)
    throws IOException
  {
    if (!paramFile.exists()) {}
    do
    {
      return;
      paramFile.deleteOnExit();
    } while (isSymlink(paramFile));
    cleanDirectoryOnExit(paramFile);
  }
  
  public static boolean deleteQuietly(File paramFile)
  {
    if (paramFile == null) {
      return false;
    }
    try
    {
      if (paramFile.isDirectory()) {
        cleanDirectory(paramFile);
      }
      try
      {
        boolean bool = paramFile.delete();
        return bool;
      }
      catch (Exception localException2)
      {
        return false;
      }
    }
    catch (Exception localException1)
    {
      for (;;) {}
    }
  }
  
  public static boolean directoryContains(File paramFile1, File paramFile2)
    throws IOException
  {
    if (paramFile1 == null) {
      throw new IllegalArgumentException("Directory must not be null");
    }
    if (!paramFile1.isDirectory()) {
      throw new IllegalArgumentException("Not a directory: " + paramFile1);
    }
    if (paramFile2 == null) {}
    while ((!paramFile1.exists()) || (!paramFile2.exists())) {
      return false;
    }
    return FilenameUtils.directoryContains(paramFile1.getCanonicalPath(), paramFile2.getCanonicalPath());
  }
  
  private static void doCopyDirectory(File paramFile1, File paramFile2, FileFilter paramFileFilter, boolean paramBoolean, List<String> paramList)
    throws IOException
  {
    if (paramFileFilter == null) {}
    for (File[] arrayOfFile1 = paramFile1.listFiles(); arrayOfFile1 == null; arrayOfFile1 = paramFile1.listFiles(paramFileFilter)) {
      throw new IOException("Failed to list contents of " + paramFile1);
    }
    if (paramFile2.exists())
    {
      if (!paramFile2.isDirectory()) {
        throw new IOException("Destination '" + paramFile2 + "' exists but is not a directory");
      }
    }
    else if ((!paramFile2.mkdirs()) && (!paramFile2.isDirectory())) {
      throw new IOException("Destination '" + paramFile2 + "' directory cannot be created");
    }
    if (!paramFile2.canWrite()) {
      throw new IOException("Destination '" + paramFile2 + "' cannot be written to");
    }
    File[] arrayOfFile2 = arrayOfFile1;
    int i = arrayOfFile2.length;
    int j = 0;
    if (j < i)
    {
      File localFile1 = arrayOfFile2[j];
      File localFile2 = new File(paramFile2, localFile1.getName());
      if ((paramList == null) || (!paramList.contains(localFile1.getCanonicalPath())))
      {
        if (!localFile1.isDirectory()) {
          break label275;
        }
        doCopyDirectory(localFile1, localFile2, paramFileFilter, paramBoolean, paramList);
      }
      for (;;)
      {
        j++;
        break;
        label275:
        doCopyFile(localFile1, localFile2, paramBoolean);
      }
    }
    if (paramBoolean) {
      paramFile2.setLastModified(paramFile1.lastModified());
    }
  }
  
  private static void doCopyFile(File paramFile1, File paramFile2, boolean paramBoolean)
    throws IOException
  {
    if ((paramFile2.exists()) && (paramFile2.isDirectory())) {
      throw new IOException("Destination '" + paramFile2 + "' exists but is a directory");
    }
    localObject1 = null;
    localObject2 = null;
    localFileChannel1 = null;
    localFileChannel2 = null;
    for (;;)
    {
      try
      {
        localFileInputStream = new FileInputStream(paramFile1);
      }
      finally
      {
        Object localObject6;
        long l4;
        IOUtils.closeQuietly(localFileChannel2);
        IOUtils.closeQuietly((OutputStream)localObject2);
        IOUtils.closeQuietly(localFileChannel1);
        IOUtils.closeQuietly((InputStream)localObject1);
      }
      try
      {
        localFileOutputStream = new FileOutputStream(paramFile2);
      }
      finally
      {
        localObject1 = localFileInputStream;
        localFileChannel2 = null;
        localFileChannel1 = null;
        localObject2 = null;
        continue;
      }
      try
      {
        localFileChannel1 = localFileInputStream.getChannel();
        localFileChannel2 = localFileOutputStream.getChannel();
        l1 = localFileChannel1.size();
        l2 = 0L;
      }
      finally
      {
        localObject2 = localFileOutputStream;
        localObject1 = localFileInputStream;
        continue;
        if (l2 >= l1) {
          continue;
        }
        if (l1 - l2 <= 31457280L) {
          continue;
        }
        l3 = 31457280L;
        continue;
      }
      l4 = localFileChannel2.transferFrom(localFileChannel1, l2, localObject6);
      l2 += l4;
      break label282;
      l3 = l1 - l2;
      continue;
      IOUtils.closeQuietly(localFileChannel2);
      IOUtils.closeQuietly(localFileOutputStream);
      IOUtils.closeQuietly(localFileChannel1);
      IOUtils.closeQuietly(localFileInputStream);
      if (paramFile1.length() != paramFile2.length()) {
        throw new IOException("Failed to copy full contents from '" + paramFile1 + "' to '" + paramFile2 + "'");
      }
    }
    if (paramBoolean) {
      paramFile2.setLastModified(paramFile1.lastModified());
    }
  }
  
  public static void forceDelete(File paramFile)
    throws IOException
  {
    if (paramFile.isDirectory()) {
      deleteDirectory(paramFile);
    }
    boolean bool;
    do
    {
      return;
      bool = paramFile.exists();
    } while (paramFile.delete());
    if (!bool) {
      throw new FileNotFoundException("File does not exist: " + paramFile);
    }
    throw new IOException("Unable to delete file: " + paramFile);
  }
  
  public static void forceDeleteOnExit(File paramFile)
    throws IOException
  {
    if (paramFile.isDirectory())
    {
      deleteDirectoryOnExit(paramFile);
      return;
    }
    paramFile.deleteOnExit();
  }
  
  public static void forceMkdir(File paramFile)
    throws IOException
  {
    if (paramFile.exists())
    {
      if (!paramFile.isDirectory()) {
        throw new IOException("File " + paramFile + " exists and is " + "not a directory. Unable to create directory.");
      }
    }
    else if ((!paramFile.mkdirs()) && (!paramFile.isDirectory())) {
      throw new IOException("Unable to create directory " + paramFile);
    }
  }
  
  public static File getFile(File paramFile, String... paramVarArgs)
  {
    if (paramFile == null) {
      throw new NullPointerException("directorydirectory must not be null");
    }
    if (paramVarArgs == null) {
      throw new NullPointerException("names must not be null");
    }
    int i = paramVarArgs.length;
    int j = 0;
    File localFile;
    for (Object localObject = paramFile; j < i; localObject = localFile)
    {
      localFile = new File((File)localObject, paramVarArgs[j]);
      j++;
    }
    return (File)localObject;
  }
  
  public static File getFile(String... paramVarArgs)
  {
    if (paramVarArgs == null) {
      throw new NullPointerException("names must not be null");
    }
    int i = paramVarArgs.length;
    int j = 0;
    Object localObject = null;
    if (j < i)
    {
      String str = paramVarArgs[j];
      if (localObject == null) {}
      for (File localFile = new File(str);; localFile = new File((File)localObject, str))
      {
        j++;
        localObject = localFile;
        break;
      }
    }
    return (File)localObject;
  }
  
  public static File getTempDirectory()
  {
    return new File(getTempDirectoryPath());
  }
  
  public static String getTempDirectoryPath()
  {
    return System.getProperty("java.io.tmpdir");
  }
  
  public static File getUserDirectory()
  {
    return new File(getUserDirectoryPath());
  }
  
  public static String getUserDirectoryPath()
  {
    return System.getProperty("user.home");
  }
  
  private static void innerListFiles(Collection<File> paramCollection, File paramFile, IOFileFilter paramIOFileFilter, boolean paramBoolean)
  {
    File[] arrayOfFile = paramFile.listFiles(paramIOFileFilter);
    if (arrayOfFile != null)
    {
      int i = arrayOfFile.length;
      int j = 0;
      if (j < i)
      {
        File localFile = arrayOfFile[j];
        if (localFile.isDirectory())
        {
          if (paramBoolean) {
            paramCollection.add(localFile);
          }
          innerListFiles(paramCollection, localFile, paramIOFileFilter, paramBoolean);
        }
        for (;;)
        {
          j++;
          break;
          paramCollection.add(localFile);
        }
      }
    }
  }
  
  public static boolean isFileNewer(File paramFile, long paramLong)
  {
    if (paramFile == null) {
      throw new IllegalArgumentException("No specified file");
    }
    if (!paramFile.exists()) {}
    while (paramFile.lastModified() <= paramLong) {
      return false;
    }
    return true;
  }
  
  public static boolean isFileNewer(File paramFile1, File paramFile2)
  {
    if (paramFile2 == null) {
      throw new IllegalArgumentException("No specified reference file");
    }
    if (!paramFile2.exists()) {
      throw new IllegalArgumentException("The reference file '" + paramFile2 + "' doesn't exist");
    }
    return isFileNewer(paramFile1, paramFile2.lastModified());
  }
  
  public static boolean isFileNewer(File paramFile, Date paramDate)
  {
    if (paramDate == null) {
      throw new IllegalArgumentException("No specified date");
    }
    return isFileNewer(paramFile, paramDate.getTime());
  }
  
  public static boolean isFileOlder(File paramFile, long paramLong)
  {
    if (paramFile == null) {
      throw new IllegalArgumentException("No specified file");
    }
    if (!paramFile.exists()) {}
    while (paramFile.lastModified() >= paramLong) {
      return false;
    }
    return true;
  }
  
  public static boolean isFileOlder(File paramFile1, File paramFile2)
  {
    if (paramFile2 == null) {
      throw new IllegalArgumentException("No specified reference file");
    }
    if (!paramFile2.exists()) {
      throw new IllegalArgumentException("The reference file '" + paramFile2 + "' doesn't exist");
    }
    return isFileOlder(paramFile1, paramFile2.lastModified());
  }
  
  public static boolean isFileOlder(File paramFile, Date paramDate)
  {
    if (paramDate == null) {
      throw new IllegalArgumentException("No specified date");
    }
    return isFileOlder(paramFile, paramDate.getTime());
  }
  
  public static boolean isSymlink(File paramFile)
    throws IOException
  {
    if (paramFile == null) {
      throw new NullPointerException("File must not be null");
    }
    if (FilenameUtils.isSystemWindows()) {}
    for (;;)
    {
      return false;
      if (paramFile.getParent() == null) {}
      for (File localFile = paramFile; !localFile.getCanonicalFile().equals(localFile.getAbsoluteFile()); localFile = new File(paramFile.getParentFile().getCanonicalFile(), paramFile.getName())) {
        return true;
      }
    }
  }
  
  public static Iterator<File> iterateFiles(File paramFile, IOFileFilter paramIOFileFilter1, IOFileFilter paramIOFileFilter2)
  {
    return listFiles(paramFile, paramIOFileFilter1, paramIOFileFilter2).iterator();
  }
  
  public static Iterator<File> iterateFiles(File paramFile, String[] paramArrayOfString, boolean paramBoolean)
  {
    return listFiles(paramFile, paramArrayOfString, paramBoolean).iterator();
  }
  
  public static Iterator<File> iterateFilesAndDirs(File paramFile, IOFileFilter paramIOFileFilter1, IOFileFilter paramIOFileFilter2)
  {
    return listFilesAndDirs(paramFile, paramIOFileFilter1, paramIOFileFilter2).iterator();
  }
  
  public static LineIterator lineIterator(File paramFile)
    throws IOException
  {
    return lineIterator(paramFile, null);
  }
  
  public static LineIterator lineIterator(File paramFile, String paramString)
    throws IOException
  {
    FileInputStream localFileInputStream = null;
    try
    {
      localFileInputStream = openInputStream(paramFile);
      LineIterator localLineIterator = IOUtils.lineIterator(localFileInputStream, paramString);
      return localLineIterator;
    }
    catch (IOException localIOException)
    {
      IOUtils.closeQuietly(localFileInputStream);
      throw localIOException;
    }
    catch (RuntimeException localRuntimeException)
    {
      IOUtils.closeQuietly(localFileInputStream);
      throw localRuntimeException;
    }
  }
  
  public static Collection<File> listFiles(File paramFile, IOFileFilter paramIOFileFilter1, IOFileFilter paramIOFileFilter2)
  {
    validateListFilesParameters(paramFile, paramIOFileFilter1);
    IOFileFilter localIOFileFilter1 = setUpEffectiveFileFilter(paramIOFileFilter1);
    IOFileFilter localIOFileFilter2 = setUpEffectiveDirFilter(paramIOFileFilter2);
    LinkedList localLinkedList = new LinkedList();
    innerListFiles(localLinkedList, paramFile, FileFilterUtils.or(new IOFileFilter[] { localIOFileFilter1, localIOFileFilter2 }), false);
    return localLinkedList;
  }
  
  public static Collection<File> listFiles(File paramFile, String[] paramArrayOfString, boolean paramBoolean)
  {
    Object localObject;
    if (paramArrayOfString == null)
    {
      localObject = TrueFileFilter.INSTANCE;
      if (!paramBoolean) {
        break label40;
      }
    }
    label40:
    for (IOFileFilter localIOFileFilter = TrueFileFilter.INSTANCE;; localIOFileFilter = FalseFileFilter.INSTANCE)
    {
      return listFiles(paramFile, (IOFileFilter)localObject, localIOFileFilter);
      localObject = new SuffixFileFilter(toSuffixes(paramArrayOfString));
      break;
    }
  }
  
  public static Collection<File> listFilesAndDirs(File paramFile, IOFileFilter paramIOFileFilter1, IOFileFilter paramIOFileFilter2)
  {
    validateListFilesParameters(paramFile, paramIOFileFilter1);
    IOFileFilter localIOFileFilter1 = setUpEffectiveFileFilter(paramIOFileFilter1);
    IOFileFilter localIOFileFilter2 = setUpEffectiveDirFilter(paramIOFileFilter2);
    LinkedList localLinkedList = new LinkedList();
    if (paramFile.isDirectory()) {
      localLinkedList.add(paramFile);
    }
    innerListFiles(localLinkedList, paramFile, FileFilterUtils.or(new IOFileFilter[] { localIOFileFilter1, localIOFileFilter2 }), true);
    return localLinkedList;
  }
  
  public static void moveDirectory(File paramFile1, File paramFile2)
    throws IOException
  {
    if (paramFile1 == null) {
      throw new NullPointerException("Source must not be null");
    }
    if (paramFile2 == null) {
      throw new NullPointerException("Destination must not be null");
    }
    if (!paramFile1.exists()) {
      throw new FileNotFoundException("Source '" + paramFile1 + "' does not exist");
    }
    if (!paramFile1.isDirectory()) {
      throw new IOException("Source '" + paramFile1 + "' is not a directory");
    }
    if (paramFile2.exists()) {
      throw new FileExistsException("Destination '" + paramFile2 + "' already exists");
    }
    if (!paramFile1.renameTo(paramFile2))
    {
      if (paramFile2.getCanonicalPath().startsWith(paramFile1.getCanonicalPath())) {
        throw new IOException("Cannot move directory: " + paramFile1 + " to a subdirectory of itself: " + paramFile2);
      }
      copyDirectory(paramFile1, paramFile2);
      deleteDirectory(paramFile1);
      if (paramFile1.exists()) {
        throw new IOException("Failed to delete original directory '" + paramFile1 + "' after copy to '" + paramFile2 + "'");
      }
    }
  }
  
  public static void moveDirectoryToDirectory(File paramFile1, File paramFile2, boolean paramBoolean)
    throws IOException
  {
    if (paramFile1 == null) {
      throw new NullPointerException("Source must not be null");
    }
    if (paramFile2 == null) {
      throw new NullPointerException("Destination directory must not be null");
    }
    if ((!paramFile2.exists()) && (paramBoolean)) {
      paramFile2.mkdirs();
    }
    if (!paramFile2.exists()) {
      throw new FileNotFoundException("Destination directory '" + paramFile2 + "' does not exist [createDestDir=" + paramBoolean + "]");
    }
    if (!paramFile2.isDirectory()) {
      throw new IOException("Destination '" + paramFile2 + "' is not a directory");
    }
    moveDirectory(paramFile1, new File(paramFile2, paramFile1.getName()));
  }
  
  public static void moveFile(File paramFile1, File paramFile2)
    throws IOException
  {
    if (paramFile1 == null) {
      throw new NullPointerException("Source must not be null");
    }
    if (paramFile2 == null) {
      throw new NullPointerException("Destination must not be null");
    }
    if (!paramFile1.exists()) {
      throw new FileNotFoundException("Source '" + paramFile1 + "' does not exist");
    }
    if (paramFile1.isDirectory()) {
      throw new IOException("Source '" + paramFile1 + "' is a directory");
    }
    if (paramFile2.exists()) {
      throw new FileExistsException("Destination '" + paramFile2 + "' already exists");
    }
    if (paramFile2.isDirectory()) {
      throw new IOException("Destination '" + paramFile2 + "' is a directory");
    }
    if (!paramFile1.renameTo(paramFile2))
    {
      copyFile(paramFile1, paramFile2);
      if (!paramFile1.delete())
      {
        deleteQuietly(paramFile2);
        throw new IOException("Failed to delete original file '" + paramFile1 + "' after copy to '" + paramFile2 + "'");
      }
    }
  }
  
  public static void moveFileToDirectory(File paramFile1, File paramFile2, boolean paramBoolean)
    throws IOException
  {
    if (paramFile1 == null) {
      throw new NullPointerException("Source must not be null");
    }
    if (paramFile2 == null) {
      throw new NullPointerException("Destination directory must not be null");
    }
    if ((!paramFile2.exists()) && (paramBoolean)) {
      paramFile2.mkdirs();
    }
    if (!paramFile2.exists()) {
      throw new FileNotFoundException("Destination directory '" + paramFile2 + "' does not exist [createDestDir=" + paramBoolean + "]");
    }
    if (!paramFile2.isDirectory()) {
      throw new IOException("Destination '" + paramFile2 + "' is not a directory");
    }
    moveFile(paramFile1, new File(paramFile2, paramFile1.getName()));
  }
  
  public static void moveToDirectory(File paramFile1, File paramFile2, boolean paramBoolean)
    throws IOException
  {
    if (paramFile1 == null) {
      throw new NullPointerException("Source must not be null");
    }
    if (paramFile2 == null) {
      throw new NullPointerException("Destination must not be null");
    }
    if (!paramFile1.exists()) {
      throw new FileNotFoundException("Source '" + paramFile1 + "' does not exist");
    }
    if (paramFile1.isDirectory())
    {
      moveDirectoryToDirectory(paramFile1, paramFile2, paramBoolean);
      return;
    }
    moveFileToDirectory(paramFile1, paramFile2, paramBoolean);
  }
  
  public static FileInputStream openInputStream(File paramFile)
    throws IOException
  {
    if (paramFile.exists())
    {
      if (paramFile.isDirectory()) {
        throw new IOException("File '" + paramFile + "' exists but is a directory");
      }
      if (!paramFile.canRead()) {
        throw new IOException("File '" + paramFile + "' cannot be read");
      }
    }
    else
    {
      throw new FileNotFoundException("File '" + paramFile + "' does not exist");
    }
    return new FileInputStream(paramFile);
  }
  
  public static FileOutputStream openOutputStream(File paramFile)
    throws IOException
  {
    return openOutputStream(paramFile, false);
  }
  
  public static FileOutputStream openOutputStream(File paramFile, boolean paramBoolean)
    throws IOException
  {
    if (paramFile.exists())
    {
      if (paramFile.isDirectory()) {
        throw new IOException("File '" + paramFile + "' exists but is a directory");
      }
      if (!paramFile.canWrite()) {
        throw new IOException("File '" + paramFile + "' cannot be written to");
      }
    }
    else
    {
      File localFile = paramFile.getParentFile();
      if ((localFile != null) && (!localFile.mkdirs()) && (!localFile.isDirectory())) {
        throw new IOException("Directory '" + localFile + "' could not be created");
      }
    }
    return new FileOutputStream(paramFile, paramBoolean);
  }
  
  public static byte[] readFileToByteArray(File paramFile)
    throws IOException
  {
    FileInputStream localFileInputStream = null;
    try
    {
      localFileInputStream = openInputStream(paramFile);
      byte[] arrayOfByte = IOUtils.toByteArray(localFileInputStream, paramFile.length());
      return arrayOfByte;
    }
    finally
    {
      IOUtils.closeQuietly(localFileInputStream);
    }
  }
  
  public static String readFileToString(File paramFile)
    throws IOException
  {
    return readFileToString(paramFile, Charset.defaultCharset());
  }
  
  public static String readFileToString(File paramFile, String paramString)
    throws IOException
  {
    return readFileToString(paramFile, Charsets.toCharset(paramString));
  }
  
  public static String readFileToString(File paramFile, Charset paramCharset)
    throws IOException
  {
    FileInputStream localFileInputStream = null;
    try
    {
      localFileInputStream = openInputStream(paramFile);
      String str = IOUtils.toString(localFileInputStream, Charsets.toCharset(paramCharset));
      return str;
    }
    finally
    {
      IOUtils.closeQuietly(localFileInputStream);
    }
  }
  
  public static List<String> readLines(File paramFile)
    throws IOException
  {
    return readLines(paramFile, Charset.defaultCharset());
  }
  
  public static List<String> readLines(File paramFile, String paramString)
    throws IOException
  {
    return readLines(paramFile, Charsets.toCharset(paramString));
  }
  
  public static List<String> readLines(File paramFile, Charset paramCharset)
    throws IOException
  {
    FileInputStream localFileInputStream = null;
    try
    {
      localFileInputStream = openInputStream(paramFile);
      List localList = IOUtils.readLines(localFileInputStream, Charsets.toCharset(paramCharset));
      return localList;
    }
    finally
    {
      IOUtils.closeQuietly(localFileInputStream);
    }
  }
  
  private static IOFileFilter setUpEffectiveDirFilter(IOFileFilter paramIOFileFilter)
  {
    if (paramIOFileFilter == null) {
      return FalseFileFilter.INSTANCE;
    }
    IOFileFilter[] arrayOfIOFileFilter = new IOFileFilter[2];
    arrayOfIOFileFilter[0] = paramIOFileFilter;
    arrayOfIOFileFilter[1] = DirectoryFileFilter.INSTANCE;
    return FileFilterUtils.and(arrayOfIOFileFilter);
  }
  
  private static IOFileFilter setUpEffectiveFileFilter(IOFileFilter paramIOFileFilter)
  {
    IOFileFilter[] arrayOfIOFileFilter = new IOFileFilter[2];
    arrayOfIOFileFilter[0] = paramIOFileFilter;
    arrayOfIOFileFilter[1] = FileFilterUtils.notFileFilter(DirectoryFileFilter.INSTANCE);
    return FileFilterUtils.and(arrayOfIOFileFilter);
  }
  
  public static long sizeOf(File paramFile)
  {
    if (!paramFile.exists()) {
      throw new IllegalArgumentException(paramFile + " does not exist");
    }
    if (paramFile.isDirectory()) {
      return sizeOfDirectory(paramFile);
    }
    return paramFile.length();
  }
  
  public static BigInteger sizeOfAsBigInteger(File paramFile)
  {
    if (!paramFile.exists()) {
      throw new IllegalArgumentException(paramFile + " does not exist");
    }
    if (paramFile.isDirectory()) {
      return sizeOfDirectoryAsBigInteger(paramFile);
    }
    return BigInteger.valueOf(paramFile.length());
  }
  
  public static long sizeOfDirectory(File paramFile)
  {
    checkDirectory(paramFile);
    File[] arrayOfFile = paramFile.listFiles();
    long l1;
    if (arrayOfFile == null) {
      l1 = 0L;
    }
    label69:
    for (;;)
    {
      return l1;
      l1 = 0L;
      int i = arrayOfFile.length;
      int j = 0;
      for (;;)
      {
        if (j >= i) {
          break label69;
        }
        File localFile = arrayOfFile[j];
        try
        {
          if (!isSymlink(localFile))
          {
            long l2 = sizeOf(localFile);
            l1 += l2;
            if (l1 < 0L) {
              break;
            }
          }
          j++;
        }
        catch (IOException localIOException)
        {
          for (;;) {}
        }
      }
    }
  }
  
  public static BigInteger sizeOfDirectoryAsBigInteger(File paramFile)
  {
    checkDirectory(paramFile);
    File[] arrayOfFile = paramFile.listFiles();
    Object localObject;
    if (arrayOfFile == null) {
      localObject = BigInteger.ZERO;
    }
    for (;;)
    {
      return (BigInteger)localObject;
      localObject = BigInteger.ZERO;
      int i = arrayOfFile.length;
      int j = 0;
      while (j < i)
      {
        File localFile = arrayOfFile[j];
        try
        {
          if (!isSymlink(localFile))
          {
            BigInteger localBigInteger = ((BigInteger)localObject).add(BigInteger.valueOf(sizeOf(localFile)));
            localObject = localBigInteger;
          }
          j++;
        }
        catch (IOException localIOException)
        {
          for (;;) {}
        }
      }
    }
  }
  
  public static File toFile(URL paramURL)
  {
    if ((paramURL == null) || (!"file".equalsIgnoreCase(paramURL.getProtocol()))) {
      return null;
    }
    return new File(decodeUrl(paramURL.getFile().replace('/', File.separatorChar)));
  }
  
  public static File[] toFiles(URL[] paramArrayOfURL)
  {
    File[] arrayOfFile;
    if ((paramArrayOfURL == null) || (paramArrayOfURL.length == 0)) {
      arrayOfFile = EMPTY_FILE_ARRAY;
    }
    for (;;)
    {
      return arrayOfFile;
      arrayOfFile = new File[paramArrayOfURL.length];
      for (int i = 0; i < paramArrayOfURL.length; i++)
      {
        URL localURL = paramArrayOfURL[i];
        if (localURL != null)
        {
          if (!localURL.getProtocol().equals("file")) {
            throw new IllegalArgumentException("URL could not be converted to a File: " + localURL);
          }
          arrayOfFile[i] = toFile(localURL);
        }
      }
    }
  }
  
  private static String[] toSuffixes(String[] paramArrayOfString)
  {
    String[] arrayOfString = new String[paramArrayOfString.length];
    for (int i = 0; i < paramArrayOfString.length; i++) {
      arrayOfString[i] = ("." + paramArrayOfString[i]);
    }
    return arrayOfString;
  }
  
  public static URL[] toURLs(File[] paramArrayOfFile)
    throws IOException
  {
    URL[] arrayOfURL = new URL[paramArrayOfFile.length];
    for (int i = 0; i < arrayOfURL.length; i++) {
      arrayOfURL[i] = paramArrayOfFile[i].toURI().toURL();
    }
    return arrayOfURL;
  }
  
  public static void touch(File paramFile)
    throws IOException
  {
    if (!paramFile.exists()) {
      IOUtils.closeQuietly(openOutputStream(paramFile));
    }
    if (!paramFile.setLastModified(System.currentTimeMillis())) {
      throw new IOException("Unable to set the last modification time for " + paramFile);
    }
  }
  
  private static void validateListFilesParameters(File paramFile, IOFileFilter paramIOFileFilter)
  {
    if (!paramFile.isDirectory()) {
      throw new IllegalArgumentException("Parameter 'directory' is not a directory");
    }
    if (paramIOFileFilter == null) {
      throw new NullPointerException("Parameter 'fileFilter' is null");
    }
  }
  
  public static boolean waitFor(File paramFile, int paramInt)
  {
    int i = 0;
    int j = 0;
    int k;
    if (!paramFile.exists())
    {
      k = j + 1;
      if (j < 10) {
        break label57;
      }
      j = 0;
      int m = i + 1;
      if (i > paramInt) {
        return false;
      }
      i = m;
    }
    for (;;)
    {
      try
      {
        Thread.sleep(100L);
      }
      catch (InterruptedException localInterruptedException) {}catch (Exception localException) {}
      return true;
      label57:
      j = k;
    }
  }
  
  public static void write(File paramFile, CharSequence paramCharSequence)
    throws IOException
  {
    write(paramFile, paramCharSequence, Charset.defaultCharset(), false);
  }
  
  public static void write(File paramFile, CharSequence paramCharSequence, String paramString)
    throws IOException
  {
    write(paramFile, paramCharSequence, paramString, false);
  }
  
  public static void write(File paramFile, CharSequence paramCharSequence, String paramString, boolean paramBoolean)
    throws IOException
  {
    write(paramFile, paramCharSequence, Charsets.toCharset(paramString), paramBoolean);
  }
  
  public static void write(File paramFile, CharSequence paramCharSequence, Charset paramCharset)
    throws IOException
  {
    write(paramFile, paramCharSequence, paramCharset, false);
  }
  
  public static void write(File paramFile, CharSequence paramCharSequence, Charset paramCharset, boolean paramBoolean)
    throws IOException
  {
    if (paramCharSequence == null) {}
    for (String str = null;; str = paramCharSequence.toString())
    {
      writeStringToFile(paramFile, str, paramCharset, paramBoolean);
      return;
    }
  }
  
  public static void write(File paramFile, CharSequence paramCharSequence, boolean paramBoolean)
    throws IOException
  {
    write(paramFile, paramCharSequence, Charset.defaultCharset(), paramBoolean);
  }
  
  public static void writeByteArrayToFile(File paramFile, byte[] paramArrayOfByte)
    throws IOException
  {
    writeByteArrayToFile(paramFile, paramArrayOfByte, false);
  }
  
  public static void writeByteArrayToFile(File paramFile, byte[] paramArrayOfByte, boolean paramBoolean)
    throws IOException
  {
    FileOutputStream localFileOutputStream = null;
    try
    {
      localFileOutputStream = openOutputStream(paramFile, paramBoolean);
      localFileOutputStream.write(paramArrayOfByte);
      localFileOutputStream.close();
      return;
    }
    finally
    {
      IOUtils.closeQuietly(localFileOutputStream);
    }
  }
  
  public static void writeLines(File paramFile, String paramString, Collection<?> paramCollection)
    throws IOException
  {
    writeLines(paramFile, paramString, paramCollection, null, false);
  }
  
  public static void writeLines(File paramFile, String paramString1, Collection<?> paramCollection, String paramString2)
    throws IOException
  {
    writeLines(paramFile, paramString1, paramCollection, paramString2, false);
  }
  
  public static void writeLines(File paramFile, String paramString1, Collection<?> paramCollection, String paramString2, boolean paramBoolean)
    throws IOException
  {
    FileOutputStream localFileOutputStream = null;
    try
    {
      localFileOutputStream = openOutputStream(paramFile, paramBoolean);
      BufferedOutputStream localBufferedOutputStream = new BufferedOutputStream(localFileOutputStream);
      IOUtils.writeLines(paramCollection, paramString2, localBufferedOutputStream, paramString1);
      localBufferedOutputStream.flush();
      localFileOutputStream.close();
      return;
    }
    finally
    {
      IOUtils.closeQuietly(localFileOutputStream);
    }
  }
  
  public static void writeLines(File paramFile, String paramString, Collection<?> paramCollection, boolean paramBoolean)
    throws IOException
  {
    writeLines(paramFile, paramString, paramCollection, null, paramBoolean);
  }
  
  public static void writeLines(File paramFile, Collection<?> paramCollection)
    throws IOException
  {
    writeLines(paramFile, null, paramCollection, null, false);
  }
  
  public static void writeLines(File paramFile, Collection<?> paramCollection, String paramString)
    throws IOException
  {
    writeLines(paramFile, null, paramCollection, paramString, false);
  }
  
  public static void writeLines(File paramFile, Collection<?> paramCollection, String paramString, boolean paramBoolean)
    throws IOException
  {
    writeLines(paramFile, null, paramCollection, paramString, paramBoolean);
  }
  
  public static void writeLines(File paramFile, Collection<?> paramCollection, boolean paramBoolean)
    throws IOException
  {
    writeLines(paramFile, null, paramCollection, null, paramBoolean);
  }
  
  public static void writeStringToFile(File paramFile, String paramString)
    throws IOException
  {
    writeStringToFile(paramFile, paramString, Charset.defaultCharset(), false);
  }
  
  public static void writeStringToFile(File paramFile, String paramString1, String paramString2)
    throws IOException
  {
    writeStringToFile(paramFile, paramString1, paramString2, false);
  }
  
  public static void writeStringToFile(File paramFile, String paramString1, String paramString2, boolean paramBoolean)
    throws IOException
  {
    writeStringToFile(paramFile, paramString1, Charsets.toCharset(paramString2), paramBoolean);
  }
  
  public static void writeStringToFile(File paramFile, String paramString, Charset paramCharset)
    throws IOException
  {
    writeStringToFile(paramFile, paramString, paramCharset, false);
  }
  
  public static void writeStringToFile(File paramFile, String paramString, Charset paramCharset, boolean paramBoolean)
    throws IOException
  {
    FileOutputStream localFileOutputStream = null;
    try
    {
      localFileOutputStream = openOutputStream(paramFile, paramBoolean);
      IOUtils.write(paramString, localFileOutputStream, paramCharset);
      localFileOutputStream.close();
      return;
    }
    finally
    {
      IOUtils.closeQuietly(localFileOutputStream);
    }
  }
  
  public static void writeStringToFile(File paramFile, String paramString, boolean paramBoolean)
    throws IOException
  {
    writeStringToFile(paramFile, paramString, Charset.defaultCharset(), paramBoolean);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/FileUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */