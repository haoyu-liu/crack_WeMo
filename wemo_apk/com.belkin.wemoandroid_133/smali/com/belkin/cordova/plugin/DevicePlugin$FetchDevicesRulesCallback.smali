.class Lcom/belkin/cordova/plugin/DevicePlugin$FetchDevicesRulesCallback;
.super Ljava/lang/Object;
.source "DevicePlugin.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncErrorCallback;
.implements Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/cordova/plugin/DevicePlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FetchDevicesRulesCallback"
.end annotation


# instance fields
.field private context:Lorg/apache/cordova/CallbackContext;

.field final synthetic this$0:Lcom/belkin/cordova/plugin/DevicePlugin;


# direct methods
.method public constructor <init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p2, "context"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 2226
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$FetchDevicesRulesCallback;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2227
    iput-object p2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$FetchDevicesRulesCallback;->context:Lorg/apache/cordova/CallbackContext;

    .line 2228
    return-void
.end method


# virtual methods
.method public onError()V
    .locals 4

    .prologue
    .line 2233
    const-string v0, "DevicePlugin"

    const-string v1, "FetchDevicerulesCallback: error during fetchRules()."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2234
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$FetchDevicesRulesCallback;->context:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_0

    .line 2235
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$FetchDevicesRulesCallback;->context:Lorg/apache/cordova/CallbackContext;

    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    const-string v3, "Error while processing Rules!"

    invoke-direct {v1, v2, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 2237
    :cond_0
    return-void
.end method

.method public onSuccess(Ljava/lang/String;I)V
    .locals 3
    .param p1, "rules"    # Ljava/lang/String;
    .param p2, "latestDBVersion"    # I

    .prologue
    .line 2241
    const-string v0, "DevicePlugin"

    const-string v1, "FetchDevicerulesCallback: fetchRules() succeeded."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2242
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$FetchDevicesRulesCallback;->context:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_0

    .line 2243
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$FetchDevicesRulesCallback;->context:Lorg/apache/cordova/CallbackContext;

    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2, p1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 2245
    :cond_0
    return-void
.end method
