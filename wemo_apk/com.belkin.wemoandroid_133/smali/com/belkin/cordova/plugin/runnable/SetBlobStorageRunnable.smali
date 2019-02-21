.class public Lcom/belkin/cordova/plugin/runnable/SetBlobStorageRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "SetBlobStorageRunnable.java"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mCallback:Lcom/belkin/cordova/plugin/callback/SetBlobStorageCallback;

.field private mContext:Landroid/content/Context;

.field private mDLC:Lcom/belkin/controller/DeviceListController;

.field private mInParamArray:Lorg/json/JSONArray;


# direct methods
.method public constructor <init>(Lorg/json/JSONArray;Lcom/belkin/cordova/plugin/callback/SetBlobStorageCallback;Landroid/content/Context;)V
    .locals 1
    .param p1, "inParamArray"    # Lorg/json/JSONArray;
    .param p2, "callback"    # Lcom/belkin/cordova/plugin/callback/SetBlobStorageCallback;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 16
    const-string v0, "SetBlobStorageRunnable"

    iput-object v0, p0, Lcom/belkin/cordova/plugin/runnable/SetBlobStorageRunnable;->TAG:Ljava/lang/String;

    .line 24
    iput-object p1, p0, Lcom/belkin/cordova/plugin/runnable/SetBlobStorageRunnable;->mInParamArray:Lorg/json/JSONArray;

    .line 25
    iput-object p2, p0, Lcom/belkin/cordova/plugin/runnable/SetBlobStorageRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/SetBlobStorageCallback;

    .line 26
    iput-object p3, p0, Lcom/belkin/cordova/plugin/runnable/SetBlobStorageRunnable;->mContext:Landroid/content/Context;

    .line 27
    invoke-static {p3}, Lcom/belkin/controller/DeviceListController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/DeviceListController;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/runnable/SetBlobStorageRunnable;->mDLC:Lcom/belkin/controller/DeviceListController;

    .line 28
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 34
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 35
    .local v2, "msgObject":Lorg/json/JSONObject;
    const-string v3, ""

    .line 37
    .local v3, "udn":Ljava/lang/String;
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/SetBlobStorageRunnable;->mInParamArray:Lorg/json/JSONArray;

    if-eqz v4, :cond_3

    .line 38
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/SetBlobStorageRunnable;->mInParamArray:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-le v4, v5, :cond_2

    .line 39
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/SetBlobStorageRunnable;->mInParamArray:Lorg/json/JSONArray;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 40
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/SetBlobStorageRunnable;->mInParamArray:Lorg/json/JSONArray;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 41
    .local v0, "data":Lorg/json/JSONObject;
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/SetBlobStorageRunnable;->mDLC:Lcom/belkin/controller/DeviceListController;

    invoke-virtual {v4, v3, v0}, Lcom/belkin/controller/DeviceListController;->setBlobStorage(Ljava/lang/String;Lorg/json/JSONObject;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 42
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/SetBlobStorageRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/SetBlobStorageCallback;

    const-string v5, ""

    invoke-virtual {v4, v5}, Lcom/belkin/cordova/plugin/callback/SetBlobStorageCallback;->onSuccess(Ljava/lang/String;)V

    .line 54
    .end local v0    # "data":Lorg/json/JSONObject;
    :goto_0
    const-string v4, "error"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 55
    const-string v4, "SetBlobStorageRunnable"

    const-string v5, "Error in run() of SetBlobStorageRunnable"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/SetBlobStorageRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/SetBlobStorageCallback;

    const-string v5, "error"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/belkin/cordova/plugin/callback/SetBlobStorageCallback;->onError(Ljava/lang/String;)V

    .line 64
    .end local v2    # "msgObject":Lorg/json/JSONObject;
    .end local v3    # "udn":Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 44
    .restart local v0    # "data":Lorg/json/JSONObject;
    .restart local v2    # "msgObject":Lorg/json/JSONObject;
    .restart local v3    # "udn":Ljava/lang/String;
    :cond_1
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/SetBlobStorageRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/SetBlobStorageCallback;

    const-string v5, "Error in setBlobStorage"

    invoke-virtual {v4, v5}, Lcom/belkin/cordova/plugin/callback/SetBlobStorageCallback;->onError(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 59
    .end local v0    # "data":Lorg/json/JSONObject;
    .end local v2    # "msgObject":Lorg/json/JSONObject;
    .end local v3    # "udn":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 60
    .local v1, "ex":Ljava/lang/Exception;
    const-string v4, "SetBlobStorageRunnable"

    const-string v5, "Exception in run() ex: "

    invoke-static {v4, v5, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 48
    .end local v1    # "ex":Ljava/lang/Exception;
    .restart local v2    # "msgObject":Lorg/json/JSONObject;
    .restart local v3    # "udn":Ljava/lang/String;
    :cond_2
    :try_start_1
    const-string v4, "error"

    const-string v5, "Missing udn in inParamArray"

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 51
    :cond_3
    const-string v4, "error"

    const-string v5, "Null inParamArray"

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
