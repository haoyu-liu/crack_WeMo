.class public Lcom/belkin/rules/data/RuleDeviceData;
.super Ljava/lang/Object;
.source "RuleDeviceData.java"


# instance fields
.field private dayId:I

.field private endAction:I

.field private endTime:D

.field private fName:Ljava/lang/String;

.field private groupId:Ljava/lang/String;

.field private level:I

.field private ruleDuration:D

.field private ruleId:I

.field private sensorDuration:I

.field private startAction:I

.field private startTime:D

.field private state:I

.field private type:Ljava/lang/String;

.field private uuid:Ljava/lang/String;

.field private value:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDayId()I
    .locals 1

    .prologue
    .line 272
    iget v0, p0, Lcom/belkin/rules/data/RuleDeviceData;->dayId:I

    return v0
.end method

.method public getEndAction()D
    .locals 2

    .prologue
    .line 172
    iget v0, p0, Lcom/belkin/rules/data/RuleDeviceData;->endAction:I

    int-to-double v0, v0

    return-wide v0
.end method

.method public getEndTime()D
    .locals 2

    .prologue
    .line 252
    iget-wide v0, p0, Lcom/belkin/rules/data/RuleDeviceData;->endTime:D

    return-wide v0
.end method

.method public getFName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/belkin/rules/data/RuleDeviceData;->fName:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 193
    iget-object v0, p0, Lcom/belkin/rules/data/RuleDeviceData;->groupId:Ljava/lang/String;

    return-object v0
.end method

.method public getLevel()I
    .locals 1

    .prologue
    .line 333
    iget v0, p0, Lcom/belkin/rules/data/RuleDeviceData;->level:I

    return v0
.end method

.method public getRuleDuration()D
    .locals 2

    .prologue
    .line 213
    iget-wide v0, p0, Lcom/belkin/rules/data/RuleDeviceData;->ruleDuration:D

    return-wide v0
.end method

.method public getRuleId()I
    .locals 1

    .prologue
    .line 50
    iget v0, p0, Lcom/belkin/rules/data/RuleDeviceData;->ruleId:I

    return v0
.end method

.method public getSensorDuration()I
    .locals 1

    .prologue
    .line 294
    iget v0, p0, Lcom/belkin/rules/data/RuleDeviceData;->sensorDuration:I

    return v0
.end method

.method public getStartAction()I
    .locals 1

    .prologue
    .line 132
    iget v0, p0, Lcom/belkin/rules/data/RuleDeviceData;->startAction:I

    return v0
.end method

.method public getStartTime()D
    .locals 2

    .prologue
    .line 232
    iget-wide v0, p0, Lcom/belkin/rules/data/RuleDeviceData;->startTime:D

    return-wide v0
.end method

.method public getState()I
    .locals 1

    .prologue
    .line 152
    iget v0, p0, Lcom/belkin/rules/data/RuleDeviceData;->state:I

    return v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/belkin/rules/data/RuleDeviceData;->type:Ljava/lang/String;

    return-object v0
.end method

.method public getUuid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/belkin/rules/data/RuleDeviceData;->uuid:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()I
    .locals 1

    .prologue
    .line 313
    iget v0, p0, Lcom/belkin/rules/data/RuleDeviceData;->value:I

    return v0
.end method

.method public setDayId(I)V
    .locals 0
    .param p1, "dayId"    # I

    .prologue
    .line 262
    iput p1, p0, Lcom/belkin/rules/data/RuleDeviceData;->dayId:I

    .line 263
    return-void
.end method

.method public setEndAction(I)V
    .locals 0
    .param p1, "endAction"    # I

    .prologue
    .line 162
    iput p1, p0, Lcom/belkin/rules/data/RuleDeviceData;->endAction:I

    .line 163
    return-void
.end method

.method public setEndTime(D)V
    .locals 1
    .param p1, "endTime"    # D

    .prologue
    .line 242
    iput-wide p1, p0, Lcom/belkin/rules/data/RuleDeviceData;->endTime:D

    .line 243
    return-void
.end method

.method public setFName(Ljava/lang/String;)V
    .locals 0
    .param p1, "fName"    # Ljava/lang/String;

    .prologue
    .line 103
    iput-object p1, p0, Lcom/belkin/rules/data/RuleDeviceData;->fName:Ljava/lang/String;

    .line 104
    return-void
.end method

.method public setGroupId(Ljava/lang/String;)V
    .locals 0
    .param p1, "groupId"    # Ljava/lang/String;

    .prologue
    .line 183
    iput-object p1, p0, Lcom/belkin/rules/data/RuleDeviceData;->groupId:Ljava/lang/String;

    .line 184
    return-void
.end method

.method public setLevel(I)V
    .locals 0
    .param p1, "level"    # I

    .prologue
    .line 323
    iput p1, p0, Lcom/belkin/rules/data/RuleDeviceData;->level:I

    .line 324
    return-void
.end method

.method public setRuleDuration(D)V
    .locals 1
    .param p1, "ruleDuration"    # D

    .prologue
    .line 203
    iput-wide p1, p0, Lcom/belkin/rules/data/RuleDeviceData;->ruleDuration:D

    .line 204
    return-void
.end method

.method public setRuleId(I)V
    .locals 0
    .param p1, "ruleId"    # I

    .prologue
    .line 40
    iput p1, p0, Lcom/belkin/rules/data/RuleDeviceData;->ruleId:I

    .line 41
    return-void
.end method

.method public setSensorDuration(I)V
    .locals 0
    .param p1, "sensorDuration"    # I

    .prologue
    .line 282
    iput p1, p0, Lcom/belkin/rules/data/RuleDeviceData;->sensorDuration:I

    .line 283
    return-void
.end method

.method public setStartAction(I)V
    .locals 0
    .param p1, "startAction"    # I

    .prologue
    .line 122
    iput p1, p0, Lcom/belkin/rules/data/RuleDeviceData;->startAction:I

    .line 123
    return-void
.end method

.method public setStartTime(D)V
    .locals 1
    .param p1, "startTime"    # D

    .prologue
    .line 222
    iput-wide p1, p0, Lcom/belkin/rules/data/RuleDeviceData;->startTime:D

    .line 223
    return-void
.end method

.method public setState(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 142
    iput p1, p0, Lcom/belkin/rules/data/RuleDeviceData;->state:I

    .line 143
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/belkin/rules/data/RuleDeviceData;->type:Ljava/lang/String;

    .line 84
    return-void
.end method

.method public setUuid(Ljava/lang/String;)V
    .locals 0
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/belkin/rules/data/RuleDeviceData;->uuid:Ljava/lang/String;

    .line 64
    return-void
.end method

.method public setValue(I)V
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 303
    iput p1, p0, Lcom/belkin/rules/data/RuleDeviceData;->value:I

    .line 304
    return-void
.end method
