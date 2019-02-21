.class public Lcom/belkin/rules/data/RulesData;
.super Ljava/lang/Object;
.source "RulesData.java"


# instance fields
.field private endAction:I

.field private endTime:D

.field private fName:Ljava/lang/String;

.field private fri:Ljava/lang/String;

.field private mon:Ljava/lang/String;

.field private ruleDuration:D

.field private ruleId:I

.field private ruleName:Ljava/lang/String;

.field private ruleType:Ljava/lang/String;

.field private sat:Ljava/lang/String;

.field private startAction:I

.field private startTime:D

.field private state:I

.field private sun:Ljava/lang/String;

.field private sync:Ljava/lang/String;

.field private thu:Ljava/lang/String;

.field private tue:Ljava/lang/String;

.field private uuid:Ljava/lang/String;

.field private wed:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const-string v0, "NOSYNC"

    iput-object v0, p0, Lcom/belkin/rules/data/RulesData;->sync:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getEndAction()I
    .locals 1

    .prologue
    .line 194
    iget v0, p0, Lcom/belkin/rules/data/RulesData;->endAction:I

    return v0
.end method

.method public getEndTime()D
    .locals 2

    .prologue
    .line 274
    iget-wide v0, p0, Lcom/belkin/rules/data/RulesData;->endTime:D

    return-wide v0
.end method

.method public getFName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lcom/belkin/rules/data/RulesData;->fName:Ljava/lang/String;

    return-object v0
.end method

.method public getFri()Ljava/lang/String;
    .locals 1

    .prologue
    .line 393
    iget-object v0, p0, Lcom/belkin/rules/data/RulesData;->fri:Ljava/lang/String;

    return-object v0
.end method

.method public getMon()Ljava/lang/String;
    .locals 1

    .prologue
    .line 314
    iget-object v0, p0, Lcom/belkin/rules/data/RulesData;->mon:Ljava/lang/String;

    return-object v0
.end method

.method public getRuleDuration()D
    .locals 2

    .prologue
    .line 235
    iget-wide v0, p0, Lcom/belkin/rules/data/RulesData;->ruleDuration:D

    return-wide v0
.end method

.method public getRuleId()I
    .locals 1

    .prologue
    .line 53
    iget v0, p0, Lcom/belkin/rules/data/RulesData;->ruleId:I

    return v0
.end method

.method public getRuleName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lcom/belkin/rules/data/RulesData;->ruleName:Ljava/lang/String;

    return-object v0
.end method

.method public getRuleType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/belkin/rules/data/RulesData;->ruleType:Ljava/lang/String;

    return-object v0
.end method

.method public getSat()Ljava/lang/String;
    .locals 1

    .prologue
    .line 414
    iget-object v0, p0, Lcom/belkin/rules/data/RulesData;->sat:Ljava/lang/String;

    return-object v0
.end method

.method public getStartAction()I
    .locals 1

    .prologue
    .line 154
    iget v0, p0, Lcom/belkin/rules/data/RulesData;->startAction:I

    return v0
.end method

.method public getStartTime()D
    .locals 2

    .prologue
    .line 254
    iget-wide v0, p0, Lcom/belkin/rules/data/RulesData;->startTime:D

    return-wide v0
.end method

.method public getState()I
    .locals 1

    .prologue
    .line 174
    iget v0, p0, Lcom/belkin/rules/data/RulesData;->state:I

    return v0
.end method

.method public getSun()Ljava/lang/String;
    .locals 1

    .prologue
    .line 294
    iget-object v0, p0, Lcom/belkin/rules/data/RulesData;->sun:Ljava/lang/String;

    return-object v0
.end method

.method public getSync()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/belkin/rules/data/RulesData;->sync:Ljava/lang/String;

    return-object v0
.end method

.method public getThru()Ljava/lang/String;
    .locals 1

    .prologue
    .line 373
    iget-object v0, p0, Lcom/belkin/rules/data/RulesData;->thu:Ljava/lang/String;

    return-object v0
.end method

.method public getTue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 333
    iget-object v0, p0, Lcom/belkin/rules/data/RulesData;->tue:Ljava/lang/String;

    return-object v0
.end method

.method public getUuid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/belkin/rules/data/RulesData;->uuid:Ljava/lang/String;

    return-object v0
.end method

.method public getWed()Ljava/lang/String;
    .locals 1

    .prologue
    .line 353
    iget-object v0, p0, Lcom/belkin/rules/data/RulesData;->wed:Ljava/lang/String;

    return-object v0
.end method

.method public setEndAction(I)V
    .locals 0
    .param p1, "endAction"    # I

    .prologue
    .line 184
    iput p1, p0, Lcom/belkin/rules/data/RulesData;->endAction:I

    .line 185
    return-void
.end method

.method public setEndTime(D)V
    .locals 1
    .param p1, "endTime"    # D

    .prologue
    .line 264
    iput-wide p1, p0, Lcom/belkin/rules/data/RulesData;->endTime:D

    .line 265
    return-void
.end method

.method public setFName(Ljava/lang/String;)V
    .locals 0
    .param p1, "fName"    # Ljava/lang/String;

    .prologue
    .line 125
    iput-object p1, p0, Lcom/belkin/rules/data/RulesData;->fName:Ljava/lang/String;

    .line 126
    return-void
.end method

.method public setFri(Ljava/lang/String;)V
    .locals 0
    .param p1, "fri"    # Ljava/lang/String;

    .prologue
    .line 383
    iput-object p1, p0, Lcom/belkin/rules/data/RulesData;->fri:Ljava/lang/String;

    .line 384
    return-void
.end method

.method public setMon(Ljava/lang/String;)V
    .locals 0
    .param p1, "mon"    # Ljava/lang/String;

    .prologue
    .line 304
    iput-object p1, p0, Lcom/belkin/rules/data/RulesData;->mon:Ljava/lang/String;

    .line 305
    return-void
.end method

.method public setRuleDuration(D)V
    .locals 1
    .param p1, "ruleDuration"    # D

    .prologue
    .line 225
    iput-wide p1, p0, Lcom/belkin/rules/data/RulesData;->ruleDuration:D

    .line 226
    return-void
.end method

.method public setRuleId(I)V
    .locals 0
    .param p1, "ruleId"    # I

    .prologue
    .line 43
    iput p1, p0, Lcom/belkin/rules/data/RulesData;->ruleId:I

    .line 44
    return-void
.end method

.method public setRuleName(Ljava/lang/String;)V
    .locals 0
    .param p1, "ruleName"    # Ljava/lang/String;

    .prologue
    .line 205
    iput-object p1, p0, Lcom/belkin/rules/data/RulesData;->ruleName:Ljava/lang/String;

    .line 206
    return-void
.end method

.method public setRuleType(Ljava/lang/String;)V
    .locals 0
    .param p1, "ruleType"    # Ljava/lang/String;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/belkin/rules/data/RulesData;->ruleType:Ljava/lang/String;

    .line 106
    return-void
.end method

.method public setSat(Ljava/lang/String;)V
    .locals 0
    .param p1, "sat"    # Ljava/lang/String;

    .prologue
    .line 403
    iput-object p1, p0, Lcom/belkin/rules/data/RulesData;->sat:Ljava/lang/String;

    .line 404
    return-void
.end method

.method public setStartAction(I)V
    .locals 0
    .param p1, "startAction"    # I

    .prologue
    .line 144
    iput p1, p0, Lcom/belkin/rules/data/RulesData;->startAction:I

    .line 145
    return-void
.end method

.method public setStartTime(D)V
    .locals 1
    .param p1, "startTime"    # D

    .prologue
    .line 244
    iput-wide p1, p0, Lcom/belkin/rules/data/RulesData;->startTime:D

    .line 245
    return-void
.end method

.method public setState(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 164
    iput p1, p0, Lcom/belkin/rules/data/RulesData;->state:I

    .line 165
    return-void
.end method

.method public setSun(Ljava/lang/String;)V
    .locals 0
    .param p1, "sun"    # Ljava/lang/String;

    .prologue
    .line 284
    iput-object p1, p0, Lcom/belkin/rules/data/RulesData;->sun:Ljava/lang/String;

    .line 285
    return-void
.end method

.method public setSync(Ljava/lang/String;)V
    .locals 0
    .param p1, "sync"    # Ljava/lang/String;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/belkin/rules/data/RulesData;->sync:Ljava/lang/String;

    .line 64
    return-void
.end method

.method public setThru(Ljava/lang/String;)V
    .locals 0
    .param p1, "thru"    # Ljava/lang/String;

    .prologue
    .line 363
    iput-object p1, p0, Lcom/belkin/rules/data/RulesData;->thu:Ljava/lang/String;

    .line 364
    return-void
.end method

.method public setTue(Ljava/lang/String;)V
    .locals 0
    .param p1, "tue"    # Ljava/lang/String;

    .prologue
    .line 323
    iput-object p1, p0, Lcom/belkin/rules/data/RulesData;->tue:Ljava/lang/String;

    .line 324
    return-void
.end method

.method public setUuid(Ljava/lang/String;)V
    .locals 0
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/belkin/rules/data/RulesData;->uuid:Ljava/lang/String;

    .line 86
    return-void
.end method

.method public setWed(Ljava/lang/String;)V
    .locals 0
    .param p1, "wed"    # Ljava/lang/String;

    .prologue
    .line 343
    iput-object p1, p0, Lcom/belkin/rules/data/RulesData;->wed:Ljava/lang/String;

    .line 344
    return-void
.end method
