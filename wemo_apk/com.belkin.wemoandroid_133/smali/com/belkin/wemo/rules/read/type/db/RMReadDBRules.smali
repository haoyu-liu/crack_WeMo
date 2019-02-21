.class public Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules;
.super Ljava/lang/Object;
.source "RMReadDBRules.java"

# interfaces
.implements Lcom/belkin/wemo/rules/read/type/RMIReadRulesType;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules$ReadDBRulesTypeRunnable;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const-class v0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    return-void
.end method


# virtual methods
.method public parseRules(Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeErrorCallback;)V
    .locals 10
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeErrorCallback;

    .prologue
    const/4 v9, 0x2

    .line 29
    :try_start_0
    invoke-static {}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getInstance()Lcom/belkin/wemo/rules/db/RMRulesDBManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/belkin/wemo/rules/db/RMRulesDBManager;->getRules()Ljava/util/List;

    move-result-object v1

    .line 30
    .local v1, "dbRulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/model/RMTRules;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    .line 31
    .local v5, "rulesCount":I
    sget-object v6, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Fetch Rules: Row Objects (Entries) in RULES table: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    const/4 v7, 0x2

    invoke-interface {p1, v6, v7}, Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeSuccessCallback;->onRulesParsed(Ljava/util/ArrayList;I)V

    .line 51
    .end local v1    # "dbRulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/model/RMTRules;>;"
    .end local v5    # "rulesCount":I
    :cond_0
    :goto_0
    return-void

    .line 40
    .restart local v1    # "dbRulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/model/RMTRules;>;"
    .restart local v5    # "rulesCount":I
    :cond_1
    new-instance v3, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;

    invoke-direct {v3, p1, p2, v5}, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;-><init>(Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeErrorCallback;I)V

    .line 42
    .local v3, "handler":Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/rules/db/model/RMTRules;

    .line 43
    .local v0, "dbRuleEntry":Lcom/belkin/wemo/rules/db/model/RMTRules;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v6

    new-instance v7, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules$ReadDBRulesTypeRunnable;

    invoke-direct {v7, p0, v0, v3}, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules$ReadDBRulesTypeRunnable;-><init>(Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules;Lcom/belkin/wemo/rules/db/model/RMTRules;Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;)V

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V
    :try_end_0
    .catch Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 46
    .end local v0    # "dbRuleEntry":Lcom/belkin/wemo/rules/db/model/RMTRules;
    .end local v1    # "dbRulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/db/model/RMTRules;>;"
    .end local v3    # "handler":Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v5    # "rulesCount":I
    :catch_0
    move-exception v2

    .line 47
    .local v2, "e":Lcom/belkin/wemo/rules/operation/db/exception/RuleDBException;
    if-eqz p2, :cond_0

    .line 48
    new-instance v6, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;

    const-string v7, ""

    invoke-direct {v6, v9, v7}, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;-><init>(ILjava/lang/String;)V

    invoke-interface {p2, v6}, Lcom/belkin/wemo/rules/read/type/callback/RMReadRulesTypeErrorCallback;->onRulesExtractionFailed(Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;)V

    goto :goto_0
.end method
