.class public Lcom/belkin/wemo/push/cloud/WeMoCloudPushMessagingUtility;
.super Ljava/lang/Object;
.source "WeMoCloudPushMessagingUtility.java"


# static fields
.field public static final SMART_DEVICE_TYPE_GCM:I = 0x1

.field public static final SMART_DEVICE_TYPE_KINDLE:I = 0x4

.field private static final TAG:Ljava/lang/String; = "ADMMessenger"

.field public static final WEMO_CLOUD_PUSH_REGISTER_URL:Ljava/lang/String; = "https://api.xbcs.net:8443/apis/http/plugin/push/register"

.field public static final WEMO_CLOUD_PUSH_UNREGISTER_URL:Ljava/lang/String; = "https://api.xbcs.net:8443/apis/http/plugin/push/unregister"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getSmartDeviceType()I
    .locals 1

    .prologue
    .line 67
    invoke-static {}, Lcom/belkin/wemo/utils/WeMoPushUtils;->isADMAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 68
    const/4 v0, 0x4

    .line 70
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static sendPushRegistrationIdToWeMoCloud(Landroid/content/Context;Ljava/lang/String;Lcom/belkin/wemo/push/cmd/listener/RegisterWithWeMoCloudListener;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "registrationId"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/belkin/wemo/push/cmd/listener/RegisterWithWeMoCloudListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation

    .prologue
    .line 31
    if-nez p0, :cond_0

    .line 33
    const-string v0, "ADMMessenger"

    const-string v1, "Push Notification: Registering with WeMo cloud - Context is null!"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    new-instance v0, Lcom/belkin/wemo/exception/InvalidArgumentsException;

    const-string v1, "Context in NULL!"

    invoke-direct {v0, v1}, Lcom/belkin/wemo/exception/InvalidArgumentsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 36
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 38
    const-string v0, "ADMMessenger"

    const-string v1, "Push Notification: Registering with WeMo cloud - registrationID is empty or null!"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    new-instance v0, Lcom/belkin/wemo/exception/InvalidArgumentsException;

    const-string v1, "Registration Id is invalid!"

    invoke-direct {v0, v1}, Lcom/belkin/wemo/exception/InvalidArgumentsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_1
    const-string v0, "ADMMessenger"

    const-string v1, "Push Notification: Registering with WeMo Cloud"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    new-instance v0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushRegisterRunnable;

    invoke-direct {v0, p0, p1, p2}, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushRegisterRunnable;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/belkin/wemo/push/cmd/listener/RegisterWithWeMoCloudListener;)V

    invoke-static {v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    .line 45
    return-void
.end method

.method public static unregisterAppFromWeMoCloudForPush(Landroid/content/Context;Ljava/lang/String;Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "registrationId"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation

    .prologue
    .line 51
    if-nez p0, :cond_0

    .line 52
    const-string v0, "ADMMessenger"

    const-string v1, "Push Notification: unregistering from WeMo cloud - Context is null!"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    new-instance v0, Lcom/belkin/wemo/exception/InvalidArgumentsException;

    const-string v1, "Context in NULL!"

    invoke-direct {v0, v1}, Lcom/belkin/wemo/exception/InvalidArgumentsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 57
    const-string v0, "ADMMessenger"

    const-string v1, "Push Notification: unregistering from WeMo cloud - registrationID is null!"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    new-instance v0, Lcom/belkin/wemo/exception/InvalidArgumentsException;

    const-string v1, "Registration Id is invalid!"

    invoke-direct {v0, v1}, Lcom/belkin/wemo/exception/InvalidArgumentsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 61
    :cond_1
    const-string v0, "ADMMessenger"

    const-string v1, "Push Notification: unregistering from WeMo cloud"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    new-instance v0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushUnregisterRunnable;

    invoke-direct {v0, p0, p1, p2}, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushUnregisterRunnable;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;)V

    invoke-static {v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    .line 64
    return-void
.end method
