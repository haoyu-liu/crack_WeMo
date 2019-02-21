.class public Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;
.super Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;
.source "RegisterPushNotificationRunnable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable$1;,
        Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable$RegisterOnWeMoCloudCallback;,
        Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable$RegisterOnPushCloudCallback;
    }
.end annotation


# static fields
.field public static final PUSH_REGISTRATON_TIMEOUT:I = 0x2710

.field public static final REGISTER_PUSH_STEP:I = 0x1


# instance fields
.field private registrationId:Ljava/lang/String;

.field private successCallback:Lcom/belkin/wemo/push/callback/RegisterPushSuccessCallback;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;Lcom/belkin/wemo/push/callback/RegisterPushSuccessCallback;Landroid/content/Context;)V
    .locals 0
    .param p1, "errorCallback"    # Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;
    .param p2, "successCallback"    # Lcom/belkin/wemo/push/callback/RegisterPushSuccessCallback;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    .line 27
    invoke-direct {p0, p1, p3}, Lcom/belkin/wemo/push/runnable/AbstractPushNotificationRunnable;-><init>(Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;Landroid/content/Context;)V

    .line 28
    iput-object p2, p0, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;->successCallback:Lcom/belkin/wemo/push/callback/RegisterPushSuccessCallback;

    .line 29
    return-void
.end method

.method static synthetic access$202(Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 14
    iput-object p1, p0, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;->registrationId:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$300(Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;)Lcom/belkin/wemo/push/callback/RegisterPushSuccessCallback;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;->successCallback:Lcom/belkin/wemo/push/callback/RegisterPushSuccessCallback;

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
    .line 34
    invoke-static {}, Lcom/belkin/wemo/push/cmd/impl/PushNotificationCmdFactory;->instance()Lcom/belkin/wemo/push/cmd/IPushNotificationHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;->context:Landroid/content/Context;

    new-instance v2, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable$RegisterOnPushCloudCallback;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable$RegisterOnPushCloudCallback;-><init>(Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable$1;)V

    invoke-interface {v0, v1, v2}, Lcom/belkin/wemo/push/cmd/IPushNotificationHandler;->registerWithPushServer(Landroid/content/Context;Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;)V

    .line 35
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
    .line 40
    iget-object v0, p0, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;->registrationId:Ljava/lang/String;

    new-instance v2, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable$RegisterOnWeMoCloudCallback;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable$RegisterOnWeMoCloudCallback;-><init>(Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable;Lcom/belkin/wemo/push/runnable/RegisterPushNotificationRunnable$1;)V

    invoke-static {v0, v1, v2}, Lcom/belkin/wemo/push/cloud/WeMoCloudPushMessagingUtility;->sendPushRegistrationIdToWeMoCloud(Landroid/content/Context;Ljava/lang/String;Lcom/belkin/wemo/push/cmd/listener/RegisterWithWeMoCloudListener;)V

    .line 41
    return-void
.end method
