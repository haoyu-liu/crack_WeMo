.class public final Lcom/belkin/rules/dbmigration/DeviceCombinationTable;
.super Ljava/lang/Object;
.source "DeviceCombinationTable.java"


# instance fields
.field private deviceCombinationPK:I

.field private deviceGroupId:I

.field private deviceId:Ljava/lang/String;

.field private ruleId:I

.field private sensorGroupId:I

.field private sensorId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->sensorId:Ljava/lang/String;

    .line 48
    iput v1, p0, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->sensorGroupId:I

    .line 50
    iput v1, p0, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->deviceGroupId:I

    return-void
.end method


# virtual methods
.method public getDeviceCombinationPK()I
    .locals 1

    .prologue
    .line 54
    iget v0, p0, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->deviceCombinationPK:I

    return v0
.end method

.method public getDeviceGroupId()I
    .locals 1

    .prologue
    .line 84
    iget v0, p0, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->deviceGroupId:I

    return v0
.end method

.method public getDeviceId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->deviceId:Ljava/lang/String;

    return-object v0
.end method

.method public getRuleId()I
    .locals 1

    .prologue
    .line 60
    iget v0, p0, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->ruleId:I

    return v0
.end method

.method public getSensorGroupId()I
    .locals 1

    .prologue
    .line 72
    iget v0, p0, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->sensorGroupId:I

    return v0
.end method

.method public getSensorId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->sensorId:Ljava/lang/String;

    return-object v0
.end method

.method public setDeviceCombinationPK(I)V
    .locals 0
    .param p1, "deviceCombinationPK"    # I

    .prologue
    .line 57
    iput p1, p0, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->deviceCombinationPK:I

    .line 58
    return-void
.end method

.method public setDeviceGroupId(I)V
    .locals 0
    .param p1, "deviceGroupId"    # I

    .prologue
    .line 87
    iput p1, p0, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->deviceGroupId:I

    .line 88
    return-void
.end method

.method public setDeviceId(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceId"    # Ljava/lang/String;

    .prologue
    .line 81
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->deviceId:Ljava/lang/String;

    .line 82
    return-void
.end method

.method public setRuleId(I)V
    .locals 0
    .param p1, "ruleId"    # I

    .prologue
    .line 63
    iput p1, p0, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->ruleId:I

    .line 64
    return-void
.end method

.method public setSensorGroupId(I)V
    .locals 0
    .param p1, "sensorGroupId"    # I

    .prologue
    .line 75
    iput p1, p0, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->sensorGroupId:I

    .line 76
    return-void
.end method

.method public setSensorId(Ljava/lang/String;)V
    .locals 0
    .param p1, "sensorId"    # Ljava/lang/String;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->sensorId:Ljava/lang/String;

    .line 70
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 93
    const-string v0, "DEVICE COMBINATION TABLE "

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p0, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->ruleId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->deviceId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->deviceCombinationPK:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/rules/dbmigration/DeviceCombinationTable;->deviceGroupId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
