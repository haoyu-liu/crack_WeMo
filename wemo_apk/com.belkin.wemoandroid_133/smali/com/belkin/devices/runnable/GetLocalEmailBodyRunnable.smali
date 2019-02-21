.class public Lcom/belkin/devices/runnable/GetLocalEmailBodyRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "GetLocalEmailBodyRunnable.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "GetLocalEmailBodyRunnable"


# instance fields
.field private mCallbackContext:Lorg/apache/cordova/CallbackContext;

.field private mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;


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
    iput-object v0, p0, Lcom/belkin/devices/runnable/GetLocalEmailBodyRunnable;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 17
    iput-object v0, p0, Lcom/belkin/devices/runnable/GetLocalEmailBodyRunnable;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .line 21
    iput-object p1, p0, Lcom/belkin/devices/runnable/GetLocalEmailBodyRunnable;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 22
    invoke-static {p2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getInstance(Landroid/content/Context;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/devices/runnable/GetLocalEmailBodyRunnable;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .line 23
    return-void
.end method

.method private onError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "exp"    # Ljava/lang/Exception;

    .prologue
    .line 40
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 41
    .local v0, "dataResult":Lorg/apache/cordova/PluginResult;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 42
    iget-object v1, p0, Lcom/belkin/devices/runnable/GetLocalEmailBodyRunnable;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 43
    return-void
.end method

.method private onSuccess(Ljava/lang/String;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 46
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1, p1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 47
    .local v0, "dataResult":Lorg/apache/cordova/PluginResult;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 48
    iget-object v1, p0, Lcom/belkin/devices/runnable/GetLocalEmailBodyRunnable;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 49
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 27
    iget-object v2, p0, Lcom/belkin/devices/runnable/GetLocalEmailBodyRunnable;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v2, :cond_0

    .line 29
    :try_start_0
    iget-object v2, p0, Lcom/belkin/devices/runnable/GetLocalEmailBodyRunnable;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-virtual {v2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getEmailData()Ljava/lang/String;

    move-result-object v1

    .line 30
    .local v1, "result":Ljava/lang/String;
    const-string v2, "GetLocalEmailBodyRunnable"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "GetLocalEmailBody result: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    invoke-direct {p0, v1}, Lcom/belkin/devices/runnable/GetLocalEmailBodyRunnable;->onSuccess(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .end local v1    # "result":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 32
    :catch_0
    move-exception v0

    .line 33
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "GetLocalEmailBodyRunnable"

    const-string v3, "Error during ACTION_GET_LOCAL_EMAIL_BODY"

    invoke-static {v2, v3, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 34
    invoke-direct {p0, v0}, Lcom/belkin/devices/runnable/GetLocalEmailBodyRunnable;->onError(Ljava/lang/Exception;)V

    goto :goto_0
.end method
