package com.belkin.wemo.cache.utils;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.AssetManager;
import android.text.TextUtils;
import com.belkin.wemo.rules.util.RuleUtility;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class SharePreferences
{
  private static final String BELKIN_PREFERENCE = "belkinprefs";
  public static final String KEY_APP_VERSION_GCM_REG_ID = "gcm_reg_id_app_version";
  public static final String KEY_GCM_REGISTRATION_ID = "gcm_registration_id";
  public static final String KEY_INSIGHT_DRAWER_STATE_MAP = "insightDrawerStateMap";
  public static final String KEY_RULE_DB_ZIP_PATH = "zip_rule_db_path";
  public static final String KEY_RULE_DB_ZIP_VER = "zip_rule_db_version";
  private static final String KEY_SENSOR_EVENTS_COUNTER = "sensor_event_counter";
  private static final String TAG = "SDK_SharePreference";
  private final String APP_USED_COUNT = "hybrid_appusedcount";
  private final String CACHE_ARPMAC = "hybrid_cachearpmac";
  private final String CACHE_SSID = "hybrid_cachessid";
  private final String CURRENT_LOCATION_HOME_ID = "current_location_home_id";
  private final String CURRENT_TIMESTAMP = "current_timestamp";
  private final String FULL_SUCCESSFUL_DISCOVERY_COUNTER = "FULL_SUCCESSFUL_DISCOVERY_COUNTER";
  private final String GET_STARTED_NEEDED = "hybrid_getStartedNeeded";
  private final String HOME_ID = "home_id";
  private final String INSIGHT_CURRENCY = "Currency";
  private final String INSIGHT_ENERGY_PER_UNIT_COST = "EnergyPerUnitCost";
  private final String IS_NEST_AUTH_CALLBACK_SUCCESSFUL = "hybrid_isNestAuthCallbackSuccessful";
  private final String IS_NEST_DEAUTH_CALLBACK_SUCCESSFUL = "hybrid_isNestDeauthCallbackSuccessful";
  private final String LOCAL_NETWORK_SSID = "localNetworkSSID";
  private final String PREFERENCE_APP_RECOVERY_COUNTER = "appRecoveryCounter";
  private final String PREFERENCE_APP_RECOVERY_FLAG = "appRecoveryFlag";
  private final String PREFERENCE_APP_RECOVERY_MAXCOUNT = "appRecoveryMaxCount";
  private final String PREFERENCE_APP_VERSION_CODE = "PREFERENCE_APP_VERSION_CODE";
  private final String PREFERENCE_ARP_MACS = "arpMacs";
  private final String PREFERENCE_CHECK_REMOTE_ACCESS = "remoteAccess";
  private final String PREFERENCE_COLLECT_EMAIL = "collectEmail";
  private final String PREFERENCE_COLLECT_EMAIL_IT = "collectEmailIT";
  private final String PREFERENCE_DEVICE_UNIQUE_ID = "deviceUniqueId";
  private final String PREFERENCE_HOME_SSID = "homeSSID";
  private final String PREFERENCE_HOME_SSIDS = "homeSSIDs";
  private final String PREFERENCE_REUNION_KEY = "re_union_key";
  private final String PREFERENCE_USER_EMAIL = "userEmail";
  private final String PREFERENCE_WEMOHEADERHEIGHT = "WeMoHeaderHeight";
  private final String PRIVATE_KEY = "private_key";
  private final String PRIVATE_KEY_FILE = "private_key_file";
  private final String REMOTE_AUTO_ENABLE_NEEDED = "hybrid_remoteAutoEnableNeeded";
  private final String RULE__HOME_SSID = "hybrid_ruleHomeSSID";
  private final String SAVE_AP_VALUES = "hybrid_apvalues";
  private final String SAVE_BRIDGE_IP = "save_bridge_ip_address";
  private final String SAVE_BRIDGE_VALUES = "save_bridge_data";
  private final String SAVE_CONFIGURATION = "hybrid_homeNetworkConfiguration";
  private final String SAVE_CONFIGURATION_STATUS = "hybrid_saveConfigurationStatus";
  private final String SET_DB_VER = "hybrid_app_db_ver";
  private final String SET_EMAIL_DEVICE_TYPE = "emailDeviceType";
  private final String USER_DID_DECLINE_RATING_POPUP = "USER_DID_DECLINE_RATING_POPUP";
  private final String USER_DID_RATE_WEMO = "USER_DID_RATE_WEMO";
  private final String USER_DISMISS_THE_PLUGIN_POPUP = "USER_DISMISS_THE_PLUGIN_POPUP";
  private final String WIDGET_DEVICE_ID = "widget_device_id: ";
  private final String WIDGET_ID = "widget_id: ";
  private Context mContext;
  
  public SharePreferences(Context paramContext)
  {
    this.mContext = paramContext;
  }
  
  public static int getCurrentAppVersion(Context paramContext)
  {
    try
    {
      PackageInfo localPackageInfo = paramContext.getPackageManager().getPackageInfo(paramContext.getPackageName(), 0);
      return localPackageInfo.versionCode;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      throw new RuntimeException(localNameNotFoundException);
    }
  }
  
  public static String getGCMRegistrationId(Context paramContext)
  {
    String str = paramContext.getSharedPreferences("belkinprefs", 0).getString("gcm_registration_id", new String());
    SDKLogUtils.infoLog("SDK_SharePreference", "PUSH Notification: Getting GCM registration Id from Shared Preferences: " + str);
    return str;
  }
  
  public static int getGCMRegistrationIdStorageAppVersion(Context paramContext)
  {
    int i = paramContext.getSharedPreferences("belkinprefs", 0).getInt("gcm_reg_id_app_version", Integer.MIN_VALUE);
    SDKLogUtils.infoLog("SDK_SharePreference", "PUSH Notification: App version while storing GCM registration Id: " + i);
    return i;
  }
  
  public static int getInsightDrawerState(Context paramContext, String paramString)
  {
    String str = paramContext.getSharedPreferences("belkinprefs", 0).getString("insightDrawerStateMap", null);
    for (;;)
    {
      try
      {
        boolean bool = TextUtils.isEmpty(str);
        i = 0;
        JSONObject localJSONObject;
        if (!bool) {
          localJSONObject = new JSONObject(str);
        }
        int j;
        SDKLogUtils.errorLog("SDK_SharePreference", "Insight Drawer State: JSON Exception while fetching Insight Drawer State from Shared Pref:  ", localJSONException1);
      }
      catch (JSONException localJSONException1)
      {
        try
        {
          SDKLogUtils.debugLog("SDK_SharePreference", "Insight Drawer State: Latest Insight Drawer State JSONObject: " + localJSONObject.toString());
          j = localJSONObject.getInt(paramString);
          i = j;
          SDKLogUtils.infoLog("SDK_SharePreference", "Insight Drawer State: UDN = " + paramString + "; state = " + i);
          return i;
        }
        catch (JSONException localJSONException2)
        {
          int i;
          for (;;) {}
        }
        localJSONException1 = localJSONException1;
      }
      i = 0;
    }
  }
  
  public static String getRuleDBZipPath(Context paramContext)
  {
    String str = paramContext.getSharedPreferences("belkinprefs", 0).getString("zip_rule_db_path", "");
    SDKLogUtils.infoLog("SDK_SharePreference", "Get Rule DB ZIP file path: " + str);
    return str;
  }
  
  public static int getRuleDBZipVersion(Context paramContext)
  {
    int i = paramContext.getSharedPreferences("belkinprefs", 0).getInt("zip_rule_db_version", 0);
    SDKLogUtils.infoLog("SDK_SharePreference", "Get Rule DB ZIP file version: " + i);
    return i;
  }
  
  public static int getSensorEventsCount(Context paramContext)
  {
    return paramContext.getSharedPreferences("belkinprefs", 0).getInt("sensor_event_counter", 0);
  }
  
  public static void resetInsightDrawerStates(Context paramContext)
  {
    SharedPreferences.Editor localEditor = paramContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.putString("insightDrawerStateMap", null);
    localEditor.commit();
    SDKLogUtils.debugLog("SDK_SharePreference", "Insight Drawer State: State for all insights have been RESET.");
  }
  
  public static void resetSensorEventCounter(Context paramContext)
  {
    SharedPreferences.Editor localEditor = paramContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.putInt("sensor_event_counter", 0);
    localEditor.commit();
  }
  
  public static void setGCMRegistrationId(String paramString, Context paramContext)
  {
    SDKLogUtils.infoLog("SDK_SharePreference", "PUSH Notification: Storing GCM registration Id in Shared Preferences: " + paramString);
    SharedPreferences.Editor localEditor = paramContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.putString("gcm_registration_id", paramString);
    localEditor.putInt("gcm_reg_id_app_version", getCurrentAppVersion(paramContext));
    localEditor.commit();
  }
  
  public static void setInsightDrawerState(Context paramContext, String paramString, int paramInt)
  {
    SharedPreferences localSharedPreferences = paramContext.getSharedPreferences("belkinprefs", 0);
    SharedPreferences.Editor localEditor = localSharedPreferences.edit();
    String str = localSharedPreferences.getString("insightDrawerStateMap", null);
    for (;;)
    {
      try
      {
        if (!TextUtils.isEmpty(str)) {
          continue;
        }
        localObject = new JSONObject();
        ((JSONObject)localObject).put(paramString, paramInt);
        SDKLogUtils.debugLog("SDK_SharePreference", "Insight Drawer State: New Insight Drawer State JSONObject After Update: " + ((JSONObject)localObject).toString());
        localEditor.putString("insightDrawerStateMap", ((JSONObject)localObject).toString());
      }
      catch (JSONException localJSONException)
      {
        Object localObject;
        JSONObject localJSONObject;
        SDKLogUtils.errorLog("SDK_SharePreference", "Insight Drawer State: JSON Exception while editing Insight Drawer State in Shared Pref:  ", localJSONException);
        continue;
      }
      localEditor.commit();
      return;
      localJSONObject = new JSONObject(str);
      localObject = localJSONObject;
    }
  }
  
  public static void setRuleDBZipPath(Context paramContext, String paramString)
  {
    SharedPreferences.Editor localEditor = paramContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.putString("zip_rule_db_path", paramString);
    SDKLogUtils.infoLog("SDK_SharePreference", "Rule DB ZIP file path set to: " + paramString);
    localEditor.commit();
  }
  
  public static void setRuleDBZipVersion(Context paramContext, int paramInt)
  {
    SharedPreferences.Editor localEditor = paramContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.putInt("zip_rule_db_version", paramInt);
    SDKLogUtils.infoLog("SDK_SharePreference", "Rule DB ZIP file version set to: " + paramInt);
    localEditor.commit();
  }
  
  public static void updateSensorEventCounter(Context paramContext)
  {
    SharedPreferences localSharedPreferences = paramContext.getSharedPreferences("belkinprefs", 0);
    int i = localSharedPreferences.getInt("sensor_event_counter", 0);
    SDKLogUtils.infoLog("SDK_SharePreference", "updateSensorEventCounter stored value: " + i);
    SharedPreferences.Editor localEditor = localSharedPreferences.edit();
    localEditor.putInt("sensor_event_counter", 1);
    localEditor.commit();
  }
  
  public boolean checkConfigurationStatus()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getBoolean("hybrid_saveConfigurationStatus", false);
  }
  
  public boolean deleteEmailIds(int paramInt)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("belkinprefs", 0).edit();
    if (paramInt == 0) {
      localEditor.remove("collectEmail");
    }
    for (;;)
    {
      return localEditor.commit();
      localEditor.remove("collectEmailIT");
    }
  }
  
  public boolean deleteEmailOptDeviceType()
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.remove("emailDeviceType");
    return localEditor.commit();
  }
  
  public String getAPValues()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getString("hybrid_apvalues", "100");
  }
  
  public Set<String> getARPMacs()
  {
    Set localSet = this.mContext.getSharedPreferences("belkinprefs", 0).getStringSet("arpMacs", new HashSet());
    SDKLogUtils.infoLog("SDK_SharePreference", "getARPMacs() :: " + localSet);
    return localSet;
  }
  
  public int getAppHeaderHeight()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getInt("WeMoHeaderHeight", 0);
  }
  
  public int getAppRecoveryCounter()
  {
    int i = this.mContext.getSharedPreferences("belkinprefs", 0).getInt("appRecoveryCounter", 0);
    SDKLogUtils.infoLog("SDK_SharePreference", "getAppRecoveryCounter() :: " + i);
    return i;
  }
  
  public boolean getAppRecoveryFlag()
  {
    boolean bool = this.mContext.getSharedPreferences("belkinprefs", 0).getBoolean("appRecoveryFlag", false);
    SDKLogUtils.infoLog("SDK_SharePreference", "getAppRecoveryFlag() :: " + bool);
    return bool;
  }
  
  public int getAppRecoveryMaxCount()
  {
    int i = this.mContext.getSharedPreferences("belkinprefs", 0).getInt("appRecoveryMaxCount", 0);
    SDKLogUtils.infoLog("SDK_SharePreference", "getAppRecoveryMaxCount() :: " + i);
    return i;
  }
  
  public long getAppUsedCount()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getLong("hybrid_appusedcount", 0L);
  }
  
  public String getAppVersionCode()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getString("PREFERENCE_APP_VERSION_CODE", null);
  }
  
  public String getCacheArpMac()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getString("hybrid_cachearpmac", "");
  }
  
  public String getCacheSSID()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getString("hybrid_cachessid", "");
  }
  
  public String getCurrentLocationHomeId()
  {
    return this.mContext.getSharedPreferences("current_location_home_id", 0).getString("current_location_home_id", "");
  }
  
  public String getDBVersion()
  {
    String str;
    try
    {
      str = this.mContext.getSharedPreferences("belkinprefs", 0).getString("hybrid_app_db_ver", "0");
      SDKLogUtils.infoLog("SDK_SharePreference", "DB Verion in SharedPref: getDBVersion(): " + str);
      boolean bool = new RuleUtility(this.mContext).dbExist();
      try
      {
        if ((Integer.valueOf(str).intValue() < 0) || (!bool))
        {
          SDKLogUtils.infoLog("SDK_SharePreference", "DB version retrieved from Shared Pref is less than default value. Setting DB version to default.");
          str = "0";
          setDBVersion(str);
        }
      }
      catch (NumberFormatException localNumberFormatException)
      {
        for (;;)
        {
          SDKLogUtils.errorLog("SDK_SharePreference", "NumberFormatException for DB version in Shared Pref: ", localNumberFormatException);
          str = "0";
          setDBVersion(str);
        }
      }
      return str;
    }
    finally {}
  }
  
  public String[] getDefaultInsightHomeSettings()
  {
    String[] arrayOfString = new String[2];
    String str = Locale.getDefault().getCountry();
    try
    {
      JSONArray localJSONArray = new JSONObject(loadJSONFromAsset()).getJSONArray(str);
      arrayOfString[0] = Double.toString(1000.0D * ((Double)localJSONArray.get(0)).doubleValue());
      arrayOfString[1] = ((String)localJSONArray.get(2));
      return arrayOfString;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return null;
  }
  
  public String getEmailIds()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getString("userEmail", "");
  }
  
  public String getEmailOptDeviceType()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getString("emailDeviceType", "");
  }
  
  public String getFaderPref(String paramString)
  {
    String str = this.mContext.getSharedPreferences("belkinprefs", 0).getString(paramString, "");
    if ((str == null) || (str.equals(""))) {
      str = "-1";
    }
    return str;
  }
  
  public int getFullSuccessfulDiscoveryCounter()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getInt("FULL_SUCCESSFUL_DISCOVERY_COUNTER", 0);
  }
  
  public boolean getGetStartedNeeded()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getBoolean("hybrid_getStartedNeeded", true);
  }
  
  public String getHomeId()
  {
    return this.mContext.getSharedPreferences("private_key_file", 0).getString("home_id", "");
  }
  
  public Set<String> getHomeSSIDs()
  {
    Object localObject = this.mContext.getSharedPreferences("belkinprefs", 0).getStringSet("homeSSIDs", new HashSet());
    if (((Set)localObject).size() == 0)
    {
      String str = this.mContext.getSharedPreferences("belkinprefs", 0).getString("homeSSID", "");
      if (str.length() > 0)
      {
        localObject = new HashSet();
        ((Set)localObject).add(str);
      }
    }
    return (Set<String>)localObject;
  }
  
  public String[] getInsightHomeSettingsParams()
  {
    String[] arrayOfString1 = new String[2];
    SharedPreferences localSharedPreferences = this.mContext.getSharedPreferences("belkinprefs", 0);
    arrayOfString1[0] = localSharedPreferences.getString("EnergyPerUnitCost", "");
    arrayOfString1[1] = localSharedPreferences.getString("Currency", "");
    String[] arrayOfString2;
    if ((arrayOfString1[0].equals("")) && (arrayOfString1[1].equals("")))
    {
      arrayOfString2 = getDefaultInsightHomeSettings();
      if (arrayOfString2 != null) {
        break label101;
      }
      arrayOfString1[0] = "111";
      arrayOfString1[1] = "1";
    }
    for (;;)
    {
      saveInsightHomeSettingsParams(arrayOfString1[1], arrayOfString1[0]);
      return arrayOfString1;
      label101:
      arrayOfString1[0] = arrayOfString2[0];
      arrayOfString1[1] = arrayOfString2[1];
    }
  }
  
  public String getLocalNetworkSSID()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getString("localNetworkSSID", "");
  }
  
  public int getNestAuthCallbackStatus()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getInt("hybrid_isNestAuthCallbackSuccessful", -1);
  }
  
  public int getNestDeauthCallbackStatus()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getInt("hybrid_isNestDeauthCallbackSuccessful", -1);
  }
  
  public String getPrivateKey()
  {
    return this.mContext.getSharedPreferences("private_key_file", 0).getString("private_key", null);
  }
  
  public String getReUnionKey()
  {
    return this.mContext.getSharedPreferences("re_union_key", 0).getString("re_union_key", null);
  }
  
  public String getRemoteAccessSSID()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getString("homeSSID", "");
  }
  
  public boolean getRemoteAutoEnableNeeded()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getBoolean("hybrid_remoteAutoEnableNeeded", true);
  }
  
  public String getRuleHomeSSID()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getString("hybrid_ruleHomeSSID", "");
  }
  
  public String getSetupCredential()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getString("hybrid_homeNetworkConfiguration", null);
  }
  
  public String getStoredLegacyEmails()
  {
    this.mContext.getSharedPreferences("belkinprefs", 0).getString("collectEmail", "");
    String str = "";
    if (str.equals("")) {
      str = this.mContext.getSharedPreferences("belkinprefs", 0).getString("collectEmailIT", "");
    }
    return str;
  }
  
  public long getTimeStamp()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getLong("current_timestamp", 0L);
  }
  
  public String getUniqueID()
  {
    Context localContext = this.mContext;
    String str = null;
    if (localContext != null) {
      str = this.mContext.getSharedPreferences("belkinprefs", 0).getString("deviceUniqueId", null);
    }
    return str;
  }
  
  public String getWemoBridgeIp()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getString("save_bridge_ip_address", "");
  }
  
  public String getWidgetData(int paramInt)
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getString("widget_id: " + paramInt, "");
  }
  
  public Set<String> getWidgetIdSet(String paramString)
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getStringSet("widget_device_id: " + paramString, null);
  }
  
  public String getbridgeValues()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getString("save_bridge_data", "");
  }
  
  public boolean isRemoteEnabled()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getBoolean("remoteAccess", false);
  }
  
  public boolean isUserDidDeclineRatingsPopup()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getBoolean("USER_DID_DECLINE_RATING_POPUP", false);
  }
  
  public boolean isUserDidRateWeMo()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getBoolean("USER_DID_RATE_WEMO", false);
  }
  
  public boolean isUserDismissPluginPopup()
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).getBoolean("USER_DISMISS_THE_PLUGIN_POPUP", false);
  }
  
  public String loadJSONFromAsset()
  {
    try
    {
      InputStream localInputStream = this.mContext.getAssets().open("DefaultCost.json");
      byte[] arrayOfByte = new byte[localInputStream.available()];
      localInputStream.read(arrayOfByte);
      localInputStream.close();
      String str = new String(arrayOfByte, "UTF-8");
      return str;
    }
    catch (IOException localIOException)
    {
      localIOException.printStackTrace();
    }
    return null;
  }
  
  public void removeWidgetData(int paramInt)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.remove("widget_id: " + paramInt);
    localEditor.apply();
  }
  
  public void removeWidgetIdSet(String paramString)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.remove("widget_device_id: " + paramString);
    localEditor.apply();
  }
  
  public void saveAPValues(String paramString)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.putString("hybrid_apvalues", paramString);
    localEditor.commit();
  }
  
  public void saveBridgeSetup(String paramString)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.putString("save_bridge_data", paramString);
    localEditor.commit();
  }
  
  public void saveConfigurationStatus(boolean paramBoolean)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.putBoolean("hybrid_saveConfigurationStatus", paramBoolean);
    localEditor.commit();
  }
  
  public void saveInsightHomeSettingsParams(String paramString1, String paramString2)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.putString("EnergyPerUnitCost", paramString2);
    localEditor.putString("Currency", paramString1);
    localEditor.commit();
  }
  
  public void saveSetupCredential(String paramString)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.putString("hybrid_homeNetworkConfiguration", paramString);
    localEditor.commit();
  }
  
  public void saveWemoBridgeIpAdress(String paramString)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.putString("save_bridge_ip_address", paramString);
    localEditor.commit();
  }
  
  public boolean set(String paramString1, String paramString2, String paramString3)
  {
    return this.mContext.getSharedPreferences(paramString1, 0).edit().putString(paramString2, paramString3).commit();
  }
  
  public boolean setARPMacs(Set<String> paramSet)
  {
    SDKLogUtils.infoLog("SDK_SharePreference", "setARPMacs() :: " + paramSet);
    return this.mContext.getSharedPreferences("belkinprefs", 0).edit().putStringSet("arpMacs", paramSet).commit();
  }
  
  public boolean setAppHeaderHeight(int paramInt)
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).edit().putInt("WeMoHeaderHeight", paramInt).commit();
  }
  
  public void setAppRecoveryCounter(int paramInt)
  {
    SDKLogUtils.infoLog("SDK_SharePreference", "setAppRecoveryCounter() :: " + paramInt);
    this.mContext.getSharedPreferences("belkinprefs", 0).edit().putInt("appRecoveryCounter", paramInt).commit();
  }
  
  public void setAppRecoveryFlag(boolean paramBoolean)
  {
    SDKLogUtils.infoLog("SDK_SharePreference", "setAppRecoveryFlag() :: " + paramBoolean);
    this.mContext.getSharedPreferences("belkinprefs", 0).edit().putBoolean("appRecoveryFlag", paramBoolean).commit();
  }
  
  public void setAppRecoveryMaxCount(int paramInt)
  {
    SDKLogUtils.infoLog("SDK_SharePreference", "setAppRecoveryMaxCount() :: " + paramInt);
    this.mContext.getSharedPreferences("belkinprefs", 0).edit().putInt("appRecoveryMaxCount", paramInt).commit();
  }
  
  public void setAppUsedCount(long paramLong)
  {
    this.mContext.getSharedPreferences("belkinprefs", 0).edit().putLong("hybrid_appusedcount", paramLong).commit();
  }
  
  public void setAppVersionCode(String paramString)
  {
    this.mContext.getSharedPreferences("belkinprefs", 0).edit().putString("PREFERENCE_APP_VERSION_CODE", paramString).commit();
  }
  
  public boolean setCacheArpMac(String paramString)
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).edit().putString("hybrid_cachearpmac", paramString).commit();
  }
  
  public boolean setCacheSSID(String paramString)
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).edit().putString("hybrid_cachessid", paramString).commit();
  }
  
  public void setCurrentLocationHomeId(String paramString)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("current_location_home_id", 0).edit();
    localEditor.putString("current_location_home_id", paramString);
    localEditor.commit();
  }
  
  public void setCurrentTimeStamp(long paramLong)
  {
    this.mContext.getSharedPreferences("belkinprefs", 0).edit().putLong("current_timestamp", paramLong).commit();
  }
  
  public void setDBVersion(String paramString)
  {
    try
    {
      SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("belkinprefs", 0).edit();
      localEditor.putString("hybrid_app_db_ver", paramString);
      SDKLogUtils.infoLog("SDK_SharePreference", "DB Verion in SharedPref: setDBVersion(): " + paramString);
      localEditor.commit();
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void setFaderPref(String paramString1, String paramString2)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.putString(paramString1, paramString2);
    localEditor.commit();
  }
  
  public void setFullSuccessfulDiscoveryCounter(int paramInt)
  {
    this.mContext.getSharedPreferences("belkinprefs", 0).edit().putInt("FULL_SUCCESSFUL_DISCOVERY_COUNTER", paramInt).commit();
  }
  
  public void setGetStartedNeeded(boolean paramBoolean)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.putBoolean("hybrid_getStartedNeeded", paramBoolean);
    localEditor.commit();
  }
  
  public boolean setHomeSSIDs(Set<String> paramSet)
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).edit().putStringSet("homeSSIDs", paramSet).commit();
  }
  
  public boolean setLocalNetworkSSID(String paramString)
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).edit().putString("localNetworkSSID", paramString).commit();
  }
  
  public void setNestAuthCallbackStatus(int paramInt)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.putInt("hybrid_isNestAuthCallbackSuccessful", paramInt);
    localEditor.apply();
  }
  
  public void setNestDeauthCallbackStatus(int paramInt)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.putInt("hybrid_isNestDeauthCallbackSuccessful", paramInt);
    localEditor.apply();
  }
  
  public boolean setRemoteAccessSSID(String paramString)
  {
    SDKLogUtils.infoLog("SDK_SharePreference", "setRemoteAccessSSID() :: " + paramString);
    return this.mContext.getSharedPreferences("belkinprefs", 0).edit().putString("homeSSID", paramString).commit();
  }
  
  public void setRemoteAutoEnableNeeded(boolean paramBoolean)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.putBoolean("hybrid_remoteAutoEnableNeeded", paramBoolean);
    localEditor.apply();
  }
  
  public boolean setRemoteEnabled(boolean paramBoolean)
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).edit().putBoolean("remoteAccess", paramBoolean).commit();
  }
  
  public boolean setRuleHomeSSID(String paramString)
  {
    return this.mContext.getSharedPreferences("belkinprefs", 0).edit().putString("hybrid_ruleHomeSSID", paramString).commit();
  }
  
  public void setUniqueID(String paramString)
  {
    SDKLogUtils.infoLog("SDK_SharePreference", "setUniqueID() :: " + paramString);
    this.mContext.getSharedPreferences("belkinprefs", 0).edit().putString("deviceUniqueId", paramString).commit();
  }
  
  public void setUserDidDeclineRatingsPopup(boolean paramBoolean)
  {
    this.mContext.getSharedPreferences("belkinprefs", 0).edit().putBoolean("USER_DID_DECLINE_RATING_POPUP", paramBoolean).commit();
  }
  
  public void setUserDidRateWeMo(boolean paramBoolean)
  {
    this.mContext.getSharedPreferences("belkinprefs", 0).edit().putBoolean("USER_DID_RATE_WEMO", paramBoolean).commit();
  }
  
  public void setUserDismissPluginPopup(boolean paramBoolean)
  {
    this.mContext.getSharedPreferences("belkinprefs", 0).edit().putBoolean("USER_DISMISS_THE_PLUGIN_POPUP", paramBoolean).commit();
  }
  
  public boolean storeEmailIds(String paramString)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.putString("userEmail", paramString);
    return localEditor.commit();
  }
  
  public boolean storeEmailOptDeviceType(String paramString)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.putString("emailDeviceType", paramString);
    return localEditor.commit();
  }
  
  public void storeHomeId(String paramString)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("private_key_file", 0).edit();
    localEditor.putString("home_id", paramString);
    localEditor.commit();
  }
  
  public void storePrivateKey(String paramString)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("private_key_file", 0).edit();
    localEditor.putString("private_key", paramString);
    localEditor.commit();
  }
  
  public void storeReUnionKey(String paramString)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("re_union_key", 0).edit();
    localEditor.putString("re_union_key", paramString);
    localEditor.commit();
  }
  
  public void storeWidgetData(int paramInt, String paramString)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.putString("widget_id: " + paramInt, paramString);
    localEditor.apply();
  }
  
  public void storeWidgetIdSet(String paramString, Set<String> paramSet)
  {
    SharedPreferences.Editor localEditor = this.mContext.getSharedPreferences("belkinprefs", 0).edit();
    localEditor.putStringSet("widget_device_id: " + paramString, paramSet);
    localEditor.apply();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/utils/SharePreferences.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */