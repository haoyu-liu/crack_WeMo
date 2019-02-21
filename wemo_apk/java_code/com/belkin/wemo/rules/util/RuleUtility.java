package com.belkin.wemo.rules.util;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import com.belkin.wemo.WeMo;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.ZipParameters;
import org.apache.commons.io.IOUtils;

public class RuleUtility
{
  public static final String TAG = "RuleUtility";
  private boolean dbMigration = true;
  private Context mContext;
  private String unZipLocation;
  
  public RuleUtility(Context paramContext)
  {
    this.mContext = paramContext;
  }
  
  private void dirChecker(String paramString)
  {
    File localFile = new File(this.unZipLocation + paramString);
    if (!localFile.isDirectory()) {
      localFile.mkdirs();
    }
  }
  
  public static File getStoragePath()
  {
    Context localContext = WeMo.INSTANCE.getContext();
    if (SDKLogUtils.isDebug()) {
      return localContext.getExternalFilesDir("Wemo");
    }
    return localContext.getFilesDir();
  }
  
  public static boolean isLongPressRuleSupportedLS(DeviceInformation paramDeviceInformation)
  {
    boolean bool1 = paramDeviceInformation.isAttributePresent("longPressRuleDeviceCnt");
    boolean bool2 = false;
    if (bool1) {
      bool2 = true;
    }
    return bool2;
  }
  
  private void migrateDB(Context paramContext)
  {
    File localFile = new File(getTempDBPath() + "pluginrules2.db");
    if (!localFile.exists()) {}
    try
    {
      localFile.createNewFile();
      FileOutputStream localFileOutputStream = new FileOutputStream(localFile);
      FileInputStream localFileInputStream = new FileInputStream(getTempDBPath() + "pluginrules2.db");
      if (localFileInputStream != null)
      {
        IOUtils.copy(localFileInputStream, localFileOutputStream);
        localFileOutputStream.close();
        localFileInputStream.close();
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  /* Error */
  public String copyDataBase(String paramString1, String paramString2, String paramString3)
  {
    // Byte code:
    //   0: ldc 127
    //   2: astore 4
    //   4: ldc 8
    //   6: ldc -127
    //   8: invokestatic 133	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   11: new 26	java/io/File
    //   14: dup
    //   15: aload_1
    //   16: invokespecial 41	java/io/File:<init>	(Ljava/lang/String;)V
    //   19: astore 6
    //   21: aconst_null
    //   22: astore 7
    //   24: aconst_null
    //   25: astore 8
    //   27: new 107	java/io/FileInputStream
    //   30: dup
    //   31: aload 6
    //   33: invokespecial 134	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   36: astore 9
    //   38: new 102	java/io/FileOutputStream
    //   41: dup
    //   42: aload_2
    //   43: invokespecial 135	java/io/FileOutputStream:<init>	(Ljava/lang/String;)V
    //   46: astore 10
    //   48: aload 9
    //   50: aload 10
    //   52: invokestatic 114	org/apache/commons/io/IOUtils:copy	(Ljava/io/InputStream;Ljava/io/OutputStream;)I
    //   55: pop
    //   56: aload 10
    //   58: invokevirtual 138	java/io/FileOutputStream:flush	()V
    //   61: aload 10
    //   63: invokevirtual 117	java/io/FileOutputStream:close	()V
    //   66: aload 9
    //   68: invokevirtual 118	java/io/FileInputStream:close	()V
    //   71: ldc 8
    //   73: ldc -116
    //   75: invokestatic 133	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   78: aload_3
    //   79: ldc -114
    //   81: invokevirtual 147	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   84: ifeq +13 -> 97
    //   87: aload_0
    //   88: invokevirtual 150	com/belkin/wemo/rules/util/RuleUtility:getPragmaVersion	()Ljava/lang/String;
    //   91: astore 19
    //   93: aload 19
    //   95: astore 4
    //   97: aload 4
    //   99: areturn
    //   100: astore 18
    //   102: aload 18
    //   104: invokevirtual 151	java/io/IOException:printStackTrace	()V
    //   107: goto -10 -> 97
    //   110: astore 11
    //   112: aload 11
    //   114: invokevirtual 121	java/lang/Exception:printStackTrace	()V
    //   117: aload 8
    //   119: invokevirtual 117	java/io/FileOutputStream:close	()V
    //   122: aload 7
    //   124: invokevirtual 118	java/io/FileInputStream:close	()V
    //   127: ldc 8
    //   129: ldc -116
    //   131: invokestatic 133	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   134: aload_3
    //   135: ldc -114
    //   137: invokevirtual 147	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   140: ifeq -43 -> 97
    //   143: aload_0
    //   144: invokevirtual 150	com/belkin/wemo/rules/util/RuleUtility:getPragmaVersion	()Ljava/lang/String;
    //   147: astore 16
    //   149: aload 16
    //   151: astore 4
    //   153: goto -56 -> 97
    //   156: astore 15
    //   158: aload 15
    //   160: invokevirtual 151	java/io/IOException:printStackTrace	()V
    //   163: goto -66 -> 97
    //   166: astore 5
    //   168: aload 4
    //   170: areturn
    //   171: astore 12
    //   173: aload 8
    //   175: invokevirtual 117	java/io/FileOutputStream:close	()V
    //   178: aload 7
    //   180: invokevirtual 118	java/io/FileInputStream:close	()V
    //   183: ldc 8
    //   185: ldc -116
    //   187: invokestatic 133	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   190: aload_3
    //   191: ldc -114
    //   193: invokevirtual 147	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   196: ifeq +13 -> 209
    //   199: aload_0
    //   200: invokevirtual 150	com/belkin/wemo/rules/util/RuleUtility:getPragmaVersion	()Ljava/lang/String;
    //   203: astore 14
    //   205: aload 14
    //   207: astore 4
    //   209: aload 12
    //   211: athrow
    //   212: astore 13
    //   214: aload 13
    //   216: invokevirtual 151	java/io/IOException:printStackTrace	()V
    //   219: goto -10 -> 209
    //   222: astore 12
    //   224: aload 9
    //   226: astore 7
    //   228: aconst_null
    //   229: astore 8
    //   231: goto -58 -> 173
    //   234: astore 12
    //   236: aload 10
    //   238: astore 8
    //   240: aload 9
    //   242: astore 7
    //   244: goto -71 -> 173
    //   247: astore 11
    //   249: aload 9
    //   251: astore 7
    //   253: aconst_null
    //   254: astore 8
    //   256: goto -144 -> 112
    //   259: astore 11
    //   261: aload 10
    //   263: astore 8
    //   265: aload 9
    //   267: astore 7
    //   269: goto -157 -> 112
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	272	0	this	RuleUtility
    //   0	272	1	paramString1	String
    //   0	272	2	paramString2	String
    //   0	272	3	paramString3	String
    //   2	206	4	localObject1	Object
    //   166	1	5	localException1	Exception
    //   19	13	6	localFile	File
    //   22	246	7	localObject2	Object
    //   25	239	8	localObject3	Object
    //   36	230	9	localFileInputStream	FileInputStream
    //   46	216	10	localFileOutputStream	FileOutputStream
    //   110	3	11	localException2	Exception
    //   247	1	11	localException3	Exception
    //   259	1	11	localException4	Exception
    //   171	39	12	localObject4	Object
    //   222	1	12	localObject5	Object
    //   234	1	12	localObject6	Object
    //   212	3	13	localIOException1	java.io.IOException
    //   203	3	14	str1	String
    //   156	3	15	localIOException2	java.io.IOException
    //   147	3	16	str2	String
    //   100	3	18	localIOException3	java.io.IOException
    //   91	3	19	str3	String
    // Exception table:
    //   from	to	target	type
    //   61	93	100	java/io/IOException
    //   27	38	110	java/lang/Exception
    //   117	149	156	java/io/IOException
    //   4	21	166	java/lang/Exception
    //   61	93	166	java/lang/Exception
    //   102	107	166	java/lang/Exception
    //   117	149	166	java/lang/Exception
    //   158	163	166	java/lang/Exception
    //   173	205	166	java/lang/Exception
    //   209	212	166	java/lang/Exception
    //   214	219	166	java/lang/Exception
    //   27	38	171	finally
    //   112	117	171	finally
    //   173	205	212	java/io/IOException
    //   38	48	222	finally
    //   48	61	234	finally
    //   38	48	247	java/lang/Exception
    //   48	61	259	java/lang/Exception
  }
  
  public boolean dbExist()
  {
    return new File(getStoragePath() + "/databases/").exists();
  }
  
  public String getLocalDBPath()
  {
    return SDKRulesConstants.RULES_DB_PATH;
  }
  
  public String getPragmaVersion()
  {
    str = "";
    localSQLiteDatabase = null;
    try
    {
      localSQLiteDatabase = SQLiteDatabase.openDatabase(getLocalDBPath() + "pluginrules2.db", null, 16);
      if (localSQLiteDatabase.getVersion() == 0)
      {
        SDKLogUtils.infoLog("RuleUtility", "got DBVersion equal to 0");
        localSQLiteDatabase.setVersion(9);
      }
      str = Integer.toString(localSQLiteDatabase.getVersion());
      SDKLogUtils.infoLog("RuleUtility", "getPragmaVersion Pragma version is : " + str);
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      return str;
    }
    finally
    {
      if (localSQLiteDatabase == null) {
        break label122;
      }
      localSQLiteDatabase.close();
    }
    return str;
  }
  
  public String getTempDBPath()
  {
    return "data/data/" + SDKRulesConstants.PKG_NAME + "/databases/";
  }
  
  public String unzip(String paramString1, String paramString2)
  {
    Object localObject = "";
    this.unZipLocation = paramString2;
    dirChecker("");
    SDKLogUtils.infoLog("RuleUtility", "inside unzip");
    try
    {
      new ZipFile(paramString1).extractFile("temppluginRules.db", paramString2);
      String str = copyDataBase(paramString2 + "temppluginRules.db", getLocalDBPath() + "pluginrules2.db", "true");
      localObject = str;
    }
    catch (ZipException localZipException)
    {
      for (;;)
      {
        localZipException.printStackTrace();
      }
    }
    SDKLogUtils.infoLog("RuleUtility", " ########### Value of migration : " + this.dbMigration);
    if (this.dbMigration)
    {
      SDKLogUtils.infoLog("RuleUtility", "....Inside....");
      migrateDB(this.mContext);
    }
    return (String)localObject;
  }
  
  public void zip(String[] paramArrayOfString, String paramString)
  {
    SDKLogUtils.infoLog("RuleUtility", "inside zip");
    try
    {
      SDKLogUtils.infoLog("RuleUtility", " zipLocation : " + paramString);
      ZipFile localZipFile = new ZipFile(paramString);
      ZipParameters localZipParameters = new ZipParameters();
      localZipParameters.setCompressionMethod(8);
      localZipParameters.setCompressionLevel(5);
      localZipFile.addFile(new File(paramArrayOfString[0]), localZipParameters);
      return;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog("RuleUtility", "" + localException.getMessage());
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/util/RuleUtility.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */