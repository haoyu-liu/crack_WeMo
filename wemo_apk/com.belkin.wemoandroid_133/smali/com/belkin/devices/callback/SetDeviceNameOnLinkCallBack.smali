.class public Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;
.super Ljava/lang/Object;
.source "SetDeviceNameOnLinkCallBack.java"

# interfaces
.implements Lcom/belkin/wemo/callback/SetAndGetActionCallBack;


# static fields
.field private static final TAG:Ljava/lang/String; = "SetDeviceNameOnLinkCallBack"


# instance fields
.field private mCallbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p1, "context"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 18
    return-void
.end method


# virtual methods
.method public onError()V
    .locals 3

    .prologue
    .line 22
    const-string v1, "SetDeviceNameOnLinkCallBack"

    const-string v2, "SetDeviceNameOnLinkCallBack: error during getting emergency contact."

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    iget-object v1, p0, Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_0

    .line 24
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 25
    .local v0, "dataResult":Lorg/apache/cordova/PluginResult;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 26
    iget-object v1, p0, Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 28
    .end local v0    # "dataResult":Lorg/apache/cordova/PluginResult;
    :cond_0
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 4
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 32
    const-string v1, "SetDeviceNameOnLinkCallBack"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onSuccess: result>> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    iget-object v1, p0, Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_0

    .line 34
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 35
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 36
    .local v0, "dataResult":Lorg/apache/cordova/PluginResult;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 37
    iget-object v1, p0, Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 44
    .end local v0    # "dataResult":Lorg/apache/cordova/PluginResult;
    :cond_0
    :goto_0
    return-void

    .line 40
    :cond_1
    const-string v1, "SetDeviceNameOnLinkCallBack"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error in setting the multiple device names :: deviceIDs "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    invoke-virtual {p0}, Lcom/belkin/devices/callback/SetDeviceNameOnLinkCallBack;->onError()V

    goto :goto_0
.end method
