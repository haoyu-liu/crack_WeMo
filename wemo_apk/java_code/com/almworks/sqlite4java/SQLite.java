package com.almworks.sqlite4java;

import java.io.PrintStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.logging.ConsoleHandler;
import java.util.logging.Formatter;
import java.util.logging.Handler;
import java.util.logging.Level;
import java.util.logging.LogRecord;
import java.util.logging.Logger;

public final class SQLite
{
  public static final String LIBRARY_PATH_PROPERTY = "sqlite4java.library.path";
  private static boolean debugBinaryPreferred = "true".equalsIgnoreCase(System.getProperty("sqlite4java.debug.binary.preferred"));
  private static String jarVersion = null;
  private static boolean libraryLoaded = false;
  private static Boolean threadSafe = null;
  
  /* Error */
  public static String getLibraryVersion()
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: getstatic 38	com/almworks/sqlite4java/SQLite:jarVersion	Ljava/lang/String;
    //   6: ifnonnull +183 -> 189
    //   9: new 49	java/lang/StringBuilder
    //   12: dup
    //   13: invokespecial 50	java/lang/StringBuilder:<init>	()V
    //   16: ldc 2
    //   18: invokevirtual 55	java/lang/Class:getName	()Ljava/lang/String;
    //   21: bipush 46
    //   23: bipush 47
    //   25: invokevirtual 59	java/lang/String:replace	(CC)Ljava/lang/String;
    //   28: invokevirtual 63	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   31: ldc 65
    //   33: invokevirtual 63	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   36: invokevirtual 68	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   39: astore_2
    //   40: ldc 2
    //   42: invokevirtual 72	java/lang/Class:getClassLoader	()Ljava/lang/ClassLoader;
    //   45: aload_2
    //   46: invokevirtual 78	java/lang/ClassLoader:getResource	(Ljava/lang/String;)Ljava/net/URL;
    //   49: astore_3
    //   50: aconst_null
    //   51: astore_1
    //   52: aload_3
    //   53: ifnonnull +8 -> 61
    //   56: ldc 2
    //   58: monitorexit
    //   59: aload_1
    //   60: areturn
    //   61: aload_3
    //   62: invokevirtual 81	java/net/URL:toString	()Ljava/lang/String;
    //   65: astore 4
    //   67: aload 4
    //   69: ldc 83
    //   71: invokevirtual 86	java/lang/String:startsWith	(Ljava/lang/String;)Z
    //   74: istore 5
    //   76: aconst_null
    //   77: astore_1
    //   78: iload 5
    //   80: ifeq -24 -> 56
    //   83: aload 4
    //   85: bipush 33
    //   87: invokevirtual 90	java/lang/String:lastIndexOf	(I)I
    //   90: istore 6
    //   92: aconst_null
    //   93: astore_1
    //   94: iload 6
    //   96: iflt -40 -> 56
    //   99: new 49	java/lang/StringBuilder
    //   102: dup
    //   103: invokespecial 50	java/lang/StringBuilder:<init>	()V
    //   106: aload 4
    //   108: iconst_0
    //   109: iload 6
    //   111: iconst_1
    //   112: iadd
    //   113: invokevirtual 94	java/lang/String:substring	(II)Ljava/lang/String;
    //   116: invokevirtual 63	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   119: ldc 96
    //   121: invokevirtual 63	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   124: invokevirtual 68	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   127: astore 7
    //   129: aconst_null
    //   130: astore 8
    //   132: new 80	java/net/URL
    //   135: dup
    //   136: aload 7
    //   138: invokespecial 99	java/net/URL:<init>	(Ljava/lang/String;)V
    //   141: invokevirtual 103	java/net/URL:openStream	()Ljava/io/InputStream;
    //   144: astore 8
    //   146: new 105	java/util/jar/Manifest
    //   149: dup
    //   150: aload 8
    //   152: invokespecial 108	java/util/jar/Manifest:<init>	(Ljava/io/InputStream;)V
    //   155: astore 14
    //   157: aload 8
    //   159: ifnull +8 -> 167
    //   162: aload 8
    //   164: invokevirtual 113	java/io/InputStream:close	()V
    //   167: aload 14
    //   169: astore 12
    //   171: aload 12
    //   173: ifnull +16 -> 189
    //   176: aload 12
    //   178: invokevirtual 117	java/util/jar/Manifest:getMainAttributes	()Ljava/util/jar/Attributes;
    //   181: ldc 119
    //   183: invokevirtual 124	java/util/jar/Attributes:getValue	(Ljava/lang/String;)Ljava/lang/String;
    //   186: putstatic 38	com/almworks/sqlite4java/SQLite:jarVersion	Ljava/lang/String;
    //   189: getstatic 38	com/almworks/sqlite4java/SQLite:jarVersion	Ljava/lang/String;
    //   192: ifnonnull +10 -> 202
    //   195: ldc 2
    //   197: ldc 126
    //   199: invokestatic 132	com/almworks/sqlite4java/Internal:logWarn	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   202: getstatic 38	com/almworks/sqlite4java/SQLite:jarVersion	Ljava/lang/String;
    //   205: astore_1
    //   206: goto -150 -> 56
    //   209: astore 15
    //   211: aload 14
    //   213: astore 12
    //   215: goto -44 -> 171
    //   218: astore 11
    //   220: ldc 2
    //   222: new 49	java/lang/StringBuilder
    //   225: dup
    //   226: invokespecial 50	java/lang/StringBuilder:<init>	()V
    //   229: ldc -122
    //   231: invokevirtual 63	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   234: aload 11
    //   236: invokevirtual 137	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   239: invokevirtual 68	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   242: invokestatic 132	com/almworks/sqlite4java/Internal:logWarn	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   245: aconst_null
    //   246: astore 12
    //   248: aload 8
    //   250: ifnull -79 -> 171
    //   253: aload 8
    //   255: invokevirtual 113	java/io/InputStream:close	()V
    //   258: aconst_null
    //   259: astore 12
    //   261: goto -90 -> 171
    //   264: astore 13
    //   266: aconst_null
    //   267: astore 12
    //   269: goto -98 -> 171
    //   272: astore 9
    //   274: aload 8
    //   276: ifnull +8 -> 284
    //   279: aload 8
    //   281: invokevirtual 113	java/io/InputStream:close	()V
    //   284: aload 9
    //   286: athrow
    //   287: astore_0
    //   288: ldc 2
    //   290: monitorexit
    //   291: aload_0
    //   292: athrow
    //   293: astore 10
    //   295: goto -11 -> 284
    // Local variable table:
    //   start	length	slot	name	signature
    //   287	5	0	localObject1	Object
    //   51	155	1	str1	String
    //   39	7	2	str2	String
    //   49	13	3	localURL	java.net.URL
    //   65	42	4	str3	String
    //   74	5	5	bool	boolean
    //   90	23	6	i	int
    //   127	10	7	str4	String
    //   130	150	8	localInputStream	java.io.InputStream
    //   272	13	9	localObject2	Object
    //   293	1	10	localIOException1	java.io.IOException
    //   218	17	11	localIOException2	java.io.IOException
    //   169	99	12	localManifest1	java.util.jar.Manifest
    //   264	1	13	localIOException3	java.io.IOException
    //   155	57	14	localManifest2	java.util.jar.Manifest
    //   209	1	15	localIOException4	java.io.IOException
    // Exception table:
    //   from	to	target	type
    //   162	167	209	java/io/IOException
    //   132	157	218	java/io/IOException
    //   253	258	264	java/io/IOException
    //   132	157	272	finally
    //   220	245	272	finally
    //   3	50	287	finally
    //   61	76	287	finally
    //   83	92	287	finally
    //   99	129	287	finally
    //   162	167	287	finally
    //   176	189	287	finally
    //   189	202	287	finally
    //   202	206	287	finally
    //   253	258	287	finally
    //   279	284	287	finally
    //   284	287	287	finally
    //   279	284	293	java/io/IOException
  }
  
  public static long getMemoryHighwater(boolean paramBoolean)
    throws SQLiteException
  {
    
    if (paramBoolean) {}
    for (int i = 1;; i = 0) {
      return _SQLiteSwigged.sqlite3_memory_highwater(i);
    }
  }
  
  public static long getMemoryUsed()
    throws SQLiteException
  {
    loadLibrary();
    return _SQLiteSwigged.sqlite3_memory_used();
  }
  
  public static String getSQLiteCompileOptions()
    throws SQLiteException
  {
    loadLibrary();
    StringBuilder localStringBuilder = new StringBuilder();
    int j;
    for (int i = 0;; i = j)
    {
      j = i + 1;
      String str = _SQLiteSwigged.sqlite3_compileoption_get(i);
      if ((str == null) || (str.length() == 0)) {
        return localStringBuilder.toString();
      }
      if (localStringBuilder.length() > 0) {
        localStringBuilder.append(' ');
      }
      localStringBuilder.append(str);
    }
  }
  
  public static String getSQLiteVersion()
    throws SQLiteException
  {
    loadLibrary();
    return _SQLiteSwigged.sqlite3_libversion();
  }
  
  public static int getSQLiteVersionNumber()
    throws SQLiteException
  {
    loadLibrary();
    return _SQLiteSwigged.sqlite3_libversion_number();
  }
  
  public static boolean isComplete(String paramString)
    throws SQLiteException
  {
    loadLibrary();
    return _SQLiteSwigged.sqlite3_complete(paramString) != 0;
  }
  
  public static boolean isDebugBinaryPreferred()
  {
    try
    {
      boolean bool = debugBinaryPreferred;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public static boolean isThreadSafe()
    throws SQLiteException
  {
    Boolean localBoolean = threadSafe;
    if (localBoolean != null) {
      return localBoolean.booleanValue();
    }
    loadLibrary();
    if (_SQLiteSwigged.sqlite3_threadsafe() != 0) {}
    for (boolean bool = true;; bool = false)
    {
      threadSafe = Boolean.valueOf(bool);
      return bool;
    }
  }
  
  public static void loadLibrary()
    throws SQLiteException
  {
    try
    {
      if (libraryLoaded) {
        break label70;
      }
      Throwable localThrowable = Internal.loadLibraryX();
      if (localThrowable != null) {
        throw new SQLiteException(-91, "cannot load library: " + localThrowable, localThrowable);
      }
    }
    finally {}
    libraryLoaded = true;
    if (_SQLiteSwigged.sqlite3_threadsafe() == 0) {
      Internal.logWarn(SQLite.class, "library is not thread-safe");
    }
    label70:
  }
  
  public static void main(String[] paramArrayOfString)
  {
    Handler[] arrayOfHandler;
    int i;
    int j;
    if ((paramArrayOfString.length > 0) && ("-d".equals(paramArrayOfString[0])))
    {
      Logger.getLogger("com.almworks.sqlite4java").setLevel(Level.FINE);
      arrayOfHandler = Logger.getLogger("").getHandlers();
      i = arrayOfHandler.length;
      j = 0;
    }
    while (j < i)
    {
      Handler localHandler = arrayOfHandler[j];
      if ((localHandler instanceof ConsoleHandler))
      {
        localHandler.setLevel(Level.FINE);
        localHandler.setFormatter(new NiceFormatter(null));
      }
      j++;
      continue;
      Logger.getLogger("com.almworks.sqlite4java").setLevel(Level.SEVERE);
    }
    String str = getLibraryVersion();
    if (str == null) {
      str = "(UNKNOWN VERSION)";
    }
    System.out.println("sqlite4java " + str);
    boolean bool = libraryLoaded;
    Throwable localThrowable = null;
    if (bool) {}
    while (localThrowable != null)
    {
      System.out.println("Error: cannot load SQLite");
      localThrowable.printStackTrace();
      return;
      localThrowable = Internal.loadLibraryX();
    }
    try
    {
      System.out.println("SQLite " + getSQLiteVersion());
      System.out.println("Compile-time options: " + getSQLiteCompileOptions());
      return;
    }
    catch (SQLiteException localSQLiteException)
    {
      localSQLiteException.printStackTrace();
    }
  }
  
  public static int releaseMemory(int paramInt)
    throws SQLiteException
  {
    loadLibrary();
    return _SQLiteSwigged.sqlite3_release_memory(paramInt);
  }
  
  /* Error */
  public static void setDebugBinaryPreferred(boolean paramBoolean)
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: getstatic 36	com/almworks/sqlite4java/SQLite:libraryLoaded	Z
    //   6: ifeq +15 -> 21
    //   9: ldc 2
    //   11: ldc_w 295
    //   14: invokestatic 132	com/almworks/sqlite4java/Internal:logWarn	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   17: ldc 2
    //   19: monitorexit
    //   20: return
    //   21: iload_0
    //   22: putstatic 34	com/almworks/sqlite4java/SQLite:debugBinaryPreferred	Z
    //   25: goto -8 -> 17
    //   28: astore_1
    //   29: ldc 2
    //   31: monitorexit
    //   32: aload_1
    //   33: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	34	0	paramBoolean	boolean
    //   28	5	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   3	17	28	finally
    //   21	25	28	finally
  }
  
  /* Error */
  public static void setLibraryPath(String paramString)
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: getstatic 36	com/almworks/sqlite4java/SQLite:libraryLoaded	Z
    //   6: ifeq +15 -> 21
    //   9: ldc 2
    //   11: ldc_w 298
    //   14: invokestatic 132	com/almworks/sqlite4java/Internal:logWarn	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   17: ldc 2
    //   19: monitorexit
    //   20: return
    //   21: ldc 8
    //   23: aload_0
    //   24: invokestatic 302	java/lang/System:setProperty	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   27: pop
    //   28: goto -11 -> 17
    //   31: astore_1
    //   32: ldc 2
    //   34: monitorexit
    //   35: aload_1
    //   36: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	37	0	paramString	String
    //   31	5	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   3	17	31	finally
    //   21	28	31	finally
  }
  
  public static void setSharedCache(boolean paramBoolean)
    throws SQLiteException
  {
    
    if (paramBoolean) {}
    for (int i = 1;; i = 0)
    {
      int j = _SQLiteSwigged.sqlite3_enable_shared_cache(i);
      if (j == 0) {
        break;
      }
      throw new SQLiteException(j, "SQLite: cannot set shared_cache to " + paramBoolean);
    }
  }
  
  public static void setSoftHeapLimit(int paramInt)
    throws SQLiteException
  {
    loadLibrary();
    _SQLiteSwigged.sqlite3_soft_heap_limit64(paramInt);
  }
  
  public static long softHeapLimit(long paramLong)
    throws SQLiteException
  {
    loadLibrary();
    return _SQLiteSwigged.sqlite3_soft_heap_limit64(paramLong);
  }
  
  private static class NiceFormatter
    extends Formatter
  {
    private static final DateFormat DATE_FORMAT = new SimpleDateFormat("yyMMdd:HHmmss.SSS", Locale.US);
    private static final String LINE_SEPARATOR;
    
    static
    {
      String str = System.getProperty("line.separator");
      if (str == null) {
        str = "\n";
      }
      LINE_SEPARATOR = str;
    }
    
    public String format(LogRecord paramLogRecord)
    {
      if (paramLogRecord == null) {
        return "";
      }
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append(DATE_FORMAT.format(Long.valueOf(paramLogRecord.getMillis()))).append(' ');
      Level localLevel = paramLogRecord.getLevel();
      if (localLevel == null) {
        localLevel = Level.ALL;
      }
      localStringBuilder.append(localLevel.getName()).append(' ');
      localStringBuilder.append(paramLogRecord.getMessage());
      localStringBuilder.append(LINE_SEPARATOR);
      return localStringBuilder.toString();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/SQLite.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */