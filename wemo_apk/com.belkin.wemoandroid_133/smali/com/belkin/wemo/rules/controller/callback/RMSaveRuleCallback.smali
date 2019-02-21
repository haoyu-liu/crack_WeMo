.class public Lcom/belkin/wemo/rules/controller/callback/RMSaveRuleCallback;
.super Lcom/belkin/wemo/rules/controller/callback/RMAbstractRulesCallback;
.source "RMSaveRuleCallback.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;
.implements Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/CallbackContext;Lcom/belkin/wemo/rules/data/RMRule;)V
    .locals 0
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/rules/controller/callback/RMAbstractRulesCallback;-><init>(Lorg/apache/cordova/CallbackContext;Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 25
    return-void
.end method


# virtual methods
.method public onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 0
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 29
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/rules/controller/callback/RMSaveRuleCallback;->sendError(Lcom/belkin/wemo/error/WeMoError;)V

    .line 30
    return-void
.end method

.method public onSuccess(Lcom/belkin/wemo/rules/data/RMRule;)V
    .locals 12
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/belkin/wemo/rules/controller/callback/RMSaveRuleCallback;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Store Rules: New rule saved successfully. RuleId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRuleId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    move-object v6, p1

    .line 40
    check-cast v6, Lcom/belkin/wemo/rules/data/RMDBRule;

    .line 41
    .local v6, "dbRule":Lcom/belkin/wemo/rules/data/RMDBRule;
    invoke-virtual {v6}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v0

    sget-object v1, Lcom/belkin/wemo/rules/data/RMDBRuleType;->LONG_PRESS:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    if-ne v0, v1, :cond_0

    .line 42
    invoke-virtual {v6}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 43
    .local v7, "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    sget-object v0, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v0}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRuleId()I

    move-result v1

    invoke-virtual {v7}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->refreshLongPressRuleDetails(ILjava/lang/String;)V

    .line 46
    new-instance v9, Lcom/belkin/wemo/cache/utils/SharePreferences;

    sget-object v0, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v0}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v9, v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 47
    .local v9, "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    new-instance v11, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v0, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v0}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v11, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestPushMobileNotifications;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v3

    invoke-interface {v3}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v3

    invoke-interface {v3}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getRulesDBVerion()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestPushMobileNotifications;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V

    invoke-virtual {v11, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeByteStreamRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto :goto_0

    .line 55
    .end local v6    # "dbRule":Lcom/belkin/wemo/rules/data/RMDBRule;
    .end local v7    # "device":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v9    # "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/rules/controller/callback/RMSaveRuleCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_1

    .line 56
    new-instance v10, Lorg/apache/cordova/PluginResult;

    sget-object v0, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMRule;->getRuleId()I

    move-result v1

    invoke-direct {v10, v0, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;I)V

    .line 57
    .local v10, "showRulesResult":Lorg/apache/cordova/PluginResult;
    iget-object v0, p0, Lcom/belkin/wemo/rules/controller/callback/RMSaveRuleCallback;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0, v10}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 59
    .end local v10    # "showRulesResult":Lorg/apache/cordova/PluginResult;
    :cond_1
    return-void
.end method
