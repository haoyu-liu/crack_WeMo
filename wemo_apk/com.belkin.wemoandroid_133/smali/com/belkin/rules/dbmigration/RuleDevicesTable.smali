.class public final Lcom/belkin/rules/dbmigration/RuleDevicesTable;
.super Ljava/lang/Object;
.source "RuleDevicesTable.java"


# instance fields
.field private OffModeOffset:I

.field private OnModeOffset:I

.field private ZBCapabilityEnd:Ljava/lang/String;

.field private ZBCapabilityStart:Ljava/lang/String;

.field private dayId:I

.field private deviceId:Ljava/lang/String;

.field private endAction:D

.field private groupId:I

.field private level:I

.field private ruleDuration:I

.field private ruleId:I

.field private sensorDuration:I

.field private startAction:D

.field private starttime:I

.field private type:I

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->deviceId:Ljava/lang/String;

    .line 48
    const/4 v0, 0x0

    iput v0, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->groupId:I

    .line 54
    const/4 v0, -0x1

    iput v0, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->sensorDuration:I

    .line 56
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->value:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getDayId()I
    .locals 1

    .prologue
    .line 118
    iget v0, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->dayId:I

    return v0
.end method

.method public getDeviceId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->deviceId:Ljava/lang/String;

    return-object v0
.end method

.method public getEndAction()D
    .locals 2

    .prologue
    .line 150
    iget-wide v0, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->endAction:D

    return-wide v0
.end method

.method public getGroupId()I
    .locals 1

    .prologue
    .line 110
    iget v0, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->groupId:I

    return v0
.end method

.method public getLevel()I
    .locals 1

    .prologue
    .line 182
    iget v0, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->level:I

    return v0
.end method

.method public getOffModeOffset()I
    .locals 1

    .prologue
    .line 194
    iget v0, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->OffModeOffset:I

    return v0
.end method

.method public getOffset(Lcom/belkin/rules/db/RulesDb;)Ljava/lang/String;
    .locals 6
    .param p1, "rDB"    # Lcom/belkin/rules/db/RulesDb;

    .prologue
    .line 78
    const-string v3, ""

    .line 79
    .local v3, "result":Ljava/lang/String;
    new-instance v2, Ljava/lang/Integer;

    invoke-virtual {p0}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOnModeOffset()I

    move-result v4

    invoke-direct {v2, v4}, Ljava/lang/Integer;-><init>(I)V

    .line 80
    .local v2, "onModeOffset":Ljava/lang/Integer;
    new-instance v1, Ljava/lang/Integer;

    invoke-virtual {p0}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getOffModeOffset()I

    move-result v4

    invoke-direct {v1, v4}, Ljava/lang/Integer;-><init>(I)V

    .line 82
    .local v1, "offModeOffset":Ljava/lang/Integer;
    :try_start_0
    invoke-virtual {p0}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/belkin/rules/db/RulesDb;->getRuleType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/belkin/rules/utils/RulesConstants;->RULE_SIMPLE_TIMER:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 83
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 90
    :goto_0
    return-object v3

    .line 85
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-char v5, Lcom/belkin/rules/utils/RulesConstants;->COMMA:C

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 87
    :catch_0
    move-exception v0

    .line 88
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public getOnModeOffset()I
    .locals 1

    .prologue
    .line 190
    iget v0, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->OnModeOffset:I

    return v0
.end method

.method public getRuleDuration()I
    .locals 1

    .prologue
    .line 134
    iget v0, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->ruleDuration:I

    return v0
.end method

.method public getRuleId()I
    .locals 1

    .prologue
    .line 94
    iget v0, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->ruleId:I

    return v0
.end method

.method public getSensorDuration()I
    .locals 1

    .prologue
    .line 158
    iget v0, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->sensorDuration:I

    return v0
.end method

.method public getStartAction()D
    .locals 2

    .prologue
    .line 142
    iget-wide v0, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->startAction:D

    return-wide v0
.end method

.method public getStarttime()I
    .locals 1

    .prologue
    .line 126
    iget v0, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->starttime:I

    return v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 166
    iget v0, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->type:I

    return v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 174
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->value:Ljava/lang/String;

    return-object v0
.end method

.method public getZBCapabilityEnd()Ljava/lang/String;
    .locals 1

    .prologue
    .line 214
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->ZBCapabilityEnd:Ljava/lang/String;

    return-object v0
.end method

.method public getZBCapabilityStart()Ljava/lang/String;
    .locals 1

    .prologue
    .line 206
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->ZBCapabilityStart:Ljava/lang/String;

    return-object v0
.end method

.method public haveSRSS()Z
    .locals 4

    .prologue
    .line 65
    new-instance v2, Ljava/lang/Integer;

    invoke-virtual {p0}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getStarttime()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 66
    .local v1, "tmpStartStr":Ljava/lang/String;
    new-instance v2, Ljava/lang/Integer;

    invoke-virtual {p0}, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->getRuleDuration()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 68
    .local v0, "tmpDurStr":Ljava/lang/String;
    const-string v2, "1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "2"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "1"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "2"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "4"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "5"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "4"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "5"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 71
    :cond_0
    const/4 v2, 0x1

    .line 74
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public setDayId(I)V
    .locals 0
    .param p1, "dayId"    # I

    .prologue
    .line 122
    iput p1, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->dayId:I

    .line 123
    return-void
.end method

.method public setDeviceId(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceId"    # Ljava/lang/String;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->deviceId:Ljava/lang/String;

    .line 107
    return-void
.end method

.method public setEndAction(D)V
    .locals 1
    .param p1, "endAction"    # D

    .prologue
    .line 154
    iput-wide p1, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->endAction:D

    .line 155
    return-void
.end method

.method public setGroupId(I)V
    .locals 0
    .param p1, "groupId"    # I

    .prologue
    .line 114
    iput p1, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->groupId:I

    .line 115
    return-void
.end method

.method public setLevel(I)V
    .locals 0
    .param p1, "level"    # I

    .prologue
    .line 186
    iput p1, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->level:I

    .line 187
    return-void
.end method

.method public setOffModeOffset(I)V
    .locals 0
    .param p1, "offModeOffset"    # I

    .prologue
    .line 202
    iput p1, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->OffModeOffset:I

    .line 203
    return-void
.end method

.method public setOnModeOffset(I)V
    .locals 0
    .param p1, "onModeOffset"    # I

    .prologue
    .line 198
    iput p1, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->OnModeOffset:I

    .line 199
    return-void
.end method

.method public setRuleDuration(I)V
    .locals 0
    .param p1, "ruleDuration"    # I

    .prologue
    .line 138
    iput p1, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->ruleDuration:I

    .line 139
    return-void
.end method

.method public setRuleId(I)V
    .locals 0
    .param p1, "ruleId"    # I

    .prologue
    .line 98
    iput p1, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->ruleId:I

    .line 99
    return-void
.end method

.method public setSensorDuration(I)V
    .locals 0
    .param p1, "sensorDuration"    # I

    .prologue
    .line 162
    iput p1, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->sensorDuration:I

    .line 163
    return-void
.end method

.method public setStartAction(D)V
    .locals 1
    .param p1, "startAction"    # D

    .prologue
    .line 146
    iput-wide p1, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->startAction:D

    .line 147
    return-void
.end method

.method public setStarttime(I)V
    .locals 0
    .param p1, "starttime"    # I

    .prologue
    .line 130
    iput p1, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->starttime:I

    .line 131
    return-void
.end method

.method public setType(I)V
    .locals 0
    .param p1, "type"    # I

    .prologue
    .line 170
    iput p1, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->type:I

    .line 171
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 178
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->value:Ljava/lang/String;

    .line 179
    return-void
.end method

.method public setZBCapabilityEnd(Ljava/lang/String;)V
    .locals 0
    .param p1, "zBCapabilityEnd"    # Ljava/lang/String;

    .prologue
    .line 218
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->ZBCapabilityEnd:Ljava/lang/String;

    .line 219
    return-void
.end method

.method public setZBCapabilityStart(Ljava/lang/String;)V
    .locals 0
    .param p1, "zBCapabilityStart"    # Ljava/lang/String;

    .prologue
    .line 210
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->ZBCapabilityStart:Ljava/lang/String;

    .line 211
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 223
    const-string v0, "RULE DEVICE TABLE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->ruleId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->deviceId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->groupId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->dayId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->starttime:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->ruleDuration:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->startAction:D

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->endAction:D

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->sensorDuration:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->type:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->value:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/rules/dbmigration/RuleDevicesTable;->level:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
