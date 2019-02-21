.class Lcom/belkin/controller/DeviceListController$ConfigureDimmingRangeCallback;
.super Ljava/lang/Object;
.source "DeviceListController.java"

# interfaces
.implements Lcom/belkin/wemo/cache/devicelist/callback/ConfigureDimmingRangeErrorCallback;
.implements Lcom/belkin/wemo/cache/devicelist/callback/ConfigureDimmingRangeSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/controller/DeviceListController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConfigureDimmingRangeCallback"
.end annotation


# instance fields
.field private callbackContext:Lorg/apache/cordova/CallbackContext;

.field final synthetic this$0:Lcom/belkin/controller/DeviceListController;


# direct methods
.method public constructor <init>(Lcom/belkin/controller/DeviceListController;Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 221
    iput-object p1, p0, Lcom/belkin/controller/DeviceListController$ConfigureDimmingRangeCallback;->this$0:Lcom/belkin/controller/DeviceListController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 222
    iput-object p2, p0, Lcom/belkin/controller/DeviceListController$ConfigureDimmingRangeCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 223
    return-void
.end method


# virtual methods
.method public onDimmingConfigurationError(Ljava/lang/String;)V
    .locals 3
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 235
    const-string v0, "DeviceListController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ConfigureDimmingRange - ERROR: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 236
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController$ConfigureDimmingRangeCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_0

    .line 237
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController$ConfigureDimmingRangeCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2, p1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 239
    :cond_0
    return-void
.end method

.method public onDimmingRangeConfigured()V
    .locals 3

    .prologue
    .line 227
    const-string v0, "DeviceListController"

    const-string v1, "ConfigureDimmingRange - SUCCESS"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController$ConfigureDimmingRangeCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_0

    .line 229
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController$ConfigureDimmingRangeCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 231
    :cond_0
    return-void
.end method
