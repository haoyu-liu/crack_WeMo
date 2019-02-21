.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->refreshLongPressRuleDetails(ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field final synthetic val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field final synthetic val$udn:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 0

    .prologue
    .line 4959
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->val$udn:Ljava/lang/String;

    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 17
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 4963
    const-string v12, "DeviceListManager"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "ERROR while refreshing Long press rule details. Error Message: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorMessage()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4965
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorCode()I

    move-result v12

    const/16 v13, 0x1f6

    if-ne v12, v13, :cond_4

    .line 4966
    const/4 v5, 0x0

    .line 4969
    .local v5, "isLongPressRuleFoundForDevice":Z
    sget-object v12, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    invoke-virtual {v12}, Lcom/belkin/wemo/rules/data/RMUserRules;->getRulesList()Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/belkin/wemo/rules/data/RMRule;

    .line 4970
    .local v7, "rule":Lcom/belkin/wemo/rules/data/RMRule;
    invoke-virtual {v7}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v12

    const/4 v13, 0x2

    if-ne v12, v13, :cond_0

    move-object v12, v7

    check-cast v12, Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v12}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v12

    sget-object v13, Lcom/belkin/wemo/rules/data/RMDBRuleType;->LONG_PRESS:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    if-ne v12, v13, :cond_0

    move-object v6, v7

    .line 4971
    check-cast v6, Lcom/belkin/wemo/rules/data/RMLongPressRule;

    .line 4972
    .local v6, "longPressRule":Lcom/belkin/wemo/rules/data/RMLongPressRule;
    invoke-virtual {v6}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 4973
    .local v8, "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {v8}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v9

    .line 4974
    .local v9, "ruleDeviceUdn":Ljava/lang/String;
    const-string v12, "DeviceListManager"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "refreshLongPressRuleDetails - Rule Device UDN: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "; Long Press Device UDN: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->val$udn:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4975
    invoke-virtual {v8}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->val$udn:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 4977
    const/4 v5, 0x1

    .line 4979
    :try_start_0
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v13, "longPressRuleState"

    invoke-virtual {v6}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getState()I

    move-result v14

    invoke-static {v14}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4980
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v13, "longPressRuleDeviceCnt"

    invoke-virtual {v6}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getTargetDeviceSet()Ljava/util/Set;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Set;->size()I

    move-result v14

    invoke-static {v14}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4981
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v13, "longPressRuleAction"

    invoke-virtual {v8}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getStartAction()I

    move-result v14

    invoke-static {v14}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4983
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 4984
    .local v11, "udnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v6}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getTargetDeviceSet()Ljava/util/Set;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/belkin/wemo/rules/data/RMTargetDevice;

    .line 4985
    .local v10, "targetDevice":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    invoke-virtual {v10}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->getDeviceId()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 4992
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v10    # "targetDevice":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    .end local v11    # "udnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 4993
    .local v1, "e":Lorg/json/JSONException;
    const-string v12, "DeviceListManager"

    const-string v13, "JSONException while refreshing long press rule attributes: "

    invoke-static {v12, v13, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_0

    .line 4987
    .end local v1    # "e":Lorg/json/JSONException;
    .restart local v4    # "i$":Ljava/util/Iterator;
    .restart local v11    # "udnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_2
    :try_start_1
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v13, "longPressRuleDeviceUdn"

    const-string v14, ","

    invoke-static {v14, v11}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4989
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v12}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$300(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v12, v13}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 4990
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v13, "update"

    const-string v14, ""

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->val$udn:Ljava/lang/String;

    invoke-virtual {v12, v13, v14, v15}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4991
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$400()Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v14, 0x1

    const/4 v15, 0x1

    const/16 v16, 0x1

    invoke-virtual/range {v12 .. v16}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 5000
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v6    # "longPressRule":Lcom/belkin/wemo/rules/data/RMLongPressRule;
    .end local v7    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    .end local v8    # "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .end local v9    # "ruleDeviceUdn":Ljava/lang/String;
    .end local v11    # "udnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_3
    if-nez v5, :cond_4

    .line 5001
    const-string v12, "DeviceListManager"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Resetting all Long press attributes for UDN: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->val$udn:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 5003
    :try_start_2
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v13, "longPressRuleState"

    const-string v14, "-1"

    invoke-virtual {v12, v13, v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 5004
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v13, "longPressRuleDeviceCnt"

    const-string v14, "0"

    invoke-virtual {v12, v13, v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 5005
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v13, "longPressRuleAction"

    const-string v14, "-1"

    invoke-virtual {v12, v13, v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 5006
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v13, "longPressRuleDeviceUdn"

    const-string v14, " "

    invoke-virtual {v12, v13, v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 5008
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v12}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$300(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v12, v13}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 5009
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v13, "update"

    const-string v14, ""

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->val$udn:Ljava/lang/String;

    invoke-virtual {v12, v13, v14, v15}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5010
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$400()Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;->val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v14, 0x1

    const/4 v15, 0x1

    const/16 v16, 0x1

    invoke-virtual/range {v12 .. v16}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 5016
    .end local v5    # "isLongPressRuleFoundForDevice":Z
    :cond_4
    :goto_2
    return-void

    .line 5011
    .restart local v5    # "isLongPressRuleFoundForDevice":Z
    :catch_1
    move-exception v1

    .line 5012
    .restart local v1    # "e":Lorg/json/JSONException;
    const-string v12, "DeviceListManager"

    const-string v13, "JSONException while resetting long press rule attributes: "

    invoke-static {v12, v13, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_2
.end method
