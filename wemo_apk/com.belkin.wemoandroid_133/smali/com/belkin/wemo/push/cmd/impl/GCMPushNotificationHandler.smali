.class public Lcom/belkin/wemo/push/cmd/impl/GCMPushNotificationHandler;
.super Ljava/lang/Object;
.source "GCMPushNotificationHandler.java"

# interfaces
.implements Lcom/belkin/wemo/push/cmd/IPushNotificationHandler;


# static fields
.field public static final TAG:Ljava/lang/String; = "GCMPushNotificationHandler"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getValidRegistrationId(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 75
    invoke-static {p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getGCMRegistrationId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 76
    .local v1, "registrationId":Ljava/lang/String;
    invoke-static {p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getGCMRegistrationIdStorageAppVersion(Landroid/content/Context;)I

    move-result v0

    .line 77
    .local v0, "gcmRegIdStorageVersion":I
    invoke-static {p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getCurrentAppVersion(Landroid/content/Context;)I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 78
    const-string v2, "GCMPushNotificationHandler"

    const-string v3, "Push Notification: App updated. GCM Reg ID is invalid."

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    new-instance v1, Ljava/lang/String;

    .end local v1    # "registrationId":Ljava/lang/String;
    invoke-direct {v1}, Ljava/lang/String;-><init>()V

    .line 81
    .restart local v1    # "registrationId":Ljava/lang/String;
    :cond_0
    const-string v2, "GCMPushNotificationHandler"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Push Notification: getValidRegistrationId(), if any: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    return-object v1
.end method

.method private registerAppWithGCM(Landroid/content/Context;Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;

    .prologue
    .line 48
    invoke-static {p1}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v2

    .line 49
    .local v2, "resultCode":I
    const-string v3, "GCMPushNotificationHandler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Push Notification: Google Play Services Availablity State: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    if-nez v2, :cond_1

    .line 53
    invoke-direct {p0, p1}, Lcom/belkin/wemo/push/cmd/impl/GCMPushNotificationHandler;->getValidRegistrationId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 55
    .local v1, "registrationId":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 57
    const-string v3, "GCMPushNotificationHandler"

    const-string v4, "Push Notification: Registering with GCM Server"

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    :try_start_0
    invoke-static {p1}, Lcom/belkin/wemo/utils/WeMoPushUtils;->registerAppWithGCMServer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 60
    invoke-interface {p2, v1}, Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;->onRegisteredWithPush(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .end local v1    # "registrationId":Ljava/lang/String;
    :goto_0
    return-void

    .line 61
    .restart local v1    # "registrationId":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 62
    .local v0, "e":Ljava/io/IOException;
    const-string v3, "GCMPushNotificationHandler"

    const-string v4, "Push Notification: IOException during GCM register."

    invoke-static {v3, v4, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 63
    new-instance v3, Lcom/belkin/wemo/push/error/PushNotificationError;

    const/16 v4, -0x64

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/belkin/wemo/push/error/PushNotificationError;-><init>(ILjava/lang/String;)V

    invoke-interface {p2, v3}, Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;->onRegistrationFailed(Lcom/belkin/wemo/push/error/PushNotificationError;)V

    goto :goto_0

    .line 66
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    invoke-interface {p2, v1}, Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;->onAlreadyRegisteredWithPush(Ljava/lang/String;)V

    goto :goto_0

    .line 69
    .end local v1    # "registrationId":Ljava/lang/String;
    :cond_1
    new-instance v3, Lcom/belkin/wemo/push/error/PushNotificationError;

    const-string v4, "Google Play Services Error!"

    invoke-direct {v3, v2, v4}, Lcom/belkin/wemo/push/error/PushNotificationError;-><init>(ILjava/lang/String;)V

    invoke-interface {p2, v3}, Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;->onRegistrationFailed(Lcom/belkin/wemo/push/error/PushNotificationError;)V

    goto :goto_0
.end method


# virtual methods
.method public registerWithPushServer(Landroid/content/Context;Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation

    .prologue
    .line 32
    if-nez p1, :cond_0

    .line 33
    const-string v0, "GCMPushNotificationHandler"

    const-string v1, "Push Notification: Registering with GCM - Context is null!"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    new-instance v0, Lcom/belkin/wemo/exception/InvalidArgumentsException;

    const-string v1, "Context in NULL!"

    invoke-direct {v0, v1}, Lcom/belkin/wemo/exception/InvalidArgumentsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 36
    :cond_0
    if-nez p2, :cond_1

    .line 37
    const-string v0, "GCMPushNotificationHandler"

    const-string v1, "Push Notification: Registration Error - RegisterWithPushCloudListener instance is invalid!"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    new-instance v0, Lcom/belkin/wemo/exception/InvalidArgumentsException;

    const-string v1, "RegisterWithPushCloudListener instance is invalid"

    invoke-direct {v0, v1}, Lcom/belkin/wemo/exception/InvalidArgumentsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/push/cmd/impl/GCMPushNotificationHandler;->registerAppWithGCM(Landroid/content/Context;Lcom/belkin/wemo/push/cmd/listener/RegisterWithPushCloudListener;)V

    .line 45
    return-void
.end method

.method public registerWithWeMoCloud(Landroid/content/Context;Ljava/lang/String;Lcom/belkin/wemo/push/cmd/listener/RegisterWithWeMoCloudListener;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "registrationId"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/belkin/wemo/push/cmd/listener/RegisterWithWeMoCloudListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation

    .prologue
    .line 91
    invoke-static {p1, p2, p3}, Lcom/belkin/wemo/push/cloud/WeMoCloudPushMessagingUtility;->sendPushRegistrationIdToWeMoCloud(Landroid/content/Context;Ljava/lang/String;Lcom/belkin/wemo/push/cmd/listener/RegisterWithWeMoCloudListener;)V

    .line 92
    return-void
.end method

.method public unregisterFromPushServer(Landroid/content/Context;Lcom/belkin/wemo/push/cmd/listener/UnregisterFromPushCloudListener;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/belkin/wemo/push/cmd/listener/UnregisterFromPushCloudListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation

    .prologue
    const/16 v5, -0x64

    .line 100
    if-nez p1, :cond_0

    .line 101
    const-string v2, "GCMPushNotificationHandler"

    const-string v3, "Push Notification: Unregistering from GCM - Context is null!"

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    new-instance v2, Lcom/belkin/wemo/exception/InvalidArgumentsException;

    const-string v3, "Context in NULL!"

    invoke-direct {v2, v3}, Lcom/belkin/wemo/exception/InvalidArgumentsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 104
    :cond_0
    if-nez p2, :cond_1

    .line 105
    const-string v2, "GCMPushNotificationHandler"

    const-string v3, "Push Notification: Unregister Error - UnregisterFromPushCloudListener instance is invalid!"

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    new-instance v2, Lcom/belkin/wemo/exception/InvalidArgumentsException;

    const-string v3, "RegisterWithPushCloudListener instance is invalid"

    invoke-direct {v2, v3}, Lcom/belkin/wemo/exception/InvalidArgumentsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 109
    :cond_1
    const-string v2, "GCMPushNotificationHandler"

    const-string v3, "Push Notification: unregistering from GCM"

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    :try_start_0
    invoke-static {p1}, Lcom/belkin/wemo/utils/WeMoPushUtils;->unregisterAppFromGCMServer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 113
    .local v1, "registrationId":Ljava/lang/String;
    if-eqz v1, :cond_2

    .line 114
    invoke-interface {p2, v1}, Lcom/belkin/wemo/push/cmd/listener/UnregisterFromPushCloudListener;->onUnregisteredFromPushCloud(Ljava/lang/String;)V

    .line 124
    .end local v1    # "registrationId":Ljava/lang/String;
    :goto_0
    return-void

    .line 116
    .restart local v1    # "registrationId":Ljava/lang/String;
    :cond_2
    new-instance v2, Lcom/belkin/wemo/push/error/PushNotificationError;

    const/16 v3, -0x64

    const-string v4, "Unregistering app with GCM server failed"

    invoke-direct {v2, v3, v4}, Lcom/belkin/wemo/push/error/PushNotificationError;-><init>(ILjava/lang/String;)V

    invoke-interface {p2, v2}, Lcom/belkin/wemo/push/cmd/listener/UnregisterFromPushCloudListener;->onUnregisterFailed(Lcom/belkin/wemo/push/error/PushNotificationError;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 118
    .end local v1    # "registrationId":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 119
    .local v0, "e":Ljava/io/IOException;
    const-string v2, "GCMPushNotificationHandler"

    const-string v3, "Push Notification: IOException during GCM unregister."

    invoke-static {v2, v3, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 120
    new-instance v2, Lcom/belkin/wemo/push/error/PushNotificationError;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v5, v3}, Lcom/belkin/wemo/push/error/PushNotificationError;-><init>(ILjava/lang/String;)V

    invoke-interface {p2, v2}, Lcom/belkin/wemo/push/cmd/listener/UnregisterFromPushCloudListener;->onUnregisterFailed(Lcom/belkin/wemo/push/error/PushNotificationError;)V

    goto :goto_0
.end method

.method public unregisterFromWeMoCloud(Landroid/content/Context;Ljava/lang/String;Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "registrationId"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation

    .prologue
    .line 130
    invoke-static {p1, p2, p3}, Lcom/belkin/wemo/push/cloud/WeMoCloudPushMessagingUtility;->unregisterAppFromWeMoCloudForPush(Landroid/content/Context;Ljava/lang/String;Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;)V

    .line 131
    return-void
.end method
