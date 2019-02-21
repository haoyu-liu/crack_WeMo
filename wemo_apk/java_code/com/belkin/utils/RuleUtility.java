package com.belkin.utils;

import android.content.Context;
import android.content.res.AssetManager;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.location.Address;
import android.location.Geocoder;
import android.text.TextUtils;
import android.util.Base64;
import com.belkin.rules.utils.RulesConstants;
import com.belkin.wemo.WeMo;
import com.belkin.wemo.cache.utils.SDKNetworkUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import com.luckycatlabs.sunrisesunset.SunriseSunsetCalculator;
import com.luckycatlabs.sunrisesunset.dto.Location;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.SimpleTimeZone;
import java.util.TimeZone;
import java.util.zip.ZipEntry;
import net.lingala.zip4j.model.ZipParameters;
import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONException;

public class RuleUtility
{
  public static final int RULE_DB_SIZE_FOR_VACUUM = 102400;
  public static final String TAG = "RuleUtility";
  private static Object lock = new Object();
  private SunriseSunsetCalculator calculator;
  private Context context;
  private boolean dbMigration = false;
  private String[] firmWareNumber;
  private int firmwareVer;
  private GPSTracker gps;
  private double latitude = 0.0D;
  private Location location;
  private double longitude = 0.0D;
  private SDKNetworkUtils networkUtil;
  private SharePreferences sharePreference;
  private JSONArray sunriseSunsetTime;
  private String unZipLocation;
  
  public RuleUtility(Context paramContext)
  {
    this.context = paramContext;
    this.networkUtil = new SDKNetworkUtils(paramContext);
    this.sharePreference = new SharePreferences(paramContext);
  }
  
  /* Error */
  public static void copyDBFile(String paramString1, String paramString2)
  {
    // Byte code:
    //   0: new 71	java/io/File
    //   3: dup
    //   4: aload_0
    //   5: invokespecial 74	java/io/File:<init>	(Ljava/lang/String;)V
    //   8: astore_2
    //   9: aconst_null
    //   10: astore_3
    //   11: aconst_null
    //   12: astore 4
    //   14: new 76	java/io/FileInputStream
    //   17: dup
    //   18: aload_2
    //   19: invokespecial 79	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   22: astore 5
    //   24: new 81	java/io/FileOutputStream
    //   27: dup
    //   28: aload_1
    //   29: invokespecial 82	java/io/FileOutputStream:<init>	(Ljava/lang/String;)V
    //   32: astore 6
    //   34: aload 5
    //   36: aload 6
    //   38: invokestatic 88	org/apache/commons/io/IOUtils:copy	(Ljava/io/InputStream;Ljava/io/OutputStream;)I
    //   41: pop
    //   42: aload 6
    //   44: invokevirtual 91	java/io/FileOutputStream:flush	()V
    //   47: aload 6
    //   49: ifnull +8 -> 57
    //   52: aload 6
    //   54: invokevirtual 94	java/io/FileOutputStream:close	()V
    //   57: aload 5
    //   59: ifnull +8 -> 67
    //   62: aload 5
    //   64: invokevirtual 95	java/io/FileInputStream:close	()V
    //   67: ldc 11
    //   69: ldc 97
    //   71: invokestatic 102	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   74: return
    //   75: astore 12
    //   77: ldc 11
    //   79: ldc 104
    //   81: aload 12
    //   83: invokestatic 108	com/belkin/utils/LogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   86: return
    //   87: astore 7
    //   89: ldc 11
    //   91: ldc 110
    //   93: aload 7
    //   95: invokestatic 108	com/belkin/utils/LogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   98: aload 4
    //   100: ifnull +8 -> 108
    //   103: aload 4
    //   105: invokevirtual 94	java/io/FileOutputStream:close	()V
    //   108: aload_3
    //   109: ifnull +7 -> 116
    //   112: aload_3
    //   113: invokevirtual 95	java/io/FileInputStream:close	()V
    //   116: ldc 11
    //   118: ldc 97
    //   120: invokestatic 102	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   123: return
    //   124: astore 10
    //   126: ldc 11
    //   128: ldc 104
    //   130: aload 10
    //   132: invokestatic 108	com/belkin/utils/LogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   135: return
    //   136: astore 8
    //   138: aload 4
    //   140: ifnull +8 -> 148
    //   143: aload 4
    //   145: invokevirtual 94	java/io/FileOutputStream:close	()V
    //   148: aload_3
    //   149: ifnull +7 -> 156
    //   152: aload_3
    //   153: invokevirtual 95	java/io/FileInputStream:close	()V
    //   156: ldc 11
    //   158: ldc 97
    //   160: invokestatic 102	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   163: aload 8
    //   165: athrow
    //   166: astore 9
    //   168: ldc 11
    //   170: ldc 104
    //   172: aload 9
    //   174: invokestatic 108	com/belkin/utils/LogUtils:errorLog	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   177: goto -14 -> 163
    //   180: astore 8
    //   182: aload 5
    //   184: astore_3
    //   185: aconst_null
    //   186: astore 4
    //   188: goto -50 -> 138
    //   191: astore 8
    //   193: aload 6
    //   195: astore 4
    //   197: aload 5
    //   199: astore_3
    //   200: goto -62 -> 138
    //   203: astore 7
    //   205: aload 5
    //   207: astore_3
    //   208: aconst_null
    //   209: astore 4
    //   211: goto -122 -> 89
    //   214: astore 7
    //   216: aload 6
    //   218: astore 4
    //   220: aload 5
    //   222: astore_3
    //   223: goto -134 -> 89
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	226	0	paramString1	String
    //   0	226	1	paramString2	String
    //   8	11	2	localFile	File
    //   10	213	3	localObject1	Object
    //   12	207	4	localObject2	Object
    //   22	199	5	localFileInputStream	FileInputStream
    //   32	185	6	localFileOutputStream	FileOutputStream
    //   87	7	7	localException1	Exception
    //   203	1	7	localException2	Exception
    //   214	1	7	localException3	Exception
    //   136	28	8	localObject3	Object
    //   180	1	8	localObject4	Object
    //   191	1	8	localObject5	Object
    //   166	7	9	localIOException1	IOException
    //   124	7	10	localIOException2	IOException
    //   75	7	12	localIOException3	IOException
    // Exception table:
    //   from	to	target	type
    //   52	57	75	java/io/IOException
    //   62	67	75	java/io/IOException
    //   67	74	75	java/io/IOException
    //   14	24	87	java/lang/Exception
    //   103	108	124	java/io/IOException
    //   112	116	124	java/io/IOException
    //   116	123	124	java/io/IOException
    //   14	24	136	finally
    //   89	98	136	finally
    //   143	148	166	java/io/IOException
    //   152	156	166	java/io/IOException
    //   156	163	166	java/io/IOException
    //   24	34	180	finally
    //   34	47	191	finally
    //   24	34	203	java/lang/Exception
    //   34	47	214	java/lang/Exception
  }
  
  private void dirChecker(String paramString)
  {
    File localFile = new File(this.unZipLocation + paramString);
    if (!localFile.isDirectory()) {
      localFile.mkdirs();
    }
  }
  
  public static final boolean doesRulesDBFileExist()
  {
    String str = getLocalDBPath() + getLocalDBName();
    boolean bool = new File(str).exists();
    LogUtils.infoLog("RuleUtility", "RULE DB FILE at " + str + ": Existence = " + bool);
    return bool;
  }
  
  public static String getLocalDBName()
  {
    return "pluginrules2.db";
  }
  
  public static String getLocalDBPath()
  {
    return getStoragePath() + "/unzipped/";
  }
  
  public static File getStoragePath()
  {
    Context localContext = WeMo.INSTANCE.getContext();
    if (LogUtils.isDebug()) {
      return localContext.getExternalFilesDir("Wemo");
    }
    return localContext.getFilesDir();
  }
  
  private void getWeeklySRSSTime(int paramInt, Calendar paramCalendar, String paramString)
    throws JSONException
  {
    String str1 = this.calculator.getOfficialSunriseForDate(paramCalendar);
    String str2 = this.calculator.getOfficialSunsetForDate(paramCalendar);
    LogUtils.infoLog("RuleUtility", "Sunrise time is : " + str1);
    LogUtils.infoLog("RuleUtility", "Sunrset time is : " + str2);
    TimeZone localTimeZone = TimeZone.getDefault();
    String[] arrayOfString1 = str1.split(":");
    String[] arrayOfString2 = str2.split(":");
    Calendar localCalendar1 = Calendar.getInstance();
    localCalendar1.set(1, paramCalendar.get(1));
    localCalendar1.set(2, paramCalendar.get(2));
    localCalendar1.set(5, paramCalendar.get(5));
    localCalendar1.set(11, 0);
    localCalendar1.set(12, 0);
    localCalendar1.setTimeZone(TimeZone.getTimeZone("GMT+00:00"));
    LogUtils.infoLog("RuleUtility", "midnightCalendar is : " + localCalendar1.getTime());
    Calendar localCalendar2 = Calendar.getInstance();
    localCalendar2.set(1, paramCalendar.get(1));
    localCalendar2.set(2, paramCalendar.get(2));
    localCalendar2.set(5, paramCalendar.get(5));
    localCalendar2.set(11, Integer.parseInt(arrayOfString1[0]));
    localCalendar2.set(12, Integer.parseInt(arrayOfString1[1]));
    localCalendar2.setTimeZone(TimeZone.getTimeZone("GMT+00:00"));
    LogUtils.infoLog("RuleUtility", "sunRiseCalendar is : " + localCalendar2.getTime());
    Calendar localCalendar3 = Calendar.getInstance();
    localCalendar3.setTimeZone(TimeZone.getTimeZone("GMT+00:00"));
    localCalendar3.set(12, Integer.parseInt(arrayOfString2[1]));
    localCalendar3.set(11, Integer.parseInt(arrayOfString2[0]));
    localCalendar3.set(5, paramCalendar.get(5));
    localCalendar3.set(2, paramCalendar.get(2));
    localCalendar3.set(1, paramCalendar.get(1));
    LogUtils.infoLog("RuleUtility", "sunSetCalendar is : " + localCalendar3.getTime());
    Calendar localCalendar4 = Calendar.getInstance();
    localCalendar4.setTimeZone(localTimeZone);
    int i = localTimeZone.getOffset(localCalendar4.getTimeInMillis());
    long l1 = localCalendar1.getTimeInMillis();
    long l2 = (localCalendar2.getTimeInMillis() - l1 + i) / 1000L;
    long l3 = (localCalendar3.getTimeInMillis() - l1 + i) / 1000L;
    LogUtils.verboseLog("RuleUtility", "sunRiseTimeInSec before: " + l2);
    LogUtils.verboseLog("RuleUtility", "sunSetTimeInSec before: " + l3);
    if (l2 > RulesConstants.MAX_HOUR) {
      l2 -= RulesConstants.MAX_HOUR;
    }
    if (l3 > RulesConstants.MAX_HOUR) {
      l3 -= RulesConstants.MAX_HOUR;
    }
    if (l2 > l3) {
      l3 += 86400L;
    }
    long l4 = l2 % 10L;
    LogUtils.verboseLog("RuleUtility", "sunRiseTimeInSec : " + l2);
    LogUtils.verboseLog("RuleUtility", "sunRiseTimeInSecNew : " + l4);
    long l5 = l2 - l4;
    long l6 = l3 % 10L;
    LogUtils.verboseLog("RuleUtility", "sunSetTimeInSec : " + l3);
    LogUtils.verboseLog("RuleUtility", "sunSetTimeInSecNew : " + l6);
    long l7 = l3 - l6;
    LogUtils.infoLog("RuleUtility", "sunRiseTimeInSec is : " + l5);
    LogUtils.infoLog("RuleUtility", "sunSetTimeInSec is : " + l7);
    this.sunriseSunsetTime.put(paramInt, paramString + "|" + String.valueOf(l5) + ":" + String.valueOf(l7));
  }
  
  private void migrateDB(Context paramContext)
  {
    File localFile = new File(getStoragePath() + "/databases/" + "pluginrules2.db");
    if (!localFile.exists()) {}
    try
    {
      localFile.createNewFile();
      FileOutputStream localFileOutputStream = new FileOutputStream(localFile);
      FileInputStream localFileInputStream = new FileInputStream(getStoragePath() + "/" + "pluginrules2.db");
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
  
  public String DownloadFromUrl(String paramString1, String paramString2)
  {
    Object localObject = "";
    try
    {
      File localFile1 = new File(getStoragePath() + "/databases/");
      if (!localFile1.exists()) {
        localFile1.mkdir();
      }
      URL localURL = new URL(paramString1);
      File localFile2 = new File(localFile1, paramString2);
      if (localFile2 != null)
      {
        long l = System.currentTimeMillis();
        LogUtils.infoLog("RuleUtility", "download begining download url:" + localURL + " downloadedfilename:" + paramString2);
        BufferedInputStream localBufferedInputStream = new BufferedInputStream(localURL.openConnection().getInputStream());
        FileOutputStream localFileOutputStream = new FileOutputStream(localFile2);
        IOUtils.copy(localBufferedInputStream, localFileOutputStream);
        localFileOutputStream.flush();
        localFileOutputStream.close();
        localBufferedInputStream.close();
        LogUtils.infoLog("RuleUtility", "download ready in " + (System.currentTimeMillis() - l) / 1000L + " sec");
        String str = unzip(getStoragePath() + "/databases/" + "pluginrulesCompressed.zip", getLocalDBPath() + getLocalDBName());
        localObject = str;
      }
      return (String)localObject;
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("RuleUtility", "DownloadFromURL() Exception: ", localException);
      try
      {
        copyRawDB(this.context.getAssets().open("pluginrules2.db"), getLocalDBPath());
        return (String)localObject;
      }
      catch (IOException localIOException)
      {
        LogUtils.errorLog("RuleUtility", "DownloadFromURL() IOException: ", localException);
      }
    }
    return (String)localObject;
  }
  
  public String checkCopyRawDBStatus()
  {
    String str;
    try
    {
      SharePreferences localSharePreferences = new SharePreferences(this.context);
      if (localSharePreferences.getAppUsedCount() == 0L)
      {
        LogUtils.infoLog("RuleUtility", "...First time launch...");
        new RuleUtility(this.context).copyRawDB(this.context.getAssets().open("pluginrules2.db"), getLocalDBPath());
        localSharePreferences.setAppUsedCount(1L);
        str = "true";
      }
      else
      {
        LogUtils.infoLog("RuleUtility", "...AppUsedCount is 1 - Do nothing...");
        str = "false";
      }
    }
    catch (Exception localException)
    {
      return "";
    }
    return str;
  }
  
  public String checkHomeNetworkStatus()
  {
    String str1 = this.sharePreference.getRuleHomeSSID();
    Set localSet = this.sharePreference.getHomeSSIDs();
    String str2 = this.networkUtil.getSSID();
    Object localObject = "";
    int i = 0;
    try
    {
      Iterator localIterator = localSet.iterator();
      while (localIterator.hasNext())
      {
        String str3 = (String)localIterator.next();
        if (((String)localObject).equalsIgnoreCase("")) {
          localObject = str3;
        }
        if (((String)localObject).equalsIgnoreCase(str2)) {
          i = 1;
        }
      }
      if (str1.equalsIgnoreCase(""))
      {
        if (!((String)localObject).equalsIgnoreCase("")) {
          break label149;
        }
        this.sharePreference.setRuleHomeSSID(str2);
      }
      while (i != 0)
      {
        this.sharePreference.setDBVersion("0");
        LogUtils.infoLog("RuleUtility", " ConnectedHomeSSID is :  StoredHomeSSID");
        return "";
        label149:
        this.sharePreference.setRuleHomeSSID((String)localObject);
      }
      if (!this.sharePreference.isRemoteEnabled()) {
        break label218;
      }
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      return "";
    }
    LogUtils.infoLog("RuleUtility", " RemoteEnabled is : " + this.sharePreference.isRemoteEnabled());
    return "";
    label218:
    this.sharePreference.setDBVersion("-1");
    LogUtils.infoLog("RuleUtility", " DB Cleaned Version set to -1");
    return "";
  }
  
  public String convertHHMMtoGMT(String paramString)
    throws ParseException
  {
    TimeZone localTimeZone = TimeZone.getDefault();
    String str = localTimeZone.getDisplayName(false, 0);
    LogUtils.infoLog("RuleUtility", "current timezone name is : " + localTimeZone.getDisplayName());
    LogUtils.infoLog("RuleUtility", "current timezone id is : " + localTimeZone.getID());
    SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("hhh:mm");
    localSimpleDateFormat.setCalendar(Calendar.getInstance(new SimpleTimeZone(0, str)));
    Date localDate = localSimpleDateFormat.parse(paramString);
    Calendar localCalendar = Calendar.getInstance();
    localCalendar.setTime(localDate);
    return localCalendar.get(11) + ":" + localCalendar.get(12);
  }
  
  /* Error */
  public String copyDataBase(String paramString1, String paramString2, String paramString3)
  {
    // Byte code:
    //   0: ldc_w 328
    //   3: astore 4
    //   5: ldc 11
    //   7: new 113	java/lang/StringBuilder
    //   10: dup
    //   11: invokespecial 114	java/lang/StringBuilder:<init>	()V
    //   14: ldc_w 504
    //   17: invokevirtual 120	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   20: aload_1
    //   21: invokevirtual 120	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   24: ldc_w 506
    //   27: invokevirtual 120	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   30: aload_2
    //   31: invokevirtual 120	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   34: ldc_w 508
    //   37: invokevirtual 120	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   40: aload_3
    //   41: invokevirtual 120	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   44: invokevirtual 124	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   47: invokestatic 102	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   50: new 71	java/io/File
    //   53: dup
    //   54: aload_1
    //   55: invokespecial 74	java/io/File:<init>	(Ljava/lang/String;)V
    //   58: astore 6
    //   60: aconst_null
    //   61: astore 7
    //   63: aconst_null
    //   64: astore 8
    //   66: new 76	java/io/FileInputStream
    //   69: dup
    //   70: aload 6
    //   72: invokespecial 79	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   75: astore 9
    //   77: new 81	java/io/FileOutputStream
    //   80: dup
    //   81: aload_2
    //   82: invokespecial 82	java/io/FileOutputStream:<init>	(Ljava/lang/String;)V
    //   85: astore 10
    //   87: aload 9
    //   89: aload 10
    //   91: invokestatic 88	org/apache/commons/io/IOUtils:copy	(Ljava/io/InputStream;Ljava/io/OutputStream;)I
    //   94: pop
    //   95: aload 10
    //   97: invokevirtual 91	java/io/FileOutputStream:flush	()V
    //   100: aload 10
    //   102: invokevirtual 94	java/io/FileOutputStream:close	()V
    //   105: aload 9
    //   107: invokevirtual 95	java/io/FileInputStream:close	()V
    //   110: ldc 11
    //   112: ldc 97
    //   114: invokestatic 102	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   117: aload_3
    //   118: ldc_w 402
    //   121: invokevirtual 436	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   124: ifeq +13 -> 137
    //   127: aload_0
    //   128: invokevirtual 511	com/belkin/utils/RuleUtility:getPragmaVersion	()Ljava/lang/String;
    //   131: astore 19
    //   133: aload 19
    //   135: astore 4
    //   137: aload 4
    //   139: areturn
    //   140: astore 18
    //   142: aload 18
    //   144: invokevirtual 512	java/io/IOException:printStackTrace	()V
    //   147: goto -10 -> 137
    //   150: astore 11
    //   152: aload 11
    //   154: invokevirtual 324	java/lang/Exception:printStackTrace	()V
    //   157: aload 8
    //   159: invokevirtual 94	java/io/FileOutputStream:close	()V
    //   162: aload 7
    //   164: invokevirtual 95	java/io/FileInputStream:close	()V
    //   167: ldc 11
    //   169: ldc 97
    //   171: invokestatic 102	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   174: aload_3
    //   175: ldc_w 402
    //   178: invokevirtual 436	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   181: ifeq -44 -> 137
    //   184: aload_0
    //   185: invokevirtual 511	com/belkin/utils/RuleUtility:getPragmaVersion	()Ljava/lang/String;
    //   188: astore 16
    //   190: aload 16
    //   192: astore 4
    //   194: goto -57 -> 137
    //   197: astore 15
    //   199: aload 15
    //   201: invokevirtual 512	java/io/IOException:printStackTrace	()V
    //   204: goto -67 -> 137
    //   207: astore 5
    //   209: aload 5
    //   211: invokevirtual 324	java/lang/Exception:printStackTrace	()V
    //   214: aload 4
    //   216: areturn
    //   217: astore 12
    //   219: aload 8
    //   221: invokevirtual 94	java/io/FileOutputStream:close	()V
    //   224: aload 7
    //   226: invokevirtual 95	java/io/FileInputStream:close	()V
    //   229: ldc 11
    //   231: ldc 97
    //   233: invokestatic 102	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   236: aload_3
    //   237: ldc_w 402
    //   240: invokevirtual 436	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   243: ifeq +13 -> 256
    //   246: aload_0
    //   247: invokevirtual 511	com/belkin/utils/RuleUtility:getPragmaVersion	()Ljava/lang/String;
    //   250: astore 14
    //   252: aload 14
    //   254: astore 4
    //   256: aload 12
    //   258: athrow
    //   259: astore 13
    //   261: aload 13
    //   263: invokevirtual 512	java/io/IOException:printStackTrace	()V
    //   266: goto -10 -> 256
    //   269: astore 12
    //   271: aload 9
    //   273: astore 7
    //   275: aconst_null
    //   276: astore 8
    //   278: goto -59 -> 219
    //   281: astore 12
    //   283: aload 10
    //   285: astore 8
    //   287: aload 9
    //   289: astore 7
    //   291: goto -72 -> 219
    //   294: astore 11
    //   296: aload 9
    //   298: astore 7
    //   300: aconst_null
    //   301: astore 8
    //   303: goto -151 -> 152
    //   306: astore 11
    //   308: aload 10
    //   310: astore 8
    //   312: aload 9
    //   314: astore 7
    //   316: goto -164 -> 152
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	319	0	this	RuleUtility
    //   0	319	1	paramString1	String
    //   0	319	2	paramString2	String
    //   0	319	3	paramString3	String
    //   3	252	4	localObject1	Object
    //   207	3	5	localException1	Exception
    //   58	13	6	localFile	File
    //   61	254	7	localObject2	Object
    //   64	247	8	localObject3	Object
    //   75	238	9	localFileInputStream	FileInputStream
    //   85	224	10	localFileOutputStream	FileOutputStream
    //   150	3	11	localException2	Exception
    //   294	1	11	localException3	Exception
    //   306	1	11	localException4	Exception
    //   217	40	12	localObject4	Object
    //   269	1	12	localObject5	Object
    //   281	1	12	localObject6	Object
    //   259	3	13	localIOException1	IOException
    //   250	3	14	str1	String
    //   197	3	15	localIOException2	IOException
    //   188	3	16	str2	String
    //   140	3	18	localIOException3	IOException
    //   131	3	19	str3	String
    // Exception table:
    //   from	to	target	type
    //   100	133	140	java/io/IOException
    //   66	77	150	java/lang/Exception
    //   157	190	197	java/io/IOException
    //   5	60	207	java/lang/Exception
    //   100	133	207	java/lang/Exception
    //   142	147	207	java/lang/Exception
    //   157	190	207	java/lang/Exception
    //   199	204	207	java/lang/Exception
    //   219	252	207	java/lang/Exception
    //   256	259	207	java/lang/Exception
    //   261	266	207	java/lang/Exception
    //   66	77	217	finally
    //   152	157	217	finally
    //   219	252	259	java/io/IOException
    //   77	87	269	finally
    //   87	100	281	finally
    //   77	87	294	java/lang/Exception
    //   87	100	306	java/lang/Exception
  }
  
  /* Error */
  public void copyRawDB(InputStream paramInputStream, String paramString)
  {
    // Byte code:
    //   0: ldc 11
    //   2: ldc_w 514
    //   5: invokestatic 102	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   8: new 71	java/io/File
    //   11: dup
    //   12: aload_2
    //   13: invokespecial 74	java/io/File:<init>	(Ljava/lang/String;)V
    //   16: astore 4
    //   18: aload 4
    //   20: invokevirtual 141	java/io/File:exists	()Z
    //   23: ifne +9 -> 32
    //   26: aload 4
    //   28: invokevirtual 331	java/io/File:mkdir	()Z
    //   31: pop
    //   32: aconst_null
    //   33: astore 5
    //   35: new 81	java/io/FileOutputStream
    //   38: dup
    //   39: new 113	java/lang/StringBuilder
    //   42: dup
    //   43: invokespecial 114	java/lang/StringBuilder:<init>	()V
    //   46: aload_2
    //   47: invokevirtual 120	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   50: ldc -106
    //   52: invokevirtual 120	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   55: invokevirtual 124	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   58: invokespecial 82	java/io/FileOutputStream:<init>	(Ljava/lang/String;)V
    //   61: astore 6
    //   63: aload_1
    //   64: invokevirtual 520	java/io/InputStream:read	()I
    //   67: istore 11
    //   69: iload 11
    //   71: iconst_m1
    //   72: if_icmpeq +42 -> 114
    //   75: aload 6
    //   77: iload 11
    //   79: invokevirtual 524	java/io/FileOutputStream:write	(I)V
    //   82: goto -19 -> 63
    //   85: astore 9
    //   87: aload 6
    //   89: astore 5
    //   91: aload 9
    //   93: invokevirtual 324	java/lang/Exception:printStackTrace	()V
    //   96: aload 5
    //   98: invokevirtual 94	java/io/FileOutputStream:close	()V
    //   101: aload_1
    //   102: invokevirtual 525	java/io/InputStream:close	()V
    //   105: ldc 11
    //   107: ldc_w 527
    //   110: invokestatic 102	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   113: return
    //   114: aload 6
    //   116: invokevirtual 91	java/io/FileOutputStream:flush	()V
    //   119: aload 6
    //   121: invokevirtual 94	java/io/FileOutputStream:close	()V
    //   124: aload_1
    //   125: invokevirtual 525	java/io/InputStream:close	()V
    //   128: ldc 11
    //   130: ldc_w 527
    //   133: invokestatic 102	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   136: return
    //   137: astore 12
    //   139: aload 12
    //   141: invokevirtual 512	java/io/IOException:printStackTrace	()V
    //   144: return
    //   145: astore 10
    //   147: aload 10
    //   149: invokevirtual 512	java/io/IOException:printStackTrace	()V
    //   152: return
    //   153: astore_3
    //   154: return
    //   155: astore 7
    //   157: aload 5
    //   159: invokevirtual 94	java/io/FileOutputStream:close	()V
    //   162: aload_1
    //   163: invokevirtual 525	java/io/InputStream:close	()V
    //   166: ldc 11
    //   168: ldc_w 527
    //   171: invokestatic 102	com/belkin/utils/LogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   174: aload 7
    //   176: athrow
    //   177: astore 8
    //   179: aload 8
    //   181: invokevirtual 512	java/io/IOException:printStackTrace	()V
    //   184: goto -10 -> 174
    //   187: astore 7
    //   189: aload 6
    //   191: astore 5
    //   193: goto -36 -> 157
    //   196: astore 9
    //   198: aconst_null
    //   199: astore 5
    //   201: goto -110 -> 91
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	204	0	this	RuleUtility
    //   0	204	1	paramInputStream	InputStream
    //   0	204	2	paramString	String
    //   153	1	3	localException1	Exception
    //   16	11	4	localFile	File
    //   33	167	5	localObject1	Object
    //   61	129	6	localFileOutputStream	FileOutputStream
    //   155	20	7	localObject2	Object
    //   187	1	7	localObject3	Object
    //   177	3	8	localIOException1	IOException
    //   85	7	9	localException2	Exception
    //   196	1	9	localException3	Exception
    //   145	3	10	localIOException2	IOException
    //   67	11	11	i	int
    //   137	3	12	localIOException3	IOException
    // Exception table:
    //   from	to	target	type
    //   63	69	85	java/lang/Exception
    //   75	82	85	java/lang/Exception
    //   114	119	85	java/lang/Exception
    //   119	136	137	java/io/IOException
    //   96	113	145	java/io/IOException
    //   0	32	153	java/lang/Exception
    //   96	113	153	java/lang/Exception
    //   119	136	153	java/lang/Exception
    //   139	144	153	java/lang/Exception
    //   147	152	153	java/lang/Exception
    //   157	174	153	java/lang/Exception
    //   174	177	153	java/lang/Exception
    //   179	184	153	java/lang/Exception
    //   35	63	155	finally
    //   91	96	155	finally
    //   157	174	177	java/io/IOException
    //   63	69	187	finally
    //   75	82	187	finally
    //   114	119	187	finally
    //   35	63	196	java/lang/Exception
  }
  
  public String createLocalZippedDBFilePath()
  {
    synchronized (lock)
    {
      String str1 = getLocalDBPath() + getLocalDBName();
      if (filesizeInByte(str1) >= 102400) {
        reduceRulesDBFileSize(str1);
      }
      LogUtils.infoLog("RuleUtility", "Local DB ZIP file requested: Creating new ZIP file for local DB.");
      copyDataBase(str1, getStoragePath() + "/" + "temppluginRules.db", "false");
      String[] arrayOfString = new String[1];
      arrayOfString[0] = (getStoragePath() + "/" + "temppluginRules.db");
      zip(arrayOfString, getStoragePath() + "/" + "pluginrulesCompressed.zip");
      String str2 = getStoragePath() + "/" + "pluginrulesCompressed.zip";
      return str2;
    }
  }
  
  public int filesizeInByte(String paramString)
  {
    int i = Integer.parseInt(String.valueOf(new File(paramString).length()));
    LogUtils.debugLog("RuleUtility", "FILE = " + paramString + "; SIZE = " + i);
    return i;
  }
  
  public boolean firmwareSupportMakerRule(String paramString1, String paramString2)
  {
    this.firmWareNumber = paramString1.split("\\.");
    this.firmwareVer = Integer.parseInt(this.firmWareNumber[2]);
    LogUtils.infoLog("RuleUtility", "firmwareSupportMakerRule():: firmwareVer--> " + this.firmwareVer);
    if (paramString2.equalsIgnoreCase("urn:Belkin:device:Maker:1"))
    {
      if (this.firmwareVer < 6658) {
        LogUtils.infoLog("RuleUtility", "Maker firmware is not supported");
      }
    }
    else {
      return false;
    }
    LogUtils.infoLog("RuleUtility", "Maker firmware is supported");
    return true;
  }
  
  public boolean frimwareSupportSRSS(String paramString1, String paramString2)
  {
    this.firmWareNumber = paramString1.split("\\.");
    this.firmwareVer = Integer.parseInt(this.firmWareNumber[2]);
    if (paramString2.equalsIgnoreCase("urn:Belkin:device:NetCamSensor:1"))
    {
      if (this.firmwareVer < 3609)
      {
        LogUtils.infoLog("RuleUtility", "NetCam firmware is not supported");
        return false;
      }
      LogUtils.infoLog("RuleUtility", "NetCam firmware is supported");
      return true;
    }
    if (this.firmwareVer < 3609)
    {
      LogUtils.infoLog("RuleUtility", "firmware is not supported");
      return false;
    }
    LogUtils.infoLog("RuleUtility", "firmware is supported");
    return true;
  }
  
  public String getDBInBase64Encoding()
  {
    String str1 = new String();
    try
    {
      String str2 = createLocalZippedDBFilePath();
      byte[] arrayOfByte = UploadFileUtil.readFile(str2);
      if (arrayOfByte != null)
      {
        String str3 = new String(Base64.encode(arrayOfByte, 0)).trim().replaceAll("\n", "").replaceAll("\\n", "").replaceAll("\n\r", "");
        LogUtils.infoLog("RuleUtility", "Store Rules: Encoded DB length" + str3.length());
        return "<![CDATA[" + str3 + "]]>";
      }
      LogUtils.errorLog("RuleUtility", "Error: Unable to read DB file at " + str2);
      return str1;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return str1;
  }
  
  public String getLocalZippedDBFilePath(int paramInt)
  {
    synchronized (lock)
    {
      String str = SharePreferences.getRuleDBZipPath(this.context);
      int i = SharePreferences.getRuleDBZipVersion(this.context);
      LogUtils.infoLog("RuleUtility", "Local DB ZIP file requested. \nCurrent DB ZIP file path: " + str + "\nDB version of that ZIP file to send to FW: " + i + "\nDB version to send to FW: " + paramInt);
      if ((i < 0) || (paramInt > i) || (TextUtils.isEmpty(str)))
      {
        str = createLocalZippedDBFilePath();
        SharePreferences.setRuleDBZipPath(this.context, str);
        SharePreferences.setRuleDBZipVersion(this.context, Math.max(paramInt, i));
      }
      return str;
    }
  }
  
  public JSONArray getLocationDetails(Context paramContext)
    throws JSONException
  {
    JSONArray localJSONArray = new JSONArray();
    for (;;)
    {
      try
      {
        Geocoder localGeocoder = new Geocoder(paramContext, Locale.getDefault());
        this.gps = new GPSTracker(paramContext);
        if (this.gps.canGetLocation())
        {
          this.latitude = this.gps.getLatitude();
          this.longitude = this.gps.getLongitude();
          try
          {
            List localList2 = localGeocoder.getFromLocation(this.latitude, this.longitude, 2);
            localList1 = localList2;
            if ((localList1 == null) || (localList1.isEmpty())) {
              break label375;
            }
            LogUtils.infoLog("RuleUtility", "address is not null");
            if (((Address)localList1.get(0)).getLocality() == null) {
              break label377;
            }
            str1 = ((Address)localList1.get(0)).getLocality();
            localJSONArray.put(str1);
            if (((Address)localList1.get(0)).getCountryName() == null) {
              break label385;
            }
            str2 = ((Address)localList1.get(0)).getCountryName();
            localJSONArray.put(str2);
            localJSONArray.put(this.latitude);
            localJSONArray.put(this.longitude);
            if (((Address)localList1.get(0)).getCountryCode() == null) {
              break label393;
            }
            str3 = ((Address)localList1.get(0)).getCountryCode();
            localJSONArray.put(str3);
            if (((Address)localList1.get(0)).getAdminArea() == null) {
              break label367;
            }
            str4 = ((Address)localList1.get(0)).getAdminArea();
            localJSONArray.put(str4);
            return localJSONArray;
          }
          catch (Exception localException2)
          {
            localException2.printStackTrace();
            localJSONArray.put("");
            localJSONArray.put("");
            localJSONArray.put(this.latitude);
            localJSONArray.put(this.longitude);
            localJSONArray.put("");
            localJSONArray.put("");
            return localJSONArray;
          }
        }
        this.gps.showSettingsAlert();
      }
      catch (Exception localException1)
      {
        localException1.printStackTrace();
        return localJSONArray;
      }
      List localList1 = null;
      continue;
      label367:
      String str4 = "";
      continue;
      label375:
      return localJSONArray;
      label377:
      String str1 = "";
      continue;
      label385:
      String str2 = "";
      continue;
      label393:
      String str3 = "";
    }
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
        LogUtils.verboseLog("RuleUtility", "got DBVersion equal to 0");
        localSQLiteDatabase.setVersion(9);
      }
      str = Integer.toString(localSQLiteDatabase.getVersion());
      LogUtils.verboseLog("RuleUtility", "getPragmaVersion Pragma version is : " + str);
      localSQLiteDatabase.close();
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("RuleUtility", "Exception during openOrCreateDB: ", localException);
      return str;
    }
    finally
    {
      if (localSQLiteDatabase == null) {
        break label133;
      }
      localSQLiteDatabase.close();
    }
    return str;
  }
  
  public JSONArray getSunriseSunsetTime(double paramDouble1, double paramDouble2)
    throws JSONException
  {
    this.sunriseSunsetTime = new JSONArray();
    this.location = new Location(paramDouble1, paramDouble2);
    this.calculator = new SunriseSunsetCalculator(this.location, "+0000");
    SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
    new SimpleDateFormat("EEE");
    Calendar localCalendar = Calendar.getInstance();
    localCalendar.set(11, 0);
    localCalendar.set(12, 0);
    localCalendar.setTimeZone(TimeZone.getTimeZone("GMT+00:00"));
    int i = localCalendar.get(7);
    String str1 = com.belkin.wemo.cache.utils.Constants.DAYS_OF_THE_WEEK[i];
    LogUtils.infoLog("RuleUtility", " incremented day is : " + str1);
    getWeeklySRSSTime(0, localCalendar, str1);
    String[] arrayOfString = new String[7];
    for (int j = 1; j < 7; j++)
    {
      arrayOfString[j] = localSimpleDateFormat.format(localCalendar.getTime());
      localCalendar.add(5, 1);
      int k = localCalendar.get(7);
      String str2 = com.belkin.wemo.cache.utils.Constants.DAYS_OF_THE_WEEK[k];
      LogUtils.infoLog("RuleUtility", " incremented date is : " + localCalendar.get(7));
      LogUtils.infoLog("RuleUtility", " incremented day is : " + str2);
      getWeeklySRSSTime(j, localCalendar, str2);
    }
    return this.sunriseSunsetTime;
  }
  
  public boolean isFirmwareValidForCountdownRule(String paramString)
  {
    this.firmWareNumber = paramString.split("\\.");
    this.firmwareVer = Integer.parseInt(this.firmWareNumber[2]);
    LogUtils.debugLog("isFirmwareValidForCountdown Rule", "firmware version:::: " + this.firmwareVer);
    if (this.firmwareVer >= 7473)
    {
      LogUtils.infoLog("RuleUtility", " firmware is supported for Countdown Rule");
      return true;
    }
    LogUtils.infoLog("RuleUtility", " firmware is not supported for Countdown Rule");
    return false;
  }
  
  public boolean isFirmwareValidForMotionNotify(String paramString)
  {
    this.firmWareNumber = paramString.split("\\.");
    this.firmwareVer = Integer.parseInt(this.firmWareNumber[2]);
    LogUtils.debugLog("isFirmwareValidForSO", "firmware version:::: " + this.firmwareVer);
    if (this.firmwareVer >= 3949)
    {
      LogUtils.infoLog("RuleUtility", " firmware is supported for Motion Notify");
      return true;
    }
    LogUtils.infoLog("RuleUtility", " firmware is not supported for Motion Notify");
    return false;
  }
  
  public boolean isFirmwareValidForSO(String paramString)
  {
    this.firmWareNumber = paramString.split("\\.");
    this.firmwareVer = Integer.parseInt(this.firmWareNumber[2]);
    LogUtils.debugLog("isFirmwareValidForSO", "firmware version:::: " + this.firmwareVer);
    if (this.firmwareVer >= 4003)
    {
      LogUtils.infoLog("RuleUtility", " firmware is supported for SO");
      return true;
    }
    LogUtils.infoLog("RuleUtility", " firmware is not supported for SO");
    return false;
  }
  
  public void javaUnZip(String paramString1, String paramString2)
  {
    for (;;)
    {
      java.util.zip.ZipFile localZipFile;
      BufferedInputStream localBufferedInputStream;
      BufferedOutputStream localBufferedOutputStream;
      try
      {
        localZipFile = new java.util.zip.ZipFile(paramString1);
        Enumeration localEnumeration = localZipFile.entries();
        if (localEnumeration.hasMoreElements())
        {
          localBufferedInputStream = new BufferedInputStream(localZipFile.getInputStream((ZipEntry)localEnumeration.nextElement()));
          byte[] arrayOfByte = new byte['Ѐ'];
          localBufferedOutputStream = new BufferedOutputStream(new FileOutputStream(paramString2), 1024);
          int i = localBufferedInputStream.read(arrayOfByte, 0, 1024);
          if (i != -1)
          {
            localBufferedOutputStream.write(arrayOfByte, 0, i);
            continue;
          }
        }
        else
        {
          return;
        }
      }
      catch (Exception localException)
      {
        LogUtils.errorLog("RuleUtility", "Exception in javaUnZip: ", localException);
      }
      localBufferedOutputStream.flush();
      localBufferedOutputStream.close();
      localBufferedInputStream.close();
      localZipFile.close();
    }
  }
  
  public void reduceRulesDBFileSize(String paramString)
  {
    SQLiteDatabase localSQLiteDatabase = this.context.openOrCreateDatabase(paramString, 0, null);
    if (localSQLiteDatabase != null) {}
    try
    {
      localSQLiteDatabase.execSQL("VACUUM");
      localSQLiteDatabase.close();
      return;
    }
    catch (SQLException localSQLException)
    {
      LogUtils.errorLog("RuleUtility", "SQL Exception while executing VACUUM on rules DB: ", localSQLException);
    }
  }
  
  public String setPragmaVersion(int paramInt)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = this.context.openOrCreateDatabase(getLocalDBPath() + getLocalDBName(), 0, null);
      LogUtils.verboseLog("RuleUtility", "setPragmaVersion Before Pragma version is : " + localSQLiteDatabase.getVersion());
      localSQLiteDatabase.setVersion(paramInt);
      LogUtils.verboseLog("RuleUtility", "setPragmaVersion After Pragma version is : " + localSQLiteDatabase.getVersion());
      localSQLiteDatabase.close();
      return "";
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return "";
  }
  
  public String unzip(String paramString1, String paramString2)
  {
    Object localObject = "";
    this.unZipLocation = paramString2;
    dirChecker("");
    LogUtils.infoLog("RuleUtility", "Rules: Unzip: File to unZip: " + paramString1);
    LogUtils.infoLog("RuleUtility", "Rules: Unzip: Temp file location: " + paramString1);
    LogUtils.infoLog("RuleUtility", "Rules: Unzip: Final unZip location: " + this.unZipLocation);
    try
    {
      String str1 = getStoragePath() + "/databases/" + getLocalDBName();
      ZIPUtility.unzip(paramString1, str1);
      new File(this.unZipLocation).delete();
      copyDataBase(str1, this.unZipLocation, "false");
      LogUtils.infoLog("RuleUtility", "Rules: Unzipped");
      String str2 = getPragmaVersion();
      localObject = str2;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        LogUtils.infoLog("RuleUtility", "Rules: Exception while unzipping: ", localException);
      }
    }
    LogUtils.infoLog("RuleUtility", "Rules: ########### Value of migration : " + this.dbMigration);
    if (this.dbMigration)
    {
      LogUtils.infoLog("RuleUtility", "....Inside....");
      migrateDB(this.context);
    }
    return (String)localObject;
  }
  
  public void zip(String[] paramArrayOfString, String paramString)
  {
    LogUtils.infoLog("RuleUtility", "inside zip");
    try
    {
      LogUtils.infoLog("RuleUtility", " zipLocation : " + paramString);
      boolean bool = new File(paramString).delete();
      LogUtils.infoLog("RuleUtility", " Deleting Preview/old file at " + paramString + "; STATUS = " + bool);
      net.lingala.zip4j.core.ZipFile localZipFile = new net.lingala.zip4j.core.ZipFile(paramString);
      ZipParameters localZipParameters = new ZipParameters();
      localZipParameters.setCompressionMethod(8);
      localZipParameters.setCompressionLevel(5);
      localZipFile.addFile(new File(paramArrayOfString[0]), localZipParameters);
      return;
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("RuleUtility", "Exception during zip: ", localException);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/utils/RuleUtility.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */