.class Lcom/belkin/cordova/plugin/DevicePlugin$12;
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

.field final synthetic val$inParamArray:Lorg/json/JSONArray;

.field final synthetic val$isHomeNetwork:Z


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/DevicePlugin;ZLorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 1479
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$12;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    iput-boolean p2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$12;->val$isHomeNetwork:Z

    iput-object p3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$12;->val$inParamArray:Lorg/json/JSONArray;

    iput-object p4, p0, Lcom/belkin/cordova/plugin/DevicePlugin$12;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    .line 1483
    iget-boolean v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$12;->val$isHomeNetwork:Z

    if-eqz v1, :cond_0

    .line 1485
    :try_start_0
    const-string v1, "DevicePlugin"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ACTION_IS_FIRMWARE_AVAILABLE :: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$12;->val$inParamArray:Lorg/json/JSONArray;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " second argument ::"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$12;->val$inParamArray:Lorg/json/JSONArray;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1486
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$12;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    iget-object v4, p0, Lcom/belkin/cordova/plugin/DevicePlugin$12;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v4}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/cordova/plugin/DevicePlugin$12;->val$inParamArray:Lorg/json/JSONArray;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/cordova/plugin/DevicePlugin$12;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v6}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/cordova/plugin/DevicePlugin$12;->val$inParamArray:Lorg/json/JSONArray;

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getCurrentFirmwareVersion(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->isFirmwareAvailable(Ljava/lang/String;Lorg/json/JSONArray;)Z

    move-result v4

    invoke-direct {v2, v3, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    invoke-static {v1, v2}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$102(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/PluginResult;)Lorg/apache/cordova/PluginResult;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1497
    :goto_0
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$12;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v1}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$100(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/PluginResult;

    move-result-object v1

    invoke-virtual {v1, v9}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 1498
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$12;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    iget-object v2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$12;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v2}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$100(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/PluginResult;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 1499
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$12;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 1500
    return-void

    .line 1487
    :catch_0
    move-exception v0

    .line 1488
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 1492
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$12;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    iget-object v4, p0, Lcom/belkin/cordova/plugin/DevicePlugin$12;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v4}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/cordova/plugin/DevicePlugin$12;->val$inParamArray:Lorg/json/JSONArray;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/cordova/plugin/DevicePlugin$12;->val$inParamArray:Lorg/json/JSONArray;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->isFirmwareAvailable(Ljava/lang/String;Lorg/json/JSONArray;)Z

    move-result v4

    invoke-direct {v2, v3, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Z)V

    invoke-static {v1, v2}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$102(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/PluginResult;)Lorg/apache/cordova/PluginResult;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 1493
    :catch_1
    move-exception v0

    .line 1494
    .restart local v0    # "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method
