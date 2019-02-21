.class Lcom/belkin/cordova/plugin/DevicePlugin$7;
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


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 772
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$7;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$7;->val$inParamArray:Lorg/json/JSONArray;

    iput-object p3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$7;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 775
    :try_start_0
    const-string v1, "DevicePlugin"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SET_DEVICE_IMAGE: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$7;->val$inParamArray:Lorg/json/JSONArray;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 776
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$7;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v1}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$7;->val$inParamArray:Lorg/json/JSONArray;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$7;->val$inParamArray:Lorg/json/JSONArray;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setIconUsingUri(Landroid/net/Uri;Ljava/lang/String;)V

    .line 777
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$7;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v2, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    invoke-static {v1, v2}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$102(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/PluginResult;)Lorg/apache/cordova/PluginResult;

    .line 778
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$7;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v1}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$100(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/PluginResult;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 779
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$7;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    iget-object v2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$7;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v2}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$100(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/PluginResult;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 780
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$7;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1}, Lorg/apache/cordova/CallbackContext;->success()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 784
    :goto_0
    return-void

    .line 781
    :catch_0
    move-exception v0

    .line 782
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
