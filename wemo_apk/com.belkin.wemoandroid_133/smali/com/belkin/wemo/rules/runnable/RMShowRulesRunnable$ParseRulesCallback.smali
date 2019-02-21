.class Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;
.super Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesCallback;
.source "RMShowRulesRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/read/callback/RMParseRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/read/callback/RMParseRulesSuccessCallback;
.implements Lcom/belkin/wemo/rules/location/callback/RMReadLocationErrorCallback;
.implements Lcom/belkin/wemo/rules/location/callback/RMReadLocationSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ParseRulesCallback"
.end annotation


# instance fields
.field private areRulesParsed:Z

.field private isLocationInfoCallbackRec:Z

.field private noCallbackErrorYet:Z

.field private rulesList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;)V
    .locals 1
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;

    .line 106
    invoke-direct {p0, p1, p2, p3}, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;)V

    .line 107
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    .line 108
    return-void
.end method

.method private sendError(ILjava/lang/String;)V
    .locals 2
    .param p1, "errorCode"    # I
    .param p2, "errorMsg"    # Ljava/lang/String;

    .prologue
    .line 163
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    if-eqz v0, :cond_0

    .line 164
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v1, p1, p2}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 166
    :cond_0
    return-void
.end method

.method private sendSuccess()V
    .locals 2

    .prologue
    .line 170
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;

    if-eqz v0, :cond_0

    .line 171
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->rulesList:Ljava/util/List;

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;->onSuccess(Ljava/util/List;)V

    .line 173
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized onLocationRead(Lcom/belkin/wemo/rules/data/RMLocationInfo;)V
    .locals 1
    .param p1, "locationInfo"    # Lcom/belkin/wemo/rules/data/RMLocationInfo;

    .prologue
    .line 140
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    if-eqz v0, :cond_0

    .line 141
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->isLocationInfoCallbackRec:Z

    .line 142
    invoke-static {}, Lcom/belkin/wemo/rules/data/RMUserLocation;->getInstance()Lcom/belkin/wemo/rules/data/RMUserLocation;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/rules/data/RMUserLocation;->setLocationInfo(Lcom/belkin/wemo/rules/data/RMLocationInfo;)V

    .line 144
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->areRulesParsed:Z

    if-eqz v0, :cond_0

    .line 145
    invoke-direct {p0}, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->sendSuccess()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 148
    :cond_0
    monitor-exit p0

    return-void

    .line 140
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onLocationReadFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 5
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 152
    monitor-enter p0

    :try_start_0
    iget-boolean v2, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    if-eqz v2, :cond_0

    .line 153
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    .line 154
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorCode()I

    move-result v0

    .line 155
    .local v0, "errorCode":I
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorMessage()Ljava/lang/String;

    move-result-object v1

    .line 157
    .local v1, "message":Ljava/lang/String;
    invoke-static {}, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;->access$000()Ljava/lang/String;

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

    .line 158
    invoke-direct {p0, v0, v1}, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->sendError(ILjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 160
    .end local v0    # "errorCode":I
    .end local v1    # "message":Ljava/lang/String;
    :cond_0
    monitor-exit p0

    return-void

    .line 152
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized onNoInfoLocationFound()V
    .locals 2

    .prologue
    .line 178
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    if-eqz v0, :cond_0

    .line 179
    invoke-static {}, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Fetch Rules: No Location Info found in LOCATIONINFO table"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->isLocationInfoCallbackRec:Z

    .line 182
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->areRulesParsed:Z

    if-eqz v0, :cond_0

    .line 183
    invoke-direct {p0}, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->sendSuccess()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 186
    :cond_0
    monitor-exit p0

    return-void

    .line 178
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
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
    .line 112
    .local p1, "rulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/data/RMRule;>;"
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    if-eqz v0, :cond_0

    .line 113
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->areRulesParsed:Z

    .line 114
    invoke-static {}, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;->access$000()Ljava/lang/String;

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

    .line 117
    sget-object v0, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/rules/data/RMUserRules;->setRulesList(Ljava/util/List;)V

    .line 118
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->rulesList:Ljava/util/List;

    .line 120
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->isLocationInfoCallbackRec:Z

    if-eqz v0, :cond_0

    .line 121
    invoke-direct {p0}, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->sendSuccess()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 124
    :cond_0
    monitor-exit p0

    return-void

    .line 112
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onRulesParsingFailed(Lcom/belkin/wemo/error/WeMoError;)V
    .locals 5
    .param p1, "error"    # Lcom/belkin/wemo/error/WeMoError;

    .prologue
    .line 128
    monitor-enter p0

    :try_start_0
    iget-boolean v2, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    if-eqz v2, :cond_0

    .line 129
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->noCallbackErrorYet:Z

    .line 130
    invoke-virtual {p1}, Lcom/belkin/wemo/error/WeMoError;->getErrorCode()I

    move-result v0

    .line 131
    .local v0, "errorCode":I
    invoke-virtual {p1}, Lcom/belkin/wemo/error/WeMoError;->getErrorMessage()Ljava/lang/String;

    move-result-object v1

    .line 133
    .local v1, "message":Ljava/lang/String;
    invoke-static {}, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;->access$000()Ljava/lang/String;

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

    .line 134
    invoke-direct {p0, v0, v1}, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;->sendError(ILjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 136
    .end local v0    # "errorCode":I
    .end local v1    # "message":Ljava/lang/String;
    :cond_0
    monitor-exit p0

    return-void

    .line 128
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method
