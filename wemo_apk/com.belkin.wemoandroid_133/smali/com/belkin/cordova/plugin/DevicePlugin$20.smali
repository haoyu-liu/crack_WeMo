.class Lcom/belkin/cordova/plugin/DevicePlugin$20;
.super Ljava/lang/Object;
.source "DevicePlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/cordova/plugin/DevicePlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/DevicePlugin;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/DevicePlugin;)V
    .locals 0

    .prologue
    .line 2288
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$20;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 2290
    const-string v0, "DevicePlugin"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "leddevices callback update task:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$20;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v2}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2291
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$20;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$20;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v3}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V

    invoke-static {v0, v1}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$102(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/PluginResult;)Lorg/apache/cordova/PluginResult;

    .line 2292
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$20;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v0}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$100(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/PluginResult;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 2293
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$20;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v0}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1100(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$20;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v1}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$100(Lcom/belkin/cordova/plugin/DevicePlugin;)Lorg/apache/cordova/PluginResult;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 2294
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$20;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v0}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1300(Lcom/belkin/cordova/plugin/DevicePlugin;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$20;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v1}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1200(Lcom/belkin/cordova/plugin/DevicePlugin;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 2295
    return-void
.end method
