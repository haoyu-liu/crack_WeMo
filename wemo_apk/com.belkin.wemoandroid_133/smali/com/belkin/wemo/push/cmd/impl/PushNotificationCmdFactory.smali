.class public Lcom/belkin/wemo/push/cmd/impl/PushNotificationCmdFactory;
.super Ljava/lang/Object;
.source "PushNotificationCmdFactory.java"


# static fields
.field private static pushNotificationCmdsInstance:Lcom/belkin/wemo/push/cmd/IPushNotificationHandler;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized instance()Lcom/belkin/wemo/push/cmd/IPushNotificationHandler;
    .locals 2

    .prologue
    .line 11
    const-class v1, Lcom/belkin/wemo/push/cmd/impl/PushNotificationCmdFactory;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/push/cmd/impl/PushNotificationCmdFactory;->pushNotificationCmdsInstance:Lcom/belkin/wemo/push/cmd/IPushNotificationHandler;

    if-nez v0, :cond_0

    .line 12
    invoke-static {}, Lcom/belkin/wemo/push/cmd/impl/PushNotificationCmdFactory;->setCurrentPushNotificationInstance()V

    .line 14
    :cond_0
    sget-object v0, Lcom/belkin/wemo/push/cmd/impl/PushNotificationCmdFactory;->pushNotificationCmdsInstance:Lcom/belkin/wemo/push/cmd/IPushNotificationHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 11
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static setCurrentPushNotificationInstance()V
    .locals 1

    .prologue
    .line 18
    invoke-static {}, Lcom/belkin/wemo/utils/WeMoPushUtils;->isADMAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 19
    new-instance v0, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;

    invoke-direct {v0}, Lcom/belkin/wemo/push/cmd/impl/KindlePushNotificationHandler;-><init>()V

    sput-object v0, Lcom/belkin/wemo/push/cmd/impl/PushNotificationCmdFactory;->pushNotificationCmdsInstance:Lcom/belkin/wemo/push/cmd/IPushNotificationHandler;

    .line 23
    :goto_0
    return-void

    .line 21
    :cond_0
    new-instance v0, Lcom/belkin/wemo/push/cmd/impl/GCMPushNotificationHandler;

    invoke-direct {v0}, Lcom/belkin/wemo/push/cmd/impl/GCMPushNotificationHandler;-><init>()V

    sput-object v0, Lcom/belkin/wemo/push/cmd/impl/PushNotificationCmdFactory;->pushNotificationCmdsInstance:Lcom/belkin/wemo/push/cmd/IPushNotificationHandler;

    goto :goto_0
.end method
