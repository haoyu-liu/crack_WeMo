package org.apache.commons.io;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.StringTokenizer;

public class FileSystemUtils
{
  private static final String DF;
  private static final int INIT_PROBLEM = -1;
  private static final FileSystemUtils INSTANCE = new FileSystemUtils();
  private static final int OS = 0;
  private static final int OTHER = 0;
  private static final int POSIX_UNIX = 3;
  private static final int UNIX = 2;
  private static final int WINDOWS = 1;
  
  static
  {
    String str1 = "df";
    String str2;
    int i;
    try
    {
      str2 = System.getProperty("os.name");
      if (str2 == null) {
        throw new IOException("os.name not found");
      }
    }
    catch (Exception localException)
    {
      i = -1;
    }
    for (;;)
    {
      OS = i;
      DF = str1;
      return;
      String str3 = str2.toLowerCase(Locale.ENGLISH);
      if (str3.indexOf("windows") != -1)
      {
        i = 1;
      }
      else
      {
        if ((str3.indexOf("linux") == -1) && (str3.indexOf("mpe/ix") == -1) && (str3.indexOf("freebsd") == -1) && (str3.indexOf("irix") == -1) && (str3.indexOf("digital unix") == -1) && (str3.indexOf("unix") == -1) && (str3.indexOf("mac os x") == -1))
        {
          if ((str3.indexOf("sun os") == -1) && (str3.indexOf("sunos") == -1) && (str3.indexOf("solaris") == -1))
          {
            if (str3.indexOf("hp-ux") == -1)
            {
              int j = str3.indexOf("aix");
              if (j == -1) {}
            }
            else
            {
              i = 3;
              continue;
            }
            i = 0;
          }
        }
        else
        {
          i = 2;
          continue;
        }
        i = 3;
        str1 = "/usr/xpg4/bin/df";
      }
    }
  }
  
  @Deprecated
  public static long freeSpace(String paramString)
    throws IOException
  {
    return INSTANCE.freeSpaceOS(paramString, OS, false, -1L);
  }
  
  public static long freeSpaceKb()
    throws IOException
  {
    return freeSpaceKb(-1L);
  }
  
  public static long freeSpaceKb(long paramLong)
    throws IOException
  {
    return freeSpaceKb(new File(".").getAbsolutePath(), paramLong);
  }
  
  public static long freeSpaceKb(String paramString)
    throws IOException
  {
    return freeSpaceKb(paramString, -1L);
  }
  
  public static long freeSpaceKb(String paramString, long paramLong)
    throws IOException
  {
    return INSTANCE.freeSpaceOS(paramString, OS, true, paramLong);
  }
  
  long freeSpaceOS(String paramString, int paramInt, boolean paramBoolean, long paramLong)
    throws IOException
  {
    if (paramString == null) {
      throw new IllegalArgumentException("Path must not be empty");
    }
    switch (paramInt)
    {
    default: 
      throw new IllegalStateException("Exception caught when determining operating system");
    case 1: 
      if (paramBoolean) {
        return freeSpaceWindows(paramString, paramLong) / 1024L;
      }
      return freeSpaceWindows(paramString, paramLong);
    case 2: 
      return freeSpaceUnix(paramString, paramBoolean, false, paramLong);
    case 3: 
      return freeSpaceUnix(paramString, paramBoolean, true, paramLong);
    }
    throw new IllegalStateException("Unsupported operating system");
  }
  
  long freeSpaceUnix(String paramString, boolean paramBoolean1, boolean paramBoolean2, long paramLong)
    throws IOException
  {
    if (paramString.length() == 0) {
      throw new IllegalArgumentException("Path must not be empty");
    }
    String str = "-";
    if (paramBoolean1) {
      str = str + "k";
    }
    if (paramBoolean2) {
      str = str + "P";
    }
    String[] arrayOfString;
    if (str.length() > 1)
    {
      arrayOfString = new String[3];
      arrayOfString[0] = DF;
      arrayOfString[1] = str;
      arrayOfString[2] = paramString;
    }
    List localList;
    for (;;)
    {
      localList = performCommand(arrayOfString, 3, paramLong);
      if (localList.size() >= 2) {
        break;
      }
      throw new IOException("Command line '" + DF + "' did not return info as expected " + "for path '" + paramString + "'- response was " + localList);
      arrayOfString = new String[2];
      arrayOfString[0] = DF;
      arrayOfString[1] = paramString;
    }
    StringTokenizer localStringTokenizer = new StringTokenizer((String)localList.get(1), " ");
    if (localStringTokenizer.countTokens() < 4) {
      if ((localStringTokenizer.countTokens() == 1) && (localList.size() >= 3)) {
        localStringTokenizer = new StringTokenizer((String)localList.get(2), " ");
      }
    }
    for (;;)
    {
      localStringTokenizer.nextToken();
      localStringTokenizer.nextToken();
      return parseBytes(localStringTokenizer.nextToken(), paramString);
      throw new IOException("Command line '" + DF + "' did not return data as expected " + "for path '" + paramString + "'- check path is valid");
      localStringTokenizer.nextToken();
    }
  }
  
  long freeSpaceWindows(String paramString, long paramLong)
    throws IOException
  {
    String str1 = FilenameUtils.normalize(paramString, false);
    if ((str1.length() > 0) && (str1.charAt(0) != '"')) {
      str1 = "\"" + str1 + "\"";
    }
    String[] arrayOfString = new String[3];
    arrayOfString[0] = "cmd.exe";
    arrayOfString[1] = "/C";
    arrayOfString[2] = ("dir /a /-c " + str1);
    List localList = performCommand(arrayOfString, Integer.MAX_VALUE, paramLong);
    for (int i = -1 + localList.size(); i >= 0; i--)
    {
      String str2 = (String)localList.get(i);
      if (str2.length() > 0) {
        return parseDir(str2, str1);
      }
    }
    throw new IOException("Command line 'dir /-c' did not return any info for path '" + str1 + "'");
  }
  
  Process openProcess(String[] paramArrayOfString)
    throws IOException
  {
    return Runtime.getRuntime().exec(paramArrayOfString);
  }
  
  long parseBytes(String paramString1, String paramString2)
    throws IOException
  {
    long l;
    try
    {
      l = Long.parseLong(paramString1);
      if (l < 0L) {
        throw new IOException("Command line '" + DF + "' did not find free space in response " + "for path '" + paramString2 + "'- check path is valid");
      }
    }
    catch (NumberFormatException localNumberFormatException)
    {
      throw new IOExceptionWithCause("Command line '" + DF + "' did not return numeric data as expected " + "for path '" + paramString2 + "'- check path is valid", localNumberFormatException);
    }
    return l;
  }
  
  long parseDir(String paramString1, String paramString2)
    throws IOException
  {
    int i = -1 + paramString1.length();
    int j = 0;
    if (i >= 0)
    {
      if (!Character.isDigit(paramString1.charAt(i))) {
        break label108;
      }
      j = i + 1;
    }
    int k;
    for (;;)
    {
      k = 0;
      if (i >= 0)
      {
        char c = paramString1.charAt(i);
        if ((!Character.isDigit(c)) && (c != ',') && (c != '.')) {
          k = i + 1;
        }
      }
      else
      {
        if (i >= 0) {
          break label120;
        }
        throw new IOException("Command line 'dir /-c' did not return valid info for path '" + paramString2 + "'");
        label108:
        i--;
        break;
      }
      i--;
    }
    label120:
    StringBuilder localStringBuilder = new StringBuilder(paramString1.substring(k, j));
    for (int m = 0; m < localStringBuilder.length(); m++) {
      if ((localStringBuilder.charAt(m) == ',') || (localStringBuilder.charAt(m) == '.'))
      {
        int n = m - 1;
        localStringBuilder.deleteCharAt(m);
        m = n;
      }
    }
    return parseBytes(localStringBuilder.toString(), paramString2);
  }
  
  /* Error */
  List<String> performCommand(String[] paramArrayOfString, int paramInt, long paramLong)
    throws IOException
  {
    // Byte code:
    //   0: new 283	java/util/ArrayList
    //   3: dup
    //   4: bipush 20
    //   6: invokespecial 286	java/util/ArrayList:<init>	(I)V
    //   9: astore 5
    //   11: aconst_null
    //   12: astore 6
    //   14: aconst_null
    //   15: astore 7
    //   17: aconst_null
    //   18: astore 8
    //   20: aconst_null
    //   21: astore 9
    //   23: aconst_null
    //   24: astore 10
    //   26: lload_3
    //   27: invokestatic 292	org/apache/commons/io/ThreadMonitor:start	(J)Ljava/lang/Thread;
    //   30: astore 13
    //   32: aload_0
    //   33: aload_1
    //   34: invokevirtual 294	org/apache/commons/io/FileSystemUtils:openProcess	([Ljava/lang/String;)Ljava/lang/Process;
    //   37: astore 6
    //   39: aload 6
    //   41: invokevirtual 300	java/lang/Process:getInputStream	()Ljava/io/InputStream;
    //   44: astore 7
    //   46: aload 6
    //   48: invokevirtual 304	java/lang/Process:getOutputStream	()Ljava/io/OutputStream;
    //   51: astore 8
    //   53: aload 6
    //   55: invokevirtual 307	java/lang/Process:getErrorStream	()Ljava/io/InputStream;
    //   58: astore 9
    //   60: new 309	java/io/BufferedReader
    //   63: dup
    //   64: new 311	java/io/InputStreamReader
    //   67: dup
    //   68: aload 7
    //   70: invokespecial 314	java/io/InputStreamReader:<init>	(Ljava/io/InputStream;)V
    //   73: invokespecial 317	java/io/BufferedReader:<init>	(Ljava/io/Reader;)V
    //   76: astore 14
    //   78: aload 14
    //   80: invokevirtual 320	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   83: astore 15
    //   85: aload 15
    //   87: ifnull +43 -> 130
    //   90: aload 5
    //   92: invokeinterface 171 1 0
    //   97: iload_2
    //   98: if_icmpge +32 -> 130
    //   101: aload 5
    //   103: aload 15
    //   105: getstatic 56	java/util/Locale:ENGLISH	Ljava/util/Locale;
    //   108: invokevirtual 62	java/lang/String:toLowerCase	(Ljava/util/Locale;)Ljava/lang/String;
    //   111: invokevirtual 323	java/lang/String:trim	()Ljava/lang/String;
    //   114: invokeinterface 327 2 0
    //   119: pop
    //   120: aload 14
    //   122: invokevirtual 320	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   125: astore 15
    //   127: goto -42 -> 85
    //   130: aload 6
    //   132: invokevirtual 330	java/lang/Process:waitFor	()I
    //   135: pop
    //   136: aload 13
    //   138: invokestatic 334	org/apache/commons/io/ThreadMonitor:stop	(Ljava/lang/Thread;)V
    //   141: aload 6
    //   143: invokevirtual 337	java/lang/Process:exitValue	()I
    //   146: ifeq +132 -> 278
    //   149: new 41	java/io/IOException
    //   152: dup
    //   153: new 150	java/lang/StringBuilder
    //   156: dup
    //   157: invokespecial 151	java/lang/StringBuilder:<init>	()V
    //   160: ldc_w 339
    //   163: invokevirtual 155	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   166: aload 6
    //   168: invokevirtual 337	java/lang/Process:exitValue	()I
    //   171: invokevirtual 341	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   174: ldc_w 343
    //   177: invokevirtual 155	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   180: aload_1
    //   181: invokestatic 349	java/util/Arrays:asList	([Ljava/lang/Object;)Ljava/util/List;
    //   184: invokevirtual 182	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   187: invokevirtual 160	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   190: invokespecial 46	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   193: athrow
    //   194: astore 11
    //   196: aload 14
    //   198: astore 10
    //   200: new 255	org/apache/commons/io/IOExceptionWithCause
    //   203: dup
    //   204: new 150	java/lang/StringBuilder
    //   207: dup
    //   208: invokespecial 151	java/lang/StringBuilder:<init>	()V
    //   211: ldc_w 351
    //   214: invokevirtual 155	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   217: aload_1
    //   218: invokestatic 349	java/util/Arrays:asList	([Ljava/lang/Object;)Ljava/util/List;
    //   221: invokevirtual 182	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   224: ldc_w 353
    //   227: invokevirtual 155	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   230: lload_3
    //   231: invokevirtual 356	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   234: invokevirtual 160	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   237: aload 11
    //   239: invokespecial 260	org/apache/commons/io/IOExceptionWithCause:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   242: athrow
    //   243: astore 12
    //   245: aload 7
    //   247: invokestatic 361	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/InputStream;)V
    //   250: aload 8
    //   252: invokestatic 364	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/OutputStream;)V
    //   255: aload 9
    //   257: invokestatic 361	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/InputStream;)V
    //   260: aload 10
    //   262: invokestatic 366	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/Reader;)V
    //   265: aload 6
    //   267: ifnull +8 -> 275
    //   270: aload 6
    //   272: invokevirtual 369	java/lang/Process:destroy	()V
    //   275: aload 12
    //   277: athrow
    //   278: aload 5
    //   280: invokeinterface 373 1 0
    //   285: ifeq +43 -> 328
    //   288: new 41	java/io/IOException
    //   291: dup
    //   292: new 150	java/lang/StringBuilder
    //   295: dup
    //   296: invokespecial 151	java/lang/StringBuilder:<init>	()V
    //   299: ldc_w 375
    //   302: invokevirtual 155	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   305: aload_1
    //   306: invokestatic 349	java/util/Arrays:asList	([Ljava/lang/Object;)Ljava/util/List;
    //   309: invokevirtual 182	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   312: invokevirtual 160	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   315: invokespecial 46	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   318: athrow
    //   319: astore 12
    //   321: aload 14
    //   323: astore 10
    //   325: goto -80 -> 245
    //   328: aload 7
    //   330: invokestatic 361	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/InputStream;)V
    //   333: aload 8
    //   335: invokestatic 364	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/OutputStream;)V
    //   338: aload 9
    //   340: invokestatic 361	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/InputStream;)V
    //   343: aload 14
    //   345: invokestatic 366	org/apache/commons/io/IOUtils:closeQuietly	(Ljava/io/Reader;)V
    //   348: aload 6
    //   350: ifnull +8 -> 358
    //   353: aload 6
    //   355: invokevirtual 369	java/lang/Process:destroy	()V
    //   358: aload 5
    //   360: areturn
    //   361: astore 11
    //   363: aconst_null
    //   364: astore 10
    //   366: goto -166 -> 200
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	369	0	this	FileSystemUtils
    //   0	369	1	paramArrayOfString	String[]
    //   0	369	2	paramInt	int
    //   0	369	3	paramLong	long
    //   9	350	5	localArrayList	java.util.ArrayList
    //   12	342	6	localProcess	Process
    //   15	314	7	localInputStream1	java.io.InputStream
    //   18	316	8	localOutputStream	java.io.OutputStream
    //   21	318	9	localInputStream2	java.io.InputStream
    //   24	341	10	localObject1	Object
    //   194	44	11	localInterruptedException1	InterruptedException
    //   361	1	11	localInterruptedException2	InterruptedException
    //   243	33	12	localObject2	Object
    //   319	1	12	localObject3	Object
    //   30	107	13	localThread	Thread
    //   76	268	14	localBufferedReader	java.io.BufferedReader
    //   83	43	15	str	String
    // Exception table:
    //   from	to	target	type
    //   78	85	194	java/lang/InterruptedException
    //   90	127	194	java/lang/InterruptedException
    //   130	194	194	java/lang/InterruptedException
    //   278	319	194	java/lang/InterruptedException
    //   26	78	243	finally
    //   200	243	243	finally
    //   78	85	319	finally
    //   90	127	319	finally
    //   130	194	319	finally
    //   278	319	319	finally
    //   26	78	361	java/lang/InterruptedException
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/FileSystemUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */