.class Lcom/belkin/cordova/plugin/DevicePlugin$6;
.super Landroid/content/BroadcastReceiver;
.source "DevicePlugin.java"


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


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/DevicePlugin;)V
    .locals 0

    .prologue
    .line 727
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$6;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 730
    const-string v1, "DevicePlugin"

    const-string v2, "trying to send positive result"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 731
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.controller.belkin.hybrid.BRIDGE_DEVICES_STATUS"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 732
    const-string v1, "DevicePlugin"

    const-string v2, "onReceive(Context context, Intent intent):: com.controller.belkin.hybrid.BRIDGE_DEVICES_STATUS"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 733
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "getLedStatusList"

    aput-object v1, v0, v3

    .line 734
    .local v0, "attrs":[Ljava/lang/String;
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$6;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    const-string v2, "get_end_device_status_list"

    invoke-static {v1, p2, v2, v0}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$400(Lcom/belkin/cordova/plugin/DevicePlugin;Landroid/content/Intent;Ljava/lang/String;[Ljava/lang/String;)V

    .line 740
    .end local v0    # "attrs":[Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 735
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.controller.belkin.hybrid.BRIDGE_DEVICES"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 736
    const-string v1, "DevicePlugin"

    const-string v2, "onReceive(Context context, Intent intent):: com.controller.belkin.hybrid.BRIDGE_DEVICES"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 737
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "getLedList"

    aput-object v1, v0, v3

    .line 738
    .restart local v0    # "attrs":[Ljava/lang/String;
    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$6;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    const-string v2, "get_end_device_list"

    invoke-static {v1, p2, v2, v0}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$400(Lcom/belkin/cordova/plugin/DevicePlugin;Landroid/content/Intent;Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_0
.end method
