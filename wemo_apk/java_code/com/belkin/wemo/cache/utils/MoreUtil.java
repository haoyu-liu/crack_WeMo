package com.belkin.wemo.cache.utils;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.net.wifi.ScanResult;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Build.VERSION;
import android.provider.Settings.Secure;
import android.provider.Settings.System;
import android.util.Log;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

public class MoreUtil
{
  public static final String APPVERSIONCODE = "appVersionCode";
  public static final String APPVERSIONNAME = "appVersionName";
  private static boolean AirPurifierFlag = false;
  private static boolean ClassicA60TWFlag = false;
  private static boolean CoffeeMakerFlag = false;
  public static final String DEVICEMODELNAME = "deviceModelName";
  public static final String DEVICEUSERINFO = "deviceUserInfo";
  private static boolean FlexRGBWFlag = false;
  private static boolean GardenspotRGBFlag = false;
  private static boolean HeaterAFlag = false;
  private static boolean HeaterBFlag = false;
  private static boolean HumidifierBFlag = false;
  private static boolean HumidifierFlag = false;
  public static final String TAG = "MoreUtil";
  private static boolean bridgewwFlag = false;
  private static boolean bulbWWflag;
  private static boolean euFlag;
  private static boolean insightFlag;
  private static boolean lightFlag;
  private static boolean makerFlag;
  private static boolean openWRTAirPurifier;
  private static boolean openWRTCoffeeMaker;
  private static boolean openWRTHeaterA;
  private static boolean openWRTHeaterB;
  private static boolean openWRTHumidifier;
  private static boolean openWRTHumidifierB;
  private static boolean openWRTInsightV2;
  private static boolean openWRTMaker;
  private static boolean openWRTSNS;
  private static boolean openWRTSlowCooker;
  private static boolean openWRTTransAirPurifier;
  private static boolean openWRTTransCoffeeMaker;
  private static boolean openWRTTransHeaterA;
  private static boolean openWRTTransHeaterB;
  private static boolean openWRTTransHumidifier;
  private static boolean openWRTTransHumidifierB;
  private static boolean openWRTTransMaker;
  private static boolean openWRTTransSNS;
  private static boolean openWRTTransSlowCooker;
  private static boolean openWRTTransinsight;
  private static boolean openWRTTranslight;
  private static boolean openWRTTranssmart;
  private static boolean openWRTinsight;
  private static boolean openWRTlight;
  private static boolean openWRTsmart;
  private static boolean signedInsightFlag;
  private static boolean signedLightFlag;
  private static boolean signedMakerFlag;
  private static boolean signedeuFlag;
  private static boolean signedusFlag;
  private static boolean slowcookerUSFlag;
  private static boolean usFlag = false;
  private static boolean wemoSmartFlag;
  private PackageInfo packageInfo;
  
  static
  {
    euFlag = false;
    lightFlag = false;
    openWRTlight = false;
    openWRTTranslight = false;
    insightFlag = false;
    signedInsightFlag = false;
    signedusFlag = false;
    signedeuFlag = false;
    signedLightFlag = false;
    slowcookerUSFlag = false;
    signedMakerFlag = false;
    wemoSmartFlag = false;
    makerFlag = false;
    openWRTinsight = false;
    openWRTTransinsight = false;
    openWRTSNS = false;
    openWRTTransSNS = false;
    openWRTSlowCooker = false;
    openWRTTransSlowCooker = false;
    openWRTsmart = false;
    openWRTTranssmart = false;
    openWRTMaker = false;
    openWRTTransMaker = false;
    bulbWWflag = false;
    openWRTInsightV2 = false;
    openWRTTransHumidifier = false;
    openWRTHumidifier = false;
    openWRTTransHumidifierB = false;
    openWRTHumidifierB = false;
    openWRTTransHeaterA = false;
    openWRTHeaterA = false;
    openWRTTransHeaterB = false;
    openWRTHeaterB = false;
    openWRTTransAirPurifier = false;
    openWRTAirPurifier = false;
    openWRTTransCoffeeMaker = false;
    openWRTCoffeeMaker = false;
    HeaterAFlag = false;
    HeaterBFlag = false;
    CoffeeMakerFlag = false;
    HumidifierFlag = false;
    HumidifierBFlag = false;
    AirPurifierFlag = false;
    GardenspotRGBFlag = false;
  }
  
  private String capitalize(String paramString)
  {
    if ((paramString == null) || (paramString.length() == 0)) {
      paramString = "";
    }
    char c;
    do
    {
      return paramString;
      c = paramString.charAt(0);
    } while (Character.isUpperCase(c));
    return Character.toUpperCase(c) + paramString.substring(1);
  }
  
  public static String changeAttributes(String paramString)
  {
    if ((paramString.equals("Switch")) || (paramString.equals("switch"))) {
      paramString = "Switch";
    }
    do
    {
      return paramString;
      if ((paramString.equals("Sensor")) || (paramString.equals("sensor"))) {
        return "Sensor";
      }
      if ((paramString.equals("SwitchMode")) || (paramString.equals("switchMode"))) {
        return "SwitchMode";
      }
    } while ((!paramString.equals("SensorPresent")) && (!paramString.equals("sensorPresent")));
    return "SensorPresent";
  }
  
  private boolean resetFieldValue(String paramString)
  {
    if ((paramString == null) || (paramString.isEmpty())) {
      return false;
    }
    try
    {
      Field localField = MoreUtil.class.getDeclaredField(paramString);
      localField.setAccessible(true);
      if (localField != null)
      {
        localField.setBoolean("", Boolean.FALSE.booleanValue());
        String str = localField.getName();
        SDKLogUtils.infoLog("MoreUtil", "fieldvalureset" + str);
        return true;
      }
    }
    catch (NoSuchFieldException localNoSuchFieldException)
    {
      localNoSuchFieldException.printStackTrace();
      return false;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      for (;;)
      {
        localIllegalAccessException.printStackTrace();
      }
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      for (;;)
      {
        localIllegalArgumentException.printStackTrace();
      }
    }
  }
  
  private boolean setFieldValue(String paramString)
  {
    if ((paramString == null) || (paramString.isEmpty())) {
      return false;
    }
    try
    {
      Field localField = MoreUtil.class.getDeclaredField(paramString);
      localField.setAccessible(true);
      if (localField != null)
      {
        localField.setBoolean("", Boolean.TRUE.booleanValue());
        String str = localField.getName();
        SDKLogUtils.infoLog("MoreUtil", "fieldvalueset" + str);
        return true;
      }
    }
    catch (NoSuchFieldException localNoSuchFieldException)
    {
      localNoSuchFieldException.printStackTrace();
      return false;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      for (;;)
      {
        localIllegalAccessException.printStackTrace();
      }
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      for (;;)
      {
        localIllegalArgumentException.printStackTrace();
      }
    }
  }
  
  public String analyticsData(Context paramContext)
  {
    return getApplicationVersion(paramContext) + "|" + getVersionNumber() + "|" + new MoreUtil().getDeviceUserName(paramContext);
  }
  
  public String compareFirmwareVersions(String paramString1, String[] paramArrayOfString, String paramString2)
  {
    String str = "";
    if ((paramString1 == null) || (paramString1.isEmpty()) || (paramArrayOfString == null) || (paramArrayOfString.length < 1)) {
      return "";
    }
    if (getFirmwareNumber(paramString1) < getFirmwareNumber(paramArrayOfString[1])) {
      str = paramString2 + "Flag";
    }
    if (setFieldValue(str)) {
      return str;
    }
    return "";
  }
  
  public String compareFirmwareVersionsBulb(String paramString1, String paramString2, String paramString3)
  {
    String str;
    if ((paramString1 == null) || (paramString2 == null) || (paramString3 == null)) {
      str = "";
    }
    do
    {
      return str;
      Log.i("MoreUtil", "compareFirmwareVersionsBulb: " + paramString1 + "and newVersion is:: " + paramString2);
      if (paramString1.equalsIgnoreCase(paramString2)) {
        break;
      }
      str = paramString3 + "Flag";
    } while (setFieldValue(str));
    return "";
    return "";
  }
  
  public String compareNEWFirmwareDataForBridge(String paramString1, String paramString2)
  {
    if (!paramString1.equalsIgnoreCase(paramString2))
    {
      bridgewwFlag = true;
      return "Bridge";
    }
    return "";
  }
  
  public String compareNEWFirmwareDataForBulb(String paramString1, String paramString2)
  {
    String str = getFirmwareNumberForBulb(paramString2);
    Log.i("MoreUtil", "compareNEWFirmwareDataForBulb: " + paramString1 + "and newVersion is:: " + str);
    if (!paramString1.equalsIgnoreCase(str))
    {
      bulbWWflag = true;
      return "Bulb";
    }
    return "";
  }
  
  public String compareNEWFirmwareDataForCrockpot(String paramString, String[] paramArrayOfString)
  {
    if ((paramString.contains("WeMo_WW_2.0")) && (paramArrayOfString[1].contains("WeMo_WW_2.0")) && (!paramArrayOfString[1].contains(paramString)))
    {
      slowcookerUSFlag = true;
      return "slowCookerFlag";
    }
    return "";
  }
  
  public String compareNEWFirmwareDataForInsight(String paramString, String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    if (getFirmwareNumber(paramString) < getFirmwareNumber(paramArrayOfString1[1]))
    {
      insightFlag = true;
      return "insight";
    }
    if ((paramArrayOfString2 != null) && (!paramString.equalsIgnoreCase(paramArrayOfString2[1])))
    {
      signedInsightFlag = true;
      return "signedInsight";
    }
    return "";
  }
  
  public String compareNEWFirmwareDataForLightSwitch(String paramString, String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    if (getFirmwareNumber(paramString) < getFirmwareNumber(paramArrayOfString1[1]))
    {
      lightFlag = true;
      return "light";
    }
    if ((paramArrayOfString2 != null) && (!paramString.equalsIgnoreCase(paramArrayOfString2[1])))
    {
      signedLightFlag = true;
      return "signedlight";
    }
    return "";
  }
  
  public String compareNEWFirmwareDataForMaker(String paramString, String[] paramArrayOfString)
  {
    int i = getFirmwareNumber(paramString);
    int j = getFirmwareNumber(paramArrayOfString[1]);
    SDKLogUtils.infoLog("MoreUtil", "currentVesrionName :: " + i + " newVesrionName :: " + j);
    if (!paramString.equalsIgnoreCase(paramArrayOfString[1]))
    {
      makerFlag = true;
      return "Maker";
    }
    return "";
  }
  
  public String compareNEWFirmwareDataForSwitchSensor(String paramString, String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    int i = getFirmwareNumber(paramString);
    int j = getFirmwareNumber(paramArrayOfString1[1]);
    if (((paramString.contains("WeMo_US")) || (paramString.contains("WeMo_WW_1.0"))) && (paramArrayOfString1[1].contains("WeMo_US")))
    {
      if (i < j)
      {
        usFlag = true;
        return "US";
      }
      if ((paramArrayOfString2 != null) && (!paramString.equalsIgnoreCase(paramArrayOfString2[1])))
      {
        signedusFlag = true;
        return "US_SIGNED";
      }
    }
    if (((paramString.contains("WeMo_EU")) || (paramString.contains("WeMo_WW_2.0"))) && (paramArrayOfString1[1].contains("WeMo_WW")))
    {
      if (i < j)
      {
        euFlag = true;
        return "EU";
      }
      if ((paramArrayOfString2 != null) && (!paramString.equalsIgnoreCase(paramArrayOfString2[1])))
      {
        signedeuFlag = true;
        return "EU_SIGNED";
      }
    }
    return "";
  }
  
  public String compareNEWFirmwareDataForWeMoSmart(String paramString, String[] paramArrayOfString)
  {
    if ((paramString == null) || (paramArrayOfString == null) || (paramArrayOfString.length < 2))
    {
      Log.v("MoreUtil", "compareNEWFirmwareDataForWeMoSmart:invalid data to compare");
      return "";
    }
    Log.v("MoreUtil", "currentPlugInVersion:" + paramString);
    int i = paramArrayOfString.length;
    for (int j = 0; j < i; j++)
    {
      String str = paramArrayOfString[j];
      Log.v("MoreUtil", "newVersion str:" + str);
    }
    if (paramString.compareTo(paramArrayOfString[1]) == 0) {
      return "";
    }
    wemoSmartFlag = true;
    return "wemoSmartFlag";
  }
  
  public String compareOpenWRTFirmwareForInsight(String paramString, String[] paramArrayOfString1, String[] paramArrayOfString2, String[] paramArrayOfString3)
  {
    int i = getFirmwareNumber(paramString);
    int j = getFirmwareNumber(paramArrayOfString2[1]);
    int k = 0;
    if (paramArrayOfString1 != null) {
      k = getFirmwareNumber(paramArrayOfString1[1]);
    }
    if ((k != 0) && (i < k))
    {
      insightFlag = true;
      return "insight";
    }
    if ((!paramString.toUpperCase().contains("OWRT")) && (i < j))
    {
      openWRTTransinsight = true;
      return "openWRTTransinsight";
    }
    if ((paramArrayOfString3 != null) && (!paramString.equalsIgnoreCase(paramArrayOfString3[1])))
    {
      openWRTinsight = true;
      return "openWRTinsight";
    }
    return "";
  }
  
  public String compareOpenWRTFirmwareForInsightV2(String paramString, String[] paramArrayOfString)
  {
    if ((paramString != null) && (!paramString.isEmpty()) && (paramArrayOfString != null) && (getFirmwareNumber(paramString) < getFirmwareNumber(paramArrayOfString[1])))
    {
      openWRTInsightV2 = true;
      return "insightV2";
    }
    return "";
  }
  
  public String compareOpenWRTFirmwareForLightSwitch(String paramString, String[] paramArrayOfString1, String[] paramArrayOfString2, String[] paramArrayOfString3)
  {
    int i = getFirmwareNumber(paramString);
    int j = getFirmwareNumber(paramArrayOfString2[1]);
    int k = 0;
    if (paramArrayOfString1 != null) {
      k = getFirmwareNumber(paramArrayOfString1[1]);
    }
    if ((k != 0) && (i < k))
    {
      lightFlag = true;
      return "light";
    }
    if ((!paramString.toUpperCase().contains("OWRT")) && (i < j))
    {
      openWRTTranslight = true;
      return "openWRTTranslight";
    }
    if ((paramArrayOfString3 != null) && (!paramString.equalsIgnoreCase(paramArrayOfString3[1])))
    {
      openWRTlight = true;
      return "openWRTlight";
    }
    return "";
  }
  
  public String compareOpenWRTFirmwareForMaker(String paramString, String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    if (getFirmwareNumber(paramString) < getFirmwareNumber(paramArrayOfString1[1]))
    {
      openWRTTransMaker = true;
      return "openWRTTransMaker";
    }
    if ((paramArrayOfString2 != null) && (!paramString.equalsIgnoreCase(paramArrayOfString2[1])))
    {
      openWRTMaker = true;
      return "openWRTMaker";
    }
    return "";
  }
  
  public String compareOpenWRTFirmwareForSNS(String paramString, String[] paramArrayOfString1, String[] paramArrayOfString2, String[] paramArrayOfString3)
  {
    int i = getFirmwareNumber(paramString);
    int j = getFirmwareNumber(paramArrayOfString2[1]);
    int k = 0;
    if (paramArrayOfString1 != null) {
      k = getFirmwareNumber(paramArrayOfString1[1]);
    }
    if (((paramString.contains("WeMo_US")) || (paramString.contains("WeMo_WW_1.0"))) && (paramArrayOfString1[1].contains("WeMo_US")))
    {
      if ((k != 0) && (i < k))
      {
        usFlag = true;
        return "US";
      }
      if ((!paramString.toUpperCase().contains("OWRT")) && (i < j))
      {
        openWRTTransSNS = true;
        return "openWRTTransSNS";
      }
      if ((paramArrayOfString3 != null) && (!paramString.equalsIgnoreCase(paramArrayOfString3[1])))
      {
        openWRTSNS = true;
        return "openWRTSNS";
      }
    }
    if (((paramString.contains("WeMo_EU")) || (paramString.contains("WeMo_WW_2.0"))) && (paramArrayOfString1[1].contains("WeMo_WW")))
    {
      if ((k != 0) && (i < k))
      {
        euFlag = true;
        return "EU";
      }
      if ((!paramString.toUpperCase().contains("OWRT")) && (i < j))
      {
        openWRTTransSNS = true;
        return "openWRTTransSNS";
      }
      if ((paramArrayOfString3 != null) && (!paramString.equalsIgnoreCase(paramArrayOfString3[1])))
      {
        openWRTSNS = true;
        return "openWRTSNS";
      }
    }
    return "";
  }
  
  public String compareOpenWRTFirmwareForWeMoSmart(String paramString, String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    if (getFirmwareNumber(paramString) < getFirmwareNumber(paramArrayOfString1[1]))
    {
      openWRTTranssmart = true;
      return "openWRTTranscrockpot";
    }
    if ((paramArrayOfString2 != null) && (!paramString.equalsIgnoreCase(paramArrayOfString2[1])))
    {
      openWRTsmart = true;
      return "openWRTTranssmart";
    }
    return "";
  }
  
  public String compareOpenWRTFirmwareVersions(String paramString1, String[] paramArrayOfString, String paramString2)
  {
    String str = "";
    if ((paramString1 == null) || (paramString1.isEmpty()) || (paramArrayOfString == null) || (paramArrayOfString.length < 1)) {
      return "";
    }
    if (!paramString1.toUpperCase().contains("OWRT"))
    {
      str = "openWRTTrans" + paramString2;
      resetFieldValue("openWRT" + paramString2);
    }
    while (setFieldValue(str))
    {
      return str;
      if (!paramString1.equalsIgnoreCase(paramArrayOfString[1]))
      {
        str = "openWRT" + paramString2;
        resetFieldValue("openWRTTrans" + paramString2);
      }
    }
    return "";
  }
  
  /* Error */
  public void copyDbToDownloadDirectory(String paramString, Context paramContext)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_3
    //   2: aconst_null
    //   3: astore 4
    //   5: new 195	java/lang/StringBuilder
    //   8: dup
    //   9: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   12: ldc_w 445
    //   15: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   18: aload_0
    //   19: aload_2
    //   20: invokevirtual 448	com/belkin/wemo/cache/utils/MoreUtil:getPackageName	(Landroid/content/Context;)Ljava/lang/String;
    //   23: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   26: ldc_w 450
    //   29: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   32: aload_1
    //   33: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   36: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   39: astore 11
    //   41: ldc_w 452
    //   44: new 195	java/lang/StringBuilder
    //   47: dup
    //   48: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   51: ldc_w 454
    //   54: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   57: aload_0
    //   58: aload_2
    //   59: invokevirtual 448	com/belkin/wemo/cache/utils/MoreUtil:getPackageName	(Landroid/content/Context;)Ljava/lang/String;
    //   62: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   65: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   68: invokestatic 284	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   71: invokestatic 460	com/belkin/wemo/storage/FileStorage:getStoragePath	()Ljava/io/File;
    //   74: astore 12
    //   76: invokestatic 465	android/os/Environment:getDataDirectory	()Ljava/io/File;
    //   79: astore 13
    //   81: aload 12
    //   83: invokevirtual 470	java/io/File:canWrite	()Z
    //   86: istore 14
    //   88: aconst_null
    //   89: astore 4
    //   91: aconst_null
    //   92: astore_3
    //   93: iload 14
    //   95: ifeq +142 -> 237
    //   98: new 467	java/io/File
    //   101: dup
    //   102: aload 13
    //   104: aload 11
    //   106: invokespecial 473	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   109: astore 15
    //   111: new 467	java/io/File
    //   114: dup
    //   115: aload 12
    //   117: aload_1
    //   118: invokespecial 473	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   121: astore 16
    //   123: aload 15
    //   125: invokevirtual 476	java/io/File:exists	()Z
    //   128: istore 17
    //   130: aconst_null
    //   131: astore 4
    //   133: aconst_null
    //   134: astore_3
    //   135: iload 17
    //   137: ifeq +81 -> 218
    //   140: new 478	java/io/FileInputStream
    //   143: dup
    //   144: aload 15
    //   146: invokespecial 481	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   149: invokevirtual 485	java/io/FileInputStream:getChannel	()Ljava/nio/channels/FileChannel;
    //   152: astore_3
    //   153: new 487	java/io/FileOutputStream
    //   156: dup
    //   157: aload 16
    //   159: invokespecial 488	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   162: invokevirtual 489	java/io/FileOutputStream:getChannel	()Ljava/nio/channels/FileChannel;
    //   165: astore 4
    //   167: aload 4
    //   169: aload_3
    //   170: lconst_0
    //   171: aload_3
    //   172: invokevirtual 495	java/nio/channels/FileChannel:size	()J
    //   175: invokevirtual 499	java/nio/channels/FileChannel:transferFrom	(Ljava/nio/channels/ReadableByteChannel;JJ)J
    //   178: pop2
    //   179: aload_3
    //   180: invokevirtual 502	java/nio/channels/FileChannel:close	()V
    //   183: aload 4
    //   185: invokevirtual 502	java/nio/channels/FileChannel:close	()V
    //   188: ldc_w 452
    //   191: new 195	java/lang/StringBuilder
    //   194: dup
    //   195: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   198: ldc_w 504
    //   201: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   204: aload 16
    //   206: invokevirtual 507	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   209: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   212: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   215: invokestatic 284	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   218: aload_3
    //   219: ifnull +7 -> 226
    //   222: aload_3
    //   223: invokevirtual 502	java/nio/channels/FileChannel:close	()V
    //   226: aload 4
    //   228: ifnull +8 -> 236
    //   231: aload 4
    //   233: invokevirtual 502	java/nio/channels/FileChannel:close	()V
    //   236: return
    //   237: ldc_w 452
    //   240: new 195	java/lang/StringBuilder
    //   243: dup
    //   244: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   247: aload 12
    //   249: invokevirtual 507	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   252: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   255: ldc_w 509
    //   258: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   261: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   264: invokestatic 284	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   267: aconst_null
    //   268: astore 4
    //   270: aconst_null
    //   271: astore_3
    //   272: goto -54 -> 218
    //   275: astore 8
    //   277: aload 8
    //   279: invokevirtual 510	java/lang/Exception:printStackTrace	()V
    //   282: aload_3
    //   283: ifnull +7 -> 290
    //   286: aload_3
    //   287: invokevirtual 502	java/nio/channels/FileChannel:close	()V
    //   290: aload 4
    //   292: ifnull -56 -> 236
    //   295: aload 4
    //   297: invokevirtual 502	java/nio/channels/FileChannel:close	()V
    //   300: return
    //   301: astore 9
    //   303: aload 9
    //   305: invokevirtual 510	java/lang/Exception:printStackTrace	()V
    //   308: return
    //   309: astore 21
    //   311: aload 21
    //   313: invokevirtual 510	java/lang/Exception:printStackTrace	()V
    //   316: goto -90 -> 226
    //   319: astore 20
    //   321: aload 20
    //   323: invokevirtual 510	java/lang/Exception:printStackTrace	()V
    //   326: return
    //   327: astore 10
    //   329: aload 10
    //   331: invokevirtual 510	java/lang/Exception:printStackTrace	()V
    //   334: goto -44 -> 290
    //   337: astore 5
    //   339: aload_3
    //   340: ifnull +7 -> 347
    //   343: aload_3
    //   344: invokevirtual 502	java/nio/channels/FileChannel:close	()V
    //   347: aload 4
    //   349: ifnull +8 -> 357
    //   352: aload 4
    //   354: invokevirtual 502	java/nio/channels/FileChannel:close	()V
    //   357: aload 5
    //   359: athrow
    //   360: astore 7
    //   362: aload 7
    //   364: invokevirtual 510	java/lang/Exception:printStackTrace	()V
    //   367: goto -20 -> 347
    //   370: astore 6
    //   372: aload 6
    //   374: invokevirtual 510	java/lang/Exception:printStackTrace	()V
    //   377: goto -20 -> 357
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	380	0	this	MoreUtil
    //   0	380	1	paramString	String
    //   0	380	2	paramContext	Context
    //   1	343	3	localFileChannel1	java.nio.channels.FileChannel
    //   3	350	4	localFileChannel2	java.nio.channels.FileChannel
    //   337	21	5	localObject	Object
    //   370	3	6	localException1	Exception
    //   360	3	7	localException2	Exception
    //   275	3	8	localException3	Exception
    //   301	3	9	localException4	Exception
    //   327	3	10	localException5	Exception
    //   39	66	11	str	String
    //   74	174	12	localFile1	java.io.File
    //   79	24	13	localFile2	java.io.File
    //   86	8	14	bool1	boolean
    //   109	36	15	localFile3	java.io.File
    //   121	84	16	localFile4	java.io.File
    //   128	8	17	bool2	boolean
    //   319	3	20	localException6	Exception
    //   309	3	21	localException7	Exception
    // Exception table:
    //   from	to	target	type
    //   5	88	275	java/lang/Exception
    //   98	130	275	java/lang/Exception
    //   140	218	275	java/lang/Exception
    //   237	267	275	java/lang/Exception
    //   295	300	301	java/lang/Exception
    //   222	226	309	java/lang/Exception
    //   231	236	319	java/lang/Exception
    //   286	290	327	java/lang/Exception
    //   5	88	337	finally
    //   98	130	337	finally
    //   140	218	337	finally
    //   237	267	337	finally
    //   277	282	337	finally
    //   343	347	360	java/lang/Exception
    //   352	357	370	java/lang/Exception
  }
  
  public void generateAndCallMarketUri(Context paramContext)
  {
    String str1 = paramContext.getApplicationContext().getPackageName();
    String str2 = "market://details?id=" + str1;
    SDKLogUtils.infoLog("MoreUtil", "Play Store URL- " + str2);
    Intent localIntent = new Intent("android.intent.action.VIEW");
    localIntent.setData(Uri.parse(str2));
    localIntent.setFlags(268435456);
    paramContext.getApplicationContext().startActivity(localIntent);
  }
  
  public String generateReUnionKey(SharePreferences paramSharePreferences)
  {
    long l = System.currentTimeMillis() / 1000L;
    String str = l + "" + getRandomNumber(1000, 9999);
    paramSharePreferences.storeReUnionKey(str);
    SDKLogUtils.infoLog("MoreUtil", "generateReUnionKey reUnionKey: " + str);
    return str;
  }
  
  public JSONObject getAppAndDeviceInfo(Context paramContext)
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("appVersionName", getApplicationVersion(paramContext));
      localJSONObject.put("appVersionCode", getApplicationCode(paramContext));
      String str1 = getDeviceModel();
      String str2 = getDeviceUserName(paramContext);
      if (str1.equalsIgnoreCase(str2)) {
        str2 = "";
      }
      localJSONObject.put("deviceModelName", str1);
      localJSONObject.put("deviceUserInfo", str2);
      return localJSONObject;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
    return null;
  }
  
  public String getApplicationCode(Context paramContext)
  {
    try
    {
      this.packageInfo = paramContext.getPackageManager().getPackageInfo(paramContext.getPackageName(), 0);
      String str = Integer.toString(this.packageInfo.versionCode);
      SDKLogUtils.infoLog("MoreUtil", "applicationCode" + str);
      return str;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      for (;;)
      {
        localNameNotFoundException.printStackTrace();
      }
    }
  }
  
  public String getApplicationVersion(Context paramContext)
  {
    try
    {
      this.packageInfo = paramContext.getPackageManager().getPackageInfo(paramContext.getPackageName(), 0);
      String str = this.packageInfo.versionName;
      SDKLogUtils.infoLog("MoreUtil", "applicationVersion" + str);
      return str;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      for (;;)
      {
        localNameNotFoundException.printStackTrace();
      }
    }
  }
  
  public String getDeviceModel()
  {
    try
    {
      String str1 = Build.MANUFACTURER;
      String str2 = Build.MODEL;
      SDKLogUtils.infoLog("MoreUtil", "manufacturer " + str1 + " model " + str2);
      if (str2.startsWith(str1)) {
        return capitalize(str2);
      }
      String str3 = capitalize(str1) + " " + str2;
      return str3;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      SDKLogUtils.infoLog("MoreUtil", "no name found for deviceName");
    }
    return "ANDROID";
  }
  
  public String getDeviceUserName(Context paramContext)
  {
    for (;;)
    {
      try
      {
        if (Build.VERSION.SDK_INT < 19) {
          continue;
        }
        String str2 = Settings.System.getString(paramContext.getApplicationContext().getContentResolver(), "device_name");
        localObject = str2;
      }
      catch (Exception localException)
      {
        String str1;
        localException.printStackTrace();
        Object localObject = null;
        continue;
      }
      if (localObject == null) {
        break;
      }
      SDKLogUtils.infoLog("MoreUtil", "deviceName " + (String)localObject);
      return (String)localObject;
      str1 = Settings.Secure.getString(paramContext.getApplicationContext().getContentResolver(), "lock_screen_owner_info");
      localObject = str1;
    }
    return getDeviceModel();
  }
  
  /* Error */
  public String getFirmwareDetails(String paramString)
  {
    // Byte code:
    //   0: aload_1
    //   1: ldc_w 675
    //   4: ldc_w 677
    //   7: invokevirtual 681	java/lang/String:replace	(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    //   10: astore_2
    //   11: aconst_null
    //   12: astore_3
    //   13: ldc -73
    //   15: astore 4
    //   17: new 683	org/apache/http/impl/client/DefaultHttpClient
    //   20: dup
    //   21: invokespecial 684	org/apache/http/impl/client/DefaultHttpClient:<init>	()V
    //   24: astore 5
    //   26: new 686	org/apache/http/client/methods/HttpGet
    //   29: dup
    //   30: invokespecial 687	org/apache/http/client/methods/HttpGet:<init>	()V
    //   33: astore 6
    //   35: new 689	java/net/URI
    //   38: dup
    //   39: aload_2
    //   40: invokespecial 690	java/net/URI:<init>	(Ljava/lang/String;)V
    //   43: astore 7
    //   45: aload 6
    //   47: aload 7
    //   49: invokevirtual 694	org/apache/http/client/methods/HttpGet:setURI	(Ljava/net/URI;)V
    //   52: new 696	java/io/BufferedReader
    //   55: dup
    //   56: new 698	java/io/InputStreamReader
    //   59: dup
    //   60: aload 5
    //   62: aload 6
    //   64: invokeinterface 704 2 0
    //   69: invokeinterface 710 1 0
    //   74: invokeinterface 716 1 0
    //   79: invokespecial 719	java/io/InputStreamReader:<init>	(Ljava/io/InputStream;)V
    //   82: invokespecial 722	java/io/BufferedReader:<init>	(Ljava/io/Reader;)V
    //   85: astore 12
    //   87: new 724	java/lang/StringBuffer
    //   90: dup
    //   91: ldc -73
    //   93: invokespecial 725	java/lang/StringBuffer:<init>	(Ljava/lang/String;)V
    //   96: astore 13
    //   98: aload 12
    //   100: invokevirtual 728	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   103: astore 14
    //   105: aload 14
    //   107: ifnull +64 -> 171
    //   110: aload 14
    //   112: ldc -73
    //   114: invokevirtual 222	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   117: ifne -19 -> 98
    //   120: aload 13
    //   122: new 195	java/lang/StringBuilder
    //   125: dup
    //   126: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   129: aload 14
    //   131: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   134: ldc_w 730
    //   137: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   140: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   143: invokevirtual 733	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   146: pop
    //   147: goto -49 -> 98
    //   150: astore 8
    //   152: aload 12
    //   154: astore_3
    //   155: aload 8
    //   157: invokevirtual 510	java/lang/Exception:printStackTrace	()V
    //   160: aload_3
    //   161: ifnull +7 -> 168
    //   164: aload_3
    //   165: invokevirtual 734	java/io/BufferedReader:close	()V
    //   168: aload 4
    //   170: areturn
    //   171: aload 12
    //   173: invokevirtual 734	java/io/BufferedReader:close	()V
    //   176: aload 13
    //   178: invokevirtual 735	java/lang/StringBuffer:toString	()Ljava/lang/String;
    //   181: ldc_w 737
    //   184: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   187: astore 16
    //   189: aload 16
    //   191: ifnull +5084 -> 5275
    //   194: aload 16
    //   196: arraylength
    //   197: istore 17
    //   199: iconst_0
    //   200: istore 18
    //   202: iload 18
    //   204: iload 17
    //   206: if_icmpge +5069 -> 5275
    //   209: aload 16
    //   211: iload 18
    //   213: aaload
    //   214: astore 19
    //   216: aload 19
    //   218: ldc_w 743
    //   221: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   224: astore 20
    //   226: getstatic 747	java/lang/System:out	Ljava/io/PrintStream;
    //   229: new 195	java/lang/StringBuilder
    //   232: dup
    //   233: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   236: ldc_w 749
    //   239: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   242: aload 20
    //   244: iconst_0
    //   245: aaload
    //   246: invokevirtual 750	java/lang/String:toString	()Ljava/lang/String;
    //   249: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   252: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   255: invokevirtual 755	java/io/PrintStream:println	(Ljava/lang/String;)V
    //   258: aload 20
    //   260: iconst_0
    //   261: aaload
    //   262: ldc_w 757
    //   265: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   268: ifeq +109 -> 377
    //   271: aload 20
    //   273: iconst_0
    //   274: aaload
    //   275: ldc_w 759
    //   278: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   281: ifne +96 -> 377
    //   284: getstatic 78	com/belkin/wemo/cache/utils/MoreUtil:usFlag	Z
    //   287: ifeq +90 -> 377
    //   290: aload 19
    //   292: ldc_w 743
    //   295: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   298: astore 107
    //   300: getstatic 92	com/belkin/wemo/cache/utils/MoreUtil:signedusFlag	Z
    //   303: ifne +74 -> 377
    //   306: iconst_4
    //   307: istore 108
    //   309: iload 108
    //   311: aload 107
    //   313: arraylength
    //   314: if_icmpge +40 -> 354
    //   317: new 195	java/lang/StringBuilder
    //   320: dup
    //   321: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   324: aload 4
    //   326: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   329: aload 107
    //   331: iload 108
    //   333: aaload
    //   334: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   337: ldc_w 761
    //   340: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   343: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   346: astore 4
    //   348: iinc 108 1
    //   351: goto -42 -> 309
    //   354: new 195	java/lang/StringBuilder
    //   357: dup
    //   358: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   361: aload 4
    //   363: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   366: ldc_w 763
    //   369: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   372: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   375: astore 4
    //   377: aload 20
    //   379: iconst_0
    //   380: aaload
    //   381: ldc_w 765
    //   384: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   387: ifeq +103 -> 490
    //   390: aload 20
    //   392: iconst_0
    //   393: aaload
    //   394: ldc_w 759
    //   397: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   400: ifne +90 -> 490
    //   403: getstatic 92	com/belkin/wemo/cache/utils/MoreUtil:signedusFlag	Z
    //   406: ifeq +84 -> 490
    //   409: aload 19
    //   411: ldc_w 743
    //   414: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   417: astore 105
    //   419: iconst_4
    //   420: istore 106
    //   422: iload 106
    //   424: aload 105
    //   426: arraylength
    //   427: if_icmpge +40 -> 467
    //   430: new 195	java/lang/StringBuilder
    //   433: dup
    //   434: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   437: aload 4
    //   439: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   442: aload 105
    //   444: iload 106
    //   446: aaload
    //   447: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   450: ldc_w 761
    //   453: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   456: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   459: astore 4
    //   461: iinc 106 1
    //   464: goto -42 -> 422
    //   467: new 195	java/lang/StringBuilder
    //   470: dup
    //   471: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   474: aload 4
    //   476: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   479: ldc_w 763
    //   482: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   485: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   488: astore 4
    //   490: aload 20
    //   492: iconst_0
    //   493: aaload
    //   494: ldc_w 767
    //   497: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   500: ifeq +103 -> 603
    //   503: aload 20
    //   505: iconst_0
    //   506: aaload
    //   507: ldc_w 759
    //   510: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   513: ifne +90 -> 603
    //   516: getstatic 110	com/belkin/wemo/cache/utils/MoreUtil:openWRTSNS	Z
    //   519: ifeq +84 -> 603
    //   522: aload 19
    //   524: ldc_w 743
    //   527: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   530: astore 103
    //   532: iconst_4
    //   533: istore 104
    //   535: iload 104
    //   537: aload 103
    //   539: arraylength
    //   540: if_icmpge +40 -> 580
    //   543: new 195	java/lang/StringBuilder
    //   546: dup
    //   547: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   550: aload 4
    //   552: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   555: aload 103
    //   557: iload 104
    //   559: aaload
    //   560: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   563: ldc_w 761
    //   566: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   569: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   572: astore 4
    //   574: iinc 104 1
    //   577: goto -42 -> 535
    //   580: new 195	java/lang/StringBuilder
    //   583: dup
    //   584: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   587: aload 4
    //   589: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   592: ldc_w 763
    //   595: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   598: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   601: astore 4
    //   603: aload 20
    //   605: iconst_0
    //   606: aaload
    //   607: ldc_w 769
    //   610: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   613: ifeq +109 -> 722
    //   616: aload 20
    //   618: iconst_0
    //   619: aaload
    //   620: ldc_w 759
    //   623: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   626: ifne +96 -> 722
    //   629: getstatic 112	com/belkin/wemo/cache/utils/MoreUtil:openWRTTransSNS	Z
    //   632: ifeq +90 -> 722
    //   635: aload 19
    //   637: ldc_w 743
    //   640: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   643: astore 101
    //   645: getstatic 110	com/belkin/wemo/cache/utils/MoreUtil:openWRTSNS	Z
    //   648: ifne +74 -> 722
    //   651: iconst_4
    //   652: istore 102
    //   654: iload 102
    //   656: aload 101
    //   658: arraylength
    //   659: if_icmpge +40 -> 699
    //   662: new 195	java/lang/StringBuilder
    //   665: dup
    //   666: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   669: aload 4
    //   671: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   674: aload 101
    //   676: iload 102
    //   678: aaload
    //   679: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   682: ldc_w 761
    //   685: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   688: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   691: astore 4
    //   693: iinc 102 1
    //   696: goto -42 -> 654
    //   699: new 195	java/lang/StringBuilder
    //   702: dup
    //   703: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   706: aload 4
    //   708: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   711: ldc_w 763
    //   714: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   717: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   720: astore 4
    //   722: aload 20
    //   724: iconst_0
    //   725: aaload
    //   726: ldc_w 771
    //   729: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   732: ifeq +109 -> 841
    //   735: aload 20
    //   737: iconst_0
    //   738: aaload
    //   739: ldc_w 759
    //   742: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   745: ifne +96 -> 841
    //   748: getstatic 80	com/belkin/wemo/cache/utils/MoreUtil:euFlag	Z
    //   751: ifeq +90 -> 841
    //   754: aload 19
    //   756: ldc_w 743
    //   759: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   762: astore 99
    //   764: getstatic 94	com/belkin/wemo/cache/utils/MoreUtil:signedeuFlag	Z
    //   767: ifne +74 -> 841
    //   770: iconst_4
    //   771: istore 100
    //   773: iload 100
    //   775: aload 99
    //   777: arraylength
    //   778: if_icmpge +40 -> 818
    //   781: new 195	java/lang/StringBuilder
    //   784: dup
    //   785: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   788: aload 4
    //   790: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   793: aload 99
    //   795: iload 100
    //   797: aaload
    //   798: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   801: ldc_w 761
    //   804: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   807: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   810: astore 4
    //   812: iinc 100 1
    //   815: goto -42 -> 773
    //   818: new 195	java/lang/StringBuilder
    //   821: dup
    //   822: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   825: aload 4
    //   827: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   830: ldc_w 763
    //   833: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   836: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   839: astore 4
    //   841: aload 20
    //   843: iconst_0
    //   844: aaload
    //   845: ldc_w 773
    //   848: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   851: ifeq +103 -> 954
    //   854: aload 20
    //   856: iconst_0
    //   857: aaload
    //   858: ldc_w 759
    //   861: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   864: ifne +90 -> 954
    //   867: getstatic 94	com/belkin/wemo/cache/utils/MoreUtil:signedeuFlag	Z
    //   870: ifeq +84 -> 954
    //   873: aload 19
    //   875: ldc_w 743
    //   878: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   881: astore 97
    //   883: iconst_4
    //   884: istore 98
    //   886: iload 98
    //   888: aload 97
    //   890: arraylength
    //   891: if_icmpge +40 -> 931
    //   894: new 195	java/lang/StringBuilder
    //   897: dup
    //   898: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   901: aload 4
    //   903: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   906: aload 97
    //   908: iload 98
    //   910: aaload
    //   911: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   914: ldc_w 761
    //   917: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   920: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   923: astore 4
    //   925: iinc 98 1
    //   928: goto -42 -> 886
    //   931: new 195	java/lang/StringBuilder
    //   934: dup
    //   935: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   938: aload 4
    //   940: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   943: ldc_w 763
    //   946: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   949: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   952: astore 4
    //   954: aload 20
    //   956: iconst_0
    //   957: aaload
    //   958: ldc_w 775
    //   961: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   964: ifeq +103 -> 1067
    //   967: aload 20
    //   969: iconst_0
    //   970: aaload
    //   971: ldc_w 759
    //   974: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   977: ifne +90 -> 1067
    //   980: getstatic 76	com/belkin/wemo/cache/utils/MoreUtil:bridgewwFlag	Z
    //   983: ifeq +84 -> 1067
    //   986: aload 19
    //   988: ldc_w 743
    //   991: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   994: astore 95
    //   996: iconst_4
    //   997: istore 96
    //   999: iload 96
    //   1001: aload 95
    //   1003: arraylength
    //   1004: if_icmpge +40 -> 1044
    //   1007: new 195	java/lang/StringBuilder
    //   1010: dup
    //   1011: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   1014: aload 4
    //   1016: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1019: aload 95
    //   1021: iload 96
    //   1023: aaload
    //   1024: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1027: ldc_w 761
    //   1030: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1033: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1036: astore 4
    //   1038: iinc 96 1
    //   1041: goto -42 -> 999
    //   1044: new 195	java/lang/StringBuilder
    //   1047: dup
    //   1048: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   1051: aload 4
    //   1053: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1056: ldc_w 763
    //   1059: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1062: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1065: astore 4
    //   1067: aload 20
    //   1069: iconst_0
    //   1070: aaload
    //   1071: ldc_w 777
    //   1074: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1077: ifeq +109 -> 1186
    //   1080: aload 20
    //   1082: iconst_0
    //   1083: aaload
    //   1084: ldc_w 759
    //   1087: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1090: ifne +96 -> 1186
    //   1093: getstatic 82	com/belkin/wemo/cache/utils/MoreUtil:lightFlag	Z
    //   1096: ifeq +90 -> 1186
    //   1099: aload 19
    //   1101: ldc_w 743
    //   1104: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   1107: astore 93
    //   1109: getstatic 96	com/belkin/wemo/cache/utils/MoreUtil:signedLightFlag	Z
    //   1112: ifne +74 -> 1186
    //   1115: iconst_4
    //   1116: istore 94
    //   1118: iload 94
    //   1120: aload 93
    //   1122: arraylength
    //   1123: if_icmpge +40 -> 1163
    //   1126: new 195	java/lang/StringBuilder
    //   1129: dup
    //   1130: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   1133: aload 4
    //   1135: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1138: aload 93
    //   1140: iload 94
    //   1142: aaload
    //   1143: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1146: ldc_w 761
    //   1149: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1152: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1155: astore 4
    //   1157: iinc 94 1
    //   1160: goto -42 -> 1118
    //   1163: new 195	java/lang/StringBuilder
    //   1166: dup
    //   1167: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   1170: aload 4
    //   1172: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1175: ldc_w 763
    //   1178: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1181: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1184: astore 4
    //   1186: aload 20
    //   1188: iconst_0
    //   1189: aaload
    //   1190: ldc_w 779
    //   1193: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1196: ifeq +103 -> 1299
    //   1199: aload 20
    //   1201: iconst_0
    //   1202: aaload
    //   1203: ldc_w 759
    //   1206: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1209: ifne +90 -> 1299
    //   1212: getstatic 84	com/belkin/wemo/cache/utils/MoreUtil:openWRTlight	Z
    //   1215: ifeq +84 -> 1299
    //   1218: aload 19
    //   1220: ldc_w 743
    //   1223: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   1226: astore 91
    //   1228: iconst_4
    //   1229: istore 92
    //   1231: iload 92
    //   1233: aload 91
    //   1235: arraylength
    //   1236: if_icmpge +40 -> 1276
    //   1239: new 195	java/lang/StringBuilder
    //   1242: dup
    //   1243: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   1246: aload 4
    //   1248: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1251: aload 91
    //   1253: iload 92
    //   1255: aaload
    //   1256: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1259: ldc_w 761
    //   1262: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1265: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1268: astore 4
    //   1270: iinc 92 1
    //   1273: goto -42 -> 1231
    //   1276: new 195	java/lang/StringBuilder
    //   1279: dup
    //   1280: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   1283: aload 4
    //   1285: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1288: ldc_w 763
    //   1291: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1294: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1297: astore 4
    //   1299: aload 20
    //   1301: iconst_0
    //   1302: aaload
    //   1303: ldc_w 781
    //   1306: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1309: ifeq +109 -> 1418
    //   1312: aload 20
    //   1314: iconst_0
    //   1315: aaload
    //   1316: ldc_w 759
    //   1319: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1322: ifne +96 -> 1418
    //   1325: getstatic 86	com/belkin/wemo/cache/utils/MoreUtil:openWRTTranslight	Z
    //   1328: ifeq +90 -> 1418
    //   1331: aload 19
    //   1333: ldc_w 743
    //   1336: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   1339: astore 89
    //   1341: getstatic 84	com/belkin/wemo/cache/utils/MoreUtil:openWRTlight	Z
    //   1344: ifne +74 -> 1418
    //   1347: iconst_4
    //   1348: istore 90
    //   1350: iload 90
    //   1352: aload 89
    //   1354: arraylength
    //   1355: if_icmpge +40 -> 1395
    //   1358: new 195	java/lang/StringBuilder
    //   1361: dup
    //   1362: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   1365: aload 4
    //   1367: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1370: aload 89
    //   1372: iload 90
    //   1374: aaload
    //   1375: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1378: ldc_w 761
    //   1381: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1384: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1387: astore 4
    //   1389: iinc 90 1
    //   1392: goto -42 -> 1350
    //   1395: new 195	java/lang/StringBuilder
    //   1398: dup
    //   1399: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   1402: aload 4
    //   1404: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1407: ldc_w 763
    //   1410: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1413: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1416: astore 4
    //   1418: aload 20
    //   1420: iconst_0
    //   1421: aaload
    //   1422: ldc_w 783
    //   1425: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1428: ifeq +103 -> 1531
    //   1431: aload 20
    //   1433: iconst_0
    //   1434: aaload
    //   1435: ldc_w 759
    //   1438: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1441: ifne +90 -> 1531
    //   1444: getstatic 104	com/belkin/wemo/cache/utils/MoreUtil:makerFlag	Z
    //   1447: ifeq +84 -> 1531
    //   1450: aload 19
    //   1452: ldc_w 743
    //   1455: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   1458: astore 87
    //   1460: iconst_4
    //   1461: istore 88
    //   1463: iload 88
    //   1465: aload 87
    //   1467: arraylength
    //   1468: if_icmpge +40 -> 1508
    //   1471: new 195	java/lang/StringBuilder
    //   1474: dup
    //   1475: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   1478: aload 4
    //   1480: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1483: aload 87
    //   1485: iload 88
    //   1487: aaload
    //   1488: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1491: ldc_w 761
    //   1494: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1497: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1500: astore 4
    //   1502: iinc 88 1
    //   1505: goto -42 -> 1463
    //   1508: new 195	java/lang/StringBuilder
    //   1511: dup
    //   1512: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   1515: aload 4
    //   1517: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1520: ldc_w 763
    //   1523: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1526: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1529: astore 4
    //   1531: aload 20
    //   1533: iconst_0
    //   1534: aaload
    //   1535: ldc_w 785
    //   1538: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1541: ifeq +103 -> 1644
    //   1544: aload 20
    //   1546: iconst_0
    //   1547: aaload
    //   1548: ldc_w 759
    //   1551: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1554: ifne +90 -> 1644
    //   1557: getstatic 96	com/belkin/wemo/cache/utils/MoreUtil:signedLightFlag	Z
    //   1560: ifeq +84 -> 1644
    //   1563: aload 19
    //   1565: ldc_w 743
    //   1568: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   1571: astore 85
    //   1573: iconst_4
    //   1574: istore 86
    //   1576: iload 86
    //   1578: aload 85
    //   1580: arraylength
    //   1581: if_icmpge +40 -> 1621
    //   1584: new 195	java/lang/StringBuilder
    //   1587: dup
    //   1588: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   1591: aload 4
    //   1593: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1596: aload 85
    //   1598: iload 86
    //   1600: aaload
    //   1601: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1604: ldc_w 761
    //   1607: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1610: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1613: astore 4
    //   1615: iinc 86 1
    //   1618: goto -42 -> 1576
    //   1621: new 195	java/lang/StringBuilder
    //   1624: dup
    //   1625: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   1628: aload 4
    //   1630: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1633: ldc_w 763
    //   1636: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1639: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1642: astore 4
    //   1644: aload 20
    //   1646: iconst_0
    //   1647: aaload
    //   1648: ldc_w 787
    //   1651: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1654: ifeq +109 -> 1763
    //   1657: aload 20
    //   1659: iconst_0
    //   1660: aaload
    //   1661: ldc_w 759
    //   1664: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1667: ifne +96 -> 1763
    //   1670: getstatic 88	com/belkin/wemo/cache/utils/MoreUtil:insightFlag	Z
    //   1673: ifeq +90 -> 1763
    //   1676: aload 19
    //   1678: ldc_w 743
    //   1681: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   1684: astore 83
    //   1686: getstatic 90	com/belkin/wemo/cache/utils/MoreUtil:signedInsightFlag	Z
    //   1689: ifne +74 -> 1763
    //   1692: iconst_4
    //   1693: istore 84
    //   1695: iload 84
    //   1697: aload 83
    //   1699: arraylength
    //   1700: if_icmpge +40 -> 1740
    //   1703: new 195	java/lang/StringBuilder
    //   1706: dup
    //   1707: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   1710: aload 4
    //   1712: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1715: aload 83
    //   1717: iload 84
    //   1719: aaload
    //   1720: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1723: ldc_w 761
    //   1726: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1729: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1732: astore 4
    //   1734: iinc 84 1
    //   1737: goto -42 -> 1695
    //   1740: new 195	java/lang/StringBuilder
    //   1743: dup
    //   1744: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   1747: aload 4
    //   1749: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1752: ldc_w 763
    //   1755: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1758: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1761: astore 4
    //   1763: aload 20
    //   1765: iconst_0
    //   1766: aaload
    //   1767: ldc_w 789
    //   1770: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1773: ifeq +103 -> 1876
    //   1776: aload 20
    //   1778: iconst_0
    //   1779: aaload
    //   1780: ldc_w 759
    //   1783: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1786: ifne +90 -> 1876
    //   1789: getstatic 90	com/belkin/wemo/cache/utils/MoreUtil:signedInsightFlag	Z
    //   1792: ifeq +84 -> 1876
    //   1795: aload 19
    //   1797: ldc_w 743
    //   1800: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   1803: astore 81
    //   1805: iconst_4
    //   1806: istore 82
    //   1808: iload 82
    //   1810: aload 81
    //   1812: arraylength
    //   1813: if_icmpge +40 -> 1853
    //   1816: new 195	java/lang/StringBuilder
    //   1819: dup
    //   1820: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   1823: aload 4
    //   1825: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1828: aload 81
    //   1830: iload 82
    //   1832: aaload
    //   1833: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1836: ldc_w 761
    //   1839: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1842: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1845: astore 4
    //   1847: iinc 82 1
    //   1850: goto -42 -> 1808
    //   1853: new 195	java/lang/StringBuilder
    //   1856: dup
    //   1857: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   1860: aload 4
    //   1862: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1865: ldc_w 763
    //   1868: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1871: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1874: astore 4
    //   1876: aload 20
    //   1878: iconst_0
    //   1879: aaload
    //   1880: ldc_w 791
    //   1883: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1886: ifeq +103 -> 1989
    //   1889: aload 20
    //   1891: iconst_0
    //   1892: aaload
    //   1893: ldc_w 759
    //   1896: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1899: ifne +90 -> 1989
    //   1902: getstatic 106	com/belkin/wemo/cache/utils/MoreUtil:openWRTinsight	Z
    //   1905: ifeq +84 -> 1989
    //   1908: aload 19
    //   1910: ldc_w 743
    //   1913: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   1916: astore 79
    //   1918: iconst_4
    //   1919: istore 80
    //   1921: iload 80
    //   1923: aload 79
    //   1925: arraylength
    //   1926: if_icmpge +40 -> 1966
    //   1929: new 195	java/lang/StringBuilder
    //   1932: dup
    //   1933: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   1936: aload 4
    //   1938: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1941: aload 79
    //   1943: iload 80
    //   1945: aaload
    //   1946: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1949: ldc_w 761
    //   1952: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1955: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1958: astore 4
    //   1960: iinc 80 1
    //   1963: goto -42 -> 1921
    //   1966: new 195	java/lang/StringBuilder
    //   1969: dup
    //   1970: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   1973: aload 4
    //   1975: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1978: ldc_w 763
    //   1981: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1984: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1987: astore 4
    //   1989: aload 20
    //   1991: iconst_0
    //   1992: aaload
    //   1993: ldc_w 793
    //   1996: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   1999: ifeq +109 -> 2108
    //   2002: aload 20
    //   2004: iconst_0
    //   2005: aaload
    //   2006: ldc_w 759
    //   2009: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   2012: ifne +96 -> 2108
    //   2015: getstatic 108	com/belkin/wemo/cache/utils/MoreUtil:openWRTTransinsight	Z
    //   2018: ifeq +90 -> 2108
    //   2021: aload 19
    //   2023: ldc_w 743
    //   2026: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   2029: astore 77
    //   2031: getstatic 106	com/belkin/wemo/cache/utils/MoreUtil:openWRTinsight	Z
    //   2034: ifne +74 -> 2108
    //   2037: iconst_4
    //   2038: istore 78
    //   2040: iload 78
    //   2042: aload 77
    //   2044: arraylength
    //   2045: if_icmpge +40 -> 2085
    //   2048: new 195	java/lang/StringBuilder
    //   2051: dup
    //   2052: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   2055: aload 4
    //   2057: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2060: aload 77
    //   2062: iload 78
    //   2064: aaload
    //   2065: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2068: ldc_w 761
    //   2071: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2074: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2077: astore 4
    //   2079: iinc 78 1
    //   2082: goto -42 -> 2040
    //   2085: new 195	java/lang/StringBuilder
    //   2088: dup
    //   2089: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   2092: aload 4
    //   2094: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2097: ldc_w 763
    //   2100: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2103: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2106: astore 4
    //   2108: aload 20
    //   2110: iconst_0
    //   2111: aaload
    //   2112: ldc_w 795
    //   2115: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   2118: ifeq +103 -> 2221
    //   2121: aload 20
    //   2123: iconst_0
    //   2124: aaload
    //   2125: ldc_w 759
    //   2128: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   2131: ifne +90 -> 2221
    //   2134: getstatic 98	com/belkin/wemo/cache/utils/MoreUtil:slowcookerUSFlag	Z
    //   2137: ifeq +84 -> 2221
    //   2140: aload 19
    //   2142: ldc_w 743
    //   2145: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   2148: astore 75
    //   2150: iconst_4
    //   2151: istore 76
    //   2153: iload 76
    //   2155: aload 75
    //   2157: arraylength
    //   2158: if_icmpge +40 -> 2198
    //   2161: new 195	java/lang/StringBuilder
    //   2164: dup
    //   2165: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   2168: aload 4
    //   2170: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2173: aload 75
    //   2175: iload 76
    //   2177: aaload
    //   2178: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2181: ldc_w 761
    //   2184: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2187: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2190: astore 4
    //   2192: iinc 76 1
    //   2195: goto -42 -> 2153
    //   2198: new 195	java/lang/StringBuilder
    //   2201: dup
    //   2202: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   2205: aload 4
    //   2207: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2210: ldc_w 763
    //   2213: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2216: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2219: astore 4
    //   2221: aload 20
    //   2223: iconst_0
    //   2224: aaload
    //   2225: ldc_w 797
    //   2228: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   2231: ifeq +103 -> 2334
    //   2234: aload 20
    //   2236: iconst_0
    //   2237: aaload
    //   2238: ldc_w 759
    //   2241: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   2244: ifne +90 -> 2334
    //   2247: getstatic 158	com/belkin/wemo/cache/utils/MoreUtil:CoffeeMakerFlag	Z
    //   2250: ifeq +84 -> 2334
    //   2253: aload 19
    //   2255: ldc_w 743
    //   2258: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   2261: astore 73
    //   2263: iconst_4
    //   2264: istore 74
    //   2266: iload 74
    //   2268: aload 73
    //   2270: arraylength
    //   2271: if_icmpge +40 -> 2311
    //   2274: new 195	java/lang/StringBuilder
    //   2277: dup
    //   2278: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   2281: aload 4
    //   2283: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2286: aload 73
    //   2288: iload 74
    //   2290: aaload
    //   2291: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2294: ldc_w 761
    //   2297: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2300: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2303: astore 4
    //   2305: iinc 74 1
    //   2308: goto -42 -> 2266
    //   2311: new 195	java/lang/StringBuilder
    //   2314: dup
    //   2315: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   2318: aload 4
    //   2320: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2323: ldc_w 763
    //   2326: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2329: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2332: astore 4
    //   2334: aload 20
    //   2336: iconst_0
    //   2337: aaload
    //   2338: ldc_w 799
    //   2341: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   2344: ifeq +103 -> 2447
    //   2347: aload 20
    //   2349: iconst_0
    //   2350: aaload
    //   2351: ldc_w 759
    //   2354: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   2357: ifne +90 -> 2447
    //   2360: getstatic 154	com/belkin/wemo/cache/utils/MoreUtil:HeaterAFlag	Z
    //   2363: ifeq +84 -> 2447
    //   2366: aload 19
    //   2368: ldc_w 743
    //   2371: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   2374: astore 71
    //   2376: iconst_4
    //   2377: istore 72
    //   2379: iload 72
    //   2381: aload 71
    //   2383: arraylength
    //   2384: if_icmpge +40 -> 2424
    //   2387: new 195	java/lang/StringBuilder
    //   2390: dup
    //   2391: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   2394: aload 4
    //   2396: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2399: aload 71
    //   2401: iload 72
    //   2403: aaload
    //   2404: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2407: ldc_w 761
    //   2410: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2413: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2416: astore 4
    //   2418: iinc 72 1
    //   2421: goto -42 -> 2379
    //   2424: new 195	java/lang/StringBuilder
    //   2427: dup
    //   2428: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   2431: aload 4
    //   2433: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2436: ldc_w 763
    //   2439: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2442: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2445: astore 4
    //   2447: aload 20
    //   2449: iconst_0
    //   2450: aaload
    //   2451: ldc_w 801
    //   2454: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   2457: ifeq +103 -> 2560
    //   2460: aload 20
    //   2462: iconst_0
    //   2463: aaload
    //   2464: ldc_w 759
    //   2467: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   2470: ifne +90 -> 2560
    //   2473: getstatic 156	com/belkin/wemo/cache/utils/MoreUtil:HeaterBFlag	Z
    //   2476: ifeq +84 -> 2560
    //   2479: aload 19
    //   2481: ldc_w 743
    //   2484: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   2487: astore 69
    //   2489: iconst_4
    //   2490: istore 70
    //   2492: iload 70
    //   2494: aload 69
    //   2496: arraylength
    //   2497: if_icmpge +40 -> 2537
    //   2500: new 195	java/lang/StringBuilder
    //   2503: dup
    //   2504: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   2507: aload 4
    //   2509: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2512: aload 69
    //   2514: iload 70
    //   2516: aaload
    //   2517: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2520: ldc_w 761
    //   2523: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2526: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2529: astore 4
    //   2531: iinc 70 1
    //   2534: goto -42 -> 2492
    //   2537: new 195	java/lang/StringBuilder
    //   2540: dup
    //   2541: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   2544: aload 4
    //   2546: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2549: ldc_w 763
    //   2552: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2555: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2558: astore 4
    //   2560: aload 20
    //   2562: iconst_0
    //   2563: aaload
    //   2564: ldc_w 803
    //   2567: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   2570: ifeq +103 -> 2673
    //   2573: aload 20
    //   2575: iconst_0
    //   2576: aaload
    //   2577: ldc_w 759
    //   2580: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   2583: ifne +90 -> 2673
    //   2586: getstatic 160	com/belkin/wemo/cache/utils/MoreUtil:HumidifierFlag	Z
    //   2589: ifeq +84 -> 2673
    //   2592: aload 19
    //   2594: ldc_w 743
    //   2597: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   2600: astore 67
    //   2602: iconst_4
    //   2603: istore 68
    //   2605: iload 68
    //   2607: aload 67
    //   2609: arraylength
    //   2610: if_icmpge +40 -> 2650
    //   2613: new 195	java/lang/StringBuilder
    //   2616: dup
    //   2617: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   2620: aload 4
    //   2622: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2625: aload 67
    //   2627: iload 68
    //   2629: aaload
    //   2630: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2633: ldc_w 761
    //   2636: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2639: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2642: astore 4
    //   2644: iinc 68 1
    //   2647: goto -42 -> 2605
    //   2650: new 195	java/lang/StringBuilder
    //   2653: dup
    //   2654: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   2657: aload 4
    //   2659: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2662: ldc_w 763
    //   2665: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2668: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2671: astore 4
    //   2673: aload 20
    //   2675: iconst_0
    //   2676: aaload
    //   2677: ldc_w 805
    //   2680: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   2683: ifeq +103 -> 2786
    //   2686: aload 20
    //   2688: iconst_0
    //   2689: aaload
    //   2690: ldc_w 759
    //   2693: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   2696: ifne +90 -> 2786
    //   2699: getstatic 162	com/belkin/wemo/cache/utils/MoreUtil:HumidifierBFlag	Z
    //   2702: ifeq +84 -> 2786
    //   2705: aload 19
    //   2707: ldc_w 743
    //   2710: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   2713: astore 65
    //   2715: iconst_4
    //   2716: istore 66
    //   2718: iload 66
    //   2720: aload 65
    //   2722: arraylength
    //   2723: if_icmpge +40 -> 2763
    //   2726: new 195	java/lang/StringBuilder
    //   2729: dup
    //   2730: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   2733: aload 4
    //   2735: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2738: aload 65
    //   2740: iload 66
    //   2742: aaload
    //   2743: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2746: ldc_w 761
    //   2749: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2752: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2755: astore 4
    //   2757: iinc 66 1
    //   2760: goto -42 -> 2718
    //   2763: new 195	java/lang/StringBuilder
    //   2766: dup
    //   2767: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   2770: aload 4
    //   2772: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2775: ldc_w 763
    //   2778: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2781: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2784: astore 4
    //   2786: aload 20
    //   2788: iconst_0
    //   2789: aaload
    //   2790: ldc_w 807
    //   2793: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   2796: ifeq +103 -> 2899
    //   2799: aload 20
    //   2801: iconst_0
    //   2802: aaload
    //   2803: ldc_w 759
    //   2806: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   2809: ifne +90 -> 2899
    //   2812: getstatic 164	com/belkin/wemo/cache/utils/MoreUtil:AirPurifierFlag	Z
    //   2815: ifeq +84 -> 2899
    //   2818: aload 19
    //   2820: ldc_w 743
    //   2823: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   2826: astore 63
    //   2828: iconst_4
    //   2829: istore 64
    //   2831: iload 64
    //   2833: aload 63
    //   2835: arraylength
    //   2836: if_icmpge +40 -> 2876
    //   2839: new 195	java/lang/StringBuilder
    //   2842: dup
    //   2843: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   2846: aload 4
    //   2848: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2851: aload 63
    //   2853: iload 64
    //   2855: aaload
    //   2856: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2859: ldc_w 761
    //   2862: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2865: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2868: astore 4
    //   2870: iinc 64 1
    //   2873: goto -42 -> 2831
    //   2876: new 195	java/lang/StringBuilder
    //   2879: dup
    //   2880: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   2883: aload 4
    //   2885: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2888: ldc_w 763
    //   2891: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2894: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2897: astore 4
    //   2899: aload 20
    //   2901: iconst_0
    //   2902: aaload
    //   2903: ldc_w 809
    //   2906: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   2909: ifeq +103 -> 3012
    //   2912: aload 20
    //   2914: iconst_0
    //   2915: aaload
    //   2916: ldc_w 759
    //   2919: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   2922: ifne +90 -> 3012
    //   2925: getstatic 126	com/belkin/wemo/cache/utils/MoreUtil:bulbWWflag	Z
    //   2928: ifeq +84 -> 3012
    //   2931: aload 19
    //   2933: ldc_w 743
    //   2936: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   2939: astore 61
    //   2941: iconst_4
    //   2942: istore 62
    //   2944: iload 62
    //   2946: aload 61
    //   2948: arraylength
    //   2949: if_icmpge +40 -> 2989
    //   2952: new 195	java/lang/StringBuilder
    //   2955: dup
    //   2956: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   2959: aload 4
    //   2961: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2964: aload 61
    //   2966: iload 62
    //   2968: aaload
    //   2969: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2972: ldc_w 761
    //   2975: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2978: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2981: astore 4
    //   2983: iinc 62 1
    //   2986: goto -42 -> 2944
    //   2989: new 195	java/lang/StringBuilder
    //   2992: dup
    //   2993: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   2996: aload 4
    //   2998: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3001: ldc_w 763
    //   3004: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3007: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3010: astore 4
    //   3012: aload 20
    //   3014: iconst_0
    //   3015: aaload
    //   3016: ldc_w 811
    //   3019: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   3022: ifeq +103 -> 3125
    //   3025: aload 20
    //   3027: iconst_0
    //   3028: aaload
    //   3029: ldc_w 759
    //   3032: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   3035: ifne +90 -> 3125
    //   3038: getstatic 128	com/belkin/wemo/cache/utils/MoreUtil:openWRTInsightV2	Z
    //   3041: ifeq +84 -> 3125
    //   3044: aload 19
    //   3046: ldc_w 743
    //   3049: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   3052: astore 59
    //   3054: iconst_4
    //   3055: istore 60
    //   3057: iload 60
    //   3059: aload 59
    //   3061: arraylength
    //   3062: if_icmpge +40 -> 3102
    //   3065: new 195	java/lang/StringBuilder
    //   3068: dup
    //   3069: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   3072: aload 4
    //   3074: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3077: aload 59
    //   3079: iload 60
    //   3081: aaload
    //   3082: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3085: ldc_w 761
    //   3088: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3091: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3094: astore 4
    //   3096: iinc 60 1
    //   3099: goto -42 -> 3057
    //   3102: new 195	java/lang/StringBuilder
    //   3105: dup
    //   3106: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   3109: aload 4
    //   3111: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3114: ldc_w 813
    //   3117: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3120: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3123: astore 4
    //   3125: aload 20
    //   3127: iconst_0
    //   3128: aaload
    //   3129: ldc_w 815
    //   3132: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   3135: ifeq +103 -> 3238
    //   3138: aload 20
    //   3140: iconst_0
    //   3141: aaload
    //   3142: ldc_w 759
    //   3145: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   3148: ifne +90 -> 3238
    //   3151: getstatic 114	com/belkin/wemo/cache/utils/MoreUtil:openWRTSlowCooker	Z
    //   3154: ifeq +84 -> 3238
    //   3157: aload 19
    //   3159: ldc_w 743
    //   3162: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   3165: astore 57
    //   3167: iconst_4
    //   3168: istore 58
    //   3170: iload 58
    //   3172: aload 57
    //   3174: arraylength
    //   3175: if_icmpge +40 -> 3215
    //   3178: new 195	java/lang/StringBuilder
    //   3181: dup
    //   3182: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   3185: aload 4
    //   3187: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3190: aload 57
    //   3192: iload 58
    //   3194: aaload
    //   3195: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3198: ldc_w 761
    //   3201: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3204: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3207: astore 4
    //   3209: iinc 58 1
    //   3212: goto -42 -> 3170
    //   3215: new 195	java/lang/StringBuilder
    //   3218: dup
    //   3219: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   3222: aload 4
    //   3224: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3227: ldc_w 763
    //   3230: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3233: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3236: astore 4
    //   3238: aload 20
    //   3240: iconst_0
    //   3241: aaload
    //   3242: ldc_w 817
    //   3245: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   3248: ifeq +103 -> 3351
    //   3251: aload 20
    //   3253: iconst_0
    //   3254: aaload
    //   3255: ldc_w 759
    //   3258: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   3261: ifne +90 -> 3351
    //   3264: getstatic 116	com/belkin/wemo/cache/utils/MoreUtil:openWRTTransSlowCooker	Z
    //   3267: ifeq +84 -> 3351
    //   3270: aload 19
    //   3272: ldc_w 743
    //   3275: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   3278: astore 55
    //   3280: iconst_4
    //   3281: istore 56
    //   3283: iload 56
    //   3285: aload 55
    //   3287: arraylength
    //   3288: if_icmpge +40 -> 3328
    //   3291: new 195	java/lang/StringBuilder
    //   3294: dup
    //   3295: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   3298: aload 4
    //   3300: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3303: aload 55
    //   3305: iload 56
    //   3307: aaload
    //   3308: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3311: ldc_w 761
    //   3314: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3317: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3320: astore 4
    //   3322: iinc 56 1
    //   3325: goto -42 -> 3283
    //   3328: new 195	java/lang/StringBuilder
    //   3331: dup
    //   3332: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   3335: aload 4
    //   3337: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3340: ldc_w 763
    //   3343: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3346: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3349: astore 4
    //   3351: aload 20
    //   3353: iconst_0
    //   3354: aaload
    //   3355: ldc_w 819
    //   3358: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   3361: ifeq +103 -> 3464
    //   3364: aload 20
    //   3366: iconst_0
    //   3367: aaload
    //   3368: ldc_w 759
    //   3371: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   3374: ifne +90 -> 3464
    //   3377: getstatic 130	com/belkin/wemo/cache/utils/MoreUtil:openWRTTransHumidifier	Z
    //   3380: ifeq +84 -> 3464
    //   3383: aload 19
    //   3385: ldc_w 743
    //   3388: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   3391: astore 53
    //   3393: iconst_4
    //   3394: istore 54
    //   3396: iload 54
    //   3398: aload 53
    //   3400: arraylength
    //   3401: if_icmpge +40 -> 3441
    //   3404: new 195	java/lang/StringBuilder
    //   3407: dup
    //   3408: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   3411: aload 4
    //   3413: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3416: aload 53
    //   3418: iload 54
    //   3420: aaload
    //   3421: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3424: ldc_w 761
    //   3427: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3430: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3433: astore 4
    //   3435: iinc 54 1
    //   3438: goto -42 -> 3396
    //   3441: new 195	java/lang/StringBuilder
    //   3444: dup
    //   3445: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   3448: aload 4
    //   3450: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3453: ldc_w 763
    //   3456: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3459: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3462: astore 4
    //   3464: aload 20
    //   3466: iconst_0
    //   3467: aaload
    //   3468: ldc_w 821
    //   3471: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   3474: ifeq +103 -> 3577
    //   3477: aload 20
    //   3479: iconst_0
    //   3480: aaload
    //   3481: ldc_w 759
    //   3484: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   3487: ifne +90 -> 3577
    //   3490: getstatic 132	com/belkin/wemo/cache/utils/MoreUtil:openWRTHumidifier	Z
    //   3493: ifeq +84 -> 3577
    //   3496: aload 19
    //   3498: ldc_w 743
    //   3501: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   3504: astore 51
    //   3506: iconst_4
    //   3507: istore 52
    //   3509: iload 52
    //   3511: aload 51
    //   3513: arraylength
    //   3514: if_icmpge +40 -> 3554
    //   3517: new 195	java/lang/StringBuilder
    //   3520: dup
    //   3521: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   3524: aload 4
    //   3526: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3529: aload 51
    //   3531: iload 52
    //   3533: aaload
    //   3534: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3537: ldc_w 761
    //   3540: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3543: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3546: astore 4
    //   3548: iinc 52 1
    //   3551: goto -42 -> 3509
    //   3554: new 195	java/lang/StringBuilder
    //   3557: dup
    //   3558: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   3561: aload 4
    //   3563: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3566: ldc_w 763
    //   3569: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3572: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3575: astore 4
    //   3577: aload 20
    //   3579: iconst_0
    //   3580: aaload
    //   3581: ldc_w 823
    //   3584: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   3587: ifeq +103 -> 3690
    //   3590: aload 20
    //   3592: iconst_0
    //   3593: aaload
    //   3594: ldc_w 759
    //   3597: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   3600: ifne +90 -> 3690
    //   3603: getstatic 134	com/belkin/wemo/cache/utils/MoreUtil:openWRTTransHumidifierB	Z
    //   3606: ifeq +84 -> 3690
    //   3609: aload 19
    //   3611: ldc_w 743
    //   3614: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   3617: astore 49
    //   3619: iconst_4
    //   3620: istore 50
    //   3622: iload 50
    //   3624: aload 49
    //   3626: arraylength
    //   3627: if_icmpge +40 -> 3667
    //   3630: new 195	java/lang/StringBuilder
    //   3633: dup
    //   3634: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   3637: aload 4
    //   3639: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3642: aload 49
    //   3644: iload 50
    //   3646: aaload
    //   3647: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3650: ldc_w 761
    //   3653: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3656: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3659: astore 4
    //   3661: iinc 50 1
    //   3664: goto -42 -> 3622
    //   3667: new 195	java/lang/StringBuilder
    //   3670: dup
    //   3671: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   3674: aload 4
    //   3676: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3679: ldc_w 763
    //   3682: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3685: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3688: astore 4
    //   3690: aload 20
    //   3692: iconst_0
    //   3693: aaload
    //   3694: ldc_w 825
    //   3697: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   3700: ifeq +103 -> 3803
    //   3703: aload 20
    //   3705: iconst_0
    //   3706: aaload
    //   3707: ldc_w 759
    //   3710: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   3713: ifne +90 -> 3803
    //   3716: getstatic 136	com/belkin/wemo/cache/utils/MoreUtil:openWRTHumidifierB	Z
    //   3719: ifeq +84 -> 3803
    //   3722: aload 19
    //   3724: ldc_w 743
    //   3727: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   3730: astore 47
    //   3732: iconst_4
    //   3733: istore 48
    //   3735: iload 48
    //   3737: aload 47
    //   3739: arraylength
    //   3740: if_icmpge +40 -> 3780
    //   3743: new 195	java/lang/StringBuilder
    //   3746: dup
    //   3747: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   3750: aload 4
    //   3752: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3755: aload 47
    //   3757: iload 48
    //   3759: aaload
    //   3760: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3763: ldc_w 761
    //   3766: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3769: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3772: astore 4
    //   3774: iinc 48 1
    //   3777: goto -42 -> 3735
    //   3780: new 195	java/lang/StringBuilder
    //   3783: dup
    //   3784: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   3787: aload 4
    //   3789: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3792: ldc_w 763
    //   3795: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3798: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3801: astore 4
    //   3803: aload 20
    //   3805: iconst_0
    //   3806: aaload
    //   3807: ldc_w 827
    //   3810: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   3813: ifeq +103 -> 3916
    //   3816: aload 20
    //   3818: iconst_0
    //   3819: aaload
    //   3820: ldc_w 759
    //   3823: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   3826: ifne +90 -> 3916
    //   3829: getstatic 124	com/belkin/wemo/cache/utils/MoreUtil:openWRTTransMaker	Z
    //   3832: ifeq +84 -> 3916
    //   3835: aload 19
    //   3837: ldc_w 743
    //   3840: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   3843: astore 45
    //   3845: iconst_4
    //   3846: istore 46
    //   3848: iload 46
    //   3850: aload 45
    //   3852: arraylength
    //   3853: if_icmpge +40 -> 3893
    //   3856: new 195	java/lang/StringBuilder
    //   3859: dup
    //   3860: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   3863: aload 4
    //   3865: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3868: aload 45
    //   3870: iload 46
    //   3872: aaload
    //   3873: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3876: ldc_w 761
    //   3879: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3882: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3885: astore 4
    //   3887: iinc 46 1
    //   3890: goto -42 -> 3848
    //   3893: new 195	java/lang/StringBuilder
    //   3896: dup
    //   3897: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   3900: aload 4
    //   3902: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3905: ldc_w 763
    //   3908: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3911: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3914: astore 4
    //   3916: aload 20
    //   3918: iconst_0
    //   3919: aaload
    //   3920: ldc_w 829
    //   3923: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   3926: ifeq +103 -> 4029
    //   3929: aload 20
    //   3931: iconst_0
    //   3932: aaload
    //   3933: ldc_w 759
    //   3936: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   3939: ifne +90 -> 4029
    //   3942: getstatic 122	com/belkin/wemo/cache/utils/MoreUtil:openWRTMaker	Z
    //   3945: ifeq +84 -> 4029
    //   3948: aload 19
    //   3950: ldc_w 743
    //   3953: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   3956: astore 43
    //   3958: iconst_4
    //   3959: istore 44
    //   3961: iload 44
    //   3963: aload 43
    //   3965: arraylength
    //   3966: if_icmpge +40 -> 4006
    //   3969: new 195	java/lang/StringBuilder
    //   3972: dup
    //   3973: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   3976: aload 4
    //   3978: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3981: aload 43
    //   3983: iload 44
    //   3985: aaload
    //   3986: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3989: ldc_w 761
    //   3992: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3995: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3998: astore 4
    //   4000: iinc 44 1
    //   4003: goto -42 -> 3961
    //   4006: new 195	java/lang/StringBuilder
    //   4009: dup
    //   4010: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   4013: aload 4
    //   4015: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4018: ldc_w 763
    //   4021: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4024: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4027: astore 4
    //   4029: aload 20
    //   4031: iconst_0
    //   4032: aaload
    //   4033: ldc_w 831
    //   4036: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   4039: ifeq +103 -> 4142
    //   4042: aload 20
    //   4044: iconst_0
    //   4045: aaload
    //   4046: ldc_w 759
    //   4049: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   4052: ifne +90 -> 4142
    //   4055: getstatic 138	com/belkin/wemo/cache/utils/MoreUtil:openWRTTransHeaterA	Z
    //   4058: ifeq +84 -> 4142
    //   4061: aload 19
    //   4063: ldc_w 743
    //   4066: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   4069: astore 41
    //   4071: iconst_4
    //   4072: istore 42
    //   4074: iload 42
    //   4076: aload 41
    //   4078: arraylength
    //   4079: if_icmpge +40 -> 4119
    //   4082: new 195	java/lang/StringBuilder
    //   4085: dup
    //   4086: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   4089: aload 4
    //   4091: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4094: aload 41
    //   4096: iload 42
    //   4098: aaload
    //   4099: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4102: ldc_w 761
    //   4105: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4108: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4111: astore 4
    //   4113: iinc 42 1
    //   4116: goto -42 -> 4074
    //   4119: new 195	java/lang/StringBuilder
    //   4122: dup
    //   4123: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   4126: aload 4
    //   4128: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4131: ldc_w 763
    //   4134: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4137: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4140: astore 4
    //   4142: aload 20
    //   4144: iconst_0
    //   4145: aaload
    //   4146: ldc_w 833
    //   4149: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   4152: ifeq +103 -> 4255
    //   4155: aload 20
    //   4157: iconst_0
    //   4158: aaload
    //   4159: ldc_w 759
    //   4162: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   4165: ifne +90 -> 4255
    //   4168: getstatic 140	com/belkin/wemo/cache/utils/MoreUtil:openWRTHeaterA	Z
    //   4171: ifeq +84 -> 4255
    //   4174: aload 19
    //   4176: ldc_w 743
    //   4179: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   4182: astore 39
    //   4184: iconst_4
    //   4185: istore 40
    //   4187: iload 40
    //   4189: aload 39
    //   4191: arraylength
    //   4192: if_icmpge +40 -> 4232
    //   4195: new 195	java/lang/StringBuilder
    //   4198: dup
    //   4199: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   4202: aload 4
    //   4204: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4207: aload 39
    //   4209: iload 40
    //   4211: aaload
    //   4212: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4215: ldc_w 761
    //   4218: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4221: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4224: astore 4
    //   4226: iinc 40 1
    //   4229: goto -42 -> 4187
    //   4232: new 195	java/lang/StringBuilder
    //   4235: dup
    //   4236: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   4239: aload 4
    //   4241: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4244: ldc_w 763
    //   4247: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4250: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4253: astore 4
    //   4255: aload 20
    //   4257: iconst_0
    //   4258: aaload
    //   4259: ldc_w 835
    //   4262: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   4265: ifeq +103 -> 4368
    //   4268: aload 20
    //   4270: iconst_0
    //   4271: aaload
    //   4272: ldc_w 759
    //   4275: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   4278: ifne +90 -> 4368
    //   4281: getstatic 142	com/belkin/wemo/cache/utils/MoreUtil:openWRTTransHeaterB	Z
    //   4284: ifeq +84 -> 4368
    //   4287: aload 19
    //   4289: ldc_w 743
    //   4292: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   4295: astore 37
    //   4297: iconst_4
    //   4298: istore 38
    //   4300: iload 38
    //   4302: aload 37
    //   4304: arraylength
    //   4305: if_icmpge +40 -> 4345
    //   4308: new 195	java/lang/StringBuilder
    //   4311: dup
    //   4312: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   4315: aload 4
    //   4317: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4320: aload 37
    //   4322: iload 38
    //   4324: aaload
    //   4325: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4328: ldc_w 761
    //   4331: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4334: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4337: astore 4
    //   4339: iinc 38 1
    //   4342: goto -42 -> 4300
    //   4345: new 195	java/lang/StringBuilder
    //   4348: dup
    //   4349: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   4352: aload 4
    //   4354: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4357: ldc_w 763
    //   4360: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4363: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4366: astore 4
    //   4368: aload 20
    //   4370: iconst_0
    //   4371: aaload
    //   4372: ldc_w 837
    //   4375: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   4378: ifeq +103 -> 4481
    //   4381: aload 20
    //   4383: iconst_0
    //   4384: aaload
    //   4385: ldc_w 759
    //   4388: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   4391: ifne +90 -> 4481
    //   4394: getstatic 144	com/belkin/wemo/cache/utils/MoreUtil:openWRTHeaterB	Z
    //   4397: ifeq +84 -> 4481
    //   4400: aload 19
    //   4402: ldc_w 743
    //   4405: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   4408: astore 35
    //   4410: iconst_4
    //   4411: istore 36
    //   4413: iload 36
    //   4415: aload 35
    //   4417: arraylength
    //   4418: if_icmpge +40 -> 4458
    //   4421: new 195	java/lang/StringBuilder
    //   4424: dup
    //   4425: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   4428: aload 4
    //   4430: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4433: aload 35
    //   4435: iload 36
    //   4437: aaload
    //   4438: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4441: ldc_w 761
    //   4444: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4447: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4450: astore 4
    //   4452: iinc 36 1
    //   4455: goto -42 -> 4413
    //   4458: new 195	java/lang/StringBuilder
    //   4461: dup
    //   4462: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   4465: aload 4
    //   4467: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4470: ldc_w 763
    //   4473: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4476: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4479: astore 4
    //   4481: aload 20
    //   4483: iconst_0
    //   4484: aaload
    //   4485: ldc_w 839
    //   4488: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   4491: ifeq +103 -> 4594
    //   4494: aload 20
    //   4496: iconst_0
    //   4497: aaload
    //   4498: ldc_w 759
    //   4501: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   4504: ifne +90 -> 4594
    //   4507: getstatic 150	com/belkin/wemo/cache/utils/MoreUtil:openWRTTransCoffeeMaker	Z
    //   4510: ifeq +84 -> 4594
    //   4513: aload 19
    //   4515: ldc_w 743
    //   4518: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   4521: astore 33
    //   4523: iconst_4
    //   4524: istore 34
    //   4526: iload 34
    //   4528: aload 33
    //   4530: arraylength
    //   4531: if_icmpge +40 -> 4571
    //   4534: new 195	java/lang/StringBuilder
    //   4537: dup
    //   4538: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   4541: aload 4
    //   4543: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4546: aload 33
    //   4548: iload 34
    //   4550: aaload
    //   4551: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4554: ldc_w 761
    //   4557: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4560: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4563: astore 4
    //   4565: iinc 34 1
    //   4568: goto -42 -> 4526
    //   4571: new 195	java/lang/StringBuilder
    //   4574: dup
    //   4575: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   4578: aload 4
    //   4580: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4583: ldc_w 763
    //   4586: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4589: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4592: astore 4
    //   4594: aload 20
    //   4596: iconst_0
    //   4597: aaload
    //   4598: ldc_w 841
    //   4601: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   4604: ifeq +103 -> 4707
    //   4607: aload 20
    //   4609: iconst_0
    //   4610: aaload
    //   4611: ldc_w 759
    //   4614: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   4617: ifne +90 -> 4707
    //   4620: getstatic 152	com/belkin/wemo/cache/utils/MoreUtil:openWRTCoffeeMaker	Z
    //   4623: ifeq +84 -> 4707
    //   4626: aload 19
    //   4628: ldc_w 743
    //   4631: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   4634: astore 31
    //   4636: iconst_4
    //   4637: istore 32
    //   4639: iload 32
    //   4641: aload 31
    //   4643: arraylength
    //   4644: if_icmpge +40 -> 4684
    //   4647: new 195	java/lang/StringBuilder
    //   4650: dup
    //   4651: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   4654: aload 4
    //   4656: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4659: aload 31
    //   4661: iload 32
    //   4663: aaload
    //   4664: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4667: ldc_w 761
    //   4670: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4673: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4676: astore 4
    //   4678: iinc 32 1
    //   4681: goto -42 -> 4639
    //   4684: new 195	java/lang/StringBuilder
    //   4687: dup
    //   4688: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   4691: aload 4
    //   4693: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4696: ldc_w 763
    //   4699: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4702: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4705: astore 4
    //   4707: aload 20
    //   4709: iconst_0
    //   4710: aaload
    //   4711: ldc_w 843
    //   4714: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   4717: ifeq +103 -> 4820
    //   4720: aload 20
    //   4722: iconst_0
    //   4723: aaload
    //   4724: ldc_w 759
    //   4727: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   4730: ifne +90 -> 4820
    //   4733: getstatic 146	com/belkin/wemo/cache/utils/MoreUtil:openWRTTransAirPurifier	Z
    //   4736: ifeq +84 -> 4820
    //   4739: aload 19
    //   4741: ldc_w 743
    //   4744: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   4747: astore 29
    //   4749: iconst_4
    //   4750: istore 30
    //   4752: iload 30
    //   4754: aload 29
    //   4756: arraylength
    //   4757: if_icmpge +40 -> 4797
    //   4760: new 195	java/lang/StringBuilder
    //   4763: dup
    //   4764: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   4767: aload 4
    //   4769: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4772: aload 29
    //   4774: iload 30
    //   4776: aaload
    //   4777: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4780: ldc_w 761
    //   4783: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4786: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4789: astore 4
    //   4791: iinc 30 1
    //   4794: goto -42 -> 4752
    //   4797: new 195	java/lang/StringBuilder
    //   4800: dup
    //   4801: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   4804: aload 4
    //   4806: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4809: ldc_w 763
    //   4812: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4815: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4818: astore 4
    //   4820: aload 20
    //   4822: iconst_0
    //   4823: aaload
    //   4824: ldc_w 845
    //   4827: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   4830: ifeq +103 -> 4933
    //   4833: aload 20
    //   4835: iconst_0
    //   4836: aaload
    //   4837: ldc_w 759
    //   4840: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   4843: ifne +90 -> 4933
    //   4846: getstatic 148	com/belkin/wemo/cache/utils/MoreUtil:openWRTAirPurifier	Z
    //   4849: ifeq +84 -> 4933
    //   4852: aload 19
    //   4854: ldc_w 743
    //   4857: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   4860: astore 27
    //   4862: iconst_4
    //   4863: istore 28
    //   4865: iload 28
    //   4867: aload 27
    //   4869: arraylength
    //   4870: if_icmpge +40 -> 4910
    //   4873: new 195	java/lang/StringBuilder
    //   4876: dup
    //   4877: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   4880: aload 4
    //   4882: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4885: aload 27
    //   4887: iload 28
    //   4889: aaload
    //   4890: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4893: ldc_w 761
    //   4896: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4899: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4902: astore 4
    //   4904: iinc 28 1
    //   4907: goto -42 -> 4865
    //   4910: new 195	java/lang/StringBuilder
    //   4913: dup
    //   4914: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   4917: aload 4
    //   4919: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4922: ldc_w 763
    //   4925: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4928: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4931: astore 4
    //   4933: aload 20
    //   4935: iconst_0
    //   4936: aaload
    //   4937: ldc_w 847
    //   4940: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   4943: ifeq +103 -> 5046
    //   4946: aload 20
    //   4948: iconst_0
    //   4949: aaload
    //   4950: ldc_w 759
    //   4953: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   4956: ifne +90 -> 5046
    //   4959: getstatic 166	com/belkin/wemo/cache/utils/MoreUtil:GardenspotRGBFlag	Z
    //   4962: ifeq +84 -> 5046
    //   4965: aload 19
    //   4967: ldc_w 743
    //   4970: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   4973: astore 25
    //   4975: iconst_4
    //   4976: istore 26
    //   4978: iload 26
    //   4980: aload 25
    //   4982: arraylength
    //   4983: if_icmpge +40 -> 5023
    //   4986: new 195	java/lang/StringBuilder
    //   4989: dup
    //   4990: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   4993: aload 4
    //   4995: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4998: aload 25
    //   5000: iload 26
    //   5002: aaload
    //   5003: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5006: ldc_w 761
    //   5009: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5012: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5015: astore 4
    //   5017: iinc 26 1
    //   5020: goto -42 -> 4978
    //   5023: new 195	java/lang/StringBuilder
    //   5026: dup
    //   5027: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   5030: aload 4
    //   5032: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5035: ldc_w 763
    //   5038: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5041: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5044: astore 4
    //   5046: aload 20
    //   5048: iconst_0
    //   5049: aaload
    //   5050: ldc_w 849
    //   5053: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   5056: ifeq +103 -> 5159
    //   5059: aload 20
    //   5061: iconst_0
    //   5062: aaload
    //   5063: ldc_w 759
    //   5066: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   5069: ifne +90 -> 5159
    //   5072: getstatic 168	com/belkin/wemo/cache/utils/MoreUtil:ClassicA60TWFlag	Z
    //   5075: ifeq +84 -> 5159
    //   5078: aload 19
    //   5080: ldc_w 743
    //   5083: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   5086: astore 23
    //   5088: iconst_4
    //   5089: istore 24
    //   5091: iload 24
    //   5093: aload 23
    //   5095: arraylength
    //   5096: if_icmpge +40 -> 5136
    //   5099: new 195	java/lang/StringBuilder
    //   5102: dup
    //   5103: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   5106: aload 4
    //   5108: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5111: aload 23
    //   5113: iload 24
    //   5115: aaload
    //   5116: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5119: ldc_w 761
    //   5122: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5125: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5128: astore 4
    //   5130: iinc 24 1
    //   5133: goto -42 -> 5091
    //   5136: new 195	java/lang/StringBuilder
    //   5139: dup
    //   5140: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   5143: aload 4
    //   5145: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5148: ldc_w 763
    //   5151: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5154: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5157: astore 4
    //   5159: aload 20
    //   5161: iconst_0
    //   5162: aaload
    //   5163: ldc_w 851
    //   5166: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   5169: ifeq +387 -> 5556
    //   5172: aload 20
    //   5174: iconst_0
    //   5175: aaload
    //   5176: ldc_w 759
    //   5179: invokevirtual 334	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   5182: ifne +374 -> 5556
    //   5185: getstatic 170	com/belkin/wemo/cache/utils/MoreUtil:FlexRGBWFlag	Z
    //   5188: ifeq +368 -> 5556
    //   5191: aload 19
    //   5193: ldc_w 743
    //   5196: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   5199: astore 21
    //   5201: iconst_4
    //   5202: istore 22
    //   5204: iload 22
    //   5206: aload 21
    //   5208: arraylength
    //   5209: if_icmpge +40 -> 5249
    //   5212: new 195	java/lang/StringBuilder
    //   5215: dup
    //   5216: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   5219: aload 4
    //   5221: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5224: aload 21
    //   5226: iload 22
    //   5228: aaload
    //   5229: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5232: ldc_w 761
    //   5235: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5238: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5241: astore 4
    //   5243: iinc 22 1
    //   5246: goto -42 -> 5204
    //   5249: new 195	java/lang/StringBuilder
    //   5252: dup
    //   5253: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   5256: aload 4
    //   5258: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5261: ldc_w 763
    //   5264: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5267: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5270: astore 4
    //   5272: goto +284 -> 5556
    //   5275: getstatic 747	java/lang/System:out	Ljava/io/PrintStream;
    //   5278: new 195	java/lang/StringBuilder
    //   5281: dup
    //   5282: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   5285: ldc_w 749
    //   5288: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5291: aload 4
    //   5293: invokevirtual 750	java/lang/String:toString	()Ljava/lang/String;
    //   5296: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5299: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5302: invokevirtual 755	java/io/PrintStream:println	(Ljava/lang/String;)V
    //   5305: iconst_0
    //   5306: putstatic 78	com/belkin/wemo/cache/utils/MoreUtil:usFlag	Z
    //   5309: iconst_0
    //   5310: putstatic 80	com/belkin/wemo/cache/utils/MoreUtil:euFlag	Z
    //   5313: iconst_0
    //   5314: putstatic 82	com/belkin/wemo/cache/utils/MoreUtil:lightFlag	Z
    //   5317: iconst_0
    //   5318: putstatic 88	com/belkin/wemo/cache/utils/MoreUtil:insightFlag	Z
    //   5321: iconst_0
    //   5322: putstatic 76	com/belkin/wemo/cache/utils/MoreUtil:bridgewwFlag	Z
    //   5325: iconst_0
    //   5326: putstatic 90	com/belkin/wemo/cache/utils/MoreUtil:signedInsightFlag	Z
    //   5329: iconst_0
    //   5330: putstatic 92	com/belkin/wemo/cache/utils/MoreUtil:signedusFlag	Z
    //   5333: iconst_0
    //   5334: putstatic 94	com/belkin/wemo/cache/utils/MoreUtil:signedeuFlag	Z
    //   5337: iconst_0
    //   5338: putstatic 96	com/belkin/wemo/cache/utils/MoreUtil:signedLightFlag	Z
    //   5341: iconst_0
    //   5342: putstatic 98	com/belkin/wemo/cache/utils/MoreUtil:slowcookerUSFlag	Z
    //   5345: iconst_0
    //   5346: putstatic 102	com/belkin/wemo/cache/utils/MoreUtil:wemoSmartFlag	Z
    //   5349: iconst_0
    //   5350: putstatic 104	com/belkin/wemo/cache/utils/MoreUtil:makerFlag	Z
    //   5353: iconst_0
    //   5354: putstatic 126	com/belkin/wemo/cache/utils/MoreUtil:bulbWWflag	Z
    //   5357: iconst_0
    //   5358: putstatic 106	com/belkin/wemo/cache/utils/MoreUtil:openWRTinsight	Z
    //   5361: iconst_0
    //   5362: putstatic 84	com/belkin/wemo/cache/utils/MoreUtil:openWRTlight	Z
    //   5365: iconst_0
    //   5366: putstatic 110	com/belkin/wemo/cache/utils/MoreUtil:openWRTSNS	Z
    //   5369: iconst_0
    //   5370: putstatic 86	com/belkin/wemo/cache/utils/MoreUtil:openWRTTranslight	Z
    //   5373: iconst_0
    //   5374: putstatic 108	com/belkin/wemo/cache/utils/MoreUtil:openWRTTransinsight	Z
    //   5377: iconst_0
    //   5378: putstatic 112	com/belkin/wemo/cache/utils/MoreUtil:openWRTTransSNS	Z
    //   5381: iconst_0
    //   5382: putstatic 128	com/belkin/wemo/cache/utils/MoreUtil:openWRTInsightV2	Z
    //   5385: iconst_0
    //   5386: putstatic 114	com/belkin/wemo/cache/utils/MoreUtil:openWRTSlowCooker	Z
    //   5389: iconst_0
    //   5390: putstatic 116	com/belkin/wemo/cache/utils/MoreUtil:openWRTTransSlowCooker	Z
    //   5393: iconst_0
    //   5394: putstatic 122	com/belkin/wemo/cache/utils/MoreUtil:openWRTMaker	Z
    //   5397: iconst_0
    //   5398: putstatic 124	com/belkin/wemo/cache/utils/MoreUtil:openWRTTransMaker	Z
    //   5401: iconst_0
    //   5402: putstatic 130	com/belkin/wemo/cache/utils/MoreUtil:openWRTTransHumidifier	Z
    //   5405: iconst_0
    //   5406: putstatic 134	com/belkin/wemo/cache/utils/MoreUtil:openWRTTransHumidifierB	Z
    //   5409: iconst_0
    //   5410: putstatic 132	com/belkin/wemo/cache/utils/MoreUtil:openWRTHumidifier	Z
    //   5413: iconst_0
    //   5414: putstatic 136	com/belkin/wemo/cache/utils/MoreUtil:openWRTHumidifierB	Z
    //   5417: iconst_0
    //   5418: putstatic 138	com/belkin/wemo/cache/utils/MoreUtil:openWRTTransHeaterA	Z
    //   5421: iconst_0
    //   5422: putstatic 140	com/belkin/wemo/cache/utils/MoreUtil:openWRTHeaterA	Z
    //   5425: iconst_0
    //   5426: putstatic 142	com/belkin/wemo/cache/utils/MoreUtil:openWRTTransHeaterB	Z
    //   5429: iconst_0
    //   5430: putstatic 144	com/belkin/wemo/cache/utils/MoreUtil:openWRTHeaterB	Z
    //   5433: iconst_0
    //   5434: putstatic 146	com/belkin/wemo/cache/utils/MoreUtil:openWRTTransAirPurifier	Z
    //   5437: iconst_0
    //   5438: putstatic 148	com/belkin/wemo/cache/utils/MoreUtil:openWRTAirPurifier	Z
    //   5441: iconst_0
    //   5442: putstatic 150	com/belkin/wemo/cache/utils/MoreUtil:openWRTTransCoffeeMaker	Z
    //   5445: iconst_0
    //   5446: putstatic 152	com/belkin/wemo/cache/utils/MoreUtil:openWRTCoffeeMaker	Z
    //   5449: iconst_0
    //   5450: putstatic 160	com/belkin/wemo/cache/utils/MoreUtil:HumidifierFlag	Z
    //   5453: iconst_0
    //   5454: putstatic 162	com/belkin/wemo/cache/utils/MoreUtil:HumidifierBFlag	Z
    //   5457: iconst_0
    //   5458: putstatic 158	com/belkin/wemo/cache/utils/MoreUtil:CoffeeMakerFlag	Z
    //   5461: iconst_0
    //   5462: putstatic 154	com/belkin/wemo/cache/utils/MoreUtil:HeaterAFlag	Z
    //   5465: iconst_0
    //   5466: putstatic 156	com/belkin/wemo/cache/utils/MoreUtil:HeaterBFlag	Z
    //   5469: iconst_0
    //   5470: putstatic 164	com/belkin/wemo/cache/utils/MoreUtil:AirPurifierFlag	Z
    //   5473: iconst_0
    //   5474: putstatic 166	com/belkin/wemo/cache/utils/MoreUtil:GardenspotRGBFlag	Z
    //   5477: iconst_0
    //   5478: putstatic 168	com/belkin/wemo/cache/utils/MoreUtil:ClassicA60TWFlag	Z
    //   5481: iconst_0
    //   5482: putstatic 170	com/belkin/wemo/cache/utils/MoreUtil:FlexRGBWFlag	Z
    //   5485: aload 12
    //   5487: ifnull +8 -> 5495
    //   5490: aload 12
    //   5492: invokevirtual 734	java/io/BufferedReader:close	()V
    //   5495: aload 4
    //   5497: areturn
    //   5498: astore 109
    //   5500: aload 109
    //   5502: invokevirtual 852	java/io/IOException:printStackTrace	()V
    //   5505: goto -10 -> 5495
    //   5508: astore 11
    //   5510: aload 11
    //   5512: invokevirtual 852	java/io/IOException:printStackTrace	()V
    //   5515: goto -5347 -> 168
    //   5518: astore 9
    //   5520: aload_3
    //   5521: ifnull +7 -> 5528
    //   5524: aload_3
    //   5525: invokevirtual 734	java/io/BufferedReader:close	()V
    //   5528: aload 9
    //   5530: athrow
    //   5531: astore 10
    //   5533: aload 10
    //   5535: invokevirtual 852	java/io/IOException:printStackTrace	()V
    //   5538: goto -10 -> 5528
    //   5541: astore 9
    //   5543: aload 12
    //   5545: astore_3
    //   5546: goto -26 -> 5520
    //   5549: astore 8
    //   5551: aconst_null
    //   5552: astore_3
    //   5553: goto -5398 -> 155
    //   5556: iinc 18 1
    //   5559: goto -5357 -> 202
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	5562	0	this	MoreUtil
    //   0	5562	1	paramString	String
    //   10	30	2	str1	String
    //   12	5541	3	localObject1	Object
    //   15	5481	4	str2	String
    //   24	37	5	localDefaultHttpClient	org.apache.http.impl.client.DefaultHttpClient
    //   33	30	6	localHttpGet	org.apache.http.client.methods.HttpGet
    //   43	5	7	localURI	java.net.URI
    //   150	6	8	localException1	Exception
    //   5549	1	8	localException2	Exception
    //   5518	11	9	localObject2	Object
    //   5541	1	9	localObject3	Object
    //   5531	3	10	localIOException1	java.io.IOException
    //   5508	3	11	localIOException2	java.io.IOException
    //   85	5459	12	localBufferedReader	java.io.BufferedReader
    //   96	81	13	localStringBuffer	StringBuffer
    //   103	27	14	str3	String
    //   187	23	16	arrayOfString1	String[]
    //   197	10	17	i	int
    //   200	5357	18	j	int
    //   214	4978	19	str4	String
    //   224	4949	20	arrayOfString2	String[]
    //   5199	26	21	arrayOfString3	String[]
    //   5202	42	22	k	int
    //   5086	26	23	arrayOfString4	String[]
    //   5089	42	24	m	int
    //   4973	26	25	arrayOfString5	String[]
    //   4976	42	26	n	int
    //   4860	26	27	arrayOfString6	String[]
    //   4863	42	28	i1	int
    //   4747	26	29	arrayOfString7	String[]
    //   4750	42	30	i2	int
    //   4634	26	31	arrayOfString8	String[]
    //   4637	42	32	i3	int
    //   4521	26	33	arrayOfString9	String[]
    //   4524	42	34	i4	int
    //   4408	26	35	arrayOfString10	String[]
    //   4411	42	36	i5	int
    //   4295	26	37	arrayOfString11	String[]
    //   4298	42	38	i6	int
    //   4182	26	39	arrayOfString12	String[]
    //   4185	42	40	i7	int
    //   4069	26	41	arrayOfString13	String[]
    //   4072	42	42	i8	int
    //   3956	26	43	arrayOfString14	String[]
    //   3959	42	44	i9	int
    //   3843	26	45	arrayOfString15	String[]
    //   3846	42	46	i10	int
    //   3730	26	47	arrayOfString16	String[]
    //   3733	42	48	i11	int
    //   3617	26	49	arrayOfString17	String[]
    //   3620	42	50	i12	int
    //   3504	26	51	arrayOfString18	String[]
    //   3507	42	52	i13	int
    //   3391	26	53	arrayOfString19	String[]
    //   3394	42	54	i14	int
    //   3278	26	55	arrayOfString20	String[]
    //   3281	42	56	i15	int
    //   3165	26	57	arrayOfString21	String[]
    //   3168	42	58	i16	int
    //   3052	26	59	arrayOfString22	String[]
    //   3055	42	60	i17	int
    //   2939	26	61	arrayOfString23	String[]
    //   2942	42	62	i18	int
    //   2826	26	63	arrayOfString24	String[]
    //   2829	42	64	i19	int
    //   2713	26	65	arrayOfString25	String[]
    //   2716	42	66	i20	int
    //   2600	26	67	arrayOfString26	String[]
    //   2603	42	68	i21	int
    //   2487	26	69	arrayOfString27	String[]
    //   2490	42	70	i22	int
    //   2374	26	71	arrayOfString28	String[]
    //   2377	42	72	i23	int
    //   2261	26	73	arrayOfString29	String[]
    //   2264	42	74	i24	int
    //   2148	26	75	arrayOfString30	String[]
    //   2151	42	76	i25	int
    //   2029	32	77	arrayOfString31	String[]
    //   2038	42	78	i26	int
    //   1916	26	79	arrayOfString32	String[]
    //   1919	42	80	i27	int
    //   1803	26	81	arrayOfString33	String[]
    //   1806	42	82	i28	int
    //   1684	32	83	arrayOfString34	String[]
    //   1693	42	84	i29	int
    //   1571	26	85	arrayOfString35	String[]
    //   1574	42	86	i30	int
    //   1458	26	87	arrayOfString36	String[]
    //   1461	42	88	i31	int
    //   1339	32	89	arrayOfString37	String[]
    //   1348	42	90	i32	int
    //   1226	26	91	arrayOfString38	String[]
    //   1229	42	92	i33	int
    //   1107	32	93	arrayOfString39	String[]
    //   1116	42	94	i34	int
    //   994	26	95	arrayOfString40	String[]
    //   997	42	96	i35	int
    //   881	26	97	arrayOfString41	String[]
    //   884	42	98	i36	int
    //   762	32	99	arrayOfString42	String[]
    //   771	42	100	i37	int
    //   643	32	101	arrayOfString43	String[]
    //   652	42	102	i38	int
    //   530	26	103	arrayOfString44	String[]
    //   533	42	104	i39	int
    //   417	26	105	arrayOfString45	String[]
    //   420	42	106	i40	int
    //   298	32	107	arrayOfString46	String[]
    //   307	42	108	i41	int
    //   5498	3	109	localIOException3	java.io.IOException
    // Exception table:
    //   from	to	target	type
    //   87	98	150	java/lang/Exception
    //   98	105	150	java/lang/Exception
    //   110	147	150	java/lang/Exception
    //   171	189	150	java/lang/Exception
    //   194	199	150	java/lang/Exception
    //   209	306	150	java/lang/Exception
    //   309	348	150	java/lang/Exception
    //   354	377	150	java/lang/Exception
    //   377	419	150	java/lang/Exception
    //   422	461	150	java/lang/Exception
    //   467	490	150	java/lang/Exception
    //   490	532	150	java/lang/Exception
    //   535	574	150	java/lang/Exception
    //   580	603	150	java/lang/Exception
    //   603	651	150	java/lang/Exception
    //   654	693	150	java/lang/Exception
    //   699	722	150	java/lang/Exception
    //   722	770	150	java/lang/Exception
    //   773	812	150	java/lang/Exception
    //   818	841	150	java/lang/Exception
    //   841	883	150	java/lang/Exception
    //   886	925	150	java/lang/Exception
    //   931	954	150	java/lang/Exception
    //   954	996	150	java/lang/Exception
    //   999	1038	150	java/lang/Exception
    //   1044	1067	150	java/lang/Exception
    //   1067	1115	150	java/lang/Exception
    //   1118	1157	150	java/lang/Exception
    //   1163	1186	150	java/lang/Exception
    //   1186	1228	150	java/lang/Exception
    //   1231	1270	150	java/lang/Exception
    //   1276	1299	150	java/lang/Exception
    //   1299	1347	150	java/lang/Exception
    //   1350	1389	150	java/lang/Exception
    //   1395	1418	150	java/lang/Exception
    //   1418	1460	150	java/lang/Exception
    //   1463	1502	150	java/lang/Exception
    //   1508	1531	150	java/lang/Exception
    //   1531	1573	150	java/lang/Exception
    //   1576	1615	150	java/lang/Exception
    //   1621	1644	150	java/lang/Exception
    //   1644	1692	150	java/lang/Exception
    //   1695	1734	150	java/lang/Exception
    //   1740	1763	150	java/lang/Exception
    //   1763	1805	150	java/lang/Exception
    //   1808	1847	150	java/lang/Exception
    //   1853	1876	150	java/lang/Exception
    //   1876	1918	150	java/lang/Exception
    //   1921	1960	150	java/lang/Exception
    //   1966	1989	150	java/lang/Exception
    //   1989	2037	150	java/lang/Exception
    //   2040	2079	150	java/lang/Exception
    //   2085	2108	150	java/lang/Exception
    //   2108	2150	150	java/lang/Exception
    //   2153	2192	150	java/lang/Exception
    //   2198	2221	150	java/lang/Exception
    //   2221	2263	150	java/lang/Exception
    //   2266	2305	150	java/lang/Exception
    //   2311	2334	150	java/lang/Exception
    //   2334	2376	150	java/lang/Exception
    //   2379	2418	150	java/lang/Exception
    //   2424	2447	150	java/lang/Exception
    //   2447	2489	150	java/lang/Exception
    //   2492	2531	150	java/lang/Exception
    //   2537	2560	150	java/lang/Exception
    //   2560	2602	150	java/lang/Exception
    //   2605	2644	150	java/lang/Exception
    //   2650	2673	150	java/lang/Exception
    //   2673	2715	150	java/lang/Exception
    //   2718	2757	150	java/lang/Exception
    //   2763	2786	150	java/lang/Exception
    //   2786	2828	150	java/lang/Exception
    //   2831	2870	150	java/lang/Exception
    //   2876	2899	150	java/lang/Exception
    //   2899	2941	150	java/lang/Exception
    //   2944	2983	150	java/lang/Exception
    //   2989	3012	150	java/lang/Exception
    //   3012	3054	150	java/lang/Exception
    //   3057	3096	150	java/lang/Exception
    //   3102	3125	150	java/lang/Exception
    //   3125	3167	150	java/lang/Exception
    //   3170	3209	150	java/lang/Exception
    //   3215	3238	150	java/lang/Exception
    //   3238	3280	150	java/lang/Exception
    //   3283	3322	150	java/lang/Exception
    //   3328	3351	150	java/lang/Exception
    //   3351	3393	150	java/lang/Exception
    //   3396	3435	150	java/lang/Exception
    //   3441	3464	150	java/lang/Exception
    //   3464	3506	150	java/lang/Exception
    //   3509	3548	150	java/lang/Exception
    //   3554	3577	150	java/lang/Exception
    //   3577	3619	150	java/lang/Exception
    //   3622	3661	150	java/lang/Exception
    //   3667	3690	150	java/lang/Exception
    //   3690	3732	150	java/lang/Exception
    //   3735	3774	150	java/lang/Exception
    //   3780	3803	150	java/lang/Exception
    //   3803	3845	150	java/lang/Exception
    //   3848	3887	150	java/lang/Exception
    //   3893	3916	150	java/lang/Exception
    //   3916	3958	150	java/lang/Exception
    //   3961	4000	150	java/lang/Exception
    //   4006	4029	150	java/lang/Exception
    //   4029	4071	150	java/lang/Exception
    //   4074	4113	150	java/lang/Exception
    //   4119	4142	150	java/lang/Exception
    //   4142	4184	150	java/lang/Exception
    //   4187	4226	150	java/lang/Exception
    //   4232	4255	150	java/lang/Exception
    //   4255	4297	150	java/lang/Exception
    //   4300	4339	150	java/lang/Exception
    //   4345	4368	150	java/lang/Exception
    //   4368	4410	150	java/lang/Exception
    //   4413	4452	150	java/lang/Exception
    //   4458	4481	150	java/lang/Exception
    //   4481	4523	150	java/lang/Exception
    //   4526	4565	150	java/lang/Exception
    //   4571	4594	150	java/lang/Exception
    //   4594	4636	150	java/lang/Exception
    //   4639	4678	150	java/lang/Exception
    //   4684	4707	150	java/lang/Exception
    //   4707	4749	150	java/lang/Exception
    //   4752	4791	150	java/lang/Exception
    //   4797	4820	150	java/lang/Exception
    //   4820	4862	150	java/lang/Exception
    //   4865	4904	150	java/lang/Exception
    //   4910	4933	150	java/lang/Exception
    //   4933	4975	150	java/lang/Exception
    //   4978	5017	150	java/lang/Exception
    //   5023	5046	150	java/lang/Exception
    //   5046	5088	150	java/lang/Exception
    //   5091	5130	150	java/lang/Exception
    //   5136	5159	150	java/lang/Exception
    //   5159	5201	150	java/lang/Exception
    //   5204	5243	150	java/lang/Exception
    //   5249	5272	150	java/lang/Exception
    //   5275	5485	150	java/lang/Exception
    //   5490	5495	5498	java/io/IOException
    //   164	168	5508	java/io/IOException
    //   17	87	5518	finally
    //   155	160	5518	finally
    //   5524	5528	5531	java/io/IOException
    //   87	98	5541	finally
    //   98	105	5541	finally
    //   110	147	5541	finally
    //   171	189	5541	finally
    //   194	199	5541	finally
    //   209	306	5541	finally
    //   309	348	5541	finally
    //   354	377	5541	finally
    //   377	419	5541	finally
    //   422	461	5541	finally
    //   467	490	5541	finally
    //   490	532	5541	finally
    //   535	574	5541	finally
    //   580	603	5541	finally
    //   603	651	5541	finally
    //   654	693	5541	finally
    //   699	722	5541	finally
    //   722	770	5541	finally
    //   773	812	5541	finally
    //   818	841	5541	finally
    //   841	883	5541	finally
    //   886	925	5541	finally
    //   931	954	5541	finally
    //   954	996	5541	finally
    //   999	1038	5541	finally
    //   1044	1067	5541	finally
    //   1067	1115	5541	finally
    //   1118	1157	5541	finally
    //   1163	1186	5541	finally
    //   1186	1228	5541	finally
    //   1231	1270	5541	finally
    //   1276	1299	5541	finally
    //   1299	1347	5541	finally
    //   1350	1389	5541	finally
    //   1395	1418	5541	finally
    //   1418	1460	5541	finally
    //   1463	1502	5541	finally
    //   1508	1531	5541	finally
    //   1531	1573	5541	finally
    //   1576	1615	5541	finally
    //   1621	1644	5541	finally
    //   1644	1692	5541	finally
    //   1695	1734	5541	finally
    //   1740	1763	5541	finally
    //   1763	1805	5541	finally
    //   1808	1847	5541	finally
    //   1853	1876	5541	finally
    //   1876	1918	5541	finally
    //   1921	1960	5541	finally
    //   1966	1989	5541	finally
    //   1989	2037	5541	finally
    //   2040	2079	5541	finally
    //   2085	2108	5541	finally
    //   2108	2150	5541	finally
    //   2153	2192	5541	finally
    //   2198	2221	5541	finally
    //   2221	2263	5541	finally
    //   2266	2305	5541	finally
    //   2311	2334	5541	finally
    //   2334	2376	5541	finally
    //   2379	2418	5541	finally
    //   2424	2447	5541	finally
    //   2447	2489	5541	finally
    //   2492	2531	5541	finally
    //   2537	2560	5541	finally
    //   2560	2602	5541	finally
    //   2605	2644	5541	finally
    //   2650	2673	5541	finally
    //   2673	2715	5541	finally
    //   2718	2757	5541	finally
    //   2763	2786	5541	finally
    //   2786	2828	5541	finally
    //   2831	2870	5541	finally
    //   2876	2899	5541	finally
    //   2899	2941	5541	finally
    //   2944	2983	5541	finally
    //   2989	3012	5541	finally
    //   3012	3054	5541	finally
    //   3057	3096	5541	finally
    //   3102	3125	5541	finally
    //   3125	3167	5541	finally
    //   3170	3209	5541	finally
    //   3215	3238	5541	finally
    //   3238	3280	5541	finally
    //   3283	3322	5541	finally
    //   3328	3351	5541	finally
    //   3351	3393	5541	finally
    //   3396	3435	5541	finally
    //   3441	3464	5541	finally
    //   3464	3506	5541	finally
    //   3509	3548	5541	finally
    //   3554	3577	5541	finally
    //   3577	3619	5541	finally
    //   3622	3661	5541	finally
    //   3667	3690	5541	finally
    //   3690	3732	5541	finally
    //   3735	3774	5541	finally
    //   3780	3803	5541	finally
    //   3803	3845	5541	finally
    //   3848	3887	5541	finally
    //   3893	3916	5541	finally
    //   3916	3958	5541	finally
    //   3961	4000	5541	finally
    //   4006	4029	5541	finally
    //   4029	4071	5541	finally
    //   4074	4113	5541	finally
    //   4119	4142	5541	finally
    //   4142	4184	5541	finally
    //   4187	4226	5541	finally
    //   4232	4255	5541	finally
    //   4255	4297	5541	finally
    //   4300	4339	5541	finally
    //   4345	4368	5541	finally
    //   4368	4410	5541	finally
    //   4413	4452	5541	finally
    //   4458	4481	5541	finally
    //   4481	4523	5541	finally
    //   4526	4565	5541	finally
    //   4571	4594	5541	finally
    //   4594	4636	5541	finally
    //   4639	4678	5541	finally
    //   4684	4707	5541	finally
    //   4707	4749	5541	finally
    //   4752	4791	5541	finally
    //   4797	4820	5541	finally
    //   4820	4862	5541	finally
    //   4865	4904	5541	finally
    //   4910	4933	5541	finally
    //   4933	4975	5541	finally
    //   4978	5017	5541	finally
    //   5023	5046	5541	finally
    //   5046	5088	5541	finally
    //   5091	5130	5541	finally
    //   5136	5159	5541	finally
    //   5159	5201	5541	finally
    //   5204	5243	5541	finally
    //   5249	5272	5541	finally
    //   5275	5485	5541	finally
    //   17	87	5549	java/lang/Exception
  }
  
  /* Error */
  public ArrayList<String> getFirmwareDetailsUSWW(String paramString)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: new 856	java/util/ArrayList
    //   5: dup
    //   6: invokespecial 857	java/util/ArrayList:<init>	()V
    //   9: astore_3
    //   10: new 683	org/apache/http/impl/client/DefaultHttpClient
    //   13: dup
    //   14: invokespecial 684	org/apache/http/impl/client/DefaultHttpClient:<init>	()V
    //   17: astore 4
    //   19: new 686	org/apache/http/client/methods/HttpGet
    //   22: dup
    //   23: invokespecial 687	org/apache/http/client/methods/HttpGet:<init>	()V
    //   26: astore 5
    //   28: new 689	java/net/URI
    //   31: dup
    //   32: aload_1
    //   33: invokespecial 690	java/net/URI:<init>	(Ljava/lang/String;)V
    //   36: astore 6
    //   38: aload 5
    //   40: aload 6
    //   42: invokevirtual 694	org/apache/http/client/methods/HttpGet:setURI	(Ljava/net/URI;)V
    //   45: new 696	java/io/BufferedReader
    //   48: dup
    //   49: new 698	java/io/InputStreamReader
    //   52: dup
    //   53: aload 4
    //   55: aload 5
    //   57: invokeinterface 704 2 0
    //   62: invokeinterface 710 1 0
    //   67: invokeinterface 716 1 0
    //   72: invokespecial 719	java/io/InputStreamReader:<init>	(Ljava/io/InputStream;)V
    //   75: invokespecial 722	java/io/BufferedReader:<init>	(Ljava/io/Reader;)V
    //   78: astore 13
    //   80: new 724	java/lang/StringBuffer
    //   83: dup
    //   84: ldc -73
    //   86: invokespecial 725	java/lang/StringBuffer:<init>	(Ljava/lang/String;)V
    //   89: astore 14
    //   91: aload 13
    //   93: invokevirtual 728	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   96: astore 15
    //   98: aload 15
    //   100: ifnull +76 -> 176
    //   103: aload 15
    //   105: ldc -73
    //   107: invokevirtual 222	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   110: ifne -19 -> 91
    //   113: aload 14
    //   115: new 195	java/lang/StringBuilder
    //   118: dup
    //   119: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   122: aload 15
    //   124: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   127: ldc_w 730
    //   130: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   133: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   136: invokevirtual 733	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   139: pop
    //   140: goto -49 -> 91
    //   143: astore 7
    //   145: aload 13
    //   147: astore_2
    //   148: aload 7
    //   150: invokevirtual 510	java/lang/Exception:printStackTrace	()V
    //   153: aload_2
    //   154: ifnull +636 -> 790
    //   157: aload_2
    //   158: invokevirtual 734	java/io/BufferedReader:close	()V
    //   161: aload_3
    //   162: invokevirtual 859	java/util/ArrayList:size	()I
    //   165: istore 12
    //   167: iload 12
    //   169: ifgt +5 -> 174
    //   172: aconst_null
    //   173: astore_3
    //   174: aload_3
    //   175: areturn
    //   176: aload 13
    //   178: invokevirtual 734	java/io/BufferedReader:close	()V
    //   181: aload 14
    //   183: invokevirtual 735	java/lang/StringBuffer:toString	()Ljava/lang/String;
    //   186: ldc_w 737
    //   189: invokevirtual 741	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   192: astore 17
    //   194: aload 17
    //   196: ifnull +559 -> 755
    //   199: aload 17
    //   201: arraylength
    //   202: istore 18
    //   204: iconst_0
    //   205: istore 19
    //   207: iload 19
    //   209: iload 18
    //   211: if_icmpge +544 -> 755
    //   214: aload 17
    //   216: iload 19
    //   218: aaload
    //   219: astore 20
    //   221: aload 20
    //   223: ldc_w 757
    //   226: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   229: ifne +476 -> 705
    //   232: aload 20
    //   234: ldc_w 771
    //   237: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   240: ifne +465 -> 705
    //   243: aload 20
    //   245: ldc_w 777
    //   248: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   251: ifne +454 -> 705
    //   254: aload 20
    //   256: ldc_w 787
    //   259: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   262: ifne +443 -> 705
    //   265: aload 20
    //   267: ldc_w 789
    //   270: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   273: ifne +432 -> 705
    //   276: aload 20
    //   278: ldc_w 785
    //   281: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   284: ifne +421 -> 705
    //   287: aload 20
    //   289: ldc_w 765
    //   292: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   295: ifne +410 -> 705
    //   298: aload 20
    //   300: ldc_w 773
    //   303: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   306: ifne +399 -> 705
    //   309: aload 20
    //   311: ldc_w 795
    //   314: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   317: ifne +388 -> 705
    //   320: aload 20
    //   322: ldc_w 783
    //   325: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   328: ifne +377 -> 705
    //   331: aload 20
    //   333: ldc_w 775
    //   336: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   339: ifne +366 -> 705
    //   342: aload 20
    //   344: ldc_w 809
    //   347: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   350: ifne +355 -> 705
    //   353: aload 20
    //   355: ldc_w 847
    //   358: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   361: ifne +344 -> 705
    //   364: aload 20
    //   366: ldc_w 849
    //   369: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   372: ifne +333 -> 705
    //   375: aload 20
    //   377: ldc_w 851
    //   380: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   383: ifne +322 -> 705
    //   386: aload 20
    //   388: ldc_w 861
    //   391: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   394: ifne +311 -> 705
    //   397: aload 20
    //   399: ldc_w 799
    //   402: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   405: ifne +300 -> 705
    //   408: aload 20
    //   410: ldc_w 801
    //   413: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   416: ifne +289 -> 705
    //   419: aload 20
    //   421: ldc_w 803
    //   424: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   427: ifne +278 -> 705
    //   430: aload 20
    //   432: ldc_w 805
    //   435: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   438: ifne +267 -> 705
    //   441: aload 20
    //   443: ldc_w 845
    //   446: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   449: ifne +256 -> 705
    //   452: aload 20
    //   454: ldc_w 841
    //   457: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   460: ifne +245 -> 705
    //   463: aload 20
    //   465: ldc_w 815
    //   468: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   471: ifne +234 -> 705
    //   474: aload 20
    //   476: ldc_w 833
    //   479: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   482: ifne +223 -> 705
    //   485: aload 20
    //   487: ldc_w 837
    //   490: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   493: ifne +212 -> 705
    //   496: aload 20
    //   498: ldc_w 821
    //   501: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   504: ifne +201 -> 705
    //   507: aload 20
    //   509: ldc_w 825
    //   512: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   515: ifne +190 -> 705
    //   518: aload 20
    //   520: ldc_w 791
    //   523: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   526: ifne +179 -> 705
    //   529: aload 20
    //   531: ldc_w 779
    //   534: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   537: ifne +168 -> 705
    //   540: aload 20
    //   542: ldc_w 829
    //   545: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   548: ifne +157 -> 705
    //   551: aload 20
    //   553: ldc_w 767
    //   556: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   559: ifne +146 -> 705
    //   562: aload 20
    //   564: ldc_w 843
    //   567: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   570: ifne +135 -> 705
    //   573: aload 20
    //   575: ldc_w 839
    //   578: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   581: ifne +124 -> 705
    //   584: aload 20
    //   586: ldc_w 817
    //   589: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   592: ifne +113 -> 705
    //   595: aload 20
    //   597: ldc_w 831
    //   600: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   603: ifne +102 -> 705
    //   606: aload 20
    //   608: ldc_w 835
    //   611: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   614: ifne +91 -> 705
    //   617: aload 20
    //   619: ldc_w 819
    //   622: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   625: ifne +80 -> 705
    //   628: aload 20
    //   630: ldc_w 823
    //   633: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   636: ifne +69 -> 705
    //   639: aload 20
    //   641: ldc_w 793
    //   644: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   647: ifne +58 -> 705
    //   650: aload 20
    //   652: ldc_w 781
    //   655: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   658: ifne +47 -> 705
    //   661: aload 20
    //   663: ldc_w 827
    //   666: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   669: ifne +36 -> 705
    //   672: aload 20
    //   674: ldc_w 769
    //   677: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   680: ifne +25 -> 705
    //   683: aload 20
    //   685: ldc_w 807
    //   688: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   691: ifne +14 -> 705
    //   694: aload 20
    //   696: ldc_w 811
    //   699: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   702: ifeq +47 -> 749
    //   705: aload 20
    //   707: ldc_w 759
    //   710: invokevirtual 354	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   713: ifne +36 -> 749
    //   716: ldc 31
    //   718: new 195	java/lang/StringBuilder
    //   721: dup
    //   722: invokespecial 196	java/lang/StringBuilder:<init>	()V
    //   725: ldc_w 863
    //   728: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   731: aload 20
    //   733: invokevirtual 211	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   736: invokevirtual 215	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   739: invokestatic 284	com/belkin/wemo/cache/utils/SDKLogUtils:infoLog	(Ljava/lang/String;Ljava/lang/String;)V
    //   742: aload_3
    //   743: aload 20
    //   745: invokevirtual 866	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   748: pop
    //   749: iinc 19 1
    //   752: goto -545 -> 207
    //   755: aload 13
    //   757: ifnull +21 -> 778
    //   760: aload 13
    //   762: invokevirtual 734	java/io/BufferedReader:close	()V
    //   765: goto -604 -> 161
    //   768: astore 22
    //   770: aload 22
    //   772: invokevirtual 852	java/io/IOException:printStackTrace	()V
    //   775: goto -614 -> 161
    //   778: aconst_null
    //   779: areturn
    //   780: astore 10
    //   782: aload 10
    //   784: invokevirtual 852	java/io/IOException:printStackTrace	()V
    //   787: goto -626 -> 161
    //   790: aconst_null
    //   791: areturn
    //   792: astore 8
    //   794: aload_2
    //   795: ifnull +20 -> 815
    //   798: aload_2
    //   799: invokevirtual 734	java/io/BufferedReader:close	()V
    //   802: aload 8
    //   804: athrow
    //   805: astore 9
    //   807: aload 9
    //   809: invokevirtual 852	java/io/IOException:printStackTrace	()V
    //   812: goto -10 -> 802
    //   815: aconst_null
    //   816: areturn
    //   817: astore 11
    //   819: aload 11
    //   821: invokevirtual 510	java/lang/Exception:printStackTrace	()V
    //   824: aconst_null
    //   825: areturn
    //   826: astore 8
    //   828: aload 13
    //   830: astore_2
    //   831: goto -37 -> 794
    //   834: astore 7
    //   836: aconst_null
    //   837: astore_2
    //   838: goto -690 -> 148
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	841	0	this	MoreUtil
    //   0	841	1	paramString	String
    //   1	837	2	localObject1	Object
    //   9	734	3	localArrayList	ArrayList
    //   17	37	4	localDefaultHttpClient	org.apache.http.impl.client.DefaultHttpClient
    //   26	30	5	localHttpGet	org.apache.http.client.methods.HttpGet
    //   36	5	6	localURI	java.net.URI
    //   143	6	7	localException1	Exception
    //   834	1	7	localException2	Exception
    //   792	11	8	localObject2	Object
    //   826	1	8	localObject3	Object
    //   805	3	9	localIOException1	java.io.IOException
    //   780	3	10	localIOException2	java.io.IOException
    //   817	3	11	localException3	Exception
    //   165	3	12	i	int
    //   78	751	13	localBufferedReader	java.io.BufferedReader
    //   89	93	14	localStringBuffer	StringBuffer
    //   96	27	15	str1	String
    //   192	23	17	arrayOfString	String[]
    //   202	10	18	j	int
    //   205	545	19	k	int
    //   219	525	20	str2	String
    //   768	3	22	localIOException3	java.io.IOException
    // Exception table:
    //   from	to	target	type
    //   80	91	143	java/lang/Exception
    //   91	98	143	java/lang/Exception
    //   103	140	143	java/lang/Exception
    //   176	194	143	java/lang/Exception
    //   199	204	143	java/lang/Exception
    //   214	705	143	java/lang/Exception
    //   705	749	143	java/lang/Exception
    //   760	765	768	java/io/IOException
    //   157	161	780	java/io/IOException
    //   10	80	792	finally
    //   148	153	792	finally
    //   798	802	805	java/io/IOException
    //   161	167	817	java/lang/Exception
    //   80	91	826	finally
    //   91	98	826	finally
    //   103	140	826	finally
    //   176	194	826	finally
    //   199	204	826	finally
    //   214	705	826	finally
    //   705	749	826	finally
    //   10	80	834	java/lang/Exception
  }
  
  public int getFirmwareNumber(String paramString)
  {
    return Integer.parseInt(paramString.split("\\.")[2]);
  }
  
  public String getFirmwareNumberForBulb(String paramString)
  {
    return paramString.split("_")[4];
  }
  
  public String getPackageName(Context paramContext)
  {
    return paramContext.getApplicationContext().getPackageName();
  }
  
  public int getRandomNumber(int paramInt1, int paramInt2)
  {
    return paramInt1 + (int)Math.floor(Math.random() * (1 + (paramInt2 - paramInt1)));
  }
  
  public String getReUnionKey(SharePreferences paramSharePreferences)
  {
    SDKLogUtils.infoLog("MoreUtil", "getReUnionKey reUnionKey: " + paramSharePreferences.getReUnionKey());
    if (paramSharePreferences.getReUnionKey() == null) {
      return generateReUnionKey(paramSharePreferences);
    }
    return paramSharePreferences.getReUnionKey();
  }
  
  public String getSignalStrength(Context paramContext, String paramString)
  {
    NetworkInfo localNetworkInfo = ((ConnectivityManager)paramContext.getSystemService("connectivity")).getActiveNetworkInfo();
    int i = 0;
    if (localNetworkInfo != null)
    {
      boolean bool1 = localNetworkInfo.isConnectedOrConnecting();
      i = 0;
      if (bool1) {
        break label44;
      }
    }
    while (i == 0)
    {
      return "N/A";
      label44:
      int j = localNetworkInfo.getType();
      if (j == 1)
      {
        List localList = ((WifiManager)paramContext.getSystemService("wifi")).getScanResults();
        boolean bool2 = localList.equals(null);
        i = 0;
        if (!bool2) {
          for (int k = 0;; k++)
          {
            int m = localList.size();
            i = 0;
            if (k >= m) {
              break;
            }
            ScanResult localScanResult = (ScanResult)localList.get(k);
            if (paramString.equalsIgnoreCase(localScanResult.BSSID.replaceAll(":", "")))
            {
              i = localScanResult.level;
              break;
            }
          }
        }
      }
      else
      {
        i = 0;
        if (j == 0) {
          i = 0;
        }
      }
    }
    return i + "";
  }
  
  public String getVersionNumber()
  {
    return Build.VERSION.RELEASE;
  }
  
  public HashMap<String, ArrayList<String>> populateTagList()
  {
    HashMap localHashMap = new HashMap();
    ArrayList localArrayList1 = new ArrayList();
    localArrayList1.addAll(Arrays.asList(new String[] { "makerFlag", "signedMakerFlag", "openWRTMaker", "openWRTTransMaker" }));
    localHashMap.put("urn:Belkin:device:Maker:1", localArrayList1);
    ArrayList localArrayList2 = new ArrayList();
    localArrayList2.addAll(Arrays.asList(new String[] { "usFlag", "euFlag", "signedusFlag", "signedeuFlag", "openWRTSNS", "openWRTTransSNS" }));
    localHashMap.put("urn:Belkin:device:sensor:1", localArrayList2);
    localHashMap.put("urn:Belkin:device:controllee:1", localArrayList2);
    ArrayList localArrayList3 = new ArrayList();
    localArrayList3.addAll(Arrays.asList(new String[] { "lightFlag", "signedLightFlag", "openWRTlight", "openWRTTranslight" }));
    localHashMap.put("urn:Belkin:device:lightswitch:1", localArrayList3);
    ArrayList localArrayList4 = new ArrayList();
    localArrayList4.addAll(Arrays.asList(new String[] { "HumidifierFlag", "openWRTTransHumidifier", "openWRTHumidifier" }));
    localHashMap.put("urn:Belkin:device:Humidifier:1", localArrayList4);
    ArrayList localArrayList5 = new ArrayList();
    localArrayList5.addAll(Arrays.asList(new String[] { "HumidifierBFlag", "openWRTTransHumidifierB", "openWRTHumidifierB" }));
    localHashMap.put("urn:Belkin:device:HumidifierB:1", localArrayList5);
    ArrayList localArrayList6 = new ArrayList();
    localArrayList6.addAll(Arrays.asList(new String[] { "slowcookerUSFlag", "openWRTSlowCooker", "openWRTTransSlowCooker" }));
    localHashMap.put("urn:Belkin:device:crockpot:1", localArrayList6);
    ArrayList localArrayList7 = new ArrayList();
    localArrayList7.addAll(Arrays.asList(new String[] { "bridgewwFlag" }));
    localHashMap.put("urn:Belkin:device:bridge:1", localArrayList7);
    ArrayList localArrayList8 = new ArrayList();
    localArrayList8.addAll(Arrays.asList(new String[] { "bulbWWflag" }));
    localHashMap.put("MZ100", localArrayList8);
    ArrayList localArrayList9 = new ArrayList();
    localArrayList9.addAll(Arrays.asList(new String[] { "AirPurifierFlag" }));
    localHashMap.put("urn:Belkin:device:AirPurifier:1", localArrayList9);
    ArrayList localArrayList10 = new ArrayList();
    localArrayList10.addAll(Arrays.asList(new String[] { "CoffeeMakerFlag" }));
    localHashMap.put("urn:Belkin:device:CoffeeMaker:1", localArrayList10);
    ArrayList localArrayList11 = new ArrayList();
    localArrayList11.addAll(Arrays.asList(new String[] { "HeaterAFlag" }));
    localHashMap.put("urn:Belkin:device:HeaterA:1", localArrayList11);
    ArrayList localArrayList12 = new ArrayList();
    localArrayList12.addAll(Arrays.asList(new String[] { "HeaterBFlag" }));
    localHashMap.put("urn:Belkin:device:HeaterB:1", localArrayList12);
    ArrayList localArrayList13 = new ArrayList();
    localArrayList13.addAll(Arrays.asList(new String[] { "insightFlag", "signedInsightFlag", "openWRTinsight", "openWRTTransinsight" }));
    localHashMap.put("urn:Belkin:device:insight:1", localArrayList13);
    ArrayList localArrayList14 = new ArrayList();
    localArrayList14.addAll(Arrays.asList(new String[] { "openWRTInsightV2" }));
    localHashMap.put("urn:Belkin:device:insight:1v2", localArrayList14);
    ArrayList localArrayList15 = new ArrayList();
    localArrayList15.addAll(Arrays.asList(new String[] { "GardenspotRGBFlag" }));
    localHashMap.put("Gardenspot RGB", localArrayList15);
    ArrayList localArrayList16 = new ArrayList();
    localArrayList16.addAll(Arrays.asList(new String[] { "ClassicA60TWFlag" }));
    localHashMap.put("Classic A60 TW", localArrayList16);
    ArrayList localArrayList17 = new ArrayList();
    localArrayList17.addAll(Arrays.asList(new String[] { "FlexRGBWFlag" }));
    localHashMap.put("Flex RGBW", localArrayList17);
    return localHashMap;
  }
  
  public void resetFWFlags(String paramString)
  {
    if (paramString != null)
    {
      ArrayList localArrayList = (ArrayList)populateTagList().get(paramString);
      if ((localArrayList != null) && (localArrayList.size() > 0))
      {
        Iterator localIterator = localArrayList.iterator();
        while (localIterator.hasNext()) {
          resetFieldValue((String)localIterator.next());
        }
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/utils/MoreUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */