.class public Lcom/belkin/cordova/plugin/runnable/ResetDeviceRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "ResetDeviceRunnable.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ResetDeviceRunnable"


# instance fields
.field private mCallback:Lcom/belkin/cordova/plugin/callback/ResetDeviceCallback;

.field private mDeviceListController:Lcom/belkin/controller/DeviceListController;

.field private mInParamArray:Lorg/json/JSONArray;


# direct methods
.method public constructor <init>(Lorg/json/JSONArray;Lcom/belkin/cordova/plugin/callback/ResetDeviceCallback;Lcom/belkin/controller/DeviceListController;)V
    .locals 0
    .param p1, "inParamArray"    # Lorg/json/JSONArray;
    .param p2, "callback"    # Lcom/belkin/cordova/plugin/callback/ResetDeviceCallback;
    .param p3, "deviceListController"    # Lcom/belkin/controller/DeviceListController;

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/belkin/cordova/plugin/runnable/ResetDeviceRunnable;->mInParamArray:Lorg/json/JSONArray;

    .line 21
    iput-object p2, p0, Lcom/belkin/cordova/plugin/runnable/ResetDeviceRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/ResetDeviceCallback;

    .line 22
    iput-object p3, p0, Lcom/belkin/cordova/plugin/runnable/ResetDeviceRunnable;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    .line 23
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/4 v1, 0x2

    .line 31
    :try_start_0
    iget-object v0, p0, Lcom/belkin/cordova/plugin/runnable/ResetDeviceRunnable;->mInParamArray:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-le v0, v1, :cond_1

    .line 32
    iget-object v0, p0, Lcom/belkin/cordova/plugin/runnable/ResetDeviceRunnable;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/runnable/ResetDeviceRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/ResetDeviceCallback;

    iget-object v2, p0, Lcom/belkin/cordova/plugin/runnable/ResetDeviceRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/ResetDeviceCallback;

    iget-object v3, p0, Lcom/belkin/cordova/plugin/runnable/ResetDeviceRunnable;->mInParamArray:Lorg/json/JSONArray;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/ResetDeviceRunnable;->mInParamArray:Lorg/json/JSONArray;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/cordova/plugin/runnable/ResetDeviceRunnable;->mInParamArray:Lorg/json/JSONArray;

    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Boolean;

    invoke-virtual/range {v0 .. v6}, Lcom/belkin/controller/DeviceListController;->resetDevice(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;[Ljava/lang/Boolean;)Lorg/json/JSONObject;

    move-result-object v8

    .line 38
    .local v8, "oDeviceListResponse":Lorg/json/JSONObject;
    :goto_0
    const-string v0, "error"

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 39
    const-string v0, "ResetDeviceRunnable"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error in run() of resetDevice: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    iget-object v0, p0, Lcom/belkin/cordova/plugin/runnable/ResetDeviceRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/ResetDeviceCallback;

    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/cordova/plugin/callback/ResetDeviceCallback;->onError(Ljava/lang/String;)V

    .line 46
    .end local v8    # "oDeviceListResponse":Lorg/json/JSONObject;
    :cond_0
    :goto_1
    return-void

    .line 35
    :cond_1
    iget-object v0, p0, Lcom/belkin/cordova/plugin/runnable/ResetDeviceRunnable;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/runnable/ResetDeviceRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/ResetDeviceCallback;

    iget-object v2, p0, Lcom/belkin/cordova/plugin/runnable/ResetDeviceRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/ResetDeviceCallback;

    iget-object v3, p0, Lcom/belkin/cordova/plugin/runnable/ResetDeviceRunnable;->mInParamArray:Lorg/json/JSONArray;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/ResetDeviceRunnable;->mInParamArray:Lorg/json/JSONArray;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Boolean;

    invoke-virtual/range {v0 .. v6}, Lcom/belkin/controller/DeviceListController;->resetDevice(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;[Ljava/lang/Boolean;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .restart local v8    # "oDeviceListResponse":Lorg/json/JSONObject;
    goto :goto_0

    .line 42
    .end local v8    # "oDeviceListResponse":Lorg/json/JSONObject;
    :catch_0
    move-exception v7

    .line 43
    .local v7, "ex":Ljava/lang/Exception;
    const-string v0, "ResetDeviceRunnable"

    const-string v1, "Exception in run() of resetDevice: "

    invoke-static {v0, v1, v7}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 44
    iget-object v0, p0, Lcom/belkin/cordova/plugin/runnable/ResetDeviceRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/ResetDeviceCallback;

    const-string v1, "{\"error\":\"Exception in run() of resetDevice\""

    invoke-virtual {v0, v1}, Lcom/belkin/cordova/plugin/callback/ResetDeviceCallback;->onError(Ljava/lang/String;)V

    goto :goto_1
.end method
