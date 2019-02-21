.class public Lcom/belkin/wemo/push/PushNotificationInfo;
.super Ljava/lang/Object;
.source "PushNotificationInfo.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private eventCode:Ljava/lang/String;

.field private friendlyName:Ljava/lang/String;

.field private isAlertDialogRequired:Z

.field private mac:Ljava/lang/String;

.field private pushNotificationMsg:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-class v0, Lcom/belkin/wemo/push/PushNotificationInfo;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/push/PushNotificationInfo;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/push/PushNotificationInfo;->pushNotificationMsg:Ljava/lang/String;

    .line 12
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/push/PushNotificationInfo;->isAlertDialogRequired:Z

    return-void
.end method


# virtual methods
.method public getEventCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/belkin/wemo/push/PushNotificationInfo;->eventCode:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 44
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/push/PushNotificationInfo;->eventCode:Ljava/lang/String;

    .line 46
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/push/PushNotificationInfo;->eventCode:Ljava/lang/String;

    return-object v0
.end method

.method public getFriendlyName()Ljava/lang/String;
    .locals 3

    .prologue
    .line 22
    sget-object v0, Lcom/belkin/wemo/push/PushNotificationInfo;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Push Notification: Get Friendly Name: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/push/PushNotificationInfo;->friendlyName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    iget-object v0, p0, Lcom/belkin/wemo/push/PushNotificationInfo;->friendlyName:Ljava/lang/String;

    return-object v0
.end method

.method public getMac()Ljava/lang/String;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/belkin/wemo/push/PushNotificationInfo;->mac:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 33
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/push/PushNotificationInfo;->mac:Ljava/lang/String;

    .line 35
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/push/PushNotificationInfo;->mac:Ljava/lang/String;

    return-object v0
.end method

.method public getPushNotificationMsg()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/belkin/wemo/push/PushNotificationInfo;->pushNotificationMsg:Ljava/lang/String;

    return-object v0
.end method

.method public isAlertDialogRequired()Z
    .locals 1

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/belkin/wemo/push/PushNotificationInfo;->isAlertDialogRequired:Z

    return v0
.end method

.method public setAlertDialogRequired(Z)V
    .locals 0
    .param p1, "isAlertDialogRequired"    # Z

    .prologue
    .line 66
    iput-boolean p1, p0, Lcom/belkin/wemo/push/PushNotificationInfo;->isAlertDialogRequired:Z

    .line 67
    return-void
.end method

.method public setEventCode(Ljava/lang/String;)V
    .locals 0
    .param p1, "eventCode"    # Ljava/lang/String;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/belkin/wemo/push/PushNotificationInfo;->eventCode:Ljava/lang/String;

    .line 51
    return-void
.end method

.method public setFriendlyName(Ljava/lang/String;)V
    .locals 3
    .param p1, "friendlyName"    # Ljava/lang/String;

    .prologue
    .line 27
    sget-object v0, Lcom/belkin/wemo/push/PushNotificationInfo;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Push Notification: Set Friendly Name To: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    iput-object p1, p0, Lcom/belkin/wemo/push/PushNotificationInfo;->friendlyName:Ljava/lang/String;

    .line 29
    return-void
.end method

.method public setMac(Ljava/lang/String;)V
    .locals 0
    .param p1, "mac"    # Ljava/lang/String;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/belkin/wemo/push/PushNotificationInfo;->mac:Ljava/lang/String;

    .line 40
    return-void
.end method

.method public setPushNotificationMsg(Ljava/lang/String;)V
    .locals 0
    .param p1, "pushNotificationMsg"    # Ljava/lang/String;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/belkin/wemo/push/PushNotificationInfo;->pushNotificationMsg:Ljava/lang/String;

    .line 59
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "; pushNotificationMsg: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/push/PushNotificationInfo;->pushNotificationMsg:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "; isAlertDialogRequired: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/belkin/wemo/push/PushNotificationInfo;->isAlertDialogRequired:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "; eventCode: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/push/PushNotificationInfo;->eventCode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
