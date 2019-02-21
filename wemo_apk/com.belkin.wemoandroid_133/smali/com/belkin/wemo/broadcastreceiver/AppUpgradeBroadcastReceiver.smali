.class public Lcom/belkin/wemo/broadcastreceiver/AppUpgradeBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "AppUpgradeBroadcastReceiver.java"


# static fields
.field public static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const-class v0, Lcom/belkin/wemo/broadcastreceiver/AppUpgradeBroadcastReceiver;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/broadcastreceiver/AppUpgradeBroadcastReceiver;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v3, 0x0

    .line 16
    sget-object v0, Lcom/belkin/wemo/broadcastreceiver/AppUpgradeBroadcastReceiver;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Broadcast received: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.MY_PACKAGE_REPLACED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 21
    sget-object v0, Lcom/belkin/wemo/broadcastreceiver/AppUpgradeBroadcastReceiver;->TAG:Ljava/lang/String;

    const-string v1, "ACTION_MY_PACKAGE_REPLACED broadcast received. Registering for Push Notifications again."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    invoke-static {}, Lcom/belkin/wemo/push/impl/PushNotificationFactory;->getInstance()Lcom/belkin/wemo/push/IPushNotification;

    move-result-object v0

    invoke-interface {v0, p1, v3, v3}, Lcom/belkin/wemo/push/IPushNotification;->registerPushNotifications(Landroid/content/Context;Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;Lcom/belkin/wemo/push/callback/RegisterPushSuccessCallback;)V

    .line 24
    :cond_0
    return-void
.end method
