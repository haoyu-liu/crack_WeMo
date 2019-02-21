.class public Lcom/belkin/wemo/rules/read/type/db/RMLongPressRuleParser;
.super Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;
.source "RMLongPressRuleParser.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser",
        "<",
        "Lcom/belkin/wemo/rules/data/RMLongPressRule;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic createRuleObject()Lcom/belkin/wemo/rules/data/RMDBRule;
    .locals 1

    .prologue
    .line 14
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/read/type/db/RMLongPressRuleParser;->createRuleObject()Lcom/belkin/wemo/rules/data/RMLongPressRule;

    move-result-object v0

    return-object v0
.end method

.method protected createRuleObject()Lcom/belkin/wemo/rules/data/RMLongPressRule;
    .locals 1

    .prologue
    .line 18
    new-instance v0, Lcom/belkin/wemo/rules/data/RMLongPressRule;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/data/RMLongPressRule;-><init>()V

    return-object v0
.end method

.method protected extractRuleSpecificTables()Z
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 28
    const/4 v1, 0x1

    .line 30
    .local v1, "extracted":Z
    iget-object v8, p0, Lcom/belkin/wemo/rules/read/type/db/RMLongPressRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v8, Lcom/belkin/wemo/rules/data/RMLongPressRule;

    invoke-virtual {v8}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getRuleId()I

    move-result v4

    .line 32
    .local v4, "ruleId":I
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v8

    invoke-virtual {v8, v4}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getTargetDevices(I)Ljava/util/List;

    move-result-object v6

    .line 33
    .local v6, "targetDevicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;>;"
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v0

    .line 34
    .local v0, "count":I
    iget-object v8, p0, Lcom/belkin/wemo/rules/read/type/db/RMLongPressRuleParser;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Fetch Rules: Extracting data from TARGETDEVICES table. Rule ID: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "; Target Devices Count: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    if-lez v0, :cond_2

    .line 36
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;

    .line 40
    .local v5, "targetDevice":Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;
    invoke-virtual {v5}, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;->getDeviceIndex()I

    move-result v3

    .line 41
    .local v3, "index":I
    const/4 v8, -0x1

    if-eq v3, v8, :cond_0

    .line 42
    iget-object v8, p0, Lcom/belkin/wemo/rules/read/type/db/RMLongPressRuleParser;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Fetch Rules: Device Index IS NOT a TRIGGER_DEVICE_DEFAULT_INDEX. Index: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "; Adding into rule object."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    new-instance v7, Lcom/belkin/wemo/rules/data/RMTargetDevice;

    invoke-direct {v7}, Lcom/belkin/wemo/rules/data/RMTargetDevice;-><init>()V

    .line 44
    .local v7, "td":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    invoke-virtual {v5}, Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;->getDeviceID()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->setDeviceId(Ljava/lang/String;)V

    .line 45
    invoke-virtual {v7, v3}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->setDeviceIndex(I)V

    .line 46
    iget-object v8, p0, Lcom/belkin/wemo/rules/read/type/db/RMLongPressRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v8, Lcom/belkin/wemo/rules/data/RMLongPressRule;

    invoke-virtual {v8, v7}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->addTargetDevice(Lcom/belkin/wemo/rules/data/RMTargetDevice;)Z

    goto :goto_0

    .line 48
    .end local v7    # "td":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    :cond_0
    iget-object v8, p0, Lcom/belkin/wemo/rules/read/type/db/RMLongPressRuleParser;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Fetch Rules: Device Index IS a TRIGGER_DEVICE_DEFAULT_INDEX. Index: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "; NOT Adding into rule object."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 51
    .end local v3    # "index":I
    .end local v5    # "targetDevice":Lcom/belkin/wemo/rules/db/model/RMTTargetDevices;
    :cond_1
    const/4 v1, 0x1

    .line 53
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_2
    return v1
.end method

.method protected getDBRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->LONG_PRESS:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    return-object v0
.end method
