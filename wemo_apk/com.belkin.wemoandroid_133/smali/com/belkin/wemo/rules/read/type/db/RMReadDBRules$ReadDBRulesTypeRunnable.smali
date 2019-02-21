.class Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules$ReadDBRulesTypeRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "RMReadDBRules.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReadDBRulesTypeRunnable"
.end annotation


# instance fields
.field private handler:Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;

.field private ruleDBEntry:Lcom/belkin/wemo/rules/db/model/RMTRules;

.field final synthetic this$0:Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules;Lcom/belkin/wemo/rules/db/model/RMTRules;Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;)V
    .locals 0
    .param p2, "ruleDBEntry"    # Lcom/belkin/wemo/rules/db/model/RMTRules;
    .param p3, "handler"    # Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules$ReadDBRulesTypeRunnable;->this$0:Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules;

    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 59
    iput-object p2, p0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules$ReadDBRulesTypeRunnable;->ruleDBEntry:Lcom/belkin/wemo/rules/db/model/RMTRules;

    .line 60
    iput-object p3, p0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules$ReadDBRulesTypeRunnable;->handler:Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;

    .line 61
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/4 v8, 0x2

    .line 65
    iget-object v5, p0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules$ReadDBRulesTypeRunnable;->ruleDBEntry:Lcom/belkin/wemo/rules/db/model/RMTRules;

    invoke-virtual {v5}, Lcom/belkin/wemo/rules/db/model/RMTRules;->getType()Ljava/lang/String;

    move-result-object v4

    .line 66
    .local v4, "type":Ljava/lang/String;
    iget-object v5, p0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules$ReadDBRulesTypeRunnable;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Fetch Rules: Reading rule devices for type: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    :try_start_0
    invoke-static {v4}, Lcom/belkin/wemo/rules/data/RMDBRuleType;->fromString(Ljava/lang/String;)Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v3

    .line 69
    .local v3, "ruleType":Lcom/belkin/wemo/rules/data/RMDBRuleType;
    sget-object v5, Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;->INSTANCE:Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;

    invoke-virtual {v5, v3}, Lcom/belkin/wemo/rules/read/type/db/RMDBRuleParserFactory;->getDBRuleParserInstance(Lcom/belkin/wemo/rules/data/RMDBRuleType;)Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;

    move-result-object v2

    .line 70
    .local v2, "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    if-eqz v2, :cond_0

    .line 71
    iget-object v5, p0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules$ReadDBRulesTypeRunnable;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Fetch Rules: DBRuleParser returned by factory: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    iget-object v5, p0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules$ReadDBRulesTypeRunnable;->ruleDBEntry:Lcom/belkin/wemo/rules/db/model/RMTRules;

    iget-object v6, p0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules$ReadDBRulesTypeRunnable;->handler:Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;

    iget-object v7, p0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules$ReadDBRulesTypeRunnable;->handler:Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;

    invoke-interface {v2, v5, v6, v7}, Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;->extractRule(Lcom/belkin/wemo/rules/db/model/RMTRules;Lcom/belkin/wemo/rules/read/type/callback/RMExtractRuleSuccessCallback;Lcom/belkin/wemo/rules/read/type/callback/RMExtractRulesErrorCallback;)V

    .line 83
    .end local v2    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    .end local v3    # "ruleType":Lcom/belkin/wemo/rules/data/RMDBRuleType;
    :goto_0
    return-void

    .line 74
    .restart local v2    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    .restart local v3    # "ruleType":Lcom/belkin/wemo/rules/data/RMDBRuleType;
    :cond_0
    iget-object v5, p0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules$ReadDBRulesTypeRunnable;->TAG:Ljava/lang/String;

    const-string v6, "Fetch Rules: DBRuleParser returned by factory: NULL: Most probably as parsing is currently supported only for LONG PRESS."

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    iget-object v5, p0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules$ReadDBRulesTypeRunnable;->handler:Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;

    new-instance v6, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;

    const/4 v7, 0x2

    invoke-direct {v6, v7, v4}, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;-><init>(ILjava/lang/String;)V

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->onInvalidRuleFound(Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 77
    .end local v2    # "parser":Lcom/belkin/wemo/rules/read/type/db/RMIDBRuleParser;
    .end local v3    # "ruleType":Lcom/belkin/wemo/rules/data/RMDBRuleType;
    :catch_0
    move-exception v0

    .line 78
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    iget-object v5, p0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules$ReadDBRulesTypeRunnable;->TAG:Ljava/lang/String;

    const-string v6, "Fetch Rules: IllegalArgumentException while converting String to DBRuleType: "

    invoke-static {v5, v6, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 79
    new-instance v1, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;

    invoke-direct {v1, v8, v4}, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;-><init>(ILjava/lang/String;)V

    .line 80
    .local v1, "error":Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;
    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;->setErrorMessage(Ljava/lang/String;)V

    .line 81
    iget-object v5, p0, Lcom/belkin/wemo/rules/read/type/db/RMReadDBRules$ReadDBRulesTypeRunnable;->handler:Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;

    invoke-virtual {v5, v1}, Lcom/belkin/wemo/rules/read/type/db/handler/RMReadDBRulesHandler;->onInvalidRuleFound(Lcom/belkin/wemo/rules/read/type/error/RMParseRuleError;)V

    goto :goto_0
.end method
