.class public Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;
.super Ljava/lang/Object;
.source "RMResetDBRulesManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$1;,
        Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;
    }
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;

.field private udn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const-class v0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->TAG:Ljava/lang/String;

    .line 19
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    .line 20
    return-void
.end method


# virtual methods
.method public resetDeviceRules()I
    .locals 15

    .prologue
    .line 23
    const/4 v10, -0x1

    .line 26
    .local v10, "rulesToModify":I
    :try_start_0
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    invoke-virtual {v12, v13}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleIDsForDevice(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v5

    .line 27
    .local v5, "ruleIDSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface {v5}, Ljava/util/Set;->size()I

    move-result v10

    .line 28
    iget-object v12, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "resetDeviceRules(): Rules count = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "; UDN = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    if-lez v10, :cond_0

    .line 31
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .local v9, "rulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;>;"
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    .line 34
    .local v6, "ruleId":Ljava/lang/Integer;
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-virtual {v12, v13}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRuleDevicesCount(I)I

    move-result v0

    .line 35
    .local v0, "deviceCount":I
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-virtual {v12, v13}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getDBRuleType(I)Ljava/lang/String;

    move-result-object v8

    .line 36
    .local v8, "ruleTypeStr":Ljava/lang/String;
    iget-object v12, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "resetDeviceRules(): Rule type = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "; UDN = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "; total rule device count = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException; {:try_start_0 .. :try_end_0} :catch_1

    .line 39
    :try_start_1
    invoke-static {v8}, Lcom/belkin/wemo/rules/data/RMDBRuleType;->fromString(Ljava/lang/String;)Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v7

    .line 40
    .local v7, "ruleType":Lcom/belkin/wemo/rules/data/RMDBRuleType;
    new-instance v1, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v12

    invoke-direct {v1, p0, v12, v7, v0}, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;-><init>(Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;ILcom/belkin/wemo/rules/data/RMDBRuleType;I)V

    .line 41
    .local v1, "deviceRule":Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;
    invoke-interface {v9, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 42
    .end local v1    # "deviceRule":Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;
    .end local v7    # "ruleType":Lcom/belkin/wemo/rules/data/RMDBRuleType;
    :catch_0
    move-exception v2

    .line 43
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    :try_start_2
    iget-object v12, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->TAG:Ljava/lang/String;

    const-string v13, "IllegalArgumentException while fetching RMDBRuleType from ruleTypeStr: "

    invoke-static {v12, v13, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_2
    .catch Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 135
    .end local v0    # "deviceCount":I
    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v5    # "ruleIDSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v6    # "ruleId":Ljava/lang/Integer;
    .end local v8    # "ruleTypeStr":Ljava/lang/String;
    .end local v9    # "rulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;>;"
    :catch_1
    move-exception v2

    .line 136
    .local v2, "e":Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
    iget-object v12, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->TAG:Ljava/lang/String;

    const-string v13, "RuleDBException while deleting all rules for a device during reset: "

    invoke-static {v12, v13, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 137
    const/4 v10, -0x1

    .line 139
    .end local v2    # "e":Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
    :cond_0
    return v10

    .line 47
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v5    # "ruleIDSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .restart local v9    # "rulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;>;"
    :cond_1
    :try_start_3
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;

    .line 48
    .local v4, "rule":Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;
    invoke-virtual {v4}, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->getRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v11

    .line 49
    .local v11, "type":Lcom/belkin/wemo/rules/data/RMDBRuleType;
    invoke-virtual {v4}, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->getRuleId()I

    move-result v6

    .line 51
    .local v6, "ruleId":I
    sget-object v12, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$1;->$SwitchMap$com$belkin$wemo$rules$data$RMDBRuleType:[I

    invoke-virtual {v11}, Lcom/belkin/wemo/rules/data/RMDBRuleType;->ordinal()I

    move-result v13

    aget v12, v12, v13

    packed-switch v12, :pswitch_data_0

    goto :goto_1

    .line 53
    :pswitch_0
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    invoke-virtual {v12, v13, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRuleDevicesEnrtiesByUDN(Ljava/lang/String;I)I

    .line 54
    invoke-virtual {v4}, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->getDeviceCount()I

    move-result v12

    const/4 v13, 0x2

    if-gt v12, v13, :cond_2

    .line 56
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRowRules(I)I

    goto :goto_1

    .line 60
    :pswitch_1
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    invoke-virtual {v12, v13}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteTargetDevicesEnrtiesByUDN(Ljava/lang/String;)I

    .line 61
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    invoke-virtual {v12, v13, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRuleDevicesEnrtiesByUDN(Ljava/lang/String;I)I

    .line 62
    const/4 v12, 0x1

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->getDeviceCount()I

    move-result v13

    if-ne v12, v13, :cond_2

    .line 63
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRowRules(I)I

    goto :goto_1

    .line 67
    :pswitch_2
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    invoke-virtual {v12, v13, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRuleDevicesEnrtiesByUDN(Ljava/lang/String;I)I

    .line 68
    const/4 v12, 0x1

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->getDeviceCount()I

    move-result v13

    if-ne v12, v13, :cond_2

    .line 69
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRowRules(I)I

    .line 70
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRulesNotifyMessageEnrties(I)I

    goto :goto_1

    .line 74
    :pswitch_3
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    invoke-virtual {v12, v13, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRuleDevicesEnrtiesByUDN(Ljava/lang/String;I)I

    .line 75
    const/4 v12, 0x1

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->getDeviceCount()I

    move-result v13

    if-ne v12, v13, :cond_2

    .line 76
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRowRules(I)I

    goto/16 :goto_1

    .line 81
    :pswitch_4
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    invoke-virtual {v12, v13}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteTargetDevicesEnrtiesByUDN(Ljava/lang/String;)I

    .line 82
    iget-object v12, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v12

    const-string v13, "dimmer"

    invoke-virtual {v12, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_3

    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getTargetDevices(I)Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    if-nez v12, :cond_2

    .line 83
    :cond_3
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRowRuleDevices(I)I

    .line 84
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRowRules(I)I

    goto/16 :goto_1

    .line 88
    :pswitch_5
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    invoke-virtual {v12, v13, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRuleDevicesEnrtiesByUDN(Ljava/lang/String;I)I

    .line 89
    const/4 v12, 0x1

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->getDeviceCount()I

    move-result v13

    if-ne v12, v13, :cond_2

    .line 90
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRowRules(I)I

    .line 91
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteSensorNotificationEnrties(I)I

    goto/16 :goto_1

    .line 95
    :pswitch_6
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    invoke-virtual {v12, v13, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRuleDevicesEnrtiesByUDN(Ljava/lang/String;I)I

    .line 96
    iget-object v12, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v12

    const-string v13, "sensor"

    invoke-virtual {v12, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_4

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->getDeviceCount()I

    move-result v12

    const/4 v13, 0x2

    if-gt v12, v13, :cond_5

    .line 97
    :cond_4
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRowRuleDevices(I)I

    .line 98
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRowRules(I)I

    .line 100
    :cond_5
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    invoke-virtual {v12, v13}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteDeviceCombinationEnrtiesByUDN(Ljava/lang/String;)I

    goto/16 :goto_1

    .line 103
    :pswitch_7
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    invoke-virtual {v12, v13, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRuleDevicesEnrtiesByUDN(Ljava/lang/String;I)I

    .line 104
    const/4 v12, 0x1

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->getDeviceCount()I

    move-result v13

    if-ne v12, v13, :cond_2

    .line 105
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRowRules(I)I

    .line 106
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteSensorNotificationEnrties(I)I

    goto/16 :goto_1

    .line 110
    :pswitch_8
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    invoke-virtual {v12, v13, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRuleDevicesEnrtiesByUDN(Ljava/lang/String;I)I

    .line 111
    iget-object v12, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v12

    const-string v13, "sensor"

    invoke-virtual {v12, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_6

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->getDeviceCount()I

    move-result v12

    const/4 v13, 0x2

    if-gt v12, v13, :cond_7

    .line 112
    :cond_6
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRowRuleDevices(I)I

    .line 113
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRowRules(I)I

    .line 115
    :cond_7
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    invoke-virtual {v12, v13}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteDeviceCombinationEnrtiesByUDN(Ljava/lang/String;)I

    goto/16 :goto_1

    .line 118
    :pswitch_9
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    invoke-virtual {v12, v13, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRuleDevicesEnrtiesByUDN(Ljava/lang/String;I)I

    .line 119
    const/4 v12, 0x1

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->getDeviceCount()I

    move-result v13

    if-ne v12, v13, :cond_2

    .line 120
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRowRules(I)I

    goto/16 :goto_1

    .line 124
    :pswitch_a
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;->udn:Ljava/lang/String;

    invoke-virtual {v12, v13, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRuleDevicesEnrtiesByUDN(Ljava/lang/String;I)I

    .line 125
    const/4 v12, 0x1

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->getDeviceCount()I

    move-result v13

    if-ne v12, v13, :cond_2

    .line 126
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->deleteRowRules(I)I
    :try_end_3
    .catch Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_1

    .line 51
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
    .end packed-switch
.end method
