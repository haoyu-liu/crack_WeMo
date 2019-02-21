.class public Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushUnregisterRunnable;
.super Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;
.source "WeMoCloudPushUnregisterRunnable.java"


# instance fields
.field private context:Landroid/content/Context;

.field private listener:Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "registrationId"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;

    .prologue
    .line 19
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushAbstractRunnable;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 20
    iput-object p1, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushUnregisterRunnable;->context:Landroid/content/Context;

    .line 21
    iput-object p3, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushUnregisterRunnable;->listener:Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;

    .line 22
    return-void
.end method


# virtual methods
.method protected getJSONBody()Ljava/lang/String;
    .locals 4

    .prologue
    .line 45
    new-instance v2, Lcom/belkin/utils/WiFiSecurityUtil;

    invoke-direct {v2}, Lcom/belkin/utils/WiFiSecurityUtil;-><init>()V

    iget-object v3, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushUnregisterRunnable;->context:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/belkin/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 47
    .local v0, "deviceId":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "{\"deviceNetwork\":{\"smartUniqueId\":\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\",\"smartDeviceType\":\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/belkin/wemo/push/cloud/WeMoCloudPushMessagingUtility;->getSmartDeviceType()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\",\"userSmartDeviceToken\":\"\",\"productCode\":\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "WeMo"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\",\"notificationType\":\"\",\"mobileNumber\":\"\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "}}"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 54
    .local v1, "jsonBody":Ljava/lang/String;
    return-object v1
.end method

.method protected getRequestURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    const-string v0, "https://api.xbcs.net:8443/apis/http/plugin/push/unregister"

    return-object v0
.end method

.method protected onError(Lcom/belkin/wemo/push/error/PushNotificationError;)V
    .locals 1
    .param p1, "error"    # Lcom/belkin/wemo/push/error/PushNotificationError;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushUnregisterRunnable;->listener:Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;

    if-eqz v0, :cond_0

    .line 39
    iget-object v0, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushUnregisterRunnable;->listener:Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;

    invoke-interface {v0, p1}, Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;->onUnregisterFailed(Lcom/belkin/wemo/push/error/PushNotificationError;)V

    .line 41
    :cond_0
    return-void
.end method

.method protected onSuccess(Ljava/lang/String;)V
    .locals 1
    .param p1, "registrationId"    # Ljava/lang/String;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushUnregisterRunnable;->listener:Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;

    if-eqz v0, :cond_0

    .line 32
    iget-object v0, p0, Lcom/belkin/wemo/push/cloud/runnable/WeMoCloudPushUnregisterRunnable;->listener:Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;

    invoke-interface {v0, p1}, Lcom/belkin/wemo/push/cmd/listener/UnregisterFromWeMoCloudListener;->onUnregisteredFromWeMoCloud(Ljava/lang/String;)V

    .line 34
    :cond_0
    return-void
.end method
