.class public Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;
.super Ljava/lang/Object;
.source "RMReadDBRulesHandler.java"

# interfaces
.implements Lcom/belkin/wemo/rules/read/type/callback/RMExtractRuleSuccessCallback;
.implements Lcom/belkin/wemo/rules/read/type/callback/RMExtractRulesErrorCallback;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private allCallbacksPassedYet:Z

.field private callbackCount:I

.field private errorCallback:Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeErrorCallback;

.field private rulesCount:I

.field private rulesList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            ">;"
        }
    .end annotation
.end field

.field private successCallback:Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeSuccessCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-class v0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeErrorCallback;I)V
    .locals 1
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeErrorCallback;
    .param p3, "rulesCount"    # I

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->allCallbacksPassedYet:Z

    .line 28
    iput-object p1, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->successCallback:Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeSuccessCallback;

    .line 29
    iput-object p2, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->errorCallback:Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeErrorCallback;

    .line 30
    iput p3, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->rulesCount:I

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->rulesList:Ljava/util/ArrayList;

    .line 32
    return-void
.end method

.method private notifyListenerIfAllRulesParsed()V
    .locals 3

    .prologue
    .line 57
    iget v0, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->callbackCount:I

    iget v1, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->rulesCount:I

    if-ne v0, v1, :cond_0

    .line 58
    iget-object v0, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->successCallback:Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeSuccessCallback;

    if-eqz v0, :cond_0

    .line 59
    iget-object v0, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->successCallback:Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeSuccessCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->rulesList:Ljava/util/ArrayList;

    const/4 v2, 0x2

    invoke-interface {v0, v1, v2}, Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeSuccessCallback;->onRulesParsed(Ljava/util/ArrayList;I)V

    .line 62
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized onInvalidRuleFound(Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;)V
    .locals 3
    .param p1, "error"    # Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;

    .prologue
    .line 66
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->allCallbacksPassedYet:Z

    if-eqz v0, :cond_0

    .line 67
    iget v0, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->callbackCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->callbackCount:I

    .line 70
    sget-object v0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onInvalidRuleFound: error message: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;->getErrorMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    invoke-direct {p0}, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->notifyListenerIfAllRulesParsed()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    :cond_0
    monitor-exit p0

    return-void

    .line 66
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onRuleParsed(Lcom/belkin/wemo/rules/data/RMRule;)V
    .locals 3
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;

    .prologue
    .line 47
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->allCallbacksPassedYet:Z

    if-eqz v0, :cond_0

    .line 48
    iget v0, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->callbackCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->callbackCount:I

    .line 49
    sget-object v0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fetch Rules: Rule read successfully from DB for rule: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/RMRule;->getDisplayName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    iget-object v0, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->rulesList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    invoke-direct {p0}, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->notifyListenerIfAllRulesParsed()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    :cond_0
    monitor-exit p0

    return-void

    .line 47
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onRulesParsingFailed(Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;)V
    .locals 2
    .param p1, "error"    # Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;

    .prologue
    .line 36
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->allCallbacksPassedYet:Z

    if-eqz v0, :cond_0

    .line 37
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->allCallbacksPassedYet:Z

    .line 38
    sget-object v0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->TAG:Ljava/lang/String;

    const-string v1, "Fetch Rules: rule could NOT be read successfully from the DB."

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    iget-object v0, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->errorCallback:Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeErrorCallback;

    if-eqz v0, :cond_0

    .line 40
    iget-object v0, p0, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->errorCallback:Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeErrorCallback;

    invoke-interface {v0, p1}, Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeErrorCallback;->onRulesExtractionFailed(Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    :cond_0
    monitor-exit p0

    return-void

    .line 36
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
