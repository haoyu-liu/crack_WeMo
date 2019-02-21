.class Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable$RegisterOnWeMoCloudCallback;
.super Ljava/lang/Object;
.source "RegisterPushNotificationRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/push/cmd/listener/RegisterWithWeMoCloudListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RegisterOnWeMoCloudCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;)V
    .locals 0

    .prologue
    .line 72
    iput-object p1, p0, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable$RegisterOnWeMoCloudCallback;->this$0:Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;
    .param p2, "x1"    # Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable$1;

    .prologue
    .line 72
    invoke-direct {p0, p1}, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable$RegisterOnWeMoCloudCallback;-><init>(Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;)V

    return-void
.end method


# virtual methods
.method public onRegisteredWithCloud(Ljava/lang/String;)V
    .locals 1
    .param p1, "registrationId"    # Ljava/lang/String;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable$RegisterOnWeMoCloudCallback;->this$0:Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;->access$300(Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;)Lcom/belkin/wemo/push/callback/RegisterPushSuccessCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 85
    iget-object v0, p0, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable$RegisterOnWeMoCloudCallback;->this$0:Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;->access$300(Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;)Lcom/belkin/wemo/push/callback/RegisterPushSuccessCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/belkin/wemo/push/callback/RegisterPushSuccessCallback;->onSuccess()V

    .line 87
    :cond_0
    return-void
.end method

.method public onRegistrationFailed(Lcom/belkin/wemo/push/error/PushNotificationError;)V
    .locals 1
    .param p1, "error"    # Lcom/belkin/wemo/push/error/PushNotificationError;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable$RegisterOnWeMoCloudCallback;->this$0:Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;

    iget-object v0, v0, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;->errorCallback:Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable$RegisterOnWeMoCloudCallback;->this$0:Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;

    iget-object v0, v0, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;->errorCallback:Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;

    invoke-interface {v0, p1}, Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;->onError(Lcom/belkin/wemo/push/error/PushNotificationError;)V

    .line 80
    :cond_0
    return-void
.end method
