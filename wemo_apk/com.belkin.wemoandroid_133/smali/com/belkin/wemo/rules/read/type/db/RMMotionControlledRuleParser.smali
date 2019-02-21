.class public Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;
.super Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;
.source "RMMotionControlledRuleParser.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser",
        "<",
        "Lcom/belkin/wemo/rules/data/RMMotionControlledRule;",
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
    .line 59
    const/4 v2, 0x1

    .line 61
    .local v2, "isExtracted":Z
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getDeviceID()Ljava/lang/String;

    move-result-object v4

    .line 62
    .local v4, "udn":Ljava/lang/String;
    iget-object v5, p0, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v5, Lcom/belkin/wemo/rules/data/RMMotionControlledRule;

    invoke-virtual {v5}, Lcom/belkin/wemo/rules/data/RMMotionControlledRule;->getSensorTargetDeviceSet()Ljava/util/Set;

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

    check-cast v0, Lcom/belkin/wemo/rules/data/RMSensorTargetDevice;

    .line 63
    .local v0, "device":Lcom/belkin/wemo/rules/data/RMSensorTargetDevice;
    invoke-virtual {v0}, Lcom/belkin/wemo/rules/data/RMSensorTargetDevice;->getUdn()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 64
    iget-object v5, p0, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Entry already added in rule object for SESNOR TARGET DEVICE. UDN = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "; Extracting day ID and moving to next row."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    iget-object v5, p0, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v5, Lcom/belkin/wemo/rules/data/RMMotionControlledRule;

    invoke-virtual {p0, p1}, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->extractRuleDay(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/rules/data/RMMotionControlledRule;->addDay(Ljava/lang/Integer;)V

    .line 77
    .end local v0    # "device":Lcom/belkin/wemo/rules/data/RMSensorTargetDevice;
    :goto_0
    return v2

    .line 70
    :cond_1
    new-instance v3, Lcom/belkin/wemo/rules/data/RMSensorTargetDevice;

    invoke-direct {v3}, Lcom/belkin/wemo/rules/data/RMSensorTargetDevice;-><init>()V

    .line 71
    .local v3, "targetDevice":Lcom/belkin/wemo/rules/data/RMSensorTargetDevice;
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getSensorDuration()I

    move-result v5

    invoke-virtual {v3, v5}, Lcom/belkin/wemo/rules/data/RMSensorTargetDevice;->setSensorDuration(I)V

    .line 72
    invoke-virtual {p0, p1, v3}, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->fillRuleDeviceDetails(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)V

    .line 73
    iget-object v5, p0, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v5, Lcom/belkin/wemo/rules/data/RMMotionControlledRule;

    invoke-virtual {v5, v3}, Lcom/belkin/wemo/rules/data/RMMotionControlledRule;->addSensorTargetDevice(Lcom/belkin/wemo/rules/data/RMSensorTargetDevice;)Z

    .line 74
    iget-object v5, p0, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v5, Lcom/belkin/wemo/rules/data/RMMotionControlledRule;

    invoke-virtual {p0, p1}, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->extractRuleDay(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/rules/data/RMMotionControlledRule;->addDay(Ljava/lang/Integer;)V

    .line 76
    iget-object v5, p0, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Extracted TARGET DEVICE ENTRY: DEVICE_ID = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/data/RMSensorTargetDevice;->getUdn()Ljava/lang/String;

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
    .line 28
    const/4 v1, 0x1

    .line 33
    .local v1, "isExtracted":Z
    iget-object v2, p0, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v2, Lcom/belkin/wemo/rules/data/RMMotionControlledRule;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getStartTime()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/rules/data/RMMotionControlledRule;->setStartTime(I)V

    .line 34
    iget-object v2, p0, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v2, Lcom/belkin/wemo/rules/data/RMMotionControlledRule;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getEndTime()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/rules/data/RMMotionControlledRule;->setEndTime(I)V

    .line 35
    iget-object v2, p0, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v2, Lcom/belkin/wemo/rules/data/RMMotionControlledRule;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getRuleDuration()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/rules/data/RMMotionControlledRule;->setRuleDuration(I)V

    .line 38
    new-instance v0, Lcom/belkin/wemo/rules/data/RMSensorDevice;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/data/RMSensorDevice;-><init>()V

    .line 39
    .local v0, "device":Lcom/belkin/wemo/rules/data/RMSensorDevice;
    iget-object v2, p0, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v2, Lcom/belkin/wemo/rules/data/RMMotionControlledRule;

    invoke-virtual {v2, v0}, Lcom/belkin/wemo/rules/data/RMMotionControlledRule;->addRuleDevice(Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)Z

    .line 41
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getValue()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/belkin/wemo/rules/data/RMSensorDevice;->setValue(I)V

    .line 42
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getLevel()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/belkin/wemo/rules/data/RMSensorDevice;->setLevel(I)V

    .line 44
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getSensorDuration()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/belkin/wemo/rules/data/RMSensorDevice;->setSensorDuration(I)V

    .line 45
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getType()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/belkin/wemo/rules/data/RMSensorDevice;->setType(I)V

    .line 47
    invoke-virtual {p0, p1, v0}, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->fillRuleDeviceDetails(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)V

    .line 51
    iget-object v2, p0, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->TAG:Ljava/lang/String;

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

    .line 52
    return v1
.end method

.method private isSensorDevice(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)Z
    .locals 5
    .param p1, "entry"    # Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;

    .prologue
    const/4 v4, -0x1

    .line 109
    const/4 v1, 0x0

    .line 110
    .local v1, "isSensorDev":Z
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getType()I

    move-result v3

    .line 111
    .local v3, "type":I
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getSensorDuration()I

    move-result v2

    .line 112
    .local v2, "sensorDuration":I
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->extractRuleDay(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)I

    move-result v0

    .line 113
    .local v0, "dayId":I
    if-nez v3, :cond_0

    if-ne v2, v4, :cond_0

    if-ne v4, v0, :cond_0

    .line 114
    const/4 v1, 0x1

    .line 117
    :cond_0
    return v1
.end method


# virtual methods
.method protected bridge synthetic createRuleObject()Lcom/belkin/wemo/rules/data/RMDBRule;
    .locals 1

    .prologue
    .line 15
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->createRuleObject()Lcom/belkin/wemo/rules/data/RMMotionControlledRule;

    move-result-object v0

    return-object v0
.end method

.method protected createRuleObject()Lcom/belkin/wemo/rules/data/RMMotionControlledRule;
    .locals 1

    .prologue
    .line 19
    new-instance v0, Lcom/belkin/wemo/rules/data/RMMotionControlledRule;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/data/RMMotionControlledRule;-><init>()V

    return-object v0
.end method

.method protected extractRuleDevicesTable(Lcom/belkin/wemo/rules/db/model/RMTRules;)Z
    .locals 9
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
    iget-object v6, p0, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v6, Lcom/belkin/wemo/rules/data/RMMotionControlledRule;

    invoke-virtual {v6}, Lcom/belkin/wemo/rules/data/RMMotionControlledRule;->getRuleId()I

    move-result v5

    .line 86
    .local v5, "ruleId":I
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDevices(I)Ljava/util/List;

    move-result-object v4

    .line 87
    .local v4, "ruleDevicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;>;"
    iget-object v6, p0, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "extractRule: Rule ID = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "; RULEDEVICES entries count = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

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

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;

    .line 94
    .local v0, "entry":Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    invoke-direct {p0, v0}, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->isSensorDevice(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 96
    invoke-direct {p0, v0}, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->extractTriggerDevice(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)Z

    move-result v2

    .line 100
    :goto_0
    if-nez v2, :cond_0

    .line 105
    .end local v0    # "entry":Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_1
    return v2

    .line 98
    .restart local v0    # "entry":Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_2
    invoke-direct {p0, v0}, Lcom/belkin/wemo/rules/read/type/db/RMMotionControlledRuleParser;->extractTargetDevice(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)Z

    move-result v2

    goto :goto_0
.end method

.method protected extractRuleSpecificTables()Z
    .locals 1

    .prologue
    .line 122
    const/4 v0, 0x1

    return v0
.end method

.method protected getDBRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->MOTION_CONTROLLED:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    return-object v0
.end method
