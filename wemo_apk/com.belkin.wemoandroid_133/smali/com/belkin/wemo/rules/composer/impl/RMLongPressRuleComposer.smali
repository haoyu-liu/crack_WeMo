.class public Lcom/belkin/wemo/rules/composer/impl/RMLongPressRuleComposer;
.super Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;
.source "RMLongPressRuleComposer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer",
        "<",
        "Lcom/belkin/wemo/rules/data/RMLongPressRule;",
        ">;"
    }
.end annotation


# static fields
.field private static final START_ACTION_AWAY_MODE:I = 0x3

.field public static final TRIGGER_DEVICE_DEFAULT_INDEX:I = -0x1


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/data/RMLongPressRule;)V
    .locals 0
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMLongPressRule;

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/composer/impl/RMAbstractDBRuleComposer;-><init>(Lcom/belkin/wemo/rules/data/RMDBRule;)V

    .line 19
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
    .line 12
    move-object v2, p2

    check-cast v2, Lcom/belkin/wemo/rules/data/RMLongPressRule;

    move-object v0, p0

    move v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/belkin/wemo/rules/composer/impl/RMLongPressRuleComposer;->addRowInsertAdditionalData(ILcom/belkin/wemo/rules/data/RMLongPressRule;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected addRowInsertAdditionalData(ILcom/belkin/wemo/rules/data/RMLongPressRule;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "dayId"    # I
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMLongPressRule;
    .param p3, "ruleDevice"    # Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .param p4, "row"    # Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    .param p5, "zbCapabilityStart"    # Ljava/lang/String;
    .param p6, "zbCapabilityEnd"    # Ljava/lang/String;

    .prologue
    .line 71
    return-void
.end method

.method protected deleteFromAdditionalTables()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 75
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v1

    iget-object v0, p0, Lcom/belkin/wemo/rules/composer/impl/RMLongPressRuleComposer;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v0, Lcom/belkin/wemo/rules/data/RMLongPressRule;

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getRuleId()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRowTargetDevices(I)I

    .line 76
    return-void
.end method

.method protected writeToAdditionalTables()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 28
    iget-object v11, p0, Lcom/belkin/wemo/rules/composer/impl/RMLongPressRuleComposer;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v11, Lcom/belkin/wemo/rules/data/RMLongPressRule;

    invoke-virtual {v11}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 29
    .local v3, "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {v3}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getStartAction()I

    move-result v5

    .line 30
    .local v5, "startAction":I
    invoke-virtual {v3}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v10

    .line 31
    .local v10, "udn":Ljava/lang/String;
    const/4 v11, 0x3

    if-ne v11, v5, :cond_0

    .line 32
    const/4 v2, 0x0

    .line 33
    .local v2, "isTriggerDeviceInDeviceIndex":Z
    iget-object v11, p0, Lcom/belkin/wemo/rules/composer/impl/RMLongPressRuleComposer;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v11, Lcom/belkin/wemo/rules/data/RMLongPressRule;

    invoke-virtual {v11}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getTargetDeviceSet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/belkin/wemo/rules/data/RMTargetDevice;

    .line 34
    .local v6, "targetDevice":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    invoke-virtual {v6}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->getDeviceId()Ljava/lang/String;

    move-result-object v7

    .line 35
    .local v7, "targetDeviceId":Ljava/lang/String;
    iget-object v11, p0, Lcom/belkin/wemo/rules/composer/impl/RMLongPressRuleComposer;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "TriggerDevice Not A TargetDevice CHECK. TARGETDeviceId: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "; TRIGGERDeviceId: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    invoke-virtual {v7, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 37
    const/4 v2, 0x1

    .line 42
    .end local v6    # "targetDevice":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    .end local v7    # "targetDeviceId":Ljava/lang/String;
    :cond_2
    if-nez v2, :cond_0

    .line 43
    iget-object v11, p0, Lcom/belkin/wemo/rules/composer/impl/RMLongPressRuleComposer;->TAG:Ljava/lang/String;

    const-string v12, "TriggerDevice Not A TargetDevice. ADDING Default Entry in TARGETDEVICES Table"

    invoke-static {v11, v12}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    new-instance v9, Lcom/belkin/wemo/rules/data/RMTargetDevice;

    invoke-direct {v9}, Lcom/belkin/wemo/rules/data/RMTargetDevice;-><init>()V

    .line 45
    .local v9, "td":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    invoke-virtual {v9, v10}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->setDeviceId(Ljava/lang/String;)V

    .line 46
    const/4 v11, -0x1

    invoke-virtual {v9, v11}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->setDeviceIndex(I)V

    .line 48
    iget-object v11, p0, Lcom/belkin/wemo/rules/composer/impl/RMLongPressRuleComposer;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v11, Lcom/belkin/wemo/rules/data/RMLongPressRule;

    invoke-virtual {v11, v9}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->addTargetDevice(Lcom/belkin/wemo/rules/data/RMTargetDevice;)Z

    goto :goto_0

    .line 54
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "isTriggerDeviceInDeviceIndex":Z
    .end local v3    # "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .end local v5    # "startAction":I
    .end local v9    # "td":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    .end local v10    # "udn":Ljava/lang/String;
    :cond_3
    iget-object v11, p0, Lcom/belkin/wemo/rules/composer/impl/RMLongPressRuleComposer;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v11, Lcom/belkin/wemo/rules/data/RMLongPressRule;

    invoke-virtual {v11}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getRuleId()I

    move-result v4

    .line 55
    .local v4, "ruleId":I
    iget-object v11, p0, Lcom/belkin/wemo/rules/composer/impl/RMLongPressRuleComposer;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    check-cast v11, Lcom/belkin/wemo/rules/data/RMLongPressRule;

    invoke-virtual {v11}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getTargetDeviceSet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/belkin/wemo/rules/data/RMTargetDevice;

    .line 56
    .restart local v6    # "targetDevice":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    iget-object v11, p0, Lcom/belkin/wemo/rules/composer/impl/RMLongPressRuleComposer;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Target Device Entry: DEVICE_ID: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v6}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->getDeviceId()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "; DEVICE_INDEX: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v6}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->getDeviceIndex()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "; RULE_ID: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    new-instance v8, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;

    invoke-direct {v8}, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;-><init>()V

    .line 58
    .local v8, "targetDevicesRow":Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;
    invoke-virtual {v6}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->getDeviceId()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11}, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;->setDeviceID(Ljava/lang/String;)V

    .line 59
    invoke-virtual {v6}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->getDeviceIndex()I

    move-result v11

    invoke-virtual {v8, v11}, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;->setDeviceIndex(I)V

    .line 60
    invoke-virtual {v8, v4}, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;->setRuleId(I)V

    .line 62
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v11

    invoke-virtual {v11, v8}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->insertRowTargetDevices(Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;)J

    goto :goto_1

    .line 64
    .end local v6    # "targetDevice":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    .end local v8    # "targetDevicesRow":Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;
    :cond_4
    return-void
.end method
