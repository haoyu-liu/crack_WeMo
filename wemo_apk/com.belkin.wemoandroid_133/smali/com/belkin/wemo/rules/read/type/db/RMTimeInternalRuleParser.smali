.class public Lcom/belkin/wemo/rules/read/type/db/RMTimeInternalRuleParser;
.super Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;
.source "RMTimeInternalRuleParser.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser",
        "<",
        "Lcom/belkin/wemo/rules/data/RMSimpleSwitchRule;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic createRuleObject()Lcom/belkin/wemo/rules/data/RMDBRule;
    .locals 1

    .prologue
    .line 6
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/read/type/db/RMTimeInternalRuleParser;->createRuleObject()Lcom/belkin/wemo/rules/data/RMSimpleSwitchRule;

    move-result-object v0

    return-object v0
.end method

.method protected createRuleObject()Lcom/belkin/wemo/rules/data/RMSimpleSwitchRule;
    .locals 1

    .prologue
    .line 10
    new-instance v0, Lcom/belkin/wemo/rules/data/RMSimpleSwitchRule;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/data/RMSimpleSwitchRule;-><init>()V

    return-object v0
.end method

.method protected extractRuleSpecificTables()Z
    .locals 1

    .prologue
    .line 21
    const/4 v0, 0x1

    return v0
.end method

.method protected getDBRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .locals 1

    .prologue
    .line 15
    sget-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->TIME_INTERVAL:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    return-object v0
.end method
