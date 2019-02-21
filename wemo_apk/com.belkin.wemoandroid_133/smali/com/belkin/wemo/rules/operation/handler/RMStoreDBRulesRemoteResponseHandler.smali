.class public Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;
.super Ljava/lang/Object;
.source "RMStoreDBRulesRemoteResponseHandler.java"

# interfaces
.implements Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;
.implements Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private anyRuleDeviceCallFailed:Z

.field private callbacksReceivedCount:I

.field private errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;

.field private fwVersionsCount:I

.field private nonRuleDeviceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation
.end field

.field private rule:Lcom/belkin/wemo/rules/data/RMDBRule;

.field private ruleDeviceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation
.end field

.field private ruleDeviceSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;",
            ">;"
        }
    .end annotation
.end field

.field private successCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const-class v0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;Ljava/util/Set;Lcom/belkin/wemo/rules/data/RMDBRule;)V
    .locals 1
    .param p1, "errorCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;
    .param p4, "rule"    # Lcom/belkin/wemo/rules/data/RMDBRule;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;",
            "Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;",
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;",
            ">;",
            "Lcom/belkin/wemo/rules/data/RMDBRule;",
            ")V"
        }
    .end annotation

    .prologue
    .line 38
    .local p3, "ruleDeviceSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;

    .line 40
    iput-object p2, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->successCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;

    .line 41
    iput-object p3, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->ruleDeviceSet:Ljava/util/Set;

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->ruleDeviceList:Ljava/util/List;

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->nonRuleDeviceList:Ljava/util/List;

    .line 44
    iput-object p4, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    .line 45
    return-void
.end method

.method private containsRuleDevice(Ljava/util/List;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 72
    .local p1, "deviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 73
    .local v0, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    .line 74
    .local v4, "udn":Ljava/lang/String;
    iget-object v5, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->ruleDeviceSet:Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 75
    .local v3, "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {v3}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 76
    sget-object v5, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Store Rules (Remote): Rule device contained in Failed Cloud Call. UDN: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    const/4 v5, 0x1

    .line 81
    .end local v0    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .end local v4    # "udn":Ljava/lang/String;
    :goto_0
    return v5

    :cond_2
    const/4 v5, 0x0

    goto :goto_0
.end method

.method private extractRuleAndNonRuleDeviceList(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 135
    .local p1, "deviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 136
    .local v0, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->isRuleDevice(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 137
    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->ruleDeviceList:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 139
    :cond_0
    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->nonRuleDeviceList:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 142
    .end local v0    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->ruleDeviceSet:Ljava/util/Set;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->nonRuleDeviceList:Ljava/util/List;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v2}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 143
    sget-object v2, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "STORE RULES: Online Rule Devices Count: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->ruleDeviceSet:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; NON Rule devices count: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->nonRuleDeviceList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; Total Rule Devices Count: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    :cond_2
    return-void
.end method

.method private isRuleDevice(Ljava/lang/String;)Z
    .locals 6
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 148
    const/4 v1, 0x0

    .line 149
    .local v1, "isRuleDev":Z
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 150
    .local v2, "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {v2}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 151
    const/4 v1, 0x1

    goto :goto_0

    .line 154
    .end local v2    # "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    :cond_1
    sget-object v3, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Store Rules - UDN: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; Is RULE DEVICE: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    return v1
.end method

.method private onAllDeviceCallbacksReceived()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    .line 57
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->anyRuleDeviceCallFailed:Z

    if-eqz v0, :cond_1

    .line 58
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;

    if-eqz v0, :cond_0

    .line 59
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesTypeError;

    const/4 v2, -0x1

    const-string v3, "Error while processing Rules!"

    invoke-direct {v1, v2, v3, v4}, Lcom/belkin/wemo/rules/error/RMRulesTypeError;-><init>(ILjava/lang/String;I)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;->onSingleTypeRulesStoreError(Lcom/belkin/wemo/rules/error/RMRulesTypeError;)V

    .line 69
    :cond_0
    :goto_0
    return-void

    .line 64
    :cond_1
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->successCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;

    if-eqz v0, :cond_0

    .line 66
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->successCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;

    const/4 v1, 0x0

    invoke-interface {v0, v4, v1}, Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;->onSingleTypeStoreSuccess(ILjava/util/List;)V

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized incrementFWTypeCount()V
    .locals 1

    .prologue
    .line 52
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->fwVersionsCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->fwVersionsCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    monitor-exit p0

    return-void

    .line 52
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onError(Lcom/belkin/wemo/rules/error/RMRulesError;Ljava/util/List;I)V
    .locals 3
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;
    .param p3, "fwVersionSupportCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/error/RMRulesError;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 87
    .local p2, "deviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->callbacksReceivedCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->callbacksReceivedCount:I

    .line 88
    sget-object v0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Store Rules (Remote): sync ERROR for devices with version support Code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    invoke-direct {p0, p2}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->containsRuleDevice(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 91
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->anyRuleDeviceCallFailed:Z

    .line 94
    :cond_0
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->callbacksReceivedCount:I

    iget v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->fwVersionsCount:I

    if-lt v0, v1, :cond_1

    .line 95
    invoke-direct {p0}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->onAllDeviceCallbacksReceived()V

    .line 98
    :cond_1
    return-void
.end method

.method public onSuccess(Ljava/util/List;I)V
    .locals 3
    .param p2, "fwVersionSupportCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 103
    .local p1, "devicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->extractRuleAndNonRuleDeviceList(Ljava/util/List;)V

    .line 104
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    iget-boolean v0, v0, Lcom/belkin/wemo/rules/data/RMDBRule;->isDelete:Z

    if-nez v0, :cond_2

    .line 105
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->ruleDeviceList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 106
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->callbacksReceivedCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->callbacksReceivedCount:I

    .line 107
    sget-object v0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Store Rules (Remote): sync SUCESS for devices with version support Code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->callbacksReceivedCount:I

    iget v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->fwVersionsCount:I

    if-lt v0, v1, :cond_0

    .line 110
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->successCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;

    if-eqz v0, :cond_0

    .line 111
    invoke-direct {p0}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->onAllDeviceCallbacksReceived()V

    .line 132
    :cond_0
    :goto_0
    return-void

    .line 117
    :cond_1
    sget-object v0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->TAG:Ljava/lang/String;

    const-string v1, "NO Rule Device is ONLINE. Thus rule cannot be saved."

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;

    if-eqz v0, :cond_0

    .line 119
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;

    const/4 v1, 0x2

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, v1, v2}, Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;->onSingleTypeStoreFailed(ILjava/util/List;)V

    goto :goto_0

    .line 123
    :cond_2
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->callbacksReceivedCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->callbacksReceivedCount:I

    .line 124
    sget-object v0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Store Rules (Remote): sync SUCESS for devices with version support Code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->callbacksReceivedCount:I

    iget v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->fwVersionsCount:I

    if-lt v0, v1, :cond_0

    .line 127
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->successCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;

    if-eqz v0, :cond_0

    .line 128
    invoke-direct {p0}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesRemoteResponseHandler;->onAllDeviceCallbacksReceived()V

    goto :goto_0
.end method
