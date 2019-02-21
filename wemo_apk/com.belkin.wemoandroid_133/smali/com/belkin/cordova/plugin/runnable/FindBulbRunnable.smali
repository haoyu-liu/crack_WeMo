.class public Lcom/belkin/cordova/plugin/runnable/FindBulbRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "FindBulbRunnable.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "FindBulbRunnable"


# instance fields
.field private mCallback:Lcom/belkin/cordova/plugin/callback/FindBulbCallback;

.field private mContext:Landroid/content/Context;

.field private mDeviceListController:Lcom/belkin/controller/DeviceListController;

.field private mInParamArray:Lorg/json/JSONArray;


# direct methods
.method public constructor <init>(Lorg/json/JSONArray;Lcom/belkin/cordova/plugin/callback/FindBulbCallback;Landroid/content/Context;)V
    .locals 1
    .param p1, "inParamArray"    # Lorg/json/JSONArray;
    .param p2, "callback"    # Lcom/belkin/cordova/plugin/callback/FindBulbCallback;
    .param p3, "mContext"    # Landroid/content/Context;

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 23
    iput-object p3, p0, Lcom/belkin/cordova/plugin/runnable/FindBulbRunnable;->mContext:Landroid/content/Context;

    .line 24
    iput-object p1, p0, Lcom/belkin/cordova/plugin/runnable/FindBulbRunnable;->mInParamArray:Lorg/json/JSONArray;

    .line 25
    iput-object p2, p0, Lcom/belkin/cordova/plugin/runnable/FindBulbRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/FindBulbCallback;

    .line 26
    invoke-static {p3}, Lcom/belkin/controller/DeviceListController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/DeviceListController;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/runnable/FindBulbRunnable;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    .line 27
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 32
    :try_start_0
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/FindBulbRunnable;->mInParamArray:Lorg/json/JSONArray;

    if-eqz v4, :cond_1

    .line 33
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/FindBulbRunnable;->mInParamArray:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lez v4, :cond_0

    .line 35
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/FindBulbRunnable;->mInParamArray:Lorg/json/JSONArray;

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

    move-result-object v2

    .line 38
    .local v2, "ledDeviceId":Ljava/lang/String;
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/FindBulbRunnable;->mDeviceListController:Lcom/belkin/controller/DeviceListController;

    invoke-virtual {v4, v2}, Lcom/belkin/controller/DeviceListController;->findLedBulb(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 39
    .local v3, "oDeviceResult":Lorg/json/JSONArray;
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/FindBulbRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/FindBulbCallback;

    invoke-virtual {v3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/belkin/cordova/plugin/callback/FindBulbCallback;->onSuccess(Ljava/lang/String;)V

    .line 50
    .end local v0    # "devIds":Lorg/json/JSONObject;
    .end local v2    # "ledDeviceId":Ljava/lang/String;
    .end local v3    # "oDeviceResult":Lorg/json/JSONArray;
    :cond_0
    :goto_0
    return-void

    .line 44
    :cond_1
    iget-object v4, p0, Lcom/belkin/cordova/plugin/runnable/FindBulbRunnable;->mCallback:Lcom/belkin/cordova/plugin/callback/FindBulbCallback;

    const-string v5, "null mInParamArray"

    invoke-virtual {v4, v5}, Lcom/belkin/cordova/plugin/callback/FindBulbCallback;->onError(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 46
    :catch_0
    move-exception v1

    .line 47
    .local v1, "ex":Ljava/lang/Exception;
    const-string v4, "FindBulbRunnable"

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

    .line 48
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
