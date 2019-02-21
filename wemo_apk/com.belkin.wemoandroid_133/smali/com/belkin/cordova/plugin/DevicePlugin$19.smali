.class Lcom/belkin/cordova/plugin/DevicePlugin$19;
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
    .line 1939
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$19;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$19;->val$inParamArray:Lorg/json/JSONArray;

    iput-object p3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$19;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 1941
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$19;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    invoke-static {v1, v2}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1002(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/json/JSONArray;)Lorg/json/JSONArray;

    .line 1943
    :try_start_0
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$19;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    iget-object v2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$19;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v2}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$19;->val$inParamArray:Lorg/json/JSONArray;

    invoke-virtual {v2, v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->parseGetEndDeviceList(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1002(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/json/JSONArray;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1948
    :goto_0
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$19;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    iget-object v2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$19;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-static {v1, v2}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1102(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)Lorg/apache/cordova/CallbackContext;

    .line 1950
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$19;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v1}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1300(Lcom/belkin/cordova/plugin/DevicePlugin;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$19;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v2}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1200(Lcom/belkin/cordova/plugin/DevicePlugin;)Ljava/lang/Runnable;

    move-result-object v2

    const-wide/16 v4, 0x1388

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1951
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$19;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v1}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 1952
    const-string v1, "DevicePlugin"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "leddevices callback GetEndDevices:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$19;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v3}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1953
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$19;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v1}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1300(Lcom/belkin/cordova/plugin/DevicePlugin;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$19;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v2}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1200(Lcom/belkin/cordova/plugin/DevicePlugin;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1954
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$19;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    iget-object v4, p0, Lcom/belkin/cordova/plugin/DevicePlugin$19;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v4}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V

    invoke-static {v1, v2}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$102(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/PluginResult;)Lorg/apache/cordova/PluginResult;

    .line 1955
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$19;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v1}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$100(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/PluginResult;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 1956
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$19;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    iget-object v2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$19;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v2}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$100(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/PluginResult;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 1957
    :cond_0
    return-void

    .line 1944
    :catch_0
    move-exception v0

    .line 1945
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "DevicePlugin"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method
