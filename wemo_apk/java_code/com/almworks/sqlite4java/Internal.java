package com.almworks.sqlite4java;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.logging.Level;
import java.util.logging.Logger;

final class Internal
{
  private static final String BASE_LIBRARY_NAME = "sqlite4java";
  private static final String[] DEBUG_SUFFIXES;
  private static final String LOG_PREFIX = "[sqlite] ";
  private static final String[] RELEASE_SUFFIXES;
  private static final AtomicInteger lastConnectionNumber;
  private static final Logger logger;
  
  static
  {
    if (!Internal.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      logger = Logger.getLogger("com.almworks.sqlite4java");
      DEBUG_SUFFIXES = new String[] { "-d", "" };
      RELEASE_SUFFIXES = new String[] { "", "-d" };
      lastConnectionNumber = new AtomicInteger(0);
      return;
    }
  }
  
  private static LinkageError checkLoaded()
  {
    try
    {
      getLibraryVersionMessage();
      return null;
    }
    catch (LinkageError localLinkageError)
    {
      return localLinkageError;
    }
  }
  
  private static List<String> collectBaseLibraryNames(String paramString1, String paramString2)
  {
    ArrayList localArrayList = new ArrayList(6);
    String str = "sqlite4java-" + paramString1;
    localArrayList.add(str + "-" + paramString2);
    if ((paramString2.equals("x86_64")) || (paramString2.equals("x64"))) {
      localArrayList.add(str + "-amd64");
    }
    for (;;)
    {
      localArrayList.add(str);
      localArrayList.add("sqlite4java");
      return localArrayList;
      if (paramString2.equals("x86"))
      {
        localArrayList.add(str + "-i386");
      }
      else if (paramString2.equals("i386"))
      {
        localArrayList.add(str + "-x86");
      }
      else if ((paramString2.startsWith("arm")) && (paramString2.length() > 3))
      {
        if ((paramString2.length() > 5) && (paramString2.startsWith("armv")) && (Character.isDigit(paramString2.charAt(4)))) {
          localArrayList.add(str + "-" + paramString2.substring(0, 5));
        }
        localArrayList.add(str + "-arm");
      }
    }
  }
  
  private static List<String> collectLibraryNames(String paramString1, String paramString2, String paramString3)
  {
    List localList = collectBaseLibraryNames(paramString2, paramString3);
    ArrayList localArrayList = new ArrayList(24);
    String[] arrayOfString1;
    String[] arrayOfString3;
    int k;
    if (SQLite.isDebugBinaryPreferred())
    {
      arrayOfString1 = DEBUG_SUFFIXES;
      if (paramString1 != null)
      {
        arrayOfString3 = arrayOfString1;
        k = arrayOfString3.length;
      }
    }
    else
    {
      for (int m = 0;; m++)
      {
        if (m >= k) {
          break label135;
        }
        String str3 = arrayOfString3[m];
        Iterator localIterator2 = localList.iterator();
        for (;;)
        {
          if (localIterator2.hasNext())
          {
            String str4 = (String)localIterator2.next();
            localArrayList.add(str4 + str3 + paramString1);
            continue;
            arrayOfString1 = RELEASE_SUFFIXES;
            break;
          }
        }
      }
    }
    label135:
    for (String str1 : arrayOfString1)
    {
      Iterator localIterator1 = localList.iterator();
      while (localIterator1.hasNext())
      {
        String str2 = (String)localIterator1.next();
        localArrayList.add(str2 + str1);
      }
    }
    return localArrayList;
  }
  
  private static String getArch(String paramString)
  {
    String str1 = System.getProperty("os.arch");
    if (str1 == null) {
      logWarn(Internal.class, "os.arch is null");
    }
    for (String str2 = "x86";; str2 = "x64") {
      do
      {
        logFine(Internal.class, "os.arch=" + str2);
        return str2;
        str2 = str1.toLowerCase(Locale.US);
      } while ((!"win32".equals(paramString)) || (!"amd64".equals(str2)));
    }
  }
  
  private static String getClassUrl()
  {
    String str1 = Internal.class.getName().replace('.', '/') + ".class";
    URL localURL = Internal.class.getClassLoader().getResource(str1);
    if (localURL == null) {
      return null;
    }
    String str2 = localURL.toString();
    try
    {
      String str3 = URLDecoder.decode(str2, "UTF-8");
      return str3;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      recoverableError(Internal.class, localUnsupportedEncodingException.getMessage(), true);
    }
    return str2;
  }
  
  private static String getDefaultLibPath(String paramString)
  {
    return getDefaultLibPath(System.getProperty("java.library.path"), paramString);
  }
  
  static String getDefaultLibPath(String paramString1, String paramString2)
  {
    File localFile1 = getJarFileFromClassUrl(paramString2);
    String str;
    if (localFile1 == null)
    {
      str = null;
      return str;
    }
    File localFile2 = localFile1.getParentFile();
    if ((localFile2.getPath().length() == 0) || (!localFile2.isDirectory())) {
      return null;
    }
    if (paramString1 == null) {
      paramString1 = "";
    }
    int i = File.pathSeparatorChar;
    int j = paramString1.length();
    int k = 0;
    if (j > 0) {}
    int i1;
    for (int m = 0;; m = i1 + 1)
    {
      int n = paramString1.length();
      k = 0;
      if (m < n)
      {
        i1 = paramString1.indexOf(i, m);
        if (i1 < 0) {
          i1 = paramString1.length();
        }
        if (localFile2.equals(new File(paramString1.substring(m, i1)))) {
          k = 1;
        }
      }
      else
      {
        str = localFile2.getPath();
        if (k == 0) {
          break;
        }
        return null;
      }
    }
  }
  
  private static String getForcedPath()
  {
    String str = System.getProperty("sqlite4java.library.path");
    if ((str == null) || (str.length() == 0)) {
      return null;
    }
    return str.replace('\\', File.separatorChar).replace('/', File.separatorChar);
  }
  
  private static File getJarFileFromClassUrl(String paramString)
  {
    File localFile;
    if (paramString == null) {
      localFile = null;
    }
    do
    {
      return localFile;
      if (!paramString.startsWith("jar:file:")) {
        return null;
      }
      String str = paramString.substring("jar:file:".length());
      int i = str.lastIndexOf('!');
      if (i < 0) {
        return null;
      }
      localFile = new File(str.substring(0, i));
    } while (localFile.isFile());
    return null;
  }
  
  private static String getLibraryVersionMessage()
  {
    String str1 = _SQLiteSwigged.sqlite3_libversion();
    String str2 = _SQLiteManual.wrapper_version();
    return "loaded sqlite " + str1 + ", wrapper " + str2;
  }
  
  private static String getOs()
  {
    String str1 = System.getProperty("os.name");
    String str2;
    if (str1 == null)
    {
      logWarn(Internal.class, "os.name is null");
      str2 = "linux";
    }
    for (;;)
    {
      logFine(Internal.class, "os.name=" + str1 + "; os=" + str2);
      return str2;
      str1 = str1.toLowerCase(Locale.US);
      if ((str1.startsWith("mac")) || (str1.startsWith("darwin")) || (str1.startsWith("os x")))
      {
        str2 = "osx";
      }
      else if (str1.startsWith("windows"))
      {
        str2 = "win32";
      }
      else
      {
        String str3 = System.getProperty("java.runtime.name");
        if ((str3 != null) && (str3.toLowerCase(Locale.US).contains("android"))) {
          str2 = "android";
        } else {
          str2 = "linux";
        }
      }
    }
  }
  
  static String getVersionSuffix(String paramString)
  {
    File localFile = getJarFileFromClassUrl(paramString);
    if (localFile == null) {}
    String str1;
    int i;
    int j;
    do
    {
      String str2;
      do
      {
        return null;
        str1 = localFile.getName();
        str2 = str1.toLowerCase(Locale.US);
      } while ((!str2.startsWith("sqlite4java")) || (!str2.endsWith(".jar")));
      i = "sqlite4java".length();
      j = -4 + str1.length();
    } while ((i + 1 >= j) || (str1.charAt(i) != '-'));
    return str1.substring(i, j);
  }
  
  static boolean isFineLogging()
  {
    return logger.isLoggable(Level.FINE);
  }
  
  static Throwable loadLibraryX()
  {
    Throwable localThrowable;
    if (checkLoaded() == null) {
      localThrowable = null;
    }
    label227:
    label320:
    label352:
    label368:
    label433:
    label468:
    do
    {
      return localThrowable;
      if ("true".equalsIgnoreCase(System.getProperty("sqlite4java.debug"))) {
        logger.setLevel(Level.FINE);
      }
      String str1 = getClassUrl();
      String str2 = getDefaultLibPath(str1);
      String str3 = getVersionSuffix(str1);
      String str4 = getForcedPath();
      String str6;
      String str7;
      String str5;
      List localList;
      Throwable[] arrayOfThrowable;
      boolean bool;
      if (isFineLogging())
      {
        logFine(Internal.class, "loading library");
        logFine(Internal.class, "java.library.path=" + System.getProperty("java.library.path"));
        logFine(Internal.class, "sqlite4java.library.path=" + System.getProperty("sqlite4java.library.path"));
        logFine(Internal.class, "cwd=" + new File(".").getAbsolutePath());
        StringBuilder localStringBuilder1 = new StringBuilder().append("default path=");
        if (str2 == null)
        {
          str6 = "null ";
          logFine(Internal.class, str6);
          StringBuilder localStringBuilder2 = new StringBuilder().append("forced path=");
          if (str4 != null) {
            break label352;
          }
          str7 = "null ";
          logFine(Internal.class, str7);
        }
      }
      else
      {
        str5 = getOs();
        localList = collectLibraryNames(str3, str5, getArch(str5));
        arrayOfThrowable = new Throwable[] { null };
        bool = false;
        if (str4 == null) {
          break label368;
        }
        Iterator localIterator3 = localList.iterator();
        while (localIterator3.hasNext())
        {
          bool = tryLoadFromPath((String)localIterator3.next(), str5, str4, arrayOfThrowable);
          if (bool) {
            break label433;
          }
        }
      }
      for (;;)
      {
        if (!bool) {
          break label468;
        }
        logInfo(Internal.class, getLibraryVersionMessage());
        return null;
        str6 = new File(str2).getAbsolutePath();
        break;
        str7 = new File(str4).getAbsolutePath();
        break label227;
        bool = false;
        if (str2 != null)
        {
          Iterator localIterator2 = localList.iterator();
          do
          {
            if (!localIterator2.hasNext()) {
              break;
            }
            bool = tryLoadFromPath((String)localIterator2.next(), str5, str2, arrayOfThrowable);
          } while (!bool);
        }
        if (!bool)
        {
          Iterator localIterator1 = localList.iterator();
          if (localIterator1.hasNext())
          {
            bool = tryLoadFromSystemPath((String)localIterator1.next(), arrayOfThrowable);
            if (!bool) {
              break label320;
            }
          }
        }
      }
      localThrowable = arrayOfThrowable[0];
    } while (localThrowable != null);
    return new SQLiteException(-91, "sqlite4java cannot find native library");
  }
  
  static void log(Level paramLevel, Object paramObject1, Object paramObject2, Throwable paramThrowable)
  {
    if (!logger.isLoggable(paramLevel)) {
      return;
    }
    StringBuilder localStringBuilder = new StringBuilder("[sqlite] ");
    if (paramObject1 != null)
    {
      if (!(paramObject1 instanceof Class)) {
        break label96;
      }
      String str = ((Class)paramObject1).getName();
      localStringBuilder.append(str.substring(1 + str.lastIndexOf('.')));
    }
    for (;;)
    {
      localStringBuilder.append(": ");
      if (paramObject2 != null) {
        localStringBuilder.append(paramObject2);
      }
      logger.log(paramLevel, localStringBuilder.toString(), paramThrowable);
      return;
      label96:
      localStringBuilder.append(paramObject1);
    }
  }
  
  static void logFine(Object paramObject1, Object paramObject2)
  {
    log(Level.FINE, paramObject1, paramObject2, null);
  }
  
  static void logInfo(Object paramObject1, Object paramObject2)
  {
    log(Level.INFO, paramObject1, paramObject2, null);
  }
  
  static void logWarn(Object paramObject1, Object paramObject2)
  {
    log(Level.WARNING, paramObject1, paramObject2, null);
  }
  
  static int nextConnectionNumber()
  {
    return lastConnectionNumber.incrementAndGet();
  }
  
  static void recoverableError(Object paramObject, String paramString, boolean paramBoolean)
  {
    logWarn(paramObject, paramString);
    assert (!paramBoolean) : (paramObject + " " + paramString);
  }
  
  private static boolean tryLoadFromPath(String paramString1, String paramString2, String paramString3, Throwable[] paramArrayOfThrowable)
  {
    String str1 = System.mapLibraryName(paramString1);
    if ((paramString2.equals("osx")) && (str1.endsWith(".jnilib"))) {
      str1 = str1.substring(0, str1.length() - ".jnilib".length()) + ".dylib";
    }
    File localFile = new File(new File(paramString3), str1);
    logFine(Internal.class, "checking " + localFile);
    if ((!localFile.isFile()) || (!localFile.canRead())) {
      return false;
    }
    String str2 = paramString1 + " from " + localFile;
    logFine(Internal.class, "trying to load " + str2);
    try
    {
      System.load(localFile.getAbsolutePath());
      boolean bool = verifyLoading(paramArrayOfThrowable, str2);
      return bool;
    }
    catch (Throwable localThrowable)
    {
      logFine(Internal.class, "cannot load " + str2 + ": " + localThrowable);
      updateLoadFailureReason(paramArrayOfThrowable, localThrowable);
    }
    return false;
  }
  
  private static boolean tryLoadFromSystemPath(String paramString, Throwable[] paramArrayOfThrowable)
  {
    logFine(Internal.class, "trying to load " + paramString);
    try
    {
      System.loadLibrary(paramString);
      boolean bool = verifyLoading(paramArrayOfThrowable, paramString + " from system path");
      return bool;
    }
    catch (Throwable localThrowable)
    {
      logFine(Internal.class, "cannot load " + paramString + ": " + localThrowable);
      updateLoadFailureReason(paramArrayOfThrowable, localThrowable);
    }
    return false;
  }
  
  private static void updateLoadFailureReason(Throwable[] paramArrayOfThrowable, Throwable paramThrowable)
  {
    if (paramArrayOfThrowable[0] == null) {}
    String str2;
    do
    {
      String str1;
      do
      {
        paramArrayOfThrowable[0] = paramThrowable;
        do
        {
          return;
        } while (paramThrowable == null);
        str1 = paramArrayOfThrowable[0].getMessage();
      } while ((str1 == null) || (!str1.contains("java.library.path")));
      str2 = paramThrowable.getMessage();
    } while ((str2 == null) || (str2.contains("java.library.path")));
    paramArrayOfThrowable[0] = paramThrowable;
  }
  
  private static boolean verifyLoading(Throwable[] paramArrayOfThrowable, String paramString)
  {
    logInfo(Internal.class, "loaded " + paramString);
    LinkageError localLinkageError = checkLoaded();
    if (localLinkageError == null) {
      return true;
    }
    logFine(Internal.class, "cannot use " + paramString + ": " + localLinkageError);
    updateLoadFailureReason(paramArrayOfThrowable, localLinkageError);
    return false;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/almworks/sqlite4java/Internal.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */