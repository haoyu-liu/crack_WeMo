.class Lcom/belkin/wemo/rules/operation/impl/RMDBRulesLocalOperationImpl;
.super Ljava/lang/Object;
.source "RMDBRulesLocalOperationImpl.java"

# interfaces
.implements Lcom/belkin/wemo/rules/operation/RMIRulesOperation;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/belkin/wemo/rules/operation/RMIRulesOperation",
        "<",
        "Lcom/belkin/wemo/rules/data/RMDBRule;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    const-class v0, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesLocalOperationImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesLocalOperationImpl;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V
    .locals 0
    .param p1, "rulesUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesLocalOperationImpl;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .line 33
    return-void
.end method


# virtual methods
.method public fetchRules(Ljava/util/List;Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;)V
    .locals 7
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;",
            "Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;",
            "Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 41
    .local p1, "activeDevicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 42
    :cond_0
    if-eqz p3, :cond_1

    .line 43
    new-instance v3, Lcom/belkin/wemo/rules/error/RMRulesTypeError;

    const/16 v4, 0x12c

    const-string v5, "No device is online."

    const/4 v6, 0x2

    invoke-direct {v3, v4, v5, v6}, Lcom/belkin/wemo/rules/error/RMRulesTypeError;-><init>(ILjava/lang/String;I)V

    invoke-interface {p3, v3}, Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;->onSingleTypeRulesFetchError(Lcom/belkin/wemo/rules/error/RMRulesTypeError;)V

    .line 58
    :cond_1
    return-void

    .line 51
    :cond_2
    new-instance v1, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesLocalOperationImpl;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-direct {v1, p2, p3, v3, v4}, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;-><init>(Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;ILcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    .line 52
    .local v1, "handler":Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 53
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    sget-object v3, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesLocalOperationImpl;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Fetch Rules: Fetching rules (LOCAL) for device udn: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v3

    new-instance v4, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDevDBRulesLocalRunnable;

    invoke-direct {v4, v0, v1}, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDevDBRulesLocalRunnable;-><init>(Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;)V

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    goto :goto_0
.end method

.method public storeRules(Ljava/util/List;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;)V
    .locals 4
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMDBRule;
    .param p4, "successCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;
    .param p5, "errorCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;",
            "Lcom/belkin/wemo/rules/data/RMDBRule;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;",
            "Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 91
    .local p1, "devicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .local p3, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 92
    :cond_0
    if-eqz p5, :cond_1

    .line 93
    new-instance v0, Lcom/belkin/wemo/rules/error/RMRulesTypeError;

    const/16 v1, 0x12c

    const-string v2, "No device is online."

    const/4 v3, 0x2

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/wemo/rules/error/RMRulesTypeError;-><init>(ILjava/lang/String;I)V

    invoke-interface {p5, v0}, Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;->onSingleTypeRulesStoreError(Lcom/belkin/wemo/rules/error/RMRulesTypeError;)V

    .line 101
    :cond_1
    :goto_0
    return-void

    .line 99
    :cond_2
    new-instance v0, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;

    invoke-direct {v0, p5, p4, p2, p3}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;-><init>(Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;)V

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/rules/operation/handler/RMStoreDBRulesLocalHandler;->process(Ljava/util/List;)V

    goto :goto_0
.end method

.method public bridge synthetic storeRules(Ljava/util/List;Lcom/belkin/wemo/rules/data/RMRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;)V
    .locals 6
    .param p1, "x0"    # Ljava/util/List;
    .param p2, "x1"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p3, "x2"    # Ljava/util/HashMap;
    .param p4, "x3"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;
    .param p5, "x4"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;

    .prologue
    .line 26
    move-object v2, p2

    check-cast v2, Lcom/belkin/wemo/rules/data/RMDBRule;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/belkin/wemo/rules/operation/impl/RMDBRulesLocalOperationImpl;->storeRules(Ljava/util/List;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;)V

    return-void
.end method

.method public syncRules(Ljava/util/List;Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;)V
    .locals 7
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;",
            "Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 66
    .local p1, "devicesToSyncList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .local p2, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 67
    :cond_0
    if-eqz p4, :cond_1

    .line 68
    new-instance v3, Lcom/belkin/wemo/rules/error/RMRulesTypeError;

    const/16 v4, 0x12c

    const-string v5, "No device is online."

    const/4 v6, 0x2

    invoke-direct {v3, v4, v5, v6}, Lcom/belkin/wemo/rules/error/RMRulesTypeError;-><init>(ILjava/lang/String;I)V

    invoke-interface {p4, v3}, Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesTypeError;)V

    .line 84
    :cond_1
    return-void

    .line 76
    :cond_2
    new-instance v1, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v1, p4, p3, v3}, Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;-><init>(Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;I)V

    .line 79
    .local v1, "handler":Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 80
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v3

    new-instance v4, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDevDBRulesLocalRunnable;

    invoke-direct {v4, v0, p2, v1}, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDevDBRulesLocalRunnable;-><init>(Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/handler/RMSyncDBRulesLocalResponseHandler;)V

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    goto :goto_0
.end method
