.class public Lcom/belkin/cordova/plugin/callback/HideGroupCallback;
.super Ljava/lang/Object;
.source "HideGroupCallback.java"

# interfaces
.implements Lcom/belkin/wemo/cache/devicelist/callback/HideGroupSuccessCallback;
.implements Lcom/belkin/wemo/cache/devicelist/callback/HideGroupErrorCallback;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private callbackContext:Lorg/apache/cordova/CallbackContext;

.field private plugin:Lcom/belkin/cordova/plugin/SmartDevicePlugin;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/CallbackContext;Lcom/belkin/cordova/plugin/SmartDevicePlugin;)V
    .locals 1
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "plugin"    # Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const-class v0, Lcom/belkin/cordova/plugin/callback/HideGroupCallback;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/cordova/plugin/callback/HideGroupCallback;->TAG:Ljava/lang/String;

    .line 21
    iput-object p1, p0, Lcom/belkin/cordova/plugin/callback/HideGroupCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 22
    iput-object p2, p0, Lcom/belkin/cordova/plugin/callback/HideGroupCallback;->plugin:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    .line 23
    return-void
.end method


# virtual methods
.method public onGroupHidden(Ljava/lang/String;)V
    .locals 6
    .param p1, "groupId"    # Ljava/lang/String;

    .prologue
    .line 37
    iget-object v3, p0, Lcom/belkin/cordova/plugin/callback/HideGroupCallback;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Hide group SUCCESS for groupID: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    iget-object v3, p0, Lcom/belkin/cordova/plugin/callback/HideGroupCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v3, :cond_0

    .line 39
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v3, p1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 40
    .local v0, "dataResult":Lorg/apache/cordova/PluginResult;
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 41
    iget-object v3, p0, Lcom/belkin/cordova/plugin/callback/HideGroupCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v3, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 44
    .end local v0    # "dataResult":Lorg/apache/cordova/PluginResult;
    :cond_0
    iget-object v3, p0, Lcom/belkin/cordova/plugin/callback/HideGroupCallback;->plugin:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    if-eqz v3, :cond_1

    .line 45
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 47
    .local v1, "device":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "groupID"

    invoke-virtual {v1, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 48
    iget-object v3, p0, Lcom/belkin/cordova/plugin/callback/HideGroupCallback;->plugin:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "window.smartDevicePlugin.onDeviceRemoved(\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\');"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sendJavascriptCB(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .end local v1    # "device":Lorg/json/JSONObject;
    :cond_1
    :goto_0
    return-void

    .line 49
    .restart local v1    # "device":Lorg/json/JSONObject;
    :catch_0
    move-exception v2

    .line 50
    .local v2, "e":Lorg/json/JSONException;
    iget-object v3, p0, Lcom/belkin/cordova/plugin/callback/HideGroupCallback;->TAG:Ljava/lang/String;

    const-string v4, "JSONException while creating JO for onDeviceRemoved() callback to JS: "

    invoke-static {v3, v4, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onHideGroupError(Lcom/belkin/wemo/error/WeMoError;)V
    .locals 4
    .param p1, "error"    # Lcom/belkin/wemo/error/WeMoError;

    .prologue
    .line 27
    iget-object v1, p0, Lcom/belkin/cordova/plugin/callback/HideGroupCallback;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error during hiding group: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    iget-object v1, p0, Lcom/belkin/cordova/plugin/callback/HideGroupCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_0

    .line 29
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual {p1}, Lcom/belkin/wemo/error/WeMoError;->getErrorMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 30
    .local v0, "dataResult":Lorg/apache/cordova/PluginResult;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 31
    iget-object v1, p0, Lcom/belkin/cordova/plugin/callback/HideGroupCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 33
    .end local v0    # "dataResult":Lorg/apache/cordova/PluginResult;
    :cond_0
    return-void
.end method
