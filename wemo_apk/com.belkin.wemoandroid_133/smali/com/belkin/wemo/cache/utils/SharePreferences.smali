.class public Lcom/belkin/wemo/cache/utils/SharePreferences;
.super Ljava/lang/Object;
.source "SharePreferences.java"


# static fields
.field private static final BELKIN_PREFERENCE:Ljava/lang/String; = "belkinprefs"

.field public static final KEY_APP_VERSION_GCM_REG_ID:Ljava/lang/String; = "gcm_reg_id_app_version"

.field public static final KEY_GCM_REGISTRATION_ID:Ljava/lang/String; = "gcm_registration_id"

.field public static final KEY_INSIGHT_DRAWER_STATE_MAP:Ljava/lang/String; = "insightDrawerStateMap"

.field public static final KEY_RULE_DB_ZIP_PATH:Ljava/lang/String; = "zip_rule_db_path"

.field public static final KEY_RULE_DB_ZIP_VER:Ljava/lang/String; = "zip_rule_db_version"

.field private static final KEY_SENSOR_EVENTS_COUNTER:Ljava/lang/String; = "sensor_event_counter"

.field private static final TAG:Ljava/lang/String; = "SDK_SharePreference"


# instance fields
.field private final APP_USED_COUNT:Ljava/lang/String;

.field private final CACHE_ARPMAC:Ljava/lang/String;

.field private final CACHE_SSID:Ljava/lang/String;

.field private final CURRENT_LOCATION_HOME_ID:Ljava/lang/String;

.field private final CURRENT_TIMESTAMP:Ljava/lang/String;

.field private final FULL_SUCCESSFUL_DISCOVERY_COUNTER:Ljava/lang/String;

.field private final GET_STARTED_NEEDED:Ljava/lang/String;

.field private final HOME_ID:Ljava/lang/String;

.field private final INSIGHT_CURRENCY:Ljava/lang/String;

.field private final INSIGHT_ENERGY_PER_UNIT_COST:Ljava/lang/String;

.field private final IS_NEST_AUTH_CALLBACK_SUCCESSFUL:Ljava/lang/String;

.field private final IS_NEST_DEAUTH_CALLBACK_SUCCESSFUL:Ljava/lang/String;

.field private final LOCAL_NETWORK_SSID:Ljava/lang/String;

.field private final PREFERENCE_APP_RECOVERY_COUNTER:Ljava/lang/String;

.field private final PREFERENCE_APP_RECOVERY_FLAG:Ljava/lang/String;

.field private final PREFERENCE_APP_RECOVERY_MAXCOUNT:Ljava/lang/String;

.field private final PREFERENCE_APP_VERSION_CODE:Ljava/lang/String;

.field private final PREFERENCE_ARP_MACS:Ljava/lang/String;

.field private final PREFERENCE_CHECK_REMOTE_ACCESS:Ljava/lang/String;

.field private final PREFERENCE_COLLECT_EMAIL:Ljava/lang/String;

.field private final PREFERENCE_COLLECT_EMAIL_IT:Ljava/lang/String;

.field private final PREFERENCE_DEVICE_UNIQUE_ID:Ljava/lang/String;

.field private final PREFERENCE_HOME_SSID:Ljava/lang/String;

.field private final PREFERENCE_HOME_SSIDS:Ljava/lang/String;

.field private final PREFERENCE_REUNION_KEY:Ljava/lang/String;

.field private final PREFERENCE_USER_EMAIL:Ljava/lang/String;

.field private final PREFERENCE_WEMOHEADERHEIGHT:Ljava/lang/String;

.field private final PRIVATE_KEY:Ljava/lang/String;

.field private final PRIVATE_KEY_FILE:Ljava/lang/String;

.field private final REMOTE_AUTO_ENABLE_NEEDED:Ljava/lang/String;

.field private final RULE__HOME_SSID:Ljava/lang/String;

.field private final SAVE_AP_VALUES:Ljava/lang/String;

.field private final SAVE_BRIDGE_IP:Ljava/lang/String;

.field private final SAVE_BRIDGE_VALUES:Ljava/lang/String;

.field private final SAVE_CONFIGURATION:Ljava/lang/String;

.field private final SAVE_CONFIGURATION_STATUS:Ljava/lang/String;

.field private final SET_DB_VER:Ljava/lang/String;

.field private final SET_EMAIL_DEVICE_TYPE:Ljava/lang/String;

.field private final USER_DID_DECLINE_RATING_POPUP:Ljava/lang/String;

.field private final USER_DID_RATE_WEMO:Ljava/lang/String;

.field private final USER_DISMISS_THE_PLUGIN_POPUP:Ljava/lang/String;

.field private final WIDGET_DEVICE_ID:Ljava/lang/String;

.field private final WIDGET_ID:Ljava/lang/String;

.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "mContext"    # Landroid/content/Context;

    .prologue
    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    const-string v0, "remoteAccess"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->PREFERENCE_CHECK_REMOTE_ACCESS:Ljava/lang/String;

    .line 78
    const-string v0, "homeSSIDs"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->PREFERENCE_HOME_SSIDS:Ljava/lang/String;

    .line 79
    const-string v0, "homeSSID"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->PREFERENCE_HOME_SSID:Ljava/lang/String;

    .line 80
    const-string v0, "arpMacs"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->PREFERENCE_ARP_MACS:Ljava/lang/String;

    .line 81
    const-string v0, "collectEmail"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->PREFERENCE_COLLECT_EMAIL:Ljava/lang/String;

    .line 82
    const-string v0, "collectEmailIT"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->PREFERENCE_COLLECT_EMAIL_IT:Ljava/lang/String;

    .line 83
    const-string v0, "WeMoHeaderHeight"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->PREFERENCE_WEMOHEADERHEIGHT:Ljava/lang/String;

    .line 84
    const-string v0, "appRecoveryFlag"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->PREFERENCE_APP_RECOVERY_FLAG:Ljava/lang/String;

    .line 85
    const-string v0, "appRecoveryCounter"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->PREFERENCE_APP_RECOVERY_COUNTER:Ljava/lang/String;

    .line 86
    const-string v0, "appRecoveryMaxCount"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->PREFERENCE_APP_RECOVERY_MAXCOUNT:Ljava/lang/String;

    .line 87
    const-string v0, "deviceUniqueId"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->PREFERENCE_DEVICE_UNIQUE_ID:Ljava/lang/String;

    .line 89
    const-string v0, "private_key_file"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->PRIVATE_KEY_FILE:Ljava/lang/String;

    .line 90
    const-string v0, "re_union_key"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->PREFERENCE_REUNION_KEY:Ljava/lang/String;

    .line 91
    const-string v0, "private_key"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->PRIVATE_KEY:Ljava/lang/String;

    .line 92
    const-string v0, "home_id"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->HOME_ID:Ljava/lang/String;

    .line 93
    const-string v0, "current_location_home_id"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->CURRENT_LOCATION_HOME_ID:Ljava/lang/String;

    .line 95
    const-string v0, "hybrid_homeNetworkConfiguration"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->SAVE_CONFIGURATION:Ljava/lang/String;

    .line 96
    const-string v0, "hybrid_saveConfigurationStatus"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->SAVE_CONFIGURATION_STATUS:Ljava/lang/String;

    .line 98
    const-string v0, "hybrid_app_db_ver"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->SET_DB_VER:Ljava/lang/String;

    .line 99
    const-string v0, "hybrid_appusedcount"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->APP_USED_COUNT:Ljava/lang/String;

    .line 100
    const-string v0, "hybrid_ruleHomeSSID"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->RULE__HOME_SSID:Ljava/lang/String;

    .line 102
    const-string v0, "hybrid_getStartedNeeded"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->GET_STARTED_NEEDED:Ljava/lang/String;

    .line 103
    const-string v0, "hybrid_remoteAutoEnableNeeded"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->REMOTE_AUTO_ENABLE_NEEDED:Ljava/lang/String;

    .line 104
    const-string v0, "hybrid_isNestAuthCallbackSuccessful"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->IS_NEST_AUTH_CALLBACK_SUCCESSFUL:Ljava/lang/String;

    .line 105
    const-string v0, "hybrid_isNestDeauthCallbackSuccessful"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->IS_NEST_DEAUTH_CALLBACK_SUCCESSFUL:Ljava/lang/String;

    .line 108
    const-string v0, "hybrid_apvalues"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->SAVE_AP_VALUES:Ljava/lang/String;

    .line 109
    const-string v0, "save_bridge_data"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->SAVE_BRIDGE_VALUES:Ljava/lang/String;

    .line 111
    const-string v0, "save_bridge_ip_address"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->SAVE_BRIDGE_IP:Ljava/lang/String;

    .line 113
    const-string v0, "hybrid_cachessid"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->CACHE_SSID:Ljava/lang/String;

    .line 114
    const-string v0, "hybrid_cachearpmac"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->CACHE_ARPMAC:Ljava/lang/String;

    .line 116
    const-string v0, "Currency"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->INSIGHT_CURRENCY:Ljava/lang/String;

    .line 117
    const-string v0, "EnergyPerUnitCost"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->INSIGHT_ENERGY_PER_UNIT_COST:Ljava/lang/String;

    .line 118
    const-string v0, "localNetworkSSID"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->LOCAL_NETWORK_SSID:Ljava/lang/String;

    .line 120
    const-string v0, "PREFERENCE_APP_VERSION_CODE"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->PREFERENCE_APP_VERSION_CODE:Ljava/lang/String;

    .line 121
    const-string v0, "FULL_SUCCESSFUL_DISCOVERY_COUNTER"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->FULL_SUCCESSFUL_DISCOVERY_COUNTER:Ljava/lang/String;

    .line 122
    const-string v0, "USER_DID_RATE_WEMO"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->USER_DID_RATE_WEMO:Ljava/lang/String;

    .line 123
    const-string v0, "USER_DID_DECLINE_RATING_POPUP"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->USER_DID_DECLINE_RATING_POPUP:Ljava/lang/String;

    .line 124
    const-string v0, "current_timestamp"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->CURRENT_TIMESTAMP:Ljava/lang/String;

    .line 126
    const-string v0, "widget_id: "

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->WIDGET_ID:Ljava/lang/String;

    .line 127
    const-string v0, "widget_device_id: "

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->WIDGET_DEVICE_ID:Ljava/lang/String;

    .line 129
    const-string v0, "userEmail"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->PREFERENCE_USER_EMAIL:Ljava/lang/String;

    .line 130
    const-string v0, "emailDeviceType"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->SET_EMAIL_DEVICE_TYPE:Ljava/lang/String;

    .line 132
    const-string v0, "USER_DISMISS_THE_PLUGIN_POPUP"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->USER_DISMISS_THE_PLUGIN_POPUP:Ljava/lang/String;

    .line 135
    iput-object p1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    .line 136
    return-void
.end method

.method public static getCurrentAppVersion(Landroid/content/Context;)I
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 854
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 858
    .local v1, "packageInfo":Landroid/content/pm/PackageInfo;
    iget v2, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    return v2

    .line 855
    .end local v1    # "packageInfo":Landroid/content/pm/PackageInfo;
    :catch_0
    move-exception v0

    .line 856
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static getGCMRegistrationId(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 836
    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 837
    .local v1, "sharedPref":Landroid/content/SharedPreferences;
    const-string v2, "gcm_registration_id"

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3}, Ljava/lang/String;-><init>()V

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 839
    .local v0, "registrationId":Ljava/lang/String;
    const-string v2, "SDK_SharePreference"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "PUSH Notification: Getting GCM registration Id from Shared Preferences: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 840
    return-object v0
.end method

.method public static getGCMRegistrationIdStorageAppVersion(Landroid/content/Context;)I
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 844
    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 845
    .local v1, "sharedPref":Landroid/content/SharedPreferences;
    const-string v2, "gcm_reg_id_app_version"

    const/high16 v3, -0x80000000

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 847
    .local v0, "gcmRegistrationIdStorageAppVersion":I
    const-string v2, "SDK_SharePreference"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "PUSH Notification: App version while storing GCM registration Id: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 848
    return v0
.end method

.method public static getInsightDrawerState(Landroid/content/Context;Ljava/lang/String;)I
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 911
    const-string v6, "belkinprefs"

    const/4 v7, 0x0

    invoke-virtual {p0, v6, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 912
    .local v4, "sharedPrefdbVersion":Landroid/content/SharedPreferences;
    const-string v6, "insightDrawerStateMap"

    const/4 v7, 0x0

    invoke-interface {v4, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 913
    .local v2, "drawerStateMapStr":Ljava/lang/String;
    const/4 v5, 0x0

    .line 915
    .local v5, "state":I
    const/4 v0, 0x0

    .line 916
    .local v0, "drawerStateJO":Lorg/json/JSONObject;
    :try_start_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 917
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 918
    .end local v0    # "drawerStateJO":Lorg/json/JSONObject;
    .local v1, "drawerStateJO":Lorg/json/JSONObject;
    :try_start_1
    const-string v6, "SDK_SharePreference"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Insight Drawer State: Latest Insight Drawer State JSONObject: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 920
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v5

    move-object v0, v1

    .line 928
    .end local v1    # "drawerStateJO":Lorg/json/JSONObject;
    .restart local v0    # "drawerStateJO":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    const-string v6, "SDK_SharePreference"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Insight Drawer State: UDN = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "; state = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 929
    return v5

    .line 925
    :catch_0
    move-exception v3

    .line 926
    .local v3, "e":Lorg/json/JSONException;
    :goto_1
    const-string v6, "SDK_SharePreference"

    const-string v7, "Insight Drawer State: JSON Exception while fetching Insight Drawer State from Shared Pref:  "

    invoke-static {v6, v7, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 925
    .end local v0    # "drawerStateJO":Lorg/json/JSONObject;
    .end local v3    # "e":Lorg/json/JSONException;
    .restart local v1    # "drawerStateJO":Lorg/json/JSONObject;
    :catch_1
    move-exception v3

    move-object v0, v1

    .end local v1    # "drawerStateJO":Lorg/json/JSONObject;
    .restart local v0    # "drawerStateJO":Lorg/json/JSONObject;
    goto :goto_1
.end method

.method public static getRuleDBZipPath(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 942
    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 943
    .local v1, "sharedPrefdbVersion":Landroid/content/SharedPreferences;
    const-string v2, "zip_rule_db_path"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 944
    .local v0, "path":Ljava/lang/String;
    const-string v2, "SDK_SharePreference"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Get Rule DB ZIP file path: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 946
    return-object v0
.end method

.method public static getRuleDBZipVersion(Landroid/content/Context;)I
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 871
    const-string v2, "belkinprefs"

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 872
    .local v0, "sharedPrefdbVersion":Landroid/content/SharedPreferences;
    const-string v2, "zip_rule_db_version"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 873
    .local v1, "version":I
    const-string v2, "SDK_SharePreference"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Get Rule DB ZIP file version: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 875
    return v1
.end method

.method public static getSensorEventsCount(Landroid/content/Context;)I
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 967
    const-string v1, "belkinprefs"

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 968
    .local v0, "sharedPrefdbVersion":Landroid/content/SharedPreferences;
    const-string v1, "sensor_event_counter"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    return v1
.end method

.method public static resetInsightDrawerStates(Landroid/content/Context;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 879
    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 880
    .local v0, "sharedPrefdbVersion":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 881
    .local v1, "shrdPrefEditordbVesrion":Landroid/content/SharedPreferences$Editor;
    const-string v2, "insightDrawerStateMap"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 882
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 884
    const-string v2, "SDK_SharePreference"

    const-string v3, "Insight Drawer State: State for all insights have been RESET."

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 885
    return-void
.end method

.method public static resetSensorEventCounter(Landroid/content/Context;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 960
    const-string v2, "belkinprefs"

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 961
    .local v0, "sharedPrefdbVersion":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 962
    .local v1, "shrdPrefEditordbVesrion":Landroid/content/SharedPreferences$Editor;
    const-string v2, "sensor_event_counter"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 963
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 964
    return-void
.end method

.method public static setGCMRegistrationId(Ljava/lang/String;Landroid/content/Context;)V
    .locals 5
    .param p0, "registrationId"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 822
    const-string v2, "SDK_SharePreference"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "PUSH Notification: Storing GCM registration Id in Shared Preferences: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 824
    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 825
    .local v1, "sharedPref":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 827
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "gcm_registration_id"

    invoke-interface {v0, v2, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 830
    const-string v2, "gcm_reg_id_app_version"

    invoke-static {p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getCurrentAppVersion(Landroid/content/Context;)I

    move-result v3

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 832
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 833
    return-void
.end method

.method public static setInsightDrawerState(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "isOpened"    # I

    .prologue
    .line 888
    const-string v6, "belkinprefs"

    const/4 v7, 0x0

    invoke-virtual {p0, v6, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 889
    .local v4, "sharedPrefdbVersion":Landroid/content/SharedPreferences;
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    .line 891
    .local v5, "shrdPrefEditordbVesrion":Landroid/content/SharedPreferences$Editor;
    const-string v6, "insightDrawerStateMap"

    const/4 v7, 0x0

    invoke-interface {v4, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 893
    .local v2, "drawerStateMapStr":Ljava/lang/String;
    const/4 v0, 0x0

    .line 894
    .local v0, "drawerStateJO":Lorg/json/JSONObject;
    :try_start_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 895
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .end local v0    # "drawerStateJO":Lorg/json/JSONObject;
    .local v1, "drawerStateJO":Lorg/json/JSONObject;
    move-object v0, v1

    .line 900
    .end local v1    # "drawerStateJO":Lorg/json/JSONObject;
    .restart local v0    # "drawerStateJO":Lorg/json/JSONObject;
    :goto_0
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 901
    const-string v6, "SDK_SharePreference"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Insight Drawer State: New Insight Drawer State JSONObject After Update: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 903
    const-string v6, "insightDrawerStateMap"

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 907
    :goto_1
    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 908
    return-void

    .line 897
    :cond_0
    :try_start_1
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .end local v0    # "drawerStateJO":Lorg/json/JSONObject;
    .restart local v1    # "drawerStateJO":Lorg/json/JSONObject;
    move-object v0, v1

    .end local v1    # "drawerStateJO":Lorg/json/JSONObject;
    .restart local v0    # "drawerStateJO":Lorg/json/JSONObject;
    goto :goto_0

    .line 904
    :catch_0
    move-exception v3

    .line 905
    .local v3, "e":Lorg/json/JSONException;
    const-string v6, "SDK_SharePreference"

    const-string v7, "Insight Drawer State: JSON Exception while editing Insight Drawer State in Shared Pref:  "

    invoke-static {v6, v7, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1
.end method

.method public static setRuleDBZipPath(Landroid/content/Context;Ljava/lang/String;)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 933
    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 934
    .local v0, "sharedPrefdbVersion":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 936
    .local v1, "shrdPrefEditordbVesrion":Landroid/content/SharedPreferences$Editor;
    const-string v2, "zip_rule_db_path"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 937
    const-string v2, "SDK_SharePreference"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Rule DB ZIP file path set to: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 938
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 939
    return-void
.end method

.method public static setRuleDBZipVersion(Landroid/content/Context;I)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "version"    # I

    .prologue
    .line 862
    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 863
    .local v0, "sharedPrefdbVersion":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 865
    .local v1, "shrdPrefEditordbVesrion":Landroid/content/SharedPreferences$Editor;
    const-string v2, "zip_rule_db_version"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 866
    const-string v2, "SDK_SharePreference"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Rule DB ZIP file version set to: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 867
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 868
    return-void
.end method

.method public static updateSensorEventCounter(Landroid/content/Context;)V
    .locals 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 950
    const-string v3, "belkinprefs"

    invoke-virtual {p0, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 951
    .local v1, "sharedPrefdbVersion":Landroid/content/SharedPreferences;
    const-string v3, "sensor_event_counter"

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 952
    .local v0, "counter":I
    const-string v3, "SDK_SharePreference"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "updateSensorEventCounter stored value: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 953
    const/4 v0, 0x1

    .line 954
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 955
    .local v2, "shrdPrefEditordbVesrion":Landroid/content/SharedPreferences$Editor;
    const-string v3, "sensor_event_counter"

    invoke-interface {v2, v3, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 956
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 957
    return-void
.end method


# virtual methods
.method public checkConfigurationStatus()Z
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 403
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 404
    .local v0, "pref":Landroid/content/SharedPreferences;
    const-string v1, "hybrid_saveConfigurationStatus"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method public deleteEmailIds(I)Z
    .locals 5
    .param p1, "type"    # I

    .prologue
    .line 344
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 345
    .local v1, "shrdPrefPrivKey":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 346
    .local v0, "shrdPrefEditorPrivKey":Landroid/content/SharedPreferences$Editor;
    if-nez p1, :cond_0

    .line 347
    const-string v2, "collectEmail"

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 351
    :goto_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v2

    return v2

    .line 349
    :cond_0
    const-string v2, "collectEmailIT"

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0
.end method

.method public deleteEmailOptDeviceType()Z
    .locals 5

    .prologue
    .line 355
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 356
    .local v1, "shrdPrefPrivKey":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 357
    .local v0, "shrdPrefEditorPrivKey":Landroid/content/SharedPreferences$Editor;
    const-string v2, "emailDeviceType"

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 358
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v2

    return v2
.end method

.method public getAPValues()Ljava/lang/String;
    .locals 5

    .prologue
    .line 644
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 645
    .local v0, "sharedPrefPrivateKey":Landroid/content/SharedPreferences;
    const-string v2, "hybrid_apvalues"

    const-string v3, "100"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 646
    .local v1, "strSetupCredential":Ljava/lang/String;
    return-object v1
.end method

.method public getARPMacs()Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 219
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "arpMacs"

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    .line 220
    .local v0, "arpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-string v1, "SDK_SharePreference"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getARPMacs() :: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    return-object v0
.end method

.method public getAppHeaderHeight()I
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 815
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 816
    .local v1, "sp":Landroid/content/SharedPreferences;
    const-string v2, "WeMoHeaderHeight"

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 817
    .local v0, "result":I
    return v0
.end method

.method public getAppRecoveryCounter()I
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1006
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "appRecoveryCounter"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 1007
    .local v0, "counter":I
    const-string v1, "SDK_SharePreference"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getAppRecoveryCounter() :: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1008
    return v0
.end method

.method public getAppRecoveryFlag()Z
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1044
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "appRecoveryFlag"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 1045
    .local v0, "consistentFlag":Z
    const-string v1, "SDK_SharePreference"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getAppRecoveryFlag() :: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1046
    return v0
.end method

.method public getAppRecoveryMaxCount()I
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1025
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "appRecoveryMaxCount"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 1026
    .local v0, "maxRetryCount":I
    const-string v1, "SDK_SharePreference"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getAppRecoveryMaxCount() :: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1027
    return v0
.end method

.method public getAppUsedCount()J
    .locals 6

    .prologue
    .line 465
    iget-object v3, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v4, "belkinprefs"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 466
    .local v2, "sharedPrefdbVersion":Landroid/content/SharedPreferences;
    const-string v3, "hybrid_appusedcount"

    const-wide/16 v4, 0x0

    invoke-interface {v2, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 467
    .local v0, "appUsedCount":J
    return-wide v0
.end method

.method public getAppVersionCode()Ljava/lang/String;
    .locals 3

    .prologue
    .line 1062
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "PREFERENCE_APP_VERSION_CODE"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCacheArpMac()Ljava/lang/String;
    .locals 4

    .prologue
    .line 710
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "hybrid_cachearpmac"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 711
    .local v0, "homeArpMac":Ljava/lang/String;
    return-object v0
.end method

.method public getCacheSSID()Ljava/lang/String;
    .locals 4

    .prologue
    .line 727
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "hybrid_cachessid"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 728
    .local v0, "strRuleHomeSSID":Ljava/lang/String;
    return-object v0
.end method

.method public getCurrentLocationHomeId()Ljava/lang/String;
    .locals 5

    .prologue
    .line 292
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "current_location_home_id"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 293
    .local v0, "sharedPrefPrivateKey":Landroid/content/SharedPreferences;
    const-string v2, "current_location_home_id"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 294
    .local v1, "strHomeID":Ljava/lang/String;
    return-object v1
.end method

.method public declared-synchronized getDBVersion()Ljava/lang/String;
    .locals 8

    .prologue
    .line 425
    monitor-enter p0

    :try_start_0
    iget-object v5, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v6, "belkinprefs"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 426
    .local v2, "sharedPrefdbVersion":Landroid/content/SharedPreferences;
    const-string v5, "hybrid_app_db_ver"

    const-string v6, "0"

    invoke-interface {v2, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 427
    .local v3, "strdbVersion":Ljava/lang/String;
    const-string v5, "SDK_SharePreference"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "DB Verion in SharedPref: getDBVersion(): "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 428
    new-instance v4, Lcom/belkin/wemo/rules/util/RuleUtility;

    iget-object v5, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5}, Lcom/belkin/wemo/rules/util/RuleUtility;-><init>(Landroid/content/Context;)V

    .line 429
    .local v4, "util":Lcom/belkin/wemo/rules/util/RuleUtility;
    invoke-virtual {v4}, Lcom/belkin/wemo/rules/util/RuleUtility;->dbExist()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 432
    .local v0, "dbExist":Z
    :try_start_1
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ltz v5, :cond_0

    if-nez v0, :cond_1

    .line 434
    :cond_0
    const-string v5, "SDK_SharePreference"

    const-string v6, "DB version retrieved from Shared Pref is less than default value. Setting DB version to default."

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 435
    const-string v3, "0"

    .line 436
    invoke-virtual {p0, v3}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setDBVersion(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 445
    :cond_1
    :goto_0
    monitor-exit p0

    return-object v3

    .line 438
    :catch_0
    move-exception v1

    .line 440
    .local v1, "e":Ljava/lang/NumberFormatException;
    :try_start_2
    const-string v5, "SDK_SharePreference"

    const-string v6, "NumberFormatException for DB version in Shared Pref: "

    invoke-static {v5, v6, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 441
    const-string v3, "0"

    .line 442
    invoke-virtual {p0, v3}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setDBVersion(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 425
    .end local v0    # "dbExist":Z
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    .end local v2    # "sharedPrefdbVersion":Landroid/content/SharedPreferences;
    .end local v3    # "strdbVersion":Ljava/lang/String;
    .end local v4    # "util":Lcom/belkin/wemo/rules/util/RuleUtility;
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method public getDefaultInsightHomeSettings()[Ljava/lang/String;
    .locals 12

    .prologue
    const/4 v5, 0x2

    .line 760
    new-array v3, v5, [Ljava/lang/String;

    .line 761
    .local v3, "params":[Ljava/lang/String;
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    .line 764
    .local v1, "localeLang":Ljava/lang/String;
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->loadJSONFromAsset()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 765
    .local v2, "obj":Lorg/json/JSONObject;
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 766
    .local v4, "tempArray":Lorg/json/JSONArray;
    const/4 v6, 0x0

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Double;

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    const-wide v10, 0x408f400000000000L    # 1000.0

    mul-double/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v6

    .line 767
    const/4 v6, 0x1

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    aput-object v5, v3, v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 772
    .end local v2    # "obj":Lorg/json/JSONObject;
    .end local v3    # "params":[Ljava/lang/String;
    .end local v4    # "tempArray":Lorg/json/JSONArray;
    :goto_0
    return-object v3

    .line 768
    .restart local v3    # "params":[Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 769
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 770
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getEmailIds()Ljava/lang/String;
    .locals 5

    .prologue
    .line 325
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 326
    .local v1, "sharedPrefPrivateKey":Landroid/content/SharedPreferences;
    const-string v0, ""

    .line 327
    .local v0, "emailIDs":Ljava/lang/String;
    const-string v2, "userEmail"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 328
    return-object v0
.end method

.method public getEmailOptDeviceType()Ljava/lang/String;
    .locals 4

    .prologue
    .line 333
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 334
    .local v0, "sharedPrefPrivateKey":Landroid/content/SharedPreferences;
    const-string v1, "emailDeviceType"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getFaderPref(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "devid"    # Ljava/lang/String;

    .prologue
    .line 618
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 619
    .local v1, "pref":Landroid/content/SharedPreferences;
    const-string v2, ""

    invoke-interface {v1, p1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 620
    .local v0, "deviceid":Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 621
    :cond_0
    const-string v0, "-1"

    .line 622
    :cond_1
    return-object v0
.end method

.method public getFullSuccessfulDiscoveryCounter()I
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1069
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "FULL_SUCCESSFUL_DISCOVERY_COUNTER"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getGetStartedNeeded()Z
    .locals 4

    .prologue
    .line 525
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 526
    .local v0, "pref":Landroid/content/SharedPreferences;
    const-string v1, "hybrid_getStartedNeeded"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method public getHomeId()Ljava/lang/String;
    .locals 5

    .prologue
    .line 279
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "private_key_file"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 280
    .local v0, "sharedPrefPrivateKey":Landroid/content/SharedPreferences;
    const-string v2, "home_id"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 281
    .local v1, "strHomeID":Ljava/lang/String;
    return-object v1
.end method

.method public getHomeSSIDs()Ljava/util/Set;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 187
    const/4 v1, 0x0

    .line 188
    .local v1, "strHomeSSID":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    invoke-virtual {v2, v3, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "homeSSIDs"

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    .line 189
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v2

    if-nez v2, :cond_0

    .line 192
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    invoke-virtual {v2, v3, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "homeSSID"

    const-string v4, ""

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 193
    .local v0, "str":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 196
    new-instance v1, Ljava/util/HashSet;

    .end local v1    # "strHomeSSID":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 197
    .restart local v1    # "strHomeSSID":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 200
    .end local v0    # "str":Ljava/lang/String;
    :cond_0
    return-object v1
.end method

.method public getInsightHomeSettingsParams()[Ljava/lang/String;
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 740
    const/4 v3, 0x2

    new-array v1, v3, [Ljava/lang/String;

    .line 741
    .local v1, "params":[Ljava/lang/String;
    iget-object v3, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v4, "belkinprefs"

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 742
    .local v2, "shrdPrefInsightParams":Landroid/content/SharedPreferences;
    const-string v3, "EnergyPerUnitCost"

    const-string v4, ""

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v5

    .line 743
    const-string v3, "Currency"

    const-string v4, ""

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v6

    .line 744
    aget-object v3, v1, v5

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    aget-object v3, v1, v6

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 745
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getDefaultInsightHomeSettings()[Ljava/lang/String;

    move-result-object v0

    .line 746
    .local v0, "defaultParams":[Ljava/lang/String;
    if-nez v0, :cond_1

    .line 747
    const-string v3, "111"

    aput-object v3, v1, v5

    .line 748
    const-string v3, "1"

    aput-object v3, v1, v6

    .line 754
    :goto_0
    aget-object v3, v1, v6

    aget-object v4, v1, v5

    invoke-virtual {p0, v3, v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->saveInsightHomeSettingsParams(Ljava/lang/String;Ljava/lang/String;)V

    .line 757
    .end local v0    # "defaultParams":[Ljava/lang/String;
    :cond_0
    return-object v1

    .line 751
    .restart local v0    # "defaultParams":[Ljava/lang/String;
    :cond_1
    aget-object v3, v0, v5

    aput-object v3, v1, v5

    .line 752
    aget-object v3, v0, v6

    aput-object v3, v1, v6

    goto :goto_0
.end method

.method public getLocalNetworkSSID()Ljava/lang/String;
    .locals 4

    .prologue
    .line 502
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "localNetworkSSID"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 503
    .local v0, "strLocalNetworkSSID":Ljava/lang/String;
    return-object v0
.end method

.method public getNestAuthCallbackStatus()I
    .locals 4

    .prologue
    .line 572
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 573
    .local v0, "pref":Landroid/content/SharedPreferences;
    const-string v1, "hybrid_isNestAuthCallbackSuccessful"

    const/4 v2, -0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    return v1
.end method

.method public getNestDeauthCallbackStatus()I
    .locals 4

    .prologue
    .line 595
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 596
    .local v0, "pref":Landroid/content/SharedPreferences;
    const-string v1, "hybrid_isNestDeauthCallbackSuccessful"

    const/4 v2, -0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    return v1
.end method

.method public getPrivateKey()Ljava/lang/String;
    .locals 5

    .prologue
    .line 251
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "private_key_file"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 252
    .local v0, "sharedPrefPrivateKey":Landroid/content/SharedPreferences;
    const-string v2, "private_key"

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 254
    .local v1, "strPrivateKey":Ljava/lang/String;
    return-object v1
.end method

.method public getReUnionKey()Ljava/lang/String;
    .locals 5

    .prologue
    .line 264
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "re_union_key"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 265
    .local v0, "sharedPrefReUnionKey":Landroid/content/SharedPreferences;
    const-string v2, "re_union_key"

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 267
    .local v1, "strReUnionKey":Ljava/lang/String;
    return-object v1
.end method

.method public getRemoteAccessSSID()Ljava/lang/String;
    .locals 4

    .prologue
    .line 234
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "homeSSID"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 235
    .local v0, "str":Ljava/lang/String;
    return-object v0
.end method

.method public getRemoteAutoEnableNeeded()Z
    .locals 4

    .prologue
    .line 549
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 550
    .local v0, "pref":Landroid/content/SharedPreferences;
    const-string v1, "hybrid_remoteAutoEnableNeeded"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method public getRuleHomeSSID()Ljava/lang/String;
    .locals 4

    .prologue
    .line 484
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "hybrid_ruleHomeSSID"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 485
    .local v0, "strRuleHomeSSID":Ljava/lang/String;
    return-object v0
.end method

.method public getSetupCredential()Ljava/lang/String;
    .locals 5

    .prologue
    .line 379
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 380
    .local v0, "sharedPrefPrivateKey":Landroid/content/SharedPreferences;
    const-string v2, "hybrid_homeNetworkConfiguration"

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 381
    .local v1, "strSetupCredential":Ljava/lang/String;
    return-object v1
.end method

.method public getStoredLegacyEmails()Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 1179
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    invoke-virtual {v1, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "collectEmail"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1180
    .local v0, "emailID":Ljava/lang/String;
    const-string v0, ""

    .line 1181
    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1182
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    invoke-virtual {v1, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "collectEmailIT"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1184
    :cond_0
    return-object v0
.end method

.method public getTimeStamp()J
    .locals 4

    .prologue
    .line 1108
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "current_timestamp"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getUniqueID()Ljava/lang/String;
    .locals 4

    .prologue
    .line 985
    const/4 v0, 0x0

    .line 986
    .local v0, "uniqueID":Ljava/lang/String;
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    if-eqz v1, :cond_0

    .line 987
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "deviceUniqueId"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 989
    :cond_0
    return-object v0
.end method

.method public getWemoBridgeIp()Ljava/lang/String;
    .locals 5

    .prologue
    .line 692
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 693
    .local v0, "shrdPrefBridgeData":Landroid/content/SharedPreferences;
    const-string v2, "save_bridge_ip_address"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 694
    .local v1, "strSetupBridge":Ljava/lang/String;
    return-object v1
.end method

.method public getWidgetData(I)Ljava/lang/String;
    .locals 3
    .param p1, "widgetId"    # I

    .prologue
    .line 1135
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "widget_id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWidgetIdSet(Ljava/lang/String;)Ljava/util/Set;
    .locals 3
    .param p1, "deviceId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1165
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "widget_device_id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getbridgeValues()Ljava/lang/String;
    .locals 5

    .prologue
    .line 668
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 669
    .local v0, "shrdPrefBridgeData":Landroid/content/SharedPreferences;
    const-string v2, "save_bridge_data"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 670
    .local v1, "strSetupBridge":Ljava/lang/String;
    return-object v1
.end method

.method public isRemoteEnabled()Z
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 145
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 146
    .local v0, "pref":Landroid/content/SharedPreferences;
    const-string v1, "remoteAccess"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method public isUserDidDeclineRatingsPopup()Z
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1097
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "USER_DID_DECLINE_RATING_POPUP"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isUserDidRateWeMo()Z
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1083
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "USER_DID_RATE_WEMO"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isUserDismissPluginPopup()Z
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1188
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "USER_DISMISS_THE_PLUGIN_POPUP"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public loadJSONFromAsset()Ljava/lang/String;
    .locals 8

    .prologue
    .line 775
    const/4 v3, 0x0

    .line 777
    .local v3, "json":Ljava/lang/String;
    :try_start_0
    iget-object v6, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "DefaultCost.json"

    invoke-virtual {v6, v7}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 778
    .local v2, "inptStream":Ljava/io/InputStream;
    invoke-virtual {v2}, Ljava/io/InputStream;->available()I

    move-result v5

    .line 779
    .local v5, "size":I
    new-array v0, v5, [B

    .line 780
    .local v0, "buffer":[B
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    .line 781
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 782
    new-instance v4, Ljava/lang/String;

    const-string v6, "UTF-8"

    invoke-direct {v4, v0, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v3    # "json":Ljava/lang/String;
    .local v4, "json":Ljava/lang/String;
    move-object v3, v4

    .line 787
    .end local v0    # "buffer":[B
    .end local v2    # "inptStream":Ljava/io/InputStream;
    .end local v4    # "json":Ljava/lang/String;
    .end local v5    # "size":I
    .restart local v3    # "json":Ljava/lang/String;
    :goto_0
    return-object v4

    .line 783
    :catch_0
    move-exception v1

    .line 784
    .local v1, "ex":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 785
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public removeWidgetData(I)V
    .locals 4
    .param p1, "widgetId"    # I

    .prologue
    .line 1143
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1144
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "widget_id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1145
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1146
    return-void
.end method

.method public removeWidgetIdSet(Ljava/lang/String;)V
    .locals 4
    .param p1, "deviceId"    # Ljava/lang/String;

    .prologue
    .line 1173
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1174
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "widget_device_id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1175
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1176
    return-void
.end method

.method public saveAPValues(Ljava/lang/String;)V
    .locals 5
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 631
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 632
    .local v0, "shrdPrefAPData":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 633
    .local v1, "shrdPrefEditorAPData":Landroid/content/SharedPreferences$Editor;
    const-string v2, "hybrid_apvalues"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 634
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 635
    return-void
.end method

.method public saveBridgeSetup(Ljava/lang/String;)V
    .locals 5
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 655
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 656
    .local v0, "shrdPrefBridgeData":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 657
    .local v1, "shrdPrefEditorBridgedata":Landroid/content/SharedPreferences$Editor;
    const-string v2, "save_bridge_data"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 658
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 659
    return-void
.end method

.method public saveConfigurationStatus(Z)V
    .locals 5
    .param p1, "status"    # Z

    .prologue
    .line 390
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 391
    .local v0, "shrdPrefConfigStatus":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 392
    .local v1, "shrdPrefEditorConfigStatus":Landroid/content/SharedPreferences$Editor;
    const-string v2, "hybrid_saveConfigurationStatus"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 393
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 394
    return-void
.end method

.method public saveInsightHomeSettingsParams(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "currency"    # Ljava/lang/String;
    .param p2, "energyPerUnitCost"    # Ljava/lang/String;

    .prologue
    .line 733
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 734
    .local v1, "shrdPrefInsightParams":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 735
    .local v0, "shrdPrefEditorInsightParams":Landroid/content/SharedPreferences$Editor;
    const-string v2, "EnergyPerUnitCost"

    invoke-interface {v0, v2, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 736
    const-string v2, "Currency"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 737
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 738
    return-void
.end method

.method public saveSetupCredential(Ljava/lang/String;)V
    .locals 5
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 367
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 368
    .local v1, "shrdPrefSetupCredential":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 369
    .local v0, "shrdPrefEditorSetupCredential":Landroid/content/SharedPreferences$Editor;
    const-string v2, "hybrid_homeNetworkConfiguration"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 370
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 371
    return-void
.end method

.method public saveWemoBridgeIpAdress(Ljava/lang/String;)V
    .locals 5
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 679
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 680
    .local v0, "shrdPrefBridgeData":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 681
    .local v1, "shrdPrefEditorBridgedata":Landroid/content/SharedPreferences$Editor;
    const-string v2, "save_bridge_ip_address"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 682
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 683
    return-void
.end method

.method public set(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p1, "preferenceLib"    # Ljava/lang/String;
    .param p2, "preferenceName"    # Ljava/lang/String;
    .param p3, "preferenceValue"    # Ljava/lang/String;

    .prologue
    .line 798
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p2, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    return v0
.end method

.method public setARPMacs(Ljava/util/Set;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 229
    .local p1, "arpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-string v0, "SDK_SharePreference"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setARPMacs() :: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 230
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "arpMacs"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    return v0
.end method

.method public setAppHeaderHeight(I)Z
    .locals 5
    .param p1, "headerHeight"    # I

    .prologue
    .line 805
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 806
    .local v1, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "WeMoHeaderHeight"

    invoke-interface {v2, v3, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    .line 807
    .local v0, "result":Z
    return v0
.end method

.method public setAppRecoveryCounter(I)V
    .locals 3
    .param p1, "counter"    # I

    .prologue
    .line 997
    const-string v0, "SDK_SharePreference"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setAppRecoveryCounter() :: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 998
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "appRecoveryCounter"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 999
    return-void
.end method

.method public setAppRecoveryFlag(Z)V
    .locals 3
    .param p1, "consistentFlag"    # Z

    .prologue
    .line 1035
    const-string v0, "SDK_SharePreference"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setAppRecoveryFlag() :: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1036
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "appRecoveryFlag"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1037
    return-void
.end method

.method public setAppRecoveryMaxCount(I)V
    .locals 3
    .param p1, "maxRetryCount"    # I

    .prologue
    .line 1016
    const-string v0, "SDK_SharePreference"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setAppRecoveryMaxCount() :: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1017
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "appRecoveryMaxCount"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1018
    return-void
.end method

.method public setAppUsedCount(J)V
    .locals 5
    .param p1, "data"    # J

    .prologue
    .line 455
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 456
    .local v0, "sharedPrefdbVersion":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 457
    .local v1, "shrdPrefEditordbVesrion":Landroid/content/SharedPreferences$Editor;
    const-string v2, "hybrid_appusedcount"

    invoke-interface {v1, v2, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 458
    return-void
.end method

.method public setAppVersionCode(Ljava/lang/String;)V
    .locals 3
    .param p1, "appVersionCode"    # Ljava/lang/String;

    .prologue
    .line 1054
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "PREFERENCE_APP_VERSION_CODE"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1055
    return-void
.end method

.method public setCacheArpMac(Ljava/lang/String;)Z
    .locals 3
    .param p1, "cacheArpMac"    # Ljava/lang/String;

    .prologue
    .line 719
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "hybrid_cachearpmac"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    return v0
.end method

.method public setCacheSSID(Ljava/lang/String;)Z
    .locals 3
    .param p1, "cacheSSIDSSID"    # Ljava/lang/String;

    .prologue
    .line 702
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "hybrid_cachessid"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    return v0
.end method

.method public setCurrentLocationHomeId(Ljava/lang/String;)V
    .locals 5
    .param p1, "homeId"    # Ljava/lang/String;

    .prologue
    .line 284
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "current_location_home_id"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 286
    .local v1, "shrdPrefPrivKey":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 287
    .local v0, "shrdPrefEditorPrivKey":Landroid/content/SharedPreferences$Editor;
    const-string v2, "current_location_home_id"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 288
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 289
    return-void
.end method

.method public setCurrentTimeStamp(J)V
    .locals 3
    .param p1, "currentTimeStamp"    # J

    .prologue
    .line 1115
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "current_timestamp"

    invoke-interface {v0, v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1116
    return-void
.end method

.method public declared-synchronized setDBVersion(Ljava/lang/String;)V
    .locals 5
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 413
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 414
    .local v0, "sharedPrefdbVersion":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 415
    .local v1, "shrdPrefEditordbVesrion":Landroid/content/SharedPreferences$Editor;
    const-string v2, "hybrid_app_db_ver"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 416
    const-string v2, "SDK_SharePreference"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "DB Verion in SharedPref: setDBVersion(): "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 417
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 418
    monitor-exit p0

    return-void

    .line 413
    .end local v0    # "sharedPrefdbVersion":Landroid/content/SharedPreferences;
    .end local v1    # "shrdPrefEditordbVesrion":Landroid/content/SharedPreferences$Editor;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public setFaderPref(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "devid"    # Ljava/lang/String;
    .param p2, "timevalue"    # Ljava/lang/String;

    .prologue
    .line 604
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 605
    .local v0, "shrdPrefConfigStatus":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 606
    .local v1, "shrdPrefEditorConfigStatus":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 607
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 608
    return-void
.end method

.method public setFullSuccessfulDiscoveryCounter(I)V
    .locals 3
    .param p1, "fullSuccessfulDiscoveryCounter"    # I

    .prologue
    .line 1076
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "FULL_SUCCESSFUL_DISCOVERY_COUNTER"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1077
    return-void
.end method

.method public setGetStartedNeeded(Z)V
    .locals 5
    .param p1, "status"    # Z

    .prologue
    .line 512
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 513
    .local v0, "shrdPrefConfigStatus":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 514
    .local v1, "shrdPrefEditorConfigStatus":Landroid/content/SharedPreferences$Editor;
    const-string v2, "hybrid_getStartedNeeded"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 515
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 516
    return-void
.end method

.method public setHomeSSIDs(Ljava/util/Set;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 211
    .local p1, "wifiSSIDs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "homeSSIDs"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    return v0
.end method

.method public setLocalNetworkSSID(Ljava/lang/String;)Z
    .locals 3
    .param p1, "localNetworkSSID"    # Ljava/lang/String;

    .prologue
    .line 494
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "localNetworkSSID"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    return v0
.end method

.method public setNestAuthCallbackStatus(I)V
    .locals 5
    .param p1, "status"    # I

    .prologue
    .line 559
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 560
    .local v0, "shrdPrefConfigStatus":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 561
    .local v1, "shrdPrefEditorConfigStatus":Landroid/content/SharedPreferences$Editor;
    const-string v2, "hybrid_isNestAuthCallbackSuccessful"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 562
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 563
    return-void
.end method

.method public setNestDeauthCallbackStatus(I)V
    .locals 5
    .param p1, "status"    # I

    .prologue
    .line 582
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 583
    .local v0, "shrdPrefConfigStatus":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 584
    .local v1, "shrdPrefEditorConfigStatus":Landroid/content/SharedPreferences$Editor;
    const-string v2, "hybrid_isNestDeauthCallbackSuccessful"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 585
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 586
    return-void
.end method

.method public setRemoteAccessSSID(Ljava/lang/String;)Z
    .locals 3
    .param p1, "wifiSSID"    # Ljava/lang/String;

    .prologue
    .line 239
    const-string v0, "SDK_SharePreference"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setRemoteAccessSSID() :: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "homeSSID"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    return v0
.end method

.method public setRemoteAutoEnableNeeded(Z)V
    .locals 5
    .param p1, "status"    # Z

    .prologue
    .line 536
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 537
    .local v0, "shrdPrefConfigStatus":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 538
    .local v1, "shrdPrefEditorConfigStatus":Landroid/content/SharedPreferences$Editor;
    const-string v2, "hybrid_remoteAutoEnableNeeded"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 539
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 540
    return-void
.end method

.method public setRemoteEnabled(Z)Z
    .locals 3
    .param p1, "value"    # Z

    .prologue
    .line 156
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "remoteAccess"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    return v0
.end method

.method public setRuleHomeSSID(Ljava/lang/String;)Z
    .locals 3
    .param p1, "ruleHomeSSID"    # Ljava/lang/String;

    .prologue
    .line 476
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "hybrid_ruleHomeSSID"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    return v0
.end method

.method public setUniqueID(Ljava/lang/String;)V
    .locals 3
    .param p1, "uniqueID"    # Ljava/lang/String;

    .prologue
    .line 976
    const-string v0, "SDK_SharePreference"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setUniqueID() :: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 977
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "deviceUniqueId"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 978
    return-void
.end method

.method public setUserDidDeclineRatingsPopup(Z)V
    .locals 3
    .param p1, "userDidDeclineRatingsPopup"    # Z

    .prologue
    .line 1104
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "USER_DID_DECLINE_RATING_POPUP"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1105
    return-void
.end method

.method public setUserDidRateWeMo(Z)V
    .locals 3
    .param p1, "userDidRateWeMo"    # Z

    .prologue
    .line 1090
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "USER_DID_RATE_WEMO"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1091
    return-void
.end method

.method public setUserDismissPluginPopup(Z)V
    .locals 3
    .param p1, "userDismissThePopup"    # Z

    .prologue
    .line 1195
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v1, "belkinprefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "USER_DISMISS_THE_PLUGIN_POPUP"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1196
    return-void
.end method

.method public storeEmailIds(Ljava/lang/String;)Z
    .locals 5
    .param p1, "emailId"    # Ljava/lang/String;

    .prologue
    .line 305
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 306
    .local v1, "shrdPrefPrivKey":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 307
    .local v0, "shrdPrefEditorPrivKey":Landroid/content/SharedPreferences$Editor;
    const-string v2, "userEmail"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 308
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v2

    return v2
.end method

.method public storeEmailOptDeviceType(Ljava/lang/String;)Z
    .locals 5
    .param p1, "emailDeviceType"    # Ljava/lang/String;

    .prologue
    .line 312
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "belkinprefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 313
    .local v1, "shrdPrefPrivKey":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 314
    .local v0, "shrdPrefEditorPrivKey":Landroid/content/SharedPreferences$Editor;
    const-string v2, "emailDeviceType"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 315
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v2

    return v2
.end method

.method public storeHomeId(Ljava/lang/String;)V
    .locals 5
    .param p1, "homeId"    # Ljava/lang/String;

    .prologue
    .line 271
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "private_key_file"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 273
    .local v1, "shrdPrefPrivKey":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 274
    .local v0, "shrdPrefEditorPrivKey":Landroid/content/SharedPreferences$Editor;
    const-string v2, "home_id"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 275
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 276
    return-void
.end method

.method public storePrivateKey(Ljava/lang/String;)V
    .locals 5
    .param p1, "privateKey"    # Ljava/lang/String;

    .prologue
    .line 244
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "private_key_file"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 245
    .local v1, "shrdPrefPrivKey":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 246
    .local v0, "shrdPrefEditorPrivKey":Landroid/content/SharedPreferences$Editor;
    const-string v2, "private_key"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 247
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 248
    return-void
.end method

.method public storeReUnionKey(Ljava/lang/String;)V
    .locals 5
    .param p1, "reUnionKey"    # Ljava/lang/String;

    .prologue
    .line 257
    iget-object v2, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v3, "re_union_key"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 258
    .local v1, "shrdPrefReUnionKey":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 259
    .local v0, "shrdPrefEditorReUnionKey":Landroid/content/SharedPreferences$Editor;
    const-string v2, "re_union_key"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 260
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 261
    return-void
.end method

.method public storeWidgetData(ILjava/lang/String;)V
    .locals 4
    .param p1, "widgetId"    # I
    .param p2, "widgetData"    # Ljava/lang/String;

    .prologue
    .line 1124
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1125
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "widget_id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1126
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1127
    return-void
.end method

.method public storeWidgetIdSet(Ljava/lang/String;Ljava/util/Set;)V
    .locals 4
    .param p1, "deviceId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1154
    .local p2, "widgetIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/belkin/wemo/cache/utils/SharePreferences;->mContext:Landroid/content/Context;

    const-string v2, "belkinprefs"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1155
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "widget_device_id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    .line 1156
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1157
    return-void
.end method
