.class public Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;
.super Ljava/lang/Object;
.source "GetBlobStorageCallback.java"

# interfaces
.implements Lcom/belkin/cordova/plugin/callback/SuccessPluginResultCallback;
.implements Lcom/belkin/cordova/plugin/callback/ErrorPluginResultCallback;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mCallbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/CallbackContext;)V
    .locals 1
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const-string v0, "GetSetBlobStorageCallback"

    iput-object v0, p0, Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;->TAG:Ljava/lang/String;

    .line 18
    iput-object p1, p0, Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 19
    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/String;)V
    .locals 4
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 23
    const-string v1, "GetSetBlobStorageCallback"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "GetSetBlobStorageCallback: onError() callback. error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    iget-object v1, p0, Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_0

    .line 25
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1, p1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 26
    .local v0, "dataResult":Lorg/apache/cordova/PluginResult;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 27
    iget-object v1, p0, Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 30
    .end local v0    # "dataResult":Lorg/apache/cordova/PluginResult;
    :cond_0
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 6
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 34
    const-string v3, "GetSetBlobStorageCallback"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "GetSetBlobStorageCallback: onSuccess() callback. result: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    :try_start_0
    iget-object v3, p0, Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v3, :cond_0

    .line 38
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 39
    .local v2, "tempResult":Lorg/json/JSONArray;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 40
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v3, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V

    .line 45
    .local v0, "dataResult":Lorg/apache/cordova/PluginResult;
    :goto_0
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 46
    iget-object v3, p0, Lcom/belkin/cordova/plugin/callback/GetBlobStorageCallback;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v3, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 51
    .end local v0    # "dataResult":Lorg/apache/cordova/PluginResult;
    .end local v2    # "tempResult":Lorg/json/JSONArray;
    :cond_0
    :goto_1
    return-void

    .line 42
    .restart local v2    # "tempResult":Lorg/json/JSONArray;
    :cond_1
    new-instance v2, Lorg/json/JSONArray;

    .end local v2    # "tempResult":Lorg/json/JSONArray;
    invoke-direct {v2, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 43
    .restart local v2    # "tempResult":Lorg/json/JSONArray;
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v3, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .restart local v0    # "dataResult":Lorg/apache/cordova/PluginResult;
    goto :goto_0

    .line 48
    .end local v0    # "dataResult":Lorg/apache/cordova/PluginResult;
    .end local v2    # "tempResult":Lorg/json/JSONArray;
    :catch_0
    move-exception v1

    .line 49
    .local v1, "ex":Ljava/lang/Exception;
    const-string v3, "GetSetBlobStorageCallback"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception in onSuccess ex:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method
