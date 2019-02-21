.class Lcom/belkin/cordova/plugin/DevicePlugin$3;
.super Ljava/lang/Object;
.source "DevicePlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/DevicePlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 348
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$3;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$3;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 351
    const/4 v2, 0x0

    .line 352
    .local v2, "size":I
    const/4 v0, 0x0

    .line 354
    .local v0, "attempt":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 355
    const-wide/16 v4, 0x3e8

    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    .line 356
    sget-object v3, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getWeMoDeviceCount()I

    move-result v2

    .line 357
    const/16 v3, 0xa

    if-ge v0, v3, :cond_1

    if-eqz v2, :cond_0

    .line 358
    :cond_1
    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$3;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v5, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    invoke-static {v3, v4}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$102(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/PluginResult;)Lorg/apache/cordova/PluginResult;

    .line 359
    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$3;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v3}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$100(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/PluginResult;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 360
    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$3;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v3, :cond_2

    .line 361
    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$3;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    iget-object v4, p0, Lcom/belkin/cordova/plugin/DevicePlugin$3;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v4}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$100(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/PluginResult;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 365
    :cond_2
    :goto_0
    return-void

    .line 362
    :catch_0
    move-exception v1

    .line 363
    .local v1, "e":Ljava/lang/InterruptedException;
    const-string v3, "DevicePlugin"

    const-string v4, "Exception during ACTION_START_DISCOVERY"

    invoke-static {v3, v4, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
