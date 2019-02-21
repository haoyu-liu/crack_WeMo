.class public Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;
.super Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;
.source "RMNotifyMeRuleParser.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser",
        "<",
        "Lcom/belkin/wemo/rules/data/RMNotifyMeRule;",
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


# virtual methods
.method protected bridge synthetic createRuleObject()Lcom/belkin/wemo/rules/data/RMDBRule;
    .locals 1

    .prologue
    .line 15
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;->createRuleObject()Lcom/belkin/wemo/rules/data/RMNotifyMeRule;

    move-result-object v0

    return-object v0
.end method

.method protected createRuleObject()Lcom/belkin/wemo/rules/data/RMNotifyMeRule;
    .locals 1

    .prologue
    .line 19
    new-instance v0, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;-><init>()V

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
    .line 29
    const/4 v3, 0x1

    .line 32
    .local v3, "extracted":Z
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v9, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;

    invoke-virtual {v9}, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->getRuleId()I

    move-result v7

    .line 33
    .local v7, "ruleId":I
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v9

    invoke-virtual {v9, v7}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDevices(I)Ljava/util/List;

    move-result-object v6

    .line 34
    .local v6, "ruleDevicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;>;"
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;->TAG:Ljava/lang/String;

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

    .line 36
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v2

    .line 37
    .local v2, "entryCountRuleDevices":I
    if-lez v2, :cond_2

    .line 38
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;

    .line 39
    .local v1, "entry":Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    invoke-virtual {v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getDeviceID()Ljava/lang/String;

    move-result-object v8

    .line 40
    .local v8, "udn":Ljava/lang/String;
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v9, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;

    invoke-virtual {v9}, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->getRuleDeviceSet()Ljava/util/Set;

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

    .line 41
    .local v0, "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {v0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUdn()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 42
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Entry already added in rule object for Notify Me DEVICE. UDN = "

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

    .line 43
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v9, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;

    invoke-virtual {p0, v1}, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;->extractRuleDay(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->addDay(Ljava/lang/Integer;)V

    goto :goto_0

    .line 49
    .end local v0    # "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    :cond_1
    new-instance v0, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;-><init>()V

    .line 50
    .restart local v0    # "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {p0, v1, v0}, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;->fillRuleDeviceDetails(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)V

    .line 51
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v9, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->addRuleDevice(Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)Z

    .line 52
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v9, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;

    invoke-virtual {p0, v1}, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;->extractRuleDay(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->addDay(Ljava/lang/Integer;)V

    .line 53
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v9, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getStartTime()I

    move-result v10

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->setStartTime(I)V

    .line 54
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v9, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getEndTime()I

    move-result v10

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->setEndTime(I)V

    .line 55
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v9, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getRuleDuration()I

    move-result v10

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->setRuleDuration(I)V

    .line 57
    iget-object v9, p0, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;->TAG:Ljava/lang/String;

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

    .line 60
    .end local v0    # "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .end local v1    # "entry":Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v8    # "udn":Ljava/lang/String;
    :cond_2
    return v3
.end method

.method protected extractRuleSpecificTables()Z
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 65
    const/4 v1, 0x1

    .line 67
    .local v1, "extracted":Z
    iget-object v6, p0, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v6, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;

    invoke-virtual {v6}, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->getRuleId()I

    move-result v3

    .line 70
    .local v3, "ruleId":I
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v6

    invoke-virtual {v6, v3}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getSensorNotification(I)Ljava/util/List;

    move-result-object v5

    .line 71
    .local v5, "sensorNotificationList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;>;"
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v0

    .line 72
    .local v0, "count":I
    iget-object v6, p0, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Fetch Rules: Extracting data from TARGETDEVICES table. Rule ID: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "; Target Devices Count: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    if-lez v0, :cond_1

    .line 74
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;

    .line 75
    .local v4, "sensorNotificationEntry":Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;
    iget-object v6, p0, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v6, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;->getNotificationDuration()I

    move-result v7

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->setNotificationDuration(I)V

    .line 76
    iget-object v6, p0, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v6, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;->getNotificationMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->setNotificationMsg(Ljava/lang/String;)V

    .line 77
    iget-object v6, p0, Lcom/belkin/wemo/rules/read/type/db/RMNotifyMeRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    check-cast v6, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;->getNotifyRuleID()I

    move-result v7

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/rules/data/RMNotifyMeRule;->setNotifyRuleID(I)V

    goto :goto_0

    .line 79
    .end local v4    # "sensorNotificationEntry":Lcom/belkin/wemo/rules/db/model/RMTSensorNotification;
    :cond_0
    const/4 v1, 0x1

    .line 81
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_1
    return v1
.end method

.method protected getDBRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lcom/belkin/wemo/rules/data/RMDBRuleType;->NOTIFY_ME:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    return-object v0
.end method
