package com.belkin.rules.utils;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import net.lingala.zip4j.model.ZipParameters;
import org.apache.commons.io.IOUtils;

public class RuleUtility
{
  private static int BUFFER = 1024;
  private static final String TAG = RuleUtility.class.getSimpleName();
  private Context context;
  private String dbPath;
  
  public RuleUtility(Context paramContext)
  {
    this.context = paramContext;
  }
  
  public static void download(InputStream paramInputStream, OutputStream paramOutputStream)
    throws IOException
  {
    IOUtils.copy(paramInputStream, paramOutputStream);
    paramInputStream.close();
    paramOutputStream.close();
  }
  
  public static void downloadFromUrl(byte[] paramArrayOfByte, String paramString, Context paramContext)
    throws IOException
  {
    FileOutputStream localFileOutputStream = paramContext.openFileOutput("rulesDBZippedTemp", 0);
    download(new ByteArrayInputStream(paramArrayOfByte), localFileOutputStream);
    unzip(paramContext.getFilesDir().getAbsolutePath() + File.separator + "rulesDBZippedTemp", paramString);
  }
  
  public static void unzip(String paramString1, String paramString2)
    throws IOException
  {
    BufferedInputStream localBufferedInputStream;
    FileOutputStream localFileOutputStream;
    BufferedOutputStream localBufferedOutputStream;
    java.util.zip.ZipFile localZipFile;
    for (;;)
    {
      try
      {
        SDKLogUtils.debugLog(TAG, "Extracting file. \nFROM: " + paramString1 + "\nTO: " + paramString2);
        localBufferedInputStream = null;
        localFileOutputStream = null;
        localBufferedOutputStream = null;
        localZipFile = new java.util.zip.ZipFile(paramString1);
        Enumeration localEnumeration = localZipFile.entries();
        if (!localEnumeration.hasMoreElements()) {
          break;
        }
        localBufferedInputStream = new BufferedInputStream(localZipFile.getInputStream((ZipEntry)localEnumeration.nextElement()));
        byte[] arrayOfByte = new byte[BUFFER];
        localFileOutputStream = new FileOutputStream(paramString2);
        localBufferedOutputStream = new BufferedOutputStream(localFileOutputStream, BUFFER);
        int i = localBufferedInputStream.read(arrayOfByte, 0, BUFFER);
        if (i != -1) {
          localBufferedOutputStream.write(arrayOfByte, 0, i);
        } else {
          localBufferedOutputStream.flush();
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        return;
      }
    }
    localZipFile.close();
    localBufferedOutputStream.close();
    localFileOutputStream.close();
    localBufferedInputStream.close();
  }
  
  /* Error */
  public String copyDataBase(String paramString1, String paramString2, String paramString3)
  {
    // Byte code:
    //   0: ldc -96
    //   2: astore 4
    //   4: getstatic 166	java/lang/System:out	Ljava/io/PrintStream;
    //   7: ldc -88
    //   9: invokevirtual 173	java/io/PrintStream:println	(Ljava/lang/String;)V
    //   12: new 73	java/io/File
    //   15: dup
    //   16: aload_1
    //   17: invokespecial 174	java/io/File:<init>	(Ljava/lang/String;)V
    //   20: astore 6
    //   22: aconst_null
    //   23: astore 7
    //   25: aconst_null
    //   26: astore 8
    //   28: new 176	java/io/FileInputStream
    //   31: dup
    //   32: aload 6
    //   34: invokespecial 179	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   37: astore 9
    //   39: new 133	java/io/FileOutputStream
    //   42: dup
    //   43: aload_2
    //   44: invokespecial 134	java/io/FileOutputStream:<init>	(Ljava/lang/String;)V
    //   47: astore 10
    //   49: aload 9
    //   51: aload 10
    //   53: invokestatic 39	org/apache/commons/io/IOUtils:copy	(Ljava/io/InputStream;Ljava/io/OutputStream;)I
    //   56: pop
    //   57: aload 10
    //   59: invokevirtual 180	java/io/FileOutputStream:flush	()V
    //   62: aload 10
    //   64: invokevirtual 156	java/io/FileOutputStream:close	()V
    //   67: aload 9
    //   69: invokevirtual 181	java/io/FileInputStream:close	()V
    //   72: getstatic 166	java/lang/System:out	Ljava/io/PrintStream;
    //   75: ldc -73
    //   77: invokevirtual 173	java/io/PrintStream:println	(Ljava/lang/String;)V
    //   80: aload_3
    //   81: ldc -71
    //   83: invokevirtual 191	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   86: ifeq +13 -> 99
    //   89: aload_0
    //   90: invokevirtual 194	com/belkin/rules/utils/RuleUtility:getPragmaVersion	()Ljava/lang/String;
    //   93: astore 19
    //   95: aload 19
    //   97: astore 4
    //   99: aload 4
    //   101: areturn
    //   102: astore 18
    //   104: aload 18
    //   106: invokevirtual 195	java/io/IOException:printStackTrace	()V
    //   109: goto -10 -> 99
    //   112: astore 11
    //   114: aload 11
    //   116: invokevirtual 150	java/lang/Exception:printStackTrace	()V
    //   119: aload 8
    //   121: invokevirtual 156	java/io/FileOutputStream:close	()V
    //   124: aload 7
    //   126: invokevirtual 181	java/io/FileInputStream:close	()V
    //   129: getstatic 166	java/lang/System:out	Ljava/io/PrintStream;
    //   132: ldc -73
    //   134: invokevirtual 173	java/io/PrintStream:println	(Ljava/lang/String;)V
    //   137: aload_3
    //   138: ldc -71
    //   140: invokevirtual 191	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   143: ifeq -44 -> 99
    //   146: aload_0
    //   147: invokevirtual 194	com/belkin/rules/utils/RuleUtility:getPragmaVersion	()Ljava/lang/String;
    //   150: astore 16
    //   152: aload 16
    //   154: astore 4
    //   156: goto -57 -> 99
    //   159: astore 15
    //   161: aload 15
    //   163: invokevirtual 195	java/io/IOException:printStackTrace	()V
    //   166: goto -67 -> 99
    //   169: astore 5
    //   171: aload 4
    //   173: areturn
    //   174: astore 12
    //   176: aload 8
    //   178: invokevirtual 156	java/io/FileOutputStream:close	()V
    //   181: aload 7
    //   183: invokevirtual 181	java/io/FileInputStream:close	()V
    //   186: getstatic 166	java/lang/System:out	Ljava/io/PrintStream;
    //   189: ldc -73
    //   191: invokevirtual 173	java/io/PrintStream:println	(Ljava/lang/String;)V
    //   194: aload_3
    //   195: ldc -71
    //   197: invokevirtual 191	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   200: ifeq +13 -> 213
    //   203: aload_0
    //   204: invokevirtual 194	com/belkin/rules/utils/RuleUtility:getPragmaVersion	()Ljava/lang/String;
    //   207: astore 14
    //   209: aload 14
    //   211: astore 4
    //   213: aload 12
    //   215: athrow
    //   216: astore 13
    //   218: aload 13
    //   220: invokevirtual 195	java/io/IOException:printStackTrace	()V
    //   223: goto -10 -> 213
    //   226: astore 12
    //   228: aload 9
    //   230: astore 7
    //   232: aconst_null
    //   233: astore 8
    //   235: goto -59 -> 176
    //   238: astore 12
    //   240: aload 10
    //   242: astore 8
    //   244: aload 9
    //   246: astore 7
    //   248: goto -72 -> 176
    //   251: astore 11
    //   253: aload 9
    //   255: astore 7
    //   257: aconst_null
    //   258: astore 8
    //   260: goto -146 -> 114
    //   263: astore 11
    //   265: aload 10
    //   267: astore 8
    //   269: aload 9
    //   271: astore 7
    //   273: goto -159 -> 114
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	276	0	this	RuleUtility
    //   0	276	1	paramString1	String
    //   0	276	2	paramString2	String
    //   0	276	3	paramString3	String
    //   2	210	4	localObject1	Object
    //   169	1	5	localException1	Exception
    //   20	13	6	localFile	File
    //   23	249	7	localObject2	Object
    //   26	242	8	localObject3	Object
    //   37	233	9	localFileInputStream	java.io.FileInputStream
    //   47	219	10	localFileOutputStream	FileOutputStream
    //   112	3	11	localException2	Exception
    //   251	1	11	localException3	Exception
    //   263	1	11	localException4	Exception
    //   174	40	12	localObject4	Object
    //   226	1	12	localObject5	Object
    //   238	1	12	localObject6	Object
    //   216	3	13	localIOException1	IOException
    //   207	3	14	str1	String
    //   159	3	15	localIOException2	IOException
    //   150	3	16	str2	String
    //   102	3	18	localIOException3	IOException
    //   93	3	19	str3	String
    // Exception table:
    //   from	to	target	type
    //   62	95	102	java/io/IOException
    //   28	39	112	java/lang/Exception
    //   119	152	159	java/io/IOException
    //   4	22	169	java/lang/Exception
    //   62	95	169	java/lang/Exception
    //   104	109	169	java/lang/Exception
    //   119	152	169	java/lang/Exception
    //   161	166	169	java/lang/Exception
    //   176	209	169	java/lang/Exception
    //   213	216	169	java/lang/Exception
    //   218	223	169	java/lang/Exception
    //   28	39	174	finally
    //   114	119	174	finally
    //   176	209	216	java/io/IOException
    //   39	49	226	finally
    //   49	62	238	finally
    //   39	49	251	java/lang/Exception
    //   49	62	263	java/lang/Exception
  }
  
  public String getLocalDBPath()
  {
    return this.dbPath;
  }
  
  public String getPragmaVersion()
  {
    String str = "";
    try
    {
      SQLiteDatabase localSQLiteDatabase = SQLiteDatabase.openDatabase(getLocalDBPath() + "pluginrules2.db", null, 268435472);
      if (localSQLiteDatabase.getVersion() == 0)
      {
        Log.v("RuleUtility", "got DBVersion equal to 0");
        localSQLiteDatabase.setVersion(9);
      }
      str = Integer.toString(localSQLiteDatabase.getVersion());
      Log.v("RuleUtility", "getPragmaVersion Pragma version is : " + str);
      localSQLiteDatabase.close();
      return str;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog(TAG, "Exception while opening DB: ", localException);
    }
    return str;
  }
  
  public void setDBPath(String paramString)
  {
    this.dbPath = paramString;
  }
  
  public void zip(String[] paramArrayOfString, String paramString)
  {
    System.out.println("inside zip");
    try
    {
      System.out.println(" zipLocation : " + paramString);
      net.lingala.zip4j.core.ZipFile localZipFile = new net.lingala.zip4j.core.ZipFile(paramString);
      ZipParameters localZipParameters = new ZipParameters();
      localZipParameters.setCompressionMethod(8);
      localZipParameters.setCompressionLevel(5);
      localZipFile.addFile(new File(paramArrayOfString[0]), localZipParameters);
      return;
    }
    catch (Exception localException)
    {
      Log.e("RuleUtility", "zip", localException);
      localException.printStackTrace();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/rules/utils/RuleUtility.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */