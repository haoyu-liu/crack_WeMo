.class Lcom/belkin/cordova/plugin/DevicePlugin$StoreDeviceRulesCallback;
.super Ljava/lang/Object;
.source "DevicePlugin.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/cordova/plugin/DevicePlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StoreDeviceRulesCallback"
.end annotation


# instance fields
.field private context:Lorg/apache/cordova/CallbackContext;

.field final synthetic this$0:Lcom/belkin/cordova/plugin/DevicePlugin;


# direct methods
.method public constructor <init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p2, "context"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 2251
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$StoreDeviceRulesCallback;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2252
    iput-object p2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$StoreDeviceRulesCallback;->context:Lorg/apache/cordova/CallbackContext;

    .line 2253
    return-void
.end method


# virtual methods
.method public onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 4
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 2269
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$StoreDeviceRulesCallback;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v1}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1400(Lcom/belkin/cordova/plugin/DevicePlugin;)Ljava/util/HashMap;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 2270
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$StoreDeviceRulesCallback;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v1}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1400(Lcom/belkin/cordova/plugin/DevicePlugin;)Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 2273
    :cond_0
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$StoreDeviceRulesCallback;->context:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_1

    .line 2274
    const/4 v0, 0x0

    .line 2275
    .local v0, "errorMessage":Ljava/lang/String;
    if-eqz p1, :cond_2

    .line 2276
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorMessage()Ljava/lang/String;

    move-result-object v0

    .line 2280
    :goto_0
    const-string v1, "DevicePlugin"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Store Rules: Error - "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2281
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$StoreDeviceRulesCallback;->context:Lorg/apache/cordova/CallbackContext;

    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v2, v3, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 2283
    .end local v0    # "errorMessage":Ljava/lang/String;
    :cond_1
    return-void

    .line 2278
    .restart local v0    # "errorMessage":Ljava/lang/String;
    :cond_2
    const-string v0, "Error while processing Rules!"

    goto :goto_0
.end method

.method public onSuccess()V
    .locals 4

    .prologue
    .line 2257
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$StoreDeviceRulesCallback;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v0}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1400(Lcom/belkin/cordova/plugin/DevicePlugin;)Ljava/util/HashMap;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2258
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$StoreDeviceRulesCallback;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v0}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1400(Lcom/belkin/cordova/plugin/DevicePlugin;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 2260
    :cond_0
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$StoreDeviceRulesCallback;->context:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_1

    .line 2261
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$StoreDeviceRulesCallback;->context:Lorg/apache/cordova/CallbackContext;

    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    const-string v3, "true"

    invoke-direct {v1, v2, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 2264
    :cond_1
    return-void
.end method
