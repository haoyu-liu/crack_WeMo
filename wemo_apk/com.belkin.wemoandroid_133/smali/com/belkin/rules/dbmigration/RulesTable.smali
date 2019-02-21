.class public final Lcom/belkin/rules/dbmigration/RulesTable;
.super Ljava/lang/Object;
.source "RulesTable.java"


# instance fields
.field private endDate:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private ruleId:I

.field private ruleOrder:I

.field private startDate:Ljava/lang/String;

.field private state:Ljava/lang/String;

.field private sync:Ljava/lang/String;

.field private type:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/RulesTable;->name:Ljava/lang/String;

    .line 45
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/RulesTable;->type:Ljava/lang/String;

    .line 46
    const/4 v0, 0x2

    iput v0, p0, Lcom/belkin/rules/dbmigration/RulesTable;->ruleOrder:I

    .line 47
    const-string v0, "12201982"

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/RulesTable;->startDate:Ljava/lang/String;

    .line 48
    const-string v0, "12201982"

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/RulesTable;->endDate:Ljava/lang/String;

    .line 49
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/RulesTable;->state:Ljava/lang/String;

    .line 50
    const-string v0, "NOSYNC"

    iput-object v0, p0, Lcom/belkin/rules/dbmigration/RulesTable;->sync:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getEndDate()Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/RulesTable;->endDate:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/RulesTable;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getRuleId()I
    .locals 1

    .prologue
    .line 53
    iget v0, p0, Lcom/belkin/rules/dbmigration/RulesTable;->ruleId:I

    return v0
.end method

.method public getRuleOrder()I
    .locals 1

    .prologue
    .line 77
    iget v0, p0, Lcom/belkin/rules/dbmigration/RulesTable;->ruleOrder:I

    return v0
.end method

.method public getStartDate()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/RulesTable;->startDate:Ljava/lang/String;

    return-object v0
.end method

.method public getState()Ljava/lang/String;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/RulesTable;->state:Ljava/lang/String;

    return-object v0
.end method

.method public getSync()Ljava/lang/String;
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/RulesTable;->sync:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/belkin/rules/dbmigration/RulesTable;->type:Ljava/lang/String;

    return-object v0
.end method

.method public setEndDate(Ljava/lang/String;)V
    .locals 0
    .param p1, "endDate"    # Ljava/lang/String;

    .prologue
    .line 97
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/RulesTable;->endDate:Ljava/lang/String;

    .line 98
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/RulesTable;->name:Ljava/lang/String;

    .line 66
    return-void
.end method

.method public setRuleId(I)V
    .locals 0
    .param p1, "ruleId"    # I

    .prologue
    .line 57
    iput p1, p0, Lcom/belkin/rules/dbmigration/RulesTable;->ruleId:I

    .line 58
    return-void
.end method

.method public setRuleOrder(I)V
    .locals 0
    .param p1, "ruleOrder"    # I

    .prologue
    .line 81
    iput p1, p0, Lcom/belkin/rules/dbmigration/RulesTable;->ruleOrder:I

    .line 82
    return-void
.end method

.method public setStartDate(Ljava/lang/String;)V
    .locals 0
    .param p1, "startDate"    # Ljava/lang/String;

    .prologue
    .line 89
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/RulesTable;->startDate:Ljava/lang/String;

    .line 90
    return-void
.end method

.method public setState(Ljava/lang/String;)V
    .locals 0
    .param p1, "state"    # Ljava/lang/String;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/RulesTable;->state:Ljava/lang/String;

    .line 106
    return-void
.end method

.method public setSync(Ljava/lang/String;)V
    .locals 0
    .param p1, "sync"    # Ljava/lang/String;

    .prologue
    .line 113
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/RulesTable;->sync:Ljava/lang/String;

    .line 114
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/belkin/rules/dbmigration/RulesTable;->type:Ljava/lang/String;

    .line 74
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 118
    const-string v0, "RULE TABLE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p0, Lcom/belkin/rules/dbmigration/RulesTable;->ruleId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/rules/dbmigration/RulesTable;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/rules/dbmigration/RulesTable;->type:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/rules/dbmigration/RulesTable;->ruleOrder:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/rules/dbmigration/RulesTable;->startDate:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/rules/dbmigration/RulesTable;->endDate:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/rules/dbmigration/RulesTable;->state:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/rules/dbmigration/RulesTable;->sync:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
