.class public Lcom/belkin/wemo/rules/composer/impl/RMSimpleSwitchRuleComposer;
.super Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;
.source "RMSimpleSwitchRuleComposer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer",
        "<",
        "Lcom/belkin/wemo/rules/data/RMSimpleSwitchRule;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/data/RMSimpleSwitchRule;)V
    .locals 0
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMSimpleSwitchRule;

    .prologue
    .line 11
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;-><init>(Lcom/belkin/wemo/rules/data/RMDBRule;)V

    .line 12
    return-void
.end method


# virtual methods
.method protected bridge synthetic addRowInsertAdditionalData(ILcom/belkin/wemo/rules/data/RMDBRule;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "x0"    # I
    .param p2, "x1"    # Lcom/belkin/wemo/rules/data/RMDBRule;
    .param p3, "x2"    # Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .param p4, "x3"    # Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    .param p5, "x4"    # Ljava/lang/String;
    .param p6, "x5"    # Ljava/lang/String;

    .prologue
    .line 8
    move-object v2, p2

    check-cast v2, Lcom/belkin/wemo/rules/data/RMSimpleSwitchRule;

    move-object v0, p0

    move v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/belkin/wemo/rules/composer/impl/RMSimpleSwitchRuleComposer;->addRowInsertAdditionalData(ILcom/belkin/wemo/rules/data/RMSimpleSwitchRule;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected addRowInsertAdditionalData(ILcom/belkin/wemo/rules/data/RMSimpleSwitchRule;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "dayId"    # I
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMSimpleSwitchRule;
    .param p3, "ruleDevice"    # Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .param p4, "row"    # Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    .param p5, "zbCapabilityStart"    # Ljava/lang/String;
    .param p6, "zbCapabilityEnd"    # Ljava/lang/String;

    .prologue
    .line 19
    return-void
.end method

.method protected deleteFromAdditionalTables()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 31
    return-void
.end method

.method protected writeToAdditionalTables()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 25
    return-void
.end method
