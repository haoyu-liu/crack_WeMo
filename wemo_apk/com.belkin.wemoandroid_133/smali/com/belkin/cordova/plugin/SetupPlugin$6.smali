.class Lcom/belkin/cordova/plugin/SetupPlugin$6;
.super Landroid/content/BroadcastReceiver;
.source "SetupPlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/SetupPlugin;->startSmartSetupListeners(Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/SetupPlugin;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/SetupPlugin;)V
    .locals 0

    .prologue
    .line 717
    iput-object p1, p0, Lcom/belkin/cordova/plugin/SetupPlugin$6;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

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

    .line 720
    const-string v1, "SetupPlugin"

    const-string v2, "trying to send positive result"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 722
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.controller.belkin.hybrid.WIFI_STATE_CHANGED"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 723
    const-string v1, "SetupPlugin"

    const-string v2, "onReceive(Context context, Intent intent):: com.controller.belkin.hybrid.WIFI_STATE_CHANGED"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 724
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "smartString"

    aput-object v1, v0, v3

    .line 725
    .local v0, "attrs":[Ljava/lang/String;
    iget-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin$6;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    const-string v2, "wifi_state_changed"

    invoke-static {v1, p2, v2, v0}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$1000(Lcom/belkin/cordova/plugin/SetupPlugin;Landroid/content/Intent;Ljava/lang/String;[Ljava/lang/String;)V

    .line 743
    .end local v0    # "attrs":[Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 726
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.controller.belkin.hybrid.CONNECTION_STATUS"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 727
    const-string v1, "SetupPlugin"

    const-string v2, "onReceive(Context context, Intent intent):: com.controller.belkin.hybrid.CONNECTION_STATUS"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 728
    const/4 v1, 0x2

    new-array v0, v1, [Ljava/lang/String;

    const-string v1, "smartString"

    aput-object v1, v0, v3

    const-string v1, "SSID"

    aput-object v1, v0, v4

    .line 729
    .restart local v0    # "attrs":[Ljava/lang/String;
    iget-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin$6;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    const-string v2, "smart_network_stablized"

    invoke-static {v1, p2, v2, v0}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$1000(Lcom/belkin/cordova/plugin/SetupPlugin;Landroid/content/Intent;Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_0

    .line 730
    .end local v0    # "attrs":[Ljava/lang/String;
    :cond_2
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.controller.belkin.hybrid.SMART_CHECK_WEMO"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 731
    const-string v1, "SetupPlugin"

    const-string v2, "onReceive(Context context, Intent intent):: com.controller.belkin.hybrid.SMART_CHECK_WEMO"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 732
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "smartString"

    aput-object v1, v0, v3

    .line 733
    .restart local v0    # "attrs":[Ljava/lang/String;
    iget-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin$6;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    const-string v2, "check_wemo_after_setup"

    invoke-static {v1, p2, v2, v0}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$1000(Lcom/belkin/cordova/plugin/SetupPlugin;Landroid/content/Intent;Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_0

    .line 734
    .end local v0    # "attrs":[Ljava/lang/String;
    :cond_3
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.controller.belkin.hybrid.SMART_REGISTRATION"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 735
    const-string v1, "SetupPlugin"

    const-string v2, "onReceive(Context context, Intent intent):: com.controller.belkin.hybrid.SMART_REGISTRATION"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 736
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "smartString"

    aput-object v1, v0, v3

    .line 737
    .restart local v0    # "attrs":[Ljava/lang/String;
    iget-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin$6;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    const-string v2, "smart_registration"

    invoke-static {v1, p2, v2, v0}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$1000(Lcom/belkin/cordova/plugin/SetupPlugin;Landroid/content/Intent;Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_0
.end method
