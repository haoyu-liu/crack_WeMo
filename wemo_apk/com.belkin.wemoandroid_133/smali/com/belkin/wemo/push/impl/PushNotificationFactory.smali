.class public Lcom/belkin/wemo/push/impl/PushNotificationFactory;
.super Ljava/lang/Object;
.source "PushNotificationFactory.java"


# static fields
.field private static pushNotificationsIns:Lcom/belkin/wemo/push/IPushNotification;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/belkin/wemo/push/IPushNotification;
    .locals 2

    .prologue
    .line 15
    const-class v1, Lcom/belkin/wemo/push/impl/PushNotificationFactory;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/push/impl/PushNotificationFactory;->pushNotificationsIns:Lcom/belkin/wemo/push/IPushNotification;

    if-nez v0, :cond_0

    .line 16
    new-instance v0, Lcom/belkin/wemo/push/impl/PushNotificationImpl;

    invoke-direct {v0}, Lcom/belkin/wemo/push/impl/PushNotificationImpl;-><init>()V

    sput-object v0, Lcom/belkin/wemo/push/impl/PushNotificationFactory;->pushNotificationsIns:Lcom/belkin/wemo/push/IPushNotification;

    .line 18
    :cond_0
    sget-object v0, Lcom/belkin/wemo/push/impl/PushNotificationFactory;->pushNotificationsIns:Lcom/belkin/wemo/push/IPushNotification;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 15
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
