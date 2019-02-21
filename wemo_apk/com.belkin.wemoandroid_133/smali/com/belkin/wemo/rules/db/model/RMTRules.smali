.class public Lcom/belkin/wemo/rules/db/model/RMTRules;
.super Ljava/lang/Object;
.source "RMTRules.java"


# static fields
.field public static final DEFAULT_END_DATE:Ljava/lang/String; = "07301982"

.field public static final DEFAULT_RULE_ORDER:I = 0x2

.field public static final DEFAULT_START_DATE:Ljava/lang/String; = "12201982"

.field public static final DEFAULT_SYNC:Ljava/lang/String; = "NOSYNC"


# instance fields
.field private EndDate:Ljava/lang/String;

.field private Name:Ljava/lang/String;

.field private RuleId:Ljava/lang/String;

.field private RuleOrder:I

.field private StartDate:Ljava/lang/String;

.field private State:I

.field private Sync:Ljava/lang/String;

.field private Type:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const-string v0, "12201982"

    iput-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->StartDate:Ljava/lang/String;

    .line 26
    const-string v0, "07301982"

    iput-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->EndDate:Ljava/lang/String;

    .line 27
    const/4 v0, 0x2

    iput v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->RuleOrder:I

    .line 28
    const-string v0, "NOSYNC"

    iput-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->Sync:Ljava/lang/String;

    .line 29
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->RuleId:Ljava/lang/String;

    .line 30
    return-void
.end method


# virtual methods
.method public getEndDate()Ljava/lang/String;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->EndDate:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->Name:Ljava/lang/String;

    return-object v0
.end method

.method public getRuleId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->RuleId:Ljava/lang/String;

    return-object v0
.end method

.method public getRuleOrder()I
    .locals 1

    .prologue
    .line 78
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->RuleOrder:I

    return v0
.end method

.method public getStartDate()Ljava/lang/String;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->StartDate:Ljava/lang/String;

    return-object v0
.end method

.method public getState()I
    .locals 1

    .prologue
    .line 120
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->State:I

    return v0
.end method

.method public getSync()Ljava/lang/String;
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->Sync:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->Type:Ljava/lang/String;

    return-object v0
.end method

.method public setEndDate(Ljava/lang/String;)V
    .locals 0
    .param p1, "endDate"    # Ljava/lang/String;

    .prologue
    .line 113
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->EndDate:Ljava/lang/String;

    .line 114
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->Name:Ljava/lang/String;

    .line 58
    return-void
.end method

.method public setRuleId(Ljava/lang/String;)V
    .locals 0
    .param p1, "ruleId"    # Ljava/lang/String;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->RuleId:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public setRuleOrder(I)V
    .locals 0
    .param p1, "ruleOrder"    # I

    .prologue
    .line 85
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->RuleOrder:I

    .line 86
    return-void
.end method

.method public setStartDate(Ljava/lang/String;)V
    .locals 0
    .param p1, "startDate"    # Ljava/lang/String;

    .prologue
    .line 99
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->StartDate:Ljava/lang/String;

    .line 100
    return-void
.end method

.method public setState(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 127
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->State:I

    .line 128
    return-void
.end method

.method public setSync(Ljava/lang/String;)V
    .locals 0
    .param p1, "sync"    # Ljava/lang/String;

    .prologue
    .line 141
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->Sync:Ljava/lang/String;

    .line 142
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRules;->Type:Ljava/lang/String;

    .line 72
    return-void
.end method
