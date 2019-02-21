.class public Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;
.super Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;
.source "RMEventRuleParser.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser",
        "<",
        "Lcom/belkin/wemo/rules/data/RMEventRule;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;-><init>()V

    return-void
.end method

.method private extractTargetDevice(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)Z
    .locals 8
    .param p1, "entry"    # Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;

    .prologue
    .line 62
    const/4 v2, 0x1

    .line 64
    .local v2, "isExtracted":Z
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getDeviceID()Ljava/lang/String;

    move-result-object v4

    .line 65
    .local v4, "udn":Ljava/lang/String;
    iget-object v5, p0, Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v5, Lcom/belkin/wemo/rules/data/RMEventRule;

    invoke-virtual {v5}, Lcom/belkin/wemo/rules/data/RMEventRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 66
    .local v0, "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {v0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUdn()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 67
    iget-object v5, p0, Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Entry already added in rule object for TARGET DEVICE. UDN = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "; Moving to next row."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .end local v0    # "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    :goto_0
    return v2

    .line 72
    :cond_1
    new-instance v3, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    invoke-direct {v3}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;-><init>()V

    .line 73
    .local v3, "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {p0, p1, v3}, Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;->fillRuleDeviceDetails(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)V

    .line 74
    iget-object v5, p0, Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v5, Lcom/belkin/wemo/rules/data/RMEventRule;

    invoke-virtual {v5, v3}, Lcom/belkin/wemo/rules/data/RMEventRule;->addRuleDevice(Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)Z

    .line 76
    iget-object v5, p0, Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Extracted TARGET DEVICE ENTRY: DEVICE_ID = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUdn()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private extractTriggerDevice(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)Z
    .locals 5
    .param p1, "entry"    # Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;

    .prologue
    .line 33
    const/4 v1, 0x1

    .line 38
    .local v1, "isExtracted":Z
    iget-object v2, p0, Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v2, Lcom/belkin/wemo/rules/data/RMEventRule;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getStartTime()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/rules/data/RMEventRule;->setStartTime(I)V

    .line 39
    iget-object v2, p0, Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v2, Lcom/belkin/wemo/rules/data/RMEventRule;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getEndTime()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/rules/data/RMEventRule;->setEndTime(I)V

    .line 40
    iget-object v2, p0, Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v2, Lcom/belkin/wemo/rules/data/RMEventRule;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getRuleDuration()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/rules/data/RMEventRule;->setRuleDuration(I)V

    .line 43
    new-instance v0, Lcom/belkin/wemo/rules/data/RMSensorDevice;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/data/RMSensorDevice;-><init>()V

    .line 44
    .local v0, "device":Lcom/belkin/wemo/rules/data/RMSensorDevice;
    iget-object v2, p0, Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v2, Lcom/belkin/wemo/rules/data/RMEventRule;

    invoke-virtual {v2, v0}, Lcom/belkin/wemo/rules/data/RMEventRule;->addSensorDevice(Lcom/belkin/wemo/rules/data/RMSensorDevice;)Z

    .line 46
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getValue()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/belkin/wemo/rules/data/RMSensorDevice;->setValue(I)V

    .line 47
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getLevel()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/belkin/wemo/rules/data/RMSensorDevice;->setLevel(I)V

    .line 48
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getSensorDuration()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/belkin/wemo/rules/data/RMSensorDevice;->setSensorDuration(I)V

    .line 49
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getType()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/belkin/wemo/rules/data/RMSensorDevice;->setType(I)V

    .line 51
    invoke-virtual {p0, p1, v0}, Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;->fillRuleDeviceDetails(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)V

    .line 52
    iget-object v2, p0, Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v2, Lcom/belkin/wemo/rules/data/RMEventRule;

    invoke-virtual {p0, p1}, Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;->extractRuleDay(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/rules/data/RMEventRule;->addDay(Ljava/lang/Integer;)V

    .line 54
    iget-object v2, p0, Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Extracted SENSOR DEVICE ENTRY: DEVICE_ID = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/data/RMSensorDevice;->getUdn()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    return v1
.end method


# virtual methods
.method protected bridge synthetic createRuleObject()Lcom/belkin/wemo/rules/data/RMDBRule;
    .locals 1

    .prologue
    .line 15
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;->createRuleObject()Lcom/belkin/wemo/rules/data/RMEventRule;

    move-result-object v0

    return-object v0
.end method

.method protected createRuleObject()Lcom/belkin/wemo/rules/data/RMEventRule;
    .locals 1

    .prologue
    .line 19
    new-instance v0, Lcom/belkin/wemo/rules/data/RMEventRule;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/data/RMEventRule;-><init>()V

    return-object v0
.end method

.method protected extractRuleDevicesTable(Lcom/belkin/wemo/rules/db/model/RMTRules;)Z
    .locals 11
    .param p1, "ruleEntry"    # Lcom/belkin/wemo/rules/db/model/RMTRules;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 82
    const/4 v2, 0x1

    .line 85
    .local v2, "extracted":Z
    iget-object v8, p0, Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v8, Lcom/belkin/wemo/rules/data/RMEventRule;

    invoke-virtual {v8}, Lcom/belkin/wemo/rules/data/RMEventRule;->getRuleId()I

    move-result v5

    .line 86
    .local v5, "ruleId":I
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v8

    invoke-virtual {v8, v5}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDevices(I)Ljava/util/List;

    move-result-object v4

    .line 87
    .local v4, "ruleDevicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;>;"
    iget-object v8, p0, Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "extractRule: Rule ID = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "; RULEDEVICES entries count = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v1

    .line 90
    .local v1, "entryCountRuleDevices":I
    if-lez v1, :cond_1

    .line 91
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;

    .line 93
    .local v0, "entry":Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getType()I

    move-result v7

    .line 94
    .local v7, "type":I
    invoke-virtual {v0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getSensorDuration()I

    move-result v6

    .line 95
    .local v6, "sensorDuration":I
    const/4 v8, 0x5

    if-ne v7, v8, :cond_2

    const/4 v8, 0x1

    if-ne v6, v8, :cond_2

    .line 97
    invoke-direct {p0, v0}, Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;->extractTriggerDevice(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)Z

    move-result v2

    .line 101
    :goto_0
    if-nez v2, :cond_0

    .line 106
    .end local v0    # "entry":Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v6    # "sensorDuration":I
    .end local v7    # "type":I
    :cond_1
    return v2

    .line 99
    .restart local v0    # "entry":Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v6    # "sensorDuration":I
    .restart local v7    # "type":I
    :cond_2
    invoke-direct {p0, v0}, Lcom/belkin/wemo/rules/read/type/db/RMEventRuleParser;->extractTargetDevice(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)Z

    move-result v2

    goto :goto_0
.end method

.method protected extractRuleSpecificTables()Z
    .locals 1

    .prologue
    .line 29
    const/4 v0, 0x1

    return v0
.end method

.method protected getDBRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->EVENT_RULE:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    return-object v0
.end method
