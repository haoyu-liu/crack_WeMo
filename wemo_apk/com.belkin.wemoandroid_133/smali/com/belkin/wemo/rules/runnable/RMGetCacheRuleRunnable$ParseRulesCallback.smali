.class Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;
.super Ljava/lang/Object;
.source "RMGetCacheRuleRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/read/callback/RMParseRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/read/callback/RMParseRulesSuccessCallback;
.implements Lcom/belkin/wemo/rules/location/callback/RMReadLocationErrorCallback;
.implements Lcom/belkin/wemo/rules/location/callback/RMReadLocationSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ParseRulesCallback"
.end annotation


# instance fields
.field private areRulesParsed:Z

.field protected errorCallback:Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;

.field private isLocationInfoCallbackRec:Z

.field private noCallbackErrorYet:Z

.field private ruleId:I

.field protected successCallback:Lcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;ILcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;)V
    .locals 1
    .param p2, "ruleId"    # I
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    .line 60
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;

    .line 61
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;

    .line 62
    iput p2, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->ruleId:I

    .line 63
    return-void
.end method

.method private sendError(ILjava/lang/String;)V
    .locals 2
    .param p1, "errorCode"    # I
    .param p2, "errorMsg"    # Ljava/lang/String;

    .prologue
    .line 117
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;

    if-eqz v0, :cond_0

    .line 118
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v1, p1, p2}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 120
    :cond_0
    return-void
.end method

.method private sendSuccess()V
    .locals 5

    .prologue
    .line 124
    sget-object v1, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    iget v2, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->ruleId:I

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/rules/data/RMUserRules;->getRule(I)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v0

    .line 125
    .local v0, "rule":Lcom/belkin/wemo/rules/data/RMRule;
    if-nez v0, :cond_1

    .line 126
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;

    if-eqz v1, :cond_0

    .line 127
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;

    new-instance v2, Lcom/belkin/wemo/rules/error/RMRulesError;

    const/16 v3, 0x1f6

    const-string v4, "No rule was found for rule ID provided"

    invoke-direct {v2, v3, v4}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v1, v2}, Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 134
    :cond_0
    :goto_0
    return-void

    .line 130
    :cond_1
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;

    if-eqz v1, :cond_0

    .line 131
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;

    invoke-interface {v1, v0}, Lcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;->onSuccess(Lcom/belkin/wemo/rules/data/RMRule;)V

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized onLocationRead(Lcom/belkin/wemo/rules/data/RMLocationInfo;)V
    .locals 1
    .param p1, "locationInfo"    # Lcom/belkin/wemo/rules/data/RMLocationInfo;

    .prologue
    .line 94
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    if-eqz v0, :cond_0

    .line 95
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->isLocationInfoCallbackRec:Z

    .line 96
    invoke-static {}, Lcom/belkin/wemo/rules/data/RMUserLocation;->getInstance()Lcom/belkin/wemo/rules/data/RMUserLocation;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/rules/data/RMUserLocation;->setLocationInfo(Lcom/belkin/wemo/rules/data/RMLocationInfo;)V

    .line 98
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->areRulesParsed:Z

    if-eqz v0, :cond_0

    .line 99
    invoke-direct {p0}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->sendSuccess()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 102
    :cond_0
    monitor-exit p0

    return-void

    .line 94
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onLocationReadFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 5
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 106
    monitor-enter p0

    :try_start_0
    iget-boolean v2, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    if-eqz v2, :cond_0

    .line 107
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    .line 108
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorCode()I

    move-result v0

    .line 109
    .local v0, "errorCode":I
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorMessage()Ljava/lang/String;

    move-result-object v1

    .line 111
    .local v1, "message":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;->access$200(Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;)Ljava/lang/String;

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

    .line 112
    invoke-direct {p0, v0, v1}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->sendError(ILjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 114
    .end local v0    # "errorCode":I
    .end local v1    # "message":Ljava/lang/String;
    :cond_0
    monitor-exit p0

    return-void

    .line 106
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public onNoInfoLocationFound()V
    .locals 2

    .prologue
    .line 139
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    if-eqz v0, :cond_0

    .line 140
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Fetch Rules: No Location Info found in LOCATIONINFO table"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->isLocationInfoCallbackRec:Z

    .line 143
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->areRulesParsed:Z

    if-eqz v0, :cond_0

    .line 144
    invoke-direct {p0}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->sendSuccess()V

    .line 147
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
    .line 67
    .local p1, "rulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/data/RMRule;>;"
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    if-eqz v0, :cond_0

    .line 68
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->areRulesParsed:Z

    .line 69
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;->access$000(Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;)Ljava/lang/String;

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

    .line 72
    sget-object v0, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/rules/data/RMUserRules;->setRulesList(Ljava/util/List;)V

    .line 74
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->isLocationInfoCallbackRec:Z

    if-eqz v0, :cond_0

    .line 75
    invoke-direct {p0}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->sendSuccess()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    :cond_0
    monitor-exit p0

    return-void

    .line 67
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onRulesParsingFailed(Lcom/belkin/wemo/error/WeMoError;)V
    .locals 5
    .param p1, "error"    # Lcom/belkin/wemo/error/WeMoError;

    .prologue
    .line 82
    monitor-enter p0

    :try_start_0
    iget-boolean v2, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    if-eqz v2, :cond_0

    .line 83
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    .line 84
    invoke-virtual {p1}, Lcom/belkin/wemo/error/WeMoError;->getErrorCode()I

    move-result v0

    .line 85
    .local v0, "errorCode":I
    invoke-virtual {p1}, Lcom/belkin/wemo/error/WeMoError;->getErrorMessage()Ljava/lang/String;

    move-result-object v1

    .line 87
    .local v1, "message":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;->access$100(Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable;)Ljava/lang/String;

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

    .line 88
    invoke-direct {p0, v0, v1}, Lcom/belkin/wemo/rules/runnable/RMGetCacheRuleRunnable$ParseRulesCallback;->sendError(ILjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    .end local v0    # "errorCode":I
    .end local v1    # "message":Ljava/lang/String;
    :cond_0
    monitor-exit p0

    return-void

    .line 82
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method
