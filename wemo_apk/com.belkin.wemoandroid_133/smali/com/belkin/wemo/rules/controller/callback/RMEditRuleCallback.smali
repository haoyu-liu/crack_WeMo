.class public Lcom/belkin/wemo/rules/controller/callback/RMEditRuleCallback;
.super Lcom/belkin/wemo/rules/controller/callback/RMAbstractRulesCallback;
.source "RMEditRuleCallback.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;
.implements Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/CallbackContext;Lcom/belkin/wemo/rules/data/RMRule;)V
    .locals 0
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/rules/controller/callback/RMAbstractRulesCallback;-><init>(Lorg/apache/cordova/CallbackContext;Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 30
    return-void
.end method


# virtual methods
.method public onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 0
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 34
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/rules/controller/callback/RMEditRuleCallback;->sendError(Lcom/belkin/wemo/error/WeMoError;)V

    .line 35
    return-void
.end method

.method public onSuccess(Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/data/RMRule;)V
    .locals 20
    .param p1, "newRule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p2, "oldRule"    # Lcom/belkin/wemo/rules/data/RMRule;

    .prologue
    .line 39
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/belkin/wemo/rules/controller/callback/RMEditRuleCallback;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Store Rules: Existing rule edited successfully. Rule: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/rules/data/RMRule;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    move-object/from16 v7, p1

    .line 45
    check-cast v7, Lcom/belkin/wemo/rules/data/RMDBRule;

    .line 46
    .local v7, "dbRule":Lcom/belkin/wemo/rules/data/RMDBRule;
    invoke-virtual {v7}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v1

    sget-object v2, Lcom/belkin/wemo/rules/data/RMDBRuleType;->LONG_PRESS:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    if-ne v1, v2, :cond_0

    .line 47
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/belkin/wemo/rules/controller/callback/RMEditRuleCallback;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Store Rules: Edit Success: Attempting to refresh long press rule device details of NEW rule devices. Count: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v7}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    invoke-virtual {v7}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 49
    .local v8, "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    sget-object v1, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v1}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRuleId()I

    move-result v2

    invoke-virtual {v8}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->refreshLongPressRuleDetails(ILjava/lang/String;)V

    .line 52
    new-instance v17, Lcom/belkin/wemo/cache/utils/SharePreferences;

    sget-object v1, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v1}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v1

    move-object/from16 v0, v17

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 53
    .local v17, "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    new-instance v19, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v1, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v1}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v1

    move-object/from16 v0, v19

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestPushMobileNotifications;

    invoke-virtual/range {v17 .. v17}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v4

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v4

    invoke-interface {v4}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v4

    invoke-interface {v4}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getRulesDBVerion()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v6}, Lcom/belkin/wemo/cache/cloud/CloudRequestPushMobileNotifications;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeByteStreamRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto :goto_0

    .line 66
    .end local v7    # "dbRule":Lcom/belkin/wemo/rules/data/RMDBRule;
    .end local v8    # "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .end local v9    # "i$":Ljava/util/Iterator;
    .end local v17    # "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_5

    move-object/from16 v14, p2

    .line 67
    check-cast v14, Lcom/belkin/wemo/rules/data/RMDBRule;

    .line 68
    .local v14, "oldDbRule":Lcom/belkin/wemo/rules/data/RMDBRule;
    invoke-virtual {v14}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v1

    sget-object v2, Lcom/belkin/wemo/rules/data/RMDBRuleType;->LONG_PRESS:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    if-ne v1, v2, :cond_5

    .line 69
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/belkin/wemo/rules/controller/callback/RMEditRuleCallback;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Store Rules: Edit Success: Attempting to refresh long press rule device details of OLD rule devices. Count: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v14}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    new-instance v16, Ljava/util/HashSet;

    invoke-direct/range {v16 .. v16}, Ljava/util/HashSet;-><init>()V

    .line 71
    .local v16, "oldTargetDeviceUdnForRefreshSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual {v14}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_1
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 72
    .restart local v8    # "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {v8}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v15

    .line 73
    .local v15, "oldDeviceUnd":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/belkin/wemo/rules/controller/callback/RMEditRuleCallback;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Store Rules: Edit Success: Long Press Rule: OLD trigger device UDN: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    move-object/from16 v7, p1

    .line 75
    check-cast v7, Lcom/belkin/wemo/rules/data/RMDBRule;

    .line 76
    .restart local v7    # "dbRule":Lcom/belkin/wemo/rules/data/RMDBRule;
    invoke-virtual {v7}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v1

    sget-object v2, Lcom/belkin/wemo/rules/data/RMDBRuleType;->LONG_PRESS:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    if-ne v1, v2, :cond_1

    .line 77
    const/4 v11, 0x0

    .line 78
    .local v11, "matchFound":Z
    invoke-virtual {v7}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 79
    .local v12, "newDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {v12}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v13

    .line 80
    .local v13, "newDeviceUdn":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/belkin/wemo/rules/controller/callback/RMEditRuleCallback;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Store Rules: Edit Success: Long Press Rule: NEW trigger device UDN: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    invoke-virtual {v13, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 82
    const/4 v11, 0x1

    .line 86
    .end local v12    # "newDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .end local v13    # "newDeviceUdn":Ljava/lang/String;
    :cond_3
    if-nez v11, :cond_1

    .line 87
    move-object/from16 v0, v16

    invoke-interface {v0, v15}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 93
    .end local v7    # "dbRule":Lcom/belkin/wemo/rules/data/RMDBRule;
    .end local v8    # "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v11    # "matchFound":Z
    .end local v15    # "oldDeviceUnd":Ljava/lang/String;
    :cond_4
    invoke-interface/range {v16 .. v16}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .restart local v9    # "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 94
    .local v3, "targetDeviceUdn":Ljava/lang/String;
    sget-object v1, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v1}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v2

    move-object/from16 v1, p1

    check-cast v1, Lcom/belkin/wemo/rules/data/RMLongPressRule;

    invoke-virtual {v2, v3, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->refreshLongPressRuleDetails(Ljava/lang/String;Lcom/belkin/wemo/rules/data/RMLongPressRule;)V

    .line 97
    new-instance v17, Lcom/belkin/wemo/cache/utils/SharePreferences;

    sget-object v1, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v1}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v1

    move-object/from16 v0, v17

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 98
    .restart local v17    # "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    new-instance v19, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v1, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v1}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v1

    move-object/from16 v0, v19

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestPushMobileNotifications;

    invoke-virtual/range {v17 .. v17}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v4

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v4

    invoke-interface {v4}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v4

    invoke-interface {v4}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getRulesDBVerion()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v6}, Lcom/belkin/wemo/cache/cloud/CloudRequestPushMobileNotifications;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeByteStreamRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto :goto_2

    .line 107
    .end local v3    # "targetDeviceUdn":Ljava/lang/String;
    .end local v9    # "i$":Ljava/util/Iterator;
    .end local v14    # "oldDbRule":Lcom/belkin/wemo/rules/data/RMDBRule;
    .end local v16    # "oldTargetDeviceUdnForRefreshSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v17    # "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    :cond_5
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/belkin/wemo/rules/controller/callback/RMEditRuleCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_6

    .line 108
    new-instance v18, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRuleId()I

    move-result v2

    move-object/from16 v0, v18

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    .line 109
    .local v18, "showRulesResult":Lorg/apache/cordova/PluginResult;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/belkin/wemo/rules/controller/callback/RMEditRuleCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    move-object/from16 v0, v18

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 111
    .end local v18    # "showRulesResult":Lorg/apache/cordova/PluginResult;
    :cond_6
    return-void
.end method
