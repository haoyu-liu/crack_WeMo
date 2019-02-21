.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$21;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;


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
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 4928
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$21;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$21;->val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$21;->val$udn:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSuccess(Lcom/belkin/wemo/rules/data/RMRule;)V
    .locals 12
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;

    .prologue
    .line 4932
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v7

    const/4 v8, 0x2

    if-ne v7, v8, :cond_1

    move-object v7, p1

    .line 4933
    check-cast v7, Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v7}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v7

    sget-object v8, Lcom/belkin/wemo/rules/data/RMDBRuleType;->LONG_PRESS:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    if-ne v7, v8, :cond_1

    move-object v3, p1

    .line 4934
    check-cast v3, Lcom/belkin/wemo/rules/data/RMLongPressRule;

    .line 4935
    .local v3, "longPressRule":Lcom/belkin/wemo/rules/data/RMLongPressRule;
    invoke-virtual {v3}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 4938
    .local v4, "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    :try_start_0
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$21;->val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v8, "longPressRuleState"

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getState()I

    move-result v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4939
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$21;->val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v8, "longPressRuleDeviceCnt"

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getTargetDeviceSet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->size()I

    move-result v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4940
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$21;->val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v8, "longPressRuleAction"

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getStartAction()I

    move-result v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4942
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 4943
    .local v6, "udnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v3}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getTargetDeviceSet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/belkin/wemo/rules/data/RMTargetDevice;

    .line 4944
    .local v5, "targetDevice":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    invoke-virtual {v5}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->getDeviceId()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 4951
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v5    # "targetDevice":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    .end local v6    # "udnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_0
    move-exception v0

    .line 4952
    .local v0, "e":Lorg/json/JSONException;
    const-string v7, "DeviceListManager"

    const-string v8, "JSONException while refreshing long press rule attributes: "

    invoke-static {v7, v8, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 4946
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v6    # "udnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_0
    :try_start_1
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$21;->val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v8, "longPressRuleDeviceUdn"

    const-string v9, ","

    invoke-static {v9, v6}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4948
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$21;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$300(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$21;->val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v7, v8}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 4949
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$21;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v8, "update"

    const-string v9, ""

    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$21;->val$udn:Ljava/lang/String;

    invoke-virtual {v7, v8, v9, v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4950
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$400()Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$21;->val$deviceInformation:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v9, 0x1

    const/4 v10, 0x1

    const/4 v11, 0x1

    invoke-virtual {v7, v8, v9, v10, v11}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 4958
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "longPressRule":Lcom/belkin/wemo/rules/data/RMLongPressRule;
    .end local v4    # "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .end local v6    # "udnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    return-void
.end method
