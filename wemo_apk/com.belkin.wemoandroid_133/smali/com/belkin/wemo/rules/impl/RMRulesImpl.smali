.class public Lcom/belkin/wemo/rules/impl/RMRulesImpl;
.super Ljava/lang/Object;
.source "RMRulesImpl.java"

# interfaces
.implements Lcom/belkin/wemo/rules/RMIRules;


# static fields
.field public static final RULES_FLOW_FETCH:Ljava/lang/String; = "Fetch Rules"

.field public static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    const-class v0, Lcom/belkin/wemo/rules/impl/RMRulesImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/impl/RMRulesImpl;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    return-void
.end method


# virtual methods
.method public deleteRule(ILcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;)V
    .locals 3
    .param p1, "ruleId"    # I
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;

    .prologue
    .line 67
    sget-object v0, Lcom/belkin/wemo/rules/impl/RMRulesImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DELETE RULE REQUEST for RULE ID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v2

    invoke-virtual {v2}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v2

    invoke-interface {v2}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v2

    invoke-interface {v2}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getOnlineDeviceInformationList()Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, p1, p2, p3, v2}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;-><init>(ILcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 69
    return-void
.end method

.method public deleteRulesFromDevice(Ljava/lang/String;Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;)V
    .locals 3
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;

    .prologue
    .line 115
    sget-object v0, Lcom/belkin/wemo/rules/impl/RMRulesImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DELETE ALL RULES REQUEST FOR UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v2

    invoke-virtual {v2}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v2

    invoke-interface {v2}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v2

    invoke-interface {v2}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getOnlineDeviceInformationList()Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, p1, p2, p3, v2}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;-><init>(Ljava/lang/String;Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 117
    return-void
.end method

.method public disableRule(ILcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;)V
    .locals 3
    .param p1, "ruleId"    # I
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    .prologue
    .line 100
    sget-object v0, Lcom/belkin/wemo/rules/impl/RMRulesImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DISABLE RULE REQUEST for RULE ID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v2

    invoke-virtual {v2}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v2

    invoke-interface {v2}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v2

    invoke-interface {v2}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getOnlineDeviceInformationList()Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, p1, p2, p3, v2}, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;-><init>(ILcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 102
    return-void
.end method

.method public editRule(Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;)V
    .locals 3
    .param p1, "modifiedRule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;

    .prologue
    .line 51
    sget-object v0, Lcom/belkin/wemo/rules/impl/RMRulesImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "EDIT RULE REQUEST for RULE OBJ: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMRule;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;

    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v2

    invoke-virtual {v2}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v2

    invoke-interface {v2}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v2

    invoke-interface {v2}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getOnlineDeviceInformationList()Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, p1, p2, p3, v2}, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;-><init>(Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 53
    return-void
.end method

.method public enableRule(ILcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;)V
    .locals 3
    .param p1, "ruleId"    # I
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    .prologue
    .line 92
    sget-object v0, Lcom/belkin/wemo/rules/impl/RMRulesImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ENABLE RULE REQUEST for RULE ID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v2

    invoke-virtual {v2}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v2

    invoke-interface {v2}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v2

    invoke-interface {v2}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getOnlineDeviceInformationList()Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, p1, p2, p3, v2}, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;-><init>(ILcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 94
    return-void
.end method

.method public fetchRules(Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;)V
    .locals 3
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    .prologue
    .line 44
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;

    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v2

    invoke-virtual {v2}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v2

    invoke-interface {v2}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v2

    invoke-interface {v2}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getOnlineDeviceInformationList()Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, p1, p2, v2}, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;-><init>(Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 45
    return-void
.end method

.method public getRule(ILcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;)V
    .locals 4
    .param p1, "ruleId"    # I
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;

    .prologue
    .line 76
    sget-object v1, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    invoke-virtual {v1, p1}, Lcom/belkin/wemo/rules/data/RMUserRules;->getRule(I)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v0

    .line 77
    .local v0, "rule":Lcom/belkin/wemo/rules/data/RMRule;
    if-nez v0, :cond_1

    .line 78
    if-eqz p3, :cond_0

    .line 79
    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    const/16 v2, 0x1f6

    const-string v3, "No rule was found for rule ID provided"

    invoke-direct {v1, v2, v3}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {p3, v1}, Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 86
    :cond_0
    :goto_0
    return-void

    .line 82
    :cond_1
    if-eqz p2, :cond_0

    .line 83
    invoke-interface {p2, v0}, Lcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;->onSuccess(Lcom/belkin/wemo/rules/data/RMRule;)V

    goto :goto_0
.end method

.method public getRuleFromCache(ILcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;)V
    .locals 2
    .param p1, "ruleId"    # I
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;

    .prologue
    .line 108
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;

    invoke-direct {v1, p1, p2, p3}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;-><init>(ILcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 109
    return-void
.end method

.method public getRulesListFromCache(Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;)V
    .locals 2
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    .prologue
    .line 123
    sget-object v0, Lcom/belkin/wemo/rules/impl/RMRulesImpl;->TAG:Ljava/lang/String;

    const-string v1, "GET RULES LIST FROM RULES DB REQUESTED."

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;

    invoke-direct {v1, p1, p2}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;-><init>(Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 125
    return-void
.end method

.method public saveRule(Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;)V
    .locals 3
    .param p1, "newRule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

    .prologue
    .line 59
    sget-object v0, Lcom/belkin/wemo/rules/impl/RMRulesImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SAVE RULE REQUEST for RULE OBJ: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMRule;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v2

    invoke-virtual {v2}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v2

    invoke-interface {v2}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v2

    invoke-interface {v2}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getOnlineDeviceInformationList()Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, p1, p2, p3, v2}, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;-><init>(Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 61
    return-void
.end method
