.class public Lcom/belkin/cordova/plugin/DevicePlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "DevicePlugin.java"

# interfaces
.implements Lcom/belkin/wemo/localsdk/WeMoSDKContext$NotificationListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/cordova/plugin/DevicePlugin$TimerTask;,
        Lcom/belkin/cordova/plugin/DevicePlugin$enableRemoteAccess;,
        Lcom/belkin/cordova/plugin/DevicePlugin$StoreDeviceRulesCallback;,
        Lcom/belkin/cordova/plugin/DevicePlugin$FetchDevicesRulesCallback;
    }
.end annotation


# static fields
.field public static final STR_FALSE:Ljava/lang/String; = "false"

.field public static final STR_TRUE:Ljava/lang/String; = "true"

.field public static final TAG:Ljava/lang/String; = "DevicePlugin"

.field private static isRemoteEnableGoing:Z

.field private static mBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field public static mContext:Landroid/content/Context;

.field public static mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private static mDummyDevices:Lorg/json/JSONObject;

.field public static mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

.field private static mWebView:Lorg/apache/cordova/CordovaWebView;


# instance fields
.field private appLaunchUtil:Lcom/belkin/utils/ExternalAppLaunchUtil;

.field private cs:Lcom/belkin/cloud/CloudServices;

.field private deviceCallbackContext:Lorg/apache/cordova/CallbackContext;

.field private getDeviceList:Lorg/json/JSONArray;

.field private getDeviceListTask:Ljava/lang/Runnable;

.field private getendArray:Lorg/json/JSONArray;

.field private httpResponseObject:Lcom/belkin/remoteservice/HttpResponseObject;

.field private mAppController:Lcom/belkin/controller/AppController;

.field private mCallbackContext:Lorg/apache/cordova/CallbackContext;

.field private mCheckParams:Lorg/json/JSONArray;

.field private mHandler:Landroid/os/Handler;

.field private mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

.field private mPluginResult:Lorg/apache/cordova/PluginResult;

.field private mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

.field private mTimerIndex:I

.field private mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

.field private mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

.field private netCamUtil:Lcom/belkin/utils/NetCamUtil;

.field objHttpConnection:Lcom/belkin/remoteservice/RestfulWebservice;

.field private openBridgeNetworkTimer:Ljava/util/Timer;

.field private param:[Ljava/lang/String;

.field private weeklyRecordsHashMap:Ljava/util/HashMap;
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
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 123
    sput-object v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    .line 124
    sput-object v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 126
    sput-object v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mDummyDevices:Lorg/json/JSONObject;

    .line 129
    const/4 v0, 0x0

    sput-boolean v0, Lcom/belkin/cordova/plugin/DevicePlugin;->isRemoteEnableGoing:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 118
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 96
    iput-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    iput-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->deviceCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 110
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->getDeviceList:Lorg/json/JSONArray;

    .line 111
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mHandler:Landroid/os/Handler;

    .line 128
    const/4 v0, 0x0

    iput v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mTimerIndex:I

    .line 2288
    new-instance v0, Lcom/belkin/cordova/plugin/DevicePlugin$20;

    invoke-direct {v0, p0}, Lcom/belkin/cordova/plugin/DevicePlugin$20;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;)V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->getDeviceListTask:Ljava/lang/Runnable;

    .line 119
    sput-object v1, Lcom/belkin/cordova/plugin/DevicePlugin;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 120
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    .line 121
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/PluginResult;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->getDeviceList:Lorg/json/JSONArray;

    return-object v0
.end method

.method static synthetic access$1002(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;
    .param p1, "x1"    # Lorg/json/JSONArray;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->getDeviceList:Lorg/json/JSONArray;

    return-object p1
.end method

.method static synthetic access$102(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/PluginResult;)Lorg/apache/cordova/PluginResult;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;
    .param p1, "x1"    # Lorg/apache/cordova/PluginResult;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/CallbackContext;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->deviceCallbackContext:Lorg/apache/cordova/CallbackContext;

    return-object v0
.end method

.method static synthetic access$1102(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/CallbackContext;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;
    .param p1, "x1"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->deviceCallbackContext:Lorg/apache/cordova/CallbackContext;

    return-object p1
.end method

.method static synthetic access$1200(Lcom/belkin/cordova/plugin/DevicePlugin;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->getDeviceListTask:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/belkin/cordova/plugin/DevicePlugin;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/belkin/cordova/plugin/DevicePlugin;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/belkin/cordova/plugin/DevicePlugin;)I
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;

    .prologue
    .line 88
    iget v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mTimerIndex:I

    return v0
.end method

.method static synthetic access$1700(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/belkin/cordova/plugin/DevicePlugin;->pushSmartRegistrationIntent(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1800(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/belkin/cordova/plugin/DevicePlugin;->pushCheckWemoIntent(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1900(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mCheckParams:Lorg/json/JSONArray;

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/belkin/cordova/plugin/DevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->getendArray:Lorg/json/JSONArray;

    return-object v0
.end method

.method static synthetic access$2002(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;
    .param p1, "x1"    # Lorg/json/JSONArray;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->getendArray:Lorg/json/JSONArray;

    return-object p1
.end method

.method static synthetic access$2100(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/json/JSONArray;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;
    .param p1, "x1"    # Lorg/json/JSONArray;

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/belkin/cordova/plugin/DevicePlugin;->pushDeviceListIntent(Lorg/json/JSONArray;)V

    return-void
.end method

.method static synthetic access$300(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/CallbackContext;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    return-object v0
.end method

.method static synthetic access$400(Lcom/belkin/cordova/plugin/DevicePlugin;Landroid/content/Intent;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;
    .param p1, "x1"    # Landroid/content/Intent;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # [Ljava/lang/String;

    .prologue
    .line 88
    invoke-direct {p0, p1, p2, p3}, Lcom/belkin/cordova/plugin/DevicePlugin;->sendDevicesListIntent(Landroid/content/Intent;Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;
    .param p1, "x1"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/belkin/cordova/plugin/DevicePlugin;->enableRemoteAccessMethod(Lorg/apache/cordova/CallbackContext;)V

    return-void
.end method

.method static synthetic access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    return-object v0
.end method

.method static synthetic access$700(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/utils/WiFiSecurityUtil;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

    return-object v0
.end method

.method static synthetic access$800(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cloud/CloudServices;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->cs:Lcom/belkin/cloud/CloudServices;

    return-object v0
.end method

.method static synthetic access$802(Lcom/belkin/cordova/plugin/DevicePlugin;Lcom/belkin/cloud/CloudServices;)Lcom/belkin/cloud/CloudServices;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;
    .param p1, "x1"    # Lcom/belkin/cloud/CloudServices;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->cs:Lcom/belkin/cloud/CloudServices;

    return-object p1
.end method

.method static synthetic access$900(Lcom/belkin/cordova/plugin/DevicePlugin;)Ljava/util/Timer;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->openBridgeNetworkTimer:Ljava/util/Timer;

    return-object v0
.end method

.method static synthetic access$902(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/util/Timer;)Ljava/util/Timer;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/DevicePlugin;
    .param p1, "x1"    # Ljava/util/Timer;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->openBridgeNetworkTimer:Ljava/util/Timer;

    return-object p1
.end method

.method private checkIfWemoPresentAsync(Lorg/json/JSONArray;)V
    .locals 2
    .param p1, "inParamArray"    # Lorg/json/JSONArray;

    .prologue
    .line 2780
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/belkin/cordova/plugin/DevicePlugin$23;

    invoke-direct {v1, p0, p1}, Lcom/belkin/cordova/plugin/DevicePlugin$23;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/json/JSONArray;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 2802
    return-void
.end method

.method private enableRemoteAccessMethod(Lorg/apache/cordova/CallbackContext;)V
    .locals 11
    .param p1, "tempCallbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v10, 0x0

    .line 2704
    const/4 v6, 0x0

    .line 2705
    .local v6, "success":Z
    const/4 v7, 0x1

    :try_start_0
    sput-boolean v7, Lcom/belkin/cordova/plugin/DevicePlugin;->isRemoteEnableGoing:Z

    .line 2706
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 2708
    .local v0, "array":Lorg/json/JSONArray;
    sget-object v7, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setRemoteAccess()Lorg/json/JSONArray;

    move-result-object v3

    .line 2709
    .local v3, "jsonArray":Lorg/json/JSONArray;
    const/4 v7, 0x0

    invoke-virtual {v3, v7}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v5

    .line 2710
    .local v5, "result":Z
    if-eqz v5, :cond_2

    .line 2711
    iget-object v7, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteAutoEnableNeeded(Z)V

    .line 2712
    const/4 v6, 0x1

    .line 2713
    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->put(Z)Lorg/json/JSONArray;

    .line 2714
    iget-object v7, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 2715
    const/4 v7, 0x0

    sput-boolean v7, Lcom/belkin/cordova/plugin/DevicePlugin;->isRemoteEnableGoing:Z

    .line 2716
    if-eqz p1, :cond_1

    .line 2717
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v7, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v7, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V

    .line 2718
    .local v4, "pluginResult":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p1, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 2722
    .end local v4    # "pluginResult":Lorg/apache/cordova/PluginResult;
    :goto_0
    sget-object v7, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->nestTokenExistenceCheck()V

    .line 2723
    sget-object v7, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getNestDevicesFromCloud()V

    .line 2725
    iget-object v7, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getEmailOptDeviceType()Ljava/lang/String;

    move-result-object v1

    .line 2726
    .local v1, "deviceType":Ljava/lang/String;
    const-string v7, "DevicePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "deviceType: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2727
    const-string v7, ""

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 2728
    const-string v7, "DevicePlugin"

    const-string v8, "collectEmailIDToCloud called"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2729
    sget-object v7, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->collectEmailIDToCloud()V

    .line 2757
    .end local v0    # "array":Lorg/json/JSONArray;
    .end local v1    # "deviceType":Ljava/lang/String;
    .end local v3    # "jsonArray":Lorg/json/JSONArray;
    .end local v5    # "result":Z
    :cond_0
    :goto_1
    return-void

    .line 2720
    .restart local v0    # "array":Lorg/json/JSONArray;
    .restart local v3    # "jsonArray":Lorg/json/JSONArray;
    .restart local v5    # "result":Z
    :cond_1
    const-string v7, "DevicePlugin"

    const-string v8, "enableRemoteAccessMethod null callback"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2746
    .end local v0    # "array":Lorg/json/JSONArray;
    .end local v3    # "jsonArray":Lorg/json/JSONArray;
    .end local v5    # "result":Z
    :catch_0
    move-exception v2

    .line 2747
    .local v2, "e":Lorg/json/JSONException;
    sput-boolean v10, Lcom/belkin/cordova/plugin/DevicePlugin;->isRemoteEnableGoing:Z

    .line 2748
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    .line 2749
    if-eqz p1, :cond_4

    .line 2750
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v7, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, ""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v4, v7, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 2751
    .restart local v4    # "pluginResult":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p1, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_1

    .line 2734
    .end local v2    # "e":Lorg/json/JSONException;
    .end local v4    # "pluginResult":Lorg/apache/cordova/PluginResult;
    .restart local v0    # "array":Lorg/json/JSONArray;
    .restart local v3    # "jsonArray":Lorg/json/JSONArray;
    .restart local v5    # "result":Z
    :cond_2
    if-nez v6, :cond_0

    .line 2735
    const/4 v7, 0x0

    :try_start_1
    sput-boolean v7, Lcom/belkin/cordova/plugin/DevicePlugin;->isRemoteEnableGoing:Z

    .line 2736
    if-eqz p1, :cond_3

    .line 2737
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v7, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const-string v8, "DevicePlugin Error"

    invoke-direct {v4, v7, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 2738
    .restart local v4    # "pluginResult":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p1, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_1

    .line 2740
    .end local v4    # "pluginResult":Lorg/apache/cordova/PluginResult;
    :cond_3
    const-string v7, "DevicePlugin"

    const-string v8, "enableRemoteAccessMethod null callback"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 2753
    .end local v0    # "array":Lorg/json/JSONArray;
    .end local v3    # "jsonArray":Lorg/json/JSONArray;
    .end local v5    # "result":Z
    .restart local v2    # "e":Lorg/json/JSONException;
    :cond_4
    const-string v7, "DevicePlugin"

    const-string v8, "enableRemoteAccessMethod null callback"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method private getEndList()V
    .locals 2

    .prologue
    .line 2958
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->getendArray:Lorg/json/JSONArray;

    .line 2959
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/belkin/cordova/plugin/DevicePlugin$27;

    invoke-direct {v1, p0}, Lcom/belkin/cordova/plugin/DevicePlugin$27;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 2981
    return-void
.end method

.method private getEndList(Lorg/json/JSONArray;)V
    .locals 2
    .param p1, "params"    # Lorg/json/JSONArray;

    .prologue
    .line 2936
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mCheckParams:Lorg/json/JSONArray;

    .line 2937
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->getendArray:Lorg/json/JSONArray;

    .line 2938
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/belkin/cordova/plugin/DevicePlugin$26;

    invoke-direct {v1, p0}, Lcom/belkin/cordova/plugin/DevicePlugin$26;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 2954
    return-void
.end method

.method private getEndListStatus(Lorg/json/JSONArray;)V
    .locals 2
    .param p1, "params"    # Lorg/json/JSONArray;

    .prologue
    .line 2870
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mCheckParams:Lorg/json/JSONArray;

    .line 2871
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->getendArray:Lorg/json/JSONArray;

    .line 2872
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/belkin/cordova/plugin/DevicePlugin$24;

    invoke-direct {v1, p0}, Lcom/belkin/cordova/plugin/DevicePlugin$24;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 2908
    return-void
.end method

.method private getStatusForGrpLed(Lorg/apache/cordova/CallbackContext;Lorg/json/JSONArray;)V
    .locals 2
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "params"    # Lorg/json/JSONArray;

    .prologue
    .line 2910
    iput-object p2, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mCheckParams:Lorg/json/JSONArray;

    .line 2911
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->getendArray:Lorg/json/JSONArray;

    .line 2912
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/belkin/cordova/plugin/DevicePlugin$25;

    invoke-direct {v1, p0, p1}, Lcom/belkin/cordova/plugin/DevicePlugin$25;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 2933
    return-void
.end method

.method private pushCheckWemoIntent(Ljava/lang/String;)V
    .locals 4
    .param p1, "status"    # Ljava/lang/String;

    .prologue
    .line 2813
    const-string v1, "DevicePlugin"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "pushCheckWemoIntent: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2814
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 2815
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "smartString"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2816
    const-string v1, "com.controller.belkin.hybrid.SMART_CHECK_WEMO"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 2817
    sget-object v1, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 2818
    return-void
.end method

.method private pushDeviceListIntent(Lorg/json/JSONArray;)V
    .locals 7
    .param p1, "LeddeviceList"    # Lorg/json/JSONArray;

    .prologue
    .line 2822
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pushDeviceListIntent: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2823
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->getendArray:Lorg/json/JSONArray;

    .line 2824
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 2825
    .local v2, "intent":Landroid/content/Intent;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 2826
    .local v3, "tempList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v1, v4, :cond_0

    .line 2828
    :try_start_0
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2826
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2829
    :catch_0
    move-exception v0

    .line 2831
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 2834
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_0
    const-string v4, "getLedList"

    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 2835
    const-string v4, "com.controller.belkin.hybrid.BRIDGE_DEVICES"

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 2836
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 2837
    return-void
.end method

.method private pushSmartRegistrationIntent(Ljava/lang/String;)V
    .locals 4
    .param p1, "status"    # Ljava/lang/String;

    .prologue
    .line 2805
    const-string v1, "DevicePlugin"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "pushSmartRegistrationIntent: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2806
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 2807
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "smartString"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2808
    const-string v1, "com.controller.belkin.hybrid.SMART_REGISTRATION"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 2809
    sget-object v1, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 2810
    return-void
.end method

.method private registrationDataAsync()V
    .locals 2

    .prologue
    .line 2647
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/belkin/cordova/plugin/DevicePlugin$21;

    invoke-direct {v1, p0}, Lcom/belkin/cordova/plugin/DevicePlugin$21;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 2700
    return-void
.end method

.method private registrationStatusAsync()V
    .locals 2

    .prologue
    .line 2760
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/belkin/cordova/plugin/DevicePlugin$22;

    invoke-direct {v1, p0}, Lcom/belkin/cordova/plugin/DevicePlugin$22;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 2777
    return-void
.end method

.method private sendDevicesListIntent(Landroid/content/Intent;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 7
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "listen"    # Ljava/lang/String;
    .param p3, "attrs"    # [Ljava/lang/String;

    .prologue
    .line 2843
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 2844
    .local v1, "bundle":Landroid/os/Bundle;
    if-nez v1, :cond_1

    .line 2846
    const-string v4, "DevicePlugin"

    const-string v5, "Error, bundle is null"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2866
    .end local v1    # "bundle":Landroid/os/Bundle;
    :cond_0
    :goto_0
    return-void

    .line 2849
    .restart local v1    # "bundle":Landroid/os/Bundle;
    :cond_1
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 2850
    .local v0, "ListObject":Lorg/json/JSONObject;
    const-string v4, "listen"

    invoke-virtual {v0, v4, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2851
    iget-object v4, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->getendArray:Lorg/json/JSONArray;

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->getendArray:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lez v4, :cond_2

    .line 2852
    const/4 v4, 0x0

    aget-object v4, p3, v4

    iget-object v5, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->getendArray:Lorg/json/JSONArray;

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2856
    :goto_1
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "sendDevicesListIntent JSON: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2857
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v4, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 2858
    .local v3, "result":Lorg/apache/cordova/PluginResult;
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 2859
    if-eqz v3, :cond_0

    .line 2860
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "sendDevicesListIntent plugin result: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2861
    iget-object v4, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v4, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2863
    .end local v0    # "ListObject":Lorg/json/JSONObject;
    .end local v1    # "bundle":Landroid/os/Bundle;
    .end local v3    # "result":Lorg/apache/cordova/PluginResult;
    :catch_0
    move-exception v2

    .line 2864
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 2854
    .end local v2    # "e":Lorg/json/JSONException;
    .restart local v0    # "ListObject":Lorg/json/JSONObject;
    .restart local v1    # "bundle":Landroid/os/Bundle;
    :cond_2
    const/4 v4, 0x0

    :try_start_1
    aget-object v4, p3, v4

    const-string v5, "getLedList"

    invoke-virtual {p1, v5}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method private sendJavascriptCB(Ljava/lang/String;)V
    .locals 4
    .param p1, "cb"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 196
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->webView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_1

    move v0, v1

    :goto_0
    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mAppController:Lcom/belkin/controller/AppController;

    if-eqz v3, :cond_2

    :goto_1
    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 197
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mAppController:Lcom/belkin/controller/AppController;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, v1, p1}, Lcom/belkin/controller/AppController;->sendJSCallBack(Lorg/apache/cordova/CordovaWebView;Ljava/lang/String;)V

    .line 199
    :cond_0
    return-void

    :cond_1
    move v0, v2

    .line 196
    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 2990
    instance-of v0, p1, Lcom/belkin/cordova/plugin/DevicePlugin;

    return v0
.end method

.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 154
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "inParamArray"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 205
    const/4 v10, 0x5

    .line 206
    .local v10, "MAX_ATTEMPT":I
    const/16 v11, 0xa

    .line 207
    .local v11, "MAX_DISCOVERY_ATTEMPT":I
    const/16 v12, 0x3e8

    .line 209
    .local v12, "SLEEP_TIME":I
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    .line 211
    .local v14, "actionID":I
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "actionID: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " isLocal: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v63

    .line 213
    .local v63, "isHomeNetwork":Z
    if-eqz v63, :cond_0

    .line 215
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    move-result-object v4

    sput-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    .line 216
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    move-object/from16 v0, p0

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->addNotificationListener(Lcom/belkin/wemo/localsdk/WeMoSDKContext$NotificationListener;)V

    .line 217
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v4

    sput-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 219
    :cond_0
    sparse-switch v14, :sswitch_data_0

    .line 2215
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Incorrect action ID: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2220
    :cond_1
    :goto_0
    const/4 v4, 0x1

    :goto_1
    return v4

    .line 222
    :sswitch_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getAPData()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto :goto_0

    .line 226
    :sswitch_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v4

    new-instance v5, Lcom/belkin/cordova/plugin/DevicePlugin$1;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/belkin/cordova/plugin/DevicePlugin$1;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;)V

    invoke-interface {v4, v5}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 244
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    const/4 v6, 0x1

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 245
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 246
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 247
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_0

    .line 251
    :sswitch_2
    new-instance v4, Lcom/belkin/cordova/plugin/DevicePlugin$2;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v4, v0, v1}, Lcom/belkin/cordova/plugin/DevicePlugin$2;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V

    invoke-static {v4}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 271
    :sswitch_3
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-virtual {v4}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getDeviceCache()Ljava/lang/String;

    move-result-object v70

    .line 272
    .local v70, "json":Ljava/lang/String;
    invoke-virtual/range {v70 .. v70}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_3

    new-instance v92, Lorg/json/JSONObject;

    invoke-direct/range {v92 .. v92}, Lorg/json/JSONObject;-><init>()V

    .line 273
    .local v92, "list":Lorg/json/JSONObject;
    :goto_2
    sput-object v92, Lcom/belkin/cordova/plugin/DevicePlugin;->mDummyDevices:Lorg/json/JSONObject;

    .line 274
    move-object/from16 v0, p3

    move-object/from16 v1, v92

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 276
    const-string v4, "WeMoSDK"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "DevicePlugin : add from cache "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v92 .. v92}, Lorg/json/JSONObject;->length()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformation()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v55

    .local v55, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_3
    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 280
    .local v35, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v4

    if-nez v4, :cond_2

    .line 281
    const-string v4, "WeMoSDK"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "DevicePlugin : find "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    const-string v4, "add"

    const-string v5, ""

    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5, v6}, Lcom/belkin/cordova/plugin/DevicePlugin;->onNotify(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 272
    .end local v35    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v55    # "i$":Ljava/util/Iterator;
    .end local v92    # "list":Lorg/json/JSONObject;
    :cond_3
    new-instance v92, Lorg/json/JSONObject;

    move-object/from16 v0, v92

    move-object/from16 v1, v70

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    goto :goto_2

    .line 288
    .end local v70    # "json":Ljava/lang/String;
    :sswitch_4
    if-eqz p3, :cond_1

    .line 289
    const/16 v106, 0x0

    .line 290
    .local v106, "pluginResult":Lorg/apache/cordova/PluginResult;
    invoke-static {}, Lcom/belkin/utils/RuleUtility;->doesRulesDBFileExist()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 291
    new-instance v106, Lorg/apache/cordova/PluginResult;

    .end local v106    # "pluginResult":Lorg/apache/cordova/PluginResult;
    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v106

    invoke-direct {v0, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 295
    .restart local v106    # "pluginResult":Lorg/apache/cordova/PluginResult;
    :goto_4
    move-object/from16 v0, p3

    move-object/from16 v1, v106

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 293
    :cond_4
    new-instance v106, Lorg/apache/cordova/PluginResult;

    .end local v106    # "pluginResult":Lorg/apache/cordova/PluginResult;
    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v106

    invoke-direct {v0, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .restart local v106    # "pluginResult":Lorg/apache/cordova/PluginResult;
    goto :goto_4

    .line 300
    .end local v106    # "pluginResult":Lorg/apache/cordova/PluginResult;
    :sswitch_5
    const-string v4, "DevicePlugin"

    const-string v5, "Inside ACTION_GET_WEMO_DEVICE_LIST"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    new-instance v93, Lorg/json/JSONObject;

    invoke-direct/range {v93 .. v93}, Lorg/json/JSONObject;-><init>()V

    .line 302
    .local v93, "listJSONObject":Lorg/json/JSONObject;
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformation()Ljava/util/ArrayList;

    move-result-object v149

    .line 303
    .local v149, "wemoDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz v149, :cond_c

    .line 306
    const/16 v67, 0x0

    .line 307
    .local v67, "isUpdated":Z
    const/16 v19, 0x0

    .line 309
    .local v19, "attemp":I
    :cond_5
    add-int/lit8 v19, v19, 0x1

    .line 310
    const-wide/16 v4, 0x3e8

    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    .line 311
    invoke-interface/range {v149 .. v149}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v55

    .restart local v55    # "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v144

    check-cast v144, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 312
    .local v144, "updateDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual/range {v144 .. v144}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-nez v4, :cond_6

    .line 313
    const/16 v67, 0x1

    .line 317
    .end local v144    # "updateDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_7
    const/4 v4, 0x5

    move/from16 v0, v19

    if-ge v0, v4, :cond_8

    if-eqz v67, :cond_5

    .line 323
    .end local v55    # "i$":Ljava/util/Iterator;
    :cond_8
    :goto_5
    invoke-interface/range {v149 .. v149}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v55

    .restart local v55    # "i$":Ljava/util/Iterator;
    :cond_9
    :goto_6
    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_c

    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 324
    .local v24, "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v4

    if-nez v4, :cond_9

    .line 325
    new-instance v68, Lorg/json/JSONObject;

    invoke-direct/range {v68 .. v68}, Lorg/json/JSONObject;-><init>()V

    .line 327
    .local v68, "itemJSONObject":Lorg/json/JSONObject;
    const-string v4, "friendlyName"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v68

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 328
    const-string v4, "type"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v68

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 329
    const-string v4, "udn"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v68

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 330
    const-string v4, "state"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v5

    move-object/from16 v0, v68

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 331
    const-string v4, "iconUrl"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIcon()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v68

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 333
    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Heater"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_a

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Humidifier"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_a

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    const-string v5, "AirPurifier"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_a

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    const-string v5, "CoffeeMaker"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_a

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Maker"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 336
    :cond_a
    const-string v4, "attributeList"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v5

    move-object/from16 v0, v68

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 341
    :cond_b
    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v93

    move-object/from16 v1, v68

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_6

    .line 318
    .end local v24    # "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v55    # "i$":Ljava/util/Iterator;
    .end local v68    # "itemJSONObject":Lorg/json/JSONObject;
    :catch_0
    move-exception v42

    .line 319
    .local v42, "e":Ljava/lang/InterruptedException;
    invoke-virtual/range {v42 .. v42}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_5

    .line 345
    .end local v19    # "attemp":I
    .end local v42    # "e":Ljava/lang/InterruptedException;
    .end local v67    # "isUpdated":Z
    :cond_c
    move-object/from16 v0, p3

    move-object/from16 v1, v93

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    goto/16 :goto_0

    .line 348
    .end local v93    # "listJSONObject":Lorg/json/JSONObject;
    .end local v149    # "wemoDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    :sswitch_6
    new-instance v4, Lcom/belkin/cordova/plugin/DevicePlugin$3;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v4, v0, v1}, Lcom/belkin/cordova/plugin/DevicePlugin$3;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V

    invoke-static {v4}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 369
    :sswitch_7
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_RESET_ACTIVE_DEVICELIST"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 370
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    if-eqz v4, :cond_1

    .line 372
    :try_start_1
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-virtual {v4}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getActiveDeviceList()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_0

    .line 373
    :catch_1
    move-exception v42

    .line 374
    .local v42, "e":Ljava/lang/Exception;
    invoke-virtual/range {v42 .. v42}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 379
    .end local v42    # "e":Ljava/lang/Exception;
    :sswitch_8
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v4

    new-instance v5, Lcom/belkin/cordova/plugin/DevicePlugin$4;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/belkin/cordova/plugin/DevicePlugin$4;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;)V

    invoke-interface {v4, v5}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 404
    :sswitch_9
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v140

    .line 405
    .local v140, "udn":Ljava/lang/String;
    if-eqz v140, :cond_f

    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    if-eqz v4, :cond_f

    .line 406
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    move-object/from16 v0, v140

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getWeMoDeviceByUDN(Ljava/lang/String;)Lcom/belkin/wemo/localsdk/WeMoDevice;

    move-result-object v4

    if-nez v4, :cond_e

    .line 407
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mDummyDevices:Lorg/json/JSONObject;

    if-eqz v4, :cond_d

    .line 408
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mDummyDevices:Lorg/json/JSONObject;

    move-object/from16 v0, v140

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 416
    :goto_7
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 410
    :cond_d
    const-string v4, "Device Plugin Error"

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 414
    :cond_e
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->removeWeMoDeviceByUDN(Ljava/lang/String;)Z

    goto :goto_7

    .line 418
    :cond_f
    const-string v4, "Device Plugin Error"

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 423
    .end local v140    # "udn":Ljava/lang/String;
    :sswitch_a
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v141

    .line 424
    .local v141, "udn1":Ljava/lang/String;
    const-string v4, "-"

    move-object/from16 v0, v141

    invoke-virtual {v0, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual/range {v141 .. v141}, Ljava/lang/String;->length()I

    move-result v5

    move-object/from16 v0, v141

    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v121

    .line 425
    .local v121, "serialNumber":Ljava/lang/String;
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v4

    move-object/from16 v0, v121

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/storage/FileStorage;->getDefaultIconFileUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 428
    .end local v121    # "serialNumber":Ljava/lang/String;
    .end local v141    # "udn1":Ljava/lang/String;
    :sswitch_b
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_STOP_CONTROL_POINT"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 429
    invoke-static {}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getWeMoSDKInstance()Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    move-result-object v4

    sput-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    .line 430
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    if-eqz v4, :cond_10

    .line 431
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-virtual {v4}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->stop()V

    .line 432
    :cond_10
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 433
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 434
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 436
    const/4 v4, 0x0

    sput-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    goto/16 :goto_0

    .line 440
    :sswitch_c
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    const/4 v5, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->setDeviceState(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 443
    :sswitch_d
    const-string v4, "DevicePlugin"

    const-string v5, "device listeners start"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 444
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v4, :cond_11

    .line 445
    const-string v4, "Device list listener already running."

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 446
    const/4 v4, 0x1

    goto/16 :goto_1

    .line 448
    :cond_11
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cordova/plugin/DevicePlugin;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 449
    move-object/from16 v137, p0

    .line 452
    .local v137, "tmpDP":Lcom/belkin/cordova/plugin/DevicePlugin;
    new-instance v61, Landroid/content/IntentFilter;

    invoke-direct/range {v61 .. v61}, Landroid/content/IntentFilter;-><init>()V

    .line 453
    .local v61, "intentFilter":Landroid/content/IntentFilter;
    const-string v4, "com.controller.belkin.hybrid.DEVICE_ADDED"

    move-object/from16 v0, v61

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 454
    const-string v4, "com.controller.belkin.hybrid.DEVICE_REMOVED"

    move-object/from16 v0, v61

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 455
    const-string v4, "com.controller.belkin.hybrid.STATE_CHANGED"

    move-object/from16 v0, v61

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 456
    const-string v4, "com.controller.belkin.hybrid.SET_INACTIVE_STATE"

    move-object/from16 v0, v61

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 457
    const-string v4, "com.controller.belkin.hybrid.SET_INACTIVE_STATE_ASYNC"

    move-object/from16 v0, v61

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 458
    const-string v4, "com.controller.belkin.hybrid.SET_UNAVAILABLE_STATE"

    move-object/from16 v0, v61

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 459
    const-string v4, "com.controller.belkin.hybrid.BRIDGE_DEVICES"

    move-object/from16 v0, v61

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 460
    const-string v4, "com.controller.belkin.hybrid.BRIDGE_DEVICES_STATUS"

    move-object/from16 v0, v61

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 461
    const-string v4, "SubDeviceFWUpdate"

    move-object/from16 v0, v61

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 462
    const-string v4, "FirmwareUpdateStatus"

    move-object/from16 v0, v61

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 463
    const-string v4, "CountdownEndTime"

    move-object/from16 v0, v61

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 464
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    if-nez v4, :cond_12

    .line 465
    const-string v4, "DevicePlugin"

    const-string v5, "create receiver"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 466
    new-instance v4, Lcom/belkin/cordova/plugin/DevicePlugin$5;

    move-object/from16 v0, p0

    move-object/from16 v1, v137

    invoke-direct {v4, v0, v1}, Lcom/belkin/cordova/plugin/DevicePlugin$5;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lcom/belkin/cordova/plugin/DevicePlugin;)V

    sput-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 672
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    move-object/from16 v0, v61

    invoke-virtual {v4, v5, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 674
    const/16 v150, 0x0

    .line 676
    .local v150, "wemoDeviceUDNS":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :try_start_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-virtual {v4}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getWeMoDeviceList()Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "deviceUdnList"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Ljava/util/ArrayList;

    move-object/from16 v150, v0
    :try_end_2
    .catch Lcom/belkin/exception/DatabaseException; {:try_start_2 .. :try_end_2} :catch_2

    .line 680
    :goto_8
    const/16 v54, 0x0

    .local v54, "i":I
    :goto_9
    invoke-virtual/range {v150 .. v150}, Ljava/util/ArrayList;->size()I

    move-result v4

    move/from16 v0, v54

    if-ge v0, v4, :cond_12

    .line 681
    const-string v5, "DevicePlugin"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "DevicePlugin : find and isisAvailable"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v150

    move/from16 v1, v54

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 682
    const-string v5, "add"

    const-string v6, ""

    move-object/from16 v0, v150

    move/from16 v1, v54

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6, v4}, Lcom/belkin/cordova/plugin/DevicePlugin;->onNotify(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 680
    add-int/lit8 v54, v54, 0x1

    goto :goto_9

    .line 677
    .end local v54    # "i":I
    :catch_2
    move-exception v42

    .line 678
    .local v42, "e":Lcom/belkin/exception/DatabaseException;
    const-string v4, "DevicePlugin"

    const-string v5, "Exception while getting UDN\'s from getWeMoDeviceList() :: "

    move-object/from16 v0, v42

    invoke-static {v4, v5, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_8

    .line 687
    .end local v42    # "e":Lcom/belkin/exception/DatabaseException;
    .end local v150    # "wemoDeviceUDNS":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_12
    new-instance v106, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v106

    invoke-direct {v0, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 688
    .restart local v106    # "pluginResult":Lorg/apache/cordova/PluginResult;
    const/4 v4, 0x1

    move-object/from16 v0, v106

    invoke-virtual {v0, v4}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 689
    move-object/from16 v0, p3

    move-object/from16 v1, v106

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 692
    .end local v61    # "intentFilter":Landroid/content/IntentFilter;
    .end local v106    # "pluginResult":Lorg/apache/cordova/PluginResult;
    .end local v137    # "tmpDP":Lcom/belkin/cordova/plugin/DevicePlugin;
    :sswitch_e
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_STOP_DEVICE_LISTENERS"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 694
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v4, :cond_13

    .line 696
    :try_start_3
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v4, v5}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 697
    const/4 v4, 0x0

    sput-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 702
    :goto_a
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 703
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 704
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    invoke-virtual {v4, v5}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 705
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 706
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 698
    :catch_3
    move-exception v42

    .line 699
    .local v42, "e":Ljava/lang/Exception;
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error unregistering device listener: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v42 .. v42}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_a

    .line 708
    .end local v42    # "e":Ljava/lang/Exception;
    :cond_13
    const/4 v4, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto/16 :goto_0

    .line 714
    :sswitch_f
    const-string v4, "DevicePlugin"

    const-string v5, "device listeners start"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 715
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v4, :cond_14

    .line 716
    const-string v4, "Device list listener already running."

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 717
    const/4 v4, 0x1

    goto/16 :goto_1

    .line 719
    :cond_14
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cordova/plugin/DevicePlugin;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 722
    new-instance v62, Landroid/content/IntentFilter;

    invoke-direct/range {v62 .. v62}, Landroid/content/IntentFilter;-><init>()V

    .line 723
    .local v62, "intentFilterLed":Landroid/content/IntentFilter;
    const-string v4, "com.controller.belkin.hybrid.BRIDGE_DEVICES"

    move-object/from16 v0, v62

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 724
    const-string v4, "com.controller.belkin.hybrid.BRIDGE_DEVICES_STATUS"

    move-object/from16 v0, v62

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 725
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    if-nez v4, :cond_17

    .line 726
    const-string v4, "DevicePlugin"

    const-string v5, "create receiver"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 727
    new-instance v4, Lcom/belkin/cordova/plugin/DevicePlugin$6;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Lcom/belkin/cordova/plugin/DevicePlugin$6;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;)V

    sput-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 742
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    move-object/from16 v0, v62

    invoke-virtual {v4, v5, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 743
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v4, :cond_15

    .line 744
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v4

    sput-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 745
    :cond_15
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformation()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v55

    .restart local v55    # "i$":Ljava/util/Iterator;
    :cond_16
    :goto_b
    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_17

    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 746
    .restart local v35    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v4

    if-nez v4, :cond_16

    .line 747
    const-string v4, "WeMoSDK"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "DevicePlugin : find "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 748
    const-string v4, "add"

    const-string v5, ""

    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5, v6}, Lcom/belkin/cordova/plugin/DevicePlugin;->onNotify(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_b

    .line 754
    .end local v35    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v55    # "i$":Ljava/util/Iterator;
    :cond_17
    new-instance v105, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v105

    invoke-direct {v0, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 755
    .local v105, "pluginLedResult":Lorg/apache/cordova/PluginResult;
    const/4 v4, 0x1

    move-object/from16 v0, v105

    invoke-virtual {v0, v4}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 756
    move-object/from16 v0, p3

    move-object/from16 v1, v105

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 761
    .end local v62    # "intentFilterLed":Landroid/content/IntentFilter;
    .end local v105    # "pluginLedResult":Lorg/apache/cordova/PluginResult;
    :sswitch_10
    :try_start_4
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "set friendly name for udn::: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 762
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    new-instance v7, Ljava/lang/String;

    const/4 v8, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v8}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    const/16 v151, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v151

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v151

    invoke-virtual/range {v151 .. v151}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v151

    aput-object v151, v8, v9

    invoke-virtual {v6, v7, v8}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setFriendlyName(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v6

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 763
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 764
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 765
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto/16 :goto_0

    .line 766
    :catch_4
    move-exception v42

    .line 767
    .restart local v42    # "e":Ljava/lang/Exception;
    invoke-virtual/range {v42 .. v42}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 772
    .end local v42    # "e":Ljava/lang/Exception;
    :sswitch_11
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v4

    new-instance v5, Lcom/belkin/cordova/plugin/DevicePlugin$7;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-direct {v5, v0, v1, v2}, Lcom/belkin/cordova/plugin/DevicePlugin$7;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v4, v5}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 788
    :sswitch_12
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ACTION_CLEAR_NAME_ICON_RULE: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 789
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->clearNameIconRule(Ljava/lang/String;)Z

    move-result v6

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 790
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 791
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 792
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 795
    :sswitch_13
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ACTION_CLEAR_NAME_ICON_RULE_REMOTE: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 796
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v5}, Lcom/belkin/utils/WiFiSecurityUtil;->generateAuthCode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v22

    .line 797
    .local v22, "authHeader":Ljava/lang/String;
    new-instance v112, Lcom/belkin/devices/ResetDevice;

    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v0, v112

    invoke-direct {v0, v4}, Lcom/belkin/devices/ResetDevice;-><init>(Landroid/content/Context;)V

    .line 798
    .local v112, "resetRemoteDevice":Lcom/belkin/devices/ResetDevice;
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, v112

    move-object/from16 v1, v22

    invoke-virtual {v0, v6, v7, v8, v1}, Lcom/belkin/devices/ResetDevice;->resetRemote(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 799
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 800
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 801
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 804
    .end local v22    # "authHeader":Ljava/lang/String;
    .end local v112    # "resetRemoteDevice":Lcom/belkin/devices/ResetDevice;
    :sswitch_14
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ACTION_RESET_TO_FACTORY_DEFAULT: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 805
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->resetPlugIn(Ljava/lang/String;)Z

    move-result v6

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 806
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 807
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 808
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 811
    :sswitch_15
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ACTION_CLEAR_USAGE_DATA: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 812
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    const-string v8, "4"

    invoke-virtual {v6, v7, v8}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->newOptionsReset(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 813
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 814
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 815
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 818
    :sswitch_16
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ACTION_RESET_WIFI_SETTINGS: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 819
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    const-string v8, "5"

    invoke-virtual {v6, v7, v8}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->newOptionsReset(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 820
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 821
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 822
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 825
    :sswitch_17
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_GET_WEMO_SSID"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 826
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getWeMoSSID(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 827
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 828
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 829
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 833
    :sswitch_18
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getNetworkType()Ljava/lang/String;

    move-result-object v100

    .line 834
    .local v100, "networkTypeS":Ljava/lang/String;
    if-eqz v100, :cond_18

    invoke-virtual/range {v100 .. v100}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_18

    .line 835
    move-object/from16 v0, p3

    move-object/from16 v1, v100

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    .line 841
    .end local v100    # "networkTypeS":Ljava/lang/String;
    :goto_c
    :sswitch_19
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v6

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 842
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 843
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 837
    .restart local v100    # "networkTypeS":Ljava/lang/String;
    :cond_18
    const-string v4, "Device Plugin error"

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_c

    .line 846
    .end local v100    # "networkTypeS":Ljava/lang/String;
    :sswitch_1a
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_READ_DB_FROM_PLUGIN"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 847
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/rules/impl/WeMoRulesFactory;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/rules/IWeMoRules;

    move-result-object v116

    .line 848
    .local v116, "rules":Lcom/belkin/wemo/rules/IWeMoRules;
    new-instance v25, Lcom/belkin/cordova/plugin/DevicePlugin$FetchDevicesRulesCallback;

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lcom/belkin/cordova/plugin/DevicePlugin$FetchDevicesRulesCallback;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V

    .line 849
    .local v25, "callback":Lcom/belkin/cordova/plugin/DevicePlugin$FetchDevicesRulesCallback;
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v0, v116

    move-object/from16 v1, v25

    move-object/from16 v2, v25

    invoke-interface {v0, v4, v1, v2}, Lcom/belkin/wemo/rules/IWeMoRules;->fetchRulesAndSyncDevices(Landroid/content/Context;Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncSuccessCallback;Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncErrorCallback;)V

    goto/16 :goto_0

    .line 853
    .end local v25    # "callback":Lcom/belkin/cordova/plugin/DevicePlugin$FetchDevicesRulesCallback;
    .end local v116    # "rules":Lcom/belkin/wemo/rules/IWeMoRules;
    :sswitch_1b
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_PUSH_DB_TO_PLUGIN"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 855
    new-instance v131, Lcom/belkin/cordova/plugin/DevicePlugin$StoreDeviceRulesCallback;

    move-object/from16 v0, v131

    move-object/from16 v1, p0

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lcom/belkin/cordova/plugin/DevicePlugin$StoreDeviceRulesCallback;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V

    .line 856
    .local v131, "storeDeviceRulesCallback":Lcom/belkin/cordova/plugin/DevicePlugin$StoreDeviceRulesCallback;
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/rules/impl/WeMoRulesFactory;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/rules/IWeMoRules;

    move-result-object v4

    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    move-object/from16 v0, v131

    move-object/from16 v1, v131

    invoke-interface {v4, v5, v6, v0, v1}, Lcom/belkin/wemo/rules/IWeMoRules;->storeRules(Landroid/content/Context;Ljava/util/HashMap;Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;)V

    goto/16 :goto_0

    .line 859
    .end local v131    # "storeDeviceRulesCallback":Lcom/belkin/cordova/plugin/DevicePlugin$StoreDeviceRulesCallback;
    :sswitch_1c
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_GET_PRAGA_VERSION"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 860
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getPragmaFromDB(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 863
    :sswitch_1d
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ACTION_SET_PRAGA_VERSION version: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 864
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v6

    invoke-virtual {v4, v5, v6}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setPragmaInDB(Landroid/content/Context;I)V

    .line 865
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 869
    :sswitch_1e
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_PUSH_LED_SCH_STR_TO_PLUGIN"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 870
    const/16 v4, 0x8

    new-array v0, v4, [Ljava/lang/String;

    move-object/from16 v147, v0

    .line 872
    .local v147, "weeklyRecordArray":[Ljava/lang/String;
    const/4 v4, 0x0

    const/4 v5, 0x7

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v147, v4

    .line 873
    const/16 v54, 0x0

    .restart local v54    # "i":I
    :goto_d
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    move/from16 v0, v54

    if-ge v0, v4, :cond_19

    .line 874
    add-int/lit8 v4, v54, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v54

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v147, v4

    .line 875
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "WEEKLY RECORD for Bridge: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v147, v54

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 873
    add-int/lit8 v54, v54, 0x1

    goto :goto_d

    .line 878
    :cond_19
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    const-string v5, "bridge"

    move-object/from16 v0, v147

    invoke-virtual {v4, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 881
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v55

    .restart local v55    # "i$":Ljava/util/Iterator;
    :goto_e
    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v46

    check-cast v46, Ljava/util/Map$Entry;

    .line 882
    .local v46, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;[Ljava/lang/String;>;"
    const-string v5, "DevicePlugin"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "weeklyRecordsHashMap LED ENTRY: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface/range {v46 .. v46}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ", "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface/range {v46 .. v46}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_e

    .line 887
    .end local v46    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;[Ljava/lang/String;>;"
    .end local v54    # "i":I
    .end local v55    # "i$":Ljava/util/Iterator;
    .end local v147    # "weeklyRecordArray":[Ljava/lang/String;
    :sswitch_1f
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_CREATE_CLOUD_REQUEST_FOR_SCHEDULE_STRING"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 888
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->clear()V

    .line 890
    if-eqz p2, :cond_25

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v4

    const/4 v5, 0x2

    if-lt v4, v5, :cond_25

    .line 891
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v80

    .line 892
    .local v80, "jsonStrCloud":Ljava/lang/String;
    const/4 v4, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v98

    .line 894
    .local v98, "macAndPluginJSONObjectStr":Ljava/lang/String;
    if-eqz v80, :cond_24

    if-eqz v98, :cond_24

    .line 895
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Length of JSON Object String received: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v80 .. v80}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 896
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Length of JSON Object String received for mac Addrs and Plugin IDs: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v98 .. v98}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 898
    new-instance v77, Lorg/json/JSONObject;

    move-object/from16 v0, v77

    move-object/from16 v1, v80

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 899
    .local v77, "jsonObjectCloud":Lorg/json/JSONObject;
    invoke-virtual/range {v77 .. v77}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v84

    .line 902
    .local v84, "keysCloud":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_f
    invoke-interface/range {v84 .. v84}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1e

    .line 903
    invoke-interface/range {v84 .. v84}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 904
    .local v13, "UDN":Ljava/lang/String;
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "UDN of device: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 905
    move-object/from16 v0, v77

    invoke-virtual {v0, v13}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v146

    .line 907
    .local v146, "weekdaysJSONArray":Lorg/json/JSONArray;
    const/16 v4, 0x8

    new-array v0, v4, [Ljava/lang/String;

    move-object/from16 v126, v0

    .line 909
    .local v126, "singleDeviceWeeklyCalendarArray":[Ljava/lang/String;
    const-string v4, "uuid"

    invoke-virtual {v13, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1b

    .line 910
    const/16 v54, 0x0

    .restart local v54    # "i":I
    :goto_10
    invoke-virtual/range {v146 .. v146}, Lorg/json/JSONArray;->length()I

    move-result v4

    const/4 v5, 0x7

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    move/from16 v0, v54

    if-ge v0, v4, :cond_1b

    .line 911
    move-object/from16 v0, v146

    move/from16 v1, v54

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v108

    .line 912
    .local v108, "record":Ljava/lang/String;
    const/16 v59, 0x0

    .line 913
    .local v59, "index":I
    if-nez v54, :cond_1a

    .line 914
    const/16 v59, 0x6

    .line 918
    :goto_11
    aput-object v108, v126, v59

    .line 919
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "WEEKLY RECORD at index: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, v59

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", is: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v108

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 910
    add-int/lit8 v54, v54, 0x1

    goto :goto_10

    .line 916
    :cond_1a
    add-int/lit8 v59, v54, -0x1

    goto :goto_11

    .line 923
    .end local v54    # "i":I
    .end local v59    # "index":I
    .end local v108    # "record":Ljava/lang/String;
    :cond_1b
    const/16 v148, 0x0

    .line 924
    .local v148, "weeklyRecordsHashMapKey":Ljava/lang/String;
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {v13, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "maker"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1c

    .line 925
    invoke-static {v13}, Lcom/belkin/wemo/utils/WeMoUtils;->getMakerUDNComparisonString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v148

    .line 930
    :goto_12
    const-string v4, "uuid"

    invoke-virtual {v13, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1d

    .line 931
    const/4 v4, 0x7

    aput-object v13, v126, v4

    .line 932
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    move-object/from16 v0, v148

    move-object/from16 v1, v126

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_f

    .line 927
    :cond_1c
    move-object/from16 v148, v13

    goto :goto_12

    .line 934
    :cond_1d
    const/4 v4, 0x0

    const-string v5, ""

    aput-object v5, v126, v4

    .line 935
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    move-object/from16 v0, v148

    move-object/from16 v1, v126

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_f

    .line 942
    .end local v13    # "UDN":Ljava/lang/String;
    .end local v126    # "singleDeviceWeeklyCalendarArray":[Ljava/lang/String;
    .end local v146    # "weekdaysJSONArray":Lorg/json/JSONArray;
    .end local v148    # "weeklyRecordsHashMapKey":Ljava/lang/String;
    :cond_1e
    new-instance v97, Lorg/json/JSONObject;

    invoke-direct/range {v97 .. v98}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 946
    .local v97, "macAndPluginJSONObject":Lorg/json/JSONObject;
    const-string v110, ""

    .line 948
    .local v110, "requests":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v55

    .restart local v55    # "i$":Ljava/util/Iterator;
    :cond_1f
    :goto_13
    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_23

    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v46

    check-cast v46, Ljava/util/Map$Entry;

    .line 950
    .restart local v46    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;[Ljava/lang/String;>;"
    invoke-interface/range {v46 .. v46}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v128

    check-cast v128, [Ljava/lang/String;

    .line 951
    .local v128, "singleWeeklyRecordArr":[Ljava/lang/String;
    invoke-interface/range {v46 .. v46}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v82

    check-cast v82, Ljava/lang/String;

    .line 953
    .local v82, "key":Ljava/lang/String;
    const/16 v26, 0x0

    .line 954
    .local v26, "dataArray":Lorg/json/JSONArray;
    :try_start_5
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    move-object/from16 v0, v82

    invoke-virtual {v0, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "maker"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_21

    .line 955
    const-string v4, "DevicePlugin"

    const-string v5, "Maker key encountered while iterating over weeklyRecordsHashMap for creating xml String for cloud request."

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 956
    invoke-virtual/range {v97 .. v97}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v73

    .line 957
    .local v73, "jsonKeysArray":Lorg/json/JSONArray;
    if-eqz v73, :cond_22

    .line 958
    const/16 v54, 0x0

    .restart local v54    # "i":I
    :goto_14
    invoke-virtual/range {v73 .. v73}, Lorg/json/JSONArray;->length()I

    move-result v4

    move/from16 v0, v54

    if-ge v0, v4, :cond_22

    .line 959
    move-object/from16 v0, v73

    move/from16 v1, v54

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 960
    .restart local v13    # "UDN":Ljava/lang/String;
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {v13, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "maker"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_20

    .line 962
    move-object/from16 v0, v97

    invoke-virtual {v0, v13}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v26

    .line 958
    :cond_20
    add-int/lit8 v54, v54, 0x1

    goto :goto_14

    .line 967
    .end local v13    # "UDN":Ljava/lang/String;
    .end local v54    # "i":I
    .end local v73    # "jsonKeysArray":Lorg/json/JSONArray;
    :cond_21
    move-object/from16 v0, v97

    move-object/from16 v1, v82

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v26

    .line 970
    :cond_22
    if-eqz v26, :cond_1f

    .line 971
    const/4 v4, 0x0

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v104

    .line 972
    .local v104, "pluginID":Ljava/lang/String;
    const/4 v4, 0x1

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v96

    .line 975
    .local v96, "macAddress":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v110

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "<plugin>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "<recipientid>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v104

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</recipientid>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "<macAddress>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v96

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</macAddress>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "<content>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "<![CDATA[<updateweeklycalendar>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "<mon>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x0

    aget-object v5, v128, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</mon>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "<tues>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x1

    aget-object v5, v128, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</tues>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "<wed>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x2

    aget-object v5, v128, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</wed>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "<thurs>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x3

    aget-object v5, v128, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</thurs>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "<fri>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x4

    aget-object v5, v128, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</fri>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "<sat>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x5

    aget-object v5, v128, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</sat>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "<sun>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x6

    aget-object v5, v128, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</sun>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</updateweeklycalendar>]]>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</content>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</plugin> "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_5

    move-result-object v110

    goto/16 :goto_13

    .line 993
    .end local v96    # "macAddress":Ljava/lang/String;
    .end local v104    # "pluginID":Ljava/lang/String;
    :catch_5
    move-exception v42

    .line 995
    .local v42, "e":Lorg/json/JSONException;
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "JSON Exception while reading mac and pluginID for UDN: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v82

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ". Moving on with the loop. "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v42

    invoke-static {v4, v5, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_13

    .line 1000
    .end local v26    # "dataArray":Lorg/json/JSONArray;
    .end local v42    # "e":Lorg/json/JSONException;
    .end local v46    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;[Ljava/lang/String;>;"
    .end local v82    # "key":Ljava/lang/String;
    .end local v128    # "singleWeeklyRecordArr":[Ljava/lang/String;
    :cond_23
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "<plugins>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v110

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</plugins>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v109

    .line 1002
    .local v109, "request":Ljava/lang/String;
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Update Weekly Calender Cloud Request XML: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v109

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1003
    if-eqz p3, :cond_1

    .line 1004
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v109

    invoke-direct {v4, v5, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 1007
    .end local v55    # "i$":Ljava/util/Iterator;
    .end local v77    # "jsonObjectCloud":Lorg/json/JSONObject;
    .end local v84    # "keysCloud":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v97    # "macAndPluginJSONObject":Lorg/json/JSONObject;
    .end local v109    # "request":Ljava/lang/String;
    .end local v110    # "requests":Ljava/lang/String;
    :cond_24
    if-eqz p3, :cond_1

    .line 1008
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 1014
    .end local v80    # "jsonStrCloud":Ljava/lang/String;
    .end local v98    # "macAndPluginJSONObjectStr":Ljava/lang/String;
    :cond_25
    if-eqz p3, :cond_1

    .line 1015
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 1020
    :sswitch_20
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_PUSH_SCH_STR_TO_PLUGIN"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1022
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v79

    .line 1023
    .local v79, "jsonStr":Ljava/lang/String;
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Length of JSON Object String received: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v79 .. v79}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1025
    new-instance v76, Lorg/json/JSONObject;

    move-object/from16 v0, v76

    move-object/from16 v1, v79

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1026
    .local v76, "jsonObject":Lorg/json/JSONObject;
    invoke-virtual/range {v76 .. v76}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v83

    .line 1029
    .local v83, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_15
    invoke-interface/range {v83 .. v83}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2b

    .line 1030
    invoke-interface/range {v83 .. v83}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 1031
    .restart local v13    # "UDN":Ljava/lang/String;
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "UDN of device: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1032
    move-object/from16 v0, v76

    invoke-virtual {v0, v13}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v146

    .line 1034
    .restart local v146    # "weekdaysJSONArray":Lorg/json/JSONArray;
    const/16 v4, 0x8

    new-array v0, v4, [Ljava/lang/String;

    move-object/from16 v126, v0

    .line 1036
    .restart local v126    # "singleDeviceWeeklyCalendarArray":[Ljava/lang/String;
    const-string v4, "uuid"

    invoke-virtual {v13, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_27

    .line 1037
    const/16 v54, 0x0

    .restart local v54    # "i":I
    :goto_16
    invoke-virtual/range {v146 .. v146}, Lorg/json/JSONArray;->length()I

    move-result v4

    const/4 v5, 0x7

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    move/from16 v0, v54

    if-ge v0, v4, :cond_27

    .line 1038
    move-object/from16 v0, v146

    move/from16 v1, v54

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v108

    .line 1039
    .restart local v108    # "record":Ljava/lang/String;
    const/16 v59, 0x0

    .line 1040
    .restart local v59    # "index":I
    if-nez v54, :cond_26

    .line 1041
    const/16 v59, 0x6

    .line 1045
    :goto_17
    aput-object v108, v126, v59

    .line 1046
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "WEEKLY RECORD at index: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, v59

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", is: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v108

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1037
    add-int/lit8 v54, v54, 0x1

    goto :goto_16

    .line 1043
    :cond_26
    add-int/lit8 v59, v54, -0x1

    goto :goto_17

    .line 1050
    .end local v54    # "i":I
    .end local v59    # "index":I
    .end local v108    # "record":Ljava/lang/String;
    :cond_27
    const/16 v148, 0x0

    .line 1051
    .restart local v148    # "weeklyRecordsHashMapKey":Ljava/lang/String;
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {v13, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "maker"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_28

    .line 1052
    invoke-static {v13}, Lcom/belkin/wemo/utils/WeMoUtils;->getMakerUDNComparisonString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v148

    .line 1059
    :goto_18
    const-string v4, "uuid"

    invoke-virtual {v13, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2a

    .line 1060
    const/4 v4, 0x7

    aput-object v13, v126, v4

    .line 1061
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    move-object/from16 v0, v148

    move-object/from16 v1, v126

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_15

    .line 1053
    :cond_28
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {v13, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "bridge"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 1054
    const-string v148, "bridge"

    goto :goto_18

    .line 1056
    :cond_29
    move-object/from16 v148, v13

    goto :goto_18

    .line 1063
    :cond_2a
    const/4 v4, 0x0

    const-string v5, ""

    aput-object v5, v126, v4

    .line 1064
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    move-object/from16 v0, v148

    move-object/from16 v1, v126

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_15

    .line 1068
    .end local v13    # "UDN":Ljava/lang/String;
    .end local v126    # "singleDeviceWeeklyCalendarArray":[Ljava/lang/String;
    .end local v146    # "weekdaysJSONArray":Lorg/json/JSONArray;
    .end local v148    # "weeklyRecordsHashMapKey":Ljava/lang/String;
    :cond_2b
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v55

    :cond_2c
    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2d

    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v46

    check-cast v46, Ljava/util/Map$Entry;

    .line 1069
    .restart local v46    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;[Ljava/lang/String;>;"
    const-string v5, "DevicePlugin"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "weeklyRecordsHashMap for device: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface/range {v46 .. v46}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ", "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface/range {v46 .. v46}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1070
    invoke-interface/range {v46 .. v46}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, [Ljava/lang/String;

    .local v17, "arr$":[Ljava/lang/String;
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v89, v0

    .local v89, "len$":I
    const/16 v56, 0x0

    .local v56, "i$":I
    :goto_19
    move/from16 v0, v56

    move/from16 v1, v89

    if-ge v0, v1, :cond_2c

    aget-object v145, v17, v56

    .line 1071
    .local v145, "value":Ljava/lang/String;
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "weeklyRecordsHashMap Entry: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v145

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1070
    add-int/lit8 v56, v56, 0x1

    goto :goto_19

    .line 1074
    .end local v17    # "arr$":[Ljava/lang/String;
    .end local v46    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;[Ljava/lang/String;>;"
    .end local v56    # "i$":I
    .end local v89    # "len$":I
    .end local v145    # "value":Ljava/lang/String;
    :cond_2d
    if-eqz p3, :cond_1

    .line 1075
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 1079
    .end local v76    # "jsonObject":Lorg/json/JSONObject;
    .end local v79    # "jsonStr":Ljava/lang/String;
    .end local v83    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :sswitch_21
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_GET_DB_CONTENT"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1080
    new-instance v4, Lcom/belkin/utils/RuleUtility;

    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4}, Lcom/belkin/utils/RuleUtility;->getDBInBase64Encoding()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1083
    :sswitch_22
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_DELETE_WEEKLY_CALENDAR"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1084
    const/4 v4, 0x2

    new-array v0, v4, [Ljava/lang/String;

    move-object/from16 v32, v0

    .line 1085
    .local v32, "deleteRecord":[Ljava/lang/String;
    const/16 v54, 0x0

    .restart local v54    # "i":I
    :goto_1a
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v4

    move/from16 v0, v54

    if-ge v0, v4, :cond_2e

    .line 1086
    move-object/from16 v0, p2

    move/from16 v1, v54

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v32, v54

    .line 1085
    add-int/lit8 v54, v54, 0x1

    goto :goto_1a

    .line 1088
    :cond_2e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-object/from16 v0, v32

    invoke-virtual {v4, v0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->deleteWeeklyCalendarString([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1091
    .end local v32    # "deleteRecord":[Ljava/lang/String;
    .end local v54    # "i":I
    :sswitch_23
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ACTION_SIMULATED_RULE_DATA.... "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1093
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v143

    .line 1097
    .local v143, "udnList":Lorg/json/JSONArray;
    new-instance v125, Ljava/util/ArrayList;

    invoke-direct/range {v125 .. v125}, Ljava/util/ArrayList;-><init>()V

    .line 1098
    .local v125, "simulatedRuleDataUdnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/16 v54, 0x0

    .restart local v54    # "i":I
    :goto_1b
    invoke-virtual/range {v143 .. v143}, Lorg/json/JSONArray;->length()I

    move-result v4

    move/from16 v0, v54

    if-ge v0, v4, :cond_32

    .line 1099
    move-object/from16 v0, v143

    move/from16 v1, v54

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v127

    .line 1100
    .local v127, "singleUdn":Ljava/lang/String;
    const-string v4, "Bridge"

    move-object/from16 v0, v127

    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_31

    .line 1101
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v4

    move-object/from16 v0, v127

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v33

    .line 1102
    .local v33, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v33, :cond_30

    .line 1103
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v4

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v4

    invoke-interface {v4}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v4

    invoke-virtual/range {v33 .. v33}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getFirmwareVersionRevisionNumber(Ljava/lang/String;)I

    move-result v115

    .line 1104
    .local v115, "revisionNumber":I
    const/16 v4, 0x2968

    move/from16 v0, v115

    if-ge v0, v4, :cond_2f

    .line 1105
    move-object/from16 v0, v125

    move-object/from16 v1, v127

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1098
    .end local v33    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v115    # "revisionNumber":I
    :goto_1c
    add-int/lit8 v54, v54, 0x1

    goto :goto_1b

    .line 1107
    .restart local v33    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v115    # "revisionNumber":I
    :cond_2f
    const-string v4, ""

    move-object/from16 v0, v125

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    .line 1110
    .end local v115    # "revisionNumber":I
    :cond_30
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "DeviceInformation Object is NULL for UDN: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v127

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1111
    move-object/from16 v0, v125

    move-object/from16 v1, v127

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    .line 1114
    .end local v33    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_31
    const-string v4, "DevicePlugin"

    const-string v5, "Bridge Support TargetDevices Table "

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1115
    const-string v4, ""

    move-object/from16 v0, v125

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    .line 1118
    .end local v127    # "singleUdn":Ljava/lang/String;
    :cond_32
    invoke-interface/range {v125 .. v125}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/String;

    move-object/from16 v0, v125

    invoke-interface {v0, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v123

    check-cast v123, [Ljava/lang/String;

    .line 1119
    .local v123, "simulatedRuleDataUDNArray":[Ljava/lang/String;
    new-instance v124, Lorg/json/JSONArray;

    invoke-direct/range {v124 .. v125}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    .line 1120
    .local v124, "simulatedRuleDataUdnJA":Lorg/json/JSONArray;
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "List of UDNs to send SIMULATED RULE DATA Action: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v124 .. v124}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1122
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v4

    if-eqz v4, :cond_34

    .line 1123
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-object/from16 v0, v123

    invoke-virtual {v4, v0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->simulatedRuleDataAction([Ljava/lang/String;)Z

    move-result v65

    .line 1124
    .local v65, "isSuccess":Z
    if-eqz v65, :cond_33

    .line 1125
    move-object/from16 v0, p3

    move-object/from16 v1, v124

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 1127
    :cond_33
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 1130
    .end local v65    # "isSuccess":Z
    :cond_34
    new-instance v4, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    new-instance v5, Lcom/belkin/wemo/cache/cloud/CloudRequestSimulatedRuleData;

    sget-object v6, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    new-instance v7, Lcom/belkin/cordova/plugin/DevicePlugin$8;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, v124

    invoke-direct {v7, v0, v1, v2}, Lcom/belkin/cordova/plugin/DevicePlugin$8;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;Lorg/json/JSONArray;)V

    move-object/from16 v0, v123

    invoke-direct {v5, v6, v0, v7}, Lcom/belkin/wemo/cache/cloud/CloudRequestSimulatedRuleData;-><init>(Landroid/content/Context;[Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto/16 :goto_0

    .line 1148
    .end local v54    # "i":I
    .end local v123    # "simulatedRuleDataUDNArray":[Ljava/lang/String;
    .end local v124    # "simulatedRuleDataUdnJA":Lorg/json/JSONArray;
    .end local v125    # "simulatedRuleDataUdnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v143    # "udnList":Lorg/json/JSONArray;
    :sswitch_24
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_SET_NOTIFY_MESSAGE"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1149
    const/4 v4, 0x4

    new-array v0, v4, [Ljava/lang/String;

    move-object/from16 v102, v0

    .line 1150
    .local v102, "notifyMessage":[Ljava/lang/String;
    const/16 v54, 0x0

    .restart local v54    # "i":I
    :goto_1d
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v4

    move/from16 v0, v54

    if-ge v0, v4, :cond_35

    const/4 v4, 0x4

    move/from16 v0, v54

    if-ge v0, v4, :cond_35

    .line 1151
    move-object/from16 v0, p2

    move/from16 v1, v54

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v102, v54

    .line 1150
    add-int/lit8 v54, v54, 0x1

    goto :goto_1d

    .line 1153
    :cond_35
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-object/from16 v0, v102

    invoke-virtual {v4, v0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setNotifyMessage([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v136

    .line 1154
    .local v136, "tmp":Ljava/lang/String;
    move-object/from16 v0, p3

    move-object/from16 v1, v136

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1157
    .end local v54    # "i":I
    .end local v102    # "notifyMessage":[Ljava/lang/String;
    .end local v136    # "tmp":Ljava/lang/String;
    :sswitch_25
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_DELETE_NOTIFY_RULE"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1158
    const/4 v4, 0x2

    new-array v0, v4, [Ljava/lang/String;

    move-object/from16 v103, v0

    .line 1159
    .local v103, "notifyRule":[Ljava/lang/String;
    const/16 v54, 0x0

    .restart local v54    # "i":I
    :goto_1e
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v4

    move/from16 v0, v54

    if-ge v0, v4, :cond_36

    const/4 v4, 0x2

    move/from16 v0, v54

    if-ge v0, v4, :cond_36

    .line 1160
    move-object/from16 v0, p2

    move/from16 v1, v54

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v103, v54

    .line 1159
    add-int/lit8 v54, v54, 0x1

    goto :goto_1e

    .line 1162
    :cond_36
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-object/from16 v0, v103

    invoke-virtual {v4, v0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->deleteNotifyRule([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v138

    .line 1163
    .local v138, "tmpRule":Ljava/lang/String;
    move-object/from16 v0, p3

    move-object/from16 v1, v138

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1167
    .end local v54    # "i":I
    .end local v103    # "notifyRule":[Ljava/lang/String;
    .end local v138    # "tmpRule":Ljava/lang/String;
    :sswitch_26
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_EDIT_WEEKLY_CALENDER"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1168
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v34

    .line 1169
    .local v34, "dev_udn":Ljava/lang/String;
    const/4 v4, 0x2

    new-array v0, v4, [Ljava/lang/String;

    move-object/from16 v45, v0

    .line 1170
    .local v45, "editWeekly":[Ljava/lang/String;
    const/4 v4, 0x0

    const-string v5, "2"

    aput-object v5, v45, v4

    .line 1171
    const/4 v4, 0x1

    aput-object v34, v45, v4

    .line 1172
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->weeklyRecordsHashMap:Ljava/util/HashMap;

    move-object/from16 v0, v34

    move-object/from16 v1, v45

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1174
    if-eqz p3, :cond_1

    .line 1175
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 1181
    .end local v34    # "dev_udn":Ljava/lang/String;
    .end local v45    # "editWeekly":[Ljava/lang/String;
    :sswitch_27
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_SELECT_SWITCHES"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1182
    new-instance v81, Lorg/json/JSONArray;

    invoke-direct/range {v81 .. v81}, Lorg/json/JSONArray;-><init>()V

    .line 1183
    .local v81, "jsonSwitchesArray":Lorg/json/JSONArray;
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformation()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v55

    .restart local v55    # "i$":Ljava/util/Iterator;
    :cond_37
    :goto_1f
    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_39

    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 1184
    .restart local v24    # "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    new-instance v133, Lorg/json/JSONObject;

    invoke-direct/range {v133 .. v133}, Lorg/json/JSONObject;-><init>()V

    .line 1185
    .local v133, "switchJsonObject":Lorg/json/JSONObject;
    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v4

    const-string v5, "urn:Belkin:device:controllee:1"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_38

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v4

    const-string v5, "urn:Belkin:device:lightswitch:1"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_37

    :cond_38
    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v4

    if-nez v4, :cond_37

    .line 1187
    const-string v4, "friendlyName"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v133

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1188
    const-string v4, "udn"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v133

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1189
    const-string v4, "ProductName"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getProductName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v133

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1190
    move-object/from16 v0, v81

    move-object/from16 v1, v133

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1f

    .line 1193
    .end local v24    # "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v133    # "switchJsonObject":Lorg/json/JSONObject;
    :cond_39
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Rules device list - List of switches returned: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v81 .. v81}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1194
    move-object/from16 v0, p3

    move-object/from16 v1, v81

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 1197
    .end local v55    # "i$":Ljava/util/Iterator;
    .end local v81    # "jsonSwitchesArray":Lorg/json/JSONArray;
    :sswitch_28
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_SELECT_LIGHT_SWITCHES"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1198
    new-instance v90, Lorg/json/JSONArray;

    invoke-direct/range {v90 .. v90}, Lorg/json/JSONArray;-><init>()V

    .line 1199
    .local v90, "lightSwicthesJA":Lorg/json/JSONArray;
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformation()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v55

    .restart local v55    # "i$":Ljava/util/Iterator;
    :cond_3a
    :goto_20
    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3b

    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 1200
    .restart local v24    # "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    new-instance v91, Lorg/json/JSONObject;

    invoke-direct/range {v91 .. v91}, Lorg/json/JSONObject;-><init>()V

    .line 1201
    .local v91, "lightSwitchJO":Lorg/json/JSONObject;
    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v4

    const-string v5, "urn:Belkin:device:lightswitch:1"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3a

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v4

    if-nez v4, :cond_3a

    .line 1202
    const-string v4, "friendlyName"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v91

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1203
    const-string v4, "udn"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v91

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1204
    const-string v4, "ProductName"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getProductName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v91

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1205
    invoke-virtual/range {v90 .. v91}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_20

    .line 1208
    .end local v24    # "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v91    # "lightSwitchJO":Lorg/json/JSONObject;
    :cond_3b
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Rules device list - List of active light switches returned: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v90 .. v90}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1209
    move-object/from16 v0, p3

    move-object/from16 v1, v90

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 1212
    .end local v55    # "i$":Ljava/util/Iterator;
    .end local v90    # "lightSwicthesJA":Lorg/json/JSONArray;
    :sswitch_29
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_GET_LONG_PRESS_LIGHT_SWICTHES"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1213
    new-instance v94, Lorg/json/JSONArray;

    invoke-direct/range {v94 .. v94}, Lorg/json/JSONArray;-><init>()V

    .line 1214
    .local v94, "longPressLSJA":Lorg/json/JSONArray;
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformation()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v55

    .restart local v55    # "i$":Ljava/util/Iterator;
    :cond_3c
    :goto_21
    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3d

    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 1216
    .restart local v24    # "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v4

    const-string v5, "urn:Belkin:device:lightswitch:1"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3c

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v4

    if-nez v4, :cond_3c

    .line 1219
    invoke-static/range {v24 .. v24}, Lcom/belkin/wemo/rules/util/RuleUtility;->isLongPressRuleSupportedLS(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z

    move-result v64

    .line 1220
    .local v64, "isLongPressRuleSupported":Z
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ACTION_GET_LONG_PRESS_LIGHT_SWICTHES: UDN: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; Is Long Press Rule Supported: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, v64

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1222
    if-eqz v64, :cond_3c

    .line 1223
    new-instance v91, Lorg/json/JSONObject;

    invoke-direct/range {v91 .. v91}, Lorg/json/JSONObject;-><init>()V

    .line 1224
    .restart local v91    # "lightSwitchJO":Lorg/json/JSONObject;
    const-string v4, "friendlyName"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v91

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1225
    const-string v4, "udn"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v91

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1226
    const-string v4, "ProductName"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getProductName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v91

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1227
    move-object/from16 v0, v94

    move-object/from16 v1, v91

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_21

    .line 1231
    .end local v24    # "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v64    # "isLongPressRuleSupported":Z
    .end local v91    # "lightSwitchJO":Lorg/json/JSONObject;
    :cond_3d
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Rules device list - List of active light switches, supporting Long Press Rule, returned: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v94 .. v94}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1232
    move-object/from16 v0, p3

    move-object/from16 v1, v94

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 1235
    .end local v55    # "i$":Ljava/util/Iterator;
    .end local v94    # "longPressLSJA":Lorg/json/JSONArray;
    :sswitch_2a
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_SELECT_DIMMERS"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1236
    new-instance v71, Lorg/json/JSONArray;

    invoke-direct/range {v71 .. v71}, Lorg/json/JSONArray;-><init>()V

    .line 1237
    .local v71, "jsonDimmerArray":Lorg/json/JSONArray;
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformation()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v55

    .restart local v55    # "i$":Ljava/util/Iterator;
    :cond_3e
    :goto_22
    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3f

    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 1238
    .restart local v24    # "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    new-instance v41, Lorg/json/JSONObject;

    invoke-direct/range {v41 .. v41}, Lorg/json/JSONObject;-><init>()V

    .line 1239
    .local v41, "dimmerJsonObject":Lorg/json/JSONObject;
    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v4

    const-string v5, "urn:Belkin:device:dimmer:1"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3e

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v4

    if-nez v4, :cond_3e

    .line 1240
    const-string v4, "friendlyName"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v41

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1241
    const-string v4, "udn"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v41

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1242
    const-string v4, "ProductName"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getProductName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v41

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1243
    move-object/from16 v0, v71

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_22

    .line 1246
    .end local v24    # "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v41    # "dimmerJsonObject":Lorg/json/JSONObject;
    :cond_3f
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Rules device list - List of dimmers returned: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v71 .. v71}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1247
    move-object/from16 v0, p3

    move-object/from16 v1, v71

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 1250
    .end local v55    # "i$":Ljava/util/Iterator;
    .end local v71    # "jsonDimmerArray":Lorg/json/JSONArray;
    :sswitch_2b
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_SELECT_SENSORS"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1251
    new-instance v78, Lorg/json/JSONArray;

    invoke-direct/range {v78 .. v78}, Lorg/json/JSONArray;-><init>()V

    .line 1252
    .local v78, "jsonSensorObject":Lorg/json/JSONArray;
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformation()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v55

    .restart local v55    # "i$":Ljava/util/Iterator;
    :cond_40
    :goto_23
    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_42

    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 1253
    .restart local v24    # "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    new-instance v118, Lorg/json/JSONObject;

    invoke-direct/range {v118 .. v118}, Lorg/json/JSONObject;-><init>()V

    .line 1254
    .local v118, "sensorJsonObject":Lorg/json/JSONObject;
    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v4

    const-string v5, "urn:Belkin:device:sensor:1"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_41

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v4

    const-string v5, "urn:Belkin:device:NetCamSensor:1"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_40

    :cond_41
    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v4

    if-nez v4, :cond_40

    .line 1256
    const-string v4, "friendlyName"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v118

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1257
    const-string v4, "udn"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v118

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1258
    const-string v4, "ProductName"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getProductName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v118

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1259
    move-object/from16 v0, v78

    move-object/from16 v1, v118

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_23

    .line 1262
    .end local v24    # "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v118    # "sensorJsonObject":Lorg/json/JSONObject;
    :cond_42
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Rules device list - List of sensors returned: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v78 .. v78}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1263
    move-object/from16 v0, p3

    move-object/from16 v1, v78

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 1267
    .end local v55    # "i$":Ljava/util/Iterator;
    .end local v78    # "jsonSensorObject":Lorg/json/JSONArray;
    :sswitch_2c
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_SELECT_INSIGHTS"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1268
    new-instance v72, Lorg/json/JSONArray;

    invoke-direct/range {v72 .. v72}, Lorg/json/JSONArray;-><init>()V

    .line 1269
    .local v72, "jsonInsightsObject":Lorg/json/JSONArray;
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformation()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v55

    .restart local v55    # "i$":Ljava/util/Iterator;
    :cond_43
    :goto_24
    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_44

    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 1270
    .restart local v24    # "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    new-instance v118, Lorg/json/JSONObject;

    invoke-direct/range {v118 .. v118}, Lorg/json/JSONObject;-><init>()V

    .line 1271
    .restart local v118    # "sensorJsonObject":Lorg/json/JSONObject;
    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v4

    const-string v5, "urn:Belkin:device:insight:1"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_43

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v4

    if-nez v4, :cond_43

    .line 1272
    const-string v4, "friendlyName"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v118

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1273
    const-string v4, "udn"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v118

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1274
    const-string v4, "ProductName"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getProductName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v118

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1275
    move-object/from16 v0, v72

    move-object/from16 v1, v118

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_24

    .line 1278
    .end local v24    # "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v118    # "sensorJsonObject":Lorg/json/JSONObject;
    :cond_44
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Rules device list - List of insights returned: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v72 .. v72}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1279
    move-object/from16 v0, p3

    move-object/from16 v1, v72

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 1282
    .end local v55    # "i$":Ljava/util/Iterator;
    .end local v72    # "jsonInsightsObject":Lorg/json/JSONArray;
    :sswitch_2d
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_SELECT_MAKERS"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1283
    new-instance v74, Lorg/json/JSONArray;

    invoke-direct/range {v74 .. v74}, Lorg/json/JSONArray;-><init>()V

    .line 1284
    .local v74, "jsonMakerArray":Lorg/json/JSONArray;
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformation()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v55

    .restart local v55    # "i$":Ljava/util/Iterator;
    :cond_45
    :goto_25
    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_47

    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 1285
    .restart local v35    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v4

    const-string v5, "urn:Belkin:device:Maker:1"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_45

    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v4

    if-nez v4, :cond_45

    .line 1287
    new-instance v99, Lorg/json/JSONObject;

    invoke-direct/range {v99 .. v99}, Lorg/json/JSONObject;-><init>()V

    .line 1288
    .local v99, "makerJsonObject":Lorg/json/JSONObject;
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ACTION_SELECT_MAKERS FW--> "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1289
    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v49

    .line 1290
    .local v49, "fwVersion":Ljava/lang/String;
    if-eqz v49, :cond_46

    const-string v4, ""

    move-object/from16 v0, v49

    if-eq v0, v4, :cond_46

    .line 1291
    const-string v4, "\\."

    move-object/from16 v0, v49

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v47

    .line 1292
    .local v47, "firmWareNumber":[Ljava/lang/String;
    const-string v4, "firmwareVersion"

    const/4 v5, 0x2

    aget-object v5, v47, v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, v99

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 1293
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ACTION_SELECT_MAKERS FW number--> "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x2

    aget-object v6, v47, v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1295
    .end local v47    # "firmWareNumber":[Ljava/lang/String;
    :cond_46
    const-string v4, "friendlyName"

    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v99

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1296
    const-string v4, "udn"

    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v99

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1297
    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v21

    .line 1298
    .local v21, "attributeObj":Lorg/json/JSONObject;
    const-string v4, "switchMode"

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v75

    check-cast v75, Lorg/json/JSONObject;

    .line 1299
    .local v75, "jsonObj":Lorg/json/JSONObject;
    const-string v4, "SwitchMode"

    const-string v5, "value"

    move-object/from16 v0, v75

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v0, v99

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1300
    const-string v4, "sensorPresent"

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v75

    .end local v75    # "jsonObj":Lorg/json/JSONObject;
    check-cast v75, Lorg/json/JSONObject;

    .line 1301
    .restart local v75    # "jsonObj":Lorg/json/JSONObject;
    const-string v4, "SensorPresent"

    const-string v5, "value"

    move-object/from16 v0, v75

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v0, v99

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1302
    const-string v4, "ProductName"

    invoke-virtual/range {v35 .. v35}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getProductName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v99

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1303
    move-object/from16 v0, v74

    move-object/from16 v1, v99

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto/16 :goto_25

    .line 1306
    .end local v21    # "attributeObj":Lorg/json/JSONObject;
    .end local v35    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v49    # "fwVersion":Ljava/lang/String;
    .end local v75    # "jsonObj":Lorg/json/JSONObject;
    .end local v99    # "makerJsonObject":Lorg/json/JSONObject;
    :cond_47
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Rules device list - List of maker returned: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v74 .. v74}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1307
    move-object/from16 v0, p3

    move-object/from16 v1, v74

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 1311
    .end local v55    # "i$":Ljava/util/Iterator;
    .end local v74    # "jsonMakerArray":Lorg/json/JSONArray;
    :sswitch_2e
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_IS_TARGET_DEVICES_TABLE_SUPPORTED"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1312
    if-eqz p2, :cond_4a

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v4

    const/4 v5, 0x1

    if-lt v4, v5, :cond_4a

    .line 1313
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v142

    .line 1314
    .local v142, "udnJO":Lorg/json/JSONObject;
    const-string v4, "udn"

    move-object/from16 v0, v142

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v37

    .line 1315
    .local v37, "deviceUdn":Ljava/lang/String;
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v0, v37

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v36

    .line 1316
    .local v36, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v36, :cond_49

    .line 1317
    const/16 v66, 0x0

    .line 1318
    .local v66, "isTargetDevicesTableSupported":I
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v4

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v4

    invoke-interface {v4}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v4

    invoke-virtual/range {v36 .. v36}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getFirmwareVersionRevisionNumber(Ljava/lang/String;)I

    move-result v114

    .line 1319
    .local v114, "revNum":I
    const/16 v4, 0x2968

    move/from16 v0, v114

    if-lt v0, v4, :cond_48

    .line 1320
    const/16 v66, 0x1

    .line 1322
    :cond_48
    if-eqz p3, :cond_1

    .line 1323
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move/from16 v0, v66

    invoke-direct {v4, v5, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 1326
    .end local v66    # "isTargetDevicesTableSupported":I
    .end local v114    # "revNum":I
    :cond_49
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "DeviceInformation is NULL for udn: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v37

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 1329
    .end local v36    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v37    # "deviceUdn":Ljava/lang/String;
    .end local v142    # "udnJO":Lorg/json/JSONObject;
    :cond_4a
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const-string v6, "Parameters provided are INVALID."

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 1334
    :sswitch_2f
    new-instance v4, Lcom/belkin/cordova/plugin/DevicePlugin$9;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v4, v0, v1}, Lcom/belkin/cordova/plugin/DevicePlugin$9;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V

    invoke-static {v4}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 1344
    :sswitch_30
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeSSIDs()Ljava/util/Set;

    move-result-object v129

    .line 1345
    .local v129, "ssids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v18, Lorg/json/JSONArray;

    invoke-direct/range {v18 .. v18}, Lorg/json/JSONArray;-><init>()V

    .line 1346
    .local v18, "arry":Lorg/json/JSONArray;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v5}, Lcom/belkin/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 1347
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v4

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Z)Lorg/json/JSONArray;

    .line 1348
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getRemoteAccessSSID()Ljava/lang/String;

    move-result-object v132

    .line 1349
    .local v132, "string":Ljava/lang/String;
    if-eqz v132, :cond_4b

    invoke-virtual/range {v132 .. v132}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_4c

    .line 1350
    :cond_4b
    invoke-interface/range {v129 .. v129}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v69

    .line 1351
    .local v69, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    invoke-interface/range {v69 .. v69}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4c

    .line 1352
    invoke-interface/range {v69 .. v69}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v132

    .end local v132    # "string":Ljava/lang/String;
    check-cast v132, Ljava/lang/String;

    .line 1356
    .end local v69    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .restart local v132    # "string":Ljava/lang/String;
    :cond_4c
    move-object/from16 v0, v18

    move-object/from16 v1, v132

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 1358
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 1359
    move-object/from16 v0, v18

    move/from16 v1, v63

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Z)Lorg/json/JSONArray;

    .line 1360
    sget-boolean v4, Lcom/belkin/cordova/plugin/DevicePlugin;->isRemoteEnableGoing:Z

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Z)Lorg/json/JSONArray;

    .line 1361
    move-object/from16 v0, p3

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    .line 1363
    const/4 v4, 0x1

    goto/16 :goto_1

    .line 1366
    .end local v18    # "arry":Lorg/json/JSONArray;
    .end local v129    # "ssids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v132    # "string":Ljava/lang/String;
    :sswitch_31
    if-eqz p2, :cond_4d

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v4

    const/4 v5, 0x2

    if-lt v4, v5, :cond_4d

    .line 1367
    const/4 v4, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v39

    .line 1368
    .local v39, "devicesUDNAsString":Ljava/lang/String;
    const-string v4, ","

    move-object/from16 v0, v39

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v38

    .line 1370
    .local v38, "devicesUDNArr":[Ljava/lang/String;
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    new-instance v5, Lcom/belkin/cordova/plugin/DevicePlugin$10;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v5, v0, v1}, Lcom/belkin/cordova/plugin/DevicePlugin$10;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V

    const/4 v6, 0x0

    move-object/from16 v0, v38

    invoke-static {v4, v0, v5, v6}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler;->getScheduleJSONObject(Landroid/content/Context;[Ljava/lang/String;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringErrorCallback;)V

    goto/16 :goto_0

    .line 1380
    .end local v38    # "devicesUDNArr":[Ljava/lang/String;
    .end local v39    # "devicesUDNAsString":Ljava/lang/String;
    :cond_4d
    if-eqz p3, :cond_1

    .line 1381
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 1387
    :sswitch_32
    if-eqz p2, :cond_4e

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v4

    const/4 v5, 0x2

    if-lt v4, v5, :cond_4e

    .line 1388
    const/4 v4, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v120

    .line 1389
    .local v120, "sensorUDNsString":Ljava/lang/String;
    const-string v4, ","

    move-object/from16 v0, v120

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v119

    .line 1391
    .local v119, "sensorUDNsArr":[Ljava/lang/String;
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    new-instance v5, Lcom/belkin/cordova/plugin/DevicePlugin$11;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v5, v0, v1}, Lcom/belkin/cordova/plugin/DevicePlugin$11;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V

    const/4 v6, 0x0

    move-object/from16 v0, v119

    invoke-static {v4, v0, v5, v6}, Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler;->getSensorScheduleJSONObject(Landroid/content/Context;[Ljava/lang/String;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringErrorCallback;)V

    goto/16 :goto_0

    .line 1401
    .end local v119    # "sensorUDNsArr":[Ljava/lang/String;
    .end local v120    # "sensorUDNsString":Ljava/lang/String;
    :cond_4e
    if-eqz p3, :cond_1

    .line 1402
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 1407
    :sswitch_33
    new-instance v117, Lcom/belkin/utils/RuleUtility;

    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v0, v117

    invoke-direct {v0, v4}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    .line 1408
    .local v117, "ruleutility":Lcom/belkin/utils/RuleUtility;
    invoke-virtual/range {v117 .. v117}, Lcom/belkin/utils/RuleUtility;->checkCopyRawDBStatus()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1411
    .end local v117    # "ruleutility":Lcom/belkin/utils/RuleUtility;
    :sswitch_34
    if-eqz p2, :cond_53

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v4

    const/4 v5, 0x2

    if-lt v4, v5, :cond_53

    .line 1412
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v48

    .line 1413
    .local v48, "from":Ljava/lang/String;
    const/4 v4, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v139

    .line 1415
    .local v139, "to":Ljava/lang/String;
    const-string v4, "0"

    move-object/from16 v0, v48

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_51

    .line 1416
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v48

    .line 1421
    :cond_4f
    :goto_26
    const-string v4, "0"

    move-object/from16 v0, v139

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_52

    .line 1422
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v139

    .line 1427
    :cond_50
    :goto_27
    move-object/from16 v0, v48

    move-object/from16 v1, v139

    invoke-static {v0, v1}, Lcom/belkin/utils/RuleUtility;->copyDBFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 1428
    if-eqz p3, :cond_1

    .line 1429
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 1417
    :cond_51
    const-string v4, "1"

    move-object/from16 v0, v48

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4f

    .line 1418
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "pluginrules2Copy.db"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v48

    goto :goto_26

    .line 1423
    :cond_52
    const-string v4, "1"

    move-object/from16 v0, v139

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_50

    .line 1424
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "pluginrules2Copy.db"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v139

    goto :goto_27

    .line 1432
    .end local v48    # "from":Ljava/lang/String;
    .end local v139    # "to":Ljava/lang/String;
    :cond_53
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_CLONE_DB: Invalid agruments provided."

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1433
    if-eqz p3, :cond_1

    .line 1434
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 1439
    :sswitch_35
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_GET_REUNION_KEY Start"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1440
    new-instance v4, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v4}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/utils/MoreUtil;->getReUnionKey(Lcom/belkin/wemo/cache/utils/SharePreferences;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1443
    :sswitch_36
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_GET_CURRENT_FIRMWARE"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1444
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v4, v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getCurrentFirmwareVersion(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 1448
    :sswitch_37
    const-string v4, "DevicePlugin"

    const-string v5, "FW <>  ACTION_GET_FIRMWARE_VERSION_SRSS"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1449
    if-eqz p2, :cond_54

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v4

    const/4 v5, 0x1

    if-le v4, v5, :cond_54

    .line 1450
    const-string v4, "DevicePlugin"

    const-string v5, "FW <> ACTION_GET_FIRMWARE_VERSION_SRSS <> Double ARG"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1451
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getCurrentFirmwareVersionByUDN(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1453
    :cond_54
    const-string v4, "DevicePlugin"

    const-string v5, "FW <> ACTION_GET_FIRMWARE_VERSION_SRSS <> Single ARG"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1454
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getCurrentFirmwareVersionByUDN(Ljava/lang/String;)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1460
    :sswitch_38
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ACTION_GET_FIRMWARE_VERSION_MAKER_RULE UDN:: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1461
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getMakerFirmwareVersion(Ljava/lang/String;)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1464
    :sswitch_39
    const-string v4, "DevicePlugin"

    const-string v5, "FW <>  ACTION_SIMULATED_FW_VER_CHECK"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1465
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getSOFirmwareVersionByUDN(Ljava/lang/String;)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1469
    :sswitch_3a
    const-string v4, "DevicePlugin"

    const-string v5, "FW <>  ACTION_MOTION_NOTIFY_FW_VER_CHECK"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1470
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getMotionNotifyFirmwareVersionByUDN(Ljava/lang/String;)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1474
    :sswitch_3b
    const-string v4, "DevicePlugin"

    const-string v5, "FW <>  ACTION_COUNTDOWN_FW_VER_CHECK"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1475
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getCountdownFirmwareVersionByUDN(Ljava/lang/String;)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1478
    :sswitch_3c
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_IS_FIRMWARE_AVAILABLE"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1479
    new-instance v4, Ljava/lang/Thread;

    new-instance v5, Lcom/belkin/cordova/plugin/DevicePlugin$12;

    move-object/from16 v0, p0

    move/from16 v1, v63

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-direct {v5, v0, v1, v2, v3}, Lcom/belkin/cordova/plugin/DevicePlugin$12;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;ZLorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    invoke-direct {v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v4}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    .line 1506
    :sswitch_3d
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_GET_FIRMWARE_UPDATE_LIST"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1508
    if-eqz v63, :cond_55

    .line 1510
    :try_start_6
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v7, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getCurrentFirmwareVersion(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->firmwareUpdateList(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONObject;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_6

    goto/16 :goto_0

    .line 1511
    :catch_6
    move-exception v42

    .line 1512
    .restart local v42    # "e":Lorg/json/JSONException;
    invoke-virtual/range {v42 .. v42}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0

    .line 1516
    .end local v42    # "e":Lorg/json/JSONException;
    :cond_55
    :try_start_7
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->firmwareUpdateList(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONObject;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_7

    goto/16 :goto_0

    .line 1517
    :catch_7
    move-exception v42

    .line 1518
    .restart local v42    # "e":Lorg/json/JSONException;
    invoke-virtual/range {v42 .. v42}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0

    .line 1524
    .end local v42    # "e":Lorg/json/JSONException;
    :sswitch_3e
    new-instance v151, Lorg/apache/cordova/PluginResult;

    sget-object v152, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x3

    move-object/from16 v0, p2

    invoke-virtual {v0, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x4

    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {v4 .. v9}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->updateFirmware(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    move-object/from16 v0, v151

    move-object/from16 v1, v152

    invoke-direct {v0, v1, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, v151

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 1525
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 1526
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 1530
    :sswitch_3f
    const-string v4, "FirmwareUpdate"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "LED devices to be updated:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1531
    invoke-static/range {p2 .. p2}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->addTofirmwareUpdateQueue(Lorg/json/JSONArray;)V

    .line 1532
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 1533
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 1534
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 1538
    :sswitch_40
    const-string v4, "FirmwareUpdate"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "LED devices to be added to queue:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1539
    invoke-static/range {p2 .. p2}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->addTofirmwareUpdateQueue(Lorg/json/JSONArray;)V

    .line 1540
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 1541
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 1542
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 1545
    :sswitch_41
    const-string v4, "FirmwareUpdate"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "LED devices fw notification:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1546
    const/4 v4, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v58

    .line 1547
    .local v58, "id":Ljava/lang/String;
    const-string v4, "FirmwareUpdate"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "id is:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v58

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1548
    const-string v4, "FirmwareUpdate"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "currentlyUpdating is:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->currentlyUpdating:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1549
    sget-object v4, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->currentlyUpdating:Ljava/lang/String;

    move-object/from16 v0, v58

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_56

    .line 1550
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v58

    invoke-static {v0, v4, v5}, Lcom/belkin/firmware/ZigbeeFirmwareUpdateManager;->updateUpgradeStatus(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1552
    :cond_56
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 1553
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 1554
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 1557
    .end local v58    # "id":Ljava/lang/String;
    :sswitch_42
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_READ_DB_FROM_CLOUD"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1559
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v96

    .line 1560
    .restart local v96    # "macAddress":Ljava/lang/String;
    const/4 v4, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v101

    .line 1561
    .local v101, "newDBVersion":Ljava/lang/String;
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Mac Address: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v96

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; New DB Version to set: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v101

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1563
    new-instance v85, Ljava/util/concurrent/CountDownLatch;

    const/4 v4, 0x1

    move-object/from16 v0, v85

    invoke-direct {v0, v4}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 1564
    .local v85, "latch":Ljava/util/concurrent/CountDownLatch;
    new-instance v109, Lcom/belkin/wemo/cache/cloud/CloudRequestGetRulesDB;

    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    new-instance v5, Lcom/belkin/cordova/plugin/DevicePlugin$13;

    move-object/from16 v0, p0

    move-object/from16 v1, v101

    move-object/from16 v2, p3

    move-object/from16 v3, v85

    invoke-direct {v5, v0, v1, v2, v3}, Lcom/belkin/cordova/plugin/DevicePlugin$13;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;Ljava/util/concurrent/CountDownLatch;)V

    move-object/from16 v0, v109

    move-object/from16 v1, v96

    invoke-direct {v0, v4, v1, v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetRulesDB;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V

    .line 1592
    .local v109, "request":Lcom/belkin/wemo/cache/cloud/CloudRequestGetRulesDB;
    new-instance v4, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v109

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeByteStreamRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 1595
    :try_start_8
    invoke-virtual/range {v85 .. v85}, Ljava/util/concurrent/CountDownLatch;->await()V

    .line 1596
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_READ_DB_FROM_CLOUD Completed."

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_8} :catch_8

    goto/16 :goto_0

    .line 1597
    :catch_8
    move-exception v44

    .line 1598
    .local v44, "e2":Ljava/lang/InterruptedException;
    const-string v4, "DevicePlugin"

    const-string v5, "InterruptedException while waiting for countdown latch during ACTION_READ_DB_FROM_CLOUD: "

    move-object/from16 v0, v44

    invoke-static {v4, v5, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1600
    if-eqz p3, :cond_1

    .line 1601
    new-instance v107, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v107

    invoke-direct {v0, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 1602
    .local v107, "pr":Lorg/apache/cordova/PluginResult;
    move-object/from16 v0, p3

    move-object/from16 v1, v107

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 1608
    .end local v44    # "e2":Ljava/lang/InterruptedException;
    .end local v85    # "latch":Ljava/util/concurrent/CountDownLatch;
    .end local v96    # "macAddress":Ljava/lang/String;
    .end local v101    # "newDBVersion":Ljava/lang/String;
    .end local v107    # "pr":Lorg/apache/cordova/PluginResult;
    .end local v109    # "request":Lcom/belkin/wemo/cache/cloud/CloudRequestGetRulesDB;
    :sswitch_43
    const-string v4, "DevicePlugin"

    const-string v5, "zip"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1610
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v5}, Lcom/belkin/utils/WiFiSecurityUtil;->generateAuthCode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v22

    .line 1612
    .restart local v22    # "authHeader":Ljava/lang/String;
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Auth Header... : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v22

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1613
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Mac Address... : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1614
    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->param:[Ljava/lang/String;

    .line 1615
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->param:[Ljava/lang/String;

    const/4 v5, 0x0

    const/16 v6, 0x1390

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    .line 1616
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->param:[Ljava/lang/String;

    const/4 v5, 0x1

    aput-object v22, v4, v5

    .line 1617
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->param:[Ljava/lang/String;

    const/4 v5, 0x2

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    .line 1620
    new-instance v4, Lcom/belkin/remoteservice/RestfulWebservice;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->param:[Ljava/lang/String;

    sget-object v6, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5, v6}, Lcom/belkin/remoteservice/RestfulWebservice;-><init>([Ljava/lang/String;Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->objHttpConnection:Lcom/belkin/remoteservice/RestfulWebservice;

    .line 1622
    :try_start_9
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->objHttpConnection:Lcom/belkin/remoteservice/RestfulWebservice;

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Void;

    invoke-virtual {v4, v5}, Lcom/belkin/remoteservice/RestfulWebservice;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v4

    invoke-virtual {v4}, Landroid/os/AsyncTask;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/remoteservice/HttpResponseObject;

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->httpResponseObject:Lcom/belkin/remoteservice/HttpResponseObject;

    .line 1624
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " HttpRes : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->httpResponseObject:Lcom/belkin/remoteservice/HttpResponseObject;

    invoke-virtual {v6}, Lcom/belkin/remoteservice/HttpResponseObject;->getResponseCode()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_9} :catch_a
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_9 .. :try_end_9} :catch_b

    .line 1634
    :goto_28
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->objHttpConnection:Lcom/belkin/remoteservice/RestfulWebservice;

    invoke-virtual {v4}, Lcom/belkin/remoteservice/RestfulWebservice;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v4

    sget-object v5, Landroid/os/AsyncTask$Status;->RUNNING:Landroid/os/AsyncTask$Status;

    invoke-virtual {v4, v5}, Landroid/os/AsyncTask$Status;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_57

    .line 1636
    const-wide/16 v4, 0x3e8

    :try_start_a
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_a
    .catch Ljava/lang/InterruptedException; {:try_start_a .. :try_end_a} :catch_9

    goto :goto_28

    .line 1637
    :catch_9
    move-exception v42

    .line 1639
    .local v42, "e":Ljava/lang/InterruptedException;
    invoke-virtual/range {v42 .. v42}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_28

    .line 1626
    .end local v42    # "e":Ljava/lang/InterruptedException;
    :catch_a
    move-exception v43

    .line 1628
    .local v43, "e1":Ljava/lang/InterruptedException;
    invoke-virtual/range {v43 .. v43}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_28

    .line 1629
    .end local v43    # "e1":Ljava/lang/InterruptedException;
    :catch_b
    move-exception v43

    .line 1631
    .local v43, "e1":Ljava/util/concurrent/ExecutionException;
    invoke-virtual/range {v43 .. v43}, Ljava/util/concurrent/ExecutionException;->printStackTrace()V

    goto :goto_28

    .line 1644
    .end local v43    # "e1":Ljava/util/concurrent/ExecutionException;
    :cond_57
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Response code : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->httpResponseObject:Lcom/belkin/remoteservice/HttpResponseObject;

    invoke-virtual {v6}, Lcom/belkin/remoteservice/HttpResponseObject;->getResponseCode()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1645
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->httpResponseObject:Lcom/belkin/remoteservice/HttpResponseObject;

    invoke-virtual {v6}, Lcom/belkin/remoteservice/HttpResponseObject;->getResponseCode()I

    move-result v6

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 1646
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 1648
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 1649
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 1652
    .end local v22    # "authHeader":Ljava/lang/String;
    :sswitch_44
    new-instance v135, Ljava/lang/Thread;

    new-instance v4, Lcom/belkin/cordova/plugin/DevicePlugin$14;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-direct {v4, v0, v1, v2}, Lcom/belkin/cordova/plugin/DevicePlugin$14;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    move-object/from16 v0, v135

    invoke-direct {v0, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1683
    .local v135, "thDownload":Ljava/lang/Thread;
    const/4 v4, 0x1

    move-object/from16 v0, v135

    invoke-virtual {v0, v4}, Ljava/lang/Thread;->setPriority(I)V

    .line 1684
    invoke-virtual/range {v135 .. v135}, Ljava/lang/Thread;->start()V

    .line 1686
    new-instance v106, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v106

    invoke-direct {v0, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 1687
    .restart local v106    # "pluginResult":Lorg/apache/cordova/PluginResult;
    const/4 v4, 0x1

    move-object/from16 v0, v106

    invoke-virtual {v0, v4}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 1688
    move-object/from16 v0, p3

    move-object/from16 v1, v106

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 1691
    .end local v106    # "pluginResult":Lorg/apache/cordova/PluginResult;
    .end local v135    # "thDownload":Ljava/lang/Thread;
    :sswitch_45
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v5}, Lcom/belkin/utils/WiFiSecurityUtil;->generateAuthCode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v22

    .line 1692
    .restart local v22    # "authHeader":Ljava/lang/String;
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/cloud/CloudServices;->getInstance(Landroid/content/Context;)Lcom/belkin/cloud/CloudServices;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->cs:Lcom/belkin/cloud/CloudServices;

    .line 1694
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->cs:Lcom/belkin/cloud/CloudServices;

    const/4 v5, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v22

    invoke-virtual {v4, v5, v6, v0}, Lcom/belkin/cloud/CloudServices;->putDeviceIcon(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v111

    .line 1695
    .local v111, "res":Z
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 1698
    .end local v22    # "authHeader":Ljava/lang/String;
    .end local v111    # "res":Z
    :sswitch_46
    const-string v4, "DevicePlugin"

    const-string v5, "inside ACTION_GET_REMOTE_ACCESS_DET..."

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1699
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Remote...: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getDBVersion()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1701
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getDBVersion()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    .line 1703
    const/4 v4, 0x1

    goto/16 :goto_1

    .line 1705
    :sswitch_47
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Mac Address... : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1706
    const-string v4, "DevicePlugin"

    const-string v5, "inside ACTION_SET_REMOTE_ACCESS_DET..."

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1707
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Remote...: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1708
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v31

    .line 1709
    .local v31, "dbVersion":Ljava/lang/String;
    if-eqz v31, :cond_58

    const-string v4, ""

    move-object/from16 v0, v31

    if-ne v0, v4, :cond_59

    .line 1710
    :cond_58
    const-string v31, "0"

    .line 1713
    :cond_59
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v0, v31

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setDBVersion(Ljava/lang/String;)V

    .line 1714
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "DB Version set to Shared preferences... : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v31

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1716
    move-object/from16 v0, p3

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    .line 1718
    const/4 v4, 0x1

    goto/16 :goto_1

    .line 1720
    .end local v31    # "dbVersion":Ljava/lang/String;
    :sswitch_48
    const-string v4, "DevicePlugin"

    const-string v5, "inside ACTION_DEVICE_UUID..."

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1721
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Remote...: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

    sget-object v7, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v7}, Lcom/belkin/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1723
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v5}, Lcom/belkin/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    .line 1725
    const/4 v4, 0x1

    goto/16 :goto_1

    .line 1727
    :sswitch_49
    const-string v4, "DevicePlugin"

    const-string v5, "inside ACTION_SMART_DEVICE_CLEAR_DATA..."

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1729
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const-string v5, ""

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storePrivateKey(Ljava/lang/String;)V

    .line 1730
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const-string v5, ""

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storeHomeId(Ljava/lang/String;)V

    .line 1731
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setHomeSSIDs(Ljava/util/Set;)Z

    .line 1732
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setARPMacs(Ljava/util/Set;)Z

    .line 1733
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteAccessSSID(Ljava/lang/String;)Z

    .line 1734
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteEnabled(Z)Z

    .line 1735
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const-string v5, "0"

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setDBVersion(Ljava/lang/String;)V

    .line 1736
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 1738
    const/4 v4, 0x1

    goto/16 :goto_1

    .line 1740
    :sswitch_4a
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_GET_INSIGHT_PARAMS"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1741
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v4

    new-instance v5, Lcom/belkin/cordova/plugin/DevicePlugin$15;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p2

    invoke-direct {v5, v0, v1, v2}, Lcom/belkin/cordova/plugin/DevicePlugin$15;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;Lorg/json/JSONArray;)V

    invoke-interface {v4, v5}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 1751
    const/4 v4, 0x1

    goto/16 :goto_1

    .line 1754
    :sswitch_4b
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_GET_INSIGHT_HOMESETTINGS_PARAMS"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1756
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getInsightHomeSettingsParams()[Ljava/lang/String;

    move-result-object v60

    .line 1757
    .local v60, "insightParams":[Ljava/lang/String;
    new-instance v134, Lorg/json/JSONObject;

    invoke-direct/range {v134 .. v134}, Lorg/json/JSONObject;-><init>()V

    .line 1758
    .local v134, "tempObj":Lorg/json/JSONObject;
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_ENERGY_PER_UNIT_COST:Ljava/lang/String;

    const/4 v5, 0x0

    aget-object v5, v60, v5

    move-object/from16 v0, v134

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1759
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_CURRENCY:Ljava/lang/String;

    const/4 v5, 0x1

    aget-object v5, v60, v5

    move-object/from16 v0, v134

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1760
    move-object/from16 v0, p3

    move-object/from16 v1, v134

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    goto/16 :goto_0

    .line 1764
    .end local v60    # "insightParams":[Ljava/lang/String;
    .end local v134    # "tempObj":Lorg/json/JSONObject;
    :sswitch_4c
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->netCamUtil:Lcom/belkin/utils/NetCamUtil;

    sget-object v7, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v7}, Lcom/belkin/utils/NetCamUtil;->checkNetCam(Landroid/content/Context;)Z

    move-result v6

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 1765
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 1766
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 1767
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 1771
    :sswitch_4d
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "NetCam: UserName:  "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1772
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "NetCam: UDN:  "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1773
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "NetCam: PageNum:  "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1774
    if-eqz v63, :cond_5a

    .line 1775
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->netCamUtil:Lcom/belkin/utils/NetCamUtil;

    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v8, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getMacAddressByUDN(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v4, v5, v6, v7, v8}, Lcom/belkin/utils/NetCamUtil;->launchNetCamApp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V

    .line 1779
    :goto_29
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 1780
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 1781
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 1782
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 1777
    :cond_5a
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->netCamUtil:Lcom/belkin/utils/NetCamUtil;

    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v8, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getMacAddresswithColon(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v4, v5, v6, v7, v8}, Lcom/belkin/utils/NetCamUtil;->launchNetCamApp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_29

    .line 1785
    :sswitch_4e
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_LAUNCH_AMAZON_ALEXA_APP "

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1786
    if-eqz v63, :cond_5b

    .line 1787
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->appLaunchUtil:Lcom/belkin/utils/ExternalAppLaunchUtil;

    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v5}, Lcom/belkin/utils/ExternalAppLaunchUtil;->launchAlexaApp(Landroid/content/Context;)V

    .line 1791
    :goto_2a
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 1792
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 1793
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 1794
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 1789
    :cond_5b
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->appLaunchUtil:Lcom/belkin/utils/ExternalAppLaunchUtil;

    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v5}, Lcom/belkin/utils/ExternalAppLaunchUtil;->launchAlexaApp(Landroid/content/Context;)V

    goto :goto_2a

    .line 1797
    :sswitch_4f
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_GET_THRESHOLD"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1798
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v4

    new-instance v5, Lcom/belkin/cordova/plugin/DevicePlugin$16;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p2

    invoke-direct {v5, v0, v1, v2}, Lcom/belkin/cordova/plugin/DevicePlugin$16;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;Lorg/json/JSONArray;)V

    invoke-interface {v4, v5}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 1810
    :sswitch_50
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_SET_THRESHOLD"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1811
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "SetPowerThreshold"

    const/4 v9, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    sget-object v151, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NEW_VALUE_POWER_THRESHOLD:Ljava/lang/String;

    move-object/from16 v0, v151

    invoke-virtual {v6, v7, v8, v9, v0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setValueFromAction(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 1812
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 1813
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 1814
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 1817
    :sswitch_51
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_RESET_THRESHOLD"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1818
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "ResetPowerThreshold"

    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NEW_VALUE_POWER_THRESHOLD:Ljava/lang/String;

    invoke-virtual {v4, v5, v6, v7}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getActionResultValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1821
    :sswitch_52
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_GET_INSTANT_POWER"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1822
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "GetPower"

    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSTANT_POWER:Ljava/lang/String;

    invoke-virtual {v4, v5, v6, v7}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getActionResultValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1825
    :sswitch_53
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_GET_ENERGY_PER_UNIT_COST"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1826
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v4

    new-instance v5, Lcom/belkin/cordova/plugin/DevicePlugin$17;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-direct {v5, v0, v1, v2}, Lcom/belkin/cordova/plugin/DevicePlugin$17;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v4, v5}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 1840
    :sswitch_54
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_SET_ENERGY_PER_UNIT_COST"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1841
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "SetInsightHomeSettings"

    sget-object v9, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ENERGY_PER_UNIT_COST_DATA:[Ljava/lang/String;

    const/16 v151, 0x2

    move/from16 v0, v151

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v151, v0

    const/16 v152, 0x0

    const/16 v153, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v153

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v153

    invoke-virtual/range {v153 .. v153}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v153

    aput-object v153, v151, v152

    const/16 v152, 0x1

    const/16 v153, 0x2

    move-object/from16 v0, p2

    move/from16 v1, v153

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v153

    invoke-virtual/range {v153 .. v153}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v153

    aput-object v153, v151, v152

    move-object/from16 v0, v151

    invoke-virtual {v6, v7, v8, v9, v0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setParametersValues(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v6

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 1842
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 1843
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 1844
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 1847
    :sswitch_55
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_GET_DATA_EXPORT_INFO"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1848
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "GetDataExportInfo"

    sget-object v7, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->DATA_EXPORT_ARGS:[Ljava/lang/String;

    invoke-virtual {v4, v5, v6, v7}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getActionResultValuesJSONObject(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    goto/16 :goto_0

    .line 1851
    :sswitch_56
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_SCHEDULE_DATA_EXPORT"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1852
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "ScheduleDataExport"

    sget-object v9, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SCHEDULE_DATA_EXPORT_ARGS:[Ljava/lang/String;

    const/16 v151, 0x2

    move/from16 v0, v151

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v151, v0

    const/16 v152, 0x0

    const/16 v153, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v153

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v153

    invoke-virtual/range {v153 .. v153}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v153

    aput-object v153, v151, v152

    const/16 v152, 0x1

    const/16 v153, 0x2

    move-object/from16 v0, p2

    move/from16 v1, v153

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v153

    invoke-virtual/range {v153 .. v153}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v153

    aput-object v153, v151, v152

    move-object/from16 v0, v151

    invoke-virtual {v6, v7, v8, v9, v0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setParametersValues(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v6

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 1853
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 1854
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 1855
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 1858
    :sswitch_57
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_SET_AUTO_THRESHOLD"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1859
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "SetAutoPowerThreshold"

    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->NEW_VALUE_POWER_THRESHOLD:Ljava/lang/String;

    invoke-virtual {v4, v5, v6, v7}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getActionResultValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1863
    :sswitch_58
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/belkin/cordova/plugin/DevicePlugin;->checkIfWemoPresentAsync(Lorg/json/JSONArray;)V

    .line 1864
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 1867
    :sswitch_59
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_GET_REGISTRATION_DATA"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1868
    invoke-direct/range {p0 .. p0}, Lcom/belkin/cordova/plugin/DevicePlugin;->registrationDataAsync()V

    .line 1869
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 1872
    :sswitch_5a
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_GET_REGISTRATION_STATUS"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1873
    invoke-direct/range {p0 .. p0}, Lcom/belkin/cordova/plugin/DevicePlugin;->registrationStatusAsync()V

    .line 1874
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 1877
    :sswitch_5b
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_SET_NIGHT_LIGHT_STATUS"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1879
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v4

    new-array v15, v4, [Ljava/lang/String;

    .line 1880
    .local v15, "argList":[Ljava/lang/String;
    const/16 v54, 0x0

    .restart local v54    # "i":I
    :goto_2b
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v4

    move/from16 v0, v54

    if-ge v0, v4, :cond_5c

    .line 1881
    move-object/from16 v0, p2

    move/from16 v1, v54

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v15, v54

    .line 1880
    add-int/lit8 v54, v54, 0x1

    goto :goto_2b

    .line 1883
    :cond_5c
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-virtual {v4, v15}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setNightLightStatus([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v122

    .line 1884
    .local v122, "setNightLightStatus":Ljava/lang/String;
    move-object/from16 v0, p3

    move-object/from16 v1, v122

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1888
    .end local v15    # "argList":[Ljava/lang/String;
    .end local v54    # "i":I
    .end local v122    # "setNightLightStatus":Ljava/lang/String;
    :sswitch_5c
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_GET_NIGHT_LIGHT_STATUS"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1889
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v4

    new-array v0, v4, [Ljava/lang/String;

    move-object/from16 v16, v0

    .line 1890
    .local v16, "argListGet":[Ljava/lang/String;
    const/16 v54, 0x0

    .restart local v54    # "i":I
    :goto_2c
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->length()I

    move-result v4

    move/from16 v0, v54

    if-ge v0, v4, :cond_5d

    .line 1891
    move-object/from16 v0, p2

    move/from16 v1, v54

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v16, v54

    .line 1890
    add-int/lit8 v54, v54, 0x1

    goto :goto_2c

    .line 1893
    :cond_5d
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getNightLightStatus([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v50

    .line 1894
    .local v50, "getNightLightStatus":Ljava/lang/String;
    move-object/from16 v0, p3

    move-object/from16 v1, v50

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1897
    .end local v16    # "argListGet":[Ljava/lang/String;
    .end local v50    # "getNightLightStatus":Ljava/lang/String;
    .end local v54    # "i":I
    :sswitch_5d
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v40

    .line 1898
    .local v40, "deviceudn":Ljava/lang/String;
    const/4 v4, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v20

    .line 1899
    .local v20, "attributeList":Lorg/json/JSONObject;
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    move-object/from16 v0, v40

    move-object/from16 v1, v20

    invoke-virtual {v4, v0, v1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->setAttriuteState(Ljava/lang/String;Lorg/json/JSONObject;)V

    goto/16 :goto_0

    .line 1902
    .end local v20    # "attributeList":Lorg/json/JSONObject;
    .end local v40    # "deviceudn":Ljava/lang/String;
    :sswitch_5e
    new-instance v4, Landroid/os/Handler;

    invoke-direct {v4}, Landroid/os/Handler;-><init>()V

    new-instance v5, Lcom/belkin/cordova/plugin/DevicePlugin$18;

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v5, v0, v1}, Lcom/belkin/cordova/plugin/DevicePlugin$18;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V

    invoke-virtual {v4, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_0

    .line 1929
    :sswitch_5f
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "params..........."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1930
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "unpairedlist"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5e

    .line 1931
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/belkin/cordova/plugin/DevicePlugin;->getEndList(Lorg/json/JSONArray;)V

    .line 1932
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 1934
    :cond_5e
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "getendlist"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5f

    .line 1935
    invoke-direct/range {p0 .. p0}, Lcom/belkin/cordova/plugin/DevicePlugin;->getEndList()V

    .line 1936
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 1939
    :cond_5f
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v4

    new-instance v5, Lcom/belkin/cordova/plugin/DevicePlugin$19;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-direct {v5, v0, v1, v2}, Lcom/belkin/cordova/plugin/DevicePlugin$19;-><init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v4, v5}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 1963
    :sswitch_60
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->getDeviceList:Lorg/json/JSONArray;

    .line 1964
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mHandler:Landroid/os/Handler;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->getDeviceListTask:Ljava/lang/Runnable;

    invoke-virtual {v4, v5}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1965
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getCapabilityProfileList(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->getDeviceList:Lorg/json/JSONArray;

    .line 1967
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/cordova/plugin/DevicePlugin;->deviceCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 1968
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mHandler:Landroid/os/Handler;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->getDeviceListTask:Ljava/lang/Runnable;

    const-wide/16 v6, 0x1388

    invoke-virtual {v4, v5, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1969
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->getDeviceList:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lez v4, :cond_1

    .line 1970
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "leddevices callback update capability profile list:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->getDeviceList:Lorg/json/JSONArray;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1971
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mHandler:Landroid/os/Handler;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->getDeviceListTask:Ljava/lang/Runnable;

    invoke-virtual {v4, v5}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1972
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->getDeviceList:Lorg/json/JSONArray;

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 1973
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 1974
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 1979
    :sswitch_61
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->addBridgeDevices(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 1982
    :sswitch_62
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->removeBridgeDevices(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 1985
    :sswitch_63
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "set led status:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1986
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v5

    const/4 v6, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setLedDeviceStatus(Lorg/json/JSONArray;Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 1989
    :sswitch_64
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/belkin/cordova/plugin/DevicePlugin;->getEndListStatus(Lorg/json/JSONArray;)V

    .line 1990
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 1991
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 1992
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 1993
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 1997
    :sswitch_65
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2}, Lcom/belkin/cordova/plugin/DevicePlugin;->getStatusForGrpLed(Lorg/apache/cordova/CallbackContext;Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 2000
    :sswitch_66
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-virtual {v4}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->closeBridgeNetwork()Lorg/json/JSONObject;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 2002
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->openBridgeNetworkTimer:Ljava/util/Timer;

    if-eqz v4, :cond_1

    .line 2003
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->openBridgeNetworkTimer:Ljava/util/Timer;

    invoke-virtual {v4}, Ljava/util/Timer;->cancel()V

    .line 2004
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->openBridgeNetworkTimer:Ljava/util/Timer;

    .line 2005
    const-string v4, "DevicePlugin"

    const-string v5, "Close Network: Open Network Timer and its tasks have been cancelled"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2009
    :sswitch_67
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->createGroup(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 2012
    :sswitch_68
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->deleteGroup(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 2015
    :sswitch_69
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ACTION_FIND_BULB ::  "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2016
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->findLedBulb(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 2019
    :sswitch_6a
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "set friendly LED name for udn::: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2020
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setLedFriendlyName(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    goto/16 :goto_0

    .line 2023
    :sswitch_6b
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_SELECT_LED_DEVICES"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2024
    new-instance v88, Lorg/json/JSONArray;

    invoke-direct/range {v88 .. v88}, Lorg/json/JSONArray;-><init>()V

    .line 2025
    .local v88, "ledsJA":Lorg/json/JSONArray;
    new-instance v53, Ljava/util/ArrayList;

    invoke-direct/range {v53 .. v53}, Ljava/util/ArrayList;-><init>()V

    .line 2026
    .local v53, "groupsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformation()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v55

    .restart local v55    # "i$":Ljava/util/Iterator;
    :cond_60
    :goto_2d
    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_62

    invoke-interface/range {v55 .. v55}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 2027
    .restart local v24    # "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    new-instance v87, Lorg/json/JSONObject;

    invoke-direct/range {v87 .. v87}, Lorg/json/JSONObject;-><init>()V

    .line 2028
    .local v87, "ledJO":Lorg/json/JSONObject;
    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getProductType()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Lighting"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_60

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_60

    .line 2031
    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupID()Ljava/lang/String;

    move-result-object v52

    .line 2032
    .local v52, "groupId":Ljava/lang/String;
    invoke-static/range {v52 .. v52}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_61

    .line 2033
    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v4

    if-nez v4, :cond_60

    .line 2035
    const-string v4, "friendlyName"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v87

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2036
    const-string v4, "udn"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v87

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2037
    const-string v4, "ProductName"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getProductName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v87

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2038
    const-string v4, "bridgeudn"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v87

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2039
    move-object/from16 v0, v88

    move-object/from16 v1, v87

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_2d

    .line 2041
    :cond_61
    move-object/from16 v0, v53

    move-object/from16 v1, v52

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_60

    .line 2043
    move-object/from16 v0, v53

    move-object/from16 v1, v52

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2045
    const-string v4, "friendlyName"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v87

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2046
    const-string v4, "udn"

    move-object/from16 v0, v87

    move-object/from16 v1, v52

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2047
    const-string v4, "ProductName"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getProductName()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v87

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2048
    const-string v4, "bridgeudn"

    invoke-virtual/range {v24 .. v24}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v87

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2049
    move-object/from16 v0, v88

    move-object/from16 v1, v87

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto/16 :goto_2d

    .line 2053
    .end local v24    # "cacheDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v52    # "groupId":Ljava/lang/String;
    .end local v87    # "ledJO":Lorg/json/JSONObject;
    :cond_62
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Rules device list - List of LEDs and/or Groups returned: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v88 .. v88}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2054
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v88

    invoke-direct {v4, v5, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 2057
    .end local v53    # "groupsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v55    # "i$":Ljava/util/Iterator;
    .end local v88    # "ledsJA":Lorg/json/JSONArray;
    :sswitch_6c
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_SELECT_FOB_SENSOR_DEVICES::: "

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2058
    new-instance v30, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    const-string v5, "[]"

    move-object/from16 v0, v30

    invoke-direct {v0, v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 2059
    .local v30, "dataResultFOB":Lorg/apache/cordova/PluginResult;
    const/4 v4, 0x0

    move-object/from16 v0, v30

    invoke-virtual {v0, v4}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 2060
    move-object/from16 v0, p3

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 2074
    .end local v30    # "dataResultFOB":Lorg/apache/cordova/PluginResult;
    :sswitch_6d
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_SELECT_DOOR_WINDOW_SENSORS::: "

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2075
    new-instance v29, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    const-string v5, "[]"

    move-object/from16 v0, v29

    invoke-direct {v0, v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 2076
    .local v29, "dataResultDS":Lorg/apache/cordova/PluginResult;
    const/4 v4, 0x0

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 2077
    move-object/from16 v0, p3

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 2091
    .end local v29    # "dataResultDS":Lorg/apache/cordova/PluginResult;
    :sswitch_6e
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_SELECT_PIR_SENSORS::: "

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2092
    new-instance v28, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    const-string v5, "[]"

    move-object/from16 v0, v28

    invoke-direct {v0, v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 2093
    .local v28, "dataResult":Lorg/apache/cordova/PluginResult;
    const/4 v4, 0x0

    move-object/from16 v0, v28

    invoke-virtual {v0, v4}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 2094
    move-object/from16 v0, p3

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 2108
    .end local v28    # "dataResult":Lorg/apache/cordova/PluginResult;
    :sswitch_6f
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ACTION_REMOVE_LED_DEVICE::: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2110
    :try_start_b
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->removeLed(Ljava/lang/String;)Z
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_c

    .line 2115
    :goto_2e
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 2112
    :catch_c
    move-exception v42

    .line 2113
    .local v42, "e":Ljava/lang/Exception;
    invoke-virtual/range {v42 .. v42}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2e

    .line 2118
    .end local v42    # "e":Ljava/lang/Exception;
    :sswitch_70
    const-string v4, "DevicePlugin"

    const-string v5, "ACTION_ICON_UPLOAD_TO_CLOUD"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2120
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

    sget-object v5, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v5}, Lcom/belkin/utils/WiFiSecurityUtil;->generateAuthCode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v23

    .line 2122
    .local v23, "authHeader_icon":Ljava/lang/String;
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Auth Header... : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v23 .. v23}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2123
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Mac Address... : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2124
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "image Address... : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2125
    const/16 v4, 0x8

    new-array v4, v4, [Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->param:[Ljava/lang/String;

    .line 2126
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->param:[Ljava/lang/String;

    const/4 v5, 0x0

    const/16 v6, 0x139f

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    .line 2127
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->param:[Ljava/lang/String;

    const/4 v5, 0x1

    invoke-virtual/range {v23 .. v23}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    .line 2128
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->param:[Ljava/lang/String;

    const/4 v5, 0x2

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    .line 2129
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->param:[Ljava/lang/String;

    const/4 v5, 0x3

    const/4 v6, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    .line 2130
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->param:[Ljava/lang/String;

    const/4 v5, 0x4

    const/4 v6, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    .line 2131
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->param:[Ljava/lang/String;

    const/4 v5, 0x5

    const/4 v6, 0x3

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    .line 2132
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->param:[Ljava/lang/String;

    const/4 v5, 0x6

    const/4 v6, 0x4

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    .line 2133
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->param:[Ljava/lang/String;

    const/4 v5, 0x7

    const/4 v6, 0x5

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    .line 2134
    new-instance v4, Lcom/belkin/remoteservice/RestfulWebservice;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->param:[Ljava/lang/String;

    sget-object v6, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5, v6}, Lcom/belkin/remoteservice/RestfulWebservice;-><init>([Ljava/lang/String;Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->objHttpConnection:Lcom/belkin/remoteservice/RestfulWebservice;

    .line 2136
    :try_start_c
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->objHttpConnection:Lcom/belkin/remoteservice/RestfulWebservice;

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Void;

    invoke-virtual {v4, v5}, Lcom/belkin/remoteservice/RestfulWebservice;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v4

    invoke-virtual {v4}, Landroid/os/AsyncTask;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/remoteservice/HttpResponseObject;

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->httpResponseObject:Lcom/belkin/remoteservice/HttpResponseObject;

    .line 2137
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "HttpRes : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->httpResponseObject:Lcom/belkin/remoteservice/HttpResponseObject;

    invoke-virtual {v6}, Lcom/belkin/remoteservice/HttpResponseObject;->getResponseCode()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_c
    .catch Ljava/lang/InterruptedException; {:try_start_c .. :try_end_c} :catch_e
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_c .. :try_end_c} :catch_f

    .line 2146
    :goto_2f
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->objHttpConnection:Lcom/belkin/remoteservice/RestfulWebservice;

    invoke-virtual {v4}, Lcom/belkin/remoteservice/RestfulWebservice;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v4

    sget-object v5, Landroid/os/AsyncTask$Status;->RUNNING:Landroid/os/AsyncTask$Status;

    invoke-virtual {v4, v5}, Landroid/os/AsyncTask$Status;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_63

    .line 2148
    const-wide/16 v4, 0x3e8

    :try_start_d
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_d
    .catch Ljava/lang/InterruptedException; {:try_start_d .. :try_end_d} :catch_d

    goto :goto_2f

    .line 2149
    :catch_d
    move-exception v42

    .line 2151
    .local v42, "e":Ljava/lang/InterruptedException;
    invoke-virtual/range {v42 .. v42}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_2f

    .line 2138
    .end local v42    # "e":Ljava/lang/InterruptedException;
    :catch_e
    move-exception v43

    .line 2140
    .local v43, "e1":Ljava/lang/InterruptedException;
    invoke-virtual/range {v43 .. v43}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_2f

    .line 2141
    .end local v43    # "e1":Ljava/lang/InterruptedException;
    :catch_f
    move-exception v43

    .line 2143
    .local v43, "e1":Ljava/util/concurrent/ExecutionException;
    invoke-virtual/range {v43 .. v43}, Ljava/util/concurrent/ExecutionException;->printStackTrace()V

    goto :goto_2f

    .line 2155
    .end local v43    # "e1":Ljava/util/concurrent/ExecutionException;
    :cond_63
    new-instance v57, Lorg/json/JSONArray;

    invoke-direct/range {v57 .. v57}, Lorg/json/JSONArray;-><init>()V

    .line 2156
    .local v57, "iconResponse":Lorg/json/JSONArray;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->httpResponseObject:Lcom/belkin/remoteservice/HttpResponseObject;

    invoke-virtual {v4}, Lcom/belkin/remoteservice/HttpResponseObject;->getResponseCode()I

    move-result v130

    .line 2157
    .local v130, "status":I
    move-object/from16 v0, v57

    move/from16 v1, v130

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 2158
    const/16 v4, 0xc8

    move/from16 v0, v130

    if-ne v0, v4, :cond_64

    .line 2159
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->httpResponseObject:Lcom/belkin/remoteservice/HttpResponseObject;

    invoke-virtual {v4}, Lcom/belkin/remoteservice/HttpResponseObject;->getDataReceived()[B

    move-result-object v27

    .line 2160
    .local v27, "dataReceived":[B
    new-instance v4, Ljava/lang/String;

    move-object/from16 v0, v27

    invoke-direct {v4, v0}, Ljava/lang/String;-><init>([B)V

    move-object/from16 v0, v57

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 2163
    .end local v27    # "dataReceived":[B
    :cond_64
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Response code ICON UPLOAD TO CLOUD: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->httpResponseObject:Lcom/belkin/remoteservice/HttpResponseObject;

    invoke-virtual {v6}, Lcom/belkin/remoteservice/HttpResponseObject;->getResponseCode()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2164
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v57

    invoke-direct {v4, v5, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 2165
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 2166
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 2167
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 2171
    .end local v23    # "authHeader_icon":Ljava/lang/String;
    .end local v57    # "iconResponse":Lorg/json/JSONArray;
    .end local v130    # "status":I
    :sswitch_71
    const-string v113, ""

    .line 2172
    .local v113, "result":Ljava/lang/String;
    const-wide/16 v4, 0x0

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v86

    .line 2173
    .local v86, "latitude":Ljava/lang/Double;
    const-wide/16 v4, 0x0

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v95

    .line 2175
    .local v95, "longitude":Ljava/lang/Double;
    new-instance v51, Lcom/belkin/utils/GPSTracker;

    sget-object v4, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    move-object/from16 v0, v51

    invoke-direct {v0, v4}, Lcom/belkin/utils/GPSTracker;-><init>(Landroid/content/Context;)V

    .line 2176
    .local v51, "gps":Lcom/belkin/utils/GPSTracker;
    invoke-virtual/range {v51 .. v51}, Lcom/belkin/utils/GPSTracker;->canGetLocation()Z

    move-result v4

    if-eqz v4, :cond_65

    .line 2177
    invoke-virtual/range {v51 .. v51}, Lcom/belkin/utils/GPSTracker;->getLatitude()D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v86

    .line 2178
    invoke-virtual/range {v51 .. v51}, Lcom/belkin/utils/GPSTracker;->getLongitude()D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v95

    .line 2181
    :cond_65
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v113

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-char v5, Lcom/belkin/rules/utils/RulesConstants;->SHARP:C

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v86 .. v86}, Ljava/lang/Double;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-char v5, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v95 .. v95}, Ljava/lang/Double;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v113

    .line 2183
    move-object/from16 v0, p3

    move-object/from16 v1, v113

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2187
    .end local v51    # "gps":Lcom/belkin/utils/GPSTracker;
    .end local v86    # "latitude":Ljava/lang/Double;
    .end local v95    # "longitude":Ljava/lang/Double;
    .end local v113    # "result":Ljava/lang/String;
    :sswitch_72
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/utils/SharePreferences;->saveBridgeSetup(Ljava/lang/String;)V

    .line 2188
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 2191
    :sswitch_73
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getbridgeValues()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 2192
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 2193
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 2194
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 2195
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 2198
    :sswitch_74
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ACTION_SET_SHAREDPREF_FADER_TIME "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "---"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2199
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setFaderPref(Ljava/lang/String;Ljava/lang/String;)V

    .line 2200
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 2201
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 2202
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 2203
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 2206
    :sswitch_75
    const-string v4, "DevicePlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ACTION_GET_SHAREDPREF_FADER_TIME "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2207
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getFaderPref(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    .line 2208
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 2209
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mPluginResult:Lorg/apache/cordova/PluginResult;

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 2210
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_0

    .line 219
    nop

    :sswitch_data_0
    .sparse-switch
        0x44e -> :sswitch_5d
        0x7d0 -> :sswitch_1
        0x7d1 -> :sswitch_2
        0x7d2 -> :sswitch_5
        0x7d3 -> :sswitch_b
        0x7d4 -> :sswitch_c
        0x7d5 -> :sswitch_d
        0x7d6 -> :sswitch_e
        0x7d7 -> :sswitch_10
        0x7d8 -> :sswitch_11
        0x7d9 -> :sswitch_12
        0x7da -> :sswitch_14
        0x7db -> :sswitch_17
        0x7dc -> :sswitch_18
        0x7dd -> :sswitch_19
        0x7de -> :sswitch_36
        0x7df -> :sswitch_3c
        0x7e0 -> :sswitch_3d
        0x7e1 -> :sswitch_3e
        0x7e2 -> :sswitch_0
        0x7e3 -> :sswitch_4f
        0x7e4 -> :sswitch_50
        0x7e5 -> :sswitch_53
        0x7e6 -> :sswitch_54
        0x7e7 -> :sswitch_51
        0x7e8 -> :sswitch_52
        0x7ef -> :sswitch_15
        0x7f0 -> :sswitch_16
        0x7f1 -> :sswitch_56
        0x7f2 -> :sswitch_55
        0x7f3 -> :sswitch_57
        0x7f4 -> :sswitch_4a
        0x7f5 -> :sswitch_8
        0x7f6 -> :sswitch_9
        0x7f7 -> :sswitch_3
        0x802 -> :sswitch_35
        0x804 -> :sswitch_58
        0x805 -> :sswitch_59
        0x807 -> :sswitch_5a
        0x80a -> :sswitch_13
        0x80c -> :sswitch_5e
        0x80d -> :sswitch_5f
        0x80e -> :sswitch_60
        0x80f -> :sswitch_61
        0x810 -> :sswitch_62
        0x811 -> :sswitch_66
        0x812 -> :sswitch_63
        0x813 -> :sswitch_64
        0x814 -> :sswitch_67
        0x815 -> :sswitch_68
        0x816 -> :sswitch_6a
        0x817 -> :sswitch_f
        0x818 -> :sswitch_69
        0x819 -> :sswitch_6b
        0x81b -> :sswitch_74
        0x81c -> :sswitch_75
        0x81e -> :sswitch_3f
        0x820 -> :sswitch_4b
        0x821 -> :sswitch_65
        0x822 -> :sswitch_7
        0x823 -> :sswitch_6c
        0x824 -> :sswitch_6d
        0x825 -> :sswitch_6e
        0x826 -> :sswitch_6
        0x834 -> :sswitch_6f
        0x138a -> :sswitch_27
        0x138b -> :sswitch_2b
        0x138c -> :sswitch_1a
        0x138d -> :sswitch_1b
        0x138e -> :sswitch_20
        0x138f -> :sswitch_42
        0x1390 -> :sswitch_43
        0x1391 -> :sswitch_33
        0x1392 -> :sswitch_46
        0x1393 -> :sswitch_47
        0x1394 -> :sswitch_2d
        0x1396 -> :sswitch_2c
        0x1399 -> :sswitch_37
        0x139b -> :sswitch_31
        0x139c -> :sswitch_32
        0x139d -> :sswitch_45
        0x139e -> :sswitch_44
        0x139f -> :sswitch_70
        0x13a0 -> :sswitch_71
        0x13a1 -> :sswitch_38
        0x13a2 -> :sswitch_1f
        0x13ba -> :sswitch_2a
        0x13bb -> :sswitch_28
        0x13bd -> :sswitch_29
        0x13bf -> :sswitch_2e
        0x13e2 -> :sswitch_23
        0x13e4 -> :sswitch_39
        0x13e5 -> :sswitch_1c
        0x13e6 -> :sswitch_1d
        0x13e7 -> :sswitch_3a
        0x13e8 -> :sswitch_3b
        0x13e9 -> :sswitch_4
        0x13ea -> :sswitch_34
        0x15b3 -> :sswitch_1e
        0x1771 -> :sswitch_2f
        0x1772 -> :sswitch_30
        0x1774 -> :sswitch_48
        0x1775 -> :sswitch_49
        0x1f58 -> :sswitch_22
        0x1f59 -> :sswitch_72
        0x1f5a -> :sswitch_73
        0x232c -> :sswitch_4c
        0x232f -> :sswitch_5b
        0x2330 -> :sswitch_5c
        0x2335 -> :sswitch_a
        0x233f -> :sswitch_21
        0x2340 -> :sswitch_40
        0x2341 -> :sswitch_41
        0x2391 -> :sswitch_4d
        0x2392 -> :sswitch_4e
        0x251d -> :sswitch_24
        0x251e -> :sswitch_25
        0x251f -> :sswitch_26
    .end sparse-switch
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 2985
    const/16 v0, 0x3f3

    return v0
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 9
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 138
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 139
    invoke-interface {p1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    sput-object v6, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    .line 143
    new-instance v6, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    sget-object v7, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-direct {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 144
    new-instance v6, Lcom/belkin/wemo/cache/utils/SharePreferences;

    sget-object v7, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-direct {v6, v7}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 145
    invoke-static {}, Lcom/belkin/utils/RuleUtility;->doesRulesDBFileExist()Z

    move-result v0

    .line 146
    .local v0, "existence":Z
    const-string v6, "DevicePlugin"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "DB file exists:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    const-string v1, ""

    .line 149
    .local v1, "sourcePathStr":Ljava/lang/String;
    const-string v5, ""

    .line 151
    .local v5, "targetPathStr":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 152
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v7

    iget-object v7, v7, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "databases"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "pluginrules2.db"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 158
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getStoragePath()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "unzipped"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "pluginrules2.db"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 164
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getStoragePath()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "unzipped"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 168
    .local v4, "targetDirPath":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 170
    .local v3, "targetDirName":Ljava/io/File;
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v2

    .line 171
    .local v2, "srcFileExist":Z
    const-string v6, "DevicePlugin"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "RULE DB SOURCE FILE at "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " ,and targetPathStr:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ": srcFileExist = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    if-eqz v2, :cond_1

    .line 174
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_0

    .line 175
    invoke-virtual {v3}, Ljava/io/File;->mkdir()Z

    .line 177
    :cond_0
    invoke-static {v1, v5}, Lcom/belkin/utils/RuleUtility;->copyDBFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    .end local v2    # "srcFileExist":Z
    .end local v3    # "targetDirName":Ljava/io/File;
    .end local v4    # "targetDirPath":Ljava/lang/String;
    :cond_1
    iget-object v6, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isHomeNetwork()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 183
    sget-object v6, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    move-result-object v6

    sput-object v6, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    .line 184
    sget-object v6, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    sput-object v6, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 185
    sget-object v6, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-virtual {v6, p0}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->addNotificationListener(Lcom/belkin/wemo/localsdk/WeMoSDKContext$NotificationListener;)V

    .line 187
    :cond_2
    sget-object v6, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getInstance(Landroid/content/Context;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .line 188
    new-instance v6, Lcom/belkin/utils/WiFiSecurityUtil;

    invoke-direct {v6}, Lcom/belkin/utils/WiFiSecurityUtil;-><init>()V

    iput-object v6, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mWiFiSecurityUtil:Lcom/belkin/utils/WiFiSecurityUtil;

    .line 189
    new-instance v6, Lcom/belkin/utils/NetCamUtil;

    invoke-direct {v6}, Lcom/belkin/utils/NetCamUtil;-><init>()V

    iput-object v6, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->netCamUtil:Lcom/belkin/utils/NetCamUtil;

    .line 190
    new-instance v6, Lcom/belkin/utils/ExternalAppLaunchUtil;

    invoke-direct {v6}, Lcom/belkin/utils/ExternalAppLaunchUtil;-><init>()V

    iput-object v6, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->appLaunchUtil:Lcom/belkin/utils/ExternalAppLaunchUtil;

    .line 191
    sput-object p2, Lcom/belkin/cordova/plugin/DevicePlugin;->mWebView:Lorg/apache/cordova/CordovaWebView;

    .line 192
    sget-object v6, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/controller/AppController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/AppController;

    move-result-object v6

    iput-object v6, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mAppController:Lcom/belkin/controller/AppController;

    .line 193
    return-void
.end method

.method public onNotify(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "LedDeviceId"    # Ljava/lang/String;
    .param p3, "udn"    # Ljava/lang/String;

    .prologue
    .line 2432
    sget-object v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    if-nez v0, :cond_0

    .line 2618
    :goto_0
    return-void

    .line 2433
    :cond_0
    const-string v0, "DevicePlugin"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onnotify in deviceplugin LedDeviceId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " udn: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " message: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " hash: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/belkin/cordova/plugin/DevicePlugin;->hashCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected saveRemoteRegistrationData(Lorg/json/JSONArray;)V
    .locals 12
    .param p1, "inParamArray"    # Lorg/json/JSONArray;

    .prologue
    .line 2300
    :try_start_0
    const-string v4, ""

    .line 2301
    .local v4, "homeSSID":Ljava/lang/String;
    const/4 v8, 0x1

    .line 2302
    .local v8, "setupFallbackRouterSame":Z
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getSetupCredential()Ljava/lang/String;

    move-result-object v7

    .line 2303
    .local v7, "savedConfig":Ljava/lang/String;
    if-eqz v7, :cond_3

    .line 2304
    const-string v9, "\\|"

    invoke-virtual {v7, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 2305
    .local v1, "configArray":[Ljava/lang/String;
    const/4 v9, 0x0

    aget-object v4, v1, v9

    .line 2306
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 2308
    const/4 v8, 0x0

    .line 2312
    .end local v1    # "configArray":[Ljava/lang/String;
    :cond_0
    :goto_0
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteAutoEnableNeeded(Z)V

    .line 2313
    const/4 v9, 0x3

    invoke-virtual {p1, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 2314
    .local v6, "privateKey":Ljava/lang/String;
    const-string v9, "NOKEY"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 2315
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v9, v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storePrivateKey(Ljava/lang/String;)V

    .line 2318
    :cond_1
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const/4 v10, 0x2

    invoke-virtual {p1, v10}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storeHomeId(Ljava/lang/String;)V

    .line 2319
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 2320
    .local v5, "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {v5, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 2321
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v9, v5}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setHomeSSIDs(Ljava/util/Set;)Z

    .line 2322
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v9, v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteAccessSSID(Ljava/lang/String;)Z

    .line 2323
    if-eqz v8, :cond_2

    .line 2325
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getArpMac()Ljava/lang/String;

    move-result-object v2

    .line 2326
    .local v2, "currentArpMac":Ljava/lang/String;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_2

    .line 2328
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 2329
    .local v0, "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 2330
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setARPMacs(Ljava/util/Set;)Z

    .line 2333
    .end local v0    # "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v2    # "currentArpMac":Ljava/lang/String;
    :cond_2
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteEnabled(Z)Z

    .line 2334
    const-string v9, "DevicePlugin"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "saveRemoteRegistrationData: HomeId: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " PrivateKey: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getPrivateKey()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " HomeSSID: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeSSIDs()Ljava/util/Set;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " RemoteEnabled: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " setupFallbackRouterSame: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2338
    .end local v4    # "homeSSID":Ljava/lang/String;
    .end local v5    # "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v6    # "privateKey":Ljava/lang/String;
    .end local v7    # "savedConfig":Ljava/lang/String;
    .end local v8    # "setupFallbackRouterSame":Z
    :goto_1
    return-void

    .line 2311
    .restart local v4    # "homeSSID":Ljava/lang/String;
    .restart local v7    # "savedConfig":Ljava/lang/String;
    .restart local v8    # "setupFallbackRouterSame":Z
    :cond_3
    iget-object v9, p0, Lcom/belkin/cordova/plugin/DevicePlugin;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    goto/16 :goto_0

    .line 2335
    .end local v4    # "homeSSID":Ljava/lang/String;
    .end local v7    # "savedConfig":Ljava/lang/String;
    .end local v8    # "setupFallbackRouterSame":Z
    :catch_0
    move-exception v3

    .line 2336
    .local v3, "e":Ljava/lang/Exception;
    const-string v9, "DevicePlugin"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "saveRemoteRegistrationData Exception: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method
