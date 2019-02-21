.class public Lcom/belkin/wemo/rules/read/type/db/RMCountdownTimerRuleParser;
.super Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;
.source "RMCountdownTimerRuleParser.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser",
        "<",
        "Lcom/belkin/wemo/rules/data/RMCountdownTimerRule;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;-><init>()V

    return-void
.end method


# virtual methods
.method protected createRuleObject()Lcom/belkin/wemo/rules/data/RMCountdownTimerRule;
    .locals 1

    .prologue
    .line 17
    new-instance v0, Lcom/belkin/wemo/rules/data/RMCountdownTimerRule;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/data/RMCountdownTimerRule;-><init>()V

    return-object v0
.end method

.method protected bridge synthetic createRuleObject()Lcom/belkin/wemo/rules/data/RMDBRule;
    .locals 1

    .prologue
    .line 13
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/read/type/db/RMCountdownTimerRuleParser;->createRuleObject()Lcom/belkin/wemo/rules/data/RMCountdownTimerRule;

    move-result-object v0

    return-object v0
.end method

.method protected extractRuleSpecificTables()Z
    .locals 1

    .prologue
    .line 28
    const/4 v0, 0x1

    return v0
.end method

.method protected getDBRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->COUNTDOWN_RULE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    return-object v0
.end method
