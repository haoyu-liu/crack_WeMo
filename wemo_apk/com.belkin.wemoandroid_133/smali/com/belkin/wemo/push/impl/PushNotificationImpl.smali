.class public Lcom/belkin/wemo/push/impl/PushNotificationImpl;
.super Ljava/lang/Object;
.source "PushNotificationImpl.java"

# interfaces
.implements Lcom/belkin/wemo/push/IPushNotification;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized registerPushNotifications(Landroid/content/Context;Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;Lcom/belkin/wemo/push/callback/RegisterPushSuccessCallback;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;
    .param p3, "successCallback"    # Lcom/belkin/wemo/push/callback/RegisterPushSuccessCallback;

    .prologue
    .line 20
    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;

    invoke-direct {v0, p2, p3, p1}, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;-><init>(Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;Lcom/belkin/wemo/push/callback/RegisterPushSuccessCallback;Landroid/content/Context;)V

    invoke-static {v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    monitor-exit p0

    return-void

    .line 20
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized unregisterPushNotifications(Landroid/content/Context;Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;Lcom/belkin/wemo/push/callback/UnregisterPushSuccessCallback;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;
    .param p3, "successCallback"    # Lcom/belkin/wemo/push/callback/UnregisterPushSuccessCallback;

    .prologue
    .line 28
    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;

    invoke-direct {v0, p3, p2, p1}, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;-><init>(Lcom/belkin/wemo/push/callback/UnregisterPushSuccessCallback;Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;Landroid/content/Context;)V

    invoke-static {v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    monitor-exit p0

    return-void

    .line 28
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
