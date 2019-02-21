.class public Lcom/belkin/devices/runnable/GetMobileNetworkRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "GetMobileNetworkRunnable.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "GetMobileNetworkRunnable"


# instance fields
.field private mCallbackContext:Lorg/apache/cordova/CallbackContext;

.field private mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/CallbackContext;Landroid/content/Context;)V
    .locals 1
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 20
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 16
    iput-object v0, p0, Lcom/belkin/devices/runnable/GetMobileNetworkRunnable;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 17
    iput-object v0, p0, Lcom/belkin/devices/runnable/GetMobileNetworkRunnable;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 21
    iput-object p1, p0, Lcom/belkin/devices/runnable/GetMobileNetworkRunnable;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 22
    new-instance v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-direct {v0, p2}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/devices/runnable/GetMobileNetworkRunnable;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 23
    return-void
.end method

.method private onError(Ljava/lang/String;)V
    .locals 4
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 39
    const-string v1, "GetMobileNetworkRunnable"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onError: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 41
    .local v0, "dataResult":Lorg/apache/cordova/PluginResult;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 42
    iget-object v1, p0, Lcom/belkin/devices/runnable/GetMobileNetworkRunnable;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 43
    return-void
.end method

.method private onSuccess(Ljava/lang/String;)V
    .locals 4
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 46
    const-string v1, "GetMobileNetworkRunnable"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onSuccess: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1, p1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 48
    .local v0, "dataResult":Lorg/apache/cordova/PluginResult;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 49
    iget-object v1, p0, Lcom/belkin/devices/runnable/GetMobileNetworkRunnable;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 50
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 27
    iget-object v1, p0, Lcom/belkin/devices/runnable/GetMobileNetworkRunnable;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_0

    .line 28
    iget-object v1, p0, Lcom/belkin/devices/runnable/GetMobileNetworkRunnable;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getNetworkType()Ljava/lang/String;

    move-result-object v0

    .line 29
    .local v0, "result":Ljava/lang/String;
    const-string v1, "GetMobileNetworkRunnable"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "result: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 31
    invoke-direct {p0, v0}, Lcom/belkin/devices/runnable/GetMobileNetworkRunnable;->onSuccess(Ljava/lang/String;)V

    .line 36
    .end local v0    # "result":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 33
    .restart local v0    # "result":Ljava/lang/String;
    :cond_1
    invoke-direct {p0, v0}, Lcom/belkin/devices/runnable/GetMobileNetworkRunnable;->onError(Ljava/lang/String;)V

    goto :goto_0
.end method
