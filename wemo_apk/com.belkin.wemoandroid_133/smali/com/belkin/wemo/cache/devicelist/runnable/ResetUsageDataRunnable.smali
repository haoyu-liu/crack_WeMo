.class public Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "ResetUsageDataRunnable.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ResetUsageDataRunnable"


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
    .line 23
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 24
    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 25
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    .line 26
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

    .line 27
    iput-object p4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;->udn:Ljava/lang/String;

    .line 28
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 32
    const/4 v3, 0x0

    .line 33
    .local v3, "isResetSuccessful":Z
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;->udn:Ljava/lang/String;

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v8, v7, v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 36
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :try_start_0
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;->udn:Ljava/lang/String;

    const-string v7, "4"

    invoke-virtual {v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->resetPlugin(Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 37
    if-eqz v3, :cond_0

    .line 45
    :cond_0
    :goto_0
    if-eqz v3, :cond_2

    .line 46
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

    if-eqz v5, :cond_1

    .line 48
    :try_start_1
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v6, "reset_usage_data"

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;->udn:Ljava/lang/String;

    const-string v8, "true"

    invoke-virtual {v5, v6, v7, v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->prepareDeviceResetResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 49
    .local v4, "response":Lorg/json/JSONObject;
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;->onSuccess(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 63
    .end local v4    # "response":Lorg/json/JSONObject;
    :cond_1
    :goto_1
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v6, "reset_usage_data"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v5, v6, v7, v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    const-string v5, "ResetUsageDataRunnable"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Was reset operation successful: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    return-void

    .line 40
    :catch_0
    move-exception v2

    .line 41
    .local v2, "ex":Ljava/lang/Exception;
    const-string v5, "ResetUsageDataRunnable"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Exception in ResetWifiRunnable:doInBackground ex:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    const/4 v3, 0x0

    goto :goto_0

    .line 50
    .end local v2    # "ex":Ljava/lang/Exception;
    :catch_1
    move-exception v1

    .line 51
    .local v1, "e":Lorg/json/JSONException;
    const-string v5, "ResetUsageDataRunnable"

    const-string v6, "exception in RESET_USAGE_DATA: "

    invoke-static {v5, v6, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 52
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    if-eqz v5, :cond_1

    .line 53
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    invoke-virtual {v1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;->onError(Ljava/lang/String;)V

    goto :goto_1

    .line 58
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_2
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    if-eqz v5, :cond_1

    .line 59
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    const-string v6, "RESET_USAGE_DATA failed"

    invoke-interface {v5, v6}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;->onError(Ljava/lang/String;)V

    goto :goto_1
.end method
