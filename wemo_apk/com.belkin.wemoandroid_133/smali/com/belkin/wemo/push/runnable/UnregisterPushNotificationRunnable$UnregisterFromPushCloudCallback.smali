.class Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$UnregisterFromPushCloudCallback;
.super Ljava/lang/Object;
.source "UnregisterPushNotificationRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/push/cmd/listener/UnregisterFromPushCloudListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UnregisterFromPushCloudCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;)V
    .locals 0

    .prologue
    .line 39
    iput-object p1, p0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$UnregisterFromPushCloudCallback;->this$0:Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;
    .param p2, "x1"    # Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$1;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$UnregisterFromPushCloudCallback;-><init>(Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;)V

    return-void
.end method


# virtual methods
.method public onUnregisterFailed(Lcom/belkin/wemo/push/error/PushNotificationError;)V
    .locals 1
    .param p1, "error"    # Lcom/belkin/wemo/push/error/PushNotificationError;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$UnregisterFromPushCloudCallback;->this$0:Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;

    iget-object v0, v0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;->errorCallback:Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;

    if-eqz v0, :cond_0

    .line 50
    iget-object v0, p0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$UnregisterFromPushCloudCallback;->this$0:Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;

    iget-object v0, v0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;->errorCallback:Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;

    invoke-interface {v0, p1}, Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;->onError(Lcom/belkin/wemo/push/error/PushNotificationError;)V

    .line 52
    :cond_0
    return-void
.end method

.method public onUnregisteredFromPushCloud(Ljava/lang/String;)V
    .locals 1
    .param p1, "registrationId"    # Ljava/lang/String;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$UnregisterFromPushCloudCallback;->this$0:Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;

    invoke-static {v0, p1}, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;->access$202(Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;Ljava/lang/String;)Ljava/lang/String;

    .line 44
    iget-object v0, p0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$UnregisterFromPushCloudCallback;->this$0:Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;

    iget-object v0, v0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;->pushNotificationLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 45
    return-void
.end method
