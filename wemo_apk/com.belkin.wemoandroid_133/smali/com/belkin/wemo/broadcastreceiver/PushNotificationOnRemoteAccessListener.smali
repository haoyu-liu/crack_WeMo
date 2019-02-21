.class public Lcom/belkin/wemo/broadcastreceiver/PushNotificationOnRemoteAccessListener;
.super Ljava/lang/Object;
.source "PushNotificationOnRemoteAccessListener.java"

# interfaces
.implements Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;


# static fields
.field public static final TAG:Ljava/lang/String;


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-class v0, Lcom/belkin/wemo/broadcastreceiver/PushNotificationOnRemoteAccessListener;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/broadcastreceiver/PushNotificationOnRemoteAccessListener;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/belkin/wemo/broadcastreceiver/PushNotificationOnRemoteAccessListener;->context:Landroid/content/Context;

    .line 15
    return-void
.end method


# virtual methods
.method public onRemoteAccessDisabled()V
    .locals 0

    .prologue
    .line 29
    return-void
.end method

.method public onRemoteAccessEnabled()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 22
    sget-object v0, Lcom/belkin/wemo/broadcastreceiver/PushNotificationOnRemoteAccessListener;->TAG:Ljava/lang/String;

    const-string v1, "ACTION_REMOTE_ENABLED broadcast received. Registering for Push Notifications again."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    invoke-static {}, Lcom/belkin/wemo/push/impl/PushNotificationFactory;->getInstance()Lcom/belkin/wemo/push/IPushNotification;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/broadcastreceiver/PushNotificationOnRemoteAccessListener;->context:Landroid/content/Context;

    invoke-interface {v0, v1, v2, v2}, Lcom/belkin/wemo/push/IPushNotification;->registerPushNotifications(Landroid/content/Context;Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;Lcom/belkin/wemo/push/callback/RegisterPushSuccessCallback;)V

    .line 24
    return-void
.end method
