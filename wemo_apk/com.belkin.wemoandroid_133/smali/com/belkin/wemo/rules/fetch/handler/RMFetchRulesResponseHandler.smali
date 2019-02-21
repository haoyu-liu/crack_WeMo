.class public Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;
.super Ljava/lang/Object;
.source "RMFetchRulesResponseHandler.java"

# interfaces
.implements Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;
.implements Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private callbackCount:I

.field private errorCallback:Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;

.field private noRuleTypeFailed:Z

.field private rulesFetchedBroadcaster:Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;

.field private rulesTypeCount:I

.field private successCallback:Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-class v0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(ILcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;)V
    .locals 1
    .param p1, "ruleTypesCount"    # I
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;
    .param p4, "rulesFetchedBroadcaster"    # Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p2, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->successCallback:Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;

    .line 32
    iput-object p3, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;

    .line 33
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->noRuleTypeFailed:Z

    .line 34
    iput p1, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->rulesTypeCount:I

    .line 35
    iput-object p4, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->rulesFetchedBroadcaster:Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;

    .line 36
    return-void
.end method


# virtual methods
.method public declared-synchronized onSingleTypeRulesFetchError(Lcom/belkin/wemo/rules/error/RMRulesTypeError;)V
    .locals 5
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesTypeError;

    .prologue
    .line 47
    monitor-enter p0

    const/4 v2, 0x0

    :try_start_0
    iput-boolean v2, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->noRuleTypeFailed:Z

    .line 49
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesTypeError;->getErrorCode()I

    move-result v0

    .line 50
    .local v0, "errCode":I
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesTypeError;->getErrorMessage()Ljava/lang/String;

    move-result-object v1

    .line 52
    .local v1, "errMsg":Ljava/lang/String;
    sget-object v2, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Fetch Rules: Fetch Rules for TYPE: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesTypeError;->getRulesType()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", FAILED. errCode: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", errMsg: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    iget-object v2, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;

    if-eqz v2, :cond_0

    .line 54
    iget-object v2, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;

    new-instance v3, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v3, v0, v1}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v2, v3}, Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;->onRulesFetchFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    :cond_0
    monitor-exit p0

    return-void

    .line 47
    .end local v0    # "errCode":I
    .end local v1    # "errMsg":Ljava/lang/String;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public varargs declared-synchronized onSingleTypeRulesFetched(ILjava/util/ArrayList;[Ljava/lang/String;)V
    .locals 3
    .param p1, "rulesType"    # I
    .param p3, "extras"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 61
    .local p2, "outOfSyncDeviceUDNList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->callbackCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->callbackCount:I

    .line 62
    sget-object v0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fetch Rules: Fetch Rules for TYPE: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", SUCCESS. Rule types callback received: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->callbackCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Total rules types count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->rulesTypeCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 65
    iget-object v0, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->rulesFetchedBroadcaster:Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;

    invoke-interface {v0}, Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;->sendRulesUpdatedBroadcast()V

    .line 68
    :cond_0
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->noRuleTypeFailed:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->callbackCount:I

    iget v1, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->rulesTypeCount:I

    if-lt v0, v1, :cond_1

    .line 69
    iget-object v0, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->successCallback:Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;

    if-eqz v0, :cond_1

    .line 70
    iget-object v0, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->successCallback:Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;

    invoke-interface {v0}, Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;->onRulesFetched()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    :cond_1
    monitor-exit p0

    return-void

    .line 61
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setRuleTypesCount(I)V
    .locals 3
    .param p1, "count"    # I

    .prologue
    .line 39
    monitor-enter p0

    :try_start_0
    iput p1, p0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->rulesTypeCount:I

    .line 40
    sget-object v0, Lcom/belkin/wemo/rules/fetch/handler/RMFetchRulesResponseHandler;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fetch Rules: Rules Type count set to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    monitor-exit p0

    return-void

    .line 39
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
