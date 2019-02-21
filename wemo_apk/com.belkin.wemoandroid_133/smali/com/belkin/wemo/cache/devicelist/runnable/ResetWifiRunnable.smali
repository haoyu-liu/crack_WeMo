.class public Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "ResetWifiRunnable.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ResetWifiRunnable"


# instance fields
.field private errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

.field private mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

.field private udn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;)V
    .locals 0
    .param p1, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;
    .param p2, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;
    .param p3, "oDLM"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p4, "udn"    # Ljava/lang/String;

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 23
    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 24
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

    .line 25
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    .line 26
    iput-object p4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;->udn:Ljava/lang/String;

    .line 27
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 31
    const/4 v3, 0x0

    .line 33
    .local v3, "wifiWasReset":Z
    :try_start_0
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;->udn:Ljava/lang/String;

    const-string v6, "5"

    invoke-virtual {v4, v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->resetPlugin(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    .line 34
    if-eqz v3, :cond_1

    .line 36
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;->udn:Ljava/lang/String;

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->removeDeviceByUDN(Ljava/lang/String;Z)V

    .line 37
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v4, :cond_0

    .line 39
    :try_start_1
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v5, "reset_wifi"

    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;->udn:Ljava/lang/String;

    const-string v7, "true"

    invoke-virtual {v4, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->prepareDeviceResetResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 40
    .local v2, "response":Lorg/json/JSONObject;
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;->onSuccess(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 57
    .end local v2    # "response":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v5, "reset_wifi"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v4, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    const-string v4, "ResetWifiRunnable"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Result of wifi reset operation: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    return-void

    .line 41
    :catch_0
    move-exception v0

    .line 42
    .local v0, "e":Lorg/json/JSONException;
    :try_start_2
    const-string v4, "ResetWifiRunnable"

    const-string v5, "exception in resetDeviceAll: "

    invoke-static {v4, v5, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 43
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    if-eqz v4, :cond_0

    .line 44
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;->onError(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 53
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v1

    .line 54
    .local v1, "ex":Ljava/lang/Exception;
    const-string v4, "ResetWifiRunnable"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception in ResetWifiRunnable:doInBackground ex:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 49
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_1
    :try_start_3
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    if-eqz v4, :cond_0

    .line 50
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    const-string v5, "RESET_WIFI  failed"

    invoke-interface {v4, v5}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;->onError(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0
.end method
