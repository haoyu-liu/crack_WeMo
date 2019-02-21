.class public Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;
.super Ljava/lang/Object;
.source "RMTTargetDevices.java"


# instance fields
.field private DeviceID:Ljava/lang/String;

.field private DeviceIndex:I

.field private RuleId:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    return-void
.end method


# virtual methods
.method public getDeviceID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;->DeviceID:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceIndex()I
    .locals 1

    .prologue
    .line 45
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;->DeviceIndex:I

    return v0
.end method

.method public getRuleId()I
    .locals 1

    .prologue
    .line 17
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;->RuleId:I

    return v0
.end method

.method public setDeviceID(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceID"    # Ljava/lang/String;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;->DeviceID:Ljava/lang/String;

    .line 39
    return-void
.end method

.method public setDeviceIndex(I)V
    .locals 0
    .param p1, "deviceIndex"    # I

    .prologue
    .line 52
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;->DeviceIndex:I

    .line 53
    return-void
.end method

.method public setRuleId(I)V
    .locals 0
    .param p1, "ruleId"    # I

    .prologue
    .line 24
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;->RuleId:I

    .line 25
    return-void
.end method
