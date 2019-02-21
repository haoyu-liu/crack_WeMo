.class public abstract Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;
.super Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;
.source "RMAbstractDBRuleComposer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/belkin/wemo/rules/data/RMDBRule;",
        ">",
        "Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/data/RMDBRule;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 20
    .local p0, "this":Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;, "Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer<TT;>;"
    .local p1, "rule":Lcom/belkin/wemo/rules/data/RMDBRule;, "TT;"
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;-><init>(Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 21
    return-void
.end method

.method private addDayRow(ILcom/belkin/wemo/rules/data/RMDBRule;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)V
    .locals 7
    .param p1, "dayId"    # I
    .param p3, "ruleDevice"    # Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .param p4, "row"    # Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;",
            "Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;",
            "Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 211
    .local p0, "this":Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;, "Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer<TT;>;"
    .local p2, "rule":Lcom/belkin/wemo/rules/data/RMDBRule;, "TT;"
    const-string v5, ""

    const-string v6, ""

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v6}, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->addDayRow(ILcom/belkin/wemo/rules/data/RMDBRule;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    return-void
.end method

.method private addDayRow(ILcom/belkin/wemo/rules/data/RMDBRule;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "dayId"    # I
    .param p3, "ruleDevice"    # Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .param p4, "row"    # Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    .param p5, "zbCapabilityStart"    # Ljava/lang/String;
    .param p6, "zbCapabilityEnd"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;",
            "Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;",
            "Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 154
    .local p0, "this":Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;, "Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer<TT;>;"
    .local p2, "rule":Lcom/belkin/wemo/rules/data/RMDBRule;, "TT;"
    invoke-virtual {p2}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleId()I

    move-result v0

    invoke-virtual {p4, v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setRuleID(I)V

    .line 155
    invoke-virtual {p3}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUdn()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p4, v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setDeviceID(Ljava/lang/String;)V

    .line 157
    const/4 v0, 0x0

    invoke-virtual {p4, v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setGroupID(I)V

    .line 158
    invoke-virtual {p4, p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setDayID(I)V

    .line 159
    invoke-virtual {p2}, Lcom/belkin/wemo/rules/data/RMDBRule;->getStartTime()I

    move-result v0

    invoke-virtual {p4, v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setStartTime(I)V

    .line 160
    invoke-virtual {p2}, Lcom/belkin/wemo/rules/data/RMDBRule;->getEndTime()I

    move-result v0

    invoke-virtual {p4, v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setEndTime(I)V

    .line 161
    invoke-virtual {p2}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleDuration()I

    move-result v0

    invoke-virtual {p4, v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setRuleDuration(I)V

    .line 171
    invoke-virtual {p3}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getStartAction()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p4, v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setStartAction(F)V

    .line 172
    invoke-virtual {p3}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getEndAction()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p4, v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setEndAction(F)V

    .line 173
    invoke-virtual {p3}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getOnModeOffset()I

    move-result v0

    invoke-virtual {p4, v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setOnModeOffset(I)V

    .line 174
    invoke-virtual {p3}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getOffModeOffset()I

    move-result v0

    invoke-virtual {p4, v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setOffModeOffset(I)V

    .line 175
    invoke-virtual {p4, p5}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setZBCapabilityStart(Ljava/lang/String;)V

    .line 176
    invoke-virtual {p4, p6}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->setZBCapabilityEnd(Ljava/lang/String;)V

    .line 178
    invoke-virtual/range {p0 .. p6}, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->addRowInsertAdditionalData(ILcom/belkin/wemo/rules/data/RMDBRule;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v0

    invoke-virtual {v0, p4}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->insertRowRuleDevices(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)J

    .line 181
    return-void
.end method

.method private toggleRuleState(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;II)V
    .locals 5
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;
    .param p3, "ruleId"    # I
    .param p4, "state"    # I

    .prologue
    .line 270
    .local p0, "this":Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;, "Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer<TT;>;"
    :try_start_0
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v2

    invoke-virtual {v2, p4, p3}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->toggleRuleState(II)I

    move-result v1

    .line 273
    .local v1, "rowsAffected":I
    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 274
    if-eqz p1, :cond_0

    .line 275
    invoke-interface {p1}, Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;->onRulesComposed()V

    .line 291
    .end local v1    # "rowsAffected":I
    :cond_0
    :goto_0
    return-void

    .line 278
    .restart local v1    # "rowsAffected":I
    :cond_1
    iget-object v2, p0, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Toggling Rule State FAILED. RuleId: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; State requested: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; Number of rows affetced by update call: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    if-eqz p2, :cond_0

    .line 280
    invoke-interface {p2}, Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;->onRulesCompositionFailed()V
    :try_end_0
    .catch Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 284
    .end local v1    # "rowsAffected":I
    :catch_0
    move-exception v0

    .line 285
    .local v0, "e":Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
    iget-object v2, p0, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Store Rule: RuleDBException while enabling rule with ruleID: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 286
    if-eqz p2, :cond_0

    .line 287
    invoke-interface {p2}, Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;->onRulesCompositionFailed()V

    goto :goto_0
.end method

.method private writeToRuleDevicesTable()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "this":Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;, "Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer<TT;>;"
    iget-object v0, p0, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v0, Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 64
    .local v3, "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    new-instance v4, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;

    invoke-direct {v4}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;-><init>()V

    .line 67
    .local v4, "ruleDevicesRow":Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    iget-object v0, p0, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v0, Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/data/RMDBRule;->getDaySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    .line 68
    .local v7, "dayId":Ljava/lang/Integer;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/belkin/wemo/rules/data/device/RMLed;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 71
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, p0, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v2, Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getZBCapabilityStartStateStr()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getZBCapabilityEndStateStr()Ljava/lang/String;

    move-result-object v6

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->addDayRow(ILcom/belkin/wemo/rules/data/RMDBRule;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, p0, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v2, Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getZBCapabilityStartBrightnessStr()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getZBCapabilityEndBrightnessStr()Ljava/lang/String;

    move-result-object v6

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->addDayRow(ILcom/belkin/wemo/rules/data/RMDBRule;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 77
    :cond_1
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v0, p0, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v0, Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-direct {p0, v1, v0, v3, v4}, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->addDayRow(ILcom/belkin/wemo/rules/data/RMDBRule;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)V

    goto :goto_0

    .line 81
    .end local v3    # "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .end local v4    # "ruleDevicesRow":Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    .end local v7    # "dayId":Ljava/lang/Integer;
    .end local v9    # "i$":Ljava/util/Iterator;
    :cond_2
    return-void
.end method

.method private writeToRulesTable()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;, "Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer<TT;>;"
    new-instance v0, Lcom/belkin/wemo/rules/db/model/RMTRules;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/db/model/RMTRules;-><init>()V

    .line 52
    .local v0, "rulesRow":Lcom/belkin/wemo/rules/db/model/RMTRules;
    iget-object v1, p0, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v1, Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMDBRule;->getDisplayName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRules;->setName(Ljava/lang/String;)V

    .line 53
    iget-object v1, p0, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v1, Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRules;->setRuleId(Ljava/lang/String;)V

    .line 54
    iget-object v1, p0, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v1, Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMDBRule;->getState()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRules;->setState(I)V

    .line 55
    iget-object v1, p0, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v1, Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMDBRuleType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/db/model/RMTRules;->setType(Ljava/lang/String;)V

    .line 57
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->replaceRowRules(Lcom/belkin/wemo/rules/db/model/RMTRules;)V

    .line 58
    return-void
.end method


# virtual methods
.method public add(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;)V
    .locals 3
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;

    .prologue
    .line 91
    .local p0, "this":Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;, "Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer<TT;>;"
    :try_start_0
    invoke-direct {p0}, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->writeToRulesTable()V

    .line 92
    invoke-direct {p0}, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->writeToRuleDevicesTable()V

    .line 93
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->writeToAdditionalTables()V

    .line 95
    if-eqz p1, :cond_0

    .line 96
    invoke-interface {p1}, Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;->onRulesComposed()V
    :try_end_0
    .catch Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException; {:try_start_0 .. :try_end_0} :catch_0

    .line 151
    :cond_0
    :goto_0
    return-void

    .line 98
    :catch_0
    move-exception v0

    .line 99
    .local v0, "e":Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
    iget-object v1, p0, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->TAG:Ljava/lang/String;

    const-string v2, "Store Rule: RuleDBException while adding new rule in DB: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 100
    if-eqz p2, :cond_0

    .line 101
    invoke-interface {p2}, Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;->onRulesCompositionFailed()V

    goto :goto_0
.end method

.method protected abstract addRowInsertAdditionalData(ILcom/belkin/wemo/rules/data/RMDBRule;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Ljava/lang/String;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;",
            "Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;",
            "Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation
.end method

.method public delete(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;)V
    .locals 4
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;

    .prologue
    .line 216
    .local p0, "this":Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;, "Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer<TT;>;"
    iget-object v2, p0, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v2, Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v2}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleId()I

    move-result v1

    .line 218
    .local v1, "ruleId":I
    :try_start_0
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRowRules(I)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    .line 220
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRowRuleDevices(I)I

    .line 223
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->deleteFromAdditionalTables()V
    :try_end_0
    .catch Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException; {:try_start_0 .. :try_end_0} :catch_0

    .line 240
    if-eqz p1, :cond_0

    .line 241
    invoke-interface {p1}, Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;->onRulesComposed()V

    .line 243
    :cond_0
    :goto_0
    return-void

    .line 225
    :cond_1
    if-eqz p2, :cond_0

    .line 226
    :try_start_1
    invoke-interface {p2}, Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;->onRulesCompositionFailed()V
    :try_end_1
    .catch Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 231
    :catch_0
    move-exception v0

    .line 232
    .local v0, "e":Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
    iget-object v2, p0, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->TAG:Ljava/lang/String;

    const-string v3, "Store Rule: RuleDBException while deleting rule from DB: "

    invoke-static {v2, v3, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 233
    if-eqz p2, :cond_0

    .line 234
    invoke-interface {p2}, Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;->onRulesCompositionFailed()V

    goto :goto_0
.end method

.method protected abstract deleteFromAdditionalTables()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation
.end method

.method public disable(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;)V
    .locals 2
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;

    .prologue
    .line 262
    .local p0, "this":Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;, "Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer<TT;>;"
    iget-object v1, p0, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v1, Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleId()I

    move-result v0

    .line 263
    .local v0, "ruleId":I
    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->toggleRuleState(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;II)V

    .line 264
    return-void
.end method

.method public edit(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;)V
    .locals 3
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;

    .prologue
    .line 31
    .local p0, "this":Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;, "Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer<TT;>;"
    iget-object v2, p0, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v2, Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v2}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleId()I

    move-result v1

    .line 34
    .local v1, "ruleId":I
    :try_start_0
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRowRuleDevices(I)I

    .line 37
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->deleteFromAdditionalTables()V
    :try_end_0
    .catch Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    invoke-virtual {p0, p1, p2}, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->add(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;)V

    .line 48
    :cond_0
    :goto_0
    return-void

    .line 39
    :catch_0
    move-exception v0

    .line 40
    .local v0, "e":Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
    if-eqz p2, :cond_0

    .line 41
    invoke-interface {p2}, Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;->onRulesCompositionFailed()V

    goto :goto_0
.end method

.method public enable(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;)V
    .locals 2
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;

    .prologue
    .line 255
    .local p0, "this":Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;, "Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer<TT;>;"
    iget-object v1, p0, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v1, Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleId()I

    move-result v0

    .line 256
    .local v0, "ruleId":I
    const/4 v1, 0x1

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;->toggleRuleState(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;II)V

    .line 257
    return-void
.end method

.method public reset(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;)V
    .locals 0
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;

    .prologue
    .line 250
    .local p0, "this":Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;, "Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer<TT;>;"
    return-void
.end method

.method protected abstract writeToAdditionalTables()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation
.end method
