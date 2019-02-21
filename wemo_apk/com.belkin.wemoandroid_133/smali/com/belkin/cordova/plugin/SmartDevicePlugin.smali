.class public Lcom/belkin/cordova/plugin/SmartDevicePlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "SmartDevicePlugin.java"

# interfaces
.implements Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;
.implements Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;
.implements Lcom/belkin/controller/SensorEventChangeListener;
.implements Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/cordova/plugin/SmartDevicePlugin$StoreDeviceRulesCallback;,
        Lcom/belkin/cordova/plugin/SmartDevicePlugin$FetchDevicesRulesCallback;
    }
.end annotation


# static fields
.field public static final ACTION_ADD_TO_GROUP:Ljava/lang/String; = "addToGroup"

.field public static final ACTION_ARE_NEST_FIRMWARE_SUPPORTED:Ljava/lang/String; = "areNestFirmwareSupported"

.field public static final ACTION_CALIBRATE:Ljava/lang/String; = "calibrate"

.field public static final ACTION_CALL_EMERGENCY_CONTACT:Ljava/lang/String; = "callEmeregencyContact"

.field public static final ACTION_CHECK_BOHNJOUR:Ljava/lang/String; = "checkBohnjour"

.field public static final ACTION_CHOOSE_PHOTO:Ljava/lang/String; = "choosePhoto"

.field public static final ACTION_COLLECT_EMAILID_API:Ljava/lang/String; = "collectEmailID"

.field public static final ACTION_CONFIGURE_DIMMING_RANGE:Ljava/lang/String; = "configureDimmingRange"

.field public static final ACTION_CONFIGURE_HUSHMODE:Ljava/lang/String; = "configureHushMode"

.field public static final ACTION_DEAUTHORIZE_NEST:Ljava/lang/String; = "deauthorizeNest"

.field public static final ACTION_DELETE_DEVICE_PRESET:Ljava/lang/String; = "deleteDevicePreset"

.field public static final ACTION_FIND_BULB:Ljava/lang/String; = "findBulb"

.field public static final ACTION_GET_BLOB_STORAGE:Ljava/lang/String; = "getBlobStorageData"

.field public static final ACTION_GET_DEVICE:Ljava/lang/String; = "getDevice"

.field public static final ACTION_GET_DEVICES:Ljava/lang/String; = "getDevices"

.field public static final ACTION_GET_DEVICES_INFO:Ljava/lang/String; = "getDevicesInfo"

.field public static final ACTION_GET_DEVICE_PRESET:Ljava/lang/String; = "getDevicePreset"

.field public static final ACTION_GET_EVENTS_FROM_DB:Ljava/lang/String; = "getEventHistoryFromDB"

.field public static final ACTION_GET_EVENT_HISTORY:Ljava/lang/String; = "getEventHistory"

.field public static final ACTION_GET_NEST_DEVICES:Ljava/lang/String; = "getNestDevices"

.field public static final ACTION_GET_NIGHT_MODE_CONFIGURATION:Ljava/lang/String; = "getNightModeConfiguration"

.field public static final ACTION_GET_SENSOR_NOTIFICATIONS_COUNT:Ljava/lang/String; = "getSensorNotificationsCount"

.field public static final ACTION_GET_SUBDEVICES_COUNT:Ljava/lang/String; = "getSubDevicesCount"

.field public static final ACTION_HIDE_DEVICE:Ljava/lang/String; = "hideDevice"

.field public static final ACTION_HIDE_GROUP:Ljava/lang/String; = "hideGroup"

.field public static final ACTION_NEST_TOKEN_EXIST_FOR_GIVEN_HOME_ID:Ljava/lang/String; = "nestTokenExistForGivenHomeId"

.field public static final ACTION_REFRESH_DEVICE_LIST:Ljava/lang/String; = "refreshDevices"

.field public static final ACTION_REFRESH_LONG_PRESS_RULE_DETAILS:Ljava/lang/String; = "refreshLongPressRuleDetails"

.field public static final ACTION_REMOVE_GROUP:Ljava/lang/String; = "removeFromGroup"

.field public static final ACTION_RESET_DEVICE:Ljava/lang/String; = "resetDevice"

.field public static final ACTION_RESET_HOME_NETWORK:Ljava/lang/String; = "onReset"

.field public static final ACTION_SET_BLOB_STORAGE:Ljava/lang/String; = "setBlobStorageData"

.field public static final ACTION_SET_BULB_TYPE:Ljava/lang/String; = "setBulbType"

.field public static final ACTION_SET_DEVICE_PRESET:Ljava/lang/String; = "setDevicePreset"

.field public static final ACTION_SET_DEVICE_PROPERTIES:Ljava/lang/String; = "setDeviceProperties"

.field public static final ACTION_SET_DEVICE_STATE:Ljava/lang/String; = "setDeviceState"

.field public static final ACTION_SET_GROUP_STATE:Ljava/lang/String; = "setGroupState"

.field public static final ACTION_SET_INSIGHT_DRAWER_STATE:Ljava/lang/String; = "setInsightDrawerState"

.field public static final ACTION_SET_NIGHT_MODE_CONFIGURATION:Ljava/lang/String; = "setNightModeConfiguration"

.field public static final ACTION_TAKE_PICTURE:Ljava/lang/String; = "takePicture"

.field public static final ACTION_WEMO_APP_RECOVERY:Ljava/lang/String; = "appRecovery"

.field public static final TAG:Ljava/lang/String; = "SmartDevicePlugin"

.field public static rMRulesDBManager:Lcom/belkin/rules/db/RMRulesDBManager;

.field public static sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# instance fields
.field private conMan:Landroid/net/ConnectivityManager;

.field private mAppController:Lcom/belkin/controller/AppController;

.field private mCallbackContext:Lorg/apache/cordova/CallbackContext;

.field private mContext:Landroid/content/Context;

.field private mDeviceCallbacks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/cordova/CallbackContext;",
            ">;"
        }
    .end annotation
.end field

.field private mDeviceListController:Lcom/belkin/controller/DeviceListController;

.field private mSDKNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

.field private mSensorStateChange:Lcom/belkin/controller/SensorEventChangeController;

.field private mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

.field weeklyRecordsHashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 149
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 126
    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    .line 130
    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 134
    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mSensorStateChange:Lcom/belkin/controller/SensorEventChangeController;

    .line 135
    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->conMan:Landroid/net/ConnectivityManager;

    .line 137
    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    .line 151
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 139
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 126
    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    .line 130
    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 134
    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mSensorStateChange:Lcom/belkin/controller/SensorEventChangeController;

    .line 135
    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->conMan:Landroid/net/ConnectivityManager;

    .line 137
    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    .line 140
    iput-object p1, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    .line 141
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 142
    new-instance v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mSDKNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 143
    invoke-static {p1}, Lcom/belkin/controller/DeviceListController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/DeviceListController;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    .line 146
    invoke-static {}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->getInstance()Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->addRemoteAccessListener(Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;)Z

    .line 148
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/cordova/plugin/SmartDevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/cordova/plugin/SmartDevicePlugin;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method private addDeviceCallbackContext(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 3
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 869
    const-string v0, "SmartDevicePlugin"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "addDeviceCallbackContext: udn: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "context: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 870
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceCallbacks:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 871
    return-void
.end method

.method private checkCacheClearance()Z
    .locals 9

    .prologue
    .line 928
    const/4 v4, 0x0

    .line 930
    .local v4, "isCacheCleared":Z
    :try_start_0
    iget-object v6, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mSDKNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v2

    .line 931
    .local v2, "currentSSID":Ljava/lang/String;
    iget-object v6, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getCacheSSID()Ljava/lang/String;

    move-result-object v0

    .line 932
    .local v0, "cachedSSID":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_1

    .line 933
    :cond_0
    const/4 v0, 0x0

    .line 934
    :cond_1
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v5

    .line 935
    .local v5, "prevIsLocal":Z
    sget-object v6, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateLocalMode()V

    .line 936
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v1

    .line 937
    .local v1, "currentIsLocal":Z
    const-string v6, "SmartDevicePlugin"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "checkCacheClearance cachedSSID: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " currentSSID: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " prevIsLocal: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " currentIsLocal: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " isRemoteEnabled: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 939
    if-eqz v0, :cond_2

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    if-eqz v1, :cond_2

    .line 941
    iget-object v6, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v6, v2}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setCacheSSID(Ljava/lang/String;)Z

    .line 942
    invoke-direct {p0}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->clearCache()V

    .line 943
    const/4 v4, 0x1

    .line 945
    :cond_2
    sget-object v6, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v6, p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->onNetworkChange(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V

    .line 946
    if-nez v0, :cond_3

    .line 948
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 949
    iget-object v6, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v6, v2}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setCacheSSID(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 955
    .end local v0    # "cachedSSID":Ljava/lang/String;
    .end local v1    # "currentIsLocal":Z
    .end local v2    # "currentSSID":Ljava/lang/String;
    .end local v5    # "prevIsLocal":Z
    :cond_3
    :goto_0
    return v4

    .line 951
    :catch_0
    move-exception v3

    .line 952
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private clearCache()V
    .locals 4

    .prologue
    .line 963
    sget-object v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->resetHomeNetwork()V

    .line 964
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const-string v1, "BelkinWeMoApp"

    const-string v2, "deviceCache"

    const-string v3, ""

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/utils/SharePreferences;->set(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 965
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const-string v1, "BelkinWeMoApp"

    const-string v2, "ledDeviceCache"

    const-string v3, ""

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/utils/SharePreferences;->set(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 966
    return-void
.end method

.method private enableRemoteAccess()V
    .locals 4

    .prologue
    .line 902
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getRemoteAutoEnableNeeded()Z

    move-result v0

    if-nez v0, :cond_0

    .line 903
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    new-instance v1, Lcom/belkin/cordova/plugin/SmartDevicePlugin$1;

    invoke-direct {v1, p0}, Lcom/belkin/cordova/plugin/SmartDevicePlugin$1;-><init>(Lcom/belkin/cordova/plugin/SmartDevicePlugin;)V

    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 918
    :cond_0
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 36
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "inParamArray"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 188
    sget-object v32, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-eqz v32, :cond_1

    .line 189
    sget-object v32, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->addNotificationListener(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V

    .line 194
    :goto_0
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "action: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    const-string v32, "getDevices"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_3

    .line 198
    sget-object v32, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const/16 v33, 0x0

    invoke-virtual/range {v32 .. v33}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setDevicePairingStatus(Z)V

    .line 199
    sget-object v32, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual/range {v32 .. v32}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->resetInsightDrawerState()V

    .line 200
    sget-object v32, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual/range {v32 .. v32}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->restartCloudPeriodicUpdate()V

    .line 202
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Lcom/belkin/controller/DeviceListController;->getDevices()Lorg/json/JSONArray;

    move-result-object v12

    .line 204
    .local v12, "deviceList":Lorg/json/JSONArray;
    if-eqz v12, :cond_2

    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v32

    if-lez v32, :cond_2

    .line 206
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v32, v0

    sget-object v33, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/RateMe;->handleRateMePopup(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    .line 207
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "ACTION_GET_DEVICES : deviceList "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual {v12}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    .line 556
    .end local v12    # "deviceList":Lorg/json/JSONArray;
    :cond_0
    :goto_1
    const/16 v32, 0x1

    return v32

    .line 191
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v32

    sput-object v32, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 192
    sget-object v32, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->addNotificationListener(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V

    goto/16 :goto_0

    .line 210
    .restart local v12    # "deviceList":Lorg/json/JSONArray;
    :cond_2
    const-string v32, "error fetching device list"

    move-object/from16 v0, p3

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_1

    .line 214
    .end local v12    # "deviceList":Lorg/json/JSONArray;
    :cond_3
    const-string v32, "getSensorNotificationsCount"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_4

    .line 215
    const-string v32, "SmartDevicePlugin"

    const-string v33, "ACTION_GET_SENSOR_NOTIFICATIONS_COUNT::"

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v32, v0

    invoke-static/range {v32 .. v32}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getSensorEventsCount(Landroid/content/Context;)I

    move-result v32

    move-object/from16 v0, p3

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(I)V

    goto :goto_1

    .line 217
    :cond_4
    const-string v32, "callEmeregencyContact"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_6

    .line 219
    const/16 v32, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v32

    const-string v33, "Number"

    invoke-virtual/range {v32 .. v33}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 220
    .local v16, "emergencyNumber":Ljava/lang/String;
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Emergency Params: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mAppController:Lcom/belkin/controller/AppController;

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    move-object/from16 v0, v32

    move-object/from16 v1, v16

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lcom/belkin/controller/AppController;->callEmergencyContact(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v29

    .line 223
    .local v29, "result":Z
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Result for callEmergencyContact :: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    if-eqz v29, :cond_5

    .line 225
    new-instance v8, Lorg/apache/cordova/PluginResult;

    sget-object v32, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    new-instance v33, Lorg/json/JSONObject;

    invoke-direct/range {v33 .. v33}, Lorg/json/JSONObject;-><init>()V

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    invoke-direct {v8, v0, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 226
    .local v8, "dataresult":Lorg/apache/cordova/PluginResult;
    const/16 v32, 0x0

    move/from16 v0, v32

    invoke-virtual {v8, v0}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 227
    move-object/from16 v0, p3

    invoke-virtual {v0, v8}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_1

    .line 229
    .end local v8    # "dataresult":Lorg/apache/cordova/PluginResult;
    :cond_5
    new-instance v8, Lorg/apache/cordova/PluginResult;

    sget-object v32, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v32

    invoke-direct {v8, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 230
    .restart local v8    # "dataresult":Lorg/apache/cordova/PluginResult;
    const/16 v32, 0x0

    move/from16 v0, v32

    invoke-virtual {v8, v0}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 231
    move-object/from16 v0, p3

    invoke-virtual {v0, v8}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_1

    .line 234
    .end local v8    # "dataresult":Lorg/apache/cordova/PluginResult;
    .end local v16    # "emergencyNumber":Ljava/lang/String;
    .end local v29    # "result":Z
    :cond_6
    const-string v32, "getDevice"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_a

    .line 236
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Params: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    if-eqz p2, :cond_9

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v32

    if-lez v32, :cond_9

    .line 238
    const/16 v32, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v32

    const-string v33, "udn"

    invoke-virtual/range {v32 .. v33}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    .line 240
    .local v30, "udn":Ljava/lang/String;
    if-eqz v30, :cond_8

    invoke-virtual/range {v30 .. v30}, Ljava/lang/String;->isEmpty()Z

    move-result v32

    if-nez v32, :cond_8

    .line 241
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/belkin/controller/DeviceListController;->getDevice(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    .line 242
    .local v13, "deviceObj":Lorg/json/JSONObject;
    if-eqz v13, :cond_7

    .line 243
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "ACTION_GET_DEVICE : device Object "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    goto/16 :goto_1

    .line 249
    :cond_7
    const-string v32, "error fetching device object"

    move-object/from16 v0, p3

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 252
    .end local v13    # "deviceObj":Lorg/json/JSONObject;
    :cond_8
    const-string v32, "udn is null or empty"

    move-object/from16 v0, p3

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 255
    .end local v30    # "udn":Ljava/lang/String;
    :cond_9
    const-string v32, "inParamArray is null or empty"

    move-object/from16 v0, p3

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 257
    :cond_a
    const-string v32, "setDeviceState"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_b

    .line 264
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Params: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    move-object/from16 v7, p3

    .line 268
    .local v7, "context":Lorg/apache/cordova/CallbackContext;
    :try_start_0
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v32

    const/16 v33, 0x2

    move/from16 v0, v32

    move/from16 v1, v33

    if-lt v0, v1, :cond_0

    .line 269
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v33

    const/16 v34, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lcom/belkin/controller/DeviceListController;->setDeviceState(Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    .line 271
    :catch_0
    move-exception v15

    .line 272
    .local v15, "e":Lorg/json/JSONException;
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Exception in setting the state of the device: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 273
    const-string v32, "Exception in setting the state of the device"

    move-object/from16 v0, v32

    invoke-virtual {v7, v0}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 276
    .end local v7    # "context":Lorg/apache/cordova/CallbackContext;
    .end local v15    # "e":Lorg/json/JSONException;
    :cond_b
    const-string v32, "setGroupState"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_c

    .line 278
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Params: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    move-object/from16 v7, p3

    .line 282
    .restart local v7    # "context":Lorg/apache/cordova/CallbackContext;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v33

    const/16 v34, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lcom/belkin/controller/DeviceListController;->setGroupState(Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_1

    .line 283
    :catch_1
    move-exception v15

    .line 284
    .restart local v15    # "e":Lorg/json/JSONException;
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Exception in setting the state of the device: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 285
    const-string v32, "Exception in setting the state of the device"

    move-object/from16 v0, v32

    invoke-virtual {v7, v0}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 288
    .end local v7    # "context":Lorg/apache/cordova/CallbackContext;
    .end local v15    # "e":Lorg/json/JSONException;
    :cond_c
    const-string v32, "setDeviceProperties"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_f

    .line 289
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Calling action:"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, "; inParamArray: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    if-eqz p2, :cond_e

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v32

    const/16 v33, 0x1

    move/from16 v0, v32

    move/from16 v1, v33

    if-le v0, v1, :cond_e

    .line 291
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v33

    const/16 v34, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lcom/belkin/controller/DeviceListController;->setDeviceProperties(Lorg/json/JSONObject;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v27

    .line 292
    .local v27, "oDeviceListResponse":Lorg/json/JSONObject;
    const-string v32, "error"

    move-object/from16 v0, v27

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v32

    if-eqz v32, :cond_d

    .line 293
    const-string v32, "error"

    move-object/from16 v0, v27

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 294
    .local v17, "error":Ljava/lang/String;
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "setDeviceProperties failed due to: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    new-instance v32, Lorg/apache/cordova/PluginResult;

    sget-object v33, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p3

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_1

    .line 297
    .end local v17    # "error":Ljava/lang/String;
    :cond_d
    new-instance v32, Lorg/apache/cordova/PluginResult;

    sget-object v33, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct/range {v32 .. v33}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p3

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_1

    .line 300
    .end local v27    # "oDeviceListResponse":Lorg/json/JSONObject;
    :cond_e
    const-string v32, "SmartDevicePlugin"

    const-string v33, "setDeviceProperties failed as inParamArray is null or empty"

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    new-instance v32, Lorg/apache/cordova/PluginResult;

    sget-object v33, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const-string v34, "null or empty inParamArray"

    invoke-direct/range {v32 .. v34}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p3

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_1

    .line 303
    :cond_f
    const-string v32, "resetDevice"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_11

    .line 304
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Calling action ACTION_RESET_DEVICE, inParamArray: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 305
    new-instance v6, Lcom/belkin/cordova/plugin/callback/ResetDeviceCallback;

    move-object/from16 v0, p3

    invoke-direct {v6, v0}, Lcom/belkin/cordova/plugin/callback/ResetDeviceCallback;-><init>(Lorg/apache/cordova/CallbackContext;)V

    .line 306
    .local v6, "callback":Lcom/belkin/cordova/plugin/callback/ResetDeviceCallback;
    if-eqz p2, :cond_10

    .line 307
    new-instance v32, Lcom/belkin/cordova/plugin/runnable/ResetDeviceRunnable;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lcom/belkin/controller/DeviceListController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/DeviceListController;

    move-result-object v33

    move-object/from16 v0, v32

    move-object/from16 v1, p2

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v6, v2}, Lcom/belkin/cordova/plugin/runnable/ResetDeviceRunnable;-><init>(Lorg/json/JSONArray;Lcom/belkin/cordova/plugin/callback/ResetDeviceCallback;Lcom/belkin/controller/DeviceListController;)V

    invoke-static/range {v32 .. v32}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    .line 311
    :goto_2
    sget-object v32, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->onResume(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V

    goto/16 :goto_1

    .line 309
    :cond_10
    const-string v32, "null inParamArray"

    move-object/from16 v0, v32

    invoke-virtual {v6, v0}, Lcom/belkin/cordova/plugin/callback/ResetDeviceCallback;->onError(Ljava/lang/String;)V

    goto :goto_2

    .line 313
    .end local v6    # "callback":Lcom/belkin/cordova/plugin/callback/ResetDeviceCallback;
    :cond_11
    const-string v32, "findBulb"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_13

    .line 315
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Calling action ACTION_FIND_BULB: findBulb, inParamArray: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    new-instance v6, Lcom/belkin/cordova/plugin/callback/FindBulbCallback;

    move-object/from16 v0, p3

    invoke-direct {v6, v0}, Lcom/belkin/cordova/plugin/callback/FindBulbCallback;-><init>(Lorg/apache/cordova/CallbackContext;)V

    .line 317
    .local v6, "callback":Lcom/belkin/cordova/plugin/callback/FindBulbCallback;
    if-eqz p2, :cond_12

    .line 318
    new-instance v32, Lcom/belkin/cordova/plugin/runnable/FindBulbRunnable;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    move-object/from16 v0, v32

    move-object/from16 v1, p2

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v6, v2}, Lcom/belkin/cordova/plugin/runnable/FindBulbRunnable;-><init>(Lorg/json/JSONArray;Lcom/belkin/cordova/plugin/callback/FindBulbCallback;Landroid/content/Context;)V

    invoke-static/range {v32 .. v32}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 320
    :cond_12
    const-string v32, "null inParamArray"

    move-object/from16 v0, v32

    invoke-virtual {v6, v0}, Lcom/belkin/cordova/plugin/callback/FindBulbCallback;->onError(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 323
    .end local v6    # "callback":Lcom/belkin/cordova/plugin/callback/FindBulbCallback;
    :cond_13
    const-string v32, "refreshDevices"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_14

    .line 324
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 325
    sget-object v32, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->onResume(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V

    .line 327
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v32, v0

    sget-object v33, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/RateMe;->handleRateMePopup(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    goto/16 :goto_1

    .line 328
    :cond_14
    const-string v32, "hideDevice"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_17

    .line 330
    :try_start_2
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Calling action ACTION_HIDE_DEVICE: hideDevice, inParamArray: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 333
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v32, v0

    invoke-static/range {v32 .. v32}, Lcom/belkin/utils/RateMe;->resetFullSuccessfulDiscoveryCounter(Landroid/content/Context;)V

    .line 335
    new-instance v6, Lcom/belkin/cordova/plugin/callback/HideDeviceCallback;

    move-object/from16 v0, p3

    invoke-direct {v6, v0}, Lcom/belkin/cordova/plugin/callback/HideDeviceCallback;-><init>(Lorg/apache/cordova/CallbackContext;)V

    .line 339
    .local v6, "callback":Lcom/belkin/cordova/plugin/callback/HideDeviceCallback;
    if-eqz p2, :cond_16

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v32

    if-lez v32, :cond_16

    .line 340
    const/16 v32, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    .line 341
    .local v9, "devIds":Lorg/json/JSONObject;
    const-string v32, "udn"

    move-object/from16 v0, v32

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v32

    if-eqz v32, :cond_15

    .line 342
    const-string v32, "udn"

    move-object/from16 v0, v32

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    .line 344
    .restart local v30    # "udn":Ljava/lang/String;
    if-eqz v30, :cond_15

    .line 345
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 346
    .local v10, "device":Lorg/json/JSONObject;
    const-string v32, "udn"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v10, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 347
    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "window.smartDevicePlugin.onDeviceRemoved(\'"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v32

    const-string v33, "\');"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    .line 350
    .end local v10    # "device":Lorg/json/JSONObject;
    .end local v30    # "udn":Ljava/lang/String;
    :cond_15
    new-instance v32, Lcom/belkin/cordova/plugin/runnable/HideDeviceRunnable;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    move-object/from16 v0, v32

    move-object/from16 v1, p2

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v6, v2}, Lcom/belkin/cordova/plugin/runnable/HideDeviceRunnable;-><init>(Lorg/json/JSONArray;Lcom/belkin/cordova/plugin/callback/HideDeviceCallback;Landroid/content/Context;)V

    invoke-static/range {v32 .. v32}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_1

    .line 354
    .end local v6    # "callback":Lcom/belkin/cordova/plugin/callback/HideDeviceCallback;
    .end local v9    # "devIds":Lorg/json/JSONObject;
    :catch_2
    move-exception v18

    .line 355
    .local v18, "ex":Ljava/lang/Exception;
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Exception in SmartDevicePlugin-hideDevice "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 352
    .end local v18    # "ex":Ljava/lang/Exception;
    .restart local v6    # "callback":Lcom/belkin/cordova/plugin/callback/HideDeviceCallback;
    :cond_16
    :try_start_3
    const-string v32, "null inParamArray"

    move-object/from16 v0, v32

    invoke-virtual {v6, v0}, Lcom/belkin/cordova/plugin/callback/HideDeviceCallback;->onError(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_1

    .line 357
    .end local v6    # "callback":Lcom/belkin/cordova/plugin/callback/HideDeviceCallback;
    :cond_17
    const-string v32, "hideGroup"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_19

    .line 358
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Calling action ACTION_HIDE_GROUP. inParamArray: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 361
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v32, v0

    invoke-static/range {v32 .. v32}, Lcom/belkin/utils/RateMe;->resetFullSuccessfulDiscoveryCounter(Landroid/content/Context;)V

    .line 363
    if-eqz p2, :cond_18

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v32

    if-lez v32, :cond_18

    .line 364
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 365
    .restart local v10    # "device":Lorg/json/JSONObject;
    const-string v32, "groupID"

    move-object/from16 v0, v32

    move-object/from16 v1, p2

    invoke-virtual {v10, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 366
    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "window.smartDevicePlugin.onGroupRemoved(\'"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v32

    const-string v33, "\');"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    .line 368
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, p3

    move-object/from16 v3, p0

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/controller/DeviceListController;->hideGroup(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;Lcom/belkin/cordova/plugin/SmartDevicePlugin;)V

    goto/16 :goto_1

    .line 370
    .end local v10    # "device":Lorg/json/JSONObject;
    :cond_18
    new-instance v29, Lorg/apache/cordova/PluginResult;

    sget-object v32, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v29

    move-object/from16 v1, v32

    invoke-direct {v0, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 371
    .local v29, "result":Lorg/apache/cordova/PluginResult;
    move-object/from16 v0, p3

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_1

    .line 373
    .end local v29    # "result":Lorg/apache/cordova/PluginResult;
    :cond_19
    const-string v32, "selectNestDevices"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_1c

    .line 374
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Calling action ACTION_SELECT_NEST_DEVICES. inParamArray: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 375
    new-instance v24, Lorg/json/JSONArray;

    invoke-direct/range {v24 .. v24}, Lorg/json/JSONArray;-><init>()V

    .line 376
    .local v24, "jsonNestDevicesObject":Lorg/json/JSONArray;
    sget-object v32, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-eqz v32, :cond_1b

    .line 377
    sget-object v32, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual/range {v32 .. v32}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformation()Ljava/util/ArrayList;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v20

    .local v20, "i$":Ljava/util/Iterator;
    :cond_1a
    :goto_3
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v32

    if-eqz v32, :cond_1b

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 378
    .local v5, "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    new-instance v25, Lorg/json/JSONObject;

    invoke-direct/range {v25 .. v25}, Lorg/json/JSONObject;-><init>()V

    .line 379
    .local v25, "nestJsonObject":Lorg/json/JSONObject;
    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getProductType()Ljava/lang/String;

    move-result-object v32

    const-string v33, "NestThermostat"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v32

    if-eqz v32, :cond_1a

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v32

    if-nez v32, :cond_1a

    .line 380
    const-string v32, "friendlyName"

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v25

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 381
    const-string v32, "udn"

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v25

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 382
    const-string v32, "ProductName"

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getProductName()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v25

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 383
    const-string v32, "parentName"

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getParentName()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v25

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 384
    invoke-virtual/range {v24 .. v25}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_3

    .line 388
    .end local v5    # "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v20    # "i$":Ljava/util/Iterator;
    .end local v25    # "nestJsonObject":Lorg/json/JSONObject;
    :cond_1b
    new-instance v29, Lorg/apache/cordova/PluginResult;

    sget-object v32, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v29

    move-object/from16 v1, v32

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V

    .line 389
    .restart local v29    # "result":Lorg/apache/cordova/PluginResult;
    move-object/from16 v0, p3

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_1

    .line 390
    .end local v24    # "jsonNestDevicesObject":Lorg/json/JSONArray;
    .end local v29    # "result":Lorg/apache/cordova/PluginResult;
    :cond_1c
    const-string v32, "getNestDevices"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_1d

    .line 391
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Calling action ACTION_GET_NEST_DEVICES. inParamArray: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 392
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Lcom/belkin/controller/DeviceListController;->getNestDevices()V

    goto/16 :goto_1

    .line 393
    :cond_1d
    const-string v32, "deauthorizeNest"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_1e

    .line 394
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Calling action ACTION_DEAUTHORIZE_NEST. inParamArray: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 395
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Lcom/belkin/controller/DeviceListController;->deauthorizeNest()V

    goto/16 :goto_1

    .line 396
    :cond_1e
    const-string v32, "nestTokenExistForGivenHomeId"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_1f

    .line 397
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Calling action ACTION_NEST_TOKEN_EXIST_FOR_GIVEN_HOME_ID. inParamArray: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 398
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Lcom/belkin/controller/DeviceListController;->nestTokenExists()V

    goto/16 :goto_1

    .line 399
    :cond_1f
    const-string v32, "areNestFirmwareSupported"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_20

    .line 400
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Lcom/belkin/controller/DeviceListController;->areNestFirmwareSupported()Z

    move-result v21

    .line 401
    .local v21, "isNestFWSupported":Z
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Calling action ACTION_ARE_NEST_FIRMWARE_SUPPORTED. inParamArray: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, " ;isNestFWSupported- "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 402
    new-instance v29, Lorg/apache/cordova/PluginResult;

    sget-object v32, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v29

    move-object/from16 v1, v32

    move/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    .line 403
    .restart local v29    # "result":Lorg/apache/cordova/PluginResult;
    move-object/from16 v0, p3

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_1

    .line 404
    .end local v21    # "isNestFWSupported":Z
    .end local v29    # "result":Lorg/apache/cordova/PluginResult;
    :cond_20
    const-string v32, "addToGroup"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_21

    .line 405
    const-string v32, "SmartDevicePlugin"

    const-string v33, "IN action ADD TO GROUP"

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 406
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Params: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 407
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/belkin/controller/DeviceListController;->addToGroup(Lorg/json/JSONArray;)Z

    move-result v32

    if-nez v32, :cond_0

    .line 408
    new-instance v29, Lorg/apache/cordova/PluginResult;

    sget-object v32, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v29

    move-object/from16 v1, v32

    invoke-direct {v0, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 409
    .restart local v29    # "result":Lorg/apache/cordova/PluginResult;
    move-object/from16 v0, p3

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_1

    .line 411
    .end local v29    # "result":Lorg/apache/cordova/PluginResult;
    :cond_21
    const-string v32, "removeFromGroup"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_22

    .line 412
    const-string v32, "SmartDevicePlugin"

    const-string v33, "IN action Remove From Group"

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 413
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Params: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 414
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/belkin/controller/DeviceListController;->removeGroup(Lorg/json/JSONArray;)V

    goto/16 :goto_1

    .line 415
    :cond_22
    const-string v32, "getEventHistory"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_23

    .line 416
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, ":: ACTION_GET_EVENT_HISTORY :: 1st param :: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const/16 v34, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, ":: 2nd param ::"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const/16 v34, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v34

    invoke-virtual/range {v33 .. v35}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 417
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v32, v0

    invoke-static/range {v32 .. v32}, Lcom/belkin/wemo/cache/utils/SharePreferences;->resetSensorEventCounter(Landroid/content/Context;)V

    .line 418
    new-instance v6, Lcom/belkin/devices/callback/GetSensorEventHistoryCallBack;

    move-object/from16 v0, p3

    invoke-direct {v6, v0}, Lcom/belkin/devices/callback/GetSensorEventHistoryCallBack;-><init>(Lorg/apache/cordova/CallbackContext;)V

    .line 419
    .local v6, "callback":Lcom/belkin/devices/callback/GetSensorEventHistoryCallBack;
    new-instance v32, Lcom/belkin/devices/runnable/GetSensorEventRunnable;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, p2

    invoke-direct {v0, v6, v1, v2}, Lcom/belkin/devices/runnable/GetSensorEventRunnable;-><init>(Lcom/belkin/devices/callback/GetSensorEventHistoryCallBack;Landroid/content/Context;Lorg/json/JSONArray;)V

    invoke-static/range {v32 .. v32}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 420
    .end local v6    # "callback":Lcom/belkin/devices/callback/GetSensorEventHistoryCallBack;
    :cond_23
    const-string v32, "getEventHistoryFromDB"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_24

    .line 421
    const-string v32, "SmartDevicePlugin"

    const-string v33, ":: ACTION_GET_EVENTS_FROM_DB :: "

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 422
    new-instance v6, Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;

    move-object/from16 v0, p3

    invoke-direct {v6, v0}, Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;-><init>(Lorg/apache/cordova/CallbackContext;)V

    .line 423
    .local v6, "callback":Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;
    new-instance v32, Lcom/belkin/devices/runnable/GetSensorEventsFromDBRunnable;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    invoke-direct {v0, v6, v1}, Lcom/belkin/devices/runnable/GetSensorEventsFromDBRunnable;-><init>(Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;Landroid/content/Context;)V

    invoke-static/range {v32 .. v32}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 424
    .end local v6    # "callback":Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;
    :cond_24
    const-string v32, "setDevicePreset"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_25

    .line 425
    const-string v32, "SmartDevicePlugin"

    const-string v33, " ACTION_SET_DEVICE_PRESET"

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 426
    if-eqz p3, :cond_0

    if-eqz p2, :cond_0

    .line 427
    new-instance v6, Lcom/belkin/devices/callback/DevicePresetCallBack;

    move-object/from16 v0, p3

    invoke-direct {v6, v0}, Lcom/belkin/devices/callback/DevicePresetCallBack;-><init>(Lorg/apache/cordova/CallbackContext;)V

    .line 428
    .local v6, "callback":Lcom/belkin/devices/callback/DevicePresetCallBack;
    new-instance v32, Lcom/belkin/devices/runnable/SetDevicePresetRunnable;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    move-object/from16 v0, v32

    move-object/from16 v1, p2

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v6, v2}, Lcom/belkin/devices/runnable/SetDevicePresetRunnable;-><init>(Lorg/json/JSONArray;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;Landroid/content/Context;)V

    invoke-static/range {v32 .. v32}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 430
    .end local v6    # "callback":Lcom/belkin/devices/callback/DevicePresetCallBack;
    :cond_25
    const-string v32, "getDevicePreset"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_26

    .line 431
    const-string v32, "SmartDevicePlugin"

    const-string v33, " ACTION_GET_DEVICE_PRESET"

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 432
    if-eqz p3, :cond_0

    if-eqz p2, :cond_0

    .line 433
    new-instance v6, Lcom/belkin/devices/callback/DevicePresetCallBack;

    move-object/from16 v0, p3

    invoke-direct {v6, v0}, Lcom/belkin/devices/callback/DevicePresetCallBack;-><init>(Lorg/apache/cordova/CallbackContext;)V

    .line 434
    .restart local v6    # "callback":Lcom/belkin/devices/callback/DevicePresetCallBack;
    new-instance v32, Lcom/belkin/devices/runnable/GetDevicePresetRunnable;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    move-object/from16 v0, v32

    move-object/from16 v1, p2

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v6, v2}, Lcom/belkin/devices/runnable/GetDevicePresetRunnable;-><init>(Lorg/json/JSONArray;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;Landroid/content/Context;)V

    invoke-static/range {v32 .. v32}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 436
    .end local v6    # "callback":Lcom/belkin/devices/callback/DevicePresetCallBack;
    :cond_26
    const-string v32, "deleteDevicePreset"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_27

    .line 437
    const-string v32, "SmartDevicePlugin"

    const-string v33, " ACTION_DELETE_DEVICE_PRESET"

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 438
    if-eqz p3, :cond_0

    if-eqz p2, :cond_0

    .line 439
    new-instance v6, Lcom/belkin/devices/callback/DevicePresetCallBack;

    move-object/from16 v0, p3

    invoke-direct {v6, v0}, Lcom/belkin/devices/callback/DevicePresetCallBack;-><init>(Lorg/apache/cordova/CallbackContext;)V

    .line 440
    .restart local v6    # "callback":Lcom/belkin/devices/callback/DevicePresetCallBack;
    new-instance v32, Lcom/belkin/devices/runnable/DeleteDevicePresetRunnable;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    move-object/from16 v0, v32

    move-object/from16 v1, p2

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v6, v2}, Lcom/belkin/devices/runnable/DeleteDevicePresetRunnable;-><init>(Lorg/json/JSONArray;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;Landroid/content/Context;)V

    invoke-static/range {v32 .. v32}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 442
    .end local v6    # "callback":Lcom/belkin/devices/callback/DevicePresetCallBack;
    :cond_27
    const-string v32, "getSubDevicesCount"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_29

    .line 443
    if-eqz p2, :cond_28

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v32

    if-lez v32, :cond_28

    .line 444
    new-instance v32, Lorg/apache/cordova/PluginResult;

    sget-object v33, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Lcom/belkin/controller/DeviceListController;->getSubDevicesCount(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v32 .. v34}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p3

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_1

    .line 447
    :cond_28
    new-instance v32, Lorg/apache/cordova/PluginResult;

    sget-object v33, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    const-string v34, ""

    invoke-direct/range {v32 .. v34}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p3

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_1

    .line 449
    :cond_29
    const-string v32, "setBlobStorageData"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_2b

    .line 450
    new-instance v6, Lcom/belkin/cordova/plugin/callback/SetBlobStorageCallback;

    move-object/from16 v0, p3

    invoke-direct {v6, v0}, Lcom/belkin/cordova/plugin/callback/SetBlobStorageCallback;-><init>(Lorg/apache/cordova/CallbackContext;)V

    .line 451
    .local v6, "callback":Lcom/belkin/cordova/plugin/callback/SetBlobStorageCallback;
    if-eqz p2, :cond_2a

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v32

    if-lez v32, :cond_2a

    .line 452
    new-instance v32, Lcom/belkin/cordova/plugin/runnable/SetBlobStorageRunnable;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    move-object/from16 v0, v32

    move-object/from16 v1, p2

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v6, v2}, Lcom/belkin/cordova/plugin/runnable/SetBlobStorageRunnable;-><init>(Lorg/json/JSONArray;Lcom/belkin/cordova/plugin/callback/SetBlobStorageCallback;Landroid/content/Context;)V

    invoke-static/range {v32 .. v32}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 454
    :cond_2a
    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "inParamArray null or missing arguments inParamArray"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-virtual {v6, v0}, Lcom/belkin/cordova/plugin/callback/SetBlobStorageCallback;->onError(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 456
    .end local v6    # "callback":Lcom/belkin/cordova/plugin/callback/SetBlobStorageCallback;
    :cond_2b
    const-string v32, "getBlobStorageData"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_2d

    .line 457
    new-instance v6, Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;

    move-object/from16 v0, p3

    invoke-direct {v6, v0}, Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;-><init>(Lorg/apache/cordova/CallbackContext;)V

    .line 458
    .local v6, "callback":Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;
    if-eqz p2, :cond_2c

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v32

    if-lez v32, :cond_2c

    .line 459
    new-instance v32, Lcom/belkin/cordova/plugin/runnable/GetBlobStorageRunnable;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    move-object/from16 v0, v32

    move-object/from16 v1, p2

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v6, v2}, Lcom/belkin/cordova/plugin/runnable/GetBlobStorageRunnable;-><init>(Lorg/json/JSONArray;Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;Landroid/content/Context;)V

    invoke-static/range {v32 .. v32}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 461
    :cond_2c
    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "inParamArray null or missing arguments inParamArray"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-virtual {v6, v0}, Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;->onError(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 463
    .end local v6    # "callback":Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;
    :cond_2d
    const-string v32, "appRecovery"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_2e

    .line 464
    new-instance v32, Lcom/belkin/devices/runnable/WeMoAppRecoveryRunnable;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    invoke-direct/range {v32 .. v33}, Lcom/belkin/devices/runnable/WeMoAppRecoveryRunnable;-><init>(Landroid/content/Context;)V

    invoke-static/range {v32 .. v32}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    .line 465
    const-string v32, "success"

    move-object/from16 v0, p3

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 466
    :cond_2e
    const-string v32, "onReset"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_2f

    .line 467
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Lcom/belkin/controller/DeviceListController;->clearCache()V

    goto/16 :goto_1

    .line 468
    :cond_2f
    const-string v32, "setNightModeConfiguration"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_31

    .line 469
    if-eqz p2, :cond_30

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v32

    if-lez v32, :cond_30

    .line 470
    const/16 v32, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v26

    .line 471
    .local v26, "nightModeParams":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, p3

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lcom/belkin/controller/DeviceListController;->setNightModeConfiguration(Lorg/apache/cordova/CallbackContext;Lorg/json/JSONObject;)V

    goto/16 :goto_1

    .line 473
    .end local v26    # "nightModeParams":Lorg/json/JSONObject;
    :cond_30
    new-instance v32, Lorg/apache/cordova/PluginResult;

    sget-object v33, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct/range {v32 .. v33}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p3

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_1

    .line 475
    :cond_31
    const-string v32, "configureHushMode"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_33

    .line 476
    if-eqz p2, :cond_32

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v32

    if-lez v32, :cond_32

    .line 477
    const/16 v32, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v19

    .line 478
    .local v19, "hushModeParams":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, p3

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/belkin/controller/DeviceListController;->configureHushMode(Lorg/apache/cordova/CallbackContext;Lorg/json/JSONObject;)V

    goto/16 :goto_1

    .line 480
    .end local v19    # "hushModeParams":Lorg/json/JSONObject;
    :cond_32
    new-instance v32, Lorg/apache/cordova/PluginResult;

    sget-object v33, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct/range {v32 .. v33}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p3

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_1

    .line 482
    :cond_33
    const-string v32, "configureDimmingRange"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_35

    .line 483
    if-eqz p2, :cond_34

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v32

    if-lez v32, :cond_34

    .line 484
    const/16 v32, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v14

    .line 485
    .local v14, "dimmingRangeParams":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, p3

    invoke-virtual {v0, v1, v14}, Lcom/belkin/controller/DeviceListController;->configureDimmingRange(Lorg/apache/cordova/CallbackContext;Lorg/json/JSONObject;)V

    goto/16 :goto_1

    .line 487
    .end local v14    # "dimmingRangeParams":Lorg/json/JSONObject;
    :cond_34
    new-instance v32, Lorg/apache/cordova/PluginResult;

    sget-object v33, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct/range {v32 .. v33}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p3

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_1

    .line 489
    :cond_35
    const-string v32, "getNightModeConfiguration"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-nez v32, :cond_0

    .line 491
    const-string v32, "takePicture"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_36

    .line 494
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lcom/belkin/controller/DeviceListController;->takePicture(Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 495
    :cond_36
    const-string v32, "choosePhoto"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_37

    .line 498
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lcom/belkin/controller/DeviceListController;->selectPhoto(Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 499
    :cond_37
    const-string v32, "refreshLongPressRuleDetails"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_39

    .line 500
    if-eqz p2, :cond_38

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v32

    if-lez v32, :cond_38

    .line 501
    const/16 v32, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v31

    .line 502
    .local v31, "udnJO":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, v31

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lcom/belkin/controller/DeviceListController;->refreshLongPressRuleDetails(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 504
    .end local v31    # "udnJO":Lorg/json/JSONObject;
    :cond_38
    new-instance v32, Lorg/apache/cordova/PluginResult;

    sget-object v33, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct/range {v32 .. v33}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p3

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_1

    .line 506
    :cond_39
    const-string v32, "setBulbType"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_3b

    .line 507
    if-eqz p2, :cond_3a

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v32

    if-lez v32, :cond_3a

    .line 508
    const/16 v32, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 509
    .local v4, "bulbTypeJO":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, p3

    invoke-virtual {v0, v4, v1}, Lcom/belkin/controller/DeviceListController;->setBulbType(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 511
    .end local v4    # "bulbTypeJO":Lorg/json/JSONObject;
    :cond_3a
    new-instance v32, Lorg/apache/cordova/PluginResult;

    sget-object v33, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct/range {v32 .. v33}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p3

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_1

    .line 513
    :cond_3b
    const-string v32, "calibrate"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_3d

    .line 514
    if-eqz p2, :cond_3c

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v32

    if-lez v32, :cond_3c

    .line 515
    const/16 v32, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v23

    .line 516
    .local v23, "jo":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lcom/belkin/controller/DeviceListController;->calibrate(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 518
    .end local v23    # "jo":Lorg/json/JSONObject;
    :cond_3c
    new-instance v32, Lorg/apache/cordova/PluginResult;

    sget-object v33, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct/range {v32 .. v33}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p3

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_1

    .line 520
    :cond_3d
    const-string v32, "collectEmailID"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_3e

    .line 521
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Collect EmailID API call; Params - "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 522
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Lcom/belkin/controller/DeviceListController;->collectEmailIDToCloud()V

    goto/16 :goto_1

    .line 523
    :cond_3e
    const-string v32, "setInsightDrawerState"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_40

    .line 524
    const-string v32, "SmartDevicePlugin"

    const-string v33, "ACTION_SET_INSIGHT_DRAWER_STATE"

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 525
    if-eqz p2, :cond_3f

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v32

    if-lez v32, :cond_3f

    .line 526
    const/16 v32, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v28

    .line 527
    .local v28, "paramsJO":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, v28

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lcom/belkin/controller/DeviceListController;->setInsightDrawerState(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V

    .line 528
    const-string v32, "isOpen"

    move-object/from16 v0, v28

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v22

    .line 529
    .local v22, "isOpened":I
    const-string v32, "udn"

    move-object/from16 v0, v28

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    .line 530
    .restart local v30    # "udn":Ljava/lang/String;
    sget-object v32, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v11

    .line 531
    .local v11, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v11, :cond_0

    .line 532
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "isOpened: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v33

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, " :deviceInfo.getState(): "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 533
    const/16 v32, 0x1

    move/from16 v0, v22

    move/from16 v1, v32

    if-ne v0, v1, :cond_0

    .line 534
    invoke-virtual {v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInsightData()V

    goto/16 :goto_1

    .line 538
    .end local v11    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v22    # "isOpened":I
    .end local v28    # "paramsJO":Lorg/json/JSONObject;
    .end local v30    # "udn":Ljava/lang/String;
    :cond_3f
    new-instance v32, Lorg/apache/cordova/PluginResult;

    sget-object v33, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct/range {v32 .. v33}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p3

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_1

    .line 540
    :cond_40
    const-string v32, "getDevicesInfo"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_42

    .line 542
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Lcom/belkin/controller/DeviceListController;->getDevicesInfo()Lorg/json/JSONArray;

    move-result-object v12

    .line 544
    .restart local v12    # "deviceList":Lorg/json/JSONArray;
    if-eqz v12, :cond_41

    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v32

    if-lez v32, :cond_41

    .line 545
    const-string v32, "SmartDevicePlugin"

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "ACTION_GET_DEVICES_INFO : deviceList "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual {v12}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 546
    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_1

    .line 548
    :cond_41
    const-string v32, "error fetching device list"

    move-object/from16 v0, p3

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 550
    .end local v12    # "deviceList":Lorg/json/JSONArray;
    :cond_42
    const-string v32, "checkBohnjour"

    move-object/from16 v0, v32

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_0

    .line 551
    const-string v32, "SmartDevicePlugin"

    const-string v33, "ACTION_CHECK_BOHNJOUR : Bhonjour discovery call "

    invoke-static/range {v32 .. v33}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 552
    new-instance v32, Lcom/belkin/devices/runnable/BridgeDiscoveryRunnable;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lcom/belkin/devices/runnable/BridgeDiscoveryRunnable;-><init>(Landroid/content/Context;Lorg/apache/cordova/CallbackContext;)V

    invoke-static/range {v32 .. v32}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto/16 :goto_1
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 2
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 154
    const-string v0, "SmartDevicePlugin"

    const-string v1, "SmartDevicePlugin initialize"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 158
    invoke-interface {p1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    .line 159
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {p0, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    sput-object v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 161
    sget-object v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0, p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->addNotificationListener(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V

    .line 162
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/controller/AppController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/AppController;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mAppController:Lcom/belkin/controller/AppController;

    .line 164
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/controller/SensorEventChangeController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/SensorEventChangeController;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mSensorStateChange:Lcom/belkin/controller/SensorEventChangeController;

    .line 165
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mSensorStateChange:Lcom/belkin/controller/SensorEventChangeController;

    invoke-virtual {v0, p0}, Lcom/belkin/controller/SensorEventChangeController;->addNotificationListener(Lcom/belkin/controller/SensorEventChangeListener;)V

    .line 166
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/controller/DeviceListController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/DeviceListController;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    .line 168
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    if-nez v0, :cond_0

    .line 169
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 170
    new-instance v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mSDKNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 172
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceCallbacks:Ljava/util/Map;

    .line 173
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    iput-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->conMan:Landroid/net/ConnectivityManager;

    .line 176
    invoke-static {}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->getInstance()Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->addRemoteAccessListener(Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;)Z

    .line 177
    return-void
.end method

.method public mustRestartApp()V
    .locals 1

    .prologue
    .line 742
    const-string v0, "wemoUtil.loadUrl(filePath.INDEX);"

    invoke-virtual {p0, v0}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    .line 743
    return-void
.end method

.method public onDeviceAdded(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 4
    .param p1, "dev"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 782
    if-nez p1, :cond_0

    .line 793
    :goto_0
    return-void

    .line 784
    :cond_0
    const-string v1, "SmartDevicePlugin"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "in SmartDevicePlugin onDeviceAdded "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 785
    iget-object v1, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    if-nez v1, :cond_1

    .line 786
    iget-object v1, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/controller/DeviceListController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/DeviceListController;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    .line 787
    :cond_1
    iget-object v1, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    if-eqz v1, :cond_2

    .line 788
    iget-object v1, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    invoke-virtual {v1, p1}, Lcom/belkin/controller/DeviceListController;->addDevice(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lorg/json/JSONObject;

    move-result-object v0

    .line 789
    .local v0, "deviceObj":Lorg/json/JSONObject;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "window.smartDevicePlugin.onDeviceAdded(\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\');"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    goto :goto_0

    .line 791
    .end local v0    # "deviceObj":Lorg/json/JSONObject;
    :cond_2
    const-string v1, "SmartDevicePlugin"

    const-string v2, "DeviceListController is null"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onDeviceRemoved(Ljava/lang/String;)V
    .locals 0
    .param p1, "arg0"    # Ljava/lang/String;

    .prologue
    .line 799
    return-void
.end method

.method public onDeviceReset(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "resetType"    # Ljava/lang/String;
    .param p3, "status"    # Ljava/lang/String;

    .prologue
    .line 822
    :try_start_0
    const-string v2, "SmartDevicePlugin"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "in SmartDevicePlugin onDevonDeviceReset udn: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", resetType: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 824
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 825
    :cond_0
    const-string v2, "SmartDevicePlugin"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Null in onDeviceReset udn: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", resetType: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 827
    :cond_1
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 828
    .local v0, "completeResponse":Lorg/json/JSONObject;
    const-string v2, "resetType"

    invoke-virtual {v0, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 829
    const-string v2, "udn"

    invoke-virtual {v0, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 830
    const-string v2, "success"

    invoke-virtual {v0, v2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 831
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "window.smartDevicePlugin.onDeviceReset(\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\');"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 835
    .end local v0    # "completeResponse":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 832
    :catch_0
    move-exception v1

    .line 833
    .local v1, "ex":Ljava/lang/Exception;
    const-string v2, "SmartDevicePlugin"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception in onDeviceReset "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onDeviceUpdated(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 5
    .param p1, "dev"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 804
    if-nez p1, :cond_0

    .line 818
    :goto_0
    return-void

    .line 806
    :cond_0
    :try_start_0
    const-string v2, "SmartDevicePlugin"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "in SmartDevicePlugin onDeviceUpdated "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 807
    iget-object v2, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    if-nez v2, :cond_1

    .line 808
    iget-object v2, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/belkin/controller/DeviceListController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/DeviceListController;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    .line 809
    :cond_1
    iget-object v2, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    if-eqz v2, :cond_2

    .line 810
    iget-object v2, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    invoke-virtual {v2, p1}, Lcom/belkin/controller/DeviceListController;->updateDevice(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lorg/json/JSONObject;

    move-result-object v0

    .line 811
    .local v0, "deviceObj":Lorg/json/JSONObject;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "window.smartDevicePlugin.onDeviceUpdated(\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\');"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 815
    .end local v0    # "deviceObj":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 816
    .local v1, "ex":Ljava/lang/Exception;
    const-string v2, "SmartDevicePlugin"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception in SmartDevicePlugin-onDeviceUpdated "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 813
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_2
    :try_start_1
    const-string v2, "SmartDevicePlugin"

    const-string v3, "DeviceListController is null"

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public onIconUpdate(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "iconURL"    # Ljava/lang/String;

    .prologue
    .line 839
    const-string v2, "SmartDevicePlugin"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onIconUpdate() udn:: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " iconURL:: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 840
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 842
    .local v1, "iconUpdateObject":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "udn"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 843
    const-string v2, "icon"

    invoke-virtual {v1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 847
    :goto_0
    return-void

    .line 844
    :catch_0
    move-exception v0

    .line 845
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public onNetworkChangeDLM()V
    .locals 2

    .prologue
    .line 770
    const-string v0, "SmartDevicePlugin"

    const-string v1, "onNetworkChangeDLM"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 771
    sget-object v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-eqz v0, :cond_0

    .line 773
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->conMan:Landroid/net/ConnectivityManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->conMan:Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 774
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->conMan:Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 775
    sget-object v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0, p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->onNetworkChange(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V

    .line 778
    :cond_0
    return-void
.end method

.method public onNotify(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "status"    # Ljava/lang/String;
    .param p3, "udn"    # Ljava/lang/String;

    .prologue
    .line 561
    sget-object v7, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-eqz v7, :cond_0

    .line 562
    const-string v7, "add"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 563
    const-string v7, "SmartDevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "On Notify Add Device: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 564
    if-eqz p3, :cond_0

    .line 565
    sget-object v7, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {p0, v7}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->onDeviceAdded(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 738
    :cond_0
    :goto_0
    return-void

    .line 567
    :cond_1
    const-string v7, "update"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 568
    const-string v7, "SmartDevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "On Notify Update Device: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 569
    if-eqz p3, :cond_0

    .line 570
    sget-object v7, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {p0, v7}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->onDeviceUpdated(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    goto :goto_0

    .line 573
    :cond_2
    const-string v7, "remove"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 574
    const-string v7, "SmartDevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "On Notify remove Device: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 575
    if-eqz p3, :cond_0

    .line 576
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 578
    .local v1, "device":Lorg/json/JSONObject;
    :try_start_0
    const-string v7, "udn"

    invoke-virtual {v1, v7, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 584
    :goto_1
    const-string v7, "WEMO00"

    invoke-virtual {p3, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_3

    const-string v7, "remote_disabled"

    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 585
    const-string v7, "SmartDevicePlugin"

    const-string v8, "Nest Device Removed"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 586
    iget-object v7, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/belkin/wemo/rules/impl/WeMoRulesFactory;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/rules/IWeMoRules;

    move-result-object v6

    .line 587
    .local v6, "rules":Lcom/belkin/wemo/rules/IWeMoRules;
    new-instance v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin$FetchDevicesRulesCallback;

    invoke-direct {v0, p0, p3}, Lcom/belkin/cordova/plugin/SmartDevicePlugin$FetchDevicesRulesCallback;-><init>(Lcom/belkin/cordova/plugin/SmartDevicePlugin;Ljava/lang/String;)V

    .line 588
    .local v0, "callback":Lcom/belkin/cordova/plugin/SmartDevicePlugin$FetchDevicesRulesCallback;
    iget-object v7, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    invoke-interface {v6, v7, v0, v0}, Lcom/belkin/wemo/rules/IWeMoRules;->fetchRules(Landroid/content/Context;Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;)V

    .line 590
    .end local v0    # "callback":Lcom/belkin/cordova/plugin/SmartDevicePlugin$FetchDevicesRulesCallback;
    .end local v6    # "rules":Lcom/belkin/wemo/rules/IWeMoRules;
    :cond_3
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "window.smartDevicePlugin.onDeviceRemoved(\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\');"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 579
    :catch_0
    move-exception v2

    .line 581
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 592
    .end local v1    # "device":Lorg/json/JSONObject;
    .end local v2    # "e":Lorg/json/JSONException;
    :cond_4
    const-string v7, "change_state"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 593
    const-string v7, "SmartDevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "On Notify Change State Device: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 594
    if-eqz p3, :cond_0

    .line 595
    sget-object v7, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {p0, v7}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->onDeviceUpdated(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    goto/16 :goto_0

    .line 597
    :cond_5
    const-string v7, "set_state"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 598
    const-string v7, "SmartDevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "On Notify Set State Device: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 600
    if-eqz p3, :cond_0

    .line 601
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 603
    .restart local v1    # "device":Lorg/json/JSONObject;
    :try_start_1
    const-string v7, "udn"

    invoke-virtual {v1, v7, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 604
    const-string v7, "success"

    invoke-virtual {v1, v7, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 605
    const-string v7, "Insight"

    invoke-virtual {p3, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 606
    const-string v8, "binaryState"

    sget-object v7, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBinaryState()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 613
    :cond_6
    :goto_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "window.smartDevicePlugin.onDeviceChanged(\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\',\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\');"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 608
    :catch_1
    move-exception v2

    .line 610
    .restart local v2    # "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2

    .line 615
    .end local v1    # "device":Lorg/json/JSONObject;
    .end local v2    # "e":Lorg/json/JSONException;
    :cond_7
    const-string v7, "update_group_state"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 616
    const-string v7, "SmartDevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "On Notify update group state : "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 617
    if-eqz p3, :cond_0

    .line 618
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "window.smartDevicePlugin.onGroupUpdated(\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\',\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\');"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 620
    :cond_8
    const-string v7, "set_properties"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 621
    const-string v7, "SmartDevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "onNotify info on properties: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 622
    if-eqz p3, :cond_0

    .line 623
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 625
    .restart local v1    # "device":Lorg/json/JSONObject;
    :try_start_2
    const-string v7, "udn"

    invoke-virtual {v1, v7, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 626
    const-string v7, "success"

    invoke-virtual {v1, v7, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 631
    :goto_3
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "window.smartDevicePlugin.onDeviceChanged(\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\',\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\');"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 627
    :catch_2
    move-exception v2

    .line 629
    .restart local v2    # "e":Lorg/json/JSONException;
    const-string v7, "SmartDevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Exception in onNotify: e:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 633
    .end local v1    # "device":Lorg/json/JSONObject;
    .end local v2    # "e":Lorg/json/JSONException;
    :cond_9
    const-string v7, "reset_fn_icon_rules"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 634
    const-string v7, "SmartDevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "on Notify RESET_FN_ICON_RULES udn:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 635
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 636
    const-string v7, "reset_fn_icon_rules"

    invoke-virtual {p0, p3, v7, p2}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->onDeviceReset(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 638
    :cond_a
    const-string v7, "reset_wifi"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_b

    .line 639
    const-string v7, "SmartDevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "on Notify RESET_WIFI udn:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 640
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 641
    const-string v7, "reset_wifi"

    invoke-virtual {p0, p3, v7, p2}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->onDeviceReset(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 643
    :cond_b
    const-string v7, "reset_all"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 644
    const-string v7, "SmartDevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "on Notify RESET_ALL udn:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 645
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 646
    const-string v7, "reset_all"

    invoke-virtual {p0, p3, v7, p2}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->onDeviceReset(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 648
    :cond_c
    const-string v7, "reset_usage_data"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_d

    .line 649
    const-string v7, "SmartDevicePlugin"

    const-string v8, "on Notify RESET_USAGE_DATA"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 650
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 651
    const-string v7, "reset_usage_data"

    invoke-virtual {p0, p3, v7, p2}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->onDeviceReset(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 653
    :cond_d
    const-string v7, "set_blob_storage"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_e

    .line 654
    const-string v7, "SmartDevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "onNotify info on properties: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 655
    if-eqz p3, :cond_0

    .line 656
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 658
    .restart local v1    # "device":Lorg/json/JSONObject;
    :try_start_3
    const-string v7, "udn"

    invoke-virtual {v1, v7, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 659
    const-string v7, "success"

    invoke-virtual {v1, v7, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_3

    .line 663
    :goto_4
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "window.smartDevicePlugin.onDeviceChanged(\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\',\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\');"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 660
    :catch_3
    move-exception v2

    .line 661
    .restart local v2    # "e":Lorg/json/JSONException;
    const-string v7, "SmartDevicePlugin"

    const-string v8, "Exception in onNotify: e:"

    invoke-static {v7, v8, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_4

    .line 665
    .end local v1    # "device":Lorg/json/JSONObject;
    .end local v2    # "e":Lorg/json/JSONException;
    :cond_e
    const-string v7, "get_blob_storage"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_f

    .line 666
    const-string v7, "SmartDevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "onNotify info on properties: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 667
    if-eqz p3, :cond_0

    .line 668
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 670
    .restart local v1    # "device":Lorg/json/JSONObject;
    :try_start_4
    const-string v7, "udn"

    invoke-virtual {v1, v7, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 671
    const-string v7, "success"

    invoke-virtual {v1, v7, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 672
    const-string v8, "data"

    sget-object v7, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v1, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_4

    .line 677
    :goto_5
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "window.smartDevicePlugin.onDeviceChanged(\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\',\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\');"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 673
    :catch_4
    move-exception v2

    .line 674
    .restart local v2    # "e":Lorg/json/JSONException;
    const-string v7, "SmartDevicePlugin"

    const-string v8, "Exception in onNotify: e:"

    invoke-static {v7, v8, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_5

    .line 679
    .end local v1    # "device":Lorg/json/JSONObject;
    .end local v2    # "e":Lorg/json/JSONException;
    :cond_f
    const-string v7, "available_fw_updates"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_10

    .line 680
    const-string v7, "SmartDevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "On Notify AVAILABLE_FW_UPDATES: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 681
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 682
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 684
    .local v4, "fwResponse":Lorg/json/JSONObject;
    :try_start_5
    const-string v7, "response"

    invoke-virtual {v4, v7, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 685
    const-string v7, "success"

    const-string v8, "true"

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_5

    .line 690
    :goto_6
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "window.firmwareUpdatePlugin.onGetAvailableUpdates("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 686
    :catch_5
    move-exception v2

    .line 688
    .restart local v2    # "e":Lorg/json/JSONException;
    const-string v7, "SmartDevicePlugin"

    const-string v8, "Exception in onNotify: e:"

    invoke-static {v7, v8, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_6

    .line 694
    .end local v2    # "e":Lorg/json/JSONException;
    .end local v4    # "fwResponse":Lorg/json/JSONObject;
    :cond_10
    const-string v7, "FirmwareUpdateStatus"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_11

    const-string v7, "SubDeviceFWUpdate"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_12

    .line 695
    :cond_11
    const-string v7, "SmartDevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " status:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " udn:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 696
    iget-object v7, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    invoke-virtual {v7, p3, p2}, Lcom/belkin/controller/DeviceListController;->updateFwStatus(Ljava/lang/String;Ljava/lang/String;)V

    .line 697
    const-string v7, ""

    invoke-static {p3, p2, v7}, Lcom/belkin/firmware/FirmwareUpdateManager;->updateUpgradeStatus(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 698
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "window.firmwareUpdatePlugin.onStatusChange(\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\',\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\');"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 700
    :cond_12
    const-string v7, "zigbee_status_done"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_13

    .line 701
    const-string v7, "SmartDevicePlugin"

    const-string v8, "ZIGBEE_STATUS_DONE"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 702
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "window.smartDevicePlugin.onGetZigbeeStatusDone(\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\');"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 704
    :cond_13
    const-string v7, "pluginConnected"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_14

    .line 705
    const-string v7, "SmartDevicePlugin"

    const-string v8, "On Notify PLUGIN_CONNECTED"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 707
    const-string v7, "window.networkPlugin.onWeMoConnected();"

    invoke-virtual {p0, v7}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 708
    :cond_14
    const-string v7, "reset_cache"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_15

    .line 709
    const-string v7, "SmartDevicePlugin"

    const-string v8, "On Notify RESET_CACHE"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 710
    const-string v7, "window.smartDevicePlugin.onReset();"

    invoke-virtual {p0, v7}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 711
    :cond_15
    const-string v7, "set_remote"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_16

    .line 712
    const-string v7, "SmartDevicePlugin"

    const-string v8, "On Notify SET_REMOTE"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 713
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "window.smartDevicePlugin.onSetRemote(\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\');"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 714
    :cond_16
    const-string v7, "set_nest_error_code"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_18

    .line 715
    const-string v7, "SmartDevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "On Notify SET_NEST_ERROR_CODE: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 716
    const-string v7, "&#"

    invoke-virtual {p2, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 717
    .local v5, "nest_error_code":[Ljava/lang/String;
    array-length v7, v5

    if-lez v7, :cond_0

    .line 718
    const/4 v7, 0x0

    aget-object v7, v5, v7

    const-string v8, "_"

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 719
    .local v3, "error_code":[Ljava/lang/String;
    array-length v7, v3

    if-lez v7, :cond_17

    .line 720
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "window.smartDevicePlugin.onNestErrorCode(\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x1

    aget-object v8, v3, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\',\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x1

    aget-object v8, v5, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\',\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x2

    aget-object v8, v5, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\');"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 722
    :cond_17
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "window.smartDevicePlugin.onNestErrorCode(\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x0

    aget-object v8, v5, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\',\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x1

    aget-object v8, v5, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\',\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x2

    aget-object v8, v5, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\');"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 725
    .end local v3    # "error_code":[Ljava/lang/String;
    .end local v5    # "nest_error_code":[Ljava/lang/String;
    :cond_18
    const-string v7, "nest_deauthorization_response"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_19

    .line 726
    const-string v7, "SmartDevicePlugin"

    const-string v8, "On Notify NEST_DEAUTH0RIZATION_RESPONSE"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 727
    iget-object v7, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setNestDeauthCallbackStatus(I)V

    .line 728
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "window.smartDevicePlugin.onNestDeauth(\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\');"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 729
    :cond_19
    const-string v7, "nest_auth_token_existence"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1a

    .line 730
    const-string v7, "SmartDevicePlugin"

    const-string v8, "On Notify NEST_AUTH_TOKEN_EXISTENCE"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 731
    iget-object v7, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setNestAuthCallbackStatus(I)V

    .line 732
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "window.smartDevicePlugin.onCheckNestAuth(\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\');"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 733
    :cond_1a
    const-string v7, "nest_deauthorized"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 734
    const-string v7, "SmartDevicePlugin"

    const-string v8, "On Notify NEST_DEAUTHORIZED"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 735
    const-string v7, "window.smartDevicePlugin.onNestDeauth();"

    invoke-virtual {p0, v7}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public onPauseDLM()V
    .locals 2

    .prologue
    .line 756
    const-string v0, "SmartDevicePlugin"

    const-string v1, "onPauseDLM"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 757
    sget-object v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-eqz v0, :cond_0

    .line 758
    sget-object v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->onPause()V

    .line 760
    :cond_0
    return-void
.end method

.method public onRemoteAccessDisabled()V
    .locals 2

    .prologue
    .line 985
    const-string v0, "SmartDevicePlugin"

    const-string v1, "Remote access has been Disabled"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 986
    const-string v0, "window.smartDevicePlugin.onSetRemoteAccess(\"false\");"

    invoke-virtual {p0, v0}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    .line 987
    return-void
.end method

.method public onRemoteAccessEnabled()V
    .locals 2

    .prologue
    .line 980
    const-string v0, "SmartDevicePlugin"

    const-string v1, "Remote access has been Enabled"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 981
    const-string v0, "window.smartDevicePlugin.onSetRemoteAccess(\"true\");"

    invoke-virtual {p0, v0}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    .line 982
    return-void
.end method

.method public onResumeDLM()V
    .locals 3

    .prologue
    .line 746
    const-string v0, "SmartDevicePlugin"

    const-string v1, "onResumeDLM"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 747
    sget-object v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v0, :cond_0

    .line 748
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    sput-object v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 749
    :cond_0
    sget-object v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-eqz v0, :cond_1

    .line 750
    sget-object v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0, p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->onResume(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V

    .line 752
    :cond_1
    new-instance v0, Lcom/belkin/devices/runnable/BridgeDiscoveryRunnable;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/belkin/devices/runnable/BridgeDiscoveryRunnable;-><init>(Landroid/content/Context;Lorg/apache/cordova/CallbackContext;)V

    invoke-static {v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    .line 753
    return-void
.end method

.method public onStartDLM()V
    .locals 2

    .prologue
    .line 763
    const-string v0, "SmartDevicePlugin"

    const-string v1, "onStartDLM"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 764
    sget-object v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-eqz v0, :cond_0

    .line 765
    sget-object v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->onStart()V

    .line 767
    :cond_0
    return-void
.end method

.method public onZigBeeDeviceAdded(Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;)V
    .locals 0
    .param p1, "arg0"    # Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;

    .prologue
    .line 853
    return-void
.end method

.method public onZigBeeDeviceUpdated(Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;)V
    .locals 0
    .param p1, "arg0"    # Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;

    .prologue
    .line 859
    return-void
.end method

.method public sendJavascriptCB(Ljava/lang/String;)V
    .locals 2
    .param p1, "cb"    # Ljava/lang/String;

    .prologue
    .line 180
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->webView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mAppController:Lcom/belkin/controller/AppController;

    if-eqz v0, :cond_0

    .line 181
    const-string v0, "smartDevicePlugin:Native:sendJavascriptCB cb"

    invoke-static {v0, p1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    iget-object v0, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mAppController:Lcom/belkin/controller/AppController;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, v1, p1}, Lcom/belkin/controller/AppController;->sendJSCallBack(Lorg/apache/cordova/CordovaWebView;Ljava/lang/String;)V

    .line 184
    :cond_0
    return-void
.end method

.method public sensorEventsCounter()V
    .locals 3

    .prologue
    .line 971
    iget-object v1, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    if-eqz v1, :cond_0

    .line 972
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getSensorEventsCount(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 973
    .local v0, "sensorEventsCount":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "window.smartDevicePlugin.OnSensorCountUpdated(\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\');"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    .line 976
    .end local v0    # "sensorEventsCount":Ljava/lang/String;
    :cond_0
    return-void
.end method
