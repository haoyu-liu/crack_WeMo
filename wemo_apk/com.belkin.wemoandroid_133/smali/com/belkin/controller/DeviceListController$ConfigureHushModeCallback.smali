.class Lcom/belkin/controller/DeviceListController$ConfigureHushModeCallback;
.super Ljava/lang/Object;
.source "DeviceListController.java"

# interfaces
.implements Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;
.implements Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/controller/DeviceListController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConfigureHushModeCallback"
.end annotation


# instance fields
.field private callbackContext:Lorg/apache/cordova/CallbackContext;

.field final synthetic this$0:Lcom/belkin/controller/DeviceListController;


# direct methods
.method public constructor <init>(Lcom/belkin/controller/DeviceListController;Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 428
    iput-object p1, p0, Lcom/belkin/controller/DeviceListController$ConfigureHushModeCallback;->this$0:Lcom/belkin/controller/DeviceListController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 429
    iput-object p2, p0, Lcom/belkin/controller/DeviceListController$ConfigureHushModeCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 430
    return-void
.end method


# virtual methods
.method public onConfigureHushModeFailed(Ljava/lang/String;)V
    .locals 4
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 434
    const-string v1, "DeviceListController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ConfigureHushMode: ERROR: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 435
    iget-object v1, p0, Lcom/belkin/controller/DeviceListController$ConfigureHushModeCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_0

    .line 436
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 437
    .local v0, "result":Lorg/apache/cordova/PluginResult;
    iget-object v1, p0, Lcom/belkin/controller/DeviceListController$ConfigureHushModeCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 440
    .end local v0    # "result":Lorg/apache/cordova/PluginResult;
    :cond_0
    return-void
.end method

.method public onHushModeConfigured()V
    .locals 3

    .prologue
    .line 445
    const-string v1, "DeviceListController"

    const-string v2, "ConfigureHushMode: SUCCESS"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 446
    iget-object v1, p0, Lcom/belkin/controller/DeviceListController$ConfigureHushModeCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_0

    .line 447
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 448
    .local v0, "result":Lorg/apache/cordova/PluginResult;
    iget-object v1, p0, Lcom/belkin/controller/DeviceListController$ConfigureHushModeCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 451
    .end local v0    # "result":Lorg/apache/cordova/PluginResult;
    :cond_0
    return-void
.end method
