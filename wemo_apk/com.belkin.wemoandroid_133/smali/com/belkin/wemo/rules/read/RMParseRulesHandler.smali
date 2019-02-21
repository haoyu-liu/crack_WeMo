.class public Lcom/belkin/wemo/rules/read/RMParseRulesHandler;
.super Ljava/lang/Object;
.source "RMParseRulesHandler.java"

# interfaces
.implements Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeSuccessCallback;
.implements Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeErrorCallback;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private allCallbacksPassedYet:Z

.field private callbackCount:I

.field private errorCallback:Lcom/belkin/wemo/rules/read/callback/RMParseRulesErrorCallback;

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

.field private rulesTypeCount:I

.field private successCallback:Lcom/belkin/wemo/rules/read/callback/RMParseRulesSuccessCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-class v0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/rules/read/callback/RMParseRulesSuccessCallback;Lcom/belkin/wemo/rules/read/callback/RMParseRulesErrorCallback;I)V
    .locals 1
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/read/callback/RMParseRulesSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/read/callback/RMParseRulesErrorCallback;
    .param p3, "rulesTypeCount"    # I

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;->allCallbacksPassedYet:Z

    .line 27
    iput-object p1, p0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;->successCallback:Lcom/belkin/wemo/rules/read/callback/RMParseRulesSuccessCallback;

    .line 28
    iput-object p2, p0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;->errorCallback:Lcom/belkin/wemo/rules/read/callback/RMParseRulesErrorCallback;

    .line 29
    iput p3, p0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;->rulesTypeCount:I

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;->rulesList:Ljava/util/ArrayList;

    .line 31
    return-void
.end method


# virtual methods
.method public declared-synchronized onRulesExtractionFailed(Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;)V
    .locals 3
    .param p1, "error"    # Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;

    .prologue
    .line 35
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;->allCallbacksPassedYet:Z

    .line 36
    sget-object v0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fetch Rules: Rules parsing failed for type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;->getRulesType()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    iget-object v0, p0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;->errorCallback:Lcom/belkin/wemo/rules/read/callback/RMParseRulesErrorCallback;

    if-eqz v0, :cond_0

    .line 38
    iget-object v0, p0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;->errorCallback:Lcom/belkin/wemo/rules/read/callback/RMParseRulesErrorCallback;

    invoke-interface {v0, p1}, Lcom/belkin/wemo/rules/read/callback/RMParseRulesErrorCallback;->onRulesParsingFailed(Lcom/belkin/wemo/error/WeMoError;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    :cond_0
    monitor-exit p0

    return-void

    .line 35
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onRulesParsed(Ljava/util/ArrayList;I)V
    .locals 3
    .param p2, "rulesType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<+",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p1, "rulesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<+Lcom/belkin/wemo/rules/data/RMRule;>;"
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;->allCallbacksPassedYet:Z

    if-eqz v0, :cond_0

    .line 46
    iget v0, p0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;->callbackCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;->callbackCount:I

    .line 47
    sget-object v0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fetch Rules: Rules parsed for type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Rules count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    iget-object v0, p0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;->rulesList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 51
    iget v0, p0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;->callbackCount:I

    iget v1, p0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;->rulesTypeCount:I

    if-ne v0, v1, :cond_0

    .line 52
    iget-object v0, p0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;->successCallback:Lcom/belkin/wemo/rules/read/callback/RMParseRulesSuccessCallback;

    if-eqz v0, :cond_0

    .line 53
    iget-object v0, p0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;->successCallback:Lcom/belkin/wemo/rules/read/callback/RMParseRulesSuccessCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/read/RMParseRulesHandler;->rulesList:Ljava/util/ArrayList;

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/read/callback/RMParseRulesSuccessCallback;->onRulesParsed(Ljava/util/List;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    :cond_0
    monitor-exit p0

    return-void

    .line 45
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
