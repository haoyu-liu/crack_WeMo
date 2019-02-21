.class Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$UnregisterOnWeMoCloudCallback;
.super Ljava/lang/Object;
.source "UnregisterPushNotificationRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UnregisterOnWeMoCloudCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;)V
    .locals 0

    .prologue
    .line 55
    iput-object p1, p0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$UnregisterOnWeMoCloudCallback;->this$0:Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;
    .param p2, "x1"    # Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$1;

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$UnregisterOnWeMoCloudCallback;-><init>(Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;)V

    return-void
.end method


# virtual methods
.method public onUnregisterFailed(Lcom/belkin/wemo/push/error/PushNotificationError;)V
    .locals 1
    .param p1, "error"    # Lcom/belkin/wemo/push/error/PushNotificationError;

    .prologue
    .line 66
    iget-object v0, p0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$UnregisterOnWeMoCloudCallback;->this$0:Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;

    iget-object v0, v0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;->errorCallback:Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;

    if-eqz v0, :cond_0

    .line 67
    iget-object v0, p0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$UnregisterOnWeMoCloudCallback;->this$0:Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;

    iget-object v0, v0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;->errorCallback:Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;

    invoke-interface {v0, p1}, Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;->onError(Lcom/belkin/wemo/push/error/PushNotificationError;)V

    .line 69
    :cond_0
    return-void
.end method

.method public onUnregisteredFromWeMoCloud(Ljava/lang/String;)V
    .locals 1
    .param p1, "registrationId"    # Ljava/lang/String;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$UnregisterOnWeMoCloudCallback;->this$0:Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;->access$300(Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;)Lcom/belkin/wemo/push/callback/UnregisterPushSuccessCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 60
    iget-object v0, p0, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable$UnregisterOnWeMoCloudCallback;->this$0:Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;->access$300(Lcom/belkin/wemo/push/runnable/UnregisterPushNotificationRunnable;)Lcom/belkin/wemo/push/callback/UnregisterPushSuccessCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/belkin/wemo/push/callback/UnregisterPushSuccessCallback;->onSuccess()V

    .line 62
    :cond_0
    return-void
.end method
