.class public Lcom/belkin/wemo/rules/read/type/db/RMAwayModeRuleParser;
.super Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;
.source "RMAwayModeRuleParser.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser",
        "<",
        "Lcom/belkin/wemo/rules/data/RMAwayModeRule;",
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
.method protected createRuleObject()Lcom/belkin/wemo/rules/data/RMAwayModeRule;
    .locals 1

    .prologue
    .line 18
    new-instance v0, Lcom/belkin/wemo/rules/data/RMAwayModeRule;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/data/RMAwayModeRule;-><init>()V

    return-object v0
.end method

.method protected bridge synthetic createRuleObject()Lcom/belkin/wemo/rules/data/RMDBRule;
    .locals 1

    .prologue
    .line 14
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/read/type/db/RMAwayModeRuleParser;->createRuleObject()Lcom/belkin/wemo/rules/data/RMAwayModeRule;

    move-result-object v0

    return-object v0
.end method

.method protected extractRuleDevicesTable(Lcom/belkin/wemo/rules/db/model/RMTRules;)Z
    .locals 12
    .param p1, "ruleEntry"    # Lcom/belkin/wemo/rules/db/model/RMTRules;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 28
    const/4 v3, 0x1

    .line 31
    .local v3, "extracted":Z
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMAwayModeRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v9, Lcom/belkin/wemo/rules/data/RMAwayModeRule;

    invoke-virtual {v9}, Lcom/belkin/wemo/rules/data/RMAwayModeRule;->getRuleId()I

    move-result v7

    .line 32
    .local v7, "ruleId":I
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v9

    invoke-virtual {v9, v7}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDevices(I)Ljava/util/List;

    move-result-object v6

    .line 33
    .local v6, "ruleDevicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;>;"
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMAwayModeRuleParser;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "extractRule: Rule ID = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "; RULEDEVICES entries count = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v2

    .line 36
    .local v2, "entryCountRuleDevices":I
    if-lez v2, :cond_2

    .line 37
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;

    .line 38
    .local v1, "entry":Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    invoke-virtual {v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getDeviceID()Ljava/lang/String;

    move-result-object v8

    .line 39
    .local v8, "udn":Ljava/lang/String;
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMAwayModeRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v9, Lcom/belkin/wemo/rules/data/RMAwayModeRule;

    invoke-virtual {v9}, Lcom/belkin/wemo/rules/data/RMAwayModeRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 40
    .local v0, "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {v0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUdn()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 41
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMAwayModeRuleParser;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Entry already added in rule object for AWAY MODE DEVICE. UDN = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "; Extracting day ID and moving to next row."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMAwayModeRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v9, Lcom/belkin/wemo/rules/data/RMAwayModeRule;

    invoke-virtual {p0, v1}, Lcom/belkin/wemo/rules/read/type/db/RMAwayModeRuleParser;->extractRuleDay(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/rules/data/RMAwayModeRule;->addDay(Ljava/lang/Integer;)V

    goto :goto_0

    .line 48
    .end local v0    # "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    :cond_1
    new-instance v0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;-><init>()V

    .line 49
    .restart local v0    # "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {p0, v1, v0}, Lcom/belkin/wemo/rules/read/type/db/RMAwayModeRuleParser;->fillRuleDeviceDetails(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)V

    .line 50
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMAwayModeRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v9, Lcom/belkin/wemo/rules/data/RMAwayModeRule;

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/rules/data/RMAwayModeRule;->addRuleDevice(Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)Z

    .line 51
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMAwayModeRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v9, Lcom/belkin/wemo/rules/data/RMAwayModeRule;

    invoke-virtual {p0, v1}, Lcom/belkin/wemo/rules/read/type/db/RMAwayModeRuleParser;->extractRuleDay(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/rules/data/RMAwayModeRule;->addDay(Ljava/lang/Integer;)V

    .line 52
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMAwayModeRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v9, Lcom/belkin/wemo/rules/data/RMAwayModeRule;

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getStartTime()I

    move-result v10

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/rules/data/RMAwayModeRule;->setStartTime(I)V

    .line 53
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMAwayModeRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v9, Lcom/belkin/wemo/rules/data/RMAwayModeRule;

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getEndTime()I

    move-result v10

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/rules/data/RMAwayModeRule;->setEndTime(I)V

    .line 54
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMAwayModeRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v9, Lcom/belkin/wemo/rules/data/RMAwayModeRule;

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getRuleDuration()I

    move-result v10

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/rules/data/RMAwayModeRule;->setRuleDuration(I)V

    .line 56
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMAwayModeRuleParser;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Extracted TARGET DEVICE ENTRY: DEVICE_ID = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUdn()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 59
    .end local v0    # "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .end local v1    # "entry":Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v8    # "udn":Ljava/lang/String;
    :cond_2
    return v3
.end method

.method protected extractRuleSpecificTables()Z
    .locals 1

    .prologue
    .line 64
    const/4 v0, 0x1

    return v0
.end method

.method protected getDBRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->AWAY_MODE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    return-object v0
.end method
