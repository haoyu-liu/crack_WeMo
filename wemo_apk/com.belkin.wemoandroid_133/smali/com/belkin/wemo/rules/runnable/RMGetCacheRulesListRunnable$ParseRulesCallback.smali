.class Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;
.super Ljava/lang/Object;
.source "RMGetCacheRulesListRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/read/callback/RMParseRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/read/callback/RMParseRulesSuccessCallback;
.implements Lcom/belkin/wemo/rules/location/callback/RMReadLocationErrorCallback;
.implements Lcom/belkin/wemo/rules/location/callback/RMReadLocationSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ParseRulesCallback"
.end annotation


# instance fields
.field private areRulesParsed:Z

.field protected errorCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

.field private isLocationInfoCallbackRec:Z

.field private noCallbackErrorYet:Z

.field protected successCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;)V
    .locals 1
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    .line 55
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;

    .line 56
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    .line 57
    return-void
.end method

.method private sendError(ILjava/lang/String;)V
    .locals 2
    .param p1, "errorCode"    # I
    .param p2, "errorMsg"    # Ljava/lang/String;

    .prologue
    .line 110
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    if-eqz v0, :cond_0

    .line 111
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v1, p1, p2}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 113
    :cond_0
    return-void
.end method

.method private sendSuccess()V
    .locals 2

    .prologue
    .line 117
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;

    if-eqz v0, :cond_0

    .line 118
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;

    sget-object v1, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/data/RMUserRules;->getRulesList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;->onSuccess(Ljava/util/List;)V

    .line 120
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized onLocationRead(Lcom/belkin/wemo/rules/data/RMLocationInfo;)V
    .locals 1
    .param p1, "locationInfo"    # Lcom/belkin/wemo/rules/data/RMLocationInfo;

    .prologue
    .line 87
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    if-eqz v0, :cond_0

    .line 88
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->isLocationInfoCallbackRec:Z

    .line 89
    invoke-static {}, Lcom/belkin/wemo/rules/data/RMUserLocation;->getInstance()Lcom/belkin/wemo/rules/data/RMUserLocation;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/rules/data/RMUserLocation;->setLocationInfo(Lcom/belkin/wemo/rules/data/RMLocationInfo;)V

    .line 91
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->areRulesParsed:Z

    if-eqz v0, :cond_0

    .line 92
    invoke-direct {p0}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->sendSuccess()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    :cond_0
    monitor-exit p0

    return-void

    .line 87
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onLocationReadFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 5
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 99
    monitor-enter p0

    :try_start_0
    iget-boolean v2, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    if-eqz v2, :cond_0

    .line 100
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    .line 101
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorCode()I

    move-result v0

    .line 102
    .local v0, "errorCode":I
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorMessage()Ljava/lang/String;

    move-result-object v1

    .line 104
    .local v1, "message":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;->access$200(Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Fetch Rules: Location Info parsing failed. errorCode: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; errorMesssage: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    invoke-direct {p0, v0, v1}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->sendError(ILjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    .end local v0    # "errorCode":I
    .end local v1    # "message":Ljava/lang/String;
    :cond_0
    monitor-exit p0

    return-void

    .line 99
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public onNoInfoLocationFound()V
    .locals 2

    .prologue
    .line 125
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    if-eqz v0, :cond_0

    .line 126
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Fetch Rules: No Location Info found in LOCATIONINFO table"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->isLocationInfoCallbackRec:Z

    .line 129
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->areRulesParsed:Z

    if-eqz v0, :cond_0

    .line 130
    invoke-direct {p0}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->sendSuccess()V

    .line 133
    :cond_0
    return-void
.end method

.method public declared-synchronized onRulesParsed(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 61
    .local p1, "rulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/data/RMRule;>;"
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    if-eqz v0, :cond_0

    .line 62
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->areRulesParsed:Z

    .line 63
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;->access$000(Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fetch Rules: Rules parsed successfully. Adding rules to UserRules. rules count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    sget-object v0, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/rules/data/RMUserRules;->setRulesList(Ljava/util/List;)V

    .line 67
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->isLocationInfoCallbackRec:Z

    if-eqz v0, :cond_0

    .line 68
    invoke-direct {p0}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->sendSuccess()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    :cond_0
    monitor-exit p0

    return-void

    .line 61
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onRulesParsingFailed(Lcom/belkin/wemo/error/WeMoError;)V
    .locals 5
    .param p1, "error"    # Lcom/belkin/wemo/error/WeMoError;

    .prologue
    .line 75
    monitor-enter p0

    :try_start_0
    iget-boolean v2, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    if-eqz v2, :cond_0

    .line 76
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    .line 77
    invoke-virtual {p1}, Lcom/belkin/wemo/error/WeMoError;->getErrorCode()I

    move-result v0

    .line 78
    .local v0, "errorCode":I
    invoke-virtual {p1}, Lcom/belkin/wemo/error/WeMoError;->getErrorMessage()Ljava/lang/String;

    move-result-object v1

    .line 80
    .local v1, "message":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;->access$100(Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Fetch Rules: Rules parsing FAILED. errorCode: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; errorMesssage: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    invoke-direct {p0, v0, v1}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRulesListRunnable$ParseRulesCallback;->sendError(ILjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 83
    .end local v0    # "errorCode":I
    .end local v1    # "message":Ljava/lang/String;
    :cond_0
    monitor-exit p0

    return-void

    .line 75
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method
