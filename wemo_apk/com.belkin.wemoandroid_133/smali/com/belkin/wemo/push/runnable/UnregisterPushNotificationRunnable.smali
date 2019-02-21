.class public Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;
.super Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;
.source "UnregisterPushNotificationRunnable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$1;,
        Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$UnregisterOnWeMoCloudCallback;,
        Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$UnregisterFromPushCloudCallback;
    }
.end annotation


# instance fields
.field private registrationId:Ljava/lang/String;

.field private successCallback:Lcom/belkin/wemo/push/callback/UnregisterPushSuccessCallback;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/push/callback/UnregisterPushSuccessCallback;Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;Landroid/content/Context;)V
    .locals 0
    .param p1, "successCallback"    # Lcom/belkin/wemo/push/callback/UnregisterPushSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    .line 22
    invoke-direct {p0, p2, p3}, Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;-><init>(Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;Landroid/content/Context;)V

    .line 23
    iput-object p1, p0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;->successCallback:Lcom/belkin/wemo/push/callback/UnregisterPushSuccessCallback;

    .line 24
    return-void
.end method

.method static synthetic access$202(Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 14
    iput-object p1, p0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;->registrationId:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$300(Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;)Lcom/belkin/wemo/push/callback/UnregisterPushSuccessCallback;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;->successCallback:Lcom/belkin/wemo/push/callback/UnregisterPushSuccessCallback;

    return-object v0
.end method


# virtual methods
.method protected syncWithPushCloud()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation

    .prologue
    .line 29
    invoke-static {}, Lcom/belkin/wemo/push/cmd/impl/PushNotificationCmdFactory;->instance()Lcom/belkin/wemo/push/cmd/IPushNotificationHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;->context:Landroid/content/Context;

    new-instance v2, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$UnregisterFromPushCloudCallback;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$UnregisterFromPushCloudCallback;-><init>(Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$1;)V

    invoke-interface {v0, v1, v2}, Lcom/belkin/wemo/push/cmd/IPushNotificationHandler;->unregisterFromPushServer(Landroid/content/Context;Lcom/belkin/wemo/push/cmd/listener/UnregisterFromPushCloudListener;)V

    .line 31
    return-void
.end method

.method protected syncWithWeMoCloud()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation

    .prologue
    .line 36
    iget-object v0, p0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;->registrationId:Ljava/lang/String;

    new-instance v2, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$UnregisterOnWeMoCloudCallback;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$UnregisterOnWeMoCloudCallback;-><init>(Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$1;)V

    invoke-static {v0, v1, v2}, Lcom/belkin/wemo/push/cloud/WeMoCloudPushMessagingUtility;->unregisterAppFromWeMoCloudForPush(Landroid/content/Context;Ljava/lang/String;Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;)V

    .line 37
    return-void
.end method
