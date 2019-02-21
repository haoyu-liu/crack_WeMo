.class public Lcom/belkin/cordova/plugin/FirmwareUpdatePlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "FirmwareUpdatePlugin.java"

# interfaces
.implements Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;


# static fields
.field public static final ACTION_FW_PROGRESS_STATUS:Ljava/lang/String; = "isFWUpdateInProgress"

.field public static final ACTION_GET_AVAILABLE_UPDATES:Ljava/lang/String; = "getAvailableUpdates"

.field public static final ACTION_GET_UPDATE_STATUS:Ljava/lang/String; = "sendUpdateStatus"

.field public static final ACTION_INITIATE_FIRMWARE_UPDATE:Ljava/lang/String; = "doFirmwareUpdate"

.field public static final TAG:Ljava/lang/String; = "FirmwareUpdatePlugin"


# instance fields
.field private firmwareUpdateTimer:Ljava/util/Timer;

.field private mAppController:Lcom/belkin/controller/AppController;

.field private mContext:Landroid/content/Context;

.field private mDeviceListController:Lcom/belkin/controller/DeviceListController;

.field private mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 46
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/FirmwareUpdatePlugin;->mContext:Landroid/content/Context;

    .line 48
    return-void
.end method

.method private sendJavascriptCB(Ljava/lang/String;)V
    .locals 2
    .param p1, "cb"    # Ljava/lang/String;

    .prologue
    .line 125
    const-string v0, "smartDevicePlugin:Native:sendJavascriptCB cb"

    invoke-static {v0, p1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    iget-object v0, p0, Lcom/belkin/cordova/plugin/FirmwareUpdatePlugin;->webView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/belkin/cordova/plugin/FirmwareUpdatePlugin;->mAppController:Lcom/belkin/controller/AppController;

    if-eqz v0, :cond_0

    .line 127
    iget-object v0, p0, Lcom/belkin/cordova/plugin/FirmwareUpdatePlugin;->mAppController:Lcom/belkin/controller/AppController;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/FirmwareUpdatePlugin;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, v1, p1}, Lcom/belkin/controller/AppController;->sendJSCallBack(Lorg/apache/cordova/CordovaWebView;Ljava/lang/String;)V

    .line 129
    :cond_0
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 11
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "inParamArray"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 62
    const-string v7, "FirmwareUpdatePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "action: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    const-string v7, "doFirmwareUpdate"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 65
    const-string v7, "FirmwareUpdatePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " action: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "inputParams:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    const-string v7, "FirmwareUpdatePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "ACTION_INITIATE_FIRMWARE_UPDATE"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    new-instance v7, Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-object v8, p0, Lcom/belkin/cordova/plugin/FirmwareUpdatePlugin;->mContext:Landroid/content/Context;

    invoke-direct {v7, v8}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/belkin/cordova/plugin/FirmwareUpdatePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 68
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 69
    .local v0, "date":Ljava/util/Date;
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    .line 70
    .local v4, "milliSec":J
    const-string v7, "FirmwareUpdatePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " Firmware upgrade started on: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    iget-object v7, p0, Lcom/belkin/cordova/plugin/FirmwareUpdatePlugin;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v7, v4, v5}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setCurrentTimeStamp(J)V

    .line 74
    new-instance v1, Lcom/belkin/cordova/plugin/callback/FirmwareUpdateCallback;

    invoke-direct {v1, p3}, Lcom/belkin/cordova/plugin/callback/FirmwareUpdateCallback;-><init>(Lorg/apache/cordova/CallbackContext;)V

    .line 75
    .local v1, "firmwareUpdateCallback":Lcom/belkin/cordova/plugin/callback/FirmwareUpdateCallback;
    if-eqz p2, :cond_1

    .line 76
    new-instance v7, Lcom/belkin/cordova/plugin/runnable/FirmwareUpdateRunnable;

    invoke-direct {v7, p2, v1}, Lcom/belkin/cordova/plugin/runnable/FirmwareUpdateRunnable;-><init>(Lorg/json/JSONArray;Lcom/belkin/cordova/plugin/callback/FirmwareUpdateCallback;)V

    invoke-static {v7}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    .line 108
    .end local v0    # "date":Ljava/util/Date;
    .end local v1    # "firmwareUpdateCallback":Lcom/belkin/cordova/plugin/callback/FirmwareUpdateCallback;
    .end local v4    # "milliSec":J
    :cond_0
    :goto_0
    const/4 v7, 0x1

    return v7

    .line 78
    .restart local v0    # "date":Ljava/util/Date;
    .restart local v1    # "firmwareUpdateCallback":Lcom/belkin/cordova/plugin/callback/FirmwareUpdateCallback;
    .restart local v4    # "milliSec":J
    :cond_1
    const-string v7, "null inParamArray"

    invoke-virtual {v1, v7}, Lcom/belkin/cordova/plugin/callback/FirmwareUpdateCallback;->onError(Ljava/lang/String;)V

    goto :goto_0

    .line 81
    .end local v0    # "date":Ljava/util/Date;
    .end local v1    # "firmwareUpdateCallback":Lcom/belkin/cordova/plugin/callback/FirmwareUpdateCallback;
    .end local v4    # "milliSec":J
    :cond_2
    const-string v7, "getAvailableUpdates"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 82
    new-instance v6, Ljava/text/SimpleDateFormat;

    const-string v7, "dd/MM/yyyy HH:mm:ss"

    sget-object v8, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v6, v7, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 83
    .local v6, "timeStampFormat":Ljava/text/SimpleDateFormat;
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 84
    .restart local v0    # "date":Ljava/util/Date;
    const-string v7, "FirmwareUpdatePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "ACTION_GET_AVAILABLE_UPDATES"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    const-string v7, "FirmwareUpdatePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "ACTION_GET_AVAILABLE_UPDATES"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v6, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    invoke-static {p2}, Lcom/belkin/firmware/FirmwareUpdateManager;->getAvailableUpdates(Lorg/json/JSONArray;)V

    .line 89
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v7, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v7}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 90
    .local v3, "pluginResult":Lorg/apache/cordova/PluginResult;
    invoke-virtual {v3, v10}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 91
    invoke-virtual {p3, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 92
    .end local v0    # "date":Ljava/util/Date;
    .end local v3    # "pluginResult":Lorg/apache/cordova/PluginResult;
    .end local v6    # "timeStampFormat":Ljava/text/SimpleDateFormat;
    :cond_3
    const-string v7, "sendUpdateStatus"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 93
    const-string v7, "FirmwareUpdatePlugin"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "ACTION_GET_UPDATE_STATUS:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v7

    if-nez v7, :cond_0

    .line 96
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-lez v7, :cond_0

    .line 97
    invoke-virtual {p2, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "udn"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    const-string v10, "status"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, ""

    invoke-static {v7, v8, v9}, Lcom/belkin/firmware/FirmwareUpdateManager;->updateUpgradeStatus(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 100
    :cond_4
    const-string v7, "isFWUpdateInProgress"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 101
    iget-object v7, p0, Lcom/belkin/cordova/plugin/FirmwareUpdatePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    invoke-virtual {v7}, Lcom/belkin/controller/DeviceListController;->isFWUpgradeInProgress()Z

    move-result v2

    .line 102
    .local v2, "isFWProgress":Z
    if-eqz v2, :cond_5

    .line 103
    const-string v7, "true"

    invoke-virtual {p3, v7}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 105
    :cond_5
    const-string v7, "false"

    invoke-virtual {p3, v7}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
    .locals 2
    .param p1, "cordova"    # Lorg/apache/cordova/CordovaInterface;
    .param p2, "webView"    # Lorg/apache/cordova/CordovaWebView;

    .prologue
    .line 51
    const-string v0, "FirmwareUpdatePlugin"

    const-string v1, "FirmwareUpdatePlugin initialize"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/CordovaPlugin;->initialize(Lorg/apache/cordova/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 53
    invoke-interface {p1}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/FirmwareUpdatePlugin;->mContext:Landroid/content/Context;

    .line 54
    iget-object v0, p0, Lcom/belkin/cordova/plugin/FirmwareUpdatePlugin;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/controller/AppController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/AppController;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/FirmwareUpdatePlugin;->mAppController:Lcom/belkin/controller/AppController;

    .line 55
    iget-object v0, p0, Lcom/belkin/cordova/plugin/FirmwareUpdatePlugin;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/controller/DeviceListController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/DeviceListController;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/FirmwareUpdatePlugin;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    .line 56
    return-void
.end method

.method public onNotify(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "status"    # Ljava/lang/String;
    .param p3, "udn"    # Ljava/lang/String;

    .prologue
    .line 113
    const-string v0, "FirmwareUpdateStatus"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 114
    const-string v0, "FirmwareUpdatePlugin"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "FirmwareUpdateStatus status:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " udn:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "window.firmwareUpdatePlugin.onStatusChange(\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\',\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\');"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/cordova/plugin/FirmwareUpdatePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    .line 122
    :cond_0
    :goto_0
    return-void

    .line 117
    :cond_1
    const-string v0, "SubDeviceFWUpdate"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 118
    const-string v0, "FirmwareUpdatePlugin"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SubDeviceFWUpdate status:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " udn:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "window.firmwareUpdatePlugin.onStatusChange(\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\',\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\');"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/cordova/plugin/FirmwareUpdatePlugin;->sendJavascriptCB(Ljava/lang/String;)V

    goto :goto_0
.end method
