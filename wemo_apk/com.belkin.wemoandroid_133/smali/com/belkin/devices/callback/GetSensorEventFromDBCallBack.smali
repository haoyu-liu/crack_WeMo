.class public Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;
.super Ljava/lang/Object;
.source "GetSensorEventFromDBCallBack.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "GetSensorEventFromDBCallBack"


# instance fields
.field private mCallbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p1, "context"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 15
    return-void
.end method


# virtual methods
.method public onError()V
    .locals 3

    .prologue
    .line 18
    const-string v1, "GetSensorEventFromDBCallBack"

    const-string v2, "GetSensorEventFromDBCallBack: error during fetching sensor event history from DB"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    iget-object v1, p0, Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_0

    .line 20
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 21
    .local v0, "dataResult":Lorg/apache/cordova/PluginResult;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 22
    iget-object v1, p0, Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 24
    .end local v0    # "dataResult":Lorg/apache/cordova/PluginResult;
    :cond_0
    return-void
.end method

.method public onSuccess(Lorg/json/JSONArray;)V
    .locals 4
    .param p1, "result"    # Lorg/json/JSONArray;

    .prologue
    .line 27
    const-string v1, "GetSensorEventFromDBCallBack"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ":: GetSensorEventFromDBCallBack: success fetching data from DB ::"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    iget-object v1, p0, Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_0

    .line 29
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1, p1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V

    .line 30
    .local v0, "dataResult":Lorg/apache/cordova/PluginResult;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 31
    iget-object v1, p0, Lcom/belkin/devices/callback/GetSensorEventFromDBCallBack;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 34
    .end local v0    # "dataResult":Lorg/apache/cordova/PluginResult;
    :cond_0
    return-void
.end method
