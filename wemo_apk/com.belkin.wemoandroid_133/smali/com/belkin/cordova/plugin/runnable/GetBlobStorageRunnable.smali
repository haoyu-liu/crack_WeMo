.class public Lcom/belkin/cordova/plugin/runnable/GetBlobStorageRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "GetBlobStorageRunnable.java"


# static fields
.field private static TAG:Ljava/lang/String;


# instance fields
.field private mCallback:Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;

.field private mContext:Landroid/content/Context;

.field private mDLC:Lcom/belkin/controller/DeviceListController;

.field private mInParamArray:Lorg/json/JSONArray;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const-string v0, "GetBlobStorageRunnable"

    sput-object v0, Lcom/belkin/cordova/plugin/runnable/GetBlobStorageRunnable;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/json/JSONArray;Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;Landroid/content/Context;)V
    .locals 1
    .param p1, "inParamArray"    # Lorg/json/JSONArray;
    .param p2, "callback"    # Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/belkin/cordova/plugin/runnable/GetBlobStorageRunnable;->mInParamArray:Lorg/json/JSONArray;

    .line 24
    iput-object p2, p0, Lcom/belkin/cordova/plugin/runnable/GetBlobStorageRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;

    .line 25
    iput-object p3, p0, Lcom/belkin/cordova/plugin/runnable/GetBlobStorageRunnable;->mContext:Landroid/content/Context;

    .line 26
    iget-object v0, p0, Lcom/belkin/cordova/plugin/runnable/GetBlobStorageRunnable;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/controller/DeviceListController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/DeviceListController;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/runnable/GetBlobStorageRunnable;->mDLC:Lcom/belkin/controller/DeviceListController;

    .line 27
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 32
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 33
    .local v2, "msgObject":Lorg/json/JSONObject;
    const-string v3, ""

    .line 35
    .local v3, "udn":Ljava/lang/String;
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/GetBlobStorageRunnable;->mInParamArray:Lorg/json/JSONArray;

    if-eqz v4, :cond_3

    .line 36
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/GetBlobStorageRunnable;->mInParamArray:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-le v4, v5, :cond_2

    .line 37
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/GetBlobStorageRunnable;->mInParamArray:Lorg/json/JSONArray;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 38
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/GetBlobStorageRunnable;->mInParamArray:Lorg/json/JSONArray;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 39
    .local v0, "data":Lorg/json/JSONObject;
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/GetBlobStorageRunnable;->mDLC:Lcom/belkin/controller/DeviceListController;

    invoke-virtual {v4, v3, v0}, Lcom/belkin/controller/DeviceListController;->getBlobStorage(Ljava/lang/String;Lorg/json/JSONObject;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 40
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/GetBlobStorageRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;

    const-string v5, ""

    invoke-virtual {v4, v5}, Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;->onSuccess(Ljava/lang/String;)V

    .line 51
    .end local v0    # "data":Lorg/json/JSONObject;
    :goto_0
    const-string v4, "error"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 52
    sget-object v4, Lcom/belkin/cordova/plugin/runnable/GetBlobStorageRunnable;->TAG:Ljava/lang/String;

    const-string v5, "Error in run() of GetBlobStorageRunnable"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/GetBlobStorageRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;

    const-string v5, "error"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;->onError(Ljava/lang/String;)V

    .line 60
    .end local v2    # "msgObject":Lorg/json/JSONObject;
    .end local v3    # "udn":Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 42
    .restart local v0    # "data":Lorg/json/JSONObject;
    .restart local v2    # "msgObject":Lorg/json/JSONObject;
    .restart local v3    # "udn":Ljava/lang/String;
    :cond_1
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/GetBlobStorageRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;

    const-string v5, "Error in getBlobStorage"

    invoke-virtual {v4, v5}, Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;->onError(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 56
    .end local v0    # "data":Lorg/json/JSONObject;
    .end local v2    # "msgObject":Lorg/json/JSONObject;
    .end local v3    # "udn":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 57
    .local v1, "ex":Ljava/lang/Exception;
    sget-object v4, Lcom/belkin/cordova/plugin/runnable/GetBlobStorageRunnable;->TAG:Ljava/lang/String;

    const-string v5, "Exception in run() of GetBlobStorageRunnable: "

    invoke-static {v4, v5, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 45
    .end local v1    # "ex":Ljava/lang/Exception;
    .restart local v2    # "msgObject":Lorg/json/JSONObject;
    .restart local v3    # "udn":Ljava/lang/String;
    :cond_2
    :try_start_1
    const-string v4, "error"

    const-string v5, "Missing udn in inParamArray"

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 48
    :cond_3
    const-string v4, "error"

    const-string v5, "Null inParamArray"

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
