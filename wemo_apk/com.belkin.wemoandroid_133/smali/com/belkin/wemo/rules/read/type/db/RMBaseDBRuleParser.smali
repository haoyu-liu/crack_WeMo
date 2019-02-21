.class public abstract Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;
.super Ljava/lang/Object;
.source "RMBaseDBRuleParser.java"

# interfaces
.implements Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/belkin/wemo/rules/data/RMDBRule;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;"
    }
.end annotation


# instance fields
.field protected final TAG:Ljava/lang/String;

.field protected rule:Lcom/belkin/wemo/rules/data/RMDBRule;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    .local p0, "this":Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;, "Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->createRuleObject()Lcom/belkin/wemo/rules/data/RMDBRule;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    .line 28
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->TAG:Ljava/lang/String;

    .line 29
    return-void
.end method

.method private extractRulesTable(Lcom/belkin/wemo/rules/db/model/RMTRules;)V
    .locals 2
    .param p1, "ruleEntry"    # Lcom/belkin/wemo/rules/db/model/RMTRules;

    .prologue
    .line 32
    .local p0, "this":Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;, "Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser<TT;>;"
    iget-object v0, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRules;->getRuleId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/data/RMDBRule;->setRuleId(I)V

    .line 33
    iget-object v0, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {p0}, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->getDBRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/data/RMDBRule;->setRuleType(Lcom/belkin/wemo/rules/data/RMDBRuleType;)V

    .line 34
    iget-object v0, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/data/RMDBRule;->setRulesType(I)V

    .line 35
    iget-object v0, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRules;->getState()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/data/RMDBRule;->setState(I)V

    .line 36
    iget-object v0, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRules;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/data/RMDBRule;->setDisplayName(Ljava/lang/String;)V

    .line 37
    return-void
.end method


# virtual methods
.method protected abstract createRuleObject()Lcom/belkin/wemo/rules/data/RMDBRule;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public extractRule(Lcom/belkin/wemo/rules/db/model/RMTRules;Lcom/belkin/wemo/rules/read/type/callback/RMExtractRuleSuccessCallback;Lcom/belkin/wemo/rules/read/type/callback/RMExtractRulesErrorCallback;)V
    .locals 7
    .param p1, "ruleEntry"    # Lcom/belkin/wemo/rules/db/model/RMTRules;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/read/type/callback/RMExtractRuleSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/read/type/callback/RMExtractRulesErrorCallback;

    .prologue
    .local p0, "this":Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;, "Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser<TT;>;"
    const/4 v6, 0x2

    .line 118
    :try_start_0
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->extractRulesTable(Lcom/belkin/wemo/rules/db/model/RMTRules;)V

    .line 121
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->extractRuleDevicesTable(Lcom/belkin/wemo/rules/db/model/RMTRules;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 124
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->extractRuleSpecificTables()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 126
    if-eqz p2, :cond_0

    .line 127
    iget-object v1, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-interface {p2, v1}, Lcom/belkin/wemo/rules/read/type/callback/RMExtractRuleSuccessCallback;->onRuleParsed(Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 236
    :cond_0
    :goto_0
    return-void

    .line 131
    :cond_1
    if-eqz p3, :cond_0

    .line 132
    new-instance v1, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;

    const/16 v2, 0x1fa

    const-string v3, "Rule specific entries NOT found for this rule ID"

    const/4 v4, 0x2

    iget-object v5, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v5}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v5

    invoke-virtual {v5}, Lcom/belkin/wemo/rules/data/RMDBRuleType;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;-><init>(ILjava/lang/String;ILjava/lang/String;)V

    invoke-interface {p3, v1}, Lcom/belkin/wemo/rules/read/type/callback/RMExtractRulesErrorCallback;->onInvalidRuleFound(Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;)V
    :try_end_0
    .catch Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 147
    :catch_0
    move-exception v0

    .line 148
    .local v0, "e":Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
    iget-object v1, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->TAG:Ljava/lang/String;

    const-string v2, "RulesDBException while extracting rule: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 149
    if-eqz p3, :cond_0

    .line 150
    new-instance v1, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;

    const/16 v2, -0x384

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;->getMessage()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v4

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/data/RMDBRuleType;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v2, v3, v6, v4}, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;-><init>(ILjava/lang/String;ILjava/lang/String;)V

    invoke-interface {p3, v1}, Lcom/belkin/wemo/rules/read/type/callback/RMExtractRulesErrorCallback;->onInvalidRuleFound(Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;)V

    goto :goto_0

    .line 140
    .end local v0    # "e":Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
    :cond_2
    if-eqz p3, :cond_0

    .line 141
    :try_start_1
    new-instance v1, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;

    const/16 v2, 0x1f7

    const-string v3, "No entry found in RULEDEVICES table for this rule ID"

    const/4 v4, 0x2

    iget-object v5, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v5}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v5

    invoke-virtual {v5}, Lcom/belkin/wemo/rules/data/RMDBRuleType;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;-><init>(ILjava/lang/String;ILjava/lang/String;)V

    invoke-interface {p3, v1}, Lcom/belkin/wemo/rules/read/type/callback/RMExtractRulesErrorCallback;->onInvalidRuleFound(Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;)V
    :try_end_1
    .catch Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method protected extractRuleDay(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)I
    .locals 4
    .param p1, "ruleDeviceEntry"    # Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;

    .prologue
    .line 277
    .local p0, "this":Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;, "Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser<TT;>;"
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getDayID()I

    move-result v0

    .line 278
    .local v0, "ruleDay":I
    iget-object v1, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Fetch Rules: day id read from RULEDEVICES table: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    return v0
.end method

.method protected extractRuleDevicesTable(Lcom/belkin/wemo/rules/db/model/RMTRules;)Z
    .locals 13
    .param p1, "ruleEntry"    # Lcom/belkin/wemo/rules/db/model/RMTRules;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;, "Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser<TT;>;"
    const/4 v4, 0x0

    .line 43
    .local v4, "extracted":Z
    iget-object v10, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v10}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleId()I

    move-result v8

    .line 44
    .local v8, "ruleId":I
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v10

    invoke-virtual {v10, v8}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDevices(I)Ljava/util/List;

    move-result-object v7

    .line 45
    .local v7, "ruleDevicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;>;"
    iget-object v10, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "extractRule: Rule ID = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "; RULEDEVICES entries count = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v3

    .line 48
    .local v3, "entryCountRuleDevices":I
    if-lez v3, :cond_4

    .line 49
    const-string v1, ""

    .line 50
    .local v1, "currentRuleDeviceId":Ljava/lang/String;
    const/4 v6, 0x0

    .line 51
    .local v6, "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    const/4 v0, -0x1

    .line 52
    .local v0, "currentEntryDayId":I
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;

    .line 54
    .local v2, "entry":Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    invoke-virtual {v2}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getDeviceID()Ljava/lang/String;

    move-result-object v9

    .line 55
    .local v9, "singleRuleDeviceId":Ljava/lang/String;
    iget-object v10, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Extracted RULEDEVICE ENTRY: DEVICE_ID = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_1

    .line 59
    invoke-virtual {p0, v2}, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->extractRuleDay(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)I

    move-result v0

    .line 60
    iget-object v10, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/belkin/wemo/rules/data/RMDBRule;->addDay(Ljava/lang/Integer;)V

    .line 62
    move-object v1, v9

    .line 65
    iget-object v10, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v2}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getStartTime()I

    move-result v11

    invoke-virtual {v10, v11}, Lcom/belkin/wemo/rules/data/RMDBRule;->setStartTime(I)V

    .line 66
    iget-object v10, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v2}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getEndTime()I

    move-result v11

    invoke-virtual {v10, v11}, Lcom/belkin/wemo/rules/data/RMDBRule;->setEndTime(I)V

    .line 69
    const-string v10, "Bridge"

    invoke-virtual {v9, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 70
    new-instance v6, Lcom/belkin/wemo/rules/data/device/RMLed;

    .end local v6    # "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-direct {v6}, Lcom/belkin/wemo/rules/data/device/RMLed;-><init>()V

    .line 74
    .restart local v6    # "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    :goto_1
    iget-object v10, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v10, v6}, Lcom/belkin/wemo/rules/data/RMDBRule;->addRuleDevice(Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)Z

    .line 76
    invoke-virtual {p0, v2, v6}, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->fillRuleDeviceDetails(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)V

    goto :goto_0

    .line 72
    :cond_0
    new-instance v6, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .end local v6    # "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-direct {v6}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;-><init>()V

    .restart local v6    # "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    goto :goto_1

    .line 93
    :cond_1
    invoke-virtual {p0, v2}, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->extractRuleDay(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)I

    move-result v10

    if-ne v0, v10, :cond_2

    const-string v10, "Bridge"

    invoke-virtual {v1, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 96
    invoke-virtual {p0, v2, v6}, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->fillRuleZbCapabilities(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)V

    goto :goto_0

    .line 99
    :cond_2
    invoke-virtual {p0, v2}, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->extractRuleDay(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;)I

    move-result v0

    .line 100
    iget-object v10, p0, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/belkin/wemo/rules/data/RMDBRule;->addDay(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 104
    .end local v2    # "entry":Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    .end local v9    # "singleRuleDeviceId":Ljava/lang/String;
    :cond_3
    const/4 v4, 0x1

    .line 106
    .end local v0    # "currentEntryDayId":I
    .end local v1    # "currentRuleDeviceId":Ljava/lang/String;
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v6    # "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    :cond_4
    return v4
.end method

.method protected abstract extractRuleSpecificTables()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
        }
    .end annotation
.end method

.method protected fillRuleDeviceDetails(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)V
    .locals 1
    .param p1, "entry"    # Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    .param p2, "ruleDevice"    # Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .prologue
    .line 259
    .local p0, "this":Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;, "Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser<TT;>;"
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getStartAction()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p2, v0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->setStartAction(I)V

    .line 260
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getDeviceID()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->setUdn(Ljava/lang/String;)V

    .line 261
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getOnModeOffset()I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->setOnModeOffset(I)V

    .line 262
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getOffModeOffset()I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->setOffModeOffset(I)V

    .line 263
    invoke-virtual {p0, p1, p2}, Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;->fillRuleZbCapabilities(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)V

    .line 266
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getRuleDuration()I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->setRuleDuration(I)V

    .line 267
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getEndAction()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p2, v0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->setEndAction(I)V

    .line 268
    return-void
.end method

.method protected fillRuleZbCapabilities(Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;)V
    .locals 1
    .param p1, "ruleDeviceEntry"    # Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
    .param p2, "ruleDevice"    # Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .prologue
    .line 271
    .local p0, "this":Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser;, "Lcom/belkin/wemo/rules/read/type/db/RMBaseDBRuleParser<TT;>;"
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getZBCapabilityStart()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->setZbCapabilityStart(Ljava/lang/String;)V

    .line 273
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->getZBCapabilityEnd()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->setZbCapabilityEnd(Ljava/lang/String;)V

    .line 274
    return-void
.end method

.method protected abstract getDBRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;
.end method
