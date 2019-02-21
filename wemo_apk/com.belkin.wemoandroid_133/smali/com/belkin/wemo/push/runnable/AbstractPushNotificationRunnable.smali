.class public abstract Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "AbstractPushNotificationRunnable.java"


# static fields
.field public static final PUSH_REGISTRATON_TIMEOUT:I = 0x2710

.field public static final REGISTER_PUSH_STEP:I = 0x1


# instance fields
.field protected context:Landroid/content/Context;

.field protected errorCallback:Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;

.field protected pushNotificationLatch:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;Landroid/content/Context;)V
    .locals 2
    .param p1, "errorCallback"    # Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;->errorCallback:Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;

    .line 29
    iput-object p2, p0, Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;->context:Landroid/content/Context;

    .line 30
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;->pushNotificationLatch:Ljava/util/concurrent/CountDownLatch;

    .line 31
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/16 v5, -0x64

    .line 38
    :try_start_0
    invoke-virtual {p0}, Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;->syncWithPushCloud()V

    .line 39
    iget-object v1, p0, Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;->pushNotificationLatch:Ljava/util/concurrent/CountDownLatch;

    const-wide/16 v2, 0x2710

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 40
    invoke-virtual {p0}, Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;->syncWithWeMoCloud()V

    .line 41
    iget-object v1, p0, Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;->pushNotificationLatch:Ljava/util/concurrent/CountDownLatch;

    const-wide/16 v2, 0x2710

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    .line 64
    :cond_0
    :goto_0
    return-void

    .line 43
    :cond_1
    iget-object v1, p0, Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;->TAG:Ljava/lang/String;

    const-string v2, "Push Notification: Timeout while trying to sync with Push Server"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    iget-object v1, p0, Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;->errorCallback:Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;

    if-eqz v1, :cond_0

    .line 45
    iget-object v1, p0, Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;->errorCallback:Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;

    new-instance v2, Lcom/belkin/wemo/push/error/PushNotificationError;

    const/16 v3, -0x64

    const-string v4, "Error during register/unregister Push Notification!"

    invoke-direct {v2, v3, v4}, Lcom/belkin/wemo/push/error/PushNotificationError;-><init>(ILjava/lang/String;)V

    invoke-interface {v1, v2}, Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;->onError(Lcom/belkin/wemo/push/error/PushNotificationError;)V
    :try_end_0
    .catch Lcom/belkin/wemo/exception/InvalidArgumentsException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 50
    :catch_0
    move-exception v0

    .line 52
    .local v0, "e":Lcom/belkin/wemo/exception/InvalidArgumentsException;
    iget-object v1, p0, Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;->TAG:Ljava/lang/String;

    const-string v2, "Push Notification: InvalidArgumentsException during register/un-register. "

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 53
    iget-object v1, p0, Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;->errorCallback:Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;

    if-eqz v1, :cond_0

    .line 54
    iget-object v1, p0, Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;->errorCallback:Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;

    new-instance v2, Lcom/belkin/wemo/push/error/PushNotificationError;

    invoke-virtual {v0}, Lcom/belkin/wemo/exception/InvalidArgumentsException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v5, v3}, Lcom/belkin/wemo/push/error/PushNotificationError;-><init>(ILjava/lang/String;)V

    invoke-interface {v1, v2}, Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;->onError(Lcom/belkin/wemo/push/error/PushNotificationError;)V

    goto :goto_0

    .line 57
    .end local v0    # "e":Lcom/belkin/wemo/exception/InvalidArgumentsException;
    :catch_1
    move-exception v0

    .line 59
    .local v0, "e":Ljava/lang/InterruptedException;
    iget-object v1, p0, Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;->TAG:Ljava/lang/String;

    const-string v2, "Push Notification: InterruptedException during push register/un-register. "

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 60
    iget-object v1, p0, Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;->errorCallback:Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;

    if-eqz v1, :cond_0

    .line 61
    iget-object v1, p0, Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;->errorCallback:Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;

    new-instance v2, Lcom/belkin/wemo/push/error/PushNotificationError;

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v5, v3}, Lcom/belkin/wemo/push/error/PushNotificationError;-><init>(ILjava/lang/String;)V

    invoke-interface {v1, v2}, Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;->onError(Lcom/belkin/wemo/push/error/PushNotificationError;)V

    goto :goto_0
.end method

.method protected abstract syncWithPushCloud()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation
.end method

.method protected abstract syncWithWeMoCloud()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation
.end method
