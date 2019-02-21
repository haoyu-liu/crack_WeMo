.class public Lcom/belkin/cordova/plugin/runnable/HideDeviceRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "HideDeviceRunnable.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "HideDeviceRunnable"


# instance fields
.field private mCallback:Lcom/belkin/cordova/plugin/callback/HideDeviceCallback;

.field private mContext:Landroid/content/Context;

.field private mDeviceListController:Lcom/belkin/controller/DeviceListController;

.field private mInParamArray:Lorg/json/JSONArray;


# direct methods
.method public constructor <init>(Lorg/json/JSONArray;Lcom/belkin/cordova/plugin/callback/HideDeviceCallback;Landroid/content/Context;)V
    .locals 1
    .param p1, "inParamArray"    # Lorg/json/JSONArray;
    .param p2, "callback"    # Lcom/belkin/cordova/plugin/callback/HideDeviceCallback;
    .param p3, "mContext"    # Landroid/content/Context;

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 23
    iput-object p3, p0, Lcom/belkin/cordova/plugin/runnable/HideDeviceRunnable;->mContext:Landroid/content/Context;

    .line 24
    iput-object p1, p0, Lcom/belkin/cordova/plugin/runnable/HideDeviceRunnable;->mInParamArray:Lorg/json/JSONArray;

    .line 25
    iput-object p2, p0, Lcom/belkin/cordova/plugin/runnable/HideDeviceRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/HideDeviceCallback;

    .line 26
    invoke-static {p3}, Lcom/belkin/controller/DeviceListController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/DeviceListController;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/runnable/HideDeviceRunnable;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    .line 27
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 32
    :try_start_0
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/HideDeviceRunnable;->mInParamArray:Lorg/json/JSONArray;

    if-eqz v4, :cond_2

    .line 33
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/HideDeviceRunnable;->mInParamArray:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lez v4, :cond_1

    .line 35
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/HideDeviceRunnable;->mInParamArray:Lorg/json/JSONArray;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 36
    .local v0, "devIds":Lorg/json/JSONObject;
    const-string v4, "udn"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 37
    const-string v4, "udn"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 38
    .local v3, "udn":Ljava/lang/String;
    const-string v4, "hide"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 39
    .local v2, "hide":I
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/HideDeviceRunnable;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    invoke-virtual {v4, v3, v2}, Lcom/belkin/controller/DeviceListController;->hideDevice(Ljava/lang/String;I)V

    .line 40
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/HideDeviceRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/HideDeviceCallback;

    const-string v5, "success hiding device"

    invoke-virtual {v4, v5}, Lcom/belkin/cordova/plugin/callback/HideDeviceCallback;->onSuccess(Ljava/lang/String;)V

    .line 54
    .end local v0    # "devIds":Lorg/json/JSONObject;
    .end local v2    # "hide":I
    .end local v3    # "udn":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 44
    :cond_1
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/HideDeviceRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/HideDeviceCallback;

    const-string v5, "empty mInParamArray"

    invoke-virtual {v4, v5}, Lcom/belkin/cordova/plugin/callback/HideDeviceCallback;->onError(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 49
    :catch_0
    move-exception v1

    .line 50
    .local v1, "ex":Ljava/lang/Exception;
    const-string v4, "HideDeviceRunnable"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception in run() method ex:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 52
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/HideDeviceRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/HideDeviceCallback;

    const-string v5, "Exception in run for HideDeviceRunnable"

    invoke-virtual {v4, v5}, Lcom/belkin/cordova/plugin/callback/HideDeviceCallback;->onError(Ljava/lang/String;)V

    goto :goto_0

    .line 47
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_2
    :try_start_1
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/HideDeviceRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/HideDeviceCallback;

    const-string v5, "null mInParamArray"

    invoke-virtual {v4, v5}, Lcom/belkin/cordova/plugin/callback/HideDeviceCallback;->onError(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
