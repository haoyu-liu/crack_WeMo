.class public Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;
.super Ljava/lang/Object;
.source "RMTSensorNotification.java"


# instance fields
.field private NotificationDuration:I

.field private NotificationMessage:Ljava/lang/String;

.field private NotifyRuleID:I

.field private RuleId:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    return-void
.end method


# virtual methods
.method public getNotificationDuration()I
    .locals 1

    .prologue
    .line 60
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;->NotificationDuration:I

    return v0
.end method

.method public getNotificationMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;->NotificationMessage:Ljava/lang/String;

    return-object v0
.end method

.method public getNotifyRuleID()I
    .locals 1

    .prologue
    .line 32
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;->NotifyRuleID:I

    return v0
.end method

.method public getRuleId()I
    .locals 1

    .prologue
    .line 18
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;->RuleId:I

    return v0
.end method

.method public setNotificationDuration(I)V
    .locals 0
    .param p1, "notificationDuration"    # I

    .prologue
    .line 67
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;->NotificationDuration:I

    .line 68
    return-void
.end method

.method public setNotificationMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "notificationMessage"    # Ljava/lang/String;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;->NotificationMessage:Ljava/lang/String;

    .line 54
    return-void
.end method

.method public setNotifyRuleID(I)V
    .locals 0
    .param p1, "notifyRuleID"    # I

    .prologue
    .line 39
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;->NotifyRuleID:I

    .line 40
    return-void
.end method

.method public setRuleId(I)V
    .locals 0
    .param p1, "ruleId"    # I

    .prologue
    .line 25
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;->RuleId:I

    .line 26
    return-void
.end method
